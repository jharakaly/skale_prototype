// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

// Groups page scripts - Read more/less functionality
let groupsPageScripts = {
  mounted() {
    const overviewText = document.getElementById('overviewText');
    const readMoreBtn = document.getElementById('readMoreBtn');
    const groupHeader = document.getElementById('groupHeader');
  
    if (overviewText && readMoreBtn && groupHeader) {
      let isExpanded = false;
      readMoreBtn.addEventListener('click', function() {
        if (isExpanded) {
          // Collapse
          overviewText.classList.remove('expanded');
          overviewText.classList.add('collapsed');
          readMoreBtn.textContent = 'Read more...';
          groupHeader.classList.remove('expanded');
        } else {
          // Expand
          overviewText.classList.remove('collapsed');
          overviewText.classList.add('expanded');
          readMoreBtn.textContent = 'Read less';
          groupHeader.classList.add('expanded');
        }
        isExpanded = !isExpanded;
      });
    }
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken},
  hooks: { groupsPageScripts: groupsPageScripts }
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// Toggle nested replies functionality for ALL levels
document.addEventListener('click', function(e) {
  // Handle expand/collapse of nested replies
  if (e.target.closest('.expand-nested-btn')) {
    e.preventDefault();
    const button = e.target.closest('.expand-nested-btn');
    const replyId = button.getAttribute('phx-value-reply-id');
    const nestedReplies = document.getElementById(`nested-replies-${replyId}`);
    
    if (nestedReplies) {
      // Toggle visibility
      nestedReplies.classList.toggle('hidden');
      
      // Update button text and icon
      const icon = button.querySelector('svg');
      const textSpan = button.querySelector('span');
      
      if (nestedReplies.classList.contains('hidden')) {
        // Collapsed state
        if (icon) {
          icon.style.transform = 'rotate(0deg)';
        }
        if (textSpan) {
          const replyCount = button.getAttribute('data-reply-count');
          textSpan.textContent = `Show ${replyCount} replies`;
        }
      } else {
        // Expanded state  
        if (icon) {
          icon.style.transform = 'rotate(180deg)';
        }
        if (textSpan) {
          textSpan.textContent = 'Hide replies';
        }
      }
    }
  }
});

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

> **Before you start:** Fill in Section 1 early. Once you move on to Section 2, don't go back and edit Section 1. The gap between what you guessed and what you actually found is the point of this whole document.

---
## Present your team

Rania Na Vitha Shafrial AzisMohamed Morad (Moe)
## Starting Assumption

*What did you assume, before any real exploration (start of investigation phase)? Be honest, including if your assumption is basically a guess. Write it and move on.*
We thought we'll end up using:
Things related to pure media, like videos and audios, and how to tinker around with them
Because:
It sounded obvious since we choose multimedia framework

---
## The Exploration Log

*Not your conclusion, your actual process. Update this as you go, it doesn't need to be written in one sitting.*
Example:<br/>After we browsed about media, something like how media works, how video is playing through our devices, etc. We surprised about how the media like video works because video is a frame that shown fast enough to fool our brain. The raw frame is real problem because it's huge. A single frame at 1920X1080, 3 bytes per pixel has 6MB size.  At 24fps, one minute of raw video = ~8.6 GB. That is huge amount of size. That's why there are codecs to compress the video.
We heard a lot about .mp4, .mov that places in the last as extension file. it called "Container". Container holds tracks, timing, metadata as well as codecs. 
What we actually built or tested in code (not just read about):
We tried to implement the AVPlayer and see how the media plays and how the AVPlayer works
What we discovered that we didn't expect:
There are so many layers from AVFoundation to play media like video. It is not just about how simple play and pause the video at front but there are so many events happening in the back there.

---
## What We Tried and Dropped

*Name at least one real alternative you seriously considered, and explain why it got cut. "We didn't consider anything else" is a sign you should go back because maybe there is something worth exploring that could perform really well with your idea.*
Example:<br/>We considered:
we were considering having image classification, so based on what user want pictures with, for e.g: user chooses a specific person that they want their pictures with, and then we view them only the pics, that them, and the selected people they want.
We dropped it because:
While the Photos app has this feature of image recognition, and binding the image with people, as 3rd party app, we don't have access to this meta-data, so we dropped, also having LLM that does classification and recognition is very complex, so we dropped it twice ^__^

---
## Real Limitations Hit
*What broke, what didn't behave the way the documentation said it would, where AI genuinely couldn't help you.*
Example:<br/>[ Describe the situation ]
We initially planned to let users filter photos by selecting specific people (for example, "show me only photos with Ahmed and Sarah"). However, during development we discovered that third-party iOS apps cannot access the Photos app's person-recognition metadata. We also explored using an AI/LLM-based image recognition system to identify people ourselves, but implementing a reliable face recognition pipeline was far beyond the scope and complexity of our project.
How we worked around it (or how it changed our use case / mechanic):
We removed the people-based filtering feature from our application and redesigned the experience around capabilities that are available through Apple's public APIs. This allowed us to focus on features that could be implemented reliably while keeping the app performant and maintainable. 

---
## The Revised Decision

*Your final framework/feature combination. Go back and look at Section 1, what changed, and why? If nothing changed, explain why your first instinct held up.*
Example:
Final decision:
[CoreGraphics, MultiMedia, and AppExtensions ]
What changed since Section 1, and why:
[ We integrated with other frameworks, to make our app, suitable for the user, for example we choose iPadOs and CoreGraphics for the drawing because of the bigger screen, and the pencil]

---
## App Track Addendum

### About the Frameworks

*Does your use case genuinely need both frameworks working together, or could it work with just your main one?*
[ **Yes. Our use case genuinely needs both frameworks working together.** While the Multimedia framework provides the core functionality for accessing and working with media, the **iPadOS** framework and CoreGraphics for PencilKit enhances the experience by taking advantage of iPad-specific capabilities such as larger screen layouts, multitasking, and a more productive interface. The app could technically function using only the Multimedia framework, but it would not deliver the intended user experience on iPad. Therefore, both frameworks contribute to the final product, with Multimedia powering the core functionality and iPadOS improving usability and interaction. ]
### About Accessibility and Localization

*What did you decide to support, what did you decide not to, and why? "We didn't localize" is a fine answer if you can say why, "we didn't think about it" is not.*
[ ]
### About Privacy

*What data does your app actually need? What happens in your app when the user says no to a permission?*<br/><br/>Gallery access, to make them pic the images from it.


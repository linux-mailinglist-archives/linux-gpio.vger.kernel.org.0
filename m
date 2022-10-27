Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5334060F6D2
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 14:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbiJ0MJv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 08:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbiJ0MJr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 08:09:47 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF4D1A388
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 05:09:43 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id q127so1302700vsa.7
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m6Tws+53Mdw1JWR4HAuihxt+EvtDvC7IT3IXxCV7EcY=;
        b=3AFJpnLX/JbtiPeC69Fg9PkQKQeZQXst2B+HnUT9HZF3CJwA967vGUKaPtulTn9JPX
         TCZdUU5SEtBvpyBFCFEaKIU7HqUs1uJeawHTdwPKhE79HOdRdSjafCfjnCwv4sU/3Gq5
         T0OBVLTNFViQOBu3cvY/vGyfznjptlJ+9pIZjgJH2na8E4OrmXvzORxv5qDIxH4Bdv38
         rbe3ZWYOyJbVgZBRjsS9wFxRoR27PlOo887sAdvi2gez1Dw96WD09aju9UeLqChuAdfO
         OhhIfHjsnVDogq4Y6OlKrD4aTVm39CEsUFAVsI+9vwyCW/6OO61exk4o4G0uziOX+krg
         2Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6Tws+53Mdw1JWR4HAuihxt+EvtDvC7IT3IXxCV7EcY=;
        b=2T5PPkhnshTDwIUtcjjGhR53DUAqdwk8x+3mnvzdifI2Br20P2X5iB96Z3O36WXf0i
         ErsptRRGiSU1Tc5ByUW1hOHtiTQ2cBWLnHbU8n7cFY1iUJcZ4m0UOplDlTOuCEFfFt3y
         j4VcImeDxM6a5t7Yb68BzDV+9j4Zsg8EvMwEejbRHnSd3hlNZ24xp2E+ityIzsKAmzFi
         hWcr9pJXdOjtQYTCiQVWWt+CjDctxAk0rfiQVX9fPPvVttXgkdj5kcA6i4obhYhflqCP
         C+q/eVcGfuheoBo8+grhqU//F5LDGYKFuMwj6aQLCi1+IaUeb8ZyzGb8rvO9gCShnrOB
         nPLg==
X-Gm-Message-State: ACrzQf22Hx+vSF+7mLOZNcOA7vAbouflhpOeGwmtZ4gsjx98hsGs2XO7
        Ip8nPkoU+lr5mI6d4Fb7TMF2deSTr4g7Fl3yrYAoEQ==
X-Google-Smtp-Source: AMsMyM7T/rZN6leps79qHsKgDX8bLUCrIKHLWe6k6y/U0cmVAd7MawhoTyxxZLMEqmZ5Krdpb+luU7TFaJdED8arkKs=
X-Received: by 2002:a67:ab46:0:b0:3a7:d2b6:121b with SMTP id
 k6-20020a67ab46000000b003a7d2b6121bmr26845857vsh.16.1666872582674; Thu, 27
 Oct 2022 05:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org> <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol> <20221021112238.teqz25pn3hz5d4cs@vireshk-i7> <Y1KTCWiGdUxkQ6Al@sol>
In-Reply-To: <Y1KTCWiGdUxkQ6Al@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 27 Oct 2022 14:09:31 +0200
Message-ID: <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 21, 2022 at 2:39 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Oct 21, 2022 at 04:52:38PM +0530, Viresh Kumar wrote:
> > Hi Kent,
> >
> > Thanks a lot for putting so much effort in reviewing the series, yes
> > it makes me invest more time to the bindings, but it is totally worth
> > it. Excellent work.
> >
> > I have pushed all the changed I have made so far in v8 branch in my
> > repository in the top few commits, in case you want to have a look.
> >
> > On 17-10-22, 20:59, Kent Gibson wrote:
> > > On Fri, Oct 14, 2022 at 04:17:20PM +0530, Viresh Kumar wrote:
> > > > +use vmm_sys_util::errno::Error as Errno;
> > >
> > > Why vmm_sys_util::errno::Error rather than, say, errno::Errno?
> >
> > I used it in another project, vhost-device related to virtio, and so
> > ended up using here. The main advantage of using this over errno is
> > that we can do Errno::last() to get the error number of the last
> > operation.
> >
> > Do you have a better alternative to that ?
> >
>
> The one I mentioned is the top match for errno on crates.io[1].
> That provides the same functionality, and that is all it does.
> All other things being equal I would go for the simplest dependency.
>
> [1] https://crates.io/crates/errno
>
>
> > > > +/// GPIO chip
> > > > +///
> > > > +/// A GPIO chip object is associated with an open file descriptor to the GPIO
> > > > +/// character device. It exposes basic information about the chip and allows
> > > > +/// callers to retrieve information about each line, watch lines for state
> > > > +/// changes and make line requests.
> > > > +#[derive(Clone, Debug, Eq, PartialEq)]
> > > > +pub struct Chip {
> > > > +    ichip: Arc<Internal>,
> > > > +    info: Info,
> > > > +}
> > > > +
> > >
> > > Doesn't info need an Arc as well? (see struct Info below).
> >
> > Why would that be required ? Internal required it as it can be stored
> > in two structures, Chip and Info, and should get freed after both of
> > them are out of scope.
> >
> > Though Info have a single owner/user, i.e. Chip and once Chip is out
> > of scope, Info can be freed as well.
> >
> > > Actually, does it make sense to be able to Clone the Chip?
> >
> > I have removed Clone now, since Info couldn't be cloned anymore.
> >
>
> Exactly - if Info can't clone then you could Arc it.
> But if the Chip can't clone then problem solved.
>
> > > Two threads could then watch different lines and
> > > wait_info_event() from the one chip.
> > > That isn't going to work, at least not the way you would want.
> > >
> > > > +unsafe impl Send for Chip {}
> > > > +unsafe impl Sync for Chip {}
> > > > +
> > >
> > > Send makes sense to me, but not Sync, due to the waiting for info events.
> > > Similarly for line_request::Request.
> > > At least not without some additional synchronisation/locking, and I'm not
> > > sure we want to go there.
> >
> > Hmm, I added those for tests and now for the multi-threaded example I
> > have written. And I do get what you are saying, it is tricky to share
> > the same chip from two threads.
> >
> > What should I do? Remove those example/tests and remove Sync ?
> >
>
> I would remove Sync support until you are satisfied you have a working
> solution for it.
>
> > > > +impl Chip {
> > > > +    /// Find a chip by path.
> > > > +    pub fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
> > > > +        let ichip = Arc::new(Internal::open(path)?);
> > > > +        let info = Info::new(ichip.clone())?;
> > > > +
> > >
> > > info is not always necessary, e.g. if the user just want to request a
> > > line.  Maybe lazy load it?  Assuming you want to keep a copy cached with
> > > the Chip at all.
> >
> > Yeah, but then I will be required to add an additional check to below
> > routines to see if info is already available or not, and populate it
> > if required.
> >
> > Or detach Info from Chip and remove below wrappers ?
> >
>
> The usual way is to add a helper function that returns the lazy loaded
> object.  If it hasn't been loaded yet then it does that first.
> And your wrapper functions use that to access the info.
>
> Or, as you suggest, just let the user get the Info and use its
> accessors.
>
> Either way works for me.
>
> > > > +        Ok(Self { ichip, info })
> > > > +    }
> > > > +
> > > > +    /// Get the chip name as represented in the kernel.
> > > > +    pub fn name(&self) -> Result<&str> {
> > > > +        self.info.name()
> > > > +    }
> > > > +
> > > > +    /// Get the chip label as represented in the kernel.
> > > > +    pub fn label(&self) -> Result<&str> {
> > > > +        self.info.label()
> > > > +    }
> > > > +
> > > > +    /// Get the number of GPIO lines exposed by the chip.
> > > > +    pub fn num_lines(&self) -> usize {
> > > > +        self.info.num_lines()
> > > > +    }
> >
> >
> > > > +impl Buffer {
> > > > +    /// Create a new edge event buffer.
> > > > +    ///
> > > > +    /// If capacity equals 0, it will be set to a default value of 64. If
> > > > +    /// capacity is larger than 1024, it will be limited to 1024.
> > > > +    pub fn new(capacity: usize) -> Result<Self> {
> > > > +        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity as c_ulong) };
> > > > +        if buffer.is_null() {
> > > > +            return Err(Error::OperationFailed(
> > > > +                OperationType::EdgeEventBufferNew,
> > > > +                Errno::last(),
> > > > +            ));
> > > > +        }
> > > > +
> > > > +        Ok(Self { buffer })
> > > > +    }
> > > > +
> > > > +    /// Private helper, Returns gpiod_edge_event_buffer
> > > > +    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
> > > > +        self.buffer
> > > > +    }
> > >
> > > Just make self.buffer pub(crate)?  Why is the idea of passing a raw
> > > pointer around making my skin crawl?
> > > Or even better, move the guts of
> > > line_request::Request::read_edge_events() into a helper function here
> > > that it can call so it doesn't need access to self.buffer.
> >
> > But then this piece of code would need to access self.request as the
> > API is:
> >
> >             gpiod::gpiod_line_request_read_edge_event(
> >                 self.request,
> >                 buffer.buffer,
> >                 buffer.capacity().try_into().unwrap(),
> >             )
> >
>
> Yep - you pass the Request to the Buffer, rather than have the Request
> doing the work on the buffer.
>
> IIRC my branch includes my version of this.
>
> > It needs raw pointers to both buffer and request.
> >
> > > > +
> > > > +    /// Get the capacity of the event buffer.
> > > > +    pub fn capacity(&self) -> usize {
> > > > +        unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(self.buffer()) as usize }
> > > > +    }
> > > > +
> > > > +    /// Read an event stored in the buffer.
> > > > +    pub fn event(&self, index: u64) -> Result<edge::Event> {
> > > > +        edge::Event::new(self, index)
> > > > +    }
> > >
> > > What is to prevent reading an event from a slot that has not yet been
> > > populated?  I realise doing that is possible in C, but it should be
> > > prevented in the Rust bindings.
> >
> > Good point, I have done this now:
> >
> > event_buffer.rs:
> >
> >     /// Set the number of events read into the event buffer.
> >     pub fn set_event_count(&mut self, count: usize) {
> >         self.event_count = count
> >     }
> >
>
> pub(crate) else the user can mess with the threshold.
>
> >     /// Read an event stored in the buffer.
> >     pub fn event(&self, index: usize) -> Result<request::Event> {
> >         if index >= self.event_count {
> >             Err(Error::InvalidArguments)
> >         } else {
> >             request::Event::new(self, index)
> >         }
> >     }
> >
> > line_request.rs:
> >
> >     /// Get a number of edge events from a line request.
> >     ///
> >     /// This function will block if no event was queued for the line.
> >     pub fn read_edge_events(&self, buffer: &mut request::Buffer) -> Result<u32> {
> >         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
> >         let ret = unsafe {
> >             gpiod::gpiod_line_request_read_edge_event(
> >                 self.request,
> >                 buffer.buffer,
> >                 buffer.capacity().try_into().unwrap(),
> >             )
> >         };
> >
> >         if ret == -1 {
> >             Err(Error::OperationFailed(
> >                 OperationType::LineRequestReadEdgeEvent,
> >                 Errno::last(),
> >             ))
> >         } else {
> >             // Set count of events read in the buffer
> >             buffer.set_event_count(ret as usize);
> >             Ok(ret as u32)
> >         }
> >     }
> >
> >
> > Good enough ?
> >
>
> Better.
>
> > > Not sure why event_buffer needs to be nested inside an event module.
> > > event_buffer should be in the request module.
> > >
> > > edge_event is a tougher call, either line or request.  Probably the
> > > latter.
> >
> > Is this okay now ? I had to rename chip.rs to chip_internal.rs in
> > order to include info_event within it.
> >
> > mod chip_internal;
> > mod info_event;
> >
> > pub mod chip {
> >     /// GPIO chip related definitions.
> >     pub use crate::chip_internal::*;
> >
> >     pub mod info {
> >         /// GPIO chip info event related definitions.
> >         pub use crate::info_event::*;
> >     }
> > }
> >
>
> Couldn't you just add those pubs to the old chip file?
> So you don't need to rename it to chip_internal.
>
> > mod edge_event;
> > mod event_buffer;
> > mod line_request;
> > mod request_config;
> >
> > /// GPIO chip request related definitions.
> > pub mod request {
> >     pub use crate::edge_event::*;
> >     pub use crate::event_buffer::*;
> >     pub use crate::line_request::*;
> >     pub use crate::request_config::*;
> > }
> >
> > mod line_config;
> > mod line_info;
> > mod line_settings;
> >
> > /// GPIO chip line related definitions.
> > pub mod line {
> >     pub use crate::line_config::*;
> >     pub use crate::line_info::*;
> >     pub use crate::line_settings::*;
> > }
> >
> > > > +/// Iterator for GPIO devices.
> > > > +pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
> > > > +    let mut chips = Vec::new();
> > > > +
> > > > +    for entry in fs::read_dir(path).map_err(|_| Error::IoError)?.flatten() {
> > > > +        let path = entry.path();
> > > > +
> > > > +        if is_gpiochip_device(&path) {
> > > > +            chips.push(chip::Chip::open(&path)?);
> > > > +        }
> > > > +    }
> > >
> > > If there is a symlink to a device both in the path, or multiple symlinks
> > > to the same device, you will get the same chip several times in the
> > > returned Vec?
> >
> > Probably yeah.
> >
>
> Lets say I want to implement a search for line by name, and check that
> the line name is unique.  That will fail if there is a symlink to the
> relevant device, cos it will see a spurious duplicate.
> How would I do that then?
>
> > > Some mention of the order in which devices are returned?
> >
> > Documentation of read_dir() says:
> >
> > The order in which this iterator returns entries is platform and filesystem dependent.
> >
> > mentioned same in comment now.
> >
> > > If you are returning a Vec then sorted might be nice, else state they
> > > are not sorted.
> >
> > What should we here then ?
> >
>
> From my PoV, the two options are either
>     a)wrap read_dir and return an actual iterator and live with the disorder
>  or b) return a Vec and sort it before you return it
>
> Returning an unsorted Vec is the worst of both worlds.
>
> > > > +/// Get the API version of the library as a human-readable string.
> > > > +pub fn version_string() -> Result<&'static str> {
> > > > +    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
> > > > +    let version = unsafe { gpiod::gpiod_version_string() };
> > > > +
> > > > +    if version.is_null() {
> > > > +        return Err(Error::NullString("GPIO library version"));
> > > > +    }
> > > > +
> > > > +    // SAFETY: The string is guaranteed to be valid here by the C API.
> > > > +    str::from_utf8(unsafe { slice::from_raw_parts(version as *const u8, strlen(version) as usize) })
> > > > +        .map_err(Error::StringNotUtf8)
> > > > +}
> > >
> > > What if the Rust bindings version differ from the libgpiod version?
> >
> > Hmm, not sure which version should we return here. I think it should
> > just be libgpiod's version. Though I am fine with whatever you and
> > Bartosz decide.
> >
>
> You need both - separately.
>

For C++ and Python, the API version stays consistent across all three
trees for simplicity. There are separate ABI numbers for libgpiod,
libgpiodcxx and libgpiosim. Rust doesn't seem to have this kind of
differentiation between ABI and API so I'd say we should have a single
API version but see below about the idea for the contrib/ directory.

> > > > +    /// Get a number of edge events from a line request.
> > > > +    ///
> > > > +    /// This function will block if no event was queued for the line.
> > > > +    pub fn read_edge_events(&self, buffer: &mut edge::event::Buffer) -> Result<u32> {
> > >
> > > What is to stop the user requesting events between the len returned
> > > here and the end of the buffer?  Why knows what state they are in.
> >
> > I have shared a change for the same earlier, is that enough ?
> >
> > > Overall I don't see any problems that require major rework to the scale
> > > of previous versions.  My main itches that need to be scratched being
> > > dangling pointers and to a lesser degree thread safey.
> > >
> > > I find the event_buffer solution to be less safe than it could be.
> > > I've got an alternative, based on the my earlier PoC/suggestion, that
> > > returns an snaphot of events when you read events from the request into
> > > the buffer.  I've put that in a branch on github [1] if you want to take
> > > a look.
> > >
> > > I went though a few variations wrt how to deal with the event cloning.
> > > Not implementing Clone on the events means they can't be stored in a
> > > Vec, and so storing them in the Buffer was problematic.
> > > My initial solution was for the event to only wrap the C pointer and
> > > have distinct event types for buffered and cloned, implemented
> > > using traits - which is bit of a pain as the user then needs to import
> > > the trait themselves to use the events :-(.
> > > Then tried a macro to add impl Event on the two event types, which looks
> > > ugly to me.
> > > Finally went with having Event be a new type of BaseEvent, which does
> > > impl Clone, so the event buffer can store them (and <cough> cast them
> > > to Event as appropriate).  Slightly more evil under the hood than I
> > > would like, but provides the cleanest implementation.
> > >
> > > The Events snapshot should impl Iterator to make it easier to use,
> > > though I haven't added that yet.
> > > And the error returned by Events::event() is wrong - just cut and pasted
> > > one in there - probably should be InvalidArguments?
> > >
> > > Anyway, the end result is that it is not possible to read an invalid or
> > > uninitialised event from Rust, which was the point.
> > > It also better handles lifetimes, so it isn't necessary to explicitly
> > > drop events before re-using the buffer, and the event_clone() method
> > > can be an instance method rather than a class method (to borrow some
> > > Python terminology).
> > > I've added an events.rs to the examples to demonstrate how the
> > > changes impact usage in each case.
> >
> > I haven't looked into that in great details yet, just skimmed through
> > it. I am not sure I understand them completely yet and I am not sure
> > if it is worth the complexity, may be it is. I will try to get through
> > the changes again next week though.
> >
>
> Clearly I think it is or I wouldn't've bothered?
> So not sure what you would like me to add, and I'm not going to push for
> it any more than I already have.  If you have the time and inclination
> then give it a look.
>
> > Will it be possible to get on with the current implementation and once
> > this is merged you send patches on top of it which can then get
> > reviewed properly by others too, who know Rust better than me ?
> >
>
> The Rust bindings are your baby, and I don't have any plans to be
> patching it.  And Bart is the arbiter of what gets merged, so that
> decision is his.
>

I was thinking about it lately and figured that - since I don't know
Rust very well and cannot reliably maintain that part myself - how
about we create a 'contrib' directory in the libgpiod tree for this
kind of "third-party" bindings? The requirements for stability and
correctness in there would be more relaxed compared to the main tree?

And yes, we can think about pulling it into master soon - as soon as
the python bindings land and we ditch the next/libgpiod-v2.0 branch.

Bart

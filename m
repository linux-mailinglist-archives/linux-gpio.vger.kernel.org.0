Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91036607717
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 14:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiJUMki (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 08:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbiJUMkM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 08:40:12 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5894D107CCA
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 05:39:55 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id l4so2228416plb.8
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0wK2w50ESr0qcz6lOCePvHsAE+emyPTHCQjQGUB1cTw=;
        b=S6dyWH/laWC6vS5rYhRSCX/Fwhn0L52b6QVTvYkD2SI2MFHDceSQoQNDa4IWioVFU1
         vVU+RvMZth4U8sNuGEFxk+Ew3bhmlGlVRPJaSVsqrUA1Z/nmzznfgaiIBWVjlchwICXX
         XqUKxg1Jg9a3CEDtlWPsjh+eIwl/UXdO9tZ7HjvW0+GoKQuqRxidpSc9wvpU7Wr0zeVJ
         Ne9Y+KYJrhtdI9SFZE6ETdEmZbkHGWOO8RRBqTqt83A8P6q7mUIdrWQsIyxb5/MLqjdJ
         r8zX8VGKpgMgDJbM1qxmbCJW+AFM/Ep4x/jwFI8ZAP9XaG3K9b+8M82G4kFI4wYdaaO8
         Rdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wK2w50ESr0qcz6lOCePvHsAE+emyPTHCQjQGUB1cTw=;
        b=6YydGY1pjcuVqfGXIhrg8yGIjFb/s14W9qp003rGz4vmF2azbUJD/YKqrUQAmZPPFJ
         kXQFJlGJ7D5lJuJl87V6Cxfip/J5xeEqIewfg5/ZRHtvd7XiK38LFPNEbRp3t3HH/C0C
         w1KNZLoy2eBlHqKNxGDhegdCcMCqGCS2iTFuHEsM3gacLzcaXbRLTdHi8NMgJ5go2qL+
         Kgz747c+ZhhY9oAB9KxXNRXJUn5291m3flVI2hqD8rXS3gNx2o+4oXNDby9fvmHlv9u7
         GvvlHw8fi6+rW3zln2WR5/f8jVKzVYOtL1AgBz0ktF5aRo3qtk+QksPe/D0niHQFAE/9
         0++A==
X-Gm-Message-State: ACrzQf0sbCN4vhTY0IdirddzhfZJIWr3lPRWem2CEM4RIcVYTd4XKIfx
        8uYHXKEvRkjHSUgsObfkiPE=
X-Google-Smtp-Source: AMsMyM7PTcCf10/bApSTlTKYTKek0wSa2qUlbCZVpbjIQLO1B+vo/qYmOvQwozxVl1WgBLhr0ki17A==
X-Received: by 2002:a17:902:ce86:b0:182:498f:afd3 with SMTP id f6-20020a170902ce8600b00182498fafd3mr19366618plg.82.1666355984499;
        Fri, 21 Oct 2022 05:39:44 -0700 (PDT)
Received: from sol (14-203-42-90.tpgi.com.au. [14.203.42.90])
        by smtp.gmail.com with ESMTPSA id d204-20020a621dd5000000b0056238741ba0sm14962947pfd.79.2022.10.21.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 05:39:44 -0700 (PDT)
Date:   Fri, 21 Oct 2022 20:39:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y1KTCWiGdUxkQ6Al@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol>
 <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 21, 2022 at 04:52:38PM +0530, Viresh Kumar wrote:
> Hi Kent,
> 
> Thanks a lot for putting so much effort in reviewing the series, yes
> it makes me invest more time to the bindings, but it is totally worth
> it. Excellent work.
> 
> I have pushed all the changed I have made so far in v8 branch in my
> repository in the top few commits, in case you want to have a look.
> 
> On 17-10-22, 20:59, Kent Gibson wrote:
> > On Fri, Oct 14, 2022 at 04:17:20PM +0530, Viresh Kumar wrote:
> > > +use vmm_sys_util::errno::Error as Errno;
> > 
> > Why vmm_sys_util::errno::Error rather than, say, errno::Errno?
> 
> I used it in another project, vhost-device related to virtio, and so
> ended up using here. The main advantage of using this over errno is
> that we can do Errno::last() to get the error number of the last
> operation.
> 
> Do you have a better alternative to that ?
>

The one I mentioned is the top match for errno on crates.io[1].
That provides the same functionality, and that is all it does.
All other things being equal I would go for the simplest dependency.

[1] https://crates.io/crates/errno


> > > +/// GPIO chip
> > > +///
> > > +/// A GPIO chip object is associated with an open file descriptor to the GPIO
> > > +/// character device. It exposes basic information about the chip and allows
> > > +/// callers to retrieve information about each line, watch lines for state
> > > +/// changes and make line requests.
> > > +#[derive(Clone, Debug, Eq, PartialEq)]
> > > +pub struct Chip {
> > > +    ichip: Arc<Internal>,
> > > +    info: Info,
> > > +}
> > > +
> > 
> > Doesn't info need an Arc as well? (see struct Info below).
> 
> Why would that be required ? Internal required it as it can be stored
> in two structures, Chip and Info, and should get freed after both of
> them are out of scope.
> 
> Though Info have a single owner/user, i.e. Chip and once Chip is out
> of scope, Info can be freed as well.
> 
> > Actually, does it make sense to be able to Clone the Chip?
> 
> I have removed Clone now, since Info couldn't be cloned anymore.
> 

Exactly - if Info can't clone then you could Arc it.
But if the Chip can't clone then problem solved.

> > Two threads could then watch different lines and
> > wait_info_event() from the one chip.
> > That isn't going to work, at least not the way you would want.
> > 
> > > +unsafe impl Send for Chip {}
> > > +unsafe impl Sync for Chip {}
> > > +
> > 
> > Send makes sense to me, but not Sync, due to the waiting for info events.
> > Similarly for line_request::Request.
> > At least not without some additional synchronisation/locking, and I'm not
> > sure we want to go there.
> 
> Hmm, I added those for tests and now for the multi-threaded example I
> have written. And I do get what you are saying, it is tricky to share
> the same chip from two threads.
> 
> What should I do? Remove those example/tests and remove Sync ?
> 

I would remove Sync support until you are satisfied you have a working
solution for it.

> > > +impl Chip {
> > > +    /// Find a chip by path.
> > > +    pub fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
> > > +        let ichip = Arc::new(Internal::open(path)?);
> > > +        let info = Info::new(ichip.clone())?;
> > > +
> > 
> > info is not always necessary, e.g. if the user just want to request a
> > line.  Maybe lazy load it?  Assuming you want to keep a copy cached with
> > the Chip at all.
> 
> Yeah, but then I will be required to add an additional check to below
> routines to see if info is already available or not, and populate it
> if required.
> 
> Or detach Info from Chip and remove below wrappers ?
> 

The usual way is to add a helper function that returns the lazy loaded
object.  If it hasn't been loaded yet then it does that first.
And your wrapper functions use that to access the info.

Or, as you suggest, just let the user get the Info and use its
accessors.

Either way works for me.

> > > +        Ok(Self { ichip, info })
> > > +    }
> > > +
> > > +    /// Get the chip name as represented in the kernel.
> > > +    pub fn name(&self) -> Result<&str> {
> > > +        self.info.name()
> > > +    }
> > > +
> > > +    /// Get the chip label as represented in the kernel.
> > > +    pub fn label(&self) -> Result<&str> {
> > > +        self.info.label()
> > > +    }
> > > +
> > > +    /// Get the number of GPIO lines exposed by the chip.
> > > +    pub fn num_lines(&self) -> usize {
> > > +        self.info.num_lines()
> > > +    }
> 
> 
> > > +impl Buffer {
> > > +    /// Create a new edge event buffer.
> > > +    ///
> > > +    /// If capacity equals 0, it will be set to a default value of 64. If
> > > +    /// capacity is larger than 1024, it will be limited to 1024.
> > > +    pub fn new(capacity: usize) -> Result<Self> {
> > > +        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity as c_ulong) };
> > > +        if buffer.is_null() {
> > > +            return Err(Error::OperationFailed(
> > > +                OperationType::EdgeEventBufferNew,
> > > +                Errno::last(),
> > > +            ));
> > > +        }
> > > +
> > > +        Ok(Self { buffer })
> > > +    }
> > > +
> > > +    /// Private helper, Returns gpiod_edge_event_buffer
> > > +    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
> > > +        self.buffer
> > > +    }
> > 
> > Just make self.buffer pub(crate)?  Why is the idea of passing a raw
> > pointer around making my skin crawl?
> > Or even better, move the guts of
> > line_request::Request::read_edge_events() into a helper function here
> > that it can call so it doesn't need access to self.buffer.
> 
> But then this piece of code would need to access self.request as the
> API is:
> 
>             gpiod::gpiod_line_request_read_edge_event(
>                 self.request,
>                 buffer.buffer,
>                 buffer.capacity().try_into().unwrap(),
>             )
> 

Yep - you pass the Request to the Buffer, rather than have the Request
doing the work on the buffer.

IIRC my branch includes my version of this.

> It needs raw pointers to both buffer and request.
> 
> > > +
> > > +    /// Get the capacity of the event buffer.
> > > +    pub fn capacity(&self) -> usize {
> > > +        unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(self.buffer()) as usize }
> > > +    }
> > > +
> > > +    /// Read an event stored in the buffer.
> > > +    pub fn event(&self, index: u64) -> Result<edge::Event> {
> > > +        edge::Event::new(self, index)
> > > +    }
> > 
> > What is to prevent reading an event from a slot that has not yet been
> > populated?  I realise doing that is possible in C, but it should be
> > prevented in the Rust bindings.
> 
> Good point, I have done this now:
> 
> event_buffer.rs:
> 
>     /// Set the number of events read into the event buffer.
>     pub fn set_event_count(&mut self, count: usize) {
>         self.event_count = count
>     }
> 

pub(crate) else the user can mess with the threshold.

>     /// Read an event stored in the buffer.
>     pub fn event(&self, index: usize) -> Result<request::Event> {
>         if index >= self.event_count {
>             Err(Error::InvalidArguments)
>         } else {
>             request::Event::new(self, index)
>         }
>     }
> 
> line_request.rs:
> 
>     /// Get a number of edge events from a line request.
>     ///
>     /// This function will block if no event was queued for the line.
>     pub fn read_edge_events(&self, buffer: &mut request::Buffer) -> Result<u32> {
>         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
>         let ret = unsafe {
>             gpiod::gpiod_line_request_read_edge_event(
>                 self.request,
>                 buffer.buffer,
>                 buffer.capacity().try_into().unwrap(),
>             )
>         };
> 
>         if ret == -1 {
>             Err(Error::OperationFailed(
>                 OperationType::LineRequestReadEdgeEvent,
>                 Errno::last(),
>             ))
>         } else {
>             // Set count of events read in the buffer
>             buffer.set_event_count(ret as usize);
>             Ok(ret as u32)
>         }
>     }
> 
> 
> Good enough ?
> 

Better.

> > Not sure why event_buffer needs to be nested inside an event module.
> > event_buffer should be in the request module.
> > 
> > edge_event is a tougher call, either line or request.  Probably the
> > latter.
> 
> Is this okay now ? I had to rename chip.rs to chip_internal.rs in
> order to include info_event within it.
> 
> mod chip_internal;
> mod info_event;
> 
> pub mod chip {
>     /// GPIO chip related definitions.
>     pub use crate::chip_internal::*;
> 
>     pub mod info {
>         /// GPIO chip info event related definitions.
>         pub use crate::info_event::*;
>     }
> }
> 

Couldn't you just add those pubs to the old chip file?
So you don't need to rename it to chip_internal.

> mod edge_event;
> mod event_buffer;
> mod line_request;
> mod request_config;
> 
> /// GPIO chip request related definitions.
> pub mod request {
>     pub use crate::edge_event::*;
>     pub use crate::event_buffer::*;
>     pub use crate::line_request::*;
>     pub use crate::request_config::*;
> }
> 
> mod line_config;
> mod line_info;
> mod line_settings;
> 
> /// GPIO chip line related definitions.
> pub mod line {
>     pub use crate::line_config::*;
>     pub use crate::line_info::*;
>     pub use crate::line_settings::*;
> }
> 
> > > +/// Iterator for GPIO devices.
> > > +pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
> > > +    let mut chips = Vec::new();
> > > +
> > > +    for entry in fs::read_dir(path).map_err(|_| Error::IoError)?.flatten() {
> > > +        let path = entry.path();
> > > +
> > > +        if is_gpiochip_device(&path) {
> > > +            chips.push(chip::Chip::open(&path)?);
> > > +        }
> > > +    }
> > 
> > If there is a symlink to a device both in the path, or multiple symlinks
> > to the same device, you will get the same chip several times in the
> > returned Vec?
> 
> Probably yeah.
> 

Lets say I want to implement a search for line by name, and check that
the line name is unique.  That will fail if there is a symlink to the
relevant device, cos it will see a spurious duplicate.
How would I do that then?

> > Some mention of the order in which devices are returned?
> 
> Documentation of read_dir() says:
> 
> The order in which this iterator returns entries is platform and filesystem dependent.
> 
> mentioned same in comment now.
> 
> > If you are returning a Vec then sorted might be nice, else state they
> > are not sorted.
> 
> What should we here then ?
> 

From my PoV, the two options are either
    a)wrap read_dir and return an actual iterator and live with the disorder
 or b) return a Vec and sort it before you return it

Returning an unsorted Vec is the worst of both worlds.

> > > +/// Get the API version of the library as a human-readable string.
> > > +pub fn version_string() -> Result<&'static str> {
> > > +    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
> > > +    let version = unsafe { gpiod::gpiod_version_string() };
> > > +
> > > +    if version.is_null() {
> > > +        return Err(Error::NullString("GPIO library version"));
> > > +    }
> > > +
> > > +    // SAFETY: The string is guaranteed to be valid here by the C API.
> > > +    str::from_utf8(unsafe { slice::from_raw_parts(version as *const u8, strlen(version) as usize) })
> > > +        .map_err(Error::StringNotUtf8)
> > > +}
> > 
> > What if the Rust bindings version differ from the libgpiod version?
> 
> Hmm, not sure which version should we return here. I think it should
> just be libgpiod's version. Though I am fine with whatever you and
> Bartosz decide.
> 

You need both - separately.

> > > +    /// Get a number of edge events from a line request.
> > > +    ///
> > > +    /// This function will block if no event was queued for the line.
> > > +    pub fn read_edge_events(&self, buffer: &mut edge::event::Buffer) -> Result<u32> {
> > 
> > What is to stop the user requesting events between the len returned
> > here and the end of the buffer?  Why knows what state they are in.
> 
> I have shared a change for the same earlier, is that enough ?
> 
> > Overall I don't see any problems that require major rework to the scale
> > of previous versions.  My main itches that need to be scratched being
> > dangling pointers and to a lesser degree thread safey.
> > 
> > I find the event_buffer solution to be less safe than it could be.
> > I've got an alternative, based on the my earlier PoC/suggestion, that
> > returns an snaphot of events when you read events from the request into
> > the buffer.  I've put that in a branch on github [1] if you want to take
> > a look.
> > 
> > I went though a few variations wrt how to deal with the event cloning.
> > Not implementing Clone on the events means they can't be stored in a
> > Vec, and so storing them in the Buffer was problematic.
> > My initial solution was for the event to only wrap the C pointer and
> > have distinct event types for buffered and cloned, implemented
> > using traits - which is bit of a pain as the user then needs to import
> > the trait themselves to use the events :-(.
> > Then tried a macro to add impl Event on the two event types, which looks
> > ugly to me.
> > Finally went with having Event be a new type of BaseEvent, which does
> > impl Clone, so the event buffer can store them (and <cough> cast them
> > to Event as appropriate).  Slightly more evil under the hood than I
> > would like, but provides the cleanest implementation.
> > 
> > The Events snapshot should impl Iterator to make it easier to use,
> > though I haven't added that yet.
> > And the error returned by Events::event() is wrong - just cut and pasted
> > one in there - probably should be InvalidArguments?
> > 
> > Anyway, the end result is that it is not possible to read an invalid or
> > uninitialised event from Rust, which was the point.
> > It also better handles lifetimes, so it isn't necessary to explicitly
> > drop events before re-using the buffer, and the event_clone() method
> > can be an instance method rather than a class method (to borrow some
> > Python terminology).
> > I've added an events.rs to the examples to demonstrate how the
> > changes impact usage in each case.
> 
> I haven't looked into that in great details yet, just skimmed through
> it. I am not sure I understand them completely yet and I am not sure
> if it is worth the complexity, may be it is. I will try to get through
> the changes again next week though.
> 

Clearly I think it is or I wouldn't've bothered?
So not sure what you would like me to add, and I'm not going to push for
it any more than I already have.  If you have the time and inclination
then give it a look.

> Will it be possible to get on with the current implementation and once
> this is merged you send patches on top of it which can then get
> reviewed properly by others too, who know Rust better than me ?
> 

The Rust bindings are your baby, and I don't have any plans to be
patching it.  And Bart is the arbiter of what gets merged, so that
decision is his.

Cheers,
Kent.

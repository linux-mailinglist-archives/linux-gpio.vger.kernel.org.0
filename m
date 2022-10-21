Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382F760760C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 13:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiJULWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 07:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiJULWr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 07:22:47 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ED926143B
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 04:22:41 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id p3so1119919pld.10
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 04:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e920m5xXhRqRBllP1bngxZG7ag0sN7iybDnox0zT/RQ=;
        b=VbQI3JS2ljd744xkFJvpwZFnO+RvNmMg1i+J+Br9NYkGFcjJaiHOJ/BTMD5ET4Y6VQ
         zMTzPIXB+r7eLP49qvXrIyrNV9Fvm3HEgFyI6Zj7h9iU6FqLvC36YSq19e7NVE7KgjXt
         fJ7nE3Tt9JChSKjyc5QfwauSHV7o12wkz8FVRo+95+LzzOhiu/3RYHQJpuFZTCK+SZ93
         Xt8KIMHmM9gkPn6hTWSWAUfJr1TAfNyxYbkmz5zG5xwuB64dmAJSpxE/xQ/lirgsAPXh
         NqfC/hBYE6+ctQLGVuPYVExTdKILhziX2cOhcIv1oFScP9KUh+ZKBOqRxT2komwXthxU
         dpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e920m5xXhRqRBllP1bngxZG7ag0sN7iybDnox0zT/RQ=;
        b=vSBi/U/BMoYfOcpej7IBIytVlhTdPUYfZxOa2rZmBETtSBR94GAJT9WhoAYLcJqtI2
         XLo7PlPS4hqUCqVvpP16bA70rkHrM2353yQKNVvChNEcja1M9qhu2bqJgD2/roVV9JHf
         tKZs4+BZikrxWGXQzD+1+Pi1hIZXRQV3Nk+rxLqHjum5/UcCXoPqYcZx9LKQkOM0y/5/
         6WvvNsKqfcSiKQGUOyXlM7ZmdhCFAAs9AIVGljkzYUi1K1xnCiixhDSKJrYYp4JxyTnN
         jmOFG9aBTkzyqtR+QkSkHHhus68W4qiGC1gx9PkhxLdtDqmKAIIvyv0X2/oapgIJoGOV
         SuPA==
X-Gm-Message-State: ACrzQf2N/6fDvG7pmWB6WHWarLLGaqMJt9rx8E6kolh82JzZZFEwy/5h
        SeE9GkrQReNC+jzjtSJrtFOjI4kYckitbQ==
X-Google-Smtp-Source: AMsMyM4jso8LIbNoQl3VCvW/WYeY7o/YfgCJm0IYd7f1duD7jGN8qdcaA136WQ1u9uXxcYFhmIRuPA==
X-Received: by 2002:a17:902:d544:b0:17d:318a:adf7 with SMTP id z4-20020a170902d54400b0017d318aadf7mr19158470plf.148.1666351360951;
        Fri, 21 Oct 2022 04:22:40 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id s19-20020a17090ae69300b0020de216d0f7sm1426325pjy.18.2022.10.21.04.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 04:22:40 -0700 (PDT)
Date:   Fri, 21 Oct 2022 16:52:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01RvbboC3dMDVSy@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,

Thanks a lot for putting so much effort in reviewing the series, yes
it makes me invest more time to the bindings, but it is totally worth
it. Excellent work.

I have pushed all the changed I have made so far in v8 branch in my
repository in the top few commits, in case you want to have a look.

On 17-10-22, 20:59, Kent Gibson wrote:
> On Fri, Oct 14, 2022 at 04:17:20PM +0530, Viresh Kumar wrote:
> > +use vmm_sys_util::errno::Error as Errno;
> 
> Why vmm_sys_util::errno::Error rather than, say, errno::Errno?

I used it in another project, vhost-device related to virtio, and so
ended up using here. The main advantage of using this over errno is
that we can do Errno::last() to get the error number of the last
operation.

Do you have a better alternative to that ?

> > +/// GPIO chip
> > +///
> > +/// A GPIO chip object is associated with an open file descriptor to the GPIO
> > +/// character device. It exposes basic information about the chip and allows
> > +/// callers to retrieve information about each line, watch lines for state
> > +/// changes and make line requests.
> > +#[derive(Clone, Debug, Eq, PartialEq)]
> > +pub struct Chip {
> > +    ichip: Arc<Internal>,
> > +    info: Info,
> > +}
> > +
> 
> Doesn't info need an Arc as well? (see struct Info below).

Why would that be required ? Internal required it as it can be stored
in two structures, Chip and Info, and should get freed after both of
them are out of scope.

Though Info have a single owner/user, i.e. Chip and once Chip is out
of scope, Info can be freed as well.

> Actually, does it make sense to be able to Clone the Chip?

I have removed Clone now, since Info couldn't be cloned anymore.

> Two threads could then watch different lines and
> wait_info_event() from the one chip.
> That isn't going to work, at least not the way you would want.
> 
> > +unsafe impl Send for Chip {}
> > +unsafe impl Sync for Chip {}
> > +
> 
> Send makes sense to me, but not Sync, due to the waiting for info events.
> Similarly for line_request::Request.
> At least not without some additional synchronisation/locking, and I'm not
> sure we want to go there.

Hmm, I added those for tests and now for the multi-threaded example I
have written. And I do get what you are saying, it is tricky to share
the same chip from two threads.

What should I do? Remove those example/tests and remove Sync ?

> > +impl Chip {
> > +    /// Find a chip by path.
> > +    pub fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
> > +        let ichip = Arc::new(Internal::open(path)?);
> > +        let info = Info::new(ichip.clone())?;
> > +
> 
> info is not always necessary, e.g. if the user just want to request a
> line.  Maybe lazy load it?  Assuming you want to keep a copy cached with
> the Chip at all.

Yeah, but then I will be required to add an additional check to below
routines to see if info is already available or not, and populate it
if required.

Or detach Info from Chip and remove below wrappers ?

> > +        Ok(Self { ichip, info })
> > +    }
> > +
> > +    /// Get the chip name as represented in the kernel.
> > +    pub fn name(&self) -> Result<&str> {
> > +        self.info.name()
> > +    }
> > +
> > +    /// Get the chip label as represented in the kernel.
> > +    pub fn label(&self) -> Result<&str> {
> > +        self.info.label()
> > +    }
> > +
> > +    /// Get the number of GPIO lines exposed by the chip.
> > +    pub fn num_lines(&self) -> usize {
> > +        self.info.num_lines()
> > +    }


> > +impl Buffer {
> > +    /// Create a new edge event buffer.
> > +    ///
> > +    /// If capacity equals 0, it will be set to a default value of 64. If
> > +    /// capacity is larger than 1024, it will be limited to 1024.
> > +    pub fn new(capacity: usize) -> Result<Self> {
> > +        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity as c_ulong) };
> > +        if buffer.is_null() {
> > +            return Err(Error::OperationFailed(
> > +                OperationType::EdgeEventBufferNew,
> > +                Errno::last(),
> > +            ));
> > +        }
> > +
> > +        Ok(Self { buffer })
> > +    }
> > +
> > +    /// Private helper, Returns gpiod_edge_event_buffer
> > +    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
> > +        self.buffer
> > +    }
> 
> Just make self.buffer pub(crate)?  Why is the idea of passing a raw
> pointer around making my skin crawl?
> Or even better, move the guts of
> line_request::Request::read_edge_events() into a helper function here
> that it can call so it doesn't need access to self.buffer.

But then this piece of code would need to access self.request as the
API is:

            gpiod::gpiod_line_request_read_edge_event(
                self.request,
                buffer.buffer,
                buffer.capacity().try_into().unwrap(),
            )

It needs raw pointers to both buffer and request.

> > +
> > +    /// Get the capacity of the event buffer.
> > +    pub fn capacity(&self) -> usize {
> > +        unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(self.buffer()) as usize }
> > +    }
> > +
> > +    /// Read an event stored in the buffer.
> > +    pub fn event(&self, index: u64) -> Result<edge::Event> {
> > +        edge::Event::new(self, index)
> > +    }
> 
> What is to prevent reading an event from a slot that has not yet been
> populated?  I realise doing that is possible in C, but it should be
> prevented in the Rust bindings.

Good point, I have done this now:

event_buffer.rs:

    /// Set the number of events read into the event buffer.
    pub fn set_event_count(&mut self, count: usize) {
        self.event_count = count
    }

    /// Read an event stored in the buffer.
    pub fn event(&self, index: usize) -> Result<request::Event> {
        if index >= self.event_count {
            Err(Error::InvalidArguments)
        } else {
            request::Event::new(self, index)
        }
    }

line_request.rs:

    /// Get a number of edge events from a line request.
    ///
    /// This function will block if no event was queued for the line.
    pub fn read_edge_events(&self, buffer: &mut request::Buffer) -> Result<u32> {
        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
        let ret = unsafe {
            gpiod::gpiod_line_request_read_edge_event(
                self.request,
                buffer.buffer,
                buffer.capacity().try_into().unwrap(),
            )
        };

        if ret == -1 {
            Err(Error::OperationFailed(
                OperationType::LineRequestReadEdgeEvent,
                Errno::last(),
            ))
        } else {
            // Set count of events read in the buffer
            buffer.set_event_count(ret as usize);
            Ok(ret as u32)
        }
    }


Good enough ?

> Not sure why event_buffer needs to be nested inside an event module.
> event_buffer should be in the request module.
> 
> edge_event is a tougher call, either line or request.  Probably the
> latter.

Is this okay now ? I had to rename chip.rs to chip_internal.rs in
order to include info_event within it.

mod chip_internal;
mod info_event;

pub mod chip {
    /// GPIO chip related definitions.
    pub use crate::chip_internal::*;

    pub mod info {
        /// GPIO chip info event related definitions.
        pub use crate::info_event::*;
    }
}

mod edge_event;
mod event_buffer;
mod line_request;
mod request_config;

/// GPIO chip request related definitions.
pub mod request {
    pub use crate::edge_event::*;
    pub use crate::event_buffer::*;
    pub use crate::line_request::*;
    pub use crate::request_config::*;
}

mod line_config;
mod line_info;
mod line_settings;

/// GPIO chip line related definitions.
pub mod line {
    pub use crate::line_config::*;
    pub use crate::line_info::*;
    pub use crate::line_settings::*;
}

> > +/// Iterator for GPIO devices.
> > +pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
> > +    let mut chips = Vec::new();
> > +
> > +    for entry in fs::read_dir(path).map_err(|_| Error::IoError)?.flatten() {
> > +        let path = entry.path();
> > +
> > +        if is_gpiochip_device(&path) {
> > +            chips.push(chip::Chip::open(&path)?);
> > +        }
> > +    }
> 
> If there is a symlink to a device both in the path, or multiple symlinks
> to the same device, you will get the same chip several times in the
> returned Vec?

Probably yeah.

> Some mention of the order in which devices are returned?

Documentation of read_dir() says:

The order in which this iterator returns entries is platform and filesystem dependent.

mentioned same in comment now.

> If you are returning a Vec then sorted might be nice, else state they
> are not sorted.

What should we here then ?

> > +/// Get the API version of the library as a human-readable string.
> > +pub fn version_string() -> Result<&'static str> {
> > +    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
> > +    let version = unsafe { gpiod::gpiod_version_string() };
> > +
> > +    if version.is_null() {
> > +        return Err(Error::NullString("GPIO library version"));
> > +    }
> > +
> > +    // SAFETY: The string is guaranteed to be valid here by the C API.
> > +    str::from_utf8(unsafe { slice::from_raw_parts(version as *const u8, strlen(version) as usize) })
> > +        .map_err(Error::StringNotUtf8)
> > +}
> 
> What if the Rust bindings version differ from the libgpiod version?

Hmm, not sure which version should we return here. I think it should
just be libgpiod's version. Though I am fine with whatever you and
Bartosz decide.

> > +    /// Get a number of edge events from a line request.
> > +    ///
> > +    /// This function will block if no event was queued for the line.
> > +    pub fn read_edge_events(&self, buffer: &mut edge::event::Buffer) -> Result<u32> {
> 
> What is to stop the user requesting events between the len returned
> here and the end of the buffer?  Why knows what state they are in.

I have shared a change for the same earlier, is that enough ?

> Overall I don't see any problems that require major rework to the scale
> of previous versions.  My main itches that need to be scratched being
> dangling pointers and to a lesser degree thread safey.
> 
> I find the event_buffer solution to be less safe than it could be.
> I've got an alternative, based on the my earlier PoC/suggestion, that
> returns an snaphot of events when you read events from the request into
> the buffer.  I've put that in a branch on github [1] if you want to take
> a look.
> 
> I went though a few variations wrt how to deal with the event cloning.
> Not implementing Clone on the events means they can't be stored in a
> Vec, and so storing them in the Buffer was problematic.
> My initial solution was for the event to only wrap the C pointer and
> have distinct event types for buffered and cloned, implemented
> using traits - which is bit of a pain as the user then needs to import
> the trait themselves to use the events :-(.
> Then tried a macro to add impl Event on the two event types, which looks
> ugly to me.
> Finally went with having Event be a new type of BaseEvent, which does
> impl Clone, so the event buffer can store them (and <cough> cast them
> to Event as appropriate).  Slightly more evil under the hood than I
> would like, but provides the cleanest implementation.
> 
> The Events snapshot should impl Iterator to make it easier to use,
> though I haven't added that yet.
> And the error returned by Events::event() is wrong - just cut and pasted
> one in there - probably should be InvalidArguments?
> 
> Anyway, the end result is that it is not possible to read an invalid or
> uninitialised event from Rust, which was the point.
> It also better handles lifetimes, so it isn't necessary to explicitly
> drop events before re-using the buffer, and the event_clone() method
> can be an instance method rather than a class method (to borrow some
> Python terminology).
> I've added an events.rs to the examples to demonstrate how the
> changes impact usage in each case.

I haven't looked into that in great details yet, just skimmed through
it. I am not sure I understand them completely yet and I am not sure
if it is worth the complexity, may be it is. I will try to get through
the changes again next week though.

Will it be possible to get on with the current implementation and once
this is merged you send patches on top of it which can then get
reviewed properly by others too, who know Rust better than me ?

-- 
viresh

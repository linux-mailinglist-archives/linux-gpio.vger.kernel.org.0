Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 410885823D9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 12:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbiG0KIV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 06:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiG0KIU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 06:08:20 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB782CE2A
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:08:17 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso1698515pjo.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xkAdVyuS9C/du1IE23bP/W6whq/TDxkNoo7XiJFSpsE=;
        b=mRdb7vlNAq7n9sYQr3S14Z32R2OHCnYcs0fqa5NkY8rnKfNWMqvEf/K+l2d6oqHG6D
         25fVthpSMtls/xhlOivIyPaNzpaM2K0gqrQNZ0dGj70STp/088T7IzYsM0Cqw8elsrOn
         1mrig3iDa1UoS1MdP0ZN2ihu4noxXyB3OYkb+WHCgrnUfYBKUBLMHmmXG6BPuL5J0+CE
         Xys6cp+G7La2RePoEUzg67HQz4n1XjzNiFgm+Ur4ph37bozd3QuYMaKY8hcWpndj3fjL
         wrFJqCUC7w3Rrnhjnmb2F2SOfvfN3dMGYFHL7EVoUitj1UHYQzfssL2TElhdmDo1nVys
         6D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xkAdVyuS9C/du1IE23bP/W6whq/TDxkNoo7XiJFSpsE=;
        b=2XOpqKnPoW42fL4NUPEmFf2AtKivaGTS+L99rcOAVA3WJ7qPG+NHN8kWxDyzgClDeE
         L4M87oQ5LOnfVNlhYX4rW4xoNJR4beMwRnSESDdEfh4kxM8DLmWJF4kjFtZYZ740hnAM
         eCoEq7aEoLzO00S86YDBvwoN3Ye6/9rcIKAB4I8/vHSnrccouIuW//CmuOQXt5M1Ikwt
         f2zFCNubrYf2epLDnHg6jMzd8ZP1RMFyEHDkYvDXfa38et6Hsb8iErY5cTMUBBhBSFmm
         mQMMrLC06V1SlQbhDQMB07Hy4KkKimBNE9tzeNq3CHQTp971lm5+UgY4iwzJ1fQIyrWR
         +VDg==
X-Gm-Message-State: AJIora8QD+0AdAKZcKi6jfBF7kuELogHhzJQ9iX4+1235todc6vFqsd6
        M3QbT19QxustFcy3oe4l3dA=
X-Google-Smtp-Source: AGRyM1tODfgKQwmMW3ilPGkVplPu3FxG/y0VwWiifhy9xCCqgZWMlS1b72a8LQMu3KaSrR0tgr9E6A==
X-Received: by 2002:a17:902:c992:b0:16d:710d:8add with SMTP id g18-20020a170902c99200b0016d710d8addmr13809498plc.0.1658916496583;
        Wed, 27 Jul 2022 03:08:16 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id jz21-20020a17090b14d500b001f1ef42fd7bsm1273253pjb.36.2022.07.27.03.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 03:08:16 -0700 (PDT)
Date:   Wed, 27 Jul 2022 18:08:09 +0800
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
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220727100809.GB117252@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
 <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 02:37:01PM +0530, Viresh Kumar wrote:
> On 27-07-22, 10:57, Kent Gibson wrote:
> > On Fri, Jul 08, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> 
> > > +    /// Get the path used to find the chip.
> > > +    pub fn get_path(&self) -> Result<&str> {
> > 
> > It seems absurd that a method that simply returns the path provided to
> > open() requires a Result, but that is a consequence of wrapping.
> > 
> > I was considering suggesting caching a copy in struct Chip, but all the
> > other methods require Results so at least this is consistent :-(.
> > 
> > Yay, more unwrapping than Xmas past.
> 
> :)
> 
> > > +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> > > +        // as the `struct Chip`.
> > > +        let path = unsafe { bindings::gpiod_chip_get_path(self.ichip.chip()) };
> > 
> > Trusting that it is never NULL?
> 
> I believe we discussed that early on (few months back) and decided this will
> never be NULL and since the Rust wrappers are pretty much part of the same
> repository, we can take that as a guarantee. An out-of-this-repository user
> can't really assume that.
> 
> > Add a null check to be sure.
> 
> But I am fine with this as well.
> 

It should never return NULL.  At the moment.
I would prefer to have NULL checks for all cases, not assume anything
about the C implementation, and to be consistent with other places
where you do NULL checks.  As it stands when I see this I need to go check
the C to see if this is a reasonable exception or not.  And I'm lazy.

> > > +    /// Wait for line status events on any of the watched lines on the chip.
> > > +    pub fn wait_info_event(&self, timeout: Duration) -> Result<()> {
> > 
> > Durations cannot be negative, so caller cannot make this block
> > indefinitely.  Make timeout an Option? (no timeout => block)
> 
> I didn't know we want the always blocking capability as well. Yeah, Option
> sounds like the right approach.
> 
> So in that case we just pass -1 to gpiod_chip_wait_info_event() ?
> 
> > > +        let ret = unsafe {
> > > +            bindings::gpiod_chip_wait_info_event(self.ichip.chip(), timeout.as_nanos() as i64)
> > > +        };
> 
> > > diff --git a/bindings/rust/src/chip_info.rs b/bindings/rust/src/chip_info.rs
> > > +/// GPIO chip Information
> > > +pub struct ChipInfo {
> > > +    info: *mut bindings::gpiod_chip_info,
> > > +}
> > > +
> > 
> > Consider modules and namespaces rather than lumping everything in
> > the gpiod space.
> > 
> > e.g. gpiod::ChipInfo -> gpiod::chip::Info
> 
> The modules are already there, as file names. So what we really have is
> gpiod::chip_info::ChipInfo (yeah it isn't great for sure). But then it looked
> tougher/complex/unnecessary for end users to know the internals of a dependency
> and so I did this:
> 
> pub use crate::chip::*;
> pub use crate::edge_event::*;
> pub use crate::event_buffer::*;
> pub use crate::info_event::*;
> pub use crate::line_config::*;
> pub use crate::line_info::*;
> pub use crate::line_request::*;
> pub use crate::request_config::*;
> 
> which puts everything under gpiod::*. I think it is easier for users that way.
> The modules are fine for in-crate management, but for end user they shouldn't be
> visible.
> 

The main problem I have with putting everything in the top level is the
generated docs.  You get everything dumped on you, so all structs, enums
and functions, and it isn't clear to the user what the logical starting
point is.
If things are tiered then you can introduce them more gradually, or keep
them out of their way if they are unlikely to use them (e.g. ChipInfo,
InfoEvent).

> > > diff --git a/bindings/rust/src/lib.rs b/bindings/rust/src/lib.rs
> > > +/// Error codes for libgpiod operations
> > > +#[derive(Copy, Clone, Debug, PartialEq, ThisError)]
> > > +pub enum Error {
> 
> > > +    #[error("Operation {0} Failed: {1}")]
> > > +    OperationFailed(&'static str, IoError),
> > 
> > Use an enum for the operation rather than a string?
> 
> Not sure I understood this.
> 

Rather than passing a static str, define an enum with a variant to
identify the operation.  Like std::io::ErrorKind (not sure that is the
best example).

> > And if it returns an IoError it must be an IoOperation?
> > Else if the IoError is just an errno then call it that.
> > 
> > > +}
> 
> > > diff --git a/bindings/rust/src/line_info.rs b/bindings/rust/src/line_info.rs
> > > +/// Line info
> > > +///
> > > +/// Exposes functions for retrieving kernel information about both requested and
> > > +/// free lines.  Line info object contains an immutable snapshot of a line's status.
> > > +///
> > > +/// The line info contains all the publicly available information about a
> > > +/// line, which does not include the line value.  The line must be requested
> > > +/// to access the line value.
> > > +
> > > +pub struct LineInfo {
> > > +    info: *mut bindings::gpiod_line_info,
> > > +    ichip: Option<Arc<ChipInternal>>,
> > > +    free: bool,
> > 
> > This flag makes no sense - the info always needs to be freed no matter
> > which path, watched or not, was taken to get it from the C API.
> 
> Not the one created with gpiod_info_event_get_line_info(), else it will result
> in double free.
> 

Ah, down in the try_from.  Fair enough.  Though the other two cases both
need to be freed.  And I would prefer the field name changed to match
the EdgeEvent - which ever way you go with that.

> > > +    /// Stop watching the line
> > > +    pub fn unwatch(&mut self) {
> > > +        if let Some(ichip) = &self.ichip {
> > > +            unsafe {
> > > +                bindings::gpiod_chip_unwatch_line_info(ichip.chip(), self.get_offset());
> > > +            }
> > > +            self.ichip = None;
> > > +        }
> > > +    }
> > > +
> > 
> > This should be a method of the chip, not the info.
> 
> I think there were some issues with my understanding of the whole watch thing.
> Is there any existing example of gpiowatch somewhere ?
> 

There is one in my proposed tool changes for v2[1]

[1] https://lore.kernel.org/linux-gpio/20220708120626.89844-5-warthog618@gmail.com/

> > > +impl TryFrom<&InfoEvent> for LineInfo {
> > 
> > Is try_from appropriate for getting a contained object?
> > "from" normally refers to a type conversion.
> 
> Not sure, but as most of new() is going away here, I will likely move this to
> info_event as well. No try-from with that.
> 
> > > +impl Drop for LineInfo {
> > > +    fn drop(&mut self) {
> > > +        // We must not free the Line info object created from `struct InfoEvent` by calling
> > > +        // libgpiod API.
> > > +        if self.free {
> > > +            self.unwatch();
> > 
> > Why does dropping a LineInfo unwatch the line???
> 
> Because I thought it is related to the Line's info and we won't wanna watch once
> line info is gone. Again, it is my wrong interpretation.
> 

Yeah, no.  You can get LineInfoChange events from the chip similar to
the EdgeEvents from a line request.  unwatching when here is akin to
disabling edge detection when you free an edge event.

Watching and unwatching line info are at chip scope, and your bindings
should never unwatch themselves - only wrap the C and provide a method
on the Chip for the user to call.

> > > +    /// Get values of a subset of lines associated with the request.
> > > +    pub fn get_values_subset(&self, offsets: &[u32], values: &mut Vec<i32>) -> Result<()> {
> > > +        if offsets.len() != values.len() {
> > > +            return Err(Error::OperationFailed(
> > > +                "Gpio LineRequest array size mismatch",
> > > +                IoError::new(EINVAL),
> > > +            ));
> > > +        }
> > > +
> > 
> > Returned values are awkward to use as the user has to index into them
> > using the index corresponding to the offset in offsets.
> > Provide a Values type that maps offset to value, e.g. using an IntMap,
> > and pass that in instead of separate offsets and values arrays.
> 
> We would need to separate out the offsets then as that's what
> gpiod_line_request_get_values_subset() needs. Maybe take offsets, like now, as
> an argument and return Result<IntMap> ?
> 

Don't use IntMap raw, use it as the basis of a Values type.

You can pull the keys from the map to determine which lines to get.
If the map is empty get them all.
Hmmm, that is assuming you have the requested offsets on hand at that
point.

> > Same applies to set_values_subset().
> 
> That would be fine here though.
> 
> > > +    /// Set the size of the kernel event buffer for the request.
> > > +    ///
> > > +    /// The kernel may adjust the value if it's too high. If set to 0, the
> > > +    /// default value will be used.
> > > +    pub fn set_event_buffer_size(&self, size: u32) {
> > > +        unsafe {
> > > +            bindings::gpiod_request_config_set_event_buffer_size(self.config, size as c_ulong)
> > > +        }
> > > +    }
> > 
> > The kernel may adjust the value regardless - this value is a tentative
> > suggestion to the kernel (the kernel buffers have to be sized in 2^N, so
> > it generally rounds up to the next power of 2, within limits).
> > 
> > > +
> > > +    /// Get the edge event buffer size for the request config.
> > > +    pub fn get_event_buffer_size(&self) -> u32 {
> > > +        unsafe { bindings::gpiod_request_config_get_event_buffer_size(self.config) as u32 }
> > > +    }
> > 
> > You might want to note that this just reads the value from the config.
> > The actual value used by the kernel is not made available to user space.
> 
> Do you want me to add these two comments for the above two routines ?
> 

Not add verbatim.  Maybe work them in.
Probably should look at revising the C API comments and then just mirror that.

> Other comments, which I removed, look acceptable to me. Will try to incorporate
> all that in the next version.
> 
> Thanks a lot for the very thorough review.
> 

No problem.  Thanks for the effort you've put into them.

Cheers,
Kent.

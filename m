Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3585822C9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 11:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbiG0JIZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 05:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbiG0JHF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 05:07:05 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA97E47BA2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 02:07:04 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id x1so13854199plb.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 02:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W6Kij9igE04G9E1N2/2CnApgXjwZNhmoHvQNrIg3HbM=;
        b=ToTuWsChQlwHpI+Sfy2WcJaYK6K816BdAKn4aS5YbJxZNykGlNaC7fAwBGgRCeA4DZ
         3//hH85YPsnJ+HWfshpGMul1zlnJ/F52wRVPnb/X/CtipaLfRR3jVeIxQOnxm0zBXmXQ
         IQZqaUj8LWwXdUCvKfLAQE5uapx1nu4oHf0E24wKFgrKylychlQMUT0fdr4E2gPkEFFf
         lnRfJCy/tkUb4iiaFny9XCckz+57tNuqH7ASEgYP/f5MyYTevNiuDHsug/YyDAa+vY3A
         8NFcr7BKdkBbMb1NzgvFxxPLEWMX4hiz7wy5kDVdvh1QXOA1XG3fA02QRR8wG99rJkLa
         sXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W6Kij9igE04G9E1N2/2CnApgXjwZNhmoHvQNrIg3HbM=;
        b=Bcmpx31QLZX+7YGb1Hw0H5nY6OY3eZMJ/u7qvyZ0jE0xJoCPEYq+se98zRtgfuxN/q
         eV0qRNJZR5H153OMLt7CtRx3wp1EPfpCPm88aiNmPb6IQfK0eRCRP5C+wcF9xjPdPmNA
         MruQ33ARRhV8SApwR+1BN6QhrXEzJfibYfvhMqUAei7h3gDbX6dTINQbAx6Gojrly8yH
         NxYHLjdU9nGwvdWnaW/oiZO/t+Me+n5IoR0hC7PMc1vVUnggGkbxwBMsVj72h43csAOu
         Pm90TrkJsNsUzeiawQrgyFEl0pJoBa1FMAn9Vy+TG5029MBs4GGs2erasyRPzkstyexJ
         XU5w==
X-Gm-Message-State: AJIora83prJC1yPrnuirMzr1OPwcCLp72ZHJV34/9VKp7uy6QczUYVD+
        4U4AdmSXTPLzqy2PIxS519UgFw==
X-Google-Smtp-Source: AGRyM1vXKJdkUilxbcrylOJyYo5JOFlLkRYumhf6qG/TO8o6qZF5D57CbURS3P8YqGp9RkLePtZGmw==
X-Received: by 2002:a17:90b:4c8d:b0:1f2:c360:5e6b with SMTP id my13-20020a17090b4c8d00b001f2c3605e6bmr3483587pjb.195.1658912824204;
        Wed, 27 Jul 2022 02:07:04 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a16c200b001f24dc56b72sm1129298pje.23.2022.07.27.02.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 02:07:03 -0700 (PDT)
Date:   Wed, 27 Jul 2022 14:37:01 +0530
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
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025754.GD88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:57, Kent Gibson wrote:
> On Fri, Jul 08, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:

> > +    /// Get the path used to find the chip.
> > +    pub fn get_path(&self) -> Result<&str> {
> 
> It seems absurd that a method that simply returns the path provided to
> open() requires a Result, but that is a consequence of wrapping.
> 
> I was considering suggesting caching a copy in struct Chip, but all the
> other methods require Results so at least this is consistent :-(.
> 
> Yay, more unwrapping than Xmas past.

:)

> > +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> > +        // as the `struct Chip`.
> > +        let path = unsafe { bindings::gpiod_chip_get_path(self.ichip.chip()) };
> 
> Trusting that it is never NULL?

I believe we discussed that early on (few months back) and decided this will
never be NULL and since the Rust wrappers are pretty much part of the same
repository, we can take that as a guarantee. An out-of-this-repository user
can't really assume that.

> Add a null check to be sure.

But I am fine with this as well.

> > +    /// Wait for line status events on any of the watched lines on the chip.
> > +    pub fn wait_info_event(&self, timeout: Duration) -> Result<()> {
> 
> Durations cannot be negative, so caller cannot make this block
> indefinitely.  Make timeout an Option? (no timeout => block)

I didn't know we want the always blocking capability as well. Yeah, Option
sounds like the right approach.

So in that case we just pass -1 to gpiod_chip_wait_info_event() ?

> > +        let ret = unsafe {
> > +            bindings::gpiod_chip_wait_info_event(self.ichip.chip(), timeout.as_nanos() as i64)
> > +        };

> > diff --git a/bindings/rust/src/chip_info.rs b/bindings/rust/src/chip_info.rs
> > +/// GPIO chip Information
> > +pub struct ChipInfo {
> > +    info: *mut bindings::gpiod_chip_info,
> > +}
> > +
> 
> Consider modules and namespaces rather than lumping everything in
> the gpiod space.
> 
> e.g. gpiod::ChipInfo -> gpiod::chip::Info

The modules are already there, as file names. So what we really have is
gpiod::chip_info::ChipInfo (yeah it isn't great for sure). But then it looked
tougher/complex/unnecessary for end users to know the internals of a dependency
and so I did this:

pub use crate::chip::*;
pub use crate::edge_event::*;
pub use crate::event_buffer::*;
pub use crate::info_event::*;
pub use crate::line_config::*;
pub use crate::line_info::*;
pub use crate::line_request::*;
pub use crate::request_config::*;

which puts everything under gpiod::*. I think it is easier for users that way.
The modules are fine for in-crate management, but for end user they shouldn't be
visible.

> > diff --git a/bindings/rust/src/lib.rs b/bindings/rust/src/lib.rs
> > +/// Error codes for libgpiod operations
> > +#[derive(Copy, Clone, Debug, PartialEq, ThisError)]
> > +pub enum Error {

> > +    #[error("Operation {0} Failed: {1}")]
> > +    OperationFailed(&'static str, IoError),
> 
> Use an enum for the operation rather than a string?

Not sure I understood this.

> And if it returns an IoError it must be an IoOperation?
> Else if the IoError is just an errno then call it that.
> 
> > +}

> > diff --git a/bindings/rust/src/line_info.rs b/bindings/rust/src/line_info.rs
> > +/// Line info
> > +///
> > +/// Exposes functions for retrieving kernel information about both requested and
> > +/// free lines.  Line info object contains an immutable snapshot of a line's status.
> > +///
> > +/// The line info contains all the publicly available information about a
> > +/// line, which does not include the line value.  The line must be requested
> > +/// to access the line value.
> > +
> > +pub struct LineInfo {
> > +    info: *mut bindings::gpiod_line_info,
> > +    ichip: Option<Arc<ChipInternal>>,
> > +    free: bool,
> 
> This flag makes no sense - the info always needs to be freed no matter
> which path, watched or not, was taken to get it from the C API.

Not the one created with gpiod_info_event_get_line_info(), else it will result
in double free.

> > +    /// Stop watching the line
> > +    pub fn unwatch(&mut self) {
> > +        if let Some(ichip) = &self.ichip {
> > +            unsafe {
> > +                bindings::gpiod_chip_unwatch_line_info(ichip.chip(), self.get_offset());
> > +            }
> > +            self.ichip = None;
> > +        }
> > +    }
> > +
> 
> This should be a method of the chip, not the info.

I think there were some issues with my understanding of the whole watch thing.
Is there any existing example of gpiowatch somewhere ?

> > +impl TryFrom<&InfoEvent> for LineInfo {
> 
> Is try_from appropriate for getting a contained object?
> "from" normally refers to a type conversion.

Not sure, but as most of new() is going away here, I will likely move this to
info_event as well. No try-from with that.

> > +impl Drop for LineInfo {
> > +    fn drop(&mut self) {
> > +        // We must not free the Line info object created from `struct InfoEvent` by calling
> > +        // libgpiod API.
> > +        if self.free {
> > +            self.unwatch();
> 
> Why does dropping a LineInfo unwatch the line???

Because I thought it is related to the Line's info and we won't wanna watch once
line info is gone. Again, it is my wrong interpretation.

> > +    /// Get values of a subset of lines associated with the request.
> > +    pub fn get_values_subset(&self, offsets: &[u32], values: &mut Vec<i32>) -> Result<()> {
> > +        if offsets.len() != values.len() {
> > +            return Err(Error::OperationFailed(
> > +                "Gpio LineRequest array size mismatch",
> > +                IoError::new(EINVAL),
> > +            ));
> > +        }
> > +
> 
> Returned values are awkward to use as the user has to index into them
> using the index corresponding to the offset in offsets.
> Provide a Values type that maps offset to value, e.g. using an IntMap,
> and pass that in instead of separate offsets and values arrays.

We would need to separate out the offsets then as that's what
gpiod_line_request_get_values_subset() needs. Maybe take offsets, like now, as
an argument and return Result<IntMap> ?

> Same applies to set_values_subset().

That would be fine here though.

> > +    /// Set the size of the kernel event buffer for the request.
> > +    ///
> > +    /// The kernel may adjust the value if it's too high. If set to 0, the
> > +    /// default value will be used.
> > +    pub fn set_event_buffer_size(&self, size: u32) {
> > +        unsafe {
> > +            bindings::gpiod_request_config_set_event_buffer_size(self.config, size as c_ulong)
> > +        }
> > +    }
> 
> The kernel may adjust the value regardless - this value is a tentative
> suggestion to the kernel (the kernel buffers have to be sized in 2^N, so
> it generally rounds up to the next power of 2, within limits).
> 
> > +
> > +    /// Get the edge event buffer size for the request config.
> > +    pub fn get_event_buffer_size(&self) -> u32 {
> > +        unsafe { bindings::gpiod_request_config_get_event_buffer_size(self.config) as u32 }
> > +    }
> 
> You might want to note that this just reads the value from the config.
> The actual value used by the kernel is not made available to user space.

Do you want me to add these two comments for the above two routines ?

Other comments, which I removed, look acceptable to me. Will try to incorporate
all that in the next version.

Thanks a lot for the very thorough review.

-- 
viresh

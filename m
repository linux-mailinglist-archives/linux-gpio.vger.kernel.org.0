Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A504773C8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 14:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbhLPN7j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 08:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237292AbhLPN7i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 08:59:38 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F571C06173E
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 05:59:38 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id y13so87135991edd.13
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 05:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gyuMxPRkyQfG4VWttgFBZ0Eca/OFQ3Ed2biMfNKKApU=;
        b=IjgYEaa67bd7o05CJhW8GGybU3TUqVq9MdeJum1IMei3kdw2DjTAN0BzCrqRMHiArh
         iIeIKbwht/ZDZsMCNlxLwzvVkpmAcLbRIrOS+GxMG1taGD3ZnjEQu+3kS9N6I6LqnWQy
         NTZB7i2qXbs+ZwVPmrRH9xMAnFRkxeKtRptVqnoOXLZqa4g1mp7lYNF5xsJPadCXqxAU
         RLWn/m4p38MqXqLZBJROfqFMrlXjIlGfWZAL3Y2c5pooY3PXMutqWvhE/+Br8+h09Pck
         1ZsjBzbydAQ4xL8dowTfslSx54cmX+7v2e12Q2d4xyD6T2kcNYX/zXDqPPltv3PSfd+T
         +5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gyuMxPRkyQfG4VWttgFBZ0Eca/OFQ3Ed2biMfNKKApU=;
        b=7/ZK3YQWaJiJ6EAtTnyGULP7Fc1agZjt91f4m9/2GtXDHwlAIlwNgW9xxLtmcwz36k
         md2MFff978urrP8VRAUeB4JR3nyjev0aRT//uO0aQPBzmnul4R3NNLVNq16tZri/35Wx
         xfbv576BJ7ihx9NnHFZ8eyxklZ/ZFsEZAT/BVJ8rtkV58Sudtlhbh3JcPdQ2Kk+ceDWU
         iVjCGDSo4tta5mhwtKxrBki0E9cb63MwC20W3kTkDvjF0NZnPeKq2ZwY+4mzrb7KFBo2
         ys0aw+U5Xqpu/2VrtiWUu5yLLJjp2cDBspo11WlXv0N75SNKKXJASvPl/TBBnUIgr7D6
         +Vrw==
X-Gm-Message-State: AOAM533SVVu69eQ5E2RgoYW20rm/x2JR9sDq5TtSpLC29eG36qKinLMt
        yykHY3IBiA07dM8ebj0oEHRj6OCMpDOjYBggnG1AqA==
X-Google-Smtp-Source: ABdhPJxFN8qTQ3X1zDbSCKuNhSNJXfXTDEclrOBxqmry02I37tuY7v+Id3Uwr5xfG/2Uz6dufwMqFkdqFn5osmAMK7s=
X-Received: by 2002:a05:6402:1250:: with SMTP id l16mr7261528edw.0.1639663176512;
 Thu, 16 Dec 2021 05:59:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638443930.git.viresh.kumar@linaro.org> <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
In-Reply-To: <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Dec 2021 14:59:25 +0100
Message-ID: <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 2, 2021 at 12:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Add rust wrappers around FFI bindings to provide a convenient interface
> for the users.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Hi Viresh, thanks for the hard work.

Obviously this is not something we can merge yet but it's a good base
to continue the work.

General comment on the naming convention:

The line from one of the examples: 'use libgpiod::chip::GpiodChip;'
looks like it has a lot of redundancy in it. How about calling the
crate gpiod and dropping the chip package entirely? Basically follow
what C++ and python bindings do by having `use gpiod::Chip` etc.?

[snip]

> +
> +impl GpiodChipInternal {
> +    /// Find a GPIO chip by path.
> +    pub(crate) fn open(path: &str) -> Result<Self> {
> +        let chip = unsafe { bindings::gpiod_chip_open(path.as_ptr() as *const c_char) };
> +        if chip.is_null() {
> +            return Err(Error::OperationFailed("GpiodChip open", IoError::last()));

One of my concerns last time was error handling. Does this now
translate the error codes from the underlying C code to some kind of
rust errors? Can you elaborate on how that works? I see it always
returns IoError. In my WIP C++ and Python code I try to translate the
errnos into some meaningful exceptions - for instance EINVAL ->
::std::invalid_argument etc. Can we have a similar thing here?

[snip]

> +
> +    /// Get the GPIO chip name as represented in the kernel.
> +    pub fn get_name(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct GpiodChip`.
> +        let name = unsafe { bindings::gpiod_chip_get_name(self.ichip.chip()) };
> +        if name.is_null() {

This is not possible, the string can be empty at the very least but
never null. Same for label and path.

> +
> +        match ret {
> +            -1 => Err(Error::OperationFailed(
> +                "GpiodChip info-event-wait",
> +                IoError::last(),
> +            )),
> +            0 => Err(Error::OperationTimedOut),

Does it have to be an Error? It's pretty normal for an operation to
time out, no?

> +            _ => Ok(()),
> +        }
> +    }
> +
> +    /// Read a single line status change event from this chip. If no events are
> +    /// pending, this function will block.
> +    pub fn info_event_read(&self) -> Result<GpiodInfoEvent> {
> +        GpiodInfoEvent::new(&self.ichip.clone())

Would you mind explaining what the clone() function does here to ichip
and why it's needed.


> +
> +impl GpiodEdgeEvent {
> +    /// Get an event stored in the buffer.
> +    pub fn new(buffer: &GpiodEdgeEventBuffer, index: u64) -> Result<Self> {
> +        let event = unsafe { bindings::gpiod_edge_event_buffer_get_event(buffer.buffer(), index) };
> +        if event.is_null() {
> +            return Err(Error::OperationFailed(
> +                "GpiodEdgeEvent buffer-get-event",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self { event })
> +    }
> +
> +    /// Get the event type.
> +    pub fn get_event_type(&self) -> Result<EdgeEvent> {
> +        EdgeEvent::new(unsafe { bindings::gpiod_edge_event_get_event_type(self.event) } as u32)
> +    }
> +
> +    /// Get the timestamp of the event.
> +    pub fn get_timestamp(&self) -> Duration {
> +        Duration::from_nanos(unsafe { bindings::gpiod_edge_event_get_timestamp(self.event) })
> +    }
> +
> +    /// Get the offset of the line on which the event was triggered.
> +    pub fn get_line_offset(&self) -> u32 {
> +        unsafe { bindings::gpiod_edge_event_get_line_offset(self.event) }
> +    }
> +
> +    /// Get the global sequence number of this event.
> +    ///
> +    /// Returns sequence number of the event relative to all lines in the
> +    /// associated line request.
> +    pub fn get_global_seqno(&self) -> u64 {
> +        unsafe { bindings::gpiod_edge_event_get_global_seqno(self.event) }
> +    }
> +
> +    /// Get the event sequence number specific to concerned line.
> +    ///
> +    /// Returns sequence number of the event relative to this line within the
> +    /// lifetime of the associated line request.
> +    pub fn get_line_seqno(&self) -> u64 {
> +        unsafe { bindings::gpiod_edge_event_get_line_seqno(self.event) }
> +    }
> +}

AFAICT this object will not survive the parent buffer. Take a look at
the current development version of the C++ bindings where I play with
copy constructors to ensure that.

[snip]

I'll address the config objects once we actually have the final
version in the C API.

Bart

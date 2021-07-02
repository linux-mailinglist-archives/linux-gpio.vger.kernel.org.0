Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04193B9DB9
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 10:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbhGBIxl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 04:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhGBIxl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 04:53:41 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EF1C061762
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jul 2021 01:51:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gt10so13615460ejc.5
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jul 2021 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2hZDbhzwGX9kWfxCBAugnLmxlu3o193w9jwXoOQczC8=;
        b=CsCuXj+gcxFBvjzR/MTd+JCH7GUvrCizkIpUDgxlL8A+yYFyqov/maL+2eSfzQJzR1
         T+xzLMxVk1UIGt/JHzbqN4V5n3URHRnvaQkE2b2DEYTEojUjSxyothw79hbZcYS+NhZ8
         f9MrIYEvjuCU86ZW2yO1vm959squjd7Bnm25MjWyzQvQx/ClBli1EuHaaEouoFAv1N+R
         T0iarGPYuo5fonoXOreZQoSN4WCKGdTnMIqJCdW8dROJJATriXW0pq68CGQh1H0gEBHz
         HOo8Y5Z+qyf46i6n/wGSADOxYbnAhKWu1g0C0FKaMejz0iYZkUB/0fvWlAuDqU4HIX8U
         7beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2hZDbhzwGX9kWfxCBAugnLmxlu3o193w9jwXoOQczC8=;
        b=ukaq+g3n7jxDyRbEGHPQuc5KVgvAMWj/nmZym7dwLYdLU9zOuP8rwZI7j+dlPGxGyF
         AAOpktRharxOdm3Rxh1AObovprej2XvlucOG2okqCoM8MAVanLKoC3QzODpLl25NyrUL
         wcbeWqW04vkx/zOCq2eijXXNfCLesIUo5BZegWxhw8AeS4FQ24gGPT8oY9UPUfrlcACC
         viQjxlgGm5TPXJmJiEj6ffxD+8jc74Uf4zxrgo3MvBtLDV08yg8qGV6J+Uo+/WrzMx9Z
         a5RI47EFMHLBMpLyt4dN+gG17QZ+CVVX9j6v3i46QbMxzrjVP6RO7K/+hDB4fNRV9tFX
         xjtA==
X-Gm-Message-State: AOAM532m0lqxQqthAZ0YC+kOpc00utu60RQnVZBqskvgMSqxk39EnmFK
        2Bg1QcdhDdZjh+18tBwYHGMt1Co3a3bNnhO3MOWz+g==
X-Google-Smtp-Source: ABdhPJwoOlL8NgOl3ka/oMBrEFC6mYG0gyVKQgZ5LRaQic925FaCvhN/WIyU1zAJL/ebJkB+G3bRskVr8BK2oYi+ifU=
X-Received: by 2002:a17:906:58d6:: with SMTP id e22mr4230346ejs.64.1625215867782;
 Fri, 02 Jul 2021 01:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210621191830.10628-1-brgl@bgdev.pl> <20210621191830.10628-5-brgl@bgdev.pl>
 <20210627084757.GA21720@sol>
In-Reply-To: <20210627084757.GA21720@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Jul 2021 10:50:57 +0200
Message-ID: <CAMRc=Mc85NCQRWf7U4t=dtnH4fC=i8Z771aRuMtCdxcsXupaAA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 4/4] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 27, 2021 at 10:48 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

>
> And dislike converting the chip to a bool - it isn't intuitive that
> it should mean the underlying handle is open.  Provide a suitably named
> method instead, say is_open() or is_closed()?
>
> Similar comment for line_request.
>

It's actually a common pattern in STL. I find overloaded operators
more intuitive for checking the state of the wrapping object as
opposed to getters for reading the state and properties of the
associated GPIO chip character device stored in said object.

[snip]

> > +
> > +     /**
> > +      * @brief Retrieve the current snapshot of line information for a
> > +      *        single line.
> > +      * @param offset Offset of the line to get the info for.
> > +      * @param watch Indicates whether the caller wants to watch for line
> > +      *              info changes.
> > +      * @return New ::gpiod::line_info object.
> > +      */
> > +     line_info get_line_info(unsigned int offset, bool watch = false) const;
> > +
>
> What is the benefit of the watch option here?
> It is clearer to keep the get_line_info() and watch_line_info() distinct,
> as they are in the C API.
>

Actually I would have used this pattern in the C API if I could
overload functions or provide default values for arguments.
watch_line_info(0) is just a helper for get_line_info(0, true). I
would even be fine with just get_line_info() alone with a switch for
watching the lines but since we already have gpiod_watch_line_info(),
I decided to replicate it here.

[snip]

> > +
> > +     /**
> > +      * @brief Constructor.
> > +      * @param direction Global direction setting.
> > +      * @param output_values Default output values.
> > +      * @param edge Global edge detection.
> > +      * @param bias Global bias setting.
> > +      * @param drive Global drive setting.
> > +      * @param active_low Global active_low setting.
> > +      * @param debounce_period Global debounce period in microseconds.
> > +      * @param event_clock Default event clock mode.
> > +      */
> > +     line_config(int direction = DIRECTION_INPUT,
> > +                 const line_value_mappings& output_values = no_output_values,
> > +                 int edge = EDGE_NONE, int bias = BIAS_AS_IS,
> > +                 int drive = DRIVE_PUSH_PULL, bool active_low = false,
> > +                 unsigned long debounce_period = 0,
> > +                 int event_clock = EVENT_CLOCK_MONOTONIC);
> > +
>
> The parameter ordering should follow the probability of use?
> So I would make active_low earlier, before edge and output_values.
> And maybe output_values after edge?
>

Yeah this was my goal. active_low could come before bias and drive but
after output_values IMO. edge could come earlier too (before
output_values).

[snip]

> > +
> > +     /**
> > +      * @brief Set the output values for a set of line offsets.
> > +      * @param offsets Vector of line offsets for which to set output values.
> > +      * @param values Vector of new line values with indexes of values
> > +      *               corresponding to the indexes of offsets.
> > +      */
> > +     void set_output_values(const line_offsets& offsets, const line_values& values) const;
> > +
>
> Painful that the user has to keep track of the offsets independent of
> the request.  Any way to provide a method that applies values to the
> requested lines without explicitly providing the offsets?
> See related get_values() comments below...
>

I think we already discussed this under the C API patches. The line
config object can live independently from the request config. We could
theoretically pass an array containing just values (with the value at
given index later assigned to the offset at the same index in the
request config) but that would make it less clear IMO. In most cases
the user will already have an array containing the offsets ready in
order to pass it to the request method. I think you mentioned
previously some Go feature that allowed you to do it differently but
in C it's not really possible.

> And in general, what happens if the offsets provided aren't a subset of
> the requested offsets?  That applies to the C API as well.
>

At request-time we'll return EINVAL from set_kernel_output_values()
(or in the case of C++ - we'll throw a system_error exception).

[snip]

> > +
> > +     /**
> > +      * @brief Check if this line is debounced (either by hardware or by the
> > +      *        kernel software debouncer).
> > +      * @return True if the line is debounced, false otherwise.
> > +      */
> > +     bool debounced(void) const noexcept;
> > +
>
> Not sure if I had the same comment for the C API, but what is the
> benefit of this given it is equivalent to debounce_period() == 0?
>

Clarity of the resulting code.

if (info.debounced())

is clearer than

if (info.debounce_period())

if you're only checking if debouncing is enabled and not what the period is.

[snip]

> > +
> > +     /**
> > +      * @brief Check if the object is associated with an open GPIO chip.
> > +      * @return True if the chip is open, false if it has been closed.
> > +      */
> > +     explicit operator bool(void) const noexcept;
>
> This is even less intuitive than for chip.
> It could mean chip is open, or line is requested, or ...
> So make it a method with an appropriate name instead.
>

Well it would be much less confusing if I didn't stupidly copy-paste
the comment from the chip... It was supposed to say: Check if this
request hasn't been released or something along those lines.

[snip]

> > +
> > +     /**
> > +      * @brief Read the values of a subset of requested lines.
> > +      * @param offsets Vector of line offsets
> > +      * @return Vector of lines values with indexes of values corresponding
> > +      *         to those of the offsets.
> > +      */
> > +     line_values get_values(const line_offsets& offsets) const;
> > +
>
> A common use case would be to get all lines in the request.
> As written, to do that the user needs to maintain their own copy of the
> offsets.
>
> Maybe if offsets is empty then returns all requested lines?  And provide
> line_offsets() as a default parameter?
>
> Same argument applies for the C API.
> In gpiod.h you could rename the existing _get_values() to
>
> int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
>                                   unsigned num_lines,
>                                   const unsigned int *offsets, int *values);
>
> and add
>
> int gpiod_line_request_get_values(struct gpiod_line_request *request, int *values);
>
> Or interpret a zero offsets param to mean use the requested offsets??
>

Hmm, I can't find it now but I could swear we discussed this
previously and you raised some issue with this. I'm definitely in
favor of that so let me add it in the next iteration.

[snip]

> > +
> > +     /**
> > +      * @brief Constructor.
> > +      * @param offsets Vector of line offsets to request.
> > +      * @param consumer Consumer name.
> > +      * @param event_buffer_size Event buffer size.
> > +      */
> > +     request_config(const line_offsets& offsets = line_offsets(),
> > +                    const ::std::string& consumer = ::std::string(),
> > +                    unsigned int event_buffer_size = 0);
> > +
>
> When would you call this without providing offsets?

This is to mirror the C API which allows to create an empty request
config. If the user never sets the offsets, we'll catch that at
request-time.

[snip]

For any issues I didn't address explicitly - I'll fix them in v2.

Bart

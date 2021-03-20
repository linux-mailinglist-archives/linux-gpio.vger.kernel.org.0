Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB37342C9B
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Mar 2021 12:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhCTL5H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Mar 2021 07:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhCTL4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Mar 2021 07:56:49 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13ABC061764
        for <linux-gpio@vger.kernel.org>; Sat, 20 Mar 2021 04:56:48 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 16so15097139ljc.11
        for <linux-gpio@vger.kernel.org>; Sat, 20 Mar 2021 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iW6uEND/ee4z9nsY45Ct1nMMtCxhIAfu1tQ3+1cotts=;
        b=wLwkmsu6NNP9mQmkjv7ejqH3OpzE5jvfSZulXF8H1sT0nER01jIDIk0grBkN7izpfg
         MHgQQW7XPoLPZBFD8vBlF7SW1DvimWMx1aX66Md7W2VStJr4obJPegLzrZw6lX/nP6Kq
         cdCoYEUXKjzGSLe9DEtRGU+k2Iu8PlwWEJa7KbXCzi4hl1IhIk44mWa0CalP++vSFhY+
         /tUpBFYE9GQfcGcGtVkj+zxeJxGNcNn6VyaQJL7ShZ6o+ch1zrbkAoAsmjU4UXLpW16L
         KL8YI0PwwwdOMV7OwMtMLsgr2F7RgXpuGAXFQ/xT4jXCpvn/zdJwyqyGe21LaZ5c7b7x
         x4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iW6uEND/ee4z9nsY45Ct1nMMtCxhIAfu1tQ3+1cotts=;
        b=C5fgPS3VG3+rZWJz2Yk5YNVN8Tdi+zhCVedlmwIeLy7PN2wts3/ik+Hv09/7nk/1bm
         7sbTw/rPuP2vD/sNpFhUWGvxuaEDJUFUqI9t87gcQ1boUJkegxeTRmWir5a/6N0dWdg2
         We9mqOtTP4g30bS0JCRntdcet3AfYemfooM/Jzot8LEZom7zS/1bbpruC4onUFx1C8sT
         F6oCgzM15lsVySZh22JMsD6g4eHnseMRfaArBwKZWgSMNt1TaywpNGEQi/+yaXJ1Kr8h
         qqg0giOwGz/InbT8wJaeqnZHvWntHGtbkYOcFiAzljm2PIJfYFwYxDXly5cu3QoUK2CA
         +Ydg==
X-Gm-Message-State: AOAM530lpSUcO7Jeac57GiUDsCZqvfJgFMkz7GMYjns0Ps43pWw/T5JB
        k3FA5kIQ7R8yeiiSwwUMZ3CE1P2fL9LSjP7Fzo9iMA==
X-Google-Smtp-Source: ABdhPJwdjVzdoOUIJtObxXpHfomqNMu4Yq3LhqEj2HbyPDWAppADtpsaQ5K2UAmEFo0J18YzoWQIissduevPOMwXjSM=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr3444104ljj.467.1616241407174;
 Sat, 20 Mar 2021 04:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
In-Reply-To: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Mar 2021 12:56:36 +0100
Message-ID: <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
Subject: Re: GTE - The hardware timestamping engine
To:     Dipen Patel <dipenp@nvidia.com>, Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dipen,

thanks for your mail!

I involved some other kernel people to get some discussion.
I think Kent Gibson can be of great help because he is using
GPIOs with high precision.

We actually discussed this a bit when adding support for
realtime timestamps.

On Wed, Mar 17, 2021 at 11:29 PM Dipen Patel <dipenp@nvidia.com> wrote:

> Nvidia Tegra SoCs have generic timestamping engine (GTE) hardware module which
> can monitor SoC signals like IRQ lines and GPIO lines for state change, upon
> detecting the change, it can timestamp and store in its internal hardware FIFO.
> The advantage of the GTE module can be realized in applications like robotics
> or autonomous vehicle where it can help record events with precise timestamp.

That sounds very useful.

Certainly the kernel shall be able to handle this.

> ============
> For GPIO:
> ============
> 1.  GPIO has to be configured as input and IRQ must be enabled.
> 2.  Ask GPIO controller driver to set corresponding timestamp bit in the
>     specified GPIO config register.
> 3.  Translate GPIO specified by the client to its internal bitmap.
> 3.a For example, If client specifies GPIO line 31, it could be bit 13 of GTE
>     register.
> 4.  Set internal bits to enable monitoring in GTE module
> 5.  Additionally GTE driver can open up lanes for the user space application
>     as a client and can send timestamping events directly to the application.

I have some concerns:

1. GPIO should for all professional applications be used with the character
device /dev/gpiochipN, under no circumstances shall the old sysfs
ABI be used for this. In this case it is necessary because the
character device provides events in a FIFO to userspace, which is
what we need.

The timestamp provided to userspace is an opaque 64bit
unsigned value. I suppose we assume it is monotonic but
you can actually augment the semantics for your specific
stamp, as long as 64 bits is gonna work.

2. The timestamp for the chardev is currently obtained in
drivers/gpio/gpiolib-cdev.c like this:

static u64 line_event_timestamp(struct line *line)
{
        if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
                return ktime_get_real_ns();

        return ktime_get_ns();
}

What you want to do is to add a new flag for hardware timestamps
and use that if available. FLAG_EVENT_CLOCK_HARDWARE?
FLAG_EVENT_CLOCK_NATIVE?

Then you need to figure out a mechanism so we can obtain
the right timestamp from the hardware event right here,
you can hook into the GPIO driver if need be, we can
figure out the gpio_chip for a certain line for sure.

So you first need to augment the userspace
ABI and the character device code to add this. See
commit 26d060e47e25f2c715a1b2c48fea391f67907a30
"gpiolib: cdev: allow edge event timestamps to be configured as REALTIME"
by Kent Gibson to see what needs to be done.

3. Also patch tools/gpio/gpio-event-mon.c to support this flag and use that
for prototyping and proof of concept.

> ============
> For IRQ:
> ============

Marc Zyngier and/or Thomas Gleixner know this stuff.

It does make sense to add some infrastructure so that GPIO events
and IRQs can use the same timestamping hardware.

And certainly you will also want to use this timestamp for
IIO devices? If it is just GPIOs and IRQs today, it will be
gyroscopes and accelerometers tomorrow, am I right?

Yours,
Linus Walleij

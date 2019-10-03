Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5938BC9EC7
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 14:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfJCMrz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 08:47:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34750 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJCMrz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 08:47:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id j19so2618546lja.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FGp9wAJ42zhfAGWZxqPLunXNRzcYrwMXSYpZHTm4UyA=;
        b=S0ZeIOrz16krY9mBXHFWV7HxsQyT2s2czDIqzPccbuk/Sse6TuY9535mg3Ih4AIuTL
         XLQaqMYlZ/I6g2PFcc8wDDmmPi7i+61EjVu/8Xvdhb9mTS0thP9xuJUTwhxZknrI2ehF
         ZRL2qrdDwgLs/IOIQ3JZo0cEEigoR0Ys66R+s/HiDkysnY/wsPPqezUIMtXD/MYpXKXR
         4w7nxp9xBIbffyuQgztW8RwtBRtN+7BJdrqcuJsPfjbudXtXl6+6cU5EsYy9qRCMVLXb
         Dq0b2n7qvdPpkKtYX4jVtpKGrqNre97slwbztTbMEDDduIr9SIWNqaXXWxgB+HxteRWN
         scjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FGp9wAJ42zhfAGWZxqPLunXNRzcYrwMXSYpZHTm4UyA=;
        b=nY5ULIM9Pvf2qVeEGhfJrSOkbkLomIl6vltBBHnk3A5SEBVXwbZp71YxcBujfPQZxu
         G+EVY3cWHRrKaTsjUuqDzGHGlMh9680IocY889iy5hRT647JY1Wx9bmGdyYiyDx1UZyu
         exFv952urImIpuBBaIVdBwAWFwN/lWKjEDl6K1OwXBNs9X31BU6yrLn3pKVNf35sLsZW
         tm+zGdwzD9wIh1rcsKAuOG6kh1teLxtBSHOkLoc9CIwPAAu15wg5P79U/tp9juMP0hxC
         5vr+DS3k/Yxf9HlrzvLHBnPdUh5stbKxabdQcL3S+gUCAT/v/K/aIhSMV5CWx7i5C7cs
         H/DA==
X-Gm-Message-State: APjAAAUrMe7Iu36yTa74TRfVj1FueAepYtIlZHrOfrQdDcuFOv5fosu5
        ycD82MeXSdvaJH7/k1pg13Q58utRSZ82ZYEzdRJOUoHbCWrC/w==
X-Google-Smtp-Source: APXvYqziEMLuY88PqqMgL4QBg7+5AFQsB0+wZ6DbVZlqfTHXhCxWbsgq5VYz5ttYI3h14ROGRwGScrnPmBfgnICCPMk=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr5265383ljc.99.1570106872654;
 Thu, 03 Oct 2019 05:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
In-Reply-To: <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 14:47:41 +0200
Message-ID: <CACRpkdZjswY4zW232ahSQSGfprbgBx8YL4Wb0i3ebegT00v3jQ@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 23, 2019 at 10:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> I remember discussing it with Linus some time ago. This may not be as
> straightforward as simply adding new flags. Since PULL-UP/DOWN
> resistors can - among other parameters - also have configurable
> resistance, we'll probably need some kind of a structure for this
> ioctl() to pass any additional information to the kernel. Since we
> can't change ABI this may require adding a whole new ioctl() for
> extended configuration. This in turn has to be as future-proof as
> possible - if someone asks for user-space-configurable drive-strength,
> the new ioctl() should be ready for it.
>
> I should have some bandwidth in the coming days, so I'll try to give it a try.

What we did for the in-kernel API and the Device Tree ABI
was to simply say that if you need such elaborate control over
the line, it needs to be done with a proper pin control driver.

So for lines that just have the GPIO_PULL_UP or
GPIO_PULL_DOWN set as a (one-bit) flag, what you will
get is "typical" pull down/up (whatever the hardware default
is, or what the driver thinks is default, which should be safe
so the highest possible pull resistance I suppose).

So one option is to just go with these flags and explicitly
say that it will give a "system default (high resistance)
pull up/down".

That said, the pin controller back-end is fully capable of
accepting more elaborate configuration, so if we prefer then
we can make the more complex userspace ABI that can
set it to a desired-or-default resistance.

I lean toward simplicity here. I haven't seen that these
userspace consumers need very elaborate control of this
resistance, they are for one-off hacks and as such should
be fine with just default pull up/down I think?

I  think that specifying "this line will use pull up/down"
at request time and having the driver set a safe default
pull-up/down as response, (and pretty much what this
patch does) and then add another explicit
ioctl to refine it the day we need it is a viable way forward.

 in the future something like:
#define GPIOHANDLE_SET_LINE_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct
gpiohandle_config)

And then, when we need it, try to come up with some
really flexible ABI for the config, based on
include/linux/pinctrl/pinconf-generic.h

But no upfront code for that right now as it is not needed.
A practical usecase must come first.

Yours,
Linus Walleij

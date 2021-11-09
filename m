Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBE044ABF4
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbhKIK5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:57:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:51000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231245AbhKIK5Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:57:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1E5661054;
        Tue,  9 Nov 2021 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636455278;
        bh=W251XsAp8Cw2eL4WEeJqSLr+A4qqVxuGmwtlabntJ5k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rTuyHPn1foYsNauv+hGn29pD941J0CDW2dgW1zkwQS+tkG14kdwqyoHrToBXfWeXl
         sBke+yIPG6Qug+yfnrBsfgsgQauHgKGWo8opD//N59ueodjWBixw3G9DI1eQZdjl7x
         cc5z7dFljgBjsKY8nuWJvzieBwBlwWzeFsg/T9QoIfPwPNx7ppDI4vrmMGikzZSIXo
         kGGtpauhVqAfZRuv1JEIWrXN2VOcNWfl841kax0RM2WH7TXzEN/Qs7Y7xk0317zrHG
         j6TYEwTiq6lkjTS/H9x3DED+p9qWx4npC4etYenJU7w+MsYye4LFEOKQGSmwp33g7e
         qUQVyohkfiy/A==
Received: by mail-wr1-f53.google.com with SMTP id w29so20658480wra.12;
        Tue, 09 Nov 2021 02:54:38 -0800 (PST)
X-Gm-Message-State: AOAM531qxBNNOH0q3JdsjviT39oyFrnefyDeWwXv3BC/Yt8ArfrbMCgt
        OcP03mZp0SrJETz7aVY04YDj6+8QFUG528g5y9o=
X-Google-Smtp-Source: ABdhPJyEKLY0YD4n5POboDrv3HklQ9ZyTPgv0hHkudxzQdKOgcjRQXRNNBJyy4AH4rI02TLJTFn/WqCujC4mkrQHm8I=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr7975661wrd.369.1636455277446;
 Tue, 09 Nov 2021 02:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-8-arnd@kernel.org>
 <YYpOPs+/RuUq+ld8@smile.fi.intel.com>
In-Reply-To: <YYpOPs+/RuUq+ld8@smile.fi.intel.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 9 Nov 2021 11:54:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0F3c_PdYWX62w+8uBa=OS9f-a-OJ3b+_KscRTf3-9CJQ@mail.gmail.com>
Message-ID: <CAK8P3a0F3c_PdYWX62w+8uBa=OS9f-a-OJ3b+_KscRTf3-9CJQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] gpiolib: remove gpio_to_chip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 11:32 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> >  #ifdef CONFIG_GPIOLIB
>
> I'm wondering if we need this ifdeffery at all.

We don't need it for the first half (gpio_set_value, gpio_direction_input, ...),
which could just be unconditional wrappers around the gpiod versions.
Removing that #ifdef would require always including linux/gpio/consumer.h
here, so we'd no longer get a build failure when a driver uses gpiod_*
without including that directly (when GPIOLIB is disabled).

I actually had a patch in my series to do this, but dropped that because
the second half (gpio_request/gpio_free/...) does need the #ifdef

         Arnd

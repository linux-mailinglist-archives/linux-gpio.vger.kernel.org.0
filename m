Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C15314F8A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 13:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhBIMzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 07:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhBIMzb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 07:55:31 -0500
Received: from forward104j.mail.yandex.net (forward104j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE96C061786;
        Tue,  9 Feb 2021 04:54:50 -0800 (PST)
Received: from sas1-892da86383b1.qloud-c.yandex.net (sas1-892da86383b1.qloud-c.yandex.net [IPv6:2a02:6b8:c08:78a8:0:640:892d:a863])
        by forward104j.mail.yandex.net (Yandex) with ESMTP id C24094A0464;
        Tue,  9 Feb 2021 15:54:48 +0300 (MSK)
Received: from sas1-e20a8b944cac.qloud-c.yandex.net (sas1-e20a8b944cac.qloud-c.yandex.net [2a02:6b8:c14:6696:0:640:e20a:8b94])
        by sas1-892da86383b1.qloud-c.yandex.net (mxback/Yandex) with ESMTP id rXEwkRAyZa-smHquRRP;
        Tue, 09 Feb 2021 15:54:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612875288;
        bh=wsmCrC73w7L8x4wvEV08PkQ90wgiWyt3RHKlESAg/Jg=;
        h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
        b=cvtQhXUxr9fdQANb2YxitspbNYvE4OPIOvfrsQEOFAT8/3/LxbM3Nq4utZaM2EKEp
         CwKvwlUl0ByBBnSV9qaEKPcdam6YHyOoorzCdR3dLngzkb5JuIrZt2Xk/LDHLFMDnL
         yIv6AOdoUK803Ln98e9e8niFNjoX64gaeAXLONws=
Authentication-Results: sas1-892da86383b1.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-e20a8b944cac.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id iwI8zaxa5c-slnCdvA3;
        Tue, 09 Feb 2021 15:54:48 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
Date:   Tue, 09 Feb 2021 15:54:47 +0300
Message-ID: <2202252.ElGaqSPkdT@redslave>
In-Reply-To: <CAHp75VeW6EWrGPbzBrSPry9Lb8GDvA-C-mkCvmJMTVPeeVxjKg@mail.gmail.com>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me> <5450294.DvuYhMxLoT@redslave> <CAHp75VeW6EWrGPbzBrSPry9Lb8GDvA-C-mkCvmJMTVPeeVxjKg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tuesday, 9 February 2021 15:46:19 MSK Andy Shevchenko wrote:
>On Tue, Feb 9, 2021 at 2:35 PM Nikita Shubin 
<nikita.shubin@maquefel.me> wrote:
>> On Monday, 8 February 2021 16:20:17 MSK Andy Shevchenko wrote:
>> >On Mon, Feb 8, 2021 at 11:00 AM Nikita Shubin
>> 
>> <nikita.shubin@maquefel.me> wrote:
>...
>
>> >> +static void ep93xx_init_irq_chip(struct device *dev, struct
>> >> irq_chip
>> >> *ic, const char *label) +{
>> >> 
>> >> +       ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s",
>> >> label);
>> >
>> >Is the label being NULL okay?

You mean ENOMEM should be honored ? I think you are right about it.

>> 
>> The label is taken from ep93xx_gpio_banks[], so unless we explicitly
>> pass zero to ep93xx_init_irq_chip(), we are ok.
>
>Maybe I was unclear, let me rephrase: Is the *resulting* label being
>NULL okay?
>> >> +       ic->irq_ack = ep93xx_gpio_irq_ack;
>> >> +       ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
>> >> +       ic->irq_mask = ep93xx_gpio_irq_mask;
>> >> +       ic->irq_unmask = ep93xx_gpio_irq_unmask;
>> >> +       ic->irq_set_type = ep93xx_gpio_irq_type;
>> >> +}





Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0E008D46F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 15:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfHNNRx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 09:17:53 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:36620 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbfHNNRx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 09:17:53 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 01163A1A26;
        Wed, 14 Aug 2019 15:17:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id 7e36EJC2uQid; Wed, 14 Aug 2019 15:17:45 +0200 (CEST)
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190808132543.26274-1-sr@denx.de>
 <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
 <CAMuHMdXP8K+yvUHrjnegnNuViG3YsCAD=PxTsDHJcTLRRjJguQ@mail.gmail.com>
 <CACRpkdZqFGyZETZBoo6xSE9FSMpsbinLquX=4M=2FghdLMxWKw@mail.gmail.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <2f78c3f4-08a4-480e-ff70-8526d0a671ba@denx.de>
Date:   Wed, 14 Aug 2019 15:17:44 +0200
MIME-Version: 1.0
In-Reply-To: <CACRpkdZqFGyZETZBoo6xSE9FSMpsbinLquX=4M=2FghdLMxWKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14.08.19 10:48, Linus Walleij wrote:
> On Mon, Aug 12, 2019 at 1:18 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Sat, Aug 10, 2019 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
>>>> Add a helper macro to enable the interation over all supported GPIO
>>>> suffixes (currently "gpios" & "gpio"). This will be used by the serial
>>>> mctrl code to check, if a GPIO property exists before requesting it.
>>>>
>>>> Signed-off-by: Stefan Roese <sr@denx.de>
>>>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> Cc: Pavel Machek <pavel@denx.de>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>
>>> I really like this patch, it makes things so much more readable.
>>
>> Do we really need to spread this *-gpio" legacy support all over the kernel?
> 
> Not really :/
> 
> Isn't it possible to use something like gpiod_count(dev, "foo") to
> check for any GPIOs instead?

Good idea. I can rework my patch to use gpiod_count() to check if the
GPIO exists before requesting it. This way, we're not spreading the
legacy "-gpio" support any more.

But I'm unsure, if I should change the string malloc (kasprintf) to the
fixed length string on the stack as I've done in this patch version.

Thanks,
Stefan

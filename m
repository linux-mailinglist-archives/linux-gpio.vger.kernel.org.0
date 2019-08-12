Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7685189D5E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 13:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbfHLLyG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 07:54:06 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:18160 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728196AbfHLLyG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 07:54:06 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id CF956A3267;
        Mon, 12 Aug 2019 13:54:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id NAsPxTcQt1xs; Mon, 12 Aug 2019 13:53:53 +0200 (CEST)
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190808132543.26274-1-sr@denx.de>
 <20190808132543.26274-2-sr@denx.de>
 <CAMuHMdUzry6f_AqcjevgSRgJ2Q8Nqr_kEyYz+1QEVft6BTrC2g@mail.gmail.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <ad77e973-912f-5ff3-9dd4-610695ec57eb@denx.de>
Date:   Mon, 12 Aug 2019 13:53:52 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUzry6f_AqcjevgSRgJ2Q8Nqr_kEyYz+1QEVft6BTrC2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On 12.08.19 13:17, Geert Uytterhoeven wrote:
> Hi Stefan,
> 
> On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
>> This patch fixes a backward compatibility issue, when boards use the
>> old style GPIO suffix "-gpio" instead of the new "-gpios". This
>> potential problem has been introduced by commit d99482673f95 ("serial:
>> mctrl_gpio: Check if GPIO property exisits before requesting it").
>>
>> This patch now fixes this issue by iterating over all supported GPIO
>> suffixes by using the newly introduced for_each_gpio_suffix() helper.
>>
>> Also, the string buffer is now allocated on the stack to avoid the
>> problem of allocation in a loop and its potential failure.
>>
>> Signed-off-by: Stefan Roese <sr@denx.de>
> 
> Do we really need to spread this *-gpio" legacy support all over the kernel?
> 
> Seeing the only in-kernel users of legacy "rts-gpio" are
> 
>      arch/arm/boot/dts/am335x-nano.dts:      rts-gpio = <&gpio0 13
> GPIO_ACTIVE_HIGH>;
>      arch/arm/boot/dts/am335x-nano.dts:      rts-gpio = <&gpio2 15
> GPIO_ACTIVE_HIGH>;
>      arch/arm/boot/dts/am335x-pdu001.dts:    rts-gpio = <&gpio1 9
> GPIO_ACTIVE_HIGH>;
> 
> and this is handled by omap-serial.c, predating mctrl_gpio, I'd like to
> reconsider.
> 
> Documentation/devicetree/bindings/serial/serial.txt always described
> the "*-gpios"
> variants, so there should be no users of the legacy "*-gpio" variants.

Hmmm, you were the one to comment about supporting (not breaking) the
"-gpio" variant:

https://lkml.org/lkml/2019/6/24/248

That was my main motivation to work on this patch.

If we all agree, that only the documented "-gpios" variant needs to
be supported, then we can drop this patch.

Thanks,
Stefan

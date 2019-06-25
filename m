Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F03EB522D0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 07:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfFYF1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 01:27:50 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:13500 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfFYF1u (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 01:27:50 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id 75AFD5000F;
        Tue, 25 Jun 2019 07:27:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id Hz6CaGAM_QKI; Tue, 25 Jun 2019 07:27:41 +0200 (CEST)
Subject: Re: [PATCH 1/2 v9] serial: mctrl_gpio: Check if GPIO property exisits
 before requesting it
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Giulio Benetti <giulio.benetti@micronovasrl.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20190620062420.11650-1-sr@denx.de>
 <CAMuHMdXMpS_pg9N0qSW=Li0QavAMRG79RJcS4s0w6NTCxv_zzg@mail.gmail.com>
 <24bfb52c-6f77-b7cd-7421-9e6e4b0aa7d3@denx.de>
 <CAMuHMdWeX6=SuSPVUB=WaYMsUbrmg5sraM=APeXsqr_Yv6u4AA@mail.gmail.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <d8ae626b-e574-be33-f698-3cb992653683@denx.de>
Date:   Tue, 25 Jun 2019 07:27:33 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWeX6=SuSPVUB=WaYMsUbrmg5sraM=APeXsqr_Yv6u4AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On 24.06.19 17:35, Geert Uytterhoeven wrote:
> On Mon, Jun 24, 2019 at 5:29 PM Stefan Roese <sr@denx.de> wrote:
>> On 24.06.19 10:42, Geert Uytterhoeven wrote:
>>> On Thu, Jun 20, 2019 at 8:24 AM Stefan Roese <sr@denx.de> wrote:
>>>> This patch adds a check for the GPIOs property existence, before the
>>>> GPIO is requested. This fixes an issue seen when the 8250 mctrl_gpio
>>>> support is added (2nd patch in this patch series) on x86 platforms using
>>>> ACPI.
>>>>
>>>> Here Mika's comments from 2016-08-09:
>>>>
>>>> "
>>>> I noticed that with v4.8-rc1 serial console of some of our Broxton
>>>> systems does not work properly anymore. I'm able to see output but input
>>>> does not work.
>>>>
>>>> I bisected it down to commit 4ef03d328769eddbfeca1f1c958fdb181a69c341
>>>> ("tty/serial/8250: use mctrl_gpio helpers").
>>>>
>>>> The reason why it fails is that in ACPI we do not have names for GPIOs
>>>> (except when _DSD is used) so we use the "idx" to index into _CRS GPIO
>>>> resources. Now mctrl_gpio_init_noauto() goes through a list of GPIOs
>>>> calling devm_gpiod_get_index_optional() passing "idx" of 0 for each. The
>>>> UART device in Broxton has following (simplified) ACPI description:
>>>>
>>>>       Device (URT4)
>>>>       {
>>>>           ...
>>>>           Name (_CRS, ResourceTemplate () {
>>>>               GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>>>>                       "\\_SB.GPO0", 0x00, ResourceConsumer)
>>>>               {
>>>>                   0x003A
>>>>               }
>>>>               GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>>>>                       "\\_SB.GPO0", 0x00, ResourceConsumer)
>>>>               {
>>>>                   0x003D
>>>>               }
>>>>           })
>>>>
>>>> In this case it finds the first GPIO (0x003A which happens to be RX pin
>>>> for that UART), turns it into GPIO which then breaks input for the UART
>>>> device. This also breaks systems with bluetooth connected to UART (those
>>>> typically have some GPIOs in their _CRS).
>>>>
>>>> Any ideas how to fix this?
>>>>
>>>> We cannot just drop the _CRS index lookup fallback because that would
>>>> break many existing machines out there so maybe we can limit this to
>>>> only DT enabled machines. Or alternatively probe if the property first
>>>> exists before trying to acquire the GPIOs (using
>>>> device_property_present()).
>>>> "
>>>>
>>>> This patch implements the fix suggested by Mika in his statement above.
>>>>
>>>> Signed-off-by: Stefan Roese <sr@denx.de>
> 
>>>> --- a/drivers/tty/serial/serial_mctrl_gpio.c
>>>> +++ b/drivers/tty/serial/serial_mctrl_gpio.c
> 
>>>> @@ -116,6 +117,19 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
>>>>
>>>>           for (i = 0; i < UART_GPIO_MAX; i++) {
>>>>                   enum gpiod_flags flags;
>>>> +               char *gpio_str;
>>>> +               bool present;
>>>> +
>>>> +               /* Check if GPIO property exists and continue if not */
>>>> +               gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
>>>> +                                    mctrl_gpios_desc[i].name);
>>>
>>> This will silently break DTBs using "(cts|dsr|dcd|rng|rts|dtr)-gpio" instead
>>> of "(cts|dsr|dcd|rng|rts|dtr)-gpios".
>>
>> Should both options be supported ("cts-gpio" vs "cts-gpios")?
>> Documentation/devicetree/bindings/serial/serial.txt only mentions
>> the "-gpios" variant.
> 
> Well, the "-gpio" variant is deprecated, but still supported by
> devm_gpiod_get_index_optional(), and there are active users in upstream
> DTS files.
> 
> My main objection is (trying to) replicate the matching logic inside
> gpiolib.c, causing subtle semantic differences. And keeping it consistent,
> of course.
> 
> It would be nice if this could be fixed inside acpi_find_gpio(), so
> users don't need to be updated.  There may be other subsystems where
> the difference between DT and ACPI may cause issues, unbeknownst.

Sure, I can fix this. I would prefer to do this in a follow-up patch
though, if nobody objects.

Thanks,
Stefan

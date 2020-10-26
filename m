Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8192999EF
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 23:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394858AbgJZWyg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 18:54:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46848 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394840AbgJZWyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 18:54:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id n16so6880021pgv.13
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 15:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JPZe4tGB5FcgMQzpYM8I9QtdzyyzXVbJSYU7XCxZnCc=;
        b=uZJcxFTZxvlXwlecK+biS9uKuGjMAtY7kf9/hb27krh5ZQ7n6iSOBAOB0ONDI1i3pz
         jz4snNTHFLVkHY7UEGVyH6g6L5ZFYN67EczSTDyk0rPxKqrO1DYe5aiQGkGdcAU6qsUr
         vmMDTFEOsgVHWk93D7COblkfK3CtLp2qPPoWxBF2jc6JAP08LiG1is9YF9CxjJG/7FYz
         G7f21Pw99m0L5fuGukzM+vUUjvmdIWt1GqgxEMs4Dbm2t7X80ZV6pDt/hUpg880LjVnw
         wI8/Ot9gtOqIiaDhE6kBFKOGdRJNn7W/2kMeTEYEIoAnJ+chxOI7nZgwIO3iFkQbH7Nk
         kt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JPZe4tGB5FcgMQzpYM8I9QtdzyyzXVbJSYU7XCxZnCc=;
        b=ssEF2wziBB6NaXtN9qvZ0LRaJPt+aY/i8rxgVE2F6gNaxjXwvv5FX18rDhRF34zS3d
         1a0ry/CIjP04+6yRH5NByAlejQj8wwvJTx0ZUeuhDCyyXa5NeyWeAEG6prBQ679AA3DT
         COEZ/a8cz9LXNd/o3ovvMUrTlOhYXKpr2CZZXsyNssDAMnOTte6OC+osXvGCiP51sJQU
         UIx28azwJA59bTHTLNWMZjWVpah2tUmrZhek52agv/iI0tAvvzjZlU6j0d4VA9stum9l
         ZgEmfmH+kUCu65i3AMXzn26SHIKU2tmVANuXPK/5eeB7GZrjXdsPtfbh6rNoQMCRuDvf
         V+Zg==
X-Gm-Message-State: AOAM531E5Dol/yakCsj1cWa3rw1Exv8UuqMwdDhzSqWjdqRvcZ0jduzS
        gGj9pIX20GsqvUFBPXA7Rv8=
X-Google-Smtp-Source: ABdhPJzHttgfQQJnnI56sf47AnT3Ld0egH3VSObjXmaV82C/4CIKheLSxzZBkqXPTPmdya2hBlN1SQ==
X-Received: by 2002:a65:4cc1:: with SMTP id n1mr18282889pgt.404.1603752874454;
        Mon, 26 Oct 2020 15:54:34 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id cv6sm8981325pjb.2.2020.10.26.15.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 15:54:33 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Tue, 27 Oct 2020 06:54:00 +0800
To:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201026225400.37almqey2wxyazkn@Rk>
References: <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans and Linus,

Will you interpret the 0x0000 value for debounce timeout in GPIO
Interrupt Connection Resource Descriptor as disabling debouncing
filter?

GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}

I'm not sure if Windows' implementation is the de facto standard like
i2c-hid. But if we are going to conform to the ACPI specs and we would
regard 0x0000 debounce timeout as disabling debouncing filter, then we
can fix this touchpad issue and potentially some related issues by
implementing the feature of supporting configuring debounce timeout in
drivers/gpio/gpiolib-acpi.c and removing all debounce filter
configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
What do you think?

A favorable evidence is I've collected five DSDT tables when
investigating this issue. All 5 DSDT tables have an GpioInt specifying
an non-zero debounce timeout value for the edge type irq and for all
the level type irq, the debounce timeout is set to 0x0000.


GpioInt in 5 five collected DSDT tables
=======================================

$ grep -rIi -A1 gpioint 1/dsdt.dsl
              GpioInt (Edge, ActiveBoth, SharedAndWake, PullUp, 0x0BB8,
                  "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
              GpioInt (Level, ActiveLow, ExclusiveAndWake, PullNone, 0x0000,
                  "\\_SB.GPIO", 0x00, ResourceConsumer, _Y24,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
                      GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullNone, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
                      GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,

$ grep -rIi -A1 gpioint 2/dsdt.dsl
              GpioInt (Edge, ActiveBoth, SharedAndWake, PullUp, 0x0BB8,
                  "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,


$ grep -rIi -A1 gpioint 3/dsdt.dsl
                      GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x2710,
                          "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                          "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, _Y5B,
--
                      GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                          "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, _Y5D,

$ grep -rIi -A1 gpioint 4/dsdt.dsl
                      GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x2710,
                          "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                  GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                      "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
--
                          GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                              "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, _Y3F,
--
                          GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                              "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, _Y41,

$ grep -rIi -A1 gpioint 5/dsdt.dsl
              GpioInt (Edge, ActiveBoth, SharedAndWake, PullUp, 0x0BB8,
                  "\\_SB.GPIO", 0x00, ResourceConsumer, ,
--
              GpioInt (Level, ActiveLow, ExclusiveAndWake, PullNone, 0x0000,
                  "\\_SB.GPIO", 0x00, ResourceConsumer, _Y24,
--
                  GpioInt (Level, ActiveLow, Exclusive, PullNone, 0x0000,
                      "\\_SB.GPIO", 0x00, ResourceConsumer, ,
On Wed, Oct 14, 2020 at 01:46:14PM +0200, Hans de Goede wrote:
>Hi,
>
>On 10/14/20 6:24 AM, Coiby Xu wrote:
>>On Tue, Oct 06, 2020 at 11:29:40AM +0200, Hans de Goede wrote:
>>>
>>>
>>>On 10/6/20 11:28 AM, Hans de Goede wrote:
>>>>Hi,
>>>>
>>>>On 10/6/20 10:55 AM, Hans de Goede wrote:
>>>>>Hi,
>>>>>
>>>>>On 10/6/20 10:31 AM, Coiby Xu wrote:
>>>>>>On Tue, Oct 06, 2020 at 08:28:40AM +0200, Hans de Goede wrote:
>>>>>>>Hi,
>>>>>>>
>>>>>>>On 10/6/20 6:49 AM, Coiby Xu wrote:
>>>>>>>>Hi Hans and Linus,
>>>>>>>>
>>>>>>>>I've found the direct evidence proving the GPIO interrupt controller is
>>>>>>>>malfunctioning.
>>>>>>>>
>>>>>>>>I've found a way to let the GPIO chip trigger an interrupt by accident
>>>>>>>>when playing with the GPIO sysfs interface,
>>>>>>>>
>>>>>>>>Ã‚Â - export pin130 which is used by the touchad
>>>>>>>>Ã‚Â - set the direction to be "out"
>>>>>>>>Ã‚Â - `echo 0 > value` will trigger the GPIO controller's parent irq and
>>>>>>>>Ã‚Â Ã‚Â  "echo 1 > value" will make it stop firing
>>>>>>>>
>>>>>>>>(I'm not sure if this is yet another bug of the GPIO chip. Anyway I can
>>>>>>>>manually trigger an interrupt now.)
>>>>>>>>
>>>>>>>>I wrote a C program is to let GPIO controller quickly generate some
>>>>>>>>interrupts then disable the firing of interrupts by toggling pin#130's
>>>>>>>>value with an specified time interval, i.e., set the value to 0 first
>>>>>>>>and then after some time, re-set the value to 1. There is no interrupt
>>>>>>>>firing unless time internal > 120ms (~7Hz). This explains why we can
>>>>>>>>only see 7 interrupts for the GPIO controller's parent irq.
>>>>>>>
>>>>>>>That is a great find, well done.
>>>>>>>
>>>>>>>>My hypothesis is the GPIO doesn't have proper power setting so it stays
>>>>>>>>in an idle state or its clock frequency is too low by default thus not
>>>>>>>>quick enough to read interrupt input. Then pinctrl-amd must miss some
>>>>>>>>code to configure the chip and I need a hardware reference manual of this
>>>>>>>>GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
>>>>>>>>since I couldn't find a copy of reference manual online? What would you
>>>>>>>>suggest?
>>>>>>>
>>>>>>>This sounds like it might have something to do with the glitch filter.
>>>>>>>The code in pinctrl-amd.c to setup the trigger-type also configures
>>>>>>>the glitch filter, you could try changing that code to disable the
>>>>>>>glitch-filter. The defines for setting the glitch-filter bits to
>>>>>>>disabled are already there.
>>>>>>>
>>>>>>
>>>>>>Disabling the glitch filter works like a charm! Other enthusiastic
>>>>>>Linux users who have been troubled by this issue for months would
>>>>>>also feel great to know this small tweaking could bring their
>>>>>>touchpad back to life:) Thank you!
>>>>>
>>>>>That is good to hear, I'm glad that we have finally found a solution.
>>>>>
>>>>>>$ git diff
>>>>>>diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>>>>>>index 9a760f5cd7ed..e786d779d6c8 100644
>>>>>>--- a/drivers/pinctrl/pinctrl-amd.c
>>>>>>+++ b/drivers/pinctrl/pinctrl-amd.c
>>>>>>@@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>>>>Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â  pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>>>>Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â  pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>>>>>Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â  pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>>>>>>-Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â  pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>>>>>>+Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â  /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>>>>>>Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â  irq_set_handler_locked(d, handle_level_irq);
>>>>>>Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â Ã‚Â  break;
>>>>>>
>>>>>>I will learn more about the glitch filter and the implementation of
>>>>>>pinctrl and see if I can disable glitch filter only for this touchpad.
>>>>>
>>>>>The glitch filter likely also has settings for how long a glitch
>>>>>lasts, which apparently goes all the way up to 120ms. If it would
>>>>>only delay reporting by say 0.1ms and consider any pulse longer
>>>>>then 0.1s not a glitch, then having it enabled would be fine.
>>>>>
>>>>>I don't think we want some sort of quirk here to only disable the
>>>>>glitch filter for some touchpads. One approach might be to simply
>>>>>disable it completely for level type irqs.
>>>>>
>>>>>What we really need here is some input from AMD engineers with how
>>>>>this is all supposed to work.
>>>>>
>>>>>E.g. maybe the glitch-filter is setup by the BIOS and we should not
>>>>>touch it all ?
>>>>>
>>>>>Or maybe instead of DB_TYPE_PRESERVE_HIGH_GLITCH low level interrupts
>>>>>should use DB_TYPE_PRESERVE_LOW_GLITCH ?Ã‚Â Ã‚Â  Some docs for the hw
>>>>>would really help here ...
>>>>
>>>>So I've been digging through the history of the pinctrl-amd.c driver
>>>>and once upon a time it used to set a default debounce time of
>>>>2.75 ms.
>>>>
>>>>See the patch generated by doing:
>>>>
>>>>git format-patch 8cf4345575a416e6856a6856ac6eaa31ad883126~..8cf4345575a416e6856a6856ac6eaa31ad883126
>>>>
>>>>In a linux kernel checkout.
>>>>
>>>>So it would be interesting to add a debugging printk to see
>>>>what the value of pin_reg & DB_TMR_OUT_MASK is for the troublesome
>>>>GPIO.
>>>>
>>>>I guess that it might be all 1s (0xfffffffff) or some such which
>>>>might be a way to check that we should disable the glitch-filter
>>>>for this pin?
>>>
>>>p.s.
>>>
>>>Or maybe we should simply stop touching all the glitch-filter
>>>related bits, in the same way as that old commit has already
>>>removed the code setting the timing of the filter ?
>>>
>>>At least is seems that forcing the filter to be on without
>>>sanitizing the de-bounce time is not a good idea.
>>>
>>Today I find an inconsistency in drivers/pinctrl/pinctrl-amd.c
>>so there must be a bug. As far as I can understand pinctrl-amd,
>>"pin_reg & ~DB_CNTRl_MASK" is used to mask out the debouncing
>>feature,
>>
>>static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
>>         unsigned debounce)
>>{
>>     ...
>>     if (debounce) {
>>         ...
>>         if (debounce < 61) {
>>             pin_reg |= 1;
>>             pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
>>             pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
>>         ...
>>         } else if (debounce < 1000000) {
>>             time = debounce / 62500;
>>             pin_reg |= time & DB_TMR_OUT_MASK;
>>             pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
>>             pin_reg |= BIT(DB_TMR_LARGE_OFF);
>>         } else {
>>             pin_reg &= ~DB_CNTRl_MASK;
>>             ret = -EINVAL;
>>         }
>>
>>     } else {
>>         ...
>>         pin_reg &= ~DB_CNTRl_MASK;
>>     }
>>     ...
>>}
>>
>>However in amd_gpio_irq_set_type, "ping_reg & ~(DB_CNTRl_MASK << DB_CNTRL_OFF)"
>>is used,
>>
>>static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>{
>>
>>     ...
>>     case IRQ_TYPE_LEVEL_LOW:
>>         pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
>>         pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>         pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>         pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>>         pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>>         irq_set_handler_locked(d, handle_level_irq);
>>         break;
>>     ...
>>}
>>
>>If "pin_reg & ~DB_CNTRl_MASK" is used instead, the touchpad will work
>>flawlessly. So I believe "pin_reg & ~DB_CNTRl_MASK" is the correct way
>>to mask out the debouncing filter and the bug lies in amd_gpio_set_type.
>
>I'm afraid that that is not the case, the current code is correct,
>it clears bit 5 and 6 of the register which are the bits which control
>the debounce type.
>
>You mentioned in an earlier mail that the value of the register is
>0x500e8 before this function runs.
>
>If you drop the "<< DB_CNTRL_OFF" part then instead you are masking out
>bits 0 and 1 which are already 0, so the mask becomes a no-op.
>
>>Btw, can you explain what's the difference between glitch filter and
>>debouncing filter?
>
>There is no difference the driver mixes the terms, but they both refer
>to the same thing this is most clear in the defines for the DB_CNTRL bits
>(bits 5 and 6 of the register):
>
>#define DB_TYPE_NO_DEBOUNCE               0x0UL
>#define DB_TYPE_PRESERVE_LOW_GLITCH       0x1UL
>#define DB_TYPE_PRESERVE_HIGH_GLITCH      0x2UL
>#define DB_TYPE_REMOVE_GLITCH             0x3UL
>
>Which is interesting because bits 5 and 6 are both 1 as set by the BIOS,
>so with your little hack to dro the "<< DB_CNTRL_OFF" you are in essence
>keeping bits 5 and 6 as DB_TYPE_REMOVE_GLITCH.
>
>So it seems that the problem is that the irq_set_type code changes
>the glitch filter type from DB_TYPE_REMOVE_GLITCH (filter out all
>glitches) to DB_TYPE_PRESERVE_HIGH_GLITCH, which apperently breaks
>things.
>
>To test this you could replace the:
>
>DB_TYPE_PRESERVE_HIGH_GLITCH
>
>bit in the case IRQ_TYPE_LEVEL_LOW path with:
>
>DB_TYPE_REMOVE_GLITCH
>
>Which I would expect to also fix your touchpad.
>
>If that is the case an interesting experiment would be to
>replace DB_TYPE_PRESERVE_HIGH_GLITCH with
>DB_TYPE_PRESERVE_LOW_GLITCH instead.
>
>I've never seen this kinda glitch/debounce filter where
>you can filter out only one type of level before, so
>I wonder if the code maybe simply got it wrong, also for
>a level type irq I really see no objection to just
>use DB_TYPE_REMOVE_GLITCH instead of the weird "half"
>filters.
>
>So I just ran a git blame and the DB_TYPE_PRESERVE_HIGH_GLITCH
>has been there from the very first commit of this driver,
>I wonder if it has been wrong all this time and should be
>inverted (so DB_TYPE_PRESERVE_LOW_GLITCH instead).
>
>I think we may want to just play it safe though and simply
>switch to DB_TYPE_REMOVE_GLITCH as we already do for all
>edge types and when amd_gpio_set_config() gets called!
>
>Linus, what do you think about just switching to
>DB_TYPE_REMOVE_GLITCH for level type irqs (unifying them
>with all the other modes) and not mucking with this weird,
>undocumented "half" filter modes ?
>
>>Or can you point to some references? I've gain some
>>experience about how to configure the GPIO controller by studying the
>>code of pinctrl-amd and pinctrl-baytrail (I can't find the hardware
>>reference manual for baytrail either). I also tweaked the configuration
>>in pinctrl-amd, for example, setting the debounce timeout to 976 usec
>>and 3.9 msec without disabling the glitch filter could also save the
>>touchpad. But I need some knowledge to understand why this touchpad [1]
>>which also uses the buggy pinctrl-amd isn't affected.
>>
>>[1] https://github.com/Syniurge/i2c-amd-mp2/issues/11#issuecomment-707427095
>
>My guess would be that it uses edge types interrupts instead ?
>I have seen that quite a few times, even though it is weird
>to do that for i2c devices.
>
>Regards,
>
>Hans
>

--
Best regards,
Coiby

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142792879FF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 18:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgJHQdH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 12:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgJHQdG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 12:33:06 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAF3C061755
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 09:33:06 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so4743488pgb.10
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KeC71O7Qbn7oSKZHAJyTnl7duHatYRAQ9MwGq49WJyQ=;
        b=oqqhxeqTAz1oOuI2TMq02kXN2DDBJUWO3nA4GGcZKZvWAMjQoVD7Mp8isEhae7uH3K
         eormaN2k7p+hXqycA+nxXgLHgbLob8So2Rf0869trQmsL9CN8/Nv9y2dmq1HxJhH16cx
         3pJ9713OG+rex5fIwgJxIwiVn7thMiQdo/DxAgm+rNKP9AwSRU3TIQDO/pVV++JPsy6d
         qKDpgnZV/wapuFNVsbrzfnnzFWZjjL5nPQ0khhno7sFO5um2dx6arJbOOzr3N7izCcEg
         3r/E1JPXZQFxSRRDf/HIoLw+2xSL8AUlXOBtwgNFQlAr6a/+fGg0EenS0gRYngcfDJdS
         o2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KeC71O7Qbn7oSKZHAJyTnl7duHatYRAQ9MwGq49WJyQ=;
        b=oWjrogl3wGcIVn1/pYX2zC95p95qDst0k3PG6ErF0fbT1meKxdhAulAFehCxmc0a/y
         q8iEksV9pCU+p9IRY5taQde+sOs/8wfAttbbYxx6wFrAkuQOfukIV23MaEeO+wwmyvCC
         dFpkmDqLxK1zBgQd5csqxO9ZcMDODAd05LrNYw8Cq63xT5FRVVyH4nwYKOlvOx/48dNq
         XXm9HBE+LXTReBGx13rnHpUgvdJJAg2IZK9dlCG2r8Umv9YLdkXGRmxLtH7NWuW/fDg8
         9cmsCkVVHqT175PAKN7M07SLYKbdhUbnPmddkrxGFY+Riwwfa6BDvDtTU7i9wfBeXI2e
         Yfbw==
X-Gm-Message-State: AOAM531dHIIOVB99SCNbUy2J0fANfHyEfHozlUoZsx0VD6ClYOs3Pz5M
        JBiioBmjQRH1heIVlzCUowY=
X-Google-Smtp-Source: ABdhPJynxI+clkNB6AJx76UrbEaWC/8f1Jm+2LN/9IX7s3SdycBXvw5IS9ZLn/BJNVhRyVs6cTgQ0Q==
X-Received: by 2002:a62:7895:0:b029:152:2640:644f with SMTP id t143-20020a6278950000b02901522640644fmr8071544pfc.67.1602174786194;
        Thu, 08 Oct 2020 09:33:06 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id s24sm7565097pjp.53.2020.10.08.09.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 09:33:05 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 9 Oct 2020 00:32:58 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201008163258.x5nytf574yjb3sop@Rk>
References: <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 06, 2020 at 11:29:40AM +0200, Hans de Goede wrote:
>
>
>On 10/6/20 11:28 AM, Hans de Goede wrote:
>>Hi,
>>
>>On 10/6/20 10:55 AM, Hans de Goede wrote:
>>>Hi,
>>>
>>>On 10/6/20 10:31 AM, Coiby Xu wrote:
>>>>On Tue, Oct 06, 2020 at 08:28:40AM +0200, Hans de Goede wrote:
>>>>>Hi,
>>>>>
>>>>>On 10/6/20 6:49 AM, Coiby Xu wrote:
>>>>>>Hi Hans and Linus,
>>>>>>
>>>>>>I've found the direct evidence proving the GPIO interrupt controller is
>>>>>>malfunctioning.
>>>>>>
>>>>>>I've found a way to let the GPIO chip trigger an interrupt by accident
>>>>>>when playing with the GPIO sysfs interface,
>>>>>>
>>>>>> - export pin130 which is used by the touchad
>>>>>> - set the direction to be "out"
>>>>>> - `echo 0 > value` will trigger the GPIO controller's parent irq and
>>>>>>   "echo 1 > value" will make it stop firing
>>>>>>
>>>>>>(I'm not sure if this is yet another bug of the GPIO chip. Anyway I can
>>>>>>manually trigger an interrupt now.)
>>>>>>
>>>>>>I wrote a C program is to let GPIO controller quickly generate some
>>>>>>interrupts then disable the firing of interrupts by toggling pin#130's
>>>>>>value with an specified time interval, i.e., set the value to 0 first
>>>>>>and then after some time, re-set the value to 1. There is no interrupt
>>>>>>firing unless time internal > 120ms (~7Hz). This explains why we can
>>>>>>only see 7 interrupts for the GPIO controller's parent irq.
>>>>>
>>>>>That is a great find, well done.
>>>>>
>>>>>>My hypothesis is the GPIO doesn't have proper power setting so it stays
>>>>>>in an idle state or its clock frequency is too low by default thus not
>>>>>>quick enough to read interrupt input. Then pinctrl-amd must miss some
>>>>>>code to configure the chip and I need a hardware reference manual of this
>>>>>>GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
>>>>>>since I couldn't find a copy of reference manual online? What would you
>>>>>>suggest?
>>>>>
>>>>>This sounds like it might have something to do with the glitch filter.
>>>>>The code in pinctrl-amd.c to setup the trigger-type also configures
>>>>>the glitch filter, you could try changing that code to disable the
>>>>>glitch-filter. The defines for setting the glitch-filter bits to
>>>>>disabled are already there.
>>>>>
>>>>
>>>>Disabling the glitch filter works like a charm! Other enthusiastic
>>>>Linux users who have been troubled by this issue for months would
>>>>also feel great to know this small tweaking could bring their
>>>>touchpad back to life:) Thank you!
>>>
>>>That is good to hear, I'm glad that we have finally found a solution.
>>>
>>>>$ git diff
>>>>diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>>>>index 9a760f5cd7ed..e786d779d6c8 100644
>>>>--- a/drivers/pinctrl/pinctrl-amd.c
>>>>+++ b/drivers/pinctrl/pinctrl-amd.c
>>>>@@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>>                 pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>>                 pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>>>                 pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>>>>-               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>>>>+               /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>>>>                 irq_set_handler_locked(d, handle_level_irq);
>>>>                 break;
>>>>
>>>>I will learn more about the glitch filter and the implementation of
>>>>pinctrl and see if I can disable glitch filter only for this touchpad.
>>>
>>>The glitch filter likely also has settings for how long a glitch
>>>lasts, which apparently goes all the way up to 120ms. If it would
>>>only delay reporting by say 0.1ms and consider any pulse longer
>>>then 0.1s not a glitch, then having it enabled would be fine.
>>>
>>>I don't think we want some sort of quirk here to only disable the
>>>glitch filter for some touchpads. One approach might be to simply
>>>disable it completely for level type irqs.
>>>
>>>What we really need here is some input from AMD engineers with how
>>>this is all supposed to work.
>>>
>>>E.g. maybe the glitch-filter is setup by the BIOS and we should not
>>>touch it all ?
>>>
>>>Or maybe instead of DB_TYPE_PRESERVE_HIGH_GLITCH low level interrupts
>>>should use DB_TYPE_PRESERVE_LOW_GLITCH ?   Some docs for the hw
>>>would really help here ...
>>
>>So I've been digging through the history of the pinctrl-amd.c driver
>>and once upon a time it used to set a default debounce time of
>>2.75 ms.
>>
>>See the patch generated by doing:
>>
>>git format-patch 8cf4345575a416e6856a6856ac6eaa31ad883126~..8cf4345575a416e6856a6856ac6eaa31ad883126
>>
>>In a linux kernel checkout.
>>
>>So it would be interesting to add a debugging printk to see
>>what the value of pin_reg & DB_TMR_OUT_MASK is for the troublesome
>>GPIO.
>>
>>I guess that it might be all 1s (0xfffffffff) or some such which
>>might be a way to check that we should disable the glitch-filter
>>for this pin?
>
>p.s.
>
>Or maybe we should simply stop touching all the glitch-filter
>related bits, in the same way as that old commit has already
>removed the code setting the timing of the filter ?
>
>At least is seems that forcing the filter to be on without
>sanitizing the de-bounce time is not a good idea.
>

One evidence I find that supports this is I can only find "debounce"
in ACPI Spec 6.1 and searching for "glitch" return nothing. Debounce
could be used to configure pin for interrupt,

GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
          ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData)
          {PinList}

>Regards,
>
>Hans
>

--
Best regards,
Coiby

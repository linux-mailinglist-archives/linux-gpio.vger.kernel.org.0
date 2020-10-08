Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00C22879F1
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 18:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbgJHQ0X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 12:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbgJHQ0X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 12:26:23 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28D1C061755
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 09:26:23 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e10so4430947pfj.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ueT925UaJXn+7sGQL/x68wHdFqIAG4KZ0mQr0NcLerw=;
        b=I9z6wa6wi5nclaMGTR+b95xPCBcUplbGljQ2OLTehQLtsd+gD+46O1GPrFCTRgWijs
         8Tj4PL+fFNgeJrV7BhpjIUi2m0GKiuxfpsuy74eDvCTFQCZnkhle+sI9/rtRkeNffX5P
         TcVbORxnczeLUHmNLNcqMQJvBmZ5Ig0d1VZZG+iQyRG8SvgkVNOjreXpmNFC1Ap9mSwg
         mPehQnbSbijfvkGjtxmxyYmnz5wlyEZINQcU9GchiqARw+EiTYjI9xsE0BvvgVSk4X+n
         TdncvOpeyQ5q0Ww5J4wZRPThrhXSsG8ZbO9QBq68gsPr+9dPXrBbl/q/UwmUL0xSm18o
         /1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ueT925UaJXn+7sGQL/x68wHdFqIAG4KZ0mQr0NcLerw=;
        b=Vj1rCqqbj0TGA8w9/8vtY4gTLghZwpSLArgPP3aALhpOPV8y21s7F+kL+a6430MwPO
         BvWJJadVgonupzz+RXuiuBHiNSHozwA7pgBw28t2A+F9AwdPjQWRB6wTfNA3Nxs/Sr+/
         Wn9ehl/y2pXL5b0BPKiHSG3M7u9XTYSISoUCTNpbGaCUc1V1wuGcDhTn9r7iLCJI2JWs
         PY5xejw6hc0jQqwo+pgFMnaJe4e0XfKdLMi6KiZMSKehL7DHm+xuLxe8jDauyDVA+ygp
         +tey8QGvViXWEpbW8g933DFoYl7f6q0bbz57d3CJACaVoHnMbUNHSSo79JkH6zpALpRJ
         YJFQ==
X-Gm-Message-State: AOAM530/8w2wfArMcE/ZUcT3bu5hgagCm9P0/kurIzr/xHx79YOWn7/6
        OZoCTZJ9bBjszIBCpymyAAk=
X-Google-Smtp-Source: ABdhPJwNJ5/zbFCF47cAlIDH+xsXFS/ZGrttCdYPbxfExX02BVAFyOWW0ud1HN/JVgmrZrhH2umg5Q==
X-Received: by 2002:a17:90b:4a8b:: with SMTP id lp11mr9086312pjb.53.1602174383001;
        Thu, 08 Oct 2020 09:26:23 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id q65sm7893018pfq.219.2020.10.08.09.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 09:26:22 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 9 Oct 2020 00:26:14 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201008162614.md4sw6ciodn7m5iw@Rk>
References: <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 06, 2020 at 11:28:06AM +0200, Hans de Goede wrote:
>Hi,
>
>On 10/6/20 10:55 AM, Hans de Goede wrote:
>>Hi,
>>
>>On 10/6/20 10:31 AM, Coiby Xu wrote:
>>>On Tue, Oct 06, 2020 at 08:28:40AM +0200, Hans de Goede wrote:
>>>>Hi,
>>>>
>>>>On 10/6/20 6:49 AM, Coiby Xu wrote:
>>>>>Hi Hans and Linus,
>>>>>
>>>>>I've found the direct evidence proving the GPIO interrupt controller is
>>>>>malfunctioning.
>>>>>
>>>>>I've found a way to let the GPIO chip trigger an interrupt by accident
>>>>>when playing with the GPIO sysfs interface,
>>>>>
>>>>> - export pin130 which is used by the touchad
>>>>> - set the direction to be "out"
>>>>> - `echo 0 > value` will trigger the GPIO controller's parent irq and
>>>>>   "echo 1 > value" will make it stop firing
>>>>>
>>>>>(I'm not sure if this is yet another bug of the GPIO chip. Anyway I can
>>>>>manually trigger an interrupt now.)
>>>>>
>>>>>I wrote a C program is to let GPIO controller quickly generate some
>>>>>interrupts then disable the firing of interrupts by toggling pin#130's
>>>>>value with an specified time interval, i.e., set the value to 0 first
>>>>>and then after some time, re-set the value to 1. There is no interrupt
>>>>>firing unless time internal > 120ms (~7Hz). This explains why we can
>>>>>only see 7 interrupts for the GPIO controller's parent irq.
>>>>
>>>>That is a great find, well done.
>>>>
>>>>>My hypothesis is the GPIO doesn't have proper power setting so it stays
>>>>>in an idle state or its clock frequency is too low by default thus not
>>>>>quick enough to read interrupt input. Then pinctrl-amd must miss some
>>>>>code to configure the chip and I need a hardware reference manual of this
>>>>>GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
>>>>>since I couldn't find a copy of reference manual online? What would you
>>>>>suggest?
>>>>
>>>>This sounds like it might have something to do with the glitch filter.
>>>>The code in pinctrl-amd.c to setup the trigger-type also configures
>>>>the glitch filter, you could try changing that code to disable the
>>>>glitch-filter. The defines for setting the glitch-filter bits to
>>>>disabled are already there.
>>>>
>>>
>>>Disabling the glitch filter works like a charm! Other enthusiastic
>>>Linux users who have been troubled by this issue for months would
>>>also feel great to know this small tweaking could bring their
>>>touchpad back to life:) Thank you!
>>
>>That is good to hear, I'm glad that we have finally found a solution.
>>
>>>$ git diff
>>>diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>>>index 9a760f5cd7ed..e786d779d6c8 100644
>>>--- a/drivers/pinctrl/pinctrl-amd.c
>>>+++ b/drivers/pinctrl/pinctrl-amd.c
>>>@@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>                 pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>                 pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>>                 pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>>>-               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>>>+               /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>>>                 irq_set_handler_locked(d, handle_level_irq);
>>>                 break;
>>>
>>>I will learn more about the glitch filter and the implementation of
>>>pinctrl and see if I can disable glitch filter only for this touchpad.
>>
>>The glitch filter likely also has settings for how long a glitch
>>lasts, which apparently goes all the way up to 120ms. If it would
>>only delay reporting by say 0.1ms and consider any pulse longer
>>then 0.1s not a glitch, then having it enabled would be fine.
>>
>>I don't think we want some sort of quirk here to only disable the
>>glitch filter for some touchpads. One approach might be to simply
>>disable it completely for level type irqs.
>>
>>What we really need here is some input from AMD engineers with how
>>this is all supposed to work.
>>
>>E.g. maybe the glitch-filter is setup by the BIOS and we should not
>>touch it all ?
>>
>>Or maybe instead of DB_TYPE_PRESERVE_HIGH_GLITCH low level interrupts
>>should use DB_TYPE_PRESERVE_LOW_GLITCH ?   Some docs for the hw
>>would really help here ...
>
>So I've been digging through the history of the pinctrl-amd.c driver
>and once upon a time it used to set a default debounce time of
>2.75 ms.
>
>See the patch generated by doing:
>
>git format-patch 8cf4345575a416e6856a6856ac6eaa31ad883126~..8cf4345575a416e6856a6856ac6eaa31ad883126
>
>In a linux kernel checkout.
>
>So it would be interesting to add a debugging printk to see
>what the value of pin_reg & DB_TMR_OUT_MASK is for the troublesome
>GPIO.
>
>I guess that it might be all 1s (0xfffffffff) or some such which
>might be a way to check that we should disable the glitch-filter
>for this pin?
>

I guess you mean the value of "pin_reg" (not
"pin_reg & DB_TMR_OUT_MASK"), then the value is 0x500e8. So it means
BIOS or Bootloader has set the debounce for us.

>Regards,
>
>Hans
>

--
Best regards,
Coiby

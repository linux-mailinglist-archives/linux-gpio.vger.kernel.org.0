Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E94C2848A3
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 10:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgJFIcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 04:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFIcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 04:32:04 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C03EC061755
        for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2020 01:32:03 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id h6so6911973pgk.4
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2020 01:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pmocHDYYuo/sFME5FMjrvVa/E/+jVJBXTqktpmuPaiE=;
        b=vTOdXUmDy53kPM78Eqv1ZfpsV/iw2Mo5n9R+7zAP2Xu/nOp3HakjY6yrCIfQzer0M0
         HU6QZ+yM/fBXbm7mMtEkS4l08sM/7sNc0pVn0IueBPIjJyl5aYN0WB5h/C8bqbjj/tZk
         tUI1yD35lu0C33si/ihfM+f+UiPrbvF+W87zD4Qeancs+XghbH2iGLV+94B9BIpC14DY
         U7fi9NjbhN2HUsJW9td+AlXXkaEQ/puFaBeqDpcz/qA4wFidsQUpeRr9Tpg5QdxmCoXL
         sFBcCzam6Y5jt8emTxo2HbuE3VpDRC5G1cVIZUPppkoh+WL713Fcp5l0V6xOFXW1kkq4
         kt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pmocHDYYuo/sFME5FMjrvVa/E/+jVJBXTqktpmuPaiE=;
        b=HFBDb5YYJ6b9F9yF+hcMZmEEoYfUqmI3Z2ppNY0dM0FCzJudAdnebxhvRZEDVaP2yU
         ZlXtNTHyvxbOOFl6gJ860nJGYdCUKdvRJVVY77D1u7Tiul3PUl90jpR2O2p9LIkE+E7G
         TBjfUuEyQsA2Qc+g4xcDaHGCSNcZ/hOittedLY+eA8jr14/Pk941Ly6v2n3D0ZNxy8Go
         i++faYD7azrd0V9MRlOZZq6yda4uQKgdssA+Qe9YNXeHMPD794kAcRsa4kq5Og3reCOP
         CqPav9pBdZlwVw8MGKWuzDLUZxj0C1CbnB5AowKMGlZLxoDMRvitRq69T3m/02TYRGDz
         8t/A==
X-Gm-Message-State: AOAM532UhudJ8qksXS9vbj/oYNaLCjpTJcYely4bN1bs1eXHIrnyNLMm
        FzUln8iriNX79iILHX2mxZ8=
X-Google-Smtp-Source: ABdhPJzylC9/7Qx+QYTsGUIvgOI3jIRQkcdoboorDshtlqR0WABWcZs6FZI5TP6wTSP+PuoIEfeCow==
X-Received: by 2002:a63:c342:: with SMTP id e2mr3075830pgd.56.1601973123042;
        Tue, 06 Oct 2020 01:32:03 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id n7sm2621657pfq.114.2020.10.06.01.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 01:32:02 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Tue, 6 Oct 2020 16:31:57 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201006083157.3pg6zvju5buxspns@Rk>
References: <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 06, 2020 at 08:28:40AM +0200, Hans de Goede wrote:
>Hi,
>
>On 10/6/20 6:49 AM, Coiby Xu wrote:
>>Hi Hans and Linus,
>>
>>I've found the direct evidence proving the GPIO interrupt controller is
>>malfunctioning.
>>
>>I've found a way to let the GPIO chip trigger an interrupt by accident
>>when playing with the GPIO sysfs interface,
>>
>>  - export pin130 which is used by the touchad
>>  - set the direction to be "out"
>>  - `echo 0 > value` will trigger the GPIO controller's parent irq and
>>    "echo 1 > value" will make it stop firing
>>
>>(I'm not sure if this is yet another bug of the GPIO chip. Anyway I can
>>manually trigger an interrupt now.)
>>
>>I wrote a C program is to let GPIO controller quickly generate some
>>interrupts then disable the firing of interrupts by toggling pin#130's
>>value with an specified time interval, i.e., set the value to 0 first
>>and then after some time, re-set the value to 1. There is no interrupt
>>firing unless time internal > 120ms (~7Hz). This explains why we can
>>only see 7 interrupts for the GPIO controller's parent irq.
>
>That is a great find, well done.
>
>>My hypothesis is the GPIO doesn't have proper power setting so it stays
>>in an idle state or its clock frequency is too low by default thus not
>>quick enough to read interrupt input. Then pinctrl-amd must miss some
>>code to configure the chip and I need a hardware reference manual of this
>>GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
>>since I couldn't find a copy of reference manual online? What would you
>>suggest?
>
>This sounds like it might have something to do with the glitch filter.
>The code in pinctrl-amd.c to setup the trigger-type also configures
>the glitch filter, you could try changing that code to disable the
>glitch-filter. The defines for setting the glitch-filter bits to
>disabled are already there.
>

Disabling the glitch filter works like a charm! Other enthusiastic
Linux users who have been troubled by this issue for months would
also feel great to know this small tweaking could bring their
touchpad back to life:) Thank you!

$ git diff
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9a760f5cd7ed..e786d779d6c8 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
                 pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
                 pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
                 pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
-               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
+               /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
                 irq_set_handler_locked(d, handle_level_irq);
                 break;

I will learn more about the glitch filter and the implementation of
pinctrl and see if I can disable glitch filter only for this touchpad.

>Regards,
>
>Hans
>
>
>
>
>>
>>Thank you!
>>
>>On Sun, Oct 04, 2020 at 01:16:44PM +0800, Coiby Xu wrote:
>>>On Sun, Oct 04, 2020 at 07:03:40AM +0800, Coiby Xu wrote:
>>>>On Sat, Oct 03, 2020 at 03:22:46PM +0200, Hans de Goede wrote:
>>>>>Hi,
>>>>>
>>>>>On 10/3/20 12:45 AM, Coiby Xu wrote:
>>>>>>On Fri, Oct 02, 2020 at 09:44:54PM +0200, Hans de Goede wrote:
>>>>>>>Hi,
>>>>>>>
>>>>>>>On 10/2/20 4:51 PM, Coiby Xu wrote:
>>>>>>>>On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:
>>>>>>>
>>>>>>><snip>
>>>>>>>
>>>>>>>>>>>So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>>>>>>>>>the GPIO controllers parent irq ?
>>>>>>>>>>>
>>>>>>>>>>>Also to these 7 interrupts/sec stop happening when you do not touch the
>>>>>>>>>>>touchpad ?
>>>>>>>>>>>
>>>>>>>>>>I see these 7 interrupts / second for the GPIO controller's parent irq.
>>>>>>>>>>And they stop happening when I don't touch the touchpad.
>>>>>>>>>
>>>>>>>>>Only from the parent irq, or also on the touchpad irq itself ?
>>>>>>>>>
>>>>>>>>>If this only happens on the parent irq, then I would start looking at the
>>>>>>>>>amd-pinctrl code which determines which of its "child" irqs to fire.
>>>>>>>>
>>>>>>>>This only happens on the parent irq. The input's pin#130 of the GIPO
>>>>>>>>chip is low most of the time and pin#130.
>>>>>>>
>>>>>>>Right, but it is a low-level triggered IRQ, so when it is low it should
>>>>>>>be executing the i2c-hid interrupt-handler. If it is not executing that
>>>>>>>then it is time to look at amd-pinctrl's irq-handler and figure out why
>>>>>>>that is not triggering the child irq handler for the touchpad.
>>>>>>>
>>>>>>I'm not sure if I have some incorrect understandings about GPIO
>>>>>>interrupt controller because I don't quite follow your reasoning.
>>>>>>What I actually suspect is there's something wrong with amd-pinctrl
>>>>>>which makes the GPIO chip fail to assert its common interrupt output
>>>>>>line connected to one IO-APIC's pin#7 thus IRQ#7 fails to fire. What
>>>>>>I learn about this low-level triggered IRQ is that the i2c-hid
>>>>>>interrupt-handler will be woken up by amd-pinctrl's irq-handler which
>>>>>>is executed when the parent IRQ#7 fires. The code path is as follows,
>>>>>>
>>>>>>Ã‚Â Ã‚Â Ã‚Â  <IRQ>
>>>>>>Ã‚Â Ã‚Â Ã‚Â  dump_stack+0x64/0x88
>>>>>>Ã‚Â Ã‚Â Ã‚Â  __irq_wake_thread.cold+0x9/0x12
>>>>>>Ã‚Â Ã‚Â Ã‚Â  __handle_irq_event_percpu+0x80/0x1c0
>>>>>>Ã‚Â Ã‚Â Ã‚Â  handle_irq_event+0x58/0xb0
>>>>>>Ã‚Â Ã‚Â Ã‚Â  handle_level_irq+0xb7/0x1a0
>>>>>>Ã‚Â Ã‚Â Ã‚Â  generic_handle_irq+0x4a/0x60
>>>>>>Ã‚Â Ã‚Â Ã‚Â  amd_gpio_irq_handler+0x15f/0x1b0 [pinctrl_amd]
>>>>>>Ã‚Â Ã‚Â Ã‚Â  __handle_irq_event_percpu+0x45/0x1c0
>>>>>>Ã‚Â Ã‚Â Ã‚Â  handle_irq_event+0x58/0xb0
>>>>>>Ã‚Â Ã‚Â Ã‚Â  handle_fasteoi_irq+0xa2/0x210
>>>>>>Ã‚Â Ã‚Â Ã‚Â  do_IRQ+0x70/0x120
>>>>>>Ã‚Â Ã‚Â Ã‚Â  common_interrupt+0xf/0xf
>>>>>>Ã‚Â Ã‚Â Ã‚Â  </IRQ>
>>>>>>
>>>>>>But the problem is somehow IRQ#7 doesn't even fire when the input's
>>>>>>pin#130 of the GIPO is low. Without IRQ#7 firing, amd-pinctrl's
>>>>>>irq-handler wouldn't be executed in the first place, let alonet
>>>>>>triggering the child irq handler. Btw, amd-pinctrl's irq-handler
>>>>>>simply iterate over all pins. If there is mapped irq found for this
>>>>>>hwirq (yes, it won't even check if this pin triggers the interrupt),
>>>>>>then it will call generic_handle_irq. So there's nothing wrong about
>>>>>>this part of code.
>>>>>
>>>>>Ok, so the i2c-hid irq does fire, but only 7 times a second just
>>>>>like the GPIO controller's parent irq.
>>>>>
>>>>I'm not sure if it's correct to say if hi2c-hid irq fires or not and how
>>>>frequently it fires since the i2c-hid irq is mapped to pin#130 of the
>>>>GPIO interrupt controller and the touchpad has another interrupt line
>>>>connected to pin#130 which fires to indicate new data. All we know is
>>>>pin#130 of the GPIO chip has low input most of the time when the finger
>>>>is on the touchpad so we can infer the touchpad has been trying to
>>>>notify the kernel of new data but somehow GPIO's parent irq only fires 7
>>>>times / second.
>>>>
>>>>>The only thing I can think of then is to add printk-s to check how
>>>>>long the i2c-hid interrupt handler takes to complete. It could be
>>>>>there is a subtle bug somewhere causing the i2c transfers to take
>>>>>longer when run from a (threaded) irq handler. That would be weird
>>>>>though, so I don't expect this to result in any useful findings.
>>>>>
>>>>
>>>>I also doubted if it takes too much time for the i2c-hid handler to
>>>>finish reading i2c transfer, processing data and delivering to the input
>>>>system. After measuring the time internal between the starting of the
>>>>GPIO irq's parent handler and when pin#130 is unmasked, we can exclude
>>>>this possibility.
>>>>
>>>>I have been wondering if we let make pin#130 have low input thus to
>>>>trigger a interrupt firing or assert the GPIO's common interrupt output
>>>>line manually thus we can measure how long does it take for the kernel
>>>>to receive the signal. But once GPIO's pin is programmed to be a
>>>>interrupt line we can't write anything to it and it seems other
>>>>interrupts can only be generated by the hardware. So this idea is not
>>>>plausible
>>>>
>>>
>>>Btw, there are other users who have the same laptop model but with a
>>>different touchpad (ELAN). Their touchpads would show in
>>>/proc/bus/input/devices but are completely dead. hid-recorder which
>>>will read HID reports from /dev/hidraw gets nothing if they put there
>>>fingers on the touchpad but the polling mode could also save their
>>>touchpads. It seems GPIO controller's parent irq for the ELAN touchpad
>>>doesn't even fire once. And unlike GPIO, IO-APIC has also be used by
>>>other devices like the keyboard. So maybe it's safe to assert the root
>>>cause is from the GPIO controller.
>>>
>>>>>Other then that I'm all out of ideas I'm afraid.
>>>>>
>>>>Thank you for taking time to investigate this issue anyway! Have a nice
>>>>weekend:)
>>>>>Regards,
>>>>>
>>>>>Hans
>>>>>
>>>>
>>>>--
>>>>Best regards,
>>>>Coiby
>>>
>>>--
>>>Best regards,
>>>Coiby
>>
>>--
>>Best regards,
>>Coiby
>>
>

--
Best regards,
Coiby

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0EC28274D
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Oct 2020 01:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgJCXDr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Oct 2020 19:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgJCXDq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Oct 2020 19:03:46 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85A7C0613D0
        for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2020 16:03:46 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id x16so3327441pgj.3
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2020 16:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KO991mYIDFc3604pCt92eyHAdDBh/VSTU0dt8VXMse0=;
        b=uKCZDjH7xMslSWZGm7fIhKfxY4hv/Mr27dhLa0wA+6i8ERpGPqsThpgDJ1H5qz5FVF
         RwbsZgREQgIcyy0+EN6pLthabKWyxLFJKPITtAxriBExCnYJ1JHrxCrfpCicviTER/Lo
         Om/x8goBnAAcxWSBKuAkrxJqL9/6FBDlac22R3NvOynJbzUQcTuiU/AkOntLKnxQEYoD
         Vy8UEGshSxWVFMopUp72Yp83CcKIXLBrWf+mewVuKx293wi72vn3RyW8ZodN6UgxTQgT
         7uWqtfJrRu79lizVaDelh5oF8zMRmOHYgfE345B32yhsFvl/ijp38czoMTCdynK3ifvp
         aVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KO991mYIDFc3604pCt92eyHAdDBh/VSTU0dt8VXMse0=;
        b=AbV6DNKmlqJRz4q0p7wuHs5Hf4pGYL7oiLNq1/KbZjJ2z1jPgSkoC2fPBRqkODUdhe
         0lkzMAj3Hp2g4vN81ipgDlWkRPweMwApnyklClkFKZclIZ0iQkAfDjLsA51WPI7u7afB
         Le3J90W19xZzEnJTaQ8de7e5Fplj4kT4ZA86k4VcTQvW6F/EnNPgEgJr3s+Pn1Su/PKd
         r+P2o/SUGcx9Z496kGi/tkXBBgsQ+NJcGcjMyrOOiyz1OFayPRgG7LGPNKzoVEKf1wbZ
         CdDD3K1wfYK4dm0PA/F6OPBJJfJl4wKhldRi2DTy1Kniho0n9hO9Cf8fWcF/JEvvqtPX
         Hchg==
X-Gm-Message-State: AOAM533/hmdpEZ7POkjWva3vIyJlHlwLBKBLVUR3sH+Z9oVO+TRZCBOd
        UogEnSQ8EJarLkSAtX2cUQ0=
X-Google-Smtp-Source: ABdhPJwKyQJ+g8eLsIH7oToQ1DuWnFm0UHIkXnzKQHtWAVc9pAw61nKx2lP2UvjyZjF5EjYAtJ8aRQ==
X-Received: by 2002:a62:5bc2:0:b029:13e:d13d:a130 with SMTP id p185-20020a625bc20000b029013ed13da130mr9524006pfb.24.1601766225527;
        Sat, 03 Oct 2020 16:03:45 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id 8sm3570050pfn.54.2020.10.03.16.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 16:03:44 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Sun, 4 Oct 2020 07:03:40 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201003230340.42mtl35n4ka4d5qw@Rk>
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 03, 2020 at 03:22:46PM +0200, Hans de Goede wrote:
>Hi,
>
>On 10/3/20 12:45 AM, Coiby Xu wrote:
>>On Fri, Oct 02, 2020 at 09:44:54PM +0200, Hans de Goede wrote:
>>>Hi,
>>>
>>>On 10/2/20 4:51 PM, Coiby Xu wrote:
>>>>On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:
>>>
>>><snip>
>>>
>>>>>>>So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>>>>>the GPIO controllers parent irq ?
>>>>>>>
>>>>>>>Also to these 7 interrupts/sec stop happening when you do not touch the
>>>>>>>touchpad ?
>>>>>>>
>>>>>>I see these 7 interrupts / second for the GPIO controller's parent irq.
>>>>>>And they stop happening when I don't touch the touchpad.
>>>>>
>>>>>Only from the parent irq, or also on the touchpad irq itself ?
>>>>>
>>>>>If this only happens on the parent irq, then I would start looking at the
>>>>>amd-pinctrl code which determines which of its "child" irqs to fire.
>>>>
>>>>This only happens on the parent irq. The input's pin#130 of the GIPO
>>>>chip is low most of the time and pin#130.
>>>
>>>Right, but it is a low-level triggered IRQ, so when it is low it should
>>>be executing the i2c-hid interrupt-handler. If it is not executing that
>>>then it is time to look at amd-pinctrl's irq-handler and figure out why
>>>that is not triggering the child irq handler for the touchpad.
>>>
>>I'm not sure if I have some incorrect understandings about GPIO
>>interrupt controller because I don't quite follow your reasoning.
>>What I actually suspect is there's something wrong with amd-pinctrl
>>which makes the GPIO chip fail to assert its common interrupt output
>>line connected to one IO-APIC's pin#7 thus IRQ#7 fails to fire. What
>>I learn about this low-level triggered IRQ is that the i2c-hid
>>interrupt-handler will be woken up by amd-pinctrl's irq-handler which
>>is executed when the parent IRQ#7 fires. The code path is as follows,
>>
>>     <IRQ>
>>     dump_stack+0x64/0x88
>>     __irq_wake_thread.cold+0x9/0x12
>>     __handle_irq_event_percpu+0x80/0x1c0
>>     handle_irq_event+0x58/0xb0
>>     handle_level_irq+0xb7/0x1a0
>>     generic_handle_irq+0x4a/0x60
>>     amd_gpio_irq_handler+0x15f/0x1b0 [pinctrl_amd]
>>     __handle_irq_event_percpu+0x45/0x1c0
>>     handle_irq_event+0x58/0xb0
>>     handle_fasteoi_irq+0xa2/0x210
>>     do_IRQ+0x70/0x120
>>     common_interrupt+0xf/0xf
>>     </IRQ>
>>
>>But the problem is somehow IRQ#7 doesn't even fire when the input's
>>pin#130 of the GIPO is low. Without IRQ#7 firing, amd-pinctrl's
>>irq-handler wouldn't be executed in the first place, let alonet
>>triggering the child irq handler. Btw, amd-pinctrl's irq-handler
>>simply iterate over all pins. If there is mapped irq found for this
>>hwirq (yes, it won't even check if this pin triggers the interrupt),
>>then it will call generic_handle_irq. So there's nothing wrong about
>>this part of code.
>
>Ok, so the i2c-hid irq does fire, but only 7 times a second just
>like the GPIO controller's parent irq.
>
I'm not sure if it's correct to say if hi2c-hid irq fires or not and how
frequently it fires since the i2c-hid irq is mapped to pin#130 of the
GPIO interrupt controller and the touchpad has another interrupt line
connected to pin#130 which fires to indicate new data. All we know is
pin#130 of the GPIO chip has low input most of the time when the finger
is on the touchpad so we can infer the touchpad has been trying to
notify the kernel of new data but somehow GPIO's parent irq only fires 7
times / second.
>The only thing I can think of then is to add printk-s to check how
>long the i2c-hid interrupt handler takes to complete. It could be
>there is a subtle bug somewhere causing the i2c transfers to take
>longer when run from a (threaded) irq handler. That would be weird
>though, so I don't expect this to result in any useful findings.
>

I also doubted if it takes too much time for the i2c-hid handler to
finish reading i2c transfer, processing data and delivering to the input
system. After measuring the time internal between the starting of the
GPIO irq's parent handler and when pin#130 is unmasked, we can exclude
this possibility.

I have been wondering if we let make pin#130 have low input thus to
trigger a interrupt firing or assert the GPIO's common interrupt output
line manually thus we can measure how long does it take for the kernel
to receive the signal. But once GPIO's pin is programmed to be a
interrupt line we can't write anything to it and it seems other
interrupts can only be generated by the hardware. So this idea is not
plausible

>Other then that I'm all out of ideas I'm afraid.
>
Thank you for taking time to investigate this issue anyway! Have a nice
weekend:)
>Regards,
>
>Hans
>

--
Best regards,
Coiby

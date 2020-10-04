Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABE228290D
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Oct 2020 07:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725824AbgJDFQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Oct 2020 01:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgJDFQv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Oct 2020 01:16:51 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268B8C0613CE
        for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2020 22:16:50 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id m34so3608088pgl.9
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2020 22:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gZr9Kw+o8OB9KyD9/COFkJNoGXCkMHLIi6K9o3KtSeE=;
        b=BtxTol/r7gzRb2uq5O+DFEcE0e4hz8+lmQ4MQ7zV+16T3qQuRvSMURqWWjHEDdjLmW
         c8gMUK6Pwo+qxLn6iFbQ37JYl7Oo6ODokqdDZCHgCQndXyZNSPOLBzYxOfIqgvhoY6Sx
         jDmbTOLl+RYu1D17DhmGF9oplVZ32ydLxFh+cPehFrBIOxSeHU7mWrNYO6/q+LBqRyoo
         OduhYgeTeDEYmx+1J/BzizGiNbSsWsD7sBALHjTajkUE1pLyjPMHpWLBx3Az+vy/fBlV
         YEOtgZB545KoSz2r8QkiYA3r8JoaAHADqJQyZHzqsRv61oeh9xBwBPfGOpb3BgRo7t65
         A8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gZr9Kw+o8OB9KyD9/COFkJNoGXCkMHLIi6K9o3KtSeE=;
        b=Lm1+8xOMykhsWEjSeeUSGOWX5ajHl043bDmLD6KSLH8zligRPg0Hf9zM2lazkLfMb3
         RbysHzkQEnzFMI5uxq/0v2ed/bpbcR4r4tONM9HlVawKM3XMUc6dr6zKBXvrMA103D6K
         Wl0P36ppWz2vSJ/Z/h3PCOFtAhGZCGDNIFp7Qw9tialT0go6MQa8/2aajbszIXTzZ2zy
         CTkZhfGTXpjpjuQj692SKctO0PsmPL7EW2xVdUEM6CUvBrfmQllhTAfuul/ciYtM8QY1
         QiWrNXeh4fc9pcZcTNSh73vvzhb8lkdBcgyR0n/iv6naUDUz1uMHH/JoNldYo1YG3DfB
         Bokg==
X-Gm-Message-State: AOAM533Z8r6gQpw4Z2W4DuZUlQ8rCoafe/qbXIVianSKpUJzyQLskuNq
        bAQ3kQgauuo2E2jecYd0flo=
X-Google-Smtp-Source: ABdhPJyPa9qV8iLlk5amkPfLE4JEBLWqLRN5G8qexQh4K5VGWEAaCDCDMLiJNe380SDyyKDBiagPAg==
X-Received: by 2002:aa7:910c:0:b029:13e:d13d:a07b with SMTP id 12-20020aa7910c0000b029013ed13da07bmr10322744pfh.18.1601788609400;
        Sat, 03 Oct 2020 22:16:49 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id h2sm7939535pfk.90.2020.10.03.22.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 22:16:48 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Sun, 4 Oct 2020 13:16:44 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201004051644.f3fg2oavbobrwhf6@Rk>
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201003230340.42mtl35n4ka4d5qw@Rk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 04, 2020 at 07:03:40AM +0800, Coiby Xu wrote:
>On Sat, Oct 03, 2020 at 03:22:46PM +0200, Hans de Goede wrote:
>>Hi,
>>
>>On 10/3/20 12:45 AM, Coiby Xu wrote:
>>>On Fri, Oct 02, 2020 at 09:44:54PM +0200, Hans de Goede wrote:
>>>>Hi,
>>>>
>>>>On 10/2/20 4:51 PM, Coiby Xu wrote:
>>>>>On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:
>>>>
>>>><snip>
>>>>
>>>>>>>>So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>>>>>>the GPIO controllers parent irq ?
>>>>>>>>
>>>>>>>>Also to these 7 interrupts/sec stop happening when you do not touch the
>>>>>>>>touchpad ?
>>>>>>>>
>>>>>>>I see these 7 interrupts / second for the GPIO controller's parent irq.
>>>>>>>And they stop happening when I don't touch the touchpad.
>>>>>>
>>>>>>Only from the parent irq, or also on the touchpad irq itself ?
>>>>>>
>>>>>>If this only happens on the parent irq, then I would start looking at the
>>>>>>amd-pinctrl code which determines which of its "child" irqs to fire.
>>>>>
>>>>>This only happens on the parent irq. The input's pin#130 of the GIPO
>>>>>chip is low most of the time and pin#130.
>>>>
>>>>Right, but it is a low-level triggered IRQ, so when it is low it should
>>>>be executing the i2c-hid interrupt-handler. If it is not executing that
>>>>then it is time to look at amd-pinctrl's irq-handler and figure out why
>>>>that is not triggering the child irq handler for the touchpad.
>>>>
>>>I'm not sure if I have some incorrect understandings about GPIO
>>>interrupt controller because I don't quite follow your reasoning.
>>>What I actually suspect is there's something wrong with amd-pinctrl
>>>which makes the GPIO chip fail to assert its common interrupt output
>>>line connected to one IO-APIC's pin#7 thus IRQ#7 fails to fire. What
>>>I learn about this low-level triggered IRQ is that the i2c-hid
>>>interrupt-handler will be woken up by amd-pinctrl's irq-handler which
>>>is executed when the parent IRQ#7 fires. The code path is as follows,
>>>
>>>    <IRQ>
>>>    dump_stack+0x64/0x88
>>>    __irq_wake_thread.cold+0x9/0x12
>>>    __handle_irq_event_percpu+0x80/0x1c0
>>>    handle_irq_event+0x58/0xb0
>>>    handle_level_irq+0xb7/0x1a0
>>>    generic_handle_irq+0x4a/0x60
>>>    amd_gpio_irq_handler+0x15f/0x1b0 [pinctrl_amd]
>>>    __handle_irq_event_percpu+0x45/0x1c0
>>>    handle_irq_event+0x58/0xb0
>>>    handle_fasteoi_irq+0xa2/0x210
>>>    do_IRQ+0x70/0x120
>>>    common_interrupt+0xf/0xf
>>>    </IRQ>
>>>
>>>But the problem is somehow IRQ#7 doesn't even fire when the input's
>>>pin#130 of the GIPO is low. Without IRQ#7 firing, amd-pinctrl's
>>>irq-handler wouldn't be executed in the first place, let alonet
>>>triggering the child irq handler. Btw, amd-pinctrl's irq-handler
>>>simply iterate over all pins. If there is mapped irq found for this
>>>hwirq (yes, it won't even check if this pin triggers the interrupt),
>>>then it will call generic_handle_irq. So there's nothing wrong about
>>>this part of code.
>>
>>Ok, so the i2c-hid irq does fire, but only 7 times a second just
>>like the GPIO controller's parent irq.
>>
>I'm not sure if it's correct to say if hi2c-hid irq fires or not and how
>frequently it fires since the i2c-hid irq is mapped to pin#130 of the
>GPIO interrupt controller and the touchpad has another interrupt line
>connected to pin#130 which fires to indicate new data. All we know is
>pin#130 of the GPIO chip has low input most of the time when the finger
>is on the touchpad so we can infer the touchpad has been trying to
>notify the kernel of new data but somehow GPIO's parent irq only fires 7
>times / second.
>
>>The only thing I can think of then is to add printk-s to check how
>>long the i2c-hid interrupt handler takes to complete. It could be
>>there is a subtle bug somewhere causing the i2c transfers to take
>>longer when run from a (threaded) irq handler. That would be weird
>>though, so I don't expect this to result in any useful findings.
>>
>
>I also doubted if it takes too much time for the i2c-hid handler to
>finish reading i2c transfer, processing data and delivering to the input
>system. After measuring the time internal between the starting of the
>GPIO irq's parent handler and when pin#130 is unmasked, we can exclude
>this possibility.
>
>I have been wondering if we let make pin#130 have low input thus to
>trigger a interrupt firing or assert the GPIO's common interrupt output
>line manually thus we can measure how long does it take for the kernel
>to receive the signal. But once GPIO's pin is programmed to be a
>interrupt line we can't write anything to it and it seems other
>interrupts can only be generated by the hardware. So this idea is not
>plausible
>

Btw, there are other users who have the same laptop model but with a
different touchpad (ELAN). Their touchpads would show in
/proc/bus/input/devices but are completely dead. hid-recorder which
will read HID reports from /dev/hidraw gets nothing if they put there
fingers on the touchpad but the polling mode could also save their
touchpads. It seems GPIO controller's parent irq for the ELAN touchpad
doesn't even fire once. And unlike GPIO, IO-APIC has also be used by
other devices like the keyboard. So maybe it's safe to assert the root
cause is from the GPIO controller.

>>Other then that I'm all out of ideas I'm afraid.
>>
>Thank you for taking time to investigate this issue anyway! Have a nice
>weekend:)
>>Regards,
>>
>>Hans
>>
>
>--
>Best regards,
>Coiby

--
Best regards,
Coiby

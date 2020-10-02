Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4145A281E98
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Oct 2020 00:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgJBWpK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 18:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJBWpK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 18:45:10 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D270C0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 15:45:09 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x22so2327659pfo.12
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 15:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NOHZafskU4biukHD0Q/3wMTwi42s6/03a21P7rbyoeA=;
        b=fI2LrnjHo5nj/O2vp200oErIgozbi2e3q+y/UY+BunLLr7tM72KbJiRMp9lYtVqHhD
         gpSXweoORbP+/XpVC46IG2ll44IkcKjnvFGichbgjDbSh0sLqji0hZT24BK+CF+tu2U8
         67X1+lpDNz1r79Hc6/YBXHatks5aJqgm3uYpzwpqPPTBtxOtHm+HGHP3rlS27ozRAkt9
         Qj5LgS8mQKrDmbBp5jn8gJ7MS2JAQAM2/D4B5iLs13DPtE06O4jzPx5PBzEPV/xTWfdS
         FH4188gy69cNL5Hauy6CH5iC0/13FsLKjW7EWizh9ZQsf6gP8I1V5azh4NcIurjpIvMk
         S3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NOHZafskU4biukHD0Q/3wMTwi42s6/03a21P7rbyoeA=;
        b=eqV3Omimbghpvq5pfV0Ta3+2E/jtlUGxzCGS/oiQKOntpYeu1wv7BmNU/OkXrWRs3i
         BiJ+/07M7v0EYaYXcLdTRZTcVBYbqe24/YBkPyVovWfrOizuPo8tunq8nvRLVkjUW33A
         +eK0x4m1uBKLCpwn7Q+PyEv09LK+lElFCfGmpg2kHUB4Yld0E4kc3xNtJPpfQ9WE+ou/
         E0r2y2Bi9C9BhAa5C1FfF37KheXdM/v2JATW5Xeu+ZSj0Io5ANs/c2QyWQIyEfLzIS7X
         5lreW7lmIN9HEFdDhuKRDMb2VKJVAqGHBEWi9ZQoic7ya0DKvpOtr6ZMIK+60XcWpFRi
         hpxw==
X-Gm-Message-State: AOAM530aEaQF55H/lsFhxtHZy/7tk/uguNusNdgFWtYYVqp81TQyg0kM
        UXANYoiaMGl0OrvlQIWYHAZmSdtAigFhFQ==
X-Google-Smtp-Source: ABdhPJw10Uxz7QFIstFSc3yvUYWe/hVhl2yvuD3F9mgz8QbbhckHdsJqWhwnU8iIQ5OpoEJAXCVjaA==
X-Received: by 2002:a63:5825:: with SMTP id m37mr4358339pgb.64.1601678708658;
        Fri, 02 Oct 2020 15:45:08 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id o11sm2858945pgq.36.2020.10.02.15.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:45:07 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Sat, 3 Oct 2020 06:45:02 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201002224502.vn3ooodrxrblwauu@Rk>
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 02, 2020 at 09:44:54PM +0200, Hans de Goede wrote:
>Hi,
>
>On 10/2/20 4:51 PM, Coiby Xu wrote:
>>On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:
>
><snip>
>
>>>>>So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>>>the GPIO controllers parent irq ?
>>>>>
>>>>>Also to these 7 interrupts/sec stop happening when you do not touch the
>>>>>touchpad ?
>>>>>
>>>>I see these 7 interrupts / second for the GPIO controller's parent irq.
>>>>And they stop happening when I don't touch the touchpad.
>>>
>>>Only from the parent irq, or also on the touchpad irq itself ?
>>>
>>>If this only happens on the parent irq, then I would start looking at the
>>>amd-pinctrl code which determines which of its "child" irqs to fire.
>>
>>This only happens on the parent irq. The input's pin#130 of the GIPO
>>chip is low most of the time and pin#130.
>
>Right, but it is a low-level triggered IRQ, so when it is low it should
>be executing the i2c-hid interrupt-handler. If it is not executing that
>then it is time to look at amd-pinctrl's irq-handler and figure out why
>that is not triggering the child irq handler for the touchpad.
>
I'm not sure if I have some incorrect understandings about GPIO
interrupt controller because I don't quite follow your reasoning.
What I actually suspect is there's something wrong with amd-pinctrl
which makes the GPIO chip fail to assert its common interrupt output
line connected to one IO-APIC's pin#7 thus IRQ#7 fails to fire. What
I learn about this low-level triggered IRQ is that the i2c-hid
interrupt-handler will be woken up by amd-pinctrl's irq-handler which
is executed when the parent IRQ#7 fires. The code path is as follows,

     <IRQ>
     dump_stack+0x64/0x88
     __irq_wake_thread.cold+0x9/0x12
     __handle_irq_event_percpu+0x80/0x1c0
     handle_irq_event+0x58/0xb0
     handle_level_irq+0xb7/0x1a0
     generic_handle_irq+0x4a/0x60
     amd_gpio_irq_handler+0x15f/0x1b0 [pinctrl_amd]
     __handle_irq_event_percpu+0x45/0x1c0
     handle_irq_event+0x58/0xb0
     handle_fasteoi_irq+0xa2/0x210
     do_IRQ+0x70/0x120
     common_interrupt+0xf/0xf
     </IRQ>

But the problem is somehow IRQ#7 doesn't even fire when the input's
pin#130 of the GIPO is low. Without IRQ#7 firing, amd-pinctrl's
irq-handler wouldn't be executed in the first place, let alone
triggering the child irq handler. Btw, amd-pinctrl's irq-handler
simply iterate over all pins. If there is mapped irq found for this
hwirq (yes, it won't even check if this pin triggers the interrupt),
then it will call generic_handle_irq. So there's nothing wrong about
this part of code.

I've reverted commit ba714a9c1dea85e0bf2899d02dfeb9c70040427c
("pinctrl/amd: Use regular interrupt instead of chained") to bring
back chained interrupt to see if "an irq storm" would happen which
seems to be what I need since currently IRQ#7 only fires ~7 times per
second. The results is the interrupts arrive in pairs. The time
internal between two interrupts in a pair is ~0.0016s but the time
internal between interrupt pairs is still ~0.12s (~8Hz). I can't
understand this kind of behaviour. This GPIO chip acts like a
black box to me. That's also why I ask for other ways to debug
amd-pinctrl here in the hope I could understand why the time internal
between the two interrupts in a par is much shorter thus to find a
way to let IRQ#7 fires much more frequently.

>Regards,
>
>Hans
>

--
Best regards,
Coiby

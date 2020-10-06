Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F430284603
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 08:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgJFG2s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 02:28:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49325 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725962AbgJFG2r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 02:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601965725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B1QwREq0y9kxw73/YPlBeF9wLu9Bg4SvS+ntbKXf8ro=;
        b=YsDHSUVtlRq6G8a49qkc3jACS9S99UAKsDZmT7riDvN/bDevvJM0UoworXJI9Wxx9T/kwQ
        7CCPlrjzIWjAX1JAkRoHWf4be8sWWai5qQlnbZicIIZTxizoC/o++7oDCAF17ks+N4KQkZ
        GTdp9OeZbazOwKdXXjULlCbnEMZpY0A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-hyQU1Ay2Onu4OJ8iv0ZQDQ-1; Tue, 06 Oct 2020 02:28:44 -0400
X-MC-Unique: hyQU1Ay2Onu4OJ8iv0ZQDQ-1
Received: by mail-ed1-f72.google.com with SMTP id f19so5302427edx.18
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2020 23:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B1QwREq0y9kxw73/YPlBeF9wLu9Bg4SvS+ntbKXf8ro=;
        b=eeR/5x1ee0+yVx74iXmfXqtg5GJmYhyXKJZZIhVzbOpU1yjhOxbkxQ/aueThMGkHjU
         QsJMpvVH1gztCy8/soFXJCL9WhG4XS8rix7WRkvVW+fv6sq14SwBufietvjhysdxpu1w
         cXJCiUpV+kbp7fvOKKbVIksEq2MZRnZxwsAtWhYIamOgmsWw2ixbMfK8zugPkdxfhQAm
         km+cVJT/i4KnlAfbixuZBH4Eak3Edz3DXbZA+ABPX7DLgL9LSHzlr5nQgvpFqMMGMgQq
         NFveHPNlNK9lQfAQKhsLSCcGlmC7hoYRvqGgZMCUGprtyIIrDP2HujM3M5TA5ZKKVwxR
         2tQg==
X-Gm-Message-State: AOAM531/A0iB30lwraG1B9bvXjHk0DoTchE7hE1qJBqjw77x/BJ9a2N4
        k4dEgHiKjmkCoGcKz5+jbdZWP+gfkvipxCKTSJ29ZNeQUB3zwVpgRVyDMN54QiWXxhO++NJxEWo
        5v4nyb1Lcph6ZUR/pTZZX5g==
X-Received: by 2002:a17:907:104f:: with SMTP id oy15mr3650537ejb.261.1601965722749;
        Mon, 05 Oct 2020 23:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyZS3P6Oh+XRK/p67YJIRT/oRsPUdOV2clxFth3LomOFXoGdgoONHKeMpo/z/uma3nEj/N3Q==
X-Received: by 2002:a17:907:104f:: with SMTP id oy15mr3650511ejb.261.1601965722442;
        Mon, 05 Oct 2020 23:28:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t4sm1385333ejj.6.2020.10.05.23.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 23:28:41 -0700 (PDT)
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Coiby Xu <coiby.xu@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
Date:   Tue, 6 Oct 2020 08:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006044941.fdjsp346kc5thyzy@Rk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/6/20 6:49 AM, Coiby Xu wrote:
> Hi Hans and Linus,
> 
> I've found the direct evidence proving the GPIO interrupt controller is
> malfunctioning.
> 
> I've found a way to let the GPIO chip trigger an interrupt by accident
> when playing with the GPIO sysfs interface,
> 
>   - export pin130 which is used by the touchad
>   - set the direction to be "out"
>   - `echo 0 > value` will trigger the GPIO controller's parent irq and
>     "echo 1 > value" will make it stop firing
> 
> (I'm not sure if this is yet another bug of the GPIO chip. Anyway I can
> manually trigger an interrupt now.)
> 
> I wrote a C program is to let GPIO controller quickly generate some
> interrupts then disable the firing of interrupts by toggling pin#130's
> value with an specified time interval, i.e., set the value to 0 first
> and then after some time, re-set the value to 1. There is no interrupt
> firing unless time internal > 120ms (~7Hz). This explains why we can
> only see 7 interrupts for the GPIO controller's parent irq.

That is a great find, well done.

> My hypothesis is the GPIO doesn't have proper power setting so it stays
> in an idle state or its clock frequency is too low by default thus not
> quick enough to read interrupt input. Then pinctrl-amd must miss some
> code to configure the chip and I need a hardware reference manual of this
> GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
> since I couldn't find a copy of reference manual online? What would you
> suggest?

This sounds like it might have something to do with the glitch filter.
The code in pinctrl-amd.c to setup the trigger-type also configures
the glitch filter, you could try changing that code to disable the
glitch-filter. The defines for setting the glitch-filter bits to
disabled are already there.

Regards,

Hans




> 
> Thank you!
> 
> On Sun, Oct 04, 2020 at 01:16:44PM +0800, Coiby Xu wrote:
>> On Sun, Oct 04, 2020 at 07:03:40AM +0800, Coiby Xu wrote:
>>> On Sat, Oct 03, 2020 at 03:22:46PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 10/3/20 12:45 AM, Coiby Xu wrote:
>>>>> On Fri, Oct 02, 2020 at 09:44:54PM +0200, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 10/2/20 4:51 PM, Coiby Xu wrote:
>>>>>>> On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:
>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>>>>> So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>>>>>>>> the GPIO controllers parent irq ?
>>>>>>>>>>
>>>>>>>>>> Also to these 7 interrupts/sec stop happening when you do not touch the
>>>>>>>>>> touchpad ?
>>>>>>>>>>
>>>>>>>>> I see these 7 interrupts / second for the GPIO controller's parent irq.
>>>>>>>>> And they stop happening when I don't touch the touchpad.
>>>>>>>>
>>>>>>>> Only from the parent irq, or also on the touchpad irq itself ?
>>>>>>>>
>>>>>>>> If this only happens on the parent irq, then I would start looking at the
>>>>>>>> amd-pinctrl code which determines which of its "child" irqs to fire.
>>>>>>>
>>>>>>> This only happens on the parent irq. The input's pin#130 of the GIPO
>>>>>>> chip is low most of the time and pin#130.
>>>>>>
>>>>>> Right, but it is a low-level triggered IRQ, so when it is low it should
>>>>>> be executing the i2c-hid interrupt-handler. If it is not executing that
>>>>>> then it is time to look at amd-pinctrl's irq-handler and figure out why
>>>>>> that is not triggering the child irq handler for the touchpad.
>>>>>>
>>>>> I'm not sure if I have some incorrect understandings about GPIO
>>>>> interrupt controller because I don't quite follow your reasoning.
>>>>> What I actually suspect is there's something wrong with amd-pinctrl
>>>>> which makes the GPIO chip fail to assert its common interrupt output
>>>>> line connected to one IO-APIC's pin#7 thus IRQ#7 fails to fire. What
>>>>> I learn about this low-level triggered IRQ is that the i2c-hid
>>>>> interrupt-handler will be woken up by amd-pinctrl's irq-handler which
>>>>> is executed when the parent IRQ#7 fires. The code path is as follows,
>>>>>
>>>>> Ã‚Â Ã‚Â Ã‚Â  <IRQ>
>>>>> Ã‚Â Ã‚Â Ã‚Â  dump_stack+0x64/0x88
>>>>> Ã‚Â Ã‚Â Ã‚Â  __irq_wake_thread.cold+0x9/0x12
>>>>> Ã‚Â Ã‚Â Ã‚Â  __handle_irq_event_percpu+0x80/0x1c0
>>>>> Ã‚Â Ã‚Â Ã‚Â  handle_irq_event+0x58/0xb0
>>>>> Ã‚Â Ã‚Â Ã‚Â  handle_level_irq+0xb7/0x1a0
>>>>> Ã‚Â Ã‚Â Ã‚Â  generic_handle_irq+0x4a/0x60
>>>>> Ã‚Â Ã‚Â Ã‚Â  amd_gpio_irq_handler+0x15f/0x1b0 [pinctrl_amd]
>>>>> Ã‚Â Ã‚Â Ã‚Â  __handle_irq_event_percpu+0x45/0x1c0
>>>>> Ã‚Â Ã‚Â Ã‚Â  handle_irq_event+0x58/0xb0
>>>>> Ã‚Â Ã‚Â Ã‚Â  handle_fasteoi_irq+0xa2/0x210
>>>>> Ã‚Â Ã‚Â Ã‚Â  do_IRQ+0x70/0x120
>>>>> Ã‚Â Ã‚Â Ã‚Â  common_interrupt+0xf/0xf
>>>>> Ã‚Â Ã‚Â Ã‚Â  </IRQ>
>>>>>
>>>>> But the problem is somehow IRQ#7 doesn't even fire when the input's
>>>>> pin#130 of the GIPO is low. Without IRQ#7 firing, amd-pinctrl's
>>>>> irq-handler wouldn't be executed in the first place, let alonet
>>>>> triggering the child irq handler. Btw, amd-pinctrl's irq-handler
>>>>> simply iterate over all pins. If there is mapped irq found for this
>>>>> hwirq (yes, it won't even check if this pin triggers the interrupt),
>>>>> then it will call generic_handle_irq. So there's nothing wrong about
>>>>> this part of code.
>>>>
>>>> Ok, so the i2c-hid irq does fire, but only 7 times a second just
>>>> like the GPIO controller's parent irq.
>>>>
>>> I'm not sure if it's correct to say if hi2c-hid irq fires or not and how
>>> frequently it fires since the i2c-hid irq is mapped to pin#130 of the
>>> GPIO interrupt controller and the touchpad has another interrupt line
>>> connected to pin#130 which fires to indicate new data. All we know is
>>> pin#130 of the GPIO chip has low input most of the time when the finger
>>> is on the touchpad so we can infer the touchpad has been trying to
>>> notify the kernel of new data but somehow GPIO's parent irq only fires 7
>>> times / second.
>>>
>>>> The only thing I can think of then is to add printk-s to check how
>>>> long the i2c-hid interrupt handler takes to complete. It could be
>>>> there is a subtle bug somewhere causing the i2c transfers to take
>>>> longer when run from a (threaded) irq handler. That would be weird
>>>> though, so I don't expect this to result in any useful findings.
>>>>
>>>
>>> I also doubted if it takes too much time for the i2c-hid handler to
>>> finish reading i2c transfer, processing data and delivering to the input
>>> system. After measuring the time internal between the starting of the
>>> GPIO irq's parent handler and when pin#130 is unmasked, we can exclude
>>> this possibility.
>>>
>>> I have been wondering if we let make pin#130 have low input thus to
>>> trigger a interrupt firing or assert the GPIO's common interrupt output
>>> line manually thus we can measure how long does it take for the kernel
>>> to receive the signal. But once GPIO's pin is programmed to be a
>>> interrupt line we can't write anything to it and it seems other
>>> interrupts can only be generated by the hardware. So this idea is not
>>> plausible
>>>
>>
>> Btw, there are other users who have the same laptop model but with a
>> different touchpad (ELAN). Their touchpads would show in
>> /proc/bus/input/devices but are completely dead. hid-recorder which
>> will read HID reports from /dev/hidraw gets nothing if they put there
>> fingers on the touchpad but the polling mode could also save their
>> touchpads. It seems GPIO controller's parent irq for the ELAN touchpad
>> doesn't even fire once. And unlike GPIO, IO-APIC has also be used by
>> other devices like the keyboard. So maybe it's safe to assert the root
>> cause is from the GPIO controller.
>>
>>>> Other then that I'm all out of ideas I'm afraid.
>>>>
>>> Thank you for taking time to investigate this issue anyway! Have a nice
>>> weekend:)
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>
>>> -- 
>>> Best regards,
>>> Coiby
>>
>> -- 
>> Best regards,
>> Coiby
> 
> -- 
> Best regards,
> Coiby
> 


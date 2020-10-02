Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130DB2810D8
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 12:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgJBK72 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 06:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgJBK71 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 06:59:27 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39D4C0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 03:59:27 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id s14so684607pju.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TMaRVRmNtxyG8nwPY0bS73whq3LcZ7pPS5P5niBlou4=;
        b=AfEiUFUNAsST5n3MSSnXwZmcsJ/oYOQuhYgfWIYbzKeSfako0BPkXSSp+BzEQ2iRiB
         5mTjF0tvsoXtRaolzNQKmTipex4ucrUF1u2/CrzWfNFtcEPb72movUYZ7bY9/rkSab+h
         lH+hgiOSYlrZh5FxWLt9xGz9N7spMn1QrHKiVupW85eHMW0fKC7TQcjdBNi3dNjOzNve
         MmO1pEeVrzl40qJ1ZSvgtOLnJ1LZNHiMK2YOg+ybIvLUtJvccmt1ZpRvm+kwAOWRinDH
         8d0GrbItgGkk4Bl2RUtVW6F4VITQqercDhDdooImVymtZAFiHQTbZcCEEdbqMBFnOFmw
         efpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TMaRVRmNtxyG8nwPY0bS73whq3LcZ7pPS5P5niBlou4=;
        b=Omqzd8RkEkXvRBW5z1bxIuEJQcxEoNc5qGUUSLGe72VHnMtTnZ49WefahDsQjk5h6k
         d5700Fg8X7+pl9s3E2v11UdsFHbBNEaUnUZvjEvL6i4SHcdfqYCSJAmjPLR+jhQdvwlT
         W2oaoZqrgku2coB/BGVyw+GCVwACSexgiMozntrraWBRbeEVs1OgH73nh7etw6uhyqFa
         NR2Af6EGUbrMTMm87a/ssxYwBcc/YYqlNIOy1KdoPd/r2BCNftDy7xUWqKG/+Vsp+TNi
         LJ32Lj8tzL/iXWv0WN0XxuD3U1XZ9IcayNukF76NrSvihSrBpMZ2brPH5mpvrXPopwgl
         bKMQ==
X-Gm-Message-State: AOAM530rlkqvGr5mipcJefwaIeI0Cs5ZkNLUmBmFQJfz4tWP1HbW1yMp
        /dBl8pAiA2l1y904yEkwdQU=
X-Google-Smtp-Source: ABdhPJybd8ge4Lt5JOzC1CxQvOuziH0Fw6rY+VI0bKFdJUsk+I6LX+DR2I3KjaQQZW9tJEzBqHgzUw==
X-Received: by 2002:a17:90a:55c8:: with SMTP id o8mr2111721pjm.215.1601636367279;
        Fri, 02 Oct 2020 03:59:27 -0700 (PDT)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id q5sm1499023pfn.172.2020.10.02.03.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 03:59:26 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 2 Oct 2020 18:59:06 +0800
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201002105906.r5yjih2o3oomlcy6@Rk>
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 01, 2020 at 10:57:40PM +0200, Linus Walleij wrote:
>Sorry for top posting, but I want to page some people.
>
>I do not know anything about ACPI, but Hans de Goede is really
>good with this kind of things and could possibly provide some
>insight.

Thank you for introducing Hans de Goede to me!

>
>Yours,
>Linus Walleij
>
>On Thu, Oct 1, 2020 at 3:23 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Hi,
>>
>> I'm trying to fix broken touchpads [1] for a new laptop model Legion-5
>> 15ARH05 which is shipped with two different touchpads, i.e., ElAN and
>> Synaptics. For the ELAN touchpad, the kernel receives no interrupts to
>> be informed of new data from the touchpad. For the Synaptics touchpad,
>> only 7 interrupts are received per second which makes the touchpad
>> completely unusable. Based on current observations, pinctrl-amd seems to
>> be the most suspicious cause.
>>
>>
>> Why do I think pinctrl-amd smells the most suspicious?
>> ======================================================
>>
>> This laptop model has the following hardware configurations specified
>> via ACPI,
>>   - The touchpad's data interrupt line is connected to pin#130 of a GPIO
>>     chip
>>
>>          GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>>                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x0082
>>                          }
>>
>>   - This GPIO chip (HID: AMDI0030) which is assigned with IRQ#7 has its
>>     common interrupt output line connected to one IO-APIC's pin#7
>>
>>          Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>          {
>>              0x00000007,
>>          }
>>
>> I add some code to kernel to poll the status of the GPIO chip's pin#130
>> and IO-APIc's pin#7 every 1ms when I move my finger on the surface of
>> the Synaptics touchpad continuously for about 1s. During the process of I
>> move my finger, most of the time,
>>   - GPIO chip's pin#130: low input, interrupt unmasked
>>   - IO-APIC's pin#7: IRR=0, interrupt unmasked (in fact mask/unmask_ioapic_irq
>>     have never been called by the IRQ follow controller handle_fasteoi_irq)
>>
>> So the touchpad has been generating interrupts most of the time while
>> IO-APIC controller hasn't been masking the interrupt from the GPIO chip.
>> But somehow the kernel could only get ~7 interrupts each second while
>> the touchpad could generate 140 interrupts (time resolution of 7.2ms)
>> per second. Assuming IO-APIC (arch/x86/kernel/apic/io_apic.c) is fine,
>> then there's something wrong with the GPIO interrupt controller which
>> works fine for the touchpad under Windows. Besides if I poll the touchpad
>> data based on pin#130's status, the touchpad could also work under
>> Windows.
>>
>> Ways to debug pinctrl-amd
>> =========================
>>
>> I can't find any documentation about the AMDI0030 GPIO chip except for
>> the commit logs of drivers/pinctrl/pinctrl-amd. One commit
>> ba714a9c1dea85e0bf2899d02dfeb9c70040427c ("pinctrl/amd: Use regular interrupt instead of chained")
>> inspired me to bring back chained interrupt to see if "an interrupt storm"
>> would happen. The only change I noticed is that the interrupts arrive in
>> pairs. The time internal between two interrupts in a pair is ~0.0016s
>> but the time internal between interrupt pairs is still ~0.12s (~8Hz).
>> Unfortunately, I don't get any insight about the GPIO interrupt
>> controller from this tweaking. I wonder if there are any other ways
>> to debug drivers/pinctrl/pinctrl-amd?
>>
>> Thank you!
>>
>>
>> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
>>
>> --
>> Best regards,
>> Coiby
>>

--
Best regards,
Coiby

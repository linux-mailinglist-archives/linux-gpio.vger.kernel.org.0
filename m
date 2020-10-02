Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B90D2815CC
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 16:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388135AbgJBOvk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 10:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387807AbgJBOvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 10:51:40 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17EF4C0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 07:51:40 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k8so1405096pfk.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wJcxOD77SOi4F6eicIBS6gyDI5+CTR1yLYH31VAExos=;
        b=IL02rXN9MYD7zxLhDV8lvsUr99u98GXYyr9dVupvXgiD3fes8PzWjySmzKNjAogj0N
         vYGu8LzOgfhRYCRe7cvI8prVE1GMksVE4eZUMWvGgm7XpA9sUcF04aiQerT14ySvS32h
         xjzy5qglcxYSzlnVT8Irl+2lyY4FWkJ04c4eM0W7lk6l0FEzG6t+sBas5gmmd0uobGWk
         mt7Kp+cnUvb/CBIVJkUGxMlOfMOrpW+5AfP/DvSld2w8CLKrKqgA8ukiBpP5e0pGL1Ry
         md2pTAEyn9IBaK0H+nnWLv0MO1B1vU6LW/szq9MDswyegVPPNeckA3YiP7VSg4EFwHbN
         ek/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wJcxOD77SOi4F6eicIBS6gyDI5+CTR1yLYH31VAExos=;
        b=b20TCYYrXMpTZyvZ9fFlZWLIscIkoFq89mLF/VVnKUA/YWIGs9+vgAzlByej5J2atB
         DsKepkT3JdYeAMZ9WJ1PW4lOXyPptGrEyQg7ESy9R+q6hTC1oho8oXWNpG7942eYupHa
         eiuwd9mLHofp2Q9FTaooMGNvxp9c9uVUBZJFcv6tDoWlFhrXGrBBqL2sGEq1B3aO6y0h
         yZ0YMP2tNGM3O9k6uSuL6OQbZlczAWjF1aZ5i1dNVJc6yZb01BJpP9bYC+f6HBmhDuzM
         c35JKrks56DeSZlGV6Y3qKTMMNsOpQoLQ0JRmNffVS/D2IFIBniOH5JEcR6zwFvZmUmm
         sZ+A==
X-Gm-Message-State: AOAM532790HsSjPxSdiafSnRbvltQp5IvEGmoCZ11wLSmgvuswZgPHAz
        K9H+gWamy8mqhesNTDHTf20=
X-Google-Smtp-Source: ABdhPJycU9svHwiy8XBwD2dpbHzP9AUrp9w5wWHPJ2Dph9bC3Ke7dzz50EaVR7Rfx40ww15QiHM7hA==
X-Received: by 2002:a05:6a00:1356:b029:13e:d13d:a084 with SMTP id k22-20020a056a001356b029013ed13da084mr2989809pfu.27.1601650299551;
        Fri, 02 Oct 2020 07:51:39 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id i36sm1916127pgm.43.2020.10.02.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 07:51:38 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 2 Oct 2020 22:51:33 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201002145133.a43ypm2z7ofgtt7u@Rk>
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:
>Hi,
>
>On 10/2/20 2:42 PM, Coiby Xu wrote:
>>On Fri, Oct 02, 2020 at 11:40:12AM +0200, Hans de Goede wrote:
>>>Hi,
>>>
>>>On 10/1/20 10:57 PM, Linus Walleij wrote:
>>>>Sorry for top posting, but I want to page some people.
>>>>
>>>>I do not know anything about ACPI, but Hans de Goede is really
>>>>good with this kind of things and could possibly provide some
>>>>insight.
>>>
>>>Thanks, although I'm honored to be considered the go to person
>>>for these kinda things my specialty really lies with these
>>>kinda issues with intel Bay Trail and Cherry Trail SoCs
>>>never the less let me take a look.
>>
>>Thank you for taking time to examine this touchpad issue!
>>
>>>
>>>>On Thu, Oct 1, 2020 at 3:23 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>>>>
>>>>>Hi,
>>>>>
>>>>>I'm trying to fix broken touchpads [1] for a new laptop model Legion-5
>>>>>15ARH05 which is shipped with two different touchpads, i.e., ElAN and
>>>>>Synaptics. For the ELAN touchpad, the kernel receives no interrupts to
>>>>>be informed of new data from the touchpad. For the Synaptics touchpad,
>>>>>only 7 interrupts are received per second which makes the touchpad
>>>>>completely unusable. Based on current observations, pinctrl-amd seems to
>>>>>be the most suspicious cause.
>>>>>
>>>>>
>>>>>Why do I think pinctrl-amd smells the most suspicious?
>>>>>======================================================
>>>>>
>>>>>This laptop model has the following hardware configurations specified
>>>>>via ACPI,
>>>>>  - The touchpad's data interrupt line is connected to pin#130 of a GPIO
>>>>>    chip
>>>>>
>>>>>         GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>>>>>                         "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>>>>>                         )
>>>>>                         {   // Pin list
>>>>>                             0x0082
>>>>>                         }
>>>>>
>>>>>  - This GPIO chip (HID: AMDI0030) which is assigned with IRQ#7 has its
>>>>>    common interrupt output line connected to one IO-APIC's pin#7
>>>>>
>>>>>         Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>>>>         {
>>>>>             0x00000007,
>>>>>         }
>>>
>>>So these both look fine.
>>>
>>>>>I add some code to kernel to poll the status of the GPIO chip's pin#130
>>>>>and IO-APIc's pin#7 every 1ms when I move my finger on the surface of
>>>>>the Synaptics touchpad continuously for about 1s. During the process of I
>>>>>move my finger, most of the time,
>>>>>  - GPIO chip's pin#130: low input, interrupt unmasked
>>>>>  - IO-APIC's pin#7: IRR=0, interrupt unmasked (in fact mask/unmask_ioapic_irq
>>>>>    have never been called by the IRQ follow controller handle_fasteoi_irq)
>>>>>
>>>>>So the touchpad has been generating interrupts most of the time while
>>>>>IO-APIC controller hasn't been masking the interrupt from the GPIO chip.
>>>>>But somehow the kernel could only get ~7 interrupts each second
>>>
>>>So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>the GPIO controllers parent irq ?
>>>
>>>Also to these 7 interrupts/sec stop happening when you do not touch the
>>>touchpad ?
>>>
>>I see these 7 interrupts / second for the GPIO controller's parent irq.
>>And they stop happening when I don't touch the touchpad.
>
>Only from the parent irq, or also on the touchpad irq itself ?
>
>If this only happens on the parent irq, then I would start looking at the
>amd-pinctrl code which determines which of its "child" irqs to fire.

This only happens on the parent irq. The input's pin#130 of the GIPO
chip is low most of the time and pin#130.
>
>>>To me this sounds like the interrupt is configured as being triggered on
>>>a negative edge so that it only fires once when the line from the touchpad
>>>goes low, and for some reason 7 times a second the touchpad controller
>>>briefly releases the line (sorta gives up to signal the irq and then
>>>tries again?).
>>>
>>>>>while
>>>>>the touchpad could generate 140 interrupts (time resolution of 7.2ms)
>>>>>per second. Assuming IO-APIC (arch/x86/kernel/apic/io_apic.c) is fine,
>>>>>then there's something wrong with the GPIO interrupt controller which
>>>>>works fine for the touchpad under Windows. Besides if I poll the touchpad
>>>>>data based on pin#130's status, the touchpad could also work under
>>>>>Windows.
>>>
>>>I agree that this sounds like a problem with the GpioInt handling.
>>>
>>>>>Ways to debug pinctrl-amd
>>>>>=========================
>>>>>
>>>>>I can't find any documentation about the AMDI0030 GPIO chip except for
>>>>>the commit logs of drivers/pinctrl/pinctrl-amd. One commit
>>>>>ba714a9c1dea85e0bf2899d02dfeb9c70040427c ("pinctrl/amd: Use regular interrupt instead of chained")
>>>>>inspired me to bring back chained interrupt to see if "an interrupt storm"
>>>>>would happen. The only change I noticed is that the interrupts arrive in
>>>>>pairs. The time internal between two interrupts in a pair is ~0.0016s
>>>>>but the time internal between interrupt pairs is still ~0.12s (~8Hz).
>>>>>Unfortunately, I don't get any insight about the GPIO interrupt
>>>>>controller from this tweaking. I wonder if there are any other ways
>>>>>to debug drivers/pinctrl/pinctrl-amd?
>>>
>>>The way I would try to debug this (with access to the hardware) is
>>>to try an verify the interrupt trigger (level vs edge) settings inside
>>>pinctrl/amd by adding a bunch of printks printing them whenever the
>>>relevant register bits are touched.
>>>
>>>So I'm going to guess here that these touchpads use i2c-hid, so I
>>>took a quick peak at the i2c-hid irq request code from
>>>drivers/hid/i2c-hid/i2c-hid-core.c:
>>>
>>>       unsigned long irqflags = 0;
>>>       int ret;
>>>
>>>       dev_dbg(&client->dev, "Requesting IRQ: %d\n", client->irq);
>>>
>>>       if (!irq_get_trigger_type(client->irq))
>>>               irqflags = IRQF_TRIGGER_LOW;
>>>
>>>       ret = request_threaded_irq(client->irq, NULL, i2c_hid_irq,
>>>                                  irqflags | IRQF_ONESHOT, client->name, ihid);
>>>
>>>So this tries to preserve the pre-configured irq-type on the irq
>>>line and if no irq-type is set then it overrides the trigger-type
>>>to IRQF_TRIGGER_LOW, which means level-low.
>>>
>>>One quick hack you can try is ommenting out the "if (!irq_get_trigger_type(client->irq))"
>>>type, I guess maybe the pinctrl-amd code is defaulting all IRQs to some
>>>edge trigger type? This should override it and recontrol it to
>>>a level trigger type.
>>>
>>Yes, "these touchpads use i2c-hid". I have examined the configuration of
>>irq-type in drivers/hid/i2c-hid/i2c-hid-core.c and can confirm it's been
>>configured to be level-low.
>>
>>$ sudo cat /sys/kernel/debug/gpio|grep -A1 pin130
>>260:pin130      Level trigger| Active low| interrupt is enabled| interrupt is unmasked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>>
>>(Of course we rely on drivers/pinctrl/pinctrl-amd.c to read&interpret
>>data from the corresponding registers. If pinctrl-amd is return false
>>reports, we can do nothing about this)
>
>Well you could review the code printing this vs say the code setting
>the trigger type. If those don't match then something is definitely
>wrong somewhere.
>
Thank you for the suggestion! I just did a review and didn't find
anything suspicious. Before, I thought I need some hardware specs to
confirm the code is written following the specs but I can't find any
documentation. And pinctrl-amd has proven to be working for other
laptop model although there were several touchpad issues caused by
pinctrl-amd which have been fixed. So I can assume there's nothing
wrong with basic functionalities like setting interrupt trigger
type.

>>Btw, we can't make any change in i2c-hid because they will be overridden
>>by drivers/pinctrl/pinctrl-amd.c which use the values from the ACPI tables
>>instead,
>>
>>static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>{
>>
>>     /* Ignore the settings coming from the client and
>>      * read the values from the ACPI tables
>>      * while setting the trigger type
>>      */
>>
>>     irq_flags = irq_get_trigger_type(d->irq);
>>     if (irq_flags != IRQ_TYPE_NONE)
>>         type = irq_flags;
>>}
>
>That looks a bit fishy, sometimes we need to override the irq-type from
>a driver because the ACPI tables of various devices are often of
>dubious quality. AFAIK non of the Intel GPIO drivers do something like
>this...
>
>Also I'm not seeing this in the latest upstream code, so I guess this
>bit got recently dropped ... ?
>
>What kernel version are you testing with? You really should always test
>things like this with Linus' latest master branch.
>

Sorry for the confusion! I use 5.7.4 for testing which was the latest
version when I had this laptop. And this part of code of overriding
the irq-type indeed has indeed been removed on Jun 26.

I has been sticking with 5.7.4 because some users who also own this
laptop have been actively reporting the results with the latest kernel
and I occasionally test it myself (for example, today I checked 5.9 rc6).
I will use the latest kernel to reduce the communication cost.

>Hmm, I wonder if this is not an i2c-controller issue instead. But you should
>that you tried to modify the i2c-hid code to poll the GPIO and then run its
>threaded-irq handler on a successfull poll instead works around things, right ?
>
>Still it would be interesting to add a printk to the begin + end of the
>i2c-hid threaded-irq-handler to see how long it takes to run.
>
Yes. Polling the touchpad based on pin#130's status could make the
touchpad work which has been confirmed by other affected user.
I have already examined i2c-controller, i2c-hid and hid-multoutch
before focusing on pinctrl-amd. The i2c-hid threaded-irq-handler
can process ~500 interrupts at maximum. Based on these evidences
(for the details, please check https://www.spinics.net/lists/linux-input/msg69267.html),
I think I could move on to examine pinctrl-amd.
>
>Regards,
>
>Hans
>
>
>
>>Also, With CONFIG_GENERIC_IRQ_DEBUGFS enabled, `cat /sys/kernel/debug/irq/irqs/72`
>>also shows irq#72 (#72 is requested IRQ of this touchpad device) has the
>>expected irq-type,
>>
>>$ cat /sys/kernel/debug/irq/irqs/72
>>handler:  handle_level_irq
>>device:   (null)
>>status:   0x00000508
>>             _IRQ_NOPROBE
>>istate:   0x00000020
>>             IRQS_ONESHOT
>>ddepth:   0
>>wdepth:   0
>>dstate:   0x00402208
>>             IRQ_TYPE_LEVEL_LOW
>>             IRQD_LEVEL
>>             IRQD_ACTIVATED
>>             IRQD_IRQ_STARTED`
>>
>>>###
>>>
>>>As you said hopefully the IOApic code is fine. Notice that the ioapic
>>>irqchip driver does not allow configuring the trigger type.
>>>
>>
>>Yes. unlike pinctrl-amd, arch/x86/kernel/apic/io_apic.c doesn't provide
>>`(struct irq_chip*)->irq_set_type`. I notice during the setting-up of
>>ia-apic, all pins are configured with edge-high according to the IRQ
>>redirection table which can be printed out with the "apic=debug" kernel
>>parameter,
>>
>>     .... IRQ redirection table:
>>     IOAPIC 0:
>>      pin00, disabled, edge , high, V(00), IRR(0), S(0), physical, D(00), M(0)
>>
>>      pin06, enabled , edge , high, V(06), IRR(0), S(0), physical, D(00), M(0)
>>      pin07, disabled, edge , high, V(00), IRR(0), S(0), physical, D(00), M(0)
>>
>>Later, I manually printed out the IRQ redirection table when processing
>>touchpad HID reports, pin07 (which is connected with the GPIO's common
>>interrupt output line) has adopted the expected configuration,
>>
>>     pin07, enabled , level, low , V(07), IRR(1), S(0), physical, D(00), M(0)
>>
>>Today I played with the "noapic" kernel parameter to use PIC mode
>>so we can confirm there is nothing wrong with io-apic. Unfortunately
>>the I2C adapter can't be set-up (the error is "controller timed out").
>>As a consequence, the touchpad as an I2C client won't work either.
>>
>>And I can't find a way to disable APIC for Windows either.
>>
>>>I guess
>>>this is not part of the ioapic spec and that the BIOS/firmware is setting
>>>the triggerlevel in a io-apic implementation specific way, so we better hope
>>>it is right. I have had the unfortunate experience to try and debug a wrong
>>>io-apic irq-pin trigger-type issue with TPMs in some Lenovo thinkpads and
>>>in the end only the Lenovo BIOS team could fix this.
>>
>>If the same BIOS/firmware is setting the trigger level in a wrong way,
>>shouldn't we find the same issue under Windows? Btw, I've set
>>'acpi_osi="Windows 2015"'
>>as the kernel parameter before but I didn't notice any change.
>>
>>>Regards,
>>>
>>>Hans
>>>
>>
>>--
>>Best regards,
>>Coiby
>>
>

--
Best regards,
Coiby

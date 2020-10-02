Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90969281000
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 11:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgJBJkU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 05:40:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53698 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725993AbgJBJkU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 05:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601631617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/dMiVsDER1zFmyVOBhbycyPqnOlZvAcxdZDo0uKI5lw=;
        b=CaDO0xfDdlrzJpLz3wO1Vw5QtiNFjhG+dt2Ud9Fqo12glWWtH9cKjgjbRs8wwNULFaMsJ5
        gRdtI2aJoTU/9C9mb4vL6Yl66sNyqGamQpy8acczzJt3lBiayuFPqeFEzxVAVDJKDrAkV6
        0srQ0ChfpSkyNVHD/+8nQbnr1ciJrQM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-YSKTaA3pNNCAKE4zb5tWfg-1; Fri, 02 Oct 2020 05:40:16 -0400
X-MC-Unique: YSKTaA3pNNCAKE4zb5tWfg-1
Received: by mail-ed1-f71.google.com with SMTP id c3so398506eds.6
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 02:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/dMiVsDER1zFmyVOBhbycyPqnOlZvAcxdZDo0uKI5lw=;
        b=HPXNV83qyK4cYesz8mtcWtZK9TEsj4AzfjIVqTyDfLHIQRvbavmEltBOZJ1JPo5qbc
         y1eXxQHfaVWN3eQKq6k+kwOp6FVdGdA8Ffq0xiejgnPHR7CiosT/UjQ9c4rlVBeTWWWW
         pmY9s6z5ttviLW8vsICXIGu/hURkduB+1rssBp+CR3yVyRTYLq8BhIqMQktGm7ojVGyD
         j9l6joaEI8b2zyau4/X4gJyORDLNeK1wtwqUUsZqtZaHsEPP3sxET6WPAwnfivZ1yJKy
         Rvbpw9tjwMRcWrrFVGVbnJcITsFvgad6zT2JWDIW8S3qpbDlE3FSf2aVFmyEvWp2J7iH
         39eg==
X-Gm-Message-State: AOAM531xLmBGRhq7OePef3ZLAZ/ijMUP6bmKFnHf2AyRhtTvQL7hg6I/
        gAeb51/x4CckD4JE/N6AJHH4iXJeNYQCzlZp/QrLX81Xf6wXdc+G4U9cp6t5KY7m3DaK4Z3gI+j
        f/HZRBjoajmGCcDMtonJMhA==
X-Received: by 2002:aa7:dcd9:: with SMTP id w25mr1323966edu.280.1601631614790;
        Fri, 02 Oct 2020 02:40:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV1FgWnKSmtTYuizsKzR/37y37MuO4Jw9gPZJDBdVBKlbKJSjhJe46W1GSO05onZNKRe+A0Q==
X-Received: by 2002:aa7:dcd9:: with SMTP id w25mr1323955edu.280.1601631614504;
        Fri, 02 Oct 2020 02:40:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id s7sm767263edu.71.2020.10.02.02.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 02:40:13 -0700 (PDT)
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Linus Walleij <linus.walleij@linaro.org>,
        Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
Date:   Fri, 2 Oct 2020 11:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/1/20 10:57 PM, Linus Walleij wrote:
> Sorry for top posting, but I want to page some people.
> 
> I do not know anything about ACPI, but Hans de Goede is really
> good with this kind of things and could possibly provide some
> insight.

Thanks, although I'm honored to be considered the go to person
for these kinda things my specialty really lies with these
kinda issues with intel Bay Trail and Cherry Trail SoCs
never the less let me take a look.

> On Thu, Oct 1, 2020 at 3:23 PM Coiby Xu <coiby.xu@gmail.com> wrote:
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
>>    - The touchpad's data interrupt line is connected to pin#130 of a GPIO
>>      chip
>>
>>           GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>>                           "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>>                           )
>>                           {   // Pin list
>>                               0x0082
>>                           }
>>
>>    - This GPIO chip (HID: AMDI0030) which is assigned with IRQ#7 has its
>>      common interrupt output line connected to one IO-APIC's pin#7
>>
>>           Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>           {
>>               0x00000007,
>>           }

So these both look fine.

>> I add some code to kernel to poll the status of the GPIO chip's pin#130
>> and IO-APIc's pin#7 every 1ms when I move my finger on the surface of
>> the Synaptics touchpad continuously for about 1s. During the process of I
>> move my finger, most of the time,
>>    - GPIO chip's pin#130: low input, interrupt unmasked
>>    - IO-APIC's pin#7: IRR=0, interrupt unmasked (in fact mask/unmask_ioapic_irq
>>      have never been called by the IRQ follow controller handle_fasteoi_irq)
>>
>> So the touchpad has been generating interrupts most of the time while
>> IO-APIC controller hasn't been masking the interrupt from the GPIO chip.
>> But somehow the kernel could only get ~7 interrupts each second

So are you seeing these 7 interrupts / second for the touchpad irq or for
the GPIO controllers parent irq ?

Also to these 7 interrupts/sec stop happening when you do not touch the
touchpad ?

To me this sounds like the interrupt is configured as being triggered on
a negative edge so that it only fires once when the line from the touchpad
goes low, and for some reason 7 times a second the touchpad controller
briefly releases the line (sorta gives up to signal the irq and then
tries again?).

>> while
>> the touchpad could generate 140 interrupts (time resolution of 7.2ms)
>> per second. Assuming IO-APIC (arch/x86/kernel/apic/io_apic.c) is fine,
>> then there's something wrong with the GPIO interrupt controller which
>> works fine for the touchpad under Windows. Besides if I poll the touchpad
>> data based on pin#130's status, the touchpad could also work under
>> Windows.

I agree that this sounds like a problem with the GpioInt handling.

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

The way I would try to debug this (with access to the hardware) is
to try an verify the interrupt trigger (level vs edge) settings inside
pinctrl/amd by adding a bunch of printks printing them whenever the
relevant register bits are touched.

So I'm going to guess here that these touchpads use i2c-hid, so I
took a quick peak at the i2c-hid irq request code from
drivers/hid/i2c-hid/i2c-hid-core.c:

         unsigned long irqflags = 0;
         int ret;

         dev_dbg(&client->dev, "Requesting IRQ: %d\n", client->irq);

         if (!irq_get_trigger_type(client->irq))
                 irqflags = IRQF_TRIGGER_LOW;

         ret = request_threaded_irq(client->irq, NULL, i2c_hid_irq,
                                    irqflags | IRQF_ONESHOT, client->name, ihid);

So this tries to preserve the pre-configured irq-type on the irq
line and if no irq-type is set then it overrides the trigger-type
to IRQF_TRIGGER_LOW, which means level-low.

One quick hack you can try is ommenting out the "if (!irq_get_trigger_type(client->irq))"
type, I guess maybe the pinctrl-amd code is defaulting all IRQs to some
edge trigger type? This should override it and recontrol it to
a level trigger type.

###

As you said hopefully the IOApic code is fine. Notice that the ioapic
irqchip driver does not allow configuring the trigger type. I guess
this is not part of the ioapic spec and that the BIOS/firmware is setting
the triggerlevel in a io-apic implementation specific way, so we better hope
it is right. I have had the unfortunate experience to try and debug a wrong
io-apic irq-pin trigger-type issue with TPMs in some Lenovo thinkpads and
in the end only the Lenovo BIOS team could fix this.

Regards,

Hans


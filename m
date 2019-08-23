Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E35F9B659
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 20:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405146AbfHWSsT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 14:48:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35062 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387927AbfHWSsT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Aug 2019 14:48:19 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E16B95FD40
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 18:48:17 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id b135so3237162wmg.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 11:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sGNGnqO2CgLpFM1iKS6qRwAXyoExthyJKcp7kUqVmWM=;
        b=la2ptKkRFPnZnWTQVP/bYBIF5OjJfkd3W1z9YAXZcM3WWaOgGDvCoFRoZUMf6NhvcN
         Yw1Aiwm0dcxYUekaTt638rebbTpKUu2uaoTmytEfy8wDC3c7snCRmx9N8ffpwrbFE0eL
         pbTCXORDOOiCIZNGEWFlMmeTjIZ6iMAWFbDxSwP1QYA7Lt5aoDwIRTnoB5+aUIPSV3p8
         +jCAwpDj5Wp6cw5s8ZtC/q5hOD2vHh3cLyO0Qt96oKxH+zMqLULXXzsxnMrDTUXNbT2w
         lMOBLG9Tu9avfTuB8tZzfbmC1u7WNKhPRy1JrdkDLatGYJJSF+/GrJEoVLj5Rs76Yfoi
         Gk/Q==
X-Gm-Message-State: APjAAAX/cUtECH1ROrv4gNfxiclLrgz87nj3xZhpCw/dIuHfBVJprNXn
        WLdxCY/+fJ/FBICfEonqEFNI+Z017QGBE7LXHPWB0WTgVY0io0TQ1sRGQeimwPpSXfk7INluuSn
        8AYA3MqbvnMcR0HgpmOzqpg==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr6326225wrr.124.1566586096635;
        Fri, 23 Aug 2019 11:48:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxyBWs5nYiTra5Je385RvMcKrClvmEsC3wJTCjjFQImHQ6mFhu1UD5pfOGNuAqAz3TDXwsTg==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr6326214wrr.124.1566586096450;
        Fri, 23 Aug 2019 11:48:16 -0700 (PDT)
Received: from dhcp-44-196.space.revspace.nl ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
        by smtp.gmail.com with ESMTPSA id m188sm7246594wmm.32.2019.08.23.11.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 11:48:15 -0700 (PDT)
Subject: Re: gpiolib-acpi problematic trigger of edge events during boot
To:     Daniel Drake <drake@endlessm.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Endless Linux Upstreaming Team <linux@endlessm.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <CAD8Lp47Le8CBkc3HN4_8+x6ZqR5eiwbVh+VbnfFysKgPgErptQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c122b8e8-f124-040a-aadd-8d9b58393d48@redhat.com>
Date:   Fri, 23 Aug 2019 20:48:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD8Lp47Le8CBkc3HN4_8+x6ZqR5eiwbVh+VbnfFysKgPgErptQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Daniel,

On 8/23/19 4:59 AM, Daniel Drake wrote:
> Hi,
> 
> acpi_gpiochip_request_irq() has this code:
> 
>      /* Make sure we trigger the initial state of edge-triggered IRQs */
>      value = gpiod_get_raw_value_cansleep(event->desc);
>      if (((event->irqflags & IRQF_TRIGGER_RISING) && value == 1) ||
>          ((event->irqflags & IRQF_TRIGGER_FALLING) && value == 0))
>          event->handler(event->irq, event);
> 
> Originally introduced in:
> commit ca876c7483b697b498868b1f575997191b077885
> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Date:   Thu Jul 12 17:25:06 2018 +0200
> 
>      gpiolib-acpi: make sure we trigger edge events at least once on boot
> 
> This code is causing a problem on a new consumer laptop, which is
> based on the new ACPI reduced hardware standard. Under this design,
> the power button is now just an ordinary GPIO that should be handled
> by software: ACPI's _AEI method lists this GPIO as one that the OS
> should monitor for changes, and the OS is expected to call the
> corresponding _EVT method when that happens, which will in turn raise
> a Notify event on the power button device.
> 
> Here, the GpioInt defined in _AEI is Edge-triggered, ActiveHigh. The
> GPIO level is ordinarily high, but goes low when the button is
> pressed. We checked this definition and behaviour with the vendor,
> even suggesting that it should maybe be ActiveLow instead, but they
> responded that this is correct and by-design.
> 
> These conditions set the IRQF_TRIGGER_RISING flag and cause the _EVT
> event handler to be called by the code above as soon as the pinctrl
> module is loaded. In other words, loading the pinctrl driver causes
> the system to incorrectly believe the power button has been pressed so
> it will immediately go into suspend or shutdown.
> 
> Fortunately this is perhaps not a serious issue, as at least Ubuntu
> and Endless build the corresponding pinctrl drivers directly into the
> kernel image. They are then loaded in early boot, and despite a power
> button event being reported, it's so early that userspace doesn't
> notice and no action is taken.
> 
> But I raise this anyway as a potential problem should that ever
> change, it may also become a more widespead issue as the ACPI reduced
> hardware standard becomes more and more common in consumer devices.
> 
> Any ideas for how we can better deal with this issue?
> 
> I can see the rationale for handling the specific cases mentioned in
> the original commit message, but at the same time this code seems to
> be assuming that an edge transition has happened, which is not true in
> this case.

The code does not as much assume that an edge has happened as well
that calling the handler unnecessarily is safely to do, IOW that
it only sets state which may have already been set to the same
state, without any side-effects.

In your power-button example this clearly is not true.

I picked up Benjamin's patch (which he wrote for the surface 3)
because I have been seeing the second issue (micro-usb-b ports
not working on device mode unless first forced to host mode)
and quite a few different Cherry Trail devices.

Yesterday and today I have actually been working on an issue
where the root cause is also this issue. The case I'm working on
is the HDMI output of the Minix Neo Z83-4 Mini PC not working.

The problem is the DSDT for this Cherry Trail device has been copy
and pasted from a tablet and thus has the host/device role switch code
(even though the Mini PC has no micro USB connector at all).
For some reason the _AEI handler for this is also bit-banging the DDC
data pin of the HDMI connector, flipping it from its DDC special function
into GPIO mode, breaking DDC on the HDMI connector.

As mentioned in another mail-thread my plan to fix this is:

1) Add a gpiolib_acpi_run_edge_events_on_startup kernel parameter which
controls this behavior

2) Make this default paramter to auto which uses a DMI blacklist

But I have the feeling that $otherOS (aka Windows) does not do this
and that if we hit more cases we may need to completely stop doing
this or switch to a whitelist. Although the whitelist for the micro-usb
role-sw thingie is going to be huge (Windows does not do device mode so
it does not care).

Anyways for now I think a blacklist is a good approach we can
re-evaluate if it grows too much.

Daniel, I will Cc you on the patch adding the blacklist, if you
want you can add the laptop you are seeing this on to the list, although
as you mentioned ATM this does not seem to be a real problem on that
laptop, so I'm not 100% sure if we should add it to the blacklist.

Regards,

Hans






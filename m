Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDBD6416B1
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 13:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiLCM3U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 07:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiLCM3S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 07:29:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177B419023
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 04:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670070495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=59luDbOiMKxKctSq5vQdKkfPCytrueeeP3Jshzqy+ps=;
        b=hVczSBh5ZdkjvNV9gP05kephRyHoPWoXlMsJiWjR08ajL5VUi3szvCgjlXrEY5ST1sPCmK
        lQENIr6DgFjn5kQ5OtFgF9FJovhkj4Bo2FAIhU/TFlikIKLg5jXbG09TyzRMeSOdSr5jFE
        SEd3a25L85DudU32wmidkcbkFAefZq0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-ZPk6XvKYMLuinXMoa7oVrg-1; Sat, 03 Dec 2022 07:28:14 -0500
X-MC-Unique: ZPk6XvKYMLuinXMoa7oVrg-1
Received: by mail-ej1-f70.google.com with SMTP id qb2-20020a1709077e8200b007bf01e43797so5110579ejc.13
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 04:28:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59luDbOiMKxKctSq5vQdKkfPCytrueeeP3Jshzqy+ps=;
        b=p76Ulnz9hlDkP8CCJFbsr3tW/VprkPpbCfR9VCRXA+K2ffljZaN93fdIR0zIUUqiwF
         Gf8eOF5RFtqZNu2XgxNFA2VNwrFIGlkwpspx6r6glRPOtuONMSj1sLLgLpcD0gY/7Df6
         qZOlBYyna9PEAehLAeYoGWgs4Z6cL1RsZB6qojZ7KKazvcSBTTbsv2hxh+T6vIbCkdUZ
         oiQzhf+jlZOCMYFzo955d3W28AgcopMz5M3+7ShfWFKP4eoehrd7p/QbIIWx+xx2aeHo
         pDFyY8CNZdug+ddsSxIu7tFPXKNBRr+uAtJeLGUdscD9jQifykRKTC7vG813v62HEeH0
         Rk9g==
X-Gm-Message-State: ANoB5plM5TDyinmFFxxMy6JKAPLCo0Au8paV3EJirKXmElemn0XU4hA0
        sotlewcxi8SbsSXFo5JEh4zRzQeGb/CIa1DhubS9SrPfEySjQGtgzh5zb9jbV2hTXd5Dl//rKHF
        ulFlMpyJV+RLuqcdhXHSs0g==
X-Received: by 2002:a17:906:6ac1:b0:7c0:9a3:87ff with SMTP id q1-20020a1709066ac100b007c009a387ffmr23578789ejs.505.1670070492945;
        Sat, 03 Dec 2022 04:28:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Phk4/EX1QwDCEUsGg/HEG78cVvaFcy9t2WdeDrCuBWsltrBIbyFacHn1OHh//Eu74QVivxg==
X-Received: by 2002:a17:906:6ac1:b0:7c0:9a3:87ff with SMTP id q1-20020a1709066ac100b007c009a387ffmr23578782ejs.505.1670070492677;
        Sat, 03 Dec 2022 04:28:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906293200b0077b2b0563f4sm4181611ejd.173.2022.12.03.04.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 04:28:12 -0800 (PST)
Message-ID: <f79b9397-64af-894a-411c-5595fa136008@redhat.com>
Date:   Sat, 3 Dec 2022 13:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/5] gpio/media/int3472: Add support for tps68470
 privacy-LED output
Content-Language: en-US, nl
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <CACRpkda+3e6jLq4WkyiCFcvL_rO1tAf_TvO5B9kikkii+6vSnA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkda+3e6jLq4WkyiCFcvL_rO1tAf_TvO5B9kikkii+6vSnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/3/22 10:32, Linus Walleij wrote:
> On Mon, Nov 28, 2022 at 10:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Patches 1-2: 2 small bugfixes to the gpio-tps68470 code
> 
> Good, please merge this.
> 
>> Patch3:      Add support for the indicator LED outputs on the tps68470 as GPIOs
>> Patch4:      Add support for a privacy LED to the ov8865 sensor driver
>> Patch5:      Add gpio-lookup table entry for the privacy LED.
> 
> OK so I have to call out the hippo in the room:
> 
> these "gpios" are not called "gpios" anywhere else than in this
> patch. General purpose input/output, remember. These are special
> purpose LED control registers.
> 
> So can you provide a good explanation why these registers aren't
> handled in the drivers/led subsystem instead?

This was discussed in another thread:

https://lore.kernel.org/platform-driver-x86/20221124200007.390901-1-hdegoede@redhat.com/

There were 2 problems identified which has lead to the current
direction of just modelling at as an (output only) GPIO:

1. The LED class allows userspace control of the LED which is
bad from a privacy pov. This will make it easy, too easy
(was the conclusion) for spy-ware to turn on the camera without
the LED turning on.

Later in the thread it was pointed out that there is a flag to
suspend userspace control, we could use this to permanently disable
userspace control which I guess would be some what of a solution,
although we would then also need to look into disallow changing
triggers, because I think those could still be used as a way around
this.

2. GPIO(s) can be tied directly to the device so that on a device
with both front and back privacy-LEDs (real world example) doing
 gpiod_get(dev, "privacy-led") gets us the right privacy-led,
where as with LED class devices tying the sensor and LED class
device is going to be tricky.

> IIUC the leds subsystem has gained support for leds as resources.

Interesting that would mitigate problem 2 from above and since
people keep circling back to "its a LED please use the LED class",
this is definitely worth looking into.

Do you have any pointers / examples about led class devices as
resources?

###

Note though that these indicator LED outputs, both functionality
wise as well as at the register level of this PMIC only support
turning them on/off. So this maps pretty well to the GPIO subsystem
and all the functionality of the LED class subsystem is mostly
functionality which we want to avoid since we don't want userspace
control, neither directly through sysfs or by attaching triggers.

So this does map pretty well to just modelling it as a GPIO,
if we model this as a LED then we end up having to workaround
a bunch of stuff the LED subsytem does which we do not want in
this case. And this may even require patches to the LED subsystem
to disallow userspace changing the trigger (I would need to check).

So from my pov modelling this as an output-only GPIO pin is
actually a more KISS solution then involving the LED subsystem...

> I don't mind a LED driver inside of the GPIO driver if that is what
> it takes as a compromise, just that it should be handled by the right
> subsystem.

The PMIC already is a MFD device, so if we go the LED class route
we can just add a separate MFD child device for the new LED driver
to bind to.

> Given that flash leds which are used by cameras are already in
> drivers/leds/flash this should be no different and there will be more
> cameras with these privacy leds.

Actually this patch is for the back camera privacy LED on a
Microsoft Surface Go tablet. The front camera privacy LED is
directly attached to a GPIO of the main SoC. So for that camera
just adding a GPIO lookup table entry to map the ACPI provided
GPIO info to a "privacy-led" GPIO on the sensor i2c_client device
(which we already do for the "reset" and "powerdown" gpios) also
by far is the most KISS approach.

Doing things this way in the code translating the ACPI "magic"
to standard Linux device-model stuff is literary a single line
of code (add an extra case: to an existing list of cases in a
switch-case). Where as instantiating a LED class device for this
and then somehow tying that to the i2c_client for the sensor will
be more code.

So again treating these on/off only LEDs, where we want to
*disallow* userspace control, as a GPIO is by far the most KISS
solution.

Regards,

Hans


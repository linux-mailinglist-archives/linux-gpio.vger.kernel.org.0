Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2C26436F8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 22:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbiLEVig (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 16:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbiLEVid (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 16:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56EBD86
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 13:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670276257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dSHlqJgQ5FYhWZ5ycDFpDPChlFBxxAoblDZw3a/BinI=;
        b=QNbrily6H5ZeHIvMjR7BlHDBXbFNcoAdkqsNnSjHro1OC5lbXavtJ62n0nI9pbfCv2OoOh
        yQug6QWZvylmK3wrgFWTRkv6KMOr3Px+ai5JiN5fdI0BJB5MkeqL1xhsFOp0X23VAKt/o5
        YiqC/0nM/9Qe5hybKdY+EcloXk/OZww=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-250-O2w_caM7MEGzlj-mUSqCLA-1; Mon, 05 Dec 2022 16:37:35 -0500
X-MC-Unique: O2w_caM7MEGzlj-mUSqCLA-1
Received: by mail-ed1-f72.google.com with SMTP id q13-20020a056402518d00b00462b0599644so6818147edd.20
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 13:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSHlqJgQ5FYhWZ5ycDFpDPChlFBxxAoblDZw3a/BinI=;
        b=ZYpgxZAbdTte4vzNHy8mg2qIoz6zNPKemFPkxgcLgDxSHqDuVwt56nQXK4Xg2oOM3a
         Z7F1B2lvr7fYkWQ+oR/v3Xhq3gN+HeBywMDs/3B82D3s5l35ZdEHVcrcFGDnZetBydFp
         nOr4wbq52SQq+V4Jmx71FRG+4kh2JIqZsRzNeKZypI750r1X5fwDAyh0RZ/mTt9cGMhY
         TyeK0u9PMvKOftfqfklIOg63OLnuoz1iRMajUa92GoWYxquLvo4hRkGf0uEvqrUT2Ys0
         GWVh/jHCHNsRkeTzfXidBoMhTWSfJ2EdvHstaj1eh4xR5wVIDH4chus8lmI57B6Kb6HB
         H/MQ==
X-Gm-Message-State: ANoB5pmDIhE6X+POAWe+R4t5Lk/m8xywzno7yCz5dpIR4so3zkwTsRnn
        9ml8cyozwU5b4s8LwmjFPpzeuJYVTH6KrQKErrWLVXNMRON4IHyre1vgek0OQqiWbZj9R9n/ikY
        iSu97dJwjM3iFZXq0S9vD+w==
X-Received: by 2002:a50:fd9a:0:b0:46c:9976:8f53 with SMTP id o26-20020a50fd9a000000b0046c99768f53mr7237373edt.180.1670276254285;
        Mon, 05 Dec 2022 13:37:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6V0uswf8kKmZXmX/a/4Nv+6G/JpQkdgkk9RQk0JPZpSdw01z+x85lmeg/nXEBVsOVrLl0lJw==
X-Received: by 2002:a50:fd9a:0:b0:46c:9976:8f53 with SMTP id o26-20020a50fd9a000000b0046c99768f53mr7237357edt.180.1670276253995;
        Mon, 05 Dec 2022 13:37:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id t16-20020aa7db10000000b0045cf4f72b04sm230909eds.94.2022.12.05.13.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:37:33 -0800 (PST)
Message-ID: <97563c3d-2c75-1aae-905e-665b6bc9e0e2@redhat.com>
Date:   Mon, 5 Dec 2022 22:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/5] gpio/media/int3472: Add support for tps68470
 privacy-LED output
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <CACRpkda+3e6jLq4WkyiCFcvL_rO1tAf_TvO5B9kikkii+6vSnA@mail.gmail.com>
 <f79b9397-64af-894a-411c-5595fa136008@redhat.com>
 <e04eaaa0-1a5d-7f8f-9cd9-4a2117f83aab@redhat.com>
 <Y45iA/0kMlS9fjZ4@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y45iA/0kMlS9fjZ4@pendragon.ideasonboard.com>
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

On 12/5/22 22:26, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Dec 05, 2022 at 04:01:20PM +0100, Hans de Goede wrote:
>> On 12/3/22 13:28, Hans de Goede wrote:
>>> On 12/3/22 10:32, Linus Walleij wrote:
>>>> On Mon, Nov 28, 2022 at 10:44 PM Hans de Goede wrote:
>>>>
>>>>> Patches 1-2: 2 small bugfixes to the gpio-tps68470 code
>>>>
>>>> Good, please merge this.
>>>>
>>>>> Patch3:      Add support for the indicator LED outputs on the tps68470 as GPIOs
>>>>> Patch4:      Add support for a privacy LED to the ov8865 sensor driver
>>>>> Patch5:      Add gpio-lookup table entry for the privacy LED.
>>>>
>>>> OK so I have to call out the hippo in the room:
>>>>
>>>> these "gpios" are not called "gpios" anywhere else than in this
>>>> patch. General purpose input/output, remember. These are special
>>>> purpose LED control registers.
>>>>
>>>> So can you provide a good explanation why these registers aren't
>>>> handled in the drivers/led subsystem instead?
>>>
>>> This was discussed in another thread:
>>>
>>> https://lore.kernel.org/platform-driver-x86/20221124200007.390901-1-hdegoede@redhat.com/
>>>
>>> There were 2 problems identified which has lead to the current
>>> direction of just modelling at as an (output only) GPIO:
>>>
>>> 1. The LED class allows userspace control of the LED which is
>>> bad from a privacy pov. This will make it easy, too easy
>>> (was the conclusion) for spy-ware to turn on the camera without
>>> the LED turning on.
>>>
>>> Later in the thread it was pointed out that there is a flag to
>>> suspend userspace control, we could use this to permanently disable
>>> userspace control which I guess would be some what of a solution,
>>> although we would then also need to look into disallow changing
>>> triggers, because I think those could still be used as a way around
>>> this.
>>
>> I have spend today looking into the feasibility of using the LED
>> class subsystem instead of modelling these on/off only LEDs as a GPIO.
>>
>> Good news, there is a LED_SYSFS_DISABLE flag which also stops
>> userspace from messing with the trigger of the LED, so this
>> first issue can easily be fixed.
>>
>>> 2. GPIO(s) can be tied directly to the device so that on a device
>>> with both front and back privacy-LEDs (real world example) doing
>>>  gpiod_get(dev, "privacy-led") gets us the right privacy-led,
>>> where as with LED class devices tying the sensor and LED class
>>> device is going to be tricky.
>>>
>>>> IIUC the leds subsystem has gained support for leds as resources.
>>>
>>> Interesting that would mitigate problem 2 from above and since
>>> people keep circling back to "its a LED please use the LED class",
>>> this is definitely worth looking into.
>>>
>>> Do you have any pointers / examples about led class devices as
>>> resources?
>>
>> I have been looking into this, but atm the only way to tie a
>> led-classdev to a device is through a fwnode reference.
>>
>> Since this is x86 where there is no DTS file where we can
>> easily add this, I have been looking into doing this with
>> swnode-s.
>>
>> LED directly attached to main SoC GPIO
>> ======================================
>>
>> For the simple LED is attached to a GPIO on the main
>> SoC case, this requires 2 steps:
>>
>> 1. Have the INT3472 code register a LED classdev for the
>> privacy-led instead of a GPIO lookup table entry. This LED
>> classdev must have a swnode as fwnode, so that we can put
>> a reference to that swnode in a "leds" reference-array 
>> property on the sensor i2c_client. This is about a 100
>> lines of extra code and seems fine / doable.
>>
>> 2. Add a "leds" reference-array property on the
>> i2c_client device by adding a swnode with this property
>> to the i2c_client device.  This sounds straight forward
>> (once we have the swnode for the LED class-device to point to)
>> but this is actually not straight forward at all.
>>
>> There is a whole bunch of properties which needs to be
>> added on the sensor to describe the media-graph between
>> the sensor and the IPU, as well as what VCM (if any) is paired
>> up with the sensor. These properties are all added through
>> adding a swnode from the CSI bridge driver:
>>
>> drivers/media/pci/intel/ipu3/cio2-bridge.c
>>
>> But a device can only have one swnode added. So we cannot
>> add a swnode to the sensor i2c_client in the INT3472 code.
>>
>> Instead the only thing which we could do is give the swnode
>> for the privacy LED classdev a predictable name, derived
>> from the sensor's device name and then
>> have drivers/media/pci/intel/ipu3/cio2-bridge.c
>> call software_node_find_by_name() to get the swnode and
>> have it add the "leds" reference-array property on the
>> i2c_client device for the sensor.
>>
>> However the INT3472 code is shared between multiple ISP/IPU
>> implementations, so then we would need to duplicate this code
>> for the other IPU versions (currently IPU6 which is out of tree),
>> further complicating things.
>>
>> And this is for the direct usage of a SoC GPIO case.
>>
>>
>> LED attached to TPS68470 PMIC indicator LED pin
>> ===============================================
>>
>> In this case the LED-classdev should be instantiated
>> by a driver for a new TPS68470 MFD cell. But this
>> also introduces a bunch of probe ordering systems,
>> so modelling things as a LED classdev here would involve:
>>
>> 1. Making the IN3472 code create + register a swnode for
>> the LED classdev, this must be done here because of
>> probe ordering.
>>
>> 2. Make the IN3472 code create a new TPS68470 MFD cell
>> and pass the swnode as fwnode to this cell.
>>
>> 3. Write a new driver for the new TPS68470 MFD cell,
>> which registers a LED classdev using the fwnode from
>> the MFD cell as fwnode for the LED classdev.
>>
>>
>> And this still does not solve the issue of how to get
>> the privacy-LED as LED classdev model to work on the IPU6.
>>
>> Alternative approach
>> ====================
>>
>> An alternative approach, would be to add support for LED
>> lookup tables to the LED class code (like we already have
>> for GPIOs) and use this to allow tying a LED classdev to
>> a struct device on non devicetree platforms.
>>
>> Given the problems with the swnode approach from above
>> I believe that this would actually be better then
>> the swnode approach.
>>
>> Lookup tables like this use device-names, so we don't need
>> to have swnode-s ready for both the provider and the consumer
>> at the time of adding the lookup table entry. Instead all
>> that is necessary is to know the device-names of both
>> the provider and the consumer which are both known in
>> advance.
> 
> Thank you for all this research.
> 
>> Is this really worth all the trouble ?
>> ======================================
>>
>> So I really have to wonder what is using the LED 
>> classdev / framework actually buying us over using
>> modelling these on/off only LEDs as a GPIO ?
>>
>> I know that some (x86) have a flash-LED for the back
>> camera and given the experience with trying to tie
>> a LED class dev to a specific struct device (to the
>> sensor's i2c_client) I guess we are eventually going to
>> need some sort of lookup tables for tying LED class
>> devices to a specific device anyways.
> 
> Probably, but for those, the effort will pay off better, as we need to
> control the flash from userspace. For the privacy LED, I doubt we'll
> ever seen a system where we'll have to control it through more than an
> enable bit (for instance, an RGB or intensity-controlled privacy LED
> sounds very unlikely), so a GPIO is fine with me.

Ok, that is good to know. Going the GPIO route would be
a lot more KISS, so that has my preference too.

Linus would modelling these simple on/off LEDs as
GPIOs be acceptable to you too ?

Regards,

Hans





> 
>> That and we want to avoid moving from the current
>> approach (for some INT3472 using devices) of tying
>> the privacy LED on/off to the INT3472 registered
>> clk being enabled/disabled to modelling this as
>> GPIOs, to then later modelling it as LED class
>> devices after all.
>>
>> To avoid this double conversion issue I'm going to
>> give the LED class route a second go, replacing
>> the swnode approach which I tried today with
>> a lookup-table approach.
>>
>>> ###
>>>
>>> Note though that these indicator LED outputs, both functionality
>>> wise as well as at the register level of this PMIC only support
>>> turning them on/off. So this maps pretty well to the GPIO subsystem
>>> and all the functionality of the LED class subsystem is mostly
>>> functionality which we want to avoid since we don't want userspace
>>> control, neither directly through sysfs or by attaching triggers.
>>>
>>> So this does map pretty well to just modelling it as a GPIO,
>>> if we model this as a LED then we end up having to workaround
>>> a bunch of stuff the LED subsytem does which we do not want in
>>> this case. And this may even require patches to the LED subsystem
>>> to disallow userspace changing the trigger (I would need to check).
>>>
>>> So from my pov modelling this as an output-only GPIO pin is
>>> actually a more KISS solution then involving the LED subsystem...
>>>
>>>> I don't mind a LED driver inside of the GPIO driver if that is what
>>>> it takes as a compromise, just that it should be handled by the right
>>>> subsystem.
>>>
>>> The PMIC already is a MFD device, so if we go the LED class route
>>> we can just add a separate MFD child device for the new LED driver
>>> to bind to.
>>>
>>>> Given that flash leds which are used by cameras are already in
>>>> drivers/leds/flash this should be no different and there will be more
>>>> cameras with these privacy leds.
>>>
>>> Actually this patch is for the back camera privacy LED on a
>>> Microsoft Surface Go tablet. The front camera privacy LED is
>>> directly attached to a GPIO of the main SoC. So for that camera
>>> just adding a GPIO lookup table entry to map the ACPI provided
>>> GPIO info to a "privacy-led" GPIO on the sensor i2c_client device
>>> (which we already do for the "reset" and "powerdown" gpios) also
>>> by far is the most KISS approach.
>>>
>>> Doing things this way in the code translating the ACPI "magic"
>>> to standard Linux device-model stuff is literary a single line
>>> of code (add an extra case: to an existing list of cases in a
>>> switch-case). Where as instantiating a LED class device for this
>>> and then somehow tying that to the i2c_client for the sensor will
>>> be more code.
>>>
>>> So again treating these on/off only LEDs, where we want to
>>> *disallow* userspace control, as a GPIO is by far the most KISS
>>> solution.
> 


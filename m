Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D32B39522B
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 18:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhE3QxE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 May 2021 12:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25628 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229599AbhE3QxD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 30 May 2021 12:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622393485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g4DresjxbvYoLZHzt/csc15CCgwHH4raEtpTQ0nPVeg=;
        b=Fcu1h/lnLIzizDPmfEaPG1iWOusN2/zxNxHGdk3DYD5EUQbLCUer/qAoRYrqRSruwHKjs9
        nGq0DJl9ezp2Fc2NyQFsyVoNZK/xoTFmYCKPWCcZdjqXFYkHU741Id7u4qHVdW6EG5laYl
        HJFmuu/W0thUbbclOT0wD/w97r85k0g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-od5QQmIFNdy2zZkKYwX9GA-1; Sun, 30 May 2021 12:51:23 -0400
X-MC-Unique: od5QQmIFNdy2zZkKYwX9GA-1
Received: by mail-ed1-f72.google.com with SMTP id q18-20020a0564025192b02903888712212fso5032524edd.19
        for <linux-gpio@vger.kernel.org>; Sun, 30 May 2021 09:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g4DresjxbvYoLZHzt/csc15CCgwHH4raEtpTQ0nPVeg=;
        b=hK1MGxN4UpiKBr7GUSiEHmJ4wrKSUkCLYBdfpprUmUIm5hK8x0RkgvbK0xcpQYFSK8
         8xuwvAoa70SLolh0u9QcdMHaOWCymarvuxyV/ZSmo/j2LGP+QkxCmi6AE4sujzwzwirE
         uVGBmp9Lka4caqjdG9zwVdh1Wti6IRgclWdTuqlrX1WPW/2xSWT5rbnPCojwZUUytvUv
         TGHksvMiBlQ+HVAy70jUdrDtPNs9hp0GYn14wxkSAA1eF5p7k0691KRlZbh6zhwcpdeo
         0T7xro0vchQovMQ8J2H3fm5Jg6kFhSakzMiXMalKxTUPIEBjrnIkulLFK70BEHGlk+zp
         aweA==
X-Gm-Message-State: AOAM5303kMew9iUS6Jo00uI1tWPe8TO9/d0cIxea++VuEyM/q95NvmOM
        mxFgvSlWlQqAdP9V5nQmz/nIdNjAr5mPlbZgtv1kBNu7VVQ+mTmXP10yBj+L3NMcEil4jQ+DtxM
        VQsPV3GajHf/xyWgQfkjxgA==
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr18971671ejc.292.1622393481701;
        Sun, 30 May 2021 09:51:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv4NXBGWEOUlsCBK8dv4d5a9MPJ7elGrzUox4+WgpDpgPxKMZzzPtUpEpX5BfjGTpigSbKpg==
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr18971650ejc.292.1622393481352;
        Sun, 30 May 2021 09:51:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p11sm5737751edt.22.2021.05.30.09.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 May 2021 09:51:20 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Sander Vanheule <sander@svanheule.net>,
        Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
 <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc>
 <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
Date:   Sun, 30 May 2021 18:51:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/30/21 6:19 PM, Sander Vanheule wrote:
> Hi Michael, Andy,
> 
> On Fri, 2021-05-28 at 08:37 +0200, Michael Walle wrote:
>> Am 2021-05-24 13:41, schrieb Sander Vanheule:
>>> Hi Andy, Andrew,
>>>
>>> On Mon, 2021-05-24 at 10:53 +0300, Andy Shevchenko wrote:
>>>> On Mon, May 24, 2021 at 4:11 AM Andrew Lunn <andrew@lunn.ch> wrote:
>>>>>
>>>>>> Changes since v2:
>>>>>>   - MDIO regmap support was merged, so patch is dropped here
>>>>>
>>>>> Do you have any idea how this will get merged. It sounds like one of
>>>>> the Maintainers will need a stable branch of regmap.
>>>>
>>>> This is not a problem if Mark provides an immutable branch to pull 
>>>> from.
>>>
>>> Mark has a tag (regmap-mdio) for this patch:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/tag/?h=regmap-mdio
>>>
>>>>
>>>>>>   - Introduce GPIO regmap quirks to set output direction first
>>>>>
>>>>> I thought you had determined it was possible to set output before
>>>>> direction?
>>>>
>>>> Same thoughts when I saw an updated version of that patch. My
>>>> anticipation was to not see it at all.
>>>
>>> The two devices I've been trying to test the behaviour on are:
>>>  * Netgear GS110TPP: has an RTL8231 with three LEDs, each driven via a 
>>> pin
>>>    configured as (active-low) GPIO. The LEDs are easy for a quick 
>>> visual check.
>>>  * Zyxel GS1900-8: RTL8231 used for the front panel button, and an 
>>> active-low
>>>    GPIO used to hard reset the main SoC (an RTL8380). I've modified 
>>> this board
>>>    to change some of the strapping pin values, but testing with the 
>>> jumpers and
>>>    pull-up/down resistors is a bit more tedious.
>>>
>>> On the Netgear, I tested the following with and without the quirk:
>>>
>>>    # Set as OUT-LOW twice, to avoid the quirk. Always turns the LED on
>>>    gpioset 1 32=0; gpioset 1 32=0
>>>    # Get value to change to input, turns the LED off (high impedance)
>>>    # Will return 1 due to (weak) internal pull-up
>>>    gpioget 1 32
>>>    # Set as OUT-HIGH, should result in LED off
>>>    # When the quirk is disabled, the LED turns on (i.e. old OUT-LOW 
>>> value)
>>>    # When the quirk is enabled, the LED remains off (i.e. correct
>>> OUT-HIGH value)
>>>    gpioset 1 32=1
>>>
>>> Now, what's confusing (to me) is that the inverse doesn't depend on the 
>>> quirk:
>>>
>>>    # Set as OUT-HIGH twice
>>>    gpioset 1 32=1; gpioset 1 32=1
>>>    # Change to high-Z
>>>    gpioget 1 32
>>>    # Set to OUT-LOW, always results in LED on, with or without quirk
>>>    gpioset 1 32=0
>>>
>>> Any idea why this would be (or appear) broken on the former case, but 
>>> not on the
>>> latter?
>>
>> Before reading this, I'd have guessed that they switch the internal 
>> register
>> depending on the GPIO direction; I mean there is only one register 
>> address
>> for both the input and the output register. Hm.
>>
>> Did you try playing around with raw register accesses and see if the 
>> value
>> of the GPIO data register is changing when you switch GPIOs to 
>> input/output.
>>
>> Eg. you could try https://github.com/kontron/miitool to access the 
>> registers
>> from userspace (your ethernet controller has to have support for the 
>> ioctl's
>> though, see commit a613bafec516 ("enetc: add ioctl() support for 
>> PHY-related
>> ops") for an example).
> 
> I think I found a solution!
> 
> As Michael suggested, I tried raw register reads and writes, to eliminate any
> side effects of the intermediate code. I didn't use the ioctls (this isn't a
> netdev), but I found regmap's debugfs write functionality, which allowed me to
> do the same.
> 
> I was trying to reproduce the behaviour I reported earlier, but couldn't. The
> output levels were always the intended ones. At some point I realised that the
> regmap_update_bits function does a read-modify-write, which might shadow the
> actual current output value.
> For example:
>  * Set output low: current out is low
>  * Change to input with pull-up: current out is still low, but DATAx reads high
>  * Set output high: RMW reads a high value (the input), so assumes a write is
>    not necessary, leaving the old output value (low).
> 
> Currently, I see two options:
>  * Use regmap_update_bits_base to avoid the lazy RMW behaviour
>  * Add a cache for the output data values to the driver, and only use these
>    values to write to the output registers. This would allow keeping lazy RMW
>    behaviour, which may be a benefit on slow busses.
> 
> With either of these implemented, if I set the output value before the
> direction, everything works! :-)
> 
> Would you like this to be added to regmap-gpio, or should I revert back to a
> device-specific implementation?

Regmap allows you to mark certain ranges as volatile, so that they will not
be cached, these GPIO registers containing the current pin value seems like
a good candidate for this. This is also necessary to make reading the GPIO
work without getting back a stale, cached value.

Regards,

Hans


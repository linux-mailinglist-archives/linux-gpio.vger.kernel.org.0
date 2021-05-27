Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF58392C03
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 12:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236181AbhE0KnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 06:43:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45013 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236103AbhE0KnQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 06:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622112103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DyoTEweFTx1lpA7uX8L7ddsbfDTqub/v0D1/rQ9tIVc=;
        b=MzIjUOtmK+sReJkP/JcMk7hjGwD5/Cbt2xtBoOlAb4Lh6MnfUdOeVQn/86kzaT//mCajfN
        V3+RkdU/cdXAeWdk0gG4ayB6ra4BsXHT5lJTv+4z7Nzu+9UOjHlQpRgoY8QZ0ifKEpQSm+
        RRCkEMXYhk0o2voXj+a5rQr9+jl08EQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-cTWmVNOWOSagf591D-SBdA-1; Thu, 27 May 2021 06:41:42 -0400
X-MC-Unique: cTWmVNOWOSagf591D-SBdA-1
Received: by mail-ed1-f71.google.com with SMTP id e15-20020a056402148fb029038f9ac2d3afso100634edv.9
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 03:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DyoTEweFTx1lpA7uX8L7ddsbfDTqub/v0D1/rQ9tIVc=;
        b=RdbJFNlozSax+7P/yZGG7GvUuGJHLrXXWyuI8HLPOWJiA4r6hQU+d+7/o0sc58d9aB
         Qp2TuIr/7JVf5VOknFWVXo2E1zaCr2PMacxZwp2QerJ14GfjcUFl6hDbHSQO0NYZxTfY
         f3327vAgV0uG1FZ6WB4NIRVvBMQosZfyOPvfen+8aZwFfBomvndKMCiknI/O+0JpmHwX
         FxYwCxelSiWv8BN1yRAXuCpTlF4Kk8FQK3yEICJdCM7uUwYPjxlzDK1s6CzR+Ve02aJr
         143IDpDn3hV6l0OlZaaZedPCdAcrb+4dpOAoiruBmuFENoEPYikw/ZbCHIhRnFBB2HSu
         6N9A==
X-Gm-Message-State: AOAM532HoaQ4E95QafRC47GxMxKNEsADoJdqF0WperHUrh+KcVHS/t2X
        YceLK4L4sA4iL/TpOaq+L6ENxjmecG1rPiX8HzczP7LXLem5QIqXFomepUu9pTBql27XhiT7Avt
        EjNb2xh5usGOh1GrAtA5JGg==
X-Received: by 2002:a17:906:6d43:: with SMTP id a3mr3104885ejt.142.1622112100864;
        Thu, 27 May 2021 03:41:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/B6NLDpnHprnd+r3zEqXv6WFixw8qwba7jliY2CHxhFvNGGR2p5k490P1utig7Gjm74mdvA==
X-Received: by 2002:a17:906:6d43:: with SMTP id a3mr3104861ejt.142.1622112100604;
        Thu, 27 May 2021 03:41:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b9sm872604edt.71.2021.05.27.03.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 03:41:40 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sander Vanheule <sander@svanheule.net>
Cc:     Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
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
 <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
 <8f96b24d782e5bdeabf5370ccf3475794d0c2818.camel@svanheule.net>
 <CAHp75VfzEwVGR7ttdcKzirPDN8oUFw1uTDXPFE=P=9+S3CAFYQ@mail.gmail.com>
 <CAHp75VfCBtcQX4rvmQnRMquM0k7ZBqOgZN15Z7TFNSO60SB9TA@mail.gmail.com>
 <cbfba24a6206ec73ccc844da5d1331959e3f3520.camel@svanheule.net>
 <CAHp75VdhAqFG1WpyMqpvL_W6mFchNd9AyRSV2Zgc1Vk5M6LnCg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <96026395-250a-e6ed-fc12-782c8bc54dc6@redhat.com>
Date:   Thu, 27 May 2021 12:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdhAqFG1WpyMqpvL_W6mFchNd9AyRSV2Zgc1Vk5M6LnCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/27/21 12:38 PM, Andy Shevchenko wrote:
> +Cc: Hans
> 
> Hans, sorry for disturbing you later too much. Here we have "nice"
> hardware which can't be used in a glitch-free mode (somehow it reminds
> me lynxpoint, baytrail, cherryview designs). If you have any ideas to
> share (no need to dive deep or look at it if you have no time), you're
> welcome.

I'm afraid I've no ideas how to solve this nicely. Documenting the
issue might be the best we can do.

Regards,

Hans



> 
> On Thu, May 27, 2021 at 12:02 AM Sander Vanheule <sander@svanheule.net> wrote:
>>
>> On Tue, 2021-05-25 at 20:11 +0300, Andy Shevchenko wrote:
>>> On Mon, May 24, 2021 at 7:30 PM Andy Shevchenko
>>> <andy.shevchenko@gmail.com> wrote:
>>>> On Mon, May 24, 2021 at 6:03 PM Sander Vanheule <sander@svanheule.net>
>>>> wrote:
>>>>> On Mon, 2021-05-24 at 15:54 +0300, Andy Shevchenko wrote:
>>>
>>> ...
>>>
>>>>> Sadly, I don't. Most of the info we have comes from code archives of
>>>>> switch
>>>>> vendors (Zyxel, Cisco etc). Boards need to be reverse engineered, and the
>>>>> few
>>>>> leaked datasheets that can be found on the internet aren't exactly thick
>>>>> in
>>>>> information.
>>>>>
>>>>> The RTL8231 datasheet is actually quite useful, but makes no mention of
>>>>> the
>>>>> output value isse. Since this isn't an official resource, I don't think it
>>>>> would
>>>>> be appropriate to link it via a Datasheet: tag.
>>>>> https://github.com/libc0607/Realtek_switch_hacking/blob/files/RTL8231_Datasheet_
>>>>> 1.2.pdf
>>>>>
>>>>> Looking at the datasheet again, I came up with a... terrible hack to work
>>>>> around
>>>>> the output value issue.
>>>>>
>>>>> The chip also has GPIO_INVERT registers that I hadn't used until now,
>>>>> because
>>>>> the logical inversion is handled in the kernel. However, these inversion
>>>>> registers only apply to the output values. So, I could implement glitch-
>>>>> free
>>>>> output behaviour in the following way:
>>>>>  * After chip reset, and before enabling the output driver (MFD
>>>>> initialisation):
>>>>>     - Mux all pins as GPIO
>>>>>     - Change all pins to outputs,
>>>>
>>>> No. no, no. This is much worse than the glitches. You never know what
>>>> the hardware is connected there and it's potential breakage (on hw
>>>> level) possible.
>>>>
>>>>>  so the data registers (0x1c-0x1e) become writable
>>>>>     - Write value 0 to all pins
>>>>>     - Change all pins to GPI to change them into high-Z
>>>>>  * In the pinctrl/gpio driver:
>>>>>     - Use data registers as input-only
>>>>>     - Use inversion register to determine output value (can be written any
>>>>> time)
>>>>>
>>>>> The above gives glitch-free outputs, but the values that are read back
>>>>> (when
>>>>> configured as output), come from the data registers. They should now be
>>>>> coming
>>>>> from the inversion (reg_set_base) registers, but the code prefers to use
>>>>> the
>>>>> data registers (reg_dat_base).
>>>>
>>>> Lemme read the datasheet and see if I find any clue for the hw behaviour.
>>>
>>> Thank you for your patience!
>>>
>>> Have you explored the possibility of using En_Sync_GPIO?
>>
>> Got around to testing things.
>>
>> If En_Sync_GPIO is enabled, it's still possible to change the pin direction
>> without also writing the Sync_GPIO bit. So even with the latching, glitches are
>> still produced.
>>
>> As long as Sync_GPIO is not set to latch the new values, it also appears that
>> reads of the data registers result in the current output value, not the new one.
>>
>> As a different test, I've added a pull-down, to make the input level low. Now I
>> see the opposite behaviour as before (with set-value-before-direction):
>>  * OUT-HIGH > IN (low) > OUT-LOW: results in a high level (i.e. old value)
>>  * OUT-HIGH > IN (low) > OUT-HIGH: results in a high level (new/old value)
>>  * OUT-LOW > IN (low) > OUT-HIGH: results in a high level (new value, or toggled
>>    old value?)
>>  * OUT-LOW > IN (low) > OUT-LOW: results in a low level (new/old value)
>>
>> For reference, with a pull-up:
>>  * OUT-HIGH > IN (high) > OUT-HIGH: high result
>>  * OUT-HIGH > IN (high) > OUT-LOW: low result
>>  * OUT-LOW > IN (high) > OUT-HIGH: low result
>>  * OUT-LOW > IN (high) > OUT-LOW: low result
>>
>> I've only tested this with the sysfs interface, so I don't know what the result
>> would be on multiple writes to the data register (during input, but probably not
>> very relevant). Nor have I tested direction changes if the input has changed
>> between two output values.
>>
>> I may have some time tomorrow for more testing, but otherwise it'll have to wait
>> until the weekend. Any other ideas in the meantime?
> 
> No ideas so far. In x86 we used to have something similar (baytrail,
> cherryview, lynxpoint), but it's firmware assisted. I think that this
> hardware (realtek) is supposed either
> - to be firmware / bootloader assisted, so in a way that platform is
> preconfigured when Linux starts and any GPIO request won't be harmful
> as long as it doesn't change direction on the pins (which is usually
> guaranteed by DT and corresponding drivers to do the correct things)
> - be used for glitch-tolerant hardware (LEDs, for example, where
> nobody usually will noticed 1ms blink)
> 
> That said, I have not been convinced we have to quirk gpio-regmap for
> this one. Just describe the issues with hardware in the accompanying
> documentation.
> 
> But if maintainers or somebody comes with a better / different
> approach I am all ears.
> 


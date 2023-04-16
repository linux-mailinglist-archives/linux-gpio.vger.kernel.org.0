Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A593C6E37B2
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 13:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDPLVi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 07:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjDPLVg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 07:21:36 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E202410C4
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 04:21:33 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fy21so14041732ejb.9
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681644092; x=1684236092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjzYOB4awzycoNzxJAQgEEoqm65eCjO6HMrrjw4rtCM=;
        b=ydiFs+XINhtGc4aDAKUjk20Nu6p3fkBqrl623q8puvu3/8V0/5IEkYecnjrUJONqB0
         DKVxwp9mKTHi3C8cE9IRtT6KwQhwibj+xbABbR/GjtGE9NPK9G9ek8PhN7mnuuQw+RoO
         GbZx8NmG6Ylk4uhkiE/cNdR8L9834FwZjMcdclQPJj7Fl5T6k6VeA0fuR3oX4mSaPFMk
         GQuNmWDp2uFNf4UUg5ksoF+9QjVAHFuuA5pcLIWsK+u8ZycChXYZkQ6c9QjD4H1xsH2M
         lZ++EtnZmMxahnSIkpt8rqwyZ0agPuAkZm7W7LALdCijMUmSj19NS8TlhY75i1c5JMaY
         sxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681644092; x=1684236092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjzYOB4awzycoNzxJAQgEEoqm65eCjO6HMrrjw4rtCM=;
        b=djqpigaVaHp7BQEKaKcattlMjV9FxIoOLwey9J+4zFAd7lcEYd2vHvSnpxloNbDHud
         p4I6/b4vwTOrwD3Mj6WHwyxmiLhwi2W/4uPFyOP1dWHJ4Xi6B7kxhpOnOrkzdCcieMOA
         6c5GEDoPPFlziduzRH473Z02MnYAnd8+hHUBaSKNIS65+s0BNWX8IJWpjPO4K2CDJLgM
         X1wzroNigpqY7muy+Yc9ClHccTAA4Uzawx1JhXkJQat6y6kIb0YGPiLY1FbXpu3RQvy8
         qfXwqStNYwfNe0Ym8ckRhH8qZJ+FcVk7oM6Um4FWdHUYGZNFfKt8hlL6YU/A2wRG+P8X
         EwIg==
X-Gm-Message-State: AAQBX9fR86ZP1pnma1siEcGY2wPjyZ8b0XX8i9HMOr/upw/oZZHOkwHA
        vomiPTFnHcYcL8Mh90Re7mE2Wg==
X-Google-Smtp-Source: AKy350bsD+sOIj/Qr8MTFkF7fb44XCQtMKulwXIEYxTg8VdOzoWKOqiBnn+0Imhe34BG6yyQeT2Ibg==
X-Received: by 2002:a17:906:5683:b0:94e:4edb:3659 with SMTP id am3-20020a170906568300b0094e4edb3659mr4201260ejc.43.1681644092339;
        Sun, 16 Apr 2023 04:21:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id fh8-20020a1709073a8800b0094f0f0de1bcsm2265318ejc.200.2023.04.16.04.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 04:21:31 -0700 (PDT)
Message-ID: <ca984bb6-18b9-8e65-edb1-007a0fae4fb7@linaro.org>
Date:   Sun, 16 Apr 2023 13:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <3231223.aeNJFYEL58@steina-w>
 <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
 <4800953.GXAFRqVoOG@steina-w>
 <CAHp75VeTFDkaYRfX+9hE7LYE4Z-NpNfP=xfsGt27nm_DrTC_cw@mail.gmail.com>
 <a79134a3-be9d-7297-15e1-1de4eb4054d0@linaro.org>
 <CAHp75VdRjCvcwjVO8GZfrVhFqJmO+WaqmJ63A2vVK4iELx=OXg@mail.gmail.com>
 <ee53f7cf-b94a-ba0f-1e28-5ffa2c0f5e78@linaro.org>
 <CAHp75Vc31cQLT0TNS7UZddA+M=215qy_xZMpzTeRj0LV7t69tA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAHp75Vc31cQLT0TNS7UZddA+M=215qy_xZMpzTeRj0LV7t69tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/04/2023 13:14, Andy Shevchenko wrote:
> On Sun, Apr 16, 2023 at 2:04 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 16/04/2023 11:36, Andy Shevchenko wrote:
>>> On Sun, Apr 16, 2023 at 10:42 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>> On 15/04/2023 17:06, Andy Shevchenko wrote:
>>>>> On Fri, Apr 14, 2023 at 9:37 AM Alexander Stein
>>>>> <alexander.stein@ew.tq-group.com> wrote:
>>>>>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko:
>>>>>>> On Tue, Apr 11, 2023 at 10:19 AM Alexander Stein
>>>>>>> <alexander.stein@ew.tq-group.com> wrote:
>>>
>>> ...
>>>
>>>>>>> So, taking the above into consideration, why is it GPIO property to
>>>>>>> begin with? This is PCB property of the certain platform design that
>>>>>>> needs to be driven by a specific driver, correct?
>>>>>>
>>>>>> True this is induced by the PCB, but this property applies to the GPIO,
>>>>>> neither the GPIO controller output, nor the GPIO consumer is aware of.
>>>>>> So it has to be added in between. The original idea to add a property for the
>>>>>> consumer driver is also rejected, because this kind of behavior is not limited
>>>>>> to this specific driver.
>>>>>> That's why the delay is inserted in between the GPIO output and GPIO consumer.
>>>>>>
>>>>>>> At the very least this is pin configuration (but external to the SoC),
>>>>>>> so has to be a _separate_ pin control in my opinion.
>>>>>>
>>>>>> Sorry, I don't get what you mean by _separate_ pin control.
>>>>>
>>>>> As you mentioned above this can be applied theoretically to any pin of
>>>>> the SoC, That pin may or may not be a GPIO or a pin that can be
>>>>> switched to the GPIO mode. Hence this entire idea shouldn't be part of
>>>>> the existing _in-SoC_ pin control driver if any. This is a purely
>>>>> separate entity, but at the same time it adds a property to a pin,
>>>>> hence pin control.
>>>>> At the same time, it's not an SoC related one, it's a PCB. Hence _separate_.
>>>>
>>>> I don't think that anything here is related to pin control. Pin control
>>>> is specific function of some device which allows different properties or
>>>> different functions of a pin.
>>>
>>> Sorry, but from a hardware perspective I have to disagree with you.
>>> It's a property of the _pin_ and not of a GPIO. Any pin might have the
>>> same property. That's why it's definitely _not_ a property of GPIO,
>>> but wider than that.
>>
>> I did not say this is a property of GPIO. I said this is nothing to do
>> with pin control, configuration and pinctrl as is.
> 
> Ah, I see. But still is a property of the pin on the PCB level. 

No, it is property of a circuit, so property of two pins and a wire
between them. Not a property of one pin.


> That's
> why I said that it should be like a "proxy" driver that has to be a
> consumer of the pins on one side and provide the pins with this
> property on the other.

Not sure, why do you need it for anything else than GPIOs? What is the
real world use case for proxy driver of non-GPIO lines?

> 
>> Otherwise bindings would be in directory matching the real hardware...
>> but they are not. So you can of course call it as you wish, but from
>> hardware perspective this is not pin control. This is RC circuit, not
>> pin related thingy.
> 
> Yep, I put it as a pin configuration which is part of pin control in
> the Linux kernel right now. But I agree with your above explanation
> and it seems that we lack a, let's say, "pin modification" framework
> that stacks additional (PCB level or why not even some special in-SoC
> ones) properties and adds them to the given pins.

It's nothing to do with modification of properties of some pin. It's a
separate circuit which has an effect on how two connected pins behave.
If you look from an effect point of view, only one side is more
interested in the effect - consumer. But still this sits in the middle.

Best regards,
Krzysztof


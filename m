Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF0D6E37C5
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 13:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDPLmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 07:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjDPLmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 07:42:05 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEA41A2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 04:42:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94e6caa223cso254417266b.3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681645322; x=1684237322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWqN/wIM4I1ifzknp2D4GxmnEWb/ZC5K93iRnJixuW8=;
        b=lCz0Dv6J1mCywDAO87my/QltXwRVQcWT1E7qpMMZHK2rAgM/AD8J0oB5aLmehwpv4k
         xUAj4LdgC/ZmUxc2GdylJ3x3HyMK02kfJAc82TFVjDuQ3hNt7GQz3Kl+A6qZOoleBJ/r
         1OZ9cklcgQICBpSq/CDupMFpl5v4PybhhHs2pzBlQyzTDmCLD6WeXcP83D3PEPZpb975
         JQQcVH7ijHr1XIOwIKypVkmm22oIYsvjrvntZai4roj9IfwRxAvVnU1FK2sTYHSBAWDE
         PCqaL8KXsjkbBQx//Ns26NzDt6WTPALv3G3z3EeF8yHGaY+FovW/X+fbd4vuZp5fyf9B
         zH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681645322; x=1684237322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWqN/wIM4I1ifzknp2D4GxmnEWb/ZC5K93iRnJixuW8=;
        b=LG3+dudkz8o4sgWfH1SPJT7k33Gij2cV9sLlNAjxyoG7aeigpqypRVzeGx9SLpzbge
         mqDZ+YaKr+fREzlqF6NaSYA0P5A7lJlP7Ng7GV7bPMUBhHDaRH1WDGc0h1sXvgJuo6U6
         VfRTY+5rLJpo2ZftrJcS/w5atxhGNrSIt8npdX5GsLfeScsODK2GaGJiYc5ZwyVBU8QA
         UDLN45Ezx72iGiP1EBiG5of+ph1eXxMPCHUMKABZrI3bYYJS1ZsHoMjCVcTSKWJzt3TY
         pPTjM07VnmBmX1i44HC7MRwfzWQHihWU40NvhvzrTMhZ0qD7ZZ4bqBmmw0h4Laps81vn
         tdzw==
X-Gm-Message-State: AAQBX9dXH7yJ773wwcTn2Ct0fvOl6uZhPJbWDwBlZH2CcmqgElUT4J4k
        WjMJ6TeuqXy52lq5eKbDbEB5Iw==
X-Google-Smtp-Source: AKy350aa05xx0VFM9tyxXQDJljfciV/zJpEljf9GuA7VIKtJBBhETDtM2luUCDg3W2G1nEJP64fcxg==
X-Received: by 2002:aa7:c403:0:b0:506:8eb1:a266 with SMTP id j3-20020aa7c403000000b005068eb1a266mr4256918edq.33.1681645322257;
        Sun, 16 Apr 2023 04:42:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7d88f000000b005067d6b06efsm3342246edq.17.2023.04.16.04.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 04:42:01 -0700 (PDT)
Message-ID: <a926837c-8773-1809-0bb3-34d449c5d7a5@linaro.org>
Date:   Sun, 16 Apr 2023 13:42:00 +0200
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
 <ca984bb6-18b9-8e65-edb1-007a0fae4fb7@linaro.org>
 <CAHp75VfCm-80LuDmTNuOX-DP=xWnVibrpzu_wFAa5Wg0QY+yWQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAHp75VfCm-80LuDmTNuOX-DP=xWnVibrpzu_wFAa5Wg0QY+yWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/04/2023 13:33, Andy Shevchenko wrote:
> On Sun, Apr 16, 2023 at 2:21 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 16/04/2023 13:14, Andy Shevchenko wrote:
>>> On Sun, Apr 16, 2023 at 2:04 PM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>> On 16/04/2023 11:36, Andy Shevchenko wrote:
>>>>> On Sun, Apr 16, 2023 at 10:42 AM Krzysztof Kozlowski
>>>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>>> On 15/04/2023 17:06, Andy Shevchenko wrote:
>>>>>>> On Fri, Apr 14, 2023 at 9:37 AM Alexander Stein
>>>>>>> <alexander.stein@ew.tq-group.com> wrote:
>>>>>>>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko:
>>>>>>>>> On Tue, Apr 11, 2023 at 10:19 AM Alexander Stein
>>>>>>>>> <alexander.stein@ew.tq-group.com> wrote:
>>>>>
>>>>> ...
>>>>>
>>>>>>>>> So, taking the above into consideration, why is it GPIO property to
>>>>>>>>> begin with? This is PCB property of the certain platform design that
>>>>>>>>> needs to be driven by a specific driver, correct?
>>>>>>>>
>>>>>>>> True this is induced by the PCB, but this property applies to the GPIO,
>>>>>>>> neither the GPIO controller output, nor the GPIO consumer is aware of.
>>>>>>>> So it has to be added in between. The original idea to add a property for the
>>>>>>>> consumer driver is also rejected, because this kind of behavior is not limited
>>>>>>>> to this specific driver.
>>>>>>>> That's why the delay is inserted in between the GPIO output and GPIO consumer.
>>>>>>>>
>>>>>>>>> At the very least this is pin configuration (but external to the SoC),
>>>>>>>>> so has to be a _separate_ pin control in my opinion.
>>>>>>>>
>>>>>>>> Sorry, I don't get what you mean by _separate_ pin control.
>>>>>>>
>>>>>>> As you mentioned above this can be applied theoretically to any pin of
>>>>>>> the SoC, That pin may or may not be a GPIO or a pin that can be
>>>>>>> switched to the GPIO mode. Hence this entire idea shouldn't be part of
>>>>>>> the existing _in-SoC_ pin control driver if any. This is a purely
>>>>>>> separate entity, but at the same time it adds a property to a pin,
>>>>>>> hence pin control.
>>>>>>> At the same time, it's not an SoC related one, it's a PCB. Hence _separate_.
>>>>>>
>>>>>> I don't think that anything here is related to pin control. Pin control
>>>>>> is specific function of some device which allows different properties or
>>>>>> different functions of a pin.
>>>>>
>>>>> Sorry, but from a hardware perspective I have to disagree with you.
>>>>> It's a property of the _pin_ and not of a GPIO. Any pin might have the
>>>>> same property. That's why it's definitely _not_ a property of GPIO,
>>>>> but wider than that.
>>>>
>>>> I did not say this is a property of GPIO. I said this is nothing to do
>>>> with pin control, configuration and pinctrl as is.
>>>
>>> Ah, I see. But still is a property of the pin on the PCB level.
>>
>> No, it is property of a circuit, so property of two pins and a wire
>> between them. Not a property of one pin.
> 
> Electrically speaking -- yes, software speaking, no, this is the
> property of the one end (platfrom abstraction in the software) and as
> you said, consumer which may be SoC, or the device connected to the
> SoC (depending on the signal direction), or both (like pull-up for
> I2C).
> 
>>> That's
>>> why I said that it should be like a "proxy" driver that has to be a
>>> consumer of the pins on one side and provide the pins with this
>>> property on the other.
>>
>> Not sure, why do you need it for anything else than GPIOs? What is the
>> real world use case for proxy driver of non-GPIO lines?
> 
> I2C is an example where we have something in between, which both of

Are you sure you have RC (not just resistor) in I2C?

> the ends are using and this is the property of PCB, but luckily we
> don't need anything special in the software for that, right? But from
> the electrical point of view it's exactly a non-GPIO property. That's
> why "proxy".

Still I do not see any reason to call it anything else than GPIO. If you
think that there is any other usage, please bring it as an real,
non-theoretical example.

Best regards,
Krzysztof


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89E06E37A1
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 13:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjDPLFA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 07:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjDPLE7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 07:04:59 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FBE1FCB
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 04:04:58 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-504718a2265so7249849a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681643096; x=1684235096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3r0B7rZlEkuSAYS3rVQty8Lh4kP4+L9+kNIMytNt8zc=;
        b=V6qWcr1RvymStGJcc6rRrRGvjAwPmUI2HT5heWw0OtXtmaZQW47ibvu6J2s3e4BkSv
         L5/PVnAuOHcApBB9lR/d28BD0rUvjzmKNcL0JBKZeh0uTj6CSTxQHu8iOCok+BK05rwb
         3X3v3fpXSIeSkVYYhTmJpFTCi5HaelMb4hv8CZGloJpeIOz9BzPiqlwUcdX4fmH1eC2v
         46BB/3eU2sB3ShXlSxq2TN6v4yCszF+fidtuIfFxCx4GB35d9sqheN6f6gBwNu+Gd8cR
         ZrH6BwJqkbDaEW2XIW0xlNxxiQtIomcCCRUEVqSgBRzvdeodcssMOzale5cNx0TChlJA
         XIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681643096; x=1684235096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3r0B7rZlEkuSAYS3rVQty8Lh4kP4+L9+kNIMytNt8zc=;
        b=Sg1+FWeEl/73F6rOyTFutktdboOIBkmng2lppJAVUaLo58evA4Pdc1WLilgRvUXxID
         yegEwRE4+WSjgzpFrH9dell5cYUbRZbq4yRS0blRmVBZ5XHhHx/mwnoV5lTsTQQrO4vn
         sq1XT3kMkkN2WpE5S433X3QEtf1QPoUaods+3alp7P98MBrT+L7+OGa4ZuVzTwSjozoF
         qIkgbo/OTibIfaqw0Z4FSqH6QiHaihI4J+hDf7EUgI1oT8OLm2+LbfNER9jRqif9vL7x
         OV7gAxwqPdBLhYLHXaEVabVtZ1Bt7YEw7byg8aoNwBuQiIIGYAUWEzji+AdYSBu/58N6
         8UfA==
X-Gm-Message-State: AAQBX9cCvKDVDXRiO4e6JSF0aLluhF5ZN8fN10usVxmRt//TxEXYgz/o
        KCGswZoVjoHTYH77PDX21z9CpQ==
X-Google-Smtp-Source: AKy350Y/X9cG+hJJbv42LSORNFLg4DgDLZH2RFw/ol/wnjMoQeg1yq7Lf3AmKMjM6GULd2N7npXxjg==
X-Received: by 2002:aa7:dac2:0:b0:506:71c9:4bb4 with SMTP id x2-20020aa7dac2000000b0050671c94bb4mr9919222eds.40.1681643096429;
        Sun, 16 Apr 2023 04:04:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id x17-20020aa7dad1000000b005027d31615dsm4368175eds.62.2023.04.16.04.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 04:04:56 -0700 (PDT)
Message-ID: <ee53f7cf-b94a-ba0f-1e28-5ffa2c0f5e78@linaro.org>
Date:   Sun, 16 Apr 2023 13:04:54 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAHp75VdRjCvcwjVO8GZfrVhFqJmO+WaqmJ63A2vVK4iELx=OXg@mail.gmail.com>
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

On 16/04/2023 11:36, Andy Shevchenko wrote:
> On Sun, Apr 16, 2023 at 10:42 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 15/04/2023 17:06, Andy Shevchenko wrote:
>>> On Fri, Apr 14, 2023 at 9:37 AM Alexander Stein
>>> <alexander.stein@ew.tq-group.com> wrote:
>>>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko:
>>>>> On Tue, Apr 11, 2023 at 10:19 AM Alexander Stein
>>>>> <alexander.stein@ew.tq-group.com> wrote:
> 
> ...
> 
>>>>> So, taking the above into consideration, why is it GPIO property to
>>>>> begin with? This is PCB property of the certain platform design that
>>>>> needs to be driven by a specific driver, correct?
>>>>
>>>> True this is induced by the PCB, but this property applies to the GPIO,
>>>> neither the GPIO controller output, nor the GPIO consumer is aware of.
>>>> So it has to be added in between. The original idea to add a property for the
>>>> consumer driver is also rejected, because this kind of behavior is not limited
>>>> to this specific driver.
>>>> That's why the delay is inserted in between the GPIO output and GPIO consumer.
>>>>
>>>>> At the very least this is pin configuration (but external to the SoC),
>>>>> so has to be a _separate_ pin control in my opinion.
>>>>
>>>> Sorry, I don't get what you mean by _separate_ pin control.
>>>
>>> As you mentioned above this can be applied theoretically to any pin of
>>> the SoC, That pin may or may not be a GPIO or a pin that can be
>>> switched to the GPIO mode. Hence this entire idea shouldn't be part of
>>> the existing _in-SoC_ pin control driver if any. This is a purely
>>> separate entity, but at the same time it adds a property to a pin,
>>> hence pin control.
>>> At the same time, it's not an SoC related one, it's a PCB. Hence _separate_.
>>
>> I don't think that anything here is related to pin control. Pin control
>> is specific function of some device which allows different properties or
>> different functions of a pin.
> 
> Sorry, but from a hardware perspective I have to disagree with you.
> It's a property of the _pin_ and not of a GPIO. Any pin might have the
> same property. That's why it's definitely _not_ a property of GPIO,
> but wider than that.

I did not say this is a property of GPIO. I said this is nothing to do
with pin control, configuration and pinctrl as is.

Otherwise bindings would be in directory matching the real hardware...
but they are not. So you can of course call it as you wish, but from
hardware perspective this is not pin control. This is RC circuit, not
pin related thingy.

Best regards,
Krzysztof


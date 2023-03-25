Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C856C8D98
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Mar 2023 12:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjCYLvD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Mar 2023 07:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjCYLvC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Mar 2023 07:51:02 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0221093D7
        for <linux-gpio@vger.kernel.org>; Sat, 25 Mar 2023 04:51:01 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id h8so17586261ede.8
        for <linux-gpio@vger.kernel.org>; Sat, 25 Mar 2023 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679745059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQfEsJ/kRE4svm/QpY3bwtkC6UQ1KDFqIxzZimyy0K4=;
        b=zHR6Zo3t7o/2x6z18o6qSsk7yt9XwsI38ibIpH1UKOIN8XToCvDfqe7vBnFXwVEZ8u
         vTVtD130VtoJ3BxeHbBH/4Dq60M/2IXsyH/C5iKswd0DelleoYS+AcIdexkzhjETlEsL
         GcRyG0oVy5k2gZuZZ0OH0/RIwouFKdAfBPc/R5RY35EOHrwJFZk0WB8WVD2FvcEpX/kq
         8c9W9kPlQ3FfD7rCmUZ3Ul//iQGH0joinU8KZCoWcf/fEd3aefxXR9FLvMDMqpU2j6gV
         1R9HY+SJHf78r0XAEy+Rc6hGe/X/a13SO/xtit8u62QueW9+wvsOf5dDbQIZrBI32hAS
         ASgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679745059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQfEsJ/kRE4svm/QpY3bwtkC6UQ1KDFqIxzZimyy0K4=;
        b=jLGXa5sQJNTg4hCvvxcUrI8fQKnpP8xFXSOPB5PbBoHp/ebn86MGvAOTx2Gl2zVOWx
         a8PoqNDFpds+3Tc8l+jkRPusiuCFPuOHH9n+FvjdLwxlc8CRUnV+aiJEqClL/oJ4f8pF
         c3UvwvzVdO/L9UDyoGpaKjLEIbiPSDaeSot/7ddB7F9x03c6DAHii/ble2SfyUXcawig
         TQwc2ou2IqUEUH7pb3wG0sjy5KOPdfnB/NANiYINzQHqeqoH3aqS2sszvBmvRtXoyUxt
         +1rgmDs+jMaJKVEa5c/Yg3GYpbimX/B98pjZ3+HFTL1/ex+OHiHckfZGLqGl/vP7Cx93
         VfPg==
X-Gm-Message-State: AAQBX9fu7dQ/ln0iFayu/8yDWu9J/D2mLisSA3BS7/BSgFls4lnE40sa
        NqnI7E+yoWsByJMIOZouRZSTxg==
X-Google-Smtp-Source: AKy350ZVONNBf6X0XDXBdDm3eOWd/T0wslYWfPem1OuD3M4j6fthRc4ITWf8ho4pEtCkdeiAqnDZQg==
X-Received: by 2002:a17:907:a42a:b0:93f:b391:9a07 with SMTP id sg42-20020a170907a42a00b0093fb3919a07mr1082633ejc.15.1679745059546;
        Sat, 25 Mar 2023 04:50:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id r3-20020a50d683000000b004c0239e41d8sm12114820edi.81.2023.03.25.04.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:50:59 -0700 (PDT)
Message-ID: <29530f96-2633-a9ae-0ab6-811b68a74e9d@linaro.org>
Date:   Sat, 25 Mar 2023 12:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <3e839363-e12a-93f1-a1f6-f783caa5665e@gmail.com>
 <b0a91d24-4458-169e-6547-2a2a68cd9922@linaro.org>
 <354ffe85-2033-eaf0-4dc5-b5a425900c20@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <354ffe85-2033-eaf0-4dc5-b5a425900c20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/03/2023 12:41, Heiner Kallweit wrote:
> On 25.03.2023 12:18, Krzysztof Kozlowski wrote:
>> On 24/03/2023 23:51, Heiner Kallweit wrote:
>>> Convert Amlogic Meson pin controller binding to yaml.
>>>


>>> +patternProperties:
>>> +  "^bank@[0-9a-z]+$":
>>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>>> +
>>> +    properties:
>>> +      reg:
>>> +        maxItems: 4
>>> +
>>> +      reg-names:
>>> +        items:
>>> +          - const: mux
>>> +          - const: pull
>>> +          - const: pull-enable
>>> +          - const: gpio
>>> +
>>> +    unevaluatedProperties: false
>>
>> Wrong placement. Rob asked you to put it after $ref and the review was
>> conditional based on this. Don't add review-tag if you do not follow the
>> comment.
>>
> I wasn't aware that this makes a difference, and in e.g. samsung,pinctrl.yaml
> I found it at the end of the patternProperties block.
> Thanks for the hint, then I will correct this and resubmit.

But Rob asks for it, so regardless whether it makes difference or not,
you ignore the comment?

Best regards,
Krzysztof


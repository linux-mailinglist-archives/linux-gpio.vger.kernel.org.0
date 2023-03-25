Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50F976C8DEE
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Mar 2023 13:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjCYMRx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Mar 2023 08:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCYMRx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Mar 2023 08:17:53 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3DD2D73;
        Sat, 25 Mar 2023 05:17:51 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ew6so17761407edb.7;
        Sat, 25 Mar 2023 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679746670;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pu8wL5qXVxNgSV+ESDKQBRdfmOHZWJtmzs8uhRMKNw0=;
        b=QlbtkAIghM6F1+7hxP11wPojqP837QcQnBAS3ZkcwugfPuVObD9rvyb6iFvuiZrQxp
         LgKaNEmSCwxyd1n4jIIoDH74sNCM4OWuoc/1O+Rpx7BToeX9BpvjrzovdclFYwVO9lU+
         C0c9qkSnvxeEGk7U39zzY29WnCxTtv2g3MXGbui4eVcGLTGfcu2gD8Bv2foIW4D65p0T
         ZucXNUpMNk1DnuFcxVCgTqYwmsri6snu0QA1x3CVnmWTLBmf/hqRljHZ7zgtGpdbZXXX
         HkBw/sjfjD5C5J8fdcaE5F3jmzwZgg037xDAZNcx3+FSls0nMYIA9xAUX6L7RCssurLZ
         ZKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679746670;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu8wL5qXVxNgSV+ESDKQBRdfmOHZWJtmzs8uhRMKNw0=;
        b=TYnpU/bAmmcwccs6FgwcOxlxWgnzr+P+94Rh/7qI9RZYagULbooX3XtZAk3hOlYKej
         LaeMREcG54V8VbYMG/m1Dxyg+b14BtFnqqRebE94bIo2AURXoSzKLDGyST6hWY+VrBMe
         u25UIyS5zo7uZ5FO+3+/4oT4EoaQl0qHj+qvbAGwmpTE67MNItV1h9uWzuJKRZATatL/
         7jRFJPJ/fo+eQ6WtN9+OVATbDYRUvKafJeGwYVmnZIAJTyTmLDzHzZ2r2sQB1CHZ5HDj
         4gK8Li/DNY2IvONjuifcuyE0WDjiF6zcMHwcgRq2a5432M/RsuTWK9sfVOHicHTES2Ow
         iNCA==
X-Gm-Message-State: AAQBX9cak5fg14pikugh/UGyXF/ie31xVzqr+6k7ythG8PZWIAXtcs+3
        4GaWh8ODei71eb5cVnH0QvQ=
X-Google-Smtp-Source: AKy350Yf9IylYypMjLI9oj7WYoAte5cYfPahaeTQxosFGWXl6ka2/1vfBRamrxmGMerfgbTc1nfV8g==
X-Received: by 2002:a17:906:8296:b0:933:868:413a with SMTP id h22-20020a170906829600b009330868413amr5925389ejx.15.1679746670305;
        Sat, 25 Mar 2023 05:17:50 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73a5:2800:e59a:ffcb:c722:70cf? (dynamic-2a01-0c22-73a5-2800-e59a-ffcb-c722-70cf.c22.pool.telefonica.de. [2a01:c22:73a5:2800:e59a:ffcb:c722:70cf])
        by smtp.googlemail.com with ESMTPSA id i21-20020a17090639d500b009332bb8b1f7sm10374452eje.66.2023.03.25.05.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 05:17:49 -0700 (PDT)
Message-ID: <73faa10f-c94a-759f-8407-49d64bd0f824@gmail.com>
Date:   Sat, 25 Mar 2023 13:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v7] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <29530f96-2633-a9ae-0ab6-811b68a74e9d@linaro.org>
Content-Language: en-US
In-Reply-To: <29530f96-2633-a9ae-0ab6-811b68a74e9d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25.03.2023 12:50, Krzysztof Kozlowski wrote:
> On 25/03/2023 12:41, Heiner Kallweit wrote:
>> On 25.03.2023 12:18, Krzysztof Kozlowski wrote:
>>> On 24/03/2023 23:51, Heiner Kallweit wrote:
>>>> Convert Amlogic Meson pin controller binding to yaml.
>>>>
> 
> 
>>>> +patternProperties:
>>>> +  "^bank@[0-9a-z]+$":
>>>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 4
>>>> +
>>>> +      reg-names:
>>>> +        items:
>>>> +          - const: mux
>>>> +          - const: pull
>>>> +          - const: pull-enable
>>>> +          - const: gpio
>>>> +
>>>> +    unevaluatedProperties: false
>>>
>>> Wrong placement. Rob asked you to put it after $ref and the review was
>>> conditional based on this. Don't add review-tag if you do not follow the
>>> comment.
>>>
>> I wasn't aware that this makes a difference, and in e.g. samsung,pinctrl.yaml
>> I found it at the end of the patternProperties block.
>> Thanks for the hint, then I will correct this and resubmit.
> 
> But Rob asks for it, so regardless whether it makes difference or not,
> you ignore the comment?
> 
I understood the comment as: It needs to be in the block, somewhere after the $ref.
My bad.

> Best regards,
> Krzysztof
> 
Heiner






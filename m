Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED997C5577
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234993AbjJKNc1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 09:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234962AbjJKNc0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 09:32:26 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2255598
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 06:32:25 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9adb9fa7200so208595166b.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697031143; x=1697635943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s4EU3H66ilYHzxqiApK5KfKo/gZlOzNLji37b+64dZg=;
        b=ikBjklsuPhiru9OJuOUZ/X6G7xERXcSx/0UZYAo7vZvRPIZOSIEPDpdZ3C1AqCedI3
         x4wtAeNHopanYcP88x+q7q8q/MyLaihOur1cryuLR6X+yoyqG0vY+v0Lxp/5Akqx7kG6
         xrWFgPZ1Inw6IUdDYP85l5CQUUFwqliQTWh+97XY1lbctTgc+zMVKsWlKXCcJOqzwcWL
         4b6Bos7yXcCxjlEHixiBWL86YeEQHGLsXTEXBnMspsjeCNvGVfelon6HcH9D7YSfKQ7z
         B1CzI8q9RqOhQMXmypUPqX3Hho7+ZwtthI90eIk2WnaVd/eLn91wAKRkh7//6+r9VULt
         mqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697031143; x=1697635943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4EU3H66ilYHzxqiApK5KfKo/gZlOzNLji37b+64dZg=;
        b=V+T1O75w8IZ4YJuVEy2R5bXgaMD3AiOIpXIIDFk57YMVyOkpAvDo5E1puftQXz57px
         nO+M1oePN15ExKkZmbESfwER1/ZhzYh3FPb0QC7dszMePVBqb0rbNpJpYhCdBIQl0NB+
         cf0SrEqgLDi+kPtabtaCcl7Bxj82YXIlBqfKEDaHdJGSRHrlcN4THOdavE0ABFflj97l
         xWsBvxbvtHSIFLQK3SMoRfOJUsJCKWqIRDUOy9ejhpmjj9NmXdpNbRtbx1gtSIkVckO/
         8/PPobJrP1w3Qk3aWkWugDm3t7HLZUG7yR834TEFr6OkVt54cxuw3KpZANN2ksEge8dh
         8GoQ==
X-Gm-Message-State: AOJu0YxOOQ2PLfT8ldRafX8TBzLnM0qUL+3ILUS+5wwMaenGqBNoaQcU
        sjhpOFVZ/XrigKdHSLSRuvg9tw==
X-Google-Smtp-Source: AGHT+IHHCu8POi+AnydQOfVU8ke0j0pbOr8mzfgN8NAp0BGyBVyTDd2Jxf02RFVznbOHiz0/g8d6xQ==
X-Received: by 2002:a17:907:9409:b0:9ae:577b:3832 with SMTP id dk9-20020a170907940900b009ae577b3832mr16101505ejc.24.1697031143573;
        Wed, 11 Oct 2023 06:32:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090622d700b009930308425csm9716783eja.31.2023.10.11.06.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 06:32:23 -0700 (PDT)
Message-ID: <066d8b5c-d23b-4cbb-95ec-285c349ebae0@linaro.org>
Date:   Wed, 11 Oct 2023 15:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org>
 <1b7dcc34-1c9c-44cb-ae14-f63aca2317ea@linaro.org>
 <CADrjBPqz=7L-cP5-muJbFWZ0DTH4LP-gqCxXRDGKebxpG1FYvQ@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CADrjBPqz=7L-cP5-muJbFWZ0DTH4LP-gqCxXRDGKebxpG1FYvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/10/2023 15:27, Peter Griffin wrote:
> Hi Krzysztof,
> 
> Thanks for your review.
> 
> On Wed, 11 Oct 2023 at 13:09, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 11/10/2023 00:49, Peter Griffin wrote:
>>> Add dedicated google-gs101-uart compatible to the dt-schema for
>>> representing uart of the Google Tensor gs101 SoC.
>>>
>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>> ---
>>>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>>> index 8bd88d5cbb11..72471ebe5734 100644
>>> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>>> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
>>> @@ -19,11 +19,13 @@ properties:
>>>    compatible:
>>>      oneOf:
>>>        - items:
>>> +          - const: google,gs101-uart
>>
>> You just broke existing users.
>>
>> It does not look like you tested the DTS against bindings. Please run
>> `make dtbs_check W=1` (see
>> Documentation/devicetree/bindings/writing-schema.rst or
>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>> for instructions).
>>
> 
> Will fix in v3
> 
> fyi I've been running with
> 
> make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
> dt_binding_check DT_SCHEMA_FILES=google
> make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
> dt_binding_check DT_SCHEMA_FILES=samsung
> make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  CHECK_DTBS=y
> W=1 google/gs101-oriole.dtb
> 
> But clearly that wasn't enough to catch this.  

None of the commands above test existing DTS...

>`make dtbs_check W=1`
> takes a long time
> and gives so much output. I suppose adding a few of the other exynos
> based boards should
> still be fairly quick and hopefully catch things like this. For example adding
> 
> make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y
> W=1 exynos/exynos850-e850-96.dtb
> make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y
> W=1 exynos/exynos5433-tm2.dtb
> make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y
> W=1 exynos/exynosautov9-sadk.dtb
> 
> regards,
> 
> Peter.

Best regards,
Krzysztof


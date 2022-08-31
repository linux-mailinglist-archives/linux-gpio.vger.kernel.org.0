Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6B45A7EFA
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 15:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbiHaNfp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 09:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiHaNfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 09:35:14 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AD6D572C
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 06:34:14 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bt10so19999792lfb.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=OOv9GRL0nYDS2NnSyAW5EZUBMP3Ppq/0jku4f/s4o/c=;
        b=QdPDLrA/x7FMlTinCUu5vYjwA7F7Ngughb8OukfhTvstR88QduXSLagsbySJ0wCjo0
         im8U0V6HxLYCGTfVvOG2v7L6VAqo08s63rLA+rYOHw6KAaKKDkeoFeqq6sQ8mDkXabec
         6ZUu99HxXrAPdOTovQOTRqRtX0qQQsvt3nPpUGpssjnb7iyhRO5TV5onmmTOw9+gJzSc
         g0R2okf5DzGqkJ6Q4Mbi6Iq8Hcgzt06/zpQ/JRy83f7jccbljaGt6mt7AqEaYclYCmHm
         p2YXHm51l1q6xWE2vTSeX9/qoe7pTb2frrmIMnkZVA9b0EdEkKhEvnF7tmPmZPDp/RSo
         jGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=OOv9GRL0nYDS2NnSyAW5EZUBMP3Ppq/0jku4f/s4o/c=;
        b=XmZY53C++SS0ORdcx2ZWSj9LHIcmhT6grAKdyQpABIzQFXum40qjj5bBmlZ+EM8Sbc
         SWpw735UCPrdH44kJn56nI04Idaj2uf7c6/O2oHnK1FqU4o5L7T9XdUas90LcoJwqaL9
         r/TBH4+m1tgaUiZazFy3/n2YjaPcefDFJe2xQIRB3FOucQsqih0NLlemxeineBX4LSxN
         U4v5xp9eJEkH36oSH3XMFZXTMbKSxe2wC5ykPy3uH7GBNqojyRaigNkAqhqW6xl+LMLS
         PMj9BYW5pZk57oe8mv4bEgz8ge0MS6S1fvd4ZjSJSAgMZTBJhJF7vbGULz34QovJ1yr8
         hMIg==
X-Gm-Message-State: ACgBeo3Ci1npq5r6s3Lg0Q6Ds6AIi+h3ItThfOjDI1cFlKRDxDQiZZKJ
        YkqNZhOPh0SiVfgQKE27ZOAuYg==
X-Google-Smtp-Source: AA6agR6gdHh4F4Qi/xgHw6C4Xzzy9Y0m5klM5eOJmjWBapmikULSRxa/IhApr8QMEpKonI0J9UjqsA==
X-Received: by 2002:a05:6512:e98:b0:492:cf3c:8860 with SMTP id bi24-20020a0565120e9800b00492cf3c8860mr9100260lfb.603.1661952847154;
        Wed, 31 Aug 2022 06:34:07 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id p9-20020a2eba09000000b0025df5f38da8sm2110704lja.119.2022.08.31.06.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 06:34:06 -0700 (PDT)
Message-ID: <97b256a7-670f-c681-424d-854d15145d24@linaro.org>
Date:   Wed, 31 Aug 2022 16:34:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/5] dt-bindings: gpio: pca95xx: add entry for pcal6534
 and PI4IOE5V6534Q
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        kernel@collabora.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220829133923.1114555-1-martyn.welch@collabora.com>
 <20220829133923.1114555-2-martyn.welch@collabora.com>
 <9db9dcf8-6299-acec-c09e-603afde9a239@linaro.org>
 <CACRpkdb1-LXwLdV3qLMc+i_VaLoJ-mTs=+0QtuJtNaQR_xVpxQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdb1-LXwLdV3qLMc+i_VaLoJ-mTs=+0QtuJtNaQR_xVpxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31/08/2022 16:26, Linus Walleij wrote:
> On Tue, Aug 30, 2022 at 9:50 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 29/08/2022 16:39, Martyn Welch wrote:
>>> The NXP PCAL6534 is a 34-bit I2C I/O expander similar to the PCAL6524. The
>>> Diodes PI4IOE5V6534Q is a functionally identical chip provided by Diodes
>>> Inc.
>>>
>>> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
>>
>> Then diodes should be followed by fallback (and use only one compatible
>> to bind).
> 
> Ugh I don't think we have done a very good job at providing fallbacks
> (several compatibles) for this hardware. Just looking at the list makes
> me suspicious.
> 
> The fallback scheme is pretty hard to maintain when vendors are a bit
> unclear on whether things are really compatible or not, and sometimes
> they are compatible but rather not say :(

If you have specific+fallback compatible (e.g. diodes,pi4ioe5v6534q,
nxp,pcal6534), you can always introduce changes in the driver because it
will match to the specific one (diodes). You could even introduce
incompatible changes, if you insist, and the effect would be the same as
adding now two compatibles in the driver.

In the same time having fallback saves you useless entries in the driver
like:
{ .compatible = "nxp,pca9556", .data = OF_953X( 8, 0), }
{ .compatible = "nxp,pca9557", .data = OF_953X( 8, 0), }

I mean, really, this will grow. I was not CC-ed on the driver change -
for some reason only on some pieces of patchset - so difficult to say
how it looks here, but judging by description ("identical chip") it is
exactly the same as above.

I don't insist on it, but for most of other pieces of complex devices
(SoC IP blocks) we follow such approach.

Best regards,
Krzysztof

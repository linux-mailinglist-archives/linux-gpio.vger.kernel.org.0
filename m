Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289AE6B9F0B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 19:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjCNSuV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 14:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjCNSuU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 14:50:20 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF9A7A92E
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:49:50 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id cn21so35884692edb.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678819785;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBqiK1fdiFoyIe6lFlpNE74OL7vWLnZXHV8Umjh/RwI=;
        b=u3c2wd57cK4063pHJt0R2Yaki9WqT5225lQ1H3T9wOvlA6LS31Qcp8or6MsK7KTDW6
         9x4HZFSgSIy1hynhnjE2xvZmC6GEpzh7Vgg5ipjxp0WAHqtR+VCpK/rWpi39Y1qR46KW
         GgZCHpNu6zD6EBNZWjfVkz62fJCbXKpMoRl2p7btdjUxHNq2RSovEOwZG6Zbv3JLhZJE
         VxFbW1DvawNQttmI5x5S7KksSSwVK+pAW6iadntCVLaIC1xnT8tnWUGZn7m28EJ7YMY2
         Itj0aKXiHsfo9yEjZlaaqjJ2lUaN0Ygw+2fsKGVQwWQvvcDJiuERacS5AjlQhV/bxi0P
         yrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819785;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBqiK1fdiFoyIe6lFlpNE74OL7vWLnZXHV8Umjh/RwI=;
        b=J0goiXbkmabQOiPBUq45XUKk33ME0T9GI93uUZRHxcsfl5squeRR7KaNslY7wjNFY8
         /Nf7hpFhWXX3Mrw1TRLak9+HdfxwWe+00jg2ZunhtSEx3Br3scwZ0sGIUYHBBt6s/3qU
         5FMkfObv4XOmFTyrSENkQOQYZsf8KoE0pfK37bqmJY55+Z0qDe0Zzy5t+ojbkkoR1m04
         zsiRJ5NrCbPxC9YlLUWBBPdRUJTNCKQpjlqaGMWTk7af7+zdCIaGJ9sAOd0e8JNHFWSq
         NSijODt3hWJKHZKWGGHQsZE3+AvOAdmY+JKh7uyNXxFjVJRK7sxg6JRVbktE6E0nDS1z
         udzg==
X-Gm-Message-State: AO0yUKXrDtDBnchkKjHC4CQqCYA1tyQAJMH5J/cEH9IMnfwpLarWGaEx
        k0PToROeCuvtCR+SB5MCr6sQwQ==
X-Google-Smtp-Source: AK7set9ZDuvkK4/qn7ZMxcqNEOy3LLVe0sAT16GfKhVSVwJkeqBrHWEzjDn2v7RTuOZOuylmf3DpIg==
X-Received: by 2002:a17:906:9f0a:b0:8a5:8620:575 with SMTP id fy10-20020a1709069f0a00b008a586200575mr3423467ejc.3.1678819785002;
        Tue, 14 Mar 2023 11:49:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id r23-20020a50aad7000000b004f9e6495f94sm1441787edc.50.2023.03.14.11.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 11:49:44 -0700 (PDT)
Message-ID: <c45406e4-51e5-0df6-4b53-6355a56a0a34@linaro.org>
Date:   Tue, 14 Mar 2023 19:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jim Liu <jim.t90615@gmail.com>, JJLIU0@nuvoton.com,
        KWLIU@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20230314092311.8924-1-jim.t90615@gmail.com>
 <20230314092311.8924-3-jim.t90615@gmail.com>
 <5c38d97d-af2a-51b5-7b4d-bac69321e5ad@linaro.org>
In-Reply-To: <5c38d97d-af2a-51b5-7b4d-bac69321e5ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/03/2023 19:47, Krzysztof Kozlowski wrote:
> On 14/03/2023 10:23, Jim Liu wrote:
>> Add the SGPIO controller to the NPCM7xx devicetree
>>
>> Signed-off-by: Jim Liu <jim.t90615@gmail.com>
>> ---
>> Changes for v5:
>>    - remove npcm8xx node
>> Changes for v4:
>>    - add npcm8xx gpio node
>> Changes for v3:
>>    - modify node name
>>    - modify in/out property name
>> Changes for v2:
>>    - modify dts node
>> ---
>>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
>> index c7b5ef15b716..7f53774a01ec 100644
>> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
>> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
>> @@ -330,6 +330,36 @@
>>  				status = "disabled";
>>  			};
>>  
>> +			gpio8: gpio@101000 {
>> +				compatible = "nuvoton,npcm750-sgpio";
>> +				reg = <0x101000 0x200>;
>> +				clocks = <&clk NPCM7XX_CLK_APB3>;
>> +				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
>> +				bus-frequency = <8000000>;
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Eh, wrong key shortcut. Should be:

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Best regards,
Krzysztof


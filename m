Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0EB623DA0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 09:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbiKJIgf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 03:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbiKJIgd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 03:36:33 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D9F24963
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 00:36:31 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p8so1802535lfu.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 00:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hD2GoNYEi1bbT2utuBp8JXp3nfUHRD/HO+ATh+zN8jI=;
        b=VWnZRYB4Ic3R39t6RRUOJTMZg8NhQ4M1fZoco49UJchgGScDVc79R5HysMQmMO9Z1W
         XPQ6LoDIGU5d7hBqsMBze23ilmldwbF+4M136gMCyPjPeqwsucbesOvZ6JqVsw3I+AJC
         8wDQkHy5tVCbhrcNSWIXc0yWZkart/kjwTp8XX9eL/buGnqlc9DH0Oi+DqL0SgJI8PUp
         djzwSAqEMSZGZVPHKJD1U5SQNKL/hK3kzH3njh3Y7BA+UCKva3CqKkS8nf+IkxYYEszc
         P6qV632e2p4xIyf78n8geDi3E6OeqzulDZjRf2+J/vOYkVk9Sy2OwQBdN/F9cPAsoUj5
         D/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hD2GoNYEi1bbT2utuBp8JXp3nfUHRD/HO+ATh+zN8jI=;
        b=jCcWLsQRl/unmLVRp/f2GwQeNrnXwIF9T8U69cqeVrQWqfGfKEZWp8L2bHCWzxqAiy
         j1C4YHUK8blA/1pzSHJvU8XmT0Vz2TTu9s6qEeo9bivx4PUqhGaME+kyeTw42/9/dHOR
         1LoiayUAA6cquCt/jLiZODtgfmcQzZsZXK4NS8ROaK1fNauDHKKdsilJ4CM6BrneSNy0
         6Nqj5oAbPkNdcgBw9aS75vvmu6jG2+xZG75S9rgxEEvPi+CjNgqmOP66UrmFnC8A72hA
         E1fgakKS6UKvEGLLedGDHT2o9dvV9PiaaMRg8OwGzgK8LoiPgfz9/Xj+h8ETQHUfskIe
         L2tg==
X-Gm-Message-State: ACrzQf3nEU4WU1BtsO6S7iuwjBkOZN2RmSR/8C9p+3N8aZ6CIRHMjnJm
        injYl3BUvQoBaWjGDNz8sIj8Ew==
X-Google-Smtp-Source: AMsMyM5uZe41mYLvUHdybyL0w6T8tKsZm/YD9YzvYx+Pj0L6dqPz4hfII1MXn4OmyrQ7Bk/qNJiF5w==
X-Received: by 2002:a05:6512:31cd:b0:4a2:69d3:d009 with SMTP id j13-20020a05651231cd00b004a269d3d009mr20859211lfe.68.1668069389861;
        Thu, 10 Nov 2022 00:36:29 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id u28-20020ac25bdc000000b00497aa190523sm2631214lfn.248.2022.11.10.00.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 00:36:29 -0800 (PST)
Message-ID: <865d6c3e-cc23-bc4d-de91-41d090847843@linaro.org>
Date:   Thu, 10 Nov 2022 09:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom-msm8960-cdp: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221109105140.48196-1-krzysztof.kozlowski@linaro.org>
 <20221109105140.48196-3-krzysztof.kozlowski@linaro.org>
 <20221110033753.oyhl7z2edsrkkepg@builder.lan>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221110033753.oyhl7z2edsrkkepg@builder.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/11/2022 04:37, Bjorn Andersson wrote:
> On Wed, Nov 09, 2022 at 11:51:40AM +0100, Krzysztof Kozlowski wrote:
>> DT schema expects TLMM pin configuration nodes to be named with
>> '-state' suffix and their optional children with '-pins' suffix.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> ---
>>
>> Changes since v1:
>> 1. Add Rb tag
>> ---
>>  arch/arm/boot/dts/qcom-msm8960-cdp.dts | 19 +++++++++----------
>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
>> index 3a484ac53917..9a3a510f88ca 100644
>> --- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
>> +++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
>> @@ -60,33 +60,32 @@ &gsbi5_serial {
>>  };
>>  
>>  &msmgpio {
>> -	spi1_default: spi1_default {
>> -		 mux {
>> -			pins = "gpio6", "gpio7", "gpio9";
>> -			function = "gsbi1";
>> -		 };
>> -
>> -		 mosi {
>> +	spi1_default: spi1-default-state {
>> +		 mosi-pins {
>>  			pins = "gpio6";
>> +			function = "gsbi1";
>>  			drive-strength = <12>;
>>  			bias-disable;
>>  		 };
>>  
>> -		 miso {
>> +		 miso-pins {
>>  			pins = "gpio7";
>> +			function = "gsbi1";
>>  			drive-strength = <12>;
>>  			bias-disable;
>>  		 };
>>  
>> -		 cs {
>> +		 cs-pins {
>>  			pins = "gpio8";
>> +			function = "gpio";
> 
> I'm changing this to "gsbi1" while applying this patch.

Thanks Bjorn. This was missing in original DTS, so I assumed intention
was a GPIO-based CS. I guess SPI-based also makes sense...

Best regards,
Krzysztof


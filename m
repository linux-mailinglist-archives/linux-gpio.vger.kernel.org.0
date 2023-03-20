Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459FF6C0F60
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 11:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjCTKlE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 06:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbjCTKkB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 06:40:01 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796F11ABCA
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 03:38:51 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id g18so11570428ljl.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679308727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqMd1/bvzkJr2S5YOFkrY+D78y5J8naNvqIi32NoRCM=;
        b=uku/WQWhs3h922mxzqwiwM8cijN2GAkl9AYbzt/KPND/Efj9p75M94A8lYS6oOTWxO
         SYdScdI1wmySbPtpi/v9382GFKGT+d3zisfwRFzGKC76eJnT473QT2sJdn+Ni1AVy+RA
         dL74bUrG2fTHSM0Y+n7IA+FEVzLBz9IBei0Prz/0x9wqKeypUP2xAmNG78waWUS1Kag1
         9gZ8e9IupnLUOF4OrepR9XSW8SKYldmFV0lO1i/9s3+8gGnHdiHXaCIEIlUgDPjVO4dG
         0kbRxzsNKfw+r1VieL3TLLa2FC8stqIhurHQvt3FU4VtSqX07VhNsbd89mvpNS5CicTj
         2Oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqMd1/bvzkJr2S5YOFkrY+D78y5J8naNvqIi32NoRCM=;
        b=IwupltVZIZblzkJeHrmMAh/IlPk2Bhl4J8L0uQLNFXD3Km9FU+Yop9zLWV7rEzNXZS
         pXZSrx4tulMDOT3W0Q6gGGO4vLxvv4IFs53OlBJRt1au1YfsmD5RLjM0XoRTtUQxJgrB
         otgm4ry5D4v2Fvxrj7u6A7pYYv94FeP2QI87Qv+D4TaPWXhWLLdo2FUi8pnrqL2fxrBH
         Hg1HxqRdsd/vexGDKBGmXe8reZGbISwJGYz9mc+qnVaugmQvFEc7w/DIaL+CjnN3tCl2
         QZXzFmvIOAX7cg9+HDT9OIdNlL+QETEMU9xAWTwy+AnzpExSpEXAnyLP4Q+0YOed9H/d
         k1LQ==
X-Gm-Message-State: AO0yUKVwBcFYhcKh1YZ56IaUPMkbzXfN4nCANRGnH3rl+vy2KRbaxg8I
        kYuNVsneeqBYnW3IY3+Wi/r+0Q==
X-Google-Smtp-Source: AK7set8My2CPrAzRUr2Uo6cI/0kZXyHszzZeIovquOsX7Pif/PtdFm1/JfqQQA8MuaBpztgKz9A0jQ==
X-Received: by 2002:a2e:9281:0:b0:295:b0cd:519 with SMTP id d1-20020a2e9281000000b00295b0cd0519mr5460138ljh.3.1679308727473;
        Mon, 20 Mar 2023 03:38:47 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id v18-20020a2e9252000000b002934abfb109sm1688825ljg.45.2023.03.20.03.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:38:47 -0700 (PDT)
Message-ID: <c9485ea6-e419-947e-4d5e-bcaf5d0cfeb2@linaro.org>
Date:   Mon, 20 Mar 2023 11:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/14] arm64: dts: qcom: sa8775p: add support for the
 on-board PMICs
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230314183043.619997-1-brgl@bgdev.pl>
 <20230314183043.619997-6-brgl@bgdev.pl>
 <08dff56d-227a-a791-549c-15ac0f1ac08b@linaro.org>
 <CAMRc=MdSRY8w0pWuhprB1ALPFpcCdYOnyQZ63BSzJPa3u1a-jA@mail.gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAMRc=MdSRY8w0pWuhprB1ALPFpcCdYOnyQZ63BSzJPa3u1a-jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 20.03.2023 11:24, Bartosz Golaszewski wrote:
> On Tue, Mar 14, 2023 at 9:22 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 14.03.2023 19:30, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Add a new .dtsi file for sa8775p PMICs and add the four PMICs interfaced
>>> to the SoC via SPMI.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 37 +++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
>>> new file mode 100644
>>> index 000000000000..77e2515a7ab9
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
>>> @@ -0,0 +1,37 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2023, Linaro Limited
>>> + */
>>> +
>>> +#include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/spmi/spmi.h>
>>> +
>>> +&spmi_bus {
>>> +     pmk8775_0: pmic@0 {
>> pmk8775..
>>
>>> +             compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
>> ..or pmm8654au?
>>
> 
> Honestly, I got inspired by this bit from sc8280xp-pmics.dtsi:
> 
>  54 &spmi_bus {
>  55         pmk8280: pmic@0 {
>  56                 compatible = "qcom,pmk8350", "qcom,spmi-pmic";
>  57                 reg = <0x0 SPMI_USID>;
>  58                 #address-cells = <1>;
>  59                 #size-cells = <0>;
> 
> Where the label seems to follow the SoC's numbering. Do you think it
> would be better to consistently use the pmic's name?
Generally, the automotive PMICs seem to be carbon copies of their non-AU
relatives, except they're built to a better electrical spec (because well..
they're gonna be used in cars) or very very slightly modified, so I propose:

actual_pmic: pmic@sid {
	compatbile = "qcom,actualpmic", "qcom,pmic-its-based-on";
}

Konrad
> 
> Bartosz
> 
>> Konrad
>>> +             reg = <0x0 SPMI_USID>;
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +     };
>>> +
>>> +     pmk8775_1: pmic@2 {
>>> +             compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
>>> +             reg = <0x2 SPMI_USID>;
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +     };
>>> +
>>> +     pmk8775_2: pmic@4 {
>>> +             compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
>>> +             reg = <0x4 SPMI_USID>;
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +     };
>>> +
>>> +     pmk8775_3: pmic@6 {
>>> +             compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
>>> +             reg = <0x6 SPMI_USID>;
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +     };
>>> +};

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451403FA5AA
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Aug 2021 14:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbhH1MlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Aug 2021 08:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234272AbhH1MlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Aug 2021 08:41:05 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D818C061756;
        Sat, 28 Aug 2021 05:40:13 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.105.neoplus.adsl.tpnet.pl [83.6.168.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 50CFD20123;
        Sat, 28 Aug 2021 14:40:08 +0200 (CEST)
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM6350 pinctrl
 bindings
To:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210820203751.232645-1-konrad.dybcio@somainline.org>
 <20210820203751.232645-2-konrad.dybcio@somainline.org>
 <YSO+kQnDsqcaBIOg@ripper>
 <82cb4d2d-f347-b823-fa4c-4c2b0c0bfb0c@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <07862c1f-f7c0-51c5-b2a5-60c164a53700@somainline.org>
Date:   Sat, 28 Aug 2021 14:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <82cb4d2d-f347-b823-fa4c-4c2b0c0bfb0c@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


>>> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +        pinctrl@f100000 {
>>> +                compatible = "qcom,sm6350-tlmm";
>>> +                reg = <0x0f100000 0x300000>;
>>> +                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
>>> +                gpio-controller;
>>> +                #gpio-cells = <2>;
>>> +                interrupt-controller;
>>> +                #interrupt-cells = <2>;
>>> +                gpio-ranges = <&tlmm 0 0 156>;
>> Shouldn't this be 157?

Yes, it should. Good catch.


>>
>>> +
>>> +                gpio-wo-subnode-state {
>>> +                        pins = "gpio1";
>>> +                        function = "gpio";
>>> +                };
>>> +
>>> +                uart-w-subnodes-state {
>>> +                        rx {
>>> +                                pins = "gpio25";
>>> +                                function = "qup13_f2";
>>> +                                bias-disable;
>>> +                        };
>>> +
>>> +                        tx {
>>> +                                pins = "gpio26";
>>> +                                function = "qup13_f2";
>>> +                                bias-disable;
>>> +                        };
>>> +                };
>>> +        };
>>> +...
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
>>> index 3b37cf102d41..99975122a2ce 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
>>> @@ -17,7 +17,7 @@ properties:
>>>     interrupts:
>>>       description:
>>>         Specifies the TLMM summary IRQ
>>> -    maxItems: 1
>>> +    maxItems: 9
>> Is this to support direct connected interrupts?
>>
>> Don't you need to add minItems: 1, to permit the other bindings to not
>> define these? I think that's what Rob's automatic reply complains about
>> at least.
>>
>>
>> PS. Any plans to work up support for direct connected interrupts? I
>> think that and "egpio" is the only downstream delta these days... That
>> said, I don't know if anyone actually uses direct connected interrupts?

I haven't really gotten into that piece yet, trying to get the platform up first..



>
> Using .wakeirq_dual_edge_errata = true, in pinctrl-sm6350.c (msm_pinctrl_soc_data structure) in [1] should help. The direct connect interrupt were added to support dual edge in downstream driver but in upstream setting this flag should help.
>
> This was used in sc7180 but should apply SM6350 too.
>
> That way you don't need other TLMM interrupts to be listed here.
>
> [1] https://patchwork.kernel.org/project/linux-arm-msm/patch/20210820203751.232645-3-konrad.dybcio@somainline.org/
>
> Thanks,
> Maulik
>
Thanks, I'll check and respin a v2 with that.


Konrad


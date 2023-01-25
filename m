Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C411A67B6CC
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 17:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236049AbjAYQVY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 11:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236004AbjAYQVF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 11:21:05 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E825AB5B
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 08:20:40 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id m7so3931247wru.8
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slnyAV6MaHfo5cGXPJA+Cna3TI+4G6tWc0UbnmcgEDE=;
        b=k7ENkjp7CZQlib2dPzrpRmyMLk2gfukicdyDvoQkkc+q1l7jNEDMn/1hrTulY/mGuL
         rmn/nbCMhDb/1gRZ0hq7CjBuNiBDkqrqYHfBFAUJ0nK40NcvED+n0AuXvhUBOcx63/4N
         51U2sTdBFF3wO/OwGpjDEHZ3cfIPsEJccfBOdTIcsu1YXWO/Yt3c+H1zfOaXnfrK2JD4
         Pb2Bc83boGx592EkWRKK7EfwMsmGXOXUIXSnoOiF3IGHrfYwfz70IKyyftDrl0ABbm27
         KHhcVRwrGZzFbxL3oWULpRu75PA4WQzCiukeuIU5wJjF1vrVx76ocAwZtCU6kea00GFM
         bp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=slnyAV6MaHfo5cGXPJA+Cna3TI+4G6tWc0UbnmcgEDE=;
        b=su+9IFWBM0bGbpj6kNe51OTwmPwfxuUIK+ZzHZ8EARCnPvnNrfa3dm6HgX/wOMp/wC
         SbRLzDXe98nGkQGTJlrI7/4kNzBzqM2674fjsnqyleRutEUmRhm/BzZ4Zrz52fodD8Rl
         NWwyV7FBdbwCaaCzbTN60KpnqVBoO84zCc9QlhgL4v/j8lT+5BUPofEW/K27IlGumQgu
         61CfN2E+71kx1TK539GEUCZtjedrWe7Pq2rjSbyC/+6yyWZCVkStkOS6WdwUrwSf/B4u
         4ki9TGK3tm9/84GLfGmD13ZgJyx3h2MsWgplhI4ICFS6fYAI+/IGvHdQwzsArHrj+CFn
         0y0w==
X-Gm-Message-State: AFqh2kpi/jVMQOvMI5e9i88uWfJYT9gd2ZoCZ2Ak4+mmJNtlgcOfrpd0
        lrTYJKqigVwN/GQ96hQsv1KPPw==
X-Google-Smtp-Source: AMrXdXsErnmK+EAjDOryVC5A8CCD05H7UGeqMzi84c5REP0WfWlAHqqLMR+3jCLqqnJd+b6QMKPNPA==
X-Received: by 2002:a05:6000:5c2:b0:2bb:eb3d:8d20 with SMTP id bh2-20020a05600005c200b002bbeb3d8d20mr27126612wrb.43.1674663636289;
        Wed, 25 Jan 2023 08:20:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n21-20020adf8b15000000b0028965dc7c6bsm4729019wra.73.2023.01.25.08.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 08:20:35 -0800 (PST)
Message-ID: <d6512673-a232-c8e5-45f7-e903fc1a01a7@linaro.org>
Date:   Wed, 25 Jan 2023 17:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 01/10] dt-bindings: pinctrl: qcom: add IPQ5332 pinctrl
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230125104520.89684-1-quic_kathirav@quicinc.com>
 <20230125104520.89684-2-quic_kathirav@quicinc.com>
 <50ec54ba-3468-3448-3fab-f28e97549ad2@linaro.org>
 <0b28f4a3-c445-7473-501b-39cbcfdb9889@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0b28f4a3-c445-7473-501b-39cbcfdb9889@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/01/2023 16:49, Kathiravan Thirumoorthy wrote:
>>
>>> @@ -0,0 +1,134 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/pinctrl/qcom,ipq5332-pinctrl.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm IPQ5332 TLMM pin controller
>>> +
>>> +maintainers:
>>> +  - Bjorn Andersson <andersson@kernel.org>
>>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> +
>>> +description: |
>>> +  Top Level Mode Multiplexer pin controller in Qualcomm IPQ5332 SoC.
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,ipq5332-tlmm
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts: true
>> missing maxItems
>>
>> Rebase your patches on latest next and use the latest bindings and
>> drivers as starting point.
> 
> 
> Changes are based on v6.2-rc1.  I see the maxItems changes in 
> linux-next. Will update this in V2.

Your patches cannot be based on v6.2-rc1. They won't even apply. You
miss entire development of last month.
> 
> 
>>> +  interrupt-controller: true
>>> +  "#interrupt-cells": true
>>> +  gpio-controller: true
>>> +  "#gpio-cells": true
>>> +  gpio-ranges: true
>>> +  wakeup-parent: true
>>> +
>>> +  gpio-reserved-ranges:
>>> +    minItems: 1
>>> +    maxItems: 27
>>> +
>>> +  gpio-line-names:
>>> +    maxItems: 53
>> You have 54 GPIOs.
> 
> 
> Sorry, GPIO ranges are from 0-52, will update it in all places in V2.

Ah, then the gpio pattern needs a fix.


Best regards,
Krzysztof


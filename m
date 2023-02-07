Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C212B68D382
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 11:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjBGKFj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 05:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbjBGKFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 05:05:38 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6882C4EC6
        for <linux-gpio@vger.kernel.org>; Tue,  7 Feb 2023 02:05:35 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id x9so6690338eds.12
        for <linux-gpio@vger.kernel.org>; Tue, 07 Feb 2023 02:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CB3W+mpZUUBi2cmMXLm+4eDNlFrkIfZhze9vVo4YzYY=;
        b=XpU/97GFhq+0wad/HeRlajCjBdroUGPLlehxDD9UX8IZRVS39ryX1GMgqvYcfjU4yR
         ZXjQGAWMHmuNMrjHN1t81B3LlBdwB0bhmIwdciSwHrBiChLYVjWpS0SzHPxr0oLkmurC
         A6tF7TBFCLxmh0J+rz6DeGN3Bh7FXE22w/Y/MGyySNn/9OqSeE4XsfL5X9k6VE9x9f4I
         ULdL+KSGbyIffdt0mcze5fN9zbep3EQ+0ylRU2LxqYgA4yeZ5/c2Fc8Lr+bQIy/B443b
         NrLLDuf0ONJ3UeXMQ6kjjc5wRO/cphf72QHW8YhFgonWTZQ77lYsscCV5DX32PBq7Ds0
         AmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CB3W+mpZUUBi2cmMXLm+4eDNlFrkIfZhze9vVo4YzYY=;
        b=ho3N79MoBi0IU8TpxK2WNRi3Qdl00n1A/QvR+Nm6eBCLBVyrQJW8mV9rXdNzcZ0l4h
         JrUYeCRraUW+9FCIICu9AdPV3g+J8zzTPZ9pLTwJVMORX0/GsdktziI/8da/eGIMoWGH
         PdSVRCmfgaGn4TiD5sDA9EPrn/sM0GQK6RQbQcBBgOLaWyJUFTXdjjKlhX/sXXnNN/RE
         mKqQWsM0FJiz5v/3iYzpS2O+3dZEvQ0b8LTcmPvkfMBlWIh2T9Hi96LWfmVTPawcQxxH
         BmTKnCcunuOEKW+gaXIz9RMRhV+MIOfwMxq6VtxhbL4LS9dsVuqiexRhpk4a4hYgjfnL
         o76w==
X-Gm-Message-State: AO0yUKUGIOeeK5Es5NnLLt/nMSDt3DnlosO1+NwDFxIIaofbPlGw4Kmi
        xnZ1l7zNW0acVzzy1dWJTS5BzQ==
X-Google-Smtp-Source: AK7set9HKQ7a05BPrqGVABcB4J9VZ6pDC+8Kf+QwVLqM/biSJ88LjrUqCv10liTD0djs2WEBPH/E3Q==
X-Received: by 2002:a50:d610:0:b0:491:6897:c5cb with SMTP id x16-20020a50d610000000b004916897c5cbmr2748920edi.41.1675764333968;
        Tue, 07 Feb 2023 02:05:33 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ef15-20020a05640228cf00b0046b471596e6sm6197560edb.57.2023.02.07.02.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:05:33 -0800 (PST)
Message-ID: <ef449dd2-c385-f2e6-30f0-7c0ae803d5c5@linaro.org>
Date:   Tue, 7 Feb 2023 12:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 4/9] dt-bindings: clock: Add Qualcomm IPQ5332 GCC
Content-Language: en-GB
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        krzysztof.kozlowski@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, marcel.ziswiler@toradex.com,
        nfraprado@collabora.com, robimarko@gmail.com,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20230206071217.29313-1-quic_kathirav@quicinc.com>
 <20230206071217.29313-5-quic_kathirav@quicinc.com>
 <03d6c92a-c9f3-915c-218a-14ff5c5250d2@linaro.org>
 <b82c8aaf-b574-45b2-3b44-9edc6f82d619@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b82c8aaf-b574-45b2-3b44-9edc6f82d619@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 07/02/2023 06:26, Kathiravan T wrote:
> Thanks Dmirty for taking time to review the patch.
> 
> 
> On 2/6/2023 3:22 PM, Dmitry Baryshkov wrote:
>> On 06/02/2023 09:12, Kathiravan T wrote:
>>> Add binding for the Qualcomm IPQ5332 Global Clock Controller.
>>>
>>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>>> ---
>>> Changes in V3:
>>>     - Actually I missed to remove the clocks in V2 which are supposed to
>>>       be removed. In V3 I have removed those and they are
>>>       GCC_APSS_AHB_CLK, GCC_APSS_AHB_CLK_SRC, GCC_APSS_AXI_CLK
>>>     - For the same, didn't add the Reviewed-By tags from Stephen and
>>>       Krzysztof
>>>
>>> Changes in V2:
>>>     - property 'clocks' is marked required
>>>     - Renamed the include file name to match with compatible
>>>
>>>   .../bindings/clock/qcom,ipq5332-gcc.yaml      |  61 +++
>>>   include/dt-bindings/clock/qcom,ipq5332-gcc.h  | 356 ++++++++++++++++++
>>>   2 files changed, 417 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>   create mode 100644 include/dt-bindings/clock/qcom,ipq5332-gcc.h
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml 
>>> b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>> new file mode 100644
>>> index 000000000000..961311af400c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>> @@ -0,0 +1,61 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Global Clock & Reset Controller on IPQ5332
>>> +
>>> +maintainers:
>>> +  - Stephen Boyd <sboyd@kernel.org>
>>> +
>>> +description: |
>>> +  Qualcomm global clock control module provides the clocks, resets 
>>> and power
>>> +  domains on IPQ5332.
>>> +
>>> +  See also:: include/dt-bindings/clock/qcom,gcc-ipq5332.h
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,ipq5332-gcc
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO clock source
>>> +      - description: Sleep clock source
>>> +      - description: PCIE 2lane PHY pipe clock source
>>> +      - description: PCIE 2lane x1 PHY pipe clock source (For second 
>>> lane)
>>> +      - description: USB PCIE wrapper pipe clock source
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: xo
>>> +      - const: sleep_clk
>>> +      - const: pcie_2lane_phy_pipe_clk
>>> +      - const: pcie_2lane_phy_pipe_clk_x1
>>> +      - const: usb_pcie_wrapper_pipe_clk
>>
>> pcie3x1_0_pipe_clk_src, pcie3x1_1_pipe_clk_src, pcie3x2_pipe_clk_src 
>> usb0_pipe_clk_src are missing.
> 
> 
> Here is the mapping,
> 
> pcie_2lane_phy_pipe_clk  is the source for pcie3x2,
> 
> pcie_2lane_phy_pipe_clk_x1 is the source for pcie3x1_1,
> 
> usb_pcie_wrapper_pipe_clk is the source for pcie3x1_0_pipe_clk_src and 
> usb0_pipe_clk_src.
> 
> Is this what you are expecting or am I missing something here?

Yes. There were three parent_name entries in your driver. So I can 
assume that the binding might also be incorrect.

-- 
With best wishes
Dmitry


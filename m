Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF31C631B01
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 09:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiKUIKj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 03:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiKUIKi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 03:10:38 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448451705F
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 00:10:37 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id l12so17633727lfp.6
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 00:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJc97tVz8Np7zrJgaUJukwhYzlchMMe5Vq2+9jU6jbQ=;
        b=SpEAlxuayCmwUcK99ZovqDDz9D6NcYrSo+wxdtokbur947YGUw14kXFRonYWdq+JVw
         E45Cd9MJy4T7jERoOYj5xFPVOUxEJLwofAPRhkvTSyvDik11obECn5AQDoBz0zJMPH/z
         bQNfEqKDwWsq6f2LZs1CbPciuN9E3DdhopGdvqc9PJ0ozQ1U55EQfHONoJvK48FbGe6b
         bQGzVMoGSHimVLwIcCNziHnWknVHzwysHHTTm+ENHaZZUCL2vstJ2SgXY+TkUy2okHMi
         93bqbgugM6pWwkmHTBNYoeAG5LPH4dzzGFAaPxM3byxbYTO3nTf3JhCXP8/l0jFbL09J
         ChyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJc97tVz8Np7zrJgaUJukwhYzlchMMe5Vq2+9jU6jbQ=;
        b=jEDXUhj7xCtZp17TOhnZW7nDhF2qtGeY6CB5W1AUetXq609u4E1VTe/BKoqUud6FUC
         wQxSBLB6lLdMF9kYqgRKa+bqZrE68ukJZyb9a6//oUyuoTGkko0OmkCXD/5EF5udf/+H
         k3umMhX+us65S3p5FNoRWtIHwyTVxDhnfkmmyi8aXRsSOO+ZXy9qeKJrx0+SE2sbML8R
         XoJnGxbSaUs6hoaavNXniptI7CUxxYyGFpMB7iQ3+3X0R3aBQPi6eSkU/vwGLLGRhVOQ
         dKd+7uoEsViLRupS0lNmPRjf+dkaKs9kY+XCaOL4ySzThF6xAPnNhL3tSCepNrYSrj7x
         F3Og==
X-Gm-Message-State: ANoB5pmCCF//vVnXidN6Xpm84NYgyFqZ5zud7NChf6+/sonAKkWbV2Tj
        IuTEAUVPNXaGKuxOoG9JXvAlSw==
X-Google-Smtp-Source: AA0mqf6KyeCKxMLGMfC55yIqgtSo3LQr+b32lyA0Ozz84vLlkwY2J3VVUUkHRRbpBTAhUetGzTs6cA==
X-Received: by 2002:a19:2d52:0:b0:4b1:dc42:6f85 with SMTP id t18-20020a192d52000000b004b1dc426f85mr5261719lft.568.1669018235579;
        Mon, 21 Nov 2022 00:10:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g16-20020a19ee10000000b004b18830af7asm1917126lfb.54.2022.11.21.00.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:10:35 -0800 (PST)
Message-ID: <cf20ac7b-ede5-2e2c-247e-f32f1fc7f6be@linaro.org>
Date:   Mon, 21 Nov 2022 09:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sdm845-pinctrl: add GPIO hogs
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
References: <20221118162101.145267-1-krzysztof.kozlowski@linaro.org>
 <20221120164133.GA3166916-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221120164133.GA3166916-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20/11/2022 17:41, Rob Herring wrote:
> On Fri, Nov 18, 2022 at 05:21:01PM +0100, Krzysztof Kozlowski wrote:
>> Allow GPIO hogs in pin controller node.  qcom/sdm845-cheza.dtsi already
>> uses it.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/pinctrl/qcom,sdm845-pinctrl.yaml        | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
>> index c9627777ceb3..57bac7f7a4fc 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
>> @@ -48,6 +48,11 @@ patternProperties:
>>              $ref: "#/$defs/qcom-sdm845-tlmm-state"
>>          additionalProperties: false
>>  
>> +  "-hog(-[0-9]+)?$":
>> +    $ref: /schemas/gpio/gpio-hog.yaml
> 
> You can drop this and just do:
> 
> required:
>   - gpio-hog
> 
> As that's what selects the hog schema. Kind of an odd pattern I guess. 
> We could make gpio.yaml define hog nodes instead I suppose.

Thanks, that's much less code.


Best regards,
Krzysztof


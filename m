Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90D9560056
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 14:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbiF2MnU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 08:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbiF2MnT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 08:43:19 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225CD2315C
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 05:43:17 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id u12so32284181eja.8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8IGT3XO8mbcnscwzaJJ/fju1+Y/JsHqAOuPdeXWHctc=;
        b=mMjaPolO8e6kz36GKdQJsOiiFESlqqTfIh2LeMv8A6WG2Idy2x0+oIvs3YuYDHHT5P
         d3o5SCSb+IQq4l6IfWXfoVlEbsZ3nSD1E7BZWk+FDoXNtWNhAikCILntUhgF43Hoxpye
         pvi6rD3VUVI/DAgiuSWxnjfoOefX2jeOxpwp1Y286zFGjuW2qR6le8q8RasDokUukl0i
         DubWw8ipwr2KpNynMpEMGvnatUpbaYCUJSqtHsOLLnlCbG62SHRbnmj0SErFXEqSaEaL
         KRpjzdtpadzx7dKOW+yG4CTSkwg7UmT0d16DcdcR8hpWizPdczHr3ZfM7tiaxiT649DV
         teKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8IGT3XO8mbcnscwzaJJ/fju1+Y/JsHqAOuPdeXWHctc=;
        b=X2mq3fcGC9nnnGMZ6BrVG2Sbcr4Qf8vjlQBy8Vb1f8ph4WgwFic86R5BjOWUQVdXJI
         yWK32arM9mxErRl29mO0//W+c8efH/EIkcuLbpijdeYrp3fBQVdvu7WuglH1uZlNECjp
         Wz//GQh1aKwcRIn4kuMTKBnFjxTAb4dShGwmKBKTECO2A3R4jHTsE+SFDEbAHqdhsEyw
         rwsdSmgNNwEzJzORoLyzNj7gWhOWqKevrKxvHq1nDAz8sdvzCH9j9e73puCQuAwlupDV
         QIuiesu/3Vmapltw2/SOdYxOr9M++AV27f9rWlRHdC191KewOx27K5D3QwC2Nj5lJ26H
         OHSQ==
X-Gm-Message-State: AJIora/ijr6C8x+5OLaPWdDDnsXwFaWYXPD4fVxph5KOt6ExTc4wJkvd
        xx2eob2dLctcRxreH4/qzHAWyw==
X-Google-Smtp-Source: AGRyM1tEZX4qWtLp6ehowBV8ORmaWoRxrTI4PWpI3lto+2DFDjbGrVQ7xPUJM5AuV8OqHKDqUTGh4Q==
X-Received: by 2002:a17:906:7386:b0:715:7024:3df7 with SMTP id f6-20020a170906738600b0071570243df7mr3223632ejl.543.1656506595658;
        Wed, 29 Jun 2022 05:43:15 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k18-20020a056402049200b0042dcbc3f302sm9836073edv.36.2022.06.29.05.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 05:43:15 -0700 (PDT)
Message-ID: <0a3f3b42-7d9b-d6bd-6afd-cd14bf909b32@linaro.org>
Date:   Wed, 29 Jun 2022 14:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT schema for
 qcom,msm8909-tlmm
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
 <20220628145502.4158234-2-stephan.gerhold@kernkonzept.com>
 <91d972d2-689c-d357-869f-fbd826173e33@linaro.org>
 <Yrw5UnFXKCZvAr2d@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yrw5UnFXKCZvAr2d@kernkonzept.com>
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

On 29/06/2022 13:37, Stephan Gerhold wrote:
> On Wed, Jun 29, 2022 at 11:38:01AM +0200, Krzysztof Kozlowski wrote:
>> On 28/06/2022 16:55, Stephan Gerhold wrote:
>>> Document the "qcom,msm8909-tlmm" compatible for the TLMM/pin control
>>> block in the MSM8909 SoC, together with the allowed GPIOs and functions.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
>>> ---
>>>  .../bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 152 ++++++++++++++++++
>>>  1 file changed, 152 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
>>> new file mode 100644
>>> index 000000000000..e03530091478
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
>>> @@ -0,0 +1,152 @@
>>> [...]
>>> +patternProperties:
>>> +  '-state$':
>>> +    oneOf:
>>> +      - $ref: "#/$defs/qcom-msm8909-tlmm-state"
>>
>> No quotes here and other places, should be needed. I know you copied
>> from other bindings, but at least let's try new files to be proper.
>>
> 
> The quotes are necessary, since # starts a comment in YAML and the
> property would be effectively empty. :)
> 
> I tried it anyway but "dt_binding_check" complains as suspected:
> qcom,msm8909-tlmm.yaml: patternProperties:-state$:oneOf:0:$ref: None is not of type 'string'

Yes, you're right. Thanks for checking this.

Best regards,
Krzysztof

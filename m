Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B6638AFA3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 15:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243118AbhETNIB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 09:08:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51406 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233191AbhETNH4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 09:07:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621515995; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JPtC60RO41+P3OoBocVeVFv4X8kpV/bjSY64w/T+SJ4=;
 b=VJJeX/lmxRiD6meaOfzmDWWjFe4btVo0hAOppsL2fUQjx+0nFZORSUFKpEOdILMTh0o17GJ7
 H6fuH6wgKWhzfnoffxxA+VD9Zf79JohtWdhp1/bGoEje3ygwU/x6/QzArXgYsoDpg/yL+Ujm
 0EA6t/7aAqrP85I5mWCYduHH2w4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60a65e95d1aee7698dcb4b18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 13:05:25
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0BAEBC43146; Thu, 20 May 2021 13:05:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44FD9C43143;
        Thu, 20 May 2021 13:05:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 May 2021 18:35:23 +0530
From:   skakit@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom
 pmic gpio bindings to YAML
In-Reply-To: <20210518005531.GA3539579@robh.at.kernel.org>
References: <1620817988-18809-1-git-send-email-skakit@codeaurora.org>
 <1620817988-18809-4-git-send-email-skakit@codeaurora.org>
 <20210518005531.GA3539579@robh.at.kernel.org>
Message-ID: <68ccd08a4aa89582aa499f510ea4b1a6@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-05-18 06:25, Rob Herring wrote:
> On Wed, May 12, 2021 at 04:43:08PM +0530, satya priya wrote:
>> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> Changes in V3:
>>  - As per Rob's comments fixed bot erros.
>>  - Moved this patch to end of the series so that other patches are not
>>    blocked on this.
>> 
>> Changes in V4:
>>  - As per Rob's comments, added maxItems for reg and interrupts.
>>    Added reference of "pinmux-node.yaml" and "pincfg-node.yaml".
>>    Made 'additionalProperties' as false.
>> 
>>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 288 
>> ---------------------
>>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 245 
>> ++++++++++++++++++
>>  2 files changed, 245 insertions(+), 288 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 
> 
>> diff --git 
>> a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml 
>> b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> new file mode 100644
>> index 0000000..85381a0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> @@ -0,0 +1,245 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm PMIC GPIO block
>> +
>> +maintainers:
>> +  - Bjorn Andersson <bjorn.andersson@sonymobile.com>
>> +
>> +description: |
>> +  This binding describes the GPIO block(s) found in the 8xxx series 
>> of
>> +  PMIC's from Qualcomm.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,pm8005-gpio
>> +          - qcom,pm8018-gpio
>> +          - qcom,pm8038-gpio
>> +          - qcom,pm8058-gpio
>> +          - qcom,pm8916-gpio
>> +          - qcom,pm8917-gpio
>> +          - qcom,pm8921-gpio
>> +          - qcom,pm8941-gpio
>> +          - qcom,pm8950-gpio
>> +          - qcom,pm8994-gpio
>> +          - qcom,pm8998-gpio
>> +          - qcom,pma8084-gpio
>> +          - qcom,pmi8950-gpio
>> +          - qcom,pmi8994-gpio
>> +          - qcom,pmi8998-gpio
>> +          - qcom,pms405-gpio
>> +          - qcom,pm660-gpio
>> +          - qcom,pm660l-gpio
>> +          - qcom,pm8150-gpio
>> +          - qcom,pm8150b-gpio
>> +          - qcom,pm6150-gpio
>> +          - qcom,pm6150l-gpio
>> +          - qcom,pmx55-gpio
>> +          - qcom,pm7325-gpio
>> +          - qcom,pm8350c-gpio
>> +          - qcom,pmk8350-gpio
>> +          - qcom,pmr735a-gpio
>> +
>> +      - enum:
>> +          - qcom,spmi-gpio
>> +          - qcom,ssbi-gpio
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    maxItems: 44
> 
> Please say something about what the 1-44 interrupts are if you can't
> define each one.
> 

Okay, will add the description back.

>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +
>> +  interrupt-controller: true
>> +
>> +  gpio-controller: true
>> +
>> +  gpio-ranges:
>> +    maxItems: 1
>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +    description: |
>> +        The first cell will be used to define gpio number and the
>> +        second denotes the flags for this gpio
>> +
>> +  gpio-keys:
>> +    type: object
>> +    properties:
>> +      volume-keys:
>> +        type: object
>> +        anyOf:
>> +          - $ref: "pinmux-node.yaml"
>> +          - $ref: "pincfg-node.yaml"
>> +        properties:
>> +          pins:
>> +            description: |
>> +                List of gpio pins affected by the properties 
>> specified in
>> +                this subnode.  Valid pins are
>> +                     - gpio1-gpio4 for pm8005
>> +                     - gpio1-gpio6 for pm8018
>> +                     - gpio1-gpio12 for pm8038
>> +                     - gpio1-gpio40 for pm8058
>> +                     - gpio1-gpio4 for pm8916
>> +                     - gpio1-gpio38 for pm8917
>> +                     - gpio1-gpio44 for pm8921
>> +                     - gpio1-gpio36 for pm8941
>> +                     - gpio1-gpio8 for pm8950 (hole on gpio3)
>> +                     - gpio1-gpio22 for pm8994
>> +                     - gpio1-gpio26 for pm8998
>> +                     - gpio1-gpio22 for pma8084
>> +                     - gpio1-gpio2 for pmi8950
>> +                     - gpio1-gpio10 for pmi8994
>> +                     - gpio1-gpio12 for pms405 (holes on gpio1, gpio9
>> +                                                and gpio10)
>> +                     - gpio1-gpio10 for pm8150 (holes on gpio2, 
>> gpio5,
>> +                                                gpio7 and gpio8)
>> +                     - gpio1-gpio12 for pm8150b (holes on gpio3, 
>> gpio4
>> +                                                 and gpio7)
>> +                     - gpio1-gpio12 for pm8150l (hole on gpio7)
>> +                     - gpio1-gpio10 for pm6150
>> +                     - gpio1-gpio12 for pm6150l
>> +                     - gpio1-gpio10 for pm7325
>> +                     - gpio1-gpio9 for pm8350c
>> +                     - gpio1-gpio4 for pmk8350
>> +                     - gpio1-gpio4 for pmr735a
>> +
>> +            items:
>> +              pattern: "^gpio([0-9]+)$"
>> +
>> +          function:
>> +            description: |
>> +                Specify the alternative function to be configured for 
>> the
>> +                specified pins.
> 
> No need to redescribe a common property.
> 

okay, will remove.

>> +            items:
>> +              - enum:
>> +                  - normal
>> +                  - paired
>> +                  - func1
>> +                  - func2
>> +                  - dtest1
>> +                  - dtest2
>> +                  - dtest3
>> +                  - dtest4
>> +                  - func3  # supported by LV/MV GPIO subtypes
>> +                  - func4  # supported by LV/MV GPIO subtypes
>> +
>> +          bias-disable: true
>> +
>> +          bias-pull-down: true
>> +
>> +          bias-pull-up: true
>> +
>> +          qcom,pull-up-strength:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: |
>> +                Specifies the strength to use for pull up, if 
>> selected.
>> +                Valid values are defined in
>> +                <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>> +                If this property is omitted 30uA strength will be 
>> used
>> +                if pull up is selected
>> +
>> +          bias-high-impedance: true
>> +
>> +          input-enable: true
>> +
>> +          output-high: true
>> +
>> +          output-low: true
>> +
>> +          power-source: true
>> +
>> +          qcom,drive-strength:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: |
>> +                Selects the drive strength for the specified pins
>> +                Valid drive strength values are defined in
>> +                <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> 
> Please define the constraints here.
> 

Okay.

>> +
>> +          drive-push-pull: true
>> +
>> +          drive-open-drain: true
>> +
>> +          drive-open-source: true
>> +
>> +          qcom,analog-pass:
>> +            $ref: /schemas/types.yaml#/definitions/flag
>> +            description: |
>> +                The specified pins are configured in
>> +                analog-pass-through mode.
>> +
>> +          qcom,atest:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: |
>> +                Selects ATEST rail to route to GPIO when it's
>> +                configured in analog-pass-through mode.
>> +            enum: [1 2 3 4]
> 
> enum: [ 1, 2, 3, 4 ]
> 

Okay.

>> +
>> +          qcom,dtest-buffer:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: |
>> +                Selects DTEST rail to route to GPIO when it's
>> +                configured as digital input.
>> +            enum: [1 2 3 4]
> 
> Ditto.
> 
>> +
>> +        required:
>> +          - pins
>> +          - function
>> +
>> +        additionalProperties: false
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>> +
>> +    pm8921_gpio: gpio@150 {
>> +      compatible = "qcom,pm8921-gpio", "qcom,ssbi-gpio";
>> +      reg = <0x150 0x160>;
>> +      interrupts = <192 1>, <193 1>, <194 1>,
>> +                   <195 1>, <196 1>, <197 1>,
>> +                   <198 1>, <199 1>, <200 1>,
>> +                   <201 1>, <202 1>, <203 1>,
>> +                   <204 1>, <205 1>, <206 1>,
>> +                   <207 1>, <208 1>, <209 1>,
>> +                   <210 1>, <211 1>, <212 1>,
>> +                   <213 1>, <214 1>, <215 1>,
>> +                   <216 1>, <217 1>, <218 1>,
>> +                   <219 1>, <220 1>, <221 1>,
>> +                   <222 1>, <223 1>, <224 1>,
>> +                   <225 1>, <226 1>, <227 1>,
>> +                   <228 1>, <229 1>, <230 1>,
>> +                   <231 1>, <232 1>, <233 1>,
>> +                   <234 1>, <235 1>;
>> +
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +
>> +      pm8921_gpio_keys: gpio-keys {
>> +        volume-keys {
>> +          pins = "gpio20", "gpio21";
>> +          function = "normal";
>> +
>> +          input-enable;
>> +          bias-pull-up;
>> +          drive-push-pull;
>> +          qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
>> +          power-source = <PM8921_GPIO_S4>;
>> +        };
>> +      };
>> +    };
>> +...
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

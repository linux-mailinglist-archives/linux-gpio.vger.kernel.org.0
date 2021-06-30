Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCCF3B7CF7
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 07:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhF3FXr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 01:23:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37806 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhF3FXq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Jun 2021 01:23:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625030478; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QxoJEqto3m4LmokVHvjxd8H1x79dz+x5nzdLcHQijew=;
 b=i0BXQQth+9mtcabhpgYXY298aGydyLNBD9KaMpdT/uk8tmpfWRAOPkjx7VPRbOPzhTINSOfQ
 z3NwnkmlSZw7najqPVNw0unupF7N4VJHSpS7U6wrIQzt10v6OF5mx67u+uWji6iSKpXi6erh
 gC2oX0bRfA8hmTG+CmOBB5FUNFk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60dbff4e5e3e57240b3e4df5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 05:21:17
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14A09C433D3; Wed, 30 Jun 2021 05:21:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF171C43149;
        Wed, 30 Jun 2021 05:21:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 30 Jun 2021 10:51:14 +0530
From:   skakit@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V4] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom
 pmic gpio bindings to YAML
In-Reply-To: <YMLhzxMpbSRQac+P@builder.lan>
References: <1621578615-4613-1-git-send-email-skakit@codeaurora.org>
 <YMLhzxMpbSRQac+P@builder.lan>
Message-ID: <a4a4f7049e4c43b69124ebd5b8c2c4a1@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bjorn,

On 2021-06-11 09:38, Bjorn Andersson wrote:
> On Fri 21 May 01:30 CDT 2021, satya priya wrote:
> 
>> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
>> 
> 
> While the structure of the binding is a proper binding, the definition
> of the pinctrl states doesn't properly represent what we need to be 
> able
> to describe with this binding; see below.
> 
> [..]
>> diff --git 
>> a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml 
>> b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> new file mode 100644
>> index 0000000..d9024eb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> @@ -0,0 +1,256 @@
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
> 
> Please make that bjorn.andersson@linaro.org
> 

Okay, will change it in next post.

>> +
>> +description: |
> 
> I don't think you need this defined in literal style, so omit the '|'
> 

OK.

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
> 
> Please keep these sorted alphabetically.
> 

Okay.

>> +          - qcom,pm660l-gpio
>> +          - qcom,pm8150-gpio
>> +          - qcom,pm8150b-gpio
>> +          - qcom,pm8350-gpio
>> +          - qcom,pm8350b-gpio
>> +          - qcom,pm8350c-gpio
>> +          - qcom,pmk8350-gpio
>> +          - qcom,pm6150-gpio
>> +          - qcom,pm6150l-gpio
>> +          - qcom,pm7325-gpio
>> +          - qcom,pmr735a-gpio
>> +          - qcom,pmr735b-gpio
>> +          - qcom,pm8008-gpio
>> +          - qcom,pmx55-gpio
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
>> +    description: |
>> +        Must contain an array of encoded interrupt specifiers for
>> +        each available GPIO
> 
> We no longer specify "interrupts" but it seems we forgot to update the
> binding. So perhaps it's the right thing to keep it as part of the
> conversion and add a second patch that removes this.
> 

Okay.

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
> 
> This is the name of the pinctrl state defined in the example, as 
> defined
> here we will only ever be able to describe the volume keys.
> 
> You need to describe all valid states - and you need to support the two
> different nesting of the properties.
> 
> See qcom,tlmm-common.yaml and how we use that in the various bindings.
> 

Ok.

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
>> +                     - gpio1-gpio10 for pm8350
>> +                     - gpio1-gpio8 for pm8350b
>> +                     - gpio1-gpio9 for pm8350c
>> +                     - gpio1-gpio4 for pmk8350
>> +                     - gpio1-gpio10 for pm6150
>> +                     - gpio1-gpio12 for pm6150l
>> +                     - gpio1-gpio10 for pm7325
>> +                     - gpio1-gpio4 for pmr735a
>> +                     - gpio1-gpio4 for pmr735b
>> +                     - gpio1-gpio2 for pm8008
>> +                     - gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, 
>> gpio10
>> +                                                and gpio11)
>> +
>> +            items:
>> +              pattern: "^gpio([0-9]+)$"
>> +
>> +          function:
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
>> +            enum: [0, 1, 2, 3]
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
>> +            enum: [1, 2, 3, 4]
>> +
>> +          qcom,dtest-buffer:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: |
>> +                Selects DTEST rail to route to GPIO when it's
>> +                configured as digital input.
>> +            enum: [1, 2, 3, 4]
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
> 
> I think it makes sense to require gpio-controller, '#gpio-cells',
> gpio-ranges and interrupt-controller as well.
> 
Ok, will add them too.

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
> 
> As noted above, this list of interrupts should be omitted from the
> example - but better done separate from the conversion patch.
> 

Okay.

> Thanks,
> Bjorn
> 

Thanks,
Satya Priya

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C42374EAD
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 06:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhEFEuL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 00:50:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23355 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbhEFEuK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 00:50:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620276546; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EF0TOuRSJCjcaPMt36f2OYHB05yNMuY0ZEdArRASdEk=;
 b=ZKtMYV9csDXXaJ5jol7ZHeWarfM9NBhB3SSep8ExMCGwF8CFSxM+08L8PDy36N7ZHKMxgU70
 ipyV0fIMgzYKBDODxSjYGZwdKGi/2Co8BpJMg5WMonz5WQEO/cLwFVtGP989Wp1bWBj0fMp6
 WaEVfxUTEu56yxMT2Y3GIVLMhWA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6093752703cfff34522cd57d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 04:48:39
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18384C43460; Thu,  6 May 2021 04:48:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7AF3C433F1;
        Thu,  6 May 2021 04:48:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 May 2021 10:18:37 +0530
From:   skakit@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom
 pmic gpio bindings to YAML
In-Reply-To: <20210408205304.GA1929460@robh.at.kernel.org>
References: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
 <1617280546-9583-4-git-send-email-skakit@codeaurora.org>
 <20210408205304.GA1929460@robh.at.kernel.org>
Message-ID: <3697ddda1bba9179aa669e444b37f134@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 2021-04-09 02:23, Rob Herring wrote:
> On Thu, Apr 01, 2021 at 06:05:45PM +0530, satya priya wrote:
>> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> Changes in V3:
>>  - As per Rob's comments fixed bot erros.
>>  - Moved this patch to end of the series so that other patches are not
>>    blocked on this.
>> 
>>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 280 
>> --------------------
>>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 281 
>> +++++++++++++++++++++
>>  2 files changed, 281 insertions(+), 280 deletions(-)
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
>> index 0000000..e7e7027
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> @@ -0,0 +1,281 @@
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
> 
> Any combination of the 1st and 2nd entry is valid?
> 

No, for pmics which use spmi and ssbi buses, "qcom,spmi-gpio" and 
"qcom,ssbi-gpio" compatibles should be used respectively.

>> +
>> +  reg:
>> +    description: Register base of the GPIO block and length.
> 
> Just:
> 
> maxItems: 1
> 

ok.

>> +
>> +  interrupts:
>> +    description: |
>> +        Must contain an array of encoded interrupt specifiers for
>> +        each available GPIO
> 
> Need to define how many interrupts. I assume there's some max.
> 

ok will add maxItems.

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
> 
> Needs a $ref to pinmux-node.yaml and pincfg-node.yaml.
> 

can I add like below?

        volume-keys:
          type: object
+        anyOf:
+          - $ref: "pinmux-node.yaml"
+          - $ref: "pincfg-node.yaml"

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
>> +            $ref: /schemas/types.yaml#/definitions/string-array
> 
> Already has a type in pinmux-node.yaml.
> 

Okay, will add above and remove here.

>> +            items:
>> +              pattern: "^gpio([0-9]+)$"
>> +
>> +          function:
>> +            $ref: /schemas/types.yaml#/definitions/string
> 
> ditto
> 

Okay, will add above and remove here.

>> +            description: |
>> +                Specify the alternative function to be configured for 
>> the
>> +                specified pins.
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
>> +          bias-disable:
>> +            $ref: /schemas/types.yaml#/definitions/flag
> 
> And all these have a type and description. Just:
> 
> bias-disable: true
> 
> If no further constraints.
> 

Okay.

>> +            description:
>> +              The specified pins should be configured as no pull.
>> +
>> +          bias-pull-down:
>> +            $ref: /schemas/types.yaml#/definitions/flag
[...]
>> +        additionalProperties: true
>> +
>> +additionalProperties: true
> 
> Should be 'false'.
> 

Okay.

Thanks,
Satya Priya

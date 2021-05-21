Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E336D38BD85
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 06:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239182AbhEUEqX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 00:46:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36451 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239176AbhEUEqW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 00:46:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621572300; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FkKhmAj2KxsBfO2PULHX8nz2Ss+D1VFGsLcIocuKSRE=;
 b=hDtrQRBnMJb+92lOO+c2o7JUaECAOUFUZ00DR2euSNKWLD9eAjqyzZ0vcDQ1JTMUbT/+nbhm
 EwIdgpn9Znoj71zwySHxa5SAw7eOnL5gEPTI5mnXHfPv+1wFTjM7J9XeHfE/KOrcD64iKnoy
 /kwePc/VTcskWozDJu2R7SJloNg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60a73ab9b15734c8f9543f03 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 May 2021 04:44:41
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D4E6C4338A; Fri, 21 May 2021 04:44:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B8F4AC433F1;
        Fri, 21 May 2021 04:44:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 10:14:39 +0530
From:   skakit@codeaurora.org
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom
 pmic gpio bindings to YAML
In-Reply-To: <20210513174325.GA13631@codeaurora.org>
References: <1620817988-18809-1-git-send-email-skakit@codeaurora.org>
 <1620817988-18809-4-git-send-email-skakit@codeaurora.org>
 <20210513174325.GA13631@codeaurora.org>
Message-ID: <e1ca573bc60426e256bbae036ee688a1@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-05-13 23:13, Guru Das Srinagesh wrote:
> On Wed, May 12, 2021 at 04:43:08PM +0530, satya priya wrote:
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
> 
> pm8008 has been missed out in the yaml file during the conversion. 
> could
> you please add this as well?
> 

Will add it, thanks.

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
> 
> pm8008 has been missed out in the yaml file during the conversion. 
> could
> you please add this as well?
> 
>> +                     - gpio1-gpio6 for pm8018
>> +                     - gpio1-gpio12 for pm8038
>> +                     - gpio1-gpio40 for pm8058

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B988F37FCAF
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 19:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhEMRok (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 May 2021 13:44:40 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:2707 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231184AbhEMRoi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 May 2021 13:44:38 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 13 May 2021 10:43:27 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 13 May 2021 10:43:27 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 261FA20EE7; Thu, 13 May 2021 10:43:26 -0700 (PDT)
Date:   Thu, 13 May 2021 10:43:26 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Convert
 qcom pmic gpio bindings to YAML
Message-ID: <20210513174325.GA13631@codeaurora.org>
References: <1620817988-18809-1-git-send-email-skakit@codeaurora.org>
 <1620817988-18809-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620817988-18809-4-git-send-email-skakit@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 12, 2021 at 04:43:08PM +0530, satya priya wrote:
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> new file mode 100644
> index 0000000..85381a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -0,0 +1,245 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMIC GPIO block
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@sonymobile.com>
> +
> +description: |
> +  This binding describes the GPIO block(s) found in the 8xxx series of
> +  PMIC's from Qualcomm.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,pm8005-gpio

pm8008 has been missed out in the yaml file during the conversion. could
you please add this as well?

> +          - qcom,pm8018-gpio
> +          - qcom,pm8038-gpio
> +          - qcom,pm8058-gpio
> +          - qcom,pm8916-gpio
> +          - qcom,pm8917-gpio
> +          - qcom,pm8921-gpio
> +          - qcom,pm8941-gpio
> +          - qcom,pm8950-gpio
> +          - qcom,pm8994-gpio
> +          - qcom,pm8998-gpio
> +          - qcom,pma8084-gpio
> +          - qcom,pmi8950-gpio
> +          - qcom,pmi8994-gpio
> +          - qcom,pmi8998-gpio
> +          - qcom,pms405-gpio
> +          - qcom,pm660-gpio
> +          - qcom,pm660l-gpio
> +          - qcom,pm8150-gpio
> +          - qcom,pm8150b-gpio
> +          - qcom,pm6150-gpio
> +          - qcom,pm6150l-gpio
> +          - qcom,pmx55-gpio
> +          - qcom,pm7325-gpio
> +          - qcom,pm8350c-gpio
> +          - qcom,pmk8350-gpio
> +          - qcom,pmr735a-gpio
> +
> +      - enum:
> +          - qcom,spmi-gpio
> +          - qcom,ssbi-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 44
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  gpio-controller: true
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +    description: |
> +        The first cell will be used to define gpio number and the
> +        second denotes the flags for this gpio
> +
> +  gpio-keys:
> +    type: object
> +    properties:
> +      volume-keys:
> +        type: object
> +        anyOf:
> +          - $ref: "pinmux-node.yaml"
> +          - $ref: "pincfg-node.yaml"
> +        properties:
> +          pins:
> +            description: |
> +                List of gpio pins affected by the properties specified in
> +                this subnode.  Valid pins are
> +                     - gpio1-gpio4 for pm8005

pm8008 has been missed out in the yaml file during the conversion. could
you please add this as well?

> +                     - gpio1-gpio6 for pm8018
> +                     - gpio1-gpio12 for pm8038
> +                     - gpio1-gpio40 for pm8058

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C661221626
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 22:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgGOUYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 16:24:17 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44158 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgGOUYQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 16:24:16 -0400
Received: by mail-io1-f68.google.com with SMTP id i4so3631169iov.11;
        Wed, 15 Jul 2020 13:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YRcdiJ2FPTXeGzSkfMOBjoMowJyaYinCBAoTEPC8AHs=;
        b=OlYPTYGkwBOYxPM2PMZ9FfEP4L+KUD7DaGtaopJ/MqoF92sKz+HH1sM0S3MFeSqqW2
         c+SVw7s0qFWbamb6D7XS41t6g7GevwPo6jLvZGAFpvHyWhzvXkk7X2/5reljCZ3OOUuW
         AqHF88JdVWISS6OcxRes3UuRQvcpKQaq9x+eeDNx1GQM8cAd/UsLRVgZqR2pzhr3TDVw
         6HCwZOgbkwvOm4P/9cN2BR7KP21wBxg5i6hf8faRshHz6LxJKXgTXAksDPW1HLUUUhRE
         woVKa8i7n4IWPTkidLMP3xvsW7dcUEuYgbm6W194RkRHef4ttTmRPJBQewd5qQV/Bzw/
         6OdA==
X-Gm-Message-State: AOAM532JLSw4wFDiubg/wPnETpsGbMTHtq0Yg6r7m4FcHtUsyI95Jmai
        D3QnkOMeZf/ibbCNC7qDDQ==
X-Google-Smtp-Source: ABdhPJzKWnU/+FFE65Xzq4yXLoe1Fc03MGcI5KHKCUyztM16Oy06SY3YlA5bmZB3zcUbL63ysDl3Mw==
X-Received: by 2002:a02:b897:: with SMTP id p23mr1327031jam.32.1594844655421;
        Wed, 15 Jul 2020 13:24:15 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h1sm1688516iob.8.2020.07.15.13.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 13:24:14 -0700 (PDT)
Received: (nullmailer pid 758498 invoked by uid 1000);
        Wed, 15 Jul 2020 20:24:13 -0000
Date:   Wed, 15 Jul 2020 14:24:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add msm8226 pinctrl
 bindings
Message-ID: <20200715202413.GA755488@bogus>
References: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
 <20200627192833.217531-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627192833.217531-2-bartosz.dudziak@snejp.pl>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 27, 2020 at 09:28:30PM +0200, Bartosz Dudziak wrote:
> Add device tree binding Documentation details for Qualcomm msm8226
> pinctrl driver.
> 
> - Bindings documentation was based on qcom,sm8250-pinctrl.yaml by
>   Bjorn Andersson <bjorn.andersson@linaro.org> and then modified for
>   msm8226 content
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  .../pinctrl/qcom,msm8226-pinctrl.yaml         | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> new file mode 100644
> index 0000000000..8d8dc15718
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,msm8226-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. MSM8226 TLMM block
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  MSM8226 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8226-pinctrl
> +
> +  reg:
> +    description: Specifies the base address and size of the TLMM register space
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Specifies the TLMM summary IRQ
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description: Specifies the PIN numbers and Flags, as defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: Specifying the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '^.*$':
> +    if:
> +      type: object

For new bindings, do '-pins$' for the node name pattern so we don't have 
to do this hack.

> +    then:
> +      properties:
> +        pins:
> +          description:
> +            List of gpio pins affected by the properties specified in this
> +            subnode.
> +          items:
> +            oneOf:
> +              - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
> +              - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
> +          minItems: 1
> +          maxItems: 36
> +
> +        function:
> +          description:
> +            Specify the alternative function to be configured for the specified
> +            pins. Functions are only valid for gpio pins.
> +
> +          enum: [ gpio, cci_i2c0, blsp_uim1, blsp_uim2, blsp_uim3, blsp_uim5,
> +            blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c5, blsp_spi1,
> +            blsp_spi2, blsp_spi3, blsp_spi5, blsp_uart1, blsp_uart2,
> +            blsp_uart3, blsp_uart5, cam_mclk0, cam_mclk1, wlan ]
> +
> +        drive-strength:
> +          enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +          default: 2
> +          description:
> +            Selects the drive strength for the specified pins, in mA.
> +
> +        bias-pull-down: true
> +
> +        bias-pull-up: true
> +
> +        bias-disable: true
> +
> +        output-high: true
> +
> +        output-low: true
> +
> +      required:
> +        - pins
> +        - function
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        msmgpio: pinctrl@fd510000 {
> +                compatible = "qcom,msm8226-pinctrl";
> +                reg = <0xfd510000 0x4000>;
> +
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-ranges = <&msmgpio 0 0 117>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> -- 
> 2.25.1
> 

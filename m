Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 411FC107BE5
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2019 01:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfKWAJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 19:09:37 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39038 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKWAJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 19:09:37 -0500
Received: by mail-ot1-f67.google.com with SMTP id w24so7750136otk.6;
        Fri, 22 Nov 2019 16:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CGWjpDGzyUOYwEt0Dc6PSe57AXzajvuc/FnHMXylxJ4=;
        b=iYL3OuV6RNdan0KdjoKZSPPKZWvUov3Ay4JD6uuGC23sW9uj2X4sKFMYP1er1QBRnB
         JNYN/UlkcY38W5qOCVUq8XyPcyTu4tuzr0YoUWaOiGVcdcYvyZ56ycYJlrymdehyDB6h
         EIBHynoECsgzgQ1aF3LMIutI+smktqPBeCBTzs6aQ5Mi2DGxlNYAhOOKz6+XqXwWPt8a
         hxDIf16ZMQi16NcNWyw0eFYi5IAkw0o2RqQWJGcmRY+IBXdTogixcom0VxhRYL9gHTUu
         Y2/tjr2ZswjPJwwjm+cuoHl8nAt9tHXoqlMSctFnEL1nYztmMsSXL8Cdd7mLa0s4of0f
         q4Kw==
X-Gm-Message-State: APjAAAUUz9GaWgXq0qxE47TPSp3GW6SfFxzXL9rUGHz5gR48LzK9BDiJ
        fXKe+cMobyCsl4yPm3DRIA==
X-Google-Smtp-Source: APXvYqwG0ZCNJRh0x4/KDrbttT0DNuGmTMw67FdWOi3jmALsWc6tyN7zUAKOMHcy6+7bvS+PY3CObg==
X-Received: by 2002:a05:6830:1b65:: with SMTP id d5mr12220774ote.122.1574467775783;
        Fri, 22 Nov 2019 16:09:35 -0800 (PST)
Received: from localhost ([2607:fb90:bd7:3743:c9ec:246b:67b7:9768])
        by smtp.gmail.com with ESMTPSA id l18sm2725815oti.11.2019.11.22.16.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:09:35 -0800 (PST)
Date:   Fri, 22 Nov 2019 18:09:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 02/12] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
Message-ID: <20191123000933.GA30441@bogus>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
 <20191121170509.10579-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121170509.10579-3-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 05:04:59PM +0000, Srinivas Kandagatla wrote:
> This patch adds bindings for wcd9340/wcd9341 audio codec which can
> support both SLIMbus and I2S/I2C interface.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd934x.yaml          | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> new file mode 100644
> index 000000000000..197a53bfa6cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wcd934x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Qualcomm WCD9340/WCD9341 Audio Codec
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
> +  It has in-built Soundwire controller, pin controller, interrupt mux and
> +  supports both I2S/I2C and SLIMbus audio interfaces.
> +
> +properties:
> +  compatible:
> +    const: slim217,250
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO spec for reset line to use
> +    maxItems: 1
> +
> +  slim-ifc-dev: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: extclk
> +
> +  vdd-buck-supply:
> +    description: A reference to the 1.8V buck supply
> +
> +  vdd-buck-sido-supply:
> +    description: A reference to the 1.8V SIDO buck supply
> +
> +  vdd-rx-supply:
> +    description: A reference to the 1.8V rx supply
> +
> +  vdd-tx-supply:
> +    description: A reference to the 1.8V tx supply
> +
> +  vdd-vbat-supply:
> +    description: A reference to the vbat supply
> +
> +  vdd-io-supply:
> +    description: A reference to the 1.8V I/O supply
> +
> +  vdd-micbias-supply:
> +    description: A reference to the micbias supply
> +
> +  qcom,micbias1-microvolt:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'

Don't need a type here, standard units already have a type.

> +    description: micbias1 voltage between 1800000 - 2850000 microvolt

Sounds like constraints:

minimum: 1800000
maximum: 2850000


> +
> +  qcom,micbias2-microvolt:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: micbias2 voltage between 1800000 - 2850000 microvolt
> +
> +  qcom,micbias3-microvolt:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: micbias3 voltage between 1800000 - 2850000 microvolt
> +
> +  qcom,micbias4-microvolt:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: micbias4 voltage between 1800000 - 2850000 microvolt
> +
> +  clock-output-names:
> +    const: mclk
> +
> +  clock-frequency:
> +    description: Clock frequency of output clk in Hz
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      WCD934x subnode for each slave devices. Bindings of each subnodes
> +      depends on the specific driver providing the functionality and
> +      documented in their respective bindings.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - slim-ifc-dev
> +  - interrupts
> +  - interrupt-controller
> +  - clock-frequency
> +  - clock-output-names
> +  - qcom,micbias1-microvolt
> +  - qcom,micbias2-microvolt
> +  - qcom,micbias3-microvolt
> +  - qcom,micbias4-microvolt
> +  - "#interrupt-cells"
> +  - "#clock-cells"
> +  - "#sound-dai-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    codec@1,0{
> +        compatible = "slim217,250";
> +        reg  = <1 0>;
> +        reset-gpios = <&tlmm 64 0>;
> +        slim-ifc-dev  = <&wcd9340_ifd>;
> +        #sound-dai-cells = <1>;
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <54 4>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        #clock-cells = <0>;
> +        clock-frequency = <9600000>;
> +        clock-output-names = "mclk";
> +        qcom,micbias1-microvolt = <1800000>;
> +        qcom,micbias2-microvolt = <1800000>;
> +        qcom,micbias3-microvolt = <1800000>;
> +        qcom,micbias4-microvolt = <1800000>;
> +        clock-names = "extclk";
> +        clocks = <&rpmhcc 2>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        gpioctrl@42 {
> +            reg = <0x42 0x2>;
> +        };
> +    };
> +
> +...
> -- 
> 2.21.0
> 

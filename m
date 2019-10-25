Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 914FAE5553
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 22:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbfJYUnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 16:43:41 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36093 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfJYUnk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 16:43:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id c7so2965183otm.3;
        Fri, 25 Oct 2019 13:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mY7W9Qwoy2hYsmzd/xysMomRgnBoZZlGLUvtU9rwd9Y=;
        b=XEUUEBkvFzqf1YBNMq3MwFmqad2yZIMj7V6eHvCAtgO0HoGWwHxJQvnD+tFhfgq83c
         4fB1yiRBs0pX8V6jvKYNJFrY64aEwNL2kdzV6Ou/R9WLFv96xr/Bx63OqtKYjNDghoXX
         LK5cxtZMlBqLcFrjEfvPPt/MIbHnOv6x2yOrj2Sn1KOmy/tkdjdNXjZoNOXk7VFMo9U3
         QCNntRLKL98EGT4AeFB6NjfafWvn6KZnAVIXevb/3UUMgJE3+kSsa6ZX4DeNivrE5Kh5
         Y7zYdRzOW6j8jxuP52DuDT0USGOxThXkH/fw5TlguPlld6kYR39wjo8kXgarKLH+h9D0
         NRLQ==
X-Gm-Message-State: APjAAAUmKa2pK8pYM779goNTWeRTc+7K3vnnWfecjvASBT92vKC+dd+2
        dyY4qIFPkPIOeWX4dGvjhg==
X-Google-Smtp-Source: APXvYqwi5q9kWQoXbZEj5r4KamsevqICE/6M+McbMMUn5YYDFa3NKCPG3yUwt8kDDdHYKaPW7z/tuA==
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr4410792oth.274.1572036219985;
        Fri, 25 Oct 2019 13:43:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s6sm1056766otr.5.2019.10.25.13.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 13:43:39 -0700 (PDT)
Date:   Fri, 25 Oct 2019 15:43:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     broonie@kernel.org, linus.walleij@linaro.org, lee.jones@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
Message-ID: <20191025204338.GA25892@bogus>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 18, 2019 at 01:18:39AM +0100, Srinivas Kandagatla wrote:
> This patch adds bindings for wcd9340/wcd9341 audio codec which can
> support both SLIMbus and I2S/I2C interface.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd934x.yaml          | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> new file mode 100644
> index 000000000000..299d6b96c339
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> @@ -0,0 +1,169 @@
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
> +  slim-ifc-dev:
> +    description: SLIMBus Interface device phandle

phandle or...

> +    maxItems: 1

array?

Needs a type if a phandle.

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
> +  qcom,micbias1-millivolt:

The standard unit is '-microvolt' 

> +    description: Voltage betwee 1800mv-2850mv for micbias1 output

typo...

Sounds like constraints.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

With standard units, you can drop the type.

> +
> +  qcom,micbias2-millivolt:
> +    description: Voltage betwee 1800mv-2850mv for micbias2 output
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,micbias3-millivolt:
> +    description: Voltage betwee 1800mv-2850mv for micbias3 output
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,micbias4-millivolt:
> +    description: Voltage betwee 1800mv-2850mv for micbias4 output
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
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
> +      documented in there respective bindings.

s/there/their/

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
> +  - qcom,micbias1-millivolt
> +  - qcom,micbias2-millivolt
> +  - qcom,micbias3-millivolt
> +  - qcom,micbias4-millivolt
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
> +        qcom,micbias1-millivolt = <1800>;
> +        qcom,micbias2-millivolt = <1800>;
> +        qcom,micbias3-millivolt = <1800>;
> +        qcom,micbias4-millivolt = <1800>;
> +        clock-names = "extclk";
> +        clocks = <&rpmhcc 2>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        wcdpinctrl@42 {
> +            reg = <0x42 0x2>;
> +        };
> +    };
> +
> +...
> -- 
> 2.21.0
> 

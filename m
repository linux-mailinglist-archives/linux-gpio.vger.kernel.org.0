Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C9E4129FC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 02:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232982AbhIUAhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 20:37:14 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:33507 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbhIUAfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 20:35:14 -0400
Received: by mail-ot1-f44.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso26081297otu.0;
        Mon, 20 Sep 2021 17:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VIa4zdp3kh2TcYzsvkaVK/0mnbZVdr+MD6ZR4rOXDGU=;
        b=J14FyAx5K3itruOSuXEdOFG9zoadcZXgH7NnTrtjwycEQsG1M6BC/on+z9y6/QB1I0
         9eEnBefkFdtc4eGXsIhyuofYa7pdNZncTNR6e9R/Paymmc+l3DzSWwm7fh1LGpfkyGgF
         UtIiPIr7BWqe6sPUn57tkh9GZMA3uYJsltJsdLL1dGMYAXbqwl3J64pRbZZEhfTRlwDB
         bpGXgtNL/DJSz0Xs0v+WrNL8lJTPF065bLR+aO6xryQ6eVVTPSfRLctmL/XKWtbCD1+4
         HqJxxyKY+JFRwB3CoetdcEPIugJ3UVx1B3hghdCyzj0yOw8Io4jVEN43HXUbsihIkagx
         roKA==
X-Gm-Message-State: AOAM530qZoA0gjs+lTY+w9s+/bzZ1vxbCIlzfOeL2OIPLX6ndhMYJQ9V
        Z3D4rG+xyxvJDWpxEtpZ1w==
X-Google-Smtp-Source: ABdhPJwDdWkoSRHqQ7lpkmLFCB50sfEprcHRmxYJjWVSK9KvLHqBEe2JV4sLzjMzXUY2p437Flyv0w==
X-Received: by 2002:a9d:4042:: with SMTP id o2mr21775787oti.332.1632184426218;
        Mon, 20 Sep 2021 17:33:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d23sm3110339ook.47.2021.09.20.17.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 17:33:45 -0700 (PDT)
Received: (nullmailer pid 1135344 invoked by uid 1000);
        Tue, 21 Sep 2021 00:33:44 -0000
Date:   Mon, 20 Sep 2021 19:33:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: pinctrl: convert rockchip,pinctrl.txt to
 YAML
Message-ID: <YUkoaGU60xXKQmyf@robh.at.kernel.org>
References: <20210908151246.8781-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908151246.8781-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 08, 2021 at 05:12:46PM +0200, Johan Jonker wrote:
> Convert rockchip,pinctrl.txt to YAML
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Note for rob+dt:
> 
> To reduce notifications and to support legacy DT the patternProperties
> regex is:
> "gpio[0-8]?@[0-9a-f]+$"
> 
> or should we move to:
> "gpio@[0-9a-f]+$"
> and change all Rockchip pinctrl DT nodes?

Better to have the warnings as a todo to fix than appear to endorse 
'gpio[0-8]' IMO.

> Is the Linux driver / U-boot ready for it now?

I don't think the drivers should care. If they do, then we're stuck with 
the current names.

> ---
>  .../bindings/pinctrl/rockchip,pinctrl.txt     | 114 -----------
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    | 178 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 114 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> deleted file mode 100644
> index 84c411129..000000000
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -* Rockchip Pinmux Controller
> -
> -The Rockchip Pinmux Controller, enables the IC
> -to share one PAD to several functional blocks. The sharing is done by
> -multiplexing the PAD input/output signals. For each PAD there are several
> -muxing options with option 0 being the use as a GPIO.
> -
> -Please refer to pinctrl-bindings.txt in this directory for details of the
> -common pinctrl bindings used by client devices, including the meaning of the
> -phrase "pin configuration node".
> -
> -The Rockchip pin configuration node is a node of a group of pins which can be
> -used for a specific device or function. This node represents both mux and
> -config of the pins in that group. The 'pins' selects the function mode(also
> -named pin mode) this pin can work on and the 'config' configures various pad
> -settings such as pull-up, etc.
> -
> -The pins are grouped into up to 5 individual pin banks which need to be
> -defined as gpio sub-nodes of the pinmux controller.
> -
> -Required properties for iomux controller:
> -  - compatible: should be
> -		"rockchip,px30-pinctrl":    for Rockchip PX30
> -		"rockchip,rv1108-pinctrl":  for Rockchip RV1108
> -		"rockchip,rk2928-pinctrl":  for Rockchip RK2928
> -		"rockchip,rk3066a-pinctrl": for Rockchip RK3066a
> -		"rockchip,rk3066b-pinctrl": for Rockchip RK3066b
> -		"rockchip,rk3128-pinctrl":  for Rockchip RK3128
> -		"rockchip,rk3188-pinctrl":  for Rockchip RK3188
> -		"rockchip,rk3228-pinctrl":  for Rockchip RK3228
> -		"rockchip,rk3288-pinctrl":  for Rockchip RK3288
> -		"rockchip,rk3308-pinctrl":  for Rockchip RK3308
> -		"rockchip,rk3328-pinctrl":  for Rockchip RK3328
> -		"rockchip,rk3368-pinctrl":  for Rockchip RK3368
> -		"rockchip,rk3399-pinctrl":  for Rockchip RK3399
> -		"rockchip,rk3568-pinctrl":  for Rockchip RK3568
> -
> -  - rockchip,grf: phandle referencing a syscon providing the
> -	 "general register files"
> -
> -Optional properties for iomux controller:
> -  - rockchip,pmu: phandle referencing a syscon providing the pmu registers
> -	 as some SoCs carry parts of the iomux controller registers there.
> -	 Required for at least rk3188 and rk3288. On the rk3368 this should
> -	 point to the PMUGRF syscon.
> -
> -Deprecated properties for iomux controller:
> -  - reg: first element is the general register space of the iomux controller
> -	 It should be large enough to contain also separate pull registers.
> -	 second element is the separate pull register space of the rk3188.
> -	 Use rockchip,grf and rockchip,pmu described above instead.
> -
> -Required properties for gpio sub nodes:
> -See rockchip,gpio-bank.yaml
> -
> -Required properties for pin configuration node:
> -  - rockchip,pins: 3 integers array, represents a group of pins mux and config
> -    setting. The format is rockchip,pins = <PIN_BANK PIN_BANK_IDX MUX &phandle>.
> -    The MUX 0 means gpio and MUX 1 to N mean the specific device function.
> -    The phandle of a node containing the generic pinconfig options
> -    to use, as described in pinctrl-bindings.txt in this directory.
> -
> -Examples:
> -
> -#include <dt-bindings/pinctrl/rockchip.h>
> -
> -...
> -
> -pinctrl@20008000 {
> -	compatible = "rockchip,rk3066a-pinctrl";
> -	rockchip,grf = <&grf>;
> -
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges;
> -
> -	gpio0: gpio0@20034000 {
> -		compatible = "rockchip,gpio-bank";
> -		reg = <0x20034000 0x100>;
> -		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&clk_gates8 9>;
> -
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -	};
> -
> -	...
> -
> -	pcfg_pull_default: pcfg_pull_default {
> -		bias-pull-pin-default
> -	};
> -
> -	uart2 {
> -		uart2_xfer: uart2-xfer {
> -			rockchip,pins = <1 RK_PB0 1 &pcfg_pull_default>,
> -					<1 RK_PB1 1 &pcfg_pull_default>;
> -		};
> -	};
> -};
> -
> -uart2: serial@20064000 {
> -	compatible = "snps,dw-apb-uart";
> -	reg = <0x20064000 0x400>;
> -	interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> -	reg-shift = <2>;
> -	reg-io-width = <1>;
> -	clocks = <&mux_uart2>;
> -
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&uart2_xfer>;
> -};
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> new file mode 100644
> index 000000000..7c45122d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -0,0 +1,178 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Pinmux Controller
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:

Needs a '|' to maintain the paragraphs.

> +  The Rockchip Pinmux Controller enables the IC to share one PAD
> +  to several functional blocks. The sharing is done by multiplexing
> +  the PAD input/output signals. For each PAD there are several muxing
> +  options with option 0 being the use as a GPIO.
> +
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".
> +
> +  The Rockchip pin configuration node is a node of a group of pins which can be
> +  used for a specific device or function. This node represents both mux and
> +  config of the pins in that group. The 'pins' selects the function mode(also
> +  named pin mode) this pin can work on and the 'config' configures various pad
> +  settings such as pull-up, etc.
> +
> +  The pins are grouped into up to 9 individual pin banks which need to be
> +  defined as gpio sub-nodes of the pinmux controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,px30-pinctrl
> +      - rockchip,rk2928-pinctrl
> +      - rockchip,rk3066a-pinctrl
> +      - rockchip,rk3066b-pinctrl
> +      - rockchip,rk3128-pinctrl
> +      - rockchip,rk3188-pinctrl
> +      - rockchip,rk3228-pinctrl
> +      - rockchip,rk3288-pinctrl
> +      - rockchip,rk3308-pinctrl
> +      - rockchip,rk3328-pinctrl
> +      - rockchip,rk3368-pinctrl
> +      - rockchip,rk3399-pinctrl
> +      - rockchip,rk3568-pinctrl
> +      - rockchip,rv1108-pinctrl
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the GRF registers.
> +
> +  rockchip,pmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the PMU registers,
> +      as some SoCs carry parts of the iomux controller registers there.
> +      Required for at least rk3188 and rk3288. On the rk3368 this should
> +      point to the PMUGRF syscon.
> +
> +  "#address-cells":
> +    enum: [1, 2]
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +  ranges: true
> +
> +patternProperties:
> +  "gpio[0-8]?@[0-9a-f]+$":
> +    type: object
> +
> +    $ref: "/schemas/gpio/rockchip,gpio-bank.yaml#"
> +
> +    unevaluatedProperties: false
> +
> +  "pcfg-[a-z0-9-]+$":
> +    type: object
> +    properties:
> +      bias-disable: true
> +
> +      bias-pull-down: true
> +
> +      bias-pull-pin-default: true
> +
> +      bias-pull-up: true
> +
> +      drive-strength:
> +        minimum: 0
> +        maximum: 20
> +
> +      input-enable: true
> +
> +      input-schmitt-enable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +    additionalProperties: false
> +
> +additionalProperties:
> +  type: object
> +  additionalProperties:
> +    type: object
> +    properties:
> +      rockchip,pins:
> +        type: array

That shouldn't be allowed... It should be a type $ref.

> +        minItems: 1
> +        items:
> +          items:
> +            - minimum: 0
> +              maximum: 8
> +            - minimum: 0
> +              maximum: 31
> +            - minimum: 0
> +              maximum: 6
> +            - maximum: 0xffffffff

I'd add a description on each entry.

> +        description:
> +          A 3 integers array represents a group of pins mux and

Looks like 4 integers to me. '3 integers and a phandle array'

> +          config setting. The format is
> +
> +          rockchip,pins = <PIN_BANK PIN_BANK_IDX MUX &phandle>
> +
> +          The MUX 0 means gpio and MUX 1 to N mean the specific
> +          device function. The phandle of a node contains the
> +          generic pinconfig options to use, as described in
> +          pinctrl-bindings.txt in this directory.
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/rockchip.h>
> +
> +    pinctrl: pinctrl {
> +      compatible = "rockchip,rk3066a-pinctrl";
> +      rockchip,grf = <&grf>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      gpio0: gpio@20034000 {
> +        compatible = "rockchip,gpio-bank";
> +        reg = <0x20034000 0x100>;
> +        interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk_gates8 9>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +      };
> +
> +      pcfg_pull_default: pcfg-pull-default {
> +        bias-pull-pin-default;
> +      };
> +
> +      uart2 {
> +        uart2_xfer: uart2-xfer {
> +          rockchip,pins = <1 RK_PB0 1 &pcfg_pull_default>,
> +                          <1 RK_PB1 1 &pcfg_pull_default>;
> +        };
> +      };
> +    };
> +
> +    uart2: serial@20064000 {
> +      compatible = "snps,dw-apb-uart";
> +      reg = <0x20064000 0x400>;
> +      interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&mux_uart2>;
> +      pinctrl-0 = <&uart2_xfer>;
> +      pinctrl-names = "default";
> +      reg-io-width = <1>;
> +      reg-shift = <2>;
> +    };
> -- 
> 2.20.1
> 
> 

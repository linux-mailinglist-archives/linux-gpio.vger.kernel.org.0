Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7280DC239C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2019 16:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731459AbfI3Ouo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 10:50:44 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41088 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfI3Ouo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 10:50:44 -0400
Received: by mail-oi1-f193.google.com with SMTP id w17so11339188oiw.8;
        Mon, 30 Sep 2019 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nR5Jwg73RW1Z4kze1rphymQfRWGvcGxE51i7zcwab9k=;
        b=eefR3f92iB5pXXIOnqUopWFjwIbzUBDGaZTDxOxDEOJkZz8kao1h7e5diFjU5kTRPj
         D1sSx+kQ8oAiJXeb8VZmklflO3tb68ptNTcNbZfvjLJ6jGJEVR6hDmCEntO/2gF/Jbkf
         02NLiJsw3JhBuBs4KPwXaQziwoZsZLyY1L9zQeDoXYlWfFQQtZ5it9MeQeQe8irVdpFS
         HyLqoGr/tVBLrY4g68scGKRaRwAZEyikpQJEwy+DDZcOejaFWJAcTdHvgqeDpk/ePypj
         dsWtAcR/QWKgshAf7MK/6ScuFd5iRDxngKx8G+6cE8CuuvMSNz3RUJKAX5PYQh1aTF8u
         LBhA==
X-Gm-Message-State: APjAAAWzmFpm8N/AZeQbs6Ua8o3Q5XNcAUkosqWRCxVbPce6KEnVdQkS
        qu14dcCBZe515g3ONCpR2w==
X-Google-Smtp-Source: APXvYqz8/qjSeRO3rEliVHDjsp5N6t03KTRdTo9Jh0fwwBXF5ZO110mfe4yI51XoLBLQS1liaQb6cQ==
X-Received: by 2002:aca:d408:: with SMTP id l8mr18365364oig.113.1569855043203;
        Mon, 30 Sep 2019 07:50:43 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k204sm4383299oif.33.2019.09.30.07.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 07:50:42 -0700 (PDT)
Date:   Mon, 30 Sep 2019 09:50:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Subject: Re: [PATCH v1 2/2] dt-bindings: pinctrl: intel: Add for new SoC
Message-ID: <20190930145042.GA29258@bogus>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <c53173f380d47e9a5feaef9a35de535c6de9f6cb.1568274587.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c53173f380d47e9a5feaef9a35de535c6de9f6cb.1568274587.git.rahul.tanwar@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 12, 2019 at 03:59:11PM +0800, Rahul Tanwar wrote:
> Add dt bindings document & include file for pinmux & GPIO controller driver of
> Intel Lightning Mountain SoC.
> 
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
> ---
>  .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 131 +++++++++++++++++++++
>  include/dt-bindings/pinctrl/intel,equilibrium.h    |  23 ++++
>  2 files changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/intel,equilibrium.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
> new file mode 100644
> index 000000000000..1aee42f0057e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/pinctrl/intel,lgm-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel Lightning Mountain SoC pinmux & GPIO controller binding
> +
> +maintainers:
> +  - Rahul Tanwar <rahul.tanwar@linux.intel.com>
> +
> +description: |
> +  Pinmux & GPIO controller controls pin multiplexing & configuration including
> +  GPIO function selection & GPIO attributes configuration.
> +
> +  Please refer to [1] for details of the common pinctrl bindings used by the
> +  client devices.
> +
> +  [1] Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +
> +properties:
> +  compatible:
> +    const: intel,lgm-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +# Client device subnode's properties
> +patternProperties:
> +  "^.*@[0-9a-fA-F]+$":
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below defined properties.
> +
> +    properties:
> +      intel,function:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description:
> +          A string containing the name of the function to mux to the group.
> +
> +      intel,groups:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description:
> +          An array of strings identifying the list of groups.
> +
> +      intel,pins:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          List of pins to select with this function.
> +
> +      intel,mux:
> +        description: The applicable mux group.
> +        allOf:
> +          - $ref: "/schemas/types.yaml#/definitions/uint32"
> +          - enum:
> +              # Refer include/dt-bindings/pinctrl/intel,equilibrium.h
> +              - PINMUX_0 # 0 PINMUX_GPIO
> +              - PINMUX_1 # 1
> +              - PINMUX_2 # 2
> +              - PINMUX_3 # 3
> +              - PINMUX_4 # 4
> +
> +      intel,pullup:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Specifies pull-up configuration.
> +
> +      intel,pulldown:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Specifies pull-down configuration.
> +
> +      intel,drive-current:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Enables driver-current.
> +
> +      intel,slew-rate:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Enables slew-rate.
> +
> +      intel,open-drain:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Specifies open-drain configuration.
> +
> +      intel,output:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Specifies if the pin is to be configured as output.

We have a whole slew of standard properties for pinctrl and you aren't 
using any of them.

Rob

> +
> +
> +    required:
> +      - intel,function
> +      - intel,groups
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    pinctrl: pinctrl@e2880000 {
> +          compatible = "intel,lgm-pinctrl";
> +          reg = <0xe2880000 0x100000>;
> +    };
> +
> +  # Client device node
> +  - |

These are not really separate examples.

> +    asc0: serial@e0a00000 {
> +          compatible = "intel,lgm-asc";
> +          reg = <0xe0a00000 0x1000>;
> +          interrupt-parent = <&ioapic1>;
> +          interrupts = <128 1>;
> +          interrupt-names = "asc_irq";
> +          clocks = <&cgu0 31>, <&cgu0 98>;
> +          clock-names = "freq", "asc";
> +          pinctrl-names = "default";
> +          pinctrl-0 = <&uart0>;
> +    };
> +
> +   # Client device subnode
> +  - |
> +    uart0:uart0 {

This should be a child of pinctrl node.

> +          intel,pins = <64>, /* UART_RX0 */
> +                       <65>; /* UART_TX0 */
> +          intel,function = "CONSOLE_UART0";
> +          intel,mux = <1>,
> +                      <1>;
> +          intel,groups = "CONSOLE_UART0";
> +    };
> +
> +
> +...
> diff --git a/include/dt-bindings/pinctrl/intel,equilibrium.h b/include/dt-bindings/pinctrl/intel,equilibrium.h
> new file mode 100644
> index 000000000000..c37bfbea8ff1
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/intel,equilibrium.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_INTEL_EQUILIBRIUM_H_
> +#define __DT_BINDINGS_PINCTRL_INTEL_EQUILIBRIUM_H_
> +
> +#define PINCTRL_DRCC_2_MA	0
> +#define PINCTRL_DRCC_4_MA	1
> +#define PINCTRL_DRCC_8_MA	2
> +#define PINCTRL_DRCC_12_MA	3

Use the property that defines drive strength in terms of microamps and 
convert to register values in the driver.

> +
> +#define PINMUX_0		0
> +#define PINMUX_1		1
> +#define PINMUX_2		2
> +#define PINMUX_3		3
> +#define PINMUX_4		4

Not useful defines. Just use the numbers directly.

> +#define PINMUX_GPIO		PINMUX_0
> +
> +#define PINCTRL_GROUP		"intel,groups"
> +#define PINCTRL_FUNCTION	"intel,function"
> +#define PINCTRL_PINS		"intel,pins"
> +#define PINCTRL_MUX		"intel,mux"

We don't create defines for property names (really for any strings).

> +
> +#endif /* __DT_BINDINGS_PINCTRL_INTEL_EQUILIBRIUM_H_ */
> -- 
> 2.11.0
> 

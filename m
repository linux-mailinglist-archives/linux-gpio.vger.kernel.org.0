Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B930AF0857
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 22:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbfKEV3o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 16:29:44 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36984 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730083AbfKEV3n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 16:29:43 -0500
Received: by mail-oi1-f194.google.com with SMTP id y194so19005137oie.4;
        Tue, 05 Nov 2019 13:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3t8BCo0cxBsYxWOAFHgtpAu9n4Yvje806QUE4jm3ZCA=;
        b=XnrscLxKIwU1u+6xd3I/uPM4qbYEM3A9EygfTWr8MEt2UnFC+T+RuZdV1CrdiTW6k+
         Ids+6B9E6l0sNaLmtXaP5vc9bmN2NFKR4IFHHveSlG0bVOvWb3WzdeW5zaCLLm9+r6kI
         9QorS7SHQXXhpXzG9nalDFwZ5rDEWlpNxnCO1+wFJeQn4R5pvA8YqiR+joda8/5RymqN
         YclNXyXQ07K6CbljCwdo/yic8BE4ixEXon2Z2n4Kt7mLTUMbBVPm0F2+6MRTisW0QnMf
         B8OXQvTRhoKmR88giaqTsENpB9aMm8ST2LIMD+TpYD62XK7Vb99DBjf7ThJMl320Qbwl
         92yQ==
X-Gm-Message-State: APjAAAXqtt6gowfgvZhIExbc1sL9RUehR5r7xSHqLAhPj+yMUDzGv7ZC
        ETpkinxj9P11DDHvAWdf5TPaBgo=
X-Google-Smtp-Source: APXvYqyH4xQFaKS6sEMXo8lV/DMAL+xOS/Oi/hTdVSFb20yYWbGQGJRv7YRrR+CMpG3q83BYaa/QYg==
X-Received: by 2002:aca:4dcc:: with SMTP id a195mr1007256oib.172.1572989382261;
        Tue, 05 Nov 2019 13:29:42 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g1sm5088396otr.5.2019.11.05.13.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 13:29:41 -0800 (PST)
Date:   Tue, 5 Nov 2019 15:29:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Subject: Re: [PATCH v3 2/2] dt-bindings: pinctrl: intel: Add for new SoC
Message-ID: <20191105212941.GA8677@bogus>
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
 <f91001d8c5f0cb2860fda720d0cb6298a4856dd3.1572926608.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f91001d8c5f0cb2860fda720d0cb6298a4856dd3.1572926608.git.rahul.tanwar@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 02:49:43PM +0800, Rahul Tanwar wrote:
> Add dt bindings document for pinmux & GPIO controller driver of
> Intel Lightning Mountain SoC.
> 
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
> ---
>  .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
> new file mode 100644
> index 000000000000..961ac877a962
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
> @@ -0,0 +1,114 @@
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

A unit address is wrong here. Please define some pattern we can match 
on. '-pins$' perhaps.

> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      function:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description:
> +          A string containing the name of the function to mux to the group.
> +
> +      groups:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description:
> +          An array of strings identifying the list of groups.
> +
> +      pins:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          List of pins to select with this function.
> +
> +      pinmux:
> +        description: The applicable mux group.
> +        allOf:
> +          - $ref: "/schemas/types.yaml#/definitions/uint32"
> +          - enum:
> +              - 0 #PINMUX_GPIO
> +              - 1
> +              - 2
> +              - 3
> +              - 4
> +
> +      bias-pull-up:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Specifies pull-up configuration.

Isn't this boolean?

> +
> +      bias-pull-down:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Specifies pull-down configuration.

And this?

Though looks like sometimes it has a value? Pull strength I guess.

> +
> +      drive-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Enables driver-current.
> +
> +      slew-rate:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Enables slew-rate.
> +
> +      drive-open-drain:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Specifies open-drain configuration.

boolean?

> +
> +      output-enable:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Specifies if the pin is to be configured as output.

boolean?

But really, all of these should have a common schema defining the types 
and only put any additional constraints here.

> +
> +
> +    required:
> +      - function
> +      - groups
> +
> +required:
> +  - compatible
> +  - reg

additionalProperties: false

> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    pinctrl: pinctrl@e2880000 {
> +          compatible = "intel,lgm-pinctrl";
> +          reg = <0xe2880000 0x100000>;
> +
> +          # Client device subnode
> +          uart0:uart0 {

space              ^

> +                pins = <64>, /* UART_RX0 */
> +                             <65>; /* UART_TX0 */
> +                function = "CONSOLE_UART0";
> +                pinmux = <1>,
> +                         <1>;
> +                groups = "CONSOLE_UART0";
> +          };
> +    };
> +
> +...
> -- 
> 2.11.0
> 

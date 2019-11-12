Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0A50F9979
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 20:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfKLTOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 14:14:35 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:47095 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbfKLTOe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 14:14:34 -0500
Received: by mail-oi1-f196.google.com with SMTP id n14so15825197oie.13;
        Tue, 12 Nov 2019 11:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4jNoA6cFjcLd8Z53yLVk6YcAHFrtV5MHTUw6k4vZhTQ=;
        b=eR89vEMmT330rIDoOjp6whfp51Oj9kJQvJ7AZ6gZYKthgVsIWOdNjr6D32P+cy0J3g
         aeqv4SZAZMEK1tq1K8iySvdoVTNWpfVWZcdP32XH1NSAjYUGBExCx2fM7x7TeVPGCcZi
         GSzmcZicjFrDNEeN9SmLU0kaC7fLVu1yYEfxNp1S6XZYr8wPRZdKSlJ1G6KXaa0CjboY
         kRVEB/Il2v7W/LAikpqPXEWh6R+c0BFOPDuToItWGW7jyobMbX9Q4SL62uibsZeioc/2
         ADzamYCVY7XdAKKxFegdj6jMu954B7F5xOlwSgD2S0vrjYim5Ql3NcYcNZ61Thhe/1xt
         u98w==
X-Gm-Message-State: APjAAAXsxIzxDGyYt24koCDRzjbjEmzpT8H6pQ6AAMzKQGctNDciMCcl
        T5zKh4funy+hPoOq8YNcgQ==
X-Google-Smtp-Source: APXvYqyeiJf3elWT7EA3Mlwgnz6eRcQxdmuB70piwmSdAN5oGOPQdDeOw9o9KO+zCYpAbW4/PUCsqA==
X-Received: by 2002:aca:6706:: with SMTP id z6mr428142oix.89.1573586073728;
        Tue, 12 Nov 2019 11:14:33 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q3sm6190895oti.49.2019.11.12.11.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:14:33 -0800 (PST)
Date:   Tue, 12 Nov 2019 13:14:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Subject: Re: [PATCH v6 2/2] dt-bindings: pinctrl: intel: Add for new SoC
Message-ID: <20191112191432.GA19579@bogus>
References: <cover.1573455324.git.rahul.tanwar@linux.intel.com>
 <96537f8702501a45501d5a59ca029f92e36a9e4a.1573455324.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96537f8702501a45501d5a59ca029f92e36a9e4a.1573455324.git.rahul.tanwar@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 11, 2019 at 06:11:30PM +0800, Rahul Tanwar wrote:
> Add dt bindings document for pinmux & GPIO controller driver of
> Intel Lightning Mountain SoC.
> 
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
> ---
>  .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
> new file mode 100644
> index 000000000000..d54a3bda1f4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0-only

For new bindings:

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

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
> +  '-pins$':
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

Possible strings should be listed out here.

> +
> +      groups:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description:
> +          An array of strings identifying the list of groups.

Possible strings should be listed out here.

> +
> +      pins:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          List of pins to select with this function.
> +
> +      pinmux:
> +        description: The applicable mux group.
> +        allOf:
> +          - $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +
> +      bias-pull-up:
> +        type: boolean
> +      bias-pull-down:
> +        type: boolean
> +      drive-strength:
> +        type: boolean

Not a boolean. Need to define possible values.

> +      slew-rate:
> +        type: boolean

Not a boolean. Need to define possible values.

> +      drive-open-drain:
> +        type: boolean
> +      output-enable:
> +        type: boolean
> +
> +    required:
> +      - function
> +      - groups

For the -pins nodes too:

       additionalProperties: false

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    pinctrl: pinctrl@e2880000 {
> +          compatible = "intel,lgm-pinctrl";
> +          reg = <0xe2880000 0x100000>;
> +
> +          # Client device subnode
> +          uart0-pins: uart0 {

This fails 'make dt_binding_check'. Please fix and run that.

> +                pins = <64>, /* UART_RX0 */
> +                       <65>; /* UART_TX0 */
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

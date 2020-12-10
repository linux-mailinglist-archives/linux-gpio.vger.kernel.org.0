Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83F22D5CE1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389212AbgLJNsJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:48:09 -0500
Received: from mail-oo1-f65.google.com ([209.85.161.65]:45330 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389173AbgLJNsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:48:06 -0500
Received: by mail-oo1-f65.google.com with SMTP id q20so1269266oos.12;
        Thu, 10 Dec 2020 05:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rtPwb/iP58uu5ke6NQGygRXL/HSwc+xhqrdX/apPstE=;
        b=tJY9FOWNm5gSKR4iYGvPwudHwlX8OnJAj6Ex3KFR6MtfJezrYu/OuI80rAsrPtKGAP
         Ydu2M23AZLt0WmFMVWc/6eVLEHOvPdzEN5MJI0KO2ewfoEbl3g7WTfHOfnjSFpr1BIsj
         WCz5wR+lYAlcZj8XMlQE4jQZeUnedO3Lbg9UytFtBzNrnDGbgV0z8f8zZYm8Je+5Jt9r
         Mpm6uH3MUJ0OoFzsT2klw8/kqnQcXgdA73xdvDZOBGhhSLLJ0WE4Xpi55BroIMLwTRNO
         IxG+2WgzCRumKbXxDUpErOpKN3ZZIrVSOLyrhK3eVXzn4M+jU0VOcOMqlhuQWmMM11Y1
         2xcQ==
X-Gm-Message-State: AOAM532e9IgyFb+RUwJ9h0JJRSvWPIAkhtuiCG3ixjH4BnsBgVN0Vrgj
        rgWppkemrrsZBXjlsrz1xudoPBjJRA==
X-Google-Smtp-Source: ABdhPJx+Mb7Jx52bQ8gbRBeBuQw/kRP2h9E+j6aq/s74LN1EPUW5/qqTCA/ukWVzOO/mOLgPzhlS+Q==
X-Received: by 2002:a4a:6f01:: with SMTP id h1mr4143678ooc.88.1607608044877;
        Thu, 10 Dec 2020 05:47:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v13sm1006381oic.17.2020.12.10.05.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:47:24 -0800 (PST)
Received: (nullmailer pid 2404051 invoked by uid 1000);
        Thu, 10 Dec 2020 13:47:22 -0000
Date:   Thu, 10 Dec 2020 07:47:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: rt2880: add binding document
Message-ID: <20201210134722.GA2398182@robh.at.kernel.org>
References: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
 <20201208075523.7060-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208075523.7060-2-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 08:55:22AM +0100, Sergio Paracuellos wrote:
> The commit adds rt2880 compatible node in binding document.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../pinctrl/ralink,rt2880-pinmux.yaml         | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
> new file mode 100644
> index 000000000000..7dea3e26d99e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ralink,rt2880-pinmux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ralink rt2880 pinmux controller
> +
> +maintainers:
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +description:
> +  The rt2880 pinmux can only set the muxing of pin groups. muxing indiviual pins
> +  is not supported. There is no pinconf support.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ralink,rt2880-pinmux

What's the control interface as you have no 'reg' property.

> +
> +  pinctrl-0:
> +    description:
> +      A phandle to the node containing the subnodes containing default
> +      configurations. This is for pinctrl hogs.
> +
> +  pinctrl-names:
> +    description:
> +      A pinctrl state named "default" can be defined.
> +    const: default

These 2 properties go in consumer nodes.

> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  '[a-z0-9_-]+':
> +    if:
> +      type: object
> +      description: node for pinctrl.
> +      $ref: "pinmux-node.yaml"
> +    then:

For new bindings, don't do this hack. Just name the nodes '-pins$'

> +      properties:
> +        groups:
> +          description: Name of the pin group to use for the functions.
> +          enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
> +                 pcie, sdhci]
> +        function:
> +          description: The mux function to select
> +          enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
> +                 mdio, nand1, nand2, sdhci]

         additionalProperties: false
     
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    pinctrl {
> +      compatible = "ralink,rt2880-pinmux";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&state_default>;
> +
> +      state_default: pinctrl0 {
> +      };
> +
> +      i2c_pins: i2c0 {
> +        i2c0 {
> +          groups = "i2c";
> +          function = "i2c";
> +        };
> +      };
> +    };
> -- 
> 2.25.1
> 

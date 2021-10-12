Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD1B42A4F8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 14:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236442AbhJLM4t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 08:56:49 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:34631 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236434AbhJLM4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 08:56:49 -0400
Received: by mail-oi1-f178.google.com with SMTP id z11so28969057oih.1;
        Tue, 12 Oct 2021 05:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2ZjQ+qQGEZ88kHDp+LohEN5ZK3Pde3RbjbjGPXQUneY=;
        b=Wsl1+CA6CW05LDmHu3K7D60bWbd5lDTpG2BGNMTu+58ElXOTDw7GjhCDU98/l6QJc1
         NmeR6na48DmxUlv9i0y7AQsHA2CsLxaaehn9Y86PcWKmIhwAM3Q4IGwanfWwiLUvJV+k
         6sgA0FMbQpw5fZGU2AgOYTv6rYuknNIm0G50VEd5ZD4evHRRSXCTlxlsa5iWj2oNI8G/
         X5xGqMRx8DLMesDYZ11oLEmk1Gbu6Om3rRixLJjLRg1YDbUys7wXfHAFi3ZyTKZx1wFm
         z6PFxf9aG6clh+kvd8+ockBva1iuFgCjZRioTL+w7g7kXeeh47enxenRmVWxFycJCqW4
         HTyA==
X-Gm-Message-State: AOAM532dYYno8IFeNf5tsY0Clovey7HD+f9d6nUCASMHbc1gBhTAM7AH
        h5WHiBXuoBoKaOGzrew3Btl/QppI7w==
X-Google-Smtp-Source: ABdhPJyQZyNQHkP7iMZLIGI2e4jrOd2LxQGTc5kfYMxh0k+TIAfkEf3xd9DjfJeK5vFpFA0oE1KYnA==
X-Received: by 2002:aca:1809:: with SMTP id h9mr3553958oih.51.1634043287509;
        Tue, 12 Oct 2021 05:54:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e9sm1987107otr.25.2021.10.12.05.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:54:47 -0700 (PDT)
Received: (nullmailer pid 2555367 invoked by uid 1000);
        Tue, 12 Oct 2021 12:54:46 -0000
Date:   Tue, 12 Oct 2021 07:54:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Aparna M <a-m1@ti.com>
Cc:     a-govindraju@ti.com, vigneshr@ti.com, grygorii.strashko@ti.com,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: Re: [PATCH v2] dt-bindings: gpio: Convert TI TPIC2810 GPIO
 Controller bindings to YAML
Message-ID: <YWWFluiECO/Di0ZI@robh.at.kernel.org>
References: <20211004131500.22100-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004131500.22100-1-a-m1@ti.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 04, 2021 at 06:45:00PM +0530, Aparna M wrote:
> Convert gpio-tpic2810 bindings to yaml format and remove outdated
> bindings in .txt format.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>  .../bindings/gpio/gpio-tpic2810.txt           | 16 -------
>  .../bindings/gpio/gpio-tpic2810.yaml          | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
> deleted file mode 100644
> index 1afc2de7a537..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -TPIC2810 GPIO controller bindings
> -
> -Required properties:
> - - compatible		: Should be "ti,tpic2810".
> - - reg			: The I2C address of the device
> - - gpio-controller	: Marks the device node as a GPIO controller.
> - - #gpio-cells		: Should be two. For consumer use see gpio.txt.
> -
> -Example:
> -
> -	gpio@60 {
> -		compatible = "ti,tpic2810";
> -		reg = <0x60>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
> new file mode 100644
> index 000000000000..811aee483f43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-tpic2810.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TPIC2810 GPIO controller bindings
> +
> +maintainers:
> +  - Aswath Govindraju <a-govindraju@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tpic2810
> +
> +  reg:
> +    maxItems: 1
> +    description: The I2C address of the device

Drop generic descriptions.

> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c1 {

i2c {

With those changes,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpio@60 {
> +            compatible = "ti,tpic2810";
> +            reg = <0x60>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +        };
> +    };
> -- 
> 2.17.1
> 
> 

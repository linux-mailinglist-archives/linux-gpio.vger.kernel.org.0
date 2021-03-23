Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7888B346BDB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbhCWWNQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:13:16 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:45999 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbhCWWM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:12:29 -0400
Received: by mail-io1-f54.google.com with SMTP id k8so19405969iop.12;
        Tue, 23 Mar 2021 15:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7vlfeKGY2anBMnkOGjXVtyCIrkxjLM4xf/feAmd+6IY=;
        b=r3nJVVgiHVRxIPeMpm4AWI8oIwEeSj/63FuoUYCP69hx5rgmlUEaKC4XOWzGBjjcph
         3O9zEIcjmXJKPrb8qdPX4hXY8tVMflraH+KD1BfQHJKUffpcAYIt+KTETy6TWxN3HF+q
         jL/fCEK1DNWN2kALzCrhtxPvMokN+23h9F+CghUPKjn5CygDMMUJ5x8a+qhiritvS3/U
         ILzBSuJ86nZt9H6eeY8gaw+yAlLz/wZncX77y9Gwy3qHu8SGW0Ffq/15QD893MCLSGYz
         pjUxvdwwu3JEc5bz8G9tPofrUzjerUMJTUE8ROZ8U16hb2qC4+8gd4kZD979cJLljVg/
         bBJQ==
X-Gm-Message-State: AOAM5337HR6S6YKo1lf2NfVXWTl6RQV14p6VNqflvJ7HIu2Jy3mfHo7d
        dybENzE32f6GbN4DvfmQc5L7WcOibA==
X-Google-Smtp-Source: ABdhPJzDhps+3EqTMgENMAo/QosogqZw12wpVlXNRCRIesnrYfqMO0lF3nqEGhf1aX/w1W1yHmlt7Q==
X-Received: by 2002:a5e:dd0c:: with SMTP id t12mr222939iop.50.1616537546929;
        Tue, 23 Mar 2021 15:12:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u15sm80284iln.84.2021.03.23.15.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:12:25 -0700 (PDT)
Received: (nullmailer pid 1432897 invoked by uid 1000);
        Tue, 23 Mar 2021 22:12:22 -0000
Date:   Tue, 23 Mar 2021 16:12:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 03/22] dt-bindings: improve BCM6345 GPIO binding
 documentation
Message-ID: <20210323221222.GA1425873@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-4-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-4-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 03:37:44PM +0100, Álvaro Fernández Rojas wrote:
> Convert existing BCM6345 GPIO binding documentation to YAML and add binding
> documentation for the GPIO controller found in BCM6318, BCM6328, BCM6358,
> BCM6362, BCM6368 and BCM63268 SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: introduce changes suggested by Rob Herring
>  v7: new patch, splitted from pinctrl documentation

Almost there...

> 
>  .../bindings/gpio/brcm,bcm6345-gpio.txt       | 46 -----------
>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      | 78 +++++++++++++++++++
>  2 files changed, 78 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
> deleted file mode 100644
> index e7853143fa42..000000000000
> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Bindings for the Broadcom's brcm,bcm6345-gpio memory-mapped GPIO controllers.
> -
> -These bindings can be used on any BCM63xx SoC. However, BCM6338 and BCM6345
> -are the only ones which don't need a pinctrl driver.
> -BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
> -and/or written, and the direction changed from input to output.
> -BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
> -and/or written, and the direction changed from input to output.

This detail about the h/w should be kept and extended given the newer 
chips have 32-bit registers AIUI.

> -
> -Required properties:
> -	- compatible: should be "brcm,bcm6345-gpio"
> -	- reg-names: must contain
> -		"dat" - data register
> -		"dirout" - direction (output) register
> -	- reg: address + size pairs describing the GPIO register sets;
> -		order must correspond with the order of entries in reg-names
> -	- #gpio-cells: must be set to 2. The first cell is the pin number and
> -			the second cell is used to specify the gpio polarity:
> -			0 = active high
> -			1 = active low
> -	- gpio-controller: Marks the device node as a gpio controller.
> -
> -Optional properties:
> -	- native-endian: use native endian memory.
> -
> -Examples:
> -	- BCM6338:
> -	gpio: gpio-controller@fffe0407 {
> -		compatible = "brcm,bcm6345-gpio";
> -		reg-names = "dirout", "dat";
> -		reg = <0xfffe0407 1>, <0xfffe040f 1>;
> -
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -	};
> -
> -	- BCM6345:
> -	gpio: gpio-controller@fffe0406 {
> -		compatible = "brcm,bcm6345-gpio";
> -		reg-names = "dirout", "dat";
> -		reg = <0xfffe0406 2>, <0xfffe040a 2>;
> -		native-endian;
> -
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> new file mode 100644
> index 000000000000..d1d34a347a1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6345 GPIO controller
> +
> +maintainers:
> +  - Álvaro Fernández Rojas <noltari@gmail.com>
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +description: |+
> +  Bindings for Broadcom's BCM63xx memory-mapped GPIO controllers.
> +
> +  These bindings can be used on any BCM63xx SoC. However, BCM6338 and BCM6345
> +  are the only ones which don't need a pinctrl driver.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm6318-gpio
> +      - brcm,bcm6328-gpio
> +      - brcm,bcm6345-gpio
> +      - brcm,bcm6358-gpio
> +      - brcm,bcm6362-gpio
> +      - brcm,bcm6368-gpio
> +      - brcm,bcm63268-gpio
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  native-endian: true
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dirout
> +      - const: dat
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio-controller@fffe0406 {

gpio@...

> +      compatible = "brcm,bcm6345-gpio";
> +      reg-names = "dirout", "dat";
> +      reg = <0xfffe0406 2>, <0xfffe040a 2>;
> +      native-endian;
> +
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> +
> +  - |
> +    gpio@0 {
> +      compatible = "brcm,bcm63268-gpio";
> +      reg-names = "dirout", "dat";
> +      reg = <0x0 0x8>, <0x8 0x8>;
> +
> +      gpio-controller;
> +      gpio-ranges = <&pinctrl 0 0 52>;
> +      #gpio-cells = <2>;
> +    };
> -- 
> 2.20.1
> 

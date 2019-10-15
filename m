Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89ADD801D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 21:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731557AbfJOTXc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 15:23:32 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32905 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730839AbfJOTXb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 15:23:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id a15so17876583oic.0;
        Tue, 15 Oct 2019 12:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H0OMnipU3yZwO8kSIOH3gQiSnrV8gK6RMoDMYF6Q6mc=;
        b=P76q6HjJVfyBsuTyRZvIXyyAoEfg6B+n87n7DW931TXcv7DpE6ZqWtrXjOs9QYRsoN
         xLn131LipYDyL+tES1+MZjSTNOjAmxxMDY8tIWDhOKjB9CknyYdB5D4bAwtkglfY7/ha
         fC5A2eNri4XIxBOh5ydbaBbrctPxyT//AgQmOxt3C0cOODDU8QxW1P1QbLfXHcuz+QfL
         T2UMJcy/mfu1YUknO8hhG+p1nFg+ffeTHnF9sA6C8wWJ9D3I9/njNMTB4hxWyZQmuIdf
         O6d8gcKv/2Y7FA08edKX55RRH646IUol3NugFMqzYGP9pYhrSbuCjM6r6ZwofrF4ZoX2
         hn/w==
X-Gm-Message-State: APjAAAWZGdF6NMN2zswArNt28TFx09CJGt3d++fz2BBAd1dn4Mz+Nx1K
        dn0nJ5O7NhdeqO7Hf1fzfQ==
X-Google-Smtp-Source: APXvYqzE/Pe9qiNzdDA7q6NFwpwrP4q0K1yle0GZw4+iqWkBcdbOEV1cxKDZyPI4BY1GtsDAdEQwBw==
X-Received: by 2002:a54:4481:: with SMTP id v1mr141057oiv.152.1571167410301;
        Tue, 15 Oct 2019 12:23:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k34sm6865815otk.51.2019.10.15.12.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 12:23:29 -0700 (PDT)
Date:   Tue, 15 Oct 2019 14:23:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mark.rutland@arm.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
        richard.laing@alliedtelesis.co.nz, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: brcm: Add bindings for xgs-iproc
Message-ID: <20191015192328.GA26346@bogus>
References: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
 <20191004012525.26647-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004012525.26647-2-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 04, 2019 at 02:25:24PM +1300, Chris Packham wrote:
> This GPIO controller is present on a number of Broadcom switch ASICs
> with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
> blocks but different enough to require a separate driver.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../bindings/gpio/brcm,xgs-iproc.txt          | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt

Please make this a DT schema.

> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt
> new file mode 100644
> index 000000000000..328b844c82dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt
> @@ -0,0 +1,41 @@
> +Broadcom XGS iProc GPIO controller
> +
> +This controller is the Chip Common A GPIO present on a number of Broadcom
> +switch ASICs with integrated SoCs.
> +
> +Required properties:
> +- compatible:
> +    Must be "brcm,iproc-gpio-cca"
> +
> +- reg:
> +    The first region defines the base I/O address containing
> +    the GPIO controller registers. The second region defines
> +    the I/O address containing the Chip Common A interrupt
> +    registers.
> +
> +Optional properties:
> +
> +- interrupts:
> +    The interrupt shared by all GPIO lines for this controller.
> +
> +- #interrupt-cells:
> +    Should be <2>.  The first cell is the GPIO number, the second should specify
> +    flags.
> +
> +    See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +
> +- interrupt-controller:
> +    Marks the device node as an interrupt controller
> +
> +Example:
> +	gpioa: gpio@18000060 {
> +		compatible = "brcm,iproc-gpio-cca";
> +		#gpio-cells = <2>;

Not documented...

> +		reg = <0x18000060 0x50>,
> +		      <0x18000000 0x50>;
> +		ngpios = <12>;

Not documented. 

> +		gpio-controller;

Not documented.

> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> -- 
> 2.23.0
> 

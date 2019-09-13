Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3F96B2241
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 16:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730906AbfIMOgc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 10:36:32 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45625 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730866AbfIMOgb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 10:36:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id o205so2778660oib.12;
        Fri, 13 Sep 2019 07:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=tdNsvXQrGgDSgKwJ0pKr0DdtL6lbinbXmEzdTSDl9+g=;
        b=n1/bnfQAl+IjOAuiXqyKiwXhtgCmMfWJPPMjCQmsTiMrTCEoJDfZ31EPr+67AbzRZs
         a95vGNhiVLHGD+dnIM5Y6ttjbc3nSBaVw7UcKL220MgFPo0vxBRgCSZFGJ7xk0YvPGqr
         xde9SxdSnIO6nwXsV1DVm0jb7/0o/zCLMdnrZoFOoA0JUAYa3qvwZaoeeYOotZTFvfCj
         eumjdgQllvGLfirFD0ugEyN3RJ1rxxOpy1JIJ67AncQ2/pfxr8n0VALM8VWUKTnT3Wm7
         i6Ih5k8a04ZP/3IDH3iUP27zAxTxZk3j0lPaocIXqTjAyWY4bxZRsHgq8xP9u6TCLRVc
         EhTw==
X-Gm-Message-State: APjAAAW7TCtM6LbzS+oL44eTOzUMJtUcOYVQHNUUSeb4N69s6X19k3Zb
        F580DOVBwnR2gLThSS7xEQ==
X-Google-Smtp-Source: APXvYqyo4VuTwrRq+pKhI1VTnO6yPPsQd94kiSVqKzFSwGukRHVteAk9hqJYizq2K6SaO4AVS5j84Q==
X-Received: by 2002:aca:4ccd:: with SMTP id z196mr3509393oia.46.1568385390520;
        Fri, 13 Sep 2019 07:36:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u26sm944370oic.9.2019.09.13.07.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 07:36:29 -0700 (PDT)
Message-ID: <5d7ba96d.1c69fb81.59623.6c9f@mx.google.com>
Date:   Fri, 13 Sep 2019 15:36:29 +0100
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Add binding document for xylon
 logicvc-gpio
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
X-Mutt-References: <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 10, 2019 at 05:28:54PM +0200, Paul Kocialkowski wrote:
> The Xylon LogiCVC display controller exports some GPIOs, which are
> exposed as a dedicated driver.
> 
> This introduces the associated device-tree bindings documentation.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/gpio/xylon,logicvc-gpio.txt      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt

Please consider using the new DT schema format.

> 
> diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
> new file mode 100644
> index 000000000000..4835659cb90b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
> @@ -0,0 +1,48 @@
> +Xylon LogiCVC GPIO controller
> +
> +The Xylon LogiCVC is a display controller that contains a number of GPIO pins,
> +meant to be used for controlling display-related signals.
> +
> +In practice, the GPIOs can be used for any purpose they might be needed for.
> +
> +The controller exposes GPIOs from the display and power control registers,
> +which are mapped by the driver as follows:
> +- GPIO[4:0] (display control) mapped to index 0-4
> +- EN_BLIGHT (power control) mapped to index 5
> +- EN_VDD (power control) mapped to index 6
> +- EN_VEE (power control) mapped to index 7
> +- V_EN (power control) mapped to index 8
> +
> +The driver was implemented and tested for version 3.02.a of the controller,
> +but should be compatible with version 4 as well.
> +
> +Required properties:
> +- compatible: Should contain "xylon,logicvc-3.02.a-gpio".
> +- gpio-controller: Marks the device node as a gpio controller.
> +- #gpio-cells: Should be 2. The first cell is the pin number and
> +  the second cell is used to specify the gpio polarity:
> +    0 = Active high,
> +    1 = Active low.

No need to define these standard flags again here.

> +- gpio,syscon-dev: Syscon phandle representing the logicvc instance.

Don't need this. It's the parent.

> +
> +Example:
> +
> +	logicvc: logicvc@43c00000 {
> +		compatible = "syscon", "simple-mfd";

This device needs a device specific compatible. These 2 alone are not 
desired.

Please define everything that's in the chip as much as you can. 

> +		reg = <0x43c00000 0x6000>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		logicvc_gpio: display-gpio@40 {

Use standard node names: gpio@40

You may not even need a child node here. It depends on what other child 
nodes you have and whether they have their own DT resources.

> +			compatible = "xylon,logicvc-3.02.a-gpio";
> +			reg = <0x40 0x40>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio,syscon-dev = <&logicvc>;
> +		};
> +	};
> +
> +Note: the device-tree node should either be declared as a child of the logicvc
> +syscon node or the syscon node should be precised with the gpio,syscon-dev
> +property. Both are shown in the example above.

Why? Just pick one and a child node is the preference.

> -- 
> 2.23.0
> 


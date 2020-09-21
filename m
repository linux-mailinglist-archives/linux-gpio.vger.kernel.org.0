Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4261271ADF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 08:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgIUG1x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 02:27:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:51678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgIUG1x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Sep 2020 02:27:53 -0400
Received: from sekiro (amontpellier-556-1-154-164.w109-210.abo.wanadoo.fr [109.210.130.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C15B20739;
        Mon, 21 Sep 2020 06:27:51 +0000 (UTC)
Date:   Mon, 21 Sep 2020 08:27:48 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: at91-pio4: add
 microchip,sama7g5
Message-ID: <20200921062748.pf4gru6dndapzbah@sekiro>
References: <20200917131257.273882-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917131257.273882-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 04:12:56PM +0300, Eugen Hristev wrote:
> Add compatible string for microchip sama7g5 SoC.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks

Ludovic
> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> index 04d16fb69eb7..265015bc0603 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> @@ -4,7 +4,9 @@ The Atmel PIO4 controller is used to select the function of a pin and to
>  configure it.
>  
>  Required properties:
> -- compatible: "atmel,sama5d2-pinctrl".
> +- compatible:
> +	"atmel,sama5d2-pinctrl"
> +	"microchip,sama7g5-pinctrl"
>  - reg: base address and length of the PIO controller.
>  - interrupts: interrupt outputs from the controller, one for each bank.
>  - interrupt-controller: mark the device node as an interrupt controller.
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

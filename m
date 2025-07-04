Return-Path: <linux-gpio+bounces-22810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57995AF9C82
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 00:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 522F34A79F2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 22:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DBC28CF73;
	Fri,  4 Jul 2025 22:37:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342DB1991D2;
	Fri,  4 Jul 2025 22:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751668635; cv=none; b=u1Ky3YKa2sP+Sb6tYni6cN3zfhn4hyc8Vq7Y0dYih86M7zt2hSyqGyn9o1hjit1e7yzQRj0yOEKVU9WwUDyb90FXtETth084dX89NQS3Y6knJ+zS9NxnQPS1718Vs33RFzKD4ElCttlA1Dc6C/2cvnDaDf7PL7tbRV+qiLnLlG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751668635; c=relaxed/simple;
	bh=tzv9gHuqyrtu+ATJnK9d/TDJWr8Z26mlqIb4+5gWW2k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+7zLaffjAIcEOKRdYILWDkvqsUndU/45JrulG7Z85cqN8mdyoD9D27HQrhKKpQhF6b1mWypjCd6XQu1bfOqy7B1tE2YfK1hvh8rRjA+02QNx/1hL9jYCD1P7yI/dtAKqq9IhuSMhqCLymVZl6rZlVZ54Uu1+T9BJcxvkw/74C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CDBB153B;
	Fri,  4 Jul 2025 15:36:58 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E15A83F63F;
	Fri,  4 Jul 2025 15:37:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 23:35:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
Message-ID: <20250704233535.4b026641@minigeek.lan>
In-Reply-To: <20250626080923.632789-2-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-2-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025 10:09:19 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> The Allwinner A100/A133 only has a single emac instance, which is
> referred to as "emac" everywhere. Fix the pin names to drop the
> trailing "0" that has no reason to be.

Sorry, but this is wrong. There *is* a second EMAC on the A133 die: it's
indeed not mentioned in the manual, but you can probe its MMIO
registers (@0x5030000), and there is a second syscon register
(@0x03000034). It's mentioned in several BSP code places ([1]).
It seem like no suitable pins are connected on the A133
package, but that should not affect the A100 .dtsi (we use a similar
approach for the H616 and A523).

So I think we should keep the emac0 name.

Cheers,
Andre


[1]
https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi


> 
> Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 pin controller")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> index b97de80ae2f3..95b764ee1c0d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD1 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD0 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCTL */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCTL */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
>  		  SUNXI_FUNCTION(0x3, "cir0"),		/* OUT */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* CLKIN */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* CLKIN */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* TX */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CS */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD1 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RX */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
>  		  SUNXI_FUNCTION(0x4, "ledc"),
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD0 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RTS */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCK */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* CTS */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
>  		  SUNXI_FUNCTION(0x4, "spdif"),		/* OUT */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCTL */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCTL */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA0 */
>  		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
>  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* BCLK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDC */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA1 */
>  		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
>  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* LRCK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDIO */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2c3"),		/* SCK */
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* MCLK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* EPHY */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* BCLK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD3 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* LRCK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD2 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD2 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DOUT0 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din1"),	/* DIN1 */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCK */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout1"),	/* DOUT1 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din0"),	/* DIN0 */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD3 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "cir0"),		/* OUT */
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout2"),	/* DOUT2 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din2"),	/* DIN2 */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD2 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD2 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),



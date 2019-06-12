Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C81DA41D5A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 09:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408473AbfFLHQX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 03:16:23 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:60203 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403831AbfFLHQT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 03:16:19 -0400
X-Originating-IP: 90.88.159.246
Received: from aptenodytes (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr [90.88.159.246])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2845E40007;
        Wed, 12 Jun 2019 07:16:13 +0000 (UTC)
Message-ID: <2e2cb94f44ce4ef9e3d1092744ebe697ea706476.camel@bootlin.com>
Subject: Re: [linux-sunxi] [PATCH v2 03/11] pinctrl: sunxi: v3s: introduce
 support for V3
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     icenowy@aosc.io, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Date:   Wed, 12 Jun 2019 09:16:12 +0200
In-Reply-To: <20190611140940.14357-4-icenowy@aosc.io>
References: <20190611140940.14357-1-icenowy@aosc.io>
         <20190611140940.14357-4-icenowy@aosc.io>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, 2019-06-11 at 22:09 +0800, Icenowy Zheng wrote:
> Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> V3s pinctrl driver.

Looks like my comments from v1 still apply here and some of the
functions are not properly described (e.g. LCD is usually 0x2 and LVDS
0x3 while the path has both at 0x2).

Could you look into them for the next revision?

Thanks and cheers!

Paul

> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Dropped the driver rename patch and apply the changes directly on V3s
>   driver.
> 
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c | 265 +++++++++++++++++++++-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h     |   2 +
>  2 files changed, 262 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> index 6704ce8e5e3d..9e82fd38cf21 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> @@ -1,5 +1,5 @@
>  /*
> - * Allwinner V3s SoCs pinctrl driver.
> + * Allwinner V3/V3s SoCs pinctrl driver.
>   *
>   * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
>   *
> @@ -77,6 +77,30 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
>  		  SUNXI_FUNCTION(0x3, "uart0"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),	/* PB_EINT9 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 10),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "jtag"),		/* MS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),	/* PB_EINT10 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 11),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "jtag"),		/* CK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),	/* PB_EINT11 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 12),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "jtag"),		/* DO */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),	/* PB_EINT12 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 13),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "jtag"),		/* DI */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),	/* PB_EINT13 */
>  	/* Hole */
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -98,6 +122,180 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "mmc2"),		/* D0 */
>  		  SUNXI_FUNCTION(0x3, "spi0")),		/* MOSI */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 4),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc2")),		/* D1 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 5),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc2")),		/* D2 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 6),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc2")),		/* D3 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 7),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc2")),		/* D4 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 8),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc2")),		/* D5 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 9),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc2")),		/* D6 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 10),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc2")),		/* D7 */
> +	/* Hole */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 0),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D2 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* RXD3 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 1),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D3 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* RXD2 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 2),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D4 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* RXD1 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 3),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D5 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* RXD0 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 4),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D6 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* RXCK */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 5),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D7 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* RXCTL/RXDV */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 6),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D10 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* RXERR */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 7),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D11 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* TXD3 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 8),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D12 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* TXD2 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 9),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D13 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* TXD1 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 10),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D14 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* TXD0 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 11),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D15 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* CRS */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 12),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D18 */
> +		  SUNXI_FUNCTION(0x2, "lvds"),		/* VP0 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* TXCK */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 13),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D19 */
> +		  SUNXI_FUNCTION(0x2, "lvds"),		/* VN0 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* TXCTL/TXEN */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 14),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D20 */
> +		  SUNXI_FUNCTION(0x2, "lvds"),		/* VP1 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* TXERR */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 15),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D21 */
> +		  SUNXI_FUNCTION(0x2, "lvds"),		/* VN1 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* CLKIN/COL */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 16),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D22 */
> +		  SUNXI_FUNCTION(0x2, "lvds"),		/* VP2 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* MDC */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 17),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* D23 */
> +		  SUNXI_FUNCTION(0x2, "lvds"),		/* VN2 */
> +		  SUNXI_FUNCTION(0x4, "emac")),		/* MDIO */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 18),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* CLK */
> +		  SUNXI_FUNCTION(0x2, "lvds")),		/* VPC */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 19),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* DE */
> +		  SUNXI_FUNCTION(0x2, "lvds")),		/* VNC */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 20),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* HSYNC */
> +		  SUNXI_FUNCTION(0x2, "lvds")),		/* VP3 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 21),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "lcd"),		/* VSYNC */
> +		  SUNXI_FUNCTION(0x2, "lvds")),		/* VN3 */
>  	/* Hole */
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 0),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -291,6 +489,54 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),	/* PG_EINT5 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 6),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* TX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),	/* PG_EINT6 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 7),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* RX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),	/* PG_EINT7 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 8),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* RTS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),	/* PG_EINT8 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 9),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* CTS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),	/* PG_EINT9 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 10),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s"),		/* SYNC */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),	/* PG_EINT10 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 11),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s"),		/* BCLK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),	/* PG_EINT11 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 12),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s"),		/* DOUT */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),	/* PG_EINT12 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(G, 13),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "i2s"),		/* DIN */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),	/* PG_EINT13 */
>  };
>  
>  static const unsigned int sun8i_v3s_pinctrl_irq_bank_map[] = { 1, 2 };
> @@ -305,13 +551,22 @@ static const struct sunxi_pinctrl_desc sun8i_v3s_pinctrl_data = {
>  
>  static int sun8i_v3s_pinctrl_probe(struct platform_device *pdev)
>  {
> -	return sunxi_pinctrl_init(pdev,
> -				  &sun8i_v3s_pinctrl_data);
> +	unsigned long variant = (unsigned long)of_device_get_match_data(&pdev->dev);
> +
> +	return sunxi_pinctrl_init_with_variant(pdev, &sun8i_v3s_pinctrl_data,
> +					       variant);
>  }
>  
>  static const struct of_device_id sun8i_v3s_pinctrl_match[] = {
> -	{ .compatible = "allwinner,sun8i-v3s-pinctrl", },
> -	{}
> +	{
> +		.compatible = "allwinner,sun8i-v3-pinctrl",
> +		.data = (void *)PINCTRL_SUN8I_V3
> +	},
> +	{
> +		.compatible = "allwinner,sun8i-v3s-pinctrl",
> +		.data = (void *)PINCTRL_SUN8I_V3S
> +	},
> +	{ },
>  };
>  
>  static struct platform_driver sun8i_v3s_pinctrl_driver = {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 44e30deeee38..a32bb5bcb754 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -94,6 +94,8 @@
>  #define PINCTRL_SUN4I_A10	BIT(6)
>  #define PINCTRL_SUN7I_A20	BIT(7)
>  #define PINCTRL_SUN8I_R40	BIT(8)
> +#define PINCTRL_SUN8I_V3	BIT(9)
> +#define PINCTRL_SUN8I_V3S	BIT(10)
>  
>  #define PIO_POW_MOD_SEL_REG	0x340
>  
> -- 
> 2.21.0
> 
-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


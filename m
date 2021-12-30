Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EE74817E3
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Dec 2021 01:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbhL3AUp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Dec 2021 19:20:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39788 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhL3AUp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Dec 2021 19:20:45 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09B362A5;
        Thu, 30 Dec 2021 01:20:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640823644;
        bh=q5s6E/gtrAqFQbIDoD3xJ9ymUSiVxNDGcBipvnbOIhI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HE8UvIShUz0xi4t9mmUm76CHVvkP4txakQaRRoShjPNWgCX/MzjURnfzALvy9nSpp
         zd/FKFXIEAuyRohusuMKc4JSGls+GJBmfWvRhGMB1docFaQjU8E/QVVH63zIA2QNMY
         2bC5JKutm76/Bu3UKlNs6XTDO6oE95+K5hOl6C9U=
Date:   Thu, 30 Dec 2021 02:20:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <damm@opensource.se>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: r8a7791: Remove INTC_IRQx_N
Message-ID: <Ycz7WdLFJhZWbSV/@pendragon.ideasonboard.com>
References: <932834b388887e1ae267e5a852c688c79091a5f9.1640269369.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <932834b388887e1ae267e5a852c688c79091a5f9.1640269369.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Dec 23, 2021 at 03:24:59PM +0100, Geert Uytterhoeven wrote:
> The INTC_IRQx_N pin functions were only documented in preliminary
> versions of the R-Car M2 Hardware User's Manual, and were never used.
> 
> This reduces kernel size by 40 bytes.

An impressive improvement ;-)

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> To be queued in renesas-pinctrl for v5.18.
> 
>  drivers/pinctrl/renesas/pfc-r8a7791.c | 35 ++++++++++++---------------
>  1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
> index fe4ccab6b0b8ce02..e3b886b95545cab3 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7791.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
> @@ -234,11 +234,11 @@ enum {
>  	FN_AUDIO_CLKC, FN_SCIFB0_SCK_C, FN_MSIOF1_SYNC_B, FN_RX2,
>  	FN_SCIFA2_RXD, FN_FMIN_E,
>  	FN_AUDIO_CLKOUT, FN_MSIOF1_SS1_B, FN_TX2, FN_SCIFA2_TXD,
> -	FN_IRQ0, FN_SCIFB1_RXD_D, FN_INTC_IRQ0_N,
> -	FN_IRQ1, FN_SCIFB1_SCK_C, FN_INTC_IRQ1_N,
> -	FN_IRQ2, FN_SCIFB1_TXD_D, FN_INTC_IRQ2_N,
> -	FN_IRQ3, FN_I2C4_SCL_C, FN_MSIOF2_TXD_E, FN_INTC_IRQ3_N,
> -	FN_IRQ4, FN_HRX1_C, FN_I2C4_SDA_C, FN_MSIOF2_RXD_E, FN_INTC_IRQ4_N,
> +	FN_IRQ0, FN_SCIFB1_RXD_D,
> +	FN_IRQ1, FN_SCIFB1_SCK_C,
> +	FN_IRQ2, FN_SCIFB1_TXD_D,
> +	FN_IRQ3, FN_I2C4_SCL_C, FN_MSIOF2_TXD_E,
> +	FN_IRQ4, FN_HRX1_C, FN_I2C4_SDA_C, FN_MSIOF2_RXD_E,
>  	FN_IRQ5, FN_HTX1_C, FN_I2C1_SCL_E, FN_MSIOF2_SCK_E,
>  	FN_IRQ6, FN_HSCK1_C, FN_MSIOF1_SS2_B, FN_I2C1_SDA_E, FN_MSIOF2_SYNC_E,
>  	FN_IRQ7, FN_HCTS1_N_C, FN_MSIOF1_TXD_B, FN_GPS_CLK_C, FN_GPS_CLK_D,
> @@ -606,12 +606,12 @@ enum {
>  	AUDIO_CLKC_MARK, SCIFB0_SCK_C_MARK, MSIOF1_SYNC_B_MARK, RX2_MARK,
>  	SCIFA2_RXD_MARK, FMIN_E_MARK,
>  	AUDIO_CLKOUT_MARK, MSIOF1_SS1_B_MARK, TX2_MARK, SCIFA2_TXD_MARK,
> -	IRQ0_MARK, SCIFB1_RXD_D_MARK, INTC_IRQ0_N_MARK,
> -	IRQ1_MARK, SCIFB1_SCK_C_MARK, INTC_IRQ1_N_MARK,
> -	IRQ2_MARK, SCIFB1_TXD_D_MARK, INTC_IRQ2_N_MARK,
> -	IRQ3_MARK, I2C4_SCL_C_MARK, MSIOF2_TXD_E_MARK, INTC_IRQ3_N_MARK,
> +	IRQ0_MARK, SCIFB1_RXD_D_MARK,
> +	IRQ1_MARK, SCIFB1_SCK_C_MARK,
> +	IRQ2_MARK, SCIFB1_TXD_D_MARK,
> +	IRQ3_MARK, I2C4_SCL_C_MARK, MSIOF2_TXD_E_MARK,
>  	IRQ4_MARK, HRX1_C_MARK, I2C4_SDA_C_MARK,
> -	MSIOF2_RXD_E_MARK, INTC_IRQ4_N_MARK,
> +	MSIOF2_RXD_E_MARK,
>  	IRQ5_MARK, HTX1_C_MARK, I2C1_SCL_E_MARK, MSIOF2_SCK_E_MARK,
>  	IRQ6_MARK, HSCK1_C_MARK, MSIOF1_SS2_B_MARK,
>  	I2C1_SDA_E_MARK, MSIOF2_SYNC_E_MARK,
> @@ -1140,22 +1140,17 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP6_7_6, SCIFA2_TXD, SEL_SCIFA2_0),
>  	PINMUX_IPSR_GPSR(IP6_9_8, IRQ0),
>  	PINMUX_IPSR_MSEL(IP6_9_8, SCIFB1_RXD_D, SEL_SCIFB1_3),
> -	PINMUX_IPSR_GPSR(IP6_9_8, INTC_IRQ0_N),
>  	PINMUX_IPSR_GPSR(IP6_11_10, IRQ1),
>  	PINMUX_IPSR_MSEL(IP6_11_10, SCIFB1_SCK_C, SEL_SCIFB1_2),
> -	PINMUX_IPSR_GPSR(IP6_11_10, INTC_IRQ1_N),
>  	PINMUX_IPSR_GPSR(IP6_13_12, IRQ2),
>  	PINMUX_IPSR_MSEL(IP6_13_12, SCIFB1_TXD_D, SEL_SCIFB1_3),
> -	PINMUX_IPSR_GPSR(IP6_13_12, INTC_IRQ2_N),
>  	PINMUX_IPSR_GPSR(IP6_15_14, IRQ3),
>  	PINMUX_IPSR_MSEL(IP6_15_14, I2C4_SCL_C, SEL_I2C4_2),
>  	PINMUX_IPSR_MSEL(IP6_15_14, MSIOF2_TXD_E, SEL_SOF2_4),
> -	PINMUX_IPSR_GPSR(IP6_15_14, INTC_IRQ4_N),
>  	PINMUX_IPSR_GPSR(IP6_18_16, IRQ4),
>  	PINMUX_IPSR_MSEL(IP6_18_16, HRX1_C, SEL_HSCIF1_2),
>  	PINMUX_IPSR_MSEL(IP6_18_16, I2C4_SDA_C, SEL_I2C4_2),
>  	PINMUX_IPSR_MSEL(IP6_18_16, MSIOF2_RXD_E, SEL_SOF2_4),
> -	PINMUX_IPSR_GPSR(IP6_18_16, INTC_IRQ4_N),
>  	PINMUX_IPSR_GPSR(IP6_20_19, IRQ5),
>  	PINMUX_IPSR_MSEL(IP6_20_19, HTX1_C, SEL_HSCIF1_2),
>  	PINMUX_IPSR_MSEL(IP6_20_19, I2C1_SCL_E, SEL_I2C1_4),
> @@ -6033,15 +6028,15 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>  		FN_IRQ5, FN_HTX1_C, FN_I2C1_SCL_E, FN_MSIOF2_SCK_E,
>  		/* IP6_18_16 [3] */
>  		FN_IRQ4, FN_HRX1_C, FN_I2C4_SDA_C, FN_MSIOF2_RXD_E,
> -		FN_INTC_IRQ4_N,	0, 0, 0,
> +		0, 0, 0, 0,
>  		/* IP6_15_14 [2] */
> -		FN_IRQ3, FN_I2C4_SCL_C, FN_MSIOF2_TXD_E, FN_INTC_IRQ3_N,
> +		FN_IRQ3, FN_I2C4_SCL_C, FN_MSIOF2_TXD_E, 0,
>  		/* IP6_13_12 [2] */
> -		FN_IRQ2, FN_SCIFB1_TXD_D, FN_INTC_IRQ2_N, 0,
> +		FN_IRQ2, FN_SCIFB1_TXD_D, 0, 0,
>  		/* IP6_11_10 [2] */
> -		FN_IRQ1, FN_SCIFB1_SCK_C, FN_INTC_IRQ1_N, 0,
> +		FN_IRQ1, FN_SCIFB1_SCK_C, 0, 0,
>  		/* IP6_9_8 [2] */
> -		FN_IRQ0, FN_SCIFB1_RXD_D, FN_INTC_IRQ0_N, 0,
> +		FN_IRQ0, FN_SCIFB1_RXD_D, 0, 0,
>  		/* IP6_7_6 [2] */
>  		FN_AUDIO_CLKOUT, FN_MSIOF1_SS1_B, FN_TX2, FN_SCIFA2_TXD,
>  		/* IP6_5_3 [3] */

-- 
Regards,

Laurent Pinchart

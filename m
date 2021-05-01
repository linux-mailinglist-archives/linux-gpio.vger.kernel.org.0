Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18346370652
	for <lists+linux-gpio@lfdr.de>; Sat,  1 May 2021 10:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhEAIH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 May 2021 04:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhEAIH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 May 2021 04:07:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED64C06174A
        for <linux-gpio@vger.kernel.org>; Sat,  1 May 2021 01:07:07 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id h36so598807lfv.7
        for <linux-gpio@vger.kernel.org>; Sat, 01 May 2021 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1UnjwLtOFbMPTVzjqelURDiH0tgBWcCpHiK8SVpGvMs=;
        b=WBSX3ej+jiMlAAEJIcK3QjKOhBca4+OeWFsbr/xjn2jvgSL/jqi6ajD7rN9uwmWWUT
         jsmsXm2y+Pex6lhxcTC5oaN+e5+c1rRnQunOIdexXYWzadfBru1FQRTo6jJEubY7K1XT
         2ehOqTztXh65ud9Wed9UhtTubfORkjIErX4rdilyxThr2/OtevAA0+NPVLHgJR2lUitv
         5V9JINMyYQzKZJVsqbPYhrig2Xw26rrK8sQOv9ab+LV4h/z2UfOYKXsvK5IK45pVKRet
         YZCHOSbrXJqpEVNIhUKkAcfP+vF/UmVcExY/seBoRXLciy6Feug07yM9u+w9f7E+SXwi
         7Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1UnjwLtOFbMPTVzjqelURDiH0tgBWcCpHiK8SVpGvMs=;
        b=jpCJYrukZfV3MSEtb2TNgVbQpu/z3yHGNb01kzP0alappmXJPhFGwxMMkuN3ziTE+L
         C61Xh0fLuGc0BdsqbJoIJp/5x2ZwrWPATOLpbMHWKoueC72BTv+59G1mIjZ8scEmSRT9
         5r+9LYBviHV40m4U/JqRq4HKysEvR4d/ZWUADxOZzl4bpNiGCbNLIdXBvJYZVKHsMXtR
         kC6GwNnopzNsVbws8PJ4N+5fDIcZ40lMEGNuvsYoGjbSeitYa3KndwsjXMIIolLpXgM2
         JL3/XaSj9KF2naMOlamL1PjnuAtOE/Zsw3uu3VmyduoFEc2lpopPS+rHlR6QYvQA3xKC
         a8cA==
X-Gm-Message-State: AOAM531FhV7YAK2TBoTC+nZE1p09yRl4cyfengEJzNhPlrxCNNidgdIz
        pMazsAB/igLno3i3/4s2d0k/hQ==
X-Google-Smtp-Source: ABdhPJzDlTBZR7f+YWExYH+0nxYwbTcT4r5KW2TkjtU3DDANz9kznDU7FOYKHHybp31RbA4WPCB7/A==
X-Received: by 2002:ac2:418f:: with SMTP id z15mr6078180lfh.2.1619856426158;
        Sat, 01 May 2021 01:07:06 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id t30sm272110ljd.98.2021.05.01.01.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 01:07:05 -0700 (PDT)
Date:   Sat, 1 May 2021 10:07:05 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 05/12] pinctrl: renesas: r8a779{51,6,65}: Reduce
 non-functional differences
Message-ID: <YI0MKZ9UnzuLBw06@oden.dyn.berto.se>
References: <cover.1619785375.git.geert+renesas@glider.be>
 <527b45ebfc664a80e41cb0136677db7260e11437.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <527b45ebfc664a80e41cb0136677db7260e11437.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-04-30 14:31:04 +0200, Geert Uytterhoeven wrote:
> Change whitespace in the pin control drivers for R-Car H3 ES2.0+, R-Car
> M3-W/M3-W+, and R-Car M3-N, to reduce the differences among these very
> similar drivers.
> 
> These changes have no functional impact.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pfc-r8a77951.c |  4 +-
>  drivers/pinctrl/renesas/pfc-r8a7796.c  |  7 ++-
>  drivers/pinctrl/renesas/pfc-r8a77965.c | 79 +++++++++++++-------------
>  3 files changed, 46 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
> index be4eee0708427988..84c0ea5d59c1ac31 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77951.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
> @@ -241,7 +241,7 @@
>  #define GPSR6_3		F_(SSI_SDATA1_A,	IP15_3_0)
>  #define GPSR6_2		F_(SSI_SDATA0,		IP14_31_28)
>  #define GPSR6_1		F_(SSI_WS01239,		IP14_27_24)
> -#define GPSR6_0		F_(SSI_SCK01239,		IP14_23_20)
> +#define GPSR6_0		F_(SSI_SCK01239,	IP14_23_20)
>  
>  /* GPSR7 */
>  #define GPSR7_3		FM(GP7_03)
> @@ -668,7 +668,7 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0,	SEL_ETHERAVB_0),
>  	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, MSIOF2_TXD_C,		I2C_SEL_5_0,	SEL_MSIOF2_2),
>  	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, RTS4_N_A,		I2C_SEL_5_0,	SEL_SCIF4_0),
> -	PINMUX_IPSR_PHYS(IP0_23_20,     SDA5,                   I2C_SEL_5_1),
> +	PINMUX_IPSR_PHYS(IP0_23_20,	SDA5,			I2C_SEL_5_1),
>  
>  	PINMUX_IPSR_GPSR(IP0_27_24,	IRQ0),
>  	PINMUX_IPSR_GPSR(IP0_27_24,	QPOLB),
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
> index bbb1b436ded3123f..a4d74df3d20105e8 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7796.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
> @@ -1549,7 +1549,7 @@ static const u16 pinmux_data[] = {
>   * core will do the right thing and skip trying to mux the pin
>   * while still applying configuration to it.
>   */
> -#define FM(x)   PINMUX_DATA(x##_MARK, 0),
> +#define FM(x)	PINMUX_DATA(x##_MARK, 0),
>  	PINMUX_STATIC
>  #undef FM
>  };
> @@ -4234,7 +4234,7 @@ static const struct {
>  		SH_PFC_PIN_GROUP(avb_link),
>  		SH_PFC_PIN_GROUP(avb_magic),
>  		SH_PFC_PIN_GROUP(avb_phy_int),
> -		SH_PFC_PIN_GROUP_ALIAS(avb_mdc, avb_mdio), /* Deprecated */
> +		SH_PFC_PIN_GROUP_ALIAS(avb_mdc, avb_mdio),	/* Deprecated */
>  		SH_PFC_PIN_GROUP(avb_mdio),
>  		SH_PFC_PIN_GROUP(avb_mii),
>  		SH_PFC_PIN_GROUP(avb_avtp_pps),
> @@ -5991,7 +5991,8 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
>  	{ /* sentinel */ },
>  };
>  
> -static int r8a7796_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
> +static int r8a7796_pin_to_pocctrl(struct sh_pfc *pfc,
> +				  unsigned int pin, u32 *pocctrl)
>  {
>  	int bit = -EINVAL;
>  
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
> index e69210cc61486edc..a7607a6798865868 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77965.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
> @@ -666,14 +666,14 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP0_15_12,	TX4_A,			SEL_SCIF4_0),
>  	PINMUX_IPSR_GPSR(IP0_19_16,	FSCLKST2_N_A),
>  
> -	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	AVB_AVTP_MATCH_A,	I2C_SEL_5_0, SEL_ETHERAVB_0),
> -	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	MSIOF2_RXD_C,	I2C_SEL_5_0, SEL_MSIOF2_2),
> -	PINMUX_IPSR_PHYS_MSEL(IP0_19_16,	CTS4_N_A,	I2C_SEL_5_0, SEL_SCIF4_0),
> +	PINMUX_IPSR_PHYS_MSEL(IP0_19_16, AVB_AVTP_MATCH_A,	I2C_SEL_5_0,	SEL_ETHERAVB_0),
> +	PINMUX_IPSR_PHYS_MSEL(IP0_19_16, MSIOF2_RXD_C,		I2C_SEL_5_0,	SEL_MSIOF2_2),
> +	PINMUX_IPSR_PHYS_MSEL(IP0_19_16, CTS4_N_A,		I2C_SEL_5_0,	SEL_SCIF4_0),
>  	PINMUX_IPSR_PHYS(IP0_19_16,	SCL5,			I2C_SEL_5_1),
>  
> -	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0, SEL_ETHERAVB_0),
> -	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	MSIOF2_TXD_C,		I2C_SEL_5_0, SEL_MSIOF2_2),
> -	PINMUX_IPSR_PHYS_MSEL(IP0_23_20,	RTS4_N_A,		I2C_SEL_5_0, SEL_SCIF4_0),
> +	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, AVB_AVTP_CAPTURE_A,	I2C_SEL_5_0,	SEL_ETHERAVB_0),
> +	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, MSIOF2_TXD_C,		I2C_SEL_5_0,	SEL_MSIOF2_2),
> +	PINMUX_IPSR_PHYS_MSEL(IP0_23_20, RTS4_N_A,		I2C_SEL_5_0,	SEL_SCIF4_0),
>  	PINMUX_IPSR_PHYS(IP0_23_20,	SDA5,			I2C_SEL_5_1),
>  
>  	PINMUX_IPSR_GPSR(IP0_27_24,	IRQ0),
> @@ -727,16 +727,16 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP1_19_16,	VI4_DATA6_B,		SEL_VIN4_1),
>  	PINMUX_IPSR_MSEL(IP1_19_16,	IECLK_B,		SEL_IEBUS_1),
>  
> -	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	PWM1_A,		I2C_SEL_3_0,	SEL_PWM1_0),
> -	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	HRX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
> -	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	VI4_DATA7_B,	I2C_SEL_3_0,	SEL_VIN4_1),
> -	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	IERX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
> -	PINMUX_IPSR_PHYS(IP1_23_20,	SCL3,		I2C_SEL_3_1),
> +	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, PWM1_A,		I2C_SEL_3_0,	SEL_PWM1_0),
> +	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, HRX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
> +	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, VI4_DATA7_B,		I2C_SEL_3_0,	SEL_VIN4_1),
> +	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, IERX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
> +	PINMUX_IPSR_PHYS(IP1_23_20,	SCL3,			I2C_SEL_3_1),
>  
> -	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	PWM2_A,		I2C_SEL_3_0,	SEL_PWM2_0),
> -	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	HTX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
> -	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	IETX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
> -	PINMUX_IPSR_PHYS(IP1_27_24,	SDA3,		I2C_SEL_3_1),
> +	PINMUX_IPSR_PHYS_MSEL(IP1_27_24, PWM2_A,		I2C_SEL_3_0,	SEL_PWM2_0),
> +	PINMUX_IPSR_PHYS_MSEL(IP1_27_24, HTX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
> +	PINMUX_IPSR_PHYS_MSEL(IP1_27_24, IETX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
> +	PINMUX_IPSR_PHYS(IP1_27_24,	SDA3,			I2C_SEL_3_1),
>  
>  	PINMUX_IPSR_GPSR(IP1_31_28,	A0),
>  	PINMUX_IPSR_GPSR(IP1_31_28,	LCDOUT16),
> @@ -1171,13 +1171,13 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP11_15_12,	SDA2_B,			SEL_I2C2_1),
>  
>  	PINMUX_IPSR_MSEL(IP11_19_16,	SD1_CD,			I2C_SEL_0_0),
> -	PINMUX_IPSR_PHYS_MSEL(IP11_19_16,	NFRB_N_A,	I2C_SEL_0_0, SEL_NDF_0),
> -	PINMUX_IPSR_PHYS_MSEL(IP11_19_16,	SIM0_CLK_B,	I2C_SEL_0_0, SEL_SIMCARD_1),
> +	PINMUX_IPSR_PHYS_MSEL(IP11_19_16, NFRB_N_A,		I2C_SEL_0_0,	SEL_NDF_0),
> +	PINMUX_IPSR_PHYS_MSEL(IP11_19_16, SIM0_CLK_B,		I2C_SEL_0_0,	SEL_SIMCARD_1),
>  	PINMUX_IPSR_PHYS(IP11_19_16,	SCL0,			I2C_SEL_0_1),
>  
>  	PINMUX_IPSR_MSEL(IP11_23_20,	SD1_WP,			I2C_SEL_0_0),
> -	PINMUX_IPSR_PHYS_MSEL(IP11_23_20,	NFCE_N_A,	I2C_SEL_0_0, SEL_NDF_0),
> -	PINMUX_IPSR_PHYS_MSEL(IP11_23_20,	SIM0_D_B,	I2C_SEL_0_0, SEL_SIMCARD_1),
> +	PINMUX_IPSR_PHYS_MSEL(IP11_23_20, NFCE_N_A,		I2C_SEL_0_0,	SEL_NDF_0),
> +	PINMUX_IPSR_PHYS_MSEL(IP11_23_20, SIM0_D_B,		I2C_SEL_0_0,	SEL_SIMCARD_1),
>  	PINMUX_IPSR_PHYS(IP11_23_20,	SDA0,			I2C_SEL_0_1),
>  
>  	PINMUX_IPSR_GPSR(IP11_27_24,	SCK0),
> @@ -1553,7 +1553,7 @@ static const u16 pinmux_data[] = {
>   * core will do the right thing and skip trying to mux the pin
>   * while still applying configuration to it.
>   */
> -#define FM(x)   PINMUX_DATA(x##_MARK, 0),
> +#define FM(x)	PINMUX_DATA(x##_MARK, 0),
>  	PINMUX_STATIC
>  #undef FM
>  };
> @@ -4224,24 +4224,24 @@ static const unsigned int vin4_data18_a_pins[] = {
>  	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
>  	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
>  	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
> -	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
> -	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> -	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> -	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
> -	RCAR_GP_PIN(0, 4),  RCAR_GP_PIN(0, 5),
> -	RCAR_GP_PIN(0, 6),  RCAR_GP_PIN(0, 7),
> +	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> +	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
> +	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
> +	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
>  };
>  
>  static const unsigned int vin4_data18_a_mux[] = {
>  	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
>  	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
>  	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> -	VI4_DATA10_MARK,  VI4_DATA11_MARK,
> -	VI4_DATA12_MARK,  VI4_DATA13_MARK,
> -	VI4_DATA14_MARK,  VI4_DATA15_MARK,
> -	VI4_DATA18_MARK,  VI4_DATA19_MARK,
> -	VI4_DATA20_MARK,  VI4_DATA21_MARK,
> -	VI4_DATA22_MARK,  VI4_DATA23_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +	VI4_DATA18_MARK, VI4_DATA19_MARK,
> +	VI4_DATA20_MARK, VI4_DATA21_MARK,
> +	VI4_DATA22_MARK, VI4_DATA23_MARK,
>  };
>  
>  static const union vin_data vin4_data_a_pins = {
> @@ -4294,12 +4294,12 @@ static const unsigned int vin4_data18_b_mux[] = {
>  	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
>  	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
>  	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
> -	VI4_DATA10_MARK,  VI4_DATA11_MARK,
> -	VI4_DATA12_MARK,  VI4_DATA13_MARK,
> -	VI4_DATA14_MARK,  VI4_DATA15_MARK,
> -	VI4_DATA18_MARK,  VI4_DATA19_MARK,
> -	VI4_DATA20_MARK,  VI4_DATA21_MARK,
> -	VI4_DATA22_MARK,  VI4_DATA23_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +	VI4_DATA18_MARK, VI4_DATA19_MARK,
> +	VI4_DATA20_MARK, VI4_DATA21_MARK,
> +	VI4_DATA22_MARK, VI4_DATA23_MARK,
>  };
>  
>  static const union vin_data vin4_data_b_pins = {
> @@ -6248,7 +6248,8 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
>  	{ /* sentinel */ },
>  };
>  
> -static int r8a77965_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
> +static int r8a77965_pin_to_pocctrl(struct sh_pfc *pfc,
> +				   unsigned int pin, u32 *pocctrl)
>  {
>  	int bit = -EINVAL;
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund

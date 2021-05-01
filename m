Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E5E3706A4
	for <lists+linux-gpio@lfdr.de>; Sat,  1 May 2021 11:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhEAJeE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 May 2021 05:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhEAJeE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 May 2021 05:34:04 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55457C06174A
        for <linux-gpio@vger.kernel.org>; Sat,  1 May 2021 02:33:13 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id l22so1020380ljc.9
        for <linux-gpio@vger.kernel.org>; Sat, 01 May 2021 02:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BF+ndVy9nbDuRCVmO8AKtUGRH9XS2qC1fSZjhyLeOec=;
        b=VKb7Bv6DgKQuyiJgZhU/UuWFBpAz28bzF9ybOkN9AeqVw22JHvrQiqx293XuV513wp
         uRtgbNUaSb9ipNSrVpHlHzRg1JpNiOs5EKBHPaiSaJcsfh+rawzH7nZRwDEg0ZcxWdyX
         3fwa+lttgnaHaZkq68YXlU/5ie9aaOzOXvmPxZOzAaeQjKakHUdtFKbRPR6UC52qUSsB
         6ZxI/0eTyz1mcNjAz+uoBpJe9+HBSrxfaIpkholclcPlEL1jkfx/KfO0igNuYQjsfHcr
         Ffd0XQ0vhgXblQIR/gVxhj4Y9DdhRi358fcFHrYop7zV09/tcL2l2Jr+T0wTK89L5NAJ
         wdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BF+ndVy9nbDuRCVmO8AKtUGRH9XS2qC1fSZjhyLeOec=;
        b=qhUtG4yWPUllk9Y7W5qJXHBP15g5VB6rPneiWQoqEYNmbgNCzYU0RkFf6R9eZotZ2X
         fhwU6+b0MZoX3pp/cTUxICZMCpHVi+a05Eh5BZJG6mR2SUKUwkUH+aK2um3R2EzwXztn
         aEKTuaUfaTPu/CdBMaqRvXWJ6E5qBUbnc3BiotCYxsw9JeePJDaDu2ElqrKJledXh1x1
         zdyh9wi140+jx1E7Fi6svZREZ1yzho/wC3n1kvJwDHIQNfPABV3tjIdP1Z1vOEYXneR0
         Ew+w1DuUcZwspcbC2JLBDRMKZMql5f3oo/5YsMa9i9o2IlSwx6tfIciIdILl2QU39ORc
         Ohjg==
X-Gm-Message-State: AOAM532MU7VEpQmVkjdcMCISUuxW/wxclULUINXnGGFf78HCLYP1nGQe
        5Spmt6KyVpgXkTrJXANzVOeFfdmAajpi2w==
X-Google-Smtp-Source: ABdhPJxwkIY3urwAtzGjKZteOZCRVhe/0tur7YIlfuPTH+anAERW7rugocdY0s2p/b8Zj0K56rLeJQ==
X-Received: by 2002:a05:651c:8f:: with SMTP id 15mr1518679ljq.164.1619861591842;
        Sat, 01 May 2021 02:33:11 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j8sm541827lfg.250.2021.05.01.02.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 02:33:10 -0700 (PDT)
Date:   Sat, 1 May 2021 11:33:10 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 10/12] pinctrl: renesas: r8a77970: Add bias pinconf
 support
Message-ID: <YI0gViBuVYUUEGH8@oden.dyn.berto.se>
References: <cover.1619785375.git.geert+renesas@glider.be>
 <bcfad447624d874258a45a92554574b8fe9f712f.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcfad447624d874258a45a92554574b8fe9f712f.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-04-30 14:31:09 +0200, Geert Uytterhoeven wrote:
> Implement support for pull-up (most pins, excl. DU_DOTCLKIN and EXTALR)
> and pull-down (most pins, excl. JTAG) handling for the R-Car V3M SoC,
> using the common R-Car bias handling.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Not verified each pin with the datasheet, but the schematics looks good,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pfc-r8a77970.c | 175 ++++++++++++++++++++++++-
>  1 file changed, 169 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
> index 7935826cfae7c9a3..45b0b235c5cc0138 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77970.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
> @@ -19,12 +19,23 @@
>  #include "sh_pfc.h"
>  
>  #define CPU_ALL_GP(fn, sfx)						\
> -	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
> -	PORT_GP_28(1, fn, sfx),						\
> -	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
> -	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
> -	PORT_GP_6(4,  fn, sfx),						\
> -	PORT_GP_15(5, fn, sfx)
> +	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
> +	PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
> +	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
> +	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
> +	PORT_GP_CFG_6(4,  fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
> +	PORT_GP_CFG_15(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN)
> +
> +#define CPU_ALL_NOGP(fn)						\
> +	PIN_NOGP_CFG(DU_DOTCLKIN, "DU_DOTCLKIN", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
> +	PIN_NOGP_CFG(EXTALR, "EXTALR", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
> +	PIN_NOGP_CFG(FSCLKST_N, "FSCLKST#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
> +	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
> +	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
> +
>  /*
>   * F_() : just information
>   * FM() : macro for FN_xxx / xxx_MARK
> @@ -718,8 +729,17 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_GPSR(IP8_27_24,	DIGRF_CLKEN_OUT),
>  };
>  
> +/*
> + * Pins not associated with a GPIO port.
> + */
> +enum {
> +	GP_ASSIGN_LAST(),
> +	NOGP_ALL(),
> +};
> +
>  static const struct sh_pfc_pin pinmux_pins[] = {
>  	PINMUX_GPIO_GP_ALL(),
> +	PINMUX_NOGP_ALL(),
>  };
>  
>  /* - AVB0 ------------------------------------------------------------------- */
> @@ -2496,8 +2516,150 @@ static int r8a77970_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
>  	return -EINVAL;
>  }
>  
> +static const struct pinmux_bias_reg pinmux_bias_regs[] = {
> +	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
> +		[ 0] = RCAR_GP_PIN(0, 0),	/* DU_DR2 */
> +		[ 1] = RCAR_GP_PIN(0, 1),	/* DU_DR3 */
> +		[ 2] = RCAR_GP_PIN(0, 2),	/* DU_DR4 */
> +		[ 3] = RCAR_GP_PIN(0, 3),	/* DU_DR5 */
> +		[ 4] = RCAR_GP_PIN(0, 4),	/* DU_DR6 */
> +		[ 5] = RCAR_GP_PIN(0, 5),	/* DU_DR7 */
> +		[ 6] = RCAR_GP_PIN(0, 6),	/* DU_DG2 */
> +		[ 7] = RCAR_GP_PIN(0, 7),	/* DU_DG3 */
> +		[ 8] = RCAR_GP_PIN(0, 8),	/* DU_DG4 */
> +		[ 9] = RCAR_GP_PIN(0, 9),	/* DU_DG5 */
> +		[10] = RCAR_GP_PIN(0, 10),	/* DU_DG6 */
> +		[11] = RCAR_GP_PIN(0, 11),	/* DU_DG7 */
> +		[12] = RCAR_GP_PIN(0, 12),	/* DU_DB2 */
> +		[13] = RCAR_GP_PIN(0, 13),	/* DU_DB3 */
> +		[14] = RCAR_GP_PIN(0, 14),	/* DU_DB4 */
> +		[15] = RCAR_GP_PIN(0, 15),	/* DU_DB5 */
> +		[16] = RCAR_GP_PIN(0, 16),	/* DU_DB6 */
> +		[17] = RCAR_GP_PIN(0, 17),	/* DU_DB7 */
> +		[18] = RCAR_GP_PIN(0, 18),	/* DU_DOTCLKOUT */
> +		[19] = RCAR_GP_PIN(0, 19),	/* DU_EXHSYNC/DU_HSYNC */
> +		[20] = RCAR_GP_PIN(0, 20),	/* DU_EXVSYNC/DU_VSYNC */
> +		[21] = RCAR_GP_PIN(0, 21),	/* DU_EXODDF/DU_ODDF/DISP/CDE */
> +		[22] = PIN_DU_DOTCLKIN,		/* DU_DOTCLKIN */
> +		[23] = PIN_PRESETOUT_N,		/* PRESETOUT# */
> +		[24] = PIN_EXTALR,		/* EXTALR */
> +		[25] = PIN_FSCLKST_N,		/* FSCLKST# */
> +		[26] = RCAR_GP_PIN(1, 0),	/* IRQ0 */
> +		[27] = PIN_TRST_N,		/* TRST# */
> +		[28] = PIN_TCK,			/* TCK */
> +		[29] = PIN_TMS,			/* TMS */
> +		[30] = PIN_TDI,			/* TDI */
> +		[31] = RCAR_GP_PIN(2, 0),	/* VI0_CLK */
> +	} },
> +	{ PINMUX_BIAS_REG("PUEN1", 0xe6060404, "PUD1", 0xe6060444) {
> +		[ 0] = RCAR_GP_PIN(2, 1),	/* VI0_CLKENB */
> +		[ 1] = RCAR_GP_PIN(2, 2),	/* VI0_HSYNC# */
> +		[ 2] = RCAR_GP_PIN(2, 3),	/* VI0_VSYNC# */
> +		[ 3] = RCAR_GP_PIN(2, 4),	/* VI0_DATA0 */
> +		[ 4] = RCAR_GP_PIN(2, 5),	/* VI0_DATA1 */
> +		[ 5] = RCAR_GP_PIN(2, 6),	/* VI0_DATA2 */
> +		[ 6] = RCAR_GP_PIN(2, 7),	/* VI0_DATA3 */
> +		[ 7] = RCAR_GP_PIN(2, 8),	/* VI0_DATA4 */
> +		[ 8] = RCAR_GP_PIN(2, 9),	/* VI0_DATA5 */
> +		[ 9] = RCAR_GP_PIN(2, 10),	/* VI0_DATA6 */
> +		[10] = RCAR_GP_PIN(2, 11),	/* VI0_DATA7 */
> +		[11] = RCAR_GP_PIN(2, 12),	/* VI0_DATA8 */
> +		[12] = RCAR_GP_PIN(2, 13),	/* VI0_DATA9 */
> +		[13] = RCAR_GP_PIN(2, 14),	/* VI0_DATA10 */
> +		[14] = RCAR_GP_PIN(2, 15),	/* VI0_DATA11 */
> +		[15] = RCAR_GP_PIN(2, 16),	/* VI0_FIELD */
> +		[16] = RCAR_GP_PIN(3, 0),	/* VI1_CLK */
> +		[17] = RCAR_GP_PIN(3, 1),	/* VI1_CLKENB */
> +		[18] = RCAR_GP_PIN(3, 2),	/* VI1_HSYNC# */
> +		[19] = RCAR_GP_PIN(3, 3),	/* VI1_VSYNC# */
> +		[20] = RCAR_GP_PIN(3, 4),	/* VI1_DATA0 */
> +		[21] = RCAR_GP_PIN(3, 5),	/* VI1_DATA1 */
> +		[22] = RCAR_GP_PIN(3, 6),	/* VI1_DATA2 */
> +		[23] = RCAR_GP_PIN(3, 7),	/* VI1_DATA3 */
> +		[24] = RCAR_GP_PIN(3, 8),	/* VI1_DATA4 */
> +		[25] = RCAR_GP_PIN(3, 9),	/* VI1_DATA5 */
> +		[26] = RCAR_GP_PIN(3, 10),	/* VI1_DATA6 */
> +		[27] = RCAR_GP_PIN(3, 11),	/* VI1_DATA7 */
> +		[28] = RCAR_GP_PIN(3, 12),	/* VI1_DATA8 */
> +		[29] = RCAR_GP_PIN(3, 13),	/* VI1_DATA9 */
> +		[30] = RCAR_GP_PIN(3, 14),	/* VI1_DATA10 */
> +		[31] = RCAR_GP_PIN(3, 15),	/* VI1_DATA11 */
> +	} },
> +	{ PINMUX_BIAS_REG("PUEN2", 0xe6060408, "PUD2", 0xe6060448) {
> +		[ 0] = RCAR_GP_PIN(3, 16),	/* VI1_FIELD */
> +		[ 1] = RCAR_GP_PIN(4, 0),	/* SCL0 */
> +		[ 2] = RCAR_GP_PIN(4, 1),	/* SDA0 */
> +		[ 3] = RCAR_GP_PIN(4, 2),	/* SCL1 */
> +		[ 4] = RCAR_GP_PIN(4, 3),	/* SDA1 */
> +		[ 5] = RCAR_GP_PIN(4, 4),	/* SCL2 */
> +		[ 6] = RCAR_GP_PIN(4, 5),	/* SDA2 */
> +		[ 7] = RCAR_GP_PIN(1, 1),	/* AVB0_RX_CTL */
> +		[ 8] = RCAR_GP_PIN(1, 2),	/* AVB0_RXC */
> +		[ 9] = RCAR_GP_PIN(1, 3),	/* AVB0_RD0 */
> +		[10] = RCAR_GP_PIN(1, 4),	/* AVB0_RD1 */
> +		[11] = RCAR_GP_PIN(1, 5),	/* AVB0_RD2 */
> +		[12] = RCAR_GP_PIN(1, 6),	/* AVB0_RD3 */
> +		[13] = RCAR_GP_PIN(1, 7),	/* AVB0_TX_CTL */
> +		[14] = RCAR_GP_PIN(1, 8),	/* AVB0_TXC */
> +		[15] = RCAR_GP_PIN(1, 9),	/* AVB0_TD0 */
> +		[16] = RCAR_GP_PIN(1, 10),	/* AVB0_TD1 */
> +		[17] = RCAR_GP_PIN(1, 11),	/* AVB0_TD2 */
> +		[18] = RCAR_GP_PIN(1, 12),	/* AVB0_TD3 */
> +		[19] = RCAR_GP_PIN(1, 13),	/* AVB0_TXCREFCLK */
> +		[20] = RCAR_GP_PIN(1, 14),	/* AVB0_MDIO */
> +		[21] = RCAR_GP_PIN(1, 15),	/* AVB0_MDC */
> +		[22] = RCAR_GP_PIN(1, 16),	/* AVB0_MAGIC */
> +		[23] = RCAR_GP_PIN(1, 17),	/* AVB0_PHY_INT */
> +		[24] = RCAR_GP_PIN(1, 18),	/* AVB0_LINK */
> +		[25] = RCAR_GP_PIN(1, 19),	/* AVB0_AVTP_MATCH */
> +		[26] = RCAR_GP_PIN(1, 20),	/* AVB0_AVTP_CAPTURE */
> +		[27] = RCAR_GP_PIN(1, 21),	/* CANFD0_TX_A */
> +		[28] = RCAR_GP_PIN(1, 22),	/* CANFD0_RX_A */
> +		[29] = RCAR_GP_PIN(1, 23),	/* CANFD1_TX */
> +		[30] = RCAR_GP_PIN(1, 24),	/* CANFD1_RX */
> +		[31] = RCAR_GP_PIN(1, 25),	/* CANFD_CLK */
> +	} },
> +	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
> +		[ 0] = RCAR_GP_PIN(5, 0),	/* QSPI0_SPCLK */
> +		[ 1] = RCAR_GP_PIN(5, 1),	/* QSPI0_MOSI_IO0 */
> +		[ 2] = RCAR_GP_PIN(5, 2),	/* QSPI0_MISO_IO1 */
> +		[ 3] = RCAR_GP_PIN(5, 3),	/* QSPI0_IO2 */
> +		[ 4] = RCAR_GP_PIN(5, 4),	/* QSPI0_IO3 */
> +		[ 5] = RCAR_GP_PIN(5, 5),	/* QSPI0_SSL */
> +		[ 6] = RCAR_GP_PIN(5, 6),	/* QSPI1_SPCLK */
> +		[ 7] = RCAR_GP_PIN(5, 7),	/* QSPI1_MOSI_IO0 */
> +		[ 8] = RCAR_GP_PIN(5, 8),	/* QSPI1_MISO_IO1 */
> +		[ 9] = RCAR_GP_PIN(5, 9),	/* QSPI1_IO2 */
> +		[10] = RCAR_GP_PIN(5, 10),	/* QSPI1_IO3 */
> +		[11] = RCAR_GP_PIN(5, 11),	/* QSPI1_SSL */
> +		[12] = RCAR_GP_PIN(5, 12),	/* RPC_RESET# */
> +		[13] = RCAR_GP_PIN(5, 13),	/* RPC_WP# */
> +		[14] = RCAR_GP_PIN(5, 14),	/* RPC_INT# */
> +		[15] = RCAR_GP_PIN(1, 26),	/* DIGRF_CLKIN */
> +		[16] = RCAR_GP_PIN(1, 27),	/* DIGRF_CLKOUT */
> +		[17] = SH_PFC_PIN_NONE,
> +		[18] = SH_PFC_PIN_NONE,
> +		[19] = SH_PFC_PIN_NONE,
> +		[20] = SH_PFC_PIN_NONE,
> +		[21] = SH_PFC_PIN_NONE,
> +		[22] = SH_PFC_PIN_NONE,
> +		[23] = SH_PFC_PIN_NONE,
> +		[24] = SH_PFC_PIN_NONE,
> +		[25] = SH_PFC_PIN_NONE,
> +		[26] = SH_PFC_PIN_NONE,
> +		[27] = SH_PFC_PIN_NONE,
> +		[28] = SH_PFC_PIN_NONE,
> +		[29] = SH_PFC_PIN_NONE,
> +		[30] = SH_PFC_PIN_NONE,
> +		[31] = SH_PFC_PIN_NONE,
> +	} },
> +	{ /* sentinel */ }
> +};
> +
>  static const struct sh_pfc_soc_operations pinmux_ops = {
>  	.pin_to_pocctrl = r8a77970_pin_to_pocctrl,
> +	.get_bias = rcar_pinmux_get_bias,
> +	.set_bias = rcar_pinmux_set_bias,
>  };
>  
>  const struct sh_pfc_soc_info r8a77970_pinmux_info = {
> @@ -2515,6 +2677,7 @@ const struct sh_pfc_soc_info r8a77970_pinmux_info = {
>  	.nr_functions = ARRAY_SIZE(pinmux_functions),
>  
>  	.cfg_regs = pinmux_config_regs,
> +	.bias_regs = pinmux_bias_regs,
>  	.ioctrl_regs = pinmux_ioctrl_regs,
>  
>  	.pinmux_data = pinmux_data,
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund

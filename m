Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC53370686
	for <lists+linux-gpio@lfdr.de>; Sat,  1 May 2021 11:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhEAJF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 May 2021 05:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbhEAJFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 May 2021 05:05:25 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99ACC06138B
        for <linux-gpio@vger.kernel.org>; Sat,  1 May 2021 02:04:33 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j4so771490lfp.0
        for <linux-gpio@vger.kernel.org>; Sat, 01 May 2021 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Du7OiAqV1rSEzm4sNLCp0y+ZtYrBFpnViZ7aWVnR47w=;
        b=rYPqyZ0zRCFNA0F8K1UPj7yyl38nFroofKptwnzekVoji0rBqWBqAz01RNO96tA+WF
         zF8UShehePGD7K2XHPFXbulxn1hWgwpQwTnGr18jMgtFUrh9gRuXoQVh0wMXhbSbjl0s
         1TIn6+jDEyyWMVVDUQ01U+wNPfOgOzFKIbsCPGzpBkluqBeOhDRtGc/2wTck/nydYcPc
         UoO6qkPoveGQ755hPpmKflgk60o61Je6xxzpFG2bgWbxjgy1jAsouIEFGaifRht8r6GQ
         je+4VFRQebZj2qzxPoWX+GgwK02TRWLeGHHBT2b+cNqX8jLnJm0boCqGdfPW3YNhCcMA
         uXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Du7OiAqV1rSEzm4sNLCp0y+ZtYrBFpnViZ7aWVnR47w=;
        b=iWbXfPzB2NwU1sSQnC/z+/2oi102rtObNxuA0cxwa0vVGOdlGK19fZyMZ3OrW+Zby/
         iQ04xPM9JyyT0fg/Wj1KTP1m/bMylgfDNIOZMy4JdQsHG+Fct+fvY45+q08d98z3w5uT
         1hbApRnhxfk3HZETixwDGUs7W5uvlBtO0/ywRrpWfuq7dadFnQcu+MAf1o0fEeZzno8v
         DtOHP6ki4OG5omz8SDK5x7PjZIcJFdnuViHlQmXVmwixUNAiqWQX4A/poab5hQmQmgb3
         Ehgwzf5C24WOpDXWqrh2p7qxJtvng57xCfDa62dPp05rvH9ys5QiliazLmWK1QswLLtB
         dMHA==
X-Gm-Message-State: AOAM530HN1b+iHUeJ8jQwWvmuunZ3pR8jp3e48JkpiJzzuFlcd59Xbmb
        oF43fATk0HmMIIONUrFwsfQKmA==
X-Google-Smtp-Source: ABdhPJwOQTwnsanx2dIeqJw9VyOZrRMyuQAojGa0rs9ECxHGUfhAGdc1JSs+K3YhE3DmBCA3qaKTzA==
X-Received: by 2002:a05:6512:308a:: with SMTP id z10mr6396918lfd.15.1619859872295;
        Sat, 01 May 2021 02:04:32 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id d15sm526617lfs.21.2021.05.01.02.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 02:04:31 -0700 (PDT)
Date:   Sat, 1 May 2021 11:04:31 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/12] pinctrl: renesas: r8a7790: Add bias pinconf support
Message-ID: <YI0Zn2xBED8WfNJX@oden.dyn.berto.se>
References: <cover.1619785375.git.geert+renesas@glider.be>
 <dde6e0b36a4e4494039a3466df208b5ec5c594ee.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dde6e0b36a4e4494039a3466df208b5ec5c594ee.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2021-04-30 14:31:06 +0200, Geert Uytterhoeven wrote:
> Implement support for pull-up (most pins) and pull-down (ASEBRK#/ACK)
> handling for R-Car H2 and RZ/G1H SoCs, using the common R-Car bias
> handling.
> 
> Note that on RZ/G1H, the "ASEBRK#/ACK" pin is called "ACK", but the code
> doesn't handle that naming difference.  Hence users should use the R-Car
> naming in DTS files.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Not verified each pin with the datasheet, but the schematics looks good,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pfc-r8a7790.c | 301 +++++++++++++++++++++++++-
>  1 file changed, 294 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
> index e9a64e0e27348b98..08c0a23edf680751 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7790.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
> @@ -21,18 +21,23 @@
>   * which case they support both 3.3V and 1.8V signalling.
>   */
>  #define CPU_ALL_GP(fn, sfx)						\
> -	PORT_GP_32(0, fn, sfx),						\
> -	PORT_GP_30(1, fn, sfx),						\
> -	PORT_GP_30(2, fn, sfx),						\
> -	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
> -	PORT_GP_32(4, fn, sfx),						\
> -	PORT_GP_32(5, fn, sfx)
> +	PORT_GP_CFG_32(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_30(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_30(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
> +	PORT_GP_CFG_32(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_32(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
>  
>  #define CPU_ALL_NOGP(fn)		\
> +	PIN_NOGP_CFG(ASEBRK_N_ACK, "ASEBRK#/ACK", fn, SH_PFC_PIN_CFG_PULL_DOWN), \
>  	PIN_NOGP(IIC0_SDA, "AF15", fn),	\
>  	PIN_NOGP(IIC0_SCL, "AG15", fn),	\
>  	PIN_NOGP(IIC3_SDA, "AH15", fn),	\
> -	PIN_NOGP(IIC3_SCL, "AJ15", fn)
> +	PIN_NOGP(IIC3_SCL, "AJ15", fn), \
> +	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),	\
> +	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),	\
> +	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),	\
> +	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
>  
>  enum {
>  	PINMUX_RESERVED = 0,
> @@ -5992,6 +5997,284 @@ static int r8a7790_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
>  	return 31 - (pin & 0x1f);
>  }
>  
> +static const struct pinmux_bias_reg pinmux_bias_regs[] = {
> +	{ PINMUX_BIAS_REG("PUPR0", 0xe6060100, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(0, 16),	/* A0 */
> +		[ 1] = RCAR_GP_PIN(0, 17),	/* A1 */
> +		[ 2] = RCAR_GP_PIN(0, 18),	/* A2 */
> +		[ 3] = RCAR_GP_PIN(0, 19),	/* A3 */
> +		[ 4] = RCAR_GP_PIN(0, 20),	/* A4 */
> +		[ 5] = RCAR_GP_PIN(0, 21),	/* A5 */
> +		[ 6] = RCAR_GP_PIN(0, 22),	/* A6 */
> +		[ 7] = RCAR_GP_PIN(0, 23),	/* A7 */
> +		[ 8] = RCAR_GP_PIN(0, 24),	/* A8 */
> +		[ 9] = RCAR_GP_PIN(0, 25),	/* A9 */
> +		[10] = RCAR_GP_PIN(0, 26),	/* A10 */
> +		[11] = RCAR_GP_PIN(0, 27),	/* A11 */
> +		[12] = RCAR_GP_PIN(0, 28),	/* A12 */
> +		[13] = RCAR_GP_PIN(0, 29),	/* A13 */
> +		[14] = RCAR_GP_PIN(0, 30),	/* A14 */
> +		[15] = RCAR_GP_PIN(0, 31),	/* A15 */
> +		[16] = RCAR_GP_PIN(1, 0),	/* A16 */
> +		[17] = RCAR_GP_PIN(1, 1),	/* A17 */
> +		[18] = RCAR_GP_PIN(1, 2),	/* A18 */
> +		[19] = RCAR_GP_PIN(1, 3),	/* A19 */
> +		[20] = RCAR_GP_PIN(1, 4),	/* A20 */
> +		[21] = RCAR_GP_PIN(1, 5),	/* A21 */
> +		[22] = RCAR_GP_PIN(1, 6),	/* A22 */
> +		[23] = RCAR_GP_PIN(1, 7),	/* A23 */
> +		[24] = RCAR_GP_PIN(1, 8),	/* A24 */
> +		[25] = RCAR_GP_PIN(1, 9),	/* A25 */
> +		[26] = RCAR_GP_PIN(1, 12),	/* EX_CS0# */
> +		[27] = RCAR_GP_PIN(1, 13),	/* EX_CS1# */
> +		[28] = RCAR_GP_PIN(1, 14),	/* EX_CS2# */
> +		[29] = RCAR_GP_PIN(1, 15),	/* EX_CS3# */
> +		[30] = RCAR_GP_PIN(1, 16),	/* EX_CS4# */
> +		[31] = RCAR_GP_PIN(1, 17),	/* EX_CS5# */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR1", 0xe6060104, "N/A", 0) {
> +		/* PUPR1 pull-up pins */
> +		[ 0] = RCAR_GP_PIN(1, 18),	/* BS# */
> +		[ 1] = RCAR_GP_PIN(1, 19),	/* RD# */
> +		[ 2] = RCAR_GP_PIN(1, 20),	/* RD/WR# */
> +		[ 3] = RCAR_GP_PIN(1, 21),	/* WE0# */
> +		[ 4] = RCAR_GP_PIN(1, 22),	/* WE1# */
> +		[ 5] = RCAR_GP_PIN(1, 23),	/* EX_WAIT0 */
> +		[ 6] = RCAR_GP_PIN(5, 24),	/* AVS1 */
> +		[ 7] = RCAR_GP_PIN(5, 25),	/* AVS2 */
> +		[ 8] = RCAR_GP_PIN(1, 10),	/* CS0# */
> +		[ 9] = RCAR_GP_PIN(1, 11),	/* CS1#/A26 */
> +		[10] = PIN_TRST_N,		/* TRST# */
> +		[11] = PIN_TCK,			/* TCK */
> +		[12] = PIN_TMS,			/* TMS */
> +		[13] = PIN_TDI,			/* TDI */
> +		[14] = SH_PFC_PIN_NONE,
> +		[15] = SH_PFC_PIN_NONE,
> +		[16] = RCAR_GP_PIN(0, 0),	/* D0 */
> +		[17] = RCAR_GP_PIN(0, 1),	/* D1 */
> +		[18] = RCAR_GP_PIN(0, 2),	/* D2 */
> +		[19] = RCAR_GP_PIN(0, 3),	/* D3 */
> +		[20] = RCAR_GP_PIN(0, 4),	/* D4 */
> +		[21] = RCAR_GP_PIN(0, 5),	/* D5 */
> +		[22] = RCAR_GP_PIN(0, 6),	/* D6 */
> +		[23] = RCAR_GP_PIN(0, 7),	/* D7 */
> +		[24] = RCAR_GP_PIN(0, 8),	/* D8 */
> +		[25] = RCAR_GP_PIN(0, 9),	/* D9 */
> +		[26] = RCAR_GP_PIN(0, 10),	/* D10 */
> +		[27] = RCAR_GP_PIN(0, 11),	/* D11 */
> +		[28] = RCAR_GP_PIN(0, 12),	/* D12 */
> +		[29] = RCAR_GP_PIN(0, 13),	/* D13 */
> +		[30] = RCAR_GP_PIN(0, 14),	/* D14 */
> +		[31] = RCAR_GP_PIN(0, 15),	/* D15 */
> +	} },
> +	{ PINMUX_BIAS_REG("N/A", 0, "PUPR1", 0xe6060104) {
> +		/* PUPR1 pull-down pins */
> +		[ 0] = SH_PFC_PIN_NONE,
> +		[ 1] = SH_PFC_PIN_NONE,
> +		[ 2] = SH_PFC_PIN_NONE,
> +		[ 3] = SH_PFC_PIN_NONE,
> +		[ 4] = SH_PFC_PIN_NONE,
> +		[ 5] = SH_PFC_PIN_NONE,
> +		[ 6] = SH_PFC_PIN_NONE,
> +		[ 7] = SH_PFC_PIN_NONE,
> +		[ 8] = SH_PFC_PIN_NONE,
> +		[ 9] = SH_PFC_PIN_NONE,
> +		[10] = SH_PFC_PIN_NONE,
> +		[11] = SH_PFC_PIN_NONE,
> +		[12] = SH_PFC_PIN_NONE,
> +		[13] = SH_PFC_PIN_NONE,
> +		[14] = SH_PFC_PIN_NONE,
> +		[15] = PIN_ASEBRK_N_ACK,	/* ASEBRK#/ACK */
> +		[16] = SH_PFC_PIN_NONE,
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
> +	{ PINMUX_BIAS_REG("PUPR2", 0xe6060108, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(5, 28),	/* DU_DOTCLKIN2 */
> +		[ 1] = SH_PFC_PIN_NONE,
> +		[ 2] = SH_PFC_PIN_NONE,
> +		[ 3] = SH_PFC_PIN_NONE,
> +		[ 4] = SH_PFC_PIN_NONE,
> +		[ 5] = RCAR_GP_PIN(2, 0),	/* VI0_CLK */
> +		[ 6] = RCAR_GP_PIN(2, 1),	/* VI0_DATA0_VI0_B0 */
> +		[ 7] = RCAR_GP_PIN(2, 2),	/* VI0_DATA1_VI0_B1 */
> +		[ 8] = RCAR_GP_PIN(2, 3),	/* VI0_DATA2_VI0_B2 */
> +		[ 9] = RCAR_GP_PIN(2, 4),	/* VI0_DATA3_VI0_B3 */
> +		[10] = RCAR_GP_PIN(2, 5),	/* VI0_DATA4_VI0_B4 */
> +		[11] = RCAR_GP_PIN(2, 6),	/* VI0_DATA5_VI0_B5 */
> +		[12] = RCAR_GP_PIN(2, 7),	/* VI0_DATA6_VI0_B6 */
> +		[13] = RCAR_GP_PIN(2, 8),	/* VI0_DATA7_VI0_B7 */
> +		[14] = RCAR_GP_PIN(2, 9),	/* VI1_CLK */
> +		[15] = RCAR_GP_PIN(2, 10),	/* VI1_DATA0_VI1_B0 */
> +		[16] = RCAR_GP_PIN(2, 11),	/* VI1_DATA1_VI1_B1 */
> +		[17] = RCAR_GP_PIN(2, 12),	/* VI1_DATA2_VI1_B2 */
> +		[18] = RCAR_GP_PIN(2, 13),	/* VI1_DATA3_VI1_B3 */
> +		[19] = RCAR_GP_PIN(2, 14),	/* VI1_DATA4_VI1_B4 */
> +		[20] = RCAR_GP_PIN(2, 15),	/* VI1_DATA5_VI1_B5 */
> +		[21] = RCAR_GP_PIN(2, 16),	/* VI1_DATA6_VI1_B6 */
> +		[22] = RCAR_GP_PIN(2, 17),	/* VI1_DATA7_VI1_B7 */
> +		[23] = RCAR_GP_PIN(5, 27),	/* DU_DOTCLKIN1 */
> +		[24] = SH_PFC_PIN_NONE,
> +		[25] = SH_PFC_PIN_NONE,
> +		[26] = SH_PFC_PIN_NONE,
> +		[27] = RCAR_GP_PIN(4, 0),	/* MLB_CLK */
> +		[28] = RCAR_GP_PIN(4, 1),	/* MLB_SIG */
> +		[29] = RCAR_GP_PIN(4, 2),	/* MLB_DAT */
> +		[30] = SH_PFC_PIN_NONE,
> +		[31] = RCAR_GP_PIN(5, 26),	/* DU_DOTCLKIN0 */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR3", 0xe606010c, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(3, 0),	/* SD0_CLK */
> +		[ 1] = RCAR_GP_PIN(3, 1),	/* SD0_CMD */
> +		[ 2] = RCAR_GP_PIN(3, 2),	/* SD0_DAT0 */
> +		[ 3] = RCAR_GP_PIN(3, 3),	/* SD0_DAT1 */
> +		[ 4] = RCAR_GP_PIN(3, 4),	/* SD0_DAT2 */
> +		[ 5] = RCAR_GP_PIN(3, 5),	/* SD0_DAT3 */
> +		[ 6] = RCAR_GP_PIN(3, 6),	/* SD0_CD */
> +		[ 7] = RCAR_GP_PIN(3, 7),	/* SD0_WP */
> +		[ 8] = RCAR_GP_PIN(3, 8),	/* SD1_CLK */
> +		[ 9] = RCAR_GP_PIN(3, 9),	/* SD1_CMD */
> +		[10] = RCAR_GP_PIN(3, 10),	/* SD1_DAT0 */
> +		[11] = RCAR_GP_PIN(3, 11),	/* SD1_DAT1 */
> +		[12] = RCAR_GP_PIN(3, 12),	/* SD1_DAT2 */
> +		[13] = RCAR_GP_PIN(3, 13),	/* SD1_DAT3 */
> +		[14] = RCAR_GP_PIN(3, 14),	/* SD1_CD */
> +		[15] = RCAR_GP_PIN(3, 15),	/* SD1_WP */
> +		[16] = RCAR_GP_PIN(3, 16),	/* SD2_CLK */
> +		[17] = RCAR_GP_PIN(3, 17),	/* SD2_CMD */
> +		[18] = RCAR_GP_PIN(3, 18),	/* SD2_DAT0 */
> +		[19] = RCAR_GP_PIN(3, 19),	/* SD2_DAT1 */
> +		[20] = RCAR_GP_PIN(3, 20),	/* SD2_DAT2 */
> +		[21] = RCAR_GP_PIN(3, 21),	/* SD2_DAT3 */
> +		[22] = RCAR_GP_PIN(3, 22),	/* SD2_CD */
> +		[23] = RCAR_GP_PIN(3, 23),	/* SD2_WP */
> +		[24] = RCAR_GP_PIN(3, 24),	/* SD3_CLK */
> +		[25] = RCAR_GP_PIN(3, 25),	/* SD3_CMD */
> +		[26] = RCAR_GP_PIN(3, 26),	/* SD3_DAT0 */
> +		[27] = RCAR_GP_PIN(3, 27),	/* SD3_DAT1 */
> +		[28] = RCAR_GP_PIN(3, 28),	/* SD3_DAT2 */
> +		[29] = RCAR_GP_PIN(3, 29),	/* SD3_DAT3 */
> +		[30] = RCAR_GP_PIN(3, 30),	/* SD3_CD */
> +		[31] = RCAR_GP_PIN(3, 31),	/* SD3_WP */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR4", 0xe6060110, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(4, 3),	/* SSI_SCK0129 */
> +		[ 1] = RCAR_GP_PIN(4, 4),	/* SSI_WS0129 */
> +		[ 2] = RCAR_GP_PIN(4, 5),	/* SSI_SDATA0 */
> +		[ 3] = RCAR_GP_PIN(4, 6),	/* SSI_SDATA1 */
> +		[ 4] = RCAR_GP_PIN(4, 7),	/* SSI_SDATA2 */
> +		[ 5] = RCAR_GP_PIN(4, 8),	/* SSI_SCK34 */
> +		[ 6] = RCAR_GP_PIN(4, 9),	/* SSI_WS34 */
> +		[ 7] = RCAR_GP_PIN(4, 10),	/* SSI_SDATA3 */
> +		[ 8] = RCAR_GP_PIN(4, 11),	/* SSI_SCK4 */
> +		[ 9] = RCAR_GP_PIN(4, 12),	/* SSI_WS4 */
> +		[10] = RCAR_GP_PIN(4, 13),	/* SSI_SDATA4 */
> +		[11] = RCAR_GP_PIN(4, 14),	/* SSI_SCK5 */
> +		[12] = RCAR_GP_PIN(4, 15),	/* SSI_WS5 */
> +		[13] = RCAR_GP_PIN(4, 16),	/* SSI_SDATA5 */
> +		[14] = RCAR_GP_PIN(4, 17),	/* SSI_SCK6 */
> +		[15] = RCAR_GP_PIN(4, 18),	/* SSI_WS6 */
> +		[16] = RCAR_GP_PIN(4, 19),	/* SSI_SDATA6 */
> +		[17] = RCAR_GP_PIN(4, 20),	/* SSI_SCK78 */
> +		[18] = RCAR_GP_PIN(4, 21),	/* SSI_WS78 */
> +		[19] = RCAR_GP_PIN(4, 22),	/* SSI_SDATA7 */
> +		[20] = RCAR_GP_PIN(4, 23),	/* SSI_SDATA8 */
> +		[21] = RCAR_GP_PIN(4, 24),	/* SSI_SDATA9 */
> +		[22] = RCAR_GP_PIN(4, 25),	/* AUDIO_CLKA */
> +		[23] = RCAR_GP_PIN(4, 26),	/* AUDIO_CLKB */
> +		[24] = RCAR_GP_PIN(1, 24),	/* DREQ0 */
> +		[25] = RCAR_GP_PIN(1, 25),	/* DACK0 */
> +		[26] = RCAR_GP_PIN(1, 26),	/* DREQ1 */
> +		[27] = RCAR_GP_PIN(1, 27),	/* DACK1 */
> +		[28] = RCAR_GP_PIN(1, 28),	/* DREQ2 */
> +		[29] = RCAR_GP_PIN(1, 29),	/* DACK2 */
> +		[30] = RCAR_GP_PIN(2, 18),	/* ETH_CRS_DV */
> +		[31] = RCAR_GP_PIN(2, 19),	/* ETH_RX_ER */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR5", 0xe6060114, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(4, 27),	/* SCIFA0_SCK */
> +		[ 1] = RCAR_GP_PIN(4, 28),	/* SCIFA0_RXD */
> +		[ 2] = RCAR_GP_PIN(4, 29),	/* SCIFA0_TXD */
> +		[ 3] = RCAR_GP_PIN(4, 30),	/* SCIFA0_CTS# */
> +		[ 4] = RCAR_GP_PIN(4, 31),	/* SCIFA0_RTS# */
> +		[ 5] = RCAR_GP_PIN(5, 0),	/* SCIFA1_RXD */
> +		[ 6] = RCAR_GP_PIN(5, 1),	/* SCIFA1_TXD */
> +		[ 7] = RCAR_GP_PIN(5, 2),	/* SCIFA1_CTS# */
> +		[ 8] = RCAR_GP_PIN(5, 3),	/* SCIFA1_RTS# */
> +		[ 9] = RCAR_GP_PIN(5, 4),	/* SCIFA2_SCK */
> +		[10] = RCAR_GP_PIN(5, 5),	/* SCIFA2_RXD */
> +		[11] = RCAR_GP_PIN(5, 6),	/* SCIFA2_TXD */
> +		[12] = RCAR_GP_PIN(5, 7),	/* HSCK0 */
> +		[13] = RCAR_GP_PIN(5, 8),	/* HRX0 */
> +		[14] = RCAR_GP_PIN(5, 9),	/* HTX0 */
> +		[15] = RCAR_GP_PIN(5, 10),	/* HCTS0# */
> +		[16] = RCAR_GP_PIN(5, 11),	/* HRTS0# */
> +		[17] = RCAR_GP_PIN(5, 12),	/* MSIOF0_SCK */
> +		[18] = RCAR_GP_PIN(5, 13),	/* MSIOF0_SYNC */
> +		[19] = RCAR_GP_PIN(5, 14),	/* MSIOF0_SS1 */
> +		[20] = RCAR_GP_PIN(5, 15),	/* MSIOF0_TXD */
> +		[21] = RCAR_GP_PIN(5, 16),	/* MSIOF0_SS2 */
> +		[22] = RCAR_GP_PIN(5, 17),	/* MSIOF0_RXD */
> +		[23] = RCAR_GP_PIN(5, 18),	/* USB0_PWEN */
> +		[24] = RCAR_GP_PIN(5, 19),	/* USB0_OVC_VBUS */
> +		[25] = RCAR_GP_PIN(5, 20),	/* USB1_PWEN */
> +		[26] = RCAR_GP_PIN(5, 21),	/* USB1_OVC */
> +		[27] = RCAR_GP_PIN(5, 22),	/* USB2_PWEN */
> +		[28] = RCAR_GP_PIN(5, 23),	/* USB2_OVC */
> +		[29] = RCAR_GP_PIN(2, 20),	/* ETH_RXD0 */
> +		[30] = RCAR_GP_PIN(2, 21),	/* ETH_RXD1 */
> +		[31] = RCAR_GP_PIN(2, 22),	/* ETH_LINK */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR6", 0xe6060118, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(2, 23),	/* ETH_REF_CLK */
> +		[ 1] = RCAR_GP_PIN(2, 24),	/* ETH_MDIO */
> +		[ 2] = RCAR_GP_PIN(2, 25),	/* ETH_TXD1 */
> +		[ 3] = RCAR_GP_PIN(2, 26),	/* ETH_TX_EN */
> +		[ 4] = RCAR_GP_PIN(2, 27),	/* ETH_MAGIC */
> +		[ 5] = RCAR_GP_PIN(2, 28),	/* ETH_TXD0 */
> +		[ 6] = RCAR_GP_PIN(2, 29),	/* ETH_MDC */
> +		[ 7] = RCAR_GP_PIN(5, 29),	/* PWM0 */
> +		[ 8] = RCAR_GP_PIN(5, 30),	/* PWM1 */
> +		[ 9] = RCAR_GP_PIN(5, 31),	/* PWM2 */
> +		[10] = SH_PFC_PIN_NONE,
> +		[11] = SH_PFC_PIN_NONE,
> +		[12] = SH_PFC_PIN_NONE,
> +		[13] = SH_PFC_PIN_NONE,
> +		[14] = SH_PFC_PIN_NONE,
> +		[15] = SH_PFC_PIN_NONE,
> +		[16] = SH_PFC_PIN_NONE,
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
>  static const struct soc_device_attribute r8a7790_tdsel[] = {
>  	{ .soc_id = "r8a7790", .revision = "ES1.0" },
>  	{ /* sentinel */ }
> @@ -6009,6 +6292,8 @@ static int r8a7790_pinmux_soc_init(struct sh_pfc *pfc)
>  static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
>  	.init = r8a7790_pinmux_soc_init,
>  	.pin_to_pocctrl = r8a7790_pin_to_pocctrl,
> +	.get_bias = rcar_pinmux_get_bias,
> +	.set_bias = rcar_pinmux_set_bias,
>  };
>  
>  #ifdef CONFIG_PINCTRL_PFC_R8A7742
> @@ -6027,6 +6312,7 @@ const struct sh_pfc_soc_info r8a7742_pinmux_info = {
>  	.nr_functions = ARRAY_SIZE(pinmux_functions.common),
>  
>  	.cfg_regs = pinmux_config_regs,
> +	.bias_regs = pinmux_bias_regs,
>  
>  	.pinmux_data = pinmux_data,
>  	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
> @@ -6051,6 +6337,7 @@ const struct sh_pfc_soc_info r8a7790_pinmux_info = {
>  		ARRAY_SIZE(pinmux_functions.automotive),
>  
>  	.cfg_regs = pinmux_config_regs,
> +	.bias_regs = pinmux_bias_regs,
>  
>  	.pinmux_data = pinmux_data,
>  	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund

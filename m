Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952CC3448D9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 16:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhCVPLC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 11:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhCVPKc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 11:10:32 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3935C061756
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 08:10:31 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id r20so21515288ljk.4
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 08:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Iox1qvBueYj324ZkBffRGWdFXUHFDm41jCy+moE7b6o=;
        b=cOR8JNUSskJJ7I95yBNHdIZJyRu5E+/f6Js47nbcLEDqt3mWau9q3j6KbRQGpZQR38
         1ngyTkC2+sdH2VH2zhYTvrZVrVd8isNRnvi2GIWDUSisTrRYZz3CTmwquDMdp6XMVW6l
         FXuQfQyvg6cqArrSZiBDFmxaYFP1KH90a2eT6sjE1nKxEZAXmZ4W3qhRIm31npWOdZD6
         YW3R80t3UK+25k2ZOKwIiaUr0CgLQvfehN4h11nS4+t7wv/R23pJG250L/CKrn/suE2m
         GGWdE6s8y247xeh/+v1C2pHcz5NoeV2RKmcp9pJKD+M9ZW3cBMTBX5eN/0y6Cq7Tu+0W
         6UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Iox1qvBueYj324ZkBffRGWdFXUHFDm41jCy+moE7b6o=;
        b=F8HzJBjXuN9ITcPip/AtfJuZskPyiBDcTc7pYHpd4IqiSMqX7GDUaogO0WaEGZeNbR
         RXlZbAx0g8hrfYbPKM8tBgIEJXonBFTmKpYBEdvxolgXOVKBZZ2SIzS2+20dpTDT2tBK
         h3iY4SZVj/RN97LAnsO/QRwubvBYHusEJl1U4T+3g/UknfQ+R6wAPaeJUkKPDlkyWQk2
         7T8Uk41KVgxANq30GO2qHDVThuCy8n0i5VbO5e8toM7WExnZDrvtm+8rOgQHw9qV01kR
         S21zrxrMX4HMIHdrxy2wzQ9eF0jlv0ZmN3GdaCCaeO7VY6Nzoud274QAvHBqMapnOeoK
         /95g==
X-Gm-Message-State: AOAM531RAajsN4veGmOpQqhrU8Ekm/dFpoGSdED/vEmi3lj5Ij6i3wl4
        sqRqAe5LJSM3qqdAoja71vtHUg==
X-Google-Smtp-Source: ABdhPJwBwM0UyCVKIAadnV8puyzH0pCD0PhTXo6ctz18nL0h4g/FwUTY2V/lG51qMKyE2XFcY4X9zQ==
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr64282lji.312.1616425829929;
        Mon, 22 Mar 2021 08:10:29 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id m8sm1058000lfa.274.2021.03.22.08.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:10:29 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:10:28 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/6] pinctrl: renesas: r8a7791: Add bias pinconf support
Message-ID: <YFizZN9cKb1i2zSb@oden.dyn.berto.se>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
 <20210303132619.3938128-7-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303132619.3938128-7-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-03-03 14:26:19 +0100, Geert Uytterhoeven wrote:
> Implement support for pull-up (most pins) and pull-down (ASEBRK#/ACK)
> handling for R-Car M2-W and M2-N, and RZ/G1M and RZ/G1N SoCs, using the
> common R-Car bias handling.
> 
> Note that on RZ/G1 SoCs, the "ASEBRK#/ACK" pin is called "ACK", but the
> code doesn't handle that naming difference.  Hence users should use the
> R-Car naming in DTS files.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

The tables match what I would expect from the new bias code. I have not 
reviewed all of the registers layout bellow but trust you on that.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pfc-r8a7791.c | 387 ++++++++++++++++++++++++--
>  1 file changed, 371 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
> index 6fce9fe2e98f453e..fe4ccab6b0b8ce02 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7791.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
> @@ -16,22 +16,50 @@
>   * which case they support both 3.3V and 1.8V signalling.
>   */
>  #define CPU_ALL_GP(fn, sfx)						\
> -	PORT_GP_32(0, fn, sfx),						\
> -	PORT_GP_26(1, fn, sfx),						\
> -	PORT_GP_32(2, fn, sfx),						\
> -	PORT_GP_32(3, fn, sfx),						\
> -	PORT_GP_32(4, fn, sfx),						\
> -	PORT_GP_32(5, fn, sfx),						\
> -	PORT_GP_CFG_24(6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
> -	PORT_GP_1(6, 24, fn, sfx),					\
> -	PORT_GP_1(6, 25, fn, sfx),					\
> -	PORT_GP_1(6, 26, fn, sfx),					\
> -	PORT_GP_1(6, 27, fn, sfx),					\
> -	PORT_GP_1(6, 28, fn, sfx),					\
> -	PORT_GP_1(6, 29, fn, sfx),					\
> -	PORT_GP_1(6, 30, fn, sfx),					\
> -	PORT_GP_1(6, 31, fn, sfx),					\
> -	PORT_GP_26(7, fn, sfx)
> +	PORT_GP_CFG_32(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_26(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_32(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_32(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_24(6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
> +	PORT_GP_CFG_1(6, 24, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(6, 25, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(6, 26, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(6, 27, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(6, 28, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(6, 29, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(6, 30, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(6, 31, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_7(7, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_1(7, 7, fn, sfx),					\
> +	PORT_GP_1(7, 8, fn, sfx),					\
> +	PORT_GP_1(7, 9, fn, sfx),					\
> +	PORT_GP_CFG_1(7, 10, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 11, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 12, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 13, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 14, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 15, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 16, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 17, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 18, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 19, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 20, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 21, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 22, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 23, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 24, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PORT_GP_CFG_1(7, 25, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
> +
> +#define CPU_ALL_NOGP(fn)						\
> +	PIN_NOGP_CFG(ASEBRK_N_ACK, "ASEBRK#/ACK", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
> +	PIN_NOGP_CFG(AVS1, "AVS1", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(AVS2, "AVS2", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
>  
>  enum {
>  	PINMUX_RESERVED = 0,
> @@ -1696,8 +1724,17 @@ static const u16 pinmux_data[] = {
>  	PINMUX_IPSR_MSEL(IP16_11_10, CAN1_RX_B, SEL_CAN1_1),
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
>  #if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
> @@ -6645,8 +6682,322 @@ static int r8a7791_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
>  	return 31 - (pin & 0x1f);
>  }
>  
> +static const struct pinmux_bias_reg pinmux_bias_regs[] = {
> +	{ PINMUX_BIAS_REG("PUPR0", 0xe6060100, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(1,  4),	/* A20 */
> +		[ 1] = RCAR_GP_PIN(1,  5),	/* A21 */
> +		[ 2] = RCAR_GP_PIN(1,  6),	/* A22 */
> +		[ 3] = RCAR_GP_PIN(1,  7),	/* A23 */
> +		[ 4] = RCAR_GP_PIN(1,  8),	/* A24 */
> +		[ 5] = RCAR_GP_PIN(6, 31),	/* DU0_DOTCLKIN */
> +		[ 6] = RCAR_GP_PIN(0,  0),	/* D0 */
> +		[ 7] = RCAR_GP_PIN(0,  1),	/* D1 */
> +		[ 8] = RCAR_GP_PIN(0,  2),	/* D2 */
> +		[ 9] = RCAR_GP_PIN(0,  3),	/* D3 */
> +		[10] = RCAR_GP_PIN(0,  4),	/* D4 */
> +		[11] = RCAR_GP_PIN(0,  5),	/* D5 */
> +		[12] = RCAR_GP_PIN(0,  6),	/* D6 */
> +		[13] = RCAR_GP_PIN(0,  7),	/* D7 */
> +		[14] = RCAR_GP_PIN(0,  8),	/* D8 */
> +		[15] = RCAR_GP_PIN(0,  9),	/* D9 */
> +		[16] = RCAR_GP_PIN(0, 10),	/* D10 */
> +		[17] = RCAR_GP_PIN(0, 11),	/* D11 */
> +		[18] = RCAR_GP_PIN(0, 12),	/* D12 */
> +		[19] = RCAR_GP_PIN(0, 13),	/* D13 */
> +		[20] = RCAR_GP_PIN(0, 14),	/* D14 */
> +		[21] = RCAR_GP_PIN(0, 15),	/* D15 */
> +		[22] = RCAR_GP_PIN(0, 16),	/* A0 */
> +		[23] = RCAR_GP_PIN(0, 17),	/* A1 */
> +		[24] = RCAR_GP_PIN(0, 18),	/* A2 */
> +		[25] = RCAR_GP_PIN(0, 19),	/* A3 */
> +		[26] = RCAR_GP_PIN(0, 20),	/* A4 */
> +		[27] = RCAR_GP_PIN(0, 21),	/* A5 */
> +		[28] = RCAR_GP_PIN(0, 22),	/* A6 */
> +		[29] = RCAR_GP_PIN(0, 23),	/* A7 */
> +		[30] = RCAR_GP_PIN(0, 24),	/* A8 */
> +		[31] = RCAR_GP_PIN(0, 25),	/* A9 */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR1", 0xe6060104, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(0, 26),	/* A10 */
> +		[ 1] = RCAR_GP_PIN(0, 27),	/* A11 */
> +		[ 2] = RCAR_GP_PIN(0, 28),	/* A12 */
> +		[ 3] = RCAR_GP_PIN(0, 29),	/* A13 */
> +		[ 4] = RCAR_GP_PIN(0, 30),	/* A14 */
> +		[ 5] = RCAR_GP_PIN(0, 31),	/* A15 */
> +		[ 6] = RCAR_GP_PIN(1,  0),	/* A16 */
> +		[ 7] = RCAR_GP_PIN(1,  1),	/* A17 */
> +		[ 8] = RCAR_GP_PIN(1,  2),	/* A18 */
> +		[ 9] = RCAR_GP_PIN(1,  3),	/* A19 */
> +		[10] = PIN_TRST_N,		/* TRST# */
> +		[11] = PIN_TCK,			/* TCK */
> +		[12] = PIN_TMS,			/* TMS */
> +		[13] = PIN_TDI,			/* TDI */
> +		[14] = RCAR_GP_PIN(1, 11),	/* CS1#/A26 */
> +		[15] = RCAR_GP_PIN(1, 12),	/* EX_CS0# */
> +		[16] = RCAR_GP_PIN(1, 13),	/* EX_CS1# */
> +		[17] = RCAR_GP_PIN(1, 14),	/* EX_CS2# */
> +		[18] = RCAR_GP_PIN(1, 15),	/* EX_CS3# */
> +		[19] = RCAR_GP_PIN(1, 16),	/* EX_CS4# */
> +		[20] = RCAR_GP_PIN(1, 17),	/* EX_CS5# */
> +		[21] = RCAR_GP_PIN(1, 18),	/* BS# */
> +		[22] = RCAR_GP_PIN(1, 19),	/* RD# */
> +		[23] = RCAR_GP_PIN(1, 20),	/* RD/WR# */
> +		[24] = RCAR_GP_PIN(1, 21),	/* WE0# */
> +		[25] = RCAR_GP_PIN(1, 22),	/* WE1# */
> +		[26] = RCAR_GP_PIN(1, 23),	/* EX_WAIT0 */
> +		[27] = RCAR_GP_PIN(1, 24),	/* DREQ0 */
> +		[28] = RCAR_GP_PIN(1, 25),	/* DACK0 */
> +		[29] = RCAR_GP_PIN(5, 31),	/* SPEEDIN */
> +		[30] = RCAR_GP_PIN(2,  0),	/* SSI_SCK0129 */
> +		[31] = RCAR_GP_PIN(2,  1),	/* SSI_WS0129 */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR2", 0xe6060108, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(2,  2),	/* SSI_SDATA0 */
> +		[ 1] = RCAR_GP_PIN(2,  3),	/* SSI_SCK1 */
> +		[ 2] = RCAR_GP_PIN(2,  4),	/* SSI_WS1 */
> +		[ 3] = RCAR_GP_PIN(2,  5),	/* SSI_SDATA1 */
> +		[ 4] = RCAR_GP_PIN(2,  6),	/* SSI_SCK2 */
> +		[ 5] = RCAR_GP_PIN(2,  7),	/* SSI_WS2 */
> +		[ 6] = RCAR_GP_PIN(2,  8),	/* SSI_SDATA2 */
> +		[ 7] = RCAR_GP_PIN(2,  9),	/* SSI_SCK34 */
> +		[ 8] = RCAR_GP_PIN(2, 10),	/* SSI_WS34 */
> +		[ 9] = RCAR_GP_PIN(2, 11),	/* SSI_SDATA3 */
> +		[10] = RCAR_GP_PIN(2, 12),	/* SSI_SCK4 */
> +		[11] = RCAR_GP_PIN(2, 13),	/* SSI_WS4 */
> +		[12] = RCAR_GP_PIN(2, 14),	/* SSI_SDATA4 */
> +		[13] = RCAR_GP_PIN(2, 15),	/* SSI_SCK5 */
> +		[14] = RCAR_GP_PIN(2, 16),	/* SSI_WS5 */
> +		[15] = RCAR_GP_PIN(2, 17),	/* SSI_SDATA5 */
> +		[16] = RCAR_GP_PIN(2, 18),	/* SSI_SCK6 */
> +		[17] = RCAR_GP_PIN(2, 19),	/* SSI_WS6 */
> +		[18] = RCAR_GP_PIN(2, 20),	/* SSI_SDATA6 */
> +		[19] = RCAR_GP_PIN(2, 21),	/* SSI_SCK78 */
> +		[20] = RCAR_GP_PIN(2, 22),	/* SSI_WS78 */
> +		[21] = RCAR_GP_PIN(2, 23),	/* SSI_SDATA7 */
> +		[22] = RCAR_GP_PIN(2, 24),	/* SSI_SDATA8 */
> +		[23] = RCAR_GP_PIN(2, 25),	/* SSI_SCK9 */
> +		[24] = RCAR_GP_PIN(2, 26),	/* SSI_WS9 */
> +		[25] = RCAR_GP_PIN(2, 27),	/* SSI_SDATA9 */
> +		[26] = RCAR_GP_PIN(2, 28),	/* AUDIO_CLKA */
> +		[27] = RCAR_GP_PIN(2, 29),	/* AUDIO_CLKB */
> +		[28] = RCAR_GP_PIN(2, 30),	/* AUDIO_CLKC */
> +		[29] = RCAR_GP_PIN(2, 31),	/* AUDIO_CLKOUT */
> +		[30] = RCAR_GP_PIN(7, 10),	/* IRQ0 */
> +		[31] = RCAR_GP_PIN(7, 11),	/* IRQ1 */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR3", 0xe606010c, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(7, 12),	/* IRQ2 */
> +		[ 1] = RCAR_GP_PIN(7, 13),	/* IRQ3 */
> +		[ 2] = RCAR_GP_PIN(7, 14),	/* IRQ4 */
> +		[ 3] = RCAR_GP_PIN(7, 15),	/* IRQ5 */
> +		[ 4] = RCAR_GP_PIN(7, 16),	/* IRQ6 */
> +		[ 5] = RCAR_GP_PIN(7, 17),	/* IRQ7 */
> +		[ 6] = RCAR_GP_PIN(7, 18),	/* IRQ8 */
> +		[ 7] = RCAR_GP_PIN(7, 19),	/* IRQ9 */
> +		[ 8] = RCAR_GP_PIN(3,  0),	/* DU1_DR0 */
> +		[ 9] = RCAR_GP_PIN(3,  1),	/* DU1_DR1 */
> +		[10] = RCAR_GP_PIN(3,  2),	/* DU1_DR2 */
> +		[11] = RCAR_GP_PIN(3,  3),	/* DU1_DR3 */
> +		[12] = RCAR_GP_PIN(3,  4),	/* DU1_DR4 */
> +		[13] = RCAR_GP_PIN(3,  5),	/* DU1_DR5 */
> +		[14] = RCAR_GP_PIN(3,  6),	/* DU1_DR6 */
> +		[15] = RCAR_GP_PIN(3,  7),	/* DU1_DR7 */
> +		[16] = RCAR_GP_PIN(3,  8),	/* DU1_DG0 */
> +		[17] = RCAR_GP_PIN(3,  9),	/* DU1_DG1 */
> +		[18] = RCAR_GP_PIN(3, 10),	/* DU1_DG2 */
> +		[19] = RCAR_GP_PIN(3, 11),	/* DU1_DG3 */
> +		[20] = RCAR_GP_PIN(3, 12),	/* DU1_DG4 */
> +		[21] = RCAR_GP_PIN(3, 13),	/* DU1_DG5 */
> +		[22] = RCAR_GP_PIN(3, 14),	/* DU1_DG6 */
> +		[23] = RCAR_GP_PIN(3, 15),	/* DU1_DG7 */
> +		[24] = RCAR_GP_PIN(3, 16),	/* DU1_DB0 */
> +		[25] = RCAR_GP_PIN(3, 17),	/* DU1_DB1 */
> +		[26] = RCAR_GP_PIN(3, 18),	/* DU1_DB2 */
> +		[27] = RCAR_GP_PIN(3, 19),	/* DU1_DB3 */
> +		[28] = RCAR_GP_PIN(3, 20),	/* DU1_DB4 */
> +		[29] = RCAR_GP_PIN(3, 21),	/* DU1_DB5 */
> +		[30] = RCAR_GP_PIN(3, 22),	/* DU1_DB6 */
> +		[31] = RCAR_GP_PIN(3, 23),	/* DU1_DB7 */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR4", 0xe6060110, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(3, 24),	/* DU1_DOTCLKIN */
> +		[ 1] = RCAR_GP_PIN(3, 25),	/* DU1_DOTCLKOUT0 */
> +		[ 2] = RCAR_GP_PIN(3, 26),	/* DU1_DOTCLKOUT1 */
> +		[ 3] = RCAR_GP_PIN(3, 27),	/* DU1_EXHSYNC_DU1_HSYNC */
> +		[ 4] = RCAR_GP_PIN(3, 28),	/* DU1_EXVSYNC_DU1_VSYNC */
> +		[ 5] = RCAR_GP_PIN(3, 29),	/* DU1_EXODDF_DU1_ODDF_DISP_CDE */
> +		[ 6] = RCAR_GP_PIN(3, 30),	/* DU1_DISP */
> +		[ 7] = RCAR_GP_PIN(3, 31),	/* DU1_CDE */
> +		[ 8] = RCAR_GP_PIN(4,  0),	/* VI0_CLK */
> +		[ 9] = RCAR_GP_PIN(4,  1),	/* VI0_CLKENB */
> +		[10] = RCAR_GP_PIN(4,  2),	/* VI0_FIELD */
> +		[11] = RCAR_GP_PIN(4,  3),	/* VI0_HSYNC# */
> +		[12] = RCAR_GP_PIN(4,  4),	/* VI0_VSYNC# */
> +		[13] = RCAR_GP_PIN(4,  5),	/* VI0_DATA0_VI0_B0 */
> +		[14] = RCAR_GP_PIN(4,  6),	/* VI0_DATA1_VI0_B1 */
> +		[15] = RCAR_GP_PIN(4,  7),	/* VI0_DATA2_VI0_B2 */
> +		[16] = RCAR_GP_PIN(4,  8),	/* VI0_DATA3_VI0_B3 */
> +		[17] = RCAR_GP_PIN(4,  9),	/* VI0_DATA4_VI0_B4 */
> +		[18] = RCAR_GP_PIN(4, 10),	/* VI0_DATA5_VI0_B5 */
> +		[19] = RCAR_GP_PIN(4, 11),	/* VI0_DATA6_VI0_B6 */
> +		[20] = RCAR_GP_PIN(4, 12),	/* VI0_DATA7_VI0_B7 */
> +		[21] = RCAR_GP_PIN(4, 13),	/* VI0_G0 */
> +		[22] = RCAR_GP_PIN(4, 14),	/* VI0_G1 */
> +		[23] = RCAR_GP_PIN(4, 15),	/* VI0_G2 */
> +		[24] = RCAR_GP_PIN(4, 16),	/* VI0_G3 */
> +		[25] = RCAR_GP_PIN(4, 17),	/* VI0_G4 */
> +		[26] = RCAR_GP_PIN(4, 18),	/* VI0_G5 */
> +		[27] = RCAR_GP_PIN(4, 19),	/* VI0_G6 */
> +		[28] = RCAR_GP_PIN(4, 20),	/* VI0_G7 */
> +		[29] = RCAR_GP_PIN(4, 21),	/* VI0_R0 */
> +		[30] = RCAR_GP_PIN(4, 22),	/* VI0_R1 */
> +		[31] = RCAR_GP_PIN(4, 23),	/* VI0_R2 */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR5", 0xe6060114, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(4, 24),	/* VI0_R3 */
> +		[ 1] = RCAR_GP_PIN(4, 25),	/* VI0_R4 */
> +		[ 2] = RCAR_GP_PIN(4, 26),	/* VI0_R5 */
> +		[ 3] = RCAR_GP_PIN(4, 27),	/* VI0_R6 */
> +		[ 4] = RCAR_GP_PIN(4, 28),	/* VI0_R7 */
> +		[ 5] = RCAR_GP_PIN(5,  0),	/* VI1_HSYNC# */
> +		[ 6] = RCAR_GP_PIN(5,  1),	/* VI1_VSYNC# */
> +		[ 7] = RCAR_GP_PIN(5,  2),	/* VI1_CLKENB */
> +		[ 8] = RCAR_GP_PIN(5,  3),	/* VI1_FIELD */
> +		[ 9] = RCAR_GP_PIN(5,  4),	/* VI1_CLK */
> +		[10] = RCAR_GP_PIN(5,  5),	/* VI1_DATA0 */
> +		[11] = RCAR_GP_PIN(5,  6),	/* VI1_DATA1 */
> +		[12] = RCAR_GP_PIN(5,  7),	/* VI1_DATA2 */
> +		[13] = RCAR_GP_PIN(5,  8),	/* VI1_DATA3 */
> +		[14] = RCAR_GP_PIN(5,  9),	/* VI1_DATA4 */
> +		[15] = RCAR_GP_PIN(5, 10),	/* VI1_DATA5 */
> +		[16] = RCAR_GP_PIN(5, 11),	/* VI1_DATA6 */
> +		[17] = RCAR_GP_PIN(5, 12),	/* VI1_DATA7 */
> +		[18] = RCAR_GP_PIN(5, 13),	/* ETH_MDIO */
> +		[19] = RCAR_GP_PIN(5, 14),	/* ETH_CRS_DV */
> +		[20] = RCAR_GP_PIN(5, 15),	/* ETH_RX_ER */
> +		[21] = RCAR_GP_PIN(5, 16),	/* ETH_RXD0 */
> +		[22] = RCAR_GP_PIN(5, 17),	/* ETH_RXD1 */
> +		[23] = RCAR_GP_PIN(5, 18),	/* ETH_LINK */
> +		[24] = RCAR_GP_PIN(5, 19),	/* ETH_REFCLK */
> +		[25] = RCAR_GP_PIN(5, 20),	/* ETH_TXD1 */
> +		[26] = RCAR_GP_PIN(5, 21),	/* ETH_TX_EN */
> +		[27] = RCAR_GP_PIN(5, 22),	/* ETH_MAGIC */
> +		[28] = RCAR_GP_PIN(5, 23),	/* ETH_TXD0 */
> +		[29] = RCAR_GP_PIN(5, 24),	/* ETH_MDC */
> +		[30] = RCAR_GP_PIN(5, 25),	/* STP_IVCXO27_0 */
> +		[31] = RCAR_GP_PIN(5, 26),	/* STP_ISCLK_0 */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR6", 0xe6060118, "N/A", 0) {
> +		[ 0] = RCAR_GP_PIN(5, 27),	/* STP_ISD_0 */
> +		[ 1] = RCAR_GP_PIN(5, 28),	/* STP_ISEN_0 */
> +		[ 2] = RCAR_GP_PIN(5, 29),	/* STP_ISSYNC_0 */
> +		[ 3] = RCAR_GP_PIN(5, 30),	/* STP_OPWM_0 */
> +		[ 4] = RCAR_GP_PIN(6,  0),	/* SD0_CLK */
> +		[ 5] = RCAR_GP_PIN(6,  1),	/* SD0_CMD */
> +		[ 6] = RCAR_GP_PIN(6,  2),	/* SD0_DATA0 */
> +		[ 7] = RCAR_GP_PIN(6,  3),	/* SD0_DATA1 */
> +		[ 8] = RCAR_GP_PIN(6,  4),	/* SD0_DATA2 */
> +		[ 9] = RCAR_GP_PIN(6,  5),	/* SD0_DATA3 */
> +		[10] = RCAR_GP_PIN(6,  6),	/* SD0_CD */
> +		[11] = RCAR_GP_PIN(6,  7),	/* SD0_WP */
> +		[12] = RCAR_GP_PIN(6,  8),	/* SD2_CLK */
> +		[13] = RCAR_GP_PIN(6,  9),	/* SD2_CMD */
> +		[14] = RCAR_GP_PIN(6, 10),	/* SD2_DATA0 */
> +		[15] = RCAR_GP_PIN(6, 11),	/* SD2_DATA1 */
> +		[16] = RCAR_GP_PIN(6, 12),	/* SD2_DATA2 */
> +		[17] = RCAR_GP_PIN(6, 13),	/* SD2_DATA3 */
> +		[18] = RCAR_GP_PIN(6, 14),	/* SD2_CD */
> +		[19] = RCAR_GP_PIN(6, 15),	/* SD2_WP */
> +		[20] = RCAR_GP_PIN(6, 16),	/* SD3_CLK */
> +		[21] = RCAR_GP_PIN(6, 17),	/* SD3_CMD */
> +		[22] = RCAR_GP_PIN(6, 18),	/* SD3_DATA0 */
> +		[23] = RCAR_GP_PIN(6, 19),	/* SD3_DATA1 */
> +		[24] = RCAR_GP_PIN(6, 20),	/* SD3_DATA2 */
> +		[25] = RCAR_GP_PIN(6, 21),	/* SD3_DATA3 */
> +		[26] = RCAR_GP_PIN(6, 22),	/* SD3_CD */
> +		[27] = RCAR_GP_PIN(6, 23),	/* SD3_WP */
> +		[28] = RCAR_GP_PIN(6, 24),	/* MSIOF0_SCK */
> +		[29] = RCAR_GP_PIN(6, 25),	/* MSIOF0_SYNC */
> +		[30] = RCAR_GP_PIN(6, 26),	/* MSIOF0_TXD */
> +		[31] = RCAR_GP_PIN(6, 27),	/* MSIOF0_RXD */
> +	} },
> +	{ PINMUX_BIAS_REG("PUPR7", 0xe606011c, "N/A", 0) {
> +		/* PUPR7 pull-up pins */
> +		[ 0] = RCAR_GP_PIN(6, 28),	/* MSIOF0_SS1 */
> +		[ 1] = RCAR_GP_PIN(6, 29),	/* MSIOF0_SS2 */
> +		[ 2] = RCAR_GP_PIN(4, 29),	/* SIM0_RST */
> +		[ 3] = RCAR_GP_PIN(4, 30),	/* SIM0_CLK */
> +		[ 4] = RCAR_GP_PIN(4, 31),	/* SIM0_D */
> +		[ 5] = RCAR_GP_PIN(7, 20),	/* GPS_CLK */
> +		[ 6] = RCAR_GP_PIN(7, 21),	/* GPS_SIGN */
> +		[ 7] = RCAR_GP_PIN(7, 22),	/* GPS_MAG */
> +		[ 8] = RCAR_GP_PIN(7,  0),	/* HCTS0# */
> +		[ 9] = RCAR_GP_PIN(7,  1),	/* HRTS0# */
> +		[10] = RCAR_GP_PIN(7,  2),	/* HSCK0 */
> +		[11] = RCAR_GP_PIN(7,  3),	/* HRX0 */
> +		[12] = RCAR_GP_PIN(7,  4),	/* HTX0 */
> +		[13] = RCAR_GP_PIN(7,  5),	/* HRX1 */
> +		[14] = RCAR_GP_PIN(7,  6),	/* HTX1 */
> +		[15] = SH_PFC_PIN_NONE,
> +		[16] = SH_PFC_PIN_NONE,
> +		[17] = SH_PFC_PIN_NONE,
> +		[18] = RCAR_GP_PIN(1,  9),	/* A25 */
> +		[19] = SH_PFC_PIN_NONE,
> +		[20] = RCAR_GP_PIN(1, 10),	/* CS0# */
> +		[21] = RCAR_GP_PIN(7, 23),	/* USB0_PWEN */
> +		[22] = RCAR_GP_PIN(7, 24),	/* USB0_OVC */
> +		[23] = RCAR_GP_PIN(7, 25),	/* USB1_PWEN */
> +		[24] = RCAR_GP_PIN(6, 30),	/* USB1_OVC */
> +		[25] = PIN_AVS1,		/* AVS1 */
> +		[26] = PIN_AVS2,		/* AVS2 */
> +		[27] = SH_PFC_PIN_NONE,
> +		[28] = SH_PFC_PIN_NONE,
> +		[29] = SH_PFC_PIN_NONE,
> +		[30] = SH_PFC_PIN_NONE,
> +		[31] = SH_PFC_PIN_NONE,
> +	} },
> +	{ PINMUX_BIAS_REG("N/A", 0, "PUPR7", 0xe606011c) {
> +		/* PUPR7 pull-down pins */
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
> +		[15] = SH_PFC_PIN_NONE,
> +		[16] = SH_PFC_PIN_NONE,
> +		[17] = SH_PFC_PIN_NONE,
> +		[18] = SH_PFC_PIN_NONE,
> +		[19] = PIN_ASEBRK_N_ACK,	/* ASEBRK#/ACK */
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
> +	{ /* sentinel */ },
> +};
> +
>  static const struct sh_pfc_soc_operations r8a7791_pinmux_ops = {
>  	.pin_to_pocctrl = r8a7791_pin_to_pocctrl,
> +	.get_bias = rcar_pinmux_get_bias,
> +	.set_bias = rcar_pinmux_set_bias,
>  };
>  
>  #ifdef CONFIG_PINCTRL_PFC_R8A7743
> @@ -6665,6 +7016,7 @@ const struct sh_pfc_soc_info r8a7743_pinmux_info = {
>  	.nr_functions = ARRAY_SIZE(pinmux_functions.common),
>  
>  	.cfg_regs = pinmux_config_regs,
> +	.bias_regs = pinmux_bias_regs,
>  
>  	.pinmux_data = pinmux_data,
>  	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
> @@ -6687,6 +7039,7 @@ const struct sh_pfc_soc_info r8a7744_pinmux_info = {
>  	.nr_functions = ARRAY_SIZE(pinmux_functions.common),
>  
>  	.cfg_regs = pinmux_config_regs,
> +	.bias_regs = pinmux_bias_regs,
>  
>  	.pinmux_data = pinmux_data,
>  	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
> @@ -6711,6 +7064,7 @@ const struct sh_pfc_soc_info r8a7791_pinmux_info = {
>  			ARRAY_SIZE(pinmux_functions.automotive),
>  
>  	.cfg_regs = pinmux_config_regs,
> +	.bias_regs = pinmux_bias_regs,
>  
>  	.pinmux_data = pinmux_data,
>  	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
> @@ -6735,6 +7089,7 @@ const struct sh_pfc_soc_info r8a7793_pinmux_info = {
>  			ARRAY_SIZE(pinmux_functions.automotive),
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

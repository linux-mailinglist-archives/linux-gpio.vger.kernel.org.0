Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5E65469F1
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 17:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244468AbiFJP5u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 11:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238539AbiFJP5u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 11:57:50 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FD869CEC
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jun 2022 08:57:46 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:54ee:7869:f586:4612])
        by baptiste.telenet-ops.be with bizsmtp
        id hTxk270014ZqkGq01Txkrc; Fri, 10 Jun 2022 17:57:44 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nzh15-003Ta2-NO; Fri, 10 Jun 2022 17:57:43 +0200
Date:   Fri, 10 Jun 2022 17:57:43 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/4] pinctrl: renesas: Initial R8A779G0 (V4H) PFC
 support
In-Reply-To: <87v8tdgu1t.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.22.394.2206101756520.828669@ramsan.of.borg>
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com> <87v8tdgu1t.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 	Hi Morimoto-san,

On Tue, 7 Jun 2022, Kuninori Morimoto wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>
> This patch adds initial pinctrl support for the R8A779G0 (V4H) SoC,
> including bias, drive strength and voltage control.
>
> [Morimoto merged Kihara-san's MODSEL8 fixup patch,
> and cleanuped white space, care reserved bit on each configs,
> fixup setting miss]
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

Below is a first set of comments.
You can expect a second set of comments after the weekend.

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -0,0 +1,2467 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R8A779A0 processor support - PFC hardware block.
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + * This file is based on the drivers/pinctrl/renesas/pfc-r8a779a0.c
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +
> +#include "core.h"

There is no need to include "core.h".

> +#include "sh_pfc.h"
> +
> +#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
> +
> +#define CPU_ALL_GP(fn, sfx)								\
> +	PORT_GP_CFG_19(0,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
> +	PORT_GP_CFG_29(1,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\

GP1_23 to GP1_28 do not support voltage control.

> +	PORT_GP_CFG_20(2,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_13(3,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
> +	PORT_GP_CFG_1(3, 13,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 14,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 15,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 16,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 17,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 18,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 19,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 20,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 21,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 22,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 23,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 24,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 25,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 26,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 27,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 28,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_1(3, 29,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_25(4,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_21(5,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_21(6,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_21(7,	fn, sfx, CFG_FLAGS),					\
> +	PORT_GP_CFG_14(8,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33)
> +
> +#define CPU_ALL_NOGP(fn)									\
> +	PIN_NOGP_CFG(PRESETOUT_N,	"PRESETOUT#",	fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\

As the PUDSYS register is not documented, I cannot verify that this pin
supports both pull-up and pull-down.

> +	PIN_NOGP_CFG(PRESETOUT0_N,	"PRESETOUT0#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
> +	PIN_NOGP_CFG(PRESETOUT1_N,	"PRESETOUT1#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\

"PRESETOUT0#" and "PRESETOUT1#" do not seem to exist.

> +	PIN_NOGP_CFG(EXTALR,		"EXTALR",	fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\

As the PUDSYS register is not documented, I cannot verify that this pin
supports both pull-up and pull-down.

> +	PIN_NOGP_CFG(DCUTRST0_N,	"DCUTRST0#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\

DCUTRST_N_LPDRST_N and "DCUTRST#/LPDRST#"?

> +	PIN_NOGP_CFG(DCUTCK0,		"DCUTCK0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\

DCUTCK_LPDCLK and "DCUTCK/LPDCLK"?

> +	PIN_NOGP_CFG(DCUTMS0,		"DCUTMS0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\

DCUTMS and "DCUTMS"?

> +	PIN_NOGP_CFG(DCUTDI0,		"DCUTDI0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\

DCUTDI_LPDI and "DCUTDI/LPDI"?

> +	PIN_NOGP_CFG(DCUTRST1_N,	"DCUTRST1#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
> +	PIN_NOGP_CFG(DCUTCK1,		"DCUTCK1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(DCUTMS1,		"DCUTMS1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(DCUTDI1,		"DCUTDI1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(EVTI_N,		"EVTI#",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(MSYN_N,		"MSYN#",	fn, SH_PFC_PIN_CFG_PULL_UP)

The above 6 pins do not seem to exist.

Regardless of the above, pull up/down support for the NOGP pins is not
supported yet, as this driver does not use PINMUX_NOGP_ALL(), and it
does not have definitions for the PUENSYS register.

Perhaps the CPU_ALL_NOGP() macro should just be dropped for now?

> +/* SR0 */
> +/* IP0SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									^^^^^^^^
Missing TCLK2_A

> +#define IP0SR0_7_4	F_(0, 0)		FM(MSIOF3_SS1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR0_11_8	F_(0, 0)		FM(MSIOF3_SS2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR0_15_12	FM(IRQ3)		FM(MSIOF3_SCK)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR0_19_16	FM(IRQ2)		FM(MSIOF3_TXD)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR0_23_20	FM(IRQ1)		FM(MSIOF3_RXD)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR0_27_24	FM(IRQ0)		FM(MSIOF3_SYNC)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR0_31_28	FM(MSIOF5_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +
> +/* IP1SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP1SR0_3_0	FM(MSIOF5_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR0_7_4	FM(MSIOF5_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR0_11_8	FM(MSIOF5_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR0_15_12	FM(MSIOF5_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR0_19_16	FM(MSIOF5_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR0_23_20	FM(MSIOF2_SS2)		FM(TCLK1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									^^^^^^^^
Missing IRQ2_A

> +#define IP1SR0_27_24	FM(MSIOF2_SS1)		FM(HTX1)		FM(TX1)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR0_31_28	FM(MSIOF2_SYNC)		FM(HRX1)		FM(RX1)		F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +
> +/* IP2SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP2SR0_3_0	FM(MSIOF2_TXD)		FM(HCTS1_N)		FM(CTS1_N)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR0_7_4	FM(MSIOF2_SCK)		FM(HRTS1_N)		FM(RTS1_N)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR0_11_8	FM(MSIOF2_RXD)		FM(HSCK1)		FM(SCK1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR0_15_12	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR0_19_16	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR0_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR0_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR0_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

Due to the recently-introduced reserved field handling, if the
definition of an IPxSRy_n_m() macro consists of a series of "F_(0, 0)"
only, you can just omit that definition, and omit its use in the
definition of the PINMUX_IPSR() macro below.

This applies to several other defitions below.

> +
> +/* SR1 */
> +/* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP0SR1_3_0	FM(MSIOF1_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_7_4	FM(MSIOF1_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_11_8	FM(MSIOF1_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_15_12	FM(MSIOF1_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_19_16	FM(MSIOF1_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 						^^^^^^^^		^^^^^^^^
Missing alternative set "A" for the five HSCIF3 signals
Missing primary set of five SCIF3 signals

> +#define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_27_24	FM(MSIOF0_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_31_28	FM(MSIOF0_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +
> +/* IP1SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP1SR1_3_0	FM(MSIOF0_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR1_7_4	FM(MSIOF0_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 											^^^^^^^^
Missing CANFD5_[TR]X_B

> +#define IP1SR1_11_8	FM(MSIOF0_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 						^^^^^^^^		^^^^^^^^
Missing sets for the five HSCIF1 and five SCIF1 signals.
For both, the set name is not documented, so we do not know if this is
the primary or an alternative set.

> +#define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									   ^^^^
PWM8_A

> +#define IP1SR1_27_24	FM(HRTS0_N)		FM(RTS0_N)		FM(PWM9)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									   ^^^^
PWM9_A

> +#define IP1SR1_31_28	FM(HSCK0)		FM(SCK0)		FM(PWM0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									   ^^^^
PWM0_A

> +
> +/* IP2SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP2SR1_3_0	FM(HRX0)		FM(RX0)			F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_7_4	FM(SCIF_CLK)		FM(IRQ4)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 						   ^^^^
IRQ4_A

> +#define IP2SR1_11_8	FM(SSI_SCK)		FM(TCLK3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_15_12	FM(SSI_WS)		FM(TCLK4)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_19_16	FM(SSI_SD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_23_20	FM(AUDIO_CLKOUT)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 						^^^^^^^^
Missing IRQ0_A and IRQ1_A

> +#define IP2SR1_27_24	FM(AUDIO_CLKIN)		FM(PWM3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 						   ^^^^
PWM3_A

> +#define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 											^^^^^^^^
Missing IRQ3_B

> +
> +/* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP3SR1_3_0	FM(HRX3)		FM(SCK3)		FM(MSIOF4_SS2)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_N)		FM(MSIOF4_SCK)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_N)		FM(MSIOF4_TXD)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 											^^^^^^^^
Missing TPU0TO[01]_A

> +#define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3)			FM(MSIOF4_RXD)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_19_16	FM(HTX3)		FM(TX3)			FM(MSIOF4_SYNC)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 						^^^^^^^^
According to the pin function spreadsheet, thse 5 pins are actually the
"A" set for SCIF3

> +#define IP3SR1_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +
> +/* SR2 */
> +/* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									^^^^^^^^
Missing TPU0TO2_A

> +#define IP0SR2_7_4	FM(FXR_TXENA_N)		FM(CANFD1_RX)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									^^^^^^^^
Missing TPU0TO3_A

> +#define IP0SR2_11_8	FM(RXDA_EXTFXR)		FM(CANFD5_TX)		FM(IRQ5)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									^^^^^^^^
Missing IRQ4_B

> +#define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR2_23_20	FM(FXR_TXENB_N)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR2_27_24	FM(FXR_TXDB)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR2_31_28	FM(TPU0TO1)		FM(CANFD6_TX)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 											^^^^^^^^
Missing TCLK2_B

> +
> +/* IP1SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP1SR2_3_0	FM(TPU0TO0)		FM(CANFD6_RX)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 											^^^^^^^^
Missing TCLK1_A

> +#define IP1SR2_7_4	FM(CAN_CLK)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_11_8	FM(CANFD0_TX)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 						^^^^^^^^
Missing set (undocumented name) for FXR_TXEN[AB]_N.

> +#define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 											^^^^^^^^
Missing TCLK3_A

> +#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									   ^^^^		^^^^^^^^
PWM1_B
Missing TCLK4_A

> +#define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									   ^^^^
PWM2_B

> +#define IP1SR2_31_28	FM(CANFD3_RX)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									^^^^^^^^
Missing PWM3_B

> +
> +/* IP2SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP2SR2_3_0	FM(CANFD4_TX)		F_(0, 0)		FM(PWM4)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_7_4	FM(CANFD4_RX)		F_(0, 0)		FM(PWM5)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_11_8	FM(CANFD7_TX)		F_(0, 0)		FM(PWM6)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_15_12	FM(CANFD7_RX)		F_(0, 0)		FM(PWM7)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_19_16	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_23_20	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_27_24	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_31_28	F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +
> +/* SR3 */
> +/* IP0SR3 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP0SR3_3_0	FM(MMC_SD_D1)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_7_4	FM(MMC_SD_D0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_11_8	FM(MMC_SD_D2)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_15_12	FM(MMC_SD_CLK)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_19_16	FM(MMC_DS)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_23_20	FM(MMC_SD_D3)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_27_24	FM(MMC_D5)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_31_28	FM(MMC_D4)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +
> +/* IP1SR3 */		/* 0 */			/* 1 */			/* 2 */		/* 3	 4	  5	   6	    7	     8	      9	       A	B	 C	  D	   E	    F */
> +#define IP1SR3_3_0	FM(MMC_D7)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR3_7_4	FM(MMC_D6)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR3_11_8	FM(MMC_SD_CMD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR3_15_12	FM(SD_CD)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR3_19_16	FM(SD_WP)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									^^^^^^^^	^^^^^^^^
Missing PWM1_A and TCLK3 (unnamed, but conflicting with IP2SR1_11_8)

> +#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 									^^^^^^^^	^^^^^^^^
Missing ERROROUTC_A and TCLK4 (unnamed, but conflicting with IP2SR1_15_12)

> +#define IP1SR3_31_28	FM(QSPI0_SSL)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

> +	{ PINMUX_DRIVE_REG("DRV0CTRL2", 0xE6058080) {
> +		{ RCAR_GP_PIN(2,  7), 28, 3 },	/* TPU0TO1 */
> +		{ RCAR_GP_PIN(2,  6), 24, 3 },	/* FXR_TXDB */
> +		{ RCAR_GP_PIN(2,  5), 20, 3 },	/* FXR_TXENB_N */
> +		{ RCAR_GP_PIN(2,  4), 16, 3 },	/* RXDB_EXTFXR */
> +		{ RCAR_GP_PIN(2,  3), 12, 3 },	/* CLK_EXTFXR */
> +		{ RCAR_GP_PIN(2,  2),  8, 3 },	/* RXDA_EXTFXR */
> +		{ RCAR_GP_PIN(2,  1),  4, 3 },	/* XR_TXENA_N */

FXR_TXENA_N

> +		{ RCAR_GP_PIN(2,  0),  0, 3 },	/* FXR_TXDA */
> +	} },

> +	{ PINMUX_DRIVE_REG("DRV2CTRL2", 0xE6058088) {
> +		{ RCAR_GP_PIN(2, 19), 12, 3 },	/* CANFD7_RX DRV1 */
> +		{ RCAR_GP_PIN(2, 18),  8, 3 },	/* CANFD7_TX DRV1 */
> +		{ RCAR_GP_PIN(2, 17),  4, 3 },	/* CANFD4_RX DRV1 */
> +		{ RCAR_GP_PIN(2, 16),  0, 3 },	/* CANFD4_TX DRV1 */

Please drop "DRV1" from the above four comments.

> +	} },

> +	{ PINMUX_DRIVE_REG("DRV3CTRL3", 0xE605888C) {
> +		{ RCAR_GP_PIN(3, 29), 20, 2 },	/* RPC_INT_N */
> +		{ RCAR_GP_PIN(3, 28), 16, 2 },	/* RPC_WP_N */
> +		{ RCAR_GP_PIN(3, 27), 12, 2 },	/* RPC_RESET */

RPC_RESET_N

> +		{ RCAR_GP_PIN(3, 26),  8, 2 },	/* QSPI1_IO3 */
> +		{ RCAR_GP_PIN(3, 25),  4, 2 },	/* QSPI1_SSL */
> +		{ RCAR_GP_PIN(3, 24),  0, 2 },	/* QSPI1_IO2 */
> +	} },

> +enum ioctrl_regs {
> +	POC0,
> +	POC1,
> +	POC2,

POC 2 is unused, and not documented.  Please remove it.

> +	POC3,
> +	POC4,
> +	POC5,
> +	POC6,
> +	POC7,
> +	POC8,
> +	TD0SEL3,
> +};
> +
> +static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
> +	[POC0]		= { 0xE60500A0, },
> +	[POC1]		= { 0xE60508A0, },
> +	[POC2]		= { 0xE60580A0, },

POC 2 is unused, and not documented.  Please remove it.

> +	[POC3]		= { 0xE60588A0, },
> +	[POC4]		= { 0xE60600A0, },
> +	[POC5]		= { 0xE60608A0, },
> +	[POC6]		= { 0xE60610A0, },
> +	[POC7]		= { 0xE60618A0, },
> +	[POC8]		= { 0xE60680A0, },
> +	[TD0SEL3]	= { 0xE60589C0, },

TD0SEL3 is not used.
As all fields must be written all zeroes, there is no point in keeping
it here.

> +	{ /* sentinel */ },
> +};
> +
> +static int r8a779g0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
> +{
> +	int bit = pin & 0x1f;
> +
> +	*pocctrl = pinmux_ioctrl_regs[POC0].reg;
> +	if (pin >= RCAR_GP_PIN(0, 0) && pin <= RCAR_GP_PIN(0, 18))
> +		return bit;
> +
> +	*pocctrl = pinmux_ioctrl_regs[POC1].reg;
> +	if (pin >= RCAR_GP_PIN(1, 0) && pin <= RCAR_GP_PIN(1, 28))

"<= RCAR_GP_PIN(1, 22)", as GP1_23 to GP1_28 do not support voltage
control.

> +		return bit;
> +
> +	*pocctrl = pinmux_ioctrl_regs[POC3].reg;
> +	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 12))
> +		return bit;

We probably want to add voltage control for TSN0 and AVB[0-2] someday...

> +
> +	*pocctrl = pinmux_ioctrl_regs[POC8].reg;
> +	if (pin >= RCAR_GP_PIN(8, 0) && pin <= RCAR_GP_PIN(8, 13))
> +		return bit;
> +
> +	return -EINVAL;
> +}

> +	{ PINMUX_BIAS_REG("PUEN2", 0xE60580C0, "PUD2", 0xE60580E0) {
> +		[ 0] = RCAR_GP_PIN(2,  0),	/* FXR_TXDA */
> +		[ 1] = RCAR_GP_PIN(2,  1),	/* FXR_TXENA_N */
> +		[ 2] = RCAR_GP_PIN(2,  2),	/* RXDA_EXTFXR */
> +		[ 3] = RCAR_GP_PIN(2,  3),	/* CLK_EXTFXR */
> +		[ 4] = RCAR_GP_PIN(2,  4),	/* RXDB_EXTFXR */
> +		[ 5] = RCAR_GP_PIN(2,  5),	/* FXR_TXENB_N */
> +		[ 6] = RCAR_GP_PIN(2,  6),	/* FXR_TXDB */
> +		[ 7] = RCAR_GP_PIN(2,  7),	/* TPU0TO0 */

TPU0TO1

> +		[ 8] = RCAR_GP_PIN(2,  8),	/* TPU0TO1 */

TPU0TO0

> +		[ 9] = RCAR_GP_PIN(2,  9),	/* CAN_CLK */
> +		[10] = RCAR_GP_PIN(2, 10),	/* CANFD0_TX */
> +		[11] = RCAR_GP_PIN(2, 11),	/* CANFD0_RX */
> +		[12] = RCAR_GP_PIN(2, 12),	/* CANFD2_TX */
> +		[13] = RCAR_GP_PIN(2, 13),	/* CANFD2_RX */
> +		[14] = RCAR_GP_PIN(2, 14),	/* CANFD3_TX */
> +		[15] = RCAR_GP_PIN(2, 15),	/* CANFD3_RX */
> +		[16] = RCAR_GP_PIN(2, 16),	/* CANFD4_TX */
> +		[17] = RCAR_GP_PIN(2, 17),	/* CANFD4_RX */
> +		[18] = RCAR_GP_PIN(2, 18),	/* CANFD7_TX */
> +		[19] = RCAR_GP_PIN(2, 19),	/* CANFD7_RX */
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

> +static const struct sh_pfc_soc_operations pinmux_ops = {

Please rename this to r8a779g0_pfc_ops, to avoid confusion with struct
pinmux_ops.
Cfr. commit c614d12c4bc003a7 ("pinctrl: renesas: Rename
sh_pfc_soc_operations instances").

> +	.pin_to_pocctrl = r8a779g0_pin_to_pocctrl,
> +	.get_bias = rcar_pinmux_get_bias,
> +	.set_bias = rcar_pinmux_set_bias,
> +};

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

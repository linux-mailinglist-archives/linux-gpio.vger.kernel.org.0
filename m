Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B7B492C2C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jan 2022 18:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243743AbiARRTp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jan 2022 12:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347149AbiARRTp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jan 2022 12:19:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124DEC061574;
        Tue, 18 Jan 2022 09:19:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FED014C3;
        Tue, 18 Jan 2022 18:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642526382;
        bh=DzBjQOlNtw5qOzuh4tnHr/oiWRI6Z3LjQkD8BsAOp2M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ro5AdUSDAv1TkcyNN5g08ZLNBInKed2d/haAFF8OBgaNAW327yFJISeY5I5kmBZlg
         Ybk/UBTpJt0Fwgc061dSwC2K5UivNTUinl54NSJnWhgCk2xb35YZZbLVw3C85bXw2S
         9ximCBLb53ESqz8x95ZyQeKYqpsjg0q7CANKqVyE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4880e4cbc112ee26569bf29a21c070125461e58d.1642524603.git.geert+renesas@glider.be>
References: <4880e4cbc112ee26569bf29a21c070125461e58d.1642524603.git.geert+renesas@glider.be>
Subject: Re: [PATCH] pinctrl: renesas: r8a779a0: Rename MOD_SEL2_* definitions
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Jan 2022 17:19:39 +0000
Message-ID: <164252637980.10801.8177844941829819862@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Quoting Geert Uytterhoeven (2022-01-18 16:52:08)
> Rename the MOD_SEL2_* definitions, to match the bitfield order in
> IPxSRy_* definitions and in MOD_SEL* definitions in other drivers.
>=20
> No changes in generated code.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I've looked through and the changes seem consistent as far as I can see.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> To be queued in renesas-pinctrl for v5.18.
>=20
>  drivers/pinctrl/renesas/pfc-r8a779a0.c | 42 +++++++++++++-------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/ren=
esas/pfc-r8a779a0.c
> index 155294d0dd5abfb4..4a668a04b7ca6820 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> @@ -576,23 +576,23 @@ FM(IP0SR5_27_24)  IP0SR5_27_24    FM(IP1SR5_27_24) =
       IP1SR5_27_24    FM(IP2SR5_27_24)        IP2
>  FM(IP0SR5_31_28)       IP0SR5_31_28    FM(IP1SR5_31_28)        IP1SR5_31=
_28    FM(IP2SR5_31_28)        IP2SR5_31_28
> =20
>  /* MOD_SEL2 */                 /* 0 */         /* 1 */         /* 2 */  =
       /* 3 */
> -#define MOD_SEL2_14_15         FM(SEL_I2C6_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C6_3)
> -#define MOD_SEL2_12_13         FM(SEL_I2C5_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C5_3)
> -#define MOD_SEL2_10_11         FM(SEL_I2C4_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C4_3)
> -#define MOD_SEL2_8_9           FM(SEL_I2C3_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C3_3)
> -#define MOD_SEL2_6_7           FM(SEL_I2C2_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C2_3)
> -#define MOD_SEL2_4_5           FM(SEL_I2C1_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C1_3)
> -#define MOD_SEL2_2_3           FM(SEL_I2C0_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C0_3)
> +#define MOD_SEL2_15_14         FM(SEL_I2C6_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C6_3)
> +#define MOD_SEL2_13_12         FM(SEL_I2C5_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C5_3)
> +#define MOD_SEL2_11_10         FM(SEL_I2C4_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C4_3)
> +#define MOD_SEL2_9_8           FM(SEL_I2C3_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C3_3)
> +#define MOD_SEL2_7_6           FM(SEL_I2C2_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C2_3)
> +#define MOD_SEL2_5_4           FM(SEL_I2C1_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C1_3)
> +#define MOD_SEL2_3_2           FM(SEL_I2C0_0)  F_(0, 0)        F_(0, 0) =
       FM(SEL_I2C0_3)
> =20
>  #define PINMUX_MOD_SELS \
>  \
> -MOD_SEL2_14_15 \
> -MOD_SEL2_12_13 \
> -MOD_SEL2_10_11 \
> -MOD_SEL2_8_9 \
> -MOD_SEL2_6_7 \
> -MOD_SEL2_4_5 \
> -MOD_SEL2_2_3
> +MOD_SEL2_15_14 \
> +MOD_SEL2_13_12 \
> +MOD_SEL2_11_10 \
> +MOD_SEL2_9_8 \
> +MOD_SEL2_7_6 \
> +MOD_SEL2_5_4 \
> +MOD_SEL2_3_2
> =20
>  #define PINMUX_PHYS \
>         FM(SCL0) FM(SDA0) FM(SCL1) FM(SDA1) FM(SCL2) FM(SDA2) FM(SCL3) FM=
(SDA3) \
> @@ -3666,13 +3666,13 @@ static const struct pinmux_cfg_reg pinmux_config_=
regs[] =3D {
>                 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>                 /* RESERVED 19, 18, 17, 16 */
>                 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> -               MOD_SEL2_14_15
> -               MOD_SEL2_12_13
> -               MOD_SEL2_10_11
> -               MOD_SEL2_8_9
> -               MOD_SEL2_6_7
> -               MOD_SEL2_4_5
> -               MOD_SEL2_2_3
> +               MOD_SEL2_15_14
> +               MOD_SEL2_13_12
> +               MOD_SEL2_11_10
> +               MOD_SEL2_9_8
> +               MOD_SEL2_7_6
> +               MOD_SEL2_5_4
> +               MOD_SEL2_3_2
>                 0, 0,
>                 0, 0, ))
>         },
> --=20
> 2.25.1
>

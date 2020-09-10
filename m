Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDAE263F59
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 10:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbgIJIIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 04:08:45 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40183 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgIJIIi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 04:08:38 -0400
Received: by mail-ot1-f68.google.com with SMTP id e23so4625101otk.7;
        Thu, 10 Sep 2020 01:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bt5LO1EogaCcdNjbtyzVvLp7HFZ0ciiAb2j+FbURuDQ=;
        b=QDmoo+0+Wi6zYSZZXQu2211/gLn0zY/9n4e+eaMK3RENJhRq+/o2mgQWr70ba+yFtL
         PcpTcUxGbb5T37bVFMwF4bC5CHR4BL+nt3+YsTU4GERIsEpuatKYe6ZZEYDZYSNOQgXz
         kGFJLhQiHkHxFHC1EFYdJxEXD8R8PjGPb0UwHeoFeVGXetLvrvQrL9kYnoYwZSsoNxR4
         AMMVG0+JU3U56EemL8i6kjUm4lCujBxvoftkLs26PQWGUB7v9lbj6Csrtl/BouzSRZTR
         usA2rThxlK5XPzOtsKDUqfs9vGA9pLR2jR8Hz+WCjSOz/t0Q0kt9Qtx1Vgpmqxx6AVfj
         9X6A==
X-Gm-Message-State: AOAM5331BcViNK1t6Xc8z7P+I1XYuc2ZcozQPEJ4vI6cq38Ynt93L/My
        Y8yCUTDMpYlIAaug4SKRgy9eOjAsfXG4bOREnwrjB2vA1nQ=
X-Google-Smtp-Source: ABdhPJyw1Ib9bF9PwZcGwHsZ517qb+BqDY53tDy9UiJEF+bO37XZTlWipkneILVplI+n2h+fHEZT4R+CNijEse9UsDE=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3261016otb.250.1599725317190;
 Thu, 10 Sep 2020 01:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200907145516.12803-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200907145516.12803-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 10:08:26 +0200
Message-ID: <CAMuHMdXehR_wBgYtzyuqLUQuydRaFS9_4cUtJ2eDay7m4dy7FA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7790: Add VIN pins used by
 iwg21d-q7-dbcm-ca board
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Mon, Sep 7, 2020 at 4:55 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add vin[1,2] data8 and vin1_clk_b pins used by iwg21d-q7-dbcm-ca board
> which is based on R8A7742 SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> @@ -3866,6 +3866,18 @@ static const unsigned int vin1_data18_mux[] = {
>         VI1_R4_MARK, VI1_R5_MARK,
>         VI1_R6_MARK, VI1_R7_MARK,
>  };
> +static const unsigned int vin1_data8_b_pins[] = {
> +       RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
> +       RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
> +       RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
> +       RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
> +};
> +static const unsigned int vin1_data8_b_mux[] = {
> +       VI1_DATA0_VI1_B0_B_MARK, VI1_DATA1_VI1_B1_B_MARK,
> +       VI1_DATA2_VI1_B2_B_MARK, VI1_DATA3_VI1_B3_B_MARK,
> +       VI1_DATA4_VI1_B4_B_MARK, VI1_DATA5_VI1_B5_B_MARK,
> +       VI1_DATA6_VI1_B6_B_MARK, VI1_DATA7_VI1_B7_B_MARK,
> +};

I don't think "vin1_data8_b" is a good name for this subset, as it would
conflict with the name for the first 8 pins of the full 24-bit VIN1 "B"
pin set, to be declared with

    static const union vin_data vin1_data_b_pins[] = { ... };

and VIN_DATA_PIN_GROUP(vin1_data, 8, _b) macro.

This would be easier to see if you would add the complete VIN1 "B" pin
set (which I prefer), and not just the parts you need for your camera
board.

>  static const unsigned int vin1_sync_pins[] = {
>         RCAR_GP_PIN(1, 24), /* HSYNC */
>         RCAR_GP_PIN(1, 25), /* VSYNC */
> @@ -3886,6 +3898,12 @@ static const unsigned int vin1_clkenb_pins[] = {
>  static const unsigned int vin1_clkenb_mux[] = {
>         VI1_CLKENB_MARK,
>  };

Please add vin1_sync_b and vin1_field_b while at it.

> +static const unsigned int vin1_clk_b_pins[] = {
> +       RCAR_GP_PIN(3, 15),
> +};
> +static const unsigned int vin1_clk_b_mux[] = {
> +       VI1_CLK_B_MARK,
> +};

Please insert "vin1_clk_b" below "vin1_clk".

>  static const unsigned int vin1_clk_pins[] = {
>         RCAR_GP_PIN(2, 9),
>  };
> @@ -3959,6 +3977,18 @@ static const unsigned int vin2_data18_mux[] = {
>         VI2_R4_MARK, VI2_R5_MARK,
>         VI2_R6_MARK, VI2_R7_MARK,
>  };
> +static const unsigned int vin2_data8_g_pins[] = {
> +       RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
> +       RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
> +       RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> +       RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin2_data8_g_mux[] = {
> +       VI2_G0_MARK, VI2_G1_MARK,
> +       VI2_G2_MARK, VI2_G3_MARK,
> +       VI2_G4_MARK, VI2_G5_MARK,
> +       VI2_G6_MARK, VI2_G7_MARK,
> +};

I think "vin2_data8_g" is also a bad name, as the "g" suffix means the
green subchannel of the "vin2_data" pin group, while the "b" suffix in
"vin1_data8_b" means the "b" alternative pin group.

Perhaps "vin2_data8g"?

Niklas, Laurent: do you have any comments?

>  static const unsigned int vin2_sync_pins[] = {
>         RCAR_GP_PIN(1, 16), /* HSYNC */
>         RCAR_GP_PIN(1, 21), /* VSYNC */
> @@ -4026,7 +4056,7 @@ static const unsigned int vin3_clk_mux[] = {
>  };
>
>  static const struct {
> -       struct sh_pfc_pin_group common[298];
> +       struct sh_pfc_pin_group common[301];
>         struct sh_pfc_pin_group automotive[1];
>  } pinmux_groups = {
>         .common = {
> @@ -4310,15 +4340,18 @@ static const struct {
>                 VIN_DATA_PIN_GROUP(vin1_data, 10),
>                 VIN_DATA_PIN_GROUP(vin1_data, 8),
>                 VIN_DATA_PIN_GROUP(vin1_data, 4),
> +               SH_PFC_PIN_GROUP(vin1_data8_b),
>                 SH_PFC_PIN_GROUP(vin1_sync),
>                 SH_PFC_PIN_GROUP(vin1_field),
>                 SH_PFC_PIN_GROUP(vin1_clkenb),
> +               SH_PFC_PIN_GROUP(vin1_clk_b),

Please insert "vin1_clk_b" below "vin1_clk".

>                 SH_PFC_PIN_GROUP(vin1_clk),
>                 VIN_DATA_PIN_GROUP(vin2_data, 24),
>                 SH_PFC_PIN_GROUP(vin2_data18),
>                 VIN_DATA_PIN_GROUP(vin2_data, 16),
>                 VIN_DATA_PIN_GROUP(vin2_data, 8),
>                 VIN_DATA_PIN_GROUP(vin2_data, 4),
> +               SH_PFC_PIN_GROUP(vin2_data8_g),
>                 SH_PFC_PIN_GROUP(vin2_sync),
>                 SH_PFC_PIN_GROUP(vin2_field),
>                 SH_PFC_PIN_GROUP(vin2_clkenb),
> @@ -4784,9 +4817,11 @@ static const char * const vin1_groups[] = {
>         "vin1_data10",
>         "vin1_data8",
>         "vin1_data4",
> +       "vin1_data8_b",
>         "vin1_sync",
>         "vin1_field",
>         "vin1_clkenb",
> +       "vin1_clk_b",

Please insert "vin1_clk_b" below "vin1_clk".

>         "vin1_clk",
>  };
>
> @@ -4796,6 +4831,7 @@ static const char * const vin2_groups[] = {
>         "vin2_data16",
>         "vin2_data8",
>         "vin2_data4",
> +       "vin2_data8_g",
>         "vin2_sync",
>         "vin2_field",
>         "vin2_clkenb",

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

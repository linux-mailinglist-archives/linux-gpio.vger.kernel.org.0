Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33F5268E33
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 16:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgINOry (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 10:47:54 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38821 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgINOrj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 10:47:39 -0400
Received: by mail-oi1-f193.google.com with SMTP id y6so143698oie.5;
        Mon, 14 Sep 2020 07:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xXmiKOGJxLdtOythJHwnbZ/9MTtxjprRDh5NW6fGqZE=;
        b=T+508UsMQ3KDmiYwa0NHhNNGrmdmx9GkkSKk4rTRE3eMrAhfSjq83N3eGR8cUgk68z
         6z/LDpIm9X5XqKBhHYhUhcRkS5uzoWEKCJR5KtC2/31oulaOef2INTi8bRdrZqCpWQV8
         bw57uZMtduRbmd+tb92/sua6pW6bqAvtG5x61KgCn7zVhku8Nfs97UsuOsY6h7mtnVIH
         Bz2wTXv6KNUKSNb/+7xMnGRIT8y4sWnyxUju5pKo8jX6EbTOzt1iV4vqdYO9Iao+mbV7
         YWHvEqrpxVAbWgPhluEUE7sg8lFOzscJg+4RgsCav+YkabZiBBJh7V5LSAjj3jLnlIZ7
         63Cg==
X-Gm-Message-State: AOAM532M1hGbnb8P9sSkaRsbTI/s6e7gt+sav0bRYWQRMIGJUa/WyQeS
        KC81nD3N/qHSLCLzWJTvWe66AlPdmDn+EFq35ns=
X-Google-Smtp-Source: ABdhPJy9ncGnp1eMb+q/xwc/WTE6IYf82utcaATWzgDC0b2bF3UWJbUmhvMYmlsX4IqNoMjBPOSTfnBa5f4QkSxGI1k=
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr8078289oia.148.1600094858794;
 Mon, 14 Sep 2020 07:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200913182850.32660-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200913182850.32660-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Sep 2020 16:47:27 +0200
Message-ID: <CAMuHMdWjnQGKt12_=Z1Lc4fE2hecC6V7ELYpGW6FP2zm8mBp=w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7790: Add VIN1-B and VIN2-G pins,
 groups and functions
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

CC Laurent, Niklas

On Sun, Sep 13, 2020 at 8:29 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add pins, groups and functions for the VIN1-B [data/clk/sync] and VIN2-G [data].
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes for v2:
> * Added complete list of VIN1-B pins
> * Renamed vin2_data8_g to vin2_data8g
> * Sorted vin1_sync_b pins
>
> v1 - https://patchwork.kernel.org/patch/11761191/

Thanks for the update!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c

> @@ -3874,6 +3940,14 @@ static const unsigned int vin1_sync_mux[] = {
>         VI1_HSYNC_N_MARK,
>         VI1_VSYNC_N_MARK,
>  };
> +static const unsigned int vin1_sync_b_pins[] = {
> +       RCAR_GP_PIN(1, 24), /* HSYNC */
> +       RCAR_GP_PIN(1, 25), /* VSYNC */
> +};
> +static const unsigned int vin1_sync_b_mux[] = {
> +       VI1_HSYNC_N_B_MARK,
> +       VI1_VSYNC_N_B_MARK,
> +};
>  static const unsigned int vin1_field_pins[] = {
>         RCAR_GP_PIN(1, 13),
>  };

Missing field_b and clkenb_b.

> @@ -3959,6 +4039,18 @@ static const unsigned int vin2_data18_mux[] = {
>         VI2_R4_MARK, VI2_R5_MARK,
>         VI2_R6_MARK, VI2_R7_MARK,
>  };
> +static const unsigned int vin2_data8g_pins[] = {
> +       RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
> +       RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
> +       RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> +       RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin2_data8g_mux[] = {
> +       VI2_G0_MARK, VI2_G1_MARK,
> +       VI2_G2_MARK, VI2_G3_MARK,
> +       VI2_G4_MARK, VI2_G5_MARK,
> +       VI2_G6_MARK, VI2_G7_MARK,
> +};

Laurent, Niklas: are you happy with the name "vin2_data8g", or do
you have a better suggestion?

>  static const unsigned int vin2_sync_pins[] = {
>         RCAR_GP_PIN(1, 16), /* HSYNC */
>         RCAR_GP_PIN(1, 21), /* VSYNC */

> @@ -4310,15 +4402,25 @@ static const struct {
>                 VIN_DATA_PIN_GROUP(vin1_data, 10),
>                 VIN_DATA_PIN_GROUP(vin1_data, 8),
>                 VIN_DATA_PIN_GROUP(vin1_data, 4),
> +               VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
> +               VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
> +               SH_PFC_PIN_GROUP(vin1_data18_b),
> +               VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
> +               VIN_DATA_PIN_GROUP(vin1_data, 12, _b),
> +               VIN_DATA_PIN_GROUP(vin1_data, 10, _b),
> +               VIN_DATA_PIN_GROUP(vin1_data, 8, _b),

Missing vin1_data4_b.

>                 SH_PFC_PIN_GROUP(vin1_sync),
> +               SH_PFC_PIN_GROUP(vin1_sync_b),
>                 SH_PFC_PIN_GROUP(vin1_field),
>                 SH_PFC_PIN_GROUP(vin1_clkenb),
>                 SH_PFC_PIN_GROUP(vin1_clk),
> +               SH_PFC_PIN_GROUP(vin1_clk_b),
>                 VIN_DATA_PIN_GROUP(vin2_data, 24),
>                 SH_PFC_PIN_GROUP(vin2_data18),
>                 VIN_DATA_PIN_GROUP(vin2_data, 16),
>                 VIN_DATA_PIN_GROUP(vin2_data, 8),
>                 VIN_DATA_PIN_GROUP(vin2_data, 4),
> +               SH_PFC_PIN_GROUP(vin2_data8g),
>                 SH_PFC_PIN_GROUP(vin2_sync),
>                 SH_PFC_PIN_GROUP(vin2_field),
>                 SH_PFC_PIN_GROUP(vin2_clkenb),
> @@ -4784,10 +4886,19 @@ static const char * const vin1_groups[] = {
>         "vin1_data10",
>         "vin1_data8",
>         "vin1_data4",
> +       "vin1_data24_b",
> +       "vin1_data20_b",
> +       "vin1_data18_b",
> +       "vin1_data16_b",
> +       "vin1_data12_b",
> +       "vin1_data10_b",
> +       "vin1_data8_b",

Missing vin1_data4_b.

>         "vin1_sync",
> +       "vin1_sync_b",
>         "vin1_field",
>         "vin1_clkenb",
>         "vin1_clk",
> +       "vin1_clk_b",
>  };
>
>  static const char * const vin2_groups[] = {

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

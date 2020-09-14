Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1656B2699AA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 01:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgINX2B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 19:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgINX2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 19:28:00 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35BCC061788
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 16:27:59 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d15so1057508lfq.11
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 16:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=r2GMisdxFuJIz8Oi1Fu4M0eVpKlXoiL45pGV8V5Zu24=;
        b=a+K4RbaJnscL4621Dq0mKkwgar6f4XoIA9LGaSxpiPd9HHQ4Rlx13fofQWWRRKhqVT
         /yo3kkPAjCp27Tl7r/JI/O8rJBvORth8susMft10B0mYTYxNb7EmUfAIsh7cApWHuup1
         9ZFW4MkQSaae7sYhOdOTFQIYXporG+j9nEaLVSgxa0kvEuG/eNu5slzBlu3DgwxeUNFR
         vPTs+O/zHYXwbtzZDSWEEBA6usaMey3eUexXGnmjTGX5DyxMQQwfLuGSTb0mcl4SNFiC
         7LJ3gqJUrFoKT3AuyOP0yI3kKMuc17boaTwI07hsPnq80lMDA/Nba4hOilwhsLEM+i9T
         UZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=r2GMisdxFuJIz8Oi1Fu4M0eVpKlXoiL45pGV8V5Zu24=;
        b=keWox0qC0bQtTsVfwVsEQy5wQdwndSzc8pfn6GHyV+/iA4BzQed0eEbXBKE4RYVKzv
         d30Bmo3DqsU7fujA8ntb2HNQ48xGmUwYzZQhCW2hyCM/lztcMiUoNVwvE4wL7AQEIyL8
         Rje2fwV94ACdNwpslUpWDnW8hc6ZyI0vnZdWfLRfVevYQVhHDD79N66iYOeaImkDeFpH
         GbE6WlVD4iAS99h+5jw3vlrUPyg9suQOOy3qPgYWbdO1I+36i1MUu4CnaNWq7IF9Jhf3
         KD7aPqGVB/3zb1K9JFTVKAINkCkRqra+WdT0OhR1PuGFFUINSABJXGczpAGIqsWvnra7
         r6Og==
X-Gm-Message-State: AOAM530wYb8eSNx+drvzbw0YAHJiUG9MG4vVt2hfHJrXYGJQIiMAmkqk
        9UkjRengL/X/tnytVuJ+WaUJFg==
X-Google-Smtp-Source: ABdhPJyp0bWKCn/K5zSlid5A0seiTiqxw7kxU6VrW0Tdi/BaM3+tE9I+UcsDSHxIzo0mrwBeSpXhYg==
X-Received: by 2002:a05:6512:3f3:: with SMTP id n19mr4607751lfq.531.1600126077920;
        Mon, 14 Sep 2020 16:27:57 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 80sm3955438lff.61.2020.09.14.16.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 16:27:57 -0700 (PDT)
Date:   Tue, 15 Sep 2020 01:27:56 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7790: Add VIN1-B and VIN2-G pins,
 groups and functions
Message-ID: <20200914232756.GA1669406@oden.dyn.berto.se>
References: <20200913182850.32660-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWjnQGKt12_=Z1Lc4fE2hecC6V7ELYpGW6FP2zm8mBp=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWjnQGKt12_=Z1Lc4fE2hecC6V7ELYpGW6FP2zm8mBp=w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert, Lad,

On 2020-09-14 16:47:27 +0200, Geert Uytterhoeven wrote:
> Hi Prabhakar,
> 
> CC Laurent, Niklas
> 
> On Sun, Sep 13, 2020 at 8:29 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add pins, groups and functions for the VIN1-B [data/clk/sync] and VIN2-G [data].
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Changes for v2:
> > * Added complete list of VIN1-B pins
> > * Renamed vin2_data8_g to vin2_data8g
> > * Sorted vin1_sync_b pins
> >
> > v1 - https://patchwork.kernel.org/patch/11761191/
> 
> Thanks for the update!
> 
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> 
> > @@ -3874,6 +3940,14 @@ static const unsigned int vin1_sync_mux[] = {
> >         VI1_HSYNC_N_MARK,
> >         VI1_VSYNC_N_MARK,
> >  };
> > +static const unsigned int vin1_sync_b_pins[] = {
> > +       RCAR_GP_PIN(1, 24), /* HSYNC */
> > +       RCAR_GP_PIN(1, 25), /* VSYNC */
> > +};
> > +static const unsigned int vin1_sync_b_mux[] = {
> > +       VI1_HSYNC_N_B_MARK,
> > +       VI1_VSYNC_N_B_MARK,
> > +};
> >  static const unsigned int vin1_field_pins[] = {
> >         RCAR_GP_PIN(1, 13),
> >  };
> 
> Missing field_b and clkenb_b.
> 
> > @@ -3959,6 +4039,18 @@ static const unsigned int vin2_data18_mux[] = {
> >         VI2_R4_MARK, VI2_R5_MARK,
> >         VI2_R6_MARK, VI2_R7_MARK,
> >  };
> > +static const unsigned int vin2_data8g_pins[] = {
> > +       RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
> > +       RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
> > +       RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> > +       RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> > +};
> > +static const unsigned int vin2_data8g_mux[] = {
> > +       VI2_G0_MARK, VI2_G1_MARK,
> > +       VI2_G2_MARK, VI2_G3_MARK,
> > +       VI2_G4_MARK, VI2_G5_MARK,
> > +       VI2_G6_MARK, VI2_G7_MARK,
> > +};
> 
> Laurent, Niklas: are you happy with the name "vin2_data8g", or do
> you have a better suggestion?

I learnt recently that traditionally for single 8-bit RAW inputs are 
named R8 (fist in RGB). But as this really is the G pins and they are 
labeled as such I'm OK with the name, but I would like to hear Laurent's 
view as well.

> 
> >  static const unsigned int vin2_sync_pins[] = {
> >         RCAR_GP_PIN(1, 16), /* HSYNC */
> >         RCAR_GP_PIN(1, 21), /* VSYNC */
> 
> > @@ -4310,15 +4402,25 @@ static const struct {
> >                 VIN_DATA_PIN_GROUP(vin1_data, 10),
> >                 VIN_DATA_PIN_GROUP(vin1_data, 8),
> >                 VIN_DATA_PIN_GROUP(vin1_data, 4),
> > +               VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
> > +               VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
> > +               SH_PFC_PIN_GROUP(vin1_data18_b),
> > +               VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
> > +               VIN_DATA_PIN_GROUP(vin1_data, 12, _b),
> > +               VIN_DATA_PIN_GROUP(vin1_data, 10, _b),
> > +               VIN_DATA_PIN_GROUP(vin1_data, 8, _b),
> 
> Missing vin1_data4_b.
> 
> >                 SH_PFC_PIN_GROUP(vin1_sync),
> > +               SH_PFC_PIN_GROUP(vin1_sync_b),
> >                 SH_PFC_PIN_GROUP(vin1_field),
> >                 SH_PFC_PIN_GROUP(vin1_clkenb),
> >                 SH_PFC_PIN_GROUP(vin1_clk),
> > +               SH_PFC_PIN_GROUP(vin1_clk_b),
> >                 VIN_DATA_PIN_GROUP(vin2_data, 24),
> >                 SH_PFC_PIN_GROUP(vin2_data18),
> >                 VIN_DATA_PIN_GROUP(vin2_data, 16),
> >                 VIN_DATA_PIN_GROUP(vin2_data, 8),
> >                 VIN_DATA_PIN_GROUP(vin2_data, 4),
> > +               SH_PFC_PIN_GROUP(vin2_data8g),
> >                 SH_PFC_PIN_GROUP(vin2_sync),
> >                 SH_PFC_PIN_GROUP(vin2_field),
> >                 SH_PFC_PIN_GROUP(vin2_clkenb),
> > @@ -4784,10 +4886,19 @@ static const char * const vin1_groups[] = {
> >         "vin1_data10",
> >         "vin1_data8",
> >         "vin1_data4",
> > +       "vin1_data24_b",
> > +       "vin1_data20_b",
> > +       "vin1_data18_b",
> > +       "vin1_data16_b",
> > +       "vin1_data12_b",
> > +       "vin1_data10_b",
> > +       "vin1_data8_b",
> 
> Missing vin1_data4_b.
> 
> >         "vin1_sync",
> > +       "vin1_sync_b",
> >         "vin1_field",
> >         "vin1_clkenb",
> >         "vin1_clk",
> > +       "vin1_clk_b",
> >  };
> >
> >  static const char * const vin2_groups[] = {
> 
> The rest looks good to me.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund

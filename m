Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6DD8269F09
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 09:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgIOHEU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 15 Sep 2020 03:04:20 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44197 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgIOHEA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 03:04:00 -0400
Received: by mail-ot1-f65.google.com with SMTP id a2so2223802otr.11;
        Tue, 15 Sep 2020 00:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vflTutZSW3rf5XePZzn3lm59cY0zbyV93+qA4WDI2wc=;
        b=k49nFDQrbhjNs1ifmQuB1zLjzkdSVrqF7QBlTaeyd+CGK26htxUepiYctxBKiZDym1
         qXr3CsnXnQRFAVrRjQhhDkK0pIPRApf2t1G0thGWwvi+lUaw6cTdMbXniX8R71Sq5E3S
         uKAiHnGLNwcMI/WkuQX8WCvR7EzFAIYEI0azmc9P9O46nN9KlYTNPnEbhcYMRaztYwpd
         Ki84a3pFBN7JWzttc2I1Ect+crieewkeR9h2rGYauf5o6YUQykEyuAEKmj9e+0xN5W1g
         sFXdXzCTM48aEptRGKHNeE6DxzuSRVrsd4lWeowZlM+pzq/uAMsGz99yW5YkNFps7san
         UqKA==
X-Gm-Message-State: AOAM532QEL6pATWtlb0yiP+b6K7ZdEzns0M0NyurPP8K5dbGaiD2RJnt
        SFoZGxdMhhMwsQmQLpL+ICGbLcoHcWn5NoVYXaA=
X-Google-Smtp-Source: ABdhPJzDFx3eWG/x7GEl0MLs0+n+OdjyF6YDkSUcQMt2sPD1lvnAL+nantcsMAy0jYZffAJwXNjvGuS5GrXjaDfYZr8=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr12178418otb.250.1600153437035;
 Tue, 15 Sep 2020 00:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200913182850.32660-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWjnQGKt12_=Z1Lc4fE2hecC6V7ELYpGW6FP2zm8mBp=w@mail.gmail.com>
 <20200914232756.GA1669406@oden.dyn.berto.se> <20200914234000.GG15543@pendragon.ideasonboard.com>
In-Reply-To: <20200914234000.GG15543@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Sep 2020 09:03:45 +0200
Message-ID: <CAMuHMdXdDkPX447AibYNjUwGHkYxC3sE-18G2DNVQR2T-jxX2w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7790: Add VIN1-B and VIN2-G pins,
 groups and functions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Laurent,

On Tue, Sep 15, 2020 at 1:40 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Sep 15, 2020 at 01:27:56AM +0200, Niklas Söderlund wrote:
> > On 2020-09-14 16:47:27 +0200, Geert Uytterhoeven wrote:
> > > On Sun, Sep 13, 2020 at 8:29 PM Lad Prabhakar wrote:
> > > > Add pins, groups and functions for the VIN1-B [data/clk/sync] and VIN2-G [data].
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > Changes for v2:
> > > > * Added complete list of VIN1-B pins
> > > > * Renamed vin2_data8_g to vin2_data8g
> > > > * Sorted vin1_sync_b pins
> > > >
> > > > v1 - https://patchwork.kernel.org/patch/11761191/

> > > > @@ -3959,6 +4039,18 @@ static const unsigned int vin2_data18_mux[] = {
> > > >         VI2_R4_MARK, VI2_R5_MARK,
> > > >         VI2_R6_MARK, VI2_R7_MARK,
> > > >  };
> > > > +static const unsigned int vin2_data8g_pins[] = {
> > > > +       RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
> > > > +       RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
> > > > +       RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> > > > +       RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> > > > +};
> > > > +static const unsigned int vin2_data8g_mux[] = {
> > > > +       VI2_G0_MARK, VI2_G1_MARK,
> > > > +       VI2_G2_MARK, VI2_G3_MARK,
> > > > +       VI2_G4_MARK, VI2_G5_MARK,
> > > > +       VI2_G6_MARK, VI2_G7_MARK,
> > > > +};
> > >
> > > Laurent, Niklas: are you happy with the name "vin2_data8g", or do
> > > you have a better suggestion?
> >
> > I learnt recently that traditionally for single 8-bit RAW inputs are
> > named R8 (fist in RGB). But as this really is the G pins and they are
> > labeled as such I'm OK with the name, but I would like to hear Laurent's
> > view as well.
>
> I think we should match the pin names from the datasheet, so a R suffix
> isn't a good option. I have a feeling we will suffer with this though,
> as here 'g' refers to the VIN green data pins (g[7:0], a.k.a.
> data[15:8]), while below 'b' refers to the second set of VIN data pins,
> not the blue data pins. One option would be to use "vin2_data8_shift8",
> but I'm not sure I'm very fond of that either. I also wonder whether we
> shouldn't call this "vin2_g8" instead of "vin2_data8g" as the pins are
> named VIN_G[7:0], not VIN_DATAG[7:0].

On R-Car H2 and RZ/G1H they're indeed named VIx_G[7:0].

However, looking at other R-Car Gen2 and Gen3 variants, there are
many possibilities, from all-RGB:
  1. R[7:0], G[7:0], B[7:0],
over:
  2. R[7:0], G[7:0], DATA[7:0]_B[7:0],
  3. D[23:16]_R[7:0], D[15:8]_G[7:0]_Y[7:0], D[7:0]_B[7:0]_C[7:0],
to all-DATA:
  4. DATA[11:0],
  5. DATA[23:0].

Following 1, 24-bit should be called "rgb24", and 18-bit "rgb18"
(I believe this is the only format using discontiguous pins?).
The in-betweens make sense, as YCbCr[7:0] data goes over the 8-bit DATA
or 16-bit D pins, but that sense is lost when considering other formats
that accept 10/12/16/20-bit input.
I guess that's why R-Car Gen3 settled at option 5, which is actually
what we've been doing in the pin control drivers from the beginning.

Nevertheless, I agree "vinX_g8" seems like the best name for this group,
as it's quite obvious from the name what it means, and isn't easily
confused with an alternate set of pins.
Note that the BSP (for R-Car Gen3, no idea about Gen2) uses
"vinX_data8_sft8" (which I never really liked), which Niklas is now
trying to upstream in "[PATCH 0/4] pinctrl: sh-pfc: Add VIN stf8 pins"
(https://lore.kernel.org/linux-renesas-soc/20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se).
Expect more bikeshedding soon ;-)

> > > >  static const unsigned int vin2_sync_pins[] = {
> > > >         RCAR_GP_PIN(1, 16), /* HSYNC */
> > > >         RCAR_GP_PIN(1, 21), /* VSYNC */
> > >
> > > > @@ -4310,15 +4402,25 @@ static const struct {
> > > >                 VIN_DATA_PIN_GROUP(vin1_data, 10),
> > > >                 VIN_DATA_PIN_GROUP(vin1_data, 8),
> > > >                 VIN_DATA_PIN_GROUP(vin1_data, 4),
> > > > +               VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
> > > > +               VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
> > > > +               SH_PFC_PIN_GROUP(vin1_data18_b),
> > > > +               VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
> > > > +               VIN_DATA_PIN_GROUP(vin1_data, 12, _b),
> > > > +               VIN_DATA_PIN_GROUP(vin1_data, 10, _b),
> > > > +               VIN_DATA_PIN_GROUP(vin1_data, 8, _b),
> > >
> > > Missing vin1_data4_b.
> > >
> > > >                 SH_PFC_PIN_GROUP(vin1_sync),
> > > > +               SH_PFC_PIN_GROUP(vin1_sync_b),
> > > >                 SH_PFC_PIN_GROUP(vin1_field),
> > > >                 SH_PFC_PIN_GROUP(vin1_clkenb),
> > > >                 SH_PFC_PIN_GROUP(vin1_clk),
> > > > +               SH_PFC_PIN_GROUP(vin1_clk_b),
> > > >                 VIN_DATA_PIN_GROUP(vin2_data, 24),
> > > >                 SH_PFC_PIN_GROUP(vin2_data18),
> > > >                 VIN_DATA_PIN_GROUP(vin2_data, 16),
> > > >                 VIN_DATA_PIN_GROUP(vin2_data, 8),
> > > >                 VIN_DATA_PIN_GROUP(vin2_data, 4),
> > > > +               SH_PFC_PIN_GROUP(vin2_data8g),
> > > >                 SH_PFC_PIN_GROUP(vin2_sync),
> > > >                 SH_PFC_PIN_GROUP(vin2_field),
> > > >                 SH_PFC_PIN_GROUP(vin2_clkenb),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

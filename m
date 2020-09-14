Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270432699D0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 01:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgINXka (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 19:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgINXk3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 19:40:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A83EC06174A;
        Mon, 14 Sep 2020 16:40:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFB7D275;
        Tue, 15 Sep 2020 01:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600126827;
        bh=dpjfNCdpvv0iSnlK1C59zQrHlYUjqqVhCoNym9uTgzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DZR5n19qTCwZejfbuACt9XJCciUc3DBmeLtRSAUzaIZhQO59E3mm3MejRN2mgF32X
         gBr0OjBYbbslYgAJiksiVw3NasyXrAt8ICCzOaYjQK5QoIS2GJFZviWM6qX8YuzJ+o
         zB1PR1hvVQBgzDbkUzRwa3kmTVnWruinB+POSBTU=
Date:   Tue, 15 Sep 2020 02:40:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7790: Add VIN1-B and VIN2-G pins,
 groups and functions
Message-ID: <20200914234000.GG15543@pendragon.ideasonboard.com>
References: <20200913182850.32660-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWjnQGKt12_=Z1Lc4fE2hecC6V7ELYpGW6FP2zm8mBp=w@mail.gmail.com>
 <20200914232756.GA1669406@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914232756.GA1669406@oden.dyn.berto.se>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Tue, Sep 15, 2020 at 01:27:56AM +0200, Niklas Söderlund wrote:
> On 2020-09-14 16:47:27 +0200, Geert Uytterhoeven wrote:
> > On Sun, Sep 13, 2020 at 8:29 PM Lad Prabhakar wrote:
> > > Add pins, groups and functions for the VIN1-B [data/clk/sync] and VIN2-G [data].
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > Changes for v2:
> > > * Added complete list of VIN1-B pins
> > > * Renamed vin2_data8_g to vin2_data8g
> > > * Sorted vin1_sync_b pins
> > >
> > > v1 - https://patchwork.kernel.org/patch/11761191/
> > 
> > Thanks for the update!
> > 
> > > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> > > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> > 
> > > @@ -3874,6 +3940,14 @@ static const unsigned int vin1_sync_mux[] = {
> > >         VI1_HSYNC_N_MARK,
> > >         VI1_VSYNC_N_MARK,
> > >  };
> > > +static const unsigned int vin1_sync_b_pins[] = {
> > > +       RCAR_GP_PIN(1, 24), /* HSYNC */
> > > +       RCAR_GP_PIN(1, 25), /* VSYNC */
> > > +};
> > > +static const unsigned int vin1_sync_b_mux[] = {
> > > +       VI1_HSYNC_N_B_MARK,
> > > +       VI1_VSYNC_N_B_MARK,
> > > +};
> > >  static const unsigned int vin1_field_pins[] = {
> > >         RCAR_GP_PIN(1, 13),
> > >  };
> > 
> > Missing field_b and clkenb_b.
> > 
> > > @@ -3959,6 +4039,18 @@ static const unsigned int vin2_data18_mux[] = {
> > >         VI2_R4_MARK, VI2_R5_MARK,
> > >         VI2_R6_MARK, VI2_R7_MARK,
> > >  };
> > > +static const unsigned int vin2_data8g_pins[] = {
> > > +       RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
> > > +       RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
> > > +       RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
> > > +       RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
> > > +};
> > > +static const unsigned int vin2_data8g_mux[] = {
> > > +       VI2_G0_MARK, VI2_G1_MARK,
> > > +       VI2_G2_MARK, VI2_G3_MARK,
> > > +       VI2_G4_MARK, VI2_G5_MARK,
> > > +       VI2_G6_MARK, VI2_G7_MARK,
> > > +};
> > 
> > Laurent, Niklas: are you happy with the name "vin2_data8g", or do
> > you have a better suggestion?
> 
> I learnt recently that traditionally for single 8-bit RAW inputs are 
> named R8 (fist in RGB). But as this really is the G pins and they are 
> labeled as such I'm OK with the name, but I would like to hear Laurent's 
> view as well.

I think we should match the pin names from the datasheet, so a R suffix
isn't a good option. I have a feeling we will suffer with this though,
as here 'g' refers to the VIN green data pins (g[7:0], a.k.a.
data[15:8]), while below 'b' refers to the second set of VIN data pins,
not the blue data pins. One option would be to use "vin2_data8_shift8",
but I'm not sure I'm very fond of that either. I also wonder whether we
shouldn't call this "vin2_g8" instead of "vin2_data8g" as the pins are
named VIN_G[7:0], not VIN_DATAG[7:0].

> > >  static const unsigned int vin2_sync_pins[] = {
> > >         RCAR_GP_PIN(1, 16), /* HSYNC */
> > >         RCAR_GP_PIN(1, 21), /* VSYNC */
> > 
> > > @@ -4310,15 +4402,25 @@ static const struct {
> > >                 VIN_DATA_PIN_GROUP(vin1_data, 10),
> > >                 VIN_DATA_PIN_GROUP(vin1_data, 8),
> > >                 VIN_DATA_PIN_GROUP(vin1_data, 4),
> > > +               VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
> > > +               VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
> > > +               SH_PFC_PIN_GROUP(vin1_data18_b),
> > > +               VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
> > > +               VIN_DATA_PIN_GROUP(vin1_data, 12, _b),
> > > +               VIN_DATA_PIN_GROUP(vin1_data, 10, _b),
> > > +               VIN_DATA_PIN_GROUP(vin1_data, 8, _b),
> > 
> > Missing vin1_data4_b.
> > 
> > >                 SH_PFC_PIN_GROUP(vin1_sync),
> > > +               SH_PFC_PIN_GROUP(vin1_sync_b),
> > >                 SH_PFC_PIN_GROUP(vin1_field),
> > >                 SH_PFC_PIN_GROUP(vin1_clkenb),
> > >                 SH_PFC_PIN_GROUP(vin1_clk),
> > > +               SH_PFC_PIN_GROUP(vin1_clk_b),
> > >                 VIN_DATA_PIN_GROUP(vin2_data, 24),
> > >                 SH_PFC_PIN_GROUP(vin2_data18),
> > >                 VIN_DATA_PIN_GROUP(vin2_data, 16),
> > >                 VIN_DATA_PIN_GROUP(vin2_data, 8),
> > >                 VIN_DATA_PIN_GROUP(vin2_data, 4),
> > > +               SH_PFC_PIN_GROUP(vin2_data8g),
> > >                 SH_PFC_PIN_GROUP(vin2_sync),
> > >                 SH_PFC_PIN_GROUP(vin2_field),
> > >                 SH_PFC_PIN_GROUP(vin2_clkenb),
> > > @@ -4784,10 +4886,19 @@ static const char * const vin1_groups[] = {
> > >         "vin1_data10",
> > >         "vin1_data8",
> > >         "vin1_data4",
> > > +       "vin1_data24_b",
> > > +       "vin1_data20_b",
> > > +       "vin1_data18_b",
> > > +       "vin1_data16_b",
> > > +       "vin1_data12_b",
> > > +       "vin1_data10_b",
> > > +       "vin1_data8_b",
> > 
> > Missing vin1_data4_b.
> > 
> > >         "vin1_sync",
> > > +       "vin1_sync_b",
> > >         "vin1_field",
> > >         "vin1_clkenb",
> > >         "vin1_clk",
> > > +       "vin1_clk_b",
> > >  };
> > >
> > >  static const char * const vin2_groups[] = {
> > 
> > The rest looks good to me.

-- 
Regards,

Laurent Pinchart

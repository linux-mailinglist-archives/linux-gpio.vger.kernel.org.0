Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42ED02DB0E1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 17:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730578AbgLOQDc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 11:03:32 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42091 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730563AbgLOQD2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 11:03:28 -0500
Received: by mail-oi1-f195.google.com with SMTP id l200so23812115oig.9;
        Tue, 15 Dec 2020 08:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M74G11DG5L3kp728ftqWQrc2Nnwi3IabkdW+3k3DW4Y=;
        b=sDvkOLTVh7UYViuerStexZ2BkXzafzQPv/Hhb6tX3tnVCy5G65r6ECHKpCJuqu5pJf
         68XejS1xeZQ1t0sQvrZcjeRVzOkKWDp2Vyhx+paSZMDMIvv4fV4SUkc/HojeB8XN6qJQ
         Wzn6oavAsg+oSJ2FCbESZf9KZik+4ZF8O1wnqR/6fHz3a2K3uLaA3To0smyBK6KFDwBZ
         fstkupTrjx7wal+fPjO6y+WnY38kxXV1PN9MsqrFL61K8lWtkaLS+RRpClZCrFBeAIsT
         ULScNg5XkqG4PictjO+BZqADknDZxcfHQXlK+XBURp6NBCtKmKC1BS0p5EWrUZWr8ApE
         yXhQ==
X-Gm-Message-State: AOAM532gaSCxbQcue3lX0MXb+ejN+P/adJqqGs7xXXKG17z/9E9Qdxfm
        jHMP0JQjph5YKqjIVJziwCH7SCAySTGLI9BF1x0=
X-Google-Smtp-Source: ABdhPJy9KYkFx5Xrnt2k21IcyubPxZNIw8seYfxIs/CHG8xTfxvbOStTR2z/tTjRoCKUFBg1/hmqno5aJD0Eii1/Zm0=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr21761923oia.148.1608048167393;
 Tue, 15 Dec 2020 08:02:47 -0800 (PST)
MIME-Version: 1.0
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607686060-17448-4-git-send-email-yoshihiro.shimoda.uh@renesas.com> <cbb8c9b1884ea5e535bcafda1218b941bd665c21.camel@fi.rohmeurope.com>
In-Reply-To: <cbb8c9b1884ea5e535bcafda1218b941bd665c21.camel@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 17:02:36 +0100
Message-ID: <CAMuHMdVgo1fuY9jPpxUJiCOmN4Ahs7YXddzUfKH+4106i1xiuA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct bd9571mwv
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

On Fri, Dec 11, 2020 at 3:03 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Fri, 2020-12-11 at 20:27 +0900, Yoshihiro Shimoda wrote:
> > To simplify this driver, use dev_get_regmap() and
> > rid of using struct bd9571mwv.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/regulator/bd9571mwv-regulator.c | 49 +++++++++++++++++----
> > ------------
> >  1 file changed, 26 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/regulator/bd9571mwv-regulator.c
> > b/drivers/regulator/bd9571mwv-regulator.c
> > index e690c2c..02120b0 100644
> > --- a/drivers/regulator/bd9571mwv-regulator.c
> > +++ b/drivers/regulator/bd9571mwv-regulator.c
> > @@ -17,7 +17,7 @@
> >  #include <linux/mfd/bd9571mwv.h>
> >
> >  struct bd9571mwv_reg {
> > -     struct bd9571mwv *bd;
> > +     struct regmap *regmap;
>
> As a 'nit':
> I might consider adding the dev pointer here to avoid extra argument
> with all the bkup_mode functions below. (just pass this struct and
> mode). But that's only my preference - feel free to ignore this comment
> if patch is Ok to Mark, Marek & Others :)

Struct regmap already contains a struct device pointer, but that's internal
to regmap.

Perhaps adding a regmap_device() helper to retrieve the device pointer
might be worthwhile?
Or a regmap_err() helper to print error messages?

>
> Overall, looks good to me :)
> Reviewed-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>
> >
> >       /* DDR Backup Power */
> >       u8 bkup_mode_cnt_keepon;        /* from "rohm,ddr-backup-power" */
> > @@ -137,26 +137,30 @@ static const struct regulator_desc regulators[]
> > = {
> >  };
> >
> >  #ifdef CONFIG_PM_SLEEP
> > -static int bd9571mwv_bkup_mode_read(struct bd9571mwv *bd, unsigned
> > int *mode)
> > +static int bd9571mwv_bkup_mode_read(struct device * dev,
> > +                                 struct bd9571mwv_reg *bdreg,
> > +                                 unsigned int *mode)
> >  {
> >       int ret;
> >
> > -     ret = regmap_read(bd->regmap, BD9571MWV_BKUP_MODE_CNT, mode);
> > +     ret = regmap_read(bdreg->regmap, BD9571MWV_BKUP_MODE_CNT,
> > mode);
> >       if (ret) {
> > -             dev_err(bd->dev, "failed to read backup mode (%d)\n",
> > ret);
> > +             dev_err(dev, "failed to read backup mode (%d)\n", ret);
> >               return ret;
> >       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

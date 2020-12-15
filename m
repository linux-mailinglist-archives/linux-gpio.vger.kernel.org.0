Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D8F2DB10F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 17:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbgLOQOC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 11:14:02 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44058 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730836AbgLOQN5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 11:13:57 -0500
Received: by mail-ot1-f68.google.com with SMTP id f16so19853623otl.11;
        Tue, 15 Dec 2020 08:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dZX+PfojFjy0yr/TmFs/HzJ4t9P2vdOR9k+xSuXgLY=;
        b=N/1h9mtEJK6vrFkHLzMjWqj8F0f4bkNbZBEBG6jUqOCV8UVKn1TGhEtohC/KXVtp+D
         4jYg1RqzIcXEuCf7i4Cuj6nAWTrtSs1cwv4leJ90gUpWlaXhz+bqoFikDgVDqVboTYpq
         FudRYnFUcF1P4qGiiBhg3aSGbFR6W/xR38g5HITGWH9PMwv5y+74KxniNcTwYTjSOSwn
         T3lX3aKX0i2RGgnxk06J+rY5ho+a5dx5Ur/HmlNq30L4dCdixwN3t1LULhKC6HHVJBlW
         4JxurqUIAK2JxqH+gi/fOIPNWtYTQrCgeJAksYc7ouOcmD3+G7VCULY56VizEvQLyR+L
         bERg==
X-Gm-Message-State: AOAM533tjXeDjGEwOHmnTQ9I+eVf1oP8ZzsMDcAvjsRcs+rGknOEu2EL
        v5sxPuvwbVR2nbagK+XhPk1ZPuVF4j6n+9d33EQ=
X-Google-Smtp-Source: ABdhPJyC2szoZZ+v8jYR7I278WqnNNwChldmp+LkfpuiP5UwaBBNwF+INcv0fWL6Lqi8IvXQS8/A5cHxtcYWfik1H0M=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr23721855oth.250.1608048796742;
 Tue, 15 Dec 2020 08:13:16 -0800 (PST)
MIME-Version: 1.0
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607686060-17448-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <cbb8c9b1884ea5e535bcafda1218b941bd665c21.camel@fi.rohmeurope.com> <CAMuHMdVgo1fuY9jPpxUJiCOmN4Ahs7YXddzUfKH+4106i1xiuA@mail.gmail.com>
In-Reply-To: <CAMuHMdVgo1fuY9jPpxUJiCOmN4Ahs7YXddzUfKH+4106i1xiuA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 17:13:05 +0100
Message-ID: <CAMuHMdWuoRMsNMPKgni3HENRT7RnCTyEjs5Zy2r4gw9f2B0Cng@mail.gmail.com>
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

On Tue, Dec 15, 2020 at 5:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Dec 11, 2020 at 3:03 PM Vaittinen, Matti
> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > On Fri, 2020-12-11 at 20:27 +0900, Yoshihiro Shimoda wrote:
> > > To simplify this driver, use dev_get_regmap() and
> > > rid of using struct bd9571mwv.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > >  drivers/regulator/bd9571mwv-regulator.c | 49 +++++++++++++++++----
> > > ------------
> > >  1 file changed, 26 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/regulator/bd9571mwv-regulator.c
> > > b/drivers/regulator/bd9571mwv-regulator.c
> > > index e690c2c..02120b0 100644
> > > --- a/drivers/regulator/bd9571mwv-regulator.c
> > > +++ b/drivers/regulator/bd9571mwv-regulator.c
> > > @@ -17,7 +17,7 @@
> > >  #include <linux/mfd/bd9571mwv.h>
> > >
> > >  struct bd9571mwv_reg {
> > > -     struct bd9571mwv *bd;
> > > +     struct regmap *regmap;
> >
> > As a 'nit':
> > I might consider adding the dev pointer here to avoid extra argument
> > with all the bkup_mode functions below. (just pass this struct and
> > mode). But that's only my preference - feel free to ignore this comment
> > if patch is Ok to Mark, Marek & Others :)
>
> Struct regmap already contains a struct device pointer, but that's internal
> to regmap.
>
> Perhaps adding a regmap_device() helper to retrieve the device pointer
> might be worthwhile?

-EEXISTS ;-)

struct device *regmap_get_device(struct regmap *map)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

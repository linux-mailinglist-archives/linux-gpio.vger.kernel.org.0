Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147E534AA5F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 15:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhCZOoz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 10:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhCZOou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 10:44:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00182C0613B2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 07:44:49 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id b16so6604656eds.7
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIvv+tA1LMtQGGiDuq1c1q8EFA36Pgjy5WH53f7HNx4=;
        b=iYunu1vYc+nYwytgwT0664RyXaLgIIwSfKZuAagqasIYu9jy9foMpyWg8GYSfAPoSl
         7gXmommvATo5YilSMCWKppg6LleO/43CCNHA5B/ru6Jk9NMhwzLrSDFzr+PaGarm07W7
         mBEkYdqmxjgNwwSk3y9oMCN94y3a4cOYuEb01nuzMH/0mqtLNYzzrVRIT/+ZbQBty8W9
         DoeDDyGU2UhxKa2OOCRbp8rXwfrOEd5I+reszDYXU/CDUOhm55Da+3J7D9UXrfsMjDCR
         LtmDAYZ2TfiSrOTrb9+jife+nA0bQs7GxtgJWytM/0bTimRuWkn57mcH3yp8a70YHvQP
         WdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIvv+tA1LMtQGGiDuq1c1q8EFA36Pgjy5WH53f7HNx4=;
        b=O+qaMCQK8IDJBxGkMaN+tm11wEwHuNTZfCd++b5v6liCSXzV5BDxDFtbfx2BGSx9rx
         gg+1bd07eub6EZ+jkRr2+ipFTac2pyfDeez12z4qHFBoIkmZCYRp6C8jB6GHTIK9D6EL
         nX1u3acuFh0gEqWe6qgnOsh3++QjECzxep02tN5xLxRa2BWkXFY8DQ0SdJKQgn38Tlqz
         7Ekfmc4S80zElF0rY+GHYuFyc2njYNjQU33lDpvNYez4/XC2CwU0l0oqv3+dNsUD5dB3
         4has9ADkpTZ8Iy2hpyT24RyENvxea6Xj5X5aVsOHQ0v3Q6Ika2Nvp2woWo0OhElOB1Sc
         GN3w==
X-Gm-Message-State: AOAM531k2qjegnihDLbHuT3AyPLSbOPcBv99y3Lb+bGMj+Q45lm3RlLC
        J0m0OCe2Hj2Zt7R4gATVoW7q3m+4cWzS2v2rVuJG+Q==
X-Google-Smtp-Source: ABdhPJyu4ZYMKthWiIfIsLH5cJYN/YmYPXtv3Hl6Hl6YxrLqty3+4cM/fQnPI6E5xbB/otdrwsE35jlQjEFjqhXSpzo=
X-Received: by 2002:a05:6402:17d6:: with SMTP id s22mr15385463edy.232.1616769888652;
 Fri, 26 Mar 2021 07:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <50f72f1f7f28e969a1e0353712fcc530bce9dd06.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <CAMpxmJVjnAMig16qWkjpaHwQ+4Ld9yEc-gg-CGv28QQYBB6gNg@mail.gmail.com> <afaff71f75cd476c828671779acd1a3f8b66b62c.camel@fi.rohmeurope.com>
In-Reply-To: <afaff71f75cd476c828671779acd1a3f8b66b62c.camel@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 26 Mar 2021 15:44:38 +0100
Message-ID: <CAMpxmJXe9EVaDooPYphRV_500Dd9fU7WQHAFFL_-2-usxZG9kA@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] gpio: support ROHM BD71815 GPOs
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 23, 2021 at 10:57 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
>
> On Tue, 2021-01-19 at 12:07 +0100, Bartosz Golaszewski wrote:
> > On Tue, Jan 19, 2021 at 8:23 AM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > Support GPO(s) found from ROHM BD71815 power management IC. The IC
> > > has two
> > > GPO pins but only one is properly documented in data-sheet. The
> > > driver
> > > exposes by default only the documented GPO. The second GPO is
> > > connected to
> > > E5 pin and is marked as GND in data-sheet. Control for this
> > > undocumented
> > > pin can be enabled using a special DT property.
> > >
> > > This driver is derived from work by Peter Yang <
> > > yanglsh@embest-tech.com>
> > > although not so much of original is left.
> > >
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> >
> > Hi Matti,
> >
> > looks great, just a couple nits.
>
> Hello Bartosz,
>
> I think fixed all the nits to v3. Can I translate this to an ack? (I
> will respin the series as I guess the regulator part may have fallen
> through the cracks so I'd like to add the relevant acks :] )
>
> Best Regards
>         Matti Vaittinen

Yes:

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

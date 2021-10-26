Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C8643AD50
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 09:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhJZHiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 03:38:25 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:37604 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhJZHiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 03:38:25 -0400
Received: by mail-ua1-f48.google.com with SMTP id f4so27353655uad.4;
        Tue, 26 Oct 2021 00:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cskXgtg91PRxnTvZsU1AQy3+KEjaEciMaMxgC4WMxUc=;
        b=Dyyx6Uu871Y5iW5Wm4CPuBoVSpzmL4AAGWK1Dmc23Qcsuu+c0RPQyZkFj17zJSKqhc
         hxYApgAkfMJHMU4PLb7ZMpUv01bzfm+06o3HbP2iN0JNRjCrpaXesZaSDjIbVTECih3c
         PNOIJqkDmq8PAepCaF6ijik0qqSXF2nnmiYuXMGDH9F2MEGGdZbzLe32RnQQwmS/n7MI
         mbtRK5eXX+1x7T3/PdghmyBtVlug3GkaiXtFBAnXk5TBSoO6QP5AqmCMhR7BvCszUmgD
         Ts2PGsENojBIIJc1LzDcFb3ciyHBHQCrl0WZVNqXIOEt1b+0xiuva29E1T4J1QFy+dSa
         UIyw==
X-Gm-Message-State: AOAM530mSWEdtnefJqqDLHFH/8V0K+een9EGZCkK0Ig5gSNUSzX0uH3V
        L4bn2DE7Vl4pxXjOJNHq2QGM4tDTJyyOSw==
X-Google-Smtp-Source: ABdhPJyMKxGOWYdD6151aC8zmTcjQe8n0e/y+/flfbUT1VmoqJj4h8TXU+7b7BwszgWVmpRElg+bUQ==
X-Received: by 2002:a05:6102:cc8:: with SMTP id g8mr21755713vst.47.1635233760931;
        Tue, 26 Oct 2021 00:36:00 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id o18sm10801648vkb.21.2021.10.26.00.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:36:00 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id p23so14569748uaa.6;
        Tue, 26 Oct 2021 00:36:00 -0700 (PDT)
X-Received: by 2002:a67:d111:: with SMTP id u17mr22000314vsi.37.1635233760625;
 Tue, 26 Oct 2021 00:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <2188ede78110c64b8a3bfbfa794a085dac0e4cd2.1634645735.git.geert+renesas@glider.be>
 <20211019124315.5dg5pfaas2qmm7lx@uno.localdomain> <CAMuHMdX6OO19+pgxUYATT9AZ5BuXXMzRCPbtn7aZC_Lc6pt96g@mail.gmail.com>
In-Reply-To: <CAMuHMdX6OO19+pgxUYATT9AZ5BuXXMzRCPbtn7aZC_Lc6pt96g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Oct 2021 09:35:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3OWVd8FSzD27Hcchn-_mvBquCHrQ73j5pmYTY=A-GCQ@mail.gmail.com>
Message-ID: <CAMuHMdU3OWVd8FSzD27Hcchn-_mvBquCHrQ73j5pmYTY=A-GCQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: Fix kerneldoc function names
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 2:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Oct 19, 2021 at 2:42 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > On Tue, Oct 19, 2021 at 02:34:22PM +0200, Geert Uytterhoeven wrote:
> > > --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> > > @@ -757,7 +757,7 @@ static int rza1_gpio_request(struct gpio_chip *chip, unsigned int gpio)
> > >  }
> > >
> > >  /**
> > > - * rza1_gpio_disable_free() - reset a pin
> > > + * rza1_gpio_free() - reset a pin
> > >   *
> > >   * Surprisingly, disable_free a gpio, is equivalent to request it.
> >
> > s/disable_free/free ?
>
> Yup, will fix while applying to:
>
>     disabling a gpio is equivalent to requesting it

"freeing...", of course.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

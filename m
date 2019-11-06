Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D180F1628
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 13:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbfKFMil (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 07:38:41 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37353 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfKFMil (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 07:38:41 -0500
Received: by mail-ot1-f67.google.com with SMTP id d5so8641168otp.4;
        Wed, 06 Nov 2019 04:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UICFSnf/Q0mqFlP3f0Qejag6EmjSHl2tMUqDxMyFEec=;
        b=GIS15WkmJsIlA0vgTCWf32aUt24Bx/qMYIF4vQUDVWof6PjKlFJ9MGzbeRqaeKyVV6
         Bdh7nxZz0t00m5/kWhCUYKEHuuynxrckPwZkxnRAyla948cXoM62mTh7XCAyvd6nQCYM
         XoyA0axQX+XQBzMRxz4gBphpUA1Pn40fRhpWoov+RXkPmIchij6UFG+9ROX5G0LwS9VU
         nG50Y+jltLroDOhtVCQGsO1RpdidOvByXcW089wtFlw25BbEAK+T7qRGND06gDlam2Yd
         sBMpqVobOtTGIFsYKAlgSOJsQcvqFqG+l6cR5sOK+xxBdWA6EtwxGHvmiVbpEu22Bg8Z
         NVQQ==
X-Gm-Message-State: APjAAAXhSWaEaOcFnfiM4V/6ZRJO2569DykQYK61b9o7CyztSj7/V3oO
        p+ly8FT3LOkrlD6CnYWjzeMGsEYGb3nk4O2Nt04=
X-Google-Smtp-Source: APXvYqyhWIltU0HpSVYfumGqz+3W8qvdpa80PYpaow/79hyU5A9FFee2aF0j51+cFQ12EI04JyhYIado0cMDBe9WX3Q=
X-Received: by 2002:a9d:73cd:: with SMTP id m13mr1666991otk.145.1573043920420;
 Wed, 06 Nov 2019 04:38:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
 <0a1fe4365ef599adde42396f0bb735c8623f679c.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106053446.GD5290@kw.sim.vm.gnt> <c7cc7d66a5d3e398bf5109f58260e9dca5a317df.camel@fi.rohmeurope.com>
In-Reply-To: <c7cc7d66a5d3e398bf5109f58260e9dca5a317df.camel@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Nov 2019 13:38:29 +0100
Message-ID: <CAMuHMdXQ_MP0j1saU1KdQwG5ooA5N5x0=MjJJX+p4EN1e11K-A@mail.gmail.com>
Subject: Re: [PATCH 13/62] gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "simon.guinot@sequanux.org" <simon.guinot@sequanux.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

On Wed, Nov 6, 2019 at 7:45 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2019-11-06 at 06:34 +0100, Simon Guinot wrote:
> > On Tue, Nov 05, 2019 at 12:16:03PM +0200, Matti Vaittinen wrote:
> > > It's hard for occasional GPIO code reader/writer to know if values
> > > 0/1
> > > equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> > > GPIO_LINE_DIRECTION_OUT to help them out.
> > >
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > >  drivers/gpio/gpio-f7188x.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-
> > > f7188x.c
> > > index fdc639f856f1..cadd02993539 100644
> > > --- a/drivers/gpio/gpio-f7188x.c
> > > +++ b/drivers/gpio/gpio-f7188x.c
> > > @@ -250,7 +250,10 @@ static int f7188x_gpio_get_direction(struct
> > > gpio_chip *chip, unsigned offset)
> > >
> > >     superio_exit(sio->addr);
> > >
> > > -   return !(dir & 1 << offset);
> > > +   if (dir & 1 << offset)
> > > +           return GPIO_LINE_DIRECTION_OUT;
> > > +
> > > +   return GPIO_LINE_DIRECTION_IN
> >
> > Hi Matti,
> >
> > I am probably missing something but I can't find
> > GPIO_LINE_DIRECTION_IN
> > and GPIO_LINE_DIRECTION_OUT defined anywhere.
>
> Sorry. I accidentally sent the patch 01/62 to limited audience - and
> also messed up the message-ID from the series so threading messages is
> probably not working :( I did resend the patch adding defines to all
> reviewers yesterday - title should be "[RESEND PATCH 01/62] gpio: Add
> definition for GPIO direction".
>
> > Besides I am an occasional code reader/writer and I find the original
> > code easy to understand.
>
> Glad to hear that. When I read code:
>
> return !(dir & 1 << offset);
>
> It's impossible for me to tell if dir having bit at offset 'offset' set
> means IN or OUT - I know the meaning of code, it checks this bit for
> in/out - but which dir value is IN and which is OUT?
>
> When this is written as:
>
>         if (dir & 1 << offset)
>                 return GPIO_LINE_DIRECTION_OUT;
>
>         return GPIO_LINE_DIRECTION_IN
>
> it get's quite obvious even for me that having the matching bit set
> means direction to be OUT.

"suggest parentheses around... " warning?

    if (dir & BIT(offset))
            ...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

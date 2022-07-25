Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1004157FC40
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 11:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiGYJUf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 05:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234461AbiGYJUd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 05:20:33 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F0962C6
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 02:20:32 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id z23so19267134eju.8
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kaNd6PunDju54Ot7JCdvnvyXR6XKFTa01wTkyaQA44Q=;
        b=I/Vurrzl6VQSz7Vruk0bl4/TXBuhACK2i9YyyLywCczKXBl1dv1Y4vz7oounhtcdSe
         MZ4IU2m35FzsMn22ndpEIuLVVdcaIzAlvukUs+fQ0uy3ILx/Kga4m89cEpeR0L3pzA1F
         xV9ZhRVoL3tA7wYdzjFDB1v6XMt3kVOrjxwIWIJ0FVue1IkPqNP7XJQBY9x6oH9l39FB
         kIEDgkPAyY7auUnpOp+mbLj3bQk28IKl1y26RFQpOlJWqwHzOGVFpMm86jIGP2NnK5NU
         /zBYFiPVSR3AZaZBGo9iWSnigDaeVzV/Vjce24GgHorElZPrCqqK1lNudNRpqpgAIGC9
         rEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kaNd6PunDju54Ot7JCdvnvyXR6XKFTa01wTkyaQA44Q=;
        b=vTtXFeMnKvI4+YAUcSioY6NNBusfRFwKDPRYxFa13uRXWVGFhDZtsO+om+k22xObwq
         tcRiconu2wQNcJjCoELc6fHL40zqfOzFnA/vZzK421CITVauObo3De7gjRimr2BXWHjr
         RfBdChY++mPK+DjSOF2jrKUKLeDJOJj3VsKx6uKuIt2UlNHopEdIVIx1WuDquyQlOXS2
         VISqEuzFVjprH+61nn+PKZlLOw/hjxQK3mWx5hqadpBaxcP2+hTgSJEdw+ocZCiA5NHO
         esX7Y1xf3out1W/22USULFaj6VpiqUohtot4JDZ/LBEPIH9zdn/u2LIyjAA4lLfdcFiA
         BCMw==
X-Gm-Message-State: AJIora/HmHuP8bLtw727Cia4+f2ei+mZXzhOJ9gn5+OLO7c5Il93Yn16
        0yQqMBFQucsJLZeArCIGNN/b/jn9jEMnkZ74eJ8=
X-Google-Smtp-Source: AGRyM1sqTBY2yKi8qAwNR3YbZ/Y3xqzR+1FAcEmmc503HRQlYA8cXrk1L8ooAmULtIWfxlq2sLcXn9IfTXk4B0q+Ygo=
X-Received: by 2002:a17:906:9b09:b0:72b:9612:d373 with SMTP id
 eo9-20020a1709069b0900b0072b9612d373mr9116755ejc.606.1658740830680; Mon, 25
 Jul 2022 02:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
 <CAHp75VeRfguxwjf3y3qWSQCwQF=cOFvt7iP0KVJMnGwdyPvUnA@mail.gmail.com>
 <CAHp75Vdx+2zJ_dNAgXHnRPhMn7csX=P-NPcvHWmMJ1iLZ_WYBg@mail.gmail.com> <20220719071931.lcbbwoei6nmd6kx5@pengutronix.de>
In-Reply-To: <20220719071931.lcbbwoei6nmd6kx5@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jul 2022 11:19:54 +0200
Message-ID: <CAHp75VfLQujQx5pBJ_6rAjkoHD5nd5APqXXjDccNQ1fUiXXh0g@mail.gmail.com>
Subject: Re: Is a multiplexer using latches a gpio controller?
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2022 at 9:19 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jul 19, 2022 at 12:11:56AM +0200, Andy Shevchenko wrote:
> > On Tue, Jul 19, 2022 at 12:05 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Jul 18, 2022 at 10:27 PM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:

> > > > we have a customer board here that uses two 8 port latches to drive
> > > > LEDs. The setup looks as follows:
> > > >
> > > > CLK0 ----------------------.        ,--------.
> > > > CLK1 -------------------.  `--------|>    #0 |
> > > >                         |           |        |
> > > > IN0 -----------------+--|-----------|D0    Q0|-----|=E2=97=81
> > > > IN1 ---------------+-|--|-----------|D1    Q1|-----|=E2=97=81
> > > > IN2 -------------+-|-|--|-----------|D2    Q2|-----|=E2=97=81
> > > > IN3 -----------+-|-|-|--|-----------|D3    Q3|-----|=E2=97=81
> > > > IN4 ---------+-|-|-|-|--|-----------|D4    Q4|-----|=E2=97=81
> > > > IN5 -------+-|-|-|-|-|--|-----------|D5    Q5|-----|=E2=97=81
> > > > IN6 -----+-|-|-|-|-|-|--|-----------|D6    Q6|-----|=E2=97=81
> > > > IN7 ---+-|-|-|-|-|-|-|--|-----------|D7    Q7|-----|=E2=97=81
> > > >        | | | | | | | |  |           `--------'
> > > >        | | | | | | | |  |
> > > >        | | | | | | | |  |           ,--------.
> > > >        | | | | | | | |  `-----------|>    #1 |
> > > >        | | | | | | | |              |        |
> > > >        | | | | | | | `--------------|D0    Q0|-----|=E2=97=81
> > > >        | | | | | | `----------------|D1    Q1|-----|=E2=97=81
> > > >        | | | | | `------------------|D2    Q2|-----|=E2=97=81
> > > >        | | | | `--------------------|D3    Q3|-----|=E2=97=81
> > > >        | | | `----------------------|D4    Q4|-----|=E2=97=81
> > > >        | | `------------------------|D5    Q5|-----|=E2=97=81
> > > >        | `--------------------------|D6    Q6|-----|=E2=97=81
> > > >        `----------------------------|D7    Q7|-----|=E2=97=81
> > > >                                     `--------'
> > > >
> > > >
> > > > So to change output 2 of latch #1 you have to apply the changed lev=
el on
> > > > IN2, apply the previous level on the other inputs (to keep the othe=
r
> > > > outputs constant) and toggle CLK1 once.
> > > >
> > > > This way you can drive 16 LEDs (or in general outputs) using only 1=
0
> > > > GPIOs. (And with a higher number of latches the proportion becomes =
a bit
> > > > more useful.)
> > > >
> > > > Actually this construct is a general GPO (no input :-) controller, =
and I
> > > > wonder if you would accept a driver that models it as a gpio contro=
ller.
> > > >
> > > > The dt binding could look as follows:
> > > >
> > > > latch-gpo {
> > > >         compatible =3D "latch-gpo";
> > > >         pinctrl-0 =3D <...>;
> > > >         pinctrl-names =3D <...>;
> > > >
> > > >         clk-gpios =3D /* CLK0 */ <...>, /* CLK1 */ <...>;
> > > >         data-gpios =3D /* IN0 */ <...>, /* IN1 */ <...>, ...;
> > > > };
> > > >
> > > > What do you think?
> > >
> > > Bart, what happened to the [1]? Is it abandoned, forgotten?
> > >
> > > Uwe, isn't it what you need?
> >
> > It needs "downstream" GPIO and ->get_direction(), etc should act accord=
ingly.
>
> No, IIUC this is different. With a multiplexer there can always only be
> a single line that is controlled (or read) and the other lines are (I
> assume) high-z.

I don't know the Linux mux framework implementation, but from a
hardware perspective the mux is what you have. In the GPIO (mux)
driver you need to be able to switch banks as you wish, the rest is
the drivers' business. If gpio-cascade gives no possibility to do that
due to broken mux in Linux, then indeed, it can't be accepted at all
and I have to withdraw my tags from that.

> The latch approach above is about 16 outputs and at all times the state
> off all 16 lines is fixed because the latches keep their state when the
> clk line is kept stable.

> > > [1]: https://lore.kernel.org/linux-gpio/20220205215918.8924-1-maukka@=
ext.kapsi.fi/

--=20
With Best Regards,
Andy Shevchenko

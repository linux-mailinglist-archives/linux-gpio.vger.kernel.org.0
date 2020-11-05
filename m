Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08CB2A7B26
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgKEJ6r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:58:47 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46324 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKEJ6r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:58:47 -0500
Received: by mail-ot1-f68.google.com with SMTP id g19so858030otp.13;
        Thu, 05 Nov 2020 01:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Me0TxsAtEvEGhLYsiw3jk0Khslvv8w6ZE1Tr6N+Xt8k=;
        b=elmIFE3G80GXQIYa0K++eQcSR12EJWrR9fZ3Ljq5SY2lYmHo5IWYmcppugXWtSixc8
         Af7ofUk2VTajm42aofkazQU3PeQDos1BA0i8yssBWcN1robfA3nuo9HbbOeTd64Gswzb
         I5maJNhdmF/ub51EFOrSrd4IsCapbhIRdUhQDqu2CqO9/JKv8xrdODm6ABDzaG2XH2MT
         gHNc6/i2R8LzKyYQ5HjPZk52qKDESeOhfG8MeWtSYImqNm51ZqE1Go5diDVxRE8U0bNi
         68Uf1HIvn8UhJSFZQjevKyummGOfXi+jEJt0jIyo7TEr+8/bg663epUJTydaLtuVQqOh
         tzpg==
X-Gm-Message-State: AOAM5331U7ogX/GU9otuC1UY5IhfeLqhA9r0doImIA8Twv0fhejqElWi
        uwjmB40bSvg2clI0Xb1ra/gY+/JRxlqhJeQ1P20=
X-Google-Smtp-Source: ABdhPJwcS8F6wj5rpD8VCt8uuB6TBYtg185qCmGvg2SR6W9XfEymKzsePF7yTKk5Rogi7kgCAA7ewpo0E9RXmxpImKA=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr1085013otc.145.1604570326715;
 Thu, 05 Nov 2020 01:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20201028151637.1734130-1-geert+renesas@glider.be>
 <20201028151637.1734130-4-geert+renesas@glider.be> <CACRpkdYVT0KL4+KdE0QP7UEKCrAUOOS0aAXV7xfY_28DtpvokA@mail.gmail.com>
In-Reply-To: <CACRpkdYVT0KL4+KdE0QP7UEKCrAUOOS0aAXV7xfY_28DtpvokA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 Nov 2020 10:58:35 +0100
Message-ID: <CAMuHMdXOG6Wj-3OK6h_R7CZZt0N0+ajyzkb_Hzpz+CZcq9AdqQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] pinctrl: renesas: Reorder struct sh_pfc_pin to remove hole
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Nov 5, 2020 at 10:52 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Oct 28, 2020 at 4:16 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > On arm64, pointer size and alignment is 64-bit, hence a 4-byte hole is
> > present in between the enum_id and name members of the sh_pfc_pin
> > structure.  Get rid of this hole by sorting the structure's members by
> > decreasing size.
> >
> > This saves up to 1.5 KiB per enabled SoC, and reduces the size of a
> > kernel including support for all R-Car Gen3 SoCs by more than 10 KiB.
> >
> > This has no size impact on SH and arm32.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/pinctrl/renesas/sh_pfc.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
> > index eff1bb872325ef3a..3b390dffacb4910d 100644
> > --- a/drivers/pinctrl/renesas/sh_pfc.h
> > +++ b/drivers/pinctrl/renesas/sh_pfc.h
> > @@ -34,10 +34,10 @@ enum {
> >  #define SH_PFC_PIN_CFG_NO_GPIO         (1 << 31)
> >
> >  struct sh_pfc_pin {
> > -       u16 pin;
> > -       u16 enum_id;
> >         const char *name;
> >         unsigned int configs;
> > +       u16 pin;
> > +       u16 enum_id;
> >  };
>
> Hehehe :D
>
> The compiler people have something that is called "premature optimization"
> which is when you try to outsmart the compiler.
>
> So since you have metrics on this you have obviously outsmarted the
> ARM64 compiler (I guess GCC).
>
> What I'm thinking is that some compiler person should look at this
> and say that "yeah sometimes you have to do that". In this case
> I suppose the compiler really isn't allowed to reshuffle struct members
> in memory since there is plenty of code that relies on them being
> laid out strictly in the order they are defined into the struct. So this
> is really necessary.

The compiler is not allowed to reorder the members (FWIW, this
might be a description of hardware register layout).

> Second I think it warrants a comment in the code to be careful with
> aligning structs on 64bit boundaries?

IMHO that's overkill: if we go that route, we have to add such comments
to every structure that contains members of different sizes...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

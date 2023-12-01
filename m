Return-Path: <linux-gpio+bounces-840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D4D800DB1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 15:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70BDE281254
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21B53D971;
	Fri,  1 Dec 2023 14:50:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F5DD6C;
	Fri,  1 Dec 2023 06:50:49 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5d3687a6574so19772247b3.2;
        Fri, 01 Dec 2023 06:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701442248; x=1702047048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M7EoJ54GWiJhbBfXyqo1Y8wwLQezejAIFdBP9qR8vI=;
        b=Dv6zb5+ZOvJuy7uO/M4aTRMKxYMJ7bEk2iGGHaw8V1fuRgcSMighFNYo8XaaJSCnRm
         fvShrPCE/hsKQdkDoeWtdcoTINCTwMZzR7k4w/LJPp+iNM9mQzUnHcwqUSSNoZ7nb8em
         mkZ/fEmstZW5ZP0iCmdQ4NWKE46gxIDDYwpkNB0S4a8iqzoRlU0idGmpvX4cwdua6vWJ
         Vw29W81WY/WZyt+mS8VtYeKn95AlVN4BJqKmWWGb+65EK7H2NsiLfYioHpwZ8v8oRRIP
         tLuTeKo75izkkaOzE0cbTRFhKhYu3LVstzvn584OtqFZhUTNpRsflsOZC3raXeK6VePB
         pl3Q==
X-Gm-Message-State: AOJu0Yw3JpNSnWLrxibpXIZuL+zwB2/L3HQSGL2oq+DlFWGMZPFJpjry
	Z9XJPiukWQMsKioju0YwbJWNb5p9cWtSgQ==
X-Google-Smtp-Source: AGHT+IEfubUZG5DYXHsR1LmwirWjxbZBTvIncwwq62+VlAMZQhzhBMjlim261rS6bXBXv6uO2waEyg==
X-Received: by 2002:a81:bb48:0:b0:5ae:c0e2:da1b with SMTP id a8-20020a81bb48000000b005aec0e2da1bmr27146371ywl.45.1701442248289;
        Fri, 01 Dec 2023 06:50:48 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id l68-20020a815747000000b005d36f6c7836sm986942ywb.104.2023.12.01.06.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 06:50:47 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so578765276.0;
        Fri, 01 Dec 2023 06:50:47 -0800 (PST)
X-Received: by 2002:a25:4086:0:b0:db5:46ef:b3ca with SMTP id
 n128-20020a254086000000b00db546efb3camr4102295yba.47.1701442247565; Fri, 01
 Dec 2023 06:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006121823.229193-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWHkhonVmbjVCfc-s1iiUSOBNg9djWxaURNLHoAEaS3+w@mail.gmail.com> <TYCPR01MB112691C60EC823F8B55C6AEBB86D3A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB112691C60EC823F8B55C6AEBB86D3A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 15:50:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBWbhL-wNEkcX63P68WSAK1V8ef0MQPj_NCnAQZPtCNg@mail.gmail.com>
Message-ID: <CAMuHMdXBWbhL-wNEkcX63P68WSAK1V8ef0MQPj_NCnAQZPtCNg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Configure interrupt input mode
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Oct 12, 2023 at 6:24=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Configure interrupt input
> > mode
> > On Fri, Oct 6, 2023 at 2:18=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > > Configure GPIO interrupt as input mode. Also if the bootloader sets
> > > gpio interrupt pin as function, override it as gpio.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > @@ -1580,6 +1580,26 @@ static const struct irq_chip rzg2l_gpio_irqchi=
p =3D
> > {
> > >         GPIOCHIP_IRQ_RESOURCE_HELPERS,  };
> > >
> > > +static int rzg2l_gpio_interrupt_input_mode(struct gpio_chip *chip,
> > > +unsigned int offset) {
> > > +       struct rzg2l_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > > +       const struct pinctrl_pin_desc *pin_desc =3D &pctrl-
> > >desc.pins[offset];
> > > +       u32 *pin_data =3D pin_desc->drv_data;

Note to self: Prabhakar's patch[1] changes this to an array of u64s.

> > > +       u32 off =3D RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> > > +       u8 bit =3D RZG2L_PIN_ID_TO_PIN(offset);
> > > +       u8 reg8;
> > > +       int ret;
> > > +
> > > +       reg8 =3D readb(pctrl->base + PMC(off));
> > > +       if (reg8 & BIT(bit)) {
> > > +               ret =3D rzg2l_gpio_request(chip, offset);
> >
> > Who is taking care of calling pinctrl_gpio_free() when the interrupt ha=
s
> > been freed?
>
> At the moment no, maybe we can use of rzg2l_gpio_irq_domain_free() to cal=
l pinctrl_gpio_free(),
> Similar to freeing bitmap region??

Sounds good to me.
Thanks!

[1] "[PATCH v3 1/3] pinctrl: renesas: rzg2l: Include pinmap in
    RZG2L_GPIO_PORT_PACK() macro"
    https://lore.kernel.org/linux-renesas-soc/20231201131551.201503-2-prabh=
akar.mahadev-lad.rj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


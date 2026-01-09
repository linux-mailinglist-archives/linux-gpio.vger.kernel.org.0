Return-Path: <linux-gpio+bounces-30340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0772D08F34
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 12:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B1C23019BFF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 11:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51923590BB;
	Fri,  9 Jan 2026 11:38:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D73382CB
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958682; cv=none; b=VCYktm6SiF1RsotsbgAqrSVXHKtHtrQGRGIbNThdF/SHU2vMhCgo/LN42EaPRrqnTbGWixGwlj1/UePWsR47r3J/+QvmS2jWE4TnIe63BmrGwO549VcaolbF8p/pM3OaH+572CKolkDFh0mXWE/y6A1E1INd3DwcD0Q1PO3+quI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958682; c=relaxed/simple;
	bh=i63s9N+RFDshCdHONQ3RAploJwbK2eQ1jp6yzkT5FAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZxA70EqWhCLr67IYTNhPvU2+ktk6ACNCRoAnKCHIj0+5CmAVHHgokS+s+yLOjWxRFniwKI338HzvPSo/aJ1Nxniqj0sGa6NFJJmv8ulZfs75Zx7vlo36l2uN+oz8yWfYiRYrn5B3o8ghE4Gi3b6BJcDKYH9SBe9bN3zMJ0cNiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5636dce976eso67815e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 03:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958679; x=1768563479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pXlro+wsyYzE2hsjtxyvyXBKssCa/B4tgGYr4NDDp8=;
        b=Dxlqxe2vD8PKO/BjIqieCu8kBZIepWVXBkrH3fH3kuVsdE2Q1ddZOCjmGzdf3eLrD9
         8z5iXxF3L4z6aFDm/iocKyLudf69HY+pOyW0ODzzVYAUMD1breEB8LGz4lrBGDxGBSzv
         Q0kky6UG8u/BTeXSMIzIQFxjYA15Qhm0fpKOK/agwLwSCqqRA/kW/qHjB+/jXSSHj1kE
         mkbDjbq0KHz3pBo5US40EcUEQPW2FVbJW3WDSOweSPycxGbtz86Vd/KEQkRD1BdiwCBg
         0ayoZq8/86OGGIV3bEi/U0CmVNKJ1BGz2G+qVI3i/phndwE4Oru1FZJIIThrPthkBYz3
         C9xg==
X-Forwarded-Encrypted: i=1; AJvYcCV+30L4JK3vvDWppwRE+9qaQLX/ab1pPYAoH0q6+VUW6ST/xNpD5nGL+k4uYv/u6wL6NixLiq+vZk6I@vger.kernel.org
X-Gm-Message-State: AOJu0YzICAQhYd0iFGOTraUJw3e3PE3ibL9cDMChCzBznyo81t4ITdW+
	kaH4R0Ja7JOngJC1r7b4heCRvx7rfiaeosoVPvRrr1tv9qgD7U1y9DF371hhvfeX
X-Gm-Gg: AY/fxX68uxbAp7TmwRPpak77mPfNP9wWEn8Anxh3xlzSOsD9FaFxiEWpBgq3hnlLf8q
	Yc/3Hcj/sitSvD6gYE/613hgiYknMT1anhRQRyT0KUIWjGYDq8HNJAhZSvg9LGHFPYwsG8BzVpL
	ItQrt3NCmj312SxCf6LfGWUaxCa1btda8u9NDTv08SCiFuhJY/YB4B60s+oy4VpSkA9K9DhC88b
	iMKUd5TeyMeyxqTTULh8Rk8TuwuXsQKiGR5oWZ9L2Njw/phTQHv8UR0iTV5SZNMjVJcI8l3kVJy
	WMyxQhJ+qpc4TqDD8KeH59MjWPzZxj6sZMmagLcaUXt0RKcdHdE+H/6jtcF5M88sMayMjpwkkx7
	mWCoCoNxpEhvSITUm6Xfdw7hfNZzwov2fJW3de4R/16GID6+u8e8bQwbPiRxdrTwdvHa+jMdeqM
	0KHB0dYW82avDGS7+4zCskRs73nYIPnZHBJwqoRaSkyX3pq56S
X-Google-Smtp-Source: AGHT+IHjI6kOTpPR5rCO3kGuB6+Sx1JOBRRqNaK/a3Z13+qbAhzTl5qswQ+SBreJQnXSJ08LOjy9qQ==
X-Received: by 2002:a05:6122:3383:b0:55e:82c3:e1fb with SMTP id 71dfb90a1353d-563466b1471mr3411803e0c.10.1767958678900;
        Fri, 09 Jan 2026 03:37:58 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634d9162a4sm7040893e0c.15.2026.01.09.03.37.58
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:37:58 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ec838c33e6so1585192137.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 03:37:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjXIw4cQCN07/gywOBwtM/6khXp4YXboIuq6EdnzVxpaoFcgjxJK+584Cp0OW1cUzpERGFGP5fv0aC@vger.kernel.org
X-Received: by 2002:a67:e710:0:b0:5ef:a24a:50b5 with SMTP id
 ada2fe7eead31-5efa24a5867mr328598137.18.1767958678067; Fri, 09 Jan 2026
 03:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdX_ezZMYc3BRJRLFVwir6NPnxNUPw1Z0+oQDZjx_unJjA@mail.gmail.com> <TYRPR01MB15619ED191A00BDE5087CF1DC8585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB15619ED191A00BDE5087CF1DC8585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 12:37:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+0Kg9fP933WU3ewp9DjkFEgi+P-G9gYN8EbER2gQLBw@mail.gmail.com>
X-Gm-Features: AQt7F2r11N3I3MSzV__EYHsg3C36iPI5tnMwUcWEPRDsEenMSkJHUAnFDQysSiA
Message-ID: <CAMuHMdW+0Kg9fP933WU3ewp9DjkFEgi+P-G9gYN8EbER2gQLBw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Thu, 8 Jan 2026 at 19:56, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> > > IRQ-capable pins handled by the ICU, which forwards them to the GIC.
> > >
> > > The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> > > and the mapping is not configurable.
> > >
> > > Add a GPIO IRQ chip to the pin controller that can be used to configure
> > > these pins as IRQ lines.
> > >
> > > The pin controller places the requested pins into IRQ function,
> > > disabling GPIO mode. A hierarchical IRQ domain is used to forward other
> > > functionality to the parent IRQ domain, the ICU. The ICU does level
> > > translation and then forwards other functionality to the GIC.
> > >
> > > Wakeup capability is implemented by placing the entire pin controller on
> > > the wakeup path if any pins are requested to be wakeup-capable.
> > >
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> >
> > > @@ -644,14 +650,194 @@ static const char * const rzt2h_gpio_names[] = {
> > >         "P35_0", "P35_1", "P35_2", "P35_3", "P35_4", "P35_5", "P35_6", "P35_7",
> > >  };
> > >
> > > +/*
> > > + * Interrupts 0-15 are for INTCPUn, which are not exposed externally.
> > > + * Interrupts 16-31 are for IRQn. SEI is 32.
> >
> > Isn't SEI 406, and DMAC0_INT0 32?
>
> 406 is the SPI number, but the IRQ parent of the pinctrl chip is the ICU,
> not the GIC.
>
> The ICU has the SPI interrupts inside the interrupts array in device tree,
> so this index is an index into that array, as that's how translation is
> done in the ICU driver. See rzt2h_icu_parse_interrupts().
>
> SEI particularly works just fine as it was tested using the user switch.

Thanks, I had forgotten about that.

> I think the #interrupt-cells descriptions inside the
> renesas,r9a09g077-icu.yaml and renesas,rzv2h-icu.yaml files need adjusting.
>
> My bad that I didn't catch those mistakes.

Np, there are never direct users of this in DT, right?

> > > + * This table matches the information found in User Manual's Table 17.2,
> > > + * List of multiplexed pin configurations (5 of 51).
> >
> > 3-6 of 51
> >
> > However, the mapping is much easier to derive from the "Interrupt" rows
> > in the various tables in Section 17.5 ("Multiplexed Pin Configurations"),
> > as these match the order in rzt2h_gpio_irq_map[].
>
> Do you want me to change the comment?

I think that would be helpful for the casual reviewer.

> > > + * RZ/N2H has the same GPIO to IRQ mapping, except for the pins which
> > > + * are not present.
> > > + */
> > > +static const u8 rzt2h_gpio_irq_map[] = {
> > > +       32, 16, 17, 18, 19,  0, 20, 21,
> >
> > s/32/406/, but that doesn't fit in u8, and would overflow .used_irqs[],
> > so you probably should translate it in the code instead.
>
> See above.

OK.

> > >+ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> > >+                                            unsigned int child,
> > >+                                            unsigned int child_type,
> > >+                                            unsigned int *parent,
> > >+                                            unsigned int *parent_type)
> > >+ {
> > >+        struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
> > >+        u8 port = RZT2H_PIN_ID_TO_PORT(child);
> > >+        u8 pin = RZT2H_PIN_ID_TO_PIN(child);
> > >+        u8 parent_irq;
> > >+
> > >+        parent_irq = rzt2h_gpio_irq_map[child];
> > >+        if (parent_irq < RZT2H_INTERRUPTS_START)
> >
> > Or !parent_irq, cfr. the check in rzt2h_gpio_init_irq_valid_mask()?
> >
>
> This was done to make sure that the parent_irq - RZT2H_INTERRUPTS_START
> operation below cannot possibly underflow. The same check makes less
> sense in the context of rzt2h_gpio_init_irq_valid_mask(). With this
> extra information, what would you like me to change?

OK, please leave it as is.

> > >  static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
> > >  {
> > >         struct pinctrl_gpio_range *range = &pctrl->gpio_range;
> > >         struct gpio_chip *chip = &pctrl->gpio_chip;
> > > +       struct device_node *np = pctrl->dev->of_node;
> > > +       struct irq_domain *parent_domain;
> > >         struct device *dev = pctrl->dev;
> > >         struct of_phandle_args of_args;
> > > +       struct device_node *parent_np;
> > > +       struct gpio_irq_chip *girq;
> > >         int ret;
> > >
> > > +       parent_np = of_irq_find_parent(np);
> > > +       if (!parent_np)
> > > +               return -ENXIO;
> >
> > Despite your claim that the interrupts properties are optional,
> > I think  this will abort probing when they are actually missing?
>
> It won't, it will just use whatever parent interrupt controller
> it can find (GIC in this case). I tested it.

OK, looks like I misread a check in of_irq_find_parent().

> interrupt-parent is implicitly allowed on any node so it's not
> useful to add it to the bindings. And we cannot mark it as
> required because it breaks compatibility.
>
> But, without ICU being set as the interrupt-parent, the parent
> returned here will depend on the structure of the device tree,
> as interrupt-parent can be set at any level.
>
> With the current device tree structure, it will return the GIC
> if the interrupt-parent is missing on the pinctrl node.
>
> Without #interrupt-cells, no one will be able to reference the
> interrupt controller created by the pinctrl. And if
> #interrupt-cells is present then surely interrupt-parent will be
> there too.
>
> I think we can leave the parent domain finding as-is but we should
>  guard GPIO's irqchip initialization using
>
> if (of_property_present(np, "interrupt-parent") {...}
>
> so that an IRQ chip with the wrong parent is not created, even if
> it cannot be referenced in any way.
>
> What do you think?

Yeah, this is a bit moot. If you decide to have a check, I think
'of_property_present(np, "interrupt-controller")' is the right one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


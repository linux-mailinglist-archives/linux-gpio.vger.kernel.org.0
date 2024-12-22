Return-Path: <linux-gpio+bounces-14132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A34A9FA4EE
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 10:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB451667AD
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2CB183CBB;
	Sun, 22 Dec 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4TdGfNj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B871684AE
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734858545; cv=none; b=nGC35liKYLYvbRhbZbdNE7nwwJTt8FHr6GzicEBxN+LkfnJQV30IByKEAk9X5vTKOMYh+NoAfKe6i00baZ9Bkv1KRvJ1+Dl8To+T550uAKTEsEN3gWSuskRKBuo3uV5uho/mFL24MSdxMefwnItyS8IWW2O6MJcSXnuXpI59z2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734858545; c=relaxed/simple;
	bh=bra/zZTbs7ooYryKUQXEtfmSRRa413Pa4baUhVF/D0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbQaXaDtDQWxmFtMcomor98ZeHUa6tRggQWejgTHvX2Wycq2RnfqsBmD5tan+3PEhK7MRdAiOcvgYsjXe4W7BtVvCeK9hE2M3FyxoZbEKLQy99EO7eweIWsev73kYu2Mozkyo4QTmyiSJtgJl5NFL4eJizjlCXHaKdNiqDIBelI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4TdGfNj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso43802281fa.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 01:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734858541; x=1735463341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+SzVktxDB05WNZgU2bzgDj3qvGv7E/lndUr61NmRhc=;
        b=i4TdGfNjaOJzmZK7gZF51bYx6/R9ZSmeWqlLqrS3isxRYBNdaWtOx1Am8xfwCNMgYz
         J7DcR5eVrixJcIvJQ1q1iMwrHQeNQZixMXB8Imslp4A2C3H8Zl/EsAV/LMLTCTY40C0d
         raisqrrhl0QJ53TAT65Hhhbp9D5SZh4da8U9qVAqaaoWDcG7Tlsj/wGYpgUsHlWxNF7a
         6Q84ADjqZi4tVsl9zWdfbSucgXaXkRCg+sgCF7GF0SndLf+/9Cwi5vpBAGuno0mY2ZHR
         IWNW7eIL0uq3aTxxGHYRZ6j657YrliTrjDQahH7sOjKvet0ELDk6ZxQMibJJpl3CbO8h
         4QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734858541; x=1735463341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+SzVktxDB05WNZgU2bzgDj3qvGv7E/lndUr61NmRhc=;
        b=xI6vIY32U+oN8s3mhcZQ2APr4ZcE8IrPqWKW5OGN7CLsuck5SVoo+Fz/zleELvTer/
         S9z6zaQ/6Ccasg1GW2FXMqoAs5uHLwmLRR5Oq537WwP8eR7WmmjBdO1cNUBopf+F2J38
         EBt0utvSEiBcvbRc1ZYM+BkbfsxJswMCEfqNsrUtXWh7S7HZ/qDjafubMn+ZiEphKi64
         U2+3M6vuf8b326y8mgbwZQR+IgM1h4Yqh6/ievO3w+TnfVVVXY3UxLcK3NC6qLTdObxZ
         AKI9ATtrVohOGJ802+9aoeU/fwgxEzvt/KmTl2+BxAVWK2x5bR2f578wH0e1soFCcrZE
         54hA==
X-Forwarded-Encrypted: i=1; AJvYcCV6sGUHRksGfCfu1YgMWyjuZ9aUHh9TmsBPVgc55WSxjj1j58fEz9Ri57wCCpP5XmmBpgRtkHe2fqPK@vger.kernel.org
X-Gm-Message-State: AOJu0YxToVMWQ/Huu0r4U3qQlsFbZA4lcb1lqMY91VhBQdwzI4QZyuaC
	2YM7Pqh8X3we8etqM38kwvIKi5ydzUCA56e80k945geYeBO8+jFFse2WqI+MM9Q/tG7dKMGPBgf
	i/yr8zZmCDNsiqtysDyqLtsKczlStieXqD611iQ==
X-Gm-Gg: ASbGnctC9UYYs/CVZh9y4iRcuhUSlQZUt2SI4lr5kws56YBlLQzkKJ/1W7AGLKZvuHu
	XwAb/DAKlyxD0NPl2KFAH/7eInp/FWewJ0I7W
X-Google-Smtp-Source: AGHT+IH187CUQCnfRfnFev/oxx361vRPpnGwZKGEC40JgvkudCId/KMDE/KgqulM/xdtkLXQpR7G1mShXSPT7tAyjMQ=
X-Received: by 2002:a05:6512:104c:b0:541:1c48:8bf6 with SMTP id
 2adb3069b0e04-5422956c531mr2677617e87.53.1734858541379; Sun, 22 Dec 2024
 01:09:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com> <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
In-Reply-To: <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Dec 2024 10:08:50 +0100
Message-ID: <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei!

On Wed, Dec 18, 2024 at 10:37=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic=
.com> wrote:

> [Me]
> > In any way I recommend:
> >
> > - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
> >    so we keep this sorted by actual vendor, sunxi is apparently
> >    yours (AMlogic:s) isn't it?
> >
>
> It isn't. Sunxi is Allwinner SoCs.

My apologies. I mixed it up completely. :(

What do you think of the idea of a separate drivers/pinctrl/amlogic directo=
ry
though? I think there are already quite a few amlogic SoCs that need
to be supported and more will come.

> >> +       ret =3D pinconf_generic_parse_dt_config(np, info->pctl, &grp->=
configs,
> >> +                                             &grp->num_configs);
> >
> > But can't you just move this code around? grp->num_configs give the
> > number of configs, so why do you have to go and look up pinmux
> > above, can't you just use grp->num_configs instead of of_pins
> > and npins above?
> >
> They are different.
> The of_pins(grp->npins) specifies the mux values for pin-mux register
> and pin index in pinctrl. It can include multiple pins in groups.
>
> The grp->configs and grp->num_configs specify the configuration
> information for all pins of this groups(such as bias-pull-up,
> drive-strength-microamp)
>
> uart-d-pins2{
>         pinmux=3D <AML_PINMUX(AMLOGIC_GPIO_T, 7, AF2)>,
>                 <AML_PINMUX(AMLOGIC_GPIO_T, 8, AF2)>,
>                 <AML_PINMUX(AMLOGIC_GPIO_T, 9, AF2)>,
>                 <AML_PINMUX(AMLOGIC_GPIO_T, 10, AF2)>;
>         bias-pull-up;
>         drive-strength-microamp =3D <4000>;
> };

OK I get it ... I think. It's nice that you combine muxing and pin config
into the same node like this, it's very readable.

Think about if you even want to add generic helpers for this in
the generic code.

> >> +static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
> >> +                                   struct device_node *np)
> >> +{
> >> +       struct device_node *child;
> >> +
> >> +       for_each_child_of_node(np, child) {
> >> +               if (of_property_read_bool(child, "gpio-controller")) {
> >> +                       info->nbanks++;
> >> +               } else {
> >> +                       info->nfunctions++;
> >> +                       info->ngroups +=3D of_get_child_count(child);
> >> +               }
> >> +       }
> >> +}
> >
> > This looks like a weird dependency between gpio chips and
> > pins that I don't quite understand. Some comments and
> > references to the bindings will be needed so it is clear
> > what is going on.
> >
>
> A pinctrl device contains two types of nodes. The one named GPIO bank
> which includes "gpio-controller" property. The other one named function
> which includes one or more pin groups.
> The pin group include pinmux property(pin index in pinctrl dev,and mux
> vlaue in mux reg) and pin configuration properties.

OK I  guess the binding patch explains why you need several
separate gpio controller "bank" nodes instead of just the base
node being one for all of the pins (which is the most
common). In a way I like it because it often helps to divide
up GPIOs by bank.

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-26154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE28B57313
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 10:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83B951881A26
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 08:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B322EAD05;
	Mon, 15 Sep 2025 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q7+dvvSe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D00029D260
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757925353; cv=none; b=osfLxDgS7ysMZkCyWZsFgFghvYDZRHNoZtl4cgQCOHUVB6BeC3EOaV+lKwkvjlrdprK5Y2ROLKDVOD4EfkeSwLSkz43bhAIwWLDHM3DkwJKI7bgB7Xvt1zEQRjrz+FXQ4fGRPt8hfbGHtfjwu7E/pE8B0AdVwjEaVI0wH9Nr5CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757925353; c=relaxed/simple;
	bh=lGEaAAijE6kmtm/u5jiL71cC11FN9bLP6+AImaRq1ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESY7JTtqP3eztaVnXoZHMamGqVf1Xtys0//pWaJnduUN7Mje8LkElWF2TOvyaZgu5SQg/5lQuLVeLVHrf278dx2ByLkBfBIZSWIwE6SoIg7H1o5vMvlwrL55fNGNSUyvlnK7TwER4LNWxIA4rbDOz+aR2D887oGnsIEMNauCEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q7+dvvSe; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57263febd12so1255555e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757925349; x=1758530149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sh7TW/Ve4npOGl0ZyWerfFSPimsdKplSnqZUaXacERE=;
        b=q7+dvvSeAXRyIeEzdV+QHoXEEseAH5/5Gh/U2FAqeyUEmEkc2iC7eOOHC1vDRxhXsy
         AvdfrVzo8ntUcCxQ2Zy65VYgjYcxYqj1DUp6GtF4J2ftdfyTBPf4TR3BH2W1LXuDcDT6
         NYK7ibgc88pNLGMMUYWz32vAQLWZgaQuHkzMzTqpqCJ+3emd/ewyApUc2RnG5qR3Io9B
         aQ/6YZCG/dVgHx4DH+3S6BBNs8p09tG1PceXHyt8H/udHA5vW6VnCUZo8zjXz6ZznShr
         MIsPxGICnRVPRvSKD4X6J5TUmj7onSXI+w/IPMXcHxOwzZq+nikvlPlAvUxV8tWa6Xzx
         y9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925349; x=1758530149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sh7TW/Ve4npOGl0ZyWerfFSPimsdKplSnqZUaXacERE=;
        b=BTLbhSeqJtJsc2K5gPB7VASTkeDypDBuQC0N0K+qPM03W/pln8ZsJ2N/S/IgQEb35R
         SxiQE8werufz9pxdVm/uwf0KAS7q6QJ+lkgsljoRTIt7w6xnke0/zAN57hG2tEdgfFYQ
         4M5vBGQpnYxL1yle/xBnl6zlIZ32+5Itidg2aSU71MUzoLC4XHgl1qQZKoSkLSwh/1PF
         TmfTGZLWG3hQ3gejxW7cWUaMaw8Qua75AJFcE93tSMx8anRnbScHDiDfK0hddKKel5t+
         Ez3tWBgR13qVsFxMwJzGq/W2DekMMsRlHqJchgX3vH6WaKdIxe1kxUiGmqhyvB+kTKA5
         PCGg==
X-Forwarded-Encrypted: i=1; AJvYcCXzHPED+Q5Qyjge+/ah2rJI+zjtNx3Vl+K8Z9Kj3jhvwlF531SJIn/H+TpSHgZk14bxJAv9GoXmesxj@vger.kernel.org
X-Gm-Message-State: AOJu0YydSDoOHxhyqTG7a9Nuu3kHOOoDdZlG7D+KFG0kbx4YQ7ooxHcx
	IGY5UZ2ripS/utvlr5MDZg4qPNcWY3vo1Ur9B72QtaUeFdx56uBCUDNxK7fkKTcK4VcXB3oJ1ck
	igZcuEBETCzN4VQ3oMssOJWG5hpNsk261flOWDE9i3g==
X-Gm-Gg: ASbGncvuR9tSmAGfqkz2d3dA6+DexSqaU9xrVF+X1A4gyKTvFmKyJdFuKfEGF+j04F6
	lRFnRx0dMxknIdLW3s9AEO7oHii4ek/t16oQ+/HxYtJB0lPhTvXT9Dopk0fkPhx3Sqan3fOcp0J
	GsSdb/Ig+cqTI4A9mMzTSI0rCvrVJm7sAjW529WO58tQ7IrIrFsXrNacz3jRM0BY0BvEFCy5jye
	nmm4K+SU86y9QdtCw==
X-Google-Smtp-Source: AGHT+IELPJH0yiYJRtqNxqiBlJNj2HXfxCwVKTaGQUndbi2n7nTd+Q0uzLmLln2Ahd6RCFrGxTAftvlwA6pCqv4NdTU=
X-Received: by 2002:a05:6512:3409:b0:55b:73e4:1581 with SMTP id
 2adb3069b0e04-5705be2353amr3236909e87.3.1757925349439; Mon, 15 Sep 2025
 01:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-2-gary.yang@cixtech.com> <CACRpkdYgTjerG5mks_+3sjhKKYtCsFY=1NWhgw_YEuib7gZm3g@mail.gmail.com>
 <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
In-Reply-To: <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Sep 2025 10:35:37 +0200
X-Gm-Features: Ac12FXzmf8LIusbRII3-Fz1NuUc_y68ko5C640f0pew8cVktZo0LvMElNxPe0Sw
Message-ID: <CACRpkdYKnFAyq8C5h2=5NQ8AU92RmzShNHd6+=21rWednjv-fA@mail.gmail.com>
Subject: Re: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 9:09=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> > Using a NULL func->name to terminate the array looks a bit dangerous.
>
> Checking whether this pointer is a null pointer is generally acceptable. =
A name maps to a mux value.
> I think that it is safe. Of course, your suggestion is also a good idea. =
If you think this is not safe, we will
> change codes as your suggestions.

It's OK just a suggestion. There are many ways to do this, first fix
other problems.

There are things in the language and the kernel that can help
you to check boundaries of arrays such as these functions so
you can't write code that index out of range, e.g.

+struct sky1_pin_desc {
+       const struct pinctrl_pin_desc pin;
+       const struct sky1_function_desc functions[4];
+};
+
+struct sky1_pinctrl_soc_info {
+       const struct sky1_pin_desc *pins;
+       unsigned int npins;
+};

It is possible to use a flexible array with the intrinsic
__counted by() here, e.g. instead of:

struct sky1_pin_desc {
     const struct pinctrl_pin_desc pin;
     const struct sky1_function_desc functions[4];

You can use:

+ size_t nfunctions;
+ const struct sky1_function_desc functions[] __counted_by(nfunctions);

If you grep counted_by in the kernel you find many other
examples of how we use this.

But flexible arrays is a bit complicated and dangerous so maybe you
want to avoid it altogether. Also I'm not sure it works when you put
things containing a flexible array into another array... I never tried it.

> > Then you can use nfuncs to iterate over the array of function names, an=
d
> > define a macro like this:
> >
> > #define SKY_PINFUNCTION(_muxval, _functions, _nfunctions)   \
> > (struct sky1_function_desc) {                                  \
> >                 .muxval =3D (muxval),                        \
> >                 .functions =3D (_functions),                    \
> >                 .nfuncs =3D (_nfunctions),                  \
> >         }
> >
> > And then this:
> >
> > +static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] =3D {
> > > +       {
> > > +               .pin =3D PINCTRL_PIN(0, "GPIO1"),
> > > +               .functions =3D {
> > > +                       [0] =3D {0, "GPIO1"},
> > > +               },
> > > +       },
> > > +       {
> > > +               .pin =3D PINCTRL_PIN(1, "GPIO2"),
> > > +               .functions =3D {
> > > +                       [0] =3D {0, "GPIO2"},
> > > +               },
> >
> > > +       },
> >
> > becomes
> >
> > static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] =3D {
> >     SKY_PINFUNCTION(PINCTRL_PIN(0, "GPIO1"),  "GPIO1", 1),
> >     SKY_PINFUNCTION(PINCTRL_PIN(1, "GPIO2"),  "GPIO2", 1),
> >
> > I don't know about using the PINCTRL_PIN() macro here though, can't you=
 just
> > put in 0, 1...?
> >
> > Anyway I think you get the idea.
> >
>
> First, let us review the struct sky1_pin_desc, it contains two members, o=
ne is the struct pinctrl_pin_desc.
>
> struct pinctrl_pin_desc {
>         unsigned int number;
>         const char *name;
>         void *drv_data;
> };
>
> PINCTRL_PIN is used to initialize this struct in kernel. It locates in in=
clude/linux/pinctrl/pinctrl.h
>
> #define PINCTRL_PIN(a, b) { .number =3D a, .name =3D b }
>
> PINCTRL_PIN(0, "GPIO1") defines a pin, its number is 0, its name is "GPIO=
1".

Ah I saw it wrong, sorry :(

You're right about this of course.

But I think you can still use a macro to define the long pin tables?
Albeit macros with flexible arguments is a bit hard to write.
Save it until everything else is working.

> > If this is the implied pattern for this driver, write as a comment to t=
he above
> > function that this pin controller place all pins into a single group wi=
th one pin
> > and that this is why this works.
> >
> > The normal (as can be seen from the pin control documentation
> > https://docs.kernel.org/driver-api/pin-control.html ) is to group pins,=
 so e.g.
> >
> > uart0_rx_tx_grp =3D { pin1, pin2 };
> > i2c0_sda_scl_grp =3D { pin1, pin2 };
> >
> > Then this is combined with functions such as uart0 and i2c0:
> >
> > function, group
> > ("uart0", uart0_rx_tx_grp)
> > ("i2c0", i2c0_sda_scl_grp)
> >
> > Here you see the two pins are used for uart in the first case and for i=
2c in the
> > second case, it's the same pins, but members of two different groups, a=
nd
> > these groups are then used with a function.
> >
> > The possible functions for a group are then defined somewhere so these
> > settings can be applied.
> >
> > Maybe this pattern is something you have in your driver because the cod=
e was
> > copied from some other driver which use one group per pin, it's not cer=
tain
> > that this is the best layout for the cix SoC so look it over!
>
> First maybe you ignore that fact the struct sky1_pinctrl_group is differe=
nt from
> the struct group_desc. It only saves the config of a pin from dts. it doe=
sn't include
> pin function part. As we know, a pin only has a config at the same time. =
One group map to a pin.
> The pin function part is included in the struct sky1_function_desc. One p=
in can map
> serval functions. There are four functions on sky1. We define the sky1_gp=
io_functions array.
> It is used to select the pin functions.
>
> Second, you are right. the pinctrl driver support new scheme is seldom in=
 kernel. You take mt723 as
> an example before. Some codes come from the pinctrl driver on MTK. We mod=
ify them to adopt our platform.
> If I misunderstand or miss anything, please let me know.

Yes I can see that the driver is based on the MTK driver, my point is that
make sure you are not following it too closely, because what is good for
the mtk chips is not necessarily good for the cix chips.

But if you feel convenient with one group per pin and you are convinced
this is the best for your driver, go ahead with this scheme!

Yours,
Linus Walleij


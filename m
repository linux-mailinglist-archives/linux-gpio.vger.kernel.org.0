Return-Path: <linux-gpio+bounces-14518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BDFA01BCB
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jan 2025 21:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2E0F3A2DC6
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jan 2025 20:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BC0381AF;
	Sun,  5 Jan 2025 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkHDMHKQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609236B;
	Sun,  5 Jan 2025 20:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736108930; cv=none; b=ne8MeUudddys1m7uOZ43+0Q+i3IcIfHxRofQRPxmmNJtVbz+j3g8gPVGptn4qlv1q+kpIi4qmctn7z/EJWhrQ+rU4Pr1/UfP2PLi6qLmsBI0RAeVj+kWxbdQUU+bw/0CrSQ83JOuUh8FwX0iyj99cIuFrLbS0WE7yHt2APGF7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736108930; c=relaxed/simple;
	bh=AyEhIAXKetLWnEXX/8mvNQbxYa7DyuIGHQQAVbJ5pBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHj836eksgjpHFM+9zkOixXDtzqyiZVHpyahjfX79WUZuUwx7EYKkBy4Kd10oy0Fn/bqGPGjz+utfFf+ozpuEBz0TNVKiKb9Y6zs/JPQ/juq/sF5aqhKYGl8HfbbdeDrQHNdI31QU43EbThnhDJyD9aS0JEkUvHF5H1J8xx94Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkHDMHKQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EE9C4CEE1;
	Sun,  5 Jan 2025 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736108929;
	bh=AyEhIAXKetLWnEXX/8mvNQbxYa7DyuIGHQQAVbJ5pBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rkHDMHKQs8avFTDQn6kZMcopJVxc0CUXlHaTpy53fRSAr0NKTp0idara2sEFc1FLy
	 ry172TGrYUS0XwbbD+GaVwbe6QpGglrxPNTjajcyZjQcv7tq+fEXDOObQlPvy811sS
	 KB7H9c25peR20wntVGxT0JWiSjrgFHveSzF8Wbgn+6zq6WYgEiNGum0yUM+U19tOSU
	 YQJnBTlePR7Pfj+IcOnKpgSVCT7g2kXlMbzKuPZpOFq8TXz7mnsLI8/ZhvuxTlFR37
	 gk+z9Jx8D+4ViiYZ0mgGQcEy9C+N2n2V7Xd4sg6vb3yednYCIxlp+ubwZ3d4jCw0Bo
	 zv594E5Kq3GFw==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e3a26de697fso17804970276.3;
        Sun, 05 Jan 2025 12:28:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3uJyGghVlE3Vo3mSeJHMOiIwp55dg544weDv3Kbs7yUVtxZ+8VV5p2IBhLbxIXfrovVD0fycxWKFq@vger.kernel.org, AJvYcCWY6Y5i3FXwwddfFv9ZsdV/FWIB6Ks+VqqghKVyWrEU9LHQSOV0zZBj+p5MQKUXLqjtWhVrZWt3vgzwXJGQ@vger.kernel.org, AJvYcCXmDzBgS/6I77abAVuPKnJNT6t4UWQVfSZjZ943+4vy0tRgMpr+IcNmlcG0RRUwCFf57fLiX/7G+21dwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOOpRip+x/+LsSaYMUay0Ms4IJVf3SYKH5Yu7mxifLQlE9ec8X
	7qFPxYF1OkxsQebRfIIaGVcCZWkOqADziIP7t1mAZEckzS7+iLvcjpAzjb9xSNEEtAwGeWD9exs
	OtY1DOQRSh02PsSPOnIN5wjXeRA==
X-Google-Smtp-Source: AGHT+IHqZvyalRFjy7jMGbHDLu2PENMBR7A5IENWEEuKVcLGqVEncnQ1jHvJ4PvkM8+ugn+0jS7p2xnDU/30KNqFwCc=
X-Received: by 2002:a05:690c:6208:b0:6ef:4b3f:3bc3 with SMTP id
 00721157ae682-6f3f811507amr410644137b3.16.1736108928776; Sun, 05 Jan 2025
 12:28:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net> <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
 <Z3lKqLXphxeI1Gvo@probook>
In-Reply-To: <Z3lKqLXphxeI1Gvo@probook>
From: Rob Herring <robh@kernel.org>
Date: Sun, 5 Jan 2025 14:28:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+HrXpqi-mDJF+vyg5zL5mTD5FsCTSq_39U8DffKW+XYQ@mail.gmail.com>
Message-ID: <CAL_Jsq+HrXpqi-mDJF+vyg5zL5mTD5FsCTSq_39U8DffKW+XYQ@mail.gmail.com>
Subject: Re: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 8:50=E2=80=AFAM J. Neusch=C3=A4fer <j.ne@posteo.net>=
 wrote:
>
> On Thu, Jan 02, 2025 at 12:51:47PM -0600, Rob Herring wrote:
> > On Thu, Jan 2, 2025 at 12:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
> > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > >
> > > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> > >
> > > Quoting from drivers/of/platform.c:
> > >
> > > > of_platform_populate() - [...]
> > > > Similar to of_platform_bus_probe(), this function walks the device
> > > > tree and creates devices from nodes.  It differs in that it follows
> > > > the modern convention of requiring all device nodes to have a
> > > > 'compatible' property, and it is suitable for creating devices whic=
h
> > > > are children of the root node (of_platform_bus_probe will only crea=
te
> > > > children of the root which are selected by the @matches argument).
> > >
> > > This is useful for new board ports because it means that the C code d=
oes
> > > not have to anticipate every node that is placed directly under the r=
oot.
> > >
> > > As a consequence, the of_bus_ids list can be much shorter, and I've
> > > trimmed it to the necessary parts:
> > >
> > >  - device-type =3D "soc" and compatible =3D "simple-bus" for the SoC =
bus
> > >  - compatible =3D "gianfar" for the Ethernet controller (TSEC), which
> > >    may contain an MDIO bus, which needs to be probed, as a subnode
> > >
> > > Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> > > ---
> > >  arch/powerpc/platforms/83xx/misc.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platfo=
rms/83xx/misc.c
> > > index 1135c1ab923cc120f377a0d98767fef686cad1fe..bf522ee007bbb14292333=
55f668fc8563d8ca4e2 100644
> > > --- a/arch/powerpc/platforms/83xx/misc.c
> > > +++ b/arch/powerpc/platforms/83xx/misc.c
> > > @@ -94,18 +94,14 @@ void __init mpc83xx_ipic_init_IRQ(void)
> > >
> > >  static const struct of_device_id of_bus_ids[] __initconst =3D {
> > >         { .type =3D "soc", },
> >
> > of_platform_populate() won't work on this match unless there's a
> > compatible in the node, too. Can we use compatible instead or are
> > there a bunch of them?
>
> In arch/powerpc/boot/dts, I can find the following cases of device_type
> =3D "soc" without compatible =3D "simple-bus":
>
> - arch/powerpc/boot/dts/tqm8xx.dts           (MPC8xx)
> - arch/powerpc/boot/dts/mpc885ads.dts        (MPC8xx)
> - arch/powerpc/boot/dts/mpc866ads.dts        (MPC8xx)
> - arch/powerpc/boot/dts/ep88xc.dts           (MPC8xx)
> - arch/powerpc/boot/dts/kuroboxHG.dts        (MPC82xx)
> - arch/powerpc/boot/dts/kuroboxHD.dts        (MPC82xx)
> - arch/powerpc/boot/dts/storcenter.dts       (MPC82xx)
> - arch/powerpc/boot/dts/asp834x-redboot.dts  (MPC83xx!)
> - arch/powerpc/boot/dts/ksi8560.dts          (MPC85xx)
>
> i.e. there is one affected devicetree. I can simply patch that one in
> the next iteration.

You can, but that doesn't fix existing DTBs with your kernel change.

We either have to determine no one cares about that platform or the
ABI or add a fixup to add the compatible property.

> >
> > > -       { .compatible =3D "soc", },
> > >         { .compatible =3D "simple-bus" },
> > >         { .compatible =3D "gianfar" },
> > > -       { .compatible =3D "gpio-leds", },
> > > -       { .type =3D "qe", },
> > > -       { .compatible =3D "fsl,qe", },
> >
> > Better still would be if we could move the remaining ones to the
> > default table and just call of_platform_default_populate().
>
> of_platform_default_populate does sound preferable.
>
> I'll investigate why exactly the "gianfar" match is necessary and how to
> fix it in the corresponding driver (I don't think it's general enough to
> warrant being listed in of_default_bus_match_table).

That may work too.

Rob


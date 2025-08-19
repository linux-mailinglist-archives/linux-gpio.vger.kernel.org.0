Return-Path: <linux-gpio+bounces-24528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D65B2BCB6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44C4C7B8690
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 09:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AB231AF01;
	Tue, 19 Aug 2025 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dmyJzvwd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FDA31A059;
	Tue, 19 Aug 2025 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594784; cv=none; b=Jl4Br/8roRolIV3TMcRPoazRDnqkvI+qV2SwpqtzP1mOyX2j4aYjfkqaHSM8Hk68xratRUi36euxL0QB3gAnjg0ilDdy3fAxh9qRnUbyHCccInpJxJ4yilHBdntN7NDpk7XPTdtxd0NVGEevcY3WOXTRWk0QbfZj6PHoh4Nlkqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594784; c=relaxed/simple;
	bh=nLwgX0rt2w+Inkkf34i/Uun1hxhNuo283Du7mGcFnw0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZSi0SXwrQia02d7my7896EmyweuT69QttDbDux3dDcihaubLf8oXTqNTiQlJG0ZMHs6sd1yHD5PDVDXlDEgXaEBl06kBkq7hH2XTxc+pIIhmcbeSJm93dOMStLk7dq0EYLGxLW4lGXgrRJ+0ALwy112O+jfLpbJl/9vp1jjwRm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dmyJzvwd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755594779;
	bh=nLwgX0rt2w+Inkkf34i/Uun1hxhNuo283Du7mGcFnw0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=dmyJzvwdD2oD2FA+P7Jf0WYb7DiNDMsSsqqC+w3eByrplSvm5P6/JiN4Bnmc9RXZg
	 ZBzFkqlUjidrS5O2k++VziehpoX4z+eoBg/tDFXcfbuaULb5mNpaCDbaHK4qc/OK6P
	 KaKLwfcXifGQyx4e0J9Wnnoco2dFwUx4ZNr63+kEyHp2PFncQGwJNx885D7bLnYWUP
	 wLNMiYKllEWYiYE0nZXQ4R+e2YdR0wmf8bR7VSNN8x7k68F3XpwLdN+VQje1uZISaE
	 2OKFTumwkHm729xNyan5REMukD1yFfBl1w8P9ZmspuNCF/YKVRGPQCCt4RjVPY3HPY
	 SVaDtz8wlAsxA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8f85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC5FA17E0154;
	Tue, 19 Aug 2025 11:12:58 +0200 (CEST)
Message-ID: <8be063910b553945da12263818bd05c4e90e27f6.camel@collabora.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
From: Julien Massot <julien.massot@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>,
  Enric Balletbo i Serra	 <eballetbo@kernel.org>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Eugen Hristev	 <eugen.hristev@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Julien
 Massot <jmassot@collabora.com>, Sean Wang	 <sean.wang@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Tue, 19 Aug 2025 11:12:58 +0200
In-Reply-To: <CAGXv+5FXZ_byK8Ftb9LjfQMkgtLd7mTmWgz_Nsvcv8=jy53T=g@mail.gmail.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
	 <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
	 <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com>
	 <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
	 <CAGXv+5FXZ_byK8Ftb9LjfQMkgtLd7mTmWgz_Nsvcv8=jy53T=g@mail.gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,
On Tue, 2025-08-19 at 13:29 +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 19, 2025 at 1:27=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >=20
> > On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> > >=20
> > > On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > > > On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot wrote
> > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 pins-clk {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 drive-strength =3D <MTK_DRIVE_14mA>;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media=
tek,pull-down-adv =3D <10>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media=
tek,pull-down-adv =3D <2>;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bias-pull-down =3D <MTK_=
PUPD_SET_R1R0_10>;
> > > >=20
> > > > and so on.
> > > >=20
> > > > ChenYu
> > >=20
> > > I agree with ChenYu, the more standardized properties are the better =
it is.
> > >=20
> > > All the custom properties makes sense for an engineer working with ju=
st
> > > that one SoC (like the SoC vendor...) but for field engineers who hav=
e
> > > to use different SoCs every day this is just a big mess for the mind.
> > >=20
> > > The standard properties are clear, concise and tell you exactly what
> > > they are about.
> > >=20
> > > The argument should be in Ohms though, according to the standard
> > > bindings, but maybe the value of MTK_PUPD_SET_R1R0_10 is
> > > something like that?
> >=20
> > For reasons I can't recall clearly these are just placeholder values
> > that the driver then maps to the R1 and R0 settings. But at least they
> > use the standard properties.
> >=20
> > The reason was either one of the following or both:
> >=20
> > =C2=A0 a. not every group of pins had the same resistance values for R1=
 & R0
> > =C2=A0 b. there are no known precise values; the values depend on the p=
rocess
> > =C2=A0=C2=A0=C2=A0=C2=A0 and batch
>=20
> I don't know for (b), but no there is a lot of different values for R1 & =
R0
>=20

From what I saw in the register table
We can have for the pull up resistors
75K / 200K
2K  / 75K
5K  / 20K
50k / 10K=20

And for the pull down ones:

75k/2k
75k/75k
10k/50k

And we can have a combination of both resistors that will give odd values=
=20
(e.g 1948 Ohm for 2k/75K, 545454 Ohm for 75k/200k) to express in the device=
 tree=20


>=20
> Also, their customers seemed more accustomed to dealing with toggling
> R1 & R0 vs setting some actual value. I presume that comes with the
> uncertainty of the actual hardware value, and they just try which
> combination works better.
>=20
> ChenYu

Regards,
Julien


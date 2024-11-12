Return-Path: <linux-gpio+bounces-12871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 536CC9C58DC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 14:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 039DF2810AC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81B914B942;
	Tue, 12 Nov 2024 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="i89aoZhI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4181DFF7;
	Tue, 12 Nov 2024 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731417810; cv=pass; b=YFYq+2Rec/Cw6b9ED9D+69rrF6g6HqM8t3S+bG+zPhelkoqhF2lm9VYo3L0rRX4y8Fch8AgHDikFHsvLGk4S/0CZslOXttAckEWS2NhDKayauGti/WY03zEA5zr1EnQ0stk4H77nKPjB8UKBSsz0uGfDpMaCbRfRJi6PS7SaBzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731417810; c=relaxed/simple;
	bh=bcgcbtLsnfvJN/tLyVZnCzLHtUqLL24cZ8Nw9dUiTlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3SBu0eT6xK/ZL+s6uiJMoWuvYoF1QGNgB2eE+QbpzKMoY7qcNBPqmwhjoOgDegP7f2up4JIg987haGQFavp69bTlX0Qhe6NTa8vU3qxQwua8WDlKJorAp2OubzB3rpip5iQSrPz7ZaIu1m3EewBCHldUZqOpS1OVIxDPnoXzIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=i89aoZhI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731417781; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bgUPyrww6J9+NQtS1Vgwi5dpP+UVlrlbR72nZqJoFlYFriOD71dUSVQvrLW2xxWU9KoF5E1IcT1ZdA1782T3Doxux51ebqQ0H0LySXoV1Np2/hoMXUX9mAtVpIqNbneqeGGGTEB5hbcnxm5FrwMA1Wf9GDfLOQT8KH5cjWeFrtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731417781; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bcgcbtLsnfvJN/tLyVZnCzLHtUqLL24cZ8Nw9dUiTlA=; 
	b=IIsGol37GkbRJsetbaBPni3GrGMlCMhSY2LLKMmOByCuAS3Ys5gwSMlmbah07B1N/v7gzgEwD4Og3lHDYaS3geZKYvG0sXSXddvdV32WP4H10zJuitff+xNZXXkzUF6nWsqtqZgB0eqTzz4zpM4MaxJSqtVWtlcR/yBhxdwFaeg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731417781;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=bcgcbtLsnfvJN/tLyVZnCzLHtUqLL24cZ8Nw9dUiTlA=;
	b=i89aoZhI+IwGr6TdCv6uoSZXVVvtW7iMmMNszB6wkpnbCOZJmDz5MZS78hN0rgqi
	ezKpPH/qGioZ2sYq7Ov46p+bEqQ4wNp8hW99xKdYd42Jm03D8Pw1FQf9nh2hMlUIQys
	WQ7LfJo2jfcLVsm/ab5+tnNOOBp6cbJci32nN5dA=
Received: by mx.zohomail.com with SMTPS id 1731417780379727.6755151416451;
	Tue, 12 Nov 2024 05:23:00 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id 9272A1060457; Tue, 12 Nov 2024 14:22:55 +0100 (CET)
Date: Tue, 12 Nov 2024 14:22:55 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	tao.huang@rock-chips.com, finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request
 irq
Message-ID: <qwlya3kten7ugxzruohmbmmymjd6trz3rlbflirr3yym2vfe32@rapst33wknmd>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com>
 <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
 <ZzMwh2GMP-bE7aLO@smile.fi.intel.com>
 <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
 <CAMRc=MdY1idv1o_nZFb1fKLpM5DHCPmEu5t5MMa_kV9csLgQWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ejtr6ggm3ld65lkc"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdY1idv1o_nZFb1fKLpM5DHCPmEu5t5MMa_kV9csLgQWw@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/231.391.79
X-ZohoMailClient: External


--ejtr6ggm3ld65lkc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request
 irq
MIME-Version: 1.0

Hi,

On Tue, Nov 12, 2024 at 01:53:48PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 12, 2024 at 1:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Tue, Nov 12, 2024 at 11:40=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote:
> > > > On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-chi=
ps.com> wrote:
> > > > >
> > > > > Since the GPIO can only generate interrupts when its direction is=
 set to
> > > > > input, it is set to input before requesting the interrupt resourc=
es.
> > >
> > > ...
> > >
> > > > This looks like a fix to me, do you want it sent for stable? If so,
> > > > please add the Fixes tag and put it first in the series.
> > >
> > > Independently on the resolution on this, can the first three be appli=
ed to
> > > for-next? I think they are valuable from the documentation perspectiv=
e as
> > > it adds the explanation of the version register bit fields.
> > >
> > > The last one seems to me independent (code wise, meaning no potential
> > > conflicts) to the rest and may be applied to for-current later on.
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> > >
> > >
> >
> > There's another issue I see with this patch. It effectively changes
> > the pin's direction behind the back of the GPIOLIB. If a GPIO is
> > requested, its direction set to output and another orthogonal user
> > requests the same pin as input, we'll never update the FLAG_IS_OUT
>=20
> I meant to say "same pin as interrupt". Sorry for the noise.

GPIO output and interrupt at the same time looks like a misconfiguration
to me. Maybe check for that situation and return -EBUSY?

-- Sebastian

>=20
> Bart
>=20
> > value and I don't think any subsequent behavior can be considered
> > defined.
> >
> > I applied the first 3 patches as they look alright.
> >
> > Bart

--ejtr6ggm3ld65lkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmczVqUACgkQ2O7X88g7
+pr69g//SFAjME4lUgAKRXNnfZVfFq+IoUFP4e1HXfxmVXggtYcVHZ8RTsry/PQo
YXHrS+xj9lnVVeIH3mU407+ripkb1RoaZWUXtc4EHG2MZiqBjdxznCHQNuT7yRGQ
TiLd82ZsRy3x4V3HiLaeJxByNSLsS50idq/XHqk7Jq5Ub5Jf4RQrzaQsM+Sf2WFF
707M1dEUNKjYHBvVfIybCzNjbkGur0JWeiQ8Yo6rJkLnNTQSCgOuVmQ+/J9fPZgJ
GABMiJ2Qor3rzudj5Ac3Mqocr3hUHpgTKT+3Uub2eHg3gF/FLil7Wdcv8QPtmJHl
eR9vJTAF40p1mhk/xH22PGm72xdZEKot2efs8cIQ2Xfkt9kwBE+NDNc3XmxXC5/D
iT7YhXJsscYzpBnxO2wvU113s3yPZNx5HhjuSvxj5ZLyFCP3h1A4jU8MTwu89US7
ZaoGbnl8/s8yv5BxeysT9kwmcRG5YEGIMwJn/9vZEKqKz/3X5srXiar5Mdc0RFkq
eKcvWHJVtgrtRdKb0TUCM9vxulfUGEk+4Pz4VQ+LdbabRWkVXWEHGXzGORIW0okA
+R/2yIMhW/9w1gRolqDjBqXIyEieie7hQgYDZEenQdTTFu5w06FCdNrhzmP+abVT
lgGJoNXJCzEbo7EeUi2tjiMmNSHHszMu5snP3Fhz6t1iM0Rp7ys=
=QZit
-----END PGP SIGNATURE-----

--ejtr6ggm3ld65lkc--


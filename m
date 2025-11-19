Return-Path: <linux-gpio+bounces-28837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 84042C70A47
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 19:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 08387346A28
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F14341045;
	Wed, 19 Nov 2025 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNPTmhP/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01F2BE02B;
	Wed, 19 Nov 2025 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576640; cv=none; b=DKWscg4WM1Kh3veSGgXe2hKkkcl8DFaEwcysAl77jRLAeP65kKEy3mied8XqRCyT3PePQ7iJvSHnm22/mgY54tXGoLJ/omd59E7Da3g6EoWJSedSqrFZ+k7aGQpF84mjBVaEX0LbZW2bN1b9GjZmurpNi7BvJGWIimPEKejuIcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576640; c=relaxed/simple;
	bh=JxZLpuz5lHKEBwyngRScp0aqfYkVvx44s9fc6/R7VBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1keMLQxf//S70rHInXJPf0mpDDeYd6Tc9H5gsTzb1Qq0+UEWSrozLVplh0dL9oM61G07pzH56GHk7USGAEzr74bNtXpC0MW2QDmHW5EKebARjkp1SYokuwWJTLDgi7n5MozsxJsoleh3ayEBmXE/Jd3ShtaqqLa5MaCD3rmh40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNPTmhP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A06C4CEF5;
	Wed, 19 Nov 2025 18:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763576639;
	bh=JxZLpuz5lHKEBwyngRScp0aqfYkVvx44s9fc6/R7VBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gNPTmhP/9uchSWM26dyIBwA4JZf1svc7pwHX6zirDxdQFocEHZVezGyYVBZkxpV3J
	 SCO2YxkV9XVNkuEOiy4AMtaukfFMZkTwZ+1V3yAM+sOc51lhl2NtD7lSqlPv9T6vt1
	 ctwekhqH3zEIIUdSHQsMFv4P4mbGwE8Oq4EiPobVgdofEloC7EHwh24hYgHd1RUTXc
	 pARMYphYOtvQvTx2IDnJ9lPqwE75S8EO5e2c+pZ4oYzwjNcYtFvmhiRrKBIdZMpiy1
	 lUVwb42+vJN6QUSTGWe9uREfD2ogOx+PcAQvYJkAbYRElmkG7WAfAFEFC4sBB4ngku
	 Q8FyWIuIKjzKw==
Date: Wed, 19 Nov 2025 18:23:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251119-bacterium-banana-abcdf5c9fbc5@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FTpcphUG5KM/77TV"
Content-Disposition: inline
In-Reply-To: <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>


--FTpcphUG5KM/77TV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 01:08:26PM +0100, Linus Walleij wrote:
> Hi Conor,
>=20
> took a quick look at this!
>=20
> On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > +#include "linux/dev_printk.h"
>=20
> Weird but it's RFC so OK :)
>=20
> > +#define MPFS_PINCTRL_LOCKDOWN (PIN_CONFIG_END + 1)
> > +#define MPFS_PINCTRL_CLAMP_DIODE (PIN_CONFIG_END + 2)
> > +#define MPFS_PINCTRL_IBUFMD (PIN_CONFIG_END + 3)
>=20
> Yeah this should work for custom props.
>=20
> > +struct mpfs_pinctrl_drive_strength {
> > +       u8 ma;
> > +       u8 val;
> > +};
> > +
> > +static struct mpfs_pinctrl_drive_strength mpfs_pinctrl_drive_strengths=
[8] =3D {
> > +       { 2,   2 },
> > +       { 4,   3 },
> > +       { 6,   4 },
> > +       { 8,   5 },
> > +       { 10,  6 },
> > +       { 12,  7 },
> > +       { 16, 10 },
> > +       { 20, 12 },
> > +};
>=20
> I would probably assign field explicitly with C99 syntax, but no
> hard requirement.
>=20
> { .ma =3D 2, .val =3D 2 }
>=20
> BTW you can see clearly that each setting activates
> another driver stage in the silicon, each totempole giving
> 2 mA.
>=20
> > +static const struct pinconf_generic_params mpfs_pinctrl_custom_binding=
s[] =3D {
> > +       { "microchip,bank-lockdown", MPFS_PINCTRL_LOCKDOWN, 1 },
> > +       { "microchip,clamp-diode", MPFS_PINCTRL_CLAMP_DIODE, 1 },
> > +       { "microchip,ibufmd", MPFS_PINCTRL_IBUFMD, 0x0 },
> > +};
>=20
> I take it these have proper documentation in the DT bindings, so users kn=
ow
> exactly what they do.

Honestly, even if users don't know what they do, they should just be
making this stuff 1:1 match some MSS configurator output, where it's
very clear if you select lockdown or turn on the clamp diode. The clamp
diode is almost certainly input voltage clamping (although the
documentation on the mssio stuff doesn't say anything about it) and the
lockdwn thing is some security feature that doesn't actually do anything
on its own, but will disable the bank in question if the tamper
detection hardware gets upset.
I'm not really all that sure why this is a per-pin setting, because the
documentation about this (and the MSS configurator) treat it as being
bank wide. There's some other part of this in another register that is
actually bank wide that I only discovered yesterday, and I dunno how
they interact.
The binding doesn't really explain this stuff, other than saying what
field in the configurator to get it from. I'll add something for !RFC.

ibufmd is a different story, the only source of it I could find was
in the configurator output files. I suspect that it can be just computed
=66rom the other dt properties and the bank voltage, but I need to find
the answer in the configurator source code I think.

> > +static int mpfs_pinctrl_pin_to_iocfg_reg(unsigned int pin)
> > +{
> > +       u32 reg =3D MPFS_PINCTRL_IOCFG01_REG;
> > +
> > +       if (pin >=3D MPFS_PINCTRL_BANK2_START)
> > +               reg +=3D MPFS_PINCTRL_INTER_BANK_GAP;
> > +
> > +       // 2 pins per 32-bit register
> > +       reg +=3D (pin / 2) * 0x4;
>=20
> This is a nice comment, easy to follow the code with small helpful
> things like this.
>=20
> > +static int mpfs_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev, =
struct device_node *np,
> > +                                      struct pinctrl_map **maps, unsig=
ned int *num_maps)
>=20
> I saw in the cover letter that you wanted this to use more generic helper=
s.
>=20
> If you see room for improvement of the generic code, do not hesitate.
> Doing a new driver is the only time when you actually have all these
> details in your head and can create good helpers.
>=20
> > +       //TODO @Linus, it correct to group these 3? There's no control =
over voltage.
> > +       case PIN_CONFIG_INPUT_SCHMITT:
> > +       case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > +       case PIN_CONFIG_INPUT_SCHMITT_UV:
>=20
> Consider not supporting some like PIN_CONFIG_INPUT_SCHMITT_UV
> in the bindings if they don't make any sense, and let it just return error
> if someone tries to do that.
>=20
> Isn't PIN_CONFIG_INPUT_SCHMITT_ENABLE the only one that
> makes sense for this hardware?

Yeah, I just didn't know if having the others was helpful, since they
say things like:
 * @PIN_CONFIG_INPUT_SCHMITT: this will configure an input pin to run in
 *	schmitt-trigger mode. If the schmitt-trigger has adjustable hysteresis,
 *	the threshold value is given on a custom format as argument when
 *	setting pins to this mode.
which implies they should be implemented for systen not permitting
hysteresis adjustment.

> > +static int mpfs_pinctrl_pinconf_generate_config(struct mpfs_pinctrl *p=
ctrl, unsigned int pin,
> > +                                               unsigned long *configs,=
 unsigned int num_configs,
> > +                                               u32 *value)
> (...)
> > +               case PIN_CONFIG_BIAS_PULL_DOWN:
> > +                       //TODO always start from val =3D=3D 0, there's =
no reason to ever actually
> > +                       // clear anything AFAICT. @Linus, does the driv=
er need to check mutual
> > +                       // exclusion on these, or can I drop the cleari=
ng?
> > +                       val &=3D ~MPFS_PINCTRL_PULL_MASK;
> > +                       val |=3D MPFS_PINCTRL_WPD;
> > +                       break;
>=20
> I was about to say that the core checks that you don't enable pull up
> and pull down
> at the same time, but apparently that was just a dream I had.
>=20
> The gpiolib however contains this in gpiod_configure_flags():
>=20
>         if (((lflags & GPIO_PULL_UP) && (lflags & GPIO_PULL_DOWN)) ||
>             ((lflags & GPIO_PULL_UP) && (lflags & GPIO_PULL_DISABLE)) ||
>             ((lflags & GPIO_PULL_DOWN) && (lflags & GPIO_PULL_DISABLE))) {
>                 gpiod_err(desc,
>                           "multiple pull-up, pull-down or pull-disable
> enabled, invalid configuration\n");
>                 return -EINVAL;
>         }
>=20
> So there is a precedent for checking this.
>=20
> So if you patch pinconf-generic.c to disallow this that'd be great, I thi=
nk
> it makes most sense to do this in the core.

Yeah, seems better than doing it in my driver..

--FTpcphUG5KM/77TV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR4LOgAKCRB4tDGHoIJi
0ogJAP9TD5LhbCAd+BLlPbGwtJyBPF9mUnOKyJOsCOpbwvaWWwD/RQWOKHxXS1dK
o0pldGoW4xIoTAKfM2HG3yiPHo933gI=
=ajcW
-----END PGP SIGNATURE-----

--FTpcphUG5KM/77TV--


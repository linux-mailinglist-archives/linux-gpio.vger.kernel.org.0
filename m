Return-Path: <linux-gpio+bounces-36864-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC4jBq8YBmrGegIAu9opvQ
	(envelope-from <linux-gpio+bounces-36864-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:47:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E670546002
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CB51301AA8D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225413A3E66;
	Thu, 14 May 2026 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJqnCIKH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645829D264;
	Thu, 14 May 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784427; cv=none; b=GE55gGsbcNEeIMmNULxzOkE7vg629EPa2a4gbdTCcXkvbriciOorxPjool9vfZNUM9ifFkQHiJyvkOYw/EKY4OaB/0Ejgzq3iIEh0uF1RboTFEmrKJ0ety9Rpuw1EtJMDcLpzYAp1txKlJ2tryk8fqUmMbRXcNroka+yX9GnDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784427; c=relaxed/simple;
	bh=LgMT4CcOhIPMNDBrIhvh+QoNATSdDWWfIBMKk1lJvE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVSQpLRAkoybzC6mB95UJ3rNKbNEHhWRx3EeubzGqXa6/NIXVBn/fnN7LDHwhbVbvAIQedt1SWCU74aQIXGX+5yQDQc/r98IDKM5JjrfXrMS2VfKZl75V1NPNgk7/HuoqAmBHW1hSIOu6vgcDxNIidJgmcDrig2zP8SvgDCaWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJqnCIKH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9836DC2BCB3;
	Thu, 14 May 2026 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784426;
	bh=LgMT4CcOhIPMNDBrIhvh+QoNATSdDWWfIBMKk1lJvE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJqnCIKHMhvg2QwBcakW6aQj4SjaqHFLXfzEwAYYFCecXW5Gw9Vc9dmwXXW9rTIGC
	 GXQhoqHik34o17bUkbXzourie1B+GYuuUuhQIm3OdgI476LKh9xYM0W7DygcUofwp4
	 X+N+ZbM4ACT7DYO3lEAiQIGYXoGY6gJ4Mn9lCT1b97V9uKL6zvhmsMeCqQJwzUvqqW
	 sid66kaSgDbr705ClxLYvHILvuIO2Vse70MCWRcUe5mrMmCT3Hw6Oe00KQxYjZDdg+
	 oDuXuIxTsibemrhgnI4J9Nj0XRhjOckZq3SeS2LzEL4PX5o9C1PpG7GWb4k0AR7l3S
	 fkqBBVHeg7XXw==
Date: Thu, 14 May 2026 19:46:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Message-ID: <20260514-operation-remix-9f9fcf9a6102@spud>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N4d21H8lXERvyDiB"
Content-Disposition: inline
In-Reply-To: <20260514111218.94519-4-changhuang.liang@starfivetech.com>
X-Rspamd-Queue-Id: 7E670546002
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36864-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--N4d21H8lXERvyDiB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrote:
> Some pinctrl subnodes only need to configure pin properties (e.g.,
> power-source, bias, drive strength) without assigning any mux function.
>=20
> Currently, the driver requires a valid "function" property for all
> pinctrl subnodes. This forces the addition of dummy or redundant
> "function" entries when only pin configuration is needed.
>=20
> Example use case:
> gpios-configs {
>     config {
>         pins =3D <0 1 2 3>;
>         power-source =3D <0>;
>     };
> };
>=20
> Make the "function" property optional. If it is missing, skip adding
> the mux map and only process the pin configuration.

I looked through the series though and all controllers appear
to have pins and functions, is it the case that gpio is the default for
these pins, so you are omitting the functions property when you are
using the pin in gpio mode? Saying that the functions property is
"redudant" makes it seem like this might be the case?

I've got some feedback here, but I can't really provide it without
knowing the answer to that question.

Cheers,
Conor.

>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/pinctrl/pinctrl-generic.c | 37 ++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-=
generic.c
> index efb39c6a6703..c7dd0924aa0e 100644
> --- a/drivers/pinctrl/pinctrl-generic.c
> +++ b/drivers/pinctrl/pinctrl-generic.c
> @@ -62,19 +62,36 @@ static int pinctrl_generic_pins_function_dt_subnode_t=
o_map(struct pinctrl_dev *p
> =20
>  		pins[i] =3D pin;
> =20
> -		ret =3D of_property_read_string(np, "function", &functions[i]);
> -		if (ret)
> -			return ret;
> +		if (functions) {
> +			ret =3D of_property_read_string(np, "function", &functions[i]);
> +			if (ret < 0) {
> +				/* EINVAL =3D missing, which is fine since it's optional */
> +				if (ret !=3D -EINVAL) {
> +					dev_err(dev, "%pOF: could not parse property function\n",
> +						np);
> +					return ret;
> +				}
> +
> +				devm_kfree(dev, functions);
> +				functions =3D NULL;
> +
> +				/* Continue parsing all pins */
> +				continue;
> +			}
> +		}
>  	}
> =20
> -	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num=
_maps, reserve);
> -	if (ret)
> -		return ret;
> +	if (functions) {
> +		ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps,
> +						num_maps, reserve);
> +		if (ret)
> +			return ret;
> =20
> -	ret =3D pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num=
_maps, group_name,
> -					parent->name);
> -	if (ret < 0)
> -		return ret;
> +		ret =3D pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps,
> +						num_maps, group_name, parent->name);
> +		if (ret < 0)
> +			return ret;
> +	}
> =20
>  	ret =3D pinctrl_generic_add_group(pctldev, group_name, pins, npins, fun=
ctions);
>  	if (ret < 0)
> --=20
> 2.25.1
>=20

--N4d21H8lXERvyDiB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYYowAKCRB4tDGHoIJi
0lupAP44+sqEGJcZ4IQoQFmHzo3V4YaE/+Efls8GNyFGogQXFwEAzWJOqn3FfOwO
iEh4PEa0suI90JQY87A+0saMqWV64gw=
=3zW6
-----END PGP SIGNATURE-----

--N4d21H8lXERvyDiB--


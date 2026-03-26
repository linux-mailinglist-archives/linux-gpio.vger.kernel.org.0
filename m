Return-Path: <linux-gpio+bounces-34223-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL1dGmWAxWkk+wQAu9opvQ
	(envelope-from <linux-gpio+bounces-34223-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 19:52:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0756733A6DD
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 19:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1733C3014A35
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 18:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1236E3A1D1B;
	Thu, 26 Mar 2026 18:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mD2EGztz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B4733DED9;
	Thu, 26 Mar 2026 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551137; cv=none; b=pgehJb5rogl3OByk0U2Vu9oBfqOt/BjWFvmleaOweteA5jFFI5ramPHLUWiLh0aSmor7iBG4LweoYyYPdVkL4TmIaOQqUT+CbOOvEYgBo3BnJIa0pLkNjBb2rROZTSsIu/i6hukJHOyeQoUwXnfnNCGONPIOOW3TDjI3MUCaLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551137; c=relaxed/simple;
	bh=VNXRVsOXSPqRmo90Maw0zfm+3Cl0xIUMi6ALG5fc/T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzraEBnmEDLh1sz2UWxlgtvNitzTDtGFIx+rYGh1UdxPU8GDxGGaVrapmpDy2BIGjwSgnfKQEewaNQFCIdOWWUmuLoi/cUFQWxoQlwGaDe86pKkhOVcSHMRGsann25cnOl8ayByp4+au+T4wWkPy2qgcIf7a53RUVKXyDI6Gggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mD2EGztz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74927C116C6;
	Thu, 26 Mar 2026 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774551137;
	bh=VNXRVsOXSPqRmo90Maw0zfm+3Cl0xIUMi6ALG5fc/T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mD2EGztzJwOMwmjMBBlexpOPDOJjGtCbOTI4TJFVp93FI7AWsJrFw4H3xkerSj0lS
	 SPFQvchH0Kdrp2xXPhGyj/qGwygoyKPZS4T5/qWeIZl/U9hOf5VxMxtm6Oo4G2aMom
	 sBv7lSqM15DT5STWHxBElBnMym2VkgJTLOKz5HLl1mSHcU0lkIhUXmuEE7XbMMeZR5
	 OuUkV9qmsB2C+8mz4yT8MUm1YHMMh8o9svhSXlPXitARJI+NjzTnR5jv5FXJxqAPda
	 9O4tEnUJ4dA3ZmV9ktdkeBNOjsufXbIOTixHDFR65mMyRprUTYrEo+3E29SH1BtuhG
	 FXui7pvqt/b+w==
Date: Thu, 26 Mar 2026 18:52:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v4 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <20260326-concur-eel-3e0b3d91e00a@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I2XqJTKcL3uBkzNs"
Content-Disposition: inline
In-Reply-To: <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-34223-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0756733A6DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--I2XqJTKcL3uBkzNs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:

> diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-=
generic.c
> index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea4cfc=
d0b57103c6ca950 100644
> --- a/drivers/pinctrl/pinctrl-generic.c
> +++ b/drivers/pinctrl/pinctrl-generic.c
> @@ -17,29 +17,18 @@
>  #include "pinctrl-utils.h"
>  #include "pinmux.h"
> =20
> -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctr=
l_dev *pctldev,

> +int
> +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *=
parent,

Can you drop this stylistic change please? The=20

> +		       struct device_node *np, struct pinctrl_map **maps,
> +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> +		       const char **group_names, unsigned int ngroups,
> +		       const char **functions, unsigned int *pins)
>  {
>  	struct device *dev =3D pctldev->dev;
> -	const char **functions;
> +	int npins, ret, reserve =3D 1;
> +	unsigned int num_configs;
>  	const char *group_name;
>  	unsigned long *configs;
> -	unsigned int num_configs, pin, *pins;
> -	int npins, ret, reserve =3D 1;
> -
> -	npins =3D of_property_count_u32_elems(np, "pins");
> -
> -	if (npins < 1) {
> -		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> -			parent, np, npins);
> -		return npins;
> -	}
> =20
>  	group_name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, n=
p);
>  	if (!group_name)
> @@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subnode_to=
_map(struct pinctrl_dev *p
>  	if (!pins)
>  		return -ENOMEM;

This looks suspect. You've left the pins allocation behind:
	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
	if (!pins)
		return -ENOMEM;
but pinctrl_generic_pins_function_dt_subnode_to_map() has already
populated this array before calling the function.

Also, this should probably be
Suggested-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> =20
> -	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
> -	if (!functions)
> -		return -ENOMEM;
> -
> -	for (int i =3D 0; i < npins; i++) {
> -		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> -		if (ret)
> -			return ret;
> -
> -		pins[i] =3D pin;
> -
> -		ret =3D of_property_read_string(np, "function", &functions[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num=
_maps, reserve);
>  	if (ret)
>  		return ret;
> @@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_subnode_t=
o_map(struct pinctrl_dev *p
>  	return 0;
>  };
> =20
> +static int
> +pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctl=
dev,
> +						struct device_node *parent,
> +						struct device_node *np,
> +						struct pinctrl_map **maps,
> +						unsigned int *num_maps,
> +						unsigned int *num_reserved_maps,
> +						const char **group_names,
> +						unsigned int ngroups)
> +{
> +	struct device *dev =3D pctldev->dev;
> +	unsigned int pin, *pins;
> +	const char **functions;
> +	int npins, ret;
> +
> +	npins =3D of_property_count_u32_elems(np, "pins");
> +
> +	if (npins < 1) {
> +		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> +			parent, np, npins);
> +		return npins;
> +	}
> +
> +	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> +	if (!pins)
> +		return -ENOMEM;
> +
> +	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
> +	if (!functions)
> +		return -ENOMEM;
> +
> +	for (int i =3D 0; i < npins; i++) {
> +		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> +		if (ret)
> +			return ret;
> +
> +		pins[i] =3D pin;
> +
> +		ret =3D of_property_read_string(np, "function", &functions[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
> +				      num_reserved_maps, group_names, ngroups,
> +				      functions, pins);
> +}
> +
>  /*
>   * For platforms that do not define groups or functions in the driver, b=
ut
>   * instead use the devicetree to describe them. This function will, unli=
ke
>=20
> --=20
> 2.43.0
>=20

--I2XqJTKcL3uBkzNs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacWAXAAKCRB4tDGHoIJi
0gVHAQDfxULI+wAZi6l1tVBV4f3rPYD63HNANlsr0XGHGgq7PgEA2KSyL1Qer0lB
VYui8o9yBdAvEuLpvQD75JWyxskeUw4=
=64t6
-----END PGP SIGNATURE-----

--I2XqJTKcL3uBkzNs--


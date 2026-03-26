Return-Path: <linux-gpio+bounces-34224-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGSHN4mCxWlc+wQAu9opvQ
	(envelope-from <linux-gpio+bounces-34224-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 20:01:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E533AA2E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 20:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19A9D311CD38
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 18:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED40C40822B;
	Thu, 26 Mar 2026 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdEC1pp0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53DA3FE34C;
	Thu, 26 Mar 2026 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551306; cv=none; b=XwqLfIZp+NPiTqELew6adr5lHZjWyJCkc19c/Ft96gVTLuvD205x7abSOHEXlE0Y3J/iGTbgULT0PqfydXTU9PN/bvlKhD/rMYEfreunWi8vmmD7EpL0Eoud140Nya9G5FOCjhQbR1IKK6pwPIo96YrOYXzzT0MVUNJJrNd7lp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551306; c=relaxed/simple;
	bh=/20vy7mkXZdNsQUe9UU7hz+oDH36c9Dx6GRPFYTupu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc761Az/gOefIwBq6O05re8V1YDRXo9n1YFyplMig52+rVICJEP6ZN7rkESNliwCY5u67bm86MUzfXkxV18NTk6O+i0dLEWGDunN9pLrUNUvUff0oGbvWMrWK8P1UrRLzqHhon3FUvDkVfYs5qa+ECOIhxvMJ5EvGtp0TI+uWpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdEC1pp0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68955C2BCB4;
	Thu, 26 Mar 2026 18:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774551306;
	bh=/20vy7mkXZdNsQUe9UU7hz+oDH36c9Dx6GRPFYTupu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdEC1pp0gNuXrBleDHGi/gcvUBCDBIRB7OlugjHpLC5cdgWnYZuhfDDURLhczn4le
	 ufIVCPnmARX9SBN+2CC7Vy9VZ0PolpAYbGmBmdXqHi+b8m35KdZ6H38zeK4MlpauSK
	 rmnt0YKKQAlWSkIOFlPCTOVT1rQGqQlr4wzUxq5sXKGCrvvvy1XjHAqVq0cNM7rFeZ
	 jGLDkfjN/TWS9KxnDeVaWtNEkPzdnyAvnJ9BusHhZo7Vj5hu5KBc0OVdxHII/jYLhJ
	 IWhE0gr8XZ0iAJxd77bDTRASl+rlILfbuDg/vIa19wdBcaMZjoLMcXF91i1i1zgWWf
	 gHf88kUB6DrJQ==
Date: Thu, 26 Mar 2026 18:55:01 +0000
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
Message-ID: <20260326-poncho-expanse-d30a9eded8e2@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
 <20260326-concur-eel-3e0b3d91e00a@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdrvhubYCtkQ5gtU"
Content-Disposition: inline
In-Reply-To: <20260326-concur-eel-3e0b3d91e00a@spud>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34224-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 998E533AA2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--bdrvhubYCtkQ5gtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 06:52:12PM +0000, Conor Dooley wrote:
> On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
>=20
> > diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctr=
l-generic.c
> > index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea4c=
fcd0b57103c6ca950 100644
> > --- a/drivers/pinctrl/pinctrl-generic.c
> > +++ b/drivers/pinctrl/pinctrl-generic.c
> > @@ -17,29 +17,18 @@
> >  #include "pinctrl-utils.h"
> >  #include "pinmux.h"
> > =20
> > -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinc=
trl_dev *pctldev,
>=20
> > +int
> > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node=
 *parent,
>=20
> Can you drop this stylistic change please? The=20

Whoops, cut myself off. To be clear, what I am asking for is to keep the
"int" etc on the same line as the function name. This function is new,
but you did it for the existing function too and the comparison is here.

>=20
> > +		       struct device_node *np, struct pinctrl_map **maps,
> > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > +		       const char **group_names, unsigned int ngroups,
> > +		       const char **functions, unsigned int *pins)
> >  {
> >  	struct device *dev =3D pctldev->dev;
> > -	const char **functions;
> > +	int npins, ret, reserve =3D 1;
> > +	unsigned int num_configs;
> >  	const char *group_name;
> >  	unsigned long *configs;
> > -	unsigned int num_configs, pin, *pins;
> > -	int npins, ret, reserve =3D 1;
> > -
> > -	npins =3D of_property_count_u32_elems(np, "pins");
> > -
> > -	if (npins < 1) {
> > -		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > -			parent, np, npins);
> > -		return npins;
> > -	}
> > =20
> >  	group_name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent,=
 np);
> >  	if (!group_name)
> > @@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subnode_=
to_map(struct pinctrl_dev *p
> >  	if (!pins)
> >  		return -ENOMEM;
>=20
> This looks suspect. You've left the pins allocation behind:
> 	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> 	if (!pins)
> 		return -ENOMEM;
> but pinctrl_generic_pins_function_dt_subnode_to_map() has already
> populated this array before calling the function.
>=20
> Also, this should probably be
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Cheers,
> Conor.
>=20
> > =20
> > -	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL=
);
> > -	if (!functions)
> > -		return -ENOMEM;
> > -
> > -	for (int i =3D 0; i < npins; i++) {
> > -		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> > -		if (ret)
> > -			return ret;
> > -
> > -		pins[i] =3D pin;
> > -
> > -		ret =3D of_property_read_string(np, "function", &functions[i]);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> >  	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, n=
um_maps, reserve);
> >  	if (ret)
> >  		return ret;
> > @@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_subnode=
_to_map(struct pinctrl_dev *p
> >  	return 0;
> >  };
> > =20
> > +static int
> > +pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pc=
tldev,
> > +						struct device_node *parent,
> > +						struct device_node *np,
> > +						struct pinctrl_map **maps,
> > +						unsigned int *num_maps,
> > +						unsigned int *num_reserved_maps,
> > +						const char **group_names,
> > +						unsigned int ngroups)
> > +{
> > +	struct device *dev =3D pctldev->dev;
> > +	unsigned int pin, *pins;
> > +	const char **functions;
> > +	int npins, ret;
> > +
> > +	npins =3D of_property_count_u32_elems(np, "pins");
> > +
> > +	if (npins < 1) {
> > +		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > +			parent, np, npins);
> > +		return npins;
> > +	}
> > +
> > +	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > +	if (!pins)
> > +		return -ENOMEM;
> > +
> > +	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL=
);
> > +	if (!functions)
> > +		return -ENOMEM;
> > +
> > +	for (int i =3D 0; i < npins; i++) {
> > +		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> > +		if (ret)
> > +			return ret;
> > +
> > +		pins[i] =3D pin;
> > +
> > +		ret =3D of_property_read_string(np, "function", &functions[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
> > +				      num_reserved_maps, group_names, ngroups,
> > +				      functions, pins);
> > +}
> > +
> >  /*
> >   * For platforms that do not define groups or functions in the driver,=
 but
> >   * instead use the devicetree to describe them. This function will, un=
like
> >=20
> > --=20
> > 2.43.0
> >=20



--bdrvhubYCtkQ5gtU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacWBBQAKCRB4tDGHoIJi
0g0VAQDhYVisZEV26nl2hUahv0HDUAfeNj10VyO6jOb4tFJkqQD9GVos7vS63Q9O
c1ZR6hyLIo8RH4ETmjEnkrFbYXEzag4=
=hRAx
-----END PGP SIGNATURE-----

--bdrvhubYCtkQ5gtU--


Return-Path: <linux-gpio+bounces-34228-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9sk7MXLKxWl3BwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34228-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 01:08:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD233D5CA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 01:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F35783056728
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 00:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D441D288D2;
	Fri, 27 Mar 2026 00:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLPv43BO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959014C6D;
	Fri, 27 Mar 2026 00:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570012; cv=none; b=k5A25Lres3tTBx0xPqLxZKOC967PMXClYc7174IcAckAJqq3ZRIRCr2uAXIRp3gY5WQ1wTVDoGeScdVF7UUYDbZxVMfs236G8NJY/qCfI1yAic0OkpeG3iqbWbjkSrXHF9JNnEmSurTQYBXHGHCvkr+PBbyfsW9Oq2a1zBZ8PkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570012; c=relaxed/simple;
	bh=ImIPmx6AnEDb6/60dXKqr0SMF6qzc2/4ui0g+5wcem4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYZfW+B0PFQQMNXPJ50cP/u2jxb8eAvjsx/K2muPb0FQSQu3tNk6ndYYupLKTbr3sgprYcuv4UJmogvAei4o87ekcQf2DDAicNxTjIdGdFni4TvPzgIxVOJ0tAPBs3+sABclXgBjTK1aDXyTmgv2IdC2e+5ir59JMtUe1mbpiKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLPv43BO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43046C116C6;
	Fri, 27 Mar 2026 00:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774570012;
	bh=ImIPmx6AnEDb6/60dXKqr0SMF6qzc2/4ui0g+5wcem4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLPv43BOud1czIw27DXQ3ERM9udF260XoPVxHF9ZsVaSyLYWOvzSbREpF1lS+rVKv
	 Z5ZeX6NUFu5okvgMOKRebWjk4TY8r3FcT51nyN7Zy1rWz4xt55JbnkP2E5K+izHTCJ
	 rgqqfxZCuxGS3BEGQ+mKWgzDX32VVoW/caqNfbvWDbtZRiaSmlVX3Ap1e/Eo0oXhX2
	 e2Pni65CdQ7bvJZYSBMzsUO1t0cEUu2Sc2veQwAu094GbUjrbx48AYJOgS7r2m1FTx
	 SSrH+trAwyFpNVRriXx8X2R42k5JJy6PqMkx90q2Bsp1UhOqyOX+z0bN1bP7XHlGrO
	 EReHcA13XWoqQ==
Date: Fri, 27 Mar 2026 00:06:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <20260327-caucus-lunchtime-9b732c1e74d1@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
 <20260326-concur-eel-3e0b3d91e00a@spud>
 <20260326-poncho-expanse-d30a9eded8e2@spud>
 <acWNOhnBvA5l9NW3@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jz0AcoB0Nxtd0vkz"
Content-Disposition: inline
In-Reply-To: <acWNOhnBvA5l9NW3@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34228-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86CD233D5CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jz0AcoB0Nxtd0vkz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 03:47:06PM -0400, Frank Li wrote:
> On Thu, Mar 26, 2026 at 06:55:01PM +0000, Conor Dooley wrote:
> > On Thu, Mar 26, 2026 at 06:52:12PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
> > >
> > > > diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pi=
nctrl-generic.c
> > > > index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985=
ea4cfcd0b57103c6ca950 100644
> > > > --- a/drivers/pinctrl/pinctrl-generic.c
> > > > +++ b/drivers/pinctrl/pinctrl-generic.c
> > > > @@ -17,29 +17,18 @@
> > > >  #include "pinctrl-utils.h"
> > > >  #include "pinmux.h"
> > > >
> > > > -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct =
pinctrl_dev *pctldev,
> > >
> > > > +int
> > > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_=
node *parent,
> > >
> > > Can you drop this stylistic change please? The
> >
> > Whoops, cut myself off. To be clear, what I am asking for is to keep the
> > "int" etc on the same line as the function name. This function is new,
> > but you did it for the existing function too and the comparison is here.
> >
> > >
> > > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > > +		       const char **group_names, unsigned int ngroups,
> > > > +		       const char **functions, unsigned int *pins)
> > > >  {
> > > >  	struct device *dev =3D pctldev->dev;
> > > > -	const char **functions;
> > > > +	int npins, ret, reserve =3D 1;
> > > > +	unsigned int num_configs;
> > > >  	const char *group_name;
> > > >  	unsigned long *configs;
> > > > -	unsigned int num_configs, pin, *pins;
> > > > -	int npins, ret, reserve =3D 1;
> > > > -
> > > > -	npins =3D of_property_count_u32_elems(np, "pins");
> > > > -
> > > > -	if (npins < 1) {
> > > > -		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > > > -			parent, np, npins);
> > > > -		return npins;
> > > > -	}
> > > >
> > > >  	group_name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", par=
ent, np);
> > > >  	if (!group_name)
> > > > @@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subn=
ode_to_map(struct pinctrl_dev *p
> > > >  	if (!pins)
> > > >  		return -ENOMEM;
> > >
> > > This looks suspect. You've left the pins allocation behind:
> > > 	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > > 	if (!pins)
> > > 		return -ENOMEM;
> > > but pinctrl_generic_pins_function_dt_subnode_to_map() has already
> > > populated this array before calling the function.
>=20
> what's means?

It means you broke my driver by not removing this allocation from
pinctrl_generic_to_map().

>=20
> pinctrl_generic_pins_function_dt_subnode_to_map()
> {
> 	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> 	...
> 	pinctrl_generic_to_map();
> }
>=20
> pinctrl_generic_pins_function_dt_subnode_to_map() have not use this array.

I have no idea what this statement means.

>=20
> Frank
> > >
> > > Also, this should probably be
> > > Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Cheers,
> > > Conor.
> > >
> > > >
> > > > -	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KE=
RNEL);
> > > > -	if (!functions)
> > > > -		return -ENOMEM;
> > > > -
> > > > -	for (int i =3D 0; i < npins; i++) {
> > > > -		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> > > > -		if (ret)
> > > > -			return ret;
> > > > -
> > > > -		pins[i] =3D pin;
> > > > -
> > > > -		ret =3D of_property_read_string(np, "function", &functions[i]);
> > > > -		if (ret)
> > > > -			return ret;
> > > > -	}
> > > > -
> > > >  	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_map=
s, num_maps, reserve);
> > > >  	if (ret)
> > > >  		return ret;
> > > > @@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_sub=
node_to_map(struct pinctrl_dev *p
> > > >  	return 0;
> > > >  };
> > > >
> > > > +static int
> > > > +pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev=
 *pctldev,
> > > > +						struct device_node *parent,
> > > > +						struct device_node *np,
> > > > +						struct pinctrl_map **maps,
> > > > +						unsigned int *num_maps,
> > > > +						unsigned int *num_reserved_maps,
> > > > +						const char **group_names,
> > > > +						unsigned int ngroups)
> > > > +{
> > > > +	struct device *dev =3D pctldev->dev;
> > > > +	unsigned int pin, *pins;
> > > > +	const char **functions;
> > > > +	int npins, ret;
> > > > +
> > > > +	npins =3D of_property_count_u32_elems(np, "pins");
> > > > +
> > > > +	if (npins < 1) {
> > > > +		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > > > +			parent, np, npins);
> > > > +		return npins;
> > > > +	}
> > > > +
> > > > +	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > > > +	if (!pins)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KE=
RNEL);
> > > > +	if (!functions)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	for (int i =3D 0; i < npins; i++) {
> > > > +		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +
> > > > +		pins[i] =3D pin;
> > > > +
> > > > +		ret =3D of_property_read_string(np, "function", &functions[i]);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
> > > > +				      num_reserved_maps, group_names, ngroups,
> > > > +				      functions, pins);
> > > > +}
> > > > +
> > > >  /*
> > > >   * For platforms that do not define groups or functions in the dri=
ver, but
> > > >   * instead use the devicetree to describe them. This function will=
, unlike
> > > >
> > > > --
> > > > 2.43.0
> > > >
> >
> >
>=20
>=20

--jz0AcoB0Nxtd0vkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacXKFgAKCRB4tDGHoIJi
0mQlAQCCrpynWKye+JnQ3d79G381Pt3Rtj9h7zOyzY0DrZV22gD/f58jVm9SlzrG
YHkt07haqbZTweNomXGNWGl+D+tiNQw=
=EOzH
-----END PGP SIGNATURE-----

--jz0AcoB0Nxtd0vkz--


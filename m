Return-Path: <linux-gpio+bounces-37451-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLfDDLAgFGpjKAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37451-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 12:13:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EC25C91DE
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 12:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7D4330215A8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABBD3624CB;
	Mon, 25 May 2026 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1n1s8yb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876DE3603D7;
	Mon, 25 May 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703821; cv=none; b=hrghl4pcrBRDQcALSsUYFS2w3Jy99dEXrsP+2DAFs9fyNvCFvfLk1MkwrvsT6SsqXeYErvBKQ4+KYp3UrI1aH8SiGbcY2RYQM7qiUTaqxC55/24ZMog550MhWpj+Vwj1HXqkIsHS2QAMYRmfuqWIA/s7eqLriOGUPyMUyPz27Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703821; c=relaxed/simple;
	bh=KdtIfmhq05z9fBW2m0ZIuFdT/M1fVWkqxLAbgZntfrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEmfIjPjJqD1Z5v8SbvkXXGHgyG2IWtnUf1deD+MuW4cOTcRUiCQ0yrtyH4lTyyyW/c4rlZyN5Q/g/xHLFdjHXukhAR1LbPEfnMinUKkc8QwEVPvrpjmthN4s3uhHtpeNVpDVoTz148iMF79ueP+PN2PH608IVls0OtO+qg1o4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1n1s8yb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1547B1F000E9;
	Mon, 25 May 2026 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779703819;
	bh=xepSjUPRIqLRRJ/OWlpwXBGT3LoLJe7x1ZHwasvLII8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1n1s8ybHiFmpE/jDM9SMgg/VBdiJyOVb7mFUtWuXU2JpOYXzDsKxTgMsGx7yhZEt
	 ASVlrZirZ25NJ7EHV2xowvHE/0QZFZjHgi29otVHBraLzGy2KddQWmrgg2ai57Eccz
	 eI2LqNliXg/xYvHzVlSrPgrShAPQc/x6CeKc7zMzZqcw3q+dyRrUfXG+LitbGYhE5c
	 PGlm79UPAF3bAWKpvLhFWzhuhZCeLBcnrkEWi4OlUjWSVb3kBmlZzYbj4kxUdDeGD/
	 y6KiUFyhEqbJmk7D4mvJ5it69E/sfnbXDDmSyg9WCd9aK8ygRs2RMzscg6Sxq+39vO
	 AE4TDsOMrioZQ==
Date: Mon, 25 May 2026 11:10:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Message-ID: <20260525-turbojet-theorize-3a7b49f41af0@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H2L51F3zrIwPda2w"
Content-Disposition: inline
In-Reply-To: <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37451-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A4EC25C91DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--H2L51F3zrIwPda2w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 11:28:51AM +0200, Linus Walleij wrote:
> On Fri, May 15, 2026 at 3:18=E2=80=AFAM Jia Wang via B4 Relay
> <devnull+wangjia.ultrarisc.com@kernel.org> wrote:

> > +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> > +                               struct device_node *np,
> > +                               const char *propname,
> > +                               struct ur_legacy_prop_data *prop)
> > +static const char *ur_legacy_get_function_name(const struct ur_pinctrl=
_match_data *match_data,
> > +                                              u32 mode)
> > +static int ur_legacy_conf_to_configs(struct pinctrl_dev *pctldev, u32 =
conf,
> > +                                    unsigned long **configs,
> > +                                    unsigned int *num_configs)
> > +static int ur_legacy_add_pinconf_maps(struct pinctrl_dev *pctldev,
> > +                                     struct pinctrl_map **map,
> > +                                     unsigned int *reserved_maps,
> > +                                     unsigned int *num_maps,
> > +                                     const struct ur_legacy_prop_data =
*prop)
> > +static int ur_legacy_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +                                   struct device_node *np,
> > +                                   struct pinctrl_map **map,
> > +                                   unsigned int *num_maps)
>=20
> What's up with all this legacy stuff?
>=20
> What is this a legacy of?
>=20
> I thought this was a *new* driver so how can it be "legacy"?

Jia already agreed to drop this stuff :)

>=20
> > +static int ur_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +                                    struct device_node *np_config,
> > +                                    struct pinctrl_map **map,
> > +                                    unsigned int *num_maps)
> > +{
> > +       return pinconf_generic_dt_node_to_map(pctldev, np_config, map, =
num_maps,
> > +                                             PIN_MAP_TYPE_INVALID);
> > +}
>=20
> Hm I think Conor has new helpers for this so you don't need to wrap
> it like this.

Yeah, although "more importantly" the new helpers mean that drivers
shouldn't need to do things like calling these home-rolled functions in
probe, just so that they can try to use pinconf_generic_dt_node_to_map():
| static int ur_add_pin_groups(struct ur_pinctrl *pctldata)
| {
| 	for (u32 i =3D 0; i < pctldata->match_data->npins; i++) {
| 		int ret;
|=20
| 		pctldata->group_names[i] =3D pctldata->match_data->pins[i].name;
| 		pctldata->group_pins[i] =3D pctldata->match_data->pins[i].number;
|=20
| 		ret =3D pinctrl_generic_add_group(pctldata->pctl_dev, pctldata->group_n=
ames[i],
| 						&pctldata->group_pins[i], 1, NULL);
| 		if (ret < 0)
| 			return dev_err_probe(pctldata->dev, ret,
| 					     "failed to add pin group %s\n",
| 					     pctldata->group_names[i]);
| 	}
|=20
| 	return 0;
| }
|=20
| static int ur_add_functions(struct ur_pinctrl *pctldata)
| {
| 	for (u32 i =3D 0; i < pctldata->match_data->num_functions; i++) {
| 		const struct ur_function_desc *desc =3D &pctldata->match_data->function=
s[i];
| 		struct pinfunction func =3D desc->gpio ?
| 			PINCTRL_GPIO_PINFUNCTION(desc->name, pctldata->group_names,
| 						 pctldata->match_data->npins) :
| 			PINCTRL_PINFUNCTION(desc->name, pctldata->group_names,
| 					    pctldata->match_data->npins);
| 		int ret;
|=20
| 		ret =3D pinmux_generic_add_pinfunction(pctldata->pctl_dev, &func, (void=
 *)desc);
| 		if (ret < 0)
| 			return dev_err_probe(pctldata->dev, ret,
| 					     "failed to add function %s\n",
| 					     desc->name);
| 	}
|=20
| 	return 0;
| }
(If I had more time, I would probably go looking to see if there are
more candidates for conversion)

Jia, the helper in question is pinctrl_generic_pins_functions_dt_node_to_ma=
p().

Cheers,
Conor.

Also worth pointing out that this driver has match data but only one
supported device:
+static const struct of_device_id ur_pinctrl_of_match[] =3D {
+	{ .compatible =3D "ultrarisc,dp1000-pinctrl", .data =3D &ur_dp1000_match_=
data, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ur_pinctrl_of_match);


--H2L51F3zrIwPda2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahQgBQAKCRB4tDGHoIJi
0s10AP9DTgDQcti5DfRcBrsfVAhmbyZJcFpxIALZVJmWqj3/+QEA3os5UcG4ag4v
A3KeBR7PJTVp79ebj+O8iH6oCK3i2wE=
=UpOj
-----END PGP SIGNATURE-----

--H2L51F3zrIwPda2w--


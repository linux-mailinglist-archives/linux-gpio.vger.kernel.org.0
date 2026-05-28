Return-Path: <linux-gpio+bounces-37629-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCqOHCYFGGqdZggAu9opvQ
	(envelope-from <linux-gpio+bounces-37629-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:04:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 024DA5EF29A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EBEE35F9989
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA50338B7D7;
	Thu, 28 May 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0osnToI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9B37F015;
	Thu, 28 May 2026 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958545; cv=none; b=Xan4qsms1OcFZUj6U3MBiyX8r2Ovl9bHZR34nFJT+wh4bW0ZUQjgfopZ3jECanVNcEE15hpFMmE7iGbMMdTI+3Qmu0qfs8bLCmLq5AWDFnif53lZuUdxqjRL/SAMMs7/3lSud8Pp/N/H3rR/FXLwKZ2Awk2TknXzko2RghienWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958545; c=relaxed/simple;
	bh=UYS7+fGtrjADlIUJwnF+cQUrgvhgKCPTe4PECHmr99M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0GwIgw6PfgfYljaR92H212ixxPhYI/yKWDAOaHxEPvd/BlK0Lnq/iKwwGtrLFOlvIBBMv477NwAQbbHuJan8eOSL1/RbtUmQiB3GVgfwopb/sPkQRLBTFb31bHt2IUc2XSd2UEyMvPSxBDzjWb694zK+QIhNUxDo9UvyBAfnVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0osnToI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA7C1F000E9;
	Thu, 28 May 2026 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779958543;
	bh=xdKssTSNM7AOFuPAbzDLnKCNlm55Cioqd2vEDuyV+b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J0osnToIbEr/6J9Gs8+MDzWlrXC16S0yconHV2qb5UaSwSzWKXrGDqbfeuqiZI6dc
	 bxdYJ3imyK5loQXCLvR36BQG0NR9QJr0AT4atZ8DaVJqYoGKpCFOjFYIfoLJ1jFYh6
	 BoYRbNKiPD0pGFMjkrLIoW8GI2nEg6W+HEQeUIgLWq92o2uEZp1ROjsJcbcRhv2S/U
	 DWMVai3DGW+e8XaK9KcxQ+kO6rahaYDk9IneNpuWdJpsrdDrQMQoZcrt8HNqIhggI6
	 GfL9E/HJ3tmN8ZxFenBnyilgzM71JTjvpOgap3L13zA7q1IWLVU4E2PKUSQ7IAadYW
	 ClYJ5BvMEuoQg==
Date: Thu, 28 May 2026 09:55:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20260528-broiling-naturist-78401ecbb870@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
 <20260525-turbojet-theorize-3a7b49f41af0@spud>
 <177995438556.929162.1470247666821673655.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IgXyLvpczIplp3dR"
Content-Disposition: inline
In-Reply-To: <177995438556.929162.1470247666821673655.b4-reply@b4>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37629-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 024DA5EF29A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--IgXyLvpczIplp3dR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 03:46:25PM +0800, Jia Wang wrote:
> On 2026-05-25 11:10 +0100, Conor Dooley wrote:
> > On Mon, May 25, 2026 at 11:28:51AM +0200, Linus Walleij wrote:
> > > On Fri, May 15, 2026 at 3:18=E2=80=AFAM Jia Wang via B4 Relay
> > > <devnull+wangjia.ultrarisc.com@kernel.org> wrote:
> >=20
> > > > +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> > > > +                               struct device_node *np,
> > > > +                               const char *propname,
> > > > +                               struct ur_legacy_prop_data *prop)
> > > > +static const char *ur_legacy_get_function_name(const struct ur_pin=
ctrl_match_data *match_data,
> > > > +                                              u32 mode)
> > > > +static int ur_legacy_conf_to_configs(struct pinctrl_dev *pctldev, =
u32 conf,
> > > > +                                    unsigned long **configs,
> > > > +                                    unsigned int *num_configs)
> > > > +static int ur_legacy_add_pinconf_maps(struct pinctrl_dev *pctldev,
> > > > +                                     struct pinctrl_map **map,
> > > > +                                     unsigned int *reserved_maps,
> > > > +                                     unsigned int *num_maps,
> > > > +                                     const struct ur_legacy_prop_d=
ata *prop)
> > > > +static int ur_legacy_dt_node_to_map(struct pinctrl_dev *pctldev,
> > > > +                                   struct device_node *np,
> > > > +                                   struct pinctrl_map **map,
> > > > +                                   unsigned int *num_maps)
> > >=20
> > > What's up with all this legacy stuff?
> > >=20
> > > What is this a legacy of?
> > >=20
> > > I thought this was a *new* driver so how can it be "legacy"?
> >=20
> > Jia already agreed to drop this stuff :)
> >=20
> > >=20
> > > > +static int ur_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
> > > > +                                    struct device_node *np_config,
> > > > +                                    struct pinctrl_map **map,
> > > > +                                    unsigned int *num_maps)
> > > > +{
> > > > +       return pinconf_generic_dt_node_to_map(pctldev, np_config, m=
ap, num_maps,
> > > > +                                             PIN_MAP_TYPE_INVALID);
> > > > +}
> > >=20
> > > Hm I think Conor has new helpers for this so you don't need to wrap
> > > it like this.
> >=20
> > Yeah, although "more importantly" the new helpers mean that drivers
> > shouldn't need to do things like calling these home-rolled functions in
> > probe, just so that they can try to use pinconf_generic_dt_node_to_map(=
):
> > | static int ur_add_pin_groups(struct ur_pinctrl *pctldata)
> > | {
> > | 	for (u32 i =3D 0; i < pctldata->match_data->npins; i++) {
> > | 		int ret;
> > |=20
> > | 		pctldata->group_names[i] =3D pctldata->match_data->pins[i].name;
> > | 		pctldata->group_pins[i] =3D pctldata->match_data->pins[i].number;
> > |=20
> > | 		ret =3D pinctrl_generic_add_group(pctldata->pctl_dev, pctldata->gro=
up_names[i],
> > | 						&pctldata->group_pins[i], 1, NULL);
> > | 		if (ret < 0)
> > | 			return dev_err_probe(pctldata->dev, ret,
> > | 					     "failed to add pin group %s\n",
> > | 					     pctldata->group_names[i]);
> > | 	}
> > |=20
> > | 	return 0;
> > | }
> > |=20
> > | static int ur_add_functions(struct ur_pinctrl *pctldata)
> > | {
> > | 	for (u32 i =3D 0; i < pctldata->match_data->num_functions; i++) {
> > | 		const struct ur_function_desc *desc =3D &pctldata->match_data->func=
tions[i];
> > | 		struct pinfunction func =3D desc->gpio ?
> > | 			PINCTRL_GPIO_PINFUNCTION(desc->name, pctldata->group_names,
> > | 						 pctldata->match_data->npins) :
> > | 			PINCTRL_PINFUNCTION(desc->name, pctldata->group_names,
> > | 					    pctldata->match_data->npins);
> > | 		int ret;
> > |=20
> > | 		ret =3D pinmux_generic_add_pinfunction(pctldata->pctl_dev, &func, (=
void *)desc);
> > | 		if (ret < 0)
> > | 			return dev_err_probe(pctldata->dev, ret,
> > | 					     "failed to add function %s\n",
> > | 					     desc->name);
> > | 	}
> > |=20
> > | 	return 0;
> > | }
> > (If I had more time, I would probably go looking to see if there are
> > more candidates for conversion)
> >=20
> > Jia, the helper in question is pinctrl_generic_pins_functions_dt_node_t=
o_map().
> >
>=20
> I found pinctrl_generic_pins_function_dt_node_to_map() in mainline, but
> there is no pinctrl_generic_pins_functions_dt_node_to_map() as mentioned.
> Did you mean the singular version, and is that the one I should use?

I did, the s was a typo.

Sorry about that,
Conor.

--IgXyLvpczIplp3dR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahgDCgAKCRB4tDGHoIJi
0ikVAQCQ/aGd/v7ZtmAcujbqa2qSy5/xPp1bjYWVHPfaCt+Z8gEAga87XWn7zpkq
9+LxyzRIJol0/UxmZtRob2kFwDfUaww=
=poIP
-----END PGP SIGNATURE-----

--IgXyLvpczIplp3dR--


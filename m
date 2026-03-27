Return-Path: <linux-gpio+bounces-34285-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDauNxC7xmnoNwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34285-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:14:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB4348235
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD1F0302FB1B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC71537883D;
	Fri, 27 Mar 2026 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCuOyAx6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB9534107A;
	Fri, 27 Mar 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631691; cv=none; b=Ie6KxvzyTvt6kw4mbW7WC4Zk6oAJxHuS/EVOFG0ivCIBb7kljNxFZO3L9xcdbUA2rWXSLjSgRczSFq+kfwaa0qeKtOmpmeNO9/+zfpdGCPPwufpIV+mnMEXtDpx9r2Vb8cNzZEtunR8T8fivJfLg6WaoXvr5+tpAwcbq5UaQ2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631691; c=relaxed/simple;
	bh=K/gLTO9BZCY9CeZMqLSveaXc5Cq+EEiHtsmhIau0ADg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPSZ+IF1kzsCPUW3/hGUwvjQHjudZuVhjLEqdDSdK9v26d7rgFNcYrOnmkGCQ8bF1P9od3H4N2sYs+NzlLrFNBF2/zfvDaztrSx7P9gLnEF4Bf3sBv6cSamWqmmDQii0IVMmm8+omAEfU8SVjzyoGsf4Bcao4crkOPL6e48WaKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCuOyAx6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C6CC19423;
	Fri, 27 Mar 2026 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774631690;
	bh=K/gLTO9BZCY9CeZMqLSveaXc5Cq+EEiHtsmhIau0ADg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCuOyAx6bXbHXajLcXofBRMQm35IYQDU9GeYsBogWpYwfCnUYTJGXt6+v35nSrrFU
	 HDjf1ex5dYyzsq2AwhQ/rczEJKB1+MiuHBuuwFyobz+Qrigx5CBetrKN5GmM+8cK80
	 AMAxXa5dOY9UyC+k5KAyq51evGL4yEBKw18x4jizpmhP+HVUAucCbE+gmlR22q3Bg5
	 B3/p5bZ5Iuevgf14+hn3YzMtB/AHWZ3kjQ36VzlujXJ1GI8kATRd5+qFqAAj9w2dmE
	 7Z4fXodO3VRjXOm37LKcvTfCqx2wVeuLpDgNjb9FqNDFln/3CV+uJJPC6wWhPwT8iT
	 6cbQo9gfPsAww==
Date: Fri, 27 Mar 2026 17:14:44 +0000
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
Message-ID: <20260327-cymbal-reliant-30f1e7e0cfcb@spud>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
 <20260327-overdrawn-stretch-2311ec39aa58@spud>
 <aca2UquiW9lFikhR@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pAa+sME3mtw+rhIt"
Content-Disposition: inline
In-Reply-To: <aca2UquiW9lFikhR@lizhi-Precision-Tower-5810>
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
	TAGGED_FROM(0.00)[bounces-34285-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 88DB4348235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--pAa+sME3mtw+rhIt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 12:54:42PM -0400, Frank Li wrote:
> On Fri, Mar 27, 2026 at 12:09:32AM +0000, Conor Dooley wrote:
> > On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
> > > Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separat=
ing DT
> > > parsing logic from map creation. Introduce a new helper
> > > pinctrl_generic_to_map() to handle mapping to kernel data structures,=
 while
> > > keeping DT property parsing in the subnode function.
> > >
> > > Improve code structure and enables easier reuse for platforms using
> > > different DT properties (e.g. pinmux) without modifying the
> > > dt_node_to_map-style callback API. Avoid unnecessary coupling to
> > > pinctrl_generic_pins_function_dt_node_to_map(), which provides
> > > functionality not needed when the phandle target is unambiguous.
> > >
> > > Maximize code reuse and provide a cleaner extension point for future
> > > pinctrl drivers.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change in v4
> > > - new patch
> > > ---
> > >  drivers/pinctrl/pinconf.h         | 18 ++++++++
> > >  drivers/pinctrl/pinctrl-generic.c | 91 ++++++++++++++++++++++++-----=
----------
> > >  2 files changed, 74 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> > > index 2880adef476e68950ffdd540ea42cdee6a16ec27..ffdabddb9660324ed8886=
a2e8dcacff7e1c6c529 100644
> > > --- a/drivers/pinctrl/pinconf.h
> > > +++ b/drivers/pinctrl/pinconf.h
> > > @@ -166,6 +166,13 @@ int pinctrl_generic_pins_function_dt_node_to_map=
(struct pinctrl_dev *pctldev,
> > >  						 struct device_node *np,
> > >  						 struct pinctrl_map **maps,
> > >  						 unsigned int *num_maps);
> > > +
> > > +int
> > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_no=
de *parent,
> > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > +		       const char **group_name, unsigned int ngroups,
> > > +		       const char **functions, unsigned int *pins);
> > >  #else
> > >  static inline int
> > >  pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pct=
ldev,
> > > @@ -175,4 +182,15 @@ pinctrl_generic_pins_function_dt_node_to_map(str=
uct pinctrl_dev *pctldev,
> > >  {
> > >  	return -ENOTSUPP;
> > >  }
> > > +
> > > +static inline int
> > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_no=
de *parent,
> > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > +		       const char **group_name, unsigned int ngroups,
> > > +		       const char **functions, unsigned int *pins,
> > > +		       void *function_data)
> > > +{
> > > +	return -ENOTSUPP;
> > > +}
> > >  #endif
> > > diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinc=
trl-generic.c
> > > index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea=
4cfcd0b57103c6ca950 100644
> > > --- a/drivers/pinctrl/pinctrl-generic.c
> > > +++ b/drivers/pinctrl/pinctrl-generic.c
> > > @@ -17,29 +17,18 @@
> > >  #include "pinctrl-utils.h"
> > >  #include "pinmux.h"
> > >
> > > -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pi=
nctrl_dev *pctldev,
> > > -							   struct device_node *parent,
> > > -							   struct device_node *np,
> > > -							   struct pinctrl_map **maps,
> > > -							   unsigned int *num_maps,
> > > -							   unsigned int *num_reserved_maps,
> > > -							   const char **group_names,
> > > -							   unsigned int ngroups)
> > > +int
> > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_no=
de *parent,
> > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > +		       const char **group_names, unsigned int ngroups,
> > > +		       const char **functions, unsigned int *pins)
> >
> > npins needs to be an argument to this function also, otherwise
> > pinctrl_generic_add_group() uses it uninitialised...
>=20
> Is this one the root cause of then broken?

No, this is not the cause of the breakage. I can't believe I still have
to say that. Go read the code and you'll see why that allocation thing
is problematic.

> I am not sure why compiler have not report waring for it.

It did, that's how I found it. Used uninitialised warnings are normally
=66rom clang, so your toolchain might not have seen it. clangd integration
with my editor is how I saw it.

--pAa+sME3mtw+rhIt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaca7AQAKCRB4tDGHoIJi
0tJOAP47mkwupF69iSRR/PJaWWFW6GDxmNFaLiYahpyjU+NVeQEAnZdw+Qj9g9Ik
qNJvKTLF5rcBtj5CBnTu6h/gxd9oXQk=
=B990
-----END PGP SIGNATURE-----

--pAa+sME3mtw+rhIt--


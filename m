Return-Path: <linux-gpio+bounces-34122-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDbPDpa8w2kRtwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34122-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:44:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9566323368
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 674543146E2E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130C13B8959;
	Wed, 25 Mar 2026 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0vFr6RC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80783B8937;
	Wed, 25 Mar 2026 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434790; cv=none; b=C+u2s3fOM3SX3qUPZkHvo9CSPV5XY8a82eYAig8vOy/UCN8/J9Kmd6jDRg9W4WkwU/wo4ndygVug548PZ4FqWLgnsOURTta0Op6hJIKMG4uFJssIRVw4MFY+SwWjeYpQ/nd4cVk36vJrztoHzznPCIbqRXJUhIMN9SRXYVhO5CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434790; c=relaxed/simple;
	bh=EqAJ4JmzVDIM8zuNvQXcQbmW19GyMId6pMXxIqxpfPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvmWN5wXrY8zgKILp/HpIMPc/s+02TGiVRpPHAySRgHok00armfROtecqrRVwHIETZIrjt/Jkkc9Mkg92BRztdy0u16gPB478Iky5yx8+RYgCPPZlhdvCIUtPJHYU5b9wHmxcPj7rFLEGvpFG0zboI/ZujW0zOS7Xo2Z90QvYt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0vFr6RC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5572C4CEF7;
	Wed, 25 Mar 2026 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434790;
	bh=EqAJ4JmzVDIM8zuNvQXcQbmW19GyMId6pMXxIqxpfPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0vFr6RCuA8SyrW80P9JDA/OV32R/8VshRwGmUxJp0BzyCU4rEpWrHzUcYlZp0Cbi
	 nP+gTTTJZ4jvVYBy5ivfFcbIeI4lHt4+Mu/JzpmkJJ4Uf68p+YexgmwQ6hJeS7CzGG
	 LO9164vJNabH3EN4duTgCy2mGAhUrmdDG/4fL8GrulupzULULm7tx+LSaezhD4EwxH
	 trHyW+NacA9/i/6S9zpYWFm50cgfobbJLOfPj8/yknWgmmeref4cUDvSuGFL8hvbGw
	 lTv4gWgOy62lXD7gm9ZRYoDOGAoUMOtT/wX32RlfGAKtvLlB5hIN21kntD/8DfE6ie
	 uqJTO7YEnq5cw==
Date: Wed, 25 Mar 2026 10:33:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Peter Rosin <peda@axentia.se>,
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
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <20260325-riding-browbeat-293b47f43d82@spud>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
 <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
 <ab1Rpf2zS8Bn1-HV@lizhi-Precision-Tower-5810>
 <acLxCnz3qYfAC3iB@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rph5EFAPA81jsNAV"
Content-Disposition: inline
In-Reply-To: <acLxCnz3qYfAC3iB@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34122-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,axentia.se,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: A9566323368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--rph5EFAPA81jsNAV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 04:16:10PM -0400, Frank Li wrote:
> On Fri, Mar 20, 2026 at 09:54:45AM -0400, Frank Li wrote:
> > On Fri, Mar 20, 2026 at 02:27:21PM +0100, Linus Walleij wrote:
> > > On Thu, Mar 19, 2026 at 12:04=E2=80=AFAM Frank Li <Frank.li@nxp.com> =
wrote:
> > > > On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
> > >
> > > > > That said: in this case you're just adding a parameter, just add
> > > > > the parameter and change all of the in-tree users to pass false
> > > > > or whatever you need, these is just one (1) in-tree user anyway.
> > > >
> > > > pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> > > > .dt_node_to_map() callback, add parameter will impact too much.
> > >
> > > Why do you say that. It already has many parameters, one more
> > > or less doesn't matter. It's not like this call is performance-critic=
al.
> > > Just change the users.
> >
> > In only user drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c,
> > 	.dt_node_to_map =3D pinctrl_generic_pins_function_dt_node_to_map;
> >
> > pinctrl_generic_pins_function_dt_node_to_map() need match .dt_node_to_m=
ap()'s
> > declear.
> >
> > So it can't direct add two parameters in pinctrl_generic_pins_function_=
dt_node_to_map()
> > Need simple wrap function, which other in pinctrl-mpfs-mssio.c or in
> > pinconf.h.
> >
> > If add two parameter in .dt_node_to_map(), need change all functions, w=
hich
> > .dt_node_to_map =3D xxx_to_map(). and OF core part.
>=20
> Linus Walleij:
> 	Is my explain clear enough? I am preparing respin it?
>=20
> 	is okay use wrap function
> 	pinctrl_generic_pins_function_dt_node_to_map_ext()?

I don't understand this patch. The function is called
pinctrl_generic_pins_function_dt_node_to_map(). You have no pins.
You're adding a parameter to make a function with *pins* in its name not
use pins. The new function doesn't use pins but has pins in the name.
At the very least function names should not be misleading.

I was going to suggest pulling out the relevant portions and creating
some helpers that could be used by multiple different-but-similar
functions, but I don't actually even think that there's much in common.
Most damningly I think, you don't actually read either the functions or
pins properties at all and neither are permitted by your binding.
So turns out you use neither pins or functions...

You don't actually have any of these properties which runs counter to the
goal of the function, which is parsing. With this in mind, it feels to me
like you're trying way too hard to make use of a generic function when the
right thing to do is probably just have an entirely custom function.
Maybe that's a custom implementation in your driver, or a new function
here, but I think writing that will highlight just how little of the
code would be shared between the existing function and what your
use-case needs: no pin configuration stuff, no reading of the devicetree
other than the node names and no dealing with the label pointing to the
"wrong" place.

I recently bought a spacemit k1 board to go and write a sister function
to pinctrl_generic_pins_function_dt_node_to_map() that deals with pins
and groups (because that's a pretty common pattern).
I would be calling that pinctrl_generic_pinmux_dt_node_to_map(),
because it that's the property it deals with. I have honestly got no
idea what to call one for this situation since you don't have any of the
properties in pinmux-node.yaml. Maybe that's a sign.

Cheers,
Conor.

--rph5EFAPA81jsNAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacO54QAKCRB4tDGHoIJi
0pMgAP9oMmCGeSjt4dlxPST9iaYHHdHPq/OLqZAXovZzPIwdvwEA88h6G/MIAJvB
OdYLGz82KLktiumTetrkiU2kvIDRlQY=
=fORh
-----END PGP SIGNATURE-----

--rph5EFAPA81jsNAV--


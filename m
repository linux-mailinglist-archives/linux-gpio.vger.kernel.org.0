Return-Path: <linux-gpio+bounces-32507-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDgsJSp+qGluvAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32507-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 19:47:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE82069B3
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 19:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CED8311F45E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 18:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4263D75D5;
	Wed,  4 Mar 2026 18:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhG4EDX8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F73D75BC;
	Wed,  4 Mar 2026 18:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772649219; cv=none; b=klsPSk3O/37XDI+5qexGSKgXGzsChFJzZPBGkSZjPDulgTKLEr/CtRBoZJC0jWAoW1RQoJthbigq08yOB3SMqz7yl/7ob999/rOEwLU55ZPIA6QBIRGUeI7PhVamWU7Hvqhfikqo5KZE2ytVHbFKt9Q+PPjHqq9Rgj+IPmzKWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772649219; c=relaxed/simple;
	bh=w8dR++hhXxQtWH2BpT5SkGX66qauJQYHnx33Sx5blsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=up/69DQZhjM/koqqyYXJZzqyPCjy5+a5VbFD40+0zTwubSY3rrS81aQ/LYr+4K9s1g6vrJCECJKxkrkVtWxVAm80/OyV0w4z9KwDUp8B40niqBtMpfNwvsNPVMdGmeIwkSXvJ2OXd3IcHjhUgqNBuGGXyQmWf1q38rsYnSZ9ZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhG4EDX8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3181C2BC86;
	Wed,  4 Mar 2026 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772649219;
	bh=w8dR++hhXxQtWH2BpT5SkGX66qauJQYHnx33Sx5blsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhG4EDX8hzX7QC15XddQlQE1x8g0HC5zBisOADN5TV8Hf9MSZ9pvEcP/3PrOH26s7
	 TvRaVzaA9pwU+FGrPb1bYtDymZi0zpujDD1Xvi7pN7UGDTtnqK2o9klgFRs3X3OBiS
	 K6v/5GVa5b4tJUZcZrKp0mw3PlGwpfaDGW+rPtdv1ulh2jMoMQVpu02iqxO1zon8YN
	 /shfPVD4jn2JQYpKik5F+gwNo41wV+SlnKX7dj3JZOubOUvTwIOanugaNiEC0OJdOW
	 KL43ntLevfC7tSvSnKh5Sh/NSb6XibeWLO0xK/1fu9ps8dtPgYzP9b5fuLE/cPQsVv
	 fF7xkI2act/hA==
Date: Wed, 4 Mar 2026 18:33:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>,
	Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260304-arose-pampers-fe07c893d079@spud>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de>
 <177254885509.3251575.14819823286886805862.robh@kernel.org>
 <aacH7NmkOzZued0Y@pengutronix.de>
 <CAL_JsqJztUNizCcn=VCoGfmaMy3r6wDTLwZH5r6vj7kh6q9qAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qjo2UGZGSkQvYaoF"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJztUNizCcn=VCoGfmaMy3r6wDTLwZH5r6vj7kh6q9qAA@mail.gmail.com>
X-Rspamd-Queue-Id: ECFE82069B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32507-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email,devicetree.org:url]
X-Rspamd-Action: no action


--Qjo2UGZGSkQvYaoF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 12:26:17PM -0600, Rob Herring wrote:
> On Tue, Mar 3, 2026 at 10:10=E2=80=AFAM Oleksij Rempel <o.rempel@pengutro=
nix.de> wrote:
> >
> > Hi Krzysztof and Rob,
> >
> > On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:
> > > >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++=
++++
> > > >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> > > >  2 files changed, 196 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc339=
78.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,m=
c33978-pinctrl.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindin=
gs/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0'=
 does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> > >       from schema $id: http://devicetree.org/schemas/mux/mux-controll=
er.yaml
> > >
> >
> > Folding the mux node into the parent as suggested [1] causes this error.
> > Because the parent now has #mux-control-cells, the generic
> > mux-controller.yaml forces the node name to be mux-controller. Since
> > this chip is primarily a switch/GPIO controller, naming the parent SPI
> > node mux-controller@0 is misleading.
> >
> > What is the preferred way to go here?
>=20
> I think there was another series dropping the mux-controller node
> name. Not sure what happened to it, but that's what we need to do
> here.

It's here:
https://lore.kernel.org/all/cover.1769703480.git.tommaso.merciai.xr@bp.rene=
sas.com/

Tommaso pinged me about it wondering what to do. Mux maintainer has been
unresponsive. Maybe you should grab the binding portion since it is
blocking other work?
https://lore.kernel.org/all/cover.1769703480.git.tommaso.merciai.xr@bp.rene=
sas.com/

>=20
> Rob

--Qjo2UGZGSkQvYaoF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaah6/gAKCRB4tDGHoIJi
0nbTAQDZHJjbK0X6GeGdOzcNTEKGox6JxWx5yN9g37UvqLkpeAEAhUPjVf/4c1h7
SN18YwVeRy8PDF1ZBvjlP/Ek/l0Yhgo=
=pcLD
-----END PGP SIGNATURE-----

--Qjo2UGZGSkQvYaoF--


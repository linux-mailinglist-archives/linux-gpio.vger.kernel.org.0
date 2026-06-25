Return-Path: <linux-gpio+bounces-38909-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O+CcCr5wPWqz3AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38909-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 20:17:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF96C8235
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 20:17:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HbAoazxd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38909-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38909-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8CFC3032594
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C1730C169;
	Thu, 25 Jun 2026 18:17:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F9E30216D;
	Thu, 25 Jun 2026 18:17:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411449; cv=none; b=YXnx/caZJZexu8wYEK2xoGPXtN5IOMQwOhG0AEtIPX10MCgciv4EFG2u5jWH+5lgA/F1I/Fe337JYA/jLxrbH+rrCz8n1btOZSRLH40TrDj+ynXjQ9K6xO1vdoTpz96hCQvsxsHSpCzRxD+SOlyW+lnakenWufeXLI0usoo1tXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411449; c=relaxed/simple;
	bh=s6mEgn6hx3YYtG/JOj5EMTIBHv8Bw1q4wB55mfRavqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDG4cIrAVtBekV2PlXVAZFwtf9is4GP/Xb6aff2AmlYqts2Uy/NehacMSmdmZSxWYXJgotYfCy6jstDf687MLfDR2OfJ5Vh19yFBAM+Cj2KsTfQ3j6Q2ocJmw/w8Pot8jZ7LB2biLj2tEzsaRL60RMe1xe8a0VpqTRxUbqnEnak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbAoazxd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEC31F000E9;
	Thu, 25 Jun 2026 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782411448;
	bh=s6mEgn6hx3YYtG/JOj5EMTIBHv8Bw1q4wB55mfRavqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbAoazxd5IEBVgCuq1esnBFRb0rxwbOgFtOvpDC22TDW/dA6lIIsKk4y3t9hXfawo
	 Y4hOuh3r8nIOWOuqSw+CbZKMWBs5SJ/CsC7pbY1gNNGxCyKtV5kIEuwHDYHssbp26s
	 IrsWno0qqAR/rNoL9kBrLmKqLjHJk5pOYXFKcCGG2g3t88Ou0CywtQgMhE9plnUBCh
	 gP6vCiJODpDSuD2lwWmqWT3mmyDMWL7+GATbzrLxTjZA0wIOgdXUOc2cXzGGdCLrxM
	 pmkymEH0gEAyybeSggic3JE2SKJBP6bAANc2cvwSCwxfQYi9fuv4Q3za5usN461aT1
	 paDsizejtwYTQ==
Date: Thu, 25 Jun 2026 19:17:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
Message-ID: <20260625-unearth-suffering-e2c59d39da0f@spud>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
 <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud>
 <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e4IrXTl/Pn26GWFM"
Content-Disposition: inline
In-Reply-To: <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:sean.wang@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38909-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96FF96C8235


--e4IrXTl/Pn26GWFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 06:47:32PM +0200, Luca Leonardo Scorcia wrote:
> Hi,
>=20
> > I've not done a very through analysis, but this seems like a massive ABI
> > break.
> > The change you're trying to make here will mean that new kernels will
> > not work with older devicetrees AFAICT.
>=20
> Correct, that's the reason I sent it as an RFC (I mentioned this in
> the cover letter). I am new to kernel work and I'm not sure how to
> deal with this change. On one hand I am almost certain now that the
> upstream driver has never been used in actual devices, since the older
> code was only partially merged and also, as Sashiko correctly pointed
> out in [1], it had serious errors when matched against the data sheet:
>=20
> Sashiko:
> > Does this configuration cause a regression in pin multiplexing across t=
he SoC?
> > The legacy driver used a 4-bit shift per pin to pack 5 pins per 32-bit
> > register. By passing 3 as the width here, the framework calculates mode
> > offsets using 3 bits per pin. This causes pinmux writes to align with
> > the wrong bits and can overwrite the configurations of adjacent pins.
>=20
> Data sheet here clearly shows 3 bits per pin are used to choose the
> pin function.
>=20
> On the other hand I know that breaking the ABI is a big no. But what
> would be an appropriate solution? Maybe duplicating the driver with a

If you can substantiate a claim that the current setup doesn't actually
work for these devices (which seems plausible), you can justify changing
the ABI on that basis.

> different name, something like mediatek,mt8167-pinctrl-v2? Is there
> another driver I could have a look at to learn how to approach this
> problem?

Usually when making ABI changes because something was inaccurate (but
not wrong to the point that it didn't work at all) it's possible to
support both new and old ABIs at the same time because of new properties
etc. This is a difficult one because it's using the same properties in
different ways. A new compatible would definitely be required for a
genuine fresh start while retaining kernel support for the old mechanism
in this case.

But as I said, if what's in the kernel right now does not work at all,
then you can probably just rework in place. Your commit messages will
have to be very clear about why what you're doing is okay however.
It'd probably be best to try to detect the old devicetrees (if that's
even possible, will be tricky unless the devices you're moving are the
ones that need mediatek,pctl-regmap) and reject probe.

> Sashiko also pointed out some other minor issues with the register
> maps I already fixed locally after confirming with the data sheet, but
> did not provide clues about how to solve the ABI breakage.
>=20
> [1] https://sashiko.dev/#/message/20260625111629.6CD701F000E9%40smtp.kern=
el.org
>=20
> Thank you for your time!
> --=20
> Luca Leonardo Scorcia
> l.scorcia@gmail.com

--e4IrXTl/Pn26GWFM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1wsAAKCRB4tDGHoIJi
0rCoAP4zcExKZkvJe5fjuE8AteJE2DILt37x+38necRJf2oztgEA9VoeHBrOzCjO
Af8S/cjdnOJ3G3AHEZM3GMutSHIMBwI=
=PEqZ
-----END PGP SIGNATURE-----

--e4IrXTl/Pn26GWFM--


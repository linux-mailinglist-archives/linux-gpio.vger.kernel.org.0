Return-Path: <linux-gpio+bounces-31441-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCf7K1xyg2mFmwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31441-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:22:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EDEA24A
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EA043011F3B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 15:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E48541B360;
	Wed,  4 Feb 2026 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEe1CAKP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428ED41322E;
	Wed,  4 Feb 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220207; cv=none; b=ZiyrzW1VRQr1DvsX3QZ4RYbY08gS3Kx+DYWr7GxuEGPJoX0njlvYfMKyKflDL/h9gHNb7iclLHM7afWtzHtx9vzTh+CGZBI52STMyN61XFtGJ7uW56WU/x8j10gh0/0Vi1mInLTDK+AZcJb31yj3vmuwH5SVt2U+DM/to3wojR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220207; c=relaxed/simple;
	bh=BkSI3qiEojYI8+NzCD4MDyb+3HYV8iO+aXk8/0PY62A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fboTyAa9Ys9HB4THsxncoUFwGnoBAgm9engFHfTzMi1zNDlw/vo47EAaRVwJH57RbLAG/zRQrcduwbz1OPLdJjOr8vjPd5GYrMDLjfMHpVymyD8NtJTRa/sX95pn9Z6nF0DWCOmTyv1t32ZyTUalIWLTpxZespvJFZ9eoAAb/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEe1CAKP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86582C4CEF7;
	Wed,  4 Feb 2026 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770220206;
	bh=BkSI3qiEojYI8+NzCD4MDyb+3HYV8iO+aXk8/0PY62A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEe1CAKP8Y8XSy/J7G/sC04hC6wxZ8ItlE4TpsoSJnpoWJteovAhfcNOCqvgNzCPA
	 3hfh4ALD7yaYaoPoIbj7Ms5UMVq2pzrFIX1xEzC8KZzXY9QxbgThQBGUhhiPrILmQ8
	 iL3+FNGBcFmujTrQOAeSf3Xj2Xzq1rCZbnicW7fBd39EXoqEDEoqyBfrYhg1mBhntZ
	 WK96L9+QgkhFY8sTrR5Y2zYMYq7fnZX/txvfkObOTBMOHDUcRxXk3/Tssee8g25XlB
	 o8xtBily4FLYHzP0cWVrQRailpcR9W+wznqjHaTXtpIQ91ClpEZ8tVseaktrNHz0Dp
	 iQXEgpTmtJPVQ==
Date: Wed, 4 Feb 2026 15:50:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <20260204-credit-precinct-5424c122a79f@spud>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
 <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0OF1cuAwrOP+OMTg"
Content-Disposition: inline
In-Reply-To: <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31441-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,amlogic.com,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 115EDEA24A
X-Rspamd-Action: no action


--0OF1cuAwrOP+OMTg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 04:26:29PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 04, 2026 at 04:22:47PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 04, 2026 at 02:15:10PM +0000, Conor Dooley wrote:
> > > On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> > > > On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > > > > On Tue, Feb 3, 2026 at 5:17=E2=80=AFPM Conor Dooley <conor@kernel=
=2Eorg> wrote:
>=20
> ...
>=20
> > > > Note, please, remove extra '.' (dot) in the Subject.o
> > >=20
> > > fwiw, the .. was intentional cos I was truncating the pinconf_generic
> > > from the function since the subject was really long, not referring to
> > > a member of an ops struct.
> >=20
> > Yes, and that's how we refer to the callbacks =E2=80=94 with a single d=
ot and parentheses:
> >=20
> > 	.my_cool_cb()
> >=20
> > Alternatively
> >=20
> > 	->my_cool_cb()
> >=20
> > but it one character longer and TBH it slightly less readable (I person=
ally
> > used the latter and then switched to the former in the recent years).
>=20
> Hmm... My memory tricked me, it seems I switched to ->cb() notation, at l=
east
> there are patches with that from October last year. Whatever, choose one =
and
> use it :-)

I think you missed my point, I was /not/ trying to refer to an ops struct
member. For those I follow the first of the two notations you listed.

--0OF1cuAwrOP+OMTg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYNqqgAKCRB4tDGHoIJi
0ukoAQDQ5ViLSFJMmy4xkPoDHm7OnAxc0QA0ACxcwp9yajZXNwEA5bi3lRwEWQJE
bgZDkqX/k8lTJggwpwzD3KHAzo9ndAw=
=mP0U
-----END PGP SIGNATURE-----

--0OF1cuAwrOP+OMTg--


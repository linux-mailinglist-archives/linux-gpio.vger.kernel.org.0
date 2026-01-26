Return-Path: <linux-gpio+bounces-31086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO7lCsqHd2kuigEAu9opvQ
	(envelope-from <linux-gpio+bounces-31086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:27:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFDA8A23A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07FEE304B58E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CCD33D506;
	Mon, 26 Jan 2026 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlhIbrOT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B859123AB8D
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440854; cv=none; b=Zu3Ei/xr5dS9SjJiP0EuB384MEgJHvgeXChFW/etXnqgdTqq/7bck9XkJs//+TARCofBJIaPAm+GeAcGxioVzBnqF8GQPQ+PFl/LZkxxm4Lu4Qf0gC96hc8NUjmKGGktM9soeXLh9+XgAAQKSvAfgcqjsWEgjyH2vlHaUsdtbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440854; c=relaxed/simple;
	bh=fZ4WBQUDi20LmoU+12MXBReWBuP42kpObgG9+dFLv2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Koemk7NSQZEEm4S63L3SzAqw6mQXDLWQh5Sk8iBnJKGZlh+k4c1r+UbltVKPsKsc/ri0sKzmqzT9qNTTnqvZX4y5H0j33kMuaeBW86+zD4+HJncnu/yCPoODurt0d+jGJi4f9jrx571ORxpMYmL1mgLg63buDrCzO4NgQMl1X94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlhIbrOT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93935C116C6;
	Mon, 26 Jan 2026 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769440854;
	bh=fZ4WBQUDi20LmoU+12MXBReWBuP42kpObgG9+dFLv2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlhIbrOT5RYgfUbg1zv3EHi110dCghV/FUk5hZFfiWyXIF4EUSKJATU1z5ooBwoKA
	 y7J0Ip2jsPlta7yA7LdqZ/C+fpopDNudA5WGTS2l1aQBWMUSgV7GfVY5jeVce9bZXL
	 Vnoh7QUZkc0Zjbc7mtC576ENt0CNU2MhjKovBV00SCPMsB/pYArxAehVGx9SaivwxY
	 T1zQUOBgnZFbk/Ffelzn3a28RssJbQbFgvEgrMYUunpSgWec+vOwPoA4dZ8IE5EW6o
	 0H+X3JnMxAqy0dTGHqN0Wdhu0I9Ge3YNewzQVxVgBvtW6MhgTBf58CCY3hl1Jcjy38
	 DFesXbCPu2mXg==
Date: Mon, 26 Jan 2026 15:20:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
	kernel@pengutronix.de, Stefan Kerkmann <s.kerkmann@pengutronix.de>
Subject: Re: [PATCH 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
Message-ID: <1b28aeca-a0cd-4ba7-8ae6-f3731f5e5893@sirena.org.uk>
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
 <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com>
 <4ba68a0e-f603-419d-8162-da66f8755542@sirena.org.uk>
 <CAMRc=Mf-YJ4_N9QphXbxZF2CzevDbHiG-xjdVPujz1D7_X2GNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KxUVltq1/clktPW1"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf-YJ4_N9QphXbxZF2CzevDbHiG-xjdVPujz1D7_X2GNQ@mail.gmail.com>
X-Cookie: Haste makes waste.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31086-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 7DFDA8A23A
X-Rspamd-Action: no action


--KxUVltq1/clktPW1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 04:14:14PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 26, 2026 at 3:01=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > I'm happy for you to just apply patch 2 if you want.

> Sure, just please leave your Ack under v2.

I think he carried it forward from v1 already?

--KxUVltq1/clktPW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3hlEACgkQJNaLcl1U
h9A1gAf+JVNNQZDmMXhTru3aKhCYobZWwZ/4Ij47YUQJt6PihUa/67xibWXlfZop
Md1MVa8ZOz7K/Yi/87ciWSs7dIHY/PzAZN23BJuhV2wgnGGBfwmd8rTuFTm+3vuN
KS3LskcN1GgdTLYs2M2uaj8V+IiadZFDQZB1q/eAnk0T3GgB7iIpYt8mfOrnS6Kr
AlGkWG8hZt/ZC3LTq+WEWY6xI3EzyQYVca6PFzx07Dye/Uj/ueSn0hxNJeVZ/D79
siHQpKP8TsB1jGyhkayos+T21RucQUF5W+yzxptOb9rfpuYewaCSoHvSewiLKa8R
KNq2+OdYUO+KOQv0qApdg313l/NY1A==
=9K32
-----END PGP SIGNATURE-----

--KxUVltq1/clktPW1--


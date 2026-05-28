Return-Path: <linux-gpio+bounces-37610-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PBYL3zbF2phTQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37610-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:06:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5C5ED1DF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49A98308012B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 06:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974D630AD15;
	Thu, 28 May 2026 06:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZgK2Anj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6002C3438BD;
	Thu, 28 May 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779948356; cv=none; b=N/MMTMRPDmjvFHBAkVL2Nt15d6n7+jYbSuThhZermOVymfRb7IoDxUGdZhN07Ya86f9IAuDapoKdjru9ZCuUAR7JIspa4jR6dyqZNUpDoIz02zzpRHmB9XQBCdEddcoIFZyC2x5lKcQxXhyAXWsnIYY2IDkVY0dgEcaO+xNJ1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779948356; c=relaxed/simple;
	bh=qGx2FxwyIXffy62C0gTT+E/nREjjXY8Atu7D46ZTnUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7WaeYQomKpsXGWIJLduMjWnKrCxKwzcfXUIKs+yD0rGlU774dnpLAdhoNExlCXmfWfaMnlOq4LzFL7D8hbs5HVJB4b6nvaiyQ66xMTTbqjkdhWQs37nTx8FmUP+xkewW+if6A53wg3HDtHlJlXaTNdq5JeOSJbe04v0iKDVcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZgK2Anj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 829661F000E9;
	Thu, 28 May 2026 06:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779948355;
	bh=qGx2FxwyIXffy62C0gTT+E/nREjjXY8Atu7D46ZTnUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YZgK2AnjV4EoD9s82jY07odFWPSoS5z3G4SSjnMfgTEkOJiWDz3Mj8GzPMrJ/9c+C
	 Vq3w5ltHNR10Ok7oN7hfI9T1J9e2kUVD3dxVlErFkSSc3so+SEaXTPont4r9DUDJcP
	 SmCy16i7yQkMyCIv/DAi7DA2aIn1OS5V+RcVUMkJG9eXDYQqJM6noqHQS1+SXecW7B
	 IxVGHX9+AKPm+N2meB89j7wREeT8lS/4GDPtZKxOn4E2z7gsoLsblBH8+cKe1D2wSD
	 poAGWpNaRUSUoZksdVPXh/wquGj5l9CO1xVGCq6qmHKFbwbHzvGWGksb0LQmkJPn7+
	 MGm3wBySimmfg==
Date: Thu, 28 May 2026 08:05:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] gpio: max77620: Unify usage of space and comma in
 platform_device_id array
Message-ID: <ahfa5u7-Fugj_Ms8@monoceros>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
 <985c86e80f35a944a4712f0c2ac8dd795868cdfb.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wrrx6r3chms7rxck"
Content-Disposition: inline
In-Reply-To: <985c86e80f35a944a4712f0c2ac8dd795868cdfb.1779893336.git.u.kleine-koenig@baylibre.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37610-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 23E5C5ED1DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--wrrx6r3chms7rxck
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 3/3] gpio: max77620: Unify usage of space and comma in
 platform_device_id array
MIME-Version: 1.0

Hello,

On Wed, May 27, 2026 at 04:57:29PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The most accepted style for the array terminator is to use a single
> space between the curly braces and no trailing comma.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

I fatfingered my S-o-b line. This is supposed to read:

Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylib=
re.com>

I fixed that in my try, so if it comes to a v2, that will be fixed. But
if you apply this version, please fixup accordingly.

Sorry,
Uwe

--wrrx6r3chms7rxck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoX2z4ACgkQj4D7WH0S
/k5ciwgArW4FHb1GdWZ7J/592RdjLJ6Xv0Dm1T0tzyVNveLDxBFyFWQJR02yKbyE
RF7ZKJBRlGNWyqQZp06yfp1i+dexwRo82kMLVr+4IyxnHpyyHcyoZMf45McSos4H
6JSFhjgAnX3UCuvvBpEmJWC+JRBrF/z2Wga9NmwnGaayO5vwV9/uB7TQm40R+3w6
M2LCDJF26zTYsG8qxJxsZbIm72mYOSSoanNUOHrPWyfbxyrHk3nfSqhZYUqJA5x8
LUGU/u510na6q0Z5FTEXbvsdGK9Ygr2RIecbhSf+rK9mcsQ/ckI5kj3zwCCEjA1O
QWUcYdTCt9uzRiHN7jpoR5SVYQ3wUw==
=BZH5
-----END PGP SIGNATURE-----

--wrrx6r3chms7rxck--


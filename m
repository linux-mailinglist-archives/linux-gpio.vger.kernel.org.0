Return-Path: <linux-gpio+bounces-37707-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDQUCSP+GWr80QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37707-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:59:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAAB608BC1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DE023011F17
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 20:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157774219FE;
	Fri, 29 May 2026 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B3Hx7PkM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFAD42188B
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088135; cv=none; b=BBMnXaL4SYGtMPPoeJPC2oydxt6VfkAqhHrzOYEs4fkQYSxCvGV304nVWsJU5K8AyOFDt3AP2OCTUX1McD2zEq5RV54isx8FQSJYa0neNn09ulCHRhycgx8R55+jIRhMP1ifOB3OjL/T5I58kzexekTcZFnAcsRM/QEX7WWYfQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088135; c=relaxed/simple;
	bh=22pROvyrbyauGEmWGtCEM7Z+ml7jfG0E3MthRLNx1z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3Pz2B7Kj2QUqXhEFWLjAhCXICU3VbFUhCbMmuKrtC7NBjY/T3OgJbNRzSVxjdL2LVkyP4FphxHbHZ5uhpWybaYwsTjQNwpqPERjDEN17jft2z90mCFDawuIkxD9rsqRKF7PbH9z7gJHmlJZUpDndex3aYcTGKY2wpmSfvyr80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B3Hx7PkM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=22pR
	OvyrbyauGEmWGtCEM7Z+ml7jfG0E3MthRLNx1z8=; b=B3Hx7PkMcw5sBbSL11TI
	T6QpFr2Qryt05JZmwSjHaV5bn6jpkIz7IL0XIozkR6q+8aUJHnbdf/itc6gBMKDw
	DN6jYTIKch9TtfYG0UdR+9tuFk6NragCys+5cVrfZ89YWR2RloVsDziYRVFPyVOq
	45wbuQUfhJ55wwK35BAw3n7TC++vw5Wk2Q5k5wu3oUhG7V8YRmZYThpp4x34pxvh
	VlE5DHUbUpdJDEfRmUw6yw9a7tnveSQ2VeLuudpnajjT4I0zfInSN3+iZW7eUEX0
	FpoMzJTbYAtV90BVGgncLQqWuRaGqvmIGxolOGgMstQNoRCH0sh2+SMAIgXv33yy
	Xg==
Received: (qmail 1539237 invoked from network); 29 May 2026 22:55:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2026 22:55:32 +0200
X-UD-Smtp-Session: l3s3148p1@XPXDEPtSSDhdnheM
Date: Fri, 29 May 2026 22:55:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	wsa@kernel.org, andriy.shevchenko@intel.com,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <ahn9Q-9eHjBSj39h@shikoro>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
 <ahml-rVa2PIA5DDC@shikoro>
 <CAD++jLmWV9WizdqXfwvTUCbJDisurLBa7sAC6DH1BehDTHZDYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4ejUHi/YcaF17bG"
Content-Disposition: inline
In-Reply-To: <CAD++jLmWV9WizdqXfwvTUCbJDisurLBa7sAC6DH1BehDTHZDYA@mail.gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37707-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:email,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 6AAAB608BC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--l4ejUHi/YcaF17bG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > In case this goes in via some other tree:
> >
> > Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> I queued the revert in the pinctrl fixes, you can take this one (2/2).

Is there really no dependency on patch 1? I'd feel safer if you'd take
this as well...


--l4ejUHi/YcaF17bG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoZ/T8ACgkQFA3kzBSg
KbbCHxAAqXRED5q+mH4glwASoYgXmAuP5Lw/+qaLUf0mWwPsu2HvhNbHWAatDZpX
19KciZw3pwBTuRnQgrdaqxhiyLoLR9/Grg0t7nW1IuIKYwopHcr0mv4Vxsyce2eX
oXs3TsA6gna5IM0AgLRJLc67GAm3rqedQScCA9DLPno27gWhJqFv8kaM3f/vDrBe
DvmsFdySZp8jRgumB6qwy4eeeFU4G9B0kiosKo7/5aSn+YaT62aIVWPaoG4Vl833
XhCCTdMTOjx3K2bcoem6GYBJ6T2IFOB1Clg3AtRg2+B97xmk4nNx3h89jm75yOW+
mp/KRPiO5GPzsUoD2Is33g1OTLGYO0t++4gFQfYot+M20PX8XjHiMR0PQ7QF+gkx
7e+MxG+edCrq570qGkt6KXi1QDCWKm3MLcjPD9Xp5WLkWUFV7t57MVj1vBYla//S
RjQhFHUw+TR8AW2duLn5iq7VtUoOTNW07vU5urU+iILpMaapH+bgJwrAe646Mx9P
X9Da3vDixRRXRE9tdHUmcK8tJiuYJwkypBbNkdPWVyOlmTTm2o9kqI5PSF3BJsc8
WlLcUsqdRc6zyczlYotXWc3WyHrg+Ao2Zl6edJGHCYqxyqcSA0shL5JpPWLYzltF
fD0FxNaMXf/Z8q0rDjcUTvz4jQpxjY2kRwXukakZbqc+1LK8MEk=
=YeIw
-----END PGP SIGNATURE-----

--l4ejUHi/YcaF17bG--


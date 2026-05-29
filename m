Return-Path: <linux-gpio+bounces-37693-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ErCG/SoGWodyQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37693-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 16:55:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3E6040C1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 16:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 440D8327F004
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 14:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B1E3EBF24;
	Fri, 29 May 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UkRNZrLr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12120367297
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065740; cv=none; b=U0hmfRZu6y+Vo7/tlla36E38b4oku+2SZ4M/18b7l81QRnnMaL2lErbHP/n+TFzRoCdSsSWaGW4YZTNW7gKNj1hBedm9szM3Ji51IhAxsGIKmRSzNXBlbNl7A7HuNFm9fSKHzFPOvIdLDnIuDW5s8N6jbc4B6uibt9jm7qlEF1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065740; c=relaxed/simple;
	bh=Fz5OFV5vjm42dq9yavRtFmnwVCTEz31MrsDboIka6Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MST+tlO9mi2QpQ4bYll8HH8hSxckm0rLC2OyyG7v+amvVWLfIivdBZwkG3hVqyLWOApH42a1vdk6XgrCXx3kBRKBcW9wYJZQoWqCqqK8J8S9zgapKElKt4vf7wbraNU1u2p97eF7+6NUhtrRb3Bug8x+UO9bGA2m+eHEWZKrcyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UkRNZrLr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cuZ5
	kKTLsfM9Zu8g1NbjST2CeqE4F2ocBFei/epHMfA=; b=UkRNZrLrPYep6DUebnJn
	3rl8Qiu7aaYGXCZISTkRW94/a8m+mJkC1pbcCRK4SO9x1cLJfO8t9r/AHNe4PSJr
	CeUqeTRR4l8h632fXliUPEl1UtVJ2mKLDFW7kTw+NZFRIe2EoivyxB5eetkrP6dJ
	wmjqDfh8XihzCeQNaNk56z+zBv32D+vBpFiFNIZmYoj3knksSBzrK372TjlzErUo
	4MNtgbzMvsTK3B6Tbzy1pUV7/tqcjFGui05Yv/uCUvVGCTsA98ezpXavvunke6wM
	etCNdzAnu986UM8ok65pIcybsemaTH/0eCTOaC9tigmq+V8S87+GpcxhIeljU7TC
	FA==
Received: (qmail 1450859 invoked from network); 29 May 2026 16:42:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2026 16:42:07 +0200
X-UD-Smtp-Session: l3s3148p1@lQxe2fVSrpsqAQ4KEBW5QLbOwWyJKVt/
Date: Fri, 29 May 2026 16:42:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	andriy.shevchenko@intel.com, mario.limonciello@amd.com,
	brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org
Subject: Re: [PATCH v8 0/2] i2c: designware: fix WACF2200 touchscreen probe
 ordering
Message-ID: <ahmlvx5gc5y-lYpc@shikoro>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jN9PZrx3kRwNj49f"
Content-Disposition: inline
In-Reply-To: <20260529100838.8896-1-hardikprakash.official@gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-37693-lists,linux-gpio=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: EFB3E6040C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jN9PZrx3kRwNj49f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 03:38:35PM +0530, Hardik Prakash wrote:
> This series fixes the non-functional WACF2200 touchscreen on Lenovo
> Yoga 7 14AGP11 by:
>=20
> 1. Reverting the earlier DMI-specific GPIO IRQ quirk (patch 1 of the
>    original series, already in Torvalds' tree) which is no longer
>    needed.
>=20
> 2. Adding a generic probe deferral in i2c-designware that walks ACPI
>    child devices, finds GpioInt resources, and defers probe until the
>    referenced GPIO controllers are fully bound.
>=20
> Testing confirms patch 2 alone is sufficient =E2=80=94 the existing
> amd_gpio_irq_enable() flow works correctly once probe ordering is
> fixed, making the manual IRQ restoration in the reverted patch
> unnecessary.
>=20
> The probe ordering race was confirmed via dynamic debug tracing:
>=20
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration
>=20
> Tested on Lenovo Yoga 7 14AGP11 (83TD), Fedora 44, kernel 7.1.0-rc5+.

Shall this go in via i2c?


--jN9PZrx3kRwNj49f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoZpbsACgkQFA3kzBSg
KbaRCRAAjSsdhv6b6pdOFM2BffkCZM/6ZWCaNXB6RCbYmLw5BVfed318TxwOOL5T
suUligqLCn1PPKBgNJAH89wIrgdvUUClz/eJL0CwOd17A2ReQ7e2ExN8x7yf9JWe
PA3b3eRdZbBnnG78/m1EybesU0xo6x4Sh29p1MwHWdMke/AX4NNlcfNKfRwLVWhz
vVqXjqGrspKDoebzSvAa93GZPv3lKKic8uIkD9eWnKP2ioZB0t2OPmyNwamXXLVi
brqWg6S6ehk3eNfDa5wS0Je/Xz7oDJ0kATrexS1gpLKI4bYOTVAIlelAYo+vHm5r
0BuY67ERoo96S/a/TrRnaeRigoh/DYeH0cZXyKktB1L5UBxld7xCEfaoYlzTjqv5
AQl12CkVSw1GRg99jqPaTZh7AOGSvRmfQr+nnoGw3Rwl6K8j5l3P7LPO7BtOj1Ks
nZBRFd1eRBJ5duHA2TVcV0oTRwv83luLDVbePRdzw2L1p8upW4ZWpySaa0QfO0An
iguO4LCIhsPeU6vGT0vrx9SOZCg22/mDbTfYSeiZnZyl9MWEsk8+8AxjIouJfU4S
xN/bYKMKDqJY5IF+olOMYaaBH3pmRzaNA8LQ6maCa7UEzoDZ9DhvvQUj39WFxPHg
XikulRGJGQcw1ChCwBZzgT5OCSJEnUth44FfklzYvbP9dVkt7Ws=
=Zk12
-----END PGP SIGNATURE-----

--jN9PZrx3kRwNj49f--


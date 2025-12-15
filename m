Return-Path: <linux-gpio+bounces-29553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D93BCBE199
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 14:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12F1C309AA52
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 13:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997EB32FA3B;
	Mon, 15 Dec 2025 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Tnyivrbu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2709B331208
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804914; cv=none; b=SJnkbyMHYtMckpk6L66AmM30FKLHVJGaoaNbuWhnA67jObq3IjvtpJJdATPJBd2NqdX/uPd4PofvuluEZP2iAMfP2mN1Kd++RbwQ6TYKD5m3PsMxBmjb2yQQRCgNKXBE0QUGWsrTFktSM3IlTxEOss65gdRZix+G5Gx6eZefpn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804914; c=relaxed/simple;
	bh=vPWIHJgvuyZntPcHKutsm4gR3Vu9+6sz6G/M/qLZZH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bK/J8lOY9vFk6fZs/HkPZzdDJ9d1xcBl4dzEmwjDfqK9TksqylkbemzEHnNNV5ZNi+rXTw/zLdDx8tvLXxxCfrxkvfLs2Jv426zk1yk/KLB9idGnAr+EwO0KD/mMxnbrpRyVoJldjGn1wdEeytpInctGF/YD2QNtovg8nCeidCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Tnyivrbu; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 15 Dec 2025 15:21:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765804905; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=vcnIqBfflnReGqKpBGCiBXZVXaCXsmm2BvlikGCZ79w=;
	b=TnyivrbuSO8Au06YcmDqK2hRNo3r0/q3pAvE3ZrkZ/4DwoWgvHfeMMRMRVOUvO8bYe3Pto
	mb5TnGNL+lAvjVh7pTRF/pgqkW6tDE3iiybMpDpkJ5ujUA0B082jO0x65UmJ/YSAwWXcRG
	D3pi5/9D+IriC2JhaNTr02+SMa0nYQ8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RESEND v6 17/17] MAINTAINERS: Add ROHM BD72720 PMIC
Message-ID: <5ab04df42d8fddab4c2b0b86414314c6bb815ffd.1765804226.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1765804226.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zYadpP6xVjNNkn6C"
Content-Disposition: inline
In-Reply-To: <cover.1765804226.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--zYadpP6xVjNNkn6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the ROHM BD72720 PMIC driver files to be maintained by undersigned.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 RFCv1 =3D>:
 - No changes
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..23bf05492d34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22745,6 +22745,7 @@ S:	Supported
 F:	drivers/clk/clk-bd718x7.c
 F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
+F:	drivers/gpio/gpio-bd72720.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/mfd/rohm-bd9576.c
@@ -22761,6 +22762,7 @@ F:	drivers/watchdog/bd96801_wdt.c
 F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
+F:	include/linux/mfd/rohm-bd72720.h
 F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-bd96801.h
 F:	include/linux/mfd/rohm-bd96802.h
--=20
2.52.0


--zYadpP6xVjNNkn6C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmlAC2EACgkQeFA3/03a
ocWHEQf+MyWk+4NYJp9XB4SNaIF1lJbbxyQOItGP79yR6deXNP7IV04DiGzOX4un
6UkHpEBO9UeUxGYdmxLEOKpCuJmmTD2C2lvjkxxW9W7kRNsHZJdLIO/Uk4Ce+U7T
RkhIe8X3OdTAZ0lrRwEEykdggAZgUog/EM+HH6SWj2Ag0U+F4VtghyQUbrMfaew/
aLfAcqepXOZ1Wdz17MOJIOAxSp6fEhBRuO2ZL5n5XJie3fmF3UG7zE4d1sRHmTHW
MEbQfjKHErROBliOloLtkdXM6Fj/t6w9ubOfShpt3FYpTOXuAw+M0x0PS0uZB3p0
4EKUyj/d26WaqGAe+w+wdBRzT9buWA==
=v5Zo
-----END PGP SIGNATURE-----

--zYadpP6xVjNNkn6C--


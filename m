Return-Path: <linux-gpio+bounces-34786-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHg7Azn81GmgzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34786-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:44:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CBC3AE949
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 962AC307F9FD
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7D53B47D8;
	Tue,  7 Apr 2026 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d4dtHIGU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FB212550
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565737; cv=none; b=raXuApux5GmHk2xdkX5MnK9KKVW9iqypn3bzxmEsw7Ai0i8QQkF1YIwQgbt6CzMOf2LiPDzkXRP668CZkkUialMLkPEMGStULLb9+ZKqqWIQu+8cC67uCGfvE3OBA2KvT+bcSbiRd9Qt/D2kzFdHaT4cpia9zpVFs4r3hVX169s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565737; c=relaxed/simple;
	bh=NDvoWCNckb+HiyiJCkM6tFoovnJ9cB8RnjLLcfX2ncw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IgXG5B1gNtodQBPZ+m7TAxcP0RjGC7R4FKrxHAZh524sepKRj1OJ/rBq1j1WPZ93WI2l5lEStJzl9snF69MP70Iab9rIoorQnAXen4GlpsGQPtJkeTQJPtchsYryYjaslOCDFI7r5E8cCZEXcjFnspMnI8L6fgv9NX8Yis/kQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d4dtHIGU; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 7 Apr 2026 15:41:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775565724; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type; bh=HyZfw/iTSUCVIQvx8srzyoIAkvgWLMs7oNKSmxPASvQ=;
	b=d4dtHIGUcvUjrUmjws+FSwKwdOPI3bDmmbx3wSK2HeR3tqNiD04rwFEt9fGEctezam3YZj
	DGAG9WdhObGd13r6bLNkJmrS6gzA4gKTTA5J9RkUM0MyrqoR9h1Y65oBj1jgYzf4kzMkE+
	6o+RzohqvPqwgSiKPSa4JpFhAkA/zN8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] gpio: handle missing regmap
Message-ID: <5bfffee380863bcf24f3062e48094c8eb7b1342f.1775565381.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3RJFuEeMfWMbPJAH"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.26 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34786-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,kemnade.info];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:dkim]
X-Rspamd-Queue-Id: 60CBC3AE949
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3RJFuEeMfWMbPJAH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Currently the probe does not check whether getting the regmap succeeded.
This can cause crash when regmap is used, if it wasn't successfully
obtained. Failing to get the regmap is unlikely, especially since this
driver is expected to be kicked by the MFD driver only after registering
the regmap - but it is still better to handle this gracefully.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Fixes: e7eef0bd4075 ("regulator: bd71828-regulator.c: Fix LDON-HEAD mode")

---
As mentioned, this is really not likely to happen. Hence, I am not sure
it needs to be backported or whether to add the Fixes tag or not. OTOH,
fix is very trivial and unlikely to conflict - so maybe it's better to
just backport it.

---
 drivers/gpio/gpio-bd72720.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-bd72720.c b/drivers/gpio/gpio-bd72720.c
index 6549dbf4c7ad..d0f936ed80af 100644
--- a/drivers/gpio/gpio-bd72720.c
+++ b/drivers/gpio/gpio-bd72720.c
@@ -256,6 +256,8 @@ static int gpo_bd72720_probe(struct platform_device *pd=
ev)
 	g->dev =3D dev;
 	g->chip.parent =3D parent;
 	g->regmap =3D dev_get_regmap(parent, NULL);
+	if (!g->regmap)
+		return -ENODEV;
=20
 	return devm_gpiochip_add_data(dev, &g->chip, g);
 }

base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
--=20
2.53.0


--3RJFuEeMfWMbPJAH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmnU+4YACgkQeFA3/03a
ocV7+wf5Absyq1hATE2LWTDJr97R7TBrDwEjKUHaax216bbNEhadGURrbQSWeAhX
Au1C9EKOtWBDngS+i/qM9S9X/ubFVoP0VrwxYrmZDll/isyZyMhM93qHrhY30pn/
x1uRiSBmnnCDyNJCcuSD7VnA8t2fIIi8HJ7go6ihon1zeulJTZBWAv5SGWmpiS6T
bMZ1C+Tib9l6IWQhnV2+3/0uja0xS0Z/vO2NjpY3XTuLow8vkpqyriXGnhu8Ycyx
ha0iUAEi+a8981U+P0pgCtUVQZ6qDhsAdHJQmnqqvoiXdWTZ5fih3DGloOFsarHU
U7HMX+ylI4MfB5S/bXvMJ6aaffB/qQ==
=1Z7C
-----END PGP SIGNATURE-----

--3RJFuEeMfWMbPJAH--


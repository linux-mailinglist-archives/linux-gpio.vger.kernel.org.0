Return-Path: <linux-gpio+bounces-39321-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XsLsBmYORWox6AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39321-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 14:56:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B22CF6EDA7C
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 14:56:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=R6udX1s6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39321-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39321-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C8EA312F769
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 12:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2F5480DEA;
	Wed,  1 Jul 2026 12:43:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56005480348;
	Wed,  1 Jul 2026 12:43:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909799; cv=none; b=k949vZ9oPGNXOX7oBmXlmS24sv9wJPSqapDcw67BVm3DZo35WxZVhDxsMxKT1BEBvlw1gyH2y9WXlQmBsU4/FVGbi3ZLG0jzrJzA/abCHfbohHw+xewV8gd+Rip1uTujQZI/xR+zUFvCT/CCvPfA5uEyxvovqAMdwvBsLAg3AAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909799; c=relaxed/simple;
	bh=zJevfdSMG4AJEgqzzGvpVZZEevc7eVCrmO15iNl2q4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpOwUBKzqFCfuBfvDLyqupgmTyWF3H4+qoc2632+U5wKEuIFy3VN8WKCP2pKBiGQ0HgyzHugwWqxi3w2G0JTWscgFi9FNTLKLlDHPZHlcCKmS3ZQJKq6H0Kkqzz88nwcRZQjVo8rIv5OsJCSQMsc68JX8p4NXlgcLEb7YCOvGss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R6udX1s6; arc=none smtp.client-ip=91.218.175.174
Date: Wed, 1 Jul 2026 15:43:08 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782909795; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=U7y0rtFd8Id0Kr1JLKnltce7dF6ibmUq5mVZfAqMYvg=;
	b=R6udX1s6xnLdV7hdiL3DysTvEhBJ6kEn44CpbH1kBF426z2vDLkxB528FltYTSy/0WP3mW
	mQ4Fzkgdr53OgbnXbZUJTKhtrjM4Ovcu8Y0rBAg84s0QrzGxB+9CSqQuH1Ro2hT34lcopF
	UR+4bWMYDHwfYyphD9TckwTm1xGUqk4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 6/8] clk: bd718x7: Support ROHM BD73800
Message-ID: <ad883eccddda016a9e63708d206a5c23dee246cb.1782909323.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1F/Xq7h4mIXqx1uL"
Content-Disposition: inline
In-Reply-To: <cover.1782909323.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	SIGNED_PGP(-2.00)[];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-39321-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B22CF6EDA7C


--1F/Xq7h4mIXqx1uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

The ROHM BD73800 PMIC has a 32.768 kHz clock gate. Add support for
controlling this clock.

NOTE: The CLKOUT pin can be muxed by an OTP option. On some OTP
configurations the CLKOUT is not outputting the clk signal.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/clk/clk-bd718x7.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index 1cae974e6d1d..2dc6b8e46f18 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -21,6 +21,9 @@
 #define BD718XX_REG_OUT32K	0x2E
 /* BD72720 */
 #define BD72720_REG_OUT32K	0x9a
+/* BD73800 */
+#define BD73800_REG_OUT32K	0x50
+
 /*
  * BD71837, BD71847, and BD71828 all use bit [0] to clk output control
  */
@@ -123,6 +126,10 @@ static int bd71837_clk_probe(struct platform_device *p=
dev)
 		c->reg =3D BD72720_REG_OUT32K;
 		c->mask =3D CLK_OUT_EN_MASK;
 		break;
+	case ROHM_CHIP_TYPE_BD73800:
+		c->reg =3D BD73800_REG_OUT32K;
+		c->mask =3D CLK_OUT_EN_MASK;
+		break;
 	default:
 		dev_err(&pdev->dev, "Unknown clk chip\n");
 		return -EINVAL;
@@ -152,6 +159,7 @@ static const struct platform_device_id bd718x7_clk_id[]=
 =3D {
 	{ "bd71828-clk", ROHM_CHIP_TYPE_BD71828 },
 	{ "bd71815-clk", ROHM_CHIP_TYPE_BD71815 },
 	{ "bd72720-clk", ROHM_CHIP_TYPE_BD72720 },
+	{ "bd73800-clk", ROHM_CHIP_TYPE_BD73800 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_clk_id);
--=20
2.54.0


--1F/Xq7h4mIXqx1uL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpFC1wACgkQeFA3/03a
ocUbaAf/d7MbmBs0y/WQnjnQg/4i6yvH92DGkIwThuxpkJM78/oPj6AFER52hDyG
f2C8T7oc9gYxUtefvsc6aSF6XIqZO8Uw+R4BeVgEjVc7DHKbwJOYVNScn3lsh0vx
cNbpLW4YmomHHS+oL1B2Q95syCh/X39iFBCitMgoRZyifCQq37U91RFB4gC6hIM+
lHUlDLXDMjFFs3KyY1UygoFYqAc7yN7zRHA7c3cPq9MHY25n8jRMiLNy78O/Q5pf
zNhGsETiuWXczukDORyVBOg3awI6kz8rkfBkXizId2fqXxDQN1trgwtm218cnaEi
Hp7/wHzCtEFHLi+La90FAslISx+6dg==
=Hu2m
-----END PGP SIGNATURE-----

--1F/Xq7h4mIXqx1uL--


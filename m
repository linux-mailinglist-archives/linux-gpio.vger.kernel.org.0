Return-Path: <linux-gpio+bounces-39319-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +DvbIG0QRWo06QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39319-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:04:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F6D6EDCE2
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:04:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=GVd6D98n;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39319-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39319-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8147A301F684
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 12:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C7A48A2D2;
	Wed,  1 Jul 2026 12:42:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417548166B;
	Wed,  1 Jul 2026 12:42:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909752; cv=none; b=uxgLqaoDe5p7rlaJtyoZW31sfY9nGD/CHFx12Ze0oBPPyUCZe3T5kyEdW2KZH9eprXDjVUNfs7GKRKr6imWEfdLkIhJ6PK1aO182DQ4zy2kku5sW2j2derHtA6JRLO16R3AKaXOHZzwj8AaYGAQLXN68C/DxIHueRBYvsaMA8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909752; c=relaxed/simple;
	bh=R9FIIyC7v3yveCxvL9Sv1vZG8pY5UgbwEw7oji3WHXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKfsHytV3ewxE3n1qu3o58xprE/3wfokmkhBjfqmO/Ok+MDRLrmxFsECMtE8JgsdavLq6K1L0bJosPsctdKnZcCLOcTgUyGIy8xDhUdA7HVGJ+MMXF0H3QRsgoGh9OzYBrYx40uOo+WMNmJrXzLvJ68j6KI9msR+d8nvV0ZIhA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GVd6D98n; arc=none smtp.client-ip=91.218.175.182
Date: Wed, 1 Jul 2026 15:42:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782909747; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=IvyP+6IBPo+SaCxxlxcFooQLBfZsZ2IQR6meFJNWH0U=;
	b=GVd6D98nTKzRfR7N6XBoHPEIFSrR+XSx7395C2O9sfsMpzevU0JZxH18gRX/q/66qzY7Ly
	u6LC8cGO2kFC8wbH6IMeP3GIwpfP6an6ny7rdxEGPnnqetkE8013xocU/W4I4TeZ5wjPxX
	p2HAEKShkuY/ItN9wZPORiZNzPBJ6S0=
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
Subject: [PATCH 4/8] rtc: bd70528: Support RTC on ROHM BD73800
Message-ID: <d9f5b1c6b165699627c7cf127a7ec64d28e15cca.1782909323.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opg1Xu82DhyF1m53"
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-39319-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3F6D6EDCE2


--opg1Xu82DhyF1m53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

BD73800 contains similar RTC block as BD71828 and BD71815. Only the address
offsets seem different. Support also BD73800 RTC using the rtc-bd70528.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/rtc/rtc-bd70528.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 482810b61495..fd415e327ea6 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -8,6 +8,7 @@
 #include <linux/mfd/rohm-bd71815.h>
 #include <linux/mfd/rohm-bd71828.h>
 #include <linux/mfd/rohm-bd72720.h>
+#include <linux/mfd/rohm-bd73800.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -284,6 +285,12 @@ static int bd70528_probe(struct platform_device *pdev)
 		bd_rtc->bd718xx_alm_block_start =3D BD72720_REG_RTC_ALM_START;
 		hour_reg =3D BD72720_REG_RTC_HOUR;
 		break;
+	case ROHM_CHIP_TYPE_BD73800:
+		bd_rtc->reg_time_start =3D BD73800_REG_RTC_START;
+		bd_rtc->bd718xx_alm_block_start =3D BD73800_REG_RTC_ALM_START;
+		hour_reg =3D BD73800_REG_RTC_HOUR;
+		break;
+
 	default:
 		dev_err(&pdev->dev, "Unknown chip\n");
 		return -ENOENT;
@@ -344,6 +351,7 @@ static const struct platform_device_id bd718x7_rtc_id[]=
 =3D {
 	{ .name =3D "bd71828-rtc", .driver_data =3D ROHM_CHIP_TYPE_BD71828 },
 	{ .name =3D "bd71815-rtc", .driver_data =3D ROHM_CHIP_TYPE_BD71815 },
 	{ .name =3D "bd72720-rtc", .driver_data =3D ROHM_CHIP_TYPE_BD72720 },
+	{ .name =3D "bd73800-rtc", .driver_data =3D ROHM_CHIP_TYPE_BD73800 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_rtc_id);
--=20
2.54.0


--opg1Xu82DhyF1m53
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpFCywACgkQeFA3/03a
ocXD8Qf8DPGjAv6Z697J0P6vwwgEi6/pfKwWCGv14HNNOKH5tHiqqtPGFw5ZhW1C
Ch36520fY578Krn2pwAlXMU4Yz6hiHNW/g/U3vIgHAYCr+bH+2c00/1yHDTuDlmw
cF5I30ELpEpXSW1L0M41KmdN7kR/gTa8Hzr5EGk2XQ697BIj0VjuyupPZZul7IQg
0RP1FvdQqXffQcqLIJVtLFOfbK07D5cp8qBpEQ6/qbq5SU9Yec+9R3IYiLRKOF66
LbYKpuokxlYPNJzBJqaT35NAGsMNDRqgTK5R3qTxMHUkKyHdB/4+3nWGwt8f4mE+
xEA7PVsJLxDjSuVT0zNmcZmjnvNIRA==
=9kOM
-----END PGP SIGNATURE-----

--opg1Xu82DhyF1m53--


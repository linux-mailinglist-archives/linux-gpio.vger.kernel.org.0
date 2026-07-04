Return-Path: <linux-gpio+bounces-39447-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jca4E5QiSWp9ygAAu9opvQ
	(envelope-from <linux-gpio+bounces-39447-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 17:11:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FC707CC4
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 17:11:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wzVBOJOT;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=SZJMitZ4;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39447-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39447-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A3AC30131CB
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jul 2026 15:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B16E349CD3;
	Sat,  4 Jul 2026 15:11:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3D25B098;
	Sat,  4 Jul 2026 15:11:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783177871; cv=none; b=C0gzJZQbqK6vxAq7MjOLRd4sh8/HU7yUBRdNBuoIy3SqlvMTa89kmJX3cPiWk+UjYFumAxFz+kV6gFB9ifTZ1n/NPdvDogD1q+rlV1PA857VTBsy8xZYm5p1Et2+BVXIbUitxHhZ+LvplQUYcIrDfvmrspiXKN8rJnV9BuDPD1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783177871; c=relaxed/simple;
	bh=CbTXr+lA4+EPkNUM/++a0Ubhfu8sVpy8bIFu2D+yz6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sygye0l3hZtrrxKXcWE13Khxh2YerxfFnXaXAWNbAg+8ZiDHkYlZrtB6FUZYhOSPxz2KQwFiDsznF3ov2XVO0Alp9egen7v2Dmgt165/4iSsPPDKb5yDZ6jWsvrA1nbapjs7/XVjvhB1/ZSOAa0iahfcbhkNTJQUlbrQc6UOQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wzVBOJOT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SZJMitZ4; arc=none smtp.client-ip=80.241.56.152
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gsvFv5tyqz9v9T;
	Sat,  4 Jul 2026 17:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783177859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fr/TUoC8EfrwMuHjPOSvC9Rv2R/dV+pzUOtY34nMog4=;
	b=wzVBOJOT+VmzkSsRTirGdi/cwm8et+WdiEMEOoGAC03ekxLM4B5LiK7PTHv9OIq1+orggF
	dL7fTxjoES5QOde39uAZUcAUoC6+Z9X5IXyn8pnjnCXdyyRK3YCDl6pH63QDujkZ/xHV56
	8+pNPrr6M33HB8I9K8PKTi2sz95w8TFvmPQchWj8Md6jldGaGvL0oMA6PhGBAYEzTUhAQJ
	6KUvG783gzu3JrpmAakevkZ9SRhjwXs5ApxUke+ty/W5QP+388e3SR8Hg+dgXC4qcMNw9k
	fBN8bmLj9l1boZEHpThrd53WRtG1MNKdh2nLlZ/x0guk2WeRCPY560WZfj2pxg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783177858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fr/TUoC8EfrwMuHjPOSvC9Rv2R/dV+pzUOtY34nMog4=;
	b=SZJMitZ41o1izVh+2jEjK1jI65MtztHTTBGSAJdWq5UsE5XI+O5U8/JM0RF52mo7MjCCxn
	UQ/CEuD+FMRQdZlxa6MmlcbocEUZPedX0kMuFQzTVawlaIHvSQipDs8+kFTw3kI/+SN5+x
	gci/w5BamU8xF+Rfo2P3hC3uuUfmGri9PV8zLvc0gUGCwFjXnoiyIWR4VBo8HFrrB/moYd
	2lcWupwTm1iu/E7ByXBcbmHCnjPxEF2DtsqHWuteSfQkC34J2TNMkfoGJtzaL1EU1n8FAt
	UcZrQxU3wd8p4OlU+g4bJEcbW8kHP9bf8Nu+g8urzAUUtTkErUq8Rbr86+RMVg==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpio: rcar: Drop unused FILONOFF macro
Date: Sat,  4 Jul 2026 17:10:39 +0200
Message-ID: <20260704151055.211082-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 86rwpi8u415zy666a4odkgak59ew146f
X-MBO-RS-ID: e08292fc3d51beaf01c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39447-lists,linux-gpio=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:brgl@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB6FC707CC4

The FILONOFF macro is never used in the driver, drop it.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpio/gpio-rcar.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 86777e097fd87..09bebde5c4260 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -59,7 +59,6 @@ struct gpio_rcar_priv {
 #define MSKCLR		0x1c	/* Interrupt Mask Clear Register */
 #define POSNEG		0x20	/* Positive/Negative Logic Select Register */
 #define EDGLEVEL	0x24	/* Edge/level Select Register */
-#define FILONOFF	0x28	/* Chattering Prevention On/Off Register */
 #define OUTDTSEL	0x40	/* Output Data Select Register */
 #define BOTHEDGE	0x4c	/* One Edge/Both Edge Select Register */
 #define INEN		0x50	/* General Input Enable Register */
-- 
2.53.0



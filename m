Return-Path: <linux-gpio+bounces-39139-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vxXNIfZ9Qmrk8QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39139-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:15:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F036DBDA6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=lPoIgIPn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39139-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39139-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CEBC30338A1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 14:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98C2369D76;
	Mon, 29 Jun 2026 14:07:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC46374E41;
	Mon, 29 Jun 2026 14:07:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742057; cv=none; b=NQfxLHn1yAQBFMf/hh2V3yydHDQadi73pHYDoapOlZNG/tTCIaK72mPX6iMxXW71ykVsiyJQw85Ai5QLHjRbrimiOPBKO4tf5adq8cij31PO5bIl3nXrp9qqm8vur8odN/wzTTpMWGqfW8W2vSWuPB/0BTi93yj2JPjD6FdcRS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742057; c=relaxed/simple;
	bh=eJJqdpWhIb8dSg0ENNfRnI/GvwL/7vreEYrgL2mouk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EE4RzPlZR9Ay34urRZWovOaKtV0agC0LNTxzYdhJuPzlxTiIzObi3JqmEFI4mDRHkxuJlKjMPE8MaQs/kf1a6d+Mlf5DGYkq1p+AJiX1W6plvpisdkBXA9UjIeCZLbBZ8X97jXmGuL9jiela1zxUTKiVv3H2jgd5KnpGOLXBZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lPoIgIPn; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B783C5145F;
	Mon, 29 Jun 2026 14:07:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 098725FF96;
	Mon, 29 Jun 2026 14:07:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2E2E106F1853;
	Mon, 29 Jun 2026 16:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782742045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hA7qKBZwTBum/9Ky5FOFj95Riz4OEVcRaDc4KyeAR2c=;
	b=lPoIgIPnnZJZrN9cjgVWhw11mk9E6uLfELG6e8Ov0Ktj68CedhTo4FUHbHk/gUjvcg6pUm
	93Zwf5TndypzLeglig4kBOvmm6/hy2KeEtbWgXCC/Vh2AqdFEYlOq3nggt9/E2xLudBZJN
	ZdG9pf/lZ/zEeAfVLaG0hpqQTCdk0G5+KWh1tFS155BKRBGaLVQ4DpHxWKfn6hcKsTXbV5
	lcxNZx/iFocBzfrEHnCU8xFnIi59Kyy3HJTXs4q4yroKoaCjfBWw+AUyxvP8E+jxSdhZmD
	63oHUXz+Cy3zh3pGnhACj7Qj6nr2TgeNwfuLotBCAVNaI3UqNDFEx66ZUzUriQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 29 Jun 2026 16:07:02 +0200
Subject: [PATCH] gpio-f7188x: Add support for NCT6126D version B
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-gpio-f7188x-nct6126d-version-b-v1-1-a06226c02a2d@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6DIBCF4auYWTuJ0HQKvYrpQmC00wUaUGNiv
 HtRl9/i/W+HzEk4w7vaIfEqWcZYoOoK/LeLA6OEYtCNpoa0xWGSEfuXMmbD6GdSmgKunM4hOuz
 Mw4cnkbHOQolMiXvZroP2czsv7sd+PqtwHH9EN33lggAAAA==
X-Change-ID: 20260629-gpio-f7188x-nct6126d-version-b-a83cd56689b9
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Henning Schild <henning.schild@siemens.com>, 
 Simon Guinot <simon.guinot@sequanux.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742043; l=1746;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=eJJqdpWhIb8dSg0ENNfRnI/GvwL/7vreEYrgL2mouk0=;
 b=8X2YJtcLB54HkwALYM3TTZfe3aJNCEA60EVo5wUxVlFwlS8HgqWH/33V35CB+kSa6LY1cjfcW
 fZpBgOOH4IiCJLtAvLfeXab7DVe9xR3PfTKcKEfm66UKurva+yCrhmX
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39139-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:henning.schild@siemens.com,m:simon.guinot@sequanux.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:stable@vger.kernel.org,m:paul.louvel@bootlin.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:url,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16F036DBDA6

The Nuvoton NCT6126D Super-I/O is available in two hardware revisions.
According to the manufacturer datasheet revision 2.4, version A reports
chip ID 0xD283, while version B reports chip ID 0xD284.

The driver currently only recognizes only the version A ID. Version B
only contains hardware fixes unrelated to the GPIO functionality, so it
can be supported by simply adding its chip ID without any other driver
changes.

Fixes: 3002b8642f01 ("gpio-f7188x: fix chip name and pin count on Nuvoton chip")
Cc: stable@vger.kernel.org

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/gpio/gpio-f7188x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 4d5b927ad70f..fb007b978729 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -48,7 +48,8 @@
 /*
  * Nuvoton devices.
  */
-#define SIO_NCT6126D_ID		0xD283  /* NCT6126D chipset ID */
+#define SIO_NCT6126D_VER_A_ID		0xD283  /* NCT6126D version A chipset ID */
+#define SIO_NCT6126D_VER_B_ID		0xD284  /* NCT6126D version B chipset ID */
 
 #define SIO_LD_GPIO_NUVOTON	0x07	/* GPIO logical device */
 
@@ -564,7 +565,8 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 	case SIO_F81865_ID:
 		sio->type = f81865;
 		break;
-	case SIO_NCT6126D_ID:
+	case SIO_NCT6126D_VER_A_ID:
+	case SIO_NCT6126D_VER_B_ID:
 		sio->device = SIO_LD_GPIO_NUVOTON;
 		sio->type = nct6126d;
 		break;

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260629-gpio-f7188x-nct6126d-version-b-a83cd56689b9

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



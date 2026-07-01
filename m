Return-Path: <linux-gpio+bounces-39332-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9PPENK9IRWo5+AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39332-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 19:04:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489816F0239
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 19:04:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=cSuZuf8G;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39332-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39332-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08A7A30FF779
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 16:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF22383985;
	Wed,  1 Jul 2026 16:57:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDA3803F1
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 16:57:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925029; cv=none; b=N25KD0SwztO9ig/c0FuXrwz4HEMoicfblYpdmeKW0KHmFVhEo8cWb942Ej8C0/2pqwy8x3W1dI4K9cbGraZntJ77WnotSUVpHUsnGP+KGDmH8PXPCotESaQokHcnwQBfxqm9dnxCaO1stbAr0tVAOqEDL6C040CHlsp/sMIh+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925029; c=relaxed/simple;
	bh=T6zTvLHUfv0YrCeCqtgrOJKLVr87FO6auql0RaSwsF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9awFEddz4n4ofd+mzMbv6SATHDSbzEyjQ+z5/KYA26JhKzpYu8kVC9lLvCGt0b+FpnqWOdpOgKsMgk26H35F6oRZF/D9qvXpJeoq0pfjkdctLPtOaXFCkIgeK5q2ajJRONuSuuA8Pla18I/pJzhuCYrISPG5NGZmh9y2K+1xQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cSuZuf8G; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 452E74E40BFB;
	Wed,  1 Jul 2026 16:57:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19A3D5FD9D;
	Wed,  1 Jul 2026 16:57:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86291104C968B;
	Wed,  1 Jul 2026 18:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K2wIb61d/vbPBh3LQKJdX0mxih1u5j8yQcVxqysPPzU=;
	b=cSuZuf8GDIuNhZ6U5aARBc6UsrU538PsigMWIn47bQOi3xRZ4rhckFNXxD9iuPK0qjHWde
	EBbHuVASC58WZVkYEtEfx2e6M+WjcvGanFpAzlgUp5Bc9lQAoo71C8vxDhuuO7yaKjOAN/
	MERhxkvZ/lPKSCf3BkuUr22TNulcwMElLPcD2R1yphq7bRrrGXCcqtZx55dpXgvwLvUYMj
	Pn3KzcNrX5g63O6RK+liQSID2F+ytFPTo/X28/VldBh+9OYAxpxJq0Bw29154jiYbXMiS5
	kWAckrB3aoNvunrvi//33soqtcQlp0Zh1dB0cPWQ2bk7NLBlcSkxKPclHsNZqw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:57:00 +0200
Subject: [PATCH 3/5] gpio: nomadik: drop duplicate probe error line
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-3-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
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
	TAGGED_FROM(0.00)[bounces-39332-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[theo.lebrun@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:theo.lebrun@bootlin.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 489816F0239

Now that all error codepaths in nmk_gpio_populate_chip() log an error,
drop dev_err() call that is made on nmk_gpio_populate_chip() failure.

Current boot log:

[    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER
[    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip struct

The second line is always redundant (or is logged when we shouldn't log,
like ioremap or alloc failures).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 4a7db282bad8..eba095eeb3d6 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -651,10 +651,8 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	int ret;
 
 	nmk_chip = nmk_gpio_populate_chip(dev_fwnode(dev), pdev);
-	if (IS_ERR(nmk_chip)) {
-		dev_err(dev, "could not populate nmk chip struct\n");
+	if (IS_ERR(nmk_chip))
 		return PTR_ERR(nmk_chip);
-	}
 
 	supports_sleepmode =
 		device_property_read_bool(dev, "st,supports-sleepmode");

-- 
2.55.0



Return-Path: <linux-gpio+bounces-38413-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mENlIf1tLmpYvwQAu9opvQ
	(envelope-from <linux-gpio+bounces-38413-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 11:01:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A23680B6F
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 11:01:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rCvOfc71;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38413-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38413-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93ABE3001A66
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 09:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F3A3932FD;
	Sun, 14 Jun 2026 09:01:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58F5395D8C
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 09:01:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781427701; cv=none; b=nhKTIrE7wJpAFeyjajr+Dwkcs0w3DgtxPngXXW348h0VEOvwD2x91TNHL6a/3Fm8YBpeTWfEwe9Fxc7InYC3jvc6cRgknv4KoQ2RaBi6GdrQeTIs6PapZK3hS6Qug+dTTPCwgJ86YAdl73t/Ek3Aj8/f61GQY5zfEmAbr3UV/7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781427701; c=relaxed/simple;
	bh=YWNnWHClE3Ny2yYoxJDO3upPIgy6Q9CUMVVhiRbwgs8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Z2xLPSMXlW1pV0vL2JJ2jO8M9mJnEF4Kgvdzj0za1KZuZAXka9GI62c1PKqfy5DEyz0epEUfJDjfpxxcCDUgYB2747TJseNt2hYKunYDFFn9sIrGy9C7TqU/6MPf3TW36J4Ov+jV9ZRpgEX8VQDTrp/2rsjErVMx1Pc8yDqZevI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCvOfc71; arc=none smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8422871b42dso1433186b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781427695; x=1782032495; darn=vger.kernel.org;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AeCTcCGBmXaeoE0gLM8C1mS8ZMOJYPKoEcB5kH+0npk=;
        b=rCvOfc71lMfb+3el7R3Y4mBrs1f2oBtPVBdgntEXIoRXn7RQQfv3IyQpRINpc5fOm5
         dnUG8oJ6VDjItvGUdFmDOeGinnnu2i+BpSvadG9eEbfQ4zvtofJuG2ScxA7bd8AFhmVN
         Oa+TMR7HN219va6MYIjLyFycI1wjuRAsHoI9hwuD09r994BvfdbSXOv8iip7mC1LC9z+
         dQ6ES9bs29j9OM0+jdlYwCmSEMkXKvuxEtiH0DyV5HaoJMEPZd5EZu3hfTthHCfpBMhe
         2AvG4GTmXGkE+AgIqhJD0tiiFY1EWQSQl2tkRHQGWvpyb18qu6nWPcUKylu9/LVIvpc6
         9HgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781427695; x=1782032495;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeCTcCGBmXaeoE0gLM8C1mS8ZMOJYPKoEcB5kH+0npk=;
        b=qK1ZPGTe3ZkisD3FK32P9MTU2sRFzOKfb50Xz/aYmF/8QX02+pnm73GCmNZgyjlhtp
         FVULgLE9if91JmQox/RZv0PbFZf5SPcypLxgdHGLon/E2NM8si0R3vh5sII3gc2wnX9b
         jCirawIfNrF/AfjhL8KtwB9GIKADXaufUMHZ97KywtpzCkExRyu44099VEJGFvWWqGmr
         vwqg2QEm19HYmno7B3zYmX5BWyyhLfSSKXUC5Bd/Cu+1T7vYQ+jqrkglKvamVnVAyzzT
         YuUJuJyrm8HN2T+tXV8kou24J6Ukc2Ty7dJk/tDRH6q97MMFos2RQBg3xkaQRZy2vhBl
         OSUg==
X-Gm-Message-State: AOJu0YyCNjplLSKHaLlQtDP/mzomAljGfUzBbNZ6d/66lfDOXKfuR75j
	V4wle2USWKn9f5C3j58cD1/H0ZrQtZol97KN9ZJ52t2q9/tUb37HKNqit9p3BDqf/mA=
X-Gm-Gg: Acq92OHceaOZjY5zWLpKEVReOsAeNyYwGSY5akgLNLCmUoWXvpRLiUeNRSjE+bSDALD
	Bn8SuaXEXgvahZLzj3XdQUJwB2AkAPoG6VVHRyftyDlPP/zuHwGYZmTvCOTD61KJbccxX597FD4
	ayWZiIi6LpP6qCY4myVoAWi23jvO8esOv1vsQ9SMtdOrA4v9Jg/tldBa+66hsYKwLz2iNmqOKqG
	zqiHsx93JHyjyfI5AzBIvA1t78qIjlyaZQuPPGQ7/DkmcxjKonBnGRmW7cfL1UnnhQ8mehKq6VC
	nMBxOLNV8w82AT3Nv9v9RAH/Vglf7PDSCS1DQAyHTSeem9ynZEb1I1qSe/tLzSIkevt/dffKz3C
	z9zV8ZlpC58CS7mRyvsCC1cSFJMKqoqjE1sorXPf9MIryHT9Ev/NMnWYn2e37EXNUArrcwFBi42
	9Mf9aoaPC2eARspkSw
X-Received: by 2002:a05:6a00:f93:b0:842:46a6:e2cf with SMTP id d2e1a72fcca58-8434ce46552mr10855896b3a.21.1781427695533;
        Sun, 14 Jun 2026 02:01:35 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbc89sm7073038b3a.15.2026.06.14.02.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 02:01:35 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH] pinctrl: airoha: Fix AN7583 Pin 21 BIT duplicate in conf tables
From: Wayen Yan <win847@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Linus Walleij <linusw@kernel.org>, linux-mediatek@lists.infradead.org
Date: Sun, 14 Jun 2026 17:01:30 +0800
Message-ID: <178142769046.1925774.12629229026406925492@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38413-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[win847@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:linusw@kernel.org,m:linux-mediatek@lists.infradead.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[win847@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78A23680B6F

From 5ed6ed42e17baf059bfaf1ba0ab5fc484f854659 Mon Sep 17 00:00:00 2001
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 16:56:18 +0800
Subject: [PATCH] pinctrl: airoha: Fix AN7583 Pin 21 BIT duplicate in conf
 tables

AN7583 pinctrl configuration tables have Pin 20 and Pin 21 both mapped
to BIT(18), causing pin 21 configuration to incorrectly modify pin 20.

Fixes the following tables:
- an7583_pinctrl_pullup_conf
- an7583_pinctrl_pulldown_conf
- an7583_pinctrl_drive_e2_conf
- an7583_pinctrl_drive_e4_conf

Pin 18-22 sequence should be: BIT(16), BIT(17), BIT(18), BIT(19), BIT(20)

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 995ba6175c..f325ca41d3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1847,7 +1847,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
@@ -1964,7 +1964,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
@@ -2081,7 +2081,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
@@ -2198,7 +2198,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
-- 
2.51.0



Return-Path: <linux-gpio+bounces-32862-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ohFBNy5Pr2lzTwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32862-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 23:52:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F38242640
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 23:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE953073F8D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 22:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499C237EFF8;
	Mon,  9 Mar 2026 22:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inccpL0n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3FB279346
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 22:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773096745; cv=none; b=QulqQvF4tlPpUjCxc8E5qOMXdm4rEu6wPmbRHRPFUxWt8PVfCdVoMFZH3vw3hhEAg0Oybah7CUyaFZvZ+jWwma8zTYBUG+5eCfd3HR8mkUEDkUJGWDwUU7I3GGRK4lvPdX7I9MBH69wSY1SD/N+dw/Bwhd14g8cCC599K2vIxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773096745; c=relaxed/simple;
	bh=wunlnXvfKir7qarnlHXULFM+eClI1QtYhLLNER2o0LM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jMENdgMu+QJ8Kff5SZUAkD10Qat6tD7FHIGS65YIGAS0rTURlq4GwK6veGZ2OrieyhdC/AfzTw3pVT5W2t4Eg13AoH8677vVysE8vPaAMe46jJlpdZgWsSNxGcgxFd9bWeSPv7R8xQRA1JiJb21HA8QuQM6VhgbqRRQ3RpRWV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inccpL0n; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae505619baso52297925ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 15:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773096743; x=1773701543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FJ2CJKqK7GJP8XEN8e6DlV2Ycki4IQq2ehkokeaIAs=;
        b=inccpL0nD79wSXFhhmR8RCnEbA4hjnp5Uv3KweA6IODBJus3i4h7OMLTv6xoK9+Mwy
         Hnp4aPq+ZuSR7ohASCLpJzeg+oyUqGwD5u9iR8SXaGs6i7NJh5Hg0pgySkwSJis4kx79
         jQPkOyFdJwctlbkXEdiyuXtdjWasyFhkC5KarI/V4pBZ9b1te2zJrqlQDE2QQg+BTO5v
         KtLp+7kj7itkHHmYAcUYJRNkjfGrlnFixnGGejE7gv9IVyGfq129Mg0kK6L8zHrPCPd2
         NQjJgwAzUeV4z1JkzCFxXyVUauECQTL4Wz3lsYspeRPjSKIC/8Z55GxczD2rmHW4WS1H
         KuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773096743; x=1773701543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FJ2CJKqK7GJP8XEN8e6DlV2Ycki4IQq2ehkokeaIAs=;
        b=AIIEswtreSPRBTZpHxaBD6vjj90yJFYsYhebY/IbXGxOU72t3BwDmggSSth5dLgwyN
         TmfM507k8VyCGA+c72xUxuHfKfYfoNKJzHe9IPRYuxCkKKFb+LG2DDQ+lc6KcUXlsgRf
         1hWWE5D06FFqQF5zs4mjn9O+YEE+UAYqZFDXFXFdOMTnohsncQwt6QLntlZoCzAoQvB3
         cQKvvPHWf7zdC92758oad1cFU1rwAftzeth4lAGK1C7WDvE8EJbPR4IeMBBfQrfGgi1T
         H1HIQ238Y8T9lXPFHJnhq//9AAbWUrPLDuUtd9o8so3r5DpRqy5zIGHxM1v/Nha4/BwP
         XczA==
X-Gm-Message-State: AOJu0YzM82XXX0fT8gla9Ao/D+ki2HhfWvzH90JChpWUXuC/LxFk343W
	It3lCh7EPlP6cAyREcbQy6yb624NDE5eYn/2P3HHXSO49KrQY1AbENVgspE/NvYA9gU=
X-Gm-Gg: ATEYQzyAL6AmA/+gCtYlKKn2fO4/8lxvqozjb7g5zm+RO1ujUZRXZ/PQdIyqb2rJEA6
	sR5bBPnEy9UQIwao1MJ9C26sS/eziStoSPybqAiKPCaNlmHO0D/lA9ozZXEItLrHjiCdeiUnRwp
	zHbPATSq2wLp5iOqWKR/KYbGBVmIWIHCZaigrEUmAE+mmkMf/t/o65PLxD+A8iVHB60mtjtpf3B
	pf74GqiUqQsKU/QPMWwkkQLKlWOVBS1uwLRbedFS8A3W1J3rbeBRC+vSDkPN+vYHpU6bTtimn+j
	OtUKZoJdaSCISBQEODwk+/awD8tuWE8N/FlA7ZV8wQRIZo5vJ56pv5QDU4t2u+HNKBqdH5Cwk8u
	WpybFH+LDrjymh5032unC0GQinf3/nwOKUJ/G/FhtXDBeT90l4qKXUwnXOTQyD3dPEjo1ET1io6
	GX83bgGwVEN0HSOVoKjYpd0T8tLf6BywMkfXNBVAJMu1StZmWRXPxP2g==
X-Received: by 2002:a17:902:cf08:b0:2ad:ad0f:bbc3 with SMTP id d9443c01a7336-2ae824dd271mr128790305ad.33.1773096743046;
        Mon, 09 Mar 2026 15:52:23 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm163029705ad.28.2026.03.09.15.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:52:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: htc-egpio: allocate irq with the main struct
Date: Mon,  9 Mar 2026 15:52:04 -0700
Message-ID: <20260309225204.44789-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 39F38242640
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32862-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Use a flexible array member to combinwe allocations.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-htc-egpio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 72935d6dbebf..d15423c718d0 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -46,8 +46,8 @@ struct egpio_info {
 	uint              chained_irq;
 
 	/* egpio info */
-	struct egpio_chip *chip;
 	int               nchips;
+	struct egpio_chip chip[] __counted_by(nchips);
 };
 
 static inline void egpio_writew(u16 value, struct egpio_info *ei, int reg)
@@ -270,10 +270,12 @@ static int __init egpio_probe(struct platform_device *pdev)
 	int               i;
 
 	/* Initialize ei data structure. */
-	ei = devm_kzalloc(&pdev->dev, sizeof(*ei), GFP_KERNEL);
+	ei = devm_kzalloc(&pdev->dev, struct_size(ei, chip, pdata->num_chips), GFP_KERNEL);
 	if (!ei)
 		return -ENOMEM;
 
+	ei->nchips = pdata->num_chips;
+
 	spin_lock_init(&ei->lock);
 
 	/* Find chained irq */
@@ -302,13 +304,6 @@ static int __init egpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ei);
 
-	ei->nchips = pdata->num_chips;
-	ei->chip = devm_kcalloc(&pdev->dev,
-				ei->nchips, sizeof(struct egpio_chip),
-				GFP_KERNEL);
-	if (!ei->chip)
-		return -ENOMEM;
-
 	for (i = 0; i < ei->nchips; i++) {
 		ei->chip[i].reg_start = pdata->chip[i].reg_start;
 		ei->chip[i].cached_values = pdata->chip[i].initial_values;
-- 
2.53.0



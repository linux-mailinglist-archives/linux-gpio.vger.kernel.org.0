Return-Path: <linux-gpio+bounces-33778-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E/MJgU+u2mphQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33778-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 01:06:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F72C4079
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 01:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 419DC3015EDC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 00:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FF640DFCA;
	Thu, 19 Mar 2026 00:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKs9I72Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65DEEA8
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878777; cv=none; b=OobIR4VUJpcTFQkaI3zHI3fUR+PCvkThAG+IlEUqKegoExvNnaNnTKnwsM+EtHtVTJRecZFY0M7zCIeO5MqG22s8aSZopLqftnLWVlaeD9U/Ym22TRLP7Z7g8Op8lPDh1c6NQoyhqFPZwScLbdRgdCmcvHjBeYhDtpYdbd6vyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878777; c=relaxed/simple;
	bh=FzNH19rgnTQby5fAPdsDwWUSiHP1o3ls1AowYzfPyg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMrzcIQTylxZwFgxo7DD8EhnlgSjxF/nqL4DpqrZNMBxl+0ve8RjoS6YgwftR54iwfrgerk9SBzczO8uzw5ab5OIYGrYiolxn050QW5v/DKDYsXVvNbUH1zqFPKJQvhFKD7c+oRwsWDN2Qw5U3E3FxPBKVxNgjUO+Q9jvr5jlIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKs9I72Y; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b06c43e6a7so1537935ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 17:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773878776; x=1774483576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yRm3k9nSwdEcyKRHATcZEGW4qHweuoW5rJO6irAqBPs=;
        b=EKs9I72YKo1AFwo5u1YJpW5ayVVkW4fxZSe3oHvA7EfkSUbVo8yW2xyCZhQAZ7EfPy
         RUzUj0Wx7yDWuzMEAWePvwovWTmqSe0RekEYTceb4llaIRCloDlK9ezFnmKqeXaqZhFF
         r8wl506HQDgMNMuAZnqlcROlL645h3rJYFK2F3rEmCPM8504JcbG1/33u/4PU1QMlhH9
         EUurRx1iZEsFUK6myQuaGhH3vBK4u6KEtuuqzU0Wkaxzx6NWVku/KemPYwrLosbH0W/N
         4uMKfrRNyEKhYxLyvN5PJ1nE3P4UW58CgR92l5inVXaXTqzn6Qa8GIGmZJMa+K/lXuXC
         7Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773878776; x=1774483576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRm3k9nSwdEcyKRHATcZEGW4qHweuoW5rJO6irAqBPs=;
        b=a1nlPMsoGfm4F94APtQMcT5PHYSdDwMAcqLwgdSakGzSKZJM3faPVVvaP6zfWHUcXd
         Aq7fUQjda12Tsog9FJ01xmlFEOoWJ4iI4VeKbcQhgGgJ3h8w+SRazYT/gI9sZ/eXUY90
         OCNqNkn5EHkwknX2WMEMAeT7zkj8wtuN5gz3Zem7MwWifyNVicCyi7uJ/O7bpZ+ByqUt
         dR+wKD1nSFwe8cdsDAcKWGCSkdsQ0vuW+CKW9bB+eRbrR1az1ure5jHMGL0h6NwUSeu9
         V6hLM4zsF5Ijoe/fqLBBlxrhqDtSYr/VxDVTFznSJbPz0Rg1PAXSdT36SBuwQ8xdwBht
         e+LA==
X-Gm-Message-State: AOJu0YzNJMq5SSkRsxHF+AAZmuDurkaFhCShKffZ1SCTnS8cK10/XUPY
	HYeEJYukbVc3m3OT40RudMLkX50XttQtZVfy1E3JyZS483Mq/QEny2H2NWit6A==
X-Gm-Gg: ATEYQzwIhN3jDYM5Ffjwf1kDcJg6LLJYeKa7Z5IOPtcz6aVrcnzYs0qYZNbxPAoj6vJ
	zjPnPLJyY/nIoJsjRrnQ4Gdfnzbf5z4XhHOuNSx+c6osT1TiqbC7eTBCwrh8Ain/LINcLrde8GB
	ZWmCb8gc6Soq1IceN7hIq5tUJBdY9X8HWFQ8Dc1GW6iN9PIPnoRpXOXGUp886CBcKcIiy69tTVd
	wGy0Nr70vYBCg+VJhGCHjaTUVkPip1U9y94xQx1Cfx/WPv1TvZN+H/MGCvWj9lzEqjpqflrvMWc
	Un+DUOLM0HgJjeGF1+C9OUseGyT0/RCieDCLCZJQnL7LNeIZ0NNmAiLjQXlBjOg0ET0/2Hvi3J9
	flC86Z2qW7ZAQm41ChthRIxMGj4+y8HFWXyLP1pdR6u2MUVNOB1KXZYeI+fj9k1P21BD3cPxyLP
	qKKDDMDGKOHXcy6N13csC1mGRVp9uC5IQ/awy37iGad0bT2jnFd/lleN6ZSjEEeutRaw==
X-Received: by 2002:a17:903:2f87:b0:2ae:ba41:60 with SMTP id d9443c01a7336-2b06e3248d5mr49150455ad.1.1773878775805;
        Wed, 18 Mar 2026 17:06:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e4199easm51952735ad.5.2026.03.18.17.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 17:06:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] gpio: mockup: allocate lines with main struct
Date: Wed, 18 Mar 2026 17:05:58 -0700
Message-ID: <20260319000558.22108-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33778-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.947];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D2F72C4079
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove no longer needed kcalloc to simplify allocation.

Added __counted_by along with a counting variable to get extra runtime
analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mockup.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index a7d69f3835c1..a907ce28cbbb 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -52,10 +52,11 @@ struct gpio_mockup_line_status {
 
 struct gpio_mockup_chip {
 	struct gpio_chip gc;
-	struct gpio_mockup_line_status *lines;
 	struct irq_domain *irq_sim_domain;
 	struct dentry *dbg_dir;
 	struct mutex lock;
+	int nr_lines;
+	struct gpio_mockup_line_status lines[] __counted_by(nr_lines);
 };
 
 struct gpio_mockup_dbgfs_private {
@@ -436,15 +437,18 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (rv)
 		name = dev_name(dev);
 
-	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, struct_size(chip, lines, ngpio), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	mutex_init(&chip->lock);
+	chip->nr_lines = ngpio;
 
 	gc = &chip->gc;
-	gc->base = base;
 	gc->ngpio = ngpio;
+	gc->base = base;
+
+	mutex_init(&chip->lock);
+
 	gc->label = name;
 	gc->owner = THIS_MODULE;
 	gc->parent = dev;
@@ -460,11 +464,6 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	gc->request = gpio_mockup_request;
 	gc->free = gpio_mockup_free;
 
-	chip->lines = devm_kcalloc(dev, gc->ngpio,
-				   sizeof(*chip->lines), GFP_KERNEL);
-	if (!chip->lines)
-		return -ENOMEM;
-
 	for (i = 0; i < gc->ngpio; i++)
 		chip->lines[i].dir = GPIO_LINE_DIRECTION_IN;
 
-- 
2.53.0



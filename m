Return-Path: <linux-gpio+bounces-40008-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8e3POux0VWqqogAAu9opvQ
	(envelope-from <linux-gpio+bounces-40008-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:29:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4888274FBAC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:29:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ZW/k1uvx";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40008-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40008-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6118302E301
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 23:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD663D47A9;
	Mon, 13 Jul 2026 23:28:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159243D1A82
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 23:28:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985294; cv=none; b=r+u+NNgjWsvjSKKhRY8UIL2wi/GI1zhESP2JfR2H5QErO0La7IaUuvSK3Re7GFeWzk1MWe/N+M+KeRWrGbicIPJpAtX/WfkH914263CFsOiMkng7125DQICl482PEOohKWLzhgK1MAO8mZPY4ZxVKBXxdX78oPFp0zIxlpqXaRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985294; c=relaxed/simple;
	bh=aaIoKxerYazpmbZIApAxA9/aIMa5XXLt9MueI3ppcgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJ9QZfhcw4vYo0CvrcvMHdOHkIulH0I/lAECo3eomI0VUDtv+oj5MuQAUljIol2wQFaWLZgaDbdKc2mMzfHWfdZItyLPqYCtmP65Hz2nK5i6jEBu+1l1suNLhGz6ATskpNsghJK/C8skDxueikQxnamkYM17KPbeO901mQCo9+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZW/k1uvx; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caea3f742bso41435675ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 16:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783985292; x=1784590092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z60C7Uy39FpdZ+RfV4gWz/iQ2OV7+l8hzFbxcfqVBdM=;
        b=ZW/k1uvx7pqPMNjHGWIgDGUDOQkFbb6HhVSt1kB+EBy+0h2H+tjq48hbzm1onc6yc1
         WDUD1W435MrQtOV21I0SgCqi5VB/upi8qjKbmDuPsRlkk52P2Nb0LIo4tfN+HseN1BBF
         HsU6csuPdl3De782wEwbb+QYTS9GTHe2wcJhwyjjkaMByM51+JHYtt0/RiO/4IVyhXBE
         +OiM11/uwPtfr1+6+0/Ps3srxi7zBYWVG4Ff9pi88ZHoej4TAZomJXlojA9f3HTXqFag
         DnRO/esyry5ECsEC3v8UR5Wd1QqqRCk227sXUyLwaCC7K40PQ+SVJIVZ7nMZW1Ch4YHu
         4p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985292; x=1784590092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z60C7Uy39FpdZ+RfV4gWz/iQ2OV7+l8hzFbxcfqVBdM=;
        b=pZWR+A3/a49rEyMrqG6ug0k1q96xDb85O4Z+5q2CcZtgbMSvOe3QjmlwDnX5SXWTgd
         BgzAbdHEQ5CxJvuvaFmFxXoPztopw42uZrhvcsoqg6TiIX/Py2MMV/49AniSncEAVFk9
         /9MChNOhzRBXpMjU9uCO+Q5wj+8rinLaRMlEuZfIl1MYkSr7r0oG0pijHtsv7KrtEPpe
         4xxTokiOQs3ucvi9I+oZfkL8/NPQ/r0jG20siLU6gTa6haq2IGjHfprcY5gdPzbwU063
         Cr5fPF6UTqjC4QxhlQBECRmxrMDNwGi2q9seraFEsezhBvIhsKtU7Kc85ZmkUjD7YXtM
         fQXg==
X-Gm-Message-State: AOJu0Ywx2i45RruRqF3vGEcFgXU0Xe7xycw7MYFYVAAyrlNdyRqd7owl
	dTHa2wqo1CmXg8Rx9aYlpS4Z8rP3XO0Iwu6z4LArojZzS1o9duXJdextVL4olw==
X-Gm-Gg: AfdE7cnqDdxLaW+D++JUxZU6Jw6gNLNUIIQ1UcsqEJBwFofTOyfMaS74Oy+v9TFBUkK
	dQgXq3o7epgwtVWHe0LL9aTlEzF/JC0OB3taNkmi4znX3URw+G66PaA5NpNzXOzUcWkqJXnmBxq
	e46+lw5sLSbs/qkLCanWG+HLtggDuYpoTPj6fy95FmfFkXK4w1bOVNuEyAW9AKD0l6QYpnUiR2E
	qQvAIIEhqntqn7wHbMnhlyxifJnlVl5hr8FrjINSpLrzAIBYCP7xN46pSPeGPR4D3XkKjnBDnpM
	E5B4onAWE/mVVr+9zi2Fcf1TSeE5NTSWm0nN2G+tNhmDw6Jcq3cJ4gbRYMoC9v7+4a9kfgb6jt+
	x1CZ1Z3xmPntpodoOwaXhI+uu0DHS8lI34VC1VRmr4OglyafRyTIk0nx1Bau7Al3C6+6z8MWpJG
	370BuXOvGZNV5QjHRtuSuSaG+yUiA2jdQNTRNOuEMaqpHEBEp+/iTeO9mi+SOlTYEuX3neEiJEK
	TJg8JU8fz+mv2r0C1eSB64+MxReWlyg67HWoDuGEWGDp20L89yGl3Kep2P/RSJv9A==
X-Received: by 2002:a17:903:b4f:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2ce9f1867b9mr109279595ad.40.1783985292371;
        Mon, 13 Jul 2026 16:28:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb877sm105340885ad.14.2026.07.13.16.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:28:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Michael Buesch <m@bues.ch>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: bt8xx: use devm_ioremap_resource()
Date: Mon, 13 Jul 2026 16:28:10 -0700
Message-ID: <20260713232810.1144712-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40008-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:m@bues.ch,m:linusw@kernel.org,m:brgl@kernel.org,m:nathan@kernel.org,m:ndesaulniers@google.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4888274FBAC

Replace the open-coded devm_request_mem_region() plus devm_ioremap()
sequence with a single devm_ioremap_resource() call on the BAR0 resource.
This reserves the region and maps it in one step, and maps the full BAR
length instead of a hardcoded 0x1000 (BAR0 on the bt848/878 is a 4KB
register block, so the mapped size is unchanged).

devm_ioremap_resource() returns an ERR_PTR on failure, so check with
IS_ERR() and propagate PTR_ERR(). Drop the now-redundant error message,
as devm_ioremap_resource() already logs on every failure path. Since it
can return -EPROBE_DEFER, place it early.

Built for ARM (defconfig + CONFIG_GPIO_BT8XX) with LLVM=1;
drivers/gpio/gpio-bt8xx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-bt8xx.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 324eeb77dbd5..f3a2321bc388 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -154,12 +154,18 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 			const struct pci_device_id *pci_id)
 {
 	struct bt8xxgpio *bg;
+	void __iomem *mmio;
 	int err;
 
+	mmio = devm_ioremap_resource(&dev->dev, pci_resource_n(dev, 0));
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
 	bg = devm_kzalloc(&dev->dev, sizeof(struct bt8xxgpio), GFP_KERNEL);
 	if (!bg)
 		return -ENOMEM;
 
+	bg->mmio = mmio;
 	bg->pdev = dev;
 	spin_lock_init(&bg->lock);
 
@@ -168,24 +174,9 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 		dev_err(&dev->dev, "can't enable device.\n");
 		return err;
 	}
-	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 0),
-				pci_resource_len(dev, 0),
-				"bt8xxgpio")) {
-		dev_warn(&dev->dev, "can't request iomem (0x%llx).\n",
-		       (unsigned long long)pci_resource_start(dev, 0));
-		err = -EBUSY;
-		goto err_disable;
-	}
 	pci_set_master(dev);
 	pci_set_drvdata(dev, bg);
 
-	bg->mmio = devm_ioremap(&dev->dev, pci_resource_start(dev, 0), 0x1000);
-	if (!bg->mmio) {
-		dev_err(&dev->dev, "ioremap() failed\n");
-		err = -EIO;
-		goto err_disable;
-	}
-
 	/* Disable interrupts */
 	bgwrite(0, BT848_INT_MASK);
 
-- 
2.55.0



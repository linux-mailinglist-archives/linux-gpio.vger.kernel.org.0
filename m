Return-Path: <linux-gpio+bounces-40033-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 49KpElzlVWryuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40033-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D43751DC7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=pw1yebe7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40033-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40033-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 965353032044
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ED53F928F;
	Tue, 14 Jul 2026 07:25:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5793F8882
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013950; cv=none; b=Fofiy0BuyQMPsfdmNHX9W3CnnhEM9uSoIvRkvjXge580X2uGbrbSh/Csgv68VdPX6qpkXOKTepp2JcJUYHsZj7hVuK8nLtnOuntci6e5ClugVELyo0hdKOvq+KsF7ccorguWPIJQnqEdHcE5sXKjKLFgMS1OaIeXCELFkSg6zaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013950; c=relaxed/simple;
	bh=fcJux/JxYg4XNLUBo/VBcf49DEvkgEV8p+Bhw7kODP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DS3DF139KJhZf9J6QiReBf1rjzRiyjfodNMXyQdQmNclwC138srSDURSzA7Wv6PkbwKq1qnTxcymAaFjvoLxBI8M3TJM9aE9KZ9rhfh1rWhagJg2RAT9ttMDO0YFuyN9jB6MjE6AYFjkpQ+Ko9sc1+6JoYdwQGzGvvvwNP2/EYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pw1yebe7; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso3060555e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013947; x=1784618747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F1wGjH1y3nlSuQwKjzNKfUProDkPmUKQy6fps820scg=;
        b=pw1yebe7qYGF/ddlifAahBnk14fPTAjU3bWqPrf2FjDPu88+GPKZeWWSXvGp+7yMOf
         RjUAeIbo5ZVOPT7bhbq2xcVgajqqdIoqTCApLOhoIHSsOEShXfxjCezLrRbvlfYFI5kz
         yd0apL70XdfTvWlXRleA/+79Hc0mIq8Yj7xscARepa5/iuEzC50KMQlfyVenQthG7SNY
         52PeEHwN9btdOA3MtO6bLtG0qOTnubMbiimMF5Z7qzsK73/DBj1A7Jb/F7rTvQbePQ9L
         KbCRLons9MAkbGoA/xdblu7raLaTC3KSyJtzLIchgxhIAgXsQIkuuhx//zuVmQorKrDJ
         p/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013947; x=1784618747;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1wGjH1y3nlSuQwKjzNKfUProDkPmUKQy6fps820scg=;
        b=recGbNsKXONDk536sKZNRxB1p1BsGeqpEWyqogkTjuHUMl9zUlaf7AOPuV2MLXGEwW
         5+MHpKUk2Ohw/eBH6+IwjLw0Q1RQUa84QtkOlMPjsunAwaBrZzEj23cAKOgXCaBf2f2E
         Q0wx6wMxmtqS9Zhsu2kR5sw36KDsnskeVDYZTU1v5tLm+sKsqK3Aarg2S0KA0ojmjg3i
         duUEdSzwCPNkwzkOrt1/8GEUtpr6RRInfy+u+pezrPX1GwZfyilwXmOZ7xPi5seVsT5l
         RHcVKexZcY7aki3SrIPWrbUbyrKrVfkP5ByUerLMwRLpqtu/l95GkOqOGNznV0T2xnFc
         8vqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjjJdKdR4JYQqSMplLmw5hoRmpb46ef4yIRwGFurTCkiNCxPRGL90Dw4LrHHg3lciGKzAAcKkUGMFG@vger.kernel.org
X-Gm-Message-State: AOJu0YwHSSRzxTGXc2wiVSnxt9gQQOI+kp3o9JMolYTqESu8eNLp3AEE
	8pIMbwb4nSrF2hSLMQuWO+bfSCJtgXkJgJcyuDAzHXCywDPh0fLt1WJbZZmaYN+qC8Q=
X-Gm-Gg: AfdE7ckR1av3S0qtKwDALmdxWv9AncUULTPah8sSELBPlqvfjIqvoJ0ohnHYvd1oDQ2
	AqVH0z/NLBy0efspv5IQm27AOf+tJHz4uDGssmaZZF5z+XCDqYy6BOyV9Zi23HQ+c0RVVQGpAey
	25woHEr1pLeaHsxAQ3tI7xEk0ADCRt2qr1rz3sPtQm73KHCwLOt50CvE/ntmGGUzYAtk2KCXGhK
	sb5qpYUBuNCzAT/xiWp+x6DB4ez26muGjg+iPmBae9MQF8fd4X6edz++cf2TAOIt8KCT/xERLWi
	ozAPERl8svgioc43DMsLyShubbFfxJgXlZYJ8lTdwKAzh3YTp9b1jDG31HamgcQNPTQCnJQMAuE
	qLaJq1VdoQ1OOUMJNk8bdA1niQb+Ip8L8GXowBUoTrsNgJi8oGCr1WsKf+r0K2ce1Gc1b0i7HiW
	10m8Co+oJT4X/Lff4UrG2f12D1DHCihgHp+RnTSXqDfN5vYa9raOwVtoe4k+1AUC5Je9hbWEcQ2
	6jm
X-Received: by 2002:a05:600c:5292:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-493f87e6d4cmr130857275e9.11.1784013946737;
        Tue, 14 Jul 2026 00:25:46 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a2f635dsm56625805e9.12.2026.07.14.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Michael Buesch <m@bues.ch>,
	Andy Shevchenko <andy@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Robert Richter <rric@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 19/20] gpio: Unify style of pci_device_id arrays
Date: Tue, 14 Jul 2026 09:24:20 +0200
Message-ID:  <125cf664a060ff58d11f4a21e8df182cd8f15eff.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4593; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fcJux/JxYg4XNLUBo/VBcf49DEvkgEV8p+Bhw7kODP4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeRLTjqqiHcuXSUYPrwePwXpQEZw+K47RcyZD /y0kg6v2tyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkSwAKCRCPgPtYfRL+ TrRPB/0UOVXv3y2/a06gkmI7y7obiBMVerybJNjQQFRp4sYtes2Rd8XM0wpAZSzSVmmryn0YQNH 2AihkHSZ7ps0Rgugg2+ZzksIkvpJsizLVvWWNl3brk1qaGRi+Tc84fkSEK8LXXMtqfZUA6hWWJl 49ebdw8hdYf/I9Lmq6gew92FJNa1RNGVcdJkSCHX2tlQRY/c0TynqatfTSv+GOWKwWyIek4Dfzu XH8ayMsjGRN+CM+TtZPYPFwWSMgtlLhALUDJGT9m0GyMSJmgWiaX1ph/pDJlDig+mZoMOzjtXgN pfxGVgi5ZclV4bpe8jfs1b2d7vJ88VZ3XofovrjF/bdiemnf
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:m@bues.ch,m:andy@kernel.org,m:wbg@kernel.org,m:rric@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-40033-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64D43751DC7

Update the various of_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;
 - at most one entry per line;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amd8111.c      | 2 +-
 drivers/gpio/gpio-bt8xx.c        | 2 +-
 drivers/gpio/gpio-ml-ioh.c       | 2 +-
 drivers/gpio/gpio-pci-idio-16.c  | 3 ++-
 drivers/gpio/gpio-pcie-idio-24.c | 8 +++++---
 drivers/gpio/gpio-sodaville.c    | 2 +-
 drivers/gpio/gpio-thunderx.c     | 3 +--
 7 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 8078b5d7b80c..25ad6d82f708 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -60,7 +60,7 @@
  */
 static const struct pci_device_id pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8111_SMBUS) },
-	{ },	/* terminate list */
+	{ }	/* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, pci_tbl);
 
diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 324eeb77dbd5..07bb3557a42a 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -264,7 +264,7 @@ static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT849) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT878) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT879) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, bt8xxgpio_pci_tbl);
 
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 6576e5dcb0ee..75e75a53219e 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -509,7 +509,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resu
 
 static const struct pci_device_id ioh_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x802E) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, ioh_gpio_pcidev_id);
 
diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 9d28ca8e1d6f..ddb644be92ac 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -98,7 +98,8 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 static const struct pci_device_id idio_16_pci_dev_id[] = {
-	{ PCI_DEVICE(0x494F, 0x0DC8) }, { 0 }
+	{ PCI_DEVICE(0x494F, 0x0DC8) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, idio_16_pci_dev_id);
 
diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 80c0ba0afa67..1caec692f68d 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -382,9 +382,11 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 static const struct pci_device_id idio_24_pci_dev_id[] = {
-	{ PCI_DEVICE(0x494F, 0x0FD0) }, { PCI_DEVICE(0x494F, 0x0BD0) },
-	{ PCI_DEVICE(0x494F, 0x07D0) }, { PCI_DEVICE(0x494F, 0x0FC0) },
-	{ 0 }
+	{ PCI_DEVICE(0x494F, 0x0FD0) },
+	{ PCI_DEVICE(0x494F, 0x0BD0) },
+	{ PCI_DEVICE(0x494F, 0x07D0) },
+	{ PCI_DEVICE(0x494F, 0x0FC0) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, idio_24_pci_dev_id);
 
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 9f4cd23c872f..5544fcc27228 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -239,7 +239,7 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 
 static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, sdv_gpio_pci_ids);
 
diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index be96853063ba..d7d60d6044e0 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -589,9 +589,8 @@ static void thunderx_gpio_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id thunderx_gpio_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, 0xA00A) },
-	{ 0, }	/* end of table */
+	{ }	/* end of table */
 };
-
 MODULE_DEVICE_TABLE(pci, thunderx_gpio_id_table);
 
 static struct pci_driver thunderx_gpio_driver = {
-- 
2.55.0.11.g153666a7d9bb



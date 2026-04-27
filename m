Return-Path: <linux-gpio+bounces-35632-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHVnDaHY72l/GwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35632-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 23:44:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0047ACF2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 23:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 854BB30117E4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5474639FCD2;
	Mon, 27 Apr 2026 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5n2ctel"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D3238B7BD
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 21:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326202; cv=none; b=rwFvTtT+AKP1N57/LJlE/gkhJqi9vPdhjxbf5h5fvb+E5mKxk/5zRNbH6qs02JE4PSRpI0m8ulcWJANNefSKEYcof5bl10bS01pgAPqCfG6xU0jLLN5YnxgYTwbH4JEN/DUxhzeYX+Uv+Km2ELoPvINv6pXG38t7wogHCUct/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326202; c=relaxed/simple;
	bh=UZi0qepuaqHlW8QBtGVWyJ3TFaH0AKq/gLzYrAYY678=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ntm4M7s9comIbSNKEnlP4jM4yokzHJqlWUNNsFu7JNLW/xGJ5ScIwOIRFt2BuWpX8XYhZZng7G2nmxmTfp5QKc4ZHDKmown4aQpUnZUfMI62inJD9k8h/Ls4OVG5xkfHAVjpCfObflcT1YoCBZ6LSVt3SXNjDg1k164VLAM7CYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5n2ctel; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf7683a28so7151482f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777326198; x=1777930998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zaJmxmPtYn1AnHNsGSnxP0G6t9RJZXJdc+PeFZxIeo=;
        b=r5n2ctel9ZTY3em35AZdnAaytR3nONCjv7CnRVH4WpSQobmrjOWWRzRksexRkNO8qW
         fngrYtklrOtL5/uW5lFjr0zIsSo4snWrU3f6Z1u6F64JMWt1upYtAnKEA9noHN8bJKCY
         yLOhDzOZoPQxZqiyGHer6lTssUHX3vwL0z1NwJ7uLlIpv4JRhalWDMM52Fq4nJl8s3B9
         bu6bswmE9L+3PGQsOuszmjGG5mykE1ToB5sEZtdC6ikaq+gDl/rkpRBYGdlMLyZdKbw8
         Ce46F3v9x/tvQPLggyO3XfcX5jyfMCTKpbZ9pOwVx9eKsDGV11ZfDu4RjNi+j0BwqGiD
         26Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326198; x=1777930998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zaJmxmPtYn1AnHNsGSnxP0G6t9RJZXJdc+PeFZxIeo=;
        b=jQOofb2XnTBUJn+pQhX1WbocJJr6WpvsVXokytZ4RV9/cw4BfgFMN5HKmHM4zPtOdy
         FvHG6NhNL4qoGolioeEUDpfL1V+jLF6L4Ezyte4P457macO+N3EgMskDvTiI9PEnj01Z
         TFExnM8uB/4EZAYuvbjzhU6eGMH+KvV21+GPWQAojvQtV7gLmEmhMLreZ0NSvOyo49IZ
         PYoK8m85Q2uPn3M1iJSZKe0NCOXj1rZrRyCJ7UzrhFxA4h0if4YAGeUhnZJbGP3Wb+Wq
         dHAV40IZI8GSsPM9dBHF/tCxDgT/1H/ZEDko0UBs/YFkMTZCFGb1M4hdnJ5MgHO99UvD
         jfew==
X-Forwarded-Encrypted: i=1; AFNElJ8AAFNxiCkcSbHUbsqkmCl0G0AoYQQv2CbywmlszkJyjvoZHCEac9ej3HzMPCS7ZE0uzflCJj4CqDHL@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPOITmRkousA1v+41Jwl2LcdbATJQHs/iONjRvJRr57RgmXyM
	Vd+Vcml8rzDVY2jLLsYEJKtEoyJakCrqKoVmoCkq7Knl87S0kA1m7k8A
X-Gm-Gg: AeBDieu0D4WFQeBhMfYCkwKXb6TNynpem0AdfGZWfMHydGWVIGnzP17nm4WaOtUDzdB
	6uDjSEZ0uIeaK56D5EASGN9RECM/FwOriwhKt1OhNuLncAN9tiByNcFoB2242ybr+mDA7vcVFIe
	0outTy41JVF3/YPOsUjETPtqGIPN5z8W13YaLYL403K4lb23sqcTjfS6xgJ6JnPaKzb3Qc7F8yv
	1uNVP/lwAeyJOE6UTq4f+nu3WZ+gBgOMv3G5LB5c/gb4CIl8T58YBrGtqISR017kyDB0ssQ1TIo
	7pEQPLSCEhu0MRDtSv83phdVopiRV/jVP5Wj4NBaq110g0h/HnSR0Pvg+ymnRmA3wO9peP7AFVf
	GAsFGyl0dKqlCdu1J39p/k2MYexNSBtefUCaEKwhDKWpHqIRGh3lTHqxiLHMYAqYfIcdWF1ZoFM
	TKk6TRO2eDSspaYTioEw9r75dq6ZV1cerpFvCaVOzRpSi34Jb2XFUJOQIMdWT0pXLXDYv0FDhw
X-Received: by 2002:a05:6000:3101:b0:43d:1cec:4767 with SMTP id ffacd0b85a97d-44649c98decmr874235f8f.36.1777326198308;
        Mon, 27 Apr 2026 14:43:18 -0700 (PDT)
Received: from ST.. ([102.187.193.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f2a2sm1174592f8f.10.2026.04.27.14.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:43:17 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: ixp4xx: switch to dynamic GPIO base
Date: Tue, 28 Apr 2026 00:43:10 +0300
Message-Id: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C7C0047ACF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35632-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohamedaymanworkspace@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Most IXP4xx platforms are Device Tree-based, and GPIO consumers
use phandle-based descriptors rather than legacy integer GPIO numbers.

Audit of the IXP4xx platform shows:
- No gpio_request(), gpio_get_value(), or gpio_set_value() users
  in arch/arm/mach-ixp4xx/
- No platform data using fixed GPIO numbers

This switches the gpiochip to dynamic base allocation, aligning
with modern gpiolib expectations where GPIO numbers are not globally
fixed and may be assigned dynamically.

Set gpiochip.base = -1 to allow gpiolib to assign the GPIO base
dynamically, avoiding global GPIO number space conflicts.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 drivers/gpio/gpio-ixp4xx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index f34d87869c8b..669b139cd499 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -311,12 +311,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	}
 	g->chip.gc.ngpio = 16;
 	g->chip.gc.label = "IXP4XX_GPIO_CHIP";
-	/*
-	 * TODO: when we have migrated to device tree and all GPIOs
-	 * are fetched using phandles, set this to -1 to get rid of
-	 * the fixed gpiochip base.
-	 */
-	g->chip.gc.base = 0;
+	g->chip.gc.base = -1;
 	g->chip.gc.parent = &pdev->dev;
 	g->chip.gc.owner = THIS_MODULE;
 
-- 
2.34.1



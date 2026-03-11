Return-Path: <linux-gpio+bounces-33042-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MqPGbS4sGn0mQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33042-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 01:35:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE5259D1D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 01:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 538433055563
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 00:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72E836495E;
	Wed, 11 Mar 2026 00:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAItiUIW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958163644B6
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773189291; cv=none; b=b4i2WPkDHj9bBwR3VG1wjnK5Xi5j1nxwKk/sPREMhufWYDJtMJTT0E2C5qml+8jUDbKimvKpbaKv1egMZRdcwcqbyX1Fb/I8h74DQNGyd9ob8tPzaP8DyKaNQZxktBsvQtp7frdH5ui2O/ZAY4HnXnkjqKcckmcytM9StDj3Nl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773189291; c=relaxed/simple;
	bh=B/tqumodIgkuXLcIDjCvC+BGzbRSoaLzvllGIMZTIfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FRnPs7izivCSbEa3AuaT8KTFLXmysa4Ed176CYYKpzJ/gHMqu+0welkGA0Xj6wtrSTP4pqQZ+xS9tnpSQG1l8JOFjI3S9Q4e+ypa+MFduCCw9L5w/jv+MqVWtlx46oDSW6nmfDNVetUgsqNEgYg/0TSvzUXuPxNwEwFj2/O2VBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAItiUIW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso7436616a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 17:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773189290; x=1773794090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YSc98IcO6Pk8M+lzdgpoqKTHGos+KZeMXffp4drDJs=;
        b=iAItiUIWFQgw8znFg8qrBVT10D4LqM75DMGoXScjIeeYHsJFdjgKXP8tGLkOHj0PBW
         Mbry8oajIw8MV9/skM+YgvDf63yK8/7IL6UlMVld7aRXy3g5+CPX/oBspE33lRe+74hW
         UH6YsFeFvtTTJgnS1ria04b/tRMhd4Vws1zVN4ljLX/goDpo4wABwB9/dYRCY3ndoK/8
         cy/yWvi4TKqL87ETU5FYPivHN8+6Q2ydw0mdPok3g0WR6lKVydOXiFr3og+5D5mdVsWM
         GFNoddLDpkpMCO5A6e8Pk1Cwn3XbOwDHc6zzdo7+dniVm/9iEQ0jGt5DdUwqA+8zmEO6
         hMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189290; x=1773794090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YSc98IcO6Pk8M+lzdgpoqKTHGos+KZeMXffp4drDJs=;
        b=ABlUB7aue5CsAbMMKqQpLbt/XDs/pkcih4A+AOTqOlIY8ma6oDqxZDh15D9Efv/caE
         vO77N1gLrwznIsHlCXqtc9MxOpxg6wXx1TeKHUwt2lA1gN7efVEEixIzIV/96fmIBeQF
         5XvUpYi8wa1rZasgWT9EguVLJOWqsdwH8fo4bB33QRLWxvIHtJ6WmtFJnErejQG98fmd
         EHLKqnA31U3iV2CYCpQ3+mtluRzm08H68zd7JXx2JVzl8TCgsrq6QnjuFL0LMc0YbmI/
         M9BcwJTEppSVWBUKfYKWj3Ku9NcRsCetKMXhLrZmAomn3XERmYzMhjsYQ1hCKhaj/Fu3
         qcLA==
X-Gm-Message-State: AOJu0Yxbe+cvtofIHgAwB8W8HWDFWkLRfduhlb7ZHYTnHitTMNnkDpGR
	jTp9Ubltw2veyTcQHVwpIMXM/ilCIpBV8pN7EQnWs3jFYY2XU9FHaG6NNz/Foe2P
X-Gm-Gg: ATEYQzx3plW80supMRD9DZvjkghhTzsKL7Fei3sYa8bR3pRkgyrZgrlrp954oKCORmM
	VCfMGj7CCeIpILe4WnSqWHAh2Gipj7hM6avJmRNT6dhtjJV0dbEhkLUcpuGb4yXjgrLkU2gNgkx
	nlsH5TMx5iTSAn5lFp189uCwmIWBlR5t+WYR3HvOeJaNIh8ofKoh1NSJOVuymZZ3O12Vc21JFfw
	U7EtUhN0Ynurcl9LdNCao84TwnIpmHW2FDxWMRCNoYurnAl+gIKBK0DVdddjW/sbHTbz4moSpVh
	8BK1e5rvdxapuBkQVJZokN354Fa/nRMVdqlXkgXX5ONkTJIZnuz4FwXh7VaiibKV2Hh5wcQ5G/0
	HsPOhEgJpVI46Vi5LwsbipleSAkY9Dd8TKocJvXih7DRUWyFAlrDv/ef4pen5j6WuIs6pYQQ9RJ
	UkJvGXJyt9PS4p3jrZiaaQZjoVyds3FvpscKXCvTFmRHvNQ1jN/qlIXw==
X-Received: by 2002:a17:90b:5111:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35a011d0b9cmr793085a91.7.1773189289448;
        Tue, 10 Mar 2026 17:34:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf0e48dsm330349a12.1.2026.03.10.17.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:34:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] gpio: bcm-kona: remove kcalloc
Date: Tue, 10 Mar 2026 17:34:31 -0700
Message-ID: <20260311003431.31881-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F0DE5259D1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33042-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Simplify allocation by using a flexible array member.

Use __counted_by for extra runtime analysis.

Shuffle some code as __counted_by requires the counting variable to be
set right after allocation.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-bcm-kona.c | 37 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 208b71c59d58..b1d32d590cf8 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -58,15 +58,6 @@
 #define LOCK_CODE				0xffffffff
 #define UNLOCK_CODE				0x00000000
 
-struct bcm_kona_gpio {
-	void __iomem *reg_base;
-	int num_bank;
-	raw_spinlock_t lock;
-	struct gpio_chip gpio_chip;
-	struct irq_domain *irq_domain;
-	struct bcm_kona_gpio_bank *banks;
-};
-
 struct bcm_kona_gpio_bank {
 	int id;
 	int irq;
@@ -90,6 +81,15 @@ struct bcm_kona_gpio_bank {
 	struct bcm_kona_gpio *kona_gpio;
 };
 
+struct bcm_kona_gpio {
+	void __iomem *reg_base;
+	int num_bank;
+	raw_spinlock_t lock;
+	struct gpio_chip gpio_chip;
+	struct irq_domain *irq_domain;
+	struct bcm_kona_gpio_bank banks[] __counted_by(num_bank);
+};
+
 static inline void bcm_kona_gpio_write_lock_regs(void __iomem *reg_base,
 						int bank_id, u32 lockcode)
 {
@@ -584,12 +584,6 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 
-	kona_gpio = devm_kzalloc(dev, sizeof(*kona_gpio), GFP_KERNEL);
-	if (!kona_gpio)
-		return -ENOMEM;
-
-	kona_gpio->gpio_chip = template_chip;
-	chip = &kona_gpio->gpio_chip;
 	ret = platform_irq_count(pdev);
 	if (!ret) {
 		dev_err(dev, "Couldn't determine # GPIO banks\n");
@@ -597,6 +591,11 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 	} else if (ret < 0) {
 		return dev_err_probe(dev, ret, "Couldn't determine GPIO banks\n");
 	}
+
+	kona_gpio = devm_kzalloc(dev, struct_size(kona_gpio, banks, ret), GFP_KERNEL);
+	if (!kona_gpio)
+		return -ENOMEM;
+
 	kona_gpio->num_bank = ret;
 
 	if (kona_gpio->num_bank > GPIO_MAX_BANK_NUM) {
@@ -604,13 +603,9 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 			GPIO_MAX_BANK_NUM);
 		return -ENXIO;
 	}
-	kona_gpio->banks = devm_kcalloc(dev,
-					kona_gpio->num_bank,
-					sizeof(*kona_gpio->banks),
-					GFP_KERNEL);
-	if (!kona_gpio->banks)
-		return -ENOMEM;
 
+	kona_gpio->gpio_chip = template_chip;
+	chip = &kona_gpio->gpio_chip;
 	chip->parent = dev;
 	chip->ngpio = kona_gpio->num_bank * GPIO_PER_BANK;
 
-- 
2.53.0



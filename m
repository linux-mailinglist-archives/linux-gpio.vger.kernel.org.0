Return-Path: <linux-gpio+bounces-15240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E0A257A9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86075166FF2
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 11:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DFE20126B;
	Mon,  3 Feb 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w8HRxYe2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C4201249
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580493; cv=none; b=FEuAPLAKWcjwffMlC8gMvTBVB8BTA+24o7xS/Rl9saUhPPi8RT2HgcrzVEx3qrnCFjqgt2aXFQvMqEtlvTx/cWQd8f/cJzJkXn2lALK4hII7x0G/Y2u1VRw+6NH7Z/EvchahVXWnRqoCuPJMFRMsjZSESXfryC5TL+2W82SMEvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580493; c=relaxed/simple;
	bh=YdZ1F2UIY2BKSTH/78CeGePqnoOFXkPUh4G0+xOW8I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkylQa80rHWbmF8Q1uR7OcslsePGEi0mDRvlNg0H+8N1aFWBhredfIkAh9mUo5lpFJV7WDBMlTlzM0qt4tzqRw8125SSO8wZwgA5Rqch73nUSytpOeL3ddfVxBlkr+7SWzwCZIPOJoKasBY/+ivDW9t82cDvBeEUnRil5nw3H3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w8HRxYe2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso3542881f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738580489; x=1739185289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cw22mpAU6PFV8UovQOXfDj306Sn0bhW1MdW6JnCSix8=;
        b=w8HRxYe24ch3I7IIFKjLd/PrqMMPVcbflsiYPAwG1alizGMJ/1q1X13LWO43k+wH6a
         M+PDBWKHa1mthMyLDWq9o7moSVlSUYevttc2CSDdL7cCtyh8ecdkqygwPn1fVmvwcarL
         FkK0qZ2qJIMHTtIeBAyCvFWweAu5qjeA+4XanWQKVJ9KfjWdzakkmXqaoV+s6sXz+3PA
         BJncAWN9InY6p7logdzYs571M5DWiMUWQkSZytyOjgnzL2i+7ZDm8hoGM1Q6IDXkgfXw
         yZF+/S0ZD5cNH0uBQSGiZ7dcZ/5Pq9RyuSYwmluBccy68qigHZCr0+mK3BO4wnnbA/30
         ul8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580489; x=1739185289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw22mpAU6PFV8UovQOXfDj306Sn0bhW1MdW6JnCSix8=;
        b=rf4U8nQxaV8jXL4blkFFBROAF//2jEd7h0gZ+fZEeSBK5bEl/1VJGkwykexSGGypF1
         LolE6v38DpwZKi9C7PuSWfkL03o770Al4irAigpl8ABpyh3L70CC37az8Sx0263UZpe3
         yWGCZ4OOcePmXJzkJNB8RqP6c8WZHFPNIp1DKADj1lHZyVDidzdr0leE5+XXFB/A2BMe
         mx5d7EH8oaSABxBbSjorU9M60qeLJ38bt+jWpO8csmhlsjItBYpxhiU4hA4Nkli9VpwY
         kf8yOPoUXkug/kuPkH9YApvMLYbOgDTJWVUafaSUk06kZM2/gaQ/9XCHrRvtxS42esPS
         LSIQ==
X-Gm-Message-State: AOJu0YxJvmjj9Vb2HNZj5Hzepr1qFTYQBrYE0CKPUnBA/oQGL4GJH8mA
	fcpKqYy5QrtPLx+n82mBbzpa/HaLu3Aq2KDuUYUJyudRDgCpnJ9/rlJaY45FGls=
X-Gm-Gg: ASbGncuTx84imYCH+eEJkDpwC0kGM1mHpZVRjCpw6BWaMJuKc1uIbfFXkqDgcr+hiKd
	uW8fDJtvpKKkBszEs5b7B9d6cGROKSFxrLv/h2NBdFNe04oxhoPQ1Ljc9Uqi6RrsfNzOOVV1iEZ
	d7LkKW5yr58Y6ERJBYf0Q53mKTJefddVOkXEaEvqv2XhKzx228utk1cSmecxukyRPSFsmSI20SM
	jc0Er6TjY2cwk7YDAxdRmiXOk5AhX89EWcBeyBDGgz5+CaB2kFsAC9GPCNI/R8dnSJjTCE1LV+h
	9LX2Ngddyup0DA==
X-Google-Smtp-Source: AGHT+IHnarVZWqY3vGCVzchvGea+YM7uiTfqLn9N97rzsoYlda8HMAkD7/6sIilZA3qM5d1MQ2HkQA==
X-Received: by 2002:a5d:6c65:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38c5cd0efe3mr13978813f8f.11.1738580489130;
        Mon, 03 Feb 2025 03:01:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec78esm12245894f8f.3.2025.02.03.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:01:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sim: lock hog configfs items if present
Date: Mon,  3 Feb 2025 12:01:23 +0100
Message-ID: <20250203110123.87701-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Depending on the user config, the leaf entry may be the hog directory,
not line. Check it and lock the correct item.

Fixes: 8bd76b3d3f3a ("gpio: sim: lock up configfs that an instantiated device depends on")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index a086087ada17..b843682b47e9 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1028,6 +1028,7 @@ gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
 	struct configfs_subsystem *subsys = dev->group.cg_subsys;
 	struct gpio_sim_bank *bank;
 	struct gpio_sim_line *line;
+	struct config_item *item;
 
 	/*
 	 * The device only needs to depend on leaf line entries. This is
@@ -1036,12 +1037,14 @@ gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
 	 */
 	list_for_each_entry(bank, &dev->bank_list, siblings) {
 		list_for_each_entry(line, &bank->line_list, siblings) {
+			item = line->hog ? &line->hog->item
+					 : &line->group.cg_item;
+
 			if (lock)
-				WARN_ON(configfs_depend_item_unlocked(
-						subsys, &line->group.cg_item));
+				WARN_ON(configfs_depend_item_unlocked(subsys,
+								      item));
 			else
-				configfs_undepend_item_unlocked(
-						&line->group.cg_item);
+				configfs_undepend_item_unlocked(item);
 		}
 	}
 }
-- 
2.45.2



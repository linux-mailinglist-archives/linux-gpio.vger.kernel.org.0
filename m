Return-Path: <linux-gpio+bounces-21968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48703AE32B8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 00:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72B1D3AF479
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Jun 2025 22:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAA11EFFBB;
	Sun, 22 Jun 2025 22:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b="Yujk1BfB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414EC18B47D
	for <linux-gpio@vger.kernel.org>; Sun, 22 Jun 2025 22:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750629771; cv=none; b=bmRJatMkMnY1SeOMy+OVKM2qy59nqMVeAi62jBqFl7MrFZZy+uFH//eXuiRVQyDyIeAQn8mdEOea8lDiKffg930zn7kKIR3F10QDzp1GWYTDpdkW1rOtIadorOmVK84PT7POZgn7T2XE0O5QnemDgW/fe+XKkwTAXROKW5VZk9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750629771; c=relaxed/simple;
	bh=RdeSytjFriCiVDqBfoNbrlxAhjFgOopRBXO/wo/M1mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TlyLZswA918I1SMRKVff7N+YrdowfxCl6bC+BPQYHY5h6Ek4V6ruhPD22vEFun2vdKSLIpfPY0tGLfCgfhHcNGTMC6rK5AIwQzPVZAGHmyZanu3xDjCIgLoRrXeuouNGEK+gg7O0LcXZMP706FVoNf8zDJqQB3LDKnfxja3x/UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com; spf=pass smtp.mailfrom=mandelbit.com; dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b=Yujk1BfB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so22823085e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Jun 2025 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1750629767; x=1751234567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt+OHlPcCexBjO5A/XepCZN5Wsx0OmQnDmQwiH7XPK4=;
        b=Yujk1BfBXh1Hx4egKv1XE6NncR75xuF0DbXQQna4aq2FI6/VIGIm57JlKf7T5r3u0u
         qjur+7hteEcJDKkM7Kj/oQW/z9UvjZfVKGDKESuPsQBLCikN97im5P+eYZsSxkNSoNTU
         qaNJQGe68V+9eyqYqqBP8vVBT1bl3NA/lFq47pYSAxRRJ5jTWcBg5pBYjMYT4qMysPiO
         s+IP2g0s3pcBgqnLe5cCy0FPfZ0dhtPlFUFa9nhGHUMiWdFGjSJ9JITSw+qn8YBYMUCv
         j7SeU4gfpJw0soCKbVLdfm7BS18phyhZ33+hYc2sTqy4fVXGHragJp7/p9iHN/OHCtzg
         IzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750629767; x=1751234567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bt+OHlPcCexBjO5A/XepCZN5Wsx0OmQnDmQwiH7XPK4=;
        b=RcMLZ25BwSwMSBp0bcgjFY7pG6nzwFZIuShnnt88Q3A0R7MYTZ6uirYX0UriSGX0X2
         7fc6J4amH7k5oR455cU2vJG09nIsh/gEB+1O/I7kTyfCciYkeWV/QNpYQmZru2Odlm8Z
         1z4bHy+evekO9swdYfaBfm5HpYDHoGJYO2Ljt1XDESgFnZQ5I7oO0E+N+eW01in+UdUH
         Ama9oECwMDMsPZA/9Zbw1rt3KcsO0Wh7hyAO6j9sbG1nokxFQ/Kpf34SZ9jInVIrV9Xf
         9Nrw5leBVNcppWC0Gq8tT0uD4/v3ExXvwLoextm+UwejbX8zHG10Gc0Evuc18sEkU/ni
         epxw==
X-Gm-Message-State: AOJu0YwpVWkHotCKPyIcDk5SzF3bHYrkjJ72NsE5iQBXF8s/TUbGTtD4
	fJDk7HR0pTgkoqYgecOAje28LdNoJjZDs86RaMdJT4ABhZtzja9SWn2xAf9DAmbexpgVmRoC6Vn
	9J8mw
X-Gm-Gg: ASbGncs5REid9m9ry9tspNmwo00lCMKpS+O0Yh+w4NGRVOX5X55L00sTG/2OygYcZKd
	bRolqJN6YiVFX87fr+lEIKxxdRBuUv25JgQVPUbbvUEuZmtS5ExDrKpDlCOug6eJQuypWCSF4oU
	elMiXC+RuNZRLjLSkxA02G/ZFWefiRGBCjFfcvvflrtlVqmhJI3JhcXMnBVg5bBhE8aFm29iDed
	/H1LZM23XkVbaotxjwuhDNK0xXvvPSNtaRZO5X0oz8dGnu2Vmm8puZTirdNgCUCpKxDE3zpuuPS
	7A3mqGcQLqDtI2GXeeGxoXw8ZfgMgWfsxSY79ZwEDs7s1hA8lMwLc16LfUswaaUqmsdzLsLeXER
	5NeuM7btqpro=
X-Google-Smtp-Source: AGHT+IG0a+UKdfnjGI/Td/xknJ1CyetEZyT4JlqjGWXzeF8pdWoW25Vrb2Ox6m/940MfdEHPG+11yw==
X-Received: by 2002:a05:600c:8b85:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-45365e6dec5mr96663895e9.15.1750629766977;
        Sun, 22 Jun 2025 15:02:46 -0700 (PDT)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:c4de:19cc:e05:213f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b4bbsm122759295e9.15.2025.06.22.15.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 15:02:46 -0700 (PDT)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH] gpiolib-sysfs: fix use-after-free in error path
Date: Mon, 23 Jun 2025 00:02:21 +0200
Message-ID: <20250622220221.28025-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When invoking device_create_with_groups() its return
value is stored in `data->cdev_base`.
However, in case of faiure, `data` is first
freed and then derefernced in order to return
`data->cdev_base`.

Fix the use-after-free by extracting the error
code before free'ing `data`.

This issue was reported by Coverity Scan.

Addresses-Coverity-ID: 1644512 ("Memory - illegal accesses  (USE_AFTER_FREE)")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/gpio/gpiolib-sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 956411fc467a..c4c21e25c682 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -741,6 +741,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	struct gpiodev_data *data;
 	struct gpio_chip *chip;
 	struct device *parent;
+	int err;
 
 	/*
 	 * Many systems add gpio chips for SOC support very early,
@@ -781,8 +782,9 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 						    GPIOCHIP_NAME "%d",
 						    chip->base);
 	if (IS_ERR(data->cdev_base)) {
+		err = PTR_ERR(data->cdev_base);
 		kfree(data);
-		return PTR_ERR(data->cdev_base);
+		return err;
 	}
 
 	return 0;
-- 
2.49.0



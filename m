Return-Path: <linux-gpio+bounces-3515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD985BDDB
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 14:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DA7C1C23E8F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 13:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AA86A8C6;
	Tue, 20 Feb 2024 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PRJWnwET"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA26A35C
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708437282; cv=none; b=EuHIBD7kpMuGxP8NsGXpm43gr9v5VouEaXesx/u+Vpwrr9VDHadfhWeJtEeIV0Vw/i/p9lPTggif+PgVkWAksGeBcAvrMJvCBD8jqeRR2tMAR0yVd+6fLODWApUWTNPitT4O+YKqy7goAE8rnmSby5oDM7yV2fYtp379EvV6af4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708437282; c=relaxed/simple;
	bh=vhKYdP7Qcdl4LkhlN58vv/A0U9JCapkwita7zLO8rvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SAMcJfJMnobhT+QuV8dpkPI0ZPvF3CFtf+bOMWy3gIZE1eh/xsO8T8tJ9+SKDfQ1WSGunoBOLcL0e14gSut8GNdsXS+W3gZmQWEuau9pilh+VnlUyn8KWXEHXg/ww/chvGFl64YDfYP6QsBJeMXbEY2zGp6Djz1QePoHvgJ+8hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PRJWnwET; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d23a5a7c18so23061611fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708437279; x=1709042079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4z6QC+M8rLwpgXw1ZcOkKOzv+dqQjnxMBuKDEQ++J9U=;
        b=PRJWnwETGQZJyL2+nPorLqBGIhODkpHMtQ1vBaERAP+q5ze9DWGyOLVtsKjE53O/V2
         ux5jXdoFWqZW6inTJQvsWS3Yifrb7vVsx4KQ5Qoja93wK1o1me3DpE6rj30zHUQECVEN
         ik/8UwoYai/Srj/JaltXF9kdPEI7BY7j5AlEQQOw2YK65quf4JmSYDh1ZBrNCB1KTJXl
         zljJOWvLcJLfzBFL8PBxgrhVpJmFPFumFWeIySAem1aprXi6ZphefFCgNj5rSEOWV14I
         k+Mc2KsRuyRbcnwUkLSCdrMGz8qaJQjX+zyTyYi8QVLXWqQe/R95/MmaX33gIKqbMkZv
         nO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708437279; x=1709042079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4z6QC+M8rLwpgXw1ZcOkKOzv+dqQjnxMBuKDEQ++J9U=;
        b=HTeIfYrhME1oZz+TYdND1100t5K+YykhkRvHDRrwSb3PAxMmSPfw0QLhWGOkazCPTZ
         xWBwoHwKzVmIYkjeEX5rnvW8UbOiIYTMhkoZEScYvk7c4bn2MSYJYa9xP1vyUj9yI4nn
         dRg34R/6J9HDG+RqYGeXUnzwTAoVxxBlH1HZCaEFEduw1xeVJYvSmeBpe0mUZZ6/NrV2
         ecCmm+Cz9Ya3g5M2LpCIKS4TjpWzfiwPbIby06Irkr6qGrR4DXWUVgSLinWHds9QwZMt
         lyoegUJII5iYKsvDYD6ev584QFeRGUQI1o3glxt4rkBSRnesdZ9s3ClJ8Ay+pXXe6x4n
         o2Sw==
X-Gm-Message-State: AOJu0YyYwd5Blr/WE+gWSCIqnQLap2FEmOnBfdvqrlJVfy/wdKoX0W6z
	HGHjk2OZLe0is6+vC8Xu0XhDlyTfnK0cJXxWrqYtileSClOuV4ldx2SQK0ufo7o=
X-Google-Smtp-Source: AGHT+IFcXwbv+TR2oQ4jVr9yzlD8x+FeeM4U1hY3A5l2IhXR9knwZN9vOF2kpx1wsm58C/m/wtq+EQ==
X-Received: by 2002:a2e:908c:0:b0:2d2:3b6a:b90a with SMTP id l12-20020a2e908c000000b002d23b6ab90amr3499040ljg.51.1708437279163;
        Tue, 20 Feb 2024 05:54:39 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c6ce:c6a0:43ac:8f8e])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c280400b0040fe308ff25sm14441818wmb.24.2024.02.20.05.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 05:54:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sim: delimit the fwnode name with a ":" when generating labels
Date: Tue, 20 Feb 2024 14:54:31 +0100
Message-Id: <20240220135431.22910-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Typically, whenever a human-readable name is created for objects using
a software node, its name is delimited with ":" as dashes are often used
in other parts of the name. Make gpio-sim use the same pattern. This
results in better looking default names:

  gpio-sim.0:node0
  gpio-sim.0:node1
  gpio-sim.1:node0

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index c4106e37e6db..1f3dd95dd6da 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -420,7 +420,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 
 	ret = fwnode_property_read_string(swnode, "gpio-sim,label", &label);
 	if (ret) {
-		label = devm_kasprintf(dev, GFP_KERNEL, "%s-%pfwP",
+		label = devm_kasprintf(dev, GFP_KERNEL, "%s:%pfwP",
 				       dev_name(dev), swnode);
 		if (!label)
 			return -ENOMEM;
@@ -833,7 +833,7 @@ static int gpio_sim_add_hogs(struct gpio_sim_device *dev)
 							  GFP_KERNEL);
 			else
 				hog->chip_label = kasprintf(GFP_KERNEL,
-							"gpio-sim.%u-%pfwP",
+							"gpio-sim.%u:%pfwP",
 							dev->id,
 							bank->swnode);
 			if (!hog->chip_label) {
-- 
2.40.1



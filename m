Return-Path: <linux-gpio+bounces-944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3806802EB7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83382280FBD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AB41B298;
	Mon,  4 Dec 2023 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2XtL2Cig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF9CF2
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:23 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c09d62b70so11320565e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682522; x=1702287322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4oN2yBzcOb1+JXtPZKrl0tpOl2eK1zlq9JfJmTld4=;
        b=2XtL2CigwSKmszxqX7TLCepiNZc1A/RDwZbLaBV1rSI2CGaZUoZhUGD+2dzckphruv
         TyB3s640VALGZqTnYbnBFPIdMfMjtcu2E5mgdCnC35ynuyTHQ+JShEN3s6PE6ehJwpPf
         4IL5ZveCjhFnXxTt4EcW66bGeQUOuukcBI9Ylwn+tZ25T31QPU/4ewd7WgPV0/2rZocm
         dCKOtYtRLJelTx5sp3E/n86WX5xPy+O7AaBEnKA/T+4T0v9RFj4mSPxYQWoXFP8nGh4M
         aMAdD/pjUL/VbC/5Vge7jvy29X9TxI2HX8nS5V82VD5G+ad4Lz2mplrJkdebWyP3UrIm
         1lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682522; x=1702287322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQ4oN2yBzcOb1+JXtPZKrl0tpOl2eK1zlq9JfJmTld4=;
        b=q86tMWO3UeovJ9n0UbAyE90FG0SuEHpR6wwTgNzLUzBLFnBrvq+yGocYJUcdXcW8wF
         NNd9Dp7X7e78oiwrVCGp7GbPjhRZSoeduN2oOjdrW/dVcO7gv1FotEJDD2ZmNe7j0AuQ
         BBapcjx7IPn6srofg/gLpJwoOGVkwxbuVwctF3BzAkdjSVs7Xh+ZLQ3gv47aKX5d8xtm
         URpNVuM9mP5Il2X466X4vOrsUKmFpi1hBTx8txx94AnFqUPxCZln4Qhcn6oBNgm1ccTq
         fXL/uxDh/1vE8+Q8c1qSpHSShyeuD0d0lrsZnN2nYeKx2OCJroHPO8sylcC4quQc4215
         B+ug==
X-Gm-Message-State: AOJu0YzIFyYWPCgRbdyOTxrKfcaHayx1p0zVCnSO2fv6KdgQVMKVHox/
	rp9fmvTnlKddcJYp69eBwdPeJw==
X-Google-Smtp-Source: AGHT+IHCuQnItV2lKs0M1bnxQ5NKnbh9Y4kTm+Isghykg16TLUiy7F8Pk77hB8yvqqxMFcrKeo7XlQ==
X-Received: by 2002:a05:600c:3c8f:b0:40b:5e21:c5ab with SMTP id bg15-20020a05600c3c8f00b0040b5e21c5abmr1618979wmb.121.1701682521977;
        Mon, 04 Dec 2023 01:35:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 08/10] pinctrl: sppctl: use gpiochip_dup_line_label()
Date: Mon,  4 Dec 2023 10:35:07 +0100
Message-Id: <20231204093509.19225-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231204093509.19225-1-brgl@bgdev.pl>
References: <20231204093509.19225-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the new gpiochip_dup_line_label() helper to safely retrieve the
descriptor label.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/sunplus/sppctl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index bb5ef391dbe4..ae156f779a16 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -4,6 +4,7 @@
  * Copyright (C) Sunplus Tech / Tibbo Tech.
  */
 
+#include <linux/cleanup.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -500,16 +501,15 @@ static int sppctl_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 static void sppctl_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	const char *label;
 	int i;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		label = gpiochip_is_requested(chip, i);
-		if (!label)
-			label = "";
+		char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
+		if (IS_ERR(label))
+			continue;
 
 		seq_printf(s, " gpio-%03d (%-16.16s | %-16.16s)", i + chip->base,
-			   chip->names[i], label);
+			   chip->names[i], label ?: "");
 		seq_printf(s, " %c", sppctl_gpio_get_direction(chip, i) ? 'I' : 'O');
 		seq_printf(s, ":%d", sppctl_gpio_get(chip, i));
 		seq_printf(s, " %s", sppctl_first_get(chip, i) ? "gpi" : "mux");
-- 
2.40.1



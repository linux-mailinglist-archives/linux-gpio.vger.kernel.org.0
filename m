Return-Path: <linux-gpio+bounces-677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E09AE7FD93B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D446283008
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3351A3158E;
	Wed, 29 Nov 2023 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eJOMdLkg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC527D50
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so625682f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267867; x=1701872667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cffjJvUFWsxdgp9qJiLVkij+XoF+TZsz38c1WQZlyho=;
        b=eJOMdLkgwF0Ty0Q4LK/MdwHWMSA87R7mOY3U5811JahdHvufQqSwpJ8TNXUc5rDStt
         ZlMWvdvXc/JWTa08y2sGchYB27GD/iN2/cM6SHLMCEhX32dY3dKOPY+kmyRARL1G/uqm
         l+yBMVhECL061xOFwcHGUTA7NGP2bkB+tNrWMbibeQVa2Ltbqvnj89/v4rVTmsbnZotQ
         Qf+X7aLjpYJfo1imRq1VbKaUGooldHovIsHYxDYXg+dduDvV3iKU5QXZpAkbSQJDjtqL
         8RRjcQdNQNFjE6Hk7+8vo7GEUHdGhMCbGLks1V7hp6DL5FgTOPDgRmU7h863QZzm5I8X
         mR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267867; x=1701872667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cffjJvUFWsxdgp9qJiLVkij+XoF+TZsz38c1WQZlyho=;
        b=a/lIPH2PP7FxiQlABwDaP6K7F7Tkcrpb+mZy/+zQcNixmulU7phTPuJrGVFefBSHBT
         mqV+VaXM3zCqBnzI40GhIs+hrqXvSHlSalT9MQie7oKDwli3J99q3v24Nbi7zIXoNXXR
         XxvY1R8ESezQO9zwksnu3CD2fQSOLnn+HbTjUYNFSVmi4OnoMc7a5t1Xt1cg4wNrpcV9
         1qOPB1Mo6gxeaM9BFreHEk66fjQDQQCCfYlHoaNHtlRNKgh+upMvjh8TL+cGF0O7M0M/
         mgRt2ntYk5ITTgXJAMljX5cUR0iB7LfPzAooSGV5hxmu2jes2EuxKsdCGqk2p4yDpqD/
         ulLA==
X-Gm-Message-State: AOJu0YxzlBjxiICxi2MIRctzesjVfWyQDDNekJxY0tpE4J3OqFMy9e11
	gp1VTtfw7Dk9Kg3isKbQrsFjUA==
X-Google-Smtp-Source: AGHT+IHjpWoseIDs6Br+Qwb1chr8KZN2ND/DdsGAdWy/f8A9EoGm5jKOkW2ftsdvCiW48Ean+8Q3zQ==
X-Received: by 2002:a5d:64e3:0:b0:333:47e:4cf4 with SMTP id g3-20020a5d64e3000000b00333047e4cf4mr7806142wri.15.1701267867269;
        Wed, 29 Nov 2023 06:24:27 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:26 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 05/10] pinctrl: abx500: use gpiochip_dup_line_label()
Date: Wed, 29 Nov 2023 15:24:06 +0100
Message-Id: <20231129142411.76863-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129142411.76863-1-brgl@bgdev.pl>
References: <20231129142411.76863-1-brgl@bgdev.pl>
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
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index d3c32d809bac..80e3ac333136 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -6,7 +6,9 @@
  *
  * Driver allows to use AxB5xx unused pins to be used as GPIO
  */
+
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
@@ -453,12 +455,11 @@ static void abx500_gpio_dbg_show_one(struct seq_file *s,
 				     unsigned offset, unsigned gpio)
 {
 	struct abx500_pinctrl *pct = pinctrl_dev_get_drvdata(pctldev);
-	const char *label = gpiochip_is_requested(chip, offset - 1);
 	u8 gpio_offset = offset - 1;
 	int mode = -1;
 	bool is_out;
 	bool pd;
-	int ret;
+	int ret = -ENOMEM;
 
 	const char *modes[] = {
 		[ABX500_DEFAULT]	= "default",
@@ -474,6 +475,10 @@ static void abx500_gpio_dbg_show_one(struct seq_file *s,
 		[ABX500_GPIO_PULL_UP]		= "pull up",
 	};
 
+	char *label __free(kfree) = gpiochip_dup_line_label(chip, offset - 1);
+	if (IS_ERR(label))
+		goto out;
+
 	ret = abx500_gpio_get_bit(chip, AB8500_GPIO_DIR1_REG,
 			gpio_offset, &is_out);
 	if (ret < 0)
-- 
2.40.1



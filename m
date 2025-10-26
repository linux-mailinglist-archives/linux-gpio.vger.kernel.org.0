Return-Path: <linux-gpio+bounces-27610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61115C0A6CC
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 12:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7BF443498F3
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 11:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2E6238C23;
	Sun, 26 Oct 2025 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPiFeNti"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4261A1BC58
	for <linux-gpio@vger.kernel.org>; Sun, 26 Oct 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761479090; cv=none; b=GDW1/cCJt8QT9TNAVpd19f5Wt4G9t587FYRuxDsHe7sxrhxcJQiWHTOyC5Oc+e/4Hps/cSYZMJr4xuhcwB8noz0/8f9JEyRQi5o/Cl9dkmIInqwzABxeDFm67Crd62wV+HpQdoCjQZgCU4dNMx4/198IORM52bC8IXjwa1ql42Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761479090; c=relaxed/simple;
	bh=QSzyaYQYOlY/Fh0HrjVoPCv8LLLkAAYkkHgdG5KLGLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fvfPDCjUQwm755RuZ+24Jem32ycy9/2nHeu602Q1MQyNpsEQsbYCOQeg1JAp6PYfPDOl9QBpkIPMGWlTLrHwxQnr2k4fnpCr7gkj9BOcMLoLxD5sMY80XYliZJpcdjJl4x7a6u4UpPBt+6lLMHhovqwFiMf+X2D9bv8SJ+zADVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPiFeNti; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47710acf715so627845e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 26 Oct 2025 04:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761479086; x=1762083886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTs+2WA2dXIobsZBWKKKP2LpgP+B0kR7P+R3v1lLYLk=;
        b=UPiFeNtiUutDW35ojo8XECoxPJWFJbYH36YDlXfWboRbMfVm4jpPicyQxmacR13A1Q
         ABFoVz7Rugm6X5iTcAw+UQVLZjBj0BRdEmZcWw7/ORPgebymPrGDh+QzSA7RVrJxY16A
         /TWj6MbyTnqWGYotLn55m+koNNfwtMcUV1MMXpqtTB1TXD62ALyOYe1Qpux+ZU+qcxJG
         /aY9buUy5n8MvnA/bHKdLWs1LQ4deoPi9FmQh2L3z4DmF4OPKG3/u1/XBsb5vH6jaMXZ
         agaf3wRtpkELrbI4RcB/iWprTLuJcJ6LQ3YS+mfGD77eSCsx+qwrcU6Pk3ykDDOWjS2h
         PW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761479086; x=1762083886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTs+2WA2dXIobsZBWKKKP2LpgP+B0kR7P+R3v1lLYLk=;
        b=nfWOhqtEFA56LkY2HkExY3+5nCIUsO1R+zsncsePT6ET6n8S+3AroNTLaMYiEQ2rCu
         tURn8pIDi6Wl01rN7yB2zz55PTQUWicdbZss59G2ZitgjT5Y+fcdYlW8anYWqg9h33jv
         O33YHb5w7Xb5Wg0PtgLrwMo7gPC3MtDcfR8eJ/EOcsiP9Nn7tzjVDGoosMKbP8k5FySL
         axHzhixzoFAeXRhwwXhdYlWwpibOXAlq/loYwmCuK/9D2sQsrkV+GDTl7KrFVShFWc1T
         t4wd6VqYBdql/sJIUcwPmcLexZfUXkWQVdNlL83UQad9+WQaKax0zulkpPpUjeilZ1y/
         ZxOw==
X-Gm-Message-State: AOJu0YzOM3MPwHAviBcE7J+I4/mY/HXqvB+td/4uxinjmJS0ocEAv/bU
	xlzKtqDnjCRd9+vBupig6Eon+tQY5R1qXhi98Kc0lnzx/1pW0+eW3FZ7
X-Gm-Gg: ASbGncu4/nBFKDq+Qm7yk1+iP0SSfAjrzxhrRwINOF6yBlLIZ11ADpH5W+DyjyH97vx
	G+uV2leewQFrOUwhfWencbsfrKWPo7dEKRFwm8ho8OwRlxBupmkfNTKnfhcXZeCQAPgYV2PUSC0
	G+3ZCrwfdZrrcJxLqr5rqPtgm4FH+seq5YN5mSGt/MtI3bHKiEZsbZlP19KYcME1GsWr7VUos36
	qYOWd5EEjJHVr0WH/L8Gd1jmxd2KqtZSdc9LhqV0Ws9UL1Yjc9TBHaztgDAswk5arMBu4DB+Ngj
	GtTbvPGb/xr64CzWTNjM5SA3x7P7JshM5rjj3gM8r+7u6ONnnGJukxwy0u25SlhTwMLTSszkLW6
	LaRWRX782HB345K1FYiZYrPxhm5dVhIaHd5HGwVTnwIooFtlmcax40UvPvRL6q9sQV3/Rz0K0i3
	qfNb2dnT6UQBafLfGcN3ALGHXCMLs=
X-Google-Smtp-Source: AGHT+IHsUPCv0yYA/lmzLCKcqn20aOcA4RQAApNwtY3rRlQ7LIcTN5Wnns3ahwh+m6FhXo34ywpCCA==
X-Received: by 2002:a05:600c:800f:b0:471:700:f281 with SMTP id 5b1f17b1804b1-471179041b6mr252101815e9.25.1761479086309;
        Sun, 26 Oct 2025 04:44:46 -0700 (PDT)
Received: from localhost.localdomain ([39.46.217.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb55asm8361469f8f.17.2025.10.26.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 04:44:45 -0700 (PDT)
From: Ali Tariq <alitariq45892@gmail.com>
To: kernel@esmil.dk,
	hal.feng@starfivetech.com,
	linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alitariq45892@gmail.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v3] pinctrl: starfive: use dynamic GPIO base allocation
Date: Sun, 26 Oct 2025 11:42:40 +0000
Message-ID: <20251026114241.53248-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JH7110 pinctrl driver currently sets a static GPIO base number from
platform data:

  sfp->gc.base = info->gc_base;

Static base assignment is deprecated and results in the following warning:

  gpio gpiochip0: Static allocation of GPIO base is deprecated,
  use dynamic allocation.

Set `sfp->gc.base = -1` to let the GPIO core dynamically allocate
the base number. This removes the warning and aligns the driver
with current GPIO guidelines.

Since the GPIO base is now allocated dynamically, remove `gc_base` field in
`struct jh7110_pinctrl_soc_info` and the associated `JH7110_SYS_GC_BASE`
and `JH7110_AON_GC_BASE` constants as they are no longer used anywhere
in the driver.

Tested on VisionFive 2 (JH7110 SoC).

Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
Changes in v3:
- Add Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
- Clarify commit message wording for readability

Changes in v2:
- Remove unused gc_base field from struct jh7110_pinctrl_soc_info
- Drop unused JH7110_SYS_GC_BASE and JH7110_AON_GC_BASE defines
- Remove .gc_base assignments from jh7110_sys_pinctrl_info and jh7110_aon_pinctrl_info
- No functional change otherwise
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c | 2 --
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 2 --
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c     | 2 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h     | 1 -
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
index cf42e204cbf0..3433b3c91692 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
@@ -29,7 +29,6 @@
 #include "pinctrl-starfive-jh7110.h"
 
 #define JH7110_AON_NGPIO		4
-#define JH7110_AON_GC_BASE		64
 
 #define JH7110_AON_REGS_NUM		37
 
@@ -138,7 +137,6 @@ static const struct jh7110_pinctrl_soc_info jh7110_aon_pinctrl_info = {
 	.pins		= jh7110_aon_pins,
 	.npins		= ARRAY_SIZE(jh7110_aon_pins),
 	.ngpios		= JH7110_AON_NGPIO,
-	.gc_base	= JH7110_AON_GC_BASE,
 	.dout_reg_base	= JH7110_AON_DOUT,
 	.dout_mask	= GENMASK(3, 0),
 	.doen_reg_base	= JH7110_AON_DOEN,
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
index 03c2ad808d61..9b67063a0b0b 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
@@ -29,7 +29,6 @@
 #include "pinctrl-starfive-jh7110.h"
 
 #define JH7110_SYS_NGPIO		64
-#define JH7110_SYS_GC_BASE		0
 
 #define JH7110_SYS_REGS_NUM		174
 
@@ -410,7 +409,6 @@ static const struct jh7110_pinctrl_soc_info jh7110_sys_pinctrl_info = {
 	.pins		= jh7110_sys_pins,
 	.npins		= ARRAY_SIZE(jh7110_sys_pins),
 	.ngpios		= JH7110_SYS_NGPIO,
-	.gc_base	= JH7110_SYS_GC_BASE,
 	.dout_reg_base	= JH7110_SYS_DOUT,
 	.dout_mask	= GENMASK(6, 0),
 	.doen_reg_base	= JH7110_SYS_DOEN,
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 05e3af75b09f..eb5cf8c067d1 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -938,7 +938,7 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 	sfp->gc.set = jh7110_gpio_set;
 	sfp->gc.set_config = jh7110_gpio_set_config;
 	sfp->gc.add_pin_ranges = jh7110_gpio_add_pin_ranges;
-	sfp->gc.base = info->gc_base;
+	sfp->gc.base = -1;
 	sfp->gc.ngpio = info->ngpios;
 
 	jh7110_irq_chip.name = sfp->gc.label;
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
index a33d0d4e1382..2da2d6858008 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
@@ -38,7 +38,6 @@ struct jh7110_pinctrl_soc_info {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	unsigned int ngpios;
-	unsigned int gc_base;
 
 	/* gpio dout/doen/din/gpioinput register */
 	unsigned int dout_reg_base;
-- 
2.43.0



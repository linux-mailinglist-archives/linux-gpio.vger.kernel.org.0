Return-Path: <linux-gpio+bounces-24686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 336EDB2E991
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 194D95C6B72
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC371DE8AE;
	Thu, 21 Aug 2025 00:45:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60941DC994;
	Thu, 21 Aug 2025 00:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737145; cv=none; b=A2PBi3TGUPBSG/wpd2qjv/eEXvQJvSg+bewCl1QBMMpM+w39RKX+dTLdJ63bX+K7GkWgPGqkYk4rasVynWEGdu1iu1M7wyp65AkN8aDQoaoWSHxTWEXSUSAgs5Df4YuBIDSl2kEyfhzphoPq0bJwDDpp7SdxvxqXkrBGc4yEFag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737145; c=relaxed/simple;
	bh=RWJbcsaeOZX5+LDa+6pKeYlpDQCedi13K2STgXejWDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOkohAh/wzsGmDJe6Wd2H3sCykoC3uJaeBYo7CgLTxAcmQ09AUcDqD9nE8Y7oHeb/sbWPKBE+IdRg7HvhWpGUs9RlfEZMUCdk/zDt7PCK72OoDO8GLJccCucNQ0nhhArgKfwsErng/iWbP3Yx+qGZfHdmi6Z6Qn6XmOSjsAq5bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFC8C1F37;
	Wed, 20 Aug 2025 17:45:34 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2996A3F63F;
	Wed, 20 Aug 2025 17:45:41 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
Date: Thu, 21 Aug 2025 01:42:24 +0100
Message-ID: <20250821004232.8134-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After keeping the pinctrl IP mostly register compatible for almost a
decade, in 2021 Allwinner introduced some changes to the register
layout, which made us use a flag called SUNXI_PINCTRL_NEW_REG_LAYOUT.
Now with their latest SoC (A733), Allwinner changed the pinctrl IP
again, so "NEW" isn't really a fitting name anymore.

Rename the symbol to SUNXI_PINCTRL_NCAT2_REG_LAYOUT, with "NCAT2" being
a name often used in vendor source code to signify this "new" generation
of SoCs.

Just a rename of the symbol, no actual code changes.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
index 8efe35b77af4d..37a60e5d1163b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
@@ -821,7 +821,7 @@ static const struct sunxi_pinctrl_desc d1_pinctrl_data = {
 static int d1_pinctrl_probe(struct platform_device *pdev)
 {
 	return sunxi_pinctrl_init_with_flags(pdev, &d1_pinctrl_data,
-					     SUNXI_PINCTRL_NEW_REG_LAYOUT);
+					     SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id d1_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 69cd2b4ebd7d7..86a12bce0e335 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -36,7 +36,7 @@ static int a523_r_pinctrl_probe(struct platform_device *pdev)
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
 					   a523_r_irq_bank_muxes,
 					   &a523_r_pinctrl_data,
-					   SUNXI_PINCTRL_NEW_REG_LAYOUT);
+					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 7d2308c37d29e..0f703cacfe5e3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -35,7 +35,7 @@ static int a523_pinctrl_probe(struct platform_device *pdev)
 	return sunxi_pinctrl_dt_table_init(pdev, a523_nr_bank_pins,
 					   a523_irq_bank_muxes,
 					   &a523_pinctrl_data,
-					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
+					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT |
 					   SUNXI_PINCTRL_ELEVEN_BANKS);
 }
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0fb057a07dccb..0a5acbd978da9 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1521,7 +1521,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->dev = &pdev->dev;
 	pctl->desc = desc;
 	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;
-	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
+	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index ad26e4de16a85..fb17fae2dab69 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -88,7 +88,7 @@
 #define SUN4I_FUNC_IRQ		6
 
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
-#define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
+#define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
 
-- 
2.46.3



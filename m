Return-Path: <linux-gpio+bounces-16737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C47A2A48C94
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 00:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 413C53AFFFE
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 23:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEFF27FE98;
	Thu, 27 Feb 2025 23:17:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA98274242;
	Thu, 27 Feb 2025 23:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740698238; cv=none; b=m4GuHDgf00a7EzkrLTHnhNwk9Q7WzirpCFP54MibKbQvxWq6nbRX2r2P05/Py5DurvmlF8JJO72KzfEUloSX+CvKcpgUaNWWAMMdoux0B+AgueigNV+eUwDg31Q+PDNFUgfTV/J6efqHwGA2jelScxg95Lmz2yES5RsIZlaq/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740698238; c=relaxed/simple;
	bh=TU2ZP4t+Uq7Fmh8tzKn24GWn1vrhbUYuK8zCg5GvDGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ul9S9nVjSAmvUDBQSgoeVoB5RwAO8AwUqJLSS/DbSrGGOKaZY8qoK0EbSQ3p4OFYhheJy3PUakUMApfCoigHMyd7EAECoVxEq0NuylCr7gw0Ce99DUt/qLb0r46baHW6CZUuxjTVPzNQTh7JJ1ObPUocZ8qfpOv4MZECzF7B3w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D2E5153B;
	Thu, 27 Feb 2025 15:17:30 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 717D33F673;
	Thu, 27 Feb 2025 15:17:13 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] pinctrl: sunxi: refactor pinctrl variants into flags
Date: Thu, 27 Feb 2025 23:14:40 +0000
Message-ID: <20250227231447.20161-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250227231447.20161-1-andre.przywara@arm.com>
References: <20250227231447.20161-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some Allwinner SoCs we have one pinctrl driver caring for multiple
very similar chips, and are tagging certain pins with a variant bitmask.
The Allwinner D1 introduced a slightly extended register layout, and we
were abusing this variant mask to convey this bit of information into
the common code part.
Now there will be more pinctrl device properties to consider (has PortF
voltage switch, for instance), so shoehorning this into the variant
bitmask will not fly anymore.

Refactor the "variant" field into a more generic "flags" field. It turns
out that we don't need the variant bits to be unique across all SoCs,
but only among those SoCs that share one driver (table), of which there
are at most three variants at the moment. So the actual variant field can
be limited to say 8 bits, and the other bits in the flag register can be
re-purposed to hold other information, like this extended register
layout.
As a side effect we can move the variant definition into the per-SoC
pinctrl driver file, which makes it more obvious that this is just a
private definition, only relevant for this particular table.
This also changes the artificial sun20i-d1 "variant" into the actual
flag bit that we are after.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c |  6 ++----
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c |  8 ++++++--
 drivers/pinctrl/sunxi/pinctrl-sun5i.c     |  8 ++++++--
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c |  8 +++++---
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c |  7 +++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.c     | 10 +++++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h     | 23 +++++++----------------
 7 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
index 8e2aab542fcfe..8efe35b77af4d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
@@ -820,15 +820,13 @@ static const struct sunxi_pinctrl_desc d1_pinctrl_data = {
 
 static int d1_pinctrl_probe(struct platform_device *pdev)
 {
-	unsigned long variant = (unsigned long)of_device_get_match_data(&pdev->dev);
-
-	return sunxi_pinctrl_init_with_variant(pdev, &d1_pinctrl_data, variant);
+	return sunxi_pinctrl_init_with_flags(pdev, &d1_pinctrl_data,
+					     SUNXI_PINCTRL_NEW_REG_LAYOUT);
 }
 
 static const struct of_device_id d1_pinctrl_match[] = {
 	{
 		.compatible = "allwinner,sun20i-d1-pinctrl",
-		.data = (void *)PINCTRL_SUN20I_D1
 	},
 	{}
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c b/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
index fa47fe36ee5bc..b2e82bf927b3c 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
@@ -17,6 +17,10 @@
 
 #include "pinctrl-sunxi.h"
 
+#define PINCTRL_SUN4I_A10	BIT(0)
+#define PINCTRL_SUN7I_A20	BIT(1)
+#define PINCTRL_SUN8I_R40	BIT(2)
+
 static const struct sunxi_desc_pin sun4i_a10_pins[] = {
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -1295,8 +1299,8 @@ static int sun4i_a10_pinctrl_probe(struct platform_device *pdev)
 {
 	unsigned long variant = (unsigned long)of_device_get_match_data(&pdev->dev);
 
-	return sunxi_pinctrl_init_with_variant(pdev, &sun4i_a10_pinctrl_data,
-					       variant);
+	return sunxi_pinctrl_init_with_flags(pdev, &sun4i_a10_pinctrl_data,
+					     variant);
 }
 
 static const struct of_device_id sun4i_a10_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun5i.c b/drivers/pinctrl/sunxi/pinctrl-sun5i.c
index 06ecb121c8274..6eef314c93775 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun5i.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun5i.c
@@ -16,6 +16,10 @@
 
 #include "pinctrl-sunxi.h"
 
+#define PINCTRL_SUN5I_A10S	BIT(0)
+#define PINCTRL_SUN5I_A13	BIT(1)
+#define PINCTRL_SUN5I_GR8	BIT(2)
+
 static const struct sunxi_desc_pin sun5i_pins[] = {
 	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(A, 0),
 		  PINCTRL_SUN5I_A10S,
@@ -719,8 +723,8 @@ static int sun5i_pinctrl_probe(struct platform_device *pdev)
 {
 	unsigned long variant = (unsigned long)of_device_get_match_data(&pdev->dev);
 
-	return sunxi_pinctrl_init_with_variant(pdev, &sun5i_pinctrl_data,
-					       variant);
+	return sunxi_pinctrl_init_with_flags(pdev, &sun5i_pinctrl_data,
+					     variant);
 }
 
 static const struct of_device_id sun5i_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
index 82ac064931df3..8d8c92ce41cff 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
@@ -17,6 +17,9 @@
 
 #include "pinctrl-sunxi.h"
 
+#define PINCTRL_SUN6I_A31	BIT(0)
+#define PINCTRL_SUN6I_A31S	BIT(1)
+
 static const struct sunxi_desc_pin sun6i_a31_pins[] = {
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -972,9 +975,8 @@ static int sun6i_a31_pinctrl_probe(struct platform_device *pdev)
 	unsigned long variant =
 		(unsigned long)of_device_get_match_data(&pdev->dev);
 
-	return sunxi_pinctrl_init_with_variant(pdev,
-					       &sun6i_a31_pinctrl_data,
-					       variant);
+	return sunxi_pinctrl_init_with_flags(pdev, &sun6i_a31_pinctrl_data,
+					     variant);
 }
 
 static const struct of_device_id sun6i_a31_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
index 49c9a0b6a0eb4..696d7dd8d87ba 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
@@ -22,6 +22,9 @@
 
 #include "pinctrl-sunxi.h"
 
+#define PINCTRL_SUN8I_V3	BIT(0)
+#define PINCTRL_SUN8I_V3S	BIT(1)
+
 static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
 	/* Hole */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
@@ -552,8 +555,8 @@ static int sun8i_v3s_pinctrl_probe(struct platform_device *pdev)
 {
 	unsigned long variant = (unsigned long)of_device_get_match_data(&pdev->dev);
 
-	return sunxi_pinctrl_init_with_variant(pdev, &sun8i_v3s_pinctrl_data,
-					       variant);
+	return sunxi_pinctrl_init_with_flags(pdev, &sun8i_v3s_pinctrl_data,
+					     variant);
 }
 
 static const struct of_device_id sun8i_v3s_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bde67ee31417f..ae281a3c2ed34 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1472,9 +1472,9 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 	return 0;
 }
 
-int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
-				    const struct sunxi_pinctrl_desc *desc,
-				    unsigned long variant)
+int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
+				  const struct sunxi_pinctrl_desc *desc,
+				  unsigned long flags)
 {
 	struct device_node *node = pdev->dev.of_node;
 	struct pinctrl_desc *pctrl_desc;
@@ -1497,8 +1497,8 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 
 	pctl->dev = &pdev->dev;
 	pctl->desc = desc;
-	pctl->variant = variant;
-	if (pctl->variant >= PINCTRL_SUN20I_D1) {
+	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;
+	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index a87a2f944d609..8e2eca45b57f8 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -82,18 +82,9 @@
 #define SUN4I_FUNC_INPUT	0
 #define SUN4I_FUNC_IRQ		6
 
-#define PINCTRL_SUN5I_A10S	BIT(1)
-#define PINCTRL_SUN5I_A13	BIT(2)
-#define PINCTRL_SUN5I_GR8	BIT(3)
-#define PINCTRL_SUN6I_A31	BIT(4)
-#define PINCTRL_SUN6I_A31S	BIT(5)
-#define PINCTRL_SUN4I_A10	BIT(6)
-#define PINCTRL_SUN7I_A20	BIT(7)
-#define PINCTRL_SUN8I_R40	BIT(8)
-#define PINCTRL_SUN8I_V3	BIT(9)
-#define PINCTRL_SUN8I_V3S	BIT(10)
-/* Variants below here have an updated register layout. */
-#define PINCTRL_SUN20I_D1	BIT(11)
+#define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
+#define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
+#define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 
 #define PIO_POW_MOD_SEL_REG	0x340
 #define PIO_POW_MOD_CTL_REG	0x344
@@ -299,11 +290,11 @@ static inline u32 sunxi_grp_config_reg(u16 pin)
 	return GRP_CFG_REG + bank * 0x4;
 }
 
-int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
-				    const struct sunxi_pinctrl_desc *desc,
-				    unsigned long variant);
+int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
+				  const struct sunxi_pinctrl_desc *desc,
+				  unsigned long flags);
 
 #define sunxi_pinctrl_init(_dev, _desc) \
-	sunxi_pinctrl_init_with_variant(_dev, _desc, 0)
+	sunxi_pinctrl_init_with_flags(_dev, _desc, 0)
 
 #endif /* __PINCTRL_SUNXI_H */
-- 
2.46.3



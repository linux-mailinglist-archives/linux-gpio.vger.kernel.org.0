Return-Path: <linux-gpio+bounces-24687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57BB2E999
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0955C684A9C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECE21EBFE0;
	Thu, 21 Aug 2025 00:45:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE57F1B423B;
	Thu, 21 Aug 2025 00:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737148; cv=none; b=KDDk5uRiByVQANn1sAzSUatrrZh91cWqBw5Cw6r2kO9sikH74rJNcGSJHgd+X+KHsSbgPQNsdT0fMBAN9AMgXQdSodSYsdaSgfdZHZZboI3c1i5SoQ5noP8dCpsXeF5UeWajGGkuw42k/+DPCjaCBpclNUaG/ergLrg8lvYaEXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737148; c=relaxed/simple;
	bh=wxF/6Rkpb3pvDeo7XWheFsiK5l3eVk5Hji6O6zRbCCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZ/K7aQAaqWMtQdjUqNpbW0Mb3fvYPtiGcuFaDOkHRKbaw8g+wJGV+nl15d1ry152Qpb0dTqP9WnGqAdn/XIGvu9VsQHQJS2eTirYJkq1XFEJq0Ax+I4x9Kwh+3dV/eGx6kkRmPYSvcQktPzib2val+6kQCiPTUUBFl28z15UnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 282002437;
	Wed, 20 Aug 2025 17:45:37 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681993F63F;
	Wed, 20 Aug 2025 17:45:43 -0700 (PDT)
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
Subject: [RFC PATCH 2/9] pinctrl: sunxi: pass down flags to pinctrl routines
Date: Thu, 21 Aug 2025 01:42:25 +0100
Message-ID: <20250821004232.8134-3-andre.przywara@arm.com>
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

Recent changes in the Allwinner pinctrl/GPIO IP made us add some quirks,
which the new SoCs (A523 family) need to use. We now have a comfortable
"flags" field on the per-SoC setup side, to tag those quirks we need, but
were translating those flag bits into specific fields for runtime use, in
the init routine.
Now the newest Allwinner GPIO IP adds even more quirks and exceptions,
some of a boolean nature.
To avoid inventing various new boolean flags for the runtime struct
sunxi_pinctrl, let's just directly pass on the flags variable used by the
setup code, so runtime can check for those various quirk bits directly.

Rename the "variant" member to "flags", and directly copy the value from
the setup code into there. Move the variant masking from the init
routine to the functions which actually use the "variant" value.

This mostly paves the way for the new A733 IP generation, which needs
more quirks to be checked at runtime.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0a5acbd978da9..a5e390c7ba0ba 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -157,6 +157,7 @@ sunxi_pinctrl_desc_find_function_by_name(struct sunxi_pinctrl *pctl,
 					 const char *pin_name,
 					 const char *func_name)
 {
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 	int i;
 
 	for (i = 0; i < pctl->desc->npins; i++) {
@@ -168,7 +169,7 @@ sunxi_pinctrl_desc_find_function_by_name(struct sunxi_pinctrl *pctl,
 			while (func->name) {
 				if (!strcmp(func->name, func_name) &&
 					(!func->variant ||
-					func->variant & pctl->variant))
+					func->variant & variant))
 					return func;
 
 				func++;
@@ -1288,6 +1289,7 @@ static int sunxi_pinctrl_add_function(struct sunxi_pinctrl *pctl,
 static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 {
 	struct sunxi_pinctrl *pctl = platform_get_drvdata(pdev);
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 	void *ptr;
 	int i;
 
@@ -1312,7 +1314,7 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_pinctrl_group *group = pctl->groups + pctl->ngroups;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		group->name = pin->pin.name;
@@ -1339,11 +1341,11 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_desc_function *func;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		for (func = pin->functions; func->name; func++) {
-			if (func->variant && !(pctl->variant & func->variant))
+			if (func->variant && !(variant & func->variant))
 				continue;
 
 			/* Create interrupt mapping while we're at it */
@@ -1371,14 +1373,14 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_desc_function *func;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		for (func = pin->functions; func->name; func++) {
 			struct sunxi_pinctrl_function *func_item;
 			const char **func_grp;
 
-			if (func->variant && !(pctl->variant & func->variant))
+			if (func->variant && !(variant & func->variant))
 				continue;
 
 			func_item = sunxi_pinctrl_find_function_by_name(pctl,
@@ -1520,7 +1522,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 
 	pctl->dev = &pdev->dev;
 	pctl->desc = desc;
-	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;
+	pctl->flags = flags;
 	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
@@ -1556,8 +1558,9 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 
 	for (i = 0, pin_idx = 0; i < pctl->desc->npins; i++) {
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
+		unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		pins[pin_idx++] = pin->pin;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index fb17fae2dab69..77a08ccde095a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -174,7 +174,7 @@ struct sunxi_pinctrl {
 	unsigned			*irq_array;
 	raw_spinlock_t			lock;
 	struct pinctrl_dev		*pctl_dev;
-	unsigned long			variant;
+	unsigned long			flags;
 	u32				bank_mem_size;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
-- 
2.46.3



Return-Path: <linux-gpio+bounces-6474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B98C9F41
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 17:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 069D31F21B97
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 15:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DC1137746;
	Mon, 20 May 2024 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xduTDc1x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA1136E2E
	for <linux-gpio@vger.kernel.org>; Mon, 20 May 2024 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217477; cv=none; b=u85QP+O3o6WTAWizrBkXoPXtOQVfNzowgkU+K8vjsdWMqGISsI+SP2vXyEMrgdbIaW1GMtrlX58PVkgcF5c3UQTOexvp9i44JIc/fh8jXOQPq8YhuTO25vJlk3UgG9VFJmbgu684bQx51AsArpIzvcb9Tvr1ztslRO/jUJM2FnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217477; c=relaxed/simple;
	bh=rZJaNLBVEf+aK2rDOIXSWaoAcXGZCiPjotRHJZW2cj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uTjCo6bTaK+n9fPk6CZcJdx4GJFbRiqgUVJ4q878I97dF9oCCp6gI0/fGPwwUeH5wklSuUQTFerE9aHlFj6tuuNcZOyVop+WZMeP1SqKPSChqwhhBqbDp5ymXLHZRojKmc6IzFN0tNsUUwgAz/it2/3v+luxfUQvwOlusWPn1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xduTDc1x; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linus.walleij@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716217474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M5zviEf5A12KnXDSQllyVorIBh12Tl6r4o0V0p+XKTg=;
	b=xduTDc1xFMCmLLPJTZC6FSmby3/D/cKU1Fr3zpI1koYGiES/CQsult1CS8u6WgO6odOyqX
	g0i5amQ0sxSbUeqDZNLCzwtYPLeydD6MuUp2FF0Un7jMKYBThmk/D/6MEKrs6X56HCG/W+
	3Q4ULtmQEt3q8JPlcqVftRTcTJJrnoU=
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: sai.krishna.potthuri@amd.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: andy.shevchenko@gmail.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: sean.anderson@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org
Cc: Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 2/2] pinctrl: zynqmp: Support muxing individual pins
Date: Mon, 20 May 2024 11:04:24 -0400
Message-Id: <20240520150424.2531458-3-sean.anderson@linux.dev>
In-Reply-To: <20240520150424.2531458-1-sean.anderson@linux.dev>
References: <20240520150424.2531458-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

While muxing groups of pins at once can be convenient for large
interfaces, it can also be rigid. This is because the group is set to
all pins which support a particular function, even though not all pins
may be used. For example, the sdhci0 function may be used with a 8-bit
eMMC, 4-bit SD card, or even a 1-bit SD card. In these cases, the extra
pins may be repurposed for other uses, but this is not currently
allowed.

There is not too much point in pin "groups" when there are not actual
pin groups at the hardware level. The pins can all be muxed
individually, so there's no point in adding artificial groups on top.
Just mux the pins like the hardware allows.

To this effect, add a new group for each pin which can be muxed. These
groups are part of each function the pin can be muxed to. We treat group
selectors beyond the number of groups as "pin" groups. To set this up,
we initialize groups before functions, and then create a bitmap of used
pins for each function. These used pins are appended to the function's
list of groups.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- Use __set_bit instead of set_bit
- Use size_add when calculating the number of kcalloc members
- Expand commit message with some more motivation

 drivers/pinctrl/pinctrl-zynqmp.c | 61 ++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 5c46b7d7ebcb..7cc1e43fb07c 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
 
+#include <linux/bitmap.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -97,7 +98,7 @@ static int zynqmp_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	return pctrl->ngroups;
+	return pctrl->ngroups + zynqmp_desc.npins;
 }
 
 static const char *zynqmp_pctrl_get_group_name(struct pinctrl_dev *pctldev,
@@ -105,7 +106,10 @@ static const char *zynqmp_pctrl_get_group_name(struct pinctrl_dev *pctldev,
 {
 	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	return pctrl->groups[selector].name;
+	if (selector < pctrl->ngroups)
+		return pctrl->groups[selector].name;
+
+	return zynqmp_desc.pins[selector - pctrl->ngroups].name;
 }
 
 static int zynqmp_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
@@ -115,8 +119,13 @@ static int zynqmp_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
 {
 	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	*pins = pctrl->groups[selector].pins;
-	*npins = pctrl->groups[selector].npins;
+	if (selector < pctrl->ngroups) {
+		*pins = pctrl->groups[selector].pins;
+		*npins = pctrl->groups[selector].npins;
+	} else {
+		*pins = &zynqmp_desc.pins[selector - pctrl->ngroups].number;
+		*npins = 1;
+	}
 
 	return 0;
 }
@@ -560,10 +569,12 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 {
 	u16 resp[NUM_GROUPS_PER_RESP] = {0};
 	const char **fgroups;
-	int ret, index, i;
+	int ret, index, i, pin;
+	unsigned int npins;
+	unsigned long *used_pins __free(bitmap) =
+		bitmap_zalloc(zynqmp_desc.npins, GFP_KERNEL);
 
-	fgroups = devm_kcalloc(dev, func->ngroups, sizeof(*fgroups), GFP_KERNEL);
-	if (!fgroups)
+	if (!used_pins)
 		return -ENOMEM;
 
 	for (index = 0; index < func->ngroups; index += NUM_GROUPS_PER_RESP) {
@@ -578,23 +589,37 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 			if (resp[i] == RESERVED_GROUP)
 				continue;
 
-			fgroups[index + i] = devm_kasprintf(dev, GFP_KERNEL,
-							    "%s_%d_grp",
-							    func->name,
-							    index + i);
-			if (!fgroups[index + i])
-				return -ENOMEM;
-
 			groups[resp[i]].name = devm_kasprintf(dev, GFP_KERNEL,
 							      "%s_%d_grp",
 							      func->name,
 							      index + i);
 			if (!groups[resp[i]].name)
 				return -ENOMEM;
+
+			for (pin = 0; pin < groups[resp[i]].npins; pin++)
+				__set_bit(groups[resp[i]].pins[pin], used_pins);
 		}
 	}
 done:
+	npins = bitmap_weight(used_pins, zynqmp_desc.npins);
+	fgroups = devm_kcalloc(dev, size_add(func->ngroups, npins),
+			       sizeof(*fgroups), GFP_KERNEL);
+	if (!fgroups)
+		return -ENOMEM;
+
+	for (i = 0; i < func->ngroups; i++) {
+		fgroups[i] = devm_kasprintf(dev, GFP_KERNEL, "%s_%d_grp",
+					    func->name, i);
+		if (!fgroups[i])
+			return -ENOMEM;
+	}
+
+	pin = 0;
+	for_each_set_bit(pin, used_pins, zynqmp_desc.npins)
+		fgroups[i++] = zynqmp_desc.pins[pin].name;
+
 	func->groups = fgroups;
+	func->ngroups += npins;
 
 	return 0;
 }
@@ -772,6 +797,10 @@ static int zynqmp_pinctrl_prepare_function_info(struct device *dev,
 	if (!groups)
 		return -ENOMEM;
 
+	ret = zynqmp_pinctrl_prepare_group_pins(dev, groups, pctrl->ngroups);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < pctrl->nfuncs; i++) {
 		ret = zynqmp_pinctrl_prepare_func_groups(dev, i, &funcs[i],
 							 groups);
@@ -779,10 +808,6 @@ static int zynqmp_pinctrl_prepare_function_info(struct device *dev,
 			return ret;
 	}
 
-	ret = zynqmp_pinctrl_prepare_group_pins(dev, groups, pctrl->ngroups);
-	if (ret)
-		return ret;
-
 	pctrl->funcs = funcs;
 	pctrl->groups = groups;
 
-- 
2.35.1.1320.gc452695387.dirty



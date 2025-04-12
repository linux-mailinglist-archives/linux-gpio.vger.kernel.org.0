Return-Path: <linux-gpio+bounces-18729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 567EFA86B6B
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 08:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36A081B828E2
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 06:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F541993B1;
	Sat, 12 Apr 2025 06:58:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054318A6DF;
	Sat, 12 Apr 2025 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744441124; cv=none; b=OnXG6V5d8yWOMba6Fam97hruVeOWUrH3zBMd+Crbk01HT31TbUlE+GRD3eGmDU9lS9A5WEs+uIh0i8wc8PJTAPr+7cIdYTl2vpnn4ViUAldPSgtL0xhSeO4XdD66llVUHidxfGVfGkV0b4CT3mm+vbJFCLO2iNqWzjQnyfr7qxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744441124; c=relaxed/simple;
	bh=n7GbuJLw/44DNPKz3PzwbXAURd9IBpfJrhXcy+GGj2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cV4hI/JFC8NR601eeox/mMZjGhl2n1R7DqhcAvh8DzetAf2Jly15PTmGrOqmrYQSBHWPcGw5VBe9k/A5VAVlLzaxLyDOh2ygaMd+DJbg3GormZNqjNcehVPSY35q98xZJkcVbAWebCOe+lMG8LBhzLw4/hVJDZGlzJPLs1Kao6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 45F0434375E;
	Sat, 12 Apr 2025 06:58:37 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 14:58:11 +0800
Subject: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
In-Reply-To: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=n7GbuJLw/44DNPKz3PzwbXAURd9IBpfJrhXcy+GGj2Y=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+g8SiIjiGMLHykiyn4luij0gAqj6VC5tcOEr4
 HHe+VWgPUKJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/oPEl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277YSMD/4g8g5GHPkKUntp3e
 OUiaaGAEMBegOZVUQnYe7W9IivHp7oo0NXJYfVxHm0C0ozc0zivlgL4JDwWNfOUCiPPbO0+4k3d
 PELS5KD+K7QOO6PM1Q855Ifh+V/3afxJhgC0xGuIG7vwqvtW0obb2Ud6UB0gc9pZBgFs7VUaTli
 D0ixzy3PY+KB+vE6zReYoqBa+0Ebkq33N2+06+fYEB90Y1mmMJb6GGCcUyb7Kv6TKe6ufr+Td9e
 L412SlKPdD7HEKC71bc7tDrYgQ58j//vFhWnV7QblT0fzJ+7Ta/1GEoFdG/mIsfeCZhxkbfKOWD
 f7M5R3tYJpqZP5hxkq4M2N53YOEWLfjGTeICFk9vSpNzFBpmyYlDn4iYygP1PxX/ncCUrtqAxlh
 LOPwerOKBWu3s4kcuS8CIzzGarqJO2Jw6usEVGXEfuUJ2Rvlod8rK3rQT44917gJUkGLJHbuM5e
 gZcEaI6CQTY+EnYQS1xZOORTAfFc8FM5+XrJuM8riWO+GP5IexwmtGre1Ymn0kmXQfYEhSSNscy
 5mklqCbq/YoE99pOf6NrUo/+iExnV/iPs3Qvq0KGb2+1XTNMjfbtyvvXxnxR0jrD7zDwY0tO33w
 K/S7bz1FW4bT49hINK8lhbHn557gewzTFpEIiHxMy7xw+mbUrJp1yuaK1nxj9zKUmBTA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
the driver instead of relying on bootloader or default hardware
settings to enable it.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
 
 #include <linux/bits.h>
+#include <linux/clk.h>
 #include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct spacemit_pinctrl *pctrl;
+	struct clk *func_clk, *bus_clk;
 	const struct spacemit_pinctrl_data *pctrl_data;
 	int ret;
 
@@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctrl->regs))
 		return PTR_ERR(pctrl->regs);
 
+	func_clk = devm_clk_get_optional_enabled(dev, "func");
+	if (IS_ERR(func_clk))
+		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
+
+	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
+
 	pctrl->pdesc.name = dev_name(dev);
 	pctrl->pdesc.pins = pctrl_data->pins;
 	pctrl->pdesc.npins = pctrl_data->npins;

-- 
2.49.0



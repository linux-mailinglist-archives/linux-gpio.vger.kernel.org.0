Return-Path: <linux-gpio+bounces-18904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F492A8AC8B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 02:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEECC3BDFEF
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 00:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CCF1714AE;
	Wed, 16 Apr 2025 00:16:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548E5158538;
	Wed, 16 Apr 2025 00:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762566; cv=none; b=HRjJ3lTTZBRKBk4Zqh4JvZuvdzWCFCVB45EYPA9BsGce3nUkqQgQac6SRE6Awykl6WhjRi4atjAwr7HQDp5sWNo6figJxxmcRFXcjjrr51B4aWP0Vpu6J0uqKU19vkxoyHMBWojJhyoNBdj1eU9O8ciY71AIhD1QP5TCcWYsWSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762566; c=relaxed/simple;
	bh=hgCxsX2xeB7ssokjMjVuQzAe/R10W2qnEsmZP030Ffw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4VMm+yoUmfPmgMMa1bL2GLAhPzlYlnC4NGbeEs4tTWDq1RENMVRkeXrS+lIJqWXq2g2I8gp7TkWky0cPeojypvdz4QKCurCW0dGvkC4k3b77W369oz7xvxWDS+6Q6wXKuTawLhOu/HuPp6Dsgw4N8V8tYx61JlR2B0z3OL49QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6FD22343030;
	Wed, 16 Apr 2025 00:15:59 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 16 Apr 2025 08:15:28 +0800
Subject: [PATCH v2 2/2] pinctrl: spacemit: add clock support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-02-k1-pinctrl-clk-v2-2-2b5fcbd4183c@gentoo.org>
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=hgCxsX2xeB7ssokjMjVuQzAe/R10W2qnEsmZP030Ffw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn/vazO0PhBV3WPP1OZXqUueTvxrOgsBekglOzs
 2flGSx0VBeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/72s18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277SahD/0e1oRz5hGAZTG1Et
 g8bInVmC8CEMmr0kzBRpOP1Js4grVnpkKsd9sGQodGaOD6sln3Qwh0O6+DggxzF1SgpQmNqui+j
 HIUSEHKA2AHR4S/vZDJQ+LD2pa/ZFQgRrI4iN+GWZAc2rt2S5jNZ9wuvmwxbP/LCnEMIR1dTxy3
 AX04edMdmRjQE3FkWQCPREeL+Ed1mRBV2LXgeRZW4khOAlWbOe38+AV5jEn+BKGFYRWlO2VJH9+
 0thGgvE4DgAgy7btKVf7v/Dm9/gpqdlj3ZVl6rRn7VzsnmhmqL42bAmALeZu1jY9YrEHm3nt4zM
 Xu8dR1HbExOZy80xmppsFUVQ/GCCJlBGHn34+NWCgjWPbsYfb1CORhVhB1EpMXF0HpxRGJlP6Gt
 Vjy0AjEliOgdvk3Pf+yhyUlPEfw21h5R/MF3HwvhqfZkf+prNS4VpzIHEQQoEOPb1g8UGa4MTio
 efLoCflAZXFBWfXsv260MRkWSBLJtWTtBV+bejJzpKHtekwn7T3uhRjD2tx0JqoEVhfA4Ue2HK1
 IxmvMj7Ql4JJxRSOSg+BUqmdyyv8Pg2QnWOrMbYLvzcXGpp3tnxzui1aaiaY5lDrhBbnfE8XC4D
 6c98W1KXB04fYZIOmISajq6/UCoTSUz1T8zEN7OkCf5LC7mgzGAw9bTjlbQ7aBz5yADg==
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
index 67e867b04a02ea1887d93aedfdea5bda037f88b1..9996b1c4a07e72f2a3832b759feddcd4e07f2159 100644
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
 
+	func_clk = devm_clk_get_enabled(dev, "func");
+	if (IS_ERR(func_clk))
+		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
+
+	bus_clk = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
+
 	pctrl->pdesc.name = dev_name(dev);
 	pctrl->pdesc.pins = pctrl_data->pins;
 	pctrl->pdesc.npins = pctrl_data->npins;

-- 
2.49.0



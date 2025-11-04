Return-Path: <linux-gpio+bounces-27998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44649C2EF17
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 03:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D73AB3BA407
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 02:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2AC2472B5;
	Tue,  4 Nov 2025 02:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QV9omP/G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m15595.qiye.163.com (mail-m15595.qiye.163.com [101.71.155.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1574823EA8B;
	Tue,  4 Nov 2025 02:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762222674; cv=none; b=kSZr9w2DvMp1GpWRKph4HyzM9ZMaPqqLtWhe/wyf4wYgk/rRULX3r80bKae6VFbQFFmED6OqkBBnzzkfDXbMG1OiK+nUq/iO2QKucO98gq1B03+yu+mjH6j0R4ZcP+uGKMEKUxqhMT/eKasMWyNw0N/5mRZRwnsa53u6nIL0dcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762222674; c=relaxed/simple;
	bh=7xwmfrHuOhq9vvpKOE3fa5rGpNCGWmQsZ8sAT7l1hXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FqDiXc4GcHhsILuygl0pPh4wsBZ2HkrCU7qzJ2FOfVKkRcAxJaHutP51q2zNnBiSYByPJt+jC+KyVbA0kgWLnObtCscFcYbcjAcQFKnI2nxYpSf53uE19UPlmX6b5OtEEOz9f8CicL30xTxptO26SzdcC+f/XPqKzJf3V2OlPrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QV9omP/G; arc=none smtp.client-ip=101.71.155.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2842e983c;
	Tue, 4 Nov 2025 10:12:33 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v1 3/3] pinctrl: rockchip: add rk3506 rmio support
Date: Tue,  4 Nov 2025 10:12:23 +0800
Message-Id: <20251104021223.2375116-4-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
References: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a4ca32c1909d8kunm1bdc99775fc3c87
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUNOH1ZLHh0aQk1DGRgfQ0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QV9omP/GG2etENojjSXRfCCBuTDUDwWS6aHOiRfLpDLS4DvkgkKZWistKcYn4E1PCDF/edawoqSNkS9gZDztDr2gzP2C9UYj0qlM/AEjRDrAsfEQ+1kgU1+NnZtGCtr0wB7yAnwrAuoaTpHxCNc0FICicjRZTRyq0qeGufQavUo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=6bpdvky3mLqhhxKzpg13DZv9erw7l+ahTifZaliB3Fc=;
	h=date:mime-version:subject:message-id:from;

Support rockchip matrix io

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 75 ++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |  1 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..89ff8d8c7fcc 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1258,6 +1258,74 @@ static int rockchip_verify_mux(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+static int rockchip_set_rmio(struct rockchip_pin_bank *bank, int pin, int *mux)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct regmap *regmap;
+	int reg, function;
+	u32 data, rmask;
+	int ret = 0;
+	int iomux_num = (pin / 8);
+	u32 iomux_max, mux_type;
+
+	mux_type = bank->iomux[iomux_num].type;
+	if (mux_type & IOMUX_WIDTH_4BIT)
+		iomux_max = (1 << 4) - 1;
+	else if (mux_type & IOMUX_WIDTH_3BIT)
+		iomux_max = (1 << 3) - 1;
+	else
+		iomux_max = (1 << 2) - 1;
+
+	if (*mux > iomux_max)
+		function = *mux - iomux_max;
+	else
+		return 0;
+
+	switch (ctrl->type) {
+	case RK3506:
+		regmap = info->regmap_rmio;
+		if (bank->bank_num == 0) {
+			if (pin < 24)
+				reg = 0x80 + 0x4 * pin;
+			else
+				ret = -EINVAL;
+		} else if (bank->bank_num == 1) {
+			if (pin >= 9 && pin <= 11)
+				reg = 0xbc + 0x4 * pin;
+			else if (pin >= 18 && pin <= 19)
+				reg = 0xa4 + 0x4 * pin;
+			else if (pin >= 25 && pin <= 27)
+				reg = 0x90 + 0x4 * pin;
+			else
+				ret = -EINVAL;
+		} else {
+			ret = -EINVAL;
+		}
+
+		if (ret) {
+			dev_err(info->dev,
+				"rmio unsupported bank_num %d function %d\n",
+				bank->bank_num, function);
+
+			return -EINVAL;
+		}
+
+		rmask = 0x7f007f;
+		data = 0x7f0000 | function;
+		*mux = 7;
+		ret = regmap_update_bits(regmap, reg, rmask, data);
+		if (ret)
+			return ret;
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 /*
  * Set a new mux function for a pin.
  *
@@ -1291,6 +1359,10 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 
 	dev_dbg(dev, "setting mux of GPIO%d-%d to %d\n", bank->bank_num, pin, mux);
 
+	ret = rockchip_set_rmio(bank, pin, &mux);
+	if (ret)
+		return ret;
+
 	if (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
 		regmap = info->regmap_pmu;
 	else if (bank->iomux[iomux_num].type & IOMUX_L_SOURCE_PMU)
@@ -4247,6 +4319,9 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the ioc1 syscon */
 	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
 
+	/* try to find the optional reference to the rmio syscon */
+	info->regmap_rmio = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,rmio");
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4f4aff42a80a..6d79ccf73b71 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -462,6 +462,7 @@ struct rockchip_pinctrl {
 	struct regmap			*regmap_pull;
 	struct regmap			*regmap_pmu;
 	struct regmap			*regmap_ioc1;
+	struct regmap			*regmap_rmio;
 	struct device			*dev;
 	struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
-- 
2.34.1



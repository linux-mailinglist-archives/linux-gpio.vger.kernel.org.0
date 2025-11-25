Return-Path: <linux-gpio+bounces-29053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39485C831B4
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 03:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 635793A1164
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 02:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37398198E91;
	Tue, 25 Nov 2025 02:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Idj4DGIC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1983FFD;
	Tue, 25 Nov 2025 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764038213; cv=none; b=ZE2cRlvv21huGrWkYAawesAR9EWCe++eJ+rFXoFv/6PRgX9nWnXwfRU1RDuFJ2Qn7mU6hmpreDCYYb6RlHfDFGtyM9lJriVgZD7s20sVbVoGcFEhdZ53L9NWJNGFPM1RbsuyXVnkMSj+gg3nEY6xZumZqDEGAxpEhVik/zhGJZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764038213; c=relaxed/simple;
	bh=xdxCIwzAWz8Gr8uPciPKO6ZJSpsc8BbfWZ29CLBUaoc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eWyh4tNNVQiBpRpqFgbNtPnlbFlHFK7Q3IS1QPqxYG6rBQ2/8OVIOWqwLWJfhyHAd99RM7fSAkU8IH73QpUJ22lnw4dxbDhF5pHz1NuUMOK+p/llsuRq6mq6zmZ9REs3fVXxyuW1ijF6YbKz5poV4vfV2ne6rSdPfOMBhjodRrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Idj4DGIC; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 94d64244c9a711f0b33aeb1e7f16c2b6-20251125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1QrAB75z30ci678/1yo1b+2Tia6ycFw2hkK2QWG58Jw=;
	b=Idj4DGICU629nj4a4U9EbN28jS9urOm2ovJ69p1+nrjw3yteJOwJglrpthpPk+V0wmVir5HhfHpl1nVsg/qEl3XpYolO6XG0M88g11T7OJRXaNOE4eOL88BtY1D0x2BPx4Sbp8UavYnJ0JQZR5vr2c9eWXK3YlGs1M4v6CtLv9I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4e96d7a6-68fa-4ee3-bd3d-268e3c868a92,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:a5164258-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 94d64244c9a711f0b33aeb1e7f16c2b6-20251125
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <lei.xue@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 243830009; Tue, 25 Nov 2025 10:36:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 10:36:42 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 10:36:42 +0800
From: Lei Xue <lei.xue@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<yong.mao@mediatek.com>, <lei.xue@mediatek.com>, <qingliang.li@mediatek.com>,
	<Fred-WY.Chen@mediatek.com>, <ot_cathy.xu@mediatek.com>,
	<ot_shunxi.zhang@mediatek.com>, <ot_yaoy.wang@mediatek.com>,
	<ot_ye.wang@mediatek.com>
Subject: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl driver
Date: Tue, 25 Nov 2025 10:36:34 +0800
Message-ID: <20251125023639.2416546-2-lei.xue@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125023639.2416546-1-lei.xue@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Kernel GPIO subsystem mapping hardware pin number to a different
range of gpio number. Add gpio-range structure to hold
the mapped gpio range in pinctrl driver. That enables the kernel
to search a range of mapped gpio range against a pinctrl device.

Signed-off-by: Lei Xue <lei.xue@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  1 +
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index fa7c0ed49346..df8dce14744f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -302,6 +302,7 @@ struct mtk_pinctrl {
 	spinlock_t lock;
 	/* identify rsel setting by si unit or rsel define in dts node */
 	bool rsel_si_unit;
+	struct pinctrl_gpio_range	range;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 6bf37d8085fa..2cf61cfe809e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -3,7 +3,7 @@
  * MediaTek Pinctrl Paris Driver, which implement the vendor per-pin
  * bindings for MediaTek SoC.
  *
- * Copyright (C) 2018 MediaTek Inc.
+ * Copyright (C) 2018-2025 MediaTek Inc.
  * Author: Sean Wang <sean.wang@mediatek.com>
  *	   Zhiyong Tao <zhiyong.tao@mediatek.com>
  *	   Hongzhou.Yang <hongzhou.yang@mediatek.com>
@@ -936,6 +936,15 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounce);
 }
 
+static void mtk_pinctrl_gpio_range_init(struct mtk_pinctrl *hw, struct gpio_chip *chip)
+{
+	hw->range.name = "mtk_pinctrl_gpio_range";
+	hw->range.id = 0;
+	hw->range.pin_base = 0;
+	hw->range.base = chip->base;
+	hw->range.npins = hw->soc->npins;
+}
+
 static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 {
 	struct gpio_chip *chip = &hw->chip;
@@ -959,6 +968,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	if (ret < 0)
 		return ret;
 
+	mtk_pinctrl_gpio_range_init(hw, chip);
+
 	return 0;
 }
 
@@ -1077,6 +1088,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to add gpio_chip\n");
 
+	pinctrl_add_gpio_range(hw->pctrl, &hw->range);
+
 	platform_set_drvdata(pdev, hw);
 
 	return 0;
-- 
2.45.2



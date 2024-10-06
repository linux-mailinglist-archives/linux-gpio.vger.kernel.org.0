Return-Path: <linux-gpio+bounces-10898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90166991DC6
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 12:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16FD4B21BF1
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 10:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4672E175D34;
	Sun,  6 Oct 2024 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="R+fk4j5F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A3171E43;
	Sun,  6 Oct 2024 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728210126; cv=none; b=r0/ZD3YZEOIbMEIo5ZdxY8wqyZLzWTq9xy3p+zLeJzLhgo7PoS3cL6wjx/vQmu78DdFsI+HsRclgzgUdSU0IRcLBEcOgEKx2Yc+e1yB9hhjSAqioLT3pI7c4FwN4k0agPJRTK5vkWUKeZTjnFKSWqY2d243OQIxwf8SEUG5RlVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728210126; c=relaxed/simple;
	bh=i0VDLMwDuMOVDGFP0bfNMFug3qcxk/uI24ZwMKQ5QrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlmtR06d8BZhh4y3FICpqUrY9aUr2Cc6GT4mOcAEsYZN9EU8YVYZFP5QGsr+ZBAkFreWOKTTmWGd7EaxN3R2hKGrEG1hGYvg0gGUu+wcR7JXiMpEtjSgjgj9WGHVE2HiFhJDZEK9B1HLIMlClxVIRF8L/drD5fJA77oA/mSU+uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=R+fk4j5F; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 984D15FAA5;
	Sun,  6 Oct 2024 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728210122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWad4mvVdtgpAklA0NUqnK9RzmPaXG2g9lgsXi99zSI=;
	b=R+fk4j5Fab1v3c/n9MksdNTtBgE4MO9zzKCsS4GFJcR1Gkbos9OuyWsg2aDT0fV6j03baP
	5ZWoq13gkE0R0GV2hp9yjhA3K7vEDaHV364/A7RqUKLp/ZBcQjv7rEbZKo3eeMv9n9wO8Z
	HXqGM8zsVZ5eG1tVjZGHiK1b8MW+w9Y=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id C2154360092;
	Sun,  6 Oct 2024 10:22:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	daniel@makrotopia.org,
	linux-gpio@vger.kernel.org,
	john@phrozen.org,
	eladwf@gmail.com,
	ansuelsmth@gmail.com
Subject: [PATCH v1 2/2] mmc: mtk-sd: add support for mt7988
Date: Sun,  6 Oct 2024 12:21:49 +0200
Message-ID: <20241006102154.17087-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241006102154.17087-1-linux@fw-web.de>
References: <20241006102154.17087-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8f3b2bb3-02d2-4a96-891f-7c5b1e80bb8c

From: Frank Wunderlich <frank-w@public-files.de>

Add support for mmc on MT7988 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/mmc/host/mtk-sd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 89018b6c97b9..6d5afe51a61d 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -571,6 +571,19 @@ static const struct mtk_mmc_compatible mt7986_compat = {
 	.support_64g = true,
 };
 
+static const struct mtk_mmc_compatible mt7988_compat = {
+	.clk_div_bits = 12,
+	.recheck_sdio_irq = true,
+	.hs400_tune = false,
+	.pad_tune_reg = MSDC_PAD_TUNE0,
+	.async_fifo = true,
+	.data_tune = true,
+	.busy_check = true,
+	.stop_clk_fix = true,
+	.enhance_rx = true,
+	.support_64g = true,
+};
+
 static const struct mtk_mmc_compatible mt8135_compat = {
 	.clk_div_bits = 8,
 	.recheck_sdio_irq = true,
@@ -629,6 +642,7 @@ static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
 	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
 	{ .compatible = "mediatek,mt7986-mmc", .data = &mt7986_compat},
+	{ .compatible = "mediatek,mt7988-mmc", .data = &mt7988_compat},
 	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
 	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
 	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
-- 
2.43.0



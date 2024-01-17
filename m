Return-Path: <linux-gpio+bounces-2310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9768308DD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jan 2024 15:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37AF51F24BD8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jan 2024 14:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40CD20B38;
	Wed, 17 Jan 2024 14:56:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B6420DCB;
	Wed, 17 Jan 2024 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503384; cv=none; b=mvjcgzCt5EzfFjDMV9DilDdoo/1YrqymycI58VW9bntskFF1WzbHfGz5pHu56Vde2F4WHF0gc8UbIGhSDN1qvF3aVnd30FOW1IGewjTrbM8LxSm9J7hcLImC5TSybsfgGF2/G/1QGYGs6+AojG5LUhc08D52aHnZJMGeagDnspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503384; c=relaxed/simple;
	bh=E56splDASVQAb/oV3isY/95h/YumxoYpMCoUHLwaWCc=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=IoZrJyZ7aLhVA8Rggjw2bWUmva9TW7wZORK4zWZ7Gp+k2f7R1A4lvWl3/wGBFmGpC9DG+uGvmClwBJG5ae8JOliXY6x9z20NkgjQGlCZLOx3FjNHqRQYtD8l9W3W0cP9WtbyZRNtMQzmRiDxPDTGGYtRCKsTchs1H6wUa2mS8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wifirst.fr; spf=fail smtp.mailfrom=wifirst.fr; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wifirst.fr
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wifirst.fr
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:aa1:d2f0:f6b3:db6:44c:eeef])
	(Authenticated sender: isaias57@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4ECE77802D6;
	Wed, 17 Jan 2024 15:56:09 +0100 (CET)
From: Jean Thomas <jean.thomas@wifirst.fr>
To: sean.wang@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jean Thomas <jean.thomas@wifirst.fr>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH v2 2/2] pinctrl: mediatek: mt7981: add additional emmc groups
Date: Wed, 17 Jan 2024 15:55:47 +0100
Message-Id: <20240117145547.3354242-1-jean.thomas@wifirst.fr>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new emmc groups in the pinctrl driver for the
MediaTek MT7981 SoC:
* emmc reset, with pin 15.
* emmc 4-bit bus-width, with pins 16 to 19, and 24 to 25.
* emmc 8-bit bus-width, with pins 16 to 25.

The existing emmc_45 group is kept for legacy reasons, even
if this is the union of emmc_reset and emmc_8 groups.

Signed-off-by: Jean Thomas <jean.thomas@wifirst.fr>
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index ca667ed25a4d..ef6123765885 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -700,6 +700,15 @@ static int mt7981_drv_vbus_pins[] = { 14, };
 static int mt7981_drv_vbus_funcs[] = { 1, };

 /* EMMC */
+static int mt7981_emmc_reset_pins[] = { 15, };
+static int mt7981_emmc_reset_funcs[] = { 2, };
+
+static int mt7981_emmc_4_pins[] = { 16, 17, 18, 19, 24, 25, };
+static int mt7981_emmc_4_funcs[] = { 2, 2, 2, 2, 2, 2, };
+
+static int mt7981_emmc_8_pins[] = { 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, };
+static int mt7981_emmc_8_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
+
 static int mt7981_emmc_45_pins[] = { 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, };
 static int mt7981_emmc_45_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };

@@ -854,6 +863,12 @@ static const struct group_desc mt7981_groups[] = {
 	PINCTRL_PIN_GROUP("udi", mt7981_udi),
 	/* @GPIO(14) DRV_VBUS(1) */
 	PINCTRL_PIN_GROUP("drv_vbus", mt7981_drv_vbus),
+	/* @GPIO(15): EMMC_RSTB(2) */
+	PINCTRL_PIN_GROUP("emmc_reset", mt7981_emmc_reset),
+	/* @GPIO(16,17,18,19,24,25): EMMC_DATx, EMMC_CLK, EMMC_CMD */
+	PINCTRL_PIN_GROUP("emmc_4", mt7981_emmc_4),
+	/* @GPIO(16,17,18,19,20,21,22,23,24,25): EMMC_DATx, EMMC_CLK, EMMC_CMD */
+	PINCTRL_PIN_GROUP("emmc_8", mt7981_emmc_8),
 	/* @GPIO(15,25): EMMC(2) */
 	PINCTRL_PIN_GROUP("emmc_45", mt7981_emmc_45),
 	/* @GPIO(16,21): SNFI(3) */
@@ -957,7 +972,7 @@ static const char *mt7981_i2c_groups[] = { "i2c0_0", "i2c0_1", "u2_phy_i2c",
 static const char *mt7981_pcm_groups[] = { "pcm", };
 static const char *mt7981_udi_groups[] = { "udi", };
 static const char *mt7981_usb_groups[] = { "drv_vbus", };
-static const char *mt7981_flash_groups[] = { "emmc_45", "snfi", };
+static const char *mt7981_flash_groups[] = { "emmc_reset", "emmc_4", "emmc_8", "emmc_45", "snfi", };
 static const char *mt7981_ethernet_groups[] = { "smi_mdc_mdio", "gbe_ext_mdc_mdio",
 	"wf0_mode1", "wf0_mode3", "mt7531_int", };
 static const char *mt7981_ant_groups[] = { "ant_sel", };
--
2.39.2


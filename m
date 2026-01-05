Return-Path: <linux-gpio+bounces-30142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73426CF2E5D
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 11:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FE933005FF4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 10:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398622F0C70;
	Mon,  5 Jan 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="g9yge/6y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C21DD9AC;
	Mon,  5 Jan 2026 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607241; cv=none; b=sz7HLfL3ph4tiBZpNzZjE4xeRuYA/LlkgIjTDemW7+SBG+OtL6Bj+tKeVLpnfS+4XwTJNRRcgtenTJATGADh/t1gz2qWiDkendTbOUCYOv6aWnWdveVyUSU3MH/tMsFHFM+MgO+u2tEGmRKB8tolz/fQnTdpAsyvfC1niB4aqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607241; c=relaxed/simple;
	bh=xQSdvZemonWKFcvogkSyedmORtzPF+JXg26oljkZZ18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U1b595di5NXRYw8VQEupwEmY9AVnj9LY9p/wd/6AMz2uqf3QpDDZQcHiw48CeYCaGY+qfwd6tqDceT+xzZTOHfzHMyF/bx5VMZFLswAu3hJcgZvBDRcebiIxcuKsSY5jai8Z14CdXLziTya4kurj2be9uq5HRkUIaVCsG5pGTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=g9yge/6y; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767607239; x=1799143239;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xQSdvZemonWKFcvogkSyedmORtzPF+JXg26oljkZZ18=;
  b=g9yge/6yro6cRaB+vwuPoceZi/C9WWSww8EpaF71yhwAPSHSgTNvT4Tp
   95LnJl36DGgcTy1uY7BnGwPGnWFjaY6Bualq8e5Df26/DwT6ww84ay1+a
   6R7GNTfF/yUQxNbvXSeMztdle5xXmQ8Idgl6wH/XZttNFFVHqNl8HKjmw
   obbqrxZByvt6xcmX4zOB2CeZSn8TEoGMcX1uNmk0bcu57o+xpeUdf8kBs
   cq3AXQd5VSUviHuFQxNVUDPwg19O92XyulgpMnI8A0COdtR7JY4k6AVaC
   X3ME2KxxSMoIfo79PVl6b5mKlrAxAhKfsL+dRtGKSrc4+XQtkUv/xnssi
   w==;
X-CSE-ConnectionGUID: 1cStLnPtRFaQ+RdhyhcX1A==
X-CSE-MsgGUID: +D7jvq+CSPSE/XhOcm2XOQ==
X-IronPort-AV: E=Sophos;i="6.21,203,1763449200"; 
   d="scan'208";a="58246851"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jan 2026 03:00:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 5 Jan 2026 03:00:18 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 5 Jan 2026 03:00:16 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH] pinctrl: at91-pio4: Add sama7d65 pio4 support
Date: Mon, 5 Jan 2026 10:59:56 +0100
Message-ID: <20260105095956.19615-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add sama7d65 compatibility string.

Sama7d65 does not have a full last bank of PIO lines similar to the
Sama7g54 SoC. Sama7d65 only has 14 lines on the last PIO bank not the
full 32; adjusting the SoC attributes accordingly.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Hi,

dt-bindings already up-to-date with this new compatible string by:
https://lore.kernel.org/821255840c09d8d9cebbb1f2daaedd8a7c138875.1736522006.git.Ryan.Wanner@microchip.com
(even if still .txt)

Regards,
  Nicolas

 drivers/pinctrl/pinctrl-at91-pio4.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index ec5351fc282e..41cbb46ac589 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1053,6 +1053,12 @@ static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
 	.last_bank_count	= ATMEL_PIO_NPINS_PER_BANK,
 };
 
+static const struct atmel_pioctrl_data microchip_sama7d65_pioctrl_data = {
+	.nbanks			= 5,
+	.last_bank_count	= 14, /* sama7d65 has only PE0 to PE13 */
+	.slew_rate_support	= 1,
+};
+
 static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
 	.nbanks			= 5,
 	.last_bank_count	= 8, /* sama7g5 has only PE0 to PE7 */
@@ -1063,6 +1069,9 @@ static const struct of_device_id atmel_pctrl_of_match[] = {
 	{
 		.compatible = "atmel,sama5d2-pinctrl",
 		.data = &atmel_sama5d2_pioctrl_data,
+	}, {
+		.compatible = "microchip,sama7d65-pinctrl",
+		.data = &microchip_sama7d65_pioctrl_data,
 	}, {
 		.compatible = "microchip,sama7g5-pinctrl",
 		.data = &microchip_sama7g5_pioctrl_data,
-- 
2.43.0



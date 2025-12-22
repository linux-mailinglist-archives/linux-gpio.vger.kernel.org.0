Return-Path: <linux-gpio+bounces-29793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D65CD5EE5
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 13:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AEB5300FA36
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 12:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7C727F724;
	Mon, 22 Dec 2025 12:09:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4C279798;
	Mon, 22 Dec 2025 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405385; cv=none; b=ROoMZnEvc1hl7iqb0P9DdujUSrvhr7Aw9nvjTC9kFLixIBfXFzfOCsQZlQ9KamK5MtlZ0lOs3GwpcOLlKkdJH8BLVmVJ8o6PNel+fZecFAOsfLorTzAy4D8Mkzv8cuyu+IGQvUi+EfcrkRY/WV/QociFuFZGUQfbveU2k8UG8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405385; c=relaxed/simple;
	bh=9aHMGO/anwtWi10C7W8Ai9OrN9GsPC2DEymoczNF6rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bUzmF7talqI2Xr4f4SeFIlcXLAlyAr9iYqCjZwuEY6kE8iyToSL8/IEoPtTrTu2QiSQwsuRxBMWBwNM8RHhbjU2HL9VgMV+GyK9byHH4G6QpRDwFk/MpFps7iVb+3WfiwSBOe642r26f1YaDuh/khHXhJ9G/g+oXBDjgImPiHbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 22 Dec
 2025 20:04:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 22 Dec 2025 20:04:29 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 22 Dec 2025 20:04:27 +0800
Subject: [PATCH 2/3] pinctrl: single: Allow probe to continue if mem region
 busy
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251222-upstream_pinctrl_single-v1-2-e4aaa4eeb936@aspeedtech.com>
References: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
In-Reply-To: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766405069; l=1297;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=9aHMGO/anwtWi10C7W8Ai9OrN9GsPC2DEymoczNF6rQ=;
 b=5WbJHU1Tw4C9iL1u5pb6pSRyKD95fsNrKGFLPvThTdTJC5IvPviIEn2X9OEeTWaXaSddzfCjp
 2YqqoLAdhTjDWHJ4cjMFW9xwdLXiO9Z4hQcd3LP3SlqTo8TIoL6fOvK
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Skip exclusive memory region reservation failure during probe and
continue initialization with a warning. This enables support for
systems where the memory region may already be reserved, improving
probe robustness.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/pinctrl-single.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 757c22cc09f3..e65ae737b4c5 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1910,13 +1910,13 @@ static int pcs_probe(struct platform_device *pdev)
 
 	pcs->res = devm_request_mem_region(pcs->dev, res->start,
 			resource_size(res), DRIVER_NAME);
-	if (!pcs->res) {
-		dev_err(pcs->dev, "could not get mem_region\n");
-		return -EBUSY;
-	}
+	if (!pcs->res)
+		dev_warn(pcs->dev, "mem_region busy, continuing without reservation\n");
+	else
+		res = pcs->res;
 
-	pcs->size = resource_size(pcs->res);
-	pcs->base = devm_ioremap(pcs->dev, pcs->res->start, pcs->size);
+	pcs->size = resource_size(res);
+	pcs->base = devm_ioremap(pcs->dev, res->start, pcs->size);
 	if (!pcs->base) {
 		dev_err(pcs->dev, "could not ioremap\n");
 		return -ENODEV;

-- 
2.34.1



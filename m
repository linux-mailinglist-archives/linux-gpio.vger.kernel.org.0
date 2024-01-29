Return-Path: <linux-gpio+bounces-2707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D5B840A0B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 16:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B5A1C22567
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 15:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CB9155A46;
	Mon, 29 Jan 2024 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lFesfq20"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E915442F
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jan 2024 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706542303; cv=none; b=kA0PjM4nLwwpw72gPLME2Q4M7i4WCZW014bmcw7wF8d8GyNB7FG36vnzek6DLewdXVGwg4BkW9dAJIWzuHub0CdGYy6oaOIsSmDaAfdpM7euUecFzXn1kFyC/7WUGZKpXzfGnuJ5IW0SWR0U+nbSMDgLTogCTD2Zf/oIPPKSEuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706542303; c=relaxed/simple;
	bh=o51BgwUINRLb2Rh+uyAByfTYdtuxveCXUtLdizACuZ0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IIeLIosiqY1zmmTW4cqmMhNZTHwDm3POtAWy/OCUs6GlAIomp5a4FO0Npc61C9rt4d1Ea2U4w+mQPew+G1sfSsx2Wwnh6iIcW9aXqkJLS/Y7tVT3CSoA0tsF0EYry5x6oUFv+XsosX3/yvHzOxaOhfvxCWptgjYqFSz5DSOPbTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lFesfq20; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T5fMu7006968;
	Mon, 29 Jan 2024 09:31:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=A
	iNcgNsNR3ED+F23emoqO04WwmuVLFwXwovIMe3YjKE=; b=lFesfq20Nu6u5js6j
	fRKM7HWR+2VO19Mby6aQJlmgzcWugDIITvUm+QQatO8/LuyQFHn336Q3RaoQkBkT
	c6lCVztmuu4fsluLMG6xeNWpiUSTxVKGSk5JD3qkt+gKafsq4joEltiGQ7CvjtQ0
	zt4AY84PzFglEcM6gVI9uUjPd9i21jZz+6G1tD+kOQwwvSoKJi/g8E4azuonknGt
	aBsWP+3unWh/NVWTl6oD/WZCdkdvqiG1ocQOe4fSi3PYDpnGLWZj5llbxvork5tL
	/7ibDRvoQon8+jEpiJrtq3oVJMFZNfCRc2H9Sai/iF+GVFNI6SAL2CF1ePpF9vgA
	Z/Rig==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nt7v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:31:40 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 15:31:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 15:31:38 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6AA2A820242;
	Mon, 29 Jan 2024 15:31:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 1/3] pinctrl: cs42l43: Tidy up header includes
Date: Mon, 29 Jan 2024 15:31:36 +0000
Message-ID: <20240129153138.3221604-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: owQgeG-M_7b7AjB3KwIZPRTCe0967HlU
X-Proofpoint-GUID: owQgeG-M_7b7AjB3KwIZPRTCe0967HlU
X-Proofpoint-Spam-Reason: safe

Fixup a couple of incorrect header includes.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

Thanks,
Charles

 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 012b0a3bad5a..24e21d1e0d06 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -5,10 +5,10 @@
 // Copyright (c) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/err.h>
-#include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
@@ -17,7 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/string_helpers.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl.h>
-- 
2.30.2



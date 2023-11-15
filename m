Return-Path: <linux-gpio+bounces-176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3E97EC88C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 17:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B9431C208FA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 16:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F3339FE4;
	Wed, 15 Nov 2023 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EXFpqtsC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E236A930
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 16:29:00 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B322B11D
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:28:57 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AF6ecXV007857;
	Wed, 15 Nov 2023 10:28:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=j
	uEDWpGdWhhlILpWsIBos3D2RftNdzYxHRwKpaV6HLg=; b=EXFpqtsCOHN8TcP4D
	z1iKpn4uVijtRk1cevsNG3Mer40S0HmVYl69l1YrgePJ2v5jIUszO3818Oo4f/mK
	hvFpFshMyao0KwI0xO3kxF4c22lXOcOHy0HDIWBlvvVrXRvyafFgcZeb7+qbnF9v
	dSk7tUCjNdBI1DXzwcudxNkuo6S35I0AeEEjrhnzdszH/sDoATWnQ41POWPnbdiY
	I72z7NngAoLaUkA+WYlmTvXiDljjYCFD7j+d0SudltfI4S+/AymKgr+I5W4TiGx9
	L92SZK/MVE/WchGloB0YRAz9C8e2QOLBAhFBlb1X+4eJgcgAa/M2Fy/p9j2Ay3p3
	FMg5Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ua7w2mxmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 10:28:56 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 16:28:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Wed, 15 Nov 2023 16:28:53 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9D5503563;
	Wed, 15 Nov 2023 16:28:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] pinctrl: lochnagar: Don't build on MIPS
Date: Wed, 15 Nov 2023 16:28:53 +0000
Message-ID: <20231115162853.1891940-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EYlcQCkHpFYHMJdm2U4x0uCDz1VKWcy1
X-Proofpoint-GUID: EYlcQCkHpFYHMJdm2U4x0uCDz1VKWcy1
X-Proofpoint-Spam-Reason: safe

MIPS appears to define a RST symbol at a high level, which clashes
with some register naming in the driver. Since there is currently
no case for running this driver on MIPS devices simply cut off the
build of this driver on MIPS.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311071303.JJMAOjy4-lkp@intel.com/
Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/Kconfig b/drivers/pinctrl/cirrus/Kconfig
index d6318cb57aff2..c56220e05f57e 100644
--- a/drivers/pinctrl/cirrus/Kconfig
+++ b/drivers/pinctrl/cirrus/Kconfig
@@ -12,7 +12,8 @@ config PINCTRL_CS42L43
 
 config PINCTRL_LOCHNAGAR
 	tristate "Cirrus Logic Lochnagar pinctrl driver"
-	depends on MFD_LOCHNAGAR
+# Avoid clash caused by MIPS defining RST, which is used in the driver
+	depends on MFD_LOCHNAGAR && !MIPS
 	select GPIOLIB
 	select PINMUX
 	select PINCONF
-- 
2.39.2



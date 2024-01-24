Return-Path: <linux-gpio+bounces-2522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA9F83AFD7
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 18:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6A21C2676E
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 17:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DA11292CE;
	Wed, 24 Jan 2024 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RIXwiJXk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644427F7EA
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706117085; cv=none; b=dIVEjuK7jaJXdCjhiR7Xiwe+xyainUhBPQo2T5u2FGdi5fBUq7mEuXMByPwDIqOhHi1/Dz6q9CcpYlnr1iQwrZ9McbMSe5OWxeurlkX6sUplZ10mTdDCU0ieNQuEfkLiaVtK30NqEaU00CK66iFYKfD4E+yw+5PX21Wi0UaqS2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706117085; c=relaxed/simple;
	bh=/HzGekeldLxmn1AbPq+pgXqeFTmOHD+YndTERML1D7A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BecQZb8ophAfrQWIJuSmnN0S0IVA/0mGELF1Z9MmW8hFYNeJ6MlCeJk5whMscEYvpXq3P5hzRJqB/oJ8VARdgcVPmZCT+Jj9RbVDkAkU77bNDOMg0M6+UFWLv2ZUruxQZBT7chIjLgsDtwT49sVdn9lbdifNgS/TrD5ErXSn+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RIXwiJXk; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O5ABkj018377;
	Wed, 24 Jan 2024 11:24:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=J
	coO4l1xYx/iCnfyP45tpmywz32GI+FVql01u5RdHa4=; b=RIXwiJXkkjGwWkGQk
	WCrqGmaHlFI+pM1HAvtgHxhnbHS1lIk3DdNC5lfXKi8hNyih29clGoEzG22JrbP8
	ghgmyJa1pO2NkJUdjnqGnnJNZYIeFVdvFgZ8cT7pG+wBx7Wl0SIQ0adk316VWamn
	gMEYlPovNk83w7RWDjq0BBW/cOSKdSKiN0JxAWRruDLuw/3xofK1YRPqOhuX06nD
	lqwdAO6uLX6qAJ0qsA3IFtZaofkj7hqxv+NPpphKzVzyooX0N/Cj6McbZgLjRldn
	Z0Jew6zwd5LTjOGCqSMU80cWTw2EfwcVWxrZ4O0bjWY6iNdjiUY/libfTRjeEw92
	Z8+8g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh5pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 11:24:40 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 17:24:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 17:24:38 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8C435820246;
	Wed, 24 Jan 2024 17:24:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH 1/3] pinctrl: cs42l43: Tidy up header includes
Date: Wed, 24 Jan 2024 17:24:36 +0000
Message-ID: <20240124172438.2086766-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bSq-iWZvwW1r2VZsXd1naVhLVyFBNqld
X-Proofpoint-GUID: bSq-iWZvwW1r2VZsXd1naVhLVyFBNqld
X-Proofpoint-Spam-Reason: safe

Fixup a couple of incorrect header includes.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 012b0a3bad5a9..24e21d1e0d06c 100644
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



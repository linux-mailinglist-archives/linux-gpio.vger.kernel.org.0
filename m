Return-Path: <linux-gpio+bounces-2566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C959283BEF1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 11:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 245FCB2A469
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 10:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81353225A9;
	Thu, 25 Jan 2024 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OdoN81Lx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7C22329
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178807; cv=none; b=k5W1jy+4I5lNSYXWD4CGgIIQwP3hVxDEJamM0D4/JHB0rNe9MrydbCyLg1VUiNYjSxJKTNQBNLYo5La1gjwuqB454lQjaAk84YneX+H5CkAwBm8TNwLtgwN8uEkbaDKvCmqDEkLhsNk4gcMGU1AGZKE9uz/sLUq37i+75Q30ihM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178807; c=relaxed/simple;
	bh=ixr+ngAHWcc7WgvZ8G73S74mVh8hQtmI36R6aVuob2g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IZfL7niXG37WrVLQhZkOxWbAIDvBdSwC6ZX1TZjxXJGMWV1NL3AQMlr90w9WnwAZNLyJnl33RJ9ENnCgNKuBi0pD0+h0KkaL8BYtGsbJuNERWeQ+lwLyErj3gWe4VqRUVzP41Zu8KoOmae+scYl+i/WxjyDLi3sCV97sXG2cwNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OdoN81Lx; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P7paSx014010;
	Thu, 25 Jan 2024 04:33:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=e
	QJz3DXt+H2ZmzOkRcCcmuWoccPIHYotDhNHpeTMd24=; b=OdoN81LxJH+sWyiYc
	vSySpvhAb7CyfKjRVqPv2X8u7MKn4n4rm7owLvsGpPj2KHsd3ppLRr16/aAfGGej
	v11kFCutXFQSMCorZlwuEQQvM/EdTz5MFUUlRSc8vKE3dvHhsowMYMdmN6A6UVLo
	n4XXObWe0zkOw/AHQt9xQFhN+E7+onU4beKWe8RaugYJDkGQuwDS6BFpL4Uj5OId
	rFYkOAtSoXwOI2wiPTIUNlf5Exr+1KIv00+MeiEDgkpDY3oyAwhi94hIT1Z3jqiP
	tQ+UxvZ5Yqtmx3Dznpqe2pv6P3xcfuVobmJYFn3jpQ3gd8InCC8KNhf7RIhE3FRi
	STPzw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9t2rd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:33:23 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:33:21 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:33:21 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B7803820247;
	Thu, 25 Jan 2024 10:33:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 1/3] pinctrl: cs42l43: Tidy up header includes
Date: Thu, 25 Jan 2024 10:33:19 +0000
Message-ID: <20240125103321.2622277-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Iv_VAr7X4zCANsdTRJNhHCK5lw1gCYoh
X-Proofpoint-ORIG-GUID: Iv_VAr7X4zCANsdTRJNhHCK5lw1gCYoh
X-Proofpoint-Spam-Reason: safe

Fixup a couple of incorrect header includes.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

Thanks,
Charles

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



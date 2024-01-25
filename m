Return-Path: <linux-gpio+bounces-2565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7C83BEEB
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 11:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29CD41C236F0
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 10:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC3F22099;
	Thu, 25 Jan 2024 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IPpq4xLv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA1D22303
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178806; cv=none; b=Yzvo01IEamsIFAc7l/Ey7UAK2ML81vYc5bHDZSkj7iRRdGouRVE/nvRGTuz2zXOwnW1nktz67t7jTxUs7sKDuRduFVxKlG5VLXhT/zMo/PVwzsR3QAkY/LffnWLH07FTAee1QQsiRXvHwTnZW8xg4GPUpmMh3chnx7a4Bk/CfHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178806; c=relaxed/simple;
	bh=Lb+75PxGk5ZSSmxpqdnwWt4mQ9hIV0Xdh2tvTk3aRk8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOQpbFw46pDqD//OIg9EHNqJmbK+jrlpQJwVzgGJli8JVgNXBpPl7RqwopkpZkFelcYe/y7P2Q9EzW66Xmp6HodIkkhCO33zWfbtOYkITDboTPe71pQMeqAk8aWhs/tSYI4bCV8mZxZwFxjAcrUgC/WdmZ7d9jT+FXLLPI2TraI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IPpq4xLv; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P7paSw014010;
	Thu, 25 Jan 2024 04:33:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=uS7VtLE2le/Y/2kJjsEOrWV+3WlfX4zzNadAV/IYz7I=; b=
	IPpq4xLvbqAMhRRKL4Kjou9cUQV9KtFcrarImi+biU9LAqiSB4mIua71qWGmpwKx
	ChSXlICQV1AaPzdHlTB8rMiu21iHYhiRl+YftRfQa0kPAYSzk4y2W0lc4QsswYZ3
	5+uSogmczcteaV4AuTmG6hniFGHQ8pFzL6Mgn/STVhIsNwzsErdD6sLhN/KHHqcm
	x9CsU2K27f/9otlG+r3UN3XfDSC2qCuh+rHdIHRLe6ycCKgMU85TtknCgAia/M38
	pWPAa4GKWuuuJ03Wwmq067GO0oR39kquB3BC5tIsNgnBNGR6f00Q7lvMpH0Ip3b8
	ESRyQSXEGHCnRdOn8zZjlA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9t2rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:33:23 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:33:21 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:33:21 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D2459820248;
	Thu, 25 Jan 2024 10:33:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 3/3] pinctrl: cs42l43: Use str_high_low
Date: Thu, 25 Jan 2024 10:33:21 +0000
Message-ID: <20240125103321.2622277-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103321.2622277-1-ckeepax@opensource.cirrus.com>
References: <20240125103321.2622277-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9pINfeT0kO5b8GWqptmNpi9bC3CbaETb
X-Proofpoint-ORIG-GUID: 9pINfeT0kO5b8GWqptmNpi9bC3CbaETb
X-Proofpoint-Spam-Reason: safe

Use str_high_low rather than open coding.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added commit message

Thanks,
Charles

 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index ac3df58bbe951..628b60ccc2b07 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -490,7 +490,7 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	int ret;
 
 	dev_dbg(priv->dev, "Setting gpio%d to %s\n",
-		offset + 1, value ? "high" : "low");
+		offset + 1, str_high_low(value));
 
 	ret = pm_runtime_resume_and_get(priv->dev);
 	if (ret) {
-- 
2.30.2



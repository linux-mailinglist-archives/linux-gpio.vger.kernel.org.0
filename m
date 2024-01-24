Return-Path: <linux-gpio+bounces-2523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBCC83B04A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 18:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 235CDB2F2EB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 17:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150071292D7;
	Wed, 24 Jan 2024 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="paDr2Tu9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4CE81AD5
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706117085; cv=none; b=S6laURwPoeyZpgkDEl9vdcLSfRG72v1F2x/GLZ/VkEUE1n9OviuJJfwAtNCp6rZ7i6G8+iI7fabkM3QaXf8qzB4NK22oA6DTmv8DwcqfTbD9YfUdOt1L5oGZLwkmcsi0f1dDs9PxPsvfk71EnL29ve0g3Ie6J27TqzHcGaPQX3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706117085; c=relaxed/simple;
	bh=cOjjWTswXdZeV3y2gs7GlKmakRfi9vDj31vQ2CRiOIY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nl7ssegxOgYrn4BSeGhNV8yXQVgB0ZzR/zc5W92LpmZvV5sucNjVqPYpAaYDXOCKzZVkl/MDzn2m4Fa1/X2te17ZryW7gUhKIK03k7VZhzOxKMi0lO37Gv/vcRkAJkmHpMZZav6yrBwxFSGL+zKB7u83VKsSxOf+t4hOAUzCa0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=paDr2Tu9; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O5ABkk018377;
	Wed, 24 Jan 2024 11:24:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=+9zcPpVAcftPLQzzVBF9ew51H4wHhDF0yzTy+nyeu1c=; b=
	paDr2Tu9GTeIYae0v4xXLTWGq/SfIhlW8dUC4CErKApAhjIfOrx5l53gFnABvQX+
	PFdFQp/XBzfbG7GmkQNu5pgWhIfcOYMNMClBtd+bNs3OR0iKQfQ+wQJi4aaqiVyA
	SBBo5J9OEFAB4ITn6Z1hG2UbCfnUv19mOr+wHg3ajbfMMSxb9iyAvVP4HhCnzdvH
	1GLHAkBQ8Mmiv1Q6zGw2jX/JOPOmGOKlM28j++AW0uw6M6BFBqNN1kIZgwhcSLAI
	LP0fNsBGqxhEKEgAYNQ4Vp7NLKv0DiRnS2ZanVQiDnVUlae1O21+9jXdyGWJoSSW
	QdY6EUHB5vCD9IaKTZIJKQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh5pu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 11:24:41 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 17:24:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 17:24:38 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9AAED820248;
	Wed, 24 Jan 2024 17:24:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH 3/3] pinctrl: cs42l43: Use str_high_low
Date: Wed, 24 Jan 2024 17:24:38 +0000
Message-ID: <20240124172438.2086766-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124172438.2086766-1-ckeepax@opensource.cirrus.com>
References: <20240124172438.2086766-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: waB_4kUZPu3svNgMOVpU1V7kvww2JeD9
X-Proofpoint-GUID: waB_4kUZPu3svNgMOVpU1V7kvww2JeD9
X-Proofpoint-Spam-Reason: safe

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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



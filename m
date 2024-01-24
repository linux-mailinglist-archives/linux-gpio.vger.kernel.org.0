Return-Path: <linux-gpio+bounces-2524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248D83AFD8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 18:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF24E287801
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 17:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFECF1292DD;
	Wed, 24 Jan 2024 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="c0HIY21p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0426781AD5
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706117089; cv=none; b=XprVT3ExtNLPR8vkt2xavjwO58yDUF+5JPzJqyKcaJmqcQwMqtw+UayTbpH5hO49fGo+na1L5WpYzQyJNf3kM37FFaHPzb/SZcvABpeJbOT9ihsbjQXEL8FXYpwxp/huzwyyWNev4/Mdvm6kWjNCSkVkTa/eLiK+t8tgZZ45Tlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706117089; c=relaxed/simple;
	bh=QGjT7/uUZbTMYEx4CS6vzoXVQrBz2yJenS8lM6zfQU8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paRhPzTmPjLViBbYDLcqfH+3iuzXST4vsL6cjVSeFr+81K9tGx/f5yiMGWHINh8ijCj1PCh5jmEs0xaTZeDHAWTrI+yqIX7O2jOK3/I5JAaDKwL0lxdS6RhWNTL1ACJIXaxQ4aIv8up/o2XVGwbZ8kOOTsa2/bvhVyU2lpFkzao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=c0HIY21p; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O8MvVq030107;
	Wed, 24 Jan 2024 11:24:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=PUe1cBvR9UX53hjVEalrGVrXExW4eMX7vcU3xKD9yUQ=; b=
	c0HIY21pf2d6NIzficgoAE5uxFLIIf9mzRu2muFmNbHCpubTiYPDNARH9HZqFnQX
	Se4Khg15CTN5NpOZxgz8wHzAYklHFUJsLulkncXEwfquaCUNUoU2CbyFDpFIWpew
	brat9bauCcqTvYoaolO4ml2rxaoJcDlOCvdXway1lAUvb+846560lBAQfPcVA8VL
	Yyi6+GR93EhhyHpKQH7pWyiU/s6TJeS2ZjJ3qgmZ+eQCOaEVjKVKQJt0xSFpbvFB
	rCVsP4a/HLd/TkdZ1Iz9G542DMxU4fpOAxlgGxlHVN+X0/bjfptC58s8wtSMPZ2k
	cMa4hEngAo+l0ngpcmYFTg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9s5jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 11:24:40 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 17:24:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 17:24:38 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 986DF820247;
	Wed, 24 Jan 2024 17:24:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH 2/3] pinctrl: cs42l43: Remove some needless inlines
Date: Wed, 24 Jan 2024 17:24:37 +0000
Message-ID: <20240124172438.2086766-2-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: aoD_oL-xJa6Y3SL2JXEB_pI30EcYc0-x
X-Proofpoint-ORIG-GUID: aoD_oL-xJa6Y3SL2JXEB_pI30EcYc0-x
X-Proofpoint-Spam-Reason: safe

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 24e21d1e0d06c..ac3df58bbe951 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -276,7 +276,7 @@ static const struct pinmux_ops cs42l43_pin_mux_ops = {
 
 static const unsigned int cs42l43_pin_drv_str_ma[] = { 1, 2, 4, 8, 9, 10, 12, 16 };
 
-static inline int cs42l43_pin_get_drv_str(struct cs42l43_pin *priv, unsigned int pin)
+static int cs42l43_pin_get_drv_str(struct cs42l43_pin *priv, unsigned int pin)
 {
 	const struct cs42l43_pin_data *pdat = cs42l43_pin_pins[pin].drv_data;
 	unsigned int val;
@@ -289,8 +289,8 @@ static inline int cs42l43_pin_get_drv_str(struct cs42l43_pin *priv, unsigned int
 	return cs42l43_pin_drv_str_ma[(val & pdat->mask) >> pdat->shift];
 }
 
-static inline int cs42l43_pin_set_drv_str(struct cs42l43_pin *priv, unsigned int pin,
-					  unsigned int ma)
+static int cs42l43_pin_set_drv_str(struct cs42l43_pin *priv, unsigned int pin,
+				   unsigned int ma)
 {
 	const struct cs42l43_pin_data *pdat = cs42l43_pin_pins[pin].drv_data;
 	int i;
@@ -314,7 +314,7 @@ static inline int cs42l43_pin_set_drv_str(struct cs42l43_pin *priv, unsigned int
 	return -EINVAL;
 }
 
-static inline int cs42l43_pin_get_db(struct cs42l43_pin *priv, unsigned int pin)
+static int cs42l43_pin_get_db(struct cs42l43_pin *priv, unsigned int pin)
 {
 	unsigned int val;
 	int ret;
@@ -332,8 +332,8 @@ static inline int cs42l43_pin_get_db(struct cs42l43_pin *priv, unsigned int pin)
 	return 85; // Debounce is roughly 85uS
 }
 
-static inline int cs42l43_pin_set_db(struct cs42l43_pin *priv, unsigned int pin,
-				     unsigned int us)
+static int cs42l43_pin_set_db(struct cs42l43_pin *priv, unsigned int pin,
+			      unsigned int us)
 {
 	if (pin >= CS42L43_NUM_GPIOS)
 		return -ENOTSUPP;
-- 
2.30.2



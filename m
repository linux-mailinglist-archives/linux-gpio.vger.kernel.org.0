Return-Path: <linux-gpio+bounces-2564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6466D83BEEA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 11:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17015294CE1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 10:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F9B1CD18;
	Thu, 25 Jan 2024 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kEY1zwSB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60E22099
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178806; cv=none; b=kfhMp3WUMR6aRzfjBPn29CZJo73M2BTwLN7bSclMxG50bapC+n8ET4S/1xd5vGP8VHnr70iYy33IH66R5AlffpRTeqJ3Sl1j3+RN6ZQCNa/m66EyeiNeDRAsJb+RLzIvZQMp+vlGmrGPIMEcoie9F+xO3zmTGzP8UDWTmUiQ2jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178806; c=relaxed/simple;
	bh=chzSejzfET32T6MExRy+TyEIxSL7Rh1Il0XzNm7rv9c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmtjcH+C8cJNt1+4w/FXPL3s5ZbLjtaSw6mhWKrnnsFvu2pa1f+u8ktgFcN1N2PWD/RR1dP+aQpLDsfeZ0dQ/EBrBG8roSwlkXZrLfzVWRoNqd/PIYsHf2ErhgviW8qajXxnxraVHEZxe4kcbTp9a7o/XbzzDPugpWfcKusile0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kEY1zwSB; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P5wLQA008959;
	Thu, 25 Jan 2024 04:33:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=/QeOuU99hhn7DP5qgZosWGIMNYI93BB09yMUvBY/K14=; b=
	kEY1zwSBwTu4hgwSyRh0wBIEdKz1kq397OUUXFyJCQY4Oh84RNAj9Wam4svt7qLP
	MVcHOi733utnsukeWJVhFl6aeCLPYmjr1AO8eU5ym0MH/SbOCotLFprxHOCa4CMI
	SpaugIhHkL9YtdxhhCvkSotVBnIp8g0r0xo4iyyYQpmMHXCdWQQjfUDKfTUztwx5
	D9JUyw+fJ88Q5GVWSVE5uJOG9wS6T4P+WXy6eeXba6XafQxyrPAb9T0nna2xGBFm
	NWiq41t/K5Ve7++JygfHK0y36m/VD/wKdrgYmEKeT+hTE5GBrNvxGHB38IkOfSS8
	Ug4xdJkr5eLPy4nxhJuH5w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9t2re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:33:23 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:33:21 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:33:21 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C6037820246;
	Thu, 25 Jan 2024 10:33:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 2/3] pinctrl: cs42l43: Remove some needless inlines
Date: Thu, 25 Jan 2024 10:33:20 +0000
Message-ID: <20240125103321.2622277-2-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: LgD10Ys9-95aIQEK46T9ZC0MM46PlElY
X-Proofpoint-ORIG-GUID: LgD10Ys9-95aIQEK46T9ZC0MM46PlElY
X-Proofpoint-Spam-Reason: safe

Remove some pointless inline declarations, no reason not to let the
compiler decide.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added commit message

Thanks,
Charles

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



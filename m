Return-Path: <linux-gpio+bounces-2708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44B840A0C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 16:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1ED21C222F9
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 15:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A826155A47;
	Mon, 29 Jan 2024 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HNeB45Pf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C074A154437
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jan 2024 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706542304; cv=none; b=LEM9VQ1xiWILebH+DK3YrFEM3MjX4Fu5ePZy2idWhvkKeInrizTvGB1oKCQmscjBrBDntKsjWvzYjUNtuHUUhmwpEHaXLSeK7vugh775y1jBnFTr3aGq9ZWX31vNCYVa0/xiP55ZG6/g5DI+C6mgijXRMZ3p4u8uVjXuyiEBPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706542304; c=relaxed/simple;
	bh=+V7iZF1bUt8ECxI5EV9HH6cERsk3vLmv0/bRF45pGXY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cDLVrt+VMj8KNmdrBVEL6tJ2BW8gO2tTDoa0sqVju2AHMUFTAJG8nc4nK6g21JmMVoWx/YlctPxxnu9XCLzpu22Ja6jbF56U/JxAgArMdmjAy7qf0vc9+eYgS8V/buyH8SSORnupzgH2fKhzxxwVEc/uk70OoA8Yu8sIYeOcGLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HNeB45Pf; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T5fMu8006968;
	Mon, 29 Jan 2024 09:31:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=vmWY+/jhmqFsrWkgefV76QwMAA1N/XimswufTU3NWtE=; b=
	HNeB45PfYa1d3I63Gnncys9qQSXPJjTwqo1Q6Eh8caDsKtAWt5Rsbc8sOhMDbFG2
	oR0ubR5D/odo5BO6JAh/hUT2pNbOOOBq+xe/veImpDoYlLV8wD8LVqRD7rc0SXO1
	5a9ptSKwFhuxPnJgStv5IPCI9HiWxJLNbM500VOaN8uQEPMMyyhw0DXZmSZc+wuX
	iten/1o0O/rGS+gvGJRQbKCkr+19SNU3EtyyXBVB4gSyWHsQDfqlqHAgBn8Nn6Wy
	YI7YPHEjDM0s5U47pUmZWl5mncemh74a91WtFyvnL+j20aFmQdofp/XxQbJcVZ3r
	e3GMWCRE13E4bk5/ugyp+A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nt7v4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:31:40 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 15:31:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 15:31:38 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 78335820247;
	Mon, 29 Jan 2024 15:31:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 2/3] pinctrl: cs42l43: Remove some needless inlines
Date: Mon, 29 Jan 2024 15:31:37 +0000
Message-ID: <20240129153138.3221604-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240129153138.3221604-1-ckeepax@opensource.cirrus.com>
References: <20240129153138.3221604-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: i5P1hEvCYgps4hrYMr1A8dX5NNNMLH8_
X-Proofpoint-GUID: i5P1hEvCYgps4hrYMr1A8dX5NNNMLH8_
X-Proofpoint-Spam-Reason: safe

Remove some pointless inline declarations, no reason not to let the
compiler decide.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

Thanks,
Charles

 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 24e21d1e0d06..ac3df58bbe95 100644
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



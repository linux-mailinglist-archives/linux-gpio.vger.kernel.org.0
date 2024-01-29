Return-Path: <linux-gpio+bounces-2709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A95E840A0D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 16:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B339C1F28CCB
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 15:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B33015443F;
	Mon, 29 Jan 2024 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="E+aK5Kuk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90F153BE2
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jan 2024 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706542305; cv=none; b=TqZaB9puM58KI46shh4UlivIU9yWX1nQPXjMjwZGz8gQQO7JjIKC3ksx328OG5wyJTINDjCbCh7ByhUofJspD3dKlMg+4CUnsVkN/i5uSv5Rh5AcSIDWNI5cRSeK3VrXsTZ3ovkS0CiprWxUORSAmtQrQvGCxvFAYAzDRuUGlJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706542305; c=relaxed/simple;
	bh=O5AzXYIv7qNh7z2Idnp756efMnOmZjvhgPhQJv/z3Lo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPVCXjb5C5wPFv7VnIYx+3QQxzG2oJanSK6IMnwUDO8tn/Z7swRm3nNlAjyad5MPnWyWVfsDMN28noI8B0+M3j3W2HXUok9ABohsUzzaT5ieSQoQH3tBeJyzMJSTMeqgP3ZqxyODPDnRu5i8+ndiE4Cyft3lxkmsQAl7UuOcq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=E+aK5Kuk; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T4qVig031043;
	Mon, 29 Jan 2024 09:31:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=LhpPTyVrGWuvzM/d1AXCKxPRub9zof/YDSOLxPlYd1U=; b=
	E+aK5Kuk2rZpfqrNQwH/UAN0wnOeb/MkqoqsqHnv9vJFchyEUkojRDMERV4h0QN3
	Bt3kOfbrpTmqqHQWa5YjBwtA+WJ/qhJpAVBQeASJ0muTFZ1lffsSVbXHvVBPbd92
	SMpy7Q0CAzAu/ZAv0NA4SQksyHKdFjVjvvQy56NwB0agyJNtJ4+HQliM7IXokmQf
	jt+evFz1eyvVzlgUY3CmsYcrYirSdpNLhdSOZlNQBvh7te7Cr+K7Jr8/3eyRhrYD
	lzHoCtAtqBk4PmextqHlzIzxYjsWaaELbfFGdJGUklmzhELgT9y9Kf+cVJVPmHp6
	ZWwrmpXGgwS1hycZ1n9nWw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vw043t6m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:31:40 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 15:31:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 15:31:38 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7B567820248;
	Mon, 29 Jan 2024 15:31:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <linus.walleij@linaro.org>
CC: <andy.shevchenko@gmail.com>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH 3/3] pinctrl: cs42l43: Use str_high_low()
Date: Mon, 29 Jan 2024 15:31:38 +0000
Message-ID: <20240129153138.3221604-3-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: rpEaC1rKtOmHrJPHIQOEIqTIFZtNSqCa
X-Proofpoint-GUID: rpEaC1rKtOmHrJPHIQOEIqTIFZtNSqCa
X-Proofpoint-Spam-Reason: safe

Use str_high_low() rather than open coding.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Added missing brackets in commit message.

Thanks,
Charles

 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index ac3df58bbe95..628b60ccc2b0 100644
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



Return-Path: <linux-gpio+bounces-30470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185BD17E93
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 964C63012250
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3629D3148DA;
	Tue, 13 Jan 2026 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktrJlZ9J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C271F33F8C5;
	Tue, 13 Jan 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298966; cv=none; b=WsB2tRP0UUttSG4SRv4ZSq/oKMDZzJ2HcXtAQNCcmtYZ+EPlRAkaBJ24GqCtIInN1rgtawzqdd4FNlwVHl8B/6YhfI6YYoaeJTZQoxfyhhFHEqnM5WRURTs+SP3nAL+p1fxpwo/fTX2zyGpQEYvzMA1XJmd6COP9If6YbulTmVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298966; c=relaxed/simple;
	bh=gOVO/+YtO6oW71b+N3o8srvhA4NfR3lVf1MPG+pnCDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl3aTP01v2Bsjtq3x6nAydpPQiO31STG29VV/LLTr98k+fi8c/CMSKkmPCxUNepb+Z+pwsAhlcbvM/tvuMLbIHvhzEfcAA7u+Iv2PEAKE3UM0Cmi2fTnEYnl0ofB4z6IeVmDTib2KiaZmlXAtROykfh1VBaeZeX0jCSBKcqN0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktrJlZ9J; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298965; x=1799834965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gOVO/+YtO6oW71b+N3o8srvhA4NfR3lVf1MPG+pnCDk=;
  b=ktrJlZ9J5+4RzGnRPb7UA9EIqAannJgC520Fp4r9/PZeKwbWdPuEeZFY
   qyK1OvUQWmlKnYHUNMp151Zk/cXKCm7v/8A9dQs/tDGf85YW9U70mqY8t
   aEOCSTQhhwyEUZPtt+59ite4+SeFYKxdLoXtDMdNH5xw5Y47SOTk+xNo+
   JOlz/UT4r4fQQ8EJimqWsXheTqK3mJo6PhbKP2Y4aD9TrxUBQbXYaNrLK
   UGdSVt0qWgx6mQyk2UpqPNLQ0OIW4IPw1YdP0WMsEI+6VJeRqmKojMq/B
   pgDTt3U8Q38ZGKTDuHvOOoFRGdrENktShgMypU5xrJ1F6sOTfmaIHTSOm
   g==;
X-CSE-ConnectionGUID: f70ISQsfQN6tNKdBTwRoMg==
X-CSE-MsgGUID: V5cAJqjoSwafpx2YQ8WLMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69637701"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69637701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:09:19 -0800
X-CSE-ConnectionGUID: NGYg8ULSST+xL5NPqTUVdg==
X-CSE-MsgGUID: 1dR9L7+aRMS7L2Z98jFGag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203555916"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 02:09:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3282B99; Tue, 13 Jan 2026 11:09:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 1/3] gpio: pca9570: Use devm_mutex_init() for mutex initialization
Date: Tue, 13 Jan 2026 11:08:04 +0100
Message-ID: <20260113100913.136777-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com>
References: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace mutex_init() with the devm_mutex_init(), to ensure proper mutex
cleanup during probe failure and driver removal.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca9570.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index c5a1287079a0..eae35135c71e 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -115,7 +115,9 @@ static int pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 static int pca9570_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct pca9570 *gpio;
+	int ret;
 
 	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -132,7 +134,9 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.ngpio = gpio->chip_data->ngpio;
 	gpio->chip.can_sleep = true;
 
-	mutex_init(&gpio->lock);
+	ret = devm_mutex_init(dev, &gpio->lock);
+	if (ret)
+		return ret;
 
 	/* Read the current output level */
 	pca9570_read(gpio, &gpio->out);
-- 
2.50.1



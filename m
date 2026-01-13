Return-Path: <linux-gpio+bounces-30480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B126D185D8
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B89393011B23
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F8A387575;
	Tue, 13 Jan 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VunshZmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0913806B8;
	Tue, 13 Jan 2026 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302722; cv=none; b=jh3fQFcn2KynBUht92Qn32sKFvCKU9XkiIwZd+ACQo9iD+YdIHWVl2Lbn//NgdSbkNDX6vJG7dn3tXapxPWicav1MXZE/tyhGID5Loi2cLIUyQB3lPlen35Gh5M71wm2TwpXsPjt6LHn0S8dtEQ8ELEblgMrSgEAfyfxqszbsoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302722; c=relaxed/simple;
	bh=9KR8a8EWwtSCrpChYsxZtwYb01R33dBd4BXP88bOzis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utv9ZdcqOlm6z8AsXIC5zUa3EL5PHSTFUgcSLgyEDve2LsEDgruFOY7aEx5SRQwidec90M7wKxrKTRXB0iElMG+AymFN1R/h9cLCGu+NY7XOE6w1+iqdIbpEI/ovdnEfMpE09bUW7jfJ4vzZlsAJ7pf2Zby2aGud6ZfVqevXU00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VunshZmN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768302721; x=1799838721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9KR8a8EWwtSCrpChYsxZtwYb01R33dBd4BXP88bOzis=;
  b=VunshZmNsbsXh40nrPx1MKGqjuEnLqunrzkrnNOzwlujNmhBLm76+Tsb
   hRK53AY1zSGgqRIxd4U7E7y/FsFyChseYxN6/sT4lz2vKTUR6ULqa++JX
   zvvVGiv2qlvqPbvld8CQAoIPS5VzaLlOqd8EXGpiBlmS42vyTVXqQLaui
   dk8xuIn3mE7vGIFeUuyRPCFMkzge3O+7MZqniPcq47p+9ivanXXiEk1em
   1XN4SwBrwwT8zJO0D58H2HlzVz9gCUPE5gAq2lOj66BYIdmVwjA0VPBgT
   wefxUOfOwAmgisBg43VRC5B8DCx+q8PtxsIu9OaUHk4GtPH+bH1xlCy3q
   Q==;
X-CSE-ConnectionGUID: 1ddqgCfoQ16njq4scfkacg==
X-CSE-MsgGUID: jnyQEDn7S7aQ03FqkzpIjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69317382"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69317382"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:12:01 -0800
X-CSE-ConnectionGUID: aTxu/0rETcufZbP23+1SEw==
X-CSE-MsgGUID: x2SzvLkqSZG0/BxZMAyKMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204965218"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 03:11:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3A2E299; Tue, 13 Jan 2026 12:11:57 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v2 1/3] gpio: pca9570: Use devm_mutex_init() for mutex initialization
Date: Tue, 13 Jan 2026 12:10:52 +0100
Message-ID: <20260113111156.188051-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
References: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_mutex_init() since it brings some benefits when
CONFIG_DEBUG_MUTEXES is enabled.

Reviewed-by: Linus Walleij <linusw@kernel.org>
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



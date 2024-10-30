Return-Path: <linux-gpio+bounces-12309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA029B67EC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 16:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E131C20B92
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 15:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF2A213EF6;
	Wed, 30 Oct 2024 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNdGOsDt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69401F4738;
	Wed, 30 Oct 2024 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730302330; cv=none; b=SdDDWIJtVVytC2sqBDcxslQAF7gBIGseiERdjXHGVv7ZeSN2BEjxzlDlYShyVAbqeCS18Y+kxF9zv3xWsDzjAMtap/4UajlGRd88700zGgFOC++MZULm5F1u8n9KonHqOG5cFRjgmzCq5h5n0f3wldNRl2qdYOxdyEIVDn3VTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730302330; c=relaxed/simple;
	bh=Espd9A6FO3Obk0zAkvp6qR5Nh3+IenL+AHa+mvmmXf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVoY5kbU66wgSZCUEyGoroYICiPKMOdT8JSZM3tyFikZA8Wn39PDeJVRqqGiyZnJx4EfDmYj5dr0X5jyR9VRLDI8XXfLGBKNTp+lTdwkaEisVqI/RDFqqLGmElUBEHzsdj2Ez3t+UZm+8tVwgnsVfu4heLxJZsx9Lfb6NsCBPnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNdGOsDt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730302329; x=1761838329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Espd9A6FO3Obk0zAkvp6qR5Nh3+IenL+AHa+mvmmXf4=;
  b=JNdGOsDt5JfHJeg0bc/dmKHv7wI3FHxL3EUAghmKrQsM9GI7Tl+Qx80O
   osfag/X3y1KQ3Qg4dyWymXp/Um0QlcQZR4efrI1X1rs/E5rnCsRx9Posk
   X8R74f4APtXuWUdhY2FKsdsGOLHo5JTO3Id8pIGF3J20/eNlkfIqg0AU+
   0G4v241wJz1fTS+j2+bHyQZ28K79uI9+1q2jCUK+Uy+Rua48tHCB5AjM6
   DPxIChlXR7PAJo8VWb1I3f1Py8/LNb1e41MkKOBFRjdVfXO1HxaP30YR9
   Rs9jjeeWhKGeUJTJXfeaX+a6RT3MZFxI8sQxJQYfwCSNdVX7+QucbIRVb
   g==;
X-CSE-ConnectionGUID: MEo1rujSQ0q086ldahx05w==
X-CSE-MsgGUID: BPw9chXhRZadFjk1Dgv54A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33699868"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33699868"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 08:32:06 -0700
X-CSE-ConnectionGUID: 54MBBOPQT+qQtlEwvbBsww==
X-CSE-MsgGUID: DOt4cGQtQ9OxA5AcEJBVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82514081"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 30 Oct 2024 08:32:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 789301CF; Wed, 30 Oct 2024 17:32:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/2] gpio: mpsse: Check for error code from devm_mutex_init() call
Date: Wed, 30 Oct 2024 17:30:26 +0200
Message-ID: <20241030153201.2078266-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241030153201.2078266-1-andriy.shevchenko@linux.intel.com>
References: <20241030153201.2078266-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something. Add the missed
check.

Fixes: c46a74ff05c0 ("gpio: add support for FTDI's MPSSE as GPIO")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mpsse.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 3ab6651d2226..8fba0779ae17 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -430,8 +430,13 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	if (err)
 		return err;
 
-	devm_mutex_init(dev, &priv->io_mutex);
-	devm_mutex_init(dev, &priv->irq_mutex);
+	err = devm_mutex_init(dev, &priv->io_mutex);
+	if (err)
+		return err;
+
+	ret = devm_mutex_init(dev, &priv->irq_mutex);
+	if (err)
+		return err;
 
 	priv->gpio.label = devm_kasprintf(dev, GFP_KERNEL,
 					  "gpio-mpsse.%d.%d",
-- 
2.43.0.rc1.1336.g36b5255a03ac



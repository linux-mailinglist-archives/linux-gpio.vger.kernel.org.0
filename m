Return-Path: <linux-gpio+bounces-10820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F0898FFF4
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C11F282338
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC28146D6E;
	Fri,  4 Oct 2024 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGNHvgYk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103814885D
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034881; cv=none; b=l/1C+fGLBkrGg1JcVXaqDXaR5hhgIn1uhwBtJqO4gLf71GzQw3nq3QYbQfTwoPmXqbJWnCBCBlLKJy2V9OGROxgPTabJTFWPlWXjPbv2lgJzchxBxEe5/LnBQ4f0I8ytBFbhVMq6GN2UxTd+ExDCBViS4A8W7EwF1uj1PVpCFg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034881; c=relaxed/simple;
	bh=H/LNfJYPHkWm5hS7kJVa/kTkQVVjNVnSfXrcdGV+mTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hLfFuvgeY8oEsQccA5Q+AatVqHQ2cs2xx53Yz9in7KXFv35SiOXr1GLqRWyHzAsPbSeHIyneEwYO+Y3iiIRzb5U+mYX3K5gnFG+zFbQvUmSctJvi9RVQGniGi6CT2YS+9DnAa+jhPARpt0uGMGS6JCnU5JCFRx52es/dWtlnmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGNHvgYk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034880; x=1759570880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H/LNfJYPHkWm5hS7kJVa/kTkQVVjNVnSfXrcdGV+mTg=;
  b=jGNHvgYkdeSQOrck91+sGSiEiTEVVhyVLVs9hGdmVlLldwGIrD9KmMrs
   W5lsQMDi6OnsttKCAjFQ9iTPtg71YurJRGcwmB64v6XprSDxa7gVY4P8j
   47gzrl8izMX9eSO15T5vJdqeDtxSTtgT//6jBFMnEC6BsELc1w3i/9PSz
   /i+EZV8IGV2nYALXkP+poB6warclUqzKijB0tjZe4qi9CVdo8NcKoZiMY
   sGRcR0N3Hu99ruGfFMXD4L4bFaKO9E19aTZFUahQhFxW+MU8nwA2sw992
   yUcty06G1xAlvpx5nGiLcCF8o0LjpYVe3mWre0wNw96S+mCVCGw16SRfE
   g==;
X-CSE-ConnectionGUID: owMnGxpnRt+lIcoJHq4h7w==
X-CSE-MsgGUID: 8bCI5hlWRVqkN+LCZCSLWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856192"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856192"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:18 -0700
X-CSE-ConnectionGUID: YzaQ5H/qQTS11fl+wtFuwQ==
X-CSE-MsgGUID: R4I+DrO8QXi1u0cghdDhhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331924"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 326B0120E06;
	Fri,  4 Oct 2024 12:41:12 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoC-000TWf-0c;
	Fri, 04 Oct 2024 12:41:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH 08/51] gpio: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:12 +0300
Message-Id: <20241004094112.113487-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpio/gpio-arizona.c | 10 +++++-----
 drivers/gpio/gpio-mxc.c     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index c15fda99120a..692983da7949 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -40,7 +40,7 @@ static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 
 	if (change && persistent) {
 		pm_runtime_mark_last_busy(chip->parent);
-		pm_runtime_put_autosuspend(chip->parent);
+		__pm_runtime_put_autosuspend(chip->parent);
 	}
 
 	return 0;
@@ -63,7 +63,7 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 		ret = pm_runtime_get_sync(chip->parent);
 		if (ret < 0) {
 			dev_err(chip->parent, "Failed to resume: %d\n", ret);
-			pm_runtime_put_autosuspend(chip->parent);
+			__pm_runtime_put_autosuspend(chip->parent);
 			return ret;
 		}
 
@@ -72,18 +72,18 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 		if (ret < 0) {
 			dev_err(chip->parent, "Failed to drop cache: %d\n",
 				ret);
-			pm_runtime_put_autosuspend(chip->parent);
+			__pm_runtime_put_autosuspend(chip->parent);
 			return ret;
 		}
 
 		ret = regmap_read(arizona->regmap, reg, &val);
 		if (ret < 0) {
-			pm_runtime_put_autosuspend(chip->parent);
+			__pm_runtime_put_autosuspend(chip->parent);
 			return ret;
 		}
 
 		pm_runtime_mark_last_busy(chip->parent);
-		pm_runtime_put_autosuspend(chip->parent);
+		__pm_runtime_put_autosuspend(chip->parent);
 	}
 
 	if (val & ARIZONA_GPN_LVL)
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4cb455b2bdee..ea7e7d28aa19 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -520,7 +520,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
 	platform_set_drvdata(pdev, port);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
 
-- 
2.39.5



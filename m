Return-Path: <linux-gpio+bounces-15957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA21A34ED5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D093ABA43
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E908C24A06D;
	Thu, 13 Feb 2025 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwEulxT+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3838824A04C;
	Thu, 13 Feb 2025 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476587; cv=none; b=dE2xVmCpMc20RC0SQXXsjIpNovy3JwIv4X1DIfqXMb8pO9Rdl7oJDhh5gJu3G/PW975LNTTcqVNpzvEBYEpz/njsz4Mwr2B70sr+iXIvG4oomkX/9GTA1I+YJoJDN5QMlkRZ4Aqdoq3T9W+lMTrRnBe+bkXSwU4J7iDN1o6hoFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476587; c=relaxed/simple;
	bh=3SdugL5iTLTHLtxG9CDRWvnEvj74QRJ9r6nUGkd2tRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHf4eLMzoN+TP8gEa4Ui3ZTDJ7fnfmuJkh9015tLTT5SZvVyUgwVz7v6UtCJhdNDCJYTw1Oc73PhDbF25qzSKSF6jzWMK98zYvA/1295LCogRIi7MMJDWOKNHqcnUTiyHHIsLlNPjYnZ4pIlipz+A/2uPp6x+VrIMa/Y+GaXSn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwEulxT+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739476586; x=1771012586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3SdugL5iTLTHLtxG9CDRWvnEvj74QRJ9r6nUGkd2tRc=;
  b=nwEulxT+RrH4e51rLvbbb7ETtej7Eqqvp/KdxnOVgBmS3kJ9QkTgM5w8
   /4rMgGNO/Hf2QNzVje7QS9JvKqVDa/ycGJJAaMXuh2opSHqAabCm805+Z
   o6AFjxdawKELsqO2gWlsl++AYwthKnhnb9vqLECeExrIbl+EYu5kg+qTU
   5e9rZNR+nwUIdiFCJ26Z7a4NbAAYz+UBvHlnYXqCCy2WOZy7z7hff7mdb
   MIlQoS4cpT9LcF+I3O0Kr+U3t6dvDEPiw0W/gYsivhSyid26CUCDeGSkK
   owIriWv3+YOdjF9gXiD1FHSdgxFgIql6leXwol9q5pyt+XV9hNTIkTOv0
   w==;
X-CSE-ConnectionGUID: pPflms1QQI+R2b8ykYpZmg==
X-CSE-MsgGUID: b5SxgA/mRu+6Y4tdQP/Cww==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40078530"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40078530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:56:25 -0800
X-CSE-ConnectionGUID: L/wvlg1cQmWzSjHqq1JkNQ==
X-CSE-MsgGUID: OKM3m+yzSi+qlOq9CB5nDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150421158"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 11:56:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 139BB2CA; Thu, 13 Feb 2025 21:56:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v1 2/5] gpiolib: Use fwnode instead of device in gpiochip_get_ngpios()
Date: Thu, 13 Feb 2025 21:48:47 +0200
Message-ID: <20250213195621.3133406-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpiochip_get_ngpios() can be used in the cases where passed device
is not a provider of the certain property. Use fwnode instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0f93aa7736c6..0ede5e3eecfd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -900,11 +900,12 @@ static struct fwnode_handle *gpiochip_choose_fwnode(struct gpio_chip *gc)
 
 int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev)
 {
+	struct fwnode_handle *fwnode = gpiochip_choose_fwnode(gc);
 	u32 ngpios = gc->ngpio;
 	int ret;
 
 	if (ngpios == 0) {
-		ret = device_property_read_u32(dev, "ngpios", &ngpios);
+		ret = fwnode_property_read_u32(fwnode, "ngpios", &ngpios);
 		if (ret == -ENODATA)
 			/*
 			 * -ENODATA means that there is no property found and
-- 
2.45.1.3035.g276e886db78b



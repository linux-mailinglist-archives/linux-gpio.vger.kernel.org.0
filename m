Return-Path: <linux-gpio+bounces-15959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE41A34ED2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE15016D4E6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A137424BC12;
	Thu, 13 Feb 2025 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QT3gjq7U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA86324A06A;
	Thu, 13 Feb 2025 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476589; cv=none; b=E5DDIM/nnShWj2ktudcNzkncKe7QvfG9UOMzlAkcdGhU8058WA3eWyL68bEXaPoKO6Ei+2tCNhh+amoztbuWcinMIhzqTP0H4PDu1b4787Wfty/xKg5L6zos3EiqckD+F/cFZSd70cj7lXEdBJiX0d1/JxKYT0IZQhZe3canQac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476589; c=relaxed/simple;
	bh=m3vAOwp3v5jm9IYwxdobl1MmrutpXhEMoaFY6XPFJXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOYDAix5b+SZOSioVTA+Ejyj21gfmayp1/BWGSVemvtZq4kFHpO303LvC9Yd7DEhu3PFPPMakdmZP7X5Jgec37LyjCFB4m6MDWHcF/bfTw9Pa4LcPJCB03+aQlVAze5ERXyXLh5oDBxUFkAltR9YKrmiN1IaG/qKhaDB1k02Ly4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QT3gjq7U; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739476588; x=1771012588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m3vAOwp3v5jm9IYwxdobl1MmrutpXhEMoaFY6XPFJXE=;
  b=QT3gjq7UP/Lp8qMesemL14gZebmdmBA9TAed+ghQ9hLCwa3YCZFWGq5G
   e5fnK6sYKxIvVAcvhFzprPATpC1p+BV3z9NgPVJj3+y/6qFNsJvKVelSt
   R+Aqx/p9ktlTE4VJGk92fiizDPgMhknUNvQktb0AmcLksLwnUqee9MCin
   UQsWZxoWf2jWRdA7T5OtyzlDQqM4XEoYurPB5Qpw59luQLHCFtbbhkE9K
   BZRGLnaamwXXiB52Wrlze77lBBRHl7kDwX6ihdfEcM62sNM/UMjwXwOsU
   yCqAdVI0HU1X0h+ARgXpXfWnzjq0LPGgl0RDJDizz7eu4qNMkrAjjS5iy
   Q==;
X-CSE-ConnectionGUID: /A1GEE69QSyowFGCJ+XTHw==
X-CSE-MsgGUID: g1vUj12cTIWnYyWCRPxC1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40078534"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40078534"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:56:25 -0800
X-CSE-ConnectionGUID: kMwpz9emSkW/rhtm30yPnw==
X-CSE-MsgGUID: WTPqt1mdSlCxQaUOdZKBgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150421159"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 11:56:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F305A1F5; Thu, 13 Feb 2025 21:56:21 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v1 1/5] gpiolib: Extract gpiochip_choose_fwnode() for wider use
Date: Thu, 13 Feb 2025 21:48:46 +0200
Message-ID: <20250213195621.3133406-2-andriy.shevchenko@linux.intel.com>
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

Extract gpiochip_choose_fwnode() for the future use in another function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d6ebdb2f2e92..0f93aa7736c6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -883,6 +883,21 @@ void *gpiochip_get_data(struct gpio_chip *gc)
 }
 EXPORT_SYMBOL_GPL(gpiochip_get_data);
 
+/*
+ * If the calling driver provides the specific firmware node,
+ * use it. Otherwise use the one from the parent device, if any.
+ */
+static struct fwnode_handle *gpiochip_choose_fwnode(struct gpio_chip *gc)
+{
+	if (gc->fwnode)
+		return gc->fwnode;
+
+	if (gc->parent)
+		return dev_fwnode(gc->parent);
+
+	return NULL;
+}
+
 int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev)
 {
 	u32 ngpios = gc->ngpio;
@@ -942,14 +957,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gc->gpiodev = gdev;
 	gpiochip_set_data(gc, data);
 
-	/*
-	 * If the calling driver did not initialize firmware node,
-	 * do it here using the parent device, if any.
-	 */
-	if (gc->fwnode)
-		device_set_node(&gdev->dev, gc->fwnode);
-	else if (gc->parent)
-		device_set_node(&gdev->dev, dev_fwnode(gc->parent));
+	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
 	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (gdev->id < 0) {
-- 
2.45.1.3035.g276e886db78b



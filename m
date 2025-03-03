Return-Path: <linux-gpio+bounces-16966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA2A4C8E4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 18:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41321179106
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 17:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE71D253F3C;
	Mon,  3 Mar 2025 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xy0QtwKE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B969253F24;
	Mon,  3 Mar 2025 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741020576; cv=none; b=Fl6Q4O9nmv6qP2sObo5LAS1aZfuBiOMZA1WwrBZubLHnNhbtO/UgXfvWvAZ2JuoaAFSQx6sxzE/YnVpB1weutSGbQw0PjTbA7DBlEo8WIc1AFF4FPUAtdxC6rBh+qkpeim4wF3nQEGaBeFmDVPgs0NK8V8YjLFmgKm79+3dETMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741020576; c=relaxed/simple;
	bh=PgymxrapIwEkqIJnDFsAgZKjAOuBSrz6G8oyvNtMtgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7vgM6JpQ7bDgTwQNCIM+iOj9H14UiAqTGy7bbyCUMuGqkbYGxcx2PN7bzeQTcBNJQ/ZtQrUK2FTs0Hak1c14bKOyWaFCN7N3QcHbcrvqtq8cmWzcWiTR43kZb2ox0VHnGruHvu0k0gBMHJOy3ANEYC92uQIIS1vMhxxWwB7XdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xy0QtwKE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741020575; x=1772556575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PgymxrapIwEkqIJnDFsAgZKjAOuBSrz6G8oyvNtMtgE=;
  b=Xy0QtwKErWR86mLuXz237W1dv1xLaoDTSdgbw0IYqSQQMEhom+EbArQx
   p/1jGazZ5YMJEmLOHTv14kfVeU4DEcAU++n2VGhv8ON9F2wFOR4T5sHZc
   TD9DjwR2x0HsGOGrX8S08qyxwP4G7V8tGk4lSSh8IIR42u1WkUrwFoPxf
   s6ssbNpHsZ9Z7NZLRLwPuHAwTaFHoJK0UgNsSbGdgnfbO2YaS+HMGE+mv
   zZGmFY/IVjuh/kp99M+smU3WZdvmb5DwcPOQ6tbiOXGApT2LDVqHkbBRG
   B8k/92L0q1PPCRijhxbdzygK83xrVtT4+UxsUPWJv84EzH4OEJRNG/HjV
   A==;
X-CSE-ConnectionGUID: FwRlmoF4Q1empaeOKODJ6A==
X-CSE-MsgGUID: xAiP2uKNQSKLADbw0zmbUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41761391"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="41761391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:49:34 -0800
X-CSE-ConnectionGUID: rGlG1Fp1SLiLANdqv5KXaQ==
X-CSE-MsgGUID: XzTS+SNlQoe7unm3L7cOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="123212197"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2025 08:49:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A7309224; Mon, 03 Mar 2025 18:49:29 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH net-next v2 2/3] ieee802154: ca8210: Get platform data via dev_get_platdata()
Date: Mon,  3 Mar 2025 18:49:09 +0200
Message-ID: <20250303164928.1466246-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Access to platform data via dev_get_platdata() getter to make code cleaner.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/ieee802154/ca8210.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index a036910f6082..65f042c8734b 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -627,7 +627,8 @@ static int ca8210_spi_transfer(
  */
 static void ca8210_reset_send(struct spi_device *spi, unsigned int ms)
 {
-	struct ca8210_platform_data *pdata = spi->dev.platform_data;
+	struct device *dev = &spi->dev;
+	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
 	struct ca8210_priv *priv = spi_get_drvdata(spi);
 	long status;
 
@@ -2736,9 +2737,10 @@ static int ca8210_config_extern_clk(
  */
 static int ca8210_register_ext_clock(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
+	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
 	struct device_node *np = spi->dev.of_node;
 	struct ca8210_priv *priv = spi_get_drvdata(spi);
-	struct ca8210_platform_data *pdata = spi->dev.platform_data;
 
 	if (!np)
 		return -EFAULT;
@@ -2784,8 +2786,9 @@ static void ca8210_unregister_ext_clock(struct spi_device *spi)
  */
 static int ca8210_reset_init(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
+	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
 	int ret;
-	struct ca8210_platform_data *pdata = spi->dev.platform_data;
 
 	pdata->gpio_reset = of_get_named_gpio(
 		spi->dev.of_node,
@@ -2813,8 +2816,9 @@ static int ca8210_reset_init(struct spi_device *spi)
  */
 static int ca8210_interrupt_init(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
+	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
 	int ret;
-	struct ca8210_platform_data *pdata = spi->dev.platform_data;
 
 	pdata->gpio_irq = of_get_named_gpio(
 		spi->dev.of_node,
-- 
2.47.2



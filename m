Return-Path: <linux-gpio+bounces-17027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E784A4DC74
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B103A16CB7A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326BC1FFC7A;
	Tue,  4 Mar 2025 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqAWuFX9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6401F76CA;
	Tue,  4 Mar 2025 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741087472; cv=none; b=MWdu7/7Nl4IbQjn+KZFiTjyIrAUMC0aVnfPkzrwx96hTBFa2/oPyTkxZ/gfcZh14laOyitClOHpGG5ZuXYJJd8e+hW6j7wRoYZAOz2AnF91V13BOnR6TJAg19fJ9GX4kUi8h4ijj6dO6m6ms+XCNQfGrfZXQr0ensubVhlgPxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741087472; c=relaxed/simple;
	bh=Y2DxWO9SVL0K/7sX3lxmLJs8FOiKJR3NxXXhMoLiKJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JReww7a5vUQ1WY5b1SCL79dc9tHOVoV4iO1It25uqFg0HXrO4ppXEI1wDfxb/U9xKp7HpkYplXF2Z4+H690kouj/08uAf9YvoTbQZ9rfOPgo5cWUeeFgUJ0uf4xo1KT69kh3y2SmVIJTl+SqA/4CSOOTlaQMGSAl4/n1MzhtXgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqAWuFX9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741087470; x=1772623470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y2DxWO9SVL0K/7sX3lxmLJs8FOiKJR3NxXXhMoLiKJc=;
  b=MqAWuFX9AYl9ZD7knN9CqfkwXcSbuR2qxDX+KBwQSP24474bsoSS+i9V
   hMts8SrgRi/2oME8eWJrgIubKuymzHHhbvH026LU7MZUbeWkd7MqR+L2m
   WCTIsfncDKeJtIpt5Xy7UwJ6opHUJa7/OcdBJGq17nt/z67fsUTE21IEz
   w/oBbYUNjoed1Q58VNf9xR4rAD4jxLbO30IJxfkUoKXQJEKAysOj4HBmD
   jB/5SDGXUNQg3kDqV4zwrTqMuyAYdeL1DRQe+j36fLM0M57CtEHEzyACj
   uskFN4XQggCnLs+AjzIUZTgqsLofjHHEv57ueqBiFDZxR+EkHTNfGhjbu
   A==;
X-CSE-ConnectionGUID: cAobLMqZREWqzuhL8KaTLw==
X-CSE-MsgGUID: mawijh+MT829wOQGq3ZIsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41897781"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41897781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:24:28 -0800
X-CSE-ConnectionGUID: LdB/A1NSReKZHTHpV5dU/w==
X-CSE-MsgGUID: 8Zz1XeKEQ5mXYswW7WMnJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="141578427"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2025 03:24:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E67022EF; Tue, 04 Mar 2025 13:24:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH net-next v3 2/3] ieee802154: ca8210: Get platform data via dev_get_platdata()
Date: Tue,  4 Mar 2025 13:22:33 +0200
Message-ID: <20250304112418.1774869-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250304112418.1774869-1-andriy.shevchenko@linux.intel.com>
References: <20250304112418.1774869-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Access to platform data via dev_get_platdata() getter to make code cleaner.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
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



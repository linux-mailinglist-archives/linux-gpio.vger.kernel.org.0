Return-Path: <linux-gpio+bounces-17105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE73A4FCEE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1E041886A50
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43DD221F2F;
	Wed,  5 Mar 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmyNqYFm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B03212FBC;
	Wed,  5 Mar 2025 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172225; cv=none; b=CKYXezlR4V1JjKDwwmguAhyhwktB0O9yP6bBzZV0TzpjBXbwo+P8g9cMAb6zXiBwQxTv4CkTjCLNox0yZDmlUqbP/oWjdnx7f4kt+8xeSzSW4ik3zqavPl1kZXrESar+PhIOPedTVkNv5qpmrxmE57haZ/JJrqDkhNjdCMcsgts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172225; c=relaxed/simple;
	bh=Y2DxWO9SVL0K/7sX3lxmLJs8FOiKJR3NxXXhMoLiKJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJ7HQFasdqBUpIkZFFHS9K3LEi/iVyjB/8mOArrGYvcdCC45NDYK2L6XXVLgTUD2TIrjBy8+HANSSimQc33HSKMwTdeR258J1A9tsjjyKiDikB/LKzn11/2YbIbvZv+h6dQduBXC+AgF6/uv+qn1B03DOIX5fzLoywL5u3czOFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmyNqYFm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741172224; x=1772708224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y2DxWO9SVL0K/7sX3lxmLJs8FOiKJR3NxXXhMoLiKJc=;
  b=UmyNqYFm8R0idLSBQ2Q6X+K4VtPAHulO0dhdCPVBENnGWSWv4FAvjZIh
   FLTqBkXpod08hTKE16xP/kEeDGP89b1sI18zXPJ6DJMme8aURmrzgSjpP
   A6zQ1ymquzmRmNTbyBroBalR1r1VCqdh3lqiH/S49PzSEKEJnBoZlyaje
   8ELD90qCk+07GdRlrot3TI4b6FbZYskyWO3KXd3a2WcZKvYYttoxUj64t
   YdVxxOvP0P96s0Y4EmPZJaQlxPBRDjQtgKyWBVTzj/I4BmZvW/w8EDYsP
   u9CDCBey3k8vL6xN7fm9cKYalbtkvkI09WpScmu4ifsC9LkoeJjUjO0qj
   g==;
X-CSE-ConnectionGUID: sXnWUcU6TLKpxEyY2tyhzw==
X-CSE-MsgGUID: FiNIwXSwRqSVeAyv8bSyLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45783897"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="45783897"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:57:03 -0800
X-CSE-ConnectionGUID: xLex4o6FRe+ZXqdDwTS+Zg==
X-CSE-MsgGUID: upi6mBhWRgujJF6ntR6ceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123245746"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2025 02:56:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 93305296; Wed, 05 Mar 2025 12:56:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
	Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH net-next v4 2/4] ieee802154: ca8210: Get platform data via dev_get_platdata()
Date: Wed,  5 Mar 2025 12:55:35 +0200
Message-ID: <20250305105656.2133487-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
References: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
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



Return-Path: <linux-gpio+bounces-13479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5560E9E33CC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2040E284F94
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAA7187848;
	Wed,  4 Dec 2024 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADE6hQCe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E2418A931
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295865; cv=none; b=ZhrwN1oNGVET4u+UCR2pRa1GrrB0wvpwn6l96vJ/InStTopeBtI5JVwAlox4lhwZXiiR0XMGAvdUKwq8AFHpAau4iVMtiY8qaxwkcwOyb0PuWlM1MFszDLP1EZY6HVSAQLKYISYrjzWJpwKx1JqA1IIR3n/ES0sRrYlCYnsoPCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295865; c=relaxed/simple;
	bh=CHGFAOnFoD0EIBIZTv8JHBvhspTQ+CHXPfquXVOJaBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7Fr24+AKD8LNpOjHnfI9D3zD+kT3pAQ5i/FERuEF1xuEk7hd1p6SIYZboXn+0cKFeLj6wDiKvLGiP2VXg/7AwgHPQSeK/MCCoIuzCzSFgpmtug1yg7cUxPafdQpVm3zP4XwOa3w61rFasgp2DN5Qm5OLg5Df/olBSU9PfZDEyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADE6hQCe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295864; x=1764831864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CHGFAOnFoD0EIBIZTv8JHBvhspTQ+CHXPfquXVOJaBw=;
  b=ADE6hQCe4VEEnXOIrC9NGOzh5Vq2x5HTftpYnhtml1YMzxFb99Uduy+k
   Dm3KRHCQuHMb+WEqCiXE+/H8sumG68ucX6/fZA09KrJHr17k/2nPGudIA
   0aYYIVJjRh7opL02PdGeyIEkb6v+C3tdf7GuXT5TVPH3HHzpQBYvMqrjv
   Czhu8FGU9gAc8sSW+WF7PuhoJzhe6KN+xNNyVc4QAnUpZOyumZRG9lFhk
   wG0AnbwgWy6GB07/FUM8K4ENm3I3icUgP8m4Tuu4K1xsQrHVSArPG11kj
   fl8EKn4ALB6H4ezDO9IoOr5IhAj27dp7sbFljE9jZI6eHK9R8n+iPAjN5
   w==;
X-CSE-ConnectionGUID: 4/QDMjjXQPeMtxom1eBIWg==
X-CSE-MsgGUID: 8AcLwzUgSCeUhVL+p4PBUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44022844"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44022844"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:04:22 -0800
X-CSE-ConnectionGUID: Ndrz+sIyTn+vkm8eEAgzhQ==
X-CSE-MsgGUID: whYFQyt8SU6ODnhluq4aqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94104204"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 23:04:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 519CCA86; Wed, 04 Dec 2024 09:04:16 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/7] gpio: graniterapids: Determine if GPIO pad can be used by driver
Date: Wed,  4 Dec 2024 09:04:13 +0200
Message-ID: <20241204070415.1034449-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
References: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Add check of HOSTSW_MODE bit to determine if GPIO pad can be used by the
driver.

Cc: stable@vger.kernel.org
Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-graniterapids.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index ec2931a65723..b12abe77299c 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -37,6 +37,7 @@
 #define GNR_GPI_STATUS_OFFSET	0x14
 #define GNR_GPI_ENABLE_OFFSET	0x24
 
+#define GNR_CFG_DW_HOSTSW_MODE	BIT(27)
 #define GNR_CFG_DW_RX_MASK	GENMASK(23, 22)
 #define GNR_CFG_DW_RX_DISABLE	FIELD_PREP(GNR_CFG_DW_RX_MASK, 2)
 #define GNR_CFG_DW_RX_EDGE	FIELD_PREP(GNR_CFG_DW_RX_MASK, 1)
@@ -90,6 +91,20 @@ static int gnr_gpio_configure_line(struct gpio_chip *gc, unsigned int gpio,
 	return 0;
 }
 
+static int gnr_gpio_request(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct gnr_gpio *priv = gpiochip_get_data(gc);
+	u32 dw;
+
+	dw = readl(gnr_gpio_get_padcfg_addr(priv, gpio));
+	if (!(dw & GNR_CFG_DW_HOSTSW_MODE)) {
+		dev_warn(gc->parent, "GPIO %u is not owned by host", gpio);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 static int gnr_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	const struct gnr_gpio *priv = gpiochip_get_data(gc);
@@ -141,6 +156,7 @@ static int gnr_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio, in
 
 static const struct gpio_chip gnr_gpio_chip = {
 	.owner		  = THIS_MODULE,
+	.request	  = gnr_gpio_request,
 	.get		  = gnr_gpio_get,
 	.set		  = gnr_gpio_set,
 	.get_direction    = gnr_gpio_get_direction,
-- 
2.45.2



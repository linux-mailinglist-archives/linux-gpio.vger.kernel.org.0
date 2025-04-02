Return-Path: <linux-gpio+bounces-18170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716BA78E23
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 14:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A01223AB883
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 12:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F11239597;
	Wed,  2 Apr 2025 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wln9Nji0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F51239082;
	Wed,  2 Apr 2025 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596467; cv=none; b=IbGz6quupazIL/bgAT1KtBk9NB6JYl7iuEFUHWkJnJiVzpZjPwTAzg6qysA+X3n1exwzQoqWT+L0UJ+STTphnKttYP+9loaTlIShC8kNuSGrPJ0XCO/3nka2f9KyAxYIop7EvFJL3YTz/w5K4tspH4fSEYzxL43FVB3vnQbTusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596467; c=relaxed/simple;
	bh=n8S2byZR5SUZKqPL8dvy9unDTv3hjcY6QS1TvVw8b7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDoRkDcesfB9qSVwuudeXVgmx9Sk3/JnJyPGmQpUuVepbpZS1EqoOnPuqKHBWEwa+uhhtRfRshKtssTcO5TsnEvDyUeUwHlzTKzf/YlxVBEZsIGPXLv1PZEZWI3o8LiRWGYbfv+zWHb2yFxsJB5ITBaR5GPU8ZpDfgtB81f8EFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wln9Nji0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743596466; x=1775132466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n8S2byZR5SUZKqPL8dvy9unDTv3hjcY6QS1TvVw8b7o=;
  b=Wln9Nji0Rbrk4yzK6oujZjH6x/Rx1b2wbWMTbyazPed6jStbp66FWd32
   n1ISK8/E7o6D+wRxSuYMFgvZNam3gfDFV9SD+akKjaJVaqtKHFu2CPOXo
   3YBWXdTOn5XupOzfdakY5446FRAkBd/t052EUmTqTRPpfZJ5U2/Rkqcn8
   /fap0vsqcVJ5kSMlq7Dg2xoSHeXUssAR2pIU9TXYsvaStb/inN/EDuJfM
   rtnznCbo6MM656KF40il5mS1sOcVgX5cfRULGT5VpxwThC+REmMwobTvD
   f+MVAQFfBrnuRw8rBDwRh0W1kJ0ix8iFupbycVJx/8MGyBogklXzX1Let
   w==;
X-CSE-ConnectionGUID: 4tY0R4SkTD+MnsUkq3hbTA==
X-CSE-MsgGUID: 5W1mvg1UTGy+yNv1wxRs2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62357538"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="62357538"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:21:02 -0700
X-CSE-ConnectionGUID: Gt280GVVQdSNBmNU5NI8dg==
X-CSE-MsgGUID: 1Hyf3AiMTpi9UKSewvGZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127584273"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 02 Apr 2025 05:21:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 92F2526F; Wed, 02 Apr 2025 15:20:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 2/2] gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
Date: Wed,  2 Apr 2025 15:20:01 +0300
Message-ID: <20250402122058.1517393-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
References: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulator comment in of_gpio_set_polarity_by_property()
made on top of a couple of the cases, while Atmel HSMCI quirk
is not related to that. Make it clear by moving Atmel HSMCI
quirk up out of the scope of the regulator comment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-of.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 8fff6fdfb4a1..65f6a7177b78 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -268,6 +268,9 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 		{ "fsl,imx8qm-fec",  "phy-reset-gpios", "phy-reset-active-high" },
 		{ "fsl,s32v234-fec", "phy-reset-gpios", "phy-reset-active-high" },
 #endif
+#if IS_ENABLED(CONFIG_MMC_ATMELMCI)
+		{ "atmel,hsmci",       "cd-gpios",     "cd-inverted" },
+#endif
 #if IS_ENABLED(CONFIG_PCI_IMX6)
 		{ "fsl,imx6q-pcie",  "reset-gpio", "reset-gpio-active-high" },
 		{ "fsl,imx6sx-pcie", "reset-gpio", "reset-gpio-active-high" },
@@ -293,9 +296,6 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 #if IS_ENABLED(CONFIG_REGULATOR_GPIO)
 		{ "regulator-gpio",    "enable-gpio",  "enable-active-high" },
 		{ "regulator-gpio",    "enable-gpios", "enable-active-high" },
-#endif
-#if IS_ENABLED(CONFIG_MMC_ATMELMCI)
-		{ "atmel,hsmci",       "cd-gpios",     "cd-inverted" },
 #endif
 	};
 	unsigned int i;
-- 
2.47.2



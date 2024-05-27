Return-Path: <linux-gpio+bounces-6666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 635758D0151
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94AE81C2170A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9678315ECF1;
	Mon, 27 May 2024 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y30P9HH5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B315E5D4;
	Mon, 27 May 2024 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816249; cv=none; b=X01qZLTfBDkoIn+aESiyPG+sdU4KZOpz6B4e2JgUzTzjUkKVmY29y/yVru9gq3mnEew65BUym6c0gWUapva1aRbrXsLV6O3wrDKjGDj77tC3KLRc/WEoPrHbTf0iK91ohz1F2/6QPydO9T35pJkstbBx7uPAzufnpNcUWs0cXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816249; c=relaxed/simple;
	bh=ko96IWJ9eCiOH5QPOQgINLiSgrgog2xrx6XZmmmolaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzuKKlG+Cmv1npGPlid2Tz7rpYAWCyM8BDnIpEZ1GRkEwFQZnkB2KmB6qKrzyhXN8hR/0dPsXLlolo6djchFqGJKSn+y1PWRvnhgGzE3ycgDRrfd/LGRxkIfsYKnsnWsfQcnKOQJ3+MvEYlVyYovMjms31vn6ItCD9MwhQDuG2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y30P9HH5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716816248; x=1748352248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ko96IWJ9eCiOH5QPOQgINLiSgrgog2xrx6XZmmmolaI=;
  b=Y30P9HH5AgHZfwV4ZzMNNQNKLDF7eiJFV7eVCauQhIbccNIOQa9lVdy3
   aqpQPHEkkQGQLQ+uOLoKW3mO9YFyDyMKtTBWtFzwsiWIn2bGfET87XfjL
   Jgub02h5YmRk4CPr9sPHCP96GVbkNc43F7NLjYCc2vZs4slhvHbzdikKZ
   OUFNLQcCTJ9gI6PBCf1vx/pMfu+/3PcAtWB40QvWOKIuIbMRx5f6azrNG
   t0GIRhJXfEtPXDTMgtaXXMgLo2umhFDkSv8hTocPryclzpJzhygPB6TVT
   dJ1Mbyb8c+msAXsUWfGQZsb9WBObM2k5br9+tI0aVRNyvyGajvPLqlik6
   w==;
X-CSE-ConnectionGUID: K18HKCmETAyKm4ecmhjJag==
X-CSE-MsgGUID: UpWouWAJRga8hbDMW7PF1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24551768"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="24551768"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:24:08 -0700
X-CSE-ConnectionGUID: ywnwE9TzRk+sAVBgw4Cr+Q==
X-CSE-MsgGUID: xrATi5vqT/Si1j+3jMjc4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34735486"
Received: from unknown (HELO localhost) ([10.245.247.140])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:24:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Florian Fainelli <florian@openwrt.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] gpio: rdc321x: Convert PCIBIOS_* return codes to errnos
Date: Mon, 27 May 2024 16:23:45 +0300
Message-Id: <20240527132345.13956-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
References: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rdc_gpio_config() uses pci_{read,write}_config_dword() that return
PCIBIOS_* codes. rdc_gpio_config() is used for
direction_{input,output}() in the struct gpio_chip which both require
normal errnos to be returned.

Similarly, rdc321x_gpio_probe() that is probe function returns
PCIBIOS_* codes without converting them first into normal errnos.

Convert PCIBIOS_* returns code using pcibios_err_to_errno() into normal
errno before returning them to fix both issues.

Fixes: 9956d02d6e60 ("gpio: Add support for RDC321x GPIO controller")
Cc: stable@vger.kernel.org
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpio/gpio-rdc321x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index 01ed2517e9fd..ec7fb9220a47 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -102,7 +102,7 @@ static int rdc_gpio_config(struct gpio_chip *chip,
 unlock:
 	spin_unlock(&gpch->lock);
 
-	return err;
+	return pcibios_err_to_errno(err);
 }
 
 /* configure GPIO pin as input */
@@ -170,13 +170,13 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 					rdc321x_gpio_dev->reg1_data_base,
 					&rdc321x_gpio_dev->data_reg[0]);
 	if (err)
-		return err;
+		return pcibios_err_to_errno(err);
 
 	err = pci_read_config_dword(rdc321x_gpio_dev->sb_pdev,
 					rdc321x_gpio_dev->reg2_data_base,
 					&rdc321x_gpio_dev->data_reg[1]);
 	if (err)
-		return err;
+		return pcibios_err_to_errno(err);
 
 	dev_info(&pdev->dev, "registering %d GPIOs\n",
 					rdc321x_gpio_dev->chip.ngpio);
-- 
2.39.2



Return-Path: <linux-gpio+bounces-12504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9569BAFD1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6D1DB23063
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1941B0F1C;
	Mon,  4 Nov 2024 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TimKwjZ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA41AE017;
	Mon,  4 Nov 2024 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712985; cv=none; b=esJ5chVpqTthca5oGnPgFe2asJAD1TnedEmVcarGtkykx/nNUTE0EHVsttLKIqUc0IUeOk8Y4Tx1kcFaxFubbNelMIq8RO+mzjPoLivz/kCAODjl1kUT96IRim/ShO4i4eFlsJ44yq8DqdI0vjxd6fVlaECzDpFHII0btOJAJtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712985; c=relaxed/simple;
	bh=l2TSS11EQDCPbhJt567UVr2avTbDJtRucAlK/U+ezRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCEqkVeFTb62kuEAn54eQGvgsnKLiJ4EdAQUQZM/AaN2mgIZI9RjFNSkVN745HoSEHsn9EX7/968bqaAhHRy1RutLq0+SmEdh8x2S+Hi9hqoJ4n9GuAjFB6ATeeghLQcvfb/N8sKT0fuSY2DxX3J0RbAa8DM5KQcqFFbmqHvgBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TimKwjZ1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712983; x=1762248983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l2TSS11EQDCPbhJt567UVr2avTbDJtRucAlK/U+ezRY=;
  b=TimKwjZ1wM5h+HL8IEM/rdxC+6WLsAudSTCeYngSbxkgBlR7W96pP3tn
   TlMkgiMnMyUBHG2i5Bnn7GAoLhjmF1Y3D1WYCzMOy0wvmyV1wNo2OaT2I
   uARQ27HMrBFf5UsM/jkuzGcshrZYbQ2My+cubuKhNwz4DozdFM4Sy7j1l
   FkZm5jAE2QFaDJ5d+Muhp2QjRkuZz+itMQzuJY7tNnP1+iqltmazc/VdH
   uVjUvAUPnSBorj7prprlYyjfGIwFOpopeo3UciD7PUytb9QfNX6Wc5P03
   uPDEFZhKmlm1v9skL60Eolw1o2oD/a8/Dwk6E3JQG8KV1VJZPzrqZhvth
   w==;
X-CSE-ConnectionGUID: fZEsy/grTSWVrbbGITEKfw==
X-CSE-MsgGUID: mVzZHhU5QPOsYOkazyip0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30278761"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30278761"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:16 -0800
X-CSE-ConnectionGUID: xcETve/0S9Oi+37Ks/vMog==
X-CSE-MsgGUID: 5KT7PbBBRW6rQeZEXFrhbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83481190"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 01:36:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C48AB3B4; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:22 +0200
Message-ID: <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pcmcia/soc_common.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 61b0c8952bb5..1deb9960db34 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -204,14 +204,8 @@ static int soc_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
 
 	for (i = 0; i < ARRAY_SIZE(skt->stat); i++) {
 		if (gpio_is_valid(skt->stat[i].gpio)) {
-			unsigned long flags = GPIOF_IN;
-
-			/* CD is active low by default */
-			if (i == SOC_STAT_CD)
-				flags |= GPIOF_ACTIVE_LOW;
-
 			ret = devm_gpio_request_one(skt->socket.dev.parent,
-						    skt->stat[i].gpio, flags,
+						    skt->stat[i].gpio, GPIOF_IN,
 						    skt->stat[i].name);
 			if (ret) {
 				__soc_pcmcia_hw_shutdown(skt, i);
@@ -219,6 +213,10 @@ static int soc_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
 			}
 
 			skt->stat[i].desc = gpio_to_desc(skt->stat[i].gpio);
+
+			/* CD is active low by default */
+			if ((i == SOC_STAT_CD) ^ gpiod_is_active_low(skt->stat[i].desc))
+				gpiod_toggle_active_low(skt->stat[i].desc);
 		}
 
 		if (i < SOC_STAT_VS1 && skt->stat[i].desc) {
-- 
2.43.0.rc1.1336.g36b5255a03ac



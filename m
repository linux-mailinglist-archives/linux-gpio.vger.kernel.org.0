Return-Path: <linux-gpio+bounces-12501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133FB9BAFC0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB7B8282680
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1621AE01C;
	Mon,  4 Nov 2024 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSpSB27P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334761AD9F9;
	Mon,  4 Nov 2024 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712983; cv=none; b=QPSKXC8NHl0fQGL3nST/Zpm4niyEPGQ4GpbequvCRzTbQWv/ryevZvIv1EZcMxX8IE3yj8YhkFCHq5kw/CMe6/DdFTPjvhVnxQs9WYmgq2dMm+WCt4WWSbAvcg4MAa7K5mF4+l0oz/wtjP4ogYEgEjIWdCJEOEpoBLvNka5cTDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712983; c=relaxed/simple;
	bh=n06aomNea54LOIjl4FdYmKdQ3SaJdgCBi4KWYyxFzVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXdilI3fA553R0VIOXMH/WIc79cwEwki80oBu7UwJm2MyQCys399OXsDbz2Eky4XZCSetbxDoAWb4Q1el5fsDqGkwBkrigKpHuS3sAdvE1ex4RKA5N741TQAWH+PDwd16zJuLgcYllrNqsOo0cIYrpNra05p8WVUJBd2cqKOGEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSpSB27P; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712981; x=1762248981;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n06aomNea54LOIjl4FdYmKdQ3SaJdgCBi4KWYyxFzVE=;
  b=SSpSB27Pv5AIBze7JdRxvR3UGJlFKWaOegd/frek4pEqn0ndZYtFRSNc
   jKj3pTzbAw7sTyvmCX31JX5wD0T0kU/Pz1Yh2b6lsp8TPKCS5BKWWYlQ4
   vDFViyTfrkQg3xXtrlnrqdQwRAzG7ykyuB52kDuD1Py79oujjAFVNBHsl
   Q5y19h9arQmbK89YvPpqCrPX/UWQg8Mkk5YjkR5G1ytgklguhlBtF8Uyb
   rwnYQbeShpvRmlpocBp0l2tw6szG1UTCPJ2cdB83T+P0UrjDhTNl3FnjY
   hN1YVIlLlXRbyRjxAUjrKOv7oadPgzuYW8sON3JquElo10J81KczhaC+u
   w==;
X-CSE-ConnectionGUID: wFLECb8RQ+OSEnKxITbcAA==
X-CSE-MsgGUID: tuqyp/IxRmG1PcSLDprKVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30278734"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30278734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:16 -0800
X-CSE-ConnectionGUID: 8Yb4jDMESFapTW0806TxMw==
X-CSE-MsgGUID: msVvaH3ITSCCm1JSxsXAwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83481188"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 01:36:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8F47E1C4; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
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
Subject: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:18 +0200
Message-ID: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
left. Convert those users to call modern APIs and drop this legacy piece
from the source tree.

The idea is to route this via GPIO tree, please Ack.

Andy Shevchenko (6):
  Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
  Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
  leds: gpio: Avoid using GPIOF_ACTIVE_LOW
  pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
  USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
  gpio: Get rid of GPIOF_ACTIVE_LOW

 drivers/gpio/gpiolib-legacy.c             |  3 ---
 drivers/input/keyboard/gpio_keys.c        | 10 ++++------
 drivers/input/keyboard/gpio_keys_polled.c | 12 +++++-------
 drivers/leds/leds-gpio.c                  |  9 ++++-----
 drivers/pcmcia/soc_common.c               | 12 +++++-------
 drivers/usb/gadget/udc/pxa27x_udc.c       |  7 ++++---
 include/linux/gpio.h                      |  3 ---
 7 files changed, 22 insertions(+), 34 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac



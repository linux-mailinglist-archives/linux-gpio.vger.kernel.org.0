Return-Path: <linux-gpio+bounces-8883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 506AC958F07
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 22:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 065911F23993
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 20:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7289C154C15;
	Tue, 20 Aug 2024 20:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCpXSbR0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8242A18E34A;
	Tue, 20 Aug 2024 20:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724184546; cv=none; b=gvX/LyghA7SC4M+Xhvnf3O0hf8RuIFQnnh2vAwBxulDuhQ5+/IUWwGQ0PpdqMyd3M6xq0WAEvFiuxv+YP0Q6zHXL7Luv49j2M+zVksXmTmF3/GY8UXOTwRuZlL4INlmnK90MZw9NDBfg3c9WSJ6sg4kfK24ULjyUEOrL3DbWHJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724184546; c=relaxed/simple;
	bh=D7zzQSYCh+9yZ4fXZxHbZhNnvTFW8xeHZKsD1zpt9Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2810Cq7gcz349TDh7MOkd4mdJD/LPNLamXaI569vP656RLs1jhAnVMmhPV5tC26L5a6iRgWuxYQpZOTN2rjUJcmLmsBDdK53AZFK8IZG2LOMOGZN+dEO2VkfobCCRhqB2qWVIv3d4BUiWy5S82Y5RVcfcLXOC4g7/GLW87JN28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCpXSbR0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724184545; x=1755720545;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D7zzQSYCh+9yZ4fXZxHbZhNnvTFW8xeHZKsD1zpt9Qs=;
  b=aCpXSbR0P90ukZ45l0D2GSsV8RjUdKh2AeD+swi3eq2zEqtw/22lEdf6
   2BpAbmOEVerWC3iPsMudpj0TztpleSzNUEaAbSinvnR3MVpz36PG3zYgN
   LFJ/z2+bSAi30W490HtPLFWRZo1BpY7fO14oUutl7GoDw4ko9mDMAY5G+
   44Nv++qmYIsm5Db8cGtnmtsEQk9tC8DHUlkuakTZ6m9EY+L3nJpyt5CPD
   LyPa8C1WA/l0pxVwuJtWggRxG6drLH6ZhDuGaUhRp7c8xRQIOKcpVpluE
   nXgbZZLiQD2zoWH8oA+0KehK0xO2amk8A3l+5vKB3zLkC/VXK0l2GTY8L
   g==;
X-CSE-ConnectionGUID: 9E4g9UBbTju3ySdNzWS3mg==
X-CSE-MsgGUID: ThTNixW0RP6xuj2CQzgWdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22131180"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22131180"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 13:09:04 -0700
X-CSE-ConnectionGUID: VkyMvPZqRJ6gQrvxIiErcQ==
X-CSE-MsgGUID: 8ImX6trDS5a5M7xR5SCe8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="60484795"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2024 13:09:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0EB4E152; Tue, 20 Aug 2024 23:09:00 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: virtuser: Use GPIO_LOOKUP_IDX() macro
Date: Tue, 20 Aug 2024 23:08:58 +0300
Message-ID: <20240820200858.3659995-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use GPIO_LOOKUP_IDX() macro which provides a compound literal
and can be used with dynamic data.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-virtuser.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index ccc47ea0b3e1..91b6352c957c 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1410,7 +1410,6 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
 	size_t num_entries = gpio_virtuser_get_lookup_count(dev);
 	struct gpio_virtuser_lookup_entry *entry;
 	struct gpio_virtuser_lookup *lookup;
-	struct gpiod_lookup *curr;
 	unsigned int i = 0;
 
 	lockdep_assert_held(&dev->lock);
@@ -1426,14 +1425,10 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
 
 	list_for_each_entry(lookup, &dev->lookup_list, siblings) {
 		list_for_each_entry(entry, &lookup->entry_list, siblings) {
-			curr = &table->table[i];
-
-			curr->con_id = lookup->con_id;
-			curr->idx = i;
-			curr->key = entry->key;
-			curr->chip_hwnum = entry->offset < 0 ?
-						U16_MAX : entry->offset;
-			curr->flags = entry->flags;
+			table->table[i] =
+				GPIO_LOOKUP_IDX(entry->key,
+						entry->offset < 0 ? U16_MAX : entry->offset,
+						lookup->con_id, i, entry->flags);
 			i++;
 		}
 	}
-- 
2.43.0.rc1.1336.g36b5255a03ac



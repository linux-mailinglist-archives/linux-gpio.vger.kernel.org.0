Return-Path: <linux-gpio+bounces-18843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8482EA89B92
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4BF189F4D1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB88E2918C4;
	Tue, 15 Apr 2025 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUrME+22"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6A0291144;
	Tue, 15 Apr 2025 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715494; cv=none; b=d09LCkYEpfck0EE0p+fX8gfE+p2LLIT1kaJz1xxhH9chPqsC/TXqX15w+w7xIOB3T5bZMxYCpITvIoRbFxw1QOy5+KHLWQE/yNV0wmN7uGevKd424is/FfW/7KubmiuBRa2GI3m7cquowbDNHk28QWrdekcxpoPjaPKY+6jTMLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715494; c=relaxed/simple;
	bh=5HELnZXILMLdeLE/tBLoPsoX5uUQXcyPwSW+vFDpizU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2/NWEBv5Jg8yCHOlTKJSFWYYO8zJ5u1uzDt5KiDqmPC+zjlCqMyYhGIdHEn1fI4RR9wxz7zVeyiOv+aSF9YnZ4FRVlPVprux+L09YNP16xkYWMIHPvcP0hqxvEsVxtm9iFh/Ig6fMrkyWyDSuqxndTwWuI+3NJTtGeveGwdV9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUrME+22; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744715493; x=1776251493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5HELnZXILMLdeLE/tBLoPsoX5uUQXcyPwSW+vFDpizU=;
  b=lUrME+22F1YJ6UanXJnbjY4usXmIIT6I7/u1G7AFmIcHrpSgSHUqhylH
   S66DjQZJpKaB0eejs84YxN5mZ7rvFYmGoXjafmgu78QTO8UV3KuwVjuPL
   CRqVRYLXG7gENt4+ETEDU34tgf3VgQHmXXYjjaVfJ3ZEss6IDTGw3UhFW
   aoOHS41GDdWVSVsL6Eyzx2fNgWUrXo4FEwIVyfdxduJg5WJmB+T2Q2fjm
   qHHZp03uMG3x3weOADfReCzQy8DMvG69XicCXw6APSgR+9/yyN4Rj3mCn
   2gVp0LZ0ICv6J14YGaQL6uNmIwOSndkGvXIAOuyNL92IpCS054S+AZ8jF
   g==;
X-CSE-ConnectionGUID: MCDdSc0wRCqG9Qg+W4X2Ow==
X-CSE-MsgGUID: 6gVez3UAScanfnn99XzH/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46382949"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46382949"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:11:31 -0700
X-CSE-ConnectionGUID: ZY/RSKY8S92dEXSPMhT9fg==
X-CSE-MsgGUID: THA5DlJpQUCid5O67nMYYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135072309"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2025 04:11:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DA7BBB0C; Tue, 15 Apr 2025 14:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/7] gpiolib: Make taking gpio_lookup_lock consistent
Date: Tue, 15 Apr 2025 14:10:04 +0300
Message-ID: <20250415111124.1539366-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two ways to take a lock: plain call to the mutex_lock()
or using guard()() / scoped_guard(). The driver inconsistently uses
both. Make taking gpio_lookup_lock consistent.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6b307144e41a..cc12f274ccda 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4364,12 +4364,10 @@ void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n)
 {
 	unsigned int i;
 
-	mutex_lock(&gpio_lookup_lock);
+	guard(mutex)(&gpio_lookup_lock);
 
 	for (i = 0; i < n; i++)
 		list_add_tail(&tables[i]->list, &gpio_lookup_list);
-
-	mutex_unlock(&gpio_lookup_lock);
 }
 
 /**
@@ -4428,11 +4426,9 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
 	if (!table)
 		return;
 
-	mutex_lock(&gpio_lookup_lock);
+	guard(mutex)(&gpio_lookup_lock);
 
 	list_del(&table->list);
-
-	mutex_unlock(&gpio_lookup_lock);
 }
 EXPORT_SYMBOL_GPL(gpiod_remove_lookup_table);
 
-- 
2.47.2



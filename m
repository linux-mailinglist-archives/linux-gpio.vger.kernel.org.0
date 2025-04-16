Return-Path: <linux-gpio+bounces-18940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B5A8B632
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2B7F444E0A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28E823908B;
	Wed, 16 Apr 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PG46mDh5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3B2235354;
	Wed, 16 Apr 2025 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797423; cv=none; b=q7R8cFhC/SUNIMRHqcbEh6gsdF0+cRyhkNmxal9H/UpNChUez6UxEot/7UJImjh3o4E1S0u+KgawgJOWDi0phOcy5glqKs1zsTcmtrSQ5BeI9cgYxXV0HrYI/gnKmaAUxhZTKKrn0xwvDtV6OUSZtgQfvVaS0synYqmizWP+Gik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797423; c=relaxed/simple;
	bh=u2JBPspFen1IaHjZiyH8o5DXJLJnJsjp2yzge8ZUs6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4C2EAnkB7vW873n/Melj60HSEe7ZOotTu+nc68QDnURc4EU9G2q4MjiU2a1tlNQcfp/2ChAgSrkNpAdpUGU//3IlD4mLe/tvvxFcgl9ywi6LUca0YuZd0H+fbTH0pSuycSDxT14hXN2sQMU2BIQnA7A+osiQd7+702q6Mi2i18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PG46mDh5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797422; x=1776333422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u2JBPspFen1IaHjZiyH8o5DXJLJnJsjp2yzge8ZUs6w=;
  b=PG46mDh5HwNaCR32cC7HTxKGboks4Z4s7R8LDaZI2DK597zhLRPeav3u
   abgjpuLaKk2fdPyk2DHHvAEsyu/KByBmvKGMaPO4ez6iUuwCmcDiCGSO3
   pZ/mA2eq09PSwLY9gqm6FPf6rTuc/03CeKD35Ny1nEU5idSSWzww+CEku
   58BtCWtMjbpEObshcstN/Byr4j8IUh90DkgGzQiA1FcGcZStlBGnz57Hg
   uIGz2KNjSuhaiMdZU2RrGqyXkMn85u5kskSfMh2tZVdy+obK/89wJP6vl
   dhFUEMa/ZxxXzRte0s425WeMaLX5TL3h2a6Ka1dkJ3NGwdFRLj4BauR1K
   g==;
X-CSE-ConnectionGUID: PprFZ6XoRQCgcBVQBIhk7g==
X-CSE-MsgGUID: hqfX2lzBQ/Cv1ZtkfVSrnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50144308"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="50144308"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:56:50 -0700
X-CSE-ConnectionGUID: zeslD7q0SZiKABViNv4kcA==
X-CSE-MsgGUID: 6ZWPlObIRaedCurcZB/luQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135259303"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 02:56:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 130715D9; Wed, 16 Apr 2025 12:56:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/8] gpiolib: Revert "Don't WARN on gpiod_put() for optional GPIO"
Date: Wed, 16 Apr 2025 12:55:12 +0300
Message-ID: <20250416095645.2027695-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
References: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to double check the pointer for NULL since gpiod_free()
is using VALIDATE_DESC_VOID() which simply returns in that case.

This reverts commit 1d7765ba15aca68f3bc52f59434c1c34855bbb54.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7f8e8c33207e..4485dc8b1e42 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5140,8 +5140,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_optional);
  */
 void gpiod_put(struct gpio_desc *desc)
 {
-	if (desc)
-		gpiod_free(desc);
+	gpiod_free(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_put);
 
-- 
2.47.2



Return-Path: <linux-gpio+bounces-28148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD912C39290
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 06:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC69C3B242C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 05:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1C02D836A;
	Thu,  6 Nov 2025 05:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvO91TYy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37597E0E8;
	Thu,  6 Nov 2025 05:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762406944; cv=none; b=b8t10mgC6tJxxgkSUZcq+t/CHPemVVHDB8+PMLjIYSn+NkEms2lc4cEblySqylXpEowuSxAJsPb65xHFOedxYz7j8Jexsi6MHBeNjZVHNTmDNoEkQ9Lv9RTgd+u2P695GoMdDyAEMvALkKCHCAb13uI751zX4d8W1FYW/n/0fao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762406944; c=relaxed/simple;
	bh=SDi/IUonZvuhkgWL3E7UkZNf3RlJpPo6eT08EePiTQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L64l8wstZ5gWx/PKrJTcp/wLWYq4XXmCB+/s0ocmiQgQx+yA9yf5vnkti7KqAj7DZzdNDvyhJUQYNmIk+iF829DNhCD5QID208jDqkBhGKclU1A+fO7XY0vIj7v6AGgv7Yyzi9ewQ+FAmL2vgKc8wDdkk9nbzJ9304WuYYP33ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvO91TYy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762406943; x=1793942943;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SDi/IUonZvuhkgWL3E7UkZNf3RlJpPo6eT08EePiTQQ=;
  b=kvO91TYyMbUKZO4bopUwT3Yb8EAAcxYu+bxZ3uUeLFK/EqO40zt379QJ
   vwdARVqDTc8zrRz03wmg8vyJVFYAmkoo9aUo2X2XaQj0HQAY2tT2yzzMJ
   u5vsJ68zmBIb0dTSDsIXhQcjI63IpixfCpZr3Iz7iDS/8uyQ5Hseh0WIv
   LxPkfijeLu+tDy/MW9PN60LhuJsMH023N3uIPVaipnxhbaRf8qW4veCzE
   rhTMFSeRNE3y6FWibOs6ZzPIA7vpS8cDqr2nNCKJGoLC1q+4HVNG3R0sG
   zqCmg+68/rPalH7U1FPXj4KSEx8xuR4gygLCb48ana6g8YILLPNymNJnn
   w==;
X-CSE-ConnectionGUID: zO0qOAQETWenGuQZGZP6aA==
X-CSE-MsgGUID: gBohU+E6R5OAXBe39/i4Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64231837"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="64231837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 21:29:02 -0800
X-CSE-ConnectionGUID: S7RToC0AQdubFxpLJ7xohQ==
X-CSE-MsgGUID: l8r+7CoSTRWHdpZdAYQX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="188108603"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2025 21:28:58 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: kees@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	andriy.shevchenko@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] mod_devicetable: Bump auxiliary_device_id name size
Date: Thu,  6 Nov 2025 10:58:38 +0530
Message-Id: <20251106052838.433673-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have an upcoming driver named "intel_ehl_pse_io". This creates an
auxiliary child device for it's GPIO sub-functionality, which matches
against "intel_ehl_pse_io.gpio-elkhartlake" and overshoots the current
maximum limit of 32 bytes for auxiliary device id string. Bump the size
to 40 bytes to satisfy such cases.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Describe the use case (Greg, Andy)

Triggered by [1].

[1] https://lore.kernel.org/r/aQSwWLVKH_3TthTW@smile.fi.intel.com

 include/linux/mod_devicetable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 6077972e8b45..24eb5a88a5c5 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -867,7 +867,7 @@ struct mhi_device_id {
 	kernel_ulong_t driver_data;
 };
 
-#define AUXILIARY_NAME_SIZE 32
+#define AUXILIARY_NAME_SIZE 40
 #define AUXILIARY_MODULE_PREFIX "auxiliary:"
 
 struct auxiliary_device_id {
-- 
2.34.1



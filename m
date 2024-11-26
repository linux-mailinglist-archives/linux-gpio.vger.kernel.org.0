Return-Path: <linux-gpio+bounces-13288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B8E9D9C5B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 18:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9264416590A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 17:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCD91DCB21;
	Tue, 26 Nov 2024 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZEEogFQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BF11DB55D;
	Tue, 26 Nov 2024 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641776; cv=none; b=GKwRrInfsadnD8zeiHgTRHw9FGjTuX6nBxZ5IQs37NToeJo2mz2Mil9IgEmlCWFPPFFGwI+joaUrMZS59w1IzQ3UOKgWy9Cs311f0+GbEvqX0oLH/RoXiw+6DbCXfyGR8kOhIB3n9Rgpd8B5PdBvAmsmpDDI0aSpZQJY6+hQLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641776; c=relaxed/simple;
	bh=3IQcjMblj2yCRZU9dvH09xLKCFiwJsfsSgS7pL6cJjo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HO9kecvJM126DeaI/QwhSz/pyQMTtw9KKaMTmJYRfGfjt40CUqLjcEmhbW26kYLUjYTSFw/O/PxCljyKolOVY4ypm09cr2dHC07D/8o9N8uSccuilALq8OYj/wKpRUTFrXcdyDEJ0YKRXHW8ZTBtPY5WsfZThyGJiKg338O7t1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZEEogFQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732641775; x=1764177775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3IQcjMblj2yCRZU9dvH09xLKCFiwJsfsSgS7pL6cJjo=;
  b=OZEEogFQtw/3zBLxbIY2C/Dvx8Ja7AAGLJUPSEkspklUZspOFtLCDVxH
   Q1ZLKMFx6OBf7ymPAEu2oKBdSj4B6ugvUOvO7BgxiIg2mN6AOnsuO9cbt
   ZnMVYLVVmKyEWEnp2x5LJKVeKFuh1eVH7I6fTVLj1g1Xc2S+c5wgt1n0h
   nAbjWOTPI7imivFNNCBYxifAqYyEU3QJSIfTRfCem1GM2JYTkdUtCxkGQ
   9IoQJeoYtqVMBALeU9RZTLTkOQ3bGXboxWmczP4ansuY563vR4ztxBRwP
   o4nKXhpRjX2Es86oXu3aeIKKnZnmmGGdpFGOP5pBvprX1IAr2or0U3AUq
   w==;
X-CSE-ConnectionGUID: ncMm/PfgS5eZGP35Swwo5Q==
X-CSE-MsgGUID: pVuldOv/RuyeOYBmQaATvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43312924"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43312924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:22:52 -0800
X-CSE-ConnectionGUID: ILtK8wUHRVasgPR84RT3Kg==
X-CSE-MsgGUID: On4ox8MWSqSP5O18pa1RJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96730554"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 09:22:49 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 38C8C1CAD6;
	Tue, 26 Nov 2024 22:52:48 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 3615B160011C; Tue, 26 Nov 2024 22:52:48 +0530 (IST)
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	dmitry.torokhov@gmail.com,
	broonie@kernel.org,
	pierre-louis.bossart@linux.dev
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/6] devres: Introduce devm_kmemdup_array()
Date: Tue, 26 Nov 2024 22:52:35 +0530
Message-Id: <20241126172240.6044-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241126172240.6044-1-raag.jadav@intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce '_array' variant of devm_kmemdup() which is more robust and
consistent with alloc family of helpers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 include/linux/device.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index b4bde8d22697..c2032aab1586 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -358,6 +358,11 @@ char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp) __malloc;
 const char *devm_kstrdup_const(struct device *dev, const char *s, gfp_t gfp);
 void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
 	__realloc_size(3);
+static inline void *devm_kmemdup_array(struct device *dev, const void *src,
+				       size_t n, size_t size, gfp_t flags)
+{
+	return devm_kmemdup(dev, src, size_mul(size, n), flags);
+}
 
 unsigned long devm_get_free_pages(struct device *dev,
 				  gfp_t gfp_mask, unsigned int order);
-- 
2.35.3



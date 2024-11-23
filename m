Return-Path: <linux-gpio+bounces-13208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D129D6B59
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 21:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A15228185E
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 20:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F04189B8B;
	Sat, 23 Nov 2024 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gu1woTtP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E580EADC;
	Sat, 23 Nov 2024 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732392368; cv=none; b=O5Ry7xXHU2mvhCSiglDzrAc/1xehr00WurxhfaQAbm27LdNGw1eoLLe0614Vv7Z6CdUSLrF6RQTier53StK9+aBufF4P6ez8bYyb2HPIaUz2jZAQx/Kl5fTeS4r+/CHue63dmNV0+KCHhWTq3hRHhZ+wlUbCZ4xK6GuyO3dztXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732392368; c=relaxed/simple;
	bh=GAVRYml17ZCCg2g/TqAnTGzAqhZE9Ak/JKtz3LbjUIM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qFjoPs9ns+LF6SqB3V4ny/8FZ4uGb3I0agGoWtsS6QxO1+QSjLEfurXuDiFI4N+c1wcrfr+Fi/DHDQhQoL+xb5Y4uwyaCoWV6johsSBpTPBMNIKgDPbMCmjOB45Tphm8QyuRZDyQfrzVAXt2EEkLDjNYiX6/YaEY5j8I8K4Tm1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gu1woTtP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732392368; x=1763928368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GAVRYml17ZCCg2g/TqAnTGzAqhZE9Ak/JKtz3LbjUIM=;
  b=gu1woTtPHUUACHYyz2OhodXXZNhApq3G8bnxPdncV1aRSw4Yv4v1o3e2
   0wR0ZHxailJ4AChuYMUw0+vUjK1ydaIkrqD55aZ0YLs6ytXM/EkWHYEhs
   +fCDXe7DfBG6rMkyuG6/x1cHDArwzLHG8OESAgg1OpBEmKTMji8Hf5n4Q
   rS5aqohgmvx8INms8a1kuqvvtUK0dQFmJn8u8ZIOxvy62xeNbQIjWqbLF
   F4CowKVtCrYJwM6htLxsczuRUSOc47qPmW8exssonhppRljK+H8Ou6Lp4
   QVaG2uevdQG3qbopgIZ7GsUEkvyvHMoXRvMasOzyD3asQiE/h8oQCof03
   g==;
X-CSE-ConnectionGUID: zgcox2U0Tb+b+nBOs4uqbg==
X-CSE-MsgGUID: NNvXVSc8S8OmEnjTpe1mmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32678533"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="32678533"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 12:06:07 -0800
X-CSE-ConnectionGUID: zBITnaUiQJmn8IRYzPjQhw==
X-CSE-MsgGUID: 5h/8vyTRTrqbkDar/CjIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="121737991"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2024 12:06:04 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 0CB611CAD1;
	Sun, 24 Nov 2024 01:36:03 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id F18BD160010E; Sun, 24 Nov 2024 01:36:02 +0530 (IST)
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
Subject: [PATCH v1 1/5] devres: Introduce devm_kmemdup_array()
Date: Sun, 24 Nov 2024 01:35:23 +0530
Message-Id: <20241123200527.7830-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241123200527.7830-1-raag.jadav@intel.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce '_array' variant of devm_kmemdup() for the users which lack
multiplication overflow check.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 include/linux/device.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index b4bde8d22697..c31f48d0dde0 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -358,6 +358,16 @@ char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp) __malloc;
 const char *devm_kstrdup_const(struct device *dev, const char *s, gfp_t gfp);
 void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
 	__realloc_size(3);
+static inline void *devm_kmemdup_array(struct device *dev, const void *src,
+				       size_t n, size_t size, gfp_t flags)
+{
+	size_t bytes;
+
+	if (unlikely(check_mul_overflow(n, size, &bytes)))
+		return NULL;
+
+	return devm_kmemdup(dev, src, bytes, flags);
+}
 
 unsigned long devm_get_free_pages(struct device *dev,
 				  gfp_t gfp_mask, unsigned int order);
-- 
2.35.3



Return-Path: <linux-gpio+bounces-13476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECE9E33CA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04D2E284F5E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F7518A95A;
	Wed,  4 Dec 2024 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+KZ+dah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F6188A3B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295864; cv=none; b=qEl/kf3kaGwmaXS4Q6L9zMmO8lliTCCFVP3qJJhSerYwAmBccblVN7vxOXs4LMAToWtYnoyODMHHwnNBAu7bkBiAV7hvCxIiTfSjC7kYo7YyLPJTTJju21KlJygYK0yFapVVLbwKB03m1xcGsxvb0yqmpumhaBTJ48GBop2lUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295864; c=relaxed/simple;
	bh=EDtluHYUfQKPYx+4thPs1YkRJQ3lPEEPCgUC9g0M4+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAKpzwMro3UXXT/YB0rZ/x/xpOgjwvMUVrBrZOz6yljs8xB8q1ZaP3U1aLxN/N8BYTxiT4mphs3I/OXXH8jbkuXfJgu7TAIq2VXJD+qP6W94Qvj35t8+r8b7BhgrO8aZx3aZoTa9jQSeNemgAGlVXS8Vr3BcBUzQ1Ohi6FkrCoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+KZ+dah; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295863; x=1764831863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EDtluHYUfQKPYx+4thPs1YkRJQ3lPEEPCgUC9g0M4+8=;
  b=V+KZ+dahX1IZtjick8TfnB4rlwR52NO8Fmr4B79BaCgC1Ge+aMmjHGTC
   cpIYOk0gDIsCRVo4tQ/AZUrKdV/v63HFMML8wMy+nrYVLjUZYPr1SmIpv
   2JWuu5XfYmnP+baw6zEE9J216Woyih45FYbQnwTpcveLs1Xur/qfoOG51
   EPDBXAKZi8uuGcyE1gaWxsXLqXKrFBmyQYz3c2JUVxkDZ2Zfm1vdIlggf
   zOY2rFUZa1mNonCw5J23duZlBlkk7vJgzkHjdtqf//1jqWIzU9GQd9nBE
   IcQ4EQ5HJnDna78Chq+yqYopIWLN2KuW7lKuT1nM69Da3OqEUCPxYeQDV
   Q==;
X-CSE-ConnectionGUID: FgLq9jmsR2uLQpMyPKsDhw==
X-CSE-MsgGUID: DOzaZH6RTamQqxUC/SVtRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44022839"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44022839"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:04:21 -0800
X-CSE-ConnectionGUID: G0N0CBh6T0e9OLsK+LpoLw==
X-CSE-MsgGUID: 9ynmOB2QR1mHNRPeORETyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94104184"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 23:04:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 39A8942D; Wed, 04 Dec 2024 09:04:16 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/7] gpio: graniterapids: Fix invalid GPI_IS register offset
Date: Wed,  4 Dec 2024 09:04:11 +0200
Message-ID: <20241204070415.1034449-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
References: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shankar Bandal <shankar.bandal@intel.com>

Update GPI Interrupt Status register offset to correct value.

Cc: stable@vger.kernel.org
Signed-off-by: Shankar Bandal <shankar.bandal@intel.com>
Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-graniterapids.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index d2b542b536b6..be907784ccdb 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -34,7 +34,7 @@
 
 #define GNR_CFG_PADBAR		0x00
 #define GNR_CFG_LOCK_OFFSET	0x04
-#define GNR_GPI_STATUS_OFFSET	0x20
+#define GNR_GPI_STATUS_OFFSET	0x14
 #define GNR_GPI_ENABLE_OFFSET	0x24
 
 #define GNR_CFG_DW_RX_MASK	GENMASK(25, 22)
-- 
2.45.2



Return-Path: <linux-gpio+bounces-13474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D99E33C9
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C66DFB23298
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8F3161320;
	Wed,  4 Dec 2024 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuKs6yZO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4381186E26
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295863; cv=none; b=NBJfXCnmxyqpq7U+iexaYKLCdX+1AFVNa4WUwZfMSqaStjzjiTkCSZo+y+PxEjbWDWsiU5uafntoGwgn+S0YIp5J+Yr4e6UjEGSMsks/NCtnGTkYUHqe6Zb4+u4FM6xOZbfqh7XdSRNv+Xu/97w/8tExxhsqknEXnzGTnIFj9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295863; c=relaxed/simple;
	bh=4DUOg3+DOmrTemCTd/eQ5ogu67PbSP0NdA4Xu+SWdkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pELd1uZBqGIfYcix3Hlmr6BsrZo/O9bYc0Bdi3CIk2XnjVAr+7DNpT26XAviUNZ+a7JvnTr3nZfn/ALs5az0lR4QdPRHUyqsebo3Ek1+l7GxmStj1WbHU82yPRmeJx3Is3uFcvfISThyz6/srSqUeGGrgnJ1IcbUmDGvrKVov58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuKs6yZO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295861; x=1764831861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4DUOg3+DOmrTemCTd/eQ5ogu67PbSP0NdA4Xu+SWdkk=;
  b=SuKs6yZOkKoAbQWjYfRvYl0m+hi13TJmoG5abhfqEkAKQwLtlrrpWc2n
   +xcPT1F2voZJW69rnrgjtmiKXE9PgbEDZQ/RjeXX5WpL1H88Em6zhcZem
   VFuC02PtKk5tiNJ+KmOViP6ErXQrmV/AppeL/eu41lsCrA2ydjh/XUzaH
   kv572woaK68HV2RViegnG6nmOaAgdvXK3n83p3RDmKzm7uNjbEevyq/NF
   4KSnzZPsdWtqTBVEi8ibdIPmrykwLddFwM7dO6yiJF6gLiTPVNKLwUyfw
   BaodCHm5aPqMusUDm9HTm3W6TEZ2Wd4OqHMcXWN9t06ewYBlqqoVdb8Iy
   g==;
X-CSE-ConnectionGUID: upz8Rll7R8SD3RPSKYJ5zg==
X-CSE-MsgGUID: B7p702FISpWJuKf9oNHmYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44573906"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44573906"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:04:19 -0800
X-CSE-ConnectionGUID: vkSBTZAQScaGki75/mTEew==
X-CSE-MsgGUID: V+8MjH4WQKO2b2QwHQX4wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93540778"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Dec 2024 23:04:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 43E5F710; Wed, 04 Dec 2024 09:04:16 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/7] gpio: graniterapids: Fix invalid RXEVCFG register bitmask
Date: Wed,  4 Dec 2024 09:04:12 +0200
Message-ID: <20241204070415.1034449-5-mika.westerberg@linux.intel.com>
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

Correct RX Level/Edge Configuration register (RXEVCFG) bitmask.

Cc: stable@vger.kernel.org
Signed-off-by: Shankar Bandal <shankar.bandal@intel.com>
Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-graniterapids.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index be907784ccdb..ec2931a65723 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -37,7 +37,7 @@
 #define GNR_GPI_STATUS_OFFSET	0x14
 #define GNR_GPI_ENABLE_OFFSET	0x24
 
-#define GNR_CFG_DW_RX_MASK	GENMASK(25, 22)
+#define GNR_CFG_DW_RX_MASK	GENMASK(23, 22)
 #define GNR_CFG_DW_RX_DISABLE	FIELD_PREP(GNR_CFG_DW_RX_MASK, 2)
 #define GNR_CFG_DW_RX_EDGE	FIELD_PREP(GNR_CFG_DW_RX_MASK, 1)
 #define GNR_CFG_DW_RX_LEVEL	FIELD_PREP(GNR_CFG_DW_RX_MASK, 0)
-- 
2.45.2



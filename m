Return-Path: <linux-gpio+bounces-13478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDA9E33CB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C31284F9A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318BE18B492;
	Wed,  4 Dec 2024 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBwU2dHz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7E186E26
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295865; cv=none; b=KvKIodJEjKECG7zWj//leMCNTQDF/O5uTtWz+44sJ5Z3ABVk4CfA5mRlFopJZDIFTV7XpT86KN2P8L9SExE1GUUA+ZMtNkxa/if41PxFllKz9TpNnLclfPy/FCbA33aZS/FtRgpflEYqgPBnwujoYAhLXE6KBbnaR3vXyhPmLYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295865; c=relaxed/simple;
	bh=UnCJusywShA3IOv7Nv7bn44X05VeS/EaJysr8q0qNLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKHRetplntSJblkg0Qg2BzMmy94AzoFRR7TAUhDPO2lZ1qdeYSibva8Dw3BW8aHH4mP6d/3yDbgIfy78kexHPiQJ/bNvBmAfzJM4kZHBN+TpzelUqALM6hcRBfFERNLNoaAsVCeSSszqoPIunfw0zVV38cnxtvDz+JE7BY72t2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBwU2dHz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295863; x=1764831863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UnCJusywShA3IOv7Nv7bn44X05VeS/EaJysr8q0qNLU=;
  b=YBwU2dHzcpcH5RwTggTbxvHk07b+YRWQfFmLZU2itqPE8wJ7JKT2hSTa
   tUYI6QlDEMhCB4Wk3SzXUavOO12oc4C82uQskfsfITBSpJdpJB5LyvD8T
   MaiERCYb81Lqn9Oo1UOZ1hl/kL/LeGGwjCHnYBLfMVDtIkwVq7ACi8Uox
   69Y4aY1lieDSbumeOXgDFPlR2h4UetTuy8qPPTAHjEgugz6bJkduqIAj+
   iIznXVVN0TMtHB/rjuVPkhrjHgAsqcvVTDmt7ko+N2Yw9IPCKHt08dA/M
   SxKocCuNyEPQ7q8ieg3f/+/3f4hmdRNLX25AwwcIi6p88Q5Fd9/G7ar5o
   A==;
X-CSE-ConnectionGUID: T35S7LkKRRO4b5kpbfKG2g==
X-CSE-MsgGUID: Q731xYX+RWOgHIrkISJM3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44573916"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44573916"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:04:22 -0800
X-CSE-ConnectionGUID: B7sSSve1S5+BLIOtNljzGg==
X-CSE-MsgGUID: YdGYUr//TXeRecz7zJ+Rwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93540790"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Dec 2024 23:04:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5DEA0B97; Wed, 04 Dec 2024 09:04:16 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 7/7] gpio: graniterapids: Fix GPIO Ack functionality
Date: Wed,  4 Dec 2024 09:04:15 +0200
Message-ID: <20241204070415.1034449-8-mika.westerberg@linux.intel.com>
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

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Interrupt status (GPI_IS) register is cleared by writing 1 to it, not 0.

Cc: stable@vger.kernel.org
Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-graniterapids.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index 3a972d460fe2..ad6a045fd3d2 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -185,7 +185,7 @@ static void gnr_gpio_irq_ack(struct irq_data *d)
 	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	reg = readl(addr);
-	reg &= ~BIT(bit_idx);
+	reg |= BIT(bit_idx);
 	writel(reg, addr);
 }
 
-- 
2.45.2



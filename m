Return-Path: <linux-gpio+bounces-28568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1307AC62D26
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4EF35360357
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 07:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8020831CA6A;
	Mon, 17 Nov 2025 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9z2DPJE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EDF31AF18;
	Mon, 17 Nov 2025 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366314; cv=none; b=KXwDPMUpOCplpaLfA6Yn4V0S7u+jBDpCjVmq/yxDl9Vla5VwjM0SooE4bhvhLba5sxBT6XmvYsLUGnUl5SiKNS6Ir2tZPJBgZ7gLSlJY250JAG2rUC0qBja+fYjOk6jS0ryruc2e0oowvF5LWhYFDkHVTPKWN9y6Fw0xQtWDDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366314; c=relaxed/simple;
	bh=VHoIarHknJK93sKfYFmQqpvMt+ZpZ6iEiZKBFK+CdF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyNw5xKWIqkDgzXJdho2tV7pBoacvsjL63h1WLqgJAJQduXkc9MeSaUmUPZbTSmVVCNDej7uDXxWAyKOtIai0t0vJbE9S7+1GLcF2bCJHXeCTnktQidNZqaX19Wf7JqgiNkiEufUM721dzpQTM2EcY+EsAZW3No5Ynlju9RHRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9z2DPJE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763366312; x=1794902312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VHoIarHknJK93sKfYFmQqpvMt+ZpZ6iEiZKBFK+CdF0=;
  b=O9z2DPJEfMFeiGpvCV5DEitoAer5e/8jQqxAXy4SJZXEhQ85qot0dN24
   KYeED5APPoOsfGqyTHfhfX8vi5IA7SU7vBdG7DG7+X1JqSFGgoZeo17Xn
   zBv6vrfucAxYExIIR3wYeUuu5SQR1qZT/JpjOZQBofqqJH+WS2SqKe+nQ
   mcV6XYaHbXozR4uyvfVFM1mRzv7N2ERCWy5kxNMhn0Or4cE6A21iliwnm
   Nhq7WDxSZlmXVvoiKYxV2L9TaMXu5Xda1dK833lWU3qdNQgj/q/CIR5Jm
   /g8lFinWamEHgj+u+6r3EtbrDEbiy0ZzLLuX63Retj67A2/6H2c7sQyeG
   A==;
X-CSE-ConnectionGUID: I9QYBFUlRuiNsBWrItAy6w==
X-CSE-MsgGUID: 64Qld2DIQT+xbRBItPNk4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76039008"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76039008"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 23:58:29 -0800
X-CSE-ConnectionGUID: 965tbMgYT26SGUQL5y9QcA==
X-CSE-MsgGUID: 0cQPzYtJTZeXK6RkxUBnNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194833611"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2025 23:58:29 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0410A99; Mon, 17 Nov 2025 08:58:27 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/3] pinctrl: intel: Export intel_gpio_add_pin_ranges()
Date: Mon, 17 Nov 2025 08:57:00 +0100
Message-ID: <20251117075826.3332299-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export intel_gpio_add_pin_ranges() for reuse in other drivers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 3 ++-
 drivers/pinctrl/intel/pinctrl-intel.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index a8b80a24e81f..2424b1bcc322 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1345,7 +1345,7 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
 	return 0;
 }
 
-static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
+int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	struct device *dev = pctrl->dev;
@@ -1361,6 +1361,7 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(intel_gpio_add_pin_ranges, "PINCTRL_INTEL");
 
 static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 {
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 654af5977603..545bed9fb96c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -273,6 +273,8 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev);
 
 extern const struct dev_pm_ops intel_pinctrl_pm_ops;
 
+int intel_gpio_add_pin_ranges(struct gpio_chip *gc);
+
 const struct intel_community *intel_get_community(const struct intel_pinctrl *pctrl,
 						  unsigned int pin);
 
-- 
2.50.1



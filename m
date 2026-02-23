Return-Path: <linux-gpio+bounces-32065-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCUOEj6YnGluJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32065-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:11:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7D17B500
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 562DA3028B5E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E215A33D4EC;
	Mon, 23 Feb 2026 18:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O95Jhf5N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A433B97B;
	Mon, 23 Feb 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870146; cv=none; b=Ovqk0tssvpC8zg5G/Zv1ndshcVNqlGbo40X/3bUzG5042C/ePa7latjlJDlw/lFH8QJa5a+63hgoZgvHusu87jBTG6mrvX8QPzzHH6X0dEYS12k4Ai8iTNzdnzjPCNQsjKV/GGasSBJk2y7QTqHdM3l4RpF11EwtwGiqk9vu1J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870146; c=relaxed/simple;
	bh=TMzcyH63F4RpXRFGqOO7y7ywEJpoeK8pxIU27Pemdzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfrUBGp4M7Bmmaptw8r1WR+yMcdam1adF7Ggee3rAnQav06E9wqtCNMG2lbvBJWzzOsKcPmdE9zqR2dMwTdjULhjyXZLf44fd1lH7yDLGBr/YN+WIQZFUvtG0WB8E9GZ5sOslumycEHll8Dg5BUUU2ctNzmIXg3rgyucPHbuplE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O95Jhf5N; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870145; x=1803406145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TMzcyH63F4RpXRFGqOO7y7ywEJpoeK8pxIU27Pemdzs=;
  b=O95Jhf5N9uKdJAYBFmklYif2gjScUPzNF0pg1TEZpFbPrfYvZ9jR7MO7
   3qiAN5UF8UXjnqz7q0hqK3fY7eWHBN6HQ1fyBmA/f6NfZL3F8wc0+qsyZ
   pa+xaOAnCJVPXTsnuk+pWfRCYUNjeqdxfGXcawsP/EiMMz8cgVrtM29iO
   +sdeAtjX55+2uhsiznVW4CmkuTRp2kPaeeRHorcNDVMUBP/JFkuv2tkuQ
   Rz/NbI42lGtIv5rcnAi3XEcyY7Tcrx/jztbdvERHOwjJZkOUmSimkW7en
   YeqBABK7BCTcJU4txVl/IuXdOEhGK8AmKB0m7p2noMd+tOoT/UorLcvbP
   A==;
X-CSE-ConnectionGUID: Tkal2eaES0i8BQJJM2NpwQ==
X-CSE-MsgGUID: VuKpVX/qQVCnpUwt0RVKrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76737696"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76737696"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:03 -0800
X-CSE-ConnectionGUID: DuGprlqQRBeElKbELRortQ==
X-CSE-MsgGUID: fP0/W1qgSDCMx5qgi6Hc6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="253369508"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 23 Feb 2026 10:09:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2ECA39D; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 3/8] pinctrl: cy8c95x0: remove duplicate error message
Date: Mon, 23 Feb 2026 19:06:53 +0100
Message-ID: <20260223180859.2845261-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
References: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32065-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: E6C7D17B500
X-Rspamd-Action: no action

The pin control core is covered to report any error via message.
The devm_request_threaded_irq() already prints an error message.
Remove the duplicates.

While at it, drop the info message as the same information about
an IRQ in use can be retrieved differently.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 0647c7f94162..165ccbda035f 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1310,6 +1310,7 @@ static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
 {
 	struct gpio_irq_chip *girq = &chip->gpio_chip.irq;
 	DECLARE_BITMAP(pending_irqs, MAX_LINE);
+	struct device *dev = chip->dev;
 	int ret;
 
 	ret = devm_mutex_init(chip->dev, &chip->irq_lock);
@@ -1338,17 +1339,9 @@ static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
 	girq->handler = handle_simple_irq;
 	girq->threaded = true;
 
-	ret = devm_request_threaded_irq(chip->dev, irq,
-					NULL, cy8c95x0_irq_handler,
-					IRQF_ONESHOT | IRQF_SHARED,
-					dev_name(chip->dev), chip);
-	if (ret) {
-		dev_err(chip->dev, "failed to request irq %d\n", irq);
-		return ret;
-	}
-	dev_info(chip->dev, "Registered threaded IRQ\n");
-
-	return 0;
+	return devm_request_threaded_irq(dev, irq, NULL, cy8c95x0_irq_handler,
+					 IRQF_ONESHOT | IRQF_SHARED,
+					 dev_name(chip->dev), chip);
 }
 
 static int cy8c95x0_setup_pinctrl(struct cy8c95x0_pinctrl *chip)
@@ -1364,11 +1357,7 @@ static int cy8c95x0_setup_pinctrl(struct cy8c95x0_pinctrl *chip)
 	pd->owner = THIS_MODULE;
 
 	chip->pctldev = devm_pinctrl_register(chip->dev, pd, chip);
-	if (IS_ERR(chip->pctldev))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->pctldev),
-			"can't register controller\n");
-
-	return 0;
+	return PTR_ERR_OR_ZERO(chip->pctldev);
 }
 
 static int cy8c95x0_detect(struct i2c_client *client,
-- 
2.50.1



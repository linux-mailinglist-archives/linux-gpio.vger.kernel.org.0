Return-Path: <linux-gpio+bounces-32064-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF3CGEKZnGmKJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32064-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:15:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA317B602
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5E513100F28
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D984333D4E4;
	Mon, 23 Feb 2026 18:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEVXFN+7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE633BBB9;
	Mon, 23 Feb 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870146; cv=none; b=CeFYYZxm/f5fzIEO3P4h7rfkTyi60ZA8UT+t/Of6dDF3qNydp2rhQa76GLdSWM745g7vb1qyF9Dkyho9dOPDByITkMti6Yl9rDjzGRQcuPbHQvFF/jH8uPYK1ptDP7lRoE55Ex6Zd8ucrcFcjZvjHDPFCHQhGKUTjxueY1clMq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870146; c=relaxed/simple;
	bh=kOB+dAnEOO05y6UZt1KP3bLWhO3E4YCvQWjyKGXAT4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzA+FA9iwIUdtGcc0WqFOlFoYetkhQ9wuNPW9tpiCg8sXqbs8AX+K9Fcffr+QL3CT1SOdf9Rq/pJkE81l+jFKvEea1oQHam1JrrXWsLPoQSNDeAa7unMEqNrb39iJCcvgOs2Y27LSEaG8autC7XEy3AwynXbSElkWJr1akOlgDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEVXFN+7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870145; x=1803406145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kOB+dAnEOO05y6UZt1KP3bLWhO3E4YCvQWjyKGXAT4k=;
  b=HEVXFN+7YOsceE4+9KEsb6V/1EXeKIHdKbB3s0DWWI1bU+l1i8M9qwQS
   OjLt0y5CCRsI7+v6JkvqZLaWOZSR30c69f+kpCH9XpUj/AAsuNQi955FI
   4Vh3sIzomckiWGhiLa3zA0Mq+R9i8xnNNXK0hJnby5v7G8KUEwKhWbjl1
   TjiLn2NhRvQDDI2jLPJ3P7xP7YM0JC03hPwrfdEvRJU84Br4FQt+jWi+V
   Wu1EC6bV+IkUZldkoAfQK/64qLMwwcNhcRLfYN+JoFqQfAWy36AjfFd9d
   7J8CZwys0ShNIH2D+4AbHJFyzy0rvtpxXdIEXIB/FaGbktqZ81n4pl7C8
   g==;
X-CSE-ConnectionGUID: kqGeYHH+S66YDJ3XohiJDg==
X-CSE-MsgGUID: zsx3Ql/rTB+ogbHTEKYBKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72082657"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72082657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:05 -0800
X-CSE-ConnectionGUID: Sy9SHbzGRAm6jLh2rURfwQ==
X-CSE-MsgGUID: 2yUI6CCqTLK8H61+Ix3/Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="238599658"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2026 10:09:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 435E7A5; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 8/8] pinctrl: cy8c95x0: Gather ID tables in one place
Date: Mon, 23 Feb 2026 19:06:58 +0100
Message-ID: <20260223180859.2845261-9-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32064-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 01EA317B602
X-Rspamd-Action: no action

We have three ID tables spread over the driver code. Move all of them
closer to the end of the file where the first user appears to be. With
that done, drop unneeded trailing commas.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 38 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 1d3e0617b235..0d295ebc33d1 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -72,24 +72,6 @@
 #define CY8C95X0_MUX_REGMAP_TO_OFFSET(x, p) \
 	(CY8C95X0_VIRTUAL + (x) - CY8C95X0_PORTSEL + (p) * MUXED_STRIDE)
 
-static const struct i2c_device_id cy8c95x0_id[] = {
-	{ "cy8c9520", 20, },
-	{ "cy8c9540", 40, },
-	{ "cy8c9560", 60, },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, cy8c95x0_id);
-
-#define OF_CY8C95X(__nrgpio) ((void *)(__nrgpio))
-
-static const struct of_device_id cy8c95x0_dt_ids[] = {
-	{ .compatible = "cypress,cy8c9520", .data = OF_CY8C95X(20), },
-	{ .compatible = "cypress,cy8c9540", .data = OF_CY8C95X(40), },
-	{ .compatible = "cypress,cy8c9560", .data = OF_CY8C95X(60), },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, cy8c95x0_dt_ids);
-
 static const struct acpi_gpio_params cy8c95x0_irq_gpios = { 0, 0, true };
 
 static const struct acpi_gpio_mapping cy8c95x0_acpi_irq_gpios[] = {
@@ -1478,8 +1460,26 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	return cy8c95x0_setup_gpiochip(chip);
 }
 
+static const struct i2c_device_id cy8c95x0_id[] = {
+	{ "cy8c9520", 20 },
+	{ "cy8c9540", 40 },
+	{ "cy8c9560", 60 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, cy8c95x0_id);
+
+#define OF_CY8C95X(__nrgpio) ((void *)(__nrgpio))
+
+static const struct of_device_id cy8c95x0_dt_ids[] = {
+	{ .compatible = "cypress,cy8c9520", .data = OF_CY8C95X(20) },
+	{ .compatible = "cypress,cy8c9540", .data = OF_CY8C95X(40) },
+	{ .compatible = "cypress,cy8c9560", .data = OF_CY8C95X(60) },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cy8c95x0_dt_ids);
+
 static const struct acpi_device_id cy8c95x0_acpi_ids[] = {
-	{ "INT3490", 40, },
+	{ "INT3490", 40 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cy8c95x0_acpi_ids);
-- 
2.50.1



Return-Path: <linux-gpio+bounces-39372-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vp4RIAhkRmoVSgsAu9opvQ
	(envelope-from <linux-gpio+bounces-39372-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 15:13:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 032726F82FF
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 15:13:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CuejIbZW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39372-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39372-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE61130C714E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 13:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97137492538;
	Thu,  2 Jul 2026 13:09:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A247DFB4;
	Thu,  2 Jul 2026 13:09:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997770; cv=none; b=ql+3txhim0jxC5+pR+IaFGuaSCqea8uyIp6Jb7IXXNcBAQC+SqoQC7rkN6a9+6rjj9Bp6yQYMWtXYV8nN7gCXRNjOX8BQ7Ye97YVBzNVVs3qiBDCalO5JnaTmLK4F5mVq6mB541FobIwt0mWIYESV9ragfEUx5Bl0pUC6VoET58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997770; c=relaxed/simple;
	bh=M7rclrRdFprUFT3CMVU58irngl0mj+ZduTFpMAmONNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtidlPyixz/XB8qfGHVuIj5WFRa+ZsggFf/DyUknoWEfn0d8aulLtCd13L8HLC0OUPdifIqRP88uKXNm0QHTq/naCWBTr/IsqA7YWaWZOoK7rUQiNgLGYGAiA3JPm7WbW5CYKfQw2nT3KYFSG6U1igY5ab+LCNmE8ZJBShq8AJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuejIbZW; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997767; x=1814533767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M7rclrRdFprUFT3CMVU58irngl0mj+ZduTFpMAmONNU=;
  b=CuejIbZWQ9urTFMM3lPJVWA4xQEgocn0mbPGAn4bNzGxW6kA+V1SS1qC
   PMVrjOpRhqk0lhA3PnyTdwaAugT4YluqKQ4wpYTMjMKKd8Uoy58b6Mbf8
   wSf//8OP+ApfvNUUE0cD3qTQ0DGOlchm1vY7L4nkwA+O26dC+a2oCFT2m
   SkNwzYNbaU0t44pgMUq+WlNGYvfOR9a5ORUJUp3ibKRyBIx9Wj0cjrc0F
   eeGNTGG9KiOFCeNELYC987XL31RfT1kpB/m2AQGNizHuox6nfteR2UivQ
   cW4pS4qVzw42pfDjzFGfjGEY+msdzyYZCS2pWwmPHkiBFRQ9x6FNNoX9z
   A==;
X-CSE-ConnectionGUID: eE/+KseYSzeEad2/acIYKg==
X-CSE-MsgGUID: 2GxtLKkHSUiQwMrAp6ztPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95256361"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95256361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:09:26 -0700
X-CSE-ConnectionGUID: kOE+QZ9WQm2Chck3i01Zhg==
X-CSE-MsgGUID: xrKp9MFEQkKrMpaUZVHIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251140489"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2026 06:09:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7B66898; Thu, 02 Jul 2026 15:09:21 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v1 1/4] regmap-irq: Provide IRQ resource request and release callbacks
Date: Thu,  2 Jul 2026 14:42:54 +0200
Message-ID: <20260702130903.1790633-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39372-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:mwalle@kernel.org,m:eleanor.lin@realtek.com,m:wbg@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 032726F82FF

The users which rely on regmap IRQ to create the IRQ chip may also
want to have an additional tracking of the IRQ requests and releases.
Provide a callback for them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap-irq.c | 22 ++++++++++++++++++++++
 include/linux/regmap.h           |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 07234d415b51..99b55b1053ee 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -296,6 +296,26 @@ static int regmap_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int regmap_irq_reqres(struct irq_data *data)
+{
+	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	if (d->chip->irq_reqres)
+		return d->chip->irq_reqres(d->chip->irq_drv_data, hwirq);
+
+	return 0;
+}
+
+static void regmap_irq_relres(struct irq_data *data)
+{
+	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	if (d->chip->irq_relres)
+		d->chip->irq_relres(d->chip->irq_drv_data, hwirq);
+}
+
 static const struct irq_chip regmap_irq_chip = {
 	.irq_bus_lock		= regmap_irq_lock,
 	.irq_bus_sync_unlock	= regmap_irq_sync_unlock,
@@ -303,6 +323,8 @@ static const struct irq_chip regmap_irq_chip = {
 	.irq_enable		= regmap_irq_enable,
 	.irq_set_type		= regmap_irq_set_type,
 	.irq_set_wake		= regmap_irq_set_wake,
+	.irq_request_resources  = regmap_irq_reqres,
+	.irq_release_resources  = regmap_irq_relres,
 };
 
 static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index df44cb30f53b..370baa19db87 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1770,6 +1770,8 @@ struct regmap_irq_chip {
 			       void *irq_drv_data);
 	unsigned int (*get_irq_reg)(struct regmap_irq_chip_data *data,
 				    unsigned int base, int index);
+	int (*irq_reqres)(void *irq_drv_data, irq_hw_number_t hwirq);
+	void (*irq_relres)(void *irq_drv_data, irq_hw_number_t hwirq);
 	void *irq_drv_data;
 };
 
-- 
2.50.1



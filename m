Return-Path: <linux-gpio+bounces-39374-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M71IFCZkRmoiSgsAu9opvQ
	(envelope-from <linux-gpio+bounces-39374-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 15:14:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D43D6F8316
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 15:14:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LpBqo9EO;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39374-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39374-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 839C03075C88
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 13:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257D244D6B2;
	Thu,  2 Jul 2026 13:09:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E6492517;
	Thu,  2 Jul 2026 13:09:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997773; cv=none; b=VW7M4mdVgSYSp23rMcLQ+zjO1IYMblI//xkJKNC3c+Gd67kRXqLr3GEJdt0F0hfHJZJY6xvbSDKNXZrrX+5f9DJDWE7rF/v1rVIYjNDI9mQyKT3BvKwViebbAEVRGMUU4VZwcFcATLv5sC76fss3oOU1vfYcypkF/ccv2I1VoEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997773; c=relaxed/simple;
	bh=fKF0xg8o2PjOYhyJJfUeGshnp1PDtYVAgCREukzwwIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XO/B4NVjIPB5ZQ/LuPM8Wp5sxq/Rx2JgxFkDbM/IXSHQ4ajZkllo9zEoclTVKE/jQOYDI7OCsVYS3+CsRZaPHE7r/rw7ZR3T6MgqGJXvnCb3RFMxsyLUCGPYeSSWwdjWxuBcqNdkLDPj1C6lANUZv+BSsZU5dEeqJm8B+N5l6MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpBqo9EO; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997771; x=1814533771;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fKF0xg8o2PjOYhyJJfUeGshnp1PDtYVAgCREukzwwIw=;
  b=LpBqo9EOdghRGnrSihN0pfxbEU4tdYAzBHTlVdOLYXplJL5HsI4IK8dP
   wTYfBNqZqs2QFY92/0QERKUCiudzhKd4U5RIQsxGtDPhly3PpqyS1OLHj
   zoiMvTBhWO0uexyKvVcaNvZqz5oQlyJ7xWrB8NGbdFZGGB2dH+arAhOcj
   Sdcj9WeyO/NTf8N7UO8TgSiGC/kfFXBeKz+bVzV27ms2/Vfc81MEWNGYM
   KGTi2XWmNcCc1mC1voAt4imBFRBjXzdTu/u6AgBWqZcnk/PbmIaGX/QYx
   5JHAx8fnM9Hh2eCJuN1TlZ+PgPrf9muCCmd03k55dXpH+MWydWoh7U72f
   Q==;
X-CSE-ConnectionGUID: hwV1RsF/Tm+5jzOVY6qL0g==
X-CSE-MsgGUID: M9mFzFROQxmypPnJGcJBlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101175354"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101175354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:09:26 -0700
X-CSE-ConnectionGUID: 9Up/Kkt8RkWorpzI5Oj6zg==
X-CSE-MsgGUID: 9oSJb1L/TJusdesDn/K1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248412272"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 06:09:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 802B899; Thu, 02 Jul 2026 15:09:21 +0200 (CEST)
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
Subject: [PATCH v1 2/4] gpio: regmap: Provide default IRQ resource request and release callbacks
Date: Thu,  2 Jul 2026 14:42:55 +0200
Message-ID: <20260702130903.1790633-3-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39374-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D43D6F8316

When GPIO regmap based driver supplies its own IRQ domain, it might
still want to keep track of the IRQ requests and releases, in particular
to prevent a GPIO, which is used and locked as IRQ, to be requested
via standard ways. Provide default callbacks for such cases and keep
struct gpio_chip private to GPIO regmap implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-regmap.c  | 22 ++++++++++++++++++++++
 include/linux/gpio/regmap.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 51b4d69b8740..ad808d8d24b3 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -276,6 +276,28 @@ static int gpio_regmap_direction_output(struct gpio_chip *chip,
 	return gpio_regmap_set_direction(chip, offset, true);
 }
 
+int gpio_regmap_reqres_irq(struct gpio_regmap *gpio, unsigned int offset)
+{
+	return gpiochip_reqres_irq(&gpio->gpio_chip, offset);
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_reqres_irq);
+
+void gpio_regmap_relres_irq(struct gpio_regmap *gpio, unsigned int offset)
+{
+	gpiochip_relres_irq(&gpio->gpio_chip, offset);
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_relres_irq);
+
+static int gpio_regmap_irq_reqres(void *irq_drv_data, irq_hw_number_t hwirq)
+{
+	return gpio_regmap_reqres_irq(irq_drv_data, hwirq);
+}
+
+static void gpio_regmap_irq_relres(void *irq_drv_data, irq_hw_number_t hwirq)
+{
+	gpio_regmap_relres_irq(irq_drv_data, hwirq);
+}
+
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 {
 	return gpio->driver_data;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 06255756710d..e939709fde8d 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -121,4 +121,7 @@ struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
 					      const struct gpio_regmap_config *config);
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio);
 
+int gpio_regmap_reqres_irq(struct gpio_regmap *gpio, unsigned int offset);
+void gpio_regmap_relres_irq(struct gpio_regmap *gpio, unsigned int offset);
+
 #endif /* _LINUX_GPIO_REGMAP_H */
-- 
2.50.1



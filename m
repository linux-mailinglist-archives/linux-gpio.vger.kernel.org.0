Return-Path: <linux-gpio+bounces-39371-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rPDTOgBkRmoSSgsAu9opvQ
	(envelope-from <linux-gpio+bounces-39371-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 15:13:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D06F82FC
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 15:13:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=APyCq4PA;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39371-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39371-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E678305F0BE
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 13:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DB24921B0;
	Thu,  2 Jul 2026 13:09:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789049218D;
	Thu,  2 Jul 2026 13:09:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997770; cv=none; b=iNvho8eCeBGzVO/QzO8ipcu9rEDm6vGZt/swNXUePPI+p6sZDSOvJgSVrP0pP9lIAXyy97P2zvLqQRiPDVAt0C1tFN7Vo8lzm0MHUDfm4LHBlegUvjW5XXzP4sSbqFWhSzFseAmv5bHTTQE8invcB2TwxjIo5Lx+f70+WRZfbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997770; c=relaxed/simple;
	bh=oJ3JNZ6A9LzwBVXjgXi9c2MgF8fs34PDN5DnG7Go2v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjwxhFCFBQJL6xhiFyO7H4sYsoAQIMOlxq8UWyhmKjddK0gpysrSiFUNzKMfezXnQujbSjCafutGAkgaxW7AwX0g7Dz+UjNFy1tJ48yqAbiGWHzJqM7gtcBOzZD9EoQApzUgb58pSGfNOMocSduQsRfk/7jTDqqjQwp0d74uB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APyCq4PA; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997767; x=1814533767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oJ3JNZ6A9LzwBVXjgXi9c2MgF8fs34PDN5DnG7Go2v8=;
  b=APyCq4PAm6KAaZWaOlqg9C/CSIz+2Xuh0aDPAEK51mufSvUkka2gxqMT
   KV9puk/JWdxqK8shujhWTXBSoc/9TfQ6s3JIddqxQfBXn01SDNnhDL9eS
   XVlw0dfHByikMgMZZm4REpO88lDcMmdMUGoBt+PkGeUs+sKPdfiC5vzxp
   KPa9XO2zyYaq419Qv5gbPblWHy1rP5ZXEywsiFuNB19kqPwlGlPW2yFWB
   F5ua3Gcz15xI1Z62waXIqcozjlP/X5yY3o0sQwqZ+qQIQQfHK9QfnaSas
   rwXwzSddsIuPtwsd8PgwpqvnCRZAEZbkZiY+lmgma3FVdjf0Cl4uWUA1G
   w==;
X-CSE-ConnectionGUID: iOUcvdW1TPSb2drYIDewvg==
X-CSE-MsgGUID: gQ+1SlOdTF+SZu3B0VRpUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101175348"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101175348"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:09:26 -0700
X-CSE-ConnectionGUID: UKnJkF/IQYSstkrVlRsdQA==
X-CSE-MsgGUID: LWfIdWDyT0O2tfsN5+IqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248412273"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 06:09:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 896AA9D; Thu, 02 Jul 2026 15:09:21 +0200 (CEST)
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
Subject: [PATCH v1 4/4] gpio: regmap: Order kernel-doc descriptions with the actual appearance
Date: Thu,  2 Jul 2026 14:42:57 +0200
Message-ID: <20260702130903.1790633-5-andriy.shevchenko@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-39371-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 254D06F82FC

Order kernel-doc descriptions with the actual appearance.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/regmap.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index e939709fde8d..a3ba8242c353 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -34,10 +34,6 @@ struct regmap;
  * @ngpio_per_reg:	(Optional) Number of GPIOs per register
  * @irq_domain:		(Optional) IRQ domain if the controller is
  *			interrupt-capable
- * @reg_mask_xlate:     (Optional) Translates base address and GPIO
- *			offset to a register/bitmask pair. If not
- *			given the default gpio_regmap_simple_xlate()
- *			is used.
  * @fixed_direction_mask:
  *			(Optional) Bitmap representing the GPIO lines that
  *			make use of the @fixed_direction_output list to
@@ -48,16 +44,20 @@ struct regmap;
  *			(Optional) Bitmap representing the fixed direction of
  *			the GPIO lines. Useful when there are GPIO lines with a
  *			fixed direction mixed together in the same register.
- * @drvdata:		(Optional) Pointer to driver specific data which is
- *			not used by gpio-remap but is provided "as is" to the
- *			driver callback(s).
- * @init_valid_mask:	(Optional) Routine to initialize @valid_mask, to be used
- *			if not all GPIOs are valid.
  * @regmap_irq_chip:	(Optional) Pointer on an regmap_irq_chip structure. If
  *			set, a regmap-irq device will be created and the IRQ
  *			domain will be set accordingly.
  * @regmap_irq_line:	(Optional) The IRQ the device uses to signal interrupts.
  * @regmap_irq_flags:	(Optional) The IRQF_ flags to use for the interrupt.
+ * @reg_mask_xlate:     (Optional) Translates base address and GPIO
+ *			offset to a register/bitmask pair. If not
+ *			given the default gpio_regmap_simple_xlate()
+ *			is used.
+ * @init_valid_mask:	(Optional) Routine to initialize @valid_mask, to be used
+ *			if not all GPIOs are valid.
+ * @drvdata:		(Optional) Pointer to driver specific data which is
+ *			not used by gpio-remap but is provided "as is" to the
+ *			driver callback(s).
  *
  * The ->reg_mask_xlate translates a given base address and GPIO offset to
  * register and mask pair. The base address is one of the given register
-- 
2.50.1



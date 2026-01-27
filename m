Return-Path: <linux-gpio+bounces-31151-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Gg0BqqUeGncrAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31151-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:34:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B0B92DCB
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 778B53035ABB
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6813342509;
	Tue, 27 Jan 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJsXjbgi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CF534107F;
	Tue, 27 Jan 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510013; cv=none; b=GuPQQcR2ke4MjenNfMDAVaALXVGv4yLBLRjQgirU+esidQyeKzbDbsSpsnS/v8HUrRzyVvYzKwOR6CRvmm6xEdyfMvLLJiUIhv1AXCYLIic+gSh5s74rugAQkYo9ebgbweRhc72b/rN7EG3SpRuhKsxR9sRGTapc6FaqAcYrqYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510013; c=relaxed/simple;
	bh=IzDqYGGG5wQws5n5/t2DJCKrcVDFe42MuIxiJkeclLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdVvGrWG77ki2YjzLgaveNQ0PkK2HuiOI9VW1NFzp3lvCvuzmgnL/4eoL3fgtkth1H4KRcmrvqiB3N17L7eklTyajpteF0TpA04rXlUUojhBvUyk7ehabIYF7OvSZbXOjk8MKpMJ1fu1wY+x8txL/aRKiru2Jy81wZkqU+jJVrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJsXjbgi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510013; x=1801046013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IzDqYGGG5wQws5n5/t2DJCKrcVDFe42MuIxiJkeclLI=;
  b=eJsXjbgiI2O35RlQLKQYoBIoT4lMr+H9miZQeBeep0rlGfR89TcR71Im
   0mNQfTbIpA2J6/sWcfCDxM63XCPB3xLqErPHMgd7HGeAIincdx6wMGubh
   rF9wZlz247VwLY3oVEWGRrz64jtCFc0/uQh+r4TYYV7gzWWaoO3nA6fA0
   UlNIc9NoanVMqKT5Bkrx1n6kTBRJ907WytinssWFl2LHFrx1/e1r5kW4K
   keVzLeBlQt1TC+gbbDdLisuhnzyc2wtUYCKvisDzyKeD1r/QuKmv0KvbV
   PyVAOVfeqi28Rcpy4WZAdETuAjB0Z0KE2ZTRH4WgTiFRfsrIXEswQci+4
   g==;
X-CSE-ConnectionGUID: 0EcY3CrIRwavg5/ZMZx1ig==
X-CSE-MsgGUID: bY56h8opQseNbpLpP1xjFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93360006"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="93360006"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:33:31 -0800
X-CSE-ConnectionGUID: hZ90SbZmS/mrx/e6Ipqs1A==
X-CSE-MsgGUID: 7gYDBLWzRz2Q0ZKTcRqpuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208184405"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 02:33:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9441099; Tue, 27 Jan 2026 11:33:26 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v1 1/3] pinctrl: core: Remove unused devm_pinctrl_unregister()
Date: Tue, 27 Jan 2026 11:32:06 +0100
Message-ID: <20260127103325.3925173-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31151-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 85B0B92DCB
X-Rspamd-Action: no action

There are no users, drop it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/pinctrl/core.c                        | 22 -------------------
 include/linux/pinctrl/pinctrl.h               |  3 ---
 3 files changed, 26 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 0198ac65e874..7d2b897d66fa 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -408,7 +408,6 @@ PINCTRL
   devm_pinctrl_get_select()
   devm_pinctrl_register()
   devm_pinctrl_register_and_init()
-  devm_pinctrl_unregister()
 
 POWER
   devm_reboot_mode_register()
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 83254a95ef17..b2b86c4d8475 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2323,16 +2323,6 @@ static void devm_pinctrl_dev_release(struct device *dev, void *res)
 	pinctrl_unregister(pctldev);
 }
 
-static int devm_pinctrl_dev_match(struct device *dev, void *res, void *data)
-{
-	struct pctldev **r = res;
-
-	if (WARN_ON(!r || !*r))
-		return 0;
-
-	return *r == data;
-}
-
 /**
  * devm_pinctrl_register() - Resource managed version of pinctrl_register().
  * @dev: parent device for this pin controller
@@ -2403,18 +2393,6 @@ int devm_pinctrl_register_and_init(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_register_and_init);
 
-/**
- * devm_pinctrl_unregister() - Resource managed version of pinctrl_unregister().
- * @dev: device for which resource was allocated
- * @pctldev: the pinctrl device to unregister.
- */
-void devm_pinctrl_unregister(struct device *dev, struct pinctrl_dev *pctldev)
-{
-	WARN_ON(devres_release(dev, devm_pinctrl_dev_release,
-			       devm_pinctrl_dev_match, pctldev));
-}
-EXPORT_SYMBOL_GPL(devm_pinctrl_unregister);
-
 static int __init pinctrl_init(void)
 {
 	pr_debug("initialized pinctrl subsystem\n");
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 1a8084e29405..c329cc693139 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -187,9 +187,6 @@ extern struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
 				const struct pinctrl_desc *pctldesc,
 				void *driver_data);
 
-extern void devm_pinctrl_unregister(struct device *dev,
-				struct pinctrl_dev *pctldev);
-
 extern void pinctrl_add_gpio_range(struct pinctrl_dev *pctldev,
 				struct pinctrl_gpio_range *range);
 extern void pinctrl_add_gpio_ranges(struct pinctrl_dev *pctldev,
-- 
2.50.1



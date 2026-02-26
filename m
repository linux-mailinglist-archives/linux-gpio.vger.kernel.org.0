Return-Path: <linux-gpio+bounces-32204-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P+NLloRoGnbfQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32204-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:24:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9CE1A352E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 567243026176
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EF239526D;
	Thu, 26 Feb 2026 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/yW2jNm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEAA39C623;
	Thu, 26 Feb 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097629; cv=none; b=Jy4cUI+PsxkCFIGT5gdCCrv9GVF2JTSlO3Iu2uNzhFW3tLPwzmavdg/yswL5QrLcsslWd1OoXTmGHYfmojuOdEpwCaB5tKx0XQ6lv/NqazJ5dm3zeZWjrfvgOexpIIQdnH3gmZJTCfP8iIapWErDTNVpAhBgKCedD03uVST+PYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097629; c=relaxed/simple;
	bh=rxEi5mP/TteECjkcQ3OMk9xzFrI4ItoH8HgpG1nGP7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+25soUaDDSubDJdnTIE0NDYriS8LfsI0LovpWGXOC3F1ULIjQ+9YknZHVR72icKYtdNi/rgAjERMoMvET4cBYtS8Zm4uNYIVrIxpykg4I9KvDWY8YpoC0l104MVOy1xTFYcLmX6lpGP6xxCjf+JFX8xuk3Y1gq81NbyOcWTxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/yW2jNm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772097628; x=1803633628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rxEi5mP/TteECjkcQ3OMk9xzFrI4ItoH8HgpG1nGP7o=;
  b=F/yW2jNmMobPzzp6SjW5uFdjc1ZXObmCFzjdCE8xC/YXr5G1kij4Al5g
   Cd0lMAumPLE/RM7MP3jf5NVfAHphYsM2j9iqFqEG1eKV3BrHqByed8dQW
   qsm8QjaErm18wPI8+nhY19+jFuy81ZpsmofeMkZphzdzK5r9dy3HLkaUn
   aMJQWn3/JlLgyoxJ39CLm3LxM2zecz5yKFx2FA+9ybbgGjmgG26KJDYaG
   KgGxRvt8mMZpCCjnS99NMLbvTp9JiwVmllnCKBSDXA2vw19WcsR5YLSDT
   2ezPODq9DB/dlgJhQpNlaTCmvl+VvsONsZ1tHBoAi3PFMnDQTZbWug/ZO
   Q==;
X-CSE-ConnectionGUID: 4Nl8wAMFSICgZBqA1Rxf0g==
X-CSE-MsgGUID: 0u43eC9QSd+RBpUfsKLOAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83862431"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83862431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:20:26 -0800
X-CSE-ConnectionGUID: 4crVQSnyRYyQr+3a6svtdQ==
X-CSE-MsgGUID: 1OYaVP/nRciTkQ2k+KuKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="215230464"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2026 01:20:25 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6A31798; Thu, 26 Feb 2026 10:20:24 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: generic: Don't use 'proxy' headers
Date: Thu, 26 Feb 2026 10:20:23 +0100
Message-ID: <20260226092023.4096921-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32204-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 3F9CE1A352E
X-Rspamd-Action: no action

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mmio.c     | 4 +---
 include/linux/gpio/generic.h | 8 +++++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index edbcaad57d00..0941d034a49c 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -42,18 +42,16 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 
 #include <linux/bitops.h>
 #include <linux/cleanup.h>
-#include <linux/compiler.h>
 #include <linux/err.h>
-#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
+#include <linux/limits.h>
 #include <linux/log2.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
-#include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index ff566dc9c3cb..de43c06c83ef 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -3,9 +3,15 @@
 #ifndef __LINUX_GPIO_GENERIC_H
 #define __LINUX_GPIO_GENERIC_H
 
+#include <linux/bits.h>
+#include <linux/bug.h>
 #include <linux/cleanup.h>
-#include <linux/gpio/driver.h>
+#include <linux/container_of.h>
+#include <linux/errno.h>
 #include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <linux/gpio/driver.h>
 
 struct device;
 
-- 
2.50.1



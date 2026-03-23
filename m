Return-Path: <linux-gpio+bounces-34029-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEuFB6VEwWnpRwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34029-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 14:48:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF52F3458
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 14:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8732D300E381
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 13:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AB93AC0D0;
	Mon, 23 Mar 2026 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXPN+IGX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FDA3AB282;
	Mon, 23 Mar 2026 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273323; cv=none; b=lJdH1Oeffr+9tyBVh79cKjhehSfA/1d0Jz4YaZw/uTJJnsSk3P/0GBkYL0BBIPJhpjamdMNpTnUsgzYKGEVbcc4q6y5RTGOFIqSAQta6lQ6vGM2hO0/wmJqhJJ/pHXEWuTKiQ4Ty+22evyFjAD7xZtELBLWLomOIHUMdOJrUuqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273323; c=relaxed/simple;
	bh=Kqf9ptg9HEBDmYL1Lyy3hYxZoG27YsAIUu3Wg/cMYsA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pHosDZcQQvjemr0hDAcgdHRR5pmkcJ4981kKsLboTTZdp0lKpDGPf9j9YfW9bEVQ/z4jWSlm61Y0k6vyMeRoAC1XjAFM77XBF13fYQRV1deMr1vst3J3z9hG6WpYhxEScX3bLOoSOwawtJUnxjpJHgg/UM/Hlg3ytds3QJoIYcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXPN+IGX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774273322; x=1805809322;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Kqf9ptg9HEBDmYL1Lyy3hYxZoG27YsAIUu3Wg/cMYsA=;
  b=RXPN+IGXuU+j2iRj0Lhd6CLt895z7WvSaS2fL5EBoPXpK75RAPo3JbgW
   wtAbF4vewKCvNDWh8GmcCkiUQPLveNLeOQL8x1R+i8pDQ0aHm6I1HU8Xg
   kBRB01Wr/vnvOI/OuUZC8/2+EXqyW9XdeOBdt8vnErZGnkC/KiXpF80ZD
   ByB4JO02atch2vC985+9ZI41+gzlgOW2EtJB6Eqlp16kz0K8anYfEb29s
   PhTtRo+tPyxDgBGUBRXXB4vaOFyL8CZb7osEATFkQfkkHiSwvDtGfch97
   Y2z5tNCuQML5HVuGetgAHoK/ue/s5N6vcQGBY1vpGx4yHJasr8LE46Ciu
   w==;
X-CSE-ConnectionGUID: 35LQl5OrTZCdW42dxXtV7Q==
X-CSE-MsgGUID: FgA+b7dVSeWH/DRcZ2GV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74289755"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74289755"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:41:54 -0700
X-CSE-ConnectionGUID: bwVnBGLzRD++DK/y9AWQdw==
X-CSE-MsgGUID: n68A2e99QFmX9Aavv6W/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247061940"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2026 06:41:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9635C98; Mon, 23 Mar 2026 14:41:52 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] pinctrl: core: Don't use "proxy" headers
Date: Mon, 23 Mar 2026 14:41:23 +0100
Message-ID: <20260323134150.3493980-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34029-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 33FF52F3458
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: replaced gpio.h with gpio/consumer.h instead of dropping (LKP)

 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 254161d52da7..6f09aa3aa83b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -24,7 +24,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 
 #include <linux/pinctrl/consumer.h>
-- 
2.50.1



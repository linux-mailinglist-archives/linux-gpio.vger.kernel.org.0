Return-Path: <linux-gpio+bounces-21409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849DAD5DDC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 20:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A11E7ACE34
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 18:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B12F28315D;
	Wed, 11 Jun 2025 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmnYLyiu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D18825BEEF;
	Wed, 11 Jun 2025 18:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749665402; cv=none; b=uxwBN6a9op8YFZ8r0WdWSE5wNa6E9ahoavgBEkXDwDUx0DC+xduunicrI5QV/nXYc8Py1GaBPq9NRJ+6Gz9+DnHfoH5Vnnp/k3rUZaot8UxYD7Q70FzaCoOCn2WNlL5P5yJOe7FeJLLHdI13royAtgNvkRkhQsh6pU6XWf7Hqq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749665402; c=relaxed/simple;
	bh=Vnhzu8nmVQq6xHlGY+U2p9a1qKEA6C6JDld4Frm94ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GqqRYjbIjWP3r645kkrU2BCKnAE5aNYexKKMd/AbOoZ4XD9+bOSFlNDA5BH7dRVT58s4bIIQhL8V6M/rQsD1dAxSsG93SzXBoIlYU8b9hcVyar0rWOQ7s0rdkj07Q33dfJ4poQkrqMZI462qyssC04A9H17H9ecLsAzOrf6yd1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmnYLyiu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749665400; x=1781201400;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vnhzu8nmVQq6xHlGY+U2p9a1qKEA6C6JDld4Frm94ho=;
  b=kmnYLyiuRVAAXJjJc9Z8Gzeg98k6Az3cah+eK04JnqxFIVjsHcfWz1ac
   163YugX0s50dD2Uq3JKn8klcd4PovTNA+pAZc58borykdE4WMvjNRXaPe
   L0fIusjj8mV+0YmiwhtqSA0Si25mZxajmVkc+3wxGvPh+TJRH8OGUaQN7
   rOugfvd9IOE53dckTziSy33cWYOanqQZ0Hnac3IBQh3HsWlScwoQf/pjH
   hqZCpcDQJaAPKDZrNYUMCtUc44yNu6vFAHV4dbUAKdUtfwr5TZswrzKxO
   m9Sz2pcfOycko07Ka2+kUliaYx63jYxaZSmmAR+gCZDY1KQSByRKEvlFK
   A==;
X-CSE-ConnectionGUID: brhJZgxoSruWqKuO18M4PQ==
X-CSE-MsgGUID: J52ckMyIRkaaWTm2bKiiPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51686288"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51686288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:10:00 -0700
X-CSE-ConnectionGUID: TXuK3Fq2QN+4xfoA7URDhA==
X-CSE-MsgGUID: Z4qlnaGFSyi+Iv1LwpZ0WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="152159437"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2025 11:09:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4072EF0; Wed, 11 Jun 2025 21:09:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: fix build warnings about export.h
Date: Wed, 11 Jun 2025 21:09:56 +0300
Message-ID: <20250611180956.2780365-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
check unnecessary #include <linux/export.h> when W=1"), we get some build
warnings with W=1:

pinctrl-intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

So fix these build warnings for the driver code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index d889c7c878e2..15f91fa198a3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/cleanup.h>
+#include <linux/export.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/log2.h>
-- 
2.47.2



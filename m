Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B52738FD2A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 10:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhEYIwE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 04:52:04 -0400
Received: from mga03.intel.com ([134.134.136.65]:30993 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230370AbhEYIwD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 04:52:03 -0400
IronPort-SDR: 6q5pPIbwV5Z/dFlCEyQPRZNoH67xCw+4+78/i/kBqoUOvWOVV/z5llUWz9xf1aFTn+LoS2+u61
 cupsmOUQ55Fw==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="202180436"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="202180436"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 01:50:33 -0700
IronPort-SDR: xMcrAHvvZZgsBp9H+PWSXUoBMwE2P7155S+WQ0G8ASgIX8rdgmenqjTg3E2Pi9XvU12P0uvaE0
 gzS5uTfnDGZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="476319449"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 25 May 2021 01:50:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C5F2A4DB; Tue, 25 May 2021 11:50:53 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: tigerlake: Add Alder Lake-M ACPI ID
Date:   Tue, 25 May 2021 11:50:50 +0300
Message-Id: <20210525085050.34713-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Intel Alder Lake-M PCH has the same GPIO hardware than Tiger Lake-LP
PCH but the ACPI ID is different. Add this new ACPI ID to the list of
supported devices.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 75b6d66955bf..3e4ef2b87526 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -749,6 +749,7 @@ static const struct acpi_device_id tgl_pinctrl_acpi_match[] = {
 	{ "INT34C5", (kernel_ulong_t)&tgllp_soc_data },
 	{ "INT34C6", (kernel_ulong_t)&tglh_soc_data },
 	{ "INTC1055", (kernel_ulong_t)&tgllp_soc_data },
+	{ "INTC1057", (kernel_ulong_t)&tgllp_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tgl_pinctrl_acpi_match);
-- 
2.30.2


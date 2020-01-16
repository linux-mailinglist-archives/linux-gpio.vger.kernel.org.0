Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EADF913D89B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 12:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgAPLJz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 06:09:55 -0500
Received: from mga07.intel.com ([134.134.136.100]:3378 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgAPLJy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jan 2020 06:09:54 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jan 2020 03:09:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; 
   d="scan'208";a="218495511"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 16 Jan 2020 03:09:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 595042FA; Thu, 16 Jan 2020 13:09:52 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: sunrisepoint: Add Coffee Lake-S ACPI ID
Date:   Thu, 16 Jan 2020 13:09:51 +0200
Message-Id: <20200116110951.31644-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Intel Coffee Lake-S PCH has the same GPIO hardware than Sunrisepoint-H
PCH but the ACPI ID is different. Add this new ACPI ID to the list of
supported devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index d936e7aa74c4..330c8f077b73 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -589,6 +589,7 @@ static const struct intel_pinctrl_soc_data spth_soc_data = {
 
 static const struct acpi_device_id spt_pinctrl_acpi_match[] = {
 	{ "INT344B", (kernel_ulong_t)&sptlp_soc_data },
+	{ "INT3451", (kernel_ulong_t)&spth_soc_data },
 	{ "INT345D", (kernel_ulong_t)&spth_soc_data },
 	{ }
 };
-- 
2.24.1


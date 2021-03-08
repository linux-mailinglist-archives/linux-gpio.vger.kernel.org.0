Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B08D3313C9
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhCHQtX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:49:23 -0500
Received: from mga07.intel.com ([134.134.136.100]:24714 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229701AbhCHQtS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 11:49:18 -0500
IronPort-SDR: 49jO2p3SBEq0G2YSzBv518NuJXTEEE7UA9l7vo/KVjgbBNwn3miTGhG7dlHJDV4rryqGIvBVi1
 bgv5UJsl4XtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="252091658"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="252091658"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:49:18 -0800
IronPort-SDR: 1W/47mG3zvkWr4PTUfxIvDb2TyCYtp/6P6ryksukLDIcejkN5GAjUi9hqkxLIUPntPiEmh89L+
 +p7GA86ZZomg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="402886480"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2021 08:49:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7F71E147; Mon,  8 Mar 2021 18:49:16 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH v1 1/1] pinctrl: intel: Show the GPIO base calculation explicitly
Date:   Mon,  8 Mar 2021 18:49:10 +0200
Message-Id: <20210308164910.87286-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During the split of intel_pinctrl_add_padgroups(), the _by_size() variant
missed the GPIO base calculations and hence made unable to retrieve proper
GPIO number.

Assign the gpio_base explicitly in _by_size() variant.

While at it, differentiate NOMAP case with the rest in _by_gpps() variant.

Fixes: 036e126c72eb ("pinctrl: intel: Split intel_pinctrl_add_padgroups() for better maintenance")
Reported-and-tested-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index e015345bf8f4..795d60d9ebba 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1356,6 +1356,7 @@ static int intel_pinctrl_add_padgroups_by_gpps(struct intel_pinctrl *pctrl,
 				gpps[i].gpio_base = 0;
 				break;
 			case INTEL_GPIO_BASE_NOMAP:
+				break;
 			default:
 				break;
 		}
@@ -1392,6 +1393,7 @@ static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
 		gpps[i].size = min(gpp_size, npins);
 		npins -= gpps[i].size;
 
+		gpps[i].gpio_base = gpps[i].base;
 		gpps[i].padown_num = padown_num;
 
 		/*
-- 
2.30.1


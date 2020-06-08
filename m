Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EA81F1A3F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 15:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbgFHNnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 09:43:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:9553 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729756AbgFHNnG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 09:43:06 -0400
IronPort-SDR: X9OPMhA53h/0GN44i6DWQXB8mLFPoinmmhMeXJawz4G2rAf9fxcliZvMDJ5GMtfLwOAZtMVAIr
 yBVTTTG8wfkw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 06:43:05 -0700
IronPort-SDR: jlP4ACtujYUFPKSI7IHQNnMLxEbV3MD2WRokO8F42qlaYwu9PuCIcD0eOodJmeUxhBtK6iYsfE
 Zd+ujxYPLL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="472692071"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2020 06:43:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C19A81D4; Mon,  8 Jun 2020 16:43:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/6] gpio: dwapb: Read GPIO base from snps,gpio-base property
Date:   Mon,  8 Jun 2020 16:42:56 +0300
Message-Id: <20200608134300.76091-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For backward compatibility with some legacy devices, introduce
a new property snps,gpio-base to read GPIO base. Don't advertise
to discourage users from utilizing it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index a7ca72086511..e3d7589434eb 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -599,7 +599,8 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			pp->ngpio = 32;
 		}
 
-		pp->gpio_base	= -1;
+		if (fwnode_property_read_u32(fwnode, "snps,gpio-base", &pp->gpio_base))
+			pp->gpio_base = -1;
 
 		/*
 		 * Only port A can provide interrupts in all configurations of
-- 
2.27.0.rc2


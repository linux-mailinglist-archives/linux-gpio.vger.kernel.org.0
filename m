Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D39191A3AFC
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgDIT73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:29 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbgDIT73 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:29 -0400
IronPort-SDR: BuoOC34MnW28Z+vbd0OYBLhoB7OxSk4ZZbjzH//Hjv2FpLVOkFC133wpnvZjZi5MYeN6xnsEw4
 U0Y4U80UgQ1g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:29 -0700
IronPort-SDR: kl8qEAxVlGenLQdfxE4JQ+rivjtPX5k5bWjuJ7HOQFjf5cPo1BMBH4uZFpiwGAqHxdeW8QKpoi
 jnASgac0PMng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745417"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:27 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 15/16] clk: hifiberry-dacpro: add delay on clock prepare/deprepare
Date:   Thu,  9 Apr 2020 14:58:40 -0500
Message-Id: <20200409195841.18901-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a delay to make sure the PCM512x codec can detect SCLK presence.

The initial code from the Raspberry tree used msleep(2), which can be
up to 20ms. A delay of 5-10ms seems fine in practice.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index f1f5af260083..2907b203fcf2 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/kernel.h>
@@ -145,6 +146,8 @@ static int clk_hifiberry_dacpro_prepare(struct clk_hw *hw)
 	default:
 		return -EINVAL;
 	}
+	/* wait for SCLK update to be detected by PCM512x codec */
+	usleep_range(5000, 10000);
 
 	clk->prepared = 1;
 
@@ -168,6 +171,8 @@ static void clk_hifiberry_dacpro_unprepare(struct clk_hw *hw)
 	default:
 		return;
 	}
+	/* wait for SCLK update to be detected by PCM512x codec */
+	usleep_range(5000, 10000);
 
 	clk->prepared = false;
 }
-- 
2.20.1


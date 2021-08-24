Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17923F632A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhHXQti (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:49:38 -0400
Received: from mga02.intel.com ([134.134.136.20]:10241 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233322AbhHXQt0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550761"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550761"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036874"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:38 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 12/20] gpio: Add event count to Intel(R) PMC Timed I/O driver
Date:   Tue, 24 Aug 2021 22:17:53 +0530
Message-Id: <20210824164801.28896-13-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Implement event count interface added to GPIOlib in Intel PMC
Timed I/O device

The Intel(R) PMC Timed I/O device has an event count register counting
the number of missed input edges. The register interface captures the
event count and timestamp of the last event. For an event rate
exceeding the rate that software can read events, the software can use
the missed event count to calculate average event rates.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpio-intel-tio-pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-intel-tio-pmc.c b/drivers/gpio/gpio-intel-tio-pmc.c
index f57f521edc40..7c4dd5c2661c 100644
--- a/drivers/gpio/gpio-intel-tio-pmc.c
+++ b/drivers/gpio/gpio-intel-tio-pmc.c
@@ -60,6 +60,7 @@ struct intel_pmc_tio_get_time_arg {
 	struct intel_pmc_tio_chip *tio;
 	u32 eflags;
 	u32 event_id;
+	u32 event_count;
 	u64 abs_event_count;
 };
 
@@ -276,6 +277,7 @@ static int intel_pmc_tio_get_time(ktime_t *device_time,
 
 	*system_counterval = convert_art_to_tsc(art_timestamp);
 	arg->abs_event_count = abs_event_count;
+	arg->event_count = rel_event_count;
 	arg->event_id = 0;
 	arg->event_id |= (flags & GPIO_V2_LINE_FLAG_EDGE_RISING) ?
 		GPIO_V2_LINE_EVENT_RISING_EDGE : 0;
@@ -310,6 +312,7 @@ static int intel_pmc_tio_do_poll(struct gpio_chip *chip, unsigned int offset,
 			data->timestamp = ktime_to_ns(xtstamp.sys_realtime);
 			data->id = arg.event_id;
 			tio->last_event_count = arg.abs_event_count;
+			data->event_count = arg.event_count;
 		}
 		if (!err || err == -EAGAIN)
 			break;
-- 
2.17.1


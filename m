Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F32133DEA0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 21:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhCPUZh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 16:25:37 -0400
Received: from smtp-fw-9103.amazon.com ([207.171.188.200]:35386 "EHLO
        smtp-fw-9103.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhCPUZL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 16:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615926311; x=1647462311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=3JSBlUFKcyKIVVyh2tD/o2Ia9bYRXCVww7vZxwWh5WE=;
  b=iUg0zHuaj+qA+3D67B3pxxXw5eZBQ8EICBvihzNqvQfGlrPgrUPvmkYU
   bOkHKljP5A2ah4jEGWFknRqIGRH+gFaBhkdUQbf9QGHgq8Uvb9Iw0HCKx
   gwHyZsptYVn09fZ3BebZGm3J29vg2VE5A/z/wDBtHv0FWYJkS/voIP+1s
   A=;
X-IronPort-AV: E=Sophos;i="5.81,254,1610409600"; 
   d="scan'208";a="919406473"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP; 16 Mar 2021 20:25:03 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS id BC160A22B2;
        Tue, 16 Mar 2021 20:25:02 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.160.48) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 16 Mar 2021 20:24:56 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <tony@atomide.com>, <haojian.zhuang@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH v2 1/3] pinctrl: pinctrl-single: remove unused variable
Date:   Tue, 16 Mar 2021 22:24:32 +0200
Message-ID: <20210316202434.27555-2-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316202434.27555-1-hhhawa@amazon.com>
References: <20210316202434.27555-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.48]
X-ClientProxiedBy: EX13D02UWB003.ant.amazon.com (10.43.161.48) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove unused parameter 'num_pins_in_register' from
pcs_allocate_pin_table().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/pinctrl/pinctrl-single.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 7771316dfffa..91c638b85d2c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -703,14 +703,12 @@ static int pcs_add_pin(struct pcs_device *pcs, unsigned offset,
 static int pcs_allocate_pin_table(struct pcs_device *pcs)
 {
 	int mux_bytes, nr_pins, i;
-	int num_pins_in_register = 0;
 
 	mux_bytes = pcs->width / BITS_PER_BYTE;
 
 	if (pcs->bits_per_mux) {
 		pcs->bits_per_pin = fls(pcs->fmask);
 		nr_pins = (pcs->size * BITS_PER_BYTE) / pcs->bits_per_pin;
-		num_pins_in_register = pcs->width / pcs->bits_per_pin;
 	} else {
 		nr_pins = pcs->size / mux_bytes;
 	}
-- 
2.17.1


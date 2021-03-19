Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A663420CB
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 16:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhCSPWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 11:22:15 -0400
Received: from smtp-fw-9103.amazon.com ([207.171.188.200]:36452 "EHLO
        smtp-fw-9103.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhCSPWM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 11:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616167332; x=1647703332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=3JSBlUFKcyKIVVyh2tD/o2Ia9bYRXCVww7vZxwWh5WE=;
  b=i+t+5v4lnBJcUEAHk1Nz1ALb1o3cUP8Bi7siHUg8GfBhkxOEBTjg7sN5
   X5GDhpIWBzKrk7XzzvNTuVTXxt+GhHwmV5Oepwjs9YXS3s9oe071ShXpd
   2FLsQ9GE3OL4mFPDpQy59rw0qHv603Ejg7iC5DfxGRZTEDbbNG2RdY5SO
   k=;
X-IronPort-AV: E=Sophos;i="5.81,262,1610409600"; 
   d="scan'208";a="920121226"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP; 19 Mar 2021 15:22:03 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS id 7C521A181C;
        Fri, 19 Mar 2021 15:22:02 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.161.244) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 19 Mar 2021 15:21:55 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <andy.shevchenko@gmail.com>, <tony@atomide.com>,
        <haojian.zhuang@linaro.org>, <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH v4 1/3] pinctrl: pinctrl-single: remove unused variable
Date:   Fri, 19 Mar 2021 17:21:31 +0200
Message-ID: <20210319152133.28705-2-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319152133.28705-1-hhhawa@amazon.com>
References: <20210319152133.28705-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.244]
X-ClientProxiedBy: EX13D37UWA004.ant.amazon.com (10.43.160.23) To
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


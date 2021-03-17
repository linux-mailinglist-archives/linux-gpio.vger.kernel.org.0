Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F6E33FA8E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 22:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhCQVmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 17:42:31 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:17787 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbhCQVmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 17:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616017343; x=1647553343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=3JSBlUFKcyKIVVyh2tD/o2Ia9bYRXCVww7vZxwWh5WE=;
  b=RszIk+8ZoFTPM1N/Kqq8kxgeMjLSuXzuldh/+qw9wVAxKU5OaL3mOn4D
   G4zeTlHs0HGisRu1SSBdE8CjiLv+f7RPNq/QaThvbkYv+V79gCXlP/woM
   Fy1I1PxF45uyAC5l36VTDH2n96wyeyJu4um6I4unCTnk3vbfY9YAiaZqC
   w=;
X-IronPort-AV: E=Sophos;i="5.81,257,1610409600"; 
   d="scan'208";a="121282096"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 17 Mar 2021 21:42:21 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS id A90E81A07C3;
        Wed, 17 Mar 2021 21:42:19 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.161.86) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 17 Mar 2021 21:42:12 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <andy.shevchenko@gmail.com>, <tony@atomide.com>,
        <haojian.zhuang@linaro.org>, <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH v3 1/3] pinctrl: pinctrl-single: remove unused variable
Date:   Wed, 17 Mar 2021 23:41:47 +0200
Message-ID: <20210317214149.20833-2-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317214149.20833-1-hhhawa@amazon.com>
References: <20210317214149.20833-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.86]
X-ClientProxiedBy: EX13D48UWB004.ant.amazon.com (10.43.163.74) To
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


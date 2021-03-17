Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5644033FA9A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 22:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhCQVnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 17:43:03 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:14153 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbhCQVmg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 17:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616017356; x=1647553356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=7rHP/Il1MAYfTug9uW2SOeBpIjYBzsbh242X2Z+B5kw=;
  b=sWNhGj5sdRqRBGjt5JLdg9t3k+8VqJSzuVtM1SjwkgBQv6QOGkGFwcA4
   Pcr/ROgHebV3MTPK+Up8anrdQLgJuTScbF8T3YJ1APClNdFHmrC07Exhn
   PbUr1o60FBSkNsSQC9ncvphfG1k7v+IQrGypyh2V8kRtgtzj19A9B0H6N
   I=;
X-IronPort-AV: E=Sophos;i="5.81,257,1610409600"; 
   d="scan'208";a="99769692"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 17 Mar 2021 21:42:27 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS id 4729FC019F;
        Wed, 17 Mar 2021 21:42:26 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.161.86) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 17 Mar 2021 21:42:19 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <andy.shevchenko@gmail.com>, <tony@atomide.com>,
        <haojian.zhuang@linaro.org>, <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH v3 2/3] pinctrl: pinctrl-single: remove unused parameter
Date:   Wed, 17 Mar 2021 23:41:48 +0200
Message-ID: <20210317214149.20833-3-hhhawa@amazon.com>
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

Remove unused parameter 'pin_pos' from pcs_add_pin().

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/pinctrl/pinctrl-single.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 91c638b85d2c..f3394517cb2e 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -656,10 +656,8 @@ static const struct pinconf_ops pcs_pinconf_ops = {
  * pcs_add_pin() - add a pin to the static per controller pin array
  * @pcs: pcs driver instance
  * @offset: register offset from base
- * @pin_pos: unused
  */
-static int pcs_add_pin(struct pcs_device *pcs, unsigned offset,
-		unsigned pin_pos)
+static int pcs_add_pin(struct pcs_device *pcs, unsigned int offset)
 {
 	struct pcs_soc_data *pcs_soc = &pcs->socdata;
 	struct pinctrl_pin_desc *pin;
@@ -727,16 +725,14 @@ static int pcs_allocate_pin_table(struct pcs_device *pcs)
 		unsigned offset;
 		int res;
 		int byte_num;
-		int pin_pos = 0;
 
 		if (pcs->bits_per_mux) {
 			byte_num = (pcs->bits_per_pin * i) / BITS_PER_BYTE;
 			offset = (byte_num / mux_bytes) * mux_bytes;
-			pin_pos = i % num_pins_in_register;
 		} else {
 			offset = i * mux_bytes;
 		}
-		res = pcs_add_pin(pcs, offset, pin_pos);
+		res = pcs_add_pin(pcs, offset);
 		if (res < 0) {
 			dev_err(pcs->dev, "error adding pins: %i\n", res);
 			return res;
-- 
2.17.1


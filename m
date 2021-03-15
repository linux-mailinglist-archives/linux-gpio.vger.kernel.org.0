Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE96B33BF59
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 16:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbhCOPCv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 11:02:51 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:41256 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbhCOPCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 11:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615820542; x=1647356542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=MClbUWH/t1IvBDSDmoru1ZjJma+KywzZ9kr5JOM7eLk=;
  b=gbsP9FGlUoSouH8kguFHRqRt/aOXUUS7vME1CS1iDMf2jJJaxgJYXQaE
   RCb1A9rS63nTXTbSeZXc+kbIjR4Xw7qqTUERu/g9dpWfhgmADYpGtPCkq
   DnDukodVyLEaoXjXEzPdEaMpQ7zpHo682DdpjslFziIPUHiXhfInFbFvv
   w=;
IronPort-HdrOrdr: A9a23:0j59v6x32Mi2f4cBFNHyKrPxVOskLtp033Aq2lEZdDV/dNCenc
 y12OkcvCWE7Ao5cntIo769EYOHRm7R8oMw3JkJMd6ZLWvbkUaLDKUn14vtxDX8Bzbzn9Q3v5
 tIXqBiBLTLfCFHpOn37ASyG9wjhPmrmZrY/tv24GxqSWhRBp1IyydcJkKlHlZtRA9AbKBJd6
 a0wsZcvTKvdTA2Q62AZ0UtZOTIq93VmJ+OW3dvOzcd5BCKnXeU7tfBfySw5AsUUD9E3N4ZkV
 TtrgqR3MqemsD+4jv15En1q7B/uP6k8fdnLPzJt/gtBlzX+2OVTbUkc5mrjxYT5MWC1X4GuO
 Tlyi1QWPhb2jf2ZWG6oRzk3k3F3Cw143Hv6XLwuwqEneXJAAgXMY5mmZ9WdBvf5SMbzalB7J
 4=
X-IronPort-AV: E=Sophos;i="5.81,249,1610409600"; 
   d="scan'208";a="93106824"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 15 Mar 2021 15:00:14 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS id 118FCA1C3C;
        Mon, 15 Mar 2021 15:00:13 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.160.180) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 15 Mar 2021 15:00:06 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <tony@atomide.com>, <haojian.zhuang@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH 1/2] pinctrl: pinctrl-single: remove unused parameter
Date:   Mon, 15 Mar 2021 16:59:43 +0200
Message-ID: <20210315145944.20412-2-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315145944.20412-1-hhhawa@amazon.com>
References: <20210315145944.20412-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.180]
X-ClientProxiedBy: EX13D32UWB002.ant.amazon.com (10.43.161.139) To
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
index 7771316dfffa..8a7922459896 100644
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
@@ -729,16 +727,14 @@ static int pcs_allocate_pin_table(struct pcs_device *pcs)
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


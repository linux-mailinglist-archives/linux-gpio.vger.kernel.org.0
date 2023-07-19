Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F378759F9D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 22:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjGSUXR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 16:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjGSUXR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 16:23:17 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B061FD5
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 13:23:15 -0700 (PDT)
Received: from localhost.localdomain (178.176.79.158) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 19 Jul
 2023 23:23:08 +0300
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     <lvc-patches@linuxtesting.org>
Subject: [PATCH 2/3] pinctrl: core: handle radix_tree_insert() errors in pinctrl_register_one_pin()
Date:   Wed, 19 Jul 2023 23:22:52 +0300
Message-ID: <20230719202253.13469-3-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20230719202253.13469-1-s.shtylyov@omp.ru>
References: <20230719202253.13469-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [178.176.79.158]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 07/19/2023 17:59:56
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 178730 [Jul 19 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 524 524 9753033d6953787301affc41bead8ed49c47b39d
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.79.158 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;178.176.79.158:7.7.3,7.4.1,7.7.1,7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {iprep_blacklist}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.79.158
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/19/2023 18:04:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/19/2023 5:01:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctrl_register_one_pin() doesn't check the result of radix_tree_insert()
despite they both may return a negative error code.  Linus Walleij said he
has copied the radix tree code from kernel/irq/ where the functions calling
radix_tree_insert() are *void* themselves; I think it makes more sense to
propagate the errors from radix_tree_insert() upstream if we can do that...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/pinctrl/core.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3c3fc4ae0f2f..e9dc9638120a 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -205,6 +205,7 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 				    const struct pinctrl_pin_desc *pin)
 {
 	struct pin_desc *pindesc;
+	int error;
 
 	pindesc = pin_desc_get(pctldev, pin->number);
 	if (pindesc) {
@@ -226,18 +227,25 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 	} else {
 		pindesc->name = kasprintf(GFP_KERNEL, "PIN%u", pin->number);
 		if (!pindesc->name) {
-			kfree(pindesc);
-			return -ENOMEM;
+			error = -ENOMEM;
+			goto failed;
 		}
 		pindesc->dynamic_name = true;
 	}
 
 	pindesc->drv_data = pin->drv_data;
 
-	radix_tree_insert(&pctldev->pin_desc_tree, pin->number, pindesc);
+	error = radix_tree_insert(&pctldev->pin_desc_tree, pin->number, pindesc);
+	if (error)
+		goto failed;
+
 	pr_debug("registered pin %d (%s) on %s\n",
 		 pin->number, pindesc->name, pctldev->desc->name);
 	return 0;
+
+failed:
+	kfree(pindesc);
+	return error;
 }
 
 static int pinctrl_register_pins(struct pinctrl_dev *pctldev,
-- 
2.26.3


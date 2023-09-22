Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C3C7AB330
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Sep 2023 15:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjIVOAD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 10:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjIVOAC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 10:00:02 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD0A92
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 06:59:55 -0700 (PDT)
Received: from spb1wst022.omp.ru (81.3.167.34) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Fri, 22 Sep
 2023 16:59:50 +0300
From:   Karina Yankevich <k.yankevich@omp.ru>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Karina Yankevich <k.yankevich@omp.ru>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-gpio@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 1/2] pinctrl: mediatek: paris: handle mtk_hw_set_value() errors in mtk_pmx_set_mux()
Date:   Fri, 22 Sep 2023 16:59:25 +0300
Message-ID: <20230922135926.3653428-1-k.yankevich@omp.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [81.3.167.34]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 09/22/2023 12:37:24
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 180051 [Sep 22 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: k.yankevich@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 534 534 808c2ea49f7195c68d40844e073217da4fa0d1e3
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 81.3.167.34 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;81.3.167.34:7.1.2;127.0.0.199:7.1.2;spb1wst022.omp.ru:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 81.3.167.34
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/22/2023 13:37:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/22/2023 9:08:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

mtk_pmx_set_mux() doesn't check the result of mtk_hw_set_value()
despite it may return negative error code. Propagate error code
to caller functions.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Karina Yankevich <k.yankevich@omp.ru>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 33d6c3fb7908..b7cb5a1f1060 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -779,9 +779,7 @@ static int mtk_pmx_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[grp->pin];
-	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE, desc_func->muxval);
-
-	return 0;
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE, desc_func->muxval);
 }
 
 static const struct pinmux_ops mtk_pmxops = {
-- 
2.25.1


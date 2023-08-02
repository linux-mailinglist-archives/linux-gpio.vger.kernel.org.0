Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA2476D8CC
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 22:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbjHBUrz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 16:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjHBUry (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 16:47:54 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6B926B2
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 13:47:53 -0700 (PDT)
Received: from [192.168.1.103] (178.176.74.36) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 2 Aug 2023
 23:47:46 +0300
To:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] pinctrl: at91-pio4: drop useless check in
 atmel_conf_pin_config_dbg_show()
Organization: Open Mobile Platform
Message-ID: <4ab2f59f-45c1-76a2-94da-3331e8ec4e35@omp.ru>
Date:   Wed, 2 Aug 2023 23:47:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.74.36]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 08/02/2023 20:19:11
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179036 [Aug 02 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: 178.176.74.36:7.7.3,7.1.2,7.4.1;127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {iprep_blacklist}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.74.36
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/02/2023 20:23:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 8/2/2023 6:00:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In atmel_conf_pin_config_dbg_show(), checking atmel_pioctrl->pins[pin_id]
against being NULL doesn't make any sense as it gets derefenced first and
the driver's probe() method immediately returns -ENOMEM when devm_kzalloc()
returns NULL for any atmel_pioctrl->pins[] element anyway, thus failing to
register the device...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the 'devel' branch of Linus W.'s 'linux-pinctrl.git' repo.

 drivers/pinctrl/pinctrl-at91-pio4.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

Index: linux-pinctrl/drivers/pinctrl/pinctrl-at91-pio4.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/pinctrl-at91-pio4.c
+++ linux-pinctrl/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -939,10 +939,9 @@ static void atmel_conf_pin_config_dbg_sh
 	if (!atmel_pioctrl->pins[pin_id]->device)
 		return;
 
-	if (atmel_pioctrl->pins[pin_id])
-		seq_printf(s, " (%s, ioset %u) ",
-			   atmel_pioctrl->pins[pin_id]->device,
-			   atmel_pioctrl->pins[pin_id]->ioset);
+	seq_printf(s, " (%s, ioset %u) ",
+		   atmel_pioctrl->pins[pin_id]->device,
+		   atmel_pioctrl->pins[pin_id]->ioset);
 
 	conf = atmel_pin_config_read(pctldev, pin_id);
 	if (conf & ATMEL_PIO_PUEN_MASK)

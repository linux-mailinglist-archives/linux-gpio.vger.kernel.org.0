Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD7B51434B0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2020 01:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgAUAN7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 19:13:59 -0500
Received: from mail-mw2nam10on2052.outbound.protection.outlook.com ([40.107.94.52]:6337
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727009AbgAUAN6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jan 2020 19:13:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/+uU96IaiIOvxTz3Flb4VYzvMsLHxt+S+c3l1AbXf85Jf6eRmNCejHXHFaVP96MLGfAlX8KItNgx5+V98oCpfpH0egvG7oDhoQ9zqTdk7+UIfjLsC0G1uJSeDcVZfaZsAHWECXDPJcDnKlL6Uti2V6z2KQmIdOhjxz5226tjKwe5QZhCigmtVRW6QIZyuK2ACgBKVx2kbVRTDvS3fU9cnPXssQU27Lg4bexzdX91MXDI7ILnuI8iKOyDW8C1YcjWrQ3HA+KsXvk0cuDgJcBUmEefX0Q4EGrEEsY3uRr7UdbQ4A7bKLMI4M7u7p0NOq7m1H9vg115lon+lKBoCynNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBW8s0Q5/7/NchBOB41g3fhl06+di8ZHaGXNaWBwmaY=;
 b=KweUGbNXQ837UwrjErDvyDJJYNG8SsjCNSVsh7TdTgbnKi95LhyD77tqeE93mR0nD8dAU5oxNEfcpjd2WMhAOWwS4FIpE7gzQIY+xKkdovGGR/CDDReQugHlZ+7YXuEFMMWx3eL8MjDtSFI6YyAbuAptdLFSunWZfJssQGMMw6pcKTvgfUiBiqalTRA2WHBWhw0y3w9yJhqnRgxAxMs7sUZyC4SWEaX9C0TVRLu2wPtuNwnTrVZw9mRm71wRLRC7EZQxKMrqSiHCgcO3dm1bmhnUCM9mMm46PfxSU8kjMJC68Yl4ElfERl9gsXyPRq9TrUXrIX4aseMtcU8WHB5ilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 60.241.24.90) smtp.rcpttodomain=baylibre.com smtp.mailfrom=opengear.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=opengear.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBW8s0Q5/7/NchBOB41g3fhl06+di8ZHaGXNaWBwmaY=;
 b=1CC5YenGJ89RAtY9EtVn6xAOZ8U816Iy1sZkDpg3UNpzd2J80ff77MfzEfQGSWqZmjcZ8pB/w4mTAr7XMDoWb+ct74CkH9i7PXl8hww+PkUcI9XQU2NoVIjVoqGiJyKCnoBoyPHjpa2HmK4w/N1QAToGkzk+CvMfYvxn6kNjkxk=
Received: from BN8PR15CA0038.namprd15.prod.outlook.com (2603:10b6:408:80::15)
 by CY4PR15MB1365.namprd15.prod.outlook.com (2603:10b6:903:fd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.24; Tue, 21 Jan
 2020 00:13:56 +0000
Received: from CO1NAM04FT051.eop-NAM04.prod.protection.outlook.com
 (2a01:111:f400:7e4d::209) by BN8PR15CA0038.outlook.office365.com
 (2603:10b6:408:80::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend
 Transport; Tue, 21 Jan 2020 00:13:55 +0000
Authentication-Results: spf=pass (sender IP is 60.241.24.90)
 smtp.mailfrom=opengear.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=opengear.com;
Received-SPF: Pass (protection.outlook.com: domain of opengear.com designates
 60.241.24.90 as permitted sender) receiver=protection.outlook.com;
 client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
 CO1NAM04FT051.mail.protection.outlook.com (10.152.90.255) with Microsoft SMTP
 Server id 15.20.2644.19 via Frontend Transport; Tue, 21 Jan 2020 00:13:54
 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com [192.168.254.90])
        by postman.bne.opengear.com (Postfix) with ESMTPS id C8900DEBA6;
        Tue, 21 Jan 2020 10:13:51 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
        id B059F42945E4; Tue, 21 Jan 2020 10:13:51 +1000 (AEST)
From:   Dan Callaghan <dan.callaghan@opengear.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Cc:     Dan Callaghan <dan.callaghan@opengear.com>
Subject: [PATCH RESEND] gpiolib: hold gpio devices lock until ->descs array is initialised
Date:   Tue, 21 Jan 2020 10:12:17 +1000
Message-Id: <20200121001216.15964-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90;IPV:;CTRY:AU;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(39840400004)(346002)(136003)(199004)(189003)(6266002)(478600001)(70586007)(26005)(2906002)(186003)(4326008)(6666004)(356004)(5660300002)(110136005)(1076003)(8936002)(42186006)(2616005)(8676002)(316002)(246002)(107886003)(336012)(7636002)(426003)(70206006)(36756003)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR15MB1365;H:postman.bne.opengear.com;FPR:;SPF:Pass;LANG:en;PTR:brisbane.opengear.com;A:1;MX:1;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2e074d8-fdb9-482f-28a1-08d79e06cd70
X-MS-TrafficTypeDiagnostic: CY4PR15MB1365:|CY4PR15MB1365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR15MB1365B07DF78E037362A06B2CB80D0@CY4PR15MB1365.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0289B6431E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dkkSLTHfi1RYYAE7HtzXJaUNTxfJc/R/qezPpyzbgSmXKGiUJGF/QJlDdcYZfe58bvOAxizepA0gH8pxFUnjx7ksU+Z76fiuT9ylRDurBogRTeEiHfsPC50cNBNM/ccdOwN3MHTwcR3Cp8ywVusMv5QzJTZsU6uFKnalBEBfscx+4E/YPyVce7WpXM0j0RQy4oa132Bz/jbDyf0SCv0ObnOstJYn65gePU2KIn/9Vs83+pkNbBYZmooN+HukJzIQ54auB26rJrGfjCSwQrBhWA20CMAm0NFknBHZqvsBD9QgHpzeRdu6ppzjN+B2qmXWk7NAOeiHZNO/GTWCXcLHk4bJcAa/JodwyX6u4JiN6Mus4EoVbCqh6cmJUY0z8Zhbzcgo217A/3ufcimuMVsQDytF2Mnquf6H7iHlgGCJQ4h9UV67tcM/Y9NAMYNDnVxr
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2020 00:13:54.6093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e074d8-fdb9-482f-28a1-08d79e06cd70
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a;Ip=[60.241.24.90];Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1365
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If a driver consuming the GPIO chip is being probed at the same time as
the GPIO driver is registering the chip, it is possible for the
consuming driver to see the ->descs array in an uninitialised state.
For example, the gpio-keys-polled driver can fail like this:

    kernel: gpiod_request: invalid GPIO (no device)
    kernel: gpio-keys-polled PRP0001:07: failed to get gpio: -22
    kernel: gpio-keys-polled: probe of PRP0001:07 failed with error -22

This patch makes gpiochip_add() hold the lock protecting gpio_devices
until it has finished setting desc->gdev on the newly inserted list
entry.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
Resending this one because I failed to cc the maintainers on the 
original posting, sorry about that.

 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 78a16e42f222..33c72fb12bb5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1495,11 +1495,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		goto err_free_label;
 	}
 
-	spin_unlock_irqrestore(&gpio_lock, flags);
-
 	for (i = 0; i < chip->ngpio; i++)
 		gdev->descs[i].gdev = gdev;
 
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
-- 
2.21.0


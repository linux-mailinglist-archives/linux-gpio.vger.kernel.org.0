Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E67410E52D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 06:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfLBFA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 00:00:57 -0500
Received: from mail-eopbgr740083.outbound.protection.outlook.com ([40.107.74.83]:53664
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726399AbfLBFA5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Dec 2019 00:00:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkM+s+R865ycntaZNjBbLZXrxyowgHW1sWSiV8WcDoGUdpyqvW4xYXFLezSDypAa4xbGHe+a2/FZFA9NpEtxVN4LkMFm8+WeU3KBEsCytQJsqN7JwvPWre8lhtVqqqiI8e2otxiLf0vcKJJoiT9Ga5VtNvV8YYIe/eVbhC+f6HZ2TYBsz9iblShbZVE4Y0jH8cQi9cIYmfOAJ9fSBE3IbJ9Hv5W+fXYWWu7fHeWG3Fz6L+50/woNPkd/tcv+W1mpibqeJ3UdqO3eJxmlX8ErEVgTrCYXhREqOyBtBXlOAMfjqz4vAwI+RT0PukowT2Ygbn1A9eC/upUZ5dge6Cdbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxXdEauffoAjQrkRE8eQ/RalQl9E+fa8D7Bp5aT7hl4=;
 b=TolCZAS3OruzADbA7/z9gbiiEIV30YlZxX6X+HdKBpairzeXqOCjF+K7PPtuSYCehyrG9T2N4olllp78xxJNl2HUQopK7ekYZkuCPZ61p+0P6JTqOUKiEi995uCjKx3UBmENqLTabxt03YBdO5h7lQdExk4UK+ZBpbEQokiK6XZvvb6eYAQO+CqhgmKW4WYqwa0cPcxdEp0Q8mPIPljItf8mfiyfQ1Cn6bPWwLXGNc0ZwLOOzrPfqzsF+lnGd0Tq3HRFE+jx1JLU/27mCxhx0KGmE3KN0mTShutPqwysVSXqxOEKmzKWV2pMcLGXcLjv6LaSHRErzZdRHyIonmiLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 60.241.24.90) smtp.rcpttodomain=opengear.com smtp.mailfrom=opengear.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=opengear.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxXdEauffoAjQrkRE8eQ/RalQl9E+fa8D7Bp5aT7hl4=;
 b=GutPNEVgy4S/0t076/KQEajHskg9P3AMb70soW1usRno/Sx+ardXO9ggJ+qFoDt0Y9dbMmAAO3kC+gNs8SAX2FBVFntnEjkvFqmkyk0Lryg1JPtQpUYgam8V+bWLJK1/r8uvs3j0ZWDgJTmDIavhhpark7LdGcyEr5wAlpQksmI=
Received: from MN2PR15CA0032.namprd15.prod.outlook.com (2603:10b6:208:1b4::45)
 by BYAPR15MB2231.namprd15.prod.outlook.com (2603:10b6:a02:8f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Mon, 2 Dec
 2019 05:00:52 +0000
Received: from CO1NAM04FT005.eop-NAM04.prod.protection.outlook.com
 (2a01:111:f400:7e4d::208) by MN2PR15CA0032.outlook.office365.com
 (2603:10b6:208:1b4::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Mon, 2 Dec 2019 05:00:50 +0000
Authentication-Results: spf=pass (sender IP is 60.241.24.90)
 smtp.mailfrom=opengear.com; opengear.com; dkim=none (message not signed)
 header.d=none;opengear.com; dmarc=pass action=none header.from=opengear.com;
Received-SPF: Pass (protection.outlook.com: domain of opengear.com designates
 60.241.24.90 as permitted sender) receiver=protection.outlook.com;
 client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
 CO1NAM04FT005.mail.protection.outlook.com (10.152.90.149) with Microsoft SMTP
 Server id 15.20.2495.18 via Frontend Transport; Mon, 2 Dec 2019 05:00:47
 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com [192.168.254.90])
        by postman.bne.opengear.com (Postfix) with ESMTPS id 30ACCDEB6E;
        Mon,  2 Dec 2019 15:00:43 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
        id 0FE6242945E4; Mon,  2 Dec 2019 15:00:43 +1000 (AEST)
From:   Dan Callaghan <dan.callaghan@opengear.com>
To:     linux-gpio@vger.kernel.org
Cc:     Dan Callaghan <dan.callaghan@opengear.com>
Subject: [PATCH] gpiolib: hold gpio devices lock until ->descs array is initialised
Date:   Mon,  2 Dec 2019 14:59:54 +1000
Message-Id: <20191202045954.28572-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90;IPV:CAL;CTRY:AU;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(39840400004)(376002)(189003)(199004)(426003)(76130400001)(14444005)(8676002)(5660300002)(70206006)(1076003)(103686004)(51416003)(356004)(36756003)(106002)(26826003)(50226002)(7636002)(305945005)(8936002)(6666004)(4326008)(70586007)(2906002)(246002)(2870700001)(26005)(336012)(478600001)(48376002)(107886003)(186003)(47776003)(44832011)(2351001)(6916009)(316002)(6266002)(42186006)(2361001)(2616005)(50466002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR15MB2231;H:postman.bne.opengear.com;FPR:;SPF:Pass;LANG:en;PTR:brisbane.opengear.com;MX:1;A:1;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38d59a78-64df-4c78-ca3b-08d776e49920
X-MS-TrafficTypeDiagnostic: BYAPR15MB2231:|BYAPR15MB2231:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR15MB22310389290C1C2841E75912B8430@BYAPR15MB2231.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jr6NNDKC/EYGQpGBhb0UH9VY7z5AZvCFZBTmv3LRgRL3bBWZEwWsyLvfe3/mpUvkR/MqKg+E03PtLuEB5le0Fg99esXp9/CZAARdplnRPIoQqQtPhNbz44biAwgBV1QSoymGlUpQU80X+F32ia28jL5A1sKenboCxv2u18Xamu+FRH9I7meUFoWzxAipo3MTjh/XcMDydIqsX3c+vowScHBdh2NH2EcmZ1vY8F3N2M7JcZJanJ/Fru92LQ3sNQ6eRsiWcEGs1/UFh+VCKufThTKOfQt8zlK4xluogWe5R4qvDEtamwxaNMNq1cDUDpORYvxc5Xepc2pvxb91UWl0LEnPq2kG8PE7PFKO5U4dHej9n7Zro2PkY5rrDYW4hpozE2MD7PYy+QPFEsvNETvcOZsUeX6sK89UQG2DQqY60WTKXvyKnCrzOqe8jl3KOS3r
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 05:00:47.6267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d59a78-64df-4c78-ca3b-08d776e49920
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a;Ip=[60.241.24.90];Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2231
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
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index dce0b31f4125..93eec6dbd9c7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1487,11 +1487,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
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


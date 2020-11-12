Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305D42B0AFB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgKLRMp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:12:45 -0500
Received: from mail-bn8nam12on2084.outbound.protection.outlook.com ([40.107.237.84]:40321
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725903AbgKLRMp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:12:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LumxuyuXHP6PAjkHy9ez+1Tep4TA5Dbnz1Pq4so58Wqbsq8ugzQpwbz9Xb+lKmL6mHivVYGvZeQIN2woTzr7ggoe0wVkIyvgvMeR7FJd3oLcTMp3yH2BPUXT/S7KPvnnL5SJPyoFjx0kZu0/Ej6PmD14qoFZY1NruOIuYOtPmMreo/r2MfkM21yyGcMmWyHwUwP7JTQLjz+o6re3vxPQUa9nnE7+DcKrg3nL/LljWp4ZmA9UVfdzwA9Q+E6nI1cJ2+V4f8pYz3sr5K6++YkqaQFf5gVDEDzNDyTJ8RSdhLSYILAHfvJH2gOAWgM/gRV54thZVkXahK1SUmX7L1FRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp4hl4mY7Pap6ASxl/LQ2uHzWlptHiezAo738TJ+pnI=;
 b=oBVaCoLqgvgx/oo7y9zkoEVt6V5ZUuurp9VSqdkVCorSO27dU5Mv0f0hT7eu2Fy/CKnU2euh1T+fGhvJ0fMTXgDu33wMwOosoOnf+EDKtaOrs7H3FnOs/jCAa5a7JbMcHdXJnbzNW/vslATB1mMDut03558t/7/4kQiIWmoItek1leYgzFYGBXq6WDZ6rgJR/Q6TD52nhsAdXFcmp8i0SbfvMBXvAl6/MlSg3pIky542eRUupZV5o4ryH18EJ4Jigh2w7Iikf4zAfi5DRHcmJCGN/9KDwbo0TDAMSWutKTkdVd1++oldLXiWb/On0IAiJCn+dqzOMHuVMTMMZ+FUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp4hl4mY7Pap6ASxl/LQ2uHzWlptHiezAo738TJ+pnI=;
 b=be8uiZVn2N7Z65S262hRbcqL9EG694K913MzedC3LOhiLALln1mrvD1zKfQHLFo3MmRJClb4R5ne7YSk/TQPPLZ8bcWZ+LALNEe0LTQ/q9ohPbq7/i3BoCcDgWGtlkO2hQl0bC/qE6ObmdnVW7N1oAfZrrEJC005pbG6cB0gs0A=
Received: from CY4PR21CA0031.namprd21.prod.outlook.com (2603:10b6:903:12b::17)
 by MW2PR02MB3899.namprd02.prod.outlook.com (2603:10b6:907:3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Thu, 12 Nov
 2020 17:12:39 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::1f) by CY4PR21CA0031.outlook.office365.com
 (2603:10b6:903:12b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.11 via Frontend
 Transport; Thu, 12 Nov 2020 17:12:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:12:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:12:38 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:12:38 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 hancock@sedsystems.ca,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.6] (port=44844 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1kdG9E-0005SG-U8; Thu, 12 Nov 2020 09:12:37 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 1/9] gpio: gpio-xilinx: Arrange headers in sorting order
Date:   Thu, 12 Nov 2020 22:42:20 +0530
Message-ID: <1605201148-4508-2-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e01a081-b23b-437d-7e93-08d8872e28b5
X-MS-TrafficTypeDiagnostic: MW2PR02MB3899:
X-Microsoft-Antispam-PRVS: <MW2PR02MB38996F2777098E950B05AE53AFE70@MW2PR02MB3899.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4wVJaksiQjqetw0atJ7FW3sLbWbLD3l+Ub7TlozoZIc5NG475OEbP7O1Cx9iMxRsg1Vl5xsvnyoORGaKP2bDUPUALHPVnS9RchZTHErifJROqVfl5hELznfsTHVZxoS9capTBe6ULfPe3YR+uoXGZpcXBmPfg2j/mkIDuwe7iGuEPoWsb/SuGEJbBAFeua3U1en3WESTJTem7Ck5DuJ7qALRSo3xCiz7bKYenq8sc3cnAtbl0vc6hZ2v3ULDPpKxN8tHln0mdCmMVGeEPObUJZjOAqhijvcEf7swKT/jBxqBZDAGzBDwuNEgIn/QOVB69oHFexRxTWzUu/deZE/AlJwlcW+7IZQPvKbL9lbTE2jnU6HjM73bc4LnYTEM8s1kE+zDQrx8C3h9tQocS3Lt1Vq/9sF8cXR4NixPw5ohmM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966005)(107886003)(47076004)(82740400003)(8676002)(70206006)(70586007)(83380400001)(4744005)(26005)(6666004)(5660300002)(186003)(36756003)(2906002)(7636003)(7696005)(9786002)(36906005)(336012)(316002)(8936002)(54906003)(426003)(356005)(110136005)(4326008)(44832011)(2616005)(82310400003)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:12:39.2124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e01a081-b23b-437d-7e93-08d8872e28b5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3899
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Arrange header files in sorted order.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V3:
-Created new patch for sorting header files.
---
 drivers/gpio/gpio-xilinx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 3ba1a993c85e..17a8a8f90d84 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -6,13 +6,13 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/init.h>
 #include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
-#include <linux/io.h>
-#include <linux/gpio/driver.h>
 #include <linux/slab.h>
 
 /* Register Offset Definitions */
-- 
2.7.4


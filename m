Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4EA2B0B0C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgKLRN2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:13:28 -0500
Received: from mail-bn7nam10on2081.outbound.protection.outlook.com ([40.107.92.81]:35552
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbgKLRN1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:13:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU8MoRhyMl1ZSYBU6HpEOznWyVLne//P9rAAdk/LdzJhix9B0jw745m2pNUyQ7sNJsCr7VXTTRAvfalwynjzBcf8wLHburvUkV1Nv0DF60vbuBmDm2I1dqmeXmCO3W7EaGwWSfD0v+Drwzsv3xu713/9eDDeGnD5waI9Ri5EPA21PTe76RemBsgXFNsCAmTwKZMTLGxeHNTrbOxQNbPAr4pX19po56ztdmQixTVqzk0bt6n1mc9TSKD1zuxKM2Jq04fd48Ho9nn9oNxRZ/oNVS6pX7tKG6a8Iy2mqcpWg+98i7AB21DYE0aVv2OQEEVu4UIHfPqoH46mA/vQjNoA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9kkCKNJrU+3pgOv+apEyRDJumrijAgr4zyhPI8pgaM=;
 b=GJtdOhzMNcDeyMht64gBDCFmXNqyJIV6y0jM0wT9ho1ByjHXi4RlQMeBlq4xFv4hgGMriJczpe0M96rv5RNjd0BIGsAua8PLB9tm41Wc4mX6B923sBm0Xbqt8fhi2bmI766yemxlkJxY9LQcduTHIbp7hMEjzwcmx8k9VdARXfHtb3FqzxMK0LOP58Dnvqo+HajYBmVL760VcavLEsbGVdsjCfPcEGhdfWVrWRkjXklBMJFH0EOviwgJTZNp7kpQeiHm+ioboXs8tzw0CileP1Ukgv0hAa48P0pkXAEoSBMmlf9o9Vse+aDqVMVTn22WFONR+jup5EDweyU/7GTpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9kkCKNJrU+3pgOv+apEyRDJumrijAgr4zyhPI8pgaM=;
 b=WkNv08zJz1zeqB4g/76JNuhpMoxispP7lZw5Lj6hA47uvvsS5/dJN0ENIZHcFbtaLsm0U8Z0/cUdp+YdbA6ETYFaG9Zn3VEBhJn/WQQMMrlC+K6bo1EsbhXFySmFW2BUUcRQLtcdOnB/9dWSIjJHDyRG3yYh/xImfXaB1nmcHWs=
Received: from BL1PR13CA0261.namprd13.prod.outlook.com (2603:10b6:208:2ba::26)
 by BL0PR02MB5697.namprd02.prod.outlook.com (2603:10b6:208:85::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 17:13:22 +0000
Received: from BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2ba:cafe::3f) by BL1PR13CA0261.outlook.office365.com
 (2603:10b6:208:2ba::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend
 Transport; Thu, 12 Nov 2020 17:13:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT008.mail.protection.outlook.com (10.152.76.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:13:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:12:44 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:12:44 -0800
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
        id 1kdG9L-0005SG-DW; Thu, 12 Nov 2020 09:12:43 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 3/9] gpio: gpio-xilinx: Add clock support
Date:   Thu, 12 Nov 2020 22:42:22 +0530
Message-ID: <1605201148-4508-4-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3377617-93b6-4f8e-3c02-08d8872e4215
X-MS-TrafficTypeDiagnostic: BL0PR02MB5697:
X-Microsoft-Antispam-PRVS: <BL0PR02MB5697B13B0F8A89842CE8E436AFE70@BL0PR02MB5697.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QR56+lTQPp64FyemVHQfH8CAwzSjNRZMBRF5sx9i+Yv4iJ0WeVNvzfbIATyuANs4j8YA5vqu0z8S4lyIjmlnKum6X6pLP3FIPIy6CYdCOCOJBg9KVzU/3Dle+a4G6PcQCVB6swbXkS6orbgod9tXvG3mlUAgdCrikqVmoPr/PcUwRpZTwPjzauD8NJxe3z1gaeECyN/3UrnrO57JMpzktXVhraJIG7qgNm3LunEpqRhJ33qGr3/pAkcUemdm6UlCkotdogTrTzNrKmfuPCNoZWS3+h8rkb54ffjKVAdTdeyTfgRN0qpt/SQsEt2nW2MTh9CRLsgfhuAK1kMzbZKfXa755tuEIzny+stG0GkIzfhxaKLIAmbfNfw83E4vHB8d4+2mzcty0eC1GUGY73orsQvZ+PGYICLI2mvyFJMcnvk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966005)(36906005)(82310400003)(316002)(54906003)(356005)(107886003)(426003)(336012)(8676002)(2616005)(7636003)(478600001)(6666004)(8936002)(70586007)(4326008)(7696005)(186003)(82740400003)(9786002)(47076004)(83380400001)(26005)(44832011)(70206006)(2906002)(5660300002)(36756003)(110136005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:13:21.8179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3377617-93b6-4f8e-3c02-08d8872e4215
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5697
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds clock support to the Xilinx GPIO driver.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Chnages in V3:
-Created separate patch for Clock changes.
---
 drivers/gpio/gpio-xilinx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 17a8a8f90d84..99d603bfb6f0 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
@@ -38,6 +39,7 @@
  * @gpio_state: GPIO state shadow register
  * @gpio_dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
+ * @clk: clock resource for this driver
  */
 struct xgpio_instance {
 	struct gpio_chip gc;
@@ -46,6 +48,7 @@ struct xgpio_instance {
 	u32 gpio_state[2];
 	u32 gpio_dir[2];
 	spinlock_t gpio_lock[2];
+	struct clk *clk;
 };
 
 static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
@@ -333,11 +336,25 @@ static int xgpio_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->regs);
 	}
 
+	chip->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(chip->clk)) {
+		if (PTR_ERR(chip->clk) != -EPROBE_DEFER)
+			dev_dbg(&pdev->dev, "Input clock not found\n");
+		return PTR_ERR(chip->clk);
+	}
+
+	status = clk_prepare_enable(chip->clk);
+	if (status < 0) {
+		dev_err(&pdev->dev, "Failed to prepare clk\n");
+		return status;
+	}
+
 	xgpio_save_regs(chip);
 
 	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
 	if (status) {
 		dev_err(&pdev->dev, "failed to add GPIO chip\n");
+		clk_disable_unprepare(chip->clk);
 		return status;
 	}
 
-- 
2.7.4


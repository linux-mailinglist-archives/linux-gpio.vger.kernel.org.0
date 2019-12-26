Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC3B12AC1F
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 13:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfLZMMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 07:12:50 -0500
Received: from mail-dm6nam10on2050.outbound.protection.outlook.com ([40.107.93.50]:50081
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726706AbfLZMMu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Dec 2019 07:12:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcaUR4RRjsgmiZ7RL24ZPsOdZPDksfb/u++mgqBq85k3dCoOOSlA/QJFEK+FHYqNxHJQkSUFDOV0lqPSiX82EEPjqJShn6dLZPr5kJysXa3eHKjKXogZabGns1i19yca5sGSxc0ReMu3r5sjkelZmkRoRx5WVjo2O7O2ElK0pxo4to2ovZOeLRMWYsakvwUBnPCX2i7SNcHKNiiYkt/I4RB083ZG6GsT0ShxAGObM+UMa0hke55hCkiaZsZrFjaamCxjOLlfi20hA0JCFyiN+szE9SXvIGVXfWUPgSVr5UaklAfxEY9/kOeUrV3vUTqxBk3wFa8IOOrrlpnVIQSTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklJFrMzQVMm4jnGo6isE2E2T26F0WppHCWthHoA48Y=;
 b=XEwydRac1uCZ2QLJHVI7Sy0EKQaQAMoK9I+bGQ0XVQBnHxThA8a3OFLyyH0JuIZWhpXMrSFm/sHzc9n51LIxHFEoNGku4VS5MbrQ4Kogx7/416bGdxzBqsgiKzteE8PwAgDkkL0oJIJqEoo+dG8IDnci2cysmdbQsJpm147leY72bwnytQ7ZQ2OET8LXOsPuGbn1Ly+qMCZ/6NVT0n/CHT588ywMLu8Gpn6PfdSU7gvOOqtgkPhVPYHRhtwwB6ZjrY4ccCUssfcf7JT9fvqqW9TZ5YGMtp7eIPvIPxCDDPLJBDNOcs2cWXVGtwou398GjeK70qGSQac74a1vR06+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklJFrMzQVMm4jnGo6isE2E2T26F0WppHCWthHoA48Y=;
 b=goPlTYUUf2c/ciCaT+JRxJWlM8WfysBLLP28y8yPFtScGK811V0fZkA6cD07/QyG4w3qngojJ02l/+hKpWw7hkrti3ruT/pLO7BdWa5Mgnbi/3X3JmJM+9xhwUUeGoA09YC5WkNphd5ttgLdxXkz+CU0Ir3r9w7yGJmk6yjnMwc=
Received: from CH2PR02CA0010.namprd02.prod.outlook.com (2603:10b6:610:4e::20)
 by DM5PR02MB2315.namprd02.prod.outlook.com (2603:10b6:3:4f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15; Thu, 26 Dec
 2019 12:12:47 +0000
Received: from SN1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::205) by CH2PR02CA0010.outlook.office365.com
 (2603:10b6:610:4e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Thu, 26 Dec 2019 12:12:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT006.mail.protection.outlook.com (10.152.72.68) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2559.14
 via Frontend Transport; Thu, 26 Dec 2019 12:12:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0U-0003KD-SD; Thu, 26 Dec 2019 04:12:46 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0P-0007xv-Op; Thu, 26 Dec 2019 04:12:41 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xBQCCVuN003147;
        Thu, 26 Dec 2019 04:12:31 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1ikS0F-0007v9-6p; Thu, 26 Dec 2019 04:12:31 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH 4/8] devicetree-binding: Add pmc gpio node
Date:   Thu, 26 Dec 2019 17:42:14 +0530
Message-Id: <1577362338-28744-5-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(7696005)(70206006)(44832011)(426003)(336012)(8936002)(2906002)(70586007)(186003)(9786002)(5660300002)(26005)(356004)(6666004)(316002)(36756003)(4744005)(81156014)(8676002)(4326008)(81166006)(6636002)(478600001)(2616005)(107886003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR02MB2315;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35784080-9262-4627-74c6-08d789fceb9f
X-MS-TrafficTypeDiagnostic: DM5PR02MB2315:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2315756AA589DD422E230DF2AF2B0@DM5PR02MB2315.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 02638D901B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wIkSVr0TfdeWFp6p0Rogv3E0lAAfMDmg1lA9Ge9TmHDSg1mvNGp5oUP1wVyjsbkQSoDuuybtVjbTEDUJTtKlZhtj1yRuBGbc9NIfhJB0afPqbgpPESYy6Ss4gfPL2mqS0bIAZUSSv1d9SBkCqWo3a2rKRRgJ+Aj0tcXbfEjo2aJGWJ5IJBCiY+Gd/1P+oIrfBUS8+SozzGUvy6ZgzkwkLSSURhwEkQ1NPCEpNLQiObOVPY0Pr5jPxG607nw/98EMG6uZzg7m/7WhsqreTohjBzDdzDHupJE98hcdC9S3x4g2kUYY0HSTk/ZHLm9mSNe90f0y6KRu6eljvtXhZhR3y/oZ3jSBbaTcsKzXUrIKg5A1NQyZFMjddBiSWy4BxIys9sK1H7D5rYoyvKfy08pKBHvP/sRuLjlI3B2qTYb7wB0g3/RoohYD4Y5OSaK3Bzgh
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2019 12:12:47.2953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35784080-9262-4627-74c6-08d789fceb9f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2315
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add the pmc gpio node to the device tree.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 Documentation/devicetree/bindings/gpio/gpio-zynq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
index 4806d846c0fc..f693e82b4c0f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
@@ -8,6 +8,7 @@ Required properties:
 			    parameters (unused)
 - compatible		: Should be "xlnx,zynq-gpio-1.0" or
 			  "xlnx,zynqmp-gpio-1.0" or "xlnx,versal-gpio-1.0
+			  or "xlnx,pmc-gpio-1.0
 - clocks		: Clock specifier (see clock bindings for details)
 - gpio-controller	: Marks the device node as a GPIO controller.
 - interrupts		: Interrupt specifier (see interrupt bindings for
-- 
2.7.4


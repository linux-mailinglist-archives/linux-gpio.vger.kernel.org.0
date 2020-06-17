Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DA51FCC80
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 13:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgFQLho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 07:37:44 -0400
Received: from mail-mw2nam10on2084.outbound.protection.outlook.com ([40.107.94.84]:22081
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbgFQLhn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 07:37:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcMr/ujRlkZ/RPE515cR73N4gqKtOMgS5+bPw6CFvRFo95DqGyh8Kjh+4ix71G3EtB5A95WFttEyw6ZHUgVohuXj/jWKgKXIQAQUuxaMo2L6vtUG51VO9v6n5VFFVIEjs/xiQrO4nSrvoTA97w3SE3HZuvoMWSdQXtZXzbA+7zi9JBLJrKdxhx9sVZuoO10Cfnk926Yu/j0In5bEDMHZLu6JIJcSHsiYXS+yT0xqafuc00/Oi0JBtdj+rO+CO39EYyBPuW20xzt8NlnYj3BgHMslvDLAZmhQ4DpBxR/rb9y0GwKyio9ccldqEgMUQdjmfV4+0Oj05PaskplNaIOWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE28UqRpmcySIbVBoqGoLz6SRw9GccZ/KCClv8TljWs=;
 b=UIYuh9h9Lnsm+guAYLIZY/LX6HeH5ead2o3Gkeig2hgcZ0fy5z/3uYBOP7p/2jcfwAq4gvJbmso+ipYMFrVhsItnbp8riL5gBcVmPh21FVntb0c7B2V4BEa/ZIVidBcJTiR0Ql9WtpjukZrqwcufqs9XQcoKS7ro90iymQnqaNAzwJ319yez0rx3BbY9hsRG78JB7EEr0uwaW0hU3lYDGvV21bcN3hnBhlgcKrVuVxaWlLBc9weC0M3FxtLNh1gehk1O8qaSbAAs+dwmHlhA7zSQ8FDRSKKb/XbCFMfqjrEOB99Qe6Fes35mF7CyC50bv8/f43IAjRhhFIJNI6VChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE28UqRpmcySIbVBoqGoLz6SRw9GccZ/KCClv8TljWs=;
 b=hnmDDJf5Q5xgr8seUMKqKT4441ZJ4u2+RBPP8+1I2YKVAK6c06m8bPZ8CBfmREj3vE9KKgSUoIbpbv4D9Tl4URrcH528UY3DPbRdtW0WPNK73W5ouXpC/A6dFBgr7A5iqUw52xU4dzjVXi+A8KYEmzROOyBtQXqz0OnvNEcSlvs=
Received: from SN6PR08CA0014.namprd08.prod.outlook.com (2603:10b6:805:66::27)
 by BL0PR02MB4531.namprd02.prod.outlook.com (2603:10b6:208:4a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Wed, 17 Jun
 2020 11:37:39 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::f6) by SN6PR08CA0014.outlook.office365.com
 (2603:10b6:805:66::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 11:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with Microsoft SMTP
 Server id 15.20.3088.18 via Frontend Transport; Wed, 17 Jun 2020 11:37:39
 +0000
Received: from [149.199.38.66] (port=36006 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWMs-0001HU-Vp; Wed, 17 Jun 2020 04:36:34 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWNv-0007Wp-A3; Wed, 17 Jun 2020 04:37:39 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 05HBbawQ032525;
        Wed, 17 Jun 2020 04:37:36 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWNs-0007TR-0a; Wed, 17 Jun 2020 04:37:36 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V4 2/7] dt-bindings: gpio: Add binding for Versal gpio
Date:   Wed, 17 Jun 2020 17:07:22 +0530
Message-Id: <1592393847-1415-3-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(39860400002)(136003)(396003)(346002)(376002)(46966005)(316002)(44832011)(70206006)(2616005)(47076004)(8936002)(6666004)(966005)(186003)(2906002)(478600001)(36756003)(7696005)(81166007)(26005)(4326008)(6636002)(8676002)(82740400003)(356005)(9786002)(336012)(82310400002)(426003)(70586007)(5660300002)(107886003)(83380400001);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5df882e4-ebdd-46fa-23ba-08d812b2d729
X-MS-TrafficTypeDiagnostic: BL0PR02MB4531:
X-Microsoft-Antispam-PRVS: <BL0PR02MB45318AEF8A8AD6B36581BC56AF9A0@BL0PR02MB4531.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SlCq/aKiCZVDGu32XaJ8MXC3EaSMlOf+H1D5/VJhJ+/lcv7f9wFgWBs7VF8AO3EdwqUXkHMUxSCmuLaTZQuwFTg2FVMEsT15dYy/So9XUuyW389mI3uv8FYzxLSlZPIk+5g9MhbkLyxHSUkgI9KDNTHIdwAyHBzjHqOjlG23G7kW1iGH1H8FjLuBvVY1EapYnOM4GDSdZW67sLxeohlQTPmtVFtY0g8mXoxic9lExF1gIFFraQjOlLZRWChA4sSkwJAAbxefur5w8ePXSjWjPFiRj6uTgtRXBdg7MtQ329WTpO4LFmj52wIlOUOUxH01CfcV9vvr+dpByL+dQ8qBrrced2BO1kGHRkS6CKzQVFOW0FVmMPY24gNce1Kz4sudwNZaKWHyvOe+vJ/7CwQSmkvKiyScnypHcSQ4rugyc66FzjnhJYHyyYwY2RbYnEAv4ReSq5bJuaooW96aTXEec17UyqgwevjLcbATskrf2Ng=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 11:37:39.6121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df882e4-ebdd-46fa-23ba-08d812b2d729
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4531
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add binding for Versal binding.

Versal devices are the industry's first adaptive compute
acceleration platforms.
https://www.xilinx.com/support/documentation/data_sheets/ds950-versal-overview.pdf

On the Versal platform, we are using two customized GPIO controllers(IP)
which were used in Zynq/ZynqMp platform.
One of them present in the Platform Management Controller(PMC) block and
other in Processing System(PS) block.

In PMC_GPIO only Bank0,1,3 & 4 are enabled and in PS_GPIO only
Bank 0 & 3 are enabled.

You can find more details of GPIO IP in ZynqMP TRM General Purpose
I/O(Chapter-27).
https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 Documentation/devicetree/bindings/gpio/gpio-zynq.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
index 4fa4eb5507cd..4806d846c0fc 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
@@ -6,7 +6,8 @@ Required properties:
 			  - First cell is the GPIO line number
 			  - Second cell is used to specify optional
 			    parameters (unused)
-- compatible		: Should be "xlnx,zynq-gpio-1.0" or "xlnx,zynqmp-gpio-1.0"
+- compatible		: Should be "xlnx,zynq-gpio-1.0" or
+			  "xlnx,zynqmp-gpio-1.0" or "xlnx,versal-gpio-1.0
 - clocks		: Clock specifier (see clock bindings for details)
 - gpio-controller	: Marks the device node as a GPIO controller.
 - interrupts		: Interrupt specifier (see interrupt bindings for
-- 
2.7.4


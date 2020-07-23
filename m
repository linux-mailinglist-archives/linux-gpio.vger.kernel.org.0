Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DCA22B0F6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 16:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgGWOGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 10:06:22 -0400
Received: from mail-dm6nam10on2044.outbound.protection.outlook.com ([40.107.93.44]:9921
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727068AbgGWOGW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 10:06:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtvYxdex/rHheVSekVNTf3j3ZGXkXbnBCGZXXSOYzUnve199o1b1EXaf++Few5FxlNYuJ2+cP6GnlO5NF2G7cRkif44YpoEFbxYcCNOMSAK9UeiwjbpHCVsvnL1yx8vAP2OxL5zslF2P0Zioxm9Ub4yMHsDLZWVf4/s79tEXZ0SN/wU2hxP7jjJrstZk8l2ZR9a5qVrye2j18oi6gYT0c+rjKzIAE977ID+jj25CZ8ifA9c79FBs9GbeNpz9BGFiyqDN1GpaV9LHClEjXcjMnp0z57pMyx2odT0+FRMp28wgoqCtF+byq2OztJ6YMeuTWt6eah7ryzAzX/W2JpEZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rf68Rav7mtA+jNyyMbvxRsOL+YGXtQH4gk+arAcCnhs=;
 b=KprH8DClToz+ccrPxNIQ1LuQWcfj7jy5DvS2io9QLSVrThlCZxrL3j6gNPBitM3JV+VdA61c2K+UAeVfrdU8bP8P5M7W35mJO8k3gQOwesmIQjL7rWeF/qX8yPEUXjL0HA3kA1uK8rnUcb3U4Mrmud6xCR0Iua+Iq9aa5+TMB57DVzyEeghgyw597ROT8Sc1CJWkixJmrChrLUObOHWM5ODFCDR6xnbbHIFDdbCPFE6fBeO2pfhw5LYnUPu+QTTTK5VNvNeMH/PdKaPweBjTpWoyOAF01XPgE8ITbw5OSk5flrS64WIilNBTNGtcM24/drWIMqcBzAb/uf8mQPg2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rf68Rav7mtA+jNyyMbvxRsOL+YGXtQH4gk+arAcCnhs=;
 b=XZHnjFZ2tYIgmm0Rq10r5ghdTlKmYU5KbdHKx1TZOI7wpnbvm0uD2cr/e4PslkXwmAsMw9Kp7pvCals1VhrvQY9ov0sUBpwobVdAoUktGjCeglnjvk5lIOFdxlSVcF+qXPEjXnazSUJG7RvT/t2T31qgj27D2BjTYDrcumI6zp0=
Received: from DM5PR19CA0002.namprd19.prod.outlook.com (2603:10b6:3:151::12)
 by DM5PR0201MB3447.namprd02.prod.outlook.com (2603:10b6:4:79::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Thu, 23 Jul
 2020 14:06:19 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::ce) by DM5PR19CA0002.outlook.office365.com
 (2603:10b6:3:151::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Thu, 23 Jul 2020 14:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 14:06:19
 +0000
Received: from [149.199.38.66] (port=56800 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybpg-0004H5-RX; Thu, 23 Jul 2020 07:04:24 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybrW-0005RQ-Rj; Thu, 23 Jul 2020 07:06:18 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06NE6BHc020578;
        Thu, 23 Jul 2020 07:06:11 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybrP-0005Q2-3E; Thu, 23 Jul 2020 07:06:11 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
Date:   Thu, 23 Jul 2020 19:36:05 +0530
Message-Id: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 34c77d85-e8f4-4e1b-cce5-08d82f119270
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3447:
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3447CFF8FCAFBCD87A7C1994AF760@DM5PR0201MB3447.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/Yt9RfLe0+SipEN8BlCUOnK44OjVNI0wxx28/4Bwmp7yVRCu1aW64i8McqAHyqTWeUZpVNxdPwtXQc610uQoSZNwEj9xBUlER85UaxkOswI30hor/ePCWFupgRho8wqJStnHaXd6vEVzeALLGeIAOJ2PPh/WWDED5Z14M27/Qx1fH9ELbWlJY9l1yVO8fBrCR9EipJknYPbi/1GSt8ZISAllKJbSD1J6PhVq3hVBd8VDEdBWKl8ey+J2TkJXDx/pdKFL0pt+EHRCxcO8o4iWCiMSRH+M3ixRThy6ETb/Gl7zQltznfsCxzsj0Hl3fAvIR+XRI7hUTIVKUoz/Wk7LCg++P9iF3E/exSapTkriaEWCf0VGG8jYREL4D/5KMz61jOoHKCGEXQ2puDGlzvMd1ZuRWO0vLMuIZpP1V5zQ54=
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(396003)(39860400002)(46966005)(47076004)(8676002)(316002)(426003)(356005)(82740400003)(5660300002)(26005)(81166007)(2616005)(70206006)(70586007)(6666004)(478600001)(186003)(336012)(6636002)(8936002)(15650500001)(36756003)(83380400001)(107886003)(4326008)(9786002)(7696005)(2906002)(44832011)(82310400002)(4744005)(42866002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:06:19.0670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c77d85-e8f4-4e1b-cce5-08d82f119270
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3447
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series does the following:
-Add clock adaption support
-Add interupt support
-Add MAINTAINERS fragment

Changes in V2:
-Added check for return value of platform_get_irq() API.
-Updated code to support rising edge and falling edge.
-Added xgpio_xlate() API to support switch.
-Added MAINTAINERS fragment.
---
Tested Below scenarios:
-Tested Loop Back.(channel 1.0 connected to channel 2.0)
-Tested External switch(Used DIP switch)
-Tested Cascade scenario(Here gpio controller acting as
 an interrupt controller).
---


Srinivas Neeli (3):
  gpio: xilinx: Add clock adaptation support
  gpio: xilinx: Add interrupt support
  MAINTAINERS: add fragment for xilinx GPIO drivers

 MAINTAINERS                |  10 ++
 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-xilinx.c | 404 ++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 395 insertions(+), 20 deletions(-)

-- 
2.7.4


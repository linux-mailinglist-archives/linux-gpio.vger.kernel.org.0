Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A0215D29E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 08:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgBNHP5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 02:15:57 -0500
Received: from mail-eopbgr700079.outbound.protection.outlook.com ([40.107.70.79]:1871
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728740AbgBNHP5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 02:15:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnAAgjKDwZYaAw26/YwQ59xalMcGoILmI/MPw9sbasMlILR8r2UHRhryC6/tFM8VzphS79iJAaPAMt0PSoWZx1/g7MB2Xl2NJNRnKpxRJXfFdMCDzBuyjcagV8az03uLIAbl0edGqd26P0QBYvvANo/sKw78mV5JRjmHSV8d18X1IuT3tE9f9nTYgQvStKBGB1v05juF660dTSpDF/iHw7IRuCRr5JKxaClag6wKDFufCjTYDdA/EYVMVmJA5/CjA6K+5SUWltQ6GISJs1Sz5NVLiyQYK+l0lP0rnxpG5efg95UKF3eDExgewB/0CQu1+aVyd8nzAxlEce5rZPWW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKoUx41WvfZ5N/iJnFTwC8FTY1Xo2HIc61yAfSHkhxg=;
 b=PF0jwqlYik7Gz0SUhr8iLNwJKgz4qxSPwTeluvSkeExUHuUdH1R0mYpjY8e51O8ec+OuWFn4nT1xHD83FuzY4mMHVN6Nenlf6V5np/bTxv4W3jyJmaKuF4TUKDLD8Qeag/Az7oeziYbVj7xZo7uztzLEydrgbBPcOO5bYeQn7YGbxlU67YcFqTPqpmVupKi/bhc+CjDhcoJcazWvotuusLx4DmQq2x5K9Dkmd024oP4IuVnYA1RmzEzXvB6M4kpK34syNZMq3sO3ScyrYhFGzDAy8Dr8tJYsMW2dSHuHMYSN636+mAl1f2wdlaTXYNY73rPefQY6bp4ZeoBVaEjj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKoUx41WvfZ5N/iJnFTwC8FTY1Xo2HIc61yAfSHkhxg=;
 b=f95AyzorjEEql+SNuomf5Wp7OMsQVNpwkXpB6pU+6epm4PLbqVP0lct78fcIJlWDh/bXt5x5ICixaJrfRwETLn0xOQB+WXr+p7LTbAZprPl4Mh9BW4aTGY18BcgfMbbzV6Vzeyai5KFTV/vlnNFGmDzJ2Vml03mJr3KRbbp4ogI=
Received: from BL0PR02CA0116.namprd02.prod.outlook.com (2603:10b6:208:35::21)
 by DM6PR02MB3996.namprd02.prod.outlook.com (2603:10b6:5:9d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21; Fri, 14 Feb
 2020 07:15:55 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by BL0PR02CA0116.outlook.office365.com
 (2603:10b6:208:35::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 07:15:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Fri, 14 Feb 2020 07:15:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCb-0006El-Ek; Thu, 13 Feb 2020 23:15:53 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCW-0000Q7-B1; Thu, 13 Feb 2020 23:15:48 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01E7Fe3M018756;
        Thu, 13 Feb 2020 23:15:41 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCO-0000OQ-97; Thu, 13 Feb 2020 23:15:40 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 0/7] gpio: zynq: Update on gpio-zynq driver
Date:   Fri, 14 Feb 2020 12:45:30 +0530
Message-Id: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(199004)(189003)(2616005)(70586007)(336012)(4744005)(4326008)(107886003)(426003)(6636002)(36756003)(186003)(356004)(5660300002)(26005)(6666004)(7696005)(8676002)(9786002)(8936002)(2906002)(81166006)(81156014)(316002)(44832011)(478600001)(70206006)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB3996;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a37be223-f5cc-4b0f-b5c4-08d7b11dbafe
X-MS-TrafficTypeDiagnostic: DM6PR02MB3996:
X-Microsoft-Antispam-PRVS: <DM6PR02MB399612FF644E6E6623E3153CAF150@DM6PR02MB3996.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +pIzQoiE8mX//SP3Q8cM1c4bLH5pWCwRnLz25XyRWWxgQacFEhbzzpUXDGxk62KnWIb2C3tNRrv2/eJzNO0+qzTK/7tDPPpLBJYC7cN93J+Igi7cfDP+puh04ci9WjXXOIO1c2ZiId9590A9fyQ4vPvOmhRgsHlol9apjwwcmdk3a7FN8FyMkVqY+qv8VaiOwDmA+QOBCgi3On/+VSBdcGDIPkTKXpmT9gxA9EnU3Z/tmpfAAxLwwioZcFAKcJE/p7c9yJDnOcqMbpa+7kz1U7DtD8DZKxuig9OUY/mlA0JNGiLitcF14gkLj0CZWHK2mB1lXONc6/c2yfkrzEQL8vZkjSEG9epGMu/D3vrvEnjLVbXMlgJkX0YNpb7UqGKbAZ8lDbKMXp+TXda9Uw4vGMcUQbvtIKw1uEU38UhfSiCaYAmKktAGSLhVaeOpnNUdBATxLb0aytWqeewgblM9SAmMxu+NC8OHAjlikp7WGSOj1v0CEWBguhj/PI4utbXi
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:15:54.3905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a37be223-f5cc-4b0f-b5c4-08d7b11dbafe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3996
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series does the following:
-protect direction in/out with a spinlock
-Add binding for Versal gpio
-Add binding for pmc gpio node
-Add Versal support
-Disable the irq if it is not a wakeup source
-Add pmc gpio support
-Remove error prints in EPROBE_DEFER

---
Changes in V2:
- In previous series [PATCH 1/8] already applied on "linux-next".
- Fixed checkpatch warning for spinlock description. 
- Added description for Versal PS_GPIO and PMC_GPIO.
---

Glenn Langedock (1):
  gpio: zynq: protect direction in/out with a spinlock

Shubhrajyoti Datta (6):
  dt-bindings: gpio: Add binding for Versal gpio
  devicetree-binding: Add pmc gpio node
  gpio: zynq: Add Versal support
  gpio: zynq: Disable the irq if it is not a wakeup source
  gpio: zynq: Add pmc gpio support
  gpio: zynq: Remove error prints in EPROBE_DEFER

 .../devicetree/bindings/gpio/gpio-zynq.txt         |  4 +-
 drivers/gpio/gpio-zynq.c                           | 66 +++++++++++++++++++++-
 2 files changed, 67 insertions(+), 3 deletions(-)

-- 
2.7.4


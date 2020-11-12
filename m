Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3875D2B0B04
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgKLRNI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:13:08 -0500
Received: from mail-dm6nam12on2062.outbound.protection.outlook.com ([40.107.243.62]:39585
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726125AbgKLRNI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:13:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0UVbsn+rZtBdnZd0xcEqznd0FuO4c4aivpABq59DUrfONi1fYy57HBRlPYU5QuFO4fZQLDNdJLnaIuQktpK3dhBIer1UEPoAdHkhjv5Ne6S+xuzZz93lC2Q10wwNIRM0Ayev5w9BNxKhV5WTUVAu+Ud3nMsKzrQjdovYVF/cWQ0l2jFHHc4WS11Up7tzdR0QaR7cn043iL8bEnFsuSOlTLWVunexAHfNfiCUFlFJc7rOqcwjMoIX5NNdHNv1kM8fyCmMtWaC+mpkuMBEtoiYpxPOaPCc9JYHnneDUEHRIK9fA2xG3BtPpKyNzINjnK7dxzy10fI/jQK9WHCk3xyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqOdOCBHoP17O1vvgVmilpx/hi+QoeecyEWvajsd56I=;
 b=W6wmVAQ2WOtJpGudD/GpR4gTQ3L7I8qCVjS3lAcTUx8efVRN2jrNwiMuRAdsvXCfYvOmD4JlG6yEXVJhqCebinc+ty+rzJERvj4SrN7hdowFoTAuoaEuRrpd07Jlg/+gDmF6xOlWB48SuCzVJ3hORQgJu8DYnlsAjwFE6+fazIgNQKy3znwHnKoFN4/5wT4GTLn5i3wOqbI761jNBedvrDoRefCyueY3gccbNat58+A2/Sec0WgzN9tbGukeEbbPGnQMzjwSqatM1/5XeTeNBtQ0eWWUs70vYOpmMbQQD5c/Oa/5Am+Tba33Nrx38m8GMZ01W5a0Te16xQnwnmp3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqOdOCBHoP17O1vvgVmilpx/hi+QoeecyEWvajsd56I=;
 b=TM4g6chXr/5Z7yUJYJNB6DPaOLbqlXCi1OIQtg6ajXANNboKPYSAycSgkdK/mMC+xc41xitB2JehFeBLiAgLidF9xb9r4I8pIscMnXaMhon8eP32cG/4opPe1xzFY4xMkQtPyjnK5/7bo0nJgYjlQ+rOuL2fiXk/3Z8TjTHPTAQ=
Received: from BL1PR13CA0019.namprd13.prod.outlook.com (2603:10b6:208:256::24)
 by DM5PR02MB3896.namprd02.prod.outlook.com (2603:10b6:4:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.32; Thu, 12 Nov
 2020 17:13:05 +0000
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:256:cafe::1c) by BL1PR13CA0019.outlook.office365.com
 (2603:10b6:208:256::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.24 via Frontend
 Transport; Thu, 12 Nov 2020 17:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:13:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:12:34 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:12:34 -0800
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
        id 1kdG9B-0005SG-MA; Thu, 12 Nov 2020 09:12:34 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 0/9] gpio-xilinx: Update on xilinx gpio driver
Date:   Thu, 12 Nov 2020 22:42:19 +0530
Message-ID: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9cf96c3-a3c0-41bf-adad-08d8872e37f8
X-MS-TrafficTypeDiagnostic: DM5PR02MB3896:
X-Microsoft-Antispam-PRVS: <DM5PR02MB389670A9FA9C1ADA39D8A7A9AFE70@DM5PR02MB3896.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KoYbwp4Lk+p9xVsfDCsc1CTlfnoGWivWBkTJrdGE23eEZ0ud+uQeOHhYqqY/j6NmfLQ5RuGif0SCfGsQJWbNhWu8B+HtSK9wxXruArM8g4ng2ANruBn0l7kenfdFLiyLrt/z8tM+/tAPiY5e6ni5kiIxHr2gb1Lr20Hf7fDo2sI5SL/Qt3xIeMZNRzzzqzBnFBm6D+VO2jC4LlriomZZJmEYjlCuXbowTgTXJwlkPPvjR93CPqi6ujVEE/jbXGTYdHOjiqzRdh53CWsjLpZigZXswa5s9RZf+LTFBFg+zKglBEhFl31LEKHvpY08SoJnJ0pQrF7U1d7ETI5Wz9bOHoZk8ngXSv3dfD5CkfG4jKyutXKF/G00ZmOT5jCKsNoUq5ySJL/vHcsjmJcQwCOWe4v0Al6wLW60i5TR4hHxnw=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(15650500001)(9786002)(7696005)(8936002)(107886003)(6666004)(2616005)(2906002)(5660300002)(26005)(70586007)(36906005)(186003)(426003)(336012)(110136005)(54906003)(316002)(8676002)(82310400003)(70206006)(83380400001)(7636003)(47076004)(4326008)(36756003)(82740400003)(356005)(478600001)(44832011)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:13:04.8785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cf96c3-a3c0-41bf-adad-08d8872e37f8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3896
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series does the following:
-Add clock support
-Add interrupt support
-Add support for suspend and resume
-Add remove support
-Add MAINTAINERS fragment
---
Changes in V3:
-Created separate patch to arrange headers in sorting order.
-Updated dt-bindings.
-Created separate patch for Clock changes and runtime resume.
 and suspend.
-Created separate patch for spinlock changes.
-Created separate patch for remove support.
-Fixed coverity errors.
-Updated minor review comments.

Changes in V2:
-Added check for return value of platform_get_irq() API.
-Updated code to support rising edge and falling edge.
-Added xgpio_xlate() API to support switch.
-Added MAINTAINERS fragment.

Tested Below scenarios:
-Tested Loop Back.(channel 1.0 connected to channel 2.0)
-Tested External switch(Used DIP switch)
-Tested Cascade scenario(Here gpio controller acting as
 an interrupt controller).
---

Srinivas Neeli (9):
  gpio: gpio-xilinx: Arrange headers in sorting order
  dt-bindings: gpio: gpio-xilinx: Add clk support to xilinx soft gpio IP
  gpio: gpio-xilinx: Add clock support
  gpio: gpio-xilinx: Reduce spinlock array to single
  gpio: gpio-xilinx: Add interrupt support
  gpio: gpio-xilinx: Add remove function
  gpio: gpio-xilinx: Add support for suspend and resume
  gpio: gpio-xilinx: Check return value of of_property_read_u32
  MAINTAINERS: add fragment for xilinx GPIO drivers

 .../devicetree/bindings/gpio/gpio-xilinx.txt       |   2 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |   2 +
 drivers/gpio/gpio-xilinx.c                         | 398 +++++++++++++++++++--
 4 files changed, 390 insertions(+), 22 deletions(-)

-- 
2.7.4


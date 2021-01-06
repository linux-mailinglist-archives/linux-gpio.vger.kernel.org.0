Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8C02EBDAB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 13:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbhAFM1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 07:27:50 -0500
Received: from mail-bn7nam10on2082.outbound.protection.outlook.com ([40.107.92.82]:18008
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726059AbhAFM1t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Jan 2021 07:27:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eySr0o58IzdvT0BzDqOvg8YRjCHIwZUBtYF2GM4aLadgTw2QFJwvFA8HMLWSODHXHH1Sx27OaQiqcLROhWVwX1irzxU9G1si/sbU9JXb2qLE68gNZwyxI/AbYQYGOrE3msPn74S3/Ptr6zRKrU+DSSCruXgU/NwbNQ2a/2xO/BVmjtXaFk5HdA9vrFGYS1HODlMGxjmPax1+jONtewqe4ZKnjE5mH4SpP7N6kMnXxd9Xh1o2Mr1YJ7EtoalXN1GRqBg8j0oBS2Sg155woEehofuvmU0z/eAUfxdeZ3gXniSPJ/9LWJNW8PKWUYQxeIyVPb/I7HCGGdyQjZauDdbQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0VjpCHOoLP7CV/gowM5liXadOZQInGB5UGXt3Yuquc=;
 b=gsjAL4nbeWSx9WLrhONKyLuBxEP639+WkQEvst4nmRw/OgW5A+oa1lRBRMnkjXxXluZj+apfo856XZLZxHTBdJL2TlqJd8erjk2KuGJquCRptgny1WrtrCF7vvWUMSXvbfVVKNFMGdf5UMso9tiezMnSjGUqwPIEwDLzF3wQgA8XZFY6zqo0qhKsQWEWr/wp21VW1y0QhAMWzWtdpXYULMxCTToCptwZ3iF34M6rVu3Zg2UrcBOFWBvVRo8mVurMWcyhJ8gIB7sTWbXUYsuPtIMJFpMZYZNZBk/14PlSPBRqzdAY11l6aa0mm1nFdHkH9GJyFmrIKajFH5u7CgpuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0VjpCHOoLP7CV/gowM5liXadOZQInGB5UGXt3Yuquc=;
 b=IXUK492A9V2yVoYumHnf3w4n2tu0L2BMXJCWeYgpgWbpRUrk8NGd3nsW3ym/PFtI84Xv7GPyQ2C84J09a4yCZ7aIm85LCJIed46kwFIcUrvLrPlNgRUo5DzwW5Vcq57fAnSXd37o6/nV2NcXsPIYJqlDuI9Z+iMacsBZZfIn60s=
Received: from CY4PR21CA0040.namprd21.prod.outlook.com (2603:10b6:903:12b::26)
 by MWHPR0201MB3530.namprd02.prod.outlook.com (2603:10b6:301:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Wed, 6 Jan
 2021 12:26:56 +0000
Received: from CY1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::42) by CY4PR21CA0040.outlook.office365.com
 (2603:10b6:903:12b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend
 Transport; Wed, 6 Jan 2021 12:26:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT036.mail.protection.outlook.com (10.152.75.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:26:56 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 6 Jan 2021 04:26:50 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 6 Jan 2021 04:26:50 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 hancock@sedsystems.ca,
 vilhelm.gray@gmail.com,
 syednwaris@gmail.com,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.6] (port=49550 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1kx7to-0003Ag-R2; Wed, 06 Jan 2021 04:26:49 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>,
        <vilhelm.gray@gmail.com>, <syednwaris@gmail.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V4 0/5] gpio-xilinx: Update on xilinx gpio driver
Date:   Wed, 6 Jan 2021 17:56:35 +0530
Message-ID: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6baf4bd3-c328-44c6-6914-08d8b23e5b65
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3530:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3530F06329BB0AF879DAB097AFD00@MWHPR0201MB3530.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2LOBiBn80Suu+6XLVwcGomhGNp1k98GS+lsWCxiUMpoFNNpqbyZdRTcCoYPoV0tcPSusZhVyTu0p2I2zMBM7SBXenuJYc7IRajlF46K39/dYxl5M+0ZIqewC0yivTGjKPPRjqeJzlpJ/zQiemv5807YyvbI0nFoe0gSTJQBwyOdf/4Pz9iS2fphafOhjYTaKmEuVp6pTEylCQxSUQIVdMq6zkxirk8VnbsMXrgthQ/BZY6mHjDuVngr+bdXKFJ5qzkNMEqnGS42Af7IwBm/As89VCeaFSnRiUbbN1l+cFSTu+5ltI9U3a40LHC3OTqstqlgo1RZ4m507em+UUDM6mkxJFF0OfPHOx2XbZ8w3LUL28ldqsOlRj78s5PgR8kNQix+yfjEZm019YfT3RrCq77hQx+s8PkCSuBMhL/iXqLwHXgN0NEUaHLOIW4pYhO7gWRv9cQp5Rn4ovzMdRmSSfju17JBfr+9URjELhyoZxPKXB0lzNPnPsoN3/pWoj4x
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(83380400001)(107886003)(8676002)(7636003)(82740400003)(47076005)(15650500001)(44832011)(36906005)(356005)(70586007)(6666004)(26005)(8936002)(9786002)(70206006)(2616005)(4326008)(426003)(54906003)(82310400003)(478600001)(336012)(316002)(110136005)(186003)(5660300002)(7696005)(36756003)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:26:56.3374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baf4bd3-c328-44c6-6914-08d8b23e5b65
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3530
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series does the following:
-Simplify with dev_err_probe().
-Reduce spinlock array to array.
-Add interrupt support
-Add support for suspend and resume
-Add check for gpio-width
---
Changes in V4:
-Created new patch to simplify code with dev_err_probe().
-Updated minor review comments.
-Created new patch to check gpio-width.
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

Srinivas Neeli (5):
  gpio: gpio-xilinx: Simplify with dev_err_probe()
  gpio: gpio-xilinx: Reduce spinlock array to array
  gpio: gpio-xilinx: Add interrupt support
  gpio: gpio-xilinx: Add support for suspend and resume
  gpio: gpio-xilinx: Add check if width exceeds 32

 drivers/gpio/Kconfig       |   3 +
 drivers/gpio/gpio-xilinx.c | 367 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 347 insertions(+), 23 deletions(-)

-- 
2.7.4


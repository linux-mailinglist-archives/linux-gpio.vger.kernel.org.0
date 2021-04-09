Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25EB735A0AC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 16:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhDIOIr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 10:08:47 -0400
Received: from mail-dm6nam10on2080.outbound.protection.outlook.com ([40.107.93.80]:1121
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231402AbhDIOIq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Apr 2021 10:08:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVW9c0Cr7ziZHIzpsr5hz6ncKG4SH1SUKixQFwfBdal2NGKYuA33N6PChX28w4MhagFLQB3LnJHzCRp1VqlIs9nA7gsnJnu+/fyOPUYj5Yt8dqPKNY4ZeD6EsX3cw6c7XmwSS9L6D642qb9rGEovszlgIuBM0pL2Woyp3lIKwSPKlXdBHhdMEtDw8LsRnDZbUhVr1uu7XdTFP2IHxi7ZQRjNJoA9FQFd7bmb/cC6ELIUZ7mkxtCK9ickymQbhMcPeXXwFggTVGUtOGj+ZTu4vWNlJxnhl1yg8T3rzFpfqpv937kYWi5rqn3qP7AvMvtBeoINy4xHKOVETRjPGGo3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBQlux5nEgSqAza5gBtBu5uVq6xBCA36H2Gx4gHwfKs=;
 b=AnLXnuON3EJJIap1vzi8oVR0JRgtp90PeVdgcGveRPNxAj+9xMTLIsX7T/O2CEHfEAp1ahWStUD1GnLpM4gRSf8BMsOyacVRkIQ7biVKrWc+zkepWrY8w9JUT3t+G5HUL+wnf26GRnFY9uUEm/F3qXeInwE4GOxl5FDGr14/fjLScdqua5bU5cb5kJoOZrAWw//u+WjACShn7lmPS2bopz9pmWBTHKZywmOE2Aon3UgyYI7Hv34Kd6Tiet75Thl1ndWLaHeS7DeStBb2L2Ziz0Llyejf2qExC4uZU4ENOAynWM/l4y6yE6lD2dImFbCnOyJ0zeu9K0OJJwrQobI+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBQlux5nEgSqAza5gBtBu5uVq6xBCA36H2Gx4gHwfKs=;
 b=V1FoBxCTn/1lJJyzYyKRc9kk4k7sHTyOPCpBV6SucpZxILFXaF4tKYi2ynIvb9eSgeg0GdxTkPMxTYzK7DLlYqbjzBTzcm067mMyPdP7bRi7MEqas95bUm1swFIbQ5X7mHKxa79sHzlFL2aFqc0w5M7EV0N7BVZ98eZDGTZhEPM=
Received: from CY4PR21CA0031.namprd21.prod.outlook.com (2603:10b6:903:12b::17)
 by DM6PR02MB4396.namprd02.prod.outlook.com (2603:10b6:5:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 14:08:32 +0000
Received: from CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::81) by CY4PR21CA0031.outlook.office365.com
 (2603:10b6:903:12b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.4 via Frontend
 Transport; Fri, 9 Apr 2021 14:08:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT059.mail.protection.outlook.com (10.152.74.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 14:08:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 9 Apr 2021 07:08:18 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 9 Apr 2021 07:08:18 -0700
Envelope-to: git@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=38546 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lUro1-0005KB-7v; Fri, 09 Apr 2021 07:08:17 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 0/3] gpio: zynq: Update on gpio zynq driver
Date:   Fri, 9 Apr 2021 19:38:03 +0530
Message-ID: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9452fdd0-47d3-45c8-b00e-08d8fb60f535
X-MS-TrafficTypeDiagnostic: DM6PR02MB4396:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4396C61955857B8B9C765085AF739@DM6PR02MB4396.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hx6q94JiaN40AeCX5muKewj4FAZo5I4L6MRtNY0DBMDCJbuM7P+wJvD/dNUKdNOsfxYcKp9fykurvQsxKjnQ2SYrWKPEgoo9hjxagcESl4xmJIGHN5z5AV4yaFyRnOYfZUpJfRgwuMVK/yFnkpFjS3YwtFn7zJUOLYpv4KedEEjYpaVe2OLuzRUZweAGLdy0vEOHpvfnGYgb5AKJbeAQ+h7kmtBxeHQvAOg6+CZ/Ucsf/synRAcWn2MIGnLxaOMQNZ3grE4qXwZjSXu8DhDan8J511sUzoNGmSGZHEa0JF/Fq3sJBGNWgHWkN+2WcUabuy67WBKb4fqdVSXZ2WEtRhdPl0bLN3bsqhw7zIzU2wFjWQqYLSzAm3BCBrICAdXz6Bq/2cI7jiSp/YJf80rbglSSzG+iVgLZiY4aDOt1qOidUpTKsiUlgSPEqIq+cKHD2L6tZkL7atr3JXZit+4tDcxJEAEGoES6syS+UX3OC7RO2ANiI+Xo+rSP/9Q92S5XYp4GPFi4VAfZgkWDFBZuma4bA5jLACFiErgRwsTjWpd6ZGstENZ/ME6sGoWb56uqyQhF6fssSRknKk2tFWbiOzq2q7vkaMiuHjoYjahjgWR12zHfy8QCi/YsWyCbayPAcImrpqpon06PPmVon6IfGWoKoWF6ijd6NucCQeDzS8fE66vqc9ByUIB6xf8+Bt6o
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(46966006)(36860700001)(316002)(70586007)(83380400001)(47076005)(4744005)(5660300002)(82310400003)(6666004)(336012)(7696005)(54906003)(1076003)(70206006)(110136005)(2906002)(9786002)(36906005)(8936002)(8676002)(26005)(6636002)(356005)(426003)(7636003)(478600001)(82740400003)(44832011)(4326008)(2616005)(186003)(36756003)(107886003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 14:08:32.1674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9452fdd0-47d3-45c8-b00e-08d8fb60f535
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4396
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series does the following:
-Simplified the code by using module_platform_driver().
-Fixing coverity warnings. 

Srinivas Neeli (3):
  gpio: zynq: use module_platform_driver to simplify the code
  gpio: zynq: Check return value of pm_runtime_get_sync
  gpio: zynq: Check return value of irq_get_irq_data

 drivers/gpio/gpio-zynq.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

-- 
2.9.1


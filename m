Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8531FCC75
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 13:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgFQLho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 07:37:44 -0400
Received: from mail-bn7nam10on2058.outbound.protection.outlook.com ([40.107.92.58]:28293
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725901AbgFQLhn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 07:37:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UT3LVo6mh+1OnWbVEo3OU3ef1lq3YhrziyRzM6V95PBiS8kv/xckuasQsRgw1qDmuozt+EhBuugjKsGpAaTja7aA9u4tEAmZ/T3nljvajtsEqaIJBckidJSQGmrXryjl9irxDP4cGtcrN8rEZC9XGYAzKrwMFRUFsZkEAfOuSAjEUAX/6l99Mo2CAuOwurf1QGxdyKw/Tvxm82JvocgMzjWtKb67pEIW4o9mvdQiCAs8ly+6UHeIVd6trotBEw/u1Dcdc9j5QljcrC0CB7E5lVcaXEUvqvF1vO+0sv64k6c/JvENl6nV3zcZ2v0C9oiK7KJ24IM3o0kMD94o+AlG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCLDLDK8GNAsRPQHb48AEdaj6H8+DPmwV6z5eKEpG6I=;
 b=MwqPHBw5hAvITH8EMiUfdhWND8bbgAbM/6R+A+A8nyADOesnLPZsCn+MzyinatoHo0r5r0Yq9bDJEKsePEjFcbMUNT6iGpizJtiqR7G4xO9Pe4kJNqkCb5ts+tlAYdjb4LHwb49MR9/pOmd0m0U9DDLwrhWMRG0BUFwTBo4W4dtp5KrqszovH/PJzsHqBz8MYywE0+b+HuHGA4rMrL7uuCRdqSaqaeyIS2AgVFbkiz8CTwZviRozSK3Ldr35eVKaWwSPumMYHvPw45YpVMauyHC61QenMDOvTGFMKCdckefh8ymAUrA+6qxNS87NyIMdcqnioLaciCgdAWEpQ7FvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCLDLDK8GNAsRPQHb48AEdaj6H8+DPmwV6z5eKEpG6I=;
 b=NapejguyG9tMc6I6yjXuUOuTDs3cNIb8vR0LNjCvV8OOH0Stc1ACaTjusY3x/08scuIENXUgrRGd+bkkn8eZCs2Xm1tCdrESnN/h6T6ZT/2CL3d+EWO4woGtWur7vG3YBf6rsURbCxX5khwrYFjNCp9xLo23S13q/FRHSzdZIks=
Received: from SN4PR0701CA0014.namprd07.prod.outlook.com
 (2603:10b6:803:28::24) by BYAPR02MB4264.namprd02.prod.outlook.com
 (2603:10b6:a03:16::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.25; Wed, 17 Jun
 2020 11:37:40 +0000
Received: from SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:28:cafe::c1) by SN4PR0701CA0014.outlook.office365.com
 (2603:10b6:803:28::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Wed, 17 Jun 2020 11:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT059.mail.protection.outlook.com (10.152.72.177) with Microsoft SMTP
 Server id 15.20.3088.18 via Frontend Transport; Wed, 17 Jun 2020 11:37:39
 +0000
Received: from [149.199.38.66] (port=36024 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWMt-0001HX-5l; Wed, 17 Jun 2020 04:36:35 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWNv-0007Wp-Fz; Wed, 17 Jun 2020 04:37:39 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 05HBbUYo032503;
        Wed, 17 Jun 2020 04:37:31 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWNm-0007TR-FN; Wed, 17 Jun 2020 04:37:30 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V4 0/7] gpio: zynq: Update on gpio-zynq driver
Date:   Wed, 17 Jun 2020 17:07:20 +0530
Message-Id: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(376002)(396003)(136003)(346002)(39860400002)(46966005)(83380400001)(316002)(81166007)(47076004)(8936002)(107886003)(26005)(8676002)(82740400003)(9786002)(478600001)(186003)(336012)(426003)(82310400002)(7696005)(4326008)(5660300002)(356005)(70206006)(70586007)(44832011)(15650500001)(36756003)(2616005)(2906002)(6636002)(6666004);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c8bb0dac-2164-4458-89c0-08d812b2d745
X-MS-TrafficTypeDiagnostic: BYAPR02MB4264:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4264DA3FE3428B6CE535CBD9AF9A0@BYAPR02MB4264.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +NxA606+esr0jqu+cZUech+mIMOIXjlheTV/P4iCUv2hABu87LIUEya+l4j2bu+/m9yyXIpGKC5qnhN4ODVd1BRrWmmwyoZMAwJyYl9p59K8/gU5ChkF3d881gdxXqEDCrxl1Ik40MXv/rbjzX9HxOtXcyVwj8gNMTuKeghSQ0XZIBf+vuXrrijSHkEpGqSyaPivmtFGzu8IN2/ye+pLhM/L8pFrL9UB7QzBYyXz4HvnqT9fADh7cry5Z9OaT2HRsz8W9ojwhJKQbm9yd/W3V6wvdoFpnNrqs0f5l5/3Of+VgzeWPoqpevU9wzi82B3Gc+0SSvw19jtKfCSidf+6xLzdLzD8vXkCZnii0pFIUXsgawj1bNwzwXOXMH8H0nKpGDzI03x3X2sesYwdw8rCrg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 11:37:39.7982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bb0dac-2164-4458-89c0-08d812b2d745
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4264
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
Changes in V3:
- Updated commit description for PATCH 4 and 6.
Changes in V4:
- Updated commit description for PATCH 2 and 3.
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


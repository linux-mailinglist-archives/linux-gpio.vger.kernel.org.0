Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7283D0E69
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 14:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbhGULVn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 07:21:43 -0400
Received: from mail-dm6nam10on2077.outbound.protection.outlook.com ([40.107.93.77]:51234
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237398AbhGULOf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 07:14:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtN5vqxZFPLUiE0GMRl5w19WgH5+4zovJgd3yxB9UQqgMtnpmErM9L/aod7rKgx4qVHA0kSQalxR6fnUJ64WUnCOBPvwZyLLIz4Ecx9/v0ewN2M6W/26hQ7u6h22CFKwKOT6kLBEdp6R9mzZY3Mj39SOSjOkH/ArffNPYY3vmzPyG/pqOyM61RTyn1Lk5woNjlNmIJTHlvwODdjDUj4+837B/w47EeMb4dsXElIJPZWAq8/Ulc2YeQiCDYUe69Kmsa3MtXtsuVHQgZlfZEclGW9iqR6uvdbjsrZULT8p/WCcecXDoEHFl4lMAMEHJt96O5ZWLKnIZlX0I+uf1tAl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpEiMkbGmC6tuLK1fehKlRJhMqIVl8VjA9meM30GduE=;
 b=RtUcHfzHHsiIFNoMiUZudkMqN8WlgXGC2KQSXWGkep/Tw9McsY0YpVnPyaO3R4tTEetz7GOnEGc0q0xTI6XCU9riR/yEqUrKoJFXFhSFcsQZT5zGrwz5JO+LtippFhPsKNlXo82gVWAmZ2yDBjJdtawV8I9lD9Y2vZtrrmwqr47whrbj3IEGN+/27OJflqWt3W18gOiQIlia14E2JW22Rpt0GVghitZlDm1wAek7nlH5lC5ky/RP3V8KeivI3k86j700OJ29jOgiq4T1SIMnmChROIdjJ7ZHDh+60sRki3Q8SZa4ZL94UiAR8uAAetjph5xKPQzNmpCC+W9Zm6816w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpEiMkbGmC6tuLK1fehKlRJhMqIVl8VjA9meM30GduE=;
 b=eIZdLb4EEeL7gC6f3ZqIA8IHk3C3wzhc3hUNwJbfPVU6QqzmFZfSP4iIE6us8XW5IqjpQEMH38Ns/ZtuIkiwj0tF8XLuR3wmOPGUWs3izon/dKC5nUkmgUci5XBcJ2iEVe+LQPU4KKBU6ZIjd7ng3nZ7q1jn5ryxsa1romHCByA=
Received: from SA0PR11CA0180.namprd11.prod.outlook.com (2603:10b6:806:1bb::35)
 by DM5PR02MB3193.namprd02.prod.outlook.com (2603:10b6:4:62::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 11:55:10 +0000
Received: from SN1NAM02FT0059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::6d) by SA0PR11CA0180.outlook.office365.com
 (2603:10b6:806:1bb::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 11:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0059.mail.protection.outlook.com (10.97.5.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 11:55:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 04:55:05 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 21 Jul 2021 04:55:05 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=50903 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1m6Aoa-000142-8i; Wed, 21 Jul 2021 04:55:04 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id B687212180B; Wed, 21 Jul 2021 17:24:23 +0530 (IST)
From:   Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: [PATCH 3/4] pinctrl: pinctrl-zynq: Add support for 'power-source' parameter
Date:   Wed, 21 Jul 2021 17:22:32 +0530
Message-ID: <1626868353-96475-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24459db2-85e1-4dc0-c389-08d94c3e6407
X-MS-TrafficTypeDiagnostic: DM5PR02MB3193:
X-Microsoft-Antispam-PRVS: <DM5PR02MB319326EA44537FE56813AEDFBDE39@DM5PR02MB3193.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BmxHsvp+1Xbk/DLh3dsSAgc+HDz0BNVb95opB/RIayL99SZLsXqZ3eEIg6XHuVss7WF89NWWXrKgN6wM7/1qK8SSl2YZpWfWbZQF7BQbXwbhYTYBsWsGxawq1tRVZvWN5NJBCk6Q+pfEisQsBZ31gPhAqBbiYiZKiqQuV1eKV6VAqJNM/K00ZeJ/+HOnjBwKH3KC41MYuJrFa9q0at7lfolCFHWQ7FEVm4R8Yin5Uc09jzYdhDMSx41cU/+n7iAoK6Gn6TsE+IvmKY8TH3ZrJws8Yj9SlNStUrlFz8AXbPLTcLngcy4/HFxo/7NYflo4EEhCD3ulPBZKlpD+PdwVd4GpcMbCuokBGCuPLFtA2ynA/eHu3Y1Qrj42Zm4sbk/lx5zXPm7tiNp3+2cyza+Co/16T6P+qNx0ONVd1Y6Rs+dclPH+25o6VFcHhtsRN/RVCNnathZeA1CXIERnSzhIXwZutuXsQPEbCK+VZ3633DKLGZWsuBQK2vhuvE4a1/nbTzJFo1NFJdkTjRxq0OcRsZqlYJjg1fp6Jd1yVdR9D0IfZL1GeW7gw7F1bA3pJbxwLPxHWaJ89xw30e2WCeFcKyfpYoh1tRea+2AU1R0q8CiJqkl4J2wDUXzJ/Di2KuUSCK7fkYNJZcsErsgDxU6M0tHy5VZT6VBHx3bblrGY6jekPmmLCXXaDE3izOQ8PzTTCvR2IAqpmBwdlkcJYVwFNHxZUQeCEMBsvHW1jZ+uLEw=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(110136005)(4326008)(47076005)(7636003)(8676002)(70206006)(82740400003)(8936002)(356005)(70586007)(2616005)(107886003)(36906005)(186003)(36860700001)(426003)(5660300002)(316002)(336012)(42186006)(6266002)(54906003)(478600001)(6666004)(36756003)(26005)(2906002)(4744005)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 11:55:09.8729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24459db2-85e1-4dc0-c389-08d94c3e6407
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3193
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for generic pin parameter 'power-source'.
To maintain the backward compatibility, 'io-standard' parameter is still
supported in the driver.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 drivers/pinctrl/pinctrl-zynq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 5fb924a2eedd..a96af8a76a7a 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1028,6 +1028,7 @@ static int zynq_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 		break;
 	}
 	case PIN_CONFIG_IOSTANDARD:
+	case PIN_CONFIG_POWER_SOURCE:
 		arg = zynq_pinconf_iostd_get(reg);
 		break;
 	default:
@@ -1078,6 +1079,7 @@ static int zynq_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 
 			break;
 		case PIN_CONFIG_IOSTANDARD:
+		case PIN_CONFIG_POWER_SOURCE:
 			if (arg <= zynq_iostd_min || arg >= zynq_iostd_max) {
 				dev_warn(pctldev->dev,
 					 "unsupported IO standard '%u'\n",
-- 
2.17.1


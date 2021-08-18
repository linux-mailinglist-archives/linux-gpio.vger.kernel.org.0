Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458DC3EFA61
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 07:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237822AbhHRFyV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 01:54:21 -0400
Received: from mail-dm6nam12on2047.outbound.protection.outlook.com ([40.107.243.47]:33249
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237788AbhHRFyU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 01:54:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnwQFhkrt1Ta/9VtE+dn1l0GTVXhzXqxwd+aAH5XODiM+/FdnHgsMxQ9YVWj3wUs6oZ6vqv6obNxxeIBnqYY1hfHOmIEjRDZOMf3ZUPfRDlziOFNWmPpXBsT4zopoYfPDpiRx7NET1tsMAPE9G2fZv5UlDH2SKJMIN67K6U8/vR1zN/HrGsE81Rsxh+4uWbO5KwrOg1/P4cm5t94Ji8jjZhu44K42Guhuum31e/AJ6UQByLgqA7CVwK0bsONncMH94LjAqchVJ2UEjV008UtEwBg0A/k72dq84OBC4Br3B8No61POkfGQXfiWhi3auNY+jG9w+/9ZcydF0o8bxvGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWnKt6m37LUQMuv0qN3LAwajiOiP6bz47fz70847Ubc=;
 b=YiL2D6t6h9Iu6jTT07NqXYTWhZIvUbYoiE6L8yUw7wgjziBJsHwIHOhZ5Pp1SQk0fSJhO4dQGlFwqyL3JTlXqnMFsyxLwaopUu+C30+6tw89NT3gVU1ZykiXTd1soWy33vw2LTrDXySRmf9/UuJRwW7t9XRibXRzAEnD7W3DyumZkMFhqHv9sv5jEb5mIEGzwKbtVjZ0r1/NTjY2KcvESR31ALLKuZDJNHyPhNEymdlR3N7NyZI7km5zlbMu7AnwnczZ72RHyIxAMksqyn0azhcCEWTlFWBcG4KrSfVi5a09Jnh062fot/3rBORA1uPAxRgSQftvLfDsJAKBeE2Dag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWnKt6m37LUQMuv0qN3LAwajiOiP6bz47fz70847Ubc=;
 b=IKDhiCH+V0PNl/cVnWFc/9wOLh5l4bBkMaYyTlIG2b/brH/8jmLBpW+Xmr2o4C0l69aHYFjTNBeg9DxDD4HQLxU64WA01QJqNAG3Q+mEdl1jxaXirtkI7lt3BGkSI6DWs1e404Hlb3U1UdsyFtjRHc+oO9fViRfReMmK/h4k1PU=
Received: from DM5PR06CA0043.namprd06.prod.outlook.com (2603:10b6:3:5d::29) by
 CH2PR02MB6775.namprd02.prod.outlook.com (2603:10b6:610:aa::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.18; Wed, 18 Aug 2021 05:53:44 +0000
Received: from DM3NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::f0) by DM5PR06CA0043.outlook.office365.com
 (2603:10b6:3:5d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 05:53:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT007.mail.protection.outlook.com (10.13.4.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 18 Aug 2021 05:53:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 Aug 2021 22:53:43 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 Aug 2021 22:53:43 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.63.68] (port=52426 helo=xhdvnc208.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1mGEWE-0004yn-4Y; Tue, 17 Aug 2021 22:53:42 -0700
Received: by xhdvnc208.xilinx.com (Postfix, from userid 14964)
        id 5C6372073A; Wed, 18 Aug 2021 11:23:41 +0530 (IST)
From:   Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <git@xilinx.com>, <saikrishna12468@gmail.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: [PATCH] pinctrl: pinctrl-zynq: Add warning for not to use 'io-standard'
Date:   Wed, 18 Aug 2021 11:23:19 +0530
Message-ID: <1629265999-33358-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6af3f002-69ce-4f36-0ae3-08d9620c8a30
X-MS-TrafficTypeDiagnostic: CH2PR02MB6775:
X-Microsoft-Antispam-PRVS: <CH2PR02MB67757FD705F224E83C2687D9BDFF9@CH2PR02MB6775.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TfgX2nJMdZFx2zkCVBK0+CqSIpKq2x/rZWoHv2rFaU4zIwS7TP1rM+lpQX0mqfco/tOYTjN96Vrf+oys14zcjgUGzhm7KWAIXAXloF31DqoPjHILOKzX6YsXBJCgN9Ccc0ch+QEUaSWrRBmu5rkHIA8JdIAtKF4fw23BJY3TuHQjs1NQcYg5X1QXtVqiKdKKRKjZbDqrifKRJ5PIcMk1VCKhKXaYZvlGLND4Vzrry8rrpeGbYAgzXZGtpcqLzsy8NkgJQXW0pKTptaxqPZoQuE5OOtXxDOvMu0IirJepee+nrPZKcIsM62NSpxTXqVHLkqmTxVCEVq6msg6vji1GPRJ8UacDEuqFBZjETg+aQTZKkAdLKywEcvGMFYEuqppgPJe45MRiDzAOFj2l6APXtqgDBUYc5S0cOuf18rvkr/gqWAGVscY6sd35O/L0cXNLlf02pI2Sse8HVcU2rJyQRJZaT2QUbgwOkl8B8MjcX5MLcfDmWM4Gz1GA2KFPE2i10euXy4kCgTlwsrbtDvCdWTjsu2jiJHljZhOR9RZIRiQ8h5qZp4jwDQsN2ggXg0TI18Ezh8RwKVlDb/FZU2IDARxkt0OjrFwRqf9eHlLmfZQc+3EHDoPVO+qeBbKTno126b66Q6N6mDnlMMPIR7MEgt3voEc0Rti1pHxctHk1EwOPvYfAWPUvcv1VnLXPEy4X9SgePKlurAuevqT7FGz8iODkcnxmiyVB16xwPCwPWGc=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(70206006)(5660300002)(36906005)(6666004)(107886003)(186003)(47076005)(70586007)(6266002)(7636003)(2906002)(54906003)(8936002)(36860700001)(2616005)(8676002)(4326008)(6636002)(110136005)(82740400003)(356005)(478600001)(316002)(82310400003)(36756003)(42186006)(83380400001)(336012)(426003)(26005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 05:53:44.6260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af3f002-69ce-4f36-0ae3-08d9620c8a30
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6775
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch add warning message saying 'io-standard' property is deprecated
and instead use 'power-source' property for configuring power supplies.
This gives an indication for Zynq pinctrl users to migrate to use
'power-source' property.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 drivers/pinctrl/pinctrl-zynq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index a96af8a..5b269b6 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1028,6 +1028,8 @@ static int zynq_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 		break;
 	}
 	case PIN_CONFIG_IOSTANDARD:
+		dev_warn(pctldev->dev, "io-standard is deprecated, please use power-source");
+		fallthrough;
 	case PIN_CONFIG_POWER_SOURCE:
 		arg = zynq_pinconf_iostd_get(reg);
 		break;
@@ -1079,6 +1081,8 @@ static int zynq_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 
 			break;
 		case PIN_CONFIG_IOSTANDARD:
+			dev_warn(pctldev->dev, "io-standard is deprecated, please use power-source");
+			fallthrough;
 		case PIN_CONFIG_POWER_SOURCE:
 			if (arg <= zynq_iostd_min || arg >= zynq_iostd_max) {
 				dev_warn(pctldev->dev,
-- 
2.1.1


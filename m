Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53732161214
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 13:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgBQMdk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 07:33:40 -0500
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com ([40.107.236.81]:64737
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726414AbgBQMdk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 07:33:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bfb+JRitMA3K6kbEMg3EcM0+Up1JfxSoIKdGhqYBL2g0ToTbJ+b4/IHqmJl8Rj5PBeRCWWi1m2Ssd/MeqVj6qvCSJq5f3Ck80FXJi/aSnfp1I0HPX8c/eYlLcnWCskeOYlhZPwKvu3yjz+w6F682c12DfY+GCsOLL0oU8uaf2yUzR3PeMx1LfYT4bG8Vjc/7vOoZ6hi0UpkNNjDNvhZ8S/g9iYT7/kCPbOwNSHbD/t65j4RW3/Mi+kf7nULbhC0m6jl23vf/g6T1WcW/qjvAiFNPEQi25t2tCRt85VhLl38vqupY2tbWXV3XdkmLcl1bxzGVsD6hkyS/u9OiAWlz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklJFrMzQVMm4jnGo6isE2E2T26F0WppHCWthHoA48Y=;
 b=P4AOiPQwRmftUWTu0x7jQ7GOvt56gMQLNJLM6QuYglM4ak4obYYOMjFRjnWk+8MpOnXP4ftpHh7T9epwIfcBHw5N2iGAAylOMk4TQJVM4dfAnws2pQN5CgMy8wgj42xasA4RH8QSRu+G4LadFHo8uVvEs8dkjedtPs62Ack6oK15ObUnKwyQb4db1H7GrYgYsg76RN1ERPU3nOsxLujERM2iuqsUIl9Jx6ljAwrThL5RKOZE95h4yYPF9IVoVsLMo+G3PAE9JB86DhridzN1AMJ8yO2K1vGz6whD1H0QHlNkPsmPd3a2H6OG5uh3KoPzH+UL+qKusUdVXcwnOmhqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklJFrMzQVMm4jnGo6isE2E2T26F0WppHCWthHoA48Y=;
 b=OXiPw0GqvILGdr65Us8u4EqQomB30Q3jS/5t4DuiFD/ILBCoisPUBZ/ol0IMcARqCQoesszamQtvOX4aUZlAMiqfojDgrHDLabb3jvQxZQVwA+85/zKCT80iQIQO70V67mDJLgS1FeT0GcRy8cXzdVKxJyVJTpwLZakp+i3iYBo=
Received: from SN4PR0201CA0018.namprd02.prod.outlook.com
 (2603:10b6:803:2b::28) by BN6PR02MB2737.namprd02.prod.outlook.com
 (2603:10b6:404:fd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Mon, 17 Feb
 2020 12:33:37 +0000
Received: from CY1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::207) by SN4PR0201CA0018.outlook.office365.com
 (2603:10b6:803:2b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.27 via Frontend
 Transport; Mon, 17 Feb 2020 12:33:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT036.mail.protection.outlook.com (10.152.75.124) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Mon, 17 Feb 2020 12:33:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fai-0000Sc-UL; Mon, 17 Feb 2020 04:33:36 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fad-0001wt-RB; Mon, 17 Feb 2020 04:33:31 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01HCXOlR025870;
        Mon, 17 Feb 2020 04:33:24 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3faW-0001uE-5v; Mon, 17 Feb 2020 04:33:24 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V3 3/7] devicetree-binding: Add pmc gpio node
Date:   Mon, 17 Feb 2020 18:03:09 +0530
Message-Id: <1581942793-19468-4-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(6666004)(426003)(356004)(336012)(9786002)(70206006)(70586007)(5660300002)(316002)(186003)(81166006)(81156014)(8676002)(8936002)(4744005)(2616005)(26005)(107886003)(7696005)(4326008)(36756003)(478600001)(44832011)(6636002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR02MB2737;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f71f82ac-8855-4f20-cee3-08d7b3a59c9f
X-MS-TrafficTypeDiagnostic: BN6PR02MB2737:
X-Microsoft-Antispam-PRVS: <BN6PR02MB27374CEC635A3348684B654EAF160@BN6PR02MB2737.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0316567485
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1ZmHC7ZTHJHuslVd62kWqsqH1OaaDM/OUvRBDwJ+FxpUsLsnmPFEMxsKBfigOu1xe2lY3IanI6BpY1vyfkD6Tcqu48IRRdFykyPeqR/mqX4331KWrB1qab8aLtlZ1GKSXQCJYg/AyfoF4SAxjFlIsxgLE1V3SUmEIGlMUH3PzibvIzs6S6v8PwCc2pml6eIS2STfRYkJda5XQherNJeNj9v7yImnlFGOyrBt1VrFSinmh6ETRCuXKwPPK4xpbOXsST+7gyk9aTWzSfOY7imqjoRSkHxgd0J739ZivFfBdNwhMdp7Xqn4O4bwjH6QSbubO+Jy4YrIjf77CCnlIQlrauR3UdstSAZL1bG9UMWemXEp+4M8F35EbeDbwV5ifJvtrSxWqiElTZKdY71KtiX8JnbrPNaOJTVj5s+GcN7R4UwaWVLzoZq+p1CovY1F7vI
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 12:33:37.3608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f71f82ac-8855-4f20-cee3-08d7b3a59c9f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2737
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


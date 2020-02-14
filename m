Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C05E815D2A7
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 08:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgBNHQI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 02:16:08 -0500
Received: from mail-eopbgr680068.outbound.protection.outlook.com ([40.107.68.68]:57831
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728930AbgBNHQI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 02:16:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdcHMkjjh0DLJ1bMWALGNJCcDs6u854EJD0EzlUqObBZeRvEUi1c4T7iiTcAuqBGEFcHZvQ55ZbP3EyBjE3PxoRm0IgHs0Ym/Qwe2B2DeKanto/swLdAulw9mGAFPJOhyeb8yoFdwHXbnyCPTVFtyYO9ZTM8UV8WwrLqZP2/YU4RW009Bn7Jh20UbG/KcucZMRb1SP6jPLqNh091oona0zYfndZzDzp6NKelOWRDO7qXgsF3UZNVLcTTQhkkJmSPD1x5kPUycAzUfEQ8lbmQbO00FyKjvA8pBG6Rb6MSAz7W9lhLqPv3SGCFZIVCm719ZzcYBA6cy1Hid6GmLnBTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklJFrMzQVMm4jnGo6isE2E2T26F0WppHCWthHoA48Y=;
 b=LH3pWvPGEJpa20iLFxdCyM8G3tLZNUYi+sYsfFFVqKPXcDArHQxxD1sH6JhQW4QYMI6eRky55d7XN0VwSMTcVnbRkb+Knd4XGimi043sfz/6/GIVfWvrS7TKEs2q2WBdXTSn/QGQFX2r1tMQeCJG+OwWo7S/J/0FeqXlzX2G+QYYoEXt19v5Kv+Fj3M0dYhtHl/1IHdORephv7U3hMTZdlGSBcCgichbXcvIGIjSD233ZmVLqsUa9FRqz4lAzLWZa0pDlw+a7+hsr82xJO4XAYlhhqLbGf8j6KhIkNyGKueGZQ1/8XKOYlL0P2Zaq7yfEib7bQqPEuxDF5EqqCzZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklJFrMzQVMm4jnGo6isE2E2T26F0WppHCWthHoA48Y=;
 b=cnOwJVGqpgw2e0OWw0yJTW8rjOrd3EHfrXizCMSfDNmoPZ60tXfW2441y3ijCLKC9TaRc1xqBzzbb9jxcbLthH73Ro6BVzYGzusTs9fGxoHbdRWURIQy8rOdX6pAKJi0pdJDBK1ZyOxIoNonRqfI2etvKeJ7OtuPttuDH3MfQEQ=
Received: from MN2PR02CA0026.namprd02.prod.outlook.com (2603:10b6:208:fc::39)
 by MN2PR02MB5998.namprd02.prod.outlook.com (2603:10b6:208:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Fri, 14 Feb
 2020 07:16:05 +0000
Received: from CY1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by MN2PR02CA0026.outlook.office365.com
 (2603:10b6:208:fc::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Fri, 14 Feb 2020 07:16:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT030.mail.protection.outlook.com (10.152.75.163) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Fri, 14 Feb 2020 07:16:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCl-0006GP-QV; Thu, 13 Feb 2020 23:16:03 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCg-0000Ru-N8; Thu, 13 Feb 2020 23:15:58 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01E7Fn18015568;
        Thu, 13 Feb 2020 23:15:49 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCX-0000OQ-6k; Thu, 13 Feb 2020 23:15:49 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 3/7] devicetree-binding: Add pmc gpio node
Date:   Fri, 14 Feb 2020 12:45:33 +0530
Message-Id: <1581664537-14386-4-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(189003)(199004)(4326008)(36756003)(6666004)(44832011)(356004)(478600001)(2906002)(81156014)(26005)(186003)(70586007)(107886003)(8936002)(426003)(70206006)(336012)(81166006)(8676002)(2616005)(316002)(9786002)(7696005)(4744005)(6636002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR02MB5998;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40422a55-fa44-4c67-c222-08d7b11dc105
X-MS-TrafficTypeDiagnostic: MN2PR02MB5998:
X-Microsoft-Antispam-PRVS: <MN2PR02MB599859D9D78797CC08E47150AF150@MN2PR02MB5998.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFkb0Gk3d0EFI88lF/GFcn4WRR2Ylg7Rd9WLk5ej++znB+kJyr0zWxcMjJDp8QKnOdlRH5ICLkdcKHwyJnizRjO1A4hoKEo70PYB+v+zG4urEm0eW9cwL/9kJvrixE42U/3bl2gU3XrgTXxnyciv4w7/CgNsLLWdHkykF5bhUGUUs+wTV703YDadCzZTQBBIBUl07vZS+3xStg7Se7NOfje/BOvQ5GIZ7TpgoAIsnyQwJoO4VRME7citfyAPe1AeTYc5doKha5sYWb+IsfnhuPnPhYuIvoW76G1VyTfv9LGIFZOHVhymiI03yOghWPN/AYjn+hs+W28F1vAuiwuulUTPD/QeIKdAsmHf71Z3LzxoGE0O/u5eNlOP7y9zVNru3nXQpynW6kMEMX8GvwN0aBBVKDc+DOmLgqPy7jDSHlR91UsAphTT5RiAWrzVngO8
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:16:04.5481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40422a55-fa44-4c67-c222-08d7b11dc105
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5998
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


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493D322B0FA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 16:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbgGWOGc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 10:06:32 -0400
Received: from mail-dm6nam10on2088.outbound.protection.outlook.com ([40.107.93.88]:22432
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727111AbgGWOGb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 10:06:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwh3BcFlFOKeJhKiXlg8X/vQuWr65i5oNLPQajYn0C0/OgAqQB1o7vc+F6bYAK65Vzpkj1oYxHNManIndFH9HbQJ0lpAWVbZ73vmzsQULNbBiFc6HdIkR+Nr4poGE0pMMY29YW6nU8SF3cqkJ5EXiTviL0LNb+EvqKs6FlvUCms1b0t+K+Bwa1Ho4gB9bm7qYLMlwnh5aMbM6qntD9lluXcRF3O6tdgfcq6UEGn0ojf6bHVaEvMVyAg6qSFll4viGmQPS9AzZom9TmE1oQohuhSf6kJBnk1N9Apv9usCNRIZu4pMAai0SAcuXFdV91qPynFYcauZRO2xSr4+2HG2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywkMrig5SSgN6/sqmk4HzYAND1AgcJ2iPorIfTQ34iw=;
 b=Zjn4EnWt/nG8LGM5YLnHSR/ccy2zjTh3FQvPYvPAT1SjHMnBctxb24fvonidkf8KVvS1e9lHs12OH4cmtIiYLNNws1Z5rkVKbmuMDzB0IEZltZ8K7QC6z97IV1P/TbvpMMTIoIHLw/jjM5SNogJ6giol00N/KG3n71pelnLqfuAUh+bg+fah9ovot3UBs0YsR6iPKSw8O75LHMs52WCDd6CFXXE/8rGWMB40EFByJCREGwfYHLuJ/hXPafvmkPiK+DE6CyrBsf5dh5/QnKDgamVJgVpSDHr80NTOy7Ok/ySOXpY/WC3tY7z+aFzBmtq1SFPon2p4crUd3v112AyCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywkMrig5SSgN6/sqmk4HzYAND1AgcJ2iPorIfTQ34iw=;
 b=lDfeis9+UZVRtxXibhX32gczqEqCJf9RTN5BYcGbYoiibGRlei3W/kGcVIKJNjSgYvn/hX0DlASA7MJeS3+gmzpDlZU5+Ep6yId06jf6USw+gYWNpgSOsOSnYYKm4x6HuaOboJLdiNs+ORLssxJUiUV1ZtXw8+X6kMiAC5yXHSQ=
Received: from MN2PR05CA0039.namprd05.prod.outlook.com (2603:10b6:208:236::8)
 by SN4PR0201MB3616.namprd02.prod.outlook.com (2603:10b6:803:4e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Thu, 23 Jul
 2020 14:06:29 +0000
Received: from BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:236:cafe::4c) by MN2PR05CA0039.outlook.office365.com
 (2603:10b6:208:236::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend
 Transport; Thu, 23 Jul 2020 14:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT055.mail.protection.outlook.com (10.152.77.126) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 14:06:29
 +0000
Received: from [149.199.38.66] (port=56968 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybpr-0004HR-0H; Thu, 23 Jul 2020 07:04:35 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybrh-0005To-0Q; Thu, 23 Jul 2020 07:06:29 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06NE6K0B004486;
        Thu, 23 Jul 2020 07:06:20 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybrX-0005Q2-PL; Thu, 23 Jul 2020 07:06:20 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 3/3] MAINTAINERS: add fragment for xilinx GPIO drivers
Date:   Thu, 23 Jul 2020 19:36:08 +0530
Message-Id: <1595513168-11965-4-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d5f9b105-95e8-40b3-d227-08d82f11988d
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3616:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3616680E08C50B0483627455AF760@SN4PR0201MB3616.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jqv9787RC4TI3u7wi3TlNfXgoThYZ/W12FYCsFWDTA9vFYOWoaFlmVNm6QvGzmHKCIZCsLtd79MpXcXXQq8ibN+H80d4zFShF8YUGl0WCFoV7dzRfM95wKp/41Pqqx9zHze7l0U/iqPtCzMPilG/Ls+KW31CPlNBP8HrRre7JbZv5VnBvZx0WpuN2s5t7CPkM1rzcwVsd8oGtvc6fQmTjPMDWqyUBIZyKqkdf0o7eQXEXg8vUr7nnqOE4YS/zA3yNCBjtgocQ5fHC2buMFjkfaLyQT7UorJ9tztDAfPXBbBMyF7Te2ZiUZM/WDq01THgXHQuLb2dKZVrjsZ9KM2aVXX/nP2a/5OuO4Edb19RL35Lwjp2mqHC7ww3TegHBIRSf4rAmGE3rnDgax/44AiiIA==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(376002)(346002)(396003)(39860400002)(46966005)(107886003)(336012)(81166007)(2616005)(70206006)(82740400003)(47076004)(44832011)(70586007)(186003)(26005)(9786002)(4744005)(6666004)(8936002)(356005)(6636002)(7696005)(478600001)(2906002)(82310400002)(426003)(5660300002)(36756003)(8676002)(4326008)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:06:29.3235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f9b105-95e8-40b3-d227-08d82f11988d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3616
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added entry for xilinx GPIO drivers.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea296f213e45..71c40b0ddef6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18900,6 +18900,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/xilinx_can.txt
 F:	drivers/net/can/xilinx_can.c
 
+XILINX GPIO DRIVER
+M:	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+R:	Srinivas Neeli <srinivas.neeli@xilinx.com>
+R:	Michal Simek <michal.simek@xilinx.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
+F:	Documentation/devicetree/bindings/gpio/gpio-zynq.txt
+F:	drivers/gpio/gpio-xilinx.c
+F:	drivers/gpio/gpio-zynq.c
+
 XILINX SD-FEC IP CORES
 M:	Derek Kiernan <derek.kiernan@xilinx.com>
 M:	Dragan Cvetic <dragan.cvetic@xilinx.com>
-- 
2.7.4


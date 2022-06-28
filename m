Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026F755E81E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346156AbiF1Oer (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 10:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343551AbiF1Oem (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 10:34:42 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2BC2AC7F
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCD85rF1o1u5CdndwUueqKCHs/WOKtvuP1m+I7a0e+wyVTCnIycbFQKWz9Oxa5EbAaj6rC7FJr70XtSs1URliSwvEZgUM5ikQUGOtnP6PemkiViR5d9pRPqabiyZ0kfOAf8aanC6HRez+/ByWzWJrDnkz5MwLoVWG5nu74BPzPdWv9QBvNfMo9tOH0ucr9tw2ZRsRtibYQtxlQPKxB/wUqIgiqWr//pk/843QVTcPIIp4tjy22Aud23J+5/Ff/4h2B/y2JjG45Kf7d64+2UuxAvrQs5R+G/N78kXwTUZsRk1Dm6M7wVxWl5OBwdC4unPHT+FLdgoS8SGd53eCiBddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GelI6pck8jZcT/B3C8C9Y6GH+8UlH7TgxZIAmUQX714=;
 b=SBhMREntN52MvP0tnn4wb1aWHr3WQ4QNpYx/zL0MIWXGw1EIwCaJVvqcGGRXVhvs/B8pxBvqJ2dnI34Y+KZIO2oeXgvrAhVPHLr1b2BjuJpJ3A+yaaWyAVKNyiuiuLbexPcZcOdzZqtTgYfnZzx5S5mO95jSRQIjc35E9R6MzEKrBGimF/98DMf8wOGZB2ShFsfkaYuAu50PSZ0NGIeGsodfnSj27ydr9sQ/nSXkmv54+8QPt4WTUPQwlqNS0Oo3TEwJxsPoODJzvfdugaDTHGAzrvSx3iR8fHy0S+Uj3zDWbofySCJsxi53gLd4ROtneo77A+gE1N3aLydtiNGlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GelI6pck8jZcT/B3C8C9Y6GH+8UlH7TgxZIAmUQX714=;
 b=HDwYwHoKS4geSCHE8R5M3nG1l0w333wY8NlyA8izIyxpMEhHg3VZmE1qClkhm0mhkdOqIAHdWrKW88KFpaeLXu7OrIdNHHzJFldRO/z93Wc07cgG/d4yxLPP0UOvD34hr7idqr01Y/QG0ZB5U2yd08Us4wo/9BphEvTws33rMA4=
Received: from SN7P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::7)
 by DM6PR02MB4364.namprd02.prod.outlook.com (2603:10b6:5:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 14:34:28 +0000
Received: from SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:123:cafe::94) by SN7P220CA0002.outlook.office365.com
 (2603:10b6:806:123::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Tue, 28 Jun 2022 14:34:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0046.mail.protection.outlook.com (10.97.5.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 14:34:28 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 28 Jun 2022 07:33:53 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 28 Jun 2022 07:33:53 -0700
Envelope-to: git@xilinx.com,
 linux-gpio@vger.kernel.org,
 git@amd.com
Received: from [172.23.64.3] (port=34503 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1o6CHp-000D9m-7d; Tue, 28 Jun 2022 07:33:53 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@amd.com>, <git@xilinx.com>
Subject: [PATCH 1/2] dt-bindings: gpio: Add gpio-slg7xl45106.yaml
Date:   Tue, 28 Jun 2022 20:03:48 +0530
Message-ID: <1656426829-1008-2-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f57e255-d9da-4be5-9df9-08da59134ea2
X-MS-TrafficTypeDiagnostic: DM6PR02MB4364:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqgEryR3uDpqz/dO7kas2shQpgi0KjQf0IgCEwfcAkIgvKsx1iq3l5A/RTxO/pph9KNPa0KLvThKbjtofpqeHhc34G7YkmZcqRhcPzru9PElPwRQlb8ILSdrtXe++wg1tmwYVzncsABMgx7WyKYtXU7rvvVm1axGuAYHv+N51xjk7B2nNwofAOuG0NoFhNj/v8sYvE46/LItkDmZ9a0aGgglA4Iftri/X4xGpHzC9CGIhtRBJrsDO698vmxk1utQ5uK6Wdk9Kxu9dNSkIe4uZCoFefwUPO0pBZmS8e0wznXKz2rNSqtMG1O2N4s5h/arhZGfQoctzHSvQgIc7jOUeFU5exX0fKVmHXROD/wXbh5p+itZHSQpBoCLKVliGpppHR0hA25o0AqIhwFh/X0cqFBwjHIDN6V4kouDJRpCjcpKJvJ9MXQt/XqMzymkMOU6SjIoOANU+UTUC0K/1NMdGFID2gQzClsyiIB7LCYmahOgOLy4Ihu1QeOPKAC3xu++nESH/5MlEXI1f2SDLRMFQpvEYxpVFjirTovQtr4m3k8qmMjo93lb8pFybTr6o9EUwUg1KKrTEYGo5ZOX6ja3t5F3JwDZNwapZPgyor4VVXRttWsQmgNt2SmstI5AYqNe39xXGi7g+flzNxDo4Lhaf3telpwIWjTsReIGLsOPqt8BMLvBtBE5no/QtQilv7odI2mf3ql8Z2ZbVfdrSUO+E7Wrz1bGCNbI/IaqpkusE5DYvq60LkVs0Cp3zuQwHMvZXDNXwjoXNFfN+XXIzatkNdcri6hK9OczBWDL2XFsThDQCMkoS63d/+rNSZiFibGUAcaS1yLzvS5KZSjQrMnTsF5ULpRYK0njHZsi85mNimP2egmN0Iq31rxAUWjdeZXrFK5bT9N4HRT+1fNMcsk3uQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(46966006)(40470700004)(7636003)(186003)(336012)(41300700001)(8676002)(6916009)(6666004)(107886003)(426003)(47076005)(2616005)(36860700001)(54906003)(70586007)(356005)(26005)(7696005)(82740400003)(4326008)(9786002)(44832011)(36756003)(82310400005)(2906002)(5660300002)(478600001)(40480700001)(8936002)(316002)(966005)(40460700003)(70206006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 14:34:28.4096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f57e255-d9da-4be5-9df9-08da59134ea2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4364
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a binding for Dialog Semiconductors slg7xl45106 I2C GPO expander

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 .../bindings/gpio/gpio-slg7xl45106.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-slg7xl45106.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-slg7xl45106.yaml b/Documentation/devicetree/bindings/gpio/gpio-slg7xl45106.yaml
new file mode 100644
index 000000000000..7551ea5c2ef7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-slg7xl45106.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-slg7xl45106.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: slg7xl45106 I2C GPO expander
+
+maintainers:
+  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
+
+properties:
+  compatible:
+    enum:
+      - dlg,slg7xl45106
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@10 {
+            compatible = "dlg,slg7xl45106";
+            reg = <0x10>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+...
-- 
2.17.1


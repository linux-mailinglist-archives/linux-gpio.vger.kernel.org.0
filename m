Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E402B0AFD
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgKLRMt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:12:49 -0500
Received: from mail-bn8nam11on2067.outbound.protection.outlook.com ([40.107.236.67]:64992
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725903AbgKLRMs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:12:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxHKLlfvAvby4XtgWYY2JttGKj1JRiqh56DjAaFUIQWW4bm33JmuuQcqAzv/GFk1yWtOukJgvjn7U6NCADJriInEEuaTIpzZJo4FrBG+2sFocOMx2eiG3mE+ZUIO491dbmWhcn4pmWnDMtp8YrHahcb2A0xPWHrtC1H9sPJb4vUjuY72Zws7Wv84tug7t7bsl1KT5xYRkHckBWoNoBJnWDxbIIZnm7lWcMlo6nVEL/J5hejJa1/UGGbj1bI9TnWNJddVKWFZdbBgS1qvKiHwD95Vkcf588JW9CFO1dkOsVoItJl8jg/xziNhhSPiCj1J8HTEyIZYDK/yhkcyi0oHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6Ib33SRX/B4fBWqo65qV2e0rmTlqwRCZERcGvLvBgo=;
 b=jEREuoO81qWKTER3Vggip3ELkuCvwwy2qXrhQsnaJVWOb3y/v/klLHW3tN+6o5rpRJ92M1Hw5JjLyjA1qgBJHI9a40ChvtBYK+xd79tJodYYF05g39b9FjxPRRWwanP7/P13+9pmkyrthyfV7EKA3Qg1kyMg2jwAEv3malBYqJWNPd2SaoQsKpkz+rctmJmMdCn8zJ1mujn8UuJI9W8mndmCVRL4Mbx3SrA87q3+cGvKFcdoNhK9leC1H5FFseyJx8+V9ANFrSEBbLPMTiD3nVBgiR390uRfunMzhuzVKFNv42hmcgDMjzTqk2LayqaePSMhJZ74qpHfpd9Ymc+SKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6Ib33SRX/B4fBWqo65qV2e0rmTlqwRCZERcGvLvBgo=;
 b=fqTHAkRARwo97rJpL8KTrVgcKZ6FFJ44okQh5Bb3nD26nP0ykOYl5idwauaeEYlx38sERFDS6Ic4VzU1C7FhNarYgf+oy4sDjXKrFmwgfey0IAFwAIWCGpkYNcWhx2HNjn18NOIeiTfo3RxIEC+crANkCxFHeDEUmPNbZKxxtxE=
Received: from CY4PR21CA0025.namprd21.prod.outlook.com (2603:10b6:903:12b::11)
 by SN6PR02MB5456.namprd02.prod.outlook.com (2603:10b6:805:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Thu, 12 Nov
 2020 17:12:43 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::d0) by CY4PR21CA0025.outlook.office365.com
 (2603:10b6:903:12b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.9 via Frontend
 Transport; Thu, 12 Nov 2020 17:12:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:12:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:12:41 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:12:41 -0800
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
        id 1kdG9I-0005SG-5g; Thu, 12 Nov 2020 09:12:40 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 2/9] dt-bindings: gpio: gpio-xilinx: Add clk support to xilinx soft gpio IP
Date:   Thu, 12 Nov 2020 22:42:21 +0530
Message-ID: <1605201148-4508-3-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8acf7716-e0c9-4a8e-906d-08d8872e2b1e
X-MS-TrafficTypeDiagnostic: SN6PR02MB5456:
X-Microsoft-Antispam-PRVS: <SN6PR02MB545615EE8C3569E77544327DAFE70@SN6PR02MB5456.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZT/XtUMkzwc1byReJ8i/XI0Y1E9VsTEfN+mzVqXYp76UOSIbZ6yBIgN/nopnRH9xCP0+4WKDrH4eCp0lB3mtXIR1K1U8JDn/jnPlv1SioBkhxSnsttwmsfZxW8spOcUlFxHr4/D2bgbv2GHD0/nYkBW/Gi7yu4iXbUxq56LbV8OC2MhVAMOIEQrlc6kP98C3GmShPcORVDVO1tjryNC8TF5aASqlgX9MulVf43lPkwoCAslG3iCkUs+CyhtnlOSsrs9NWtFtmvYxU/yMieMsOfAQMVh7jiDuhdtJdVVAlxccnqdtV5F1rUnRGgvQODwLX+111NT6cpeNBLXsKaI16e9m7ova+faoREgM58+AxytqEtsAYAXquLlJr2pKlibmhQqajoaF/bo6yZkpAUEkT3lOe1T3yTrEZ9nrrn1GKA=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(478600001)(36906005)(26005)(82310400003)(316002)(4326008)(107886003)(54906003)(2906002)(2616005)(82740400003)(7636003)(44832011)(47076004)(186003)(356005)(36756003)(9786002)(110136005)(7696005)(8676002)(83380400001)(426003)(5660300002)(70586007)(336012)(70206006)(6666004)(8936002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:12:43.3974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acf7716-e0c9-4a8e-906d-08d8872e2b1e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5456
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Specify clock property in binding.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V3:
-Created new patch for dt-bindings.
---
 Documentation/devicetree/bindings/gpio/gpio-xilinx.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
index 08eed2335db0..e506f30e1a95 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
@@ -13,6 +13,7 @@ Required properties:
 - gpio-controller : Marks the device node as a GPIO controller.
 
 Optional properties:
+- clocks : Input clock specifier. Refer to common clock bindings.
 - interrupts : Interrupt mapping for GPIO IRQ.
 - xlnx,all-inputs : if n-th bit is setup, GPIO-n is input
 - xlnx,dout-default : if n-th bit is 1, GPIO-n default value is 1
@@ -29,6 +30,7 @@ Example:
 gpio: gpio@40000000 {
 	#gpio-cells = <2>;
 	compatible = "xlnx,xps-gpio-1.00.a";
+	clocks = <&clkc25>;
 	gpio-controller ;
 	interrupt-parent = <&microblaze_0_intc>;
 	interrupts = < 6 2 >;
-- 
2.7.4


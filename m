Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5D628EBD4
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 06:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgJOEAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 00:00:07 -0400
Received: from mail-mw2nam10on2060.outbound.protection.outlook.com ([40.107.94.60]:43553
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726185AbgJOEAH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 00:00:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC9ckWypBu2zpjPkzyLiFlUuOOB2vBCGYQ7epa1ZknrLdi7iRQ4vbaVZ7CcRFmr8ifvPVWkMRKAwwdwAQtyhRPPRpWr12UZRE6w6AviB6qICWONHst+F796boeqXvex+/kNgJ9gTDsHo2dMx4Em8ZiQgdQ8R6pIfQfnD23Tet3wypPcCHYDgrIUVT4dHWpswgDddiifQM1EjHY25Kg0LVI2LHCyR569slWb1KTyoI76bW15twkaKjcI3F0hKlGwRJhYFB4hcfnA2Fz5tVKKhk5SQou9c7lon1SZE50Yy72SJa93ozzIcXQbC9531f5yhsMu086cVXkTCUCDPv902CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4H0h1E3/uRPKRWfP2FwQPtgzlqcD9/TQF3AvUk1y6c=;
 b=KMNEQzIjV2YgKsRqOpR8ANGWY6ET3nf9MbsykmT/ACKm8dgm6U+8vQfhZ9YtRu2UNghE784DROJXbX88lVyKuQF4SL2WucocZdsPyFQZ3J+02xtgvV/uR0vDMAKWW4FkMNy2mrCXh32u6M5eQzyUxQtYyW62d1LjCms88RVo/J2LzscAvu2tRDNuqLKreXR5wwnn+pNITDluEspg+ANTH6T343pktyFrbhcmTZDQ7zURmoffZCMJW03RzlFMEmdbYj0LNSDEf2aq9FvlJyWQLVg83gqSOL9RgC9uSfxnAyUeoPSxywXZCV8aUd/Qe5esxJ8tSVOIrxwpunV1+wbNyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4H0h1E3/uRPKRWfP2FwQPtgzlqcD9/TQF3AvUk1y6c=;
 b=JY2uJm8mpZIGW/vi0gbs4L15i2LOJJtGls/coR4VVuxjKpvmu4yy0C8jzroloA0BVztGt4Puj01Qx5tQWO1s7S9W7KURrLTgpli8XP3NElkZVNZJqMovvAcs4JNR/CpHBDbjMZZvQlCLnUO73wB2eyeii0KjiXjU05ggvVfmFXg=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 04:00:04 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 04:00:04 +0000
Date:   Thu, 15 Oct 2020 11:56:27 +0800
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/8] ARM: dts: socfpga: Remove compatible string from dw apb
 gpio port
Message-ID: <20201015115627.13e4727e@xhacker.debian>
In-Reply-To: <20201015115524.24e3c36b@xhacker.debian>
References: <20201015115524.24e3c36b@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.15]
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 04:00:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3424804-c46d-4db9-62ed-08d870becc25
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB45555C043D6CE184EE725F2FED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +LSwd73g1lf+vQeGYY/vl6L2empvpBS2PApONNDA8FX9mXWl/xgZ7pNLVXxNZPJB7WEzgHyh3EZwnqXQICaMPVRgWEuYFSGVBHlPxLQuvybrQQcojq1F3PjRUWCNq+busgyWl4/GZLv1y6lWUkk8W0GbyM0taBYqdodgbZDMLFZfpI/2VGNsxp8CfR29gOhSRmIAjVLPetV/9Ghap8/vQveV2evmWar61CXUpw977Qu/VA/VAxqmtA3PpHDGrij7vFL0xQeuLyQb/1BKrIeZIPYRCi5f0nvCAT1/9h3E7Cr0IFjaW2NPyOvKMb1l6zTzK3S7mHiJ33UhS2g3yf8YjUR+JzRMPXpLOl0MQwOdcBd/8N11okFvQGQM2TDnW0ZRj4wWypOxGXMIcpE/kCn1VA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6Aik47Oz9qv6xjc4N7htHwmVCuxdpPMWFnjLhT+J1frfiDTc/ob6vM+RwTkK6a9j4Ep1auAzzUj20HBGg2GBHH+ijr3teapRJqNwl6pzbZKIz5KL7zVxBU7t7J1pjH2P/qvi5hiQoFb0HUZDj2c86kHP5C8G18fnUCSSmXtyVYDdG+k64DVTUSFHT7PY0uIi7WDEyh6LAJ6a3mB/Em6KBBiZxnb/y4aoG1VZjUkxaMKyfNZfQxS6SEbJLF21KdSIiWPcfhaRQUU+nG5Ias6HvzZgpRj84X8oTI39B7yHQCPDOk734gnQdWdlM08khj5jecZEDvP5iVbTBMg/d+34fVQ/i1N6HSvlA3hpmuVE5clF/FZGevm4J+v6jMMaoeN3UjQhi+04xaQ/+WRCIZ0YT2budLSJDaBgxDrymDuTOnyESlxb5o7wDT4Nh43Y/mA24ixEpM07Vr6MG2vYeMLSi6WNuRHELYLofOXr6riKJ8Z6+o4tCYf7VP8qtCD3NEegwQon7QwuT7aVjUjN4ls3Br8cW2RlUABltxBRTTejvK7sDRI2QljSuJ6ehoMUY851bI/pf3zbxpFPQ6EB+Aga75SnajknOUck/rj6n0Q2Sks2q8kN8xN7WUD35w+6yjRHXH6jBszffA5V64dKCxH8Mg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3424804-c46d-4db9-62ed-08d870becc25
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 04:00:04.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/enB6RQA+yYo17bhZTkaCViwiXLj0EclwnjmHgOuLUmkTPePIJH2Nq0iVt3mR+XAFLaRbApaJGxy+EaqOxIog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The compatible string is never used.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arm/boot/dts/socfpga.dtsi                    | 3 ---
 arch/arm/boot/dts/socfpga_arria10.dtsi            | 3 ---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 --
 3 files changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 0b021eef0b53..2c06f1fa3d26 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -609,7 +609,6 @@ gpio0: gpio@ff708000 {
 			status = "disabled";
 
 			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <29>;
@@ -630,7 +629,6 @@ gpio1: gpio@ff709000 {
 			status = "disabled";
 
 			portb: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <29>;
@@ -651,7 +649,6 @@ gpio2: gpio@ff70a000 {
 			status = "disabled";
 
 			portc: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <27>;
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 0013ec3463c4..a52132d3c62f 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -488,7 +488,6 @@ gpio0: gpio@ffc02900 {
 			status = "disabled";
 
 			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <29>;
@@ -508,7 +507,6 @@ gpio1: gpio@ffc02a00 {
 			status = "disabled";
 
 			portb: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <29>;
@@ -528,7 +526,6 @@ gpio2: gpio@ffc02b00 {
 			status = "disabled";
 
 			portc: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <27>;
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index a6fb01c7ab34..5da1a69d6e1d 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -200,7 +200,6 @@ gpio0: gpio@ffc03200 {
 			status = "disabled";
 
 			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <24>;
@@ -220,7 +219,6 @@ gpio1: gpio@ffc03300 {
 			status = "disabled";
 
 			portb: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <24>;
-- 
2.28.0


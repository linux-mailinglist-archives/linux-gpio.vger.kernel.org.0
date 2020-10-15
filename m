Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BAF28EBDA
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 06:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgJOEAZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 00:00:25 -0400
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com ([40.107.94.67]:23650
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726376AbgJOEAZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 00:00:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR+qPZjcUZoZ/fB0n6G/PTm+Ymrg0r88V0PxATc8xO0o/hHuQ2SPjOlt2Rr5K5/gLEnTzcW4fnIBFhdKjuCo9ClQTObtqXxMq/rOT1sgFDJjwycVlG2Hpcdg7gidhnewRaLmrgwnK1B3AOctqE0lY//Oj02RfHL3HIm5if7Bf6wDOzme3LDf4p1dhqAS+/SMLIXIrzucLA1RLrZCMt0R7M4GCAAG4NbRHf4yr6B+eqQo7HzyuFxoAPdSyYU84p7uvIc9HH/8yByle12+rou7Go1zVZtTNgwvYlPcl3XJlca9mjGp1n5pKxAUg3Tdgasvb4+gPLj2rMfMFb1fUFK/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wq2/M9iZQceQHc2fSaHBPknKf8f10Z0Spe9SYMyoCY=;
 b=b4brxj6irPYtQge9oAtZK3ZObbIYkqdKjAD3p7GmvrFFaqrR5jmffbjRhUpojabei3U22UZrB1mue177WWDqf0CDtdjqyTxM25nHInjBE5tycK2Rhr4uEfLyS3j8WOEkjg+pFeF8BwFT8XtcVhnVb+WagwA+4tIweG83TWy9/hq0ggjrEVvPFuHZt2UAQap8bSWGfBWfHeP7pkk0WYmZOSRdLcX7zCkNXd6lJke5JwXRYaZLFSLhFP9MhIJKz6zce69s6cZS4WIIgExTTSslyMvAZfA6OXVNX6Yekd51DrSPBhizR4isrPQwIA6VCp3ohXQ86W6NnzWUx1ziuEjAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wq2/M9iZQceQHc2fSaHBPknKf8f10Z0Spe9SYMyoCY=;
 b=QhX6fp5+evjeb7fUhCSoTKNuFWyMsLyJm03aanYlPO/ZJY/sRK/o5YbyUl0lmvQwInC8l8gRgWbAv+JbnkTxvVnBZC51hB70QTSjF+bxINrc4hrs1QPu3YsID6/jZ43o7+7BWhl3Y55uyDgW8EhCqr0BcnF+aYHNxOhdo6qX5P8=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 04:00:23 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 04:00:23 +0000
Date:   Thu, 15 Oct 2020 11:56:03 +0800
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
Subject: [PATCH 1/8] ARM: dts: berlin: Remove compatible string from dw apb
 gpio port
Message-ID: <20201015115603.71a91be9@xhacker.debian>
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
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 04:00:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eb9c124-0fb1-483e-5e2a-08d870bed753
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4555A8FFB1EA99616AE3654BED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZb8v/rNI4pGXtys6tlU9BTJv6+N5XIXMf6mbtJ0jKL7+9svEYKXgkfeMV8yOPsSEXTvCXslHpX2yGuorOlp7EFPL/MZpOikwlbXX7CAYWdVdQSVCeSh2wec1z6zjCljsnz5wITGJbOc532PZzyc/tbAsLSnaVlEYZfWC+j6/9whxFbMvKfk7/H+JKojMtfEqYAfkm5mBYYA8us+QlIx591qVNKezBRptzVPuzdTjWQlXhW7a0zx4XrodY2SRE+caqMAGZdGbCvbOYuippI2nhEtLHKR17Z6HcNpIeFuzMgnYGGOO/p6RImyXj83oNts/0+oOYAEJzz5ZUfOqzJxK8J/c2wiaDPuePGmHK1G57mlklRr6cX3JW3Nf8iJdcLNXnTQScLcP7siuLWhIUJMkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: tSELHVuIkTIlSztU//kYW7vZnX24FpwMvE5ZtnEON0mgWFktfygv96kt6xJfFTvskG18dxEpIg1DXVioG+bPsn+hBRKlXJXiFvS3cso8i1N5g8icJSDjK4B7fTD0d8A9FPz8HKnb1INDtw44XHgYS/1sdzjPHYjMdgsR1yxGJphyCSBDO0Pzz7AgVux5tFEE24rIFLXHuUIwNHFYGIkRyAnReF7Jq47jjLPpwb+X2Scsx5K+xeYHHyXt1a0w2yCNSdd24jEHZfkQ7dKxKyUMf2wD3xkvqYT7hmJp8tOYdpPi4PwvmSfHG6YDhbj3DwgtrWoW4ZHC9cjAY8c75NDY5gh1HocX0dgntEw4uTkgyAakIyJ6S6MNzycH8+NNKAhftPJG82WQkUtO/QZeWc4GFxCZevbD4zFoFHicExSvYXlBAQp9UtDhzbWHSUwsGD4qy1VKxNdNg6JBbJmlXkGOmrwPvYFdbjOffmfY0+p4w5RFt8+kCV5EHNkIGuitUQWiPKFDYOonWqkPL/wLiUplYS8oEsarDtWNOa+cAT26HbFUUIkXC1hqNzglx7kDUCkSJjjq3u4Q6SG37cvnQ96r3StPwj+FaRpfcEYjqmUukPf/cIYR1XEJHGyD3ILzQIQxTqOdundfq1+Hw/RDW70/wg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb9c124-0fb1-483e-5e2a-08d870bed753
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 04:00:23.5145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kx5ALEZmW/GZ1zqEa6+IzAeXjS4+5acHVx/I5zb+UmSnmhBE/nOoEwdllooGwBRXlEfEJTatpOp2cF/nvFdaOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The compatible string is never used.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arm/boot/dts/berlin2.dtsi   | 6 ------
 arch/arm/boot/dts/berlin2cd.dtsi | 6 ------
 arch/arm/boot/dts/berlin2q.dtsi  | 6 ------
 3 files changed, 18 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2.dtsi
index 6194857f8a02..02c9b8b5b633 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -188,7 +188,6 @@ gpio0: gpio@400 {
 				#size-cells = <0>;
 
 				porta: gpio-port@0 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -206,7 +205,6 @@ gpio1: gpio@800 {
 				#size-cells = <0>;
 
 				portb: gpio-port@1 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -224,7 +222,6 @@ gpio2: gpio@c00 {
 				#size-cells = <0>;
 
 				portc: gpio-port@2 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -242,7 +239,6 @@ gpio3: gpio@1000 {
 				#size-cells = <0>;
 
 				portd: gpio-port@3 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -443,7 +439,6 @@ sm_gpio1: gpio@5000 {
 				#size-cells = <0>;
 
 				portf: gpio-port@5 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -458,7 +453,6 @@ sm_gpio0: gpio@c000 {
 				#size-cells = <0>;
 
 				porte: gpio-port@4 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berlin2cd.dtsi
index 6f30d7eb3b41..f7698ab97abf 100644
--- a/arch/arm/boot/dts/berlin2cd.dtsi
+++ b/arch/arm/boot/dts/berlin2cd.dtsi
@@ -178,7 +178,6 @@ gpio0: gpio@400 {
 				#size-cells = <0>;
 
 				porta: gpio-port@0 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -196,7 +195,6 @@ gpio1: gpio@800 {
 				#size-cells = <0>;
 
 				portb: gpio-port@1 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -214,7 +212,6 @@ gpio2: gpio@c00 {
 				#size-cells = <0>;
 
 				portc: gpio-port@2 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -232,7 +229,6 @@ gpio3: gpio@1000 {
 				#size-cells = <0>;
 
 				portd: gpio-port@3 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -470,7 +466,6 @@ sm_gpio1: gpio@5000 {
 				#size-cells = <0>;
 
 				portf: gpio-port@5 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
@@ -515,7 +510,6 @@ sm_gpio0: gpio@c000 {
 				#size-cells = <0>;
 
 				porte: gpio-port@4 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <8>;
diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index b6a0acac6836..831505b47e27 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -249,7 +249,6 @@ gpio0: gpio@400 {
 				#size-cells = <0>;
 
 				porta: gpio-port@0 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -267,7 +266,6 @@ gpio1: gpio@800 {
 				#size-cells = <0>;
 
 				portb: gpio-port@1 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -285,7 +283,6 @@ gpio2: gpio@c00 {
 				#size-cells = <0>;
 
 				portc: gpio-port@2 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -303,7 +300,6 @@ gpio3: gpio@1000 {
 				#size-cells = <0>;
 
 				portd: gpio-port@3 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -549,7 +545,6 @@ sm_gpio1: gpio@5000 {
 				#size-cells = <0>;
 
 				portf: gpio-port@5 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -610,7 +605,6 @@ sm_gpio0: gpio@c000 {
 				#size-cells = <0>;
 
 				porte: gpio-port@4 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
-- 
2.28.0


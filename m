Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8C228EBCE
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 06:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387837AbgJOEAA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 00:00:00 -0400
Received: from mail-dm6nam11on2071.outbound.protection.outlook.com ([40.107.223.71]:58593
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387819AbgJOEAA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 00:00:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWU19+LRCM8ByWFO1YpF5S75v1vTCQCdhiMW8qQBfro0aUe0W+N0yCrWedeqFb/IIyC5y3KRRaY9trbDW077rhwX4LPuhDFtd2mrsNSzVZ+SiinwuXE1h9Ty1YcEjkyf4HagD2iYmQXkPW00mdu7dNv4ScQOym7sPRhqz6KSBK0ObCHjhfswD/vB1LukQQNnurGYEfSs2GFCP8a2psGalf1wAluPZ4fxnnxab79jKIg7x6lgQAKPdGl4U1kXcZ4aOjwgE+0FVGgumGIvHHUi0iybJuzQPKqSUD4LrTr5V0s2SL/RJKxI8xu4a4/1DJc5VJeSyTqu3Wzk3nH6Qqk1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2n9Bini7M/+g0J9BaTZNiXBSxr+OiIwGsN/4y2PEuB4=;
 b=S02nlcftk6jQv1yjNDkXAiT6csKZjoNjZs14vwB9/6zaPKF0zwPplicWKyhOtnjrxYxQayajNIQm4/mQD4yLHffBI96ralayKGEyq8Vcl79XbPDfoQxg4DF29mljuO+y5zdPnuTqZ8HYZmr3laz5zGUfgnYmLdqTIvM7p3ktuSSCpU1cpgasSASgK5JHqHX0q5+TCoCZ9xbp1IlpdeUEW6rrPO9HklvngZfu6pu9sxb0okO/GRjMMRJq6HfNAJUz+WZX+O0AbhedrwCMcfpXXxNf1KgpaY3Laq/NpiZGfAm95RaBm+cwlj5zeK5ms5JLDmWcJYKdazjqOfAkS05ncg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2n9Bini7M/+g0J9BaTZNiXBSxr+OiIwGsN/4y2PEuB4=;
 b=mgAJvkhyuJ1EdlE06rQhq9fi71lHT6WVlw41v0cML1Z/qMcAqR90WjxTvYSBycLv764TnCAiFZn47uGxwPZR1OIMPM1OqnB56wD4trpqgoVqdAoVSvnIXawpQB0Z1SlC06uCPhS1qNiBMq5yCQ0qMFdAvLVtl9Q+u7XnVb/6JTk=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 03:59:57 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 03:59:57 +0000
Date:   Thu, 15 Oct 2020 11:58:31 +0800
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
Subject: [PATCH 7/8] arm64: dts: synaptics: Remove compatible string from dw
 apb gpio port
Message-ID: <20201015115831.1f2727e3@xhacker.debian>
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
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 03:59:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 075a6c6a-097f-4401-fda6-08d870bec79e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB45556BBAC3D505BAF378DEC8ED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFb0jUKZls7llqs11Sjk43KRZdA4GeamEMqvSTR4Z/M+NXi6qfyE39HCIOc3X0cxQlxSMrJXvO9cEqn2Qr20cW7q7CDXx/1aTxEmCsIUHsQezdjERWClnzd94ihab9ryOLxMLceAHdw0PwcLgQJKn3bBLQXAWjCziyYmxwLK78XSTdCTvLLpK5NB7DOOPa2Dswdf1xbYBpkr4bleACqHrLg3hIhCAwUVdDs2dtjlNGpAufj6Rt4dXe6+2TKFHn1sCxeZ8EdlCqv5TZMSTVAe1xoDX5WeJL8mWoIqvJEF2d83kWo5rfqvQ0XbZirLp9VtoXW+8cG/MjiB45dgYBQQn8odvYPs3eRzycG5WHAYLkSUrMuoTTKfUdbD+c/80n86IH+qY3FQa+huSuWbv0TC2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0OVXOXdMeRsDy3oFc9HNt0jk/H/jupZ07lExZOk4tjvP8aoYWKMxwYoEgtsCOz6YWBEVhmNKVzso0OOewXcD26sqADbCpEUxbW8m7l63lFL/uwaR9IAeIvQl4e7vAa+S94kPv0L076uV1EgZES1CAwEh6UPpM8eY86NrfGlIdJP5IBJHq2JysrII+/jMGkEgzR1wd7P/t1EM7g/HHyJ2pgY+TgxzdkpmN6N72QzTqLMtdkT79uZM+dIxZ8+DybjjwCzxTM4ZmW85Iizy4WKRO3MH/curUSX/qg6VKa0F8DFyFXC2ZXmWpy4lLTIdKY71Y6BKsgBH56Ofns/+9xCCoKb1+jfBKreoW0JyExua0+UDMg8Y0WGWd2WyHmD/dGZ5OT6sSVlXl3JxhpjxHNNvX+ZiczCrwgYrlzWDzxEndnRSBkZi7fAM8Qym4o55mrppI1+rGnP0fUGA5xyBPgfTe4CHm2Mrqpc03O0+iGrLkdaKflJtZ+mXCnpXkZA2H1ipFjf3AzHZmhgLWik6D0YDcmWtvRWjDGkTzX7FbW9KAF2u/9sTWjg0MqdPsapZG7BOxc2dQulm3tRF559B8vonNwYjCWkhZVNO59y3RJp9dnbHOVf18e0sf6Uhh22GjFj98Rn2tK63+WXOGJJpSvmyCQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075a6c6a-097f-4401-fda6-08d870bec79e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 03:59:57.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGgaHoPlk/4vX0boeDLtO5frbz46EWZaGkz7h771eZ/hgHBfd3crx7NK3NagIEEoKLMOQR3V/ypoyBvkl0ey0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The compatible string is never used.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arm64/boot/dts/synaptics/as370.dtsi     | 2 --
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/synaptics/as370.dtsi b/arch/arm64/boot/dts/synaptics/as370.dtsi
index addeb0efc616..f29b21f930b9 100644
--- a/arch/arm64/boot/dts/synaptics/as370.dtsi
+++ b/arch/arm64/boot/dts/synaptics/as370.dtsi
@@ -140,7 +140,6 @@ gpio0: gpio@1800 {
 				#size-cells = <0>;
 
 				porta: gpio-port@0 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -158,7 +157,6 @@ gpio1: gpio@2000 {
 				#size-cells = <0>;
 
 				portb: gpio-port@1 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
diff --git a/arch/arm64/boot/dts/synaptics/berlin4ct.dtsi b/arch/arm64/boot/dts/synaptics/berlin4ct.dtsi
index 15625b99e336..4b563c0e015e 100644
--- a/arch/arm64/boot/dts/synaptics/berlin4ct.dtsi
+++ b/arch/arm64/boot/dts/synaptics/berlin4ct.dtsi
@@ -137,7 +137,6 @@ gpio0: gpio@400 {
 				#size-cells = <0>;
 
 				porta: gpio-port@0 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -155,7 +154,6 @@ gpio1: gpio@800 {
 				#size-cells = <0>;
 
 				portb: gpio-port@1 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -173,7 +171,6 @@ gpio2: gpio@c00 {
 				#size-cells = <0>;
 
 				portc: gpio-port@2 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -191,7 +188,6 @@ gpio3: gpio@1000 {
 				#size-cells = <0>;
 
 				portd: gpio-port@3 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -266,7 +262,6 @@ sm_gpio0: gpio@8000 {
 				#size-cells = <0>;
 
 				porte: gpio-port@4 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
@@ -281,7 +276,6 @@ sm_gpio1: gpio@9000 {
 				#size-cells = <0>;
 
 				portf: gpio-port@5 {
-					compatible = "snps,dw-apb-gpio-port";
 					gpio-controller;
 					#gpio-cells = <2>;
 					snps,nr-gpios = <32>;
-- 
2.28.0


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4097828EBC2
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 05:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730434AbgJOD70 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 23:59:26 -0400
Received: from mail-dm6nam11on2057.outbound.protection.outlook.com ([40.107.223.57]:30177
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727281AbgJOD70 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 23:59:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYA9puNdm8kntT4l4LJ9afTfbPDl+WsgvFfkXNjmhJKXlGLeD1Gcqu8AmtgxpenYk+y8TSR8oFEW2QV/Hdhf7up//ELbekSiAiiRDl0yg3e2VtVG9/hdrsPB6r0NKr8al8IjC9gzbNmGhXOnYYZAw/zD6Y4Tqh9A7g/PQ3Wunk3hOzuHQv9HnvdSPgpqZ+fSc4QZPHJgsTMKp1/kQsTvHeaSuqFyScUVuQ6c2KnNxwcW+9rVdBICmcKJdu/ChpElibMQnjYSW1+52bl7GM9mETn8umaEeucQebCjAZ/kvOjVvNp9t8aFMU1fVj0QcQZulSvrCowyJMePh1sTDha7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB/TuMFupwRIsYPMv03KQQ5TKzXiDsGdV31QbOnXCaM=;
 b=c416B7EEJxFWRbGmoVwDy83fKrQ7dHFYcvSWPjN0Qi7knXtjtbbwaM5TABaDvL4HhRDgQwoy1IYE1wtiSpP7A6yC6fJAFuqhhoh3yaPnd5vT7u7hEz3BqxB3cCk2Ib4W1a3H4wpHBBUXJTwCz0YUDCkbTi8DH2tKAuc55r8BbRscX/2PtvxD38WO/LS8pt3vADqXioe4aJf/E4sM9rY8Q0iUGGs1gweQdP7A7Kq98GFK3vXU+9OY/D+YYobES4xIFcQ3XhJGBwx07WSt5nhB0l8w14A0lFpwG8eJn5UsA9gFqhQdV6B5G59Fl6tJOZOrrOUXldG+m17k6IhxUVZzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB/TuMFupwRIsYPMv03KQQ5TKzXiDsGdV31QbOnXCaM=;
 b=mOho6ayP8E+3jW2hKpPt41qUD3weBdlUojwg/5kh4+/A1cyS/IVirOI4KWZGVx3FxQKr6btF1t05s1sbfvt6mUbSYzZln/Ji00Ky5gPho9cltkqwJzxHit2dbwueREwuaelQwqs3VtgncLwrmQSHFIyyhPCLbXXheHN0zv3uFeY=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 03:59:24 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 03:59:24 +0000
Date:   Thu, 15 Oct 2020 11:57:21 +0800
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
Subject: [PATCH 4/8] arm64: dts: bitmain: Remove compatible string from dw
 apb gpio port
Message-ID: <20201015115721.6d895509@xhacker.debian>
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
Received: from xhacker.debian (192.147.44.15) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.6 via Frontend Transport; Thu, 15 Oct 2020 03:59:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b84ccba-80fd-4ac4-b287-08d870beb3d3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4555:
X-Microsoft-Antispam-PRVS: <DM6PR03MB45558322656B8B332D83E302ED020@DM6PR03MB4555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 20eoX44gOkQx8mcy+JmZjLxQWeuPqJwFD1ulwJWnwn5pr9+FzhdKKc4M80sgzxdw7ONDn0y8ZXyDt8xojTSL8qJhL5YXk3zL/m2aprgi+1xiuzqOr8jTwygHmnV7rz0aRKV8RpxW5D5vo7nbOOOE0mVSAwKkYqxYRNgjAlI1MNzU/qFSAIGayzKVYkWG1cmRHFjFv1sik6mPdjbSsF8TAsfn81khWDH7yOHvNep7AbAnO6uLFpnyIvX3ySjSCHJEaD32vrk4m+Cf0HnlV5jeIGEamtSW0eZiNF5aHmJRgoo/bycoVpX6Q9aupw3lbPAkFm1GCEMEbV1osD/UyVQByunigcy87/F1EHDFxPdjx+KiPboCG4J16XKeRILMk4ezD8eaa61OY4yJqH+JkUMiMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(83380400001)(4326008)(316002)(1076003)(7696005)(478600001)(52116002)(110136005)(55016002)(86362001)(2906002)(26005)(66556008)(7416002)(8676002)(6666004)(66946007)(186003)(16526019)(956004)(6506007)(9686003)(5660300002)(8936002)(34490700002)(66476007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NW/Vuw9jJmpzkq4xvUn7YC4yIrbi/clTEmK4xKPS0ij3o27KdJj90wmoR6z0MaKU8RrphlU8nVshXrEQf8YxHYsSr0zwV1NOQGAnDqOhbNruqm8jNcONQ+BFbqLXphcbBXJ8D04c1EzoxBrDoGBzce2ndGY5iS37RFhcV8ZfxZfTTmD568CKCH4DpETjM6p6+EZ8YHqA31wgDXTBLeavZLnfi1NcR+2A4q/mqZ1TfAEfT7HuzZppX8V1H8ICvbt+hj8+5vqA4qcNVEYqJ3u+pnKPLqvHSDv+YMK9mwOr7+wlVg8cv8lriXgLrrWaJb94dfZgkVLh9hB0rIdVtgGlByOyCcpQY3x1wP0a/C0X2E88TbadS8FzvoiEiYYs7pTRnesSj2Zffkmqkm7lMHI2orP/JhR0bl3P5M0sB3AVVW7tW71zVefsTj4cDaTP/re/iSp2KoDughneY3CgkpylMJaRs36KjftP+mpJzbepXWDTt/imghTSv8qVri7a8YX2GzGHzbQ2c55TlsZThyHOq5kXIvqGOXRvlL+wDI70CaiFUReNUXZOH39pDAPu7NF2yI3ICiPgAp6pAzPuHKGNKfSHOLut4b5aQIwm1nNiMlrenA7q3XsN+6Gpfhf6egaZpPuFWf5HdXg6QCCqdzMnvw==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b84ccba-80fd-4ac4-b287-08d870beb3d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 03:59:24.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DqQLVjc+XYpKimpMemu1JBB/SNkTFIIA5iIDOS74ZeDe0KlNW/ipwPtgJ1TJZHMeYzG87YaMjPf078FaqC5Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4555
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The compatible string is never used.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index fa6e6905f588..f80373358bba 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -124,7 +124,6 @@ gpio0: gpio@50027000 {
 			reg = <0x0 0x50027000 0x0 0x400>;
 
 			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
@@ -142,7 +141,6 @@ gpio1: gpio@50027400 {
 			reg = <0x0 0x50027400 0x0 0x400>;
 
 			portb: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
@@ -160,7 +158,6 @@ gpio2: gpio@50027800 {
 			reg = <0x0 0x50027800 0x0 0x400>;
 
 			portc: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <8>;
-- 
2.28.0


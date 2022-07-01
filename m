Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBE6562857
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiGABgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiGABgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:36:55 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142215C942;
        Thu, 30 Jun 2022 18:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTmDKQluBPQODI9D43BGeSGXihIbcHUeEh9Bxhm1WX8N6IUGesIzM6E2np0HTwrTE8vv9CH8U7M87Zyn6tPKUTI96ynx4odFLPZtIb6hXms76QYEic5jGexo/ffBM5MFe7JvKRTEgS8/fmsqpWRgjveuEdnmpiZ/gdYbt7+UKKMm3nLePh6GvQ8tRo95JQLqbLm0CxhPMg84szjOiLykCdut6uVa8OmvB5MOdGXRs+j3PKHfkCaMFQGXy6ccCUNOIcDZvOtQUb4G/r53Vti9DXaBpxa5J0c35E20Fs9GPWmAQiQdgVYl1Kit5RZFIVOaJgyJgAITmqxAU+zkJ0otmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33GmAdYosCQN/PfmkE3fnonpUjTa+9JdAsBKyQ/YmHA=;
 b=k9tLLeL8whvzWGxyXSYGvyTD7L0Oxb2mIIPAY/ZFf55jZGxNTV2BvODgl57EF3mlgWT31p92z0t432945l6u4+S8aFw+UUNriVcnjZh1uS8IfL9+g3ZeuAHv5APFcjQqfQywmsGXaOp+69adqJxxIIL3L+nDhEtElesqioa4IB9GNbf9iXd4lf1AFnT83WpUbQICsYX3KzLQsl6r+J3xlBDf773o1SK3KQuszMao25rLbmAcxwFK6VrFGY/6/62fDKMtKGvHMzNLyXWxpe/bPpiGZzNNxNdNlUFn7r6lzXj0PG3B9/OHSzi20s1WGpODymN29nqdvRUNAKZUTUnFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33GmAdYosCQN/PfmkE3fnonpUjTa+9JdAsBKyQ/YmHA=;
 b=f2CTm0mMUMssrlqYG9+i7R/m/c0jHpG4gvjmOV9YOE/c2R09U39IE6fVmxA7A05Xx6nSBCFSWfIRs7GNE47lVrL5Oo8sk4fY+ANn1ZP8Gfhg7mZDyAW/Wo7M+FKSYcCBzNEBTpn69caRHPayBDRz7MjOgYXg8DuLcIHwMDuVvMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB4567.jpnprd01.prod.outlook.com (2603:1096:604:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 01:36:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:36:51 +0000
Message-ID: <87a69ttxzg.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 05/23] pinctrl: renesas: r8a779g0: fixup MODSEL8
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
In-Reply-To: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com>
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 1 Jul 2022 01:36:51 +0000
X-ClientProxiedBy: TYAPR01CA0224.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9a41034-07f8-4927-89fc-08da5b022c44
X-MS-TrafficTypeDiagnostic: OSBPR01MB4567:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CtdevYFYxIdtyPc/719bkDX/Vi4u60jp/2vs9ODOaE2UF3GZDNaaFerft8ii/5WwcYXobVnq7PwDZX1MTrr0ukZ7ew+6J439w1ceZsz1dqvj4/IwW2t5BlxOSuR1ptUqBWYntktyx3NxfwMuZSvGyxJZSVZwqp8a1hTqHcc+eUh4yibl0kItvlogiwrzSB3M5VlBLWE8xj1r2wkpbwk5C24MSVmLXfZMsveT2foLDH712gFoTKcoUeAghN9w4L8UYjeWGbRoCeibxW1WWCOr2Il5+7nO+eIXS8vwUS+L2J9MXbFBV0jO4q2O+B/1M/scDDU1fnIKfbPHaYslAb984FdhYwU8k6xnCaynYYCy/LUIT0kuoO1CrvSWYut1IIP8PNTktb+V+8InyW5wzIH29ODqNAS+URRtWq/VYg+5BEWpGynePhvOTVzOLGULlKQ72EXA9/MYcVvcz5cvB3Oh6pDSXeT+LOTHdxZVAs9utEi98weuL2/rM9/hQG9V7x5062tKfzTMayRdj1HPpXO9BxMR5+OyeoJO5tlP3kkujczOyCxecuniiRARcQIssQIsjF8DhaQwhRDmIb5DIKt4CHVZdKKtlChIMb9Kns/lJE37ivAmCB1MBTjU8RDJ3VZrZLewTAZu73F8hym43qPQ21TpUjPVfXNP3hGLR7/EKLkSsIkzahk9a83VylZgxsPWsRzP+L81lxMPT3Q4DwZ07k4XnOnWeH7ssAN8oLr5iRCu017a5qBbfvkYGBLFmMF4e+u2zp4uNmZk7nS6JaK/mlipfs7AEoZ22b+B/xMASkutvkMorVfoX6XMmq8yY5Sx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(110136005)(54906003)(38100700002)(38350700002)(186003)(2906002)(36756003)(478600001)(83380400001)(6486002)(66476007)(66556008)(8676002)(4326008)(86362001)(41300700001)(52116002)(26005)(2616005)(316002)(8936002)(6512007)(5660300002)(6506007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBwP5pOaRvDdefdq6fJns+b4FyTCuyCdHIAHK92pEz70SXd+MBGNlRG4DCEa?=
 =?us-ascii?Q?KCl0HZQPfI+rrdVRuocqERGmOW+YiLfTNwqd0FSyvFgTcKqFSo5pgGTyK/MP?=
 =?us-ascii?Q?HnphBEWML7kje3pg1RYWN/6NSKbkOBBZSKlG5RainQDJlrY7iojvGQAKu5uy?=
 =?us-ascii?Q?sR6eDi6WPjS2W3dltRsToGSQnh8BaR9sBqVTWpQ8jVYVl78rnQQ0Ai8BGl8T?=
 =?us-ascii?Q?agGVbho1l1v95Edb5U7I5SbGhD3RfRkAIUYBoMDLJ3jH2ZL5DC5N1FYotiV1?=
 =?us-ascii?Q?DzxPmPOMZu9H8Jfk/xPmkZFPlG5FbiRQpqadLNCDy/nCPiMtcvjMjW2EtSAi?=
 =?us-ascii?Q?oEjoZcrw8nSUHDsdiLxj9887E63ZnPFubD3O+CuvMSyqzYc5NH8e+mixbMRP?=
 =?us-ascii?Q?MlT957gCQkhbpoR7tP4ISN52tiA/Gut3tEC+I3Mc1NQkZrnk9T/ARKMRpAU0?=
 =?us-ascii?Q?pEjV+pARjL7iiMQmXcL586gzj26f1cQhSFF9UuA9/3N9V5GE7nPP8IpKf+4N?=
 =?us-ascii?Q?T9idinkSweTne6ROW9ym8Sk3Z514RosJ6v9XVy7aGYL+jtlZyafjqGpCozyb?=
 =?us-ascii?Q?JRax9Iu8yr2DG+Lyp/bPLVk9zPxVNXpP+drwOjy541rdKh6bGOWHWIrjW8cY?=
 =?us-ascii?Q?cS9/pvgfEj1udYRHRxSwLntdxVuMIWHQyW9JJPw612cBPYyApZlkb9nNp09p?=
 =?us-ascii?Q?G8Xs9GZ83SRLwWT9cam/T/mWFeE/powSVyf53c2p6vKYKC7yqlzUMdiYkQr+?=
 =?us-ascii?Q?oyfpz3e2i6KnirJ2JF075DvMk29pjz6StsjzDnqYK7zsTD3Zk3OECvanEJg+?=
 =?us-ascii?Q?OH3xUgj3jl77XI5zw9ppNMagM5BJcIXztGgmO8LipLAwhIsEroGxr7PGIh7s?=
 =?us-ascii?Q?otYwQI4pjIuEhXCimd+UPxVOUrcD3SpIgr7ij3N4HPtFbva/+I20zE+a3wpF?=
 =?us-ascii?Q?EBSzK4Hmie9JWhb8AYnBBjf6QB0ncoxDPfMIONnW6MvkQ3DpDBio1pVtmBbF?=
 =?us-ascii?Q?nKfr9Jl1UUAXmY61axY+xwBFmSLuyntuViAZMvbT5o7DTAxsSgTbv5qP+tPo?=
 =?us-ascii?Q?KO4OyauEiIuGq6wMJ/NJ/qOMPfiOOMsaST5RemLLDkojYgy/mwUekjNM8BTv?=
 =?us-ascii?Q?lz0zbmbGNXVbHUtaHos+dL/QxBfOS9pzPcNVy46sSJBPkLL4/ZCZe7vHAgv6?=
 =?us-ascii?Q?XN2n8gvfJczd/HxARR/okxh/gTuwUcty05db98DNA+T1/vgxG/a14iSotL+g?=
 =?us-ascii?Q?fNR7F2JwilEd1r72KOnuEVHEx0SE2ON/ekdNzIUmnl3eMHQZqfR7qc/NT+Ai?=
 =?us-ascii?Q?MMiNdq7T5Zci92/jppsrprHwjoS8np67IGdnS15mJZAH+VWzLhNQ2syCS7Yo?=
 =?us-ascii?Q?N3JL3m20krWSEtgrHS6IF14pWw+wWSt+CKT0xFjOn8nE8m21g+Wck2Qph0gY?=
 =?us-ascii?Q?exidagywBJPIROoFeR5O38sBmTEo+LnHWtwgQtU+oGTJgux87aM8PQr8STLh?=
 =?us-ascii?Q?eDRUQnSHm7a9FdWfmO7I1ecSJoDOIlv3ODT/LvR35hY6qhQfLi869tM5BvCd?=
 =?us-ascii?Q?eKwPPkspy7NmYrQm6RKdYqDuDXJUjba3QQq36rLuvEtuo4DHDzMRXatDZati?=
 =?us-ascii?Q?LNCItWr+VJqU//1YQEAVhNU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a41034-07f8-4927-89fc-08da5b022c44
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:36:51.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3sv3li/IVIVeThHDTKLcfVPo4Ny+UZ7ezWgYBnos/kF0tlIlawxlrFYiQYgvYpWMCFZlMSqynzMu0fZzx1sozF/TOY4Lx84/+MFNk4IJ41vVh43DBsywR+zuOGM1HI4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4567
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

MODSEL8 controls I2C vs GPIO modes, and Datasheet (Rev.0.51) is
indicating that I2C needs 1. But we should use 0 for all cases
in reality. New Datasheet should be updated.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 93b8810e8533..cb1cbe77ca7b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -1167,29 +1167,29 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP2SR7_19_16,	AVB0_MII_RX_DV),
 
 	/* IP0SR8 */
-	PINMUX_IPSR_MSEL(IP0SR8_3_0,	SCL0,			SEL_SCL0_1),
-	PINMUX_IPSR_MSEL(IP0SR8_7_4,	SDA0,			SEL_SDA0_1),
-	PINMUX_IPSR_MSEL(IP0SR8_11_8,	SCL1,			SEL_SCL1_1),
-	PINMUX_IPSR_MSEL(IP0SR8_15_12,	SDA1,			SEL_SDA1_1),
-	PINMUX_IPSR_MSEL(IP0SR8_19_16,	SCL2,			SEL_SCL2_1),
-	PINMUX_IPSR_MSEL(IP0SR8_23_20,	SDA2,			SEL_SDA2_1),
-	PINMUX_IPSR_MSEL(IP0SR8_27_24,	SCL3,			SEL_SCL3_1),
-	PINMUX_IPSR_MSEL(IP0SR8_31_28,	SDA3,			SEL_SDA3_1),
+	PINMUX_IPSR_MSEL(IP0SR8_3_0,	SCL0,			SEL_SCL0_0),
+	PINMUX_IPSR_MSEL(IP0SR8_7_4,	SDA0,			SEL_SDA0_0),
+	PINMUX_IPSR_MSEL(IP0SR8_11_8,	SCL1,			SEL_SCL1_0),
+	PINMUX_IPSR_MSEL(IP0SR8_15_12,	SDA1,			SEL_SDA1_0),
+	PINMUX_IPSR_MSEL(IP0SR8_19_16,	SCL2,			SEL_SCL2_0),
+	PINMUX_IPSR_MSEL(IP0SR8_23_20,	SDA2,			SEL_SDA2_0),
+	PINMUX_IPSR_MSEL(IP0SR8_27_24,	SCL3,			SEL_SCL3_0),
+	PINMUX_IPSR_MSEL(IP0SR8_31_28,	SDA3,			SEL_SDA3_0),
 
 	/* IP1SR8 */
-	PINMUX_IPSR_MSEL(IP1SR8_3_0,	SCL4,			SEL_SCL4_1),
+	PINMUX_IPSR_MSEL(IP1SR8_3_0,	SCL4,			SEL_SCL4_0),
 	PINMUX_IPSR_MSEL(IP1SR8_3_0,	HRX2,			SEL_SCL4_0),
 	PINMUX_IPSR_MSEL(IP1SR8_3_0,	SCK4,			SEL_SCL4_0),
 
-	PINMUX_IPSR_MSEL(IP1SR8_7_4,	SDA4,			SEL_SDA4_1),
+	PINMUX_IPSR_MSEL(IP1SR8_7_4,	SDA4,			SEL_SDA4_0),
 	PINMUX_IPSR_MSEL(IP1SR8_7_4,	HTX2,			SEL_SDA4_0),
 	PINMUX_IPSR_MSEL(IP1SR8_7_4,	CTS4_N,			SEL_SDA4_0),
 
-	PINMUX_IPSR_MSEL(IP1SR8_11_8,	SCL5,			SEL_SCL5_1),
+	PINMUX_IPSR_MSEL(IP1SR8_11_8,	SCL5,			SEL_SCL5_0),
 	PINMUX_IPSR_MSEL(IP1SR8_11_8,	HRTS2_N,		SEL_SCL5_0),
 	PINMUX_IPSR_MSEL(IP1SR8_11_8,	RTS4_N,			SEL_SCL5_0),
 
-	PINMUX_IPSR_MSEL(IP1SR8_15_12,	SDA5,			SEL_SDA5_1),
+	PINMUX_IPSR_MSEL(IP1SR8_15_12,	SDA5,			SEL_SDA5_0),
 	PINMUX_IPSR_MSEL(IP1SR8_15_12,	SCIF_CLK2,		SEL_SDA5_0),
 
 	PINMUX_IPSR_GPSR(IP1SR8_19_16,	HCTS2_N),
-- 
2.25.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE9854A912
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237979AbiFNF7h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238289AbiFNF7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:59:35 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2133.outbound.protection.outlook.com [40.107.114.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C1135AA3;
        Mon, 13 Jun 2022 22:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTjNNFUCVbEkogscHmayMpBTVp0L+D/J6FttNgI1/jm2LdeG0ldW2rh/YKnxzgDIfr2jhChsR89WRn6cmGW8tdxfDbjfR7/saZ+wiRWt3qAX1abraQPo5fwH27ht8n9XxKxe+xcL1gs/dDin0LvRbpNFs7jEFw2fHU0gTHbKwO9lOk/OkIfZlnHJTUmOsNpP2Kb4PIzCriZW8LatBZJp5frtxKZeoUJnmZdj4eFUuv+lMzO17WIoeKrCbuEbgNyjr8DOyBEoQz6Vrd4rIVZ7O5fIH0vPYNNO3qfM+f3L0SsSXUwyqqNJA2ZiNVmv8UvqXvMkrw2g3Ek4jBTt5/ahiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0ohFzctWMaXP4pR4NA1b2LYFLTgvWpNUexsJSdqKb4=;
 b=UMQ24sTMdg5cr2n5EhLxdnQkwmImPDUq24j4lskSGvoGTfesdAl4jQPQGHHavjjaqHifoH3JJJ3XHon3DGinB7+bvWJVj+kLEtfm1MIkN6xBUuOHgIOKaB5Jt43WZAZoJy3e9dLzgSyU6Nk+EBIBs4MhlColsy+eW7s1RJtTeupqhaY74M2kSuxWKJu0l7TOnqRpsx+PR1S7TQVMYkOcwVILByAclqot3tJdIUFSr3XMiKjF/72f8xYObzvOjVpFMLhNavakhlK3VS8uRyiyZNU1IaSQ9SaQj/5d5a4KlgnK3UvKfja2M37XSNwvJFJOxL0N0t/n/+XHwBqZhEOWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0ohFzctWMaXP4pR4NA1b2LYFLTgvWpNUexsJSdqKb4=;
 b=Wxg6lVSQKZo1dxvyzBkMKuoq8IL7ukUhqevMPfNaz1rFF+Qr2Nf1oX0JbliN1aCynnj5PF30k3/fuCtySk3B0CGjw8btThvz5XQ89tI5rgL0tndsPkPiu7LOy7EluueQd70XQK+0BlDpx3wDhmK/G6vXQVXTqpM085IM2AMKIrM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB2142.jpnprd01.prod.outlook.com (2603:1096:404:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 05:59:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:59:31 +0000
Message-ID: <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:59:31 +0000
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 165562e7-da00-460b-97ac-08da4dcb0ce5
X-MS-TrafficTypeDiagnostic: TYAPR01MB2142:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB21423C74634932A909327AFFD4AA9@TYAPR01MB2142.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyfpNiQOYuxOA2A5T9YmeZorZWlth7Xs76B3OlpF4KNZISeX+ap6lCAG+0klvzHhjCCOgY4QwbCd+5AMlv5RJEhhs0Km3j3y1LgyCA4ShRYl/Jr/x6I7NMPo9BpncDkzki2i75FSuwye9vFssqUonyyyFIGCcskPFtxAm0aGXpfLAMh7981mW2iL2FGlUGwiIU7Olt5gw/PWA67OV4EWtjQIFo6Mf8pbRsNVZfj2epEqbxF0jxnHHx+AHgFE78xvxKWLN6nLU/ioQVWaRGM9HBJ+HzCFqzD4gFnnbIdUabEX/uM+oLAyDH1jN1AGvI4jDWFB94sGD/MWHLstRjOZFVNJcgASnRDWspGuKCbvPLVFRz+/Mge88HuAykxq429EsF0M4W2dMIz1m0YmE0sYcdi5qs3uGHtx5Otpw7p2CTt/vL57AGnyuY9TU4Hih/cvasz1DL69BBVaFzZDaPZdnJYu68M0IyWBA4gn3gYEaFFuZ36YdWKw4SlwsFfuCB04F2g2pn805WsW17w3fje5n4ZmmKrab7QRy2hRtZ7JGsRtnCdIBVKzOhZkuH9gNnSqFfCqmP+UHg3VuoZF4y/HuqdUEUKvW1aiBzeZtjcaIMfrKqBOaaQo+Oqz9gNTJiCPllkkcW67gHgPlen2U178qFkGp5KoHoQYOD0yBxM//E0YBB7mlIQCPrk3cdCJo5wAOBPconSwGL+myGuB+SLZWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:mt;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(8936002)(8676002)(4326008)(66556008)(38350700002)(38100700002)(66946007)(5660300002)(66476007)(316002)(83380400001)(508600001)(2616005)(6512007)(86362001)(52116002)(6506007)(186003)(26005)(36756003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FHQRsqbr++JQt1pQTWTp4FPSwgR0ZGOnUTWpZ0Y+xjhK9xv3uBrnVh2lJiP5?=
 =?us-ascii?Q?QXKt12K8KI7orHoMeoTjdPJ9+Cu66eydvzMX5NYRMHsxTAcsu8CVWINyIOMI?=
 =?us-ascii?Q?I0NY8g2J2BtuM8CPD21QUfdBgkjbZD2eCooOvyR1nLHHCsiBNqK8O/QwZX24?=
 =?us-ascii?Q?LfbtQIPjcnUCZiEtwVEL7MAkWC0RsOeYnSdHmNzVCYBAq18/BhSh6/lDdjjy?=
 =?us-ascii?Q?mAiphCNQIunaVqdOriFbgoRpYCFMMGs8tPxOJ7NuKyQeICCfO41mQn20gRQa?=
 =?us-ascii?Q?8AO81csUWrpVMQpMbFfVvHOsYHaqq0+B0lJBxNqs/r7takgiDrN42vJOoDYx?=
 =?us-ascii?Q?uNzbjciGYE0dN0JwD4xU3nefmUAGwUZslxWHYFzfmXRKNhahHkkMG3UFZ1Rv?=
 =?us-ascii?Q?PFqve4BHXYWgYDqli3Rn5hkKJovqUMp3dvLbNeFubVCNcJVk9ksLatBrINtx?=
 =?us-ascii?Q?aOioGQ42A1yLPUPbCKTTa2Iaz+LWRTqqxRZxxlXinlqiLX5MukQPLUlmftZ5?=
 =?us-ascii?Q?23NWU36tV9Le6hbCYdPJUsFNVTBNoui7S8z+dtWJ40rCi3v/xB1HkeRtsl+M?=
 =?us-ascii?Q?ySTLTAUdsl60uvaHccLTP7jmWNDiIOftFdFVH1mDCpX/mV/su22cJq6UgYy/?=
 =?us-ascii?Q?7/Xe7SEQg/KYhXaVr+5I96JYHveYuFEwtjGE7ase0aT7tWggpbb0QbMa2H/M?=
 =?us-ascii?Q?OyXH/I4FRe2VCDcO1oltOrmSMZsChh/jApROHqrx8tm8cvRlNG4dvhSV2P5f?=
 =?us-ascii?Q?Wf23DtUxeEa/tpnjgHQv4SPbCYkCuQIDX5Z6jC/6HP5MCSlGP/Pwnu+Pe0tj?=
 =?us-ascii?Q?KwPuAO85En3flwJUYM5/Bak+ZmmsRNJsTJfERbxfaQPVNJ+D3KZ4+dlAEGbt?=
 =?us-ascii?Q?M0BlcjrBelPf78SiZ/8sLLWFkd9csfVNUyrRJzQ2eUsFCxpVVsDWHUZoG8a+?=
 =?us-ascii?Q?KW5YF6rOmkehBK6nu8XQiJLlLjFQAGh/mhjkuEOPGy+LlE53r30zERhbNsXv?=
 =?us-ascii?Q?wRBsSAu/O11IKO0Nl/LusJG0WCQtI8stYbSpB5hc4pOsCa1gK+Q+R3DOe/94?=
 =?us-ascii?Q?d2eqB4kYi905rDm+i+pgaHMTZTnCh640z0RHfEK8UqtdJzwLZTbWw3ZRFCXl?=
 =?us-ascii?Q?lN2A8QqJvbokysnBopVq9jSQDTQiKXK59dPBp80XX0W9q6YeSI7UnzB0nLXL?=
 =?us-ascii?Q?YZa7qmp3LA1XEkxJuD/R8SQLyVx0EY7Jvst9la7Y7wkdTL78LK4c2GF7/sO3?=
 =?us-ascii?Q?B241EMGAh+tfP6+QonBvUBfXWw6Fax+1Dxxrl1hEwacYiJyHRThTPSJPoPCW?=
 =?us-ascii?Q?NAuJgj4HsGp+xim2we9pNLy19zaYV445RTz1aZf5BO2J3oDPLSli+2iVpBhg?=
 =?us-ascii?Q?as4JY0Jmb0eUseyMCx4hlqvpv1liq4lH7eK08TIPWeBbzlzDPUkWBCt6z3Vp?=
 =?us-ascii?Q?u0xiSXY7Tz+N9oESFMBUme15AeNheWagxEG3u0YMNNU7pIrfRGI34aFhlCu/?=
 =?us-ascii?Q?Qzd5bHHcott0dgIIERUzxxcKCEACT5Lr3MNQ7QDIfjmIw/cBpGPRzLEGIqOz?=
 =?us-ascii?Q?kj1j6KdDRs1yzMvHhVL6g66NhcTI3m6hUD09fOOyrUBuvfz5C06l3BWxXTWo?=
 =?us-ascii?Q?pjHi3Q60H+6AuJtpbgAXnZyRr+IXOXil/K0pFp95//7kzmi7SdpdxfGYDeep?=
 =?us-ascii?Q?Uc77MMHYJ1Nf5NaW4hxOOymAGfbNKDoX3ZR8pi2IPSpv3O73HvjqCGiZX1/n?=
 =?us-ascii?Q?j5n/22ijFP0fJm2QF9kLuxRJfB95OLKHeDSVYnBVmIaA71UWX+0N?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 165562e7-da00-460b-97ac-08da4dcb0ce5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:59:31.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCL1142SJVQVQDqopmzqmsPoHP9FY/ogu9szWUN7Pa0ijANeOkxsm77mFcAlCK9FGxRzPmgvZ66fMWyu74qzJ1qgD5CsdIpVox9Er6ZwvaRefGok59alPNa2ymU5L+Af
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2142
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds missing TCLKx_A/TCLKx_B/TCLKx_X

Because Document has 2xTCLK3/TCLK4 with no suffix (_A, _B),
this patch name it as _X.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index ae179b2f7e1b..e70e6aa82268 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -263,7 +263,7 @@
 
 /* SR0 */
 /* IP0SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC)		FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_7_4	F_(0, 0)		FM(MSIOF3_SS1)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_11_8	F_(0, 0)		FM(MSIOF3_SS2)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_15_12	FM(IRQ3)		FM(MSIOF3_SCK)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -334,15 +334,15 @@
 #define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_23_20	FM(FXR_TXENB_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_27_24	FM(FXR_TXDB)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_31_28	FM(TPU0TO1)		FM(CANFD6_TX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_31_28	FM(TPU0TO1)		FM(CANFD6_TX)		F_(0, 0)	FM(TCLK2_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR2_3_0	FM(TPU0TO0)		FM(CANFD6_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_3_0	FM(TPU0TO0)		FM(CANFD6_RX)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_7_4	FM(CAN_CLK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_11_8	FM(CANFD0_TX)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)	FM(TCLK3_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1)	FM(TCLK4_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_31_28	FM(CANFD3_RX)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -369,8 +369,8 @@
 #define IP1SR3_11_8	FM(MMC_SD_CMD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_15_12	FM(SD_CD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_19_16	FM(SD_WP)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	F_(0, 0)	FM(TCLK3_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	FM(TCLK4_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_31_28	FM(QSPI0_SSL)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR3 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -766,6 +766,7 @@ static const u16 pinmux_data[] = {
 
 	/* IP0SR0 */
 	PINMUX_IPSR_GPSR(IP0SR0_3_0,	ERROROUTC),
+	PINMUX_IPSR_GPSR(IP0SR0_3_0,	TCLK2_A),
 
 	PINMUX_IPSR_GPSR(IP0SR0_7_4,	MSIOF3_SS1),
 
@@ -920,10 +921,12 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP0SR2_31_28,	TPU0TO1),
 	PINMUX_IPSR_GPSR(IP0SR2_31_28,	CANFD6_TX),
+	PINMUX_IPSR_GPSR(IP0SR2_31_28,	TCLK2_B),
 
 	/* IP1SR2 */
 	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TPU0TO0),
 	PINMUX_IPSR_GPSR(IP1SR2_3_0,	CANFD6_RX),
+	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TCLK1_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_7_4,	CAN_CLK),
 
@@ -934,10 +937,12 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR2_19_16,	CANFD2_TX),
 	PINMUX_IPSR_GPSR(IP1SR2_19_16,	TPU0TO2),
+	PINMUX_IPSR_GPSR(IP1SR2_19_16,	TCLK3_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	CANFD2_RX),
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TPU0TO3),
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	PWM1),
+	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TCLK4_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_27_24,	CANFD3_TX),
 	PINMUX_IPSR_GPSR(IP1SR2_27_24,	PWM2),
@@ -980,9 +985,11 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	IPC_CLKIN),
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	IPC_CLKEN_IN),
+	PINMUX_IPSR_GPSR(IP1SR3_23_20,	TCLK3_X),
 
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKOUT),
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKEN_OUT),
+	PINMUX_IPSR_GPSR(IP1SR3_27_24,	TCLK4_X),
 
 	PINMUX_IPSR_GPSR(IP1SR3_31_28,	QSPI0_SSL),
 
-- 
2.25.1


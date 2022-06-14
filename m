Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F2F54A925
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238290AbiFNGAh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiFNGAg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:00:36 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2104.outbound.protection.outlook.com [40.107.114.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9226635DCB;
        Mon, 13 Jun 2022 23:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqM04baivyKYCdR3HN+vb9O0mH8N3TcOR4OZNlLbUe04iAA2hEGdIsZv9a8vB7VW8gewGuJdHmmgXEg3q18Iwz9k232Q7NMJ2InPfX/QDT2t8NP/0rMTc8NZVsavGQdFaG0PQA+IC1TnFluqroFvydJoQEvHuNrO5EGnmvlHQoSD4noYFCbChiPQOVeEa2zkhb+5IZ5nRJgRyQ4LQDi6thoGwqj428IC2TsFX5Fqk2IaFg41oH2L9TeClSA6C09KvRAX0QdyRDiWotkzXQde2uRyMXSSHJICE3pUzMcgcW+zRmwwzL3BTn12pNioOMK4HNMb5eYG1FfcYJOZ7fmodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo6B2P9GDY/EyfnYhhYjWO4DbEkFIRMn7a6He/zF9X4=;
 b=Ckez29cuspcSmxiRccoM8Gja4sywYVVkudQ8QXUs9aEt6hkV2yK4tQOFTjQn5M9h0MM67uDESYjcsjpfygrsek5aTgZ6KgoDZ0gakaUeSmEfd9l+6XJ2r+TIOBb8dvkiFsJZhctDugK/lJIo5B6dYPtOZpEDHq1cfPmHBZKdhCllJmHc8JiLFzUEjOCgNFY7KTS/+XGMMDRPsMJcL17Qr/yO7XXW4jbbRWxK5KYhcjOs6XcpQvINzzpiQVppU2Ql/6t6T7rP4wJfbZkYq9FfXHZ1mJh3+6ocWExCxYNcZRqW0CdpACruuLGgrfxdAEOvfCdY6qM7KkH5a2fYKYCgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo6B2P9GDY/EyfnYhhYjWO4DbEkFIRMn7a6He/zF9X4=;
 b=hWyimScE9jJikfMvUtrZ+VHAjYuF7tg/CTaqZFkMKicHF296991rT6oYTV2l4Q2i7sHSGL9c17h8rTOPTVapJp2URFyFuNOBMrZvJq05wfImdfAII1PCAf5hubDOhRz33IUJU+Jaz1trxjbKmG5JhR5qcUsnG6laDuRrl+GnBJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYXPR01MB1807.jpnprd01.prod.outlook.com (2603:1096:403:11::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Tue, 14 Jun
 2022 06:00:33 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:00:33 +0000
Message-ID: <87fsk7kcn3.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 17/21] pinctrl: renesas: r8a779g0: add missing FlaxRay
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:00:33 +0000
X-ClientProxiedBy: TYBP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5a0ce16-4cfe-41f1-77e3-08da4dcb31ae
X-MS-TrafficTypeDiagnostic: TYXPR01MB1807:EE_
X-Microsoft-Antispam-PRVS: <TYXPR01MB18078B9CF17C0D358FFB2D92D4AA9@TYXPR01MB1807.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXuQ9rPokPoVTje3C5dLU6qD+Ut6LyThGuc+0vmjM4Eo0dZlsL+E+DKE1xuOv+v0tXMPB6KXFTCPe297r71/+UV6/PDlhai5Sj3AQ/na1MptbS76Jk6RwAXMIzOp8aQs7s69PZbAUXkWXZEKsa/0XyqJ7lXy52coLDt2q2Dn4JJtugts5DDN+vocrYEKJma+G1gFUhDClRvBX14IMBMsLxpAdrR5J+RycBZqcbp8OVgoNevxq+KYW8hG6Es6V3AnoUP+nZWFTMuTea66/IWyVTl0IDOoZcsodN8njIcWwvT29fGW9UhnYEiluBo+AzyFZOcUJ4ir9oEg9+xPq17jUZE6fXhMOcLi7NkiPhmqKePcyrdwsifuWZkRiZrWBmo+FbaDO/BE/hCGgLBhpt7J8VJs0z0PKOTwpC0n74qSx/VFsNwBPZHA8ARp0wdJSuokZikhStZtTTQhgl4EtSWhUVS55Y5yZOZRm4yAErIlcuWW+7prA/O0wbbqC4nip9Xn2ndzTVaQJPG8Or1/zLtwiSukCfHVqKn9OxwPE1f1/0JPK8M6Rd5dtYdOukJ5A1IVzIg18wmDmOQK76Rv98FL8Qj4jEsCrB9Qx9yVW3mIgwR9eoqZp/Sjwu6n2tuJCUKBy2A/S0yicysUy2y+e4qbm1FRdG+yq0Fkwbs8vXgMYDxQ6zvLTAlY22b/4nrkyLnximoYVb9qRFwsRje2yOGniQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(86362001)(36756003)(38100700002)(6512007)(5660300002)(508600001)(6486002)(8936002)(38350700002)(26005)(2616005)(316002)(8676002)(66476007)(6506007)(66556008)(186003)(4326008)(2906002)(83380400001)(52116002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Qo0pcqJvhsHbjAuEiENRjLCUODcDi/4Rq6sXC05rjy3Bzd8slb1bfp2hbNe?=
 =?us-ascii?Q?tCyuOSqG0AdI4K9JYoeYFBlHqh0Ej+qJWofYYvml+eH49auhB4t3mGq8D726?=
 =?us-ascii?Q?XTQ/nLdPysLmlGBk/MuC96eOjNug3Dn0BZhoReL7UNxxvn3yWgVEZ9yTvHT1?=
 =?us-ascii?Q?jBEZzbxEDxV8Pp/Q1KUbC7xA8NT36fSQIWoAIHeH09poBVAluw0jYUfK1lrB?=
 =?us-ascii?Q?K6T3VtNeXRMof6MTXfXc4uLXBIy4sPb+e1DgV/PEJCUHeUWrY5zFOhKSnmOU?=
 =?us-ascii?Q?jB53R0SwIG8bb6h9m7gFOGMoU5pM0D+xhNUNQ6KIF7AlM9poWckVy7Md/xnd?=
 =?us-ascii?Q?9Geu5viQWnHN1yIPn/EePxTjmYyQkR/oYCHMzwclq2bOZ72Ex5p3AjvTVCmd?=
 =?us-ascii?Q?GEzMwJOVCVEIGMw+nXK5Bf0kMzY59cD+HIjR1lYS4uUCxB8f5AmYjKpoaUfD?=
 =?us-ascii?Q?jLJkS0B3fVcszrxZK675XN15x9H9ngbMz23fkyPz5wea8bYJNRrEydPR/GVa?=
 =?us-ascii?Q?xgvoHCxYPLVQLmIKA2MM3EANovuv29h/oIuXVctIGaAWe1TzCuSdB0Qn73mp?=
 =?us-ascii?Q?7FjEZNJHoYDTQvP2BYrkZXRpCUDzB01tINYRP1Jbg1U9QqYp1i6kEQ8Ex6hy?=
 =?us-ascii?Q?eV5jcM9aCEVUWJLZy2+ipNOR4sCsM4fBUIJOt33pAtNooO444crNnx0dyA6c?=
 =?us-ascii?Q?c+IWgPUN3vC48fEp9oabAJfMFwHvIk4bj1Uh91SXIuX+J6B3KDlvGo69fp80?=
 =?us-ascii?Q?qFu/YcdxvtqIz1VHRkmDG+JpV/2Xhr8ax4iXC+N1HI/krQJnD/BQtpptG/j7?=
 =?us-ascii?Q?XVe+kfka2+Ha/9VtIIWL2oiMTvqG+hnw2crhwgIvD4uHZHxk98e6IVNzIvhP?=
 =?us-ascii?Q?pJ82CrCPznzD1PI45JtzBr9yIeQPaUhJWzHCyHeYVcRmhqQoone8g7PDmsoM?=
 =?us-ascii?Q?RzjBaVWloQ5i5ZLf/99f+yd3XT9Uk+fuuCd5NhkyQ3RPq9Ws9gPtFCy+jSgO?=
 =?us-ascii?Q?5hG7YqZSFv/rivjfRuzMK1vLsTZKsBfM5mur4PZV9Dbu+UweXnmOAxZS+AML?=
 =?us-ascii?Q?toi9aT/PtGaKEa7RsMBtaw/R4YLk6H9yTm8tjOFu/Drgq6ukrTQkehfVYbHy?=
 =?us-ascii?Q?+3Jrh1yV4/Qrr9U3i4bbuwc9vSl/aSGdQv0ErGHT2PStlVbREWardMSxQMOO?=
 =?us-ascii?Q?mbS67mffn/HPTI+L5axlIuxYlQuuGHvziwyq8850MKH4UquaTe1A2baSfO6d?=
 =?us-ascii?Q?wnFL5wmOruwgh/rezgweVM+aIFkmTU8MAG2qECb4VJfcfZ6IlIUY3UbpQqKz?=
 =?us-ascii?Q?TBqIA3OK2CErDwgYPWzBuDrrS6brk59ippROhg1+YfosGtyNMlM9oEQgXTHg?=
 =?us-ascii?Q?h0MR8G0gXqOhoLdpdzsLdcGUgoK8FWR8IxBDB4C7wrupMIe6z4o4ke9bXg8a?=
 =?us-ascii?Q?uDXNyxEUdyWpakrPj6p9/Y8FQ8d9UFX4vuzVM9M0RMlCDw4ggYPz6xx1MejE?=
 =?us-ascii?Q?uawQwbKga/G0Ci7FW0eRz0ITXhV772/ckt7FcaIRa12FDV81FPh3xC0LlvIC?=
 =?us-ascii?Q?UeENfiBFkNZnxpexkDrBcogaYjH87J3ukiTmBy7MP+rG/+rnD0y8BPxcDXKW?=
 =?us-ascii?Q?6CtjAi1AugIFIWpTjORkLSMvuCL7RqXHcGGNxJiMqb62uURjbbEjom7SuTqN?=
 =?us-ascii?Q?u8tStlVu8d2Z4pbDDCNioCIAxssvwSfZ5EL3tN2o2ahmF72w7NDn1L6z7zCm?=
 =?us-ascii?Q?IXel4OH6C+FmmlCE7bcGwQR/AfjKTsg3O1D2zoM+F00PjQF4htjy?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a0ce16-4cfe-41f1-77e3-08da4dcb31ae
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:00:33.6063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKAEpNU+NeVPPeU6h5GQZlOF2bxhEtSOBBk78dD2xnBHc4u0Kmgc6Cm5PvClHI5wwcB9wqHaFp8DNpDh8olXQI7X55wn/EzsCbV5sf3EEud3/Sqd6+glpKZwOYdHRLmU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1807
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

This patch adds missing FlaxRay pins.
Because Document has 2xFXR_TXENA/B pin with no suffix (_A, _B),
this patch name it as _X.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 18881a651d1b..b68d6e24b18f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -338,8 +338,8 @@
 
 /* IP1SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP1SR2_3_0	FM(TPU0TO0)		FM(CANFD6_RX)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_7_4	FM(CAN_CLK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_11_8	FM(CANFD0_TX)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_7_4	FM(CAN_CLK)		FM(FXR_TXENA_X_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_11_8	FM(CANFD0_TX)		FM(FXR_TXENB_X_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)	FM(TCLK3_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1)	FM(TCLK4_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -967,8 +967,10 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TCLK1_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_7_4,	CAN_CLK),
+	PINMUX_IPSR_GPSR(IP1SR2_7_4,	FXR_TXENA_X_N),
 
 	PINMUX_IPSR_GPSR(IP1SR2_11_8,	CANFD0_TX),
+	PINMUX_IPSR_GPSR(IP1SR2_11_8,	FXR_TXENB_X_N),
 
 	PINMUX_IPSR_GPSR(IP1SR2_15_12,	CANFD0_RX),
 	PINMUX_IPSR_GPSR(IP1SR2_15_12,	STPWT_EXTFXR),
-- 
2.25.1


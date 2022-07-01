Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD812562876
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbiGABkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiGABkV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:40:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272075C96D;
        Thu, 30 Jun 2022 18:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3sAbxe6BUem0VkGua/+eDh29V4BtulQ4Y1hBwBoKqGE7h6fPGSz5iIvJNmFOAwZz+TbaXGg2938RKtqIUpUFdKv4qrci/4pHj5oc2J9qF7fjnHRoe5WGypMiTrI9PXgvqLInQMEvqnTioEzL2o6IzY7dikqW/XnhAifudMAddOYEKjk8x+rA+ZDTZxCp5RB18gs5CFFZYlH5nmonkS8C9eFlcbwUEfcETMLIuL3H+hOnrk2u0EC28sEQuYE3lKs5BmBl7VJXw/XGQH8ZTkono2Gxgq2XrMTGURyRgHp0KTxeklclQDEgmrrRTFCY0KiGPPPKVVydVmbEJUbXQCyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOfeXHmt0H8plPHSeUraxfvePPH01QqehNRwOWMMqPA=;
 b=Qd+ZbkYu8CGF38OBzYPRBOSeFYsgvV42/CcdBrXuHKgLws504CQfk/tx9ONDnI6P51c0DyRVrrPhyzEoucJ9DnsCweDYneG5BOoyK2LfHZoihOmMgwcglScAIKls7NRhclq/HDlymYRxyKCUOTgwxmrSkEunRzhMQ0yll6gPaOkSg5la4jfebxBb9Ftzi/jOe5H/Le8cq8AbrZMNl23g/saKtts0IGg98+I20brY9Gao6rgtQNGABoSmclJZ8KYukHL7TC+u72lq+MODZhQ9VpbgfK1rUT9sGyJnS4F1VMAwHuj+du+y0upgXOcug6KA5mMfnF2ueRCcD31AA7VV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOfeXHmt0H8plPHSeUraxfvePPH01QqehNRwOWMMqPA=;
 b=ks1icNAdj6OwDKYStlA446ocb9mh+oQPkxrDctfFbJOr9LyQk9bF0Ljl2fsh/LeRGEQLGN+MVda9rMcJyIanq2UR1kIgrwoVHR2C7a0pR9Zp+FPDtHGxWdxawPWAKbIeRjjviET0MXXy08hz2jM1YppJnFXsG6PfbhLQyVbAgZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8850.jpnprd01.prod.outlook.com (2603:1096:400:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:40:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:40:18 +0000
Message-ID: <87pmipsj9a.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 19/23] pinctrl: renesas: r8a779g0: add missing FlexRay
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
Date:   Fri, 1 Jul 2022 01:40:17 +0000
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c07b269-e64e-4e01-4635-08da5b02a74a
X-MS-TrafficTypeDiagnostic: TYCPR01MB8850:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0r3Pp8sFDX4W7aXl+Gt7WMcSBHNK52yLuhN3a6Q/bnPwuc3ei9pVkDN0KMhDrVwAEHeSzL4A8jSbJDjrAaRWbhUMZU3IQKDnwSwJZj6IMkOmuigDgDbplx0mciIyEF4lSg8W+VDybHjk3HbyFedrt9EFZodH3Mq0cPFhEFwpd6jIW/AqEPMOLdf7QHd91M5yavtVu0iTgXrMPF94V3MSjIs1BZrsYvIOCT57wMre8tdnPebTdzTfkJsM0AAJWIf7xMqY8RBQzRh2N2BXAVPTv7sWo6oU6voyQf1Bl2uxIvX9zd4IFAm8/vwybyp7QLabi4vQFa8D+OB6YBo29e0CjqC6vPkmYbJBvgrnefYaw/jQUV/GpTfzA5x0zfUWe+jq2UXZ2NIeZvwdyuUOCoXar2dWzUc3Iv8uPmhdoYIgIHscHXBKX0LHQI7bY+MVANWbZW4if/h22SVdTIRySp9/dBI23+4kpkn2YTBbDyCc/Uv/2BLWEgDQKS9KjRKF5kLxLE/2xZ71oKDAdM88LBpjLC8rtK6+TQ6zex4FawVQTqiCzpqkDOkj6MWJje189dLPOudfTLu2Gs+95IguAMR2lBhBfFVpxnNxPZ3ejYgtuJ1GdoA2xqB9lgUKke3qSJyF7lu6VOgXNdXrPKDIS5VcD9IG1tsP0d2pxY8IM1m8Dszwm6vOzUWwlpD1T6iSLu9ax6hf+djkJySlyIhfpOqbEX29V0iqYS8ebdXav655oCmYtmKY7YskJy0Ha+9I/TyWkg+k7tgwR1hnsPdRF1E/qH008KI/u2zGB0yp6GUeoryU5EyueoK/4OJ1SSSHSsg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(36756003)(110136005)(54906003)(316002)(86362001)(2616005)(26005)(38350700002)(38100700002)(186003)(4326008)(66476007)(52116002)(8676002)(66556008)(66946007)(6506007)(478600001)(8936002)(41300700001)(6486002)(2906002)(6512007)(83380400001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kd8G7aOKsHM8h3U/3AWwTlEE3qzZMq7u0Bl0LZt1ZuL6tpxpc3lEqz6PZ9Sa?=
 =?us-ascii?Q?8OBQuGXJRKdzZiix6Bmlaq1vSP9JqKwhVuWx1/88Y1DIn+bKaOi9GwB5ZCcN?=
 =?us-ascii?Q?1m7/i5vRDi1ckqgm6rfjtSrAZ/5+p7VJvZDeFE+5b5SlnUHd6QC74j4pVZfR?=
 =?us-ascii?Q?xmlUi6Gs5BTHD83R5hCpvPsJU6GPNqw55YPYc1Tw1ZA8ngygN1in1ue9NwwB?=
 =?us-ascii?Q?bLLjJBvxL2Si1csOmnCPzoDm2WfzMHH61Fzy1X6ykhVp8wGiaPoSr7/9KBXt?=
 =?us-ascii?Q?edmfMCJiAbuWuZiNUETnxOqfE1c/mOyWIdHXNepiA13K2Pdk8OFSD0GqdfGX?=
 =?us-ascii?Q?9DRmtPma6hL22lZcIm2OaRMA6XPiO7r78zuTIT0PM1ffdcBL/TAyeUX3h54j?=
 =?us-ascii?Q?e2M3pPvHiwdkmsbtRordilg9fxcmY4kQi8v/d9ZfH80DEQjavDBxS+FTiuPT?=
 =?us-ascii?Q?pyu31+7PKXVhdA2XODBDzD87f/pEPCEMgiUY+tPWQceqSF2Eh8v4/lIcsm2L?=
 =?us-ascii?Q?D9Kyc6vfF2hXU1VfwM4OeV01iWx4IgEJZLWNXvhMzJS3HbpGodhyuuGj5WZf?=
 =?us-ascii?Q?Cao9+cb/Wf1ofeNx10wgJLGcKvLWcLRF5XEvE0lt6orEaG4UCkAVtQIRvPtZ?=
 =?us-ascii?Q?d4ogmuOwmMEsREY2yde7KlYMfk1lN/GgtBZvJdMWWdTKsBHrChefdvrtH5gU?=
 =?us-ascii?Q?eqDQEcwy7cWzRGGkvD90UvXcsmnqkx6xEtg08RHqdv/tyDrhSHSraOnm77qt?=
 =?us-ascii?Q?neXRqg/LTgeJGURnw6pY3OVAcBEIn8BNoE+TQsrpkn155u4g8Sb+hiZzKdEp?=
 =?us-ascii?Q?XyC3xhYG6BGyV/M/oMfeNDtO94cJxQbfJby59rotrpO80tcu3QOUlAiM8wEA?=
 =?us-ascii?Q?cqAHmDTYfLBlo+8ybIIhL+cB2IyRNYmKzBQFfqKtDcQcT3p8t2uFRD+k+ox1?=
 =?us-ascii?Q?I2UMi3lc0O1cRmRDc9xRNrCMqbrsj4CRYfELXnRbyl+S5ekxDYbuBZke9hHC?=
 =?us-ascii?Q?wFANyWnmbdaD/2pwD0d9XsD4mK+0fJpM+qePj3r/e7pumnVNBAYLdjB0JRhq?=
 =?us-ascii?Q?bRISeDlx8ewN6WVVczEpoNMxvp9c6zjLWB5W6F/rW7oJFUPyxXfdOjFnuywl?=
 =?us-ascii?Q?SyaDYVLwV7hHWF0ljiwHlS7HqGTez2pWtVbSrv8aqUin14Eiida4SP4U53Va?=
 =?us-ascii?Q?KGjSwhwGUarHIze58/YHGw7Vm4cIU40HbYS2+da9TvqoiL4JO+/8F6aFRxcJ?=
 =?us-ascii?Q?3EoAaWikzhTSdSe8mp5UQBVmMPe81984rS6fgbkT8r6epWXyArnaKkDxFPux?=
 =?us-ascii?Q?ZePS/Eivhj6IiAfedZLuzcPLvUDT6pCaGW8dBvL99qATY8g6lMmsZWdvZQW4?=
 =?us-ascii?Q?d8bO9qPw922ljBcJjj/b2M+pjO8xm6Cj/4+TtuKaYUgJ7bPD3hbzncN3510s?=
 =?us-ascii?Q?0ixI/uLs4Bqq9/Q3D9Q8eVAJ2owTRgcJzJN6pMdCEoVS9XqkgXN8Bg7XC/zR?=
 =?us-ascii?Q?9TxvM7yuioAxA1txbWwI7bERDIYB3YHEDOWXgiupwpOG6Boa19XVWsgMlaGB?=
 =?us-ascii?Q?buNBxYhgUMrusGTjRm25rEqisgUoC5/YsbUuKw2SKj7ZLgjA6r6iVKFRVRN6?=
 =?us-ascii?Q?GCx2G4KhCdUSDEpkIYl3NCI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c07b269-e64e-4e01-4635-08da5b02a74a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:40:18.2633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ0HiqrYk7q3OFvpccz2zqsjuLboEOC2x26JcptoaK/Rh4kcfHNk/QbPWWQkCaUipuCkO3yXX5OgVf5c4lORXL1Scg6d4xusgpG27vwRUITbFAqjyzjeonMr1lBznhFo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8850
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

This patch adds missing FlexRay pins.
Because Document (Rev.0.51) has 2xFXR_TXENA/B pin with no suffix (_A, _B),
this patch name it as _X.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index c6a9624f90fb..69eab3ddfebd 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -345,8 +345,8 @@
 
 /* IP1SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP1SR2_3_0	FM(TPU0TO0)		FM(CANFD6_RX)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_7_4	FM(CAN_CLK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_11_8	FM(CANFD0_TX)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_7_4	FM(CAN_CLK)		FM(FXR_TXENA_N_X)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_11_8	FM(CANFD0_TX)		FM(FXR_TXENB_N_X)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)	FM(TCLK3_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1)	FM(TCLK4_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -938,8 +938,10 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TCLK1_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_7_4,	CAN_CLK),
+	PINMUX_IPSR_GPSR(IP1SR2_7_4,	FXR_TXENA_N_X),
 
 	PINMUX_IPSR_GPSR(IP1SR2_11_8,	CANFD0_TX),
+	PINMUX_IPSR_GPSR(IP1SR2_11_8,	FXR_TXENB_N_X),
 
 	PINMUX_IPSR_GPSR(IP1SR2_15_12,	CANFD0_RX),
 	PINMUX_IPSR_GPSR(IP1SR2_15_12,	STPWT_EXTFXR),
-- 
2.25.1


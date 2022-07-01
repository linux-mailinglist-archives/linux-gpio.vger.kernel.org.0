Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2F0562874
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbiGABkS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiGABkR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:40:17 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BA05C97D;
        Thu, 30 Jun 2022 18:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG3TvRTWcpTcK5pUiZOcVDx1stvoJ3Fwf48t9kKdiK6Mcemt9bASjHtGP+4Kbask6PHvWQuKeddQ/zf/VVbzXcktZjhtIpv+gtOb6R4CZoeSelqpvGrW5l/3QNNptOoth7EB//vS2iBlS2RCxI3/jA1syMbe6HP7tN331m9NSc+DCFodY+YP1HyGL0OMdWw8E4zaiUp+OmbMAxuHlU2VSvOzASdvCagwK/u2ScGqZhOkBYMvfNwJhchdAOvAwEvViU+Ni7nuXxt9HMC0XK1sJJib/MVZKycNsYxDa6OtAvu+ETRX0Zy2vjCIWedMXUZLFZRufppZAIZeFnKdaQd05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16nhzlpKcivS8hxfjY98TgodO+MriKEOhqiUxj8s5/A=;
 b=SqENsw/I7WI5eNWPyQRXJdjEYSlXUzW5t6LOUhSd1d4tBBetArnlW5Tvp3HM0A9p/h1yPn9XygGfxKxzv6A2L8vQ5vIUuixPDHhCs3WlNBFYOekONeTvy4imANnZso2Pvkmvwy+0dxeLjkAJ7mrUBTS2PjpLSjEdhOOxf/+mMqB3gSGpQNmq57BknRz1PvxfBtrytP/mWaptXkx7QdgRLSpZN3evOOgdxTM9aCLBO0FFx8o5kpqM1YIf8POi6vEfoIKLm/tteo7O7kM18FxYMny+pkFwdBXN7tstgz1jhdB0v2yvxIYpkPjMNLfCS9FMjUfo9M4G+ETO7DugFWJR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16nhzlpKcivS8hxfjY98TgodO+MriKEOhqiUxj8s5/A=;
 b=JB91MfjJWOHI3K21q3JW5YRICNJgMYnbX/Qhp3Kae3fFt6br3yIUi+uTAPlwdY3UIMDAwXGQg2F+tp/TR//6x1SdIrA7nWvCG6EnTMkEVEJEuhwEW0u4TjgD6TbrR36FJhBpklcg+lUFoFOxQ7qs8LwbqoaXXJ0ux0jE4q3igh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8850.jpnprd01.prod.outlook.com (2603:1096:400:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:40:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:40:09 +0000
Message-ID: <87r135sj9j.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 18/23] pinctrl: renesas: r8a779g0: add missing TPU0TOx_A
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
Date:   Fri, 1 Jul 2022 01:40:09 +0000
X-ClientProxiedBy: TYAPR01CA0100.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8afc5340-69a1-4595-8d13-08da5b02a1ff
X-MS-TrafficTypeDiagnostic: TYCPR01MB8850:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nj0VBzqU5rEc3wB6Mlh1Kbkc5om3ZBe0WwBibN7BM4aYOXODJVlPH5kd9TpM8oDNpr9/AWr544BEQVMxr0mv4yJXCAkkNbJ7GftYvbNIIKYPXF2NuTW1vU35NlixkQP68MsC1N7rbnn9qOlaxoZhtUlirjCPn5Kdo9sjROU+UQ6jdptvhGXJVHYpK2+Ah2S+xqVCzfNL1d5oqpiEvtahOOU3osSVdMqyIYyC23SD6FZG+bb3wyfRM1ak3V7qFMHtJiPZqGpal/XaumJkn7e/f/8J4Hoom3dWmq4Trg3APWcsEEkt1yzJ/vm8wddQxQZkPOmwP8wJDfIBC5h8XyrT1YpLOTxMwx3GWfC/CD9N05nJLXxV8SPLTMCbHgG8HFqQb/UOjrGoNgkpp+N1SVMKzcsE9I0yKe7YFz+Ipdb5Zj3iuhPhnByp4v0e0OVd9yCvEQbqxFo66QTWNbK5jH+gXSi5Q4KEubq60B3YFGlp8qZ8pceaG03fk7KLSMfGnSsemgb5wSpB2yj1uZxq3JrFd518uL9hVAQrs/Yz2W+qgC+OApzmLDuJUo6D4cQ8+53pBFceOBBGod1xqgQ5yKNRshpd7tw1GEaFrd5rLBJRqOT/VyvSiwqtu2dBEWbc++Ws0Zd0aBIIIsG5hUZXfzvO9XhUaz4xYYZx2uLpBDElaJ1EcRnNsuuJacw2WfP5HpH0tjGldjqwYPRXdLOWhgGSroYGOmZ4s7SU1prwcCt3bX5azSBnOt4rYEEllvp5x+NjzEqBHk2TmzGJ0MNAHS/4htIWkMzsbNJQH+P2PzwSQ94apbWseTc3rPovycvPDp41
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(36756003)(110136005)(54906003)(316002)(86362001)(2616005)(26005)(38350700002)(38100700002)(186003)(4326008)(66476007)(52116002)(8676002)(66556008)(66946007)(6506007)(478600001)(8936002)(41300700001)(6486002)(2906002)(6512007)(83380400001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zB0Wr+KAup7xvji03n+uEcPQ6+nGdqotW7KxQKrXkWOdJ+ouEwmL/Rwu0REV?=
 =?us-ascii?Q?qYE+vHF7UPzKfLPmL/myzYVCuMvHCKFLpopJ8Adh/XYAo0D0TxQYCD2Zv7eJ?=
 =?us-ascii?Q?4JyEz7nSQQOZxequVxEHvui0ep2BnJ9SoRb9FqMm+OQC8wP2HZAjXSnWL47G?=
 =?us-ascii?Q?EImITIyaDHec7MdlayT+zHvXD3VBLNDW/z29EUUS/4X0VzIar5reZxpMVbBC?=
 =?us-ascii?Q?CMF50Z5ypm5IJaUsycXzME1lupD5oA1kaON1fIouDIpJirH8XWtTCV5NMZVW?=
 =?us-ascii?Q?I50FREa890t3RZdE7CNcXM6dFLzRRpIyhM5A6E1z0CV5dng+K0SDBg7C3Sh7?=
 =?us-ascii?Q?/HWSgk59FCeGK+KN07iw/rPNuA1Wh/GFCaN2Ha7xL1lfI/grlzJt0xF/15Xe?=
 =?us-ascii?Q?2R42alYJHdKTpulgcVCQS1G06kpYW+VDV3jbeCc0Lzi3rQcPewKxo8GDoLi2?=
 =?us-ascii?Q?K5DGfFXGP5zH76SAmi+lOPhmqgvzo1nQT2l2hkgOc8gV9+eRrgEjnG/UXyC9?=
 =?us-ascii?Q?Fzp/yQAJXqPDHNiV70FaF//z7tPFTBnXbw/GCEj5B3An9uj8F+vG+UhSzfR9?=
 =?us-ascii?Q?49Yw8lFVvRaJ1HOlRJsjkJ9RuO0IdjAfNvxXYWRmU0q55YivH0eVcy2+A3Dw?=
 =?us-ascii?Q?mGtccZsiIBZ6hGE1gFeT5VyXNuHs8moDwB4iKrRXbAkZrvu+qIbi7P0Ep1Cx?=
 =?us-ascii?Q?as3TJbapTkQkOeMWyhpUHwT2h0gcaBfolDekDA+pUCZXCazolryEyuKIXUY3?=
 =?us-ascii?Q?KPUdb+ael2qO1UDxquI6WJFeSts8AW3HSHJfypJZs2GuRgWTdK+03K7gX1RN?=
 =?us-ascii?Q?a8mr9x5lW8kJ8VX9ym+M2YLm6OljyT3C8eAXLpUV7LFSdZcI2fg/dL7HeeJq?=
 =?us-ascii?Q?DSV+Le9+R0PLDubvlIM+sRy8Y/GsZuDCK9T80h3rr2vUYHv0bx+c9TZFP0Ir?=
 =?us-ascii?Q?TC6Miitfml4L7B7JgArutCh/IltQI63bGWMdalyZRBrmVUZq5idLPALvxlEv?=
 =?us-ascii?Q?Ks6eprp2ZC+z7u2LtTCXT/udS7fAg5128lMwu7gTUMANb3QbQV0pkeyxw1zO?=
 =?us-ascii?Q?rkejNShIWKWdpTYNFqGsFyBnYa/KNHKnc5lp29RXWkvLc1/DU3G0x0McRr5k?=
 =?us-ascii?Q?x+wZlduaW/LHxR6TAg8oPWojHUwqECd0IRB8v+gqa93xiRggwVJRhJL2UIk9?=
 =?us-ascii?Q?EbQC3lm8XZEpxv6AlGzQUrsngAtxmejk/qDmFNIW1jNFIQ53DmWFwmjkyJgU?=
 =?us-ascii?Q?8ETW6v9YepbeseRaMF1RClWE9B/v9yZBFbMajHo1uWpMlEwgz2PCk8/Uw4GR?=
 =?us-ascii?Q?VQ3YGBmzSPlADTY8zNwydsycBioQqaff7H7E3Mnmpvk5Mb2cJv4G3i1RxR9C?=
 =?us-ascii?Q?C1gGiR/ZM92OeBav9g34fQr22OdT+/xprfz+JKZ55yMS2/Q6RlMpq8VN+Dfc?=
 =?us-ascii?Q?olZPzMnzncp00UQLH5yWfyh0CX6kbneuQMDZ/GhbhMvRjZHyPczkOfGovn5D?=
 =?us-ascii?Q?yWwCgleLcnGuuC1mqMLUsi6ZCwllQGQOOQHmcIC5fNoWHCGJqFeetXVJwbLS?=
 =?us-ascii?Q?yNtkFPgEe4heXEzEBrclR0BOqFZ4rwE0rU0DxVnOi61IcThriQM6msHGvTTH?=
 =?us-ascii?Q?1W8Hl3g6v6vOtGEvMNHJTYk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afc5340-69a1-4595-8d13-08da5b02a1ff
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:40:09.3069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBF8Er2GmR/MD8SK1cLa6kuhSnzrlumoxDEX+sFQHV2QSB6OBkTam+alrKxBtlBUbckzu0hX1PT7ovtobAuyLYjqKFj+CVktzThv//kpynEtyVdULxl50D613X6B+q5U
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

This patch adds missing TPU0TOx_A

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 59 ++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index c9331c008802..c6a9624f90fb 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -327,15 +327,15 @@
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP3SR1_3_0	FM(HRX3)		FM(SCK3_A)		FM(MSIOF4_SS2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_N_A)		FM(MSIOF4_SCK)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_N_A)		FM(MSIOF4_TXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_N_A)		FM(MSIOF4_SCK)	FM(TPU0TO0_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_N_A)		FM(MSIOF4_TXD)	FM(TPU0TO1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3_A)		FM(MSIOF4_RXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP3SR1_19_16	FM(HTX3)		FM(TX3_A)		FM(MSIOF4_SYNC)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR2 */
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_7_4	FM(FXR_TXENA_N)		FM(CANFD1_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		FM(TPU0TO2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_7_4	FM(FXR_TXENA_N)		FM(CANFD1_RX)		FM(TPU0TO3_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_11_8	FM(RXDA_EXTFXR)		FM(CANFD5_TX)		FM(IRQ5)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX)		FM(IRQ4_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -890,10 +890,12 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	HSCK3),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	CTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	MSIOF4_SCK),
+	PINMUX_IPSR_GPSR(IP3SR1_7_4,	TPU0TO0_A),
 
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	HRTS3_N),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	RTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	MSIOF4_TXD),
+	PINMUX_IPSR_GPSR(IP3SR1_11_8,	TPU0TO1_A),
 
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	HCTS3_N),
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	RX3_A),
@@ -906,9 +908,11 @@ static const u16 pinmux_data[] = {
 	/* IP0SR2 */
 	PINMUX_IPSR_GPSR(IP0SR2_3_0,	FXR_TXDA),
 	PINMUX_IPSR_GPSR(IP0SR2_3_0,	CANFD1_TX),
+	PINMUX_IPSR_GPSR(IP0SR2_3_0,	TPU0TO2_A),
 
 	PINMUX_IPSR_GPSR(IP0SR2_7_4,	FXR_TXENA_N),
 	PINMUX_IPSR_GPSR(IP0SR2_7_4,	CANFD1_RX),
+	PINMUX_IPSR_GPSR(IP0SR2_7_4,	TPU0TO3_A),
 
 	PINMUX_IPSR_GPSR(IP0SR2_11_8,	RXDA_EXTFXR),
 	PINMUX_IPSR_GPSR(IP0SR2_11_8,	CANFD5_TX),
@@ -2328,6 +2332,36 @@ static const unsigned int tpu_to3_mux[] = {
 	TPU0TO3_MARK,
 };
 
+/* - TPU_A ------------------------------------------------------------------- */
+static const unsigned int tpu_to0_a_pins[] = {
+	/* TPU0TO0_A */
+	RCAR_GP_PIN(1, 25),
+};
+static const unsigned int tpu_to0_a_mux[] = {
+	TPU0TO0_A_MARK,
+};
+static const unsigned int tpu_to1_a_pins[] = {
+	/* TPU0TO1_A */
+	RCAR_GP_PIN(1, 26),
+};
+static const unsigned int tpu_to1_a_mux[] = {
+	TPU0TO1_A_MARK,
+};
+static const unsigned int tpu_to2_a_pins[] = {
+	/* TPU0TO2_A */
+	RCAR_GP_PIN(2, 0),
+};
+static const unsigned int tpu_to2_a_mux[] = {
+	TPU0TO2_A_MARK,
+};
+static const unsigned int tpu_to3_a_pins[] = {
+	/* TPU0TO3_A */
+	RCAR_GP_PIN(2, 1),
+};
+static const unsigned int tpu_to3_a_mux[] = {
+	TPU0TO3_A_MARK,
+};
+
 /* - TSN0 ------------------------------------------------ */
 static const unsigned int tsn0_link_pins[] = {
 	/* TSN0_LINK */
@@ -2558,10 +2592,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif4_ctrl),
 	SH_PFC_PIN_GROUP(scif_clk),
 
-	SH_PFC_PIN_GROUP(tpu_to0),
-	SH_PFC_PIN_GROUP(tpu_to1),
-	SH_PFC_PIN_GROUP(tpu_to2),
-	SH_PFC_PIN_GROUP(tpu_to3),
+	SH_PFC_PIN_GROUP(tpu_to0),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(tpu_to0_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(tpu_to1),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(tpu_to1_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(tpu_to2),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(tpu_to2_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(tpu_to3),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(tpu_to3_a),		/* suffix might be updated */
 
 	SH_PFC_PIN_GROUP(tsn0_link),
 	SH_PFC_PIN_GROUP(tsn0_phy_int),
@@ -2861,10 +2899,15 @@ static const char * const scif_clk_groups[] = {
 };
 
 static const char * const tpu_groups[] = {
+	/* suffix might be updated */
 	"tpu_to0",
+	"tpu_to0_a",
 	"tpu_to1",
+	"tpu_to1_a",
 	"tpu_to2",
+	"tpu_to2_a",
 	"tpu_to3",
+	"tpu_to3_a",
 };
 
 static const char * const tsn0_groups[] = {
-- 
2.25.1


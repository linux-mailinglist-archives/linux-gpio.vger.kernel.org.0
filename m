Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4702754A921
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237232AbiFNGAX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238080AbiFNGAW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:00:22 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527B035AB6;
        Mon, 13 Jun 2022 23:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eK8UA+oMV0ctL03paAjz9hZJ0Dy1cTPVG9GDm9KCWiDSiLNfsHvPEndyj5rEG+H79wq6g/8ue5b4iTOF6gupKRV9Q8Z4vxOkRyriJGS8SXEepS7sDdHYDmnLB+BGsPe2eIXR3nrQqpfItG05a2lIvAWsLi+GF3Jrt1ZAa7H7la/K1O8SP6hjbBLU+uoz3hkdSz1EQG8j5IYB2H4t8rtFTTmkY85XVzBxpF7bKEDJA+sDDQfQAR/EOPh4k4t0F9tUto83iOmtELpYJUvPSC0v5mJlQKvrYHwKxCp0+V1NYOyX/esEQdAGGJ7gUKgZ2S+bPFX5Zdryz5vcrzusjtmOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNleFazNPL6yNeqz3tL0zPb4HFO1hf+wBfCFFGWIhOY=;
 b=f0D/sIPF4wJ/BOpEzXdC139HzxjTboRlX56pvuAJ7gN5gBcocsNirbkkqqR/yMGgNHM7S3yjCLB1cwY0qmNeTU2+PCbnZYZC7JcmJ3zoWJBltj30syBLy2Ljjf0gfliMzRzXei8WanQYmUovmpOxq0E13C6w3vNV2YdQYWF1my9dkAomIJrPFAR+QXDgYx7F3n0jNsgEPMROP4TIAHsQnoA++hElB8keYBOyGx8lluC2NHOnol4opbnlWGjMSg/zwg/m5eRHb0me2WEqgJY+VmJHCpE4UQ0JIYUri+bsool/x42oTJcE5i2T3kXGVbiTq2BHes2B0EbtMKMrNRCkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNleFazNPL6yNeqz3tL0zPb4HFO1hf+wBfCFFGWIhOY=;
 b=ZvvMm2yPAdl3x2hdaSWY5/Wr+S9jn9meyqwrBEHHirMX8fZA0l9qxLWqUhS36MvJ8XFgxrnb6EFdW1OaZ0ZlvVh5tQMpWGW1X71E9YA6T5xFmb032RHPeet/Pv00mI4JtI1N/pFpxdr5JZ5zR0+MUtFVt+PrzkFyHtgycOO3c94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYXPR01MB1711.jpnprd01.prod.outlook.com (2603:1096:403:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 06:00:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:00:19 +0000
Message-ID: <87ilp3kcnh.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 15/21] pinctrl: renesas: r8a779g0: add missing CANFD5_B
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:00:19 +0000
X-ClientProxiedBy: TYCPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 986c3d8d-bcc6-4670-0c20-08da4dcb292e
X-MS-TrafficTypeDiagnostic: TYXPR01MB1711:EE_
X-Microsoft-Antispam-PRVS: <TYXPR01MB17118452AEFEF1EC5ADA0052D4AA9@TYXPR01MB1711.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5wrFgx+y2Z3rz7en+y3rm19O6+EnP4LEjvjhYUN3z+Nt1Xl7CIYFZ3IgOhrUrj3bUl5fkTpDkpeGPMtfz0y+jDy/cXFPAVhdCjAsW0N8KmVXbp26fIoSrW0IBVJSvcDatDAJIG6Gr+lLAIPTlUAeR2/DxRnlr33TJr7bZmH+ckXwr5izp7r+Rpkr2SOU3v1cbBkCv1SNjdMQdw/Xxwvv9J2VjeN4b5Zq3X7LxrkaRWuw/EwZs4EEocpiisjUAy3EVfjFJodujPwoEmf/OHajllOjRfGxKxIWtP2sdhUO/dEy9aP1Kihkt/IVjvU35rdl5Qt4+TkQVppwp1Iy/VRLkCOe0+IBskUn2GG+W3g3mwrq//vOwBI8E5rysMxW5hJkLzBV5oRS5eBCBMaxHvbunR1t/XAFJ+Qv8XOOu/mz8Aihy6HqjrPtHyPBpYL4t/pJBjRqEIhCMIUSB/Q4R0GJphLjAPNJzVeKv84dt4dJTCDqyHPLtGYwJfv72Sml7mxHGt7UX6Lq9HPw94ZvkJDzRNU0izoB8IVxidkWZT+pHog90IPnwzCEt3rUInbOB6rYS+ZPByYQsj3A30yTunKaLM6eUkPjxv0/uUP0BQEgr/uKegBna9kbJT0nKAGvMBYCvFL/fS+3ZNHCc4xFFyRA5twZcvKEUKRko7yuNXM7tsFQ/MY1M8/txvYYTULSZ4sWDlSypbDM96QXOVASA3FKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38100700002)(6506007)(38350700002)(2906002)(66946007)(86362001)(4326008)(66476007)(66556008)(8676002)(508600001)(52116002)(6486002)(2616005)(5660300002)(83380400001)(316002)(36756003)(26005)(6512007)(8936002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oWqnAF6evWSfcR8Xpj28gvQ1ZZFTRFlz2Qzv4W7iEchXHQRNhPCBRg5mLBza?=
 =?us-ascii?Q?RGUZu51t+IaemmV9DrvLVTTiHVrqucrtlV4YhxUVORb0vpEZT4pxESGZkWft?=
 =?us-ascii?Q?VEErmHe5Ji4PniJuPRE4w7CqFn/hJMmLG+yi7FWiebHF04izTbIwXLg8a+xn?=
 =?us-ascii?Q?svRkON9yTiQL6PYmOtx2kXjjsyXtYszxIWFWcUMXQ010xwC/7vXNBZfPLbKa?=
 =?us-ascii?Q?hohLmQhx4WAiw9hn3I2BdJxo3Oq1cEAl28yjJbTGTn3vj1dPfPHqZGza/e0W?=
 =?us-ascii?Q?svvKi4OSYY9sZwfY4i6XLNLM9n6H9gmpbwKqzIwrTjrpnt1BwZcK1NrBD8Sc?=
 =?us-ascii?Q?rChdXe2uhW0211PcnkGMt+2FpnwqJzpalnBq6fQk8ovtSGru5lJ5xQzSHV6O?=
 =?us-ascii?Q?wlXxUAFwRkK2W2qQqWV9hD0ithEEb/5inTSwbq2pUX7LT34C17BlTfxsMsOD?=
 =?us-ascii?Q?sCJymNg2t4MVzZbfMJ01qYDz89hZtIsUsAwKdOwfabRNxYrabqTSYy/FApXP?=
 =?us-ascii?Q?6ode/ZuqbpysNioHo2fRr3daQGIDKHr0CM0YlI+TH53kOzxKTRJXH4TxLimh?=
 =?us-ascii?Q?6LjiD5Afg7m7J5OLDVBcFeL/mFRFTsUcLWZiSaElsHLsR/nx5ScD0Nf3izn9?=
 =?us-ascii?Q?YzngmzLvhJj5E2KIR6/GfoWgtm+UDVKhvwVT+vhqrPR+CwaCmPmirDqti1Iy?=
 =?us-ascii?Q?iC9mqigJWHaRp2ztpo1u36l89A6YT8rxJqlYVF7PBLuivNRb/U24DI+zKEbj?=
 =?us-ascii?Q?tBiJzdrCH7pThC8Fyw+43nhOo8/gOnFaTRXHWosE832S22NzVXIaKPW6AWgH?=
 =?us-ascii?Q?nD/eRpgyKQrHFtvpVzKUBSaL5V58/QTuT5L4k8rYj9U70OJ2P6dq/yHmQZbH?=
 =?us-ascii?Q?olcvpwwmOLd9lpNar9Qr3UfMvTA8I9i1vXAkyiapP+1uvW/bJau5Jx6dkw/f?=
 =?us-ascii?Q?EenO+mjS0AnvkRC24QCZ/SZ9VGzVpxvErUo1KDSQsPEvLEnG6L6up3BjLO8c?=
 =?us-ascii?Q?CcqYXlfAumKX8LFgx3Jg0C+WAJbfST7a4xCatvNbawN6/vaiQrgrn6zGC3DM?=
 =?us-ascii?Q?issHLds2bFWcjDNSR4vUMCc8uUR5CwGU9RiGAGBaxXImRKA0Wi4FrA11g4eA?=
 =?us-ascii?Q?nlKb6MH3FP0vphodpdb28Aql20TTwcI+5wRVHNihQ07w6lrEuBsDbzY2OduV?=
 =?us-ascii?Q?MSCNaOPPlFv4TiJXpf9hQZq/Qn+FrEpKvBPsORcfFasyvHkCwmUroxAUHsNR?=
 =?us-ascii?Q?RSYHOnv2Bz9dPoo959J8HCuUONhRyDlippKVs9GGqLbShaxMoqmH3SGjC54B?=
 =?us-ascii?Q?V4fdgO8CU1Xgtxyy4KI+rXVVfhfLqUv59y/VlniFGdogNbSSBEhI7ivaXgM2?=
 =?us-ascii?Q?D82cw1N7HUcounQ/XDnUcgBh+gqps06D3YZZ4urt440JG8PHQ8CsayKwQHwE?=
 =?us-ascii?Q?CdQin8hfuUzazZiAA418qHpkrrZjM5TtGvT+d4e71+jBlX1kYwFxs7aoHFhJ?=
 =?us-ascii?Q?2LuHrAZrsLPfvI4T4RN10fD0GT8mPKLSKcWR6dC5iJd5iHQkTuwp6C9K4CX3?=
 =?us-ascii?Q?89gPzXqau6EcaWBKNLDWHOAllaneDudguqGmo+244KKzGHH06yeYPLEcx0kH?=
 =?us-ascii?Q?Wgn4rpAkcb1uk0TdwHwQULQVlIqnFCmAeBc8BJh0Eg/hzJoB/PSLuX2NnbR5?=
 =?us-ascii?Q?lugxq/4MInAgz91KR/vpdzdHCD6KxiVwz9swwgbFqX8+BIPoGmkDwvj/BOo1?=
 =?us-ascii?Q?uQPcBbVtWys4DO1T6Cm/f+3mMMtmx+zzGiUT2qFhNDy3Jq2LJ5Je?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986c3d8d-bcc6-4670-0c20-08da4dcb292e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:00:19.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIhn4kkb6o/R0vwCMCYoL9kmWuxUoKQrUvN1tLnCB+CIcZPAtVAktY2vNxc0/sUAYN8LHNO4dIA48/Qj/aK2cTYx5kQQ5mXAnZzA5Dy6Akm+h4n/BrVxXRDFeHlaUcj8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1711
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

This patch adds missing CANFD5_B

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 68b1c1ba2450..5bee4ab2d132 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -299,8 +299,8 @@
 #define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		FM(RX1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_X_N)		FM(CTS1_X_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_X_N)		FM(RTS1_X_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_X_N)		FM(CTS1_X_N)	FM(CANFD5_B_TX)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_X_N)		FM(RTS1_X_N)	FM(CANFD5_B_RX)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		FM(SCK1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -857,10 +857,12 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	MSIOF0_SYNC),
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	HCTS1_X_N),
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CTS1_X_N),
+	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CANFD5_B_TX),
 
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	MSIOF0_TXD),
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	HRTS1_X_N),
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	RTS1_X_N),
+	PINMUX_IPSR_GPSR(IP1SR1_7_4,	CANFD5_B_RX),
 
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	MSIOF0_SCK),
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	HSCK1_X),
@@ -1498,6 +1500,15 @@ static const unsigned int canfd5_data_mux[] = {
 	CANFD5_TX_MARK, CANFD5_RX_MARK,
 };
 
+/* - CANFD5_B ----------------------------------------------------------------- */
+static const unsigned int canfd5_b_data_pins[] = {
+	/* CANFD5_B_TX, CANFD5_B_RX */
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
+};
+static const unsigned int canfd5_b_data_mux[] = {
+	CANFD5_B_TX_MARK, CANFD5_B_RX_MARK,
+};
+
 /* - CANFD6 ----------------------------------------------------------------- */
 static const unsigned int canfd6_data_pins[] = {
 	/* CANFD6_TX, CANFD6_RX */
@@ -2454,6 +2465,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(canfd3_data),
 	SH_PFC_PIN_GROUP(canfd4_data),
 	SH_PFC_PIN_GROUP(canfd5_data),
+	SH_PFC_PIN_GROUP(canfd5_b_data),
 	SH_PFC_PIN_GROUP(canfd6_data),
 	SH_PFC_PIN_GROUP(canfd7_data),
 	SH_PFC_PIN_GROUP(can_clk),
@@ -2650,6 +2662,10 @@ static const char * const canfd5_groups[] = {
 	"canfd5_data",
 };
 
+static const char * const canfd5_b_groups[] = {
+	"canfd5_b_data",
+};
+
 static const char * const canfd6_groups[] = {
 	"canfd6_data",
 };
@@ -2912,6 +2928,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(canfd3),
 	SH_PFC_FUNCTION(canfd4),
 	SH_PFC_FUNCTION(canfd5),
+	SH_PFC_FUNCTION(canfd5_b),
 	SH_PFC_FUNCTION(canfd6),
 	SH_PFC_FUNCTION(canfd7),
 	SH_PFC_FUNCTION(can_clk),
-- 
2.25.1


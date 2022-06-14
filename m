Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAAE54A907
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237867AbiFNF7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238460AbiFNF66 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:58:58 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B271635DCB;
        Mon, 13 Jun 2022 22:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIz4fjAlmJwsqZs0ShBvFzNsRb223kpiK0OiVcSBZH7BeojtQsSrBvHlBQKwV9QCJQmIp3RCmDGCFX1LHT9d4tIF2cTb94JIyPDCuwjKKIqBawi01dpNx77tAT1LXNqTyzANd8CMTHXh5VpGawDDLe/Y3sTnF/zIOK+ztX5ftzTXxZ+zwQPRiM5cmIRtwn5affqvyVHrp9WwHUnd6KdnZMFg2geAKIfci2AEbdYs5UQoi3mdXd2sq8EB4Ih3hYLiZY5IJ9l1rsOKpxRUjuIgl00BHcJE7uX+GcObStl8Wy6V9sdpG4OCB4+K3P7qnC2RODvV+ENeDhok1gzHDjs4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8MkPFNMdSTWJQRO6o3r/G9Y+Cl6w0AYfeHkBb2bhN0=;
 b=j3kRxrOgl/Pa4WZVUujWC2nn1eR85MST5reSQw0zpxfAITQSFovk0j01sN5gBus0pcl63ToTxT4hj5u3QKFtSkfMvj8PQ2+SJpNabeupKx24kk3uWD5ONHZhsUO5XdF7A6Jxb4Cfi93tvyX85pgQT6Uf8cEOb/RbdsBc+vidronNTEUkvk5xOhoOwsRImqf91UxN/FVW7EnvTnaxUziIrOHQ8BdD4GiYzKF8SfTScIlzQGkyDwaFz7T4mCK+vY71UqRHPobIgEeRVGCvfVkish+jyuA2f83xdBE4PNrT3I9zUMP/Hdu/S/hjXSmV5BH7seBvqbDHe7qKiJodkIIxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8MkPFNMdSTWJQRO6o3r/G9Y+Cl6w0AYfeHkBb2bhN0=;
 b=g6/w/+Kq96fTOmVd5RYEfKkme/TT1YGMAt7jobEGfKjNs8ulqPQa6vczzPXpHcW67/NIXV7kNSnKCJeucA5qNwiEpcolKS2GiGN9dAL63EBjOvSCwrJrV53v0avq+aBzVlt9oHSpz4PplghjDBW6f2g37W3QDbKYrpoFBgJRilM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB2611.jpnprd01.prod.outlook.com (2603:1096:604:2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 05:58:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:58:48 +0000
Message-ID: <87y1xzkcq0.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/21] pinctrl: renesas: r8a779g0: Add pins, groups and functions
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:58:48 +0000
X-ClientProxiedBy: TYWPR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a88d003-272d-45c8-7617-08da4dcaf2fc
X-MS-TrafficTypeDiagnostic: OSAPR01MB2611:EE_
X-Microsoft-Antispam-PRVS: <OSAPR01MB261100BC19E952CECC56A2FBD4AA9@OSAPR01MB2611.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jaJRl7eWXkEcRcJYAahEgI9MdUWV9XOre5/mVRGaH/8CReoRXN1XN5+kkurZB4pZWwlF0VcYGj7rmnH1QQ8rpiwmzmJjZl5hAqTe+bXVNm1i/69sUQv9oBEZaZ9BUr8pC9CBshtSaqaBFaRhvBYOKoKyeuXYThaqIJ0AwH8CCpoSmujwFr8YDVlHUpfogU1NvMq0UwQaKLGkjar0etmr+7bf+WJBVnFiNQUtiyNmSHm37WUXLd6bHAWVPg2LS8QbHTGifMCaTLahnG9dlr/MCJo4zE5t3JVskv1Kw6D+gT7XYPgLvKpVCK3QG14+rJXkYUxlAyiWK2sU9RRZEFGBHTpI8dtbu6QYdyxsaeD866++89nTzMYmmpv7a9poiBdHQXK3rh+NFP5uocRdFyiaGJics/mAWKkRY0M+prEQyi8Aa1pi9lczLcep3rDT+pwMEIGmbzfQVoyMRK6znIXXb7TA9SuaDDqHPJwAVfIfz/1Tlmk193lQkJNpRfackTg8C+fVeznlnL9ENyN9zCtmWwUnm69p21TLErzD//+Ecu0qandRrqjMyNGCwuyoMGChmYw5Lry2ZUuzG/j3iwWwV8iLeKkbGjRhNapLx1QQXIwMHiBIsTC0ykw7bX8fh1g75LBO0fndFcPhpAUyzG2vWiTdHvHFaz5F8KcmTihSdz6ZuVrmnDMniLz6yjSVphc553XQExK5hFpOhTplwyo+ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38100700002)(38350700002)(316002)(36756003)(6506007)(52116002)(66946007)(66476007)(66556008)(5660300002)(2906002)(6512007)(508600001)(8936002)(2616005)(6486002)(8676002)(4326008)(83380400001)(30864003)(186003)(86362001)(26005)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJ88QYxAYvnz0J79u3e8MlMUxWX0xDdPCo+TCha0404iYFzXl7CITzIrq279?=
 =?us-ascii?Q?xFr5M+/aZk0AUQDpa7F/ejX0ag78SYJO3Ba+vM7NQzm3HCUSGvkuH3hmR/pm?=
 =?us-ascii?Q?E/nvGBBTI8u9rSkCCTWJIA/fvjFfkWUjLWXJjDYwvCyw+rzKCMMChRl2189b?=
 =?us-ascii?Q?BkLupuuehawuKjzc1fJhQCerhiX3ALSQBWlEHnIqOar8uIZkcY1kLK7wYmv4?=
 =?us-ascii?Q?ZRfofvhmAthkFIF5tE0GJHE2dRyKKCuAD0O2ah1qOf1lrE5AyZg6WEDcHBc2?=
 =?us-ascii?Q?iiLLKuwiVegZex85RSiP+6mdNi2lnmyNshzvvGXK/AacdUyvNyJYCkLTZYzy?=
 =?us-ascii?Q?U3pXD3SXf45ONmH0XegK8lwID6tHWGOhjIsaF4PwUA+Jy9ME4bD9DHmzqYV1?=
 =?us-ascii?Q?AtmfBavkqi0A2YWAVSaqKJrfrdExF8VVgoB7oFqxsCFD47vry3SHXF5rFPet?=
 =?us-ascii?Q?qZyzHSLbeTX9AFIHkuA8OOPKR6vmBeBLYSQiza6FQF1Pho0DSIRLGxuk2aHp?=
 =?us-ascii?Q?IJIhZc0/uEHrq0+YVp4EcMNBwYJn91h7k6qfYhpiKzwisLtt2ADosOuKjhLI?=
 =?us-ascii?Q?3Gm5Be6wLgZlNwVikbbFjGJvRPAw1H3MQsYbOYavDQuQILEchmkbawuqVwur?=
 =?us-ascii?Q?NqID0+4EqlSaUQhyN4gO98dMxXufw9NGqmEp+VEYfXS3cJ/XDjHT2gTz+275?=
 =?us-ascii?Q?QZcPxOd4NIVEM1jWcnkvh4hJ3ZKgpVUM4zE2+MzGZPk7RmKha2nU+6TeqgGR?=
 =?us-ascii?Q?VcsB8SANljt6a3M/fqRdPVF0LNKv/GLFf1Na9xN+MdHgfO9k0hU6Lm1vzP+L?=
 =?us-ascii?Q?ZD0JhJBV6cajipTh6HGrL62ZzzezPQfBacsVqx+CdkqJeYxdbf63INkQzqIX?=
 =?us-ascii?Q?YA82rAN6eAOpzJvbBVxJXgFlHBxychN9Ff6QtLVgA41idtA/luCk8b1V0tfX?=
 =?us-ascii?Q?d6GMMRF9aNkljui6lHH1GZPKktBv2JSqJUwOcbck+Cg0F5/l02VGvUhNnDjL?=
 =?us-ascii?Q?H5OfPEPAPfk2Cbphtc2QIw/ZbrkQbH7+EkaromX5ATtQUhnYjoxQdsYJZoU+?=
 =?us-ascii?Q?wvOTfcsreDV9uu2CH9tPWapaTlyBNQl46GeY2QC/SX7XUKSm6zcE9IDhYaNL?=
 =?us-ascii?Q?2fcTHODxSdPPd/DRix8mb+5M47TNkWCJDvBuSPqvv4F7wuKSwmbNUbhb271H?=
 =?us-ascii?Q?GTvnacOFXqjbgGtLI/QTeiwb+nvnCScI9tHCokF49UraC7qK/WrdJmMLBnmm?=
 =?us-ascii?Q?KrSWwudWpX6rtRh2AqMnXEi+Xz2R2QD3o+1b/aG/tPDC6jyC4LGYp2Cv0/LT?=
 =?us-ascii?Q?rtbUk6VLq0jU4yOc8J0Y7p1REidgAgka/sgZZs6FH1YA3P1vdI5iBUmohBCG?=
 =?us-ascii?Q?+QwqvwtceDHw0aFzY3jV9+BxgXQU+DzwlcrQUHVZsBvw6nrFlcBHG5qrFwW9?=
 =?us-ascii?Q?NnlU3UlFa6Y1uVagFZSEhrIKDgKdmeGDz8QEf1U7ElleVU4G7B2IrZaW8bPI?=
 =?us-ascii?Q?lIE9F+Uwt3Sce0MHk2ZUIM54LGjOYUlU/l5z/zeWwSn0Ey895+Nyj0MaHF+B?=
 =?us-ascii?Q?Q6kp88kQvVJsWsDT5rTly+Rgf0nKMu78tp2jeulRSUub6r7F9FUfFwRqkmPN?=
 =?us-ascii?Q?fYiMXlLArecurcSWKm4C9rPgVP7LEi13/BxHJ0KTfw21wW+yrV35W4Mfry7y?=
 =?us-ascii?Q?zufC9LTGn446m9+o4yw65Aa1GGZfa7VqFaq8353+huuQ98fyhWPWbXoNgf9N?=
 =?us-ascii?Q?EHNR0JwvwBdksooUaxMu99mez0mnY34fZ4WnznGsSSfa6g+iQcAx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a88d003-272d-45c8-7617-08da4dcaf2fc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:58:48.3741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9RQclcG/DLT94+FFeTGlpDX8wbt38PMz2wGrB6lwbKTJr7gZsNMnzrd82m9spYHbPlYRfFDMH8uojQT5GXKgTbL7/e//uQwbPusWE0k/DwScLka1ya61NpJwV+V4Dz0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2611
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Phong Hoang <phong.hoang.wz@renesas.com>

This patch adds SCIF, I2C, EthernetAVB, HSCIF, MMC, QSPI,
MSIOF, PWM, CAN-FD, Ethernet-TSN, PCIe pins, groups, and functions

[Morimoto merged above patches into one, cleanup white space,
 sort modules alphabetically, fixup comments]
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: CongDang <cong.dang.xn@renesas.com>
Signed-off-by: Kazuya Mizuguch <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 1620 +++++++++++++++++++++++-
 1 file changed, 1619 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 5035d45c4202..d42470b54d50 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -1211,12 +1211,1630 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - AVB0 ------------------------------------------------ */
+static const unsigned int avb0_link_pins[] = {
+	/* AVB0_LINK */
+	RCAR_GP_PIN(7, 4),
+};
+static const unsigned int avb0_link_mux[] = {
+	AVB0_LINK_MARK,
+};
+static const unsigned int avb0_magic_pins[] = {
+	/* AVB0_MAGIC */
+	RCAR_GP_PIN(7, 10),
+};
+static const unsigned int avb0_magic_mux[] = {
+	AVB0_MAGIC_MARK,
+};
+static const unsigned int avb0_phy_int_pins[] = {
+	/* AVB0_PHY_INT */
+	RCAR_GP_PIN(7, 5),
+};
+static const unsigned int avb0_phy_int_mux[] = {
+	AVB0_PHY_INT_MARK,
+};
+static const unsigned int avb0_mdio_pins[] = {
+	/* AVB0_MDC, AVB0_MDIO */
+	RCAR_GP_PIN(7, 13), RCAR_GP_PIN(7, 14),
+};
+static const unsigned int avb0_mdio_mux[] = {
+	AVB0_MDC_MARK, AVB0_MDIO_MARK,
+};
+static const unsigned int avb0_rgmii_pins[] = {
+	/*
+	 * AVB0_TX_CTL, AVB0_TXC, AVB0_TD0, AVB0_TD1, AVB0_TD2, AVB0_TD3,
+	 * AVB0_RX_CTL, AVB0_RXC, AVB0_RD0, AVB0_RD1, AVB0_RD2, AVB0_RD3,
+	 */
+	RCAR_GP_PIN(7, 16), RCAR_GP_PIN(7, 15),
+	RCAR_GP_PIN(7, 11), RCAR_GP_PIN(7,  7),
+	RCAR_GP_PIN(7,  6), RCAR_GP_PIN(7,  3),
+	RCAR_GP_PIN(7, 20), RCAR_GP_PIN(7, 19),
+	RCAR_GP_PIN(7, 18), RCAR_GP_PIN(7, 17),
+	RCAR_GP_PIN(7, 12), RCAR_GP_PIN(7,  8),
+};
+static const unsigned int avb0_rgmii_mux[] = {
+	AVB0_TX_CTL_MARK,	AVB0_TXC_MARK,
+	AVB0_TD0_MARK,		AVB0_TD1_MARK,
+	AVB0_TD2_MARK,		AVB0_TD3_MARK,
+	AVB0_RX_CTL_MARK,	AVB0_RXC_MARK,
+	AVB0_RD0_MARK,		AVB0_RD1_MARK,
+	AVB0_RD2_MARK,		AVB0_RD3_MARK,
+};
+static const unsigned int avb0_txcrefclk_pins[] = {
+	/* AVB0_TXCREFCLK */
+	RCAR_GP_PIN(7, 9),
+};
+static const unsigned int avb0_txcrefclk_mux[] = {
+	AVB0_TXCREFCLK_MARK,
+};
+static const unsigned int avb0_avtp_pps_pins[] = {
+	/* AVB0_AVTP_PPS */
+	RCAR_GP_PIN(7, 0),
+};
+static const unsigned int avb0_avtp_pps_mux[] = {
+	AVB0_AVTP_PPS_MARK,
+};
+static const unsigned int avb0_avtp_capture_pins[] = {
+	/* AVB0_AVTP_CAPTURE */
+	RCAR_GP_PIN(7, 1),
+};
+static const unsigned int avb0_avtp_capture_mux[] = {
+	AVB0_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb0_avtp_match_pins[] = {
+	/* AVB0_AVTP_MATCH */
+	RCAR_GP_PIN(7, 2),
+};
+static const unsigned int avb0_avtp_match_mux[] = {
+	AVB0_AVTP_MATCH_MARK,
+};
+
+/* - AVB1 ------------------------------------------------ */
+static const unsigned int avb1_link_pins[] = {
+	/* AVB1_LINK */
+	RCAR_GP_PIN(6, 4),
+};
+static const unsigned int avb1_link_mux[] = {
+	AVB1_LINK_MARK,
+};
+static const unsigned int avb1_magic_pins[] = {
+	/* AVB1_MAGIC */
+	RCAR_GP_PIN(6, 1),
+};
+static const unsigned int avb1_magic_mux[] = {
+	AVB1_MAGIC_MARK,
+};
+static const unsigned int avb1_phy_int_pins[] = {
+	/* AVB1_PHY_INT */
+	RCAR_GP_PIN(6, 3),
+};
+static const unsigned int avb1_phy_int_mux[] = {
+	AVB1_PHY_INT_MARK,
+};
+static const unsigned int avb1_mdio_pins[] = {
+	/* AVB1_MDC, AVB1_MDIO */
+	RCAR_GP_PIN(6, 2), RCAR_GP_PIN(6, 0),
+};
+static const unsigned int avb1_mdio_mux[] = {
+	AVB1_MDC_MARK, AVB1_MDIO_MARK,
+};
+static const unsigned int avb1_rgmii_pins[] = {
+	/*
+	 * AVB1_TX_CTL, AVB1_TXC, AVB1_TD0, AVB1_TD1, AVB1_TD2, AVB1_TD3,
+	 * AVB1_RX_CTL, AVB1_RXC, AVB1_RD0, AVB1_RD1, AVB1_RD2, AVB1_RD3,
+	 */
+	RCAR_GP_PIN(6,  7), RCAR_GP_PIN(6,  6),
+	RCAR_GP_PIN(6, 13), RCAR_GP_PIN(6, 12),
+	RCAR_GP_PIN(6, 16), RCAR_GP_PIN(6, 18),
+	RCAR_GP_PIN(6,  9), RCAR_GP_PIN(6,  8),
+	RCAR_GP_PIN(6, 15), RCAR_GP_PIN(6, 14),
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 19),
+};
+static const unsigned int avb1_rgmii_mux[] = {
+	AVB1_TX_CTL_MARK,	AVB1_TXC_MARK,
+	AVB1_TD0_MARK,		AVB1_TD1_MARK,
+	AVB1_TD2_MARK,		AVB1_TD3_MARK,
+	AVB1_RX_CTL_MARK,	AVB1_RXC_MARK,
+	AVB1_RD0_MARK,		AVB1_RD1_MARK,
+	AVB1_RD2_MARK,		AVB1_RD3_MARK,
+};
+static const unsigned int avb1_txcrefclk_pins[] = {
+	/* AVB1_TXCREFCLK */
+	RCAR_GP_PIN(6, 20),
+};
+static const unsigned int avb1_txcrefclk_mux[] = {
+	AVB1_TXCREFCLK_MARK,
+};
+static const unsigned int avb1_avtp_pps_pins[] = {
+	/* AVB1_AVTP_PPS */
+	RCAR_GP_PIN(6, 10),
+};
+static const unsigned int avb1_avtp_pps_mux[] = {
+	AVB1_AVTP_PPS_MARK,
+};
+static const unsigned int avb1_avtp_capture_pins[] = {
+	/* AVB1_AVTP_CAPTURE */
+	RCAR_GP_PIN(6, 11),
+};
+static const unsigned int avb1_avtp_capture_mux[] = {
+	AVB1_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb1_avtp_match_pins[] = {
+	/* AVB1_AVTP_MATCH */
+	RCAR_GP_PIN(6, 5),
+};
+static const unsigned int avb1_avtp_match_mux[] = {
+	AVB1_AVTP_MATCH_MARK,
+};
+
+/* - AVB2 ------------------------------------------------ */
+static const unsigned int avb2_link_pins[] = {
+	/* AVB2_LINK */
+	RCAR_GP_PIN(5, 3),
+};
+static const unsigned int avb2_link_mux[] = {
+	AVB2_LINK_MARK,
+};
+static const unsigned int avb2_magic_pins[] = {
+	/* AVB2_MAGIC */
+	RCAR_GP_PIN(5, 5),
+};
+static const unsigned int avb2_magic_mux[] = {
+	AVB2_MAGIC_MARK,
+};
+static const unsigned int avb2_phy_int_pins[] = {
+	/* AVB2_PHY_INT */
+	RCAR_GP_PIN(5, 4),
+};
+static const unsigned int avb2_phy_int_mux[] = {
+	AVB2_PHY_INT_MARK,
+};
+static const unsigned int avb2_mdio_pins[] = {
+	/* AVB2_MDC, AVB2_MDIO */
+	RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 10),
+};
+static const unsigned int avb2_mdio_mux[] = {
+	AVB2_MDC_MARK, AVB2_MDIO_MARK,
+};
+static const unsigned int avb2_rgmii_pins[] = {
+	/*
+	 * AVB2_TX_CTL, AVB2_TXC, AVB2_TD0, AVB2_TD1, AVB2_TD2, AVB2_TD3,
+	 * AVB2_RX_CTL, AVB2_RXC, AVB2_RD0, AVB2_RD1, AVB2_RD2, AVB2_RD3,
+	 */
+	RCAR_GP_PIN(5, 19), RCAR_GP_PIN(5, 16),
+	RCAR_GP_PIN(5, 15), RCAR_GP_PIN(5, 12),
+	RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5,  8),
+	RCAR_GP_PIN(5, 20), RCAR_GP_PIN(5, 18),
+	RCAR_GP_PIN(5, 17), RCAR_GP_PIN(5, 14),
+	RCAR_GP_PIN(5, 13), RCAR_GP_PIN(5,  9),
+};
+static const unsigned int avb2_rgmii_mux[] = {
+	AVB2_TX_CTL_MARK,	AVB2_TXC_MARK,
+	AVB2_TD0_MARK,		AVB2_TD1_MARK,
+	AVB2_TD2_MARK,		AVB2_TD3_MARK,
+	AVB2_RX_CTL_MARK,	AVB2_RXC_MARK,
+	AVB2_RD0_MARK,		AVB2_RD1_MARK,
+	AVB2_RD2_MARK,		AVB2_RD3_MARK,
+};
+static const unsigned int avb2_txcrefclk_pins[] = {
+	/* AVB2_TXCREFCLK */
+	RCAR_GP_PIN(5, 7),
+};
+static const unsigned int avb2_txcrefclk_mux[] = {
+	AVB2_TXCREFCLK_MARK,
+};
+static const unsigned int avb2_avtp_pps_pins[] = {
+	/* AVB2_AVTP_PPS */
+	RCAR_GP_PIN(5, 0),
+};
+static const unsigned int avb2_avtp_pps_mux[] = {
+	AVB2_AVTP_PPS_MARK,
+};
+static const unsigned int avb2_avtp_capture_pins[] = {
+	/* AVB2_AVTP_CAPTURE */
+	RCAR_GP_PIN(5, 1),
+};
+static const unsigned int avb2_avtp_capture_mux[] = {
+	AVB2_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb2_avtp_match_pins[] = {
+	/* AVB2_AVTP_MATCH */
+	RCAR_GP_PIN(5, 2),
+};
+static const unsigned int avb2_avtp_match_mux[] = {
+	AVB2_AVTP_MATCH_MARK,
+};
+
+/* - CANFD0 ----------------------------------------------------------------- */
+static const unsigned int canfd0_data_pins[] = {
+	/* CANFD0_TX, CANFD0_RX */
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+};
+static const unsigned int canfd0_data_mux[] = {
+	CANFD0_TX_MARK, CANFD0_RX_MARK,
+};
+
+/* - CANFD1 ----------------------------------------------------------------- */
+static const unsigned int canfd1_data_pins[] = {
+	/* CANFD1_TX, CANFD1_RX */
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+};
+static const unsigned int canfd1_data_mux[] = {
+	CANFD1_TX_MARK, CANFD1_RX_MARK,
+};
+
+/* - CANFD2 ----------------------------------------------------------------- */
+static const unsigned int canfd2_data_pins[] = {
+	/* CANFD2_TX, CANFD2_RX */
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+};
+static const unsigned int canfd2_data_mux[] = {
+	CANFD2_TX_MARK, CANFD2_RX_MARK,
+};
+
+/* - CANFD3 ----------------------------------------------------------------- */
+static const unsigned int canfd3_data_pins[] = {
+	/* CANFD3_TX, CANFD3_RX */
+	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
+};
+static const unsigned int canfd3_data_mux[] = {
+	CANFD3_TX_MARK, CANFD3_RX_MARK,
+};
+
+/* - CANFD4 ----------------------------------------------------------------- */
+static const unsigned int canfd4_data_pins[] = {
+	/* CANFD4_TX, CANFD4_RX */
+	RCAR_GP_PIN(2, 16), RCAR_GP_PIN(2, 17),
+};
+static const unsigned int canfd4_data_mux[] = {
+	CANFD4_TX_MARK, CANFD4_RX_MARK,
+};
+
+/* - CANFD5 ----------------------------------------------------------------- */
+static const unsigned int canfd5_data_pins[] = {
+	/* CANFD5_TX, CANFD5_RX */
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+};
+static const unsigned int canfd5_data_mux[] = {
+	CANFD5_TX_MARK, CANFD5_RX_MARK,
+};
+
+/* - CANFD6 ----------------------------------------------------------------- */
+static const unsigned int canfd6_data_pins[] = {
+	/* CANFD6_TX, CANFD6_RX */
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+};
+static const unsigned int canfd6_data_mux[] = {
+	CANFD6_TX_MARK, CANFD6_RX_MARK,
+};
+
+/* - CANFD7 ----------------------------------------------------------------- */
+static const unsigned int canfd7_data_pins[] = {
+	/* CANFD7_TX, CANFD7_RX */
+	RCAR_GP_PIN(2, 18), RCAR_GP_PIN(2, 19),
+};
+static const unsigned int canfd7_data_mux[] = {
+	CANFD7_TX_MARK, CANFD7_RX_MARK,
+};
+
+/* - CANFD Clock ------------------------------------------------------------ */
+static const unsigned int can_clk_pins[] = {
+	/* CAN_CLK */
+	RCAR_GP_PIN(2, 9),
+};
+static const unsigned int can_clk_mux[] = {
+	CAN_CLK_MARK,
+};
+
+/* - HSCIF0 ----------------------------------------------------------------- */
+static const unsigned int hscif0_data_pins[] = {
+	/* HRX0, HTX0 */
+	RCAR_GP_PIN(1, 16), RCAR_GP_PIN(1, 12),
+};
+static const unsigned int hscif0_data_mux[] = {
+	HRX0_MARK, HTX0_MARK,
+};
+static const unsigned int hscif0_clk_pins[] = {
+	/* HSCK0 */
+	RCAR_GP_PIN(1, 15),
+};
+static const unsigned int hscif0_clk_mux[] = {
+	HSCK0_MARK,
+};
+static const unsigned int hscif0_ctrl_pins[] = {
+	/* HRTS0#, HCTS0# */
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
+};
+static const unsigned int hscif0_ctrl_mux[] = {
+	HRTS0_N_MARK, HCTS0_N_MARK,
+};
+
+/* - HSCIF1 ----------------------------------------------------------------- */
+static const unsigned int hscif1_data_pins[] = {
+	/* HRX1, HTX1 */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
+};
+static const unsigned int hscif1_data_mux[] = {
+	HRX1_MARK, HTX1_MARK,
+};
+static const unsigned int hscif1_clk_pins[] = {
+	/* HSCK1 */
+	RCAR_GP_PIN(0, 18),
+};
+static const unsigned int hscif1_clk_mux[] = {
+	HSCK1_MARK,
+};
+static const unsigned int hscif1_ctrl_pins[] = {
+	/* HRTS1#, HCTS1# */
+	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16),
+};
+static const unsigned int hscif1_ctrl_mux[] = {
+	HRTS1_N_MARK, HCTS1_N_MARK,
+};
+
+/* - HSCIF2 ----------------------------------------------------------------- */
+static const unsigned int hscif2_data_pins[] = {
+	/* HRX2, HTX2 */
+	RCAR_GP_PIN(8, 8), RCAR_GP_PIN(8, 9),
+};
+static const unsigned int hscif2_data_mux[] = {
+	HRX2_MARK, HTX2_MARK,
+};
+static const unsigned int hscif2_clk_pins[] = {
+	/* HSCK2 */
+	RCAR_GP_PIN(8, 13),
+};
+static const unsigned int hscif2_clk_mux[] = {
+	HSCK2_MARK,
+};
+static const unsigned int hscif2_ctrl_pins[] = {
+	/* HRTS2#, HCTS2# */
+	RCAR_GP_PIN(8, 10), RCAR_GP_PIN(8, 12),
+};
+static const unsigned int hscif2_ctrl_mux[] = {
+	HRTS2_N_MARK, HCTS2_N_MARK,
+};
+
+/* - HSCIF3 ----------------------------------------------------------------- */
+static const unsigned int hscif3_data_pins[] = {
+	/* HRX3, HTX3 */
+	RCAR_GP_PIN(1, 24), RCAR_GP_PIN(1, 28),
+};
+static const unsigned int hscif3_data_mux[] = {
+	HRX3_MARK, HTX3_MARK,
+};
+static const unsigned int hscif3_clk_pins[] = {
+	/* HSCK3 */
+	RCAR_GP_PIN(1, 25),
+};
+static const unsigned int hscif3_clk_mux[] = {
+	HSCK3_MARK,
+};
+static const unsigned int hscif3_ctrl_pins[] = {
+	/* HRTS3#, HCTS3# */
+	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 27),
+};
+static const unsigned int hscif3_ctrl_mux[] = {
+	HRTS3_N_MARK, HCTS3_N_MARK,
+};
+
+/* - I2C0 ------------------------------------------------------------------- */
+static const unsigned int i2c0_pins[] = {
+	/* SDA0, SCL0 */
+	RCAR_GP_PIN(8, 1), RCAR_GP_PIN(8, 0),
+};
+static const unsigned int i2c0_mux[] = {
+	SDA0_MARK, SCL0_MARK,
+};
+
+/* - I2C1 ------------------------------------------------------------------- */
+static const unsigned int i2c1_pins[] = {
+	/* SDA1, SCL1 */
+	RCAR_GP_PIN(8, 3), RCAR_GP_PIN(8, 2),
+};
+static const unsigned int i2c1_mux[] = {
+	SDA1_MARK, SCL1_MARK,
+};
+
+/* - I2C2 ------------------------------------------------------------------- */
+static const unsigned int i2c2_pins[] = {
+	/* SDA2, SCL2 */
+	RCAR_GP_PIN(8, 5), RCAR_GP_PIN(8, 4),
+};
+static const unsigned int i2c2_mux[] = {
+	SDA2_MARK, SCL2_MARK,
+};
+
+/* - I2C3 ------------------------------------------------------------------- */
+static const unsigned int i2c3_pins[] = {
+	/* SDA3, SCL3 */
+	RCAR_GP_PIN(8, 7), RCAR_GP_PIN(8, 6),
+};
+static const unsigned int i2c3_mux[] = {
+	SDA3_MARK, SCL3_MARK,
+};
+
+/* - I2C4 ------------------------------------------------------------------- */
+static const unsigned int i2c4_pins[] = {
+	/* SDA4, SCL4 */
+	RCAR_GP_PIN(8, 9), RCAR_GP_PIN(8, 8),
+};
+static const unsigned int i2c4_mux[] = {
+	SDA4_MARK, SCL4_MARK,
+};
+
+/* - I2C5 ------------------------------------------------------------------- */
+static const unsigned int i2c5_pins[] = {
+	/* SDA5, SCL5 */
+	RCAR_GP_PIN(8, 11), RCAR_GP_PIN(8, 10),
+};
+static const unsigned int i2c5_mux[] = {
+	SDA5_MARK, SCL5_MARK,
+};
+
+/* - MMC -------------------------------------------------------------------- */
+static const unsigned int mmc_data_pins[] = {
+	/* MMC_SD_D[0:3], MMC_D[4:7] */
+	RCAR_GP_PIN(3, 1), RCAR_GP_PIN(3, 0),
+	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 5),
+	RCAR_GP_PIN(3, 7), RCAR_GP_PIN(3, 6),
+	RCAR_GP_PIN(3, 9), RCAR_GP_PIN(3, 8),
+};
+static const unsigned int mmc_data_mux[] = {
+	MMC_SD_D0_MARK, MMC_SD_D1_MARK,
+	MMC_SD_D2_MARK, MMC_SD_D3_MARK,
+	MMC_D4_MARK, MMC_D5_MARK,
+	MMC_D6_MARK, MMC_D7_MARK,
+};
+static const unsigned int mmc_ctrl_pins[] = {
+	/* MMC_SD_CLK, MMC_SD_CMD */
+	RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 10),
+};
+static const unsigned int mmc_ctrl_mux[] = {
+	MMC_SD_CLK_MARK, MMC_SD_CMD_MARK,
+};
+static const unsigned int mmc_cd_pins[] = {
+	/* SD_CD */
+	RCAR_GP_PIN(3, 11),
+};
+static const unsigned int mmc_cd_mux[] = {
+	SD_CD_MARK,
+};
+static const unsigned int mmc_wp_pins[] = {
+	/* SD_WP */
+	RCAR_GP_PIN(3, 12),
+};
+static const unsigned int mmc_wp_mux[] = {
+	SD_WP_MARK,
+};
+static const unsigned int mmc_ds_pins[] = {
+	/* MMC_DS */
+	RCAR_GP_PIN(3, 4),
+};
+static const unsigned int mmc_ds_mux[] = {
+	MMC_DS_MARK,
+};
+
+/* - MSIOF0 ----------------------------------------------------------------- */
+static const unsigned int msiof0_clk_pins[] = {
+	/* MSIOF0_SCK */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int msiof0_clk_mux[] = {
+	MSIOF0_SCK_MARK,
+};
+static const unsigned int msiof0_sync_pins[] = {
+	/* MSIOF0_SYNC */
+	RCAR_GP_PIN(1, 8),
+};
+static const unsigned int msiof0_sync_mux[] = {
+	MSIOF0_SYNC_MARK,
+};
+static const unsigned int msiof0_ss1_pins[] = {
+	/* MSIOF0_SS1 */
+	RCAR_GP_PIN(1, 7),
+};
+static const unsigned int msiof0_ss1_mux[] = {
+	MSIOF0_SS1_MARK,
+};
+static const unsigned int msiof0_ss2_pins[] = {
+	/* MSIOF0_SS2 */
+	RCAR_GP_PIN(1, 6),
+};
+static const unsigned int msiof0_ss2_mux[] = {
+	MSIOF0_SS2_MARK,
+};
+static const unsigned int msiof0_txd_pins[] = {
+	/* MSIOF0_TXD */
+	RCAR_GP_PIN(1, 9),
+};
+static const unsigned int msiof0_txd_mux[] = {
+	MSIOF0_TXD_MARK,
+};
+static const unsigned int msiof0_rxd_pins[] = {
+	/* MSIOF0_RXD */
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int msiof0_rxd_mux[] = {
+	MSIOF0_RXD_MARK,
+};
+
+/* - MSIOF1 ----------------------------------------------------------------- */
+static const unsigned int msiof1_clk_pins[] = {
+	/* MSIOF1_SCK */
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int msiof1_clk_mux[] = {
+	MSIOF1_SCK_MARK,
+};
+static const unsigned int msiof1_sync_pins[] = {
+	/* MSIOF1_SYNC */
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int msiof1_sync_mux[] = {
+	MSIOF1_SYNC_MARK,
+};
+static const unsigned int msiof1_ss1_pins[] = {
+	/* MSIOF1_SS1 */
+	RCAR_GP_PIN(1, 1),
+};
+static const unsigned int msiof1_ss1_mux[] = {
+	MSIOF1_SS1_MARK,
+};
+static const unsigned int msiof1_ss2_pins[] = {
+	/* MSIOF1_SS2 */
+	RCAR_GP_PIN(1, 0),
+};
+static const unsigned int msiof1_ss2_mux[] = {
+	MSIOF1_SS2_MARK,
+};
+static const unsigned int msiof1_txd_pins[] = {
+	/* MSIOF1_TXD */
+	RCAR_GP_PIN(1, 4),
+};
+static const unsigned int msiof1_txd_mux[] = {
+	MSIOF1_TXD_MARK,
+};
+static const unsigned int msiof1_rxd_pins[] = {
+	/* MSIOF1_RXD */
+	RCAR_GP_PIN(1, 5),
+};
+static const unsigned int msiof1_rxd_mux[] = {
+	MSIOF1_RXD_MARK,
+};
+
+/* - MSIOF2 ----------------------------------------------------------------- */
+static const unsigned int msiof2_clk_pins[] = {
+	/* MSIOF2_SCK */
+	RCAR_GP_PIN(0, 17),
+};
+static const unsigned int msiof2_clk_mux[] = {
+	MSIOF2_SCK_MARK,
+};
+static const unsigned int msiof2_sync_pins[] = {
+	/* MSIOF2_SYNC */
+	RCAR_GP_PIN(0, 15),
+};
+static const unsigned int msiof2_sync_mux[] = {
+	MSIOF2_SYNC_MARK,
+};
+static const unsigned int msiof2_ss1_pins[] = {
+	/* MSIOF2_SS1 */
+	RCAR_GP_PIN(0, 14),
+};
+static const unsigned int msiof2_ss1_mux[] = {
+	MSIOF2_SS1_MARK,
+};
+static const unsigned int msiof2_ss2_pins[] = {
+	/* MSIOF2_SS2 */
+	RCAR_GP_PIN(0, 13),
+};
+static const unsigned int msiof2_ss2_mux[] = {
+	MSIOF2_SS2_MARK,
+};
+static const unsigned int msiof2_txd_pins[] = {
+	/* MSIOF2_TXD */
+	RCAR_GP_PIN(0, 16),
+};
+static const unsigned int msiof2_txd_mux[] = {
+	MSIOF2_TXD_MARK,
+};
+static const unsigned int msiof2_rxd_pins[] = {
+	/* MSIOF2_RXD */
+	RCAR_GP_PIN(0, 18),
+};
+static const unsigned int msiof2_rxd_mux[] = {
+	MSIOF2_RXD_MARK,
+};
+
+/* - MSIOF3 ----------------------------------------------------------------- */
+static const unsigned int msiof3_clk_pins[] = {
+	/* MSIOF3_SCK */
+	RCAR_GP_PIN(0, 3),
+};
+static const unsigned int msiof3_clk_mux[] = {
+	MSIOF3_SCK_MARK,
+};
+static const unsigned int msiof3_sync_pins[] = {
+	/* MSIOF3_SYNC */
+	RCAR_GP_PIN(0, 6),
+};
+static const unsigned int msiof3_sync_mux[] = {
+	MSIOF3_SYNC_MARK,
+};
+static const unsigned int msiof3_ss1_pins[] = {
+	/* MSIOF3_SS1 */
+	RCAR_GP_PIN(0, 1),
+};
+static const unsigned int msiof3_ss1_mux[] = {
+	MSIOF3_SS1_MARK,
+};
+static const unsigned int msiof3_ss2_pins[] = {
+	/* MSIOF3_SS2 */
+	RCAR_GP_PIN(0, 2),
+};
+static const unsigned int msiof3_ss2_mux[] = {
+	MSIOF3_SS2_MARK,
+};
+static const unsigned int msiof3_txd_pins[] = {
+	/* MSIOF3_TXD */
+	RCAR_GP_PIN(0, 4),
+};
+static const unsigned int msiof3_txd_mux[] = {
+	MSIOF3_TXD_MARK,
+};
+static const unsigned int msiof3_rxd_pins[] = {
+	/* MSIOF3_RXD */
+	RCAR_GP_PIN(0, 5),
+};
+static const unsigned int msiof3_rxd_mux[] = {
+	MSIOF3_RXD_MARK,
+};
+
+/* - MSIOF4 ----------------------------------------------------------------- */
+static const unsigned int msiof4_clk_pins[] = {
+	/* MSIOF4_SCK */
+	RCAR_GP_PIN(1, 25),
+};
+static const unsigned int msiof4_clk_mux[] = {
+	MSIOF4_SCK_MARK,
+};
+static const unsigned int msiof4_sync_pins[] = {
+	/* MSIOF4_SYNC */
+	RCAR_GP_PIN(1, 28),
+};
+static const unsigned int msiof4_sync_mux[] = {
+	MSIOF4_SYNC_MARK,
+};
+static const unsigned int msiof4_ss1_pins[] = {
+	/* MSIOF4_SS1 */
+	RCAR_GP_PIN(1, 23),
+};
+static const unsigned int msiof4_ss1_mux[] = {
+	MSIOF4_SS1_MARK,
+};
+static const unsigned int msiof4_ss2_pins[] = {
+	/* MSIOF4_SS2 */
+	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int msiof4_ss2_mux[] = {
+	MSIOF4_SS2_MARK,
+};
+static const unsigned int msiof4_txd_pins[] = {
+	/* MSIOF4_TXD */
+	RCAR_GP_PIN(1, 26),
+};
+static const unsigned int msiof4_txd_mux[] = {
+	MSIOF4_TXD_MARK,
+};
+static const unsigned int msiof4_rxd_pins[] = {
+	/* MSIOF4_RXD */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int msiof4_rxd_mux[] = {
+	MSIOF4_RXD_MARK,
+};
+
+/* - MSIOF5 ----------------------------------------------------------------- */
+static const unsigned int msiof5_clk_pins[] = {
+	/* MSIOF5_SCK */
+	RCAR_GP_PIN(0, 11),
+};
+static const unsigned int msiof5_clk_mux[] = {
+	MSIOF5_SCK_MARK,
+};
+static const unsigned int msiof5_sync_pins[] = {
+	/* MSIOF5_SYNC */
+	RCAR_GP_PIN(0, 9),
+};
+static const unsigned int msiof5_sync_mux[] = {
+	MSIOF5_SYNC_MARK,
+};
+static const unsigned int msiof5_ss1_pins[] = {
+	/* MSIOF5_SS1 */
+	RCAR_GP_PIN(0, 8),
+};
+static const unsigned int msiof5_ss1_mux[] = {
+	MSIOF5_SS1_MARK,
+};
+static const unsigned int msiof5_ss2_pins[] = {
+	/* MSIOF5_SS2 */
+	RCAR_GP_PIN(0, 7),
+};
+static const unsigned int msiof5_ss2_mux[] = {
+	MSIOF5_SS2_MARK,
+};
+static const unsigned int msiof5_txd_pins[] = {
+	/* MSIOF5_TXD */
+	RCAR_GP_PIN(0, 10),
+};
+static const unsigned int msiof5_txd_mux[] = {
+	MSIOF5_TXD_MARK,
+};
+static const unsigned int msiof5_rxd_pins[] = {
+	/* MSIOF5_RXD */
+	RCAR_GP_PIN(0, 12),
+};
+static const unsigned int msiof5_rxd_mux[] = {
+	MSIOF5_RXD_MARK,
+};
+
+/* - PCIE ------------------------------------------------------------------- */
+static const unsigned int pcie0_clkreq_n_pins[] = {
+	/* PCIE0_CLKREQ# */
+	RCAR_GP_PIN(4, 21),
+};
+
+static const unsigned int pcie0_clkreq_n_mux[] = {
+	PCIE0_CLKREQ_N_MARK,
+};
+
+static const unsigned int pcie1_clkreq_n_pins[] = {
+	/* PCIE1_CLKREQ# */
+	RCAR_GP_PIN(4, 22),
+};
+
+static const unsigned int pcie1_clkreq_n_mux[] = {
+	PCIE1_CLKREQ_N_MARK,
+};
+
+/* - PWM0 ------------------------------------------------------------------- */
+static const unsigned int pwm0_pins[] = {
+	/* PWM0 */
+	RCAR_GP_PIN(1, 15),
+};
+static const unsigned int pwm0_mux[] = {
+	PWM0_MARK,
+};
+
+/* - PWM1 ------------------------------------------------------------------- */
+static const unsigned int pwm1_pins[] = {
+	/* PWM1 */
+	RCAR_GP_PIN(2, 13),
+};
+static const unsigned int pwm1_mux[] = {
+	PWM1_MARK,
+};
+
+/* - PWM2 ------------------------------------------------------------------- */
+static const unsigned int pwm2_pins[] = {
+	/* PWM2 */
+	RCAR_GP_PIN(2, 14),
+};
+static const unsigned int pwm2_mux[] = {
+	PWM2_MARK,
+};
+
+/* - PWM3 ------------------------------------------------------------------- */
+static const unsigned int pwm3_pins[] = {
+	/* PWM3 */
+	RCAR_GP_PIN(1, 22),
+};
+static const unsigned int pwm3_mux[] = {
+	PWM3_MARK,
+};
+
+/* - PWM4 ------------------------------------------------------------------- */
+static const unsigned int pwm4_pins[] = {
+	/* PWM4 */
+	RCAR_GP_PIN(2, 16),
+};
+static const unsigned int pwm4_mux[] = {
+	PWM4_MARK,
+};
+
+/* - PWM5 ------------------------------------------------------------------- */
+static const unsigned int pwm5_pins[] = {
+	/* PWM5 */
+	RCAR_GP_PIN(2, 17),
+};
+static const unsigned int pwm5_mux[] = {
+	PWM5_MARK,
+};
+
+/* - PWM6 ------------------------------------------------------------------- */
+static const unsigned int pwm6_pins[] = {
+	/* PWM6 */
+	RCAR_GP_PIN(2, 18),
+};
+static const unsigned int pwm6_mux[] = {
+	PWM6_MARK,
+};
+
+/* - PWM7 ------------------------------------------------------------------- */
+static const unsigned int pwm7_pins[] = {
+	/* PWM7 */
+	RCAR_GP_PIN(2, 19),
+};
+static const unsigned int pwm7_mux[] = {
+	PWM7_MARK,
+};
+
+/* - PWM8 ------------------------------------------------------------------- */
+static const unsigned int pwm8_pins[] = {
+	/* PWM8 */
+	RCAR_GP_PIN(1, 13),
+};
+static const unsigned int pwm8_mux[] = {
+	PWM8_MARK,
+};
+
+/* - PWM9 ------------------------------------------------------------------- */
+static const unsigned int pwm9_pins[] = {
+	/* PWM9 */
+	RCAR_GP_PIN(1, 14),
+};
+static const unsigned int pwm9_mux[] = {
+	PWM9_MARK,
+};
+
+/* - QSPI0 ------------------------------------------------------------------ */
+static const unsigned int qspi0_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(3, 20), RCAR_GP_PIN(3, 15),
+};
+static const unsigned int qspi0_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+static const unsigned int qspi0_data_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(3, 19), RCAR_GP_PIN(3, 18),
+	RCAR_GP_PIN(3, 17), RCAR_GP_PIN(3, 16),
+};
+static const unsigned int qspi0_data_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK
+};
+
+/* - QSPI1 ------------------------------------------------------------------ */
+static const unsigned int qspi1_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(3, 22), RCAR_GP_PIN(3, 25),
+};
+static const unsigned int qspi1_ctrl_mux[] = {
+	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int qspi1_data_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(3, 21), RCAR_GP_PIN(3, 23),
+	RCAR_GP_PIN(3, 24), RCAR_GP_PIN(3, 26),
+};
+static const unsigned int qspi1_data_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK
+};
+
+/* - SCIF0 ------------------------------------------------------------------ */
+static const unsigned int scif0_data_pins[] = {
+	/* RX0, TX0 */
+	RCAR_GP_PIN(1, 16), RCAR_GP_PIN(1, 12),
+};
+static const unsigned int scif0_data_mux[] = {
+	RX0_MARK, TX0_MARK,
+};
+static const unsigned int scif0_clk_pins[] = {
+	/* SCK0 */
+	RCAR_GP_PIN(1, 15),
+};
+static const unsigned int scif0_clk_mux[] = {
+	SCK0_MARK,
+};
+static const unsigned int scif0_ctrl_pins[] = {
+	/* RTS0#, CTS0# */
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
+};
+static const unsigned int scif0_ctrl_mux[] = {
+	RTS0_N_MARK, CTS0_N_MARK,
+};
+
+/* - SCIF1 ------------------------------------------------------------------ */
+static const unsigned int scif1_data_pins[] = {
+	/* RX1, TX1 */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
+};
+static const unsigned int scif1_data_mux[] = {
+	RX1_MARK, TX1_MARK,
+};
+static const unsigned int scif1_clk_pins[] = {
+	/* SCK1 */
+	RCAR_GP_PIN(0, 18),
+};
+static const unsigned int scif1_clk_mux[] = {
+	SCK1_MARK,
+};
+static const unsigned int scif1_ctrl_pins[] = {
+	/* RTS1_N, CTS1_N */
+	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16),
+};
+static const unsigned int scif1_ctrl_mux[] = {
+	RTS1_N_MARK, CTS1_N_MARK,
+};
+
+/* - SCIF3 ------------------------------------------------------------------ */
+static const unsigned int scif3_data_pins[] = {
+	/* RX3, TX3 */
+	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 0),
+};
+static const unsigned int scif3_data_mux[] = {
+	RX3_MARK, TX3_MARK,
+};
+static const unsigned int scif3_clk_pins[] = {
+	/* SCK3 */
+	RCAR_GP_PIN(1, 4),
+};
+static const unsigned int scif3_clk_mux[] = {
+	SCK3_MARK,
+};
+static const unsigned int scif3_ctrl_pins[] = {
+	/* RTS3_N, CTS3_N */
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+};
+static const unsigned int scif3_ctrl_mux[] = {
+	RTS3_N_MARK, CTS3_N_MARK,
+};
+
+/* - SCIF4 ------------------------------------------------------------------ */
+static const unsigned int scif4_data_pins[] = {
+	/* RX4, TX4 */
+	RCAR_GP_PIN(8, 13), RCAR_GP_PIN(8, 12),
+};
+static const unsigned int scif4_data_mux[] = {
+	RX4_MARK, TX4_MARK,
+};
+static const unsigned int scif4_clk_pins[] = {
+	/* SCK4 */
+	RCAR_GP_PIN(8, 8),
+};
+static const unsigned int scif4_clk_mux[] = {
+	SCK4_MARK,
+};
+static const unsigned int scif4_ctrl_pins[] = {
+	/* RTS4#, CTS4# */
+	RCAR_GP_PIN(8, 10), RCAR_GP_PIN(8, 9),
+};
+static const unsigned int scif4_ctrl_mux[] = {
+	RTS4_N_MARK, CTS4_N_MARK,
+};
+
+/* - SCIF Clock ------------------------------------------------------------- */
+static const unsigned int scif_clk_pins[] = {
+	/* SCIF_CLK */
+	RCAR_GP_PIN(1, 17),
+};
+static const unsigned int scif_clk_mux[] = {
+	SCIF_CLK_MARK,
+};
+
+/* - TPU ------------------------------------------------------------------- */
+static const unsigned int tpu_to0_pins[] = {
+	/* TPU0TO0 */
+	RCAR_GP_PIN(2, 8),
+};
+static const unsigned int tpu_to0_mux[] = {
+	TPU0TO0_MARK,
+};
+static const unsigned int tpu_to1_pins[] = {
+	/* TPU0TO1 */
+	RCAR_GP_PIN(2, 7),
+};
+static const unsigned int tpu_to1_mux[] = {
+	TPU0TO1_MARK,
+};
+static const unsigned int tpu_to2_pins[] = {
+	/* TPU0TO2 */
+	RCAR_GP_PIN(2, 12),
+};
+static const unsigned int tpu_to2_mux[] = {
+	TPU0TO2_MARK,
+};
+static const unsigned int tpu_to3_pins[] = {
+	/* TPU0TO3 */
+	RCAR_GP_PIN(2, 13),
+};
+static const unsigned int tpu_to3_mux[] = {
+	TPU0TO3_MARK,
+};
+
+/* - TSN0 ------------------------------------------------ */
+static const unsigned int tsn0_link_pins[] = {
+	/* TSN0_LINK */
+	RCAR_GP_PIN(4, 4),
+};
+static const unsigned int tsn0_link_mux[] = {
+	TSN0_LINK_MARK,
+};
+static const unsigned int tsn0_phy_int_pins[] = {
+	/* TSN0_PHY_INT */
+	RCAR_GP_PIN(4, 3),
+};
+static const unsigned int tsn0_phy_int_mux[] = {
+	TSN0_PHY_INT_MARK,
+};
+static const unsigned int tsn0_mdio_pins[] = {
+	/* TSN0_MDC, TSN0_MDIO */
+	RCAR_GP_PIN(4, 1), RCAR_GP_PIN(4, 0),
+};
+static const unsigned int tsn0_mdio_mux[] = {
+	TSN0_MDC_MARK, TSN0_MDIO_MARK,
+};
+static const unsigned int tsn0_rgmii_pins[] = {
+	/*
+	 * TSN0_TX_CTL, TSN0_TXC, TSN0_TD0, TSN0_TD1, TSN0_TD2, TSN0_TD3,
+	 * TSN0_RX_CTL, TSN0_RXC, TSN0_RD0, TSN0_RD1, TSN0_RD2, TSN0_RD3,
+	 */
+	RCAR_GP_PIN(4,  9), RCAR_GP_PIN(4, 12),
+	RCAR_GP_PIN(4, 15), RCAR_GP_PIN(4, 14),
+	RCAR_GP_PIN(4, 19), RCAR_GP_PIN(4, 18),
+	RCAR_GP_PIN(4,  7), RCAR_GP_PIN(4, 11),
+	RCAR_GP_PIN(4, 10), RCAR_GP_PIN(4, 13),
+	RCAR_GP_PIN(4, 17), RCAR_GP_PIN(4, 16),
+};
+static const unsigned int tsn0_rgmii_mux[] = {
+	TSN0_TX_CTL_MARK,	TSN0_TXC_MARK,
+	TSN0_TD0_MARK,		TSN0_TD1_MARK,
+	TSN0_TD2_MARK,		TSN0_TD3_MARK,
+	TSN0_RX_CTL_MARK,	TSN0_RXC_MARK,
+	TSN0_RD0_MARK,		TSN0_RD1_MARK,
+	TSN0_RD2_MARK,		TSN0_RD3_MARK,
+};
+static const unsigned int tsn0_txcrefclk_pins[] = {
+	/* TSN0_TXCREFCLK */
+	RCAR_GP_PIN(4, 20),
+};
+static const unsigned int tsn0_txcrefclk_mux[] = {
+	TSN0_TXCREFCLK_MARK,
+};
+static const unsigned int tsn0_avtp_pps_pins[] = {
+	/* TSN0_AVTP_PPS0, TSN0_AVTP_PPS1 */
+	RCAR_GP_PIN(4, 8), RCAR_GP_PIN(4, 2),
+};
+static const unsigned int tsn0_avtp_pps_mux[] = {
+	TSN0_AVTP_PPS0_MARK, TSN0_AVTP_PPS1_MARK,
+};
+static const unsigned int tsn0_avtp_capture_pins[] = {
+	/* TSN0_AVTP_CAPTURE */
+	RCAR_GP_PIN(4, 6),
+};
+static const unsigned int tsn0_avtp_capture_mux[] = {
+	TSN0_AVTP_CAPTURE_MARK,
+};
+static const unsigned int tsn0_avtp_match_pins[] = {
+	/* TSN0_AVTP_MATCH */
+	RCAR_GP_PIN(4, 5),
+};
+static const unsigned int tsn0_avtp_match_mux[] = {
+	TSN0_AVTP_MATCH_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(avb0_link),
+	SH_PFC_PIN_GROUP(avb0_magic),
+	SH_PFC_PIN_GROUP(avb0_phy_int),
+	SH_PFC_PIN_GROUP(avb0_mdio),
+	SH_PFC_PIN_GROUP(avb0_rgmii),
+	SH_PFC_PIN_GROUP(avb0_txcrefclk),
+	SH_PFC_PIN_GROUP(avb0_avtp_pps),
+	SH_PFC_PIN_GROUP(avb0_avtp_capture),
+	SH_PFC_PIN_GROUP(avb0_avtp_match),
+
+	SH_PFC_PIN_GROUP(avb1_link),
+	SH_PFC_PIN_GROUP(avb1_magic),
+	SH_PFC_PIN_GROUP(avb1_phy_int),
+	SH_PFC_PIN_GROUP(avb1_mdio),
+	SH_PFC_PIN_GROUP(avb1_rgmii),
+	SH_PFC_PIN_GROUP(avb1_txcrefclk),
+	SH_PFC_PIN_GROUP(avb1_avtp_pps),
+	SH_PFC_PIN_GROUP(avb1_avtp_capture),
+	SH_PFC_PIN_GROUP(avb1_avtp_match),
+
+	SH_PFC_PIN_GROUP(avb2_link),
+	SH_PFC_PIN_GROUP(avb2_magic),
+	SH_PFC_PIN_GROUP(avb2_phy_int),
+	SH_PFC_PIN_GROUP(avb2_mdio),
+	SH_PFC_PIN_GROUP(avb2_rgmii),
+	SH_PFC_PIN_GROUP(avb2_txcrefclk),
+	SH_PFC_PIN_GROUP(avb2_avtp_pps),
+	SH_PFC_PIN_GROUP(avb2_avtp_capture),
+	SH_PFC_PIN_GROUP(avb2_avtp_match),
+
+	SH_PFC_PIN_GROUP(canfd0_data),
+	SH_PFC_PIN_GROUP(canfd1_data),
+	SH_PFC_PIN_GROUP(canfd2_data),
+	SH_PFC_PIN_GROUP(canfd3_data),
+	SH_PFC_PIN_GROUP(canfd4_data),
+	SH_PFC_PIN_GROUP(canfd5_data),
+	SH_PFC_PIN_GROUP(canfd6_data),
+	SH_PFC_PIN_GROUP(canfd7_data),
+	SH_PFC_PIN_GROUP(can_clk),
+
+	SH_PFC_PIN_GROUP(hscif0_data),
+	SH_PFC_PIN_GROUP(hscif0_clk),
+	SH_PFC_PIN_GROUP(hscif0_ctrl),
+	SH_PFC_PIN_GROUP(hscif1_data),
+	SH_PFC_PIN_GROUP(hscif1_clk),
+	SH_PFC_PIN_GROUP(hscif1_ctrl),
+	SH_PFC_PIN_GROUP(hscif2_data),
+	SH_PFC_PIN_GROUP(hscif2_clk),
+	SH_PFC_PIN_GROUP(hscif2_ctrl),
+	SH_PFC_PIN_GROUP(hscif3_data),
+	SH_PFC_PIN_GROUP(hscif3_clk),
+	SH_PFC_PIN_GROUP(hscif3_ctrl),
+
+	SH_PFC_PIN_GROUP(i2c0),
+	SH_PFC_PIN_GROUP(i2c1),
+	SH_PFC_PIN_GROUP(i2c2),
+	SH_PFC_PIN_GROUP(i2c3),
+	SH_PFC_PIN_GROUP(i2c4),
+	SH_PFC_PIN_GROUP(i2c5),
+
+	BUS_DATA_PIN_GROUP(mmc_data, 1),
+	BUS_DATA_PIN_GROUP(mmc_data, 4),
+	BUS_DATA_PIN_GROUP(mmc_data, 8),
+	SH_PFC_PIN_GROUP(mmc_ctrl),
+	SH_PFC_PIN_GROUP(mmc_cd),
+	SH_PFC_PIN_GROUP(mmc_wp),
+	SH_PFC_PIN_GROUP(mmc_ds),
+
+	SH_PFC_PIN_GROUP(msiof0_clk),
+	SH_PFC_PIN_GROUP(msiof0_sync),
+	SH_PFC_PIN_GROUP(msiof0_ss1),
+	SH_PFC_PIN_GROUP(msiof0_ss2),
+	SH_PFC_PIN_GROUP(msiof0_txd),
+	SH_PFC_PIN_GROUP(msiof0_rxd),
+
+	SH_PFC_PIN_GROUP(msiof1_clk),
+	SH_PFC_PIN_GROUP(msiof1_sync),
+	SH_PFC_PIN_GROUP(msiof1_ss1),
+	SH_PFC_PIN_GROUP(msiof1_ss2),
+	SH_PFC_PIN_GROUP(msiof1_txd),
+	SH_PFC_PIN_GROUP(msiof1_rxd),
+
+	SH_PFC_PIN_GROUP(msiof2_clk),
+	SH_PFC_PIN_GROUP(msiof2_sync),
+	SH_PFC_PIN_GROUP(msiof2_ss1),
+	SH_PFC_PIN_GROUP(msiof2_ss2),
+	SH_PFC_PIN_GROUP(msiof2_txd),
+	SH_PFC_PIN_GROUP(msiof2_rxd),
+
+	SH_PFC_PIN_GROUP(msiof3_clk),
+	SH_PFC_PIN_GROUP(msiof3_sync),
+	SH_PFC_PIN_GROUP(msiof3_ss1),
+	SH_PFC_PIN_GROUP(msiof3_ss2),
+	SH_PFC_PIN_GROUP(msiof3_txd),
+	SH_PFC_PIN_GROUP(msiof3_rxd),
+
+	SH_PFC_PIN_GROUP(msiof4_clk),
+	SH_PFC_PIN_GROUP(msiof4_sync),
+	SH_PFC_PIN_GROUP(msiof4_ss1),
+	SH_PFC_PIN_GROUP(msiof4_ss2),
+	SH_PFC_PIN_GROUP(msiof4_txd),
+	SH_PFC_PIN_GROUP(msiof4_rxd),
+
+	SH_PFC_PIN_GROUP(msiof5_clk),
+	SH_PFC_PIN_GROUP(msiof5_sync),
+	SH_PFC_PIN_GROUP(msiof5_ss1),
+	SH_PFC_PIN_GROUP(msiof5_ss2),
+	SH_PFC_PIN_GROUP(msiof5_txd),
+	SH_PFC_PIN_GROUP(msiof5_rxd),
+
+	SH_PFC_PIN_GROUP(pcie0_clkreq_n),
+	SH_PFC_PIN_GROUP(pcie1_clkreq_n),
+
+	SH_PFC_PIN_GROUP(pwm0),
+	SH_PFC_PIN_GROUP(pwm1),
+	SH_PFC_PIN_GROUP(pwm2),
+	SH_PFC_PIN_GROUP(pwm3),
+	SH_PFC_PIN_GROUP(pwm4),
+	SH_PFC_PIN_GROUP(pwm5),
+	SH_PFC_PIN_GROUP(pwm6),
+	SH_PFC_PIN_GROUP(pwm7),
+	SH_PFC_PIN_GROUP(pwm8),
+	SH_PFC_PIN_GROUP(pwm9),
+
+	SH_PFC_PIN_GROUP(qspi0_ctrl),
+	BUS_DATA_PIN_GROUP(qspi0_data, 2),
+	BUS_DATA_PIN_GROUP(qspi0_data, 4),
+	SH_PFC_PIN_GROUP(qspi1_ctrl),
+	BUS_DATA_PIN_GROUP(qspi1_data, 2),
+	BUS_DATA_PIN_GROUP(qspi1_data, 4),
+
+	SH_PFC_PIN_GROUP(scif0_data),
+	SH_PFC_PIN_GROUP(scif0_clk),
+	SH_PFC_PIN_GROUP(scif0_ctrl),
+	SH_PFC_PIN_GROUP(scif1_data),
+	SH_PFC_PIN_GROUP(scif1_clk),
+	SH_PFC_PIN_GROUP(scif1_ctrl),
+	SH_PFC_PIN_GROUP(scif3_data),
+	SH_PFC_PIN_GROUP(scif3_clk),
+	SH_PFC_PIN_GROUP(scif3_ctrl),
+	SH_PFC_PIN_GROUP(scif4_data),
+	SH_PFC_PIN_GROUP(scif4_clk),
+	SH_PFC_PIN_GROUP(scif4_ctrl),
+	SH_PFC_PIN_GROUP(scif_clk),
+
+	SH_PFC_PIN_GROUP(tpu_to0),
+	SH_PFC_PIN_GROUP(tpu_to1),
+	SH_PFC_PIN_GROUP(tpu_to2),
+	SH_PFC_PIN_GROUP(tpu_to3),
+
+	SH_PFC_PIN_GROUP(tsn0_link),
+	SH_PFC_PIN_GROUP(tsn0_phy_int),
+	SH_PFC_PIN_GROUP(tsn0_mdio),
+	SH_PFC_PIN_GROUP(tsn0_rgmii),
+	SH_PFC_PIN_GROUP(tsn0_txcrefclk),
+	SH_PFC_PIN_GROUP(tsn0_avtp_pps),
+	SH_PFC_PIN_GROUP(tsn0_avtp_capture),
+	SH_PFC_PIN_GROUP(tsn0_avtp_match),
+};
 
+static const char * const avb0_groups[] = {
+	"avb0_link",
+	"avb0_magic",
+	"avb0_phy_int",
+	"avb0_mdio",
+	"avb0_rgmii",
+	"avb0_txcrefclk",
+	"avb0_avtp_pps",
+	"avb0_avtp_capture",
+	"avb0_avtp_match",
 };
 
-static const struct sh_pfc_function pinmux_functions[] = {
+static const char * const avb1_groups[] = {
+	"avb1_link",
+	"avb1_magic",
+	"avb1_phy_int",
+	"avb1_mdio",
+	"avb1_rgmii",
+	"avb1_txcrefclk",
+	"avb1_avtp_pps",
+	"avb1_avtp_capture",
+	"avb1_avtp_match",
+};
+
+static const char * const avb2_groups[] = {
+	"avb2_link",
+	"avb2_magic",
+	"avb2_phy_int",
+	"avb2_mdio",
+	"avb2_rgmii",
+	"avb2_txcrefclk",
+	"avb2_avtp_pps",
+	"avb2_avtp_capture",
+	"avb2_avtp_match",
+};
+
+static const char * const canfd0_groups[] = {
+	"canfd0_data",
+};
 
+static const char * const canfd1_groups[] = {
+	"canfd1_data",
+};
+
+static const char * const canfd2_groups[] = {
+	"canfd2_data",
+};
+
+static const char * const canfd3_groups[] = {
+	"canfd3_data",
+};
+
+static const char * const canfd4_groups[] = {
+	"canfd4_data",
+};
+
+static const char * const canfd5_groups[] = {
+	"canfd5_data",
+};
+
+static const char * const canfd6_groups[] = {
+	"canfd6_data",
+};
+
+static const char * const canfd7_groups[] = {
+	"canfd7_data",
+};
+
+static const char * const can_clk_groups[] = {
+	"can_clk",
+};
+
+static const char * const hscif0_groups[] = {
+	"hscif0_data",
+	"hscif0_clk",
+	"hscif0_ctrl",
+};
+
+static const char * const hscif1_groups[] = {
+	"hscif1_data",
+	"hscif1_clk",
+	"hscif1_ctrl",
+};
+
+static const char * const hscif2_groups[] = {
+	"hscif2_data",
+	"hscif2_clk",
+	"hscif2_ctrl",
+};
+
+static const char * const hscif3_groups[] = {
+	"hscif3_data",
+	"hscif3_clk",
+	"hscif3_ctrl",
+};
+
+static const char * const i2c0_groups[] = {
+	"i2c0",
+};
+
+static const char * const i2c1_groups[] = {
+	"i2c1",
+};
+
+static const char * const i2c2_groups[] = {
+	"i2c2",
+};
+
+static const char * const i2c3_groups[] = {
+	"i2c3",
+};
+
+static const char * const i2c4_groups[] = {
+	"i2c4",
+};
+
+static const char * const i2c5_groups[] = {
+	"i2c5",
+};
+
+static const char * const mmc_groups[] = {
+	"mmc_data1",
+	"mmc_data4",
+	"mmc_data8",
+	"mmc_ctrl",
+	"mmc_cd",
+	"mmc_wp",
+	"mmc_ds",
+};
+
+static const char * const msiof0_groups[] = {
+	"msiof0_clk",
+	"msiof0_sync",
+	"msiof0_ss1",
+	"msiof0_ss2",
+	"msiof0_txd",
+	"msiof0_rxd",
+};
+
+static const char * const msiof1_groups[] = {
+	"msiof1_clk",
+	"msiof1_sync",
+	"msiof1_ss1",
+	"msiof1_ss2",
+	"msiof1_txd",
+	"msiof1_rxd",
+};
+
+static const char * const msiof2_groups[] = {
+	"msiof2_clk",
+	"msiof2_sync",
+	"msiof2_ss1",
+	"msiof2_ss2",
+	"msiof2_txd",
+	"msiof2_rxd",
+};
+
+static const char * const msiof3_groups[] = {
+	"msiof3_clk",
+	"msiof3_sync",
+	"msiof3_ss1",
+	"msiof3_ss2",
+	"msiof3_txd",
+	"msiof3_rxd",
+};
+
+static const char * const msiof4_groups[] = {
+	"msiof4_clk",
+	"msiof4_sync",
+	"msiof4_ss1",
+	"msiof4_ss2",
+	"msiof4_txd",
+	"msiof4_rxd",
+};
+
+static const char * const msiof5_groups[] = {
+	"msiof5_clk",
+	"msiof5_sync",
+	"msiof5_ss1",
+	"msiof5_ss2",
+	"msiof5_txd",
+	"msiof5_rxd",
+};
+
+static const char * const pcie_groups[] = {
+	"pcie0_clkreq_n",
+	"pcie1_clkreq_n",
+};
+
+static const char * const pwm0_groups[] = {
+	"pwm0",
+};
+
+static const char * const pwm1_groups[] = {
+	"pwm1",
+};
+
+static const char * const pwm2_groups[] = {
+	"pwm2",
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3",
+};
+
+static const char * const pwm4_groups[] = {
+	"pwm4",
+};
+
+static const char * const pwm5_groups[] = {
+	"pwm5",
+};
+
+static const char * const pwm6_groups[] = {
+	"pwm6",
+};
+
+static const char * const pwm7_groups[] = {
+	"pwm7",
+};
+
+static const char * const pwm8_groups[] = {
+	"pwm8",
+};
+
+static const char * const pwm9_groups[] = {
+	"pwm9",
+};
+
+static const char * const qspi0_groups[] = {
+	"qspi0_ctrl",
+	"qspi0_data2",
+	"qspi0_data4",
+};
+
+static const char * const qspi1_groups[] = {
+	"qspi1_ctrl",
+	"qspi1_data2",
+	"qspi1_data4",
+};
+
+static const char * const scif0_groups[] = {
+	"scif0_data",
+	"scif0_clk",
+	"scif0_ctrl",
+};
+
+static const char * const scif1_groups[] = {
+	"scif1_data",
+	"scif1_clk",
+	"scif1_ctrl",
+};
+
+static const char * const scif3_groups[] = {
+	"scif3_data",
+	"scif3_clk",
+	"scif3_ctrl",
+};
+
+static const char * const scif4_groups[] = {
+	"scif4_data",
+	"scif4_clk",
+	"scif4_ctrl",
+};
+
+static const char * const scif_clk_groups[] = {
+	"scif_clk",
+};
+
+static const char * const tpu_groups[] = {
+	"tpu_to0",
+	"tpu_to1",
+	"tpu_to2",
+	"tpu_to3",
+};
+
+static const char * const tsn0_groups[] = {
+	"tsn0_link",
+	"tsn0_phy_int",
+	"tsn0_mdio",
+	"tsn0_rgmii",
+	"tsn0_txcrefclk",
+	"tsn0_avtp_pps",
+	"tsn0_avtp_capture",
+	"tsn0_avtp_match",
+};
+
+static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(avb0),
+	SH_PFC_FUNCTION(avb1),
+	SH_PFC_FUNCTION(avb2),
+
+	SH_PFC_FUNCTION(canfd0),
+	SH_PFC_FUNCTION(canfd1),
+	SH_PFC_FUNCTION(canfd2),
+	SH_PFC_FUNCTION(canfd3),
+	SH_PFC_FUNCTION(canfd4),
+	SH_PFC_FUNCTION(canfd5),
+	SH_PFC_FUNCTION(canfd6),
+	SH_PFC_FUNCTION(canfd7),
+	SH_PFC_FUNCTION(can_clk),
+
+	SH_PFC_FUNCTION(hscif0),
+	SH_PFC_FUNCTION(hscif1),
+	SH_PFC_FUNCTION(hscif2),
+	SH_PFC_FUNCTION(hscif3),
+
+	SH_PFC_FUNCTION(i2c0),
+	SH_PFC_FUNCTION(i2c1),
+	SH_PFC_FUNCTION(i2c2),
+	SH_PFC_FUNCTION(i2c3),
+	SH_PFC_FUNCTION(i2c4),
+	SH_PFC_FUNCTION(i2c5),
+
+	SH_PFC_FUNCTION(mmc),
+
+	SH_PFC_FUNCTION(msiof0),
+	SH_PFC_FUNCTION(msiof1),
+	SH_PFC_FUNCTION(msiof2),
+	SH_PFC_FUNCTION(msiof3),
+	SH_PFC_FUNCTION(msiof4),
+	SH_PFC_FUNCTION(msiof5),
+
+	SH_PFC_FUNCTION(pcie),
+
+	SH_PFC_FUNCTION(pwm0),
+	SH_PFC_FUNCTION(pwm1),
+	SH_PFC_FUNCTION(pwm2),
+	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(pwm4),
+	SH_PFC_FUNCTION(pwm5),
+	SH_PFC_FUNCTION(pwm6),
+	SH_PFC_FUNCTION(pwm7),
+	SH_PFC_FUNCTION(pwm8),
+	SH_PFC_FUNCTION(pwm9),
+
+	SH_PFC_FUNCTION(qspi0),
+	SH_PFC_FUNCTION(qspi1),
+
+	SH_PFC_FUNCTION(scif0),
+	SH_PFC_FUNCTION(scif1),
+	SH_PFC_FUNCTION(scif3),
+	SH_PFC_FUNCTION(scif4),
+	SH_PFC_FUNCTION(scif_clk),
+
+	SH_PFC_FUNCTION(tpu),
+
+	SH_PFC_FUNCTION(tsn0),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.25.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25DF854A92B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236288AbiFNGA6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbiFNGA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:00:57 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40F439805;
        Mon, 13 Jun 2022 23:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+pG2gOIpzlqZWjt/24a122JsLrXnQvsVfI9qGGvQLoY8T9Owl2XLYZ+8N/zBOAku2bGLVTBbkGLwghCL+FpY8NLVHpwR1HyudnyAOnuMGytHW1PXZaGQih8jtRCuFjMD3MmFs8PIgJbqSvFErntByF+8eAeFeBgRABCElGLhOAVULdqGhnoxnQa8v24KKuLqZ155wr0MqtIM4F07kw5G5IT076tnb8h3HupmzUjbwEULXNxmZrnPCNPaOPgJjRydxoDlUyOrY+d21iKZkqwbXwbDKx7xK+NRjcKV9Tc3+0jXniFjj7BoXlAnJwr1EiP4x9oNOwIUcoHm1p1N23cMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zL6ME/VYhzq0Ehj86iTpeuHuMpAKLTvTNAqAilxV3fE=;
 b=fVohFSZrBxNQGWokRHjMsmKa62Rii4H0IwrPgzneFuzQofWbnI8hj0O2TG9yrAGi0X9pZvPhY4occTLGvkxQVGRIOssU5zVRES2mXcXx9mDOcWuAFfAMjnHUfeTx5Pncx3gzp86E/8BQ5Tc+XJiiKEuE2XnrpyOgQzqSSweZ+b0P2ZbXM1ymcvCr1F2fAipfzMcKkuKCHqGvdgXMesICPw7UquIaS8+fTJXKQewKN1SheFFw/taXLjVCGw/lmdDVrsjjayi8eng7f0tEpDICis7c+acx/jpiBuGWSSzuVYCMSBi5mIBnd0lqeQ8PM0pDLhZDWN3COmp/rZMleliH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL6ME/VYhzq0Ehj86iTpeuHuMpAKLTvTNAqAilxV3fE=;
 b=hE6vigF00m8saV83b5T+t9P2B5LsvtqK0Rlp+qp59gw6ZLtSeK388X5mcliwaY1E7gTrcW+E6DKHNZxRcU37r00cFa5H4yeDF2nX4Q6SM1rilLPdrHz0wXOMge+kCkRFT9Pms+iYQQWPbacdNrxiltBvrUV1CHRcfEfAS6mc4Vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB3093.jpnprd01.prod.outlook.com (2603:1096:604:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 06:00:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:00:54 +0000
Message-ID: <87bkuvkcmi.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 20/21] pinctrl: renesas: r8a779g0: add missing MODSELx for TSN0
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:00:53 +0000
X-ClientProxiedBy: TYAPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:404:28::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06d5e7e6-4742-4797-d6ad-08da4dcb3df8
X-MS-TrafficTypeDiagnostic: OSBPR01MB3093:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB30938B361C7F0B36539530DAD4AA9@OSBPR01MB3093.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eArdZm9AAYeArsRYOOaatJSKsd9JmRN47taSnm5IQfHnMYqmSbuqNgdGSzc6TOxWoLIuwfi/JYRQ/G+vOnOUE9D0rPzax8APcoYZQxlJAvf+2eo/CpMYcPyFM/vhECSkBjf4cgvklI1/UefZFwHw8OBuJuVKiJiiNpInQkZIZ13virEeI9Y8GnV4qLrugtvPAKtEeCKi2r08oF57H9LbjJZtF/QstNDywmzeDUJoT41Rfmpyh9nOQ4nJtsCwojdvnRXOiFLnXY8mK73tnawizkspUfOGiYZKlrIhaShChALTWfi+xbdaPw2PPS9WAtxRsGNmXmTcutaTbvwEmgWYtnpWj5pzD8bDbNhk3j82FESuKdVlqibnWnilMZ/Lt88jf0j/sUQ3X7eRjrgLwf9njqV/qhthBcmy4JabcBvmC/0ur05IwaUJ6dnApCw455yse7ktPlwzEYiDok/lcIAeUudv4rdHMVr4DZepqWGiD4dA8unSconYMHOLDX6FOqIEiCtwJEwx/HjRLghD+jAD8gvOXhh7kvUzdjOvrb9C03bHSwTSivIS4A0N/rp/RHDPSZG5Ygh2/npwXp1wfWEtYVSry9Cv75LxOaPBRVme4iwM/wKx3RlD0B8AbimV5cfbC/rBOK8CjFwDlmX2D9bZj2W1l+ASkc31FkFjo0R6n+V/fWV6FnjP0yKBJ9IFtkoOkyiiRGIopXzTwkpS0dJ5vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(6512007)(36756003)(26005)(2906002)(6486002)(6506007)(52116002)(5660300002)(186003)(86362001)(2616005)(8936002)(508600001)(316002)(66476007)(66556008)(38100700002)(38350700002)(66946007)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CvrZMTa8S0TIH0RluDkZE7amb1m/lZnbqG27iYOfm7e9dD0UxtFmpPLpFq9s?=
 =?us-ascii?Q?x/irLBmQG0HrwDPrtPkytNBJyLsT0iLmfXMfJoEjU8tPcqj21dkV6d0LLmBh?=
 =?us-ascii?Q?ajMuF0jELzIau0b/N7Sj+/2ozzABpyEF/a4DiLH11c0f8+al65yZ64xbnW4L?=
 =?us-ascii?Q?jnCN3pnLFZQYMynHuYVnPKPRdatASap+NHzGPGA80qhhMyjMavEgi+ngBTqI?=
 =?us-ascii?Q?UJIUZtIfeaw/o2J7NHmRYHYIW3qvAXOIFfdlFc5zPXPsRtQ7JLWuKkOlMBMj?=
 =?us-ascii?Q?4GZ/L1uvPbA6GzlRpEKHZrqNlhUTQItqGaPhzWlC0Gk/BWdEvuW/RVYtL1dJ?=
 =?us-ascii?Q?FhHvij9wxafxisKGbROU8weoU2l6cOpmF9VyYNNWPGMTptogWTDGpVnC9cAK?=
 =?us-ascii?Q?i2ixTTmMuFbD+h490rBcso+wMsIO6qfKF3FK+bP6zzfIbO3a1vV5gH/1683E?=
 =?us-ascii?Q?04N0wiTWIjyiVJQ+4DoixrC/DkMDr8qLvhILCv1+w/yFcnzsL4eKkM/r4k67?=
 =?us-ascii?Q?iZHZS59MWZUoa+9Q//YqfnOqc3djPILd6uYN27h1/v4A+OLzGSVNgeI4WoQu?=
 =?us-ascii?Q?Qm9V5Y2zSucEM93wZoLCRCaYVLSR7xE1v4aSbN0qdTP0TUwUqX3NQlVpw8jK?=
 =?us-ascii?Q?dR710E2WH8xaf0fB8oYJkgpRjIjLa40SklSjpeLFeWR2tO2HzgfGn6grNg31?=
 =?us-ascii?Q?4oJEY18o1l+W13HvD7bLKZj4rcxDTMebTrzMaxsz7aIeJ/VxdenQ5/L304WW?=
 =?us-ascii?Q?0RSXtNRqyE5O/+P8SnFdDcdVf72P+qY/R2fXdzf/DmIYXlVslycnk0xo7uLy?=
 =?us-ascii?Q?Z00oV6VO9ed/lzJmXfkj3k17+A1XCd7vG/uAaFVxPJxo1U8XqbasftQLvakz?=
 =?us-ascii?Q?CHfm7J5YJNAvv1OL3uTCyRjfoOZsT8Kqtdxru2LJxvvp252IxMT6sMHJRMEC?=
 =?us-ascii?Q?leVOlIzO65PK38eCDpnp88N2kVeVoG0+D3wiBa8gb7o2AVstuwAPPIc8zWwi?=
 =?us-ascii?Q?yQzWNckWlX/F8rPzMW5fAGLr+0i/UmMUVCFbrQM1UPYH2sXfNnvtWq06gR6J?=
 =?us-ascii?Q?uFeFW0egpJtXdVvZp3uq/JBnlE6bX2lob2ToKPI3tnwekZJ3Y6iezDA4F94t?=
 =?us-ascii?Q?T++8bW2HnnSVVENJU1yLoUOXWz9HwcZm4WrvEHqw7ZF3nZ1M+ZEkPT+OMFya?=
 =?us-ascii?Q?2GpPE3Wyd1qtG9JAXlBDhM6rSElR06ZVgueC1dK27dxHWdxJF8DSkl5MgdJu?=
 =?us-ascii?Q?k6MQxwhjYRjPCAimuO32G289Ctz7TgM8HOnwT7yl4uUnDY8ifwbVVCvVQIEv?=
 =?us-ascii?Q?JQGtbng5hMTMkA5GqyhcpSHAZrNQHHk3qSfLOs5fKYQkcTF57Vvd9Ym2Gh3L?=
 =?us-ascii?Q?0oqA5edHlQzg5ffvF4Ee4Np3FHH4jlQ9lsqcOeRiHhytZscfG2fhYJQOry0n?=
 =?us-ascii?Q?PyybHKqBH0EzS00RKOur5gihsWskfs+W5CZDPAeMnydfCbh+3OYEEFDHMsvV?=
 =?us-ascii?Q?/WogLPtkuPmZA5FDoI3mrZ6upGUvhSE0tezr8+XnLz79Z+lCNvAIKqAhd6G+?=
 =?us-ascii?Q?b26Bhbr68uuG9F8Ldgea7x5elIpLklxNqSoSa0jRTQz/l7TV5tlvrc1plYZL?=
 =?us-ascii?Q?T6EvSK762q8AUS+rv8oN7Ng/SkYcQCrXQkLQ0i+pcUzmw20/MVFpxxTg1WaK?=
 =?us-ascii?Q?86bKHOOgVvrojCGSK+6sZ/ZJglu0Xvq2TNCajKn/k8zJaV5K5ZU8wbtlrtQk?=
 =?us-ascii?Q?4FVMMUSgfn8v6Yccmjacm0NfDFFqRilxVo3iTLFCvRSwUv0wCa8X?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d5e7e6-4742-4797-d6ad-08da4dcb3df8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:00:54.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExQoo/+6PprB/NrnIa1PfD1Qc7WB9eskYGjgifJwHE3AEo30dLrMUEP7ixp6Ov2Pyz1+taFwciiJHPEh/KkgwaUgqoZ/cmRo5MxJ5DPuO7hr0cUzF6d/OOFdZo2ZugT1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3093
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

TSN0 needs MODSEL4 settings.
This patch adds missing MODSELx setting for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 06a1b08a3cb7..c96d95907972 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -720,27 +720,30 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(AVS0),
 	PINMUX_SINGLE(PCIE1_CLKREQ_N),
 	PINMUX_SINGLE(PCIE0_CLKREQ_N),
+
+	/* TSN0 without MDSEL4 */
 	PINMUX_SINGLE(TSN0_TXCREFCLK),
-	PINMUX_SINGLE(TSN0_TD2),
-	PINMUX_SINGLE(TSN0_TD3),
 	PINMUX_SINGLE(TSN0_RD2),
 	PINMUX_SINGLE(TSN0_RD3),
-	PINMUX_SINGLE(TSN0_TD0),
-	PINMUX_SINGLE(TSN0_TD1),
 	PINMUX_SINGLE(TSN0_RD1),
-	PINMUX_SINGLE(TSN0_TXC),
 	PINMUX_SINGLE(TSN0_RXC),
 	PINMUX_SINGLE(TSN0_RD0),
-	PINMUX_SINGLE(TSN0_TX_CTL),
-	PINMUX_SINGLE(TSN0_AVTP_PPS0),
 	PINMUX_SINGLE(TSN0_RX_CTL),
 	PINMUX_SINGLE(TSN0_AVTP_CAPTURE),
-	PINMUX_SINGLE(TSN0_AVTP_MATCH),
 	PINMUX_SINGLE(TSN0_LINK),
 	PINMUX_SINGLE(TSN0_PHY_INT),
-	PINMUX_SINGLE(TSN0_AVTP_PPS1),
-	PINMUX_SINGLE(TSN0_MDC),
 	PINMUX_SINGLE(TSN0_MDIO),
+	/* TSN0 with MDSEL4 */
+	PINMUX_IPSR_NOGM(0, TSN0_TD2,		SEL_TSN0_TD2_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TD3,		SEL_TSN0_TD3_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TD0,		SEL_TSN0_TD0_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TD1,		SEL_TSN0_TD1_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TXC,		SEL_TSN0_TXC_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TX_CTL,	SEL_TSN0_TX_CTL_1),
+	PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS0,	SEL_TSN0_AVTP_PPS0_1),
+	PINMUX_IPSR_NOGM(0, TSN0_AVTP_MATCH,	SEL_TSN0_AVTP_MATCH_1),
+	PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS1,	SEL_TSN0_AVTP_PPS1_1),
+	PINMUX_IPSR_NOGM(0, TSN0_MDC,		SEL_TSN0_MDC_1),
 
 	PINMUX_SINGLE(AVB2_RX_CTL),
 	PINMUX_SINGLE(AVB2_TX_CTL),
-- 
2.25.1


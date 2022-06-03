Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDCB053C3EF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jun 2022 07:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239556AbiFCFEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 01:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236793AbiFCFEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 01:04:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C473A3917E;
        Thu,  2 Jun 2022 22:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx3m3Q6uhJddbiPabBTI0wykXgyd0OcuM997zs+iN1s7r+p7WOsJgDuFnJiQdj7hC9Ev/Ggh2BZdPiOTjoEMvqZ/iC88h0DKL+FvnEErKye/Jiw2uj1v+CDOkaIUhVehvoluLW94wn4Qt6oGW5JVQRe8KTNL4ubxPJvzJc0dT1pqLJWHXRwkLVqt8BiXCLg6mnRp9czvCJbP53KDuQYhDiqtDIfWpVIQjtYbWvZuqTjbVUY+cW4DGmIL9tlAw0qcSvwynbuLU1kZqtseZGhSib+J+PZKOhzZ8x4u0P3VEvDY+4kk7N532Fibpe2tvETHt2nRJ/NyO35+A+FYyrDk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKA30SX8MlPV0XVl4uTRlMMLMMNOQiigC00ZVydy5Sg=;
 b=e6tJXmHv1gRS+IozAvGzdBx38mXlhZBf8C3aib4+zQMYTPew97VwLfVUCZKQnTDIa0DRxIi4M3ZoXbHLA1XnkicCAUBUYpGD94K4VxddH0SOtL8dQ85jhJuB9TXg8uazvkuhJLvd2JS8iIUGQytLY/0EcSXjy31uvXsJd9sMafsJurhC2jn48NScbGm5H0jQMUyneOfSHDbSy4n6rJ3kN4KSHDrsb1KYWS5EoKqhV6QqyNtTpDAn6RKWFSTBQeFntsNZTTeJSb1sAG7+OU3li8k+4SttU/nGZ0nSJVLKRQU2d6Jg9Tazb9bm/VEngwb3wtVzW7fdz4Xt5NkjmXmCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKA30SX8MlPV0XVl4uTRlMMLMMNOQiigC00ZVydy5Sg=;
 b=LsEF6G1QysRW4D9wwyP4IL6nd1xwoNg36qqmYUwn78DUPYbHHxYFqpRna93bSeBOWdwO8ODl11vjmtPeqhMVhp59K1Ulr68llg9BScvGmq5Q57h2NuEImEIrSib02lvcewxQyhKh64Plyk9zKqvwTY4K0/gmwHYtMLI0XWCBWkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB2160.jpnprd01.prod.outlook.com (2603:1096:404:3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 05:04:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.012; Fri, 3 Jun 2022
 05:04:32 +0000
Message-ID: <87leue49sv.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] pinctrl: renesas: Add PORT_GP_CFG_13 macros
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com>
References: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 3 Jun 2022 05:04:32 +0000
X-ClientProxiedBy: TYAPR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c086404-5291-4949-0845-08da451e8bee
X-MS-TrafficTypeDiagnostic: TYAPR01MB2160:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB2160C56BA5E978204CC05DF3D4A19@TYAPR01MB2160.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+xH/Rpz4MS0G4T2DXmkR7HnR3RpCIfbbFQg5oywDrFXKPUuaIFp6FNIzD9/LYEeQETJGdfUV7BIvVzsTIaptkJzQEQQrBMUjkJQooABKMkdnTzmGOqsWYJ1GsyjJfCy2ILvt6r6OQvZt3/n2jq+QdpvAD2Qs9OCzaIs//+/h5nWOJFxnSy/MYZJlw4K5vOF+o7vltqPpYm/o2aL+f+Qz9JZmVe0clu1RjKvZTRgIiXwITesgqUq3iKPG+7C/aFpY0eof5fQbggnrar1jFRBM2aYTQMuXtVK95e/XNzyKvKSQQW8pE+WsejW1KdMxpT8uOjJ+dxuy/E4X0JWJzmwlAmaUdZz9lsWh60uQCHLVZvgnQaPuhQn2opVp0tvdw4c1BRrPjNWsdtlSqJiYwS3XAO8FQWd7XQllhDy3XkRRO1xsK7wufDprR4E7sVsTEqi1YkAyvwrIS2kF0bGjhF+VUO7oqLv5y622y76B0EIGoJBufrzpqAxtMWH5bjGvp59Vh3u8sMVP3uZP7UKoiNLfli2pB1vw3zujbASVUPhtEHYzQbq6eeKoquLWG4sgKmWvLl63sewkGoup8T2Mh2+9x5coeB0SlyqHs8xS8PibBPmdmJWPhJFOpslMkP5MorrOw69OAW49nYnOCT3yxpf/bGPeS4V5jKTC5nK0Ol21ByUMSn6vw216vGLsGTKRuN0YB9sd8btQz61EE1kFSB4ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(66556008)(66946007)(8676002)(4326008)(316002)(38350700002)(52116002)(6506007)(2906002)(36756003)(66476007)(2616005)(8936002)(6512007)(186003)(26005)(5660300002)(83380400001)(6486002)(508600001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dzbA8x4dI17NLHdH7GBFZGSstFBwgIdWBKcgfGNSVBorInOdVa3ABVunTzUz?=
 =?us-ascii?Q?7GeudfzSp5d7NbqqoftgvCiNvhYh5XJ/FQPLZTrP06ytFuxu/XqUMoqFN11Z?=
 =?us-ascii?Q?2S7yk34CB0x5CF14bXOGPV4LSf5WxLqv3VqU7Y3Sm8L7AUc1Xm/SkQ/uzr2A?=
 =?us-ascii?Q?I/ui3algO4Qxtfkmx2xqZfF8Y5XCaXyLaiIa4A5Iub2XVv21628DmLWawEMo?=
 =?us-ascii?Q?tS5GQyiP6haANArFDOlC+9uxKuJ4hBtZRtRRFuH4QwToK3+zuIuOUaoqb6tF?=
 =?us-ascii?Q?YH48sgHziEveiSo0ZKy571SyDkKXCeCP7kDIdxb/eiKkfLLn5Py7CHCzFQWP?=
 =?us-ascii?Q?QcywvbFlFET98GMhdnaTEr85N6fd5QmPGhjgQ6tiNdzMj3jDoQm/tzyObbfb?=
 =?us-ascii?Q?dN4/pFKtXqWxgUDxWM/XCsDbTwlXl9D3mmma60W9RYGtQRqKSsWpj0svKcaA?=
 =?us-ascii?Q?lWNgeqDIgFcyfeeoBz/iZmp3wLEtzej8OfJX3aoGNuJnLEqiOWQUY9vglBqR?=
 =?us-ascii?Q?XBPvLGzUvadOuIX7mK/xnEuQ4tx+68D3LIIvzC0PZd54HoTg/Q6X0cwQa8MZ?=
 =?us-ascii?Q?kmLLqHjEOKm5dU+vBOfX3clmarUkFbeZpT8EuFtH5Wucy9svY6v6AFuqGQct?=
 =?us-ascii?Q?jkqJB0P939B7opP3KF/5mZoNAip6GOSCu3cBLEHWI/P1LN2All8ubhxAxM6V?=
 =?us-ascii?Q?YyX1lhx5731DQTGPLhXBzgdyU9RNhzX1ENNFzKslu8yfn5YLye+oW7wOizEh?=
 =?us-ascii?Q?x5GrrKYxhyRZixcJCUXGUuWZCus6sxgYUj4rigzKUN0FYmDtRe0HlBfEKRDF?=
 =?us-ascii?Q?hlTY/L6JjPvgjxFJtwYCRU4BzcLFGhpAumDkn6GiOFXwq5Oa1M2sj94kli+Q?=
 =?us-ascii?Q?ytJZumGEEJBJuKzZXyfkBYbbEvD7tJsh/7ofD8iredesklI2sNVUxDIfN1rS?=
 =?us-ascii?Q?Ldee8eEJbwC3e77mQywmyw1QckUZG3tpX3qjxONFudX5Jw6obr2zb0th4Yfi?=
 =?us-ascii?Q?KlXHbQNeLrNrcjQUYHllaFPKSOAZdhO+04A98q4gfXH71XOoFOfkgmCq17kL?=
 =?us-ascii?Q?m+wz/Enmoy1Jjt021cTEoAkanZ3sCtagfI4TrhTrFY2l+vAF3/YYlaLKkeOa?=
 =?us-ascii?Q?Io0FY7h3TunO6QkEfsroWOYMg2NvvGgUTjeQe8goqrGjMfMT/HJ4UQa2l33u?=
 =?us-ascii?Q?Zc9NtL2e38C7QrwydC/j3HuBooieQ+VoN9bdsuDXWETGWW6c2YQXLcdZNCwp?=
 =?us-ascii?Q?4Rfq/HBYOGME28HIAIZ8NO8/Wzxvgw0MN8ll2tUAqSgo2n4zHToR5LYZ414c?=
 =?us-ascii?Q?Ea3eAkUA2tSOlQ/3LzawZar56gAh1QE5ATlWteqJLUblvi4PFt52kv/uNA7x?=
 =?us-ascii?Q?NhZvL7yoSDy1tT1zsYwA0JbTULTJZEI+BSkuQSmTG0QKdtOIUepSXxgB+gZC?=
 =?us-ascii?Q?U+ZKKeFmaoQjdEZlIDEtxEpdWYR2ocMCyoePHBNzFVtQOocJIViBBG6r+Oqf?=
 =?us-ascii?Q?DyLDu6DH4608aM+rTCvzCuKqjqm2+PByg7SenS+hYZ1Mi7vPNnl3CECkqzSu?=
 =?us-ascii?Q?e5knQJShfMiz+J+57clgasT0KvVBO22eRZiJ5HLif+NX++OGflFxf37yrEne?=
 =?us-ascii?Q?moXGWBJrdWoyRkaXvv+w0aFesG/Su5qUVTZInjkkR6KG0k/IVy9ThhFVPCFC?=
 =?us-ascii?Q?ELMpSqUUcspARTPkoIf1yavc7Fie06zwHX3qRtSlXyQ+g2zsE6D6uVy5mlCE?=
 =?us-ascii?Q?pj2ydQA2Ov1i7X2kcRBuCVfYTWhlsZKg0f1WXfW9ZTDtStJ+9xar?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c086404-5291-4949-0845-08da451e8bee
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 05:04:32.6408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33Q/+sAVu8WmeIp7LNibFXWk3puU2aYvCnin5+zs+7N0NXPXKMFuwzpRAlBZlCm3u5afS9de9LDCztZ/bMqHyR4ooRrXL9SeQysntXiiB4rupGbQX3JGBh3DcfKVhCG/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2160
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

Add PORT_GP_CFG_13() and PORT_GP_13() helper macros,
to be used by the r8a779g0 subdriver.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/sh_pfc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 6b5836ea47de..e53e02c95167 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -492,6 +492,11 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
 #define PORT_GP_12(bank, fn, sfx)	PORT_GP_CFG_12(bank, fn, sfx, 0)
 
+#define PORT_GP_CFG_13(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_12(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg)
+#define PORT_GP_13(bank, fn, sfx)	PORT_GP_CFG_13(bank, fn, sfx, 0)
+
 #define PORT_GP_CFG_14(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_12(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg),				\
-- 
2.25.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4EF554A908
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237699AbiFNF7H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237887AbiFNF7G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:59:06 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAEF35A95;
        Mon, 13 Jun 2022 22:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SI4k1pd7iaHOq8pd4mXGFXlF65bD2s3o9GlChA+zXlrn9mpu8e1H+Q8E1RaVGf7mc3wrXVtY73NrgFM3/mNJGV3BB8zfo3zXN2DHQob0ybVanLhXSTbEnLdgEn50Sxonm6QXt8JTiObdlQckJTPpCM94F1uGW2vEUVGP2o5LMbhTypAb8lixOoqHqYN1i8U8Tb0KwT6hXpDrt5gn+YtM/Vb1Cgw7YWkOdsRSBbJAym9wVLiF1DG9M9ttrKyweiAHQSv4eqpC2/DqFsCg7KhhCygpYFrVHd4B25SYIohEsu/WtFY6sm32wICg6w9ZvD62MKFj4uw0WfK32TAjmK1wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vSLSAoX1ddLTeppMSdTBeB7HdGzQjiT8icoMM8v3F8=;
 b=mTfiDTAgxnYDuGM9ojvHfwrPHd8RKdJOw48E5DEsYVQcN6x4TgG6hnVKNKlN0pzqwSN5o5QOMBM6La2U+hSNcS7rOmZh63FQkZdRj5BlFSheU++c7eFzAJD9NnoA2mdIZ8AmzlQiCCuDNUBl+iN44QJfUYBaKomSqCyVOh6IKVIblmeUjUgFDUGEnugkZziWzjUVkeP4VQtM2iPS/jm1mh9WMM9kWRSGCtvUOkvhLPIzQkAUsgvhBsnzAaBlBLHRXGz+xg+DyVuzhwc44wo8jjcEm6GYGFJ90iW0DmMoATkzRJi+wdCgedVUkfyy7tLNQq+FKNobpnA0Fs32ZcdBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vSLSAoX1ddLTeppMSdTBeB7HdGzQjiT8icoMM8v3F8=;
 b=aCVIg5evcYKfT/nfaO8xcdb3vKV3GshUoexmxUvoEGlztr5AhITZhLwVkoXhUCPptuNvg+5pPpVQL2skBTyqYzzTU9OI2woRddOx3foyrWu4WVMHHWu/3OCqHYlHGZqwIML1dp2g3283N8qJOQVn/d7vC87ovGBcq5xVEIED8BQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYXPR01MB1711.jpnprd01.prod.outlook.com (2603:1096:403:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 05:59:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:59:01 +0000
Message-ID: <87wndjkcpm.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/21] pinctrl: renesas: r8a779g0: remove not used NOGP definitions
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:59:01 +0000
X-ClientProxiedBy: TYAPR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:404:15::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c0016b4-f497-4f50-e543-08da4dcafade
X-MS-TrafficTypeDiagnostic: TYXPR01MB1711:EE_
X-Microsoft-Antispam-PRVS: <TYXPR01MB17112B0A718748EF63588C60D4AA9@TYXPR01MB1711.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zkg9gkn+RvQIDPXzgByCu0XWOFbXPxopF45A6AAuVVnIRE1r5ofsLJsQ4qS3EvuFzZ3wikxUwzC4u05h4EEHlXhOYizakWj/LjhDtpoBIzQJXaOvij2r2gPcGphv9RbJfnXOmO4ScXHHbLd7izIs05PZT21B2wmz6Hr6YMJGXxWPodgEC6dxBVG9AFeFMAHOKu+byIU8aq6Rkt4QyA54NtksdEtv9OnqgsmO+g4fUPPQz3skPC5SEAkU8ZANutewwDUgwarrU7Bkzw00/eaT7GIsxC9S5uaZkNUFmblFnbrZZ6GOjmDCEFbSum2iok0a9P6uxPNXAJTA8Vuw/5e8T00gmj6t5R0IZIV7/aCnGNnSdIfoewCEYEeLa8GgdC5mXv4deCdxFreKBMz98av5FKksEKqYXPu3ZzAkaZW2NEzVwpf/xsTpp8V/TzXVLR4waPSuuC42lbox2hymqs8yKdG6+CiMkJFxl0KhqFcmjBe08LRQ4hfRsMPTqqeI6s0fdoI/UOcgQ2PR52auXm5+95gN0o4+XI0yYYVuN3blQoGWp4gubi4szSPA09mazaL9xLFswiSYx92vAMObcw4cMsquN6LuQtQCf3HN/4/jmy6mCy4EfowRmOGEhjfVVBfGs5C+VuwugL6Li2X3Dhisbs485Uv9CEg/eMmglxZuremr+tVF74NBAZ8mOrIkT4hCAgfLa5I7rTcYyUH5wM6NXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38100700002)(6506007)(38350700002)(2906002)(66946007)(86362001)(4326008)(66476007)(66556008)(8676002)(508600001)(52116002)(6486002)(2616005)(5660300002)(83380400001)(316002)(36756003)(26005)(6512007)(8936002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H4rCzqmamA+WQFxfp/ZSCEK5xSNjMe7zHAAraRpQ8hBI2I68aEeuvRCOey5D?=
 =?us-ascii?Q?TDEW8Z4F7HgS0GTCAgPaaYoRpnOITTX1UML8pJ6sLygxWwa+apiUE7bMne4v?=
 =?us-ascii?Q?fh+e0Hh4zucg+P+t6Db/nJGateUtfbHsBe0k8P+me+FHk8ufCDCNP23skyOR?=
 =?us-ascii?Q?CM+hC9DLCd94qtQa6Yvz4/eIWfQyfnbVXdROaaaz4aMmaEmpuM0W7V7qRKqk?=
 =?us-ascii?Q?RvFUfVF1htkBeyDZc1CPw5hWugR4D/eUJCiqbvbnTZLr3Vw4fRaDfNQat68d?=
 =?us-ascii?Q?NPz26jpMpXqRR2gJBy0PlH3ifEGxYkTDqtP5yw7jjcUZ4SHhU7kuKAz/M6cg?=
 =?us-ascii?Q?CvLfUK5Tvc3Y4kdE2ZjvnogPd7fk710YFIWZKB3abNZpLK/moql0sCBFsqOg?=
 =?us-ascii?Q?JewYvVJRZURK6xCdJ5pgGMQXRhkCSIrNhOloSEK5QyDwn1O3019bk9f15id5?=
 =?us-ascii?Q?AXEF52wcHgad25E0DxXRVfdJaNzQzTRHphod1ONzan68vVlDPC9Ni0qi8mNc?=
 =?us-ascii?Q?WflbsfmCK1dr7oXo4qlm+FLNMEEEu2Y1n55TVUhxQXqGIpv1ygspYLkFDHgr?=
 =?us-ascii?Q?gQw8p526rni2m2UUzPeIKAUPNLt76xMXHcigy8WB0k33WIVFCQ1IkZHxvGRW?=
 =?us-ascii?Q?UBco3cq2tWwQ3DGmGIduVwhcbgzDMuBrNGQDlgxTpUipwPGhwygZSpydHhXn?=
 =?us-ascii?Q?PRouqDsXXZrFMz4KXUxw+MVk/s2nY+SmRjgdZR1nVYp9aRz9sP0/NOT4D8zK?=
 =?us-ascii?Q?Ruz9dtpdlhyOrF4FhO5FECDt/8YmlMOjghrqq6Q9JuSxITB7mU+AE0h8e0sX?=
 =?us-ascii?Q?LC/Y/inUefZa1wTDUlI6knQixAW7CKsLid51S5wJ5H8Nn2YSwXefdvQRS6AP?=
 =?us-ascii?Q?ZRYaC98KM9a1wlHivq8TiZWp5a2qpu9yMjvXhP3/qw6w/MX9tRoAe5eXAXTo?=
 =?us-ascii?Q?G0mAB5KQuQsGNOBcBA2T46h/SkSneGYTz4/DXOQYvqxnOd/DLKRHXd8YB4aq?=
 =?us-ascii?Q?W6TvYL0I7q3HR3AWYcYN5WLoBm/RwmB9CezJt8aQ4LWiDBkCdC2ouvS6lt/r?=
 =?us-ascii?Q?czxhEao9Jk8UzTA9kpeH680fOV6C0ofkY66cd79umzafDgI3A406YzxP5rjD?=
 =?us-ascii?Q?ZlvhrnIXqH0f2Wgwp1sGdsAVSvrTleDlelJ9fyvQxSc/do3y/IpWMsM0K3o+?=
 =?us-ascii?Q?Df1pd8NsUbIiBQHhXklfrA4dp+Bm3tyJttA9yoKRO4VtBtuopr5gck8mgvUQ?=
 =?us-ascii?Q?mSkO4VLNWtTjQTdNoYMzJq1UtUa6JNWuS1bxOR7oDn6y2+OA/B26pMycYWYM?=
 =?us-ascii?Q?2mnQuqrfR8Q8c2CGe2TOQrPU91ZGn1O2tLCpMAOxah6BIX2TPCax7YyuUIBQ?=
 =?us-ascii?Q?PKLy7boe/7SFyGK0ZQ8UFBSZfib7m4/rjNpqp//2By8jaY9WEo/g3U5sK2YD?=
 =?us-ascii?Q?kZF/i+/MGoyqZ6RAwlSB4qCus4PyvRzC9Uddp27BIV+bJa91u4MgkMXzKuam?=
 =?us-ascii?Q?lr18wwUs9RUeVWGLv4B5BQyXZt41VldkWRnXCfYq3XdkVRMYBB3PiFZ/Dyqu?=
 =?us-ascii?Q?FEg0xm1wgE1hSJXDe/0BOXAlGcSy7+22i4We4FHs1dVMpYk+CUB1949bFXEy?=
 =?us-ascii?Q?3dUXrjr2J+MNAvLs4TTIGzmM55DXW2iqrFveoxMW6bXqbRS1afSHlM4t2Q1/?=
 =?us-ascii?Q?vi+kYR/CghLpV3B2PmCwESMgNrUB/tPmnyzYd70pOZS115RcTF5SyP0KTQXg?=
 =?us-ascii?Q?jJl4cXfPwwZjnEcE/jJ+aeqGdnlcyD9ajkP42MjuPTjpqdiVM/KZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0016b4-f497-4f50-e543-08da4dcafade
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:59:01.4928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7QFKEnxL3jd16NRyy5ReEpk5f66eAGeVaOq3oLHt2mDtnerVzp9Uaq7o+1YRaLAok5ZMR/C+QZuVkfP3AgHVI642gIoc+TOk212rhTLVjBvLfCe8OAx1G2SwBeuf5k8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1711
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

Current V4H PFC code has many NOGP definitions. But these are not used,
and it is different from original usage. This patch removes these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index d42470b54d50..1716399350dc 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -43,22 +43,6 @@
 	PORT_GP_CFG_21(7,	fn, sfx, CFG_FLAGS),					\
 	PORT_GP_CFG_14(8,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33)
 
-#define CPU_ALL_NOGP(fn)									\
-	PIN_NOGP_CFG(PRESETOUT_N,	"PRESETOUT#",	fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PIN_NOGP_CFG(PRESETOUT0_N,	"PRESETOUT0#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
-	PIN_NOGP_CFG(PRESETOUT1_N,	"PRESETOUT1#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
-	PIN_NOGP_CFG(EXTALR,		"EXTALR",	fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PIN_NOGP_CFG(DCUTRST0_N,	"DCUTRST0#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
-	PIN_NOGP_CFG(DCUTCK0,		"DCUTCK0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTMS0,		"DCUTMS0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTDI0,		"DCUTDI0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTRST1_N,	"DCUTRST1#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
-	PIN_NOGP_CFG(DCUTCK1,		"DCUTCK1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTMS1,		"DCUTMS1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTDI1,		"DCUTDI1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(EVTI_N,		"EVTI#",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(MSYN_N,		"MSYN#",	fn, SH_PFC_PIN_CFG_PULL_UP)
-
 /* GPSR0 */
 #define GPSR0_18	F_(MSIOF2_RXD,		IP2SR0_11_8)
 #define GPSR0_17	F_(MSIOF2_SCK,		IP2SR0_7_4)
@@ -1204,7 +1188,6 @@ static const u16 pinmux_data[] = {
  */
 enum {
 	GP_ASSIGN_LAST(),
-	NOGP_ALL(),
 };
 
 static const struct sh_pfc_pin pinmux_pins[] = {
-- 
2.25.1


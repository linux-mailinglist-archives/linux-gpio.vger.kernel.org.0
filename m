Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79C653F335
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 03:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbiFGBHS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 21:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235568AbiFGBHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 21:07:17 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA9AA466;
        Mon,  6 Jun 2022 18:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBd9KrOF4U3CWRa736hcytkXH9VPSQ3PL+Ya+YG8wiD5l64sZEGPBTZENe5STmTHOjjb+qbku9iNVxCsboKdviJEk/frbsAYc9W7Us2bWKPpmewnqKAd3dpW2RC4nxOe4JzGInxJjQGWV1wiROrTWE3rmwzmg0g8+JfgulfX8sA9hjUbT4JEiVKQ3JmMZJDPAn0A7fEYhkhPYP8/lpwZY1/COiyjLZ2ivLDP1NCQBCx4GlD2Vi3IMnMS3B2ontED1uuM1y962+ZuLlHVe+e1MNFmt71ACDYpOl0VTF5VgPLVZW9KtLZ3A3kgvjHtBtmOKqi0v0fZ5CYvL/WJj3TYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J25OCSGpaPgDw+jPjFuRZ4uVwwouJy+2KnXihvRVmmw=;
 b=Bx9iuCr4Os0zSVhnl51Y+7ZFRsXe3czhgsf/oMNJTM2+bjTF/00LUV8cuUccpcO21OvEpVPzzRas2Q9XDGX3wBD0XAeJP8a74fxZb8ypMKF7wFwqBx/+tZ/DJykAW+v3Xe0xTAOiyMyMWtA6FfVr17EuRHghUkwYCUUofGsIgC7sS7Vd9bnoDZcYUQuAeZoie0/S7lcng9vG9867mBjNgiuoPDD5j5TuBObQJrs007XWDZGeewmds8oLnh18wTYQ+KFKbLUveL5CRxoy/3BQKcGdAMW4J2n9fLV5rmT6UnR2pvlujTLaGH8nnSsOwzbKJ+aP72xDWPNR8VBFIvqtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J25OCSGpaPgDw+jPjFuRZ4uVwwouJy+2KnXihvRVmmw=;
 b=JqOdeDeFd6BlF5ivliLpcKurVbYv0msYGBRi/bh64r6VGf3cr8koZWngoig80YCFTTqdU1FXDwgiI28ZPk/WPbLxY8oUvHcuScfnP8YYzO06TelEmMvMV66f8rQyNrfEpn6VdVT23/Zmztu/C1dlk5GSrWcuWSO7yV08VjarTNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7781.jpnprd01.prod.outlook.com (2603:1096:400:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Tue, 7 Jun
 2022 01:07:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 01:07:12 +0000
Message-ID: <87wndtgu2o.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] pinctrl: renesas: Add PORT_GP_CFG_13 macros
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 7 Jun 2022 01:07:12 +0000
X-ClientProxiedBy: TYCP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43c2659d-9125-4255-5393-08da48220df8
X-MS-TrafficTypeDiagnostic: TYYPR01MB7781:EE_
X-Microsoft-Antispam-PRVS: <TYYPR01MB778180A5FFCC83C293AB045DD4A59@TYYPR01MB7781.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7tBWLj8UXFiZQzTc+XhJNx0YTT0xiX2Ox9D9mtU9vehbO4RVgzsJYIb1TDPjk5WIY/m3h+OXhWaK2nVZQQKISMB9WPjDfBbMLDIegTeIg/UDeQbo6K1FZ7/i2W016wpfeu+fXoA7bX84YE9J3pQsBM76dE1YybEhYVOQVknKCUsY0q9c6DiOHcq/ql9bTe1NTvxjrZ3EFvfq6ZZ5x5hfqGo8qjHby4Wepu2IopGcsXwXa3bBCtYWIcLtrlYw5uLMSlnn5F39cmHPm/WDv8+vNl0C1msdS1S84LWL3yXn7xBbNytZ+sVEp+tlQOx3/ZHQoT/4ebQBxSrKu7SC/90l+SvAV8zL3+JbpmUVJ4Q/kSOmv6RtIwLuNSWukS8ID3dS9FJDcsB7nyr9TzQWv7K15fgUgZzhNRBE2Y1c9jaM6ryIhIw4rosw6D4stZ2nTKEsgmtXBRRBeFiEH3Y9d1ntrQNRnqxXoMGRcvJ/PjkTyMWJYXvm3eSawIxMxjrjxOwHafsUKM5tMsSvpijVf2SPU58EWjiMA4gAoM/MkepKIylcbk4H1c36bDh5/i/gcvma/7necRbtmOdaWzHhvYOJvjF4V7iY6cwyjZl7ttDGaXAi2Xr5NkSXcfZjpWEKHt/tT0PMPcUSZvDDS9kZy0OKif9i7t7kinFGWpRMvdYjWoJgR06UdtnkymWVuvSRUUkp09xnzfTWeCyoX9c+YNBrPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(8676002)(36756003)(2616005)(66946007)(66476007)(6506007)(52116002)(66556008)(4326008)(6512007)(83380400001)(26005)(508600001)(5660300002)(2906002)(316002)(8936002)(186003)(38100700002)(38350700002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BH/CAazMJFjquUaGQG/pSzXRU2L83dXPwy2HV+/Q3TIcNJQfhbyJ3H2oEIZK?=
 =?us-ascii?Q?ewcz9BDiGAdYrmIXDHVSiszw9SIWdx8HX9cF1r4Iv1VhL0Pez0lrUafnj4bb?=
 =?us-ascii?Q?E9KD80jjL1F14UKMch4QwAYk0Y9ULiqx2X+hauNOpp6rZ1hQOOwZCeetvTIm?=
 =?us-ascii?Q?OTjqsRrJ4sIXFJW5pLYmwY9MZpBdiPm+I+DyWWMc5qPxY9jvpQDDo57VnZIp?=
 =?us-ascii?Q?yyVpvCrARg4gaulUNXgFsQC1DOnRmgfa3nWn5VLQLdIG4DOQ1PRouQ4LSS3S?=
 =?us-ascii?Q?h9Bo3A9dEPUF5WW1Lz8Iq/05EWwM22CkFR7YMIbuauz0fN5fgmzVrMxss4Lv?=
 =?us-ascii?Q?1/U8CdaM6Y2sQ0mYUS0PSKzl0IosaZyughSjZnN9vB0jZz8Y8NOOR2ZgeRLg?=
 =?us-ascii?Q?qtid5Y0YY6UVuiTnGNPtMi8wO8X6MaSp2liRsf/rJPtYf78QvKFnmKrauG1p?=
 =?us-ascii?Q?v8tFqJEqyGFk0LTxOOOGm565+wYywomRlxqFjO2wSZqqM4Vc6+WD+abIJ0Qr?=
 =?us-ascii?Q?QF2utLiSwY1S/CLtXRJq87oOBlV9AFuSVf+NjzwzMu2ILJEPeQQLc+NqWcfO?=
 =?us-ascii?Q?5V2atX8jIkDV/4DFh+3p3rec64RP9UCxpZxhAxHjN9KmK5E36akbGGlpuT/N?=
 =?us-ascii?Q?ECoeKEFxqra6uln2QLd3CuN9z5AMCxegrJGN4uHKaEooF4vSU/I74HT0tZrT?=
 =?us-ascii?Q?7fTfMpDt1gyXuWgoUpArFDbAcqiIfWrqaqUk2c8QLjKkznqAW8NLZpAC7iVN?=
 =?us-ascii?Q?OmYlS2/NTVsegonGbo3S2E7zUeCTUrYlJhfzdCKWEj0b8QkWuCVhYfCz+8BR?=
 =?us-ascii?Q?W5rFKKjZUWTXAchk3QLYu6qhB/Xrs4tq/Ose1mrSefbbprZj0h+PNrs9tjkH?=
 =?us-ascii?Q?fzcGChmln/Ev3/XNr/yRVYma6NnRFEeQvI1r1Ub2Ga1+XKoBKFo5MXht48X9?=
 =?us-ascii?Q?kPJIsyj2TpILR/xv/uhCMgHuFMottkgaJ5RmB+bLxOwkYG3oB6L0FbP9nXwj?=
 =?us-ascii?Q?buATZfmFGJASvHgP6h7aB8z35qrNv+EbEKUDskXs0jfCBBRnX4Ko5H7Rh/WE?=
 =?us-ascii?Q?h3nZtWWYRzz0Az8/lqvbBjIjRWokBR2zpWh+lKNa7KrwI6AwWtqdY5MUrlvY?=
 =?us-ascii?Q?cByDPiz8MwrOe5qil1v6b04ykOLDEd1lt5g9iZuwvNcaObv72zxuOvl0tmII?=
 =?us-ascii?Q?q7uvzzyXOzArkBQjgv4GZZneVpZHKaBqBebYfBwp9hgInU+LTZ+ye5i/Zc3q?=
 =?us-ascii?Q?k7nOguZMPHpEed4p5R3L9bkoFx1jauxC25FzMp6nbB4LVrzoCMvE6nzww8QQ?=
 =?us-ascii?Q?GPppojQLAPu1ZquGOYCzPulq1aVSy23WJmAbz7afq18EztIsxKOWWKQulvy9?=
 =?us-ascii?Q?OK2B3+tYj7yAyeQM6ZwpNTOLKPU1XVQrDKjtLJCbi1/vf6MR89IlPQfPavaW?=
 =?us-ascii?Q?qEVxZmI5UdNuMjI8OiEH1hLduIKTH2/n+sxzzHHibZ6VlmE4aJQkY7JSiSdz?=
 =?us-ascii?Q?kwixBkoxUkceTvz32fSzz8SrDAKJVjzhtWanWwXQ1n/cUlv6iYv+m4/f5kGO?=
 =?us-ascii?Q?Bhsc4pSsjD4Iv/VQ8uMWzNmnu/Z/qpabdGZfv3FHxLXFOOoglJI3ydoNXrkc?=
 =?us-ascii?Q?bbxKPfVt8HGAofWcq2UCqTsiQ0Y33V4/6ogfTYPm4OJV55agM1RV756lllVF?=
 =?us-ascii?Q?wR2UN8YsdOxLAuiOFCibZmV+/VxGeqsjUnYUgkS3ywM1GL3yzE+WSW7CN8IB?=
 =?us-ascii?Q?EZj0kKWoLf8W6bqBy0p9Zv+BdHEJV1F1UCI3KDpaKJwesb0O9a0b?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c2659d-9125-4255-5393-08da48220df8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 01:07:12.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7bQepWIRJr8Bo4hclojzT2pk5E7rs7w+r57kbBdaze+h79ihyfR8bthOyGwUtptVrFjMV+aTaSP4W2iBgp/rBzokJQIGb8XHkb5cXJllsQvVSydz/5bwgJ+oz3kvEmt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7781
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
 drivers/pinctrl/renesas/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 12bc279f5733..bd0ae9d7005a 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -492,9 +492,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
 #define PORT_GP_12(bank, fn, sfx)	PORT_GP_CFG_12(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_14(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_13(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_12(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg)
+#define PORT_GP_13(bank, fn, sfx)	PORT_GP_CFG_13(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_14(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_13(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 13, fn, sfx, cfg)
 #define PORT_GP_14(bank, fn, sfx)	PORT_GP_CFG_14(bank, fn, sfx, 0)
 
-- 
2.25.1


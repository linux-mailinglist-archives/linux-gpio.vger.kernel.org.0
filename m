Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D309D54A918
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238504AbiFNF75 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbiFNF74 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:59:56 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2127.outbound.protection.outlook.com [40.107.114.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65AF535AA8;
        Mon, 13 Jun 2022 22:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItpS0ETCQkZeEyunTBYGXyyg3Rd3AxsL8FIcM2hKFZpxjXjWTI80d76DRcZuTtGqCSH8uKGi9pyuf8KZrYLYBhGZ3IgDdAX5QGQ8WuFUszJ5LMZ73ekZ0GrP8+v0lav4n/B+ArkufKqZg/lTofWT8xKVBZ+ksP0Zk6D0IpHPqbLGq4/MjvPzvmsBiEs8pIQYw1/lCPXbautAQ/u9yPY4HmEVHQzmpv+uU+gDRpNLF8B4sYKbMpOKBgk9fuGNj/VeQhnPEXxSBjb8AKzkN3Cmaci6FgJT4iS2Ik0+sxIhwL/OLqUs6VKExszoBd436fb/Vo9JljIl9+H6Gaq/YBFy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYBBLcCCnvvHx14JJcuQby6kr5w0bO66vlGr/wyStus=;
 b=d4kDejjMawExZckJmQ5DywlyG4HfKWqKwncEvYLCR0KvSCR2iAdtGP6kws/nvvxYgxlVNDmm78J6i1BMvcWD5u2GJdu9su31DF91A2zyn0H7mKRMXF2LpE4pNOiqigibUaAJPcy1CUvJ+dodaqKrEKAMeGSj3TcfWl+m7/3Md+enNbdU+67z5Lg7pFaLRoRXDClBYJl4zu2jBCwBONE74vmc9DkAmx8z6QloJ8sVOjLHtr9BWA8/XXOBVO3sSuLzbhQHb7IhDi8fQ++I8K7NPf5WrjUUmQY8MKUgUx6slRLkr30xxdEbbrugHCg6V8CbrFAFVxjBSIOEkA37zAO9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYBBLcCCnvvHx14JJcuQby6kr5w0bO66vlGr/wyStus=;
 b=ns7dNZg6JQox5GSGlciqtxWAz6gDYkRaXNnffrHws5WIcwj7QjPlPr1TectG01++Ij9u2YZX409GW5g63oUvRpcLE1w1/NK9HXvbACIKBxCX8xsEF9hLcFuL0lW2TDVBZQeRlgO/3kX31643hfDaZlihEkRnwT0zoCWbP98p32I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6167.jpnprd01.prod.outlook.com (2603:1096:604:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 05:59:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:59:53 +0000
Message-ID: <87mtefkco7.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/21] pinctrl: renesas: r8a779g0: add missing HSCIF1_X
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:59:53 +0000
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91c6445b-6480-4e94-8530-08da4dcb19c1
X-MS-TrafficTypeDiagnostic: OS3PR01MB6167:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB6167886EDF7B7237ADD81B0BD4AA9@OS3PR01MB6167.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: puwhL8/6f2zrRxWh7lAWOkiokFdUaUf/Yi4RaNZH53sOTqCaWO1RM3E0gyiE4YEJZQjjKmmgFTuoIrZLLtsvQ6HRn6p5iJOPoe+LjuamKAGXhAKVNLLfKaGvCD9rHdXM2Og5Kt9t2ZHbEOiaF5BEqalsUL5rXNo8zCEiQuhxBT1Qr29bh/fyt+yMg8SmZNiEW8qsaOxg/acpaHkRXW9UVsHkO4u6NccshkhbTatfSa/Kt2TOXD7mXwkcaxAQdxXeQBvl6K7F8tOnaL/JL44SiVQLYpVuKEELoegp9nf1yXFfqMCMnSsHnDgiGz1fHUhKSyRYqeE0LKe4DiRxp4l4iglJLBqqZL3E9epSPb+22bo8CsaDXolUXJpuxxgNPwv7X/7jx8BvoAtjrM8a0vgtLPoRGPsBIi4V2gzdgeUHwzENbGAif2Cjl+bLmuqyTEmMk5fGTZc9PmnViiTZAcR/bjzs04upW3raWgvJNxjNmZdPkunNt0Vl98AuTS/XnaNT5A4PF3JdBBQuOCC9rWmiyRqWHf40h9HQHURrhfStQXdvUDrWqDdEWK+djom9BimLJBJsIEbUNvM/iztuZ4rl5m4MTm7+mHBMOTtcaFNkYcpLAM2B3HlEQ3DousUBuSpRGlNcmw5pQeiik5/2E0AvCCWyuRPaJoFt061homVCfazP2CTkTsPgP+oDfbCATrtleVjApq/8Mh5CAJQuZgdYDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66556008)(508600001)(4326008)(66476007)(52116002)(38350700002)(186003)(316002)(6486002)(2616005)(83380400001)(8936002)(66946007)(8676002)(36756003)(2906002)(5660300002)(26005)(6512007)(86362001)(38100700002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1a4jNBS7ENcvxpgyKemQLfpmBx0JFRG5Hn1OK2rrBcQ5IjMqXS+41O7uKZh?=
 =?us-ascii?Q?6L7WJhQIrgSRSeNDbEceP972DCpsGUK2SMccvmeL4L5PB2yVaykDl8CcJ1AC?=
 =?us-ascii?Q?TYwjUXT/vcn8a4Acq/gKPC+GiXwWgtLCrJn70CJEO7QT2zmxBeZouCN5z0uB?=
 =?us-ascii?Q?5IRII1c4cyiNA04dEvYFvrFe3C4EV9VABdGgpi5Q/pIzbI/FfOczxnImh8Nm?=
 =?us-ascii?Q?zdhI7lFDOpn+5GgUfRiEIZWciLPcNcTdGkr121EjsTTviTe7LXfcbD/pWGmg?=
 =?us-ascii?Q?jsQSU+GTOSItQK+ZymH3m8n5z3+vs14m2xhE0bw+KChWy0MAuzxmBPeNHInT?=
 =?us-ascii?Q?cX3L8SQdhAeTUaXOZjmeKj/HKHT/yvyyMmbb73SL3MpPt7bpPnRl0kQd2RZF?=
 =?us-ascii?Q?6+NmBkQrEpLpPXSZY4VgDcHQA6YsGRx73j3JVl8FSMsdpxeHsydUmKyMl7z4?=
 =?us-ascii?Q?vQMQuYkneJmqz4FjgYHu6SCsBqChJmdrh9QlqxVzWJdSNwTr2uBWPKE+Ewy2?=
 =?us-ascii?Q?t9NJDyJZzjL4MGwNXyvv4URFF/6d8ACOwkbyj42wkPsLmL3H4hJW/FnVgLqK?=
 =?us-ascii?Q?QEz06k1LSUZA6XlepitopEM+aUMx3Xnt0EjMG8GIfe6vpH1B2WCxtnqRiMY+?=
 =?us-ascii?Q?SHxSA5Cc1YmncO0mJygu3iS0wXNDx5PGgcHlRPflqO3OHB16CxjH01QSajwf?=
 =?us-ascii?Q?4+MlN2ls4x5hyKA6gA6hkXNwdOfsVZoawGVP2wun+HDwTG6F5q4GGl2XnsUw?=
 =?us-ascii?Q?6plWOGKPyqiUDLS9wrXCzukFvbe412uAqDUpll0VB4ej/emGNPxBkIH8ayEk?=
 =?us-ascii?Q?uHaXPyuZzAwneolRt3TwU+yjg5+hc/g0jQZ3mS3POu8diUb0gK5dI0kFPN+g?=
 =?us-ascii?Q?/FUj3xOvXX52Tv27btBwOLD03VzL1Yj07RUaKe1fgv18LNzOw0D8+9r3QBxF?=
 =?us-ascii?Q?GTPLm6RfTNUVZAj/08G0yC6qYfNvLCgfJ9KHk6vmQu/oJRR1uy8w8+uTDKYR?=
 =?us-ascii?Q?GqX99SCLPF24Rp2+LGN8iOgczLRGOdiWdiCYtRmludumptTmQ4bSRjuHEXFP?=
 =?us-ascii?Q?Mx6xopzgzOycclZlxm6znZ9iDK6gIi2qkf2JlCuzXxSO+QsNZQmUnu9mq0aK?=
 =?us-ascii?Q?x2OS/VBXLwfaxffMS7mPVu8uubStdxeh/F5VrPBpeSRhA4tf0ywXfpuuKP2s?=
 =?us-ascii?Q?bt9q3BmE1X272v1dQcIycDBH1iFISdTFR9MwU6194J3DK7Kv51pXyK+tMHUI?=
 =?us-ascii?Q?Mn6glBziMoOGnJ/zbMy83migntS00Ebpkex4bbUQ/MqvTKNPPcTGpT0NyvLn?=
 =?us-ascii?Q?2qhtQnhQQXfjZusqg9lnuy9dcx/+uRB0AbWCr4SweIVk1435ud8VsvOxuDx6?=
 =?us-ascii?Q?MgkSSw0AcXICE20ogUa47Vq55hTjLhsUw/TtjEqafMs+de9d/tNxAWjRRAws?=
 =?us-ascii?Q?9gLOdSPCgJb/3uJllh7jC87jNcqZRBgxi4O3lwFDQR7sT/CzwstHW+wVNSJ6?=
 =?us-ascii?Q?CwGiiRmERF2S6PPuZe2csNk7jSgpfpt027ia9UtzYz7XJxc5aB/oEY0cd1nK?=
 =?us-ascii?Q?/FfMBnW8mhlycusl0Z7BHG6LWNSbHStz2CIVtRP11qB/LHtXhKQSvyzyd5QQ?=
 =?us-ascii?Q?+pSnhyIKzHFp03mAw0soGxY7Ngq4mtEOBtmEgz2Kxr2GmeigX/ESJLrHPQTM?=
 =?us-ascii?Q?H9auM1G0SrOo2UradKlEiCdNCJp6FZA2nKiIvi/Rp2AaHyaKN6CDsnZ/6pDR?=
 =?us-ascii?Q?uHBNY2KF64w13rkzuSS6g68/sws48UzJ4bTgZg51E2iTGLnfTNZN?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c6445b-6480-4e94-8530-08da4dcb19c1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:59:53.4190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDWd7cpCgM1zyktbtM7TleTBC0mtUyiwMaOYC8rzdEYAdaMQReCxeBXIH9vJu1eEN17KLfKDx8m9N+x2noEtiNa+3w5Y21QBZ5JYpZnuNMDPee7D7XAwVKatsmfUz9c7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6167
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

This patch adds missing HSCIF1.
Because Document has 2xHSCIF1 with no suffix (_A, _B),
this patch name it as _X.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 50 +++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index d84fa59a0bcc..8af0bc89d4e1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -295,13 +295,13 @@
 #define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_27_24	FM(MSIOF0_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_31_28	FM(MSIOF0_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR1_3_0	FM(MSIOF0_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_7_4	FM(MSIOF0_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_11_8	FM(MSIOF0_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_X_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_X_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -839,15 +839,22 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP0SR1_19_16,	HRX3_A),
 
 	PINMUX_IPSR_GPSR(IP0SR1_23_20,	MSIOF1_RXD),
+
 	PINMUX_IPSR_GPSR(IP0SR1_27_24,	MSIOF0_SS2),
+	PINMUX_IPSR_GPSR(IP0SR1_27_24,	HTX1_X),
+
 	PINMUX_IPSR_GPSR(IP0SR1_31_28,	MSIOF0_SS1),
+	PINMUX_IPSR_GPSR(IP0SR1_31_28,	HRX1_X),
 
 	/* IP1SR1 */
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	MSIOF0_SYNC),
+	PINMUX_IPSR_GPSR(IP1SR1_3_0,	HCTS1_X_N),
 
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	MSIOF0_TXD),
+	PINMUX_IPSR_GPSR(IP1SR1_7_4,	HRTS1_X_N),
 
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	MSIOF0_SCK),
+	PINMUX_IPSR_GPSR(IP1SR1_11_8,	HSCK1_X),
 
 	PINMUX_IPSR_GPSR(IP1SR1_15_12,	MSIOF0_RXD),
 
@@ -1554,6 +1561,29 @@ static const unsigned int hscif1_ctrl_mux[] = {
 	HRTS1_N_MARK, HCTS1_N_MARK,
 };
 
+/* - HSCIF1_X---------------------------------------------------------------- */
+static const unsigned int hscif1_x_data_pins[] = {
+	/* HRX1_X, HTX1_X */
+	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
+};
+static const unsigned int hscif1_x_data_mux[] = {
+	HRX1_X_MARK, HTX1_X_MARK,
+};
+static const unsigned int hscif1_x_clk_pins[] = {
+	/* HSCK1_X */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int hscif1_x_clk_mux[] = {
+	HSCK1_X_MARK,
+};
+static const unsigned int hscif1_x_ctrl_pins[] = {
+	/* HRTS1_X_N, HCTS1_X_N */
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 8),
+};
+static const unsigned int hscif1_x_ctrl_mux[] = {
+	HRTS1_X_N_MARK, HCTS1_X_N_MARK,
+};
+
 /* - HSCIF2 ----------------------------------------------------------------- */
 static const unsigned int hscif2_data_pins[] = {
 	/* HRX2, HTX2 */
@@ -2378,6 +2408,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif1_data),
 	SH_PFC_PIN_GROUP(hscif1_clk),
 	SH_PFC_PIN_GROUP(hscif1_ctrl),
+	SH_PFC_PIN_GROUP(hscif1_x_data),
+	SH_PFC_PIN_GROUP(hscif1_x_clk),
+	SH_PFC_PIN_GROUP(hscif1_x_ctrl),
 	SH_PFC_PIN_GROUP(hscif2_data),
 	SH_PFC_PIN_GROUP(hscif2_clk),
 	SH_PFC_PIN_GROUP(hscif2_ctrl),
@@ -2579,6 +2612,12 @@ static const char * const hscif1_groups[] = {
 	"hscif1_ctrl",
 };
 
+static const char * const hscif1_x_groups[] = {
+	"hscif1_x_data",
+	"hscif1_x_clk",
+	"hscif1_x_ctrl",
+};
+
 static const char * const hscif2_groups[] = {
 	"hscif2_data",
 	"hscif2_clk",
@@ -2805,6 +2844,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
+	SH_PFC_FUNCTION(hscif1_x),
 	SH_PFC_FUNCTION(hscif2),
 	SH_PFC_FUNCTION(hscif3),
 	SH_PFC_FUNCTION(hscif3_a),
-- 
2.25.1


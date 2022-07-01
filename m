Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862B7562870
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbiGABjz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbiGABjy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:39:54 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F8B38182;
        Thu, 30 Jun 2022 18:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDnjLvd3MFOtJj3INV1Oz7f2o2Wd5baDwpU7dJPK7AeUdFjbGDq4YguZPqy/GcCwD2cMXxVnBpZi0uSS2wlzb+bpZeOte3Y7U4un2N13LuU9lu/OyX5bZ4i/imegdpN/J0UL1rhaQadME/0U31kNJouOPBQqAbsQzRnAb20QcCYsWEMgz5v83KeG40L+Kz+Is7ZDkFWM1EeYcNDyyqHR9KKHSWuUIXztD82o2VTyGSE+mvhiHHMYhGUZwBEOIfBmitRMN9NMtT5PKW3pGRdi2SCSKAk4hSfcXH2qKtVTGGNC9ygOaGgQwmULvhd32XniDBjBx9GyYrU8TcTXodNmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1SSB62g/C6qF27MCTGfx48/GERVsNqnr4H88JAMtrI=;
 b=Osw6UK3X0Te1o7yAkp58pfGrBvxFyGP+8s8HoqjNlFMxPMYsZviVhA9XE+FvbYaGy3VcS+IfxemQAH4VbuBIc/PzMzD7Ivgg71H/H9pYpPCjlNEzWvpr34IKyT0JDXmwhieOVX96xgSh3X7vcViR+80Io9jXnFyS/3huGzcCNdmFgt+34mTrzRHhh/Qss254uF21+HftSLa9MkQgdESJemKJgf/NIbXpX3Tg2ObjcRhYlMajRAHf78cvOgSKIDbzATHu0t8zBadAXrCCbGAbuMdywjMPyYt68ooixTvqWQgMf+APlrw5QmnFniyjVdYN4cFAOD6mHN/wpHoAXr1jVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1SSB62g/C6qF27MCTGfx48/GERVsNqnr4H88JAMtrI=;
 b=eyt/Jrrb6qZVQn9kO9kPTs5hsSEhQCc5pLWEbIv2TjwNNciYREMv3bbqQp1yNfdKJCnrhNMTqdywqilLRfDWwlD4b//8QevbHgBbSuG+owPdYM2MAgwfutn18nfELhOpq+ZCznOh+eGBwbFYrv6cCQcCw/EIndUTuWuuUZn9JqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:39:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:39:51 +0000
Message-ID: <87tu81sja1.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 16/23] pinctrl: renesas: r8a779g0: add missing SCIF1_X
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
Date:   Fri, 1 Jul 2022 01:39:51 +0000
X-ClientProxiedBy: TY2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:404:e2::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 041c3f02-1607-4e95-fb07-08da5b02974d
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IKeunfn+tBNDH0GKv7fbk5lNsm5QzUZ9+X8YAkJ3iQkJn7SZ/PpDdUHb6VACWh/x39ihnDCjgs+nsdWYp43ayKZHRUEexi6szCnmk4qdQdWmO6s7VeIuSNyAxyWjgafAiK6Uq//sW9HBNgPadgd7wBI6z/+6NU5pwsV1efmtGMmIIKW6fLK4MIaxEvXzDCzbSrz+pXH3SN/s9TyLodyGAofwlOMHks/TSKI3JaZ26Y27A2LTEy0IDpMD/ofie1DKzOh0FZp8W1lnLhawVt+FFuMslS1ZJ0/VT8b00CsggP/7HmZ7FFgVkSu5M9rCVFL01bHZ+3IhmjtVsr3nXk8N3XeY7bAktD5rV4z73tXuqr8+m4HmURav7KK64WBLvEqOKDTIMxd0c8b7njJMS4zDKUQ0pqc0q8qOXPHunBfNFsNqI+RRLhYUlpfq5upZsuT+2Ix8yAG8ZK42fg8W4zsxZ2QiPMYy1JI24nc6gu0XaARvJul5RMAD1D5NjVTizKtwPXabIgE/8FTHTnZYn89upSTpOUGrm/l97FYy44vRqH1LggGj1p8qvtIpdttS0wzLZQHSZaMhqk8Omjgp5IguoxHPMx2r1XS1t0gD1EE/n2LTUq7IJIVnAxnw/xAw7QPHR5mWEFU+wmzptxgj7W7WMnNMp0BJIdfK4WvL7YDdERMsrNJULja0EJiI7GDLhX3rSD5jklsxzIhWKM+OYKq4GAKMrQXrdlIoO/exOdwQhMGrJ/ZZDdgzYIBB8g51CH474zRAGICCJAgCXNQPbFNod/zBWZUI0LQat3wL2TE/PxIYy8K+kenUfGGjonaAtVSX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hEswF49eFJWmsHenOhcZPM3uTX6Sc70sQBQULmkXr0OSJKJJ65FauN0Ft/N0?=
 =?us-ascii?Q?laEPKPNzppcCwVn72NgHUsGSQ/Ol/If6Y1PwRYNSlY4LgrxD/0ysumaSw3tM?=
 =?us-ascii?Q?FXxMuZykvuUjBEx734513tmxuuznLXeaiqugMLMF4gRnUkDEqlGJZuIv/gZM?=
 =?us-ascii?Q?fQRbgGgqLoJVa6hftDKlnl5Y+2C3JUzwZX/e4wcc+T3rixcwXkfyYbDwIGlC?=
 =?us-ascii?Q?MpzyvN4q69+vyAZZzUJ7hWdhBdNO4ipCJFdVl8B93yiQ2bPPzufCZ600HhI+?=
 =?us-ascii?Q?/c2VaE8iw1RAC1XDq0X0YYpkIsldxo3rpKzFD5+FxtRAhXede/hEBnwUEYCV?=
 =?us-ascii?Q?TEm3kC3dOuC+FKNqUCm8AWw3pFWkH4nb58WyGc7xFttr9iqCkrbWp9nknuZb?=
 =?us-ascii?Q?HpFLMfaXPs0PIJB28HyX6ANpiyXK9bP7E+I+fjAxV12YKwMHSCC9Of8JKYji?=
 =?us-ascii?Q?VUkw/kAf0z5gmFyBLaqqM7EZQM+UIVTvKwaosjHlOomYZvUG5t6BXJqY20JG?=
 =?us-ascii?Q?B1bJFli1tVtynKdFKhdgIrdDUOScXdDIdQm7a6HxS9CUVDjHAVbJZV89rNhU?=
 =?us-ascii?Q?b7P8ueEckZiFKojk2kwdDEB/feJ7QsLgzDLHJwHrohnkT5t62Oh4EQMdtRcG?=
 =?us-ascii?Q?ERTAdQSOtKWXLK1U+fIX44Qz948pHFJdo8Tpw7okG9Q+piWtbXDM6lDK9YjN?=
 =?us-ascii?Q?1gQHFRPorywz1xgo7+0etsbr2L6deJ+zeDczuNLW/C60y+8ceDPBgX9dVbvq?=
 =?us-ascii?Q?UWR3pj5EgCWzrsE/TO8Z/N50tHmtf+gxA79flt19UIWXM8BaXKdycXt+p44B?=
 =?us-ascii?Q?2/HtQFuyLv3ws3biwY4sNyvixripWhJt5QXVAQRuM614RMorGVFG77sgGkwJ?=
 =?us-ascii?Q?8YjIpi9oooxHJVGvhJJEciPKSh/4LQ+ybV8GEzNH72AFAUb2nTIC9bxLtGmR?=
 =?us-ascii?Q?hvvvge39MA1QD5qrrIUHkF73aWD9C52NwyzMW6hUDdWTFaHzz9S5SZVzQMML?=
 =?us-ascii?Q?kn+7qQxNqjsllLrQUOl9ph3fksKewy66xpgw7MpJhbNzoJ0C7CWhizek4K1Q?=
 =?us-ascii?Q?jZU//EH7X62NOMVwiKjcJ68C2YVUCfkpvYgciunsN4myaz0Z8m5tS22I96tc?=
 =?us-ascii?Q?R3pWgXAdkyO+pTujjAqst2PBgeqKYOX3sqYbeaRBlOcZFd0BBqzK05fjngb/?=
 =?us-ascii?Q?oZ+SgMmsk9OuWpRWkMB75XXWtI5c8MYBS8YT1OD+EKEW3hhOvCvhwXmORBsl?=
 =?us-ascii?Q?BTIgSLBJbUOg40YyvOlB9WlYbgFs+bPG0WO97c0J202Ow4bSLy4/iEpHq2u6?=
 =?us-ascii?Q?tMcEYmmYhTC3EzTw0lO95qAgrdLONMkbHvdsvx5hHv51Af4WW7f4kNzKEhoo?=
 =?us-ascii?Q?J8i33nQCSSK5E5OM2Sba/ipxrEFB2dUIE5u7teMNZzgW3xRRNL3wjwcBWp5G?=
 =?us-ascii?Q?0bjug0poBf1hYrJC8qsMUTZsFkamkO05kXbrVsnEtnd6ZHMW3SkqopmnyZqC?=
 =?us-ascii?Q?C0GzTK1Ej4fne6oPqn3eEOtTBObDpODbjeaApn6OL+88VFbKSsVGWjF61khi?=
 =?us-ascii?Q?B9j+OyNJ4X61oSU6Hnjaq38EQZgmHyWFTdPH0GX+G5ca7lDOvzVp98OtPb5w?=
 =?us-ascii?Q?QMCAsw0jy/jl8O4aEwyuCe4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041c3f02-1607-4e95-fb07-08da5b02974d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:39:51.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJcFUv4/6VI3CKpbPTctJ6Xy3BfAkoXTLDEQCZd34DJPVx4cnPqHFmhQYwi3k0itSs8tJ+NWoT9SXgwZ+qs+ylNAQ4MJ8gaN5qMk2ABI0xUP84eKBT634NKDzB2tystg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7362
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

This patch adds missing SCIF1_X.
Because Document (Rev.0.51) has 2xSCIF1 with no suffix (_A, _B),
this patch name it as _X.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 51 ++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 114b558d75b7..cff48ba6f5d7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -302,13 +302,13 @@
 #define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		FM(CTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		FM(SCK3)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_X)		FM(TX1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		FM(RX1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_N_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_N_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_N_X)		FM(CTS1_N_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_N_X)		FM(RTS1_N_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		FM(SCK1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -818,19 +818,24 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP0SR1_27_24,	MSIOF0_SS2),
 	PINMUX_IPSR_GPSR(IP0SR1_27_24,	HTX1_X),
+	PINMUX_IPSR_GPSR(IP0SR1_27_24,	TX1_X),
 
 	PINMUX_IPSR_GPSR(IP0SR1_31_28,	MSIOF0_SS1),
 	PINMUX_IPSR_GPSR(IP0SR1_31_28,	HRX1_X),
+	PINMUX_IPSR_GPSR(IP0SR1_31_28,	RX1_X),
 
 	/* IP1SR1 */
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	MSIOF0_SYNC),
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	HCTS1_N_X),
+	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CTS1_N_X),
 
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	MSIOF0_TXD),
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	HRTS1_N_X),
+	PINMUX_IPSR_GPSR(IP1SR1_7_4,	RTS1_N_X),
 
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	MSIOF0_SCK),
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	HSCK1_X),
+	PINMUX_IPSR_GPSR(IP1SR1_11_8,	SCK1_X),
 
 	PINMUX_IPSR_GPSR(IP1SR1_15_12,	MSIOF0_RXD),
 
@@ -2181,6 +2186,29 @@ static const unsigned int scif1_ctrl_mux[] = {
 	RTS1_N_MARK, CTS1_N_MARK,
 };
 
+/* - SCIF1_X ------------------------------------------------------------------ */
+static const unsigned int scif1_data_x_pins[] = {
+	/* RX1_X, TX1_X */
+	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
+};
+static const unsigned int scif1_data_x_mux[] = {
+	RX1_X_MARK, TX1_X_MARK,
+};
+static const unsigned int scif1_clk_x_pins[] = {
+	/* SCK1_X */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int scif1_clk_x_mux[] = {
+	SCK1_X_MARK,
+};
+static const unsigned int scif1_ctrl_x_pins[] = {
+	/* RTS1_N_X, CTS1_N_X */
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 8),
+};
+static const unsigned int scif1_ctrl_x_mux[] = {
+	RTS1_N_X_MARK, CTS1_N_X_MARK,
+};
+
 /* - SCIF3 ------------------------------------------------------------------ */
 static const unsigned int scif3_data_pins[] = {
 	/* RX3, TX3 */
@@ -2501,9 +2529,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data),
-	SH_PFC_PIN_GROUP(scif1_clk),
-	SH_PFC_PIN_GROUP(scif1_ctrl),
+	SH_PFC_PIN_GROUP(scif1_data),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif1_data_x),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif1_clk),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif1_clk_x),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif1_ctrl),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif1_ctrl_x),		/* suffix might be updated */
 	SH_PFC_PIN_GROUP(scif3_data),		/* suffix might be updated */
 	SH_PFC_PIN_GROUP(scif3_data_a),		/* suffix might be updated */
 	SH_PFC_PIN_GROUP(scif3_clk),		/* suffix might be updated */
@@ -2786,9 +2817,13 @@ static const char * const scif0_groups[] = {
 };
 
 static const char * const scif1_groups[] = {
+	/* suffix might be updated */
 	"scif1_data",
+	"scif1_data_x",
 	"scif1_clk",
+	"scif1_clk_x",
 	"scif1_ctrl",
+	"scif1_ctrl_x",
 };
 
 static const char * const scif3_groups[] = {
-- 
2.25.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C23E56285F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbiGABhi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiGABhi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:37:38 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474895C942;
        Thu, 30 Jun 2022 18:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKKcXNHdZzXJaOXNXRH/YwIFX5ZpNq6TdQL74qN1GicLwHNH38Tltz3s6f/qSDL/uATkuI2m/z8F0DutO36muE85wEvGjvOOOJ7tHOP2HHm/hitCWe50BbNXDYNUaI24BCumaOoc7hsXESxhLWe553UmS5E1ICZvGNmPF8BtOiV4MDYDSqvwmG7221j4zw+6s+UWARrGFqgvM1hPlN++JrfPs+OOw9PxWbeqsPqyyftXrgCWRkM5zTPghuQkW2IGF/ufhegzxHQm/bj1vWexMJwZ92iiZFft8nmZIea+C3PQylBlAKNEIHGgaq24WAvVHGofU2qL2VMxKuxsKMgUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULyHGHaiTaNjtA4NPShUOFTgQBShq4Z7MqyfvmSZZHg=;
 b=jxo6CvUv41rntvXvcFXcPktC9Cjoifd3N7yxvoXCC3goahcpG9T2c11H1GPTVXuTIR2+6Nx2oFYDOtLS90AylMepSa32lOHuCw9qy0wT8XXCvb+u31DqxdOecYe0jP4SjNfBRieTv+UCgD/5K1j61AkT3jd+2l89bZqBb9aLasetFW008nwn2m5XGbrIaZCvRNwZedLDTotWjZR3Zf2uyTsSouOdqdLvmBy88SDj1d7kIqWl/lqjBgZ11FeAkMV/WUA3AmimNcgRaQblr1MUdwBpAYexX6rv2ApFVbuXO4qYNB2e9odhaUeA+I8pXKMa+UCOKCKhWl2pDUL3AjZ3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULyHGHaiTaNjtA4NPShUOFTgQBShq4Z7MqyfvmSZZHg=;
 b=eG6b1ceLI9CA1Zm5uCiMccRor4FMXgrWPfOG31zTaMmtoUCOETkjKUhRYuWP1oei6KsySwDqLaVQG7JspjZ0WAinrETtITaNympgtMvOijb3qqTFvJyuFhr2PWP8RVnfwNDwr8P+lzN7QJB6MhW5QMKnqLpGMogM5wjzHH2K9Z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:37:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:37:35 +0000
Message-ID: <874k01txy9.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 09/23] pinctrl: renesas: r8a779g0: tidyup ioctrl_regs
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
Date:   Fri, 1 Jul 2022 01:37:34 +0000
X-ClientProxiedBy: TYWPR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f02498d8-17b0-464b-69f1-08da5b02461f
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AWG3mrY7WCValtAiiiRSO88BdRPXgaW4ei0QIb4JmSLJYyOr8lYArtc3q/7TTVCeElmz/lIxOJ5ho7mq13to+TZbsArTOKkyv6i4qma/msE/MPxltsKRILAlLR2xPqyPQ1Xfn8ELi/FVfAI277nPeC61UsrQDVkreZ2eaeIBWG6t3F3QFElGlEqzNdg6aZnbhyWgpJY0WWNKf4MDRYnL1etADn3g2VnMt5EZ6XXVwDr2LrUDQKyWdJ3U+cSQn/lbaxVfILZUIdi4eeYNvL3O/wCTLBMV7Lx/jm+ery9tWXqHiCFis4+cF6/831ekO8X+oNvaW6RFccShHEKbiNIStmit5gXiOd515KLQgV3XDYgsx3zwBNdKAaybBM6GwrMWs4w9K8ApcxDT7QEHm8b4PzQwcfq0JrxtTVyFBPAIN33wrzrBaAcLCTCDIHpD4AOzjqtULUVdvinKnKmJr8+cUiDaqNElTrKDoDBozxwgXl4lW53ZLAQSzOo7bxz3a38i4HHQjRj/e1Z0Ll51puub71zBJArdrvZz8sgIkZkds4OKKnMFjguk9XroeHOBKTqY1/HDyetKDgaDQE6VKhYQG/C6alqYqLs6HnS36pUA0wGLKSC2NhttqIJnI2OOfD7QnyHX6RIoWxQQnx0nbFs90IkWebVb666cGerN9GjHGllo1CQl4sP3ljn0lQ0XGKkHcY89fWjjGASw5mwQDnYiTcl4b9IHWfe24V8M6Xa2axzDEwNeZIac2GuZcrwPRv6NEyyutei+raVCtu9DA14BIUCBWV+K4DQfiSyxCXuXpq4DtqaqidEeTvWxC4x+vr1V
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pH/kDNK1HHIDR21qu6hRFQ6F6iGyqs6k0wcwTaLTeouMOg9YxZkpxllaVDeo?=
 =?us-ascii?Q?rPKl5PPCmfgxRvSscZe6AikSPsh2F8FcOUVMr9p5xH9N9TItYChNbWhMJ1O8?=
 =?us-ascii?Q?MQz1XJk53auTNv46bNohgEyiz8+NIMdQUEIxD0tz+64CbDvwH/iK4PgZMQYz?=
 =?us-ascii?Q?60y1I9pk8I87DVNsI2NhYCuMrT5svT4XjjLVrze3i1LWi4UVXID+wUjXBPKY?=
 =?us-ascii?Q?uJbvG5ub5Wk84iWHKzBNqXwwBvldvKdH/tG1kstfnIYQRLil8kUBt/ERwdFd?=
 =?us-ascii?Q?pdobNV+FSH2LR6TUtl1gLjHFJghgqoVoXJ77Nwu95OYGml4NdOcl9FVhHIiD?=
 =?us-ascii?Q?RK2NS40tEwjCqgc9iEAmFjVBAVdoKiEqON/dsCv8mfHnor+bargr59A4fTQK?=
 =?us-ascii?Q?3FzteFyqsu/bPC3SvAqx7lAKQ6mlVx7HI2uGrmJYg+9PtM8ElTFrSY7RvwLi?=
 =?us-ascii?Q?yUzmOJ1pnVwJhbPfrhO/hZG+NXj0pWUDhxySEbs8ET4kqr6Upd1tNC7SiwjJ?=
 =?us-ascii?Q?9tZCoobATGoA1emJQqmKB6zl4/cSoFALGQTBTTiiCjnkRxkJZ3FRRSOTNy7Q?=
 =?us-ascii?Q?J+6xuKPbf0X6hWmfoaVbLW5G8MACTcL+w45PMJF1rkMkoQqBKfby+c3Tg71a?=
 =?us-ascii?Q?QF0vj32gvKsVtN87xeI36KT0o/lO1orZNtYcZuseOChjtTu/MTdWAiPfiIjU?=
 =?us-ascii?Q?HjSwcpTOclPkRYjfcrCM5usCB29D6tAO430vxoDH69XAEVE0rk2lCcz9szfD?=
 =?us-ascii?Q?lhRfjx4zW2xRFHnEVDWiXZO4oGif1cAcLQw4Hwcwg14e/eBV3xrAlNDKuvbf?=
 =?us-ascii?Q?C1A0qrO4vXpLgN4hpGi2/IleqhfRFpg+HvGMqVaL/Ez/82oEY6GToqrBlycZ?=
 =?us-ascii?Q?wpQRBYPLOErBUMc779T0IDpOIl2QN0SQVEU2z3lDWCsQvIBzFQqWqfblLMda?=
 =?us-ascii?Q?UveZqedAHmQppFiyk6iWw40xfib2iJflQvTrwKGhurTGkycwFrlVrzXwlwZO?=
 =?us-ascii?Q?H9SnO8OEgrl2/ktUYHor3c/NPdRYeBY8n/TxmrCLlZ8HeIF3p8bOICbD8BN3?=
 =?us-ascii?Q?UyYIbTR0Lej+QIz8EoarHacKHeN8erZ9mtTrs01Sj0t1QDsNhc3+4+5uH/Qa?=
 =?us-ascii?Q?Q0mYeoW2SCbvURB84Q8DgGPpEwfniIdrMg+sgLx0BO0fp3tPqb8jha4MeBsb?=
 =?us-ascii?Q?1V9/4knvipjPi+rOA/0/yp710uAPF73T5ekrVQF+xzvjepWuoK54TPEOAb/w?=
 =?us-ascii?Q?6g8cKO6VNZC5AuapUe+7ibKc/MPtVV2ZB6HZhFxZ4uOA9A5v7I/OWwz4yrc8?=
 =?us-ascii?Q?B4EGTSVEDzC1E8gs8TPqVCNDmcP18gYRA0+tF71KcdKkIGKgY3s5XYkQYAES?=
 =?us-ascii?Q?G8tCKIvVVcjPvZA/J6Sj1f4edoJnFQJqndfpaL1oROXLxDJds4Hol60rfR+d?=
 =?us-ascii?Q?dwzOJuvc8xxC5YdS/Lpy1/oVyJ7+vJw3ibX0IsqjbA9B9Bri3xdNUG0Yg5Q9?=
 =?us-ascii?Q?B6syklNqOLJ/bWVHoLMgWP3vpNndeYHS+vKFrzhOAdhWU3RuU0UucAiou34H?=
 =?us-ascii?Q?zK1OAwmZahSH0mR/OUBJopACkZI5zdckJB0vCxe9crlL73vO6CcP+1NLeFJo?=
 =?us-ascii?Q?myNTCK00MCbjAgoamhoSVLs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02498d8-17b0-464b-69f1-08da5b02461f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:37:35.6340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPVGMVQd0/DZpTuQG3jswDzrJytWCwi7hF5J3Nj62apPkuiLTXspVyqHYu86PNzE7QP5AEPZ0NshOuVtDaWlxvtr8D+3Bia4t76XFAAIrm6SRgnvgDaZDAYTSQADTSqo
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

This patch removes POC2 which is not used/documented,
and remove TD0SEL3 which is no need to have.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index d590f9108ea6..70ca971bbf36 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -3621,27 +3621,23 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 enum ioctrl_regs {
 	POC0,
 	POC1,
-	POC2,
 	POC3,
 	POC4,
 	POC5,
 	POC6,
 	POC7,
 	POC8,
-	TD0SEL3,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POC0]		= { 0xE60500A0, },
 	[POC1]		= { 0xE60508A0, },
-	[POC2]		= { 0xE60580A0, },
 	[POC3]		= { 0xE60588A0, },
 	[POC4]		= { 0xE60600A0, },
 	[POC5]		= { 0xE60608A0, },
 	[POC6]		= { 0xE60610A0, },
 	[POC7]		= { 0xE60618A0, },
 	[POC8]		= { 0xE60680A0, },
-	[TD0SEL3]	= { 0xE60589C0, },
 	{ /* sentinel */ },
 };
 
-- 
2.25.1


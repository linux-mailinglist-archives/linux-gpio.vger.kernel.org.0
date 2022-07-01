Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF50562879
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbiGABkd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiGABkc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:40:32 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938A05C959;
        Thu, 30 Jun 2022 18:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY7gR5w2W74Qob0CZfIbF8HOpp+UYMXl+vSdzPJqMVvK/TZjx+QMqbRSeObMpSfrjiks4N2pCW+ql2/rN7kbRWPxYaYUVRsof9CzR1XGMHkjpEIxRHcP/spNFYkCHoznj0ux4OJ+S0jWgQMz0Dx8/UUoMSdiuXPzhd6FqNHc0dSCC5gkkWnRye4oFYWO3ND/XT9+4STD1s+E4vdIJ2UjAz2UlcyBYk/2eRjf5TVzvzdaCYgC+/QdtBs/nSXwWyWJk98d2GENzq2f5gJwyrsoA0XUviM2rqeMLEg38aCr7kfdFP+wu5YYJ4RTxfm9GUpbOvLefsBYVKxQnDpaWmwPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK9tNFmQIiUkC6KA3V2dBEufQqeuwg4QXyFwdgkWvfQ=;
 b=Wy+VbidQPtMmRUoyfy22eLkgrS40P4IRkr8EMGvpbq6dbpWWjgRH7C3h3hk2/z5bY8A1mej2aiI+n8IqVYUnWoOrNxiMDWAagRKkROEyxuRuIHkvoHLCjEUc4gKegu8nh4b++Xp+3Ez4J263i7GjxtLUJxzUZusWmSAMhvGTFMT5aWfZMmVHngBUF3jH/chnWOCOkUgGDNCzVyokKclZTwAD6BcJ1B+5HfkF3GaY+9Rk02OFlzqVagrwEnUwZa+MN+22ziBMZCHQC+hbZprUWFXHucEgylIAoSX9uSyMw5KuDVH4g38zmdcjs/fX5ATZ0ajzqMQkI+RKygELELarkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK9tNFmQIiUkC6KA3V2dBEufQqeuwg4QXyFwdgkWvfQ=;
 b=eyhh2cjuo5/JgW+PJ8mNViBTGZB0xG3yTl+F75OM8rKdFDpBAYmISp6dvUyXuFQxVuMVKCg5qBx/UbCGl4oEQms6hsUINkyl6TK05hBWQ/b+ANcYIeLp5F5X5wjU+iPpWIq6AraAA327r8WAVhQbZjtodWL2DZuBoiMPZ8sOrXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8850.jpnprd01.prod.outlook.com (2603:1096:400:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:40:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:40:28 +0000
Message-ID: <87o7y9sj90.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 20/23] pinctrl: renesas: r8a779g0: add missing PWM
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
Date:   Fri, 1 Jul 2022 01:40:27 +0000
X-ClientProxiedBy: TYCPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e95e0be7-a777-4e5e-807c-08da5b02ad30
X-MS-TrafficTypeDiagnostic: TYCPR01MB8850:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzMAuSuSylmHzOilLE2ikUDvmdE6w6p1mRC8KMkPzdT9gttm8cwPszGQ490UangAnBsvwQz1cOiIA/0ayiF0nAG5iFAPu8B5Jr0tw5Rksc+QLn8kCi3QnLclr/zLq6QaMnvxiOIQSPEtGChagFHdkRClvpNbIuN9A/qdUowm+JZEV2qvmgWYhWF6XpPQACbD22lL4tfSShiE1JsSoH2elzwbtLfB612iKY1hk7xrUfAiloLnIxnaspxsUsyIIDyzVFDEGmuAZfqYVCYwuJbomuko/O3ZksQnb+bQDOR05m65Wm81DOCcrsYeMxC8rUO1j48bEXKmvmoeuSQLwZcMsjyuAbDe+tcKVH237S8ILPzf0Y4MppkNUdWhMCMefjBa5nRJcAlmwQa7it7eLij7wkSUgwtmxB665Txa5ZKkYI59C3Ew8FqrRBy9YuOnggXEylUN/5lkuMPKVSWp5i19Zn603J1ygDmLTLkRGnkwx74uuTwg5tTd9QEL3oK/5lpW8cInKm2C2Y8w+U0FjqI+z1HSTA6LUMwT0VtNawoSv3AP4V2f/gDslGXhkHZHRWHuLCrXBxPikWZYDR1QqVQ98Ji7bHZECxVErGiNKFFzPOHeCM0kNkWlGJgd1BeC61v+zF3rVIW4znxM6sucDsZK8WblJ6iDVvp1rjwj4/q/RDa538H3Z8GL4nNTW50zSxM8J2o1ojnZYp6qi/JqHGJh0TuVIexffPa1xY4gY0JCLH9X2x7hWH5YFIrWxkAcpiVsudQu1KFRfisxT+PkvdwaPqG7bqgi3X8/Ph1i8zWJ+gk5JA6GI9oaCDb4wqDoOuqX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(36756003)(110136005)(54906003)(316002)(86362001)(2616005)(26005)(38350700002)(38100700002)(186003)(4326008)(66476007)(52116002)(8676002)(66556008)(66946007)(6506007)(478600001)(8936002)(41300700001)(6486002)(2906002)(30864003)(6512007)(83380400001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1+G5sXalMQx17fMcr3xTYPMeHlyYPm13TioHwpDukq2t7ZiTwQ1+sUAlo5Gi?=
 =?us-ascii?Q?+DQojsrJ/T9FYqNCejLnFPhhcGRibpFgqeYEl8veBQzbb0PP1fY9ByTMHdN+?=
 =?us-ascii?Q?dxz9Eldq6d1z+tOvAXa+Qg3/kVxLnTQAnB199p7Vl4eLA9dk3OMf3dNmzHsp?=
 =?us-ascii?Q?90Zq0eeowN/jhQkrT2hktexGkPWS0O3GDs5cVY2JIS7n8OOhQ/7J5z/CBcnx?=
 =?us-ascii?Q?9dUHX0eSjt1DPVZ5OpZ8ePorV28y/oNiuQQwUUpGhsVXtbIYSfZRiIzF05qv?=
 =?us-ascii?Q?3F35HIRhvn8l3OahGpcOYDyAXDYYbieQwbAIXc4Xg3NBghWYASwInvxepyz0?=
 =?us-ascii?Q?bY7BbjCWCtg97pHH5drRJU6zjjSUhHZ160yaYxD0tiwX2N2ka6mG7NWY1rYL?=
 =?us-ascii?Q?bSc2iHRZzZVCFzhNWDX0vElxW48CSGwxbTNmrl7clxmfNCHTCXfPmErjALQK?=
 =?us-ascii?Q?WgWqjOGd3dFpRs01Q65vULIladOwzEaxvPA2dFoh7ukzcWemgfvsqvBRaLJM?=
 =?us-ascii?Q?iXuiQ2cviiHpr20Qi+vvLPA8rdj6ceQmInDbFQ7EQk7vTCyrwa2DYDui+/z+?=
 =?us-ascii?Q?I2nGotRUS5TALjtPdgyKJeH0wTJV00mhWptB66Y2LdojKLzvnv5U/GycNNOh?=
 =?us-ascii?Q?rwsn5bTeesmcp8SideIpYGsUSuxDl58MOFZioj6zY3Y0qKIyuDJ/WRUISZkn?=
 =?us-ascii?Q?8J5bMFgdAOPuP/kDX96/SRlsHkECa9nxwghiBHFEAEr5cPA3yERrbcbDFkmK?=
 =?us-ascii?Q?Jl85uVU5PvGEtaQp7Cg5bsrVpDYafcVHW2XpJmuheAxpxrnA1oEkOjqZDeMZ?=
 =?us-ascii?Q?I3apHIZq7EvZf8QLcKAK4KoFvl2aR6ol7chAt2dg4Q5OA6aOxC/mSDqPq+2c?=
 =?us-ascii?Q?vI2VhO7Lwcgv9UfwAMdRnaadnKv/ohrAMISq1oAw3AHCgTeBpPWOJPuLcn8Y?=
 =?us-ascii?Q?XGJRVdG2/giXOpsXoWPeIEi/eCesIhZmh4tlXurp2FIDVWzF9Wpu5CRnL7TT?=
 =?us-ascii?Q?0sdbDw77FFYjOsdAa4vIt98a4g9tbUPrb7Ix/8hnSfTQzKNhBOUZxtontpMm?=
 =?us-ascii?Q?qWoN5exhJR4teMel2ha8h5uqx1brjjV7e2I+cHPfKn8bZeuc7b80zqDE6NPX?=
 =?us-ascii?Q?xI9RrfazQ4J3UNi9ZejRMcWZdn3uMi/z/egL7frXP+sBREbUYjg3uoTkpeVA?=
 =?us-ascii?Q?q4kRCzuwlc79aSWbxEJVsvAAh2O0NRN3sXIOP3LlPcXNg8KkUhi3viZupn4t?=
 =?us-ascii?Q?wiVCjt65kyQWcJjUZfDXWTK3p7zDXHPmWqB94DKT4GET4i4fVaLKKTyyMqMs?=
 =?us-ascii?Q?xY1SIIK1fCjw5EW8De5dJKlmvMCy8vuaGh2BfHNO7TgEokmC7vVILTHF+uTt?=
 =?us-ascii?Q?E538Ol4kuHvVeuTeXAJBEO6HAEivxJjNnshfWGc6JLiKwlqJ9hm8JMkLXVAt?=
 =?us-ascii?Q?0Zg2F5TMlHke80L1Flv+bY8eQR44kx3fAcJCKSlPmkMjIR4OlcR2dHkYtF3m?=
 =?us-ascii?Q?G1mFCB4YqHtbMnqw5xVDIRFmp7R9NmJj2WMH2mva3xa+fdXceQXY1DALjosW?=
 =?us-ascii?Q?x+aWU4CJt6NYov+IrFA/tSWNm3HtzAfBEpoWOe6zp/VmdUT3wRQEnvIUWDJh?=
 =?us-ascii?Q?sNOMNb4SCR+txDky7Wc8Rfw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95e0be7-a777-4e5e-807c-08da5b02ad30
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:40:28.2076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQLFYMYEoRqeY1VKhpr3GbblImjjeHAT/JlokuZNXA5gP8sTcPDBCBoIHgH3kO3gnVxvCdhchC64M/Ducnw+d5l+PZpYkvOyXul7EZqGzvN9MnXKuuAUBinCZFFyVTgD
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

V4H has PWM/PWM_A/PWM_B, but current PFC setting is mixed.
This patch add missing PWM settings, and tidyup these.

According to Document, GP3_14 Function4 is PWM2_A,
but we can't select it at P1SR3[27:24].
This patch just ignore it for now.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 136 +++++++++++++++----------
 1 file changed, 80 insertions(+), 56 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 69eab3ddfebd..2e84d2eabee0 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -311,9 +311,9 @@
 #define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		FM(SCK1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_27_24	FM(HRTS0_N)		FM(RTS0_N)		FM(PWM9)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_31_28	FM(HSCK0)		FM(SCK0)		FM(PWM0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_27_24	FM(HRTS0_N)		FM(RTS0_N)		FM(PWM9_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_31_28	FM(HSCK0)		FM(SCK0)		FM(PWM0_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP2SR1_3_0	FM(HRX0)		FM(RX0)			F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -322,7 +322,7 @@
 #define IP2SR1_15_12	FM(SSI_WS)		FM(TCLK4)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_19_16	FM(SSI_SD)		FM(IRQ0_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_23_20	FM(AUDIO_CLKOUT)	FM(IRQ1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR1_27_24	FM(AUDIO_CLKIN)		FM(PWM3)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR1_27_24	FM(AUDIO_CLKIN)		FM(PWM3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)	FM(IRQ3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -349,9 +349,9 @@
 #define IP1SR2_11_8	FM(CANFD0_TX)		FM(FXR_TXENB_N_X)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)	FM(TCLK3_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1)	FM(TCLK4_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_31_28	FM(CANFD3_RX)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1_B)	FM(TCLK4_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_31_28	FM(CANFD3_RX)		F_(0, 0)		FM(PWM3_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP2SR2_3_0	FM(CANFD4_TX)		F_(0, 0)		FM(PWM4)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -376,7 +376,7 @@
 #define IP1SR3_11_8	FM(MMC_SD_CMD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_15_12	FM(SD_CD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_19_16	FM(SD_WP)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	F_(0, 0)	FM(TCLK3_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	FM(PWM1_A)	FM(TCLK3_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	FM(TCLK4_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_31_28	FM(QSPI0_SSL)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -846,15 +846,15 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR1_23_20,	HCTS0_N),
 	PINMUX_IPSR_GPSR(IP1SR1_23_20,	CTS0_N),
-	PINMUX_IPSR_GPSR(IP1SR1_23_20,	PWM8),
+	PINMUX_IPSR_GPSR(IP1SR1_23_20,	PWM8_A),
 
 	PINMUX_IPSR_GPSR(IP1SR1_27_24,	HRTS0_N),
 	PINMUX_IPSR_GPSR(IP1SR1_27_24,	RTS0_N),
-	PINMUX_IPSR_GPSR(IP1SR1_27_24,	PWM9),
+	PINMUX_IPSR_GPSR(IP1SR1_27_24,	PWM9_A),
 
 	PINMUX_IPSR_GPSR(IP1SR1_31_28,	HSCK0),
 	PINMUX_IPSR_GPSR(IP1SR1_31_28,	SCK0),
-	PINMUX_IPSR_GPSR(IP1SR1_31_28,	PWM0),
+	PINMUX_IPSR_GPSR(IP1SR1_31_28,	PWM0_A),
 
 	/* IP2SR1 */
 	PINMUX_IPSR_GPSR(IP2SR1_3_0,	HRX0),
@@ -876,7 +876,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP2SR1_23_20,	IRQ1_A),
 
 	PINMUX_IPSR_GPSR(IP2SR1_27_24,	AUDIO_CLKIN),
-	PINMUX_IPSR_GPSR(IP2SR1_27_24,	PWM3),
+	PINMUX_IPSR_GPSR(IP2SR1_27_24,	PWM3_A),
 
 	PINMUX_IPSR_GPSR(IP2SR1_31_28,	TCLK2),
 	PINMUX_IPSR_GPSR(IP2SR1_31_28,	MSIOF4_SS1),
@@ -952,13 +952,14 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	CANFD2_RX),
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TPU0TO3),
-	PINMUX_IPSR_GPSR(IP1SR2_23_20,	PWM1),
+	PINMUX_IPSR_GPSR(IP1SR2_23_20,	PWM1_B),
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TCLK4_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_27_24,	CANFD3_TX),
-	PINMUX_IPSR_GPSR(IP1SR2_27_24,	PWM2),
+	PINMUX_IPSR_GPSR(IP1SR2_27_24,	PWM2_B),
 
 	PINMUX_IPSR_GPSR(IP1SR2_31_28,	CANFD3_RX),
+	PINMUX_IPSR_GPSR(IP1SR2_31_28,	PWM3_B),
 
 	/* IP2SR2 */
 	PINMUX_IPSR_GPSR(IP2SR2_3_0,	CANFD4_TX),
@@ -996,6 +997,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	IPC_CLKIN),
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	IPC_CLKEN_IN),
+	PINMUX_IPSR_GPSR(IP1SR3_23_20,	PWM1_A),
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	TCLK3_X),
 
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKOUT),
@@ -2031,40 +2033,58 @@ static const unsigned int pcie1_clkreq_n_mux[] = {
 	PCIE1_CLKREQ_N_MARK,
 };
 
-/* - PWM0 ------------------------------------------------------------------- */
-static const unsigned int pwm0_pins[] = {
-	/* PWM0 */
+/* - PWM0_A ------------------------------------------------------------------- */
+static const unsigned int pwm0_a_pins[] = {
+	/* PWM0_A */
 	RCAR_GP_PIN(1, 15),
 };
-static const unsigned int pwm0_mux[] = {
-	PWM0_MARK,
+static const unsigned int pwm0_a_mux[] = {
+	PWM0_A_MARK,
 };
 
-/* - PWM1 ------------------------------------------------------------------- */
-static const unsigned int pwm1_pins[] = {
-	/* PWM1 */
+/* - PWM1_A ------------------------------------------------------------------- */
+static const unsigned int pwm1_a_pins[] = {
+	/* PWM1_A */
+	RCAR_GP_PIN(3, 13),
+};
+static const unsigned int pwm1_a_mux[] = {
+	PWM1_A_MARK,
+};
+
+/* - PWM1_B ------------------------------------------------------------------- */
+static const unsigned int pwm1_b_pins[] = {
+	/* PWM1_B */
 	RCAR_GP_PIN(2, 13),
 };
-static const unsigned int pwm1_mux[] = {
-	PWM1_MARK,
+static const unsigned int pwm1_b_mux[] = {
+	PWM1_B_MARK,
 };
 
-/* - PWM2 ------------------------------------------------------------------- */
-static const unsigned int pwm2_pins[] = {
-	/* PWM2 */
+/* - PWM2_B ------------------------------------------------------------------- */
+static const unsigned int pwm2_b_pins[] = {
+	/* PWM2_B */
 	RCAR_GP_PIN(2, 14),
 };
-static const unsigned int pwm2_mux[] = {
-	PWM2_MARK,
+static const unsigned int pwm2_b_mux[] = {
+	PWM2_B_MARK,
 };
 
-/* - PWM3 ------------------------------------------------------------------- */
-static const unsigned int pwm3_pins[] = {
-	/* PWM3 */
+/* - PWM3_A ------------------------------------------------------------------- */
+static const unsigned int pwm3_a_pins[] = {
+	/* PWM3_A */
 	RCAR_GP_PIN(1, 22),
 };
-static const unsigned int pwm3_mux[] = {
-	PWM3_MARK,
+static const unsigned int pwm3_a_mux[] = {
+	PWM3_A_MARK,
+};
+
+/* - PWM3_B ------------------------------------------------------------------- */
+static const unsigned int pwm3_b_pins[] = {
+	/* PWM3_B */
+	RCAR_GP_PIN(2, 15),
+};
+static const unsigned int pwm3_b_mux[] = {
+	PWM3_B_MARK,
 };
 
 /* - PWM4 ------------------------------------------------------------------- */
@@ -2103,22 +2123,22 @@ static const unsigned int pwm7_mux[] = {
 	PWM7_MARK,
 };
 
-/* - PWM8 ------------------------------------------------------------------- */
-static const unsigned int pwm8_pins[] = {
-	/* PWM8 */
+/* - PWM8_A ------------------------------------------------------------------- */
+static const unsigned int pwm8_a_pins[] = {
+	/* PWM8_A */
 	RCAR_GP_PIN(1, 13),
 };
-static const unsigned int pwm8_mux[] = {
-	PWM8_MARK,
+static const unsigned int pwm8_a_mux[] = {
+	PWM8_A_MARK,
 };
 
-/* - PWM9 ------------------------------------------------------------------- */
-static const unsigned int pwm9_pins[] = {
-	/* PWM9 */
+/* - PWM9_A ------------------------------------------------------------------- */
+static const unsigned int pwm9_a_pins[] = {
+	/* PWM9_A */
 	RCAR_GP_PIN(1, 14),
 };
-static const unsigned int pwm9_mux[] = {
-	PWM9_MARK,
+static const unsigned int pwm9_a_mux[] = {
+	PWM9_A_MARK,
 };
 
 /* - QSPI0 ------------------------------------------------------------------ */
@@ -2556,16 +2576,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(pcie0_clkreq_n),
 	SH_PFC_PIN_GROUP(pcie1_clkreq_n),
 
-	SH_PFC_PIN_GROUP(pwm0),
-	SH_PFC_PIN_GROUP(pwm1),
-	SH_PFC_PIN_GROUP(pwm2),
-	SH_PFC_PIN_GROUP(pwm3),
+	SH_PFC_PIN_GROUP(pwm0_a),
+	SH_PFC_PIN_GROUP(pwm1_a),
+	SH_PFC_PIN_GROUP(pwm1_b),
+	SH_PFC_PIN_GROUP(pwm2_b),
+	SH_PFC_PIN_GROUP(pwm3_a),
+	SH_PFC_PIN_GROUP(pwm3_b),
 	SH_PFC_PIN_GROUP(pwm4),
 	SH_PFC_PIN_GROUP(pwm5),
 	SH_PFC_PIN_GROUP(pwm6),
 	SH_PFC_PIN_GROUP(pwm7),
-	SH_PFC_PIN_GROUP(pwm8),
-	SH_PFC_PIN_GROUP(pwm9),
+	SH_PFC_PIN_GROUP(pwm8_a),
+	SH_PFC_PIN_GROUP(pwm9_a),
 
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
 	BUS_DATA_PIN_GROUP(qspi0_data, 2),
@@ -2813,19 +2835,21 @@ static const char * const pcie_groups[] = {
 };
 
 static const char * const pwm0_groups[] = {
-	"pwm0",
+	"pwm0_a",
 };
 
 static const char * const pwm1_groups[] = {
-	"pwm1",
+	"pwm1_a",
+	"pwm1_b",
 };
 
 static const char * const pwm2_groups[] = {
-	"pwm2",
+	"pwm2_b",
 };
 
 static const char * const pwm3_groups[] = {
-	"pwm3",
+	"pwm3_a",
+	"pwm3_b",
 };
 
 static const char * const pwm4_groups[] = {
@@ -2845,11 +2869,11 @@ static const char * const pwm7_groups[] = {
 };
 
 static const char * const pwm8_groups[] = {
-	"pwm8",
+	"pwm8_a",
 };
 
 static const char * const pwm9_groups[] = {
-	"pwm9",
+	"pwm9_a",
 };
 
 static const char * const qspi0_groups[] = {
-- 
2.25.1


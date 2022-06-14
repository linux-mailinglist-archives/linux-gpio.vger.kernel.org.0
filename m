Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C9054A927
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiFNGAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238715AbiFNGAp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:00:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3E23AA62;
        Mon, 13 Jun 2022 23:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHYriX4O/KIkVG/laPwtOXXTdfrCAkGdMUnQIH4VyHA0bSWrGSIY71XddgF41Ry4dectm6m6XSu/yZJFS7Gp7nerTdMyE2QGxfnR7xGFd2uEho/HXl6cZEFsMWbwZNjHMB8HXVSKHEHek+jKStb1leRaSo6rs3v5HuVmtGiQ4B6HdqhUtq0UlbfzCN4BoLV5xwbbgI0LOzTNf7/G+a+yDZ+Xt/D9W9fBzvyW/Q7FbHKLl2hewT2s3xvpYxkYyZeuQWgeSbRqorrhpedPRY5lCTKi66bmOGSWG215FIA1int10w2ljQ8ShllBnKrxBFGdO4peC7YCL60mqFaQZ8FsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV/Lzt4dsftIs3oatXVJ3DlfFejIDl9DslD8btz+DMg=;
 b=FxKUCaYypu6vCg5gZv77klBwo/llaD5Bsfzkrr8FeUyNy3rXALKF8WaUNOog5dDqo2lF193bTstfAxUFEFsgkDz7fhfK6Vus8uAaswaM9ZGq6WGhf7A3i9VXC3elRkACcX2f2AJNatadZK8oPFSCgELs7g8aYCINp14bm99KuY7bD/3Co94+Hyug914IBaBhyJ3tGOq5toPfTxUGElM/DMEWUgo+UUu2yvnKEMTMDjz6Xz3owIzRaLajaF6DIlyuSk9OEFecUGCA5/cwhFBiQTxe9qFc9gUZ+l4nmh+YXcy4tPAXSbHl5NuDF6+p8AQiZqs8nt/st9XkTxzEn7CshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV/Lzt4dsftIs3oatXVJ3DlfFejIDl9DslD8btz+DMg=;
 b=pE6t3XpjsbxuLP06CyfB3TGWNE1rtGFZd088x65XGpiX9mKGmDWw9mlZ5zl9y8VnW++4T8MQC90Y80AMh15hInSN6NfN0euVY7KEWhHe8ziwOiMwLvoqeuaTCs3KFh3toJKGXiBxSSxB7b6Cv4l4lL5AHuCI/V6a0kQhNV3Jkh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8394.jpnprd01.prod.outlook.com (2603:1096:400:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 06:00:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:00:40 +0000
Message-ID: <87edzrkcmw.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 18/21] pinctrl: renesas: r8a779g0: add missing PWM
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:00:39 +0000
X-ClientProxiedBy: TYBP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05795f84-74e7-4515-205e-08da4dcb3598
X-MS-TrafficTypeDiagnostic: TYWPR01MB8394:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB8394B13FB2B2D89138E168C4D4AA9@TYWPR01MB8394.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tnqkGdNq1ElbST+tUv8h2iQqQPS6E3LpM0aC/yEbYiWof6YNr7hIF1WwMuQT5AHZzNW7iiwEI1RaHltI2A3LLt1jbvn/XQ0kaQoZp754Jr3DGW6uStKZ0TIx/OmAkM7EL/KkTdmGM8ERe5TiBZ3a/Lnz2chgWsqHALqVvLCSmcS2ag+3dITI8gYFewi4zetlVeUDsOPykrE/EXTunyKC6dlXXVs/3q60ingUXJlLTMFLSDGV5peayS1/v8S3Z7uJggI6/dh21spAZ56j0qcyZtnxbNZOlW9xzytDfHnbnV6gHk1xNyvUzVro4Tmg4Q+irPXQZ3AH5CicS2w18xUGkTA+uEdUGiJdP5+lREkcyRBvDYvo/xRtLaq3Tex0K1oa2epT+Nc9QCezc15ydR/aakeEQXzg0k034uaYvvHk5FptuyeA4mM5uGd7RXXjSzXliVpREj6Y9k7CsDZpq7oy6Tt28Rk8ppm9e6KohoA+kOtfNbuFK8CpXTIkJK/eigQY5B5rYKJCegRSawzgMGxjZronN0VNfwS5LtNOQFP9Cknk7OQpOFlkPAEig+ssHaT9dFmHNEG5Mt01E8/G7PK9cuY4rX3JuR8IKm0MBNYForXFwFFEtaXbN7oide5r5c92KgK9YEu6n2uyhuIK+tChUVCLtAsRfaCEo2mApvi7GM+ZNjD4sPKASb6k0IbIvPvplsxAcRkJ2sCnCuBg+BTFqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(316002)(6512007)(30864003)(8676002)(2616005)(66946007)(38350700002)(508600001)(5660300002)(83380400001)(186003)(2906002)(6486002)(8936002)(86362001)(52116002)(26005)(6506007)(66556008)(66476007)(4326008)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cchqx339/JsHbCLxzLkUs3LY/L8J43n+61n1PbV4+1HNbodqQWBaVbFg8Jhj?=
 =?us-ascii?Q?YYZGOxAb4jCUXb4dMAieqXYKavPs7IJCIUHdjpuUhBfg5WJyppBuFSe8XA6t?=
 =?us-ascii?Q?I9Ieg/BJLfK2YEB010hL0iXf2J05VQuoESNZZG/Ko9CT36HXSy16HxZqd9Pf?=
 =?us-ascii?Q?YdYWyVzpFCy/+EEeg0gR/bmgycTDYIlaExAfueCOM/gP7rgONh70ZstRYnBe?=
 =?us-ascii?Q?3kwDJctfXgQZeOdayPWV28lVoNZakv25TnE8c+QB4To5JQmGU4PwYiryzI8q?=
 =?us-ascii?Q?IS1KKYu/YxefdvEdUcdsvkImb6ExH+9SBygOz3KK6Ui1GCkUzFzq/GdHZNYk?=
 =?us-ascii?Q?NITpaw5jXdcOXR0QzJQeu60weR8Z4pC2/1oeBUtY8lDkWNh7nCMINpcTYqLX?=
 =?us-ascii?Q?uQyc4MaWxn64lhBDxi8ETQFYAu2toGL55J9F+/GRfHc1FYqPqMQ5bsxljVv8?=
 =?us-ascii?Q?Z6TKMRkUiRUMV9Os2ZW4jm36Coin4k5B4DCEjaHPSdo1sQUXClf6+lM/3UFv?=
 =?us-ascii?Q?k5OAgEMrRC8pdaLo4SjlzylC2ZESSLwS8crq8+XArfla76XDantJENucB931?=
 =?us-ascii?Q?wCQW8jW7C/Hzg5g4uMiymyhfZqLSyRBDXjEfxIC2WYaALWUVXNIhH8eGWUOz?=
 =?us-ascii?Q?H1nCl0hxL9HMjYHObmTpa1EMf8Txpes6ysCnFiwi4zPNvvrNYWVtX30xm3AG?=
 =?us-ascii?Q?XsLXW2oOiOiGFXhlI/FajnasSDAKwDLJ2qL4qQ8ljKEq4uxoqiimjr/UCMeL?=
 =?us-ascii?Q?sUJ5uOSrGqkpTiUQ60ERMiNrWiqvyIfWZwkZyxcDSOAyy4EV6/7j62z1V4Qh?=
 =?us-ascii?Q?fshVwT27eu/DfECBfEmLZMDpML/5XlTMFsNQ6X0Ko7suIQHmPmK8QHWR1EdW?=
 =?us-ascii?Q?ij+9LwN9DGGjoI+tIISM+ckCH/ScMWQNbbakzA2p77Y8+goPsWCquKeEmHJv?=
 =?us-ascii?Q?c80eRGYtvxofpE4aGSZ2Ybh3i4LD+uWMQrx1h53XIRhi6klUh+y7qcZMNZl3?=
 =?us-ascii?Q?ptmYvHYGbvf7hI5VsY765rWQ+avcu0PHB6qqauObGol0aImiLzrgTz/J1jgE?=
 =?us-ascii?Q?lvFM6UF28s0xISZN9Tray3yiw4QbDI53kVs6ZQX//eTyvH4VSlfbRMQO06Zy?=
 =?us-ascii?Q?gUiyY2yrkzGNB22v9BAoVS/aP1xM4bBqfr6/urPc0TefpGGPyufsQ+ktjLG0?=
 =?us-ascii?Q?WN/u7iQy94AUEek7YufEpomsj+Rm0C7qyjyZVqviFOMJ0p52lYWDdxHEKwvU?=
 =?us-ascii?Q?5VwqaCptGjHYEmYeVsCcD8k7ZnM580pg8DBeyXG2cloO2SZ55q1xRp2l3hAL?=
 =?us-ascii?Q?ZJ00JrVVyuxsAVoACBfbR5DWjlrM9JHDZesliwlohkCEUU5aiVQRo735SxnX?=
 =?us-ascii?Q?woExtxs/9bUy+BUjykCUBdaSECN3lI0M0DXoS9V6q+CCvOSgeLzPxjwql6ow?=
 =?us-ascii?Q?96B5G0MxYYdyvB2mqfIUPGgWpOMB5FRP8RzSl9pGH0NyvzWPdj3Y7Mg7EVoe?=
 =?us-ascii?Q?uUwIgUdOBbcf+Sln6V6UkAu5Xiok/zhj3aDdScyx92ck+tR7AriV2XHaePXN?=
 =?us-ascii?Q?4mTJY+807wNB22bMYQ2HziafHFyLpyk2AAJYwBkqsXdp5jInn4ECJOQvMk9u?=
 =?us-ascii?Q?0Kf0wFDTvGq8wyYf+v2bxt+CYFuWDFd2ycBv6oI6pRc+DZSZNT9B6GIQcW4u?=
 =?us-ascii?Q?9ilnvN4COF4Zb+9DY3FwBRphU9Koqo28aZx1kivQZIxVc0v9aji7D/b6I0GL?=
 =?us-ascii?Q?1atGTJamktL0S8rMQYI4uKmYD89rDyjEOhn/vCXBxyfxfXNdIDOj?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05795f84-74e7-4515-205e-08da4dcb3598
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:00:40.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8uQ+ZZ2JNzufoAdbtwpntRGct7BCQ2lIjZAzb+ufH6JsfU1BKwzvsGdCPXV+3vvNJ/c/TC9UpDzBOSmYqSnYj/BKzEUUMg4ZarLMBj/zo39k3cjASDMvHmXePDrU3C5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8394
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
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 168 +++++++++++++++----------
 1 file changed, 100 insertions(+), 68 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index b68d6e24b18f..ba9489d1074c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -304,9 +304,9 @@
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
@@ -315,7 +315,7 @@
 #define IP2SR1_15_12	FM(SSI_WS)		FM(TCLK4)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_19_16	FM(SSI_SD)		FM(IRQ0_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_23_20	FM(AUDIO_CLKOUT)	FM(IRQ1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR1_27_24	FM(AUDIO_CLKIN)		FM(PWM3)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR1_27_24	FM(AUDIO_CLKIN)		FM(PWM3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)	FM(IRQ3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -342,9 +342,9 @@
 #define IP1SR2_11_8	FM(CANFD0_TX)		FM(FXR_TXENB_X_N)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
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
@@ -369,7 +369,7 @@
 #define IP1SR3_11_8	FM(MMC_SD_CMD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_15_12	FM(SD_CD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_19_16	FM(SD_WP)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	F_(0, 0)	FM(TCLK3_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	FM(PWM1_A)	FM(TCLK3_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	FM(TCLK4_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_31_28	FM(QSPI0_SSL)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -875,15 +875,15 @@ static const u16 pinmux_data[] = {
 
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
@@ -905,7 +905,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP2SR1_23_20,	IRQ1_A),
 
 	PINMUX_IPSR_GPSR(IP2SR1_27_24,	AUDIO_CLKIN),
-	PINMUX_IPSR_GPSR(IP2SR1_27_24,	PWM3),
+	PINMUX_IPSR_GPSR(IP2SR1_27_24,	PWM3_A),
 
 	PINMUX_IPSR_GPSR(IP2SR1_31_28,	TCLK2),
 	PINMUX_IPSR_GPSR(IP2SR1_31_28,	MSIOF4_SS1),
@@ -981,13 +981,14 @@ static const u16 pinmux_data[] = {
 
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
@@ -1025,6 +1026,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	IPC_CLKIN),
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	IPC_CLKEN_IN),
+	PINMUX_IPSR_GPSR(IP1SR3_23_20,	PWM1_A),
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	TCLK3_X),
 
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKOUT),
@@ -2060,40 +2062,58 @@ static const unsigned int pcie1_clkreq_n_mux[] = {
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
@@ -2132,22 +2152,22 @@ static const unsigned int pwm7_mux[] = {
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
@@ -2585,16 +2605,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
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
@@ -2847,20 +2869,28 @@ static const char * const pcie_groups[] = {
 	"pcie1_clkreq_n",
 };
 
-static const char * const pwm0_groups[] = {
-	"pwm0",
+static const char * const pwm0_a_groups[] = {
+	"pwm0_a",
+};
+
+static const char * const pwm1_a_groups[] = {
+	"pwm1_a",
+};
+
+static const char * const pwm1_b_groups[] = {
+	"pwm1_b",
 };
 
-static const char * const pwm1_groups[] = {
-	"pwm1",
+static const char * const pwm2_b_groups[] = {
+	"pwm2_b",
 };
 
-static const char * const pwm2_groups[] = {
-	"pwm2",
+static const char * const pwm3_a_groups[] = {
+	"pwm3_a",
 };
 
-static const char * const pwm3_groups[] = {
-	"pwm3",
+static const char * const pwm3_b_groups[] = {
+	"pwm3_b",
 };
 
 static const char * const pwm4_groups[] = {
@@ -2879,12 +2909,12 @@ static const char * const pwm7_groups[] = {
 	"pwm7",
 };
 
-static const char * const pwm8_groups[] = {
-	"pwm8",
+static const char * const pwm8_a_groups[] = {
+	"pwm8_a",
 };
 
-static const char * const pwm9_groups[] = {
-	"pwm9",
+static const char * const pwm9_a_groups[] = {
+	"pwm9_a",
 };
 
 static const char * const qspi0_groups[] = {
@@ -3005,16 +3035,18 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(pcie),
 
-	SH_PFC_FUNCTION(pwm0),
-	SH_PFC_FUNCTION(pwm1),
-	SH_PFC_FUNCTION(pwm2),
-	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(pwm0_a),
+	SH_PFC_FUNCTION(pwm1_a),
+	SH_PFC_FUNCTION(pwm1_b),
+	SH_PFC_FUNCTION(pwm2_b),
+	SH_PFC_FUNCTION(pwm3_a),
+	SH_PFC_FUNCTION(pwm3_b),
 	SH_PFC_FUNCTION(pwm4),
 	SH_PFC_FUNCTION(pwm5),
 	SH_PFC_FUNCTION(pwm6),
 	SH_PFC_FUNCTION(pwm7),
-	SH_PFC_FUNCTION(pwm8),
-	SH_PFC_FUNCTION(pwm9),
+	SH_PFC_FUNCTION(pwm8_a),
+	SH_PFC_FUNCTION(pwm9_a),
 
 	SH_PFC_FUNCTION(qspi0),
 	SH_PFC_FUNCTION(qspi1),
-- 
2.25.1


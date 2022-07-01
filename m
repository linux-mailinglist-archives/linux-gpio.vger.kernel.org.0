Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A81E56286C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbiGABji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiGABji (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:39:38 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD20838182;
        Thu, 30 Jun 2022 18:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4+zKWIZ+7OpAQ/6I++te6pAs09Ovxtu/VJwCieSY7E+EoYI2K1chZd2yCQ+lO/hpHyCPFyKczmeZbt9R07Wt/WFKlNPJt2u5dJ0qj+xzPAw4KePNSD2RQw/PCz/D3bs+jwcPNZxXFl3+TS6ZdAIxFCo5GZHoZZIrUqlhouDkig9ytagQ0kONLI/Y1CVN9jfwnfCMF6j7/50T1Ir0oV6Asy+wPAALcGAEdtQJlHmjAgvAUStxIR6Xcac3mlj1gEw3ieuH/IQuCsnauh5UhUSYSgxDrkqzRN5glny8G0Spou5GnnHNDK0F80muoSlDHo2AultxTzkHO1J51wCGBs9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS8lViXjU+pbgto5ojdMVgPr1Zv6LxS2yCRqrYR+p8s=;
 b=eg1ej3bKiELm82lBI8/9OUEawHSrkNt55viXf39H83mo6KYPJ9pInbNSkcoG34CuQcV4QnUJ6G1czcr+JTbP+ETvjCmk3zOectH/1SCdavZgakcLwgUO6NXHw73FNN7DsogH1X0k7//bmNkgkkhzcoWB8XiLis9POsj3LP/V+YKAwuhtKiIcZBuww+gmQGw7DsUGZ4npQi+fLv8K9Fab8a6ZBF3InIColz0MjEVWPnaTg6wz27FX2sPZEnZm1OBJ3oqTKl2O5LGwzCKHCpOZlwiUH06boDd2ivplQxsY2zHti0dwpeuflcAhFy55cx7Cfrj7LZ1qwkjxlAgrBuFzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS8lViXjU+pbgto5ojdMVgPr1Zv6LxS2yCRqrYR+p8s=;
 b=a66fSBVRD0DBqYjNIg+l5A1/mrNw+d9K2V8Yg1HVKz16qITFVlDvDap5XOsKn4MkBlldaCR6jGihduzgtfGEd7WAf1LHUC7bTsKjgVR//FzTOJzODmVzifhlE7Yx2u1rdOK8YZ1/R5CTmlQ+etvCxvCAN/UTWiYB8P+bcnTYxAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:39:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:39:35 +0000
Message-ID: <87wncxsjah.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 14/23] pinctrl: renesas: r8a779g0: add missing HSCIF1_X
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
Date:   Fri, 1 Jul 2022 01:39:34 +0000
X-ClientProxiedBy: TYAPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 359f6152-26dd-42e6-74b9-08da5b028d86
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OMJPDMXcLS6AVA5OaYM2X2CXNvajHh+kkm1HMWFHYM+K9pW8wfblIogaWL4StORU5w6GIQfhqCvQkDbGZzXai+Jokn9RWzMUgvkZSJpj64q1G1yeEdi78eNwbeZB/7ml7mKy2mI9jII6YygqJewtkOWfdv6SXmFsYvqAtXQWXYKY9UlzWECFwBmMh0P7JN32/XdZWvgN6eN/qgbPuTQOzzs2Wg9rILiARqj7V647BtoiHbGuq50XGlDcclLjqrwq20V8+gZDL75/bQlrCrx007W0azIOQDK4YYnWQbi4kxTSkhrZZvoqMFyBpzwvdr0dvwdI7rIdViQ750aqkoYw7vglC8HxE3BoE3cz4eT463Mx3YNt//RCQtUe61PEqGMK3oZhwWsGsnwfnVKhHpxdurfsfIUc6KZocB4FbuZzAXaHS4qXhlqLhxQjSnfDCDOaAqqTUK7lVj1X/10UXb2UyGT+jdjTNVReUUaW35Kalvr1W1O4+xrl3v6oHkOa1qDs7iEMM3HaHTB6YNwfDWHp08kWG9pqQzWC6M2egtld1wVeo6GISzWcH0BiN49ixsMkaRBfJs1otUznquZiCNlTSArng9CzP06Iv2eGu40DknNWx/D2CDl52bVQG8stcgR2MnOuiQHz2H+he6ioyFcsWCb8ThQGyuBN/zIspTHjLehDUfqRx1lHdCkm5jJ1i0lJ7DMq4pFNlU1prGAV7lGHQ+mw41wIZLYTuHeNXNw/g/ktg07NPCz6lrRFdqK1ZfCQYWhKnNOqaUI7YSXmld+w+1N7J4imgG068JaMQpdIGHZ7g4L/iheaabTxfy9V8CTh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BjL09aHWuGm5FHYVjCfL41I3yuHhEJF99++GLzbAGNrt0XeNjF2sCpM/1RGg?=
 =?us-ascii?Q?0pNNLmHw89DBrfiAvIQXCoJu4IL/75PWEUz/Ng4hwL3Q5r33/WyiPFfVL4jA?=
 =?us-ascii?Q?7ycWGSLoJpTxLfod9ylLNSdrI4G/fWRM1mg8bFAkz4fWEiQjMnWL8c0ZB9Ex?=
 =?us-ascii?Q?6L8ZKklDYH2YN2pu4IjHtuLwv3aflfBKAR1H6qtkV3aEhjal+/lVdhwlHES+?=
 =?us-ascii?Q?saTB8VPP0shZEK1rWVjeZErNzk8o/amE/GqynURBBcKXU7nRWQZFsW9x63za?=
 =?us-ascii?Q?nPisQBRIKOg/acps24B+nyrcQFokn8C/QX//NtA8gNp4VKMIg7HJZh5f8XWw?=
 =?us-ascii?Q?d7m7YAAerpe1sa5yivtJ9MsFYUbIV35JPgjX4UQB5/GXB2QiIij9o1l1VSfe?=
 =?us-ascii?Q?kO8FN1HnmLb68e5r4vr0N1RkBACXYTtQ7ZHSB7vuQRW0VMbtsoAkqP/jMQkF?=
 =?us-ascii?Q?35mhRTP3OQbulGlnIPeIdg23eoKhM7sZhkCFBJaoSK8dGMZ3217DE2R8eIhg?=
 =?us-ascii?Q?L/OjvBVTzolbETD1R3qteSqtX8x3DOYRQx3vxThv9FdzxtRqQZKOv+CVCMpp?=
 =?us-ascii?Q?eDEK0yfFlF6f1E9REsvfJo1t2y48g5l8eshEWJarZdErQu/aHOlwjIpAiZKN?=
 =?us-ascii?Q?l4fvqvqFt9PdIdTRd2sBz4GcZUxaxc+WB0Z6/lBTPuoCII42O+vtA4Btx3nL?=
 =?us-ascii?Q?eHta7COtmaGkGHxIOFcDb/CC7tDGIbbkBA81xQNgwDX49z4sqWt3sVVgqmqz?=
 =?us-ascii?Q?AsuTOs1gBH41EVkgv748PTvjpnqJ65R1/TFiSD8nTaK1PRiVUt58tOPa6Wft?=
 =?us-ascii?Q?ag0JHyJGoOneQTWGZoTqeUDFPJVI+7NzC8n6C+xR2bTpoXHwNR/E84TUvaWD?=
 =?us-ascii?Q?iVkuncihlY6r0Vb9IxjxbnNeMae5tyO4BPoHHBn1LCWU0WTbaswaAMlrkC3d?=
 =?us-ascii?Q?LDGZe5In0tDTXz3AFpHt9NSvyvHiHrI72EkP1AhSt7F4rnNAkBPeCt9UniG8?=
 =?us-ascii?Q?pNKATvrNviVqieY3cuQXjWadhcRm9pWMoDENOKA3WoD5JhuwtFFsgEUuCRN4?=
 =?us-ascii?Q?KigwH8FGu821Ay6w6IyJAIWcLznYSC+QluexPagcLVw++UJI+EMc8GPh7AaS?=
 =?us-ascii?Q?MG3McvH2ni+EJHcyEoAUtc5ra9IwmeRX1bCZetki8Gyx4OK8UAFuP5wIp9Kv?=
 =?us-ascii?Q?AtpCB08SgNf0v5JyqdQ+OfuJIjFL13l7mhIDhZAcOC2+SDdaLUcnn913mGTc?=
 =?us-ascii?Q?ueJK5QiCKrx4dmFaU+oSSWkFDhKqYD/Us8bWHHefsXcFUf1o5gLHd4RND9Kv?=
 =?us-ascii?Q?4DbKBZ3CtmBiK/0mPlZmenRRBQMt2juluofobcvwqvdTxRaGV90aABzvuEQP?=
 =?us-ascii?Q?mOoKYW9A4GlQ38zxkowRoGI+WUHJJLjrSnFez4vSxR6MHurEq8FnxeGgMOw6?=
 =?us-ascii?Q?zeNRT2qHUmmaqpUob6c5xECRwqjOEuctTxxpQvIwn3E6zJvfN2qbAFhKj9F4?=
 =?us-ascii?Q?1BKHrWdy5T7FxcFlAEW1ZbHHROCgdYxN9u79w3TMjHnYuXu8tzBeJgvkdXru?=
 =?us-ascii?Q?r0QZXTK1A1J3DU4mx2aDO9t0BQNv1RX9UpP5HJ+EbgtkPq+1wHFnEfWpBTAA?=
 =?us-ascii?Q?baWIVCT5ELcp3BI5PNDixKA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359f6152-26dd-42e6-74b9-08da5b028d86
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:39:35.0382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8de9kH4+j7nSGX7cPnkN1C/GyOJ7ImFRS8z+j4fx5Wwn/eWkdB16+BkIF8W3SP2ZtevZk1Y5eytGFtqmngR8xqEEssqYKq78Uxy0NhNJp1b4On5IK/Wa1oGj5RhpedtU
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

This patch adds missing HSCIF1.
Because Document (Rev.0.51) has 2xHSCIF1 with no suffix (_A, _B),
this patch name it as _X.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 53 ++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 8a2dc7e9498c..8661cd5a2a38 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -302,13 +302,13 @@
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
+#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_N_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_N_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -810,15 +810,22 @@ static const u16 pinmux_data[] = {
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
+	PINMUX_IPSR_GPSR(IP1SR1_3_0,	HCTS1_N_X),
 
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	MSIOF0_TXD),
+	PINMUX_IPSR_GPSR(IP1SR1_7_4,	HRTS1_N_X),
 
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	MSIOF0_SCK),
+	PINMUX_IPSR_GPSR(IP1SR1_11_8,	HSCK1_X),
 
 	PINMUX_IPSR_GPSR(IP1SR1_15_12,	MSIOF0_RXD),
 
@@ -1525,6 +1532,29 @@ static const unsigned int hscif1_ctrl_mux[] = {
 	HRTS1_N_MARK, HCTS1_N_MARK,
 };
 
+/* - HSCIF1_X---------------------------------------------------------------- */
+static const unsigned int hscif1_data_x_pins[] = {
+	/* HRX1_X, HTX1_X */
+	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
+};
+static const unsigned int hscif1_data_x_mux[] = {
+	HRX1_X_MARK, HTX1_X_MARK,
+};
+static const unsigned int hscif1_clk_x_pins[] = {
+	/* HSCK1_X */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int hscif1_clk_x_mux[] = {
+	HSCK1_X_MARK,
+};
+static const unsigned int hscif1_ctrl_x_pins[] = {
+	/* HRTS1_N_X, HCTS1_N_X */
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 8),
+};
+static const unsigned int hscif1_ctrl_x_mux[] = {
+	HRTS1_N_X_MARK, HCTS1_N_X_MARK,
+};
+
 /* - HSCIF2 ----------------------------------------------------------------- */
 static const unsigned int hscif2_data_pins[] = {
 	/* HRX2, HTX2 */
@@ -2346,9 +2376,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
-	SH_PFC_PIN_GROUP(hscif1_data),
-	SH_PFC_PIN_GROUP(hscif1_clk),
-	SH_PFC_PIN_GROUP(hscif1_ctrl),
+	SH_PFC_PIN_GROUP(hscif1_data),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif1_data_x),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif1_clk),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif1_clk_x),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif1_ctrl),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif1_ctrl_x),	/* suffix might be updated */
 	SH_PFC_PIN_GROUP(hscif2_data),
 	SH_PFC_PIN_GROUP(hscif2_clk),
 	SH_PFC_PIN_GROUP(hscif2_ctrl),
@@ -2545,9 +2578,13 @@ static const char * const hscif0_groups[] = {
 };
 
 static const char * const hscif1_groups[] = {
+	/* suffix might be updated */
 	"hscif1_data",
+	"hscif1_data_x",
 	"hscif1_clk",
+	"hscif1_clk_x",
 	"hscif1_ctrl",
+	"hscif1_ctrl_x",
 };
 
 static const char * const hscif2_groups[] = {
-- 
2.25.1


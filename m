Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0163E54A90C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbiFNF7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237232AbiFNF73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:59:29 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30513587D;
        Mon, 13 Jun 2022 22:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKtguzw/sBmoPCN0WWZdUeBl02K/WAPUfYWUi73jhPYghjmhe5Of1OkvuYXOQV8J3buEJIR3e2CLV5QlDse8RJ0Ueena7i0Go898zoCpMLo2Do9+ORpcQs0cb+AvGIjKQ06K2yGI+LrRVKNNGZ3TWsvEdpkD234k9yVorBEB/AtZFRiPAXy0TYFEduivy9n4ek0E/XhcMlpPDiNgBtIeLWPt9oTMgXhvy8crLeohVtNcHZaY4A8H/3ZLRyIlLinLi49E/0vNGjXZ7QtroUQiPKXAnbRaYO2kA19vfurOViOS2/zMc00PMWGirQEdBMwxl0bRT3f3xRX2gE8QTx3VIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO3EoWz6R7JrYPxwJw29olsenMX5LyTq/XmqCKFCV24=;
 b=ZVHkLroye6Lm7sEhn6XkGA7XH1ELRiUCeE0j/fPEmRK+r0u3At8NUsbe3I7QKkyEx9tmGWNPq7BE3MCPFa+p1IznOPbOlVr2JwqNmKPoRLoRhmyXeSCpUgueIzsMbf3jqaKhmdIa6XtjQS0wSMZjTRq+0fsnwVKYLJ7UPVomM2Kr6mMVGRyHRebraHH87sT3Y1lWLORekZvHwvsd2Fyp8ZcY6wh8j5myGBWNutluFeooaNGh8Ylim5N+Q5wwf714EN89Xs0SePALeWzPx5vZhYF1pQAmWsi3EF/g6XyTIrOPORtAOUMl/AeAIWewSY5XV1k0kTnKt2ujsmNxguoENg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO3EoWz6R7JrYPxwJw29olsenMX5LyTq/XmqCKFCV24=;
 b=gb8CjvW+PtRn2Jzjo2n3xd1YBuFrW55ridNwiuSsIucGT2YFcPjmv5uUvj+n7Va5txl8G8QTTr5+sPX7u5NbbkRiG25eLaqZFUcBCXcpOXa+jJ7dA50QFxvM1fQoUJHTMhR5To6eVWFK+XwZFkRIffX1/i0576k49gbpT145+wE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB6220.jpnprd01.prod.outlook.com (2603:1096:400:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 05:59:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:59:24 +0000
Message-ID: <87sfo7kcoz.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/21] pinctrl: renesas: r8a779g0: tidyup ioctrl_regs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:59:24 +0000
X-ClientProxiedBy: TYAPR01CA0232.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e9f62b5-9443-43e8-ecd7-08da4dcb08a5
X-MS-TrafficTypeDiagnostic: TYAPR01MB6220:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB6220990891CD9B94050CA34ED4AA9@TYAPR01MB6220.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TacVJd/utDZ1zP3/ETAmK6dJ5Zzh0oW6NACTYcD8YqgLOMdh+vgfAePdaLG7nr150XhSSSrx8Y8raj2rCqjql+e6bx94d7B1oKCPGlTTtvD9fTYcAFlG6CorQKGA38+CTwOCw38vBZTcv59idPwWBlRnjvyY6KoMh62eQlnu6KPi2FyPck9MAqCUIustoFhmHTklWQkep7nkL+/odVlc4BSfXiPdvPGKfJ2ZTqu496l1fiLpaC7m29jH9ov+CCRVdZ4YJ9RyEso72lnB910WVpcR4L7uKdeBIdkRo4iT6g6nvVTXPa54W/xZMEu60fGosngXkicbUHc0CoZDrOCLLXU5WKpllAfSEsNgugzF4O2QVstBpoGZJdIdabaLbrDbpXovB0AiBYIgDLjHgBa6T7+oHU+CVVPw9/eCZrWa9LdARwTwmGvbGi88vo24cX/ZeKbFnA2OjNffWZ6Jes9fMvK5CFaEn9cSEB1Fw07oY9cpbbmZWv+h/6UZ6TDiNH7cPrZtKE2iVaf34KnzKI1wlUNbBwtd6b639zXfg3FTZMSg7zofry16btXKulYGW7sUD5HuoBDlfp6bkUDxzPNCa0kSCuq8FHA3AaRJ6b78vojz+8jCDHwZxNBcqbvK52dF69r4sq3ohhI0UfLNzZyQ8PZ+kmlCRut2/mX5wyhwgoJ9UtQCPH7ug1FneefEq/9rajNSVGkIPV1YvXwggKMWZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38350700002)(66946007)(316002)(2616005)(186003)(4326008)(36756003)(66556008)(66476007)(8676002)(5660300002)(508600001)(83380400001)(8936002)(6486002)(38100700002)(26005)(6512007)(6506007)(2906002)(52116002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0s0l69xZpf3BxyaUXVXbwoV0FpmBuMXJoSLQyIPNTVfGuB6tIwtLOpMk36X+?=
 =?us-ascii?Q?4wIIN2gGIS4eb9FYIEQQBYIDEhucY5kTdlb5EckBfiHidfd1TnzAGV075sx2?=
 =?us-ascii?Q?5k/uyB1zTeY05uuMOaZJzVB434wZ8el0USxlc/DdpenOHTMGZqw91KM0xvi/?=
 =?us-ascii?Q?SVcjFNb+u5ezqjfuwU1DMakD69BVpYrUJ1uWKzbACGchzgG+0eG2tLhbr0bN?=
 =?us-ascii?Q?zGvH7gZL5cYwIoC4blaXTQfvaN5KH7WhjFOMTVlaSGQaOPqI9aetkmBvrkYP?=
 =?us-ascii?Q?jcbg2lvITMK9sJjiqNppo/FKlEOiBFc0nahrOmbbaYoapvW6Nyq29qKV637X?=
 =?us-ascii?Q?sHa3C97z7ZqkNn8p/g9B+ZTvRtNqhn/HP7Lupg+THwshpcGvG6GF19o4MRL8?=
 =?us-ascii?Q?JQcVixpqjy2FCXXgwX2Unix4WWDFzAxmDAxyxyq/CeToXMS8JMCb4loC8UpR?=
 =?us-ascii?Q?xZ6iUvGdu/SJWvwe3zd0gjxSmJ7fClR+m7yUsnToBPlvPtdOvYVwrTwcFc5M?=
 =?us-ascii?Q?rZjs8Aw+b3yrQqZlhvi9w2wAEFRyNFM+k/41XyCU9BHuuynXBbFtNvRcZbBX?=
 =?us-ascii?Q?hrTygyZfYfAHk57jOuBLiXQh6ac800cGY4MQLqnQofA7bMRUpWTDR+a9+wY2?=
 =?us-ascii?Q?hjSZ2M4hvKTOfYOtOz3/sSfmnjI7kdfwvSM+Bx4xMIg479wL2qVRwRe97nSm?=
 =?us-ascii?Q?DQesrY59mv7YE+JR3rgtkLeKjzkjG7c6d8jKpnHZnR7nzsS9nQrDL3U91eor?=
 =?us-ascii?Q?KMRbtJFmUITFoAkkUmwK52SbDZDy3GpgFWQaeeU/oeeXVsRrRcYNNvujbhb4?=
 =?us-ascii?Q?RYHUJ8/b8EHgXVVa0Jfe+xWscqo0g/GqwjumeIdB0ZR4yeu00AKsOenixKZW?=
 =?us-ascii?Q?F2bGvmIKFRWaHcwFXt6kwyZ8Lo1wAILCHBlGM1TdWfYBO3JLSsJ3uoJ55lmg?=
 =?us-ascii?Q?QJcROJY7FVuFImSrlnWyOWvIuzvrIBmAtS6sYIkvBIVuWrY2ajPau9gP2qsx?=
 =?us-ascii?Q?3/qQqjKc2DH+gF/AS5ykCrEmZAjzzydlb1nNfqctTg1bOjFLusIBjMH4HrBz?=
 =?us-ascii?Q?m4DnU4WLdjxbRioXZcr5b0ocEd+x+e6VcgVkYmtKq4DZ9yRtAyMC5CCevYVq?=
 =?us-ascii?Q?9ZfO81WKmGEtg5B0dClmb/gHn2Pcr53Q3yssR5l7hUBpqZDn7MHSHqWGIU9/?=
 =?us-ascii?Q?Z7DG71G7NPLJKTA+o7qQNjB9cRO8K/dYs5BtUKtKwWt4xHWT3oWSyjcKGxGA?=
 =?us-ascii?Q?3aYt9NSWy+HozSWeonzW/SnCC4rwsWb4Nzu+6DucKvuLHy42CAt4dQSYCean?=
 =?us-ascii?Q?fMyE7Hi6Om0GbtvHR2ksQrmCq18YyJSgzCYFn/XmDJGcfmGfptkm+8d39W/z?=
 =?us-ascii?Q?w6D6e505X/ao7lMYeSVRSVRzbbtPPSopNt7x+kPHTCkgwR4BTK8ybJ7kjEnA?=
 =?us-ascii?Q?jKtfNnmBjj/GFySV9XUPONbgD6YxtI1lVWcEu2ZkJop2795MTx4QuGANcYVI?=
 =?us-ascii?Q?o2O/O6myXB3nMw0EEr2+9gHHMvvIIHSpmXV9C+owZIYrh3PX9r4nO+DXpn63?=
 =?us-ascii?Q?pY/VTtr8ybHq7hCYwA/BjQnbzz3zJkM090DR8lOPzpDVTKeqjHazml6TpSXH?=
 =?us-ascii?Q?O4LJway55NxmeSZdtfDUqf2D3ZSnOiMwDdNlKKUVVpa1ItTUP2/aEm7U5ckx?=
 =?us-ascii?Q?RAvgQOU7aDx6cUix6+bYstcQTpJwfW5sZzVrvC80+akXBfy1PEGim+lJp3Gb?=
 =?us-ascii?Q?QxuhAkyrSHOwtetU5mL1siM5ZMJ/76PF+rN7DQAkcW5OZyJPGo59?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9f62b5-9443-43e8-ecd7-08da4dcb08a5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:59:24.6544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdOV/oqFtXBALxzyQmqHKxoXSTL9QiNOuSf9541S2vPy8AZZPqlBq28G/JhPJAS+V1HDf1LIH04EMI2WXpKmUkqd50WtclG7saluOn9TXr+725cOinuM+KmBk1jrEu9C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6220
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

This patch comment out POC2 which is not used/documented,
and remove TD0SEL3 which is no need to have.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 76d2cdddebe2..ae179b2f7e1b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -3657,27 +3657,25 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 enum ioctrl_regs {
 	POC0,
 	POC1,
-	POC2,
+/*	POC2, is not used */
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
+/*	[POC2]		= { 0xE60580A0, }, is not used */
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


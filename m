Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE2944E24F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 08:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhKLHW6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 02:22:58 -0500
Received: from mail-eopbgr140055.outbound.protection.outlook.com ([40.107.14.55]:13911
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230510AbhKLHW6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Nov 2021 02:22:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZfH0P6zuNEIBu1Z7Pv8aOin9cl7HNygL0uKH9GTRglhgBy7sbSjpKPRo4fCMPxEO3LWMFBB8TVLtDld5dNtpjUl4DcGpKQ9chtwmvf99y1FSMQ47acvK4grOB8A7cLQ3yKDaVx2hlwA2BBxNA5MG3uESS+ONUbeBvxF8Z/vqhPWadcaFyEwdCwhOgB9pGLcx7BcjXnOdVRfl76adkzCYQGtjbwNbk4VNN/JaNxuv4IaCd4FtwFQp6S4UkyA9W3RCL0Gr8brKhljc6BhoFdBa4bG5bDVS7nMv/7pohowSek3jY31f8uuUo1Z3bG9+IwZgRsPFK4AECOkGlIwR9RJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDWWtgaZxp05dRfIVmIvKiJdnp315o9thj0eLgGrlng=;
 b=fjaHYmkX2VZwAcbnUcEDNTorMHyIpRCdrFczwAmWQVRN5B1Cr5AjxCm/mh1HWJfSywdvwF96hGbbH9PGqHaio9QqPsVr2r9PsfXTx8RCFBg5hcDyBlRh5S/L2CQ8tqM1+hSdNUhmjVmkroAuHTsVHK29AqoWyEqQH0CEpnUaJiZ8ylbX0CYIhJ4fC9MtSI2Got1YbpORwT5W3s7XuxgHSpEYGTV4B+4y6kkVrz8rrf430f0JI1nA9/fa9w48inP7e5+GVIUdDxnMwuoKOwdhHFnCQhjJmnQEOfcuGm9FI/tQpJqeBhfLCIcJH7qmSNx/bzRZCZ9/vH7qDYY/YFh6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDWWtgaZxp05dRfIVmIvKiJdnp315o9thj0eLgGrlng=;
 b=WE8rCoJruk+NyZusn+KWfCVQACXLtxWzkjLYx0G4J45ASTroGxdAEvxMr4vVcuBd+4KgP/hRkMHy3pNsF4O3urwzSjaqFkpNlGBqRGC91JtzkPo9UFG5RVHqYg3cQrjCm2fX3Xt4tOpMBHk+bfkxtNQ12J/wqc2Z+vWOGnq6ebw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 07:20:04 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 07:20:04 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org
Cc:     stefan@agner.ch, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacky Bai <ping.bai@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4] dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string
Date:   Fri, 12 Nov 2021 15:18:58 +0800
Message-Id: <20211112071858.3641788-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:4:195::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend Transport; Fri, 12 Nov 2021 07:20:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e994b160-f814-465e-b386-08d9a5acd8fa
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB9180A536A1EAC151EA329D07C9959@DU2PR04MB9180.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OOgHhRu31OJMq0BNHRvbe0Hi8XJkyt2Y05bKZg2+uyN6aMqBhSNCuNDCyQn0eSkRJTffteyPEwJKmR0fE/NZHcF6JGJ0M9mqhBluaY5iBdpC8bpt2GsYOhcnbhYfsEfrm8P5Vs5SdSggk0lo/1kdoQWMfdNJSp+SCLtubFBuPYJWcmB8GWVRcbEEi67yAprTS90gGwJcWSDOT5vlaWm89tapllmzonDeA+OYzMEA4RjJwQ67yVIW5To5LROViqRwLO0PPo0nPLwLi/eBU6xMiI4dRYl+HPX4M0CqneybNvvn/Z2J/nsnBwWTuYQcnuji9mtBj7DYpVN3evv03wLTGYjHMYYoRc9iNyPH3IRRq2lY8frmdaXqFwnQiS42omt031fNRsf9GSB1KIYWzJBhnf50hM9OmpBB3eIq3Ll1ADy8Ed5msU4gfEO/Bk8t6zm64cXSn8JOSf1VjHIcgVmLmDElXvMrsHdrxceDb24CbQnv3/ns2BoUkxgDMyVYW188ahr7Ipkr5Mr45agrJQGIMVz3p9Nv8YTNIUm0eEHeGjk9alb0/5IPvA5pw80mgn/YExqnGrlps+84OFBdrqWgzL8Xd5EAz6WvR+a2ojnLrXFbi6TlJu1LjNZ88BhFqf6YtpqfBfql1yQuByTuw4MuUWZ06Q8/w1PiFcitCxwcdSyHviLQIXG5wQPa+oMbmi1KY7/SEc1LseqOQshnpNyuqT7WtqOz3g1WmL/oTh8lKQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6486002)(956004)(2906002)(8936002)(26005)(6666004)(186003)(5660300002)(54906003)(4326008)(8676002)(6506007)(52116002)(6512007)(316002)(38100700002)(66946007)(1076003)(38350700002)(66556008)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mmku3MJXt3mycUdEgagRAD1AfO9pcKU0b92GqFRoiTMEnSNuewNst0D8Hnuz?=
 =?us-ascii?Q?TTOjUbatuQ2As1k6yhsznEvUtDMqPeelAhZsqeuW7QF0Ji1NmvJBNAn/6PT7?=
 =?us-ascii?Q?HtsesAc3F2DztXyL1jZa6eidjVSncGgAXbP1Bbuh5YgVeuBBGb3KwpX6eiC2?=
 =?us-ascii?Q?VHW6KZyCZ2v34GT45tAk97XouMVZ3Anq5yKLpMxgz98OvfzIEe2KkxRJZwjv?=
 =?us-ascii?Q?81WdsZ1Y1k2x55QuXo8uvXnLbGc9YMWtL/7xU/AtIZqI5mUwdWY43TCbRkx6?=
 =?us-ascii?Q?UmlcimVIkz0/H3xn/PdCVXmTk4QS++6cNJp19P/gH0CPh8P2vQ30oSgPo/qo?=
 =?us-ascii?Q?nkeVAme9DLDPLj2QzZF8m01yYTdiwrpUoOH+byNhvjSLUHlZYHU7Wtpoq3th?=
 =?us-ascii?Q?0A3wkEdCDCzkRbvoVXsHpImYtgS4hYbjLi5bP9JPva7XRqbC9PtAKmExYWXu?=
 =?us-ascii?Q?ohgdeconodK8FOs5jeAsGquVZByMcFo1wdTty1X6GEJauDt5ODYSkFNr5C3C?=
 =?us-ascii?Q?BOti4DzAiPHgwM4iU18d0HU0lPW6hl+VPrG2DmAsb/BaYEXE+objB1Y7ltV9?=
 =?us-ascii?Q?cM1OID6dEwBTQ7hhIZCyK8bXposg5rB7FUIbLqU0MFIt5UTQ+7xydJyRYo+z?=
 =?us-ascii?Q?ZYDtgKQP4hwqCB2VgQItLUJqp5XuL5h/Zvdaro6gNZ3xD+OFaiXzeVoruc65?=
 =?us-ascii?Q?wN1k6HRYSGAhOTie53bfI63YXOcu1Jk7zgayKt0EMy6WCQlrzTOws349nJ9S?=
 =?us-ascii?Q?0SXQ9KzfJxlAUcwRkvF1XbSE0uE9pSezRJl5rYIOPTkMbS/dAX2g2WzMKL9l?=
 =?us-ascii?Q?glUVT2WV/Toy0XxxbtB8ZgsqhaR/9hjdiVdA215vnAlSzHNKIto/Mck5WjXc?=
 =?us-ascii?Q?eKOqUU+oei/X+I9FvCIDXxZzPexzTvE9hQSbBy20LjSciGW9tPXpunGh2WUr?=
 =?us-ascii?Q?RG66kjVuRbdU6MHtm2hbLhd1aeK/ykYAymLI2ZHCCR7OZj17TallhkwVjefV?=
 =?us-ascii?Q?qqJmOv+NTe0HpUdT6EhcyxCUvHs/WosyUllVL22PpNxj5E9I4uRGVHG9IRCf?=
 =?us-ascii?Q?Zt1rSGGFvsm1JBD0tRXEURNOG/+4Zps5715YaZHIGvUHdoxCYccOGn9Ib0qQ?=
 =?us-ascii?Q?+MxEqL9m+ObcO42zfkKeUj5UrDK9oeM6EYH364sgidWlnM9yb4n5C7ZkW52A?=
 =?us-ascii?Q?U05s8bti6zUIA2gl2/yAkHnfdJ3JMrHdR1Xl76VlwXAcxvIhRwfAxPN3J6eK?=
 =?us-ascii?Q?2Jzc/5OVdOVrn+FvrKiudyJmAKuZLsCNk6rL15FEAJAURl1Bb+7V/Sy/87AI?=
 =?us-ascii?Q?WchNitdAWDmHKEnYUPnuJZ4LitPAcTtHXGegU7x5tp09mZ4wWXnyQN2jnIDC?=
 =?us-ascii?Q?UQZLvJOixig17AeTy8wJ/Ytu+kWLA8ZJLdEhrSz/gt93cL7t27XFveotmVWo?=
 =?us-ascii?Q?RsybkqIC3yoFvYcjzy4ixNadLtqd9lUFz6hn5/qQ3pYcTRi5hWglG8yD/ecU?=
 =?us-ascii?Q?gWwWq85WWDK0sO3otQJSkgJkJkVaRIh++O37dvpEPkkgMtoeqrtgQmrG+Tl8?=
 =?us-ascii?Q?iik3pLpXw1mEYHco/eQ4SiUaXl19f9t9pcsHfC2yvxmjiVtoGpjVaTy6eQnk?=
 =?us-ascii?Q?Nn3B9rQqQepAwzvmCauzhUA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e994b160-f814-465e-b386-08d9a5acd8fa
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 07:20:04.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++yg5LloyMGLghkpxwiGNff3MEsq8xQBOhyd13/sPao7R94YmGedS9aSkOH1NZxvcEDVH+oa1ZdEz2nx74086A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

Add the compatible string for i.MX8ULP.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v4 changes:
   no, just resend this patch as a single one

 - v3 changes:
   no

 - v2 changes:
   no

 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 19738a457a58..e1359391d3a4 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: fsl,imx7ulp-gpio
           - const: fsl,vf610-gpio
+      - items:
+          - const: fsl,imx8ulp-gpio
+          - const: fsl,imx7ulp-gpio
 
   reg:
     description: The first reg tuple represents the PORT module, the second tuple
-- 
2.25.1


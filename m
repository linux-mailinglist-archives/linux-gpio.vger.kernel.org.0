Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6249B53F333
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 03:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbiFGBHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 21:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbiFGBHD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 21:07:03 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F736AA4D;
        Mon,  6 Jun 2022 18:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMLOkNB34uD6sgKGXjTFaJTaPD9sxvIcH1LkeRm0btoVXd4tb/zRQpmsIPhT5JPmvNw5dvchOo0IjeymUuzbiulRjsAKxlup4EwXcn0yBPvW+k1cc5XIMWB1KXoGwKQ1FTyrGX5L/C6uUn1pzYC8ZNGyHBbt+0IM7fiGNxcOvJd+WrMj9cr0RJholBP6wPWVmnZL5E87SDed43070wLK7JxQVHxEE8+hD08mjPADqJqTo+ujVi1k2Q5ngrom9rSRgyodysTSEmdj5C6E+WxDDAxKhRelEFZFN2uAyFQe8fwJfEg+qHe8KXPryTH0v69bkuL2BIN7GHIuv4OxIU8Icw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XJ0+At0aiYEdW4T3N2V1MFFZrBRg9Un1ht84S3eNIg=;
 b=j0Ym83r3K73Junb0T0eCw/lQebCs2IiwsT3c/MnETkkBwuk68R9TrL+OnzSGPKTVYKuNtpLEbi8gxiBDIUc5zCjBotFIqwJw8pDRLqyLgeA2nkWPfVPAfdU59LGCJmYnXfihKGnRCNOTdVjFRJATu1WKzELqqC9TIrVkXBAwje32egdx7VaXDmJ5BuAWWgol0s4dtRoxGw0TxMl3/BEapgn1tlnr5fxLcBUgvsvYVNEaKcXz8kSwTtcOZej39AuiTaY++OehiIsO/VxY+AKJXNMau/jDzhBgjkEg6+g8eS/OOlh5YzsECz6SSa7cVr4BDFOf5zizNcimT8JEIAnAQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XJ0+At0aiYEdW4T3N2V1MFFZrBRg9Un1ht84S3eNIg=;
 b=n6d+9QM+A57Lgd/12TT7eqtO0tm+LdX3dG/3It/00CraaH3y5Chlq8V/cfiNbyOWoGSk8dGK51wV5KPklgF3Cgn9MEiz0j7l7qX6dEkBYUyc1nWNu10kjzreiGi1uJLro1krV98yZmz1ILTvzBMYtOlVvyjpltYdkQG/lvysjnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7781.jpnprd01.prod.outlook.com (2603:1096:400:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Tue, 7 Jun
 2022 01:07:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 01:07:00 +0000
Message-ID: <87y1y9gu30.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: renesas,pfc: Document r8a779g0 support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 7 Jun 2022 01:06:59 +0000
X-ClientProxiedBy: TYAPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f3e3479-fa27-4829-1328-08da48220646
X-MS-TrafficTypeDiagnostic: TYYPR01MB7781:EE_
X-Microsoft-Antispam-PRVS: <TYYPR01MB7781E479669960E579DE9ACBD4A59@TYYPR01MB7781.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pQww0f/5uNCxF+lhBIZAc2P5B8ZdB92L12ehTAXAIAV6Rs0dCOUgC74yGQBlhmP9opxgC8NjwElsPGKCYdR0XdgprjbnA1eynLp5y2li0sD0oH2aE5k65jKmtN4WDddSJJWJ3NZD4UQ4nT1utWObZ5Dh7h1RPeUAXcramnNarFAPB9FCJ+pvo3wpKezTwW6Dud9MJHalR2WNx+FgEydpfsQYPklMTRpwf/cprhtbN8rmYF/keKKdC50y5d2cFerZ3tvTX1onlbXDLWxl8Ur5ZG1f+Uz7UZxzmNILmLZb9IkuqCAGjZdNrERbnlTyYb4m2GJthRekDJ1MLSqedOK7o+YaBgwj3PYlUATWeIwvYwCRTilWPCyZAmDBZTWI+HOtK1QpK5ylqRUoq2JZeGBUTh0V32+8NS41SU7DhfdATyegSRq1NATDTC6eLsC+gea2rwwy2aoclErD/TEusKnemO/iFjUQo0Z9aXiB/SFcTSaBwpg7WFX4JeYnWov8eysn02ZuPFequYA6fYqsquWeYLWH1OyFUAtygrZl6R5UB+0wYDcG4G0+Ndq3cS3VH30tWwevCdqBhGdN3HKRdVoaMaKslFr8uJfXfldR7xM7RXxkNRpmNZUcWrejiHrW2Mdz13Mt0uM31gJNfjOsTUOL3ZpIm95pEfeznEfO28AnL5SsAc4QagOLLW6AsCO8NqB3RH73ouVEl1Cext7C8vPDjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(8676002)(4744005)(36756003)(2616005)(66946007)(66476007)(6506007)(52116002)(66556008)(4326008)(6512007)(26005)(508600001)(5660300002)(2906002)(316002)(8936002)(186003)(38100700002)(38350700002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EPpEoD+KJHyBWzJK1pqQ/uBSzy0eDaerYRB1AUldkTwRPyq2PoLCFhl2voqs?=
 =?us-ascii?Q?0pZvfLI0qk2vwL5zuDUIfk2aCrQS08pU0dzE7Ja3JJr2lP6p7+KL2gjVsKTv?=
 =?us-ascii?Q?HLY33EG1Bvofo5Y5XTNWuAk3Klr04QvCFCupNtFDsFQ1J2RAgT8rUc9Ua4+a?=
 =?us-ascii?Q?nqMu0+5IPoY2AsHr9bdYHF5VYoLFBqRxG1UiUZPajvs3SwfiNFsA1RtdmxBr?=
 =?us-ascii?Q?c4OGtUa7j+L6Niu8GDc1mhBel+KVWBrW2CaWyqPZu2BHfBlyp+42tZf4esFk?=
 =?us-ascii?Q?f+4oqqmUH1eV9xvIjAr8M1B6jRowLAZ1cNSj1Z5pZ8Ja79qXHFMIAqUNWS4s?=
 =?us-ascii?Q?NalXd/G9AmmHi8wyCXGvZhHujspV9urr4JC83U/xXNdfpBmxmwyrPiVsLRde?=
 =?us-ascii?Q?e+WdK3SZA2ik8KkcR5ZDHZK+xhbr0RyC/Y3SGvsjx90raJgjPrvXGD+0vIzu?=
 =?us-ascii?Q?sEVcRgwjz464cmw5EijLKTai4eZADwidhLJY7TU5f6QopsOhzn4yUGpvRu04?=
 =?us-ascii?Q?0g9VifgsP8kOkhqSQp2rL6t35tsAYpascTC3BClj7EAJesEu/qTUwGlcOrTS?=
 =?us-ascii?Q?fU0Mvlt2ouRmUJq8NaLQE4VlzzxFKjfIdcYx5sQRm6qq179bY6eb0klZMaKZ?=
 =?us-ascii?Q?U5n+U1rhesQwVpfLvwGvNuFX9OTBqhaBhU7TrEmvZxM7MQnzt4rP409HjuXF?=
 =?us-ascii?Q?byGO3nxdMHFP4ema+VWBiv43QdzzDJDuLaB07W6Kd9FXbhwi3nqVCGmseyja?=
 =?us-ascii?Q?Ml4OYO5cdpm7yTrMWRttv+ZrrzZkodLJw76ytiP2W0eY3nUnJ/PVO8eNEpaK?=
 =?us-ascii?Q?JISzu5Gy8TxD3dNwVYDWFpFfmNCmZm3zRpiYRuSmBSJQZnCP4XeR7AhKUl42?=
 =?us-ascii?Q?tN3Rww2+su81VkNLxhmj3QzT52nDI6D2NcGesnT/CE1hDqNyTQHu5qOBhLC3?=
 =?us-ascii?Q?8BStt0mFjH0vY3Z/z6nzuzBjtkYf2paFu6APXQ0mZNFLOE/5l2p5mI5E2bK9?=
 =?us-ascii?Q?bbX8B32Ysh5+7vXWhuzlD9J+w7A3Ow1FhWRGg2tKtOTUqywEaELizexM8dlv?=
 =?us-ascii?Q?yq3T/mWLYxkB7Y9Hp76Sf9AJvb4SKsSvypu+4DQKYDydLaPQbfPz6nAzEaYX?=
 =?us-ascii?Q?KbAV2QNC3T9euAC88osLzhdVv6d/46lCO8tX1rrqrWtynvRCqgQGSL2dwE47?=
 =?us-ascii?Q?kkIDAjv0F5FtPPJ2FLq/dCQId+wci0JH8JQon4enqtDIgYibt6U3NcoGjs+E?=
 =?us-ascii?Q?J0gEGYRU02qbZ1oYsjul7BnzP2qt3x7ZeDzCvG3efBvhLMwJbcD+pNMlnOJi?=
 =?us-ascii?Q?+p6aIALABXJUBeZtmkoxt72ch92HZ1Dpi4SUn21x9c4LSzJ9fnjodRUlsaQx?=
 =?us-ascii?Q?iYPEeUhYo5yOId09Jk2490MNKS2Y5naXcCfgrs+w2PK8iAZrkRs5B9K8aS65?=
 =?us-ascii?Q?NsYwaLTZxkpamHXqeklKkVfkjefTp9uFhci+7Hw/nCBJriHIsaFbRQOTJY4I?=
 =?us-ascii?Q?inIQuiWQaRDmcQE1pKFfcZUAI5H2i9DVYNX5+nB2RHoqCOSN3l11zpH1K9WI?=
 =?us-ascii?Q?qBVjZmA61rpzc++inaIwJiZ5sMDWydcYThPRpp8xy70pK7i5VBatso3OlJtg?=
 =?us-ascii?Q?kYPhIb3SpO0cCUlTOv4vGnDazcZkq27QM8JnB6zV1hZqPTHGiFosUCb57ujR?=
 =?us-ascii?Q?SHJdSbas4a19QTAZKJp9E9siZXpZ8JcXi3eyxzxwrZaZPIO2TPJUdwLTqfZS?=
 =?us-ascii?Q?tDmW4grXSRfilLL0/WQBIUYguss5U0YH8qdkJAqpVMclooKNjjzz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3e3479-fa27-4829-1328-08da48220646
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 01:06:59.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBhDF5EAVY0v9vJxkiZl35pp41j7rbVXbF2LczfzsQHDjjb8RlCu/MFt8rR0wBuNudB2HIFwh0mUdcCnFJj6yj82+RjeO4BPD+N+StD1Xqc7JROQ52sh9Hdy8xu7kVYo
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

Document Pin Function Controller (PFC) support for the Renesas
R-Car V4H (R8A779G0) SoC.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 2a57df75d832..4fc758fea7e6 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -45,6 +45,7 @@ properties:
       - renesas,pfc-r8a77995    # R-Car D3
       - renesas,pfc-r8a779a0    # R-Car V3U
       - renesas,pfc-r8a779f0    # R-Car S4-8
+      - renesas,pfc-r8a779g0    # R-Car V4H
       - renesas,pfc-sh73a0      # SH-Mobile AG5
 
   reg:
-- 
2.25.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B563547DE5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 05:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbiFMDRZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Jun 2022 23:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbiFMDRW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Jun 2022 23:17:22 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50075.outbound.protection.outlook.com [40.107.5.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96D91BC
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2022 20:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QACpxShRXUxgHmNpKYMUI66YyXGL1/251OypEUloUaeeQVb4kBseLmkLqEiwKoT65Ur9YUlvg8KZgSVnbShF3A9Vnt8Q5Sb71Qd8IX21bFBSVANOBFjLPRC3Tg4J3TV9FifyavRcyV60ZF8z4+kJRfAwoumHa/INJzKfj4P6iL2dTVm4N7xDh/wz2HyvJ0kf0+uAJM+EQ/91A0G1dldXGhIOZb3+9BlkJqcoK2nzYCSz2ri73Q/0BeqGncE//1z6luLK4KhUh5T7GT27lt34E0eKQcStHtcs4virQBsHO6JfAV2hMWbWH/L0N9ZrPcFifOapxOk8Eo56Sb8Cn2CzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDS+CxmtDiePUkNciVmKe07XxE/prpOg88p4G1AxjyE=;
 b=U4kgcYNkFlpTElwR3ZBwlS9sZbgVyNEreQ/mTZc/ZfWmRNyMmXv6F0ZUI6D8uZKK6Tozfq6c+S21082E8A00wtkc7tvIxXdbQZTCHUHRvsnaKNhf0OYu1zD3K8KfRfH3dj3WY/ikFauONowDqXHjnB3fYipfhuF1l94Izafjl9zWxpl3j6WBYrWO/rKmhVlvRsWbFEwt/p2dq+C+3OjIK4IGCyKoCR0X/1B1w+SOMJJMkGtK+B3eDSUCt9RnEQiq+/pFTUN7Xwa7EC1BxtTUjDRefg0UZJiskI9bjX0sP7hzA6MNw9hl4b/Hg0N3edNbCD5ntduBAcXgj6mOkE94TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDS+CxmtDiePUkNciVmKe07XxE/prpOg88p4G1AxjyE=;
 b=RGyQDUqdzHJnF5LmSAc7C+OYAznUMnBMaooO8/1edIYGJiBop5eOUvCfsdG312gXS5lFM3jftcigoJg966WoJpxW/RYHELznhxd3gbK2q8Oadj4bmJ7+L//MeZJm5nwTCUbW6e0i9yeFi1Le+c3P0GlSejCqug4F14hmAXEZo/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9)
 by HE1PR0401MB2537.eurprd04.prod.outlook.com (2603:10a6:3:83::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 03:17:16 +0000
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::9dbf:79da:79b6:97b6]) by DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::9dbf:79da:79b6:97b6%4]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 03:17:16 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     linus.walleij@linaro.org, shawnguo@kernel.org, aisheng.dong@nxp.com
Cc:     festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: imx: Add the zero base flag for imx93
Date:   Mon, 13 Jun 2022 11:18:54 +0800
Message-Id: <20220613031854.1571357-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DB9PR04MB8412.eurprd04.prod.outlook.com
 (2603:10a6:10:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce4bac6-4cc4-476c-39ae-08da4ceb375f
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2537:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0401MB2537B68EBE8EBAD715D9879987AB9@HE1PR0401MB2537.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYoUJj8Om2ftstZbmYjtMZyxDWRzX79DX2/5ixc46g+9FDCwog7siTTYrS87YFD3BGNzHcLOyD32VpDGfE+87h8GNPcOIye7ZGzoW5uLXBNmL4XLIYDomH0mTPm03iGsnR6qkVoGclnkoprK67TLrd8Ouij9ALSdEJSD6Tk+ch4ne8TctjW4+iJXfneaQCZ7t4Ue/4qPhimjosuhK4nCxhhi1okNI5JFvdPMVImyEnUmDXprzJakMwNzUbtVJq7c33mvCILDqhfSxbtoBkx13EzpBUgWkaNascBATrkY1eL3ISUCsu4q7nI2uvkWBbB3OSv/dWNUVTSTp85gHEr7MhixuC2tkD2tl7yssLPxB4HE6FNM2aLw0zu1r3W+3jf10Fvebuf/zQhybQ0xLuQpQ9Lc98ZiE2Q5C81YGd3L9ZIEJhlfz34pfwxEtIG2B9QdqpKuGNrS9mtMoQi9d8cjrumz4UWuPi3CxEFFziIPYDRPVyNkLjzjxRHo/2qAKPj2Dy9u8M10VFFYqkRtDYZaRrBjz0XkUza0or9rQSfiKLRwSbEwHxkgv+T1WRNWZvBP9JxkhdceV0a8SnhU0NtBxCdQN5S8DLqdDsrvhz0IgdmARtwMR6TckyzWF0dGaRYPxVD6ptgVSVTNdvTyscyFE2nzWRXuR0EHBY0fTvD5/X0ovq5u/2FKvHPSx7d2KgsfdxOjn2G7SpyqZ/xQjcHJVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8412.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(66556008)(316002)(6636002)(5660300002)(8676002)(66476007)(4744005)(8936002)(508600001)(38100700002)(38350700002)(6486002)(6666004)(52116002)(6512007)(4326008)(26005)(6506007)(186003)(2616005)(2906002)(36756003)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c5PSPbqKHWKdjO8xQkVAMTMfLsk7+o7BVhBfOVG81YlrBFZCBQOqR3Eu6mYx?=
 =?us-ascii?Q?BMDbHkwb9gDaMY0nllnZ6BdbFc3vj46ND9xf1ErUEPqTG5seCU5QxtsYE0ZM?=
 =?us-ascii?Q?JaCj9OYrpeSpMka3ShtVFi2aTS43NU99ZpqFQyJXODnpc6DeHO+YtHMstXZR?=
 =?us-ascii?Q?k6Ph/ikWXnyZXIH0D/IUC4Y5CkjPs1IhMfodzN1fMywl7m7QRkKrv1wlo40K?=
 =?us-ascii?Q?wiQRqQUMa6E2jCSYDG+/jf4cAMPipdcnBuqQBd8rEDy/irxkB+Ca4c+EpDLB?=
 =?us-ascii?Q?X9tuAJFG0k4Nbu6DLTaFEbFEs+KBVJH4FKRIoVEaCg9xSTvpt8yhNXpaH/pi?=
 =?us-ascii?Q?jd0ZgQpZ9C59zRk3VIIKh154dmU+yyEdkp3D/qcAlqtmoBHYyeLJNl8R6rrS?=
 =?us-ascii?Q?bCwGvwI7EZewXY7SJ8WzUc8Pko0md6K99hKseUQKVA6YrUPVOQdjjFVdNZXf?=
 =?us-ascii?Q?d3N5gR93I+2qSMfLIVFhdT/yZx3yl77M42ndlStdPaohghx80vqZznkbSVO3?=
 =?us-ascii?Q?1DkTAWSsYR5QSF/YrFb3qjDRuupioLF+kLSujyLF358VomwRXnrOYCRqUVb7?=
 =?us-ascii?Q?KsKWLoyRAD4s5JbF/iiMVX5deRc7v26DfDZzNpu3dNfS6oflk+nLtT8RSc/g?=
 =?us-ascii?Q?fIydmGIWMEmVwdfSN4X+epXj8Wl1oNW0NdMocy0TpPp/UuGxJY/g1cjPaWuV?=
 =?us-ascii?Q?K5X3xSo3Tje1JHPZe5mkm8i8cfx+D0jp5pKfuST4pOrGmdCjDibLlkGSMDUU?=
 =?us-ascii?Q?iJb2VnJ4nyiM+xe2qQJw9ZusFPiegQfHmDL+D2BtHS1eqUgUamoq26nLNGpL?=
 =?us-ascii?Q?UpPnswdj/8P4al5mAOVvyOwz82JYoImvB/xemkejApJlOLb9XLebLZEPmNR3?=
 =?us-ascii?Q?egTWQ1mlPshShretzx/UwPr/XC3/DD2qgDiCfv1p1jQ2xr2tsfLxZ2qZ6WKc?=
 =?us-ascii?Q?fpfIVdg8TR8LfluheJJOsQMmfnNmhpkAKAO/z7659VgQ0T3TtZgK6Vo9nbro?=
 =?us-ascii?Q?ppikXxmvrye2qMXZ5RztFnOWH80MTJ3MLc7o4q/wCHb1qtk5E6U5q1pwfulF?=
 =?us-ascii?Q?jJPWh9MptqRve5nfHXZknFDNHIiGwIT/cqD9AmI916NqiFXNupKKcsgdqoSc?=
 =?us-ascii?Q?LB2MnZp0aNkjbe/a4DLsKk0WViHMrBx0jI1iTKJOSryOJttgQDDmqWVQugtL?=
 =?us-ascii?Q?Va2B4sHFSFYtZl/z5j1YaaKbfYlYnmydrjl1/ZvoREd5vHQjrKKEl8iM4A+K?=
 =?us-ascii?Q?sR7RVROdRgY55c8VbtRuEFJ7ZH27JT/A5D8XqNOerUVGTgTeVjxFBxYFOWx4?=
 =?us-ascii?Q?QFUPxGhMA2NpWAKlxfspjLJun4Rci7BxmL8KOyfGFShN3p9Oi7RGoiVLGglM?=
 =?us-ascii?Q?GKh69KIYR8hPFMAje40Dkm8HodUqjnUNDYzibM60QVqdFZZQbZEs0WAb3UNk?=
 =?us-ascii?Q?FswU1fqcEY6v89DL4xWxlphAxrLlnS4DBcdZWNiT9O0FbW0pwiaevfY8r6ow?=
 =?us-ascii?Q?5sVRlRvOWtlwgan5JVTXL/ZspYx8D8CSzDydooHTfdWpRAxEHbwwJ0baZk1H?=
 =?us-ascii?Q?5k1am3J3zQnkALhxI15D8dJCkJcmkYgco/yAc6/6GflvZvXO1O30awj2AerG?=
 =?us-ascii?Q?/K9SeqFpvyxRxO/lG5vuM6vMdEgUt0MBeOpHUDffbBxOlB4fzxjfSP5qdLO3?=
 =?us-ascii?Q?9YRGjW+2Ll537gFPx+od4SdkTmIyEMQPhQJmJOi5y1ZN3xj2PQFVbAri9Hxh?=
 =?us-ascii?Q?PMCy0c7SXg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce4bac6-4cc4-476c-39ae-08da4ceb375f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8412.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 03:17:16.0265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sc6nVhVZ7kXIigl8mTKiPOeHCIs/IklG8OR2G3VYNkuGNPagYfasn8QszIH4LYRPArMj6dLE++pAmuHM+p6Xpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2537
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On i.MX93, the pin mux reg offset is from 0x0,
so need to add the 'ZERO_OFFSET_VALID' flag to make
sure the pin at mux offset 0 can be found.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx93.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx93.c b/drivers/pinctrl/freescale/pinctrl-imx93.c
index c0630f69e995..417e41b37a6f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx93.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx93.c
@@ -239,6 +239,7 @@ static const struct pinctrl_pin_desc imx93_pinctrl_pads[] = {
 static const struct imx_pinctrl_soc_info imx93_pinctrl_info = {
 	.pins = imx93_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx93_pinctrl_pads),
+	.flags = ZERO_OFFSET_VALID,
 	.gpr_compatible = "fsl,imx93-iomuxc-gpr",
 };
 
-- 
2.25.1


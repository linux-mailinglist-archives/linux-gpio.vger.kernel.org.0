Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05FC97CC0C2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 12:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbjJQKht (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 06:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbjJQKhs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 06:37:48 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D839F
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 03:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nayos5kkX8pjc4j+3DUkq0nZDGakLm/WlGECwj9AU7HuO880YhbPyk2ffW0PNG9syc9jf1fJywJ4/kWmopWqX3jDRz2CMdOoghIf3k7PU8UDpFHQBlKS1JVvyYzKo33TEGA69M8Fg4urbczFuFi0E6eCzaK8CP1wvbeiQOrOcOTNJ5GJNuJVG9OGlLFTJxs3a1UHdKIOKbEJIcHf4L1lSU08SjzymC5GxCsLLDn/i/mU1cj2MtHmXD5NjtddE8ow/JwGdPNH/SwmIXQZkEMlkCLh2/fAEW5Y5A2zkshLoNSrKLFzjVZxZZdLYCUFQCbvXNh3z/g1s2o3kKW8PU07dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIwkohjnt2SLtCZhf8AzieG8H1ZZ3V1nR2HBn01qodg=;
 b=UOAdrnyGZMWslB5jeOsmR8V6I25gtoOvCIOsHbw8wj1CZCQykbejfaFZGrVoUHD65UYPDANbpMOdqaJ5NpDGWn/XneDEeGJ4RcwN2aSlsNHQBjs2gGr7Em1fpfWDNo5h0AhTGKJJZmaLkepR7vW/BEvA3Ea57iSF/WUSJo5B19/xZ7avebJnZLad1qvHxb6YDD1KaYDeZxLSOi8j5epEfwXU+yMsDztVyXUR1Imc4X5Geeb3B/ksmspRKV+FiRlmke4luJIe6V3rbvAgRtjizqyDa6KklNsLRHxN3v9Ju2fmCJShRKfV7YdMtq4A6toJitXt78wTxEuIEhwAdkBauA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIwkohjnt2SLtCZhf8AzieG8H1ZZ3V1nR2HBn01qodg=;
 b=Vf1A7evWBkZJpu3Wp0fFx8AwjKg7snDUxCuQm6IOeBUpsmpDY48kktQVRvBFbldJFejg5BBMmwK0c3WyJcWrhQOz3CW7DnearjF+vHr+dYfhssBJ7IPZlZ/qptK36zitPxwesQJxZqW3PUV8DbJga/1ndfqhLZp27tNWp4ULCpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AM7PR04MB6837.eurprd04.prod.outlook.com (2603:10a6:20b:10b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.46; Tue, 17 Oct 2023 10:37:43 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 10:37:43 +0000
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     andy@kernel.org, stefan@agner.ch, shawn.guo@freescale.com,
        aisheng.dong@nxp.com, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com, haibo.chen@nxp.com
Subject: [PATCH v2 0/2] few bug fix for vf610 gpio driver 
Date:   Tue, 17 Oct 2023 18:42:35 +0800
Message-Id: <20231017104237.1966094-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|AM7PR04MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc4ca8b-85ff-4885-4c47-08dbcefd1846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNqPkFAW6MaTlFTxiwaOMGbKo97EoZUCvgMPXRmwYCReYosiRDQ4oJHBHSIfuAcfVmZTnMTEJpBvx07SjbvoX63I6rmP4iRRXB0kbg9MojGZHZVS2OqRxH5UGZvS2z4uUWXFPFixujlFaAc3TdqF5azi7UizuJi9oygbHCwgBJPvsg20GH9Ws02lMQA8EvsYXbQl7wQCib4FSx6EkZ6d1XUhLzgKC8YRfh03M/Rljv8nSVHAExUeOywRGGWKkOADjynY32gorOtGIgh8tEtmKz0ZZ9tnohDKgopsxe48IwZcLF/Z6EZIQCOjBYMkgPEJaXE9xzs8zj97Dc0rvLqZIy7SS6AM9vjxSaGOX1wlJfvimgQchfHxxXsZZHQYZN0VRXYoWW/OYaKufpRS00EL1qBrJcS70iJXtzdAUnyqcWAOYBS8Qlkq63ug1xOBQtdD0TVT/wMbbNOpSofIM8wYeLjaT2cXi1qpkfr/mDOaYC/6/UQ6S+ENNW1m0xT6CfkaQuDyP3wkb0OIsF6U3bVJLjuqUmyfKhYihBtrOv/E/nDyl6vZ7g/iwzPjrsxOnso2nxlv8ceMkJ9Fz3bw/ZPcAMyiCSPaefV8ik7ASZTFHqV1WnaBIec6V0iQJngSuqqc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(38350700005)(52116002)(6512007)(6666004)(6506007)(9686003)(36756003)(6486002)(478600001)(38100700002)(83380400001)(26005)(1076003)(2616005)(4743002)(66556008)(66946007)(316002)(8676002)(8936002)(4326008)(66476007)(5660300002)(2906002)(4744005)(41300700001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vjYSq0fdUHLsgxFSDZkPI/jFKZ3E/xJgXKOitNrS46JjHdceYkBGdAVeBntt?=
 =?us-ascii?Q?HHSO5gqHVLvkfBHpPhhd/RGEiTwH0NMdJWNEsRsSDjKBbvI3c4Zoj5SDSfCd?=
 =?us-ascii?Q?8F5Xux9t2IJu9CsXXqFppr3sX3qN8qlYz04utFf4wizxBcDrKWkmpHBVKNc0?=
 =?us-ascii?Q?pnB6G1acIaZa6YxfcR29egt9SbbCkLl4uWFypBlY5zlQlYvQWyW/CuG4Ov7h?=
 =?us-ascii?Q?CF1t9lhwjonssk4hW3+DvZsXj3vaufEnh0+CSpzh95PJuOQanDbK0qssG9+x?=
 =?us-ascii?Q?8JnTeCyMaPkSt6f2lhhr+H+6xFaKNmhUoJGO7sgdvjWfKSu2X2pXi9+qWDJm?=
 =?us-ascii?Q?oIZh5jfRh4ZABZiE+qqsztKJNXvfu0MFVBcvlTFigF9ClmjCV2ysfMTgI9UV?=
 =?us-ascii?Q?I18S9ZKhLZo/xNsTGTS5VTfeztTluyP9aJS0JPxynIw0yFJgBYr1rZww3I0B?=
 =?us-ascii?Q?Gfw46DpSFMRp3FqatsXpLWg9arpvZWdLxdMUT7Wc4vWPjfjtob90pVhoEdG/?=
 =?us-ascii?Q?X+rrrLd3t4GEA7RQI0zKaQKBV3eM8BuhwTbNNlu/S2P3Q9strMPjrxv45XEs?=
 =?us-ascii?Q?c1uDOOpWUJZl0VQ7J4BycZnKLoA3eH16g9LftAZhQXkW3ae8Xa+8zTOku1xA?=
 =?us-ascii?Q?CO7upG/ia/eMACtD3NjEHW3W5uDeJcBEknRowjy79QDjHnI8wdlAyCK0E2vC?=
 =?us-ascii?Q?QtTckHc4coUyr2dVFZkryR1OKWxVVA9zVQWtfmyKfpsYuP2ZQwT2SoegEmB/?=
 =?us-ascii?Q?Jfo4COkdwP8O1zOHuzXbZU0eRqgHy9H5aZQ5G0+a1pHCmLH5l2o0bnrYGXoX?=
 =?us-ascii?Q?Gmm9F50ztG0j1J6UicrxjsLuTma2Z3nKjIOKDYl0MSLoVluR8qpojvgWO93f?=
 =?us-ascii?Q?EngE9I4KpoELbxiBPL4ipfp4NGhvETeMmgHbkfysSAi3dBnkgNDWpjLNhjIv?=
 =?us-ascii?Q?ucAkJsJ2ScSErurA2Vqvlzw7lttusvECkpTi+QJ3tckoqlrkVPC85ydz+b2B?=
 =?us-ascii?Q?AAIlW3D2BEwD2QYBo1Fi1Zbf8GH1PnHUOFL8ylRaIGGh++QfZyf7f8/GA/tu?=
 =?us-ascii?Q?CxmEh7PU7O9sV7RUhPvJZRaeKjgwGnGiqIz6hz0ZUpPfOhvZJPwFJ99PuSJb?=
 =?us-ascii?Q?SqbgyS4iT47H24faMlxOc4a4uw3BA2mrKIr2UjCPCAQTYXvugBhEjSP9Z4t3?=
 =?us-ascii?Q?48jVHaZj89yceLD0uRTijQ5+xNuGKttvxdbrO3mpUV7qjJ0eocKby41zuxQB?=
 =?us-ascii?Q?78/CrTylQOs8p+oU6FT+gfALq7JrH5dAt174WPlYzEfYMfG8FjFk+YvE9ako?=
 =?us-ascii?Q?uLRqb6xCEyopHRTqG6X7KKRqhNrKwdIx0p1CesExcqrxPVzyEVJB+YLkRNFY?=
 =?us-ascii?Q?lrSdI8b+oMqwHfcNLbde93i0WsjZUtYXKLZErQMMX3ervZAI0CsbhBWOmFdj?=
 =?us-ascii?Q?WYSp2+FT5zt7bPbeBR8liQW1TYuy3xK0bzTEohUpLn7ieENqnsPZy5NQv4jl?=
 =?us-ascii?Q?iOSuRrHKeByPb0AbZhm5m0VE5lCy/JWd3uNz0jkN9eDwSDclRan4XttzhBpa?=
 =?us-ascii?Q?I/vM/e5IPF8Et/CvnHPGRoDSS/TWFGKz/6y9CWpJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc4ca8b-85ff-4885-4c47-08dbcefd1846
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 10:37:43.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rXywwLXoIa2nAmjQMhuznAJZIWPzQTVl21e1DuSSASalMoiy1TgANWQIwN+9xnhMIpA9+IbEhUsbq735RrbAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6837
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

Change for V2:
  add the fix tag for each patch.

Haibo Chen (2):
  gpio: vf610: mask the gpio irq in system suspend and support wakeup
  gpio: vf610: config the data value before the direction setting to
    avoid glitch

 drivers/gpio/gpio-vf610.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.34.1


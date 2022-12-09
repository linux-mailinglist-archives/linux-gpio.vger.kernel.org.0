Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4EE2647EC7
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 08:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiLIHut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Dec 2022 02:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiLIHuq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2022 02:50:46 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB5350D41
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 23:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlYGSn5DYJLUUkuRsL3iRDDZ9fSFcC4M8HzNr05A1CGJ4hhKGYEHAVyypBpOpxK2duNOH287bcn16e8EfSEffC8TsWEZL3bkyIeLGHx5LEobUWBR16CBLsIqdYXTyIY90U5gr/TJWoWsBBPjMVenuEIm5X9+qSGREmUuuql8bb2oZNZ79SnC4zt0LO3vpTH1rQwZytrt+7TgOGKTeoI+VOsOu3o9xgWEBhpr1ai5Sqh2054sypwQPSvsQMRdqVoZXKM7c0nqzwv0Ql6uTc2CHdfH5Wst+DWqwdVN5qv/+dLHvsMXBUUjyzer2jI9cUjsFDDxF3NMqquLAkxdq1wm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFcwBFWLIisiR7tR64UZucQM3Oepa1pz2Pcz+GFcY7w=;
 b=mTi7Tu/L7CIdB/Eno6Zm0r8fvpDZrbyFbl0YKkxn6AX7SVmsdU3BAGEb/3wE5lPLdfkvLDyzVWQB/3IBOMb5RfZ2KhjMuU4XlYWC0UxfCerv/3Lffc4T1WBqScEsJxvxwB3HFB153zG+UMSeU6YjNxSjVPK9HpuM9GAjpGryIRgR4TjeVLAVlzhlFiZbOfuGKdvUs9yBw7Taoz5q/pfTuOw6wc81unxpTo3l8d9CBYC1oM+Ir7kLBfPfFAQ76EjjQ13VeT7gHuAA1Vx7CffSLj2/eXiPljIDjhpx9svxWVEjvYETGnQ0a/bVVnpqmtOTsLFSkZT0r5naH8OFzp0Pyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFcwBFWLIisiR7tR64UZucQM3Oepa1pz2Pcz+GFcY7w=;
 b=lVa64tT47d6kRBn1dE66OqphGhSaWx2/dBSZ9w8ZNYnPG4z6mrU1HZq11byYJzjKlsacVZP1bZGypGZYKLTeHnEVqTTHJthOjCiPU2fC8+CHsiBjxzNb9aWJ7pCRQk/gEYA8zuGvwXy1KOH6eQ/eyZXWORH9O/8j0HGVM62f1es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 DU2PR04MB9099.eurprd04.prod.outlook.com (2603:10a6:10:2f2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.20; Fri, 9 Dec 2022 07:50:43 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::7479:76ef:8e5:da0b]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::7479:76ef:8e5:da0b%7]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 07:50:43 +0000
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     haibo.chen@nxp.com, linux-imx@nxp.com, linux-gpio@vger.kernel.org,
        martyn.welch@collabora.com
Subject: [PATCH 2/2] gpio: pca953x: avoid logically dead code
Date:   Fri,  9 Dec 2022 15:50:40 +0800
Message-Id: <20221209075040.2141042-2-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209075040.2141042-1-haibo.chen@nxp.com>
References: <20221209075040.2141042-1-haibo.chen@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:4:90::28) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|DU2PR04MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: 22635fbf-ee20-447a-ebf3-08dad9ba1300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5FxqXBwYwqLAC6UeQWjF5oEt1xsWH4kePtTYj4bAe3lWMOOyI/zb8nUcX4/WUPpJswZ/UTRfxTmFVW2mtlgAarDRnfSkDE5UvacNCBuOEjfh7AGus1vvoU01Q9MNBFb7c9F3Hh+EIVbxTevDi0o0wFw2ujo7OZMpSHGme+f5jG5XN5qwB3i+NcYHXYIrILznHxtEJk4eEnfiCi0Lp12zNdb827NObjjaThR4hnBO2+QxxX52IzgNophR69bPglcd484X1cWg+R7OZ6jUYVNAZI2+phvaLCk5otMouivStgUV8qA2IQnE69k6oSsLnMSvzgFty5ZVVByCDbN18lXiu5SSsQbgueCx2m+jz2rPuH8gSLBtK22OB/jC0oEj74FsCtvhFoc2uonye1XtXdZLfuDoNm1U64Jf4HYDJDd1F9xvONBVvg/WYdHtg6U4llIqMqM1U4uzLI5lgw7+xCBUbXDdh5b0go4wghFaGPD0G6RlJiaBlSsLRkNX0nS1FnGYcP/qgQIu0a7NKidueAMMS2sum+WMautRXnaRF2FrrElqvOSuEtAPcSHLc6c+0fLUj0a77ivFRqv8g10NXaQJgrdgzIbhZlK18fUmKrooBpkyeIYsd/fXCdM6wq/wljJeX0X/9vYyoGWE5U97Psspo37RL7c5IFTd+3BK5/OPLqHh5WMCez79cyolNiRN4RxGOJoAmzXrvSdlOvOfiTdUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(2906002)(4744005)(38350700002)(8936002)(38100700002)(86362001)(83380400001)(4326008)(66476007)(36756003)(5660300002)(52116002)(66946007)(2616005)(1076003)(186003)(41300700001)(66556008)(6506007)(6512007)(316002)(9686003)(8676002)(478600001)(6486002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?23lGaPTtL8Jaj6VtTHpPIfkr9+3Yt/iwBQ4JLS2gLXQCb1gHLEbmXwjQ6o5K?=
 =?us-ascii?Q?Eqtj0aLIDe20uM/4U4KMjxDMGjnZvDoPjy6p3z0XFqxuJIbbolooai6fc5lB?=
 =?us-ascii?Q?Ed0pwGUaa9jdMY/Bwc6bQOvSYJNfZUXgtQ097eURi2KqOX201FiVaA31yLmK?=
 =?us-ascii?Q?qKuDry0GrqHX+yJeipb9OnkqR/VRFgLceZnXbC+8WjHEUh4Wx4tkTMJOxop/?=
 =?us-ascii?Q?2YCc/3GrMc8yUZzxa/PQsiO984EpKXh5AkUU0mMCPzxmqIlhXMwH48k15RmB?=
 =?us-ascii?Q?7gS6PrIYaduevHngvtU2wlvwLhCViB76Bj2f1SrajdtAlc61baYlrHkgyvf0?=
 =?us-ascii?Q?ARqgqtF/Gya+/QLN5j4UyCXP4ZMB7f+4tumg7mhqSK7oHwZb8TlUzh+Z8Cad?=
 =?us-ascii?Q?v1TSUIrPMRTdTgR1eLHNVaq+IEK2fMA6YJTN/Qhl0YHRjemA+Xdmb50eab2B?=
 =?us-ascii?Q?ggUeCarvn2vVLUVVMc4D4coy+7+FYdibiFIazdVrWWtvq/Ae9NaWokYtdsrR?=
 =?us-ascii?Q?kY3qXCOJgChTI0Ztwr0cYT5l5/gxOp3AmMAUz5AWfvk+7ZqmaIOPoVAvgHvD?=
 =?us-ascii?Q?jNtbch0ofdj4CXZ20bmJ6sbZo8Av8tFH7XiMchWclE0FDmk3LMePWpm4zKd4?=
 =?us-ascii?Q?ZOTwOtytPuRLhYPKjvHsJbm8Fl3a+HP9BmQ18QIdN7vkaUIhqAvErX5POr9g?=
 =?us-ascii?Q?IEjwfTdKch7vdtP+6AiP06debH6j33oALeUzFloDwWH07/YK0q/hNo+IOkwS?=
 =?us-ascii?Q?fvs7/yt5ePzj4mX0K1aoX55L7kXCtwLduk+8EkUNjS5egQl9JTCdUJpfFlj0?=
 =?us-ascii?Q?ehgnpPdhmERWU3vPH0cqZmBBXaw6LogwFV693vl8snmlOw6d18MB20zr0dPD?=
 =?us-ascii?Q?95uWsKhOaIROLeJqE2/szl3JIWcxzMqxI1dvPRJ/uN6VzdAm2jge+C3WOHgH?=
 =?us-ascii?Q?6l0+dXsPKUGv0zVm2CeVVIrxyZe3AbxC0X7/NIajmahOTqOYAJTxAihVfwah?=
 =?us-ascii?Q?8+kCR9oIaE1kVhItpox5vOOJ8s+HGZQ49ymZI/NuDBcXj+RnxhgF6QCfpJ0M?=
 =?us-ascii?Q?RXd8lOCMDp8fSyDdmhWg1h6/5VuKIw2U7orulOr6ty7yy4hkRQQKT5YD6xlR?=
 =?us-ascii?Q?EvxP6Vl0+iAbcY4mV4YV8PlV3M8aLooOobIi7nMnZFer5jq7L1K4prssKgX2?=
 =?us-ascii?Q?MlM9dLcvX876OYi05Me2PwBmuReaUXc531e4GYt5gXZCilAr9ybQBsEPD9Ry?=
 =?us-ascii?Q?qyiC/NI1rb+Ffzw5fKHNQn4KheplE4MPRJbE7wEZUT1l8PljC630+iT2eb8B?=
 =?us-ascii?Q?6BHF9b2HkzDcM19dPwnw+KIM4pUJxO36uaXgTfSNrPi1eOQwREmqmnPFqxzl?=
 =?us-ascii?Q?6bTv19pStxbSewFxjBFKgdguBfCpX9Pdmf3StILJoIySFcqvqNDGceMsOdQW?=
 =?us-ascii?Q?bdhlzlwTcwPMHD6kmWcAoYLgKPELMnoZXurX+iAQ6uqlBOyVzss/e9EKFuLR?=
 =?us-ascii?Q?qOJ17i7pkpmPi2/EuJ3UREm78ydKOwLOecOds0FnVn/r+0hF0Y4Wc7ZONd3I?=
 =?us-ascii?Q?/dywrsCd0tDPgQHsbgwNMbvcw4xUSmkDJ4jVL+Ci?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22635fbf-ee20-447a-ebf3-08dad9ba1300
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 07:50:43.6224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NSApOZ6lGax/UFWDAy7KHISERUqSpZgazc4TTSXTc3/ZGeoQgSeYn/GLAsdWdasjveKFnNVTqlFFwa9S9UfEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9099
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

The current code logic make the condition "else if (reg >= 0x54)"
can't be true, cause the dead code. So fix it to match the coder
expectation. This is reported by Coverity.

Fixes: 13c5d4ce8060 ("gpio: pca953x: Add support for PCAL6534")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index c3dd5ceab421..2a12c6673482 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -309,7 +309,7 @@ static bool pcal6534_check_register(struct pca953x_chip *chip, unsigned int reg,
 	int bank;
 	int offset;
 
-	if (reg >= 0x30) {
+	if (reg >= 0x30 && reg < 0x54) {
 		/*
 		 * Reserved block between 14h and 2Fh does not align on
 		 * expected bank boundaries like other devices.
-- 
2.34.1


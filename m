Return-Path: <linux-gpio+bounces-24230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C334EB2206C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 10:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56254188DE9F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 08:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6158241690;
	Tue, 12 Aug 2025 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="GZqTEFDq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012058.outbound.protection.outlook.com [40.107.75.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE42DCF5F;
	Tue, 12 Aug 2025 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986380; cv=fail; b=gb0QPTt+0EQK5V1rus19RvNhpSbJgnyYJ3f/sOb+yU88RKRd6+oxtIhuFaqfVTviWhkYzKJJdDwYv3FoWYd8woVNQ1TyeKHpz6APh93+JXBGF29vkd+Wa+nTDtC/nbV0+6NXUkAHyDjYKKf7pCGSNEyNTRg2foleLtThYzA40rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986380; c=relaxed/simple;
	bh=2IBSVLLvj5T1/BvsmTh35DKcc02Us/WGQ3UOXKBPEyE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=plpYQytmv+7RBCAWhu1Y5UArjPzgd7R/4WXnciudaeaEsAQitg1nlRNL0v7DAeIqLT0uUJLsN7TYk5/9rSGLleSAyF3gN8zWTYFPN2DxoIeMRbIEH3f0W+8HhqxqjTgrSqxVEQodtMXWDP2noM6Is3kfWWbOWVb002dpMD3EWc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=GZqTEFDq; arc=fail smtp.client-ip=40.107.75.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAnXXcX1Akk0SZMOXDIFweSLpaMQCtv3F87WRdahmu8nCbxGxH/sB42joC/X1iaNzXGd6Ar4QgsE3+qlP8eXstPCXpwBiwkPpL8jdsx4vHWXFL9atUJp2P9Wcz7QTGuWaLFlh6/0xoF/OHZj62XtncTt0+6cnbK+32E/XPh0r2A2A9qEwcWF8psq7BClgJ6/XU/NXmXFonDKy3ulyAZkK74hAyv8XILvB2ZM2VaYv3/6zj3yyE9gTT0RFpD7soS/OMQBx4vrtVtIIgkgqZpY5wH+x2UuizdmWMMGdi6+azp1HezoXweV1Y9CrbYKBQY8N3ALHY6cfcE7RAVoWBGzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULFAaisMliRXrWym4/ZTtI98Fev228IqDtAowc/M5Y8=;
 b=cg8taKEeQbjopTGybbvItl6vGpNppkxjnjXysXlcGcv5wxDmoQzaRO1GBdbm+kU7uRkdoyUeuqjNF40NrKct4g0tuXRLQHP3NoMvxlJ7/FHr2FcA7eC1zW4OycO5ZwreN3WTXFQ1Lq/1wxnFuWckX64YvCrqdlwi+CWsSLTZb4YdE4tyESIdqEQQ2RsgMZ89KzZwmFobHfzVNCWMjHx8qkgsp1EU/nKqnwi5s0gIMj+nTU/fzPbu+khvAnuiM3XG6gJ7YjxsYRuqeVFLvAVVH9YSa4JlaE7s//ro/1tF/m8ZbNmJ+QAjU4vE5xbWmlStXOxRgcUZza41OPdWs26Wwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULFAaisMliRXrWym4/ZTtI98Fev228IqDtAowc/M5Y8=;
 b=GZqTEFDq75AA3yZRvuPNFLeHbICKlu6Fyx163qliucMX4w+2nZ/rQe7lYXFVRfrhixZsWLovC9Mba6RnhCsujLlsNJ+qU358W9J6uOftQj3Zrg8mQNI3GiBoJI9CVY3D9nk+gSNJtPh7cPJTxuF+cwyrqleeZ+analIvMDen4qYZWCqguiNuv//0RgVJ7p+HPYnXx1XoAloyApziCtDfVYi/qtzvOThMeZRCiqwF3x86zzWzhBzNjEiKqFe+VDg7en1VgKgsZPWqUHhwdOqaLD4nEXWe3SQcmznnC//4RKxCXUlaoHd9HfDFhEYvk3Mem88voQ7Qw/pkl21r6xlLzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by PS1PPF31BDA4522.apcprd06.prod.outlook.com (2603:1096:308::249) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 12 Aug
 2025 08:12:52 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 08:12:52 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] pinctrl: bcm: use PTR_ERR_OR_ZERO() to simplify code
Date: Tue, 12 Aug 2025 16:12:43 +0800
Message-Id: <20250812081243.22659-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|PS1PPF31BDA4522:EE_
X-MS-Office365-Filtering-Correlation-Id: b303930b-50d5-499a-6268-08ddd97808df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qSaVK3KFDaKxOUS/4V3h0yC+RadDqs8tCqHL3wPE6qKOAhVKDs5QRStDG53i?=
 =?us-ascii?Q?NFjtArs150pQs0F2YNLxRWKStSxWzW5JSTEhNUt5ky09ta6vwE7GkoWfhCGX?=
 =?us-ascii?Q?2V1upeYE2AJlssLvo6sQ56VhcEiiJM3lQp33tRa2xv/1ykFnCoCBhB/Lib7u?=
 =?us-ascii?Q?fxFzU+/jxWALf/jubMn52KDcf7mDsJWHurnnMHnWW9qqJj78volbxkyYwpd5?=
 =?us-ascii?Q?qxtHfDWbGjT6K55GoCAFd2+nNmJ32c36pR9PlER54xHAAzfVluFo7qyvW/Eh?=
 =?us-ascii?Q?u5iA1BRCTY+tHvqkKJCRYBVAiG5diizDlAtD79vM1nRxWkncA6C13ggrXJTn?=
 =?us-ascii?Q?jkx9Sym9uwsDtM5esnzEq81oGA5b95NcoZ0MYn8H2A6aGThTm/9x72P9W7X/?=
 =?us-ascii?Q?j7u7h3dz72u/CKXtHCnHfQOsDKm0FYmgiRucpCrnas5JiyRrqb5DiNNIiMhL?=
 =?us-ascii?Q?B1PtJs1ClQB5CuoaM4aXtyFfpF9PjMrb9dC3LsT45108nJ7zYME3XBa/rKo2?=
 =?us-ascii?Q?/WFszLt4CZubNFR95JzuPgavEv4eHDzCKRORAyRYVEat4Trqap70+p3w/jXx?=
 =?us-ascii?Q?k3eRmcDcjS48IaFfvHebZDKxsLT+svYPf4rAC2UsAPfmtUuigzzvk1I9Qjcx?=
 =?us-ascii?Q?st9yF6zzW50U+0j8Oyfqxr1BoARsMdY3PvnMe/1IgwK322E2IS9X6D0u0Xqs?=
 =?us-ascii?Q?XLDo04Ahwk42GfhkUTkDVBEoil6ZpRrbS9xTm9eMsaHQJHOdvX83C01N/txj?=
 =?us-ascii?Q?UPSy4ZKy5zJ6oBFuZZ5lKoFXuPRQZXpUbz6P5UE6IsksHCC4iMa9T/Oy6SaL?=
 =?us-ascii?Q?Efg+JG9OC/3pMbDhmDiB87eYGYtbo3pJQp+huLqLWKT1EQC0DywRH8fmwosa?=
 =?us-ascii?Q?g0vbxRczrhftkk8M38LOyaT9YNBVW9A/SpW8dBgl32uooy0qr0AN3AidD3Pt?=
 =?us-ascii?Q?YikLMcefoF9oMq/f+3o5g8CZh9rMrYGZ/1OI6dJkrFPOUIUosbk38vEip3VK?=
 =?us-ascii?Q?5xihXg6yIoJ9ApbUZmzrdOjXLNuKZv5TIm4vScSDg2sB/4ZP2mbYJXq5x+g1?=
 =?us-ascii?Q?nU071SgE2ocfq52+S+0x5SesKVOD3HZhorZ0/LU0SVdGe1OSDuAgqMhwUVzo?=
 =?us-ascii?Q?Xd1AqKRoi6yjeI970rlRRZN1Jw1YevK4PUc5n+5z7XD4UO23LNZUItovsU3R?=
 =?us-ascii?Q?dq+0nv+zAKiwvCl+bbREKUAtHOGMLLotiAxYr6qLab68dnD7muIEgQ9MXm7z?=
 =?us-ascii?Q?nXI9IiNU7zeNgLypoNM7tmowl9J996V9tfVCDR7krt4fqDpAtMnG6fCgGQb+?=
 =?us-ascii?Q?M44gx6FwJMmRQ+vKdGudZJ/iwpzpxKSubQfHUMdk9VGuqrtvlCl9YnIwoCsU?=
 =?us-ascii?Q?5hVqOT/BxukqrXtV/CHrBiu5KtVs90M4W2pLWEjAm0XCgQZWU7O5QK1Zon3K?=
 =?us-ascii?Q?iBgYe3XDLFmEqeaBESmkWpySgL8bJ5FjfDwzWCGEoOBf5ITbqQiLKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NRgsrmssT5aZZNoqpB+xeW3yC0yiFjobes5VcZ6+hY+ACJj58jOym0BwLh5u?=
 =?us-ascii?Q?9XowIlht/1GgxTr0ZmKs7cQAwyVdFOT0E5DSYWZ/KUBWMK6rj1H9kMfvbyjF?=
 =?us-ascii?Q?UI6w7qeSoCVLz6A/qdoIVrAGWB/VlV6MgidvyuXmUH1nnIyvkKmXacnDQ12f?=
 =?us-ascii?Q?wq/aq0fXWxORtWG/4gdrVFA+johlh6cPSgu9BwK8xlDj6jf7B7bcBQFI+ewQ?=
 =?us-ascii?Q?RFUDSDn14MorxuJscXHY+eGrR0M/6oLjjF7KsNjyG15bVH1lBKfbPyXL090A?=
 =?us-ascii?Q?3GG/0s4CsVB+Tqnpd/gj3Mj2V7vecHMqiHsgQdKQ0PYX3dAQ7RluR7tnO8bo?=
 =?us-ascii?Q?AgvlNkEJyeFXfpQiRM9oG9b0bOq1DQLngE6CdpBq5rpqMfBhZ25TXsJc5Fc/?=
 =?us-ascii?Q?feIi+XuHPh8Z+jNZg2dJ/DzZeLHmxcn8rE3+4BmY7lSDG0V7WwImOt9IGOBl?=
 =?us-ascii?Q?4MHtfqBNcUOyUrzQasV1Q/gDaMNMMjjWgjQ53jT/uUX8VkAmOQQPg/o4v/dn?=
 =?us-ascii?Q?dFrdSRTM5bIBkx5h/tXWkQU1C4TOa4eOrV+2Ubb0L0Bgfb4YoyyWWN14Vlu5?=
 =?us-ascii?Q?2AKg+p0EHaB4s09Ea5ttWx6/c/l3oOpRr+4z0xel1knuCIUxwSv+72xuibhN?=
 =?us-ascii?Q?OhDXQc9LQKV33/K/jABsbfEWFHMSEVgCBL6KSyrS5tQB08k5OCPQgZawT66M?=
 =?us-ascii?Q?dQPi5Yk86dawnaAVgDYBtCCCTY54klYc5lbkkDj08rMe58frOOZXBWTH6sYb?=
 =?us-ascii?Q?IUjRK2Pl5/FPVNonzb4RHbB1LaUAGQbI6NQeB8m/EghKSOzIa4QmuecJhLf7?=
 =?us-ascii?Q?Ma9DytiG6rLz5DJZB3rGWp4tgvfBqEWnL6mFH9Z3DiUUPYB4jufH+KkogSAt?=
 =?us-ascii?Q?MMOhgVq3VSFlY1Nl49amZCf2vX75xoSS/E634wO8AlnpjIc/cjymDRWfdDKQ?=
 =?us-ascii?Q?KV6M9YiOoOWW6qpW5ceVk1gAIeCX4HgpPEf5i7i1ryZLGS01iBgqtB4GvnNr?=
 =?us-ascii?Q?EWYA0rUXV47xOHXYBzpDMkdJt4Kn6peLisNYZ5xgh4GX/ZQWM4RHI84bXq3q?=
 =?us-ascii?Q?DF0tnCmxpUAQJS928yrM/Qro3rvisHqAsOLPaPV4JG6n/f/2hGU6/gc4U4BX?=
 =?us-ascii?Q?uDCT4g4/6hcDgzx0RWDqhpsxz918IOhnNj5b0UTfc3raIXie1kzRGdGpaN8V?=
 =?us-ascii?Q?g1hvRj8xLRSwKb+fDbHGfSPWNqLlTnx5NKP8DgOgLJdJ3gXajtEuz1b9vdWO?=
 =?us-ascii?Q?cXoOSHq2YKqR50M7Ehgm3rv5jkmOpd9S8k3NqM+GHkVu4Y/rz8+lHpZaMdG6?=
 =?us-ascii?Q?URNBLHYd5bZ5MCQ4WBZ7DOvib30gXqpocMsV0dRCEG8fY2RyTNSg3jPYkTZ+?=
 =?us-ascii?Q?RXxYnpGQy+bifLFUSES3A8bKKkeLDxga+TamIT3/D+dgrulc9coKX2jo2kT3?=
 =?us-ascii?Q?3Xg0hBjaj32W+A9uRWobOavQ03XQIinw/apDa8IVjavRAheP87VnIF3Q4J1+?=
 =?us-ascii?Q?J19uFeVaaSi67mECsrYfMU0ch8vLVofq8bXhAUaG4TPM82wqwvZ+r3kFK4VZ?=
 =?us-ascii?Q?sxCg9qlAgVRzaDFRtvouHm82UUKtArWIBJ+tC0eo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b303930b-50d5-499a-6268-08ddd97808df
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:12:52.7391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDOC4tTulhMtPkhaFIc/MkwPUUhQBU0IsahnrcnqseihPZDtgJvcTAE9ea/FCwDvwUAkJj2ClP/3IUgA/uRX9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF31BDA4522

Use the standard error pointer macro to shorten the code and simplify.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm6358.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6358.c b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
index 891de49d76e7..4c8cd65fc31e 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6358.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
@@ -343,10 +343,8 @@ static int bcm6358_pinctrl_probe(struct platform_device *pdev)
 	pc = platform_get_drvdata(pdev);
 
 	priv->overlays = devm_regmap_field_alloc(dev, pc->regs, overlays);
-	if (IS_ERR(priv->overlays))
-		return PTR_ERR(priv->overlays);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(priv->overlays);
 }
 
 static const struct of_device_id bcm6358_pinctrl_match[] = {
-- 
2.34.1



Return-Path: <linux-gpio+bounces-8902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A115959515
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 08:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3B57288158
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 06:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3546185B54;
	Wed, 21 Aug 2024 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="TcZFnE/L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010048.outbound.protection.outlook.com [52.101.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8E185B4C;
	Wed, 21 Aug 2024 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223095; cv=fail; b=mWbqwL2Yr0BLvovyELhGlkQvA5l3n1hRMw6Bp4J6DHHdmXMcuKpLjnqUzN+bkt9ETZm3Dc9f44SU9wViKFomd/K4NG0rn8TRvv79AEHw5GZDmdWMmJzDDRrRgqmUXhp9S8fhnQGLEdnWylsRsWfOpIXYj/LKympmKpK/2Mu0tQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223095; c=relaxed/simple;
	bh=XOfXNvOjclbo+m26KT6rmx52ldTVM9DmYG8YKCJpNUE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UzP6gvo0UQ7YUPxn6fVI3mKPTcFK1dSj2TIs4SttjUv4ymqcEEw//GVbN8t2uC4TBitbmgmNlS6anD5POc7G595nFPrfmEYjdLpfQt0BPRoJ61zbaRVE1uUirN1GkBVd9LCGocEv9AGfK2x1xeNqLEqGqHwUlgq/46WfPOEzmwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=TcZFnE/L; arc=fail smtp.client-ip=52.101.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rG009YtJVutpTu3QdyEGbHn5mxpl6HoxNz1IK5sqnWEM2t0cS5DMsh30iEeaNWRQeb+c1+d0i9juoQO5XRCzCf0NFRaJoZ1prb6fyOJMIj17AZMUIz86DyrOz6beF0Rso/1YpWTvS7QyaNHSkS6HG1JExj52j9tEktP1U6FHPu+hiIQJJrgbXhWG3cPuGBt6nGWcAXqG9H0cIgWtPD9T015nV/Q6o/Fp2GQdnKfpjpcwP+kFblaSZYn4lusZcY6CJ1ztSShU/NQ7XQ4fKTNIIDkkuZTYAftha2tXWHo+7MAe03VtSMTZqWoP5cGHYzZIm6kO/9fsjgi+XQbkPI12YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWBk1/O+EWyelb1Fb98/ybEcS/H+Lw04nqGvJdhA8Uk=;
 b=zPWEDz+RfS1JoxG8q+rSdykKAc/lFSuUpAWuit7IPy+DdYt1ppKx/O0HPvdb7DheT9OEfPNt37yrO0WMkxNa/SwzGJ9Plklfa8WeKG5UKv0mwSqZ10rAsMuxudUaWIc4A6CS3JY5sohV3HatoUDzwzgDo8hM0X60NJTL8w3xC9ISkpSUH/E0AC6XsSGClMMFA8P73BzGnOgsvqkS23yfzE6PXQ3/3HWh9gAPKx4hP7Xc9zuhxobwCNZ+23QlBw21FPDbvU6o5xd6dvFWDQ55LyHEKwlIdg7Y/cmcqwtSPT7c1576FkWBkagAFSLJDQIKmGpYxBLmQwhanuMO2a683A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWBk1/O+EWyelb1Fb98/ybEcS/H+Lw04nqGvJdhA8Uk=;
 b=TcZFnE/LasW/ewtOQ5s4Y30J/IGKVjKRMTfRyB15V8uJgXxlhLaMrQ0cafhARK31ddJ69V/B79g1A0M4Op8Z+e4nGruxn451fq9WAUJZWRcTN3c6hT+/ROlET2Hy4/bDV2NlYeD6KKTV02XzgB9wVtNQ41AmUsSDVseoV8QWiBSDG+s0KHJdc2u6j5SP7haloHAUjUx40sx2c72ziSAst2cLIKDZBaxrpjfo17zeu8vFPH7IfAwE4V5WWMms2rQtq+nL3yocdfQxpW4NK/AlS9UnzbPUQbZqINVXw1chKjEGneZHWVer88D3dEnwMRPliNWyisBIR6bY7yF2jlHjDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TY0PR06MB4984.apcprd06.prod.outlook.com (2603:1096:400:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 06:51:30 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%6]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 06:51:30 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] pinctrl: nomadik: Use kmemdup_array instead of kmemdup for multiple allocation
Date: Wed, 21 Aug 2024 14:49:58 +0800
Message-Id: <20240821064958.4059221-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::20) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TY0PR06MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfc7178-2f19-4cfb-6462-08dcc1adaf91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8R+KChr4A9h46T9NBGMCIJ5erpBXi3OzGm3KEmRrf98SD0m5Rvcj9haw4RzM?=
 =?us-ascii?Q?FcY1ihlEM6EZ82SxX4obxkUuCfH0uDrfSUEMeISQcnhGvvj+g2bGM2Y4wDGi?=
 =?us-ascii?Q?eNF9F9AAo+DtSVNlrIrg8AC3vCuZVEuiNcTALwH99xSeST0H7uo3wz64OOBq?=
 =?us-ascii?Q?DLy1/S2luFjGV4PQt2jTCAUvuZvBZNVM5w9WxwPRLhT9VQwNIGp6iK5InD3r?=
 =?us-ascii?Q?f4SuRi8gpBeIA+gvGM8vRyXQxv/TEdSBmX9JHYqywfiOms+Ti7gEGGU4JqeA?=
 =?us-ascii?Q?ocJLvYgSu83V0wGng4ua/XPgFjR7Ha4c2vUOno7Pmbf65U0LvyyE24QdP/Zc?=
 =?us-ascii?Q?e3MbKMcmDRrhgsw4a/59P1MGL0UZGuIKRuhmJ3mBn3ODuJk63tOZN0caFn2T?=
 =?us-ascii?Q?NrTm/AHouytSYerLchFVuqPWfapZg6Z0YPkEVm2sntePmCduHHWGw9kkmZqW?=
 =?us-ascii?Q?z8fKvFh/hQg6E034DKXmw4eTLiZEtqqvmXDWpxSXKO5+MF28M2gd5wHNZGFC?=
 =?us-ascii?Q?S7Is/3uaDtf5j/8zcXSnxkf33nRFIVOn0nYqDj2mPhq7tVpU/gO2uavOhprT?=
 =?us-ascii?Q?YIIX0qpzwL6gsDY8TsqBcKITNduu5U/mqNWmXMY8Gh69VpIPaehRp4+KkMgS?=
 =?us-ascii?Q?YXNJeUTZJ4NCOf4O5F+WfyK/btd5Mdu6ZNCuW3i3ySM021k6je5rhAjIK1tg?=
 =?us-ascii?Q?FT5zUgABQW8wxUJbtXSd3EXEE/JFXsXZeYE2h3gROqpZkeNTYczKfYmS/iMu?=
 =?us-ascii?Q?p2hRdr38NSBML3KHnX47Rqnk1KW0DLeStLqT2RrqJ8qlETlWfI3r9SjEEnA5?=
 =?us-ascii?Q?54wF5yaPpdh3iPOhqrVcwbgUSu5yhqmbySr+i6FLDaH67XQsAQ9R7i40iJdw?=
 =?us-ascii?Q?KUHYVVJ1qYhIcRabhl2sabXpd6fOIc6q05CfdfnwV/X4EE5WeyuTcSIiBFvO?=
 =?us-ascii?Q?lQAoQ/sVS8oajn6urxEfwBj8RdhoEvNjXfcAy022WuagIyvDr41hPvQ2Rqy2?=
 =?us-ascii?Q?5i3xhtEeo04+VSl+qykS1SCqzXArESCeP6XXn01IR3BUa2o6q5owDO12ZxKV?=
 =?us-ascii?Q?KMyOVpJzH+jAGkRMiDAc2KqgY1tuNVSrUM3AYcNaQP7kFB5jDe+9ohdz+Qwz?=
 =?us-ascii?Q?xJ5zq/fZcuKBdQyQQs0hX970X98cy7rg//bxdlI2fhG2KMUhDzCRcjnS9Xr6?=
 =?us-ascii?Q?nLnfPnDuuJkGTYxkLkRzusis1f5DaDg9fwnDSpNmPgIU/8m3rlVcgsSiFDaU?=
 =?us-ascii?Q?D6S0TaVpQRJYTXPWNk7jXF91l7k6aqXhM1cqG7bPjhY/HhWCa+S/9ss1F0j6?=
 =?us-ascii?Q?KAi4p1YYc42/5vZ06xltf40ZE8ilzUeC8zCN+cJNO2g5LvrqG2S/psGpu+g8?=
 =?us-ascii?Q?LnmwPLuGInERsYY5lzfjr4lICZQ8SSzVLVdS3Whcz3lBem2Y3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cYGXDBdyT6sxlXjyp51CNS5xGTjH1TNxRzuo9WJFlVnCGLnq/vSmVz3mHajB?=
 =?us-ascii?Q?2dNZkjZLGePbraofXtRpXMxzKCNOw8pwZNOct68Uk+25ACHnRvC78JlnXmeY?=
 =?us-ascii?Q?msaDdNkl6ATjKu7U/O/5zkLGBNMoCVloXYGKPZR0W4L+VkOJjv4+D4ou0EMi?=
 =?us-ascii?Q?XSOq6JgH+TTD34vT2YXf4ncgGP+nxWAIvrk60do9kZ/mWuS2OcJYDeGZC2gD?=
 =?us-ascii?Q?r0z85eaPxHCF289BDoAv1mezc86B8v7Tjc2C3e5HXBNMSJmOrkYjjy0Ik0/A?=
 =?us-ascii?Q?SLTsE24DMpxa/H/ZuxLVFJLlJhArEVRoWQxngdi9zrKLbVjvmJcSVpkdwl0Y?=
 =?us-ascii?Q?IupR8SaqaGMy6JTFXB20vABHV7R8XOm60zj+4m9+fiNLj48xxH0uaUC0rPAv?=
 =?us-ascii?Q?D9savWgXp/UsdXmbhk+cpQlnFTI11lCb557rWmXWk0ncau+VaJRsrJ9ou7lk?=
 =?us-ascii?Q?BXzzFB8JtT+2RSTLgFtrqpYvnvZtrtuv3lp+XZ6k1324QE+Ic7WeoYR/qkaG?=
 =?us-ascii?Q?0KO2OFQ6EVDYJtmj4PmlTzu9kN97ZjElxDq7W+wBoEBT6GNn34XYwK2QZRfE?=
 =?us-ascii?Q?x++0rYffAyjC4P4RcFV9/6ijpJQUMJxgTr8rCseenF1ONIwLVivNoZPrjwDH?=
 =?us-ascii?Q?7JWrT4vDLD2Zf0aT3uomrevlB+TjCNBemX5rF0taC3cMcKJufsOg7/Q+7EAS?=
 =?us-ascii?Q?XaPNfsZ2QvaroolVKkRJX1OT93qz4s818q/Jp0P+DxGom5HjqXdV+P5/u2iQ?=
 =?us-ascii?Q?3E0xE+IfW7Am38PqFzADiqKPA/O5NC6spdwYr300oBMCFF/n6oD2yo90d1nE?=
 =?us-ascii?Q?5b2AczTQd3iYNsSCU4N6EIdyzSXMl3r6fSWXGF+hNnk4UPoKvEzQ8uXZtDoO?=
 =?us-ascii?Q?yS5/fjowOqX4HJb0AGlKVxT1tedw6cfqBPDnRfI9eiXEOY1mvOmmyNTFVSG3?=
 =?us-ascii?Q?IfOzbLeqafUa0K9U092UkpdH8FIY0JtrLLhP6uVi7vObn08VyZ21V3Djxbqo?=
 =?us-ascii?Q?elSs8GS9UsivkfJJJXaFHZYIG2c3rX+3z6iFvxlqqp2n5SHsQefwaHXf/n7P?=
 =?us-ascii?Q?VRvXL8p41VItQNAuAUxrXWgeh4PvQgT5KszVKAFhCCCnavzAJKdGiAMtZ4Uz?=
 =?us-ascii?Q?eM9QZa4MtMzOLDGVcUVXMfnnyIa2fAXrU38JPYnyYsXXb7fGjpjiRuyGSl9s?=
 =?us-ascii?Q?2nE6ba1svQ6mIuIIaryozVKz+WDSif3i3VF1VeLrkvRoDJqBs8CYmBzdrMpd?=
 =?us-ascii?Q?Fl7WRJ0TCanxI5e2O0JkFLWuKsGnQebogIA2SSpudyzkQ9oOrcwI77lay/wC?=
 =?us-ascii?Q?EeY4cDbsG5IZFXGxs0rTyGmDQUwlVMcW6eGoUZiuciVpg6AjPEzAmicdzcUY?=
 =?us-ascii?Q?E/rYmlhHT8aq0NQHdzBzrJhdXpnIBO3Cp/LAU948IjJf1mRceFfYuT2ayeLJ?=
 =?us-ascii?Q?3OledcFjl/UscpdGqpLhC9jSKH4pAATU3pmKKdt0CRz+OKcoE1qwXUM2YQvA?=
 =?us-ascii?Q?TQTQBJ/u6Y5g14D7iJ8FeGAJbhnzt2tGUEcOqJ5J1XNRapL9x717zHfvp9vy?=
 =?us-ascii?Q?bJRuAq2kkawomf7v27xRqysWDCsSEdBJYWUEfVqY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfc7178-2f19-4cfb-6462-08dcc1adaf91
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 06:51:30.0323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CeKcu3BSJu4Zose7q6eLKmhfPmm7ppfDF0u7e+2z5EjaoxtEu7EoymPiVdumibVChMUpt+I3FNubs29Yrw8pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4984

Let the kememdup_array() take care about multiplication and possible
overflows.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c  | 4 ++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 47f62c89955a..586ed303916e 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -716,8 +716,8 @@ static int abx500_dt_add_map_configs(struct pinctrl_map **map,
 	if (*num_maps == *reserved_maps)
 		return -ENOSPC;
 
-	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
-			      GFP_KERNEL);
+	dup_configs = kmemdup_array(configs, num_configs, sizeof(*dup_configs),
+				    GFP_KERNEL);
 	if (!dup_configs)
 		return -ENOMEM;
 
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index fa78d5ecc685..800eba550cfd 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -601,8 +601,8 @@ static int nmk_dt_add_map_configs(struct pinctrl_map **map,
 	if (*num_maps == *reserved_maps)
 		return -ENOSPC;
 
-	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
-			      GFP_KERNEL);
+	dup_configs = kmemdup_array(configs, num_configs, sizeof(*dup_configs),
+				    GFP_KERNEL);
 	if (!dup_configs)
 		return -ENOMEM;
 
-- 
2.34.1



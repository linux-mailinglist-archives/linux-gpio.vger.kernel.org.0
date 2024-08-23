Return-Path: <linux-gpio+bounces-9047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F7095CB15
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 12:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B105284AE8
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 10:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69976187337;
	Fri, 23 Aug 2024 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QsIXcZv5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2041.outbound.protection.outlook.com [40.107.117.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103791862B2;
	Fri, 23 Aug 2024 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724410511; cv=fail; b=X07I+elVIF6N78cqZlM0o2fnV7iFJYctFChJAS7PqYdT4SiHjlkvFlNqOlV8nmL9mVfGqO/TlRLMDFdEth5wP4F7wrqumLWaoQC0nzDt4EfnZ7jP+sHkJQKnJhX9gq2cezUSeT+57oj7gYz4qy/5DMxL50HxsXTqmldZbzsNre0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724410511; c=relaxed/simple;
	bh=MsYaZ5fmkkxh+h4675Zeu1py/2TmqPQezVzHrQKGXs8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qXPxbqvnU0J4p6sS9FdYy3vS0QVX0Yc4rgYMmjs/Gm7yYolP5BhUhjshl37SsJYMdyqNMgS2cWC6wW6lqPwlpBWJ4wxiFHgBqinlEHR0+0xoalt5JgduPv5i+V5FD1bxKUZrATQxjkkI9MnIaQuMk/jK5zgSZJiiCU76JEG5IvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QsIXcZv5; arc=fail smtp.client-ip=40.107.117.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZoiz+q5QcB085LIFC3rwSPjILCfcMO01DoO0U9bhNQPXkwEQzKRfRgZKUqUDrkmYfxECZCPPhDoYmKuzzb1C4Z60N5QLQYtvXAyjZkmwF0RIKlzCbmNs87fjMrqNqmpOzhfmrQzV5z02L0bF/h5NASjaV5CeSc7CnIJqiAA8gsPEVRr2MHKBiB5+Syv/fa3Y+BgPpyco0//dLw6Ajt0tntrMUl0LZqXmfyjx9UmX0kXv1DahnaqVqXzGqfWnuzpTxOm2LMBUX5dbD7alTPME7l4s6xRBZNy9F9AlIuVuWxEoKN7kK1DIiPcfoFTv1yYO3eYpEcLcoa70ojl+24OGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiGFwbDZfuwpSJhsyxvqIwSiUpBdjrwy6gk/YICbLPk=;
 b=cIObwxT6eerQ8tF3pTo6ZYiCKtFpBMU/qx75K2OLSpn8M/nl5XnmlZumnVbcVxfkdBHJZztW7usHqDtHoLMxsg845e7fDiFziKSH4nAQMSz5CkmuAQ9H1X4HO3h5TR0oiICDbzpxhLqpnm90SFP58CQAKgL6+lJQY+XDh/MFjtwa4Z3VPV5HaLLW9q740rYWjCpH0AMS6vdhnFn3OGzl/SkkbfSH0I9g/ecVjA/PTy0oM1NreEhQ4oO4DjfIzIiY+mPIhCv2JqFPPw1s928RlEdEWJq8oTgQN6gftZxe+xyvUUy25/Pf8nGnuk5Lymiv8Hg+waQ/xPYJd24inIYgkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiGFwbDZfuwpSJhsyxvqIwSiUpBdjrwy6gk/YICbLPk=;
 b=QsIXcZv5whWByzPNKyPxWr0AGiTwnsii+eN5M40jdSl7zHQdYrSBanoHiEGK8iMm6nnhM7vTnv/pHos3tzz7yT8yNdQMJJOWVu8mJV+K+Or0l1DWrN5ru88F/i4lIo3yPBouS7eIFr1JHiL6oTXRFaqBeqQoYHzSzA4TNb82PePh8OnvCNvlNVTCfbMAekL+6a+kv5olZVzFdb0thqO2k4JpMtpNfQ52ciMQxunJU1NXvOUKypgZpwNnEOU2yUe9w3JRmmMj0EHcoHbm8coD3PJV86Jife3XB+/UQK0CJiL16wAcqno6ifi9obJEqyNmiT9/vlzOCxNqRRa6500mvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by TYZPR06MB5685.apcprd06.prod.outlook.com (2603:1096:400:283::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 10:55:06 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 10:55:05 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: aisheng.dong@nxp.com,
	festevam@gmail.com,
	shawnguo@kernel.org,
	ping.bai@nxp.com,
	linus.walleij@linaro.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	opensource.kerenl@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v2] pinctrl: freescale: imx-scmi: Use kmemdup_array instead of kmemdup for multiple allocation
Date: Fri, 23 Aug 2024 18:54:21 +0800
Message-Id: <20240823105421.50017-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|TYZPR06MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: 091223b5-41c3-433d-7114-08dcc3620bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gUATSa9xDXe1Sc/hXcg6xNFrhJkSV2nQp0C8ePo/6eAOjWmuIwyUFVMoYP0B?=
 =?us-ascii?Q?FkfG5krUas0Hr9rOXUeN2Rl3F6vDMAlWCA0eSRXxDj6FRsO62UDEh5kTkcmg?=
 =?us-ascii?Q?FGpr5NXVIEbVRaQ9W1V0DZ7TvnwPQB7CQnPS36RzG+vRrxq2i2BIYLspPuMK?=
 =?us-ascii?Q?IauXEZSHGWPccj8aTMz4CPPLfFd1Q15mAAbzHriAlTe9WFtwHOLIpzmW3EZs?=
 =?us-ascii?Q?7wQ+Ub5Lc52rvKu44cJQH2h6YPZ3ggE/Iryun+Ff/zikXyaCxzpjV9OdN5OL?=
 =?us-ascii?Q?drfs/a2ol2TfkmjWYr84nWdnV8AN3SEMr9c5qj+aGqrVY1l/mAySsOH0PMIU?=
 =?us-ascii?Q?Dj802AqaER12fRZdXDq+FZuOZlPQ1ysjzLKqRAaPxWhqpGnoVThbMKIqvoEu?=
 =?us-ascii?Q?a6nzCUwxpu3hgqaCj7ZCFThPyl0YmBqlexW/+0dZeJHTDy3+3+riA2uR/VMz?=
 =?us-ascii?Q?L5ppgNXRf+L/MJ2oLv1y8lXXloNpDKC3nWndAjGhp1dIuWo9BKPsCYwCsD1X?=
 =?us-ascii?Q?/T2uvXc0UMuPvP5g4+DGJ1am+XuzZJ9hdghWZzkxhBBgGCGk/fDVUezFgHir?=
 =?us-ascii?Q?dExynTlYGA/+ZdHg4Sa27Jdq22CHJW6UyApfgtWNhhTKIrX6IttG1sU1sVLI?=
 =?us-ascii?Q?EVdWV4CVrKtNNOK2RtGqV4BwiXYk4nWCsBZQoZA7a0/Ln2D1WdJSrFbIqRpN?=
 =?us-ascii?Q?FWs+JQsFZ4L1nujWmubVxoVYa6HNnX797Yjy/GWCivNdxu+7YIgSTNMHhdh5?=
 =?us-ascii?Q?+Bny4/MkOCgvrz+zWgKKDEf30Fmtk6Zhs5YwRoYJO+UWrHHNeED8JgUAp3x/?=
 =?us-ascii?Q?OmQZAoiAAZH+dpThbmxT7h2a3hxMJvmc6mfIPSxalGrMAvcidnXIxB4bd8Go?=
 =?us-ascii?Q?5vD+mSJTRErzukZ+b3ziNQNB1XiRxaPQ1yw14aQUKu4xHnN1jX+Kv5jOZadA?=
 =?us-ascii?Q?PjUaxu1O79BC3rhHyjYnQhbnTsaWN0PLo+jkBlmcJzkK2F5dAXkTH8WvgYRr?=
 =?us-ascii?Q?k0XX2fdpzISVC3piDTxIQ00kMM32OMfBOJ8M2/MJQJKbmbNvzCdhbHJHm8JE?=
 =?us-ascii?Q?8o+0M8/vfoMTfGqyJDq+AdiYZm5BoCgV1itIMpfIQIas9Cy9iMvNJtNx7FOM?=
 =?us-ascii?Q?Obk2jAImONwZXB5CvFrPquBK3uCrfV7sSswguTmLy3AfFuiaC+fU+7RQ5/kB?=
 =?us-ascii?Q?YP352KZkpoWUc+mSFaOiKm5oT26sMtNmveWk6EOOVZwj/y3G/YWnBMygK3w9?=
 =?us-ascii?Q?nff+iwyvAAX2Dk3Zkezw40eecNmmNbIAlkngf5m0bbRP417Ilzmm6/Ob98Nd?=
 =?us-ascii?Q?Yz2lgGJwNwZ9+QoshEwxB026GJ8WwuW3eAeKxBX8lH52hfkLb2z5pEz5ZOxS?=
 =?us-ascii?Q?r3EIsUN3ylfGq7CTI8V6DYJDZDLnb08J0pEl9TZoaq4wRw5oJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mOIAGj3msE0zsp5ljMmtz+Q4S2R4VuNPlGcom5Oy6mFLaX4TGOPzAJZ8MGw9?=
 =?us-ascii?Q?tAs2CrD9OOW9Ur/E8J7rYysRlUErsFnTI/nsJdbMPoK3jkW/yEnN6SDBpluq?=
 =?us-ascii?Q?R/URbuAhD5V93CrxFSKMDvS/A4JZGspx8aQd6VuAPSA71ycxmaCN93rxvr0p?=
 =?us-ascii?Q?gLlStF1DOpFXv7vFRSebAIAcDonuGy52CBga2dCcYs/0SPgp50N/sdumKUz6?=
 =?us-ascii?Q?WTl/qdUTuAKfm0soOw/ufKqIrVZMcdm3QYqd5ZN/dTU2KJIFxwjkoClRCXvB?=
 =?us-ascii?Q?mkanSdx2we2nVt6YhpNx/0OtAWNrBB1m5SoRfjx1J/yIvd/64w/OAT1j0qOD?=
 =?us-ascii?Q?IYCZHZif+qfU9F63EeXpSxHK0GNBz2CEW7R3echPA1WH1BeGAz7BrCVCyWd/?=
 =?us-ascii?Q?Ko8JyiPTFyoORNeM9d4H7rMs/fY1BuPLygs7RE6856hms/HD/yj7ppL4aVVR?=
 =?us-ascii?Q?0gBJCNGCPIs+D/ucEnksnuyn9qJvujpWrw7Tfpo+B6rl6EP43SZFhfsaE+Tr?=
 =?us-ascii?Q?HhlGiqjC/Rz84k/pGTlFUOKWU4B5XqYF6hg0OkbvDtyTtTDRusUf0QyPrYac?=
 =?us-ascii?Q?glKs79uma6QMKUKj6zeZf+jRZQadu7Ne1OWbkgFodPXllJ3E9EQFmnigbL1L?=
 =?us-ascii?Q?IuAD3qk6eWlOQrKxjBMPPKxznzVMSnfW6CUT6NdJN91hmuHbiDhQBwa56dGJ?=
 =?us-ascii?Q?ffAP2ChKtBPMG6tijjVKtG+qONyox7PcD6UbNkDzAJkXK493rBpq6jzyrlXK?=
 =?us-ascii?Q?E6lD30v9SBE6Mtpoxx2LH9B4an4+lpG6hKzS8utk1UQLnSMx2kn0FmTPHZLM?=
 =?us-ascii?Q?HRUsmISDRMzMendNwEG3RDdjXAHpm8GDweZsONl5OhmeQxIIwi318r0+eh8o?=
 =?us-ascii?Q?skFsADIYqbH6YmI+PrAygFIFpkBhFXanBA+/WeLuoRQyZP3Qeh9Ovk4GFwaD?=
 =?us-ascii?Q?/cMLLlAEjUNL5z/eSbfk3/HcGzYS+3McLrFBlXHyEQRMzJepB9/ziH+DCWFc?=
 =?us-ascii?Q?aYC8Xz1vXV/2XYWZ89CSyupkWf27qtep1aGFA2S+DO3FtUMXDbuEpDlq88br?=
 =?us-ascii?Q?yqYsGzrwAm7DCJRonUk3QXmYtyJYwNS/EmmbVcew9ez8swklaqUMJUPkNa5r?=
 =?us-ascii?Q?VadfVpksHBlYGIu4UhDq/vV9i17VfbDWKIPMbUQn280DDwHAEdvYYxZZ4rJi?=
 =?us-ascii?Q?l/8fPSAxBa6SzJiOAIxMXcyb/WLvoiE/t8rLaVYkqk7eZq3gRlzfqfDkel3G?=
 =?us-ascii?Q?TvWvNt4HcsIec6pRgc3JS4JI59CS+yF0PCvd9eOqi2vW/Oyf7qsj94I/c6nn?=
 =?us-ascii?Q?GvEmqWj7WIdxwwcYBL1Ywpr5EQS+8HNoBIoW7w8q7wT26Zv7iX70xddmI1KS?=
 =?us-ascii?Q?szEE6vIX99vN2KZwW0VPD2fNAOhoZwUf0GTHkaBMpNumJ2LmptR2pNMwseRo?=
 =?us-ascii?Q?2f7Btct1h2W4CI9LOQyI0SYbbhFQyu0rGbGmsGXV0/obyDVlTU2SJaPjXlcE?=
 =?us-ascii?Q?SLsJoxJF27HxAKrCgGnofdqNzx/U58gSKPycvUf2ix3kPT7alrCm9JaRvJrY?=
 =?us-ascii?Q?kMyn2m0q0GiH96niQV2gvud8bjVS2Jhi8wGBUx8i?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091223b5-41c3-433d-7114-08dcc3620bcb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 10:55:05.4206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maIAheEOpduQQfnuTvgsJp/36abHf/1pXP7z+RSX/CiaP49Dxt9oVL4zJQRaaw9pxPjSWcHCW27nx1r/7LIiQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5685

Let the kmemdup_array() take care about multiplication
and possible overflows.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
V1->V2: Change subject prefix to "pinctrl: freescale: imx-scmi:"
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 2991047535bc..8f15c4c4dc44 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -130,7 +130,7 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 			cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_CFG, input_val);
 		}
 
-		configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
+		configs = kmemdup_array(cfg, ncfg, sizeof(unsigned long), GFP_KERNEL);
 
 		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
 		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, pin_id);
-- 
2.17.1



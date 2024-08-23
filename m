Return-Path: <linux-gpio+bounces-9016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134C95C2EC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 03:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 094D5B245D0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 01:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA4A18026;
	Fri, 23 Aug 2024 01:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="e/SL3RxB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2057.outbound.protection.outlook.com [40.107.255.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE0B66F;
	Fri, 23 Aug 2024 01:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724377299; cv=fail; b=pQQ/pFQMe06AndtejuZsr5plIiPXkYOAHN5PVYw3tkMeLRt0YVaT6NA0QpAa0r/p5pZKmKzOdXAF2lgxo++ucss2aMgO6aoTGv7eVjUn5pbk5MgS/Tq0xJHR4+55VsJ5GvurwtdBF7xee1RXDgCSWa0TCjdWWl4lTBL45djcRzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724377299; c=relaxed/simple;
	bh=hJX8137NoEFqWhbz1YAuVyotRLRPE616J3aXgTMe9jY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jNUERgVBN1y0RNmrmpfqtkIlIZ10uMsKCBHrcOKjiDABTUhZ7ilb3SE9koKBFNvwqAQ6oPrMHGmU8CnL1fRb0Fzoq4GbkEkBSshwGJzNGizeAcuNqAumM78950X7LYh3FdZ+BqPZK+LLCzhvpBYIqAxhfSu5gvibXPBxAo+C/Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=e/SL3RxB; arc=fail smtp.client-ip=40.107.255.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiSeh9idAFBe29tfKcRquiVc+O3Q2SsInI6avtZxas7DwGYBSU9iX9Wq76epDg+0VjQ6PCb+2tuxT3/rLvDrXnUkpxyBNMdrJa4yC8PI0kZLCnASdF5WyV6iZLZPnx0A880joASPH4jl7hgGN5M8mdtN+FQFfF323CTREbIjDzB4SbZeDgD0nrNrAg0dUNH2bsC+YXShj8t7RYtpLmicBZLEJpEVUGx/VHra0wuFLQzsGK3Mt3p3F4HxYGVNtQQ63awk3ihyaykhid/nebz7P8xhT5+Ssi4Vnqj9WJ/63rwHYYFYI/TBYk062CtjibtRxJJmIPZD6KOGopMpAyINhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIpukaCRihRcpwDsbZDPMDTFsJu9GC7x3aa4ItMNLlI=;
 b=WkXsdnawY4o+mPnEnootyuqpUMSMI8c7h+YW5YlapF2wGgqoDNNjM8yXEGOSMB8IpPDAlSDXgFAIQf0II5+NmumgCzZjrnJz+tVAE9+8KK96sE3+A368OS67QU7+99FcwyurnaVejnj+toG/hhB/THBdN00hUmb/bRikG1hcW0pW4rIZLbum3paOlMsZ1JhJSzJ0hbeegTNefjUlDsJT2CqYzuv0mdaDDEl9wvi8VwoxCYt1206xLV0EAUzW4r0SreT+37Rpc0RLVc9oks37iBlogEZUSS8puUTGn4RZIPoxj08Ms1plbJDvjd0PJ3W7GnP2Ykw2Ik1P7lkbEKnnjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIpukaCRihRcpwDsbZDPMDTFsJu9GC7x3aa4ItMNLlI=;
 b=e/SL3RxBmQGOBepz1Z9f0oWeR2a2TWBxJ856J4kQv1B/Ni04tFPqve4KEGoPy/BE898BNEG8lSvhrZiUW06JzljsHCxeJzIIq+E1auljXmDkT0zs2PdPt5rLRkW0Tp+nloEnRF934r5cymrT2l0Z8ECOWv4zuqvCh7z6hFY6M/jhJV4JQLuzDuJbZHwIXizzZ3Zr9LO+Jiyzh/c56jIbkQnM8afI4YnkJAWD6p1XjNggtHtZ4fiz0wbObtN4UF1Jx+NUpxYZosldd5ijpgAbvGF7CXoU1mYE6ZjYIPvtsvTfKxW2DCBNUAts4cfaPrWM/rTg7tsC0SW5ECa1GbDSiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by TYSPR06MB7259.apcprd06.prod.outlook.com (2603:1096:405:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 23 Aug
 2024 01:41:34 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:41:34 +0000
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
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] drivers/pinctrl/freescale: Use kmemdup_array instead of kmemdup for multiple allocation
Date: Fri, 23 Aug 2024 09:39:59 +0800
Message-Id: <20240823013959.6281-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::26) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|TYSPR06MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 44307ba1-c0ad-489b-01ea-08dcc314b867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j3fJIsbEsxLd2tl13LhMwRBzKtgoKDkdCPt9/YVRAxz3r3t9EPWgugTBK3P8?=
 =?us-ascii?Q?p1uEA4R2kq1ngU4/Ycx1DGD2NTQYYFXeyFxgGdclr3A7160QV6Cfw2DOIPWh?=
 =?us-ascii?Q?JQhyPj1llg0ICR1UFTF1LjvOJ2O9qtrUuiNFnKjYgvdgL5wd2+cnxvPufUHB?=
 =?us-ascii?Q?JD44NTgvFRrWoj9rqhYfdpl3kE3Kz97tUofJzbBRVYq4ussXQ9tI30T2T0kr?=
 =?us-ascii?Q?7BKO/dK2oBmwqjkGUSckmSkooGX5ZmxkgRSO5ygY5k2a13QJH76HmFMIYQEx?=
 =?us-ascii?Q?NmRzFna0eEqyxNK/eIRRlIISyjX7ivZr3jXlqEnKXB2GO3xh8ZnigRF1vbCD?=
 =?us-ascii?Q?UwA+z5rpaohWbdJx7CLyY68tDFN57jeeqWIiOB3yAKwtZdQ/xPJbBwcYmSeB?=
 =?us-ascii?Q?JRWzmegV7B79y7ZtbmKxMfZlsy39gRdI5ObKRXl7pH2RZswTvDgfIxNNGZ/T?=
 =?us-ascii?Q?srYxPHGJBrviqVPlPwvjwtGLWu66xElu7z6/1FuSqYy8+iLTn1AyrEA/sK2D?=
 =?us-ascii?Q?vuSu82BjBDn7LOci52VNctqFqMSB/ax0Be9yNP6g38IitVn8QustwJIyDp6v?=
 =?us-ascii?Q?JwCa1vTR438+ejv+8sk4RhjJhCgrETkLQsgJh3hYXKjoqJpjZ9q10YL83Wiw?=
 =?us-ascii?Q?uruV+7rwvCxjZbtLF0nwV4sfc3ufZm2CebwwY1QCQp/qnlLzLRSFSyTDvUKq?=
 =?us-ascii?Q?21t15/g/pLIPaI+5/Tce7TxzqxJly2Nnc6oxq9EmafYlNuj36RMhitcvrXUz?=
 =?us-ascii?Q?+HY2RVfKtG1UxtF9phXgU8hj8v7q6D7TuGVGj59iS5VBxwlqlyEFbYsfQ9wn?=
 =?us-ascii?Q?CIqFf8CcPI8XMFuuycIQgbD+iKl6uhFJLLN4p7CNUfcZRD2D08pGGYL3Cdl7?=
 =?us-ascii?Q?QveEDNm+auJCfGCDex09hm/GVUc6gCGPWYRQfoZPSIlBPBzTDLBiGSsfLw1L?=
 =?us-ascii?Q?fzvRU+U1kXpTbk8D3/Vonx+fVH58JIPxmIQno9yR7ltuDkFAGi+H9ZlzxMci?=
 =?us-ascii?Q?qbA0op8o1A9CWqrSx8Oy4guCHuWDY1tLjCTnVOCNoqRCZzxRY2TUK4hdr5Tq?=
 =?us-ascii?Q?oCebslLI0Lt+Rlh1Nkrc/M805QzUy8xqkfmvkIZh3crdDzkpnwwB6PP+l+n4?=
 =?us-ascii?Q?TGVT7AybPQP9JPg7FXyjRZCYZY9JslYRnyItXydCxJN3p1TUjfL6ow4HTBH7?=
 =?us-ascii?Q?ENdGDvjcvGFBVRU7oKRookGHUF4z3m9tIhIMJmh/RfSlyanKMLXZFT7rTkD0?=
 =?us-ascii?Q?OV7ysnbNXdgIyXJyRH8NHMSiwJxnSWvfpu44sZgQzcmbvicidpHea6BdVMG6?=
 =?us-ascii?Q?i11MaXGwoFhUawZjucreN8ucXjZF1IA43wTpezyaSUXe0vv1y2ZVlCLT6ht7?=
 =?us-ascii?Q?z3u+nKWGBI+6nCPRz7HMJWAvljvWa9LcX3GnRt0mHTH0jhuHdg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OlkaJTeRo3n/l/XDPR/s62B+Rs9tRysgV/moRMGAbsI+Nquk71YvD8r/XcGq?=
 =?us-ascii?Q?Mh0nVAyrPv6gtwFHhPCfzyhNpkzJMufqwjS5lnQAw8DRTlJh6T2VBMkMWNVH?=
 =?us-ascii?Q?9w34V8MNZAdOkO9YxEMbIEbGMak8dVP87NBMPYjIMf+cssBG81nAzejX/Ayg?=
 =?us-ascii?Q?ATmP7PVaOVPCgmCIHKDfAArF6wTIkWgSM574jmcbMVfrmo8nJ3vO9TggzAcA?=
 =?us-ascii?Q?OR9xKgOHqOlafyUR725QGxh/8y8nzu8zRLjreLhzrElwLi1ATAjeWs9uetI0?=
 =?us-ascii?Q?yDsrc67S3v2w2NjHKem2D6oENJWE79HIV/VfWT6MItwJjEEUiDyy7ZFM4yVv?=
 =?us-ascii?Q?99d82nJuGD8yVKkr6NU6PIqyJ4HjZ6MSHpL2uYscd3tJxfzW0qglmfnrYfNa?=
 =?us-ascii?Q?RGwRGx3HnAc8/k/B5Znv9E2V9VlqSCcctMQsnZBFZYLgIajcBc4aUaRmqhKi?=
 =?us-ascii?Q?3DSr6GuBwQqal/8E9aQbvCp20r+YWSLqICNzj9XqmJLIH5pg2SDnO/9lH4VO?=
 =?us-ascii?Q?WxlBwpzxEj7mmSvdEFff3jUnm9zNA2yUeyysDEtnDLbf/XkOJQFA2D4yHJit?=
 =?us-ascii?Q?sDBkU4bn4qQwkZL6uovO0Kq9vUjPCuN9yrOzpu1e0u8us5vLYvS6XI4msnJW?=
 =?us-ascii?Q?9xs6W1KkIA8bE3PZGE6dAUow5iJQL6NNk22o0W12BKG2bQnjgWNXT/fOnF7a?=
 =?us-ascii?Q?LZB7g3GqDkinXpJcT9qyKZJMHFz3JTLHwOztCU60WeuQQmbSpKKpBJuwwEe5?=
 =?us-ascii?Q?kfC7cNWwVpi8eIbGEJLScpf7AqZdVNTdzKtZSyl85KJSKS3BBEvYjsp0WJgV?=
 =?us-ascii?Q?6f3N66CNXKJHyAftkUKO2cduCDdSp1xEhUutNbnl5xHKbLQZTYO6i0IgPgIc?=
 =?us-ascii?Q?HbosGWPpgxVyo44esmGF1oCAP/u4T8BPk8BYkwzU/H5S376/f5548k31K8Zs?=
 =?us-ascii?Q?13f2hrt5Jsw6uhcvSXMxQ8D0sqmBiRBQKqvyTTHNIIUFkfg3DEK8XgNPZLH3?=
 =?us-ascii?Q?AyS/z1rtszov4CbW6DycWgSoXpqNIQJJuZltnLkHRrdB5cknyN0utt1qzJqm?=
 =?us-ascii?Q?PnovjubU8+StMaoXRrizGdvwbtZHjuU4DEBp10hnkgXlY1dR+gSxg4LyutQi?=
 =?us-ascii?Q?7HBwRQcRgACRl6AgV4RZRTu0Jry9sW/urW7TkT2YLvK/G+IBMMNVNGZ7wdNk?=
 =?us-ascii?Q?K/0X3Hd3yX5vGE8KzvJ/NJgEnhPnCQD8OCQrBsA+v4IA/9DBxG6EIxA7241i?=
 =?us-ascii?Q?WiGViAagS/VGrZp7YVBHyfREtmIUuL5hUr50c4eGsfZINI/ZdlNOfBuqRoB2?=
 =?us-ascii?Q?bMEugcdfOgdnaMBEo9bJ3Jmo6jLXWzHBdqoZEzd1zjDNA5X+ZsDXWq0WqWQV?=
 =?us-ascii?Q?pLgwD0545q3ZxDVfn8FID0FURNwDgcrpzC3HOjRl1vlSedeZLnQdF4l40Iei?=
 =?us-ascii?Q?EXK/4v0Cs8kqKJxklUVpoTyO/QzkAxxLVNNQgcxGblnZWP+SXA8eqSGIv1A5?=
 =?us-ascii?Q?X/1I6HFJ4FYpFTIct0/AA/Kft6AoBHttT1gwFuIsJb4rn95akGt+E50PigGl?=
 =?us-ascii?Q?viLZIzmbSgfRDMIzFEM6dq9zoR2dPVGhHDvahgZI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44307ba1-c0ad-489b-01ea-08dcc314b867
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:41:34.2444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjqyvcvFBxYSzpgXbcmVtJlNLIusZehlVccbzJPSe5PUdckorxU4BkcK3HcB86xACBUFyg7e5laJB6t7jD2ukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7259

Let the kememdup_array() take care about
multiplication and possible overflows.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
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



Return-Path: <linux-gpio+bounces-6107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C132C8BBF21
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 05:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7FBA1C20AD0
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 03:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D259E5680;
	Sun,  5 May 2024 03:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lBQmISgn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363D3C2F;
	Sun,  5 May 2024 03:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714880369; cv=fail; b=u/Qye6wbxIpcR+keCarrN/1XPqtqR4pvMjYoirt+f+GLxUTHRXr4GqVD7lI/m/x2o6jqn20povxWp8967UoiNF7rl18cckLAN6e9/VMgJUE3yiYIjIV39u43XS0T0q8sytwKw2n5EM+GLdwbWQgg7rsIyCmwi+HU/BhADjTOc5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714880369; c=relaxed/simple;
	bh=0arTN+qWnYxOIFYqiP5y6aXF1xIWis3WICNoIoWEI/Q=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AiuUXKFxtKxNxpc5NI4FLSgfkWRI0OVeOamQFSZi/t280NEvudorfb1VEQkBRe0MHCIyWtno1vay4FTHRus/yP0jxQBylOr1RR09a9li5siUgvzuB5m+n6RfxNzqigcSBtvQCz/q+SUFO8SEWpALnB0Wl3FjNVw0DQHV8RqBJLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lBQmISgn; arc=fail smtp.client-ip=40.107.6.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO1bUcXHhDkA8AHL8SjIeefH85TOgUMBJUaPl6/TsIpytEJD/SCM9aaY08SdcNVvorDuUWXUs+lSirBpDQmWNpGiFszeoonvnxhvdnqxT5sVn8ErcBUI7MXsPPh5ytvrqHNOUgnZVOS8bM2ttZu4frduTrgyIMkM5cFOpUhxLp2HIPHL3ntsZyZXnYu4gn3uhlu5AK6ekW0091IUnZDSmFEzS2jckuZM4XmSHLb2SfTV4AA/YF4Ercdp9PGy8fB2vA2CuNEI0ruiTVFFH2KZ/9Y3lFe57Tgf2ge+VkyiSHtha+0vz9nAk+g9ca3kAn3EeimB51u3M+vFOX0oRa74uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ3w+QpkMgcUge3fp+PRPdhRxWMK6ZHWFXNMoUKgF7k=;
 b=M7yU4D3RoXG7WzIiELwK0Lz+BFKRRFC/DSeztH2xvyHSEx2SxSf7ncZ9i7PlsVp07SHzF8p5zUK13Ezmo/dH1GkyO3/Knxm+teahi4CUFvvN50obRPUw2MkjJFL4vc+e+7E9wJGjYM6b7J25oPAIkgyaGXiwgzgY7Nplo4PXgBjXRuprJTkv7CQp0y9hhWs0xBjiGROqqm6Qt/6uCMZNO9UGTtsLUPbQvZgxzmcPNeZ7yEr86Ht1JOsXpzOmgfaLiHTCy4a11w9UPtiklC4L2WL4I0nZQYWBR8SXO5/DTvEpIJG5+psOIF39l2ObvRLqOoPdLcl62KwAawEPY1zJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQ3w+QpkMgcUge3fp+PRPdhRxWMK6ZHWFXNMoUKgF7k=;
 b=lBQmISgncV1jgej0kTewjtG4fPmn0KuLFl7WXLTpggWPyi9xhFbzO7Im66SU06s+y8DlhQRY8insbhQQSFqE9MBNBrjtl7HhqSTbuzGP6gA6A8gZrVE6eV9uPFjqNcztUp/BYhU87WuOAkPhxChgEmOS4RZhwrENHB/28EBMcKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sun, 5 May
 2024 03:39:21 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 03:39:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v4 0/3] pinctrl: scmi: support i.MX95 OEM extensions
Date: Sun, 05 May 2024 11:47:16 +0800
Message-Id: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQBN2YC/32NTQrCMBCFr1Jm7Uj+oOLKe0gXMRntgElKUkKl5
 O7GHkB4m+/B+94OhTJTgeuwQ6bKhVPsYE4DuNnGFyH7zqCEMsKoCy4c3ZrfWFxgTBSwapRKaiG
 0tKPx0JdLpidvh/U+dZ65rCl/jpOqf+1/X49A8lYbSQ8zkr/FbTm7FGBqrX0B3b/ETLQAAAA=
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714880847; l=3919;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=0arTN+qWnYxOIFYqiP5y6aXF1xIWis3WICNoIoWEI/Q=;
 b=xAEZ7euqL9SsuuGtQf1PgtT6l0N8GiqdWmoHSeKk+B2xxyAJppKfTaiW6KOVFKwi/9pvx6Wtq
 PpcJo8M8OlqABJLAMYdMkmwO6bxEGnHsXfqtqg0gGMFbnfNU+Fk0CeR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: f270be40-d7c5-415e-dca5-08dc6cb4f2d3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|52116005|376005|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkxTVmxOazJPYUxRMHBxYWgyVTJMSWkyTk8zbzArWGJGUVZVZDBwOHJqOTIx?=
 =?utf-8?B?aDVZZmVCaUsxeXVFRHBTTWhOb1RBQ1dzdkVlekFhSktxMW5nS0l1ZG0zQjZO?=
 =?utf-8?B?WlJqMDR4bVFIcitHSTlzZkVsSHlnL2dVa25PTis2ck96Vi80NWFEam5zYXE2?=
 =?utf-8?B?TkdEMWZXSFI3MEVrRlRxL2hXeWZRZ2dkZE5KWHY5cmZWemg4YWlVWGcvRFZ3?=
 =?utf-8?B?ZThVUXJhY0FXQ3NpcUZramtLQnBzRkVRbGZSZURMSE05YyswRUE0UlowN1F5?=
 =?utf-8?B?REQrV3VZNnpJa1lMTmRORmh5MzdDV3hpN1VnNlJMYW5sc3RzUmFDTFFETCtQ?=
 =?utf-8?B?MkdNQ1Q4bTNqcFgvcHlXdlM0anJneEoyNGR3aFFFRkoveXl4Qlk2VHcveTJo?=
 =?utf-8?B?Nm41ZUpPaTZaaUxmekhFOTJUdDF5R3lTRS9EdklTbzNwdm0xZno3R2pJMnIy?=
 =?utf-8?B?eFVESm1lUU04aXYxSkZ0Skk4VVo2QkhVbjFpbnFTenExTk1OZEJySzBnWlhJ?=
 =?utf-8?B?aEF1RHFQelUvTzBCSGhMMFNYbHRmRk5ETnF1d2tVdzlONUc2VCtHcWxTdUtL?=
 =?utf-8?B?RHpLYlkyc2wveUhoV1ZXYjFNSG9xNmpuazBiZ2lmcnJGb1dTREtnVW5OM3dz?=
 =?utf-8?B?VUFwK2FpWmg4a3R2S3lGRzgzQU16VUlEQlpNRUF2dnhoVzk3bmNxSDdsdXc3?=
 =?utf-8?B?Uk5jb3pOMWYzMjVkbEU1WlhaVTl3azgrWTN2eUpHRGdmVHcwTDlHT3dBNVVT?=
 =?utf-8?B?ZDg4NVFObnhZLzRwWlZlTzlKSFk5RnU5TXprWldjTGlqaDNsbndXcmFGV3JT?=
 =?utf-8?B?SmppdEFxL3V1M3diLy9GQVFYMVRzZkNhZllUYUtjSm5IaU8vSzhFYld1LytS?=
 =?utf-8?B?MjFDM0JaRE9KdnRicU5kQlNBaWx6NFJBcEVRcTlxQ3ErWEZXcVBFL1VYUWFJ?=
 =?utf-8?B?a2wrNmZPdzRFaExrZTdhOWVJWnNHbGNocFNQVC9hTjBJOG9XUW5TL2RZa2VV?=
 =?utf-8?B?Qi9KcDhlT1k5T0o3bnk3M1hCU2FZM2hjbVFQQnVqNlBEVWV6M1BGTWkyRUVk?=
 =?utf-8?B?Kzc5c1BPbE1xSFpGYjh0YkRGZk5HaVR4azUyT2tldFZpWHA3OHhEYmNNZ3VT?=
 =?utf-8?B?U1M3RW5TZDJCYkJnMnVlT3hQT0dvcklqYkNwZmtoL0ZiQkNSM0hQSCs3czY4?=
 =?utf-8?B?TEhJaFhTcXJyMXkyL1poYko1bXpTVnBUUXh4Z25qdVhUSnNWQVk1NFBjVHRj?=
 =?utf-8?B?bHJ0ODBGZG91d3dQRHVqRlJHMEgrUXZQV0pYbjd4Q0hTbGNmQ3Q0QnNhQ2Zp?=
 =?utf-8?B?OTVKZ1ExdG9MRXRFa3piSWticEx5cjNlN0JiVXFKRjIyOTV2UFBobXFabmc0?=
 =?utf-8?B?eUQvcExJNm9YVmlIWWVVcmIraGs4MnJQT0Y1SDJlZm1BdTZvY0JmREx3dm5O?=
 =?utf-8?B?WVJOdWR2bjlYRFBTNy9XYmhNVkVvb3BvSm14Yy9SNFVMN3pxNEZVU2k1NFFS?=
 =?utf-8?B?aUZIK2kxdDJZbTFPcDFXTWljbWlGTzVKU0VJWEl4Sml3WXo5QkJKRDlEVzJw?=
 =?utf-8?B?a2Q0UE9lOGEzYnNzdVB0VFg1VUtWMGtNaytiRnFjd0JOMTZ3UzR5ajNwd25S?=
 =?utf-8?B?QlhvRzh1NlI5dUxpSWdCSXRlTVRuTnlyNExkR0Uya2ZGVkpGR0tRZEN0eVpV?=
 =?utf-8?B?R3NaU1J4Sjhpa2E3QmJTWGdVeTZha1p6YlI1N29oSkhJUy9ySldBSFhQemR2?=
 =?utf-8?Q?cW+2QerWPHwaZGzHin1htkdAFkhELNXQM53ZnUt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(52116005)(376005)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anRFOFNXS3llRHNLb2ZTK3BYb0Z3clNzeDk0UGZKMHR6ZXhyK0wrMTdiTS92?=
 =?utf-8?B?UlRMQ3J4eC9EY25DakZoTVVJcXRBRG1tTHY3N1FsbGQ2ZTFmVXc1MDNNamY0?=
 =?utf-8?B?OFNzNW5qbnl5OFNDZHVBclNaeHUvcEVmVjMxTVRPMGFQTHVMaDROcnFsK0x3?=
 =?utf-8?B?Rkh4NzJUZ0diR0FJTWt6cVN3RjFWSDJLZGJ3aStPTHdQRkl2ckdYekRQMUdE?=
 =?utf-8?B?K3Fyb0ZoWWN5cHBLYXFzOFdJcXdoRHFWbktDNEhkU2FSTE03WEc2alFHeGVF?=
 =?utf-8?B?K0VSd2xYUE5TTFRrWnpkTVZDb0Y5QmRRQmNyL2J1Y1ptZWtYRTM0R0dISVpE?=
 =?utf-8?B?REt0RllSUHk4anhkeDltamFSQXNTb1lTL2xCbXd1aytNemczNEFXbzRSREdH?=
 =?utf-8?B?SVp4SXlHd3NJM0h3VkYya0tHNStvUlBwWEU0aG1ReXdrdmFMNXRlZEE0OG1N?=
 =?utf-8?B?MlM1YUF3cmlObHdQdVFoRk5Md0k0ZVVVLytLYk9hT25zZEhMaExobnV6RTQ1?=
 =?utf-8?B?OW5oSXlFU0YwOFhPUzdOZ3Jqa3h5QytXWWdZYU1vL0w5djBYdU9aTGIrWVVW?=
 =?utf-8?B?OTRQdVBMMFh2SnhGbG5ObGNOWjI1bTdqMjZHQWpCZkhuVzhzYi9QSzQyVFVI?=
 =?utf-8?B?d0JxSVRqVm9sYXZHZ1VJNThEWVA4NlgzOVBHN0REUW5xVGlXNzVYSThDNGsv?=
 =?utf-8?B?YUU3c3RqeUNRa1hWbVROV0tYQ283UVZJanZCSmhBOUFGZ2dqZURYMWkvRk52?=
 =?utf-8?B?Q0UzZDNRYmVubW1CK25OT1BxL2dLcVpDejh5bjgzVHdYUnVwUDlBbVNxeHZV?=
 =?utf-8?B?WmFUaXFuYzlIZFo1VUo4Y2lMcVdidS8wNEZGdjhHSURzMzJVOHEyZngvSWl3?=
 =?utf-8?B?Lzcwd2JZWFg3RXNNeklaWWxHY0JZUnFZc2c4K3B4OTM4cVVWQWpQNkhLVjdE?=
 =?utf-8?B?aU5pN3Z2blVvTDRTSHBVcndMNmV0UjZoWUxGcWJEK0JlSmF3bkh6VHo3MW5B?=
 =?utf-8?B?TEhwZ1RQU3hMSG5vamtYeDlQV2VPRDRNc2t0b1Y1eWdDanBoL25aUnNnWEFY?=
 =?utf-8?B?MEw4SDNQNWplMlMrM1BSeThCakZBVnVXVlpacGFYdldZT0hWMURMWjc4WVYw?=
 =?utf-8?B?UG9ydGhrZENiUWlEM3dFZmp5c1FPOGNTT2VtN2dyZ3k2YjBtV3M3Wml0UHNB?=
 =?utf-8?B?dFJyc05iRzFlU2hLTXZJQU5rNjZFREx5Nnp3d1orb2NhNll1SGMrUGdyZFhO?=
 =?utf-8?B?azBTMFA4ZHNRb3B1UkptdVhEZFBScElVcVBUR2NoSWdHb28yOEk2aVJUc2Yy?=
 =?utf-8?B?eGpFRThsdU4rN2N3S1Y5c1FHV2NHcERkUkhXU3R4R296ZkdpTUczakY2KytI?=
 =?utf-8?B?Ty95aVdJdzlmOUpxbHVlRnFIVk51MjVOcFRqZmZSTXFVQUpNUnhwTjJkb3d4?=
 =?utf-8?B?NXlSa09xYXVSSXkrdCtGTWJtTUZabW8yRXZSaDRDODVTRVVzS1FoSGdsQXBi?=
 =?utf-8?B?SktIRXhaWTVTRVpzWE9oOTR1TnZ3UGhNRGNNMWszYmRXV0FyOEhzYWFEem5w?=
 =?utf-8?B?Rjh0V0V2NGZYa2JFRUpTakpsTGFJRnNFRDJNNEtnNDYrdHpTRTJNaG9ENFp6?=
 =?utf-8?B?eklaUUZXdkwwQ2toTUhIb1NFK2FSbUoxcmpPVGRoR1FsZzh3M0xxSjhwQUYw?=
 =?utf-8?B?TUhIN0xvdDhUUEVOYWFQQnJoU0RkQ1AwUGY5YkpNRmVkN295aks2TnNLbTVY?=
 =?utf-8?B?dzU3STdMa0dhdVQ5M1VFcE5DTGwvOWppU1VhVGYvdDJWeWw0bG5HNmtJdU1n?=
 =?utf-8?B?NmlObWRjditydEYxLzBOS2t4MjNXQnpEdU5BVHpIUUlPbEV0VHFnUGVjdk9J?=
 =?utf-8?B?VFhnQjJIRUp6V2oxVVBNR04vbGRDMnpRUmRjNFVoNGVOMEI3eVhqTkhmRk11?=
 =?utf-8?B?YTdhSU94SXExSEw3YklmbmRkNVA2cHBPM1hUOSswNWR6OHJvVktRSjNSZ0hs?=
 =?utf-8?B?Z2ZQVVk0MDhuVUY5SGNYOFJqZk9GMmFrV0ZHeUFoYXE5Ym1EKzlua0h6eTRj?=
 =?utf-8?B?YldBRUI2RkZkdHNhUitCcmg4NFU0eVpPdnduUkNSeHAzQjVqWXcyOVRkTndL?=
 =?utf-8?Q?ZRRA2tTc1r7Awiho7eWJAwOxZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f270be40-d7c5-415e-dca5-08dc6cb4f2d3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 03:39:20.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJ9zvEkUYc8oafqM870SSvQkmo/ZTJqzGKCxF5PoU3ALpp6inot8UQo4qL2wx54U1Dac3oZQFeUb6hARmvWaaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599

ARM SCMI v3.2 Table 24 Pin Configuration Type and Enumerations:
'192 -255 OEM specific units'.

i.MX95 System Manager FW supports SCMI PINCTRL protocol, but it has zero
functions, groups. So pinctrl-scmi.c could not be reused for i.MX95.
Because nxp,pin-func, nxp,pin-conf properties are rejected by dt
maintainers, so use generic property 'pinmux' which requires a new driver
pinctrl-imx-scmi.c

The node will be as below:
 pinctrl_usdhc1: usdhc1-pins {
         sd1-grp0 {
                 pinmux = <IMX95_PAD_SD1_CLK__USDHC1_CLK
                           IMX95_PAD_SD1_STROBE__USDHC1_STROBE>;
                 drive-strength = <0xe>;
                 input-schmitt-enable;
                 bias-pull-down;
                 slew-rate = <0x3>;
         };
         sd1-grp1 {
                 pinmux = <IMX95_PAD_SD1_CMD__USDHC1_CMD
                           IMX95_PAD_SD1_DATA0__USDHC1_DATA0
                           IMX95_PAD_SD1_DATA1__USDHC1_DATA1
                           IMX95_PAD_SD1_DATA2__USDHC1_DATA2
                           IMX95_PAD_SD1_DATA3__USDHC1_DATA3
                           IMX95_PAD_SD1_DATA4__USDHC1_DATA4
                           IMX95_PAD_SD1_DATA5__USDHC1_DATA5
                           IMX95_PAD_SD1_DATA6__USDHC1_DATA6
                           IMX95_PAD_SD1_DATA7__USDHC1_DATA7>;
                 drive-strength = <0xe>;
                 input-schmitt-enable;
                 bias-pull-up;
                 slew-rate = <0x3>;
         };
 };

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- Rebase to next-20240503 
- Add pinctrl-scmi-imx.c itself get pins and scmi pinctrl structure to decouple
  pinctrl-scmi.c and pinctrl-scmi-imx.c, so drop patch 3,4,5.
- Link to v3: https://lore.kernel.org/r/20240428-pinctrl-scmi-oem-v3-v3-0-eda341eb47ed@nxp.com

Changes in v3:
- patch 2,3,4,5 are new.
- Rewrite the binding, drop nxp,pin-x properties, use generic properties
  as Rob commented.
- Switch to using pinmux means pinctrl-scmi.c could not be reused, so
  add a new driver in patch 6 for i.MX95. But pinctrl_scmi_get_pins and
  scmi_pinctrl are exported for i.MX95 usage.
- Link to v2: https://lore.kernel.org/r/20240418-pinctrl-scmi-oem-v1-v2-0-3a555a3c58c3@nxp.com

Changes in v2:
- Rename nxp,imx95-pinctrl.yaml  to nxp,imx95-scmi-pinctrl.yaml and move
  to firmware
- Merged patch [1,2]/3 v1 into patch 1/2 v2.
- nxp,imx95-scmi-pinctrl.yaml only has patterProperties for subnode
  The pinctrl will be as below for i.MX95.
        pinctrl_usdhc1: usdhc1-pins {
                sd1cmd {
                        pins = "sd1cmd";
                        nxp,func-id = <0>;
                        nxp,pin-conf = <0x138e>;
                };
                sd1data {
                        pins = "sd1data";
                        nxp,func-id = <0>;
                        nxp,pin-conf = <0x138e>;
                };
        };
- Add pins enum, correct description.
- Link to v1: https://lore.kernel.org/r/20240412-pinctrl-scmi-oem-v1-v1-0-704f242544c1@nxp.com

---
Peng Fan (3):
      dt-bindings: firmware: arm,scmi: Add properties for i.MX95 Pinctrl OEM extensions
      pinctrl: scmi: add blocklist
      pinctrl: imx: support SCMI pinctrl protocol for i.MX95

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   9 +-
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  |  37 ++
 drivers/pinctrl/freescale/Kconfig                  |   9 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       | 586 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-scmi.c                     |  10 +
 6 files changed, 649 insertions(+), 3 deletions(-)
---
base-commit: 4db57327adc359a3f9a3481d60104be67c42964f
change-id: 20240428-pinctrl-scmi-oem-v3-12130031a74d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>



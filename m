Return-Path: <linux-gpio+bounces-6218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB08BF4F0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 05:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19CDD1F24EA6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 03:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E9E15E8C;
	Wed,  8 May 2024 03:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tcssr1Ia"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2051.outbound.protection.outlook.com [40.107.14.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7CD14AB0;
	Wed,  8 May 2024 03:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715138684; cv=fail; b=Tn7moOFoZ47sj8xguWj5wHsZPlkZXFmXJRT8o4nh0U3ahWR1mJDSUFKMlrmETO2HkXiTs8yBLMIgQGhnCSxkdRlq6zGOQf1qmgHdKr+oqk/3NoJpKJAb8S16frLhc0E4/BszupQ12PHuL1xN8JSrnJILpF1z5hCHU2lsd+GX6Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715138684; c=relaxed/simple;
	bh=3CqWMhvFpASbqlazBVq2IMTIRAb/f4zX/5EjBGg5KI4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oypCqUq7gQ04jRP7PqNWS6v+Ur3VSUNLjDvYRgkKdsCon4Gl5C40JEnpBqH3y24l2gp5NIWh2kOjtNak5dXxREBRSepdnsVzJ0sMwEACD/DDhvMz3tcUeMmajP3zE7MxJxAjVXbrUgI9YZQr5fbUHnZ4mC1fMvU/dRvT8z2avu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tcssr1Ia; arc=fail smtp.client-ip=40.107.14.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6FvbGosHn6w01meaUnkiM/jAwtuBhbpR/5g7iSua2PsfhsYnWoHuRzznH3ALFa5nvW/R35Bjv0nxW+LdwehN8RHmoqHgMeugVBuNTq7l5vrBRhdHfotpgwXRIT9p4gM3LgqmhRwWotnPxucfP48DFBxxM/BuuAZwipZpiaONSaO8sOBaojyVBgC89oQMV1dffgmGR8Uu4WDI4f1zQGMWwlJlXsFfyxr6uklibLn69Mlw9mVWBSE2gQRAkFZ4YQ+2MkMjcyliLBFY+lHlAD+wP9QQVMaSQRccYWxPvDsg/8XQ8DQiU3d7U59C7J2lGyiFDP3AIolmJzO9BOCRQ1e/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hv1H59MTfHnDnpyVMtMvGxlbEW3yCywOD7f/6rVTBQ=;
 b=c2Z+bTOWWS4rd+OPB09XOA1+pEAgZuyfGABCzAQLvRQBmenmRRiCkm3jFXpEGJvDH6tHyEdgj0REpkHDPlLeWM/igS+27JvRwEkFFAdKXQZ5YcKCMcsXgpESmUobd9+i0/Kf9ElO9D1eJGHHr4IvB0bx/A7S4lFz41PgkzIHlETDSjEcvQdG4Tld8hP4rh++aV5nhIal8t4iEgrXP4VCFzE1FPzGKbMd4f7JalZvtBSClksCZebuDh6zajxquHbvSF9X3AlMAsciOH3BpauIUpAahGvzK3ZDEWKEaPOOkcQzsiNg5yPR0efJJ2NjKzDEFi+FatP1tBq5WbTWg5D+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hv1H59MTfHnDnpyVMtMvGxlbEW3yCywOD7f/6rVTBQ=;
 b=Tcssr1Ia4bBCOYFcUWAtrK3RUQpzjD/OpTxndGbB03ovT4BThI/JjE7I6a5ZfsIY8H9fXF+xOv4lU1OzFRQlU03iZSCzyz3d+6G3U2BrlZsvA3LFdFaItFWcdpdO6ooEgbbc30OOoH8vztALSxx6FejQ8NDNTgo3Gu4jRw8zOs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 03:24:39 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 03:24:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 08 May 2024 11:32:02 +0800
Subject: [PATCH v5 1/3] dt-bindings: firmware: arm,scmi: Add properties for
 i.MX95 Pinctrl OEM extensions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-pinctrl-scmi-oem-v3-v5-1-6f2b167f71bc@nxp.com>
References: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
In-Reply-To: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715139159; l=2848;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=epIDuWzCH6J3807f/r6dNqln7UX230N7xRikk4P3jFk=;
 b=xXTasOKAbT+7kdkZ+XUi+i3MzoBWEhUw50i+fKdZWM8EnOm3lMl4qGiof0DugxMwiSvasURxC
 /UYQoogWBW9Beust1eSI7m4pfjR65o1QHvpDSylzKyNN6cnzGKNnNk7
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AS4PR04MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c41314-1953-4a80-6925-08dc6f0e64b4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|366007|52116005|7416005|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3IzWEp3TCtPQ1V5Nm8vZU1ndlhVSlFxblU0RE0vVVlxWWpaWFFpd0UyYmc0?=
 =?utf-8?B?akc3a3A5c05GK3JXOFdMaXhkUjBjbmd1eDIzNWVOc0tRQ1VWWWZIVWxrK21D?=
 =?utf-8?B?UXVjWG9NdzIyMzNKeXRQTW5tc2UwRW9DUlphRDc4cDhyc01nc1ZaS01vbFpL?=
 =?utf-8?B?anlVdjAwcU5RQXlmV1VuWGpXb2pCYTdqNUtMTG1KYzVsRnJmYU5HS3dIeERH?=
 =?utf-8?B?RnJOWFpJaFNIRHZjRU5oQmdISFVZS3lDRDdUUW56UlZnTTJOeDJPRkNYdVhW?=
 =?utf-8?B?dUVPMnI0OTZiYURNT2lGRmlaNlhFdktiZXZlQ09Zd3FHOHRwOW9IU2hMOGUx?=
 =?utf-8?B?T3k0eXVmdzFaNGVuK3A4bURoWnB3NWdoaGFiQ2VEUlF1M3hRL1NlTE1nanpy?=
 =?utf-8?B?Q0VBdjgwa042eDVnQk43cEZzeDJhZEZwM1hlbE1SaWFkUFFwbDZpZXFVd1lN?=
 =?utf-8?B?ZFVjT3VtaTRWOWY3OXZpOGVjV29vczh6Zk96enVMbjI4STQrRGo5SGxwYUF0?=
 =?utf-8?B?UncrTzF3c3lLVnJ6L09XWHpIaVhtb0tWb1lyak4vL2w1cVprTE1nUWUxZmFv?=
 =?utf-8?B?bGFOYnA2ZzF3TG9jb1FFN1ZnU0o5YlFpamVRU3E5dGdrRDczVWtOeWNTNzlk?=
 =?utf-8?B?Zm5kYzlBZjhJRWJTQ1pabmZmekozVHd3c3ZaTk80ZDJTNXppYWc1R1Q0VkFB?=
 =?utf-8?B?b0JTaGlqY3FjeTRrMFd6MFB4eEM2Sng3cGFiUzhvKzhkdTU1QjJJSU4yaUlG?=
 =?utf-8?B?WjF2dDU0SGlaa3orRXBTZ0ZVYUtSeWxRZGRhV1UzcHlxVlp5bnZZUnd4Rktw?=
 =?utf-8?B?RnNaN3lFdUlxeXBLbFNVcXkzVlovWFRSS1R3bzlxNlYvKzhUSk9IRFh0V29i?=
 =?utf-8?B?YlpvZnVyWitYR3REQWJ4WlJSaGdLUGFYbnZSdGR6bUNHUEdtMVk0Z2lJK2ZB?=
 =?utf-8?B?SDNFTkN3WnRsbmEyc2dNb3NsTGo1MzBYalJWTDljOFRZYm5iQms0UjgxdW12?=
 =?utf-8?B?eHhWZUszdUJpM3JUNlorNGdsUXc5QjVNRVNmTGMzZFZ5UUNHcjRyaEcyUkFu?=
 =?utf-8?B?WGo4bEN3Rms3UkR0MlJKV0NWaDFWYjZocEROWEZsVURjMlM2RDdabEVHTUF4?=
 =?utf-8?B?bGREUGFCUjFpc05taGNKaWY0M2t5ZDZXTG1oYlZETGJqQ1VSM0RpRVBJWWZw?=
 =?utf-8?B?QjBsSG9sMlhiWStkU2dvK2w5Y040cndXMmY4QXBCeC9kdjlFcHZuMlRZSTBJ?=
 =?utf-8?B?QnNMcWRDbDAvT3dvbmdVV3BYS2JJbUMzc2w2bEc1eWpnODQ0b0Q2N2g3eXlR?=
 =?utf-8?B?cnlFTlhpNkxRdGc3T1hBay9yb01NOHJkdnBwc2Q2VHU3d0xPTHF0cGlRVFR2?=
 =?utf-8?B?U29sL2VpZ1pmNWFpd1NrU3l4WTA5SjA3M3Z2SG5USHRDdEtmbDl3R0NUdEtL?=
 =?utf-8?B?OUFyamNSWkRSRmZHTEIrQ1hVTTJnSkdUZE9mZWxKMU50bXdoVEpzUXVySXZM?=
 =?utf-8?B?cHU5ZS9zVFBONUIyVUFZT2JGdThERUVHemZMaWlSYnF6dE4yYTA3QnV6T29K?=
 =?utf-8?B?bGdkd2lJY05tOTBqcWtYZXY2bDZVS0doVXU4Uy9hdklUQXExZUxLMnBiR1dL?=
 =?utf-8?B?dlN5SDZjbTVHQzhuRktmSGE5RjQzYzU1Y2ZTS1ZUakxwNVFJdVpacnpkYlhn?=
 =?utf-8?B?d2JPTEhjc1N1bnFHQUdKd25HVEZBWW1qSkJjQm44am5NdzNSSnV6U3ZUVVhX?=
 =?utf-8?Q?wXIIxz41GWiew9K6iR3ttEXjqeRZ7LyDk+LFLQA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(52116005)(7416005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlQ4M3pvYWcvcmhRanRLU0ZINGMzTDhCandycUhiL2x1azJHeU1mZHB4VWhR?=
 =?utf-8?B?Ti8zSWswcVJvU0VhQm53MnBHR0tOYTg0OU50VnlBVm9EdFRPM3pubkVxTEtC?=
 =?utf-8?B?MnZPeEtoSE5XL3NUK3BOY1RXVk5Dd1pKa1kyL3Ntb0VaeUlycGRHeTlGbU1P?=
 =?utf-8?B?WUM3TnVrVDlrUjhVUCtRaDZrQlNqTkxWaWVjalgybDcxcERTT2dQU3JiNUpp?=
 =?utf-8?B?QzQ3RzRwNnhuVTFhQW1MTWxlUW5LVkhHMXdGeWg5VDI4VXZKenZGMTNXVkF5?=
 =?utf-8?B?UktBMnRmVjc3bnZmOGFQWndWcnNCeVcweXczYUc4NUtnUCt4TjFlaS9ZTWhq?=
 =?utf-8?B?VFVOaHZDbVJYdE5YbEJQQ1ZWUlJ3akFGbEVlRGhpcnZUeXpKTnlLMDNCYlRm?=
 =?utf-8?B?Rm9aM016K0JLcXNNMXJuQUgwZVd1M2E1eXhyRGtWd3ZETnRrV25UTWIzVjRN?=
 =?utf-8?B?YVljbFFHMGlHTXpsSENFWWI5MFBsa0YrS2hUREZXeEsvNUhPMktHNU1JdENK?=
 =?utf-8?B?Vk8zUkNXTjV4SUlHUktLSEp3WG9EUHZWZ2dxcGZmRi9YRE8wakZwWXkydlo5?=
 =?utf-8?B?c1I4TVJlWkZEYVBIeTZoajdtMGg4N1ZNOXNiRFpvbkQ0NE8vS3NxRUFFMlFr?=
 =?utf-8?B?bktaRUlvV2Jka3RYeHY2ZGtxOFk2aTR1ZkRqRWpZZkthcGw0ZWRJbThMeGVX?=
 =?utf-8?B?bFdZRFNXdTVOQW44VmQxdExDdVQwRzB6UlpaR0FDenlmWFNoMTZiK0VkbUdE?=
 =?utf-8?B?akl4M0pWeHB3eFRZeVBwd0NZTG51TzJSWmZ0N05YYytMdng0UG8wMnpuWjJP?=
 =?utf-8?B?azdaTFoyaEdNek1jNC9uTFJyYS9FV3BCQkF0VjJDWnhFZnU3cnBzL3JLSUR5?=
 =?utf-8?B?SkNPcElCVzcxTS92b09LMC9XazlPbDlJQkNvaFpnNkpCNWFxUDZtUG1Vek9w?=
 =?utf-8?B?TWYxdWgyNmR1WFE4UzdMYmpCc1Z2UkZuK25hK1NuM2FJakErOWxRYlF1SHJ2?=
 =?utf-8?B?Z0FqRlZFMGd2dnNnbFIzTXh6dTgyTDFsMGxoT1cyR1hLQm5MV0cxTGUvZFRW?=
 =?utf-8?B?SVo3U2Faai91USt4R2htajdyY2Ezd0RsTjFBclMrZDQ2RHIvT0tsZjNaSGp2?=
 =?utf-8?B?a1poMjBCV1MrQzBucituUFAvc0E0d1Z2eUtmdlZiWTdpbUQ2U0lwVlFSQXZh?=
 =?utf-8?B?YVMyd3kxamduYTE0QmF2RHRFNU5aNVZUTXpvZnRoeWhIbnpDQ0c2TUp1Lzlm?=
 =?utf-8?B?SG1rUzIzcXBjZVlVMW5hdmQvQUpKS2FSZlBhdlpSWDM1Z1JSVXd0OEcyWVZZ?=
 =?utf-8?B?Y2J6M3h2SkJrWnhtM0IrWFFtNmd2ekVseE1FSWtXT1JBYm9IOHhNR29PcDBG?=
 =?utf-8?B?WDdoQlpFMUEwQVJGT0pXYUdmT0FGZWJpSDJvdHJyS1p2cGpDMmEvdUNZYXZF?=
 =?utf-8?B?aWlLTUg5cndGNXVTbWRvUVBGdHVIWHBNWk1ZQVJvWm9IdFZFbUNyWENRNzN1?=
 =?utf-8?B?WDlaSjBLRjJkdG50UUtRUXlXMHd6MTRsSDVlN0R6ZDlHQW12a2xVdjV6U1J3?=
 =?utf-8?B?dGJKNmNpVW9zMitpcG93KzFOUE9MTFZieUdicU0yYmE1ZVNwMWFOR0w4SmlI?=
 =?utf-8?B?MEFMMGZvYmpVcFI0N1BML2F2V0puUjhjRUJPSlRWQzFjb2NLM2FOKzdFbm9W?=
 =?utf-8?B?YUdXeVlvM20weUhFU3NSbUNvQ001WFAzaE1tS1dIeURsM3ZvcXBJbFMvQ2Ez?=
 =?utf-8?B?YlBCejl3UzVFZjAwUkZsejNKWXp0SUpKbG5OeVJIMEhldXdrdTgxNjF3amVV?=
 =?utf-8?B?dGdCc3RCeHo4SEcvOCtiWWFkb25pZTdXZkVLRlFsMnhqR2JKRklBWWF1d3JH?=
 =?utf-8?B?WjlRVDB0NHRVNUxReTIra1FscmgrR0JGU1JzVnd3V1JvM0VuZklIQXNocllm?=
 =?utf-8?B?WmJwb2g1bGRXemN3ZCtUVU5CNDFJc3Y1SlFFa2N1a0RFdTdLNCtTdHhtK2dr?=
 =?utf-8?B?aDdHc0o1c1lVbjdQNTIrbWszMjFVYnFQb0xsQ0gwTXdaWm5CS0JGNnhNclcy?=
 =?utf-8?B?bGpHYW9YZE1WZ1EvUFkwRnZUTDY1N01iRnhwNFpHRzRVbUJHdUJZeVZSb0ho?=
 =?utf-8?Q?tq+PiTUvVQj0eiEIhiW8Y8UMP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c41314-1953-4a80-6925-08dc6f0e64b4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 03:24:39.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWqVSGEMXwDk3x68aDRVaFjJS2VjroJz7o16EDH1b0Kg1LDG7T8IuGlMv1iDY+6W0aswrpaVx/cLf5qB50QI8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243

From: Peng Fan <peng.fan@nxp.com>

i.MX95 Pinctrl is managed by System Control Management Interface(SCMI)
firmware using OEM extensions. No functions, no groups are provided by
the firmware. To reuse generic properties, add the binding to enable
pinmux, slew-rate, bias-pull-up and etc, under a subnode of '-pins'.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  9 +++--
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  | 41 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 7de2c29606e5..bd4dfd7a85cd 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -262,9 +262,12 @@ properties:
     patternProperties:
       '-pins$':
         type: object
-        allOf:
-          - $ref: /schemas/pinctrl/pincfg-node.yaml#
-          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+        anyOf:
+          - $ref: /schemas/firmware/nxp,imx95-scmi-pinctrl.yaml
+          - allOf:
+              - $ref: /schemas/pinctrl/pincfg-node.yaml#
+              - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
         unevaluatedProperties: false
 
         description:
diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
new file mode 100644
index 000000000000..3ca2b0cc484e
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/nxp,imx95-scmi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX System Control and Management Interface (SCMI) Pinctrl Protocol
+
+maintainers:
+  - Peng Fan <peng.fan@nxp.com>
+
+patternProperties:
+  'grp[0-9a-f]$':
+    type: object
+    unevaluatedProperties: false
+
+    properties:
+      pinmux:
+        description: |
+          An integer array for representing pinmux configurations of
+          a device. Each integer has the format,
+          pinid[31:21]
+          mux[20:16]
+          daisy_value[15:12]
+          daisy_valid[11:11]
+          daisy_id[10:0]
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      drive-strength:
+        enum: [ 0, 1, 3, 7, 15, 31, 63 ]
+
+      slew-rate:
+        enum: [2, 3]
+
+      input-schmitt-enable: true
+      drive-open-drain: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+additionalProperties: true

-- 
2.37.1



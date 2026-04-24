Return-Path: <linux-gpio+bounces-35449-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKcYDzTK6mmtDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35449-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:41:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A7458D74
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 859643008463
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6DA27FB2E;
	Fri, 24 Apr 2026 01:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D9mKf/0T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639926ED41;
	Fri, 24 Apr 2026 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994803; cv=fail; b=YjqfAda2Nj0D1OXqoXh6IiGZv87sIMVsksDJaPdqvGyGYL/RH7bK0xRLV4SecSk8gzMqN8ICnbRwtEjDyrSn9D/nXagHD3uzQx84ZJchYNMk2kocHMDhbugRSrLlVdhQLMAS1WRkolYLv9z5XsqaHogNEJToQ31BMr5sc4X7zqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994803; c=relaxed/simple;
	bh=jkCrKYeikdmQ6amES6JQPBP8RYWnlxuQ8EwC1bsJlOo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PvZNg37YK4kuL2BPvpSJLIcNsKNnDhYmR2hYgIkpsLysIVo3VCQwQWWZJcgegeXXsOCoYxtFo1XvuOxQXsvJKa5A3o3EcIcpeIwzB9RnX2Y1xeX6WVWvAkERmeKSCu7hOQCYKRyZ8hPZtthxrc8Qd5pxFhmcPuHRv8rZ5n82Ink=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D9mKf/0T; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7I/qv74I9a1uOSn5b/Su4LKOkhUSLe0LFGntXO+HBIo/nMtsvBTQS+na+XnLkxHVhH4kbMZEC05dg8ygtOCWhjkNvqrk2iR5q1kcirfjBIQjRoVKKCWR8u6PRG3sQ92VsLgDUUhaZtzOsyEI12ggWeXGKK+78l/uvwZiN+xU3pQk1QBgd5X/gTr52Hiq3vT5wgLKM/WD37HOH+qgdj4TFmWh2rSjgPRyPH34NuFzd/GwGOI+1tlIfNT2Y01cXGDGAw5Ruu74yh/zZaLRQI2PK+Stq/ohaX/4LMbQjdqWHY1jaOH//6dKDS4Eg1J8TeNRs6svRTz/2JpFaNweVzH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd6mzEqqLW3aU7Pmn/hiiKp76VY1eNSZg565Ecotyy0=;
 b=x1E5WGcknhENaSbk2y+nqONYGguX+ObRoX0qAQ7wb4bD5wXKMXjDrXP1P1dfUGLi7ELJxnZUpHWpoOenzA8F0aNWQd0/rda6bAlsIvjNArI0BiHsVxgDmoHRhh6sU1ZOVkvpNWzi82TIVsywsuoa9249wJIE8nQjxcdUfU0kUKNnMSU2q1j2FPgXKCIebEkVSMkw8yEygf3arVuh4lATECkJ3JsyJ1Xqb6gX+DKcELS4ivTyHR9W1/OPFTNepXEzT1xMRb7rMedgdSJmm6Xz4gDaFVL8v82QQrIEjZDAt7HhZZ1kdBIYs08TuO1wj1vumWVgseW9Vt0vbMHG9NKfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd6mzEqqLW3aU7Pmn/hiiKp76VY1eNSZg565Ecotyy0=;
 b=D9mKf/0TL323/j/AixuhcA5HfUggRoh7Vhg9ImB+mEbTsydEJwDlTXyNm3w+rZEdEpFap76p7uQ/KnRchiIosR4R8nFZPotLHu6ak2tpNFp7YWm/yT5y7wkbTogN0wOWwMg+ntym8614iDwEy19SIiBGnjkIEy00Hp854d2OrhE+s8buV9Fhq9NRzMPCX3HPLfoXxdYq1k6ItYqaRdYqqAcZj1mZSTJLVaa7xHPzhBYY9nxhkCQS22CRHKl0NcSSzlsrOFdeQnbjsoJMkXsCjEzaLOPQXHJtlEl+IdAvvVNmQEZCJ8XC6n0iirY5Y9GbqnN+y4v+TGZ1u20bXyT9bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:39:58 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:39:58 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Apr 2026 09:42:24 +0800
Subject: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
In-Reply-To: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776994953; l=2701;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=pXbWQO4uMjgak74FrySFaYJsAa3sTB5MlYPpyYgRVr0=;
 b=eEtfbiTSQF5N0G4uXSuVS36Q6XDbcZDVhRVjK9rKPdxgLT4ZeRVMy5YIRDcQijP/w8gE4eSBm
 qUQ1CCt0JvDDyMrBjYFg0KUTKC+jl64kMddQHE+Np6nak4K4WmXYIaB
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VE1PR04MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eda0952-9341-42d7-4352-08dea1a26511
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZY0PWm7YBVHsugWhTyt4SynTk9Tfi18ND/o1btPRid8pf8rtWHcxnehW59iD6JJgOy+msxoc0cfSyjkRuiq1ENhCDSog8QEvpU3hx6E6xduvcLNuJT6xZHiVMyavTTjxaFhXMZ+J4D4WjSVLqpGgiea1H8eZOZovoSZevKkgJWV2DdcoEz7gqA4u3sgC6gBXWxnbpYfLJKG5MKYvC18x6utaozy9ygSEdAlCLMX9vQjyAE6aplYDah3KhGWHMSGW4nGt2WfzXqWvImfcNM41r41kPvcZ5a9erb2RJUs3aqjoPjJi/U50md8sFZCpgthFt3SVYWmbJkHAB44YkT2G6eYgbmOf4sr5JH4Hyw4ep0k45x2aZDuNzc1VU/nlm23eYgV5v9abyuQ1n6n6I8cNUE1LO6Ge3NWGKTo8SP0WJ0lVOvAiWeT1w+WqJFYZEr3wWzZ6OLJcTJ9TSu0IaYnukPcD6bv+Wxq2vSTEQvTZFSPAGpTui6yhptwAgzGcl9bfl6ZuyVSyRhuO7hKsmbXhvWK2iFJfXh61vPa09QnhZwSr5UUdhC87YViMmQoeOx6ZaMgEqkLbskEdFc4tTaXihywNKliKdGhxJ251izhlz32aRdNPA9SeXLTDra3KNIlaggGSFLKPgcb/zVl16+X9+8bvMnfGz02mSMekGNZrGlYgmGBIlPOJPq9E+nVGmWqsFeyE4Rb5gH18yN1s919gSHEbdDORytZwYE4PVKkomowWuojiv8lkWRsC9E5Xf2jiqJbuVy9BoejoHPCt0yp531d8tblD5tEwJmBqe87gcng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXk5ak5FVHNKTFlna1JncTJhdnZldWlvTjJxb29HY3ZsQjE2Q0JFT0M3Z3k5?=
 =?utf-8?B?TnFaOGFBQ01jNXY1VWVJNXA3VzZDOHh1UHhOUzI0VmJiRXNHVkdUTFNUUmNK?=
 =?utf-8?B?b1JoTElFQlAydEZnZHE2QzQ0TTJ1MlB6aVRraUFBbGZVSTNFSHNuQ2JOYlNP?=
 =?utf-8?B?MWdnM3E3RnJReEVnclNmL1pCdEJqWUUwZ2NUaGc5b0Q5UDdTVUdYbHF3dm1W?=
 =?utf-8?B?OUlIRWJ1TFhqdVdZd2tFcS9DOWh6LzQwc3pqdkNwd1Q5eG1DbTIwVmxKWjJE?=
 =?utf-8?B?cUwxTmZUcFNLNytPTDA5WlJqWEMzaFR3REdreVgvVUt2M2xoZFZpaGFOWFk5?=
 =?utf-8?B?aVVoOEYzRk1vLzhPeVlQU213c0hISFVCc3dRZG5GOG5ZNkRSK2R0VTBEK3BV?=
 =?utf-8?B?NlptRitqWUVpSmlDalN6SXJqUlE2elFnSDlweFpjUDBGQm5aNWl2eGxia01G?=
 =?utf-8?B?RytFTkVibW8reEZNZ3NJaEM5aXpqZkk2d285Q1RnNnlGTnA4Q2xmdzNDZGU3?=
 =?utf-8?B?em9kRTlXdE9iRjd5bHBGWllDbWdvb3Iyay9ORDcxeWFnM2V6VU5PVDV1R09y?=
 =?utf-8?B?a1ZLT2hIUTlaWlZrTWFpaXA1R20zMzI2UHZpV0ZJZ3M0NmcrM05EMGx6aHpQ?=
 =?utf-8?B?clZWZGhlWTBaQXY2VFFiajMxeWEvWmJDblVaUXRpSGFxUjgxTkwxbkZwcDZa?=
 =?utf-8?B?Mnc4cGdQUGVRSHVFKzBYMEF4aE4rRDZFMUdOMkttdko4WW51cEhOU3RpWTIy?=
 =?utf-8?B?Q2FUaUlBMUdod0kxcENLaDBiTFhrRkdqckxCc3FrSm10TEFiajZoczVEZnhK?=
 =?utf-8?B?ZnBxTHczc1lHMXVuNjIvOTBGdDZRcS9nbmlqUWw0RWhjY0VLRmdjcW5HOVly?=
 =?utf-8?B?S0l2ZmNrR2IxaE5NWGZBNitCbnBsd2lKSzhoaUlCSEFrVkd6UDNlWFAzVVNJ?=
 =?utf-8?B?am45M2s4SWlna0hGMzV6TVgyUnZTN1M0Um1zQmFhMlN4WW9UYmllSjdIVGdt?=
 =?utf-8?B?Qm9qbFpKUFN6S2pKcThyTjNERHhOaStqKy9BajdOWFhxTEg5T09QeTFkM0NZ?=
 =?utf-8?B?SGF4b3hoeVFHWFg3ZXJ2S0g5ajFYdDVqdWN4akY3NGUrSnFrVk56amNNZjNE?=
 =?utf-8?B?RGJjL0drVG9WYk85T3pZcGFJaUlza2tiMmpkZkdmTmJlQm1hZkZabUZpekN0?=
 =?utf-8?B?SVV1ZmZXdExxQnM3ckZrSFppL0hNWkJjOXk3aTlTcEdoa2pPK2ZuUGtSc0I1?=
 =?utf-8?B?aFpvZEpndldsTExHSGZmeFErU3cyUVFlUEJ5T1NkeWhRclY4djc3K2JkbnJO?=
 =?utf-8?B?eVlWZmNUaDdXdUlTNEdxVDlLME9seG9VREV3dTNVcXdzS1E4djE0WDh2anhL?=
 =?utf-8?B?SllJc01aR0I4M3FNdFQ0TzNDSEx0M08xQWtzTkpXOW1ObGZMbmYwUGkrNVpW?=
 =?utf-8?B?aExJaDVMZExnT0ZabDZSakpoMnlhNlI5NDlKc3hrVk1KcytZa21HbmM0Mktq?=
 =?utf-8?B?YlViUDdNNHdyVkxlSm9qTHFEUklNRmg1eHNFOFVGM1pBNUhmS3RJUVlDZi9X?=
 =?utf-8?B?M2ZBTkwreWtybXNmSjNkaEVhVlRNc25maThUVzYwNjB4UkpsbzRhTTg0QVdu?=
 =?utf-8?B?RHd6NHYrd09sOHNCejhQU2ZPblplS3BmSEY0Slh2ZTIwRndqemhCS2RJdFA4?=
 =?utf-8?B?OEtFQnJFaTdrVnY2YXlYU2xQMHo2VEZwaTc4cVlHSEd1QmZWVk1JSi9RKzh6?=
 =?utf-8?B?RHZtRFNJNkJnQW01NVNuV2NnSncwMm1VclpGZktacXY0aHlIYjV4U0pFZEtE?=
 =?utf-8?B?ejNjdklyOXNvOTNMc0J0NzBIcVZVR2JJcFVNYlRBcElCVnJON3M4d2Z6Lzc0?=
 =?utf-8?B?aUEwdDlrbVJ5ZlRneThuR0xKdmZWSGFOTGdUK3hwYWFRblByMjVreXl3aW45?=
 =?utf-8?B?LzBPK1NjMEczMFBwb2ZFTWd2N1pNcVJFcy8vdFpBSFd0UEdEYWVaNzNFWWxv?=
 =?utf-8?B?YU9WQ1hPT3lCVit1SWE0OGtVNnRLdkUvL0x2UFZNVlFtSVBJVzJsQ041ZWo2?=
 =?utf-8?B?S0JENU1RdEN5YUlmT2dVN0VSM25PcXNRREx5WlVPMm8ybUhVOURLNjl5TUs4?=
 =?utf-8?B?RkYwR0hlYzJ6OG0rY2JRbUdnR0Nyc0kyVi9ZMExtRkFXMlNuQmZnU2xhNVls?=
 =?utf-8?B?U1U1L0NPZmRTU0dNNnBQWmRlUHYyV1pTeTNqZGR0VXBkNWQ5S0Q0VFpyV0p0?=
 =?utf-8?B?Y2s3aHlmNkdMb3NUeHJGc09EaTd3aURNVWxjQkhyOVI0T3ZGQ1VZblNmVnho?=
 =?utf-8?B?RzFYUzMwRDlReGtQZzM4SVgwNkhPcU5ObzIxR25JRS9ET2lUTGtaUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eda0952-9341-42d7-4352-08dea1a26511
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:39:58.6608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRRmWRQjadA9HYEllfIjLEIx40LpJu2xsWyhn2gA5pH42lscgWVpTk/SNErDVok7aSLqX/5z4CZsn/pLaWOlFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455
X-Rspamd-Queue-Id: 361A7458D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35449-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
output, it can be programed to output local data or remote data coming
from the remote compatible deserializer.

Add GPIO flag in second cell to select remote GPIO data source.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v6:
- Added GPIO_DATA_SOURCE_REMOTE flag to dt-bindings/gpio/gpio.h
- Updated dt-bindings documentation accordingly
- Dropped Reviewed-by tag from Rob Herring due to significant binding change

Changes in v5:
- Improve the description for "#gpio-cells" as commented by Conor.

Changes in v4:
- Use folder block instead of literal block for #gpio-cell property description.

Changes in v3:
- Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
  compatible deserializer suggested by Rob instead of adding third
  cell for GPIO controller.

Changes in v2:
- Remove new property ti,gpio-data
- Add third cell for GPIO controller to select GPIO output source.
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 6 ++++--
 include/dt-bindings/gpio/gpio.h                               | 8 ++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 2e129bf573b7..da63771bc236 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -21,8 +21,10 @@ properties:
   '#gpio-cells':
     const: 2
     description:
-      First cell is the GPIO pin number, second cell is the flags. The GPIO pin
-      number must be in range of [0, 3].
+      First cell is the GPIO pin number (0-3) and the second cell is used
+      to specify flags. See <dt-bindings/gpio/gpio.h> for available flags
+      including GPIO_DATA_SOURCE_REMOTE for remote GPIO data source.
+      Flags can be OR'd together.
 
   gpio-controller: true
 
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index b5d531237448..d04a494d96ad 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -42,4 +42,12 @@
 /* Bit 6 express pull disable */
 #define GPIO_PULL_DISABLE 64
 
+/*
+ * Bit 24 indicates the GPIO data source is from a remote device.
+ * This is used in serializer/deserializer setups where the GPIO pin
+ * on the local device (e.g., TI DS90UB953 serializer) reflects the
+ * state of a GPIO on the remote device (e.g., TI DS90UB960 deserializer).
+ */
+#define GPIO_DATA_SOURCE_REMOTE		0x01000000
+
 #endif

-- 
2.34.1



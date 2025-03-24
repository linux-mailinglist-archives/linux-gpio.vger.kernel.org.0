Return-Path: <linux-gpio+bounces-17888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A0A6D30D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 03:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DBB73AFF20
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 02:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A26918893C;
	Mon, 24 Mar 2025 02:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WLyvwy/S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26C717E473;
	Mon, 24 Mar 2025 02:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742783298; cv=fail; b=IgjpdFxl+7q1b5l/mYRmZaUS9eGs1QsdqpdSWsLPqTXTJ7SEc8cHssJPFlpUZ9i0eT42jMGR0Pf6baQ0JFIXfWZSAJibVCzwa82qj0AN+HKgSOGdGaUmMuhMV5u4AxqMBYNjKc1w69x4+Ry6KjvKoE6Dibihqck2evk4GIb3gbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742783298; c=relaxed/simple;
	bh=pCZv3a4HKoCo6tTULZ/T7f7WdQ66pPWFRweWebAtzs4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iSHSwTsPvvRARiDs6+BN4aJ83vivs6IbabLQTkw14W0A4Bky8xOxCEdMW5wP+K/6h1oiYzdQ5Td+M2pt++hhV09UtkuDhJ/pEFoQm+8v0fOsbFua+IO6lQhSgoEvChxxiuDyTfEpuxOdaFYmrfFtSSB2gLjeesRqVpBjjAnUfkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WLyvwy/S; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUUVZgP4OQxAswXYC189NgbCIi5Y39RDPEVl4A8ugCAhQc1bXradaiwr9/dzGX2wY9Kr+1npfNEja3Z127vdv3mhTF7YgzgK90TEHXf6grH3HdHoN4PQmfxU+fQnSDgpzRMN1CGWcNjsGTj+V8RMrmTR77aSbxHZoFSRQdsMEZUGuzNnGaj2hHGXoeqUIISzIs3YLia2lGo7risFfcZpGfP0ehiiEenS/gEsWmLKxgJxp32Ne510TM7z3URxLwYeDNE9qHnHcDMBLNxPm4+Z3YIjD11WcR31xq9cuO2fAOugOLHjp6QP5MCtw8HVFoaNW7SDWe0z8ZL6CcDeIaCvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEUv2j/WYz/0UQb2CW3Xs6/R7GSMOigLx14jpL/CkgM=;
 b=Y4Qpvfee18JIlw6LeyAwunNR6+YYv8g56i1X26QNy0YX/IuCALU5KxCfuiZpgAxnuM/DBrZjJbyiSXHxJU6GqPyY7sBFvG14/LUNOqKASx7QN10uxgrOZTSS4k76JdcQjwkMXrRfH6FhWU8mvAiXpP64ejFZZXgGe2L8SBhlz/xo36EAqHvbQx64AdFuW+/PHDownbsqu/CTkDQYco82eEzfTO5L54DLCwbKpmuORyMAK9KAX1knAc7LVHjCodet1JsXJWk9dbxWJMCQ8Csv4uXdgDEoAgMl3ktZ/uYilJ8L0dK8yO6u6UjoXzQGf9pzi6080GGUr9FOzswPylsqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEUv2j/WYz/0UQb2CW3Xs6/R7GSMOigLx14jpL/CkgM=;
 b=WLyvwy/SvAHUsf7DOPTp2FXnOCOzIHy2hGcjx0YqDYCxnUtGSQPK+oltOOThi8LysbnxHd+7VcWbtMHqdOPwxu61sFjiwKqyIi7weQ1uEtfCZGctuLqrGDLKTrAzozDOoZ9DK7gqjk8gWEZs3OPLhlitwwwtMX3fchDqrIwuu/5QRX8WD9Nan9ns3z0ntXs5v2ISBtud+QQL4dNdEI0WkX3HECsoBM0oiFl0G/kvwOuhOWEvRfmS4OuTtXal8c20S5lzI04PsDoa3uG+hFgtEDui5XHF/XCUpm6nQMlxJf5l/ymWnsa52NvPYyarh3kuJcB4A115Ux8hOJp4mvOjgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 02:28:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 02:28:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 24 Mar 2025 10:26:56 +0800
Subject: [PATCH 3/3] ASoC: codec: wcd9335: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-wcd-gpiod-v1-3-27afa472e331@nxp.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742783224; l=2351;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=w2kpHxzjhH5lUjvoGiVgliajpRhAKVQmnpgnfgKcfec=;
 b=cAGNjIfPTUMhCpIm+mGG29Y5M1UIfDYSN+SrEJSSkVz6KCJoFPCz/it6mQv89YFQUdWfJJgxo
 fPWTcDbkUwqDJzovc3BBRbZYE5i7iz9NHTOBedXOYeHnbmgkooSTeeg
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 463e1f84-9e43-45b7-6f5b-08dd6a7b8676
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFdiaDdiYSswa2lSMndaYmxsNzRuNjhrN21WN3dsTVc1TDRaeFl6UlQ0K3pK?=
 =?utf-8?B?a3phU053anlKU3AzRkJlSmc1YS82STNHRWNMdG5wVXRKMGRHRmZpU2pTb3Jz?=
 =?utf-8?B?MlAvMDVGS0tLQ0hvT0hraWFLZHRlaVBtSGNGeDNOZG1WQTRjU2t3dGtzNmlB?=
 =?utf-8?B?YVBvWVJ3WUNlc1dkVHlCWm5qY2VkdWhwck1jZHZYWG1MVnoybzI0NWQ3MG43?=
 =?utf-8?B?NTJTMzJrSGtGZ2hhQU5TZGVabHJiWWh1cFhJeTZoL1BwQk5EWk1vN3EzWkt0?=
 =?utf-8?B?cXJxWTJzZjlkcGNxemFJMUZHK01idzFyQmpIL041T2N5ZjJRbVVoeUxueDFO?=
 =?utf-8?B?aFVqU2o5c1h1L1d1a09POVg0VVExMDNjdGZkRFpUUWo2Y0JkT3pGclVqNExw?=
 =?utf-8?B?Vkp5Ylpsdlg1ajZublFFZCtGNnZlVDZUdXJwVlJjWTliU1h2UVdFQ0VOc1Zv?=
 =?utf-8?B?c3pWK3V4bkpYSmRUQWY2b1RtZWtkR0dkVkJ4RWxNckpPdUVsQVFHc3hpYlJN?=
 =?utf-8?B?S3VLeEcxSWNtRFBUaHZWQmNqaWsxdE1iY2hMa0VQUWFtY3kycGNJdjJUUzlw?=
 =?utf-8?B?ODBteVBaamVHczhIam1FWmtGcU9SK2k1bm5CQWVrUmx0VWpwdWdBVmI2TDB1?=
 =?utf-8?B?cUlKRlhCdmhmQ0JSU256cE5RMDJ5R21teEFwL1VuQ0JGL21YSWg2b2luQjlz?=
 =?utf-8?B?REl5cWxMQ0NnbEhyanBOZktmZU5uSnl1MXdBTWQ2R3d2S0Q4Mm1lRW1aVXpl?=
 =?utf-8?B?Y29aRkZPNlRseW5leGd1R1UwYWUxUUFCZDZDZWFTU2tqak1YYWoxU0hscnlQ?=
 =?utf-8?B?UStGdXlCSW1DN2YvNU04K3N5Unk3RjJQTmN2alZ2M3VvdUJoUnVLeGo3WWhQ?=
 =?utf-8?B?VkF5dDdNWnh2YU04LzkwYmsvTjNTZVFMTFpsd2hWYTNJMU8vaEpCZTJtR2hz?=
 =?utf-8?B?VEpQVUVqalNlN2xNdkMvTUloSkdHRENjTnNTWmRuN3htNFdRSkZnZVhoWHcy?=
 =?utf-8?B?VXYvSFpxY2xSWG5OWDFqY29GOWtYYWFKSHVTd1R4ZjJmNWFWc0dibnV3bWJG?=
 =?utf-8?B?Rlp1dlQ1aUlxK3JIazQ0b2pUYmE2NVdGdERCSTFQRk1Hdk05ZGZTbVZOcy9r?=
 =?utf-8?B?R1ZZYUVKYW5hNkNsYnJ2eFdKYnRDTTNQM2o1VFJrZ3RoZWU4RU5BckZEME00?=
 =?utf-8?B?STdSa2l1MlV4Rzl0a1cyVFkvTFByTVN0S2Q5aUZXYmV3R2w2RU9zZlJBZXdB?=
 =?utf-8?B?OTJxYXpxQ3dvQXQ0S2pwQjJtMi9BNnF6eUhPTGl4cFpLVzhlaHREU3RBSDBX?=
 =?utf-8?B?T1R5QlJjVzZxWEFlYktqcFhrRTdFUXZGMWltN3VxekhBUnovQVY2K0wyWEtX?=
 =?utf-8?B?TWxGWFZIdGRIdS8wUlZnMXMrUUhHN1loeExPZzdaVDBmNjErUnVnT1F1aVVp?=
 =?utf-8?B?Y1JvM2c5R3ZLSkd0U1FiSHhIR1F4WEduL1Z5TG1MUkJMTlhjWVFWYzl4YnpF?=
 =?utf-8?B?Y2FJUkQvSkg5UWN3MGxEMmhkcUVHSHNTdWsvbXVWa1VBanJiWU5rWmFtYlhH?=
 =?utf-8?B?bTZleHFRV2QzTUE1ZHdWWjJsSEpqZ01rZ01mSm1JODJkc3ozTTkyZk0wVnJT?=
 =?utf-8?B?WHdScHFtc1hvRlRVdkVrcWYvS3o5c01MOFlxenRmRUVXMWprcDEwT2RjL05R?=
 =?utf-8?B?RWhmUEFJR2Qxa3hIR3lpY3dsbWkvT0lERU5NbzVueDhiSDlueXZqOTlFR0da?=
 =?utf-8?B?TTFUVU1VckVHbnZXZENlREZOYTZqM3JObEN2WlhkTG9NZ3I4c3hDMmZZek5Q?=
 =?utf-8?B?eU1tL1RZajRIZUwvMkI1Rlp5Nno3S2hPYm1CbFdxZi9UR0x2ODlINEdmQVgv?=
 =?utf-8?B?eFQzU2VRYTRWLzZIc3NaV3F1amZzS2doRlJ0em90SkU0QStGd0VUTXFmY1hH?=
 =?utf-8?Q?4rKgJJTr/AKEcYWgfdWcUrMIpqpMPp8m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1VWZERNdUo5YURMaFZUdm1YZjFEeW5UdnJpODk2MGJ0NmFXL1NIRmoyUk03?=
 =?utf-8?B?RkUxVys5ekVRMFZmekVGZU9hTWdOZVdlL3J3SktrVUowLzhncStBK1F5OWQ4?=
 =?utf-8?B?elhPSlJTblA5c25TK2tUNXdIOEVoMDFCdDN1UHUrRGpUOThuTTZnMnNqMzdr?=
 =?utf-8?B?TFlMOGhqTU15MHBobUR4cjNBbXVRYTZxYTRFVHdkUXJ0blZ2QUxyR1JHbkh3?=
 =?utf-8?B?WmR5REwySUhubnhRZlM2Zkt0WXBkZ0tyQ2RFRGd1WEdvNWpRVGlpN3h2MEw3?=
 =?utf-8?B?bGJ1ekRXaUxNaVppVCt6dWRvZGl3SjNHT2xmd1M2ZVBqbWN2Vk05bWFOSEFQ?=
 =?utf-8?B?T3dRQkVjbFlxVzlNRnh0WEZGUHloVUtSTU1YSUVUSzl1TFFtZFpiWDl0VFpW?=
 =?utf-8?B?R1JFS1h5MTlMcXBNaWFJUWJGK3VXbVQ3UTFOS3hJUlF1M3pnVUJwQzgrbGth?=
 =?utf-8?B?N21zNVhBQmlBcVVybVpLdVhuOVV1K2s0dDN4WVpSWnA1bGw0ZXVHMmVtRWtK?=
 =?utf-8?B?ais3VWdyVXBtemJjbTViT2FzRzZaalAyWHVlZGI1d213ZEthVHhrL1VVYTVV?=
 =?utf-8?B?TDBRaVpqcjhVK2JMUWprNWZOSjAvL0tNc2kwSzI1VXAzeFRqZENWQTJLb1RO?=
 =?utf-8?B?Z05oVDQ3OWpnbW5oTDZJVU9GRHFuOEc1L05HVmN6Zm5nU1dmYUdSUUNpdTMr?=
 =?utf-8?B?TFcyaDlHYVRQTm1PRkJaaytGbUxXRjR4TkdBOUxwOWlkQzRneHkvVHNWUVZ4?=
 =?utf-8?B?RnBXVXA0TzNvVDJhSEZlS2o4V1Rxei9yeXhIaHVGSlhteVYyY012ZnFjSHNx?=
 =?utf-8?B?bzBYWUtpV1RsYWFTaUNjQVJJWFBKNWY0N1hHWGNlaFI0RjkrS0NmSUNvank2?=
 =?utf-8?B?eTFNd1F0bThpVkZJRlA3ck9xTG40RFNTRFd2eVMyWnVGbWhOWjk3dnhTODVr?=
 =?utf-8?B?NHgvbHRSMXhMNmRJcnE4ZDgzVTNiNFFXVmdSYUZvL0p0dzFhaHJqY2ZRei9V?=
 =?utf-8?B?c3VWQzFmSWtoYWFGZzFZbUNBRmEvMXVYV0s3YU5MbGJPNmo3SHcyVzhJcFdC?=
 =?utf-8?B?QUl4TTdzVDBML3VlQVRWNVpDbE83NFdSVjQ1OFFWTXNZU2lvdnh5bkhjS2x2?=
 =?utf-8?B?SGQ4dmZldFZJcURjNzJTeE9UQTRUUkV0R0NyWmp5ZE5MdkFNelVwTmdRdklk?=
 =?utf-8?B?VDdGcDRPS0dOZ0RzbHZ3a0FldDFHUnpXWHJ5WC9ZZkJRRzVTVlhwdDBiNHQx?=
 =?utf-8?B?NS92SVRFaVFPUWFyV3NQY09keFpHMzdQSW1hN1ZCSVJQV3ROOHoxOWZrc05a?=
 =?utf-8?B?bElOZm5Ib0tPSzVMMnNpL3BkbXk1VnFYRjFNK2RvMTJ2KysvUDA2dUhVU0Iv?=
 =?utf-8?B?NXRoVXJLak1zZStSdC80alI1bE16Z2RXKzlvdHNWSkQyUDY2Z1VTd3Y2TnE0?=
 =?utf-8?B?V3l3Ti9UN2hWNzArN1BBOGd0Y0tMWjhqSFN0cDVBNHZyWlJiUGVXcUhKS1dP?=
 =?utf-8?B?Q1JtSWFEeEo2MjU2SjY2UEE3SjQ2SWpnMHRhRUtMbVYzZWpNZnMzMk1ZUURV?=
 =?utf-8?B?OEk3VWFweDU4d0krMWt4N3BXalIxeDh1a0kzVk9HRi9SZlZFQXM0bVczVXhF?=
 =?utf-8?B?c0JMeE9Ud21aY3pHYytyQkE5d29ZdTYzcnpSaFRuc0h5YTg0dVN2VWgxdTFZ?=
 =?utf-8?B?ZjNMWm9hcFFSb0hiWmVNOHBzZ0xOUGdzUCtHbHBXc0YySmxVSjYySmt1MFV3?=
 =?utf-8?B?bkNtVHJRVVdhVUZ2bko0MFJEQ2VBU2k5cS9HV3VmQzdLSDVkSFkwdUx2UUVB?=
 =?utf-8?B?dVh4WC9VaHJmK2pKZHVmaC96WkFtTG9SakVrbndqODlrUGdCcUwyNGZ4VEhH?=
 =?utf-8?B?NzZjNVVqUEtJbGVTS1JpYzk3dHpRNmtIUnN4eENyUExndTBzdHYzYVh2cDNP?=
 =?utf-8?B?dkRQMkdRT2pzWmhpWGhGckxIR2VmM0R5QkxLRWFaK3VaZi92SmRWd3dRSXk5?=
 =?utf-8?B?UDFpRllOQlU1T2VPUXhKY2RneHFVVWZEOXNVMnRDYm1oeGtiTTY3UnpiKzBx?=
 =?utf-8?B?azNvQjFibks4NEVTVHJEQ0d6Tk9hZmhqSHJEdEwxS0JpelhsS0VoWU0vQ2Nw?=
 =?utf-8?Q?Ysxb2dQLjuRMfDHrz1Q8ML4if?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463e1f84-9e43-45b7-6f5b-08dd6a7b8676
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 02:28:12.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI80whXRIhgrKnK3pEedIMobPZdhw3Sw+ROkGO8bhZHmgU52gR5OJ7kxGGjFCFOJM0JpFYPuOOrYp0E7R5BD+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
- Use dev_gpiod_get to get GPIO descriptor.
- Use gpiod_set_value to configure output value.

With legacy of_gpio API, the driver set gpio value 0 to assert reset,
and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
output low, set value 0 means output high with gpiod API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/wcd9335.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 7cef43bb2a8800971604b0e1ac55aac26c5919bd..90cf4f79cbde5f704549d41771f085574045ff46 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -17,7 +17,7 @@
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-dapm.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <sound/tlv.h>
@@ -331,7 +331,7 @@ struct wcd9335_codec {
 	int comp_enabled[COMPANDER_MAX];
 
 	int intr1;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[WCD9335_MAX_SUPPLY];
 
 	unsigned int rx_port_value[WCD9335_RX_MAX];
@@ -4975,12 +4975,11 @@ static const struct regmap_irq_chip wcd9335_regmap_irq1_chip = {
 static int wcd9335_parse_dt(struct wcd9335_codec *wcd)
 {
 	struct device *dev = wcd->dev;
-	struct device_node *np = dev->of_node;
 	int ret;
 
-	wcd->reset_gpio = of_get_named_gpio(np,	"reset-gpios", 0);
-	if (wcd->reset_gpio < 0)
-		return dev_err_probe(dev, wcd->reset_gpio, "Reset GPIO missing from DT\n");
+	wcd->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(wcd->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(wcd->reset_gpio), "Reset GPIO missing from DT\n");
 
 	wcd->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(wcd->mclk))
@@ -5023,9 +5022,9 @@ static int wcd9335_power_on_reset(struct wcd9335_codec *wcd)
 	 */
 	usleep_range(600, 650);
 
-	gpio_direction_output(wcd->reset_gpio, 0);
+	gpiod_set_value(wcd->reset_gpio, 1);
 	msleep(20);
-	gpio_set_value(wcd->reset_gpio, 1);
+	gpiod_set_value(wcd->reset_gpio, 0);
 	msleep(20);
 
 	return 0;

-- 
2.37.1



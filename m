Return-Path: <linux-gpio+bounces-14935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99196A16729
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 08:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A66673A1BDB
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 07:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6363818FDC6;
	Mon, 20 Jan 2025 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mtRUcaXs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1820118F2DD;
	Mon, 20 Jan 2025 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357277; cv=fail; b=QMKPCaUBlDWEc+nBk9AGIyRKDG4w0wBAua/7h4nhWPZw3ZSiuZoX/L30o2NWUK4u9wlIc56ruBv5yqKI11DIc9EOdUH8kCYDmmJn3q7yL7g0qIClVKONdNcloJsZeL/eOm2rZTkS7Td2sHJAjP3qcmVRyH4xdbaQdSlGj5A5Mjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357277; c=relaxed/simple;
	bh=1KRQeOaY0NwsChU3zgWJrihWfOJfb3GZxCctaJQQjiA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rFzWEZTAcXmKKOJm8obvm934o0WXWTmpqnx9+MKOG+tyAcKqyE5+8SrtIv3xQBst0wGNpqvSBr15csMHZliBV8gjEjfgGjOGkQ9YUiyXG4/dDrs+wye27Tgo9XgUHV9N5neOUmJz8otWKXZm46NoQzelASid0dZwrP/kXoT6o0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mtRUcaXs; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcKlGYpBVnwrbEOqQddcyWWESD1EpEpPOZYJQL+5aZfTw5EzcDOl7zL4aO9o4wo3QA5IHOqnYFdFhkOenPQuDQJk1TH3HkE6jUhpfPYXaZS+fb+avybi+S/4+6OsV8gEwEzog3cu7Ls5lqoN2fir7ZXcMKKyzQTUJkKrAW8Eyxe5GzlVXQF1Wf4jnMNQzh2+0yjGkWx0B82XZtmIQW++WJkwsWWXTg45yoH9OGyyam6w9gAXSQy73GlrBDNpsDUak12omubUXgU06qjpRPujr9OMYXBgfHG7lwYDaH7HpHRYmCE36FGlzB0LrTG4fLm6Cmg4KCKHxO36Exq2B6bhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erx8eVIlp3RSDPcLYTeD6QYzg9uYKWXIG1suoWmMaWI=;
 b=SKSQ5m3KDF4ej6uLrMC7CvJglp14LVENg3P0R/fVcp8G7uLqrm44FTo9c5sGsCMWsRM2G3mgCa2AWby0KlzeafI2CvjTYRvn6kJ89D9rx0fbuQL3aQA8YHbAyzZvGigABRbye+jk16uxLaJjFdoIYTPSXMQws9ZNfQP+bP206/1CXFLArIOIsYSyd1i32Amt8/pQkvVI5FD51bZmeGZd/xCltxcmckAyCtAgw+0Rt72QEKj1BSug3gDErKzha5BmpOwF8gPkOG/1bS0XDFg0XFPlvcwpCNlLVRl8GTv0KKIsxteD5mjICJy9bQAO5oVcj3eIWPQmziUqQ24qpEwWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erx8eVIlp3RSDPcLYTeD6QYzg9uYKWXIG1suoWmMaWI=;
 b=mtRUcaXs1Uj2BBDlIuVm+aJkDG2+pSTtajqihR5QXm63XA74uDYEhqO+XLQr+8k3mvjAt8CTYJjFW/i6AMpCAVb4NOySkzTy5kLKcAsQ5UPA/7nkn4QI5u0dOsUUTz+Z4z0Wo5gbWioGR2N2p9dvKTcHvbPU5wvdEHKmxVmuj26chbIBtdpPwRXgMVqL+hL7XhPwkiU2lpr/eknd8zQz9TwlsiHkk+Z8A39ZsQSBANTFb91LfG+di3ywGXOqLjP1dUugJW/jaLPGaBvF/C28wFCwdCDqTDiJOd8WJoTHgb9oJTO93em8gm9zjhY+PJ7zNNVnY9yG/g0YCN0UCbuafQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 07:14:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 07:14:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 15:13:29 +0800
Subject: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for scmi
 cpufreq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737357232; l=2383;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=TTcs1ka8AGza401JDsGE2qHEBDq+jKflhkDqiuEGx+Q=;
 b=1btUXnBuoQIXcElwpFmt/LWfmSpOvjKwRqA7P4VwXaKv7QpbsJCY1xXjKxtfoMKw0L1xj9tGs
 rqA0MRmQE18A7oVFSZgfW07JGdpYijAMYCdc3US6Y819BxGd9RU9x+a
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 2886f9c7-c03d-4110-51dd-08dd392214f7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnlqMGlwZ2ZEa0xQZXNpbUlacCtTeUxGdy85aExuQVdGbFloL0wwSDJaK1g5?=
 =?utf-8?B?bkhEdlgxY0FQNnJmdlBzVnNYRThJSnFlblVOTjF3bWplSGd2ekRhejlFaUVK?=
 =?utf-8?B?aHZPRU9ueHg0QlZvYzU0SWVnUHp4eGIwMHVoTnk3UEpOeXhpMnpZcnlSRmsv?=
 =?utf-8?B?SVgxL294MDNnMVl3TXpwVU41a2RWV2tuVEVQdEQ2QU12MTExNytXWnN0b3hI?=
 =?utf-8?B?VjkyMWZGMXJ2WmVCNHg0a2FxZGVzVmJieURwYkhZQWg0YkR3NDVyWGpxdHFR?=
 =?utf-8?B?Z0lEZEpSUUxxclZDckxCSzJySFlnWUVVblZXUXdFZThmRkZqeTA3VWJ3YkRs?=
 =?utf-8?B?eXdLbERNbzZjWElrTHR4eUZHb2txWmtzN2VjNUhxWVNYSGJ4cjNBelVGVC90?=
 =?utf-8?B?SXJqOUk1cnQrQy8rbHJ3dFVkbnFWQkNNc1ZvZ2J1VVl2QlJNNHBMZDd0d0FM?=
 =?utf-8?B?RXA0Vm50N1Ftb1dQMTBObmVaNVE0djI5WnMrR0Y2cGZXcjRnZnJMeDNsWmRN?=
 =?utf-8?B?VUxJaGt5Y0NIYWRhc0sxRTBYaTZIZEZUVm9GMmdHd1oyb1pSVzVBUHpZbUxq?=
 =?utf-8?B?ZVJpTDZYUmp0U2NiaUpQbzlKSGt2amxvdmVLem9idXR2RHJFaElRdGxKZjlQ?=
 =?utf-8?B?ZUpmTUsyK25XUlV1bUNFemRURlUweStqYlFWdFoxRHNkRlN3UENoQjF4SFc0?=
 =?utf-8?B?aFkwakxIM3NheUw5Q01XTFZwZk1ka2tKWGZUbFhtZDJGS0ZlNDRwczNUUmpO?=
 =?utf-8?B?aFhvSE5UVCsvK1FCd1dUaWU4bHZqelk4WnBCSjcvRkRDL3ZkWmo1OHdLUEVz?=
 =?utf-8?B?RGNhdFdNeUZ4a2hwRHZGR0JGc2FNZW9GL1Jjc3Y0TG5DdUFnc0hPeU82NGxx?=
 =?utf-8?B?NGFVZGxKU2o1RnlIdVlRUUV4bWNGYjZaMFVxOUxGZk1QRUI5SWNDU1FuZGYy?=
 =?utf-8?B?T2NFRVNHdllhbXdtdVhYTkxDMHhtNVJVRzhxNXpoZE82elNqRGEweHc5ZUpl?=
 =?utf-8?B?UG05c2lGZkF5UGdzTjEyWkNhUGNWRmRSY09xbVlwcVNiNWdMSDZFT3FDNTVU?=
 =?utf-8?B?ZjFOelN3MzdUYThrUjZqRUdFaUFQb0hqMEs0YzJQRUY5ak1Ybm91dGlZVHFI?=
 =?utf-8?B?MVkvalVvMURBVmFFWEcyU1N2S3EveUJOT2N2ZytEVkprTFMrS2doTXNnaVdF?=
 =?utf-8?B?ZmdPc0pQMlVJZm1JeFF4MG02em1UdHhJSGlZNkhhQ1IwVFdUYWx1WFR0b2JH?=
 =?utf-8?B?YldHd2NLWUpLeE9qalJrbzhic1RaWlBNUG1YMFZGTWRuSmF5VTRHR01nVlNV?=
 =?utf-8?B?dkNpdFZ1Nkw5OEtZSHUxNktXNEFJcVZpNFJubkwwNEZwaEEzZ0Qzc2dmZThn?=
 =?utf-8?B?L1lKOGVZaDFNdG9XZEVGdHZOUkZZUjBDSGZmdFpjRHlHQmlDeVBDTm55Uzhv?=
 =?utf-8?B?dDVST1JxWktIQkRXbVhPbkEvZGliT3BSWHA2WTB2OVlpYW81YVhmQmJ4cHBi?=
 =?utf-8?B?RnlGQ29ZemdkZWZVR1lnMEFzVTgyVC85QUlTS2VtckQ4eXlCL2hONVQ3RVpG?=
 =?utf-8?B?NytKMVBycUZZNmZORkRWVkpuOUJBajg2bmtxQkc5UUJvazFJQk1veGpucll5?=
 =?utf-8?B?SlY4UUlFdmNFZGxTRzNCNUNQaTBTTXBVNGoxemNYUEhvbVZpVmJmTG1LTmFQ?=
 =?utf-8?B?WVhQczM5QkJVcXVWWmFUVnZQRkFTdlN3NE4wbDdjd1h6VTJUZEVkVjFVSE1m?=
 =?utf-8?B?TU1QZ3lsY2IydWFTUHM2UzNqU1VGK1U4cEZTcUNmWEZxTmUrS1loUWNsWFp5?=
 =?utf-8?B?dkdsMnhXeUFTNXFHNkZvWStka1E4OWM4ODRseExualhBc2VjM0crT1JLM3g0?=
 =?utf-8?B?b0VpeUdMSWNiVDRJQUkrVDkxU2RpV0hTdjhFZWl2cXo5cXpRUjh4d1RlVGxz?=
 =?utf-8?B?eHVIQmIrY2E0QzEwYnNQSHNkaDVFSm1DdkkwNWRsSUd5bVA1eTJJc0ZCVUh1?=
 =?utf-8?B?eHlrV2Rwazl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmZWVXVLQnVxd3B4bWNzVklVRXFrYVhlMEd0RHZYSmltNmhMMTltUHkrZWxO?=
 =?utf-8?B?Y05jekJtNGY2SUV5NFdnZldkeFZLajdTaXArZ0tyUkg2YUlMTVcvODQ5Zzdt?=
 =?utf-8?B?eUNjdm9GNFdMWHRuNEpwWWUyc051WCtXdHVHbDVTU2ZKcFI4b2tnaDlxczVF?=
 =?utf-8?B?enFnR0lIZjR5cXhoeS9QVzNCSVk3UXMzNXpGUTVVV0R4SWt6R1paRXZ3Z2xE?=
 =?utf-8?B?NGJFQjA1UmZmeVdYMGg5ODVZUUdXNEFPNFR6ZTFsb0swSEk3QUVXeDJqalBl?=
 =?utf-8?B?amJJM1RERHB1QjdRMHY1NjZFeHhXQnVFUzRTM1JObFdOcmZDbnR6OHFNclVi?=
 =?utf-8?B?ZS9ZWlhkRmh5OWVramd4SWRlMjJ4WTMrYUpCakxGYzFsaUNmNlRpTlhyL0xL?=
 =?utf-8?B?SHlqbzBocitqcU5BOUVVd0dxRzBucFphUDFwTmtIblR1UndzemFPcldPdnZO?=
 =?utf-8?B?dVVJUFh6eStCMHFNZzFoQ0FnNmoyK2lKV3VMN3RwanZTeGFHSDRjQXdDWG9r?=
 =?utf-8?B?ck94MDY5dUlwbGE0ODFIQVI2VitrSHhDcVppL3B2Y01LQVh5VzNkWklmbGpJ?=
 =?utf-8?B?a1NZakZGMVFQN0QvRjJ5VVNKUCt2aXFrbVNRbXBMY0RnblNpc3hMcmtZRkFP?=
 =?utf-8?B?UUdEMnY3MmhneVE1eXhPQ1d6NEh4UjdMNGRCaHN5K082ZG1NRWRxSUpUTFJG?=
 =?utf-8?B?RVNxSmNOQlNaUkg3RWZBSWVLRFdDQTdwaFFqaGppNkZTK1F4U0ZJWVlQVGlX?=
 =?utf-8?B?UlFISnorVzIydTVXNlRPYXFyTlF5dVdxazJNYU10N1l5QzdZbTRmWmdiQXAy?=
 =?utf-8?B?d2tCNTU5YmozWHN6dXdZUmNaQnFEOVM5RUZRVlBRUWxXcjI2NnNFUVd2NUxP?=
 =?utf-8?B?WHlKYzZSU3UyMk9nRVhrOVgwanpsRUFtUkJiVkFHMzB2VGtNdmQvaFdQRmVK?=
 =?utf-8?B?VzhkYWpIb1d5dm56NFIzdVh0TjJ2WEtiYkNiekhUWTFqSy9FRWUwVlQySEUr?=
 =?utf-8?B?OWlzQlZvb1Z4TDJCZjZHbXNOZzVYME5FdUJLWTgvRFIxNW1uM0RDc1FKWms3?=
 =?utf-8?B?c0lCMFk0ZHRRRE5NR2I2NFIraGh2NkJ1T1R5L1N5OTNTL3liUlBlRDhNTW1q?=
 =?utf-8?B?Q0NnVEtwd3RlN0Vob1JhMHFISWo2cDl6TmxmQWJCMHA2cVpqaWcwOXZmT3RR?=
 =?utf-8?B?eXBJUHAwU3dkdzZxT0JIVDBINkVmOEZ5MTBLVEhhU2gybzhpcEl2bi9USmIr?=
 =?utf-8?B?U0ZNWHdtSWRwRVNEbzk3SVZ1eU9xdFdJdVhsZ2lESUR4SWF5aGhLRHpHVmdT?=
 =?utf-8?B?azB4NzkwRVI5SDAyOW0xekZySkZXTW5NdHplRGwvbmlYRnFpZnE4TVJmemFU?=
 =?utf-8?B?eFpUZkZKbjJ1dlpDdmcvaFA5WlNDend0SURZbGdldXRxazNpVG1TUEd2L0tu?=
 =?utf-8?B?c1V4T3hYeGRHZkRUUExlNjRGR2N2R1FFL2VmK1dZU0hxVkE5dVQ5YmptcG5S?=
 =?utf-8?B?ZUhXaHNoRnl5bEo1TDl6SjI2cHl2UWZta1hLSmw0b2l6MjgxajZDM2tvbnJs?=
 =?utf-8?B?Q2xFakRHMDhvdlB0T3YrVmZyWUFuQ2tQVWVkbVU0TzBONllKSVlveVRvK0RF?=
 =?utf-8?B?T3pvOXBiclNVNHpDVDg3c01nWHBSdldleStpZEhtb2FndDMxalV6bnJOUEJx?=
 =?utf-8?B?dkxoM1RTMGFSNWdidFB1bitrN051dGI0elMxMkJPK2xVc3pQVTlGbmQxdmRz?=
 =?utf-8?B?R2VNcStUTmlqbzMrck51Z0dHT1pISzlqZ2NmSTl3d1ZuNGtLa2dsQWp5K0pM?=
 =?utf-8?B?TnNtR25USEh4VGt3UG1UdDZMSkE5bXFlQVZJWDR0enpETWdtemN4N3psTDNK?=
 =?utf-8?B?dGYvSCtGVE44NlhOdGpUTThOL25YU1I5SnQ0TGFNdWhHVFAvVURmc1Z6U1l2?=
 =?utf-8?B?OG1wdCtRTldmRFhkRlJUc3ZuYVFpUVJ1WjVDU1FnTHczMVphNnhUTytZT1g3?=
 =?utf-8?B?cjE1NmdHSFdyVWwxL0w3a1p2VmlUL1p4TGtnSmRWTzFtanl6SHgrcXkyQ1FJ?=
 =?utf-8?B?T2NTQzBpWHFsSTVMam43WUpuejk3eTVVTWpWT29Tb2o4NkxZLzR0eDhKMHhr?=
 =?utf-8?Q?1DEJlBxQmWz2W6rddpyxCI7uZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2886f9c7-c03d-4110-51dd-08dd392214f7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:14:30.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZJWl8Y2QBWHsU/kTRaI83yyKJCEToKmC2v9xd08BH1L2FQ4MgBg3+NRHD0XcAMC8Ex195IYWjimiK2LfUqbKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442

From: Peng Fan <peng.fan@nxp.com>

Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
will be created. But the fwnode->dev could only point to one device.

If scmi cpufreq device created earlier, the fwnode->dev will point to
the scmi cpufreq device. Then the fw_devlink will link performance
domain user device(consumer) to the scmi cpufreq device(supplier).
But actually the performance domain user device, such as GPU, should use
the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
the GPU driver will defer probe always, because of the scmi cpufreq
device not ready.

Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
for scmi cpufreq device.

Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the scmi_device")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/bus.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	device_unregister(&scmi_dev->dev);
 }
 
+static int
+__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
+		       int protocol, const char *name)
+{
+	/* cpufreq device does not need to be supplier from devlink perspective */
+	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
+		scmi_dev->dev.of_node = np;
+		return 0;
+	}
+
+	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+
+	return 0;
+}
+
 static struct scmi_device *
 __scmi_device_create(struct device_node *np, struct device *parent,
 		     int protocol, const char *name)
@@ -396,7 +411,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
-	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+	__scmi_device_set_node(scmi_dev, np, protocol, name);
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);

-- 
2.37.1



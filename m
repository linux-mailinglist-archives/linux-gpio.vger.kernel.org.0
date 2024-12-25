Return-Path: <linux-gpio+bounces-14229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEE99FC411
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 09:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6DD07A1815
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 08:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8E814265F;
	Wed, 25 Dec 2024 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="edFRq4fT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2077.outbound.protection.outlook.com [40.107.247.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB025634;
	Wed, 25 Dec 2024 08:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735114884; cv=fail; b=shd+vD7gses8OdLyJiJIMhzu8IS2lEZfhyoai1M4nbzUVmLhQZoKAoEeU7WYVab9ELZ8Qj833pUzczqIJxVXKy3itSNzmlAXdl1fKe4nys3l9xgHxbJD4ywbbtKp1OGlzX1Z0NFlbdC6XdTy3W/woOa78TbkZqWNsXurkfBTK2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735114884; c=relaxed/simple;
	bh=pBDQOWh6iI+45zNi7juhRvgB4oMZ8Oq5fm588GU35AM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dQmeOsO69jP/3wd5zNip5mBxExZ0c8qq+3koBOQvyCDN9rH5Ku0aiquSpq87hul2JzUVCx983fYk0T9qHNCHYU2crCxgL+bUmltgeXtjzQH2sRjPE8IugrgXfcAKXOtNntmf+AbbXCGaojT91Xx++OXcYa9LN+notQrNGH1KpVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=edFRq4fT; arc=fail smtp.client-ip=40.107.247.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOjtzf/Wf5pGLh3b4bxM4LT7tfCoSPO2aj+DCvb0SzOjcr/T067wUnqimdKC3CiboayztsUsFegHxoNoP06L5vlqdwm+RuOi+LBkUMAfvIV1ZoqEaLVTdxSQ60SULkD97aKtaMcXYcbEbkyCsN0DxwHkqRdD5S12xWSp3fkLyNQSk4xGQw73j/Nk9+SDD+w9DNfFvX2vsUrhMrAECJj8aSOvEW/dRgfE6wA0mcKxN/SZIqdbKMt42RIne/d7qsk0FsQv9l+0ElEIgJ3jCnuzDUfKghZrvNcRYi8cVXjgrktO4U7CvBpU5A5qeV6loJ2zxxxENgmawHPp1TlWHe+Oog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFdknnh7HdY9YpgH7rLFMSBs5V/QHNvpqvEC6nvYU9s=;
 b=clnQYntLuXBPYKaWp9wAPb23KO3JJupYDMI1hNN68iIqNg4Y6DboAlh7yM+87Ear89TcboxsILD99PRYzCDBFz8mKQeaQbxS0RnYYO0wJzXtMddmfQSk87PRU1TEeqkKBzKpG8W+Sd+kgjfpdzvU3SPRXUh4StL1uuQcFKvRwa+o7P/fV3qk6ofxap3PkEVfTiv/V/hOhzDCWQ+vaKgUz+vYFoNluM87iUp8koTZHVB9JO63DzyBIyMhEZjQyYk/rX+ZORDoqLZv2DKOm424kTXakOHWoMnY3LyLUFM6E35NaKv24ihzHelWSJoF0GXZHnfxbTsDBofWwz8k4z6/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFdknnh7HdY9YpgH7rLFMSBs5V/QHNvpqvEC6nvYU9s=;
 b=edFRq4fT7/LVOLP/TXjrx1j2mdB5ps3m5FqL04HDVOytEJdyXCbMa/TTKNfiWTfOIQLlBzEhIlVsMTImphjmgMFPiaMdVjh8dFRTHxjMviGSmRgRHvBNSyNUg9VM0KwGA3jkcRflPXLJPomFESi5D3vxEbeIW+5jyUsgSohgtn1Fw+JvnF+WckPgOjVgqgsxsELF4m9FmOMh4xPX+tTai/W5GrgWC+DVSLP3QDVl7Pz0ebvg3fNwaGGdtT7Hrn+Mvj3Izr1ElPprkwQDdr7f+ic/urTCUZiXPIqSBKdyWzx3UgaUg/9GbvXr2bdEEMtimDYEdCpmeMolT+H8fKBZFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB8PR04MB6985.eurprd04.prod.outlook.com (2603:10a6:10:11e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Wed, 25 Dec
 2024 08:21:18 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 08:21:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/4] scmi: Bypass set fwnode to address devlink issue
Date: Wed, 25 Dec 2024 16:20:43 +0800
Message-Id: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFvAa2cC/x3MQQqAIBBA0avErBMay0VdJVqYjjVUFgoWSHdPW
 r7F/xkiBaYIQ5UhUOLIpy/AugKzar+QYFsMspEdSqlENAcLd1tKO/tNaDcrbNFhTxpKdAVy/Pz
 DcXrfD/yiLBpgAAAA
X-Change-ID: 20241225-scmi-fwdevlink-afb5131f19ea
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735114854; l=1460;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=pBDQOWh6iI+45zNi7juhRvgB4oMZ8Oq5fm588GU35AM=;
 b=bMo8hwOpQooYEC2cTyug4SQBNhkEmbdDezbv5hdFxwgeVA5CGqX3U59U9GNKEbePJdD9uZL4O
 5vMVeJUf6KhD6BfB4EchbR0VgPUAndVzeOEt3t1f3yixn+QNW08HzTw
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB8PR04MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fbbe75-aeb6-41f4-3e3b-08dd24bd1ad9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tmd0c2dHZGprd2pmbUlnVXhQc1lYT3Ivb2NhVEViTTAycGl1UUNxSHJzS2Vl?=
 =?utf-8?B?RXlsbmd1MFVxdzV2VkVCSnRjRkNQVHVLY28weEVldDNxcnJUSHRvdFppY0dh?=
 =?utf-8?B?R3p1VmlJRDg1SWVUc1VSL3hlcEI4SHlocTg0V0h5a3RWVHpGQ3VNTzRjMlUw?=
 =?utf-8?B?a001YVJzZElWc1JnRVdBczJ0T214RG5ENHgveGYzMGxBTGJWemNic0VabGpI?=
 =?utf-8?B?ZWwrTVZJdmxpUE1YK0tFRkJaNXJDbG11bFIyUTRSdEtLZUg5Y2FEb056WFdY?=
 =?utf-8?B?MkMrY3B0M0VlTkNLN2xkQkNJcEJtQk03V2o1Z0tBb1orREF3d3k4SkxtT1ZC?=
 =?utf-8?B?UGd1dTFBQlk0bCt0Y3VtcG9ocDlkclQ1YjViL1pVS1lBQS96alI3TVdOY1ZE?=
 =?utf-8?B?OHJPeGZKVzY3cHJiVytMdzQwS3BIblhod2hnUnJ4MVhxN3VmZlBWYlA1bXR6?=
 =?utf-8?B?UWhIVVQzYUhhTlJYcGhMYUxSb1lwUVRwUUN2VTY5R1RKUmpKN1QvRjBTeHBa?=
 =?utf-8?B?eXhLZnN6L05vOU84dG5SanA0UktGSVp4SkF4VVU3RHo0SkthbTFacHh4WWNt?=
 =?utf-8?B?dlJkb1BqYkxaRTdPcEYwRzZPYm43YkM1QVFPVVJTOUQwOXdyNGtrRFQ2STlI?=
 =?utf-8?B?N2p1ZllPdHRGQzMwRC9JenNmcDdQNkExMjZQbVZXelJzR29zaG5WTFhKb2w4?=
 =?utf-8?B?c2gzU2wvZWZZeVFYR0Jrc0lENTYzb2h6VmxHUkY2dzNSZkthVFMvMy83Q0pH?=
 =?utf-8?B?WWovVE9weDgza2RnbVd1OHdsdU5yOWVxdmpWb3ZscEM2SWlYSXpyaVpGclpC?=
 =?utf-8?B?ZGxKalVxbVNhazJFbDBpZUZCWjJQMElFdVNwNFVpQ243dlE4aGlkUVUyK2xX?=
 =?utf-8?B?QzZOZUxDd0xLVHR4VitXcmo5T0JiWTRkZUl5YXdSWklFbjVnVkhUQk1CTklm?=
 =?utf-8?B?YWJuU1lSZktMR1JSUjJQa04wS1Z4c1FadlFldjJscWp0Nlk0ODJINFdZZGVw?=
 =?utf-8?B?MUcySGNCWGJRdzJxZm1mVEpXYVJ5VmFaejFNTVBsUGZpTXJDNVE3TjR5N1Ix?=
 =?utf-8?B?QnhYL2UvSFY4VTd6UEk3TXRLYkpUemRvN25qeE9HTGR5TVpEelRWTWoreGla?=
 =?utf-8?B?QXlEVFVNMmt3Z0VyM0NpVjFjZTlqQm5HUUNkRXMzMnZPUTV3Y3hKSXRUN1VH?=
 =?utf-8?B?V0h1ZHcwendjUDRKRnZqQnRFVldhMWx5SE9oNGJGdHZqc2M5UUI4RDRNdEsx?=
 =?utf-8?B?eVJlRzFQeWd0NlFGSGdsbi8zd3pRVE1WeXgrdit6UEplSXhXSy9FSCtKa0xT?=
 =?utf-8?B?YlZRdHJuTVp2d1FlM0xPL0owSW5Tc2E1SXgramhtRWlpY2xVS24rZHRPWlEv?=
 =?utf-8?B?T0RqSE1MblhiQzRsRXNnRVRKcVlZNFRiRVRtbCtQdUhsNmNvekVmNXozSVFG?=
 =?utf-8?B?aWZEUUNpTEtLanczWHp1bnNBQ2kzVkVBT2NyYU1RZ1NneU4wVFgyTExTU3Bs?=
 =?utf-8?B?dzdRVzZpQUY4RkU1dmVsdHVtMUd5RmI0OC9ZQ0tQdmVEUS9DODFLdGIxRGt1?=
 =?utf-8?B?eWY1ejdNcS8xNkNQUmhvU3YyMVVkYkJabmlTUUxzSDNUSU9OUWNLN2p3SGNN?=
 =?utf-8?B?R1p2TjBWZm9WNGMzY1pabWd1R2t0c1ZIVUlzNjIwWGZIU2VZdjVBR2w4Rkg0?=
 =?utf-8?B?bnNaZzJENFBNVVFkS3VNVDlid2Q3TEtYZk01SUNHeHdkS2xQZk5tNGk1Y2lx?=
 =?utf-8?B?cnBKSWoxcm9rSFNaMGY0TjYrZit2ZDBzNzFQMGFDNit4L3Y2c1B2a3F4VlpK?=
 =?utf-8?B?ZktzbTVmaVYrQi9YK3U1Mmk1T0JhYVZ0Y05ZMVg2ZUZ6V3k0OGdQRzNSenVB?=
 =?utf-8?B?SjJRd0tUUHpROEEwNWlpTC9pa2ZKNmtFeGdwZDNORkgzWVZlZDhxNDZZemR2?=
 =?utf-8?B?VFMvZjVUZi9UUXk5T0ZBRldONVNQVGVBNEk3bzdHVXluaEQraFlZYWJqcSsy?=
 =?utf-8?B?bURnYlk1MHlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVFiaWlDdDVQUjU0WnNJa05KWEpKYTMwRHgwekw1VU16VlE2WEJtTUcvd1Ft?=
 =?utf-8?B?aUlscGw4alZDblpxM0I2TFpTQ3NOM0N1Z1J6dkJzWGp2dFRvUUo3Ym9jZkE1?=
 =?utf-8?B?NVE4VCtUeFk5MS9ORk9VMDB6bkhjUCtSTFluZm5GbWxsNVhnRFN3d2NZV0Zr?=
 =?utf-8?B?YzNteTI0U0Y1MjczNXpPcHpqWFNHZkxaRlZIS2RaNjZETHY2M3lVbkdqQVBS?=
 =?utf-8?B?TllmM2tmTHh2U2IwR2d5WTJHUjV4bXoveTI2WmxENldXaEIrdUoraDZtdWZH?=
 =?utf-8?B?c1VvWWNIbldSS0JYeWlFWGMyelEvNWNxRGVTazNpemJQTHhyb1BtU25WdDdY?=
 =?utf-8?B?TmFHMDdpcFUwaFdvVDltU3FsaTJTMWxSQnJKdWhyWWxSNm12dEoxbHFZUGcv?=
 =?utf-8?B?cnIrOEZuTDhhY1lYbHFNbkdDVUgzOXh6dmk2bUtaZXp6NENPV0VOM3BHc2xK?=
 =?utf-8?B?WkNmWG9tVXhyOEEvUWdRN2pmc2lwWFA0SlVNRHB3UW9TU2lickpDNm1Eem40?=
 =?utf-8?B?aFFuZ0ZQWE84VUhhQlJIODNGRTEvUC92WCtBTjhCSkVVTmNCcmZLRHBoZ0Y4?=
 =?utf-8?B?aXlWZk9nYXQwZjNHZ3d0YVBOZE9yb3Nkbm1KZVh2WHlmTFZtRURoRTRrSVVv?=
 =?utf-8?B?TzFWeldSakswS2l4WTd6UFRjbGxLT2hQMlpWUytjQlZPaWJaME5kSHlsc0ZJ?=
 =?utf-8?B?WXlBUDdvRzdtdkpoUmZFNFdabS84c3FlQ0U1UlhpQnIzN2RpTFk5YStjeEdw?=
 =?utf-8?B?Y2I3Y052ZE9ucmxMRmtUODdsMUpISEpFUlM4WkJyQ3FZdVpCUk5zK1lkWkJl?=
 =?utf-8?B?V2ZpcEVpdEV6VDhPY1hqNkljbjkxcGJzdFdlOU5NZ1RKRHowb1hUMlJPckxY?=
 =?utf-8?B?Wmpvby9BVnJWbUxnRWFjOG1pZTc3TmpZc3VMV1UvdXVEbG5RK1RWbnhNTXRO?=
 =?utf-8?B?VlNia2dFU0ZOSGIwclR1dlpWb0YvY0w1V01ERFpUbjQzbjRJcFR0T2pzY29E?=
 =?utf-8?B?Q0pKMnh3VjZ5aHdaMlByQXFCeGVMQWdGVGFQNUhwaWZ0a256V3FaTHNBMlBR?=
 =?utf-8?B?dmdCYnZTMHF3SGdQeTdNYXhrMzJrQWtiY3h5SlRvb3Y5ZzF5UUh2SVJ3TkRR?=
 =?utf-8?B?eUQvOEVQRzNEZ0VxOUtOaGZsd3kvOHZMdTA5OWlqZnUxOUhubWtHcytlM0Yv?=
 =?utf-8?B?VkVNUG94Y3JTLzNQZ1hBeGlNNzhpTkNvNzhrL2lGbEFpUXp4NkRSQ3pOSXhx?=
 =?utf-8?B?dVlScjlYcWZRN2lqY0ZxZ2wvbzFnSEZPY3dmTWRQdDg3UitlOUJsemV5WWVD?=
 =?utf-8?B?NENLaDZqQWs0UmswRmV5a0dxdWo1a2EzL3d2SCtNcVRHaGFyNnpxZTVMREVt?=
 =?utf-8?B?WWh5R1E3NGN5T1JzU1ZEYmlpSmE0c3RFdWtqdnZoRVhPeG92bUlCWUprRVk0?=
 =?utf-8?B?bEdvU0kzeEhRQUJDcFNIUjZJRmJDUkJpcW5MWGE5cGh0d3RweGJlWGxnQU1s?=
 =?utf-8?B?SDlROEpDbEVyK3o3RFd3ZzV6eFk1K25udzNvczNpZ3QxVWVGTllqN3dtTnlx?=
 =?utf-8?B?NEQrWUdTVG04YVF2andYOVVNOExNbm5qdFNPWkdydCs5TElWQjdzdXkwV2NI?=
 =?utf-8?B?cG55N1pycy92cW9QR045TWJkWTNXZ1FTYUkvYWNVTWhiZUFDK1RNR2RpdlpJ?=
 =?utf-8?B?ZTZKN0xxMnhQRFI1Sit1RCt4YVp4WjJzd2NRN3pFR2kzZkdIU1ZtWWpWVXBq?=
 =?utf-8?B?UitXSWk4dER5RjBIL1lPZkllL0p4QVU1MmQxSFVXT3VybldCcFJ1emRxV3U0?=
 =?utf-8?B?NGZ6T3MzT1JlWUxTUUFnV1lUZUpRK0QrZFZhZStUaC9EQ3BrYlJHeTh2alRO?=
 =?utf-8?B?RTFPU3BoVXVzclJpbVFHRlNXWHRDTVl1OWNRZmhzWkUwUEJwRjNlSE9BakpK?=
 =?utf-8?B?Y1dWdFcyTUFNSDZScVQwQ1BsaG9vMFk0WlpCT0F2TU9yT3JtVC9PQXBkdE5Q?=
 =?utf-8?B?YUNlYVlFRllNY3VrOVJvK29CTFhXTnFVRXUzc21FdUNUTnlTZkE1STRwRXRn?=
 =?utf-8?B?elFLZmRSdFFTQTZlS05nd0VjRDFGamlsSVFWZTNZMUdWcGwvaEg3TlFuekI2?=
 =?utf-8?Q?I6lj99gBHKjtcyUHx9eRq0mBB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fbbe75-aeb6-41f4-3e3b-08dd24bd1ad9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 08:21:17.8130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urUtYWnDS7Q+FQ4oai3A28U7tRLvfg5BCTJrwk1KuAqycGgvuYKj/AVK4BslLPQCHgWOMiEp9mfEQvSGEa9DvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6985

Current scmi drivers not work well with devlink. This patchset is a
retry to address the issue in [1] which was a few months ago.

Current scmi devices are not created from device tree, they are created
from a scmi_device_id entry of each driver with the protocol matches
with the fwnode reg value, this means there could be multiple devices created
for one fwnode, but the fwnode only has one device pointer.

This patchset is to do more checking before setting the device fwnode.

This may looks like hack, but seems no better way to make scmi works
well with devlink.

[1]: https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=CfZWQ-hNUzz_7LZ0voG8A@mail.gmail.com/

Cc: 

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      firmware: arm_scmi: bus: Bypass setting fwnode for scmi cpufreq
      firmware: arm_scmi: bus: Bypass setting fwnode for pinctrl
      pinctrl: scmi: Check fwnode instead of machine compatible
      pinctrl: freescale: scmi: Check fwnode instead of machine compatible

 drivers/firmware/arm_scmi/bus.c              | 29 +++++++++++++++++++++++++++-
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c |  7 +------
 drivers/pinctrl/pinctrl-scmi.c               |  7 +------
 3 files changed, 30 insertions(+), 13 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241225-scmi-fwdevlink-afb5131f19ea

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>



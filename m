Return-Path: <linux-gpio+bounces-36071-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK6WF/Sd+GnHxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36071-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:24:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 548514BDD2F
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD0963078768
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0D83DD534;
	Mon,  4 May 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fPs6FQ+p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06A63DC4B1;
	Mon,  4 May 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900326; cv=fail; b=USRk/oj8AzR7C2CmMvYlCVK1EztFUj/stAiNc3OAkmmwmFf/KScpofRZzsHe3vQxJbGWHoXZy2285UdIRTxuuGNhvigwFcbwttW+92G4Q6kFXSXkXo+mSMN1Kbhf4+OkJZyYffK26wVtFgXU91EXOuE50lNDBeC/KaUNnAgeHXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900326; c=relaxed/simple;
	bh=3rkYqmFQ6QA1oLJi243XBqbXczbDD+5ZnlQtpemSYSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=syYrgVv9HQap6waxrj3kXvOoOqxm5PHEK95Z6pUHnnw4RKiOPU7QUwA/UmFws3GK93YRbi7J58E6yCltI3T1Fk541lUKwf2+CVtroPPWYKxYLW5onv3HmJp0MVmwgObULKRB1ksca9JwO5o+WXCy1lxZG+plAaEx+rxGuuYVa1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fPs6FQ+p; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5oRL6dkP6l8/NC8xLCWZ/fweL//FF/g7PBDMAP+meXpQWw5VjVmbgYLjdMqkvIZ+ZmK+0FEwURw9RAk289HGcVylsAZ1cRf58Ky13qCwgWmCxr6KDYZcQIpFgWTbDebWcFNT+swu8WQvCOY2g8sTJYBxwr13/mkUibEbCX6M+7DkE2x3GGFxFm7Sj9pS4gM0SotIplbXZFS9VH2bTYCSPuJmoJMYAzzhQLGB+ny+9D07K3Bb3QY1iKTBf+ij0vGmWbmNqyh9D4q2DJdA1Mwfwpy4S7t0sYxnpCIpj4LLQ9s61SzRb8wmBhkggLr1TVOcPu6eEssmNOd+6GE55JDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdScLg/xrw6JBfCnuc5/hH96J/xJ+ItfN12UxVr0hys=;
 b=L+cgdRBaTJowJphSw7gKnxqQPz6LFufumXxTHpeCj2XhzgLqVmGjNFq43QiO8AyORGGdCfiHpmtozta00hWaVEGeKQNVtgYw15VqQaQWlX3czn2kLOc81E7elB0U8Kni1uZ/IsTbQBCbB9MyTfJZaMR0/jx3tlh5C796AsKqeF+cwT4yA/GYnKg9j8JgoeeXXMnovtTE26gbJXQMzDrxZOd2rIQdADYU0yuhQzlnu3loU5aMyDfoTXmug2we5KSLn0pY4EMKXOASrgRfF2XDvt2bZ3h6YKsLXpJu5pxcl6yMH0lnjJNUqTETfXxX9QC/7q9h4XxXIsAy2Eu6/7tOJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdScLg/xrw6JBfCnuc5/hH96J/xJ+ItfN12UxVr0hys=;
 b=fPs6FQ+p+83PeML1PHQk7ph2ziR6gNtY8yopY/dUbTw29cFLkSIDK79P3nO+InXML2ch8mJjfLPbVWjcpja7vtlyvOQVGhuIzSACcE4krzCS/JJInEN+uDxJCx+jGkGx8u/HNqITAHiuWp7lnErVyRcob32sE7U1wgTep2+a6LCovM5WfzeTtUFYyXlankdmkO88bqu84jtuzIOF/BFxK/rNdXljlQx4DzuOGEF69uy1/SL+Z7HRBJ/+ks8NCkW3IF3lazfD3RShMF12TFBg1fM9j7Ngt8Z+j8/B8qlcKMPhJx91EB2ffZodkw4fqZDctij4rYyT3iRZOOUzV5a7Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 13:11:58 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:11:58 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
Date: Mon,  4 May 2026 15:11:47 +0200
Message-Id: <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::16) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f92c9d4-4f72-4e9a-de5d-08dea9deb8b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 sAgpTnLpCJ5qsHTA7QxKvqoI6zen5hjGr6WewLsGv42VkUELfvVR5R/ludD4F3ABvYymOOjD2F29dG/tNDQGLsTE1Tjt6E77CdO01VnqMbU2MpChgb0+0fj1HOxfHKWVHZOHjNEO42eONo3VIkpx7PNbGWL6XR2HZu2bmisb2yXa8Av01p7emZXEyflL5vFntAgzkU9VFZTNXxmxwrkIxUiCNQsORUbBCRNS/zb/RvYYtlO2aORVVYH14dbxBLVnQsTsdBdtCF2VUXh3wLZGwt8YL5DOn1pgLQlvPzreYu5CulbF15N+hW20yLRKcX6Cw/3VA/7IvGJmeNSibWQKbZsZvvHbeSvGPWMRxRdhV+IKC1DV+/e+Fg7DpygPuS1+L7/44WlosOzK+eFncKNkjDQgUr7DOqYldwza2rk/BpIFLtP8g3Xr8nFQU5Uw3L3/ypAMUKjYbk1WhsoH8Mltm5/tgDjSMsTCUlGCcxLxybaeqAHgfcFOt6dzShIrP3ElB8YK1gtQ/MR3mseyokyIqUaiMQg9bnFrxPFKHFrqqPHkvCSpJ90XXQrLwiIZwRCGcoBmcjs1VsZuda9n3X7exYy3LlgXd7zyf162Lp8aDLjDsPBDKbJjt2Z3HijBH8SXj6xZtNMcZN4v6efoP8JkMjjgL6Sf69zvJ4kQ0acapDH270KtaQNWqcxm8pkwOddH
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cnN6YnVrd2pIc2E4a1lOenJmQVI5WDZTWUViY3hSVUd6OW9GTVZnL25OeVhk?=
 =?utf-8?B?VkVKQVBoLzZyRTBzVWFSamc4YXQzTWU4QU9mblNwZ1RTUmUwb2QrNUhraWJh?=
 =?utf-8?B?TDhQQUFYWU5FZnY4SHcxbndiV2pMOUhYUGFFRzZlQi9JbS9jVnFwUDZoQ3d1?=
 =?utf-8?B?eERFV1hKOGFRNmEvdE0xZ1BlTGFIUWU3clZmYTN3bUdNQmFuVnFFZXFmYTJJ?=
 =?utf-8?B?aldWdExXWDZORVVVUGdKZDFma2oySDYrYi9lQnp2M2ZZazFhK3BtTlpsalJV?=
 =?utf-8?B?ZlpNRzJXem5HNG02YmZvaFlodE84ZFBTeU1vZ3NyS2VmTmtzNUM3eGcrdndP?=
 =?utf-8?B?a2NXWGduSEYwOTdKOTJCRkxDekpNd3RuNGZodll0SXpTRHliUnJCenlCbGdH?=
 =?utf-8?B?bm5xcUlxaGZtdlhQZnpUNElNVlh2N0ZCZ09mNWY2RG9LRVRldVR1bi9Tb05E?=
 =?utf-8?B?a2YwM3ZNaEJUNEQwcEhNZ3ptYXd5YU82OFViM3NEeHZuN1dBeFhnYk1lZzd0?=
 =?utf-8?B?N25ZZWF3SGZCVzB1TUtES2ZWSno4OG1TTVVQU1hISmNnOTJGNVBIRXlscXpj?=
 =?utf-8?B?WGJMWEI2RktCVDdlQ0h5UE83b0M0QlQyQ1ZVYVlTcG85TFpCUDFRTWtlalpP?=
 =?utf-8?B?cWl5dlcwa2pkTHFNV05TYzlra20vNmpqQzNocmhNSFBaWm40dUhCeXArWTQ2?=
 =?utf-8?B?OGdPZHRoeVVVMEw4eENVT3ozNGh0TmE5Um01cXE1NjJrTkR1czI5SFVTUDVh?=
 =?utf-8?B?V2Fyb05BZ1lSNFdnamVWNWx5VHhtOWhqZDZWNU41a3d4MUVoeVJlbXZXazlI?=
 =?utf-8?B?VktmaFliNTVVczdyTlJRUGFOdG04YTR5bm0wc3c5MTVSMEx2cVFYV1dLcEVz?=
 =?utf-8?B?QzBBTDRGek56UDEyaGRnZ1BMQjJxa2tZYmNKM3R2RWR5ZFdsckdleTJoMkhl?=
 =?utf-8?B?OUlzZWora2hMdm1IY0Z3ZGtWekZZb01heDVIWE1aTHBXcDRFSzRQKzRxWmVt?=
 =?utf-8?B?Z0VsU2lka2wzNG9QZllSWXJuYWt2cFU0VWlWU0h4VHJpTTBTTUlBVU1jczdW?=
 =?utf-8?B?cko4TDFZekxzNWl0OTBLM0JzYlRaSzl0MHdreVNUMDd6blpWSldJUDRWSHBm?=
 =?utf-8?B?NzRkQ1o0THEyNXpOVE82RmlkVkhjbDMwb3ZXSmIyb2FNZlB6QlhsRUpaMWcz?=
 =?utf-8?B?Nm1Fa3UyOEw1S2tNa0NkT3RWbUUyYTBzWW9CNGNGNXIzdGxPWGZUNmJrYzl6?=
 =?utf-8?B?NFAyZGdXUlErSEhjdkQvWXhVQlJ4Tmt3dFpzWWQ5ZDNTc0FMRmlXdWNjbXZG?=
 =?utf-8?B?N09FRy9heW9vRUE4OXlkamlVajVoR2t6UjJKUEtxenZpVU45czNpVUhMT2Y2?=
 =?utf-8?B?SHVIVld6aG9JeHRqL1dIMDJoaWY2WGFLZ2pLNFFGYlRWRTJnbXVrWXF1TVhP?=
 =?utf-8?B?dmhIcGszay9iQ0l1ZkpibzBldk90RGxpZk5LWFloYnduV0xrVitGRGViTEZF?=
 =?utf-8?B?ZkJITUxOZTRqOEcwSFhaTnZZRU16dndyMVVKenhCNGRla004Zjd1V2ZLOVRm?=
 =?utf-8?B?K1FBVTJXMHhkNGJvRVNzKzM1Wmh0SU44R1VGZ0RkOUpUa0p4dGlrVjg2bEVD?=
 =?utf-8?B?aGNXd3R6RUlic1NLZllKbVgwSlZJZkxNbVlFaGxvelF4eGNpMitwcEpiZjFk?=
 =?utf-8?B?ZFB5L1NWZXFGL0xmeDZBS05MaW9sT3lLelJOU3JkUExyaUxralRUWUZOR3FF?=
 =?utf-8?B?aDJydzNaSmJESFY0VmVoWnNUMmwyTW9HZ0s0eXMzRVJmMzFyU0p2WDJLd0Jn?=
 =?utf-8?B?aEFDb282RWNER3hwSkNEUk5NTFhYZnY3dkFjbWtzS3pJRVM0S2dmVVRRZmt4?=
 =?utf-8?B?T3BPdlNaV3VTMk55YkNlZ09rcm1Cc09qYnZWRFpqejl4OGlCelNuMWNDNEpv?=
 =?utf-8?B?VTZRUTIwK1lDWDFodVY2cWRvMFRBUW1URW8veURZc25xTlFQOGhMcjIxRDZL?=
 =?utf-8?B?QVd1Vys0cU5wYmh0YmZ2YnpaR3dmM2dyVTQyYkM1d2Fsc0N1MVlsOVdpYndG?=
 =?utf-8?B?UzZ5a3V1Q0NHR1oxVzNGemw1aTFkSFAwaXZPU3ZWQmxFa1c0WThsY0lWY1JV?=
 =?utf-8?B?Slo3ZVBMRWhoVEpqSXFJSzBPRExsV2R2Q2FwNWJKS0R1R3AvQUlqWDlGL2Fq?=
 =?utf-8?B?YTFwOGxDa25QamY0Ulg2UmhmOUpVUkgrZ1hRbGNqY0dVT1JBb0tJL1hrS1ZF?=
 =?utf-8?B?N2JVUTdPdmZUbSt5Q2ZlaHBGK0FIc2FpKzdWVzlMVWZ5bUlRN016SWhuOXQ3?=
 =?utf-8?B?MDhsSi9YK3Z6dGlnekJIazQ5SGVXMEk3NCtTZDYvY0VOSGNxS1gwd2JmdzNq?=
 =?utf-8?Q?8AxOQwnoeH06UBuMxkEwGVS4Q+G9qdPtwXtLi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f92c9d4-4f72-4e9a-de5d-08dea9deb8b7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:11:58.1238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+o4TF6lWK5yK13VJTrBUrWTPLByigAuWiboo2piCnFLR/vZIx+oihsbWUbZDxVvgpBmnTqfEqSq/5oxRUmZi1y41nUlNNip4BuiQweVFsXY/Y7X2pqITk6zswcq+ty0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160
X-Rspamd-Queue-Id: 548514BDD2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36071-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email,cfg.name:url]

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Add basic GPIO functionality (request, free, get, set) for
the existing pinctrl SIUL2 driver since the hardware for
pinctrl&GPIO is tightly coupled.

The updated SIUL2 block groups pinctrl, GPIO data access
and interrupt control within the same hardware unit.
The SIUL2 driver is therefore structured as a monolithic
pinctrl/GPIO driver.

This change came as a result of upstream review in the
following series:
https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043

Support both SIUL2 DT layouts:
- legacy pinctrl-only binding
- extended pinctrl/GPIO/irqchip binding

Also, remove pinmux_ops which are no longer needed.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32.h   |  15 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 527 ++++++++++++++++++++++++----
 drivers/pinctrl/nxp/pinctrl-s32g2.c |  25 +-
 3 files changed, 499 insertions(+), 68 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
index 8715befd5f05..d33f4d631dd6 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32.h
+++ b/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -2,7 +2,7 @@
  *
  * S32 pinmux core definitions
  *
- * Copyright 2016-2020, 2022 NXP
+ * Copyright 2016-2020, 2022, 2026 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2012 Linaro Ltd.
@@ -34,11 +34,23 @@ struct s32_pin_range {
 	unsigned int end;
 };
 
+/**
+ * struct s32_gpio_range - contiguous GPIO pin range within a SIUL2 module
+ * @gpio_base: first pinctrl pin number in the GPIO range
+ * @gpio_num: number of consecutive GPIO pins in the range
+ */
+struct s32_gpio_range {
+	unsigned int gpio_base;
+	unsigned int gpio_num;
+};
+
 struct s32_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	const struct s32_pin_range *mem_pin_ranges;
 	unsigned int mem_regions;
+	const struct s32_gpio_range *gpio_ranges;
+	unsigned int num_gpio_ranges;
 };
 
 struct s32_pinctrl_soc_info {
@@ -53,6 +65,7 @@ struct s32_pinctrl_soc_info {
 
 #define S32_PINCTRL_PIN(pin)	PINCTRL_PIN(pin, #pin)
 #define S32_PIN_RANGE(_start, _end) { .start = _start, .end = _end }
+#define S32_GPIO_RANGE(_base, _num) { .gpio_base = _base, .gpio_num = _num }
 
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data);
diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 27757f2c5570..2d9b14792cf4 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -2,7 +2,7 @@
 /*
  * Core driver for the S32 CC (Common Chassis) pin controller
  *
- * Copyright 2017-2022,2024-2025 NXP
+ * Copyright 2017-2022,2024-2026 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  */
@@ -39,6 +39,14 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define S32_PGPD(N)		(((N) ^ 1) * 2)
+#define S32_PGPD_SIZE		16
+
 enum s32_write_type {
 	S32_PINCONF_UPDATE_ONLY,
 	S32_PINCONF_OVERWRITE,
@@ -72,6 +80,18 @@ struct s32_pinctrl_mem_region {
 	char name[8];
 };
 
+/**
+ * struct s32_gpio_regmaps - GPIO register maps for a SIUL2 instance
+ * @pgpdo: regmap for Parallel GPIO Pad Data Out registers
+ * @pgpdi: regmap for Parallel GPIO Pad Data In registers
+ * @range: GPIO range info
+ */
+struct s32_gpio_regmaps {
+	struct regmap *pgpdo;
+	struct regmap *pgpdi;
+	const struct s32_gpio_range *range;
+};
+
 /**
  * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
@@ -96,8 +116,11 @@ struct s32_pinctrl_context {
  * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
+ * @gc: a pointer to the gpio_chip
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
+ * @gpio_regmaps: PGPDO/PGPDI regmaps for each SIUL2 module
+ * @num_gpio_regmaps: number of GPIO regmap entries
  * @gpio_configs: saved configurations for GPIO pins
  * @gpio_configs_lock: lock for the `gpio_configs` list
  * @saved_context: configuration saved over system sleep
@@ -105,8 +128,11 @@ struct s32_pinctrl_context {
 struct s32_pinctrl {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
+	struct gpio_chip gc;
 	struct s32_pinctrl_mem_region *regions;
 	struct s32_pinctrl_soc_info *info;
+	struct s32_gpio_regmaps *gpio_regmaps;
+	unsigned int num_gpio_regmaps;
 	struct list_head gpio_configs;
 	spinlock_t gpio_configs_lock;
 #ifdef CONFIG_PM_SLEEP
@@ -379,67 +405,6 @@ static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
-				       struct pinctrl_gpio_range *range,
-				       unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin;
-	unsigned int config;
-	unsigned long flags;
-	int ret;
-
-	ret = s32_regmap_read(pctldev, offset, &config);
-	if (ret)
-		return ret;
-
-	/* Save current configuration */
-	gpio_pin = kmalloc_obj(*gpio_pin);
-	if (!gpio_pin)
-		return -ENOMEM;
-
-	gpio_pin->pin_id = offset;
-	gpio_pin->config = config;
-	INIT_LIST_HEAD(&gpio_pin->list);
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-	list_add(&gpio_pin->list, &ipctl->gpio_configs);
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-
-	/* GPIO pin means SSS = 0 */
-	config &= ~S32_MSCR_SSS_MASK;
-
-	return s32_regmap_write(pctldev, offset, config);
-}
-
-static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
-				      struct pinctrl_gpio_range *range,
-				      unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin, *tmp;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-
-	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
-		if (gpio_pin->pin_id == offset) {
-			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
-						 gpio_pin->config);
-			if (ret != 0)
-				goto unlock;
-
-			list_del(&gpio_pin->list);
-			kfree(gpio_pin);
-			break;
-		}
-	}
-
-unlock:
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-}
-
 static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 				      struct pinctrl_gpio_range *range,
 				      unsigned int offset,
@@ -463,8 +428,6 @@ static const struct pinmux_ops s32_pmx_ops = {
 	.get_function_name = s32_pmx_get_func_name,
 	.get_function_groups = s32_pmx_get_groups,
 	.set_mux = s32_pmx_set,
-	.gpio_request_enable = s32_pmx_gpio_request_enable,
-	.gpio_disable_free = s32_pmx_gpio_disable_free,
 	.gpio_set_direction = s32_pmx_gpio_set_direction,
 };
 
@@ -683,6 +646,397 @@ static const struct pinconf_ops s32_pinconf_ops = {
 	.pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
 };
 
+static struct s32_pinctrl *to_s32_pinctrl(struct gpio_chip *chip)
+{
+	return container_of(chip, struct s32_pinctrl, gc);
+}
+
+static struct regmap *s32_gpio_get_pgpd_regmap(struct gpio_chip *chip,
+					       unsigned int gpio,
+					       bool output,
+						   unsigned int *relative_pin)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	const struct s32_gpio_range *range;
+	int i;
+
+	for (i = 0; i < ipctl->num_gpio_regmaps; i++) {
+		range = ipctl->gpio_regmaps[i].range;
+		if (gpio >= range->gpio_base &&
+		    gpio < range->gpio_base + range->gpio_num) {
+			if (relative_pin)
+				*relative_pin = gpio - range->gpio_base;
+			return output ? ipctl->gpio_regmaps[i].pgpdo :
+					ipctl->gpio_regmaps[i].pgpdi;
+		}
+	}
+
+	return NULL;
+}
+
+static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin;
+	unsigned int config;
+	int ret;
+
+	ret = s32_regmap_read(pctldev, gpio, &config);
+	if (ret)
+		return ret;
+
+	/* Save current configuration */
+	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
+	if (!gpio_pin)
+		return -ENOMEM;
+
+	gpio_pin->pin_id = gpio;
+	gpio_pin->config = config;
+	INIT_LIST_HEAD(&gpio_pin->list);
+
+	/* GPIO pin means SSS = 0 */
+	config &= ~S32_MSCR_SSS_MASK;
+
+	ret = s32_regmap_write(pctldev, gpio, config);
+	if (ret) {
+		kfree(gpio_pin);
+		return ret;
+	}
+
+	scoped_guard(spinlock_irqsave, &ipctl->gpio_configs_lock)
+		list_add(&gpio_pin->list, &ipctl->gpio_configs);
+
+	return 0;
+}
+
+static void s32_gpio_free(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin, *tmp;
+	int ret;
+
+	guard(spinlock_irqsave)(&ipctl->gpio_configs_lock);
+
+	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
+		if (gpio_pin->pin_id == gpio) {
+			list_del(&gpio_pin->list);
+			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
+					       gpio_pin->config);
+			if (ret)
+				dev_warn(gc->parent, "Failed to restore config for pin %u\n", gpio);
+			kfree(gpio_pin);
+			return;
+		}
+	}
+}
+
+static int s32_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	unsigned int reg_value;
+	int ret;
+
+	ret = s32_regmap_read(ipctl->pctl, gpio, &reg_value);
+	if (ret)
+		return ret;
+
+	if (!(reg_value & S32_MSCR_IBE))
+		return -EIO;
+
+	return reg_value & S32_MSCR_OBE ? GPIO_LINE_DIRECTION_OUT :
+					  GPIO_LINE_DIRECTION_IN;
+}
+
+static unsigned int s32_pin2pad(unsigned int pin)
+{
+	return pin / S32_PGPD_SIZE;
+}
+
+static u16 s32_pin2mask(unsigned int pin)
+{
+	/*
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
+}
+
+static struct regmap *s32_gpio_get_regmap_offset_mask(struct gpio_chip *chip,
+						      unsigned int gpio,
+						      unsigned int *reg_offset,
+						      u16 *mask,
+						      bool output)
+{
+	struct regmap *regmap;
+	unsigned int pad, relative_pin;
+
+	regmap = s32_gpio_get_pgpd_regmap(chip, gpio, output, &relative_pin);
+	if (!regmap)
+		return NULL;
+
+	*mask = s32_pin2mask(relative_pin);
+	pad = s32_pin2pad(relative_pin);
+
+	*reg_offset = S32_PGPD(pad);
+
+	return regmap;
+}
+
+static int s32_gpio_set_val(struct gpio_chip *chip, unsigned int gpio,
+			    int value)
+{
+	unsigned int reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, true);
+	if (!regmap)
+		return -ENODEV;
+
+	value = value ? mask : 0;
+
+	return regmap_update_bits(regmap, reg_offset, mask, value);
+}
+
+static int s32_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			int value)
+{
+	return s32_gpio_set_val(chip, gpio, value);
+}
+
+static int s32_gpio_get(struct gpio_chip *chip, unsigned int gpio)
+{
+	unsigned int reg_offset, value;
+	struct regmap *regmap;
+	u16 mask;
+	int ret;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, false);
+	if (!regmap)
+		return -EINVAL;
+
+	ret = regmap_read(regmap, reg_offset, &value);
+	if (ret)
+		return ret;
+
+	return !!(value & mask);
+}
+
+static int s32_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			    int val)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	int ret;
+
+	ret = s32_gpio_set_val(chip, gpio, val);
+	if (ret)
+		return ret;
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, false);
+}
+
+static int s32_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, true);
+}
+
+static bool s32_gpio_is_valid(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	const struct s32_pinctrl_soc_data *soc_data;
+	const struct pinctrl_pin_desc *pins;
+	int i;
+
+	soc_data = ipctl->info->soc_data;
+	pins = ipctl->info->soc_data->pins;
+	for (i = 0; i < soc_data->npins && pins[i].number <= gpio; i++)
+		if (pins[i].number == gpio)
+			return true;
+
+	return false;
+}
+
+static int s32_init_valid_mask(struct gpio_chip *chip, unsigned long *mask,
+			       unsigned int ngpios)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	const struct s32_pinctrl_soc_data *soc_data;
+	const struct pinctrl_pin_desc *pins;
+	int i;
+
+	bitmap_zero(mask, ngpios);
+
+	soc_data = ipctl->info->soc_data;
+	pins = soc_data->pins;
+
+	for (i = 0; i < soc_data->npins; i++)
+		if (pins[i].number < ngpios)
+			bitmap_set(mask, pins[i].number, 1);
+
+	return 0;
+}
+
+static int s32_gpio_gen_names(struct device *dev, struct gpio_chip *gc,
+			      unsigned int cnt, char **names, char *ch_index,
+			      unsigned int *num_index)
+{
+	unsigned int gpio;
+	unsigned int i;
+
+	/*
+	 * GPIO names follow the format P<port>_<pin>, for example:
+	 *   PA_00 .. PA_15, PB_00 .. PB_15, ..
+	 *
+	 * @num_index tracks the absolute GPIO index. The port letter is
+	 * advanced whenever the index crosses a 16-pin boundary.
+	 */
+	for (i = 0; i < cnt; i++) {
+		gpio = *num_index;
+		if (i != 0 && (gpio % 16) == 0)
+			(*ch_index)++;
+
+		if (s32_gpio_is_valid(gc, gpio)) {
+			names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+						  *ch_index, gpio & 0xF);
+			if (!names[i])
+				return -ENOMEM;
+		}
+
+		(*num_index)++;
+	}
+
+	return 0;
+}
+
+static int s32_gpio_populate_names(struct device *dev,
+				   struct s32_pinctrl *ipctl)
+{
+	const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
+	const struct s32_gpio_range *range;
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, ipctl->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < soc_data->num_gpio_ranges; i++) {
+		range = &soc_data->gpio_ranges[i];
+
+		if (range->gpio_base % 16 == 0)
+			num_index = 0;
+
+		ret = s32_gpio_gen_names(dev, &ipctl->gc, range->gpio_num,
+					 names + range->gpio_base,
+					 &ch_index, &num_index);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Error setting SIUL2_%d names\n",
+					     i);
+
+		ch_index++;
+	}
+
+	ipctl->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
+static int s32_pinctrl_init_gpio_regmaps(struct platform_device *pdev,
+					 struct s32_pinctrl *ipctl)
+{
+	const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
+	static const struct regmap_config pgpd_config = {
+		.reg_bits = 32,
+		.val_bits = 16,
+		.reg_stride = 2,
+	};
+	struct regmap_config cfg;
+	struct resource *res;
+	void __iomem *base;
+	unsigned int pgpdo_idx, pgpdi_idx;
+	unsigned int i;
+
+	if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
+		return 0;
+
+	ipctl->num_gpio_regmaps = soc_data->num_gpio_ranges;
+	ipctl->gpio_regmaps = devm_kcalloc(&pdev->dev, ipctl->num_gpio_regmaps,
+					   sizeof(*ipctl->gpio_regmaps),
+					   GFP_KERNEL);
+	if (!ipctl->gpio_regmaps)
+		return -ENOMEM;
+
+	for (i = 0; i < ipctl->num_gpio_regmaps; i++) {
+		ipctl->gpio_regmaps[i].range = &soc_data->gpio_ranges[i];
+
+		/*
+		 * GPIO resources are placed after the pinctrl regions
+		 */
+		pgpdo_idx = soc_data->mem_regions + i * 2;
+		pgpdi_idx = soc_data->mem_regions + i * 2 + 1;
+
+		/* PGPDO */
+		res = platform_get_resource(pdev, IORESOURCE_MEM, pgpdo_idx);
+		if (!res)
+			return dev_err_probe(&pdev->dev, -ENOENT,
+						 "Missing PGPDO resource %u\n", i);
+
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		cfg = pgpd_config;
+		cfg.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpdo%u", i);
+		if (!cfg.name)
+			return -ENOMEM;
+
+		cfg.max_register = resource_size(res) - cfg.reg_stride;
+
+		ipctl->gpio_regmaps[i].pgpdo =
+			devm_regmap_init_mmio(&pdev->dev, base, &cfg);
+		if (IS_ERR(ipctl->gpio_regmaps[i].pgpdo))
+			return dev_err_probe(&pdev->dev,
+						 PTR_ERR(ipctl->gpio_regmaps[i].pgpdo),
+						 "Failed to init PGPDO regmap %u\n", i);
+
+		/* PGPDI */
+		res = platform_get_resource(pdev, IORESOURCE_MEM, pgpdi_idx);
+		if (!res)
+			return dev_err_probe(&pdev->dev, -ENOENT,
+						 "Missing PGPDI resource %u\n", i);
+
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		cfg = pgpd_config;
+		cfg.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpdi%u", i);
+		if (!cfg.name)
+			return -ENOMEM;
+
+		cfg.max_register = resource_size(res) - cfg.reg_stride;
+
+		ipctl->gpio_regmaps[i].pgpdi =
+			devm_regmap_init_mmio(&pdev->dev, base, &cfg);
+		if (IS_ERR(ipctl->gpio_regmaps[i].pgpdi))
+			return dev_err_probe(&pdev->dev,
+						 PTR_ERR(ipctl->gpio_regmaps[i].pgpdi),
+						 "Failed to init PGPDI regmap %u\n", i);
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
 				    unsigned int pin)
@@ -928,9 +1282,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
+	const struct s32_gpio_range *last_range;
 	struct pinctrl_desc *s32_pinctrl_desc;
 	struct s32_pinctrl_soc_info *info;
 	struct s32_pinctrl *ipctl;
+	struct gpio_chip *gc;
 	int ret;
 
 	if (!soc_data || !soc_data->pins || !soc_data->npins)
@@ -974,6 +1330,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
+	ret = s32_pinctrl_init_gpio_regmaps(pdev, ipctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+					 "Failed to init GPIO regmaps\n");
+
 	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
 					     ipctl, &ipctl->pctl);
 	if (ret)
@@ -997,5 +1358,43 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 
 	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
+	/* Setup GPIO if GPIO ranges are defined */
+	if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
+		return 0;
+
+	gc = &ipctl->gc;
+	gc->parent = &pdev->dev;
+	gc->label = dev_name(&pdev->dev);
+	gc->base = -1;
+	/*
+	 * In some cases, there is a gap between the SIUL GPIOs.
+	 *
+	 * gpio_ranges[] is expected to be sorted by increasing gpio_base.
+	 * ngpio is derived from the last range and must cover the highest
+	 * GPIO offset, even when gaps exist in the numbering.
+	 */
+	last_range = &soc_data->gpio_ranges[soc_data->num_gpio_ranges - 1];
+	gc->ngpio = last_range->gpio_base + last_range->gpio_num;
+	ret = s32_gpio_populate_names(&pdev->dev, ipctl);
+	if (ret)
+		return ret;
+
+	gc->set = s32_gpio_set;
+	gc->get = s32_gpio_get;
+	gc->set_config = gpiochip_generic_config;
+	gc->request = s32_gpio_request;
+	gc->free = s32_gpio_free;
+	gc->direction_output = s32_gpio_dir_out;
+	gc->direction_input = s32_gpio_dir_in;
+	gc->get_direction = s32_gpio_get_dir;
+	gc->init_valid_mask = s32_init_valid_mask;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, ipctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Unable to add gpiochip\n");
+
+	dev_info(&pdev->dev, "Initialized S32 GPIO functionality\n");
+
 	return 0;
 }
diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
index c49d28793b69..b1bf328371e2 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -3,7 +3,7 @@
  * NXP S32G pinctrl driver
  *
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
- * Copyright 2017-2018, 2020-2022 NXP
+ * Copyright 2017-2018, 2020-2022, 2025-2026 NXP
  * Copyright (C) 2022 SUSE LLC
  */
 
@@ -773,17 +773,36 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
 	S32_PIN_RANGE(942, 1007),
 };
 
-static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
+static const struct s32_gpio_range s32_gpio_ranges_siul2[] = {
+	S32_GPIO_RANGE(0, 102),
+	S32_GPIO_RANGE(112, 79),
+};
+
+/* Legacy data for old DT bindings without GPIO support */
+static const struct s32_pinctrl_soc_data legacy_s32g_pinctrl_data = {
+	.pins = s32_pinctrl_pads_siul2,
+	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
+	.mem_pin_ranges = s32_pin_ranges_siul2,
+	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+};
+
+static const struct s32_pinctrl_soc_data s32g_pinctrl_data = {
 	.pins = s32_pinctrl_pads_siul2,
 	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
 	.mem_pin_ranges = s32_pin_ranges_siul2,
 	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+	.gpio_ranges = s32_gpio_ranges_siul2,
+	.num_gpio_ranges = ARRAY_SIZE(s32_gpio_ranges_siul2),
 };
 
 static const struct of_device_id s32_pinctrl_of_match[] = {
+	{
+		.compatible = "nxp,s32g2-siul2-pinctrl-gpio",
+		.data = &s32g_pinctrl_data,
+	},
 	{
 		.compatible = "nxp,s32g2-siul2-pinctrl",
-		.data = &s32_pinctrl_data,
+		.data = &legacy_s32g_pinctrl_data,
 	},
 	{ /* sentinel */ }
 };
-- 
2.34.1



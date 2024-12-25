Return-Path: <linux-gpio+bounces-14232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB199FC416
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 09:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38DDB160144
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 08:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF01F186E20;
	Wed, 25 Dec 2024 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OPjdm5L0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6CA1714C0;
	Wed, 25 Dec 2024 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735114897; cv=fail; b=gJpKEL0NBjlI+kMxgNsVW32O5azB60BOywvMHKBtOM7vBtI7fRfzDT2wMxdKbkWmqSZzTNM0dpa9rzHaTcryVv/ah2FmZyIj/Qjo4RAJ8hEwb+dmxCU9PRQBEpg8PH5vhNkpK4dD/qypMqgb4D699Ye/p9A3+ZzXXN6Q/wTJCFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735114897; c=relaxed/simple;
	bh=J+xcsLePAYp6f69pW1nBclIYRTJEk+tWmWlGgvM0K1o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q7dpJzGsBFwFsHYArnKH2BkAx7nmIausT4spPDtsoHceeOzt5exVNh3gv0M/AeNcFW/jm/6ckw+OjjVKtnLNLxO3Vv1muCGZ5afvLi1yNPw5HxRCABngmCBL+A67ABwFkw6FJWOFqtoR+thC+Y2+uBcmYWqg0GLRQUDD2k/eruc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OPjdm5L0; arc=fail smtp.client-ip=40.107.247.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhVHWtTGZnuFYUcpOW+0tP9h3EMj4qGfqi0fQMiROnPITbLfNYlygYeyr1DNCejj2tiOfTKMYRt3tyh1Ce4uD/pCsAZ/qnU47+n7QhNl7YDqqFwUsgjH3qjWbjdEcHjvJqQ+olRzkFADduiObzGA57jdYFVBPPK+8ZuD1+Umq7ctGZSxz3aY72sn/7PdVHo8V6Dfl+LXzrLONf8eoXOivLV8yL9vgiE5MD3qm7zP9KuYwQOvt+zCggbrV9j8SqUi0ife1B8DLg8HKXbKrOZk6GYalf9OD66KILZUa4lIiJe05nd72g6iGAAJQfoKAKBSw0ixyOqppFzW3RwQtoeJAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaHgf1HOYINwmhIkfBnjW7uym2CkqF09G3XssNgoIvg=;
 b=h5lloh1y5HfCQv+nfmJ0dSJmeykNrNngL/i5zdUVl0fXlJKSbb25+ip1uX2thjzsPuRcBTdUXuNp7cvNKfh8Z9UcDUMqM8jNubmGgF2xKyV6j6iDB9efUctdkytbQNK5sYKhM2ehf6S0MxpQ0B7gpobhwyFixp5IbQdyf6ewODIMH3DD7MHjoatipOWzTUXZGttROgUaCAAHzHDYKbH6/BhnRpAb5HC7q790lpN5jhnmNR1gZ2ZljqTvs0E9OSUZDSWboheCmJWZcE9cicRTuMc6Vua9pp9DaO0vytwCR3t5k7P4W4OJdDAgIM5PGrPIGasVMc95QgFojO3YY3OESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaHgf1HOYINwmhIkfBnjW7uym2CkqF09G3XssNgoIvg=;
 b=OPjdm5L0ih07ZTvicZWYtfJNcXn8RgftnxN056Si6lyQCBAuuGaE8ek6ffSXDlyMN1hYgsDyb/c5uCaW4h3HB4IN65PV4ZsNjHVFetHxTlSKYF+o0W/AgB+RZn3uh56sXCDolL1ZODp+0ErgfbH9/tmRK+/5BMAMZ/fxcesedxVtOfFL2PBCH/FdVphwnZx5D12BT6i6RNnoxQqbMV1NcIOOt9joxvo5Srh5aV+0sLxqrYf0anrvpYmiRo7s9u+JC/fMxpm/9QtnDvS00O5kGnJ4yDGKpflP9ixfH3AsYp0YATsb4MFwjbZe3MB//HryaS1PdTfs+dzxxjNEMLd2Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB8PR04MB6985.eurprd04.prod.outlook.com (2603:10a6:10:11e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Wed, 25 Dec
 2024 08:21:33 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 08:21:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Dec 2024 16:20:46 +0800
Subject: [PATCH 3/4] pinctrl: scmi: Check fwnode instead of machine
 compatible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-scmi-fwdevlink-v1-3-e9a3a5341362@nxp.com>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
In-Reply-To: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735114854; l=1087;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=r4Ew8RhCTydbXQP0oQzzrc0X8D6H3LB9gfEADXdHfL0=;
 b=NjmxUSnfAhOUAHD2K7bs61CFhYAgc6OFQUZyMfQzZRBgrFCkQNjVg+Gs2lcy9mcjgj4vEisy8
 KowglTrSVDfCEHozTXxH7ldb+qN+GN0SB9VvNCj4Dn51DtELE2MR5OZ
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
X-MS-Office365-Filtering-Correlation-Id: c3490782-e556-4be6-8bcd-08dd24bd2440
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTNiYXk2a0xSVWZJRjZMakdmcm5POEtLTG5Nd1Zla1lUeldENGNTQk5sbWxJ?=
 =?utf-8?B?SmpEOVcwOG5QeDJXNDI1NG5qdEh4SjM4czFRMEZ5MGtZVitVSWpCRlJPeEdP?=
 =?utf-8?B?TDAyb0l1RDdBZW9mK0VOb2NFak0zc1lNLzg2bXlMem0rZ3dMQmM1NmxCTGls?=
 =?utf-8?B?NWoxZi8vdXNiNEc5V1ZDS3dHenFVNU0rMllCVDlLdVlXaWVLU3FJN243RW80?=
 =?utf-8?B?cWRWQUlEbGNXeGp2aEhtVXIyNkViS0hmeEx1eHovQkpjL2FlNDlKVDNwNmtB?=
 =?utf-8?B?WXB5SWVjTkVBSHFTUkhhdTB4cStDeVBXN1J3bTMxVGtyNUg2eE8yOVZMbUZw?=
 =?utf-8?B?VkdxNm8wVi94bEpaS25EdnlqTUdFNG1MY1F4U1lJbFpUaXFyVHJuZDIxM2pO?=
 =?utf-8?B?eFJHOXhxM3laR2REYjFHU1MxNlhsWUNwQWs4YTJUTW9QdGk3NGhtOS93aVZw?=
 =?utf-8?B?MnJxSWU2dVdmeHRacTZMYlJ1c3VKaytjS0tTQ2NjOEhPcy9RNHJvWXVTakU4?=
 =?utf-8?B?cVllOTJTNllVcnJmOXphMnNSbmdPbm1QNnFGb3V2UFI3UEhhVFc2N1I5eFJI?=
 =?utf-8?B?bkx4SHNKOEY2bmxBWHFzZS9tZi9LWFJXY1ZMWEs1d2hBMGxUZ2F1WjdBVVZw?=
 =?utf-8?B?OHRYa3pKUkJrWHozUk5pMEJRR0NOcVRubFgrM25YNGMxYnkrVkFMYy9HWE1E?=
 =?utf-8?B?Qk0vYnMvcGNpNmJEc2Y3RkMwL1ErQkRsYWd3S3dxRzlrZlBXTmZDMFNUK1pM?=
 =?utf-8?B?RDZqLzcvK1dlb0JvUXB5OEdYTGRSdnhVQUVLS2NrcG9jNTNYS0xnMUZ4SDAz?=
 =?utf-8?B?bGJkWjdSTHZDc0FsZENwN0pkbElMYkN4S25lSjhtdGk0aGR3U2NxNFhLbGVD?=
 =?utf-8?B?eWxMTHBxM25vVzBxZFpOQUJGeXJyT04vZlNIaTAzcmFkWTFmQjd4NW9KVnp2?=
 =?utf-8?B?WEwyWWpVSGhTNCs1TTM1NVJxMjNoNEVicmpjWklJVzNMOTNsOTVFQi9HT21R?=
 =?utf-8?B?UThSNk9BTjZTU2tYY2ROSmY0TnJVbCtia1hWSHZnVXJzSnFDMmx2Z2lZcmNv?=
 =?utf-8?B?dHRvSmNZQlFWOGtjZThzYzRLdUJ5TmdRbFpqVTlTV3pEMDV4M3BBQ2lTbURO?=
 =?utf-8?B?YmhYSjV1akZndkd0MTBrSTZWNnR0a0p1TTQzVzFPYkZLTjRUdkQxZlhEWXJo?=
 =?utf-8?B?Y0l0UVJVdkFWT3JWN0VUU3dJS21sM1FsWTFDUXlxdmNBOWY5ZkhZUXFOK0FU?=
 =?utf-8?B?d1UwQWNmUC9UeWRXNjNXbExwNXpHMDJ2U0EvUWdOYi9sOEpHUEJmWTJHY1kw?=
 =?utf-8?B?eTFycTdGa0FEcy95cGx2dEUzOGNpN252cktjNURKRTZ5bmJadkJ4VCsrVjdj?=
 =?utf-8?B?V0Z1SWYvMitOSGNtczBkMmRRdDBpcHVyNkF0OHZ5MCtId09tQm5ZSkRSVEZa?=
 =?utf-8?B?alI5TTc0Y29sM2xVdnlBVDE2UWxUSjhhdHRKcHB3RjhuNTRnZHFZMG82R0JG?=
 =?utf-8?B?bTZxL1ptbENNMlV3YmkrT0o0bVlwandZNmxsUkRYOVVHVjVld2FoRFltc3hm?=
 =?utf-8?B?dlVQQmhPcmYxTXpGcVVUK3VRckJ6VlkxOWhCenZiNjRFMzVkWDVlaTRuUjBC?=
 =?utf-8?B?TDZhYTNYeWYrWU0xZStaL3E1elQwaVZ2ZlQ5aWlTTG1NYjRBd2xwWFBHTGFJ?=
 =?utf-8?B?eXR0TWNaYURUaFE4MG83UWNBS3Vlb3hVaHJOSXU0QlBjZ2VScnRkZUhEQ0hL?=
 =?utf-8?B?OFpub28xZkNpZEtVOHd5d3VPRU1PbHpSTURKa2NWV2U4MXk0T2s1VDNBMDA3?=
 =?utf-8?B?aDByc3pLREhCU2tQZG9XUWplTDJOUVRvNGIzTEs5V0VoY2E5WjdIZTRIR2dB?=
 =?utf-8?B?SkRXMVFVZW4vR1FQcUpDS1Flekprbk1BbEcwdmU4QnJ1OGorbTJ0Vnl5d2dG?=
 =?utf-8?Q?9yj/1mZbgATWj+oMY/C0t5NnGD0cauRj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmpxK1JMUTBCWHFHQzZ1MktvTnk4RzFqYjA5Y1lCRGhpdWZmSXNLeER6VzEy?=
 =?utf-8?B?QngzSlNRdWg5dmZaUVlmTkw5WnV0RWFTcWMzSXcycnFuaVNaTVZKMUFtRlhp?=
 =?utf-8?B?TXk2WXovQ01yakd5WjhETGJuNThTSEdKempiT1lCbW5sNDdHcDlpeDRTa1dG?=
 =?utf-8?B?c04xd1B1MmcvQVQrZGJwcy9SdHFibmYyTE4xUWNvL0MrTmloRHFidE5HZkdw?=
 =?utf-8?B?Y2MrdlNPWXBBU3BlaGdOOCtQK1hHSnpFeHpMcFk3VGNqdGc3V0RGQ2M1aWRs?=
 =?utf-8?B?K2lWWW82L2RaUnZlbDl5cjA5MklRMzVyWlArMUhGR0hzdXA1V3lBYmRHd3Zj?=
 =?utf-8?B?eW5UK1RrNGNrVFRlbW9FR3VaLzMra1JLaGNnQlZWRkE4TDgwTCtQbkwzWWNC?=
 =?utf-8?B?R3NRWU9lS2Qxd3VaU043UWFvTXVBY3ZZVW02aWlaUFNHWjdHblN0R0M0NTlH?=
 =?utf-8?B?eGUzV01jWFEvYWVEUitVWEljRGNSM3c3TVBaTHpSQXIxaU51WEJEUi9ENFpH?=
 =?utf-8?B?SVJqby83cTdDRjdoZ2tqOVFNeHBkOUNpRUxtWHZ6eVZXMHFjMGNnZWJTSjBl?=
 =?utf-8?B?a0U5cHJxZzZWMnRHRGR2M0dTTUxqenlFWE51Mk5IZGYwU3dLaDQyUVlrbHhz?=
 =?utf-8?B?YWQ4Q29MWWJHaVhJbkdCU2JDRE1EbzF1ZFVRV3lHSE5oakNNM0EzalY0UUNO?=
 =?utf-8?B?eHg0elpLTGxoSm0wckZsemlSb2pNMXBYdlh3dGErdWJYZmVGM25lUUFkWDB5?=
 =?utf-8?B?K1RPbWF6V2JBR2FMUWtrd2Y0YU43VUNnV1FQUVF4Y0xvOXJVc3Z6bkQ2cmZy?=
 =?utf-8?B?VXJERGZRdm15a3QrUUh6UDZETWRoU2M2aXFKdnVYQk41emV5RW1nZlE3dUY4?=
 =?utf-8?B?L1IwdVBjTENtVm5nMGxab0xyaG9DQUZsWUdEVTRqdENPZGVBc2ZydHBpSTlx?=
 =?utf-8?B?cGJ0YVRZZ0lQcDRhN2lVTnhCeFVhb0JPbXc4SkVHNmkxMFF0UGlPL3NWdkhr?=
 =?utf-8?B?V3F4ZURQQmM5d0FndTlDMlZYbEpLcjBSNElLZ3hhV2JxZGpxQ1RPanpmOTJs?=
 =?utf-8?B?NXhIWTFhTFFhQUUrWnBMR2FVOXdPOFBQYmgvcHhmcUdYeENCSG1kOTlscG5v?=
 =?utf-8?B?b2VIS3FqMFFSck55cGROc3Nta1pHVmQ4cU1nK21qUjZLZzgzYXNXTk53dnJv?=
 =?utf-8?B?cFdMZEtwVnBRejluck5UallwV3JMbEdIZzI2aUxST2kwVUhwRHEyODJoNFVC?=
 =?utf-8?B?MTVqWEk3anpiV3lZbjZ0QlViSnRJTVdsbWdyM0MzYWtqSXVaME9nWGg1OTky?=
 =?utf-8?B?UVZsSkZ0YzBSdXZvWjVZRHdKbzZneUc3M2NSSFI0N1lINkZDd3pFMkNkWTBi?=
 =?utf-8?B?WjNGczY5SFA0ZUxVL2ZydTRBaGhrRENMS0tkb2xQTEF2MlRqTGFkQ0xUbFVW?=
 =?utf-8?B?eFh3RUFuUUxzaFVRY25UTzN1akM5N0NKZURhVEhMVjhjRkRiOWJFVXA1Z3Fk?=
 =?utf-8?B?a09zelJEMzJaa0ZjMVNKdksvRjhJeXZXK0FHSll0MS9McHZON0VUY0JQRHFt?=
 =?utf-8?B?MEtxSjQ5Nmk1R3RHeWlyM0ZKS1UxYWhrUncrZHQ2dW5mdTdPZlBEdlhVa0Fy?=
 =?utf-8?B?ZzQ3R0kvNVNieEtxYjlla24raDdPM2FzU1hIbUhRSEhZMWVvcFZsYitlTjI5?=
 =?utf-8?B?T3NGaklGK0ZMVGp5VXJWUWx0SWkrell3a1V2b3d3aDFBRFR3TFJRcnl6alcz?=
 =?utf-8?B?amZpeEtXN1dFcWhHR25MUGNyTVVoWkY1RkFjUGVkN0JnV1ZSMUpHOGZpSGNZ?=
 =?utf-8?B?aEhsK2NQK1dBYys5UEd2SDJya3FMYjUxV1VybnNRVE42eDZSVS9WRTU1SVg5?=
 =?utf-8?B?SWRoWnRIVVBaRnplaHB2T0E0akR2bzgwcFdTL014WWdia05sZDJUVjdHVFFl?=
 =?utf-8?B?cWNEdVp0YVk5K0E4c3EvNHhFQ1E5MENMTkZ6N1lGVTNldFdiWWxMazdQdFF6?=
 =?utf-8?B?endOUmJuWTJidW5mZXNtR2ZKMXd0dUNzK0UxUkxBNkNTTitlVUlwY0VHTFBW?=
 =?utf-8?B?YUNrOFp1SXh6MHVqUGorZlVpd1Fja0djRXMzcEtSNkExa25yUjVodlcvWkpX?=
 =?utf-8?Q?0U0b0VK5ATzqs3Vws6o59qdva?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3490782-e556-4be6-8bcd-08dd24bd2440
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 08:21:33.3042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJZn4eyONZYSzxUJoxGIIQFYHHwB/kl/WVd0ZVPRqfst+1QQoI49YdSIkQ0PIu7jxspGB7qjyJhgkI6H3+SJLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6985

From: Peng Fan <peng.fan@nxp.com>

For the platform that not compatible with scmi pinctrl device, the
fwnode will not be set, so checking fwnode will make code simpler
and easy to maintain.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..aade6df77dbb2c391741e77c0aac3f029991e4bb 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
-static const char * const scmi_pinctrl_blocklist[] = {
-	"fsl,imx95",
-	NULL
-};
-
 static int scmi_pinctrl_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -521,7 +516,7 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!sdev->handle)
 		return -EINVAL;
 
-	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
+	if (!dev->fwnode)
 		return -ENODEV;
 
 	handle = sdev->handle;

-- 
2.37.1



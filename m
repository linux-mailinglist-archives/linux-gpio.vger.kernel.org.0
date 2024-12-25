Return-Path: <linux-gpio+bounces-14231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 316279FC414
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 09:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 651391883C9C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 08:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C575156F53;
	Wed, 25 Dec 2024 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E3SDPOIf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2049.outbound.protection.outlook.com [40.107.249.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42DA156641;
	Wed, 25 Dec 2024 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735114892; cv=fail; b=fjYjJVLOC7jG0b/beZkjTJ1mzF4/30FZjdClEMqwe8aG/JmIvJYUIpSw5fIKxCCWQ3Cy01imtGBCdOCag92gpudsFIBh7HffpzGKnDN6FgzwqZYWa/+zudv0iEbMB75+BqYcMWZLwHF11jBD/CIUENqnkYM87/toLn3Gb38C8/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735114892; c=relaxed/simple;
	bh=7iuIvV2m5IZ80SX1aloRC2aqgayAU5xjIlmGvZAHaFg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cxEn0WAYK1xS49nUL/b2y22PTZjVUnuztUjX5P3mr5dYG/1L5YyCHuHVeHPKLaqmDK8o8RQsDI1n/TWK6pwpRs1knEjZDRpcPuwJ16ofc1Hutoy2qhhE5zJjHsfe+j9Qmy/WZhMZzRjBCAEpfBDUmg47sl43p6U4E0EgkkJK6fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E3SDPOIf; arc=fail smtp.client-ip=40.107.249.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CU80dJob9T1eAHIZwXdFhxxaauWxN8zC1RhsuRFsZj0MBIzIveUS6qa+4UeCl+K7qKxg0znOyfP7zY65A2iYE283q9UZFpZgT/9ntnu1tjMgMWfjahmezl6RIQL6sEoGh725cBGR1/1wfQuvL2amyj8Z4BrzqneJiYMy3exp4MwJbQBCTUgkO0iGPkeQ0An0PKdYGCLdQQ/v2THNc1sr1SOWE3xeOF0SL6v7AghEClDpA/6XODgAkqiDnFVHLyQmMgRe22VReOk36BU3K0uOQg99t8JfmZv9wgK90obzkvkqvYwD/CwN2/MCVY8kiyCI2NUkobJeRKhgOAUJoibRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhhg+l6MoCUoxwTXACUfTgJ9a/h9kDneVKWHJ+tjLsA=;
 b=MHX3XCjiNfYVGkq/S4o1SVCStxz+i4NnuPXmGS6d2gIYFB1b7zXwMj+zGmz1vhCcnhFsHRH46S627ATrshgjXAEWKICjywY+8W8wUCaYF9c8EFQzVXhz8HNKD+XAvP2lVcV3i2wjVQgI37y7uznKZjNkMPz2I+BqRKZFVUgukKds5m04HR4j0zqUk4pLJqhOZo7tG7U+akSGjcLBeWPXWybPQ2GikvIG4lrADLqxqrj5RqciJ3RGayuZdsFttUT0WBhnovCeEZETKu34/dmgXIZ/+dI3UxCx5/qruXOGjdfWkyRWuBcXhNIX3sB8OGP8U2N463KSGLH9LWwjaOF/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhhg+l6MoCUoxwTXACUfTgJ9a/h9kDneVKWHJ+tjLsA=;
 b=E3SDPOIfKTldbAb8ObU2KGmyrvi/CVg4eJk/wKcR7SKW9zeJiAQJtwTkQERFC65qkKL/wMxi7WLFS8Aaj79VdbfCwOBWknWqGdQFXqlMvEbJZr2+Qqh5ealYjQjAz0JDwxhGJUEJr21ww6oqiAbwFs19HzIt0eKcCnMhLV27LjtBLuQh8/IAHhJQUVqXxfnx8HU7pu8aG5tMFhmIqkmKF7Zxv7WW6skFW95olfVu+5IwAHZkj7vYkdBKhUHXqRksm6LgO+z3RfBOUGx9g3B5Rz7SCZ0/7aGA59BySPYzn02DZiVusANDGOEgkfQL4pX0VV76c5ZqXZL2zxH5cof7tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB8PR04MB6985.eurprd04.prod.outlook.com (2603:10a6:10:11e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Wed, 25 Dec
 2024 08:21:28 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 08:21:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Dec 2024 16:20:45 +0800
Subject: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735114854; l=1673;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=5L5SVCOWRLjb9DcnHQJM5/G+cN8CxkyjHX/FcgJVNpM=;
 b=mUSvpY9QNF3HFPIL0zyrm19xgzMCePqlX96tV456LFxPxrki7GROAnhN5Xxj3e5gWnslDW4jy
 eg9ygHucmFmCLJCc26ZJbnzba84l9OngWW4ufrc5Ev0igfpplSAe6GV
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
X-MS-Office365-Filtering-Correlation-Id: b691dbdc-7b5b-43e9-4512-08dd24bd2142
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K295blY4WVlJeVArRHFubHQrYnB0YmN5YW1PclZIdVpEck12TjYxczFDcjQ3?=
 =?utf-8?B?R09zZ2UwWEptRkVBcVpVbkFzbi9wV3Vqb0g4eTllMVJGeXNSUnUxL3liTWx6?=
 =?utf-8?B?MWhRVUl1NlA5bDNOVkNFMERodTU3ODdENVdsTW8ybzhaM2NkOEZzVGp6dk81?=
 =?utf-8?B?ZWUyTjUwWS90REZRZXVWNUZJczRvZ3BObkY3Ym1TbGtVWDFkMG0zMzh1dmU5?=
 =?utf-8?B?c2Y0ZE0xcDN6NEtGUWN2ZFZYbGgzald4b1BlOXZYbmxOQkU4UHgwMzFxYUxI?=
 =?utf-8?B?VGdPbmNQQUh2M3d2K2hLQmRBN2hTdmJmOXgvQ2REMnZ0dUlvTWNmbDJLQkpD?=
 =?utf-8?B?dWkycUxqZWR6TTMvNno0ck5XaU9LN0w2b3UzVnBCUHQxMzVOZmJYd2hNR0lG?=
 =?utf-8?B?Tlk1aXlzQlpVY1Y0b0IxNXZJa292aVVCN3RNVVdQTzkrRXBmNXZ2Z0dqWjhN?=
 =?utf-8?B?SXFKSzByNzVQeEdGeXYvdHVaVnU1dEZ3d3hrZzVKb2RUNFlQVStyRVozeVpk?=
 =?utf-8?B?aXd5enQvTm5sdVpWZ2dwOURTSkhVOFhpYytmc0dHVWRhelZPSDBaa2VNenln?=
 =?utf-8?B?WTdKR1RLaEJGSEdZWUFiYkdWbDQ3b21ZRlNTOTgyYmFJSVBXMTZNQmh3a1JT?=
 =?utf-8?B?WWR5MUJqS3FEaCtSMGRhYTNONEpBeTV4QUpvcVJVcUgrNm5iaUU5UFlYNjA5?=
 =?utf-8?B?ckFCbFpsVTJMcEw5MDFPVldxeWx0dTZkRkRneDBpUHc4TU9jMUFqTDlUdXNr?=
 =?utf-8?B?bHF3andPL1VyTmtVUnZ2Ny93SGFsMEUvMzNvY3Z4VzBNK1ZjdUNwVGNtMWRj?=
 =?utf-8?B?dWcwY1dWemFtOEtIUlUvMGQxS0dmem9hKzR4VjI0Nk1PQlNQOC9tYjlWYTBa?=
 =?utf-8?B?M1JXTjM2UytRMEYzVFBpOEtUdjN1MlY3eVlqR2o1bXErOEZDSFA5dGt6UGpV?=
 =?utf-8?B?V0RTK2VYWFhOTFhDbCsyVFcvZ0UyNE55NHFJMnlBVm9zVmVMMkkyakdnaTN5?=
 =?utf-8?B?VUtadEI4U3hMVU9zRGQyY3dKdkV1aElHOHdYQmNaU09HME1NU2p6VXJBSmFV?=
 =?utf-8?B?NWc0MTZJV0NRUmlWYzJnUFZUWkNycUFrVDUxeEV3cjA3a1o5WTErNjIxaDMy?=
 =?utf-8?B?RVlxUmd2RWhFd1pqRWtxSkw1ei9LaFc1SG84aE5rcDZ2eW8zVVFSTnMwNDJV?=
 =?utf-8?B?clJnaERnb3VhK08xWUpPN1AwV2VhT2c4VUZwRnRwUHdYd1BMREl2TlZGMDRi?=
 =?utf-8?B?R094RFllRFpEM1o0b0QydFdJZkNIUnpCTkxYUXdzL05mb2dVWDV0ODVSV2xT?=
 =?utf-8?B?aDhrYWVvMmI3VjBzSzJycGk3OFFwZlZwSlpkWWw5S01RWTBIcnpMdEVBS0l4?=
 =?utf-8?B?VXhjbFltbkowb1RXRm9iY2FrcTFqRUM0aWR2bnhnRTZscGNCbEtXNWVjaC85?=
 =?utf-8?B?RDhROTdXYUt6Tmd1WEU1SkZiZVBpaG5jQ0UrMzY2SW53ZDM0dGEwN2s3Q3BJ?=
 =?utf-8?B?Wk5CU3dmcTU5RFRwdkt1VnJoR3VUdEYzVkNPUDljdWxPNlp5YTZZeWQvYXVq?=
 =?utf-8?B?ZmtqNXJKWXZqSjd6REVDQzI2cTJrRFc1c0E1R2lQYklaNkFlNTRGZDZBRGZt?=
 =?utf-8?B?aHZkTFVjaTFUdFFHWURmQXlNdUFaTFpjb1lpMTg1UTJHY2FaOCtYbmcwWlBC?=
 =?utf-8?B?UWVEdit3N1VMOVh3aVc5dUt3R1dteHl4RGNzV0NmeE13c0lkak5qMkovdjlG?=
 =?utf-8?B?L0NwTmVWdnBXcm5YUFduT3U2VGc4dGRTbHFyOGoxdTZHOERnTC9uRkUvak02?=
 =?utf-8?B?STZJcGpBc3N0TlRid2t3VnhSYWVtamVBMXpadjRqYUFVSUZDc01aV3dKbTNk?=
 =?utf-8?B?RGowZHdseXp6b25Gc2pxY0NsMmxtdVgrRW5SUU5HaHU4UWlPSExtZ3pvUHdo?=
 =?utf-8?B?NW5IdGdOU2Y5M05EdXptWGNERTlkbVNGeTI3YUNwaXFwcU92dlVOQ3MwTnY4?=
 =?utf-8?B?emFFejlTc2l3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnZMY1ZLSlRyOXZaQmFiMm1Kb08wbzVaUkh1OVQ3S0RSWE1TZjVvYWhIbTE3?=
 =?utf-8?B?ZjVjdGw2THhucEhYK3NQbnN4T2hIRVpiZEhFVVpmYW1GVm1QZzEweGZ1c3Rl?=
 =?utf-8?B?bWFWVlM2OHN4dEowVjFYSXprdmVKbmlQeHhjZ3NWeUZFREN6QlorUmxzRUhD?=
 =?utf-8?B?aTRPRG4za21uWnFlT2p2K3VzZlZSQWE3UnFNUmhObndXSDEzWS9kUE1hNTN0?=
 =?utf-8?B?Z0lwZG1UWFdsNDRGTkJrWEx5a09XYm10T3JWMWJKVXZ6L211NVhnb2thSjkx?=
 =?utf-8?B?ZitHbGhiMnhPZmxEbmZQL3d5VHYyVDRnTSt2VmMzTkRpcEFzTW91cEFqdXVu?=
 =?utf-8?B?ZjBWbEltclZTcENhUlZ5bER0bEZqN3NoVjdZMzl1cVJCbUZiU3Z3SVVzSlVT?=
 =?utf-8?B?bkpzamNTbjFqSVNCbVptVUkwV0gzMkRFMG92UjltamlRL0FhbkE5ZmVqQ3VD?=
 =?utf-8?B?cWxRSFF4ZFpBdDU2bW5tcGVLcFQ3WjBYVitGbDkxVFliOEJOMjA3UjFYYzkv?=
 =?utf-8?B?b2FWcUd1eVJLb3NoSHF1Zmo0b3EzNFVKbXFJblhIN2JpbXJXQzB0d0JXZGVz?=
 =?utf-8?B?bjh1VGdxT2xsUTZ2OHZHT0lKSE4vVG9FUk00emcxVjdkdVlUS3lqMWpWeVY1?=
 =?utf-8?B?Ly8zWkRxcDJCKys1ajgwMm9oRXB4RmJxOGRmMHZlSDVXWndoaW05QmlkVVBK?=
 =?utf-8?B?RWNXdS9Na3RoSXZueWovWjdtTW8zdW44WFlmVllncDROSThxVElsVm1rY3cw?=
 =?utf-8?B?MVAvMytCbGV0eFJCSXBUZkc4WVltK1N1ZDMwK2MrTWlIVSt2U1NLdmZRRTM0?=
 =?utf-8?B?TjZvaTdNQnBGNy9VOEN1Y1BOZVdRMUU4MjNFT2lTdmFlMjFOV1BPd2l6NXhC?=
 =?utf-8?B?bCtneTVTb0MxUkQ3dFVBSXBzODh0S092RzYyVWdEYklqWGY5YUlLYUZPMklm?=
 =?utf-8?B?Y2hvQXZpOERnTC9ibWNDVExPZVhIeUlSVDVKYXpIbnFPZDAzeEpqeHAzbmk5?=
 =?utf-8?B?MVkxVjNkK3JIN29sYXJyRlZUZXdrMGRwb2JhVCtJcWhNOTdkMXhrT01TUm1X?=
 =?utf-8?B?TWpSYXhNRk5FUzBrOUNEeElrMTZEcUJqaWVIQWk1bGRVMjQ0SmpDVElnNkhw?=
 =?utf-8?B?ZmFqVklUVUpoNUJSbzgzZ3JhKzFDM0pNZlZqaWJObnpzeW1FOHdVNU9wUGlP?=
 =?utf-8?B?UU9hN2RybnNNeERVZnNOY2J1Tk5rVWJDTU5WSUc2Wjh4aEVnVnlteTYxV0lk?=
 =?utf-8?B?ZEFYN3hLMWp5S21NdHY0d3BiOTJ3T2IzSzJLL3F6QlJmSGtMd25TVTBaK055?=
 =?utf-8?B?RHFIRExFZXpVYzBvN1V6Q1VxZ2IwaEVpc3Y1K050UUkxMlZIUlM1YnpUS3k0?=
 =?utf-8?B?NG9zN1kvRnZVSTZVMEVjdUp2cXM2Vk0zRW9TUk1kVkhqRW9TdDdtMGFOZ2c0?=
 =?utf-8?B?QmRjR21uQ0M2Y1VDRlJURGZQdGx3cndkTW1ENiswcE82TWpTYmlnZTQwdE56?=
 =?utf-8?B?eTQwTmc1YTl0YW1Kc2xJTGRwTklzdVc4K212cDcvR04rVEU1cS95VXlmd08y?=
 =?utf-8?B?c3U4Y0Z3NHc3R2JKYUNOSHJlMWp6SU5sVThMZ2l2NWY5enVDeDcwZmZMaGJB?=
 =?utf-8?B?M3l0ZldrMmUrajJrUGR6cmErbVd2V3ZzZ0hVUXk0NkVNZmVvR0wyQlFnUWNF?=
 =?utf-8?B?L3ZoM3dvNzljUVBKQTF6NEJ1QzU5U0ZaODJMckEvR2FNNDBGam0ydFhaWmJs?=
 =?utf-8?B?OWZYTkxoblk1MWJwNEhCQ1h4SHB3UFpaNFBUa1NQMTJJVHJFdUJENTAwTmE2?=
 =?utf-8?B?aUp5emIxZzNKVnd5TjdXVWZTdmpsZFJ1ekNockNxNkN3ZmhxeHN1SzVmQlh0?=
 =?utf-8?B?cHdVTWw3REdHZkcxTExqY21Ec0VldlIrOGM2RERNd2JVM0xzbXhWUGRLSHlF?=
 =?utf-8?B?Qzl0Nm5sbHIvM0FzQkpCS3JQOTQ1ZkxNQk93VzRldHhCZm0xcFpaSnBZbnZa?=
 =?utf-8?B?M2h1QlpHbjVDUERZelpxOXBPeUQwekJFcmN2VWZmdDY1ZWxkdi9GOUJJZHpI?=
 =?utf-8?B?VHI4cXpDVWRzUDI3UG9JTmhzbndYaHNUeXdmSS9oMGlkN2pjeGc2ak1UWTYr?=
 =?utf-8?Q?Y9anB+8PRCfbmmzCXAii03HNa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b691dbdc-7b5b-43e9-4512-08dd24bd2142
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 08:21:28.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZppLKP9pkpwI9ff/lm+ofeDJlAIMZbBjM0t1P9jlaWIqSEOH3J2ddUjUEJaj0exsPpZfMfdJv5Ap4l/YNqp9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6985

From: Peng Fan <peng.fan@nxp.com>

pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
If both drivers are built in, and the scmi device with name "pinctrl-imx"
is created earlier, and the fwnode device points to the scmi device,
non-i.MX platforms will never have the pinctrl supplier ready.

So bypass setting fwnode for scmi pinctrl devices that non
compatible with socs.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/bus.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 12190d4dabb65484543044b4424fbe3b67245466..87665b09c8ff492953c8300f80ed73eab6cce4fd 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -345,6 +345,11 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	device_unregister(&scmi_dev->dev);
 }
 
+static const char * const scmi_pinctrl_imx_lists[] = {
+	"fsl,imx95",
+	NULL
+};
+
 static int
 __scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
 		       int protocol, const char *name)
@@ -353,6 +358,15 @@ __scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
 	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq"))
 		return 0;
 
+	if (protocol == SCMI_PROTOCOL_PINCTRL) {
+		if (!strcmp(name, "pinctrl") &&
+		    of_machine_compatible_match(scmi_pinctrl_imx_lists))
+			return 0;
+		if (!strcmp(name, "pinctrl-imx") &&
+		    !of_machine_compatible_match(scmi_pinctrl_imx_lists))
+			return 0;
+	}
+
 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
 
 	return 0;

-- 
2.37.1



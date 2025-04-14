Return-Path: <linux-gpio+bounces-18767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6DDA87A84
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80E237A583F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897FA25D90F;
	Mon, 14 Apr 2025 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IGxe8u/S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDE225D53C;
	Mon, 14 Apr 2025 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619757; cv=fail; b=e9MgSZewIw/rOjIFOM5ywNMN4cUkt3CkxDojZuzXua1j/rUU4ws+TYtF5irZzcyHLIZJwwyhfgvjCEMxAl9TvOC5lUxyQGK867UqMcM23xIa+A7Pv3uajsqw6TzS9GjJ5iPKif+5T5TuIIMRuh/ut7Fxzge98XG59azT8Gn3ebA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619757; c=relaxed/simple;
	bh=ldaj3WJCLaaSOiCImB/9GpzjKzqFexnnLLxyh0LFknE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=It12ppLM6J7LGKK1Qz7eeD5NEeQzjYhBAgs7fNEOizqNsUd/W8rWrbqvTDoJvdWjjXZMFje9y8wxOynjwhC/Kx199av5mQak3laodFt5MBrqA/6t3hT7vLUKDI541sJKrKnydr+Nk4/gF6NsjP3iueKXF7zGdPJzppxIoxqVKKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IGxe8u/S; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwK90Nyt/h/frPDlRET4gYmw8diWyPcVEc87Vso5JLNsnLcVTnf4xLRxPJgv4NGf/x4F0zEEA6AK9Mpsa0WUcqGUdp4j9+K6dKKRK+dATWAQflJ+MjHWfPqj3wF2lhgyfYElGw5ucopwbHWBDqhDd2QjIMrOm/DCAE9Uu487/O822XiZlQhU6tWW9UggvuaEhqXGPHpV8hC3tVBrswJRVqukUG4/NGBOWeqxrovSDwpeq441XI+zfBUpM20J9TNaDgfk6xT3EGO+fC1lzJfj84UHdDBHOfrxRWIYcf3qoe3mm8CAdHmllzcQJ9Vk0Bjl2Psd82ib/0KHeUfSO9yHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6riI87FgfWMTHZma3DRDOugjhUyjZHXq/7u/g1kHsLI=;
 b=O3xaEAdPfH4B85oY5chAfQ/qAccSuPSBIbD3PahAxVw+kBqQpg1Pt2PBJJAQc4sfSp62D/NKQiqpg9zQ2J810XC4PDN3DMmYBpsvmBfX4OWoHdUcmOZVaDbyz6ovnLT7T8DPFvxAqDRNWCF5MLyisqrJScuZJFBvq/UApxB84Ma7MMjJLIQAB6pN5MQM7yYUlFSEMIwJUq81Yr1hurgIV6kglbBHPOnz9Z3BhaBmKNtcxSCprtJqy8/Lkf6AQ6QrHVKjHjUWSjhrF3LFnET+wlEPAaTdtx0rsuE4guw4Rlp2cY8HnvXYNhMJ7ss/ct6RKYP7DAz3Q4X1OwGjVrQhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6riI87FgfWMTHZma3DRDOugjhUyjZHXq/7u/g1kHsLI=;
 b=IGxe8u/SzZOHGThbfs/tiu980LWyKzrzhyQoiTwCjQXNS4yWyQ5oi/SAThxoUPQGPAyuAF9bcDpm4VfpZ5eaSqjbpAD8Hku06foI2lrUm+LS83nVtpz8nUb7DLRVMfqqw38Bse2cn8y/CVeQy0MO2lLbAOMxIJe+hsH4xLSwimWGPwnXRKOllrKmHY1QrKm4AVuu+2p/duFub41jVdd9NzvWwVqO5VzG6elGE8gfs4ehhuGxJY2kUGndQdATk4b8Ee0iMOankPgHbCiEPh2xMDrCXSr7+PmCEQVyF3UyPMM3SoiUr7VggjnnlFttQ5edwuuxfRk6TZpn2xW/Sr9SDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8408.eurprd04.prod.outlook.com (2603:10a6:102:1c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:35:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:35:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 14 Apr 2025 16:34:25 +0800
Subject: [PATCH 3/3] ASoC: codec: tpa6130a2: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-asoc-tpa6130a2-v1-3-5f4052e656a0@nxp.com>
References: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
In-Reply-To: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619674; l=3512;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=3L8NFvdG6SDDUzUat/sgQEjAwl2zyDtxQYHTZRaH1Mw=;
 b=HueKIvVhujXmU7JE7FpCWIEoYDq1LmtzbxJHIeR835LSFrerkUYW9QvBc8fe8tV+dBUzGXCeo
 hX6eJYbaXa6CakLzJ+/zK5jsaeDGmdyeMtwMEVHpif1ap1okyqVu51g
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: c8245d70-c5b3-46f6-9edf-08dd7b2f5dbf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjBjQnJ1UXA0RDQ2SnhNUXlScldtRG1wNytId2FmbVZVUWcvMmV0RGhudzJu?=
 =?utf-8?B?YVFwQUpYcXdKd0o2amNFZTZrTnJCb2Job0NQL3BIL0NDcmgwMnBSbjQza0Ni?=
 =?utf-8?B?OE1sUXRxaDJXaFNwblRoaUppbXp5QWpHM2I4NHBVUDQvOFJCeTl6OVBwb0ZF?=
 =?utf-8?B?MndMNmpvSGNtUmIxNTFiV1hmM2NsK205VndLNWtmMGJ6M1BYTlFsUHV0c1ln?=
 =?utf-8?B?anEvUFl5TWRCYUNwcG0xRGFPa29RREFzRXc5N2F1M09tbmFFQ2UxNDJwbjB3?=
 =?utf-8?B?UEdpTzZiZHNsWkc2emdwQjRmWjhHd3NvMTUzRGxCUWFnaUNmQWNUM3FyMHF2?=
 =?utf-8?B?K1hLS0ZxVFNOd1BqTDdqYlN2L0ZwWS8wZVdUL2JSUzNIeUIwdzJDbkdlQ3Zk?=
 =?utf-8?B?Rng3YmM2bjd5aW9haitpS2NtLzIxNHhBRVltdkc2QUI5U25lTjlBSkVvWWdz?=
 =?utf-8?B?SjhZREEzYzVWV3poS0h3d0hubHluYnJJaWwreGVCNk56cDNranVMZVgzQmly?=
 =?utf-8?B?VkZVOUh1R0NnMjBCQjZqRGJpb21vNGpjTjc1aGFhWkhJNUc4RFEvVEJZNkpP?=
 =?utf-8?B?Z3JWcWp0MFFGSUJoRmllT1poYXlYamlJZkdZMVhMRjdXNWVwN25RQWJ2bFd2?=
 =?utf-8?B?dkc3QldlYW94b2dNY3ZZU2d4L1Rjd1p4aHd4UjRSTHNPZDFPcU5Xc09sbmRD?=
 =?utf-8?B?Ky9vUEd3SmY1RkE2UXJwcENMY085cDBJTHFYNnhpU0ZMRDJyelRIVjFnMitV?=
 =?utf-8?B?ZDBpT09nMWtqUjdUMXJ1LytrVURJbTJKUTZna0RJb0tQaTBKWGRncDNHT1M2?=
 =?utf-8?B?emNIdXJZYmhLYklWeklYK1FKVERuWUtrVnBjVXZ4MVpRdnRzQ21oVmFsYkRa?=
 =?utf-8?B?bkVYMVV3NWhOeFUwZndNRWVXNG93dy9HTGR6Z3FETmloWDRTUkFmeXNGRHlt?=
 =?utf-8?B?ZDlBb1FOTnlXL0pGbEpmRGoxaFBTK1dGckZyeHQrWWFVVlVwR1FTM0NnR3JE?=
 =?utf-8?B?MU5yT2JwaFR3bVpmZFRXaS9IRno3K1Q5dzRjWmdQUWFIb2xGYlBJblVXTWFt?=
 =?utf-8?B?VTVqemhTdDltaVdzSGdmK2R0WmZYdmtFLzRMOU1xbFlxc0pFMDgwK1NOQlB0?=
 =?utf-8?B?d1N4cUdoMEpaUTI1OGE4eDJkR1NnY2hkeHQ5WXgvblB4R0tRdDFWZmJPS2d0?=
 =?utf-8?B?aGxoNDhWa21uTTYrcCsyMkRBQ0M0YjNOTDlMNExreTdYNTI4V2NOK05yTFJs?=
 =?utf-8?B?YWFtdUdRcFBuRzhKOXNZSVB6ZXZ1NW5VRkdOV3dJWFBHUVRQR3phRHlBQm4x?=
 =?utf-8?B?RnBSQTFlK2xnaE9UYWhEaldkd0RGQTlHRnZiM0RhQXp2ZEN6U3RiMlYzL0J1?=
 =?utf-8?B?K29Hb1FUYVlxeWFGUmFXUWc0ZjdoNGpxUUMyVVdUeDlWbkI2c3VrTU5rd1Nh?=
 =?utf-8?B?SUJSYXltQ3J2b2J3YTJsTzRrNURQZnJmUHA5Z0JUQ0FuWitwWFhMVFhjN3Vj?=
 =?utf-8?B?TEVKYlpuR1RnamtWNmlWeXBxdGJWc0ZhMUpWRnhNU1hHNTFMNkJ3WjhFYjVy?=
 =?utf-8?B?VDNMRHBkWFdoa2QzYTV1Tml4d0FaS0IzQ0RpV0VSQ2tzejNLMGRQb0pLdGVt?=
 =?utf-8?B?QktWczlTSVZVQXBPTVJRYlhzK3BCZnFjTlBUdnlweU9VK095cUxFS1FvN0Fa?=
 =?utf-8?B?ZkZObGZvRlRCeTM2ZkMrejc0czJ0aWxCR0loYjZZZ0tVa3h3ZU96Z2k2eHNI?=
 =?utf-8?B?T0F0RnBlV0NzV3RVdVJuQ21uVk9MYkN0RG9DYzVrQXVsYjdYOWNWSXIzb0l5?=
 =?utf-8?B?eXJndFVrY242QjdaQzI1SUpYamtiWlZNN1BoYmkvcFd0Slg2ekFXR2VTbkd2?=
 =?utf-8?B?VzNqYkNuUGx3MU5DcnVhMFRCcXNhdzdYbG9PTHkvVXdORXlKMi9yMXAzMjdm?=
 =?utf-8?B?Qk8xRE1zQXR6aldtTis5RUhpVHpiem54eUpwcThKOFBLeXNNb1lPQWl6T0oz?=
 =?utf-8?B?MllSQTVETGdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UElqdXNVa0FXalYrQnpHNWFNWHlRcHVIanRINDlYZ0pvQ04rTXhkeXFtZWto?=
 =?utf-8?B?cUREbzE4VVdVd1J6VHZjUEkrcnhyNmtkaERndGtXOHNOK1hQYWhWcktPVHFZ?=
 =?utf-8?B?ZC94YkM3WmNuMmp6cElHZUdlUjZUcThRcVl6Z1h4NVV0d0pjcDlxQjJNQnJm?=
 =?utf-8?B?R29jQlJKVWNzbm42OEp5d3lUUkg0Z2pZalB6Mk1hWVozdFlsMWFWZVdrQmtq?=
 =?utf-8?B?UTJtb3FOeWRnenhtSGo2TzYvaFJLdWc3aEZuRWVKdW9FbjExQmNUNllXNmhM?=
 =?utf-8?B?dEFQT015RUpHYWRLWUJDT01yODFNaGhIMTBndkR1Nk9RamE1eWxHcHJTSGxQ?=
 =?utf-8?B?d2I2Q2VhbjRYTjVtWitIeEM1OEVoTWcrOCswRDZzcjEzU2YxRGhsSXJFOWIx?=
 =?utf-8?B?Uy90V0RXR1BsTFgvMk91SElJRk5tYXpvMHVWcTZMOHlibnMrUEpJV0xIYlVs?=
 =?utf-8?B?M3dZSVYxQVFFckdyaDVyOFFCSVBENVI0bXdyUnhFQlNyME54YkdzVWwrZ0xq?=
 =?utf-8?B?b2htVlYzeVEyRkorM1FPMjJMcDA5dmd5bzUzQU5lZ1ZPb3d5RW9haWpqVWdE?=
 =?utf-8?B?M2NMSENlQngyU0h5NjFLMk5zY1RNWDBuZmIwNnF2REQxeGtWQ3Y1b1VoTktq?=
 =?utf-8?B?VWFxWG5GKzJSd3dIRllLUDhiVUEwM293TVlCMzRZdWIzbjRQdU8vTm4vc1hS?=
 =?utf-8?B?OFpzMnpNekNGRkRuS0VxNGdSbEZUQ0Nic3dRbUN4V3RjaWE4UVhOdGZITExn?=
 =?utf-8?B?c0FkMk5iVzR6a1Rxbm9xTTFGOHFkNUZidEw1dVZuNmh2eG5McFprMXhCQTlw?=
 =?utf-8?B?dXYzS1RMa1VOTE8zbkx2bGFJYjIvZmpvcDZ1Y04vYVAzZndqcWVNd0hwZUxH?=
 =?utf-8?B?UlFJNFdwV2FNOXkzZ3hQczhZQkJTaW1CbDNGazJoeS9JUm1VVjJSQTFLUkxO?=
 =?utf-8?B?c0NtbGZZUXZWNE9uKzJHT2cycjBpR3Ivd3pQYlFDbzV6SFBLcDQxbnhYWGFR?=
 =?utf-8?B?a05OS29sV0Y3SCt1MGlDcnF3cmduQnVHMXpvdDRGNUtlaU1VZVF3V1FpcVp5?=
 =?utf-8?B?ZVcyR05SOFhadkwxQzBHcDdQMElEVTVKY1pQTElRZjFXdC9GVkt6S25icmZk?=
 =?utf-8?B?K0drSmNQeXd2YnFtNnVKVFFJRjdDL0h4ZkZRRGlXQ2ozcUh5VjNlOUVPRFJQ?=
 =?utf-8?B?V3BXTHppYXc0dEFMaGxDNXNhTEw4NHZQNVdxaEVFNkhPSWNUQ05IcXZxRzRR?=
 =?utf-8?B?NEtod2ZuRThsVXgzWjdkMnpjRmtML0pucHFYL1pjMVhoalJsL3JDZ0lzQy9L?=
 =?utf-8?B?b3ZuRllsMW9WdWtsN2szTFQraGl4alY2c04yYjlzWlFVWGpTN0k1UTg2eWRo?=
 =?utf-8?B?MkdDYjdSdXFXejFWRXgwaEY2UzZLRlBIN01GZ3N3VVFiWC9lTkJkMmFpdUVp?=
 =?utf-8?B?dkhlVnh6MmNXaTlDRkN1enNHTDBzQVFZSXg1RFd4VjZlaU5KK2dlQVQwa3BZ?=
 =?utf-8?B?RDNBNURuU3ltT1A1cVl1QXc0SGloVzdVcUdSUTMyOE1MbGZkVzl4bnB3TWZk?=
 =?utf-8?B?RVdCMjNiRnM2cHo4SzN3bTM1R3h4ZGx2K1FmcFU0RXRtZmlRc21QNktJQkNp?=
 =?utf-8?B?MlFMeUpLWm9tY0RueDkwWnZSUndqVWJzdzdoR3VENnduSEw0SUZWRmIzQ2ly?=
 =?utf-8?B?QzNMN1B2TVJmUHk0MzZzOEh5d2dPNk93R0hkZmZKN1lmV2xraFdQUUV4Qkpz?=
 =?utf-8?B?OUJ2QW9ETktJbnZ1SlYwT0FSeXRQUTJEM00rMlJqL2FiMGRPaVZYMjBTWFdI?=
 =?utf-8?B?Zm1WMU1kUXliQjYrSGNGRW41aEN2R0VxMUU3VjB0QytPUnJnVTRTSEZvWlFj?=
 =?utf-8?B?Sy9vMHYySUZ4VEUvUzh2NE5CQmhJMUdTb3UzU1dxbTVKeGEvTTJ3V3cxWWZa?=
 =?utf-8?B?K1lOSVp6V1NESUU4eDYwbjFhYXMwOTg3T1NpUjYrS0E1VVVrSzZORXl3bEpu?=
 =?utf-8?B?ejhtL0kyY1pkQ0VwVVUzeEZraFlVMWNuZ2pDSEdoWEpyY1pENGVjWE1XTUNN?=
 =?utf-8?B?anA0dEFzVFd1L2E0dm9GVTZCeW9pRnVSdEFHMjJHY1VWR092UzdoWC8rTnhw?=
 =?utf-8?Q?JI51kguiKDIpVV2kQZrfOf6jD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8245d70-c5b3-46f6-9edf-08dd7b2f5dbf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:35:52.4262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WIDCwaop74uFv1QlXHnfbHeRJ9q5mlBT6yZyEB4bvgdGHBd0My+GruKqsFzsgq40j4Wz+sY98ieNB2lLgylgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8408

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
- Use devm_gpiod_get_optional to get GPIO descriptor with default
  polarity GPIOD_OUT_LOW, set consumer name.
- Use gpiod_set_value to configure output value.

Checking the DTS polarity, all users are using GPIOD_ACTIVE_HIGH.
so all should work as expected with this patch.

Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/tpa6130a2.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/tpa6130a2.c b/sound/soc/codecs/tpa6130a2.c
index 43cd957eaf321e8cff784e5d781e8e99d2c3ae89..38cc000891eacafb257a959b44f157413faee5fd 100644
--- a/sound/soc/codecs/tpa6130a2.c
+++ b/sound/soc/codecs/tpa6130a2.c
@@ -9,11 +9,10 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -32,7 +31,7 @@ struct tpa6130a2_data {
 	struct device *dev;
 	struct regmap *regmap;
 	struct regulator *supply;
-	int power_gpio;
+	struct gpio_desc *power_gpio;
 	enum tpa_model id;
 };
 
@@ -48,8 +47,7 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 			return ret;
 		}
 		/* Power on */
-		if (data->power_gpio >= 0)
-			gpio_set_value(data->power_gpio, 1);
+		gpiod_set_value(data->power_gpio, 1);
 
 		/* Sync registers */
 		regcache_cache_only(data->regmap, false);
@@ -58,8 +56,7 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 			dev_err(data->dev,
 				"Failed to sync registers: %d\n", ret);
 			regcache_cache_only(data->regmap, true);
-			if (data->power_gpio >= 0)
-				gpio_set_value(data->power_gpio, 0);
+			gpiod_set_value(data->power_gpio, 0);
 			ret2 = regulator_disable(data->supply);
 			if (ret2 != 0)
 				dev_err(data->dev,
@@ -75,8 +72,7 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 		regcache_cache_only(data->regmap, true);
 
 		/* Power off */
-		if (data->power_gpio >= 0)
-			gpio_set_value(data->power_gpio, 0);
+		gpiod_set_value(data->power_gpio, 0);
 
 		ret = regulator_disable(data->supply);
 		if (ret != 0) {
@@ -230,7 +226,12 @@ static int tpa6130a2_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 
 	if (np) {
-		data->power_gpio = of_get_named_gpio(np, "power-gpio", 0);
+		data->power_gpio = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
+		if (IS_ERR(data->power_gpio)) {
+			return dev_err_probe(dev, PTR_ERR(data->power_gpio),
+					     "Failed to request power GPIO\n");
+		}
+		gpiod_set_consumer_name(data->power_gpio, "tpa6130a2 enable");
 	} else {
 		dev_err(dev, "Platform data not set\n");
 		dump_stack();
@@ -241,17 +242,6 @@ static int tpa6130a2_probe(struct i2c_client *client)
 
 	data->id = (uintptr_t)i2c_get_match_data(client);
 
-	if (data->power_gpio >= 0) {
-		ret = devm_gpio_request(dev, data->power_gpio,
-					"tpa6130a2 enable");
-		if (ret < 0) {
-			dev_err(dev, "Failed to request power GPIO (%d)\n",
-				data->power_gpio);
-			return ret;
-		}
-		gpio_direction_output(data->power_gpio, 0);
-	}
-
 	switch (data->id) {
 	default:
 		dev_warn(dev, "Unknown TPA model (%d). Assuming 6130A2\n",

-- 
2.37.1



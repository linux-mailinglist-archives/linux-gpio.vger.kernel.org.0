Return-Path: <linux-gpio+bounces-18405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF77A7F260
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1599616FBB0
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D429525F7AF;
	Tue,  8 Apr 2025 01:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y+Nn2NIy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44225F789;
	Tue,  8 Apr 2025 01:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076514; cv=fail; b=UbDl2Jyb+lmzFKlp1e1+D40hZwE8nDa3NiQMN6BpWd278KW9Jy0+uAgdKCVTVjMvpJjA6zZNx6i1ZVJf+YnEK7Sl/orwmwaAgn0NAf3L0rqAwgkc2X7M9dK8IwpNhU3VWNfGRTXutCT1ZD9/HB9c9ZExd/gBfOTs31dhzwkgp9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076514; c=relaxed/simple;
	bh=7D93rBwrtDWjrWWdIfHgswCV6+Hxoig3p6KCx2EB3A4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XrA8VNudPz6u9tb8+IpcbAGBdg6hdJB04/MLMhn1vMxJRDm9bKb6r8cW6dTIpE3FUProZTACKj2Ozx27DBYLQyZeCz4Uoa9OKDhT2vxmQTdoXu4Ly98NaOHOyFIoz77pWszOF4tWzkE3zLRWgiegs24mZ0g9b2Y12zkjsLbjsEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y+Nn2NIy; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFGuqZ3hzr9pTx+KklylX8/YJAneX10/WMhpBM9aFsj9+r61/UIQ6C1h3B4yZ3B2HxPlH390hL40jD89o3thlvoDE5O94J5Mcd0RIrj8nYgv2NdzqX9xDvWNE9mqaxla5ZPFi2Wv0vaOBfdF8yoD0RKcwVcWv1Ksa6SGUgG5zFauqgqNkYLroApljIM7pb9mr7RdVbT+AZHwUvg5Ps57W31xs3Uh3pugmkseeQNjT+VPwuCil4owCu/6fNEV364E2/AIsM99ZzRJY60CzqtooeNhlzpozik0vSiUm3GPYssqTXPD4I/zMq9oc/sJf65HYdE6Fty7wCxDqrvaHK6XbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUu1mv49O+IP4RPmCr/EpuMW3oRiit0FPSBIFJVE3PU=;
 b=p8O1W/0+GAyVf6iZtnnBwHAdplTsz9Dd8yfB/sEjGZRxbOCg0u2JkJWqM5L2G1M+oJjQJm4SWplc6vUw+Pzlwk97JEQAPEjLzZIiUtgKWteiDfIlFtxRpwaY5JgBsH5oEw0cx8JZMOv2G55Zy3fER2sIy5sMLMci8lw0g/7cqh8lF/tYQ843hch0H/xenMRLlaRMgBFYpDPFKN4FgUk7yKBy1znp6V5aGMvAA+qR8L+gQuj0BWXv6gDVs37CdqSn5QfEzk2AH9zLNZuW8+v9p5e7G1LOUHUNwCYfrhAX1ouN40I+kONSo6nX/0icyKjMWYdaNFCmWARC813kBzYrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUu1mv49O+IP4RPmCr/EpuMW3oRiit0FPSBIFJVE3PU=;
 b=Y+Nn2NIy8PNIG4QAHBWmuab1XVgei9G8JRhjVcXxIx1BV/BLljflMkV1coOR1GVLaFVq+NEEd+C2L6QJ6rUeLnhXX4ss7+4Hvlor8yroXK7vqUZPb88It99L0cYgA1mvJVUQu4MGfP5DxSmkA6k1pFubb5NN8p0THMKxCwsPHS2x+Zrtp5/pmNXBehSGk6ofHTKpOphK8M7gjzhFrn/SNNqknm0s+2aZVloKeMu0fxFyohPoeokuosjGPiXQfyhvTVuvsVcrH2vzW4bFXi2uT+rxapacAVYPzx9B9/Weue1XSJjqZB6395h3tClqAVBrVOzOttqnq5uZcA1rA380KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10583.eurprd04.prod.outlook.com (2603:10a6:150:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 01:41:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:41:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 09:39:58 +0800
Subject: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Peng Fan <peng.fan@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744076413; l=3864;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Zs/jJQY2hY3p30GDERt8fUCWPhlrXep3P/D1YZa98bs=;
 b=w1+UmylZ7e2YOe5VOPvasQNL6NVm8fN9S4SABhmM2siPmqxFKuPWYtHIhip4HO+u5YTFlUMzv
 qyqh+m8xl/WDrnbhedWGeArGUUcM+Ae3u9ag4NhJBJFVGUZ5KAKw2rD
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10583:EE_
X-MS-Office365-Filtering-Correlation-Id: defb0706-dea1-4c64-ad47-08dd763e7b9d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDNlSHNBcThOSWlnQmJ6Vm9maEE4djdXZHdhSUlpUnJ5eHcyeHM1b1lkaEF0?=
 =?utf-8?B?Q093QmhJRFhrYmVtd2U0ck5IN1Zab1JsNUh5eFpCQ1hibFY4NXV4bkd4YTQ2?=
 =?utf-8?B?V0c5YTNGK09GTHdBdzdvb3dGZXVJU0VIWVBPRmVwTWV5aURKMjlXdG5za3Zr?=
 =?utf-8?B?S0dvNlArVmVWdzl1Y1dnOXZxYlVRWE9KaFhNR2JQWWhEOG85RWM1ZVQ4Ym9w?=
 =?utf-8?B?d2wya1lHcTBxVEFiL3Yrd0pCU0VaNUQ1S01LY0NGZWwwUlhaMUFVR3BjeFkv?=
 =?utf-8?B?dFBxL1NqdHZTM0RGYkFLTnQ4UHI5Z2ZmRnJLaFdOVzBTczBRaGFPRnQ2Sjl5?=
 =?utf-8?B?WXVtVGpDSSthT1VxQXQzcnlBOVJNaTk3Q3BOZlBmOVVTa3N4eXdNMjhDRG8r?=
 =?utf-8?B?RWVtcjRnYUQwWUZYN0YrWWhPVUZ3ZUFGSTYvSDNmWjgxQUpxY0MzOCtzMktN?=
 =?utf-8?B?R0pJK3l1VVZ6UHY3ZzZzRzV6MHl2VXNrK3ZJUkhqWEc1RFAvN2t2RndqdmtQ?=
 =?utf-8?B?NGY5dWpMUkJoY1kydnVTWVhNTWQzWWorazYweDhjUnNFL2VzUHV1bmM4SUlh?=
 =?utf-8?B?dUdrNHhtSHhJdEVXR0UxYlBJYnZYMklnSlNNVUxKV1VrQlp4Ny91dERsc3Uz?=
 =?utf-8?B?bmQ4MVkydE5aVjlTZFNkZ1JDdFlwTHNFV2wzNzkzMEl2bHM4anRtSUtmV3dC?=
 =?utf-8?B?c25ldHlQVjl6QU43a2JkdGpKTnVyb01seWFDRUNxRUYwNTRGQWdIWlZwdVNG?=
 =?utf-8?B?ejAvdDd3dHZXN1NuYUZBSEd2ckpXd2FLMzVQditlWnFSRTFBKys0dzg2WFk2?=
 =?utf-8?B?dVhPUEJUWGNSU2krNmtadk1aT0Q4WkRSemZwOFdlL2pEN2dSVGtMNmlKd3J4?=
 =?utf-8?B?a0E4UlNheGlmcEhjQkZVR3pIa25KOS9VK291REZSYWFVeFVQT2hETURGVnhS?=
 =?utf-8?B?VTJFRTVReDQ1dDhscFYxU3QzTmlHV1dUelVrWFlONzhYNWEwb1FnVFppRUdS?=
 =?utf-8?B?WmpQYjBxNE4xMTNWdkpnQnBIOURRWWdyei9vakZXdmYrY0FPc3ZITUlZalFa?=
 =?utf-8?B?OWYzZ2ErZWpQQVhYcUFMM3B6M1NJV1EzYVUwcEFDaWQ3YURydjZYandTK1gz?=
 =?utf-8?B?ampGUFpFSUNDOXAvVzJqdDZGQXpFMXdXYVBST3lqYlJ5ZjZYUGxNUEFVWkNz?=
 =?utf-8?B?dnFtQ2dHRC9iczErUFZ0MURHQjBGY0FIMEh5RHR2L05NYkl2WEpPRzB3cEJE?=
 =?utf-8?B?aHUyWGE1RWI4WUo4cTdCcWIrYlRHa3VVTXY0eVR4UHJlOEt0M0gzeGVpSHRI?=
 =?utf-8?B?WkFWUGxUQ0Z2VnRQUmJIVVEzN0F1Yi9MLzdYbnhDb0FWcGdhMGtwc3IrZUtR?=
 =?utf-8?B?eTRUeTRLSkNvTUtWaFhNSWUyM29VOFl4UlZlTDdGaFFHVUtrTXJRV3FOVjhI?=
 =?utf-8?B?OWJmYnZHeDRVQWFuN1R3aFd6UXJJc0syUEpqSEpUWFhKRzIwNjBCSkgxMnlx?=
 =?utf-8?B?eFNMWXU3TEh4cXlJVnVxaSt3aDRVQS96TVBOdTRZRGN1UWduMndTVGZ2NnEx?=
 =?utf-8?B?dk9TSHI5c2pJb3locXhodE42VmJodVFRcGtUWGg2RE11a0V3d1hMc2Jqd3VX?=
 =?utf-8?B?dHNudmNDZlhHaC9BYnhtQ3JiVEtmbUl0WXR3NmhBVHFwMWpQMEY1VlJjVVNU?=
 =?utf-8?B?eGo5QVhRUHpQaHRWeUQxOFpmMzVqK0VHOVhSM2dRQ2x4QmN5a3RnUVdjdEd2?=
 =?utf-8?B?cmVoWXZvVHZPMEdYWUtFM2pVNXo3bHo2dG9pcllrWFdESFcra3M1SUhHeHM5?=
 =?utf-8?B?cGhDdDZVTFhzRXZSYjhESGFudlAxaG5FRGVURnRONGgycWR1WUNlMGRMb2Iz?=
 =?utf-8?B?MVRvV2s0STVKNUpWUGtPYitVRytoUjdlckQ2Vklhd05YMmw0NnJ6MHpYMklX?=
 =?utf-8?B?QkE0QXM2d2F2bmRMZzdSV2FWTFl2bnFnWXBGcVcrRTRBT25CNUQ0RkROSHVB?=
 =?utf-8?B?R1o4K3d2U3pRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnhqSUFtSUdzalVqYU9FVTRKemZGNTF1N0FxdXRsSndLUThJcDhFRGhxQ0gx?=
 =?utf-8?B?QTF3Rm9rSU9JRmE1UGdQaUdTQTdjVUN1Z2lhQjdxUVl4aW1sWHFKN1U4TTE3?=
 =?utf-8?B?WlBwTWJxbHlCR3YzK1NNWDBYUnk0K2hjUzRmNVByc0M5S0VmZ0VRRU0rT1Nw?=
 =?utf-8?B?dnA5MCtvcG9aRjFEUjdVcWNKMU5vRVF3UzIzU0xZMXB2ZHNjcU40akZFWkFz?=
 =?utf-8?B?K2tHZWhpVmpXdFpVVExSTmFqTzdOYkI1bFkxY2pOa1o2dTB3aUpkcStuK0FL?=
 =?utf-8?B?YmJtZnFDd295ZzViQVNHUUU2ZFlNWlI4QkZRTWdWU3NrZ25SNk40UXJ5MGZx?=
 =?utf-8?B?d0xQSlVOR0dJdlNnbmZtYk5XRUUwS29Db1ZHbkZuK01NWHFXMGNoN3JqUjRW?=
 =?utf-8?B?YVhabFBacFNCWkdTR3F1VElYWlYxVEU3VXRoZ1RLb2labHcxWk1rVkszaGh6?=
 =?utf-8?B?TFRrQWlPZDkwWHBKR0wyYzROWDRWeEcvclVEQWNFOTV3Y0tMSXRiYzM2TXp5?=
 =?utf-8?B?d0JleDJqR1pRSHBZemFnOXFHVE1leE9VUHk5TUFjZWxsYldNU1p4SE1uS1dG?=
 =?utf-8?B?Mm1NeXdwZHBIeDBHcTFkMzlxMFdtRlgrZVl2RHc2SkV0K2ZjdFFJZjl4WVNz?=
 =?utf-8?B?U2JPcyt4NGp3Z0RQdjhlQzQ2cG9lU2VlNktEMnBZc1IzM1hkcVQveitKeXhU?=
 =?utf-8?B?M2pFdFoyRmpTQTRXRnBTTUFRamxSQ01ZS2duY1UrRGRwRkwwdXhpYUczbDdD?=
 =?utf-8?B?bDI1d0Z3MVB1MUJPWmFxMXNYdy8zcHZ5TmdkOGdRbU1uRDhkTXVlclFvNDEr?=
 =?utf-8?B?aFEyTDB6M29OZG52NXE4NFJrNWkyWXZaZHRraTVpdTVUNSttVXlzdVM2QzJT?=
 =?utf-8?B?RHNMTWxscy9sNEcrRnM0UVJ4T2xROXRyWWY0aGw2QldVVmtLYVJZcGdpTlQx?=
 =?utf-8?B?RU5YcGVZdHNpdE0wbkdZRkUyOGRibHdiMzhLbGV5QWZjT1R1dFNvakcya1oy?=
 =?utf-8?B?WFFtdmdVbkxwaHBuRnEwcXBOYnp3cW5OVWZPVUpCaUN5U3Z5YmJtV0VNSUcy?=
 =?utf-8?B?YThMQVZpTE1ZTUZsOUhJU2F4UFhBMFdsalNlM3g2c296a2p5MXBhMk1uWDdV?=
 =?utf-8?B?aGU2K2hhTEFLSFJyVjNKajZTRk9zOEx0bmg4eHVOaEl2R2ZBTDJPZmNnMWt5?=
 =?utf-8?B?cElYcUEvYlZxd1EwMXNvYkdQWHJEc0NQQmQ1Zng2T2NOTWlEZGlnMVdDR05O?=
 =?utf-8?B?eTE4cXNUSEx2dmgyZnpMZ1pFcGZGdkNlNEJVSHVoTFZSeHdDRlFRNlE0cUE3?=
 =?utf-8?B?RStBcHBHTWN4eFZ1OXIyWW9uWkpvUlltR1VVNFhEelo5dVMxTGVBWUVuV2Vm?=
 =?utf-8?B?TU5SY1dFbGMwQ0F4MXlEZlJ2L2FabXpjbXZtcDd5bmZDaEU3WE1KMUcyUEtn?=
 =?utf-8?B?K1JvNjc4c0lXdkRYYXZJTFV3SkRJTUh0ZzM0TW91ZVNZcU04NlJYdHJRQnRy?=
 =?utf-8?B?U0NmTExSdUZoWldaV3BWaWRuVmFuZHR4MFB1UEZ5Y0dHSjIxdHQyNWhJUzVB?=
 =?utf-8?B?a2R5cjltVVNhN3l2dXIrcEtiLzlPSnMxQ1ZESzhVbTE2RDNlZWMzSTM4c0Zk?=
 =?utf-8?B?SnE1OVNOaEJWUHc5eG5PLy94NDJySk5QZVBlK2cyeVA0c3BxKy8ybWhOWXVz?=
 =?utf-8?B?SVlSdmg0YnMxRTlpVVgveUZmMWw1ZlNnaVMxUnUvU1NuSE9INno1QWwrbmxp?=
 =?utf-8?B?MHAvMFF0a2FuWmI1Q3RSdzV5UkhabGkrWDRZWHBKR2krTVVzQXFJSzdScjZh?=
 =?utf-8?B?NlFXOW81YnZ0NnZEaVErcDQwVG5IWTBxekVmSm9BSXArU052VEp5dXlYL29v?=
 =?utf-8?B?V3F4UzllL3prb2VRbzNtczQrN21jL09iaXBNekg4YUxoLzc3Z3B3Tzd2VFVv?=
 =?utf-8?B?NXFPd0sreWRIU3FDM0htMVFqa1huM2lJU2tmTnlMNVVWOFJsd21sczZUbys4?=
 =?utf-8?B?OU8wRmZRc1NRVkpsSXhmRlU4M1ZMakdCKzFnbkdyc0orZHZMcDhBY2dTTy9I?=
 =?utf-8?B?Z1NpdDRNRVF2b09EZ1RQc0pyOVN3WERRZkQvRXhURFF2Zk5OR3RQUkdoU0xo?=
 =?utf-8?Q?V7mZ5TTmyopUtLzptYVkW+Au3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defb0706-dea1-4c64-ad47-08dd763e7b9d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:41:29.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNW3v4gkjM1a4xNzhIxF3JzuhkBZLtMeLR7iPrHdg6oeoFCVgt2wNWfMBNSYUO5KEx5vvzgx4JaSJcEDFw+DSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10583

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor, and set consumer
   name.
 - Use gpiod_set_value to configure output value.

reset pin is active low, so when request the gpio, set GPIOD_OUT_HIGH to
assert reset and later deassert reset with value set to 0.

While at here, reorder the included headers.

Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
polarity for reset-gpios, so all should work as expected with this patch.

Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 44 ++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 7dbcf7f7130b04a27f58f20beb83eb3676c79c3d..1423186f5a6c181a20dd2dd552679d33174edaee 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -9,27 +9,26 @@
  * Based on sound/soc/codecs/wm8974 and TI driver for kernel 2.6.27.
  */
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/pm.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/cdev.h>
-#include <linux/slab.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/of_clk.h>
+#include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 
-#include <sound/tlv320aic32x4.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
+#include <sound/tlv320aic32x4.h>
 
 #include "tlv320aic32x4.h"
 
@@ -38,7 +37,7 @@ struct aic32x4_priv {
 	u32 power_cfg;
 	u32 micpga_routing;
 	bool swapdacs;
-	int rstn_gpio;
+	struct gpio_desc *rstn_gpio;
 	const char *mclk_name;
 
 	struct regulator *supply_ldo;
@@ -1236,7 +1235,14 @@ static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
 
 	aic32x4->swapdacs = false;
 	aic32x4->micpga_routing = 0;
-	aic32x4->rstn_gpio = of_get_named_gpio(np, "reset-gpios", 0);
+	/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
+	aic32x4->rstn_gpio = devm_gpiod_get_optional(aic32x4->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(aic32x4->rstn_gpio)) {
+		return dev_err_probe(aic32x4->dev, PTR_ERR(aic32x4->rstn_gpio),
+				     "Failed to get reset gpio\n");
+	} else {
+		gpiod_set_consumer_name(aic32x4->rstn_gpio, "tlv320aic32x4_rstn");
+	}
 
 	if (of_property_read_u32_array(np, "aic32x4-gpio-func",
 				aic32x4_setup->gpio_func, 5) >= 0)
@@ -1372,26 +1378,20 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 		aic32x4->power_cfg = 0;
 		aic32x4->swapdacs = false;
 		aic32x4->micpga_routing = 0;
-		aic32x4->rstn_gpio = -1;
+		aic32x4->rstn_gpio = ERR_PTR(-ENOENT);
 		aic32x4->mclk_name = "mclk";
 	}
 
-	if (gpio_is_valid(aic32x4->rstn_gpio)) {
-		ret = devm_gpio_request_one(dev, aic32x4->rstn_gpio,
-				GPIOF_OUT_INIT_LOW, "tlv320aic32x4 rstn");
-		if (ret != 0)
-			return ret;
-	}
-
 	ret = aic32x4_setup_regulators(dev, aic32x4);
 	if (ret) {
 		dev_err(dev, "Failed to setup regulators\n");
 		return ret;
 	}
 
-	if (gpio_is_valid(aic32x4->rstn_gpio)) {
+	if (!IS_ERR(aic32x4->rstn_gpio)) {
 		ndelay(10);
-		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
+		/* deassert reset */
+		gpiod_set_value_cansleep(aic32x4->rstn_gpio, 0);
 		mdelay(1);
 	}
 

-- 
2.37.1



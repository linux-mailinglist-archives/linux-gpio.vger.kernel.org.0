Return-Path: <linux-gpio+bounces-19911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6EAB2D61
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 04:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67B113B2665
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 02:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF3E202F7C;
	Mon, 12 May 2025 02:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="chNNTHAa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A18834;
	Mon, 12 May 2025 02:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747016150; cv=fail; b=FKneP9/8m7Df71JSZyuQaaMuaVLUmgYxLj4KVuIr3GUUASoVmt6F0fNqhufz3aZt1yfO/2sbobGbMOlrBD36yBmXERaPJKsllSOY/FznFJp6cWb9TbwQvZf2FSeFNU8AMa+hTfBgQABCOB8m194wYIe1vJKbnY4yLQHnMz+edoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747016150; c=relaxed/simple;
	bh=vund7pqJIQHNF6l6F4D3JPzf5I+3XhkkUAAQfB14+Ac=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=VITNeFW30C27PpFdZk0qRCU+9+T/uu7KLbDdQM7lPmzh6jMmRcCl4O6R9YL88Kitfpjr9jsTBhDWlRNIdaDf0/4218XbvO3UVJKbGnsFTM0YNW1+66YUx0kr6KK+GpLuBZdWfVgnDfPd6imOAjUclzUxaKDgu6utQ0OnmgwBYtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=chNNTHAa; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4SA/Hi2dJ7RlQ3zBT19wMRlsqhMWniY3kA9XACS3qcsGMqfVKUqEnWEKtQ3Uu2IzNyc0fzGR3ypGJXu2G9xDawa4M/whiqQIdeS3qxj0GQS3WWRLitoPtApnVYn/z0FAFOwsNb/JBXNOdSHYA95pL3/9kf971QCiyVU14Mmwxx247Ur4jPt4U/ALCqyJA8bENM8lyCn2Us1kTFCM5yt8QrUjyAjmv22FZGfy9dPa2lASJ2H0L91Mcbt3QrQA7ZRazaTkb57BpOF0AA8dNNnU4c5BD8ehHtvAmdF+ev7ltN5VdOHdPwp1mQXseduAv37oF5L6FspOkaJXIb663ejEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qece37I9j8439XqV2rwVsuDx9WDlAxMv9H6LIgAHkLk=;
 b=uN0cCfYW63hkTL6Zza1gJ3dC02frON7jLVMnuUycInS2P9PFEtHMTeH9MiEmnLR7RoXo/AHM+5FgvkrccjF86ryWyAybztZ+/PiiN7KPkSFcHkwoZ2++i43bQ1CY5b9oMHyyU4AtgFdRtBHL3W1Ox8Hfx+Un4VTJ2C1fvM3Y474v2qt8Mjly7oCWh2ihL1idKxC/NQS8Tz+MpCRB8xjryOElSyEA5hIZqoPumcEQshW7cVip0IrtAigVp4CiW7iP0r/S69EwGF7GLBzK3tHRtscPSPmeuS4ZuHG1yJaa5/LKFl52kyT/rh4WqQqfH1kCXaDNERtbG9EvZa/XmR5OEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qece37I9j8439XqV2rwVsuDx9WDlAxMv9H6LIgAHkLk=;
 b=chNNTHAajMP4nhm96sS0yWzqq6Ot2SVN04P/QqGZboN+Mq8NjxQDd1DVwgEQ6bIzfNDggV048t9o+Z8iQnmUxmY3VIPfXLUAwqTGmSKkrL9xtHMe6kYnkATTaj5IwRuo//awq++Fllena/uf7Vywl+xtvzkL9d/TSC0t6GFbDjc7HVqPYXpwWYfRrb6Y9EI+Fcp7FEypuzKdflmFKRLVRR22O7sVgEYaSTxgGB/Pj+6TvoHfmN03RPj8uFItdbPgV8xT7Yl2lKwUxYbb6iv9uvJ/jqwjfB5wYZcUf2XT/4qFH61cWfbmF7VUKF+TOxCu+XgQYcwiIPW2L7RSvyq7Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9240.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 02:15:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:15:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] pinctrl: imx-scmi: Introdue nxp,iomuxc-daisy-off
Date: Mon, 12 May 2025 10:14:13 +0800
Message-Id: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVZIWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwNL3YLMPN1U0yRTM+OkpBRT0xQloMqCotS0zAqwKdGxtbUA+rTmYlU
 AAAA=
X-Change-ID: 20250509-pin-e5b563bbd55d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747016063; l=1481;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=vund7pqJIQHNF6l6F4D3JPzf5I+3XhkkUAAQfB14+Ac=;
 b=bI1hcecZfZ8773UaoAny4XVXBSRF6OQaf5cwXcTMUqMkQFuG84C7qx+hYbPzleNrwIouYv+rF
 daTvYt16A98A0T2LKxK7DDbo+annujv0j0lkGgRc4nX2O6/cc6k5gcZ
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:3:18::30) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c78bb6-8de0-49e9-e2ef-08dd90fae589
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGRCSGoydWpDd2NWNElySnpjN3g2VElNcEZjQThGVUlGZkpoVGhteXJ0L2h2?=
 =?utf-8?B?WjVmMjF3YkxCV3JpWkFRY1Jvd25BUExXbEJwajR4dHVaSHNNWURETjRwTWtN?=
 =?utf-8?B?NzRYWHRKWWl1T0NrTjhSaVdZbHYrTU9yeEZHSnJkWDRPVUVMZURYanJYVGFa?=
 =?utf-8?B?OG5oUFRITzhZTFQ4UGJ0MFBMTHdFTUhLejBYSU01cVBRU3gvZHp5STg4NTFt?=
 =?utf-8?B?aXNEVDQwajFVSWNwOXhEMFI0djI4S2lJTjdrRkh5SmJCdTJCbThxaDA5RHJ2?=
 =?utf-8?B?T3M2MGtQOGRSemh0OWNQNk16RUhiRXFIeTdJMDNKbm1RNGtPS1M2MytBZ1ZH?=
 =?utf-8?B?czZ5STh1MTA3NGRGTG5CSStiMVg3dlZKNmEzWXBUUit4Mk9OaWF0ZkR4K2RU?=
 =?utf-8?B?M2F3UnZuYnhIL3EwUktsamZORDhWQ3hmb3hZU3plYTUwZXE2TU9lNnBHcmJM?=
 =?utf-8?B?b0VqODhTQ2o3bURuY2xid1dtUkhoblYyQkoyaFRvUDU3aVZMb1IxM0dnNk5y?=
 =?utf-8?B?QW5MeW5zZHluSmZtODQ1cldHRFVwYmlreGx2bXBoYjRKWFFzc2xoaUxMSncw?=
 =?utf-8?B?UjFBVEV5bUlzbG9MZ3RJWTI3VjhDWDlGWE9kdzJSZlFlQWl3YUszS0xCQVAx?=
 =?utf-8?B?aFBEYzgxaFZsbGVhTGJRN2pDTldDcWk2a0t6ekd6bHRKbERSYUpjMFF0MWkz?=
 =?utf-8?B?K2RVcFFGbXQzeEZaVms0SEN4bnZ0SFd0UzJWNkJ6QUlSTU5LY1l4UHRHVVhX?=
 =?utf-8?B?a05KWFRuMjdIY2d0WWMyTWExQWRCZ1dzeVVaYVZOeU9yK29FZFFKQUMyYU9v?=
 =?utf-8?B?dDRORXczWCtvSUkyRXRvcFZqYkdrYU9qSldTMklSNXN5SGppamJvaWJGemY2?=
 =?utf-8?B?MlhvanZXRFZlM2ZUV2YvTnZySGxmdVU5a2k5ZzladFhlV0NCN3o5Z0h2Z1pU?=
 =?utf-8?B?eWVkaGl6V1BGK3lvV2N2Z015eStmZElXOHFXYVJ6cG1DWVJOSUhzQUFpY2Rx?=
 =?utf-8?B?aVlGVUxSZ1BjK1VDVTVyQUpCQXBTbWxoYlZrM05TZDdLVkk4dTBzeGFhVmJk?=
 =?utf-8?B?Y2NlYjNqM200UlJXaVFTTHhtdXYvV091d1ZXYnZNV2FPYTZjbFpORU5jaWF3?=
 =?utf-8?B?RUhSeGpOZkN6czhXSGEyODlnN3I0RWtOUWZwSjZrRGxaMHN4TTA1aWFhRktN?=
 =?utf-8?B?N0NjL09EVGVtdWxGTit5MndqV3JWMmdzME9IaTRuRVRlZFJ6SWZBakNJcVhw?=
 =?utf-8?B?TVdpNDV6b2dRTEFHRjdDM1NrQStYWnN6K0NkV3F3L0RqUzZkWUVsbjNnSDh2?=
 =?utf-8?B?enF5QWkwVVJsT2tMQmNqV0JDeWtLcDRtcXZrQXloanNDTnVwdUVuQkJERDJQ?=
 =?utf-8?B?bjZtekpucnI0MTBOa2I5K2VWNGZxVkVZQ3kyUnJYSkRIZ2hQd3kyZ2JnUEkr?=
 =?utf-8?B?K1NsK1VDR000V0MyZDBuc0F6U2VvWnlCdkgwRWMzdzkrdmtyejZmQnRrWEQw?=
 =?utf-8?B?NmN2QmRZRDE5TXY4eEZGNjJBaXhjRm1TMFk1aVAvNzVScE4rUjhFRUJLSjl5?=
 =?utf-8?B?TncwS01KVWh0N0R1VGVJRkMveXpqSHE2SldlRG05cWZnZVptVmVZUWVKZjd1?=
 =?utf-8?B?UXFuWk5jUjhaTSt5allmTTVjZmtNdE4veFBkQzhpK2toZlRTQzFEWTUzYzdM?=
 =?utf-8?B?OGtLQlFuTWtPKzRBak1wdUdoREJLUE5BS3R6elpvVmh5OGNUNjB4cmxLOExN?=
 =?utf-8?B?cWNFZk1ZY0xhRG1SZW1Zb3MzWFFGRytmRGVSU2hqOHVvV3pUaFZDRHRDTnJB?=
 =?utf-8?B?anhoNTB4WmxKZlNMMkxSVUo5QmNBSGlQcG5JTU9Rejh0MjNRYWhQT2kxWU9a?=
 =?utf-8?B?TnRPQTZ1cmZZUk44ckJHdnMwcSt6SjV4NHNscnppaFlzVEtEWEl6QXcyWUdv?=
 =?utf-8?B?eUVVcWtGS1JiU25HaE92bndtdWUzZ3M4TjZxOFpSN1dXYmc4SThIVEhuV1RV?=
 =?utf-8?Q?Y3RRNL/85fx+E+ZXMr1OTAqKxg3r0w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUtjeTV1OVpLRGtzLzRlcUhjY3dPcUNSWnJGWDFmQ05ZNVlJTUdYZU5TKzJZ?=
 =?utf-8?B?a05WSVByMjdpQU5yaWlzcHN2M01pckJYcndNRVNPdWpGVTJIU3BvRDBONEFq?=
 =?utf-8?B?bTZXMGRxWmRtL0M5N3FWS1FaWENvQ0s5Rm9NbVk3NDR6bUJvbnhQVFZYU09Q?=
 =?utf-8?B?Uk5GMUFrWHNmS2h4Z1RqVEtSNkNtL05CMk5EQlBKMWZUcWhQYTR2KzAwTEpv?=
 =?utf-8?B?ZG1LeVFiS1Vhdmh3OXRKK2xaS2gzWDJIc2FtQ3FMWUpVYW0zYmViWkMyeWV6?=
 =?utf-8?B?d1R2aUlZdmhubGxSV1NYcFVEa0l0aFZoV21wSytLUzg5WjB0bFduYVJERnlH?=
 =?utf-8?B?TklqOEZmT24zbE5vcVRKYVFwcWhSMlpJejZkMXp4QWhCWDVlcEJSVkJ1Y3RH?=
 =?utf-8?B?Vzk1VzFMVGNDbTFxYWVZV3dwNllwNXlzTm0rb3hPOUMyWUJuOEJsSEFNbmwy?=
 =?utf-8?B?VkpkVnQvV3RhNnVJTVYrbWtaZ3gxWDNtTTZBZm1scHZKL1dSQ3p1UmM2S2FL?=
 =?utf-8?B?bWVRYWRKOERRR204WUF3YXBwa3NSL255bTRFOWJSdG5TU01Sd0ZhREpGb1ZI?=
 =?utf-8?B?NVdtZk9XTEt2bnRUcUVza285NTloRHBtS3F1MDNWbGtaNjRMWk42aTZLeWZW?=
 =?utf-8?B?UlM3M0ZQWnBSbDhDVDVzdDVmcml5d2VmMldNOUpvbUZoVG1IWmVpL2hzVk03?=
 =?utf-8?B?K0ZiU3RsTjJPTTlqMEltdmxScWR0ODhvZ0lGbU5sRHp6d2t1QTdmRHM3eEcw?=
 =?utf-8?B?VitZcy9pUXhEeVVuc1J5MjFYL1RQVUFxc3hoanMxZVlEQU1VT0NvVG5vN3lD?=
 =?utf-8?B?c1VZNWd6NStMYXdIOUV6cW5NbE1Hc3picVlONnN3aGNHWVdBTGVienZnSktq?=
 =?utf-8?B?azYvUmh2VVphdlZxOG9tR0d4NDBja1BxWThsYnhvUmxuZ1lzTi8zWWpTczJS?=
 =?utf-8?B?MDN2L0s5SEQzbmwyRS9pTjZvQ1AraFFyQkZldzJoUEs1TFRmOW1ycC9DdDB5?=
 =?utf-8?B?eC94aXd3dC9tSnFkQ05LTWJVVmxXS1k1Y0JSYnluUDFiZjY0TTU5LzV5WTVR?=
 =?utf-8?B?bzRoR1FoOGg3Ykp3WnVzSy82MXRON2xvRHJBeTFzN2IyZ29Fa0pLbXhpQlJa?=
 =?utf-8?B?MWV5NmlSREdzbEJWUUFJaUpMek5UVXJjMjNlaytBaDNLbzgxMmxjWHAwc0o2?=
 =?utf-8?B?TjVXc0RyYzMwK2Y5Y2tyaS9JUEdDTm1lc3kwRUg5VzJLL0VsamZGd1dtRjVP?=
 =?utf-8?B?YVZXTEpwY2g3TVVrd28rM2Q2WU5VU2JOVUJrN3Y3aS9hRWpoTW0xUENVRUV3?=
 =?utf-8?B?MStVY1dwa2ZSRWNnRFF6S2puQUNWRm9XU040ejAzazgwTTBVa1h5VzZ0Z0sv?=
 =?utf-8?B?cDVCNDh4d0Rnd0RrWTBST2RFK2E4aXhHVU9RSnk4OUpTbWF5VURZQ3ltNi9V?=
 =?utf-8?B?aTcyNW14dHJrcW1HVWJhbjNidlJzU0FEMk93b3JoV3lia3RxaUIvUDUrL29U?=
 =?utf-8?B?aURINkFBWDZNY0UwWHZhTEIzNGt0dnhkc3RLcEhxWmpBQlFkbTNJL1F4U0pI?=
 =?utf-8?B?L3JYWmZieVhVTGg2ZGZCMURTSEF6L3hpWHlOaXNDb1lieHR0a0xNbjhzNHVp?=
 =?utf-8?B?OWZpWXoyOEt5WW1vdlhtN1JIRUdGSWp5eURFYk4rWVQvQzQ4OXhzbC90eXQ5?=
 =?utf-8?B?SFZqZWUwb1VYR2p4dUdBYVNGcFZSdjUwY2xUdlFmajJiTHA0TUVJUVBTSmxn?=
 =?utf-8?B?ZCtXeW5veXBpa2taQ2dCamRXS3RGL1FpUXpuMkNGSFhOZFNZYlBBN0Y5MTFk?=
 =?utf-8?B?K0xqQWhBWE02Nk82SUd6VXBCVEpnaU5xS05WTWxzOVFrYU8wd3JoUDRaSHo5?=
 =?utf-8?B?bUtqMkp3ZDYxcGdZUU9RSG9BMzFycm9xdWNyYnFiOW4wNVJWZzhOQXJuTVlq?=
 =?utf-8?B?YldFTTdWeUgxRkZkZmwwbUU0dnErbHVKSlo4TEh5MEUrUDBzeXlEeVJkU0x3?=
 =?utf-8?B?UGUrL3p6WlRkY25hQTBEVzkzWXJ1cTJ3dnVBRE9zTG0rOFhiK3M1emZuSUhq?=
 =?utf-8?B?bzZDVjYybXZ3cWlMYlRkVVFPaTNrcVBUMFdsRDVXRDl2SmFzWkkxZGsxWVFn?=
 =?utf-8?Q?/dzI0GBeHIbFUvDKstILrhOeU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c78bb6-8de0-49e9-e2ef-08dd90fae589
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:15:42.5568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzjF3OH+ajCFIs38h47LfwGM+EnBVr04pej9iXPAcsjwV2z6bxwDiPuqafnRjwYJx3fRoYVljqY0IzlSO+tb9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9240

It might be a bit late, since it is 6.15-RC6 now. No rush, the target is 6.17.

i.MX9 SoC family IOMUXC features Daisy chain(multi pads driving same module
input pin), each SoC has its own daisy register offset. When add a new SoC
support, need to hardcode the register offset in pinctrl-imx-scmi.c just as
"
if (of_machine_is_compatible("fsl,imx95"))
   daisy_off = IMX95_DAISY_OFF;
else if
   ...
else
   ...
"

This is no good to long term maintainence.

With nxp,iomuxc-daisy-off introduced, things will be simplified to set
daisy register offset:
"device_property_read_u32(dev, "nxp,iomuxc-daisy-off", &pmx->daisy_off);"

The new property is set as required, so there might be dtbs_check error
without patch 3 applied. This is expected.

Patchset based on next-20250508

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      dt-bindings: firmware: nxp,imx95-scmi-pinctrl: Introduce nxp,iomuxc-daisy-off
      pinctrl: imx-scmi: Get daisy register offset from DT
      arm64: dts: imx95: Add property nxp,iomuxc-daisy-off

 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  |  8 +++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  1 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       | 26 +++++++++++++---------
 3 files changed, 24 insertions(+), 11 deletions(-)
---
base-commit: f48887a98b78880b7711aca311fbbbcaad6c4e3b
change-id: 20250509-pin-e5b563bbd55d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>



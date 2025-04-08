Return-Path: <linux-gpio+bounces-18404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B5A7F265
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105241899A1C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381C925F7A0;
	Tue,  8 Apr 2025 01:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vwRNNpQ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B78925EFB7;
	Tue,  8 Apr 2025 01:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076512; cv=fail; b=joofBm+j28B/vV3wO9MVRXnJbAc3GjeZfuUIg5yS+2tGeekL9xng9m0Bucay3cbdyNMyy8ddiYjxw9L3FIDxPaGRhIChSweAeNBfknPEQoLRWDrSfQ2ajKf/X2t9rf7RgC6med2E8l5kSbkJ4svgeGoatkLpVV3rdPN7QZvoy3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076512; c=relaxed/simple;
	bh=v+RPL3nHlGd7lMY5K/0g5UD3Yu9roR9UGEMa0enTg9A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=piLl4pVlngfw8Ypnn0huQZm8BDZekcG/ngZ2vmQX92s2ZetVQM2/Qsd0CmpGZwfbVNcymTHuDnK+sQyMszOKcMsvzQ6S3Etj47Pf/dUSOlRXsCIhvc0zK2nS+FVUm1Fta1m2Nf0AyiFxGOOr12dFM+VRbhLdK7gMfF9jRbuj7LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vwRNNpQ/; arc=fail smtp.client-ip=40.107.20.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJnwIR0sSJ0QOqAOemd4DJRVp0FHgOkDiT5GQXstGyQpyDbOBcAK8lczDkRoe5QfHK7mVd3O8Ty6Pxyp4YA9vZPaqZVGgamVDnTHkTNILjKlyZUcU96c9fkoyowsOWicu4DJMNy6GbsBnmAFMOkf9uipZKKItLplo4cmrBPWG6L7YiLHYUHqH/x7PLVOSwJYeUFe0mRCUPMrfGh9QhK+hsbOu2DK4w/0vjuJobOJOxTIYc0Bmo1MFmje7TVC+SkVlUzvNYcdDPgoRk2/U9Xdp6eYz07LeKv4sqaCfzYvTGNemc19UAHMZK2cHEaXaKxEWhZBZNExT+K2wZ47drXmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3IIMIDbGoyGYwqxJqtSYGydirTJTdMneacc8sH8PYE=;
 b=QtwG3jjoeEjkmFn1yP6vgA3LQC9rzJlDgnPyP3zHyg+7GWNi4LPYuSxou4vWTYDGohBMROgDIN0j8hVxZvWAeegoJY6JFybZaxY8mZTE+ZWBzUW/78LGJC+LCjFcjwJlyE8rmP1L5FFmmeMBqemIleFMMaYihKe5pK1YbSqt7XRkyzRi2mjFE0NMqBFDQZ1JAQ5NvZDHKLci1kpChnu312udlNRxCT2z4BsKipzq9217W0gIKM7ISqBCfRwg1EibeKnn+emrEPrVtmQ6+gVg5VH30iB2XZN9jEBW4TinlsBdYNSsVHBMY0UJt9mJ5hvxE2nOJHDAsCCQqBTyddORfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3IIMIDbGoyGYwqxJqtSYGydirTJTdMneacc8sH8PYE=;
 b=vwRNNpQ/Vm7KwVGoc1C0/iGOtIFw079m8xY36CMl0dIi/5LgqBC/M1q2dPOa6eIgMKwEmkaHYTEjHBAdkkc6XNh5ERe9jLy07AyxmNPjvRPi+F7NnnY84ub9UnC5ynh2IcZZmGx5wzfYs+Ks5zv45jZHVa9niKWFJX8vMp/3syRxQkUgXaHQ6kHAhgP8w/+pyBVyAPNzp95K4UHDxhoglHbieaVsSBwiQg+BRb+w8kYnlQ+WJB7kvAvWWPRJmaopMUTlJpjvnNfjCmSjSD/DJOp0Z7FnEz5oBIU45rDy+14GLnwCH+/wGBr0PIPzIYOEbLsCuwrII75zZxOAluYoKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10199.eurprd04.prod.outlook.com (2603:10a6:150:1a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 01:41:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:41:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 09:40:02 +0800
Subject: [PATCH 6/7] ASoC: codec: cs42l52: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-asoc-gpio-v1-6-c0db9d3fd6e9@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744076413; l=7472;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=qBgtNoCcAcvKxfr6iKprfrvHqR3mpPSjGlxZd+CHJAo=;
 b=r15niQXT/IuH0LfAZVap+mj4hUDUGvMPdQCZEGAAsNdabpSED9/z6nP3bheXwtxsAZZyQfmer
 ctgV4dvXE5RAi7WIRE1f8a7eCHwznMX2CiAR6BM0fcc1O0TdwVQARwZ
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9ce93a-4afa-44b4-09b5-08dd763e873b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDFNVkQwbi93SExZdkMwSzdab1hOdWgrR0pOQ2tiSmE0ODFaYi9hQSthSmxY?=
 =?utf-8?B?eEFRZ2V3WTNSN1g4dmMramlwc3R3UU93cFozV3Eza1I0THlmQTZLdmljQTI2?=
 =?utf-8?B?RjlNbEMyNHhxZjhWQnRLR3dhalBqTk5WeGJ3ZW1NNVBleDkxKzhaQW5HcFZF?=
 =?utf-8?B?dGxiOGFLU3dRR1B5ckMrOGM3NjdaVFBnZkIwcTA0NDlvN1hMVHFuU05MSTI2?=
 =?utf-8?B?WXFTaFBWY3Z2MUl1eHVRNzdQbCt5V1drcnRWd3d6Y2JXZUpTYjdVT1hlUEY2?=
 =?utf-8?B?cjFQTExvKzQrSW9USjVCK3hPdkxrM0hDaEpJSldMOU1RUldOQmgwcE9SM1hD?=
 =?utf-8?B?Z2RBOUhiTVlLL01Dd3A1YmxreEVhNm1CQjkxVU5TMzh6WEoxRmpPTXI3M1Nx?=
 =?utf-8?B?SjhtSzFXSmdvSmk3cUNVRUpkTyttbXlOVTU1NjhxcHdBckVKOXFqZTJnMlpP?=
 =?utf-8?B?cDUyTU1XYnVtKzRwRTFYNTgvRS9laHlpMUYwc1d3STVmL1pheVUvNEU4MWVL?=
 =?utf-8?B?T3NmWTlVYzA2QXcvZmlUZkdRV0hWRmJYRUU2VGcza3VMVkt2cXdoSnNPVE4r?=
 =?utf-8?B?M3dnRHNYWGFERlBxU3NWWjRlM2pWRERGQUNEM1lUR3JZSTNBV0M4emxUa2Vy?=
 =?utf-8?B?cnB1ZHFCOUZsODNnQ25qZHM2U3hpN1RabUVtbGlSbWxpUzZETitvRkNJZGlu?=
 =?utf-8?B?VmZDaG42c0E4MEpPa0tSUGU3VVFpRDJUeEJsa3NsYlhVbHlTUnRxa1RuaTVv?=
 =?utf-8?B?NkptQjdockgydVNQYkZYMGJQMVdkNENxSGs0NThBY2VxQXYxVE5kYkJ6UFYx?=
 =?utf-8?B?bSttNUdkd3VnUUx0VTg3ZmpmUWlOS2l2bHZVMzVkUHdBVTBidzFpeXZPczBr?=
 =?utf-8?B?VTE2ZFppRld1U2NqNEd2YnFhY0NJeUh0UmhvM1E3K1dkN0tHQnJUYUpncWRp?=
 =?utf-8?B?QjZ1SU1kaXhzRUR2Vk91VDdsU2RXa1N1dmkrYjgzMEthNUNiQkw3a0huQ1NY?=
 =?utf-8?B?UnJSdWFIVTFEakVsc3dGU0hRbUU1Wk5hN1p2V1ZFejdLU296SXV3SE8yNGJS?=
 =?utf-8?B?aW9rMEVTckRLeWpKRCtIenlIcUpxQ0doam5ZUUZjZEJJTGN6VjJaVmU3NXNS?=
 =?utf-8?B?ak9LQlFYRUxjbjVKbVlNYlROY2R2UjM1b2g5anFtUnE4V09YRTYwTnVYdzRQ?=
 =?utf-8?B?U2FZbEUyYzdxRDdtQnowMGl6MWNvUFdzZU9PdkFPQU1ndUppZG5QS1VPRk9y?=
 =?utf-8?B?YkF2dDdld1hSRVFqRWw3aHdsbktDeUFCMHBUKy9sSG9jYnVDOWpNOVRTL2lo?=
 =?utf-8?B?TkF6SXd6Q0MxWHdNR1M0UXZPQTlBa2w2aDl6WHpyRWk0VWgxUThFVnpjWThI?=
 =?utf-8?B?ako3cFVscXV0TmhETi9EMjdzYkNSY24zSkdqRTArMFBRdlEyYTlKR3d5d3JU?=
 =?utf-8?B?TkRjaEhqVXUyYXlhZWlvT2VBaTRCbi9EZkpnZldCOCtkRnMvTmNWTnhCb05x?=
 =?utf-8?B?QWZveDRIS01hWW5kVlpCQUR6QldyTnk4b2ZrWENVNFhvSWd1Q2V4aVBZK21o?=
 =?utf-8?B?Rkc5TFp6YVdVNXg3dDVYUjFhZFcybzdjL3ZlaElHRGdrL1d5MFozdStXWTl5?=
 =?utf-8?B?aktVLzJzQ2xhR3ZjL0pJWGwvTmI5ZnNRQnQzSVZGeHFqYXRvOTMvcHlmSEFk?=
 =?utf-8?B?U2s5dE0ra1IxVmhOU2htcjd6cEpaVklTeFkxa1ZVc1BPa1lFN01KUjNwbDRz?=
 =?utf-8?B?WW1JYnpwOUgySE1ZVGtpUFNxcDJUSll6b0NmQklYem1lVlh2VnpadDdCRmN1?=
 =?utf-8?B?aDAyUCtua0hPYUp2UjhqT0VHYXRQSERTWFU5WTViNk02clZKeFBxVnUrczMx?=
 =?utf-8?B?bUJ2SlVRZXVwa2tCTTdVM1FaTTh6dmV2SzdFR2NDclQ4ODBLQ3lzMnBMdjh5?=
 =?utf-8?B?RlZmemU5RGhuTTVuZG5tRDFDYm5qSXZlOU0yR3VrdXJDeldZekRDZnZ4d2VP?=
 =?utf-8?B?N1grV0Y5SW5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3FwVDVSTnAxaElydzFIS0VJUXU3ekdGS1RTRjRTVmNZZUIrMVhRLzNwbDZW?=
 =?utf-8?B?SnJKK2tmMnQyeVBNZVU2KzU5cnR3dlkrbjRkZGxTZ1dKd3hKZ3paQi9GSGlZ?=
 =?utf-8?B?eHIyUjVoZ1VzTnJzZzVFTVdkMDlsWE1YeUlmYjYxd0ZtQmRMNzJJTHNvV1Jm?=
 =?utf-8?B?VkVGVHY0TFBUeStyYkFXVjNOZjBNKzlqTCtjd1FNNTRsb3hYeVo0S2N5dXk4?=
 =?utf-8?B?RENZUlc5MUdyWDZLZjFRZldhUWtFNGJHRDNRMnRNVkxpRXF2andwRGwrcU1F?=
 =?utf-8?B?U0M4UGRYci9rRTB5RzFvWUV5aTFOS2VHVmF5T0JsbExoc1YySDJFYjNxSnRN?=
 =?utf-8?B?eklacllTdlpSUmJVZkFDRFAzdjhicGh2WlRYMTZqUmFWMVFHdXRpOWFvN2dy?=
 =?utf-8?B?VU9zcXhsZDVubitFNmpleE42RjRjZkdHS1JqSzdkazVBczNOcVRsY21DL3Vx?=
 =?utf-8?B?M21jd3VCZW0wWGJKWFJGTFdLbUhBbjRoY040SEszVGdyd2VTaHhUVjV2eDY5?=
 =?utf-8?B?K05JNlFMVGlMekMwaWpaYmNCZjd4YzRyTTA0RTFwa21uTDZSMVlPQUFqYWRM?=
 =?utf-8?B?VVZkQ0I2MWpkZ1VvU2VpVFp6ZXI4bFEzTSt5Z0ZEZEY3K1BBNVJGd3p2UVZh?=
 =?utf-8?B?cUlJOG50UmZ6OGNKUjVLcW4yYmh4d0QxUkhPb3JVUVFPbkRQOElPWnNmNnBB?=
 =?utf-8?B?RDJHem1Gd1ZoQ3Qvd1RBaS92QlovS1J3RHRpTzQyZWVBRWgxTjlsVDFpUms1?=
 =?utf-8?B?WDNiamF2T1ptUVNCd1E4TXpObFg4dEpaUElWaVV5RjlONkd6MlVkRGlWejg3?=
 =?utf-8?B?NStZOTI5RTRvZnJqbVRJNTZmS0JXTGQxU20xbnJiM1FpZ2VwZHBZK0w3b1JX?=
 =?utf-8?B?Y2UyYVFxVDJoaFNqaEtRbHRXczlVcFJsUklzVndUVC9zd0VscE1YM1ZmdEcz?=
 =?utf-8?B?bGl4cDZEdWt4eXFSMFRoVUM4U3JNWGJncW1MTG9ZYXIrWnFPMFg1MTB3ajFp?=
 =?utf-8?B?YVEyaW5aMDI5UE5RRUovckRnOEFHRldxa0hEV1BLVmFZekVGdEo4SjNVd3hG?=
 =?utf-8?B?c2cyOWt2eFd6a3BzVVlSSHl4SWtYdi9UdzZiUGdWUGJSZGk2UFVGdHNEZnlJ?=
 =?utf-8?B?TVJqRUxwSnUyd3hPNHRvL3UrSEhPaUlKTjgyODljM1FpbG5lcDBpbzdlRVZk?=
 =?utf-8?B?dFh2UFJYMXZYcnAxOUFVVUhlZThCY3VFT2w3L0l5cmdHM2tNbmZCblh5ZEph?=
 =?utf-8?B?NmpvTG5kSTJLM3czWUpzVWVaMUErVWhCN0VFUVFvTmNESU13WGxYR1ZWK3FC?=
 =?utf-8?B?MzNZN3VDYXJQL0ZVREZ1NlB6OHllblRqSWZjQm9VQVRNV0dlUzVxcjVVYXBq?=
 =?utf-8?B?Zm1Fb2RRcnIvOStBdXIzSFVzeVg5bEtDT2NnWGtQd1ByWDcvalRLaFJlVmF1?=
 =?utf-8?B?V3pndGcrZGMyVE5IUTBobExjVmV0bWNrWmNETjVXWDZZdi93cURNUGQxdDFB?=
 =?utf-8?B?djZTck9iQnBDa2tUVzVVSXdwSnFEYzRiQUsvM3VWN0RaK1l4bzVKbTJlbVNn?=
 =?utf-8?B?cHJwdStjZmxPUkxPQUsvZ3A0ay9FeXYvSC85NWlQY1Y3M0VlWjFoNk5KREJl?=
 =?utf-8?B?OVpTU0FKTFNVZkZPWE1uY09GWjFxZGhnMVNCbVJqZlhaamkxUWxidzB2c0Fu?=
 =?utf-8?B?UjlBbTFucHR2aFBlV2w1ZFI0cDN4WFFrOGVub3NLYXg2M3RDS0RucW9SVzhk?=
 =?utf-8?B?cUw3eXphalNqalVKckFwL2UvZ0VpNEsxV1EvQlNldThBc2NmYlcyWkdvdnZo?=
 =?utf-8?B?dHI4ZVhtZ01KWGoxczNZaWE5QWdhNi9JVnVxczBQblNIdW9ZVnQrQlBESEc3?=
 =?utf-8?B?V0NaaFplQ1podTJ5bmp5N1lqUU9GTjlROXRhRXB5MVN3Zk1ScDJHR3BLTTBt?=
 =?utf-8?B?akJsQ0FkL3M3VkJIeTFZaVloR25vUFNKSVNGbldGd1RDL3BoUmkxbFpHcm1h?=
 =?utf-8?B?RUlQZTMrRVAvNDRKR3BDbTU4N3NWa2lmSlZ2ZGJFMEppNjhDV1dKcDZjRFdQ?=
 =?utf-8?B?UnhTUmpZTnoxVXRVQkNhblZ5TEtYTGlDUXlxWHRCWDF3K2hJRUlUSHJVcXZU?=
 =?utf-8?Q?jk0qAcuiDL+S2O48TXR9rj0E/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9ce93a-4afa-44b4-09b5-08dd763e873b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:41:48.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQtYEECx/LHV1EjAxL14zy1nOAinZ0RorurqKPj8fHRLCsVlzHy0hSVw7pfv4dhQajwFd8QVNe54f0MzHRmQOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10199

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

While at here
 - reorder the included headers.
 - Move cs42l52_platform_data from sound/cs42l52.h to driver code
 - Drop sound/cs42l52.h because no user is creating the device using
   platform data

Checking the current driver using legacy GPIO API, the
reset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, the device remains in Power-down state until
RESET pin is brought high.

Since the driver has been here for quite long time and no complain on
the reset flow, still follow original flow when using GPIOD
descriptors.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong.
And the binding use reset-gpio as example, not same as driver using
"cirrus,reset-gpio", and there is no in-tree DTS has the device,
so all should be fine with this patch.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l52.h    |  29 ------------
 sound/soc/codecs/cs42l52.c | 108 +++++++++++++++++++++++----------------------
 2 files changed, 56 insertions(+), 81 deletions(-)

diff --git a/include/sound/cs42l52.h b/include/sound/cs42l52.h
deleted file mode 100644
index c20649666abe5dcbbf628f6c2d1692d3e7190eeb..0000000000000000000000000000000000000000
--- a/include/sound/cs42l52.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l52.h -- Platform data for CS42L52
- *
- * Copyright (c) 2012 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L52_H
-#define __CS42L52_H
-
-struct cs42l52_platform_data {
-
-	/* MICBIAS Level. Check datasheet Pg48 */
-	unsigned int micbias_lvl;
-
-	/* MICA mode selection Differential or Single-ended */
-	bool mica_diff_cfg;
-
-	/* MICB mode selection Differential or Single-ended */
-	bool micb_diff_cfg;
-
-	/* Charge Pump Freq. Check datasheet Pg73 */
-	unsigned int chgfreq;
-
-	/* Reset GPIO */
-	unsigned int reset_gpio;
-};
-
-#endif /* __CS42L52_H */
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index cd3f92c19045ad32f1f0f0f1764390640d68eb10..e56faf6e45c2bd4303350ed088fb28f2b9d9c1e2 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -8,27 +8,26 @@
  * Author: Brian Austin <brian.austin@cirrus.com>
  */
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/of_gpio.h>
-#include <linux/pm.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/platform_device.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
-#include <sound/cs42l52.h>
 #include "cs42l52.h"
 
 struct sp_config {
@@ -36,6 +35,24 @@ struct sp_config {
 	u32 srate;
 };
 
+struct cs42l52_platform_data {
+
+	/* MICBIAS Level. Check datasheet Pg48 */
+	unsigned int micbias_lvl;
+
+	/* MICA mode selection Differential or Single-ended */
+	bool mica_diff_cfg;
+
+	/* MICB mode selection Differential or Single-ended */
+	bool micb_diff_cfg;
+
+	/* Charge Pump Freq. Check datasheet Pg73 */
+	unsigned int chgfreq;
+
+	/* Reset GPIO */
+	struct gpio_desc *reset_gpio;
+};
+
 struct  cs42l52_private {
 	struct regmap *regmap;
 	struct snd_soc_component *component;
@@ -1090,7 +1107,7 @@ static const struct regmap_config cs42l52_regmap = {
 static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l52_private *cs42l52;
-	struct cs42l52_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
+	struct cs42l52_platform_data *pdata;
 	int ret;
 	unsigned int devid;
 	unsigned int reg;
@@ -1107,50 +1124,44 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
 		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", ret);
 		return ret;
 	}
-	if (pdata) {
-		cs42l52->pdata = *pdata;
-	} else {
-		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
+
+	pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
 				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
+	if (!pdata)
+		return -ENOMEM;
 
-		if (i2c_client->dev.of_node) {
-			if (of_property_read_bool(i2c_client->dev.of_node,
-				"cirrus,mica-differential-cfg"))
-				pdata->mica_diff_cfg = true;
+	if (i2c_client->dev.of_node) {
+		if (of_property_read_bool(i2c_client->dev.of_node,
+			"cirrus,mica-differential-cfg"))
+			pdata->mica_diff_cfg = true;
 
-			if (of_property_read_bool(i2c_client->dev.of_node,
-				"cirrus,micb-differential-cfg"))
-				pdata->micb_diff_cfg = true;
+		if (of_property_read_bool(i2c_client->dev.of_node,
+			"cirrus,micb-differential-cfg"))
+			pdata->micb_diff_cfg = true;
 
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"cirrus,micbias-lvl", &val32) >= 0)
-				pdata->micbias_lvl = val32;
+		if (of_property_read_u32(i2c_client->dev.of_node,
+			"cirrus,micbias-lvl", &val32) >= 0)
+			pdata->micbias_lvl = val32;
 
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"cirrus,chgfreq-divisor", &val32) >= 0)
-				pdata->chgfreq = val32;
+		if (of_property_read_u32(i2c_client->dev.of_node,
+			"cirrus,chgfreq-divisor", &val32) >= 0)
+			pdata->chgfreq = val32;
+
+		pdata->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
+							    "cirrus,reset",
+							    GPIOD_OUT_LOW);
+
+		if (IS_ERR(pdata->reset_gpio))
+			return PTR_ERR(pdata->reset_gpio);
+
+		gpiod_set_consumer_name(pdata->reset_gpio, "CS42L52 /RST");
 
-			pdata->reset_gpio =
-				of_get_named_gpio(i2c_client->dev.of_node,
-						"cirrus,reset-gpio", 0);
-		}
-		cs42l52->pdata = *pdata;
 	}
+		cs42l52->pdata = *pdata;
 
 	if (cs42l52->pdata.reset_gpio) {
-		ret = devm_gpio_request_one(&i2c_client->dev,
-					    cs42l52->pdata.reset_gpio,
-					    GPIOF_OUT_INIT_HIGH,
-					    "CS42L52 /RST");
-		if (ret < 0) {
-			dev_err(&i2c_client->dev, "Failed to request /RST %d: %d\n",
-				cs42l52->pdata.reset_gpio, ret);
-			return ret;
-		}
-		gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 0);
-		gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l52->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l52->pdata.reset_gpio, 0);
 	}
 
 	i2c_set_clientdata(i2c_client, cs42l52);
@@ -1214,18 +1225,11 @@ static const struct of_device_id cs42l52_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs42l52_of_match);
 
 
-static const struct i2c_device_id cs42l52_id[] = {
-	{ "cs42l52" },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, cs42l52_id);
-
 static struct i2c_driver cs42l52_i2c_driver = {
 	.driver = {
 		.name = "cs42l52",
 		.of_match_table = cs42l52_of_match,
 	},
-	.id_table = cs42l52_id,
 	.probe = cs42l52_i2c_probe,
 };
 

-- 
2.37.1



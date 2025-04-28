Return-Path: <linux-gpio+bounces-19420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAAAA9F06A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 14:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C05A5188708A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 12:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930B4269899;
	Mon, 28 Apr 2025 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GtAyoPTP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2060.outbound.protection.outlook.com [40.107.249.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF226980E;
	Mon, 28 Apr 2025 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842458; cv=fail; b=uM++RPnJeLdswXUczhpZdSuKg1VJXHNzPA2VIMfyEpy3oXuNtMeXbsV+L2dJh0sTCuIkp2szqrg+PfClFP6ckDR4w/UPIdSMl6W37OLEBiEC4KDjZGhNfdhUonQxZGDF619Pw97NZwGI11/gdkvAHnzERsLk+JTkty8ZU3NSE18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842458; c=relaxed/simple;
	bh=rS0tNPiVRVLUM/POpgIa2wwRZZN3tXXNmD8iPlaWmyQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Iw/HQ6A4Pv1gTSYg5iSz4juEwSXJIu1xFcjtbpmR23E4Lk7/6jQNbXTiuxsPReI49/+CE13rTLWGuWlc9J57JNHd0HzSgE2mMXlm3EdBl6kUFpQbNTmROm6A1ablZENxoqSG+xF3j224oHgfQFDV3/N3oCZH+5DLQApZr7lT+xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GtAyoPTP; arc=fail smtp.client-ip=40.107.249.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJJAevognjKpBPHt2qEwaw6nYHfy7hYcAikYv5xfJSziTpHKZLx4tmOl3YF/9hLwxs6EjLHtrpF/AXG7GZ+01KfIAbD05xRE/ZkcZiIYjyex1LqbTiCOCGptZti2q6IvivcOAg8l26FqJHALLKXgaTCXvG7EgJ0XWtnbpwFsnnlt68a8D8CsECoHiMZ7EyNlZ5wVxyY/J2SOUYHxppgOVhCd4hPVF2iB9Po5//2q5GiuheixiDdEv2oFDbvk27MWLpnl7j4/f1NHO3oAHCldnEi1L6QgKCviVvHQypAxinTEDsszPfTH2YA5F6v39YWEgdrHMTIHYdmZ6pJtoTqzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYfYVG9g5T61c1aCwh6qjoK2UgeU8vrokoXmP2UHipI=;
 b=smr9aHdzF2J7nf204K2yV2iDkYdEklpBPjUXq19sd0xVkuyFuomBOAejUbEL5xGAtqp3FoA5TAHpdFeuFABDaq4fbG2W4dnixifyntqUof6SYFGqy6PUL4rlrlYahPNSgVgivEkgWHz1XojOaqa7y51e6FO9GzCi8R6OZXkmR1bJJirnDUpXXWyCUB3WMDUsntBbbrJ6iukwtdZzg3EqE4Kh9LV60mUD3TIbOl2kJI25YV9OtdcJF99Nw3+fqisdiK8H0BCyR19CM3hFcEK70yNgnF1ulAXXsGx3x8oOWm4YSzCetnjrjnjOe+GuaC+/a33BDzqSIAWsWkaP+6v/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYfYVG9g5T61c1aCwh6qjoK2UgeU8vrokoXmP2UHipI=;
 b=GtAyoPTP9tU3LPHLbgnEWciZe3GyB8tDo6cEajcNdpta4oTbKNYvv1M4VOKOiuz15SQdKbH2B5pFeSOT6Qziv7Sr7/F2V6XOAPT7Rtj4syX7pI3SmTZX3y9pHZnwA8Arf4ctXE64JH6LZnplvtEYSCUN9O3OJZIQ/Flpe0kNbIeibwx2AMQup8dlLiNlFL/oN/x7+Emd00LXwmR2KduM+PteBhbQA5HpHbwecMiMyqGNDpiPROwYyBceiZvHZzqHJQ/z/yhvzkUTxCKWdMAq3qFq+iC8aN0Uq45lT/aRS8VESTeNKFjfWligI5YF7uDS0IfAZ9inYEcn/5pmhmzF5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 12:14:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 12:14:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 20:12:46 +0800
Subject: [PATCH v2 1/2] ASoC: codec: twl4030: Sort headers alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-twl4030-v2-1-868d0d572f12@nxp.com>
References: <20250428-twl4030-v2-0-868d0d572f12@nxp.com>
In-Reply-To: <20250428-twl4030-v2-0-868d0d572f12@nxp.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745842378; l=1530;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=M52TZ6Q50TAmOw1qhoy5vILliUUzilo/QQGDest7nqE=;
 b=TK/Jd2KpAEpq0q3f6B15SJZDObE0y0ngP2V4pHIQMH901PtJ3Gx6o2VfzD12/Pvum6ToRd61U
 FhA1zBEJyGPCfFAUwcPYtgOHmrmWXKams6q4ppTuwe+wGNNUMMWAM7V
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0121.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ffe1d9-2461-4a5c-6b53-08dd864e30c0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUpQdHVSYjVLZ28vN2dIR0lybHpMVmlEcm9meklsMEc3RVRBcXpDcjA5U2lr?=
 =?utf-8?B?SXlwSDRrYld4cjUvWXJWc1JTbm0vUUU3S0QzcFlYUTl0WDVTZ2pLaG81VHl5?=
 =?utf-8?B?YXE1RjQwM3EwaHVReW03OTM1V3R1VHZGZ2FXamVzVHIwN1c3aERySmdpeStM?=
 =?utf-8?B?YWN0Q01sME44TmJXWGoyTGwvakhRREU4YWV1VEEzSmYvcEdUaHhaMC9LdVZW?=
 =?utf-8?B?SmVtS1RMaXlaWG03c1JnekpjUWYvdFRnQjgyT3VVdC9lR3FGazFwcTlUeDhr?=
 =?utf-8?B?YzZscS8rTnFtVVJseVVLOURCSFRhcEtLVVlnclE5WExtN25Md0NWbERDTUlL?=
 =?utf-8?B?NWt2OEFlUjF1UUlLR0dreHhIK0c3Y0VXQndxd3g5VDRvVHRhKzhHcmNvdzha?=
 =?utf-8?B?NUd5RStYVWt0MlVXbFZGYnJya0JPN0cyODJvWURvL0FrSmZMYnQ3eXUwVXUx?=
 =?utf-8?B?bmZOUzQyRFdBeldKa2tOaG9TSVdmVjZtTmRTOXR5eWpmbnpSS1NKQ0c4aHF3?=
 =?utf-8?B?OWgxT3pndWhpZmNKYnFtb1BKSXEyNk1pd1ZaNHo5WjMyMitPd3R3RkFqYUNM?=
 =?utf-8?B?NGpxMnA5NjVWbVlCa0VFTStzeEIrRnEyM2NZc1liOEtaaUdaYjcvbERYSnRa?=
 =?utf-8?B?MzZKdkFWcjRTSkdqajJrYmRNSHZiU0R0bnYrdFltWXpPT1JCMHdISnpjamZD?=
 =?utf-8?B?SHFOZXEzc1crRGg2VFQ0WG5MUUNnMUdkdHI0Mkl2Nk0rTlpWYnlXT0ZwNHZN?=
 =?utf-8?B?V1BvUDhOWG9aMjNQOFJjNEZqMFhqamVXai9IUFJuUnRiUjFZa0Z0U2hNWjZN?=
 =?utf-8?B?ckVKZ0U0THRiMnBjZTIwOFVNOEZidUZ6d24rNUpqMjgyZHhrTE9ZdTJPTzhE?=
 =?utf-8?B?N0w0YjdKQnBqd0JMaGtWVTZKVnYva3VKRjdEU1Jsa2JmRFBveXBNOC9NTjBm?=
 =?utf-8?B?UFFzWkYxNTA0NVViZUJYclZTY3lmK3ZLREtvRTZ4ektyZ2t4aERjRkRLTXVU?=
 =?utf-8?B?SlBNbTZEOGlCZXdxdEZwaUZDZ2g5a09VR0w1bmRLMU9rNit1UzVZdEp1ejdw?=
 =?utf-8?B?VGNGSHBSOEkwMmpaNml2eEhINGtQTDBUUnhOZG1vMnVnUmN2RmN4WEJYWlo1?=
 =?utf-8?B?NWprdy96NjhtNGJNTVVpQ2s0YzdWbHVoYStOeDBUSzFRVDFReWdvTEc2Yk5J?=
 =?utf-8?B?SFk5N0w0K2x4Rm52VTVpSE0rYXowZUJqUHNvVVRhWFEyTGRsV3dHaGdJaFZJ?=
 =?utf-8?B?RFpDejVJdFFCbXNHaHdkNHptL0E2bXFwTzZXYkF2RUw2UEh2K29IREtxd0t4?=
 =?utf-8?B?bWl3bHkra2JLWnB4T2MvT3BxQ3dqS0hyeHp4bFl1L2dDRm1pL0ozM2pENzAy?=
 =?utf-8?B?NGVtSG1kRFVSYkVCeWF6TzZ0VVlyeXo1VEc5Q3F0WGphcFgzYlZPSkZLN2pW?=
 =?utf-8?B?bGYxMEJwdHRHMWJmT3BrYzNndyt1U3BnMElVVFFOYjFOQzVYTUNlSngzNkMy?=
 =?utf-8?B?ZnREU1V6YXpzWnFTbWh5dXc5S3R5YXAxdXNXYWpBR2gyQ0w5VzA4Z09MN1Ay?=
 =?utf-8?B?VmxRLzlEaFJZUTVoWXNpejlxMlJrM3JlRWhDTXBFSXFSZHBFK2htZVZuT0Nt?=
 =?utf-8?B?VWg4a2JTQ0J5TDRVWjBISWkrZjZSRzZtOEJSQmFaeFUzbDYxMTJGUmlGMEt0?=
 =?utf-8?B?QmtGRTJVQkk3V1hkNXNhMnBQL0RyU0d1LzlGY3FoMzUzQjg0eU9kT3h4aExU?=
 =?utf-8?B?QzluRTVPWURER2pwSFg4aXRHKytSY21FQUM0empFSDZjcFZiUFNuT0E5dHpE?=
 =?utf-8?B?aHQxcGRhckRnaHUyT2ErOCtSMUFUUWQvb2w0YVJNM2xzKzVQVVpXOEJWbllR?=
 =?utf-8?B?M1Z1aGVIbDJYaEQ4clJoWkxMUUdDWktNUXdNbTdFczNtTWZtWXZYOFpiK2xj?=
 =?utf-8?B?cXJXOUtEOHFBRHBFQ3NEZi92RHpQbUxpZ1FJYTVIdkFuNU9UNGZlZklyU2dj?=
 =?utf-8?B?MTFScXdxM1V3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkNaUXlVTmhuV0d0dThrUlVHQXE1SXljV09qbkkyaFM3TzN1UGZvUStTcXEy?=
 =?utf-8?B?bXVURXo3M1FuTndvNmdheThGNFFZa3NSVkNsdG02bmZkZHNJODIrcDd3NERV?=
 =?utf-8?B?NUxFd0sxRjFRWWhXWmRkV1NLMWZqYkJxd0F0Q1FQR2J4eHhCRW9lY1RGOWZT?=
 =?utf-8?B?Z3pmeFBBZE50aW4wYmhXMHYzU1RxcHo0OEJrOG82ZkRnKzlqc1paTHBQbW9y?=
 =?utf-8?B?ZDQrOTU0dUgrOW5HNjM0QUh3KzNCVVMzRW4yL3NDV1FEcE5CdjQ0TllrNlZq?=
 =?utf-8?B?a0VhM3pkQWJvMTVKbFBQakZQWXlUdUtJd3lUWktlQnNsaDVPYUYycEZTTE5J?=
 =?utf-8?B?d3l4Ukc5ZmtRbnpZSEtQWE42UzhiVjZmU1NkT0J1QzBKYWdkVEJjVURzQWlH?=
 =?utf-8?B?UkxXZDJSUXlVRndGUHptZ0N6SUVJbEs0ZUd1K1FIaElaZS84VkYvWXllLzZw?=
 =?utf-8?B?NmVWeTlwR2ptSWJURjV5eFlGdUc1ZU1qM2xjdEtCVlRUYVZkZkJYQkhCSm1F?=
 =?utf-8?B?NXE0emtTYmZvSkVtQnpUU2tBMXZFczdRVTE0cXlLSkk4SkEyTjExRktnd2k4?=
 =?utf-8?B?REYzMzlQYmdId3E2M0t3WWxyNVYzMkR3VDlrS0FPR1o5M0NGS1dnRzlCck4x?=
 =?utf-8?B?RzRqaU5wQjUyNWwrTjZDeTVrOHh4Smc5SGtUTjRPam1BdDdVV0RidmpkVkxa?=
 =?utf-8?B?cXpEZDN6d0s2a3BLa1lIOHhMU0h4UGc0MGdBcE1WRldIM2lSdUgzbStSZ1dj?=
 =?utf-8?B?cDFWOTNFR2N0d21zQncyUTd6THg5VDlPZG5PN1VEK1pWM3A5Uk5oOE5uQi81?=
 =?utf-8?B?UVlOQ2daUXpBUWdVK0QzRW4rU0xabFZrdFdZS3pSSFhzcmVtUWV0U2J6ZFV5?=
 =?utf-8?B?TFhYV0twMCtVR3BnbWFNRzBHOHRTTFdjWHg0ZDhOZ0ZOTWdvTG53NlJxbGVP?=
 =?utf-8?B?WXVOaVR5czBPQVVWUmozM2Z4NEJjWVBQckR1WjBNZzF2T2lnNjFINXdvWGZX?=
 =?utf-8?B?VElaQitGZlFXSWdhUGNqSy9LZGx4UDd0cjNwSkppSGhKMDY3MVI3ajRJczZv?=
 =?utf-8?B?bGRzZFNHT1kyMGFoUUUrSFV4YzAwN2NTY295THlBTFJIMU5FV1NWZVRSRnJO?=
 =?utf-8?B?dVFoVGxPb2lVZGZsYUhTVm1RdXllSHhBYmhaeWhId2tuTGQ0OVZRd0NMUlI0?=
 =?utf-8?B?c3NGNXd5MEp0RFlwaUY4emQvWG9UUFIzdEdSVW1rVXdQK3VoRG5VUTlIN255?=
 =?utf-8?B?cDUzMDUwd210M1VuMDBFYkpRSjRGQWN1Rk5Nank4NzdtbnVablF0cUk1TUV2?=
 =?utf-8?B?NEJ4dC9kUzZ5emFKUkw2QlFCcTF3cVZCUWdqQ1BzY2d0SlhTVDhlVTkzWisw?=
 =?utf-8?B?Y3ZTZ3ZrUGF0M1IzS2V1aUZxcjRBbVFNTGZ1N1hGYmtUbDRaMllacy93Z0ZC?=
 =?utf-8?B?VnZUSFF6MXJtaVMxODMybEQ4THhMd2toQnVuTzQ2VDhIVm1YK1ZkYzdPVVd6?=
 =?utf-8?B?OVJHcnIwT2xPVFBoYUJ5QXc2MEhoc01Gci9tMXBXNWE3OFlGc1djaUthQ1Va?=
 =?utf-8?B?anFSYWpHSzQ3eVdhUlYrSXRabXpUSTFzOVB5WUNDQXBtb2dUcmx4RmFELy9O?=
 =?utf-8?B?c3VUaG5VT1N5OVhTbzh4TkIrYmh3OS9Tai94MEtyKzJKN0NjOE8vYlJXMnIx?=
 =?utf-8?B?ZG05Q1pjcnl5eGJFNm83c0IvZ0h6dmQyVXk3NDBEVGFhc1J4b3o5WGVPMWRq?=
 =?utf-8?B?UWhTTmZxRlIvRmVQcm1iVGxXSHdXeDNPb3A4NnFabTIyYUZZUWdFT1daR1Zx?=
 =?utf-8?B?YVJVRVF3QWw3dFkyT1dja1hDZzV3M2Rub1V4dnFLNHRWSmRzTVlNdXZ4bHNV?=
 =?utf-8?B?eGdHQUxvSk54QWtrOE5GOXRoZnI0d011em01bzRieG9VL1BLbHZsYUYzTkNw?=
 =?utf-8?B?d1Ryc1lhV0UyRFIzQzNQY3RQZkJXY1J4MDNLeGVZVVdLU0s2SnhjVVg0OTR3?=
 =?utf-8?B?dlM3b05BT2pVVkZ0SjlMT29WN1ExS1NVS3NlR2VXYzR2MXo5UkZndkEvQXhY?=
 =?utf-8?B?MzJBZFk4aFdQM0wrR2ZhWGNKVWhJbnRTcWhQVStmb2cxS0xuYmdNdUg3Misy?=
 =?utf-8?Q?JQpkk2eE5koQ8GiJTn4VTL6X+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ffe1d9-2461-4a5c-6b53-08dd864e30c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 12:14:14.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ii6OZED/eJa0p9E6S+Q+Y3hEy1L15rp2lgZPtVd/JwVdBswlIYUsUNLPzBUDmhwluRARxG0rczcTyXJHW/QSMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236

From: Peng Fan <peng.fan@nxp.com>

Sort headers alphabetically to easily insert new ones
and drop unused ones.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/twl4030.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 609886461805f85f826a002942bd07c9105f2038..dbd2a0ce7dede26c302b7e30bb68c40ff6e3790a 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -5,28 +5,26 @@
  * Author:      Steve Sakoman, <steve@sakoman.com>
  */
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/pm.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
-#include <linux/platform_device.h>
+#include <linux/init.h>
+#include <linux/mfd/twl.h>
+#include <linux/mfd/twl4030-audio.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/mfd/twl.h>
+#include <linux/pm.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
 
-/* Register descriptions are here */
-#include <linux/mfd/twl4030-audio.h>
-
 /* TWL4030 PMBR1 Register */
 #define TWL4030_PMBR1_REG		0x0D
 /* TWL4030 PMBR1 Register GPIO6 mux bits */

-- 
2.37.1



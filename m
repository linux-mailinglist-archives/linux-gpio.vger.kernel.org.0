Return-Path: <linux-gpio+bounces-17886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B453A6D308
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 03:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 048401894C1A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 02:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694511547F2;
	Mon, 24 Mar 2025 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ts8MrnCL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C42913A41F;
	Mon, 24 Mar 2025 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742783289; cv=fail; b=d4dwqMzOKLmDXkSCLg+va1n+Qs9ISargpIf7U3LfPA3mOMvBjEWtoCSqq3XwaFrdkKurQ7JgQQ9Y2prCEt16238HKbDfmMZxj5pV8+/0tss2fqBEQD1StNGKRSpJsAa8VwfMUOCSJDAsR5L85GFhuDUrFlUqldg1ck6qTX1RhR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742783289; c=relaxed/simple;
	bh=4vNLP2c/6BCyUYt7t9hrt/lv306brQJy9Ej0gzwLyXA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CIr6VCzt/2otvCg/nAtDUHZ2Z9teS1WSeIBfDbP03xf9rL1mdz1uOLGBqCQd2oRK6e1LeYj4FesgfbvnkXPHbOdMZXoMXIuyOLTMDdPDXYLire32dPM7kFcM0/ye/Z0UMmgWuAbgqmnFHlybRObr9wHkMffvfWMoq/sfnBJD0hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ts8MrnCL; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8G03xcj23xeet0BvdEoJpVieUv4gC8z+mN81e25K4FP88RH5ZxyQKZeByajy1mq/nF+nNz7H7MTtBBpiYq41qyxp+rf/H2caXCkaioiIulayh3w7Yd3HXU8RzcGYpQSFyt+rEdeJxC2IREfD/Iqim16F02nEg/fNiFItYmC7Aiytki9CqM2pcAQ+EIVfz8UPlJ8dzQpeb9ltNMdx2W8+Ms4ZzmVQ2hcPiVmHcKykQOsBk8PMmA+jLu9r4nnoRSfmZfPLOvB1cUJNrrUxKTSfF515M93Uw+ZT8cZTN7N5lY9FLinp4rpNwFk+YpgjzDVmFKtcVb9C02j8SdLjFWSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5rPs26f71GhOEMbPESTDzq/rS9rRl+5n49VPh/g3II=;
 b=f7UtMoFcIdO9yx9+5BIYBJSW3E1qDfK1vogKZOMVRhDxlkUVYaskv9gnpkQoz+dqcdhf0zXwrFRU3TKvWbA7QHgrlMRb/ukmqqf7L9WCi9mo1fIJviJG0Kvyau3LjlrgLjpZ/+HWmeEx6GJZZfSPxbah15gN9UXhCEKbnpD3t3kKhdZRdwGFd2IHS7YmxYfmCdz9Q3/yVCLcLLEA0ExqsaayvBQBezPQTEboKawOOuhKfzdc2wxhDbT1mQPcWp05GVhUT3QCDmGAKuxdIA8XFaY5l0FKk0nCGbSQ21OqkYt/lCBHVX4tYtrMYRKBouK9bN9bAPuLTPJPxtrDYSbXRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5rPs26f71GhOEMbPESTDzq/rS9rRl+5n49VPh/g3II=;
 b=ts8MrnCLwyrJFScXtblsK/AUnQnzj00ewl5dRjIYI1MgyAXBy+bAvMWqEpNsb9shpCuEx9vJMD6TQ1fdDvCQrMq0DGQIjdRHG5urUAkhqnjirzT5uC3aH3xb7rohmxnxMXGYtHGyA/isGe4PNHciLZB+YUy3v/wOctEA+xpmYx2wRcnUY2EE4cGO6d3hRDHGaXdpqDMFev5des8Qx9ypKCPwahsJsv6ltJJ3u2TBIwBbPQ4rdAJEehcd0R5NC4Zvg4CNZL10Cn33qZxpKIBO9aJY3Hno0uVoaiOozJC9uB9+RVcoXfxh3ImyOot4kkhgjFxQMgnHZ+mSh1BtcUqygA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7019.eurprd04.prod.outlook.com (2603:10a6:10:12b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 02:28:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 02:28:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 24 Mar 2025 10:26:54 +0800
Subject: [PATCH 1/3] ASoC: codec: wcd939x: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-wcd-gpiod-v1-1-27afa472e331@nxp.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742783224; l=2462;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=SJchHRw4zZPQnugS+LAJqb6eMZ2l9bEbL+5vU36pmZA=;
 b=LzpZI5/I7MT5AcdPpMCfdi2XhaKUCRl4VIVwSOVAtllci7LletnO/DUG9E6G9SmPt3LILgjfN
 UDZ6imaNW8/DEjdoVKtwk4VRVn3TsrWIB4M7EeSPDZ9qIXXEFVfXXgg
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: fda346e4-6efa-40ed-8a31-08dd6a7b821a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGc0aEQvSHc1bHVvb1lDSVpkRC9kQURSRU1HcDhxZFZUSmZMSUM3NW5mek1k?=
 =?utf-8?B?TWt1WVI4eUNYZWgxd0lGMHJEVUUwaXVwbmNEVDdpOVFha1VtRHNIOUFKWlZv?=
 =?utf-8?B?ajU5S2YwcFFGa1Z2aFdWN1lyanZ5bHlUeXFCV2FOQWJYcGUxRXZWL0hxOVFu?=
 =?utf-8?B?NE9HZE90aDZOaXBJc1pHbHFnMWxyd2JWVnFEdTd1d0t6T1czaGo3MW84Wm1l?=
 =?utf-8?B?ZE9mYVBBcE9uMmt2NG9CRUw0MGtrbWE4ZmIxTHhKUkNIRzU1OSt5YUFtMzlw?=
 =?utf-8?B?VDZUVmhtYmQ3bXU5dGpscm5HOFBzOUFpZ21OMXMra3NWZ282QW50bE90WEsx?=
 =?utf-8?B?WFNxOTdwWmRsdDd4TUgvL1FTdVZWS2JLS2hmYVQ3QlBlRWkway9LUWt0N25j?=
 =?utf-8?B?eEhlRWNCdmw3V1lvSHAzaFVpbWFmT1QrNElxdG95YndyRURCZDRkRkh0a2NO?=
 =?utf-8?B?eXlyNjBZVjdyaUg1RzF6V2VUR0ovdTE2b1NGc01GUktwMXJEMEZxQnBod0d1?=
 =?utf-8?B?RDRsODlFS2JuRTVRRlNIOGlEd09FRUE4OVFOY3Bza0tUZUdQbWhUbTRCUXRl?=
 =?utf-8?B?cFJhRFBQWVB2KzhTa1RmYUxRdDVscGZlWDE2UzNJcWYrVzFKS0kwNm84V0VC?=
 =?utf-8?B?aGVJNnZuSCtvZ1lSVDRENDlqN1N5NUpqalM0ZlgyUzJIQ3RESVZMb2JVMjhN?=
 =?utf-8?B?UmxYL1pQZkZWVENObHNUQ3Z0QTl0MFJzQ2dFT200S3lINVM4c3dDM0N1NzZH?=
 =?utf-8?B?TUxSOUJWUmJEalA1a3pwdkc5dUg4NjdLYWRvWE56eDdUMUhaWnNHajJxSkZx?=
 =?utf-8?B?RHdmOGcrVHdmcDlPT2U4dnFISmhMTzZMZ0RHUkh4RmdiV2xGLzErcE5XY3hX?=
 =?utf-8?B?M0I3VHRrcWlrZ1BBeHFpeWUvQUVjNDZBS2tYRSs4MzU5SEdZajY0U3ZBQys3?=
 =?utf-8?B?L2NpZmdiNzl1clJGV2YzWXZodDJSNll3MFpXWnVtRzRxZVlxQ21mKy9adm1N?=
 =?utf-8?B?TGNqcTRwUkF3OWhRcUpNNEdFRFp2eCtjdXVOTWtMdnVlV2VwWkU0MnlGaENw?=
 =?utf-8?B?bEpFZnlnQUx4NEUyeFhxZGk4bmlNNXJLTllTem55ZkV5ZXlhNElzbnp2RVN6?=
 =?utf-8?B?cTVmOXJEOUdVRFN6OXVlSVIwem1KakcvWHZ4dXNySGdpMnBNdXhjYmhYT2ZW?=
 =?utf-8?B?Q3hmSE54MngxaHBxME9nSVlQbFdaN3lHbDBVbWo2Y3JuWlJub1hCLzVKMS9a?=
 =?utf-8?B?Rkd4OVdka28xQzJILzFZYUUzazl6VUU2bGY2VU9nTEpzdXhwcm1kR2tJVmk3?=
 =?utf-8?B?YU0yYzM4MmVJMlpydlhBVUNOTUlOSmdJV3BmRWtXVUhHVVJOYVBkaFdiMkRF?=
 =?utf-8?B?NWZiekprVkgvc250MDI3NERnR2hsRzdZSjN1MmgxZXV2VmdoUFpjRStqUWFF?=
 =?utf-8?B?U3B2bG5PWk1CT0FXTHVZbVdwSjlmTE1kV2pOUjd5Znc5V2hFSzYyTEV3OUJ0?=
 =?utf-8?B?YUcvaDhXc0s0UUpCVnNmc01OdmRZd2N6Z3FzUGpkbkg3Q05vcG9ObGpTdFF4?=
 =?utf-8?B?MUc4MXd4bDVrc3U4MVBmM2lzUnI2a0txOElvcUZBNGE5QlVXa1RKcFY2YytL?=
 =?utf-8?B?V01OdlI3Q201WTlaUmd6Q0s4bkVGTm1SMlZGdWRoTTFSOUZMTnBwRnlFdG91?=
 =?utf-8?B?dEx2K1BBTkErRnBvWTJoTU5qcEFTdGdyT09lNUVDbndtc2NOSFZWeGlNWUR1?=
 =?utf-8?B?VVp4YytDOTZPY1FpVWhpeStiYlpZQytYcEhFL0x1TnBCUkgrdEtHcWNRWWpD?=
 =?utf-8?B?WDg2MUFZdEdiY2U1ZkxTeHJTMU8vck9XeG1aVi8wRVJaWUZpelRCTEUzQVli?=
 =?utf-8?B?d0g5eHFXODVGRUpFMFI2K2ttOTZIcHhkaGwwUlcrU2VoeTZBWTZIeGhxa0Ez?=
 =?utf-8?Q?GQhzIAbqUD/iWNVWvg2Ubfe7dwL+KokJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0VxUXk0cW5TQUlJbFY3TEpVR1RDcCszUWM5Nk11VXdiUFlOM0x0S3B2dTJ1?=
 =?utf-8?B?eHdBdk9rckd2WGdCdGdyRVI3Q1FiL1cvaWowcWxWTG1uc2dJQk5BdzdFeFVy?=
 =?utf-8?B?ZlZuVHRMaHhWakFpN3hkckZNcHhSN0FHSFJ3cTJyVWoraFkrdkpZbTVUZ0Zu?=
 =?utf-8?B?UVF2d1RLZ2toTVpINTVzYzQ3bWttcjY0czZWa09xbEVQanE0TGErY2FEVjVB?=
 =?utf-8?B?TVhjMEc1amE4cTJXWEVESWR0enlyY2JzUTlyNHAvL2VDalBHMVprUDhsaGMz?=
 =?utf-8?B?R2lsYnRrcmZVQm1XbGs0S005VXdXNldYaUR5WmVCdDUxeXRidE8rT241ekVJ?=
 =?utf-8?B?WE1TZlppZ0ZuV2JnTUJxWU5LUlZwZGhsRm96RCt3OVZzY01XdFVHYktxK3Vk?=
 =?utf-8?B?ZVlSL0J5OGhVaWgvQ01TTGVXT1hWTGcwUktCdUxzVHVrenhtN2J1UWo5ZWVH?=
 =?utf-8?B?MkFFTWMyTmNxaU9rNDlPVStFOCtob2VaZjJyUGFveVdCNlh1VVFiVGhFN1Zt?=
 =?utf-8?B?cGtLVDlHb0o2cUlRc3FnakF4bWF0SnRHblZIbHYrTk9LOXhyQVhHbTUxL2o2?=
 =?utf-8?B?emJjRGIyeHBlWk9XOTJwQ1Y5ZndwYzJ0SEg4a1MrTVpqUzdaY1hqdUhFMThY?=
 =?utf-8?B?SmVkM2tiT0RDT3daUmp2TzdnKzJML1Ard1M0MmlaM28vUW5rc3c1bVIzUk4x?=
 =?utf-8?B?eWY5VCtCUGp3RGJHYmZCS2owTWZxOVdVbjdtL0FMVUlaUXlDVnBOWGJrcVk1?=
 =?utf-8?B?SUdPaUU1TXZ2eHlQdkZlaHlkbHJOREY0Mi85RVM0R25peVF3ME5CYlowaUtN?=
 =?utf-8?B?TTZPUnphUUN5clhtdVBZM2pmWjRtRlIrZ2I0LzRlNk1Nd3NtaTRFTDE5UW9p?=
 =?utf-8?B?eUF3K1drRWMwcXBpZGR4MlVvZTRmc0FCWXpEYmIyNHlsc3BxWnFIOFFpNGl0?=
 =?utf-8?B?a3l0MDBkNGNBNW8rNFY1MDJrbkxneTltbCtYLzFJblNucDJlZG05S1BSQ0JU?=
 =?utf-8?B?MW9SMml2MHg3WlNSU0dYeHZITHdFWHRyWUVDQjd6SWUxZDNSNlhaa21LQlcy?=
 =?utf-8?B?a0xaYzg2QitFSEg4ejFpWHMyTWZxRHo5T2tsd1Z4S3p0WWQ4M29ZVFU2NUV2?=
 =?utf-8?B?ZTNrQms0ZnRYTDlHWjMzVVdyaDJOSXlBaFB2V0JYZlRpUm5XVHZsQUdDUlpT?=
 =?utf-8?B?WC9DRkNsZFJRQXI4cWhsUjhObDZuUHFpTmcwVE94NUxqVVZRQUhaUGloMTFV?=
 =?utf-8?B?dURJTythSzBndy9YQi9TbUJHeDFZRmEvUlNFM3AwU2RDS3o0ckVLUHpEVUJI?=
 =?utf-8?B?QzZEdWY3cy9HeFpnajJ0RWlqWHVYU0xrQ25HUzVSVmJUWk9XYk1RR2ZsWHFs?=
 =?utf-8?B?cHBoOTBKbkNoNG5IVmdDdEkydmlRWnM0ZnlXZzdLNkVaL2d5cTREc2lIdi94?=
 =?utf-8?B?cVdjNS80VGlYb01sVzRJaEZiS1NiRGVXc1FiOEpkWVFZRmxZTTRVdWlMUmMy?=
 =?utf-8?B?OGJneTA3TEZBUEI2dzQvZElDZlpDb3ZHd3Z3ZXdOekRjQlpwY2laL3FheVRG?=
 =?utf-8?B?OGh3Y09LTWVIdmRZWkxvMzdBZ1dPeGhTUnAyYUpPQWpNOXhSK3JKd1M4bTgz?=
 =?utf-8?B?MVZlNGlPNFdQL2RuQTJ3RlRpZUlhVTQ0cDlGTHh5N2xtU2pCYmRRSzFQVE5O?=
 =?utf-8?B?UGZoYVdpMTU5NHBEVXFiYVBiYm5WbjdnSndxL1lzZFpCczdsRzFmdjBuc2pO?=
 =?utf-8?B?K0xQV1BGOXVHUk5OdGRHN0hpNUowMnlhZmpJVHJWdWl4NFZ1b2tXdVhsY3BF?=
 =?utf-8?B?Ly9rWlZyMWs4RzdYMkRIaTNTaHlqMkJWOGRJdGcyYXpYOVlyK1hDUUMzSnF4?=
 =?utf-8?B?ellwbm5wVUU5bkdsUmV3Q0RkYmdPbUM2dEZDcEp2SjNhci92NnFTQllKN09q?=
 =?utf-8?B?aEVuSHU0S3RBTG1Jenl1b1dnMzFPem01OFJadGZTOFJSVTlBQzhaWEFNWHp0?=
 =?utf-8?B?cktZbWpsM0hPc016dU9OdGkvdERCQmZWYldKODFYTGI4bmZzdlFMZm04SWZJ?=
 =?utf-8?B?aDBwRTBXUis2eWUvdnFlT05KSnF2YUw5bFp1ai90KzMwbWkwQU1xY3oyZ3FO?=
 =?utf-8?Q?AwFempxVLOb/mg0psFIESRQK6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda346e4-6efa-40ed-8a31-08dd6a7b821a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 02:28:05.4001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRfZikDnDqaFid/eS3G6cCko0IObfhWKLEcTC+v21/zvDevUUqcvGHoB5GpH+c939pkM6mHe/G4gLLrfsrMVrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7019

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use dev_gpiod_get to get GPIO descriptor.
 - Use gpiod_set_value to configure output value.

With legacy of_gpio API, the driver set gpio value 0 to assert reset,
and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
output low, set value 0 means output high with gpiod API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/wcd939x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 0a87a79772da6c0ed3c7dd7d098e949b9cead2a4..f8d7d03f84fcbca57826dd43e9281aff5b225525 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -15,7 +15,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/of.h>
 #include <sound/jack.h>
@@ -201,7 +200,7 @@ struct wcd939x_priv {
 	u32 hph_mode;
 	u32 tx_mode[TX_ADC_MAX];
 	int variant;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	u32 micb1_mv;
 	u32 micb2_mv;
 	u32 micb3_mv;
@@ -3239,10 +3238,11 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
 #endif /* CONFIG_TYPEC */
 	int ret;
 
-	wcd939x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
-	if (wcd939x->reset_gpio < 0)
-		return dev_err_probe(dev, wcd939x->reset_gpio,
-				     "Failed to get reset gpio\n");
+	wcd939x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(wcd939x->reset_gpio)) {
+		ret = PTR_ERR(wcd939x->reset_gpio);
+		return dev_err_probe(dev, ret, "Failed to get reset gpio\n");
+	}
 
 	wcd939x->supplies[0].supply = "vdd-rxtx";
 	wcd939x->supplies[1].supply = "vdd-io";
@@ -3290,10 +3290,10 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
 
 static int wcd939x_reset(struct wcd939x_priv *wcd939x)
 {
-	gpio_direction_output(wcd939x->reset_gpio, 0);
+	gpiod_set_value(wcd939x->reset_gpio, 1);
 	/* 20us sleep required after pulling the reset gpio to LOW */
 	usleep_range(20, 30);
-	gpio_set_value(wcd939x->reset_gpio, 1);
+	gpiod_set_value(wcd939x->reset_gpio, 0);
 	/* 20us sleep required after pulling the reset gpio to HIGH */
 	usleep_range(20, 30);
 

-- 
2.37.1



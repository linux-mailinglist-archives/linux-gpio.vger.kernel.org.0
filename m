Return-Path: <linux-gpio+bounces-19419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B2A9F06B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 14:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D7F1729BF
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 12:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7201D269806;
	Mon, 28 Apr 2025 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F3QIDkV7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2060.outbound.protection.outlook.com [40.107.249.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D004268FFF;
	Mon, 28 Apr 2025 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842456; cv=fail; b=eli4yNLKY6HObclKR8OQBR5+2dHpfKBEnirdh26gDBuTK6BsGZT6BfTSERFwflh1i3bj/ZTm9LFdSS1faGzHxibEm2bdt0fyng7przOxu9fPodPzhnJfIxDppTjdzDzPUEr4oANHs3msN1wBB0ahOzlHPAASl8QY37wuBBNcUNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842456; c=relaxed/simple;
	bh=pH3RolRCddiLiGVs3nYW8raCSLKNdrEO0oOwhELlapQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=meJcKTlSIWX4ZU6jD1sDhCD/D31kf3I/WCZsg+rb1UIdE+7KM4Rd04Fr0E/yDhE+wDsDhiJAnX5ZPjzClI7bLfTl/+VcIHPN3VGYmortFEwRXvFTZefsK4OospE14Dr8CKpEyg8ImkllwjUYmkVbnZrH0brT04NsZCBDHVI/1Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F3QIDkV7; arc=fail smtp.client-ip=40.107.249.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXw516wu5O+/tNUZCl2eaIkhAWa1G/bUbt4r3Bxckx9Y3UhGAlAuV9G54MDPPdaRE81ZBnJvpHJWDsdGi2HajKe5w2lpzIHV8c8FbdFCPMe9hjuDpGiaeIG+yKayXnqWs7HfQC3y2AQIB1PXAJhs/o4waNZk4PsRh9NewFF/v527tI460PeS6y5+SrQLZgVZRTNQV96l5Dnu50TTcoWwJ1V3mExTaljSOfKZXu+C18hOh23cm5f8MmIdnyGvZpz9Kom4f0JtY3eHR60O7pAubQCO38l0KRGkUdxQM4sQFyqig4P3A/GYp1Z0YsPgb7NYsmRmnUtkXLdaGqdthXxBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S8Hk/XTxwQ20vn2F1kDObkgvQDmSRFHoQFc8zTMYBg=;
 b=lkh4tMGLckaPvklNunn4fmJ6r/vAPJ/XhhVKpgRdvUICN8PnyDUDEjsyXsgGPyA+9lF+o0/Xm7g/u5tGRvPYb/NTSIJpj1vOAjAEWgA27syZrAzr2/WYMU22Waq497Y90WWisdal0aqxJ+No6pYAuuNH8K4SayqrHd1iFAu+l7ReGxr1cBfbn7hP0nZ6knvyBAZuplQaWG4b9+u74twpMLKjdS5+jgFk2C24zvzHgIO5IotC/WR7nsyNamKYGs7V+M2U8n7uR71zM1u7BxiZk+jXDbV71+S9zgsyIaEFs9AqihWt0z3bj7SpRyt/b9bVu2f+4K7q0DBaxhtrcfQjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S8Hk/XTxwQ20vn2F1kDObkgvQDmSRFHoQFc8zTMYBg=;
 b=F3QIDkV77EiiYp9hu4UpTwAnJ7gHMZ9Cx+1Gr4VPPbHilV484Dw5+/RUAQffsvjbSUhx/0bJfvAS38bbd0KZSXaVZ+KFr3fnQeBDcMsUWNIYL3iI9Awt4XSsJrXyH1Wxi288Il0e47AUN+Q1GFVF1SEgyYVBNQrIAFvMK8UVXARrhYgjhfly/lNiK/bR/NzRV8xxzy6/QSc4Zxo9r4uTakLrysA0xgtRiVfktTAX6dUnpkA1Eh3aPOXQgbIHOUxexpLg9KNUonX0qVp4auxhxKY0qOQkw4dVaLG8Sc0gaay2IsH60mEMrKiglkGM7gKYyxD2WoSVXCNWRWJ1teeFiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 12:14:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 12:14:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/2] ASoC: codec: twl4030: Convert to GPIO descriptors
Date: Mon, 28 Apr 2025 20:12:45 +0800
Message-Id: <20250428-twl4030-v2-0-868d0d572f12@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1wD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3ZLyHBMDYwNdY1NjCzMDiyRDc5M0JaDqgqLUtMwKsEnRsbW1AKk
 r+ZdZAAAA
X-Change-ID: 20250428-twl4030-3538608b174f
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Tony Lindgren <tony@atomide.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745842378; l=699;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=pH3RolRCddiLiGVs3nYW8raCSLKNdrEO0oOwhELlapQ=;
 b=iP/e4QAXkmrdTVd0dH7Vsp35t3MG48KdT5HRKSkuc+1D037SdBS59VgZOg8pmhsDIwcYDrI4y
 3jTDeZb/4VgDp4BBYAWILnqjvHGXFUI5BMNokmiGONsUzhf+/oOrXi/
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
X-MS-Office365-Filtering-Correlation-Id: b34e98ae-c6f8-4279-f472-08dd864e2e47
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUhLUVhxY1JVaXFENi9VaThFcVFEcFRLWldsV3IyUldOeWxnaG1BMDFBUTlK?=
 =?utf-8?B?bjQyWXlFMWVRRm0zNnZEcHBEeTJkd0pNK3B2UytKYzdsZmFiQXlTcldmMTFF?=
 =?utf-8?B?WTRIMXRUZUtrSG1JMngrLytpL1J6MDNVS3p2OUZ6cWF3QTgzMGdtQVVvdHln?=
 =?utf-8?B?WGdxZUt4bkQyODdOQVRVZnBMdGlwa3FidlpQTlZjVkRhbE1ZczFYaW4wREJw?=
 =?utf-8?B?SUJxSUpCMXRuSXpMTy94NE9YcDVuaHRTSHkzUU1hWTBJQVRNZFJVcVgrSGZi?=
 =?utf-8?B?WnYrelIvb1pFWFRqZFUzdnBzMWVOdmtDeU1iVy9DSDRVV290bUYvWkxuenBX?=
 =?utf-8?B?cjZYN0IwMGpYWHRYeldSSnhiYU5rTWZDczJFVXJNa24wQ2JXVlZSMGRocWJI?=
 =?utf-8?B?VGhXWHM1dWVFZm96L1JxbDVrYjJWY01oYW9JclRGVnprWXlyVVlITGVNdWc2?=
 =?utf-8?B?c1c4Q0YrOC8xK1lseGJIWk5PUzFQcVdQMElPNXBnMU16eGFwUTRUMTN5OVBC?=
 =?utf-8?B?ZVY3VzVDU1lmYk1pcGdFL3hRUEltSk84WGpJMXNJQ2VCZEhieEdFUWZNZVM0?=
 =?utf-8?B?S1VlZzdmMmZnMVI0T2ptSE8zVTVNSVRkSzAvL3VlYmtXTHc3Wm5JWTdINnVy?=
 =?utf-8?B?U3pFWEJLNFd4UXA3TCtyVUhpODRtdUZVMGx3ZmNjRGFRWm12NHd4ckh3SlpN?=
 =?utf-8?B?a29ybjE2TVlXV0dwU1pRV2dBd2lhQ1o3b2ttSkpXaFdlZHUyWkFZUUt5ZTRZ?=
 =?utf-8?B?UkZXek1YWDFMaHl2Ky9OZWkzV09xdWQxLzR5b0pGTythUkZXNEQwczFRNUlC?=
 =?utf-8?B?NzZKdElTcWR6cTlGbzhibVEyb0E3ckF4cGcyaHd1WlN6QWZRTldTQ1l1WEhZ?=
 =?utf-8?B?dGxxRExvZHQxR0EvaVZMbFBlcXd2Z3lSUzJ5TEVZeDRUakNYb1FNSCsvV01z?=
 =?utf-8?B?NUxzWHYzT2tNUnp2aGhwMU02d3dRY1JlamhPRjZCdGlUNXl5a1piOFNkU3Ra?=
 =?utf-8?B?dHVCMkNnUEZGcEdGYVRZTmFTZGt2a1V6NXhXVWRlVkxidFdYVVQ1SHpBeVAz?=
 =?utf-8?B?YUQ4YXJ0QTdXT3FOdVd2NFp3eWh2NjF6d1BUZnJyOE03WWNuN0U4KzNDelVS?=
 =?utf-8?B?RHY5ZnloRmZwcWJ1TGZrTVZ0WUNaRXEwMTEya0lLeENBRStkeGxpUjNQd1pi?=
 =?utf-8?B?MHJNU1oydXh1cVhnT0FqREtyNFNkdWF5MWtLdHNDNENBVnptdWVsdWtoVStD?=
 =?utf-8?B?WUl3d2lmZUxPQVVEL2k3Rm53c1RJUkpTRTdmL3lzUG9DK0g4ZlhjaTFrdUdJ?=
 =?utf-8?B?ajZ3SEcxUnArdjBzNVRHOCtodkZkOWZOREdJeUZLenFSOXptZTEycVg4ZjFP?=
 =?utf-8?B?M0p3K0paRkRXeU1uWFA5MDJrTnN3ZVZmRlJ4QkIvTzFvOHBPaWNWczR6aEVB?=
 =?utf-8?B?Uk5SSXpEYWhHOHpqRHc5WkxSWXdTN1N2S245bEYxZ3RqZDZtSTZqTW9uNit3?=
 =?utf-8?B?L3UwTUpYNmR0cldmMlIyODZ2N3RwaUJvQlI5S1hoUFgxZEVhT0VtSDNxZy8r?=
 =?utf-8?B?bUt4Nm4wcUIzc3JlY0pjUzNoMkxLb3FKbUp5WUlFQkVySGZGQW1BVGY0OWtL?=
 =?utf-8?B?YTNHa3REMWNtbm1hSWFDaDdPbENXMWZuNWpSODBNdGNhM2djUVRHZUsrRmxP?=
 =?utf-8?B?Y0MyWFlVanV2SEpiYko3a1MvT0c0dDN2TU91cWx3NHZiUytmaG45VjAzQkVU?=
 =?utf-8?B?S1N5NXdpOW9FL0tTTWxKTEVoUUpQRENta0ZNTnRReXR2eXNnRDMwdmVGZHUz?=
 =?utf-8?B?d0pPcVowZmFITURyUGpMYUJtVy9xQkoybXloR2RQdUtrZXhNaUJISm1qRkJl?=
 =?utf-8?B?cEVKZG54NDFIQzBiclhJdDFNc05KUlFqY3VNaDB3am0wYzZZdHM3Q0VYaVV2?=
 =?utf-8?B?MUlLSG45Yk5nU1VodEdQQlhDUXZ5alhwVW1UTmc3RzUvS3ZiNERiSmVXZ3FS?=
 =?utf-8?Q?mbn60kP7ErQBRBM36gchSu4NQ6qHOg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzVPNmJ2dWFPZ2NBa0dFNCswbUJUK1JlcW5ZdkJ5VGtOdTdxK3Vtc3dER1pF?=
 =?utf-8?B?Z3I0aTZkejhHL0ZIVkl5MEtIazNGVDhmR29kR0hGdmxUT3RrTGVMMVdCQit1?=
 =?utf-8?B?UzZiME1EQXNXSmtTa1ZuTzJuOEhaWmFScko2VnV0Ujlxb0E0Q2pSRzBNS05C?=
 =?utf-8?B?cUFwV3ZuNmhzQzRaVzdhL09ON2U1VHJiMm0rZ3EwUTU2RmEzNFg4ZXV6Wm5R?=
 =?utf-8?B?YWlGQU5LYmgrbVBHa0NBY0FOMng3RWNGRWZpUW8zQkswanRJaFhsUnJtU2RQ?=
 =?utf-8?B?RXpSRW5TRVhvVTNCZnNsRUlQWWpORkVSV0pVUFZqQzNyYUZLdkp5eHhIUDVI?=
 =?utf-8?B?dzllYjdueElBTm1JSUhpa1YrdzNwVThxdElTVWFOVDVDUEZYcW55SXVrV2U0?=
 =?utf-8?B?d0xNSkVLWklPSko3Qm1mVXRmSlJvUEdrRHFQeHh0YksrWTdlYkhscU1PL1FZ?=
 =?utf-8?B?b1RQdzNvRXVoUHQyRUFiQS91YUdNMmlNYTFWTTJ0bGVtMURMVitHUzljTnk4?=
 =?utf-8?B?c1VFVVBYNUlFbHdxZVRrZmNFT0pMcFhHL1VQeWh2cDRGZjFLYTRRQUExOFZr?=
 =?utf-8?B?MG1sekI5Vmh4U1NCT1lER0x2cmZ1MzlMZlpVRkwyZXFMNllnVFUveUkxQWRQ?=
 =?utf-8?B?M0RPMWJDenFxZFNKdW1DTlJORlRnNFBrck00M2E2eFZPT0NiOE9iS0dwSHRn?=
 =?utf-8?B?cUJyU0QxdDczTjF2c3NtRkxUd2hXQmlDWTM0THcxVWpZT0g5Tk14OC9sMjJP?=
 =?utf-8?B?L3pjSGxqUWJ1YmNNT3ZUR0ZWQlpEODl3WU0vdWRCTTRPTk5WbmxUejMwa21L?=
 =?utf-8?B?MzI3ajhuZGYxaE91RTBBQ2VJRll0U0xVWnREMUdaeGJCU0VsU1lZTTVHQUxw?=
 =?utf-8?B?RHdIZmZYUy93Mm5jMnJ6UXdwMk5nQW9YVDQ5QkZwYWI5b0NzT1YwRlpDM3hX?=
 =?utf-8?B?RXZKWUxsRTE3UXdsTm9aYzRBY2JpaE5IT3ljWTNGMEdlU0tCYmFkM1lSRno2?=
 =?utf-8?B?bTcrS3I5TWQralUvM3UvdGZYci9JV0F5K1lLY0JPRWpDRnNYQWtrR2wwTWdF?=
 =?utf-8?B?RDJ4QjdtMHJyVWlKOUY0d0dtYlNySmJTcEZPNmZoR3piZGZJSzNGdWtDT3lX?=
 =?utf-8?B?VVI4US84TTQxNDBNaDN2dGFwUmJOR0tnNDl5aHZtUzdudWozOWZtampBemFj?=
 =?utf-8?B?UEs2QXUvckh2RHl1TmZ2UzY4aGtBQjI4UXNDclR3YytsR0pMVUxBc2NIVkhV?=
 =?utf-8?B?N3hvQkJIMlJ5dGQ3RFRjYlo4b2ZPcmZVb2tpQTNyU0hQVXJTNk51b1FDaFhw?=
 =?utf-8?B?dldvV1puRUh2SUxMNDRXaCtYbnZYcHFyQ3Q4QjZPZEwrWk9ScnBxa1RyVExF?=
 =?utf-8?B?NDBLM3hqWVdTY2N0T2JqdE4yN1JWck10K2tnRzNGdDRSZWJaRERGTThhb0JR?=
 =?utf-8?B?ZUlrbDdIc0U1a1VGYjlWNTcveWUvVFdNRUxORnhxMThtUHE2VXp3QlNUMEd6?=
 =?utf-8?B?MUVPMHBHU2F2UCtaakxCbVU5WFJqSytVRXlaUmdxd0xSQkdGRUluRC9BQUNa?=
 =?utf-8?B?L2RMelpzRnY3alUwNmFvaXRkd0JyQkloWURlMC8wMTcwSTNmWWRZZWp5RWcx?=
 =?utf-8?B?MlVaSkdaU2ZuME1rcDJGdm9ORUQvWGRCQ21aV000MmVPV1hrbkxtWWRLbDFM?=
 =?utf-8?B?QjFNNEd3QUpUMjkwczNjZEFCMlRWbHh3WjhXL3F6TEJZTkxQS05uUHFET2V2?=
 =?utf-8?B?VjR4cHN3K0QwVXUxTlBFMlEzMU9qdW1VbVQ2cU9DRkRQQTBqSTVRVlFjQ3V4?=
 =?utf-8?B?cnRvS2FVbWpJVDZNZlFKR3hGRm1qVWtrT240bTZzZEs0RE1tR0czcytFVmx5?=
 =?utf-8?B?RHpKWDkzZXBvd0M3eWFmeFlkcjFkdEN4MUJRWE9vS2lxblc4d0xzU044a3Iw?=
 =?utf-8?B?ckE0cUkzbi9WeG91QzhwM0pXbENyUjZYWFFxZXh1bEVpU3VYSFFTQUszclY0?=
 =?utf-8?B?YkdNdHZmMjA0VTJxNFBiVkVmTFNIcmRaUExmTFRIUllJUm9aMFhQMDYzWjE4?=
 =?utf-8?B?bk1NMWtyVllxTFVab3FnbEhsOTE3WXJYTFFnaEZoczQ2REZoVDRJNFp3c1l3?=
 =?utf-8?Q?U/7o42UsMg9a7v+VCLNKcPf4l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34e98ae-c6f8-4279-f472-08dd864e2e47
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 12:14:10.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MlKrOvd7i/tnCIGgIG8dtqS2+LjOpVOBvyaLEN3gh0N6RdIXhe77r8jHRMfRnQPQi4UW4q0d6aXdY5O/Wu87g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236

This is separated from [1]. With an update that sorting the headers in a
separate patch. No other changes, so I still keep Linus' R-b for
Patch 2.

[1] https://lore.kernel.org/all/20250408-asoc-gpio-v1-3-c0db9d3fd6e9@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      ASoC: codec: twl4030: Sort headers alphabetically
      ASoC: codec: twl4030: Convert to GPIO descriptors

 sound/soc/codecs/twl4030.c | 79 ++++++++++++++++++----------------------------
 1 file changed, 30 insertions(+), 49 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250428-twl4030-3538608b174f

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>



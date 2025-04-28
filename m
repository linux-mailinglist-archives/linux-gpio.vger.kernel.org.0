Return-Path: <linux-gpio+bounces-19421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E6A9F06D
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 14:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 088BC3AFBF4
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 12:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDA426A090;
	Mon, 28 Apr 2025 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z4XbgkSO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2051.outbound.protection.outlook.com [40.107.241.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D9D269D1B;
	Mon, 28 Apr 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842464; cv=fail; b=ptwH3Dacm/YRVah9Uu4lPRjJsHBYb0sT30vGUW4ZR/1FwNSJK3wQzP4sYbBoOwg7hi5BVptv/uBbZHjPXRlJCc9SNfrUxT8bl8V/u51s4CV1IccbwQvIQVrQjmed5CoKdgoA2UvxDzXgpXO6E1hjqp2EW/sZyk+qqWzUhPLXbp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842464; c=relaxed/simple;
	bh=vWIyUU7p4ttEkVsaBk+yOfTwpj4hus5fzbGbrZaI0co=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OjzUoUc8xjbOeTLtA4pOIq+7YeGX9lY77byWUGAmVaqYjFGrSVH/zKTzYNcJ3dfwsTt82mxVnpa++BgJgpo55WcM28B37selOUquiMXDpmiM1pUqPMq16BlZumThNqiQJuRJd24Hrn2MHG7yG76llEXvhmgIDaIJA1dN1LXrQfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z4XbgkSO; arc=fail smtp.client-ip=40.107.241.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wawcHT0b+qndVn1+FZRHXDyfzvmKKAu3sEnhvLdTxKCXdOaPumixj/any/Sc11FfaG9OK1cpfHph+mpDfl7Q+PIxoNBycG6Px1GiX9J+HEdgcbkvAN/58E9u6rgP9qQz949x57GLYHhQVtrW0zeYWecwnaKgC9UVp5QabDIPpbsvIPGNSTiioV06sI7C2yoEdFeehHdedrSf1rgR++KpGrf8VUBmZ8n5F39UddkaUOYTOfa55bGNwHnCekt1nxSatg+NYQXOpW9wBJJoJpIaoPSku2HffmbW+wodhhxDwfmQJKGg0dLuUiZd7Xxp4AXg0UoWAIj9rtnHqV8QDF9tUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbVYJckMehHqW7pMrSFoU9XLJnov49IfXL+OR0P0xXc=;
 b=XyDagOay5ZoaZ3xPGumnNiWbbIuYsYrm4Cs6n9JD6tNZTKyGaT0AL0A5scg3lDjDvvJWNCOydgoDxxMjWCtuZCADzmK/wz44MBfQEsQDUiqjT0E76wd/I8tP52TkyaUjHGEbU2AMyUs3EYgal/toKxxIANk3SGqoNfNKxlZQvKcRYSGIyZmuzDDPG+pKyz99SDzZ/qOW0tJ4W7PjRNVtqozIjLicazIfPPv/v/hQz69fzEUkaCCYvYJqJJMbk/mMWNbEwMKYm/qqyQu+jLVeSr0LtkMmOgX/z/ZGQL0RA7Dc+i47NrHSZlqnYpDhZ/wishW8WSxKbyaFNxer+HS5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbVYJckMehHqW7pMrSFoU9XLJnov49IfXL+OR0P0xXc=;
 b=Z4XbgkSOcBJMXCjZpTqf0lFsWEJTm9vtq1ScZbyUQXX2C4TkYZ0tiPnDm7zis19nJTHuAmASXjXPJBD58m9/vM0+t/Hkp+xho4hSrkFxyaNssLYZs4U4Gdnggq/TmS+tty1tewGUMPgAbraz2hK61jM1lApF3/rV1DkN3BajumBPWh697RsTQ9OAFkHiSWm6mEqoq/kln+z10BqY1uKF9hKTIp29LgY+UjH4TVvmV+C2NHY6MwbTls/f/vAFMfaAgVuOBQaWpdeYz/0cIEAvR/VtQah1CRh6Spo4sAAy/YOiJXzNvb38jRH/mSeyHxpKFuGg/G9j3YWLU561NkeCxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 12:14:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 12:14:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 20:12:47 +0800
Subject: [PATCH v2 2/2] ASoC: codec: twl4030: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-twl4030-v2-2-868d0d572f12@nxp.com>
References: <20250428-twl4030-v2-0-868d0d572f12@nxp.com>
In-Reply-To: <20250428-twl4030-v2-0-868d0d572f12@nxp.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Tony Lindgren <tony@atomide.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745842378; l=6355;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=zRutLP2gVhiHvVKI0d7pUXtSI4FotQXNYo50xKP5Ktg=;
 b=d+JgcUgc1CYEOcvAOsWeFOHaQf0GAqj8R4zzoE0EO3VAg5/swejySJF6QlcldqaHfeXWDyCZT
 QSOOTaqRhxHCaNr8CFCGyh3aayuhFdUYZ2wYBqZiPv7IsVkrRde+/9O
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
X-MS-Office365-Filtering-Correlation-Id: 9ca02309-7d50-4c9c-65fe-08dd864e3351
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDd2MjNJcmVLREdkTnQxdnRkQVhEREVkQW9uc2VYUFZpY2ZXNWxIZWFOKzFF?=
 =?utf-8?B?ZEQzM2x1UFpRRW9GLzRSandENmw5SzhwOFp2VDAxT1gwU3JBM2FXQmg0cmFV?=
 =?utf-8?B?eWdZcm84RGE3eVpUbjIzQThobTZOUEdRemdEVWxDOXI5bzJiR0Foc0RrY1JB?=
 =?utf-8?B?OGJ1Q2FhbXd6aFBhemhLclFMeE5PN0h1WjhkNzZJaVdldHF5UTBKRmZVRVVn?=
 =?utf-8?B?a3V0RjNWUC9IbXlEVjJVVnE3NUovT0FhSDN5ZWNjVDdBSEZFVGZ6K3o0SE9s?=
 =?utf-8?B?Y0Z6OUJrMndwMVZ4V1BocEtlMUU0cVRrVExvU3NlZ3JWS093Y0I4Q0xYYmlu?=
 =?utf-8?B?ZGlia3BTbkpHVzR3ZmRvNURiNG9NYlZjQlU2N0t0cWZzMFJsSmdLRmwzOEhh?=
 =?utf-8?B?anlzUExlOGRicHo4R2FHemZ3dXV3bzBEaUEraXI2U2dLL24yZmE2RUVIaTVu?=
 =?utf-8?B?U3FqVzhFL3VqL0lKOFNIREJ6Sk1SRFFDSUVTRnJxUTMyNHI1MTk3VDlFdEJS?=
 =?utf-8?B?Uk44MDdQS3g5UStoQmVVN3N1SFZ2MDZwQUl0eW9XSlFLNlJlK1V5VG9IRzZX?=
 =?utf-8?B?SG1YKzQvMWZtNHhqdXJKbC9tc2tEd0VXR3VacUV3Z1BHT1hVVEpud21YM1Qv?=
 =?utf-8?B?aXVDaEtxcnd0SEQvWmxUbXFKbUticlpzeC8zMXVkOUtmNU5zelNRZHZXOFRX?=
 =?utf-8?B?MCt4cVNpQUJ6RVBkRTRISTFSU3YxZUxCYU9iUk5DNG1HTnVIYU5idGFucXBE?=
 =?utf-8?B?MjhSWDcyWDVub3FOSGFnc1VNUHpiMUdEZDd6UC9rODdzc3B0SzZxQkV2Ulh0?=
 =?utf-8?B?ZWxlVDA1YkdNZmJvL1R4a3pjamZZR0RnQ2dWK0FsK2dIaUt2eDdQU1pzWlh0?=
 =?utf-8?B?M3dFODNuZkloYzNyYWdTVnZQeDJtMm1mOFN5K1ROSjBDY1Vjb0VPNUowNmwy?=
 =?utf-8?B?ckxKRmZURnlLQUxOTU1BNWFBS200YWlYYnJ5cjJHMlFrY0VOMDc1QktSamdZ?=
 =?utf-8?B?TStZMm8waytraHFOYjBkazVDRHVjUGkvV1lIUnlyakhvQXZpQnZiVTlnK3VE?=
 =?utf-8?B?NU1SZjM3RVNCdVNYOHRSTDZwUUtySkFmTG12U1NXQmMwaGlZbWdtbmEzUFBI?=
 =?utf-8?B?a1ZMQkdjY3VzclI4dEMwdGNLZFVuaUw5blpSRE1EeHJVcFRsNGl0ZEVRN2x1?=
 =?utf-8?B?Qktpb2VuVDJGQURkTEh2N0RNQkNMdk9vVlY0d2p1Vm1NN2Fpc2lZY3ZJbFZa?=
 =?utf-8?B?aVlsYWRVdzg5VTVRSjE3V0pTNDJERWR6dXZqMFJ1SnRkYXEzQzBRMmJJdTkz?=
 =?utf-8?B?UHpXcThjZ3dqU0NEaVo5UzB0dks5M3QrSkxhSFduTzExOWNhenNYMURUeWh3?=
 =?utf-8?B?ak15TXYyZW84NGl2LzRsL0ZHelUzMW9Pa2FmNTNVYzkxMlB6TzdVY3J1UElN?=
 =?utf-8?B?OUFEWDZaRVlINStDKzhLYlp4ZEh0TkJtR1BlWElkTytPZFVUL2xZcUhWdjVM?=
 =?utf-8?B?NXdVb3k1dURaTEtmQlBrSmtyTk5Lcis0VXoxTkNiMHVxVEJtTTljRTFTR0dr?=
 =?utf-8?B?QzluNWYwR2F1anFpQTFOT0YzRHBuempvV3RCejFiWjBxejNSRmxvWUJZY29Z?=
 =?utf-8?B?aVJNYzl3TDl2NW9YdzdqdlQzamNlVnluRGlmVk8zU2V2ZzZHQlNhMmxUSUxC?=
 =?utf-8?B?bEJLaFRnZDRHVFRzSkVxQ1RVek9SbU5qamZ1VmVlV0RCUVd4M2NGRmhXTml3?=
 =?utf-8?B?YVpDbEVFMGs5WnV6T3hNUzV6ZjFFUTQrbWRRNXFXaVZqL3NTWmJGc0REY1RR?=
 =?utf-8?B?eFYyd3VzZ0RxNDk4a1JnaERUSVZvYWlOVVNXS2h4T1BmcDVqNXoramk3SWtO?=
 =?utf-8?B?MjZDTms3WEJya2xFMDRmYmZGUm5SOGNMQTJsMk14Z1JSWUJ3N1NmQkFwU0d6?=
 =?utf-8?B?bWZrRVZUSGNRSDJPVE1mTjYwOVUzdXFQaWk5cnNPQ1p5MnFNUTNJRXFSRWRl?=
 =?utf-8?B?bFRJbUtSZFVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHNVb1FxMlp5Z1B4UnppSmp0RDY3Qmw0cmVBeklmeXh6Uk1PMmpFS0tMb2sr?=
 =?utf-8?B?T2RoVUsxNEJxbGszbldIYUF5bDJmdkIrQVFGc3hQSjVJTEpVRDd0VWdDOFl5?=
 =?utf-8?B?S1pFcjQxdHJLSG9JT1Q5WHJxeDBuWG1zYkROUVFZN0kyb0RvcitRU1BDKy9r?=
 =?utf-8?B?Q09qMWVhdHJNem9qTVBGeXdmcEZpTStGN1ZQYzhwYnAzdWMrUXd6RVdWZ0N1?=
 =?utf-8?B?RmVXN0FLdUFLRWdQL3Z4ZExBaTFRRUZudHhTUnpnWVZnd2dlYjl0RWZTMEtZ?=
 =?utf-8?B?YStndmprYmZ5SDRtbVo3T1diWUYyK3BKbjMyWlhwdEUvcUpRV2RrMDFVbmlQ?=
 =?utf-8?B?akVwWVNHMDVERkdFLzNsSTd0Q3hGWEpzWFJ1MUt1S1p3cm8rczU3VndqM1Fz?=
 =?utf-8?B?Vk44RUFGYWJHT3hjTzh3ZkxUR014aWtiL2VVQ3FuUGprd2p3cGZlWk13dmRQ?=
 =?utf-8?B?c0w1ZDk4dExVaHhYa1dpekxwcnFLYjdKTERQaG8yRjBHVlJCSmQwUkFnNzEz?=
 =?utf-8?B?K1N6eE1MQlVZVXZlNzMrK3ppOHQ2T1AzaFpQSDZwNi9kWmVPYjJhajNtYjNI?=
 =?utf-8?B?UWlpZnAwNjdIUWMwdDRJUmRDNEkzWlNnUG1kQ09kU0pWYkJxTE1rVGZFU3hO?=
 =?utf-8?B?b1RpOENMUTB6THFKb3RHa0diSEtwZm9xQTNaR1JWOTdpS3JkbHBwTjQ0VG5P?=
 =?utf-8?B?NDNOa0gzL1V3UWpEOXNkNkppL0FjU0lXRkRpN3pDbU5xanRqcU9OZjFEbDlB?=
 =?utf-8?B?b1l0UGV4bVRyTTI2TjJoZVBoMTltb1I2SE0vVzhzWDhETFFKZEFVdDF0QVpm?=
 =?utf-8?B?WjkyYmgyakVDOW1YMzhkMnVWeDg1UFVqQ2FERk04dHFvMTBPMFNZVE5mRHIr?=
 =?utf-8?B?QWYzaDlOR0lDRmtxTzNySVpsNnF0S2UvTHpraXN6TWRjWXVqT05wT1JteFUx?=
 =?utf-8?B?U25UNC93d0taSEF3UVduR1FyMWgzVlBieHVIRmdRTkE0SDJnOTFSbWpscEFp?=
 =?utf-8?B?ck1ocVI2R0Uyd2FpcjJvTGJKcTFhSzhlOHVEdVlEZ2dqb29TcHMvMlJVSGZs?=
 =?utf-8?B?OE4xa09IRGVwQVF6enZ6RElMTFhVbjJMZ2dsSksvOGJvQTBZR0Q3QW5EekF3?=
 =?utf-8?B?SjZXZ2dhNUZXZ3F2NGpwZUQ3NHRHL0R0VGVFazBEKzJ4cGlSZFlsbUc0Um1X?=
 =?utf-8?B?TW5zRE9HRHJZclZLL1IyeFVmOEFnNVEyUGJhMVZIaldiY0IrYkg1NSs0YTJq?=
 =?utf-8?B?VTRVQ3dnZzlFT0gyOThFdmZBWlhMVzRyOVNhTFZkaHFEanptSjZ2WjNDenpa?=
 =?utf-8?B?Y29xakRxR3VuU25hU2dtRlhNMUxHTkV5emZBV28yS254Q2xGb0QwWndnQWZY?=
 =?utf-8?B?TFJIa2QwZWh6QWFueUl6YnFXVzhsUGtPTHpkV2ZETlZxN3VpVXhQWnlaZW1D?=
 =?utf-8?B?eUVrZVdxcEZyaWpSMXBsMjNGRVZxZTI2VTQ2N3VhQ3poazA0Q2szcjRKZ3BD?=
 =?utf-8?B?TlVGTSszai9xNklGcUN5Q3VTNTZOS2RNQ0tKYnhUNUd4VlJMaUQ3OTFicVFX?=
 =?utf-8?B?dmcxa25heVFMOWxneXpIS1BRQ1VyZkd0bFYvTlZtUUNLdG4zNnRjaEZlQ1R3?=
 =?utf-8?B?WTZ6dWtMVG5HSVp2WDhLSm13NXFTZFBtZFNhU0dkWDFCS3lhN3FiZXlHSG9R?=
 =?utf-8?B?RDJNOUZ1UFQzL2d6NGovVmVVOGV5cTFjSzVTUW4rSmtRb1UyWjl1dmxIR3o2?=
 =?utf-8?B?M0xtMnpMQ3NlKzBYdjJ1TkFzUHRITE85UG94TEhoWk5xcFhUY0ZGdkVWTlN4?=
 =?utf-8?B?bnJNWEpEUjFOY2trRm9XWXJ2ei9VNUwxVklnTkY4eko5Zm52MVozM3dGSG1l?=
 =?utf-8?B?UWd5a2JQbGlLVlJaUFdoSHo1S3VDYTJFdGhUZWZ6VEFvZHArTXJYRXZhMlpv?=
 =?utf-8?B?ZG41aHhweVRIek1pc1VHOFJUWmtjMnVEVHJhckJKV1MySk1UQmE2V2xpdXZm?=
 =?utf-8?B?UndDaHpVaWVtWGtoL0Ezbmx0ZmZCMDJsOXM4d1dsOUN0dE1wTElUdVNJTFBm?=
 =?utf-8?B?Y2ZISFBZTHNZSlBPMmJHSnpXcC82SEdWR1ZNMWVaek1UYkNjaFdjby9laGpO?=
 =?utf-8?Q?Ktpn3IMnEVPTBRRIMrP1utuQs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca02309-7d50-4c9c-65fe-08dd864e3351
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 12:14:18.4619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqzF1H7XZSorfb8AJZaggA9gpjQpxgDuoo/qg682Q5Yu54Ev4sPPKuEdYpqPCc5JUFUhptiCtmx1jYDeiq7t5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use of_property_present to check "ti,hs_extmute_gpio" to set hs_extmute
 - if returned value is true.
 - Use devm_gpiod_get_optional to get GPIO descriptor, set consumer name.
 - Use gpiod_set_value to configure output value.

While at here
 - drop remove hook after switching to use devm_gpiod_get_optional
 - Add return value for twl4030_init_chip to propagate value to parent
   in case defer probe happens

Checking the only user logicpd-som-lv.dtsi that uses polarity
GPIO_ACTIVE_HIGH, so all should work as expected.

Cc: Tony Lindgren <tony@atomide.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/twl4030.c | 63 +++++++++++++++++-----------------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index dbd2a0ce7dede26c302b7e30bb68c40ff6e3790a..92194579e15beb452b63c8f00800b50724f63ba5 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/mfd/twl.h>
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -37,7 +36,7 @@ struct twl4030_board_params {
 	unsigned int ramp_delay_value;
 	unsigned int offset_cncl_path;
 	unsigned int hs_extmute:1;
-	int hs_extmute_gpio;
+	struct gpio_desc *hs_extmute_gpio;
 };
 
 /* codec private data */
@@ -211,8 +210,7 @@ twl4030_get_board_param_values(struct twl4030_board_params *board_params,
 	if (!of_property_read_u32(node, "ti,hs_extmute", &value))
 		board_params->hs_extmute = value;
 
-	board_params->hs_extmute_gpio = of_get_named_gpio(node, "ti,hs_extmute_gpio", 0);
-	if (gpio_is_valid(board_params->hs_extmute_gpio))
+	if (of_property_present(node, "ti,hs_extmute_gpio"))
 		board_params->hs_extmute = 1;
 }
 
@@ -240,7 +238,7 @@ twl4030_get_board_params(struct snd_soc_component *component)
 	return board_params;
 }
 
-static void twl4030_init_chip(struct snd_soc_component *component)
+static int twl4030_init_chip(struct snd_soc_component *component)
 {
 	struct twl4030_board_params *board_params;
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
@@ -250,24 +248,20 @@ static void twl4030_init_chip(struct snd_soc_component *component)
 	board_params = twl4030_get_board_params(component);
 
 	if (board_params && board_params->hs_extmute) {
-		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
-			int ret;
-
-			if (!board_params->hs_extmute_gpio)
-				dev_warn(component->dev,
-					"Extmute GPIO is 0 is this correct?\n");
-
-			ret = gpio_request_one(board_params->hs_extmute_gpio,
-					       GPIOF_OUT_INIT_LOW,
-					       "hs_extmute");
-			if (ret) {
-				dev_err(component->dev,
-					"Failed to get hs_extmute GPIO\n");
-				board_params->hs_extmute_gpio = -1;
-			}
+		board_params->hs_extmute_gpio = devm_gpiod_get_optional(component->dev,
+									"ti,hs_extmute",
+									GPIOD_OUT_LOW);
+		if (IS_ERR(board_params->hs_extmute_gpio))
+			return dev_err_probe(component->dev, PTR_ERR(board_params->hs_extmute_gpio),
+					     "Failed to get hs_extmute GPIO\n");
+
+		if (board_params->hs_extmute_gpio) {
+			gpiod_set_consumer_name(board_params->hs_extmute_gpio, "hs_extmute");
 		} else {
 			u8 pin_mux;
 
+			dev_info(component->dev, "use TWL4030 GPIO6\n");
+
 			/* Set TWL4030 GPIO6 as EXTMUTE signal */
 			twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
 					TWL4030_PMBR1_REG);
@@ -295,7 +289,7 @@ static void twl4030_init_chip(struct snd_soc_component *component)
 
 	/* Machine dependent setup */
 	if (!board_params)
-		return;
+		return 0;
 
 	twl4030->board_params = board_params;
 
@@ -330,6 +324,8 @@ static void twl4030_init_chip(struct snd_soc_component *component)
 		  TWL4030_CNCL_OFFSET_START));
 
 	twl4030_codec_enable(component, 0);
+
+	return 0;
 }
 
 static void twl4030_apll_enable(struct snd_soc_component *component, int enable)
@@ -712,8 +708,8 @@ static void headset_ramp(struct snd_soc_component *component, int ramp)
 	/* Enable external mute control, this dramatically reduces
 	 * the pop-noise */
 	if (board_params && board_params->hs_extmute) {
-		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
-			gpio_set_value(board_params->hs_extmute_gpio, 1);
+		if (board_params->hs_extmute_gpio) {
+			gpiod_set_value(board_params->hs_extmute_gpio, 1);
 		} else {
 			hs_pop |= TWL4030_EXTMUTE;
 			twl4030_write(component, TWL4030_REG_HS_POPN_SET, hs_pop);
@@ -748,8 +744,8 @@ static void headset_ramp(struct snd_soc_component *component, int ramp)
 
 	/* Disable external mute */
 	if (board_params && board_params->hs_extmute) {
-		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
-			gpio_set_value(board_params->hs_extmute_gpio, 0);
+		if (board_params->hs_extmute_gpio) {
+			gpiod_set_value(board_params->hs_extmute_gpio, 0);
 		} else {
 			hs_pop &= ~TWL4030_EXTMUTE;
 			twl4030_write(component, TWL4030_REG_HS_POPN_SET, hs_pop);
@@ -2166,24 +2162,11 @@ static int twl4030_soc_probe(struct snd_soc_component *component)
 	/* Set the defaults, and power up the codec */
 	twl4030->sysclk = twl4030_audio_get_mclk() / 1000;
 
-	twl4030_init_chip(component);
-
-	return 0;
-}
-
-static void twl4030_soc_remove(struct snd_soc_component *component)
-{
-	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
-	struct twl4030_board_params *board_params = twl4030->board_params;
-
-	if (board_params && board_params->hs_extmute &&
-	    gpio_is_valid(board_params->hs_extmute_gpio))
-		gpio_free(board_params->hs_extmute_gpio);
+	return twl4030_init_chip(component);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl4030 = {
 	.probe			= twl4030_soc_probe,
-	.remove			= twl4030_soc_remove,
 	.read			= twl4030_read,
 	.write			= twl4030_write,
 	.set_bias_level		= twl4030_set_bias_level,

-- 
2.37.1



Return-Path: <linux-gpio+bounces-17885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14209A6D305
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 03:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7F8E7A3547
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 02:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1827D1339A4;
	Mon, 24 Mar 2025 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="par9dkgg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0FAEEB5;
	Mon, 24 Mar 2025 02:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742783286; cv=fail; b=h6bfvNQOY0L/UQ62HXNXshoma+CF7oiGGx+TwTf5E6x+bi6y14/rsMS5y5OptvkxRjw21cFlgpvCYMqZgXA+wQlyCgQeGCA2KUrYBps9+TfoptokICXib2FM/0wt8t7vpzcmK9boRBy8eWGVilVKOz40mpkxpvFKfK2doVq1ZTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742783286; c=relaxed/simple;
	bh=wiD+WxVqaxAmDr+rhR0cJUd883DVb5FJ2hFES/lt7CE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JsxOdkmNuxZ6BDHRnJDxlLklqovLhoBRiOFoSU013apXUOaK48JRI6TlraFGzwLGx4lPk812B2m1GU/daqAcL1k9dvKrLJpejsOFTxz9+rD/Qws/VUdEJRrckis0Gy5A2xgYQlfcIooAVUIc8Z6EZkAGyH8c9WrnZPk8xYPrzPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=par9dkgg; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1nZecCRo6z1kpH/Vc8LEwq5U12oKcNpUUtD6fIhqA7pktZ4Fu3z2oM4UEQh3JclKDbBxGXJfeIxolOj29+8TBDmrshzsCqhMW5fLEEfKKXpID+fBi05+VRX5sKVV2ADDGRGHrCbonOUDZGB8iLXPAHAwIkjXiZN4cnYjJEfkz+GroD14MunlC8Q6wVWgc/gW75z10ZUIPiQilbKwyc14Zaxp2VLpTR/Z3TASdBHPI4UHzqtn8n1bL2BZXDYztiRJD+qqyr8kWJMTmZVX02GdpyTNpN8LYM+0rkTHr6qRYEVPt0wnrfENtJ9t+558i8KkD+Y9YSWO3JMvsvhGjjSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNweXrzyFA8sXksnEvUJyo3LAWg1z7z1oPwaUOeqW/M=;
 b=e+sbwqy+ReRy6fYP/ZZ1vQfA9PTLYAneBZviN9PNpmBnl4H5MmssG0gMrwCgc6JT2CmoZN4nkLkrA/TBblY39vqIh9028uutOiE+VmfRoj5HQYx2dPzbLRY+662R9KJC62adjRT4/sfwfWNDr59pV8WTWLuQG6Rm6wgrUkR7dJJ3gkOapevOByoLAxky1k8pabRCj9X+NIH8uIgCJvDuHK2T3i7dlntwlcTscFvM2jzxEhVXqU6At5HRCkIhICNNErWwH1UXAL0qgbcrgeHpyiTIef9w3+HX1ioluDOXG2LKxRgFXJ7ljjGMmWX4AKsIRpvC7lNLbIt6OwCQ7UWNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNweXrzyFA8sXksnEvUJyo3LAWg1z7z1oPwaUOeqW/M=;
 b=par9dkggTOLf7jzyHX4xY/A+GMYsF7TxG7wj+C40AekWCK6nCcS3vtUIk/RHeezzOAvV1bCBqF5z4roO6kDt+quum+ebfNWiQPfYbMZ8PLT1hDDc4ETbkosz1qu/Qt6qSY+I5Zp3T/pqho5MZiRTrfGrDDXHg4uVh+X0ViWuGHtE2tKJ7xhHNvGBH1c3RlILimPu30Eo9OmJxxAfxFj3RRssAbu6Z+xG1TsRjT65bLx5KOmSY6WAJy9A1G/3xkPzOcGtMa8fuTvAcFIvmAnYgtkc4t3Od3quxdvBarOY+1mpmctDjKasaZaScIPhIHWZ7fyVGIyBAz2r0Kyo+ym6hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7019.eurprd04.prod.outlook.com (2603:10a6:10:12b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 02:28:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 02:28:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] ASoC: codec: wcd93xx: Convert to GPIO descriptors
Date: Mon, 24 Mar 2025 10:26:53 +0800
Message-Id: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7C4GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMT3fLkFN30gsz8FF1zC6Nkk0SDFAszCwsloPqCotS0zAqwWdGxtbU
 ARlTLhFsAAAA=
X-Change-ID: 20250324-wcd-gpiod-782c4a0d8688
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742783224; l=1044;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=wiD+WxVqaxAmDr+rhR0cJUd883DVb5FJ2hFES/lt7CE=;
 b=V0n5UDRQ28YG9t9uHCIr6CuPeqLCzuLlvf1LVmlv/eMHf6bt2xBpQ6hQUtbzVpNDB1RUVPd2L
 l8/0hP9DaaaDuQgOiSOeeZJ6IvC3x4lIk5auXWAQr++oCGWrJSHyMWi
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
X-MS-Office365-Filtering-Correlation-Id: b82a5563-fe4d-49f4-f1f1-08dd6a7b7fb8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tk5KTXVmK3BkTW1DbFAyVmpNNTJEL21Xam1XMXV4RlZBdEhGeXJWcW9BcnBV?=
 =?utf-8?B?L2ZZNG04MVFXSytHcHdvS1p2RlFIUDR4dyswaTB2NGRjSTZvL1pTeFlQaXo2?=
 =?utf-8?B?aGlFelQ3M254RytrMmhJT2I3YlhzUVdibmwvYmRZRHJZaHNuRUlUdzlTaVBk?=
 =?utf-8?B?OHk2akxpVDVoQXRlVWI3RTQzQzJCQkVNSHhCVERDZWtLc0MzYzhNYStSakZi?=
 =?utf-8?B?cDJOR25WblhHbktpV1BhN05Ecks4TnJNazJYVlhoUVlUZEh0eG1mc2J3azZT?=
 =?utf-8?B?WXE2Rk5WcjJMTGtDNW1vV2tJWW1MSGJ2V3hSME5ZQWJQYXQ4dTZuOUhBRHNq?=
 =?utf-8?B?SnNUS2p2WFk5bmdyN1lTT3NySVlFaENXRTI2eUZGa05ZZ0VYMlk2b3A1T2pI?=
 =?utf-8?B?SlhJZlNZcFpsQXRiaVZJcGczdjFYNW1oL2xPaDg2V0VzK0ZXV1dROU0zS1E2?=
 =?utf-8?B?RU1rUUhkbHM5SUdYWldTY2xUeWUxTjZZTXNqbjhObm5rdnJySDNJSzNOcDRp?=
 =?utf-8?B?K1JzZHV0cTJweXdxY0lTNDBvY3pqUE4ySFRMSkVrM0hydDRNd0dPTnRjVCtY?=
 =?utf-8?B?b0RQWGZEUFRMZWRSS3JBZmRWcTkxKzJzZmUvUjhzVHFxNWMrUTZManlKQ3Fp?=
 =?utf-8?B?T1AySWNiNEFiNXZsa0hNbERGU2p5T1dtQzhNb3lVcjVBTmJISWZGdkd2Tmxy?=
 =?utf-8?B?OStHVTl3b2lITDMxTlJOYWpwZFJua2RLTVQvRnVzUjhTU01UZUVKQm1zQ1Z2?=
 =?utf-8?B?NGhxcERFRUZmNHFrMEVrQm9WeW91b1owNkloVHRnSit6RHk2Mk9hdnNsNCsr?=
 =?utf-8?B?UUpNN29XaVBjenBNTUs1SzY5REgzRWp5WlowbzlXV2FGMENBM2pTWGdYSm8w?=
 =?utf-8?B?UDdDUVZtSlMzZDJqQjNJVG1xeTZTV2hEbnNRcFM0NEZZZ3oraHdxV0U1Smx4?=
 =?utf-8?B?MStTZXFWdUZsclVDTndGK2FNdS9ZUWlTNjNZQzdqZzlBUGNXMkpnK29CQ2VH?=
 =?utf-8?B?bWU4MXZ0eGpzY3FKYm5mbkMxRThBV2FBUEtPZ1hOL2R3TTNXcVpGQWdKWG82?=
 =?utf-8?B?dFpVWVAxMFVYQndCZ0p2WXZOdTdBMEx3QkpHcU5FNmpMak56OE9ZUEZGeW96?=
 =?utf-8?B?bEJxYXAvRThYSDZvWmhNYnZNM0dJczdJMWxqNTNXMW9memNmekd2VDhLclBK?=
 =?utf-8?B?MHFDUWc2ZTErSVJRWlI4YmxUa1pTa2FTOW05L0Z5VGhGaExDVi9welF6bkxt?=
 =?utf-8?B?aFcxL1dvcmI1NUZWWFVYVnR5Uk0vZXdjMkx6ejdGd3Y0NDBDMXlkU2NjbmJJ?=
 =?utf-8?B?RExuY25uODVxckU5b2g1YUh2UEVQcC9HQ1dWRkxlYkJxekpWS0RmSmhkYisw?=
 =?utf-8?B?eGdwenR1a3pvM0dLa1NvL2gzVDR3Rk9RVjhwNVhMYjJubGtwZ3BMTWV1L2R2?=
 =?utf-8?B?RHZINXFCL0FHaE55bFI1bS9HekJRWDRyRThWMjNHUWNUMENRcmVDay9lNnhj?=
 =?utf-8?B?TExKaDJHQWxvOWZnNTFlSXRSRnJ3Q1ZQNmxkR1hwYlUyU0h3d0YvOXJUNnls?=
 =?utf-8?B?eHZ1cmhDbWFsNS9GKysrWmxkOEVSMUdaUXlZR3R2MmlkQUpZa05TclNqb0VW?=
 =?utf-8?B?OWU3Tmg5M0p5dEpSVllWQW96VmUybG55REFnRmlQdStzMVBVVmtkWm5ER0lW?=
 =?utf-8?B?Y2w0WEJFTjR0akY0ZXgwWVNieHpJMFRWZU1hZVkyT1NoMkdUVUZzOU5qU29O?=
 =?utf-8?B?Ym55NFZhRGhDSk0xbWRkRkpxcGNyOHpKSStvZEp6bVIxRmVDODJySGo5bFZy?=
 =?utf-8?B?OUVBSkdqdGFyTlBnQnUyS3F6V3dkRFNQU3hQTUNxbTRKcDZ3K3RwR2ZNNVZG?=
 =?utf-8?B?QXloeVBPZ21mRlpSUER5aFA0Yi9SMkpKSWVORmJMVE1MR1hrUC9vNTRrSXNy?=
 =?utf-8?Q?qSrWHOwVWzIINgXKcWQO7wb7snk57LCa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVArUFhET25RNmNpTllsT1crTEhVSlR1SE9jNVZMWVl5TDlJS01sNjJxcU5v?=
 =?utf-8?B?T0w5ckNVbEMxM0NJVUtramxLNldEeUlkZzNhN3UzV0JWZ0o5aGhUME50eTF6?=
 =?utf-8?B?ajV1YVBLaG9vcjdtYmY4UXZiVXRFc1YzOU5mMnpCSzJVcjQyQ2NKVDQyVjg3?=
 =?utf-8?B?RGZFNkJiS2MrVXE1UzZlUUxYN3ZFcVRpNUg1cTl6TjMrQmlrZDkyZ3Urdmg1?=
 =?utf-8?B?Zzk5RGg2cmswbWpzdTZ4RWhBZlRDUktQTjZMc2V6dkJMM1FSdk5MYUh4aWpt?=
 =?utf-8?B?YWJTMDBBL1Y4NGllYVliNTFGWGhKOVBwNXJhS1ZZMks0eW10bm9KRm5uSk5T?=
 =?utf-8?B?bDgzc3MxQmxjbE00bnAydDgxSllacTBDSlE2YlR6TXBnb01nOHJyQkd0WURK?=
 =?utf-8?B?Yk44bUpVdi8xZkU3SVJRc3FweDNrNGxSR3N2cXhLL241TjlLcUxSeENpb2Fp?=
 =?utf-8?B?bFAwYW9EaWxENWVSUFgrT0NtandSOGZ0ZVgrYmkzWXdsVk1BV1dGR0tka0lv?=
 =?utf-8?B?Y3Y3SXhwZjBPNnN5dEMrQ3p1SFFzcDdUZWdSZkJ2bDEvYXQzR2lRTXJFRytM?=
 =?utf-8?B?ckNocjRYRVNnM296UjR3WkorYjVDczYzenRNQUJoWUp0bUlYTzg1bUEram82?=
 =?utf-8?B?L3drRUl2bEZqZnRZaFAwbWszS3dpWk9naFRGc2RnVGU5VWl2cmxLWXFXRUNa?=
 =?utf-8?B?bG41cVNCT3czQlpYV0xUMTlRSzZHSW5KUzFodXJ0MkhMWGtxWlJJOFJZcFA3?=
 =?utf-8?B?T01lTFRDQVhDQkhhVmxkWlgrVFgyNFVaaWYvdk1LNWNiWUZ1WkZZRHFVTzVq?=
 =?utf-8?B?MklGekRWWTNrV1VhUXY0NVpkcGVpckZqMGJESDA3Vk9VWWNLRDhuZGtCMW9Q?=
 =?utf-8?B?ZnV4dyt5UmxCRmxrZksvVnRDT0xsejBYN3kxcE9VcktKZzJyYW0wZDN4OWVy?=
 =?utf-8?B?WEkzcWlwTng0VElnZis5NWIyaU9tdDNPTlpwUElhS3RBaHM1MXV5elB1SVg3?=
 =?utf-8?B?SUNaYTlZR09YeHMxeUhmNEJyc2JuS2h5Y2l0c2lGSkh1VEJoTVI1SnIrNkNG?=
 =?utf-8?B?bkRMWVRnSHNabGRRc3hMYkUwcjBmYmlVNDcrQ1A3RDRmc1VtQTBiaUl2V1VE?=
 =?utf-8?B?NmsySmFqVDV4MkQzWElkMnU2eEJqWFhDbGhFaVNXb2FyOHI1aVJOL3lnUkQ0?=
 =?utf-8?B?VXJlL3RvZ0lKcEswdDV5VFNZcklOcmQvYTRxYW1WMGFBWHhaaVBCWUlaNzls?=
 =?utf-8?B?bUpaeTZ5MEJ3V3lsVzlRdk85WTc2V3lFM3VFWm5Jc2lQTGhzbGZZeHVlQnVs?=
 =?utf-8?B?YzNBVmRRNDB4NWFPdHRyM3FrV3ZvWFAydXYxSmEwSW5DSmdNZXpReHVwRmRZ?=
 =?utf-8?B?dFFJN3NqcUZpSlU0cTR2eGo1czhtRmlSZnFhRWhWaFF6dXJvejdrcXNPTlJz?=
 =?utf-8?B?L20vWTl1Zy82UStHZnZzVVNvMWhRWWgrUy84akJpRkRGSFJvVEhPSWVuR21Q?=
 =?utf-8?B?OGZ5RUFneWt3VWF1Um5ySnpZSVNJdmRDOGQxYWVidnpVaS9MSTNNU0p0OVc0?=
 =?utf-8?B?SjZKc3IyRkNsYkNpR1JONkZOdUE3cVIzL3l2amhPa0lQU2hDSXRsaTZNaVRI?=
 =?utf-8?B?dXcwelFYQTkxa2ZhOGYraURRenJOQ0VVMWR1SkZRMnRZS3ZQL2hVUWtpMUYv?=
 =?utf-8?B?UnMrdnRvYXFobTA2SmhNdEIyUWtDYk1URU5UdVdkWG53bnQzTU55bHdDbTBy?=
 =?utf-8?B?REcvMGduRStWL3p4dnBOWkVVbnhoRlNBYTZPcGt3akFmaGY2WXEyVkw5VmVw?=
 =?utf-8?B?NUx0aHMreUxGKzNyNldQL1lSaWxOQTBNMGllY1J2WnBjVDB0UkF5WWhwdGl4?=
 =?utf-8?B?MzBKYWRlSkxlRisxekowaFZOQ282a0lvZ0hmZFozcUlSMGx5ZVQ4SGVlcWto?=
 =?utf-8?B?bnpKbGx6VEdCRzVmazhScnJUa1ljRkt5VnZ3dzYzTnhSU0VwR0wrYmRTanF3?=
 =?utf-8?B?YmxMdTkrYkVhazB1dy9RdWNrRis1MkQ3emprN0E4MWo1MStKZTR4YkErTGYv?=
 =?utf-8?B?RW1KSjJuTExkNWg3SCtJcEpYL0xZTTJDQkYvZ2Rmbm9vMXB1RW9jdTgyVGRq?=
 =?utf-8?Q?eTe+/NyKMn5xUpOeeo83gxJ5i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82a5563-fe4d-49f4-f1f1-08dd6a7b7fb8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 02:28:01.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYCGm3fvUMIPv/nzQ3OfPhxPat5JfyQcQdwzE5JIPUxwV6QQANKmP3szuLf3wiW2ctzJHAUpOt2gCzqihvESZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7019

of_gpio.h is deprecated, so update driver to use gpiod API.

The current driver use value 0 to assert reset and 1 to deassert reset.
The DTSes in tree that use the codec are using GPIO_ACTIVE_LOW.
So it is safe to use devm_gpiod_get to get GPIO descriptors and
use gpiod_set_value to configure output with value 1 means raw value
0, value 0 means raw value 1.

Note:
I not have devices to test, just my best pratice to do the convertion.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      ASoC: codec: wcd939x: Convert to GPIO descriptors
      ASoC: codec: wcd938x: Convert to GPIO descriptors
      ASoC: codec: wcd9335: Convert to GPIO descriptors

 sound/soc/codecs/wcd9335.c | 15 +++++++--------
 sound/soc/codecs/wcd938x.c | 13 ++++++-------
 sound/soc/codecs/wcd939x.c | 16 ++++++++--------
 3 files changed, 21 insertions(+), 23 deletions(-)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250324-wcd-gpiod-782c4a0d8688

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>



Return-Path: <linux-gpio+bounces-23997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED3B19BFF
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 09:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79D9D3ADB5F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273782367D3;
	Mon,  4 Aug 2025 07:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b+ZywwSi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D4231C9F;
	Mon,  4 Aug 2025 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754291538; cv=fail; b=pYQShQcmiTvTwlYsDp04gLfYWDQfpKy87ulZ4B6ZSR9DaRc0U1TRF+8oA2yJvz4523ZWXaixrmeXAwLjSWxofXad8lkXciES2K1fhkVodSqRq4cTVecSAadefFmn8reYNjH9+HOuZWO/upGrAJ2y6zSilO85n3hEqFvKUMCcQPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754291538; c=relaxed/simple;
	bh=hSLaIKHpHYGwBdEB1VPrnKAB8vopRHrBkB7SkXWHbz0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eo8ICdhwtTElt+vDWQgGo6pNjVoUnK6Vx/mLO0ljOaxEWogl969JZiyfIReDxb9AAMCu81/7DPyfMKzYx1ptwnWBNIgEPlVib4L3S5GHV0Q6/dreptxuY+iiFQ7vBa0238aBsk3HwmGTm492NBGOqbiHAiS5d6jWSLd7TTSC4ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b+ZywwSi; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYfQGV/Ex4OUhl104nXFn/BFg3IwewuAg8V6oFVhMqufLpLnuEk8OvhsGCOZYBrxN+ZDiiwqWFGh8DLJu0ATq5iggVT5RMwEe9SUXqW4D9nDsWAKDKZ8zGGH0FmaKM9gHwTKpgP6w2TRENQYW3rrfyE9GcyWJS7SWU5InM7+eBCEqkLDq4RMD2/awLc1I3RkHDRbxBwmijL4eS6MvQezx9ElBfcOk4PW/y05V2dewrcfIxfZ/yF1XU1owZRJ8NpVaoBs1RJ0CzrOUachmDCYhU3+WFsQ359RzlwmLc1Nq7e436h2EWVGCbZbtLb7vykdZJ8E4HbvXEqOxvAd5ibG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hpbdWuKHbD35Ln+O69aaxlX/IZk7rNg5zMlIfMYyEU=;
 b=K9pZ0T6vIuH41F/bWQmLUJP5pbbBTVYzTy1b4Dxgc/TBqLLqAAchTtlyTf02rB4bbgbJQ6QYpnJldLDUcF58sKmf4MCM0IL+XeKycRSPyLzMFz2KGPuhooIPjmFLNrlyOWhERVI3AvUqWNY+YduWQDtaxFRIkEYwz3NmPl7MSDcsb5twI03GaNpN+ZNjjmI7KSgdB1XbPJcZEBdPrjj17fR5GsUMqykzksCydqHHrJRgTRYWzhMN316JBldyGpZTZ02ymzI3tOJKGlCozmPkwCrVpBusVDkUbGuXEVz8ihKuYOI3W/LDIylIacYL1AH5zvyYOQpE4NOIkxd5aKuiTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hpbdWuKHbD35Ln+O69aaxlX/IZk7rNg5zMlIfMYyEU=;
 b=b+ZywwSip0/pL4eWysJuz1DJt3idGbRiHDsKkqvrbZEXhaLcE8Q5yBxXvDWAWgnizCmKLzhK1zGUwimsoYQ97FrdXJDyAXauocaRPmXF/7lo+sh09eNEU67VUnBB6AjDtjNFAj8xPRFNkBTfydwIcgtd9IVUyzMuZdD+7LyW+MA0/cdaTGwAkTY/HMdDr34wSr2t+M1qxSsbb7SvPn0scnNIbfFEianl0edl0sjaKB40G6LNQhAF9iFf5oHFhdg8zcd4/uS7G+Ty6sF4R3dUubCG9JacpUkw1BNRv7QtFzfWC7JAqKK4noN1t3As2IYWEfzTSgCkWsX3RbuSlyslLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU0PR04MB9298.eurprd04.prod.outlook.com (2603:10a6:10:355::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 07:12:13 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 07:12:13 +0000
Message-ID: <0973e6d1-2823-4bfb-be73-b532c6f86784@oss.nxp.com>
Date: Mon, 4 Aug 2025 10:12:08 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] nvmem: s32g2_siul2: add NVMEM driver for SoC
 information
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, aisheng.dong@nxp.com,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, echanude@redhat.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
 <9d004ea4-0bb2-4a21-8501-82ecf3482c3e@app.fastmail.com>
 <fa24772b-0038-4f51-87c6-15b810d8d454@oss.nxp.com>
 <53bc13b9-365e-4212-84f9-85e67c23e067@oss.nxp.com>
 <ed072356-6881-4466-a0c2-0f55b72f92c8@kernel.org>
 <7902bac4-9f52-443c-995f-a15189102478@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <7902bac4-9f52-443c-995f-a15189102478@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0149.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU0PR04MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e48ebb5-628c-4782-94e3-08ddd3263bfa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE1KcEltR0t1UXMrUkRoY045NTkvR3QxZlBCMGduMnVodEltdU5vMTdJMEpN?=
 =?utf-8?B?OXlGWWp1bHB4RFlOQk5SL252RlI5UlVEMHVIOGtsVUpSV2pYRlFnTlo5WndB?=
 =?utf-8?B?bktJVi9ncmVNaWFxQkJUQ3J1dDJDTXBaNzRRMk1EazhQbzNhcW12MjZJZjda?=
 =?utf-8?B?d1Z4U3ZuWmJMU05tS3l3d1VXUVorTzJEWkhWUks1N1NLOFNhYWc2N0RUNGkw?=
 =?utf-8?B?Ylp4ZWdObWhvdEVjTHZYc21CaTkrUmFTYTVqY0laYmZJMXdweUZFQ3p6SkVZ?=
 =?utf-8?B?NGdld05VVSs3VEpFTm9iSW02eFFRbWZhYjFaNjcxNXplcDlKY1Nlek5ya2xE?=
 =?utf-8?B?Z0ZLRG9JRVVwT09xUFliUVgvSHY1L3hjY0p0VGhFckR2OG4wOGY5MzlZajl2?=
 =?utf-8?B?bzN1a1B6T2ZncnFub1hjbzVMUFplU0FmZ0hWc2hoZFJaTS9rUHJ1QUl5MHRZ?=
 =?utf-8?B?b09NcURKckZRWmZsNEFYTTEzS1dLeVowcGF2VVBYcGpINjJ2Lzk2MWhFZGdR?=
 =?utf-8?B?dnBnblIrSklZdmFEZk5JUlY2UHZhVGRpZ0IxaXZicE9VOVppeUpHSC9rZWdK?=
 =?utf-8?B?eCtqWHdCMHptaWxqN2Z5cE16cFNQS2NyOXFGTi9tQzI3bWhhd1YyL0pYUVc3?=
 =?utf-8?B?RWEvTjVtUWpFL001b0MzeFZ2M05OQ2Z1dXNPTVpDU2lyR0xOSlZFWm1jUjdZ?=
 =?utf-8?B?aGlaZUVKK3BZaUFHMkNoSVpGU3VnRU5VRnI3M1g5WTFhNUVQWGFVTzY2dHZG?=
 =?utf-8?B?a3pHRkszU2k1VC9ranJWVm16RGFRRnkyNjE0ckJ6a0VDWWhCS0tmOGRvTWJC?=
 =?utf-8?B?Mi9qZCsxZzlXZGxtV25iTU9SQnJKKy9iUXA2NVFaWU56WEd2MStuY25NSEdQ?=
 =?utf-8?B?K0NpZ2UrZTFjZTVValpBcFBXamRPejd1Z09BZE11SEhxR09pRTFDVHI4SmE2?=
 =?utf-8?B?cW1aamlEejZJWHNkR3Nsc2ViMUtjWC9sN0JlMHRQb05jU01aS015SXB0b1VK?=
 =?utf-8?B?blhycmR0UlgrR1JwaW8yYUZ6c3VIaGUvdjduSlRqYlZoa3BxYS9Mc0FPN2Q3?=
 =?utf-8?B?dzVoeXV6SGI4SExOdFJIOVNnQ1dkdllkbnc0N0xRNDJiaURTMFdzWkJxOTRW?=
 =?utf-8?B?WUxnbTMxT1lvZjNSZG9jZlJtQzFqUHJ4dlMyNXRmb3ZSWWRGa1lpbmR5QndV?=
 =?utf-8?B?eXJYZHE1UEJWOWZaS0pNczhSdDRrMUVXR09pMEJ3Q1B3ZFN0NVNTTTY5Q2N6?=
 =?utf-8?B?amRsZmNJZys1OTlVTTJVL09SMGsxbHRjc1pkM1AyTHI4NVlNUHZHOFduMlhY?=
 =?utf-8?B?YVd4S25tSk4vYmFSSFl3RlNub3hFWkxBcWV2T2FtbDJONGtMVUVMbm1KQ2pD?=
 =?utf-8?B?MDZsSkxIams2UFhKL29tY3F6cExBMDZKYysrbkZhc1lyQ2pqUXdha3hKaE5x?=
 =?utf-8?B?dURQeTljZGh5bDhET21FNmlwYjErVUY4c1hHVVdmYWx3OUZqY0UxSDlveE9h?=
 =?utf-8?B?Ni9ldUJtQituSTFrWS94ZlRsUkN4T2VNbUEzVGlWQUUvRElnNk56NlJsMVJp?=
 =?utf-8?B?U0tGcHpYbnU2ZGxReUl1eDJUNmhnMmhRZGhORFNFQ1dJY05CMXJhcWR3Tk5F?=
 =?utf-8?B?b1dSNE94d0hNY3NtUnlUcWNUTXg1RmNOVWhkc0hOOW1QRjdGalRsK0h5VmRL?=
 =?utf-8?B?VXJpOGZKMkZJcWJ0RWJzZFRuTWhzUUZzKzdjRXRCY0ZGTGRpNWdvbFBiZ1VP?=
 =?utf-8?B?dEtRaGJpZlJWaGkzUTRqSHRxQzBTcWhEVlhMc01UTFVJL3ZhbzJCVWdQRlZk?=
 =?utf-8?B?cUNoZDIwUnBWRmhLMWVDaThKenhleWg5UE11NWovR3dQMVhTMkIwMi8vNlNK?=
 =?utf-8?B?VVZFc3NsMHY2bHNHVVYzODg0MEpiMW5TVjhWOHdlVWpMRTJVNVN4QytnUkdH?=
 =?utf-8?B?Smlud3YrOWErT1ZkK2t3VTl0RXFpRkZRQVFjaGdYL0tLcUErVklxSW5FRkEw?=
 =?utf-8?B?VzFJTm5kQU1nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnhvNjQ5SldkTyt0U3Q4bENBNnF2bnp6b2RYSURhMHpNYlN0VkhPb0hINkNK?=
 =?utf-8?B?bndmbHFVSXNsTEJBZ2hpd3dpNzdMTVp2bDFMM2RJVjNkT1JlMTRzNlQ1RDF5?=
 =?utf-8?B?Y0theS9YeWJKWlFoYWpGbUNreklPSjc5ay93YmZ6M2lTNmFiK3JMbjhxbTBm?=
 =?utf-8?B?VzNQQmkxNG5EYTZmTTVkMGx1T1dock5GUEhFNnI2VHVJNzlsWGdZRTV3M1hF?=
 =?utf-8?B?eUF2MXJIallzdVk2SGpKUUJLRDlZSHF4RTd2VldmdiswREZCdFQwcll3Tmhm?=
 =?utf-8?B?ODBJemhnSU9hUU9iN2JROStwUlRBcUxmeDY2ZVdlZWhyeTZsakFROWtGRHVz?=
 =?utf-8?B?djRHV3NKSkQ0bFNzbWxaV1VqNkVWeFI3VHFvMjhCVW9wOFJCc1RCYXhEaDZq?=
 =?utf-8?B?dFB4VDQrTXBZRmVkTVpQckNPSEwxcVFpUHViazVRMGJ4RTRqY2lOaVpXU1dI?=
 =?utf-8?B?c0thdlIxSDU1YjNmTXRZdCt4MGVrdTBaSXIwWVNkVGs0NHJXQVNScWRBVHh6?=
 =?utf-8?B?QXlCdm5uS1UwZWNRSEdxNEdCUC9EQmllT0gvck45SDR1OW9MYVNudWVobm5k?=
 =?utf-8?B?Mk9pWkFFVXhBMkowTUVYd2lNamJRMVlzeUtjK2tmVmtVU0FWbGQ0K1VSMERk?=
 =?utf-8?B?TjZUcmhOTTdPeUF5alJkamk0dmVHd0N3emdaMnFmQUk0NkFtR2RnbTNUU1Nv?=
 =?utf-8?B?aEsyejZ6NDJ4NGFWSUZSQ2Z5eVNreE1vT21KVXY4eE5lRlgzMTZjbDhsUzZY?=
 =?utf-8?B?aEQxQXB3eE5TaWdzd1d0VlJtaTN6VjltWW14TkQxMDV1b0ltbnJySmNoNlEv?=
 =?utf-8?B?NHFPSXd3MkdMMWZObGRJSklKL3E4dWhSNWs5OXl1WjB3UHNPVFdjQ21BbExa?=
 =?utf-8?B?cE5RMU9iMkd6R1R2YjRQVDlzaWVOUmdaS004RVhmS0pKeUJUbldyTVRrZjl5?=
 =?utf-8?B?S1I5dGl2SlN0SER1RzZjZjYzSzFycVgzeXVMcUpBYVdIMi9qMVdvOG1SMUlr?=
 =?utf-8?B?NHpHa3RPbW5xeXE4Y3ovV01JWkxHWmF4eFMydkFMWHRHbGwya1FKT25YNDlh?=
 =?utf-8?B?VUtHU0xRVWNvdnlzQUU4N1h5cTJoc29QdWFyVUhnWG05enZmMUtzSFdBTkFo?=
 =?utf-8?B?UnB5SlU4ZTBMTkVSM3dmYVVsRHkyUUJFOFRZRHQ2L2RKaDloMkhPcU5ER3Jo?=
 =?utf-8?B?dXZIckR0NXdyWUE2SFZNM1BaakUwcHlvWGM2NFVjY09MWnNtbkhnNENzVVFt?=
 =?utf-8?B?NmFvVmNpa2Z1N09XSGZjRU55NEJiUytSMThNM1BvajRDVVVCTlhlSXpMckNj?=
 =?utf-8?B?RFN6c2hYVmNibWVpRjI5enF4SmFuc08rekpmaElDOEtIdURscXhLS1BFYWV5?=
 =?utf-8?B?YTN6TUVyR0ltVkZ5S0FMd3JZbkpIODduWFRPT1E2bFQySWNCMGFQODh4TTBD?=
 =?utf-8?B?ZGZjNi9XSDJOZE5BbzRsYktPQngySDg2REhHMmE5ZDM2MnZXRE0wWnFqWldh?=
 =?utf-8?B?RWNxbW9PSEViL2U0N2Z2WVpMN0dtdEs1SzNsRGRWWnMrZlZZTXpZVVhvUGlv?=
 =?utf-8?B?UUViYlBTWG03OGFXYTFScFpQc0VETGV1MzRncytZcE54R3RuTGRON0V0d3Vp?=
 =?utf-8?B?Z0pCZm9reEc1TGEySm5kR2Fyd3NnRVAwOUFaVk1mVmRnS1lDU0E1WmU1bXZO?=
 =?utf-8?B?cVhKdDk2WkN2N0lLRWRFRFJNcnlFUjBrZ2doRjIveGJ3WEowSEt2dEYwU1g0?=
 =?utf-8?B?M01lY2RIa2p2cENoaWNUN01Yc3o2dzBuTkN3WWZFR21JSXordVN5NVg3ckxj?=
 =?utf-8?B?b25kaHQ0SFdlT1V0MkwrUGFSWGY4RVFtY3pDSGI1R25McUpzRnA3ejZQOW5L?=
 =?utf-8?B?SVJ4S3ZETllNT0FBTzVVWnNYRXhRdFAzSUxSYmNScHdEMDVlYXBsanhkTXk4?=
 =?utf-8?B?YjFsTkJHNnJqQ2xZdXVVNTFHaWwyNytpWEs3QUNuRTRNODErb3ZZQXNQbDBv?=
 =?utf-8?B?VGRpaE9HZlVPd3ViSWRmYldWS2QvZXIyWUk5Q0ZhSTFXNW4wN01UM0tOWnJh?=
 =?utf-8?B?dTExUUxBVlZ0NUp3K2NMVlYrWEo1L2Z5L0xvSGpUbldCajJ6QnZRMS9Ic1A2?=
 =?utf-8?B?L1ZOR3FONHplSHdodUc2VWZPTDJ1VFVyY2Jzck1aMEdnNTlZV093QmFVbWhS?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e48ebb5-628c-4782-94e3-08ddd3263bfa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 07:12:13.0147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3r/NKn0WwBOW7Wvu+3UAK/QyARBTqbtZDGTOgVpZGSKiWDVZP/nifZ8y2iMdwnuuHCNeiT9Lb1+1zsTed1HuItSiadutuk0J0mfQA2pPh94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9298

Hi Krzysztof,

Thank you for the quick response!
On 02/08/2025 11:32, Krzysztof Kozlowski wrote:
> On 02/08/2025 10:28, Krzysztof Kozlowski wrote:
>> On 01/08/2025 16:36, Andrei Stefanescu wrote:
>>> Apart from the proposed NVMEM driver, there is also an option of exporting
>>> a syscon regmap for the registers which provide information about the SoC.
>>>
>>> I have seen that typically NVMEM drivers export information read from fuses
>>> but I think having a NVMEM driver is nicer way to access the information
>>> instead of using a syscon regmap and manually extracting the needed bits. 
>>
>>
>> nvmem is not a syscon. Mixing these two means device is something
>> completely else.

Yes, I don't want to mix them. The driver will either be a NVMEM driver or
a syscon. These registers are read-only. I suggested NVMEM because it's a
an abstraction layer which makes it easier for drivers which want to use
that information without knowing where to actually read it i.e. reg address,
bit mask.

What do think? Which one would be better? Do you have other suggestions?

Best regards,
Andrei

> 
> 
> ... and yes, I am aware that three FSL/NXP bindings use nvmem as syscon
> already. People are mixing hardware description (nvmem) with some
> purpose for drivers (syscon) forgetting that syscon are miscellaneous
> SoC internal registers, not non-volatile memory.
> 
> Best regards,
> Krzysztof



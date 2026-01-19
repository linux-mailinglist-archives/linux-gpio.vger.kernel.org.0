Return-Path: <linux-gpio+bounces-30746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E8D3BA85
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 23:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9294300DB07
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 22:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795EE2FD7A0;
	Mon, 19 Jan 2026 22:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YiJJ9QQP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3819ABD8;
	Mon, 19 Jan 2026 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768860789; cv=fail; b=qawWl4hWjUsKdTih3YW0SXjaOBnElzLOJjyu/JPrgNHkhY7l5HsmuJ9fMMBo17lzufswrEV6EkJwOCYuWKQKEMLOtr5rNx0THCQu2Utpg84rADNbroDDiaxVvRL1LzbsnF1b/aE+efnrf/5cezBBe7pzZoaAVWkkDIeCkMfJp70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768860789; c=relaxed/simple;
	bh=FEbKP3IqHCgcIYxzD6XvmtbGhQY86WqPC43rVt37FFY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B98FLor/PCeILKQ5oqkpf0DGWl/Han6rOFV0EFbYEyeNAdZ4EIn99opb2bzfuw3VYKXYrPfaBg0rntquA7F84/G2nYPK9TWaxahvaZXTut7FlyiD4SDGVNmDeac/40j+zJb6GCQTAVGPXgxpXohum2/tAp4QyAC2SH4ZF3NORpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YiJJ9QQP; arc=fail smtp.client-ip=52.101.193.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI9XpWweBIDASYKg9xTAr7ptFnBriyI4dQ46v2aAX7MAofn+0pjRPaZv2ZR6XLr4Vx/muEXJN9ujlJt5ojZfYwQpIH+9KZmUhFHIkJjApA2YH1saRrn/UZ3vIR2ipCc8XzwYVXzl0mLMTkQ2UOj97hBKtmYdWHxjvsVCLJ/Mf8G+VO+DjbZpGSnXxbdnop83zVBJFlMZ+dmKbNWagwOZ+gwstEm2pgowsnRYnqhT0eS3m43DgD0uJiRjsV0LHF/bhARCpc6m2cJ28RwUr3/dvflEV9+t4zENh444bm4gLiy0ZJQam2E1dqHcfMhOXteZ1JSKLJKwjxhlsN3lw90FpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfmZ49YkrJp2RA+mpIJf76ercy5n0yzNabP76sJRGzM=;
 b=WkUjmlEcTTKODJtWtDehmexly4PBVkIrYT3Gqb0Kahof7FIs2CgkoHwVGXHWwWGalSyg3OEY7C8KIt3fOSPnknTYo02J2RLdyyqnTAzfeqASQjlwdezg2lFLo8evOJ9nsn2gVvOjJifCxLnZK0pXvQO/41CjtMCZqoQkUR5NHg9+jAeefXNgpoz5YZzXJgNdzJXVRdk2yO6CGS7eBI3dQkTKlCm7x0Igyhl5JVomkAamqMqKjBlnSsOwP2rSCw/fef0s1LXeSRe4qL4qTiTGt7SeXti246GDhTJXz7yI8seAVNRN3B/37ed9zrC686Y/evSzpJtP26/gonafm3XU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfmZ49YkrJp2RA+mpIJf76ercy5n0yzNabP76sJRGzM=;
 b=YiJJ9QQPTETJ7fcVWwKo1mKLF75x+HUCuRBdBFLz1siaMqhwe9zE907x8ylkJyNfl0z91hSaAZwaQdIB2jRiRR5T/xMl7L+wXHqfrkUxUYe/OpnMKrONSgjEyp30u5lh/ysvor+TXXeRcFyyaNox69iIz5CcTdSLVOVXpOl/1LVAIk8CCsLXWHcFAdTm5EV4yJPk2fjfu4YGluCtjtMeliZxUhnSwVdZeB99xqKZD8dRnRBzoHXJ06HAs4iK/rS1lGBM25od1eo92JdI/PUsVEFhJ9Y03l/vvsA312qwzm4Drr7JvbeQLLkmldW3OhU8SiwodxdsDUwHxVdgTpvfXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 22:13:04 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 22:13:03 +0000
Message-ID: <931207bd-a24e-46a5-b0e5-eb5307c5c8bb@nvidia.com>
Date: Mon, 19 Jan 2026 22:12:59 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: gpio: Add Tegra264 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, robh@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260114103846.687338-1-pshete@nvidia.com>
 <20260115-tactful-porcupine-of-felicity-ead58d@quoll>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260115-tactful-porcupine-of-felicity-ead58d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0029.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::17)
 To DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MW4PR12MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fdee161-2834-47c1-4468-08de57a7ea4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVFwKzJWTDNVNEU2S01ldzNWYlcvWWsxMEtzbkYxZVUwcnh5c1pTbU10Ry94?=
 =?utf-8?B?cGJadVNKay9BZzcvZzM5QUhkSnJEcUFXODNJS3plMW5ETjJVeWs1aUwzWnlC?=
 =?utf-8?B?NnZmU2c5UU1oV21RL1RJMTNKNG53L2thZlNBVU9JekRlN1ZXV3BhOFZjWFBs?=
 =?utf-8?B?dFFYQWZ1TUQwYVNmN3I5YjhmR2RsR0hYYmg0NC9VNm8xOXdVRFBnNnhCdmpN?=
 =?utf-8?B?QVlSR21pd1hKbDF3Z1Q1RW0zQWk5MnhKT3lDcjB5b0grOUoxYVptZURBcWdQ?=
 =?utf-8?B?R0ZZL2FPcHM5UFpDSzRPTGhiZE9vN29VUGhRVG9QZXl0UXlXdUE1aktaN3Iy?=
 =?utf-8?B?TklPa2ZtM0pjWDZHVTNvZWZRR2c1VTRoSDFtUlR4MUtaakxEb1BZSFNTOXFJ?=
 =?utf-8?B?QXh0bFE4dUV2L2FiQVV6ZE1GRTBXSW1QSUVleUlsbEVWSGQweDU1OGtic3Nk?=
 =?utf-8?B?SnJuSitDM2VPcmlzWU9PMXdKNWcyclRsVnVXTmpjWjhFQjBEOFJjdFQ0TXp3?=
 =?utf-8?B?am5FVlZESU5JeWJ1M1RKVWRPUkRuZUlOc2x2ekk4aUhIZkd2V0dhZTJIVENS?=
 =?utf-8?B?VFpVdHNNSHRaN0dkYjJNNjVIajIzT1BYQUp6a2t5bGZFOXlkM3J6NnFYSTQy?=
 =?utf-8?B?QWUvRW1QM1BjaktPd05nYmRSVk1UdkR4U2Q5R1BwY2ZTbTFOdDY2dmRxWGIv?=
 =?utf-8?B?N2I1ODc4eUNuVEljS0ZydzhvYWFCblphdU9CRzkvV1lyU1lWa2srVEw4aDBo?=
 =?utf-8?B?V053ZDNMSTVLRjVhcFg5aG5IVDFkV2taOVRRNFNuWStUYUs3dkhsWDMvblNl?=
 =?utf-8?B?bGVaTjBMYitnM00zUlg1Y2trMUdYWWhCYVdyS1dkS2pCRlJBcDN4b21IMXZs?=
 =?utf-8?B?bTlxTVVsU0lMWVRta3BraHo5WnVTMkt4NE1UU1lpazNVNkw1eVpXbVpKZ1c0?=
 =?utf-8?B?RDNXMmZkNTNDaE9TemlGNHNLdTNvQTFaWVBmUTJuSU5FaTVPa2sycVhoSVcv?=
 =?utf-8?B?Tytud1UvL2h4Tm1Uby8yYXc5bWVNZG5EN3lxMkhXV2NGai8yQk5mYTloR2V5?=
 =?utf-8?B?VmxTZFdNVlhwVHQ5U3pmUkkvSkh1eCtmYUtKd0xpczZ6amk2MmliNElrdTV4?=
 =?utf-8?B?NGRYd3o3OFU4anJEZ3Z4eWYvNks2Q3NCb2dqdmhpY2Z3azNSRmZ4ZVkrZG01?=
 =?utf-8?B?cUpUWDdZU3h3OG15OEtWN2IzS3ovNDFvUVhVS1RUZGg1bWtuNTVlMVdpWnkx?=
 =?utf-8?B?K1pJQ3dVYVdxSzJjb2hYVWRGZ0NiQnJSYWdVQURiRnhIZnVVV0hVaXRsWVNF?=
 =?utf-8?B?Z0M3VjA0VzZvWTNsMUhscGpaZWtSdTBSOU5kMHJLRFBwMmFuQ29aQWd1L3N1?=
 =?utf-8?B?eWtPMlZHV3dqZEx4cmJPSG56V1dubkFNbFp1ZWNrbFh0UlhIR05pTzNZY2JF?=
 =?utf-8?B?U0l1R21rVmRSanVYcnhxb0wvQkF4bUJJdVdDQTNxZXNrT01oZ3RtT3gwMzlF?=
 =?utf-8?B?OVNRZjdvbUtuYVNhbE13U2UzVVQrZGN0UlhnN2ttQkc4MEFHdXJYZkZMWUZH?=
 =?utf-8?B?M2NkWm14bHdmU01vaHN1SG93MUxWNno3WXI5Y0VadzRiSERDUjRNOUw4QXZj?=
 =?utf-8?B?Szg3U1lNRERKaFhBRmxXcllKL2J4Q3pTbjZJSUE5LzRrNFJXdDRqMy84S3p4?=
 =?utf-8?B?QWFCU1JrQzh6aUxpUDF0NzRhL2tQZzJZM1ZqbXNkMWRZamtDWUc1MEM4MFhV?=
 =?utf-8?B?b0w4Z3ZVVGIyRHA1dStpV0twNXcxMGNJT1ZMajl6ZWRJMmNPaWM3RU9acDBv?=
 =?utf-8?B?ZHVWUklMMmc2clkxZzdWSEtmWHRLMjhNdTZncFJVTUgyZkQra21tSTVIckt1?=
 =?utf-8?B?cWxPcGtXRmNYR0hOOUpMTnpmaXpkK3dvb25SRWIzNjBITVVhRW1KeDB6N1k5?=
 =?utf-8?B?bk9oOE9lc0VhMGhBYkt4UFVOTU9UQlRmcExuMm5VS2w3WTY0UjdMenR5RjFP?=
 =?utf-8?B?eCtlRVQwVTQwbkNQM01IVW90UVltVGlHTXRnNUZoaVFDV01HNkZZSEJEQVVX?=
 =?utf-8?B?L1FSR0wydmpEclBlT0NLRHhHMllyQ0F0TlpJTGJRTWcxcGYvbHVhdHFYUVNr?=
 =?utf-8?Q?uh68=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE10TjBSdnJHV0lKYWlSNkZaT0RMcFlRbXB3ZlQ5L0lhTHlNVkZYUnc3Nzg4?=
 =?utf-8?B?eTdCQzN2R21SVGxXTFh0VjVmc09taW81VkEvWkNwRUJIS1ZQdmY0MkhMN3hh?=
 =?utf-8?B?aXVmYm4zMnhFTjRMZzc2VThxWDRINGlXTzl3L0RzaFBUZzh0MkV2SkJRQmww?=
 =?utf-8?B?QVpNOWN5WVpOUnA0R2JqbHdWQkdJNVJiUzZvWG81SG9aMXl6eTVENFhmU2l6?=
 =?utf-8?B?RDhncmh1RFNyYWtTTVBSaDBXbk1qakNFV3ZMazBFTndXR0tRZUxSalRGMnFR?=
 =?utf-8?B?MnVXT04veGVmT1J2Uk9Gb05IRVNCcFVYRW5MUERjcitHTmJaUHBaNk9obFd1?=
 =?utf-8?B?Yzk3bXB5NXBuUzQra1d3d0JLeUZLZEV0U2FOMStHZkVHRy9UdDRFR2JidkZm?=
 =?utf-8?B?U01XUnF6RkJJMjB0QjZvTFVZV0hsWXpVVzExVjdTNnA5UWwzL3VkN0V0bnBr?=
 =?utf-8?B?K0lURzRaOXdwNFJ3NXJJWGhPUW5oamFQMHkrRFR0OTNHaVpnVHpaRmVmQTE4?=
 =?utf-8?B?LzJNMm5KQnBJZjJBTDV6UGtGTmt4WXlveVlIdVM0Q1BCREJLeU96dUdBZG4r?=
 =?utf-8?B?bDlKQnlPeWc0aklQaVpleFgrWC9SZ3NvVmxpOUJTejB2SnMxRVlxQm52NTha?=
 =?utf-8?B?M0VVcC9Ydk8xMjdNbjFGRE5iUUlVZHQ0TGhUcTZ0WkJVQkkrVjR4WGVDcERU?=
 =?utf-8?B?Rkoyc2pwT2RnQzBaWDh2VmFuTWdTQUJYZkZ1MDdrd3p2L0c5Zk16V212MEFD?=
 =?utf-8?B?RDA3NklpVU5MalgxSHRPRFhiaElWZzErWDZlTGJUWUwySDFSTWVOc1hVUm05?=
 =?utf-8?B?U0xFM2IvM0dwSHgzc3NlRXVqdkhRMXVQU3lPbldnZ2M4b1l1MHZoTlFyRHRq?=
 =?utf-8?B?WXhFeHFpZExHaGtLWk9qQVFKMFNnKzFiTlVaZVNoN2owZVliZStQU3dvZzdO?=
 =?utf-8?B?UFh1RlhpN2xPY1htaE41SmRTNi9CRlZpcEJ3U3E3WmdMUjRXcGFYRU9CZFV3?=
 =?utf-8?B?cS83SncwZXlrbjFsT2tmcm4zRWhVWEVGcDBrYWs3Nzl3NlZjWjd0V1pVZEdq?=
 =?utf-8?B?VHU4YUo0VGZFdzVTVWxSNko4Ny9rVTlUanN3ZjBjMVlDc1MrdGhaWGJEVklx?=
 =?utf-8?B?MVVmMVR1T1hQNWliTGljbzB2TTZ3TUd2S0kvM0JqUHR1bExXM2tjdDV3RW5Z?=
 =?utf-8?B?L2xDZmg2WjJtN01TRFVMeW1xQmJpQmdNSFFtdzR0Q09pUTBTMWU1Q2l1b082?=
 =?utf-8?B?bUp4dmUwaTNNMXNHMk4vVkl3bEk5UlNnMGkvWmIzNXJRU1ZBKzZNR0xrcHJ3?=
 =?utf-8?B?WUN6L3JMTlo0UkVscXVMZTQxRkxxRm5oMVY4bWpHQ0l1L2hITlZzS2JUV2xM?=
 =?utf-8?B?WjVocjJXUEUvWnFhejB4MXYyVXRkUm1xeVFScTNzeTdVcG5mOHV6ZEJiaDFv?=
 =?utf-8?B?bmovOEd1dFprakoxdXJLVFlxSVZBQU1zelZMbTVOa0xxSi8vV3Q4ZlZiVmh3?=
 =?utf-8?B?dlJ6bUJSWnRWODlFMHVVcTFXQ0g3NHd4Y0xSTFBtd3djTDU4WFRBSzBLMnow?=
 =?utf-8?B?aGtIWmozaHhpTkR6R1ZzUnFPM1RXVlNtd3BPL0NReG8vQ0N1S3RLRHBPNmZ4?=
 =?utf-8?B?Y3pvODMxa3l4bTdaSytpV2RBQ3lEclNsOFZRM093cXJrZzVlTGdJYW5OS0J0?=
 =?utf-8?B?SGdxUnBzR3VPMmZZSlFwL0liZEU3NTArbmI2ZTJkRys3azRpVU1iTHZENnJJ?=
 =?utf-8?B?VkpoOW1WOXZ1RFZRbHpnSmk0Rm8rbmlvd1RjT2xjdWxXTnBtVnc5ZVB0WnFQ?=
 =?utf-8?B?Q0tEbGppUkJuK1l3Rmw0RGU0ZE1HRlp1eSs1MUU1eVhDcndhS3hwTFMyT0RV?=
 =?utf-8?B?ZUVOZENJTVh6cHBaNnArRXRSSGRmTm0zbHZFbzRPMDdUdnhIM3MvNmJhbWY5?=
 =?utf-8?B?M1RsaUdpR2ZOdHI1OE4wc29RL2czSHNPK01jcnRvZnppekdOdU1HdHdQMWg4?=
 =?utf-8?B?a1RMK1JBOUNYaWduOWJ2Sk5iSUZEY25WWDY0alZxbGR6WkV0cGN6UGp6QjdK?=
 =?utf-8?B?YVN4cndWU1Q2VnNPcWVjUE9IaFJ3S3JNVk1hdDUzbTZkdURYZ2ljYzFCd2dZ?=
 =?utf-8?B?eE9Vc1RlSk9GclExTmR3N1M4TUk5N1pZd3lDcU9Gdit3V2VabDZGMVhENnFj?=
 =?utf-8?B?Mlh6QmQ5U2RVdXRjdDdCYkZ4anFXTlZ3WHU2R3lFRElyQXVvQ28zNjgrSEwy?=
 =?utf-8?B?QVVoaHZKN0d0V0htVWVTeXhXWXdiOHlGTmNtK2ZyU2o2Q2NxVytJVEVDOW1S?=
 =?utf-8?B?L1BOVm9EUGFQUFlweHBJNkJmY0NVbnJxK0hlSXh0ZStkWDdvcG9MS0ovWHNt?=
 =?utf-8?Q?cYEP360/pQYLNeV5qX5RpUGKgYhvXkSCvp58fWMfckn89?=
X-MS-Exchange-AntiSpam-MessageData-1: D9PKjh5J1AUkkw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdee161-2834-47c1-4468-08de57a7ea4e
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 22:13:03.7526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7ILMKxscl1ET5AUUVdooO2rHEGEM59q1d6FWSYNb6wcihLoM0yqPbnlc3HvOb3m10452TMAPuy8OLf7DHTTbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950


On 15/01/2026 13:29, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 10:38:44AM +0000, Prathamesh Shete wrote:
>> Extend the existing Tegra186 GPIO controller device tree bindings with
>> support for the GPIO controller found on Tegra264. The number of pins
>> is slightly different, but the programming model remains the same.
>>
>> Add a new header, include/dt-bindings/gpio/tegra264-gpio.h,
>> that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
>> both of which are used in conjunction to create a unique specifier
>> for each pin.
>>
>> Document nvidia,pmc property referencing the PMC node providing the
>> parent interrupt domain. GPIO driver uses this to select the correct
> 
> Why do you need to reference parent interrupt not via interrupts but
> custom phandle?

Good point. So for this specific case this is a wake-up parent and so 
would using the 'wakeup-parent' property be OK for this?

Jon

-- 
nvpublic



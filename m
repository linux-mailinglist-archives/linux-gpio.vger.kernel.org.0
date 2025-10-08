Return-Path: <linux-gpio+bounces-26882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F8ABC3853
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 08:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 197281899B77
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 06:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1436B2EBB88;
	Wed,  8 Oct 2025 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RJaVbIF/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6824A06;
	Wed,  8 Oct 2025 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759906461; cv=fail; b=VFSNL7XN1YwVbTbf5CEEy1DLiG23sh9E2/jkvqJqxNI4+m2bfSp5ZugSPHuoTTdM9vpzFUHLIg7RLydtnI6CDEJ8ek7GUl2C22pmfv6AC4MuFbf+d71tK6+yFOiRYaThPmP9b6GH/t6eXO/lfwPMtJ3ew7ycpVQ8WRRIY8xHuoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759906461; c=relaxed/simple;
	bh=cLHPsxWMFJH43i7nFF7WCs6PDI/nVULWMUEXxTDKReg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AjhUWY51Y18kL3wLIS0gihduNrRMuQybUjWo2TRPKy+P7csDwwyOJEoxt+3lVb8a17WTI7g1oUsinyAYE+35ifXz46fecFRMnDGxOHXAq1fWtyFcntwtuigDX2gGfkYcoaeKzdM3pL5guUtCK3KNTGARWpHvYRvs4hjcJeoDWjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RJaVbIF/; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3XkKFVps4HoLRB1FjR4OVvu3zDUuJFMuBWooL/YQSBJvzpql3B4XOsEzAVFJ2ujLIuBg53pscrEbnaTuBByXkes4JJGutll+FdrQsZfWKStzYVgDjUmUdZhY8Q3pwRYQ6jggGoxn+YbaY8DL0hXD/TMsLq7VjNh8ZBWLBqTk0ScVegIvc7zoYJKMpMMuKh99Q/GHE3FfxXz6EwbBqhrkO+FXCzb/A/08vVq1xU4evDFZPvaekR/4eRiqHBqCsyxbgyp31o0jZhpOywA0ISe1UVniWbAxNeyokUw6kpYBS9UF3L2IDluQoXqauLnPsUDYD99+wp4d5PwrACKTW2c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj/iNdE0VRsHoAy15jrmbB7Be+RCRBbAKDW2RypBamA=;
 b=PRd4UDj7ZRNMTObfjUgQr5a1JX4aGOFTdQB1xVUKOqsBN/Bg9NH4MgMM626bo27PzQzwIctusuywUNKke70mwTaL0OFkKydKl90z+yaBYc4Kz8n7sfaCNzxV0wqSV+dB8CaQeFEADrGyyUS9Ni+bkkVpkL6v2SPi6DPlTzjQBCjcUV3TMhKmVjlWwyRYT//k6x/S+Sgph5oHvVjAiqTvQSf8IXxTcjmKo/Ep3WFBbT1Kdk/50LXHq4WEgtUCm0S5ZPp+Meh02gAIk+MffQ856yvxz5UugLV3AR4gkHiT5WsG8sfiuCA/Faf9SLtOXFDIDOWfJ7/IWpHySjO35aGDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vj/iNdE0VRsHoAy15jrmbB7Be+RCRBbAKDW2RypBamA=;
 b=RJaVbIF/a1EIMdX6aOKR1Dc6Vqw8aUc6JvwNHYb0hkhpGsOgSkEPtWjPEE25dcEPUSwfxFxOebIvGjImbzQagkjKC7vzWJDkPjQ1YP4Ov09N/mBbT7d1a+BoZMxVegSOhfWE4rhdIT4hE2UCrL7OnXTg1WE7+23jzNP/YRuUptGKmDX30M1dPJIDEIQxPCM6y3vmrl48UoxCoBaf0rb6xUKtFYKAORAj25FqOz2rFQImQ/SJ8na1QcObTJypXDO2XQlaJZcIkS/96P0vgMZKhMKBeuHTKo8Q7tB/akwkOJer9jZfPjoRHRt84nbCgjEuyaNPCrQJOSNmq+UhsOqfeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS0PR12MB9273.namprd12.prod.outlook.com (2603:10b6:8:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 06:54:11 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 06:54:11 +0000
Message-ID: <85b5578b-389b-471e-b51c-da9a522175b1@nvidia.com>
Date: Wed, 8 Oct 2025 12:23:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra410 support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Conor Dooley <conor@kernel.org>, linus.walleij@linaro.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
References: <20250919093627.605059-1-kkartik@nvidia.com>
 <20250919-undusted-distrust-ff5e2f25cdd5@spud>
 <f6c001af-bfaa-4d1a-8c32-1e2889e78650@nvidia.com>
 <CAMRc=Mee9JvcOCAqQxcCMBE7gUQWvZaM=wDAfyKTG5bKyZeHTA@mail.gmail.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <CAMRc=Mee9JvcOCAqQxcCMBE7gUQWvZaM=wDAfyKTG5bKyZeHTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::16) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|DS0PR12MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b93ff7d-a6c6-49fc-a3bb-08de06377c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVZOMFQ2VTBKZHFlb3NRWVFLeE1rTWp4ZHA5TjRaRUtWMlV5eElrZUVWYzN2?=
 =?utf-8?B?OTdzOXB6cGdRazhoT2tFSWxkZDQ5aEhNcXo4SGFIRTAyWGFlZ0pvWi9vaUxs?=
 =?utf-8?B?aWEvMlhwTlUwL040QUVyUEJnbFRIY1F0c1B1dGVGRHlQLyt0RUlpUm9nWEFL?=
 =?utf-8?B?dzBhUVFGdWpiS0xDVjFteEFBNGRkSm5EVUJZeU1xUnpWVHhUNnN5MlZpWGNJ?=
 =?utf-8?B?OWZiU0N1QkhCOGZpeXl1YmxTZWxTWnh3dkJTNTBQeHgxTXRud2NjZUEra2ph?=
 =?utf-8?B?SEcxQ2pLdFJKRjI2UVlUQlZkQWYxaW9YNHRPajZkUHVKNzFFL0ZPelVoamFq?=
 =?utf-8?B?VmJPMDdzbUh5RkdBMk9IVGJGbmc2M2VxaERLZG9NUGx1cWlWNUdYeGdBRHBF?=
 =?utf-8?B?eVo2QlRvZVFNQ0F4WEU2ZVZzUHBrVXhSYXlscWZ3TWg2bDlOSVl3V2xZbG5X?=
 =?utf-8?B?N3duOU1pTjdsMUJhdW9wN3ZvdklDSFdZb1YzaEVqdDFrTS9HT0NGVEN0UktO?=
 =?utf-8?B?WEI2Ti96QkVkeHdueTY2Q1ppd3dtWWltY3F6MW5zN1RKUnlhbm1BNlJSUHU2?=
 =?utf-8?B?bTVFS0craFQ1TnJ5QTZpSktVVmdndmlqSmVYVG50UmIxS0I2azQrdXhFVWZ6?=
 =?utf-8?B?RXpqbEFIeVpnUGxlY0JuNnFFUXhLekVyN1ZiR0hUUU9OREY4Ykc1ZGhiQlRt?=
 =?utf-8?B?Y0F3eFZ5NWhBUi95eDJYMFdwL1ZDZVc1Qjg4dHBYcmFhZ0VkMC9UUXpFbUx6?=
 =?utf-8?B?Nm15Sm1iVWMxY0xZQ1Y4SFRrZmJnaWd0VEZaRjNuT0IyRnlETk5BUytiemR1?=
 =?utf-8?B?OUhkSlNCSHpuVGt4Ynk5TVB2N2JoclNYZHcyY1RlUnpEZHo2RjZYdXBPb2Y4?=
 =?utf-8?B?ZXNEUm1ERUEreWNHWndTajJYYUJ0ZC8zd0NNc256eUQ2Zis3bmpOQWxBemlV?=
 =?utf-8?B?TXNPcmc1ekJIV2U0T3ZNTU53WW5ZNGtsZTJKTXVuRnBvakoybGZuaUUxeENC?=
 =?utf-8?B?eTRObURmdmJja3BGT0VBdVhaYXJyOGpwekhNUXhHRXFmOHJTQmRpK05tNU1x?=
 =?utf-8?B?OWpjUG1QRFVMVHBSQjZKSFo3NlZISjFRSlFqby9jaERnQ1Q3MGJtRVhMcUJT?=
 =?utf-8?B?SGR0Q0V1OUhYS2NhU3dpOUhZRFp4c2dhbHFSZVl2TUtyeXU3UFFZaTBjL2Rh?=
 =?utf-8?B?MDMrQXZRNmtSbE83d2hVZWJmbXpneFo5endYR2prWk5MT0grQUt3c0piaGZU?=
 =?utf-8?B?MDJUK3JQUVVDaVQxei8yd0FjbGcvZjNFZGRweFhBWWErV2dIOTY0ajErWnht?=
 =?utf-8?B?OXJtUXZKUHdiTW01bWZuVUNuMUpQaHFuZnpYb2gvZkhwWmxLUkJ3N2V6SVY2?=
 =?utf-8?B?cjhuQzVwOHRzUkZvdzFSY3g3bk9OVWlVdDRLbVJuOUNxQlN0RGtJeWc1OHBa?=
 =?utf-8?B?RjB2cmlWYURoMkMvS0pkRHpwOVYxdmN6TkErdDIzYlB1ellyaHN4VHMxNW5E?=
 =?utf-8?B?VHR1YzlmbTRKaDVsRVhBM3VqVTRIcEQzTStaWGRuQ2VkZGl4dzBlcU1qbHRJ?=
 =?utf-8?B?UVg2NVM5bk5uZ01MN0UwaXg4b3N4SFVGM0REWnRna25SWGwvVmRLckJaUngz?=
 =?utf-8?B?Z0JzZkwyZ0tsR3huOFViMTBxZGtxK29TNzAyTnJEY0hwUWlJaFplenhTUHB0?=
 =?utf-8?B?Ym1zUWt2OVIzNGRTeDRUeUFyNXk5cnQ5OGU0NXdKMWo0aldCT0ROOGppV3Q2?=
 =?utf-8?B?Q2tKTHhNcWlnNFBRajMyUUJybmJXQVptV0c3aEljdjZra2FsRUVqQm5Hci91?=
 =?utf-8?B?ZFc3RHNiVTFEQy9SdTFqOE5GaFpkL0dTcDl6ckZ0SGhVZ1ZnS2RyNjZiR2J4?=
 =?utf-8?B?enRjSnFKTVNhZVBBYUVCQkh2OEhCNGU0aGUyeFVWWmZXRGhXZmJIbkdqc2tW?=
 =?utf-8?Q?5dlXTUkYLAQCWD4u13mcJgJAzzdH2lYe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUliQXhmWWpmaG8xajNkajZ0RHA0eEVVU21tSWZicm5xRmMrSWJ2amhlR3Jj?=
 =?utf-8?B?YnBSS2ZHM3dhaFdrUkdIYUVaUktXd0lLd1lTL2tmamV0QzRqSFZnYWF1S25O?=
 =?utf-8?B?VUttM1FPVFZ2c29CSkFqUjdZcXh0MHhzVUFPK2Jsak4xVkt2MGorK2drNTNn?=
 =?utf-8?B?V01tcWtYVnpoUCtWK0c1RnZnTVVLYnVxeTZqMFBuMlJDRXZMb2dZdkpsamxw?=
 =?utf-8?B?VGFWZTV1VEg1NmRzUXJaZUtmZkZIbFMwMk9BaExPN3FYT1NQTkxvcGRpc3pT?=
 =?utf-8?B?RFRCRFIvNE0yakIwZ1g0UERxVkJHQ2ZpZndDbFFJL2daQm9mOWdwVS9CYUlT?=
 =?utf-8?B?YTBtK1pLNlgzMnlsRlIrOUJvbEpRU1lFdnJ0enZVbDUreDc1MmE0bDM4ZlQw?=
 =?utf-8?B?bHppWG9odmNlY3JxREdTUHRYRU5tVmFTWExxS1NEaGlHampHMlB0cGdaVHJo?=
 =?utf-8?B?b0txc0ZYcTZJK1VGajNWczgyQTI2SGVJZzlNSUkwMDJzb20vRHkyeFF5dmw3?=
 =?utf-8?B?ZFgxUVFnTURnTldwNENaaGMrWXJEUjBkNExUQm8yb29jS1FyVGZzSFA5ajM2?=
 =?utf-8?B?OXpkNnZXUGlBVlF3VFB4SVkyWnFMZmNMbHJjMkRZQ0I2a01mNnA1ZUNHS2pu?=
 =?utf-8?B?UmJ2YzVnVmhoTUFUK3VTTXJWM1R5TnN4SXBIUWZtek4xYkVRUk1XaWNPdEdv?=
 =?utf-8?B?eTE2S1FQNXhhbS9oTFFVd1E3MnlqVmEzRUEyV2pkQzBBZHpDajNob2ZEU3lH?=
 =?utf-8?B?MXlqMDJYd2xxQzdLemNzaFV5cHhNS0JpNW9ZNmtrVkFrR0dFTmM5dXJiaVA5?=
 =?utf-8?B?dzgvVkc1aWhBNHNGZ0JyMnFkVVVxVkE5aFpoZjB4MEgxYUlBc0tUQ3VRVnls?=
 =?utf-8?B?dDU0cURJQ3VqRnVOWmRQMG9CMDIyVnVRbm05RlFHWWphUENvenhrT3gyQjRa?=
 =?utf-8?B?b1VJN3ZTc240UHJqVk1KMEdReWZMekl4T0FwQW14dkg4eDErcWtUYWRySzlx?=
 =?utf-8?B?ZHZBWkhwZ0Y1a3Zla1RGRGNMSDZVTUxIWTJ0UTJkcWxaaktaa3RrTk8vYmtu?=
 =?utf-8?B?S1UxUE8wR2dPYlhYOVJLdG9yOWJJejlPU2tFS0ROTndiakthbUNwV04rRUFD?=
 =?utf-8?B?TFVST1d4K2VzSWpPQ040MzJaUWNDUlJHTWcrbUJUd3pLakprRHFrSkNyd2Zt?=
 =?utf-8?B?eGdIenFDdjNNczBBbFJtc2k5aGlrVUk1YURtVUs1V2hvd2RULy84b0xwN01C?=
 =?utf-8?B?LzRiUDJBbC9ML3NGbE5kWDErQnIyTzlIeWcvZ1cwTnAxazVCajlVYlNJS2JY?=
 =?utf-8?B?eFhKYjV6MDNZeDlRRWNvN3B4aGZtYXNqQlIxTklkWnRmdm5vWHhrcWY2ekd4?=
 =?utf-8?B?WGxmRG5uMDVWajJIak8wRk9tTXUxM1FpdDc4N1p2di9xaTlkUjR5QUFYKzZ1?=
 =?utf-8?B?ak1OY3Joa29yTnNVK3UvUzNCR1BqMGFVOXRUVy8wc1B5dzFRYk1zZlA4SGpN?=
 =?utf-8?B?UHNuQWhLVWFDV1VQOUZnYVFtV2Q5K2lINjFiUkkyWGRpMzF5M0JMS3FQQjA1?=
 =?utf-8?B?UE5Hc0V2RDVZTGZpZDJ0Tk5jS1ZaVFpiYTU2aElPMmprRGlHd1h0Y0k2ODR5?=
 =?utf-8?B?SiswZ202SlptVVJYdGE2ekc4b2tzTWxqUkhPbzZZVVFQZk92S0l2YXVKeXVF?=
 =?utf-8?B?SjZ3THp5UlAyWWRJbGcrMjB0OVhNSlVmTFd2UzM0dG5lRTlsVGZmdXBFeWI0?=
 =?utf-8?B?Y0hQdG10WXU0ZHFrV3daYkdIUkVQSlk3VHhlNnRFOGE0T1ppb3RraDRYWGt3?=
 =?utf-8?B?cXJWU1c1bndaaE43QkgrM3JOQm1qS2lpS3BnQUI0WWtzbXJ2WW9Vc3JlMlpx?=
 =?utf-8?B?TEFmK1JHVXR1QXZxSlpuNnpYMHZOaXVrZyt5MTNCYnpvaElHTlJML2ZYR3ZW?=
 =?utf-8?B?V0o5VHZQaURqZENJM1E1bDFlUjU5bTVRZ2VvbElGMUJSbk1Zcm40bmVEK2Ft?=
 =?utf-8?B?b3V5OXlKS1BGS3FaUkxrMVRoeTc3T1NHWVV0ZFQxMDFwV2pHTTFsWVNxTkZu?=
 =?utf-8?B?dlVVZ0NLcEcvdE9SdmRlZUQrZHYwMDZpK05pclVoM0hGa212ajdLVzdoSzJ2?=
 =?utf-8?Q?LAcTwjLfCRdiC/WqoSpE1s6Mm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b93ff7d-a6c6-49fc-a3bb-08de06377c47
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 06:54:11.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLycwgva4pyfDIUsfUGjW4QH67GcoLhD8FH7t8VtS2A/kkhFQnFmeHpCqEK6nqlBR+XDWsOawBQ4TKFuz4mDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9273

On 29/09/25 19:11, Bartosz Golaszewski wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Mon, Sep 29, 2025 at 9:24 AM Kartik Rajput <kkartik@nvidia.com> wrote:
>>
>> Hi Conor,
>>
>> Thanks for reviewing the patch!
>>
>> On 19/09/25 22:44, Conor Dooley wrote:
>>> On Fri, Sep 19, 2025 at 03:06:26PM +0530, Kartik Rajput wrote:
>>>> From: Prathamesh Shete <pshete@nvidia.com>
>>>>
>>>> Add the port definitions for the main GPIO controller found on
>>>> Tegra410.
>>>>
>>>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>>>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>>>> ---
>>>
>>> Why are you modifying a binding header for devicetree when the driver
>>> only appear to grow acpi support?
>>>
>>
>> Although Tegra410 is ACPI-only and does not require a new compatible string,
>> we chose to add the GPIO port definitions to the DT binding header to stay
>> consistent with previous Tegra SoCs.
>>
>> Thanks,
>> Kartik
>>
> 
> Hi!
> 
> The kernel policy is not to add symbols nobody is using. Please drop them.
> 
> Bartosz

Thanks Bartosz,

I have dropped the dt binding header in v2 and moved these macros to the
driver source instead as it is the only user.

Regards,
Kartik


Return-Path: <linux-gpio+bounces-29090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6EC8A78E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F48F4EE51F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299FE306D3F;
	Wed, 26 Nov 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EQts0pBf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52745304994;
	Wed, 26 Nov 2025 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168706; cv=fail; b=ucbLLGGMiUDcjV0kkiVV59/RC29B24Q6rtS4jk3fEOMghKmK0SDbjXForOG6nJsJPIKGbYj+f/1YKXlSSHaMXgBFzung96b87LBpKfmjGlvy5gku3MLkWeAji8wVkd8nzPq2dlaphz9H9NyEiUwEmCNkMh+x4tCJwhSmU+rpIXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168706; c=relaxed/simple;
	bh=bxB/U48LdxOtT43KFRvPTKCHyzUv4tLfQGNeAaYqgH8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uN3cmRPHdTeV/685fGWt6E8MmuXY6gjYpsUdeD1clB0hXxhIn27tt2u3rY1yj0RUCVodS4bvcksBnQF7aMRSgeSj1LiqGRP4ZZY1EAy3vRJ2QDqKLYtndl1/ie3fXCEY91P5WsdOgdts6UnTAmBGz5RP8tovWC5Qk3aRU3kudIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EQts0pBf; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5iFxJi7MHtY29nATKjJxb191Pr1ajD1U47HVRsUoTBCXlvfNumchu3vGKI6ZJlMtkeiZevxDb2cZjdAbQvJ2bH3Hy/bTU3UZ6yd0artkp1YZsTIqQH1aBzw/XNDV0J6DoRIC4ZM3H6cv7qFG46qTvEDQxkpnLI4r8fpF0e8I6/bJ0NiWWzY9UhWYlxBZC8TX3nitb+/aRYiLx0pwomb5/8eOOmhGuLmNYD8cmuh8unviamWpn/yzlytxmclx4c1mAZ4wHxr2TPDIE2PZq7JvgMG0E4wibw3RFm+C6fY2FcWa6LAqqdzbbCYluQWN/Hki0XydMMC78c1oHPXS82cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgHRqwHjVO0eLkIISwyyRD+bZtFt+u2B4aHzDGuR56c=;
 b=E6dVdF4Qo1aGKici4h9myprwozwTgP1mHrWJ4O0eBgI0zMHy3GNX15yDr/vRRA6SbMsGAFjbaf5kZzdGsA65+nOvWG7MJgaP74Ek66B11YDA0jOYoU5Al5QIUWTdS1RN4WoiELikV32dA2V3Eh+srGthM8joSGcVfitM7EEMYhMtgVyO6b2Hck/QBdV6kv7mdcvPXmS9qnWV23wREYIqTBDXsD3U4nAPQvdNdebQjCMCvD6n9/cn8cIdIMDCIOuygMP3jksRtsCadsY9bIs6jFfc+0pTlRxGDYW980OJCW/9XOGPKOrxW2Z1j8KOV+SnfdQPzmwviN8Gw7sd5GhjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgHRqwHjVO0eLkIISwyyRD+bZtFt+u2B4aHzDGuR56c=;
 b=EQts0pBfbOjqx+twA/A1SXYaRQ/lKe6FumZnXn8VVJkreWfGvDB18mJ6RDghSCIXCoyklzx/zPbBfsuawKaIXbO4xTDeLo04wKq8yZXXIgECEvvxo95oX7alkABvkqlhY+pCOv20b42JxZ4FGAC+cSjcuLbV35zJ/PHGlwtlHY5uPS24p7pO1X/gEnbpNVQMFYqo8o247rorfp28Mse1SSDuWCnlUFxOm/e01xtZd+Bd/MWpv3YN5I4tkWBfU5QKMT+F2M/FL0Jh/5KiyAoBOHWHnq69abfGCfsqT4QTXVE2YzNPoo8r8CEDe/xKi83Q0zhbPpItzUaR84W4snc5dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 14:51:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 14:51:42 +0000
Message-ID: <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com>
Date: Wed, 26 Nov 2025 14:51:33 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: f31cccdb-fe6c-4f10-cdc2-08de2cfb4f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UW9oSmdQbEZHYjZ6anU4YW9hNHJXakpYWUhUcFE3YXRLVm52M0VWWTZXZE5P?=
 =?utf-8?B?SVgzY0xQcXBPcVpuTTFzMi9hTW1neGoxc3JuQWpGUnNodjBva01meGx6SmZY?=
 =?utf-8?B?TkxjTHlBaUpyWlBrRkdNd1dmempVaXZmWEtrZXNDQXpHdEZrZzZaSWtEQms1?=
 =?utf-8?B?dUh2andUYU54VWpvWWN3bkk0Yk5QZTZWRnA1TU96cmVKSUpLZkhuUFA1UmUw?=
 =?utf-8?B?UFpGS3U3NWt1WTB0ZUlxWURiVHhoaVBMUGhPOGFEay9xZzQ4UzExcHpVdU5W?=
 =?utf-8?B?T0NBb0dLOGsxc0tORWdEZHpwZEtpNDJVOVVkMUcvOXRSUXVpdzFUMWN5NkRG?=
 =?utf-8?B?WlNtYmxuZmtOVTdQMk9aS05mT09qenBNVUlnblZPNnFuOVJCdFdweXN0QW9V?=
 =?utf-8?B?ellaRUNmcVduRFNDN2wveHd3S0ZLOEVITVBjVStMcCtDb3dsd01OdHd4TTBG?=
 =?utf-8?B?MEpoYmQ2SERlMi9YYUxVSEt1eDh6R1NmS0pMazhLRUJHVzM1ak9hYTNEKzkv?=
 =?utf-8?B?TGcxd2VRampYLysvWUgrMHVOZDBpWWtPR1Q4YnhQZHFUZXFUWEMwUUp2RjVY?=
 =?utf-8?B?UHBKeDllMFlJd2s3cFBQWTlnL2lEN1dlay9MNUlobmJUWW5RRVhKWjM4UmxY?=
 =?utf-8?B?dnRaNHJsMSsvaHlYOUhsZ1FObnlPdEE5S3FpWUswalArM3pWeWd6M2YwUkxW?=
 =?utf-8?B?dUw0cGI2aDVQdC96QWhqem5pRTVOTnFBaE9lNDV1cHJ6VTlBQTEvTmNIRlVt?=
 =?utf-8?B?TlMwVEVRek0wT2VlTzNvQlpyZjRFRGlBM2k0MGRTS0x3TDVyV096WElYNlZq?=
 =?utf-8?B?OWFBclNlNWtHRjNlRmR6UEdFWlZWS3Vkcy84VkdsVFphWU43UVFNYWxZKzRs?=
 =?utf-8?B?Ymdlc2kyRFE5VG5WVnoyZG9iVzVTek9aV3l5OXk1NWRGeWowRHNZR1Y0aDhj?=
 =?utf-8?B?ZEVVeVZaeVlEMEJteXI2OXJOVmhubDlQZ1BIUWlMd2lKaVBJTHl3b3RDdDkr?=
 =?utf-8?B?Z1U0QWdCa3lISEg0SEhVMm82UW5DZS83NmU4eWdoRnBZNHZYU2gzYWhnSEhV?=
 =?utf-8?B?SEVhYTVndmJ0L2w3cGt1TkFCcFhFdW5qczE3bEhFV3ZnUk1CTXk4SXFjTjB3?=
 =?utf-8?B?QUszUUQ4UVlpMlhOVThwazVYRjNvN1hyVHkyNHh4d3lIaGYvYlVseWw2dzVp?=
 =?utf-8?B?enYrcUVXVnRZRDQvNjUrMG94QkhabXZBd1U3ZXYvMWNyd3JoL2JMR3Y4dTkr?=
 =?utf-8?B?Wi93UmFPRTVwQmNQSDF3UnhxOW4vN2Z4c2tjUTNjdDkybm5YMmc1bnRxZmxW?=
 =?utf-8?B?cnY2ZnJBWC81M25JN2lhWG5kOEc5WmMrbTFRQytDKy9SQXNpbjZJc2JTeVhZ?=
 =?utf-8?B?SThNcWRlUHNHaTd1R0ZuQVhjaEpPc0M3OWpib0RZdkZaaXN4ak91SDJReDhz?=
 =?utf-8?B?N3c5dUFhK2RiSHdFOEpaYzg2QXc1alNpL0dLd0svaXN2NzRHRXBWUUVsZ2Iz?=
 =?utf-8?B?OGp1aG9FM1h0dGE1UEU4Ni9WaFNDQnJHdjNiWWVMTUpnbmVaSkxDUjFhSTBP?=
 =?utf-8?B?Rnc5YUZxQnh1Lyt3SHFqZUdIRGpJMDcrbzVHWHRDNTJlRGdzUDByMGVDMWJo?=
 =?utf-8?B?RytMbDhTRzMrRlJWd0U2Q09zUXYzM29mOTlKdFNpQWFkOWlYTmlwN21zRngr?=
 =?utf-8?B?RHlFc256T1pMb09VQXlJaVM4dGl5N2tLTVdNMDZjZExMTUJaQXY2ejhacUYr?=
 =?utf-8?B?My9HMUhsRDNrc0x6RFMvUnlZMTRWU0RpdzZqSTRSWHhxelFWR3Zzejlma3pr?=
 =?utf-8?B?QUkwZ3RtRGV3clBSRUxGTmMya2xieEZwWE1WOERLT1EvK1ZqdFhhaG94NGpB?=
 =?utf-8?B?WnpkY3RxOXNBYi9FYTF5TEFNZ09DcnRrTThOcllQVWFZdklINXhVMXlmR1pj?=
 =?utf-8?Q?aCYQZGgAXdhLhUqi7EwROlWxZTCK1gPr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmw0d2V5ckg2UmpveFY1dGN5Yk1nbEtHL254M2ozWXdVc3QwUVhnSTVqNndX?=
 =?utf-8?B?OFBOK0VLd2pMUERhTTNRR3pGcWdxUGphS2krc1krajBTL0RjWkpEa2Y2bmsx?=
 =?utf-8?B?Z3AweVVXcTB4NDAwQjVDUVRNYkI0amtlSkpZLy9aTjhBN1FrSmVxT0lXYmxC?=
 =?utf-8?B?TU1hUFk4eGFNKzV3NnVhNFpCK3FwckVxV3lKeC9WZWo2QTJYQVRwZHJsblNE?=
 =?utf-8?B?eTFiNU5yK1hpNW1FRG9JcHFBTFdwRU1KWWplVHpBdys3WkFybk4yZVZMMklN?=
 =?utf-8?B?NXUxdldLSldla0xTRGVibThtN0IyeklxVnpBckYzV3dVZkRuWThXUGEyNVhX?=
 =?utf-8?B?MmpoTHlkTEhlSDluUTVwNkt6VE1vSzZ0bGdLSExJMW9kR0diNXRwSmpFNEdi?=
 =?utf-8?B?VnlJT1VHc3A0MWhVTTl3Q0g1NzZwZ1RhNnd3YVJuV1YrblhMdXVCMktVZFlY?=
 =?utf-8?B?YzRaSFZPSnZ6eUQ2V092Vkx3a0dPblVHS2hCTlhSWmRMdlkvYnN5N21ZRlBS?=
 =?utf-8?B?SGV1THo3d1V1bFZGbkphem1YMXpvbHdra3MwRUVWZlhZOTlzbkVRc1o2dUh3?=
 =?utf-8?B?MllwbjdwT25pQ0k4WjFWeE5rQVF3dFJhK21XYklld0l0LzhSOHN1V0JOcTVw?=
 =?utf-8?B?S0VvcCtHNTR4cVNsMXM1UzFLb3NRanBhdjBndEJEVElwRjJ4NmlyRnN0R2lC?=
 =?utf-8?B?cjFRd29tUzhuS1FXSHBMTGNMRmkzTFVBMG5LMk56V1ZZRCs4Y1k5cTNndWZv?=
 =?utf-8?B?blo2cTZIbWVpSG1SeWYxMjhncy9JY09uSmw2enV3TUZ0aVk0aGtkZTNyenVi?=
 =?utf-8?B?M0xIWDJPbEJtRzY2NlltbFRTbFNKa01IcVhJM24rQVd4Q2VVRGJaQ2ZLcm9Z?=
 =?utf-8?B?cE1vajQweWVvcHBTWUF4UTJ1K2c1eFNIUk1za0ovQ2lhWnowUVlGdlZTOG4z?=
 =?utf-8?B?Vm8wU1p4di84VzQ3SkQ3MVdDb1hWVW5wb25lejkzMStnaGtQRVNiODEyNzl0?=
 =?utf-8?B?T3MwRkJNcW1jTGhUSk10SmtaUU1QMWFOU2l2OVRjOUpWOW1ISm1WaHQvU0NH?=
 =?utf-8?B?aXFsaW80c1REMFpEYXlmT3pmZDVVd3BpcDVsd0RyTkM5bCtyZitxdzNuMHNu?=
 =?utf-8?B?SXZLY0VLOWQwUUJ5WUk1VUF2TmpNYVpVdlZoTGl2VVkwWjQ2bU9FcU5mdW1o?=
 =?utf-8?B?Z0paZG81V1ZYSUt3UWFQVjB4TW9pMVQvVEpWcytTODkxalhqSmc0cFNZT2RC?=
 =?utf-8?B?ZXJ0Ni85Z0hBTE5odGJ6ek5tTTFubmpvNVlVcmZJLzM4dmlzVWFyZEVsd3Br?=
 =?utf-8?B?bCtsMDRhUklHY2NqK2piRlU2TG5xc1g2WjJVYXQ0YitCWWpXaGxibjZHMjNE?=
 =?utf-8?B?S25xSTgxSU5welp1RVlTVVRFSi91VlgxOW03NW9IcVhFVnNPb0ZseWpLMWx6?=
 =?utf-8?B?ZjlacC9ZQlFRclYyaXRJMTlhZGhBUUFPeU1LTWthV2hFWSs2MFp5NTVQWW1X?=
 =?utf-8?B?NlRXZlN2TTMvWTd0WmNtVDhBV241R2tLR3dkMjZ2NWhQNjYzeXl6ZDI5dStt?=
 =?utf-8?B?b2tmc0hKTFJ4SkhSSzVBazl4UHRIVXBIc1ZUNG1NajNrMURsVGlKRmFCeXFv?=
 =?utf-8?B?aFRtZVh4VTBTbVRGRnZkNDNONGhycWJGKzdTZ2ZqNWhSZVVMZjNFL1JCd0tH?=
 =?utf-8?B?ai83dWUzUVVQRzlPbVhwd2pHaFd3NmxPdHdsR3dyYW9Mdys0UEJqS1hyTnRv?=
 =?utf-8?B?UFVSUnlsZ2pscnBzbEVCV1pyRmtRUGlUdG9aN3Qwcm1HM1NyK2R6QzErUDJv?=
 =?utf-8?B?TUNjREhkMEdEcUtlOFZCUkphSm5Mb0doUFNEZWp6L2gvVmJxcHBLNG01MjAr?=
 =?utf-8?B?Z0hIZ0pBWHVuVlRBbHJveTBnNjlFalVidjNZYWJ6L25kVW1DNDNvdlJDTU1E?=
 =?utf-8?B?NklXbDhWS2ozRm5wVXlLR3Z4Njc5cHJ3Rnhwdzdxem4wUm1teFVVTjdhL05Z?=
 =?utf-8?B?alBQVVlOWjlybXo4ZUdGTVI1WWFEdHB5dW1UZnd6ZWpVWXd4cVV3ZlRyclUv?=
 =?utf-8?B?RGdlRytLYXMwWURVb0duaHNDZm5scDBTVXpZMDQ5S3VVRGtrWDY1ejNjcm1x?=
 =?utf-8?B?TVp2V1J4dFRHaGJINTA4NitGdmtNamtQVzdpNEp0OENLRmZDdlp1cTlRNFR1?=
 =?utf-8?Q?uY0iVzSyHSI3yYD55ce+IFYxVVEAxBMPGIY+SiFNthMh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31cccdb-fe6c-4f10-cdc2-08de2cfb4f8f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:51:41.9568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ypi0+2IA62gmzOMVyVXApU0ujcVuLEMVm5qXErH7wpvGrirXa08GadlmFUXXRoa0NOyNgBqh1XBjxBOn3RsvFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179


On 26/11/2025 14:28, Bartosz Golaszewski wrote:
> On Wed, Nov 26, 2025 at 3:24 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> Hi Bartosz,
>>
>> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Some qualcomm platforms use shared GPIOs. Enable support for them by
>>> selecting the Kconfig switch provided by GPIOLIB.
>>>
>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>    arch/arm64/Kconfig.platforms | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
>>> --- a/arch/arm64/Kconfig.platforms
>>> +++ b/arch/arm64/Kconfig.platforms
>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
>>>        select GPIOLIB
>>>        select PINCTRL
>>>        select HAVE_PWRCTRL if PCI
>>> +     select HAVE_SHARED_GPIOS
>>>        help
>>>          This enables support for the ARMv8 based Qualcomm chipsets.
>>>
>>
>> I have noticed the following kernel warning on our Tegra platforms ...
>>
>>    ERR KERN OF: /__symbols__: could not find phandle 794981747
>>
>> Bisect is pointing to this commit and reverting this does prevent it. I
>> am not sure if anyone else has seen this?
>>
> 
> I assume it comes from drivers/of/base.c:1295 - could you please post
> a stack trace of how you're getting there?

Yes looks like it does and I see ...

[    0.123356] OF: /__symbols__: could not find phandle 794981747
[    0.123401] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc7-next-20251126-00002-g1cd98992c487-dirty #19 PREEMPT
[    0.123418] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
[    0.123447] Call trace:
[    0.123453]  show_stack+0x18/0x24 (C)
[    0.123472]  dump_stack_lvl+0x74/0x8c
[    0.123487]  dump_stack+0x18/0x24
[    0.123518]  of_phandle_iterator_next+0x18c/0x1c4
[    0.123536]  of_count_phandle_with_args+0xa0/0xc8
[    0.123551]  gpio_shared_of_traverse+0xb8/0x47c
[    0.123566]  gpio_shared_of_traverse+0x158/0x47c
[    0.123578]  gpio_shared_init+0x110/0x1f0
[    0.123595]  do_one_initcall+0x7c/0x1c0
[    0.123607]  kernel_init_freeable+0x204/0x2e0
[    0.123622]  kernel_init+0x20/0x1d8
[    0.123637]  ret_from_fork+0x10/0x20

Thanks
Jon

-- 
nvpublic



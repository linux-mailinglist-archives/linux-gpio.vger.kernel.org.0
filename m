Return-Path: <linux-gpio+bounces-29082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E03C8A4F0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5F824E24F2
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D4C2FE570;
	Wed, 26 Nov 2025 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rqEsemur"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E0B258CDC;
	Wed, 26 Nov 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167055; cv=fail; b=AslGmDSns351+077WveGdIzrwvLkO5cna5MNa57mZPHGR9XPCNlJJUl5JBdxDfJC1RPm3xntT22ffKQeMlf16fLSW5gibiqtoUrkkHQZpW7LTbJWwh8XZixMie03LiQQMA+5vDbdmmQVCk1EvR3mq//1rsVybp9y0BDR4F+kikQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167055; c=relaxed/simple;
	bh=B3TpexM3zFHPQdawkFsh6Jbri8TZP6V5/GemYvAc15k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iXjieINkLs1ooJT9oTnnofjENTM/BdXmJv7Yed2oOu5gZKGOD2Rw5Rd7EAS+Z184K5rB1++hv3xVY7NOGkC3Dtk7IIkWiakKXM5wWtqRcTwZWUKIOE107rLjBlPLn8kp9Nuxq9gT3ooq9Rqdn/t5ocyf6AUzrhZOlV5qcy6IlHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rqEsemur; arc=fail smtp.client-ip=40.93.198.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+XAqY15hEcvENrNYerY4J9wFFJOyH9P7koBupWutvkMoIRYok4WJ9LHd1tH4/C2sUF9oWM86/maUGyhozyTCfVZfaqAoTRZNgUZu2fVO51ITedWcoVrb8oErJUjU384FsCNNyH/3vC1bpTzPOUfS3wRv/GgIBrojocmCk55jpy//Xt44JffUhibEf43wXPi225mp8TZEE0srdBb31w0kFBuRh44LTy4fuSnCyBfWOdVJCTZJmC4iEI39vPCkE9Q3z6pytshaUmxiKd6vNnXhp14XchVTDOTELJ/Wxz3RD3SgEsAbrCrJifYnSwfqwcaod1N/MbGXWN/y0e+XWHKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfSHgf1N1K9CZAN7sp47x+/xXwVsoot20GOBz6cdE5w=;
 b=r1g33ejZah2W1aow30bVx/jMQEupG1NQOvDLadPcMKTprmOgtSl9PWGkehP8s9LoL12h65EqvxYqKulsi2sJAIoe4dpQBzMaYwHHLlY/b++LKVKr9fqHOPYdJH8c5MYaL0el2XNazmf7h4Hav5WkG4K1FxnsudHDuvBrZjratT8SVdBYdjFyueQ3LnvvFU+Z3CW9svHPVAk6913GUwGjD5hemKathfGz49ffiJNZ4dMOLt7p8EGUL/gDLJ41wtjEb2j4y5XMxYJsBRIeC3d83QoLtMYkOxhXai2GfHZXmdpdFdw9oVKeyhJ/TZg6oG60hkk01TsbZzSAOREGx5QTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfSHgf1N1K9CZAN7sp47x+/xXwVsoot20GOBz6cdE5w=;
 b=rqEsemurCntALUbeYgsZvb63I/irbTlmEvpkQr8Hb/2424EQarPqV7V0htf7ic8h5qONgRg8GFRtgNYba2qlYXulToXhnDPbBB3SXnbYlANUGpSnSNPd1hIJKApa5+Hbq4VzUazyJ1xmOIG5P2xG005YSGitnXPGf+HGgJxOWhVxGcG82p7sINz3QQBKIKDqaMMxoVkKdWHEdnDMPevVZGWHgicnswe85mFHIpt4gwLEFkGvmRZ3UzFrvJ/2p2BFR1H3McRanNZx9n4p4MbroYgo/0RhJD4NyS0KCdTHeUxCnN++qutQ+ei2OurDllJB4F6FVIe601MyUUPSrmnZfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS4PR12MB9795.namprd12.prod.outlook.com (2603:10b6:8:29e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:24:11 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 14:24:11 +0000
Message-ID: <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
Date: Wed, 26 Nov 2025 14:24:02 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0577.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::21) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS4PR12MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ea447a-98e9-46b6-3868-08de2cf777db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2NEbGY1NFdCUnpZLzdHMkcrN1p4STVzYnV0RGV2RHNISTZtRUxUUWZvV09p?=
 =?utf-8?B?RE9qRS9hZ25wOHJiQzhjQmFsalQzMmhCci9TYnZvc0ZSeE9PbFpNZnFXb2tv?=
 =?utf-8?B?emJWcW5uQzRDTG1hMGRwQWdOZ0J0OTJoL0lidHZ2bVdRclNFUFJwZ0M5QkVa?=
 =?utf-8?B?TVVmQ1E4TkNFTm12eXRSTTJRTlIwci9jQ0tEZkc0NVNiVG1GY2Rhc2tJLzUw?=
 =?utf-8?B?amdBZkk3STVpWHBLZTVRQi9JTHdRcjN2eCtvc1c4Nm5vOENrVVlGRWpscXFY?=
 =?utf-8?B?U0Zhd0t4emRkRTlEMTZNejRyblhxaldTKzUwQ0VJc1gvVkV5REh2UFlRbGtQ?=
 =?utf-8?B?STIwR1BCN1IycXNWdC9HZUVZYkRGZGRjN2d6Q001U0JMK0h6dlNWMHF5bnBm?=
 =?utf-8?B?RnVQR2c2WUFLeElmV3kxcnI5TEpSU3dDSmp6SlFkQk8zWUpQVkNSR1FZaXRE?=
 =?utf-8?B?SkZPQU83S0pRNE1LS0xLS0Y3Tm9sMU9KMWg1b05jWG1vVkZUTUNyd04wTXp1?=
 =?utf-8?B?V2ltNXBmalljU0p5ek5YWU93ZUhOc2VsVGxWSE9DWEhUUHRCbWQ5dlM5V0xz?=
 =?utf-8?B?czg1Nkc4T0I0U1JjU2dySm03UkVmMmVrV2QwaUk4ZnFhOXhKQ3IrdnVoR2E0?=
 =?utf-8?B?WThkUUxOUGp1VGZKZ0VDVW5VZ1RUSm5WTkV1T3Y2bGVJL1c1aWdhSWJWeTBh?=
 =?utf-8?B?OUlqT1hwRSsxZ1ByTnBUQjZGaDMyaDMwM051S253aHpraVVuZGRIUVZZczNC?=
 =?utf-8?B?UEJkcHJZM0VmVVZ1UXRYZlV4SjBRSGhFZGI5Z2l4M1MzbnN3ZTR2azZnemJZ?=
 =?utf-8?B?WWhDZEdKMjhBOVNBb0VXQ3RYdWdhd2Z1NHpYTVBGa1RvL1hnNS9hV0Q5YldH?=
 =?utf-8?B?Qi83eE1RdVJBeFNmYVQxczNubXVTWVNlVURIVk81L1JINVZYaVdGSWhkZFVG?=
 =?utf-8?B?eUNCMmtTbXJlb1JXWlIvUGpmK0MvYW4wSjRqVGhpR0ZQN1VFc1ZRMUc3VkZB?=
 =?utf-8?B?bmNEYjkyOHNwTEQrRTJVSzg0SWRrTUc0bStZSDl6T0VXS3F5UC84b2tPMThU?=
 =?utf-8?B?aFNnVzhISmRvRXhiZGRKM2xOK0ZLMjVwTElKd1h6djNOTElSeExNOGxIUUl6?=
 =?utf-8?B?enZyQ2xHNWZQS1NZNDc5ZHIxMmd5MS95ejFUeElsRlVKZU9MNDdvK0RvaERM?=
 =?utf-8?B?Q2gvd3hrSGFDc05xMmZBaTRGZjNLWmk3UDhhUndnVVJZMGYrU2UzeE1ROFlK?=
 =?utf-8?B?a1FSaDhpL1hMb0hlSGxsSVIzNHRJcVdRWVlzWkVlOHU4eURwRWhkR1g1V29U?=
 =?utf-8?B?eGNRRFJFTndFQjkxenRNOCs3OUtHdk9QZDdidmpzMkpabmtkQjlublByRmZl?=
 =?utf-8?B?a2hTZ3hFN2FvK2MyR1VtdUd3aWNEWDlPMjJzN0c4N1Yxd1ZTY0UvN2ltNHlm?=
 =?utf-8?B?a0tVR2VRRTQ3a1JFQTJINVhHV2ZWSm9IeEtwNWE4VitXWGlWU0lPc2hMMXla?=
 =?utf-8?B?QlJXcGp4QWw2cDVvSWV3WXlNbE52Y3JadldRdHk2NTJ2bDZuS0hSV09WenRR?=
 =?utf-8?B?Nk5qQXNWUWFqZk0wMnB3MDYyNHR0R2RGcE4wcTB6WlNlampNYXF3NWxSRENE?=
 =?utf-8?B?dHVtbTRLVXN2SVBpdVVvMGNWY0RFR0hkNUpocXp3SkZRQ0twSCtKZ3FoMnFU?=
 =?utf-8?B?Q1plcHBBMXlyZUdSWjkvMkFEdHphUDFDS3RpK2tzZmxmdlAyckFabldHM1ND?=
 =?utf-8?B?QWMyYWM5S3IxVFJOcnRwcUY4bVRNU1VxWkg3VjREZUxwU2RQekpKTW5oTTBu?=
 =?utf-8?B?MDZHOC9sREN5UkhGcUFTWWZHZmdJdjVVVzJlUi9iV2VoQjdjQlBxV3NvNVU0?=
 =?utf-8?B?VXYrWWFTYXU4RS9JNlFZc3RJRzRNbkttMzhQZ0pmc2hoRTdUb0FhU3ljaW91?=
 =?utf-8?B?TFlYZm9JcEFScERIL2dwS3FkcFU5UFFyTWZDZ21ONWZiUFgxd3N4dm5YdzlB?=
 =?utf-8?Q?a0PkSKIVGERy7kcC4+tpoqtJX2Q4Lc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZExTTVhqR3E5ZWhxVEFOSkliMHdScUlqMnZmb1pzeWhjaXZsT0ZrY2RBbFR0?=
 =?utf-8?B?bVJpR3Y0Nm5SRHg1WXByUGlpM1kvSEdNdjZpM2tIZVdjcFNkSUJlYldNMGJK?=
 =?utf-8?B?d1RoTG1hRnBhMkxUMmZ6NEhJV1lHYzNWWGhwQXBzalpZVGYzVUdPL1IrWGNi?=
 =?utf-8?B?YjhqcXpjUjRZY1lkZXNtckRlS01Sb1BXVnBEUDNNRTYvTlRhb1M4NllGV0xW?=
 =?utf-8?B?RXBXR0tBakpsVXJLVy9FbkhsY0pKQlNQYzg3U0RFQVJMNmhZWE9aNWM0aWF4?=
 =?utf-8?B?NGtheDFWVUpYblEvWlBVK08yakNvZkhiZ3RIK1BuREVDZ3FhUnhXNXZja3ZX?=
 =?utf-8?B?RFFBM0dyRTJLQU14VzZ3OGJKNHcwUWNtWXRDSXlBSWdzeldwVkcxdVBJTnN4?=
 =?utf-8?B?L0dNU3dwelEvQzYyYmVNeFJyMEZxczBVdnBkU2NtNk85YVRsc0xCS1d1Y3N4?=
 =?utf-8?B?c1EzaFd0bVBjNHE3Y1dzOE9SUTdiL2JKY0E5Z2gwVDNMRHkxRWxNdXUwTTNF?=
 =?utf-8?B?aGdNSU9mTjRiTk95Zy9wMmNGOXhmak5vYTkrRjBiU3BYS21vUzFFdFF6U0Jj?=
 =?utf-8?B?VE5YakM2UHFZZnA4V29GZ0F2aDI4aE5GT1pzRlNDL25LTk45TDR0alRZMWxu?=
 =?utf-8?B?bjB5ZGlKczJsVEtNTmFCNEN2RjVZU1R0a2xaVzJHcDZPcEVudk5LTnRNS1hp?=
 =?utf-8?B?STJTU3FXSmtIWVovcG9RYmxnUGk5UG1JN0wzYjNmMHJOdmV6UUxYTmtRbGpY?=
 =?utf-8?B?RjZ4UzZRYWdnSjU3WlcxTmJ0MlJxZ28wZlIzNTNwQks0Yzk2NGFxSHRSVVZs?=
 =?utf-8?B?ZnJQdWMwYlg5UWsyejV3OW13alJDY2c4R3JFYXUxckpKbEIwT2lXREpyemdr?=
 =?utf-8?B?eVdLR0wySU1vRTl4T2x4eGhwdGd5cU9XVmNnVCtqb0VyaFdTbVg5TkE5VnlJ?=
 =?utf-8?B?SklzNUNZR0FjV25QU2JtUWJPY3NLM09xaFF0aU5QcnN6Y3hZMkJpakhBY1Qr?=
 =?utf-8?B?MVlHNDV1MVBnUGcwV1UzN0NFWHgwYms4VExFSjRYOWo3NlJNL0NEUzZrOVgr?=
 =?utf-8?B?SEI0SzJKaG9IbHB6RSs3WktOaXlSZ3ppcHc3Y0VNY3MxdzNER0QvYmtYQjVT?=
 =?utf-8?B?RHNISmNCMVZPanZNZ3RMaTJzclJBcEc3Vzd6NUduMnJDK1ludUl6bUZxa25E?=
 =?utf-8?B?YVVIWU11YUZNVmpOMVN3RlRCckgySGZhUGc4MTlHcmJKT05jbnVpb3k5QWJm?=
 =?utf-8?B?UGU0RTZRb0VxYWFSaXZnWk1nKzNRY3lxdmJuVWdBMkpTRWNjNVdNdlBRdDBB?=
 =?utf-8?B?dzRodGY2TTNCZXdhdHI2MTRzaDdFeXpQVU51cmZnbTFtaGJUZkFTeFNIQkk5?=
 =?utf-8?B?VEFVL3BQMnB0djdMMnZpY2tyUDlvbjB6a3JNT2lNOUowVy94L1BSK2pEaEE3?=
 =?utf-8?B?YUZyekxkUGhXcTBxRjBTaEVXbTF3bG84NTNzK0g3SzJ5M00wbzRwc2dKVTBk?=
 =?utf-8?B?WkZvUTFZY0NlNldYWVEvMTd5MVg5b1hvcEpzVHl0MXlPTGFlVnN5U2R3MWcv?=
 =?utf-8?B?S1NxZnJwMWQ0anZzamZFc3ZvaHJPb1BkYTFOOUh0SHJFc2ZOTm0xU3QwalM4?=
 =?utf-8?B?UTFVbTg0b1pSS09zdWZvWjJaWi9MOVVIdTdqQW8wY1RUWEswMDFNTXRiLzdJ?=
 =?utf-8?B?MDF6YjRVRDQrQkM3RHZuaXVnVElsVm1Tdkx2UndTVktSU3VSNkNUa3NvWkdI?=
 =?utf-8?B?K1pOQkRZenVxRGlPNXQ3dGFMbWhyUkI5dUFVT3hGaWN0aWF2MlE5K3BKekMv?=
 =?utf-8?B?OEVVZFJBTzRLeURnY0t0NkZ6cGFhOUEvaUlxQ2k0UitjbFEzRWlRc3QyY1pJ?=
 =?utf-8?B?Z3RLbWFvd3FDRWRMSmh4dDkxTy9zR3ZYanZOamNHU0pacmoveEhERWFtbmdt?=
 =?utf-8?B?R1UrTDlDbHRlU1YvdVlORkFZalYyRit3Z2VZSk9YbVZRNEtKYitwVlo2VVFE?=
 =?utf-8?B?Z2ExZGV6TEIvUnFWYzVyS0gva0UrZkdOaTJDWUFiK2tOU1VVbHZsQ0QvM3Fo?=
 =?utf-8?B?MXJvTU1qMHhieTVSMmx4TU4weGh4ZEhxc1VSeHlWM2tEaWJLVWFWVUlwQjBF?=
 =?utf-8?B?QmFBS21ZZWNHZG8xSzljZW1nd1dYOWZLaFF1TlQ2TlduemttNjNQU0x4a21M?=
 =?utf-8?Q?8jJrKpcyfkN4F70hWj4iF7qHUsc56XxIfO89J9E1mgmG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ea447a-98e9-46b6-3868-08de2cf777db
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:24:11.5254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvlXUzglgHHgfJt8Qr1OkffDBQqN8uBlKSNLzzLTt31h7160MpQtIrfclRz1i+QYqFir0AOKUL7eZQ40mpihlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9795

Hi Bartosz,

On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   arch/arm64/Kconfig.platforms | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -316,6 +316,7 @@ config ARCH_QCOM
>   	select GPIOLIB
>   	select PINCTRL
>   	select HAVE_PWRCTRL if PCI
> +	select HAVE_SHARED_GPIOS
>   	help
>   	  This enables support for the ARMv8 based Qualcomm chipsets.
>   

I have noticed the following kernel warning on our Tegra platforms ...

  ERR KERN OF: /__symbols__: could not find phandle 794981747

Bisect is pointing to this commit and reverting this does prevent it. I 
am not sure if anyone else has seen this?

Jon
-- 
nvpublic



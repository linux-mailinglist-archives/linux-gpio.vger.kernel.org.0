Return-Path: <linux-gpio+bounces-31738-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLs4Kmg2lGlpAgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31738-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 10:35:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05F14A731
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 10:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAA493017C3F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 09:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCA330EF81;
	Tue, 17 Feb 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gBUjnZ++"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7530E824;
	Tue, 17 Feb 2026 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320908; cv=fail; b=u7Mdw3S2MDaVjhQIS1/8mCLOHppE8m0J1wjUXNJRwGjKRPA63gUooBNqC8HFJwWorFgmsVxnOkyzS63TCeIVwKSlt0EndBQx5igCTw82qdMwdD1faVzyW06f5nph7QBxIjjhBD2f/6L0x2Zh8AXeXBGOErHFTTqbxm3FXDd56kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320908; c=relaxed/simple;
	bh=3vtkEAOyolUmjz2VS28+GiM6mzXms95kYmW8eHVknbg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dKvlFUcsMcLrH52b8HGz4WXSGmLEb35P6RaLDr96w2KKDNEMmEajnda+d24Xbyt/dUXeCiKNmuF5hH0GB4cs+FP7SGkhhK/C+aXkK6mR4zQimnVkQr7QGyAiry6vWDiGM/uuhR119+GaMFG2vK6qulDmKRo3AJelnHqg0a6SgLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gBUjnZ++; arc=fail smtp.client-ip=52.101.53.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQtvuGD3tFKlSlcohvvFrkfA4H60Cpyawc0KQwjL/ocZNPRBeOUvvPQR7QLrbBvKx60N5DzfxJzSYgsUVKdYb4NsExkH785jJFDV2ek4aswVCBGSi669sMamVmty05sd0rSqSrCcZZ9/uWOlOEJeAdrYBpu6on4QSx6qlk8f1ctb/O2rwanml0puRjAGp3LybO9pMgmfiAoL1icmaSfb5UpJVkgBCIM5eaTnLgECOZbB6QnyqSqyCi4Hon2tRTv0cwlckd+KDmLJotShLDTrsJcobZ7sdPzQwN6X2Ie7ZOICT1LhGFHntjmyGKhEQpgNYw7neNzdW9cwnb0mbN8r5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QiBoLJgbSu21M6Xpg1f41U5izRJSOOE1+ryFwoRXFo=;
 b=DPQuiXqajygVGUV/PErs5mcl/EpPzdfPaS6NPvYiFZuoLFhQW58kLE6GXKTS7Lfy/AH+hGnjKJztb4S99POGL+0jUdXQ0mDKxfVkNdYs2SvqXYeyarb9hzH4EK67lF7/+cg1kPVXgYqXfATseKG6tXfDPheBDTakmGnWYhSouYe34Lwqmw1VpxFHFGxrRaUsu1DnSzKB2/SYnx6+pvI2/U+fqlmRxLH556jlCkPSl3eFypmYaRRmAGFAMO2w2wG8zXPVEP2RZnrXcIF76aQVc04TcUy63SlWcCME0esK43P7G0JoKH431g94naZk0r20KPhQls8yz7SpykRBxnk9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QiBoLJgbSu21M6Xpg1f41U5izRJSOOE1+ryFwoRXFo=;
 b=gBUjnZ++zG5jda+npUgw7UW91uYY5QiXANltO44cctBcGdHB656uovUDKVo5MW1AKDubCWyOsX3zOAOXTCB/rFCv1cZ8jcVitfuqDNSkeClT3LAZg5wgHB7cDr+H6NDTU4F2bMs9oWURAKXQjKv5EWKf/XznuAOtQed2VtjAPCGUtTXcS01GtSJOK7vVHpS8w9g8voaKpOTAZ+VcfAgTidfncvtgSlZe/K5DJlmJWFiX+WfaV6UzIiinJYN4YDa7kHJMmZ5rA1y440ckA5Z4mbXRhKSdUUEnk4FKRYOpGZk5aeOfNGoQVbAWHT+FKUqAh2QV3jKpj6lEzQKkx0TEaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 09:35:01 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 09:35:01 +0000
Message-ID: <547eb829-bee1-4178-bd2a-6edca9ce82ac@nvidia.com>
Date: Tue, 17 Feb 2026 09:34:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: tegra186: Support multi-socket devices
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, brgl@kernel.org,
 thierry.reding@gmail.com, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217081431.1208351-1-pshete@nvidia.com>
 <20260217081431.1208351-2-pshete@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260217081431.1208351-2-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0405.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::33) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a419b6-f685-411d-24bd-08de6e07d2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2psbURxUEtMWktIdk1DMzRQTmNRS2RUd1lnVEM1YUNnWXJGY01TS2xVYWVJ?=
 =?utf-8?B?dS96bUhUZ2tzb1V0Ry9zdEUxQVJSMVJ1M25tM3o1SzJaYTcwdktZQmcrRTFz?=
 =?utf-8?B?WHpuR3ByTWxwTDZ0TVdrcWZVYmtUejNwZVV5UnI1aCtyMEVZektwNGxSMmVP?=
 =?utf-8?B?UFdCVVc0RXFUdUxJNytPNGlmV2R3b0RoUGp6Y3NvVDVEb0ZDL1FmMm5BKys0?=
 =?utf-8?B?Mm42OXo4RDlsS3drWWxPbHdrY0VJb0ZZUkFjQU44ckZMMDZ6a0d1dVl5dCt2?=
 =?utf-8?B?ZFNvWVcxWmJLeWJqSk9nazVHQ3BWYU9IUllwN25ZNWk1MXQyVXVBaEFnbmtG?=
 =?utf-8?B?MzR0RkZIc3NJRFJ0SGIrc2pKZHN4VjlLRVZJT2o4cWJBdlR5UVJXM0NJeGxq?=
 =?utf-8?B?N25aZDhZcmVzOVRVUXlGQXdHMUs4cSszb3NRWTdYTTQ5c1dTbjhWd2JJemVo?=
 =?utf-8?B?VU1qSUFFNWhwSHhHSFNkK1h5WWRwYjdJRUw4b3BhMndXcmhtSFBhS3dXOVVG?=
 =?utf-8?B?ZGJyWk9vcU5NZXMvZkJRNWJ3Tzk3bGpPT3FBUTRRMnc4TjQraDV3a3hGVldS?=
 =?utf-8?B?MkJTcWRpM0NpOWVOSHRtT3VUU2sxR0t2a09id0JiTDlHQXlrUGFBRHA3TGpi?=
 =?utf-8?B?YkliM3JFbmJ1SS9ISk1EbGZzR1dvYnEyY3VIcEZmUkRUZmlaVHNIYXFZTXc5?=
 =?utf-8?B?UWJEUW1qU3h6aDkwMSs3RDlFeUlFZ2h4YVY0ZEh5Nnlqeld4SkU0b0VaQ3lC?=
 =?utf-8?B?YVMzcnk4UnlDNCthWGtCOHF4dGVmMWlHdjB0SXFDOW9Id05tbUQzeFlYR0d5?=
 =?utf-8?B?TFM2cExhMjhiTkRGakZlWXJyWkpINFQ4dDlDZ29kcHU0d3pkbDQ4RktmSWpt?=
 =?utf-8?B?VHBpNFpLYy9GTjJVUUlIcmJ6R2xveWh2OHRaQWdaekJtcTdNNFQ2TW51aDNV?=
 =?utf-8?B?b28wZ2V3dlBJaGRNR3dBN1R0MEdxUXF1RGlGQW01Sjh3WlYvbkZTaURaNjRl?=
 =?utf-8?B?RWJiMUo3K2hZTFh6L3kzZEJ3RngxV0ppM2YwVjVkVktEdXFtUUNEeWVwS0JD?=
 =?utf-8?B?S2Z5Lzlpb3dBMWh5UkxSRmVscWd0Si9tUmFVT0pPNVRHNUV5Vldia1JIRU5W?=
 =?utf-8?B?ekdhc3ZCMXBHRmt5cDZPZHp0WXM0bjBLbC8zS2NISXJNeE5RRmdnaFZxQ1Er?=
 =?utf-8?B?VmVhcXZWTUwrSnkrdS9WOHRiRjk1TWMwRUZQTWozeG1oUTI1WjJFNWU5Z3lG?=
 =?utf-8?B?aHVCZ1NGRHNQVVhYdGtuNC9TWnhOcVQ5UUhwOS92ZW9GbVZYeHMrM2QrSHpM?=
 =?utf-8?B?cis1SFBrZG5vdXN1TDJJYTdycDdoMVZoUXlTZ1Q0N2tFRmVwMDdSUW1RL0lN?=
 =?utf-8?B?dTdKdGNMOWVDNHh2a1IzVkVhc0JUdk5nUkpMNkRLY2J4U2RpT3NZZVNleXBP?=
 =?utf-8?B?MHIwa1o4dW9RaCtSR282STNiczhiUlpDbm5oZVVBaSszS3pBRHhZNi9FaVlL?=
 =?utf-8?B?ak1jcGR4dDVESDdZL2xmNzlZVjV3VS8zd3Y5eEQ3REtjdzhjUVV0SXdpa3lR?=
 =?utf-8?B?U1NlZ3d4STg2MlN5NmMwNms1MDBxWjJUM25LM2RDNzVkYytxSW9aQnV4elVp?=
 =?utf-8?B?QnFJSGRrSDh0c1JMQ1dQNjZwV3ZYeVRaU1NVZER0dC9pbGdiZGVVMkFOd2VO?=
 =?utf-8?B?blBuWnlmVUZ4R3I0M3JRWmJFNkwzcmNLSlZmY28rUVR4NkU5NmhIQUdGSXBX?=
 =?utf-8?B?VkZMV24rOGpnbHhGRDNsT0FEOVVJV21UWWxCeVREakw1aHIveE1rYTcxVGg2?=
 =?utf-8?B?MWxjTkh0NjVyV3Zrd1pCdXdKQnlPbEtzNEF5NmgyUlhYQVNBVzEwQld4MVh6?=
 =?utf-8?B?VXVvalZDVGh2ZU5UdFkyTCsxblppV1FrN2l2WXIxQW9zdFcyZlVZMU9RMjZh?=
 =?utf-8?B?NUVZelJTc0lYc0Z0SnJYV21ROGlmZnlyd2FtbnAzRjZqNUR4WWMyc2dId0ZH?=
 =?utf-8?B?aXNJSjJXNnRralVMSHUyWE1ZeVMyUTkySjVnRndXNktTekwrWnczbVRGNGhF?=
 =?utf-8?B?aE9aUllvV0ZxUnljU2tobkpQZmVNZEVGSXhMRTRuUnNBcUZLazdySjRDRXFI?=
 =?utf-8?Q?wpas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWowY3hQUmJOSzFIN2s0SDlqekZNSzhENHh4Ti9uRzFrSmJSeWxJSFloNER6?=
 =?utf-8?B?VnpJMmNOOCtheFUwaFVQZVg4UEE0c0tEOWQwVDV4MVl6MFBCUThhR05yN0N2?=
 =?utf-8?B?OU0yaVZRajNvc2lxV1cyYTN4VFpsS1lkeU5YZGJySUtGdlJvd3FyWHhhNEVK?=
 =?utf-8?B?MFE3aEdUbHErMksrT2xmanhQTm43M3lwOFMrUWl4Mzg5c0tTUXlzN29NalJX?=
 =?utf-8?B?Z3RFbUNNVEo0elJGTC9HZmY4V08zbGdQckF6eHJaQ2NvYmZST2VHVHFveVVt?=
 =?utf-8?B?Q2dyS0lRcnMzWDFDelZmOG9jR0doMXMyYmMra2Y5VTV4VUs4NU5rQ1BFVTJD?=
 =?utf-8?B?V2VhT0luRkQwU2ZoUjMxVjE2cVFNZFcwS05Nc3NQQjRmTmdIRGViZlBvSmlv?=
 =?utf-8?B?bFFaNVZPbzQxQVR5b01zdGxLN2VpQURTVUEwQ3d0RFRPTnFUWVpZWUxIVW5k?=
 =?utf-8?B?NWlYcVNVQS9ib3JpMDUwOEwxYmR2L0VaSVdUL0NwdmFFUVdndytZOWhWNEpi?=
 =?utf-8?B?MlN4VCtqeEt3MEhkMmRzSUdMK2FTUmhURGw0NHZqS05PbDBqd2hUci9BZEQ3?=
 =?utf-8?B?Tm9BRzZxSEVycGMwMm1hM3pNSnplRFZEK0Z4SlE4R1JYYlhxenMveFZZS01S?=
 =?utf-8?B?eVBWQjNkYStsVUxqeEFhU0Uva215RFdza1E5dFVtSkx5ZmdIVWlaUlNLM0hY?=
 =?utf-8?B?c0tDZEUzeFpVQVJaSFZQTDR2TFFqUEUvTzN4K21JTVdsUUdhMFlUcHRHb2tW?=
 =?utf-8?B?aWt4TzVyMCtSekRlenZtOUhvVzUxNjZyT2d5cXBWb3lFTlZJR3NmZ3lrbnlu?=
 =?utf-8?B?OGtzcW50S1hJNUZlcG9VVS9qMlNsTjNXTWd6U0puRlFxRytyZEtqaVBuazFq?=
 =?utf-8?B?NjRHRGMweFFrZUtrK1o1SDFka3ZSNUV1ZlpLYmhGUGJrTVNlWEdGRzFwajFr?=
 =?utf-8?B?NFVHK2FFNWsxVXR3cGNrcGQ0ZUxZU3lyTEJHWkpLbFVRdDBvblJ0K3FGVUJr?=
 =?utf-8?B?eFZQTHcyU3B4RXZCUGhsVnhaaXRYeGFFRng1S1FMbmxqY01rSXU4aWtnU0J4?=
 =?utf-8?B?LzI5OXJJaGtCdWZEcnAydFJzR1BUTWVIdFhpaWNDWk9hS2hLbXBhMFdpUThW?=
 =?utf-8?B?aFI5SGRXd1NGN2Q3UDcrY01KTC9CdTRiYURBQ0hndzVZbmZjdEVNRU1IZ3BB?=
 =?utf-8?B?SUxCNFRaZEhpMFZUUVJYckVwNEhNcHpuUXVPcXEzeDhxV2VLZ3A1SHd1K1ZX?=
 =?utf-8?B?eDFrQ3FNU2oyb1NqWldwajRra0o0VWFKeXk3cU8zSE1jbytjSUdzT0dGUzJX?=
 =?utf-8?B?d3l2cGxuUTBxZUVUeWpIQkw4d29WMTVkb1J6QmJQRzdVWkxjbGZPZ3JicElq?=
 =?utf-8?B?TmN5UjVRYjlPUFp6SEJoa2laWTRXV1ZBS0xtYUsvODE4V2MvR2tNa2lOMEhV?=
 =?utf-8?B?UjdqM1ZrZ1lyREhMMXdRRkxtYWg0cnpFRllSeTRZaU12c2tYcEUxekJaYllU?=
 =?utf-8?B?bm94eXIycEc3c29NSlhRNFFxbVc3ZTJ0NzVkMHAyT0tSOThtdS9ER2tidG5s?=
 =?utf-8?B?QUJIUWhhKzFXUytUNUs4RldCMGFHRUVpRVFTRnZBcWxZQnM0eTNNNWZYazBM?=
 =?utf-8?B?TldiSEtKT05ocGhnRnhjdTJGT2pnelkyUjhIYkV4aVNzczhPQTJmSWIrSTlk?=
 =?utf-8?B?Zy9hMmYyNU80ZzNBbEUrT2c2cVpESEVyY3BYRUpiUXRVMWtYZTEwc1RDRXlH?=
 =?utf-8?B?dFgrRjFDcGZxMnkzQ2wrVDlJVHJLQnhOSVdJSVJvN3JwMHh3ZzZrU0lXVWtp?=
 =?utf-8?B?MlpxY3pQbWdsb3RjZDg5YmtaVXZDeFJ6a3FRVTlFdVZrOFpIN2ttSGpLWTJ4?=
 =?utf-8?B?blV5b05tT2hCMXRyME9QK0M1bTF3L2lQTFZsMllFQXB4M1l2czNrZExJTzR0?=
 =?utf-8?B?b2s1NmhMeFAyZmxNUnVFajFLRmVoNVhUMWdvaGVVKysvaW9EcUE5YTBEbHZB?=
 =?utf-8?B?ZGhpVU1NV3NWSjhHbExtWklHZGVvSEdYSzM1RVFUbW50cEd6TGtMb0RWV0xT?=
 =?utf-8?B?SEcxaDVmeGhlYTQvdm5BUEhZL1FGb2JDa1RqbGJZeE9WZWdoQ3VKR1dUOTlC?=
 =?utf-8?B?Uml6OVUwTWFXYyt1VGd3NFpmSjR6UFM2MFhzb0Ftb09MRE8rRzBDeStpb1FI?=
 =?utf-8?B?cVJzL0ozdzlTeERYaVdGYUE5TUJwY25mVlFZWkt5bTVSdlJ5SDYzbHNKY0ll?=
 =?utf-8?B?Z0lzdGNOZXdrLzRkTVpzdjZjZ3g1NzRYZGxFdURvTUgxRFhGWXNWclBkK1NX?=
 =?utf-8?B?VW1zOWF1VVo5UldkUzVudlJBT05zNTRjQm5STitlNVhvMURoTDZ1dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a419b6-f685-411d-24bd-08de6e07d2fb
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:35:01.8575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbY0nadnkvq/p6dd1FaEOgnAN3x1BPB1y469qA8pI7c9B1bR5BFhksgDq1+mQRbn12t/Yt9sfAJJXM3O+UshPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31738-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F05F14A731
X-Rspamd-Action: no action



On 17/02/2026 08:14, Prathamesh Shete wrote:
> On Tegra platforms, multiple SoC instances may be present with each
> defining the same GPIO name. For such devices, this results in
> duplicate GPIO names.
> 
> When the device has a valid NUMA node, prepend the NUMA node ID
> to the GPIO name prefix. The node ID identifies each socket,
> ensuring GPIO line names remain distinct across multiple sockets.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>    * Split the v1 patch into two; this one to support multi-socket devices.
> ---
>   drivers/gpio/gpio-tegra186.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index f04cc240b5ec..fb26402b6c47 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -857,7 +857,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   	struct device_node *np;
>   	struct resource *res;
>   	char **names;
> -	int err;
> +	int node, err;
>   
>   	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>   	if (!gpio)
> @@ -937,13 +937,23 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   	if (!names)
>   		return -ENOMEM;
>   
> +	node = dev_to_node(&pdev->dev);
> +
>   	for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
>   		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
>   		char *name;
>   
>   		for (j = 0; j < port->pins; j++) {
> -			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%sP%s.%02x",
> -					      gpio->soc->prefix ?: "", port->name, j);
> +			if (node >= 0)
> +				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
> +						      "%d-%sP%s.%02x", node,
> +						      gpio->soc->prefix ?: "",
> +						      port->name, j);
> +			else
> +				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
> +						      "%sP%s.%02x",
> +						      gpio->soc->prefix ?: "",
> +						      port->name, j);
>   			if (!name)
>   				return -ENOMEM;
>   

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic



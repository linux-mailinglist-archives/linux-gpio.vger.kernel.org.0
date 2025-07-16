Return-Path: <linux-gpio+bounces-23364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C61B07D35
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 20:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4FED585183
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 18:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8759829B771;
	Wed, 16 Jul 2025 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yzarbMBW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42D2857DD;
	Wed, 16 Jul 2025 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752692061; cv=fail; b=RnnBiPVzEmU5KO3+mFNmH4REmbasTjUEtO4PZ2dT0rLi86bM40SGPcqytLiAfQDb14zetlUgN3URjg7YQ6k44DUEy1hIypr3kaNh94fE3C/tH9nKMkTPfTae40o7z000CoMvwscwJAgmMNMAWRjE5NVLcP9gxCecro4YIkCKTmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752692061; c=relaxed/simple;
	bh=u6dc5+17P7m0Fp1+rc6Vnt47vDGBqOD2llT5Y3u1ptM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o6fxN+uNe1WxoKmCZs9+JJ5guZDekjLMKc6kjWtEijeZhX134S3UgI/ty5O2Cg8v5IuYkBezJUY5a5ArlpFfnLWHIBzNGVb6Zsb2zh5SL+LT+Dn8QSrLggq3AwEr/7TLM12TFIIhOEzhHyzjaS6bhLJAqlBykfgjLxkHAzr66lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yzarbMBW; arc=fail smtp.client-ip=40.107.237.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdL35qKYxHWqN+LRPe9wkVL8i5bkCbR3r5U5qAokVDDNdH0gCpbyaEwAdkvLIIBWvMW6tpZqCfe2KFKGaro+a8dA2hKqmUcDH7jepDWTvUdpInuN6yGX1sXPwwE1CJ83aKujDwc23EH+CWNBo8qn+PTgfTYHFfzA1xuLACefuNCNva+IQPSv2vvKDhSXXd9kzgKulk4auR/ZluXVQapMopDVSjXbpYdk/qsO5L9IRNze1wh8ZgWzwvDSE53NhhbUAQd71wdQVHGbvGlxzZpnzj3J4PMeLhG1w3nMYFyo38OUbEXVyhiQ8S6JRKPwANr4Bd4uGA+8ZG38D18oU/wGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbwVwvnM/RUFQWUE7ZtStO9qW+CGTBisTL4VR8I66vY=;
 b=MDXQcKgXpMWTHDqU6C6Td+0kD7Jb0LvPS6srIfBRf14yr/ebv6C6akslI/CL8V+mNfqHY9EB3mbgqAaqN9UjPTB4Fd3AMyZsVcc8NI4UMQ0bTt9u536u2EzAES5aVvbN1zG6fdvJKTl3dU6Jp1e2BkcQwFSl8qe3B2wW3OpkYQboPVF9PaNqWCkim+650XhBO4+sG0MZbrVW+3b6jmA6mvMGrayzDV1h34Pm4GCRLelylFb4h/9InhwsvkYE+CCbfheQjbNTrSdPJ5AN5u8p3Qv4TewV5Xyp158uMbrP4zbS/xT/bn9jHh6bpxErhGxGOybtvZwwu5z+BO057H7N/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbwVwvnM/RUFQWUE7ZtStO9qW+CGTBisTL4VR8I66vY=;
 b=yzarbMBWcrkM0fwbbINY8X7K+h/UdoYkurXsQES7PqlWnJZG3mJW3pD4rGdswNYVZ1VwZgVXf/moI5s7qK7nD/+huNa5jq4Hg7xUT3RNeMIM/WSJtpff1qS6Hb7NFgD5BYfbw9C2Ntfsydu15oxpXBYjkOVHQJ7TSI0F1x/PZwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13)
 by PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Wed, 16 Jul
 2025 18:54:13 +0000
Received: from MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::4d5f:28f1:7513:4d8e]) by MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::4d5f:28f1:7513:4d8e%4]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 18:54:12 +0000
Message-ID: <ebdcb488-6638-43df-abb3-6a7b0eb9b77b@amd.com>
Date: Wed, 16 Jul 2025 11:54:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Cosmin Tanislav <demonsingur@gmail.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Content-Language: en-US
From: vivekana@amd.com
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To MW4PR12MB5668.namprd12.prod.outlook.com
 (2603:10b6:303:16b::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5668:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 86655517-4673-471e-95b5-08ddc49a27a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmpUS0ZtNWpIYTJMa1NrdmNSU1ZxOHVBY3ArMlpHaWJxRVl6WC96eGsra2FT?=
 =?utf-8?B?a01nZExiNWJUYmxyS3FEUzJmTEZ3S3d4OEp6MjFlNDZ3ZGFmSHA4V3dFckUv?=
 =?utf-8?B?R0V2Rm8raTFqVW9pOHo4WTlpN2FJcXJiemdndzBMQUtKa3BNRVc3WTF5OUNh?=
 =?utf-8?B?SUZQdEd0bmFXNzc1aE5yRHJhY1k2RG1CaDRHZk8zRnQvb1B5R0hMNGNtdlg4?=
 =?utf-8?B?ZUZuend3aFVpWERQYmJSZnJJR3VKYTVWSGF6MmNSWHpSc3FVU2hxVDFrVzRV?=
 =?utf-8?B?SVp5M3YxZ0RJU3ZuWCt3ZXRHUWpkejVLczFnWEdnZWlwY2NOUTFaM2xZVGdr?=
 =?utf-8?B?UlJjUWdaRUFpYUk5dmZkVm1lRStTOEJiTXlXd0k2VG5paWNZVGQ1VlVHWEhO?=
 =?utf-8?B?L21Sd1ZHU1RsVW9NRFVkVE1ONVVTdDB1b2xFcTRQK0c0UDN6cmx4ZDBralpK?=
 =?utf-8?B?TEdIeGJkd1luK2E4QnBYTTBDdm1uMXUrS3g3aTh0aU5SSnlBZTB4akxWZTM1?=
 =?utf-8?B?Z2pmeU1vYlZMbXBtbzk4L24rSXhWZ2xpMWkxaFpjVU1xVG56ZytiY3prS0JK?=
 =?utf-8?B?YlNDVWF0Y0dxeWVmc3RQVHJRY0oxd1ZORnRXaStOL3BINFdMc0VpckRraVor?=
 =?utf-8?B?WUEvS2JGdlUybzNDcDZsbnhlTVd5Z3hZeEE3ZjZBRmpmYVdneFh0d3VVSWVI?=
 =?utf-8?B?WjZtem5ZT3JYSTVZSElic1FNR2MxU0dzbXZDNE9Ed3RVRjJWU2JpZVluU0U4?=
 =?utf-8?B?dEJjOGpWZXk3Y0JlMFZwd3VuSTlTeHV2OEYzeGpySGR2WG90Unpka0FJSTM4?=
 =?utf-8?B?ZTUxa2tUMmtWZUZucVpaZVNiOSs5bG9zQ3hIZHFNSjVWelJ4U2pDUHQyYkJN?=
 =?utf-8?B?d2sxbjV2ZSsvY0kyZjJDdjI0eGt0eXloRkZuSjdXMnRPenREeXpZeDU2cnBj?=
 =?utf-8?B?UmFrQmY5TGs2eEpnd3NyRjJMZnI3SW5DdTk4SVBpTGU1UmRNZDVyU045QkJy?=
 =?utf-8?B?MUwvRSt2ZkQ5R0I5Vjk5djE5eG9wejlySjRMN21FbDJyU2hVMU16Zk5oN1Ru?=
 =?utf-8?B?bW81U01nQ1hhMXFpOXlOK2laOG8wUUtBQTdlUXhiU1BVRHNZQmpDY3lRVUkz?=
 =?utf-8?B?OHd2YUdsZlNBSGJac3dkTHZHSjNpSzhhNkZZTjlBc1Q4TWJuOVlrL3F2ZE1G?=
 =?utf-8?B?YlJ3RXNnZXJLYUJhb1Q4SytwVG03dWpQajB4N0VpenVTditibW5WeVBNM3Zt?=
 =?utf-8?B?TU91NklsZFFGK1pBaVFZRUdvNWJUMTZrbTMwQ1RydVJHTUpSenFHVU9wRFhx?=
 =?utf-8?B?d3NEaVhIcitlSngxaDBWYkYyRE4zTkpiQVVSaUM1dTROZG9UU1YwZkZkV0Zi?=
 =?utf-8?B?ejV4YzJhYmpTN1VzbENQVmJtd3licmR1d1Z2VGIrL1NEYndjMUgxNFkrRFB5?=
 =?utf-8?B?dDRsZlNVMjExazRiREhTWDlQZlN1Tm1BVHp0TGpLMUhJaXNLd3FhWVF2SmNO?=
 =?utf-8?B?SlFDR3FTQkdrV3VDTG40czhOQSs3cmJOOEVIb21iajdtSm1QbDc1TlZoakc2?=
 =?utf-8?B?WElIVTBOQTdDUU1aSlQ4bkdmNElXVHg5d2xEbVlXUnUyTHo4YkowZmNlSkRV?=
 =?utf-8?B?NHZkSVkyRXQwTmIyOTEvS2tEL3N4eC9xNTRJSlJFazVHU3RqaWpnN0l6bnRH?=
 =?utf-8?B?cmI5Z3JwNjFZMzVjL1EwQUR4NDRYMUs2VHVuMnRQYVlLK0o2TDEvcFVqM2pE?=
 =?utf-8?B?L3VQalpZOGlPZWVwK1NjN2hFQnRmR0xuRm5sUmNOSzZMYVlQblZXRnNPdlll?=
 =?utf-8?B?NlVnMDdHS2FHQ2tTL3V1dW9DaldKbHpYYWR3bEk2T2xZWWZJblpRNHBlaDA4?=
 =?utf-8?B?MXRMQ3VwbCsvUEJaRFR0MlJYQm5ITXFVYWZpWmEvVk00RmY5dlZDR3psVkNm?=
 =?utf-8?B?TjJGRUpCcyt0dHM0WXZrQXFLd1lBYk9PSWxJOGNOaEhkQklZaWloUjhBWmJo?=
 =?utf-8?Q?/L5IP4WLbsjYBJMLG4uwVgh/bXnDrQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB5668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2lWdk1UM2xybDI3NjJ0cjBZN2VZbENlWjl4cEQ5YWI3VHdmbmJsTTZwcnoz?=
 =?utf-8?B?WVVWUHcwOHhSYUJoM0o4S0hzdlJtVzN0MU1mVE5QMDRzaHdyVXRmUGNLaCt2?=
 =?utf-8?B?ZVdUWS8yS0JROVlKeHgrNXBnNXpKRDEzU29aY3hZVUJpa0p5Y1N2Vk9xVmRS?=
 =?utf-8?B?b2ErWDBGbWhMQnJzRXpGbFVjZ0lqUEF3Qkd0R2g5cEFaWm1hR1pCa1NZK2hE?=
 =?utf-8?B?Ly8yMm1MVmxTL3crTlI1aGlqMk8zWmRkdzhrS2NSMUFFeEthRGF1U1ZXNVhp?=
 =?utf-8?B?M2FvOGo2L1ZDbWZpbjNPeEtyT1NkSnhWTTVFV3l0TlIvOG5jOXlXWU56S1JX?=
 =?utf-8?B?TUdmeWwzWlBxWjQ5YUtDeXZ6dU9ob3V5ZVBrNzZzbFk3d2d3RWljRFdNUHhS?=
 =?utf-8?B?bVpmdzRiNExBU283bWpmb0Yza0Y0Qm85RUF4UTNHMTJ2Z3h6M3JjZ0FzM0hs?=
 =?utf-8?B?YTlPd1lJTnI5N21ZWDFYc1V4S0djK3RvRVhhYjBCY1llVlRVUW1LUjZWbWFv?=
 =?utf-8?B?R3VlVXorM3N5RTBiSWdLMXJITS9kUHFIYldNbEtJRW5SNkJTdjZvRHVsSVRO?=
 =?utf-8?B?TlpDQ3l3Q0ZjUVVmbkhkbXRweTJDZjZTU041NzNIT1JCUUE0VEdGSGxhY0RD?=
 =?utf-8?B?SzE1V05zZFBPSTQxOGFtSXZrMXUxanVZNU80SVdJbk9vZUN6SjFmazlqbG9p?=
 =?utf-8?B?WUd3OVJ0eTRCd0JRTnZBajNPa3c3R0RsZlpEODg2NG1yR2Z3MFF1MkJ3UFI3?=
 =?utf-8?B?aGNuWmdCZk5Ub1NpOG9KQ0p2WllIWWJMc3NmbzN4UWZ0RE9tRGs0dEJXU0ZQ?=
 =?utf-8?B?bC9URlV5L21XeVBzbVl1Zi9OSUNFOC9IUStBYUgxWThlbkMySGNvQ3ZpUk1l?=
 =?utf-8?B?bXlRYVpYdU1HTVVuRElSS0hWWjVSVVdNMWROT294Vm1LNWZCVnJCUnpDREZL?=
 =?utf-8?B?MWkvY01nZk1GUW5FK2N1RnlyVS9qd0xwNjJJSjRtZk51TXkyc2VSQmZ5dUJB?=
 =?utf-8?B?MjdLU1p2akplanVmeThRanhManNmVjVqcWtLakIxSmZDbjVxZ2xDTFZHVFhI?=
 =?utf-8?B?ektsNVZKSTFVNUZMKzdhWjlXbzFjeUh5YkhFMnc1OTU3dXIrdjY1QVJJV1RL?=
 =?utf-8?B?WUsvQnNxOTJKUFU4Y3NtbENsVmhBYmoyWTZ3eXZxbFpnQzVWeG4yLzNCa1pT?=
 =?utf-8?B?VzdVQzJCYUZFSGV3WGh6MzBmcFRnd0o0WnkreVFtSHNzVk83SVFBNGR4R2Vu?=
 =?utf-8?B?VFVMRjUza0haNjZuUnc1VHNZUWI0c0hzNEI0YUtVWnJqTkJEWkE3Z01SS3BX?=
 =?utf-8?B?ZExnWWxvSkpxRCtiZVRVcnhyakpWUXdGQklJWU5jSUdlOWFZVkFSVi9HZFFR?=
 =?utf-8?B?dnRHRFFrNFpYL2lzWW5HVW5VQW1wWXp5dWJLRjZmTU9BMlpIcDZ2Y3FOM0VY?=
 =?utf-8?B?Q0wxdnF6Q0dPcUp2N1R6UjBCWVdlc0pyUXhYYUV2d1B6WkxveGw0QkhnYWpC?=
 =?utf-8?B?eVFPc0FvMXhXazZXMkNWTHl5VU1JRFZDdlVZSEVHRVh5YXZXU2Y3TVhoOUJk?=
 =?utf-8?B?VmJQR0JnMmcyVHNpcTl1dldzSVhvMnp3NTdwV2NwejFLQjNJNitzcUdPeXFj?=
 =?utf-8?B?TnZnRnpnQjNNWEsxRXdRZTJIYm53dWh0cS9MNkxsYlBBdVRKeis0UWM1cDlV?=
 =?utf-8?B?Zm1vSS9FbUYwR3JXem9ETXNObVgvVE5tdGErKzJUYS9JMGpEbmpoYlkzNHRi?=
 =?utf-8?B?bUpHK2JucnZub0VwK05aTGRCUUtkOFdCME9TaENFM3NuSi8rMG9iZklZY25N?=
 =?utf-8?B?cWUwOGJYa05DWlNTTEhiOWxNWUlmSmZNYnFHVUtNeEYxWlljbG9JU2wvS2Qv?=
 =?utf-8?B?b0ZySmNNd3owTUV2TytyMkRvRHJsaGpBb3hBckVQVDB2U25mMWlmRW0ralc0?=
 =?utf-8?B?bTlsK3d0SUZnSmVCMEQ0bEJPakR1R014QlFpQVpnOXh5TW1TR1EvMzRPNTAv?=
 =?utf-8?B?ZUlwTGViWDZBQW40SWZXMW51Mzc2T0ZQN2RITDllSEZHL3lTUG5sbFFlRU9C?=
 =?utf-8?B?U3lHRFU3L1FjTjIyVjhoQ0RSbCtJOTRieUxRQ1VORE9COWc2TUhVWWg4STl4?=
 =?utf-8?Q?GW6c9D7OUbVSjyX9/ZDSE1p+v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86655517-4673-471e-95b5-08ddc49a27a0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:54:12.7791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xcXBU3YA+C4wvKHUt9Pz0LhZzTJLuxDgcE/IqT3ZxghPc84HmNXMiUvZfXdmBnx9TNPwmoSdB06bSFiJcczNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819

I am new to setting routes in the v4l-utils framework (version 1.26.1) and am struggling to find examples for setting up routing and pad formats. I'm trying to configure an imx219 + max96717 sensor module, which I believe is a common setup in the community.

I've attempted the following commands, but they haven't been successful:

Route setting attempts:
$ media-ctl -d /dev/media0 --set-routes max96717 2-0062 [0/0 -> 1/0]
# Error "-sh: can't create 1/0]: nonexistent directory"

$ media-ctl -d /dev/media0 --set-routes max96717 2-0062 [0 -> 1]
# no errors but no active routes set
Neither worked.

Pad format setting attempts:
$ media-ctl -d /dev/media0 --set-v4l2 '"max96717 2-0040":0[fmt:SRGGB10_1X10/0x0]'
# No error, but defaults to 0x0 resolution

$ media-ctl -d /dev/media0 --set-v4l2 '"max96717 2-0040":0[fmt:SRGGB10_1X10/1920x1080]'
# Fails with: Unable to setup formats: Invalid argument (22)

media topology after executing the above commands do not show active routes or pad formats on the serializer:

- entity 21: imx219 3-0010 (3 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev3
        pad0: Source
                [stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/1920x1080]
                -> "max96717 2-0040":0 [ENABLED,IMMUTABLE]
                -> "max96717 2-0040":0 [ENABLED]
        pad1: Sink
                [stream:0 fmt:SRGGB10_1X10/3296x2480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(8,8)/3280x2464
                 crop:(688,160)/1920x2160
                 compose:(0,0)/1920x1080]
        pad2: Sink
                [stream:0 fmt:unknown/1920x2 field:none]

- entity 25: max96717 2-0040 (3 pads, 4 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev4
        pad0: Sink
                <- "imx219 3-0010":0 [ENABLED,IMMUTABLE]
                <- "imx219 3-0010":0 [ENABLED]
        pad1: Source
                -> "max96724 0-0027":0 [ENABLED,IMMUTABLE]
                -> "max96724 0-0027":0 [ENABLED]
        pad2: Sink
		
Could anyone provide working media-ctl commands for setting routes and pad formats for the imx219 + max96717 setup, or general examples that clarify the correct syntax and approach?"

In order to replicate a working pipeline from the author, I have backported all relevant patches from Analog Devices gmsl ADI branch that go beyond the 6.13 baseline upto HEAD (which includes patches from gmsl + v4l2 + I2c-atr + imx219) on top of Xilinx 6.12 LTS kernel.

baseline kernel: https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.12_LTS
Additional commits from ADI GMSL kernel: https://github.com/analogdevicesinc/linux/commits/gmsl/work-6.13/

On 7/2/25 06:20, Cosmin Tanislav wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
> 
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
> 
> This series depends on support for internal pads, for which a patch has
> been added.
> 
> The previous version is at:
> https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur@gmail.com
> 
> The following deserializers are supported:
>  * MAX96712 (already exists in staging)
>  * MAX96714 (already exists)
>  * MAX96714F (already exists)
>  * MAX96714R (GMSL2)
>  * MAX96716 (GMSL2)
>  * MAX96724 (already exists as part of existing MAX96712 driver)
>  * MAX96724F (GMSL2)
>  * MAX96724R (GMSL2)
>  * MAX9296A (GMSL2)
>  * MAX96792A (GMSL3)
> 
> The following serializers are supported:
>  * MAX96717 (already exists)
>  * MAX9295A (GMSL2)
>  * MAX96793 (GMSL3)
> 
> Known backward compatibility breakages:
>  * No default routing. Default routing has been intentionally ommitted
>    as the devices support quite complex routing and it would be
>    unfeasible to provide sane defaults for multi-link deserialziers.
>    It is expected that userspace programs would set appropritate
>    routing.
> 
> The following list enumerates new features that are supported by the
> common framework and their respective chip-specific drivers:
>  * Full Streams API support. Most deserializers have support for more
>    than one link, and more than one PHY. Streams support allows
>    configuration of routing between these links and PHYs.
> 
>  * .get_frame_desc() support. Both the serializers and deserializers
>    implement this to query and provide frame descriptor data. This is
>    used in features explained in-depth below.
> 
>  * .get_mbus_config() support. The deserializers implement this to allow
>    upstream devices to query the link frequency of its pads.
> 
>  * Address translation with I2C ATR for the serializers.
> 
>  * I2C ATR translation - some deserializers cannot do muxing since I2C
>    communication channel masking is not available per-link, and the only
>    other way to select links is to turn them off, causing link resets.
>    For such cases, I2C ATR is used to change the address of the
>    serializers at probe time.
> 
>  * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps, GMSL2
>    3Gbps.
> 
>  * Automatic stream id selection for deserializers which need serializers to
>    stream on unique stream ids.
> 
>  * Automatic VC remapping on the deserializers. VCs are picked so that
>    if they were unique on the sink pad, they will end up as unique on
>    the source pad they are routed to too, prioritizing using the same
>    VC ID as the sink pad, to facilitate the possibility of using tunnel
>    mode.
> 
>  * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
>    when VC IDs do not need to be changed and all hardware supports
>    tunnel mode, otherwise, pixel mode is used. The serializers are
>    automatically switched between the two by using a private API.
> 
>  * Automatic double mode selection. In pixel mode, double mode can be
>    used to pack two pixels into a single data unit, optimizing bandwidth
>    usage. The serializers are automatically set up to support the double
>    modes determined by the deserializers using a private API.
> 
>  * Automatic data padding. In pixel mode, if the data being transferred
>    uses two different BPPs, data needs to be padded. The serializers
>    automatically set this up depending on the configured double mode
>    settings and incoming data types.
> 
>  * Logging. Both the deserializers and serializers implement the V4L2
>    .log_status() ops to allow debugging of the internal state and
>    important chip status registers.
> 
>  * PHY modes. Deserializer chips commonly have more than a single PHY.
>    The firmware ports are parsed to determine the modes in which to
>    configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
>    fewer lanes).
> 
>  * Serializer pinctrl. Serializers implement pinctrl to allow setting
>    configs which would otherwise be inaccessible through GPIO: TX/RX via
>    GMSL link, pull-up & pull-down (with strength), open-drain &
>    push-pull, slew rate, RCLK pin selection.
> 
>  * TPG with selectable formats, resolutions and framerates for both
>    serializers and deserializers.
> 
> The drivers have been tested on the following hardware combinations, but
> further testing is welcome to ensure no / minimal breakage:
>  * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
>  * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
>  * Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
>  * Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
>  * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
>  * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
>  * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
>  * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219
> 
> Analog Devices is taking responsibility for the maintenance of these
> drivers and common framework, and plans to add support for new
> broad-market chips on top of them.
> 
> Special thanks go to Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> for testing the drivers, helping debug and coming up with ideas /
> implementations for various features.
> 
> V5:
>  * dt-bindings: max96717: restrict RCLKOUT to pins 2 & 4
>  * dt-bindings: max96717: remove confusing rclksel pinconf property
>  * dt-bindings: max96717: remove maxim,gmsl-tx/rx pinconf property
>  * dt-bindings: max96717: remove gmsl prefix from maxim,gmsl-tx-id/rx-id
>  * dt-bindings: max96717: remove minimum: 0
>  * dt-bindings: max96717: better document slew-rate
>  * dt-bindings: max96717: better document maxim,jitter-compensation
>  * dt-bindings: max96717: better document maxim,tx-id/rx-id
> 
>  * max_serdes: add default TPG values
>  * max_serdes: remove MAX_MIPI_FMT macro
>  * max_serdes: EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL
>  * max_serdes: remove EXPORT_SYMBOL_GPL from symbols not used in other
>    modules
>  * max_serdes: rename symbols/macros/types to have max_serdes prefix
>  * max_serdes: slim down TPG functions
> 
>  * max_des: fix may be used uninitialized errors
>  * max_des: fix misplaced TPG validation
>  * max_des: fix setting pipe PHY in tunnel mode for chips that support
>    both set_pipe_phy() and set_pipe_tunnel_phy()
>  * max_des: move doubled_bpp/sink_bpps variables to usage place
>  * max_des: do not dynamically control PHY enable, letting lanes be in
>    LP-11 when not streaming
>  * max_des: refactor get/set_pipe_stream_id() logic
>  * max_des: remove explicit ret = 0
> 
>  * max_ser: make VC remaps not pipe-specific, allocate dynamically
> 
>  * max9296a: add missing 1080p30 TPG entry
>  * max9296a: move BIT() left shift into macro
>  * max9296a: move BIT() ternary into macro
>  * max9296a: reuse max_des_ops for chip-specific ops\
>  * max9296a: document and compress RLMS register writes
> 
>  * max96717: restrict RCLKOUT to pins 2 & 4 because of hardware
>    capabilities
>  * max96717: add support for XTAL/1, XTAL/2, XTAL/4 clocks
>  * max96717: set RX_EN/TX_EN automatically
>  * max96717: reorder custom pinconf flags
>  * max96717: drop OF dependency
> 
>  * drop of_match_ptr
>  * re-do some indentation
>  * implement TPG pattern control
>  * remove pr_info() usage
>  * inline lane polarity val = 0
>  * inline returns
>  * rewrite some Kconfig docs
>  * split up patches for easier review
> 
> V4:
>  * max_des: fix infinite version loop
>  * max_des: fix pipe link id when there are more pipes than links
>  * max_des: implement setting pipe link
>  * max_des: do not pass routing to phy update
>  * max_des: move GMSL version strings to max_serdes
>  * max_des: split finding existing VC remap from adding a new one
>  * max_des: add tracking for in-use pipes
>  * max_des: skip unused pipes when finding / setting pixel/tunnel mode
>  * max_des: simplify remap code
>  * max_des: split set_pipe_phy() into set_pipe_tunnel_phy()
> 
>  * max_ser: clean up i2c_xlates printing
>  * max_ser: fix changing serializer address
>  * max_ser: move non-continuous mode check into max96717 driver
> 
>  * max96724: use regmap_set_bits for STREAM_SEL_ALL
>  * max96724: match surrounding indent for MAX96724_PHY1_ALT_CLOCK
>  * max96724: fix setting invalid PHY to 1 when PHY 0 is in 4-lane mode
>  * max96724: remove support for setting pipe phy from max96712
>  * max96724: fix setting double mode on pipes 4-7
>  * max96724: drop powerdown gpios
> 
>  * max96717: use gpio_chip's set_rv
> 
>  * max9296a: switch versions to unsigned int
>  * max9296a: remove parantheses from MAX9296A_MIPI_PHY18/20
>  * max9296a: fix printing of PHY packet counts
>  * max9296a: fix phy_hw_ids size
> 
>  * remove usage of cammel case in defines
>  * move field_get/prep to max_serdes.h
>  * rework stream id setup
>  * rework tunnel/pixel mode finding
>  * rework bpps retrieval
>  * pass whole subdev state around
>  * add helper for retrieving a route's hw components / frame desc
>  * update pipe enable based on active routes
>  * add support for tunnel-only chips and VC remaps in tunnel mode
>  * simplify max_get_streams_masks()
>  * add support for TPG
> 
> V3:
>  * dt-bindings: drop reflow text patches
> 
>  * dt-bindings: max96717: move pinctrl configuration into main file
>  * dt-bindings: max96717: allow a single level of pins configuration
>  * dt-bindings: max96717: use regex for matching pins nodes
>  * dt-bindings: max96717: drop extra allOf in pinctrl configuration
>  * dt-bindings: max96717: fix i2c-atr channel name regex
>  * dt-bindings: max96717: limit pinctrl functions to gpio / rclkout
>  * dt-bindings: max96717: limit pins for gpio / rclkout
>  * dt-bindings: max96717: add description for bias-pull-up/down
>  * dt-bindings: max96717: require pins and function properties
>  * dt-bindings: max96717: turn single compatible strings into an enum
> 
>  * dt-bindings: max9296a: include indices in port descriptions
>  * dt-bindings: max9296a: remove property-less schema from input ports
>  * dt-bindings: max9296a: use ATR for MAX96716A too, removing MUX entirely
> 
>  * dt-bindings: max96712: include indices in port descriptions
>  * dt-bindings: max96712: deprecate enable-gpios in favor of powerdown-gpios
>  * dt-bindings: max96712: switch from MUX to ATR
> 
>  * dt-bindings: max96714: add support for MAX96714R
> 
>  * max_des: fix POC NULL check
>  * max_des: remove index var in POC enable
>  * max_des: fix writing empty remaps
>  * max_des: skip mode setting in tunnel mode
>  * max_des: remove a duplicate source->sd NULL check
>  * max_des: set pipe tunnel mode even for disabled links
> 
>  * max_ser: apply TX ID changes irrespective of serializer ID
> 
>  * max9296a: fix typo in BACKTOP22
>  * max9296a: make register macros more consistent
>  * max9296a: switch MAX96716 from MUX to ATR
>  * max9296a: deduplicate max9296a_phy_id() logic
>  * max9296a: use proper PHY id in remaps
>  * max9296a: fix DPLL reset clear
>  * max9296a: limit MAX96714F to GMSL2 3Gbps
>  * max9296a: add support for MAX96714R
>  * max9296a: do not write GMSL3 link select registers in GMSL2 devices
>  * max9296a: use field_prep when setting RX_RATE
>  * max9296a: simplify setting SEL_STREAM for MAX96714
>  * max9296a: max96716_set_pipe_phy -> max96716a_set_pipe_phy
>  * max9296a: fix off-by-one in lane polarity when using
>    polarity_on_physical_lanes
> 
>  * max96724: fix typo in BACKTOP22
>  * max96724: switch from MUX to ATR
>  * max96724: add support for powerdown GPIO
>  * max96724: remove support for tunneling from MAX96712
>  * max96724: only set tunnel-related bits when in tunnel mode
>  * max96724: add support for MAX96724F/R
>  * max96724: oneshot reset links after link selection
> 
>  * remove GMSL2 version defaults, set all supported versions explicitly
>  * reorder GMSL versions to start from 0
>  * add support for GMSL2 3Gbps
>  * support GMSL version finding for devices using MUX / GATE
>  * add support for deserializers which don't have individual control
>    of each link's GMSL version
>  * add support for deserializers that need unique stream ids across all
>    serializers
>  * select_link_version -> set_link_version
>  * select_resets_link -> use_atr
> 
> V2:
>  * add missing compatible for MAX96717F
>  * fix embarrassing dt-bindings mistakes
>  * move MAX9296A/MAX96716/MAX96792A to a separate file as they have two
>    links / PHYs, and adding those conditionally seems impossible
> 
> Cosmin Tanislav (23):
>   dt-bindings: media: i2c: max96717: add myself as maintainer
>   dt-bindings: media: i2c: max96717: add support for I2C ATR
>   dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
>   dt-bindings: media: i2c: max96717: add support for MAX9295A
>   dt-bindings: media: i2c: max96717: add support for MAX96793
>   dt-bindings: media: i2c: max96712: add myself as maintainer
>   dt-bindings: media: i2c: max96712: use pattern properties for ports
>   dt-bindings: media: i2c: max96712: add support for I2C ATR
>   dt-bindings: media: i2c: max96712: add support for POC supplies
>   dt-bindings: media: i2c: max96712: add support for MAX96724F/R
>   dt-bindings: media: i2c: max96714: add myself as maintainer
>   dt-bindings: media: i2c: max96714: add support for MAX96714R
>   dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
>   media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
>   media: i2c: add Maxim GMSL2/3 serializer framework
>   media: i2c: add Maxim GMSL2/3 deserializer framework
>   media: i2c: maxim-serdes: add MAX96717 driver
>   media: i2c: maxim-serdes: add MAX96724 driver
>   media: i2c: maxim-serdes: add MAX9296A driver
>   arm64: defconfig: disable deprecated MAX96712 driver
>   staging: media: remove MAX96712 driver
>   media: i2c: remove MAX96717 driver
>   media: i2c: remove MAX96714 driver
> 
> Sakari Ailus (1):
>   media: mc: Add INTERNAL pad flag
> 
>  .../bindings/media/i2c/maxim,max9296a.yaml    |  242 ++
>  .../bindings/media/i2c/maxim,max96712.yaml    |   70 +-
>  .../bindings/media/i2c/maxim,max96714.yaml    |    6 +-
>  .../bindings/media/i2c/maxim,max96717.yaml    |  155 +-
>  .../media/mediactl/media-types.rst            |    8 +
>  MAINTAINERS                                   |   13 +-
>  arch/arm64/configs/defconfig                  |    1 -
>  drivers/media/i2c/Kconfig                     |   34 +-
>  drivers/media/i2c/Makefile                    |    3 +-
>  drivers/media/i2c/max96714.c                  | 1017 ------
>  drivers/media/i2c/max96717.c                  | 1102 ------
>  drivers/media/i2c/maxim-serdes/Kconfig        |   55 +
>  drivers/media/i2c/maxim-serdes/Makefile       |    6 +
>  drivers/media/i2c/maxim-serdes/max9296a.c     | 1354 +++++++
>  drivers/media/i2c/maxim-serdes/max96717.c     | 1685 +++++++++
>  drivers/media/i2c/maxim-serdes/max96724.c     | 1180 +++++++
>  drivers/media/i2c/maxim-serdes/max_des.c      | 3111 +++++++++++++++++
>  drivers/media/i2c/maxim-serdes/max_des.h      |  151 +
>  drivers/media/i2c/maxim-serdes/max_ser.c      | 2075 +++++++++++
>  drivers/media/i2c/maxim-serdes/max_ser.h      |  145 +
>  drivers/media/i2c/maxim-serdes/max_serdes.c   |  413 +++
>  drivers/media/i2c/maxim-serdes/max_serdes.h   |  183 +
>  drivers/media/mc/mc-entity.c                  |   10 +-
>  drivers/staging/media/Kconfig                 |    2 -
>  drivers/staging/media/Makefile                |    1 -
>  drivers/staging/media/max96712/Kconfig        |   14 -
>  drivers/staging/media/max96712/Makefile       |    2 -
>  drivers/staging/media/max96712/max96712.c     |  487 ---
>  include/uapi/linux/media.h                    |    1 +
>  29 files changed, 10839 insertions(+), 2687 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
>  delete mode 100644 drivers/media/i2c/max96714.c
>  delete mode 100644 drivers/media/i2c/max96717.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
>  create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
>  create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
>  delete mode 100644 drivers/staging/media/max96712/Kconfig
>  delete mode 100644 drivers/staging/media/max96712/Makefile
>  delete mode 100644 drivers/staging/media/max96712/max96712.c
> Tested-by: Julien Massot <julien.massot@collabora.com>



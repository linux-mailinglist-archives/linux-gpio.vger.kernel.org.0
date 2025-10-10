Return-Path: <linux-gpio+bounces-26965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EBDBCC5D5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 11:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DFB9B4E6B9D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 09:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BE126B75B;
	Fri, 10 Oct 2025 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KPb8gl6H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9E224AEB;
	Fri, 10 Oct 2025 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760088810; cv=fail; b=dumVVicvhlJIkdN/apRdzoNCO/K01Mncv9EU06zPYMRv+r7423wo5hUbMBed0/1xEgFu2pF3GFU1jYN563U3/55dgFMd12GoUaSO3q6vBdMBPSX7SCKbEd/U5NZcbLIKo+8RU2kaEjNat6jVT8U6zSI54yF4HJ2GBaJ64Sf0Qkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760088810; c=relaxed/simple;
	bh=k0B9t81EFbI+92V2FnIZ6qMLxrMB3glFEHI3seSi1pM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EL8GKF3PyVxnJR94qqqylhiUJxqEY49DKBuBPlEHKjahZoWrph7C4AvEt/JGiZsRF9+v5/Hp77cGqzvINsL++M/IJRiMvUcG+pgc58+L9Iwjmo8a7+eWF672sF6hkRtY7vxeknZHIrsZhy4MMZZkdsmjAJN0opoNEK+pRFfHsGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KPb8gl6H; arc=fail smtp.client-ip=52.101.48.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+SB53wCQxZyXjTX1LG4R3IK+RCipPKPUvXvoHl98RjBNdqX9HQIYJsvf2INl2M/Xgnv+jEZV9X37NlPfn5/HegDHZ8uffvV1M9ejniJem4Rpz6OgiD/YBHkqdEWvKALFtCckyCKHIzMORXi4qhh/4Sxsk+BD4eX1XGnJHwdrqmgPmOWKFMsvF58YJNvGGSUa3f/ILUGaDs5ud5XPTf/VSTtr0tOnrfvo0iRL/l6PZIvEVwAZAm16IwrffOwUr9ZBS5BvQgCSYlJdSBmbTJjLyX6CuRfJqI3OUefTaGetX/tIXjVjNR2MB/QwQ1nKCXuCB5Q5ivsC+eOuKJnR3wLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW4gYb84fHeZcFmdSssBbZbkQPHqDPXWXkTtZpif4AM=;
 b=h277l68U5fq21Y6JdB82WysZFaQ9g+gsnv22ZYzU+L+QSIOx6qDGmortSMigdtXYojNJ/c7ONf5XtvUJFWaVGkkgKq64QX42sYC6XuMtz8Cf7NSKBkQNIqTXen8RZdwJv2pwXbYVRPSD5MHOKuywEolbjAdt4nwb6si+TlgqnpmOkb28Y9HfZSZeFgI31HtFx2MFp8WkZ3+k62Mqi/ffuMIoWxW+u9fV63pPK6clgK1E115/1hrcNsVhbMQToJeWRoRZOazCq6rNC0ulwke7z6bFEPCDweCiFh9WTfJX9usNiEkSajtN8pG0V/f0FaQJrH4wYBh1zJ+cN4J0XKYX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW4gYb84fHeZcFmdSssBbZbkQPHqDPXWXkTtZpif4AM=;
 b=KPb8gl6H3ZDrIE243+YBfgVnf+Gx4MwrdWY2wblxBWmSUIQ8VXL6ElGHBmHaBd5mw5w1pjKKuoQiRB/FgjtrSqe1yS6hQAdMGmRvLNFncpG/PC2fjM9ib02PVA+zFutbndWgyubQUl+IcTIoEx2ZiEaBj1eDqprQ3ON+6ePGe0CAOiyDPowRTEiRLVyrmbkgLiCExM73opD10dXa3X2ecqYmztUyaWODOKCVlpB1jTE/TTMyZq04aWeilsHDPMltpgee5cBMUaVBdqvsNNYB7hw0xDD5VBnNZmwf91WH6eD4YxXuNq7AFs/JsBZYCyVJ0ASrqgmwlkCdmsOhryENdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:33:25 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 09:33:25 +0000
Message-ID: <b6355a70-07a2-49ae-8715-ddc052515f6b@nvidia.com>
Date: Fri, 10 Oct 2025 10:33:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] gpio: tegra186: Use generic macro for port
 definitions
To: Kartik Rajput <kkartik@nvidia.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251010092913.711906-1-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251010092913.711906-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ce2576-a132-450c-14ee-08de07e00f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eS84Z3hiSmJjT3ExcXVNa09nSGlsQ21DZTk3ZS9MUXI2dzBDS1hOUURDemo0?=
 =?utf-8?B?Z2FLSm5hVGt3UUo2WnVhZjFwOWZ3OU1JVFRqeWluenZ6dldTcU1lK1ZjaEM2?=
 =?utf-8?B?NU5xd1NaWktkMjhFYXhialFwdVZQS1ZJbko4eG5BK2RXNnlGK3dYN2JJaWxi?=
 =?utf-8?B?U01MdC8wT3MrZlBCZXlWM2xCYmtLU29SUUExZXJzSTBPdU9LZXpWR0RDUjdm?=
 =?utf-8?B?d1RWVzM5M3ZiZXhwTktCN2RhSTFzMUdRYnVNZ1FkZzYvcFFxRlNSVkMyMFpm?=
 =?utf-8?B?WjZVK1VkTWFQUm9KZjlYVjRTOWx4aHVkd2RFUm8rU0s0REM4dFN6K1UybGZF?=
 =?utf-8?B?b3QwOHFUTktYZUJVN0htOGtqN2lsWmVhaXpQczM1cms5TkVHaTd5OWV4S25M?=
 =?utf-8?B?Y1gyUFE0akI2bnlmdHNHeWkwaWZlVC9tQVNpblAvaWlTQ1R6TkNQeGpOM3dT?=
 =?utf-8?B?VS8wN043bm5JV2VqalpnNFZBVHBYRXR3TThGSWZSZ0hmbS9sVEhwMVEzaFlN?=
 =?utf-8?B?ZDhjWGcvajFhQWhOb0UwbG9sUHpKOEkzSmQyVmtZSXA2VWdkck8zSk9mL2NG?=
 =?utf-8?B?aWk3VFJhS0pTdEFUZG10bmxLVUJBWUx2aU5JaWN2ZlQ2Zmk0cEZ2TXhDTE9W?=
 =?utf-8?B?TE1SbjdYNk9VMzJNTG1PK1NSNTNvelNMY1dxZkVYY0lsMjRTbVlJQVlsbGxV?=
 =?utf-8?B?K0ZwSmhjQThUYSt3bHlOSmhrQ3hXT01WSWdpaDFsU2JKMDNhck5sbGtzaEor?=
 =?utf-8?B?UlQxSjJ0UlR3eDQzQkFucUw2TjhPa3ZmcnFkMVBDSElraDFwVWNyNXpXbnNy?=
 =?utf-8?B?WCt0Y0NGd3JyNHg2UlgrcVZXYzcvcXB5RjdaTFIwRGRybTV0V2tmci9RMitS?=
 =?utf-8?B?cXhpVWdCRGE1SEhjRXYxNUwvNEpwZi91UDN6bit6ekFMcVJQSnREMzhpRXNR?=
 =?utf-8?B?ZFlWekIwczdhc3FyWFN0THlOVTJpblR3bFFYY0JaS0lmR1RKbE9SNWsyTXZm?=
 =?utf-8?B?Mmg3VkYyTW9EcnE4UnNrTks5T1V5SHRpOXF5V2dSUjA1c0UwbmtzMlNzc09a?=
 =?utf-8?B?MHdFWU03c0MvTzFXUlEyTGJwbDFwbU15VXFQK3RwYXk3OERiYVFPY0h0TTNn?=
 =?utf-8?B?dnduYWJrU05GbFNuL2ZSa25hU29MWVpTTVE0eCtISWRkc2NocUtBWS9RaktB?=
 =?utf-8?B?cWZwNEFOcVBodTZIaUVWRldtN3JYVC8yRjU3ZkhuNGh3VkNRclg4RkVNMEI3?=
 =?utf-8?B?VHRhOVlMOFk0Y1R6dXBUZ1p5NWpDNmxmZURYa3pTRVhpN09BZVU0UjdSY3ZR?=
 =?utf-8?B?MW1kbXdmNGt3SEhDdkFLZUIyWmxOVzRSdW9MTms2OGkxcmh3RFFONkRYSlBo?=
 =?utf-8?B?RlZkeSszWXFiOVVtbWFpL1FuZ0JPdXNiT1dpWmZ0UHk2RjNKSWwwaDYxRWs3?=
 =?utf-8?B?Y0pSa0o1dVZWY2NFMEhXK0V2eDlJOVdBaU4yRzlIY2lPNUdnZXZSRmJpdHRX?=
 =?utf-8?B?ZFhHMkVLazM5aG94b3o3M2Rsck95eVhhTlY5ZnRFTmh4ejFTL0ttMDJaazFJ?=
 =?utf-8?B?TXJxVjhQcmY3SXRCOTd4WGs5Q0tjNGpWK3Y0RXRGdjFTd2wrLzJ1SmxhZjFK?=
 =?utf-8?B?VldXYUUyVUZrY2hUSStlMWNQOFZCOWxHQzcrem5lQkRhOEpMYkoxdVF4U0Uw?=
 =?utf-8?B?Vlk3ZkZXQ1NVMmdoRlF5TXNBVE9zVFZ2bDVjTXRla002RUJWVU1tcUY4eEcv?=
 =?utf-8?B?NUNiWnJaeTVXRzRDNk1kN1U4dC9nODNDSkxVZnNERVBhajVtc0FNb0FYL0w5?=
 =?utf-8?B?b3g4TkkyaFpzZ1pUWUdabVJJcUgyY3NhV24zdEo2cmU3eWltZzJMaFZDc1Yw?=
 =?utf-8?B?Q2g0V2lrcEhpNEFDOHpNK2tLODRaTUdDTHRwM3pUSTFFTmlKY3BiSmNtdjI5?=
 =?utf-8?Q?TufRQbNiHsGnMpI8BwUMyx6Yr6rOFgN9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajZJSDJuUGZXUnMvZDVXSFhSNk8zSWRpYTllSk9oTVJvZmlmc1d5eGFUdmZP?=
 =?utf-8?B?R0dtNHRhTVRwNmk4RVQ5UHlVRC9LeEJrZFl0bGpSRWUrTmUvTXFlemVBN1Qz?=
 =?utf-8?B?M2ZLMnZTQkFmbUhLc1dGbWkrMjV5ZXFXazZOK0liNHF1bElCeDhUSW9jcldz?=
 =?utf-8?B?eFdBU245NUpiRDlrNjhZZ1FwN2JrTkJQRmY2N1dBLzAxRGE0Nm1FVHBmOEhl?=
 =?utf-8?B?VTd0TGtsc09xVHZjWnBZRDhWSVk2OWdTOTQrRUNUVVlrdm4wY3JNTkMzTzFG?=
 =?utf-8?B?RU0rUk5wbWRDU2tKM1dCYWtKKytVVWQ1MStWS1JIZzduVXJOZGltakxXUGMz?=
 =?utf-8?B?bXFTSHMyVCs5emxJcUVKdG5rN0RqYkRSTmJZR0dNbzRiUk55TGF0b1pWdGZI?=
 =?utf-8?B?TmxRb1Z1NUJsU01icERwUjhENU02eG14WlRqQVhIKytYaGxaeXRpbVF0Y1E4?=
 =?utf-8?B?YnVkc0lMTEsybk5wSzdEODg2bU9sVXNXcGhxM1NvNUw1a2drMU8xdzhkSWlm?=
 =?utf-8?B?Yy9lWWVrN05vUVBOR1VNVXZQVkNpMjUyeXl2cE1jQTBaU0pEb3pCUzRkZWwv?=
 =?utf-8?B?TllOQllvZWZabDhXSElKaU5FQVhHMjIwNEMxOXByTzhGejgzNmdueXB5NTBh?=
 =?utf-8?B?NFlDbUFKaVc3eFdBVm5RUXlHa0VVcFJaVkYxS2lCdHRLWWZ3ZE1ZRDRWT2pK?=
 =?utf-8?B?YzVCcmRQaUdsOHhQZjdTYlhPcmJzd3hPbUNqOC9MZTNPSkdJLzNBUFZZSGhO?=
 =?utf-8?B?UlRWWkFhbytNYXQvU0pZZEpraUdzYU1jRUUyR010M2JFc1huS0VjMmoxMGV1?=
 =?utf-8?B?QVp6NmdxNzJJSlBVNjFiRzBjd1REL2FiMTZyK29xQnJuWGg4WHFhTHUwWjBo?=
 =?utf-8?B?T2Iwd1RGYTBOWU8yYlVvT2NnbGlxL1BYYXNZbGdKRXc0VlI2WXJ2THBRdU0y?=
 =?utf-8?B?MkVDRXY2elFldmV0TUhTbjQ3Y3NNUlhWcUMzVjhIQTQ4dWlXc0ppdDZOcHk3?=
 =?utf-8?B?VDcvN0tOMHhVRWwyQmh0MDQ3czhqVGVtRjliTUx6UkRrTVJncy9xcmRodXBo?=
 =?utf-8?B?TXd2QVkvRGNWL2ltTEhoaXVCZVhsRC93YmFTYVpQbS9UTGZDbTcrcHJPcytM?=
 =?utf-8?B?aFVNOGI0Q1A3aytScHRhZTlwUmoyV2hzQmZqd2VDa0x1VVZlSTQvSjI2Z2R2?=
 =?utf-8?B?aGZjVkJRQkYyN3IvSkE3YWhpNzY0eHk0aHQzWlNaSlJsZWpSUW13OVdyNUd2?=
 =?utf-8?B?UEl6cVJYcjk0U3RVKzFUcG5XMDk5bklnNmNjeUovb2t4ckNhWGVVc05ma2Zj?=
 =?utf-8?B?YVVnd0VIcWtydy9YalRjOU16UGkzMURuemk3SjdKUVlNeVpqSGpIZWZZNTlN?=
 =?utf-8?B?ZDAvbGZ5NlFNc0lOb0xKUmY2UWllcEVCK3BtNVgxdFEwQ3N3WmxvNUltUzBS?=
 =?utf-8?B?T3FBNHNzVytKcFRYV0lvL2JURlVLK2MyWmtBTUFkOUlPV0tld3dScXloVjM4?=
 =?utf-8?B?dXl6VFdIZDVXQnhleVVoUlIyT1dsQ3lWMkVRaEdFWDA3THRRTjkyT3dIdlNZ?=
 =?utf-8?B?QTRpR1BSUlY4dXVxQTFMOS9YWXZBcG81VUFzUjRjdHcxQnk3L2lkdElodXRa?=
 =?utf-8?B?cTN3QWN3eWdhSjNsQVlFdkpRaERSbEpuc2NwQ2N2aElZM2p1endPNVMwWThU?=
 =?utf-8?B?Z3pIVTlBaElaeWYvaFRBekd3dWsyeUNKYUhHNitPNUkyTkNRSjZya2szd3lt?=
 =?utf-8?B?R2FUejhFRDRVN005Z2VXZiswWlU0a0tvK2w4UnhEQmxXZFJWeVYvS3E3bEpl?=
 =?utf-8?B?MytxdWNhYXhYSnNBb29pc1J2MWFoVEUxS2FLdER0UWhoYkhVTXlFOGU1REdh?=
 =?utf-8?B?Q0t0aTVWc0pQbnhZMkdwbWZKclRKdWlnbmVMUUVobGdBeVpHRk9tSXRtMkRh?=
 =?utf-8?B?MVBTNkY3Y0Z4NFBhMDJlbEFjOXh2bWppa1gwVm0xc2lSS0szeHA4eWxzMzNv?=
 =?utf-8?B?ejR4TFlva3BjeXhBajNuQ3dVQ1F3RllURzY0WWR4ZHlFNVlvWmYzUmlQU2Vi?=
 =?utf-8?B?M0R5RmFxdm1hMmR4d1RTbFZrYlBaT2k4UVRGQTNEbG04WURUeDNYMmNLMVZT?=
 =?utf-8?Q?QyhiCIDY7P3bGtyKFOvxrBbgd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ce2576-a132-450c-14ee-08de07e00f9f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:33:25.1752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56dQ3YI27mBd7nJxNVxTrv8IEcKurgz+BAj6j6MiL8KY+TgwnL3jRs0XDjFzJ9BCGxc/S3Whjwn89caFBmir9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686


On 10/10/2025 10:29, Kartik Rajput wrote:
> Introduce a generic macro TEGRA_GPIO_PORT to define SoC specific
> ports macros. This simplifies the code and avoids unnecessary
> duplication.
> 
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/gpio/gpio-tegra186.c | 87 +++++++++++-------------------------
>   1 file changed, 25 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 4d3db6e06eeb..7ea541d6d537 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1002,14 +1002,17 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
>   }
>   
> -#define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA186_MAIN_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> +#define TEGRA_GPIO_PORT(_prefix, _name, _bank, _port, _pins) \
> +	[_prefix##_GPIO_PORT_##_name] = { \
> +		.name = #_name, \
> +		.bank = _bank, \
> +		.port = _port, \
> +		.pins = _pins, \
>   	}
>   
> +#define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA186_MAIN, _name, _bank, _port, _pins)
> +
>   static const struct tegra_gpio_port tegra186_main_ports[] = {
>   	TEGRA186_MAIN_GPIO_PORT( A, 2, 0, 7),
>   	TEGRA186_MAIN_GPIO_PORT( B, 3, 0, 7),
> @@ -1045,13 +1048,8 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
>   	.has_vm_support = false,
>   };
>   
> -#define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA186_AON_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> -	}
> +#define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA186_AON, _name, _bank, _port, _pins)
>   
>   static const struct tegra_gpio_port tegra186_aon_ports[] = {
>   	TEGRA186_AON_GPIO_PORT( S, 0, 1, 5),
> @@ -1073,13 +1071,8 @@ static const struct tegra_gpio_soc tegra186_aon_soc = {
>   	.has_vm_support = false,
>   };
>   
> -#define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA194_MAIN_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> -	}
> +#define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA194_MAIN, _name, _bank, _port, _pins)
>   
>   static const struct tegra_gpio_port tegra194_main_ports[] = {
>   	TEGRA194_MAIN_GPIO_PORT( A, 1, 2, 8),
> @@ -1129,13 +1122,8 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
>   	.has_vm_support = true,
>   };
>   
> -#define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA194_AON_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> -	}
> +#define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA194_AON, _name, _bank, _port, _pins)
>   
>   static const struct tegra_gpio_port tegra194_aon_ports[] = {
>   	TEGRA194_AON_GPIO_PORT(AA, 0, 3, 8),
> @@ -1155,13 +1143,8 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
>   	.has_vm_support = false,
>   };
>   
> -#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA234_MAIN_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> -	}
> +#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA234_MAIN, _name, _bank, _port, _pins)
>   
>   static const struct tegra_gpio_port tegra234_main_ports[] = {
>   	TEGRA234_MAIN_GPIO_PORT( A, 0, 0, 8),
> @@ -1200,13 +1183,8 @@ static const struct tegra_gpio_soc tegra234_main_soc = {
>   	.has_vm_support = true,
>   };
>   
> -#define TEGRA234_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA234_AON_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> -	}
> +#define TEGRA234_AON_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA234_AON, _name, _bank, _port, _pins)
>   
>   static const struct tegra_gpio_port tegra234_aon_ports[] = {
>   	TEGRA234_AON_GPIO_PORT(AA, 0, 4, 8),
> @@ -1227,13 +1205,8 @@ static const struct tegra_gpio_soc tegra234_aon_soc = {
>   	.has_vm_support = false,
>   };
>   
> -#define TEGRA241_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA241_MAIN_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> -	}
> +#define TEGRA241_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA241_MAIN, _name, _bank, _port, _pins)
>   
>   static const struct tegra_gpio_port tegra241_main_ports[] = {
>   	TEGRA241_MAIN_GPIO_PORT(A, 0, 0, 8),
> @@ -1258,13 +1231,8 @@ static const struct tegra_gpio_soc tegra241_main_soc = {
>   	.has_vm_support = false,
>   };
>   
> -#define TEGRA241_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA241_AON_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> -	}
> +#define TEGRA241_AON_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA241_AON, _name, _bank, _port, _pins)
>   
>   static const struct tegra_gpio_port tegra241_aon_ports[] = {
>   	TEGRA241_AON_GPIO_PORT(AA, 0, 0, 8),
> @@ -1280,13 +1248,8 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
>   	.has_vm_support = false,
>   };
>   
> -#define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA256_MAIN_GPIO_PORT_##_name] = {			\
> -		.name = #_name,					\
> -		.bank = _bank,					\
> -		.port = _port,					\
> -		.pins = _pins,					\
> -	}
> +#define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
> +	TEGRA_GPIO_PORT(TEGRA256_MAIN, _name, _bank, _port, _pins)
>   
>   static const struct tegra_gpio_port tegra256_main_ports[] = {
>   	TEGRA256_MAIN_GPIO_PORT(A, 0, 0, 8),

Thanks! Looks good to me ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic



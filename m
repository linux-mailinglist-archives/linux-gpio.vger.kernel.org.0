Return-Path: <linux-gpio+bounces-10613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4316F98BABA
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 13:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2BAA2828F6
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 11:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272EE1BFDFE;
	Tue,  1 Oct 2024 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tMosP6Et"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF741BFDE2;
	Tue,  1 Oct 2024 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727781226; cv=fail; b=KRK55C+bdT7/yzrfff5pdmwhkR6hKb+Wc8A0+azByil4g2kHLyzWbREK2f3H2YF0Ugn2PBEkzDNbBjCTS0n5Vy9eTW39kPAuZu0ULjjoXYfRJfmjIa19sBNeWyPr4lTM2sPu0TUnCsyAB3sms7UnzR1h6Kj3DtCndpvDPaXtrK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727781226; c=relaxed/simple;
	bh=/qnlXlKttRG193aZHkRq8b+U38ust+7fqhi89BScAYs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C7QGODj8M6KdpfmfRFynxnvMrVuiVSVYQecp4CqMv2KJA9thhSkRr1JNyNwEHFjXa2KUeTFuKnaf/+kxaoaGN8XKS2gxCPKZaj1TpZ6VGjW12uM8o4MvLYur/AEwz6lF7WpNBJ+68n65doLUjGiYosUg9JXNoq8yJIa9KVpMWkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tMosP6Et; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVFreRzEwqsbbGsa6o2jYWd1cT3HX9MkTDPMx0RouRNVt5k+E580HUs799PdYBskLoFis+qbvBV1iDWHUzHiDvbHSiWaJKiLEZDH0By6e91nv57rSNejYQbsSp3qPHgna30zUdp7Mx9x/VPymi1u4K34zzhrd2h3Jvt7lUpMmQTZMW3n1/EcPi08KPxaGFoSn8LpY80CMAHYWr6kiUyfA4tkmRNpa0oINU5UdtBSv+zJvb74S9RDisyyoJ1r6+pWPlsjNq1/VAzhIsyC47Jeebq50GhXXlM0TJcyEpr4RFE+KHKME5dyrhzrDdlbRjioYwCEtPFLA6MFYiTOkCbTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDgiGhgltdU0dLdZLhsO4UqIxpsqq23ywQdjuIUlfJY=;
 b=pUvIpcKFlZZmezHmsnaeF7IlTTU1kgwq/oR2m1qMm2VaB+RUIBCIbFd2MHV8l8RnTRAETdxJu7fPcJU9smBqD9HVukc/Vm5rK68Zpnt61WZnLW+HPgX8uqz8RcEZZdtvZndftt+dp0hem5beBrlkbB3aJFpt6PxHls9cnJLN9ahFrKxV9wJM6Epk1wJivSPItkpL/M+3VrLUe1YhzsbTGx/tLj2hPel62yHGcWYv0djgpGabfXTbUQxbRD23vB+NuwtSSBwhjoCuz1tPwewhkRTuCq+Ybu1Kptdru7xoYLkAEgDmDkjuF4Rj6METPqznpUtw4ol/LW+wcsqTxyS4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDgiGhgltdU0dLdZLhsO4UqIxpsqq23ywQdjuIUlfJY=;
 b=tMosP6Et1npDExXbF5E1wU/0RT8Zvm7j9+GOmApmXusZDMEHmk6o9D8VX/LRsZk5TrcF339N6BmgjfU1UrML0H1HJ8q00EE8ixQpnihcYAMTEYJahBOhNCN1cRKSsLp+FchlFcFKdlh6iqhVKy4arP43iGV7ALLFihkX2+rgy5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 11:13:42 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8026.016; Tue, 1 Oct 2024
 11:13:41 +0000
Message-ID: <36b70588-9ef5-4686-89f3-32603022f242@amd.com>
Date: Tue, 1 Oct 2024 13:13:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] gpio: xilinx: drop dependency on GPIO_OF
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240930144804.75068-1-brgl@bgdev.pl>
 <c56f17e9-8da2-4894-9000-b74b7cb66e86@amd.com>
 <CAMRc=MedULpeE5Dwb4W-ten1sOWr_+6Xgb05VDW+w0_9ZxbMqg@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <CAMRc=MedULpeE5Dwb4W-ten1sOWr_+6Xgb05VDW+w0_9ZxbMqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0043.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::32) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6e29db-fc37-4489-079d-08dce20a1b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUpIWDl3Y3BJQ3MxNFJwUE5vdjRTU092L2NuTk9NRlAwVnBNTWtVbkQrbTRL?=
 =?utf-8?B?dXMreHJ0S1QvS1hpY3c3ZWRicTZQYUdoNHk4b0Z5M24zYXFuT1VzMG54QUsz?=
 =?utf-8?B?WnRKalVGK21uQXhYbnI0M29VUkFaWGlMY2I3Tk5DN3R3ZUhGZW44TEQ3REU5?=
 =?utf-8?B?UjkrdVpzaHIyUWhlYmZjcko0NENNd0JvU2dnNXV0eEo3OVVVb2tkSDlFbjJJ?=
 =?utf-8?B?eEw5RnpNMCt6T2dabFJ4K1NpaG5UU0FGQmJiWDFxQzFPK1k1U3ZIWnc1V1Vk?=
 =?utf-8?B?eG93MHRZWG51UmRETDltVEYrYnd1aFd5d05jd3VXNTExWTNoalU5cDBNbDYx?=
 =?utf-8?B?SVNEYkhKNzhRNmNpWXhUeGtKTzdRamJudklucWxGbnlVK1R1UVRpMGc3U0Rh?=
 =?utf-8?B?NGl0RDF3cktPeEFycUJWZ204OUh1ZXdLWnN5bUU0QlZBRmVhalc2aXlQUXlT?=
 =?utf-8?B?dDlXaDBGVTFzMTF1MGlkNjlOS0xvOGRlY2hJb2I5QnA1TmxFZjJ6WXk0Y3Ju?=
 =?utf-8?B?VXFsQy9LSXAxTTdDU3dNVXFSSmd0SEJBWTdFdUkwUE9nNDgrckNYakZxWnlV?=
 =?utf-8?B?anNmdEZmb3JpTVRpVkdDQnNnYXF6d3ZKTzlPajRPTFNkVVRVODdNdlp4S0V0?=
 =?utf-8?B?UjdmR2EyV2xoUVhzMEJuZ3pEUVdVNVc0eUhjSk5USXA0ZDU4aXpscXFPRGtW?=
 =?utf-8?B?Z3Y3aHlJclB5OVJYOEt5ZDI4Mk5IS2E5bWJYZWUvb29CbjgxQVhiTzhzakJ2?=
 =?utf-8?B?SFlhYy9WS3I4empHYVhXSi9MU0RBamkxQUtvRnBUbmZTSjBsWHhMNnJoMkhN?=
 =?utf-8?B?UEx4RWYzenI4ekI4Vk4zcGtrNSt3VHQ0RTM2QWplYVRoUFlVRzRPb2swaHlO?=
 =?utf-8?B?cXI1bE9BK0pKKzN6MDU0VXJOS0VJT05leE1TZmZnNjIrTUNYamdQdjNXVFBm?=
 =?utf-8?B?RFFEdmJwUVNUVUhXSFBuSlhEVm9pNGZQQWV1SmprMGl5STVXcG9BWm1rd0Ey?=
 =?utf-8?B?aVNMcXRzYTJrSFVaOTRvSm5JTGNPMDF1bEc4c1F5RzdSRVhHL3Nma1VPcFF1?=
 =?utf-8?B?dWNxOWNpQzlheU1TMUR2OGVUYlVYZjY3V0FlNEtaQWl1ZVZwUEV2VzJuM2F2?=
 =?utf-8?B?NDJtNFV6NkpqNDI4UzdkUzk3a3RRaWJLTDN4Y2xKMjFxNHBlUi82Ti80YnlB?=
 =?utf-8?B?QzFZa0VOd1dYUGhCQU5SMm43NkFhZCtQejZKNmpJeFNiWEZ6VWsrRll2QWNI?=
 =?utf-8?B?UzFpckZjRlhIalFUTTZXSHU0RUcwSDNiSHRnYzJZN3pGYlJDSW9zanFkZ1dq?=
 =?utf-8?B?MUlUSnZ1OVVFMFZYbWVTT1IwVXk3T1c5YU1rUDFJcFEwaGtmQ1diMGUwTmZN?=
 =?utf-8?B?cEUxb3RVY0p1T0ZYSVFhUm9VUGtNOHlGNTJ2SkVOOERRTVVLM2EvNFJMVS8w?=
 =?utf-8?B?c24vdzA2UlBDMFlWcWVtQmdnMlZPbHNJWksvVTFlVWhGYVNMMDdBNVAwbEhp?=
 =?utf-8?B?ZkVvdmtEc1hKLzArUGEvSHJiTXhsNUdnMHUzUU8xOWtwMGJjZW9WMGhsZGZh?=
 =?utf-8?B?d1p0eEJYMnF5NVpkOE9SU0FSY3lmMnFHZ1lHNmtraFgzKytmRE11cDdPZHZh?=
 =?utf-8?B?b2xXMFJmSkd3eThTTWNVZm9SZmZGeWhxSWRIejBmUVM5cG95T0lWdzVTci9H?=
 =?utf-8?B?SXZqUGI1M0g2L21tYnVWbXREQW9YbVZuaVJkM3lkbzdBMEx6cEtROHpjU1FP?=
 =?utf-8?B?TEFlYm94aGdBVmNMaXN5cDNlSi9SOG01M3M1U0JUR1VTbXdVeUJOaExtYW54?=
 =?utf-8?B?SWlUZ1VxS2hJbXMzZVJwZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHV0bXJoQUl6SGp3QTFPa1VVT1Y0NndvangwaytDM09aU09pdzN2ek1HdG5B?=
 =?utf-8?B?bWl4VmJJeW9vWUtpMURDcjh2akFZZkJaS25oK0QrWHdyaDV5QUkvWUJCOVBY?=
 =?utf-8?B?N0lPTnlRUWQxMEJhMko2cHNMZkxLLzY2eDNKb21DZWx3OCtFOFdQb2Z4bVNp?=
 =?utf-8?B?NE4yR0FRKzg0dTVNWk4ydjFzdjdHWlQxSXQrUUJGellVMDZySTBtYzNWZ2Fy?=
 =?utf-8?B?TWVISEkrSXFsOUxHVDJIQXdWM0xCRmU0TUVsd1NSdzJydUdlc080eHZoRlda?=
 =?utf-8?B?elJScFR5d1Z1S2dPL1JZcG4yeWE2ZVhQVlhJZXhTczduSzBpVU4wZ2FRMXNq?=
 =?utf-8?B?aVlmdjgyQjAycEZBdmJoL3hMZHlQTzdjZjFTWDNEK244aTl2cTJ2Zm1UVmZY?=
 =?utf-8?B?NE9SOHRyVG5IVDQycUhpOVpMV3FLRDkveDhIWDdFNjBjeEJKb0c4VEd0MUp6?=
 =?utf-8?B?TFhzMUU5QXlEY29kRE9RdE1vRmtiWVd3TnJRWEtvMTNqQmNrc2VsTWQxMmxr?=
 =?utf-8?B?WElnQkpmWTNnK0Z3cldZb0IraFFsSk9RYXNlWUhaMzVPRGFNRnVkb3VzNC9E?=
 =?utf-8?B?Y1BLYzhQQW82dGFDM3lkYyt1c2JITzliaS9Pd0E3K1lhdXM0L09WSHlsMWhC?=
 =?utf-8?B?UVZScTZZVjRHWGp6ZWFobFlRKzRaMkFIT2tTTHZXSjBycGx1MXFPNUpuR3RS?=
 =?utf-8?B?UW1ZOUY3SEFCeGNmbzVFdEF1N2FUc1ZOOFl3Y2Nscnh2TzA3QS9sU094YjdH?=
 =?utf-8?B?MXZtNlhWZFIxbmxZc2hMb1NRYVo1YkxkU1FpRm56WlFLZUgwVXU3dGNTZ3NB?=
 =?utf-8?B?SzZiQ1JmZG5rbGZQWmZxZ3dIOUpnVHhpTC9mQThtaFhvc3BmZXZMVVNWY3lm?=
 =?utf-8?B?ak9zdFAwZG5DdUZNU3VDTy8wZDlEM2ZRcGJ5NE5WNFMrcWp2aE1oTjkyNG5x?=
 =?utf-8?B?V3hsK1VJVzJZNFdmVHorMEl3K1AwdFdsZmhlY2dyMlVUckRPSVhVRURKb3k2?=
 =?utf-8?B?SVVaRjBqbE1UQkFXT2FiY3M0OE1SZnFld0hmcUIydW9sU2o0elVTM0VYT01j?=
 =?utf-8?B?czdNMG45ZFVnVXhsZG5FOENKSWJTVW5YdmtFQUk0clZXeDYyb29YODlxeVFW?=
 =?utf-8?B?UTVHbi84Szc4eGptQW5kRjNDQXR1TnFFbUtFWWpWbXRRME1IcHhmVFlXWk1W?=
 =?utf-8?B?VC8wcy9HcnBqcHpWN0JRYVBrTS84Mko0NllkUFI5UUZzNHpzU3JIak04T2Fk?=
 =?utf-8?B?UHFydzlTcUc1WEZMeXZUNm45VWNVSlR5eVRZYmFlTUhMa0wzV083djV2b1dk?=
 =?utf-8?B?c2w3L0FvMnl0RHpnTm5WeC9ZQTZhKzdZSERQRGpYYVIydVBOTEs3VFN6ZXRT?=
 =?utf-8?B?NnkrQW9XZktiRWtGMVdZZ2VlWlVuQnlLa0o1bWY2cE9CNE5iSDFaRVMrWjk1?=
 =?utf-8?B?T1BHbFgyenUxUmEzazFtNk5oMWNCWVJacnFNcDNyTDBvdTBDYk5xb0dWQkJt?=
 =?utf-8?B?SEhvZFU4VGpxUHlFZTlaaDB0SmtrTit2dmxBejlNVmt0TktBbk9vRGFGU0pJ?=
 =?utf-8?B?K0JqWFBIMEQ2dm1pOEtCblhwYXZ3T3RvYkFXY1NGQ241YnpmYWRMcFU2RTRw?=
 =?utf-8?B?aWlIT2Y0M2VOOVRVaVFKUlh4a3RtSnhMZzl2Z2xDTGQvYUd3VzU0cWVvMXlB?=
 =?utf-8?B?OTl2UnkyUDZrcXpQTERKaVFmemhaZ1ltUFU1WTN6blJRMFd2YW1lL2FNUjB3?=
 =?utf-8?B?aUNlS3p0UVNKd2NNYlV3bUdXL2Q5eURRZFQ3RkZlQUM1Zm9BVmhYdlY3R1Rz?=
 =?utf-8?B?R2dXaTlhUVp3VkhlclRoNmFYNmxLSVIvMm4vdFdpZGVJU0Uzd2twOVhCVmVZ?=
 =?utf-8?B?TjFiMlZZT1FSWmJjNXdaSmJDT25VNWVUTFdvSnhlZ3JtRGNHd0s2ektJVUZt?=
 =?utf-8?B?REt4S2Nxc1RkMkovdVpDQ3R5eWJlQWhNb0ZhQytvcXpRN3o5a0cwUjJxb0Rp?=
 =?utf-8?B?MFBEWXpJK0dpOVV6UEMzeXR2RVNYZXhjTmNneHc1dzl1RE5TNDBwZUVVWU5z?=
 =?utf-8?B?dWtMN1VnakV2YW5jRVEzMVRXMEdRKzdLQ2t1S0FQWkFrczRrZ3E5bUhTRzE3?=
 =?utf-8?Q?SnbTGXjULPBB1H+AyGDWWJvF6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6e29db-fc37-4489-079d-08dce20a1b08
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 11:13:41.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVMwEeETJvaCwUpbpgbNuJrBolCgsEkwgdCAvvZu7ko5pDYJikj9JvzScFiNMsAc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011



On 10/1/24 12:44, Bartosz Golaszewski wrote:
> On Tue, Oct 1, 2024 at 12:30 PM Michal Simek <michal.simek@amd.com> wrote:
>>
>> On 9/30/24 16:48, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> This driver doesn't really depend on gpiolib-of being built and can be
>>> compiled without it.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>    drivers/gpio/Kconfig | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>>> index d93cd4f722b4..0d676c96b72d 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -796,7 +796,6 @@ config GPIO_XGENE_SB
>>>    config GPIO_XILINX
>>>        tristate "Xilinx GPIO support"
>>>        select GPIOLIB_IRQCHIP
>>> -     depends on OF_GPIO
>>>        help
>>>          Say yes here to support the Xilinx FPGA GPIO device.
>>>
>>
>> The patch itself is fine but it should be likely applied as last one not the
>> first one.
>> If this is applied like that feel free to add
>>
>> Acked-by: Michal Simek <michal.simek@amd.com>
>>
> 
> I think you may be confusing CONFIG_OF with CONFIG_OF_GPIO. This
> driver doesn't depend at build-time on the latter and this patch can
> be applied right away.

ok then.

Thanks,
Michal



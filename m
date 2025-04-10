Return-Path: <linux-gpio+bounces-18665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41CA8419F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 13:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA8037AB3DC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD21210F53;
	Thu, 10 Apr 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="ZDQ5juyW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2099.outbound.protection.outlook.com [40.107.255.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA6267F7E;
	Thu, 10 Apr 2025 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744284162; cv=fail; b=rkR5ZGi7pTlm4wLDSCf3YigS3QrqGx293n5nUxpamVPsoSDSwAQF24QHsttfB8IbpJRFWE8ZnAYRnBfUQIs582LUfrs4LSfSpKdEJeViEVCx31toVo+kJ0HkEb6mti08xfe/gLvzMNT2YG4mTZFA1A3NCbAQKiFv6nIZd/LmEoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744284162; c=relaxed/simple;
	bh=MjPH7HxrPC93YYGROrhy0HxBdewCJSDE4Hxx2jG4x74=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=D0qqKVTAj1SsrDfX+lg9jSUmHKsuy3aL+Vh4jUvQ1LxJnNQxMf3FrDvbUUh79g4ZPHZpIuk/sKXgHDW4ohJXeXFVrGPhP/g/N3xMk6k/HeiT1yLZ/Ke8Zcmuygx0UNfK8/PgeXX59xCFOGq+dQz+1zZwpTOoOSCsZNS9LdzRWkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=ZDQ5juyW; arc=fail smtp.client-ip=40.107.255.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ik2GXEnXSC7dalAdBA1pinDOFj/Cq37e0Ht2xJ0X/EgqcsY+YiBVBbhDjf34P/3qJPdpyXFYpQVgNMNFXz0Q9SK93fr8yLVUmQHDYS4Dx56RVcVxkDTEv9TDwGYLepl7j5H4T5G53woT4s5o3e8blAgu+nGRltVouvs6PoD3ALOJWSRfx8qnAxh6nJG6LAoYlbYRw8rFoBO4GCywkYYbLjOk8dEzKm8Yp977SnLQNKGKYvpxEHtaGbANVAAvUXJWXVM+GIpaOgkYDS9I1fgc01sJb/mpTca6MA8I8/DeQm6ZUmdskW0bVczg1h3UOsY0EjQE/Cu+smv8Db3tMhsyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6ndgXYC826J5OhMFsSmKE37SNCh3HrFk17MRwaJBlk=;
 b=IYW1g1T0NHaHP4GiJ6yQxuV3oZ79up+TUXW+1FiAuPT6vrrCAfce/or1kHBIrQG0qExK+4oHmW1TQZkVRw7WgmvZq/OpIkXHBMZ4NdBRq+GwcV8paKwoKuHx7r0YJwDH6guCDchhyirU/UNdBvwzw3uKAZSK3lPbT0doMeOlRNmizIzJO5jXBkdxCEslzV75ylBF0gzZa3plilua4kNGxyOCp2Z8sNkhE3HhPvN1Upff0iMYacnOIhzZgtw00eIMUtAFJPzMoMoLr54mXDxMsO3I6+dynNeBFCu8JxWQGFqBzbLSanf1U0+XzSHs/LAXTp23E0XhJL3CPRY30nmRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6ndgXYC826J5OhMFsSmKE37SNCh3HrFk17MRwaJBlk=;
 b=ZDQ5juyW1+fLzMnSPA88OcXeOp5z50t3EkgMglEH15JSIXcJ7G/DAKFrKE4WatPy3KxmSchDxq1eupGtvlejB7TleXOwOT011NfxMwaBdvjtkoSwLkRtd/Tta+8Xf02Vg4LSrqEzTgq4xYWLnblUo5X6hQ9rtlNWigBu8aBqb9DSlfcyn7/gYUY5a8aiwEzWtRUpsvuUcICe8acCloE+JBnJVmm98/g8yXOcHd8RFfLqAVTq0BzQxxRN0Pu6K+ALJKWNDMldp4fIUu+7HC6T+HSdGlGcQKtRNBjiVuSL+PF9zCIKLMONYHvi8uXspBStkDdRoRXSSeXtUDCqyiExVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYZPR06MB5735.apcprd06.prod.outlook.com (2603:1096:400:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 11:22:33 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%5]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 11:22:32 +0000
Message-ID: <d6b14c26-e70b-4edb-8661-b213e3fed9d4@portwell.com.tw>
Date: Thu, 10 Apr 2025 19:22:30 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v3] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com, jesse.huang@portwell.com.tw
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0031.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::9)
 To KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYZPR06MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: 936cb190-c91d-4ea9-8193-08dd7821fc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVNVNnJXRUJGSVM4ZlYzR0xDM2NmVkZTMDBvTS9IQzZvK05SREhiRitlcDRz?=
 =?utf-8?B?WkNWR2YwUm1yQVFzVTd1U2VuUjg0VXdxMnUybzR0NXhXNjRKZnN3K05QdGVB?=
 =?utf-8?B?NWp1K095UnJqNjZ4T1BpeVBkMDJDVlQ0QXpxaisrejFWOWVRY2hkMG1OMEJa?=
 =?utf-8?B?WnJodzcrUHNXMUVSbzJlemI3OEM1OVoxWTRObzlpR3RZbnJPYkVrbnNuZWhB?=
 =?utf-8?B?YTlFcXNOYjlxazJuV2FqR3BjWkgyWng5ZzNhYjdMZ21DV21GY3IycHdmaXBz?=
 =?utf-8?B?N0NFVWg0WGpUbkpOMnZycFNhV1hxU0ZzQnhjTXBNUXZ1MDJsWFN0R1pqeUsz?=
 =?utf-8?B?NEVJTTVONm5iWWRodjBTTHlyaWRNWlFNeHBJWEgvKzVGcU51ZndJWTduVndE?=
 =?utf-8?B?ZjRRTVRoWTNsSVpDY3owRUJ0dW9URTZhRmg0cW1HK3BSWUlPMEppQXlCdEZz?=
 =?utf-8?B?TzNtV1k5YjlYRzZZaHhwOFdISHNMN2pJZjRHR28rcXB4dmVhd01ZTEYyMmIw?=
 =?utf-8?B?VU9rbWd0dGlDQVRDQVRPaFJtMGdzeU0yaTFXQTAwbk5vTkpzNVh4RFhTNHZT?=
 =?utf-8?B?U1owaFJ0OHI4cFRva0NEeS81MGV5T0EvOFlBQldXSE1aYlVOR0lNK3k5aEtF?=
 =?utf-8?B?OFpIUnMvWE5BbW9wWndGNUNsbUtVK05vU0hLeTdqeHo4TXBOQ3hNRU1Fd3FF?=
 =?utf-8?B?WW1QcThSTm9MQkpVSEszZU80YW0xcW5WTCthaGludndYVVRtKzBIZ0N5ZHRJ?=
 =?utf-8?B?dzlCTk9GeUpNMkhLcFdSeWNFdkRlL2JMRHFRQWM4UXpkSzZSdXFTVVRPNDZB?=
 =?utf-8?B?eUJYREpIc3lOVDJWNmcwUWxCb3NVMGkwa01wdWoxeWtDNFRxSWtMS2VaL3B1?=
 =?utf-8?B?QW95aEcxMDRzUzl4VmxhNGpRaDI2SzBKNUtVNWpMK2h4OU5jQjJpNkFpcjhO?=
 =?utf-8?B?b0JpNit3VGhPcDB4bHBWMGJnZTBWNmtyQzh4L24vckZTbW1tN1pERmpHMENP?=
 =?utf-8?B?ckhzTXJrZVRpYUh5cU9ld3N3M3BIN21xNGUyeUQwb01zc2xUMEVsSEdIcnEw?=
 =?utf-8?B?YklmUUt3cndEL1ZtS0htcHVtemVwWmdjeWxjY1F1QWl6VklNQmxxV1lDMy90?=
 =?utf-8?B?bTBmUHNyUmY2VE80cFVqU2EwK1liS0M1ZEh2NUlHOFFaRWk2cmkwa0pRbkY4?=
 =?utf-8?B?cERMMDFDa3N2aGFOYjhLM0FSQjRMSGRTNnB4RFNxQTM2NVlYam9USjVqT1Q5?=
 =?utf-8?B?ampYa2xWdWx1WjR5OVpWbkd6eGEvNWpqaG9TVFllSFZEb0plUS9VYVU3RDdt?=
 =?utf-8?B?Q1RuRThtTEd1MStGRk42Z1JNS2UvZnJJUUxyU09LSmYvSUFiZHdhSlhGb2ZJ?=
 =?utf-8?B?MWU3QVhBQVZtREJuanpBMkc0M2Jaa1MyejBWMTFrMGYxRFBmek92cGhaWGpT?=
 =?utf-8?B?RzdINHZSd0ZsdG1IekF4SGYzeGlNcnBKMHdpVmlSWndXUU8rKzJDQnVXMkFx?=
 =?utf-8?B?ajVHTUdoV25ac25Rcm9FWG5jZG9jRG5kVHVEako1dkRqQzZ1dlB0ZHpVY2ph?=
 =?utf-8?B?NXk0QU5tWmVtWWtFZjdMcFBKT003bVJIUVpKTFI4RWszd3dVYWFnRDdNWThz?=
 =?utf-8?B?MzNmL3hpNWFxNHIyazVMRUQwb0N2dzZEb2s0bVoxem9Ya2wrTFo0R09wRFpy?=
 =?utf-8?B?emZ6NjBkMlRaYlZYbkxsdWFKc2hFYk53WU96NFk1bUlFcXdmZXVXUmtGWGhC?=
 =?utf-8?B?RWZMU1BIemQzeWRra05idjRpK2ZEQi9vUTlxSE9sem9VNm1pdVFXeE94M3ND?=
 =?utf-8?B?SjNBK1ljc3JDY2tTeVRWTWFTMnJ6cllhUjhtUDd0MTJiUW1TWjJydmNHY3hY?=
 =?utf-8?Q?tLf1SKGGRnYa0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0w4VmtGdGFrZnMrTFgxek10V1pJQW9CNTFSRlFnNVp6U0JqUkhBeDlZNFFN?=
 =?utf-8?B?M2U2amxiRHlrVFJSSml6N2x0NHhyMC9TMmJPR2VyRXRvVkhaRldaNnNPSnQx?=
 =?utf-8?B?MkJBcVNSTDJLZHFxQ1Vvb0dwYkNGYzAxcFMzZE5GaE83QWFFNHhVSTRuMWVi?=
 =?utf-8?B?S3NNRFh1b2t0b0huazFsWkFtditYYytvT3k4dHV6L0VqR3V1Ujh0Yzg4QlVa?=
 =?utf-8?B?cmZrTDBYZnVjL09aZlVQcm51NEF4SU5hRElXMStSTlAwMzRwais1ZkhQRmsy?=
 =?utf-8?B?c1lhclpiNTFXNWdRVWlzQXM0dWlYRGxxRnhXVU5NT29Da1VIZkhQdmlvT3FV?=
 =?utf-8?B?eUJFNHNMS2NaU01BMHB2OHRpUFFkZlJxMlB3ZWNyYngxcEhvY0J1UXVDV1dq?=
 =?utf-8?B?Zm9WaFJWQzE5eVZreEczSzQwN3pHYzFMbU5PUFB1SEM5aGVWUHpyalpuNldy?=
 =?utf-8?B?NjdKcEU1MnlxVHgvZnUvTForUjBxa2Y4bitEWEs4RGhSNFZabkZhbU5KbmRm?=
 =?utf-8?B?VXljVGxjeEhxSitGTUhPdjh2UVo1STdHSEp2S3JpZllGanB1bWhXZ3VLN0VT?=
 =?utf-8?B?Y0cydEN2WnJzNGRWSTFVSUh6bEloMGpCVzFoemJHcTBVVVBoU3o0T2hTY2RP?=
 =?utf-8?B?NG1ZaW9lVkFrMGVKSUFhNnBoSHZHamhaTldOSEpSdkVqK3JIelFDOFBIS2lI?=
 =?utf-8?B?RVF1LyswdkJtUjN6KzNlVHcvOUZFeG5MMitlUS84MlpwVm1QN0Q4ZGluMis3?=
 =?utf-8?B?bzZpRHJsQytCa2JjOHM2S0p0VXFyK3lNVFdHSmtEb3A1S1UvbDhEQ3Z1N25z?=
 =?utf-8?B?SHFETVdIdURvZkRZNFNadEtpVGhEb0Nsd2RkbmZqckZqdXgya0g2UkUwS1cr?=
 =?utf-8?B?VVpXZEZyV2c5T3IrVWZDbExKc1F2ZnYxTXllcU1yWDBLVHJxK2p5VTNFaXJv?=
 =?utf-8?B?YTdoVE9lRWxodDdTS1dRTWIwUitQS2ljbmtRaktlQjJzdS9ieldKODR2Ujla?=
 =?utf-8?B?YWJEZGlFOWNWaUV4ZWZuYU1Nbm9mZndNL1hoL2hLcjFJMTZSZHlMZGp0Y0lJ?=
 =?utf-8?B?M0V0cEN6VmVGdFNhMWxYd2srYnlzNjNvUW5vV25xOXQ0NEYwdW9oSm9UczhY?=
 =?utf-8?B?dXd2azQzQ2NDblhSRW9zT0Zud3dsZ3pDVExwMFZOU3dCQkdKWHRiNUUwbmJl?=
 =?utf-8?B?d1FhNURodnpXeW9mK21wSk9JcWdxRW5kRDBiaHJDZmFWcG1iRElMMlo1Nzd6?=
 =?utf-8?B?clIrRVhCWFQyUU5WT25aK3RqM3pJM2NORGVRYTBBNXBmRGhQcytCSi9VdTd6?=
 =?utf-8?B?THZncEJMc2ZWd2ova3Y2dlM0cUUzdlE2aDF1T2ltakhFdklZWUVBMndOVmti?=
 =?utf-8?B?T0JncDBTL0RJc2pBN3pPUDVnUi9rSTJQUWx1emgzc0hvemc0dFhhdmRwdTkr?=
 =?utf-8?B?YS8xeGtocXhLQVBqb0dTMVRqWnhJREo4NHQ3SnFDbkRLQ3dlUldXTnpaVkdq?=
 =?utf-8?B?bHAveW9qa2F2TmpUYzNDSzVWczJLUXVwY3BONUNyTUVGQlhZS2ViYTR6bnox?=
 =?utf-8?B?VFovbHcyMElmcWhtejdrRTFPUVRtSzRaUFFQUXRONnlNRG55a01LMXdCWEEy?=
 =?utf-8?B?aWw2SkhISEIxL3N4U3piVDdvTkFCb3NQaXN2UVpLdDVaNi9Hb21FOWZtbVpI?=
 =?utf-8?B?eDNnWUVQOUdJVDNlaUpvQWQ2cnJrbzlubU5VOTRFRzZMREhVY2J5L2R1NmE3?=
 =?utf-8?B?SWw0SytuKzRmbmwyaVg3SFo3cXozTDVtOVkwV0E2Vy9xQVFlK2lyL1AzTnhr?=
 =?utf-8?B?cDNlSHVCL3FmcGJUN1laZUVmOEhmNmFpalg1dDBVbVFBVWFIR0JMeVhzNXFP?=
 =?utf-8?B?V3JCUElwcHBiL1FDb0puQjUrRFlZTlRKbFpRSWExbUtXMFM3USt1SnhzVHk5?=
 =?utf-8?B?b0xCUGRYUjNiSWthYm05L09mdTA2M0NtQ1UvbXFiRnY2TzVCcmpDdFZlTHh1?=
 =?utf-8?B?WGRoQmlISlZiQk94RXJHdUVFdHFEbVU1UEpCNnNKbVR0RHFLZ0pjb3hQd2dt?=
 =?utf-8?B?UUovOEtFajhtSCs5Y21XL2E5bmZxN2M3QkFWdE5VOVQ1VStmTW1PMkRmR2JH?=
 =?utf-8?B?TDdUZnA1cTNEK1VQaHIzZS93RkhXckZKSU83elR5U2hmMHVZRjRrOHR6aWo4?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 936cb190-c91d-4ea9-8193-08dd7821fc4a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 11:22:32.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9x0/Nw1DVaZUDbg0xC3IYxG6wVUjfhhAAVPyKgJJ+elNfxcF8/ixJKJCRsITFR/CrgybvK4pd1oDV2alO7bB9KRx/X4NjNBNwY8YC40G+Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5735

Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
It integrates with the Linux GPIO and watchdog subsystems to provide:

- Control/monitoring of up to 8 EC GPIO pins.
- Hardware watchdog timer with 1-255 second timeouts.

The driver communicates with the EC via I/O port 0xe300 and identifies
the hardware by the "PWG" firmware signature. This enables enhanced
system management for Portwell embedded/industrial platforms.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
V2->V3:
  - Reworked based on review from Bartosz Golaszewski
  - Changed to use platform_driver and platform_device
  - Updated GPIO to use .set_rv() instead of .set()
  - Used devm_ helpers for request_region, GPIO and watchdog registration

V1->V2:
  - Addressed review comments from Ilpo Jarvinen
  - Add DMI system check to avoid running on unsupported platforms
  - Add 'force' module parameter to override DMI matching
  - Use request_region() to claim I/O port access
  - Extend WDT timeout handling to use both minute and second registers
  - Increase WDT max timeout from 255s to 15300s
  - Use named defines for WDT enable/disable
  - Remove dummy pr_info() messages
  - Fix several coding style issues (comments, alignment, spacing)
---
 MAINTAINERS                        |   6 +
 drivers/platform/x86/Kconfig       |  14 ++
 drivers/platform/x86/Makefile      |   3 +
 drivers/platform/x86/portwell-ec.c | 292 +++++++++++++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 drivers/platform/x86/portwell-ec.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d5dfb9186962..c52f819786dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19132,6 +19132,12 @@ F:	kernel/time/itimer.c
 F:	kernel/time/posix-*
 F:	kernel/time/namespace.c
 
+PORTWELL EC DRIVER
+M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/portwell-ec.c
+
 POWER MANAGEMENT CORE
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 L:	linux-pm@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43407e76476b..2f26d1bf0a75 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -779,6 +779,20 @@ config PCENGINES_APU2
 	  To compile this driver as a module, choose M here: the module
 	  will be called pcengines-apuv2.
 
+config PORTWELL_EC
+	tristate "Portwell Embedded Controller driver"
+	depends on X86 && HAS_IOPORT && WATCHDOG && GPIOLIB
+	help
+	  This driver provides support for the GPIO pins and watchdog timer
+	  embedded in Portwell's EC.
+
+	  Theoretically, this driver should work on multiple Portwell platforms,
+	  but it has only been tested on the Portwell NANO-6064 board.
+	  If you encounter any issues on other boards, please report them.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called portwell-ec.
+
 config BARCO_P50_GPIO
 	tristate "Barco P50 GPIO driver for identify LED/button"
 	depends on GPIOLIB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 650dfbebb6c8..83dd82e04457 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 # PC Engines
 obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
 
+# Portwell
+obj-$(CONFIG_PORTWELL_EC)	+= portwell-ec.o
+
 # Barco
 obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
 
diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
new file mode 100644
index 000000000000..7a60ced0c984
--- /dev/null
+++ b/drivers/platform/x86/portwell-ec.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * portwell-ec.c: Portwell embedded controller driver.
+ *
+ * Tested on:
+ *  - Portwell NANO-6064
+ *
+ * This driver provides support for GPIO and Watchdog Timer
+ * functionalities of the Portwell boards with ITE embedded controller (EC).
+ * The EC is accessed through I/O ports and provides:
+ *  - 8 GPIO pins for control and monitoring
+ *  - Hardware watchdog with 1-15300 second timeout range
+ *
+ * It integrates with the Linux GPIO and Watchdog subsystems, allowing
+ * userspace interaction with EC GPIO pins and watchdog control,
+ * ensuring system stability and configurability.
+ *
+ * (C) Copyright 2025 Portwell, Inc.
+ * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/dmi.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+#include <linux/watchdog.h>
+
+#define PORTWELL_EC_IOSPACE 0xe300
+#define PORTWELL_EC_IOSPACE_LEN 0x100
+
+#define PORTWELL_GPIO_PINS 8
+#define PORTWELL_GPIO_DIR_REG 0x2b
+#define PORTWELL_GPIO_VAL_REG 0x2c
+
+#define PORTWELL_WDT_EC_CONFIG_ADDR 0x06
+#define PORTWELL_WDT_CONFIG_ENABLE 0x1
+#define PORTWELL_WDT_CONFIG_DISABLE 0x0
+#define PORTWELL_WDT_EC_COUNT_MIN_ADDR 0x07
+#define PORTWELL_WDT_EC_COUNT_SEC_ADDR 0x08
+#define PORTWELL_WDT_EC_MAX_COUNT_SECOND 15300 //255*60secs
+
+#define PORTWELL_EC_FW_VENDOR_ADDRESS 0x4d
+#define PORTWELL_EC_FW_VENDOR_LENGTH 3
+#define PORTWELL_EC_FW_VENDOR_NAME "PWG"
+
+static bool force;
+module_param(force, bool, 0444);
+MODULE_PARM_DESC(force, "Force loading ec driver without checking DMI boardname");
+
+static const struct dmi_system_id pwec_dmi_table[] = {
+	{
+		.ident = "NANO-6064 series",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, pwec_dmi_table);
+
+/* Functions for access EC via IOSPACE*/
+
+static void pwec_write(u8 index, u8 data)
+{
+	outb(data, PORTWELL_EC_IOSPACE + index);
+}
+
+static u8 pwec_read(u8 address)
+{
+	return inb(PORTWELL_EC_IOSPACE + address);
+}
+
+/* GPIO functions*/
+
+static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
+}
+
+static int pwec_gpio_set_rv(struct gpio_chip *chip, unsigned int offset, int val)
+{
+	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
+
+	if (val)
+		tmp |= (1 << offset);
+	else
+		tmp &= ~(1 << offset);
+	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
+	return 0;
+}
+
+static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 direction = pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset);
+
+	if (direction)
+		return GPIO_LINE_DIRECTION_IN;
+	else
+		return GPIO_LINE_DIRECTION_OUT;
+}
+
+/*
+ * Changing direction causes issues on some boards,
+ * so direction_input and direction_output are disabled for now.
+ */
+
+static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	return -EOPNOTSUPP;
+}
+
+static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	return -EOPNOTSUPP;
+}
+
+static struct gpio_chip pwec_gpio_chip = {
+	.label = "portwell-ec-gpio",
+	.get_direction = pwec_gpio_get_direction,
+	.direction_input = pwec_gpio_direction_input,
+	.direction_output = pwec_gpio_direction_output,
+	.get = pwec_gpio_get,
+	.set_rv = pwec_gpio_set_rv,
+	.base = -1,
+	.ngpio = PORTWELL_GPIO_PINS,
+};
+
+/* Watchdog functions*/
+
+static int pwec_wdt_trigger(struct watchdog_device *wdd)
+{
+	int retry = 10;
+	u8 min, sec;
+	unsigned int timeout;
+
+	do {
+		pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, wdd->timeout / 60);
+		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout % 60);
+		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_ENABLE);
+		min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
+		sec = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+		timeout = min * 60 + sec;
+		retry--;
+	} while (timeout != wdd->timeout && retry >= 0);
+	if (retry < 0) {
+		pr_err("watchdog started failed\n");
+		return -EIO;
+	} else
+		return 0;
+}
+
+static int pwec_wdt_start(struct watchdog_device *wdd)
+{
+	return pwec_wdt_trigger(wdd);
+}
+
+static int pwec_wdt_stop(struct watchdog_device *wdd)
+{
+	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_DISABLE);
+	return 0;
+}
+
+static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	if (timeout == 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECOND)
+		return -EINVAL;
+	wdd->timeout = timeout;
+	pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, wdd->timeout / 60);
+	pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout % 60);
+	return 0;
+}
+
+static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	u8 min, sec;
+
+	min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
+	sec = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+	return min * 60 + sec;
+}
+
+static const struct watchdog_ops pwec_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = pwec_wdt_start,
+	.stop = pwec_wdt_stop,
+	.ping = pwec_wdt_trigger,
+	.set_timeout = pwec_wdt_set_timeout,
+	.get_timeleft = pwec_wdt_get_timeleft,
+};
+
+static struct watchdog_device ec_wdt_dev = {
+	.info = &(struct watchdog_info){
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity = "Portwell EC Watchdog",
+	},
+	.ops = &pwec_wdt_ops,
+	.timeout = 60,
+	.min_timeout = 1,
+	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
+};
+
+static int pwec_firmware_vendor_check(void)
+{
+	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
+	u8 i;
+
+	for (i = 0; i < PORTWELL_EC_FW_VENDOR_LENGTH; i++)
+		buf[i] = pwec_read(PORTWELL_EC_FW_VENDOR_ADDRESS + i);
+	buf[PORTWELL_EC_FW_VENDOR_LENGTH] = '\0';
+
+	return (strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf) == 0) ? 0 : -ENODEV;
+}
+
+static int pwec_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (!devm_request_region(&pdev->dev, PORTWELL_EC_IOSPACE,
+				PORTWELL_EC_IOSPACE_LEN, dev_name(&pdev->dev))) {
+		pr_err("I/O region 0xE300-0xE3FF busy\n");
+		return -EBUSY;
+	}
+
+	ret = pwec_firmware_vendor_check();
+	if (ret < 0)
+		return ret;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &pwec_gpio_chip, NULL);
+	if (ret < 0) {
+		pr_err("failed to register Portwell EC GPIO\n");
+		return ret;
+	}
+
+	ret = devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
+	if (ret < 0) {
+		gpiochip_remove(&pwec_gpio_chip);
+		pr_err("failed to register Portwell EC Watchdog\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver pwec_driver = {
+	.driver = {
+		.name = "portwell-ec",
+	},
+	.probe = pwec_probe
+};
+
+static struct platform_device *pwec_dev;
+
+static int __init pwec_init(void)
+{
+	int ret;
+
+	if (!force) {
+		if (!dmi_check_system(pwec_dmi_table)) {
+			pr_info("unsupported platform\n");
+			return -ENODEV;
+		}
+	}
+
+	ret = platform_driver_register(&pwec_driver);
+	if (ret)
+		return ret;
+
+	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
+	return PTR_ERR_OR_ZERO(pwec_dev);
+}
+
+static void __exit pwec_exit(void)
+{
+	if (pwec_dev)
+		platform_device_unregister(pwec_dev);
+	platform_driver_unregister(&pwec_driver);
+}
+
+module_init(pwec_init);
+module_exit(pwec_exit);
+
+MODULE_AUTHOR("Yen-Chi Huang <jesse.huang@portwell.com.tw");
+MODULE_DESCRIPTION("Portwell EC Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1



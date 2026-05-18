Return-Path: <linux-gpio+bounces-37061-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGgcGAkaC2o5/wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37061-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 15:54:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B056E167
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 15:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7321230C45F4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 13:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12A33EBF06;
	Mon, 18 May 2026 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GoJIDc4Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208648634C;
	Mon, 18 May 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111967; cv=fail; b=gbdgH6+aPJNNJOeDUsi2sc9bw2R89XIwMpViUSE1bgq1H6G+2WF7rTCkFc9HxztXhyqNdhN+iowqLClxAfdXW5CpIDak0fFyTXTa214aw6eu4Bx1flc6r2TuDvfy9hRMDVnYUhdVKzQnP/kebUaSf8fi0mDaYPirU3hGsXdXz+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111967; c=relaxed/simple;
	bh=km4NvlAWaZD1UTYq1G3RKD7m/4f8BOSZuIOtJct8tes=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ppkng0+98QCl53cbkGm3NS8s6pkSVc69muAQ/2lViQFu2dC1dAMevjBFpcL6sZYwiAdEJXn3ZGitb9cLvoXfkoMMS4eebc/D/8pfvJa6vV1psaYQIQe2DUT9pTpAqESjh2s1yeQUOL6jqRf1UsRQ0JTTnuMpufUNuwpkcokabEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GoJIDc4Z; arc=fail smtp.client-ip=52.101.52.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey4Vtbc1tUabc/A5unKeJx/Hbefe+faPuSxzMl4RRKbzKpkEn0AxFnneQ7doia4VzpH7EWH88OOqUze6cTGaxLQmtsLBDpbZdx3qfSafcbCjg+1izNfYfx8s5x7iVYCfPxhD6TJh0iJRp80U5PhwLSj0Qxqmyq2fV5yFD7d4AQoUXJCmW9lbvRRpdFZIdalQrB9TEH3fMQiRQpNd9A0tj06/pQP7iz/X7nzTqZ0GdIFsSoeMGobwrI/6bwDp5mMnmPJbhGTQotPXNPraKU7VzLWQ6Bd/c+M+XoFEmabMIBqaUkzreWBO2cI+tr6OH86+E4xgmVCIvYIpJBUr+HuUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOkY352e1hurluxa3VPL7nX8DLwuiCC+3iZeYZh7qJ8=;
 b=mVagAb5Jk52MvoRLACIqNZnaSDk0PHAiY5ZQHm08o8bd4oEMaRMO+fRKAFIwMp4GXkJ70hC1ABV2fttYNox5UXRYvnQawX7wrFlRagLoGpbzXpCqhsaTrRYgkIp3/Se63Ds1Ulmsbh1p0xeJc6thBbiKUTGHsnnplcQMDWEAew6zGpQK2+4RxqmWuLZPiUBY0PuU8JA10/bztszt8whZ6ixr/S6waAtFpclhYJ2hIkEn35C/yTrOf0l3cqikWzRCgxZw/L+k8H4cevTJ4hrh/I2Z+M2qPgM6nm6aarq/rVc7XWNsnrV3EXRPx0YWb0iW44//PHkSsR9nLUG6E5EC0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOkY352e1hurluxa3VPL7nX8DLwuiCC+3iZeYZh7qJ8=;
 b=GoJIDc4ZoyMHRFmTK9Xo8v2L5EbRAAPb4YvLOdzNNsF1DAcSG3Ut8/71J4pfelZtkOUOLczbjs1UQ+3pGJlbblPLGvxjaxWiNc4vSE5RJbw8JFCFFgs0cRU5mV/YDiAq6eTcTDdVQ5iGikbCK7UA+kGKybClFwxtxLrcZdx3MB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB999147.namprd12.prod.outlook.com (2603:10b6:8:38b::11)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 13:46:01 +0000
Received: from DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445]) by DSVPR12MB999147.namprd12.prod.outlook.com
 ([fe80::98c5:8206:6a4:c445%3]) with mapi id 15.20.9870.023; Mon, 18 May 2026
 13:46:00 +0000
Message-ID: <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com>
Date: Mon, 18 May 2026 08:45:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
Content-Language: en-US
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
 andriy.shevchenko@intel.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
 linus.walleij@linaro.org
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com>
 <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:408:141::19) To DSVPR12MB999147.namprd12.prod.outlook.com
 (2603:10b6:8:38b::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB999147:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 93cce79b-cc9b-4676-edbb-08deb4e3cbb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ojvpTP3hQaEP3CHezEx4UpqgYmx/r8Pgy+LsSCRJmwqybsRnpgFAzs3cEQ6H/395PxcNqkApSPjAyJa9tZxMehHyaXWgsInhhM/qrgfA7p2LEOFzDqYcXyHuLpcdSHfEUan5mFNbraaQkyKFPuKtpYNBo5hgl0ou8rTufn7BxFXK85GLNTuIBOYfGshMikR9q2c68IdWd+jFxqG3//KW91oVuld9wyjuKAz5ErSvo9aD9qTYGSqxZ1koIon0YOOL++L5NnRZFBe2iYcsO0Z6EPvxDxdz4E/cNIoy/58k7sUd2AYlGIvRFYny6rlZoOWAtamirgx9bL2CDjCtBXGUnXqkLG3TCvL79eGGzb51dhzFSKGOfEBq+3w1CJ093oY7tYbptgJ5pD6gGMR2ssZEblW3xXMiJeh4Jz/rTZ0XiT5wKrfR9G3hj+BnlVnMLjc2HQ6yN+VGb5rugP1ueL0J7JPjkjH0Hw6GKAlajuiGgfy/d4PKVllvC8AS0oBI67Mp50vUXowQevfOOfkLaubkjfGpeY7Kvcxpt3KtcJSMzU61Qgh55/PPxrLdsf+1K+9/L1NKBiX2LqhrYiAUaQ6iGpHbARFS3redQ11H86UEoMKfZRhtwVC1e+Ygtt1mnd9B12E2egHIFmoQ7wqJp3ZFw9Zt34Q7xW1j+DDGKJKPBCkT7ffQ0fFjeZELefe1Tqws
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR12MB999147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzVHMERsMGUxbG1pVmNUTFhaNjhaTit0MEF0QWgrWnFic25BdklBRkFFV09C?=
 =?utf-8?B?by8ycTlsTmIwUFhTbjRzNXdGbUMrWi9KV2tpWU9OTlh2cDIxNmJJbFNQbUJv?=
 =?utf-8?B?N3lub1AxSU5sNVhXWE16VzJsdWVrNmZCejdsSFZTQ0ZMV2NiSUpaZ1oyWGN6?=
 =?utf-8?B?aTUydFlpelFUeVF2SDlIOGlvMTlrV0paR1FXR0gwd3ZoazhvdFpKQ3pWLzNN?=
 =?utf-8?B?ZnNhcmZHUEZCZEtxemQ3Qnk4ZXlhcm9JR0JHWTJ4NTg1NTdwRlBBV3R2TmJR?=
 =?utf-8?B?clRHcjBrbmpvZGRtazkwWGtERUhuQi9qZUpWSDBRcC9KM1JUcGpNNW1yNFZZ?=
 =?utf-8?B?Ny9nV1lVZXlHT0ducWJ3M3NycWpyNktKWnJQWTZ5MkZ5aFZhMVlsVXBid0Fy?=
 =?utf-8?B?YmRyK2puNFExZDEveHZmVjg2SWxxUU1LamNpaXFGZU5ISGFSRzZabWRGOElX?=
 =?utf-8?B?ZDJOUUJrVGxwdytaSGxmT3NTaVd2bGJkSkZjK2srbzVhMStXNnBXQjdObnJ3?=
 =?utf-8?B?MmxmcnRiMFRMcWwwL2VEQ0xVaWw0V2hydmZZeUdtelVVTUlHd0lYMEFPYlFN?=
 =?utf-8?B?WEorZEY1QVhEd2lsN2hGUWlxSDBHTkRBQm9iZDcwYTh4ZnlqN1ZxRnVvMXJP?=
 =?utf-8?B?d21YRlFTSTg3dlRKeGRBWGx2MVlwZzh3dWZ4Q2MzN05jaWNzWjQ3ZlBHZEc0?=
 =?utf-8?B?SDRwR0VtZ0oyVFNKUGlrNHo2VTl2cVVDYWxxUkpqcTZ3dXJTOWNtMDF4c2lY?=
 =?utf-8?B?UlR4UlRQL0F2UWFsNlZObk1Dblpaa2trUGlDZGZGZWMxSzFIUHpXUGdJOU1I?=
 =?utf-8?B?OUh4YVFPeEhKWDdXWFBRYTBWenNkcEN3QVR2WEpzTFUwT21IMnBtTDl3RUhx?=
 =?utf-8?B?TGZxbXNlbUlRY3h0NHpPMWpudmRzTjFod2grTjZ1WEZWSE50QSswdnpON0NL?=
 =?utf-8?B?RUswYXNBaFlyRUNnTExEWW1rUlUweXJXcFp4Q0hyb0xOY1RneWUwdit5c3RH?=
 =?utf-8?B?d1FNZGhjVU1nQ2NPS29WMUVYNjF5SDMvbHRCM1RERGEvZGNOS004M3RPd2My?=
 =?utf-8?B?SDJjRGVESDN1RWRMZEJVRTZDYVVwRGpBSTJWbTNUdmVBNkVxVy9TVVZBQkR1?=
 =?utf-8?B?dC9FNzJMdk5MZE9aR25nRWJsUjdGZ3c3TnBidk5NZTF6VlIyRm5hWkVoZ2cv?=
 =?utf-8?B?NGdIdk5weEhRS0ZyUjBXUjZ1UXc4S1FJeVp4ZEhEcjlNU0l5bHVUNHlsd05B?=
 =?utf-8?B?ckswbWlpNzNDWTlER0taKzIrTDNBU3VpczFDMExLc3UyZWFLNDZJZkxxSngz?=
 =?utf-8?B?SG9HalBBR25sb0hDWW0vWVlnUlNITTUxdmpLV0FhTVY1eFpVTjNwVzArY3Q2?=
 =?utf-8?B?bENmODNLY0Uxd1NFN0VLdTZNcGNXcU5IZG5hcWxNZk03SWhlVWZ1Rkl5Yzkz?=
 =?utf-8?B?WmdsZUN2VUw1cUc3SFlGaDd1Wk9ZVkEzdi9PZ1diczlJck03dXVqZ2NOQXJo?=
 =?utf-8?B?NjRWbWFPTzRsRkpUZDlmbElTbTkvWmJpYzZzNmFSN3FUcThmT0cyeUluWVll?=
 =?utf-8?B?TEhMUnpYdmJ3cnFXY0NLYXVRdzYwZ2VsbU9BM1ZkRUo4Rk9sRHNGbk1sbjZ5?=
 =?utf-8?B?V09nVXFwNmltZDgvRGE1Y0ozclc2bG5UanZac2M0Zm5QN0xoRlgyd2JQQTBp?=
 =?utf-8?B?UWJocHVncyt4cC9xUkRFQnRZSUt3SEFmZXhDUnpwY3ViTExHYWtjaVZQZkN6?=
 =?utf-8?B?SlMrWWhoeW9qbjJBUVZxZUFTVWhUY0xUU3VZTmlUdERDK1RqTjc0SXJoQzNH?=
 =?utf-8?B?djl1WHhYVXZrdTRYZnlHcWhvSVJMZkpVZE9CU3BRVWxLZHlPSGZEZ2NoOWFt?=
 =?utf-8?B?OWpZWXBSK2JKbTU2SzJsR3BhOVpVaEozWXZmWWM0clFPQkpFKzc0c1gwem1z?=
 =?utf-8?B?cHAvNmxuNXF6RHl5Q2dBbEFtS3B0UHN2N3VTaXZob296NEhuNkgxRWlIdmpq?=
 =?utf-8?B?OXRJTSs0b1l0SHhwbGQvWFQ4bWZUWTRpMW81bWJVZGVwd3I3R2tyWnpLbkdm?=
 =?utf-8?B?Sm9pK3dKVmtoQ1hoN2o3NGhIdkw3VU9NdnV0Z0NuZ0JvTlpYNWp6VnMyL1BO?=
 =?utf-8?B?LzFiTlBsZUlvbTdIYUQ3MTBmc1BubGNtWkdJN0JlbTJyNHRzaFY1K0FtMUdH?=
 =?utf-8?B?c0kzOVBqRmlmK1BsTWg3c3BzNVdTU0R1eTY1cUhsOW1JQUZUc0dISWxaVXRV?=
 =?utf-8?B?anFqZXI3ZnI2NzJVQXhSYWFmQ3VscFFuTlhJcXBpbUZLMVRvdGgwdXhaZ3lj?=
 =?utf-8?Q?KK6WAQLhMVtLgbWmiK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cce79b-cc9b-4676-edbb-08deb4e3cbb5
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB999147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:46:00.6531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sF60vLobt82sP344TBwBju/Z405KW+dFG/+mKhRCbAL8wrxr0TCg1+84JVCAmYhJdENEZS/aNrguZCnTYyuE/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37061-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: B61B056E167
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 08:40, Hardik Prakash wrote:
> On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
>> I'd still like to avoid a quirk if we can.
>>
>> I know my proposed patch to try to probe at an earlier stage didn't
>> work, but could you perhaps try pulling pinctrl-amd even earlier?
>>
>> Maybe fs_initcall()?
> 
> Tested. fs_initcall + patch 1 still produces the same arbitration
> errors:
> 
>    subsys_initcall + patch 1:   arbitration errors persist
>    fs_initcall + patch 1:       arbitration errors persist
>    patch 1 + patch 2 (v5):     clean boot, touchscreen fully functional
> 
> The initcall level does not appear to be the determining factor on
> this hardware. i2c_designware is still probing AMDI0010:02 before
> pinctrl-amd finishes regardless of how early pinctrl-amd registers.
> The explicit device_is_bound() deferral in patch 2 is the only
> approach that has worked.

Please try arch_initcall instead.

> 
> Thanks,
> Hardik
> 
> On Mon, 18 May 2026 at 18:17, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 5/18/26 07:28, Hardik Prakash wrote:
>>> Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
>>> tree. This series contains only the i2c-designware probe ordering fix,
>>> based on top of that commit.
>>>
>>> The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
>>> completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
>>> interrupt bits cleared when the first I2C transaction is attempted,
>>> causing lost arbitration errors.
>>>
>>> A higher-level ACPI devlink approach was investigated in response to
>>> Bartosz Golaszewski's suggestion. The DSDT has no _DEP object linking
>>> AMDI0010:02 to AMDI0030:00, so fw_devlink has nothing to act on.
>>> Setting this up at the ACPI layer would require either a firmware
>>> change to add _DEP, or a DMI quirk in the ACPI scan path — equally
>>> quirk-based as the current approach.
>>
>> I'd still like to avoid a quirk if we can.
>>
>> I know my proposed patch to try to probe at an earlier stage didn't
>> work, but could you perhaps try pulling pinctrl-amd even earlier?
>>
>> Maybe fs_initcall()?
>>
>>>
>>> v5:
>>>    - Add blank line before #include <linux/acpi.h> (Bartosz Golaszewski)
>>>    - Use scoped_guard(device, gpio_dev) (Bartosz Golaszewski)
>>>
>>> v4:
>>>    - Rebase onto Linus Walleij's tree (patch 1 already there)
>>>    - Use --base so series is correctly 1/1 (Andy Shevchenko)
>>>    - Add subsys_initcall test results (Mario Limonciello)
>>>
>>> v3:
>>>    - Fix variable declaration style in dw_i2c_needs_amd_gpio_dep (Andy Shevchenko)
>>>    - Add BugLink tag (Andy Shevchenko)
>>>    - Add -v3 subject versioning (Andy Shevchenko)
>>>    - CC AMD engineers (Andy Shevchenko)
>>>
>>> v2:
>>>    - Replace custom HID/UID lookup with acpi_dev_get_first_match_dev() (Andy Shevchenko)
>>>    - Use acpi_get_first_physical_node() for platform device lookup
>>>    - Use device_is_bound() under device_lock() with explanatory comments
>>>    - Fix dev_warn to use dev_name() instead of hardcoded suffix
>>>    - Fix commit message (removed incorrect "existing" reference)
>>>    - Add Assisted-by tags per coding-assistants.rst
>>>
>>> Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
>>> Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454
>>>
>>> Hardik Prakash (1):
>>>     i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7
>>>       14AGP11
>>>
>>>    drivers/i2c/busses/i2c-designware-platdrv.c | 76 +++++++++++++++++++++
>>>    1 file changed, 76 insertions(+)
>>>
>>> base-commit: 3812a9e84265a5cdd90d29fe8d97a023e91fb945
>>



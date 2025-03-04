Return-Path: <linux-gpio+bounces-17078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFDA4F165
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 00:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DF9D16D6A9
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 23:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D47278115;
	Tue,  4 Mar 2025 23:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oplkB5n+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEF0251791;
	Tue,  4 Mar 2025 23:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741130558; cv=fail; b=sW9nH72iecs7c1P3cMX+isdIXbc8dA5Di7aLklH7yKjvkEV7UdBWDLxIC/Jnb+p1a/lagrBVc3GsrA4xYGb1H4t9+2OmJT3AUnleQ7Z2h468qxMgIbwwn/DBgjb8nwhXajSpx9NqFoVfBIqFeA+4O7iPIWDYyBSCDeI8RIYg9Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741130558; c=relaxed/simple;
	bh=AHfXaXx1VVB2YhFQ29Z6k+XzAPJU4Cvgyxo6A0TMtKc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HFlMlwlbL9hkJyIsmk/rpWYCj6BYzIYAaIeipZZCn2bK3fjP7z0krXPJLkAanMHQlUQsyJ1kVSz2rL2d4eKZZ4BU4/s5T5+3mBxG8Lrfc73m5w91ul/qZ/B9LUbsTzow2nCoqKD89zFsF75FVdFwL9eXxHfViRisRh+fCh7HCKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oplkB5n+; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+QOav4sfQq6swc2Y9XdgYb1FAOMvWJE8O60huyYoySNkotb0knI2NnoVUo0temdJVvaREMwXB4ffwMKVVfP4eR2DbFAfxwPkWAG5nKXxPQ4AJzU8TP7wM9mMdHBygxOsZOp2MlGicrn8oGLnfFuIo3Qxh0ZF4qfA47FxscNoI4nD/Rqy8c83HlxORFde74xUBQdN4bLLxTvixWBx+oaRpsazNJTjwVmbinhLAFoZtSkdnaauYGn7cscwrfmY5sVvYvXxG1mLyqcPZkVGWuRofNvFy6ph4AzxTG5a3TuvEGoXwQXgc9ej6Qe7ITnn0S4v9whbXhcWLJrxg/4PZ3EiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRYbzOWyzRMiekgGwbXVjiOc+Tf6A1VnV/XExBQWU04=;
 b=i4xdtRwJFkiDRvMTYqkJE6fRBACtVzL+LQtIj6+mJ/gwRwzpXa4nXmJfn4mpMNIXOmrRYjndEbvLKrkPzMJFWnGuKUKcwtciKVl2U8NyqE9ngsooMgP+/aAkUgn28WGpuBawgnmyOGW7E3k5yZ1Z+sPVP6IGaG8outgvOhL0XJmS0ri31xj5QpKZWLRFTtSPa32W8Yj+N4w09mbryBndYf6dwHE0jbmuG/L9aEGyzxTZNEpRvJgdm4PaB5p4249jfOS+l5aaM03x8lDYgylcVLpJ15+XAw8zqVmG8LZ0LT+Xjf5d1s8JKfyacNoE8SrqsXth4Z6/VhiTiDX3copcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRYbzOWyzRMiekgGwbXVjiOc+Tf6A1VnV/XExBQWU04=;
 b=oplkB5n+svuOAVAnyPrh8gDGnvlZbe0LHdtZUP4DBEYYXjaaH66OyLpJTK9EqXH64XZlJdw+eRdXQOQhfWYrYNl+xLgxJ3B2wJxyQljhYS7Fv6RJ1gpdIUMgZC7SoQ3qQ1NH4pMdwLeHT9jQd5r4nTFZ8CUNiJ8gHhSxOBvJXkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 23:22:34 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%7]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 23:22:34 +0000
Message-ID: <acfb7d13-2aad-4841-bf85-b99fe405bc79@amd.com>
Date: Tue, 4 Mar 2025 18:22:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, dominic.antony@amd.com
References: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
 <a2aceff9-5b44-405c-814a-0ad71da28168@kernel.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <a2aceff9-5b44-405c-814a-0ad71da28168@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0188.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::31) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 268f2959-de65-49fd-987d-08dd5b73716a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3NGM1NOWGVhVWR5MVRyT29MSkZ4ai84Mm1GWXVVU0RmcGt0MEVjSG9jQXZI?=
 =?utf-8?B?YVpwb2pVQ2JjZU9JREpXUWt3bG9PMkZBdlVzRC9SMDRmcGQzQklVUFd3V2lZ?=
 =?utf-8?B?NUNvYXd4UHZaL2puU2VkbHd4QzhQV21YSXBuZEpjOWhudmhheWh3TkpoYkxC?=
 =?utf-8?B?VytVVVZQMC9vUWlsdFlNQWIxYks3cEIzR1RTRGVTYmVoZFRTcUo2cU9Cd0lK?=
 =?utf-8?B?TXdoTEluUW9TWFhkNTJJa0JxSnY4VjF2R0NDUnBMSXQ1Qm5XU1lMVDY3Rlla?=
 =?utf-8?B?UDgvRStxZi8zVUUxcUw1aUdQclQ1TjJQUEM1WTBYZU1DMUNXUFpjNEJJSmdB?=
 =?utf-8?B?TUI1VHBhczY5NS94OEdyRHZ1MDZPY0hhZ3JEWHErOEF0c2ZORExnT0VldmVp?=
 =?utf-8?B?V0lZcGNGUlVIS3M3T2g4Tlg3TWE4OStVakprL0RQNVJydmxYaWV5ZFFhZE5j?=
 =?utf-8?B?b2xpdXVCZ3FZS3RBaDVKRXRkeUJoamIwUExSek9VNWcvM1A3UE5sQlE0ZDRl?=
 =?utf-8?B?SGNmQ2VnTFZJdS8wR2wrVjdkSlB0WW1SbGJxZjJoMW1jQWdHL2hNUDl3WmRv?=
 =?utf-8?B?MzZFVnc0Y1BWZW5HdEhwRVlFZ1FETXNqME1JdytOYnVLTU9HTEZWcXN6WFVs?=
 =?utf-8?B?NkIwcGdQQVc2azlUVVl1L1RVSkQvREUydFBZUXFUa3JiZ0huZlNZZHptQVA0?=
 =?utf-8?B?VTQyc3BnTTllV2kwWm9BU1hQMW1aeVZQaGQzZVU5YjIzMWVMOVVwZldNb0Na?=
 =?utf-8?B?Q1RqK3hxbE9FU0VsSi9wWUFXRThSQzVsMUUwY3dUUkwzSlpERFRIQUN4THhN?=
 =?utf-8?B?QlhlVGJKTEY3aDRTc2JiWWhtTFR3amViaUlHWENTWUN0Qkxhc1ZmVEpwR3Zv?=
 =?utf-8?B?WDU2ajlMRzBiSXdHS2ZnUDNxREtYVzlJMjB2OG5yck5Rb05abHVlTXNNSzRy?=
 =?utf-8?B?NUJjUWl1QlpZRE1wUVY2K2dZU0xSd1BqR1BCTjF4U2liUUpYdWU5ckdpSFgy?=
 =?utf-8?B?L0lha001Mk90cmQ3YWRPWHBzRzl3VHlSQXVQK3VOMEpuRFZmb1J0ZWFUenpW?=
 =?utf-8?B?WkZBWm5naWVuNXYwelY5SCtNYU1ObCtwc1pTMi9JeFFwUDNFQlpmaWowV29y?=
 =?utf-8?B?ekl0V3RwNyt0SEhCRUlqNm5yN2c4S2h0M0hpa3lZMFp3VEJaYTIzTFE3YS8v?=
 =?utf-8?B?Unk0dURmNHltcERtN05oOVE1L2tWV2JJazdVQmkrcmNDN1ZTOEZCbmkwZ25C?=
 =?utf-8?B?TGgvdGZHWG0wNWI0b0FaNU9DNVFrTDAxT05LY2g2YVQrODJxNk50TmtkeVBM?=
 =?utf-8?B?VHE0akUxKzhpOE0wbkZJbG0xaFBCRDNWK0htZUFtZWF0K3FER1FMM0UyUVlp?=
 =?utf-8?B?N01jR1RSVzRLY2NFUDhYVk9wSXN4WVlvMUNmVWhiVW9aeWpndHlWUm9lNU5X?=
 =?utf-8?B?UzFoSThxeFJ6M3lRVnN0WTZMbUo0OUVZZ2FGN2tNOUVJS29kSDJtVjE4TlJF?=
 =?utf-8?B?OVRRUXNQVGVEdzRub1E3WUlMS0VTMzg3YnFjWjErbFJkSzJadEVDYThSbHJS?=
 =?utf-8?B?TnU2QkhCaGVPeFl6bS90VFJnNkZJNkRiZ0srRlNlSXZsY0E4VlU4RzNqZVp1?=
 =?utf-8?B?VWdZdCtXOStFTHpiRVFWTEpqYXpTVk82YU8wc2tjeXdkM3I5TFB3b3B0cXlh?=
 =?utf-8?B?QnVKVCtrU1FWZXNnY3RxSlJrUWRXdlgvYTBlYzR4SDhkL2hWOXlPcll6b1hu?=
 =?utf-8?B?aEc1REFka0dVREpPaTlyNWIxVDZtTHRLQUtRa1R1MGFndCtBbXhpZW9JKzBv?=
 =?utf-8?B?M2pYeDVYQW9LMUIvQzgzZjYwNXhJL2JvcHhOTGhMa2FHUGZCTDNuMnJWRVVR?=
 =?utf-8?Q?lYh5i0tqE/KXY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXNEcFVZUUI5ais3RTNBTldsZVdPd0thVngzZC9YNlBhNFBLRWFTQnhTWkZt?=
 =?utf-8?B?ZGtKV2kzV3c5QmpGT3BtN3lrRXJvL0s3VVIrZUZPM3A5TFJHbi9SRHAyZVNw?=
 =?utf-8?B?NlAxNCtSclB1ZzFuc3JuSHRDWE45dDlXNlZjTStjSll5NDR0cEo4b0FPNkl1?=
 =?utf-8?B?cHdjd0ZPWUpNdXJuYWhmSWhNVWdNYzJiZmVLbS85alFTWk02SER3a2RwRnA4?=
 =?utf-8?B?Ym9oL0QxclkreGdFcm16aHBhT1lSdTBEalRwdForOWtqV0E0Y3FqMTBjanlI?=
 =?utf-8?B?OXg2cXJJcFFlUnM3WlhDcGc4T3V6MVYyYXdGT0EwMHp0a1VsSGl3S29aYlF6?=
 =?utf-8?B?VFk3Ull4dFVuOEV0Z3VLQzJIeEFQdjFuL29wNUJFUUlvN0pMT1Z3UEx2Qlh6?=
 =?utf-8?B?SjdDRGJPT2RsOTZyYXpJdDh4cnZPZ3ZKTE1IZFVBL1RFM0dZRVNqcHhZKzkw?=
 =?utf-8?B?N0tIYXFSYkRpbzB5bDdhRVhaR09MbnVlNC9zN2ZSSEVBZU9JYngvNXF1ejg1?=
 =?utf-8?B?ZHgvTnFpNlRXdzVNMHIxZzR4bUo1bnpxdlVzQzdmMWFOL0RFVnVTRHhtc2tm?=
 =?utf-8?B?ODBlUEFaYnAxVXRmVlI5bTdIUDlpNks3RmM2NWVjSkxwUFpUM2tSb2R6YzhG?=
 =?utf-8?B?Y0ZhNUdBakd1K0tmejRZcHdndFppeEN1VGtGa25vRHdXZFpISXlrNHBVaCtL?=
 =?utf-8?B?Mk5OU1E2QnlMV3lRUkdnZ3Zvb3UyTXU2VEQ2a1NRL2YyVlpPMUxpSzJHenJS?=
 =?utf-8?B?RENuMU9iYVVsSXNWaHE4RXNnVzFncDRvUFZkZXB6eDhSV05RbWxOd2JhS1BZ?=
 =?utf-8?B?ZlRCK004aWc2dVRGZzhxUVFHeVd4V2VWNGY4cVRxT2pLbk13ancyT0NYcnpT?=
 =?utf-8?B?dzgzSDduVHp0YWd0RDRrSFBGZFBWUjZOdmw0UlNSL29hWTI5Y3pSWkRvVXI4?=
 =?utf-8?B?Q1NkNzBrNTgxbDd2eFJ2MXU2MWtqbk5wcVk0V1g0eUlDblo1d2JDWWxaUlpa?=
 =?utf-8?B?V1g0MWJIU2lTWHBZSDlUSjlBMTBEYXNpb0RoSjcxU3JwbHlkN0VkRW5GZjdP?=
 =?utf-8?B?S01oM3lQYVF1VTRTZlAzaXM0WGtEMlF4RjBWeHNGVHNadXZyNlZvL3VuMGVs?=
 =?utf-8?B?Z0hxOVozcVRpS0FIaUlmSnYxUTRPZWpRc2RCcUFpK3I4YUhuR21ETWRtdndJ?=
 =?utf-8?B?ZjdESGY1ekZ5N29NVDNJbEV0OWZVN213eXpTR1NGY05UUjN2YlRlSnU4UkNq?=
 =?utf-8?B?Q1pQQ1pDb05hUjZJbXRxMHdOY1F6UmpBMnY0RlhIOWlVSlNtZmppZk1Hbjhi?=
 =?utf-8?B?WDAxLzJNSURyamZvRTVZKzlaOU1SMHpwYmVsMGpkcUtUVFZmVVhPTlFSb201?=
 =?utf-8?B?WnZGMUd0a0l3T3JxcENHa0FtTGNmaTRBTkE1T0VKN0lJS3NzOUppdng2R3Mz?=
 =?utf-8?B?TUxCVkpyNzZhMzI4TWlmWVAvdDFiZzdReXhCK2x5NjJtaW0yd0NnN2R1SC91?=
 =?utf-8?B?VXRhNk4yRC9WREY4dVZFc3M3TCtYc0QzUnhacFpJUnFxMUkyTGd2ZGluVS93?=
 =?utf-8?B?QlFrb01XWi9xWlB5YXpiVFFESVBzUXFaaGdUUG0wVUZaMHAyL05xUHpobHAy?=
 =?utf-8?B?bFZXUHZ5V1kwbFJNbFp3d3krVzFaTVNLUVloV2hvRXBwQktPR1Z3OTBGT0Qx?=
 =?utf-8?B?bU5XRG51WlI4RGEzMlVPdXFBRC9BZjhzUzAvYWRSaG10Y09iTDU5M2VhVkJJ?=
 =?utf-8?B?blliVHAyZ2UwN3o1djZPaytSMlA4OUE5RGdiaVZmY3Bka1Q2a1BPcUN5Uk9n?=
 =?utf-8?B?eXI1QXNmaUIxSEJMM3BvekV2SFRlYWRaN0NaS1BkekZvdStIRjZoTHI3UG9R?=
 =?utf-8?B?cVRxcG85TWhmcEcxaGE0aUkvem5HeHRNWmFhQmQveXJjU0VHd01kdWg2Mjhi?=
 =?utf-8?B?QXdBWlI1dFRHUWJVb2JUOEhJbVdtem9Yak0vck5BdlJvM3AwTkpMb2tvemNR?=
 =?utf-8?B?ZWx6MjY1MzdLTUdUZ1ZiUlVHSm9BYStGYURIQ3JBT3hYdWpCVll4TFVtdGMv?=
 =?utf-8?B?MHFsK3g2L2pjOHNoM3BGV0RTSEJCRDJoSS81Q1RGa25MaFExdHMyRXE0cHBz?=
 =?utf-8?Q?u8ul6bccyW72TZ+5BKo+mdb0A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268f2959-de65-49fd-987d-08dd5b73716a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 23:22:34.0634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nj1hQjf+NjNmjBFzIOh6hFEFRMuN4QC1RQHRizK+GzI5escEWVPxlQ72orQsIMMfHB4SlcDGW5FO0QnzPNCfKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194

Hi Krzysztof,

Thanks for your review.

I pushed the new v2 patch addressing the comments.

Please help reviewing the new v2 and will look forward for your feedback.

Thanks,
Pratap

On 3/1/2025 8:32 AM, Krzysztof Kozlowski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 28/02/2025 17:57, Pratap Nirujogi wrote:
>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
>> index fba1c56624c0..ac27e88677d1 100644
>> --- a/drivers/pinctrl/Makefile
>> +++ b/drivers/pinctrl/Makefile
>> @@ -10,6 +10,7 @@ obj-$(CONFIG_GENERIC_PINCONF)       += pinconf-generic.o
>>   obj-$(CONFIG_OF)             += devicetree.o
>>
>>   obj-$(CONFIG_PINCTRL_AMD)    += pinctrl-amd.o
>> +obj-$(CONFIG_PINCTRL_AMDISP) += pinctrl-amdisp.o
>>   obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
>>   obj-$(CONFIG_PINCTRL_ARTPEC6)        += pinctrl-artpec6.o
>>   obj-$(CONFIG_PINCTRL_AS3722) += pinctrl-as3722.o
>> diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
>> new file mode 100644
>> index 000000000000..659406586cb2
>> --- /dev/null
>> +++ b/drivers/pinctrl/pinctrl-amdisp.c
>> @@ -0,0 +1,290 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
>> + * All Rights Reserved.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
> 
> Same problems as with rest of AMD patches.
> 

Done. Updated copyright header.

>> + *
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> 
> Where do you use it?
> 
>> +#include <linux/platform_device.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/pinctrl/machine.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/interrupt.h>
> 
> Where do you use half of these headers?
> 

Done. Yes, most of them are not used, removed in v2.

>> +#include "core.h"
>> +#include "pinctrl-utils.h"
>> +#include "pinctrl-amd.h"
>> +#include "pinctrl-amdisp.h"
>> +
>> +#define DRV_NAME             "amdisp-pinctrl"
>> +#define GPIO_CONTROL_PIN     4
>> +#define GPIO_OFFSET_0                0x0
>> +#define GPIO_OFFSET_1                0x4
>> +#define GPIO_OFFSET_2                0x50
> 
> ...
> 
>> +static int amdisp_gpiochip_add(struct platform_device *pdev,
>> +                            struct amdisp_pinctrl *pctrl)
>> +{
>> +     struct gpio_chip *gc = &pctrl->gc;
>> +     struct pinctrl_gpio_range *grange = &pctrl->gpio_range;
>> +     int ret;
>> +
>> +     gc->label               = dev_name(pctrl->dev);
>> +     gc->owner               = THIS_MODULE;
>> +     gc->parent              = &pdev->dev;
>> +     gc->names               = amdisp_range_pins_name;
>> +     gc->request             = gpiochip_generic_request;
>> +     gc->free                = gpiochip_generic_free;
>> +     gc->get_direction       = amdisp_gpio_get_direction;
>> +     gc->direction_input     = amdisp_gpio_direction_input;
>> +     gc->direction_output    = amdisp_gpio_direction_output;
>> +     gc->get                 = amdisp_gpio_get;
>> +     gc->set                 = amdisp_gpio_set;
>> +     gc->set_config          = amdisp_gpio_set_config;
>> +     gc->base                = -1;
>> +     gc->ngpio               = ARRAY_SIZE(amdisp_range_pins);
>> +#if defined(CONFIG_OF_GPIO)
>> +     gc->of_node             = pdev->dev.of_node;
>> +     gc->of_gpio_n_cells     = 2;
>> +#endif
>> +
>> +     grange->id              = 0;
>> +     grange->pin_base        = 0;
>> +     grange->base            = 0;
>> +     grange->pins            = amdisp_range_pins;
>> +     grange->npins           = ARRAY_SIZE(amdisp_range_pins);
>> +     grange->name            = gc->label;
>> +     grange->gc              = gc;
>> +
>> +     ret = devm_gpiochip_add_data(&pdev->dev, gc, pctrl);
>> +     if (ret)
>> +             return ret;
>> +
>> +     pinctrl_add_gpio_range(pctrl->pctrl, grange);
>> +
>> +     dev_info(&pdev->dev, "register amdisp gpio controller\n");
> 
> Drop
> 

Done. Removed noisy success prints.

>> +     return 0;
>> +}
>> +#endif
>> +
>> +static int amdisp_pinctrl_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_pinctrl *pctrl;
>> +     struct resource *res;
>> +     int ret;
>> +
>> +     pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
>> +     if (!pctrl)
>> +             return -ENOMEM;
>> +
>> +     pdev->dev.init_name = DRV_NAME;
>> +#ifdef CONFIG_GPIOLIB
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     if (IS_ERR(res))
>> +             return PTR_ERR(res);
>> +
>> +     pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(pctrl->gpiobase))
>> +             return PTR_ERR(pctrl->gpiobase);
>> +#endif
>> +     platform_set_drvdata(pdev, pctrl);
>> +
>> +     pctrl->dev = &pdev->dev;
>> +     pctrl->data = &amdisp_pinctrl_data;
>> +     pctrl->desc.owner = THIS_MODULE;
>> +     pctrl->desc.pctlops = &amdisp_pinctrl_ops;
>> +     pctrl->desc.pmxops = NULL;
>> +     pctrl->desc.name = dev_name(&pdev->dev);
>> +     pctrl->desc.pins = pctrl->data->pins;
>> +     pctrl->desc.npins = pctrl->data->npins;
>> +     ret = devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
>> +                                          pctrl, &pctrl->pctrl);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = pinctrl_enable(pctrl->pctrl);
>> +     if (ret)
>> +             return ret;
>> +
>> +#ifdef CONFIG_GPIOLIB
>> +     ret = amdisp_gpiochip_add(pdev, pctrl);
>> +     if (ret)
>> +             return ret;
>> +#endif
>> +     dev_info(&pdev->dev, "amdisp pinctrl init successful\n");
> 
> Drop, useless. Not mentioning that drivers should be silent on success.
> 
Done.


>> +     return 0;
>> +}
>> +
>> +static struct platform_driver amdisp_pinctrl_driver = {
>> +     .driver = {
>> +             .name = DRV_NAME,
>> +     },
>> +     .probe = amdisp_pinctrl_probe,
>> +};
>> +
>> +static int __init amdisp_pinctrl_init(void)
>> +{
>> +     return platform_driver_register(&amdisp_pinctrl_driver);
>> +}
>> +arch_initcall(amdisp_pinctrl_init);
>> +
>> +static void __exit amdisp_pinctrl_exit(void)
>> +{
>> +     platform_driver_unregister(&amdisp_pinctrl_driver);
>> +}
>> +module_exit(amdisp_pinctrl_exit);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMDISP pinctrl driver");
>> +MODULE_LICENSE("GPL and additional rights");
> 
> No, that's not true. Just like in other patch...
> 
Done. Updated license info.

>> +MODULE_ALIAS("platform:" DRV_NAME);
> 
> 
> 
> Best regards,
> Krzysztof



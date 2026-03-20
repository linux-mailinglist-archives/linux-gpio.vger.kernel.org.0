Return-Path: <linux-gpio+bounces-33902-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDN/JNkzvWmI7QIAu9opvQ
	(envelope-from <linux-gpio+bounces-33902-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 12:47:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A652D9CB8
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 12:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 059E1308C2EF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 11:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438EF3AA1B0;
	Fri, 20 Mar 2026 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k3Hp4DfK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF332C027C;
	Fri, 20 Mar 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774007194; cv=fail; b=aOIGN9SVQ7N3OYOi4OSBdFJIwn8NMLESue6QDV4UkZFiY73I5GWzd3haGOWDh1R/TpxWVf3kk41nFLC2M1OMyugRJLOPAfG/OqCxBCmqlAi5BZ5BfQ4gfA9B8IFJqtKw9qMP5zqSJQXyTryzM2HD03O9x9RfINy7sX/d9GVc7t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774007194; c=relaxed/simple;
	bh=1lPX7WhxWVshNoaFkMhvUMgqmH1/u4M3jfqxkE/O9wY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hRYdw0Smn4/op3+qdwSDyDOVflWpNVY+dmkO82tP2LUHt12QbNOJMK3C1AnaHgV3D2pYC+9/xhTpBemDAmemfjc7OY2ubXjkTGUZKhWjBddF/k1g1oXGZSG3qM+9G+qAVXM8RL+6upy3DZXMjVMiVTFN7s0M28i7ZZTRI3pbLBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k3Hp4DfK; arc=fail smtp.client-ip=40.107.200.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkkt6vA2bxVuNVbmVSh6PQcnJs3M1MWE7VCof64DzToE2q9TriBdDMFY0PVyJ5IKBdxWYFoWAFTshcUAADKldEatg7LC2PHFGRfDhXWm5FVwVMGUciAMaEB8bNKevozYy+MMEbXdDDJHl94aseFeFSoAbAzOW6RiVU15ThBGg7QnLzjNukIYVvAV3GKxJjk1b7mQ4HNytXH/vS/lKShxZQqkOBxw5RK/i3+g/KeM06GFs3q4Fy4lVf/KL6roTQ9NXXosnGp7MusCEz7AzWJ6mU2Vr+h5y6M3iueAhcDNfm/ruqe7oNcIOQxWgzrvhHR2PzgUc6F1tmnCrlJ+O2kKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeDnHw8vjrZNIk3Qn677D22Lo1Xn7/HCPBJXI8gPVTw=;
 b=AGHWgDjGS0JUVBwk6OTRJhF4PiEH28WmG+Ji/EDIfLO4UgSszBoAvslP3/ET+H0lZ6qqhL+Un6pTikDKK/vzggF9engd5ZvuOyAgX3W0KPCiC7sMq7KTRz1MsjWqg/lIqPyQAuK2WVm6U8tOHvy+dH4l2aznlNwRCN065mrBZWxKgBO+FSIs0R1/ulHfv9+yHKwhsWfYUPckPPzx8PT+INiRh61/Fzhk48WrHRYZD+syuTxbF7RUl+7yVKZamPWE2WX/+M3M3oA+H4cfUgPpWn6GkXLVH+0a/m7eau2H2tLPrNa6YC7uCMNcJ7G+x+4Tu582Tir/oKyNhWJMDQuZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeDnHw8vjrZNIk3Qn677D22Lo1Xn7/HCPBJXI8gPVTw=;
 b=k3Hp4DfK17g4frKkrnd5JbAKMvSdMtadcMV9TAwPfFatzqTOj+p2xbie3j69PW/shhQ5xmc6G0+L7r4b45zZgQ7ciVjX8FRNPsvy1UL1fkpntMNrIFuil9XsMpD6E6HZ2+n9SUTapI2wd2NWEnTK6YOZN0/tvWAt1YK3hNR98DBLHOmMAy1avby4hN6apvrqptqI/S47p7bSkJ+seWUH4INEljByhNNeoByaonM4xDtER3PseKIt4MGFqUEZ0ubiSM/UyaudDfDjaPGnwyOs8c/yUOYAFsjLI5dbyZu8liiu33LHvJK44YLK+pBUzTkZ4RdiYvcSFrT0MBQPXRzxDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 11:46:29 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 11:46:29 +0000
Message-ID: <ad20b7da-6c21-43a8-a450-0b6678fe395c@nvidia.com>
Date: Fri, 20 Mar 2026 11:46:25 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Tzung-Bi Shih <tzungbi@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com>
 <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
 <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com>
 <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
 <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com>
 <6ea1e467-b0d0-4ec7-90b5-740ca2415460@nvidia.com>
 <CAMRc=McGaF2XYedgy4n_RZzbHSBBZ2=EMvBEF4f8+ejLbu+CPQ@mail.gmail.com>
 <ab009797-3b48-4568-8e80-b10a44b6fac1@nvidia.com>
 <CAMRc=MffhRN3bC0TpeNqe-8fMCeSc9wBMrDANS9mtFkipdsiUA@mail.gmail.com>
 <abzRxyoW4svizpRY@google.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <abzRxyoW4svizpRY@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::17) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ecc6c6-05c8-404c-1626-08de86765322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Epyei72eJGdKDN7mVBhMMg91vlFXfv3u92mluTRpAbh0lJ+nqCAyIo0BbMS9vbr1UR4yremKtqEEN9Hmc7UTKMYvLgLJQe8Ms9AqV7QOzDFAWOP0y4mDAlpY4eavr0oxAXhU7vmhS0cWkiZkR5Ph4AFUoL/NvOaHrDvs1SRljrAFLSEkQj3c9f1IsBfoOKShANrOTyMG4/lDCw9q+vOiALltliAkdRlhjTXaeBsbKeJDoK18769P7fMLaCJC6Qt6qwiyssfbrc6rmApWtYuDuyibASOoogfSMWDxvx3qXj1GxEZ/rjuNKHjzK2FWTc7i7FnquRfMw2byP7JermGcTpwFksWrujEzjBijQYQMRD9uIEo5tZ+G7B7PZYsPWfiyFypu7iXR0zL1kEJuK+QCayDgRM1IxAjMSeZtPbfFqNGTfRkU/vXJDfh0eALOOty+3W1XTwn03KqdL62yBft1l1bKabEK5eg+7jd9Ah2kSb29j5VQIFlRgFfITwzQDJ6XZog3E/6I8BgYBa+oZ5xhDA5+RbKVfjMPx9no7ZeRQrgJj4jXTQ5WohO6f8rBONKSRNoVGLDf/r/dhemE0FR8CrCE4EZkAzggplR/LDXoSdrahVZpN70hrTPfbaNrnpsSOtubYBL2pWDcm31Hor4wkZIJtbLBxSh8NPOsykcC0R9B4pyayr1tsyZGXIhtL0NVncdZGg4R5+6pYPQmlS4/340OK0KKG7wUVvdIKCSrqRNkyhwGurU5pOirEBpXehn0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2hRdzBvUEVTbFVmcFZlQ2E5K21oeGFSSzJ2dGxTUnhocXBpbDZNQmNKZDd0?=
 =?utf-8?B?QldQZ2paTmdMQnJXWDhoeG5iMVZYMkJKV01rQjFEUVJ3SGJwTUFIRXFuNXc0?=
 =?utf-8?B?OHd0TzhLc1ZLQmloTjRZMWl4ajQ4Vnl5TjdTZXRDQnZlaDNDTitQV1VkT2xP?=
 =?utf-8?B?U0lOclBuNUdHeGdkMGFQalVYb05zMUpqR3NscmRlcVhpU3RpZjM4MkNNZm1n?=
 =?utf-8?B?blNOSlhhTk9LS1FYK1A1T09kTmJ0Q09tZ2hNL0xVdWFEODhFb3lLSjdaNVR0?=
 =?utf-8?B?SndqWUY2R0RGZVpwR21NTHR0ckpJTGhzZE9qK1R2WVZmTEhWZ2tPMkUwNS8y?=
 =?utf-8?B?ZHFlMmZuUGUrZHA1aGsrNElyZzluZlFsRG5XL3BDQ0xscGNGSVViS1JOcEZN?=
 =?utf-8?B?QXVMUGVXMEowUUNvazh4WDVBbjlrblM5OHVpSVd3ZU03U1R1Q1hMYkFiM3M3?=
 =?utf-8?B?Nm5Td3psK2x5T3JWRUNVcjlXR1ltaUpPVHdvUnFMdHdQMG1vWmxsV1ZuUWhi?=
 =?utf-8?B?cHBQaTN4V2IvRUVodFYvR3AyanNEYXFNRmFmQkh3bk5pYzM2WUVjNGNWY01Q?=
 =?utf-8?B?bjRRemxLdU1XYWVwVFU0RFNlR0ZJcGZWZlJOa0JlS2drR0RDNDBUWG1JZHFQ?=
 =?utf-8?B?MCtCcEdub1NzVHd1R1czb0lvd3lRMDFDVVBSQmdOWEdCdUxlS0RmYXRmRWxQ?=
 =?utf-8?B?OUJDK0J6UEcwQ2YxODJyWFNrRlFiRTdDMnJIRDA5Q0h5VCtiUTNobEpDMnBF?=
 =?utf-8?B?UjBONVF1SmtabDFhRkFIei9VY25lV2M1cTNhMVFSY09rdmgwbmNkOUp1ZVJt?=
 =?utf-8?B?L3lLYnNqekJLNmVFSjlRQmVhZWlkMk5PRnNrM3JrcUlnbHk2aUpUOHZzMnVU?=
 =?utf-8?B?bVBIeFp4K1NjKzRtLzRYcjZEUnZZcnY3VU5nWVo3TUJqWWF0dWJmR1dETUJt?=
 =?utf-8?B?UGl6Mm1OVjEvZWpuNWwrTkMrRFVaQnM4MDc3ektraWZPZ04rNitOd2ZINFFy?=
 =?utf-8?B?aEZjbTY5K2VwVzJBMDZMYzU0NnQ3TGRneitCWFBkelVIVzJLMWljTWpXTXBa?=
 =?utf-8?B?ZUZKdk5BNHJ0NENNRFRuY3lFRWE0aWw4Sk9sLzBGSUpjc2lMcGNwZ1VPUGx5?=
 =?utf-8?B?aUhRMGxtQXlzOVNsNkFMK3RsVk5QclNGMVV3c1JwM2xCWlVHaExlLys5RHlS?=
 =?utf-8?B?MktUNkZBS0xGdmp4YVl5TkxTRFBBckd5cFlxUnZKV0dqZy9ndFQ2L0IzcW9G?=
 =?utf-8?B?YloxVkRUU1ZwRUc3RDlXMGVxVDdMR2RtYVRTajVadVR0eUkxNk02aHJKUWVV?=
 =?utf-8?B?eWVadCtxWW9sYXA4MUYzblFGZDlsbTNDaXZSQnhmVjA1UWV6TEprK2ZSN2lX?=
 =?utf-8?B?QUszOHIzZytLZDA3VGxEUVRWdks1Mnk2NHhsdjFHdW1BMnVDMmxjaGtIVGI4?=
 =?utf-8?B?OUtTREFoeXZlUzcxb0ErRm9jRGo3bHd0UUdUWndRR1dhOFhqcTE5S3lDQTE1?=
 =?utf-8?B?bkZpbFIyNjBTbksvbXkydDhNVXN5YzBTa3lGaEtacmZxZDZ1b3FVTi9KekRY?=
 =?utf-8?B?TGlZdHUwWVpFblRHZXVUbzRZdkdtYXpLTU1md0VnLzNtSzJ3OEJwWUV1MkJo?=
 =?utf-8?B?L3Ayd3F6WGpUMHROK0RhRTFhaDFSenFxU1ZsbGlFWGdJc1RMOFEwOWlNL0pU?=
 =?utf-8?B?b3BaWmI3bGhXODdieVZyWkk2WXdnS0Zta0E3UmJRM3ljSk5xZE80VHlLSGUx?=
 =?utf-8?B?Y0VsczVJbzQyZUtIb1FZNXMrRUFQc1ZwVThxMklRNmppdzA1NFY0VHVDVFZt?=
 =?utf-8?B?aDFpQ2hMZ25yUEF6eDdJaXJpUDk4T1o5R0V0THp0Ym5Vc09waE1SY3FoSVpE?=
 =?utf-8?B?K0hWakl5RkNoRW5nUVNhbmxZbCtCUmJaeC9RRVE0aFJvUHArSk5ZOWlQWTRR?=
 =?utf-8?B?eDdtdDlGeW12WUdEdVMrZ2hWODhIS3JJbnF3WDh5SE56QlZvYXpSdGo5MHM1?=
 =?utf-8?B?TUV1R3dBWWJXTGR0ak9xUEZqUGphWkhuQkVoVFI5VlFhM056NEpjVzNWNmhS?=
 =?utf-8?B?cGwrRUhGT3I4RzdQcUVwd1ZWYnZrUEtERW5wVXF3N2IyejNUU1pQbHdKOTZO?=
 =?utf-8?B?L1BuZUtoK2FFQ2F1UXFzb0k4bGJQSlB1UE85a0dacUw1WkRqRmNmVW9qelhv?=
 =?utf-8?B?THUrOEhNNjMzYlpnMEJvTjZUUW02cWtTUXhEcWpiL1ZCRnJrSmxwa0pGVHhz?=
 =?utf-8?B?V0R6bkdOem16MENNbFhEQi8xaHJ5dzVGRzZ1MVQxT29ZM054QzFGMUpjRHly?=
 =?utf-8?B?TUc1SHBPVXRHVXFaSDRXUStPNWdwUXRQR2V6ZTJ0RjdlanoxTkNwUVUySjZ1?=
 =?utf-8?Q?zurRwus5fzJI5HTJT5oI3trVDaJ/0GpWA8or5gUKMgoRX?=
X-MS-Exchange-AntiSpam-MessageData-1: uMlpvJKc47/ovQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ecc6c6-05c8-404c-1626-08de86765322
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 11:46:29.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIMM6X2cWXeIq8kZZhMwUH8IkQHZh2OCTY5XG/tfTkZ9Dwg6cRgf6U0Ih/C6Dm+Ufqh352CvGFzhOSa4FKAiXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33902-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E4A652D9CB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 20/03/2026 04:49, Tzung-Bi Shih wrote:

...

> The context '}' here suggests that commit 16fdabe143fc ("gpio: Fix resource
> leaks on errors in gpiochip_add_data_with_key()") might not be applied in
> your code base.  After applying that commit, this code should look like:
> 
>      err_put_device:
>          gpio_device_put(gdev);
>          goto err_print_message;
> 
>      err_cleanup_desc_srcu:
>          cleanup_srcu_struct(&gdev->desc_srcu);
> 
> I'll use v6.19 (i.e., without the commit) for the following examples.

Yes that's correct that commit is not present.

>>>    err_cleanup_desc_srcu:
>>> +       synchronize_srcu(&gdev->desc_srcu);
>>>           cleanup_srcu_struct(&gdev->desc_srcu);
>>>    err_cleanup_gdev_srcu:
>>>           cleanup_srcu_struct(&gdev->srcu);
>>>
>>
>> Hi Tzung-Bi, allow me to Cc you. It looks like someone takes the SRCU lock
>> during the call to gpiochip_add_data_with_key() and this is why the cleanup
>> path complains. Does it make sense to add this synchronize_srcu() call here?
> 
> No, I think this is very unusual: `gdev` is still initializing in
> gpiochip_add_data_with_key(), but someone else already starts to access
> members of `gdev`.
> 
>>
>>>
>>>>>     gpiochip_add_data_with_key: GPIOs 512..675 (tegra234-gpio) failed to register, -16
>>>>>     tegra186-gpio 2200000.gpio: probe with driver tegra186-gpio failed with error -16
> 
> Along with the above patch, the -16 (-EBUSY) should be from
> gpiodev_add_to_list_unlocked()[1].
> 
>      scoped_guard(mutex, &gpio_devices_lock) {
>          ...
> 
>          ret = gpiodev_add_to_list_unlocked(gdev);
>          if (ret) {
>              gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
>              goto err_cleanup_desc_srcu;
>          }
>      }
> 
> [1] https://elixir.bootlin.com/linux/v6.19/source/drivers/gpio/gpiolib.c#L1151
> 
> My understanding is that within this function, there appear to be no other
> users of `gdev->desc_srcu` between the calls to init_srcu_struct() and
> gpiodev_add_to_list_unlocked().
> 
> At the point gpiodev_add_to_list_unlocked() is called, `gc->gpiodev` and
> `gdev->descs` have also been set.
> 
> Jon: My main concern is about potential races from other threads.  Is it
> possible that another thread could start accessing struct gpio_desc elements
> (e.g., via gpiochip_request_own_desc() and desc_set_label()) before
> gpiochip_add_data_with_key() has fully completed the initialization of `gdev`?


So today I tried to reproduce this WARNING with next-20260319 by making 
the erroneous change in device-tree (combining gpio-hogs with shared 
gpios) but after doing so I don't see this. So for now I don't think 
that we should worry about this.

Jon

-- 
nvpublic



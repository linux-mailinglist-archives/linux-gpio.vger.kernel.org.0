Return-Path: <linux-gpio+bounces-33641-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGa0MLRbuWnYAgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33641-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:48:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACF2AB372
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A22A03058702
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EF530E82E;
	Tue, 17 Mar 2026 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W2FeJ65D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012034.outbound.protection.outlook.com [40.107.209.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E430BF67;
	Tue, 17 Mar 2026 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755227; cv=fail; b=jZtufFqkYUpKXey/srL/uY9JwZ821HqzWvkkRNf9nUcIAj5so3OHXSZmKdzqls6/upRsqKj1RDCTNZCjXp1zybG+QsFNDSTcWpETzuGn15xHF3GxC/cxoQCT+qtWcqIefAxAi36tLHK3Zp+HP95bSK8LSyLfUlaRGE3rpJmEQfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755227; c=relaxed/simple;
	bh=kVLFnWRD/FKQSDnM3/45w5RHyx+ZU7jX1rz7vcttn3M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GfSUc/MyOxxtB4XgkDx9QnEv6LaWOV9d7XpiXeNgMYxyBHGjryBwLH8dleFV0XkCxqyhlBN6qcJvRRRthFCjUrNFlS6EPq0uL2+q1y2t0OJ5JjKSZO5gsx+9w58raIad/0VdgUSeiucF4MlUwJ2w4hG/1pMB9jmx/cSzUcS7ObE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W2FeJ65D; arc=fail smtp.client-ip=40.107.209.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiPxu8mLeHLqUitkcKcm6EwBtB3wd+MGKMLdROJK0oA2fSgE9bK/aUJ6LA9RvbZP6UmZdE/YriMCF+bBqBI1g1wkJdd6RA+rngMt6sd2lOo7ZLw0d5qoWMiS0AwJXS5F1moxSn5OiKlErCwkJtiH0KkUD/wFifdQmVwCd55AqcQuDk87tSGY1T22k2CUApbWt0T4pLUZBVvwvqa6QWxRD9WuTYaPwwirmHaLpXbdY7FZHPXAf8YIkkPybZNYnwfiII1suLySSR9fPd6wVw7A5GsyZdo2X4ipGu3WrTwAZnTH40g3m9rQngNKg6CW0HH/mIUc0tlNeP5sTkY8PEV8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFHt9sPKED3l7+FfoYdvjeGw8cvHoZ1qY6pUJPvEmGg=;
 b=Ml5Fr3S3OSswf458yuRuPoF9LMRO+9Y3ss26xurZeGfWoFQdlH2CU0meHh3uavEi8V2BkhJnvv6lWFwWitZ6fuywhcf1599CnoHicvaW5hsF2SS+aSGLlMG1BvY1G2VXpDogJIUdByOh1ITDTUqD77Le7NyGpAOhvS5wFA+Tj4MiqW1eo+zatzqqR1EKKeI0iZRoOsV4ki1Xt4wKX56727Gr7h1S6JQU2Yjci6XZ50lJyn5U9LzX9OZ+tgd5QgMZ40qdjNjwwfMkhQIt/ZfK9LgA6BgiPEZP6xZBRLdo1Ovatt6bKvOQfea/fDeYPK4eczbe4+OQ3TJGvp/MHWySqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFHt9sPKED3l7+FfoYdvjeGw8cvHoZ1qY6pUJPvEmGg=;
 b=W2FeJ65D2i+E3JUCu3tH/SBSeRg6fqWFyPxlJ/GIDYqOdsLx0I5JkCskmVnZt10C7jyxNoYPIlIOhuEaXIIg8MrBClsbv2A0xs+GDREiLlj+YI/3w33XfF0wQfOygCD/grpn3eBsa2w0yY6eYlQpDgUhcqFq+dN6btv4oBmlT8R6ujzX13ePtZMFMsWY/mbZBFl8v9OEuiQvAtUiC2NomLO641lf++vTPgfqvp79VPmDCoOBP/4+wWXuhlTvFQG5bHWoPf5ZiNTZ1NoeJSpHWgmqGIH7wq+e6Xvg8O6/Ux0Ohv84i4lNVxli+vobrtTvsAKz6xmUc4aFvWR9D1aJkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 13:46:57 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 13:46:57 +0000
Message-ID: <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com>
Date: Tue, 17 Mar 2026 13:46:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
 <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com>
 <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0478.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::34) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: ae40d8b1-dd6e-4831-6593-08de842ba841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Zj1kGgTNnF++a/zlwF6fMzlcb5U/GtspQoGhqrY2Gg9FwYax5usHgUSSgkCkyxCsiL1QB/2Zn4SDjdquZQPUx7mHoygZzolmuL9IYKkWbHf4fcMkpHxFouNCrFTbHippAXrxnf2cUylaGPyIEE6Zn6ke+PTzqCIl5MJKtRLnyJ8LaHG8cQVWyWYl7S0857CdCFO7FZ9AxBrhatHs3TnKyM/6jzYHyH9kvcFafG0HdGcegEpzfrp2JFGqbLWliwQNbZYNmqGRHuz+h7zC7E7g7jXzHp6tPpVxHHzHMs1A9VACcqSSXYKovGe8YxrYQr7/XePdx3cxvXobobN7SDmL2xfFVCHcwISeIvI1z5nBdAvsk0xH1FQx6H0Bf/9j/ef6JoWnmstEA7DzfZK5uC0fflwg2g/yn8e9cFI7Sij8BdE9oFDsIsvuw9mrRrFDbflBDTjFf62R7H0Dihf+seuiyx5P4gTqBJ2Xfv8QArttS68mJgynAeMBnOsEEA0rEVcTWRMsTQd6Zvvf9UQbx5pREJt8XU4hWNbKt//c71k0Lu6oM8yX6TzvdPkzA89V2tXFcEdn3HPTvXZ6Ac1UlQBisusf9Z3Q6aavzmEDQnHjLbossKeSzCe4jyQZZePP8CfwbD7L0iPgrgVpHJJhjegHXn/sfUofZztaBrgpqe2Ix6ZsibnJ6vRd5dzXeZagOG8IAY+EhH4RirCdAupAwzwhKxEJVsAXu1fucy+rbfE8wJQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUJyTW83RmZpcEpEMUM0R20vOHlpbDRLVWp3OHlsR2hHNlF2T0R0QlJXWURB?=
 =?utf-8?B?U2YyN0pEbWN4L2sxcnZQRStUZnRzOTl5L1NuUTROd1RlQVFqZTQ4UWV4RVBU?=
 =?utf-8?B?ZWxRT3RiWGN3dy9xbS83VUdoeXk1YnpycGFCUlh0Q0JyRFQzam9mcnpnYkZz?=
 =?utf-8?B?N3E2akJiMjN1cVdNTnlYN1dobThLWkRSeUxhYmpYV29VUDVvSUM0ZkFucjJa?=
 =?utf-8?B?MC9Ma0w0aG9GT3RTOGMyS3VoVmJ1MjFzUjFMa2RuU2JWUXZucjl3YzlpZ3VZ?=
 =?utf-8?B?Y2pFV0tHQjBiTHZjK0lwWUpnazZNaG94ZFRSKzhXaHArOXllay9BdzZ0U3Vm?=
 =?utf-8?B?S283dnpGS3NPZzJDbkpUWFMxUUIyMFdJbDRlWU9jNXBTMEE2bUZlV2lNWlZV?=
 =?utf-8?B?SmFFbzhySkhjNFFyeTR3dGhkWjB3dkEwZDF1RnN0MUllQWphZEpETmg5T3lj?=
 =?utf-8?B?NVoyWVJON2l0MUdoclNCTUNJWlEvbDdYQ1hSWXprbUY2MHo1Mzd2NlowcHdn?=
 =?utf-8?B?b3FXOGZFc3J5bmp2MkJwTEVFSVVmMXNxL3F4MTFpRU5pRzlJdEo4MDZuZVQy?=
 =?utf-8?B?aG91TGZwbmpsRm1YU0xGRURmNlpuTGt1SE05c3M0UWt1QkhMVGpHZDJDNnFY?=
 =?utf-8?B?M1pYVURIcEVIdXB5bU52ajdyM1VEbURjdURtQnVqS1lNc29XZ2dId3J2TERk?=
 =?utf-8?B?cElINnRqR1pDZlZyclQyYVdIdmE2ZU13QjJCQStKSzNXbEM1ZEpqZTBxNk13?=
 =?utf-8?B?QTNGWkszWlhvWUNlOUZhVSsrbmlZdlpQMEw1THlHR0JoVTRrV0g2czExR1Mx?=
 =?utf-8?B?NndzZjMwcitOYldDTUs1VHNHZUZtQUErQ3NHaVAzVjhmZVlVbWJhckRmWFhh?=
 =?utf-8?B?dm9BV2pMeTl4TWkrRW1sUHl3bnZVUFR2L1hHZVZMN2RwRTNDMDVxaE5LVTA4?=
 =?utf-8?B?ZnhxaVUyRThpUXFhai9PQS85VTBHbURuZSsrWWZ1eDZmaytnYmE2aVJ3a1pp?=
 =?utf-8?B?YmlPTjdMb0JlcjMxSHdhYzZUbklVa0M0YmNtSktvaUdDN3l3Q29xTFRsUEd6?=
 =?utf-8?B?T2pPNnJPV2R4MkZlRE16bzA4REd2c1ZvRzM4Z0MxVmx5ZEV6YXUzMTVUd1B1?=
 =?utf-8?B?Ny94TFozbFdtZHM0K0xmdXlBcDhKNDJiblAxVVE5ZDJRdU5ldzNwZFloYWRY?=
 =?utf-8?B?SjIxTHllK3RKYjFJU01qd3hOQld0aEFTRkRJOXJuRnRzdWdZdzI2YlNhZHhw?=
 =?utf-8?B?Y3FJNUVBbFNsS3FNREM1V083VGxxMXluR0txcWs1b0NFYjFPWFh3MHEvRmVF?=
 =?utf-8?B?dWV2b2VFV1UwNy80ckVZQ2VibUN0RjlubnZuajRGZEo4SDNRRnRKUzVhazcr?=
 =?utf-8?B?MGtIUDY5NmgvTW5FRGxNbkQ3anFxRnVTQktYcmtEUzc1Z2IxdU13aGp6eUpm?=
 =?utf-8?B?WnJhd29JVWIyRDlTUnM2d1YwdVU3TEVqeWJ4aElOWHZoV29sSDY3YWloYm4w?=
 =?utf-8?B?M0hSWWQ0b2lNVlkveERPNlk5YmNjL1BnVTBRUm4yd21TQVlKY1ZSRFBYTEgx?=
 =?utf-8?B?T3FOYWhVSFpsN3hQNjc5cURPS2RyUEl6c09xZ2ljNE1FMExLK0g5azlGVnRE?=
 =?utf-8?B?N3JpRVl4VGNsY21MbmRtN1F6andEK3R2a2wvS2cvTHBDSkg4YnpuV0hXUU5q?=
 =?utf-8?B?RzFpbDgwcFBydmgzTFdkbk9ZUE56ODlxdUtHT3JrRUlvNU03Q2R0MTZseGIx?=
 =?utf-8?B?U2tOUVZxMU1CU2hjNEN4ZFVmYzliZ3U3cEt3Rk5CMTIyM1ZINURkeExTOGVY?=
 =?utf-8?B?WXlJbWp2TmVLY2VwcXZuU1NnbkVHQUVQL1lrQjA3WUJsUGJieU1uS0plY3kw?=
 =?utf-8?B?WVF0WjNtZkdDM0tFYVdPd3NvdzJzZTRFYWcwK1lHalF6TDViN3dvaVgxbm92?=
 =?utf-8?B?K09GS0lQUHNscThoeDJEK1V0RWpxQWtNSVlIM3lub1lhekNQZDV5WWNPeGZV?=
 =?utf-8?B?V1hHMUxVc3hHTm1obXEyWkpTZnljZ0ZPaldnOEZ2a1l0ZTVNYmNBajcvbXhH?=
 =?utf-8?B?aG14L1h2Y1Jta0dDWmlmRjRQTkJmSnN0WVZnU0d3Mi9COG1qRWZCbXJOSWRD?=
 =?utf-8?B?UDBzSUdTbXAyVUJEZFpnb3lGVm5lMzZpQVB5STRrWFpuQ3ByWkFqemxFT3ls?=
 =?utf-8?B?Nzc0VStMcjdZVXpQcGswUklxRmZ3cmpKR1QraXN5eVJWU3FwYTFRb3RrMEk4?=
 =?utf-8?B?SmxtK09UOStmdDlmNWtEZWgrWTVSN0RrS3FiNjZnU0p5ZzBMbTdKa1RpSDg2?=
 =?utf-8?B?enFKN0NGcnl1RGVCSWFaSEdlTlEzK0NoakZJRkNjTzA1RUFxcnJPYzA2UW5q?=
 =?utf-8?Q?8EkVoNGhZJWvA9k5+aTiqr1wkT7/vCp0rCIMoE+i9PBzS?=
X-MS-Exchange-AntiSpam-MessageData-1: +j6uXGQ7cLD0oQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae40d8b1-dd6e-4831-6593-08de842ba841
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:46:57.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/4BMGWWq/VXOYHV+He3Mxklhkq0BgyS2lvbIusvo8YlbR2J8fStQz0m0leBibnsjXqMTvJ9q46uD/+ki26thw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33641-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DACF2AB372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 17/03/2026 13:43, Bartosz Golaszewski wrote:
> On Tue, Mar 17, 2026 at 1:53 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>>
>>> I suppose this is not a reset-gpio-like use-case? Could you point me
>>> to the DTS you're using? I've reproduced the bug with a dummy dts and
>>> xlate function in gpio-sim and this patch fixes it but maybe I'm
>>> missing something.
>>
>> So the board I originally observed this on is a farm board with camera
>> hardware I don't have. So like you I started off reproducing locally
>> with a dummy dts by making the following change ...
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
>> index f6cad29355e6..5e62ffb425f4 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
>> @@ -389,14 +389,14 @@ gpio-keys {
>>
>>                   key-force-recovery {
>>                           label = "Force Recovery";
>> -                       gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
>> +                       gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 2) GPIO_ACTIVE_LOW>;
> 
> The difference between my test and this is that I used foo-gpios vs
> gpios here. I was thinking this would be the culprit but when I
> changed my setup to replicate it, it works fine...
> 
>>                           linux,input-type = <EV_KEY>;
>>                           linux,code = <BTN_1>;
>>                   };
>>
>>                   key-power {
>>                           label = "Power";
>> -                       gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
>> +                       gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 2) GPIO_ACTIVE_LOW>;
>>                           linux,input-type = <EV_KEY>;
>>                           linux,code = <KEY_POWER>;
>>                           wakeup-event-action = <EV_ACT_ASSERTED>;
>>
>>
>> With this I see ...
>>
>>    gpiolib_shared: GPIO 154 owned by tegra234-gpio is shared by multiple consumers
>>    gpiolib_shared: Setting up a shared GPIO entry for key-force-recovery (con_id: '(none)')
>>    gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shared.proxy.3 for GPIO device tegra234-gpio
>>    gpiolib_shared: Setting up a shared GPIO entry for key-power (con_id: '(none)')
>>    gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shared.proxy.4 for GPIO device tegra234-gpio
> 
> This looks correct.
> 
>>    ...
>>    gpio-keys gpio-keys: error -ENXIO: Unable to determine IRQ# for button #0
>>
> 
> Is the above error linked to the issue?

Yes, that the final error message I see after the WARNING splat, hence, 
I was thinking that this is somehow linked to the above.

>> I am not sure if this is because these are child nodes of gpio-keys?
>> Obviously this is not a proper example, but something quick and dirty
>> for local testing :-)
>>
> 
> Let me create a setup with GPIO keys then.

Thanks!
Jon

-- 
nvpublic



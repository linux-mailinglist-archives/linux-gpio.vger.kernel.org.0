Return-Path: <linux-gpio+bounces-30890-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDsiHtbscWk/ZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30890-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 10:24:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A945647C7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 10:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 41097605A08
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 09:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B52F365A0D;
	Thu, 22 Jan 2026 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BbS87uL+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA183233ED;
	Thu, 22 Jan 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073245; cv=fail; b=AdvX7i6cNTVvzgYPfXtYMdaf5En52KmWl9Rdh9wnTQFAGwlZstOClCOB0RId2KigZZwv7mfhSwz1UBaV4kl2zEi6Eh5TONkJpddrucYIbw87HGU7wVkAQ7nIK9LFA61quJzjeVZ+/Fv/OL6x/JP70tr8ufNkUE93iA8NRxvUjJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073245; c=relaxed/simple;
	bh=aPfEMHCQ9Qw0eJ73zQKZUyNcCH4T3nLHpg9kykTUvfw=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SGPDAKOYDj+DjzBQKXAMBAzqflMwA4s8H1HKebiWHgtOrBFGt9Hj3ratRFaf3OQHkBHLayMELag7w7oT1mOx769mEVX5J86Ihp+qNpPcGctbwxu4awnbl8B3WcMwwljajpvltB+6acj+TwF1xx0Lpq+XfS/B72um5eCAwKf5pLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BbS87uL+; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoY/0F6QqYA7zeduC7m4zxUmm4yckEgpcBz608F2nFVym28iaTbOKgbMbItZqmMRmTmHHnP48nqdIy6CHUefEpdQo70wTw9fzYPDceAqIjpdfxHkXsd/FrRe6Btu3oY2jjf6lJBTtCb1NXZU8f/LpnUkgU3nhjSnRmIuZmfVUOUdO5aEewIr8eUrJube75Iq4nW1yUQwalJjrXDH+LDjzS/RO5Z/Dq5xMWnvMH0EwuNTvdm5Czw3QEU1rBjM5I0wLGB93E/1YOGomeUzSwMTS9YS+cLHN22I/1axArJH9dPDeOFQaw3OmSCfdsiiRasqpUQBmT5sft/riv0DQsxUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4uwq8CXdXnyuk4Rr5SN02SZo+yzMQMkBD3SBJBQyrM=;
 b=KI7Gcl9XMocfjSrTvMC3y+O9/qnpWEV606yvaOasiWLqPQ2cAwuZjEq12oELzD/XjLRe/Il1lDVukictjGKhZdoojGxurbwa1hxodB9ATXzUpExdd0szwJtc1DGRpH31FnRA91QS/QqAMo+Hc+k3nZpIxcFE2iHp3XATE6/KxYgNP1wqBx5iKDFl3vmy6Ipq5CiFeFRkJdehjVfI8wtH/JXR2MdsdM7NyRcLuWG/7TTMt7GXdWpOKDBN1cjaUuulzUnKl0I+4BZYsmVAHqSpJauP8XLtNhhjADof/RazpyjG3ShUnVlPjdw0mj5EkbWEj/Hs28hRSBZ0QgNVPdYTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4uwq8CXdXnyuk4Rr5SN02SZo+yzMQMkBD3SBJBQyrM=;
 b=BbS87uL+J5LfORp063dgT0NvihAd3AkhxxNakqNt4CaiOZ7IX0jAj7y4nx226IIDaiAQIiG2byLYbpiKrjJ+QvoW/afdmvTHJQEm37Ss0nc8Wn2cB4/AhL5APyKQT3Z8qQ8P7NwWKRQgPoPUT8Qm6Gsynpvwhcozp0eSz9hsrap3iyhMDAUTlCzgR2+DuvOU4G6vSV08JHOBRNQ+ZYOwd7XVnyuCSmD3v4JijF/iDx27U6/rSTV9MXh0FK+XNcOzEGkj7H0UjTw0pPDLTZNWrjp00E78N61zEp3ruXFUJSppqATTIQ48xb7dJUEbYenc6lWZYR6p28gMLMdgIrQp5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH8PR12MB7253.namprd12.prod.outlook.com (2603:10b6:510:226::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 09:13:57 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 09:13:57 +0000
Message-ID: <c0abf651-ecbd-4ca7-b49a-a74197ed92b5@nvidia.com>
Date: Thu, 22 Jan 2026 09:13:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: gpio: Add Tegra264 support
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, robh@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260114103846.687338-1-pshete@nvidia.com>
 <20260115-tactful-porcupine-of-felicity-ead58d@quoll>
 <931207bd-a24e-46a5-b0e5-eb5307c5c8bb@nvidia.com>
Content-Language: en-US
In-Reply-To: <931207bd-a24e-46a5-b0e5-eb5307c5c8bb@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH8PR12MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: defcd109-50ae-46a7-dc7e-08de5996928e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2FSUExReDgwZS9BY1UzYWJxdVQxN3g2V3lKN1NtK3RVLzR3U3J3OE4zQUFH?=
 =?utf-8?B?N2RxUmJ6NFNkRTc1cmQ4cE5XemFYNWFkZW9mN1R5TG1FMWdxWFNRaHVjMEJj?=
 =?utf-8?B?VkkvbjVKQkFGeEhEbDAyV2JZWVdGM25LQkVVWDlkRmwxeGFqZTlXaDR6T0Ir?=
 =?utf-8?B?M3NQTEhWSmR6bmZPVjNOWHRkeTh4S3BkcjAySWJwTVlOMldNOTNYYjVaT2pI?=
 =?utf-8?B?T1IzU1gwLzhBeTBkVXNLZnprRS9qa1ozVHZ5dnFYN2xLamdVbW4vbmd2YWQy?=
 =?utf-8?B?dlpqckliYjFyWDQ2WGtGUVl2TkJhREJCcVVUQ1c5V0lLbFZ1SS9ZZ3BPU2tP?=
 =?utf-8?B?Sm53ODBsWkdOZ0Z1bG1pZU1SZ2pXSm04R1dYcEdsVWF5aUJZVXF4Umh1V013?=
 =?utf-8?B?WUx3M1Z1NFl1RzY2OUJrT1AyL3BBbDM1MTdsM3l4S2xXS0o1dFJSTW5qRnND?=
 =?utf-8?B?MHQ4b016ZjAvb0xJbWd1bW1LcGtvQytWa0tETjRaUUFEU2R5V2RiRklPOXZX?=
 =?utf-8?B?Qll2UzZidnVJY1JnZVpFd2pzWUNGaHhQOTYwMjR4VkwxczRFaVRTVko5WXVu?=
 =?utf-8?B?bU1EWDhIbk1vQUhNMXBlS1FjczlmZ0V3VUdhQWpPMmxyZ09oeUtRVlFQOHpa?=
 =?utf-8?B?bVY3czJ3YlhXRlJqcXFDaE1TQ0F5UDEwcUU1Z2M0OE9QUEpJdkV1TG5LY0J5?=
 =?utf-8?B?K0Q0K2VTRHFOSWgyZE1BcGdlYS9Ka25YZkxMdDdib0JpeEx0TTNJOWdsOWwy?=
 =?utf-8?B?TlJvS281WHdMeEYzSUpKMlVoSUNTMjAxTUlpRmVCMWFueEVoVE82WngvanBJ?=
 =?utf-8?B?ZmlBajJ0YzVtZHAxb1Rrb3R5UFl2ZGFIaTVKTStDNUhoUmpGZTdNRnJBWngr?=
 =?utf-8?B?aVRQdGYzV2MxTmFVY1prMmU0Y3phQWI0b29KR2wySmVsVEpvZFgyUCt6MkR4?=
 =?utf-8?B?aWJoSW9MZ1dQSDFVM3dHaXZvZ1RrejhZZGs2bXRDOS8rR0N6cm5pSHA4dWVP?=
 =?utf-8?B?dTZGNnI4RzlpZXBIc0NVS0h1N3NXUFc1ZjhZc1dGTzdWOEtqZWw2QUxzcEtm?=
 =?utf-8?B?R2VJNDJwcXAvNDVYR1RrNzkrS3E0ck1Wb09VOUZvem9XM3c0Snl4djNTeGxm?=
 =?utf-8?B?emxCR3RBUmpMdlA1NE5WSy9KcU5rNzRNaXJveFVMR3JEM2F5ZjV6c1J5eHc2?=
 =?utf-8?B?ODlJd25YZWVCdXVvdVhtSTBIZkx3WDBTTGg1a1BoeFlQUjRLeTM0Z0lMbW0y?=
 =?utf-8?B?QkRSV2g1U0dDRnpGUTNmcXBFemp5Y21nSzk3Zm92UVk4UnBoTi9TbGN4RGpy?=
 =?utf-8?B?Q1hzcHZUWGJpeTFxNDA5RXNxd29zWkN0Wk9paHRUV0pVV3FPQmhwYVBvTnFS?=
 =?utf-8?B?TlFVRVFMRVFGbVVtRkw2TFFwNnFGcGpRZWhtZFhTUjN1QmdTNkJGNDBUaHhn?=
 =?utf-8?B?QWNHeDdsWTcrYzhBRnpoaHRERUY4NndYUHJIYW05a1hFeWJnRG1NSHByVmdn?=
 =?utf-8?B?Y1BCMjJlbEc0VlZhWDk4alo4ZFkrY3g0Mm1tNVU1eTBmYm5SdlJiQ09VT0x5?=
 =?utf-8?B?cnJBRyt1STl1S0YrRGFFMHk1UjNTQkVsVHY3a3FrN1ViNktWTEhpZ3ZVU0xT?=
 =?utf-8?B?L2o3ZThPVFQ3SHhoNzZIMVZhS0hjRjJWWGRhMytZTHJjOFcxWWthV3htK0JB?=
 =?utf-8?B?V2luQ3NBQ2tkU2o1TXZhak05eWdTYW9YVUNvbzAwZG5PUlhNNWxNTWFSM0pL?=
 =?utf-8?B?cG9FU0h3UlgreFZvNnVWbFNoUUg1S0htU29LRElPVXlSdEhYd1BJQ2JnRk96?=
 =?utf-8?B?bVpVdHl0L1JRWlI0azl6ZzEzV0gzcFRwR0ZYVTJnS3ZxbFE5OCtSbFlTUk45?=
 =?utf-8?B?U3JhY3FRRlR6TFZFUDF0YzhuZUxyRlViUDJGeWdBN2ZHWVdoOEphWmNxRkRt?=
 =?utf-8?B?NDNxenN4Y3UvaTl3clJHOWFQYjlVNnYyZVh6N3BCcm41bnJBSmI0eVZQTmxR?=
 =?utf-8?B?YXZ4YUE4cFZxeGtlZ25PRWxKNGU5M0FSYlJvNjhQVjIwSndFYTBDYmg5NGFW?=
 =?utf-8?B?bW5RNGhSTnNnSTRCY1VFYlNjQmRvSUg3UFJ4d21ERmdmYUo1MkEwVC9IYmlz?=
 =?utf-8?Q?Ay70=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTVLVWtlNXVTQUYxQnNhR3p4ZHJLamorNjdwYWcwdlkzdWpjdnBreW40U012?=
 =?utf-8?B?eVNVakRGclpnQ0FqdFcreHAzODQzd1Vndlg4RFRieGVsRVFBK3BoY3RKL3JD?=
 =?utf-8?B?dWh1Vk9GUUhOM3RnWS8yeGVtVzNtazZOWGF5bVFrSXF5TXFZY2YyV1hNVHVU?=
 =?utf-8?B?WTBLNlpkdEJDc0FZQ3dSdk9uRENEU3phQW5XdUl4OGhTbWdVV0ZNNG1QS21M?=
 =?utf-8?B?Q1hLTDg4djIyanFuR0lqbnFQVkVaOEVqeDZXTml4aVRONHczWklBem9wb1Uv?=
 =?utf-8?B?Uy90RUd1S0pHNG9ZWW5Mc3hPZE90V3dTa1dhL1o3L3hPOElQV3hQNWtpRW1w?=
 =?utf-8?B?R28wREJ3QVQ0bHVyZC9CMmJnOWZQdVEzNXg5c0ZJd0thUFJKT25qZmhUUENQ?=
 =?utf-8?B?RlZyOUtudzBKNktmREIwRG0vdmkwL0V2MXg5K25TUVEvMVkxUFpQU0l5Uk1E?=
 =?utf-8?B?QUxZa0RicGRzVW9uM0RPZXV1NlYvZG9NbnF3aitHNG5MRFh6TDZCWDV4ZFNF?=
 =?utf-8?B?MkY0VWxmVnJvb2d3OTJYNC92Q09iQ3prMDdGbzcrZ1IrU1FDaDUzVTI3M1U5?=
 =?utf-8?B?bmtlU1JPVEc3aUxFd3VnUnpiR1YvK3J2c0I1T0JYL1AwZ1JmN216WitOTGt4?=
 =?utf-8?B?V1VkaHFnWGJUZC9TTEtBdGUxYVNHR1RTcTliL2FDcTk1MXpFOUFValBWRTJi?=
 =?utf-8?B?MGJrc21tQU1Bd04vbUZBYkFJYWpMa3FVMEJjUzJWR0dVNGYyU2hQRUk0TDgx?=
 =?utf-8?B?SUIxeGZib0IrbVNLdURqVWRhOVI3NU1vVWVsZjJGaVh3NytJSmNsTDhnbS9y?=
 =?utf-8?B?R05MMU4vQVFISjRTVTN1Zm1EQTZiTE5URzdkREtuYkRVWTVIdWtJeU82cGVN?=
 =?utf-8?B?QUNzS2pjVUFGaXVEN2dxbldjS2JtZU14WVNobG1BZnNmZmxtQ0RzNis1bFlI?=
 =?utf-8?B?Y2lBb2U1eTRnakJGMktNTmZCU0VvR3YrdWh5aXN6L2hicDY4Yi9uRnRteHc0?=
 =?utf-8?B?Qk9FcG5hekxQMCtabTliMDlxUm1BYWhZY3U0ZjNqaUlNUGNTamN6VEdkZUFM?=
 =?utf-8?B?OTFkUVdxRDlzaHRzOEh3YzV1YjNjYmdJTGltWDZiK1N2VXRFZzg2MFNTVGNo?=
 =?utf-8?B?azNadmh4ZW8zQTE1a1ZUOWhaNFNLN3lPQVV6TmN3RTBzUzRFOTdTUVhLYVR0?=
 =?utf-8?B?ZWg4Rk1YMHFNZmR0NFZCVEE1d05tSmJxSkJnajFWb2ZoN0dxMCtKdVR3RnZM?=
 =?utf-8?B?VHNUY1dKd2lnaVc1TDhybXExNEhHWXRsb2VkVGtIbVNzdEptZEJpWmJzdUE4?=
 =?utf-8?B?YnBVZUFPUUhZYllXb0tQQmRZOFYremJicUl2Y2xSZm85dUNkb05XZzhIYU1C?=
 =?utf-8?B?RkMwWFNnMmZJam5acWxDWkN5ZmozM3lDR1Z5UGJHajFNTkl3VnI4SkppcG15?=
 =?utf-8?B?TUtjMlI4RmE5Qm9KRzBuZkk3MEFUY05FSHFURmo3UGxaa3BvTEcveDhkeFkr?=
 =?utf-8?B?Zk1oUVR3QnB1NlRiaUVHTldKRUdxMFFMV1FiNVVOOEg0dUN3Z01mSGU5M0xD?=
 =?utf-8?B?YkxJRXl5ZG9LUWZhZVFoeXVjbEIraEFXMlNZMmlQV21USHEyVWRHZElwSnhQ?=
 =?utf-8?B?OG42MCtuSjRNK1lRRXAvOUtqa3FpclhJamd1c0htTDBsN2M3bldwU042b2Jk?=
 =?utf-8?B?bTRlUFYwTjQ3d2t5bG95OERJME0zUnRNU01XUS9EUGFLQk1Zdlo4SEhPRWdS?=
 =?utf-8?B?QzhoL1pYK0pBbExCVTBIT2NCamdxZzZSSjVObzM4SUp2Vjgya1RZdTFFKzFy?=
 =?utf-8?B?Z3VESEFaMFhDc3RCWVJrUmNGZXNhMXRWNnJ4Y2tzSisxVjB3V1gzZTJ3VXov?=
 =?utf-8?B?VTRCWGJRN1BnSlQ1dE9yZksrLzlWYUxlbm9RcXg2ZWp1T0ZLQ2tDSnZoamtN?=
 =?utf-8?B?SlpkdkJjaWtiSjN2VmU4bWkvaGY5SkE3UTdJaHgrRkNCdm9NajFTTW9WcE9N?=
 =?utf-8?B?OCsrbVg4VXA5SFYzR21iVk1ReFZEeTR6WmsrZWN6NlAyWERlRUdTYUZhRmww?=
 =?utf-8?B?dGlZWlFlYTFyNlRoRFl2MjdmUnV2UkxPYXYzZGc0MEU5elFidFdaZTE4eERj?=
 =?utf-8?B?aS9rVklvSk9LbVF5bERIVWh6V0E5MXBSVENiYktBN1NSSU96R3o2U0dKYnpz?=
 =?utf-8?B?bFdRNytnTEJZRG85cHBaZkN2RmdHbkkyODRmbGp2RmUyK280aEd5ZTV1NElP?=
 =?utf-8?B?ZTJPaWxkT0F2MjBQc0pObnZ2SUZjZjdTdmpUQjVVY3BIbVN3N0JYTWJjQVYr?=
 =?utf-8?B?cWE2a1BRM2VrckdVYUJ3eVhuNk9KTk92WTNha0lrV2c2eFF5bHlwUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defcd109-50ae-46a7-dc7e-08de5996928e
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:13:57.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5e/MkoSZiL5m+umWK8vpanPBObYYaVhwFguo/w74xuM0O6mr87AbUSKSgsknnI6p3z2rElhmAukqlCPsXMbH+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7253
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30890-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[nvidia.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A945647C7
X-Rspamd-Action: no action



On 19/01/2026 22:12, Jon Hunter wrote:
> 
> On 15/01/2026 13:29, Krzysztof Kozlowski wrote:
>> On Wed, Jan 14, 2026 at 10:38:44AM +0000, Prathamesh Shete wrote:
>>> Extend the existing Tegra186 GPIO controller device tree bindings with
>>> support for the GPIO controller found on Tegra264. The number of pins
>>> is slightly different, but the programming model remains the same.
>>>
>>> Add a new header, include/dt-bindings/gpio/tegra264-gpio.h,
>>> that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
>>> both of which are used in conjunction to create a unique specifier
>>> for each pin.
>>>
>>> Document nvidia,pmc property referencing the PMC node providing the
>>> parent interrupt domain. GPIO driver uses this to select the correct
>>
>> Why do you need to reference parent interrupt not via interrupts but
>> custom phandle?
> 
> Good point. So for this specific case this is a wake-up parent and so 
> would using the 'wakeup-parent' property be OK for this?

Prathamesh, can you update this to use 'wakeup-parent' for this?

Thanks
Jon

-- 
nvpublic



Return-Path: <linux-gpio+bounces-33605-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cm5OFkpuWkAtAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33605-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:13:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2942A7A5E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50EA0304B385
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591C6364925;
	Tue, 17 Mar 2026 10:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qkDIbFDn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924535B651;
	Tue, 17 Mar 2026 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742332; cv=fail; b=lxI0Xdv2OzlFpOjG8jqnLJr6mIsyiSW9bQFBznkHmfBEbRdvtHq5vl0eAFccf6+qncapfU0p2gdJROUKbgWugzbWVki05dnN+yO60fUcxONaAC+XmyIlGXh4s0XmQbAMdTJ0ovzlht/7dx+J7rHHtyO+JFYbYHuB4qErxVQYdE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742332; c=relaxed/simple;
	bh=IN3ISvh6LoKRDBf37wTPRnIeRQQlrnPKYETFqm/N4Ww=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cJDu6aPFvlkMKPmrNzDkQ4kuxN9kvjmi1A1W6WmJFzXamMptnyKAJxdfiyfXXc9f1olBw9EDFF2o5UAsxrjh6GyHdiFv0h4+Y7lPhj5P5xB1nAm4VilOUKpU10XJjBtBPs10EgkZVST3t66jJhX+4lwf01P4j6VD54nvg3wx84I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qkDIbFDn; arc=fail smtp.client-ip=40.93.198.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfbDoA4yhz/0xXovDModBEMH42NTesJl3XrvXygIMAOWJbC+1xNZDpqWh1bxI6fe0CI6WHp3eiCR2m6Kb6RKEWcd3VO4Q/pbL+qHl+RioIrjfAhFPhGrG2NDf7Bl8TKnAVA9rzS2g0og1lMYqAOPjZv7kL76vVnQLok+v+DhDv7JmcgvNDtGMH1YVvtkJLPP14zpgYjo51FK8KTU/Qjo1AQ7ghlu8BCV3gVbHv7PXrnOP2EbvgkZSKPApp7lDXbQHcTVR0xdli+3iLPUmsXYScvHgn+sElbHrZxlxQPMwGR1qDs9li569J9zx4Z96hcZBReRyZGejPOanFHa8TTXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0uHnczoMLd9Fdm/pWuciYhFZLjFPVZA5u6xW6xlQ2I=;
 b=MsvUolRY538cnyFZiShGaXFIZP9xKMpVcys371WmvpkbkURKy1ywqLZrxUW6H0VIzslTPEAwMuFPPYth8qIGmEjz4QnOOqRNzGSFWCT7ZpW+KaV9m58BgEaAUstohaeSdsi5XOANLhseIIyYu+GOyYeZY7i86YoZxTuDZ69Ua8b5xMX7v+3jgmxwYuiZGaozypzalOxP8cfS4AlKhztssWnx+zDwcx4Z2nJgKmYk3Bi+niyPkXqsfBdH8qkMWdMUNnENKB026zhbMxhpJM3eW2XUkLnw7w6FVIC5MjYYiDu6MLGgkN6avmOTNcaYVXtNmN5TrfyZVH2vpoeTlBkezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0uHnczoMLd9Fdm/pWuciYhFZLjFPVZA5u6xW6xlQ2I=;
 b=qkDIbFDnA13h+lpXW0NcUyOf+bweqseKUY3CDQ4WW0kvpMzYadbODvthrliFsmeTM0ZxudCwkfjbagm3FLCaxFKSQS0w/GRoK6uKdLA7svHXdCnNRag086lVuuoAjGDpkTsksSWKAh5xpxs48MswROLER90yr7weZxrhRpmLoFt2ng5O7lO5y4ubNYNqmwEX+uM5daTC9kkh41NJr7hR4q0RoIhKENKHcenRMeTBa0GvmzOs3fy1IpQJ/60ZlWU9XuJ/uTniiGD+1D/TN3B5nZ7rNy4N91iJqFJcW/8VqenJhfUuLiQv7d2UZS/N9sYUDXUCEHNQPF2c4MYgFNQ+ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 10:12:07 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 10:12:07 +0000
Message-ID: <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
Date: Tue, 17 Mar 2026 10:12:04 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0434.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::7) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN2PR12MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: eb40e54a-22b6-4116-e043-08de840da536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	3hXZLDk6pVcCw+k37N7BSOyxgWmdn3SNAlKZkAZI4rAhughgkFLCaB58IoMsqVI2J/POVzU/r45NMEIeEbaSwvY88C2DtlmS4WlbxNXIbbYKkdvZLcB7GO0gPC4s8XjfXjOBDno9S0hmkgFMe7NHq7pOuu1WJEFHJ0OKPgrtdi+i6KQ0/zuF1eXiiCDm9DP/U+Jw8ul4c3JzNYpR9l6ArRq8b/hhRxSlhGrAZuzf5sWs20CsQViaBiPqtiFedvHXbzRFRWcrtmRHPl4phGc80EDczkmukJIJM39xpYwf7uteI4AKc6ulPWG3mRVNuP5/84vOyXl1jACrHHXA91K5XBq0Va/tjynfTiWaFN+VUTyHbyNQSUQHYPFIL8KbDI9H3FR18dDBcofm7ZBMZRFDPBOxi984zoQwWTPGTMqH+LZEXaji6SZhJHeOq6D4kR7cec36WZb3fmE4vXzKKaXaN85TP0OzO4GyiXbSAWy5wP39Ee2B6/TGAVvxsl/EnptoGH/RkTXrP+BunWLhT0dxziH6kgRRTAGAJNjiOuPTdRLDPJmuJJ9Yr340ffvoKhsO2NDt7MybdVxZRVJJ+wrFT70gcgyrRrCT4tadK96fF0LlOHn9EvXBMA/GaMB1j7U4d60jI6bwY5NRPU42QBQ40QbAR58aX+rEiqsHDUgBNTm1gizcPYN2/E5s6bPPQGhPgqD/YdI96ST8U2xv/B23mGYi4c+Lv5CDQJIe0twZCz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkdNVzBTK3dUbVZVdVA2Wm1SWE5oY21JV1JIdmp4WmVxdDdJd0JrVGNSOEZ0?=
 =?utf-8?B?MTFQRGRRN09waEgyNjVKSFhZa3B6YUV5YzhQYXlFVndFaDI2ZDFUVGUrLzhC?=
 =?utf-8?B?T21yZWRFZy9XeXlkdGtsUUVSOGZOZWQyU3llUllENFFIbFNQc3JGMzVCL0dE?=
 =?utf-8?B?cVY4TjJ4blRUTGdxVzROelh6b2V5aWZ1aDVrQU4yRXZ3WXAvbkVIWDZYek9p?=
 =?utf-8?B?bWc3OTArM3VWK21aakExc3hleTdtYlpQd25CT0l1ZXNLODRvWS9YMGQ2Tmpt?=
 =?utf-8?B?T2hqSlY1bEcwOWhNS1orVW9RcnM4aGFodzFGOVVVZ0NMcWx2aU1leWdiOFEz?=
 =?utf-8?B?dWdZK1dXZ3ZvejZXa050NXloalFYMSsrR1NJREZFdlo0SU90VUxScFBOQTdD?=
 =?utf-8?B?VVMxd1RIYSs2STgvOXo5YzhUcmJHUXp2U3VOb3NZVlZyOVJOY2h3by9wL1lP?=
 =?utf-8?B?VGpXVWtQVENTdXNJVERzZzVxYmlHSFVqMHB5L1U5aXBxbEJUcmZ5Ryt3WktC?=
 =?utf-8?B?ZEJlcHg5a1VXYWp1bVdvUXNBNzFIeStCUU1vOGJZOFV3UW4xemVhRHZ4WFJx?=
 =?utf-8?B?d251Z0huNnhPRzBvNWtsMEVqY0xLS3lvaFM4NlFLbWRPRVVsRWFJdi9hMTlB?=
 =?utf-8?B?Zml5ZzdacWxRU0gxSERmUDVvSVdnRnFnYWhsTG55dlI0ajA5TTlsMndyMitw?=
 =?utf-8?B?QUJhTEVSajN0YWhlSE4rRXd6ZjZmOUk4Q1B4TnNzdFVFL1BGUkdVUXlnN1dO?=
 =?utf-8?B?aUVaZGFhYzJTZVlNdlpQbGVZYk0zVXJyWUt0cGtPdklqYUJCYzFUd0xjV1lm?=
 =?utf-8?B?UzkwczBXN3Q4U3loQ0hmOUVSdFBvdVo2NlUzUWhyd1pSMHF0UU0rUndpOFg0?=
 =?utf-8?B?RG5sTHUwRDlEUkhBRmlRVlBQaTl0MldQWGRTREUzVldPQitPd0pyQndkcXl6?=
 =?utf-8?B?c09kYmNWMG5zRTNLSVVSK0ZMeHhvMmRxMWY3eUxCNUpDUGJZMVhsMWJJekRR?=
 =?utf-8?B?akhjd0trblVSRkNaMzMxbHJkNGpuMDIrakNhVHpmaitMbXBVcFMyYkZJckIv?=
 =?utf-8?B?VUphUmxtTzQyT0JSZUFYV2gwS0gyZTFOS2k2Y3BEZFQ5Y2hsaHluL1J3NFpm?=
 =?utf-8?B?UTdRWjFEeTg5akFiL1N3UDdCaEFGOFR1U05mWWpWdzJoM3hERXVvaU5abjdU?=
 =?utf-8?B?K3c2Yno5WUhMSEsrNkpmS1BnbjVsb3l4QmZyNHF5cDU4WDZNZ0RWN2lUU0Z6?=
 =?utf-8?B?T09XcUFYaG1LWjVBc2JTSVVMbFB6ZmJTcWluWW9pUHc2ZmlNZEQ3VHFRc2hM?=
 =?utf-8?B?RVVyTGYrMFpwYVRLcmRWZEVYS2drbk5RNldONWdBdEFLWk45YzhEb1R6Wnlk?=
 =?utf-8?B?ZWVPL2w3RzlaWDZWdVQwUmdMYkFWUVh5MC9yaXE5VEVMQzZQa2pxeTErYXNi?=
 =?utf-8?B?Z0JZK3BDdG1UZDZIMzdobUJKWU9UWHlpMGlZUVNHSXN2bnR3NjFuOWxQbWxU?=
 =?utf-8?B?V2RzZC80UWs5YnF0eU5BQXJJeTQwOXFxdHJ5ODFYa0s3OEdmcVNQQSt4U2k1?=
 =?utf-8?B?TjBudnpJVGJicHRHVlNvNmtqTUlKRTR4cWRydGFYMWFzdGdRTFFHS28yM0Qz?=
 =?utf-8?B?UGpqNVdJbVhScWlYNm80UVdPZENUZGpuNHVwRmRyMGpzTFpQeldWVzVQN1BC?=
 =?utf-8?B?K0JHRlova21zWVZPRUg0eWhxd3Awc3dmR1N0MlUycWlwaHhDTTNqVkVmT0Zr?=
 =?utf-8?B?bVZidUFVOXNRMnZmK2l0R2V2VzRuNVIyeEtwdm1TdlRmaHBxcHExd0JyVTNs?=
 =?utf-8?B?YkRSSEMwOHZrL3M4SVVKRXlkM0YrZy9sM1h0VXl3UFBhOHRYWGN0Sms3aUxy?=
 =?utf-8?B?Z3NiWFRpTmdzWDJzTWRiZ3RUUS9wbGJES2pyK1RkbFlmdjZucE83RkFSQTdV?=
 =?utf-8?B?c29FbS9Za0t4QzdzWVBjN1NVUUh0aVcvckVab2JPVXJhNlYwcXo1ZWZhc0k0?=
 =?utf-8?B?M3NmMVA4VnprUHZzb2thTHhGU1hmNXNjOXFuOC9SMjFyMVpjQW8vZ0N1Q0tN?=
 =?utf-8?B?YkNOUzR1MUt4eDZ1bEF0bDQ2NklFM2ZwYllJTXFvUWY3REloZTRyZ3VxNGNE?=
 =?utf-8?B?cC9RbHlsQ3RwMDJ4QWhsWjdCQ1B3bDZNbjdwNEJOSlhWRXBpVFJkRXhEaGFF?=
 =?utf-8?B?Vjg4S2RJT2haYTViOW5BSmk2NlBSelYzNG9HRTlUQjlhNVljMFE5RnVhOWVM?=
 =?utf-8?B?enc3cmpuS2FqMzBpU3l2UG5WcEpNMzBObnpaTERqaEtVTUlJUnZKaG1STXV5?=
 =?utf-8?B?S0NNMzNxRTBvTkN1UjRTSjFSMzRZOHNQbFVDQnlkMFdYb2JjYTlGWDNEeTlW?=
 =?utf-8?Q?Yc/snRSPXuZYeYZaEd8yJSsG8Yx+3dtbf5vx2eWsGbmEl?=
X-MS-Exchange-AntiSpam-MessageData-1: DDmjGJ+tEbgOBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb40e54a-22b6-4116-e043-08de840da536
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:12:07.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vf7MAv2zicQuO5J4YgZ8SektZw28F8xdUl1cw2O5wQ/RAfBYGgxSXuIHn+JbIoK0SgcglU4ubPiNw8Nrpipybg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33605-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gpiospec.np:url]
X-Rspamd-Queue-Id: 5D2942A7A5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On 16/03/2026 13:52, Bartosz Golaszewski wrote:
> OF-based GPIO controller drivers may provide a translation function that
> calculates the real chip offset from whatever devicetree sources
> provide. We need to take this into account in the shared GPIO management
> and call of_xlate() if it's provided and adjust the entry->offset we
> initially set when scanning the tree.
> 
> To that end: modify the shared GPIO API to take the GPIO chip as
> argument on setup (to avoid having to rcu_dereference() it from the GPIO
> device) and protect the access to entry->offset with the existing lock.
> 
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/gpio/gpiolib-shared.c | 27 ++++++++++++++++++++++++++-
>   drivers/gpio/gpiolib-shared.h |  4 ++--
>   drivers/gpio/gpiolib.c        |  2 +-
>   3 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 17a7128b6bd9bf6023deccee50b2453caebe3d9a..3a8db9bf456daaf021d3c691677a90fc6da15889 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -506,8 +506,9 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
>   	auxiliary_device_uninit(adev);
>   }
>   
> -int gpio_device_setup_shared(struct gpio_device *gdev)
> +int gpiochip_setup_shared(struct gpio_chip *gc)
>   {
> +	struct gpio_device *gdev = gc->gpiodev;
>   	struct gpio_shared_entry *entry;
>   	struct gpio_shared_ref *ref;
>   	struct gpio_desc *desc;
> @@ -532,12 +533,34 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
>   	 * exposing shared pins. Find them and create the proxy devices.
>   	 */
>   	list_for_each_entry(entry, &gpio_shared_list, list) {
> +		guard(mutex)(&entry->lock);
> +
>   		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
>   			continue;
>   
>   		if (list_count_nodes(&entry->refs) <= 1)
>   			continue;
>   
> +#if IS_ENABLED(CONFIG_OF)
> +		if (is_of_node(entry->fwnode) && gc->of_xlate) {
> +			/*
> +			 * This is the earliest that we can tranlate the
> +			 * devicetree offset to the chip offset.
> +			 */
> +			struct of_phandle_args gpiospec = { };
> +
> +			gpiospec.np = to_of_node(entry->fwnode);
> +			gpiospec.args_count = 2;
> +			gpiospec.args[0] = entry->offset;
> +
> +			ret = gc->of_xlate(gc, &gpiospec, NULL);
> +			if (ret < 0)
> +				return ret;
> +
> +			entry->offset = ret;
> +		}
> +#endif /* CONFIG_OF */
> +
>   		desc = &gdev->descs[entry->offset];
>   
>   		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
> @@ -575,6 +598,8 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
>   	struct gpio_shared_ref *ref;
>   
>   	list_for_each_entry(entry, &gpio_shared_list, list) {
> +		guard(mutex)(&entry->lock);
> +
>   		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
>   			continue;
>   
> diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
> index 40568ef7364ccbf08b7f583e279a7d5b572af477..e11e260e1f590c46c5e575d3bb8f3b5a2240892d 100644
> --- a/drivers/gpio/gpiolib-shared.h
> +++ b/drivers/gpio/gpiolib-shared.h
> @@ -14,14 +14,14 @@ struct device;
>   
>   #if IS_ENABLED(CONFIG_GPIO_SHARED)
>   
> -int gpio_device_setup_shared(struct gpio_device *gdev);
> +int gpiochip_setup_shared(struct gpio_chip *gc);
>   void gpio_device_teardown_shared(struct gpio_device *gdev);
>   int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
>   				 unsigned long lflags);
>   
>   #else
>   
> -static inline int gpio_device_setup_shared(struct gpio_device *gdev)
> +static inline int gpiochip_setup_shared(struct gpio_chip *gc)
>   {
>   	return 0;
>   }
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6e000ad58a11f7e3de85d8a0630150368acc53ce..1777efe1a986c941da464da92255c261f27a5a6b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1223,7 +1223,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   	if (ret)
>   		goto err_remove_irqchip_mask;
>   
> -	ret = gpio_device_setup_shared(gdev);
> +	ret = gpiochip_setup_shared(gc);
>   	if (ret)
>   		goto err_remove_irqchip;
>   
> 

Thanks for sending this. However, I am seeing a different issue now ...

  ------------[ cut here ]------------
  WARNING: drivers/gpio/gpiolib-shared.c:499 at gpio_shared_add_proxy_lookup+0x118/0x1d8, CPU#8: swapper/0/1
  Modules linked in:
  CPU: 8 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc3-next-20260309-00005-g02826fefa46f #14 PREEMPT
  Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-42974706 11/20/2025
  pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : gpio_shared_add_proxy_lookup+0x118/0x1d8
  lr : gpio_shared_add_proxy_lookup+0xfc/0x1d8
  sp : ffff8000832bba30
  x29: ffff8000832bba30 x28: ffff000080d01010 x27: ffffffffffffefff
  x26: 0000000000000001 x25: ffff800082df0538 x24: ffff800082df0528
  x23: 0000000000000000 x22: ffff00008012c158 x21: ffff000081455010
  usb 1-3: new full-speed USB device number 2 using tegra-xusb
  x20: ffff000080d5d430 x19: ffff00008012c158 x18: 00000000ffffffff
  x17: ffff8000830786a8 x16: ffff800083078718 x15: ffff8000832bb880
  x14: ffffffffffffffff x13: 0000000000000008 x12: 0101010101010101
  x11: 7f7f7f7f7f7f7f7f x10: ffff8000827f20d0 x9 : 0000000000000003
  x8 : 0101010101010101 x7 : 0080808080808000 x6 : 15151a0a59460209
  x5 : 000000000000003c x4 : ffff8000832bb990 x3 : ffff0000800fe800
  x2 : ffff0000801c2f40 x1 : ffff0000801c2f40 x0 : ffff800082df0538
  Call trace:
   gpio_shared_add_proxy_lookup+0x118/0x1d8 (P)
   gpiod_find_and_request+0x1bc/0x548
   devm_fwnode_gpiod_get_index+0x1c/0x6c
   gpio_keys_probe+0x494/0x9fc
   platform_probe+0x5c/0x98
   really_probe+0xbc/0x2a8
   __driver_probe_device+0x78/0x12c
   driver_probe_device+0x3c/0x15c
   __driver_attach+0x90/0x19c
   bus_for_each_dev+0x78/0xd4
   driver_attach+0x24/0x30
   bus_add_driver+0xe4/0x208
   driver_register+0x5c/0x124
   __platform_driver_register+0x24/0x30
   gpio_keys_init+0x1c/0x28
   do_one_initcall+0x7c/0x1c0
   kernel_init_freeable+0x204/0x2ec
   kernel_init+0x24/0x1e0
   ret_from_fork+0x10/0x20
  ---[ end trace 0000000000000000 ]---

I see the comment says ...

  /* We warn here because this can only happen if the programmer borked. */
  WARN_ON(1);

I will take a closer look, but let me know if you have any thoughts?

Jon

-- 
nvpublic



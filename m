Return-Path: <linux-gpio+bounces-34578-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEdoEiEnzmnIlQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34578-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 10:21:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E584B385ED2
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 10:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21713301BF4B
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 08:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56643612F5;
	Thu,  2 Apr 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bZNlkKn4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010033.outbound.protection.outlook.com [40.93.198.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D121EE7D5;
	Thu,  2 Apr 2026 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117938; cv=fail; b=t83htkyywQRW1MipXc9GpEJEH5sEwIX809YQzKQc4ys1GeI0gIoMrGN1YtGIhSN6pZBv/dY6sFj8y6sCkvjlTIBfdbHKmWrLbHlAryZocwsUypsUog41cYP5iDHtoqoC2pCIPyjRKKn2YBBzJaIW8dxvw8YstukEw+U76DrIGzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117938; c=relaxed/simple;
	bh=IK2OK1odOiW1cpo0ZVkNiajFWQWncw6B42bPQNH6PFg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PvzEmmAV4splDdgHgDOM448lEieOco/2lw3eYXlH2jvLlIEpAgi/kQuQMXhr1gTJigdRLoHa7Hm5IGkzgi5UaeS1L0MIjk0QOSoJ/H8wIP5pCI9z+BO3q8M0UcZqj7NISO/0jMH0d4SGXFdW7CV/L3Qa1VsviOwV832YJ3KR9YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bZNlkKn4; arc=fail smtp.client-ip=40.93.198.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McuS8V50Yzur4iI1qGkXfBIwo/07hRHEfOJLWazxDtyNEMaFpIDkqkO/xFV6A5cQfFck/YcpcYJrucYhtLhLRIBA6l/qpeujsFa88zehDHm5GPDGlC87WdJ4RktxwnCc3122W/xRr3RlVkwmR7f2MkxEx7Y2eISj1wK4vkjJVmhmYgePwix9FCC6L3hPtrft6NylRz5dQlfyR8GJs6bM2u/lcpD6jbAhMQCqtcw1v9rxLeBfn8TvjfLrTpR6NOgHrpHKQMJl6sfem6kp5rg6A2gc4bBwZ4XX/SW2oagn7cZGMUMCw1IY4u1Jiiche1+rJ1YHqZ9t/iJ/51aEgiVw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+RL/gO9V4/4b+yxtnuc7GnnAgekc7z0QmTVM6zmDH0=;
 b=ayZEt+H4hUICV9J8HdARsDyhPBMbrPFa1+paoCkk2s2/ErF7tNEVudHkoNODPwMJ1FroDPpt3BNyv51pyrEiBn8KyQQH3WB+dGQaIQfk1b3r6F7hGD6ZD6PujLgYuQP1YweRzJ00bA+zGp91m2Bmm3OxbcMKcKEiE7HxR8Id85Vl4LUMDsLUUENThn7axBLcPsmz9pY5hPjEioAEN/KJsq0gbc5X1JrJ6SyLJ7eHFEhtYqMTKin97X8p2ztpA70FegAqaTghlfve31QeorG2gzu2LNj4cHywftF04j1x/pUHxPIKpTU4yRTGajaZhxQfKx6VldRRyEBDD7k4VSLPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+RL/gO9V4/4b+yxtnuc7GnnAgekc7z0QmTVM6zmDH0=;
 b=bZNlkKn4Uu3BOD0sqEFEJMxRwA/zZLMiOZxY8gf9p64g5KBW9SWSG9vrqUczi7bTdZrC1DEFR70b2XEi1jotDTeppqeDutez+QnjQzRp4kA9V/z3TFaJxx6RgupA0j6QGX2AJlGi/BT58Fvosn3KN+RkBBxfyaf6hvUq8TnRBlMS9jYv+SKY63AodT7icnH6F7R0zm0yBoiN3qX+RkyDvioQB2gA8d912+0ldP46gklWsmbkR3OGco7gJeC7mu7B0pEFmqH2Ct54/EdoXq12h0S/JehaIiSzoKptfDG8SKtieiG2g62et4VdPc1UAwLJ3k1EpGuzrQsmd12mh2S+2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS2PR12MB9776.namprd12.prod.outlook.com (2603:10b6:8:2bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 08:18:54 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 08:18:54 +0000
Message-ID: <f91fe309-9c7e-486d-8d35-90cf64869082@nvidia.com>
Date: Thu, 2 Apr 2026 09:18:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: Make deferral warnings debug messages
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260401133441.47641-1-jonathanh@nvidia.com>
 <CAMRc=Me4-KS0=GL8SdwnhzP-YYWoYZpyzciS1L1iF=ip=1FQ9g@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=Me4-KS0=GL8SdwnhzP-YYWoYZpyzciS1L1iF=ip=1FQ9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0175.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS2PR12MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: a99f76f9-df7b-4c74-499d-08de90907b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iUcMsYJSItwrIPzUWrVn4aZt5zdZbE3UgZezfKjZhMYFuezmwip2FyHQpX42YlwGTvU/18MdHgM7j56OtmwhOLjr3P9d5YCgOOG/s6oaOEw02ODhVDOhtSlyUaiHaSAkqvE+/Y9S8XpPiXg4u4iGLaH6LA407GPRGrBOojidybsZv+BklaNPasGtmRT6F5aWrtxiDNOsGO4DAgfBPsE9cbfcBsmzgYQQPbddH9xz0wnFoxjm4pEKftaZciRUfH8zg7T+yFLuLsTSuVEQv9P15OxIFievSLTKA8LlqJPzaQXiwRBfl70uo5Wvg66wXOekVbYNU1IZsyMPD5Dg/G/DNtpF1izZLLTRoBie6D048CIhlBZH6odJ1n2vzGz6ID0wH4e7JV2mOyR0YrgdQuiJ3SPXqzah9HVhxa1e+uCSj9pBB9B3IeTBKx9MR3d3hOf0HtgNCn+/YLObu7RXtQjGC7XRaNKJhXaZWIkxsNejgkFR7p+x+usbsD7JZjRTO0OQQfdiFDboHEss482xE+vFqoWX5Zq869WDQaxwksR0DdF+h5FTowb2Ih145PhCwIbXA3jA5wk0BU9Libp41bQgBpe4QLhs2XqBCjiV3JG0GcMz4vkm9B53hSddFVQZGJOaV8jdW/dc6l73CQk1DvBSPD+C6Rm9mgocBaocAubv2hPsGQBd2IaK+zFOq4DKklkpdj+coLuwvGFnFWwjdaczY5FbCewXjqmZhJemUEI/NPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpwazFkOHN2RnJ3MXZOTkFJd0wvSVQ2cTgyYmxtQlEvNHorbHFqWFp4MHlv?=
 =?utf-8?B?YnRPZ3NhKzBwZWRjaXFUYU9aRlhCMDc2dnZqYTNxcGNhNHEySUpKblpIN2Jl?=
 =?utf-8?B?RHA2QXJhQ0krdytHRDlHN25maTVEMWFvMGFHMnRGS0VpU0hFclFpVFRXMDJ1?=
 =?utf-8?B?emtjUlRaRWhhS2xUZjlyVXQ2bjBVY0orRVdiYUR6Um1lRkE2RE5abUxWZFNF?=
 =?utf-8?B?d2ZNWjBYV3VRcWQ1WEhEYk1JdnNBdmtQQzdlNjVxenpYUm1pSFZYWUlRREpL?=
 =?utf-8?B?Rkk5THhHSnQxUi9JazB3dGgzOUxORlQ3NTU1OXBQMjlCT29YYTFaeWxNR0hj?=
 =?utf-8?B?Z2ZOWmp1clo5WFY5aUkrNGRhQXMzOU42bG9XbUNVZHgzWUlXSHVvWVNlMWg0?=
 =?utf-8?B?dm9jWDBHV2JQb2xKS2l1VFFjOUJsbE9janNraEcwNmNGMlFvQXFZNHF4UzRX?=
 =?utf-8?B?TWdRVENYMEkxQ09wM3RyY1c5QkpRSVdaeUlyQW5xK0tRakI2ZmdMY0RPaXJP?=
 =?utf-8?B?eXR6bitvV1dZVW9keFFXU0I2Rks5cFgrSHZTRHQ2b2kxSUhvb1NFZ0o1NEto?=
 =?utf-8?B?VUdYQUk2WmZGaWtmRTh6STlZVy9Ca1RlSTY2dExYY2pQL2h1Y2QxdWxldjJI?=
 =?utf-8?B?YTQ3U3VSNWl3d0IrcFdKZDVTT3lDcjBpaXYzQ1dxZlcwSFE3ZU5lQUVWY0g1?=
 =?utf-8?B?cjQ4bGR1V0lBbm42aUxqT0E3b1Uvb0dMVjFwaVBRTDh5MTh4eStCN2R0Z0g1?=
 =?utf-8?B?QTQ0TU1Na01YN25tNWZsQ0poYmllWDU1RUk4MGhCUWcxK3EySWU0OUNBUXRh?=
 =?utf-8?B?WDdhemVwQWM2bHR6ZncxWDB4a0VFN2RxN3lhUmRTNmp1NFRpK2dEdnFoclBB?=
 =?utf-8?B?Z2wxTWQ1eDNQbXBhVDcwc3o1Rys1RVpnUmgzWXFpYndwUkZYV0o1dGpYMFd3?=
 =?utf-8?B?OHQ4WXlRaU9CTXo1bWkzakFLTnVVcVA0ckF0VkpvOS82cWsrOStOUFk3aWRZ?=
 =?utf-8?B?ZU1scmtVSlBaREIySTZBWU5RTmdUOUNpbzBTQXBxQWJ4MTJ5cTJlRTZTRWxu?=
 =?utf-8?B?UXhKelU2K2dVdVZSQzdKanhyU2JlTkhEM0FKNXowSzJwVE5UWkJIMEZVbHRo?=
 =?utf-8?B?TnhmU292WjZVU0FXVW9JZG5XbTVpOHh0MXNKZ3VhRlBjUlpCTGw4UG51aGpV?=
 =?utf-8?B?WmhJQmlJcS9UNmEyaFBRYWlsNTljZjV6Y1lRa2pxbjBrTTVQQTAwN2xTamZL?=
 =?utf-8?B?MXdadmFtR2FDTnFadVVmd1JuQ2YwRU44QjVrM3RsS2FzSEdEckltaFJiQ1F1?=
 =?utf-8?B?dE44M0tod0FxOUNUeVNPQWQ3dU5yeVAzWFA0ck5lcXM1YnZFWlRTSDk4NFU2?=
 =?utf-8?B?OHdSWmRyVTZWemwyamJjTTlEQVRwbHFPRlpTTE8zV0ZEclZKVFQvZWFzbkZ5?=
 =?utf-8?B?emdNWlFGZTYvcjI1bGJNcytiZTEvODdHMkt1L2RTVDMveFhRRnRXWVhMbnhW?=
 =?utf-8?B?N0hEOXdUZUtwTHZkL0lQUGhLZmdWY2N3bmI4UGFUUnp3N3AvZHQvME9mYlRw?=
 =?utf-8?B?Y0dzUTVNeTFRbmJTelZqVVdpV0VaVnFLb3FHY3R0OXRwN1k1eldNZ0xQVFJY?=
 =?utf-8?B?dWRZUlB0aXBrTkZ1YmhXSk5yUjJBb3AxLzdLWld3ZlVlV1JHdTZlSlVXU2FY?=
 =?utf-8?B?UmNkVEMvRzZVVUdZeGFFcEtjUVFDb1NlamhhSnNpNmxxSkJ4aDdSQ1Z3RkJB?=
 =?utf-8?B?Y2ZyU3ByY0tVd0Q4T1R4anNDK2wzTWZsdjN1UTJqczVSbzFHUWpKN3RZaFRs?=
 =?utf-8?B?cDN2WGVVNmZKT1BwUG10bVJVQVlqb1lvWGxIZzRQT3U5UHAyREs5clZOSjg5?=
 =?utf-8?B?cHEzM0s1dFRsU0tvZlU4QkxFR0U1L1Y4bFY5dlhqNkUrSkVjYUp3MlZ5c2N4?=
 =?utf-8?B?WkxUV1Izall3UzMvU0NMY0FMWFluZmRja0NQV0JDZ3Q1alVDVkNmbHJkNGRr?=
 =?utf-8?B?bE1VNExHRHJTY3pKM1lNdXJXdHZwUERSTzVMajhIOGV0aDJ6aDdjOU01d0sw?=
 =?utf-8?B?VTVEc0NNb3B5V0FEekZNYkZqdHozK1FTOXREYzFzSmViaU9jbmFVV1hEa3Q4?=
 =?utf-8?B?NEhSOXI2WjViZEh2QzRMQ1VETHFzUWxralM0SmFBOWE5MkJxNCt2QVRzcUJh?=
 =?utf-8?B?eHhSajVmQURCVXhySzRqQ2R1bXlPalJ2RUpxUHp0RVJFaUcwVi9xZXNTVDdZ?=
 =?utf-8?B?RXArQUZreUxVSzBpVTk5Qit0RDNpRzFJSSt5c1pRWGRZQ1Jqb2N2SVJsaGRi?=
 =?utf-8?B?c2N1UkdHeHRxM1JFNXBJSzk4ZkpldDBFbm5GeXRBS0JQS25LcjFiVUdreU1i?=
 =?utf-8?Q?BUbepgluN9djLgrgsADCIq4C6Ql2T5uklP0mFNshY2tQk?=
X-MS-Exchange-AntiSpam-MessageData-1: tvbJYmzUTzsPUQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99f76f9-df7b-4c74-499d-08de90907b10
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:18:54.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Snw8V3YEGVtMXsHtnCrS9fZyFVwC63lsMA4sKuR6ay7aI/2AZy0+5QIyjEi0vrToaxI4jv4PewcTKZv6Jj/J9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9776
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_FROM(0.00)[bounces-34578-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: E584B385ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 02/04/2026 09:10, Bartosz Golaszewski wrote:
> On Wed, Apr 1, 2026 at 3:35 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> With the recent addition of the shared GPIO support, warning messages
>> such as the following are being observed ...
>>
>>   reg-fixed-voltage regulator-vdd-3v3-pcie: cannot find GPIO chip
>>    gpiolib_shared.proxy.6, deferring
>>
>> These are seen even with GPIO_SHARED_PROXY=y.

I meant CONFIG_GPIO_SHARED_PROXY=y here :-)

Let me know if you want me to send an updated version?

>>
>> Given that the GPIOs are successfully found a bit later during boot and
>> the code is intentionally returning -EPROBE_DEFER when they are not
>> found, downgrade these messages to debug prints to avoid unnecessary
>> warnings being observed.
>>
>> Note that although the 'cannot find GPIO line' warning has not been
>> observed in this case, it seems reasonable to make this print a debug
>> print for consistency too.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
> 
> Yes, this makes sense. FYI I also have a grand plan of introducing
> support for fw_devlink for software nodes and assigning them to shared
> proxies with the aim of them respecting the probe order that way.

OK, good to know.

Thanks
Jon

-- 
nvpublic



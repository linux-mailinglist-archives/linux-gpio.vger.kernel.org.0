Return-Path: <linux-gpio+bounces-35304-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oANrLSBK52lW6QEAu9opvQ
	(envelope-from <linux-gpio+bounces-35304-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:57:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 108DF439389
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7FA33038A67
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 09:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F082C3B19B6;
	Tue, 21 Apr 2026 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="anqmiDX9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011003.outbound.protection.outlook.com [40.93.194.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA553AF67F;
	Tue, 21 Apr 2026 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765190; cv=fail; b=s59DppVtO1Xjj/zjQly7N7nNFMRyWh0/PB8BsBhI88yh6AWULNvQKPUcezuom2W/V6JSYS8XsndkQpMjqiA0GkoZy+Pc529NSF8LscA8gxpB8/BE8S8o5SU5/aWiGGAGT16DjnE1NcBkxm7PXiEf9rnD4NwrdIbkE3/gXKegDfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765190; c=relaxed/simple;
	bh=xVOeKoXcrizubKhJ+WsIW3+EbxfiOYpQBvD95qQ+VxU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iViRxBT2dducTBhfIK5EqMobwM0k3GRiBsxi2WnJxGyfH8eNnYkPRwV0jE/PTfdBrNx39+8BQ+WuUcdEff4lCU4woVktjhEsTuX+TVR8g5HqeYJCyFy+uzUx3QPChVyqlxcx+LXBeGMi7epTQMGzLFEa8dPApDCJfHY0BjY0XJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=anqmiDX9; arc=fail smtp.client-ip=40.93.194.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNfitBUwrMjM9xeuZTiFFprLw7j67PO0c4tUO8ZYGjc8NLa8Cn2KjrT4AoeWVnbYagBPRqI59AP7e9LhiumIrrPEHV79D/1aWRnE9R9JF/bcflU6u3ZYAB/DJUb+vlb/7INDZIY7fPOcAwLDZ8Vvcnm3g6NkJe0ARGf1wg4V+rz4pF1whPsWnNOFaI9bljLv/C0MweJR18PWjMy4g6y8MueZ0tjw7UP5EbG86KBKeWst4gs7mKDz1WRcZR8DjvmAAqwAEkf3jWsgZF0HPDm/CTD86ee7u1OAX3xXBHKfZms3XsJGtmO7OHyVeropSZ+GrRQKlAR4uYHd28M+tNzz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koXnFBhrMJkH3am+9N7ZFUrGGycksaYfqv+/V1x4ydM=;
 b=pAGvkdDD6jfHnosKfE7UjCkakt0pJU1z5CQWB4Q9AD79sZeLK5ARxk8XRU+Wb+C3z+jl6FmHohRq4nL50C4Q9LdE8ujXi2hedvnJT5RtYf/yXK0+6vlcyWMnenpadr/ZCXqUidDb4vj6iVxWuUuE4IMgyvl63z8EIwSOPOHQRum+agNzwkpsXxvZ7ham8MLqSkcMg9/u7gx14U/SOhpJBo6Q+iuFqBygaz2al5+Ft0xqsyDvf/PI+VZNsgxn04g582xICtRyfOtepQCDegm2BJ19NAazsOTHtaURieUBwnWtR04sgGvkpd1NuYcbaYq4nnJIuN3qbN0tLf5l3lIeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koXnFBhrMJkH3am+9N7ZFUrGGycksaYfqv+/V1x4ydM=;
 b=anqmiDX9aHo3jbJVH2qzj2g5rXg2MtJLwDImhl6cnKl7fEz0k5z5fw7euKkrcd7UvMUtoPW7wo0iQpHRmJE3JM6YlcqACm4EmUFqY+ngVURiUfMCcNx6qUi9K/JQkvSRg1E3mgqDXfiruK9KNsDLSQ4eIO4xLshe+NK1Je/MK+3iR91rTbp4/ABv82udYE7ixUtdmkawNGfBoyDGuuO0yFP3RoAyxdYeokKETq3bzomORHmDavT7QupLUi5gDIVTLAIEbgS3M6+CvvKvq7X+Gi1baCMBnfAuZJxu6GwU/K7u8LQJG7f8qVG1h16nHjEj+kcqm1jzKZ1zzLmfhNNkEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.14; Tue, 21 Apr
 2026 09:53:05 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9846.017; Tue, 21 Apr 2026
 09:53:05 +0000
Message-ID: <20230743-0d55-43a2-a770-b6eaa7447f0b@nvidia.com>
Date: Tue, 21 Apr 2026 10:53:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Add pinctrl nodes for Tegra264
To: pshete@nvidia.com, linusw@kernel.org, thierry.reding@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 webgeek1234@gmail.com, rosenp@gmail.com, linux-tegra@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260420100601.343707-1-pshete@nvidia.com>
 <20260420100601.343707-7-pshete@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260420100601.343707-7-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: e618d5bb-a2f9-4561-c630-08de9f8bc8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rerT4aiiVc/94jnk0l/vrw/IlXCj7OTjR2N8hJeoexNqiuH/KV/0LC2P3SQZHy6XMb2WyNWYekxPgS8Z7OymPVwG0DHFCvIKKhZ9b+DvHMPn3hIIlMyzC0vcWF4ET6+B+AvuSnN4z3g1VmnZZQkyHu0qrBwkFWNSeOKOLfn1PvrVivAR+EWG90b3TgLJl1kX6DS6B1mw1fVqnU/JX3vEzC2sOrNYrFPTb44x8xbyMnHQWEViNUM84wY028A8wnQoW3yjQTrlzJfrNsfgDiI83+X/QvmMhr1jq2Ig2xzdufF/jgajAVZAvN6EYbl6wZ54U2pk8u5jB6oC2hgZKd52yWMj0sdko8LUTAY+49nrY+1DhKcypcfWmayOeJJ3GWJbfJXxPNGeRjgWjDywYp6EV1Qj09z3BzTYBXKpe4D6/mHcI8RinYNPVam+9+VB7RFmlGPEeNodMhh38QpUy+k57N7fPz8km+AV1YQb1vXVExfGj8AMlGFxGfL7gH6M7sgdPCODvjcOIjzPJHH7cH+yu0pL/weudhkONM/DR2XUUkYZ3UPBKwTifs6fqSYcSZV9yAenyc+i5OiwdTicS6KnqtV7SEaQC5wUn5r/ymiCmBfsDcKtldHlXEPMByqJzb576UXeYRE7jbQoGTUvFCDPl9DGvO9hW7BV6PtcsnUganVc+qkHEyHE6gv7cIt/TO6GIECtDCqtc9CmAlN81LM74QHpl5lVkTB8Ze6yFij9YKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aStVNWlqSXJ6SHFRWVlYcUFmMGNKakVVK1FxUGJjbTMxTlpDYm1EYVp5dGZ0?=
 =?utf-8?B?bHBXZTZ0VDBja09SdlFrTTdCdzllZVRZVmJXZVRnNGxCaC9jY0h0dEE5NW14?=
 =?utf-8?B?SFZZbXBYc2svaEhyaWNVWmhBN0l2V2lrOUdoM0VOSXZGczk1bXRQVWVJaDhX?=
 =?utf-8?B?NlZxRXhvam9HOUdIOW5QWVVOY2xUZkYxdnR2Y1c2V2NRUW13eFlTbWF5WWFG?=
 =?utf-8?B?MXk2bDRuVFFmYk50ZGZtYmduV3kvTDNHZklHdFhHQitxQmxKdWh3Uk9jN252?=
 =?utf-8?B?Y0M0bWY4UCtRa0xreTFRL0xDdTd4Rk1ZUklIbFhxbzhyd2NOcW5xVzhSbk5t?=
 =?utf-8?B?V3hld1pJY01ndnBETXNNTkNOSHdUODZaMjdUTFExbTNjdkRTUVd4SjVrU1Zl?=
 =?utf-8?B?blVQSnB1MmZWTzdlTzhuMnR4QXVhZ0MvMEhUT2tLbTB1cFFla3UvUGtKQjh1?=
 =?utf-8?B?RGtoMUVMUmMxTHpwN1k4T3RmWXRQL1FxVE1ZSFNUdWZmOTRoRWY3b1ZDZzFQ?=
 =?utf-8?B?alovT0h1bkJpb2xGcVJzYndLSjN6RGpySkxnRWVIMEhXTEVEQStjZkQ1a0tp?=
 =?utf-8?B?eWdEeDNBZDQxY0tQYm8xRTJtNzlVQjhnckNnbTdLM1oySXlhaFBTMXNLL2Nv?=
 =?utf-8?B?N2l1NitOTHcrK01WMjFlSHM4LzFUVjd2S1hQeXQzdlFkTi91T0RxZmtKN1Rw?=
 =?utf-8?B?QzVoblJTYVVaejBlMG52UHRjaVh5ais5NGFWamhnVnV6WERiZldocWNZbDU2?=
 =?utf-8?B?VitOeDJ3RnNadzkvWlRuSnlxaWJzYVlEVmF4ZTNZRHpiY2Fiekx6MGZWZjR5?=
 =?utf-8?B?SDVZQ0RvcXJPSzFlTzJGYTg0Uy9kVkh5UzRhMk1vQmVVTmhlOTdmVnZhUVFW?=
 =?utf-8?B?WlltdXJsK1NheVRHUkYzVG1JVDc3MzhleXhjaVRyczNDYkFJRm1iNmJGUTVD?=
 =?utf-8?B?M25HdTZzZ2dwaGM4WDFVMjVpbmIwV0NKZzVMTG1JUXE3SmJJZTZtbGpoalJN?=
 =?utf-8?B?TWhxcW9TYVk1UjYrRlV5amRVdmZnU05seVBJM1Q4aWhaWmg0K3l2NXhmc2M2?=
 =?utf-8?B?UkNDalc4dUZ5SmU3d3ZXemtsRnlveFJxcFRVVnFmQ0NGdjhZYm5ROWZ1Y3Bv?=
 =?utf-8?B?dlJ6b3haRWtKaGluNzFDZ0s5MW9aOFBqaGpYeUFaQVZuSE9xMkZxc3E0U2lo?=
 =?utf-8?B?QmpMb2ZLWG1OOUJPMHBsbFNSZ2VJVUErSTFyQnd3c05ZNUZUNHpuOVNQRVhl?=
 =?utf-8?B?SXBYVUN0aWZaamNpNTM3cTlkZ1ZYUlZBZ05kUk1KL1U4VE9pc1ArTnJQUWVT?=
 =?utf-8?B?NGZPS2NwQWw2U2Z2NS9vNkIxSW5WcnhhNGQ3cWlZc1h3dmlweFlQM3lycTNH?=
 =?utf-8?B?S0xCMk80OWtPK29JeUJNbDNBbm5WUk5QS3A0WElSVWZpU3ZWS0NETHpGN25v?=
 =?utf-8?B?ZEpZcWhmWkVCRFlXMndhSEZZcU1jQTJmcG9DeS9iY0FlK1hiMUo4MGFEdlRm?=
 =?utf-8?B?UGIzZTZlWlgzVm1sVHQvdVFucXhmanZrczdGMmN2RnRtbnl2dC9CbWdSbDZp?=
 =?utf-8?B?UzQ0L3J2dkdiZWVOZ3FoMy8wN1k2aFdiOXhENzRBQlM2dzNHakN2QWltN3ZB?=
 =?utf-8?B?a2U4SU1SNE4xVlNVS2luSUlZOG96YjZ3MlNlWEdrZmt6WTVyWTYydWQxZDBy?=
 =?utf-8?B?ZUdHaUFTelY2djUzcGxzNzdCQ1JGcnVzNk95WGQ1d3RBSk9GUTJQSE03dFZZ?=
 =?utf-8?B?ZDMzWDA3cUlzamlQWW44VTYxYytpNGdGOFkyclkxK016NUNtdTZ5TjIvOG9Z?=
 =?utf-8?B?V1lsb0xIRlkvbHRTZjRNbmdLZnRKTlNhVmp6SG55REl2L2pNRmdlU2xKNnhJ?=
 =?utf-8?B?bGtheU9iSFdrenUxRFI4WlRCWnU5WXNGNnQwdTFrakx5MUZET0xtQ1o3NVM5?=
 =?utf-8?B?SDZueVJVNlNPZldMYnJaVVBXUUlUYkg0N0x6MGtYeVpxOGdSeFhLcndBbWZN?=
 =?utf-8?B?M1BRUmxEbjZZcDJBZUh3K2ZOMzB2VVFyc2MvOHlaZFhYTzZ0b3hIeFd3TnRS?=
 =?utf-8?B?aTZoZm1VejJOVUxSYXNRU0craGpuU0FWczNXTXVOUFg1eTZ4QVlmcnI5Tmlo?=
 =?utf-8?B?MmpGSnl3ZkpKaCtMUHg3cFB4VmJYNk9Rb3BoNXpFRFBVTnA4MVR2UHJyNyt1?=
 =?utf-8?B?dXNBQXFkN3VxcHRwV2FDRzFJSGtwdkpyazVuUW90cmprUnZjanFUeUJ4R0hT?=
 =?utf-8?B?VVh4K2hWTjJPRGcwSFhTaXROTEpENkU1aXlFNDZCdFUvaDFYMXE5dG5oQ1JM?=
 =?utf-8?B?amdhSDduK2lVdkoyK3RraUhNbHdlV1pHZDZxWWxjQktMRHdnaXNWdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e618d5bb-a2f9-4561-c630-08de9f8bc8e7
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 09:53:05.4365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbRKo5bzAyFTpacyx5ssXnnk1VADOwEZl2JhTmUFgTuS8ltVxA41xsAMftac8iXTsh1AKllFNbLBJOuYg6cPKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_FROM(0.00)[bounces-35304-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_TWELVE(0.00)[12]
X-Rspamd-Queue-Id: 108DF439389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 20/04/2026 11:06, pshete@nvidia.com wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Add the three pin controller (MAIN, UPHY, AON) device tree
> nodes found on Tegra264.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>    - Replaces the v1 "arm64: defconfig: make Tegra238 and Tegra264
>      Pinctrl ..." patch (now unnecessary thanks to the 'default m if
>      ARCH_TEGRA_{238,264}_SOC' Kconfig change) by adding the three pin
>      controller nodes (pinmux, pinmux_aon, pinmux_uphy) to
>      tegra264.dtsi.

This patch does not replace the defconfig patch. The defconfig patch was 
dropped which is unrelated to this patch. This patch was added for V2 
for completeness. So all we need to say here is that this was added for 
V2 and that's all.

Obviously something went completely wrong with the patch series 
generation and is not properly added to the series. Please fix up for V3.

Jon

-- 
nvpublic



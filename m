Return-Path: <linux-gpio+bounces-36813-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kpa6DT2FBWrBXwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36813-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 10:18:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D253F2C7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 10:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 341553016B41
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 08:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455063B6C01;
	Thu, 14 May 2026 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FkfxVMZn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59A271443;
	Thu, 14 May 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746680; cv=fail; b=VuBo1Hbut44N4heX2oJPb6mpwiGztrURF6J2U8wyx3L8LgFVooLVtJRF6sasGNUP8VuZ1+nGPk/hpY1LtsIyZL9zWILFP+wraBywqocRgwHrJVbHblWFiHyNgrB8wmau9xc4xiS9JWZyKCaYA0bXS0ibC72oSRdLdppK1Q79AME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746680; c=relaxed/simple;
	bh=IkONeupp8J9C423okMaDvCHXH5SMQgPIGcy5MiRtTtw=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J50B8xONaCFBITpLIB4W92J5Czk6QV3XQmiawpQcNUpu8BiZcNmlcVWvhbd9dEmSfljzkD7dLXH+0FEA0joyLxy/BLeuFuHM1xXt1CzSd3agWLWr84kyFuneeHGmSULH9f0imXdHIR3uXddk+UTCG/vPbTxKfl8HdFAkGZYLeD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FkfxVMZn; arc=fail smtp.client-ip=52.101.46.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRZv1aXAxda4FjxmxOiB5wjs1cw78iart3H3ILMYV6Slws52/5mb2Vs09BFthek46cbPe/jpQzCDU5fjf3p9pQRDdMX+ZtDVFxaJvtSCoa6uRJekksi9GInnI0Ai7yzwQuBSsCI4xI3j8+neV51p4F3KxEW4QUHDqLl6Mb5WTP7UeHrTXzlzTYwz7EkUfoEl3CVCx8bkYsBNZQXVyRXZUsuBb4VedaHxArYtY9mPU58eXJvMNpicv4TmnEbXRgcorC0tirFkmP+5dyQudfr7uRdWfLHOasMUktf7+fcgtFx4Q1bhPmw2wMUuxYkcPy8d1u2d3NHIangOrdhERFZBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxv8zaKprDuAnW7mXyeuSUTCeGO/1DPdtKX9vmHX+Fk=;
 b=JtHRY6VQ/IadbCVKjhCqO4dTofFh6QmpELRanETc+GtRfkO7sCx8dogHI84M2vXhTNFUu7KgQl2XLR5iHwyLAJZpFTjyg4wWjjkeR+bIas6MVuxwnrSs+zh6yIRjtrVZuZTIqf6c4DNxNyNLhR8txB9FUitcfnbnWUdl2QWyshLMQ/gXZRGRETv+qRw/curT4uGQQrDsxyRhGDHCttKd3CdY38R1/WQeTdGHlVnBPmZvOa3v8gz3czdQJKpqNyyDFIzphqXRE7o1wQqCEVPa5NjGdZj6WERm7GwdIG8ConsFKDKODLUimr62lHkltWjY0C3mPSw1feXlLmGGAEGQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxv8zaKprDuAnW7mXyeuSUTCeGO/1DPdtKX9vmHX+Fk=;
 b=FkfxVMZn5VLfwrg5J1x/MjaU474LfQYx96tu/REqSIwNIqMF4iOlfnXAxdKoBsZVOemfQWJq3a/qK8tSJxVx0LYJdobf7p6jX/tzOGmfQD2eZ39HYD1NTxK7QXZOwN4PVzA1M69FUcgZv6XEJPqnpRaav7AsR5DWpZ1G6pSGetwNy217e9fPvegEY+1TOdclzI61Kw8gHX28UdPqJJVLxoEdBE/dsjoTqoa0e08q23irALETgNoFJSA5Nyh695nHo6klF7l6+YJbm8/DqTvVhBjaj41XbS3JhBlnRDluQkLE0PmHjO2oiYTJ+LmIKLbTfpu+fnodvd5cM/orPvTJJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 08:17:54 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 08:17:53 +0000
Message-ID: <53e92651-44b0-44fc-8340-28a3b311d06b@nvidia.com>
Date: Thu, 14 May 2026 09:17:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add Tegra238 and Tegra264 pinctrl support
From: Jon Hunter <jonathanh@nvidia.com>
To: pshete@nvidia.com, linusw@kernel.org, thierry.reding@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: webgeek1234@gmail.com, rosenp@gmail.com, linux-tegra@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427134231.531222-1-pshete@nvidia.com>
 <e134911f-e4cc-41ab-be41-0c559790acde@nvidia.com>
Content-Language: en-US
In-Reply-To: <e134911f-e4cc-41ab-be41-0c559790acde@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 82745dc7-6ac5-47ee-0d6c-08deb1914c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|4143699003|22082099003|18002099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	5IJBDotND5Wz9AMP4dK1OLtaT7Q1tLZ4PEMfUw0ayRmv6lXGQ0ZKHGw/Py9ywyLETlQ+WkIQrU+EHHGa1Jif0x2vWDL30CAhv4SAdsLJlKpLIg47MaxT0czBLwroUwt/X/JCEF06mwvCLhAE6Izz13O+0Ph8KtyvgEHpZLVdj8q115FnFz0dVulcQZTazhRtZ5SFqiDPNKMQxWhlxENQpTCguHXuRcPyDBxiFfmEQMoBKRGNNREk7cmj4xDg4eYGHq8q8UrrT4zpa7Cv0/7G4UD4j6H/Vxeak0lqY48ca29iUZDTWnxnVGDGwTymkyMoaFwamrixiRjJivQJojZyfrA/jlOvFF57pyz5YxvXvhS7LKcQEM2TY0LZ/M9Mk2vgSAsd9GFNQgiEs1eTfGKEZGZarcY8MxkVggi4cFlDbWRHvghd35OR/VSTJzB7LsTINgCo6fRR5Yy6HeXuEsX6iI/MM0f1Gznxdt1HaOhTwHn1cbag/d+6kV8LqUIvknbSi5i1SWZ2tKc8o/Ryj83MGqi9eg3n0Er2UEyeymzCTU+ubFg5qY+fczU+BTQx+I3vvzQwwWcrJZtGxnjG/y4iPTdkYI0frNz/bvZ1q5wAK6ygnWTxhS+kGS5K4ncxQoYK+34WvaAgkgepdMOv5E2IOO3mfvWhLiWPC23c6JgPHDrPCR/NCFwu+7VmDbIC1JA3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(4143699003)(22082099003)(18002099003)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDdrUjJGc2VWUzBOT3piWmExdmpGd2U4RU9zd3doV2x2eWQ0d3RIbm4wK1pv?=
 =?utf-8?B?amFCcnUzNXhRTm5hdGxHZHgyM1hQeGowUENOMHVRMXJaNnM0WW9oa1dzZXR1?=
 =?utf-8?B?YUhtejVRNVFUTm1aMTRjTWFDdERNOTlGL3MvdXFXaFF0Vnl5bU5DOWFFUlI0?=
 =?utf-8?B?WnZYcHpJeHNyK3ovSFRCVEw0WEpub29nYisvMjIzMGZyMXo1RmRnQnhaSUhR?=
 =?utf-8?B?SzQ5SmNEQ2VFRDNTYWprS1NMNWowcU1mY0t1RzVmVjVWd2lhZ2RZRUhZTDVa?=
 =?utf-8?B?aDlQaTR2N3NaMlNCd0pIVVdSZ2VhMGo0aTNwSmxUZ1p1VGh0LzVrMXlwQ1U4?=
 =?utf-8?B?Mm12YTlvTFU4L29rNCtoRUUweWdvYjJWa2ZYMHNyVExNeVpUd0JBeDJ2YzN0?=
 =?utf-8?B?dE96dFd2OXVRaUk4Y29OSWZWVVA5WU9oWkNhaVhRVzJqNGJSQld2YTVwK0Rz?=
 =?utf-8?B?NWExZ1gzQk9iUFd0UTRrcXlxNWVPeXZKc3RhblFLRXkzTG1BU2krdnowdGdm?=
 =?utf-8?B?aVlHT2RNS2VucDRxWFJnRnNkQ092RHB6QmluNG5CMzJoSVdwblJNUVh1bUVB?=
 =?utf-8?B?TXlVV2diL0djeFBsYjBYZ0VQNGp6RjRSNSt1UGsxT0RpeXRDYUlzOHFZaXRX?=
 =?utf-8?B?ZnAyRHoyYTZtUkRiVDhsY2ZiZFhSbjZqaGpwUFIwMGlMWUhoeEliRVhKRWRl?=
 =?utf-8?B?OURSeGY2bFl1aEJlTEUzM2ljelZKNExFaTV0WEY4NUdWSnlyMTFlU2NaYkQ2?=
 =?utf-8?B?dEVrSzE0K3lIY1hXeDM1cFFlTGdwc3Z0SmhIUjYvUkliTGR2bzFCbXRWMzhY?=
 =?utf-8?B?QkZWUG5ZSmJWSkxkaUVUbVNTUU5JWEJodWlIeHF1OHVwY1dMKzkyUnVVek1v?=
 =?utf-8?B?ZCs1OGJ6OGVwdzhaMGF2ODhCa084OUtUVkY0eHhOUGlyQ2thYm00OHQ2QXVO?=
 =?utf-8?B?UzdreEJDeDQ0UXlycDNlVGp0TkJxaGh5a2hWY0FGSGU4NXg0OVFZQitDdDh1?=
 =?utf-8?B?SVpQNWNNaFRHQ1J5MEtrdlVuQ0syR1ZuOUlwbDMxQ2g1OHZjVHJQZnd6d0kv?=
 =?utf-8?B?VGs3cEN2YW1keGt4TWd6MmY0Ryt1dFRhT1QreE5ncmt2ckZoeUJpc2dpbks5?=
 =?utf-8?B?VmMxOHN0Y1J0UGlDN1RuYjBxTElXLzlqVHU3bHBUVmdvTURpNEZmQWVXamR6?=
 =?utf-8?B?NTd0T1huTmZaTlYyakhNeTltSUpvNDkzVWdKaWliWERjZDJHcXVtaGxhbzEz?=
 =?utf-8?B?QnBRMkFWVnNXUUJFZUFtYTNuWWpoOE83bHhoWDUvTFFXbCtrQTZzaHJ3d3h0?=
 =?utf-8?B?eE1ydmhFbVpNWTZpaldiWDVTOXRoeUQrREQrUHV0MHM4VVRJeCtDOGZHOW0z?=
 =?utf-8?B?OUtkVGdYL1g3K09PL1NEMnlBVWR3VWxUSkZmangwK0JUU25iS0xvaWxERUVw?=
 =?utf-8?B?bEoxZ0UrcStYRlk4eXdFdUdPK1IwTnVKbXVRMWJoT1FxTmZycVlHOS9NUm1G?=
 =?utf-8?B?VnVSZTRLUWZlUTA5MGJqZmRwVnoxd2cvM2hTcWxkcmc2YnJoK1UyU3lybG13?=
 =?utf-8?B?SzJDK0VYWnc1UEhQbEpxbnFxT0ZLLzJ0TlpsSGZmaTgyNHZxcEYxYnU5VEdl?=
 =?utf-8?B?NmZTelIrSVZRaVJyc2tzbDJSZi85Y3VkRmhLOHF3QkltWk1yRE5sQ3ZheWM0?=
 =?utf-8?B?WUhORE9ZUDRvRnJNN3BvUy9DU0NzNEYxalR1eXRhSTlrclgzT3RLbTFjc0Ra?=
 =?utf-8?B?MmdjaTFxYWoyVWh1bU9iNkpsdEU4YUVoVm9pMENNVzJvRHFHOXFVb08zbVRn?=
 =?utf-8?B?OUtKVE9keEdUWXFpU3lzRUlvVjloeCtmdGhhME9XazdqRjlpdWhya1g0VlJS?=
 =?utf-8?B?ZmFVR0xJTTdEMDNFRDlwakF5WndBMytUOGtLc1IyZmFUclF5Zm1XdTZ5OXk2?=
 =?utf-8?B?cjBzazlFZ05aUUdQTGlndG1wVXkyUVNRaEdKOENFdWJpYmhGY0ZVREdJTVRj?=
 =?utf-8?B?MlBqempZZEZvdkpQakJaWDJCWXlYSWJYUURpTnVhRDBaUXJieGREL0g5UzZK?=
 =?utf-8?B?Tzl4ZGZVMFpnaVY0VlkxNklXQ3BSd3ZvVmE2aDJua3orc0JDWmtSUkFuYmNY?=
 =?utf-8?B?L3NaRTY4TXZPVlpPWFB5SlU1TnZXdFpJT0xUamhYSlhLdm9heDR2L1NHa1ps?=
 =?utf-8?B?WGNNNGZZYVVhWTZtdXlNZGtydjdnaXVGZW5jVG5VSUkzaVNySHhGM0NtYTA2?=
 =?utf-8?B?ZXAxcjEwZmg0VG9aVzNUbTJyUE5ld3RCRnRHbEZwMWEvODJRSlowTURvREdm?=
 =?utf-8?B?STQ4ZnB1M2Q1SHUyM3ovbnFsQkR4NGpJcnZQNXEwMHQzWU4zWnY0dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82745dc7-6ac5-47ee-0d6c-08deb1914c0f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 08:17:53.9487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD2yFs4CMmC3J/JkJAH+Yxq4teEVaasD5ho+shzVAyIa2UQKCpEyZ4skPlkq5w+J+XtDVEK1AQl01AteTOvX/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603
X-Rspamd-Queue-Id: C46D253F2C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36813-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Action: no action

Hi Linus,

On 29/04/2026 10:38, Jon Hunter wrote:
> 
> On 27/04/2026 14:42, pshete@nvidia.com wrote:
>> From: Prathamesh Shete <pshete@nvidia.com>
>>
>> Add pinctrl driver support for Tegra238 and Tegra264 along with the
>> corresponding device tree binding documentation. Additionally, export
>> tegra_pinctrl_probe() to allow the drivers to be built as loadable 
>> modules.
>>
>> Changes in v3:
>>    - Wrap commit message to 75 chars per line (v2 was too short).
>> Changes in v2:
>>    - Drop the "arm64: defconfig: make Tegra238 and Tegra264 Pinctrl ..."
>>      patch and instead add 'default m if ARCH_TEGRA_{238,264}_SOC' to
>>      the PINCTRL_TEGRA238 / PINCTRL_TEGRA264 Kconfig entries so the
>>      drivers are auto-enabled as modules.
>>    - New patch "arm64: tegra: Add pinctrl nodes for Tegra264" that
>>      describes the three Tegra264 pin controllers (pinmux_main,
>>      pinmux_aon, pinmux_uphy) in tegra264.dtsi.
>>    - dt-bindings (Tegra238 and Tegra264 pinmux):
>>       * Add 'required: compatible, reg' to the top-level schemas.
>>       * Switch 'unevaluatedProperties: false' to
>>         'additionalProperties: false' on the top-level schemas.
>>    - Reword commit messages to use imperative mood.
>>
>> Link to v1:
>> https://lore.kernel.org/linux-tegra/20260409131340.168556-1- 
>> pshete@nvidia.com/
>>
>>
>> Prathamesh Shete (6):
>>    pinctrl: tegra: Export tegra_pinctrl_probe()
>>    dt-bindings: pinctrl: Document Tegra238 pin controllers
>>    pinctrl: tegra: Add Tegra238 pinmux driver
>>    dt-bindings: pinctrl: Document Tegra264 pin controllers
>>    pinctrl: tegra: Add Tegra264 pinmux driver
>>    arm64: tegra: Add pinctrl nodes for Tegra264
>>
>>   .../pinctrl/nvidia,tegra238-pinmux-aon.yaml   |   82 +
>>   .../nvidia,tegra238-pinmux-common.yaml        |   73 +
>>   .../pinctrl/nvidia,tegra238-pinmux.yaml       |  219 ++
>>   .../pinctrl/nvidia,tegra264-pinmux-aon.yaml   |   80 +
>>   .../nvidia,tegra264-pinmux-common.yaml        |   84 +
>>   .../pinctrl/nvidia,tegra264-pinmux-main.yaml  |  167 ++
>>   .../pinctrl/nvidia,tegra264-pinmux-uphy.yaml  |   78 +
>>   arch/arm64/boot/dts/nvidia/tegra264.dtsi      |   15 +
>>   drivers/pinctrl/tegra/Kconfig                 |   20 +
>>   drivers/pinctrl/tegra/Makefile                |    2 +
>>   drivers/pinctrl/tegra/pinctrl-tegra.c         |    2 +
>>   drivers/pinctrl/tegra/pinctrl-tegra238.c      | 2056 +++++++++++++++
>>   drivers/pinctrl/tegra/pinctrl-tegra264.c      | 2216 +++++++++++++++++
>>   13 files changed, 5094 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/ 
>> nvidia,tegra238-pinmux-aon.yaml
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/ 
>> nvidia,tegra238-pinmux-common.yaml
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/ 
>> nvidia,tegra238-pinmux.yaml
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/ 
>> nvidia,tegra264-pinmux-aon.yaml
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/ 
>> nvidia,tegra264-pinmux-common.yaml
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/ 
>> nvidia,tegra264-pinmux-main.yaml
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/ 
>> nvidia,tegra264-pinmux-uphy.yaml
>>   create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra238.c
>>   create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra264.c
>>
> 
> 
> For the series ...
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Please can you let us know if you are OK to pick these up? Would be good 
to get them into -next if there are no objections.

Thanks!
Jon

-- 
nvpublic



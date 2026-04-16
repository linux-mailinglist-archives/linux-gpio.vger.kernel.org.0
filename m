Return-Path: <linux-gpio+bounces-35178-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHyIObN74GnlhgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35178-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 08:03:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1540A8AC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 08:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3443C30C98F6
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 05:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9281F379987;
	Thu, 16 Apr 2026 05:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5XZ4sFzO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B88365A03;
	Thu, 16 Apr 2026 05:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776319120; cv=fail; b=Sbvo6Ju8MTe/7ljFtDRAADLTIZFg1qmhXVAWeJHKheQucETW/8JrLQWqQJpP3ZZ1Iw2aoRQk35Fxg1+IunLQdN1H3fntIelNOBhziabLQ0qttHVTX6Wh5ufGBFLA/mS77rLM9dmeNIIwG4rotJTC2HVJjqmK/nI18vB629IwUU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776319120; c=relaxed/simple;
	bh=ctOO1uZdqGnRagP1cpcr7CCUYQAFCO7No6rUttjdD3g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HBzXfe50WaxMh409fPw1qcoi+FAHJLGlyUokLOgZ7QCXfAh8Gdl64tloKVLcvytehK/Nx1ftzNzSoeS7K2cCI/+8jwWhbArrrQZrIgEUakMZ5LTI09aY7a4NXJWO6QsTzxunGlu7dL5qo4z4zTHAxs0dK38su1JquzUHQcfL5Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5XZ4sFzO; arc=fail smtp.client-ip=52.101.48.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFAMyPw7ogLTVyravoA8ttht+PtBCGpbmsAJ5KXM6lZ+zzuzKzC9rYKZU5Z+/Ue3P6c+FbCfxN/IwDbwWrGoB+x9+nPrFifRATtEKUh8hy2b5JMCWeaXp//J2/8BmFSOS1v3wiDwp6DzHk9yYeGhOQa15+JO1wRU201NDCqRHt6zgXh8P7OTfctyHCkXCAPx6DluStZkYnu3SQPEHeLNT3WCywAgGRpR6xs2qvRWBIQFOh+KSLQkf+Oj3Arl+m5hz60wDD7cWwoW2M93/tNBw7rvoC4WTjmeJSdj+01MhzFAfyVbXfn2w8yWihP7FlLkxx2F1oAGKtctrolFBOALvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFnbdT8miUSU+QKIasjRWWR6UcLK5wR30veHlsPQ7Tk=;
 b=Ybyg2xQJgFS8EKQkPHDXAM2qeanDazw1Aw36n0Ud7Ab6nZVoIYWDcGV2Y3rWo6mftWu+ePZF6KB741AhdP+3B0QtthotyLelKq0sg/eZN7izscwfWEaIvay/Ij2jSDj+u8DirrVTcru4IjUA/iiuKfRM+ICptYCBVV73nVp1VPzbxkqVJ/hKlCC6Qbghsd1X1BXTidQUuTPJdF/VzXp7DeJVwkb+YKRi+BFu/g/GSwKFeRwdQHoWnxbLefi1JCcSXz3vBuCnBAszPJ2zs0dinm2YhRJcsEb2GGZ/vpK8wBCEwZgfXx/FfF6RAbrTXt/PqA8pM08JVjXuh4r7Gske/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFnbdT8miUSU+QKIasjRWWR6UcLK5wR30veHlsPQ7Tk=;
 b=5XZ4sFzOVj2NwrCRBBW/brkHkqxsf6f2jtBkait/RfqE2gDc1Q1s4mQjkaT3MJBT98uPxrBjp619yBQu3D+qTcEMjxOTffPWQSpNSn/6KQOJi4LXyGikZb+hxTWlUa27BqPMlbnS07fsI+zohg6+gSgUo4sO7HJi56UqMowfoU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 05:58:34 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 05:58:34 +0000
Message-ID: <c973f9d4-9bb5-40f4-8f09-72e23f92cd2d@amd.com>
Date: Thu, 16 Apr 2026 07:58:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: gpio: Add EIO GPIO compatible to
 gpio-zynq
To: Conor Dooley <conor@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
 Srinivas Neeli <srinivas.neeli@amd.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
 <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
 <20260415-rectal-visible-a8ccb534a176@spud>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260415-rectal-visible-a8ccb534a176@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::14) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MN2PR12MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dfe2a6f-cbd5-46e5-67de-08de9b7d31d5
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8EpL5UytAkCdMzZ3PjRY/bcd0Ggg2ZIMa/wD78lZP3mS4XG/e66zpo6Vo0mqcnR8yB/0Dk8yiEQvPsWsbAl3ST9CFzgzSuMVLDW0uwoP12Eqoe5t5HubNCMODAo18OEIGmnZCR/IMxRjLSxWZpaz2GGPf3lVEM90H98LazYJ/HDUfCdpODdi5n/axSFTP2tgqj8ghv78Ey4vHCAvNy6h9m/7QSMp2/OiajOZN2Z22EWBHCEx4CTIbMvWaE5jwz96mWDi/6omuUlqx+qmD5V8X0I0f/XHONaOeyldelUeH35Am+O+RuWNEA2izOyCFss5R0sE2igYEgAFX1WScUEWwbqGeXhV3Xlo0i81bHA2R8qpKqyd6UVGOeXsIuiVbDaYs55USUS8h6gbnW3yGCVxQwVzCA1I9NDr9cT1w9PUrP7uMgCOuRcjb3tYdMFXXYP/GciJNQ8JYussRWOI9b8pcvjtuZfF+9/J5QomhRV8xQT4JKyclxdH9TQ757cNWvVMfPxOEZW5Ke89CGOU4BcEZ7QH64e4PGMbjnLpnyCZFi30yVQQmaQ+9AMKjrTR2Qs1N6hh84e9vIOHZGTJZEov6ZLfCFefMByUmgAy+mEWUZ1jGnvczem6kadDjSoJx4Bo8AhnQ33Bu83Kh0xokK9Qy67LnRp2y4sIoPClyT8Tx1FFTvW3ySWrJGjGhn/k+rVS5vJnx61pMRvcUgoIOIyZWBcKXiYIIz4urzsjpn75o/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHBoUnp0TkkrcFRlSERsb2tVd25ncDdjKzFxMWtiRDRyYUYrdWlGVG9rZTRI?=
 =?utf-8?B?V2J5Z2x5Ky9yTk4vNnVLVEplSCtjNUY2RVRzMG1mZTQ1MmVVYTJkNWZGQWZu?=
 =?utf-8?B?VnFvQ2lSUEhTRmlxYk9WcFBhK1gvcElVbEhBRHR0OW5UcTR2ckZUSXpzTS8x?=
 =?utf-8?B?elpQcU1BQ3FiVE90RDFSRUdpYzFtT2gvK00xNm9YaWJ4ZTYvaGpka0NieVJY?=
 =?utf-8?B?UTM2V0RSZXJYWlpvZnZBdWpGMGFNcUNsUzJwR2pWbXNjQkJwdmh3cmFMTlcy?=
 =?utf-8?B?NW5zY3RXZjd6S25VNUtqL1dJQW1WUldmVUI5M2hiYU4yQ0M3RDdWdzVwR1Nx?=
 =?utf-8?B?N3h2KzdCZDdROTdkbjE1cXNONENSSWxKVkt0SFd5TUJHTkNLc0hJanV6K2gw?=
 =?utf-8?B?QWpYeVNIMWUzRTZDanRYK2h6eVp4ajlnVEhYSjJ4Rm5VUVM1c0xRQXh4aW9B?=
 =?utf-8?B?MGw4Y2FNejI0VFVRSVVWRFNLU21Pb21BTEtsTmdtUm54bFEzVVJiUkp0NFhJ?=
 =?utf-8?B?STM1Z21qMW11VExZRU1QbzhlYlEyRXNRUjJJTWNHdjd3MGlMdDBmc2NQa3BQ?=
 =?utf-8?B?RDRLbEltOUpHRXBNT2JqaWxwbENrKy9Yayt3N25VbnI2dWdvUlk5a083M2Yy?=
 =?utf-8?B?UWlEVDZBWXRMbEVPVE44ODhXUktveDRqUW1vZDQ0S3lYQkxoazZROXpUMTJh?=
 =?utf-8?B?ZWNDQzg5Q3lRU1JoQ2VnVERNeXZvRUJVV2U3eUZwUTlpdkttVE9yckUxU2NS?=
 =?utf-8?B?dHByVnlxMFVSUHNGZ0d3T3lRUWF4UkdvaXBRWFdnSC8yMjRPakVqOWwvbjdG?=
 =?utf-8?B?Z2ZZU0NsaytZeXQ4TWx5dnI3SENRbTA1WkQxSzlxUkNVamRQS1BKOHZMVkYx?=
 =?utf-8?B?ZkV3aXcxQ0IrWUVONGJDeDZySjhrT0k1RmQzN0gwMDlPeVVqamhaVU5JNWlh?=
 =?utf-8?B?eUFwcHJDTVdVRVlBRk9DNzJxNDBNenk4eDRXVjZuOGhqQ2NQVHhXZFUwa1E0?=
 =?utf-8?B?aStaQnQxV3MvN2VrNmNwYlRKYXJ4Q0U4dFlJTTF2SGZ3SmQwRWlXRFRmTitR?=
 =?utf-8?B?Z0lHSmoveFVHekNvM1FwWHAxRFo1TnZ2ellkeFRjeHVZbUU0RTBwMkZyd2RZ?=
 =?utf-8?B?QkNpY3MvbU5mczFrbVVXRWQ1MDhOV3NxRE9yZXVvTVpLWU55Q0F3bVA2cVFX?=
 =?utf-8?B?bE1CaFp4RU1QcHZrcVdFWGRPL3J3K051U1RCbitHSlBFZGpZRU44WStNTm16?=
 =?utf-8?B?b0VEMHlXeFJJSlhQRDVUMVBMRnVTMHZOdnZPK1RqRTI5U1hCdy92MnQxK3Jk?=
 =?utf-8?B?TDJTOFZGeGIzR3dNdC9seGFDckF4QmdHREZOcjhkRDVYUUJEdkNESFdONXBD?=
 =?utf-8?B?enRjbzl5T0ppd2FIMlNiaWRsc29rZzduZmxyRjRhYnF5cE9MdklPUlFlaDh0?=
 =?utf-8?B?b1gyQ2UxbmFYRnFjV3duN25IbzQvNCs5Q3VHZnFvZysrZGkxVFE3aTN3RElZ?=
 =?utf-8?B?ZVN0MUFTdk5vSzJJemhRU2FUQkJ2dFA3dXoxSnlQYjNoTmdSRXFMSVZxcC9H?=
 =?utf-8?B?RTAzSThzVXdCbFN3akgxczYrazNNTm9PcGFEQXRiSmxVUU1SUjNiaWtENmtR?=
 =?utf-8?B?ZkF3QnhOK0JGS2JSNTlVbW80cUswVm83aE9qYnppY0ovazNUUzF6NHJYL01L?=
 =?utf-8?B?Ykx3c0lDTVlxc3dxVE54T0JtRmhaRHJrVmJkOFpZTWtBU0JCbE9HMmlEN2hw?=
 =?utf-8?B?eWgxSlBwMGZVbXl4clVhcDYwQ0Frd25WeVdFUVlTRFkzQitvQnZoSDQ0TTNG?=
 =?utf-8?B?bU5nQmRGbTdMaFhRQ202ZllLcHlHeGVJZEFZbDZaaTJzQ0toZ2t4MWJRSk5v?=
 =?utf-8?B?Sk5OOW1VSkFaYXhtbU83QUEwRUJzYUhsVnVGYlVkdUZPU2tMb1lWaytndjhj?=
 =?utf-8?B?cmkwb0FKRFlhaWRWUmtodmhxMFlEQTZVY01OdFkyZm1JNFVvVkV3MGc2RkNp?=
 =?utf-8?B?YnpqV3d0SjRBWHVjbmVRaCtqVlY4R2RiOEFvb3NoOGxITUE3ZG1MZEZxTEd3?=
 =?utf-8?B?MFBkMXIybCtENHNsQjRnNC9yTUlyK1VXRWNmY1h6UXB1aGZZZzRLQ1pDYjBo?=
 =?utf-8?B?V2s2RG1JTmJaTkhiQy9YWjYyL2F2NXBSOFh6dkJMTlZsZlo3NVZWS1B0ZU9N?=
 =?utf-8?B?TU9ENEg4RzRqbW1nR0ZUWnRKTUwxc1B3RmV6VXI1YXpRRHljNzNEY1RDSElW?=
 =?utf-8?B?OGRYMmU2MFFFZyt4L0gvV2t2Mm1zMWF3L0d0aGFiRnVMc1ExOFZLcVpmWW9s?=
 =?utf-8?B?T3RoVUVVTnpwZHI3MTN0cHdoRlBXSDhIb2YrUkJOTkMvL0tqVUhlUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfe2a6f-cbd5-46e5-67de-08de9b7d31d5
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 05:58:34.4207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+9FGos75JLPEbxhSB19oF/3yuPI4OBu0h9wb9w55Bn0IHPUpyyHsuH+R40yU+w6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35178-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 26D1540A8AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/15/26 17:01, Conor Dooley wrote:
> On Wed, Apr 15, 2026 at 04:26:27PM +0530, Shubhrajyoti Datta wrote:
>> EIO (Extended IO) is a GPIO block found on xa2ve3288 silicon..
> 
> 
> Why does the compatible have a "1.0" when it is in silicon?

Sorry not following what the problem is. Yes this is hard block in silicon
and it is silicon v1.

> Why doesn't the compatible contain "xa2ve3288"?

This unit can be used on different silicons too.

> Why is this device not compatible with existing ones, since
> gpio-lines-names appears to be the sole difference?

There is no way how to detect gpio width.
Pretty much soc_device_match() to some extend could be use to detect which 
silicon it runs but on this particular one you have 3 gpio controllers described 
by this binding (pmc, versal and eio).

Thanks,
Michal



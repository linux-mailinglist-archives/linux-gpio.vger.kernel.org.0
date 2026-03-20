Return-Path: <linux-gpio+bounces-33896-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MXoJVwmvWmr6wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33896-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 11:50:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 181832D906B
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 11:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A8D301BEE3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 10:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855D53876C6;
	Fri, 20 Mar 2026 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ivcw7/2N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5943806CA;
	Fri, 20 Mar 2026 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003789; cv=fail; b=NzrZcBvEAb3++PVTzKIbQQJtXGT+b1Q46J3IFwKIr+a8Ne5QhCTzE+dXROtOcEYB0BsPzszBsclmvzgnQtz4j56UbkZ6gMQy6rtrs4dJleLKM846Uz6Wjaytr7siBNZZ/hQnhlf0WDSpqSd6EK4sN2ANdjm/ENxYvUDI5pTEFk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003789; c=relaxed/simple;
	bh=pvHkdOOobL7XUuNDMCi00N8H2s7FPsycdwqSjE/6H9A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qz03ifRLYQDkBNxzMXH2nD8DZuwS2MgizLg7xMUU+JPlQt6f5CWJGjk+wF7hhgNM036MPu0xkuJE/LyNyjsnGVrIshqF25txIz8OqGRJlNFXUclNzGNu0NltHym83MCcBrpfiPB9WkbLdEpU5HHgf8tqTvooys3zn5Tkyfl+COs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ivcw7/2N; arc=fail smtp.client-ip=40.107.209.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzuHBLr+xTNySchtfuR1/Wy87DPnyIDZIrmnxFwcpqGKR7V06yv3tEdVbc4jjeEn1bgdY1aBrwJOQuHIdOKaIaPxzOqMMaolJZw8Qd/oRD6JNKgPvsSI0RY9k2/RreD8O1GEIN6hCmoitW4fy+NF9geA9RoPkgXqA+GG40XynvxycAzOThmv0r9bay/M8V0PEulMBkBIb21ILElWsYGHSWup3/m1RvwHDYdqkclNvDvgNSx5Y5B2acACQB/UFvyIKSqGG/3SbXDS/RbwJaD1e6X01+ECNGxrewxxyPx/HAIWgeAhzhuKS52trMvuX6ThxNPMYxA5NBgkbjd8MJtcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ3MFsNZbEcKQwt/6YgBDIdFSG45wred3YQGtG5DNGc=;
 b=lBCaRYuGx1yS3Edl2GSmRZELFrrYCZo4P2GcBPO5Lxuoyn/76udepMI1pYaHveKOb1x7VNrImfQy3UVWj8h3KrXdTMBeSLQFRPo2+y3OFjj2XxvrpJO+sxshZc1r5IQEidw4yQAoV/gtVYiJGq1UYxjVvIsbktMMt/qGBdI0RcofEiJ5WkwOqT8vE8Aa3N/UHBkdWsiSjgswuTU34Pd2EIADZzpLf06ANl5xsBgtfaTIq3L7EedJqYvednhMnUCTSaBjVOdE2Xi7vL+Es9yuz+emFN7TbaD+W2i1xQuTcXYPwUoAwFSYac/UCX9tUqrfoV/wLzACPKSMjMfberefhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ3MFsNZbEcKQwt/6YgBDIdFSG45wred3YQGtG5DNGc=;
 b=ivcw7/2NyxKOS1heZa6natL2lRaYn6IeY2n2+qh6IjKfTL42f/+jBLdr5M0mUJZgU6RwTI6d/YptH60OJ5MlVfkmzQtVDoJnKoKn/d3W70Q1bKwcEmMFU/Ed46lhWhCEsZD8oMrBFfbXbOgxZoT95sean7TXCbW9YYfvMCLfToSRCr/nJQMn0/mTn5fH0+zR/7jJaXhvJRHX1OONvQmKbN4ALs9Jp1n5YV4ia2b3P858PsOIWk+TthtwcXpgV4QkmdDAPJSvSizZ48GR9OpKGgzBYNlKdbKXQPsX3q95JVeXBvSMww+ZX6HiZ8GJWMTuTJ/g2Ffn6wnWDJmRuJqigw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 10:49:44 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 10:49:44 +0000
Message-ID: <c5685e0c-eca6-464e-b2a9-d688918b966b@nvidia.com>
Date: Fri, 20 Mar 2026 10:49:40 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] gpio: shared: fix devicetree corner cases
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::33) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 46aa4ac1-f41f-4324-a986-08de866e658d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|22082099003|56012099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info:
	G/JW0B33i/ws23FDHHLpXsMZlEM4i83Lc5yst31BVdMXARKVtlgy02hAO636CikGc1Z5Useuex/GUcGW4YSk9WTpNRnk4C2dto3PTbeov8rG8aKTUf591EAdVSu2WbbQD/PImoO5QkWuVNlXIHQu/szCL50pR2cwYL7yrP3GKS7eTfGiy/4TNhnYZ9MjYpH7KGktr0BDLuji2X58hhaYkIpOvzAfQqmQpcWuHEHLyWEsAVwuk0OThwFNiKXqTTxU2hIP7g/m6UctkX/DIPalFDw2tNGpfKE2/Tve7HVIM7Pev6xfW3L3byuManhttOTJHzc2yF+qVwZQ0gfKQp8v3seSO92kCZ+BKHLOSq2rDVpDr7qu6wz7SUgLaRkoTBMElTGPjicxdJ9ZbwF1XUzwqA6bQXwqKIc5OKbYXUnXI8la82PCb5+ItCz4+rf1MnXRoYwU8VjxgOKxY2zyZP1NWhzwc6Ii/Vifsl5rqc3I0h0HzPeIGGWvkyI/qfniHA7D+Tvz4qM/IkXUs1KrG4P8Y2y4Szy00hMIfDFKEoZ8zczJLod3ABJyp3PuDQWZfaSh5veM8eV4Mk6YYACBLRViPrJJNk1rKDo0/ynB8g6LcLU7kZhKN5Q99SrAq61HPXlDW6gi1HPbDVMvUDD7ofboQZlsTjuN7lOFywtM0zvwPwGeJg6HQ+trUiESeMU8kQ8pxP5BzuseyrKsVF0WMNYKig9J2U7iwiYHNu3RG+z5fOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(22082099003)(56012099003)(7053199007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUoxRXJmYjNLZlphZHJuMURyaFdOODJKdVVGT01PWFhMQld0V3llKzVNdVlU?=
 =?utf-8?B?SjM0ZXRBMzFBS1ZvL0FYM0VzOG9uL1hMcGRramgyWFcrV2twd1VLZy9jTzRZ?=
 =?utf-8?B?aXF1ZElrZHBzT2w4TC8wRDc3dy96UkFiSGl1T1RUbDkvdTZ5S0M2M0xUQk9C?=
 =?utf-8?B?ck9YYVNNMUViR0hBRHhBRmU2RXdtd0JuSXV1UEVZUFFrUnJ0VktKb0szZWNs?=
 =?utf-8?B?SVRNSC9ZTFhKSGFacWtSNFhQRjV6NzZld0VTNVhCS29KN0NjV3ltTDVsT0Jn?=
 =?utf-8?B?ZW1GS0JOSlBMZlRiYndKY01tZ2krbW92MmJITzFaRXp6VHpOSThSbUErOHBs?=
 =?utf-8?B?cStPM1hBKzlkTGdQVllWSndWWkREY1RndVV1ZUl0dVozQ1h3RzdYRkttN0hB?=
 =?utf-8?B?dDFmVTlDbEttaUlKejNZSTlXV0pkdDRWQTYvTjRPSWF0SmVRK3dPdGdGZ3Uz?=
 =?utf-8?B?Uy9Pdm82eGRJUjBkY2dMbW1vREdvSzlTVDdaN1hPblB4Z1ZZMUg4T2F4SGhx?=
 =?utf-8?B?NGg2VmhmZnNwRlZ0SHRxNmpFaTBtSlgvT2dTcnZ4UjA0eDB5K0VvOEJOL2s5?=
 =?utf-8?B?emZJK01tUDZrcjIzR1Zqb2JiNSsxbWd3enVRQ3BTbVRTL1N2NzZpV0plZVgw?=
 =?utf-8?B?U3RGWWxiTnBDT0NBMFl4b3czS282NGk1QW5xSDBNOTVtQ0VEUnJxY2JtSitZ?=
 =?utf-8?B?RXVsc2VSbUNpc0NSWkIydWlZcnBPcENodDVMNG1MK0ppSG52NE1kR0txZGtl?=
 =?utf-8?B?bG5RZE50TlZ6UGJqQWI2eVppTFB4Q1d6RXpBaEg5b2FEQm9PQS8zVlN1dEww?=
 =?utf-8?B?RU1ZYnpXTEptb1BnOXVGOTNZTFVuY1dHSS9nNVhCbWJGdFdOUDAxNjRVbmNa?=
 =?utf-8?B?MWJIaEpLSUs1UzFQMUVRMk5ITzFiZW1qZXZTU0tDS0t3RXZTV25GOS9pa0Rr?=
 =?utf-8?B?OUwzVGVBNjNWWlF2LzZtUmQ4TXdkS3c0TUkvbGtxdFlqTk1iQ1d1WE40eTlk?=
 =?utf-8?B?VjhjeTlYRnlwc2NBYkpXbk1Mc05rVVVxbnA5RmxTb2VGMFhIUEMybi9IU2VD?=
 =?utf-8?B?MFQzbGRoUENFbmJFSW5vV1diNTFHSHUvWm12UWJkanpmb29IQlVpRk9rbVU5?=
 =?utf-8?B?SkFHOVNibkdkT1F1TmpYTVkvdmxxQndaVVpOZVVCSXRlUnhsUUR5c2ZXNzA5?=
 =?utf-8?B?Vi81RkVqVUJlcXNpR0xkV3IvTlhjaGhWTmovWkNRTmxpbk41UDJkeStmVVBG?=
 =?utf-8?B?djlYb3pldnpEUHFBV1VESzhOWi9YQndoT3F4TXFjaGoxRXJLM2tXUUJHVXBy?=
 =?utf-8?B?aDA0VWg5QWVMMWViaFNmZ0MrZVl0b2poZDhVeW1qWTdQMmllVWNZdzVqQ0xK?=
 =?utf-8?B?R1JRYTh0N1BocEpGNHJSTmhaMkd0RTViL2NPZlV0MThaUThjMFlpUXlSRjAv?=
 =?utf-8?B?eWF5VE5kMFNSMXUxb2NCVWc0dytXYk1wRFFqaUkwYTVqb0VBUUdtVFNMc2dT?=
 =?utf-8?B?SE5ZaVhNNmFUY2JRbEtEOU0wQ2cxUGhGeEx5cTJ1czh5NllwTnhOb2VidnJO?=
 =?utf-8?B?bTdudDdYWnkxdzV4eFNSOTY5ZHhMMTNsem9ZTElVL3V6U2hSSUpmS2svZHZx?=
 =?utf-8?B?OXdUd1lQZUZ0azhiYnNPUWloU1VieFVreXhOdzBZSkJOaWcvbms0UFFQUXdm?=
 =?utf-8?B?NUFMWXhlbEZMcVlPN2xOcnFzMFpyMW8yTWFrZmRCSEhTNXJrVHRLTjBOWm9T?=
 =?utf-8?B?V3l4YkdPTURyM0h4S1VPelhLSDd1NkxJTjUxclIxNXRZdXFNK1lFZXFuTk9s?=
 =?utf-8?B?U210WFpSblczZXFxWkppYlgrdjc2U1BwaWU2TlBoUVRGSW5yNXZIWmU2ODdE?=
 =?utf-8?B?c09kTTJWY1MzSE9KTkJDN2lNeVJIQmVSaVJ3SGN3eUFKZ2xxTjAwbXFyNnYy?=
 =?utf-8?B?SURNTllBajlaNzg2VXdjUHBPMndPTi9meXY5dnFSYTF6R2EzVmV3Z1dvUDRv?=
 =?utf-8?B?aHpaNkNCcHFNVVBEM1M1NGdZTFd5M0xOM2FrekJ1ZnJ3a2N6WVJ5VVQ1aG9T?=
 =?utf-8?B?WmdRN0dKWmJwT1oyNFZIR1ZFOS8rcUxlNlBueGVrdmd2a1NtYUF5bnhvRHB6?=
 =?utf-8?B?ejdnSHl5djd3ejFiZG5uRXJtRm96RkhYYU1LQkZpbzQxVWs0N0tGMjNQTUhK?=
 =?utf-8?B?aXB5NHFkemU4dXVmQ0lsSDFOODZCNVd1eW1vOEFJNjVvUi95Ym05cGV1eTdB?=
 =?utf-8?B?bVRwbXl0alkrMDFMWk1QNFpyd1g3WExNYzhuUGluR25taFNHY2JUN3FLdENY?=
 =?utf-8?B?bmRjS0N3aEVxYWtremhkUjBnSUdOREVvU2Y2SkgzNTZsNXRvTHYvL3FhRUhQ?=
 =?utf-8?Q?IuDfDIy9iW3rWM1oS484K/+LdhUCCiBtJNpgkUe/q5Z1h?=
X-MS-Exchange-AntiSpam-MessageData-1: jAsAnrZp0C/Srg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46aa4ac1-f41f-4324-a986-08de866e658d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 10:49:44.2175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3tze6whF6cuoquupAvopohOvZCnleWby8GXB1gxwncWr4VTgkVl5YxqmtbdJMQdZcF8TYxHRlvSx05BhnIe1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33896-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid,msgid.link:url]
X-Rspamd-Queue-Id: 181832D906B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 18/03/2026 14:00, Bartosz Golaszewski wrote:
> This fixes two issues with shared GPIO management reported by Jon.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add patch 2/2 fixing an issue with sharing GPIOs by child nodes of
>    devices
> - Collect tags
> - Link to v1: https://patch.msgid.link/20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com
> 
> ---
> Bartosz Golaszewski (2):
>        gpio: shared: call gpio_chip::of_xlate() if set
>        gpio: shared: handle pins shared by child nodes of devices
> 
>   drivers/gpio/gpiolib-shared.c | 33 +++++++++++++++++++++++++++++----
>   drivers/gpio/gpiolib-shared.h | 11 +++++++----
>   drivers/gpio/gpiolib.c        |  6 +++---
>   3 files changed, 39 insertions(+), 11 deletions(-)
> ---
> base-commit: eadf2995ab7c8158bf694304d41e49cada263277
> change-id: 20260316-gpio-shared-xlate-708c651cac5f

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for the rapid fixes!

Jon

-- 
nvpublic



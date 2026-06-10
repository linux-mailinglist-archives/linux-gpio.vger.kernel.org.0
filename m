Return-Path: <linux-gpio+bounces-38287-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S5amHhLIKWrndAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38287-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 22:24:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B066CC33
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 22:24:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=jEVu8CFa;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38287-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38287-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9130331BCCC9
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 20:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F8947A0C7;
	Wed, 10 Jun 2026 20:23:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A27B343D86;
	Wed, 10 Jun 2026 20:23:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122993; cv=fail; b=HkNab5VYZMg5/sl3UrqcrmidoynWFHRQnz3vdIBMY5spRmJf5T5gSXM9Rw8qD6wir8Qb6UeM2KZmvV53rWO1VG41OKW/OiGeKkdUh4uRbyxPVQODyQtH/MwN5kErfC7Jm2+CnP9DlPkmrkzKdqtXVhg451lidjfzpsA5yFT1pIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122993; c=relaxed/simple;
	bh=wK623yRvGIb9MIhfcZdhyoY5q7rcqkvhGlovQHh+klo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MdQzHmrbBUUCYK6jEKyHR0DT/RO12i7ZyH24RPZ2LBpL/Um+QtLuq8fhqP7D7Zb4leJ4LSQDcv42562zneaWfvcm6cNpcFlcq/dUb6mMOhpcz7VKpKMdAJ86RUjsyn5+n+zRgaiSAC1Zty64RjOty5EtxqCfCG+4QkRzfcGO4NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jEVu8CFa; arc=fail smtp.client-ip=52.101.85.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTvcrRP2jY6uqwKLBKtaqiFQcavscu0+IgxgMZu1iz7NY7FuxSzrd5EDDQTeQ5gGP75vjB3uCH8kB590rYMbYB2cPFbZDvyzZIqtFQKFttRMMVnAED5JGYvCDRAopbBZLAfgp6neHsiMAmbqaPfe2oXqL4bpH2dAGLYSeYI5hDmGLjzJH59A3FO25PGvWYARUycb5uPDgeTIlm89/Zq4eH/FfE3P50dlNB4AlhfDFErWKCaUpMFWR4ImfmfyzjeCF2tysJi4YpKcqpvdCBqxgHIYZ5B4XDb44VGrjz7vdZ/iNc+EEhw1TaFUHAzqXtbLF4CsmS+DqMIJsUuLP4HLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Mml4eaqxKJoK480dcR8LzAhdnmkiYgHc8/4mdAtwWU=;
 b=fpwTzN7Y6RbMlg2dDyfKsjFLcGhttJ+oSft2/aqss0f1vSd9uXE+Dfq6EBcIDrvjXzugo31zUOGqaqgrX/X7QJBy/4t7SAa8d6Ge61qMVv7XGasw7BN4C/23uCptBOrSR7adnuBMInolX68bRIHwBJzkR8Ec2H1q7GhsUeAytCYmbJgM6CX+QiV4qGuhgI6ykg1F7UT3yKHuV+KlT+3QnqD4oTu5ItDFfe6yboXeyA+SvI3wzpWxSMiBsMrFrWMJciLen7gVVndhyHnbMN+e5LaJr1fmIar5+TZOyonG2N6jXAbmB1mOvAAuLeWZ0VVo+JQkRFczl2d/PJ7cVW7Itg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Mml4eaqxKJoK480dcR8LzAhdnmkiYgHc8/4mdAtwWU=;
 b=jEVu8CFacnvV7Ay74x7zuLR05DBrJSr1lwKMCV4LChZEQ2cMslnBOf24o40vvvTOr9MhQjIRZEF6Cn26aOOGLEDupVbc+Y9VlHC7Rv2ioVQJoJcxOZv/fHwrQ4Nxg7oYCt7BuGdr+hT5H+WPadKEZnT0X0I2TEYJHwcTlSuorbk=
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS0PR12MB6558.namprd12.prod.outlook.com (2603:10b6:8:d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 20:23:05 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 20:23:05 +0000
Message-ID: <44bd3c12-b8d6-45c8-a7cf-12ea47716461@amd.com>
Date: Wed, 10 Jun 2026 15:23:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: pinctrl: amd: spurious immediate resume from S3/s2idle via
 BIOS-armed wake GPIO with no ACPI owner (Lenovo Legion Pro 5 16ARX8)
Content-Language: en-US
To: Lenart Kos <koslenart@gmail.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
 <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com>
 <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::7) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS0PR12MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: ce26e472-7d88-4c10-3252-08dec72e13c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|6133799003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HJ00bob5LGbPpdeSu9D7/2o9hrm949uXchlZUkIe3CapBorxDD6QfOW6U96s+k5BBbdrbXNr79S0iCHkC7wBrq0vUOsOhVzJeq4O3o2c36IIcY0Dgw3rclrYbyFNpyWwO0ZCx2u1ecIE15PzKA475JrZWYX9Vpdn/aGgye9rpQ26B1BZXY7Q6yWAqLof3ZLZ04g2KwnAxiw2nyqCLu0EPP12JsWfnX/cFihTQdWib+ZzOIkKR/AZGWjJmbvHB6eQiGyngptfeNFqM+aFwhGXrxqihWYz36Q1Xtd1N1TH53sqPwz5MqJyszeDoN/DKFF41FnnEdiV3oE6zjwN6On6Q8iGtnwoMFLWyTvH38Nfo+KhmjmuL6jwMJ+260OtBWdMn4GZF6gh6y61TbCWbCjzjET0w3u/FwBSfYE4UpZ47y6AdygPuu3xiypcVNfLkY+WJAIFw8/sdqpC/tDYNkwZgcZDrNpUm3j+fQKO/P2H8RsyRpFU0WsICVYxZwkhfNPOx2XSHu9BR17LqvBc41CFHic1lgeNaY05+rp1nOaky7xlK3Pn/93KuqTmnpgnHghphfiRpIxx9yN+3Xb1KrKa/ZL+HX43TZ+HoMisKlApGgwMaZk23TUGikLbJSkE/ZxSVOGTnlSGHcbQ7mNigYqigNdVVXMxl2m2/ZRqnaq+Ds8QgaF826bbeCgduxUEXB6U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWNXanJWREpuR0grbTdTOVkyQlFWYVV2YmxpckxkZ1FHS1BxZTdTdGhxN1Nm?=
 =?utf-8?B?ZUlqWStvNjF3bGlHWDVXbEpNbDN3bEFldFBBa0U4NGIxR3BJaG5tN3dMMkJs?=
 =?utf-8?B?SnI2RCtuTkYwUnRxekRnSXNvZktFSUhXVkorWEI5VmpESWpMV1BwS2pUalZy?=
 =?utf-8?B?RE00NHhhbEZPZXZ2QmxLTFpXM2UvNkJObm4wUVRNT0RjK0U1WVlPZ1ZvakVP?=
 =?utf-8?B?OGVyOG9qR1Btc0dsUnNBQzlrUW9JRFV6TmJ1eGFwdUIvbmRFKytzTlJ3M1JT?=
 =?utf-8?B?cWdMS29sNHA2SlhtUDlLT29IRE5wdUllK0lrV01DL0svRC9ub2psQlVaSmh5?=
 =?utf-8?B?QjU5dWt1VVFZNkVyWHk0TkpoNEo0NlJJUk1zaHRnbDVJL20rMVcyNGFXbUU3?=
 =?utf-8?B?ZnB3STNnVW8vOGVEN2QzQTMrazZrbWhCczY5S3VTRUtKOUlQQmxJWTRRRUZR?=
 =?utf-8?B?RmszV0JLMXNlcHZaVVFHZ0J2RmsxODFPVGJKVlEyL0E3SjFaWTI1QnpVQklH?=
 =?utf-8?B?VGtGWVo3WHJtM2QreUpJRUpMZkFrWjYvTkIrOG9SNm92Sk96NUdFRXBNSzU1?=
 =?utf-8?B?ZXVTa21ZU244RHVHMFNrNlJJQVlPVjRVaHJkUnZVd3h5ZXdlU25tZ25UTEVO?=
 =?utf-8?B?RC8wcGM0eWZybXR4MmtTMHhXYjhpRnJtcHNPdEFzOW4vWlhKcUJVYXgvOU5h?=
 =?utf-8?B?a2dxUHB6Z3ZnY0k2ekYvd1pobmh6Mkg5ZCtkN3c2cFluWXVpdnZsZzRPL3p4?=
 =?utf-8?B?YnZkdm5nNk55d3cyL29YTUpCQ3ZwOGdEOEl5UEI2SE9iZzhPa3pVYTM0MjhP?=
 =?utf-8?B?VVhEVGJEOHQwQWxpWW53UUJHbnRncjV5bG8zWjhsOWYrSFltalZHYWdSbjB4?=
 =?utf-8?B?bGNYTVlBTHBCYTh6NXlBeW9GaHlHNWlZSHlrcnhtOVhFQlF1R0ZGOHZGbEJm?=
 =?utf-8?B?dUNmSHJPMlZsNW5lSC9GRU5pYUQ3Y1gvRHJQa0d3aS8yNDI3SmZNSU42OXhy?=
 =?utf-8?B?Rzd0TjRkQUN3cUpBODRhMzFRaStOQkVXaFdkcUxCMFExS1BzbWJYd0dCY1Vk?=
 =?utf-8?B?Qyt5SzdWZThWK3lNQnNpUjNKZG5oREVtSTlrSndBT3FrSFg2a2x0NW52Z3Jw?=
 =?utf-8?B?VmJtM201R0NyWFNvL2h2V2NTTlRPZXBCWXo4OTZIZDR6K1lGdHg2QTFHRyth?=
 =?utf-8?B?bnJmYUFHeVdXc0xqY1dKTVZqT3RHYUVYNDNNRHRabk5WUCtlalY3K1E2aG1o?=
 =?utf-8?B?T0NhdDBvU3BnU3pJeHF1dVhsZG1BblhSYytrRjBkdzhKbXBuS0J5QlJjRXAw?=
 =?utf-8?B?dFhxaytvNjY2RkdySXR2U1hUVTFrLzZVSmwvRnhsS2lVRExpZmxTQWdzRmEz?=
 =?utf-8?B?WGJvd0JiM25LZHpOYkcwdzNHS2hidU5hL0ZKUUIwK1BzR1ZHUXJuQzZvU2tC?=
 =?utf-8?B?WnBGWVFDYlNBUDFablRYOGQzcGZDbjBkbHg0ZklXWXNIMVBpdmpTMHYvY1pk?=
 =?utf-8?B?ZVpFOVZ6QUU0M2xvcVBrNHVzdFZKbHBReU5kNTBRZENOVXdCN20zeWc1aUZC?=
 =?utf-8?B?UEx0WHNUbzgzUWF2NDU4dXErVzhBeWE4ZlM5emdYZE1kbEN4aHBuY2NDVjU4?=
 =?utf-8?B?bkdNZmVwUGNFSlpQUlFnTDNkOGhuSlVBWnliTHB4N29OaW1RN1VOSk1GUjIy?=
 =?utf-8?B?UjREaGtHenA3d1JLK1YyMmpTUCt4THFtMG0vMmtITEtQTFZVUzFaKy84WkJq?=
 =?utf-8?B?RzQ5bDVqVEVtUHNTelNYYURZMXdMWjN6bjNQRDUzNjJpRHdaYjhScXV5cXVG?=
 =?utf-8?B?WnRrRmdsYU80MkJvdm00ckk1YUVzTmwrT3YrSURHeXVjck5HUkE3N0lmU1N0?=
 =?utf-8?B?RGFoT0Q2eGFRRFhMZXVMUUdEanlHYnNQWm9IK3VKTHZUV0hTaGh6ejdTVmxk?=
 =?utf-8?B?M2xhV0NKdVo3dGJxbEFJWW9YeG1UeDJoQ2dDK2czcE53Rm95NUlVc0Rzb3lz?=
 =?utf-8?B?WGRic0c0S1RGdGU4anZhUHlPQlQ0ZS83UjVJZmZSczN2cFhYODFWRmxKazky?=
 =?utf-8?B?SE5BclhuR0FMeHBnTlVxY054NXV6b21GK0xSdjVtaittQTJyUzZjSGYyRXUv?=
 =?utf-8?B?SXd6SVcwcExlNEZ3R1dBbGpkVUR5clR2Q3pqTkduRVJHVWZwaUFGdzFuMEs3?=
 =?utf-8?B?M3ZqMVhTR1MwbGdmUW5tcExaaDc5Rlc5MXdGQVNxY3RiRVhHQUt4T2gxV0sr?=
 =?utf-8?B?Mi81SG9yZkpBTmRKYUkvd2gvR1J0YTNDa3U0R3NndlI3UlV1cFhuaG5EUHRw?=
 =?utf-8?Q?82SCIH9qGvJacJNpp7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce26e472-7d88-4c10-3252-08dec72e13c3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 20:23:05.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K86eoqAS1nis7IKKiznhgG2tOrfGgYNDN7L4EVtvJuxa/nF91K8to1gOKUjyGRKw6SpQM8Q5thwMPUhY+hleAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38287-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:koslenart@gmail.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fedoraproject.org:url,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C21B066CC33



On 6/10/26 15:18, Lenart Kos wrote:
> Thanks for taking your time for this. To answer your questions:
> 
> S3 path:
> AFAIK it was on [deep] since my system was installed and I strongly
> remember being it as so, although it is possible that I misremembered
> since I have been debugging this sleep issue since January. In any
> case I have also tried setting sleep to [s2idle] before and it did not
> fix the waking issue even if set in s2 sleep mode.
> The firmware is not modified, everything is installed from Fedora
> sources without modification.

Can you please check in Lenovo's BIOS setup if there is a sleep mode for 
this platform?  If there isn't that's fine, I want to confirm what 
Lenovo actually presented before making further assumptions.

If there is such a setting, what options does it offer?  If you change 
it does the behavior change?

Furthermore if this issue is only happening when connected to the HDMI 
port, that's the one connected to NVIDIA, right?  Have you started a 
conversation with them?  Assuming the HPD theory that has been presented 
is correct their driver should be in control of HPD behavior.

> 
> Methodology:
> Yes you are correct about LLMs, I have thrown every bit of my
> knowledge and time that I have available for this without success and
> Claude has finally solved this after a few months being irritated by
> this. I had decided to forward most of the information I received from
> LLM in the hopes it was useful to an expert in the area, but in
> hindsight I can see this was a mistake without AI disclosure, I'm
> sorry. So for your other questions regarding why this assumption was
> made or why was something done a certain way - I don't know, but I am
> willing to assist with testing. Apologies for this mess, it's my first
> time filing a bug to the LKML.

No worries; as long as I'm talking to a human about a problem not an 
LLM, I'm fine to work with you to see what we can come up with for a 
solution.

I've got various inline comments/questions below.  Can you please 
address them?

> 
> On Wed, Jun 10, 2026 at 9:59 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> First off -
>>
>> How did you get into an S3 path?  These systems that ship with only
>> Modern Standby / s2idle normally shouldn't be able to get into S3.
>>
>> ╰─❯ cat /sys/power/mem_sleep
>> [s2idle]
>>
>> Have you modified the firmware in some way to try to enable an
>> unvalidated path?
>>
>> I have some more questions about your methodology below because when
>> debugging a kernel issue an LLM can sometimes make WILD assumptions that
>> are totally a house of cards.
>>
>> On 6/10/26 14:32, Lenart Kos wrote:
>>> ## Summary
>>>
>>> On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with an external
>>> display connected resumes the machine after ~1 second. The wake is delivered by
>>> the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
>>> (and pin #2 for
>>> the USB‑C/DP path), which the **BIOS has armed as an S0i3/S3 wake
>>> source directly
>>> in the FCH GPIO register**, with **no ACPI description**
>>> (`_AEI`/`GpioInt`/`_PRW`)
>>> anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owner,
>>> none of the
>>> existing override mechanisms (`gpiolib_acpi.ignore_wake=`, device
>>> `power/wakeup`)
>>> can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
>>> write. The pin
>>> is an external‑display HPD line, so the edge produced while the GPU
>>> powers down on
>>> the way into sleep immediately wakes the system.
>>>
>>> ## Affected system
>>>
>>> ```
>>> DMI sys_vendor LENOVO
>>> DMI product_name 82WM
>>> DMI product_version Legion Pro 5 16ARX8
>>> DMI board_name LNVNB161216
>>> BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
>>> SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
>>> GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
>>> Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
>>> ```
>>>
>>> ## Symptom / evidence
>>>
>>> Failed-suspend kernel log (verbose PM):
>>> ```
>>> PM: suspend entry (deep)
>>> ...
>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during suspend.
>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during suspend.
>>> amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend. #
>>> not a wake src
>>> ACPI: PM: Preparing to enter system sleep state S3
>>> Timekeeping suspended for 1.384 seconds
>>> PM: Triggering wakeup from IRQ 7 # IRQ 7 = pinctrl_amd
>>> ...
>>> GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wake latched)
>>> ```
>>> `/sys/power/pm_wakeup_irq` = `7`.
>>>
>>> `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed for S0i3+S3
>>> wake with their interrupt enabled, while #89 has no wake bits:
>>> ```
>>> #2 😛| ↓ | edge |⏰|⏰| | | ... 0x147ae0
>>> #4 😛| b | edge |⏰|⏰| | | ... 0x57ce0 <- both-edge HPD, S0i3+S3 wake set
>>
>> How did you determine this is an HPD line?  Is that a pure guess?  Or
>> did you look at a schematic/trace etc?
>>
>>> #89 😛| ↓ | level| | | | | ... 0x151b00 <- no wake bits (red herring)
>>> ```
>>>
>>> ## Root cause
>>>
>>> 1. The external‑display HPD lines are routed to SoC GPIO #2 (USB‑C/DP) and #4
>>> (HDMI/dGPU).
>>
>> How do you know?
>>
>>> 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
>>> those pins in the
>>> FCH GPIO register block and **never describes them in ACPI** — decompiling the
>>> DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` resources.
>>> 3. `pinctrl_amd` correctly preserves hardware-armed wake pins across
>>> suspend, so the
>>> HPD edge generated during the suspend transition wakes the system immediately.
>>>
>>> This is effectively an unvalidated firmware S3 path (the platform ships as
>>> Modern-Standby-only); but note **both** the S0i3 and S3 wake bits are set, so
>>> s2idle is affected too.
>>
>> So how did you get into S3?
>>
>>>
>>> ## Why existing mechanisms don't help
>>>
>>> - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` — wrong layer; this is
>>> not a PCIe PME.
>>> Disabling wakeup on the GPP bridges / GPU has no effect (verified).
>>> - `gpiolib_acpi.ignore_wake=` / `ignore_interrupt=` — only match
>>> **ACPI-declared**
>>> GPIO events; this pin has no ACPI declaration, so they cannot target it.
>>> - `/dev/mem` register write — blocked by `CONFIG_IO_STRICT_DEVMEM=y`
>>> (the region is
>>> claimed by pinctrl_amd).
>>>
>>> There is currently **no way, in-tree, to disarm a bare (non-ACPI) firmware-armed
>>> pinctrl-amd wake pin.** That is the gap.
>>>
>>> ## Suggested fix (maintainers' choice)
>>>
>>> A working out-of-tree reference implementation (clears bits 13/14/15
>>> on pins #2/#4
>>> at probe and on `PM_SUSPEND_PREPARE`) is here:
>>> **https://github.com/Lenart12/legion-nowake** — please feel free to reuse.
>>
>> Why not use /dev/gpiochipX devices to change GPIOs?
>>
>>>
>>> Possible in-tree directions:
>>> 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
>>> wake-enable bits
>>> for the affected pins at probe (smallest change; precedent exists for AMD GPIO
>>> wake quirks).
>>> 2. **A generic override** for bare pins, e.g. a
>>> `pinctrl_amd.ignore_wake=<pin,...>`
>>> module parameter, analogous to `gpiolib_acpi.ignore_wake=` but for
>>> hardware-armed
>>> pins without ACPI events. This would help the broader class of AMD laptops that
>>> hit firmware-armed spurious wakes.
>>>
>>> ## Reproduction
>>>
>>> 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms for wake.
>>> 2. Connect an external monitor, `systemctl suspend`.
>>> 3. Observe resume after ~1s; `pm_wakeup_irq` = the `pinctrl_amd` IRQ;
>>> the offending
>>> pin shows `wake latched` in the post-resume `GPIO N is active` log.
>>
>> On the presumption that this is correct about being an HPD pin doesn't
>> this actually point at a GPU driver bug?
>>
>>>
>>> ## Public discussion / full diagnostics
>>>
>>> Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpio table):
>>> https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep-when-hdmi-is-connected-irq-7-pinctrl-amd
>>>
>>> ## Attachments to include when filing
>>>
>>> - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_AEI).
>>> - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=1`).
>>> - `sudo cat /sys/kernel/debug/gpio`.
>>> - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,board_name,bios_version}`.
>>
>> Where is the kernel bugzilla that you attached all these artifacts?
>>
> 
> 



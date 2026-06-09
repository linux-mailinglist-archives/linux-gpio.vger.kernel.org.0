Return-Path: <linux-gpio+bounces-38178-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 87r/LT4QKGpk9QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38178-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:08:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D5660660
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:08:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=OBX+EyY0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38178-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38178-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DC7B303F9BF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 13:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7459741B356;
	Tue,  9 Jun 2026 13:00:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AFD41B361;
	Tue,  9 Jun 2026 13:00:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010024; cv=fail; b=JsbJ/B/LM1Veo6WJHWHrZsf3tW79QnH7XHL2FzSlc8Z/2DpED9uIIeBnGBVkfIsJQc3BApug7+7GKtbLZtnWdy0g2S7Ww6oH0vMsL44bgt2/giAAhXTgeZtTJr2jBF8exUnbVPKvdYdkNQz2j/QXl1AmfBjqOiPYHyCAZAyt8bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010024; c=relaxed/simple;
	bh=ONrfezx+uGn+lhL6x8GXTvTPgQLKaaHNfQ1SxLdx+Po=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G930L8y+FyfYsA/Kkbpr0uIrTtISx2JFJvmIATXxu2KNnZp5OVlKRDmx70jC7BSqfWIHs+cXXFKYyeD2U72JvGonoTf2nQmtjkq31/LZU5CWIqIuydZYO2bZ5hvgtaZghPvN9fhisSAE54V0zm3zMzVKVyzpSfKLB5DuyUoSF6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OBX+EyY0; arc=fail smtp.client-ip=40.107.201.2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDeRfrNcLP3fAeV5dlTGw094h0uzu44pPELXu1nPq0wwf+7wtXBE0c8pfftkSSOlD/9RCZ+qhRtVzkgRDpg1gAkSNKnthiImrOjKM4GSo44BSYzTMKbos85z390IRz57AIUdWi5MtLKTLs5pMJWty+hdJ1uQU7aK/83vrjY+QEAtKtXUN4NdDv0fLApvIAU9mEsLQRmN1ke5vchYLLosimNEf6YrxjPvCggoICTK9MyfMz2JDcVuGbBbdipKyqv4dQtOV+i2QQswwLc0E+tyNfFzsc5FLoHh13wNIlhK+vU0eLgv1Y0XuZVP8uNRUbkXmQ59hpeAkd+Po7RQwSvtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNGdRgjJ3dYQ6IVUUNYcG7Gs7/gB2vZtCg5KSgYH1fg=;
 b=V0KtWDU0DQ790OQXkAjAewl1gJ8rTipB7iIgdX2uqbFzSe0RJpQRGafBZUnHyREYitx5VAaExtfZ8tcl+CodQ8VbXmqlsTLVKkI6jOzT56FPbOLM428eD376P4w+eCgWewavisZC6jzmWAbIzF/nhYy54m0IV32aOyvfIjVXa6H8vBYWyGGE45fgUTxvTgi2KoV3UboJfl+Cjlp6OyFcB4jN41AdHnZ8C+q1n9HSpewapnX6S476w+00ji7MAVKThegLCcsPwmFUTof5A761fh1E0AtdY9nKR1o9pEPWssdlwSbVDuuLY5Zq7pC3bQ+eazC2jhk6uP+kaX4GQktfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNGdRgjJ3dYQ6IVUUNYcG7Gs7/gB2vZtCg5KSgYH1fg=;
 b=OBX+EyY0tPb9K2e0G7TA1FrhoWlayI+jJr3VuzBPoX5mGn4iQLougAh0Im4rAWbZpV2R3bK9schr/WwbV0FYPx3eDlMFhvdFi0JPHYEurW6yX3OtbR9fgJk1qg5HoIPnz1Vgp0JLpEYzxhVIEWEB8aZSh3wjLznljrWK136bzYI=
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 13:00:19 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 13:00:19 +0000
Message-ID: <ff4746f5-d48f-4959-93bb-d88705f10d0a@amd.com>
Date: Tue, 9 Jun 2026 18:30:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: zynq: fix runtime PM leak on remove
To: Ruoyu Wang <ruoyuw560@gmail.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Harini Katakam <harini.katakam@xilinx.com>,
 Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260609073313.5-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260609073313.5-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0126.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::9) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS0PR12MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 571c6904-2561-4c2c-e6aa-08dec6270f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	yQVHWkbM8nx8sJZgf04EKlZ6f0czFWrTsyHQ+zHfP7/XaKISvdbGc/3u7PUH5ERfqJwc+o7vETM6aXTdzH6vtBS37ddFqp9nSBqaeKWMK2nZ1wMC6yHJDkD/PBdbZ4P5N/5hg1EsJtVA+ytxsqZ/67cLzYWpQTfai9YW3cEMfIaLIeA4l4EaYxgYY8nqsHzkmGh5bDoaFR3cMV79RmCrmGA7hBJrwnQz3I+bVwAKq69NFa6wVH2LrKZ+96nab16P8ihshKj6rVKMd9Os4QcFUTTeczJCdVKBMjoFEBEkxEnQwjP43aS5FsuNoE2yHO0TFJ/EnJflhTklkMg+gNzarYDUB0sXxWJjQ/QwabcrJYN5qJORYkUYMT3bXv3TEY/EDFbIda7uqGF35KirqKenjatF3xmGtHY+KdNKxBaeSP/D/lD6XnhYPz4t8T26Mea77rStYn52oI7FikZfElMZ5YMOkZHedfOfHgEewdXb9WcFMpKP8xA/KSk67bqbZHu39G4P3t42x7PxJo/LB4yL0R0RIHBSEIBkBqNen26jFQsWZrrW/vNgoFd9QtRK+K5FhTPJ7QeyYuMHw4+9svPEcu7WF76py7TM8bMTBWSsLjWlsOLVKE6PvtjiBtkAx7+Nt3/HT2+ZvdnFw96dZ8z5HIDnWyLR7ujYT2M0937jwVpetHK4kSjz/a/Me1hOVvIq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnlWY2kvcEhEOWR0VlJma2M1Z0hHUEhNN1VOcGdSSjNaUDhRY0VVaGZSSHlI?=
 =?utf-8?B?TW1oOFF4TE81dXdDUXJGVkJyd0dUOVIrWWZPTG5uZ3dKTUQ4ajZIY1ZaNW0r?=
 =?utf-8?B?MUxuRkVEc3l0NUVDbWh5Y0h4NHFxVWhSWFJkSGdNeWc2aWFzSnQ4UVpEb3Zv?=
 =?utf-8?B?NDZMWmszRmx4WmcveEthY0UyTzFtUmJlVU9nS2hBQW1kREl6VTN2NmdheFhv?=
 =?utf-8?B?V2VuQnhDbHFhY3ZFaDZYbENoNmwyS2RBc0Y1Z2MrTzNuWDI0NXdJVU9jUUk4?=
 =?utf-8?B?YUZteG5Ielc1U0ROczgwQzRBZ1lDMzR5Sk1YbVZobDV6NzRxZmZ4Rk9RdThS?=
 =?utf-8?B?d1pVZE4yRWYwbGRaWkVESEtmZjBJVHp6cEJzbkdJaGNudmFkSjBDWk9GaHA0?=
 =?utf-8?B?SDlBUzlETEhNMVhqaVUrenhFc2t3SWVkOTZkZFJnL2wwSDlLM1JiRUJUdEVs?=
 =?utf-8?B?dmRwWkV0U0t3OEpVYjBVdW1majhicmxiSlFDTlhRclkrbUw4aTlkblNuUG9p?=
 =?utf-8?B?OThGbk80SDIwSG04My9vcVQycm9nTThST3VvRi9SVU9SdVg5SGJTemdnTnJt?=
 =?utf-8?B?L1hNNDdmZ3FhV210WitLSzZqRHIxUHc0SUVmVG5LOTgybnRWNWppNTlGTWx0?=
 =?utf-8?B?NWdDQy9nT2Npb0hweURIMFdhOGh0eFEwcXpnRkovZ3NiZW5pM28weGsxOVlX?=
 =?utf-8?B?TlA2ZGxRaHh1b3VmNWMrUUNSR3FlYU90SDVvVUVyRnNnc3lSVmFIRHpHcC9H?=
 =?utf-8?B?MWFRdFRuaDF2QVRwRnZsdEptRElHYkFXWGs1VlFTMHhtWmJ3YTVEaUd2NGp0?=
 =?utf-8?B?THVlY05mSjZRcnhYclpIcnlhb21tRy9DdjNFemlOZ0wyd0xkVkpSNW1xTFFm?=
 =?utf-8?B?Q1VNYlV2YUJZT3JhWmV6ZFl6NFRzaWdKMVlQbXhzOVlFYTEwdzJMSFJ0OS90?=
 =?utf-8?B?RU5WR0FTOWxBSTMyeGN4R3R5ckwzMVMyaHJyaFQzRlp1MDhhd1E5OU10eFBY?=
 =?utf-8?B?QUxXcDNuVUN5S1QwWXo2ZWFPMFlhSFdmMEsrclYzS290S0xFOENEbVhYRUNj?=
 =?utf-8?B?R0hEaHIzK3g3NmZkcjA2dkI2SERTWThvMzFEUzFYdzdYWmpjaUJmOC9zT2VF?=
 =?utf-8?B?YlVQKzBnMmk1SUFBVTk2V3RROFVxVHpQc0V4dDJvSUpYYlo0am5weXlkUy9j?=
 =?utf-8?B?MTFmcnZqd2RwRkhFOWdSSWF4RHFUdzNubFIvT3U3VXZpYk1PMXdzeUVOZ1Y3?=
 =?utf-8?B?WFJnclhOUldaNWJBUjJmbWlUdzkzclM5U1VIM2J4bVdKUU9qRFdaM25RdWww?=
 =?utf-8?B?Y3BhbTNYRkh5Mlc0cGViMmtJWmxMVDVzNTNyVURPL2ExV0l4Qm5vNHA5S1Js?=
 =?utf-8?B?aHdLdi9EUUFzbzhQYW9BUUMzdEwxTUtMZW1sd3pDa1BuOVJKcWg1SlRuSGo2?=
 =?utf-8?B?QU9ZTWt5Wm1vZERBM3psSUYyNFl2UlNNMW5vSHBXU0Zwb0dyYjVUaW1zd1gw?=
 =?utf-8?B?bnBZbnozb3ZvTmFIYkdKbkVPMUtTMXlQY3g5WThwUGhFN0FLcHpRUVFzQzNH?=
 =?utf-8?B?Y1hPR0lBWUljb0Y4SDJiTnYxRXZVTGk2VWFnK3J4RDhoT0lZTjZnQlZScDF6?=
 =?utf-8?B?ejhJOEtYS1FoMmxwcVVJL0VqMlcvYWRTaW4yaUs5VHBEMGlZV0kyY0wyMG1z?=
 =?utf-8?B?UXVOTHJtVmhvbksydDc4cWlxQVpsa2MvWWk0aXF1WWs0SE1BUXdoRFdPa3hS?=
 =?utf-8?B?Z2ExcHB0KzdKaXQ3cURwOFMxaDdFYzlsQXVLSm9yRmZvOVpqYjRHbVVHNzZD?=
 =?utf-8?B?UTVLeUcvWHJ5dXYzM2p2U0RCbXNJbmZlNmlrelpKa0hIK3QxWEVxYmpCUkFn?=
 =?utf-8?B?OXFJaS9GTjdFOXI3Sm5hMEhNTGM5aGU4RTc0enRsNDEwL0JmcDBYa0I2VXdV?=
 =?utf-8?B?dXUrNFdRRDllc0hjcUVMejJhUzYzeDVrdW16OXVVem8vR3pSL3I5cm5CQ2M5?=
 =?utf-8?B?Z3RMWWt6d3pNSUxDNGVvY2lrZlhaZHFCcGNtdFFKUlZuNjRta3IzekFDdWpB?=
 =?utf-8?B?aWpuQjc2b1FhV0gwSnpqMm9hWkgvUlp2Wk00UUhBWU5MQWErZUI5ZWROUmZp?=
 =?utf-8?B?YlFON2lodjZ2aTNYOGxlSHYwbFlLbzJRcEN3U0xhUm5DRGxiRStQbVpWayta?=
 =?utf-8?B?V2Q2NTZydlFXRG55dlhydnBBbmFYZENrSHhCSWJiSkdJWDRTRmhFY1dacjY0?=
 =?utf-8?B?YnZkZFNTemdPWlJkVGRoSUxXbzlpbTluQTFjWHFaNlZyaW9NTk1UVy9QUnp5?=
 =?utf-8?B?UW1XOEY4WHE2Tm85dkFMb215SXY1bjVOUldyRzg1NHVCWDE4MWVrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571c6904-2561-4c2c-e6aa-08dec6270f07
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:00:19.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOeV9z5wWJfPmkR7/CpUJiJ0i1zvPExQvqnbm8mJxYb1iGdhG0JhxO7q/tjF2kIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7948
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38178-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:shubhrajyoti.datta@amd.com,m:srinivas.neeli@amd.com,m:michal.simek@amd.com,m:linusw@kernel.org,m:brgl@kernel.org,m:harini.katakam@xilinx.com,m:soren.brinkmann@xilinx.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[radheys@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 130D5660660

> pm_runtime_get_sync() increments the runtime PM usage counter even when it
> returns an error. zynq_gpio_remove() uses it to keep the controller active
> while removing the GPIO chip, but never drops the usage counter again.
> 
> Balance the get with pm_runtime_put_noidle() after disabling runtime PM.
> 
> Fixes: 3242ba117e9b ("gpio: Add driver for Zynq GPIO controller")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/gpio/gpio-zynq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 571e366624d2a..fafca91128b2e 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -1014,6 +1014,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
>   	gpiochip_remove(&gpio->chip);
>   	device_set_wakeup_capable(&pdev->dev, 0);
>   	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>   }
>   
>   static struct platform_driver zynq_gpio_driver = {



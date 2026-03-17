Return-Path: <linux-gpio+bounces-33634-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLzUNPBOuWnj/wEAu9opvQ
	(envelope-from <linux-gpio+bounces-33634-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:54:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7714E2AA2FA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCDF73023148
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58E23C660D;
	Tue, 17 Mar 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W5INQ5/h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013053.outbound.protection.outlook.com [40.93.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EDB3AC0EF;
	Tue, 17 Mar 2026 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752046; cv=fail; b=hO7dH5nRNU0AP0EPPAk5tnuvHI1CY+KmSb7a/4QCdmfx1FnQwR9gRBwOcXSKgIQb+tbWAxxseg2FZreHI9VvrVjZBHhCnMpMYGDROAZ2x5rxQ+jnl/Kud9Ve8gUODE7z6ZxUvO8O9I2TuHAKhwU/+4vd+KelwbqnezJFr8NugpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752046; c=relaxed/simple;
	bh=A8M8t9RZ0QesLAqK7hm0rEmLk+3ztlsm3rc21eJ+8g0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=saMTzXXKodBnuMIF8PrgemQL7IBPv+ojAM6s5wN+T7pZZrAzHWjsE4JdCmz0H2TPuXsiUYaI6wtnLzRwMwCc4FQR/WVxrL40PVweG7cSKWjnWjNiKEINmQB7idtIFew1ReyNg0MtBABkFQUHdcNS3KVe6Nwq+EJ+qviYmYi+hjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W5INQ5/h; arc=fail smtp.client-ip=40.93.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seW6G4r4F+kNQXypUD08rIkUXJfOb5BhKR1NbcT7QQoLAWZIsv8ft+Z8WLsETlMGCbNG/oYllThGYPsRJm9a6ZYLlm/AX56bzTqbAKodum7iQs37WxeAS5Rhuhxr8PFpqMZiEQEr1bUeHVFHdfNDWpNN74kMuxgqbEDgi553tTk6w1r2XPtIlgswEmQ1Z93TuYWGhinWEittHKyfI5PEXYNreT09dNlFpl56G0MO9O18NXACfCf5kgEt358TjYHox2DRn0lGyp/yhpvYsX9z1IJK2aWrfDWo9ZxPMlHLjQCfQ+Fzuq9lvR5T38h3FMfIlEeQjjVtksIVAflXb39V3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnljBDtWMfhoRHaiAQpGjzl6VLTOYRQuEN45rYyXr6U=;
 b=yVozpJFnyWEEtyzBCLN/NlVNgNRzfA6pyIIZrOmIvVHrXBbniegQuwM0qKHCPB63Sy19JJOzBL1E8a9qJM9wjMPOiwIMsWiE+hWbDwWfai7Lg7Ub6ZYUTYqtmqfpgNIqT1Fwfe0pQtMlFVRhWXiqWpanhztp2MjtP+Ems2XngjM9W3U2EsVNBVPCVTon841TH8qb9PsqxQSprpM0iMWvuC1UpZvPE1F+1zrLWVQsjoGdWIDZxAd2rE6ESmzahkJjBN7Ph7/m5mk6Hbu7I+FaD5cx36zDQB01wdDJQOaZC0bHzduRmNiQqTavXnik9SyycbDFoAF6CYMYVWxe80BF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnljBDtWMfhoRHaiAQpGjzl6VLTOYRQuEN45rYyXr6U=;
 b=W5INQ5/hQ8u7O57INYuOUk97Bs+Lm8w7aZX9uAxnHOyOaGY+tzFig1f2sciHC4VIbnmFotB8WjosNDkWVROG+hkW8g0pfYNi+oBH8FnSeqt5aAICCsueOZBThMi1xFF/2Qmtewfx3ZpQKGtBpUTixNxrcggmnAY86si9Jyguh2UXC8cDMnaOMWc7L0aal4RgrObP5RohrB9bvOOWhzrH9J+/YsmsG5JD32oqyVPr4tl1B99Hgb4hqmcy7GID/2WtJ2LsvT7kGXAOfl++TyKcEpov9wehxaILYkBro2ql67wTSt/LWFRsfCKLl6WRR1POhBVSHocVjagvqfLTp10CaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH7PR12MB6417.namprd12.prod.outlook.com (2603:10b6:510:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 12:53:59 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 12:53:59 +0000
Message-ID: <7b7198ac-e649-4e4f-a925-f8875c05da42@nvidia.com>
Date: Tue, 17 Mar 2026 12:53:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0124.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36e::9) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH7PR12MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 430fc172-79b7-4ef3-1b08-08de84244224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KliftKwvInFq8Rv1mhFnJ5DLn81Sw6s9ELMl8zjhMIwnEASGzQTWAU58vSZbg0/ieIHVMT1gCMA5mObdRIsfd2eRB3Pm/KtPKeo0VZWQqTWq03l1e6onUnbZtRgzh+V2y+LzKrk+znwbwTe1KP4JYsPd6IKq63tDXwsG98bP3u/BSN77MpUO95oArIMbnev0aBUdxdtzG9sLEpJeKUWrC7JyG0+lLPSyf5EbmtLK+Vm/bYKwza5iNoUCGB7x1VowiEueztJwAF404/oSDEKjeK/AQB6nixCMj8p1IHBqfdoEikV5PSo7WUgjbxT+a91PIA7C0J7Q2oQnt0ZnduXKE1Qs77MZiRHHLMl5FzKJ6V4gGZTEcWNM7eOuHYZ8KWzt6CUckelgyUMmvEmm95TkgiP+o0Dv2i/Gv+q5x271oXJEVzhseVWfJJO7h8DEVITU56q0FfAi3Ue+zXg2PrT0qI8lM4iidr0Agza/n+6ayyTzxZIoqaTHXIAq0aeuJc9rQiuDrJ38nsUuFA+fqZ2La7ToQ7DsB77wq/gS2vJuPrh7SE+z/VLuTVgC9F+BbseRv+npjkKfSAP+C/t/2Z7o6X+/F0XS/X5xPKDJFrgQc8g5/fpqIss7HyrwQoKXNyRG6gdQKRaER6HwhKjISFYgxvFlXrwE+dikqD5F4OXVpVWkhzaqCkY7HMEWbwnaGk49++OODqWxH3FmaoPJz96rzKazd2PxJSabVF/0ny8F/pU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VldrQ3J1K2tqajJGRnUvbml4RTNsR0JrVnc2VnlJZWdzekJ6d0hSd1ZFOTFO?=
 =?utf-8?B?SC9PVU10czR2N2JCWnZKQ3NpeVZTY3ArRkZwczRnTkZmWEdDcUpXOFA0YnRp?=
 =?utf-8?B?eFp1WWtPSk5kS1NWbTlnL3QrbFpqY2hlRldQTTJEM3ZkTys3eHJlNG9pczNq?=
 =?utf-8?B?dFVHRC9MZmJ4VzNYQ0RKSU56TnJ0MlZRd2pDcHFRYzBZTXBvQkd1RitibjFp?=
 =?utf-8?B?QjZkdE9rdkF3VTBzWUVNTTJ1M0ZwczB2KytycnNqU0dMYmJqL1NLeUtnbm9O?=
 =?utf-8?B?alhKWG4rNDZZb05sbXN4aGo0Um9kR3V5WkFzL2tJOWRBb1BLVWd1L1c4QzZR?=
 =?utf-8?B?OWxIMHpTeXRFaUhhc1lFTFhKZ255NzNLZ1pWMWEwVHhIdTRJb0pVOGQxWU10?=
 =?utf-8?B?QU5NSFdMcTErYWNvMnozWFF5VWtUNlZyYUxrSkxLRDJjTkk5RmVrOXY5eEZN?=
 =?utf-8?B?czdDTGR3V3orcXJSeVhlWHVDRFpnTnRuTVgyYzA0Mno0eC9mUFZhZ1NxU1Nn?=
 =?utf-8?B?SUZuaStZT0hud1BYOG5nNTdybjBTR0tnVzFzS1RVTVJzY2VMTzVYQnMwTitt?=
 =?utf-8?B?YmRiK1JoNzdveS9tL2RNRGVxdEFLVkJYN0xYV2p5WSsvQXlnTDczWWRmbWRi?=
 =?utf-8?B?cGxlS3hEaWxBRVZpQTNSN3VacnlNcGh0S0RMVU5aMEQvY2NjNCsyWTRUdEFX?=
 =?utf-8?B?cTJuaVVGUVNMbDQ0dGtoL0NTbW5tUnZQWWxOeEpKaitYajBHTWlYSzNkbTVN?=
 =?utf-8?B?SXZZczQ0NzdUNnZKZmFveG5HS2ZzeUlERHQ0ZXZxS3VrZ2Y5cHlMdVZUSGJl?=
 =?utf-8?B?ekRQQ2NrSThaYzdwbFVHd3JKa0NnM1N2YVNsU00yWnpXWWtMRHZuUXVJZ1lw?=
 =?utf-8?B?UFhic2tnWEdFVzlPR05xQXpweEVXU2NFNGRITG9qT0oxV3p3ckpEM2dOcTIr?=
 =?utf-8?B?ZVBKTzRjaVlXL3B4NlRmckFMZStQUmhrZ1NSUjNuZDNOOFo1aituREpYN2pV?=
 =?utf-8?B?blRyY20rOVBoWWJXVlFZYWhkMExQSHNWdVUrUUI0OWZBaDNGMWlBTVN3QWlD?=
 =?utf-8?B?ckVoY1Z4T2RxQTA4ZWl1emlGNTUyYkhMcittNnRSOTdpc3gvOWdwNnh2VDlU?=
 =?utf-8?B?YlprbVpHSW81ZEpNMTlIaEdPZlFYakVkOFdmQk1Tb21DQkFhVTlQaDU0VWJW?=
 =?utf-8?B?MnZZb0hhNCtoeWVlNWwzT3djSHBwdHlvWk1Vd0dOWjcvaDBuUk0wRkJlYkh5?=
 =?utf-8?B?dFo0OUpqOWNGUTZEUlRjcFlFWFZYcDB5YVhZUEtQR281QkpVRTR5WU12cUxt?=
 =?utf-8?B?T3hPVFJaRzRRbmd4T25UU2ozci9UeDJjZmk2WlZoMzdienN6dWdLZHdlODBw?=
 =?utf-8?B?cW1XTS9QZFhCV2hGNFoxUitKZUhpV04wSVArdEUxbnJOaHhSUDkzanVFM3ow?=
 =?utf-8?B?NlFMRkVEL1hoaVo1VWo0aVowbXFMTWNmcWlzQTBuRzl1c1JqT0k1dEZnaWt6?=
 =?utf-8?B?TzBKN25idzQrNzZHVWx0SGZ1d1dDd3dRU3lidHhyZU9HUUZiMEdnRGZKTEph?=
 =?utf-8?B?U0NXdTR1Q2w1VGtjbDhZSGZlaTU1dFpaaHFBTk52SXdDMHQ2ci9mYjRuYTBs?=
 =?utf-8?B?MXpxcmhhMEo5UjdqN2tPZERqaVpnWDkwbmIvYnM1V1dnT0M5Unp4d3A1a2M1?=
 =?utf-8?B?aFkwRjAyWVRjVWdHVHB2SWh0eG1jai9MdUQ4R2UvR1M4TVBtR1hVSE1nSjE3?=
 =?utf-8?B?ZWtEWHVFK1NRRzAvMitOeGJ0S3A4ODRIbDlXOENXWlBVVkVqVXdPVUpHcjl5?=
 =?utf-8?B?QmViR2hjWW1OdFlZNGNJckZvY3RtWFVyTldtb0c4Zis2LzE3KzBBOG9oUHBD?=
 =?utf-8?B?dEVPdTUxV2p5K0V3SFcrdlk2TUppMmorQ2Nlc1hlakV2LzlDc21SOGVianI0?=
 =?utf-8?B?Mmt0TFk4Vyt4SGR2d09rdnR2aWZQMnBtQ3VqZm1WWjd5dTBDWWhJdU1YQkZ4?=
 =?utf-8?B?U2gxOU44bDJBN21PSStGSC8xVmYxaVB1aGhiRkY4alhCTDdzTXI1ZG5mM2dS?=
 =?utf-8?B?eTBZQkVFL2RMZXlseUNySGN1OG9OSlhNbGxrV2RBR210bFRVVjlwYmNGZW1H?=
 =?utf-8?B?S3UvK1RHZUNrV2hBQWxBL05vaEVnZmN1cFU2NFVYVDJ4Sm5OcnFCdVl6bXFl?=
 =?utf-8?B?MU5xS05VbXZjZEs5UWhkTGMySjR3eDlaZktpdHlHY21zZXFCVVdoMDlCa3Vr?=
 =?utf-8?B?N2xWMHY3eWdPVkNrMlJPZCtUczdpNDRhd21QR3VWNEo2ZUNScUxVUUpMKzZN?=
 =?utf-8?B?UXUxRFZyUjRZSlQ0RWF3S2U2cnlEZW1nenlzUTZGZm5RZkdYdW1uK1ZUYzlK?=
 =?utf-8?Q?385WFJLICQY7wB02eX77Zg7IK3W4PWFRTmIhN1kjqCazh?=
X-MS-Exchange-AntiSpam-MessageData-1: SNnnF3GdlziLbg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430fc172-79b7-4ef3-1b08-08de84244224
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 12:53:59.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i9ZoPxVeNCISVXlncNxMpRsb2vtd90SLN6PdQ7PETSiDhWx9GTyQ69MQpVXq1h9uV0MKJlrj2P5FQ35WjkakQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6417
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33634-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,nvidia.com:email,nvidia.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 7714E2AA2FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


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

Do we need something similar to this in the gpio_device_teardown_shared 
function?

Jon

-- 
nvpublic



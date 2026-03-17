Return-Path: <linux-gpio+bounces-33633-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IjhC79OuWnj/wEAu9opvQ
	(envelope-from <linux-gpio+bounces-33633-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:53:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B62AA2CD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E3F5302BF5A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBE53C65E0;
	Tue, 17 Mar 2026 12:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JQPBqmtm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D2B3C5528;
	Tue, 17 Mar 2026 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751996; cv=fail; b=nzZVO9bSeMgxJX8Ht4OOf+/EtMn+RoEoKVLe1xV1dBjSpFDTQ8sdD7yadilofy6MhJZsNHCYxFclaAtP6J9MZS6/LOUTnN7Q9yuB1qeF2L5jQKrkYchuhULf2H/1OMh+R61SWQjPx36REE1VTmut07Wo/qo/fcd+GzFkUczbob0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751996; c=relaxed/simple;
	bh=foXO5iQJUOmI4YQFY4NjZa+G9O5q3hQJ/1yaREZsvlU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IqGxAFVCwNS6s8ZtKOlGHCKcklCNefABdeVfJq2PND3L5MiMkKSu92DvbdIEXMGZOHi7QHydzHznWnHYApz76/59lDhsvUuMLFPQCgiaKxWikXz7uZ8LGgVeCj6gY6EK9TCwW4sJczmmkeBUIGdhes58YyA6jTVdjDOFuB/07xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JQPBqmtm; arc=fail smtp.client-ip=40.107.208.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2xE89+qLZC2UoDXUsH0Fl7dogkl6uZ9lQNEd30RKrFuIw+6ISdlJCNuGUM8qbUScmwvHzgyZidkoO8SmhZqInB0UIQ999YqXsVQDkh4q1lX1JWaj52huemomzhFoHxCQwGVtJ6bJUVGAsNITbNP43tfL1o3mH9KYprQlL4F+8xKnn56iwZnmKmJeWvXoIif3GLIMT2bNxVuME957MEb3JbYH4dfQgZ+vwwVkCSfV4lLVbDEziWQ6qJ0ul3IdhjJFI0oCBgEbxqKDf99OAafzuLtkvz/WAlOhipEpbL8wTFSu8fYrIV1FesXSioUc2sP17y2mVNeZQXd04ofFu+/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSthkYjEhZs6nca/QcC2A/x8l1hLZ5SEW+NdX4GzXBY=;
 b=k4Kv3Z42RTEWP1wCejxGlJSaqbeCNJZ785xS+tzPlwKpuqO71tLspP2i17BQSBipBN0HCS2IwL2gBwPh+3796vmG+OSAniypKU7yLCycnTf3T4Se+H4mCBL7Yaa8pLOE/qpcNgpGgaDgE09A6w/ZzjkD2krD7ew+FbLbvHlj+179oRS04ryjIbPNc3PMCls1XM0UKr8UJftbwTI0LiemKD0r5X+dUn7NVzXJt0OX/MIg6O01okwqcKTP5v3mv0PtLf0TFDwW1Jex78ztb5ufSCflQ8nt4wtFg07JYnOWWIrWZ/yYTH5igp78WYwBYK6unnHP1mmbpIXYeCTYKan23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSthkYjEhZs6nca/QcC2A/x8l1hLZ5SEW+NdX4GzXBY=;
 b=JQPBqmtmwozYKwICOfRq0OSXO1pTPIwFrHnP34TUYZegglM3Z5QDbdcqnwjIS8rZQxGDfu4UiQFu0/1vUqdAwjQB4S06kRh1MyCkwtueQVWK0EByKYLi0pbgiC5MNZf6Kdri5Us4OXrnkUirY8d9duHu06+BWG+Gz2Paj+/c2XJZV394eJYcD84PV9FCIVB5lz9pOXAofUKjF6PciSofrsK5ju0oLlvFaIQauVoySO95XP1cKV2X7qfk2siJEJFXoIQJAASFnj6Tk1t/krbPwCeE9EtE80ijT+Nv3jcltvJGDS5FWxXNwVN/gtvm21ek5cdpRuENoK0U9H7Maj6gRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH7PR12MB6417.namprd12.prod.outlook.com (2603:10b6:510:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 12:53:10 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 12:53:10 +0000
Message-ID: <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com>
Date: Tue, 17 Mar 2026 12:53:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
 <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0126.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36e::12) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH7PR12MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c06478-4d62-4f64-2c49-08de842424b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PQjwSxn3PO+hv+Iz+RXNthTg6vkIdrN6zrCBPobUZSBkVttJB33Fvv3Gf/41uglFkLrLHedYlqMSSit+6QlvGFnu3Fw4bvlRCSdLL1aDLN1f0RJGK7ghNQWpO2RkcSw98niKRuo5MSjKZQ/r4NbxGMyTVEGWK/A4CKDkoRFfzf18w7dQYo4W8r82rcTdnB9TvUSBrpFZagxRoRhswtOpiw6fkx7CFcojsyMnBaoIxrJXSbg+uuu5vS4ObcPxOr2N/IYkiy8k8wp5ooDdcNbhjv9QiboeWdV37sKp5bMPeExrczTsm1OZ68H0klYoALKSrAWq39SRFt3FM081GtaPmVRNxZSFjqLl66tossFBqVFkhX0jEG6oX6Fl6OgvHaY4KGEXdKxrGqBTUw88kR09jkxJnZh114j9n37pE7EZtArex5B5GHNDYdkC9v7paM13D8jfvZY8bFd6/qUkZXcDDC5O7ki39+sJiMny3Cp9cCgDmZecNJWhotZjncNDGPAHEXur1SNTu9ofVpExoHjcRM0j+5+Yi/WZZCJEG1lorovVb6xxeec6KcaJ7QrOAcGAi0CwPVYVrgIs7yhWQjY4IJHPHVbBfS7psmCljvuncqOcLzZ6GG3SUU4hKPc6BOXXT7XAAiKtgW9MMRnnL7Pc+I+a2ittjkD4fID3k+XTTpDQYVvqT0MJ4tmaaA0cUjuC1D8pgMwRlO6Ys+6qCb8gGES0w0d9vgs2/UERcXs9OI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVpFd0dGWXFETlRnQytUZFF3K2RxbFFKN1Ewc2hwUk5uYU03M3hkYnlEcXJv?=
 =?utf-8?B?Y1J3ZURpd2V3SC9MWk9BWmJWaHNhWkNMQTRmSW50NHU4Q3M0WVhhSm84R3V0?=
 =?utf-8?B?a3JuQU5vTUdJZGx5Sm13bERuNmVpOG15YVp1b2FkWXlqUUgrSmk4T3VUZExN?=
 =?utf-8?B?eHh1OHRaaDFjOEtiTXVLOG93WW42UmlzVHVGYmI5dHFQMkpIaDgybTVXRHdp?=
 =?utf-8?B?ait5NHNlcGVQNVVacXFYUHVrTHoxdFpCYk80UmkyZGh0dVFwbWNwUFQrd2xp?=
 =?utf-8?B?ek5yZFFXQ0ZoYzJDajlWQXFYVDhWQkJUdjhrUjdLWXljbG80b1EzQ2xiY2tR?=
 =?utf-8?B?V2hsWVNsSU5WTGN2NGt4aENCcVdZb2xGSktzRGZuN3N4cmo4dVJPdTZzTlpr?=
 =?utf-8?B?VHA2c3B4cjFCOVhLYk9KWkJ1OWlRNXY5M2tmQVYvWXQvVitwQlRITTl1dHl3?=
 =?utf-8?B?T3doTWRQVnlPcFBRWmdPeEduU0lLNUJNVGJRUXM3eTMxNlpRVHJtVDR2Q3V3?=
 =?utf-8?B?VkpYczdBc1E4eXF1L3o2Q3FHVUx3bDgwck11aUlhSEhMSHhib0xNN3d6M3Ir?=
 =?utf-8?B?U2Z3Z0N3ZXp1N0U4dWxNeHY1UmtPTGhpTlBpNXhIalN4SjdMeHlteHFWTUdq?=
 =?utf-8?B?VFNDQjBrTkVzVXZ4Z1BoWGxNaFJ0aGlCUExMRjN2QjNaQXg1NDkzdG1lZFhH?=
 =?utf-8?B?Q3VwNmR0YnBxZS8wblpUazlRNCs2R0RYZU9JVUl6SHpSQi8zSlhrYmRCTmUw?=
 =?utf-8?B?Rk1HR3EzYWlFVlE0S0REa0lneVFtWXhRZzNOTlQyYUhTVXVMQWFBeWpJRkVp?=
 =?utf-8?B?V3gybmFycGZoVTJjV1IvOVFaUFF5MlhNQnFHZG50QXVoNEdTK2dUQVJaV3gy?=
 =?utf-8?B?cU55UmRUNTBHUHR1cjVUaTNHWENBR1ZCMm5OY2hoQWRhamNVMHVLQVJQYzN6?=
 =?utf-8?B?MDV5Wmk3bWVZNkhVNmVUd2hWVXhTOGZFN1F4U2RCVmpNRkpqMFhvQ3JsZDlk?=
 =?utf-8?B?QjVHblpYV0owMTNXUHJYeG1zbWJJRSttWDdsdG5EYVhXeDZEWlFLY1podzdV?=
 =?utf-8?B?azkwRnhteU5JU1k2UzkvVnVOOTdnNFhGbUkxWC9pY3VHSUpIMG56ekJLWXFm?=
 =?utf-8?B?R1hHK1BIMTNDT1JoajNibHhlUDRGbWxSNEZyZlFUZFQ2eWNyRnovYlAreDd1?=
 =?utf-8?B?eFlaUU5HSGdORzMvSDRrZ1RVRDlROGJvTEh6UzBVZlZWMEZwOVdxSmFkeVRy?=
 =?utf-8?B?RlN6b1AzN05nTFBTaktDbHZxK2M4dzhUUTJIRjdnL1ptelBIWk0zZmlpOU5q?=
 =?utf-8?B?YWZ2T2J3SnJnK0JQNmIvZjBsRll1T3RyZGtwOGNibTBubnVSVk1VQzc0MFVy?=
 =?utf-8?B?Nmh4U3pCZjdoa3dDSHA1RTk2YmVJcUt3ZVFadkRsRHpwcEhiQjhhY25kOGZF?=
 =?utf-8?B?WGlwbUtLUTJZQnM2Vk1ZSGxvaFJmbndJSjFCUmhkUFlLNkVYeEZkbEd0bTBT?=
 =?utf-8?B?cE5ZWGJwZ0Facm1VTmJuR2JudGprcGtKYlNUVy84emEvTnVKMmF4WUtPSHN2?=
 =?utf-8?B?VGhyMmk2bGREK0dMUWRncDhvZUdMMmJrKzY4TkpOVWxraFd2TzJXakViQ2Vk?=
 =?utf-8?B?M3pFWHB2ZE1yVXh6S0VYU1RGZ0xQN21jQ3hRWmprUVJkMXJmN3VDQlR0cGdR?=
 =?utf-8?B?NGJBdEhKbnpPaks1bUpTRXdvVjMzN1J1SFpFSjd3YXdQQ2V0QTAzdi9JVXlJ?=
 =?utf-8?B?d1JWTEFPeGx6UHZMSUswTmNIdnBqbHpQVlFsK2hJNUk0VUZkWUtzODZIOUZr?=
 =?utf-8?B?cVRLMDhUQmp4ZGc4cDlRVjZQenRrK0I4WXR0NVRRNkdFSVNjRGdDMFpEenZD?=
 =?utf-8?B?c2tOUUN2alR2YklDNWkrYmtkMkhuMkhFZFo1SUJEN1ZodjFselJrVCtEOGVh?=
 =?utf-8?B?Q3RzKzFDZEFhbXF3djgxV1lpWlllTWZVb2VWQkM1MStqaVlmRzB3blR4cTBE?=
 =?utf-8?B?cXpXbEVkd0tJc0w3cmFkd2FWaWUxbkM1OUw1WFFCc3VZRWV5RHdKTy9EZVRX?=
 =?utf-8?B?aUhnZjF1Z2FFY0xwUkpnM2RKMXhEVUFMWW80SXNUK3NjWXZnSDVKVTdnS1Yr?=
 =?utf-8?B?YS9HeVJzZ3BYMGM3cWJ5N1kvOVVsQU1kM1lJaFlwRDFvbmljSjBwMjRMaXE1?=
 =?utf-8?B?VEV5K0MzOEpjc0k1b0NQWVJkQTVXblZPdUlJK2hGWFF4Q2puSklBL3BqQlJZ?=
 =?utf-8?B?eVFHV0kzcGJTTExIU3VzcmRETzdoMVlobjZQNE1kM3ZSdzdoNFd6OEpIejJV?=
 =?utf-8?B?TFlkS3dEd1dXc1VuV0ZWRTVIZmhVTVJnY1MvNDRLWXE5RjRBZU5hbFdwTkxW?=
 =?utf-8?Q?4cFTjkc9abNdFSgcoccsFiBCv6WcmTx9CST2UKMwidSda?=
X-MS-Exchange-AntiSpam-MessageData-1: RJnFIlDXc6yZBg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c06478-4d62-4f64-2c49-08de842424b2
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 12:53:10.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebrKzkAX8bG4f3yysFtjW5IzMFTxBGGCtOo8nvTbbFZi7n1+vXo0V34OR/m+3r+9cRRKcQDzq7QbL+bEnQFh/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6417
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33633-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: C67B62AA2CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 17/03/2026 11:44, Bartosz Golaszewski wrote:
> On Tue, Mar 17, 2026 at 11:12 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> Thanks for sending this. However, I am seeing a different issue now ...
>>
>>    ------------[ cut here ]------------
>>    WARNING: drivers/gpio/gpiolib-shared.c:499 at gpio_shared_add_proxy_lookup+0x118/0x1d8, CPU#8: swapper/0/1
>>    Modules linked in:
>>    CPU: 8 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc3-next-20260309-00005-g02826fefa46f #14 PREEMPT
>>    Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-42974706 11/20/2025
>>    pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>    pc : gpio_shared_add_proxy_lookup+0x118/0x1d8
>>    lr : gpio_shared_add_proxy_lookup+0xfc/0x1d8
>>    sp : ffff8000832bba30
>>    x29: ffff8000832bba30 x28: ffff000080d01010 x27: ffffffffffffefff
>>    x26: 0000000000000001 x25: ffff800082df0538 x24: ffff800082df0528
>>    x23: 0000000000000000 x22: ffff00008012c158 x21: ffff000081455010
>>    usb 1-3: new full-speed USB device number 2 using tegra-xusb
>>    x20: ffff000080d5d430 x19: ffff00008012c158 x18: 00000000ffffffff
>>    x17: ffff8000830786a8 x16: ffff800083078718 x15: ffff8000832bb880
>>    x14: ffffffffffffffff x13: 0000000000000008 x12: 0101010101010101
>>    x11: 7f7f7f7f7f7f7f7f x10: ffff8000827f20d0 x9 : 0000000000000003
>>    x8 : 0101010101010101 x7 : 0080808080808000 x6 : 15151a0a59460209
>>    x5 : 000000000000003c x4 : ffff8000832bb990 x3 : ffff0000800fe800
>>    x2 : ffff0000801c2f40 x1 : ffff0000801c2f40 x0 : ffff800082df0538
>>    Call trace:
>>     gpio_shared_add_proxy_lookup+0x118/0x1d8 (P)
>>     gpiod_find_and_request+0x1bc/0x548
>>     devm_fwnode_gpiod_get_index+0x1c/0x6c
>>     gpio_keys_probe+0x494/0x9fc
>>     platform_probe+0x5c/0x98
>>     really_probe+0xbc/0x2a8
>>     __driver_probe_device+0x78/0x12c
>>     driver_probe_device+0x3c/0x15c
>>     __driver_attach+0x90/0x19c
>>     bus_for_each_dev+0x78/0xd4
>>     driver_attach+0x24/0x30
>>     bus_add_driver+0xe4/0x208
>>     driver_register+0x5c/0x124
>>     __platform_driver_register+0x24/0x30
>>     gpio_keys_init+0x1c/0x28
>>     do_one_initcall+0x7c/0x1c0
>>     kernel_init_freeable+0x204/0x2ec
>>     kernel_init+0x24/0x1e0
>>     ret_from_fork+0x10/0x20
>>    ---[ end trace 0000000000000000 ]---
>>
>> I see the comment says ...
>>
>>    /* We warn here because this can only happen if the programmer borked. */
>>    WARN_ON(1);
>>
>> I will take a closer look, but let me know if you have any thoughts?
>>
> 
> I suppose this is not a reset-gpio-like use-case? Could you point me
> to the DTS you're using? I've reproduced the bug with a dummy dts and
> xlate function in gpio-sim and this patch fixes it but maybe I'm
> missing something.

So the board I originally observed this on is a farm board with camera
hardware I don't have. So like you I started off reproducing locally
with a dummy dts by making the following change ...

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
index f6cad29355e6..5e62ffb425f4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
@@ -389,14 +389,14 @@ gpio-keys {
  
                 key-force-recovery {
                         label = "Force Recovery";
-                       gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
+                       gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 2) GPIO_ACTIVE_LOW>;
                         linux,input-type = <EV_KEY>;
                         linux,code = <BTN_1>;
                 };
  
                 key-power {
                         label = "Power";
-                       gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
+                       gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 2) GPIO_ACTIVE_LOW>;
                         linux,input-type = <EV_KEY>;
                         linux,code = <KEY_POWER>;
                         wakeup-event-action = <EV_ACT_ASSERTED>;


With this I see ...

  gpiolib_shared: GPIO 154 owned by tegra234-gpio is shared by multiple consumers
  gpiolib_shared: Setting up a shared GPIO entry for key-force-recovery (con_id: '(none)')
  gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shared.proxy.3 for GPIO device tegra234-gpio
  gpiolib_shared: Setting up a shared GPIO entry for key-power (con_id: '(none)')
  gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shared.proxy.4 for GPIO device tegra234-gpio
  ...
  gpio-keys gpio-keys: error -ENXIO: Unable to determine IRQ# for button #0

I am not sure if this is because these are child nodes of gpio-keys?
Obviously this is not a proper example, but something quick and dirty
for local testing :-)

Jon

-- 
nvpublic



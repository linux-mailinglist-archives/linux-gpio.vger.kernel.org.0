Return-Path: <linux-gpio+bounces-34524-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA0TJ2aGzGlXTgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34524-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 04:43:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F5A373F97
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 04:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B087430D70FA
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 02:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166A035C19B;
	Wed,  1 Apr 2026 02:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="B3BekXRk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011025.outbound.protection.outlook.com [52.103.67.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0954774;
	Wed,  1 Apr 2026 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011250; cv=fail; b=k+nKMq5nwoP/UodH6Q8jnKyThnhkswzOwFIZK2yApdHbTZpeWIVn2Sm9qVJFFAEreU16c1u2FGEgTci/5fV7kWGyg+d+VrdQnGs15RUWvBzKv7i0V+oTwbSeaizSTvPE94XGy9NMaLd5e6p9ApQxY3s5Qmpm1/PfzepYztZpKN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011250; c=relaxed/simple;
	bh=CZjvGdK719YtyScpL7bHW/p9vv0CPz1w0JIoe5ucxA4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZSQnQQTLf67DThA2CfMKimgH7vnTz7NNncFPkTBgQlVq9Vrt6vkgbYxZlmG+vDaCMqFZYEr65RNUpFo8WvIhccOkwPXH3q40Ubj0hgJbC0GeBVD9Z//80A/8IKZUTGnbSlwuPw9hoyplSnKVitZqWB/Nuc+isrTOhqsUGr5Mrvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=B3BekXRk; arc=fail smtp.client-ip=52.103.67.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGd3xvvufqs60KtHV3bWrftPxaMXtj6TNdds4a20/sLh8uPHy9mXlLUmnUsdEXbDupWmeNNWwwXBTZ3IO8fLY+Zkxo0ZsmLJYNIY8SVQo9gUKXLK19dAYzurU7ukvVxvm+Ejh8hMQz57PoVLDpn3bTKJc03TtrhiQRn03KHxg4I3bHQ+8x95P2Z9+zzGTH/MJKL0KdqyahB8bas1COos0UjbUsfSSGyUS9ObkxCSmNgX9+UrYQAQAe+8qI9oTP/Z/Wz5JOU5xAA+9e31bfKsz9jwIwPRgGeiE4udnFTJj3iNr5/pT1lJfLBBVzwCaN9oudik4DdCuOZy8TscjI4vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1p6YJJ2bptTXxKMJPMg/PXesOxPsuaSb3IQvCJwPNc=;
 b=ebv2GlJlmCh+daxxTcoSac/3noLRN8CT/1M9kUB1MAEGti7QUeu1qHAL007HUhUOC48TZE0kF0GDwuNfi98WwIeeIV/9vYH1xLHgKQDkF/fBCrQ9oza05hRJtnnDQ2rNtk4cM7ig6BZl5V4s1iZeacpiWnLhHAHZq0lr6gDfNlUsoZ7+TE7IX1B7PzDph2kPEFUpYEYaozBiFR6cpnxN5vckrtMC98U4mEKDiS/6pUAbZOcTx3gUZvP67Ldr1Qy80buwX2ystl2kkuOZL2L72l9XJ8mbNDNET+alLqvh0a80+IupyzE96FAwiuYFmozRKnY4C6A+zLqwAAZAPr6N1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1p6YJJ2bptTXxKMJPMg/PXesOxPsuaSb3IQvCJwPNc=;
 b=B3BekXRkSFVXZ1KeYezf5hUcvFZqyKv338jZ56nvbbafmvrtfrZIK4+qj2Mq67giYUt38pmSb1Q1z5KabQwOK4pDwU/b3MwKvZHKeqsCP93nfA3xYFYsdX8RyFVHG3+62qvWvaJIBXeqoxmDirTlcjAjILzJELCES5HWvWZip4QD3qDPiLmMd/SkmCMM5SfGCsTg0TET+ShrZOpkAKJtjZprS+yKFZmSWF5HUP448RyMJPR1Hsg0reAocuNtTCSpwea7r5ml81ZZHvtzp29sff6bwWRj8qilc+xCfPIQEjZRZFA+n1qJcFMrXM1wC5LcDAuXpzAo/VGnaPNXrpAcJA==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN3PR01MB9806.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:150::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 02:40:29 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 02:40:29 +0000
Message-ID:
 <MA5PR01MB1250006189A2D016D47D9DB80FE50A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 1 Apr 2026 10:40:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: sophgo: pinctrl-sg2042: Fix wrong module
 description
To: Inochi Amaoto <inochiama@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260401003552.363205-1-inochiama@gmail.com>
 <20260401003552.363205-2-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260401003552.363205-2-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0136.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::11) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <e31c0a91-33b7-4194-aa51-52588696ea60@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN3PR01MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb1e407-5dff-4eab-7a41-08de8f980989
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22091999003|24121999003|19110799012|25031999004|6090799003|5072599009|461199028|8060799015|23021999003|15080799012|26121999003|3412199025|440099028|52005399003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmxVazRhajNabHk1bm1OdnkwMUhEMy9xZlFTcVNodkRwQkhaOXRpcTk4aGtT?=
 =?utf-8?B?M1laaE04RkZNY01DR0ptZGJKSjRmc3hVNjkvbVpjWWRFUzZock12T2plUE5q?=
 =?utf-8?B?d2I2U3NMVEVXL2pON0tacGR1TEVYOWJWTHVOR2Y5WXJ2dnA1dUl5bC9MQi9u?=
 =?utf-8?B?ZHFnYTE5RWNUcTNhZFBqQ3p3SnRiZXpSeGY1VzFTU3o2RWFWckIzaE0zc055?=
 =?utf-8?B?MmdpY1V2dUxqUHJaMktLMEZjVzdVVWxrU2J2MlNZQXpTZjlNaVJhby9QWmgz?=
 =?utf-8?B?UC9SMStMQnVnZEtBM0h2ZDl2OXlWeUw2blU4NVNXQ09HcmZ3cG9DS2VqeWN4?=
 =?utf-8?B?M3VBOURkWnh4OFpmaWs5OVJjdGZOYWlWejQvZlFCbUg5YmpkVkhwSjRHR3dj?=
 =?utf-8?B?YWRTeEVTV0pIWEF2YUZSZXI1MDUzVkxsdm0rbi9MRDFPKzNoTDVjV1Zvb1cv?=
 =?utf-8?B?cHZqeGxuMDBvWTV3bjlLT1pUL1dCd0ora2Z3RFpXQ2gzZmxpTG93STIwMkps?=
 =?utf-8?B?bndVRTE4aHpEa0ZoYmhBVE9oak9vQm1xbVB6M0hGaHE3UkphSld0MVNsTk92?=
 =?utf-8?B?ZGw3M3Z3cU9PSlRkSWpRTVIwaVRZNCtQNExYQXdSTXJPN0gzOCt3TnF5dnJL?=
 =?utf-8?B?SmttZmtQamN1WkM0R1NIUC95QU82RjA1OHNDMHBQWklpaG1CdnhBai8yN2hn?=
 =?utf-8?B?UjVRRkIxenNLM1dDSHNaVjhaNWtsZFI3UGZscFA5cjlHcUE4a0t5Vk5ZRjkx?=
 =?utf-8?B?NHpQK2JmTjM4R2hpQVhKaFcyQWpoRXd5YWVJK3dvUUp2bmxSRmVWYXNPL2Zq?=
 =?utf-8?B?MWZoOEU0MkpUdlZGeVdBeW5zQ09VekRUNFNpaGRoUGRud2xLanRlb0lFd1Ba?=
 =?utf-8?B?N0RucmVuOGxuM25qem95bmJsV2R2Qy9TdnNMTGowQ3NacFZMRmRObmJ6RW1W?=
 =?utf-8?B?UnVwaGJudmRhd1JlRmlMZ3B4SmNwTitidG12OWZpcU81QnRBSHdLRjMvRlpn?=
 =?utf-8?B?RDgzQ0gvYzQ2VVpFczl6M3Y5akduQzFNUkVTeDRPRGFySUUrSytBKy9RN1NC?=
 =?utf-8?B?QTNDZlJTRW1KMVlKSWN6cDhCSE1LNC9oakNheGNmdTZOV3krQnZMa2crZExp?=
 =?utf-8?B?cGFFYkpPS2pHNVQ4Tms4U2wvNXpPWDk5SHlYU2xhM0VILzgzYXVtazRlRGVv?=
 =?utf-8?B?UFVQRHBIUHVqYkZEdHVIRzF5dEViZE1aMVJwVlZKVWRXL2JvVkZBS3d1QnhM?=
 =?utf-8?B?WW9lbU4ralo5d2xlaW5wMUZqWTVmblR6VjFkOUtNcTFNcHVZMm5yU2pJSSt6?=
 =?utf-8?B?WnZpOHZBdTJMakZUSm1MNklxVy9wQzhKWmlkMkZTUTdrMWRqYkU4VnRjNldS?=
 =?utf-8?B?WmhkZG1TcWRYeDViSm8vWXFTd3FLN0JZbVRsZWhWS2VQUnFmR3hpQy9XR3VK?=
 =?utf-8?Q?8rQEByYR?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFFHc1lJM2NDVVptZ1Z4U3hjUExSWGRocy9NeFdmTnZ5NGF5Z1E5U2ZVVytM?=
 =?utf-8?B?R1llc2x2bzFPeWRUQTRQTmVDd3g3Z2loek9xUlhNRG0yQjQxR0VLaVI5VkJj?=
 =?utf-8?B?ZHpPb2xHRnMvck0yMUtkNmZZdHdSak9sVmpoZ045YnhvaTFJWTBhQnJYY2o4?=
 =?utf-8?B?UFpBblhKOVpncUg3ZlZ0b2xRRnJ1dysrdmNOWUcxY3BHYXhLWkdWZmpRY3dX?=
 =?utf-8?B?WFk0SGNIN2FjYWE4V1RFTXhIQUJyd2gvYi9uZnduL1A4eDVobDhpKzNoODZS?=
 =?utf-8?B?Y09SeDZRNnN1UmlrTi9zSWRZUFBnUzF3RGxQV3JYL1Y0SXUrT2VtODd2YVo5?=
 =?utf-8?B?blYvK3dManN0U0xWQ2ZtY0YvYWVQUHpUbUJKWWcvSk1uU3FvS0E2Sk4yMkhE?=
 =?utf-8?B?Y0FVdW51T2xTTmV4QWVTYTFaRHZXOGNudHRZVkQrVVJRS1JGUTJxL3VLbk9j?=
 =?utf-8?B?KzI4TWRpMkNDVEJSOENNWnZ4bWJzc0NRTjgvWFhMYmo5Y1VHUXBFZjB5MWtU?=
 =?utf-8?B?c0I1ZHlVUFJvSjJQMWplNjJ6WTlLRHFGenYwcUVFZEJDZUZtamFKYTE5UWNa?=
 =?utf-8?B?aUJNMG9jbzlxdEkrOFU0RUhncVd2bEtqcmhtZERlN2lLSnJOclF4TWI5enIv?=
 =?utf-8?B?emFyMXBlU1dnNXRFbnUvTnhqODI0L1pwR2FGWms1YmJTM2FESU5BKzNpNEp6?=
 =?utf-8?B?bjRndDZFcWNiOUpCcTFsa1hEdEd0eEl1bDFaTkppTExiM3d1YWhQY3JhcmY1?=
 =?utf-8?B?dWlqaG1keHUyQVZqbWFLNjl6QzZiWEt6VGs4Vmo4Yzd6TXNjWU1JbWV5bWxG?=
 =?utf-8?B?RDBaYUp2V1Fvdy83WU9YOHRpWmtvR2xaSEg3Um80elROUGJNa2RRMU9CbzFs?=
 =?utf-8?B?aGp6YXdsYUVDL0Y5UHNnQXJxQ1dQVHpybmErb2ZnOEtRb1YxSUV0L2cxTlJH?=
 =?utf-8?B?NkNSY0FjUWsrNGRRL3VxRXhqWGtMSm9BVTIzVlVhclozN29lTzdZZFdxTFBI?=
 =?utf-8?B?KzEvZ0pIWWhOaDdWL1daQXFKaXlzOHluY3pIZHVkWHQ0ZDl0UkZxVWFsMDZw?=
 =?utf-8?B?SWZDaWlEOXF3Z0RLNzBtOFBzRmh6RjBIVnZ5bVJZbGJsWldGQTJXMVFkaXRH?=
 =?utf-8?B?YnJYTm44amsvQWR6VmxjMkNqdXlvbWhCdmNrYzhGTXBTMTU3NkY5NjE5czVi?=
 =?utf-8?B?U2V5cU1oZjUweHdjaUcvcHRreHVrR056VVExQjNZWGtJNU9OWnZEanlCdG9Y?=
 =?utf-8?B?K0NIZnAzT3QvMmhBaEladWZYOG5sTFZQdllvTXhsNnBKSjJDWmF3a1lVaVRX?=
 =?utf-8?B?ZXVTQmxzQmN0QVliOHFkWldoK2pGLysrTmtzSG9LRmw4U1YyZW5NSktjREQv?=
 =?utf-8?B?dUNBL2xOVk9UZFRTZm45RUN6V1FYNURHUm81aUwyOUU2MGRWNmZ2S3BsZ2Na?=
 =?utf-8?B?MmNjTy9KM2d2VGYxeTNkTXk4KzRURGlEMEoxMnBxWC92K1JVYjA5aExUcG1V?=
 =?utf-8?B?WmYrRXNrMVdTQWtBTmpkQ0NYbmpQaW9CNGxvdzNVYUcvQjRMczhGa2s2TGpn?=
 =?utf-8?B?WVZjUGRZbjdyeURiamd5NjBGYjhtZkRBeWRscjg4S2Qya1daWERwTVhzcklC?=
 =?utf-8?B?aXNlOEQ0K2VvaUd0YkYwWXpxanovekV4Mk1hT0ZtS05uZkRnelhmcTF1aVdq?=
 =?utf-8?B?RjgrV2ZkaGtUbkh4SVJkZjRyVm1vQjljcGVlc0tNc0pZcXFoRFNqSHN6R1E1?=
 =?utf-8?B?WURqcDNnR2w5YlFSclJJNWR3bUpEVUNmYzJBKzVtb0hiYnFoWE9hTkh2djVO?=
 =?utf-8?B?YWtjWHcvcEV3RmIyYzRSU3phWXRXcHgrVHU2ajRVa3lPdmdCSzd3d0c4MXhB?=
 =?utf-8?B?MGwwWkFtYTZPRHFpWDVQVC9rWk9RZ2dieXZMZXZIV3YyaGNEK1RkM2F6TFhn?=
 =?utf-8?Q?4gRyjjFArBO0ay6Qlt0SarGuj0l17kDc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb1e407-5dff-4eab-7a41-08de8f980989
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:40:29.4849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9806
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34524-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[unicorn_wang@outlook.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gentoo.org,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:dkim,outlook.com:email,MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 17F5A373F97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/1/2026 8:35 AM, Inochi Amaoto wrote:
> Fix the SoC model in module description string, it should be
> sg2042 instead of sg2002.
>
> Fixes: 1e67465d3b74 ("pinctrl: sophgo: add support for SG2042 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pinctrl/sophgo/pinctrl-sg2042.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.c b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> index 185305ac897d..8dba12e122a4 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> @@ -651,5 +651,5 @@ static struct platform_driver sg2042_pinctrl_driver = {
>   };
>   module_platform_driver(sg2042_pinctrl_driver);
>   
> -MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
> +MODULE_DESCRIPTION("Pinctrl driver for the SG2042 series SoC");
>   MODULE_LICENSE("GPL");

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>





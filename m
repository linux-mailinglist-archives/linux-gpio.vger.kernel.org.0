Return-Path: <linux-gpio+bounces-34525-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FFONDmHzGlXTgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34525-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 04:47:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740CE374001
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 04:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71CEC30E0A8E
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 02:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F7A33B951;
	Wed,  1 Apr 2026 02:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="H8HkY2KY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011034.outbound.protection.outlook.com [52.103.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173DB363C4C;
	Wed,  1 Apr 2026 02:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011282; cv=fail; b=Wa/vWH4nKhy829Q7lLbWM3K3jFm4eg3yrjTzbDivjnuVoGhkM/VpEdcGee2A12eod28h/XOaH7qTH0XmUa9co2aZBmB/cNlgXZ8wn4WEBsD9OshED6Up/VGiZ9VgCq+BeKpnaIvPEfB2PTNnMLhHTg1hh659GBJT3/H87Rjevj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011282; c=relaxed/simple;
	bh=/bwrBmadqnrIweJmcsjlquhbrbbHMMtqbmuENnOb2LI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PFd8HSAGzj8i30P0Mpr24oNFDAiD9bPCHvdC9up+FQK6adkGohA+UiqSJ47WdcqfECuE+lXl/0d4sVhqwNjAucTHtkvhn8Bjk9fYZuWZEqej253a5qLNmk0mkaL7k+dCViapJCvd6o5N20yk4Jyyn+OS5GAzi+Uqnyb4ZXjK9NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=H8HkY2KY; arc=fail smtp.client-ip=52.103.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7GZf85WuUrwFDhEn4qXTZaAeixDM/g4xkRnP1DvL6gn/uX+bnIRYxlRpFMeVjE0gTT4M8i/M5p1yRiPg9D2uHiO1mfCpIStV9ia2qYHYruVSuMoW9WumjOTb6sRqDqJqKfape3FfG/lxj1jUsIcgpAWW4b0USY5uCvXGFd8gf5prdT3IqvypwOoIy8gg1DxnTDhlVGHbLHWGG5wDXNaHUr2GYAc8G8+a/VgV0ki9F80DB12l9gQq580DlLvl2CSLC5OZWA+92VfJAmoU4HkuiBrCqcMql/N6i+IwxUb2+HZjOYzZTyecRz+zObrWw8WaOMHbxas15E5ivFtiHLDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2uUUuQxBoW1WfFHYfkA5VmhSu16v+G/+kmAc8/JAG8=;
 b=IwJxrDzZhUpjJGuqAmLCjCfIpWFJAkJ5a7dHBpjfMKkSqg85Uu0EFePb/fFncOOcIeLYSq90FuGA5Azxdj6vOZ+8s+nkFhzprrCrnIcxDEix2upJzC/dO3OiMTvA8xBOjJp5DpYPtbsUC+Sn58aR191ZSzCKSkAYSzdFVEoVLxdKyzMjkAFx04upVN3eyGHe4jkkhgXx4uENYFklE+9nV4z66edo7DiQZtETneNHR3f7P82stuHBRo+xvb3LniuONaXCyp5tyBINeMqpxNSYDsCpigxbMQFaSg9Xn4vwd+vLz6klaoCnEvaxGLQUkUCBtMBKs5bSZllHhyQ2xNsZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2uUUuQxBoW1WfFHYfkA5VmhSu16v+G/+kmAc8/JAG8=;
 b=H8HkY2KYySWD768sEoMMTheSXkly0aFwv33ELByXZm9KRT5JYwiG0K6SGyQ7XwwmPNzxkJENz1HTbTzNjVJ5EHVEfFUDkNdZhxPFxoYL6gPb5r2LvHsGIKOYF/rWeIva0+duXZQE5RL+PE4nkri7ce9KHA2MyYpyefnX9x0UJTgz70VLn4X0UyLGGnaLbS9fRz3vWGTG5MbdlDRh0a3E+uXmrGUqwcicuYCRld2jiGalIGRpRJDtk10qkGc+fZei49P2HSUuN5lXQ4eoJmSzGz27oJf8GJeNXMBq/FKZRv2HVvt9hLamUXovoFSI6icP66+vN4FggdprIr5zSt5yvg==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN3PR01MB9806.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:150::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 02:41:02 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 02:41:02 +0000
Message-ID:
 <MA5PR01MB12500C47F7C39AAAF1B4D4C08FE50A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 1 Apr 2026 10:41:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: sophgo: pinctrl-sg2044: Fix wrong module
 description
To: Inochi Amaoto <inochiama@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260401003552.363205-1-inochiama@gmail.com>
 <20260401003552.363205-3-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260401003552.363205-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0134.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::16) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <2ce9ff28-96f1-488c-9fd7-ea5cd85432cb@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN3PR01MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f57e27-84e9-4459-66dd-08de8f981d61
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22091999003|24121999003|19110799012|25031999004|51005399006|6090799003|5072599009|461199028|8060799015|23021999003|15080799012|26121999003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3VvdERYcVZ3U21RbHJ6SzNyZm9lK1ZVZjhCMHpwNm5BRlN2Qkd3bkFsTDhW?=
 =?utf-8?B?elpJSWUyVUhpalpiOXJwWkFyWWxiditsaHAzOEcxY1BuSC8yWUs0Y3hoSmt2?=
 =?utf-8?B?VHNobGhIRVg3MkM0Nk9RcWFmUDAwZE1xZ1JrYzBnbER1cUF2cERrUE5qVnNW?=
 =?utf-8?B?T3d0bHBNL3MwcTNydlBWSURPTG9meUl5NitVRnJMMHZzTTZYd1FZM2dXU1Bh?=
 =?utf-8?B?Zis5VUphMG1TcndaUG1HSWJCUERoWDY1dEUwRGRYbEZ0eURHUzFtN2k5TGJY?=
 =?utf-8?B?cVFKdjJnNVhCNlFnazlMUUpqR0lGaDVaMlFmdHp6ZjRtbWJ6cyt4VXREeWhL?=
 =?utf-8?B?NUlkbnNTVHBNak1zbER5UmJvRVZRTXcrUXN3Rkx5V0t5SUdqYlFnMU9Kcmtv?=
 =?utf-8?B?Z0l5UFdYa0duZzY2TCsrckQvUnlXNzNoRTVxRXBVUE5Vc0EvU05UejEzKyth?=
 =?utf-8?B?SWdUSkszTmdwUzlYN2RxNFZYa2w4QWdsdW9tb0R2UmJtNzFBaEdYdlRiZXJM?=
 =?utf-8?B?RXJ2YTNMZXhOYTNVLzRyMExlZWMvYXVCdmo1NTVTMEU3YTE0QU8rcUlrMnZn?=
 =?utf-8?B?K05VRW50OUpsRVVKS2tORW5mS0UvcmZkSUJ5endBNEQyREdYSU9ZQnVHMGdF?=
 =?utf-8?B?Ny9Ldm96V2JLVnlNTklMWkN3S2wwa0R2SGltNDlPY1pTVG1Qc1d5WG9EenM3?=
 =?utf-8?B?eGJnTi90aFNBZ0szZHc0OFl3czVMcHBQaUM1Q29BMTdaQmYzQlhnZFhSMDFL?=
 =?utf-8?B?NFgwT1JpK2xVTGY4UzZjVlA4NWk1V2p3SDNSTi9FVmFobVV3S2VDRzdmRnpZ?=
 =?utf-8?B?dnFlY3AzQ0dPOC9mcjdWY29RY3BwKytudjFrSGxsZFg0REpwS2ptamNac25v?=
 =?utf-8?B?ZVRIejB4bnBpSk9TM2p3M08vNGhvRG92UW80bVE0MVE1d0M3b2dSSEQrUWlT?=
 =?utf-8?B?MTFRZ2c5Y0xHaWNJSGk5Vk5OVS83R1lJNkQ0aE0rTEpDRUhBa3EvWkd5OEt1?=
 =?utf-8?B?cC93T1JRemRmUERsNjlQdkZ2a1dhaUQ4TXcydXIrNFZjRTV5c1VhT05NMDZV?=
 =?utf-8?B?STFrM2lzd1FkWlNsV1JIZVpCaEVRbGliZk40cDdTcktjR0l6RS9MZGJvU0JJ?=
 =?utf-8?B?NjU2cFVRZlU2Q0Rrck5EV0NTYVlYelo4Uk1rMW84YTV1Yk43djBNS1FzcVZB?=
 =?utf-8?B?QkU5R3dxTFVkcXNnb3hvUHQrTWxtemxpQUsxZThGSW41bE4xVXp4Yzc0MWYz?=
 =?utf-8?B?aEZNS09GZTZLTzIyR2Nwd2l5TFQwQXd3d0xraFR6RnN6NzZiSHUveUFjUEd4?=
 =?utf-8?B?RzYvYzJkUDJXZmppQi8rVWNIMlF6aFNyQTlReFdUTE93K20vNUV1RnhrVWIv?=
 =?utf-8?B?ZWJTWjYwUUE2OWRrQmhiaHRITC95UXJndSt3UVAvbm8yZ2htMmt5Rkx5TWxq?=
 =?utf-8?Q?+ZiYyc2l?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXdXTFhiR3p6RVpQRVVuUkJ2akYzeGJYRHRKTGM5VzlWbktYdForRFFIOWgx?=
 =?utf-8?B?aWRJeTdSRVVsQmRRSVRyWTlkWVh6M09XRUR3UUxrbjB5UTZydDNONjk5ZU5a?=
 =?utf-8?B?NjBrN3Fta29pc3Q1bmsyUHRCZEt5V2lxcFVrWDl1c3EwbGlmSEZUcUozMzVN?=
 =?utf-8?B?ZG5rZ21YS1N2bTdrNVh3NmFNUEU4NkJIRXBEN0w1K1h1aXZiY0NqSjRaSEFZ?=
 =?utf-8?B?Yld5Z3l5cjlHSjMyaDFGMFVZRWZYTTJELzVIbjhSTER6MWZ5ODlGNDREa2JQ?=
 =?utf-8?B?Ymx3V21JNUFUTk4vVkQvWHhJbVA4UHpSMGJsbW1kbGE3WTIvSStROFlDRlJE?=
 =?utf-8?B?TmhEcStHdlI2Qk1pd1pLU3puVVRJSVZWSStXeVRqR2U4MFd5TzBaVUpmOVha?=
 =?utf-8?B?cUNjY25SL2xkOVdyazhYckVPSXZqZTgvdE1nNWRZTUtmQjYyZDZHeTBMSDJO?=
 =?utf-8?B?bUR5WUR4Nk8vTzRSUWFQd0FSRVNtNG8rQzFpWXk3bTVNc2l5T09ndTI2bnFm?=
 =?utf-8?B?NzEzbS9CTjJOSHhvb1NOMFd3TFJzQmlzTXUyRkpLdDNYam1PcmNFMXZLM2Zk?=
 =?utf-8?B?ellwdXJzZHFpbnY0MXRSc0p3VUdIc0dGREIyNXgyTm52YkR3cGtiVE15VW1o?=
 =?utf-8?B?djUwbXRIYUtKTUxUZzdtb2JlVXFEc2lLeTA0NC85dXk5d0E4QWZ4L3lJQ3k2?=
 =?utf-8?B?Y0lVT2pRc0MySlR5OXBMUU9Ca1NRLzJocVEwbCsvU1MrTm5kRlUvV0ErWHNv?=
 =?utf-8?B?OHdNemFTbFYvdTdUTFV5NW1VdDZJZ1Njb2J2Zy95WjlVTm1aTEZ3L3UwZzBD?=
 =?utf-8?B?WFRkc2xLdy8zTXVTVVlncmsvVGlxMkM2enU3blhTeU9zWk1RRUpCTGt4UTNV?=
 =?utf-8?B?WEVLbzlJR1hZUEg1SzRlYkpZOXE4eTZrTDRYYWRRZ09PQmtPbWU1a2cvTGp4?=
 =?utf-8?B?ajhTVVA1TWRGL2svUHhCcmJLNlpBMnAxMDR1YVRmWGlEQTE4WU9GNnc2Y2tj?=
 =?utf-8?B?SVpCVC9LelhYb0NZN1ZJeFJRZ25MLzdDdGhiYWxBN3FLaXVoUjFVd1gxMG82?=
 =?utf-8?B?c24rb1p0cjh0WnpyeTNkc3BkTkkzNnNPR2JicXhoa2xPKzBPMjl4NzZFSU15?=
 =?utf-8?B?Y2owUkhMVnRzVk1ubzVPeWxsQ2Rrc3RtM0MveEZHeXhsa0FGbjJUT2ordU55?=
 =?utf-8?B?SmViTkpSKy8zNFZOVkxTRjE5WEhsRllWdFpQNURHOVNheHVSeHk3N1lvWTNn?=
 =?utf-8?B?RktSSkRjN3B6aEVtY0ovMnJsZExUYy9iYk9aeXIwMGZ6dDloSVJrQndrbTJ1?=
 =?utf-8?B?bVFIWllqajFMY2JNUVN2VnIwZll4aHV0OXJERm00a2tkV0RlRzlBL0p0ZXJi?=
 =?utf-8?B?ektkK2p6d0d1dWR4czlOYzB6eG8rY1A3UjZBWXdnV2Vrcjk5NHRQZlQ1MFZH?=
 =?utf-8?B?djFVR3haVUE4R3BUY0pLc3grci9hNTBycEllV3N3Y3orMzZLbVBRL1IzM0ZS?=
 =?utf-8?B?Rm5rOE5YL3NVK0paamJpTGxBaTZrd013WE1vcVBhVUllOTVWYmdGUlRhV2V1?=
 =?utf-8?B?WlFrS0xFZWlNbGR3NFozQk1HTHR0dUZmUFN1NnpJck9KWGlLV0RVT09Qd3Ro?=
 =?utf-8?B?Y1Z0bGNNVk5qbVlWUFV6S2NaWHBmckZFZFd4WmVsY2p6bjN2QTVoNnZOU24x?=
 =?utf-8?B?M1BVVFkxVDAvdzdPMlRuZTNIMnVTUWNCNWZFTVlKYTZhTkJhUXdPUUIrY01z?=
 =?utf-8?B?KzF0NVhyczg5NC9kVDFlRjAwb1dWcHU4bkJqbXNTUEhTK25TWFkwalB1Z2Fn?=
 =?utf-8?B?TktURU1KTlFnVXNXZWkxaHNUdFBERDRrQWxUbXJtK0ZjSms5UFB4K3hyUy93?=
 =?utf-8?B?UDVsOU4wRGRWVjFYanB1VC9RZUdaK2xGWTV4QjJlUlcrN0k3WDRvOC9WSWs1?=
 =?utf-8?Q?XkpJMfVjCj7h2cFakSTarDbLC8O7DcY0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f57e27-84e9-4459-66dd-08de8f981d61
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:41:02.5769
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34525-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:dkim,outlook.com:email]
X-Rspamd-Queue-Id: 740CE374001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/1/2026 8:35 AM, Inochi Amaoto wrote:
> Fix the SoC model in module description string, it should be
> sg2044 instead of sg2002.
>
> Fixes: 614a54cb5ac3 ("pinctrl: sophgo: add support for SG2044 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pinctrl/sophgo/pinctrl-sg2044.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2044.c b/drivers/pinctrl/sophgo/pinctrl-sg2044.c
> index b0c46d8954ca..cf0b674c038f 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-sg2044.c
> +++ b/drivers/pinctrl/sophgo/pinctrl-sg2044.c
> @@ -714,5 +714,5 @@ static struct platform_driver sg2044_pinctrl_driver = {
>   };
>   module_platform_driver(sg2044_pinctrl_driver);
>   
> -MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
> +MODULE_DESCRIPTION("Pinctrl driver for the SG2044 series SoC");
>   MODULE_LICENSE("GPL");

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks,

Chen




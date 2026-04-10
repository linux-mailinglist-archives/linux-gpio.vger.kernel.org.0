Return-Path: <linux-gpio+bounces-34988-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOETHMC12GnnhAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34988-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 10:33:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F353D421B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 10:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A8473018750
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 08:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35D83AB284;
	Fri, 10 Apr 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gmfqp0Pd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B138A299;
	Fri, 10 Apr 2026 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809514; cv=fail; b=QpxVyz8LvQ1umNbxlNCuj2TE5Xulycce3+TzSmKhYLquBpVbXH+ImfqpFDXrastySiJTozoefsdoYNr6nigkhQdE7yvlZKp+oKbq5DoDISqFF427st4urFhm44BzQOt/xi3yw/TsCbzIdGZ+yh/yowygA1F5tkHVhqbZqQR4wQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809514; c=relaxed/simple;
	bh=HBeEjrS6FxT0JFyn/OQCApfLTp669dnTrzXEtaCDfcY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eCKEAVzoEX8oouHdiV++JiAERUANggwyswZ7uPnMmInWS4P63u0aCHUB0iB+p80UqtIIUxCjZ3c6Au4BkuDYOk5jXBeKElOAkYCkAjo01cwbdNXea97Ibdb/jm5Q8Ru9Qhat7og5yM83IMSnfvt2F5zRET5+sB5RxRJKv9ixba8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gmfqp0Pd; arc=fail smtp.client-ip=52.101.57.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H45FnYizN+ZkB9ZKXxhgq7FTeQbMrGgEdEXVd1Um6tmwWB+yA56cosbr+cAcsiBgjvJRXe2QNDYQTSrxiBkk8ztCqOkJmhckBnOPmSK5nUA392cX+DtcTJhGD+kWy2bAYsX2fdB3+6RQCLHUkBTJukjqB08X0WYH+p3UVncAxASFbrNDSUQCMLMYOgQaUB7xGlwuFesKHQvOxvOibwng0BZk3Lp9WhAkDSyrkO1yYPgrohqoDCfrjW8bJsq9I1defZag3GUuZ9rRxMHabgORE6S4Z70HxypEvTh94AonnwdBv1ugEFdmJGcF+8iuv2Qa+gHUifDEQB5ODoyCRXdV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmNiNzdgUYcKDeXwh1MmP3nvClKk54FUM86/bXeQqNw=;
 b=qlOQEVd+NYyu9HFWHOpC+zTx+q+rCNEgyta8UWzHEaMW2czCMeKfyNbMd/QgQ7fpgHqnOR5pJgzff39Yr5Wmk9TRJ1V2EQcc9KnZ5f2Hohqv2lnx9l5zllCYjbmik7FTZNqZxdEAHbl3REL7AWErk2K5d0a/vpBD7S7y2JJzZWEPKjbiHincuo1Kph/bSaWNishw257ZrqcQtKLk0CXLff8reyxm1IbkclIUbpQqBpKPQyKYc0ks3AYZLLdW6liSnJFNeAiQDAkz114T8vjI8Y/ZfqQfe70sZc7NqKDVt50HSJ3El9seVS9wYhn/jNbccQB4rKW7pMi927AAz8MU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmNiNzdgUYcKDeXwh1MmP3nvClKk54FUM86/bXeQqNw=;
 b=gmfqp0PdMwcWAhspaVd3MokeANRDwr6Z0vSYJCoqoT0k9uXrwvWCVhDreNHQoH7p93PqbagKiIcNM2yLPvAqTYUnKvA5ChHwlPm3llPswfQxALHJLaJxgQ3yjOa247a5ePXD1KSkN5VFUUB4ugWUZt0Vz2tccFFQM21p5acJZKgYngatCzK91bUiwaXPR/zLIblX63KVKyCiX9T+CRT7T0D7XxxVydblKIKe2Ge5RCX82N7kjgENe5v9X6LUC4UEVjXXQHDG0EJhbuPNVAChEIxRNIX5llFf9it0HHfrbhh/BinO98YEiwhblj+WJQVquPbXJTuASL1qbT05XsQW6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH3PR12MB8912.namprd12.prod.outlook.com (2603:10b6:610:169::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 08:25:07 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 08:25:07 +0000
Message-ID: <097f71e0-cbc8-44e3-ba60-8bac79cf5217@nvidia.com>
Date: Fri, 10 Apr 2026 09:25:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: defconfig: make Tegra238 and Tegra264 Pinctrl
 a loadable module
To: Krzysztof Kozlowski <krzk@kernel.org>, pshete@nvidia.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
 geert@linux-m68k.org, krzk+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
 linusw@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, rosenp@gmail.com,
 sven@kernel.org, thierry.reding@kernel.org, webgeek1234@gmail.com
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260409131340.168556-7-pshete@nvidia.com>
 <9408f231-7a12-425c-b8de-2990d3162bb3@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <9408f231-7a12-425c-b8de-2990d3162bb3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH3PR12MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e3cc1f-26b2-4fc5-a26a-08de96daac90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|18002099003|921020|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CNYpZSEEP2VFlZUUM6KpemB/wDiaqqJ5TjCfbfc3UGVynEvcGB+ZL3AjupYLrhJmegwfAeV/WCgnAIPBo/InhKOG7lPHpFEbFks2g8ZZ1UdQCozuiGYJ5ogFQ3PIGAYmHdasL7cN7xz09btaLOplKFCNvmPfkSRryvijoitdtHxXfCRZ4cXckAot2oQUKL1G/coWcFYHoiM6f/Zero+rc28cYHQOBhmqSQtR5qI8jowoUPqaDAp6brUGBigd+CFYGvynj52Q9cXHKVNvTifQsrMzR8JZRr/uaKIaBbRjdh6fve/4ELl+95+7YJuuI7DdCpIa5O4wwBJd+PUm+e4jTDHuaOng7wy8sgyQkHk36E2QlVsxFKhEKXwZegBn1Uj+wocXWXFBmxa/l9HhkNt4YRpndC0hAZyViKD+07U7yjm7j4iJTsSyVdMhkcTXfgwlQBJ5DcqUv65DtJV1X1kWBqm00xVRACDI2dsJ9UeyBP9q/w+wK8tp5R2j+nKwI+I4x+4AfQkPrQuoUnmKzJS+6rGgrlwEUoqRv8TGqNRMziug12tLWuwRIWAauHNLie48dv9h0/qYsMrBZ/t8KVJGf6KTjsUcQDmCUmy+xy6Zsl2UXdJ96v1TAxIrgdUg2uVUSRoq227K5q2zhdJ9ZEzVzlm8Ypnx9ITJO+7SwiW6k7GibbKwNjgr7WRZZiP/Rpl1r1paRkl3qr2hFFLXtWBX3aYuV8jlRdvpKZ7rL/CBMuk4GubNFkNuenevOOnK7VXFGRNAKg1fs2P5XcgUNWY/tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(18002099003)(921020)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmJiSWJ1c2xMZVVJRVc3MElpZloyT3RQTlp0VDM2V3FVaUNRYnpFNGdIUmh1?=
 =?utf-8?B?eG9UaXRhTFY5NWFMOThQL3I4R3JrT3I1bHZybWphRkh5MCt1WlY3ZVdxVSt3?=
 =?utf-8?B?Y1N1VXlxQmN1MlZhSmZTUUtOdWJJOGRpbnJJc0RQODJvWlY2QlZYV1FDdlk2?=
 =?utf-8?B?c3VRbTV4eTJUQ2hZY01oQlEySU9OWTcrSThhTlJxNUZUNHZXdVhybDFsKzRu?=
 =?utf-8?B?UFNSSElQZm5KSUh6ek5YbXFoTlBSblkzQ3pOODFvUmhkdWZoT1BrTXl4Wm43?=
 =?utf-8?B?QW5LRWl5OWF0KzVXZ2YrbE80ek50d3V6MGdNN01uOUd5RnVqU2h0cnpVTk9T?=
 =?utf-8?B?YmlKbCtUUHJPZ1VtTXhnVjFOVjh1b3RKczVtTTkwTTdrVUJNWXpkaitHMkRL?=
 =?utf-8?B?S255dWpYdUVPbm1wd0xrdXFRa3BleVEzSHB4TUhTZ29yY3hOOFJzK1psN1NK?=
 =?utf-8?B?bVh0a0paY2ZVV2VtRjF6Z0ZYV2RpMm43S2xZTnR1QzRaZENTNFE5Zm9WUHlu?=
 =?utf-8?B?QmRGSDVKa1ZMRWx0RXFnZ0Ryem9iUXVxYVI2aTJ5L1RKcGF0TE5yeW1FcHc0?=
 =?utf-8?B?MDBLUDNkUXFiYUVNNEFMS2VCNEJ1Q2R2YUoyNUtkRitHejZOVC9IekhEVHdK?=
 =?utf-8?B?a3JaOWlpQkszakJJdkxZc2xlN1lvTjdVZEJWSk5MUG9LaUpyWlZqUVVWNXVY?=
 =?utf-8?B?SmVvc2NyS2NXaHFvU1ZuYkdRSkVScmdhQXc0L2dYZWhPaGZaSDBBS0lpdmUx?=
 =?utf-8?B?RVVTaDFWajEyTXhFbEZJaCtmbDlWaEFDbjdTNG0yMmlLVk1hV1djb2lmaUx4?=
 =?utf-8?B?NnhFS1o3ckNUUlo0YlRSK3ViU0h1YWM0aEJQR20rMWlTVDg0NWZQZ1NEOEg4?=
 =?utf-8?B?VkMxZzBKYmd3MkMwRVN4emlSRGFoTXgzRnB1T0NCNmwrNnlqRVlScnU3eEJ1?=
 =?utf-8?B?WXNrNkZ5dGZqWkJrdVFMalVybGJ5N2QxWkd4Q1locHlaaHVCZFB5TEdVWEJk?=
 =?utf-8?B?UGNnMi80N1VhcEh2MXprOUhIekdiWDZ2MWdJMGE5SmJPNjZOcTlObmY5dXht?=
 =?utf-8?B?aEROYTRIa0d4NjF3eUMzVFNQM1d6UGY3ZWQ3OW50bjZ3VnJ4MzR4dkNTQUdj?=
 =?utf-8?B?bTZpeHUwNE53b2YrcmNrSjEvVU5WTm9HS0NVcTV1ZkdNTlh0UDR5TnMxQ2o1?=
 =?utf-8?B?dlZuT1Z0SWxXQ1VCampJdmRSL0tFR2pwYlJwN1BVNjRJNDVMTm1RYWJyQk12?=
 =?utf-8?B?L1RtQU1XYms0Y0ZjeXYwMFd1RkxvNWNEbE9Jamw3ZEtWbDdPQVpmekc3MXdX?=
 =?utf-8?B?Mm5WMnVJNXhFd3JlRHBxN1dzZmpza3FzK0FiRHJhK0tQWThEa3JUcUZUSjgy?=
 =?utf-8?B?MFR1UnhPYy9TT0t1WWdIWHNoTGxyVEtBWFZqZVRoWW1aOWpMUFNnQngvaXNG?=
 =?utf-8?B?b3Y0bjVtVVV4ZVJSRVpMdFBySFE2NnJCeTJLQXN0c201QlhNYXJzckxHaXBu?=
 =?utf-8?B?THlDN245MVI3UHZGRXhnR3RSNlpFd2t6cTc5YlREQVlCbEp6aG9YTUJweERI?=
 =?utf-8?B?a2htTkVvMjdYV2FYdmhyaUlPTGw0NldDcUpnMHVnVlVzbEhPUkNkVU1JZldL?=
 =?utf-8?B?aDN4cnh4a2c3cnlaTGN4amFiTCtXelphNVJQUmREOTNsQUFoVHVOdTJUVit5?=
 =?utf-8?B?dmFCV2pKK2VyYktnOGdvWDM0ZlczcXNEWXNmdklSVmhka3J5S2hkL29Tc1Vq?=
 =?utf-8?B?YW42MzVuS1M5RzFjd1AyTGRFWk80QS8wQnpEWkZ2dFhNQk1jbmF6N3UvbXlq?=
 =?utf-8?B?Q051UExGTGlBWlhhNUxXbTRCQmhHV3NhcUNscDM1dE1vTzR5akdYUkl1RzJ0?=
 =?utf-8?B?MDBoajJOcExpSjQrdGRwZXB0VGRPbk9VZnJEN09na1R0QmtiQmpyZWxNaE96?=
 =?utf-8?B?MzVBbVVncUJ2MlN0UmZjTERERUFieC84bEdkZXlLcW1yQ3kwS1ZMT2kyaHhw?=
 =?utf-8?B?MHhKUUZXMTJKOGxIdUFHV2Jkb3gxNTFzS2J5VHF2Y3N1R2hEb3Y0QkNZRVEx?=
 =?utf-8?B?QXlzSHJEL2FYeUdzbkdnVG4vOXcxT1MyTEw3dUc1cVhwNitrRHgwQWF2VWdy?=
 =?utf-8?B?ZjR4Tlk1Sy9JU3g5aEcyeUlmNmJYVDhrTm5LaU9tMzIyc3FEYWpTV09GQWJS?=
 =?utf-8?B?Y0FrdzU1eDRuaklSR3hwbk83dFhLdERFSE9sMThvVXNvTW1FRmdmZTRka2or?=
 =?utf-8?B?NnRCUzVZNHUvVG1aUU82d1BtRndlU2tHTlRxRE5US2VPSTgvZlZtdjkxL01a?=
 =?utf-8?B?TTlVSWlXUjlQZDBpaE9zUHpPQzU1bUVQVGpFTmFwT01DZFEwajNOc0YyRlpC?=
 =?utf-8?Q?ARhY6PIsmjdiTtq5+/yeKx8/Gz7EiruLgSPXNJACkrhPY?=
X-MS-Exchange-AntiSpam-MessageData-1: TwV5H9H4LGVDTw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e3cc1f-26b2-4fc5-a26a-08de96daac90
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:25:07.6417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jD8kiOuI2/3Y6J00tTKC3sT/Yv8lFTYcDux4rVNT9+Qv7OlQt5QxKd0d6ZBNX8f/bv+HpOL/ksBZJTfbawZqfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8912
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34988-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,vger.kernel.org,arndb.de,oss.qualcomm.com,linux-m68k.org,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: 10F353D421B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 10/04/2026 07:37, Krzysztof Kozlowski wrote:
> On 09/04/2026 15:13, pshete@nvidia.com wrote:
>> From: Prathamesh Shete <pshete@nvidia.com>
>>
>> Building the Pinctrl driver into the kernel image increases its size.
> 
> That's obvious.
> 
>> These drivers are not required during early boot, build them as a loadable
>> module instead to reduce the kernel image size.
> 
> So you replace built-in into module?
>>
>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>> ---
>>   arch/arm64/configs/defconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index dd1ac01ee29b..f525670d3b84 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -711,6 +711,8 @@ CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
>>   CONFIG_PINCTRL_SM8550_LPASS_LPI=m
>>   CONFIG_PINCTRL_SM8650_LPASS_LPI=m
>>   CONFIG_PINCTRL_SOPHGO_SG2000=y
>> +CONFIG_PINCTRL_TEGRA238=m
>> +CONFIG_PINCTRL_TEGRA264=m
> 
> No, you just added as module. Why do we want them in upstream defconfig?
> 
> Standard question, already asked Nvidia more than once.

Yes :-)

Prathamesh, what we need to do is ...

1. Add a patch to populate the pinctrl DT nodes for Tegra264 device.
2. In this patch, only enable pinctrl for Tegra264 because we are
    lacking an upstream board for Tegra238 for that moment. In the commit
    message we should add a comment to indicate with Tegra264 platform is
    using this.

We can still merge the DT binding-doc changes and driver for Tegra238, 
but no point to enable in the defconfig yet.

Jon

-- 
nvpublic



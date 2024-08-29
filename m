Return-Path: <linux-gpio+bounces-9325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E529E9639BF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 07:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 181BA1C21062
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 05:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6897581F;
	Thu, 29 Aug 2024 05:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Cbw+ing+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2084.outbound.protection.outlook.com [40.92.18.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A36B40870;
	Thu, 29 Aug 2024 05:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908185; cv=fail; b=LolwWRSlt5mlmZblquLHgJXDSMZXALBqZaMPNhvGgmEIXKnULeSI93rBbO0bI1eXust5tt5yJsRNTMzV/E8Uq0f4CvOcTjvvHbGeGejFBG80gGz+j3054rPSY8Qrj3Ua0oPe07ln68KetkVQYHD4Doj73pTim9pQM93h1Cis/fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908185; c=relaxed/simple;
	bh=JshRJMw5RIfftLZj0Y+LRu1hfj9oxghD69Q5xHVXHwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rl4k+8snYkbAAt2JWwk475HYwxYw6KIhIaEBopaTOyxYmma2LIJIURkAbhectP2mGkqmXqePCcTlkbsKKrjKe0/Ux1AnHnRp7X77lDSvcg8TDbuHo3FSBMoSRBIDfY8lN5/omEkYXaiwJIoEdu3T6Qa2M77MOv+tlOj9JSZxovA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Cbw+ing+; arc=fail smtp.client-ip=40.92.18.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0LFTob9Tl/v216/zUEjxvPuO8OBUnWlahBO80gMQ3Rerh6Q4UPTEf6l9D+BCPlFvaVHqeePH8XrkaEQHsyxRZv3xB9Q3Eog/PjgzjbAdGRQngYsMaQLEuxgqwKOpary24TNY6r97IdYv8UpOQFH6WBW4wDAy/L99bT5XrnxMVCuALFTJTa6tLNOjZfqAppHGlKMuhWzocpD81WywfUivyIbAh8tH9W4iAQYl0+Myw2tNBEg4VuWPPmcAJ4TOPCcOZ28jc3m5YqAztEq4d0t+u7vaJ+tQmMR8gXcOSl8qM6FoSW9rQyNClcBqMKiZpSuJpDlswIsRNZqwUbuEBKkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVmT5CMMYq9LdP3EkPBBN2ZqNm+zKy81PF+L2axmtGw=;
 b=lwvCWqkSJj4GDjHrssS75c/XhA6AtDrQX3gOQb7s6E6Eo9hqZUAIekb8Xw8HQIH6N4EaJTF7dwJiQttNvpnBA7cHQxYIwzpLTfHXhPsIxVxbv893Hw4hAc4KO/yM22VRwlCvMB+IdsXegPPTvJPNStGrVYNBeYtepeOm77ZP3gipLUg+ZJs4Oo9zUwJYEq1k/nA++O8uHAvX57p5k9infIWjKScKuSTC/l7ixI9WpGNv3dVFYnSZtajuIKbbmxSROFPAW7qYzQGzreH1Uil5yRBwM3UnTaXFny31MwMJ+y7KSFxPKC9UJU/b2NpqAbN8TmRXHgAE2EF98XJDr6L2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVmT5CMMYq9LdP3EkPBBN2ZqNm+zKy81PF+L2axmtGw=;
 b=Cbw+ing+IuEdyt0ri+vDKh9rejSsA/bPGCWvsQlcTrxHtZb9TfVVhAvVIsMpAPyciniB7vnooC9uqMAad5lOfj1D+tsRHB62B2a7iHUUugyT+8DrgezLY8qNORVhWc5SS83Km1hWaq9vncyh+yyHwZ7ZfaFIBAy+IhfiV62Blq+Yc9mfiqVjtx9Fn6BboYiiIeC32V8aEWY98AO2ojHigzTJVIaDxuc/j+sni3Rh/HMEUg/Mv6OyL+9GRMNUBO4v8WobCzaUgz+mHhxR4A2VlfUIsc/p0TkoU1fkyAlVi658qireroFqpuHk7YnKuaibOZ0RQa9taadK9lYzeWzZ4w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB5105.namprd20.prod.outlook.com (2603:10b6:303:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 05:09:41 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 05:09:41 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/7] riscv: sophgo: Add pinctrl support for CV1800 series SoC
Date: Thu, 29 Aug 2024 13:08:41 +0800
Message-ID:
 <IA1PR20MB4953281633974BE4AB4887F5BB962@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TMN: [IT9AbJ8TNaKIyzrpvWlfPsXJDZEWp/n29LcozQBzIgw=]
X-ClientProxiedBy: TYCPR01CA0021.jpnprd01.prod.outlook.com (2603:1096:405::33)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <172490809691.606212.17146855872593490329.b4-ty@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3bdf6a-d6b9-4e94-164a-08dcc7e8c968
X-MS-Exchange-SLBlob-MailProps:
	7J/vb0KDx3jIGjTVij+H+31XKAuPWx7Gsw+JgTmeTHrySBmQtvsGenU2hMnP0j1KyDw089V+UQ95JHqJtbDXcgEbhgYxVfTdXXecfr935JWbe9WcR+wsz/pt/8vpEmf6+JUc5irl+Ku/rnqPxkLo6by6F7rwxyQOu9LsPW/wafHE3hQ3rbfQ0laSyeSJoJhR7bmIRD05+b7uU9tD53Et8xtrLH1GKi/kNdginOZVKWeNK5YzEvvykiEixKEYfcUzV6EKu2xIuDZnQAqJKFch1g2LZDEa8kKXFgUIAZ8vGmPpTc9J3zdOCd+syQc7X6KRpro9FIvlkF2vx5q9Y2KkXnQpTUL7Zt91+v82x5AGuR/ZL4b+mcc3NRMdqzXookrIaTVkrKM4TdLF1TI04voS+aBlA7a77yUR0Pz8QAlyTBsRImxc+qky1sxqHJhNnLS8Qmr2QfNLXoRSTEzxexTQxJWBtPwphnMjcQRFn1U2/wFjfC5U49Gw7/8FgA2rb+5+M+J4MukFE+SCWYv/AeqZY+YkUbDUjCpPhfseALix/pRtf+rN+viDbXFZ+lhBhuehxhRuoOjVU44q3iQ2P/bk9pm1u1eojVDylkYqTKdJc6fGuhTm2XZbI7JaJTpGRC/Zn6xwDckoLc51jtcA2ufQI9wSzwdlBiO22VqcV/3ZgJ9vhh8rz6E2CnisssdPTH8JkOXLD70qh1BGRJM+roTs+osB0LEx+RQ/GlGinykmXnF5rZRHmFprSS1omZn4RrV2VgiMKNgsU8ShhHaVQjGYYenpbztmA8rEeDJUN4iNewQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|6090799003|5072599009|19110799003|8060799006|461199028|1602099012|3412199025|440099028|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info:
	nPV1MtS8RGncpZDzSkQ3C21Nfmd9zMedD/sxiEePt0NwjvH+JsVDIThC403e0a1BjVj0PXsVQ1eSG/9+fbKlvll6qIVuwtxsbDh5clETg/grz8zx2Znd0M+jRYjR7pRmRCHVxCmtaWUdSNXfL4T9eMuV8h35d9ZoGKWTrIEXC9sl5XMx8ZBq9IBw1gbfn+H0VxQ9SmTTmH0i6LY+qrFSZsqfWs5xX70KnkId/WZkdo+Uh2S9iOGq4epOos1Qd256cf6p3Wlb87fxqf+bkhK/OffYK4NHV5seAzllSacsxu1RibOaOLZHehig5HcrBobzzpifRat/94UCsvJF5JBxXNwYQ7n/aDq19iIH6/nbvKM2YEEbsrBk4fTbGlVeZKN7u+vTNDzWhgSWangbKdn4Bwg8SyTnDdc55H8ZyLEJeTDuBU53YCV4Tib9S6RVtIBEhu2bZRQI+pLO5aapopg9qYG977ubhEjpGmDSTDj4CXRwbherBalmlx4YQppwL//Xr3yw7ikYsPIbWuc3qNMtS8lTBnqIBPHex7IGKNtqKpY0cl4YXHuu46WnvxPe6M6aWEfzvPVkM9DeavuBV4ORrhlXzNCZ6uoCfzGX2iB4HNkYeGrJFLOn9xMpEIaz15OyjVy4g4LRtts4f/n+6NS/q9bglsPc2/zuw6Lt1j9+3ZoNpvPI2AYg0CJXdfWd159aKQwmV69mSiyHcEChZH+pajuUHlQahNcHAEJGzmJpCp4ODi7bEk3/yi2Pt3FYfzyVcaQl0Ak06RX9uLzW9ixPyU6eLqELvQKYCweXm0GYTNT0UzSGGR/I/3SafdiOJhhwlANdFuKR7g26z/hBn29YWKnFMeEKYpDEbjtIlogXgST0cBumPZRHRqikCaDnpbu0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1c3SkdLa2pVS2E5clczUC9HNzRmNzd0b0x2RkpLaGNWOWYvRmRJQVcyUllZ?=
 =?utf-8?B?RDJPN1F6aXM0YVgwVmlkczd2cUl3MjJrZ3hMS2l6ejQwY3pnVGM0dktxRkxH?=
 =?utf-8?B?N1hOdm1PS2thM0cxM3dOcFFvcmlHOW9hVzlJQ214VlRPTHgxTmt4QVlSaHpZ?=
 =?utf-8?B?WWthbVdHQ001VnM5ek4xOUlpejNSUCt2L2lzZjhLUzNYTXFHZENGY3J6TFZx?=
 =?utf-8?B?MmVSUHVwQnFDemVydEdVLzAwOXlISkxwRXdkcHlzc0dCM3A0Y1ZuNkpqdWlD?=
 =?utf-8?B?NlhsMktEWE03ejlLNlVZUW90aUFpWEVoRkoxckxYNEtna2pLWXlaV2NRMlVu?=
 =?utf-8?B?MDdNbFVDc0phSmtIZ2l3bWszYm4yZ2p0Z2Z1dGF4QTV0TjhkR0dRY3BNNktK?=
 =?utf-8?B?UUlCRVljNWtIU0s0eEVYRW1CaTlYWkVMbDBXQ01zdmJKemNueDJ1eWllSTJl?=
 =?utf-8?B?Z3BKcXZVK0ZuSUFMczBMbU0ya3JLR09keWdBT0VRZHB4cUJUZFl1L3NaZkRq?=
 =?utf-8?B?OUVlNUxTWnc0WHZ4TXNwcis2d1diRGJ6Q3FxeFYvY2c4Yk9TbEh3V3FJb0M0?=
 =?utf-8?B?STdmZnhsYVh0TUxrZEY0WDlwbldKVFRNdGRqMStYUkU4cWVSc2F6ZVhFaGdN?=
 =?utf-8?B?RUt4UFpSN09ma1NMSEtiak03U3ZzVTdrY29wRG5UdDJxa01VL0dWV09handW?=
 =?utf-8?B?UVpEREFTZ2lYaW9tcUoyeVdNYjBmbG1uWFNUZVc3akllRG9qWWoveXJNM3pX?=
 =?utf-8?B?dFlSZXcwM2xqVkREQ3RsS1BIcDlhTUpIN3h0dHJEczRhU0xwMEtvTXFFRTRW?=
 =?utf-8?B?YTF2b2h5SVNKYzd4VmpMK3o0eUxqZmRiOEpsTFZYRWlNVmdTTzFpWk55L2FD?=
 =?utf-8?B?TG9Icng3NGZ5MW1FcWtiQnF5OW5xMGF6QjB4UGl4bENYOG00TnJGNUtZWHFw?=
 =?utf-8?B?a3pGdWl2cG4rczRXVGt0TnhFUHUvNkdORHgyNklFSFJuSWRrVk5YUENYaTB1?=
 =?utf-8?B?MHJGS0dUNGZGVkIwS2ZobFltMEZ3RHVkT0pSZlhCUkZMN1YvZEZXRHlRMzBC?=
 =?utf-8?B?QVFaOEhscXphWVBtKzA5SWF3bXIxWGJPTEI3RmFrMGlPNDBITWplRDZudVVp?=
 =?utf-8?B?NU8rTGZuTEZzUnU5SlV5dm1XS2d6TlpUdDBvbWlFQjNUejNCQWFDWUU0cjdw?=
 =?utf-8?B?bTl6SGkwaC9NV0ZHRU84d1ZnMnRnbkMzMjJXcTRtQStqaFVRZEVLb0lpenRV?=
 =?utf-8?B?UU13UFp1TW95U2xaeVVqOVFYNEN1cnJ2S1BHYzhCVjBuN0pwT1VvZlJxVnBY?=
 =?utf-8?B?QnFreEpVOUhMVkZDblNjL0R4a3dqc2syODRVdHoyc01MbmNBSDlDSm16d09s?=
 =?utf-8?B?aWllN2ZwVE5jMWZaL3FLR2k2RVhkVXJidyt3eHkzMGc2VkZHcEJjWHRjMkI3?=
 =?utf-8?B?c0djN3EzUVBiUzVDR21rZFphb1RaZ1l4cWtnK1ltNTBhWitWb3NYWlBycUcr?=
 =?utf-8?B?dk1NTjRKK3piS2NnM3NSS2ROcUVLYnlqck1SVG1ISndnZEN3T0gvbnZrUTkv?=
 =?utf-8?B?dUR1QTIrbVVLU2FMb3VQNG1lWlY5U3dpOEVwUHhlc2NWS0duVUIxelVOUllJ?=
 =?utf-8?B?Z2YvSWg4ZE9VUVNCeXdsei9NalZqY1oxcXF5NzVoRFNoVERIekVCKzhvQVV3?=
 =?utf-8?Q?4YJYWoDXBk/gpt+wyoxW?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3bdf6a-d6b9-4e94-164a-08dcc7e8c968
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:09:40.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB5105

On Fri, 2 Aug 2024 08:33:58 +0800, Inochi Amaoto wrote:
> Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> This patch series aims to replace the previous patch from Jisheng [1].
> Since the pinctrl of cv1800 has nested mux and its pin definination
> is discrete, it is not suitable to use "pinctrl-single" to cover the
> pinctrl device.
> 
> This patch require another patch [2] that provides standard attribute
> "input-schmitt-microvolt"
> 
> [...]

Applied to for-next, thanks!

[6/7] riscv: dts: sophgo: cv1800b: add pinctrl support
      https://github.com/sophgo/linux/commit/1728c7e408c6e5ef1c6f3a2c7f75bd20139c2e13
[7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
      https://github.com/sophgo/linux/commit/2926c05f9cb7b5bb0374fb7a53bffd65937a454f

Thanks,
Inochi



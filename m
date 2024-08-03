Return-Path: <linux-gpio+bounces-8557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E3946B74
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2024 01:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B45242822EB
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2024 23:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551FF768EC;
	Sat,  3 Aug 2024 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tbYP16nh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2019.outbound.protection.outlook.com [40.92.18.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C041D6A8;
	Sat,  3 Aug 2024 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722727153; cv=fail; b=WyLCPD9DAzJvSyZ/0tkGvOfKDG0wr5vo75H91NsyWM/VNnFz3AJNbMd1JhVh3JNz0urWQ3W9OvF3YAhp7PFsgHDyIMYaYZNtbyZIckYOJ2qyMXTeq/O0CARNlHvK4SzeRZKmZ3YR0t942oeXBdjNbwMUWe1I/M1mxDivnaW6TKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722727153; c=relaxed/simple;
	bh=aNPvP61wgSzp1fkEfX/Gcckuei5VEBd2RjcwdkACcb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mc1b6ekITa057YrHBs37PIozAhdIE5HzPAS97JGRCWb2faMUEBuQ6atGhgoB/YEval6lLJuxANI0fUVd9ZqLvTKxBRMRT+2E/bUKKDSwjbscSpEDFM4YEOjs7HNEzrB241bEbliPXcl6eKmzKisePhyKIHgnGopZgMxdemZPjYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tbYP16nh; arc=fail smtp.client-ip=40.92.18.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUJZhkMCMcjN27nAWDFoNthFQTqPwTXw29B++GtG4/jj9vKJWZ2NpkgBid+A7Y9PBrYDLFN/57GfPPSxUylhqQhNWl9eiY3f+0HMO6XhI6ezcBFgX6mDySOxdSBybjaY/py641kYfiavCDOmajCvFzMViop9eF9vQGej9AhX87Y2Yx4LsSbm6/3oVnpMlBwSlJwaViR2MVbkIuLA69BcS8q61Wajx8liJJrsoHlgkAqZ5ALho9X2FCWQO4HPaN3IQVM32qamg6parJtuUsB/WdLfU65uMnEVpLRsgxcOhi0dWh2z0pg3LXx0BilGeIx0FWx7zgn+qzxD2ZCKlz1u+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/ZTL9qGBq2hkPg4Q0yE58oAqmEREg1jyXVQWxlDWZQ=;
 b=ReEkZrjAkkmpJbn/wMb51VBd2dBrhkWZW1kckk70+PxqRyHOMVul339bCdy9YrwBDaq8Z6vUSaO2dX2PlmaDP3cH1urUI5BF+6BhJVJqucR3hE1+DDWwu6jMFLXB//M/W8emVVVZOMBBgsbzf5oY5nItd5HKoV6v3YwEk+Uop21sgQpNcYc5oF5CTyhRy9bskZfa73Q25kPfZYd4S/gF6IYZ/hIiuCnxFnzLMDHUF4EkuKlvdm2noD2gafWNf45LUvBia7cGH++O0l/vZIaTppyw5ARcZteW8mIhjsjoxX6A1EFQ3lmINglRFOEgIWEkUWEglQxa3lmCj1pMlRiGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/ZTL9qGBq2hkPg4Q0yE58oAqmEREg1jyXVQWxlDWZQ=;
 b=tbYP16nhsOKkQimkpiQbDOQjpwLEy8odBTYhL8tzIO2fTnGnM+crVIPzpV1uDwSGgWdSjWPUMfjMVeOwovrpznhQUrXaxMEQkT4MMix0er0qpwricbRWabER1DuNP+Yza4j8vaG6FhiRlFAzywD3DLDIWHda09ob/GfUfRwRybQYmpfOTHMJhFicyWAI769US+ANIgNM2UaVvjJs1fMf9/fqVGrsfNLhIMimy+QTL0qUlKaI6H6VbPgpfQhC+iSckcql/zaIsPzjbVcZGMU+ZEIWMkOuT8++l3lywaWSgIpR3NgOO8YrT3+y+LFVbZManvyPLMUEQ9OQJvawN+lEQg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB6699.namprd20.prod.outlook.com (2603:10b6:8:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Sat, 3 Aug
 2024 23:19:08 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Sat, 3 Aug 2024
 23:19:08 +0000
Date: Sun, 4 Aug 2024 07:18:32 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, 
	Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID:
 <IA1PR20MB4953A242076934D526FBC1FFBBBC2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [Fr/gV5J2/rxGJdkpYozDIAd0cMapNIFr2r3naUDVLyA=]
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <nph22yabqkstah4gyq7s24mmiguvz3yrv3baqi7lei4h457q4x@woralihqva6m>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fc6db4-a89e-463c-4a65-08dcb412ac38
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	uBOS3XrzLQnVAzNvNfwPFoMhFLPN4FqRzElF72QX3uIeKLx/VhmLciUSufmoWlU8R79koYNEO/MRdTvl7azK9m8QjKiRo469HQ5m+l9YUAaIqxLEt58JpqAIcIWBXaGIAoBjMRmWFBOiar8ymTcPi2kfUi5OwmVCstYm1azgIkp6oKscU0E1ItqOKds++DR82Sj3sAKnF3Ixch6bkEW5JYtAFSzIh/YBqeN56Q1UnIN+7LrVnCyJdMgYmj/Uianq/zBkyjV9J560owRLuv9mhyKP0SZ6K/9QGUbzPQiXseThGM/ygnC8fTzWRIPoKZIjBWRG0d43nzESWa3apGPKKpNXhREBHnUjCbdtP93ebp2Drhyz/bEVKOYyC/8CdN5SyD0Y7/ThtNbD1saiy36hIKCm099NGboSV8KZQ0jpqaJkROkO4SW3d7tSBggg9uTioglyvU+DtNHV3GqYWpFJaNF4xznxQAaXaps7uHs6ujCF4Idt9BAJmmWdVD87qL0ATA3TUIliv5uQ3HV+4IJw9+3iqz4uH6NKP6tnOneDgjXSCut8kV4tzahp/3Texa/U4tWORrqzHokkTceLBbIQSeeWLeHtEQvf90L1MaFmFl9EeuKZwAOQc6V7Gq+HLLF7dKVnkY9WbIlK0UdTtysf0yYe4k9Z0IdiaFZsapud/eZA2FPy3WCPtre6xjO1G8r6mQmJllC00jYOUCqy6AtWTA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a+Dsh0Yfz4gubyiCXlIqMHZ0Ehe9ruqk5czXmrEDMuhsEKR+Us/BZT7X+bwS?=
 =?us-ascii?Q?0TQwqh4+dwAiAyUyqXGimFgy0AoMk8WTmBb2Pgo4eklv/WhTYu0brcx6A2MB?=
 =?us-ascii?Q?8uzFMeHiXT15YB3mXp8GI7NX/H+FKAwzdot2q+ALshNOa46o7br9hyxwM9gk?=
 =?us-ascii?Q?tIrNvG2x3oj/MxIMliloGlFqGSnFn+xJogrWLIFaEFDhekyGUA38ykGOxG+X?=
 =?us-ascii?Q?P1kcjgGUpThLBij/9QsDx29BRSpW6rep7MpHCfi6VUZBcujfaK1yXFP3UYhq?=
 =?us-ascii?Q?3kPn8YmGZrpN4KdH1fEvut6d0lhRNKvFVjUaGKwuaY6NPDqXPtoxQxvxlLKI?=
 =?us-ascii?Q?xU4U0eD82NtIAOZyP62/LU+WqY2jKCT5vpy+2SuHrx9bTfPM/tx7GE9oVf+D?=
 =?us-ascii?Q?NcQ3V8TfOkViWmJx8oOIofeFcn/rD/yN9mU2T8IogtsuzkCVTyfFI9nFcjVl?=
 =?us-ascii?Q?FTUOvrGdFub3D6k2HuqdrU9GnnX1NHZ+y1OkXJ4C608hS82JdEJtDvMRY3Nb?=
 =?us-ascii?Q?/Q6/e974blxifJ2QhhsFJOoJN+YF5QqRN9nASzOE3wCqKZZHEm3/3bp82Bfq?=
 =?us-ascii?Q?HpkfsTzSYTSREq85uTGerzkYI1IIsLytwYAzQpwJhs5lJDpt+Tu2PKyMxzjD?=
 =?us-ascii?Q?w1X957JSaOweHLotO/XOsyjhrhFcrafd53dUg7Jbi9CjMkN7rdxMBnuB328W?=
 =?us-ascii?Q?tsxFy2lkr0jNn7Y4VixDU3+IqHM8Fkf9r/6Yx21LkxICxq9gtzd/I4BVBwLH?=
 =?us-ascii?Q?NSCmAT63orukTDfHHmdpVOHfPNTMa4JikjlLhiPl6TstSs2R4xgssDjuRB2m?=
 =?us-ascii?Q?nf3bSTQdJoxekdSUfWos/DQgUuRpMKJkZvAuO6L7+3EYTMxr/WV9CroiogaE?=
 =?us-ascii?Q?SRnnraeI9TTLT+Hk+gJYCqgA2zUzI023w9Aud8Nrq/W6dnHtFn+AarZaGHk7?=
 =?us-ascii?Q?dZ0gwJLs4eBc8PIHHNQ+3uAm86Sv3E/uwy56nI/qHV3CEgVdxEbU9lC/baXI?=
 =?us-ascii?Q?0UkkiNbobLe53BezkrIeUP6AZUxVFp9JcAMWBxhzIeDChTA+VBTiZ6CIvWoH?=
 =?us-ascii?Q?kpw6f9MDjFycxV38QznhajrPRqdM4FbXwCCGAazWxRbMHSqkFoHLjpqwAB4B?=
 =?us-ascii?Q?Jmo26klzOzOLjBdX6alL+ewGG9qTBkeG8NxtjeUA2pjZQDmsoO6nziLHVGjh?=
 =?us-ascii?Q?K2X3qGabvSK9Ivc4CYqUOYgRlnoQ36aaSBy0GpAzBiS6rsPZAJun5+Bj34mK?=
 =?us-ascii?Q?4gp5CCKu18Fs4b7UQGMM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fc6db4-a89e-463c-4a65-08dcb412ac38
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2024 23:19:07.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB6699

On Fri, Aug 02, 2024 at 08:35:16AM GMT, Inochi Amaoto wrote:
> Add pinctrl support for Sophgo CV1800 series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 122 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
>  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
>  6 files changed, 537 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> 

Hi Rob,

I have added a new ref to the "-pin" node in additional to your fix.
Could yo review this patch again? Thanks in advance.

Regards,
Inochi


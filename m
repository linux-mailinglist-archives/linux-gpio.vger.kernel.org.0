Return-Path: <linux-gpio+bounces-9935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23F9736E5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 14:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC3D8B214F1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 12:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A357190492;
	Tue, 10 Sep 2024 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CgL/RK81"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04olkn2085.outbound.protection.outlook.com [40.92.46.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5F18E77B;
	Tue, 10 Sep 2024 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.46.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725970305; cv=fail; b=U1lDc7+USNNBoz3bchlWUYFrmvHSBssGcDe7WkPrJ28TrJmYZ27EYk7AESXQjKbbWRvgyprugreac/qbcLpfr9pgR3bNHG7F0InlLW/NNVEmDSpLGmKf1jdu/Zt5HBkvAVWgxQlz3m2r+j2we/bkGwsYOJmcYnRoVw9U19mE+yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725970305; c=relaxed/simple;
	bh=7cWVnz7RWB6+ZzU5CnLuLGvI8TwL1DBFmPRKev+9xL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bhaUosXVx5xp/2V7djbdI03jRrt4zbnGvSQu0jgIRurOb4yShY/RZQ8siT+uGfrCBbY2vnVeR3XrCfJONL+VN1oZETptjfSLfuYYP3/1xQ5rTl99I4+NTJPHEbqCQQg+RmP+eA90P5Wi/EVnWoGz9AhtNBzInLQQhAdhKNv98aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CgL/RK81; arc=fail smtp.client-ip=40.92.46.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utEFZNwtlHcPTOc0Z+UWTWEysGhu/3R1o4ukKElHNm9+5MRAkSpXjGc0jO1GvnfrA4kgTXgY9mkI66lZ/u9OOqTzTkEeWeWlnKwu4hbkekTiANvo6l2YH4Om2ZGMIyQmxBWVG23NqBLkHNPME42pm/owqq5uOh0inSJ5HSwXm82xhGWeOYMctR2CouCojgMpi3KWsEPfUPe5PFPIqLlpTairgbcWF+eJBz95m7N1P4kC1Quukm5HuzPH4JsvVdh/7Cogf3un5HHt3PhHtq2MqaV7RvQ63VvnLSXOUV1//AlKhZWLmlxAnH3qmW+1TEAF+d73uO3EycPdZ0FoEU/Zuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gub6+QpuKKCvDS56vpFaPILriiWGWd+1y5sDu+JkAI=;
 b=XWD7LGoLRC5I9smMU63XZHMdFunkY0AcZuvKeGT1xSKWto7QCvRki6IVlRjLownOjoNJPNaqg7+OyxEumUZYetFDHyXAKTRmHsiioDtuZxJPCjkPhZnZK3ux2yI5cE+abnqlwk6UN/xAKmqve03CXzE9X0fYfkPWMwHZMLhYdTf/SVFGGAN62OqUEBc2ukL0jq2mRv2Z+ajjYBU5HFyxcaDlRV3UNB5x66ceq1PBc2dCz7AGbcrvXaYKdUA4pFgf44clJ3X6jdgcP4qlaiN2oN/IZLgd6gHUO6KHe+U0LNujiKPLmhqlqEmq+qHDfrQBKyTpZYxOcDNby1VT151/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gub6+QpuKKCvDS56vpFaPILriiWGWd+1y5sDu+JkAI=;
 b=CgL/RK81F2kR6QxiBx0D5SAy3XMb8qvJVOgAucKvALZnaslDlSYi8j3FCjVjF/qf6uGDkktxk66kk+FOJXgG4a4b4DAqQfMl65++708BHh8JP6hJG8Utez/aCufjOKckuHwScLh+QpIctbq6OHQfTe6Ra5VY5RBD09Uub3sEySLZn+t1YdLTuzkz3zpOmiAbO2wZi9n10Rj7jv48XIFTxPyMDOO5nDM6OlZHWiQRf9AQVzm07LKU+0vX2vyrIEHpc5CZIRfidH2Smk3OuSYlOWLmXBfOVhDhxC/qrz7cCFvU48PPIcCi0NchU/2Pz84JMGhmzhgh1cVhkQbZIuQkeQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV3PR20MB6956.namprd20.prod.outlook.com (2603:10b6:408:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 10 Sep
 2024 12:11:41 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 12:11:41 +0000
Date: Tue, 10 Sep 2024 20:10:19 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/7] riscv: sophgo: Add pinctrl support for
 CV1800 series SoC
Message-ID:
 <IA1PR20MB49539E3E2083EEB820B781BABB9A2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953281633974BE4AB4887F5BB962@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953281633974BE4AB4887F5BB962@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [NOhOw1qPnFIy7tzsDIkZ3Mrrn3nbHne2eaX39u8flEk=]
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <s5clhds37zyezagn6ibe5skp2mi6cfunzzl3bm7jnrshn4w5qa@35k7v6vzf4fe>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV3PR20MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a806736-f012-4b3f-6d07-08dcd191ba5e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|8060799006|19110799003|461199028|5072599009|6090799003|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	ambYZWGO0HT5sNVpJba7znExMGUppJVXU8SltEFyTl9427ibh4jvJi1K8NlMe6OkYZ1F7Pn6qyMggEKhgUGibhZTMIxolJAIG2Jp5ASyxoDAcF5vdoa19xmJ2lDL4brl1NAuRYru14P94KafGs+xZy+qgUyA6X3Lcj2BpdQcYfzO+QyLGeqE80FT/sogloTH1Fg5Ckb2ZxB1Yd7MpC+Y7c2nsxJxO7Ew0AtyNfpMpA7EmJ0fwcMlAb/EcarwmGaQsLJ5DYYsVaNCKK+D7IF5l4kJoykKBwiDt0CPaqQo3Jy4pkwEW7f8Cx20CmeUjmF8tc99lpatgMKVYJuJRGQUDOOvfv59VStniSwLQEu4WldoiRGN7L4p85YdZF23i9Pr7q8fBSPmrfLuO8Yd37VKf6a/xb+qhi7tt/aTsHG9AJ2KguPdbZfgxMny9wGe8WJ2DTZF3nkLfHMouEbZUyHbJ1DqjYcv9Eat/w07esnh+u8P+0o5fowDboQdaZyp1jqxL/iwBp98xS0tLVxdNUOKIYOuzPITDUT1OviMgU+WHT/MVCa1pX7P8rNXE2hxGYg6R3LUfV7ldWDZsLRvmLCD0hEY+QY+Fb7tgC1VPgYHyHFbS07D/2lEs/W3Gef9U1IbwtFRQ3TMBacl+dSYX0tyu+BrB2S9EWueYq2dgocfkqPZN7Kaf1WuxiKgkzPkp7N6g6Y6QwXaFRCkTFNiKgWBeZ7OQfu32s5pZHu3cCrpqWSqA2V2b+a6clG7526TYBFWftLQt8juyOfiPe1D/rnXC5GHcUyHzuVdyivRGhgUVzo/+Xl8HJbkKQdYknlUUG4Z2hehjw6QwqANchl/gTPUq5TDiuV70FwrX4AC5C7w9ixkHCcvzfIR3NxAg1jtSUWd
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zRlQ857JG4rQ3h/m3DeEnKNTbi2YPseglPfzThrhf3Vh/PPLcvGGflVol2Qj?=
 =?us-ascii?Q?Wp3af2UM5z44dHDRHI8uYpkJ6bf0g5uShLWEZwZQn9Tx6CRHZnZ5Z9piiWhF?=
 =?us-ascii?Q?ILpqE4+jeJ5WZ8/YgQnKXHHo756dqQcrGYKZuhbeB4ypwvL7dp2QruRspExJ?=
 =?us-ascii?Q?mSCJpG+gT6YVpbtiMreRT2wIQShgAyiSPuL0k4MgU7jBQGYefOnztC4VY5or?=
 =?us-ascii?Q?R8HHTkEWyuJB1Rd/35DxlCF0rkKJwJMISnKte8iGD8dfEpwwR+Q1XxZxlZ79?=
 =?us-ascii?Q?N4wQhMyOk1st7k7HRLis919ZYSDE/DvVpHeLYuQB0jCpMEF4czd4KMhi7FDi?=
 =?us-ascii?Q?ymb8vKnQ/VqRsg9loR/5XRjPjwsty5HJ0X2LBCxiJVgHRtURBkVPJiVnPIZU?=
 =?us-ascii?Q?HzzCg5hzuRHw/4o7rlF/Md54Xk1iaR8PWeJVdJUn5nirSVJem4tEHysxUdh8?=
 =?us-ascii?Q?Y+OQPSZUjjGFg9sgjHPqcIndSjnkP5cwECvKmqCb2n99YL4fvVUJbg3v3NcM?=
 =?us-ascii?Q?1n81TefjbLGrJbVLA62gJcq+QT6nAVwPW0WDwDlQTFK7S+lKnQD/aEMQ69jT?=
 =?us-ascii?Q?HCfLzOXfALstbaIqZclMFycDDmd+s1hPG+Sf1mRFn1L1jRXlI6vYb+Y/rd8E?=
 =?us-ascii?Q?y3c65gNitPs+eGNP4YuLPgVxKN0R/qa7AesQarO0NxrCuTupwGsa8BXJ07Sg?=
 =?us-ascii?Q?b+GbTxKyIrZ8Rl9Zak9nwcEZPT2+iOQFOwrXXgqsx8UvoUoVgrgqMb/3bk0F?=
 =?us-ascii?Q?jhmtSUuF9fQk3gxiT8fiwWYF1FOkYJOHr4nZu9XAX9SoFss5G3kT4BXZrrKr?=
 =?us-ascii?Q?2fCUNTsdj5kiNNkISQo7OtFSdrd59AI0ALxrbEnH/cBpCcDchZ+xH6RfKYXq?=
 =?us-ascii?Q?1Bk1zzrFa/a20N46wTTng3kNUJEkcz2NfhV43bqRDVL1OavdSrRFkJJwmtSW?=
 =?us-ascii?Q?iQEI56/3xEPFmThvcH7KlzvfuJ7SCsbDPKMIuMBbhU1bACQSmUw6i3CWNDgD?=
 =?us-ascii?Q?DHGFwDQbfm1GQbD9AJqK2kuNZ1wFtNnJ89Z0c9ZJJMd+XW2MBkskoi/nQGi9?=
 =?us-ascii?Q?OQj37vx/UZTdbB2bSqlVDhkhE8m1LkVCjGem57EGcwWnzF3atjA8dzf+i0cy?=
 =?us-ascii?Q?6I8/QKoI+8woXBmlscd+9FDts75H+GBsNTeK4NLTq2y+TBI1qk4pqQyKbUtW?=
 =?us-ascii?Q?p3cNSTCgNRmdya1dnweRygqiaJWy+AStT4keuxkmo3GtuFqLwQgkxn7wsXM5?=
 =?us-ascii?Q?HpByGvgu4t53H4Z4/X51?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a806736-f012-4b3f-6d07-08dcd191ba5e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 12:11:40.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR20MB6956

On Thu, Aug 29, 2024 at 01:08:41PM GMT, Inochi Amaoto wrote:
> On Fri, 2 Aug 2024 08:33:58 +0800, Inochi Amaoto wrote:
> > Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> > This patch series aims to replace the previous patch from Jisheng [1].
> > Since the pinctrl of cv1800 has nested mux and its pin definination
> > is discrete, it is not suitable to use "pinctrl-single" to cover the
> > pinctrl device.
> > 
> > This patch require another patch [2] that provides standard attribute
> > "input-schmitt-microvolt"
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [6/7] riscv: dts: sophgo: cv1800b: add pinctrl support
>       https://github.com/sophgo/linux/commit/1728c7e408c6e5ef1c6f3a2c7f75bd20139c2e13
> [7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
>       https://github.com/sophgo/linux/commit/2926c05f9cb7b5bb0374fb7a53bffd65937a454f
> 
> Thanks,
> Inochi
> 

Drop the apply and favor the v6 version:
https://lore.kernel.org/all/IA1PR20MB495301A1A08224486DD0239BBB9A2@IA1PR20MB4953.namprd20.prod.outlook.com/T/#m4acc4e2a9652cb3f5a3ce54deaff52a827b80649

Regards,
Inochi


Return-Path: <linux-gpio+bounces-8556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF81946B70
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2024 01:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA67FB21707
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2024 23:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A071B57C8E;
	Sat,  3 Aug 2024 23:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YIjaAqj9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2036.outbound.protection.outlook.com [40.92.19.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD11D6A8;
	Sat,  3 Aug 2024 23:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.19.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722727007; cv=fail; b=YnVqC+p21aabXKn/nhePgAfYSsYCP/vHm6y8aGvdYhAMToM5iMpWnLam2+BsXXlbf7hqM79hrvkN5WfVaGCpBqjBUZ4KtPOcajbWKy+HLKti/1itJlTv2PcoIH6E2rAnRLmE/E6ktWTqVyh/HfbbOrhz0a8wj9+5SR0PUR839BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722727007; c=relaxed/simple;
	bh=QfRnHyBKpUWNE4hX0U7iB2crtpzC3DY1X/p0C8Nipdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bJzP5oNeaqMINrs7lvdngmrtkneR19TrsHKoxNZdeSDqUS34NtcVVVvNptvytx8tNhq8W86Pz8rCbmYgDVc1ohqrZ2n3Ufjqc0wq+uzAOkcs2/bXEPfBajqyh9UYNBb+OXaIFpc3hCjjM+0Z/Nomctrp/oEmVCJgNr4uaohx2Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YIjaAqj9; arc=fail smtp.client-ip=40.92.19.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukk4uSHsyXortRu1PM+iue6vTvBbSkrR+7d0AF2K7MWxu54xQLghTQiMK89Nz7FlvVpPemFXr5JhC0PNIdcHGA7VoGK5ydrHWRcGFcvz2S9252o2HFdYkHOYz3i2RT/UansVCBpOJCfc9I9VIEgWrOOsAik8MvUe7mjL2RfidOuz8GcV4KxMtlTKFA/ub16zqn+pTZhz4zZUO6W/XQp2dtsZ0OkVU9AaRUDj9wqC4aw5PaAm2jCODu54kc47D9JYkMT7L3yiLKpUHFGntsgnV2r+RnBf0P1ZQ/UZq1Z7gnlxV71h1h1U4ltiEqLcRLvHsA0i+mOTsqFtbHgKrta9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wQ686UaWc9KpYyJI1adMQC+GqS4VAxGRMVR6WViuEU=;
 b=IvaoMgzrW/zAWaDEbUbGEgHtWp7kk9eYTYKn5nvnCKw4EKFT6Y3WViM52W64um5eEqZvchkQsq2ESwPmcG0+tVOt/8ygG29e/lpL27HBZ2tmnpCQHiQfizG1rH0gt01F0wqwfaC/t3NZThuGRyBlw8i8REa8bvrvj01/HqCmRVW3IEHGI/f96qwNsbUk///2Lvgd6NhfS1NmU9PeVEAordoc1J9FC6i5QP/xMumxZ3TSCdTrJoY05XzTuZhOQIxrRd1whCf4RaEU9auaKQOhQ5zZ5Y/4BgMJVfhG145XAb04mc/jNWyzfQ6HbtevYSfYS/SbmX7PudTsN+rL6Kcylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wQ686UaWc9KpYyJI1adMQC+GqS4VAxGRMVR6WViuEU=;
 b=YIjaAqj9lMSeKESR9B83F5DMbhINJdxa7/NLfkwyc32UdREQ49RyIpboa0HBnFBwTo9pbo538Pq+gk79y125HhJw8rZL0UEBJQk/T2m/VxZ/4ilAm2HiJ3rjoNEl/cX5iqidPm/LsLXDYqzS7hjqgNbzc83+ihsgyagv26qG4kEaGaXcKx4TsYYOsSGJ0kzTjfVovFta3RT9xvj/MQQNuN2CzLqhcqXxzVupxPzmS0b9HjGAJLwoqgqYvMyS1qPzPoBBtfmR9VRPeE6x2WX4HCtTNS7NCWze4r7YBYxLjEI7ff1lqjP+1Vvw/YP5cooRO9AOiEZOzEFB3lAbWj3UAQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB6699.namprd20.prod.outlook.com (2603:10b6:8:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Sat, 3 Aug
 2024 23:16:43 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Sat, 3 Aug 2024
 23:16:43 +0000
Date: Sun, 4 Aug 2024 07:16:08 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, 
	Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID:
 <IA1PR20MB4953686E64FAA0A8AA9DACBEBBBC2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CACRpkdap4oeG6QRVbSNDK1Y5kT73_VJRgy9EM5Bst08SXmxE8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdap4oeG6QRVbSNDK1Y5kT73_VJRgy9EM5Bst08SXmxE8A@mail.gmail.com>
X-TMN: [3SYNzXk85kO+b03WOzy579JHfWlwjHYdLW04wtOevPw=]
X-ClientProxiedBy: PS2PR02CA0082.apcprd02.prod.outlook.com
 (2603:1096:300:5c::22) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <kg7cxwsa7n3ighan2qkxjnxnd7vwgs4sfk7ocwz2ekvvfvitvy@2xmdbkvgnjex>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4a9257-1a89-44e7-1a5e-08dcb4125660
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	fV5oL2AfIxVHCzHLHAZXz3rHSHyTRe/7wmACf5xsVxl5/kbTQf6HQaAQmL8RGhW8wQXupJebfSsJc3x+PC7X4pGJI5eEue2GKzJeCYXAFORB1+chJaj4RDr+P7E9SCro6WbhIdSz3tjh4A5H3378IqDgAL3rgiToahwgk0uoyScvG2giISIZzHW+Rsf2AIoU3f0WjhTqpA4wcTSDC3zdNVDJuI4z+GlHiu5CmXpMhJ/QN14SSJrI7s9KArG0qk8Vh7m2xh1H665wrNSEmCxnCjBx1t4kJgjMhcCdIiBYAHgfY200OQpCAbiVjo0RRDrI8FKqk7mnhW867kpK7lwWEWkwOzUAm7GCZyiGUnQmOPxIxxY6k2nv3HDFZrm3P1CAQ0tRR5lma5OamcuSxjAbYBR7aj9kckj0TzASPjtQI7WBmnaeuM6wP9ReQ85fHXodkRvDkbCH81cPSJ4bVqgW9KGiiYpc81BMqaNJF/RGS+FMKxccShbDM1ZEG1JMU3FHg5RyV1DnrQ79+cGHx4J1GlIuLDBzDdlZacIq3+BlIWEVAt/4Oes+hxpF4gBRYiwZd85wlXLUca3xfosYU9PIPuQJfBVYLLZp6tu8zLpOZBP+RSGore3a2SwK0pjcBu1uYgaHPsWtEmL8piEiwAFcD+2vywfhU7xv1jQ47WNrgnyb04bUCWdxNQXHc1qULsTGGZr0p9njCTsgplTsSdGugA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0VRd3FEM20zTXdQODdpY1VLbXNhVTlmbDlhSU02eEdTWXB6WjY1L056a1RY?=
 =?utf-8?B?Y3RKYk5KUTBDS3JzN3NUVURsdzhkeEw1SlQ3cG9RaDhBNGxmV1FxRTY3eFRK?=
 =?utf-8?B?ZFlHL2ZiSFBuQy81TVhBMnpZeWNET0pCMjQ3WVpyaXRkM2xySkJDT3E4KytM?=
 =?utf-8?B?YU90SUNPZGt2SzdvVUdpRjk5NzlYRHdZWW1aWmVZOWxQTkJZZkFlOWJwWlU4?=
 =?utf-8?B?NkVZbnQwSThBaUFJZHZvUmJPbEZIbGZSQnB4MHRoeEp5UGFPeU1nVWhBcEtl?=
 =?utf-8?B?UEZYSy9jbnltNUFWYTRSRUk4clVSdlNDZDZHbTNuWVF3MXpuZlgyM1k0c243?=
 =?utf-8?B?RVVJbi9uOHhLaVBraFFZQWRWTEcvSklIU0JqVWJzZGtmK3lJUFJ4MEw2R2Rw?=
 =?utf-8?B?Uy9WOTdSVmwwZUw1VEFvTFczYkN1MUVXVEVqWmVFdlpMcklrRm8zTWk5MVZo?=
 =?utf-8?B?dGdYV2NUcUN1elNoU0RJTzJkTmk5ZDI0MWEzeklkc1gwVHBUaUpHbzJLcEN5?=
 =?utf-8?B?ZWdyY00vVXhhZlI2M2E4MzJLYXExYW1jQ1E0OUllaXJwMThabm52V0twZTMr?=
 =?utf-8?B?M1pYR280Vm9jZ1VNT1g1VnFiMmNBTkhLQ2sveXo3UEtIVmVuU1BGRmlZakhE?=
 =?utf-8?B?NTc1b0JETzJzT2dRb0Y1bThNNnFCanJJWFRsbFZzOVEvWGN4eWpCWDZIZEFp?=
 =?utf-8?B?NllpZWdQZjdPbmE0SHRsTW1uZmRKQnIyd1JZUGs4M3pXVnQrK0pjZFJyZ0lV?=
 =?utf-8?B?N3ptM1kxMEY0Vk92RExQdjM4dXg1ZXcwNHlVb0pCS0VXdkNlSjc4dkZVSXMx?=
 =?utf-8?B?N25NUDhEeGxQN1NMZmF3S28wY2ZhZU51bDNhSzRmdTMvMERLYitPbzFxeEFs?=
 =?utf-8?B?TDM3dUMrSTRMTkl4ZDZtUXRINTgxbU1yUXh6MTBzR2t2Q1Z3M0IxVUxnRmxN?=
 =?utf-8?B?VTdKdjlFY2txQkhZNXNGM08wYjZ6amRvRDJ4ajFMajFFSDhNMHY4KzhoQUVy?=
 =?utf-8?B?TUxYOGhQQndGL2hsWlZYN3Z1ZUQxWDJ6SWl5ZU1DdExUQktac2pHY3dKUmFT?=
 =?utf-8?B?MUt4eDYvVmNqa2hJd2hzK0svTHJydkZPS2JGcklsR0d5MFV2MWgzdjEybEpH?=
 =?utf-8?B?UFVPMm9WYnVoSzJ6RVJUTFRhTkVYbTNocngxbVpNS1VXcU9GRCt0amtEc29p?=
 =?utf-8?B?WDFOaGppdVFxaHViNWJka2NvOVpQdlpPNnRlRVNuZ1gyNW1KRXlWYS9ITHM3?=
 =?utf-8?B?VHJtN3BRTWVrbTdhWGdmZGxPUFFTOW5sMjNSK200RUNhZUFHcS9nVEQxZ3ZQ?=
 =?utf-8?B?bzlsZkIvcU9OVEp2NEdxSFhwd3BGaGFHT2pDdlFVSGRZU0h3b0p0WnVNeElZ?=
 =?utf-8?B?Q1FNWE9EOGJxMUZNNXpQYnk5Z1MybEtTVDAyQWR1L1U2MVNsL01BbGZoazlx?=
 =?utf-8?B?Q0loQ1Q1Yzg2Z2o4aFF0ckc3MFoxV2pNdjdmbEplN3BZQVhmcGdNMTI0dnBE?=
 =?utf-8?B?ejBrcjdhazJ1WUYzQUdPM3A0U2lhRVZXZGZuSThkenRKODdneElLaWtySUFZ?=
 =?utf-8?B?b1VKTFlOWC9sbXhSNmZqL3FMblRvWDQxQURRZ1lLUXlGZWgyR1MwUEZhNWtz?=
 =?utf-8?B?T0NFd1J5TWZNYmFuRkE0VEpSb1huZ2dVZjdHWCtxV09wZ3pQb2xlQ3hPZmgw?=
 =?utf-8?Q?1CGwtOxR7WDGnwfsfs6X?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4a9257-1a89-44e7-1a5e-08dcb4125660
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2024 23:16:43.3391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB6699

On Sun, Aug 04, 2024 at 12:58:16AM GMT, Linus Walleij wrote:
> On Fri, Aug 2, 2024 at 2:35 AM Inochi Amaoto <inochiama@outlook.com> wrote:
> 
> > Add pinctrl support for Sophgo CV1800 series SoC.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> 
> Rob said you could add his Review tag if you fixed some small
> issues in v3, are they fixed so I can apply this with his tag?
> 
> Yours,
> Linus Walleij

I think we may need Rob to review again. In additional to the fixed
mentioned by Rob, I have add new ref to the "-pin" node. So I drop
Rob's tag. I will ask Rob to review again so you can get to his tag.

Regards,
Inochi


Return-Path: <linux-gpio+bounces-23104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6DB00793
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 17:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9A63B0965
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 15:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C4F275AF2;
	Thu, 10 Jul 2025 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YpBD8kvZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9C270571;
	Thu, 10 Jul 2025 15:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162570; cv=fail; b=K6i2/UFBf1xn5xQLorUF6GxSngk9kL1EttzjVOdBtO10bPmDu2FSQlfIztdugacgJEMJK7UcuQt6WAORJH7oW3DUpBUkX/YxFKFsvOs2hxYUWlqP7//7HE08/FSvWkHM0FFZ29VGWC8UsslP63E++kSBTmzkqOGhDs5TcstpQpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162570; c=relaxed/simple;
	bh=h6Pez4dufnU6MoPu7N+4If4IatQSDEImUdT1KK4J1xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kQMphIDoZBeNn3ToHwjR0c2T3xBgg4ZBav9Sa4OuCzbrkA1Z2zBEJoqZ94S3VPhjrJFqcLbhANr0saRnKHRMMfM8vTYagb7j09ev/zO74znkSqrnjJPPiyG6elb83e89ZGMGerDF8K7mVA9YL/Oi12xilvLzO3xBUADxRmhI4d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YpBD8kvZ; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEEIx+TVjgohHPDC0w7KXQF6ixZ50y4qya8jcPgluN4dP3L18q8PDTNwiCU1xZfSC1FlY51i2b7MSMbwunfUDy2N+AVS5q2Ju7+EsyH9hWRdgFzhHnZ3HaWZHJnDvV6X6ywtnpZoM/aFvgqswyiM1x/SnfiiXk4G36xKWdVzTOSSYtdfoGds8+aV2+DE6grbqskdw8uUv+9jLYQ+tRzEZRemk7eWT0WFOcQYq2kq0lFiUI6wZGDw5+OgaEoy6zhYzikaSQ8NtEYvm2CNMu5jsIjUeHXPTo9iL7x4lStIsm0BQOFtjWDwRlmrZPyrKHIIpqdBHppkudoz0hybfXjmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNGXUYMmONep2xWPuHlCbwloYqogd4P+tyoJ7VQHyT8=;
 b=gFFPc3Et88mT4t7NMzA56trBUKaQKfK+AZSqQeIH5rEDqWkEunD4lLxVOOGKcyIPO60AzpXaFc6NV0YcztipGdEqVjIh6CH9z87O7DHKCYIafI0PuSWsl67Vb+I2GPLfLkUcDqij0qjMUIdK7ISPERpaZN/rj14T8/b2oIARrNEtTXARgS2Qb41nEL+qetKVzLn42N2UHbpSukQ7pUdFUSvQgMV1yB2iWN3tLEhXTIj3RPz9GgxZMgUdiIPy9exefuz9mwGortjLajo3LRBpAbziPp+3I2w6ejFmqHKeiuDP0Pg1Z4zJ/ERysPLjVyKKJQWSNjepPqIIH5EWXA9cVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNGXUYMmONep2xWPuHlCbwloYqogd4P+tyoJ7VQHyT8=;
 b=YpBD8kvZbZsmne64NU484irxxDEkZ07+xbSYK0lPwN10ABSOt+2sVxhTAQ4R2pokNTYyW16Sa4j3tIWfY3iJ/9QjPoCFc4ER8aXhRLs+qqhG+QJV7EakZNJxVby0EB/+XCw6ulWwFKpDUxtqC3R2ztAz0lJYWisYvPlKL2nr+HDqMBu4iF/QwSUayUzlTFHjB/uoXoEYU/yZ37ydn5f2g1NN06DyfmGJmFecjPnfQtPFTIiCMvmHYWWOmfLKbxX26VX1MRVkW3H0LQoe/iynXedkPfouGBJ1A3aFZ8RLPFisgw4fyykh5MA0ykCZdB48umQXYV3rmxLAKXKZFHpJyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7223.eurprd04.prod.outlook.com (2603:10a6:10:1a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Thu, 10 Jul
 2025 15:49:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 15:49:25 +0000
Date: Thu, 10 Jul 2025 11:49:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
	mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	ping.bai@nxp.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	srini@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s32@nxp.com,
	clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
	echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev,
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <aG/g/ngHCN76FX8v@lizhi-Precision-Tower-5810>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: AM0PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: ac19d53c-6340-4791-6ae3-08ddbfc95896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YN6UAi8Xd1m/imxRqo/9J59fYH9FtvmlrCsdD0Mzna0PG88zNoR2cTiaP4xq?=
 =?us-ascii?Q?4eKgHx/IIiOv+hvzAIN4eUI6G243nhoWNNAqOIieYgJSXVCiSSVjuKpvUp3c?=
 =?us-ascii?Q?YT+ewqgKLPoClOw9yZWznXQTsayzXnNDsyNJ6n4lZ7RrIR8lP5wjmxM6vUdz?=
 =?us-ascii?Q?l2SM4ANlzoay4K4Hx6eRtsCOu+vzHlDmWGyibkP8fMeH9F+QsLfZ1QD0xnAa?=
 =?us-ascii?Q?o04AM8mJCO1rMYtMyRJXE6FVIPTYil+G//5VVLhGQEoeaFBOod4weRUwwSIL?=
 =?us-ascii?Q?JzG/P5tojrLu7cpBL+pF4TKmAiJfnleFSZ2kHvSgzuffRwN6VcgIlWbd4WnK?=
 =?us-ascii?Q?50Er6BMvYjucpUXbph6NOsjSPrfp8xV5zh7Yv+O9T991kEf2L7m0P/Q23eRs?=
 =?us-ascii?Q?oOuORpwyx3TRc55GbAZwOxI8ppYuLIIgQP2tK+Ci4WXM48uXdGa/AqQF8xfU?=
 =?us-ascii?Q?YYkTxwJrEJQz61kxPriTxiEQJDk/+NFQtFdfFeMMHzFwTr1gNtjBZ2/3SdgO?=
 =?us-ascii?Q?Fo0oC9dEEwiLc4K3jiShQgkPOMOH0u5hplzF1aGFj4QlBbE+Uuc6h8GR56xl?=
 =?us-ascii?Q?EZFkWJD2qqcedrkEPQ5+0f9LC4jrjGGS2Vyk3G09vpQTZw4GRQpNgAWYxKCP?=
 =?us-ascii?Q?PIeEU582MHv4Vv1l+7wFahwl9KrFbRUJm7shgQqhaGSoU5Nd/U77ZMQ0gmaE?=
 =?us-ascii?Q?vSIsCZl6cgdrzcXiwFOaywPxjgkcMTZOWt6ODoUkuXPthJ68+tLO/Wja55qX?=
 =?us-ascii?Q?E1Evl3QeftaE/0vWCheGflE865k3o2afLT7T23cnZBmAtP7ejCRNTSSIY9WL?=
 =?us-ascii?Q?97F3Hm03DzN1uMBC1isPpxecP+AFDs2zb7m8xJgC0W268F6PghIobvFuGGWR?=
 =?us-ascii?Q?t2FTBj1yyJmgUD4do0s+zaNY31YGi9/AboYdTldreRuQMIQtbNRl+uGcDAy3?=
 =?us-ascii?Q?AKlLpDUr8scpFwuNVqBNKmbHFu9o4vMgayPRQ4kgTHR+5uYLrf0Yb+x4/SNW?=
 =?us-ascii?Q?/kAdhYQdbR2yXWNOLOhGuk6dwoj3H1Z0yDUHIXt5vnuWV65tvjd645UMAxoe?=
 =?us-ascii?Q?95HLDED8UpZdFrBEwwVaOlZzy5t52NZmKv6wZnbOHDNeWwwxvos+lOyjHQbL?=
 =?us-ascii?Q?a9QZs0hN+fYdoIGLKxCZ9g79mfTXRSFFZ2uCI5L5vDR8yWaTGJQ4znE3FUns?=
 =?us-ascii?Q?Q52GjEke4waNBxHgxP1qJRf71vNKI1UHOcWpGVLFcTnASJsykWXkvmvNrFBc?=
 =?us-ascii?Q?Hna4G4cKOfUhHpWai+vWoWIqG+PT6e6K0yX2mez8uIJ0E3JUGRgFdo3+U+hY?=
 =?us-ascii?Q?wXWyXLJfuGrZZRjWcs3mAbOxdquKm4npSLv6sm5+IznBpXCcBVPO/vWVJpcy?=
 =?us-ascii?Q?ubJghJlZj3vx4qtQQo90az3KpiumknxCSrJuuSO/90p7/v+eV9hDQSwAse1r?=
 =?us-ascii?Q?Pc0qwibQra4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z0fcf88ABTsqcmaWqPJqmEVA+UNCkosdFyoDPzBwx/0KtEc2fDsSo/xtb3oO?=
 =?us-ascii?Q?9zilOkejUV4Jayc51flgx+FFargduLhLtAvAq+e3I49WWrT2MuFOFDubz3GE?=
 =?us-ascii?Q?Z3h+asJq0FL8CJpXV+dT5EYTyabGHsnDpO6cT0Mo46iA3bnVwW0C/J2qZ6vN?=
 =?us-ascii?Q?lS1JAJEEByZoAGb34j6hvpiDfLkKVqYcjqoN8sJ0+rJBntorbXGj51K04ZhB?=
 =?us-ascii?Q?dJa2MO5oGu7HZ+DoVzeaM/TV35zWB8XVSh+mPs2+YaiysZh9b4lUX2/oYsTs?=
 =?us-ascii?Q?LSul0zjYKtBrI6Yo2xXfr0u3DkM34+FBhkaZMLO2mlfJMSuiybLbrSpIlebs?=
 =?us-ascii?Q?nTuTPRnPXqLubMjA7QFUf7vyI95ufRaAsuCCdB3G2SRmOBWBdRvVCk0uatL3?=
 =?us-ascii?Q?ePZW5Cb0qsoEFxTDjzCF20EGNtmV7GSeO2UIES30uQnRyHH2aeFo74Lft5yZ?=
 =?us-ascii?Q?YEQaO9liFDo/weiaZc/kQumvF/9nZ8o5DjDHDkMJUD9cbo6ujM+9WLwgIwsE?=
 =?us-ascii?Q?LGX2lylgVBRxoqa6p/VpgPxvkflv/gwsv9dvWZz7/rIQSq5/MCDptbiGWxVc?=
 =?us-ascii?Q?D1wrccQwF2k6wY75VgjREDF7xtV0+HL0gaZ4wLfIh8lDo7PB5fyzt0zf362s?=
 =?us-ascii?Q?v6+/vObqt12DmlvGcLgwQnTmKhNEXW4p70doW2IeYci+/tzl+GPoQMVrlYYw?=
 =?us-ascii?Q?5hQBLRkyxGUtgPjvwRjr0uQGNenuT6xBb9SBV5/0vAAlrM5JBn/cp5hHI4An?=
 =?us-ascii?Q?lugLj6vTF9tnw75BaDfkXkhww7b19435Lcd5XFigW9sKgc/dyKtuRP07IbeF?=
 =?us-ascii?Q?eHPmqs059J54wvvTKDhCB9TTXgOSHC0d6eZrB4Sx2i/zTFCvmyarO2tibPyG?=
 =?us-ascii?Q?diI6eup8+Cl9gz3D6oGuk682oWClu3oUxc04a9pZyOCotYyRQ7LwLI4NtWX0?=
 =?us-ascii?Q?iCBSnZrsWJeYlqnwtkiLiTPFvYs7cr3+2pkrFI11VaS2KUGSGi6FTkJlDDxO?=
 =?us-ascii?Q?fKHcygFAlFgVr4lK8C1ZIC3eM8ZvAV/5lG/R6YXGSFCIWlXMx+xxKwkdmUiE?=
 =?us-ascii?Q?5EFz9nSXGE24A7bk8Ofhwbxd222yUKmK69Ytp9vwWxSnUUamAYLRL/8WNl6E?=
 =?us-ascii?Q?zzrRCA3evgiXMwrAg1TEoZ4PTgaYnP9Rx4zljNz5vGlhKuBdHmNztSQKdTCT?=
 =?us-ascii?Q?093mk2TVrn0Z++HYOosr2fN3xxNNOhlJWycZq0le4Y+mbNUWj/m/FAFjk8i+?=
 =?us-ascii?Q?CPYaHXwbPVuJtaEx6/SVa3wXNiQmG8jgRMqRvlBvsmXmvjBRJquNgyKXtJYA?=
 =?us-ascii?Q?v+Wl6C0w1UJXjeBgW/+rZLnp+g1T1YHqlR7KiH8kxhM//kmmqZ49VaIHDaWq?=
 =?us-ascii?Q?6HIqYYnNkMTd5CnQcK7rdzrAS+msNZIQSSioK1brafJ10Ui0Ke22PIey9S1r?=
 =?us-ascii?Q?fffV3eHABd//zTozS+6aka6C5rp270Z7HCGbRb380nmLhwiWTifemxAjAlCm?=
 =?us-ascii?Q?UNXTfGFqCUz2ypw7LhniUJkgsYhBxfUvfpskxuXWu5eIKoMUWgcq3nJO8UDG?=
 =?us-ascii?Q?+lsNo7J3VwMyJ5lX7AuvenhnYkEnok5oKX5Ia3pM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac19d53c-6340-4791-6ae3-08ddbfc95896
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:49:25.5155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nD95uKYRmBH+vYyvOChtUEWVUrFDg2UZfv9alcSNvlVm2uTXEM1sbaDv78AIpA858MoTwpGnf0bZKjgaTEI+gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7223

On Thu, Jul 10, 2025 at 05:20:24PM +0300, Andrei Stefanescu wrote:
> Add the dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.

wrap at 75 chars.

>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> new file mode 100644
> index 000000000000..8ae185b4bc78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32 System Integration Unit Lite2 (SIUL2)
> +
> +maintainers:
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description: |
> +  SIUL2 is a hardware block which implements pinmuxing,
> +  pinconf, GPIOs (some with interrupt capability) and
> +  registers which contain information about the SoC.
> +  There are generally two SIUL2 modules whose functionality
> +  is grouped together. For example interrupt configuration
> +  registers are part of SIUL2_1 even though interrupts are
> +  also available for SIUL2_0 pins.
> +
> +  The following register types are exported by SIUL2:
> +    - MIDR (MCU ID Register) - information related to the SoC
> +    - interrupt configuration registers
> +    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
> +    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
> +    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
> +    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
> +
> +  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
> +  16bit wide.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-siul2
> +      - items:
> +          - enum:
> +              - nxp,s32g3-siul2
> +          - const: nxp,s32g2-siul2
> +
> +  reg:
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: siul20
> +      - const: siul21
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  nvmem-layout:
> +    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
> +    description:
> +      This container may reference an NVMEM layout parser.
> +
> +patternProperties:
> +  "-hog(-[0-9]+)?$":
> +    required:
> +      - gpio-hog
> +
> +  "-pins$":
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "-grp[0-9]$":
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        description:
> +          Pinctrl node's client devices specify pin muxes using subnodes,
> +          which in turn use the standard properties below.
> +
> +        properties:
> +          bias-disable: true
> +          bias-high-impedance: true
> +          bias-pull-up: true
> +          bias-pull-down: true
> +          drive-open-drain: true
> +          input-enable: true
> +          output-enable: true

I remember you needn't mark these as true, default it should be true if use
"unevaluatedProperties: false".

Can you check if pass dt_binding_check if remove these property?

> +
> +          pinmux:
> +            description: |
> +              An integer array for representing pinmux configurations of
> +              a device. Each integer consists of a PIN_ID and a 4-bit
> +              selected signal source(SSS) as IOMUX setting, which is
> +              calculated as: pinmux = (PIN_ID << 4 | SSS)

Do you have include file to define it? otherwise hex value is not easy
understand.

Frank
> +
> +          slew-rate:
> +            description: Supported slew rate based on Fmax values (MHz)
> +            enum: [83, 133, 150, 166, 208]
> +        required:
> +          - pinmux
> +
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pinctrl@4009c000 {
> +      compatible = "nxp,s32g2-siul2";
> +      reg = <0x4009c000 0x179c>,
> +            <0x44010000 0x17b0>;
> +      reg-names = "siul20", "siul21";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      jtag-pins {
> +        jtag-grp0 {
> +          pinmux = <0x0>;
> +          input-enable;
> +          bias-pull-up;
> +          slew-rate = <166>;
> +        };
> +      };
> +
> +      nvmem-layout {
> +        compatible = "fixed-layout";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        soc-major@0 {
> +          reg = <0 0x4>;
> +        };
> +      };
> +    };
> +...
> --
> 2.45.2
>


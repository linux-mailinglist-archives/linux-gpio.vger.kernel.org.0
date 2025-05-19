Return-Path: <linux-gpio+bounces-20295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A7ABC266
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 17:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB3BB7A23F7
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 15:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEB12857DA;
	Mon, 19 May 2025 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="htLklbLe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1770843147;
	Mon, 19 May 2025 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668420; cv=fail; b=lxGwvywSOD/lIdYXhrGCOqTFo/FibKg4QSShCp9HLKdISAd0kmFk2PvAl80kWZteHTOvF37nX0rXYCSsZTcyFKJ5D+iaQNtfyW1TnaPz0jUj9VOEcfjc3QQ9YYBFmd7tOBkpu+e469bPI6GFow45FK/s/JuQTD1oNM8X47fnv1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668420; c=relaxed/simple;
	bh=UZgScgtSpUkoZLWpWP6V6m7J8xeNvopv8Mw4Y6MDMTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W59plGWA53U1cOdhNcwQ5fetwVBhw6+/7vuWEZi6LFvzpNoopRoahjn5tSApE5VMh8u1DmdkDAhPJdCXgTcxcsaW13QQVJJAtbHUf3HfhUtSs+u4Ia3io22pEtCxd26CEZvN2IO4hjhdOKJlfOIoB87ybOfIvX7hyYtu//l1tZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=htLklbLe; arc=fail smtp.client-ip=40.107.22.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYKjp8+d1qsphrVJkHncmC8Hc04/ttdCykFpJTxMW5W1TOYgJeLXdcVUeyB2Gv0/wMHE59IvuZ+SHJAjp9dWWs7G8uFH5j+jt8Rp/FEY7mre4I7Q/a6eJZY42v35nTfjt94JBl/g25UAUQpMUxGyplNsAaqUd4uaUa4ROKbxVSiRTQl50ff7dkv9EM3gocr13m60Ea3MdUP+Q6khvuunh4AXMrsZA8F469++NCMpfXvO0bXCWFrpuhpSkKrSGhFrkJJRsMTBWrmSTXVqfhLcM6qNE1Feq0Pbba4H6pROyiYdi9wm5CZ3I9zdF/gAV8/hN+hq1MWJU+ykLlw822Ue8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfNTL7NM/RiOpYrt03YM7Bvw7PjliRH2M+2/x02gV8U=;
 b=ZGatQV8lx2nxAfJ+gb59hr6M2n0eOc1Bf6mvXVK0cAWdX/ERQ6ltmVPHnQMTDqbtvEQf0RPVG9oa9d0pPGt7m3m36sTVa58MTB958xupuj8TQJKpX54s6Y/UiNd6pmb3AXX8aZJ2EtjEYcZqspMAZ7bJ+rnyg95U8cO12PIbneiSO62Cr9lTZBE2pH/TLw4GUBvgauKl+rMLCdTEPGuRowvjpFjW/Z9GVSwQ1rCg8NK/HzykYS2kbvzNJQQgY+8e/7REnML19Kqdstk+zkYcGIRF9ok7m/3QgUTnGna1sXjWiDOYty2nTX5bIggHpE+STD5eglba67+eiVE+gIOPKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfNTL7NM/RiOpYrt03YM7Bvw7PjliRH2M+2/x02gV8U=;
 b=htLklbLeSXiB0b3CO4lJmcZBQ39lJh6cR0K62CxgnlxOj/S5/JwKfzXiaARSZGz1th7QPSL3rWfXFXTbm0rkwSH653v4hvaBec5wZ+C35rMqh+L6bYeoEIA4YFXUMRiu5ME4pw2Y0hNlw7BjQ0hIl06xF/en6PZ+EZ0Otq153BUGvRg30KFFOFJ6zlUK2bOVD4nHmnCx89PpvIcCSww7bY8OT7WFF25Q6qW3zRBkiWp+/eGXXwlfKXb8wpOnl/ETMSAjROrbeRf+vY3UV6JLD82Sh171I60EsfbvRPWq69baEn1PvTqQe3LU//9jmJcEPMH2Yma6jUHMTc1Jn3ZiYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10531.eurprd04.prod.outlook.com (2603:10a6:10:55a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 15:26:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 15:26:55 +0000
Date: Mon, 19 May 2025 11:26:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Message-ID: <aCtNtKHay9IXmCgD@lizhi-Precision-Tower-5810>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
 <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
X-ClientProxiedBy: PH7P220CA0048.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10531:EE_
X-MS-Office365-Filtering-Correlation-Id: 2632e2f8-65ac-413a-7c5b-08dd96e99640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xy6EEDtf5pXU8iGAA62E933frNqMuLoyPR6QnjvLqfvUttiik4qii1jL44jI?=
 =?us-ascii?Q?biYOxy6jXLlCuzOJ0jcyPQyckEieORG72h/Zu+SPgLyB59/JgR6B958iyOI/?=
 =?us-ascii?Q?feosdYECRSs21+UpA/jIDP2ApOwlEg0hTbvGh4rJiwQKa9rF4GtSRbg+zAdo?=
 =?us-ascii?Q?uK6kuUTS5zdXAGFgbAkgie8V/VDKsQeC6owrQ3xa8B4PQWwILV+j1qluGBHK?=
 =?us-ascii?Q?MxXpCjh3qtpJw640M+XntBBi6fr8Y+cezcuHyqTVYKumDv1MUmPBwCzJ9OuY?=
 =?us-ascii?Q?PEVYp2cvTkHMABMvZD5MrBPZzLOrXCCNUV0Cu+BA6U+DZjq3omndGo6rauKB?=
 =?us-ascii?Q?oPK7gnGsebo1651BDDdgEJSv2g45AlwEid702lWhysFjQI69R5QMhKsuiyYv?=
 =?us-ascii?Q?vJgG74sn9IQbRjAiqvEjeMKDOIJo4t0FPnZ0btCMayBTfKdd7FG0iiHQyruA?=
 =?us-ascii?Q?Ci5+Ayw+SHToo7ej6NruUDboMt5IuUVGoOfn6AYZW6jkRI5M/8M/CtSEUnc8?=
 =?us-ascii?Q?WRMOW1ww7JXqChr40tLGiSqCQ0HaL1EBj5G+6BEHMT94x4b/MHXkY11uU+uA?=
 =?us-ascii?Q?ucOakpU+MqvDFLDSh6neMaeeBJP9wg2n5EzNcjHdAo82hTUQpwkeimB40fMT?=
 =?us-ascii?Q?6vDACkjf71j36UtBIYz0IngEl5Y4xflfM/bjVRsHVxibsxoGoNFrpcsstiz4?=
 =?us-ascii?Q?ipm6I6infCkByjLeaIaH7hpT095jeicddElHnI46JD6v6zwuE2E6coXhnhhx?=
 =?us-ascii?Q?xlZIMmGFDgdtEv41lfG/4UaG3WtHWZja9+MnENa4XSE16n7AgbY0hUjb/lZq?=
 =?us-ascii?Q?yHYIldQXXmD5ZZ7/C6xmqK/bQEFBBI7TanfLihRQmC9bpfrpy6le7Xx5TpwA?=
 =?us-ascii?Q?F903g1XUrGzb12cMIRCFejfo7qmDZ2n+4pjOiiLc+8QbGbuIygWlq45KJBi9?=
 =?us-ascii?Q?D5+DRu+ciCcHeguKzcIlzUl3c8kOHMI98N8ldd73WMzjaMEsoYmQCEAb1/+v?=
 =?us-ascii?Q?pxW0vIV4UpzlswikEMSddORPYkAbEIuqaIgsIprX8jud8YkITORFTKyM7Ktj?=
 =?us-ascii?Q?imvOoK+QvNVzgYAypAuTFMWcXsavOdS9mqnmpOuQaz8SL3jWf5DY2bKTORO3?=
 =?us-ascii?Q?mrHiqzC7PTT4nK4+uM28IJD/HA4ZYBnHcYb42A4qyRZPeulY/Kx8f52O1aLN?=
 =?us-ascii?Q?Hea3ValSK6wgTBGXVC7TgG8L5uTLuqR3u1h0V/xhVZSaFIBmCKF5d+7oMHc/?=
 =?us-ascii?Q?sxkLAqOhMSYSMZi0gGgodPWO3K7t7lpAQZd82AoLC8hfF+cIwKLRVmZbRERb?=
 =?us-ascii?Q?xaSoDVdJBEic98iXjagPhxNnWWy/5u4p5QtaHEGft/0gYJbK4wZq3sMecnlX?=
 =?us-ascii?Q?oP+vEcOS9l8WL3EamDPiSOvp8T1NuwrLkKn+C5UlwKSO8seJIGEJLU6+rZxY?=
 =?us-ascii?Q?86vNdTIGY/FjPdPtinThRtUAodlHJ39YEJgAd/H+41/IaXQy3gTKqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CQIe7OAVIjzIxOtS4DRTgT4JP5VmC8qyN6pAD7gCUEx3vKloI0+ddB8Q3b1e?=
 =?us-ascii?Q?rYIM7WK2wGS6DOKQSgwYhDlLQE80kNL4rXXmb3UIV4vEz67R3ajmgubjdqMx?=
 =?us-ascii?Q?+BuImWgKsUE2aNT2/ChvDgO8r7XPmiq0DXzchlVO6rZBw9HfjpSqWkzudJoy?=
 =?us-ascii?Q?zI0WfCPnhaavAl3dEiIsDCfvEs2HyuWAIJuPmVtKDfhlnA+6vMs24OqG4DA5?=
 =?us-ascii?Q?PeRwkDFEJXINqumqAJMo+MTkTvP0bxia3A1GNKFTm08ZMWNcuV2hI5sNdNDw?=
 =?us-ascii?Q?a64hHUDYt0RuIO+llqgj8VG+s1ZqwmjvZ+eDRL9rQ92+SELlclygpAmJ6haI?=
 =?us-ascii?Q?T1TtPSOVq1XqU1ViWaPelwfUGb95rdluHp2FA5RVAejvwk1nd3hWiamURV1x?=
 =?us-ascii?Q?IxVmiTsMr5eBWeaLO6c+hi1sfOomHbKLjN/8kkKOOrSCcdEZ7ZINo4G4P9io?=
 =?us-ascii?Q?edGGMRfAGnE5hkLp96BcUdDvstSm83Y65wkk80Sy9XsgO3ld/ewFvgO1yP99?=
 =?us-ascii?Q?oyv0YxiTeBTZ8DrBu2SseKI3/R/ZwRxLKjurkmUWYzNvJ5NMp07HXOHQyiE9?=
 =?us-ascii?Q?Zi0vm1RmIBqjxErD7y3ZtsFyiRhIuUANH/IPQwBLJtrNmJ3Sh0Bxv3691EHZ?=
 =?us-ascii?Q?5GOijBhtRrHBzITZ6m0liQjp9I8RLqXmAPfYLTVCevGt62hsXm235y7dC3R8?=
 =?us-ascii?Q?5i7YoWtnHWApJgRa/qaB1x/NjSgNzxeAUN6AXyfijzBZNvHYPzEeObA1Xr/3?=
 =?us-ascii?Q?IzPdiuoeFDrPTtFBNB09tbGN9Z1+6ZIqy3K7Cxhpbwysoaba1HTNnAy4QBEq?=
 =?us-ascii?Q?/ucMDyOvrC+jcvHoInmNvy49V1ZudbHtwFytDWHZvfDx85VlGGjoXi1S1Tzi?=
 =?us-ascii?Q?j5JCDP4rFUTgDshCRcDqUAJPRSuxwv5LmV2DU1Fju47Hws1a1INDImoRvzNV?=
 =?us-ascii?Q?o+ArmsUaYnJtH8pIixqMyyCjlFr7LRjYDWRld0L0jyNzSerW6DyF6m/zWLsk?=
 =?us-ascii?Q?QN1h3lBJ3hN12TU4IAyavLbP9Bh4rM6NA6W0SyoZ5wPjX9dZ3Ru9y0lGXc57?=
 =?us-ascii?Q?+OOSsbvUDD1bdaZ5r5eq0zZvi6gFqEiBi8XGTyUIzpJF/tsqK4MLxIkYp6JB?=
 =?us-ascii?Q?aIWV2XScseIezwGnPywVxsiScPF8Bd7NKVyyLWFqmWBAT+MKn1dqcRbojKXh?=
 =?us-ascii?Q?rfeimfoP3n1aQ7uiQaTo7O8y2pqYrgijIwzM3yrOhDI9haH+aEhIdqnWiMPK?=
 =?us-ascii?Q?dqMMCZ946jYLZyD/Afb/1uekSdXTjAxnxhiEoMPVUY/9DjgcxdzruyeRTT9A?=
 =?us-ascii?Q?7aKFcoeCzNA0zycgMsCXNt9uVb6p8mim/pQ4mPTHsCgSHjawo2sFz90iAwr1?=
 =?us-ascii?Q?T2kVu+QdsEb2IzVgexalut9DEqytaltg5W4/p1b2M+VK0dp9/2YBK+JEUvhJ?=
 =?us-ascii?Q?JHwA+R58XTM+LHsNmZC3yy5VGtzAdffTX9QZHjPcM0HyYU+KDyZ0GjHdPFzj?=
 =?us-ascii?Q?p3TkL60fSoxBlOwqD6WxBccsKXofJZILC5uuYdNLtPF6sfGGr9NkU9u4apWg?=
 =?us-ascii?Q?8qBg5FP/G6fhP4Ta/JNLIUQRVVhVgzt4jfHzykW6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2632e2f8-65ac-413a-7c5b-08dd96e99640
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 15:26:55.1062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKENm9El8eI3LjHYTRO06zb5XH8kMT1yv2FbtuRAumaOt7q8hmg8aO2fKDc2/g5lmwH1S2gWLbxZDiLbYxun4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10531

On Mon, May 19, 2025 at 02:03:43PM +0800, Haibo Chen wrote:
> Add optional ngpios and gpio-reserved-ranges property

Nit: Add "." after sentense.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index 4fb32e9aec0a341a50088f3e4352ed4d36f649d3..5b98228466c6414be681c49417bbdd82f2c45756 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -70,6 +70,12 @@ properties:
>      minItems: 1
>      maxItems: 4
>
> +  gpio-reserved-ranges: true
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32
> +
>  patternProperties:
>    "^.+-hog(-[0-9]+)?$":
>      type: object
>
> --
> 2.34.1
>


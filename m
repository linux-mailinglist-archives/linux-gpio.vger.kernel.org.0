Return-Path: <linux-gpio+bounces-26334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE03B85BE8
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1ED1CC2741
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCDF2264CB;
	Thu, 18 Sep 2025 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D2V6iZ71"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8CC30F953;
	Thu, 18 Sep 2025 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210034; cv=fail; b=JCkeK0JXJWIAQQB75ohteZBTZCDLZ8FbrJPCWaue744rw3S1425yma9zedyyIus8dS3+KD1k507g2ACK/vtPvQEy74z5RpzdPQ7niIo7cSymnlbHCYUbVF+qpbf3SFplyqIP8Z+ZzSgS7rdd9T0OZupe43M0nBZcsXYm7NEQV/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210034; c=relaxed/simple;
	bh=y9PPh/24zMfOd4AuE+sDkJl9YY4z0/kJMfscecgK7Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rEbRy1MA1e6KG3D3PGv27EurUTI4UQJeBQHw7GsrvgGAxXOTk27cPRQ8njcCoFohcXmEajxteZJAKB0F4/38/D2Vj8frzmEV3ljrYnBP8e190M5ezn0y8BRrloP8C6ApXRg1tDuU5mzP0NbOYf8XVw8YIeeGyM01eCZqpnyq/Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D2V6iZ71; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kU9+AVfngskckTmMHEPyX+4TAr5NsaqP1dQonJrVqotc7SuCuVRPF/wY3U0hTnuBJbxJQWFua6E9iD6g7nYk7WikVafLgWRkdp89fICRhzmbYvB+duQdWMZ1Q1AYySnsyUQdsqSl1Li7WicCTZfD1HfeCmcOxgVB1CvFAP8u7ABU4mserqwLq4xEOjlyMrymWCAFW040/qhuuaE73MNGdGwc/kTcUh1p0cqQHqZ+iAlrS3YTlUKezQu9n2tiRT+OmYWgmCXmaDBpnNAfqBvfGiB1NfgT18a7UqKmWeP55ZnJO5+gIn89FNG86SwdLm3/R+xlNBZEh1TYBqChd8PGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUlifpxVL1Nw37rDNpupxvVE3J/PV7XHzwH6ZAEjWzQ=;
 b=bH0FQ84vmE+uBAX5FyB6DJ+ASB0e/Zhm/ILoL3ts2JzKwCC57XrZeNagPPVoMt0zV8A7B465ejcprwVR8Ve5zydLS8xf8RY9Zt81tffEi1Tw2mSn5gR8/mr4E8laR67yANDGFfDw8a3uYzcS0AfCD2P3pMS9DDof2kU3Jv9WGDer9qQjL8K50Xc+YqpumkKD38IgMOqm9ZZUsBu7N0CKBxN3+FGHp0YXQG3n4Cm3K4m/+mpEvWDyfL/cxq2Hevw9HjVkO2b0MX6bOLTSFRJy6zvgaJCu1PqVjKCo93GugROplaxnFurNEaMi24IOJn6nkJNL+RfFUY5xliah2+6b4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUlifpxVL1Nw37rDNpupxvVE3J/PV7XHzwH6ZAEjWzQ=;
 b=D2V6iZ71SqrcMTDA2qYf+txxk+pNTYzWn97MmkNC64I2JESxZSMuC/upDEC5qlccwCaD1psw+XN8mtppFSu+Q8j/HKwxEOoxdfivtnsLkWWzjpZ1pBkVqodBsxP2m6+ekN+JE/lGUJ6rO0Wmv4sEyPDawTr74uhUfITEY3iLIxY0eVK5z7jR6xfzRTXjjptfoQL8PN0vrB9SbKKr9k1kdtn2QzNcOHhU6OKjYUBt8ffxlBbOu6VIhY9v1O62Z7TTpFoscfHMu7yzHnuSK8XljcZjVME6Kiorhon+OxcXOwHDpW9vmCfZEnIqf6XnXoriwAqnxWuKSh93it0+5ZWpug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB9975.eurprd04.prod.outlook.com (2603:10a6:150:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Thu, 18 Sep
 2025 15:40:29 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:40:29 +0000
Date: Thu, 18 Sep 2025 11:40:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] arm64: dts: lx2160a-rdb: fully describe the two
 SFP+ cages
Message-ID: <aMwn5gkosO7cI+9u@lizhi-Precision-Tower-5810>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-10-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917090422.870033-10-ioana.ciornei@nxp.com>
X-ClientProxiedBy: PH7P220CA0098.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::9) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB9975:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb2bd2b-0836-42fb-95f2-08ddf6c9b221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y2WbQlJEQYBpszqR5pW0zwGNwW0GFNB0sFGOvZVHwNmVYtzYCGX72XPWZBQd?=
 =?us-ascii?Q?tr3f/FYBT3L5zeNRPziw7amUTLQoKiNWzm85VVcAWh6484opUuCMsavpb2QG?=
 =?us-ascii?Q?5T2tztIs2U213PuN350W0N8WI2QnWi6bpI6FbXUpOOqBz9xiD+ShZPcKn0Uo?=
 =?us-ascii?Q?XujowJa7iPuNDfjuyjqgN8fj+CCJN/q/NbK3+GzVQOld73ipYuGn8rbIKs/8?=
 =?us-ascii?Q?EgsNwuMpQ9kh3liljdNCtq6pICNj3060OoVciu0cTZbrMatlsQJSRNLbR2tl?=
 =?us-ascii?Q?YAn96hCs3n0f37a/mfTApSn3iNjBr85yi//EbppbYPKybtRUWATpIB8tyugO?=
 =?us-ascii?Q?Pz8qx05HoxNffAWgtIY4to3xYXYU+15Cf4BuO0NpjTqImPCaKRaZcG0BG9Ab?=
 =?us-ascii?Q?1cEBCjN6ui/5A3nOdMZ8BcmCes1b6qGedy+6KWIvk4zyRH3oeWRJv4ZF9ZVy?=
 =?us-ascii?Q?NazH7dKgC5OuiGm/dhyDPGQNK8Lxxc1B+hiwipSXEV2AUG92jF4fGJfXJDtp?=
 =?us-ascii?Q?iumuWzukbl1Ps1v5z9G7uBaJpr0h6S4gJwloCDpdwE/2C3cqByEYzljuCDA0?=
 =?us-ascii?Q?V1vhihvtAZGBI1CG7ascPZHMQDZ6VHVoyev4HdLGqkD7+69Ii9KlW0b0kUYF?=
 =?us-ascii?Q?tmrfpNhvViG5SYk0MIJ2+APfTlJXlViv1leebtAndAYND8gytBrBo6QA1j1q?=
 =?us-ascii?Q?l6dud4eD7QYLzq5Y8ra/xxjltlqunRbpyC92IywNTOz0qbAiBg0Ch+CgD/WR?=
 =?us-ascii?Q?Er/xO7zMqjPlLz6Nh/qrn8ndTinBucPsy3edyk1Tt0FzhB+6eQZxNuXGU/pf?=
 =?us-ascii?Q?5g7RJg4YfSVVZaU0spyz5gZWsI4uTRN/gMojcI+afqp+5Dl46MLWWGNNnX6s?=
 =?us-ascii?Q?3ZX8NaHB9927V4KeJUc2voXt6z3bWNBbWYrlzUHAnGFuSZ8YHzQF+eLbzkS4?=
 =?us-ascii?Q?GMjeMQB7/bJ3H7W340Tv2BurXuVCFCvpMhS29bRVhaKC5CzS7dT0uElJbyEu?=
 =?us-ascii?Q?o5dqoCc0QkLno0gmxiTDa63/q9VVamiMeMIZDJTzNPEO7jAuEaMCeADB2Jgb?=
 =?us-ascii?Q?bbFJWKqGSiPn1uzhND9QTTp9rjmiRsiISo5qM76lDV0lEv6e9qd0QDBZ+1Iu?=
 =?us-ascii?Q?IxqT2hqRLiWAdIGzFRGy1fZemDb1PT/gEiW5kw7RYhWNI2RK6jhR8+WNI8U3?=
 =?us-ascii?Q?OH6nFyXmuCZGQ+81ADuxHWxA+NFBhlpDs8MLNUUC/qIIy8i7NU5YBYlyjMrt?=
 =?us-ascii?Q?wFUZZ6jiraXR0iyTv+bCPApxBLqb1lBM6umEBfChyh6YHWmqFooOrbHNMuc4?=
 =?us-ascii?Q?dguk98V9zmyfpYszhGTUY5nJ6s5lsGdzUx5jt4CssXXJLv00b8/cXx0T2sEb?=
 =?us-ascii?Q?y6xLTmzWhcMOtx5hXwH8cYDlvLDoBueH64IQSt7RxZa8p+sO25Bwx1zKbTmd?=
 =?us-ascii?Q?6vUa8uIXxVHBAEORI505Q0dEoBnl4RvHOFjoNQlbUtydyrDYLI/RuA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e53p9GKid9ecnWYSolldvcjdQ/SkJGL5ssy4U1pBW+JIRxUt3wtjsjCJvDV6?=
 =?us-ascii?Q?0OauF5e1ZbuM+gjGXb9Ehzg8ZIpVuq197BQg2OgQszExPC3AvqkMNJLgVmI6?=
 =?us-ascii?Q?k3WnErFNm9QgGEZ/NlLn3LSk5ABOCMnxKSgUBh0WjGx6ID+bccG55FHYM1EG?=
 =?us-ascii?Q?maIVgWyPez2AAWitvIcTzt+ILa1oYMkv44WG/PyMMu0IufotwHDnhIKlPDlo?=
 =?us-ascii?Q?ljl1C9R7dja6jL0Znv4dnNtMl6+Oqs0fuC3RFWksAK4LEed2YD2UL+XQmyDn?=
 =?us-ascii?Q?andaX+GIv873fLwc/srPeXGC7U5UdTeo99SP0odbO6rUPl+JfRMLtVIbaI7H?=
 =?us-ascii?Q?uYRONo6bKMkWGa6nIEyOlPkpeR70nS6gG1lb/WagG0u5gqwBgynDvg+FxlFo?=
 =?us-ascii?Q?6DxO9KDgWD7ad4wC7RLQozH2eZ5b42KHvuBr/lvxIaxUv32MOgYbq/mzIEGr?=
 =?us-ascii?Q?cvVo9mdi42aVUA1ujkDPU2iHstK8pXjJS8AKUzfN5DCbS7BEqEC+h1CsLStA?=
 =?us-ascii?Q?i8MD6amGPhMWPumqgk+WkHh6XUrnBUuq9YRLXLlAzksb/YpRThulOW93q3/q?=
 =?us-ascii?Q?nfFXtH3i7FEiwF2TPWblYFkul/HmdC6D/jL9Adoc5L6/oAp4RXqDRU5hK5n/?=
 =?us-ascii?Q?7UfYQ60dAT25vkLZmZMQmkbk0Bl+HQdsWHbr3pDC0Ex4r/WOFFla3oa+8l2L?=
 =?us-ascii?Q?3tSG0GTTZqwDw0nnE1Cmn/odTuWP2UmUxG+wTyQdbtG+Jze8WzjjWSBQcokg?=
 =?us-ascii?Q?NND8SKIU4y6UiWct5excBNJfzVJLln4quW4G20sFnuMsItFNhOHTjEeHW/ON?=
 =?us-ascii?Q?diSVRMx51F+6NAsxiIXQT/mg20YoMFjqbk8aGiqUyq4Ky7+c6pAew3ZeUJv7?=
 =?us-ascii?Q?qp9VInH7xi21vvZ3S3hyqfVaOBQFvtQCmVWgXS/MTg+BnH0wgZTQTEXegb2O?=
 =?us-ascii?Q?A/sf8dfv97Gga0HU3+v0GM3X74K+qo7VGyCAt6Cb8Jml7I4L66Z/GOa3xXbJ?=
 =?us-ascii?Q?+dyVzH2Y9h0/Qg2gb3oTvF7xRIpycRQK4pzth2/ZqolgX2yxD8Uy0npwjt8d?=
 =?us-ascii?Q?obNWOWx6zf1ibVRZZFA3cjZ/XjlszxpFh3VevOpJOPWPXQ7Hf23+OX3Kpll6?=
 =?us-ascii?Q?4i4wvIv+RX6Mt7WBAmAsUpKBCTUfu2ltAJS2Yn46pRPrX9lnH7E3tWWI2Dk2?=
 =?us-ascii?Q?93wefkDmIMqfSxK3a4W2LGvCnPnbTTJfRPtI90a4Tter2IMycx5bg/o51bBC?=
 =?us-ascii?Q?bbJepT8nXcyQ1OFoIIaj307O8RAg/7RboVz2YPNsBvWRJKqDKHVbaaZmKpc+?=
 =?us-ascii?Q?3lRfq4+uh73uJ7NkKaQfow8bmbSgf5KpGM+edR7hi5mhaTgPYDMvffBbnihW?=
 =?us-ascii?Q?sHZZyevux2RImwH+hDRPKkdFRTaZ6mn8cYZlNZkAx2XLl0vapNyeHqVfOCSV?=
 =?us-ascii?Q?x6cWQuTgm7uJf1J3WxhXUGh1+QfXMT+uRSYo78WFajcVSYxTjDeJp+sU1w4a?=
 =?us-ascii?Q?wioZAbOkaXpX4CMHLTeUIQL1xz5uM6JE1Y0wdVDSBY+yNFqWVnTe+v5eX6xt?=
 =?us-ascii?Q?m2B4N+CJwKqK313V7k97e0K5F0OxxCfbY5CHoY/x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb2bd2b-0836-42fb-95f2-08ddf6c9b221
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:40:29.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o/ER19J5wIWcIgluSQfg7QRpVFQIFlysb2H3XY40ZOu+uzan14g4wVs6CAMY4Lxmterv3SXUTVeVkCvA4MUgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9975

On Wed, Sep 17, 2025 at 12:04:21PM +0300, Ioana Ciornei wrote:
> Describe the two SFP+ cages found on the LX2160ARDB board with their
> respective I2C buses and GPIO lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v2:
> - none
> Changes in v3:
> - Moved the reg property before address/cells-size.
>
>  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> index 4ede1295f29d..1c1ed0c5f016 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> @@ -31,6 +31,28 @@ sb_3v3: regulator-sb3v3 {
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	sfp2: sfp-2 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&sfp2_i2c>;
> +		maximum-power-milliwatt = <2000>;
> +		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
> +		/* tx-disable-gpios = <&sfp2_csr 0 GPIO_ACTIVE_HIGH>; */
> +		los-gpios = <&sfp2_csr 4 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&sfp2_csr 5 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&sfp2_csr 7 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	sfp3: sfp-3 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&sfp3_i2c>;
> +		maximum-power-milliwatt = <2000>;
> +		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
> +		/* tx-disable-gpios = <&sfp3_csr 0 GPIO_ACTIVE_HIGH>; */
> +		los-gpios = <&sfp3_csr 4 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&sfp3_csr 5 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&sfp3_csr 7 GPIO_ACTIVE_LOW>;
> +	};
>  };
>
>  &crypto {
> @@ -236,6 +258,31 @@ temperature-sensor@4d {
>  				vcc-supply = <&sb_3v3>;
>  			};
>  		};
> +
> +		i2c@7 {
> +			reg = <0x7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			i2c-mux@75 {
> +				compatible = "nxp,pca9547";
> +				reg = <0x75>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sfp2_i2c: i2c@4 {
> +					reg = <0x4>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +
> +				sfp3_i2c: i2c@5 {
> +					reg = <0x5>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +		};
>  	};
>  };
>
> --
> 2.25.1
>


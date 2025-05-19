Return-Path: <linux-gpio+bounces-20269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E8EABB3BA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 05:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7A318944F3
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 03:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95651C6FE5;
	Mon, 19 May 2025 03:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WH1/iG0c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701801FAA;
	Mon, 19 May 2025 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747626966; cv=fail; b=JUYjLRsXNtitSnHeTChwqo1/ZuiQAPbKyqzGS6MyYqGaFwMn+OKJsUFyIyMpqc4nobJPT4N2zPPzcELUH4LYE07ec0F90gX4881KRci4/bBATBdvyRtLfP7Hyc8CfJctx/V1U8K9FZUX4etnXPwj6FMW2jEpdiuTJ73jDaAagfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747626966; c=relaxed/simple;
	bh=N4DBpa8ZraC3dGB2vIdR6xK5e5weYzZO1B/fL/ayiT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VSEGXPaDxc9y1clLptYNjq95Kz5fCdsNK2s81MDvJ1Uh75UPrjrVnpSk0I6yLwfoPSngfc93gpaGKiDF5vqHnPqBJny2IPxh51dxL3QchYUKw7ive7GLZ4oJPNJkro/j3qZN3cXVdDsEP4blHiRnz/I7/z+8Pp4EMtltB/MJ424=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WH1/iG0c; arc=fail smtp.client-ip=40.107.21.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGpTI8z6RfHaBakZWp7ufzzSJpuDCpqFVEX68sLYJ5CGQWqNDvLGzc49cJxUbMRpX2ggVLslEcMbeyyCRcwGsSF3JhNL6xOrWB/ORqNXLCCgeVJmJQIDsHwsL672XqXHEwOaGKjcSZuC+PncGdDkjjQJDqOFk6lI7Qjvh8KjGbfzKkqWGQUaXNlmYi1kcLwTlO/TaohL8NLoQ0l2v7gWdCfvDYj6wOFvre9kYfxE2QyXFQL1ysNL0B/CNAzAlztGtdmz1dwErrOyVfySf1eD24juePQ2u29LO9gjtXLFKOJU2zZgGazsGVxZhfB6EwlusUBWh+ldeLLXakUBciQFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4DBpa8ZraC3dGB2vIdR6xK5e5weYzZO1B/fL/ayiT8=;
 b=v7o0XkZlGr6XvrqXMN2A+gIivUJEbuupwlYMu+QWZ4tAmLQvW4dqne0U3lCWbtncWftJPsTId9+Fg5+uGnKaKsK6q66KIbZvq2CzylVrHDx7Hp+ISSX7VeG9CJ27xLG7tgfRzJVwDmtCU76MCmDX3nrqt6YZxgF03CNfknegOE7SjPIIMU1LeCX52GPWBv6qbvdAl42Ui+rSy+CNvwqiXBFUYTqQDeN45bfIb8S0EnaJ7GrU8tvxwYWH6U+AC3lmfn7yU/XzoeP8kLa4czewDjnyxgBl4b3n/TH1RBQ8RfZZkIXSkCcNrB2GVe2IW43luCnUMQSYC7YfaIjs+HDFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4DBpa8ZraC3dGB2vIdR6xK5e5weYzZO1B/fL/ayiT8=;
 b=WH1/iG0cy7K2W9L1ayM39jrdnmwBGjAgMjE+T0rWfxnF3k9QK5PjQZnPE57cw1a08sj0BapKy38Soopn1yy/gnAX1SqpKtSXMpfKEiAY5W4NAW3w7Aw1u4avhAxJdcM13jXiDiSzvPHVrF2YJatIF5nPo1roxeVkc0kYR0yn2/wBf+6tYgdvjqB331M53gOyqOCyUvvj6dV5ixCNovpJhAMHdElDTn4S6S9gwGqD8MUvvbTJcfzRGAcBplIi2itBi5qEqvj9jP+VlrjLF/JkQKi0DBY7fsYOVRaYdB7fjOgoeCpkN9HmA2wxnKRWnkRE+snR9lza2J4UrHGLgC/Xvw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7482.eurprd04.prod.outlook.com (2603:10a6:102:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 03:56:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 03:56:01 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Ray Jui <rjui@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus
 Walleij <linus.walleij@linaro.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>, Robert Jarzmik
	<robert.jarzmik@free.fr>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH RFC 0/9] gpio: make irq_chip immutable
Thread-Topic: [PATCH RFC 0/9] gpio: make irq_chip immutable
Thread-Index: AQHbwJ1nb/0G2eJsxkOb9YYTl6xZ37PT06KAgAWOSdA=
Date: Mon, 19 May 2025 03:56:00 +0000
Message-ID:
 <PAXPR04MB845950186761960AAE5A472A889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
 <174732137152.17517.12381683522631139304.b4-ty@linaro.org>
In-Reply-To: <174732137152.17517.12381683522631139304.b4-ty@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PR3PR04MB7482:EE_
x-ms-office365-filtering-correlation-id: f0145e01-b465-40d3-4696-08dd968911d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018|921020|41080700001;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jXP5BtIhF4B3g8EHtk5AlIroPChvIYQzcIBaFGAUMB+5dNfFyPL3wdToqIyI?=
 =?us-ascii?Q?1Ptfg/GQzVhK9lo+LGmo/nAVzmmYX0NrlvIW/Zh5JELy7vXO44J9YfRoVLSu?=
 =?us-ascii?Q?2SmbcEbGxTD2SdRI877etU6J3QUpko1N0gWdTwVCM5rH4exc4mNqYxX0dqd8?=
 =?us-ascii?Q?0uPHD5SLfh2gZmZ71Gg0znCbl0YCQc/+w+Dc4mALTJpxB09/5pWP+y5+DzKT?=
 =?us-ascii?Q?Z+d6y3XtUM3WvLV/Ha8fpZl/n45Qj+oYjKvhHKfKMKQ1a9yaYRJsgbWGW0tg?=
 =?us-ascii?Q?UOtOs4BsNOAroIBvbj/J2aD1rNwvA7mEB8McBCZFegq76j1vvlKEJpizEJwP?=
 =?us-ascii?Q?7/Mmnbc2o6akipAlZZC1o8aWYXjtbIxEMzFeNN4xl7gbyoAOSefKcgqMMiNc?=
 =?us-ascii?Q?UqDnevDXzsIUQyjqfXqJ01kI0RgR9oEe5rPZv8DI8GREdBkco+HTZ30MNEko?=
 =?us-ascii?Q?p+4b5ibVKcat0mYsMx+yfv4Hns05XX1SVnqHP4K3FTaMVSLcXw/5vWLHM/6E?=
 =?us-ascii?Q?1LxlyIk+Klq4K/R/z0KtV1PGq0Eg582aVXnevUP0Ds7vIuFXG5TXJ+YrZxPf?=
 =?us-ascii?Q?w9Uxwo3DSHJNqRYneos3IXjlB6gCkgVhrhK9tx6xRimuLmvK5vyQVvqmWX8W?=
 =?us-ascii?Q?a8ebhQm64YCT7alwmTXZi6HmoKhf06HGSp1hzK5ttvwoGFGbZg10+i0a2N+X?=
 =?us-ascii?Q?PU/nkl6jil71DHRw86q1TGJXQABUQ5qHrlW4Mfz3KjBOUHu30Eo6Jc6HjHk1?=
 =?us-ascii?Q?mMCaS6XyZzU403E47a+HAB3gtUC5vvyPL0263aA87GW6vEpEQ+j9kDbduq5g?=
 =?us-ascii?Q?ntol3xRELHpWcLC+oGteQAuV4f3EpiU8yL/YQR/Elx+wHzFS/JaHnxStOJEl?=
 =?us-ascii?Q?cifMGnZBsFiV7OpYphubNJ8172H6RjuonJuZkix+4OrPwuNTEdD1fqMUERH/?=
 =?us-ascii?Q?y2CXm4f9tvBwZhrZziD8OmZCb8aVkEpPYRyveHVwt4V69zmcvpRiq4o/SBWn?=
 =?us-ascii?Q?HLC80HZRFBt9Sxd7UrurYOCtZxyEwaeUgTvt+XiCCHRnyLe632nMlGDVp7J7?=
 =?us-ascii?Q?z3zRQ7uv0gOLCwkGj1cqlo3azw72PSnwRRE/R6g29MNf174naehUNbEwSPFM?=
 =?us-ascii?Q?J8jV0RqdhDAKbDXq7dxQfbwGRHCfhBnedSDP7cmJxCcx6mbLXPiEufMt2OVF?=
 =?us-ascii?Q?doFEXeIZh+DjItay2eHxf55LLAcODq4pzZNeo2Df/dD7ag9RCs3KtdBxEWCn?=
 =?us-ascii?Q?Su0Z2tsNMgvKFQ/sGM72u7TYtQmeFxHn57qI9XT8KxV+4/kQRVV/zARNZfq+?=
 =?us-ascii?Q?pACHg9VLUVJ7YTaR0yAkWWDEUNAeZFFkkNfjDQzmUgBKqqmLlr4zi/Y3c4lM?=
 =?us-ascii?Q?Sh4kpQpRbLfVM6aoAbwf9njdoVggeXioQKQc+xzDcTlBseeQYB5yIZCzwymF?=
 =?us-ascii?Q?Sbu/IBsntM9V0fxioWbRdIsxY/aFg005KHG06VT+9hDnS6L880b6IZLslen6?=
 =?us-ascii?Q?A4ws2sdSm+2B6un+8KPsBku5L43Z3/3/OLOYKSek92E9M3aJLxswvW0jAw?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018)(921020)(41080700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?65K/eaF/hp9JIA/3zZ5eNpzOy9KIqQO5zAGFz76YcRK4+0CYsM5JX2HkjkC1?=
 =?us-ascii?Q?a5uXL4iDU+jhHSKxr2E+Nz+in5Sng9ZInUYdV9bhtl7whoFI0JY5WqZmqy0j?=
 =?us-ascii?Q?45YwB9At8rjK7JEPp+lg6aIDORWFogwd4anQKYBfO79SMV6TIlfFhKZS9LvN?=
 =?us-ascii?Q?jKROWi8qxnjT87beV9nOn5w+7j5nwefp7wNcC0JPMjQw7+V+wWSiYmyvU1LU?=
 =?us-ascii?Q?FgRHqnPbai1QCkR48pl3fL3fytW50zyZjy+04D0L3iLzswoiE2yPANrIhEsJ?=
 =?us-ascii?Q?8U36j9s8F6qcmdorXEIZAXPgz4Nw4yKBmyq271hfwYi7dJRhzN4Mmkg6Q3x8?=
 =?us-ascii?Q?xs4F045/Vliw0k+YH2knrymhKZEzdwf4xDwjlWi/bDKFKHczrvby8AellW27?=
 =?us-ascii?Q?5WhVic8VKR8iWEXl8U/sQqus1gMMW7jRECq3Q6mgi1W/9y5Y/7wUqqFDI+rl?=
 =?us-ascii?Q?5Hs9rT7b50XUJK+Dqx+ltidDycbj/H6tW3Zde5ebpyBOnhenruzb7sQa03OY?=
 =?us-ascii?Q?q5Pbqb0QkboWSvFsDXwz4ePcdEEPpd+zcUScKkVmcH34P7bdTUirFegOpGUL?=
 =?us-ascii?Q?CLdFCWTYb0h5nK6iY7GwP0Xq3Ddl6gxqK7fpGZJLCrmIVchWRrytSjyLMVAT?=
 =?us-ascii?Q?nImbO/V01Ne0Zgbr+7dqCxhAG4jPm89mveAch7eZydcWAdri/DuSNSaF5GgR?=
 =?us-ascii?Q?8CpvTe6aSjSgvaqyrzMAk5hHuSFuD6gOcikQIuxxKv1irgea0/dtsRJNatSw?=
 =?us-ascii?Q?elN/sbDTgp1pdWXKIAGfAI1BXUosULMBcYuGiL33gRNUFMiniJ6ic6mvJh7V?=
 =?us-ascii?Q?XVKECD98cvJs1O285YMidpxzdQzLl8LJS95SIiN5iScOkijaLSlVtUbIhruo?=
 =?us-ascii?Q?UXpRx6RZSQHRixPe5q2zH5E5ABnJ1AKY3uUxlo62DYyB7IYW8daQ0uTsZgM4?=
 =?us-ascii?Q?ZwZTOgsq+h+DpHRZlpx5YPPIFAdclDG+iv/mF36v5C0JqEiB3KzQmdUPqi0U?=
 =?us-ascii?Q?g2QCTJYISSG/ZT5aXSvQzh72L8NE3Ero+Je/0NNGyUAvrX1HmsbuvVBTmf1E?=
 =?us-ascii?Q?Sh4YLLO5qo5sgqeTwEChc4s5IblMYQ0la1J/+mihez1kfvS4q3ZLmf+VeaRi?=
 =?us-ascii?Q?YC5YicDDhCvcD2fTVFveHWIS2b6yK+pP+ei5kWszNOKG5tH+AOIH4M11NU7/?=
 =?us-ascii?Q?OTF56vqYr5zqYjAuuvnFDKTvaCjUXt9BOGS7xUngi6VjQ0GjT41Hk0rajHCe?=
 =?us-ascii?Q?G/+it0VePdNeZL9uf1AGzcc02BanXJe2Q8qw6j3DsVqJM/kxRIkvaY+A9iHR?=
 =?us-ascii?Q?97CdhExYZvnfz8Jw3XvvdotIa9C8NWTn9RQjGSJAErmdgxvIsCTdvMak0jXQ?=
 =?us-ascii?Q?jo7+11dNY2Ej7Qme7I+LlfoMcflagb9L7gkgxGQs8BdaO+YibvSoV8mM7Oyp?=
 =?us-ascii?Q?tRUYkgq6dqEGy7Fex9FmA5Irmfqj2UiFwCe8uPvgXOcyIQ9F1a3GF6ObYira?=
 =?us-ascii?Q?DOx9DnsncCUjvNyiwrVJJwN0edfod5dRAF6SCaKxW5YM5MR1irFfp7AM2I9U?=
 =?us-ascii?Q?dGUImcesWStSeDBdphg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0145e01-b465-40d3-4696-08dd968911d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 03:56:00.9945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPRg3r/V3ihsFA5EJIIPvrT8qkGm3nMjjb+7VcLkhSvvvoJrS3YHt1jRTpfhvwHuTp1TTj9cOAPovnuAuZUdaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7482

Hi Bartosz,

> Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
>=20
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
>=20
> On Fri, 09 May 2025 12:45:31 +0800, Peng Fan (OSS) wrote:
> > This might be a bit late to post this patchset, since it is almost
> > rc6, but no rush here. Not expect this patchset be in 6.16.
> >
> > This is an effort to make irq_chip immutable to elimnate the kernel
> > warning "not an immutable chip, please consider fixing!"
> >
> > The major changes
> > - add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
> > - add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
> > - add IMMUTABLE flag
> > - add GPIOCHIP_IRQ_RESOURCE_HELPERS
> >
> > [...]
>=20
> Applied, thanks!
>=20
> [4/9] gpio: mpc8xxx: Make irq_chip immutable
> [9/9] gpio: pxa: Make irq_chip immutable
>

For the two patches, there are build failure
with powerpc-ppc64e_defconfig and
arm-am200epdkit_defconfig=20

GPIOLIB_IRQCHIP is not selected. I am not sure
how to address the build. You may need to drop
the two patches.

Thanks,
Peng.


>=20
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


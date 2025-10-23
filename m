Return-Path: <linux-gpio+bounces-27499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61ABFFA62
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 240D23AA5EA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 07:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A9219C54F;
	Thu, 23 Oct 2025 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lx3vFPBD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D022236453;
	Thu, 23 Oct 2025 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204995; cv=fail; b=h8nebKovYcYvCwQtduZYMPNssWaO9VkiVnDUUmu3qHde5BF/M8Q6vjcoKzMG6nccN6LpHQvY/oXZgsrx9KtnB9Co4zHMBIG/qCFbT8ITs2CVD4SpN9tNKYgEJBE12L6lBG24mLQuo18msAuonWH8jiXz/haGkXKOw/elWSxRpvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204995; c=relaxed/simple;
	bh=+dLX9i7t15dudSdTRMGbf64bFclaR61YDg7Ixw7bcvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YeiuS1ozOT2KoTxG1/dXDV3K4+qd30/o0wjmbSEkZW0oVBZvgBjf1DkDDYgofGLnyuicCzX8fJBuvUEo8+ZKMzRI8y/ZeeSxyKE0htWvqjDToU5M4IF7AmhlMByINhPgaroAWidgwdE28/4c0Cfljh7gnD7Gr2s0LuHVfcGi8vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lx3vFPBD; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2v5AhoDJHjoB+c9VQxiQcj0FjHRiJTSMpm/8qUdLpBj9rlDSRKJxyakE4TL579NkHwOLGRoyw+HJufAvyFzaKdfIoblpRBaWcnnO3BXbx3vzRHeEQh5vAb79IB5pN0qcKtWuIZJaMqrHBohiifxuwxh2CpvlfddWRF6JpbTVfQTAfmYKskV4oVuyoOOir7r4ao6IeRKIPRb00h7Yp2JIdJWUo+in7eIg4OhP4DmsWi5Ps0VGbfR+z4HGuvTfOleyRHtVIkjwX0uIiKfzb0maGMt4m2syVMPktVTqqPH6aPxCHF6LUKE3pquoLO9qyl5NZDIfNvM+g9Vkglu/NBzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtBhjVDce1hm9r4D6UpERzsV3jQwbcwVLDaN8frgw5E=;
 b=bbVdNHb2hko7lL8OOQKKqhomQv10wh9RJJjb8Vyy6mu+uNKcZZV/4PNdoWCAyTAMv5EMSbkMeO9zKgE8xtkKCjxSRPrP/vRFCN5kqcyRPYCb5pNJYRpZXOFHd7GdGnAAcHHu1LdPTOrCtzb2IHXHE60QzUwNV17W9WYtjW9D+JUZUYWPk1t48NSzC5+DKcz24nHDL0ZDLtTU1im+8sc9QK/04pJxV30aa3op++VcM6WDflug52muH8m0FgLvO4y3TceC1xY5LSkqek4OjNROTgun0nHtdf7rUXhQ87qQ0LIG9o3yFJpEQD8y6yq1RJ8LUK4l3ezGxz4PNgP3flBoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtBhjVDce1hm9r4D6UpERzsV3jQwbcwVLDaN8frgw5E=;
 b=lx3vFPBDAqJZ26TItg2nQFy2IVjTYJ/C7PLdVMCp5s1nOkw2Gz6GJw0Q66rU4k40UfeCN1Biy4gv0o8Bs2N6kCgh6QqpDtj7DezQbFh/Hd/jvDZWf6YZO9d7Pf+IYfSVEvSreH0WS9BRmlVDOgaKOEiazktx/fcZxrmqreOUufu4fSH4hQvsCWYyKS42fw7qvQ/MdkP3O6/ACxaWgdlY/YydApmUiHUkCohMC30dp9rZglxeWL7wIn20CiqL28OtywrSD2J/aQtD7p0ijQRf8K+CT0KThZ85eO20lQGDt2srHjsK2a+SalG79XL7CgcCNVAcHVdXhroBHSnpE2mYZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 07:36:30 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 07:36:30 +0000
Date: Thu, 23 Oct 2025 10:36:27 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Michael Walle <mwalle@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] gpio: qixis-fpga: add missing module description
Message-ID: <rmqpvj5wj7bvxrplgxrcxruixedpgewid4mxwhuz7eq5ttt3xd@vztkiox6vee7>
References: <20251020072028.21423-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020072028.21423-1-brgl@bgdev.pl>
X-ClientProxiedBy: FR4P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa4aa70-80cc-4f53-a7fb-08de1206e208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GTzO7gtvw9/9TD2ICMoXQ+Gkrfnh9noiSlhBbEx6InTI7wdw4mw7WRpF46ka?=
 =?us-ascii?Q?OHPYNjoUC+x0NiDSko7b/0z+KmjC3WqibGAlsfwBOM1+P6bKwyYHuZ+mILWS?=
 =?us-ascii?Q?GCUDD1YvB3kiqI3nq6dXeY7k2h8o5hR+paqKhK8z4BUV3lt6gPb+725OIX5D?=
 =?us-ascii?Q?hU6Mq/4nw9JPmg/KidPjv+xemcXysTgSAESSWtt5PCVckDM8vRlXSooZOHHJ?=
 =?us-ascii?Q?7zpojUyniIOPu+oMalNjlR/+Aci9fFoKAsQviHAOYA96lwUFReh9QvqnsgvF?=
 =?us-ascii?Q?280CpSYDbMuqHQnPlBEwGgkVQaoRkYy4W3rsmy+38Ob0IjCGm2zH/afXnmwZ?=
 =?us-ascii?Q?/3+rsHshDtb4uSUBxEDBHUTVIi5Eak9S3Xaijpn1a/0dXihwiI7JEtjGkWgI?=
 =?us-ascii?Q?jkFYG5b/42orhtjuMHv3UV/Hf2wu/C6gEts03WVO920Wj0uCneeoDdi0CS0t?=
 =?us-ascii?Q?JHV/Mgxe8eGZu9xYhlmfP4AVQVBGqrm0KR3tu9BvpU0vhSndZ3JQwODz+jaR?=
 =?us-ascii?Q?G406Wuf/BFO8SRfa/kw/ttvwqqsZ28e2d0y8E/yGXU7xYjNjRr1TIEIYKijU?=
 =?us-ascii?Q?gJikx7li4CA+cfzWaJj6S9UoZd/zM3UdNbRSzxcH6EzpCH8zvUjx/IdV9Ipt?=
 =?us-ascii?Q?267lV9J1smS+dtMgDzsPXzKl3f97FXclkt7Xks+S0X27CLvKetWhWOgjXWDT?=
 =?us-ascii?Q?HjfqDlrPlDzd2wSGXErd2N1ZBA6llZx9uLGm68udETIsu8Y3MTqTj9osxCiS?=
 =?us-ascii?Q?7GyWLZCLDvUDI3+XvhqvEKz3UeYsb45kup3q6lEvrg9ILTDs8Yvx0nf96280?=
 =?us-ascii?Q?1ayc3FeHf11JXay/7j/4Rl/fxw0p0EvVgHsYFyvBBlls8a6sd5njM/HarBl5?=
 =?us-ascii?Q?TwNXvpW4QbTtoa4G/veOvzGszNGUlW8Zs0BAmIIdYMWrfJoZNn36OdaUDQNt?=
 =?us-ascii?Q?1Ma+7wfX2if82QByV0tsogmwMkKg9qZ86VKMeZSKA9zwEdJAe+8MVVLMNDJu?=
 =?us-ascii?Q?jIzlQ7NqlLtlYoZwOlLlWGsYs02Hf9mcbG/VRniS0QCgpM0Zx7NaooFBA/d1?=
 =?us-ascii?Q?UyPzTIJupT9ONXSF39bMYD3Fha3US8/XKKebgOOIHXQvUF2rAZlt2EkhhXzz?=
 =?us-ascii?Q?LsVYZS3DPZd+H3QlUqIMiIE7XN7d499OdcD8ov7/6l66d5CLjDO3cxW2S/ej?=
 =?us-ascii?Q?d4x6hm3gtvCWAJEUvmT8zVBlz2J6J24/dru10KvCYpYyI1TOyCYU3gBnCIAX?=
 =?us-ascii?Q?8N31Pn+Tc2Yp3I+BaAoqcgfizX6O5kjng9RB28wAbnX/fPT2F0C07RWHzSNM?=
 =?us-ascii?Q?+7pRGW5Ql+V0MjLj1i8z8doWmg6gZphEklO7ZUeakMNRaAgT4r0Jomay2HWl?=
 =?us-ascii?Q?mmLZD86H3hdFR8fBMcgnVjLzLL6LxPtA0Q82CHhS1RMoCHHXcTn7DVN0+DmR?=
 =?us-ascii?Q?nOL+OFL0rzw3R/dX7mCsSklUp1JupS1L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tswty7qqWAw5ZWgnkzA4nbQ3l6IUBZel6NxEwd4MNUkfMF7dk6svF3VvyKgZ?=
 =?us-ascii?Q?IzqdoQ30axd04R6u5et6+/yCI8RnDKQPvEy2B+Ep/aeSk53bATqOM8VPM3RU?=
 =?us-ascii?Q?Lk40oNGQ9LS/RFybtQFDwxSD3Kqi+NYiY+8SLsPyOJ5PCNdQg58lfLqe7+dS?=
 =?us-ascii?Q?ZUK0JRqeLu8DlNPh5gDNJPwoCMtI7UiqOS6s436DyDTgBlDiSFLcoPZn0Oez?=
 =?us-ascii?Q?hnUtEc3yxE43ZpFPnfoEXc3pLKro4lyt9sM4+QD0AUU4qf5w9fKl33bkLMCo?=
 =?us-ascii?Q?Y9odYc07t3EZPnD8cUgiOYmgaxF3Zanp/X78WzsFWNJq2OPH/LiVsp6I6D2k?=
 =?us-ascii?Q?Nm+Lh1nQcuhBkarzNQPgiMmJh23iTlySm3cD+E6T9Q0UeZAejk5qONILlsnu?=
 =?us-ascii?Q?vIZq7G6gHt4XO4arOYt6MoLuvbTsz83B7MhWLxwwi0s+gdmTpOU6JgYYPF1F?=
 =?us-ascii?Q?Pn7KXIR+SNa6aca+i0rwbxZE8Cf7ruadTS5MdqQr1qTusxg3Sj6TPAddg/yE?=
 =?us-ascii?Q?dysr9gG9vfFglP6E3sVzlrXgud+JmNkufdd+DlKFGrp6sth7L2Bhiy4AApIZ?=
 =?us-ascii?Q?SuN2x4woC+mBJN14PsUA7oQ7s51PUTNa98d8ufELm/06Cscim52XXqG5OHKm?=
 =?us-ascii?Q?FPpHJmhkBAYPf6DSgK5C5J+/kigsOss1gLnJY/KAN2U3r47POhJepTkYdXaK?=
 =?us-ascii?Q?M/Xo3jyqHFn3NZUd5RdsUv8xWmYN7SkBjPXGPA1aMcBX3DBmuwaOU5ENW8Vh?=
 =?us-ascii?Q?Kf1IqzhyIdvZ9ohV+c9/0lEScakbHaE4q0Bhh1Xq9GuviggSrLikWwbd1NqH?=
 =?us-ascii?Q?yOTvJUkBEUzi1IoCS2vpxYddCes2X0RHYKm3Sfnt3tKocwv5MI4h7uT28UXW?=
 =?us-ascii?Q?gIUqO+A9zOdjYWXac2az/LtdusmeTUctT1g9pAKSk0XH8Kav/l5AaawBRddb?=
 =?us-ascii?Q?REUBYHjtV4I15+6QbwJT+/XlayDJkoTTUHn44YHhmDYy7+AYltd5iA0yc5qI?=
 =?us-ascii?Q?pwWddzabmmpohp396jh97ss5saEgX0hT/FSrS7UOpxw1soV1MtJhhTJGQR2c?=
 =?us-ascii?Q?6/7+4jA3A0QvIqGds1XRIgjABwfVnAqb8GnL1tfFsQ8PwwDtVnb6j1iWGuHd?=
 =?us-ascii?Q?GreRZSrPwQG2dnSDxzlS9M22kIjbxIz4tzf/o5j+aXtojowrIq9SXAXMDTUP?=
 =?us-ascii?Q?6Nh9BjSldF4ocsDxZBd14wYbw0eDnXBM3Zy1ZX9V4sfth0+l8jDLXPsAQQdV?=
 =?us-ascii?Q?+9tQ+pJcewV8uR0YKHzppGdMzaABtMqsjwt78hTIZaL3eYwuXXVqTzRPw/1+?=
 =?us-ascii?Q?w4lgvgRCQ0bS96qvXAM0yNLwrGZCa9FOVTuiBOp06e+v6H017bCQ/7OOY/K+?=
 =?us-ascii?Q?MJDLmLAqGLJyYbEB9Qbm8Hps5vFVA0bWXE/GayA/8FcMVo/PLCUd/4mLuO5+?=
 =?us-ascii?Q?f4qimPg9IJ0ywMXY4QGA3SxYBF+QBINCIsIwYL/nVZrnFUY3t/tddQhI8poP?=
 =?us-ascii?Q?CBlnbEU/c3rhJPBNEQPyKL0fflaZGzEldlR8naC8yne3bKy4VWcTnw4IPN8l?=
 =?us-ascii?Q?km48uei6yqkretRItUaT0GgNBRdTk61y27WNGnYT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa4aa70-80cc-4f53-a7fb-08de1206e208
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 07:36:30.7556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glKOnguUQDG+m3UXU7iibwBp1xIvvCj3VY1gl9XREQx1Zux3X4AW+hPohJDMXfOopzz7p+PgiNUkb9tDVqsTRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185

On Mon, Oct 20, 2025 at 09:20:28AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> A kernel module must have a license and should have a description. Add
> missing MODULE_LICENSE(), MODULE_DESCRIPTION() and throw in a
> MODULE_AUTHOR() for good measure.
> 
> This fixes the following build issues:
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-qixis-fpga.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-qixis-fpga.o
>

I am extremely sorry that I was not able to send this patch myself. I
just got back from some days off.

Thank you for handling this.

Ioana


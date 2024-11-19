Return-Path: <linux-gpio+bounces-13099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6049D22DD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 10:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E287B23229
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 09:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580731BDA8C;
	Tue, 19 Nov 2024 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kun/PVna"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8101AA1F8;
	Tue, 19 Nov 2024 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732010236; cv=fail; b=UrmbBll14usxiVBB9CEtXyv84iuiiW6UcksgUjvWhky8fH/7Ywc3bvw0m18MHRbIKnRool2Z6papfMRfZtEf+ksPBdRHj+EdlMNmyMtNnjLtBb6/Q5BRrULovoV5EgkwRoOrGPofWcX7e5nN2C/Gv2Tsxwr8sL4VFkUIm70FXDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732010236; c=relaxed/simple;
	bh=GtpNr4xkXtLUfl4np+qAMeBDVQBMqa8nuYAn2RiCUlo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UBpgdXFv2YM68oER0myupG1zPRegMTYl+QOY5To+EjFLpYgznwnA8uAWVVVRPyQhMhrVtEfM2rOISEHswMwY6GrEdZjmDbdSB4YicAhVZdqkGJP6x4fU4I+yW06kAL8SD+t05HsZrLJYVIya0NR282gHTRTJxvhGCvxRGg6kceY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kun/PVna; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7Z8qS+t++QKHEE9H9iDXdxJygYBm8acUJtkfRtXPcMuCcKhcTrTJKvJSTLyOW3XyAZhbFkPQ/iYJvjOMF1UvJ1KcSFsDNNqbTG7cI00dX7YISr+zGsrxrq4/SJin5GmENaqraA1cUHUcHnh+WER6Myy1Qm/NMYAcpIMih11ek6F1EX6Z7C/WAQQyhy16UOQfL2vL4YpuJDhub+qj9dNKkRIolk3GBI2OSU6pX4Djpnj7x++dc5CpWXJDtChG8ZTmGDGwFNx6s00jYzZTAN7+XqycIuIbnHUkn0B//JyjdUouFHznXKXH9ReTPpBMErvQEwWo+CWE97rpoLj/eRY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvEH3irLMRxmIuj0YCN/fumEl4x2MW0SKR1mopQ3RXs=;
 b=G01pT3kKrbigz7efc/ztaFOodMiY2jphAMfHWaFUynZy3yfXEavz8rLvzAdKSlxZDg4w3YZdErKMqt4Wb14x2joj4xAZnZV3wafLGPN95Dph8tK31RNXOzzK8q3wGXvLsjvBbTXAyg7EhuYYsMcuQJeiGWknGqOFUihheyuFFQTYV4lEzJP7ViztwvPQUbhtNeDGQzZha/5aVorYDNtSC24WlVYb7GB5AQADEO2pHXk6RprunFIaWjAFlaMaNdKkMFhkjEXDJimJq6aGj6zP+COI5bAmirZEW0BfLQHhJQdf3l5FVQlsgj6vLk4WnSeTM9TgjCl0H5q0IsXmtg8Xjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvEH3irLMRxmIuj0YCN/fumEl4x2MW0SKR1mopQ3RXs=;
 b=Kun/PVnaUmm33wI6IzeyKpz+RrzuWpOm1eo8ACtQqHhVb960BVV7DDEw6r/cgHuIBL6LF0jcPUGCBlTHJUJEHV/VYd8JvMx/wnhMa/wcOzkWu2JOwGNED81BbLR48R7IiNm+nStjRUeUsmhvNdMW23di3U9OjNkTEAmE/J38aT38AT09SimO7/xKD8nGrZzvMRLDXf5g/FFTIqQCVMVRIzev59Xg+Boj4hRGIFDsRqGRLoU8DFsyCI5KLuWZwxSlHFaIsKAPQD57xslA+7OITqMobBupLfaods5Jxazd3JAIIxIck4ik0JniK8TGfF1BK/gm0kd+Rzl7HgwPnD7A+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10845.eurprd04.prod.outlook.com (2603:10a6:150:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 09:57:10 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8182.013; Tue, 19 Nov 2024
 09:57:10 +0000
Message-ID: <34ec26f5-25c1-4510-a4df-caffb75a3d9e@oss.nxp.com>
Date: Tue, 19 Nov 2024 11:57:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] pinctrl: s32: convert the driver into an mfd cell
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-5-andrei.stefanescu@oss.nxp.com>
 <2ccbf862-2b3e-4c08-b6bd-d9571e88a675@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <2ccbf862-2b3e-4c08-b6bd-d9571e88a675@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0302CA0035.eurprd03.prod.outlook.com
 (2603:10a6:205:2::48) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GV1PR04MB10845:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c02705-4872-4605-8fff-08dd088088cd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1haazZ4N25WT2tOR0lkaFYxR3I5UUhBbWtIS2x6OGUrRlpYS01kY1JJV1lZ?=
 =?utf-8?B?bTJhUXFsb3Y0NHhqdlpZbVBSUFFnYlA5djdpVDBlS213cmd6VGtoa2h2TVlR?=
 =?utf-8?B?alEvMXJqQndCN0hXZnM5K3M4b1NCb0owYUFrMDN2TDBXZGdRU2RVbW9xWmNP?=
 =?utf-8?B?ampiYmtneGhHWlIxRWtCSnVWT1FiT3M1SVpFdGc1bzRBc3puTzdHbzlPdGk3?=
 =?utf-8?B?ME9ZeTBQQm95QjhVU3dERFd3SG5ldkpTRmJuWWgxYU9RTC9lQWE0U1NFWDZZ?=
 =?utf-8?B?VWJsTkEwL1QwbnU2aUtjRkllSWV0OVQva1kxeXJlTnMyOTkxVjVRU21veS9D?=
 =?utf-8?B?d0pxN0xNUWpzZUh0V1B2SGpTYnNWaXpQWVhXK0s5cGt3RDVuQWovRGhXcCtP?=
 =?utf-8?B?bmxuSm44UkZMTysvc29FQnRjM09Wc05Ubms4MEQyb0R4aVl2ZVppbSsyVnlH?=
 =?utf-8?B?S2ZwUG9lN1ZmWm1uZjMwNFB0MUJIaWo4cG0zZW5mOEMyM2pjVUlEQ2VIUnlp?=
 =?utf-8?B?YzlqU3F3MWxDenR5aXpzZ3FsQkl2aW56bC9LdmRXc3ZRZWlveGEwbEJkNGpK?=
 =?utf-8?B?Vk5jSER6KzJ6bi9RakNJM2cyTy8yOTJlbmQ3eTlsYzU0VzZPRThQbG8yNURL?=
 =?utf-8?B?QklGV1MrM3l2MWQzdkM0NFpkN09RelZlYWZwMmZqdHorV2swSXp0a0hiNlg2?=
 =?utf-8?B?Y1VHUHp5Q012b2NUelNZZG0xT3dlNjVPaHdNSHhWVVNUTG5uTXhvbFpyMVZP?=
 =?utf-8?B?dXhJdHVkcmd2eXRCb0swQjRkSFVCbVFZRTFINE1wNFNGK1lZMFRFWGpUTFBv?=
 =?utf-8?B?MjE3U3gwWFRpWEpISVlweWxUaktRdUlzQithV1I2Y3p2S2UzRmZOM2k3U1lm?=
 =?utf-8?B?cVArNE51WFYyemh6NVBUeTVHR1p2eGJiRk1DTSs2ZUgwN3BJK2lBQWVpVlZZ?=
 =?utf-8?B?ZFdwQm5xWWpVRmJudkFCYkkvU1hoMDFIcFc0ZElIYW04WnVNcGRWQ25xcUhq?=
 =?utf-8?B?SHBEQkNyWVdaeGpIbzNMMXlHR0xGcSt5Ym44M1NCSkFvTi9rVmkvMk9iRUJU?=
 =?utf-8?B?SCtTZ2dZTFh4SytnbWZ2OGViUVpTL0Z0QXZhVzkrRk55U1M3R2FlQzNteVNl?=
 =?utf-8?B?WHVQaUZVN1I4amtLdU5CWGdjVWQwVHFNNmcwbk1TMVV0Qy9HTjgwK0ZIa2dy?=
 =?utf-8?B?VVpGdWpERFdaUXgvUFNHOVlBN1dEbnNZZHp1V09OS2NnUnZIMjd5aEJ5UUdh?=
 =?utf-8?B?eit5NXN5UjlzZldPZmJWZUIxcVZpandzN1o2T2krek5Rdk5jSDVQd3RIZWpM?=
 =?utf-8?B?eDE1MXNaKzUvZ2cxRmRmaElFY0N1VlZiNWhJUDZZTng2MEh0dGR0aWxYQnJ2?=
 =?utf-8?B?WGxWMStzeFZpZUU3MGdZbWIwZHJTUVoyenl3N0w3OFdUMVZoOG1Lc3J2NkY2?=
 =?utf-8?B?aDIyQ1pMYmp2bzJtUld6bWM0ck5DSzJWWWZUeEcvQXdEaW9jVU4rMmlIdEtG?=
 =?utf-8?B?Z2pUSy9MRW02R3dOendTLzF3Tloxa3BmWGo5VkZ2NGh3SVhXcGxlaERLZnFY?=
 =?utf-8?B?bytBMnhpVm0yQWVKWjNjaVl4Y2d4T3h5azY1ZHg0ZlV3Y2lFMEpXZnNoUDh4?=
 =?utf-8?B?Q0lXbDJUSXF5TTdHMER0TFBiZXlvYnY2anNsVHozTWRQeFlER09jaHJ2MWpq?=
 =?utf-8?B?WTF4NTA4ZGxrRkFNb0dRSjBQdXVLVEFqZ2pXR1FGYVUzZWhXaEpYNER1Q09s?=
 =?utf-8?B?Vk5YcFFPWDFHamZ5aW1tYmZhcVRLOVM5SkZiZ3VHRDZOTTF0TEkxb1RmNTRJ?=
 =?utf-8?Q?qYcwaJt622NTSa4oL80ojL/z8exnhyMyFW9to=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCtRc0JhTDNFWi9KWEp3bXluRFZJaXFsYllTRytJRVM1cUQzYXJmeHlWclo4?=
 =?utf-8?B?cy8wVUNxZWcrbEsza2w3ekp0VVB0MVhYL2tWZDZjdTE2OVh1YVZxVjRFYUNM?=
 =?utf-8?B?VllGNEU4Kzg2d3Q5ajNENi9zaC8yU0k1K3V1WlFkaUlHWkl5cnNSNU5Ic1RF?=
 =?utf-8?B?K21sL1p1dWpmU3N0LzFucHRxYm9ZU29LL3lXNjdXN2NtcXlKYnBBVng4Nk9L?=
 =?utf-8?B?MUdnKzRUVHkyQVZBbEQ3MUVIS051dCtZSmpxK1Nsd3JXa2FxYUJsN3FveFEy?=
 =?utf-8?B?ZDNrbkIyQkp0d0ptWGVtT3J0dVJRMzlOcnFUWjUvWDF0U3FRd3hEOTR4OE0z?=
 =?utf-8?B?TUhwYjRMai9DUG85eHRzcXEvNU8wRDdKdTl2aktUSkRnUUlUck5uRnFYYW1q?=
 =?utf-8?B?b1ErUTFuMU5qYU9IU3FyblNIb2xhMmlFRG1QS1VvS3dBVGNxWXgzS3pNQndM?=
 =?utf-8?B?Tysxc0NWUTlsMGRMYklTTStBNE5wc29GZndZOFllMERXSXlwRHBvRUpWTmFh?=
 =?utf-8?B?L3IrVXZzWmk4Q1BMK293NTkxMDNVZUNNVVBQeEZjUFg4TEpRMFVYc3BHdm5S?=
 =?utf-8?B?R0x5TVBNMmtNa1ozVit4dFBaTVZnaGMrMlVFY0ZORHdsS1d1LzRXSVg5QVV1?=
 =?utf-8?B?bjVoNUpqcklrVUxuSU9FRllxM0NRZko3WHFDRU5Ud3lOZytPN1NPWEMvWE12?=
 =?utf-8?B?NWljMXVBS2NZSmNUWEdzOXJxSCt0ai9CbmQvVVdqTUV0MStiOEFNRjQ4OE1p?=
 =?utf-8?B?aXYrSUJDU0NRd05qOU5XckhzWkN3NXY1U2xzWE5lV1h6aE5qYUhPMDY2M3hD?=
 =?utf-8?B?SmNRT3p6OHFFKzhtbkQ1dnhvZmlQakIyS242NzA1cG0zT0V3SDA2N09vc01l?=
 =?utf-8?B?QWRXS3pBaTR2ODlKVmkxMnBYcW5aTUJrY0dGMEhvQ2E1ZG9VZnA4UUQ3eFds?=
 =?utf-8?B?T0dqYWlGWUtkM1lXdWR3RHg4NUJ2c3VhaWlkcUhLU00vaEw0YU1jN0tMR3d2?=
 =?utf-8?B?YzdZT21nblFZdTI0Mjhjak5kVEppZU8yL2dGcitvcXZqUEthS2pGTklPWm9R?=
 =?utf-8?B?SlBpa3BUMHBORVJLa2VQT2lobHRqNkxCbXBEZ1lveXlpY0RORlpYL21uWXpV?=
 =?utf-8?B?djUrQ0R2STYwRGNOd3BoZVlJQXVvV0srdDRBOGVVTG1MbC9INGdlNTVjeFIz?=
 =?utf-8?B?VllBTmhzbkJsUzBGM2oxWTFoMVFzcDRtcWVJMGhiWFNKbzBOTi9sc215UkZU?=
 =?utf-8?B?bTFBQmJPelVDTE9Id1g4VU92YVhYQzJKRHBvam43bUp1bVZJc3VWRlR6NVY5?=
 =?utf-8?B?S1NUd1Uyb2JzZlJTdmZ2Rld6YnJOeVFKb2R2d3dtbVNCY1U5aGIycDV4OVRM?=
 =?utf-8?B?VlphV1Q2Z2l5VTdienNYaFoxSk1oSXFKQVRwL0hVV2dYb1RDYkFNWURSRHlJ?=
 =?utf-8?B?VnE1SDBFL1VoenV6YWhseVBWMEtVT3FsSjEvNzQyMmdGc2JGcHBVQXVXeVhv?=
 =?utf-8?B?eC9xSTF2dmloRlZtNUJwQkhZZGxNUi9Dajl5VnpIcWZUS3BjQi9PZ0paYmh6?=
 =?utf-8?B?Y08wdFE2VmxabG5wV1RsQmNja0dBdjU1cmlvMERYQ0tRcThvMWFpRS9LWGgx?=
 =?utf-8?B?UG1qWXI5OFhOQW9YOEJDR0o2VHhwcXVKc24rSGFIdnRjODFUamxmRWtUY3hS?=
 =?utf-8?B?ODMzc2FRNmF4alZZbFQ3RDVIZnhQNTdNa0dlZzVZb3BPQWVocVFmSVdEZXR1?=
 =?utf-8?B?R1ZMdE5sVE5hR3J6NXlSMG40cWN5UEF5MzlBaFZVbmFXaW1sUWFpOWVuN1Zl?=
 =?utf-8?B?ekNFZHRKTTN2N1pPQ2ZMcU84U0UvcVh0ZG4xaHJ1YVRVMGp1dG10M1E4U0Nx?=
 =?utf-8?B?djRISEpaK0hHbmVkMWZ3RVZ3d0RyeC9tZzRiQnRtL3dNYUU4MUcvclRXcmly?=
 =?utf-8?B?ZjNmNi9CeFJkcW02NXZGRWRuK2k0SGJLS01WRlpoaWtHQmV3czMrRjJ5TmxS?=
 =?utf-8?B?eDdoYUFwUFFpd3BPV21kZHF5Y3JRYmNTd2llQVB4TStLdVVqTDB4WmtsekIv?=
 =?utf-8?B?MHFpbTF2dXdPTVQ3RG90VmQzZmxabzhMa1poSlpadnRUTVo0ZDZGMzBTMU9C?=
 =?utf-8?B?cVUyb1hDdzhzQWFQbVJodmFLSVZIbUJTRmlucXNIb0ExNEZJNlcrUkVVT3BB?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c02705-4872-4605-8fff-08dd088088cd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:57:10.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zv/67ARK8s5GFEhKjhdadHhT1bT/tdVtDzI6Q6IoTuErjByOb59APeb0YUgbFR4e5ZiWvPfGX1o64aJ9WaLPze5uDHaTkTbsWOIthNXoh+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10845

Hi Krzysztof,

>> +	if (npins < 0)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Failed to read 'pinmux' in node %s\n",
>> +				     grp->data.name);
> 
> I do not see how this change is related. Looks you are mixing cleanups
> with refactoring into MFD cell. These are two different things.

Yes, I also included some small refactoring changes. I didn't think they were
important enough to include them in a separate commit. Would you like me to separate
them in another commit?

>> -	if (mem_regions == 0 || mem_regions >= 10000) {
>> -		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
>> -		return -EINVAL;
>> -	}
>> +	/* one MSCR and one IMCR region per SIUL2 module */
> 
> How is this related to converion into MFD cell?

We no longer parse the device tree to configure the regmaps, we instead
get them from the mfd driver. This is the main point of converting this
driver into an mfd cell. 

> 
> Still looks like an ABI break.
> 

Yes, the driver no longer adheres to the nxp,s32g2-siul2-pinctrl.yaml binding.

The intention is to deprecate that binding since it doesn't correctly describe
the hardware. I am not sure on how to do this. I thought that changing this
driver and removing the old compatible would be enough.

Would it be better to add another file which would contain the old probing
function(and match the old binding) so clients would be able to select the
old implementation?

> 
> Best regards,
> Krzysztof
> 

Best regards,
Andrei



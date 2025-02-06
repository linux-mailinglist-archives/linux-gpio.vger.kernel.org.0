Return-Path: <linux-gpio+bounces-15462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2AA2A91D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 14:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2933F188025E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F67323025D;
	Thu,  6 Feb 2025 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O8v7+lnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2072.outbound.protection.outlook.com [40.107.104.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A822FDF9;
	Thu,  6 Feb 2025 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847309; cv=fail; b=p3PnxeISBBi2i4oehbVqiL4DdUXTHTBLFSO9KIUXWnUMCBTJyUoYtoq9YMMedkjYdVLIO4JNlsfy/fJHU2hred2Gh59mG8ONt/ojmBjmChQpphcVwiNxfirL/0q3575ETrJJGFcjsrsgLiqmQ33A4gaQp0Tc0wE00hTJJ3f78p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847309; c=relaxed/simple;
	bh=UpZ8v9jE2+lvfRrY0ip5J7NpM1SdhQcMlmmQbD03138=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QQKxt3H9dR3NTvz8t8mKfen1imCMG7vo+W+MSHEKTzwfSk2I8xEXww+Kj6LUs+38DlwqBQR89OlPvJdyoAfY7PHGp1kxWI0CtDmWaRQCjN+xohzaZr4QNXW20BqNqAo9v3lY7JW97iWbBAjLYggyQFnrVSrz4tgiaQ7VCMnEoTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O8v7+lnz; arc=fail smtp.client-ip=40.107.104.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reHjL/IV3GIm/vzjS65p+wpe904mkl+f51z4jbvPH9wLverBOboqEY4zQ5XwaQ+Rk2IdsLJW2Ho8/KPBLz35pQHJHvIbhlaNzuXCOMex9jF6Dg1/cSkxfe/EK8Pw8IOXJt9iovml9VpCTARnrX5T6YrROY9tdxNzyxj+vGBmKRK2lNRHrWdI69rmeQ3UDZa3qUGnqQ/JyHw4EUyIhrAD15Zz5iZ+gtckrzAQuBaBUC+LsinMcJk6RpzkwUY2mtk31lzayeg+8zSV69kAx211xzdR9/+2//sdJoUPktn7Z7Dvjh1PDeT8bwisB6UGSVeV5vMVyBr4tZXmAGOh1MP1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBr+x8TajH2jshWtVs/9PiFNw5sctSg7xkZozBvvKTk=;
 b=BovSLaQKf6TcFCRHdR4+Ul1cViayXIpJigdWaEHGiRNbgZ3qk7WPBwwDb9ABp51pckuHpFQlhkxQ8IUSHsSQQn5oA02dDTprQS7arBR3Su0cs3IoZt1dU/6PPu4BUCbTK3oynQWiS0Nd76bH09qJwm+OgDdGUUQ/FvHsnkVX3+phMjKg3IOppK0DqGKEsOmwi8oEZaIc1CeFeuMALw9VkQ+u37AnQf5/+5obylDkjTLqoqJNw+spmO1DKmRUEVYH4ZBCQsclvqXJ1cyUVeVftsOBmT4m+yXpmX9H5XbksjPdVCvksKHypImks4OTuvx4ky8eGJ9g/ItG+0imILqtWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBr+x8TajH2jshWtVs/9PiFNw5sctSg7xkZozBvvKTk=;
 b=O8v7+lnzBRpN+zGBiJmND34Oym5hColTTifZLXPVg7QkrxpCXoxEr9S62l7WYiWYIJrZ1EikjqizbZv9jQWR/FZspoP7APnE9GLXAxLpxPyKoL7gTzDq+BmupeJmCMtZgk5g2GB3VZfuaYMlOZwBt+IJg8/RTaEzPLwNbXZXGbuKyK0lWG6QWDPV8fVV1EoylFoCi/Cwl2iLQ12XBqAqBYjP+KvFkV2kpz5jQxfQ3eXAbksql3PdI4zyrdiH8vpwfSG+58kECm8lmx9DHgyYPi666hY6PvK0EI+PXjiEGzKR8Zs9/KgRTKmo/psNIffmjYlBZ0djs30fQIvuwty/OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7143.eurprd04.prod.outlook.com (2603:10a6:20b:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 13:08:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 13:08:24 +0000
Date: Thu, 6 Feb 2025 22:15:05 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <20250206141505.GC27490@localhost.localdomain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
 <20250206110508.GB22527@localhost.localdomain>
 <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
 <119bdeb3-f1d4-4f35-bff3-190eccc7c325@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <119bdeb3-f1d4-4f35-bff3-190eccc7c325@stanley.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG3P274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::26)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: cc190715-24cb-40a0-b2be-08dd46af56ab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vzLu215Fr2BUtUysBNbFaCgYxpTiyYgVgFovB8G0+2NH8txSPdY3d/6xccu8?=
 =?us-ascii?Q?c4GtTQNgv2084EdoA1tdDSKfH+yCaM5jjA2NsjK8rFeKLhIURnSNehsl9XKo?=
 =?us-ascii?Q?qqQFHt50BTUsr8pUpvX+ZHPuJdQI9CIHHI0V2y0EJD5ZBuV444T9c/NpdZDQ?=
 =?us-ascii?Q?tHAb/FlHeyVTAf/B0iyZlNTiLbtiWIRIP5MNEIQhSNICd/sxhx5vo09WJAqj?=
 =?us-ascii?Q?Lx+EQeixPZj+1GdrzCtm3fHVgcqrYAk0+1Dtt+fdAqtbQkrJxYpynYIBTjsd?=
 =?us-ascii?Q?1K6wHFWe/+eBUlIL1pkkRWB/ZhJLLLlhNhTX44Hz/7MILwgPwxYsSGx4Ac/F?=
 =?us-ascii?Q?sqhKXoNFbRJpvuKsz1Ejp56FjKAFjlIhJODG8eXkRbBLKQRw8WKGHLyHitSi?=
 =?us-ascii?Q?64I/Od0jDAuqudikE3ICpV84g2fC6kMeABP/uQ4lhCby/TCWhRHzU9CBt3dw?=
 =?us-ascii?Q?YrGqmjbCJwmFGucSzRCg7VkegonjvsYYU4QZ/moG3TLoKdU2XXS5oJvTZzp5?=
 =?us-ascii?Q?MxYGcSAE1eJJAs2Xy5jcHtPFFpDUlqRkmCW9/ru57p5C5WHUjSKmG/8k3ka+?=
 =?us-ascii?Q?gROV7iu8TugekBvplY7Vg94+eezC7kPWXb5Jmpp3nhqeRdTIJXOq53KSY6Mp?=
 =?us-ascii?Q?CV5ftVdLZDIHuKaHEUEPxwunVLn9599mev9SD+92fKWEOfoFkHB6xyhtVhar?=
 =?us-ascii?Q?J5Immy1T0RwtueQOvu2DtV1str9xbFhUtPbRYGfbL6W+LR2wK1GOj/rBWGtd?=
 =?us-ascii?Q?WxSO1xoYpcUmJ6XJo5ttl+sGai9K4yiFi+2SBkigp1TsOoMDcDAlLHZy/N8S?=
 =?us-ascii?Q?KeB08HvliKO8puoarQnMBu6ZB6fuixapd1NCUnCP5e4Mg33pZLOlfD9xfANe?=
 =?us-ascii?Q?FxVb8EK6uL4nk9knmIueD5a2vkJtorfesm7uSJmqmcrzT/f44KuYtVL2RkXN?=
 =?us-ascii?Q?nB/BgiPgQADATmcb6Hm3w3Y5OSM+fAWmbTimDCIpYXrkLBPVLx7VR19Bm091?=
 =?us-ascii?Q?69q8HsGds3Iyq2SfuC/KKpZ9mLT5lto7WFmil43PsMU64hJLqQlAGy9nMJ06?=
 =?us-ascii?Q?5ZEpILe2wpEd1glbjvhIIrg1VqUWcvI0K0IAac6i/rZ0nzJN60Qv0FH7zXyX?=
 =?us-ascii?Q?4I3bW2fBuUrP1w2OT+8pIAk2jNM7WVwEXwVvCHLJYOl73uumqOjMHEycwTmX?=
 =?us-ascii?Q?BDJ35ACWapTEuxJJub8ETmqHzbnxawott0dQn2UNv8hx+pYtZ9ZAUKe3X28d?=
 =?us-ascii?Q?KvsKS40ujlQAkBMT7KA2Vig9tdgZSJZczeaFXnKLdLl6p0RCP+dwa8ttbRkR?=
 =?us-ascii?Q?yHpokJNz5PK55dyjUl3oH7PQkVMD8/4OqV/v+X0o7K60lLZO7HD6OKATPGIX?=
 =?us-ascii?Q?UKuJpFb1GfcyZ83QRBlmBsdELsjrUWdi6zOBQNPAoa7mUaDbz4B1vwve4iZ6?=
 =?us-ascii?Q?zDsedDJNWofy5pKw62vGxZIYXO+18p8B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tl6lG9INAXsGi1kGkJ5eK5vM6aVFdTCnHf+FeOSnAfkMF4UTOuYZ7LS7a9tR?=
 =?us-ascii?Q?CpfVaMxltul0rdmhxi6BkNIsLKxjNdftcQeQeJI05A5rV0DZcAcwKKelsDIy?=
 =?us-ascii?Q?RNvfNg9eKs6ShMSUUm69TYsFm3IceNyv09Z1F+wB8FFLEqJwvihyQBSMJPtL?=
 =?us-ascii?Q?YtHy4sFWoFdlQ0cIFUdKQVEWzPyKIbmYROOl+aAeY+Njf5v+OBO6Kax+f8Ai?=
 =?us-ascii?Q?q1SEPIvWF6CILt+dbbDLspdXFOuApx2ex2urrNWE40qbgBacw3ldO5BzsXjk?=
 =?us-ascii?Q?QcM2EpzsD6Vb4IvvwtwG2nplg9qInz8xeP+joUlMbNSErSDjMoLCpd6PGYGp?=
 =?us-ascii?Q?5qNgfnoV/oNwjeHl6cGrUAQ3FTFc0dmNPcXe5vVkoKPeHbV6lTnA8Il7ET16?=
 =?us-ascii?Q?ulJG4opfKbZnWeHuVmZI4vMnXhWaxvEWZIF8e1OZ+mrs6xF6jz2pQrrwDBDj?=
 =?us-ascii?Q?IahoBz8DQ0XnqJbIn8Us9K1XyJC8yYGkLyWpY4KcmegCGsvpBw8ZCe3pHks0?=
 =?us-ascii?Q?KkliEKCAh2qcoMMUhmPsTZi45K+juWHDsM52qDSS4nntHx6KjE8yyQ8VO0CI?=
 =?us-ascii?Q?63ZWddimxsiExGNEe+V02VyGBdPNzxUeTjrDDowiOnp0Nb6O+/xe7+V009vz?=
 =?us-ascii?Q?ekjwBaeoQ4AvlVKXzIqeHa/5GXLL7lN9QyppWhO6gff4BZV5BprtNmHb3yp1?=
 =?us-ascii?Q?naFhKUQTC1F4bSbpBwxl5jHZKqmn4ncHCf9W6LlNgO7fwU67vL7hurp5SGdL?=
 =?us-ascii?Q?zEmVq+Wj0YljdfDPmf3vwYmyJ8CISv6Ejo+sguinp2ej+2H+NhQRMy8UnxnN?=
 =?us-ascii?Q?PcOV05LJ+qEESsDo/4nSbmPoSkjflzvrF2T/zc0ifN60H9yQIiwWhgbxlJxj?=
 =?us-ascii?Q?zfQBjoh6YsfikD7qCNpw7tHiTqUr6WxKxrcriLg2dUsczgpk2egnyjS8VypU?=
 =?us-ascii?Q?gpAYVgKdwRnQGsHbMgAXzOk04ARL6UA0gIvs2BUifzqmf89G+f3sXY5rNTFb?=
 =?us-ascii?Q?Q2AAfjCjrD4r/ZcmHuRu7lwj2sHqFDidjH+bz63EVAXoK2FwSVrRpCIkSgmD?=
 =?us-ascii?Q?Uik37IwydsRCc0aXJ1KDU9kXzGlMfdIXIzLEgexhepvQg5ZodTja6uF4o5YK?=
 =?us-ascii?Q?rvO/UE27JWS/2fsUzrPRTEGZb6e+xp5vBvtSOY9Bqau0OWeKzB9mrPMYki4+?=
 =?us-ascii?Q?J+iS8SqXVfP6pzNQ3xG6UG86oPMOM3l1ZO2ZzagwYV+v16zH+akHI+o234ge?=
 =?us-ascii?Q?Zi5Fd+DiwPEYn6YPF1TCTabpocv6OK2rPROvIrh0xUlAovabE10hsbgw4xkI?=
 =?us-ascii?Q?rVGstiKZk5IBil0jZr28SZ7PfqJkiVfgIvMcyFNTdEajFKCkUChNb8A4V8Ex?=
 =?us-ascii?Q?n56KSzhMU8XE/lx/6vuW0s8PW92uKSh3925DR7BKdoROTg0Gvu7Hasj2Mx2X?=
 =?us-ascii?Q?0nu4Jhq57JDEVLVesQt/APfUDSxQL4bU/B5MbR8EyomSeBPHD4FwLTOH7qt1?=
 =?us-ascii?Q?++IqRqfkrQkBvIWZOWWIK5d9KiwDFQ0DobfMKybgvyalLGSXRu1hdrUhonh3?=
 =?us-ascii?Q?rhtL8G0bmCXpsr0XtU164zuxGsU13lb5YF5jfiJd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc190715-24cb-40a0-b2be-08dd46af56ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 13:08:24.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfVZNHr4WXNSC/NfSx+tkxbcwp9K+qlkwGnfi8DZF3ZdiaY/y0D1HwR2RMqmWRySeksZoNH5tTzn8VpOnPu0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7143

On Thu, Feb 06, 2025 at 02:46:27PM +0300, Dan Carpenter wrote:
>On Thu, Feb 06, 2025 at 02:40:11PM +0300, Dan Carpenter wrote:
>> On Thu, Feb 06, 2025 at 07:05:08PM +0800, Peng Fan wrote:
>> > Hi Dan,
>> > 
>> > On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
>> > >On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
>> > >> From: Peng Fan <peng.fan@nxp.com>
>> > >> 
>> > >> There are two cases:
>> > >> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
>> > >> If both drivers are built in, and the scmi device with name "pinctrl-imx"
>> > >> is created earlier, and the fwnode device points to the scmi device,
>> > >> non-i.MX platforms will never have the pinctrl supplier ready.
>> > >> 
>> > >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
>> > >> With both drivers built in, two scmi devices will be created, and both
>> > >> drivers will be probed. On A's patform, feature Y probe may fail, vice
>> > >> verus.
>> > >> 
>> > >> Introduce machine_allowlist and machine_blocklist to allow or block
>> > >> the creation of scmi devices to address above issues.
>> > >> 
>> > >> machine_blocklist is non-vendor protocols, but vendor has its own
>> > >> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
>> > >> machine_allowlist is for vendor protocols. Saying vendor A drivers only
>> > >> allow vendor A machine, vendor B machines only allow vendor B machine.
>> > >> 
>> > >
>> > >I think patches 2-4 should be combined into one patch.  This commit
>> > 
>> > They are in different subsystems, so I separate them.
>> > 
>> 
>> I mean if the i.MX driver prevents the generic driver from working then
>> we need a Fixes tag.  It really makes it simpler to understand and backport
>> if they're sent as one patch.  Normally we would collect Acks from the
>> maintainers who're involved and but still do it as one patch.
>> 
>
>Wait.  Just to be clear.  Does PATCH 1/4 fix that bug so that when both
>are built-in then the generic driver works?  This is in some ways an
>alternative way to fix the same bug as well as being a cleanup?

patch 1/4 is not related to the pinctrl stuff. It could be a standalone
patch, I put it in this patchset, just because all are related to fwdevlink.

Thanks,
Peng

>
>regards,
>dan carpenter
>


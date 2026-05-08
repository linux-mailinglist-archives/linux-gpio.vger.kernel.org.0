Return-Path: <linux-gpio+bounces-36442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOHNHm+o/WmEhAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 11:10:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 227BF4F4148
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 11:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 663FA301435A
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 09:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0599384234;
	Fri,  8 May 2026 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ikpb43+v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50F33F37A;
	Fri,  8 May 2026 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231402; cv=fail; b=DRpNhvRnjM1P+dw+I4eNKc4AoqHNbLD8Kutish1QeGQGJQytQfgusTMxvIQ334kbzvmA4LrTLAVZa+eEB6lNrLgRGHCelwnVq6eXshntmn/9+dNt7m0KAh1i/oG8KnfHvp2N7Oz6OD/kOo8xpkCv7kyd6VWJ6tdmD+CzDC0LuVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231402; c=relaxed/simple;
	bh=eA0Jx8UBNjYtf3Xscq7vGbLW+onIsREIq4qweu0/aFQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ul0g7FVP00UTJ7Cq3UYVX9BSZb4G1gcW6oc4TsYaQFbzrQrWWW2rgjooIfhcMS0MAQFJsu/C+ZbcFQFxnRm8KivxAipVXr5NtNBaLf6++AIfKDHE9kvl7MXjqAuu8FMcYsQb8D1sYnfAmGl4H5VFCjgpkRUGWz8fKHjUq/XBKRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ikpb43+v; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=My4BWUtmpoq2SHoyBWoIwkkuC6ONtcd5H3+RJxp6oASBXn5nVGhZrTBTz9PE/N8CqHI5uJYWtgQFr2n2XJV8/X9/18MdQb4DloF7UnB4lgeAckyzqyWZsewV3cqe7eDzuTsVN2fw61j2RFef98D2Ne+d5Nrq9GX2NqJL76heXnRh6bTZ28uJcKO307HUvPC6jyaEQKXaAq6YvLg5KlhElWtv++x+1f/NH1UTi4ldfdIxsdDBDaWr0RORuT3I/QruDEh4mpRq0RXjVosBtlcG9I5bzUtx6g3DNkw7hvlxpNw74ZtffCwtSy/ETXWWSI+zXBy1Gn58kyD6r/XHlC3sUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbNvkvZeDwHxvaZm0FB0QiZrF+/dy1p7HfvcOAkEX6E=;
 b=awmhs61Ysnh3aSHJVK1MwIjKojsnbmGVmNI7wDWqVL/vnYFvbU8Vwa155XzwDSkKuZXUrmJeeeUludMt+24NVDh76AhlP0eaHBOyBPacEqd8Wz/sl7yW4C8MK9VkSu6vBeu7nc6npfJsj5G1PSvFsnw88JrmA2nASHS/V84rfjYsETdsrlpqeFKhrM7EzxKjYFwRBgYuWFw2fTiVqK+Pq/opNcHMeu0D2j5lTzF8AIqcign4AVYGhm+0Sv820Puc9+D+cj1cCBdPNHOER18mF7leYGKBEJt60aY10qZUyrj86yeVPflxquitPpZTaZovCc6gOtsisnoDCzIOasYbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbNvkvZeDwHxvaZm0FB0QiZrF+/dy1p7HfvcOAkEX6E=;
 b=ikpb43+vwrFTy3zNZs8x6ZTdhmiLhNOmd8SYDPbEiIOeH1X0tT7YKqOd30zu1qAXi6lYfcQotozq2LROW/fVZT1fL58/JidHq+k2uYJAJgm205PE32RXryLdSqMGxOi5wqGUvIpxCJSSeeo/w7vWX2N6Q7GGm+j0/v274TvEP1ejVD56wrGw1uHiI8wWG9ALVUb7YQkc1DeMMKU0X7oub/2h0eUlfDp6QSEl/WrdyHdRzPGT2v7cq3mqefYSEO4nkjxuIu5rgvkcZzl5++qtcHvVemx2LIBczfCGsEgkk6fNNjldraoUGo9z3IyHOuuLDljI+uLDbJh4PYFAkSB7yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by GV1PR04MB9087.eurprd04.prod.outlook.com (2603:10a6:150:22::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 09:09:52 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 09:09:52 +0000
Message-ID: <ff2ffdf6-5435-45c8-a0cd-bd2b5718c973@oss.nxp.com>
Date: Fri, 8 May 2026 12:09:48 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/7] dt-bindings: pinctrl: s32g2-siul2: describe GPIO
 and EIRQ resources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-6-khristineandreea.barbulescu@oss.nxp.com>
 <20260505-voracious-gregarious-stallion-ff6c34@quoll>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260505-voracious-gregarious-stallion-ff6c34@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|GV1PR04MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4128ff-f561-42d2-752b-08deace19072
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 5GUqxsOiXv8tc3bfzPukdDr6HEZdSjoi0my0rZE6QtDhTXkuJqZNY7T0UaQVWZEw9cfD72SweNk6EWoARW2J6jVL7Ib8UVMhjFAdOfIEX8wXlcWC2gScu1pttZ182lZEsWRDSyuv4FHj68Hre99Pv8k27b1C0yroxw7pRj82/C3pTWSlq2DaQRfNzcHNcOuFu1Knunj7Rt2o7ZsfmeqG627Iu+4GSawfMJe6whpYc2ZjXAnG6Qb0AG3w4eEYMhogKNJs41yjLCYgy/yodoAI7vsF6Wo1HjgBc1XMs62sCvbaUBVSepGvLZSvsFDgdVZGolO7tw4fUqzr49u94Xk5pur68GiepFO3R+E/5MIGiUAqDOpnjL4igpFMXyS5EO8k9vvuX8vgf2hepGNcdiGiBoGfozTD+S8rWBdUZqXrfwbtuNJkz/XEdoppviGhgbUJO9P71wtOXznDtYXn/K6ITWZn590GDebYcwoYtuiWaRYfEebglvoi4iPGlMmNa6JJZA6eMyYu55mVapBrvW1cVUhqROYAF6EU4p2eQttEWSYBFbVNDKTDUtimrbX4/qDxhsIkFQFk/kdia+LUhSIzdih9qJ1/k/YXK+oDxxBDbchGiWLlrqzi1S71jagwYKXHF+EslojBlYQ3EdmYQagQyg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NGd6eVpCdWZxM29KdnRYVDZneXBwR01HM2hjejVEY2hOajNxK2cyY3grKzZn?=
 =?utf-8?B?VXFYd05uOStpVFJYZjdxT3krZnNxbGZGMU9ZSDRtK0daemFJQlBVRW9KdW5K?=
 =?utf-8?B?NXJCcGFwbmEzdjdRWTkxSUo0Y3RXckVKdFNrNTZMclpDQkRvekt2d2EwSG1l?=
 =?utf-8?B?S2FIWklFRGpvUWJHQjdVbDdKcHhkUjA2YVVaQ20yM3hYakVtUkRSNE55MkpP?=
 =?utf-8?B?cERQU3pmZWI1SlJTNzY5cUpVVE1FckFvYk1FMEIrK29IL0x0V05QbmtGV01r?=
 =?utf-8?B?M2hoTkJHWnBhVTFLWnlZY2VxcFZGNDdMWlJhaytxRjhwZkxjYXQ2V0ZQL2s2?=
 =?utf-8?B?UGIvQ0JPaFh3c0pYdGoyNFc1WkVHQ2xNMXhlakV2TEJOV2tFdkJzWUZXalc3?=
 =?utf-8?B?aWlPWkJLb0hHTEMvai9jcDdWZStMSDB0TTVHTzZUcStObmF4N3FTL2M3OXEy?=
 =?utf-8?B?dHNqTTI5ZFA2WnlxeHNoWmsvQ1ZPOGs1VWp0TXMwYTRVNWNqb0lRL0VGODN5?=
 =?utf-8?B?dlp5bU96eXFzTTNGRy93bDdYL1p2bDNsVFhaUG1yWkhtQnFoa3JteTlRQnJF?=
 =?utf-8?B?akVkcFpBUmpod2xnVXdVQ1V0amZ3NkgxOE9YYWRZTUhjTWhwU3JaODhQTjFQ?=
 =?utf-8?B?a1ZDSEdZSTIxazl6TjhURENpdzg0K3dBQkpVZWliMERJMlROL2JPcS9zWmtl?=
 =?utf-8?B?RGE0Y2VuVFdLUEZnaXlSbWlqcFM5NHQyU1RBem5rRUdDMitQZ1IrUTdIK0Yz?=
 =?utf-8?B?cDVLRG1aOEsyZitzS1NhcEs1RklRdUZsZFdaMFJaWVA2R2xTbC9ZWkxxQ2VS?=
 =?utf-8?B?Ymk5enVCYzNGNDV0VTR3bkJ1N25XNVQvbzNuZ05uUXZlc3pYVWVSM0RkNm82?=
 =?utf-8?B?WlNBR2ExbWVhVzhvU1Bld21SSzJYSE1Fd08rS05Bb1ZNQ1Z4ck9rVElOOFE4?=
 =?utf-8?B?bnJJZjhHZExzL1RhNzZPL2c0eFlleDJmOVNHTGJ4aXN0aWxNTW9vSnRsTm1u?=
 =?utf-8?B?YWN1dW52VkJ6Z1JKZWFiQlVNSHhuNWlibmZITGQrMFFzK3ZhSjY2UlcwRkU2?=
 =?utf-8?B?dExrckZ4Y0l5MDdkREdySTRXajladlVsQ2h1NUl1OTRYem13eDIrSEh3RWlL?=
 =?utf-8?B?SUIzV00zaUhLdnlXVlQ3Q0p2aGV3SVdvaUROZU1jMUNFajVTK05ENHlQQmZR?=
 =?utf-8?B?MTk4TWkzMXFEdTVybVppS2lvL0h1dTBLQXNKblVoM1E5ZDBwVjNVdVUzQjRT?=
 =?utf-8?B?eExOMkhOT3pCSFMzYW9rSWVzZzVuUDVzSFd4MFRRVnFQNnpJbGlUQlpZMWo2?=
 =?utf-8?B?S0xnYlFQaTJXOUZGWGJhazRXWE5GUTM5Mm92cGpCNmtDT2dHcVBDMVByMUk2?=
 =?utf-8?B?QXRMOVc2L3dMb3VrU09yQmwwUDkvMGp4ZE1sTEwvajdCQ3QrOGxKOU5HdzI3?=
 =?utf-8?B?SGZ5M2pHem1uVEp4SnNnWWFjS1VBSmp0QUhDVE9lWGEvZTRGT3h1V25HT2Vl?=
 =?utf-8?B?Vlk1UDhtK3hMSmtWaDJQeEk4ZWZsNFJ0bGk0THVXUlZTVDM2NHRveGZ0N2FK?=
 =?utf-8?B?alBEVGVEYURSVExIY2wrcFp1UHJRZ0dkZnRiMzhDOURzRCtlYXRaaXRMbXNC?=
 =?utf-8?B?VVB4a2dVVTQxbDJiMllUY2xVUTVmYkNzSEY5OXkrYmRxUThteGxjTXFpckVR?=
 =?utf-8?B?UGo5bmFUZmVaQW1FL3A5RjFoaFRGZTU5aEVpb1orV05kK3U2cnNJR1VNVzNX?=
 =?utf-8?B?ZWhuQ0YwdVppOU1nbjFKV0p4R3I1M2VSWi9VM3NQbkJMV0NFemdMRTVsU3Jx?=
 =?utf-8?B?MFlBYVRGTGFpaGRMS2NHc0s2OFhBeUVJV2txWVhIUDdQU3JzSjdIdGx4cm15?=
 =?utf-8?B?M1FvL3F2ZTRzOXdsOGVrN1EwNU5XNTNHUTlpYVRoRXlzZFRYVkl2S2lqeC8r?=
 =?utf-8?B?QWE0eTkrQlFjYndGQm95TWYvQWFxczNxYjNLa0dOWXpzeXc4WitMSmx3aFVv?=
 =?utf-8?B?b0NaWS9YMFNwcTM5Z0IxVGwxV0NzQ21rYTZyQ0J6MWVuZHFHWmgyM1J4TnlU?=
 =?utf-8?B?dHpUYll6UUQ4VkM2UGgrZThCVy9YMmNZQVhGMWt3VFVtTWdWQ1ZSeXhnRWVO?=
 =?utf-8?B?RlgwVnJpVVlXRk81ckMzbklVVlpzMG9IcjkwOFZBUWR6NGZkVTlSV3lDYTZh?=
 =?utf-8?B?Q0ZhRzZ2Z3EzdUlPeFlscUgzR0YyUVl0N2tzemJvWG1hYnZ2ajhMQ1M1bFlH?=
 =?utf-8?B?cGNxS3ptL2hFajlMVFlHOWdEWkt4Q1JsVHdqRjlyNXpudmlIa2xyQ0xMMTNo?=
 =?utf-8?B?Y0loMmIyelM5UVAvUWZJcnp2RzQreEFSNCtRbkVIQTlCYXIwdk16NXN0SjVX?=
 =?utf-8?Q?0VjWVdlC7O1BHeFc2OaNgwHxz4MKDNdYWKqXo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4128ff-f561-42d2-752b-08deace19072
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 09:09:52.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqXK7B9ui67wbm0Eol019hMaXbe4W5UzJVygeUXtoYIfJc16GQ1Vfy58JduCW3hE01XPpSMAhKtr7cZYVpa3jXoQwC7qRPnet/Dv63iNu2FV7Bp4+KSc1WTkLXHxjeDN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9087
X-Rspamd-Queue-Id: 227BF4F4148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36442-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,oss.nxp.com:mid,devicetree.org:url]
X-Rspamd-Action: no action

On 5/5/2026 9:36 AM, Krzysztof Kozlowski wrote:
> On Mon, May 04, 2026 at 03:11:46PM +0200, Khristine Andreea Barbulescu wrote:
>> Extend the S32G2 SIUL2 pinctrl binding to describe the additional
>> resources used by the updated SIUL2 pinctrl driver.
> 
> Please describe hardware, not drivers. Statement is not even true -
> drivers do not use these resources, unless you organized your patchset
> wrong (see submitting bindings documents, both).
> 
> Nothing above explains why you need new compatible.
> 
>>
>> Besides the MSCR and IMCR register ranges used for pinmux and
>> pin configuration, the SIUL2 block also contains PGPDO and PGPDI
>> registers for GPIO output and input operations, as well as EIRQ
>> registers used for external interrupt configuration.
>>
>> Add GPIO controller properties:
>>   - gpio-controller
>>   - #gpio-cells
>>   - gpio-ranges
>>
>> Add interrupt controller properties:
>>   - interrupt-controller
>>   - #interrupt-cells
>>   - interrupts
> 
> Do not explain what you did, but say why.
> 
>>
>> Also update the binding example to show the complete SIUL2 register
>> layout, including the GPIO data and EIRQ register windows.
>>
>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
>> ---
>>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 107 ++++++++++++++++--
>>  1 file changed, 98 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> index a24286e4def6..0bd341f1e84d 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> @@ -1,5 +1,5 @@
>>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> -# Copyright 2022 NXP
>> +# Copyright 2022, 2026 NXP
>>  %YAML 1.2
>>  ---
>>  $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
>> @@ -17,26 +17,39 @@ description: |
>>      SIUL2_0 @ 0x4009c000
>>      SIUL2_1 @ 0x44010000
>>  
>> -  Every SIUL2 region has multiple register types, and here only MSCR and
>> -  IMCR registers need to be revealed for kernel to configure pinmux.
>> +  Every SIUL2 region has multiple register types. MSCR and IMCR registers
>> +  need to be revealed for kernel to configure pinmux. PGPDO and PGPDI
>> +  registers are used for GPIO output/input operations. EIRQ registers
>> +  are used for external interrupt configuration.
>>  
>>    Please note that some register indexes are reserved in S32G2, such as
>>    MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - nxp,s32g2-siul2-pinctrl
>> +    oneOf:
>> +      - const: nxp,s32g2-siul2-pinctrl
>> +      - items:
>> +          - const: nxp,s32g2-siul2-pinctrl-gpio
>> +          - const: nxp,s32g2-siul2-pinctrl
> 
> I don't get how this binding develops. You were asked to grow existing
> binding instead of deprecating it and now you did not grow it: you added
> completely new compatible.
> 
> Please go back to previous version comments.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thanks for your review.

I will rework the binding and the commit message
accordingly in the next version.

Best regards,
Khristine


Return-Path: <linux-gpio+bounces-31905-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMUUMr98l2nmzAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31905-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:12:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E4C162A4C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10AC730090B5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 21:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4013E3254AA;
	Thu, 19 Feb 2026 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jSN0byUp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010057.outbound.protection.outlook.com [52.101.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998CD326D63;
	Thu, 19 Feb 2026 21:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771535545; cv=fail; b=bYRvY+ZntgCH5YP8VfmbwP7YIz+DlBwkAf+FV23aSvObf6hxmL5kQ9d03t8vteIPW/9lJH4ZVl3jmygZHgCy+az6I6/hRgiZyK7ZYTzzXUxffeYL0sNeyX3n7uxz03RRmcl4TWIWvMig5Nt+5SNmxld6+yrKFELlLJJc4Z4SdI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771535545; c=relaxed/simple;
	bh=JuKUHVgQp120mGjxdfo1gL8JixVgbp9ZukMSkcedjbk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IOs7POKYVCDuK0qABj+VZRFwGT8MTw8wFRoJli134IMym+/e8HC0D7h2yamTO5cTQP1HybU2PFJZpbDa7Ca4xMB65IlYmZx9rXkrkn20iHK1DhxJPNHyNKN//X1PrTuHIbqITHwBEDLHQ/jdwY57gHqGpHvcKJjTOYVlp6pCJT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jSN0byUp; arc=fail smtp.client-ip=52.101.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bz8LsPF70zDb+i1x+/xogPk7FbLsb2wdRPouRBJai1TBnD20xPJq+CuPgFECaNQP1T51NtSW7wLkvKivczPXx0vcPo6aHWqVA9haLmi0MBSQqUTEk2OzUeJVSAc3WEekt6Js15sH9i/mRcI9XljYeYLj6xFwCsLaAcMbMvUPEW34JAqZYa6oWspD8Dydu5PtsnxhE3pzyo3SiwEb3QAnERwCyG6dMwMnthAo0FvC3zwsYsKnllrnve9Ve5y7kvAXWinV0jjpyj2cd4YnGcNLVjQ/BPWiPS4GaY0HlKdJHmlvT6kiClhzOTjdtFK16edzjuPV8ycnb8VveH230B41+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+Rmmzjz3EZ4t0RoWec6g5AfSe0PI6mliMrYOadLQ2g=;
 b=aSMNG0yZUxGzklnyfAY3bE2FskbIdiQGlO19L+SQv3Qh/WMEEKeK5qFsnhCaHYn40v2tAAUR8r2ojFAoZ4ubKjOzyLNDATg1XEkVmEqROsJzgPSv3/uJBqZzKTrgCRuPCVu36X6/rSqTl6pxSyeOueEAZE0hafdxWJFg0TMQ7s600OhRy1QYpugLzaAQEiM+4JnAbPU0QpLhGEBjVv9P62U3w+AS3VBmhB4qrxBZfNJQC86JkPG/ohtyM4LbRwum7Ib7kkUWHMXaMi92PKgKQ4fxdvyPw8HvLwt+Zjjom3QS8i6zYwEoMNz1GHNKbjXAKg/HT46t/Mm0wmoZ6N6SHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+Rmmzjz3EZ4t0RoWec6g5AfSe0PI6mliMrYOadLQ2g=;
 b=jSN0byUpMS8+00QTcHZiibeXKnk1NYtVGxp7lreQJniBvIYw04V58D5dubsHXCVbo8v5hLquL9EzJT97UUavv3Q9E9bcRTNRllBKsThYDNUkKqzDnPDZgWeIvd5YW+pdbkv2eYC9NgQGoYHnIxoHxRMjdhJSMtH1IIvwx8g6lZNndhTXTbTxfZ152tUgkPofYxqGPwONQLJAhtMUnQYU0k5DjEpyxWd9RLAIDcBpDlco8WLMpqQ1DOWRtJSvrUcqZUTLc/Z0igyeUajRpRrfIfzl9wgfUw6L86SyEXQdEj5fUgL938xwJeZQtzDEC6Oal0THJC5HR8RtjhU0lBGUug==
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by AS5PR04MB10059.eurprd04.prod.outlook.com (2603:10a6:20b:680::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 21:12:19 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 21:12:19 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcoeRuhGAMnODcU0y5b19xK+plTQ==
Date: Thu, 19 Feb 2026 21:12:19 +0000
Message-ID:
 <AS8PR04MB9176F61DCC8EBFD0A63E7A22896BA@AS8PR04MB9176.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d3215b75-46c9-4875-abd7-fe17eb139820@lunn.ch>
In-Reply-To: <d3215b75-46c9-4875-abd7-fe17eb139820@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9176:EE_|AS5PR04MB10059:EE_
x-ms-office365-filtering-correlation-id: cbf9f278-2f79-4770-bbc4-08de6ffb9119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vaY+qekZF4SPLv40ZyKjAhSRR9pFYd3pJjOp28HGEtPkCNUyGy3MtnSwrzLK?=
 =?us-ascii?Q?JHYRYdaIIoJw0wXWwoXhaVXAzXAy+M7TEn2iy7ZpaiXofoLv8mOgy7l4hMeN?=
 =?us-ascii?Q?oeb5Zelx/UHF9YArt/396FJV3McFuLCHFFlqIXSEoVsn8CtO1EG6+yfow00M?=
 =?us-ascii?Q?wu8it0Y2PWG8gF1pbFBdDyGb3C+Ec7SufAc4nzONWY2S/oNJBHLfRiA0V/Sm?=
 =?us-ascii?Q?xoYLKpH8RbbQVvCjiurYU1HKq4TsdMLcMO7fhz2Iyp0dS8DOdERTnwG7Ujjt?=
 =?us-ascii?Q?xLD75M/n2/0McILxAPaY2i4P0EFuXKhyreL7dUUoRZJpuIP/jTMJhmTm24HV?=
 =?us-ascii?Q?w7xze/+ZwHTnOescLdTO+nNZJ87lv+BFKwnIbL5h4weMhSTCDe0pu1PRvajY?=
 =?us-ascii?Q?TP3KD5WJP0DqbijPQayhOvEjb36LYYr236h1p8BvLU1g5byG+vCI+z48swQQ?=
 =?us-ascii?Q?Je/5N+CjWAljRLym85DVKwOejOfpXWrDakFcdSNi5ct7gEOj0qNgwmR9Ua9c?=
 =?us-ascii?Q?umaW5m1I+dECdb/W972ojUqim0q2/azETFQPopE7RsaLOWtqRZeNFh6XmbtV?=
 =?us-ascii?Q?3AEGn8YKK9Hdc1xnOVo4eL4Y5KSUGkT0qw1Rl3B8vFtA6AvHErLSTl3dxhfc?=
 =?us-ascii?Q?tAwg9cPU85xY+XTKJ2tRri3FhC4VJ1MtO1Yu+qpiNRFfoy7HdXHfHyQGzQOD?=
 =?us-ascii?Q?V2s/U+mkiEZcKcX2KV/ndTJy/FEx3H/cuBAYLj9ukW0wHcwutKEhW/E/L2aO?=
 =?us-ascii?Q?urXR7ykXUkNCNeXMMh4D9FxIo5qwPfcbYXbsirShHgnsgetXoTse4RPOURHx?=
 =?us-ascii?Q?/KRrl6pvg1El6R3bCUUDfDT/yHpKeB653S0J0PkAJG/OyGgAENW6Gm7r7fbG?=
 =?us-ascii?Q?opLjbKyrnCU8aWQfqd+yOW5YFBGaPly0lWYCSWP3OI4/l/iZZtZg68TzAw/o?=
 =?us-ascii?Q?BLWOevsEwZmyxYcXuOlQw/XwkUUVOvSeZ5c8b//2n4HEtEVYUyEWr4maA410?=
 =?us-ascii?Q?roSjpfyQzRBfaCcu4wjE0yRUGopkfElRj8QbCunMnPx3CFJYN0awupniJ2vd?=
 =?us-ascii?Q?YtMvw06kF31jNy4C+Jgf8ji2GFA+oMu4nbXKdUCrpcyvSwow6VMPV+gJyOZS?=
 =?us-ascii?Q?Y2V5KOP3ZbY+9x5lJdljLDpvTQ6BrhMajG/iSV9mQaqw/WMKBUC5woSjuFxm?=
 =?us-ascii?Q?g5HY7Zc7qBAkRHSOMayeXXMufpHwtf5TYZH2vltw3ylQdRuYhUaV3uAX8N0+?=
 =?us-ascii?Q?EKRXMp3pRH41mwaG9fdK/hWqxpfZrLgEUWK0bhe9sVI6qq6TRk0UuHqSD8b5?=
 =?us-ascii?Q?cfnAcY0rmbygR/Wjpol5Mx8DjKwIcvczZ4aMU+od6kgswlf38rVx6a8w8A24?=
 =?us-ascii?Q?5Wl3wEFwrXv1BABgKJDWKe9pII8QUBJ90sLokitMAMBym646769PU9bR4QOl?=
 =?us-ascii?Q?B3f1hRpNmJOxTOYyWHnOZfxM+ZotY/jDGUQ/D3hZTdq8OtTRxJfw5iuD+SBv?=
 =?us-ascii?Q?cHVLH0Wfu44a/1iTxThnousw5QSJ3XVTlh8NwWtrEkG+3jkmuqo2vFistWUq?=
 =?us-ascii?Q?V8FDLauuvw8d9HeCZM0icHMhin9CEnblHyN3o1C/KX/wBWev5Do7aGHkbK6q?=
 =?us-ascii?Q?LLbfEmO9NM5qh74rmneGJxw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X0khiNXyubN8+63zc+CeTp61CvVbrjsHUYVK7sWte4PfcgxvVvZT72AbPF2q?=
 =?us-ascii?Q?OIYD2g77CPMcfJ02vj3/v3x3hKWkjk8ZgR3+GaZQ6+cIzQG9y3g1smb1tnKl?=
 =?us-ascii?Q?fdopUEiubZ0hUra2yE98cKinauXtzqqECQd3ucbig8yWksMEX4Hz/niUlFVo?=
 =?us-ascii?Q?g9gs9DmE+/4kDTNTvllJJciyiWuSwpqBOtDcBre4m0lkqMxXWOUTym286nIJ?=
 =?us-ascii?Q?U35zIpeuz/PUU97pUbE+GPSiLEra5sOyoRo3pR/tvAB3WT9JOxMhkDMqKiyX?=
 =?us-ascii?Q?dJl4veRcnOISDcFjV15Km5sObh0930gYoKpLSDCW8P4ISEtmS+HBljVLWMha?=
 =?us-ascii?Q?W5eokVOVA6zvn3MtzdkorQci8fcN8+SO/uVPTXqY9qw+d9ksDkjilI/v1y9K?=
 =?us-ascii?Q?f/X9h1UDdNcAZczvFM/pZ8nl+ouURxP5b+vKmYnP4U3zvn7iviFfKtqyK96a?=
 =?us-ascii?Q?9z65CBuXLBgD5utXjU9ggevXh3ZJ+HMsulMy/T0J5clqlzMeRTdzrXHICz6S?=
 =?us-ascii?Q?0+Y8sTLkdlUKm0daB5iIljHz0WwAc8dvuF9rJPBz1P3M5o/eoMFXM9CUH4A6?=
 =?us-ascii?Q?60bvD5G8B7GgjHuvzJkPxciF7fqPCTBWPWxCcZ2QV6oM8mCKfNWAvWaNFqhZ?=
 =?us-ascii?Q?rK3rJp3uxtkv9V66BIdQ9EJUrC4nhwpK9guJqWz9RZ0yBQfrBPNLk/atxzTD?=
 =?us-ascii?Q?pttrTwu8ZB54K8DVtWcJrHV/otsES8CG+GXB6JitYZFQ5jdu3Pg6J59JllEu?=
 =?us-ascii?Q?qDH8+YljfLwYU5LZG3i375B55IjQaXH8UrTDriqfqQcn0GJue0ONYeeVLFuY?=
 =?us-ascii?Q?2qX7VtqnBilaurImgikNP919rnYoMxyo0O8t2A2fWJsBEOQd7CKaxkaotq/+?=
 =?us-ascii?Q?9lRQNn1s/bqhfa80rcOedQyIiRGBw1PYvmy8ORFnRPY5SDRIeV0WoHM0kqUO?=
 =?us-ascii?Q?QBDanTL68pncjzgov3Y5BAYFoYnRv5s5quaVbmOWOMn586TnRhiJ6aLVR8NZ?=
 =?us-ascii?Q?ZbloMsQ6Ag9484y9SlmoDUe/S5qqfjko0LFnFlLSlDO/f0m4z/1lPFbNNbcG?=
 =?us-ascii?Q?FaWu9Ze55IYhs7AAEgeS+w//e/puAadCnfgkUipPnahRYfCFalCb510BKPEf?=
 =?us-ascii?Q?2z9UG0xLvyKHxbln3hf76/1dCfrvgwQrwCFL+G0+Cxi4yJYpalDHk6Iz/1yC?=
 =?us-ascii?Q?1vFbxHMa+Gk0QRpVHteBx+ZX6QKsXQ6aZV4N1Su7Rr2rHWl4iSgBAEhlvoau?=
 =?us-ascii?Q?dh10gJ7sSFCtM4e0nJUMToZfwXbvRJgWwj5rl34edufcGDe+mDpiRj633vo4?=
 =?us-ascii?Q?a9QTA5uUS0d/N7cT/XxWglE/5SKu9uVW6ARZkA+PTjnLRK3B5gfKHd1KdD8n?=
 =?us-ascii?Q?SJMNgZQKTUvHqEi2mxksqA6LlVvXftKYi/znkEG0ApQuLOMYCUJuw0Ae1eCI?=
 =?us-ascii?Q?gJUBjnp1c6rPDn1dqK+0e5bSMiXtMi1Ukj7O2z5EGfd9FVbXmx2s+wDDoHwW?=
 =?us-ascii?Q?M8P/E6K99dYYy5uLP9pSahfcr4OKtievwVV2aJzfuk/22pegQhxRxjiCZSDu?=
 =?us-ascii?Q?kXhdExCubeolx4EYPM+fWu6N1J/z3qiesHayTr7/coEtg5NyTqvxey44ZxvI?=
 =?us-ascii?Q?WTRMRU/HbGyrvMweOLk70b34IFFWHnB6daqE+IKk+i9usQQNvEcGahQ0gmHm?=
 =?us-ascii?Q?jbYax7tquri2brLUC9tTf3Nu+zaP1GDj9fNbXVsV45jqIY45?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf9f278-2f79-4770-bbc4-08de6ffb9119
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 21:12:19.4509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xp1AWEP4zbKso5Mswxn1gEL8VBpgUN9CiAStnRS8lakDC2HUUKHpH2rHdC88L/Ao4LOE31jk+AbVTx2lzSJCxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31905-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3E4C162A4C
X-Rspamd-Action: no action



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Thursday, February 19, 2026 2:51 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO dri=
ver
> > > Any reason to use __packed and alignement here?
> > > This structure will be copied in a vring buffer right?
> > >
> >
> > Using __packed together with an explicit alignment is a common pattern
> > for defining communication packets. The goal is to ensure a stable and
> > predictable layout across different architectures and compilers.
>=20
> Being mostly a netdev person, i can say that the network Maintainers actu=
ally
> refuses patches with __packed. If you have designed your protocol correct=
ly,
> defined your structure correctly, you should not need them.
>=20

The fact is that there are many __packed usages just under the Ethernet dir=
ectory.
$ grep -rn __packed drivers/net/ethernet | wc -l
553

Regards,
Shenwei

> We do however accept things like
>=20
>         BUILD_BUG_ON(sizeof(strcut foo) !=3D 8);
>=20
> just to make sure the compile is doing what you expect.
>=20
>         Andrew


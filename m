Return-Path: <linux-gpio+bounces-30782-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJwWCryDcGktYAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30782-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 08:43:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EEA52F6C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 08:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4B0F648632
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191D7426D27;
	Tue, 20 Jan 2026 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eT5iulCD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64910426D24;
	Tue, 20 Jan 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910374; cv=fail; b=i6tsH7jRLHZ2ZojT3E0E2sXpfPNknwdlWBU6pWc7L6TZ+3U8civ3ZjKldFzqBcPDZ4ViM2oxaO1ssYNlsEXl90q2Oq7ULZgXaEKxvBxG2BQFOGLLKoyBUhxpyQbZLlL0JQIKpRESPy5TJ0+wDcGL7cQDoqDB7ZNrqL9RjM5YskE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910374; c=relaxed/simple;
	bh=6Eakyr8j4Am6sUT/KEFtHJAOeFFKokzZTViojuF2ndI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A5JqjUQoq+RtKGT/3qmU7eKONx5rdUIhXwW0xZ4qj7E4pG78m8Kxd1PNTM+CJl+CzD5FSAnRYlXx1uVn+n9wC1x/PFS81n+hHglmooOZFcRxEvdM9uonwk6MaaUaBql5p0zgKPJymCFzGno4jeoTq9pmDZJYpkLFr4CaOE71tNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eT5iulCD; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1SgCObtF3s/GqcZ6LjpUdRZQ4EpAArM6aS4iD7b+8TiZ1kEabz9aDXQXhsHB1cCHLR+xRcLZqmfZI77GpCP2WPbmPd/jky8J3h86Y+CkkhZzvVxe0VbcE8Bw4J47PY5MQAuCdpusYX7rd3moSHLKWEbk8wHOsrGLeZAtQh6QC7xH0nKEh4OgllhR/kYeecrMvF6oUnpzsyiRamz3CUZGzCJGsxZLUlw4oeUR4W9Rm6urOGxI4yiuWJrFM0eoTrf8RoV7WmWl8heIALfrSugkEFSJYSBSfaugx9i9wGNDsiFevM370nwP+hVDtiAwt9IXnxrbleHuUGN7aRmo2CyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq80mSQO7X7dkm/1qg6GFsMsmXvHSIRQlhYAMlM5mL0=;
 b=D3WeesXgWY2vhwtstxbm7OKjzhJ6Xht49V54dQ7Hdj56I2wOuNnnLG2DmlAT7AWuAgrYK5negRvNghvweeFpVgnedk2snRLaCwJnngqO5uoAJKc5fZwxdiU4lAnNa7W6sCvVXMc9pA2e9HK+Dj1Vorrwa+q2d9kI5EhyJb7umL40FdbOGwj63SgH7AG61VY3cVIjZQ5xMi/NJ1x6gotC0tynHwGyLObg5Qz7QNvuiPpy34ZHaIovbqnbjS4cLcTxd+hLCG2FSCo2TZEPJDaixbGZBTuA/xSz85/oY0CFNljeXedKq9+XMVuTuvwHsVtVDJnkZT4Vp5ZBcjiKT1FPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cq80mSQO7X7dkm/1qg6GFsMsmXvHSIRQlhYAMlM5mL0=;
 b=eT5iulCDh1MD3Nxju6gKi5DhUWKbyf7qFrH4B5GHUWwfoRQJg+pVdphNXZyrp3anyG7sMFg6b4OqDfLSJOMiSWAzIdq362U8WrGHuqdjm9RWZPEbYNSmaBrpn9hXvYpLgpBsanb/+ON772YLBktMa4233K2ieknHliElbFuHTKJRCp3JaV9RgFDXemGGLfUukWbmxIiW305Z0nLoxDUzeXLPPJE4zAKxkD0speq9iWETKDCNE/dsRBiDhrG7FBb8dTFUbks46TrlxEfhI/JSm4/PAOg8mys0M445KPApqMFxpZEhC9qHQwrX80zYBEt7PLiZRyEr96m6MOWrzyGfVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:28 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:28 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2 module
Date: Tue, 20 Jan 2026 13:59:13 +0200
Message-ID: <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0445.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::18) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PAWPR04MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 45aaabb4-8905-4c16-9713-08de581b5ce2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xlHCJbyxgz4KZAjVo6VuhXn3QpE1nPrjpf145ZyMei4lpSYtpcG474Al5q1l?=
 =?us-ascii?Q?In/2VXRo0+KVHwflSGboAJq/OUCIZ5cC8AmsfPvLRKpEiUfp858QhiaH4KRx?=
 =?us-ascii?Q?zHKI824qxy+J2lVXjJImfwuphI7ZOi03wOXo3wCcNtmibEqReEKTY7wPTWyL?=
 =?us-ascii?Q?x807xst5Y6TG4JopER4VEOnXoXHTlAd/8naXpMaEMLbrIGIpsaEjiaKNry/9?=
 =?us-ascii?Q?j1YtiHYoVX3/DDbs40Fz5jHAmtU88MdPR8Ngx4G2bsNDxLdH02CZb8qFHels?=
 =?us-ascii?Q?NAlLmQKXmqujGext7LihJXz1klhJ40f4+D3l94iuVDz3qgl22S9PzzhjmU2K?=
 =?us-ascii?Q?RtrcJf3sYblDyoNy74T2Y27bByU4nKmC/AlKTLkke7Z832DhOXBerIneCe8L?=
 =?us-ascii?Q?ih0kbi39rlnQKKr8rnyBJ9K2rtd5sXm7R3gJckVW8e70VSmrEzcSCO61CYJg?=
 =?us-ascii?Q?5QLK9WmELLay23+sYNGRSFE9eM4nq5FqfQiSHIsSSM5P2AgVhO7hjfIs1aPo?=
 =?us-ascii?Q?mIBfY/TDvnXYdzVkgg3SM1yH21vqqwxM6QM2br+2fGj5l5c8rNXvFZMyB8NF?=
 =?us-ascii?Q?95q3NcEbLI3K/9hFB9CDf9YzLaq1koXGf0iRO5ux9ELZXwP7FyxvaFDtSYRR?=
 =?us-ascii?Q?MNdw0a6wbIF7dOFvXSxrZX3PRFcxEaupPPHBjTp2sc3L6s2YJtKuO0+8XFwF?=
 =?us-ascii?Q?acqrGKyLCsS7RHJcES9HF3WOtD1NDaQVEsicVCx/2hYIZiTaFu06NtRX6EBl?=
 =?us-ascii?Q?zk3PB6ttkPfJEKN0PtMCWvln819TPQSIeUai7Jqd/M55st1XqO+ppOoq2dEh?=
 =?us-ascii?Q?SKvYRi53aNtzxR4Fbp8dsj2ebHMkAjtBd2PtfSq41jSvMFWF+Q0IvCKYzFG0?=
 =?us-ascii?Q?dlIINNDQcinR5Mkra/jEA04l8+BjigxPfCJH0IbiWnEs2TPo5HIdVXoFxqgK?=
 =?us-ascii?Q?XV+glboCITq/ZWhrhq1gJu6Rkw/0fZhJddHe04q3nBBtVC/8v+Xl48R5Nbce?=
 =?us-ascii?Q?aamP+h2eefg/lULCBr8VNQvu4lftLghXnMfpKmhfDws8K8ShzQ/Ro+XTTLYc?=
 =?us-ascii?Q?fZUNSWG8C76pbfm+ktAndUszcjtPPr+p2Vz+0Mz5KpbsJ02Qh+OcfPRLZej5?=
 =?us-ascii?Q?iiuuT5h/IYhCVCQfZhkEhqmvfWjpuuuIuNjq2tT/GSXFGWLDjd+d1TsRN99D?=
 =?us-ascii?Q?TV9/ubIyPWj6jVicstRegR+VMBsryx3WgDSPbov8DE6YQCsJxEvdjkF1zEUu?=
 =?us-ascii?Q?+I+SOvB+mG9D8nOpdU9QHv46ZgcJEiCD4390qmR/M8JMIvJzxz3o9ErDVcRz?=
 =?us-ascii?Q?Xk8UDlz5DlZB077VoBcUel1uEl1avbuNSWSFL6Z/YWaC1UcSLG9JNdBXc6O/?=
 =?us-ascii?Q?ceZoSQ5/50YdRIrHZlrsqo5MDytrNwC9k92l9wc1wpbmS3WDTk6EFjlIzHfS?=
 =?us-ascii?Q?Kwve2yEpGIm+KWZ1q+ZyvLcHFBKHdcKj6TYtPLxSkdiSK8tH1Pgq0BlhXoCC?=
 =?us-ascii?Q?SUNWnLenPVfLNeF58/kaoBqo3HXUZ8zk5o5DrFTrCP5GvZafF1sZJ18xEfLe?=
 =?us-ascii?Q?MqF4Ppr61GWWAZBZLic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iv1n0kCVkni5dlmN+2eLBOKdcz0/lID9OjqeDHU9jlK9Ktj5yKi54O6HD1I5?=
 =?us-ascii?Q?42ShpbyVpUIx4IaWdwqvBVvH5JcPUDZJh802qbEx7X+M07JWSUhb9cbYz7dN?=
 =?us-ascii?Q?bnCqapNkfqM6Y7luu4XcS2Jtc92atuC0AzpdvohX9+A9B9JUtoo7MK2LX4bn?=
 =?us-ascii?Q?8JqP1hZGBOEcTni8X+Wdn1UYI9ylXIcgqLQpXkJDjhb25xd7A66FWo3lxH5L?=
 =?us-ascii?Q?PM1GN4wntklQ8aB4ulkwJpFrNqXYdIjtkgq3DgoRnkDKp1tnNYLnjM3NpDlX?=
 =?us-ascii?Q?FG8zrlmaZR8rxhSq7+9mgOFZxrYDG+ULcXd9MsFCXmX2QghVVtBJQyjdaLzl?=
 =?us-ascii?Q?H3URPqO5+LkElgCBcsShhGMbnoINnIcdzZGiUHNbwQPIs2apPM+f/ED3S2ny?=
 =?us-ascii?Q?tU3dulyZmCyZ9z3TAPSCCqZxaTSQR9D/kxTAmEJfzYJRxvpkqGcfaHGIbOHm?=
 =?us-ascii?Q?vJ5JrBOCBq//j+Q8piQoRvSXcHJnqp6h+StoJ8HirED26ciQnhQul3EEIZPH?=
 =?us-ascii?Q?ymvtG56R7t7uYPSfavq7BMYIV5aWlTPRFY284oMYtj6dU2uz4fW1jtH0X6y1?=
 =?us-ascii?Q?wwJpqfrVx+K7JW/qDrpGW82ZHassVpHtg+ieWOqyWy/NfkAN8wzGQYolr4KP?=
 =?us-ascii?Q?APCAH4WIalexlYbRRNkt7ELOOsN1ZHYPLnvvIpMH0EYfKW6045WQs7oXl4Rf?=
 =?us-ascii?Q?1iXoqQY7lalBRMZKgNXNv5se2rmN4ph0xDoIcD/nDFEOoEhJyyjmsFuU9Vzr?=
 =?us-ascii?Q?GIUOBbOU5Os/NVZKJC/8b0n0hcmucML23SrBfebJAqNmLdh3qmBQn42ZS4KJ?=
 =?us-ascii?Q?gto4KSNFQCGjz2mNa/5bpKsWW5OQ/vRDqw1giJTVyk2ey5h+VAWgqbnzP7d8?=
 =?us-ascii?Q?JRdcFyPlpOaXfxfnstoM9aDFMzlRpXp6Xl59VspadQzGnBTF4pS7Zcbnwt+O?=
 =?us-ascii?Q?927MA+2p2vIMtDA5459YRLmIkMpuUyYGEoaew/UUaiNbukruzUcHK+AS08SO?=
 =?us-ascii?Q?gG30zr0q5xVaBHN57nDsE7yia8ZYmLzgL+sBI5o3Ho8qaVF3EFUMbKWPSZ7U?=
 =?us-ascii?Q?gzDYHDFBsdXoQTRUnLy1/a9ew8Uj6GhfOqPy7U/L2WFbChCRkxJvSbia+YqZ?=
 =?us-ascii?Q?waAg8jtqsbHlvjhF0TPUZXRlRfpESA6imKI/0kmG04eyYT7J4CW0mCnbKRnd?=
 =?us-ascii?Q?QkseuJ2rUkk8eRTuIrKRvdb5GnTSkkXQT5eujOpHOGjORSowQ3NmXj+5280b?=
 =?us-ascii?Q?WToTw3XN0KLz7FE2dg23QTWg/FY+Rhvmg7b7jNPhOyzg4nLhVXXjtFSknK7W?=
 =?us-ascii?Q?RBa7qOZ+hfntyud5mYFtEE5K0SX2yfa6gbm3RxreUrLT9Je/fvkZfA6Pw9KN?=
 =?us-ascii?Q?RYnF8cznIkMBz0SKiGdrz0EFG/3eVo8wZRWC5YmreSt50OvAqr2UnSXfCYfo?=
 =?us-ascii?Q?tGBHQ3zAQjbjWNCzl1CtOfvlXp4CRpILt0HkAXScwO+673OeTuvMxXrPQ9iW?=
 =?us-ascii?Q?ZOtVzil5IF3E+vCM/frvMbGylIcaluHWd6LTxSWKaBI3gft7W9eH8sIyNcNc?=
 =?us-ascii?Q?mmw87k7autXwmIi3eFml5lEQxfNSHwZjYISwgmLscOy4JF+mkvD8WOTLCmxZ?=
 =?us-ascii?Q?RHZHMWgV7A0l2JES4ydVQ3XqjBJwF14Vaxvpwl2rbNRh+c6txahs4/1Hsu4d?=
 =?us-ascii?Q?edTzcVClESWFSGgZ0P6bjRkCjgakb+mfueZy2WFfKzUhB9fy+ZZ/K7VIFYNh?=
 =?us-ascii?Q?rn6MMqTWQ/RB4Tv5kAScX785z3zEyoCkdWVAlUjnQUDSVQgPJTAY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45aaabb4-8905-4c16-9713-08de581b5ce2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:28.0065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJOYyPjiVkMZ37sQ2bhArBmQwlrBbs0mDTPTdeeu8jK3vF5oK6Q1e0PYe/dc8m9m/E2E3TS+flfllIrjYNe8eSKJ187pNXE5Tw32wV9lpenrkbbpEX53Vq0lT9UFQCCP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	URIBL_MULTI_FAIL(0.00)[ams.mirrors.kernel.org:server fail,oss.nxp.com:server fail,devicetree.org:server fail,4009c000:server fail,NXP1.onmicrosoft.com:server fail,nxp.com:server fail,2.159.138.16:server fail];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-30782-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,nxp.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,NXP1.onmicrosoft.com:dkim,2.159.138.16:email]
X-Rspamd-Queue-Id: B0EEA52F6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Add the new dt-bindings for the NXP SIUL2 module which is a multi
function device. It can export information about the SoC, configure
the pinmux&pinconf for pins and it is also a GPIO controller with
interrupt capability.

The existing SIUL2 pinctrl bindings becomes deprecated because it
do not correctly describe the hardware. The SIUL2 module also
offers GPIO control and exposes some registers which contain
information about the SoC. Adding drivers for these functionalities
would result in incorrect bindings with a lot of carved out regions
for registers.

SIUL2 is a complex module that spans multiple register regions
and provides several functions: pinmux and pin configuration
through MSCR and IMCR registers, GPIO control through PGPDO
and PGPDI registers, interrupt configuration registers,
and SoC identification registers (MIDR).
These registers are grouped under two instances, SIUL2_0 and
SIUL2_1, and share the same functional context. The legacy
binding models SIUL2 as a standalone pinctrl node, which only
covers MSCR and IMCR.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 ++++++++++++++++++
 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   2 +
 2 files changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
new file mode 100644
index 000000000000..ec743cf5f73e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32 System Integration Unit Lite2 (SIUL2)
+
+maintainers:
+  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
+
+description: |
+  SIUL2 is a hardware block which implements pinmuxing,
+  pinconf, GPIOs (some with interrupt capability) and
+  registers which contain information about the SoC.
+  There are generally two SIUL2 modules whose functionality
+  is grouped together. For example interrupt configuration
+  registers are part of SIUL2_1 even though interrupts are
+  also available for SIUL2_0 pins.
+
+  The following register types are exported by SIUL2:
+    - MIDR (MCU ID Register) - information related to the SoC
+    - interrupt configuration registers
+    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
+    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
+    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
+    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
+
+  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
+  16bit wide.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-siul2
+      - items:
+          - enum:
+              - nxp,s32g3-siul2
+          - const: nxp,s32g2-siul2
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    description: Address translation ranges for child nodes.
+
+
+patternProperties:
+  "^siul2_[0-1]$":
+    type: object
+    description: SIUL2 hardware instances represented as syscon.
+    properties:
+      compatible:
+        const: syscon
+      reg:
+        maxItems: 1
+    required:
+      - compatible
+      - reg
+
+  "-hog(-[0-9]+)?$":
+    required:
+      - gpio-hog
+
+  "-pins$":
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "-grp[0-9]$":
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+          - $ref: /schemas/pinctrl/pincfg-node.yaml#
+        description:
+          Pinctrl node's client devices specify pin muxes using subnodes,
+          which in turn use the standard properties below.
+
+        properties:
+          pinmux:
+            description: |
+              An integer array for representing pinmux configurations of
+              a device. Each integer consists of a PIN_ID and a 4-bit
+              selected signal source(SSS) as IOMUX setting, which is
+              calculated as: pinmux = (PIN_ID << 4 | SSS)
+
+          slew-rate:
+            description: Supported slew rate based on Fmax values (MHz)
+            enum: [83, 133, 150, 166, 208]
+        required:
+          - pinmux
+
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pinctrl@4009c000 {
+      compatible = "nxp,s32g2-siul2";
+      gpio-controller;
+      #gpio-cells = <2>;
+      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      siul2_0: siul2_0@4009c000 {
+        compatible = "syscon";
+        reg = <0x0 0x4009c000 0x0 0x179c>;
+      };
+
+      siul2_1: siul2_1@44010000 {
+        compatible = "syscon";
+        reg = <0x0 0x44010000 0x0 0x17b0>;
+      };
+
+      jtag-pins {
+        jtag-grp0 {
+          pinmux = <0x0>;
+          input-enable;
+          bias-pull-up;
+          slew-rate = <166>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index a24286e4def6..332397a21394 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
   - Chester Lin <chester62515@gmail.com>
 
+deprecated: true
+
 description: |
   S32G2 pinmux is implemented in SIUL2 (System Integration Unit Lite2),
   whose memory map is split into two regions:
-- 
2.50.1



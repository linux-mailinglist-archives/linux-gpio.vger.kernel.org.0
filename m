Return-Path: <linux-gpio+bounces-30783-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMQdE4cccGkEVwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30783-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 01:23:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC44E773
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 01:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8D8D98409C1
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E259D426EB0;
	Tue, 20 Jan 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GEWyfcvx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4F426D36;
	Tue, 20 Jan 2026 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910377; cv=fail; b=BfUNH6i6NKkseheYd8/1fXWfeYqniXxMjZOjTDKBk19Lj5jILxWlaYOhdqaSy0BgRdHKW4401AXqc6sU88WseEHHW2vRRkb8a4aErDDGcpTIygxkpick3j9rZrw2HNJxaMgVYCMs1JzYSOsdCc3E+d8qptNUuZg00C4k54e1UzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910377; c=relaxed/simple;
	bh=5UNCMPPtmQWpUa0GAg11lt8a2P26NoFnB1ltuxRSk0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vd/Duc+A8YVlYBPEovdOEr5OfRoiIYGQjgxH3WEc/zEpRnokmx+I+x7H17nYD/hDhuvWQ655iY37uV7XkJcktLMLxjJAFlgLp71h7fqEzV97PrHvcqam6myGcTJJN0Wsm1LW5HYhBJN19DW5nWoOLuZqCWYHLBK69Ny8jalsOUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GEWyfcvx; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xi6Mbru/BuI5JEawpfy6Ic0sHCIVhIva+7bgBlA9Z4iAPaxia+ZNMmrGzG0Erd8lR/tz0LLLNaL5tKr/6X+c/RN9U1ptBoFUaslyeTbpk3t7+bc4EszWvM9pldESRg1eYiftY83W8I8T8VpYZyB7TEQ2wD1jXU2O7dQafuALOh9VraGYXUfW5EdSTMox8Ad6wJ0R7fnU4VnPL5Z/33pnTbywp/HBd0jH7Fc0Ah6TuGs02tr5uhLgfjq0lxkVyzWCL2QM4i6/2MHpe94uJQOiFLUFGbKuZgoTqpgOl2hODuTgQZnX1Nhss8ig0Ip68XAdoWbLlvqFcUoei1mKO+QkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPEYeItL3ZMpoeIwtwI2Q3Q+Ck5prs7ItbjdQDeWEa8=;
 b=LINhHNtqa8GhWPk2nFeM66lfUE+1gtA9thbZr3fxXR/1SYzINCjdPyA7XVhhJdhTpgPUzlCscu983DjrU46F5KgPYOhZiPiCCIFyUb21n2tHjhrxcDDzkdg5GcTspHFiC0ICZyzZRJRtXoBwrEG3BLmTg/piOKNmXrrw+0aQMxR+BR6KHVEVwt5N8N3qpqkw7TGjBJubz8Y1IH/lIuPZfh/Muo49yvtiPmYRcFbwVvBhy80GdbRhECBVvW3jzUsF6xS7ZNNk27UY5QCvPJuVfrGDNcoM+Cwb6KSXIY5wiSbxdk5r/bc5JhQP2eiumH92rkHxbBMMrs1zBQp2uXcY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPEYeItL3ZMpoeIwtwI2Q3Q+Ck5prs7ItbjdQDeWEa8=;
 b=GEWyfcvxlc37u1Yxs/Np/O1kQ2opcPM2G2p5KZwl2gHzWSp1BDmrA8x5ASp1NV+4zFbfEfeKId5VJ8ieOJBH86eCbTYgnKkrjF39gfRbWsdD6cG+O0rqu8GhzD7Tse34X/iAXeLl2mg4nz1eKr62f5RZCpt07LtaazqjqKnLfEgDdb9Ve5W9OS4lTl9ZMuhr6bCYgov0gDk5TM63NeZTtCwme1/Gsdd72jwS64M8+JQI5ZDY4bZv7A/L0nmFS6ntD6sPoQIXpOy37vVFvMIETjZluK5NjfCI7VVMWQk5SDsahrG75kMm4rVfrZ4AXbvK4Hr7xTVbQzDmxxbMVgFwdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:30 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:30 +0000
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
Subject: [PATCH v8 02/10] mfd: nxp-siul2: add support for NXP SIUL2
Date: Tue, 20 Jan 2026 13:59:14 +0200
Message-ID: <20260120115923.3463866-3-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0447.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::13) To PAXPR04MB8190.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: bd476eeb-fea6-4dd0-04a5-08de581b5e37
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8RT318S330au+JVzx0w3U282NRjQy1j/0hHythj6dMWuDja1OiN0d2fBFcJ3?=
 =?us-ascii?Q?ltp6W03awOzwTd8ZZRo3bZNsVotb26rxYofdc5Tq+4Pu+BjRip/0xMHRgegV?=
 =?us-ascii?Q?rrLVIMckS9JHkwM8Jg90o2gviodCMaKcc0p4XGE0SFMfagQQKkaif9acvTos?=
 =?us-ascii?Q?xSlL66+5H5vf0RnrsIGsXp4eo3wrsdReq50zu1u1SLs2a/jhUiTQJJIQUEdX?=
 =?us-ascii?Q?D/nkqtUejUrX69J3Lw22NEdXr34W6ea6DRVh6NXX7WhpRoA4aQaQEpqnyVYY?=
 =?us-ascii?Q?UxB2F2xbmeD8/+uYnVJ+C4OBHDhqO7YSw/CIoRhPxP9aSmGXV9Ui58HdNHcZ?=
 =?us-ascii?Q?hUyXJ45ydSKzEgU+fdGbyS74Uq+86n5dJHlAi8KJ5LvgdAEoWTdjVDx9txNB?=
 =?us-ascii?Q?FGuOCbF8JA9BkHiOKsUpEYor1hXJs/2Rp9l5Itufa1Iyi1kbyisC/J1gqNLV?=
 =?us-ascii?Q?4/o0Arep8Yfsqe0y7eC4cKuhlWxrFs+MU9bpDdaLf+6Fqr6cdTiB3T99I1uY?=
 =?us-ascii?Q?fubZmjA4ygLXg5noZXDayPCRla/osw84aNrSJmL4fs0ZBbdsunUDqayXL7Ky?=
 =?us-ascii?Q?7QRUNekGiZkJlR/tIR+BLLNnTK+5XS6hN+gGJMezCESZcJI13NMiDPSOoeI6?=
 =?us-ascii?Q?YBuV7QSr4HoP+d+2I8kjqxXLrpbUEBu+3bQaJCp+zdbDW2WcfTCLthg2s67K?=
 =?us-ascii?Q?B4BhDA+p9MIwZ0aOoR1Oi9djlDiPV9G3FmSlQX0yLdZVP+Ml5BoKYYDaV8Jj?=
 =?us-ascii?Q?KspgBjqeeGkz+GwSXObZqOZ26+8Y+jGxygwyiyz6CsBbivxwlq8w2cP8SEL+?=
 =?us-ascii?Q?Dt/Upr73NaHTfCPMLZU+MHPxMbWDrpzms0QO2l0XGiT7v/XxX5IQtcUgN/5A?=
 =?us-ascii?Q?Cwq65U2l54jVIFp6lJWla8Yvi9PDr4WvA2RjZw4fkR2W4epueiyFtFiPBVW4?=
 =?us-ascii?Q?hiQgoDyZgB4T8OIObiJxFpZa+fWinQOaXL6pJccMcvmCVFzR6XJ7NLEirTQg?=
 =?us-ascii?Q?DjA1qiv+7zWTPy8dG1/VyLbMsMS5E5GMEg8htbwmdFTSUsk9+zvm1FC1aEmD?=
 =?us-ascii?Q?nEU0pjzrzcbfw3Rnuam2OYwr7NbisQylJijz9NBvah5SOj+cjXUrL/KRw4ZF?=
 =?us-ascii?Q?4Cyabl4mFXz1lr875ITVZ1AgA6nz2BkJxbDPLcsIFpRVILbcEhfVEbOPxtQu?=
 =?us-ascii?Q?mRL21GnaAmde5cM7UBI9vwy5s0MMfOFZGMq5jnk5uM+Bkjqcxbvknuewd0VB?=
 =?us-ascii?Q?4uX+IFqNo6iQIL0ZwUKa8fZuOd/e0k8Aa50w7+nTRuyOTWkmUJxarq49Hiky?=
 =?us-ascii?Q?qquG2HGxR5molSn8lc+baKu7imJHG4GNZ+mtjmwUGADvMTKwGChjO3sD3yW3?=
 =?us-ascii?Q?MyUtuWq5yO3MYzxpBcRv1r3wGR24e4BpeaB5bjaZ3wuwrmXJUvAq21L+hUxX?=
 =?us-ascii?Q?SmyoJicNI+P20LeOAItNsH28UEKghcGk6tw//PIFQDwAg0Vs3BdVI7sDYhPG?=
 =?us-ascii?Q?KGGiIo3UNMpKQM1Pw1UbTQTkP3BYFUihuK+IAGT5wDW8VloIjJnTtiR7jLld?=
 =?us-ascii?Q?++73hzWsuEK6fYlJ3inXaBZKNhFTiCc5Fji2BVgiav5WRrAALL7l2QRc6100?=
 =?us-ascii?Q?Ww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6b+0K2qF7UzdxqOtXwpqs67JwaKVVJZXNCy7gDK5+4bxDezzpQ/YD5wNL0xT?=
 =?us-ascii?Q?chbciAi898whXlsHXBZz6ofDDlNx1f5YYnT09xH5vD8rFdCf+tzKqRI2C78P?=
 =?us-ascii?Q?INCPPXMQtHJmYyLkqX7DxYM3ZdvJyC4ao0u74yNC/5aoJhG16X3aRSC2plPY?=
 =?us-ascii?Q?LQTRTNQLSewEuy1OyWXtH3uZhA5ehfRVRNx2e6A4vYiR8j+dfSwFIkBhseXn?=
 =?us-ascii?Q?RGO9H3bNKn3gSDDpwH8tfF8hrTZS+6+gregXml1gdMosxbLq4ngoB2s/BS9K?=
 =?us-ascii?Q?j2o5Fjz/eLXF6qycu5C7VtIvI8DeEajrVPOulwQKf+0Pvb7ouoRQLYpQb3Pt?=
 =?us-ascii?Q?iIiupIwT3AYl7QDdTy9KYCEmrsxR+2RiB2NMyX/84fJUaboX159TaAJQF//T?=
 =?us-ascii?Q?pFw3TC/WOFv0JNVBBHTHpubfSpv+nhNMVeyRIPdQ3jvNNufjZASo3gKYZf77?=
 =?us-ascii?Q?kl9fl3wPz6w17122IJxG8uCIZUNnnd5df2I9RGLkQ+YtboDxp7QxL5qHGBn6?=
 =?us-ascii?Q?PkaOcIpzmaF8jI9zFbX9y+bYphw3Dq8KvMbRhVvisDg2LtMbXs7E2pNNWKDk?=
 =?us-ascii?Q?tn9o5P2keeC89ElgaGaLwF4uMz3o19gNzzuuP6GL6tMHSEYgYxysirAysy1P?=
 =?us-ascii?Q?Qwq6eM4G5zkavMneheL8MlzG6tvAOs/pw2QgJJd83UQ27H6JCqpA9QCO2GCL?=
 =?us-ascii?Q?d9Ja/dzMy6mRnUhIP2VeBWtpqAkxJDgtQcr2Dme0rjmJGWB40CfZTtsczzbz?=
 =?us-ascii?Q?fA2YKGIB4G+LzzuEYh0qN3v/hLZNjCQRSL1i7D/szsNlzBSVHTCP2Is3QwMi?=
 =?us-ascii?Q?n38DXafd2x/6ApXbFnNepzAs6BX9WAGr/gSlNj3PMK04u8QytuM5j3rdiyhx?=
 =?us-ascii?Q?F1qqCXH5oMMqLiaTLu4vNVcr9BYtgMrnQxxAxHmRgCCiVNKBeFfvcFPlgupr?=
 =?us-ascii?Q?ZcQfsfEmpD/mfaEbeBBE8/KZAV6sSxpB43MxxkQvBkqbOeCMotBRPJmm1Ywc?=
 =?us-ascii?Q?DNCp1qX2b/cVj7unrBGhHNZKJ4qGyGGiZJeDo0A9En2ffKcQLT+is6EXB3+R?=
 =?us-ascii?Q?Wb427BNFthZT3EGiH4k0KRTMgZJXroNysnJrJ4vyCgQZOIZekvreWYItEBMZ?=
 =?us-ascii?Q?sJ6fS38Jtiwfyl+oHaJsTXyp2PbJg7xmqFhdYU8n29WDeZOjGAf/o4jHd6jc?=
 =?us-ascii?Q?gpY/DyWWRJu0QdPBGswxHr8/nw2IGTAPSCjnz8fCaCyw1eg86aITD31aEVJ1?=
 =?us-ascii?Q?0PI/3lIQJu46ff58IW0YDcp2k6jOyZ5FU1XLdbK2m8HVWpm03p4WcFHQ6l3i?=
 =?us-ascii?Q?/yVl5+YGK41DXlitNuUjMNjJyIiQmbEf1y2YlBHFMOAlWDhEoBr1FVEDWAJ6?=
 =?us-ascii?Q?4nnPOxyg0TzgFGQgLIBkeZg/d3YtgmEsmCgXC4/AKc2poAGKRAm119RjDClr?=
 =?us-ascii?Q?M5w1qRmK7tX7ivYP3f4oorDmB/ShDRuR8cWU/W3oL8QBpucoRM6+qWBG10W0?=
 =?us-ascii?Q?xcN5/IYQ0vcLc0vXqVNZCiKygQXVMDwXtYl2Py/7Cc48CiMTPKZNS9lvaLhk?=
 =?us-ascii?Q?HNWxjJ9CtuEQ5BwkrinUhQzUgVZX8nS3UK/+6q1GwZUIkiU1EkaZ/UPWYycl?=
 =?us-ascii?Q?hTznJdaF0QcivRiVuINCAfuR2sEhbEOgUmBTgkiyzTC5ChSysGehMQGf4ppC?=
 =?us-ascii?Q?wERPKIIHOhXuLZkbpcPkkugLrKPuH11CRsN7D+an8PxRkbjT+oPtgTHzkRDq?=
 =?us-ascii?Q?LkBMHW1Ea8BCDKqqE9BKnpR10eF5Ggi/rRL8j0tcgBidgBlhiK2R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd476eeb-fea6-4dd0-04a5-08de581b5e37
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:30.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlTPAhyggKc2vxTgfza4xzbvA1LgKOu+vHFCB3jE78HVkEzdWaYPeXXUSEogeNUPonvm+O9oqcXQ38NLKvNwGmqBNKIUfvmwgbaSPUuSYVrBkPX76nk5burEMxcbxHKa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-30783-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,NXP1.onmicrosoft.com:dkim,pinspec.np:url]
X-Rspamd-Queue-Id: 72CC44E773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Add support for the NXP SIUL2 module as an MFD device.

SIUL2 (System Integration Unit Lite) is a hardware module which
implements various functionalities:
- reading SoC information
- pinctrl
- GPIO (including interrupts)

Add support for pinctrl&GPIO(one cell).

There are multiple register types in the SIUL2 module:
- MIDR (MCU ID Register)
	* contains information about the SoC.
- Interrupt related registers
	* There are 32 interrupts named EIRQ. An EIRQ
	  may be routed to one or more GPIOs. Not all
	  GPIOs have EIRQs associated with them
- MSCR (Multiplexed Signal Configuration Register)
	* handle pinmuxing and pinconf
- IMCR (Input Multiplexed Signal Configuration Register)
	* are part of pinmuxing
- PGPDO/PGPDI (Parallel GPIO Pad Data Out/In Register)
	* Write/Read the GPIO value

There are two SIUL2 modules in the S32G SoC. This driver handles
both because functionality is shared between them. For example:
some GPIOs in SIUL2_0 have interrupt capability but the registers
configuring this are in SIUL2_1.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/mfd/Kconfig           |  13 +
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/nxp-siul2.c       | 440 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/nxp-siul2.h |  55 +++++
 4 files changed, 509 insertions(+)
 create mode 100644 drivers/mfd/nxp-siul2.c
 create mode 100644 include/linux/mfd/nxp-siul2.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38a..3a8104a703ff 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1232,6 +1232,19 @@ config MFD_NTXEC
 	  certain e-book readers designed by the original design manufacturer
 	  Netronix.
 
+config MFD_NXP_SIUL2
+	tristate "NXP SIUL2 MFD driver"
+	select MFD_CORE
+	select REGMAP_MMIO
+	depends on ARCH_S32 || COMPILE_TEST
+	help
+	  Select this to get support for the NXP SIUL2 (System Integration
+	  Unit Lite) module. This hardware block contains registers for
+	  SoC information, pinctrl and GPIO functionality. This will
+	  probe a MFD driver which will contain cells for a combined
+	  pinctrl&GPIO driver and syscon cells for SIUL2_0 and SIUL2_1
+	  to expose SoC information.
+
 config MFD_RETU
 	tristate "Nokia Retu and Tahvo multi-function device"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..d29adf8f04f0 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -230,6 +230,7 @@ obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
 obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_NTXEC)		+= ntxec.o
+obj-$(CONFIG_MFD_NXP_SIUL2) 	+= nxp-siul2.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
 obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
diff --git a/drivers/mfd/nxp-siul2.c b/drivers/mfd/nxp-siul2.c
new file mode 100644
index 000000000000..543de4aac1c0
--- /dev/null
+++ b/drivers/mfd/nxp-siul2.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SIUL2(System Integration Unit Lite) MFD driver
+ *
+ * Copyright 2025-2026 NXP
+ */
+#include <linux/init.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nxp-siul2.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#define S32G_NUM_SIUL2 2
+
+#define S32_REG_RANGE(start, end, name, access)		\
+	{						\
+		.reg_name = (name),			\
+		.reg_start_offset = (start),		\
+		.reg_end_offset = (end),		\
+		.reg_access = (access),			\
+		.valid = true,				\
+	}
+
+#define S32_INVALID_REG_RANGE		\
+	{				\
+		.reg_name = NULL,	\
+		.reg_access = NULL,	\
+		.valid = false,		\
+	}
+
+static const struct mfd_cell nxp_siul2_devs[] = {
+	{
+		.name = "s32g-siul2-pinctrl",
+	}
+};
+
+/**
+ * struct nxp_siul2_reg_range_info: a register range in SIUL2
+ * @reg_name: the name for the register range
+ * @reg_access: the read/write access tables if not NULL
+ * @reg_start_offset: the first valid register offset
+ * @reg_end_offset: the last valid register offset
+ * @valid: whether the register range is valid or not
+ */
+struct nxp_siul2_reg_range_info {
+	const char *reg_name;
+	const struct regmap_access_table *reg_access;
+	unsigned int reg_start_offset;
+	unsigned int reg_end_offset;
+	bool valid;
+};
+
+static const struct regmap_range s32g2_siul2_0_imcr_reg_ranges[] = {
+	/* IMCR0 - IMCR1 */
+	regmap_reg_range(0, 4),
+	/* IMCR3 - IMCR61 */
+	regmap_reg_range(0xC, 0xF4),
+	/* IMCR68 - IMCR83 */
+	regmap_reg_range(0x110, 0x14C)
+};
+
+static const struct regmap_access_table s32g2_siul2_0_imcr = {
+	.yes_ranges = s32g2_siul2_0_imcr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_imcr_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_0_pgpd_reg_ranges[] = {
+	/* PGPD*0 - PGPD*5 */
+	regmap_reg_range(0, 0xA),
+	/* PGPD*6 - PGPD*6 */
+	regmap_reg_range(0xE, 0xE),
+};
+
+static const struct regmap_access_table s32g2_siul2_0_pgpd = {
+	.yes_ranges = s32g2_siul2_0_pgpd_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_pgpd_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_1_irq_reg_ranges[] = {
+	/* DISR0 */
+	regmap_reg_range(0x10, 0x10),
+	/* DIRER0 */
+	regmap_reg_range(0x18, 0x18),
+	/* DIRSR0 */
+	regmap_reg_range(0x20, 0x20),
+	/* IREER0 */
+	regmap_reg_range(0x28, 0x28),
+	/* IFEER0 */
+	regmap_reg_range(0x30, 0x30),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_irq = {
+	.yes_ranges = s32g2_siul2_1_irq_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_reg_ranges),
+};
+
+static const struct regmap_range s32g2_siul2_1_irq_volatile_reg_range[] = {
+	/* DISR0 */
+	regmap_reg_range(0x10, 0x10)
+};
+
+static const struct regmap_access_table s32g2_siul2_1_irq_volatile = {
+	.yes_ranges = s32g2_siul2_1_irq_volatile_reg_range,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_volatile_reg_range),
+};
+
+static const struct regmap_range s32g2_siul2_1_mscr_reg_ranges[] = {
+	/* MSCR112 - MSCR122 */
+	regmap_reg_range(0, 0x28),
+	/* MSCR144 - MSCR190 */
+	regmap_reg_range(0x80, 0x138)
+};
+
+static const struct regmap_access_table s32g2_siul2_1_mscr = {
+	.yes_ranges = s32g2_siul2_1_mscr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_mscr_reg_ranges),
+};
+
+static const struct regmap_range s32g2_siul2_1_imcr_reg_ranges[] = {
+	/* IMCR119 - IMCR121 */
+	regmap_reg_range(0, 8),
+	/* IMCR128 - IMCR129 */
+	regmap_reg_range(0x24, 0x28),
+	/* IMCR143 - IMCR151 */
+	regmap_reg_range(0x60, 0x80),
+	/* IMCR153 - IMCR161 */
+	regmap_reg_range(0x88, 0xA8),
+	/* IMCR205 - IMCR212 */
+	regmap_reg_range(0x158, 0x174),
+	/* IMCR224 - IMCR225 */
+	regmap_reg_range(0x1A4, 0x1A8),
+	/* IMCR233 - IMCR248 */
+	regmap_reg_range(0x1C8, 0x204),
+	/* IMCR273 - IMCR274 */
+	regmap_reg_range(0x268, 0x26C),
+	/* IMCR278 - IMCR281 */
+	regmap_reg_range(0x27C, 0x288),
+	/* IMCR283 - IMCR286 */
+	regmap_reg_range(0x290, 0x29C),
+	/* IMCR288 - IMCR294 */
+	regmap_reg_range(0x2A4, 0x2BC),
+	/* IMCR296 - IMCR302 */
+	regmap_reg_range(0x2C4, 0x2DC),
+	/* IMCR304 - IMCR310 */
+	regmap_reg_range(0x2E4, 0x2FC),
+	/* IMCR312 - IMCR314 */
+	regmap_reg_range(0x304, 0x30C),
+	/* IMCR316 */
+	regmap_reg_range(0x314, 0x314),
+	/* IMCR 318 */
+	regmap_reg_range(0x31C, 0x31C),
+	/* IMCR322 - IMCR340 */
+	regmap_reg_range(0x32C, 0x374),
+	/* IMCR343 - IMCR360 */
+	regmap_reg_range(0x380, 0x3C4),
+	/* IMCR363 - IMCR380 */
+	regmap_reg_range(0x3D0, 0x414),
+	/* IMCR383 - IMCR393 */
+	regmap_reg_range(0x420, 0x448),
+	/* IMCR398 - IMCR433 */
+	regmap_reg_range(0x45C, 0x4E8),
+	/* IMCR467 - IMCR470 */
+	regmap_reg_range(0x570, 0x57C),
+	/* IMCR473 - IMCR475 */
+	regmap_reg_range(0x588, 0x590),
+	/* IMCR478 - IMCR480*/
+	regmap_reg_range(0x59C, 0x5A4),
+	/* IMCR483 - IMCR485 */
+	regmap_reg_range(0x5B0, 0x5B8),
+	/* IMCR488 - IMCR490 */
+	regmap_reg_range(0x5C4, 0x5CC),
+	/* IMCR493 - IMCR495 */
+	regmap_reg_range(0x5D8, 0x5E0),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_imcr = {
+	.yes_ranges = s32g2_siul2_1_imcr_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_imcr_reg_ranges)
+};
+
+static const struct regmap_range s32g2_siul2_1_pgpd_reg_ranges[] = {
+	/* PGPD*7 */
+	regmap_reg_range(0xC, 0xC),
+	/* PGPD*9 */
+	regmap_reg_range(0x10, 0x10),
+	/* PDPG*10 - PGPD*11 */
+	regmap_reg_range(0x14, 0x16),
+};
+
+static const struct regmap_access_table s32g2_siul2_1_pgpd = {
+	.yes_ranges = s32g2_siul2_1_pgpd_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_pgpd_reg_ranges)
+};
+
+static const struct nxp_siul2_reg_range_info
+s32g2_reg_ranges[S32G_NUM_SIUL2][SIUL2_NUM_REG_TYPES] = {
+	/* SIUL2_0 */
+	{
+		[SIUL2_MIDR] = S32_REG_RANGE(4, 8, "SIUL2_0_MIDR", NULL),
+		/* Interrupts are to be controlled from SIUL2_1 */
+		[SIUL2_IRQ] = S32_INVALID_REG_RANGE,
+		[SIUL2_MSCR] = S32_REG_RANGE(0x240, 0x3D4, "SIUL2_0_MSCR",
+					     NULL),
+		[SIUL2_IMCR] = S32_REG_RANGE(0xA40, 0xB8C, "SIUL2_0_IMCR",
+					     &s32g2_siul2_0_imcr),
+		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x170E,
+					      "SIUL2_0_PGPDO",
+					      &s32g2_siul2_0_pgpd),
+		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x174E,
+					      "SIUL2_0_PGPDI",
+					      &s32g2_siul2_0_pgpd),
+	},
+	/* SIUL2_1 */
+	{
+		[SIUL2_MIDR] = S32_REG_RANGE(4, 8, "SIUL2_1_MIDR", NULL),
+		[SIUL2_IRQ] = S32_REG_RANGE(0x10, 0xC0, "SIUL2_1_IRQ",
+					    &s32g2_siul2_1_irq),
+		[SIUL2_MSCR] = S32_REG_RANGE(0x400, 0x538, "SIUL2_1_MSCR",
+					     &s32g2_siul2_1_mscr),
+		[SIUL2_IMCR] = S32_REG_RANGE(0xC1C, 0x11FC, "SIUL2_1_IMCR",
+					     &s32g2_siul2_1_imcr),
+		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x1716,
+					      "SIUL2_1_PGPDO",
+					      &s32g2_siul2_1_pgpd),
+		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x1756,
+					      "SIUL2_1_PGPDI",
+					      &s32g2_siul2_1_pgpd),
+	},
+};
+
+static const struct regmap_config nxp_siul2_regmap_irq_conf = {
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+	.volatile_table = &s32g2_siul2_1_irq_volatile,
+};
+
+static const struct regmap_config nxp_siul2_regmap_generic_conf = {
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config nxp_siul2_regmap_pgpdo_conf = {
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 2,
+	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config nxp_siul2_regmap_pgpdi_conf = {
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.reg_bits = 32,
+	.reg_stride = 2,
+	.cache_type = REGCACHE_NONE,
+	.use_raw_spinlock = true,
+};
+
+static int nxp_siul2_init_regmap(struct platform_device *pdev,
+				 void __iomem *base, unsigned int siul)
+{
+	const struct regmap_config *regmap_configs[SIUL2_NUM_REG_TYPES] = {
+		[SIUL2_MIDR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_IRQ]	= &nxp_siul2_regmap_irq_conf,
+		[SIUL2_MSCR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_IMCR]	= &nxp_siul2_regmap_generic_conf,
+		[SIUL2_PGPDO]	= &nxp_siul2_regmap_pgpdo_conf,
+		[SIUL2_PGPDI]	= &nxp_siul2_regmap_pgpdi_conf,
+	};
+	const struct nxp_siul2_reg_range_info *tmp_range;
+	struct regmap_config tmp_conf;
+	struct nxp_siul2_info *info;
+	struct nxp_siul2_mfd *priv;
+	void __iomem *reg_start;
+	int i;
+
+	priv = platform_get_drvdata(pdev);
+	info = &priv->siul2[siul];
+
+	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
+		if (!s32g2_reg_ranges[siul][i].valid)
+			continue;
+
+		tmp_range = &s32g2_reg_ranges[siul][i];
+		tmp_conf = *regmap_configs[i];
+		tmp_conf.name = tmp_range->reg_name;
+		tmp_conf.max_register =
+			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
+
+		if (tmp_conf.cache_type != REGCACHE_NONE)
+			tmp_conf.num_reg_defaults_raw =
+				1 + tmp_conf.max_register / tmp_conf.reg_stride;
+
+		if (tmp_range->reg_access) {
+			tmp_conf.wr_table = tmp_range->reg_access;
+			tmp_conf.rd_table = tmp_range->reg_access;
+		}
+
+		reg_start = base + tmp_range->reg_start_offset;
+		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
+							 &tmp_conf);
+		if (IS_ERR(info->regmaps[i]))
+			return dev_err_probe(&pdev->dev,
+					     PTR_ERR(info->regmaps[i]),
+					     "regmap %d init failed: %ld\n", i,
+					     PTR_ERR(info->regmaps[i]));
+	}
+
+	return 0;
+}
+
+static int nxp_siul2_parse_dtb(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args pinspec;
+	struct nxp_siul2_mfd *priv;
+	struct device_node *child;
+	struct resource res;
+	void __iomem *base;
+	int i = 0, ret;
+
+	priv = platform_get_drvdata(pdev);
+
+	for_each_child_of_node(pdev->dev.of_node, child) {
+		if (!of_device_is_compatible(child, "syscon"))
+			continue;
+
+		if (i >= priv->num_siul2)
+			break;
+
+		ret = of_address_to_resource(child, 0, &res);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to get resource for %pOF\n", child);
+
+		base = devm_ioremap_resource(&pdev->dev, &res);
+		if (IS_ERR(base))
+			return dev_err_probe(&pdev->dev, PTR_ERR(base),
+					     "Failed to ioremap %pOF\n", child);
+
+		ret = nxp_siul2_init_regmap(pdev, base, i);
+		if (ret)
+			return ret;
+
+		/* Parse gpio-ranges for current SIUL2 instance */
+		{
+			ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+							       i, &pinspec);
+			if (ret)
+				return ret;
+
+			of_node_put(pinspec.np);
+
+			if (pinspec.args_count != 3)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "Invalid pinspec count: %d\n",
+						     pinspec.args_count);
+
+			priv->siul2[i].gpio_base = pinspec.args[1];
+			priv->siul2[i].gpio_num = pinspec.args[2];
+		}
+
+		i++;
+	}
+
+	return 0;
+}
+
+static int nxp_siul2_probe(struct platform_device *pdev)
+{
+	struct nxp_siul2_mfd *priv;
+	struct device_node *child;
+	int ret, i = 0;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->num_siul2 = S32G_NUM_SIUL2;
+	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
+				   sizeof(*priv->siul2), GFP_KERNEL);
+	if (!priv->siul2)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	ret = nxp_siul2_parse_dtb(pdev);
+	if (ret)
+		return ret;
+
+    /* Register MIDR regmaps as syscon for each SIUL2 node */
+	for_each_child_of_node(pdev->dev.of_node, child) {
+		if (!of_device_is_compatible(child, "syscon"))
+			continue;
+
+		if (i >= priv->num_siul2)
+			break;
+
+		if (priv->siul2[i].regmaps[SIUL2_MIDR]) {
+			of_syscon_register_regmap(child,
+						  priv->siul2[i].regmaps[SIUL2_MIDR]);
+		}
+
+		i++;
+	}
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id nxp_siul2_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-siul2" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
+
+static struct platform_driver nxp_siul2_mfd_driver = {
+	.driver = {
+		.name		= "nxp-siul2-mfd",
+		.of_match_table	= nxp_siul2_dt_ids,
+	},
+	.probe = nxp_siul2_probe,
+};
+
+module_platform_driver(nxp_siul2_mfd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("NXP SIUL2 MFD driver");
+MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>");
diff --git a/include/linux/mfd/nxp-siul2.h b/include/linux/mfd/nxp-siul2.h
new file mode 100644
index 000000000000..407be79bbf11
--- /dev/null
+++ b/include/linux/mfd/nxp-siul2.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * S32 SIUL2 core definitions
+ *
+ * Copyright 2025-2026 NXP
+ */
+
+#ifndef __DRIVERS_MFD_NXP_SIUL2_H
+#define __DRIVERS_MFD_NXP_SIUL2_H
+
+#include <linux/regmap.h>
+
+/**
+ * enum nxp_siul2_reg_type - an enum for SIUL2 reg types
+ * @SIUL2_MIDR - SoC info
+ * @SIUL2_IRQ - IRQ related registers, only valid in SIUL2_1
+ * @SIUL2_MSCR - used for pinmuxing and pinconf
+ * @SIUL2_IMCR - used for pinmuxing
+ * @SIUL2_PGPDO - writing the GPIO value
+ * @SIUL2_PGPDI - reading the GPIO value
+ */
+enum nxp_siul2_reg_type {
+	SIUL2_MIDR,
+	SIUL2_IRQ,
+	SIUL2_MSCR,
+	SIUL2_IMCR,
+	SIUL2_PGPDO,
+	SIUL2_PGPDI,
+
+	SIUL2_NUM_REG_TYPES
+};
+
+/**
+ * struct nxp_siul2_info - details about one SIUL2 hardware instance
+ * @regmaps: the regmaps for each register type for a SIUL2 hardware instance
+ * @gpio_base: the first GPIO in this SIUL2 module
+ * @gpio_num: the number of GPIOs in this SIUL2 module
+ */
+struct nxp_siul2_info {
+	struct regmap *regmaps[SIUL2_NUM_REG_TYPES];
+	u32 gpio_base;
+	u32 gpio_num;
+};
+
+/**
+ * struct nxp_siul2_mfd - driver data
+ * @siul2: info about the SIUL2 modules present
+ * @num_siul2: number of siul2 modules
+ */
+struct nxp_siul2_mfd {
+	struct nxp_siul2_info *siul2;
+	u8 num_siul2;
+};
+
+#endif /* __DRIVERS_MFD_NXP_SIUL2_H */
-- 
2.50.1



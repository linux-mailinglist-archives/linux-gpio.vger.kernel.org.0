Return-Path: <linux-gpio+bounces-30789-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GPvOaGBcGktYAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30789-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 08:34:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C052DF1
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 08:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE39F64A982
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D50E428843;
	Tue, 20 Jan 2026 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uGAm4v/G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969D4279FF;
	Tue, 20 Jan 2026 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910394; cv=fail; b=urOFF/0AMD8NCrTVKLPe/DwFndoyCHuoHccTFJHNvuXuWxd6wF9uSkMJuCbOkCrYZZSJUR6Tmu0ygWlKjX9MYzGqx3PW46Y6M/Npv9nul9QfOOEYmlIJ5WRiHyriS0PWnzU97LKL5kwyh6cSwruOe4ni6T/ZsACrwQ5pTNliQDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910394; c=relaxed/simple;
	bh=V8WtqM29w0xSmjFpMWDBViLrVM5MZ3Mc1XFF+HTd50k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BfW6YnVdRCMyRqo6+1X9hpj9hTNB8NxniaiL98tpvO2n5jyVK5yP3w5jMA+yZd6Lm0bTffcepD0DOUNPvQynfR3pnxUzCz7P4yNBjQJhYqjM9nyfRpzzKKnY8FQTfq1jTmrAMe3nxTlS5rOgEsCVkfL/AW74QRBNFN3IsjCh86A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uGAm4v/G; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETMqwLVLW5OA71TVB38OoJwCUBZdu8+VEx3adsscPgoGpKXbeimdGQ9Dnez8MW2ka19GnZdamOb8Uej0UCg3JXzkOtqxBQhjpbUKHd2LlTDGNw+e0ISf5OkuIs9l+PIi6/CYnp3szMKDC15S/vox1jWcgulXPXKWkiCCtm0Pb00HRTaltzP51Nr1Tn6x23a7on68Yt4HdHKjRTHOP8qylQSEMQWy/mLa7lJqnK/hct2tgI1b06b3k9sh2go9KkxiqIIQWefmX9XKyb7gLD3EHRgIwHO0ZHzdsvQUexRT5WeM2vW7ePGdFsGdQaIP6FgkzGBKqCUlAJk9xM3KjmAzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBldFR8pm1h70tWEa7JYxWVbQD66AXgqhHDRgWuFSRY=;
 b=Xy2UPYb58GvIFdxfjTGgHN59CBQsuU/DxLujhboYWd71sa+M76m8rlJnulPfjSBKJjKRM5G9r5U1JpM+4XDxCOhsbjFZB0liaBEBOaC8+Z7SPfYsnPoIbfoFwjL+pSfRYJYeAOWVLz1ReoTrh/klVF0qiq9lQLn5msPK7H5EDLiP3Y8sfW6iXnlzPB3g8G0B9YkiJFMBsgDZgPu2La4iadFFPvDUnOuiU8eUFi95xMyh6qVTUdekl0EahJN4jduHERvqIuM62UT0NS/+t2KnfBBKIa2GfFyvAOYL7GiOErKgrWLGc8qUMr18L98qmCGfDkbVE0mMqhQRs+W+85s7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBldFR8pm1h70tWEa7JYxWVbQD66AXgqhHDRgWuFSRY=;
 b=uGAm4v/G91gM5xa+Xe2sCdx14orfbjRFzTnfhK06p/yXc9y6xLrRQwY4wDEUZRQq8a0L2jOGgMS75rmIRxhN5lBxjKqb653S7JHSAajDjMPlYd1nfT3yzaipcZq5ydVMoNCmALjtIXFRWIYry0/Qw/UZpC9uDJaA56vgdFo0EjuARNYwThKFMGtxjO6in76xsw6uBb1uaX5T09jKf1PBc/1rL31VQFSj72QJDCZNCCpZdFHxKyH3TwETSbeReal0LgGOYN/d3yVbFchgQ/jiXpOVg7rig0U4zZAlaXaCdwJRFbxAkw99SlQDFE3HM2BnC3Vy2Trjm6GpNBsTCs3QOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PA1PR04MB10769.eurprd04.prod.outlook.com (2603:10a6:102:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:43 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:43 +0000
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
Subject: [PATCH v8 07/10] pinctrl: s32cc: skip syscon child nodes when parsing funcs and groups
Date: Tue, 20 Jan 2026 13:59:19 +0200
Message-ID: <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PA1PR04MB10769:EE_
X-MS-Office365-Filtering-Correlation-Id: 40eac79f-434e-425c-b827-08de581b6609
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+7JDaInS5S2eCOc44VhBh+nADn+ORIdUf4vwGZJGLUoLq69D722xL9p43gD+?=
 =?us-ascii?Q?9jdk+MMtOZwirB3WzdLwnAQvbojKXbSTWr43uZLOfmudqlp6m2fx1k5RWT0O?=
 =?us-ascii?Q?l4uwdPuWAlxxlfPZVfavcYkDrnHQurinIBBNqtA65BPj3runeMRsgcfBExLF?=
 =?us-ascii?Q?7Stxep/xkgt7NAg1Fh5urN7AbSYxkNs4hu2UYuW2LLfyu/xYi9PW+cDdv8Pi?=
 =?us-ascii?Q?hislzT72wwlYvTAjRXUI3WDH9B3Vz0mFNdiqXkwQ1anDpcctAAZc/oqdEAFS?=
 =?us-ascii?Q?FelkEZzSknGw48c0RtkJepjiFNDJ4GzfG9Gr4TWrcNPwFzPCfTX15zV0XlcV?=
 =?us-ascii?Q?XAWw3/EI2YjUV5W51p5STf6nloq/DFAda3iwilhL9yBw87ekyqCMK+kyVvdx?=
 =?us-ascii?Q?PwnEIt0EiZitCwPfnEra/K8iPUu3TFlJsaDCAhcacMGddOazk+AxkTx6Wzj5?=
 =?us-ascii?Q?M0bsfNaNbod7qJibZ79QKIwcCKDUp0xEIh/YxKjl67k7q1l5n2WU11in6ila?=
 =?us-ascii?Q?zYVgJcYDzRQgGbzF4yznf/CO3PIxkpwaBchwJWAZNagJs7zX1Q+4Bo5PDYRO?=
 =?us-ascii?Q?2uP41eMnEGDvf3yEmnu8MsJ25A9lxLacny/w9dnsKZY0A2wrMJMzjl9GRCqb?=
 =?us-ascii?Q?XLA8I9aHagwBw9evmOOdp+kZXFZ40SMT6PFxYvq4dh/219W9mB8Kop95CWSF?=
 =?us-ascii?Q?xz7XXTDm4JHjxMyJYk7RkoRfj/efmubizZy1ahIP/6WeUSZInXZGoK14M/sa?=
 =?us-ascii?Q?sxHmOVGayQv2Gy6Negh3Taq2OopUGN9lRLAWX3AoVW3E9HpBQz63q2YxVe+1?=
 =?us-ascii?Q?1SOxIf64apQieagZh2fJbF69QwCBc40Iyf+v3IETM/2fnZYBM/yyblQGsc8z?=
 =?us-ascii?Q?FHov0TMlHLlpQ83YWgvrO5GzRW0oYtEzHcoCENxOS5DrnxQiASs/hsKmpDkB?=
 =?us-ascii?Q?xlCLcdJgrf9+RHceHrbgOWp658THX1mcFOmi/h2zG9pbEaDqNfb+cjX7h4AR?=
 =?us-ascii?Q?uCbtr1bRyT9SxmcMUA201rZ9o8gbSJ+CWiMnMnGoWHuGs2THBNl9vKqo1/PU?=
 =?us-ascii?Q?XV/KFEq8xGEYRKljD1g3hjzS0FSczUsce+JoQeVeyWYGp5tpjGh8xw1CkKsT?=
 =?us-ascii?Q?p4BiwxJzQkf3DyKJPaRxzpms64bVYjcze5x4vJUU9c8BFxCCLzaTmSxOjFdT?=
 =?us-ascii?Q?+M7qat3suhbLafkuHywYDg6EyMrz+0GlqXoOCp3FaG1etemDwAzyQKTaTfO1?=
 =?us-ascii?Q?7AaoujCB2S32lQDrWvgZjpnEuIGx67L9F0RQJUvHlDjx56gDCIfTgpQ92YQC?=
 =?us-ascii?Q?pRzWJ5GVJ+gh2Qz21qF8DXsBe/hH6017QxlIybXRkQZryXHz2vkS2T931dmy?=
 =?us-ascii?Q?26Ca3gIRrOhgeuB6OSts3zPtZVM1Hizm7aYhCSdBO+X5TkPltLez+q1WMfXo?=
 =?us-ascii?Q?7u4TPnedkE2oe2iiD7Bc/YIozh7EBIUZadL3lqPxlTspQwktUWvBi/7IuLsX?=
 =?us-ascii?Q?/AeVarwT/EKrY8A7LmHj2jZZiuuXVRjncPKWV70DYkVaryeMgADhdOncJM1a?=
 =?us-ascii?Q?nOtgovri5fl5ynfR3N0QWSsoXP8pqIEoEfkAxnGuuH4d4StK2haqdVUyFXEP?=
 =?us-ascii?Q?Ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y31zazsDAWHznvIMsYWlMPN4xGR4hFPbQqghCrBLkVCAhRZlsRHyARBSoQF5?=
 =?us-ascii?Q?DUtYCMbGWzFSxYYN245FLF+ud0eSxEtEeVxJmXRiUyehsNawPR3XKJhwNQD4?=
 =?us-ascii?Q?adU1NkNp1RVNVYszzzTi3ZjTaVZkMYINUrQWi5KZ+YnbMO+ddOBxrfJLYx2b?=
 =?us-ascii?Q?dWPFP4O5nAkBDQ0lpcG04NTCnUAzGyzUmQWaF+H4gGDDECP6EDRH3uOmACnG?=
 =?us-ascii?Q?den3tO91iY6O7gmaSbRqSVV/UqUuNXAAf+tstV03k5iZQrS0eMIynWMt8Nhh?=
 =?us-ascii?Q?wdr6Bd8ubH4hl17D9s27pjc4avoGBLwRh3u2tgKWqo4la5Lmp2PX2yPDSZ/E?=
 =?us-ascii?Q?vfXvSI9HCQ3FgddgEfQm6QSFQQ2RQVJc/c+23Bcjv/lblSg4aPbyRsfFwmsZ?=
 =?us-ascii?Q?4WSXU15M+2fC1h13qDWX7sxBAnRySPIq4d09q268pcmbYVLYyXx2ZuZlWJd9?=
 =?us-ascii?Q?9/45zQ7YJM9f30FOqLr31Nro1CkaaqgJj8AsP4XpxoeoDeQxgsPkKKnWAbfS?=
 =?us-ascii?Q?ckauH2hwaQ8olSWu7a1170MY2IUmVY2bvJKbtu9GNl60WtCUJlEjEQk7nrTD?=
 =?us-ascii?Q?fxa1buGUh+KjJB+8gsope03a3+dec8b2+TeTz3pH2O761FsOak2ffqlC0LCQ?=
 =?us-ascii?Q?OLBH74waX+bh+xkXAAt/Iy3U0k/1MQTG6QeyLXwf0RS4GilFls4w29yo5Bqx?=
 =?us-ascii?Q?7R7kVcDy0XCb/pZ6lBGi4bfNNSEr5EyWuFXo/lqS8gzeWyTL8+6G/JHI60Sk?=
 =?us-ascii?Q?y/11Ri83K8KoGG5wi5Z1ccal0b6dF4ay352xXXxuyYF89KxBsHRZd8tqW1LJ?=
 =?us-ascii?Q?1B2Gzzhr7IcZbYk/8p1EeUHBj2WDarjB7pCKcn2i0VaYCTHxWE0J0JW/HKSK?=
 =?us-ascii?Q?otu98UruxfSTZq7+tvrKG2DACszQRfWIEhzOHKcinIvjmf4hVi0l5SzTbnNK?=
 =?us-ascii?Q?/4Q+Ua2340AKj2eUUxgb+lU4YSmiBQGCYGb5DKJXDTqbZxENluHz4aAF6332?=
 =?us-ascii?Q?yE/G1YZh86oOZXS2zLoNrHBh7HSzYDWOxgx3RMGO/jLajbCjgEJUXbWSaI2+?=
 =?us-ascii?Q?Vz5DiouIKP7P0fab75x3uVz/1tpSlnaBTAG4S5lZt1+nQr/6UDzlP4lXkRFG?=
 =?us-ascii?Q?410drOdSbDRdIS770eh/GbsRaaSejBIiwPgofphMB9DnnQbiU4H6B3EgyBnT?=
 =?us-ascii?Q?cb5yvuK7K0ikQwzlkp7lnMwSNGj+R8ObNfaAho+PDy/OhiIUfCor4U5Q0xfU?=
 =?us-ascii?Q?vwMxz87DAq+7nAIJeoMQw9GTbCoPS6hFwEz4v/dtbUp++Xf/gBdN98QciJU/?=
 =?us-ascii?Q?h6VZcuCG2YyQXrvVrLD4Y73XAxTNFx4HHQBo077QhC1ALXS5sAZG509o25Ys?=
 =?us-ascii?Q?hPJGz6itqx42QotLCIVyqY/W0dAH7jV4c6xbWVFSwU/B/LP3R7lubCLotUuI?=
 =?us-ascii?Q?ZgyDfZzZKOl0AdA4iQPByAHZ/KPvhC8R8IefPNlLMTRAH7ITYM7omZsb/Pk5?=
 =?us-ascii?Q?O/YBWMwb+UXLfsoLmynviDgTUrtZr/OZT/LvbsYlrJzgr2PhK8q8gl3z69Fn?=
 =?us-ascii?Q?+a0/FGrp2y+S1iQvPv84LW0SJq5mNSPuMqnWoOSUToCUyxD8U0VWzdsQ/njQ?=
 =?us-ascii?Q?c4DxWUlWla+XZ+EtuOC4ydrB8iO6U8z6lviHILg4Bmk5gx7JgjFhtvMBcm5l?=
 =?us-ascii?Q?G5FrZf0gZGnWRTrTwH4iesnpWLveHIJlPSDYfIPpoaBWlx4DSrbDhGdIGtMu?=
 =?us-ascii?Q?2TiEErniJlBjSHVVop6jZTh1IAE4qeNZHYp3wZ0ssy/BNBDoBE/5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40eac79f-434e-425c-b827-08de581b6609
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:43.4000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgyKTnFpI+Pl41jatw7rR0zlsAgTSoynfjfo611wwY1ggT+Vc40+3I1OkDNC/QJZX3uDJrI1g8Ww63gNClAhl/HjEOQZNFzQWS+TTbQM/c944zDWPbq1WvfDPof4VIB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10769
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
	TAGGED_FROM(0.00)[bounces-30789-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: AB2C052DF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SIUL2 node contains child nodes for syscon
instances (SIUL2_0 and SIUL2_1) to expose register
ranges for SoC information. These nodes are not
part of the pinctrl configuration and should not
be treated as pinctrl functions or groups.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index cdd3a1cd4fe5..50d5a01107eb 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -2,7 +2,7 @@
 /*
  * Core driver for the S32 CC (Common Chassis) pin controller
  *
- * Copyright 2017-2022,2024-2025 NXP
+ * Copyright 2017-2022,2024-2025-2026 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  */
@@ -832,6 +832,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 
 	dev_dbg(info->dev, "parse function(%u): %pOFn\n", index, np);
 
+	if (of_device_is_compatible(np, "syscon"))
+		return 0;
+
 	func = &info->functions[index];
 
 	/* Initialise function */
@@ -941,7 +944,8 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 		return -ENODEV;
 
 	for_each_child_of_node_scoped(np, child)
-		++nfuncs;
+		if (!of_device_is_compatible(child, "syscon"))
+			++nfuncs;
 	if (nfuncs <= 0)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "No functions defined\n");
@@ -962,6 +966,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 		return -ENOMEM;
 
 	for_each_child_of_node_scoped(np, child) {
+		if (of_device_is_compatible(child, "syscon"))
+			continue;
+
 		ret = s32_pinctrl_parse_functions(child, info, i++);
 		if (ret)
 			return ret;
-- 
2.50.1



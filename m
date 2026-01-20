Return-Path: <linux-gpio+bounces-30790-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLqgI7a8cGkRZgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30790-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:47:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576856345
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E1D064ACC6
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5920428858;
	Tue, 20 Jan 2026 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UN3/XVEH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79282428838;
	Tue, 20 Jan 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910395; cv=fail; b=Yf9WacRLudqKW+oby1Sfer1J3M2NZ0oS1Kn6s/mABv7j84uVgSWboGVmUDAlShFYAs8gdmQbnrAz5fXZokd4OH1rcpJH1q22ThZXiKDptBOptEGz5SJ8cIqeCzOhd81CkEVC7uv3kznNic26EfE0xlA/vWi8rB2/5EmNfhAO5Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910395; c=relaxed/simple;
	bh=d5WqXFKFs19BV6CpMDsd/orNpAKT4DEkVZMhmEJOusU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pCLQNC5AQPcwn1Owd77RK2w7Sj7m3g2V5lhPyvlRLtw09UytMI60DlNGIMXtcNmzY48gXyNQLmJYDQro2sMDZy8hhXsybxWfbyRNICIe+rhJRESatfO349WEhiRzlNi7n4RwMM3j+lfS1wTNGLsFlIs6y3nKsP5Nb7ccOf6QSo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UN3/XVEH; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeCmnD1ECTOjxN7SDVgdoNcMKuIB64pKFIqPdHPaH1rehYA4eW55gN+z4kXFtrGhxzXF1MHj8WI0OK3CiDbKCSnhZGlxGy11iQMABfp30VVrSv8mtIoQNHjmQY61wTgx//GtEFmTeJSRxdzdvSwQqUKv8xbxWYWxD6OpbkQ6VVDb63UF4AB2Hh42vKTp0xY1kJ5C6lHHFpiL7fPfeQEnnPck/P+3fJDaH6OBf4hfMvGq0ARrS2SYbzQVsnBZGNbLns3OejUaQlsuhPMLKci5rHCaReh9clR71peLVQp8wYkNUhGOgwae7iyy4Cqt/top3FSuiSXK6fnwhGcxUb12xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxUYeU4Xg+jC7lrWVz+zEr/KoqyP+6trPOAs/QLMXTQ=;
 b=M2dYsqLC0ahXHwU96+9R84KDwGlXDhbimMmKaA4ELC+G1gmp38z8mgq5R7N4sq6tGv09bGHBGtXHxy89eyXas0XrIZCqTqLnlA/9/o9vqTZjA/Y9YjepKM1U9hJeDr93gdvfFyicfCNW58/ubwe97gpE/dMJpEDfVQhN2Hhmp2DwLpleGg/s1GdXgZCqcQYwPsGWK2gVMFzvJPAiqddTKa0CSptjlJiMFuTm34jQN2BDSEsaPx8ryVJAsCNyFaAYYkeUcDe93+wgyAha0o54Gy9jA3c1IRONgp5wwBxDZkCr3DhZSVIl5Cc3xZS3nf1Avae7jbuMwHb1CwWdju9vOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxUYeU4Xg+jC7lrWVz+zEr/KoqyP+6trPOAs/QLMXTQ=;
 b=UN3/XVEHvDjlOd+854RDj+xI1X20PasajhdC20Pwrf5+ePPCWUyuJobzPo3c/ISen+U5nnfF2raxC5rp5rpw6MltyaruMpCmtRPn0mLtvzhYRJmRJ1cgcoTmyXBPrRuFeKhaKmerBwbIK4l5ua5HmPBQWzeeYZSAiy0/2tnkjeVVtnBuD9R2VGLy6CKXSfnJgyCZ4WmvwF7qDFD5Xol6dJx7kGQOxdgqTleDWknsxscqNKXHqvqasH2zCLFM9lw4h6Np2wBpxlqTHf7q8mjwluRM/MD7ltvbpCPaJaC68mkpFJXmtZQK/q2EJyRL5NeBq/gEHjNjLXlcmpcXszXdZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:47 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:47 +0000
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
Subject: [PATCH v8 09/10] MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
Date: Tue, 20 Jan 2026 13:59:21 +0200
Message-ID: <20260120115923.3463866-10-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::22) To PAXPR04MB8190.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1a1808cc-7352-491a-8d3f-08de581b68b1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tDLJf6rOa0HaKrzws/2oSfuvYHERpKNKzlKPV6hyp5lPwv5ZgoNyq13WRalG?=
 =?us-ascii?Q?EzVPvOMxkUkIbyhmYWhPtUG3uxjb8L8t+chRcJzwXA82kJdsMg299Xoy9y6h?=
 =?us-ascii?Q?Jz4OAmkMVj9V+W3V1fFIQ2JWjZ8DCStjj783W70AcinMP+P0F/UnJVNGekZ/?=
 =?us-ascii?Q?MZVRNkMQT8tzTI/qmIXits0VXR+lsfN8xA+JP0dCx/ReT81zR1zuxxdCALLS?=
 =?us-ascii?Q?ahlSXkELE00JQgXEolMlsz4gZUiuKncPfdNs7T1RDt+DHOYp+3slKDi1RX3t?=
 =?us-ascii?Q?p0uGhbd95j10O5kfbdAbJ1No0pdL85t0Bu2RTJ/UbRI1a9oBVDQHt7f0h4Y7?=
 =?us-ascii?Q?T0Jc0Tq6n2+mvVQ+htuUTHR+lO3GogNxmc0c7RPacySIldLpL+mezGQFJMJs?=
 =?us-ascii?Q?fvYsitRzo+NqIB03j2O0g3aUifxgIoGS492NBuHL1X/eOACT7uL86gUUv63B?=
 =?us-ascii?Q?LyUhJjiZt/xYV86JnCRphapPean85ojI3Qs07Bhx3F+mqOpCI2ycLRRUyhMF?=
 =?us-ascii?Q?J/p2fm3w4KbVm1OCaJhBQOM6hiyy1sxiCFQp3fvb5vMWXFTosbrs8SrvqCUq?=
 =?us-ascii?Q?Xkqg7AcKfG02JkhJLZcEmUjPkGZmoEDxbhg8eliGb7n8EK8siFSumuNRBO36?=
 =?us-ascii?Q?+tj/PUvkGiFyIaoEz0sr0afdSAxwkSKhOVOJx0JB7oVSduJdvd3KDbfl0b/h?=
 =?us-ascii?Q?XzWcikOpU44uDK4nmmTbmHv54iVPSmdPXwjobWuhyiqx5bT/iZBES7AQXhOP?=
 =?us-ascii?Q?z5HLDEx49xHFgOoUrv4cdDvEeXObfo6q9NtCTGZrDGDFv4rDeSvOdU42lgAt?=
 =?us-ascii?Q?R2OTrgsEvGSXpQdDb55TIjkufYGGiBhOrU7CkKq3kAirst0WfrEu7cDrI6Zh?=
 =?us-ascii?Q?9ajCOUaFJZWgRjp7xo3hmPBEUsN0Qxdc1cfyENIEHCN+mj7x5H3l/tQ3XYj0?=
 =?us-ascii?Q?22f7oFhxBVRZlXaNVN3S6pqpEgsU+HGyR833MrVNMXFchrlA/ya3i88empt6?=
 =?us-ascii?Q?LUTLSHiHOUCh1uZenjQ1Js5ENv8ye2gDgxsLNEseNmmv7qqAtkQmtrGPeHTH?=
 =?us-ascii?Q?RvFef1+jaAtsPb3kWcuvezFUyZKOpOPJz8v792lUAt6tBL4KuDg64lJk5mdo?=
 =?us-ascii?Q?ak3mlyiy9Tr2lICSITk3kJL2zv9qu6ko+z5eEBmPVAZhLZW5Uz4AiS61GxaT?=
 =?us-ascii?Q?VItIDNx54wyuo65Qd6lQC15JKUTjKtsYRFUj5tDrEuqIUrO4dNpQUNjyNwLa?=
 =?us-ascii?Q?bOdPl1FhWNUgIR6bhQFf1azAdOP2S//g6OaPXxAuSnKDCS3dafUV+EatR6QV?=
 =?us-ascii?Q?oRjFgy+dgy3rJU4jBUYMkvAMdSIyuCzdSyclomXhwkI3JggXf4u4XDHXl6bv?=
 =?us-ascii?Q?BTTqw5P+svGbogX0Tae/s9mw7+CiBpMDGGMVtyXy2+1xnJGcK/s1zUkmv3nH?=
 =?us-ascii?Q?zPvRioWMYCwZnL7bARRGG9ZoNrUeK0vI8FslaUf5HPUJklDrBlAKT1VLrXj9?=
 =?us-ascii?Q?N1cXvYrguwH+qrZQItied5zyoiAgdRsUDAejV3dABc/dEgaYI/Z7DQmuZlbp?=
 =?us-ascii?Q?8BdJc5bhX1srH803Tgo/Pe80tqXDQRxSB64m5ni8Zxo5gV81pkw9ZQROFyI3?=
 =?us-ascii?Q?cQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/gxT2fUhLVIP0xJM/FD3pNYFIZuZSAIZ9XIfwMxXNlMRRU5r5z8flSeLy2y?=
 =?us-ascii?Q?e50+rgpY3e9vvQ4/yOfXwfP9+uI/FldevKVZVt/dNVTTp9gEN3VpAqENHk57?=
 =?us-ascii?Q?E27X82co7Vz48HznQYMu8oPzQWtr2DNuEFuH9jRXmnC9QbDffI8sSzxdVS4H?=
 =?us-ascii?Q?pczMExkWtDfeBhd/moLghtPWiFgAhpD077OD0QlJ4EcFpZqp9rbLSz7eVTsW?=
 =?us-ascii?Q?l/z1CR4aDZAK9m9CnWhTbVEYPYfaw7MfvGsvv1L2N6Etbuoya/cKrXbHUzTf?=
 =?us-ascii?Q?l0bOIkbzfuxpiDcEJ8Gj9ZMR8qfCDCqh6KzyYCP0GPlU8kj1+lkBBNxBrYTg?=
 =?us-ascii?Q?e6NvZJOPjYDrCpLBZpAiR+OSExv2WDhu9qvglXpfH/4PXM1WTVaoqvIl8Og7?=
 =?us-ascii?Q?0wG3tYNQMV5M/cyJqLEpnqzHAd3BAElQrQ/cVWKcxTNeCYGGdnfHFdIaZ0UJ?=
 =?us-ascii?Q?Zo9lgbRibbMN4z6zI640OZwt0QFUsY+VjIuc+yXA25STb4BPD2ydiQO7Vy9A?=
 =?us-ascii?Q?EOP7z+AZEeGB8fwtY3PAIzBTTEciTjFP3/4wDxYketNvyWwgMjSvoxDMXdsx?=
 =?us-ascii?Q?3RKR5p2mp91wtfJi32p6RZSKMZNeFdQ3+SV7E9RPY+UVxZCtge9TAMhBt6JU?=
 =?us-ascii?Q?8vxjeWCg1siOwl5YIoypA+dCvsrJYa5Gc5GadBoqYJwTuN7nC7LfE9V5bB09?=
 =?us-ascii?Q?rizeImhJRUVryqc+vJOS2BfX9gszrh3UNir1mTjz2ZKiRdnxZIC+ZA3pFYg5?=
 =?us-ascii?Q?wBLUB9xQeIScGzsP5HyYZ/t84XC/OXnROqRfAkRDSEKGZ4gTVi3jeduCtyMW?=
 =?us-ascii?Q?vtiZK0eI/K0tcbBN1d0Kvxn2FGevkN1+ZOHAWBQUpdydI+zHdtl6jZDq+aha?=
 =?us-ascii?Q?3qaBAq63QIdDQejUiqKo+pyiMeWyX9wh1rYHFhrqm03gVDjNQPw84WxgkzWS?=
 =?us-ascii?Q?9q9PdCeOZTXefej8CYLvwrVGmV4/wYd7Cjs54ppHAKfveP1xsBqSRJPtetbo?=
 =?us-ascii?Q?lKW2kBxtjSW/h2BoG9e6s3jq6XQZoVi6ljP88oosdJhkBBfRo6XdghVJxIfD?=
 =?us-ascii?Q?3dwWJHZpZAl+v8Vd9EMKidNITSmTp/8lpbpmv8vmeQrKBqCkmzpZ/LkjSmIY?=
 =?us-ascii?Q?oRWfWgmMej7LqSjYG+kngMDM3kQTLjS5hWgSkdbDOtxdpC1oCeA2GZ2RblkY?=
 =?us-ascii?Q?gYVtWZnsyBLWCwB3TnhIClWvckYp+4rTdfg+hu4/oMq6z3wsjIfAolsaOHLx?=
 =?us-ascii?Q?E/N1VuIfT2IBVHrLlcnKOU4pXPmCv9dgsbh9NQ2kl8W+xRz9p9Mvx9VF7/gO?=
 =?us-ascii?Q?si+KZe/nAq6PWMFVV7l7E0n12G9przXPjJlHr8YdtggxTV5Ku9hH4pOfByW2?=
 =?us-ascii?Q?zpWSzxat+Fjw0N5525SWLI63xYhmqYjQwOANfbtBUS56fle7AFw/75sXOgZO?=
 =?us-ascii?Q?zRjHyifDKIL8s+Se2yNqyfHsg0yoWLRts5Uu0UOmC6hqt5/3GfacdJG8LGKE?=
 =?us-ascii?Q?Br2PKFklx2Srpr/dSsqBbeP7yzM1P7QU5jDhvGl3p12Dp4zgVWqY82rXZuz4?=
 =?us-ascii?Q?Jgv4+V5kC1z+/qCZ11KxeRZAYmOgy0ZLcbR+balFMfcAAEtEvVIULwDGuzi1?=
 =?us-ascii?Q?Gyy24wph24aC/cQCGg/fSoQKALHb2euYcIfSTnOv1vDskqPvXe2VY1a4fLtJ?=
 =?us-ascii?Q?jYmiikXiI1JR3t0kIO7NQcjT2OfKqcceBnluaIYWoHxSES/htziSPJ6LOvET?=
 =?us-ascii?Q?ezwTg9dmk3og27103ojaJu/Jg1LK5L3FpHlwgnvXV4+Rmk0l5SU9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1808cc-7352-491a-8d3f-08de581b68b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:47.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOLCDAXpYXNa130wpE7v8I2zbfUA/qiQviTU2Lr/kOEoIfLySJilMWgI+XbfKM+HxxkwHpdJL4+xhy68bcAc6LhPZc9Ih/1AXFtppu594q9WatV9jOcJrskZSjr79COH
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
	TAGGED_FROM(0.00)[bounces-30790-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,infradead.org:email,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 4576856345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Add the new MFD driver for the SIUL2 module under the NXP S32G existing
entry. This MFD driver currently has one cell for a combined pinctrl&GPIO
driver and will, in the future, contain another cell for an NVMEM driver.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1b020588597..37d80ff0ea4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3183,8 +3183,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
 F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/mfd/nxp-siul2.c
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
 
-- 
2.50.1



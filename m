Return-Path: <linux-gpio+bounces-26954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F187BCB146
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 00:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 091634E567D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 22:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E75286429;
	Thu,  9 Oct 2025 22:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VUItkM/w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C33285CBC;
	Thu,  9 Oct 2025 22:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048855; cv=fail; b=LvloFCtTwc2bElAi6f5TIfOONkZfbw0abQzAF3oPEvX+1rq79AZkgNopaWtPQwhITgiUgUDHiA1DtGhEpLBzw4LEaPbyu8jiiVeCuDyNy/3HuDy7mI2uPTcD281afYM3OQBZbqZCej5eCn3/wK/EV1yKthHopS48JOSLdjq8skI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048855; c=relaxed/simple;
	bh=FCiiElyOErGlVFt73AFdGVYYKoH1DErM+VzxqWLqz50=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kGyXDoV0OR5SHQY1bXoaiNSMrvyYzU5Xf48OT3TksPwQlTc3fQKb9vX4IaSKnVPB5sMdJG5pZXX955sEcF+EgZEdfBE7cvd4z7/VCDO5/tgz+MwHXbEziJQilQ1n/sZa7J3fv9e/z6hrAtTWHNS3mjgv2G9xBP2yPMNQT4RikkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VUItkM/w; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmTlvPm344oScsSBFk38LTxKYu/7tKmnjUvxgUskv8Ikh2AKwPyPVNYOFnUmqbUyzpV2HmPMo95p51qokGjprcMythhjCCKfvTXy+A8djfcI+dYngqxNi24vyQdj6CUMbDoBG1dZbUzPnhGMNJ9U7tr43kPNCctZ516/k5LFzSMAOt7Ne9Jw63lvE2prt71Up0ANHHLhTsbm70LLl2vtq7RpBvYfXvCTYVkYGg+OsnRwerMrJQU1fHq2EvoKkWcj+JtE3iL+R/dG84RibV1j9qLoRnb4SC/1N8xRSanOb0JmOvdLs+CtWZBoSjqU8RE41RuHDZ2jKX4qmr6b6mjkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLcqYFll5vqt4vBEM/gEVwXCj3itN5uBVLsBxHqTrMM=;
 b=tsTK7S2qNjMa4m0FIUEJCIu5elXumbDW6G9MbuGSGxcRjZ3AX9KGLAS6+JLm993UmAEEn5fJEqCJ8bLO8hmEQMWqkcKVHsZsNWySDGED6b+0FRliIkR+MrOCJ9H+cTvUYelvaMk1cm4f9vBajUlsDPTfmQnAmxmrPcmrDb9YFpiU9Dqh+kNFJrg3X03dtvZ7skDkjTzEZtbSmIvfXgYs3Lgw0KADAV7NjyEN07hmWy+dxze5U/457HbKWSoYn0qCb9ABgQkixRutsJQDn19dvbmBr8IcArc5XDt+YnVAJOD/opoiE0tL2/zf38EpKRvlLdeUQ6e51+h4MVXFogCBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLcqYFll5vqt4vBEM/gEVwXCj3itN5uBVLsBxHqTrMM=;
 b=VUItkM/w346VTfjPViT4t17qWvxADPWfiL46ywQgBpr3WK/8mQ6qK0XmJhxYMn6wNEBnfeO0/djbV/D/NaK8BBb+1PW6GaaDGeApSe7FtwPMYPmEjbWR4XN8CmNdRapnjY41pEW9cAlgbIkFN7Hri0zNEwr3D/E/N12Zd+aHn4l7LcikHR50G9p0lucXIASwreCZPZ0NEuZNMrtiJEGGH0pmIyfFrz8jI+zzNqGeJ4iDJ9IGLNJFYiKn8h4UDWeT35YT1UW06fw5Lwz0njIcLxpX/9B1vz79TFEDDO6ygsQv9Flj0uIEzfcMzTO79efwsqKX2u9v2Ak7DfJL5Au4SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB10852.eurprd04.prod.outlook.com (2603:10a6:150:225::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:27:29 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:27:29 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Thu,  9 Oct 2025 17:27:12 -0500
Message-ID: <20251009222716.394806-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:510:324::28) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GVXPR04MB10852:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2c59f3-14a3-4fbb-e9aa-08de0783085f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WMDS3+S6klCrQlsCCYTGH2Yvp9ftdenPGvZ0vvMYEYH73UsDvHGXK+UDPbkQ?=
 =?us-ascii?Q?hqYOzeHgdZ2Dv5XNrCi08Oi44GxhXjU+f7dPyI2fAYEzPZQjcLG1cfYuDsCZ?=
 =?us-ascii?Q?mW2xWn8a6tv9NBsjWYrwtzONa2SdENhLjLMg424503qR9UyXMpA1+aIfwtVv?=
 =?us-ascii?Q?RU9c6Ka2nX+jHiF8W0gLAP9BzDUDof3WV2TTUrCuHkTmyOxtQqNxdpGE+LRd?=
 =?us-ascii?Q?t+PQtFl14/6Icfyax+9ax4JWW2XnsFcpfw7yGT7irpIbIJJl2auXBb3r1zKM?=
 =?us-ascii?Q?vEA9pkhK9wNAVE78nQZHmzOwiSQXc6h19Gw9HLzf3e8zrgzdb5ErBhh/Tgch?=
 =?us-ascii?Q?VlHfoM126qTRTvw9ZPUBG1zB0nSr1/xbr4VPZT2M0L4Y7wkwmsVy/I0T+9Ye?=
 =?us-ascii?Q?jkeLQv6ZwYuEUmo/JQf9nCDVVCuhqcbbHBoZwBtpQJrfjxMXbuLcgDEQNX+o?=
 =?us-ascii?Q?AfTnXMPYWEXasE/D/ptcbAO1Rr9yzx75JYet1PUWUwj+MMQAXxNc78yscmJ6?=
 =?us-ascii?Q?Njmpvpl2h9mdrem5vbetmua/PLl6M1d/HEZqCynHHcvhD9qgmtenBNkNu4fN?=
 =?us-ascii?Q?ENfOU1b0jEDs4fahAVdC/umNQWx8YAJka4E0jlq/vWjW4ewBVHxDpVZ3qFUO?=
 =?us-ascii?Q?sPGz2HwFbf5qVYCKy75yun9wEFOTxItRYhDqhcI0bC49DA9nYCvQ8V8mOYeU?=
 =?us-ascii?Q?Cob/Ywu2tcw8zBQvvtQOw4gfTrGhkzb5txS+1h9hk0hvlemUG6Qn8dBPMX0u?=
 =?us-ascii?Q?3IivmmSOkI7G+ju8QbX6MqG/i2VfKVJU+xVP92mVl0PclmmXFoEgRi4jVSYG?=
 =?us-ascii?Q?x3AOWKVe9p9B0Vb/BM2iI7+RN8tKbRh/BmfHAJmkxn2tR90E+RxFFd0FPIEs?=
 =?us-ascii?Q?mDkzoOv3GYg1zsveyLi9DkQXeRKkUBjEdeyZnsLrcNi8FiAW+Uq27PoTsGN9?=
 =?us-ascii?Q?VC6nEz/YPMl2cO+3dFattFt3HVA4Hfc0fhPjtRx3kUEm6mj0yvyetC35Tvcb?=
 =?us-ascii?Q?8hO6jK4xaRAvnPeML8x0IeruZdny5K/t3emD5QuEaTphDdbiIF3/m4L6T9ww?=
 =?us-ascii?Q?918gPkKs3nJU3zUV/hCgIxYFiiFDZ+duLDY+SzyGuAsrwS/bPMlkrXidLBZ4?=
 =?us-ascii?Q?j9vQ0Nz8TakDBN8dqtjDMLJyVDiKE3N436LNo3OXAGYUuZMZJUTDtIEitcGr?=
 =?us-ascii?Q?okMOdR3Ies92HRdAuNsAzllOcble3sgypGBgU3WLDN3Hzn5bcWKG5LwFQXiu?=
 =?us-ascii?Q?bj1rarXtaYsvGKJSBnZ3nDyzbhitkbKZJxqXWAkPM/x7cMCRSkAl5JraZcXR?=
 =?us-ascii?Q?6sX3Hs3eZOGRq5V7DvutKwb3idq4L0MBpsPJTqlLJhUhVHHgDSCvHbVRcAyv?=
 =?us-ascii?Q?NahApmmF1AeLr8diT5ZxJBdAqM8oHP/JihXAflmISXFJ3JLgx9pZzHpm5ev/?=
 =?us-ascii?Q?ZtAbSZuRqirFZrYEGjDeFVP1fdPKorujTgRBGpb/lSG8CwnUmOUMgHQPOW5z?=
 =?us-ascii?Q?TXRfM9rEjJ6zCrw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AmiDDc+TMLWkOcdiPM9YVb7khQKyKv8MefpPvdU9XHxCTKRBHH4aWRxtO+YI?=
 =?us-ascii?Q?XDvWPtx1+60qZRgDPuUmF5QtWWIpqr8Hhz590iSjo+V3FxubgCij08oBoI/a?=
 =?us-ascii?Q?I/sZ+Bvyex7VgtBnmfy0pxwn913Ie37JDYg4iVFK1QY1dgY1haezfte9UbAK?=
 =?us-ascii?Q?S64ll+dUgWXvAr1+yQCXDRkiWrNZouCzK3PN1QTnpQs8XIiJ1+vNLc1YkuTS?=
 =?us-ascii?Q?C8NH2TCaMSLwf3G7xbksnM+YVwK8J8y2QSJSnv0hX2jDzCAU1pb5PkOQO9U9?=
 =?us-ascii?Q?VRiggf4uMGR95J+1gJbq6qRH3KKBiy2WkXxgENL1/JAolE+IA+Z0naFpfIaz?=
 =?us-ascii?Q?Ox1mGmuijiR1vJncCLqLlVrEltL6iQvwThcs8gevLI4orojrJSi1gtN5ubWc?=
 =?us-ascii?Q?4RBo16JDC17YERFPB5r3SamId5WwzlYuuV0hXnupm1LeqPoy4jqmScPVbi8g?=
 =?us-ascii?Q?UOrGOVroAgmLSEhX5dWQLLuzrFQuGVBSJ6ldW2DmH68YiFBQflUegaUeR2Ow?=
 =?us-ascii?Q?pD/Vo+zI+EBGIe7Q4nqz8Ffj2QoR3wxu8+LjMPZ/JO42qLC/N0kWKZSu/PXJ?=
 =?us-ascii?Q?Lu8grW9569dL67G5Iadw70tdsf19FI01zouxvYorOz/EVV3jvTQSImHRoXay?=
 =?us-ascii?Q?aMwsku2lJh/oCka8Hn2P5gqFh5ssaSpfE4SrpB+PutdgsZi8jSlq2zjBMt5l?=
 =?us-ascii?Q?kWBQ8OxZI/T0RYPbPM4IO5wUQSsLe3dW6zFovf6QUwQ0s3QGIsw8LsywnfeI?=
 =?us-ascii?Q?I1kYryr38ZY+R2HytbA//luV8yE+FHS24sEVZD5rhuCxMNTs+KAI5nWJvXGw?=
 =?us-ascii?Q?BaJjIdSThaU8i8HLb2QCxnTgD4gU1Xz6vbTOdgWf+zKqcSovitVGQpG/MSE4?=
 =?us-ascii?Q?2gD/ifXn0dbNMrxbrOVVfbnVn9Fq4O0NPR7u5BpkpGkIIbPr6e9tGxu32Q9c?=
 =?us-ascii?Q?f46apbOlzdeBS2HL1boFwRuwSXkJl0/jWQGRRqfnNObHioAzWLwqeVXvoE8H?=
 =?us-ascii?Q?CSdSAIRiKnQcneHaMazX8C36SJoAYnIagxw1J2Z3e5uf3TLF0uBKZuiom5TL?=
 =?us-ascii?Q?OVrTZAl6Lv9HUF4zf5Ac59dLlMfs7e5gJlu+58vxhLtuFjsilx3HX0eIwPlW?=
 =?us-ascii?Q?xB4eWm48rcDGgI/aDGLed2RPZLS5bRlKgI6Kvwnpe8h1AU1MKmtwNJxnReqO?=
 =?us-ascii?Q?PsKVX67NvmwPe3amMj5zssUTdy6xl253QnZ46IFZUAFC7UtvdkYf8S/5qJKk?=
 =?us-ascii?Q?A7tiVbXzT70p/g2cQRHT2FNok0FaS2nPb84/d+IaTF9nQUQWKWlvIvEYt+Zl?=
 =?us-ascii?Q?pDib/ixHsrv1mHJP2538WAvNQGv/bSzIDavFJw3sKeNeeAWXhRICNpqyroug?=
 =?us-ascii?Q?KOAfVIDMrbN9r2upZAUarzwi6J0k2G9NuQCzJZ17d1MyFG5QyPilPaafd6eV?=
 =?us-ascii?Q?VPZJu4UZ6ecLx2/1aB83ZEkLGyRk7yiWeNDEzUN8HvhhPjuf2R6XDQgt6TF9?=
 =?us-ascii?Q?5bk22fujzcsqV11gSy27WwLmfPD4b8KDi62JBZPwO+v9LXY72/RYNooa8xbM?=
 =?us-ascii?Q?v51z28FB2f2gTMgPD2k76DsI0d3cZHZLqr2IrOd9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2c59f3-14a3-4fbb-e9aa-08de0783085f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:27:29.7853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ+fD4uwh3BJe3/o8rg+O9wP/icL4IrvRsGH7a3f06IVJQykqJMNzryLLQErepI4tcjp8b+GCdTokagNOlII3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10852

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Shenwei Wang (4):
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
  gpio: imx-rpmsg: add imx-rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c                 | 486 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                | 146 ++++++
 include/linux/rpmsg/imx_rpmsg.h               |  48 ++
 7 files changed, 848 insertions(+)
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
 create mode 100644 include/linux/rpmsg/imx_rpmsg.h

--
2.43.0



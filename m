Return-Path: <linux-gpio+bounces-27852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C312C1D195
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 20:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD1684E449B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 19:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59783363B97;
	Wed, 29 Oct 2025 19:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Opk/k3jq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772B363B86;
	Wed, 29 Oct 2025 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767841; cv=fail; b=QVdYRAhsTcyWv9U4dREurlebMGNUU2ruHAWhX7p4RcFvx8ai/DZYc3q8CciykyrQg7AJ/TMOvYkmUXPr1hgf9Mr3/aLI5tBEWhk+Cmipe8ayCpX/ysVK2H+VKgm0Vyw50KpyxOZsqo62H4OWrDvsguajeotn3Vozvj2mEbPBfw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767841; c=relaxed/simple;
	bh=52IRiiDXXnRu2J5ufbHI6RZO3m22OQUuMfsTQygFuuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mJ/SiQExjLYaFg3NwBwW+pzeEhHebxbHJmTrMxfkYgM6cvTbZSSqGhQk1Dgo5bgoB0fnv+GzyAZq/RdH6/U9bqsML0iIqXYCNeaVW7PRV3Cr66xcKKvgpA6waprSspB6iGihKjg4RQcTizxOcCstK7OXduDIVyEophTxf+J2P24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Opk/k3jq; arc=fail smtp.client-ip=52.101.65.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRyOBJsAIScuA2H/bPHzFeC+F5SBpUK4IsJzG+Xarh/QmAjAMM/bhzrpxC+PQ/TH6+f+eLQ1a0yWMuPqgGgobQfK66rVAM25/Hd5cImsd6nqFE/yNjz5HQjyrQ7yOQDJsxF846lzImq7kWjBSG6KU6h9O3BfNNtkAedN4uQH1/FjmUco7MKroWCgP4682ZwGPjBpAmVD3BEAlsSGOdyH4ArXuKBedHvmLPedtgNdoMVV+ayiPpFX9mNj3d+bjoQz92CHxUwl6+lE50pLFVPSFvFhNV4ZlyBLxar/vFOGGCnt0nKAyMydwxtdu7CyACr7C5id4j5iMkRR8it0yB4pgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0p18WesvVVXd88qUeVYZmRMwAzAiEQXCGYe9xiNfVE=;
 b=eMdAZsqKGTEdH+0w5O1vR2sCu/h12osXU03IQtyFqMvUV2mTWJWv05dmI6NIybBt0aYArNga+F0KDahn7TVHR/UAyDjfGM/n3KWo9b/Fq7je0vwNJ2XB2rMrLO3SIuyMDJ9FsiK+CSrkTtr6bSK3wqx8jYA/ivVUjKH55Pu3hJexsGrH3GAx16IAGHHQetgN7SgpiDyrFynTINB1fsbV/RrYQ7DNVHdNZQz9P+hWW+2xnO5LC/qXzR6KFzYiBFDwSRiqE2yHePa3h5bo8xp0/VkDDPbK3m6gB44UMIroFBAYJxqmzg+o59POr9zKMJcb9XWUkvMyc3PqL7kHDAegoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0p18WesvVVXd88qUeVYZmRMwAzAiEQXCGYe9xiNfVE=;
 b=Opk/k3jqNMm7bBymY/vjzpAfWn0nww2Jh30dUxIwj8c9IsiYHO1P+MbYzAu5TRU3TXAi2r8kC043WQVO0mmQRvCiXosZX9FtVM264C7DTpO41oFLlwWigVqh7QLK9wtTsfdrEnbXxmgftw0SMIdZRS+gmYOL1BQQ951ldarwWXQ3E12fyXFA9rh4BlMeG4kjQIY9PrucgNvJwNx4HhbIDPySTSVHH3GcLGSEuv0kTfI9YJSQiiEUOA+r4+3hlKalYZdRWKKjHmn4ot41+XG6OLucs0ZxAXo1xIeRckJpU3xwXKjfG8vylULDeogKJKyzo4LcWMlPl/Y7A0gPzV5KZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB11687.eurprd04.prod.outlook.com (2603:10a6:150:2a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 19:57:16 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 19:57:16 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v4 2/5] remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
Date: Wed, 29 Oct 2025 14:56:16 -0500
Message-ID: <20251029195619.152869-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029195619.152869-1-shenwei.wang@nxp.com>
References: <20251029195619.152869-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV2PR04MB11687:EE_
X-MS-Office365-Filtering-Correlation-Id: c063a40b-036d-4a8f-69bc-08de17255c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g6UdSMhZ4bSlWvJle1EGyEp9PQbXWJuIVGLQZSirSHMZ7YA49QxEuN/yX1+W?=
 =?us-ascii?Q?850qrJWkHJ14kJt6UGXNC7EvFefqIgcVeMk74PpF0E+sKjqGN2eP0QBVsrqK?=
 =?us-ascii?Q?4kRo8O6XgebD2gc/6brllT4RzdUiIv0HusCQEpqxtqn4quPLwm9MlWlwcXwU?=
 =?us-ascii?Q?VMMa3Mbfx7n8UK25yVPtYYqDk4S0QJhqFFxa/lkwmcEClUDVSQSxtQn0nbFa?=
 =?us-ascii?Q?gFZyKnWmmVPV7sRsg/kJkOHNAIO3bFYJ4acZWLWOYWpcbm3wJVgF+D6/sbkP?=
 =?us-ascii?Q?QKdPtf1DlHayUpjEr3znMvfYbI8y+vjUN0qa2szugffPaWGIT4q2dSuPK4OD?=
 =?us-ascii?Q?WAG9K8y/Sz1znmttFTa38RsGOsaqMoJb49UP8P0I+ULQTs7u3RMkb02PbeFi?=
 =?us-ascii?Q?j31N/WYtxIWURrSSqJS3vwOeUcQkOcUul++1Q5sfK/KKy8UbjbJO78Zw23qI?=
 =?us-ascii?Q?sgoRN0xMzneIvVm2X8NAY73uPjOzKQAydZ7CirSgA9OYNiCzA4TTf4hTWtrD?=
 =?us-ascii?Q?utNxz7z43Wl0m9MaQJRBfK4U4guxzv6ivuHFnL3HnKLu/uCnR2OerHicIw9d?=
 =?us-ascii?Q?nwy9MENyhf0BXkbnY84sn1rKBxyLGAe2LDUHrEZZH+BCMerLmdIgWTbVhMCq?=
 =?us-ascii?Q?MeV7bCaWZACRvnv0h8CSnQdF1G2WcidkppdgfwW/0FfJC3Ezu5Iu1JI7doXL?=
 =?us-ascii?Q?rDOntkcZ/4Z9qHyTkbXJObowYdrFJTRfBD6GC7kf1TBCDpzkBYqW5GbCKtHu?=
 =?us-ascii?Q?+GAxE7fUQmFxfiV4mmDQ2ATpCLGxziSWjeX7t9HBJRHZMptGZKx05VmhPI+o?=
 =?us-ascii?Q?iCcZXhWWxvE9HOtwVwhSwi1bO5uwHCVs2Ph1tpqLIsvie1oVs0SWvWKKWWH4?=
 =?us-ascii?Q?XHSk/ghtg8ONPgk30DeyyKJRxS/ubeBSSc6+ryQJzrG61lqNCT3gq5f8DPDB?=
 =?us-ascii?Q?rlzqVMSZN/0B5KQMhppT1yRAccLyew1P2Eh8kv2SZoueGpRohb+PU8p9a2K6?=
 =?us-ascii?Q?wLm+XpNfoxTIv6e9jfZJFOwFSUYGYEelLO//tW5LSURo1z3CHvNCt5/7VpNP?=
 =?us-ascii?Q?56IriYFA2gdcA8BTTRsQirnsFoz6oJDW+PoM5rdMpMLM5TTsMMVwOqqnXPkF?=
 =?us-ascii?Q?gFjh4VuVDZCvfh00p2OP/oqEo0JcejPKQttLlHdodWhNa0vQmmLKoBgcJbGr?=
 =?us-ascii?Q?E4CHknbKhQ+6xc9L8784nQkbaEBIP3uqw1dco7sbtGPByJIFOvc+smkTHqSo?=
 =?us-ascii?Q?WZfHhaLQmuvCfMzmEpaoM33wb9FPG5YNiqt8Q0oxu1/flgkmWVfBsxH31JzM?=
 =?us-ascii?Q?J/JkYB8WaM0mxvRvEv6S6cxK0G9g0SM+ZYsBGWFobnN5DCroxUOFCJH4wb8r?=
 =?us-ascii?Q?vZlvwCYmDX0c0YHi+hRwIG7nd0RVyqHNdFk8BPqYh0jz1p0ZTR3MUP8ju8Cj?=
 =?us-ascii?Q?uPkIJgFMbWbrBWfQqB86Ldj5o26LDJnKA0i7vym05K78nTCa5R4vlJo2wkyN?=
 =?us-ascii?Q?uzbki/PiB3j8pgevuIQzlvn/wDEa68+6Gk3lqQRDM3+LVI4ricesSp1cfQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UbZyj7k51sOY6BnNJ2lSvvNdMPXHS8UZ3kuq/+gm6aKWtSu8GB8WXg+KNA3Y?=
 =?us-ascii?Q?qKa1uUvmfbpvM8B7DSOJPTJ+543UncrLtCet+Zotg1Q5/uRFnvZRPwvdR9R3?=
 =?us-ascii?Q?L1Z3dPqTdtr+Tiy1bui8YeMoaE4PyGmjm/OZ5Xjge0Q6imSXZ5De2q/WC9mf?=
 =?us-ascii?Q?GcUayFh01UskAaFR5lAYzncs4oUhC/bzIgMIC0IupXSnVva4rp+1OIFVo8/D?=
 =?us-ascii?Q?E4vTPTzWqRHQd3DBOINU5UVSib5EDDV0HuU76qVFXUFE+m9snyc0K+jGVt9B?=
 =?us-ascii?Q?J8DeeEUc0i71QvylrYYZNjYvjM41s9REAXFj9OYwcOITLwDWX4gNVLrqo3D5?=
 =?us-ascii?Q?xT4tieBn8A0ho0CMAoP8/Sz5S5UXHvtnWznYcb3AC6O9OvRnx0ikQrC2wm/S?=
 =?us-ascii?Q?IPuCanEdwFF9k/jhj4pZG3A8x4Rsix5FL9uyI3EA9y7zCFOAWhcGTxBFg8cm?=
 =?us-ascii?Q?etzZq2H1dRuRkzjefGnSOD1kJ/6Hn+au1dXzS9MXBw8+urVVuYPVBHLhugVR?=
 =?us-ascii?Q?KEoYmMFRh9Yl2eELkJgiBgPZI4Vk0OIj6ZrKpamVJwAJocgOIo2ADGveuvB+?=
 =?us-ascii?Q?hQNIGjm9Wf5FWqkBuWJWQ9LsOcsssKiSUMuKn2/wUF7VCR8YELDXUhs1kaEN?=
 =?us-ascii?Q?sJJv4io4gkxuIS4akYHQpaesny8e4k/a68pvCERCxLbW5ZvtpdmyPmyfiMFS?=
 =?us-ascii?Q?yNTpQoMGqiFKJLoYa4AZ8tpz9NPcEDNsYDAog21+MUUiHCUh0fMTi0ihXAAf?=
 =?us-ascii?Q?MVGXMIUzZaKup1oFp8oQm8NSfMyg6URC2jCNrX1krYE/NIQW1IDlptu4Asyp?=
 =?us-ascii?Q?atStQj5Q2Gx7Tvb6kjIz0pUUeOC2agtREgdhI6AIiu3IE0xEfTJ3eS+bK/SO?=
 =?us-ascii?Q?+xGfFAx9cpknd8PV/f9m3XlXitQAzVJ/02XtZo0M/3rGdfK45CMGTzSZW8bb?=
 =?us-ascii?Q?aV065v2O6ckSrRw+t3JhpNTwWMtFl+UPHAW6KVO2tYRAUrzfRvs7RRvYLSEI?=
 =?us-ascii?Q?5V8VjCTU/McSB1PXf8ur6PqCdQNnTsTZD4sFvj/NyAAphUx5CDsSvxxwVe8j?=
 =?us-ascii?Q?VXjPryoNgkVUINBqcxIWL/oy13wV9A3znAd661DKCaja4OBf4YkM27yZ+ttG?=
 =?us-ascii?Q?WI8iBkzPBahEkBoBcEOGzKqMr3cG/kkpZaKP5+o6oiY9z3hJaI6/j7UeNi9m?=
 =?us-ascii?Q?OGQdz2Rb+v5lo1ZaPAfdxxVXEWtXw1+IipduUH11RzTrGlrEWAVnD1NJMTW2?=
 =?us-ascii?Q?OXMCCdfSeBpX9D05d4NwF9BM0BujLXj3A0yZGz3g/0pYttPAtASgAEl+DTF/?=
 =?us-ascii?Q?96RMW2PEAXWvOzyL237+soFfCss9ci9t+8HHox/Bnk2oON8ao2tk9G1LNxn1?=
 =?us-ascii?Q?SHV45JJtgF9XuVrDtkcnQMwRFabvA2PtDAiJlOUMqRkn5zMvqseGYRgWwD5E?=
 =?us-ascii?Q?N6ldG67OK6F5EQlEdlcixkJfoTDZyILvV+A8WZl2a9nsf8PK8rf8o6CZeSkh?=
 =?us-ascii?Q?1XYOTLPxYw6wumK4x7Km8qqpjvWVHFrEbP9pVanpAOgyobWV+DLCEc06GInK?=
 =?us-ascii?Q?waJVXetwEtJOUZJRb1QFaShoj6ZU/M9bboY9r86Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c063a40b-036d-4a8f-69bc-08de17255c00
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:57:16.0431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brw8ZlXU0gsZ/sWzteuqHQnElXKlagWmrvRC2m86mCQxPKmkahmdluQPibAt62WWWxKU6bXKIpIWEqJYfOOUKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11687

Register the RPMsg channel driver and populate remote devices defined
under the "rpmsg" subnode upon receiving their notification messages.

The following illustrates the expected DTS layout structure:

	cm33: remoteproc-cm33 {
		compatible = "fsl,imx8ulp-cm33";

		rpmsg {
			rpmsg-io-channel {
				gpio@0 {
					compatible = "fsl,imx-rpmsg-gpio";
					reg = <0>;
				};

				gpio@1 {
					compatible = "fsl,imx-rpmsg-gpio";
					reg = <1>;
				};

				...
			};

			rpmsg-i2c-channel {
				i2c@0 {
					compatible = "fsl,imx-rpmsg-i2c";
					reg = <0>;
				};
			};

			...
		};
	};

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/remoteproc/imx_rproc.c  | 146 ++++++++++++++++++++++++++++++++
 include/linux/rpmsg/imx_rpmsg.h |  48 +++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 include/linux/rpmsg/imx_rpmsg.h

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a6eef0080ca9..e21a7980c490 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/rpmsg/imx_rpmsg.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -15,6 +16,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -22,6 +25,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -1084,6 +1088,144 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+struct imx_rpmsg_driver {
+	struct rpmsg_driver rpdrv;
+	void *driver_data;
+};
+
+static char *channel_device_map[][2] = {
+	{"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
+	{"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"},
+};
+
+static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
+				 int len, void *priv, u32 src)
+{
+	struct imx_rpmsg_driver_data *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (drvdata && drvdata->rx_callback)
+		return drvdata->rx_callback(rpdev, data, len, priv, src);
+
+	return 0;
+}
+
+static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
+{
+	of_platform_depopulate(&rpdev->dev);
+}
+
+static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
+{
+	struct imx_rpmsg_driver_data *drvdata;
+	struct imx_rpmsg_driver *imx_rpdrv;
+	struct device *dev = &rpdev->dev;
+	struct of_dev_auxdata *auxdata;
+	struct rpmsg_driver *rpdrv;
+	int i;
+
+	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
+	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
+
+	if (!imx_rpdrv->driver_data)
+		return -EINVAL;
+
+	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	i = drvdata->map_idx;
+	if (i >= ARRAY_SIZE(channel_device_map))
+		return -ENODEV;
+
+	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
+	if (!auxdata)
+		return -ENOMEM;
+
+	drvdata->rpdev = rpdev;
+	auxdata[0].compatible = channel_device_map[i][1];
+	auxdata[0].platform_data = drvdata;
+	dev_set_drvdata(dev, drvdata);
+
+	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
+	of_node_put(drvdata->channel_node);
+
+	return 0;
+}
+
+static int imx_of_rpmsg_is_in_map(const char *name)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
+		if (strcmp(name, channel_device_map[i][0]) == 0)
+			return i;
+	}
+
+	return -1;
+}
+
+static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
+					  struct device *dev, int idx)
+{
+	struct imx_rpmsg_driver_data *driver_data;
+	struct imx_rpmsg_driver *rp_driver;
+	struct rpmsg_device_id *rpdev_id;
+
+	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
+	if (!rpdev_id)
+		return -ENOMEM;
+
+	strscpy(rpdev_id[0].name, channel_device_map[idx][0], RPMSG_NAME_SIZE);
+
+	rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
+	if (!rp_driver)
+		return -ENOMEM;
+
+	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
+	if (!driver_data)
+		return -ENOMEM;
+
+	driver_data->rproc_name = dev->of_node->name;
+	driver_data->channel_node = channel;
+	driver_data->map_idx = idx;
+
+	rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
+	rp_driver->rpdrv.id_table = rpdev_id;
+	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
+	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
+	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
+	rp_driver->driver_data = driver_data;
+
+	register_rpmsg_driver(&rp_driver->rpdrv);
+
+	return 0;
+}
+
+static int imx_of_rpmsg_node_init(struct platform_device *pdev)
+{
+	struct device_node *np __free(device_node);
+	struct device *dev = &pdev->dev;
+	int idx, ret;
+
+	np = of_get_child_by_name(dev->of_node, "rpmsg");
+	if (!np)
+		return 0;
+
+	for_each_child_of_node_scoped(np, child) {
+		idx = imx_of_rpmsg_is_in_map(child->name);
+		if (idx < 0)
+			ret = of_platform_default_populate(child, NULL, dev);
+		else
+			ret = imx_of_rpmsg_register_rpdriver(child, dev, idx);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1177,6 +1319,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
+	ret = imx_of_rpmsg_node_init(pdev);
+	if (ret < 0)
+		dev_info(dev, "populating 'rpmsg' node failed\n");
+
 	return 0;
 
 err_put_clk:
diff --git a/include/linux/rpmsg/imx_rpmsg.h b/include/linux/rpmsg/imx_rpmsg.h
new file mode 100644
index 000000000000..04a5ad2d4a1d
--- /dev/null
+++ b/include/linux/rpmsg/imx_rpmsg.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2025 NXP */
+
+/*
+ * @file linux/imx_rpmsg.h
+ *
+ * @brief Global header file for iMX RPMSG
+ *
+ * @ingroup RPMSG
+ */
+#ifndef __LINUX_IMX_RPMSG_H__
+#define __LINUX_IMX_RPMSG_H__
+
+/* Category define */
+#define IMX_RMPSG_LIFECYCLE	1
+#define IMX_RPMSG_PMIC		2
+#define IMX_RPMSG_AUDIO		3
+#define IMX_RPMSG_KEY		4
+#define IMX_RPMSG_GPIO		5
+#define IMX_RPMSG_RTC		6
+#define IMX_RPMSG_SENSOR	7
+
+/* rpmsg version */
+#define IMX_RMPSG_MAJOR		1
+#define IMX_RMPSG_MINOR		0
+
+#define MAX_DEV_PER_CHANNEL	10
+
+struct imx_rpmsg_head {
+	u8 cate;	/* Category */
+	u8 major;	/* Major version */
+	u8 minor;	/* Minor version */
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 reserved[5];
+} __packed;
+
+struct imx_rpmsg_driver_data {
+	int map_idx;
+	const char *rproc_name;
+	struct rpmsg_device *rpdev;
+	struct device_node *channel_node;
+	int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
+			   int len, void *priv, u32 src);
+	void *channel_devices[MAX_DEV_PER_CHANNEL];
+};
+
+#endif /* __LINUX_IMX_RPMSG_H__ */
-- 
2.43.0



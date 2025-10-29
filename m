Return-Path: <linux-gpio+bounces-27854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1446C1D177
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 20:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B0061883D70
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 19:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCE335A14E;
	Wed, 29 Oct 2025 19:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CDQlgQzc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F79364491;
	Wed, 29 Oct 2025 19:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767854; cv=fail; b=P4E2iszv6HlSrfW4Pton4fseXwzPs9qOPaU7JPiakb7fg00Rb36aEavMaS3JVuODS0gleyeLiRBPSlfUMfcC9YuW7aYWAOv1ym17pECxrz/I2tBwXG6LYFkSe6kcmB9AaSmrGO0p7Q4cwo9CCMXaiHxvVHJLiQh73WIPW8Q4ggU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767854; c=relaxed/simple;
	bh=71lompp/CNF1N9NHm0D7CfEoSV4u35EJ/ukCkZMJzgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uq/l5gGno9FbnIY4On4oox2YRn6dO043XZjvN/+UxloRJcPYy/WIYtQcNZmahtTDZcfRH1hVZRT8wZ3XH8MNSfyYps8mZmB+QQ9L48986sZIwPXvJbPjq1aySlSSwYVbL2SNkfeqw3uOKB6ias0++yPr35nFBE9R6uyDXdb6rm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CDQlgQzc; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7hYToeJeFdXhesz7oGHskgVB5C+zDs8loBVeBqQw+bsau+ggIAbPcRpwtxqNzwTmGlPtprisuZ/W55dhMJ1hVwl3sQidQaRENCA7o3dDdKCpVHKXczvTWsRKRlIMwlvgMMI8Xm0WahFpNJSkv7FQsDVxN10mnoIWtGCoWnXLgO3PGXlnpPMT/ZEYnrkUARvmbznmjATy3DLLjLwGj+ZcUaFmQgygqAyG4lVdLEgWZc6T51iybaqiNgWikGwKAAu7MYtdaQ2eu2ZLN0jelEw7YLRpUD+BpHHCL69Hwg1MZpAEOks1KNpwbizb4P6CDPIKWXTXiIdV4sbKSjJyBmcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1qnMDNO/sSSY4GZevZw0c6QbLMNoX6URCpjbOCP+I0=;
 b=Ml+GsuaWQoy5iK5vqVrc/n+nLobzN7WrPWagaXq4bVAJP9PX+KxxaVpwVYJOCSiO7iWhkkuz/CNlAgf1YVzQiOYB0fMdH8/v33U6svPSPbVJmBupbdEnGKm17FGmREJOXRiPps63qvU4UlSXrbXXALmzcXozIAE7jGz+bLpJRhnYUVUr2HPvmYN8IRXSOhkdI5UVP0TmHPdDH/lQGJKlxmdotp2XVc5SKXXMvKYUs/qU9AnRtynAL+D04ddQQxQooJUGjvaw95KkWQygzJ0suEQSv2Am0q1kyZSSiwDLs0YBFbM3H4xCRRf6EDaPtyMnZHLA4ViMbt5zxQgTuNoyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1qnMDNO/sSSY4GZevZw0c6QbLMNoX6URCpjbOCP+I0=;
 b=CDQlgQzcAcw1m4hffXvS7OmsjfO9LsbqzsdB3xrMEL86z+JHOvpI6SzWHGCoRcl7RTb/Ne+6U1jpHyvYMeYPL5r8bwO2/xzXL6BbMyJSF+8NNM+nodOAmNRmJDItexWtmNMZlzcrtaTBrTZI9UZB13UlTK+1pe5Rxnc6qzET4cf9gva1PC2f7/8mdxEGr3cmimLjN4Fw2mDOifVb/aoaoX71jRr9+BTr5KMsNbPqFAXPvJfQKse6ywWYOm3+5ir8dt0SHyYji1NataEDFpywHhrEE+8EHw3SusoAVhYS9OkKDemLuYOlu6T181aAtt0ZnrNNKWEzk1uw4McuJj8JiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB11687.eurprd04.prod.outlook.com (2603:10a6:150:2a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 19:57:26 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 19:57:26 +0000
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
Subject: [PATCH v4 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Date: Wed, 29 Oct 2025 14:56:18 -0500
Message-ID: <20251029195619.152869-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029195619.152869-1-shenwei.wang@nxp.com>
References: <20251029195619.152869-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0068.namprd08.prod.outlook.com
 (2603:10b6:a03:117::45) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV2PR04MB11687:EE_
X-MS-Office365-Filtering-Correlation-Id: c04363d0-1ef6-4f3c-1132-08de17256231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fD2YANexHjrQ+/dh+CVvx33pS1dU5aiqT/vVOgRpVdt/E3Ye8sksB0kxLERZ?=
 =?us-ascii?Q?wDQT0EXOO+wSh0AVQK2fTJ70j4GU9WSxd0TVnHSG15QepxFZF09nZCP0W0hx?=
 =?us-ascii?Q?E7zyyacxvgscILEXEn54d+wBfq6h1bwmJ8jU9Gdgg3eKt8rlvVLaSJPO3Ntt?=
 =?us-ascii?Q?ILsrDj7rMzv8wq5uViHmGVKuVDWz6eSd8ExGMDU2ew2ftMhzfJkMqCq62qXc?=
 =?us-ascii?Q?FuEO8NaEN6NpOjtPnKKmGa1/zmEz/P8Apo8+No15LBjX3hoCVLu98H7Z8fOM?=
 =?us-ascii?Q?zA0mfPyMXbSaXK8/5BVE3E7CvKUKyhgR1cnmLwiUFaw5aWp9PKLleErrk+Fw?=
 =?us-ascii?Q?kolHASvpBxyTEyOmfI7mlRGTZDnUTgCdtL/SJxKLJVrh/oX1FbcMmdZH/nOG?=
 =?us-ascii?Q?w2vFuylQxXNLr9zoqvcm8hDlhqIlFMXKhBmUytrtZQE0fhkbuS9k9R2d2nGT?=
 =?us-ascii?Q?JnRtTr8cEZLk6+oWku2HPG4jkgOP8aKCLLZWQj3J3mZDc35mQZMatfsdT6yn?=
 =?us-ascii?Q?hJ7+cv74cXj0eFtjAdSwgaRBDgpDOu19JvbPkrmCe9XWp7ltFJk+QRsukX2k?=
 =?us-ascii?Q?xSjuj5j9RkmPer/h+vE5nOWmSawBeXBHSJJ/vcjPFFznO37DXIaeCsw877O1?=
 =?us-ascii?Q?v2wwUy+AGi0HwEau0svdQV7JBefUq8CuONH8n24olOVaoJLq3tYvql83hlcb?=
 =?us-ascii?Q?GFivlwUFUycfIq8UaqKioK8twN4BsGxu6s56qz++vsn3cWy1ZH8L1fR2FplR?=
 =?us-ascii?Q?Zs37o34d05SJJqwbcTokKEKIYrCJGd3bd/FcVOTvgkOPm3QuHeUvieFxKkKC?=
 =?us-ascii?Q?8OGwtNt6kuD1QvOAaeL+YOW2qe17+984UWc7Mgzdb16QPzDCjz9MBZv6molu?=
 =?us-ascii?Q?jsVCkNLZkFTLjsRwzA+39BIhZ48D4+Txl4y0T4dH4F1+61AhEOKMUdJGKZZj?=
 =?us-ascii?Q?3/uGbeGLKMucdqGX+Mv8GA+NMTR0IauRwRKL3PP9D1rbJLRw+3AUCIvFGYYC?=
 =?us-ascii?Q?qYRuhwpcdmWBfhD8pxb4SsUN/fizASm7MZQ0XXdnCVMJ9FzmGEpIsIISr1hO?=
 =?us-ascii?Q?xWdkAQBQg7k9yjJhfPeyLrbodN/SDNp/2Dz+mvnSCVQRCKjzXCksYTpxPdAQ?=
 =?us-ascii?Q?JYdFPSf/dFCHFrXx9WGHqPQ4P7XN74w5boRZ063EFhdwIJMjhvQdm8ELRtJl?=
 =?us-ascii?Q?1u0WdfFcTbC2oIYO5ipjT0ItaJgmrhxpnJUaUioMskHdhMoNo4FRi8H5wZT4?=
 =?us-ascii?Q?V9QaX+sQ69HJGLpqlVx0iQ8RUEVPY+/k1pHnfijBMTre3/RHORbOlBKNlKaB?=
 =?us-ascii?Q?v2aFo5N25C7woLinuypSBFt3HnMKx4D5v6oiecOxhZNc/Ex/63VS0wixd4tl?=
 =?us-ascii?Q?5CkOjnXH1JI482BMzr9yX53HVmE71AfagZPTSH+dHSqFzo78YN/HJfe0MJd4?=
 =?us-ascii?Q?3+uVWVhJGZckVu7TMUCtUhnlcvBJ4FKPRPE83vR4KTHt28dVKB9ygNc1W0I1?=
 =?us-ascii?Q?yuKLVtPv9f5rabb7Y5HgyrqZuU01tWRnn9IpCE/ZqS7QvqxpQinVWQh2HQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cSoful67H7Eb/A4Q7TL12HVsUArvabziFaT4rYClvs1TwjG8f2LdPhQqDTaX?=
 =?us-ascii?Q?I9GJqJ0kYwyUi6F7BDidi9J2kJhM7tuAFiq8ceOb0ytocV15jcuP+n2i48NJ?=
 =?us-ascii?Q?uFhTilGppyUurSIAit/DKRUqXjbuZ/xNTKGRaLzqkkZhRECvCSH2RBV82ztI?=
 =?us-ascii?Q?TfFyZi+zrI6ZugilAARvh0UUkm99tFq0lDDQWdxFEBEEQb0FQLknVg7akOaS?=
 =?us-ascii?Q?GxdJD3d7N1LFxMuaLoIqFNbVKFKnhx3bwB4VllYeDRzifzzJpxlAoZpSOklv?=
 =?us-ascii?Q?bg6DIE7B2VKScSQgq0mGSHWfof5ZBEsqfxXGMSht1I0Qem0DP96plJq5DO17?=
 =?us-ascii?Q?JRAWnZTfqrLFMEkhvFP4VJ7kwxsj3YJSYPpgSAixT7fQqVYraxe66OeGZDTU?=
 =?us-ascii?Q?SukDXaLyi6BWVb6oJIimdF8aOlgI34alUtpV+QOpnnQFN8qMRXKxq+pb4E9z?=
 =?us-ascii?Q?xs3a0UcJctVSqenE9HM1bL2+2sDBVGZeck9e5V1JgcYlncI3fnvPIsWlaxuA?=
 =?us-ascii?Q?y1hxOxnTdkcnNDS1SuhBYq/EwbSNbh79tLB55XCaJcYcJ2q91/JqhL+7tYdh?=
 =?us-ascii?Q?nh8AWkZZHqAatN77X1JnLvFUVk5gmMce6qLFQf8kAoXAPyBUsyhLvCsaK17n?=
 =?us-ascii?Q?nDNCI1fR14mLRubLr3Nk+UfrBW906VhLVJ28Mmnb5IOfjNIWjiZdoF+YKTVY?=
 =?us-ascii?Q?pBC56iDL+YbFYApEtulH20XFBFgGWow+Dvqa5BsadBVAxPFwyjEng6xosCJj?=
 =?us-ascii?Q?3hd3kiWascZLF0lKQmLaarjDNsuNa/XEOXbiZxLSGN9qVfFX0MHU3GPTwmoO?=
 =?us-ascii?Q?Nr3QNwKh/VzFzfda96JABkwHUr5eX/GfLCWeCrQ4Q7bOjL4iaE5Sj/cjeqP/?=
 =?us-ascii?Q?jhQtYKG1NQLgBLe3y98zej9vFo2o4QZ8oiOMz3TMStTcwbJl3PU1JMcEAAzz?=
 =?us-ascii?Q?fLe6jWAy/CRr7U8kHB7VGvMThjzWa+H1mAr1qxr/9vn9obeYDgsjkj/RICQJ?=
 =?us-ascii?Q?20kL6TUvuJUz7WcE5MR0OLaxzcKk74IIlTaecjr/FRdcxIooeVR2DuvcuxFZ?=
 =?us-ascii?Q?uDfPtlgUYfb7HbA2wzVW18hbTQOHOKph42o5fSmzaADMih+O4hlMbtADVRP+?=
 =?us-ascii?Q?7LA04A3USTmuXShvVlc95FO+O7CSQyQRk/lWlwuqp+1dv9M09T5N18GROopJ?=
 =?us-ascii?Q?D1heQ2taJ+/vB/FJ9KYEe08Ob0AjsDXHQZ1s9pSHPsH30A/LUsOiHur6TRo6?=
 =?us-ascii?Q?yXP6K3ohd9WjSzlnr/lzX9ui58F3GwjrdO4dsqnWAvZsJh33fxv3H7k0ewj4?=
 =?us-ascii?Q?BqH7iqsIiU+93zItV2CvHvTmt8oVuE2GENWJSEmHIo+D2rF9AwDanVP1JNc6?=
 =?us-ascii?Q?02EpIo4f/PP1AlZXDZe29It7VPwnkWabCE6HkyGoE0bTr1zOGFgDDWb4qAWx?=
 =?us-ascii?Q?JnHt5zQpwj9NLJNXwKlIU6G0+Hqz3Mm6f56P68vrNrtD7aFUnHy3usjaySaf?=
 =?us-ascii?Q?8WvvJHTFzt0fw6tp9On9DPds480BgYARrge1jXfGfpjx1K58et9ZeLXghLwT?=
 =?us-ascii?Q?ncyLe5aVnwardGNlSj3bqUPGMgXzZVJm7V2TvFcT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04363d0-1ef6-4f3c-1132-08de17256231
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:57:26.4627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1dHxYaau2bFNDM0k+9n6A/qPmUVxsDbNaX22wADtZ7n+mFYuwGVllDRKPdRyKjCY9pRcqsHwQ8vnBBvd+Bg8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11687

On i.MX SoCs, the system may include two processors:
	- An MCU running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig          |  17 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c | 467 ++++++++++++++++++++++++++++++++++
 3 files changed, 485 insertions(+)
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a437fe652dbc..97eda94b0ba1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1847,6 +1847,23 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_IMX_RPMSG
+	tristate "NXP i.MX SoC RPMSG GPIO support"
+	depends on IMX_REMOTEPROC
+	select GPIOLIB_IRQCHIP
+	default IMX_REMOTEPROC
+	help
+	  Say yes here to support the RPMSG GPIO functions on i.MX SoC based
+	  platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
+	  and i.MX9x.
+
+	  If unsure, say N.
+
+endmenu
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 379f55e9ed1e..e01465c03431 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_GPIO_I8255)		+= gpio-i8255.o
 obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
 obj-$(CONFIG_GPIO_IDIO_16)		+= gpio-idio-16.o
 obj-$(CONFIG_GPIO_IDT3243X)		+= gpio-idt3243x.o
+obj-$(CONFIG_GPIO_IMX_RPMSG)		+= gpio-imx-rpmsg.o
 obj-$(CONFIG_GPIO_IMX_SCU)		+= gpio-imx-scu.o
 obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
 obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
diff --git a/drivers/gpio/gpio-imx-rpmsg.c b/drivers/gpio/gpio-imx-rpmsg.c
new file mode 100644
index 000000000000..5787ec3a1249
--- /dev/null
+++ b/drivers/gpio/gpio-imx-rpmsg.c
@@ -0,0 +1,467 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rpmsg.h>
+#include <linux/rpmsg/imx_rpmsg.h>
+
+#define IMX_RPMSG_GPIO_PER_PORT	32
+#define RPMSG_TIMEOUT	1000
+
+enum gpio_input_trigger_type {
+	GPIO_RPMSG_TRI_IGNORE,
+	GPIO_RPMSG_TRI_RISING,
+	GPIO_RPMSG_TRI_FALLING,
+	GPIO_RPMSG_TRI_BOTH_EDGE,
+	GPIO_RPMSG_TRI_LOW_LEVEL,
+	GPIO_RPMSG_TRI_HIGH_LEVEL,
+};
+
+enum gpio_rpmsg_header_type {
+	GPIO_RPMSG_SETUP,
+	GPIO_RPMSG_REPLY,
+	GPIO_RPMSG_NOTIFY,
+};
+
+enum gpio_rpmsg_header_cmd {
+	GPIO_RPMSG_INPUT_INIT,
+	GPIO_RPMSG_OUTPUT_INIT,
+	GPIO_RPMSG_INPUT_GET,
+	GPIO_RPMSG_DIRECTION_GET,
+};
+
+struct gpio_rpmsg_data {
+	struct imx_rpmsg_head header;
+	u8 pin_idx;
+	u8 port_idx;
+	union {
+		u8 event;
+		u8 retcode;
+		u8 value;
+	} out;
+	union {
+		u8 wakeup;
+		u8 value;
+	} in;
+} __packed __aligned(8);
+
+struct imx_rpmsg_gpio_pin {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+	struct gpio_rpmsg_data msg;
+};
+
+struct imx_gpio_rpmsg_info {
+	struct rpmsg_device *rpdev;
+	struct gpio_rpmsg_data *notify_msg;
+	struct gpio_rpmsg_data *reply_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	void **port_store;
+};
+
+struct imx_rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct imx_rpmsg_gpio_pin gpio_pins[IMX_RPMSG_GPIO_PER_PORT];
+	struct imx_gpio_rpmsg_info info;
+	int idx;
+};
+
+static int gpio_send_message(struct imx_rpmsg_gpio_port *port,
+			     struct gpio_rpmsg_data *msg,
+			     bool sync)
+{
+	struct imx_gpio_rpmsg_info *info = &port->info;
+	int err;
+
+	if (!info->rpdev) {
+		dev_dbg(&info->rpdev->dev,
+			"rpmsg channel doesn't exist, is remote core ready?\n");
+		return -EINVAL;
+	}
+
+	reinit_completion(&info->cmd_complete);
+	err = rpmsg_send(info->rpdev->ept, (void *)msg,
+			 sizeof(struct gpio_rpmsg_data));
+	if (err) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
+		return err;
+	}
+
+	if (sync) {
+		err = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (!err) {
+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+			return -ETIMEDOUT;
+		}
+
+		if (info->reply_msg->out.retcode != 0) {
+			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
+				info->reply_msg->out.retcode);
+			return -EINVAL;
+		}
+
+		/* copy the reply message */
+		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
+		       info->reply_msg, sizeof(*info->reply_msg));
+	}
+
+	return 0;
+}
+
+static struct gpio_rpmsg_data *gpio_setup_msg_header(struct imx_rpmsg_gpio_port *port,
+						     unsigned int offset,
+						     u8 cmd)
+{
+	struct gpio_rpmsg_data *msg = &port->gpio_pins[offset].msg;
+
+	memset(msg, 0, sizeof(struct gpio_rpmsg_data));
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = cmd;
+	msg->pin_idx = offset;
+	msg->port_idx = port->idx;
+
+	return msg;
+};
+
+static int imx_rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int imx_rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_DIRECTION_GET);
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
+					  unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_INIT);
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int imx_rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
+	msg->out.value = val;
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int imx_rpmsg_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int gpio, int val)
+{
+
+	return imx_rpmsg_gpio_set(gc, gpio, val);
+}
+
+static int imx_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	int edge = 0;
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		edge = GPIO_RPMSG_TRI_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		edge = GPIO_RPMSG_TRI_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	port->gpio_pins[gpio_idx].irq_type = edge;
+
+	return ret;
+}
+
+static int imx_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
+
+	return 0;
+}
+
+/*
+ * This function will be called at:
+ *  - one interrupt setup.
+ *  - the end of one interrupt happened
+ * The gpio over rpmsg driver will not write the real register, so save
+ * all infos before this function and then send all infos to M core in this
+ * step.
+ */
+static void imx_rpmsg_unmask_irq(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_unmask = 1;
+}
+
+static void imx_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	/*
+	 * No need to implement the callback at A core side.
+	 * M core will mask interrupt after a interrupt occurred, and then
+	 * sends a notify to A core.
+	 * After A core dealt with the notify, A core will send a rpmsg to
+	 * M core to unmask this interrupt again.
+	 */
+	port->gpio_pins[gpio_idx].irq_mask = 1;
+}
+
+static void imx_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_shutdown = 1;
+}
+
+static void imx_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->info.lock);
+}
+
+static void imx_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct gpio_rpmsg_data *msg = NULL;
+	u32 gpio_idx = d->hwirq;
+
+	if (port == NULL) {
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	/*
+	 * For mask irq, do nothing here.
+	 * M core will mask interrupt after a interrupt occurred, and then
+	 * sends a notify to A core.
+	 * After A core dealt with the notify, A core will send a rpmsg to
+	 * M core to unmask this interrupt again.
+	 */
+
+	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
+		port->gpio_pins[gpio_idx].irq_mask = 0;
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	msg = gpio_setup_msg_header(port, gpio_idx, GPIO_RPMSG_INPUT_INIT);
+
+	if (port->gpio_pins[gpio_idx].irq_shutdown) {
+		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
+		msg->in.wakeup = 0;
+		port->gpio_pins[gpio_idx].irq_shutdown = 0;
+	} else {
+		 /* if not set irq type, then use low level as trigger type */
+		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
+		if (!msg->out.event)
+			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
+		if (port->gpio_pins[gpio_idx].irq_unmask) {
+			msg->in.wakeup = 0;
+			port->gpio_pins[gpio_idx].irq_unmask = 0;
+		} else /* irq set wake */
+			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
+	}
+
+	gpio_send_message(port, msg, false);
+	mutex_unlock(&port->info.lock);
+}
+
+static const struct irq_chip imx_rpmsg_irq_chip = {
+	.irq_mask = imx_rpmsg_mask_irq,
+	.irq_unmask = imx_rpmsg_unmask_irq,
+	.irq_set_wake = imx_rpmsg_irq_set_wake,
+	.irq_set_type = imx_rpmsg_irq_set_type,
+	.irq_shutdown = imx_rpmsg_irq_shutdown,
+	.irq_bus_lock = imx_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = imx_rpmsg_irq_bus_sync_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
+	void *data, int len, void *priv, u32 src)
+{
+	struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
+	struct imx_rpmsg_gpio_port *port = NULL;
+	struct imx_rpmsg_driver_data *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (msg)
+		port = drvdata->channel_devices[msg->port_idx];
+
+	if (!port)
+		return -ENODEV;
+
+	if (msg->header.type == GPIO_RPMSG_REPLY) {
+		port->info.reply_msg = msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
+		port->info.notify_msg = msg;
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
+	} else
+		dev_err(&rpdev->dev, "wrong command type!\n");
+
+	return 0;
+}
+
+static void imx_rpmsg_gpio_remove_action(void *data)
+{
+	struct imx_rpmsg_gpio_port *port = data;
+
+	port->info.port_store[port->idx] = NULL;
+}
+
+static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
+{
+	struct imx_rpmsg_driver_data *pltdata = pdev->dev.platform_data;
+	struct imx_rpmsg_gpio_port *port;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	int ret;
+
+	if (!pltdata)
+		return -EPROBE_DEFER;
+
+	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &port->idx);
+	if (ret)
+		return ret;
+
+	if (port->idx > MAX_DEV_PER_CHANNEL)
+		return -EINVAL;
+
+	mutex_init(&port->info.lock);
+	init_completion(&port->info.cmd_complete);
+	port->info.rpdev = pltdata->rpdev;
+	port->info.port_store = pltdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	if (!pltdata->rx_callback)
+		pltdata->rx_callback = imx_rpmsg_gpio_callback;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &pdev->dev;
+	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   pltdata->rproc_name, port->idx);
+	gc->ngpio = IMX_RPMSG_GPIO_PER_PORT;
+	gc->base = -1;
+
+	gc->direction_input = imx_rpmsg_gpio_direction_input;
+	gc->direction_output = imx_rpmsg_gpio_direction_output;
+	gc->get_direction = imx_rpmsg_gpio_get_direction;
+	gc->get = imx_rpmsg_gpio_get;
+	gc->set = imx_rpmsg_gpio_set;
+
+	platform_set_drvdata(pdev, port);
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &imx_rpmsg_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->chip->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+					  pltdata->rproc_name, port->idx);
+
+	ret = devm_add_action_or_reset(&pdev->dev, imx_rpmsg_gpio_remove_action, port);
+	if (ret)
+		return ret;
+
+	return devm_gpiochip_add_data(&pdev->dev, gc, port);
+}
+
+static const struct of_device_id imx_rpmsg_gpio_dt_ids[] = {
+	{ .compatible = "fsl,imx-rpmsg-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver imx_rpmsg_gpio_driver = {
+	.driver	= {
+		.name = "gpio-imx-rpmsg",
+		.of_match_table = imx_rpmsg_gpio_dt_ids,
+	},
+	.probe = imx_rpmsg_gpio_probe,
+};
+
+module_platform_driver(imx_rpmsg_gpio_driver);
+
+MODULE_AUTHOR("NXP Semiconductor");
+MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0



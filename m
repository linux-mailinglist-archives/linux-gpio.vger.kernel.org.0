Return-Path: <linux-gpio+bounces-32510-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKDeIM+hqGnKwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32510-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:19:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC9207DF1
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4A963042882
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 21:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF4037DEAB;
	Wed,  4 Mar 2026 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OyRJwbgz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E223168FB;
	Wed,  4 Mar 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659135; cv=fail; b=AL43ETfqPH5TEXhfNvK/QvtRfkkhIXnKDgMG3sz/uQts6HN/53OIZU2B81frS5aGuEb3i0UbFzbrOEefxY+ykBCi8vtlkX/Ej5LMTZtN1qJF6BgUWnVAK30Imx6Ut+IpprsP/7hCH+nmXd0H5Q1syqrJBhIMW7aRUcilBf8SLNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659135; c=relaxed/simple;
	bh=TfSgdvoHLuH0ezciHUSLLg3MF6akLZFpmtlxS+IDsag=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DL5tgDCUe7vfuV4kVpaYBUU7n0Z9lvX/b8vyZYBX2/NjYPrgdCH7gLJbtbXIJbc9ej5AIZKp23Cy9DZbjqNROLLWZXr4R06c1JOEABaouLcqiTtvwmmeZllGqRUsQ2KdmBJoDmRcIq9Yzxq0TQ+CoiaboNEHuYZnIyXTP2je9s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OyRJwbgz; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGiN6wI3KVV6ezf3CYl9eaR+lMGIRJ7pFbZCG1+xIFttdpM0E421m1RXZ/eItsKpiE1LRYQUHIbqSBEtD2VR3KK0rNoTeChNBSoATnhqCZvcfEf+NPUnJ1oSQzN6dSV2buhSU0UrOgIbMvKcrAV9/1ogmJmr+0pHznMb2UEEbk++FogT/fM92tw/+nqG3NzQLTMebio6yR1GMMHHTvamWtuBt+ya2/9D2aaqpcU4vRrYz83kzXMcutfcsdQp8+MtRFxGRAOBkKiDBcoUGA2wv2TlIEzUywvpzLn/1IC/BJG9ZDP69PFZEPqB5W1E8WR7KY0zVfhF1GX80K5jslAfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEel73t4ax9TcRsyBFTvEOkN109emvMaIocLqsc7fyc=;
 b=DWbAy5GeeCm0SvkVxSRohyLEjyF3gHDJFqOL2NcnvtLRuJS4T3B7UpinaSG31K/KZfJp6iej6sie6K/yUdeZLJSTTYDuDD0YfkQtA9oLuepqesPdpelmjjf12MHPCrVA0yjEiE8t3b28p/rHzaq+wq68T7zdkZxy0cdNpSZUwit8PQYqU9XHAFFpSt6UZ3pZpD+QUoHwgurVi4i2v6xHxfqGMcc4p+S7nqUU7flaknx6YHTN3imygTPPkLDaotscoKEphOFtX9gQohDY5Uid21DkuCIGPHYwcI2Wjt+iK1829unbZGvbx2mr3AWbNwi086LyNKRtWjgdGSBq1mYLRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEel73t4ax9TcRsyBFTvEOkN109emvMaIocLqsc7fyc=;
 b=OyRJwbgzfq9yUU3cAlKogFJHphommB2x0wpWG3cUhtfVfRf2VXmmzSBMmvsSlx25/jCWodUR3JgpNJVsBn5n9BBC+yIKaPLrNKfiXaZh9x/MAvEFmXy/elFUc4iB/FgWWza7fWqwbXzLyz/4g7QwYneJCItduoMQpVc1InQ20TWikLuqGlzymFZB8Z33ke48TFIcWf+vIx8V9T200heQMtDNQX5e8NWxa7gQFSZ1q0VYopFeDObpBg+S8g8LoxDHV+KzgD+oXJZ+aSK8r4XByngaWLJIL7AUuVR7ZZioWp72djuqissz0QYG4VjhZ1qngywyIaPB+xtMT/Cwkh+EQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 21:18:49 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 21:18:48 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v9 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Wed,  4 Mar 2026 15:18:03 -0600
Message-ID: <20260304211808.1437846-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0085.namprd12.prod.outlook.com
 (2603:10b6:802:21::20) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 156ee9ba-3e5c-4584-8121-08de7a33a043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	y827CZjBF0Xo5ANuMVTZ4dXxF7o77OGXvo4ZnOj/k/+5pYiipGZVC0o9ORatgho506JTpR/SWw+Jzjuz1dxUlOtfWgAFyqg42Tm9bGF91SGEw0dh/aucwOnEtcGKATLiWd8xr2e1QfyRi/8MyvDk9PxVXPxG8f339jbpvnu91EdC1TeCUTPul2TXJTeK/DzfHZAwinfYJFZVFZvorTUgawdiSz8HW/zuo1Z/rDToLEpR0JgtIoZuDWVZsmc45Gahcunhp+GXghI7yFERqxGAETSCM08iPccRoZwVMQqvCcwdvvcnmzwIqpXer7b6f8KRlG4tZN+6BsRUiapXsikGV6RAGUpW770SQXZ5xb2DkE10CSRellZ1coh5+tSKKvAMLnG/KWOZD3ORn1kM/2CdQLO9/e+7Q8UdncFk4X/fupemeVDod9dNByq5tZi5INe5JhsKG2vss7kCqP3JWhF/VzayisN3dkJSqR6XkEvRApS2o39kg7hi9ozDtRpboodnra9OJz7ExXglpSjF/6arMhFBJce9kbwNV8YsE4v1T9E473pQfhRHIo1zBt6k1/6Zv3f84KGo5GoSCa0ccjE0+4ggsN3lej8yRJ94P4HdYukU33So67fIrXzNSMUu44KRvPAZEy55TXcIqufGiihvUhGBT+KELHAQw3udrvBskPWsnEQwBrncwXmHaEEcRp3qTBXF84/vAlv/+UO1Z5SS2DdyBdO49DVtyJ+5BtZ1n0WPYOGwC08xN/8wGOLpWDXs2wYp5PXrAFLG8//YsHef89igwJupMUuh8GAoBRZC/b1un2osyOb1HnvLNYxmsyXb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?za542Qh9LRoVtl9bPSJtBFXIArk3V35bodbyssB2oA3p8j8Kv9HC3MhXxS89?=
 =?us-ascii?Q?v34N810bNIUF0td/RWt3TURSrI2wojj6rFQ7CMt/wk1BnYYLmMF3oGSst/wR?=
 =?us-ascii?Q?7PmtXR8jbDrKxQJr+rWO8Eo90zY+RpCs18OiMlzFcrzraGwSNwnJ4EiTGzIX?=
 =?us-ascii?Q?WzuI5SPMnOA3+pLw2Fz9QF3jwDutSXIEZ/BshCTZLuE4FP4Wt7HWyltsF1+L?=
 =?us-ascii?Q?5bbksr00DkisVZ+6LY7nUpMw9lhyLSzxmVwGGA/ZFpLwSIEnOXZXyBAYjuxV?=
 =?us-ascii?Q?CSmSgNz51HaJbmlIE5xAzkyrwcMnDzSFAv6b/Khr3xBXjbWxCWPxccmBVUwq?=
 =?us-ascii?Q?R6MgW3BkzcIJNeYsBf1ptjj2pQOqjq0ATVK7TNtMdBv7DpzWmdIvZ082WKtC?=
 =?us-ascii?Q?Iqcw9ZeFZHCLW+Hp0MTwbpmsD+0teuWjUr6T763htbkgyc1RNpRK811aO4fm?=
 =?us-ascii?Q?mv6Roal6R2vV2yyhSVZN00tVj71O65AN9zNSo/HTLb5MEY9v+aOK0BXdtytS?=
 =?us-ascii?Q?JdTGOnuaM+vgsrTNrhi6BiLD57oluT9b+k0As6t4RSu79TOcDISW3Ese2UeS?=
 =?us-ascii?Q?+IoZR/Pq+4Hc6pZ3LlLZQ3jX/WSWgUdizJ3ga9aWJmVDcfTxoHxRHYFW6IhS?=
 =?us-ascii?Q?VQThOfA3XDXICSYR0ZOxxg/Ik8Owkjlq9x1gdhRhljndMBVdZOQiSP4p1ISy?=
 =?us-ascii?Q?mcd5Farm6pta8nYr18hrjPXt2KgH/RJj0vRTtigm/PgFDlsTO53ZDd3E3b1i?=
 =?us-ascii?Q?8d9JhnooZquEj0FiWa8trrQrvu7w18KR7MYPatlqKXuIFz38p6U/w//8ApmI?=
 =?us-ascii?Q?oN6VGyw/ZrE0xxOtHWf3zrPkVP0B73mBTeurH9qkh+rUQBSwUA6K9wNZoby1?=
 =?us-ascii?Q?CzCa6g0BmxDC6V26SqP+V/Gtxx7n56l7PmYdeYGyQaXekzx3W0xVkceoA7FJ?=
 =?us-ascii?Q?vy6YLs460Ix6UhvGcca8ieVPIih9bkxcvfEBJx3LdU3rLdsjghxnSbHFT5/H?=
 =?us-ascii?Q?+nu7lAnNRDWs1O06vHWZlkOiMeRPXEvov8RPit/GGaXOVzBo3wrKgGHcnck6?=
 =?us-ascii?Q?gIXyPy9XNCmfvmtzrivGWJ1KINaCfRw9V64iV2pATqXNb0qxX5GtBZN6VFfg?=
 =?us-ascii?Q?IzI/yS7Ux9p8xD3jPGXWXgJ/+QV6vbtLIXA9k6Be8+YsEV/Imy7ByeNsH20X?=
 =?us-ascii?Q?QxBOTzWr6yZbCxc7g0nSKJy1JThiOMOokEcE8bnoYn1IMNCwUDNNQLM/PFON?=
 =?us-ascii?Q?FldCnqiuOdpwIBwAWjUykthvAkMMbrivkhfR2fquL9+0AHfOIwv9Rakal5qP?=
 =?us-ascii?Q?0yVBnZ/7cIE7y1g+OXW43UzlHZQVCt1uzxRYsHlAX4ML/P9BhymvXxc5NMAZ?=
 =?us-ascii?Q?0TJlhhaqakliqHI5dzQ/jHxclDxJQVNRrRj/YKrl9NuvQX3rW8yDd1ZGIwmi?=
 =?us-ascii?Q?2qXengqfuBz2mr8tHMDRqqXENfEC7iST7Xij73Bukara9DqFZCagUA62Da5+?=
 =?us-ascii?Q?knWlgLM5n9kJwtBNWYJSVrjLRZUHDq6zRJ3LMEJ5RZUR7MhpXZqy8UwXJ8Y7?=
 =?us-ascii?Q?nSp3XC+D5b9xWvzyenjg9BUOi2ULFUPACcCQUQkSHI3Mq+VnHiItl/SxTKqa?=
 =?us-ascii?Q?K2giyelC5sIbusYExMWca2wvX5iUfSrclJLruecMtWF6AVDw4ctIr9Z/uXaG?=
 =?us-ascii?Q?rNfcihvxVP4wsi1cCTGftGlYPJjdnhNNvjvGz3O03ZXHe9Dp8dUrju1zy2wB?=
 =?us-ascii?Q?9g+7V2oMTw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156ee9ba-3e5c-4584-8121-08de7a33a043
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:18:48.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vf7DH3S29vnG3xLTIq3iXSY7LBdGvjsCs66CFb4x29LJNofv+Qbrp7kckJiiXjPuKMrdEebnzzlXaGYVlqVGsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206
X-Rspamd-Queue-Id: 18AC9207DF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32510-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v9:
 - Reuse the gpio-virtio design for command and IRQ type definitions.
 - Remove msg_id, version, and vendor fields from the generic protocol.
 - Add fixed-up handlers to support legacy firmware.

Changes in v8:
 - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
   by the kernel test robot.
 - Move the .rst patch before the .yaml patch.
 - Handle the "ngpios" DT property based on Andrew's feedback.

Changes in v7:
 - Reworked the driver to use the rpmsg_driver framework instead of
   platform_driver, based on feedback from Bjorn and Arnaud.
 - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
   Rob and Arnaud.
 - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

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

Shenwei Wang (5):
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  gpio: rpmsg: add generic rpmsg GPIO driver
  gpio: rpmsg: add support for NXP legacy firmware protocol
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 258 ++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 735 ++++++++++++++++++
 8 files changed, 1145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0



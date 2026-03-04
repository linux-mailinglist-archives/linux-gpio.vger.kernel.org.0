Return-Path: <linux-gpio+bounces-32511-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAsKA+OhqGnFwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32511-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:19:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA8207E29
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2281A304E70F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 21:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A01351C3E;
	Wed,  4 Mar 2026 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KlzTJQ9Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E9B373C1B;
	Wed,  4 Mar 2026 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659137; cv=fail; b=U/zIKzrgguOSxY07HLf7IfthfbIougJqdezHs8+ipb/c2ZCwFW890mZm5yUz+F9UVbqWaO43Do6K6qMknkGQ3qkN2au3Y00w/HtmvluDVGFX7aXNcOSoXdCVLyXIlkCLenpMr7R2nhUOou19QaJ6y3bmzPk8iLV4YwoC2BDAxhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659137; c=relaxed/simple;
	bh=zxNCaHdk/JIjKjeSlq6tid+x9kz3cyUl1NUMlCd3/hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b7GfzyBZruWieln51fDtviRxGCofnpqqh7Jd/jtgeMx5qWkTjR+4l2R3SgIeY0LoxtFQMR8oXsg96AN88LKv4oLixnaFPT/5/5HpMn2EhSbkpLv4C9pC50dO6Ciujj86pFTRE2Hhpym5VyIdv7oBLxPLhfdF+nLbDxXQLPTyN0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KlzTJQ9Q; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZuKsTPjpo9XtclgdZ2R31Pc1peThiIpCOxGbxLHRmaM3Pv8YEfzQCoCa2Mjjcr+o0i6QnsJDItBpKn3nR+llN0nc3GEi+GFhXosS1Dc1M6jn/cCYp5el8xeVVMxDBdHzovKcB/JrCVG4hd5JcCsWY+T2itGIc/Ytgg+jhultih826eAw8toDvx2O9bTqYuWA8pY72ujCSVVg/tgs8xws33UxZiLa0SZBoXeT7k/raHEa8+dauYtS3vesEE8z9Hv1jlkYYPWMG3jGiZ8kBYbkJG5DAHI63PkVb1vk2J65hd4Z9p8AwymK8CjApMKOWeXHaJmEy+fwNsJX4lV2+YKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN9rUnmicvoMOKrnHequ+I7TmHo19OxORVEg3+jsKvE=;
 b=sFzK7qgxQNJlid3I2LUrH0wbFD4IB6LMXQhXUzu2YhYm7nVdEy/P6NrEHsQy8rc7etYNlsUEb5rZYSIRfUtk0+HQJN9v0Owi5PjyASF2LZN7Op09+pbeZRGPR/BFo1b5kf1/1vBCJll12bQMLrbN+TQZDGAVneHBv7xJoVnNatUwHoQiH2fBCk/I3BzXc66ouZ1EGxZHAB1GG1jopRW5LQfsCEoiK4sPCS1oMAARfNO2aEYrVYvNSR5O4HFHYEckE71mm7AKN8Pl6Y7y9ff7K6nLyGYYQeyXgbLZY8blYowRd94uk66BFYE6L9KGMP6GJJbUk9BpSxY/8mSt//bv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN9rUnmicvoMOKrnHequ+I7TmHo19OxORVEg3+jsKvE=;
 b=KlzTJQ9QRiktMQVBZsvxKHbPrEKi3PkG2YfxM0wIoUQMcb7IuSqjAgTwXrRfTAsRDhFQMyk03SsIUODlzo6a1/JwiEzB91VL3H22Io6jFYU7Ai444PiyAnx3omLyQEdfgiIZkdr7rSHzzYZleNKMvU+YxtSNEOGxYLNbFocCR+oSqa07qb4UgBRijA/Cjv9LpWW4rIa9lbhcdBZjU7HwyY659DdBSehUckkUnifNHZOnGThqLxT7jSUiObkCEwM7PwBMt2qP5H2N9yxObo99vpwBskssekwTWGe5hRrialJbZ65DSR5JptsANlJ5Yba+EmS2U2RRzSFQs6wTwfpxSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 21:18:53 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 21:18:53 +0000
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
Subject: [PATCH v9 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Wed,  4 Mar 2026 15:18:04 -0600
Message-ID: <20260304211808.1437846-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304211808.1437846-1-shenwei.wang@nxp.com>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0077.namprd04.prod.outlook.com
 (2603:10b6:806:121::22) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 8554e71f-6c15-4dbf-7b8c-08de7a33a2dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	N8F7wtMTcSLM2+XaG7QtcgMtPS5qjK27SsA61Uys6g87ltf0+kOb34eSzVVvvPGsShm1sNU0fenMTA2TUdN/isd/tB3kc6xD4xoM6lO9RF67RxLw36FqQhgj5KJiQirL8A7AVnE8z1KrouAZj7rudPEaRaZA84LxjQZipyqetSbs96c3oCE6p2u1mLmZKsXZNzkoGsaI4QnhgR2nwFkSXPLSkd/LqBf6vtT6vi6EaYyaFy/MyCtbkW94jr5DM6e6aF6/czUId4TsbJV/ZB5U/xjmFpd7ylDiMK16MPe7+LP5RygTZ8JGsaBlA4cGfSdqC806tAg/LJ2tkxlq0BV8CWiMUeR7qHAVv6Ep4N4U6ymj2uuiExucrrp7kMhapPklNgGMZPcixka/zDSP86lZTv8lFYhOcyKuAzgRgVaMJ1mdL1X1XweYYddsQ44RvFqajyJG2GaZtvqIubn80XnYOK64CovLK5q8CwFMGQ9M+Gqa67mazBVHcvHMcYiFClPgtjZAjiWxSmUpHh38VX2td7EqL/BcoB7sHtCDvC5OrKq+yuGw9HWhyVpA8zLDAU6L6V0fUjRsWjlcW17noreAUwGOFsRuFrFdNA6JQKeA9WgJagbSd9lvCB6ApWpDORATYj8nGMtFA6cUXepDdjARYzViOeEYcf/8LDhbXweEHOwixf2C53lwt76w14pU11hKZTj1MW7AuCt86jc4XpbxQBmAZnlySqgFh+gCWhy5eTsLDY/BcL9SsnPK9lD8YXxdXgG9DjVEwWWtfVagim844hxG/jkZTUYh7Lu25vIDxqdqRTRxtWN7QiqMN0obfXgl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d8+ebk2kXgvw2q313xT7SkLAMqzahvT9h7sx7mAdV9/u9tdS6iIgbDPLbXrV?=
 =?us-ascii?Q?T51ORpIqcAREn2kmUFgRO1sXvRwfZBzS18o6SMm8MI/uTZZnPwEqifjArwX+?=
 =?us-ascii?Q?eWUzp5AhOMtUVj+4Ge3n8qG5t34Dxh0Ze0TXUwwCidolYA4noYmqM2hUlx4+?=
 =?us-ascii?Q?G/3LB9CfWTRq9/krF2147VDB6G9+DT6UgWVnzi0+njxzmJMEjmYn9m2cU3xo?=
 =?us-ascii?Q?PVx8aMemlfGeklXxoZV62mUQ2pRBeHVQWMFyKqZWXRtrpx9qoKxCDZDAkY8c?=
 =?us-ascii?Q?kC6jaXxiiDpqFxUUs+GQTPOSn/XGl9JhmfpXY7uxb1yzMuKwrYARFXVDYIum?=
 =?us-ascii?Q?8CPAjl07dH2A9Mjm3XikG5KTCm0a9dvSa7PT8Wc4fJxvvxCdESDZ008BEfUm?=
 =?us-ascii?Q?k5HY02YGrmvUgFn26YwmhMrNOoM2RYgDcFuGwKd4KNUt2qxdqlrjIjKBe3cf?=
 =?us-ascii?Q?ac6GdXYbCTe7m6rEpQRH9JTxW7QJSjaO4pqWm5TrQiMNRti0f5TmPQn/ntxf?=
 =?us-ascii?Q?79oHlM1pChlYM3oD1gIC2ViPghJ2z01U3n+rJ7pCPAxdbLkbS2M0NLGXR+5z?=
 =?us-ascii?Q?yHC/Zu8pWRNp4IxzwQBNnB8e4m8gV1DK4ISf231JcDuAQc1+keGOuIM3RmVK?=
 =?us-ascii?Q?gZWBg4idNqvstLluizeXQeEfzNTjXFk4p/7W9QpSfPBDSLS+nT+C3gd8cIT1?=
 =?us-ascii?Q?J6EhDcNN97giaLG1AGdnJO/TuGvm43BmsqYKOZYkmZ/S+3D7WNUPxZvwrwxl?=
 =?us-ascii?Q?URlsELCBBgrSrFoTjHRbNQxxkR3t8QJKP4vr7NQddMyHSN1qwsNq2qv+TJK2?=
 =?us-ascii?Q?dHcqi5z1fw+7UZX8nTOYgUt1z30muVry1joWxnyzlB5NJPx4Cs+K8AOIPo2C?=
 =?us-ascii?Q?sJ/VU3exJfu/6d5bnmXgLcgEz50gMITQoyvhyGofbTV4nPAkBYF6W4n7+VuT?=
 =?us-ascii?Q?XiYr6XDADCe9uJgoPSjvGSirrfjw2hW15nqhVHlEx8dI2VIkNGI2lZkGq7Iy?=
 =?us-ascii?Q?GSS4M5SAMmmLuftDakgTrVhUjyEuKrEkjYtH1BV9llkNWqurLkVFzonQvIcb?=
 =?us-ascii?Q?5roEY21yumAz6n9IyodxbKW4bYaJ7SJEFvhsRHS8Wse6vKPu2rYXttp8Yfiy?=
 =?us-ascii?Q?cfCzecYx/vOWzJPwQWwJmA3YlS++RPyjiZRHoEAesB2wZ2ql+IO/pr4MQVLf?=
 =?us-ascii?Q?I1063ituh3W5qX17jULERlRhsKeobHMoN7hb8L71CTmbY6DoX9/4EYi9AwYU?=
 =?us-ascii?Q?1Uwlgx4bHGVCm2KLSHMSjSrPEljkjisNSQJ/5VwRDHea0H6w71ndQtw7f8dn?=
 =?us-ascii?Q?vhVq5PEsPfoaWeUoaLA72bcJn9vZ4CFLv64aeCBrLmT6oF6RW1f0AjR2SquP?=
 =?us-ascii?Q?0MMrdc6xj8JhDbA3SkpMO+Z5qGNgHM1sIF8wwupyYR17z9MH/OgQxJlkKedt?=
 =?us-ascii?Q?hQsDZe3avRKR+5b5N8eZUlOX+AsAbjACtYYI74sh8/14t8gMX+TePQvkzuNI?=
 =?us-ascii?Q?hHUlUTLkdXvnHDSuoSuBWkhersVMQouEm4a8NTOLXmMX2+9zIyOVj/UebaNE?=
 =?us-ascii?Q?cbg5VErmLaR371kHJWaKKJKxeoITlsL0q6sxRSe/xH5soJyPpHDFDn+pSCTs?=
 =?us-ascii?Q?6nj2I6iifNGBXk/GRdyL2HnaeNja2Xn3XaCwIEDLK13mqT2mA9wemxl+ictd?=
 =?us-ascii?Q?fIKxY7mawTLDiWhGhQZu9fZ70XJdcXiTOtf+YK0E9szDRCqXqi8laZ0yZKYL?=
 =?us-ascii?Q?Mvs5YqjGTQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8554e71f-6c15-4dbf-7b8c-08de7a33a2dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:18:52.9984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYMWYALu2vzDP/W+piPwZkRNPWLRSa5XxeKUP//zo3BtyHxaCZ6F9+lZAC+SmL7454l1pqZ7hYLRMSa5hRclTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206
X-Rspamd-Queue-Id: A4FA8207E29
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
	TAGGED_FROM(0.00)[bounces-32511-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 258 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 259 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..43ea5c5279f0
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,258 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG Protocol
+===================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers located on remote cores on the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 6-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   |type |cmd  |port |line |  data    |
+   +-----+-----+-----+-----+-----+----+
+
+- **Type (Message Type)**: The message type can be one of:
+
+  - 0: GPIO_RPMSG_SEND
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **Cmd**: Command code, used for GPIO_RPMSG_SEND messages.
+
+- **line**: The GPIO line(pin) index of the port.
+
+- **port**: The GPIO port(bank) index.
+
+- **data**: See details in the command description below.
+
+- **reply err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (Early remote software only returns this unclassified error)
+  - 2: Not supported (A command is not supported by the remote firmware)
+  - 3: Resource not available (The resource is not allocated to Linux)
+  - 4: Resource busy (The resource is already in use)
+  - 5: Parameter error
+
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SEND** (Type=0) messages.
+
+The SEND message is always sent from Linux to the remote firmware. Each
+SEND corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
+
+GET_DIRECTION (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 2   |port |line | 0   | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 2   |port |line | err | dir|
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: Output
+  - 1: Input
+
+SET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 3   |port |line | dir | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **dir**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 3   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+
+GET_VALUE (Cmd=4)
+~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 4   |port |line | 0   | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 4   |port |line | err | val|
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+- **val**: Direction.
+
+  - 0: High
+  - 1: Low
+
+SET_VALUE (Cmd=5)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 5   |port |line | val | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **val**: Output Level.
+
+  - 0: High
+  - 1: Low
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 5   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+SET_IRQ_TYPE (Cmd=6)
+~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 6   |port |line | val | wk |
+   +-----+-----+-----+-----+-----+----+
+
+- **val**: IRQ Types.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: High level trigger
+  - 8: Low level trigger
+
+- **wk**: Wakeup enable.
+
+  The remote system should always aim to stay in a power-efficient state by
+  shutting down or clock-gating the GPIO blocks that aren't in use. Since
+  the remoteproc driver is responsible for managing the power states of the
+  remote firmware, the GPIO driver does not require to know the firmware's
+  running states.
+
+  When the wakeup bit is set, the remote firmware should configure the line
+  as a wakeup source. The firmware should send the notification message to
+  Linux after it is woken from the GPIO line.
+
+  - 0: Disable wakeup from GPIO
+  - 1: Enable wakeup from GPIO
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 1   | 6   |port |line | err | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+NOTIFY_REPLY (Cmd=10)
+~~~~~~~~~~~~~~~~~~~~
+The reply message for the notification is optional. The remote firmware can
+implement it to simulate the interrupt acknowledgment behavior.
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 0   | 10  |port |line |level| 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+- **level**: GPIO line status.
+
+Notification Message
+--------------------
+
+Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SEND and its REPLY message,
+and the driver is expected to handle this scenario.
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
+   | 2   | 0   |port |line |type | 0  |
+   +-----+-----+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+- **type**: Optional parameter to indicate the trigger event type.
+
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index bee58f709b9a..e5eb1f82f01f 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -16,6 +16,7 @@ Contents:
    drivers-on-gpio
    bt8xxgpio
    pca953x
+   gpio-rpmsg
 
 Core
 ====
-- 
2.43.0



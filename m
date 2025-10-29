Return-Path: <linux-gpio+bounces-27851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7BAC1D15F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 20:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4291899FF1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 19:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F8936335E;
	Wed, 29 Oct 2025 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oGboZKKK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7635A156;
	Wed, 29 Oct 2025 19:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767834; cv=fail; b=lpM4jj/dzUk0u+q7Sp3Xm9SEhoLJ2zq6Ex5f3rqEroQAIQ0LI1rPEtHUW+sYS3F8lwHqugE5TFx2lF/SLxoSmddZ9E8ZN4pt3NPyhvkBJbeh96gdK7vgYy9DzSVNglPBEsLHCNpsywsUb3xFnglSIsbB+jFM1Aw3IueIc9+pnug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767834; c=relaxed/simple;
	bh=dJvN3PVdWTU0uEkXZDJ6LK2XGCjZQ/LHcxCeyghw8qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LKfQ6YNiemh9/9gKia1GrJODpZmM73gfEUDZicLNCckZtB9UruL1ssoGyj+pGLtZJ1qRWP5dTBD+elxgxuybYpoxhAG3uAAZAueHoUcvBuTS4SfcC43cU3nS5TSVs6Xz3+F3Z6mTOBT81U74hFc0B2b8jsLnH8fYfIDqwdFirHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oGboZKKK; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY3UqLtUYPARqDXV9uiAu/cveX/zLQe7cDmmXfzCWk+RFWjMt10jr4kw7Ftkuoy3Mtc9AN9Nq/HEYGcpMnai7YnO5D9StPa57MUNljUN7i9i3iQ1ssDZFy9Jiu0Bouh9Eecy3p90VZiQl6jhY5FLYuVQgKNqkHh76qQCcctWpcDyajwmwXzmHbGqDirDsPhvGc7xooIPZXWrPowZXVb6e6imny7ioLpRI0uPV1baaOsSYzqaZ1WUXgU/iKxXG2EPWJSGaTSs4kPRPFdQxfoUQu59GC5JcAE5T3nQaPxrkTHJ7qLGbZR9gAujJ1CGf9hMpHLOtqEVcLrVAZ21gT8h0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9Zqh2PoVASX1qQmYJ5tb0TRXoIF1kP9kIekkcjS+ZA=;
 b=iI620+nFI0Du8GV5fgSzTBBMzn11mGyPXjyUqGci1QGGuejmh2SuVN+5AYPf2TG/E/vvo2QyPTbls5Upsoa9z48PnUxm2s5TdmwvOmJ2v75FYK4gMfzTT92LdLefsD9SJ+xFvcR6DYjUOlPm8OYGqK8lH3bETlAt595cM6Y8Hb//9i5NKwDuNTtV0VAHMt82PanJ5MK3586tMO4ZQEX5KRfoFRQ+YlZT7VMTh3T/Y0deBnBJu2TYS5ZqqQR8h8UMn7iF28iUPD1RoZ1p2v6YKNA6TZaiHXSfwH3soL0lG5cPfs1qONZaLQeeT5H1fAQIPb1idCiWedTkc6QUC5ICnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9Zqh2PoVASX1qQmYJ5tb0TRXoIF1kP9kIekkcjS+ZA=;
 b=oGboZKKKStugsceC4tFYbf2PzwX7UVOSfgDvQaDmbIk66OBq3w3y+EsPiOMWFs2C3SSUVsOMcSX/jui/kzOR7zqQX8KZAeSlFlvvjlZQcdSSftMEnYKKawi12ZDV7BW0i4h28ZtZ026v6bMpIH4Ij9dhln+mI+ey4j1a3gSb2IJjRvIcWN1/3aqUVi7c/PN+eAW6iXP/g0kUrP4fYiifSi+cz87LbwMYEfmttlHPFx9fP6nczDKTVNG/aosOyPesQ+xX7xwpgqHIqHptmgYpHAMKEMVgz8kGqUaNV2IMo0fQmPIvKWTm88V0Cao6EuS4TduEu+Lf4JtgColTl29VtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB11687.eurprd04.prod.outlook.com (2603:10a6:150:2a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 19:57:10 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 19:57:10 +0000
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
Subject: [PATCH v4 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Wed, 29 Oct 2025 14:56:15 -0500
Message-ID: <20251029195619.152869-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029195619.152869-1-shenwei.wang@nxp.com>
References: <20251029195619.152869-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::25) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV2PR04MB11687:EE_
X-MS-Office365-Filtering-Correlation-Id: afed3f9e-1e9e-459e-48e7-08de17255891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ui78yXKLmTCCFS+XvCc/oNEwZHSycHY7qV4rKs+urWVWJW1Pf3s5DP7XE4D+?=
 =?us-ascii?Q?Zt1kJtmLyklgDAWPliDD99fwrhkTfA0nMjy7a0pd0TXAHAF8Y695g2uvvPJp?=
 =?us-ascii?Q?MatLi9nbvnlsvAFUt2D2jiJ0lB9jJO/TiPwbnLGyJ6q4XdJwhpPeRjMuTSFT?=
 =?us-ascii?Q?UcA4ePOK4sB+zjoXduiWuVChYSuL89eBVBosXINgRTrKocChq9LILM45AUVJ?=
 =?us-ascii?Q?4w3HSXQ9VcItB5cQLMn28/rTYHITJ89Phf8MSGnsyIV1yvjzyRPhWR2lK0ZA?=
 =?us-ascii?Q?zAL0BtVLN2gVIMvpczkq7m6iByb8GaYOU/VT5XVJMsj/48aNOm9D7fetEX3K?=
 =?us-ascii?Q?ufTmLRTceBrUOeMXOJDpMLhg235BmDUN5ELIkJXmvsfEa6t5GWYzwexg2tPe?=
 =?us-ascii?Q?6bi68bB2oNOfxK/3b/aeaW5P5rhIJ9JaxXH1cyAjskdJUMStu2qsRt8bJrZ/?=
 =?us-ascii?Q?+Ol3f+6PDlcqMA2qEp/B2PRHlL6S6bUNpP6g36iI8uTG5WUxjLy6X/oPf4Na?=
 =?us-ascii?Q?jNbwEAlxtews4QZtFMdA2SPIRnEWVAPSgWRRW8M+oloCVNbm10dNVaPOcVuh?=
 =?us-ascii?Q?3xKTobVg52kFAMzAHaYERDYEX8ezQ0ll+NKoblHeTiLmK9ErWWiFoX7hI0O/?=
 =?us-ascii?Q?61xM6i8PN50nVAcgj3YYo9HbEUHiqST47hF/F4EnuSPYSHzKJIFW9jxdNvch?=
 =?us-ascii?Q?VbN4b/MWCXgHzH19ctgP+lgI4gb4+m56Q0c1Z3113IPVa5oG9bVFkLxMP1bC?=
 =?us-ascii?Q?uAngcTMqPem0uJ2ez1VHouzHIurMNA2Z1H3buD+hwn1A0t+GVnt/45yCfTyA?=
 =?us-ascii?Q?HBwtJf2y3xI/mNuVs7jy1DIhLFKDaLpJhwIx/2tOawZYKyR15Ez0ZNR8cVlH?=
 =?us-ascii?Q?Wjtw6ByMmxvsKuTAhy07+RiFT2hAQoOBZQmxVU2hnG6iRI/74/0TlQ2oDiTt?=
 =?us-ascii?Q?fq8w+TUX+YfoD8XqDS3N5hqRMCgPcjkCY939F6AbdQ5lOWjrfOxDQ7RGl8K2?=
 =?us-ascii?Q?vt7p1+un9O9tKXNpcgfpScBDnkxveeSbuWWkZgszz8KcpdjcgeTg32qeYpbC?=
 =?us-ascii?Q?swZFi5Tl/JXtIOIYQ/NfWo9kRmLBK/rMico8d8YCgzqM6Yipz+6QOrqG1fIQ?=
 =?us-ascii?Q?FFbqUAw4KzGQwgrA/qMP+WPMJLXMHW1hwQgKB3lN5/VZj1VSFgMuo7HtwzHQ?=
 =?us-ascii?Q?WS4zijsZv/rIu+v7IJImkY2yjGdD2A8dLochAvS2xRHq5DRJrURWYhSTgGR8?=
 =?us-ascii?Q?f/9Fm65cHtklZRL3xhnCD+sh2/Tlmph9zrOtgehkSybRc+8bcO4FkrUilLFY?=
 =?us-ascii?Q?13EUuoi6ZzBfb4XhxF2nV7kNzUBA/yGDEuJaHB+OXw+ysAz9fvZDtTM5dND8?=
 =?us-ascii?Q?lmwtmItDY/SsSErtbRoUNCCtun4UW2k29riFV3143QKvYukQrXqJHq1pa822?=
 =?us-ascii?Q?X2I1CkX0F+3OBp4U9aKdUNqoorzPwhtiMcLeJCMnsA972XMSb6Op2K+KyU2s?=
 =?us-ascii?Q?hboLq1BQxgNlx8chhpdNxg54FR4N8SamfHU6gvL39xoMy+pIXCA93VBtag?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NkWi3I8IAHBK6uJPx7o1VJZMT+3YQhnUVh2/rDroDiM5guYykHIpWkSh61/H?=
 =?us-ascii?Q?QX7pay2bxCeUy8psV4S5l9ooaDLcqjfBDSIgD1K2hPdoAn0tA2UOvYsEMTiS?=
 =?us-ascii?Q?CiBlHS+N+tTtFbL/XHut7x2BGSivd0e1qmhafNVw0QPw5KEUL5z61VLz9wJ1?=
 =?us-ascii?Q?RAbh0ugWIIKVXGW8FOC7K4kRWH+/FmGUswpyd6T/KxOj5j7uCeFNLbEKesrj?=
 =?us-ascii?Q?iA9XVtrOK1ALfAKd67jLiMq6srF5ye2EdS0vshxR22CeNso8+iEQ6PH+IUqc?=
 =?us-ascii?Q?ejkALEZdik6mRXWlbpTOBV2pxwzIpbnKBPwpsmIP1FGMdQtfePZQQ5Wj8UHA?=
 =?us-ascii?Q?bJe4M+6lnO8ZRV18uT66lCFRwlsotZGRnmWagDX1XZ7ieta16xXnX3fn42g3?=
 =?us-ascii?Q?9iGVeUP6oPIbFkYPyahM+WbTLW+bNVdc9X/u7fG9aR/+xHnFzgWGgcr7xnAp?=
 =?us-ascii?Q?hLUz8kjQ2UtzfsRFaTgrU1qse0iR8XMxQreCWoPhhMl34+POTgeJRu/NgD6f?=
 =?us-ascii?Q?llTY3kTpt31ndRMyUVuuSlDKFQQGX5Wv5WATprlWN8oe5MP8xpZHJsKngpZQ?=
 =?us-ascii?Q?q+fpbIbyoqkZgAOv/b/ncpbH+u84PQdXbucIWbM1Gj24TijmFarUhHldyq25?=
 =?us-ascii?Q?qLPEASYngfhrHyIHmmP+NXuSXaPaU8zs4nd8bHkvne8i7J46v1OdJS1y20Vy?=
 =?us-ascii?Q?KhcGA9i18rWHkxGBqLVyIbFTTpn1NoJQ6Efpdafvz3rbckUQPPzAjPo6oGHR?=
 =?us-ascii?Q?uOI48rd6uacXwt3rPD+RvXaKUiVuUPQ/IithTcL13jkv0FLOcgvN4svdgeJ5?=
 =?us-ascii?Q?YYmxuzVDHgKbF9kacOmEJffzluetC7BDN9oAWYdOJC8C1GJ5KiKxIm1k7IvP?=
 =?us-ascii?Q?s2IQl/iS+l/pA0ccy6xvTCowMsNlAcBwZb6hSd+jLJyL2LkdD6Spl2EXzTqi?=
 =?us-ascii?Q?X9dXj+vShrJwOWFBWgA7GK4atF5SYr1kWj9NpbECgrNSOFVXgfopOc64cggC?=
 =?us-ascii?Q?+CO8yqlV23PxDVs6uEMZ9DUOL0rWipzhYvVzoUJln81ql0mDw91nzojKZiPp?=
 =?us-ascii?Q?tQ+QFrH2pHoWam+nehyCLEMyE8msFrlSdyBtDuMGr+DbuEAJfMILyhinHgdL?=
 =?us-ascii?Q?nbcPlvno2jsJhI74bpqKg8HoW2LXiz/a3CK7ExcAl3xJVIB3EF7fhaAWI9oi?=
 =?us-ascii?Q?wYt3onoCaXHyZo3z8By3NR33bW1XQiDGE/EyKvMShQmoSagzPrWnZmU13Fl9?=
 =?us-ascii?Q?dG0vHXwmKYMvmhxLueXFJ6jL+J/jDVs+XKTFdQgGzdCGisiue1ZTnnHgXaDl?=
 =?us-ascii?Q?CFQ9s/Mi2B28hKKkx9U7045i2qqgUoOrnDZ1vP/vUjCxgPaO5RTZbapySMZr?=
 =?us-ascii?Q?ClXOfrFdqGJ4w4KcxiBxZW2FD+RHaZ+fjRH54tV4TCkhnHRyqFZXLmxNkb22?=
 =?us-ascii?Q?Pp0EguNpCEV8ATUoXktuKm4CIJB85kdCUcBxgb+fWanL9JhOYijPqaz/zW+Q?=
 =?us-ascii?Q?b8d15LF9od/u3cgMmI6QeJMDumjw5brbJgtQv929wTRsit+P89rpQf3ljObZ?=
 =?us-ascii?Q?kUDw2eYT13V9DCiph3YueKYf+tGXNpZ/AAC6eZPg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afed3f9e-1e9e-459e-48e7-08de17255891
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:57:10.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NtVl7XZLio9X7excCHljCHGvrgdgsiIFl1Nt6wIw4+pRNxvyY9Z2kNK1exk8nH0ac6+pTAi8Vel5aLNjO4XUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11687

Remote processors may announce multiple devices (e.g., I2C, GPIO) over
an RPMSG channel. These devices may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node.

Each subnode within "rpmsg" represents an individual RPMSG channel. The
name of each subnode corresponds to the channel name as defined by the
remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..897a16c4f7db 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -84,6 +84,92 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Present a group of RPMSG channel devices.
+
+    properties:
+      rpmsg-io-channel:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            unevaluatedProperties: false
+            properties:
+              compatible:
+                enum:
+                  - fsl,imx-rpmsg-gpio
+
+              reg:
+                maxItems: 1
+
+              "#gpio-cells":
+                const: 2
+
+              gpio-controller: true
+
+              interrupt-controller: true
+
+              "#interrupt-cells":
+                const: 2
+
+            required:
+              - compatible
+              - reg
+              - "#gpio-cells"
+              - "#interrupt-cells"
+
+            allOf:
+              - $ref: /schemas/gpio/gpio.yaml#
+              - $ref: /schemas/interrupt-controller.yaml#
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
+      rpmsg-i2c-channel:
+        type: object
+        unevaluatedProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "i2c@[0-9a-f]+$":
+            type: object
+            unevaluatedProperties: false
+            properties:
+              compatible:
+                enum:
+                  - fsl,imx-rpmsg-i2c
+
+              reg:
+                maxItems: 1
+
+            required:
+              - compatible
+              - reg
+
+            allOf:
+              - $ref: /schemas/i2c/i2c-controller.yaml#
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -146,5 +232,42 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "fsl,imx-rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&rpmsg_gpioa>;
+          };
+
+          gpio@1 {
+            compatible = "fsl,imx-rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&rpmsg_gpiob>;
+          };
+        };
+
+        rpmsg-i2c-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          i2c@0 {
+            compatible = "fsl,imx-rpmsg-i2c";
+            reg = <0>;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0



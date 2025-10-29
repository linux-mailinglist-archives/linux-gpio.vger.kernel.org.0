Return-Path: <linux-gpio+bounces-27850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31208C1D15C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 20:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7DB1895DDB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 19:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3878535BDA5;
	Wed, 29 Oct 2025 19:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hjbDq9eo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30F1358D14;
	Wed, 29 Oct 2025 19:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767831; cv=fail; b=oCdUeP+aQ/oRfncGc2iIX9hqCEo/UrwZ4bwpcghXNOqIKcfi/vsM8B9h3ZclaJTRLXKt3rSFHh1QivcyazvudlkeLKjW5OUKwECe5dy4aRVE3HSg8lfsdxk/5Hn3+GkX8klq+ude9E5atxCVLyzpprz7caqE4Pkz7uGWIuAJq4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767831; c=relaxed/simple;
	bh=JKeYL6MxQeCwHFLn9B6gYagm5+6HZ4atTBWySmFxQeY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nXqATeuv2utz49ofzGAOIT//WLi+CNgLAGlxm+kw74J7DptBqbATz9cj9ujxEyd1txDL5f0s5JswZ6KkPhvJTUiXohiy/Dfsr1uR8nA7k2/YfLlAuxbLGc7Ce8D4t+0bmYdBJnmYXHdpKNaS3kQ14bb3uUsp6mSlQCHiHwi5i/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hjbDq9eo; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxWj25xQHJ/llfZWSjQcuvZxkeFIjKx+Bche9jxFoyd9Ugdi0/IfBigocnAq4mTAJYVeOpB4rsIbmTuaMN4nDVFc/kJ4GXVgdzxcYDE7C9SLdz/gFwi4f1PU5ojNEbeI80k3LQgHesqu+e/uSwvn9nz+Xfcq1Q2VM7JAdG7pFOcsUfljnDIxlcb/LSUB5U19X885wpnbXBli2Rco2ylSMiQCozUpsR5IRKsh/AikVqxAEVyZdKXzh/7kBtpPZmXogEu/mW+NMiF3c9ee5EoYAoyftcqHr1knk0gnd6OJNsCXAz9BxsplGZFH+Ay57Rtm9INxkGbPAyYilgFQu/l8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXcFjJr0XpCqiQHNOo00oQQTrLG53cmUdxqEpJFfpv4=;
 b=NTB/sCNsgkAam0N8BOiyfPELRE2uAXF2Kvtacu3/7jGEgI8pBsenJy4g/FtVCO0q9VGu6doGcpLiQKz9cEB3Aqh7D36K+7DNe0tc2HFxy23tQ53Ru2S4Lh1se0HRNXO7qTaCzaQGXxZDSPEP+Dxp1kJmG/d1Lc/p+HWuAUWLC5R1dUNJUiAn3QXsjiAIfX3D42iq9K4Mpocbt2HoTofC6qrpW9sMhx27MX25GEMUROE02fiXadkWneSM0sG2bctbTwQ2ReAjRFN3LMSgUvl0Us04CH5OygvNLIxPaucXbbmqw+0fkkBj+HPszuAe0kbzlg9ZR2VRl6ojO6n+iDZ0Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXcFjJr0XpCqiQHNOo00oQQTrLG53cmUdxqEpJFfpv4=;
 b=hjbDq9eoAtra4S9RYGmUKbMGZU1OUht8YmRbggx9ic3Ta+EyrWPIQJ4kPBF/X7klgDUwH/ukTiADAlp7+QCwbhBO3+yVSQ89Pyub19EFRW9DcVUPGm7MF0KRi97RO7ynwtkY205U+RJTwCxSymKDlvKhbhYVVgJtZ9r50T96PmIjjJZ5wc1CRbxZZhi8Rr5d4VKNBscCr4J1R1CbWytqNG0z12mDst+5UvvpwFukIY2Svku1oAo47mcyzxxlp9M0N53Oxq6aV4p/hDRrzsIfgLgbdrvfhYk/CSb05GUThuTTzMn5nr1yIUP0MN0FZAmKA6n5TUjYC3aMLGSK019QFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB11687.eurprd04.prod.outlook.com (2603:10a6:150:2a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 19:57:05 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 19:57:04 +0000
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
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Wed, 29 Oct 2025 14:56:14 -0500
Message-ID: <20251029195619.152869-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV2PR04MB11687:EE_
X-MS-Office365-Filtering-Correlation-Id: dc192997-d4d2-4145-1c65-08de17255559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|38350700014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4sqsnerHNSsjMsyvZbMQKWCpGAS0RitPQsGefV3yamGg1H2TxLveUtENXzhs?=
 =?us-ascii?Q?oUhwrHp6izl2DrsKPF00KMeAzeiA2qY8QPNlfh0rDp47Hd9rd+MBLb4encQ5?=
 =?us-ascii?Q?4EjErMBarYQB041ejxxa1bIgYZe5z2ISWsqhY+QUqrWgr3GYTQq22DzCtFBX?=
 =?us-ascii?Q?iaTfK3j9m3kq/O2ViDCEowE/YoKw0RkBmgjSnrg3A/+4I97VzbUL+e1ldxwe?=
 =?us-ascii?Q?Ntfb2Dvk/yFPZ7LwcoyGevcBrySQNj+l1Lzy85HJBdg1cnSsOyPiwevzh4tJ?=
 =?us-ascii?Q?mN3+TsuRQlG2K9vPs/evTqRl9zh6ZyygwJPtvw1hxOsbwjc7aWGnpZHYHrtg?=
 =?us-ascii?Q?Fn82ufJq3xMxsCVWdn9jkz6yCwq75lTf02lrlzuiLsKcEQ2Es/TZqO5D7G98?=
 =?us-ascii?Q?9okvZPwsj1wtM/YGCANHnO092LXBQ6KEK2ElY5vF3YA62BRPga+6mrsaa+4e?=
 =?us-ascii?Q?33oMQaoiYtVSOqBAWbe8ol+XhVb2+41BSWYUBHTvsBT5uaYUev+kIAkchkuJ?=
 =?us-ascii?Q?yEF8eZVRPVEZ9Dt6vlv49zNEN/hFOlSUYaYEC5JmkBiv+Dx64/rD6lGhVKc8?=
 =?us-ascii?Q?PIPZXQ0CInNHFzOpdXvbPs84ojNaSoXssYzBbOmXQWqOqzp6phn3dbSrhdRf?=
 =?us-ascii?Q?glYp8FwE5P0dDhG9FEuWr7fx+C6x1xJWvj8P9hWvdjSCYqAbY4usQdjDE/J9?=
 =?us-ascii?Q?HLieOTOkjN6j9AKSHrpFUJv72Qbx1iaIsKIK+RZKTvI78T2mj+kyFHQ/WeOd?=
 =?us-ascii?Q?U4tzWdYQ1lUBI10WKdEpvjPfccWzD3KEtY8L6gIhR5ZjvxyGnLINBJA5CAuv?=
 =?us-ascii?Q?NNkXkeAmvemrsDQDf8MdgU6JA+LB85DRi8ZJigY9wWbWA5KJqJZQN9i3MpvO?=
 =?us-ascii?Q?X2ImJf3K284T//gnjMHVpkRb4rXLztj9wR5Jjot0KSiXhm0qD09E0Sk2ik0C?=
 =?us-ascii?Q?DdEU8FehXjjJjLvlfQPtTz2WW5pSrtJjd2glOiNpv3KXin1qxCdDQ3BYe9YF?=
 =?us-ascii?Q?WoDoyeknxo52YialiFAOG8nOVac/wtz5K7L9Goii8t3nEsvRoyWT9EG47THU?=
 =?us-ascii?Q?stCQYWofRN9UXRfu5dKcNnByCF67gKogRDIP5HAsAgc5YM2P/lPePaXH2FNZ?=
 =?us-ascii?Q?SugGXNh2MwG9KN/SBjWZx6zt6S1hhXMmlnAyx0j6/jP44YGPuNppX71RFIOB?=
 =?us-ascii?Q?TVmVzFV6AArvfIxc8iAmVkljoGOwxdrI9Unuc+ocsdq7PBtHFsXE4eclrUG8?=
 =?us-ascii?Q?MK4uDz8LyWVUEkJxLe0938UFj8LQ2GSc99l8OILt285PtMQm0XB+d20QcVEG?=
 =?us-ascii?Q?G4XWcI4YKHO/d+gd2XZpLhISXjKvrr7j2j2fPg1DKN9nAFtTt0q5MbqXgpzc?=
 =?us-ascii?Q?KPeqLY5vvPVQinCwpWIKRDi8Lu6FPlX5zstN1gRwQmMhBQQ+4F83ii+vYLi/?=
 =?us-ascii?Q?7jClXFMZcjS0+PhiwHsV4iOW1oS3bouiWpeZZmLMF54KCTfs+mki2XSbcWMP?=
 =?us-ascii?Q?8ZW/K0q2WZddJG/qxI/98ygrjIdglTqSeREY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(38350700014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lE9Eef9cAaIrL1I9BWOlEAIlzk7s2bCTRrJ1uLci9vwNqO7SdKbu3aA8AWl5?=
 =?us-ascii?Q?zxtEKFlLGb2/MIazrsD8sSPXsUQeh3rtILAe8OlBtybEnyv36n0wFltL7azJ?=
 =?us-ascii?Q?oKu6o+LeGkl9AFjXtbeXQZbCKe7B5xlUPBr/YDsHr5kSiw1dTOsCAKkD1E+D?=
 =?us-ascii?Q?ikGWgXwnFOkpM+5mD6SdRP2rEIhAXLNbpUntcXGJ/NCGjJe372sSDFUxEYPS?=
 =?us-ascii?Q?CijnUo6kLh0ZuMkA8RTG7WRv+aUks65DitZpuV20sVYz+N62w/uNE7GxAAep?=
 =?us-ascii?Q?ukj9nbgITv3lZtgN0evkvjy9Y33F0lmLoXU1GecVoDgcUGBd64BEAbgvmfgl?=
 =?us-ascii?Q?zUeyjj8hm3XLZNbJV4ykqwd+KrKT6jpMt/cyWAEmwoyISZ/R+exz3IXgI7Cu?=
 =?us-ascii?Q?ZtlIwB/DnOTfAAQIpl6TDnXF+Ez+3z7rlobWhjlMssZNiX23+x2nkF3+tBlP?=
 =?us-ascii?Q?eIqjyjCwwdBAjZ/y9HcRrTAx9xl7gnmrkFjnZroTCrH0ecMpHlGBpHJS/m8g?=
 =?us-ascii?Q?lA2P0+4CA9vbb9brBA0weuT1a5bRrAvBRVjU0JajQcWuIhRo24feF0Trk5ad?=
 =?us-ascii?Q?yrwacN+UgSODXZmoUR6Z9ts8FsXVh5kbzNtsJRjEpbEPzNojh1RRQ4yilSfT?=
 =?us-ascii?Q?ALxq4trhIib0Ex2GYzQm+aCzfYXhI0otJJb04aWCyoFcihN4SLBy3mzpOqLa?=
 =?us-ascii?Q?BWFgnTi2LkV/x9Xr1wz0QX7G6FVylm6w0AFHDAfvTIlXMxIqIEmMBOEI/X62?=
 =?us-ascii?Q?BsCsKl5NWU0CMMS4EC/GWuGQ4bPQHB93KbxkBdXMm9+ZdVdfv+FVormlYDQu?=
 =?us-ascii?Q?o0C0ZS2wDSUHs/DbW9DuHg2QlGAKXxswbC10rHq/O7Df54JY/uHqIzFE4Vho?=
 =?us-ascii?Q?w2Qxgcb+LBOo+Jc9kMSt5zFOfbuIydWrmig4qVF0sDRpCbObSDPkdH1gTsx8?=
 =?us-ascii?Q?13ZHcdLf+F1c4xttbRhKJ5ZrCdFIxupmnQ4nHNTZwleJXlKnW0KyZtgt++1h?=
 =?us-ascii?Q?sdFoS36/N6ka03usuzyLwrMtTsJwM1WHF1Q0OIKlmTuL135/FVmI1O5vJumu?=
 =?us-ascii?Q?5hYvfPhE5hJZo85diyZTRnqQdXh6u3tBtfwSoiW8zivcMZJuG3z3U9weAFqf?=
 =?us-ascii?Q?Rl6HAJ2U69jZWs7RZaYT4TP2B2ch7VguNVS82upDWyWwci66c1UAsbx68HRb?=
 =?us-ascii?Q?FWstTZj02/+Ck6j0n9r1Dco2xoaNZ72GJtZwAqCS3bkTptjaEqKW2+mBcBze?=
 =?us-ascii?Q?OUElsSqUM9JX8OUrgzfqOSHZ33mK103Q8lcKUYdddHxMimwRvKbRYpQpiBHd?=
 =?us-ascii?Q?EtTsS60S7c0vjn8Rps3XgL+6XYqyJR4hmLtSk+EFO7ebe8zZxpbtVcxCS8FI?=
 =?us-ascii?Q?0NV4jiE7iiHyS3s0dE4o8DpBIFs+h/Q4x9qPvMHOOOxkl051i+g/5yd5Myqy?=
 =?us-ascii?Q?Gpr2CEQl0Xn9mBNYcGzbCDZ7Pb5ummxcRnwN3Qxe4B8OCXJtfTGuwsilJDjZ?=
 =?us-ascii?Q?L4aTWmxklPytN5dsi0chjtkQ72RC38vzEf2eds03Bp1BPj4ZqpxKuC1knNFE?=
 =?us-ascii?Q?xeimuwRHGdmYPWzw5pnSvG/24i69tB0j3HpQW5Aw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc192997-d4d2-4145-1c65-08de17255559
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:57:04.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBH9mm9mqG1OwMkw4dbxh8v1L8O++BcSYyEx1oVI5+5z+QstWrRxBdILzNBoB5EtRyF0pk5atGghH0ulH4C60w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11687

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v4:
 - add a documentation to describe the tranport protocol per Andrew's
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

Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Shenwei Wang (5):
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
  docs: admin-guide: gpio: rpmsg: gpio over rpmsg bus
  gpio: imx-rpmsg: add imx-rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 Documentation/admin-guide/gpio/gpio-rpmsg.rst | 202 ++++++++
 Documentation/admin-guide/gpio/index.rst      |   1 +
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c                 | 467 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                | 146 ++++++
 include/linux/rpmsg/imx_rpmsg.h               |  48 ++
 9 files changed, 1032 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
 create mode 100644 include/linux/rpmsg/imx_rpmsg.h

--
2.43.0



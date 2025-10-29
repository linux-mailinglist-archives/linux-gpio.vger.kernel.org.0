Return-Path: <linux-gpio+bounces-27853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 631DCC1D1A7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 20:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A2764E2AC0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 19:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4810A363BA8;
	Wed, 29 Oct 2025 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mv52QwG7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2498363BA1;
	Wed, 29 Oct 2025 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767846; cv=fail; b=l1WexnR8kMoXt9Os7c0AEMXlIRRfSj2ahUnh5fC71kQ+ts/Bcds3qhxYDjyYCZVzjCuz44+7kgQL803q0J/IT80jBxsmHCpUK+l4pKbUTc5fkgm+XFAd949Pf+W9dZjIgtoulJa5qftw4ah+Duq9hDDW3gxrFPaOg35unT3bpec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767846; c=relaxed/simple;
	bh=UNi7HHI5rQxI8HjrbOsEyXUNHDDSWGdX2djSQqHJ0ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c0Npf8JYVKs31JGmMKGfTJ+SkBUBk2BycRxaSO5WOYFKl2w0/g6cSl7uBCgp5isoLr6gi0Sb0+f5/DdKBp+cb712fiTkcOogG6eDbfnrAmeVWdHErD9tU9ovzAIzlh/X6Q0V1hTEuq47DpmAxYilM1tgBC964bwbn7Tuy1hBvqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mv52QwG7; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPpNUwINGySYr1wpSqw2NolR/++WDU3DMFOcWPQQ+Z79zaBFZZ2L4wDjoPLW/FCbHa3aEaNz1hqYkhhNGgcahPd+cmLISUSfHq1ggnCwPiP6CSpKYlx0RnMICDwQ8CnbNHfjS8noV5tr8yupzFp7C9A6qc98bRsdIULClWxaqnH1Uduy5u8ZubOjRxb7UFfhxV+MTtO2gvx8DmF9nR6Ar3WxbUYYsDWEIoc0uCijxZ5XN4HYVJlzPL/mA/3pBuTY+rs2KkgJyygJpNSgu142d3WQhijCG6m8gMsfnnr8rBkXXsUFq+fcFUqJu0zxyWeofa2q1lofnbaheHV4K48I2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF/T7ikMCCFrlyU1pQF80Le6T0WU8SYoTNbYkLQs5hg=;
 b=c9SlOkeKkr8dcpjIzg86Dp9CIvwNBIVFPyc+HFJ7o+e4xiwX0iPkzSs+0sRKfYQHpbk8xO0fh3BTH89ZwbM6ehTB5EFxKPiIEK1oN/p15StQ/Snswb9NUmpKLw/2rxLNBt3YaT6s6T1/kuBb9z+XlPoEi89/FthM/fcc68oWMLJEOEBCe45UX1xCLCH9E0ZseM6Dsx1L7BE7dugvb4wrrta9mdzdNOjaQtXRRhD5XuGL3qv8ePbNs7OjLmcsGh2HIe8KzlRSRmgT84szi6UZ/CELUuWXoQ32Oh/EcGi/+wyIaWtLoeIXv//8Ut3UcC+eA2RlWjUflywn1v08AXiq7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CF/T7ikMCCFrlyU1pQF80Le6T0WU8SYoTNbYkLQs5hg=;
 b=Mv52QwG7vQTD0z88WqXYolbLr4sbzl/iEBcuohxWAZ7A5B0ScYYptHKV/NzIdpyOqc14TJ2LamPjoCFYeL8uemva+WLf65B1sgrPWJNJTLpgcm/anKjZHJj4bGFXtPNVTs1E8n9EdhIGf/TTq9gll0hkELFj+Te3zPiGJpL2wyKmmhHKvYRpuWTtjKk5RiRUbxFECvsU+6KIcsAkUkA7E7XzZWYvaamar4B6UcqTU1jYLmBE+3R1HjG0QYCo44UQlrEqSZ3k7RwT3DJMUbXRGYXzAxf1lZwqXoLNNHTys7TrYs5yzvAjur4EQkfMS2XwsYxrdlUfat/xlJw0vTeaSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB11687.eurprd04.prod.outlook.com (2603:10a6:150:2a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 19:57:21 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 19:57:21 +0000
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
Subject: [PATCH v4 3/5] docs: admin-guide: gpio: rpmsg: gpio over rpmsg bus
Date: Wed, 29 Oct 2025 14:56:17 -0500
Message-ID: <20251029195619.152869-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029195619.152869-1-shenwei.wang@nxp.com>
References: <20251029195619.152869-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV2PR04MB11687:EE_
X-MS-Office365-Filtering-Correlation-Id: d57e075b-d83a-464d-6769-08de17255f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VLFDOsF85gYfgRQ8D8e9uHvVY+ffhC+gt+agL2e/j+Wo1KEK1+7xRmAUic/I?=
 =?us-ascii?Q?hLyiOyBzPCQ2MnvD/2p71YBlIqmWTIgyFyIV5sQOTnzgTBZaUTh4JT1oza5v?=
 =?us-ascii?Q?taJhAf+NsDmyoGupbjJlg98Icir/+HRmVVfFpbJgKqEaEJLEFPTzL26ycxET?=
 =?us-ascii?Q?WEn0fj4fhc/CekkPS31EVKUXpNa1up0pPdX6vrmQu/qgVISmAJBS91RueUJw?=
 =?us-ascii?Q?T7MkG6bdrJavyOfFHKyx0gO4dKemLgfA4EX/Q1qTbdEoyRT0TM5cIRnUkT4k?=
 =?us-ascii?Q?q9zA/ZcFcMoZZ/2hoR4Y5CGqhSxWsTrTBqU7PHIwmmfkLVrmGsldHoG/y1yh?=
 =?us-ascii?Q?JWqV2y4oYjIOJjclGXfw7j3YSRgkS4b+dV7ViCFARPzbXSuFD02T2wAZJGDJ?=
 =?us-ascii?Q?zQkN6mtEF4kkfAZ2AlcWp+x6xxb0SlO4Iz2ri43/G6jDDyK5tb73mWxPhMnh?=
 =?us-ascii?Q?+1+wUva1WleB+pXBaAh7jcE5nHNqVnFEIiQ8P0zfw4RHKzZxJIFvp+RQctqd?=
 =?us-ascii?Q?bPKZnTrC5/sN8CFMq6FwfvgCy2v2RlSDKA0EeFKwyJpdoYvoXd9BqbVL6LgU?=
 =?us-ascii?Q?5aK6dkPPj8mu4jctlawhFlf0WJF1TEQUmhH3f5Ysm9xauINTpVGrs0Xskvd/?=
 =?us-ascii?Q?0wZcMZXcynS/ljRfnmygyTsbH43zHQXldKah5qJWxOn8iLLItRQsdnIYXP0N?=
 =?us-ascii?Q?MYXm/jZ+m+fwHlexf2dPXR9mP1SVp1Kg+b6C/XmzARZrKiqhsU9WVNnwkjPw?=
 =?us-ascii?Q?lQkIBOOcvW7CBGjzT26Sr6rY7lkL7ldNG/CDMC+e9QO0Dk5cRQiW00SRRADy?=
 =?us-ascii?Q?tzpFU0SR4YbvMt22lxG4MldLHAnkiSpq331FGb+R3WRHPRI1k0PvYHoUEJry?=
 =?us-ascii?Q?7Es4RxIre2+Opx4K63VhBSZ3Q+xIvR4oGSIG3SYs2821p7weQ83Ou8HEKcI+?=
 =?us-ascii?Q?I8poZBSnQkKF4Gy4Hdsxv2TYH01vkNxQdBu1mmA88ESFhLg1wUcN/MyCY8ax?=
 =?us-ascii?Q?Ilo6ykjhLvINpMh5gTNyWkV2uKpe9TWMBR/+vR0wp8t0M0OYSL3vIOVjsAzX?=
 =?us-ascii?Q?HB/pPeEASPR8IM+0XPg2zhT/dD1U5ryDC+IOJ8Z5kfeIGj5C/nNSnAqM2KlP?=
 =?us-ascii?Q?GefILIropqnu7wIuQccNrPY0Rzc7paNeBZR8N/ZCPY8aj288i/OezRIWRnJz?=
 =?us-ascii?Q?f/TPQKmUB1iqloEQ+xugNvRdLxzKYt1cof2pu1HvnuL08NXhb//xbImLuURP?=
 =?us-ascii?Q?qNk/2JoJnr65LtGuoeAlIUJf9TwoAS3Y0CNNI/RySMdR2tgoHi6tVrxllVhC?=
 =?us-ascii?Q?5H309Leihq+uPKYllo6BmM5RO0MsClWP3HocabsaHyrCsNZgfVolAsIT1ny/?=
 =?us-ascii?Q?qCJGHkFd639+xrazfm9P9xJCxR1LhuqHMtyXKOyDANEJDjkzwKtPxbGC7UTa?=
 =?us-ascii?Q?dMXVgRPSu9ePf8nZex/BLvvq+8CUnAK4ieX1uiRHWfOkeppoBmkEOxyIVBSF?=
 =?us-ascii?Q?n9dkqGUITukiZnpeELZXrmG6Qmss5Hq415GTqF7vsG9oy7NLVUp2vt6Jug?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LnSpXKI7wv4fZLKuE0CVA1bW1dp4/wy9kDjkGua0U+fwEiNeZy53p2AnuFfh?=
 =?us-ascii?Q?Bv10YInz/WYfTgO9HrLdt03YEwQRAhy3j7EuKAdL7Tw0FpN69+cyD75+tsVi?=
 =?us-ascii?Q?wBViiTr+xmGTQ+xF0pgNxI8nIbXmqHNZHIhGY2Nvi6kadUN1zixro+rdi35R?=
 =?us-ascii?Q?XSNMlhVFrc5l35zqw0CG6VT5RnXbQVDlK1c29fa5s0N/6YTdEs0j3MN/Nujb?=
 =?us-ascii?Q?N4ptwEAbWMq25/HpNsN2TT0FGUz3et4np7sn9g5vvUNYl1rFY15PQpTtsvJ3?=
 =?us-ascii?Q?S+UWm+efFjqCbiTjT4VOLDlBNBW0oBEUiGq/iBCJauaULJjvahdpS7CnKpf8?=
 =?us-ascii?Q?Z+0bKBmkrggY4dnmXRYr1F2/pVzUBHCCv/2slk6dFH5c1uQYuAcKPzxMFFOw?=
 =?us-ascii?Q?fuMW57/Rp0J30AZ7Lx7R6qtPr7iKB+FiYIc9CTtk/KFBfgG9LPfUKmWauwYG?=
 =?us-ascii?Q?ARIgC1hQNKemcS+KwZ2mFparRp83UBb8QTao9qT3C7b6pQuQnXuK9MNDmwnE?=
 =?us-ascii?Q?j4NLpZthxJHu4x5VzLnmJyruVUiL0J/QbLJt/Qhu8BynSv37wPVSG8eFc7Bz?=
 =?us-ascii?Q?jGDMI4YMcV6DeqbxfOaElK0Vheym8B+V5lBD1ZzOfsI3yON4sJgHvC1TEkMr?=
 =?us-ascii?Q?xrER8fxRY13HWQQaBPTf9qPl4yjHDNLxEbL/UoJ20kJsQel54qeJwA3Hum29?=
 =?us-ascii?Q?XKPKa+/WWX/ZN21WyMUUpggNlVhLt7+C69Rl2f8wqpNfPb/BjD/7dAdjiSHb?=
 =?us-ascii?Q?Brk+LPgXgtk8ymDDPELSVFz9t/ECxnT1Og6XhhFk6Z4fFEpwTsE50Qtz6bk9?=
 =?us-ascii?Q?Lk+kbtsxXLOE3bVqRPdjeAf8vHG32r0bv7tbKB6jcXsmTlntPruebgv8KCkS?=
 =?us-ascii?Q?eNK/Lp2nu5psuEYWz2XXgoBRc8DpWL70/J9kGrvJyvdC14R+S/BFcfqvbS1U?=
 =?us-ascii?Q?SGm+ZikgTsLZzwaFztoZucV2E9nfs8OPQ9VfbPS0PIo7EXB3DhMFXMYCEeqg?=
 =?us-ascii?Q?nebI21U7qD+hRYL2GNMV6fnEPySxgVp5UlHnmXFXX//oyKEs6H3eLi4Z31dH?=
 =?us-ascii?Q?Elh9v1/9T2SA0eix6fS6KZJC8rjf+5C6jiBkRrVU3TZGmywPm+FC9BVa9t2A?=
 =?us-ascii?Q?J8INcEalgUX6Lqu36KKe433EUI2YYI2whUqZQ1Pn2dkazdRPPek0+JDd9ma6?=
 =?us-ascii?Q?APJegLxZ+yZa19lLiWYakSrQFpL8PR7AYnFITu2iFFV3QCk3WzVrStf5+0hS?=
 =?us-ascii?Q?P9Tq2fVC6SGKKaFLpMNtzCniS31/qh1ObqNIoVp6fbFAFxN0tHwfgH8lL8Ob?=
 =?us-ascii?Q?E+/9MBMXg7Z6qQxAhNkfCZNOIZMu/GpxndT3Oy4V082oMW8pXkgYf1GbEsKg?=
 =?us-ascii?Q?K76AyFx2fF+j3NzGQmjsi/ixvtbonPqnmRm9wNeKiakAZkNmO/EwOEgGsb/m?=
 =?us-ascii?Q?XHKJwAuafN2MGT9GtHGAT4RtPsXKuWdsvB8TrdUdmt4hTDuNvZL0Y3PlM+Ts?=
 =?us-ascii?Q?+qGuwEMyvaP7ZiMBGEsvppfxDDq4/CRZS3G91squk9hGgC6S5uqI9YFHN5EN?=
 =?us-ascii?Q?3j/8myEmF95XdoEnxFxXa079st1RjPH1Xsnxm6Jq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57e075b-d83a-464d-6769-08de17255f24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:57:21.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laoFyOO0Hnjscg+HwTmDTg6ns7XdkbLRHjuZzaFeOU2GECIz2c/0dK+vnnnjZ8yLjCMZAKCjwHN97z/hsoY59Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11687

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the cores.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/admin-guide/gpio/gpio-rpmsg.rst | 202 ++++++++++++++++++
 Documentation/admin-guide/gpio/index.rst      |   1 +
 2 files changed, 203 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-rpmsg.rst

diff --git a/Documentation/admin-guide/gpio/gpio-rpmsg.rst b/Documentation/admin-guide/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..ad6207a3093f
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-rpmsg.rst
@@ -0,0 +1,202 @@
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
+The RPMSG message consists of a 14-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+------+------+-----+-----+------------+-----+-----+-----+----+
+   |0x00 |0x01  |0x02  |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
+   |cate |major |minor |type |cmd  |reserved[5] |line |port |  data    |
+   +-----+------+------+-----+-----+------------+-----+-----+-----+----+
+
+- **Cate (Category field)**: Indicates the category of the message, such as GPIO, I2C, PMIC, AUDIO, etc.
+
+  Defined categories:
+
+  - 1: RPMSG_LIFECYCLE
+  - 2: RPMSG_PMIC
+  - 3: RPMSG_AUDIO
+  - 4: RPMSG_KEY
+  - 5: RPMSG_GPIO
+  - 6: RPMSG_RTC
+  - 7: RPMSG_SENSOR
+  - 8: RPMSG_AUTO
+  - 9: RPMSG_CATEGORY
+  - A: RPMSG_PWM
+  - B: RPMSG_UART
+
+- **Major**: Major version number.
+
+- **Minor**: Minor version number.
+
+- **Type (Message Type)**: For the GPIO category, can be one of:
+
+  - 0: GPIO_RPMSG_SETUP
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
+
+- **reserved[5]**: Reserved bytes.
+
+- **line**: The GPIO line index.
+
+- **port**: The GPIO controller index.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
+
+GPIO_RPMSG_INPUT_INIT (Cmd=0)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Interrupt trigger type.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: Low level trigger
+  - 5: High level trigger
+
+- **wk**: Wakeup enable.
+
+  - 0: Disable wakeup from GPIO
+  - 1: Enable wakeup from GPIO
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (early remote software only returns this unclassified error)
+  - 2: Not supported
+  - 3: Resource not available
+  - 4: Resource busy
+  - 5: Parameter error
+
+GPIO_RPMSG_OUTPUT_INIT (Cmd=1)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+GPIO_RPMSG_INPUT_GET (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 2   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 2   |  0        |line |port | err |level|
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **level**: Input level.
+
+  - 0: Low
+  - 1: High
+
+GPIO_RPMSG_GET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 3   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 3   |  0        |line |port | err | dir |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: Output
+  - 1: Input
+
+Notification Message
+--------------------
+
+Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line index.
+- **port**: The GPIO controller index.
+
diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
index 712f379731cb..9c8f4441038a 100644
--- a/Documentation/admin-guide/gpio/index.rst
+++ b/Documentation/admin-guide/gpio/index.rst
@@ -9,6 +9,7 @@ GPIO
 
     Character Device Userspace API <../../userspace-api/gpio/chardev>
     gpio-aggregator
+    gpio-rpmsg
     gpio-sim
     gpio-virtuser
     Obsolete APIs <obsolete>
-- 
2.43.0



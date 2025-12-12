Return-Path: <linux-gpio+bounces-29514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B15CB9AD3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 20:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB5BD30B2461
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 19:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876A732825E;
	Fri, 12 Dec 2025 19:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KZiMQafm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013026.outbound.protection.outlook.com [40.107.162.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F48328243;
	Fri, 12 Dec 2025 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765568714; cv=fail; b=SdhcHlqIrSIvlT7DtH65KpJFMYLS66Fm3PSa2fbbYcvO+iVNhPljVQh2mhXOSBiI4V7hF1hgMj0BGiVyJJQy3IL4S5/J4ska+AkFb6DylyhI016Uq5WFkQt8XOO+1WWzapdCqvWXHaj1Ze8jdxBXvZxvftzBlRULOUeEv38krTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765568714; c=relaxed/simple;
	bh=wQlEUiIvqgG35rC5vHkIHsE7rdasE/80DIjNZWz1FOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nEatJ5nvx3JI0IcMc1UxQPpuBqD8TNU/qjcT/6MkzUuwSN3DIfVDOkIviMS0kMHpiiWecfSCMczE4K6KqOaffOpkTv1XoNjvAvICqzrCf+BBDXmZO4FHMYXyKmf+eX1WIHjlf2JvpVrGs3U7LzVrX3Y/tacTdvnzYB2hxul5Gv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KZiMQafm; arc=fail smtp.client-ip=40.107.162.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX94QVg64QW5jqh67gQ1dWb1xT6xX91MfjnCBwrMnHKD8ylc1eb9zIa5G95ZwjqtfJ25LoWisALDmjZpuUCJfHttqofzyvhQG8UIKLKPORgG+oJokgzuQISjrcA4yMviNA8Bp2760OhsWUVOxHSB1Pdb2IxD6CR8RiCU0c+bBN7SfsObyYPPhTWc8nB0g2jA5IruhvCco2TGHXnicnR+zqQa/gnZ2tl42+5Cd3HTsZupn0RoAcUtAVClKPelOh1iQN02S8DsQWeTQXdlKPRPnQj5lJulwnJC+lV0eBSqt+8YUDWN2ihIRUvTwVGcsLZxwPOoegYYutT9yn0gJ8KTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vx0nd+mqdWdKfxcr33bN2UywZKhcGJcK2IQdeXx6Fb4=;
 b=PblGEc2zha4VzkKcIJQQ9YDpPpTkukAOxycQ/xD+WZ3VQErHVa5whINHEN5m8323j9IiF+W4XMFKBWYCgFWSRWFNO4w1uVT0UBVCsnjT1Eu7+7g49XKO7OwHfgqCZde4o/Og4l2Cjk3C0EIEYCk7l1zTqLneoidQXLfqX2XvMNJ2VOkHEFU5WaHw1d8hBsLD5tb5Xl7dfkwcbD/XJa/Q3mQhvyGz6xBdh3h6engVYq3vyT589cq7nOau42KmVBpVhDaPVcmZuFy+8HIPr09qZa3eJhJY0KwxwKM0hnKfRJIs/eLkZytFqzKmOfZrV26lm/vUGSi65U/QeXWrzrNiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx0nd+mqdWdKfxcr33bN2UywZKhcGJcK2IQdeXx6Fb4=;
 b=KZiMQafmmpm0k3o7kiCNpH9Tztm3oHR6hxtUOWmRnAJyED/y5nP6EYtCtA+rlf5hu+n2SBe+BnvUmwqXKHbHhYlFWq2JQadvJfsoujGCne7sRWimX803pYmv7yd72g09qyNdrrtZMnsTqg4UznCUXuZ7LluLybdFEsv9KBRr2kbGE6IIMy7i4XpUooQsXHDesY4Xxs8hUj0QP58feHtFdvikiklUs8eL+PKM+oxdBVXBA3Bv5BfgoB/92Y0+rMq6cGXVT07G7+vEPd7lOKVCj7fQ8UlloKXT+7Q4SlPm3VTsy4cJ4vN6AUd1ecY3dmv+PnWc39HUDjH0AlL1P35uZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 19:45:09 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 19:45:09 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH v6 3/5] docs: driver-api: gpio: generic gpio driver over rpmsg bus
Date: Fri, 12 Dec 2025 13:43:39 -0600
Message-ID: <20251212194341.966387-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212194341.966387-1-shenwei.wang@nxp.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 75df9858-82a8-4421-7d04-08de39b6f465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DUzgarz350Iiw/CQf2IUX3qyh4ZKkpBf/deJTO/a6VYo7ead5r+LlU8Nasbh?=
 =?us-ascii?Q?aGOfOdxKN7xxHFa1Aqhfbn5LJ0PEoX9v/zCoonEX3gKeSwUaiHLGQ+YgmfVc?=
 =?us-ascii?Q?2SbuDYje85tUOLu45H6w91goXbxrqXJ/hsLbJiRLaOVPtbBMISxnjN9eXVFd?=
 =?us-ascii?Q?M/C7v4KxMNNU0s9j3x0jEF/2c1l6e+gmmfEIF2M6wgytAOajfLy+xchdyOdh?=
 =?us-ascii?Q?i1cpPKF2ajfh/XruAU0jOvOxngWiC/AQHck3Cc2N8hGWThzVRoJIZxiUAOPO?=
 =?us-ascii?Q?YmMlgpv/SE8FvuQSRkXZiJMH4MPH2qtmuKiWYhxZ7paKWzQoEujGVEDlpg5x?=
 =?us-ascii?Q?Uiq9m980vREY9XvVJcksKb3rrNvpV/5HzGcFDlDounsLp0G7j9f/Uv7fx0WY?=
 =?us-ascii?Q?rpLex4n0jaZPUXZttXzvBVayOEloV3SUIvDClFhOj3r2DZqUSkiUsOW32p0A?=
 =?us-ascii?Q?9i+g7FUR5XBRSx2CAAwA7VJZ9nyUpkupzvVJvA9bBBt0WmozLvbEqi0v85JR?=
 =?us-ascii?Q?VypuDzzAS5Q31wENW8JaQ6+n0vrqgch81v5uGz2AAPLmjIrp3ls9qfbbLY7u?=
 =?us-ascii?Q?AymNYOHeezAM1k6NszKfso1BOiw2Fx3u4OjMzUnhnMWg0xyQXiTE1dj24SPV?=
 =?us-ascii?Q?eGOLUelSBXosInlJCdLEspxtH1WxGLvNmbJdOMAPJiA4nXg7OVOiYs1iJGvd?=
 =?us-ascii?Q?h0YHu+CuklJmrANxd6sHlvqPm1ag/ULZU0nVTQFEUA2mfi7VZ3XnOTO0LGkD?=
 =?us-ascii?Q?tTsFrPEJkNDtRrf36NiP0l27o++QTPJPx1lskgOl7FVdv3h0CG8G30JhmYGi?=
 =?us-ascii?Q?JYfclqVDBmqQSzKuVb1/Cru2OvATsbscuaOLQBHmiF7jlFmdddPyYYj3ssby?=
 =?us-ascii?Q?X6F5ioHF0paOLimAEwA4eI/Md4a7oGg+K9vIonB4V/GRAQ/WIDzCXLxqRbAp?=
 =?us-ascii?Q?+XkigPuGvey73IZULcAwv8zA0D092688P8kl7ApUKzOgY+8GWb1C+gSygxAw?=
 =?us-ascii?Q?n2aO1Wl0IwDRlP+Wu0ysWfIsFArrfowbcJevAfRPCBLxgWaZ4N30XsslmBP8?=
 =?us-ascii?Q?/tKZNNY5SlIFIgIWzpH5BJGpWpamnnMXCiw5fCJV6eFlrbfHNt/MB24+JFAX?=
 =?us-ascii?Q?r8c+nm6d3B/xm5oRkDRqXO5LP8Rpp0OV8kA7iSQwWEtY/vAj6bb6p+JOz02I?=
 =?us-ascii?Q?/URw2pUVKswoviKGVEOShEGp+DoQab2B3JKjBZkzvA8z7DfMPmgC+xqcqQtj?=
 =?us-ascii?Q?djsU/emOA02o3rV73c5U0ebA3VzIiDlmPvSczs7v1+9rYHSsti4CG4tvocyw?=
 =?us-ascii?Q?P/OKtAbg2zgYDE/KStr+FSYLugoOZV7wPhkuEVUIGDY569rk1BX3d0aZmxuh?=
 =?us-ascii?Q?XJoatt7ahtXnTAVl+L3Fls0tqWWU61jbJkvwq3NHadcWuzmbLgEJUtccdckt?=
 =?us-ascii?Q?tlxO1gCrFlAmxrF2cUSBa3R65CU4KCerMUG2Q/No643MTIaSD3yK4sH2oO97?=
 =?us-ascii?Q?+PEzcXv0jJC6wYzaMYU835nGQxcA/0nJv/jCIju8l6CUubbO3MDqwJOstQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U6oC3coT5FqLyGJ/kaEVEGfx42hHMwMII/uKrmTp7AjM5dnaLxgxRTP/TTpj?=
 =?us-ascii?Q?mW4cgiBl/PUefvVocxaT+Mat4ndmhZ/JvV10qhm8+vydOD4kxRf2xbd3q0zL?=
 =?us-ascii?Q?4gvNUn/97AVc45jQARxUGjrYHLAFzR5/GYUAEPfBIoZNqHJW8bjtXq8ner08?=
 =?us-ascii?Q?48Z/GAb2goV21Sh8t1OMQcdX0goY6/GKSAm9oECf1zTZWCsbwKhaUJgbtKUm?=
 =?us-ascii?Q?d7IsKGoDQJX1xs4t/oqyP3ILDxzTWFt/7rMVtqEHxIkZmpwuHvLhWNPcmH3v?=
 =?us-ascii?Q?PApYySHUXB/g4vKcz2osBJcV0uXWqNiBRc33ppiSZ9pLJbYXMB9eTRvzbZdS?=
 =?us-ascii?Q?ZLAzWKm+imUxQqt22dK9dfVhM+yh2as68MaACwGFQWZLenAK5nuJdAUC2Jtu?=
 =?us-ascii?Q?h9QSe0NGDnfeqNdQUNasG/y4DCf4qyc3j88OI4Xnmvd/wsXQne6bExDKD35k?=
 =?us-ascii?Q?nQS52oTM8bVjLgDpJTgbWoWyeBMXYIgJqGhLAluj4ANK/EQe3zp7v++YvBtM?=
 =?us-ascii?Q?0HvRDHMnBGZ5ujLRVeqLHDe9PKT/l6lYH9GlaRJMCIQkgam4htPdFyYkxQSU?=
 =?us-ascii?Q?dMAplQjr0i5UNFZSwkZzZk+ym2ik1ZWDJYw/ZFykbZyOAfQOrGiGCZAE6ZrJ?=
 =?us-ascii?Q?OGVCWoK0vTUo/iGlYgSpUevuAUWq/K5NPMvaIeICviScRmkfNoPk8C9wFPqE?=
 =?us-ascii?Q?G+VrHGCbxjAzhP7hI+qUMJf6AGAUyCoXLojA5DRFO6gutcDXO0E5qps0vSWz?=
 =?us-ascii?Q?Yn1y7LJUxyEKbG7nvsw4cidwDFTfbnpCybvK8S+iG4Cky19R3LIXSjF9QsSz?=
 =?us-ascii?Q?SAGR732S7+Tfb5kZtHNHm/QzPCrHbBjQOb6b52EXQWScF7qTU8gryewApC+N?=
 =?us-ascii?Q?EdZkn1k1Z/eRjhf40dStGW3zKiuTWcxISC9RJlVEwp6eDCCB8Of06cMdXr+Z?=
 =?us-ascii?Q?LrN9omDlQhXFG2rGbWWYvE8MNbhdbvZx78hMOlMjNoRp0HF8BJfNmUB7cl+P?=
 =?us-ascii?Q?RGXHzdyQ1E1bhzl6mTIeCz6yVyydvkyehizlG+N2njI5V1DqCsohQa5cwHDt?=
 =?us-ascii?Q?qlbVzrgs03S16X6gQ60jSpQfudUhua/3eDEHFzwPKPzmrMqyTacOdSJRAl8K?=
 =?us-ascii?Q?ZYpJ95767E6BdYD6K5eSw0FMfYEdZDbZcvmobJvsBpHsc1AePgQ9vq3NDR2k?=
 =?us-ascii?Q?h1434wgV2iSiTS5BjXPmj8LU/+hI+kIoc6s82buoEX1RXJbc4OrOtmg2CVoP?=
 =?us-ascii?Q?c9svmB6bTJD93h1D6PdMPw4RXxnuJ6ybePLag3J8YUS+o3DreYYtczXhQ3/u?=
 =?us-ascii?Q?lSXjJhTmRyvWOun9nV3tOJFNMyPPjz/pNbFx8URQ8m+uZfxCfw2zqDJR0VG/?=
 =?us-ascii?Q?4a5VTkHWd+XndFJY7OwAjPOmtlxM5aTW4FAiM+Ysy/DVwg7jbEpzsfuf7huS?=
 =?us-ascii?Q?e6StlBz2AttQ9xc/95AtauVOpzuN09dzInIxqp6sQP5oKhR0tJ1NiOYp6PAv?=
 =?us-ascii?Q?5jWX8EfwGVlTc4agVZo++uC4wBmGKtgwbyYUNtWF8UrXdPhMXlfzXLbZ1s2o?=
 =?us-ascii?Q?apdf0MVXh6EP+DNKKyl4pY5TqAGh6cA1WX39+1lo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75df9858-82a8-4421-7d04-08de39b6f465
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:45:08.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUvxKtXulVJmZp41n/4htXA3g7EPDVAmT6RTNWZmhUG0MPpgFNM/Deb7TDZM+nKVGKtNdqIMy4E4Jq5hdKqJ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the cores.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 232 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 233 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..c78d10a9a85c
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,232 @@
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
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+   |0x00 |0x01   |0x02    |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
+   | ID  |vendor |version |type |cmd  |reserved[5] |line |port |  data    |
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+
+- **ID (Message Identification Code)**: Always be 0x5. Indicates the GPIO message.
+
+- **Vendor**: Vendor ID number.
+  - 0: Reserved
+  - 1: NXP
+
+- **Version**: Vendor-specific version number (such as software release).
+
+- **Type (Message Type)**: The message type can be one of:
+
+  - 0: GPIO_RPMSG_SETUP
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
+
+- **reserved[5]**: Reserved bytes. Should always be 0.
+
+- **line**: The GPIO line index.
+
+- **port**: The GPIO controller index.
+
+- **data**: See details in the command description below.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
+
+The SETUP message is always sent from Linux to the remote firmware. Each
+SETUP corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
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
+  The remote system should always aim to stay in a power-efficient state by
+  shutting down or clock-gating the GPIO blocks that aren't in use. Since
+  the remoteproc driver is responsibe for managing the power states of the
+  remote firmware, the GPIO driver does not require to konow the firmware's
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
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (early remote software only returns this unclassified error)
+  - 2: Not supported (A command is not supported by the remote firmware)
+  - 3: Resource not available (The resource is not allocated to the Linux)
+  - 4: Resource busy (The resource is already used)
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
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+**GPIO_RPMSG_INPUT_INIT** command to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SETUP and its REPLY message,
+and the driver is expected to handle this scenario.
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
+The reply message for the notification is optional. The remote firmware can
+implement it to simulate the interrupt acknowledgment behavior.
+
+The notification reply is sent with the byte index 0x4=1.
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 2   | 1   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line index.
+- **port**: The GPIO controller index.
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



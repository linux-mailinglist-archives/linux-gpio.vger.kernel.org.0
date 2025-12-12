Return-Path: <linux-gpio+bounces-29515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E7CB9ABE
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 20:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5C71300977D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 19:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2896E32824E;
	Fri, 12 Dec 2025 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PdJTCpBy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE81A9F88;
	Fri, 12 Dec 2025 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765568721; cv=fail; b=s45iA5kneWPXVKA3cswLoFrQPU8OTUE6/xEajDn4EDVBmYpO9CGwiT45ETJeXpmXTERocxfOcAhGHBz1UOy2LeJ4trUY91c3OCNal/+iCoajKnmPvE5Na4E+5UtpTt3BQRa4mtdLaG+32Vehb/YXPfuEKmPXZYFEOE6lSxX5/aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765568721; c=relaxed/simple;
	bh=HfB0Kr2/OlyOO5GJKhB9ugd/B224VpijV+T9ToOt858=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pl/QgdkJ2JFvzagc21McKbJrNFgOUE0fmMaGmzUkMNUP7iX7b4/0x+9NNxqrTiaV14Ymcqd9JJJ2AxhHiHX6RA8g+mW8jQVVVq6rKG0PSinPA3MEswuVA1s7P5aar20H9lE+S6enFVAfiklh6n+8UNK/eSVJXbGdsYTlDjlDPUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PdJTCpBy; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2r91PbL1K98vAamyRxF05+ef/ONMpzVyez0wokZ+JA/cbNpgV/KYtM7wXz03+cPNprGBYb5aq7h1FpQflbnFWTP1mz8ucqWA50BpqXKdcxeNwVzJnxKrcFgktNPeLj/nfbFIvzb/sFTHqgzxpg/8ZtJEX3JDtCllFCihlxFH8qcaf6azgq18bWQGHGwhj7mF8jHa5eVupZWi8HG1DhkNnqpt3TcY/St+y97Xdv2punuZGr8k62NPvWPNXJ6PTrEOeOR6vb3XyAwcfSNQZoWGy1hW6QlyPKVWI/FneJhp7ojYkzoKAT4aLRkdA+30iKDuA80nc/ntjPptkB6/WCS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpu8hJ3FBoeWzWDX5LNp0XNXuR9QAvmR9wNaoNU6d+Q=;
 b=W/ROc0KcPzgFl+ezITkBRPXaGTUHpVeNjml88Ik5xqFNZfNIcjjmt89gnHjI55FmXyurdq41zI/QOSFA+RMSM3fIx4MjmWKBNcITudO3+gt72No6I+rJBdgSTnAX0YdnE/mbScwwXkvPTNC13v4twH5SS9qDNrR7ap8PWGH4D+KS1Ic2iEB7SyrqXMYjlUr3bZryxOcwSyip8reXrBr5b6oZn3H3Gp3pE/MIc1U1i253XoI8Xijx/Sb2yJ5K2LKoiBdHLd2oC2iwaXO3iUCnHVV9n+F2CmVthUiiMYtdvx+e0eQkVJPrdvW4bzCDRKTG4ozsLtZEtS4YRWTm546mMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpu8hJ3FBoeWzWDX5LNp0XNXuR9QAvmR9wNaoNU6d+Q=;
 b=PdJTCpByu6OXHCB0hDHkQ3loFGymKIf4T+fwJCFXKjeCm2ZdRnDiW/PgiHovrj3oX1rm2/p+M1TPBo6ES35WAX9W6AeHFFFX3BGb5T7PM9O0vRD3CjsZe1AiqT6PeuAwWjUESu5s5xWcb0iEuY989y0EE69jWo0kFuB9gX0SZORRP58E3WeNFvuMQP8FGAk3NR4J66rdaduSZmaDT3ZpGP7wN+JeIDcjjuRdhS7QCiV0h4Sm31IAyDuEG5SJ8o++vx7XLyFCoSPAJlFblBNfKkiAKBpCyv6AIQ55WHG0uICKNAkjMofJo2BVeVn9CyjhIQw//3GiRjVJvvqYo/NNsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 19:45:15 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 19:45:15 +0000
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
	linux-imx@nxp.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v6 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Fri, 12 Dec 2025 13:43:40 -0600
Message-ID: <20251212194341.966387-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212194341.966387-1-shenwei.wang@nxp.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: ac35ee0b-6135-48da-59f6-08de39b6f81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oLjOXMtQwK/w+TyZm1iKVUbGPeT1tLBgC7J42MHI4nPAL2PLN1bRAQ9LKjR9?=
 =?us-ascii?Q?fbLJlubs4R8OMBh8aqoaiTvdrVpiM439N67b9atVc9cAtGpNHtarWuHd5dCj?=
 =?us-ascii?Q?ukKEi4tNsMyYSINAlTVoVh0+w3j4jHxk2Robk3eHH749Ph0rrwblVOr6VMKW?=
 =?us-ascii?Q?Iw8ZSI3/h4XZ4weQrYcz8h8K1ROPXaACNLSTYY7rQRrzKdkNpR9mLwblY0av?=
 =?us-ascii?Q?F/orWCZuPbOmmQfWoSLZ+aKwr6A3kaABZppzVvaomvWwzZzNh/w37pb29MhF?=
 =?us-ascii?Q?qgDuxRUyAbw8SJYCLnGTryh7CV7ZClMtynevw62XLLHWT3TbwUWS/V5eKO4t?=
 =?us-ascii?Q?I9HBZWhLvFOOmWbl1jhUGN6i1PI8Dt7H8HGsa/ZAMrdJEbJ8RQwnNH6N9Tjs?=
 =?us-ascii?Q?s/GiFFfGW8MiFwaL/tI3Onw2Fv/VjXfIoicKLbf/42qbRIs7NNbn//bPHHZI?=
 =?us-ascii?Q?xsTnD5RGM0MSn9xLLQZ76t7wIyrMmXeA08vHAvPrqWr9Wf82YubLX58RGyAg?=
 =?us-ascii?Q?XN8pnNLMgftFXJ+xtOYuAKB4Qt0jYJlaeqNS/STxCwxll1HlMNK6tOUYgAEO?=
 =?us-ascii?Q?Lh/HG68KjX4hTe61pTWQ9rHN8jgH51MkkfpLxCY5CZnyDqosoAa+YwqmsQCy?=
 =?us-ascii?Q?0dZWKcBsDOs3M2FVVdGOiFnImhLaxQj+c4TikhuO+M1KcDpzKoKJulM+MszI?=
 =?us-ascii?Q?4r4RVw/hA9hrmQ5yHrUpWj9XRKM1Lvu0p76/OmFRRhLGmzPgkIVCspAi4qZM?=
 =?us-ascii?Q?1X+PFDP98XwoYQyk3LO57UU000zjaNhnuH4H+dTEt/du73vEMOHWGQI0tvpm?=
 =?us-ascii?Q?wXpdVhXbZdPRA1BPQI7kdfae8q6io1lBkU58/GI1Q6+MJaHvknYvwd+Z1Twi?=
 =?us-ascii?Q?HBBX8Cxl8yWFKBrYpi0ex8UcWJSAryahbM/lR6GxSUUFlxQyfH+UEzyyheC0?=
 =?us-ascii?Q?AVLjtsmMTvXMqWj7G1afqB46sInIBb7GH7Ga2oI0rkAtgLHajEnqlTKWzwLi?=
 =?us-ascii?Q?gIFhrvulXavKC4QQOH7Qf9jQPCOjY4wMb7crkZrQkFrwJrAOpiQm3AsRmf/V?=
 =?us-ascii?Q?zj3UtJioXQsHelYFrH2Oovk140IzlMxSIUSQb6AaRJYPTJXEgl2QApWy8Ff3?=
 =?us-ascii?Q?XbJ1SvRVEzrQnJNP0+Y3LLkc18166asMJsugh4iDZxvcjkJQLo/rp2IckZCM?=
 =?us-ascii?Q?iCKy6lnEc3egbM3tRFMsETMnspGOt0xZQ7DZ4irK/UgFAJ0bKpwn4p66UtZe?=
 =?us-ascii?Q?5VzuK/hZB9eFhbLk5BthPidW2qJ9AVgoICu6pthphSvjbcdn8DE12keqnJo/?=
 =?us-ascii?Q?7fpBXcEVeJRxeTt4rjG2uA4lxteVX18IOnOBrmI5fKN46RqxssSOhsxmWX31?=
 =?us-ascii?Q?ZVXivkhOAZUWXocak3IMC1icF2vxuyUrqg879uyAqDoumrZ8OGgEHjj7O395?=
 =?us-ascii?Q?wOk39dUJDfRcW/EoTLaNRJBB+T/padPc9CiFB0JGSv6OYH/Jo82tD1EtJAVY?=
 =?us-ascii?Q?Ilf2jQomUVzMM5J+yI7E10iaWcmchFth3coyGye/X/IjDAIj2YrUt3Lsog?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YjD1eOkRj9p1qumKYEHu1BG47y6nicweVv4rVoLGPh73uGULV7OSOATGb8+W?=
 =?us-ascii?Q?2jzlBvP8xolspgaTGRf5WYEL85WtJXaBsWwOPfeN1VqqMNNOF3SLpBw6FFYN?=
 =?us-ascii?Q?qyUsKMRQA8g+C46DufPJYgPgZPCbY06KKdQE6PvGm3ZRqjIWRRBMObRAp6hg?=
 =?us-ascii?Q?yi+ny6ddtAX6P6fTgeNRug3PIHXyxz5nrV4TacFuyxmai3iHnewUJRf31Ecr?=
 =?us-ascii?Q?iM+5Sx2/ztGY3TsOiMaOMT396VvPvyosLGB2HZqSC3yMC+LInz8ikrZUhyS8?=
 =?us-ascii?Q?T3pcwGeZr1k1j0NuOuogxN1vmZteHkzdp/xvLxaiIWdnfTya+7uexON/FQGH?=
 =?us-ascii?Q?iJ74zF3MNbX5VgVjYCG+o72KMKJCaZ4gntYpTrXHmjRiMTO+lp+oYrhuhABd?=
 =?us-ascii?Q?zvIfDgKrVkW7uExx7+e2vpgRZc6tM9XuaxoOllAuC5jf48jAaOagyjB3MIMj?=
 =?us-ascii?Q?TATzTVfLZ1kXgZaFfg9skR9ETVvlSLGFqq8bTf6wEN0zz7dV+W7MQqcv0hf2?=
 =?us-ascii?Q?rQflDRLZu6H3ZzLKJ6MNO+tCP6+jZqfxcM7X8ayxqJqOa73IuJzOsfE8M/Da?=
 =?us-ascii?Q?uPLrGXSs9ulVMgu867Gyz4ghhGgH/GqFh/nkdP8plLo0o0HzAcMfgtciCbKh?=
 =?us-ascii?Q?3GDl/qB+2KFvsdkbI/3LHyYZOSArW/xa87DKqk2TrTi44Jnf9se4Y0r3zpQP?=
 =?us-ascii?Q?iYvikOi3HKPN6ytLyar7obmfJM8yNuD/aUMqzj17tTLjVYRTUO492+4ltTkI?=
 =?us-ascii?Q?jz5JvdrO9EVxBHm5QAmSIqRc3WrN5ofeALZGGWqzm//tjfDpXMEuwnd7VFeS?=
 =?us-ascii?Q?h9K6ZMsY488cCP1e8lDtjmWWyq47Sqxx0/db9S4dmsU2LFmLNNhxq7WpWGzR?=
 =?us-ascii?Q?/XUMCNTNKjLnpF92dICYrXjqh5UC34u1alTvbPCr96OeTizXTIoMBPQ7q3iA?=
 =?us-ascii?Q?mfrWGEHz2NojwaaoSwIEXqBuo1sAlR0DyLHlrQUvUY/LwjCiYKHFHtIWKguF?=
 =?us-ascii?Q?+QKRmHaPRvesA3cmTuQSpTNK5NsyMEfXyc1Hn19StkNPbeLHYDbmO6TF0D/l?=
 =?us-ascii?Q?fxcsu9SiZh3+aEIoeDOMuZHzepN6RbajFLK1BJcYq2xqUayNxmBnn7+WJ5kA?=
 =?us-ascii?Q?2qqnUVdWVW7ozZepUNBjOuH2GOD1Q51tbSOd9NPpGIhouGcc0qG4ui2DRBqi?=
 =?us-ascii?Q?eakiQlxqziAX8evWlBz9CTKncWTKd7VwviSlijKpnHsIPHIfnFX+lxDqRnek?=
 =?us-ascii?Q?qcCxIlDpX6ja5kcIewu1pgXp23ibzYrfg2zaCmhanvO+rGxw+S8gaDus5IlD?=
 =?us-ascii?Q?Eq4/qthaHIb3V6LGP0hLnB/txVHyq+wRwNKcVYtNS1qQOw5jwJAWcIUBdslV?=
 =?us-ascii?Q?uoa7OBdlF4XbqGciSZPPgUnJN1LyEWsO3IOiv2VbC3NkTLX+CN4bAoUCJrmU?=
 =?us-ascii?Q?U2cNZEMRCO1+lhIlPlOoNn4ksz4U3WkTVqkg+2DlPRgZvsEX47wmn0g6Tja5?=
 =?us-ascii?Q?gZvitrM97KniMqHStCkdocdTUy3dN0A+PW1R8yFT//5En+ZH6F7QvYgdgxmS?=
 =?us-ascii?Q?zXQfQTfI1VyRyPOkpdeu3/S1xER0H0EG3Y917rKB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac35ee0b-6135-48da-59f6-08de39b6f81d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:45:15.1997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNHV1lUXF7gUmU3E9SHKfbYdCrquUcHJqYJLYyTJVxzSo9WKbfGYQl4Xd8hs1PnEw+DpwzGuQOsfP8f+MOqfrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249

On an AMP platform, the system may include two processors:
	- An MCU running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig      |  16 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-rpmsg.c | 490 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 507 insertions(+)
 create mode 100644 drivers/gpio/gpio-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bd185482a7fd..7a72b5dbd4a9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1883,6 +1883,22 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_RPMSG
+	tristate "Generic RPMSG GPIO support"
+	select GPIOLIB_IRQCHIP
+	default REMOTEPROC
+	help
+	  Say yes here to support the generic GPIO functions over the RPMSG
+	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,and
+	  i.MX9x.
+
+	  If unsure, say N.
+
+endmenu
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2421a8fd3733..b1373ec274c8 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
+obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 000000000000..cf10e2958374
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rpmsg.h>
+#include <linux/rpmsg/rpdev_info.h>
+
+#define RPMSG_GPIO_ID		5
+#define RPMSG_VENDOR		1
+#define RPMSG_VERSION		0
+
+#define GPIOS_PER_PORT		32
+#define RPMSG_TIMEOUT		1000
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
+struct gpio_rpmsg_head {
+	u8 id;		/* Message ID Code */
+	u8 vendor;	/* Vendor ID number */
+	u8 version;	/* Vendor-specific version number */
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 reserved[5];
+} __packed;
+
+struct gpio_rpmsg_packet {
+	struct gpio_rpmsg_head header;
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
+struct gpio_rpmsg_pin {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+	struct gpio_rpmsg_packet msg;
+};
+
+struct gpio_rpmsg_info {
+	struct rpmsg_device *rpdev;
+	struct gpio_rpmsg_packet *notify_msg;
+	struct gpio_rpmsg_packet *reply_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	void **port_store;
+};
+
+struct rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct gpio_rpmsg_pin gpio_pins[GPIOS_PER_PORT];
+	struct gpio_rpmsg_info info;
+	int idx;
+};
+
+static int gpio_send_message(struct rpmsg_gpio_port *port,
+			     struct gpio_rpmsg_packet *msg,
+			     bool sync)
+{
+	struct gpio_rpmsg_info *info = &port->info;
+	int err;
+
+	if (!info->rpdev) {
+		pr_err("rpmsg channel doesn't exist, is remote core ready?\n");
+		return -EINVAL;
+	}
+
+	reinit_completion(&info->cmd_complete);
+	err = rpmsg_send(info->rpdev->ept, (void *)msg,
+			 sizeof(struct gpio_rpmsg_packet));
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
+static struct gpio_rpmsg_packet *gpio_setup_msg_header(struct rpmsg_gpio_port *port,
+						       unsigned int offset,
+						       u8 cmd)
+{
+	struct gpio_rpmsg_packet *msg = &port->gpio_pins[offset].msg;
+
+	memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
+	msg->header.id = RPMSG_GPIO_ID;
+	msg->header.vendor = RPMSG_VENDOR;
+	msg->header.version = RPMSG_VERSION;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = cmd;
+	msg->pin_idx = offset;
+	msg->port_idx = port->idx;
+
+	return msg;
+};
+
+static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg = NULL;
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
+static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg = NULL;
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
+static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_INIT);
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
+	msg->out.value = val;
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_direction_output(struct gpio_chip *gc,
+				       unsigned int gpio,
+				       int val)
+{
+
+	return rpmsg_gpio_set(gc, gpio, val);
+}
+
+static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	int edge = 0;
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		edge = GPIO_RPMSG_TRI_RISING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		edge = GPIO_RPMSG_TRI_FALLING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	default:
+		ret = -EINVAL;
+		irq_set_handler_locked(d, handle_bad_irq);
+		break;
+	}
+
+	port->gpio_pins[gpio_idx].irq_type = edge;
+
+	return ret;
+}
+
+static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
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
+static void gpio_rpmsg_unmask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_unmask = 1;
+}
+
+static void gpio_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
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
+static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_shutdown = 1;
+}
+
+static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->info.lock);
+}
+
+static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct gpio_rpmsg_packet *msg = NULL;
+	u32 gpio_idx = d->hwirq;
+
+	if (!port)
+		return;
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
+static const struct irq_chip gpio_rpmsg_irq_chip = {
+	.irq_mask = gpio_rpmsg_mask_irq,
+	.irq_unmask = gpio_rpmsg_unmask_irq,
+	.irq_set_wake = gpio_rpmsg_irq_set_wake,
+	.irq_set_type = gpio_rpmsg_irq_set_type,
+	.irq_shutdown = gpio_rpmsg_irq_shutdown,
+	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static int rpmsg_gpio_callback(struct rpmsg_device *rpdev,
+			       void *data, int len, void *priv, u32 src)
+{
+	struct gpio_rpmsg_packet *msg = (struct gpio_rpmsg_packet *)data;
+	struct rpmsg_gpio_port *port = NULL;
+	struct rpdev_platform_info *drvdata;
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
+static void rpmsg_gpio_remove_action(void *data)
+{
+	struct rpmsg_gpio_port *port = data;
+
+	port->info.port_store[port->idx] = NULL;
+}
+
+static int rpmsg_gpio_probe(struct platform_device *pdev)
+{
+	struct rpdev_platform_info *pltdata = pdev->dev.platform_data;
+	struct rpmsg_gpio_port *port;
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
+	ret = devm_mutex_init(&pdev->dev, &port->info.lock);
+	if (ret)
+		return ret;
+
+	init_completion(&port->info.cmd_complete);
+	port->info.rpdev = pltdata->rpdev;
+	port->info.port_store = pltdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	if (!pltdata->rx_callback)
+		pltdata->rx_callback = rpmsg_gpio_callback;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &pdev->dev;
+	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   pltdata->rproc_name, port->idx);
+	gc->ngpio = GPIOS_PER_PORT;
+	gc->base = -1;
+
+	gc->direction_input = rpmsg_gpio_direction_input;
+	gc->direction_output = rpmsg_gpio_direction_output;
+	gc->get_direction = rpmsg_gpio_get_direction;
+	gc->get = rpmsg_gpio_get;
+	gc->set = rpmsg_gpio_set;
+
+	platform_set_drvdata(pdev, port);
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->chip->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+					  pltdata->rproc_name, port->idx);
+
+	ret = devm_add_action_or_reset(&pdev->dev, rpmsg_gpio_remove_action, port);
+	if (ret)
+		return ret;
+
+	return devm_gpiochip_add_data(&pdev->dev, gc, port);
+}
+
+static const struct of_device_id rpmsg_gpio_dt_ids[] = {
+	{ .compatible = "rpmsg-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rpmsg_gpio_driver = {
+	.driver	= {
+		.name = "gpio-rpmsg",
+		.of_match_table = rpmsg_gpio_dt_ids,
+	},
+	.probe = rpmsg_gpio_probe,
+};
+
+module_platform_driver(rpmsg_gpio_driver);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("generic rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0



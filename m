Return-Path: <linux-gpio+bounces-29512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB28CB9B60
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 20:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69A9B30FF655
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 19:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76278327BEA;
	Fri, 12 Dec 2025 19:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NI+tpLcn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AEC327BE8;
	Fri, 12 Dec 2025 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765568699; cv=fail; b=iUEsdqhTsf1EFdBZXOmPPxz4SwPWPMwqF1AKzkltRBTMr9E1wF04sOlElMhL4FoGl7wOkudwQ3HnPgUuGfEuYKn4d73g2WtFgUXxIinaiAgOlt4i4ptJtXAoPOSpYiMu4EqGKsRRILDuKx6eYfW7eDbMDBSfXwIYOERODMLS/AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765568699; c=relaxed/simple;
	bh=vj0qgMLZyf6n6mfeXYfrfdJgjC+ZoBK1DNEC2Yw+4Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lgvTqLaLTDYFfS1D7B5kHJWMns8hRj0l32ItRiTITwfsp5b3GhsmeL+pAZIH4+grlMf0zdKG2Z7wbuAyaONOvD9OWJv+NZUw5FHZu4eu5REoaz5AKEWXtFoKllc3IgCRd1OcjpNy2ZTVafV1vrzI9Mecg27/MnWoXYF6v3Gd/Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NI+tpLcn; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5iXJVWU6Jco99R0RVMtoHpNr6EIfa7obcYN1uAk4fG0uzuHQH/5wjaNlXEc8AlqPQfRVJdkMzSBi7PZOztPwr/1zE3Ytx/gWZe/rGiSr3cMvew+vzR1kwUMakHAtKVvNES0EMMMQl65bfg8aSnniobg2keK3nz4KtsuwQRY+JcuG+yIaLCIZiYwVQLwYNu1GWBr6/vZDg6xpamsAfRuZ/R5wqAvL10SY1yYs0lLquUdu2JDP39+OnWXtqmj6EI/rU8Or/IOtwFY8cb6fpnMPh/TNIzXd6j7oXjy61BGKNCGV8BjCIuZxB2u7HYThGhrvgl5G9SQOMnoMlvns3KOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SixM1BtBh/K6vG+vDmSyDeFj0Ppo/iuMaYG7y5kgnI=;
 b=VYXAjrSSdc3vO7TlVz3o8jNxeYrmL3w3kj6LcjdrRcTIA4M32TJNfU9bOgqgJfvyZZ8vJGcf5sihP6/lkH1+UD+3TI/TP5wwa9jnN+QV69/2yW2p5ngo6Rzem5FIKF60L+2DgWsY5MweVPbJFIJ8v6vLl2/jOL0lUAZ/YL6wEe/KVBbmnOjkTNPJ83Rjw7MK6USEmM6BCFr7onGjSoTeEJQjJWIKkj0OMuB2HuLa2CxTCPUt6afFHxGxv7aDgICHSrOwVOajyUzoU7fZteV4RtFtePS+P/49mHZ7NtV5KRO1QHGgG7JBM0Wy7VpviYXI94YIasczB/yBSDqQxIxetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SixM1BtBh/K6vG+vDmSyDeFj0Ppo/iuMaYG7y5kgnI=;
 b=NI+tpLcn2LaheM0w4l0i6auWTR3e5I7ajQhLCG75pajWwWTxWABIBa97ZisXqx9wfWXiK2aAWYjLhTCyFgg+NdhYOks+lu/RmtetQpg+D1m+yo1gr1yBsAWRUhNx5FzMNGpLHSnnBVv78kpkf4HPIaPg6/C+nAFfSx4IofaFbdNZUtg/Zc8xeR0MdjF6uqeXyhjQqTWYV653qB864/Wl2dpoiar8nxczHu4cxMuUtFETuTR75+w4fwfuiHvvxgzjUXnc0TzK0D+xx4f6l9zLhd78btBv2gFeqiXyKRKQ0YLBSTroJc7Aty9agvYDPMhQmW8LjKTKXLSljEhJQgc8mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 19:44:54 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 19:44:54 +0000
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
Subject: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Fri, 12 Dec 2025 13:43:37 -0600
Message-ID: <20251212194341.966387-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212194341.966387-1-shenwei.wang@nxp.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 727c0ddf-27d5-405a-9554-08de39b6dfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dbgpY9linBjyVpqxen1/NYqVzBN119oyyfz9k/2NMdZw9rakOQBAY0A0/NxI?=
 =?us-ascii?Q?GdT0hSdcY98oZM2OdYwTLxWEl0x1JD+losaYmXZ916maHoOwVS9CBMsw0KXV?=
 =?us-ascii?Q?3xBqu2E1J246H7J5NtYlHXukqeqKK9ee6WY0LN3vyvVVe0lyupnxfON6DQmJ?=
 =?us-ascii?Q?QNVFPFqlfvvlAC21w5BHqalkmV6P3XsleEcW6J1bIGkUUBCMBYYfE1pbrir9?=
 =?us-ascii?Q?61TmEsNA3IJW4ZPs4XdfpBc9qpAgTt9ICFEfjXxP8fXoie5cZH9AUa+vK0rH?=
 =?us-ascii?Q?0+d4V+ZHbQGsGAiI4NBcP9gghUeE/8fRpE/XDxou6zKqgvGgr5XDmfkH7+gV?=
 =?us-ascii?Q?/4DkS/X3lOjvgGOwqqCLZRswktZnjS0MM5+JwMXe71G8K5x+3HfpRi0et9cn?=
 =?us-ascii?Q?WoPmK+DDpR4YY7N0vkfqSQdegY/z6k1nlnf0hLOK2EViAB9gQW0R2Y6vIO45?=
 =?us-ascii?Q?LmmbKAVl8yTM80EEJqQnxf/3+A/UV4GGEPeZvwlExVVgWlymdZUX1L9HiYGw?=
 =?us-ascii?Q?VMWQ+2hVLv0slUVwc891CBGqNKmiWCJWIpZI/d1ma0v2xsfHw7csswp/z8L4?=
 =?us-ascii?Q?O0XAUOfKSK8fY7bccnMTrlH8Nl32QqUw8NNnndwgRzIbkLS2y908ABRySsso?=
 =?us-ascii?Q?rzRQKu5IWR2WiMo5Gdtk4R7WtHxvXwKlRdH8395328OH9q0BvT35vRnSK7cP?=
 =?us-ascii?Q?LftuNUVIpcg1d104PrdX7F4M3aOViSGQRy++C28lcbQ7eXD+djiL8tSTjXsS?=
 =?us-ascii?Q?MpGzVOHlymh6EeCtzQIZe0d5U8fer5Y4MpQUFv2RkgAyH3IJv+M/yHqatUrP?=
 =?us-ascii?Q?p7DqOOvQ2mq+R9s5SriA6jYNAt4+JPS+m7fXZt59Tb+BFpkhw8JBnaQjJKCi?=
 =?us-ascii?Q?b4jvVnhnP4EousDkv/ef0/RxyymTFMzk1yur9jdgas4ZtX5dYKkCAnDb4b2G?=
 =?us-ascii?Q?eyrnfTq7wzecPxt2cWwTlxPWt593XnFOnW15kaxftu19bN/mKRBHmTG9uj0w?=
 =?us-ascii?Q?cquqpYjqUcT4ds1xUAe29bY6/Om5qxD2exrtcWFjkkx5/K0yaIC3TkAqZtvT?=
 =?us-ascii?Q?ft5n1PcMlRNqEOu9C6ONhJoZ1Hv48mpmCPf8KEP7Ls3/Y/WuQhp47MpF84ZF?=
 =?us-ascii?Q?5E7z8VD/grcnO4D4hI1lJHdAJNzxG+UYLGvlIrPfzXd7+IYeXXOXhgS+nTE/?=
 =?us-ascii?Q?v8aNmTl+4LfqYo0AEaUCcn2dkP8G51WZhKfpykSdKTmYjGFbhLFy2A90aPR/?=
 =?us-ascii?Q?jYzLIDklHah2J/QdW9jz2L9Z/bCMZXPPEtuzcEfCzrMO8pWQnGGU0KE1AyU+?=
 =?us-ascii?Q?YxbZzjEmWypl6wY91XL7bEU9D27mrQQAECn1xEzmf9i2OsBd2jsDhhxX7g8m?=
 =?us-ascii?Q?dFFhm7wQllxDjG5KK5xnYNTDMpkacYUBRus4Aa6rSMI+fwj5Nr0haCLK/jT5?=
 =?us-ascii?Q?1lBqir7Sx+WloLxZPh59Ieuiuff4l7RiwqviKpNBIrLthaRGA3x7naVLrd4L?=
 =?us-ascii?Q?cCLi6B6pMQslfGw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dF94mf7ouWFh7V55RfB3+ZFe3CVc82YEw28XNrjsAzCUb/wHbFp/7AZ0G1p6?=
 =?us-ascii?Q?nSqvEETmDcDdg76ujsD80H76glo2Zx0TM3FlNzlY5oQV0KUJ/QiJSJ1jsrgU?=
 =?us-ascii?Q?vrphQHndc1OHqyIHmyhxdsQ9nxf6fnz8iEia5ioqVYAxQbk4JdxSTrii6hrO?=
 =?us-ascii?Q?Iap5aKtE7I++6Tqd2i9737YwV+VOpA+IyEubpgiOBNxW9RuiRQFoCbuDsYz0?=
 =?us-ascii?Q?ZkV0Y+Mem1uZr4Fi+CiAS/rBSUhYRXHfiSrq4MtYEqVQlAyJEjHeufqjQ75q?=
 =?us-ascii?Q?66vu+2bMmSeMQYs/tABn3y3c+GA8sLOsvrVZ10Tj966qSw19nqDVfjrAmWdl?=
 =?us-ascii?Q?pr41XxW33+WzlVK2skn3lW4bOMuIilzdbehaSUjmrfDBmMhswipFLzuITPuR?=
 =?us-ascii?Q?M8kZt/7bIpXZbIesAyM0BaN6U0Wwktj2ekjNx0TQOg0dyJmFiJQW2vDZy3QQ?=
 =?us-ascii?Q?MvSLfjxjnMWTFVX1A7BfKPBZIqIohecyQz9naJzOOAKbx+FireZ4qzfbZYo/?=
 =?us-ascii?Q?wwievdogreHCT0dkwz7nIm71tyKk96qnLkayHkJf0d4VSFr5e9s4euLJn4Bq?=
 =?us-ascii?Q?HgmGEo56/9JonKY6DmOUaZ0vY3knoSLvV3jAx2B1dwghfs2NsdLcIVbkJ7LF?=
 =?us-ascii?Q?WbYOmqyCYBNIf12/Qn5QFokEm9MVrAB2sI8wjTSHHIbc/Ug2B4920rH+o8JK?=
 =?us-ascii?Q?UNHjxUdVTcMrI+i+ZLB6/FEdwSQ+f+22aOP3+Yo7V2zfmTS5WXhEzKd+nxI3?=
 =?us-ascii?Q?UBlFRx6XZ0LdO7xotjoUZX5pL+c5Zm3v4DLh34snaJSxlJZ31gN2hCh5twDz?=
 =?us-ascii?Q?izDbl74PDZUVDLP4F3uvkMJCG5qc9N1kUMLAXm7YUdAJdCpceheYsxW8g5gH?=
 =?us-ascii?Q?K/pRvL5T1xlraAsuiwdYjgsRfdntgorK6zzVBrkCJRdUfhMiPfKM8txeeHDC?=
 =?us-ascii?Q?9pIt8r6+WEiahNfOGvOT7WRZFvyBgki6Ifrg7MfBy9KbE0ExelP1ike6Cqbb?=
 =?us-ascii?Q?adKtAV7vGdLathcSy4k7/CprwTe8cliaid01U4Vmws83Q54DqP8kpDVrFrBl?=
 =?us-ascii?Q?/q5vtPDz4jT8fqMrS+fsvOvJJf03l4nkg01dbKdaTAAWja+CLJiOHrfUtBv5?=
 =?us-ascii?Q?W87eSCy724GPeSnZaoS9iMqtN/CTf+p9Hztrs+Lx3CIw/Bn7Tw+l3kpBDxU8?=
 =?us-ascii?Q?oEGFuIHhiRy3HDvE96WuHXD2L+PRn558S5l4LJqdNiRRLO7519eJETn6OvLR?=
 =?us-ascii?Q?K25ojvL5Mv3SHHPnsC2Gn5RPeDcqUHkiojh2j3/er/TH3nub35ik0QJAKA2w?=
 =?us-ascii?Q?Y7s4ZiWeB5O9whtlpfbU32ct5l4V/0xJE0FLkBnHvlu+ZCFjL6m/Zuf015yq?=
 =?us-ascii?Q?Zg+rXcNYnd4omZYag4PwYcg8YnWXQZI1am6F98X/Oysn70Efh62NLpsYfoMF?=
 =?us-ascii?Q?os/pHn60iXAAL7IBb2tJpS2cfRkz82/SnMOcz354feleDMQfJAcSkJOgPjjg?=
 =?us-ascii?Q?YWz3oPxk+Yj8kt9sdLIzjlDwYwa4VrIJl/EiF1MzTatWOBWoPuQVVy4/z0X7?=
 =?us-ascii?Q?qmT8YBLXhTnvrHdcITM3HueeAlP2rFphmnh5DSNY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727c0ddf-27d5-405a-9554-08de39b6dfb7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:44:54.2846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIum/olz09KjsRHbuHMLZKY3naBzkis/zZzoyBBkpK8rd5rOlXJupnB7h+jck9KEoDopBt+b186fDrQnWAopCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249

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
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 49 +++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 54 +++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..b3e1a5dbf731
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic GPIO driver over RPMSG
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..fd8e5a61a459 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -84,6 +84,33 @@ properties:
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
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -146,5 +173,32 @@ examples:
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
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&rpmsg_gpioa>;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&rpmsg_gpiob>;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0



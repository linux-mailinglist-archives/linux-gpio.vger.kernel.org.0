Return-Path: <linux-gpio+bounces-20546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CEFAC2AE7
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 22:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B595451C0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 20:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E3B1F180E;
	Fri, 23 May 2025 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jIfHRAeU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AFE158DD4;
	Fri, 23 May 2025 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748032344; cv=fail; b=DRu+7p/AgXIoOWynXNQIkZIfLomUnp31LcfIniMEF+JKjHvKpx4UWQz/Fjxflhf6+VyhfpLVTSrOQF3Y2DEY5hWkJiWYitGavnq7JvHwZgMboJ8Ey70lNrE/VUmVGSi3jcIQDNiSEOdWZacBib3QHfJHFOcz1xU26Sr7Ou7Q6rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748032344; c=relaxed/simple;
	bh=+imWWbn2NPZs8TeSqDOP2og9/fDIxgGIvkRiU4nsQB4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JSk0eu0Q8MvPxCFZOubSg9AU8e8Qti9kH3X4r3Fx+SXMZg4KCHzUD0+A9Crnqp7no62EpVSwoWFnl3uyrUKYM+9S704xeXm94xZmAJVeqizsRqt0JF97C/5kPMeWwdrACeXr1RIAS9E7NPhVg+obxM3isc9CS4Ximq7YpqXz5dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jIfHRAeU; arc=fail smtp.client-ip=40.107.105.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pq7Dwbh0zJNdBrRLUpAo0qrQuRO5bM030hEl5NDnlLKqaohMcJKpQ2+6OoAUMTfQw/CSEFcFLB2H9QxbdfwUen2K2Ild6yajm76T8LaFvc9cCd7MCEb6mm1YlbIN3Pdx16v3IkOfws72e1KMxDzM8wdn9Qk05KzPf0HGQyTgQxuWOgcEWLCsnygThS+z9YR9vuZPtmIr/aiCJ6iEQ0sgZlpmRQwsKi5vx+gvsgbfhSt9wO5OrFK/xSwnK9uyindN3bG1l4xmNHaxNT6iSUM9WHanPCU3g/Wo/MpMvzxYgyZKOoq3vGDN3jYNlBQTeqtfdFoksi/yi5Dz0YhB4nEGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAxFz26JurqLzGELqnHzVqqZyK3LkwMQSqXw4pqgUzA=;
 b=WZvFtOpCl1IhTeCqFPHrOmPbuTEBWpgjnO/3dSpBrMw33oC49ij8DIOhlrO/3pWiv6BVJffIls4DSOeNfC2EHMDPJStSN7/RR0rNpdqttACcGWop2XlFzbnxP+tIUst7wv3jX5ZuEW9ImziZP57Fb9xDnDvH7Xg7Max4ZHo2cI19hYis1RhHB4Zpo7e/SkqN/OyA6tN8sb3cEoSVxMpjd9Ol1wdwYpSzFA3kKFggnVA/XYmc+1Est/lb94J3AWxGIV1bmgSqxKN0yCdHHSdR2K0XB5N0tWgp5bguVIgK9jJ+TX9c+u/axwOUNA7Cb4y4VAAXkjbKHNypqYeWVoOt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAxFz26JurqLzGELqnHzVqqZyK3LkwMQSqXw4pqgUzA=;
 b=jIfHRAeUYceBSYxCDFZaHalGpCy2AdX+9wrR1JWm3a9OD2PepS4mRIwqxnTjwiI/ZiNAbwfldGhBXSaDyaDCoKrUkuoyjwM/2oUvVwtzNnZiNQ1rijN+BDihbtVGSHHieMSr942m0r3lTPtwyqu6DpQiPNreofmq5wzVOaSnscLlPiskSc8kaVbPfsjiGsxqxxYcI8rnMaC3AzksjdbFv/FqNy/1aISUDMylsUT0QZnI4aq2IJAXnh/7RV4E+uY8NWd8DwU6FwD60bjtghfuCwreoF2nLNA/pHaa04ZUL+92dNr4yj2UGI60Cefgm+bBjjsXWbyYyBk2FURoDaZSHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10518.eurprd04.prod.outlook.com (2603:10a6:150:1eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 20:32:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 20:32:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
Date: Fri, 23 May 2025 16:31:57 -0400
Message-Id: <20250523203159.570982-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10518:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1e3cc4-7024-48ac-dee1-08dd9a38e84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qt19S5beTsvlOSl4ENTgIAMrLB1aLsFzK9IiUGKMqGVU/9S+IzoG+Pr/NWEr?=
 =?us-ascii?Q?+Jq/VaDzoFiacdMLhnGeExR337KPeFi3ZdvXIgxyq+XK03hGcxhzXB8MuAEa?=
 =?us-ascii?Q?eKMnPDgrj35GOl3mqBUvdLKlTwFiPgeOpgEMZQoDudzZ8MpIu0rME8cDVeaV?=
 =?us-ascii?Q?vs1knK30obrLgbUyBoKWw5V9MYl1aDsoDsT2YM5nwPoeRyP1qMY4QnmagRoV?=
 =?us-ascii?Q?DcIdEGyYA83UVob2232zW4lX1CUXYaC/kfkCmQQwhS1ocTo0xhBbRMPr5qdP?=
 =?us-ascii?Q?uHi67R3LhIEPVnW+UwmrsvuJU1oDx6oEZRV06/gLsSsNjc/kWsS9ZniCejIi?=
 =?us-ascii?Q?MxQfKnyXfZszT8ucY08KrN5Xa7w0G177jv2vASuUNlCfO6F9PVNQsOEaQPsn?=
 =?us-ascii?Q?2bnl8fR4oBRj+60TzUYKlk8xBousD4T1jYAguSDewDF4prSCxbrG4OWT7Z4X?=
 =?us-ascii?Q?YBUMTGoG6s1jxfrvIpW9gLGBkDx/DSvvzqL+XOcpPdx4RYr2lL+/2kKo0MKn?=
 =?us-ascii?Q?ShnZrmn4kjqqYHPkftOOvBBeBmWyL75NBDyhFMPUdOskGX3AtY8vphyM7LyS?=
 =?us-ascii?Q?ntuYDg4NfZf1FYs8LscG11HUQESDvnXjss1Zn5xNPmkFML5llbFfVM8C8Uqs?=
 =?us-ascii?Q?BiXMyMHcKCh3003jRg9u2NISdIf+vIHClxDvBV2kMYsYhOyLwmwInusRH/W6?=
 =?us-ascii?Q?mCrkBeaJnjJ8+lTrkjQqT9LDn+OtvJ91ebqxbQOvAHSUExgExlUY0UTHGPC9?=
 =?us-ascii?Q?KSdJKaSRj8dAztoU8sOOiXRUVLt83eONCBXsdXtY+duvo2i38XjHoF3Z5BRo?=
 =?us-ascii?Q?7FAVIJQghtLTrSxcpuVlbWB0ZM1oHFLTnxu/7jfS/L+rP0XoNz4z/jVoJhIU?=
 =?us-ascii?Q?6elQEyOVT1kA9J4kXshzHFiHFkVkmWEhSUurqJXYJGx9qWn8Q4a1vpaOcb95?=
 =?us-ascii?Q?/z1Xbmkj7FEzU3iEUPbjx20ejSgyrmeFBdGYAK+jUuSgg09cXMW8GCvwdxaW?=
 =?us-ascii?Q?3N8qqcJDvPJCIKG0IzFgRD3FxpGeYqX9dcpipkwUo1Rt58FRL/24iDTz9ttv?=
 =?us-ascii?Q?6fmWzLriXhnB8tveJ+6ZgsIoD/RiHvLXVuuneZ5wLY17XxfkF/9CX/Efsi8N?=
 =?us-ascii?Q?19xjUteiyCPRcdwqqN4Zh6SyswLfjlDEcMvURB16gKIAdxYdWw7iAfC+PgWu?=
 =?us-ascii?Q?pdO/PTvZWbVwZrS0p+CQkco3rlcOCqgfnfXhY9fxX3IAFSv/lmWfbOHmM4GL?=
 =?us-ascii?Q?NBbvWRWXnQJtzOQf7uh8M1wusQU0ryOWkFerdjH5ZMseX3GWggcOukUcnwzK?=
 =?us-ascii?Q?/dPydUal7BmfK6QtIsQtl6eG9lzvx1hWkdOypTLrHe7DNWnuL/AP0WCX//IV?=
 =?us-ascii?Q?/OXFaEioThUvoTdSj8gDnuK7wbWYCJjE5Z1eNbdfOlJh8isH+kHYkjLpmSNj?=
 =?us-ascii?Q?bY1jQwlZ0mheol+PV+Z4uxvNasIGWtQwWiIWHp0GZ+bcpTP9lJe4Vt14PuUV?=
 =?us-ascii?Q?2GUiY9TeCAhPbBY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rt6ZyvyxwyKaxT7EgpJMrrJ+m1CFhrP/tSPaDjLzKRCSP7WebStP+uerowTI?=
 =?us-ascii?Q?m9eIq2lwAHisEWsaDk+lwRG/kDu6I4dVWnfOsdmllMYXbfMt0l4el836XwHo?=
 =?us-ascii?Q?gyoGppYbcnaM9ADfBXUQH5o7cMn5IH28hDnH4Csm1WiYWtYgpEHQKSow+U+z?=
 =?us-ascii?Q?LrPr+DLLDshAIxuMTaj8IA6dLrIFsTYTl7AEl1mt5mJ49Y3Cz5KH0YCQub8D?=
 =?us-ascii?Q?OuvvWgCY48HqeaiNGRgFW7FCw/dmAYcogLdprK5M04Fy0gHRNk5rfyGKfqz0?=
 =?us-ascii?Q?KnN/wmlJoRBdbkRDoIaKmxLMV8xmzOrTTKGSevzDO5Ah3NvHr+kqZpmebEzK?=
 =?us-ascii?Q?ykR+7Dw+WNV6E60EP2IUnVa0e2eLPZRJei2YvoejC4mt4DHw/TgDUzGsM4dX?=
 =?us-ascii?Q?XkcPaKfsTPd62Sr+c8V7HCRkPOIMS5nw6KGB7CiEBRiQ2KP4Q70lOd4kPnHt?=
 =?us-ascii?Q?Dskv07PsSHTv0+JFQtrLQYimy8mpE3VYNuOwvEkR7xSons2CW66fdxGYYOGy?=
 =?us-ascii?Q?oX/TeMig7+GHMFPih5IstFWFf+0ffAtmhJAnzul9M9Hy9cZtNIkxiho47lq/?=
 =?us-ascii?Q?2Sky3YUv78Dt9p0pAon069H3G5IlDhesKBmLFpbzxdR0KhMc5qVggFKqOWAZ?=
 =?us-ascii?Q?oaedfuGyz8FoBb+8q4HlgI1Qkvbtle4qEWnHbceU1bU8goZ1YhYS4lxSbueg?=
 =?us-ascii?Q?bMFzZPWCcqGnbbPdm42MjSs8lGTe/kiPFk59A6aj8vgyKhCkOkKyHawCkQMU?=
 =?us-ascii?Q?slHY83vde3YXGOtXWJqk2kl/7OrWq4Ts8vrq9JiqIe1fwX4aYS7UWgn8ggCt?=
 =?us-ascii?Q?as7TJQhN11EI/CjQ14e66ncS/bujBFfeNwVdswu7YdFlIYwlPYPiNJ8OXZRn?=
 =?us-ascii?Q?OoJBNlHWE2zTkeufXowa2dWq29XY1ee1oflnEWzSEKptrioujxzEpJmI2vfn?=
 =?us-ascii?Q?Goyjh9TOLYNUCtO5+jmzYyN9beYfrPFhmiIXcWNoRQxD02GIGdCHwf5Et6mV?=
 =?us-ascii?Q?xPvdoLEKhI30+M+8qNYhWO4BOMDYwhlm/pYr0pvXnu0smiIZlx631OwB4qXQ?=
 =?us-ascii?Q?GJL+/BhH5oUQlVIaoXEaZYVPDn1rTVjz6dpFG/18rM+FYtHZoEFm+IagUbYC?=
 =?us-ascii?Q?0RU34dIP0P8TJg6Rzm1B++QjMta7VxEn5NIRalxGZxGB1Q3WxTlu7QeleOOr?=
 =?us-ascii?Q?zk4bwi0XGBsN7LlWoAL7qTAgIggzSKUn4lzMp3wOYLodeV+u7ZzZ6xcoCL22?=
 =?us-ascii?Q?ca/mJlfqYC9WysteS1ksESaMRPxzHPHviausYJ3WDPNpFjQFHJWbgn1DOEG5?=
 =?us-ascii?Q?XXw+euF67n2tgEb9Sl8FIzZXmFQOHhL/btq6sMYHVKIk/ra2P+bWfTGHT3/k?=
 =?us-ascii?Q?NXtrWVmfmLxD31FmTXfVIsl1elq3e8RE3FjVPG2CsppvzFH56ixYGwsa62Is?=
 =?us-ascii?Q?DlL0jZbq0UvpZCKJ/45jgJIcHv8JTtddRnfRZnFrNr3yBTUNZf1uGkxQ9Rje?=
 =?us-ascii?Q?bCXcMuQeOalQPXvmqsIg2fTMMBsFJVD5CVbpyu76evmyJVrDKvcsncSKu13y?=
 =?us-ascii?Q?cWK08VYblD0xf/UoCYGTkhesip9Qa4t1lHMm7W7F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1e3cc4-7024-48ac-dee1-08dd9a38e84e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 20:32:16.5093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DijOLQ4WX2fPxUBFqyCvGAYEWFpnrf9wK40AFm5+7x8pqX14llAtflsksanP4rhfvhUymeQbDfbgIrz6cDbt6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10518

Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
below CHECK_DTB warning:

arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
   'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-mxs.yaml    |  73 +++++++++-
 .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------
 2 files changed, 69 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index b58e08c8ecd8a..b3cf4682be3fd 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -18,9 +18,11 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx23-pinctrl
-      - fsl,imx28-pinctrl
+    items:
+      - enum:
+          - fsl,imx23-pinctrl
+          - fsl,imx28-pinctrl
+      - const: simple-bus
 
   '#address-cells':
     const: 1
@@ -31,6 +33,61 @@ properties:
     maxItems: 1
 
 patternProperties:
+  "^(?!gpio).*@[0-9]+$":
+    type: object
+    properties:
+      fsl,pinmux-ids:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          An integer array.  Each integer in the array specify a pin
+          with given mux function, with bank, pin and mux packed as below.
+
+          [15..12] : bank number
+          [11..4]  : pin number
+          [3..0]   : mux selection
+
+          This integer with mux selection packed is used as an entity by both group
+          and config nodes to identify a pin.  The mux selection in the integer takes
+          effects only on group node, and will get ignored by driver with config node,
+          since config node is only meant to set up pin configurations.
+
+          Valid values for these integers are listed below.
+
+      reg:
+        maxItems: 1
+
+      fsl,drive-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        description: |
+          0: MXS_DRIVE_4mA
+          1: MXS_DRIVE_8mA
+          2: MXS_DRIVE_12mA
+          3: MXS_DRIVE_16mA
+
+      fsl,voltage:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          0: MXS_VOLTAGE_LOW  - 1.8 V
+          1: MXS_VOLTAGE_HIGH - 3.3 V
+
+      fsl,pull-up:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          0: MXS_PULL_DISABLE - Disable the internal pull-up
+          1: MXS_PULL_ENABLE  - Enable the internal pull-up
+
+          Note that when enabling the pull-up, the internal pad keeper gets disabled.
+          Also, some pins doesn't have a pull up, in that case, setting the fsl,pull-up
+          will only disable the internal pad keeper.
+
+    required:
+      - fsl,pinmux-ids
+
+    additionalProperties: false
+
   "gpio@[0-9]+$":
     type: object
     properties:
@@ -80,7 +137,7 @@ examples:
     pinctrl@80018000 {
         #address-cells = <1>;
         #size-cells = <0>;
-        compatible = "fsl,imx28-pinctrl";
+        compatible = "fsl,imx28-pinctrl", "simple-bus";
         reg = <0x80018000 0x2000>;
 
         gpio@0 {
@@ -132,4 +189,12 @@ examples:
             interrupt-controller;
             #interrupt-cells = <2>;
         };
+
+        lcdif-apx4@5 {
+            reg = <5>;
+            fsl,pinmux-ids = <0x1181 0x1191>;
+            fsl,drive-strength = <0>;
+            fsl,voltage = <0>;
+            fsl,pull-up = <0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
deleted file mode 100644
index 1e70a8aff2600..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
+++ /dev/null
@@ -1,127 +0,0 @@
-* Freescale MXS Pin Controller
-
-The pins controlled by mxs pin controller are organized in banks, each bank
-has 32 pins.  Each pin has 4 multiplexing functions, and generally, the 4th
-function is GPIO.  The configuration on the pins includes drive strength,
-voltage and pull-up.
-
-Required properties:
-- compatible: "fsl,imx23-pinctrl" or "fsl,imx28-pinctrl"
-- reg: Should contain the register physical address and length for the
-  pin controller.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices.
-
-The node of mxs pin controller acts as a container for an arbitrary number of
-subnodes.  Each of these subnodes represents some desired configuration for
-a group of pins, and only affects those parameters that are explicitly listed.
-In other words, a subnode that describes a drive strength parameter implies no
-information about pull-up. For this reason, even seemingly boolean values are
-actually tristates in this binding: unspecified, off, or on. Unspecified is
-represented as an absent property, and off/on are represented as integer
-values 0 and 1.
-
-Those subnodes under mxs pin controller node will fall into two categories.
-One is to set up a group of pins for a function, both mux selection and pin
-configurations, and it's called group node in the binding document.   The other
-one is to adjust the pin configuration for some particular pins that need a
-different configuration than what is defined in group node.  The binding
-document calls this type of node config node.
-
-On mxs, there is no hardware pin group. The pin group in this binding only
-means a group of pins put together for particular peripheral to work in
-particular function, like SSP0 functioning as mmc0-8bit.  That said, the
-group node should include all the pins needed for one function rather than
-having these pins defined in several group nodes.  It also means each of
-"pinctrl-*" phandle in client device node should only have one group node
-pointed in there, while the phandle can have multiple config node referenced
-there to adjust configurations for some pins in the group.
-
-Required subnode-properties:
-- fsl,pinmux-ids: An integer array.  Each integer in the array specify a pin
-  with given mux function, with bank, pin and mux packed as below.
-
-    [15..12] : bank number
-    [11..4]  : pin number
-    [3..0]   : mux selection
-
-  This integer with mux selection packed is used as an entity by both group
-  and config nodes to identify a pin.  The mux selection in the integer takes
-  effects only on group node, and will get ignored by driver with config node,
-  since config node is only meant to set up pin configurations.
-
-  Valid values for these integers are listed below.
-
-- reg: Should be the index of the group nodes for same function.  This property
-  is required only for group nodes, and should not be present in any config
-  nodes.
-
-Optional subnode-properties:
-- fsl,drive-strength: Integer.
-    0: MXS_DRIVE_4mA
-    1: MXS_DRIVE_8mA
-    2: MXS_DRIVE_12mA
-    3: MXS_DRIVE_16mA
-- fsl,voltage: Integer.
-    0: MXS_VOLTAGE_LOW  - 1.8 V
-    1: MXS_VOLTAGE_HIGH - 3.3 V
-- fsl,pull-up: Integer.
-    0: MXS_PULL_DISABLE - Disable the internal pull-up
-    1: MXS_PULL_ENABLE  - Enable the internal pull-up
-
-Note that when enabling the pull-up, the internal pad keeper gets disabled.
-Also, some pins doesn't have a pull up, in that case, setting the fsl,pull-up
-will only disable the internal pad keeper.
-
-Examples:
-
-pinctrl@80018000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "fsl,imx28-pinctrl";
-	reg = <0x80018000 2000>;
-
-	mmc0_8bit_pins_a: mmc0-8bit@0 {
-		reg = <0>;
-		fsl,pinmux-ids = <
-			MX28_PAD_SSP0_DATA0__SSP0_D0
-			MX28_PAD_SSP0_DATA1__SSP0_D1
-			MX28_PAD_SSP0_DATA2__SSP0_D2
-			MX28_PAD_SSP0_DATA3__SSP0_D3
-			MX28_PAD_SSP0_DATA4__SSP0_D4
-			MX28_PAD_SSP0_DATA5__SSP0_D5
-			MX28_PAD_SSP0_DATA6__SSP0_D6
-			MX28_PAD_SSP0_DATA7__SSP0_D7
-			MX28_PAD_SSP0_CMD__SSP0_CMD
-			MX28_PAD_SSP0_DETECT__SSP0_CARD_DETECT
-			MX28_PAD_SSP0_SCK__SSP0_SCK
-		>;
-		fsl,drive-strength = <MXS_DRIVE_4mA>;
-		fsl,voltage = <MXS_VOLTAGE_HIGH>;
-		fsl,pull-up = <MXS_PULL_ENABLE>;
-	};
-
-	mmc_cd_cfg: mmc-cd-cfg {
-		fsl,pinmux-ids = <MX28_PAD_SSP0_DETECT__SSP0_CARD_DETECT>;
-		fsl,pull-up = <MXS_PULL_DISABLE>;
-	};
-
-	mmc_sck_cfg: mmc-sck-cfg {
-		fsl,pinmux-ids = <MX28_PAD_SSP0_SCK__SSP0_SCK>;
-		fsl,drive-strength = <MXS_DRIVE_12mA>;
-		fsl,pull-up = <MXS_PULL_DISABLE>;
-	};
-};
-
-In this example, group node mmc0-8bit defines a group of pins for mxs SSP0
-to function as a 8-bit mmc device, with 8mA, 3.3V and pull-up configurations
-applied on all these pins.  And config nodes mmc-cd-cfg and mmc-sck-cfg are
-adjusting the configuration for pins card-detection and clock from what group
-node mmc0-8bit defines.  Only the configuration properties to be adjusted need
-to be listed in the config nodes.
-
-Valid values for i.MX28/i.MX23 pinmux-id are defined in
-arch/arm/boot/dts/imx28-pinfunc.h and arch/arm/boot/dts/imx23-pinfunc.h.
-The definitions for the padconfig properties can be found in
-arch/arm/boot/dts/mxs-pinfunc.h.
-- 
2.34.1



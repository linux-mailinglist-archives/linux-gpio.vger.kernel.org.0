Return-Path: <linux-gpio+bounces-26389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B82B89ACD
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F3C97E7230
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2F03148DE;
	Fri, 19 Sep 2025 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nZ8nCYeF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F903313E3D;
	Fri, 19 Sep 2025 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288397; cv=fail; b=bD12oW0KVoXNguo98O4IcX76T+ot4t/il06GUqdxb9GDOKhc4IFhf8yXCdoTtg8kJY8edjQAs3Q7g1xuTLsQS5BQ+x1R++U5ITRnYUyMFBqDSwpaT7CzgMObHQsAYsa2rOiClm694s6f0FATygTBmeWK+CKYjg2BnR8mXckOV9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288397; c=relaxed/simple;
	bh=uVW1aYQ0cPAHLkP5Vm4UDuwg9rbts0ZtyTCf+OpUaQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wd8/w2k1VzNiKKK4ynv0SqElBlp5UNDBRrYSle+gFczW0sUAgV9HI0lUV/zQVTp36ywmcgThSlCu9dS8wuY6xhACH4o1ZXHhQmiOXqj8DUZiIzgE5FF0HrcEYfivVVRMgSRz0u1oK0AqOLT/j1O5K7rI8R49tOnS5BuBClVbLkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nZ8nCYeF; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmDXU/DjZoC7cXZ6lZZf58hwvpJ9D/aw1hxPXmEp3TMZt8oEs6njtIBfy8YSj8O5FnQC8TYMfeyl46g08jhFC8WCmZ8pJ1uEdQ30vxhc0VQ8ChcKa9WaR6sf+ArB3/6xQf0QGfABjuUX8qwDrLv2a38xwuamBNiew/xaP/RYQyPe97KNMOIj+LArAgD3VOoseHD7pJ3j8qBt3fgtsApqmteBs6EZ6PWXDpS4EF/6EX7C5ynH5h00v+z4HlPE4aYpSYB+3lVvwbwFZEg16/LlSL8hzPJPvk2KkbToNzM7uCNfc6ZtCyXB0G7On2y+8KglE2JtWnOLEi3qsDwCtACJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Unwdrfry4aW6PubiWWThoYHEa+utRAS3A2sSRMFn5v0=;
 b=ro6wvVNHgwymosLCqEpqkZ9Yh7a7UaxEmR4Ar6BtsX/YY7HM1srpPQy5hzKpYIc7ihoNSvdq8XM0Fhpa5To003igSYJwlSz3dZhiDI3h6iKp+vdkfzBUFCelcr35U3F2CYxXGNzxoz5mXkftx+wjQWLwcYwZBcn+OI1bps5EVFr8n0yS6kQ5rGsbDqRR3R5ND9cmbcHT7BHdC7qtoVp4yTv7LvtF5t5PDl8eg0CvFbBCvCWQ3Nzx/NVbtX2epYEGEyWp0Yt142YRnPDuePFz3mjAiVmioPkyCsJH2Xsal64uLZXb8ebIsv3mt90WNo+4cCsz3Gh4/fagVJTZjUMztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Unwdrfry4aW6PubiWWThoYHEa+utRAS3A2sSRMFn5v0=;
 b=nZ8nCYeFQLyEJBOhXKOhJK+FYxBR86PnyjmtV5BPpcsBPYxCHrEq2iR/GVyTpNHzLmv94rtDroKoil6z/IAQL4iOcJeJq1zvBOI8FxJ/Ae/iL4q42yXgiXK6D6iXaPwWNFbKJPz0/ddVgxHZdhVI34g1dhsu/3RFcE5AZx9GZf/0eYuTK7u3hkXDni0oErZD/zO4XU7SrX8wVsE4ZsfkjXp/pMzyFyq2NGQsLBG1T2ar2Zifp08zYvk7rKXtxWS8/P0U2V3DcVMlWw5UeObrtypvNebo+BpkqPR6vjIL9uOi0Q9c+l04+aMkYzAx3TvErtvU/sUoaxeBk965jm5N+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:22 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:22 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 09/11] arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
Date: Fri, 19 Sep 2025 16:25:13 +0300
Message-Id: <20250919132515.1895640-10-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: d3eae935-c5ef-45e6-70a3-08ddf7801fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IpW+b+pa4oh+tRlmfL1RH/LLqKwxtD9Hzll4oiy5NiLfSf01QNf5D91DdqhQ?=
 =?us-ascii?Q?VnqgdLpcGg4v5wccKjAYvLYKpZW3CZBpvFKjjjLwUPsr4IxreiIwkIc8MkKR?=
 =?us-ascii?Q?TPIRkPd9BYD8MrOdNEFyOmuMzo6UA0UbXeycl+2K/zTziZNLKSOnDVdWKnY5?=
 =?us-ascii?Q?WAOq77/EMDitbEzCsAGjcNM2NeULH/OETKsDZc4ABQEqApcr80yxY83WbNQO?=
 =?us-ascii?Q?Tjn+0cGKQ4xeUS4vyuwb8l7wTHZqhu46KilBFeHEtHkgDykg4uYabJNZeizh?=
 =?us-ascii?Q?wprT2VwD9bek3rFOTySP8bE6+fW1aLUmD/1mVBL482gNH2rOrU9tRunQrhTn?=
 =?us-ascii?Q?ktDHLe4oIpRRaennIBF2Fvy5aUuyqKwjjieSrRQ7VFO9DFfYLTlXca7gs3Px?=
 =?us-ascii?Q?DtXUcpWbDJN7snc37of5U+JZNIp9/ApmWuAN18eZMphjdlLYH2eOXnLiqNk8?=
 =?us-ascii?Q?BJNQVvpXmjeAKpBgrJ42CKS74PoDvACQU4rsop30gR8XSxKRsFgNd4hx2P3Z?=
 =?us-ascii?Q?W4f5Q++/rc5NPkWsOG++8rKEv7vZ3SdfPwAJOYAEqLkaL/NqFX6DyDWZZzJv?=
 =?us-ascii?Q?jM2WhjsaD4vuEaq5oIUAIwsJWBXf2x5ZuWjs3J4nGZBUR6PFZo+WTpG0HMnv?=
 =?us-ascii?Q?GTEcX6EwptYBhIx6fsZC6wtlwO4P1KPuIBsfiHNCy9M3Jxim+jJSMhhMy6YD?=
 =?us-ascii?Q?mzZnujGlwBzg0WyOmBZJ/DNBUeCAIXA/F+hNk1+0yYVlYtOFsIJEa4hHhMbA?=
 =?us-ascii?Q?YqYKowSogfarM9ZKjcJHrEYifsGaynO738BWbZv8M8XpEwacxmthX540BPTD?=
 =?us-ascii?Q?vEey/+UjMo8yEiRjztZ/txu0QnZRsWYRKOogQqVS/ZmJEFg3tapMSgQ6e7Ue?=
 =?us-ascii?Q?SH1ioHx+dajKtEvAhWLBe/4F/BEL17eWeq6AjWMugdx0H1HVnKGpV2A3D0Iz?=
 =?us-ascii?Q?aJRZudXcik3iHz0J/6MzgwLBP6ZaGpxyOOQOzE3xT3z+nY+cfjAVoxX7o1ro?=
 =?us-ascii?Q?lvBFlmpe2uHX+rx17htSwtDTFAdEoUmOrh3Uq3T0Z89YgKfa1cXd2kKZODmo?=
 =?us-ascii?Q?IBBjFNVLFx1qUaS9+rqxS4KHjZwt1nuzvKJD3PV0mqI8gHvAH3CKhn3nsMBx?=
 =?us-ascii?Q?N1fU4LQvet7CoZKpi4JrlVVK8rz5/tHpk8KV+KEpcNskPMp9pioEtD9TPFeO?=
 =?us-ascii?Q?ZLqz2Hly8jUFhWlQizYWKkz+eQxMivhCu52Y9h7hz+4TymWy3tUDpi86Q99R?=
 =?us-ascii?Q?B6YflYLqVFVPfobhHwVUb/9cXJJnlCyGhTHtcBusvHc0cUqd4I9OfvpAJkYz?=
 =?us-ascii?Q?r1VvNv9DyyigPs1Agi2c0FCQ+KscsIo6Fw1InElhn2Psi/lBtgfynlIAsc7y?=
 =?us-ascii?Q?PbUR/lb6EdPb0PuSW7r4kkC2rJGGwNTXG4bbByZm/9Q6emluqU5Jg6duASFi?=
 =?us-ascii?Q?FztRD8cIUP1TfpIHWLh2jqLfWPx1hY7bJ+F2jYFGg9StvnsvuigSwA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/8j0kFEpD05IU8C+NbQ3+ewQlOvaOjtVhHd9pysuFZBL4cm0IoRHlhLlIaeU?=
 =?us-ascii?Q?Zllxl711UKuOsyjn4187tsGZttBUUTg01vkrRUtcJFPs4B04C3qnN0SZaQXa?=
 =?us-ascii?Q?pOYj6yKpyxSHln+EYWtabqwQ2po5JOcOKgwL6BAIWRJ8ajcAxYFG4mn7og+k?=
 =?us-ascii?Q?r1i7V0s1Pezwvd0Qb5Nqr1pGwjKJ3kLqwhqWfh1pdlSgUkPsxNDYrpia63jf?=
 =?us-ascii?Q?SGU+pDRfQNfbAnuUO4TCY6gj6TVvObhitaD2bjk02C+sKR78KYFlv7GCApyS?=
 =?us-ascii?Q?9p664wDMoDiT3c0FdvZjNBk7X+hbsBNWh4bUobmLTxRoQisYugAZI5O7H5eq?=
 =?us-ascii?Q?les+HtZZy1hmKJ4hNum/fckMyz8G5szP+FfRYVmNdH+IuDuMmgr/CeLvc3Lh?=
 =?us-ascii?Q?JyEN8yT9Iw9EJHDxI6b7YaMumFQElrPRlP0Dq4F2132dQPDhrgmsQd6o22IA?=
 =?us-ascii?Q?6COj0azVaODVzwx09Jpl4NYWnUsSTch+Jla1KiLmdtbvOGiFtnLl7+nZD6nF?=
 =?us-ascii?Q?iJVZJ69xinvdf77DzjVb9tTlKOPUYeLI7Fykm6Q5Nok96gx0amZFBG+4U1Cu?=
 =?us-ascii?Q?PFifJrP0lIodIumTJuXiHghbNdZjye2/jD3ePvowfJMufHnlqpivUA21E+Kb?=
 =?us-ascii?Q?JrpteXJvsMGOu3M+qYnzU3vx0pqQheJnF/M9kFt+jzGu16tCo96538VhexgQ?=
 =?us-ascii?Q?kEu7YuxTwjwSSZuK3W9eg4a6J9M3mkQDNKqZmuSv9e0Sb3C3aDYq1SNNn4lK?=
 =?us-ascii?Q?FyykXpxgaskODLhBSfWWEBp/39ZAB4fuh1lhvHUFboK6A2sVBb3qG8FIExSi?=
 =?us-ascii?Q?qUxFB6Si/ZMwRdJmwYdpr9WXbgiK1Ebt8cM6AxHzXAK4K4AXnm+zN5EIjOic?=
 =?us-ascii?Q?f+qN+iy/a5Pb7mSWt7AESXwpXbofqd7MWsbFd3EcwpJApRVKVnmAUhOFqAUI?=
 =?us-ascii?Q?ASKoQnANC8N0h8JDPjk2BQY3E/RwouM1AS52gvssQlb2INuTpoQ/sumHR9Xe?=
 =?us-ascii?Q?KOPURnvJKmmgez+Fl5oX5Xm4RQML1bUmWvkxlzPU2qQRsBMB+03I8aFBw5Pn?=
 =?us-ascii?Q?LV4fF4rF1AEqGhJ7i3VcPtM/W6Q0olAydtk41qg4IsQ8B9TbPsRPfYCzsJAz?=
 =?us-ascii?Q?X1xQS/I0mUiJb68+iykrAvFKykK848eLnsm9k006PqLzbaUn5063/QHzkK7S?=
 =?us-ascii?Q?lgNn/jTpF+dJciD3tzWJRwnhN9tDGWktJ10tEObTimRcMjbJnbjYXRH2uqjY?=
 =?us-ascii?Q?I2sB8bIsiMx/0wPQLdilWGAIKZMH/TYdiW9RV4srvkVEDFCKuLswLkEtFUCM?=
 =?us-ascii?Q?3B7Ghk+Hgn2S19Kn+NFpKKYEHYktBjhmjGukhq7uVvJBAw/CrgakBa5zxqvY?=
 =?us-ascii?Q?Td2eRdkSEzcm103MzmokV9k2VdMIpT/MEOgLp5fGOwPlj8n3vuz6fdoBAv3W?=
 =?us-ascii?Q?//0c4Y4xy4EhBMsTmYz/fh3MchwV3PgdoQoBBQXney6iPTSzmCQoPziHRiqR?=
 =?us-ascii?Q?yMjXLhlnDnOvoOg8MkLUvF/x9KoI/hnQ8VjwMKVgZ+In5fk6yQZQOQfQOgGv?=
 =?us-ascii?Q?Uh9hAxSbVCsg1rszW8/bw5/7yjC1kC4llt9lMEJ6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3eae935-c5ef-45e6-70a3-08ddf7801fe1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:22.0915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYnWIz/oe9hV8Cr5m7fHgzqN1hbbQ+tWEgxSjRVXSUODMwxbVmnz7MvmCt9xoUePZh87ZPbEcvkQsQuBlyKn3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

The QIXIS FPGA node is extended so that it describes the GPIO controller
responsible for all the status presence lines on both SFP+ cages as well
as the IO SLOTs present on the board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- none
Changes in v4:
- none

 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 736722b58e77..812cf1c5d7f4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -166,8 +166,20 @@ nand@1,0 {
 
 	fpga: board-control@2,0 {
 		compatible = "fsl,ls1046aqds-fpga", "fsl,fpga-qixis", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
 		reg = <0x2 0x0 0x0000100>;
 		ranges = <0 2 0 0x100>;
+
+		stat_pres2: gpio@c {
+			compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2";
+			reg = <0xc 1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SLOT1", "SLOT2", "SLOT3", "SLOT4", "SLOT5", "SLOT6",
+				"SFP1_MOD_DEF", "SFP2_MOD_DEF";
+		};
 	};
 };
 
-- 
2.25.1



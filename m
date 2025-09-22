Return-Path: <linux-gpio+bounces-26470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52BB91AE8
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA3493B20C6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B3225EFBB;
	Mon, 22 Sep 2025 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lrI/jHod"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121325A631;
	Mon, 22 Sep 2025 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551101; cv=fail; b=DmQtnZuOVT2JQS3RjYxWYdYw4FZSBeKMeaHOAbW/XvP2LmqeeAxFoZ7UglD03WuRWWKe0BfEzTGHpNJEYg+bjV3cD3QhlAmiewv2xB9CGPyKfle1iQqYGDQPfOcm066FKdzuBrMhKLRu8k4ajZ4AlPoFYQ48duadf5Ia78g564o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551101; c=relaxed/simple;
	bh=aGBXEvCIhXbepEXqrnmHaieaYsDvKnkQKyJwGuo1ql0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TTC1nS1WXyXjnXVnOwuIAxupwNbtF3i689aJNreKHHrFzpmOVrNw+x2yyyFB72toob84C4n0YOc/gHO/rAlBLbjhr7O7K2cDGoz3G3lBGd19DnvV+GfdCDzhrKjl0PbOUo8+xcq94PmnJzM/q9pl5jKv2cl+Et6ALz/GyzBTP2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lrI/jHod; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8g3/sUVGt5Vx5vPKTBaHD4e2SkkuNo/xyv8O2RYq1Tjh+GJbapz9lOHePiCMFMdOjg4HKu1e/Mj8+ge+TdUXXLOmiHHvyrzKRNkAAw8n2i2MN4cjha696U24hZEJKMUOgU8NgXKlFSc6/7lz8M8nfbUbZpcT8KnyNFHRb3cGme1PsjXpE4lt1oI5A9RcWdqp+Uv+1I5bLMQbkoVbOtWC9DGxeS34g6x2kWaTI35Z0Em3Mf0VvYHhDTYqe2xUjRhRSVKj6j0UpC2kArz9uGKPYAVQEG4QIt986eY9jTb7T9gNazF44ZIjscBf6vxH5AJ8nQ8QeIlWXvWjzU6mZV7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgT67z4NuImO9zaa+WnLD09Euglhfqx/5f7P6ASnTx4=;
 b=gbbEIJybtbuG5j8drRZO7wUV1b2qoBMgSZLTnrtNd3/82WnBT+DR2EG/JHQhcQlQgpi3RR5ulBDm5+5FH+8aJw7kOammLOxzy2AiQ76WJkXtPi/Pxy9j9ZGZtDWCUYeemVnVaiu5JjcGK3EgarWP91Cbka1j6tdiGMOKSBNtUeg+7EoVDzufDsZ0C+ZN17PKhohmDpwCy1Oft32d39DFeKDrr5RadniXCBNBDNul2cjga8xlFvm5h/pW6GB9W11GS2Nz7QFE+bFgJXRh5r7HLHLSV6Kelfi2zizlOGzPRLAG2OZ450A6VGHj9liMIVVMIw18JqFDOvpDDCSD5l3XSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgT67z4NuImO9zaa+WnLD09Euglhfqx/5f7P6ASnTx4=;
 b=lrI/jHodtQ8SDlj11zFpJsJ+rS2NxGgrGzEkHccnwm0+GC3p+o7kqTGTXgfeQLxSHveM6d8c6GEyyPp5ONzzZf2vCtGIgZoBgw2oVZebuUqfDhG10ZfsYgmQw8P7VfnYkkk5v/8IIgunm4ZT85jl+1Kcd+VK65vxdiZPvniM6bK6gk2lXzZyK8787Q+ssKYnwHjJdEC7f2uIg26HHuwWG+IpA/rEpdnWZ2LBhizhIaMr0vZYt+x3VeTX1jtVxCagom960S8iMCYbOJPE+9ihR+u6ZbSE82u052TqFQpulVCctbWoDrLGoL9zB5FqQjOGwVrRYF3ERRgxfSXtUq2YHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:56 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:56 +0000
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
Subject: [PATCH v5 10/12] arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
Date: Mon, 22 Sep 2025 17:24:25 +0300
Message-Id: <20250922142427.3310221-11-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0052.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d694ea2-a151-4eb0-ffa0-08ddf9e3ce07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Ho+fKtsxISPBDqACXz9Z5hm3OoJGsFVAfLVQ4CGK5GlhLvdyawHOM5tRXlZ?=
 =?us-ascii?Q?QVALKhmCOVCyawevxbK5blgj6rBtlMick2SFTfMZfN58QVLDYGMQB2pfCTQZ?=
 =?us-ascii?Q?pIQ65a8hNx3UsYJyN1lIuzk/doGOt8GTm86lmpJphV7TvLQkCu5osX0SJqJj?=
 =?us-ascii?Q?jSQbUCnQmf0aa27LcwJf4MaEwH5ZbS4hZ19xZjTwoeAlyrH5s5f2ElNwcXPF?=
 =?us-ascii?Q?qxmTZ41unG0z4ONhPqyaFdrpN9r9z3pSPeOsjOPYEx0c/Gkrzr3jaJRe1cr+?=
 =?us-ascii?Q?drMYS4OL+TyfiEm0+MI8J3WbAYAhBozbWsbOK/h+Z4KQE9ZlwBy0u3YM7ZaI?=
 =?us-ascii?Q?gQVsYuue2NKMicVib++fT+Co0sfmktwkkgUC6Er45+QaghNi7oiGVWXG0m8c?=
 =?us-ascii?Q?MNqdT/Y7SFpUsFIllQYaZG+LRmYLzMyB4CUwQWZw/6L1fbCx5hJFXE66E5vU?=
 =?us-ascii?Q?fFC2ubmIy51s28dD3bqProzMHILN+CYlBmEhO4ElxK34B2R3mNExEuorFijo?=
 =?us-ascii?Q?g8JOYH9fht/DBuZT3i5lPXKurjSqMPmayvo3GPAnuxtLxNNa3oW/kOFdzpn4?=
 =?us-ascii?Q?5cURGX9djUPZYDnAvWVQVKgKc8Xyyp1t4hcbPZ9qUgoOLMja/0lxKI8D1LPN?=
 =?us-ascii?Q?WuoXMYj1UpGPOkPzhS0KtVfqHbJtzQJigcuORjdNnUvlYkypcWf4Uq7i1c1e?=
 =?us-ascii?Q?rCZ/Yn758dyWJHRxdcc8WYiqG61Enbk5TBhUdvWajaUgneGBLMCqIaVObOPQ?=
 =?us-ascii?Q?H54ncQj7wUsaXc3mMKbsKMyG8mt97gEjNg1WX7+fDzKT45EljSDpSkdf+Evu?=
 =?us-ascii?Q?0vUl2KWx/u6+1IscZNZT55lr/SIxqhIYtXiWL+li0ELpPoAFrsuv8U1MTNYc?=
 =?us-ascii?Q?312GsxaQOei7R0c4Jj23J27gSKH9KKmsf2EKjRapW7UfMy1rMuhQ5uBTcP7O?=
 =?us-ascii?Q?gqYIMdY14E33851Nh8bLiji9it5jZN2shtGySLtJnRGZEo59lxeTKzdVJCEg?=
 =?us-ascii?Q?Z5SiICOmi0HqjoLj47WIuqRxdyi31JbiImbI8yw2lgOprhwqmK7tcv4jcBg9?=
 =?us-ascii?Q?D/yO4bjRYaPtVR/l/4mVOtXxvZ7lLluDFNfMpJ2QJRZLDhub0zXOhj+vthU4?=
 =?us-ascii?Q?+k7Ji0z4IAytrNhwIfaiKPXeXvZARLIBoVKIneEotiTNQx6L7Bh4ZN+0gdnv?=
 =?us-ascii?Q?jg+lJKPOhzkWA8K58SE6dAqBPGVPe0is6hMrC2CyPsAGO5dDQzONp5c+EGjN?=
 =?us-ascii?Q?c/29nkF4ohtLWQe4tARE8UuFF1oAun7xtFbFWm7GDRDitYqUlKWWRHFh2s89?=
 =?us-ascii?Q?aU83tjuOaptXOv/7dfO73MQTHyNzQsGuKMzrPVSJB+WoPlq8LMIh4SCa4AS7?=
 =?us-ascii?Q?g/Wu4g4rQ+SPYWsN4CO0FKS6kRmO4v+P8R1W/NR/05FCH7FIb1peBS88zdyO?=
 =?us-ascii?Q?8QRPCsuBWe7qNWpDCio3jRjTtzhfmxZ7uG4E+uHcV6RdnYwP9jbY/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WwkRD4nr4mAbcBrhbs/NSnvfaSITMe6grnA2diwsZwxu6dguqbFZp4b5K/IP?=
 =?us-ascii?Q?CJjn2pDZizJWFQGF+VRbSEFhEGPpUcH+DhYyRiygWi60Jpt+Ykco/cYvADTA?=
 =?us-ascii?Q?+W2wIextjGYjj2dNyc/NLdC07JhwV0xhy0kVro837BLD1YJn6a0BYMff/yNz?=
 =?us-ascii?Q?940UU/4Tfg6ulohuE2fpIAiIE2RGbfY1PX9BEszvLQtg2XDZqi29RUJqDAua?=
 =?us-ascii?Q?KGkz4wIxnMEd/MnoNWivhC9ou3P77gHn3cZ0DUAL2+4VuG6ttgcoMW+T5VnC?=
 =?us-ascii?Q?Q1xJKNVNCHuCnlquhWwkkLzuqhxIxmUvL9vo98TqJCiHjHZmXm2t0MkvFIor?=
 =?us-ascii?Q?iK5c/sQInIiUqhog0sRs3irYTSiQMkAqlYdJoXbk01gw0IhZoxX0rYYEwyYT?=
 =?us-ascii?Q?D73meOLZJqhhjLsCgzR4uen28FcI/LvB/1TE5dPDWZg9SSP00awIJqP6UpZH?=
 =?us-ascii?Q?n/NzXQ4spMgoXLI+/Mq/fChbRVoLXUCiVB1+8S6H/dg8YK9AqjFSJbtX/npv?=
 =?us-ascii?Q?dH1AjgBSBPOmpCemQ/UxlbT1ypy27jKPrzp6avmUm/ctplSIpNq9hECN+h78?=
 =?us-ascii?Q?RT/Iwb+xKEuNh/fscaCTiPT0b6ST4haQRe74ttF4b9kgDmKV/SO875SMfOlW?=
 =?us-ascii?Q?2boVu4zBdZPJMlEY9KmEHsozedzIhTp33xBommcRSs7kMhoW4+C1w/i4r692?=
 =?us-ascii?Q?xnkxZKJtftk0ads0xLYg5EnTHg8Gqz1cXF5UIZCnUiLneDv6SYaq0tvpYjpV?=
 =?us-ascii?Q?HP/mzZ8mAv3Nvu7fhuZCfN4M3+YqOlq0KXfDWznuDTsfArIqxRJWlB4wnUEL?=
 =?us-ascii?Q?CZJ5mukxXGibWPRzh/d5aLuqZF5HA447FaYHiA5x+lHz8kq7UQpqOvINUis6?=
 =?us-ascii?Q?rUSWAi5qaQX5qYA4KgIHL4zPvHeDYR+o3KED75Y+5PFAX+1ysvtJKZmJLWJG?=
 =?us-ascii?Q?cDHpc9e3Am8X8/9u+NBLVZ2rMXIVi36zGNgFpVqgIPiIPsfFXPRq0ssXmxe7?=
 =?us-ascii?Q?a99iy6FROJkWtZSZ7klWINnf4KKFBbyga/3s1IlUXM6mQaTQUxRuQbm7Mvtp?=
 =?us-ascii?Q?SPxBBnvrv8VODitACkU3SbyQL2UA5CRvzMwCIKQr0WrrKMpHN/CuMwu4PO6y?=
 =?us-ascii?Q?ZKGc+d52gsYkk3H/7D6zJIDenIekDbjsCFQcng62fr7o2S6IVZO4cpbHXXsk?=
 =?us-ascii?Q?LdT6vQwCnjW0jCQwuZwpbyOcu8B8JlPG7786+24+ls3pDfhwyovcAxci7Gwb?=
 =?us-ascii?Q?ASjBBxFKOOCoX12lyV8Z6GOvJhq5SIqPOXnQnOwc6YlYM4mipXehnHBkd3hy?=
 =?us-ascii?Q?xZ0UFrFOD4aHuf/tZyMho2UshYjcDQVDl3kTf4GN/FS/6ZDQPPaRtQTxnOoQ?=
 =?us-ascii?Q?jIhtlC/rSGnnd/1I8qEEYUY95v7DuIib+EEgP0FAFaZKcYxuDHNi3cWss8DZ?=
 =?us-ascii?Q?StqWR1h1j7BJeviuEcDBZeCiH84eENFC5HzBMuJdlVbqsOBGobnsTpxTR6Rw?=
 =?us-ascii?Q?RjC4XyOxkkJ6NI+qHp+2+ErLs9WvG786A0U8+DH0jXtwsG26nQYX8E2EMF+F?=
 =?us-ascii?Q?UPbIFcDbi7dj7Wu3ATz0DLjIv+dQI9R5DRTefMO1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d694ea2-a151-4eb0-ffa0-08ddf9e3ce07
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:56.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD1+cNxlMGQnvbznuoAIgVosbLYzDa2YZV/6OAePz3eyYxHXBaQHtAbAqGrJoNVj/B3PVMlKJwf04LJx3mRwnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

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
Changes in v5:
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



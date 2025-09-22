Return-Path: <linux-gpio+bounces-26473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09639B91AFD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BEDD19027B7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939A226A0DB;
	Mon, 22 Sep 2025 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B2yMaWOZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B4263F36;
	Mon, 22 Sep 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551106; cv=fail; b=R9NiPKsK6dV8qft8T8OcKwP+Td8hyqkY0tP+sbDjMIDny2zUKrJBp/Q8Lt7UNsm22KMjwjTIX3TbBL204tAGC757NW1qtuYntKIU76+qrKB/YdUhVZ7bFr515QGi89laioUP9lDx/1TwsHq3rVjHgEMpY7ylvlgAXSRGDfo0o4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551106; c=relaxed/simple;
	bh=JjXKMejgXm4Z/1lTx4I5dXCVkGrdmfGeCvWnHDOvQ6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qO6L4wJFJMaWVehLk10kzr7LXV+9u9Cq8+yDnDO2dYodEl1N8gVyOWoDIxOpTaN2Rs3aNp7G5N1JV0vIbnfOMF4FECnxi+TEmKAm41d6Ht7TpfOTwAugiSS+lK7FcNYRfNbEKwpLd5fLlQPDKaB4eYGnzxVQz/h/zcr4oLxFuLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B2yMaWOZ; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufdP6PpKEapkZKQWSin6wCjquUsNL2x3udujBTSH5JA1QmepIXtivdhWpsbTw/ozPtauVQlnub38cu1e/ezbDVFzLc8NUSWMyQWegVb1C32flQiLBakt/ZJpXKm9+YcvoNSIdLyHYuhsLaJzDUpWJ5FaCJtgxmVHvAPLTV9/ISVesXaJBoe2KBnLY+6/krSfafLfMdNBYr986FLVAcaLkmNP03d3Jj/Mr4SNVEVsxP88YRZe2ivqZ4quSxWceWD/lM7x5pC13oATWj2atJwAfWqt5jrE7qYk+4FQEgcwO2abCqrPKjtmm8QBSQFca87AiXuyxU8czMebkj5gWE3gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STPx9HO5IxVlEsDbn4piEwqNF0YeSUGVlU+wF/0hN1A=;
 b=iIX58u2T7wZSefmOaLSshngT++0QAtbOeJJj/U6y8G0RnH4G5hI4mZ6Ty+VYTxvQvRsIfDXK5iFxqKQRqeK33MltUH4ADorRdV8/gVKEqo90A3MPuSusshbqb/ZnJ7FX3+ecxDGeVglWjxCli3S6K6Q3DbnjNlUY8Y6mdeVnxT8kgJPSbiVO3Xtkow7YdoyiYtByXSWZ7sWaUt9Q4XTArfsnEWdor74L5Rz5rw5rbxGstXWsNSPYgscfAPQglFitj4K6gz8qLuAUeetajCYSUz4v3aVm3ANOrfVr0Ma9AM+78nc8Zi9TQv33VAgR2DyARSr4u0SGF9T3ds47p44qBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STPx9HO5IxVlEsDbn4piEwqNF0YeSUGVlU+wF/0hN1A=;
 b=B2yMaWOZJwA+S7JVmUnmNFCbdbm8dgPD43jmGUCVUthTji4tvNA8P4yyHl+SEc/FRZiYSSznjOvYsweuJZ2s71uTD9ovLu68xvUbyU9Mx0uTNyUUJV8HhpRP+7FG5NF8Ph5ELtZVphQe3ShGuD86BwIJVyGWW3lv2c0ZYdu6VtOMq1PF/mchSgsGRvhlxOooSx5RNeILe4kaTBW8HPUUTkUL2MW+smn8/dk9khCe448fHpCpFa5kloMxD8lpMiFkbZLGrghJnIl00f1Z3a5f7VWjQDrBI4YQo7feO+Ifzs9f+1riJk6KAczE8wF0CXN2qM+ZHbjyIrgx/ODptjQYfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:25:01 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:25:00 +0000
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
Subject: [PATCH v5 12/12] arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages
Date: Mon, 22 Sep 2025 17:24:27 +0300
Message-Id: <20250922142427.3310221-13-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0051.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::10) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 256aad35-4e56-43ae-80cf-08ddf9e3d08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?crtjJ9LpUkZ/JPMIqLwcSgFpQYovYttbDVUgUNnMTzPZ+WJlUz5JJJHreA1r?=
 =?us-ascii?Q?7s1o5CdoZxJEOWJ7S7g5/p35/8lGkOfdX2BPecUvqgQWLbY6rfxcu3a8A07N?=
 =?us-ascii?Q?e1+P4TCroyudilf4/r2dhMUZsqfITyQLlUhw/seE/Uc4FptZVmfGfA2QbFJP?=
 =?us-ascii?Q?666KDuu+nrv+FxJI/cS+yG3n8hHpTiwGUT+sNTchwU56mDd66na8oCH/LJ9Q?=
 =?us-ascii?Q?6oVHNQB+nEzaYoJ8wEhTT8OmMMNN7CUuTSjwxZUxgI2SMzRcSDBu5tQxBoNW?=
 =?us-ascii?Q?RtI0+3OwLgAYIwoIOxmaK1InFZC23DhtI/WRmlIht8Bq2Pew3NYVI2PX5EQi?=
 =?us-ascii?Q?UB7GhzQTE1gKsiC54UX0aDeB3teuZTZ2Jx88y3IKGtTPxVQZJXA263FHlWOM?=
 =?us-ascii?Q?SV8/90b2OaITt4e/Y6mmFEPBq76aiuwTBaZRONSo3TxkzUxZxEuDq6gXOYMS?=
 =?us-ascii?Q?6F620EQsgDejUKcvvZVPP9jvcOwdsUjy/FgEiEn6EYccXXGMr3nhH4PWbtr+?=
 =?us-ascii?Q?DM51jMdzbypg3GUsnaxGcCmX3jwXARdq+gynRMhofXlVgo2qaICwKKrinhv5?=
 =?us-ascii?Q?Jm3ng5Qn6xXX1guwIWDiTbTQZIJ7EUYsfDVyI/BNMwdbMpkC/vDZ/bCOyvVH?=
 =?us-ascii?Q?Xnmfu3qJVtLiE3E4HPPFSOtPBSgp0BOyYYTz3V2aqYAAeRW4t5YogRTRTqwo?=
 =?us-ascii?Q?ZaAVeVv3CwDK0WQ1U7U+j1ACaZ7CLSGBnxTXQomodeVwdj8tJXrRzYl9RoTp?=
 =?us-ascii?Q?vwUqb/EhP6916ViD4H+fd8lrizMqhkCZGGtjIIKm2lyOZkQ2UeCUu87unzhk?=
 =?us-ascii?Q?qExf+h8vlI0NFcp8tx5S8v4/SXQ6xFeygoCgRfbUGSvc3+jgp17PlLVbQqPH?=
 =?us-ascii?Q?+IpZnq+l59WxVMUO1URuxjCvyUUUvWUXA9Nkvp2RHpMEqhHN0f25ZWCQVRmg?=
 =?us-ascii?Q?eXTh6b92HGzeN7z66G2TXYvYOw7F8hQE+st+qjUFq0UHs0cTmy5vaHIcrr43?=
 =?us-ascii?Q?lU1VQXMkvX7R7uyaD1bjpfbe49iCE+UJdI7jILPpRplHHD1xgB/hKZ4yRvSq?=
 =?us-ascii?Q?8Bh38fUCz5dvCIKtHXfgtmaLIZP37XCLh0jzDXaXG85xMvHw9w+Cc/YVrBbX?=
 =?us-ascii?Q?uAdi/GbHWLU3CEQq07V/SOj72kN40rAEkQFdMAZHiq74LJbKEnKbWYR6THXi?=
 =?us-ascii?Q?He039LUR6ATUXFW/WIXL3LPJ1UW8pjN2gZUJ6Y93gElbran6Qk5luWX7pdFo?=
 =?us-ascii?Q?ft6sag7F/4UvRCrZfCSIK9rUX2dRVPiBRW/MJyqajlGfhZ6E7kw9U3N0skhx?=
 =?us-ascii?Q?O1ZT66DZEKY4DSH0hvPh2DInh1yiHWMoGCMzklJ7vUPvG1veLbrJE8ow1NpL?=
 =?us-ascii?Q?UeuwEc+YNF0D/KBhD2EWaN3BI9kp9GgQylozWNVqKpS/XlMdWJBa8agsv/Tx?=
 =?us-ascii?Q?MWoQK0NFFA7PJAFpOZk5qmeFt5ZhoUPhJyzv/XzgJHzdF8vY14mx9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cD0+wlRcf89S2yt2cHGp3kzL+Q0HhuGh0kRyXm1rUjAcPf9paQOuNFbn3qgu?=
 =?us-ascii?Q?KWxswNA893ClVaprgCkhelIbHKVS2Em/B4euxTjqcJ1SIpOvpWfYE06zB3La?=
 =?us-ascii?Q?Mu/0RGg8JGaU3xOWgFf2U2rZCIaluZ44Laox5HD9aLBbd6WbHPzCMOO8MbRu?=
 =?us-ascii?Q?neJQVp9N0Hrb9BfooAo5+egRhsjSTfR5W5QM4BVCNEbOco7iq+rllWs4qB31?=
 =?us-ascii?Q?AUg7Tg4epapyhtzJS17Vj8hhJTWmuC5yW3Ieu1Ab4r6f/gK8G4boObDO8gU8?=
 =?us-ascii?Q?yHNEC8A4wZLT3V9gl4u46d5uxigv93f29RmPSLhj0L4CqoBqPxuLAmFaq5aD?=
 =?us-ascii?Q?LOv+fQ/Wd71/HRWEYzl3mBwwRV0Bq4XZQaOs5Rtgsken4UsD3UQiVDpVExBv?=
 =?us-ascii?Q?BIpf1bL5h4whVJZ0UirjrfwLnLaK53Ul0zxqSATJ+iRjV4GQx7CkamTx2yTi?=
 =?us-ascii?Q?+PG6Muiogw4N8Cwl63IWTjUPFwz467VrR7b4bkr1bGgevbgkyIQs6ODtba9A?=
 =?us-ascii?Q?Gty2KFdQgTo5O7t5jS279JDIQCe872TY0hG8auf0hkcYeiqKMOOccSB54drx?=
 =?us-ascii?Q?kyoH9kS2+WiFV5WL5D3cS/LTyvGgAg9w8n+14s+ZQdlZDZfFifjFlYFwYmhz?=
 =?us-ascii?Q?HeK+i2qcIZsFbuTXEQLUicJf147ylKfg+99WDtBt3jlSkcUoorqsj/EioVR/?=
 =?us-ascii?Q?h106LvJ76Hn7z/gkNpAx7j5KzY9A6bZ8HkC1rn4h1wIM4NVX9dPzYCrbtjWM?=
 =?us-ascii?Q?zQQOJ/49Yvtam28p9dXgssNnP0LdP0/Jnmr8u2edwklMxh2sKWG14RMaQKzX?=
 =?us-ascii?Q?WQsJ0jtvGFEbN0qwFDk5QF9d0SvKJtG86uzT36oah+jAESNRl7adYQh8JDfY?=
 =?us-ascii?Q?RRoqtIVrnnGJMR9gaK2j/4HukLlErvvaNBRw9vyGjsc5CTWZlRmqBYTvS11T?=
 =?us-ascii?Q?sjb2YurCgB7eYj+3hOc3EER5g5LWWQSVJkV1BAOlQQbWzdMmW/8FCPmifQxG?=
 =?us-ascii?Q?vhLqotfASRLunR5HHgJqRsbRYRKBqcNFanSlGnx51tlNqkJ3LNcV8ZAK094I?=
 =?us-ascii?Q?rsrAtNcEYmYdqUNO+aaE9E4Om6WjSMdt+LbYQ3PKlx0/Ki7JZYMmXz9vvtFK?=
 =?us-ascii?Q?BCDP2RGMSNn67d+MNvFm1tOoM9vk35RFtE9QyUgTBKjdVLNR6AA99be8cC9A?=
 =?us-ascii?Q?noX9dgeWmWjrkvIrf4RGpGttBipCi+0i4o/4I6mc72qc/xdBQoyeCdLoRirQ?=
 =?us-ascii?Q?asNDmkdYgPaZbAPDD2hKlhdrRKs4cO3VoXjZvWCMmF0vOYoEBX6ILTuktWc5?=
 =?us-ascii?Q?f33XlaAJb2yZzhLAj9pk5a1MJWB/OGDHQBkSfEVj9MnpzmRpDkbHqll8Dc/0?=
 =?us-ascii?Q?S2f26N5v7QFCy1F6xIntuQN+xXo4I4WofSOkLM1fnjG3Zokus4aOr6nviL/8?=
 =?us-ascii?Q?UwEqZ2mIyyy8IH6uuyom8j2y8UL8BSMbnun+3Lz6jb5WG5tnsR1EqMUN5KY6?=
 =?us-ascii?Q?cv7JNgLae2IugbLfMD+o13sOS+z3p8YlkGmi5LrwNaahsTzGrUY4dZBVJPVG?=
 =?us-ascii?Q?NobUg7jiCXQAKn8QjiRN2NF+RndX/pRJk18+np0t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256aad35-4e56-43ae-80cf-08ddf9e3d08e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:25:00.9402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ucr5INfhFbQ9TjE49eFBNnSWtrFLiz5vPAA2VVLIK6HbeztXgpRdoLcMgcd9vunwxSLkVDL5Fj7OjNPkNUpybQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Describe the two SFP+ cages present on the LS1046AQDS board and their
associated I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- Moved the reg property before address/cells-size.
Changes in v4:
- none
Changes in v5:
- none

 .../boot/dts/freescale/fsl-ls1046a-qds.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 812cf1c5d7f4..48a6c08fcea8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -42,6 +42,21 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sfp1: sfp-1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp1_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&stat_pres2 6 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&stat_pres2 7 GPIO_ACTIVE_LOW>;
+	};
+
 };
 
 &dspi {
@@ -139,6 +154,31 @@ temp-sensor@4c {
 				reg = <0x4c>;
 			};
 		};
+
+		i2c@7 {
+			reg = <0x7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9547";
+				reg = <0x76>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp1_i2c: i2c@6 {
+					reg = <0x6>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp2_i2c: i2c@7 {
+					reg = <0x7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1



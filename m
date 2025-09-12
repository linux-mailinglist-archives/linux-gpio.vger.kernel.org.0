Return-Path: <linux-gpio+bounces-26085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4DAB5553C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 18:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 523A55C0070
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0051322764;
	Fri, 12 Sep 2025 16:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O1v/nwz0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F1732274C;
	Fri, 12 Sep 2025 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757696384; cv=fail; b=eLrY3Z8Dp+rhTmYw4d2H9pfBLrXFYiBsNii7UpZ0wlNGJpSseM7eyRedY18jRtbeZcp0p3rUsFqM615N1sVXKWMm1f5/2ZuIPgadDqDaGNsnbZ96PtQQKVvFOVVpcbh27MMMkc3yD4dJMtyoKTnxDJgVfuBFo/pSx2Lj0tt29uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757696384; c=relaxed/simple;
	bh=ko23iXVaHZkbtBHfvtDMtrd6W1dIPx/lyjF+xoqvFP8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PysI9nc0CkJFL2dy79DoKjK9+YPEmBtpl+VrA2nkUNsmubxff3cZtaYCs03rlMhqfoYTNVNkBY47+AJX46/od7cIZ4fKaaH54pFI3OFbFIERANj7LiHDMt/Sny6KoQcoiuUI5mzHObjlqQDMYrnelXHSdQV3A8g7RIFm+byDaxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O1v/nwz0; arc=fail smtp.client-ip=52.101.66.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fa4lzz3485pRiFY7SEH04LMc5WZ2b4beyCmEAFPOJjt6FTkBJcw/WlGlDmDOlcJBzHgSA/DWLqywnvdEHbSjk/uUMCZp2r6MvJkJ/3oGp7ah3mQ4xQo22eK9L+5sO0KUvW8utssGg7wxnvrdN7VyMf/yOUry5afRg60DyaEDZqnpHfJCvdLAnUn5Ww851o12WUh5xNRg9PhJSYrfRKObIsSKbpmLz64TYLqOCqpDokS+fNYFlavzTZypZ3OuHboKjbchtOSMuOrB3jXhMbdjBisiHNI8NdfZiEk6x0J+b3nyJSFYCeqFx98G6oyvpWADbfYeTgavzyVCXpe6YX9wxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qgP9WM8gwT2RRg9snwHy6Xlq7rctu8sbcssGB7qrlw=;
 b=nAYgln0de5NflpaSs3GLmaq0rA3IxtXC21SmPg/Q4F0fpk3S39eaiQltTTPJrfkY9iclm4fOJwxFkQX+UQglYCS12WMNyghluvzFr/Yph3+qujHdeBy99tScht/YusethwdNEuKfOprtmTAYN2zBidqq/c0sGBkOn0+d5eT9h+eJ9jxCbHsRYa2qP79iI63K8LX2dqiN70nZGUANQNUDjkvnxG0dEeksQAzlvYL532+16ajJYUIls+7UcQOxqElEfw7X912nLPnUr/WqNyPBkVhifKULguR+UYCIlnXjnsQffjWYbcT474b7PTrPUmdxpIbKSIj0CQoGKT9Xyezffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qgP9WM8gwT2RRg9snwHy6Xlq7rctu8sbcssGB7qrlw=;
 b=O1v/nwz0iRExHEwxKhLAb0vO1g5M6XWPWSqRyObLvA1QJMmRA5aL6XxBQSmDr3GSAxD7s+Tkewuhnu+EpcqOqtEyF33ww4UuWPg2IVHdtqoS+rvkksOvMR+xfLZw330QkRXQ7dT9WxiFt5aY+wD36YzFEi+wmS1K0zdYhA2P5VPNKqaWYlrZsjTZATShvTbTP6QBy6wE9zsjwyytuTfj+Prw3fZr+tZwxNkY1JSu7UucUuNISVpXrmqVuVOSB3W4PkEmEpCGEm3gZzqY5DSF1teCiBDGbSGs06HPYCuFlg0LZNvgQqQkf1rM+wJoaltZ6ILfMW2r2DYykdWsdtWcRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB11488.eurprd04.prod.outlook.com (2603:10a6:150:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 12 Sep
 2025 16:59:35 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 16:59:34 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: fix trivial-gpio's schema id
Date: Fri, 12 Sep 2025 19:59:16 +0300
Message-Id: <20250912165916.3098215-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB11488:EE_
X-MS-Office365-Filtering-Correlation-Id: 431cddc3-70a1-4abe-5710-08ddf21dc020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|19092799006|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HojVPpMRnkv9kYQ9LWHLBLPXJZxdI4HTMXbFWXCQjFfz4HJ7Ww57UgV7wDar?=
 =?us-ascii?Q?G2omAcHQEWK9Net6p6M/RbLINYfjyyeynoTIMmVEXEF6BqTW6BrpZTxoeFYo?=
 =?us-ascii?Q?ruq5OATQD5EJWWIDmEfv8+A+ddGcRdyM15l9z/ZXACJEahh35BXP8PmXFK8W?=
 =?us-ascii?Q?uX/GC9w4dKZurWGdI7wfnoB0ncAU5Fy1go9Dc3jnJ70g4BccqhC24ZFQxc/5?=
 =?us-ascii?Q?RY5euMf3XuUgr+GTTQDLfcCDChFVflI/DRrlsh0OjA2vPC29ZM7uvPKYZZ//?=
 =?us-ascii?Q?Y/L/5PYR8hSsEMU4mFvWPTl9KXNHPMTY9m9pk12NKxV+nTCevqa5yGUvxyav?=
 =?us-ascii?Q?Ol5gM+jYLd5V6ImXNS2Iy0NqSXwISAvEeTPYyRyzgB4ARkjUFlBzrPte1xUd?=
 =?us-ascii?Q?eBfHd/+QuJmUUcbnOPCqQcgW0xjZL33mreD6zvFKu4Gpt1vQCTrc3ayGtW1S?=
 =?us-ascii?Q?ZKPCLMoCUILsQ0kU2NOHvmBtZogJUqyDVwLy3Rp8RlIA7AEeomLsp2AaN3EH?=
 =?us-ascii?Q?hqEq1SVTMSQN389UOXkoze5JgRIG4oicd7SDrcSckxpLgarh9/100qXK2yNY?=
 =?us-ascii?Q?lo0StrHacBeY9tVB5txMirfDzK+z7TktpnT2NTPSqPqSCQeqQw0H+uFaCQuz?=
 =?us-ascii?Q?RR3KSSP7jup5LoF4cWlZyRaYUkm0lC3gBqwXsvpGNUBks+31fty69rLrkAKG?=
 =?us-ascii?Q?0zaUAoMVoo/E6BHqtc5EZPNuZQHmcwonLKiH7dgAwqgQHWxsxna10v+GcXb4?=
 =?us-ascii?Q?Mb58Ay9AQ1zgZ27CQrtXxZMCn1+bOfFD3JESPzOfc7AxkS4MFdbzbJW2QsMA?=
 =?us-ascii?Q?pz9Zu5ebGZFLM8Dr1pDNhrOnFNjqWaE4LYD+p/vq4HGJjXWNolSHZWGhEHGV?=
 =?us-ascii?Q?cpMxcp5ofJ9HgPk6XjzbNJGx6w7F8jui0nb3OIWeSSoweQZjBnAc3gjVQ5U/?=
 =?us-ascii?Q?BHWEBZsPQ399haQxMsjliQomdu57EvDDubyXrQykB1lpXn01CBDOGWKZYkas?=
 =?us-ascii?Q?D/p5DohUDHfVNm5P+kU4tbGxyI3jlpEOf/6hm6Bs5YBwqr176pHE55x3sR80?=
 =?us-ascii?Q?end/zCdph1VrTuIj//Ndh8vE8P8onfykDXNN++LKHNmPChN9VLt79j6re6L9?=
 =?us-ascii?Q?09jBj7kbbnonZKt2cb73Rt9gRa3xQw7PplppUit5egjc+vqdpPVa64rAmmSF?=
 =?us-ascii?Q?CPQ0U5RAxKvJ7rYqxAbfmwckyga4eKL78TrcKio0I7I8N646dMv8fDyYKRhq?=
 =?us-ascii?Q?Aqt12k52Asvja11H+FC7loj0tEsWQ11VCPvVPQlPuk8sZA8L1GjQce+sPUHJ?=
 =?us-ascii?Q?09IT6Ml6ccrQwcv8Fqb5G6N++uuyy5gXYCxb9J+pUsonP8AHJQVxj/T1NaQR?=
 =?us-ascii?Q?4ziRXs1yA4RyLYB3s+ZLV1Y2PW/a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9CW0wbrKBuf8ZpPQREH0MhkqRQwHE91kSVwpjBKV0Hvca/K1F4iZxUq7hBDm?=
 =?us-ascii?Q?hzROcB60MwFCFjubKyVFVouzgygpvf+A0ZNV12JtzQLouS9FC7syvBOKeYSR?=
 =?us-ascii?Q?DgR6cfY2WbkV4tDr7E3XeK8Y8RpQ1xDVgWdDYi0u9vVpllzEtw+3K89G6NU2?=
 =?us-ascii?Q?01wej9DhUSbNsUjan8ZZ0SylzT4yGUrPESkJAxq49QcW0Fe5czYs4AM8Om1+?=
 =?us-ascii?Q?nAm3bfDel+IhxBULf5wWDb7UPErmIwAo0vv5TQ9IUsbmUgoE9E+W5dcZKapJ?=
 =?us-ascii?Q?a+wEn4AVEuFl4gTpq77NcEW2Bjscxnt38LtFz2Io9MQolzgqKKy/m/llEyaO?=
 =?us-ascii?Q?+sF/uL3qn46Yhm9Chsi399ZK+VCHwJYwGAXeGT81TD1Ti0yYCJzEvBN4CB6W?=
 =?us-ascii?Q?maSRyA6MUfVha7IMLNGH9NMXK2tVX5XaEgSG5zxrwKiB7m1CjVLNs1nLQCSq?=
 =?us-ascii?Q?sh/954obvpnam1WLVeMe5UETHKg662HxLse3HtKpXQZhJl87JDp+Zw+vZn9r?=
 =?us-ascii?Q?MjT5s82dtEzlO4M74VQLGA9GnkptfFfvrcfX8OiYcs2xuw1kDMs66k4Q5YHe?=
 =?us-ascii?Q?ZBVzGKZ2B2rNVbAYQkCrN5LNiSQwn/2najs8Z72y7cJ0HVpHNfcx9Xua9q/M?=
 =?us-ascii?Q?dIJvL3XEX4mLUc6lQisVvwqnLT5UOmta3s1x3PHVMlAntftPDKjbIQT+MM4j?=
 =?us-ascii?Q?JXygzb1/M7jLGj92iA200Eo7l2GZcy+nEZKNhvy+4FSfluDPUoaq7Rhze9tC?=
 =?us-ascii?Q?pITjHvNKmyDXmqMjGlWzkbufjHoupi0cuZq/2C84h9u+qTgC1Xv94hQrnvE2?=
 =?us-ascii?Q?ED3rZHfgpSakFom+KqU9oCgAu8vPTCoe5Dz+3ef3foLYrzh3MJIil3LB/m0d?=
 =?us-ascii?Q?NwUw5WfNbpswU3ZhjY9AIVnQtfyqgpyvRlIdEln8ZQFl8GkoJ1GtJn+OHJqz?=
 =?us-ascii?Q?ualXbwfnvJl215vwXJv4MNNlxTMXFMmZSIJrPqq4qQBoILRyxFi4YWcWbhYh?=
 =?us-ascii?Q?JOWlKMOXZtLVr5Vd+Iz6Np4VjerufN1suEvDYV4Y5rvfMoVyPMro6qQWbDvE?=
 =?us-ascii?Q?5wpMcoVDD0bYuGV5oiLAEd2UP2SIvh5BvBupX7qUBs0ThaG304ZZpiCO1GLX?=
 =?us-ascii?Q?PU/Zm+j+cfZABMImlDEkWtiUo/FdEHsohaa1EwJlG35xkxrSOuw+HbRxYdG+?=
 =?us-ascii?Q?EPM1hobDEdxICFyPgy7T+c8iS0J3/WktRgcBhGv2V1ga3QAG+Ekey/99Zw6g?=
 =?us-ascii?Q?j5gG5YV5SHZ5bprWkUJEDqsSjvc+8uC+jpHjb8GuldfRR/D9+0ySjcGEu/IX?=
 =?us-ascii?Q?1DnIYBrsmh7JsSd8vwfsXkHuEVyFWCTp7ZfH+Snm4i7iJhwpUOxIOp5mfO3g?=
 =?us-ascii?Q?fIphtKUHBb/jHjxJaaYvRnHo9u/z0TmesMonIX5n1bvRaUyL4DKWRcE8/jg0?=
 =?us-ascii?Q?sUHy31rjeuE4bw6MM/rkl3ndnq32WBxHFiDwP5VE788RjGbAzQEJzuaHER6a?=
 =?us-ascii?Q?Wvhg0HFS/b/WK7qn3206fxZcjmbI4yNC59YEjMD6oUAqpITqz1vtwRS8R15T?=
 =?us-ascii?Q?qNVwQer62/Dz6ys98+X9N36DlEK/BP+Or4qgBFku?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431cddc3-70a1-4abe-5710-08ddf21dc020
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 16:59:34.9103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aah1OjaWGn7DWAllDszCNt44pCCcqi3GqEqGZ1rdHRPbWokCWjUg6ZwDTnDf/akTdCFbyJBrxYcplK/NayXUgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11488

In case the trivial-gpio schema is referenced through a $ref like
/schemas/trivial-gpio.yaml to match its current schema ID, the following
error message is displayed:

Error in referenced schema matching $id: http://devicetree.org/schemas/trivial-gpio.yaml
Tried these paths (check schema $id if path is wrong):
/path/to/linux/Documentation/devicetree/bindings/trivial-gpio.yaml
/path/to/dtchema/schemas/trivial-gpio.yaml

Fix this by adding the 'gpio' folder to the schema's ID to match its
file path.

Fixes: f03a7f20b23c ("dt-bindings: gpio: Create a trivial GPIO schema")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
index aa3f88adf91a..3f4bbd57fc52 100644
--- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/trivial-gpio.yaml#
+$id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Trivial 2-cell GPIO controllers
-- 
2.25.1



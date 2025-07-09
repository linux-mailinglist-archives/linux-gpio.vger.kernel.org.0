Return-Path: <linux-gpio+bounces-22990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94EBAFE7B7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CCB47A7A13
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC902D780C;
	Wed,  9 Jul 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="joFTyv03"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001FD2D6620;
	Wed,  9 Jul 2025 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060464; cv=fail; b=Oj4Nv0yflYwrJ3hhTOJTsu8uD9GeeyjqUO7tPErcm9CH/m80QsY/uXQuh5i/ht1q80aQPR67YIajXjIu6Dagl8tvOVIgSugeHasrAttQVpAITbA1yL8si/kxyw+G8D1pexCT1pPEuUpCw95eO60aKhs0cZTb9T+bnpn9LU2eHuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060464; c=relaxed/simple;
	bh=l7tlAZB7vTIGkWhcbcwqQmbOc7QR4qI1g4CWSJvL3jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L3WaKknIC5Am4vkPRwuJP0yhE0gT1XtWV44x+30+55KiJ4s8Eg6U8YUuYwlM07K48dbmQZoXIwzNwAB8gZhkE2zZYB6vmmMziQKHDrtfqC8mX3f3r5n0poxMbru7xygJaOs/ZRFY6pYrrlQdh1OijbfoMh9SCzxVhP0a3KL46kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=joFTyv03; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlcaRo7/6bE5junRhC1YNVNV/AuCgww4F5fxmQZX/sjh2CARJEqpmaUusTl03yTURoR5e4O4PQplOn/k0VCGIxpTL1I0wO2u9wDLm6C/bJdgjS/XVwGmKp5t/s0RQ/EjWMRpdG8qCa6ko8V13gp6/zaf9xlK8aHlnlaRRgF8KAvUoG2HBLkgueyQnMSl8ZqdHeBuN//lfKYjeZcPoB2CzC4kN4a8EIBG5J39fJ+ecLcy+XZtEUCamwXKw6Fym+XyAhDrGTY9w2gQMxVsncY7KjkVwBrKUuFlcFckjimIfcHvPJk6nGN0Qx5TPWPG3G3lslgI/QcnRqxhRv3r99bCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8huOIN4fnptz6ryZgQQsVh6VPpL0TkaQI2GV7Oq4hI=;
 b=A+xAhncTVGQIzRReOVmsT8rRWqfvfhpOIkL/shUwpWRz+hT40YKLaSAEXb2dp9Vsz+th1Iz+SlWBfG+2dq5t6/vAZTbIau56VbrQ+uX/aze3cNihYQx0hvNL5qrXHIWP9zDKpu6PQL6qXlB+bYm9P3uSgIck1A/PZD7DlSFBR8GFmw6Wwufoi36qCSV4pjT4vaoVpRCGuPwOXOOYLaLgw0LO+drVL2VQ98C6/jqKaN0iWD6LW3YIzNK/SXwTCnrTJJTNBFXLIiXxbMYi7Y30nB0gXH4oLIo92mcqwm3h8uftSFf5nf9zPNlxhVQLQLKo0HLdBDMVEV9EP84QQ0ksuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8huOIN4fnptz6ryZgQQsVh6VPpL0TkaQI2GV7Oq4hI=;
 b=joFTyv03oiowsCW3sdDyB6aP1lbuTWyb+CI0GUZqExCpTVjzoTXI/LxmMddfL9uIWEnNZncRfYW9AQGlHZ3DWcmTXuRLbjq/FjaU7WnVnquXTbyOzFS1sDyK0bNHc+Kj71nChBfhuvnIUBuBBUHEzzvuuIgoLSvZOdmIIlsRVNHaVyyyFkkO9CpNUPeJoI+vO4aKNvjg6LoXwzzwdVOIM609zgDKlt/pnr9Vd3tVf326qMz/m6o/ogaY3a5MsKrkE4jddpfzp8VJsFEELEESNa7O0b9VteKduLJirnsnSfTNFwF4JApXkSHv5K94tvf4CZAgRknMBCa3k+EnBVUdAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:39 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:39 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 8/9] arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
Date: Wed,  9 Jul 2025 14:26:57 +0300
Message-Id: <20250709112658.1987608-9-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::7) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: b399432d-1717-43b2-eaee-08ddbedb9cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WbKgpQDIXwTgCy0mCOVuVQ15/A7Tkv5nQhFE1oSgmIo1GFN7Rv+ECmojkJOM?=
 =?us-ascii?Q?1Bk5yU/oWONfCpVnUceqWTzjNwz+KjoQdhwPvzv87t4Om52ZAMDnXfrqoUZG?=
 =?us-ascii?Q?A2bCyoY4MFXJtkCo1enuN/xZCjlhG1HPC76ZQ5a0X5SaJHSc7AMAzrcsNmeW?=
 =?us-ascii?Q?7QJPLQT74fzv3uxy9JJUpdYRlg7xwSG0zXNTRVDBr/rjPyzl52kqIlsVjN66?=
 =?us-ascii?Q?yDnv8pE9DmZKWjQflpzknCvfK4Z03GQSrq8l9BZEEw3rG+zEpz5DktXrQwNf?=
 =?us-ascii?Q?BW1iiJ+RQFeBfLQIiUqru0MZz+71nu8kgfZN9Yk5zGqTl1V1UzVjmVwUtc8z?=
 =?us-ascii?Q?etbssz4zVcfjS76WaV3PS4LPSttIFyHmwSVC6C4YGYYr5VIpUxPEEcJLUAEe?=
 =?us-ascii?Q?JjsdYwUg9CSvMbkr9mAhCMT6gpgt2Ne2aiSOPhNzJw9/TKeKXFrSpbr5U1E/?=
 =?us-ascii?Q?5sKpwlp2AKzcKb83Og36j1XnRf9LL/WB4fcYiPi93VK2eI7/6ko9Nhq000RJ?=
 =?us-ascii?Q?weMvNZnRTt0ibyqxVp++5rtm6vlnp5FEw+ygibARRn9Mlm28uHnhjQt7zW/O?=
 =?us-ascii?Q?Gof8SKJkZG+YLfnSIeJF2j/q+85DCZsy3atV9QJwuZMQHEoujpE8/90km6O2?=
 =?us-ascii?Q?8DxMoMfkRrwT2ildh9N8NykHpx89Z26HqzzspmGyhKuC3VyxoP316V8+pSsv?=
 =?us-ascii?Q?duoauufZD3IJlJSFOE1/EeKbYgLb26oxAVpnyDDeb40KUa7eQjw0Yscvy9vb?=
 =?us-ascii?Q?hmdPb6sRCCCuuHrvJFB5J7sEyALd3godfYEyAxAWr/nZK1Spwfulg8MBDHfG?=
 =?us-ascii?Q?7O+pr1VAnBJSFrJc87zgGQFxW+6io7yUqBsfKQ2ePoMCo2d8kV94t7PNF4I/?=
 =?us-ascii?Q?W6w2C411SlKBgq1TKQ5tV2srXFXnUx7R4j87jNv6XBtvOdjG+5xz/gFOw9bA?=
 =?us-ascii?Q?lR95XIBnLklzhZysFwQ2BMlRGSK9xT4E0nxERkvuWqcs8LvJDsOe33ozBt+y?=
 =?us-ascii?Q?rYo9QCQAR78/kfOyralMLGfFdMa3EkSF12SjFqXQIF84QpPKSjcg22HJkM/y?=
 =?us-ascii?Q?YibAOhjxy5iJtxsk8GNYrATi43m9CdM229hetWdnsCfXNmNJY81i2dxCs/BQ?=
 =?us-ascii?Q?dLfpPPuLjMYkHX6XO/lINTbvZ+DrH+vKVWpY4PSgLEkWh269GGmfes/3zSRP?=
 =?us-ascii?Q?38XUd5E+rHkrlxFdl/Ew1fhIgB+kCXCorcQ3prsHbEczrX/XpG6Hn8i7/00V?=
 =?us-ascii?Q?E7WG/phTFRx18R+GZXPSxw+8cjM2m4+QJruovDa4UM1PnTRh7RNYop0eYj81?=
 =?us-ascii?Q?Gmjqi72fVGhUe8VJ7kDP6WyhYCr9kHTJH1TeY2vRygkrHs5lb+ZM8en4Brcv?=
 =?us-ascii?Q?fsBP2k05CG3lueWX9dxEJcAC0N/ZsNJpwckJxgF+U8u5gLAmd0+zcof7rrwN?=
 =?us-ascii?Q?Y64iMI0JRD4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k6Mz9u3aA9DhKR/n1HhHYIl/o8+oOScKANZ8ouBxQppN6HL3EMH1H4SZTPYX?=
 =?us-ascii?Q?Yl4mh2174cTWtySplX6LBcPLn8D4oI+tSrOZdsQw7WaiZlGnQ9p18NQfLDPw?=
 =?us-ascii?Q?l0IOlcZsdcduwaLdkKT0lm/bTPuCxr62yZWl6x1mLkKuC9w2aOf5uHOWOgyW?=
 =?us-ascii?Q?5/pVmw1E/VBGzvxtland8B5ujGtfWSSUmczc51yQnNz4nEULNetTtsLUST/+?=
 =?us-ascii?Q?crOuk/UKlMZciuP/rDXPIA191r3/ovnJj169VWi/Cj0rBLVf8qASXzKh/14Q?=
 =?us-ascii?Q?pfbwssRAKWwl523rtsYvY/zX7UQGPSnSf4t43rcIn8ETEo503gQxjXziNj3V?=
 =?us-ascii?Q?Lh1kRNn3L8w1I+r4Q86UZeRZJNXiyUOhu5Z0R7aeKL5U59nQI+uXtqVIGsF1?=
 =?us-ascii?Q?Z+3cjVDe4SmOcy10RF2mx9YaypPv1slCybrahMre91/LNl+8TN1HrOjSk/CT?=
 =?us-ascii?Q?dNXc1GVAa2w+VCHbkefqGro1pPFNAv8nRDRykoholRudOyzE95XV3V8jY2O7?=
 =?us-ascii?Q?B1XZvF5WpG0Uu0wZSG8rAdfrx0/iQnfKtBO0AUNCVI8ngBcpLLUYkVCh2jJD?=
 =?us-ascii?Q?0jNM82iqo6rERiUgoG4dUpYxZo943NaqXAngxHBOqH6wgsgA3bs+LPgTXAqu?=
 =?us-ascii?Q?3JgAMV4a1avsaCPBsI/Zx+l5OWWZiscQ3Hui9SI9LOP3NrjpE0nhP8sdMvNK?=
 =?us-ascii?Q?eM9vwE0ThgqCl3R1kAseMfeKz1KvaXHjCGwCDZSESUfSgRTLL6/CTGcw9kMJ?=
 =?us-ascii?Q?ZpQOy5TbdDdxdyRLxtxYAmPT9mhADGKb1oFa2M7r4UI6WchBDtRsmVuARzp5?=
 =?us-ascii?Q?b3rMmzfbRNz3ZcSFmaMxkD5kFu9aWE8kbrNhKQaZi8DDD7ipGM3lMLRpGRlG?=
 =?us-ascii?Q?Vg2kPW+uOnxbYMOvAI0CKcsmsR8cj40cPHVRdBjCO6yafxFMJA9hk+sOUsh8?=
 =?us-ascii?Q?zPLwIu0mS8PCkDDByf8q8VNOGtqXzGsxYt8yBpEGUSWuOCzxGn2oA1797Oda?=
 =?us-ascii?Q?F1pz8zm9azi43RzuWxHkciqruaXl//ShusDf5yniPJeaV7okMjTDs8nzZfGh?=
 =?us-ascii?Q?obmA/MccktcjVamn2uxwSfZsKkDKYNW0lVrfjZRY7B9bjZqtlBWGEawnriLs?=
 =?us-ascii?Q?X8WZ9nJXZTKNgCiwVlCHCsjRC8h9Yk8VLGNkmOZc3ttTRxjzdSMvdnL/Yu3L?=
 =?us-ascii?Q?UVSy1R0OAd+394ivQDOH8tPSdEB0f0EJg0Bk6M5D9EL1DvMaHRUlsHelHoDu?=
 =?us-ascii?Q?qUdBmIQoZ2mFkHaQ1gLFgezWmi8r/oRdiSmBDNmYnR2ErrrVGHyDLOGeHfrl?=
 =?us-ascii?Q?h+0NEbhxdtqPUfKDJuzpH50p1aEoV4pMtbHawXgtao8W+RNxpP5vV7pa1RNJ?=
 =?us-ascii?Q?X/MpWFsz3aPFLGi16vklSkOYRVndGj5bo3pMFipPxXXitB7EKXA6KLLcHcjj?=
 =?us-ascii?Q?yos/wBLTp51nh2Jt9UAVVLyGboUNtwvPTOnl7xpSoMDR2nQkUSotqV7/cZ8P?=
 =?us-ascii?Q?XJekrubUEqwIqvF0UjEm9z5H2TsG2E2y0aDghPYqb2PQVK8lqv20mdy0RlX9?=
 =?us-ascii?Q?PNhnUpjpHz9SQbzPt1hWcyLlmLe7VUU7szjJs3Y6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b399432d-1717-43b2-eaee-08ddbedb9cb8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:39.6188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqu1xObUjPRFUjqMy9cTnlPOqySOJUQZ0BIMh3GTR40eLBMC77q/VvgH2EyK5LFtX/1GY7dbfq7idL2Q+Om3sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

Describe the two SFP+ cages found on the LX2160ARDB board with their
respective I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 8209dafd7768..762c38fc6fa0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -31,6 +31,26 @@ sb_3v3: regulator-sb3v3 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+		tx-disable-gpios = <&sfp2_csr 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sfp2_csr 4 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&sfp2_csr 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp2_csr 7 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp3: sfp-3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp3_i2c>;
+		maximum-power-milliwatt = <2000>;
+		tx-disable-gpios = <&sfp3_csr 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sfp3_csr 4 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&sfp3_csr 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp3_csr 7 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &crypto {
@@ -236,6 +256,31 @@ temperature-sensor@4d {
 				vcc-supply = <&sb_3v3>;
 			};
 		};
+
+		i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+
+			i2c-mux@75 {
+				compatible = "nxp,pca9547";
+				reg = <0x75>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp2_i2c: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+
+				sfp3_i2c: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1



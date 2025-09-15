Return-Path: <linux-gpio+bounces-26165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F9AB57AE9
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88E393A8C29
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA219312816;
	Mon, 15 Sep 2025 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BrJbgwqV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE8A3112DF;
	Mon, 15 Sep 2025 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939112; cv=fail; b=RkYBkoO/P5gIfUM4yAPinxRYxIQXS5FH0HyTJN44v1y/s0U8qtGC281PFejIN903BXeMWPrfVb5y565wgmYLVQQu9VAn2dLcYSO6v53zbeMaDtK3BhGMGHpx1eqWPKvbkY+DY9vjt9UBapXi2ywUEuTm1n0rLTlf267cFIKl+WA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939112; c=relaxed/simple;
	bh=ThmHNePeedPqD0EGnaPo78LvKE19zkojQ4zk7jJ6TKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iXuo0x/6IGbGTvvuPE+vgwx4Rn21BXfSw7NE3fm3rPfS5dOSgQ+Z5NIVjOLduq9jwDKjRosY/JQIze7BBREtaKkwq3VH0QKa8tXpG+cwzyMDXIs6QXyfqRvB3Q3Qj0TVvm4BhIVlz88sqmS+24BSs57X2MambrxlA20ANbwqTP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BrJbgwqV; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lp5P4kDy0SWyU+hATTDp7cYRNyBTR2ma+Zhu94gaZNVRpt5UJ9CrI3Vy7k+ByW/E0QztJBk70eBVnVKm/abxI380BD/7bFEEtJ5qjZJoEcY0cBcOQK2VfnKPQLZBiJFulDnSI4aP3Jpqa4B6AF/AyDuJN9MBDhgxP2YX/gjVWsDq1RYfhl8djoSItyCE1XHvAWWz1X870MwsjlwifAasIMP/Fo6nwJ1Yy9cjkDATSJmfi44S1jwOeTHHyXGyUYVt5HevGOQZtnID2jqNrgSEhdw2W6ppQkrfZFKcEyJrJHvzuJyKZ5iySLZzi0ms5vPDdgNU0xBiQD1wWmNfukV4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRkUF3ep3tlUpGuOPPWVkXbz3CsvKuqRoffhm55LsnE=;
 b=PSlSfX42rMu/FqLNHbaNcwdXidlx9M5JMa9n9ODjK1l2eyf5I/2c339aU7Nv9BqigKAC/pnxA+cumXSe6+cltmv3oNG4Z9mtw79p9hm02IyattB1wx2YuTsy1NpjGPutaR6zbJFaK16sJb1F/LGbZrz7+pN/0gQbaE+M0+wHNvAYzqIFiTJkIaaxF5Q6CqoFy3dIMX2Du1OFNBRxt+RN6EKM8+mGJ5uuZ043sECev0QwvBWd56Kd2LWba5gWgMjZuPPblHA2u0XIrWnkAfsMxILSdvk/rEXt50tJ8/q6+WILg/fCpG/rXX+GMES4E24b3JKNUwl6WWJ6bULblAmpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRkUF3ep3tlUpGuOPPWVkXbz3CsvKuqRoffhm55LsnE=;
 b=BrJbgwqVVw2VH2Ar/2xkH2kxK5CIS+Ylh1sn3jC+dsFVS38WhFEZOqgjswDD180DFKprWr50IqzjNpVk2uHKDCDEHkxxhe2lMhzlXwul3pD4z/oq7SZ1AjCmzcvuBszPTQqBdJvzv7///oJDa/vGxCa9TFQk5uv6Kl9tcOd1BrHNznfQBGLp1vb6DUqMqKC0yrwlnVJbWXXHXNI96bj250eW4vxa+A6fsKbKEy5/8kZDazuRliaICX+CHxJYoyhKEdoM0FJfGNhOI8/mkRKXK7u9qh67bahMtinDGSOqCGVVi+cRyYupU0kHk87Qs7CgvkINChPZHCb9tbwJEnKZAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 12:25:03 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:25:03 +0000
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
Subject: [PATCH v2 8/9] arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
Date: Mon, 15 Sep 2025 15:23:53 +0300
Message-Id: <20250915122354.217720-9-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::25) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 29053ecd-f42d-41ea-f473-08ddf452e5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nqW1eaZl0pr2+b2xHpAQlbOp6RSn0y/0hLh6fk/G0NyN7QmAgjl1qkPMiwdr?=
 =?us-ascii?Q?ZEIPG4dKV/iyDfeaucVjqPqAxJ5xFhPNuTQoBOipRuoUQq0DHvjgfTnxu3bP?=
 =?us-ascii?Q?RL+An1NrirJVgRF4If9uXtcMnMMpqTzoX+2MVQG+iqANww/x6q4Fqqm1eJfq?=
 =?us-ascii?Q?wxV16HISBwvNQy+EYv5WU/WFGrj1J1uGUGkiR9A9qIDDbFBXR54ffDAWCuve?=
 =?us-ascii?Q?jlFBWI/3OPLag9huk7T2/jv+WAFUOH6NzcDAJ4e2ctNYS3npz94MB/ClNx1j?=
 =?us-ascii?Q?+4PiSj/d/kwGLSxZXAPN9l7shpKcf03MGNerROPcSLB/QygnInNWTLCL0XaJ?=
 =?us-ascii?Q?1cLtmlf3ck0jzgVtViE4HhIHWfChn22l5U3dkcFabxStUWMgJk57dB3UzcBS?=
 =?us-ascii?Q?b3DVPSL9k7rYRegMIY+IwpQsTX2fxI4PJ9SSYH7qwNrdjLZIYLnwAQ4i8UEp?=
 =?us-ascii?Q?EH9jd6lpLOjisG73va0+6yJrWgxppD60Jndw07NErL6FsRj7RjsvhTL/lYnH?=
 =?us-ascii?Q?4eXu2avUzWTVD7GfOWGmqk9ezYPaFmeLIV/mbiD1fKgSMe9FtYIx4TqzukLE?=
 =?us-ascii?Q?TzjwlTfIFwHA3PVJtkdLCLy+he8dn1u94/nlTVkRrc06Rw1y6QI/lfhgm0Bv?=
 =?us-ascii?Q?aycJ85uXhkwS7Itw4ce3M3wpkmoN2+6vOKrMgck7yyIzQ3YhHU6kAjRA/g+U?=
 =?us-ascii?Q?dbE39t0oTwRLstXcFZG0/0nVpc1IDwnaK8jAyPKmi3LwXAWDclbt5wqpuHBN?=
 =?us-ascii?Q?Nlyamw9dtoy/L0muwVl24WnlRLucsRYNdXeixphbViIZG7flZ9cRfuNuGcYG?=
 =?us-ascii?Q?6jgghQ989PpDTQ3A6gYvR5m2KvBjmSBP6ImBZrLyMKrKiiPudGokCtLqoLsk?=
 =?us-ascii?Q?yOYevoMPM3Jx12E5M9BbENpmM4sa1WLNzBaCdLjptQL5NvKYEWWVI0jWgUi2?=
 =?us-ascii?Q?WWPA8BbwAiMdVWTOarBG/ya+gN+VhSr6JRQsaMm/hY57XPIp2cMpw1ME865C?=
 =?us-ascii?Q?edjnsGdqOJa8Yoy7RczeuX+W8WibP9UjhrWnQ2/tGh5yT7as3R50ZhFFZCuz?=
 =?us-ascii?Q?eLTSfDmWDNaRLmPviMC0ykQqj6PQ9Mpi2hnAEBDGJpIW/iEhIIZaZSABhDEr?=
 =?us-ascii?Q?AkM/pSLAEg08ygHT/oukbHzoj6ve/7hgkINlNacukbUPa+ByDnSFxY7QjeB9?=
 =?us-ascii?Q?jRgTuw4KbNKeNyYci63+JZwr0EYF51GFzWigbXNcSHXcESgEPxg1PaBwekTr?=
 =?us-ascii?Q?UXFHV0D997I0sZnfyY8mdDJwWDc1VbgiZCaUj2SUUtmoeXhqAy2FOb+CtLJO?=
 =?us-ascii?Q?disFi40jzgJHGHFHBQHBmism8C0PYkHmW+Qd/RnMhL401fYizfUFtsOOlqFS?=
 =?us-ascii?Q?e3TsrgvSrVcOXppg7Fq+PuifR1RlL+LOGiJkn9UEtWN97jHSUZlHki+s2OER?=
 =?us-ascii?Q?xOOhKe7LhNtkKKtI/LMEkQBGjSXScTokv1ldOzyzAeKABRIsyM0LAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MqXPAwKWW1VHATXgQ9qJWtZ0frc4G+p76e96y4YGlIE7lNL1Pl21C2h7zAuS?=
 =?us-ascii?Q?ZyO46Q8M2QOZkrZnl0e7eC7f4NfCEn7zs9iB8uR06dDEzygWHt1Ekn4agIws?=
 =?us-ascii?Q?pQOvsGHm4/c3xiTimWDdmmTzK6BAYxfrgUKlSCs7re7AJDnBHHz4TtQ6J7eN?=
 =?us-ascii?Q?TiU8YrkU8BuCq3KxIo5bAqPg1DRVY4d5gpbF3EaC9GvmFImvtvgWF17h8vdm?=
 =?us-ascii?Q?myI9hXQZVnhSqRGHTfSk9c1tHWMlpI+rVwDqyKyfyX5l3exchgXqd8jlkNLx?=
 =?us-ascii?Q?qJqO4zeAx+93DWUsVw9h3AlN8mLlu7MmAFRYjkFD7xYXYC+Krpp2M6qOHSqN?=
 =?us-ascii?Q?Zwb6nEW2H59sgMDRt4R71jFcBftWXG65Mtp251zscvIytND13cgaSYBu0/bj?=
 =?us-ascii?Q?IXnPcP5cJhhFtCxd9vTMhIf4TzIqZnSYAJcFJywIfzE40N8H4NyJaS240gHf?=
 =?us-ascii?Q?WNk7vE0w8h8MVjUkFafNnQR7o3ao6DHrcjIyAAzyY9WZ9dZkbXCBG/xE2rOZ?=
 =?us-ascii?Q?2pBsavH8Yd92CQVt0FEntkA03qqjiJI9MRNk8nrYGT5U9oEm+/zgoX5btrjy?=
 =?us-ascii?Q?KDGq8Jw47qiiDHRuJkzNlDSRMy5NZL44BcyCI/hqCD+1CYLCSdtc4DZgwkuy?=
 =?us-ascii?Q?zmUou/+2fQH3DDLRMoPhLS/uUd8LHkneV97oNEflzSF/PK5Rd5tz5NBhHfvr?=
 =?us-ascii?Q?AE63y3GovM9cjjHl5kInaBlLia5GnrJ2ACVnrxnkuK9kkSDTO8Dj9KrjcZiZ?=
 =?us-ascii?Q?OdhEX9eB1UZ6X7m3BRyNIed+botZW3neyxmV0vjNeeoOFRcOUyMvt7ofb8sl?=
 =?us-ascii?Q?8V/ZAC7glprkTxfAxKs3mNDkscww82RoiEUgZZCWi6kFQwi2FteIZ9wnQoQV?=
 =?us-ascii?Q?IymLPIZIDsdOPNjsyJjwNiu+OM0afolLjPVc4cIoJBPykrLwV6g5dF/slYnG?=
 =?us-ascii?Q?gUX/jyDNpHAFDNmTqsGbDcBITiEahqezJUoCQusyCVcG0kCIF90XIzFIOUhw?=
 =?us-ascii?Q?SPpt31DC69j4nD0BZLEHs5MTiQPIHIAalvkzhwIGwQ8Vc97awtxU1FYRTzq/?=
 =?us-ascii?Q?uasT6nmfVjIGVPjqD24QJF54AwuDGobcy/2o6Ff3DifyGCD+/fYt+yH0TTyO?=
 =?us-ascii?Q?USR0EYg1Leom2rFqU7TFbYmQewnLu8dyB6Apd3KWOIuk83/UNzErE4ECGS1e?=
 =?us-ascii?Q?QDw8Iq/F1iLDcifswUWq9435nYAL8fav3+X4uKQX+e16uvQDSZWtax1uYfvG?=
 =?us-ascii?Q?//pLcgacb2QzwkEwQgV9nuWwhsYy67iQa6Ze3PVaGbM6iJrKeovzoNXYRRAW?=
 =?us-ascii?Q?PQhyS4ZRvF14tTLIG/a5uFmJmFu/hiFNxM7xketvYPzZOKFRnGzTet5AlI9t?=
 =?us-ascii?Q?+jRxgFSN5YKRVcI7lfuqkTPxXhOCJjGQ/Nz4lxMRgn8EPuQHO2oq6kc7r3Og?=
 =?us-ascii?Q?TQc9t00F3w3rouMGEJYdsVvcvUxZL2Zni4cc/H4xk0JzTmsyTqYb1I8GaVBD?=
 =?us-ascii?Q?a/bL9MWE+7oICSj4SzMhHnnqXvid/M/2CnDXC+/6VsIfbkYHBBISflh/4GOR?=
 =?us-ascii?Q?C5kvcFa8t7qjAR0uZ496XOeQoqVAPfzfcwQE0eV2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29053ecd-f42d-41ea-f473-08ddf452e5a6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:25:03.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFUw3ubbcI8I45Psq+Q2VtB1ygjf+Xy8RHHtO4rswH7Tl4L3R9ocRlung3HLqLvWO+BZTollTw9iWpOGjivfiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974

Describe the two SFP+ cages found on the LX2160ARDB board with their
respective I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none

 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 4ede1295f29d..62329a93a67a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -31,6 +31,28 @@ sb_3v3: regulator-sb3v3 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
+		/* tx-disable-gpios = <&sfp2_csr 0 GPIO_ACTIVE_HIGH>; */
+		los-gpios = <&sfp2_csr 4 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&sfp2_csr 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp2_csr 7 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp3: sfp-3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp3_i2c>;
+		maximum-power-milliwatt = <2000>;
+		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
+		/* tx-disable-gpios = <&sfp3_csr 0 GPIO_ACTIVE_HIGH>; */
+		los-gpios = <&sfp3_csr 4 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&sfp3_csr 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp3_csr 7 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &crypto {
@@ -236,6 +258,31 @@ temperature-sensor@4d {
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



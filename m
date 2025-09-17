Return-Path: <linux-gpio+bounces-26291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CEDB7E5E1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A7FE3A1B0C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1091A32E2F9;
	Wed, 17 Sep 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FJPQSnl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDA32E2FD;
	Wed, 17 Sep 2025 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099904; cv=fail; b=TBSwxbYXfAxygDDbBBTBk2WAXGW+EkdcWUF1Ge/Xs/K3/9CnofRc8xBnCb9VlFuJVz6opsLpcyU06t4nqHY4o/+n281kxQNNjuLcoDdGGVW/sf7JEfNfZws6/AFbRrf61PEe88IjiGh58lRAjO3+zYC+hDcFdbJWCPNu6W+rnlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099904; c=relaxed/simple;
	bh=vs7mNwq4dlrMlcMepXL4ikVsxMdWtvxyEMkuAXCqR+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b5XFfXdnF3FMC1RQBQPqbent/waw2w0dCzWzd3sBVaVI5r1ELaEUqWbdeHrlVrIVpTDXIZ7MiaH7Demz0LODZDunn5KulbOS4Jfn2Vl8y9KS5+gnpU4lYGN0ZLOLquFXQjwJAjWbCRCaT+iYyDviXk2RcGo3sgwtBO+fBGCgnWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FJPQSnl8; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZVWJsz+4Fb99gSzZEqGsTioCJRB/8J8JPEiRxXgWx6rcnW8/3ZIDlSe3UelV5HKp4naXpIUXaUC+ZQvmJfNatmRLiAsQERHoRzOyk5rHnMAAVktJYd/DhPpuA85pLeZb0z5VVU3wecBO9QuGvTI2j9Nmj38kPKCNaKQ7qc92zV6K6OiLyylzs6OHern9l3AlpnxWun4IU5BcuiNzZDT/uLHSAcA9C6lGy4iI7FiNEV+B04Phba8EtfYWtJ1ZQbCD0Heq+cVwps4W8GthDMVr6/TFXvA4Sp9abva/wsHd06WYiPRdr39W71wG9MJqQFmrleWtIRb1BTRUNHFVcxfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhkVpPuaR/Ug30rA7D6wd00prR3IlUPFZ5yC8eYjiqo=;
 b=V2K0E5WTt3/CfSjsNAYJ2aU7VRMcqMNi8bT33xRx5Aw97zw6dW7SLOFPNlODQk9XqW3HZ+ngBXqAGJboDgtFYa34SBZMgOBYbnB6rsqXHTtn3uTygCZRsqocdPWVv1E6B2xx6/susH1Y+fFpp0AeXDKAX7UgwfKUpBQZJchZRex5g1KcpdCXEovTXK4MZ3Ojs+BmdWLN8l0dBWWJQ+knE5UsN/uODeYWQYdSXiJuee1UNnaD9hblEf4SdQ+xuLjvDoooTjmm9H4vz/PytGHnSQA2qfuKJ2LJNfM5K5as3ME10PS2+rbjMjbE+CVQhN9cKTATzdKSDMSAuRF/C3MMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhkVpPuaR/Ug30rA7D6wd00prR3IlUPFZ5yC8eYjiqo=;
 b=FJPQSnl8gBa6viD2eeMSajDLn8rZXQ+VT8303iclyqt17f142FyILyIR05w/uP9gPTES9UoYo/8XiE8MZF5ukHEQspAoW0fKFkrptsOo7iKHq7hYU4/82xzKiqz70rEk7aDxJvbrxkgd4sgleH3KvvmI15JDCDtHlUOD+mJIWOJMrB55WOlTaARMvbpBvNbH7wxeziuzvwmDWpF5MxuzgJhnhmYRtZn/nCutlV9ZxSkbeInuk/NOdK8AVYA6r8U/iEARQcGri1WutnWWYqbR2Tphjkts5TSZqGuQqxNjubTLQOxisskEjtaD3JFX67IqbiUSFn70t2Uqfrc4Jt5DMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:04:58 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:04:58 +0000
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
Subject: [PATCH v3 04/10] mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
Date: Wed, 17 Sep 2025 12:04:16 +0300
Message-Id: <20250917090422.870033-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0078.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 21dd9b18-dcc1-4b47-0dce-08ddf5c946ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?50rcvUi8DRWWP1UeWILGRCsf2v7+zr0PE5ag3x8t9LXKX2u6yFgqtBrgPNaF?=
 =?us-ascii?Q?vh7ugjAGM8qfU53QvWRig8bPYB3+YmRrB31U9UyUlg9SCFqA+RBmAcd+VnJ0?=
 =?us-ascii?Q?dAGGhl3xi66xUBHEVMkMfYOVfXFvhcIiR84ohF923tOjM6siXlf+anPTP99M?=
 =?us-ascii?Q?UIUPuFuILf6qeWW3HDVpAaYUDh/8QzvW1tFzhbW9urMjxTDwckogYCE//N4A?=
 =?us-ascii?Q?pv4Fwlhfz2LwGMqkwZwZk1DFxhPEx6vasbfFEbI+xB3DOXpLBpZKTuTFlH3x?=
 =?us-ascii?Q?pPohHSKJnpUwbvjuHM10ScYm95dVfqbDZYdzHizXr7QY8q731r6p1D8JgwX+?=
 =?us-ascii?Q?YUrznRdZBab/Stzz9u/TxB2HQzS2xI5n/C+CXuiVIgU8/LQgUvpuj4A1rbWO?=
 =?us-ascii?Q?taTExoVuCSX2ftsZ0XDqf65zdAo4Wn2Wkg1TCjhisFZxrxVOv7qHxu7tLJlN?=
 =?us-ascii?Q?7HLiv1Ex4TtggEZ4IfcKFi0NH01XcYoluO1hUBT2JygKNOtzvDwT/fytBYYE?=
 =?us-ascii?Q?vCx3V1808ZLg099SJthlOHSethyt2lwq1t4JaRgnhyyZ05+j3iHaKAqTHdk+?=
 =?us-ascii?Q?Dh21l4/FiLTHPSlocl7PkTID4s7baC2lICpaNlZKPz/kmfSyq1410B3hMxj8?=
 =?us-ascii?Q?UqHXv361ZvoGCkupXhCvk7WOrOmeeneZmIAfBM8itPfh97v344NSYK3XElg6?=
 =?us-ascii?Q?PfOVQorjwVgDZH5FkdlB9b3hXgJzm4+ofnuVE/IPs9WdK0jNPLKX5a1RtFm+?=
 =?us-ascii?Q?SqvwY/5QeM1l4l3YpPFTaCmZMo3IW5Zn1mRaeA1PPkxXlawKj3w6mcdPgrB2?=
 =?us-ascii?Q?8pZ7okdAzDs6Ezg4bO/vYh7erlPj6kgvMwBasTaVOOWejiKnJN1j6WOZ5jxw?=
 =?us-ascii?Q?rbmZvIso4U4mE4kQ1cOiFk6IZ5pQfTDdnmQY1hvLlsXDCVbxfvG4X/3TKdKD?=
 =?us-ascii?Q?rEm1YkBiWqTr47MaDMEqjbHstud229NplqrpUZ3DqkBWJnhbIEmfWnQJjglc?=
 =?us-ascii?Q?wygPjNKD9ewg855HVMXkxi7ls29gS0tWDk9wLAe09FA8eWqoBBtO4Jsy3AXC?=
 =?us-ascii?Q?lrwA7nFfPEdXYuLndi6hbRtUGUUVTRMWXFMwKghT70Cvlvzryqg8H2AVxO4i?=
 =?us-ascii?Q?nYef6HIdA3JdTT53GGwibDmhrT7ozX/C+ODBArdUbBIPF0RcA6/V6ANWDqxO?=
 =?us-ascii?Q?x51oGl43kScEQ/UeyDxFoXKKN2LrC1Kz6hN2efBXwhH7b/MAnpoSkrUCAulE?=
 =?us-ascii?Q?n7X6fo+0jwyyRKrxvArfTgZfbuggeCDrw29+0HVGX/JnLOY4mUHi2VQftRx5?=
 =?us-ascii?Q?kkkGv1zxfF1X+BPDVwYnTviaoSTJiMVzPy1/sfZQ7aPtKwPOij2VbGfKwELb?=
 =?us-ascii?Q?E1ycF7s2eN10UGlUSgdGYWGkRoRIdjSN7Z7Ub3Z0gtgWt+NPEBqbCPC31Hz2?=
 =?us-ascii?Q?TZnLMgLDPDWw32UYr3GQYo+GNWLJhqXWR+gcKpEIWMObQyZ40iQXCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RIjirBDT6zmM5exehIe4dnPoKV6EZv2dNgErU/Wb4+zuIZWUucG/r/nGb4cm?=
 =?us-ascii?Q?Xyl2lItYNibf3hdJ5/s+gA5pPp6PI5JHcsJfP+bK4PzvnoX5vWQ8Zut/lCwu?=
 =?us-ascii?Q?X5/t7LY87EsYtTely+/o4diZTBoIcGPz8Kc9gJuVfhh69JLHa9a/Vs6Bivi7?=
 =?us-ascii?Q?ny6tY62WOTF0OPUz09WAL7RV+PCSk0heeMxcoISmbwqkbtYBBwBLekuY7aGq?=
 =?us-ascii?Q?lobJbtMsukhwQGAyIa0uSxDtMORz16MNe+Yd6qGZcZo9v8eeDHtSD9amBAIc?=
 =?us-ascii?Q?xxoanYy4qzMzBMOJuFV6BD5wYaay80tCu9ovze0L1Z3HrE0csxCF79F85Rgg?=
 =?us-ascii?Q?49V5EtWeM9+vCIkomrZrYjZczAbYXih/3k1QE8+iaeBBe8ab3VZ3U5A97foF?=
 =?us-ascii?Q?qFQr3KOMIC52lH4/oVsihra8/cbbJYYbeHAy30uZ7QPLPwslMDAMnOgPRWlh?=
 =?us-ascii?Q?i1/MdbT5OiLcjewhUWJUshvlT+9Q7A/7qhc/0gcSjWZgt9iqoj8BAYksYQ9F?=
 =?us-ascii?Q?TyLkiPiz/dTEvzPUODmUmvrOVjanRS0tey90NUMJP2bqYeKd5G3bQnXM3v0m?=
 =?us-ascii?Q?5ht7YKj6V7jmj33HGpQAOK/xHgxtSyZrpiAbBDNnpPvR/Qa47TjTG2FB9uMU?=
 =?us-ascii?Q?ZZB22FIvuN8uHgiKmTfwTY+KK+MjcZmC8tx6Hj7Wds8YMOc/0ICfd0T4YGAH?=
 =?us-ascii?Q?LmWErHIe0xY1cNkDvqMVHVur6FoiQ3ipPLPhOJYqijyw7f+AvC5XswuqOn6T?=
 =?us-ascii?Q?ce8/pdr5FM9fEu0f281L2qwnZtKZSiBOhj88rMV2ldscUXV0eJgZwmnzzJAZ?=
 =?us-ascii?Q?x4aqv+SupscVfrAnlaEpkcZr10nv4lLnytZPERUlDEPv7+zSUOuJk0af/VHh?=
 =?us-ascii?Q?k0tgkJIdx14hCT1wH1TZBtu4M1RSm1ct0WyWQlWOlxQSjTC2br4TWHoIPUyt?=
 =?us-ascii?Q?r3bHkBhUNd5Toci1SpIxi+3ZNHk6vrxUO4jaFI4O39AZBRTmJoHV9D+shUcG?=
 =?us-ascii?Q?4ILwnGojXlsQBRDVcVu3to6sL7udUlPxsOOcAixA1AOMdGVO3EyzX9A+1jfV?=
 =?us-ascii?Q?qOFnUSAHmduD1sI+tIZnhu3QagtzzZdOVm0tcPnFuR2d0d5xrldWOPO+BL/E?=
 =?us-ascii?Q?sW4E5f64/31c1dvM5+W7QX+C1Iu7waHG0Z+fZHrlxF1s+JmRw/jZeK3p7pHv?=
 =?us-ascii?Q?6xhcsGHgXlCd4Ri2EdBOH8c5x9vTvlBjevdTV3XcXYZ2hqil0BzZ8JJwlbQx?=
 =?us-ascii?Q?jAphtvauYIXAv6kF9doiq+uZVF4AZrq7vJ9Uw/bkS8Dz2ZXIZtwPFDk7YH8U?=
 =?us-ascii?Q?VtypDfwS5thiAsqmliF8mBUfjv5blP5H490GtI1ykD8+3Y2/r4itE7BQK1fD?=
 =?us-ascii?Q?lg8b+HDqDgWEG2aWpjxF9tRHPuVWccAlfU9LX2lz/wZRN1yDeu/MX+19YNUS?=
 =?us-ascii?Q?wxK4B9ix+ozdj9h+RVq6Dq7+9X32TR7wkcE8M+jlp9Vmyo+2o9dyKj4abau0?=
 =?us-ascii?Q?3pwlRjQCg4RtHWn+bg55DhMr9UB+tEPE2ghltiLti0zYv+xgChRZhWiJuVDt?=
 =?us-ascii?Q?vlNAbuZ/7pYxka1chf2c7VySSVrKbmWXfuJv2OYC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21dd9b18-dcc1-4b47-0dce-08ddf5c946ae
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:04:58.1535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0AsXLn1r5PKn9LxaAPJfy77eGgrds6XduvzL8Ng3nWN9B5OvhD4SApH08BqmVWdPnszHyd4daCE/aHkQBzl2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

Extend the list of supported devices with the QIXIS FPGA found on the
LX2160ARDB board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- none

 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 63ac26388860..6fbe85437d8d 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -115,6 +115,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "fsl,lx2160ardb-fpga" },
 	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "fsl,ls1028aqds-fpga" },
 	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
-- 
2.25.1



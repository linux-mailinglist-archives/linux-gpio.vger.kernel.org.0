Return-Path: <linux-gpio+bounces-26160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B44B57AF2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D80501AA1964
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AAB30DEC8;
	Mon, 15 Sep 2025 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QdZO7Jy8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5840A30CD96;
	Mon, 15 Sep 2025 12:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939101; cv=fail; b=tPLsb3Tit32vQSJbgA/VFjbx68m9NGdftBv6w4nzLCQgq+txcy08VyVNYgx6rgI4iQU7oLk/UAhlBTmWB2WX1onxnhXJjpl6SA9Wy8/dnZLQRjMCs0rrk9h7i6bKoYeKmoKrCDW11LbvUBfl2V9DX8IvaIuLln1LqWOEMC0cUqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939101; c=relaxed/simple;
	bh=aIn05WFDH5eJOWON8wkoGyF+K5OfHTvvuHPg9PA96t8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J8lRU6QPcq2rmRJT79DhJDkGbbIjbM04KXsJYoYOHxzWAQvUd56HpO9i/l2ubimW3pFDdwDqNWghGm8e5z1EM82mCcDUZZP2y7zKAAm7VpSW6v1xcZudWDlt39zj+AUbSvcXyjU92HLDP4GGn+LZATNpXUe5w7b8+qPRt2+0ESE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QdZO7Jy8; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdbBPAgkYJ709ZsnwNeDFZkAmqG9PxT8HQnTvtaLKgwCj3CPojVzqOQfplYe+9Silp7lO/WS3PYfeioMtHsEg4d93kNAPdw0iMMOMP2kfPidUDdakmkvJasTW1VmgE0DxBOfmaY1KXTRwZyAFDghFRTVp7KSQwXUSuvefyAjsQY2Ulu/d8RTTHXv/2R3Ie0GSpwVuyczuwX/VQ9eAgjoylIoeNbs5hl3w8ofyDASs+qRpbECDlh+uyUR8468aoWAwMg/hftc/BjjUGtmQ9UbFBgu++GbTBnAfKGN79A/g69XxvP1t2mavDrjGWRv3KTSR9JUfMSYYZ99T2HuDmxUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAVBggpy9Aar5MjRQA4y+pKX+Mnz7jJpvuOpjo32JR4=;
 b=yQ1wleQtaiEnijHGYpoCQNf7YaAEGEFY22PshWL2CuldFROgaSOir9/Zgn63Xk3VDyGIVb+iwbtqwDkkYVH17dZ3OrdGaImbXGVif93lbqm8LB4M2ONct2gtSX4pP+nxS6JcCXpl/dRmQnm84WfPSiaMV0bUBU75nHzDvdMhFkk3yYJbbdgpGERKEJvHcy+07mLwHfwGHYfDLQR4b77swfkuyuiSSQpoe2EqdjyvMcDqGaMasU7kFkrDRvv7isEKwfAITtmx1trpz5jtOsasvS3n0CaIOFMwoSOzPapkImJZWdebDTqKHLD25ClIG33AUvVikmPXONXnaSghhm/9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAVBggpy9Aar5MjRQA4y+pKX+Mnz7jJpvuOpjo32JR4=;
 b=QdZO7Jy8ACp/pXKnsgIWcQ1yIbc7GhLrWpGlvA2ia/ZdZcuzMds4NLfL4B8jvEDydgtBIJtNMQ7nVSl9w+PzaTCs3/KggnY9tYM2LtJEtn73zl9Re/dvdXm07B0Ai4DBSnHh9kp+i7LRngOeYIKbmA+lB0cfPit+eW9dKIjvbxvIB6cm3U8KgfnkHyd9WkVEsOEyoe/C6TjbKQ4172SZIrgz8d86LRwdRtNq3n9+KS3H+0WyiBK9nMzq7dtSwlKMaU0ZcCZtVc9lK5qRV6IiIH7035/aQcoqNbakm55OWuB0X4EHFHwmCJ9M4nlKkuuSjLhDJk9Do5HhxweCFtYSRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 12:24:55 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:24:54 +0000
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
Subject: [PATCH v2 3/9] mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
Date: Mon, 15 Sep 2025 15:23:48 +0300
Message-Id: <20250915122354.217720-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::34) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d48485-77fc-4ebb-74cb-08ddf452e03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LOxxhp5A9bs327wRk4/ggDT6Q2Msk48D1/81qLDOXbbiFBbWVLjpDiW5WRub?=
 =?us-ascii?Q?61vQMFEfM+NhF/hVSST0IdUleruZPEcD/zPWDJDh+/Kk0a9L2yATHobGtJzf?=
 =?us-ascii?Q?9ztXIoiX+ZQhwD/fe+Cn+X2J5aafoGOQhKrmyNKuhmp9Nb7LaGfF3HH6BcEb?=
 =?us-ascii?Q?k5VOYsyBHspadkCFymDrKCQ9DQKZX4rK+KaaAuMhQfY4QTcI72aH9nWoe2IM?=
 =?us-ascii?Q?wLnRN1sjAh00BtentZRvzXkeAjUEzfVBJ1bgGA8gGv+DnqoDpDBj3BrrZti/?=
 =?us-ascii?Q?q9cTBre2MMH31t3MyqrBBr0NH8ZBxI5RWXknB4gQrueStRBUhlKhpHmtoB+z?=
 =?us-ascii?Q?XZKRdwIE7Mkl4mq29h3RI8lbAHBUS0k6lrs4g9DA1ljIwES5eXG59NjEkx1u?=
 =?us-ascii?Q?ctmYTOUhLSEZNRMAg7NbecO4UDlu2e8LNGtQ5Tagrm0+jak10YvFXnsskxz0?=
 =?us-ascii?Q?PaVHubcJFtP2F0/GsWC2xuGk12lmOW+Y183fPId2dxHHCSm72cggEbGaheF5?=
 =?us-ascii?Q?yUxgcNx8mBKsre5/9B/Rm4lhtBMp+oRhtmMyx+xsZV8wNc/tusZcZ3Sqlv3C?=
 =?us-ascii?Q?mDoK7Cw+E5XofiWOmlU3kM6TksZmwaQk/TO/+6PGn7qvsPDcLRvRL1fLkQSx?=
 =?us-ascii?Q?tCVZm0/ytTlnwgAD9PNqxqa1S87dByzmy4WX1jbfkgYOBm7yME+J1L1RtUBD?=
 =?us-ascii?Q?O4tUjN+F3/fAMEhQDmN7T5nCWlUVZ44X5c+vihztM/P3jojI2c3fbZ4lF6cJ?=
 =?us-ascii?Q?AGQW1kbkBLGZYkv9FU4Irl+0z9Y0Aj2QpSedm0QUhKLTJOHwnANjH9bCZTs6?=
 =?us-ascii?Q?cNF20p30Gk4vYZ1oNpZ6kCFTvRdnSsXid1wFwGuDgm1vb/d19vr5xFmMWTtj?=
 =?us-ascii?Q?Bplloz1BeZgWg/4DqRJuM7cEQuSb1NlFnj99Ryj3Ai5N1HlLbjiCEYkxcJbz?=
 =?us-ascii?Q?zp3aEB+fAMunRDnwLQ4lQ+I0yq5euenp4CGQigjlP8FhdpV6NWN/fVGunz41?=
 =?us-ascii?Q?VteiNAJdTUfNfrsGzb2kV4QmykKHvoub86WCGyOQVs6AqX+482SQwSoJ9qsO?=
 =?us-ascii?Q?ZtlMZaOJDoBfqFBHFNU2HPs1QrEykfFAAk5pR7yrgHooGdWqIzoTQQbzinGW?=
 =?us-ascii?Q?FtbjBhm2v0rVXMRwIYjV8uZ2hcs9y6kP/bmc73a7Wg2E6V49WGh2DhvGQjX6?=
 =?us-ascii?Q?pZ2Pi4AgaHgLe9HrwrBwAOz/9V2yDGStpqHqp5SA8yKSe8TSJH3jdt8CqAwO?=
 =?us-ascii?Q?Oc0d0968JoVidwnqo+9TmNv3B+b19rLCL9bDVbGh+MljI1PIipj2aSl4pFrj?=
 =?us-ascii?Q?kKHUccreTce/fLOX3F61UeIhW1uAwiSOI32++HzaXNeTjyGACBPVIvq/pJxc?=
 =?us-ascii?Q?IsQit8+HG7NNyBiP2NQNC+SVlUQwGWxJMwUWwtlwZyTJJhm1zKSJ6IU2nND/?=
 =?us-ascii?Q?9k1hlRbn3Ak+A86NZ6HErqGZsazDxrldzPil09qvqzSNRvY/ZHjCNw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lfeuh1c8B7G4tMTxDA9HAq9fpsJ1rlHyQka+UbcAzlwLNABcevC3FKBxZZJx?=
 =?us-ascii?Q?9NQh6QFVtX9TM/tVEjqWu1WTZN3dMpaMn+6HFdOob9ci9bkJAGVCt1nEGRSd?=
 =?us-ascii?Q?PA+IwI8NUW35tWyw4t8aKc7DBvBPWW2GwWWHdl+dDGHW+9eBGsQfX0VLFSAU?=
 =?us-ascii?Q?T9HneaDX9JNYPpqNAJc2h/bbhfETrpR1hjwG1ar3rcuDneFleg8MHRxGA+/t?=
 =?us-ascii?Q?UpLgQZoD5QbGpkUstD7DdTKTOGhdzxFPnhSEHWiYXY4Sq8tn8uifP6KTMsmo?=
 =?us-ascii?Q?EADPQPoLWDyUM2iqNwye88ATdfHv1X3PECBxChITNQzikToh9EhQSh5RYCTh?=
 =?us-ascii?Q?73tGMEQ/C+F/Q5HrJglNwG3YxkAHOiWYOWdYUtvaxgMo0oMZrHcEVBtIRXp/?=
 =?us-ascii?Q?u/2ZFcDsfx/p0K6PtYO5DSFM19P3VHgHYiDLlfap8DZf1Hi792sZ302sZBDD?=
 =?us-ascii?Q?3G0TCdnnVqYhsfJ2fhUNaoxQDLAajC11Wxtt1+fykOMGZPo1lpGBG2S8UF87?=
 =?us-ascii?Q?yvkgque3f0tnjZvIQeA/OLxEogjUMFK8NVfPdpdBG/MxrCJ5PA0IaoSKKa0R?=
 =?us-ascii?Q?VkSQBtoIUjk7yHzMjN8Swn0Tgix31iETle94BWyfBjt3qMLdKlT749HZk/nH?=
 =?us-ascii?Q?kD0ITXDhFkjChe4aoQQP5ojny8A53vwIMAHFn0s3hLsv8S/Mv8Jzo97IdbRA?=
 =?us-ascii?Q?KPwiA32yhWP1VPRzrHiKKYM8hvdFpQ/1EIJuzbkqmpc8gK0dZOhMv+eUUtIQ?=
 =?us-ascii?Q?krh2o0kZ3j0p3Jc/YpEK0Cw8S22p7iqef6kO03dFmDCVvdnrUURasa5+20ay?=
 =?us-ascii?Q?nC5XX8glM2j1yq4Sa/bpAl5182UCQw2s5dsofo80GdWhWlTuGB1HpXFPy66U?=
 =?us-ascii?Q?qpJZLj0YeKqjqoAI3wISlMDAlIJll3TqGMtaGc3LkD2BHF5Wx8h3UDl8x9oi?=
 =?us-ascii?Q?pi8O0fEaZ5lBMVJgWcONrNYQm208YpIAyl7wMmm5PvlzC5CUxqWlZj8Cyvv3?=
 =?us-ascii?Q?kKOkatithaU0kXoidk9PdZiM3Ct7m1KH/1PbT4PqO78jx8zoY5iRHZYReWjy?=
 =?us-ascii?Q?FucJR432tIqh6jzD8qChvF9cMxwkINI0slCWXzZmEOo0cv2v0lmRQyqPLI/K?=
 =?us-ascii?Q?6APTKhfFdtbAbJM2ywyGFM2rVr0ytgx0tsqWB6XFYlBMPcRwfOadF9VAJCWH?=
 =?us-ascii?Q?pcg74+K0VtZSt6XSUJQATsNhpbZO5gJL5/UkfC63M5EK+P+6v2zrDWxM0OjV?=
 =?us-ascii?Q?VGV8ldJPl/0SCH9/dfqqjPBgkY1K/AVIAULmzh4R+HPySPSaS0XtT8aoBZQy?=
 =?us-ascii?Q?OdFbEpa3epHbjFHBZgO3mSuzkLu+9FnzFaPnjPqIgWzUQEnmeYxdD/I2RYxU?=
 =?us-ascii?Q?t0teyVvW+3tOAECSFXHWKgoYa0w1xGVLTTmRbOVMvbt9bnJPKKuvi4ZnTwLI?=
 =?us-ascii?Q?4Dhok85YbqG4mXuWTmEUHdedD7XuJjd2HwAQ04iIQ9OG1TrZhEugUeoBqWH7?=
 =?us-ascii?Q?U4/Wm3XpzidGvmIWpxwOrLVLZaUyds75y5X52vZEL64xyLN8Cm/Nh3k9Sw24?=
 =?us-ascii?Q?YfRL0KtOFkiFQtT/R36WgU01tkafFwhPn2CtacJe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d48485-77fc-4ebb-74cb-08ddf452e03c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:24:54.4100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiSq+xbUM9sQOTlHq13c1Gj/oMGmfQCMS/bI+fJdSKym2GLjeIAflZ5/js5yHMBFb/p4BIk1UHKWfUmBDFkHYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974

Extend the list of supported devices with the QIXIS FPGA found on the
LX2160ARDB board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
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



Return-Path: <linux-gpio+bounces-27124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 920BBBDA84B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CEBB4F373D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F79930171B;
	Tue, 14 Oct 2025 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I7DA3ptB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D78530216D;
	Tue, 14 Oct 2025 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457272; cv=fail; b=O6GUlewEbE2Q0YLskDI6i1/G1uVkOHG/VWeE9VBC50SGQ+Cty17dNYLdh5pVoYbnpVah4lDNTuo8vzGDEQ9ZztI1HCOKG4ZnY/a72zLm6rk5HSHqbRNhoGPWJJjw9GO8ziRJV0uVtgl+GtKj0KSTvTzYicekYFJ97uyi6UhCsno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457272; c=relaxed/simple;
	bh=Q0bS9RktwsELWIiHM2btcEpwlX00r70ZBo2S73ljS9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ProMTpF/QMAXtbFj9/y+s8QVWByIdXpS2kQU7lHKvxhjqzpVixh+w4iCpnusefF7D9+q0AIqFIwNuYU+xDL1T5Yld7OhkBzyy+C3bZxxAKdWhr6zKHcyq6WGasbhASsfRqz4yJTIpMjYmtFapZW5+4I6Lk7CBTg8VmHOabqN3bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I7DA3ptB; arc=fail smtp.client-ip=52.101.72.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mrt/wtK8YV6poJ18ONJ4x9OTTbiAGIBN+G1mgQoYtIFN/vQgW3TZBZEXuvw++YoeTNDirYELbleIaNAkkUw+i9Df3scyqX1YKNcTt0mHUUlbkGOsCvnKy5LZO1txFxOGyNFkwqXkZAEP7+nRE7L3rX4aBcbeEqDKiuRTrnjLb5XH+Hptr9kmfR4mZJyQlIy1VPVYp7VCtURn+x5okup6+84EfnImWt11Vok6YV3wt7/984PhUjWbYp35ZKwUr4XSJuVBDSaYZEkX3PPLmW6wyXSGMwidRk2mc/jlaCGVL9Ja6roAiNG571qho/FVd5seSZViqYP3D7tlUGpLvZQdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM/PrKGjEbn6Mhe3e+BBUTH3OeUC165GmGT2BMIHbAI=;
 b=v/1kte4YUX6nAXmDNse1uR9VnIO5c3/nLxOAkM9pcekUQrYiNQC6Xy6ETcI8BNaeeYYUagYm2ZDO7+PXSe+74y+zFRTDYjwjLP2OeUXk/EIfpB4a18sM9NPw3SxcZ1k9T4MVkIR0lZajBgtdb7zF5L4q8iEMxJy9Jaoma3Q7WWXWLwXlLVCdJqFQet9iLK2pXXkp8IrTPcH7OarUU1ifJ2dKvZmnmigyEiHgMPJZUeaRA6J7wCdCwpZgmuG6NRXmVCMcOTmjaEjy8JpnwPQms6WHdGsDlu4qmQfL28unQcDUDLaB9BQ3inEhbrRZNsmdb4I6AOQx3yL8I/gOWY4AOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM/PrKGjEbn6Mhe3e+BBUTH3OeUC165GmGT2BMIHbAI=;
 b=I7DA3ptBfxdg7H7HaXgiX09VlgLID0PqkMcIDEPxc/8JcP46R2zMA+OMoqxGmCRkpDM8ARXvocoQarxNBsVwdubvpRX84aVDm8mlP8sRjgjKIKMXtcFBMRRpt7UP7VZOfQBVQnjQRy/tkcyzZGw9wD9DzxHnvZz3scltsPh3aDJOOkRroSuBpwWU63oC/BZj3ShD0Vfu2QxjrVP3ZnNII92WNco4kqRrNKWCa2UBhYqrs4uXZ0L9tkDpflyJmOWEQieHG8xjzX7hg8xZuwRKCs/LMRiXaKExC3IWBhNjvO8UuWFZUPrKZOTfk8IBV6kXOg2K5eWFlC9Yg/q920E2Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:21 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:21 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 8/9] arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
Date: Tue, 14 Oct 2025 18:53:57 +0300
Message-Id: <20251014155358.3885805-9-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0126.eurprd04.prod.outlook.com
 (2603:10a6:208:55::31) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e636ad7-adce-4d45-8687-08de0b39f0a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hE9BGHzQiUxljw4W8bhGWkCYCP5BXvclls3SW2Yaz4MayrQWMGxVPER/ssIe?=
 =?us-ascii?Q?6+VRWiWDiLgqejctg29zI1d9domVvTJF65g9g2HIgDgI7hzfCgWXnNNiI/SA?=
 =?us-ascii?Q?JqjVBFwH0uBXR64+8ytGCZnWZM3qQc0gShk8GV3z/vdwS3k9pZLEQuEB0VIg?=
 =?us-ascii?Q?g+0sFbD9M46YfLoI6gy7h7kVp+coIGdR4IK84X6lL4hFTdp2WMN0WnazKITd?=
 =?us-ascii?Q?zueUmqVwBj4O+jmjkKc6mRjQtbllcFk3zD9kSiJ/gA71Qb640aSh1S9ADHAB?=
 =?us-ascii?Q?CEMjwLb3TskaEUenLXsb1Jc16cHRPgZjWMPoYeKnk5I2+XXr3P8UzTAZIeWr?=
 =?us-ascii?Q?+yv9b+ew9t1A6wmqVpmy0JYcCgqAO/UTI2QZyJqfS9hIt8+nwGVCfwi8Zo5d?=
 =?us-ascii?Q?+sVQIv9iMcfYWJS7I273aIsxArIDKaHPXEzsqYR9IJOeILk6CXZOlgf7XZMZ?=
 =?us-ascii?Q?7nk9VN2kBKzAcPdjI08LANkouv6Ft57fYXUytCCoqmowXrRCcJNiBFv0o0vA?=
 =?us-ascii?Q?Aim/Ot+gtUy1+aItmWXdaB8V+zrKCR5/7woWd9kELs2Zk49UsdqsW3K4tmPj?=
 =?us-ascii?Q?63sLbpYNbWhl11206lJYevCVoZeY80m48F6R7RPKR2dQ/lw1ns9NfyvZ4gXx?=
 =?us-ascii?Q?ZQR1YZnl8ccbPWZSFLXAUp4LyvIkxjqdSpzUYOIoSTV5w/z+yYuvZ0FUTE0A?=
 =?us-ascii?Q?kkMDOO9AVuRDXrjB6GAL/8b7cnhLhCz0NEau2XmMGerMf6tl1wfKAbhmnpxX?=
 =?us-ascii?Q?HaKREe9/ffxAYiKXxDurt6U79xxIgqwseiMcru2IGHX4hmtWtonkG5rup7Vc?=
 =?us-ascii?Q?iF8CKlB2pmYNeoQjF/f4/yGXssVo6Vx2L2m/jDTo43qyh56nb2Na1EP9YeuO?=
 =?us-ascii?Q?UAXkohN8Wy5fllPJtvwWg3Kr07zDO7MlOV2jDVeAeAUHO4xS6eqSWeCXyl+m?=
 =?us-ascii?Q?viDakyQANk2gP88ETx2y/vg/J09OP9cNxdoMiF5OsJ/7fb80K6dGwldhxtqU?=
 =?us-ascii?Q?GXF2w/4dsQfzY7pELCNrDElEPtVkk0XGvy9sZM885hY0e2KbBU8nnihaQUzI?=
 =?us-ascii?Q?bM1YE4Frp4PRFCM88ka6BO5NYG4zu4g2zMFS0tpbRQvDTDj3tuLUpW5xSGAR?=
 =?us-ascii?Q?414P30hVlRdROOZ/KCHV2E4KpHHNnYi/r5tJD8jaYmVoVFPueYI+3JBc92Vt?=
 =?us-ascii?Q?gLp7R8yX4icsfIQ1HSD1sVTZ2cgbDbVXVTeRAysACqj1EnaxKphLNoQvfSRS?=
 =?us-ascii?Q?vr1Ahzw3NOwaUiSuOcmr0DKbot1WYRziQboDrNo1wHz+nn/Dsifiw28xPZjg?=
 =?us-ascii?Q?WsI4uJC3qqLhY86UGMQUBpq8RmnuZsg2NvSybaYc+dSKArcQOs8XhVUpzYDB?=
 =?us-ascii?Q?nmXfFPDBt1oA8Cz+dkAaabiE9oPnA69pGm/vfhSuzA4+VuQGxJ6F23fObbHu?=
 =?us-ascii?Q?bYHz41tccbpNasTW1I/dg7+FMO6n2nL8DG0liijo+7kB2iw+nMFijkry9DCT?=
 =?us-ascii?Q?HwLkdc0mifae//o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0IEqRUZ/WkUf4XVnatzehBBYtIjm1Zly1rUXsbf401DUov2Voa6Q50khQnRD?=
 =?us-ascii?Q?bhYhM0HaQAfd+c4qvw1aIOvzLNZ+OYsKZTOC1Vn4zrefvzdT1ytoLHI3JV0Q?=
 =?us-ascii?Q?xGZS6zAbtpSDJp+CZjHfBhtq9JURd8r/mgBeFz/h3kkpc3jqUaGvRQJjNvT+?=
 =?us-ascii?Q?QnPKXV/qXBmHk0J36tZMotl7pMJmIu0idBkf3rhLdg2YcuIDHDiYUHfVg9Ds?=
 =?us-ascii?Q?4V2JT1B19BqltLyhXT0PzWL+Jww1Rndb/NBUoccpLjGj4eSgKVXBSuoPpWmH?=
 =?us-ascii?Q?y3UDPrlcmXLT92Iq1eEyhYG4D8kIdl/YDNZHEqgxTiOPZ0QT9FeYVsN8dd+N?=
 =?us-ascii?Q?cDRVXwPW8MBnzqvnkDGa1mBlpHFBvXaS0JUlPmMmY2JwVVitAa36a026gt0V?=
 =?us-ascii?Q?mpVoo9zV/KXxD/MYk4OUQqkowOFims/S6QajAncqwWCYRi0Q3Wp3zwzMZ4Ae?=
 =?us-ascii?Q?dWInZ6rkrwehSyp4Syk35+JvsEjIRhNpzduhFjwQG5BSdgDpj68qvE0MJnsk?=
 =?us-ascii?Q?e62Gk1nj8nBdo3n4HzgAWlP0vdmRytSCWBvOMVleWopN08ImZNijkrPGrMFT?=
 =?us-ascii?Q?WxYxnVJti8OOm/qgPZrqXAOYPQylsAhQI54z6gF+mEWRYc9LKxCvrAxjzUg7?=
 =?us-ascii?Q?gae8udKIYK9Wg96gh6OV+4HoSd5HgVdEjKoJcyCdV6Fw50Eb/lhDUMKnOshl?=
 =?us-ascii?Q?NnUsIrkprgeWX86zBEwC4drFrKV5pqR18obRKjmWCI7fGF2AepyN2cClWC7+?=
 =?us-ascii?Q?k0zm9zqN1OlECGzk3ZKABLdl5rCra+61+o7My9tanZExbpmYYy30EwbOX+1h?=
 =?us-ascii?Q?4RoMpsTZVlng/QzYPNUEw/2tfuE96wrWX5k65htk9n6W2yaVLC/IdB2Rm5cM?=
 =?us-ascii?Q?juTlgBHsymVu60vrtNszzK+MlFuNm/YtjgieKY6Lb8f1VhVoqUBFHeHHMPVA?=
 =?us-ascii?Q?ylCVufDi2AZ4MJdC4b5jmX/o9gBq5Lc3jzrg9shnUmxKphDWvQjCDcyj6WiB?=
 =?us-ascii?Q?tjhkIYxZ6rBTwEagSINxhHP46WpWH2L3LyunwQOVWLs6ze8NA0oPEhxCH5hL?=
 =?us-ascii?Q?K7fXGV/Og/RWrOf1xtRzL3Ad1v2PQNOFiEM1HS1/5FVPAAAG5pkzlgZ2HYk+?=
 =?us-ascii?Q?5S+o0FXK+2CRuRQZTb7lcn3SPMfKyuaZdROI0KYn8HcIscazp9PZyQ+OPT9E?=
 =?us-ascii?Q?X4FmqMpAj9i7RoymC+10zGTm2K5ZinaySGeNUfxX7qrE3ZBHT3nbnmkJ4NlZ?=
 =?us-ascii?Q?aguD7RuULBm+5WjJg+Xu92HWmAndj44EHdFw5O2IydyVAxZ4HmP2l63Q1IaD?=
 =?us-ascii?Q?fEBWNEIR70dymWpSW2jCdhwq7oHHEFRET9wMGR5Chg11WHjIfE9piKYUJver?=
 =?us-ascii?Q?MC0El46ajmherfxFWKYJXfGu7ldTafBuKnkAJNCvibSb+dkimAu9OiSLPuMk?=
 =?us-ascii?Q?sIKv5fQIGH6qAj2FgDNP1i/60ydtGm0f3msKFsgmk213MOGgV77nZooL21x2?=
 =?us-ascii?Q?FZnOng0vlwMextThWOF8EXrkjxzYlIiDT7jCRt6dQLkIhwosC7knJ+r2lxBQ?=
 =?us-ascii?Q?vjRzCy1IJLPg/tpn7aq0lfpa/0A5CD7qrHyjnVz2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e636ad7-adce-4d45-8687-08de0b39f0a4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:21.2614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJNtznghuVTUP5tl6szchCq1SvYq5pRBVBhwyR2rPbcphiQfsLh7VWLFLm2puOn3MjWla8NnmlyQxZzMh2WLhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185

Describe the two SFP+ cages found on the LX2160ARDB board with their
respective I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- Moved the reg property before address/cells-size.
Changes in v4:
- none
Changes in v5:
- none
Changes in v6:
- none

 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 4ede1295f29d..1c1ed0c5f016 100644
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
+			reg = <0x7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@75 {
+				compatible = "nxp,pca9547";
+				reg = <0x75>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp2_i2c: i2c@4 {
+					reg = <0x4>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp3_i2c: i2c@5 {
+					reg = <0x5>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1



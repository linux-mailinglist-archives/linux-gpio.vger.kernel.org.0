Return-Path: <linux-gpio+bounces-26388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBBB89AC7
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4067E71A5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D87313E3A;
	Fri, 19 Sep 2025 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WVyiFXBq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFD1313D70;
	Fri, 19 Sep 2025 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288395; cv=fail; b=lci0bOV9DRaMWAfXlMKmjI58CKH35NjE4t6CnTC5/EfbJg2vRfxCU+s/DEptmfUGy1VjW7rdM9EhP1W7q7lKmGBpd7Eh/AJXtFQyowULde7+Zk6GNT4gYwFBnFSAweOdqvnQB8aWy2WvLimF9QXyFJDyWBVXDjqqkYVktFpqO0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288395; c=relaxed/simple;
	bh=JJRcA5vMzHdmZKxtCpJoNK4RTyNdLJG8lB+5kDTdIig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UdgbjGRXJJnGZQyTCVnBiqnTuum3IbejL7pMi5Svrt2P+NVQwMrLylJbpR0LWN8kw/gkeDfivA0u4KNzIZkcA1isZIaifwZc9MWxTHyDH3TCUqmdYHX2Yef9qAICZf9l2wv7HNPmuHI+QI2M5qYl1r+0jIyOgRim4/jSH/B+U34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WVyiFXBq; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5EqzsJRRTEztBPi44OYCVLSGvIBV8aQxDe675yNY4ks4JHerGs0di+Wrp0OgCSTbVIkeZVLxWQTznfKbZocF5nZ8iwcoc3bS8c1XcEXuGTyOY1ClFnZCgLHVJbAZZ2Nti7zG0q2Ivhql6HNsX+3/vfLs2wgeaRTelsiyKc8xJZtaYyxl7mjegX11sRm+IytFfgkQwrh1q+DNZrn8xhNBFDO0xEanBMJJXzjkOOkyC0JT0j5m2Qs+bUJWK/pdg7Rk0uXi5s/PZFT6FuD5ip80nGrpf0h82A2f1jOQuYckWepEi/NeqpJwLXU4XlY/3OPFggxw0vTw9Cua0Wqt+xMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6LDpygCt7W3oVsapPOIF4rOZ4wIsBWChTtGHCUsDME=;
 b=r+3Sf6ZG25fgSRpW1afT3I6vhSNv1oHhAYikk8ulSagmjR2fdWqaab9ZcDWSQzDzW0BSObE/etHs26ztsM6Zi2umRkc76wVLSVZvXLtgSQRJy6CQCJTp7OjjNu26exfgva1f0bZ62WFFNpztPzUw56iurRceNEi/1hPGVsk/b9ydTw/CqI8eBv4KaR8tRyhUP3MVSIpxN7oqjyLmq5Aj2Y4AkU0yMH4CebYVWdTVjg4H8uJpRoFu96zdXGz65pV34AsPZ8ZZHxHF0CEkvFBKtDOQWyCYVyV8fRpI09p7ug3CDJpD64tbGf1++wuFBaEjJLnnPD+xuRcy9/T4Z6bSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6LDpygCt7W3oVsapPOIF4rOZ4wIsBWChTtGHCUsDME=;
 b=WVyiFXBqG5m6IUWN+E8Cb/tJrtrBamW0JJX2kSk8x+kD4JdIDXnPY/rJEaSy3fxWaqY7XYOLW7eyoVq7SFafsVZoHJglchgJQRexVu0A930HgS2alsJ4e9OYMKNmUWVOGfQoTe1Rf+9DrGMoygPTVsn+fBWRuyXg90vM5TfSJ8/946u7oz2PUX1OPGgRyZhl7e1LBkApbpIjmbVuLFjWq4uismozPKZQvO+UD6QD4/xHrfE3RWTlToEqDoR51F92f7d+N9S1EGKdCnjadVM2g8qGG2FsfM9wj61VZKG9ETQ/EtQowxvmBfESWqXc7QFtuY1ucyBLyJ93UITIMdWkhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:20 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:20 +0000
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
Subject: [PATCH v4 08/11] arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO controllers
Date: Fri, 19 Sep 2025 16:25:12 +0300
Message-Id: <20250919132515.1895640-9-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0039.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::8) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: bd98c985-a32b-4143-cb95-08ddf7801ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mffz+vUU+9CX3oX+qX8zcwmPWDDQyDTyl39eFQ1XwK/GEjm9Mqe4gEV4QR3e?=
 =?us-ascii?Q?MipuOtfmuEFsfaWZvaHVwyTFk+CgrL10SGnWajW71IqO1Dol+4aaLWo+45gY?=
 =?us-ascii?Q?ls1PvttDTb7+OGfv/0xXPu0cJphGsZUyPb2Ir7PeL4r6+jdGpl1kvV9cZmqS?=
 =?us-ascii?Q?Tg7YUUmNh7QC/zuBH5TkNOJ5V6Oyo/P+9J46zMoTDevpIvsxzUR8fgdyJaI7?=
 =?us-ascii?Q?7PM+UB5jUoGf5F9D9/3GQA7NMPhni2nlOQlhoE2lF85bIKGOj8yaJRedtHRA?=
 =?us-ascii?Q?rl9rGV0KdL4/ek8V9JVlkvw/4b5ORKHOvWre/7Za7uP6O+KOW+l1OizAVivn?=
 =?us-ascii?Q?+4NpwaeSzfwhvZ2AMznEJFGKKGfLHOhjLnIvrb+ttuPDmeBYbfNrDfndUv6q?=
 =?us-ascii?Q?0A2HCwAD1T65TRb3WdBbnKSdip3qH/5SW/8LRQfQNUpP5xU1ZUrC1PCqwpsz?=
 =?us-ascii?Q?8zRDSAZJkkPYZlEtjzfhBFKecf704tnZVIBd3gnC8Q5KkhMooU6HAEPVSCnD?=
 =?us-ascii?Q?+OHr7fx1Qdv6FbdcyEKhZQnxZp+y+C4mCJOFXbNHud/ih2USxmwCJH79/Jt+?=
 =?us-ascii?Q?AiIY7FUchhJ4ZudbA2+r2GXXaJZPHuPqkeVhEUFhDPsyK2ebmKqGmpq9ecgh?=
 =?us-ascii?Q?mANli7fSsMGC38Bdv42BhxuauENkuGSPz5Cs/YycQEhX5aBHQeqPwLgKJbPh?=
 =?us-ascii?Q?YgzifhYbDQCgEMZw19hgaKXf1ABYQUH5qPWfU7tq/a3E1JrYQns2MKpfqgLn?=
 =?us-ascii?Q?997oWIk89/DtRpVXQp9N2lMHmt/+6ySTduMPaU7U5ti/93mAQ5sI+gQPdq8P?=
 =?us-ascii?Q?MvmzXCrIQMeS6aPSTOaz9wW3tnHOfsWmD/Pg2weiUFW4PRBc/YqpPmZaftn/?=
 =?us-ascii?Q?Nk5KSf0AqOA1WVkufFYQR6P6+4Xj2VlaxAlAghVMrSawLg5ltk5+coOGLKnm?=
 =?us-ascii?Q?RHGGJnMvVbzOlOztrH3zdeMu76X2HOw5q7/+UovOKD5z6Kxcun6c4JwVJhRD?=
 =?us-ascii?Q?fY8SbntShrnc4BJJ7yNVgQzf7gp45lwHgL17d0zg6VmE/tSMApvvLmECC0Md?=
 =?us-ascii?Q?mGGl0T2sIWqGdyde3MWbaG0yBlToT8DFfNwFgBPi3QlF2N9zF/8GX7mYwVEW?=
 =?us-ascii?Q?+xNArPZ+gtKBnIWMr7FHI/6taZ4izNpZbG7Mdm/AjaAOKSvOKD7jGliQ4zF9?=
 =?us-ascii?Q?YGWRk7lB5dc/g5qcYWFjZvLnj8UC5xkvE0EZbAtugEsrJpZgkCpkX5EkcwkT?=
 =?us-ascii?Q?DtUd14kh/WdK3BvOXBe2FL+XfxaVo3rBP4X+zKkQeH3ljZzClrtpmf6djLRr?=
 =?us-ascii?Q?S4nPSjmo/U7n5xuS1DcFsDeOj/1nHY1kFfjvGCDxE8xPpoGe04B9lMAYRfMz?=
 =?us-ascii?Q?Upsen30++uSLFBsoACDW7iFeQ2413UERna9O6BCQSA1Olt5ZhgTWj2o4Y4Q6?=
 =?us-ascii?Q?JD3eS95OWMVWr5liJLohWZaq5Up0WfNeHA8Lsgit4xBJFSFcqu6XTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GQzF7A4B03naB2y25ezOM3gIt6CTJXa9A9vD91q5Vv/gpOr+NNLW2X0vz+s4?=
 =?us-ascii?Q?fzJQsVVSNgFyzE9vowr1n+Xo2SjCM2j9dTdWxHkDKxmwUCT2SvpvdiHwPaZV?=
 =?us-ascii?Q?G5McXn9Dre83iR4RFJuzzKHx5ogCXC/9CgVoGBRDOFyQMxrD4vlYwhmDLSRn?=
 =?us-ascii?Q?vrgLZYtDxzlepKFJA0glz+jGnLIosmlTEFuMwk80+EMGzIpnTJfBRnKQvisJ?=
 =?us-ascii?Q?HGYTBplSXwFmH9fdjMyhIFgYgFynv39zpSiJM13Qd9IKvyKGyL7WFGFTyyni?=
 =?us-ascii?Q?PwwQdXPSDwJkjMyG1/JzF5xMAdwex5Jbg3Pfr5qxhs+a2n8KrHtyoc0U4xAE?=
 =?us-ascii?Q?BqCc86EtFSqN34iVYVXabv8HmijLXXpRNenbk0uArks6vD5YBjzH5+fwd2xb?=
 =?us-ascii?Q?1Ueaqj5ICSp6RBj9QZC2xw+WR/P+3IM2eSaiFs+VDVpaY/ceODz1yajRFg7K?=
 =?us-ascii?Q?s3PkilEzxehUno4Tq4G5p86qezkDbKNh8bSfFyqiWfyZI415K0fdOjoOeeKW?=
 =?us-ascii?Q?Yw53Uec9kwf9yeWtzpq7nLbN71+DlJ6GG/j5hpppjdam1+yuHfylV7zoGF2x?=
 =?us-ascii?Q?6hShM3rtYwM56tsoXZ44SoKloUw2hS1mn2Wtm04IDEoDYlBRIjMFpLoiHRm8?=
 =?us-ascii?Q?P78rH+wA/wFD6evfMBbYwnvxGWn38/zmo6aeyRGkooEX8eZMBMxvbQTRQicZ?=
 =?us-ascii?Q?bl++w2nY6DJSyZrPfcSaSIeGNx/s9VPs0M8JR3ZNpodqVmqKU7/0a4dKOb6H?=
 =?us-ascii?Q?I3G3Ml7oJNkOKyTHF2lSOYE68xdxnTY1UXLflBUnbg7YFZvhS5T/o27XXO/P?=
 =?us-ascii?Q?wuaBrB8UnSy7pbZEfmhgpMu96FuIFwEv9olamLzpygS+7g9k7dFrRqmrxUm2?=
 =?us-ascii?Q?rZjZ+5c/TFEgwiXPlYgndA8k3tq8ztJLqLkVwtor4QJr0VMoUiZCMUOZUbWK?=
 =?us-ascii?Q?+uP56TFDrfhu14VZBN0jMkKw7DcFFbxnYe8i37TrEUYY2/QtRgIJTR6CW+DP?=
 =?us-ascii?Q?ykhln+NgHw1PfkYVGZRebAWdTznW8Xnk9D8ilvy7Ar0T6l4bQVbvcM5RIJXl?=
 =?us-ascii?Q?g3MpjIG0s0mcv5c+41htJbLR5c9DTtrmopOFObiQsS4LE4In52ci2ufnsF3L?=
 =?us-ascii?Q?aUSb1yVDNsPmDPbJxV5vKHnOrYPgK6VwFOsVwmqK3X0po1oVjHPuu5QvxYUe?=
 =?us-ascii?Q?k+42/hKgBKcv9wVqIVsJ4VMi+9ft5YSQh/SBZy3LCgjTAlSxe7ZHOy4E8pfs?=
 =?us-ascii?Q?sy72J2zXHGPdkLka5X0ZitLvh++Rte1asqj7Mtr5ahkIGaWnvOuEbwh0yjDN?=
 =?us-ascii?Q?yDkHz46M3E8YJuAHf/8bBG4RFu8hbbmxt2oTLNo/j9GtI9hjnhtaxtMXoFdd?=
 =?us-ascii?Q?4b8UAfiR1VV8Z4KnFDRIdU/Cs+kfclU9ruxX6/O0ivTzVe0f3a2lZjVNw5pL?=
 =?us-ascii?Q?SnD3I/LigpU1Q552/3OQDPWEw/GrnD13tEUjqEfS2tXKzbWAZ6FW61RhP+u3?=
 =?us-ascii?Q?J8gBhERdnPaVYEJkqnsJSfZlrweq97AbBDcJ0M6sdHyoPqwQCtTu1Uc1vwxR?=
 =?us-ascii?Q?gWjPfbFFZcLEu0CbK+9bbmkwFroj6Rqf8uAzaMic?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd98c985-a32b-4143-cb95-08ddf7801ea1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:19.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwVzpi8WnJ/oYAKtIUUT50Zi5PxutGB5iRM8gIoNeMFO/sBauLzzv0Jv13PmkmxW07JUFtihPBcbKbFkynTIVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

Describe the FPGA present on the LX2160ARDB board as a simple-mfd I2C
device. The FPGA presents registers that deal with power-on-reset
timing, muxing, SFP cage monitoring and control etc.

Also add the two GPIO controllers responsible for monitoring and
controlling the SFP+ cages used for MAC5 and MAC6.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Use the same compatible string for both GPIO controller nodes.
Changes in v3:
- none
Changes in v4:
- none

 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 0c44b3cbef77..4ede1295f29d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -170,6 +170,37 @@ mt35xu512aba1: flash@1 {
 &i2c0 {
 	status = "okay";
 
+	cpld@66 {
+		compatible = "fsl,lx2160ardb-fpga";
+		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sfp2_csr: gpio@19 {
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+			reg = <0x19>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SFP2_TX_EN", "",
+				"", "",
+				"SFP2_RX_LOS", "SFP2_TX_FAULT",
+				"", "SFP2_MOD_ABS";
+		};
+
+		sfp3_csr: gpio@1a {
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+			reg = <0x1a>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SFP3_TX_EN", "",
+				"", "",
+				"SFP3_RX_LOS", "SFP3_TX_FAULT",
+				"", "SFP3_MOD_ABS";
+		};
+	};
+
 	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
-- 
2.25.1



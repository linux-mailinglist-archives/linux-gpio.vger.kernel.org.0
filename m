Return-Path: <linux-gpio+bounces-8233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1849332C7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 22:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B6A91F23875
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 20:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F181A2C14;
	Tue, 16 Jul 2024 20:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="tVN6GxXJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01rlnn2055.outbound.protection.outlook.com [40.95.53.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAB1A01DE;
	Tue, 16 Jul 2024 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.95.53.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721160808; cv=fail; b=n7UKuJGllNVenAboIFhXigvm+2EEQIOm5FlYGrajWuFgVa7NSA31hWfUEk/dX1noLbUizK1jI499qFQTykZ7Pz3tWsLRCfaoRV2vPx3hVseDMSRQAj94N8NSSIaoGUh9rwsfeUIY6gg2lF2440BLxVWcIyDOaz5R5oPCdFvbkpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721160808; c=relaxed/simple;
	bh=lUfvjhhtGPG4kodgC+VtezuaLPntr64L20z2BITRCEE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bLPUZfU9zwMXh8mng55UB25UUpSF21xk4gK1HsDo2w+W/UbWXA2IPnWnhLr6qOH93IvS+l90Kg0bCVKOKBsr8W7gVXjbTTRa4UK+jf5CGMHqHYcRtzBh0m8aDrNUSvSlY5+4bUIPI6vQ67zld5wDZIF08rqaSRAD3tDM1UB59nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=tVN6GxXJ; arc=fail smtp.client-ip=40.95.53.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTtO4VUCQzGuLM3At1GA/gCDWnujmJ9sfhGp+AEgJ4gTihXTQR3EflSLSdDeL7zpJV62HQPQR46AAVG3OqWiEPnnomYoyxrxJ2yHUv/+tyccMFdT+Yzc2bj/oAqJKiYfVTGjpBbisqjhUo2Um3ou2UMiHCMWofdCtxPNb7fK4gscRJ8qoU0cPhumiUgffk0LbKaIBNxIoZXdeZXrSIZdkWQU+VkWChQnj/S1roksr3Zt/01CHsm0rPZWdFwuB0PGXHDtnOuUDCaieEKPNBDDFi3O7IMioEbhklwQoloMrC0mChntGPMqqwM526PU1S/0NuTm85xkmsF04tf+sNgyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8iWpxll0dRjz6NNBG7W6f6ZNHM13rxW/T+lyqcWVBA=;
 b=I18qAfooRNCDcJGyfV736hOy61CPPmeK0fRQ6Lb6htV8wfJVsNqYWqri7WMclbgUMhyPLRHOpdxG20eHKGhP3uWN+QvnocYUIqHtn2AmxmNpr/FWwVWVD6erJAiW2E0pMlw3P3elUj7/5O6OlX9dD9o6tOQEMdezhEIkOHX2o0jIULjFBfUOTd7u7jf98q7QcGDpS8MtwXoJfw6MQh4dcrSi7lPu2+IBpsmq7N56KJQWbORuFiuPxhFgBKHgqA4zUElx/ggFm8oLcrcpcxjLVUCtLrXGI1V9yCxdXSdLM7Hr4MgJoUnUUZVIksZ9Xr6kDIGm1yGzRb+1E8bszHNimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 211.75.126.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=taln60.nuvoton.co.il;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8iWpxll0dRjz6NNBG7W6f6ZNHM13rxW/T+lyqcWVBA=;
 b=tVN6GxXJ/TqptVLeCv26DiUuffAZxLOWvVssIp540c0TdE1o8qwI6um4EgwPn8BjELuUDWzZzAzlIjdnbCJIDkhzKopG4htDrs+yXMX5kQzh1QyeboIzWi43MMc9CxFp72mm8haN6YTezvYElccAMGiu3lxqWCCL4s2j6Pz5jnw=
Received: from SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) by SG2PR03MB6478.apcprd03.prod.outlook.com
 (2603:1096:4:1c5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 16 Jul
 2024 19:40:16 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:40:cafe::ae) by SG2PR01CA0117.outlook.office365.com
 (2603:1096:4:40::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 16 Jul 2024 19:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 211.75.126.7)
 smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: None (protection.outlook.com: taln60.nuvoton.co.il does not
 designate permitted sender hosts)
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:40:15 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:12 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 5A5D05F635;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4C912DC0D47; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>, Tomer Maimon
	<tmaimon77@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: pinctrl: npcm8xx: remove non-existent groups and functions
Date: Tue, 16 Jul 2024 22:40:02 +0300
Message-ID: <20240716194008.3502068-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716194008.3502068-1-tmaimon77@gmail.com>
References: <20240716194008.3502068-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SG2PR03MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: fe302314-6987-4500-45fe-08dca5cf1dcc
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|35950700016|61400799027|48200799018|7093399012|921020|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MhyEhA8VK4ii0hkF23h6nLgT1uVwbSGobWxyJQX1gE4zeTDT7BpbEjV7bGB9?=
 =?us-ascii?Q?4E1sT8PEpE1EhLpJRi3j8KZHYHqvnIo8IXBwtMP3aP1krSFTG/TxbSP2Q33b?=
 =?us-ascii?Q?1+XepN0B7qX+n+PftLjxxhcr6VkdhR7viOtG6Ie3fk7QiUs83EUZagO3YHLW?=
 =?us-ascii?Q?lSyGKxXsp8hVMKv2suq8aJ5Ct4mEAwwZ3NEfsIlpic1cYh4i4TCOpWWVEoHS?=
 =?us-ascii?Q?pkjBrvo9vcFN1ibyRWYUsWNkIA6p5dGFTowR53bfw4rDLIbIQnCNfgUKbiZd?=
 =?us-ascii?Q?Lq3Eagu03UiYWISiV5e2zltM7OvRXAoqIVo44XlXaRin8X92Uw/6PW+sppPO?=
 =?us-ascii?Q?jwcduaXa3wJpX/VJg52K03/z10lv7F6bjazA7OncpWF30kFYpHCqjLY+/lY7?=
 =?us-ascii?Q?x5mb/xYetYBzsRN2oQ/o0QCSHkBrY7hOpoHKdOBYSu41WqcK7JhQzYz/PC5z?=
 =?us-ascii?Q?vhAewoOSEdxPQKoPKSJzchWFDsqKBGkaKNM3EUYziiJXPAmxna214MrvTWAU?=
 =?us-ascii?Q?8m4mjrkuiI8ZL6Pqa3qwtkvu3ZC6SerqcgZ+/3BgGK0TePc7lSE1oXsG1ayI?=
 =?us-ascii?Q?VFe5SmVletHqiNV+twJ4kK97A2Ap4S8fESc0I7qycBhfEpzjfvMN9MKhCjbM?=
 =?us-ascii?Q?bA0kHW+hMhT4hD7/TwkqKcMJKJ5iH6uL+BYWQ/OMUNvRICx59roHVxDgrmiS?=
 =?us-ascii?Q?WVSWfgMs8PZSP4Nq/0xECqyaRaQv8aNwyG8SMTnSy22BCN4Iwv1gH4agHLtO?=
 =?us-ascii?Q?LSr/0K8CWXb5kc9eSycwiJRZ6AFQW4LbmGusMbqLRgF1df0Occo7zRhlNBpX?=
 =?us-ascii?Q?9UyoYWCc5vnSOhI3aJgpX3caQ2GMQr+BH4Z3KKf2rnfyGi8iAsMocIqCmcLQ?=
 =?us-ascii?Q?NYbtjySnDfhpeRz2PZQzWPp0DCoZ0DZJRxL5YgJS4TLFQ1GAYbGg6Ih8Etp1?=
 =?us-ascii?Q?6a/iVeQb2f3jYXHd9IBbCtskWYqxzOb0NOj2/5dwufwQE1Es7+6QIY63pVIk?=
 =?us-ascii?Q?fUdQRM1unUyJZhNg5NVGAiousOhpngl3CQPKF1ZT3G7ro1T//PXUSE6gpuox?=
 =?us-ascii?Q?2jC5XbIvJ+J3tR+wZs1tM4y0Wq9YkvRA8wPYnGIoV+yHHQ1kND28qWdGxBft?=
 =?us-ascii?Q?/f1ynoTh8bsbYaLKgHC3e9y3NXd+AGPKMXoGIhd24PxPFyDhBdPRflCIjemI?=
 =?us-ascii?Q?/IxfLXmtLgOGlX5W0Y0HpW9GMeIHF0OD3wMSAYJIgB7zum3R8iBu/6jQtixC?=
 =?us-ascii?Q?ldh/K9ePIbvKupwE+mA+psejArNtNgXBZrfNS+5/dhlSbVUMYhPMOktOpfOc?=
 =?us-ascii?Q?LKATgZiGuZ6YbUIi9X3ckfFMzHpJj1G8Yr5Q/0V5DMbce3kIHnPhjxzIDC4A?=
 =?us-ascii?Q?rDJscCv/yxkz+GOq/Z7OvNVqLkVHDXf8gmt8eJL367cNI2v+xXu1PKWGhn52?=
 =?us-ascii?Q?muBWse82Wwo8A6n874i1Sdpc4Q+kj3Dj6bADnpAhXEKV4qNKKBLNnJLyeWoM?=
 =?us-ascii?Q?2Is3+yvt7EKpyuY=3D?=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(35950700016)(61400799027)(48200799018)(7093399012)(921020)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:40:15.5413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe302314-6987-4500-45fe-08dca5cf1dcc
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6478

Remove non-existent smb4den and lpcclk groups and functions from Nuvoton
NPCM8XX Pin controller binding documentation.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 70 +++++++++----------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
index 814b9598edd1..8cd1f442240e 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -71,51 +71,49 @@ patternProperties:
           One or more groups of pins to mux to a certain function
         items:
           enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
-                  smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4den, smb4b,
-                  smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
-                  smb22, smb23, smb23b, smb4d, smb14, smb5, smb4, smb3,
-                  spi0cs1, spi0cs2, spi0cs3, spi1cs0, spi1cs1, spi1cs2,
-                  spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a, uart1, jtag2,
-                  bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md, r1oen,
-                  r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3,
-                  fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
-                  fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2,
-                  pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg2,
-                  ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
-                  smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
-                  sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
-                  mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
-                  scipme, smi, smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c,
-                  smb7d, spi1, faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2,
-                  spi3cs3, nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio,
-                  wdog1, wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0,
-                  hgpio1, hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4,
-                  bu4b, bu5, bu5b, bu6, gpo187 ]
+                  smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb15,
+                  smb16, smb17, smb18, smb19, smb20, smb21, smb22, smb23,
+                  smb23b, smb4d, smb14, smb5, smb4, smb3, spi0cs1, spi0cs2,
+                  spi0cs3, spi1cs0, spi1cs1, spi1cs2, spi1cs3, spi1cs23, smb3c,
+                  smb3b, bmcuart0a, uart1, jtag2, bmcuart1, uart2, sg1mdio,
+                  bmcuart0b, r1err, r1md, r1oen, r2oen, rmii3, r3oen, smb3d,
+                  fanin0, fanin1, fanin2, fanin3, fanin4, fanin5, fanin6,
+                  fanin7, fanin8, fanin9, fanin10, fanin11, fanin12, fanin13,
+                  fanin14, fanin15, pwm0, pwm1, pwm2, pwm3, r2, r2err, r2md,
+                  r3rxer, ga20kbc, smb5d, lpc, espi, rg2, ddr, i3c0, i3c1,
+                  i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b, smb1c,
+                  smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, pwm4, pwm5,
+                  pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc, mmcwp, mmccd,
+                  mmcrst, clkout, serirq, scipme, smi, smb6, smb6b, smb6c,
+                  smb6d, smb7, smb7b, smb7c, smb7d, spi1, faninx, r1, spi3, 
+                  spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, smb0c,
+                  smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13,
+                  spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, hgpio4,
+                  hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, bu5b, bu6, gpo187 ]
 
       function:
         description:
           The function that a group of pins is muxed to
-        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
-                smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4den, smb4b,
-                smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
-                smb22, smb23, smb23b, smb4d, smb14, smb5, smb4, smb3,
-                spi0cs1, spi0cs2, spi0cs3, spi1cs0, spi1cs1, spi1cs2,
-                spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a, uart1, jtag2,
-                bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md, r1oen,
-                r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3,
-                fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
+        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi, smb5b,
+                smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb15, smb16,
+                smb17, smb18, smb19, smb20, smb21, smb22, smb23, smb23b, smb4d,
+                smb14, smb5, smb4, smb3, spi0cs1, spi0cs2, spi0cs3, spi1cs0,
+                spi1cs1, spi1cs2, spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a,
+                uart1, jtag2, bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md,
+                r1oen, r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2,
+                fanin3, fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
                 fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2,
                 pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg2,
                 ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
                 smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
                 sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
-                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
-                scipme, smi, smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c,
-                smb7d, spi1, faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2,
-                spi3cs3, nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio,
-                wdog1, wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0,
-                hgpio1, hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4,
-                bu4b, bu5, bu5b, bu6, gpo187 ]
+                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, scipme, smi,
+                smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c, smb7d, spi1,
+                faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi,
+                smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2,
+                smb12, smb13, spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2,
+                hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, bu5b,
+                bu6, gpo187 ]
 
     dependencies:
       groups: [ function ]
-- 
2.34.1



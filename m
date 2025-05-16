Return-Path: <linux-gpio+bounces-20251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45138AB99A5
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 12:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F56C3BF660
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 10:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3479E381C4;
	Fri, 16 May 2025 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OPgeP9LF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2055.outbound.protection.outlook.com [40.107.104.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1470233127;
	Fri, 16 May 2025 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389771; cv=fail; b=lBwSFBd+FedNnimShH5caIhuAFb6rjuF3bbRuRcSG8NsCIg/OXDOriYj4pBuBvyNRlb6t3IHIeix86cy43VAOXlu6ElNTHbk1RfpZw0Q4wBUXIDtbgHi6O6JDHo/b0XedZCC/KrAyeIQ5BDGO3NWb0BTzGtgNATBgkjymyYk3q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389771; c=relaxed/simple;
	bh=C+yJBFfKf9PCJcWDqdwOoQ4dFvZn9j/wGql0UXd+/MQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WIWxhgwPUG7mdGmZzWhefNVCMt2bOAMokpyd7VcgTetjNm6O15/XqKF5UZiPEMRj0lwxG0uQ/Yhfa7SvSjJpNfm2gKpRsI/sELh4KTY0PeL1+jEckQV/6ULPK+XJcGoyuzr31PMLn+Po34vMmcGfB1CWn6J/GII/zQAnxoYZYI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OPgeP9LF; arc=fail smtp.client-ip=40.107.104.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNy1UjxSKeiGrxsdT96MIlct5PaqvoPBsHWA02K1d9tpGV+moTlquE//nfDbVHTw4WLhGL5JDd+AErpWJijR+1s4krdDOQjOmG2T/ZvIwxcEKLvNYXsitEKw27OYyF0LeXtZq0TF2tt2CJDAmVuVB3MPbRmDjJJlqIBi4iT4SyuXBQBcHnJxqEnhM54Kohcm4l7euF8WJ6rf2SRs9+E/Bxoc+UPlvL+JA6XlqaRR0rPgeUXTp6R0mdOGm56tl77JxtwyU/VhAWQqouFCIV3KsCBnJkjmX8sH1UIUX8V9poaALxbkI1GH1FdCyhC+qROCrg3GrYqhjK8gmEs1SpdVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5jKwj7VjHkZxtW15RpFotIpg23xzA74pCx86T8iq0w=;
 b=ZISqmsKP0n3yGRvIAhy5sfxFMRlI4lMTajAeaoa4XBVhmGCHkYvkZQjJCX0wFu2+0Kru0m2En11do7BrLaPmA7xb0l/6suXwqTcc4p+49Mu2kNzqTA5QsCqhU+31FY157jR9URO7gpgVTPJCacZNWS6NANmsNT7WQ2x9cwJJSJjgwxIGK8ohoi9Fh8sbqIiacr7jgqCEgczd9oTjpUQ66qoPmGO7ZYAoXr0PmI62+QwUKIxYZmXVLTKshAyTLXMGMMOiPDgForj3nNxCiUMcH8nnf6tlL5ndXdNJ2oxiJnXQfWo73vz2hBqOTxvvfV/SHdI2rkDuvL0/SLIe/3X+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5jKwj7VjHkZxtW15RpFotIpg23xzA74pCx86T8iq0w=;
 b=OPgeP9LFwPNhBW4ZLtdAgGfVCL60XexcRQvkdppSvySR6Cb2rK3skROm4oc6q/QKXWBKe1NqX96kpMxjcC/reW+bxdcdFepy4r+aI0i46GyW2QWAVjB68cHL+OcUCl2gqN4qZh700dcshDtAKLseplS2biyqbJvLFftsvLZQDyjPZ9UBVyito51G670z/YAjAToBoC9qWqsbxMURGr+oxL9rqhOrkt0lb+YRO7ugNooEMBirR/ebPjj4PjiVdaVsn3kD8nY8GD8mh8aoS3TfNIsbVVOTfYFJPrqAV+vdi77IN34v105XH6z8YNr2oEqA12wSug80n4Z+MXHIySzQwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 10:02:46 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 10:02:46 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: sudeep.holla@arm.com,
	linus.walleij@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	cristian.marussi@arm.com
Cc: aisheng.dong@nxp.com,
	festevam@gmail.com,
	kernel@pengutronix.de,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Subject: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
Date: Fri, 16 May 2025 18:04:23 +0800
Message-Id: <20250516100423.1685732-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::20)
 To AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1ad467-bb8a-4799-3f57-08dd9460ce96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DQ55A6Pwba1weZhGZkcYxdB1S/L8TfGTp5cOmbJbm8IG+lN32lYtiLADcMJk?=
 =?us-ascii?Q?XG+2e8m/Dz5LcvMIfYDj/w+Kbas1BXV6DRyd+Vvh2nuok2k2ASa7CX6BpFde?=
 =?us-ascii?Q?sIsOOYOL9V1BUSs5hfQcuH7LrKdOew8UNfl0tDMnCnAFDAr9N7Vf5nIJN35z?=
 =?us-ascii?Q?8HNhxVm2tPOII1WHYk9vqk3BP8rRaVfpqRPHzfyUwNS9eme27jr58FBZ79xH?=
 =?us-ascii?Q?FFiYYDeuv2FEFUS4o0Sm0vIHhslrRhcZnb0CLW2/Vmnalym0ExKiYspS7OnB?=
 =?us-ascii?Q?H3Iy5xtFc/DPwKDebknmbu+pbRB8YS9Kk5DqodOAWM9mxBdxfueB4Za4GYDT?=
 =?us-ascii?Q?SwdQxOdCQxSiJI917AjaCw4ptOWDWsH1qknToZn7N7OqtXPSrThk54rGgm8C?=
 =?us-ascii?Q?YZ3G7ARH/rY0URDRWkDdFQ1NgyAGdNfswNlcN6BXV2bpzXGZz4pdJJZrkqho?=
 =?us-ascii?Q?CjMzU7/SPgk3XaMcxfYXONAQ9simt1Yy5HwEn+BK/e5eiH8371XickuWVLwW?=
 =?us-ascii?Q?c5qXSDv77CO2jxGE5B2kt/nhsbndouDcKlBUnKSUNfHXMhl5z2qAr2r6njG1?=
 =?us-ascii?Q?P52lp3DZl32OKZdBTw84LMFH5y7M8r1RL2un4Ln57T/PjtoNmfp3+9GsXsKl?=
 =?us-ascii?Q?1Y3GjiaSqnkAzDKZRy/XyGQPnUmIzdeXNn5J2JkA4HOXcMrVMOn6gGsmDkxt?=
 =?us-ascii?Q?h+xKIb1PGLlD7y/YOZMMXFEiFt5qq5y/Lnc2w3I7UN7m7ZqMEhDNaVyGLVw4?=
 =?us-ascii?Q?8b+IuL+/FO0OjwLl0Wv+OKtCdfum/CLypm33Ty4S82la0OaMFTQ49d6xYUlw?=
 =?us-ascii?Q?RGa0pvFAmM5osYVgva6age5qisR2R6uxhRIN4VkygVLejRqxMx3v2AO8iZct?=
 =?us-ascii?Q?ZEIR/7k+68F97ylAbxYEvww/RiS2Zvwhru4WyPMF+SD97Of3+NE/oKLQzPaS?=
 =?us-ascii?Q?tNLfuNGr0iDiwvfaTujKqGPQkCvHokKTXO50EHm1h3fiG0btrtbd4mKDQpOV?=
 =?us-ascii?Q?afWdV+0+5YFBVS1LK3flO7lFMvwTuxDAb+NBRaShZZPRRSEhc/NZ7bd34jIF?=
 =?us-ascii?Q?UZLseQuoUMUI/eV0lKPUzQVtgo6vCAnS8faoPOP5iSH+OBlteajab9S8yBOK?=
 =?us-ascii?Q?s/yHf7skqlH04Uj3ICodGZYyg3uqF5Vtcmf0+7z8gCJrwflqFqHMTy4k4u1Q?=
 =?us-ascii?Q?MR8/BaV6iQH8Ekz6brDFAaTVcCXCNMIC+a5XfVkhSiK8uMytSU0OS14ffAAU?=
 =?us-ascii?Q?gRUlgGaUfDXhLDq5dMP548OpJAZxoaFYj0di1FticUL+qOJrjkDQiBBfDOm+?=
 =?us-ascii?Q?6kU+zN73afu+To8e1PZrq1k46aQNV9OjLInAbFYSZidaUUPgaqY9FCviiH/G?=
 =?us-ascii?Q?TWeqm9UM8fxtR0WsFnafp6K7tg6SCfmSBtjz3Yl4Lghd0x+Q49NngdKvFdyy?=
 =?us-ascii?Q?7y+N3Va3iw7pVupgVHnfjmpVYU/a7FxsUv3Yer+p4Mn1qUm89Wji2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4FgLULMb6zyCkwzxIzRORFHbsdP8aOxBFtRNlzY5O3uPhAoQqCNvPOlvhGfR?=
 =?us-ascii?Q?atrD3v5Wak4KeiEIE1JjDQR4f0fpt7pYbpb9hzpgbRz0Ue0pwjIiwmhEZ6MZ?=
 =?us-ascii?Q?wmPh0VIgtRzJ3WcVq8NWemVfQqVG2XA46qbi6HUx++wDTd/1HW7vYFvN12/A?=
 =?us-ascii?Q?bhRSqK5Z84oWPPsgEjkB36WS/aG+I47yEdRjpOhu/hyP2no4FVUbfvJoBA43?=
 =?us-ascii?Q?/XHCIM6byP/TVGKhuLgTHTbQEYIok2l9B1IPcgbnI7gF4JprJgO0uW+HUNSW?=
 =?us-ascii?Q?1MXxgrawu8SelUBA1rywkQn9Yo0Pdb2hUd5y1q/Z2jDUv3ocAWjZI6XNqpZo?=
 =?us-ascii?Q?Wjph3lAX7F7yecI7EBSlu/sp1O2tZ42MmyB5YqL47zAbo48hpCrTiYz7eO3H?=
 =?us-ascii?Q?SJitPMEVWpvRT6/kb3jRW5vHj298vQRRgFuyLKc2mmJ+7VUnL9GQiBDd5Uhz?=
 =?us-ascii?Q?SbHn28Ic4Jmaf48DPLCdQTSb78j80qI8SokXeydKjItAiDbZh6lw3i2DRILP?=
 =?us-ascii?Q?q0VTS0WzEAgoFeK/PsGlbl4+zAZk/w72GFkRhg7loDm79RCq9vQPwGoekHJr?=
 =?us-ascii?Q?EQhUma04lINMmtn9SY6snWGGxZBqSqf4t6PMZftB8eLt+mEtStvm8VUjk0E4?=
 =?us-ascii?Q?iyHo4g4FE5KQ4uooVzhqQdasyvY2drd+YT3Z7VeHGeHysZxMz8e1SafZ6DzA?=
 =?us-ascii?Q?TtdgggS2yXACziXqXiV9r58Nhjl50Jxn+Zz3cn9HLarNdOBCelADEzHDorxL?=
 =?us-ascii?Q?lK2PE8eLn1CCuiuofX24kUx76abmsf94dARvGKXoAohgFJpl8+R4KQ4OWgWF?=
 =?us-ascii?Q?fGxLRkAHcWR71ZuIJ48eEvNEKJGAweav6TUrgNnJ9xN5bwQmQfYh46cEsyPy?=
 =?us-ascii?Q?ZbsbGy0x+sWGxgpYOCzR4/BU8l8lS7f/RIX5q5WYUoOeR6zxS1dwMlo2EYCH?=
 =?us-ascii?Q?Mzxap2CmkpyOoXXbmp1sXRZ740tmIRBH3Z6aNTUiY7jN+30A39HxoS0F3PCz?=
 =?us-ascii?Q?oZEqZ7Y4dmlrXJFwZA+Qr2y2H0zBOTvSJd7a1H0hxYmvCXM8TkV0F9WtpetS?=
 =?us-ascii?Q?vuG+j50xM0DwVZQJPnM+l/Ihfk3nhoUv8h22BwqtdiOmMYFcvrxZvDaEpmUg?=
 =?us-ascii?Q?rXQM6bJKkK3/pXu+NeLgaJO0lpCCSNDrjuV8bpLZQUzP2Mo6x2/QCwEKw77D?=
 =?us-ascii?Q?tBHwW9Wz83j82JaYHbmQ/G5/t7dEFO2Obek17fb7d5iQEOsscey8cdVCbhbP?=
 =?us-ascii?Q?Xs6YAW46i+cOiskU8Hs/6JWjxdKLOfwPjbLHfhqMkyQiSAS/8L9hP6KGh3Tz?=
 =?us-ascii?Q?4UTcx2X3IkGE+20f9ti2IzmcedZRzEtjgNxrCeEcaT/bzlDYaJNU5KtsZiG+?=
 =?us-ascii?Q?NKp/kedGtoiboxme9a/CYVPEvyXy6AvESoJXsUS9hwIQQ+WeH2ik3vyt4jqn?=
 =?us-ascii?Q?tduqoJBKoVvTjNyVIska01UDAnvvPlxcHTio5HNlzbVE/MB8HdbRUc+MhD/O?=
 =?us-ascii?Q?14Aj8Y7Ds80/46H1cFy9sZ8wm/ftSX1MomzkqvSku/HVeAOPLQ4zoWpiuTj+?=
 =?us-ascii?Q?jNam+cRm6KrWAKDReC9LJQH/TuM/zw1Kt8tes0Ym?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1ad467-bb8a-4799-3f57-08dd9460ce96
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:02:46.3256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puShz88bmtDxeH5UrCoOLHA94kBsh86DtdXsrk6fn9Vcj8cnd7PHoUNMDs0gdT3ClSKzn2pB6Qhx++tfn+gF7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

The i.MX943 System Manager (SM) firmware supports the System Control
Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
The base offset for the i.MX943 IOMUXC Daisy input register differs from
that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
i.MX943.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 - v2 changes:
  - refine the commit log.
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 4 ++++
 drivers/pinctrl/pinctrl-scmi.c               | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 8f15c4c4dc44..4e8ab919b334 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -51,6 +51,7 @@ struct scmi_pinctrl_imx {
 #define IMX_SCMI_PIN_SIZE	24
 
 #define IMX95_DAISY_OFF		0x408
+#define IMX94_DAISY_OFF		0x608
 
 static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 					   struct device_node *np,
@@ -70,6 +71,8 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!daisy_off) {
 		if (of_machine_is_compatible("fsl,imx95")) {
 			daisy_off = IMX95_DAISY_OFF;
+		} else if (of_machine_is_compatible("fsl,imx94")) {
+			daisy_off = IMX94_DAISY_OFF;
 		} else {
 			dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
 			return -EINVAL;
@@ -289,6 +292,7 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *des
 
 static const char * const scmi_pinctrl_imx_allowlist[] = {
 	"fsl,imx95",
+	"fsl,imx94",
 	NULL
 };
 
diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index df4bbcd7d1d5..383681041e4c 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -507,6 +507,7 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 
 static const char * const scmi_pinctrl_blocklist[] = {
 	"fsl,imx95",
+	"fsl,imx94",
 	NULL
 };
 
-- 
2.34.1



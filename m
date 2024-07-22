Return-Path: <linux-gpio+bounces-8338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBD9388E9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 08:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A89721C20E2F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 06:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE75017BD6;
	Mon, 22 Jul 2024 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LpHsVS3z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457CA17BB6;
	Mon, 22 Jul 2024 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721629705; cv=fail; b=QLtUyDXkG/Xr9tCgYcpgPZKcAftKXszghV+a2Ex9J0dVm2xFmogOTOvk7o398tMSwT0SueY93OvA9fboWT+CFXkj+CS51+Dl9B8f4xf872aPbNDYSyzzmw1BI6tYSfgH7hu0cfDG3uNALHf5WWNmsDIIUIRorydshhjio3LVb9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721629705; c=relaxed/simple;
	bh=Q+Jk2kBI5lYV3XWrJIsfzZRsdCAXrpHgETxDbNsTNEc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iH+HtIrso57n0Ny4Chsdhqm3j5OOSgtcKUQugJFO7ka0MxETypVnB9lNe/3NLeDCW0Jknpx+rbUWrqECmcI/D5TniPdu5jA4ysnygG2WmMMcNi2wUhwaoquwGYTyyF5PuwS3iD7lLyysMwENtoBPHuAyPUjg4KGrqy5RMtkla1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=LpHsVS3z; arc=fail smtp.client-ip=52.101.66.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fv+j5Ct8woiym8N1PjCnHOAP76xnxeSPp/Yvta7qnK7qmvFlEHu+YdU6+PpV3XiASYDbzBGXc08PFXbpfD+RIHbAifbEi/ivqJ2J/SPgDKbNUAkQ/eqtPXCvYFK/xF8IRj6Md1AJIU0MLmG5gNkr1hbgY5mkJ5r2BvAZGXGnVj4lVsVVJsku5IZxHbliXtalsNFP40pRcnohKhq8uMZjOc8XTA8NMSLgMO5O/f417XywsUxEvS6rMdkRVzodbwZC7bWwoK4FPvQB7hwYPnjnzLjFnZRbc7bGJLKXD64CmXqHDLxfiexZXEHqBG+ez4pkgnZHnqEPqaWkbyWX5g8+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yfy6ZYmkjAFbVvmZfT8b8bK28vcmAlYgbvfhooKJSI8=;
 b=UqTb2dwGrKt2RanKj0DfPz4WRwvpe26EYKrWS87z2+NlJpU3aoeS3ibtjpa6/FRVzlfBuHqODZXH3emyWyL/GYaBE11sksvGRACAkRfq/Cmo+NwgHgki9cR27oktpD4H59Z43ZezXbvpUlBtfNK69aXXrxTq6c+JcENc8kS8jx9UKA7OCPUvT5t7i7vsV1ESLkZNrQQoKFl0MHvYr7x3EnNQKyuDLnI6qfka022XZKDl9/gvHYC5zYYtH7Td4+O9ld33LoDQBKTkRIKb+SXuohzvCbaANkCEziL4zDJrGNaDVqhcSxJf4XXitXX0H9nw9CuqR/LsCaANOaSXiLeuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yfy6ZYmkjAFbVvmZfT8b8bK28vcmAlYgbvfhooKJSI8=;
 b=LpHsVS3zRuSvvnpTEVwH/1S/Y/QWNbBANcDcZgMooPjBUvVfnP+ZzvXsaZStjyIhuYegywnILSBHHs3syqhTE37NYADrM6VMj/5GCQKuVVMUSTCv4fb+ySbKbZIYnEj9zC5xUpnEktPKfkXmo42ENY2yvzrwUbBI5y2RDa6C4SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Mon, 22 Jul
 2024 06:28:20 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 06:28:20 +0000
From: haibo.chen@nxp.com
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	haibo.chen@nxp.com,
	imx@lists.linux.dev,
	wahrenst@gmx.net
Subject: [PATCH] gpio: vf610: add get_direction() support
Date: Mon, 22 Jul 2024 14:28:09 +0800
Message-Id: <20240722062809.915867-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 554a874e-997d-450d-60ae-08dcaa177ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nFthevvJnn4prqtxPwZL0+sQNx7Ru97B1xypASFGZdee6FdeDzF/xr9w1aNh?=
 =?us-ascii?Q?u1tiMh1QkkRfXz4DEpXKVwgNKUVfeie/JVH3wjsHyjX11agbvDLTjZ687Ic9?=
 =?us-ascii?Q?rGiVfsO3urLFkaADyf8/f7xcWBhi0VX7BeEoB3gejDE8RTwSgspQCj/SyTDW?=
 =?us-ascii?Q?/1vMtAQM7NWFA0uz8UGqWEHkprsWsyJCp7z04vysAQthvButoxZ6v6/mAajv?=
 =?us-ascii?Q?zWUhGp8n0fnqDOe5dkZWGH+LA5pQtc2Cf+GTjZof3IosHb3Bd/o5mUcNIU1l?=
 =?us-ascii?Q?CGV7bnsrPXiF2BD8ouVTmxjUoaxkTFrJRs4AYNtvG24IBrdZBWO6GrENdxMO?=
 =?us-ascii?Q?tkyzEWde/WpfXETeKWLs5aWDrsIxnv02mQiWXAdtcI+rDGrHdPqZh4xt4Bvn?=
 =?us-ascii?Q?+4Mv/Z/3KbjF5Ok3sTOhD/pUyROGWXKkP+BMknfETGpw66gHqfcufmubWMTQ?=
 =?us-ascii?Q?/Ny8zspkdXFWftarHEcKw9+xZjse0Yoq6jSOppLsx6aprXRjq4zVMYePZQIE?=
 =?us-ascii?Q?iIwYQTMtXQRpZEyRecieqYxUbBQmgPdehgcrMkSliIVPUoTIQ/V2xMDgTeuO?=
 =?us-ascii?Q?M0g8O/VujLNlCOC3+OGvE2OBaz2XO1AD1YSdDKc87HrkZ+u33+fqYStqeZAJ?=
 =?us-ascii?Q?IimkJxosjnxsG1J/8zA9acsW1iBNbGD21BeIMkqK/9cfRWTMgzyqZMBxwPIw?=
 =?us-ascii?Q?9Hvhd6B/xZws/Gv7Eui5vAlQHlztX90IAU/NfVqSGYtKQ5G7qO9IGaPcGQnK?=
 =?us-ascii?Q?iqrDZASh2Xm9eypz142/um1QWlixj6mQdZ4xs/vGU3uVyddp3RAnlKQW8mvs?=
 =?us-ascii?Q?FV5ZrnfxQsAIGut2KRT4yhf+rBGSQCAc35KRzJDrgv76RnB8wiT/Ro9OgLLb?=
 =?us-ascii?Q?adJNb7AIG1ukyuTobIpilYhwycHSIQAmw9mc1kn7yansIa+4p7/VTlq/bh9P?=
 =?us-ascii?Q?1mmRXg3Fhqj0WJSJuSJEembrwWITFK5QDspc4kH0U0QQrlNH12ppw4g09Ygj?=
 =?us-ascii?Q?SVZDKoKuAWohaosd9Gu/gwHZRtjLCa4X2It5xmYyU5CVbpC5YFFHPafZqVB6?=
 =?us-ascii?Q?Wai9qtXiPzkQlZ4kEi/aR1DbouH6wDEoNbJ8Mh1eAxpC+hXJB06N1PjPkode?=
 =?us-ascii?Q?aXkU25XaXBbFgD8o42q0yPaD6GHHSJYm5/ylwXnaRce2UihL4Kht3GbSmQqb?=
 =?us-ascii?Q?4U0qjE+/WVU8jtRG7rlQoZZpCHn59AmY5UCqq84RwCpPBDHWpUTZXvtZYyCQ?=
 =?us-ascii?Q?6TZ/0tgUIQigfT84WoJ5wHAzyjALs1UkfzS48TSBqFjvYDd/tplfww7CmsRn?=
 =?us-ascii?Q?3njpBwa88uOGtUz/IOIoiin/GwKrYYsxrRBpQFlgmU5So5vj7ETF71lutLWS?=
 =?us-ascii?Q?nTqQyjSTjhNrbS1IMhmQwkeskUvthzirtK76yylnvJ5F0U24DA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CtDY0Qtb1xo4C1SffGEU2ViyZC9iaXBl7hf490qmGZTgGn55mtQidupy9x07?=
 =?us-ascii?Q?5k+b1vztZK7pnT+AMuCxFmyNsZ72trzT5NxJf8dy8N8hmHZxRQA6j0/SMsTM?=
 =?us-ascii?Q?+etmEGfkrd0A7ZH1rY33pDsYe9UpuYNk1qAkSTQR6wt9YLx3Rq6aeAuiKUpd?=
 =?us-ascii?Q?Ql0QOpupVmgtmlOT4RWex77YDVACkutnGhmc+U73bsHzuWEWUl8KMaAfiMF8?=
 =?us-ascii?Q?ymfgwrwuNXYHwO1RpG6Ld7N+MYKB9LH2ml4mbwqECiDuprLa+6S8zZyYphCn?=
 =?us-ascii?Q?ycNhZET1QnpFWdmbejZkr3Oeqm0+spMleQYec5NyC2zoD8X3JTAMBFNfSY2i?=
 =?us-ascii?Q?dMZrHn6rVfwzvyh5H294iAlXvnIDrB1x/jyVNUGPRailILRrmuvnb7HyYf/O?=
 =?us-ascii?Q?Qg9rm648L1+HznHtus3wNCRuRKol8VwQzJUEYYc64NnbrxOTF9tOBgdG4YmM?=
 =?us-ascii?Q?/MTfqZ55BMRQeAUqBASSWb8tVYqwP4cxMABn0PkI2SOoFPEKpY2NAhFosvMb?=
 =?us-ascii?Q?mKQktjkYp9Nm4QyDPTq+BCcxF6gxLdc3X3lBH/xwhHR9Z/AEcO6oDg7u0iXT?=
 =?us-ascii?Q?hWxLwtAkH/z7ck5EJD4hJFkJYa3s/+g9TidWw0afmE2xvkzsu5U7nnTbeCbl?=
 =?us-ascii?Q?v96x1Q1QF/BJe5jD5hC2fdJC8XSIpPQNnIEVEuoWC+Fk9U+wyKUrPsENzBgw?=
 =?us-ascii?Q?I+SFC65TgDH/mSf7/qq1TZL5H1PxEkxG6k36ZZpJN5v/s/N6gn640JthhPsB?=
 =?us-ascii?Q?LY0bKdSt1cXHXRT6KTsHX/3zQWYx1fm11a0fcfH6h7dIe8fs2r+F7wXXMM8O?=
 =?us-ascii?Q?QGVqU3W2gTaGsc4NSAnODL2zXKz6xNgFibyG9QxCP/u0Vaf4wGlE5+KhrsqE?=
 =?us-ascii?Q?me9nX/I3mcYAfVrnaiyF6VV7k8nXdEFknCM8dg5foSpNWqx6RsP6+a7qV+h9?=
 =?us-ascii?Q?lgcc20Xc45uu8zboRRiPRDRQeRwEFt3YOQuXA3/3LoLIhHCO/N5QzVkfp/Um?=
 =?us-ascii?Q?LWpRKzbuDPKbuV6snUtsrEfS9hm2ok6BQ2tfxZug7cYJJBo/3qgFudjANwoI?=
 =?us-ascii?Q?AsIbZj18Vl3CoSaKMveKrGXf2tLhOIU7ANOSNFWjmBrFOoLCA0VkRB9LoM9E?=
 =?us-ascii?Q?exeJN+DpqNUET/AiEjF7RdY86DFvKDRe7Rz6+ciyXm5YIEbogjVxGEBFo39S?=
 =?us-ascii?Q?IN1TZUOPB/ya5u3OPo9CqxZzP90HKZ5U84QjRlV6Yo6GHKz8/00+EEDmXC21?=
 =?us-ascii?Q?dM+LtsfcmAgeUXD+0TtsfiI8Ls1VZXjnRR0AqkhO9/EJb8YAIWOOjPWvEKZO?=
 =?us-ascii?Q?Vta66QF8PAVXxW7OI7Ov63Dp0P2eKT2peXbfjd6o7f6Z4cbkXTECKg5evF/P?=
 =?us-ascii?Q?aOuSKLSoZsYmpfyj+iJuKazTlGHYEEg6nSftETPwPuK41MkWYcnIHzVmW9Xk?=
 =?us-ascii?Q?a/RD/kxiHpykb48tZwx+mkVmhkmFV7Y09HhynShwOs8ZYJnk78hpfIAPRDiO?=
 =?us-ascii?Q?gW3cgVq3Ux+dUMqRk3hhUIBcsQYs0fzaEyZltyOW53r7/2Wfl1vGsM3mvFl0?=
 =?us-ascii?Q?37Yr8ojcF5hsQWJuWlF1EkOKVb8fyxO+OzO74yJP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554a874e-997d-450d-60ae-08dcaa177ace
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 06:28:20.3705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMc5XFIARIley3A121GWoQ4Ocw+QD01Bx6w88OlYoJIFNyVJ1/IXTT2XVWNdHfDixJWjSYf5b7tLNub6i/bxsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362

From: Haibo Chen <haibo.chen@nxp.com>

For IP which do not contain PDDR, currently use the pinmux API
pinctrl_gpio_direction_input() to config the output/input, pinmux
currently do not support get_direction(). So here add the GPIO
get_direction() support only for the IP which has Port Data
Direction Register (PDDR).

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 07e5e6323e86..08ca8377b19c 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -151,6 +151,19 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
 
+static int vf610_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct vf610_gpio_port *port = gpiochip_get_data(gc);
+	unsigned long mask = BIT(gpio);
+
+	mask &= vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
+
+	if (mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
 static void vf610_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct vf610_gpio_port *port =
@@ -362,6 +375,12 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	gc->get = vf610_gpio_get;
 	gc->direction_output = vf610_gpio_direction_output;
 	gc->set = vf610_gpio_set;
+	/*
+	 * only IP has Port Data Direction Register(PDDR) can
+	 * support get direction
+	 */
+	if (port->sdata->have_paddr)
+		gc->get_direction = vf610_gpio_get_direction;
 
 	/* Mask all GPIO interrupts */
 	for (i = 0; i < gc->ngpio; i++)
-- 
2.34.1



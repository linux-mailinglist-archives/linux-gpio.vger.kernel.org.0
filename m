Return-Path: <linux-gpio+bounces-8515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E7994485B
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 11:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AD03287489
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 09:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D707DEEB3;
	Thu,  1 Aug 2024 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eBIty+T/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF6183CBF;
	Thu,  1 Aug 2024 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504637; cv=fail; b=UWf0ylCuqYMSC7VuYU4+TuX3nz1x99lFinP/mlWX/n1iLP2wHPyDgKK1wqPNab/JO+yDavNTqQESL8hI9oG+PNdq+0hKazmgO6Zer78isjAuLMrxsAGEsMJ3QpOp6fyZNAzfl6rllwumteyljC/Iqqm++a2EbUqn96qt0OJ6CEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504637; c=relaxed/simple;
	bh=woNH3f4NiPlxTp5iVy+k+9rdZuizFDNSB9en6lW0lB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XRjrFvY3dZEEZZh7NlihdMcug9wgpsaw4K17BcNNXxFWhEfp8JqlV35qe8lan8mDWhETcyhSzgt26w/lQR9M5P1Jcr7gaUAAYjCPwTVUNLSMkpnWAnHM5ARpJZdhj7VWZQR3UifEhS8BKXRJZLHiQEbrjvduPuwF40DjuBu7aG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eBIty+T/; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQ6hBMhtOeJkWMK55ZEAQr3wS9yIV2ac1zGfyIwrrdgzAaiFMak9WOAzI1NFcwz7+wDdIkClNH6SRm0lRVr6Vx3s1OaNNgvU/1jYzJtLNPcqy+J+1TN5vROuBVoO/W47p59AAR/n/Ug7PPccEE+pdWi6JojcdSrbDz3shBT8GN1cwgpNlpEQIfZq9qd9m69GnGg7r4/GBxgXiflPT8u4V9D9VVIujjudMExI208V/SZl6lRiz3rRAuDca4wpGEaFUEODBCnD9XWaM1Cqhtg3HqayFifVQTEENSPnwerz6FRDOaOf0ig/zuI/ILuzhQgyikHZkjAOVOtTcQr2bwbPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A17wGsPtcC/zvwoPjhr0BOFRtwKwoNflOIxVtynOTOQ=;
 b=RuLYdx02lS8HP10YPFYAy77bD9BOx9VMo26+8UwsLFq0nEjsFmbXKvQhZ/fgO/LfsX8tm/PJcDrQ//PWKZrW8LuV0JNQ02HVisrvPsOKPrVIOB9rivH/dh/oVuBQfUQSXia539OSvc26SNT0OMENXs6Egi8dt7mGGO5Tq7UL/Nx26M5Hbw3QWSP6+QVowYWKJPFQ4AbesS/Troeupr4tRupt2L8rX+/YLNmDYWeubjxYwy0zf7tzCSJg/faa5w0If2nhIUbQJhpZsSOpvc19w5JpNqWYkzrPLeUBrWHNoJkd087ToSKQjW20A79PIS9+px6eznpjf3ZowVzKbvxxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A17wGsPtcC/zvwoPjhr0BOFRtwKwoNflOIxVtynOTOQ=;
 b=eBIty+T/OpSjad7vn8MahIvu1m8UgCG6GljzqVG/hMqgDWgnuZTq4QJw/2VwqaOyyqOQQ9lOpn4chmQIEoInRLbUZuWTnxGZ6VTm5nzD1VzxC6+Js6i1ZQ75cudSw3yyEuPtFMmMx7+AxsgdnkmqdpovMecZMjvz77GXlj69O2XnBE5+5gW4OawVYcPpK2JlW3LE2UFizPzRnvemn7dN/Onj/CxIlTW6Y4fdU7oUPmIDuyiv1jrrCnBAT9yRSefj6V4RhaRP4S+toD2JEA6u/mns1ZQugELN6NEpYFuNM08ZGvp7aYoGiWp7BkjjhDo4Rz6cMLXHHVTTz0mm6ff9uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DUZPR04MB10039.eurprd04.prod.outlook.com (2603:10a6:10:4d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:30:33 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:30:33 +0000
From: haibo.chen@nxp.com
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	haibo.chen@nxp.com
Subject: [PATCH v2 2/2] gpio: vf610: add get_direction() support
Date: Thu,  1 Aug 2024 17:30:28 +0800
Message-Id: <20240801093028.732338-3-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801093028.732338-1-haibo.chen@nxp.com>
References: <20240801093028.732338-1-haibo.chen@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|DUZPR04MB10039:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4e38ec-3997-4f6b-f60a-08dcb20c97ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5vN/j5AI8Ke/itEBzDxygpka8xNkOhXEeiSfbUz8ceDQOF3coNjIQPAmHYO+?=
 =?us-ascii?Q?PP2GcY0Lcb6ZVO+KVoTvTTciqgR+4MqMbrgx/2kinQc3vTEqT6k7T7DcaVoH?=
 =?us-ascii?Q?EYbVtSxnGPvxtRvH9a6Qwr+8ex+UgQ8Ab3DoqtxOgOKrksei/ZFYRdOnuvRb?=
 =?us-ascii?Q?up40ZtJ8qLpeKFvg8ox5vwM5W3+VZtWsHk4Ah6qy8YOeB0hC/HmK75o0YR2x?=
 =?us-ascii?Q?yvxuNOuIgNDvjRYlYCYNHZRxm+UoiM7xlizectyQ3CvBlscyeTzEmG5JNPGa?=
 =?us-ascii?Q?4kmd4OKdt2djRr49nxr6VU+zcrBULchKxbBBKLbUw/PtU2z+cBzzbMd8LrbB?=
 =?us-ascii?Q?SEkHZo0HvQC8lbjzf6uhihFvIoLKnkjq45kj3FLzMjkY3C6cppmVd2hrGTWd?=
 =?us-ascii?Q?zU2ogBdbkP7PCReRVYdqsnNSqx8Z+OAQRVSgIQBelf9smS0Vu4Ds1CyieEKy?=
 =?us-ascii?Q?Nau2fX1OM+ME6b+iemGBKPkwhxHFwed4k6CuThDWvCwTVOyUogitPhUmXNAL?=
 =?us-ascii?Q?1X5nww12KDlmYDz10Pem+P7O035o5vag7z5ZDwRZGVPYlYIVZAPwLiQnaWN+?=
 =?us-ascii?Q?Z5XdVBLwnY3UtsJbBJI/mzOZ7+fnoapE16uyJotpseLXGK3qBmSMDi/feldT?=
 =?us-ascii?Q?N8LXjNrH2+JpIH0a2URVIgNiSKzEwb5l1NEW5GZHlTmD+FNkKcWr08WmztWp?=
 =?us-ascii?Q?dwDywa5gEFgUZkiT9wMfZAlwG2RXioJ58abixQGETmJIJ5xc/5q2k5Kr/bMt?=
 =?us-ascii?Q?B0yRMQcNXgnk1NdplCvfIaU62gp8/yEfUS+y+Te7SY1FpWNXfeC3aZydA0oX?=
 =?us-ascii?Q?yvsB0qRpZhWSate2k6wvkyyCCvx3OjIRDU1W4YDZOidyaDpGXdymXOuAL1vU?=
 =?us-ascii?Q?cJmlmK15egnDKkaykpuMWWmTzjyPZ52T0yNKR33sQmf2kYSRlDI/8m2ekixQ?=
 =?us-ascii?Q?2qIYjbIADJ2xvxNFrd6blaUiFRu7aZVuu4EeXwo38DFtopvP3WKlaWm1XvD8?=
 =?us-ascii?Q?AzSdzSq8Wt8Zm6eTsOSRvN7AUXdlmKNuwZZ8/zPe0eFVJFdmum3F0f9R9Ye1?=
 =?us-ascii?Q?fZwJexsBbTJuFPcCt4fTO+5KaTRVg0mwxgNdPt7wy3wnJr2ny0MiZ4eocsXe?=
 =?us-ascii?Q?uEhMNGrGTEZW7zqQKIkZ927HaazuUIr9zRi67KFmBmSIswVM4yVg6czuccbI?=
 =?us-ascii?Q?ycjBbwNYKy9DavfP/R4C/ujtJUF5rwxEGErXwZwKHDJyfeg90xU1p6rvqTiD?=
 =?us-ascii?Q?q81gSpHWpC3/rE6VftU4/nhAf212OfKuU7BGO/J2GhgTK00p8b5czpjvSPrt?=
 =?us-ascii?Q?MFLqONu8O1mAvoaKGHQIJAZF+Khea0E3s4Be8KmVC7BMdUOuMVNJTjqXNOBk?=
 =?us-ascii?Q?AwPXjBNrRkOD9URzLolTGJoMCWgt1xV9Y9WYlWzbL5AHdQ3iNw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vc+hGE6kK5lwBp4OeQ4Kvuv6iZnE3gU7iYya12T4aad5XdX2/tucpUO6PEV9?=
 =?us-ascii?Q?o7sqoYBkgM7ceuJUOChXsG2IL8amjIiRQebRzYz/GjTgStk0BBMq2xl0uv3y?=
 =?us-ascii?Q?aouPBTTTEbV4qQKgF/I+fgw6GTuseLkkbb3RIwpW91bLt9cEtCcG2l9FcilM?=
 =?us-ascii?Q?Sq/MoRw69dfrLFH3CLKxDNl4RzDYRNJ03AvbyBwqDyyx6qxKXEFTRE3CG507?=
 =?us-ascii?Q?pX3zgLdnF2qWt2KvDH3cFcxtPxoTGGAO2I2YM0jCOnGKFPwusn4nBpU8rpTh?=
 =?us-ascii?Q?8jxdiu+9++47CmRRoCev4YOq5+5JNEvjxjmySFqD013b5+Ux0smhQSe/fFM5?=
 =?us-ascii?Q?MTDDnP3RYt+RBnAvUfhAZWmbMuTEEg2LDUbHfR+LhQIjf3ezCl2BVN4YAldV?=
 =?us-ascii?Q?x2ZS9YCh85lPJisfBAbhcjoWbubUS5xHNdWaZD3yXGjos8GPLzSP0reM8by6?=
 =?us-ascii?Q?wntWf5+Y3/77b0IloqxqbIIqmUUAusESv0z+DQ8IVpCdlrArOtsYOhEyrJAp?=
 =?us-ascii?Q?0XTyh/arSqoFhGeLrBqUkcR41Qa9LDGNXBq1OqZ9pEv5IG97BQFG6wURHNOF?=
 =?us-ascii?Q?IoizqQr4492GUecNiEDTJ8Q96CqRjAEtONlYqTZ6Tr28/B/C4GDKUckc4BhH?=
 =?us-ascii?Q?O/k5iShkjIUQy87t4/qzdcA4/iNafJZPPv0T8+XnSZsZ90cNutdjUS4wY0RX?=
 =?us-ascii?Q?36/TIzhOrmy5QvAoS3IplhCq1HAxrs5QzXZJudKzwSl0+wCOUTvisbAR1KiZ?=
 =?us-ascii?Q?UIHqvjLnrdlCYQK4jEiuHSE3N7Mk7y9/S58Axks5MPs/E/ImjFxXIA9jxno6?=
 =?us-ascii?Q?HFW3sOdWElau2oTaUi99C+VkFlndrXShh/69FwGBXbeXz2XxSiX5+vTLhze7?=
 =?us-ascii?Q?QXFqKKA4SUH0hzGA5zG67DbJMDhCUaQ5WtVC+O7rrtN2qVQdPwgvrV+0xQXT?=
 =?us-ascii?Q?GMrhTEPjD3DbD4oZ3/msJOw9deMjKczB7ttSnii9EanOqQQPZDv81YmFc4AA?=
 =?us-ascii?Q?R+oXSsylzVzeC8GXjZehvePbod9hibW6vzUvZtorDfatKH4ImwC8F7TtTsGo?=
 =?us-ascii?Q?ZFpDrYxP2kg3/9525bcuStKGwOvcDU2Asasjf9MXF2zyPgmVA9+wyaiEh3hV?=
 =?us-ascii?Q?H34Luifd8ylhTh/bU15m5Loy1iqZrUdLb7xc9p/r5mS3G3UGc76pY484YVtR?=
 =?us-ascii?Q?ThGqBC8a+hOWbb5z6E+PMQWuvzbZ5ji8oigocdx2yk6VZkIJmY7ZIdmBc0Fs?=
 =?us-ascii?Q?QR/6jO4qJtIjiNaAGe6/2RukZCgXAj9Ox0MmoBDcjrqeh1eqyn8/CaG0Aa1H?=
 =?us-ascii?Q?KOATshVSdx5k7mi7UDk3a9pJZuPohk9bGp9IO7WnnIa0P7NSIdWdY5mQBYNX?=
 =?us-ascii?Q?wz2gHw3tjKhAlLigh8J4VUrY4QkD/WjWpv1bH6gAi8EGUxd43HzTe7s39cb/?=
 =?us-ascii?Q?ROSdKcM6GFNCYNNcj2PDG7qYGBLTp8XKEKHHNZN/twqYGMPwhYF5yEuQUdTH?=
 =?us-ascii?Q?+7yNvgf+ygIfnV6NQL1lwayB6rxVTQSI6ia0Re3HwDauPLqeecZDXubXC2kG?=
 =?us-ascii?Q?cLnfOfAidNcv8XaOSGVfYbOFVqBNlpkRcjj/rpsG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4e38ec-3997-4f6b-f60a-08dcb20c97ba
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:30:33.7290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVda/UUnb04R4CQ7BdtQ8ZF5e6hVyHsb+uT2ILGI7uWw8mlXQB/KgdTKfpUKgDXCsYRvuiWaulUX35C43dL81Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10039

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
index db68d8541597..27eff741fe9a 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -151,6 +151,19 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
 
+static int vf610_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct vf610_gpio_port *port = gpiochip_get_data(gc);
+	u32 mask = BIT(gpio);
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



Return-Path: <linux-gpio+bounces-8514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A146F94489B
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 11:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBDDEB298A2
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB717183CB8;
	Thu,  1 Aug 2024 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WQ+8ejhl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776A183CA5;
	Thu,  1 Aug 2024 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504635; cv=fail; b=ujSQGgNdww2V27nNsU8gda5Rx7QP9QpMIPUP4Ci5q9C1YL7uPkZcCe63fE2z/V6i5YNPcVF7Qg3Yc7vzGH0R36AhMP4mVWO3c2t1PDDOsWz3CdBRzE4ajBUcraBtX7wL9LMqzPaRXQ7D8zHOYyRwcyzz9iGStvBOSDXOerPIl0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504635; c=relaxed/simple;
	bh=DlOlDpXz+avvUYWKMMxlj7miARZgpWC1vT88T6nR1SE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B1KH+3EnAlPkwdIKbde3Nh18IUE2yrK3yKGUw2jlqJ4tX72Q7YTFcn5+ENggKXPifwhXfp76pn+FUGsvMmVqsW0yGbFngsy0mYuyE+oNORAgZe3HW2TBEgiaXBEIIQgSQ42DixB9cqCEMqomFbrG2meugFGbtlGGRu0O89Wa0Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WQ+8ejhl; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxvDyE98OOJlgUGLhQ9LlQUAKt1QzIEVuvN11Orpi6GhIRbPLlAdQmSKfIU3sWYEKNurjQJnSBOW4345klUq7ZQIsbelBfkEkVoOnL4skx4e/9k2DJ+LRRxKqS0ejVd3GCqz5VdskNEUr8syG2ZSS9dup+sCQQDJm6diywfAmzKHlVNySx/8YvKPHhfhL6Funsipjx2aY4g6B5xGaB+RYFqsYr+DQIFipFoC0OtwE8D1j61NempXLR7o+cOshA7669CIdtrMW5oIkx4byTNXYBUNqeBoY43ELuWRFsztdp00cWEfmAhE3ErslUi+jYSYPCqctOUz8ZqTsVADzr7Fag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bp+AUk7aKJYVV3ziE/4laHQDvEDqTGIOo9Xo+aNM2sA=;
 b=PoWFE0R90/pQDWnIsi6Ts27Y3c08XpWdIJyJ/XoB7WbVv2rL0QR/VY683rifiNAQAK2CPWEOO3uHxn08PD3M28whMAkln2+adY6YTgVPuiOD9bg6OH4C7iHBoAT3LF4maBmBBwSJimKuGt+VS7TxNbrrtoul7wo8t15bL7+/igM68bNTKE3zBx5Zbq7bx/gUrP5aziLt9gZcfxvPQeLyyHKndXPW7bZLZdqDxosMVo04dTuCxtXlhse3ExkFJwV58rh0x1NRw5ZXX8I4hQwzPKvOcTPfvssH+UqKSiVzGP0f5qVlSZUyoX8AP1b2ze5ffGHDNzprGKcTA11iL9wZHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bp+AUk7aKJYVV3ziE/4laHQDvEDqTGIOo9Xo+aNM2sA=;
 b=WQ+8ejhl8z4BYZkI+Gv7+mmh+su/NiaMoBDQ0elUJ6PiK3+m+wpXfv/sNzpk0KQQSPCsOwp5hTRYzacexGtivhI7rSHFADKhMvkvVeBLQbKpNleGYSpTKmVcLsqtnNjMkZ1xiJmLclYlCkfTOB/RYvZmFqJsfe8mau/mYatYuXaNDEZb9Z3p+QPntMRu0axCeMe0Z6zK0nRV0Inw4F+FgsjyA0HFnfOdld0qvyv9Uqw9zeJRLHuH2Vm8kaRmhfIEtdpsKeLcoR0oEYy0ODTX/QJn2POrzPkMOf5+9SUVav7jxPDFK5S1zf5+UG9cfXgj5GKEABLlRUrmV4fJXqlmXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DUZPR04MB10039.eurprd04.prod.outlook.com (2603:10a6:10:4d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:30:31 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:30:31 +0000
From: haibo.chen@nxp.com
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	haibo.chen@nxp.com
Subject: [PATCH v2 1/2] gpio: gpio-vf610: use u32 mask to handle 32 number gpios
Date: Thu,  1 Aug 2024 17:30:27 +0800
Message-Id: <20240801093028.732338-2-haibo.chen@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9ba5018e-e03d-4aa9-9eee-08dcb20c9625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vxxFqr9ExBUMTEAiluiBpcbiOvvTA6fmmJHqKYB8Ni0CxBZbnT5wiijPvwtt?=
 =?us-ascii?Q?n7K3ZWHbjtnWo7vXoFSGEWxwz5f0hF99OCwIlp9M8x2b3a2nCgvj1TMa8F8Y?=
 =?us-ascii?Q?dldcvDyDBcMNSu0V4e6ww156fdAI4He6p+9eUvL5rpql20mrNMOWfZX5kv1o?=
 =?us-ascii?Q?UqXZge3qzAW1u5lRFWblRA11EqjdO5FI+iGEH6h8TxMy5baET4ul3SjV830k?=
 =?us-ascii?Q?LjZPrjmNa4fJkciCDi8hOZ7ghB/3uh0fpx1MzPPa+2O8BfmevblLc7Ia/cUu?=
 =?us-ascii?Q?//+XJ0DF6/rkRUOaOzDay3EzQxRB5po5h7eA42r2yioy/D4pPauf7p83Lvnb?=
 =?us-ascii?Q?k6vTFEWFNVlI7rFWAkbZD8OzN7FwxZh5X3rIaKurZ+nFkbYPtQf3cQzrmMD3?=
 =?us-ascii?Q?oQSW/8+KwLzF/Bhc6l7fWpZMf3PfltkyCbuBWaP7V71Yyl8bP4omIPG/kJ3z?=
 =?us-ascii?Q?Y/PcA0iHVebYMfp4HuCSuIj4CfuCtwHgbL7SnQVm36vTZiI3aspRAXN/D4/Q?=
 =?us-ascii?Q?2j4/SO9I5SQAAx9CNvAEYGuelL6pI82M0dONEmcbpvkkThLD9qvJ3GKesV/u?=
 =?us-ascii?Q?nkPaFiC6H3oussr17lvN6+Vk8anV41j9zfdGzAiH7+8i+aqPyb8W6RWngfYU?=
 =?us-ascii?Q?p3gdNXfGUoB+91DjkhqM0hft+vxU7sEkLl7Icm1L20ytV+falPLshh0wcpAn?=
 =?us-ascii?Q?5MPI1fJCIii8ynlcx94ocBaycvXJXZ2Llh/531esq08CESmKkeiuDYraTQM6?=
 =?us-ascii?Q?NxB1vBcCtIWjxl2Z6GMUANniDTl4oLZyKqu2XJilzGYr+FNP9jzDDYKLLzDd?=
 =?us-ascii?Q?/VsJF2NPY3GXOmsPjkalIn3YY9szxqCI3wnQWwHx2aHrktQxA6mv/WlnxAqv?=
 =?us-ascii?Q?Bi2fcX+gt/mAiOZ5tCYQ+znPecgCCU9xa43oZHgIcl56kJJ7AIFU0Uy67xwK?=
 =?us-ascii?Q?cSth+WNbpTLgrrF9us6+BCDTY7HQGC8zCn/3EOG7Nwr7Z0IaOE0fGqrBee1w?=
 =?us-ascii?Q?8ZmfAK+VT+VX7zlRIhOA5bXDeHN1TJGUwa9QKobFyYm82qrE27TE9ZZyEtWq?=
 =?us-ascii?Q?LGRDRN2tNb0WqlvELuB4nM0cg5PZqr5M2yxHTiAeEHDOxwBpTkXifU1RAgYx?=
 =?us-ascii?Q?uS5x8mEfdLg/3CP65QMUaN593Q7nyja+MWYcCOtwShIQa1nWmG+VaAtZm822?=
 =?us-ascii?Q?uISGqGJgVhplxQN45AVM9vw91PFNsyFSJv7ffjihBL6W9Iz3IjnV0OI57BM+?=
 =?us-ascii?Q?1OO8xc3/1IrOhLAO2z01OGvr2WziMpXfQiP9wgE41aQQRYqg+v+n9HfgcNhm?=
 =?us-ascii?Q?S/RH7BecwMRZsMdWlT7ihrq5Lz2cJVfYG3UrbnH9+FW0oW/kfUfqUER3mYYT?=
 =?us-ascii?Q?CzdMBCaFqJW/xQUMgL48sD4Swu9aQx4Pc7tLA7kvb/HBdZazyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4OMJLWo8ySPtM7/ayrX4xCe1RC0R33QonCo1kfWKPXtFHc/R8RPjHZOr8ypA?=
 =?us-ascii?Q?aeC1JJ3kZhgM3HiXorZHGheSYKUiHzTQZ0p6nli2z4DE1AfkcZIR9SwWklOs?=
 =?us-ascii?Q?SPCM5/tHMQCWiu6TZxkhfmXwE45AOtRkFfpHTj3uquw9b2Us+tt0i35dR0i/?=
 =?us-ascii?Q?Kx5zSh3HCsuKr6ZG3eTJEpMKjgyips3ogIR2ssIXD2GVo9Wbl+f7mMlyGoVd?=
 =?us-ascii?Q?CvJnmqdrAtXQ5ExNHM2wJyvc7eQID6wLhvuniRgMjU85ImX175BXBE1dO+9b?=
 =?us-ascii?Q?SGMx1pix2LTP6cH3jLS1GqxUvOHtV/vuS7ixg7sFEAdAZeiYr+xbc85tl9dE?=
 =?us-ascii?Q?7Dx9E1BCyyBjXSodtN0SkBiYRFq7grg8wjFj9bd5L9D+07MZTKBk1cs4pu06?=
 =?us-ascii?Q?cTHwb10daPcg9g/8ijEZIKSj6yGVcKTH2OfML+CL4i1kpWqsoW56MCySgh83?=
 =?us-ascii?Q?iLOB5HPX/sh77ij4mOkPiswtBg1dRJfFCOp/U7izbuS5nPfE2gJD1HL+HPJc?=
 =?us-ascii?Q?xMq5C5G6eFOV0l1kZTYrUeQ4wF9J8cZtXFAV5TakgF/tU60PggtetJbvjSm5?=
 =?us-ascii?Q?v67F3I8hS6KjHb619In2MUHgPEeMqyoQ6AxnLDENnttkha2QgtGd75PSJ9Xt?=
 =?us-ascii?Q?OrwbuisEk28Hht/NwsyIoiT56FpmVRbewtEpBsycM1Xs+gl8ovyGYwCCu18O?=
 =?us-ascii?Q?FRXBb3Q2s2NUpGlIsT3ZzGVusREBLYtpmRxqUBLbNNUeDn1sBFNkahHgLsaJ?=
 =?us-ascii?Q?NNcL5QmNRbj230oXsKDxp7HKbX0Ueegr2s1igUFF0tRx9Nk/jR5sp4btdSuE?=
 =?us-ascii?Q?cbmSpQb7baq/sTUthqv/wuT00/vKewVEFPAPC2Q+qCAbsTJb2uREtC/lshjl?=
 =?us-ascii?Q?iJXSeKS5r8hw0Z7lJw4094M+QKeKiWz2X6D/eWaqJrlLwL8hUrt0UWzA88eA?=
 =?us-ascii?Q?QUQilyx0aaqNj3/q6qkxUFRA8CfYnA5CfcyAKS1jculVLeNxTwLp0COCEcFh?=
 =?us-ascii?Q?Yf3YgjrQEAS4DXryG2xB8Ie1tr0giR6kRXsFZWfzz1vA0mTSFPc9pJtDeI/c?=
 =?us-ascii?Q?RJe36Kv148/eHX6bU+CEiY3DHBzcx09EX3qdL+gcen/HsUALo9EYsO2RpqQQ?=
 =?us-ascii?Q?qWH2BcYD6c84Z/yKFsd74dT4QzHF3rpgRGsl+103PIGKU/76ve03DcQOM1SE?=
 =?us-ascii?Q?dboqnJFjWuH55cr0gEFPHMMClFvaY+QJmj6O9jFFPcKjE75WHi7p/XONOYrA?=
 =?us-ascii?Q?dR7i+kGbG8s0mOYpQVi7No0v6spdZsIZQM97T5nGputvwhgrdvwuVzblCVJG?=
 =?us-ascii?Q?GoSFucOqxzmV729sbv9JUdCBTiYmPYKgMa9VjMa69ZmJFVQ1IowOxoAaJdy2?=
 =?us-ascii?Q?shLwFIvZyYqrjNohH6IjDdqUW+YDYt1jHfd383L91MC4leAgH49/rNAHTDzL?=
 =?us-ascii?Q?WCj5LSDYwhvcHNKqAaLZrl8CHBUMiWN82J8EvHoT75ZSUJ/mcdOHEmynYRvk?=
 =?us-ascii?Q?XfAokO573mcN1mMayjJdVtwezZ8SAhPzY9AFOm6sxXiPa+CIWp+BLa51Gvwd?=
 =?us-ascii?Q?gBS0SrSybCIp069x8j3vUsCON8gwrWScH/BbA50a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba5018e-e03d-4aa9-9eee-08dcb20c9625
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:30:31.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KXXIQw2JgzUqungUI4spjETkQkJHa3pq1K/X1PPI83y75YjK2obA+yQdQmBv1aLXk+Aj9qIoDg4saC/j+jqFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10039

From: Haibo Chen <haibo.chen@nxp.com>

This gpio controller support up to 32 pins per port. And all the
register width is 32 bit. So here use u32 to replace the original
unsigned long.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 07e5e6323e86..db68d8541597 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -97,7 +97,7 @@ static inline u32 vf610_gpio_readl(void __iomem *reg)
 static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(gc);
-	unsigned long mask = BIT(gpio);
+	u32 mask = BIT(gpio);
 	unsigned long offset = GPIO_PDIR;
 
 	if (port->sdata->have_paddr) {
@@ -112,16 +112,16 @@ static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 static void vf610_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(gc);
-	unsigned long mask = BIT(gpio);
+	u32 mask = BIT(gpio);
 	unsigned long offset = val ? GPIO_PSOR : GPIO_PCOR;
 
 	vf610_gpio_writel(mask, port->gpio_base + offset);
 }
 
-static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(chip);
-	unsigned long mask = BIT(gpio);
+	u32 mask = BIT(gpio);
 	u32 val;
 
 	if (port->sdata->have_paddr) {
@@ -133,11 +133,11 @@ static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	return pinctrl_gpio_direction_input(chip, gpio);
 }
 
-static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
+static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				       int value)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(chip);
-	unsigned long mask = BIT(gpio);
+	u32 mask = BIT(gpio);
 	u32 val;
 
 	vf610_gpio_set(chip, gpio, value);
-- 
2.34.1



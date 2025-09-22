Return-Path: <linux-gpio+bounces-26466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8381EB91AC7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D5E042188B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25234253355;
	Mon, 22 Sep 2025 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KR9Y8s1B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F14245005;
	Mon, 22 Sep 2025 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551095; cv=fail; b=VpKpm/phApLvZBUz/nlSSDfNr7rb2HsX2E1P2F7JiR2zy7a5mxKCUdPdJ1noEWdVABZH72O3BJROiMyzFAeVcbIYnTqqWO09XWo3Y9BlA6hhiAkzTF67T8O2o4PXBge5yxwEJx5RvTCl1WyVLWPz/xU5ddpQn6Slms8/CVmXpgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551095; c=relaxed/simple;
	bh=YZ7z26qwGhGJTtL+sbdvfqCrIFd7VXC3hYcx37ty9IU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tz8aFJmJ4q9N+u6F1jUHvhI+NNJ4FXnUIadv+n27ud0qOBhtAzddOIMzY7XvPzVcbhkQ4GBD1mbwxAFi5zmgZa9FbhdwXg6KA8WgfnF62zZ5q1t/vxCmFPyvOp9xw7HKKrz3n3jXMQI/W0Ry6LzFwgJDSmtn4QqKPUQJNn7lnfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KR9Y8s1B; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEzXxGk2gsORpOJX18FEqaDFi2ILE7zHjkOxZV/skhwIO7IcO3S4NJAisABVqBlKDQ7b9X7N7DcVV1HkQXmFFaga1HMs71k9Ja42LSi6VW+/3k8Tkmx13ZCTvfhB+tr8dMTQSmulPqTR9wkBHesffEI9laoFBRtT5SWGmctn4Airnc3qyU79htax1IHEPs21iKbEzFW5j6ykmSDZBuOb84AQNVEz8HU12TwdPdoOesCodV2Me8DX5CXiQkvQM/W6SxE4H0MiT0punUOUYlVCqfAxJB988XGUDv3SzGdJ/3gJj/57YmvWZg4naNkjey4NraYG/oxwa9QgAts0sQxkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QaPmillw3AUoVMJaHv7F8pyXCx9+ZBNeO+yq+uLtd8=;
 b=vyd+YnbWNnFWFcurEogzh4g/V3mhLQLR3uxc4RLQ5GpkI0+jBJIzjsoUBx5uMw64JkApAjnxCC5KjKuolUEcPrdQX+5i2+pEWqBmNcSU10JyFv549U0mUoAyc/XYReF8wQ9kVICfcbiaX1lhZo+67E1K1TQGF+reqBAE9frOw57UlC2zOjVxmostFcUme1B9aQjmYnd4VbMAwBwM9JlKubraUjHJMpne12jb6fZhDo15F+3jCiRJmHlQzrCLZWj1MuC8G8RD0r91df+23LQrS4AwTahmAiAs1NQaAbdjRsxiaBKMfdDlgL8cCu+JB/DwDVymU0WbvsB9m/+UNvEdwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QaPmillw3AUoVMJaHv7F8pyXCx9+ZBNeO+yq+uLtd8=;
 b=KR9Y8s1BS4d/BO4RT5xpNR5EbJ5atcsa6GPUGgjnzhxJp+/09DG2TBoP8ojVRFovL9VCk8oqRSEQ36yq7Uq2XLwUaHA7xDHEKmZctFuMu1oF56TnsyA/rArPYCuybO2NLdBDGniv6REfxjDTMdNYFVPAJ26f61InxtI250njfXoELe+L4u4n1lYDyZWNKX9/0xZ+OJno9l1jybaVZ5dnc0kmCc2zOFUMsP4YroCRI2He47EhswDxiCm+dFP6454Y995jJ4oMBymsZcMbgWCOszu0IeeC+36zjcbfTiXtrT0Tjb5zcr7ZLyx+CtgWBiqsNUABUnv/VWBZccpZBp2q8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:50 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:50 +0000
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
Subject: [PATCH v5 06/12] gpio: regmap: fix memory leak of gpio_regmap structure
Date: Mon, 22 Sep 2025 17:24:21 +0300
Message-Id: <20250922142427.3310221-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0043.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: f47f6517-3e93-4a73-4400-08ddf9e3ca35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5cuWcCySo6OUTwugOV/Hch7kHGc6x5Wm0f/p1ZWk4lr2mjPj9dRJGf/8J5wW?=
 =?us-ascii?Q?oZ8SuCBG9FEPBuy0w+MWeLVhh/uLRo4nuDH3Uu+fP4F7w+cyDnHhxGqUxxIl?=
 =?us-ascii?Q?tSrVCCzeg6pzHqJIpFqZTKt1YqTpJK4dntzkRlttfV57OmElx7+M677gXxY5?=
 =?us-ascii?Q?QJBL+bGqX1MEsefC6CSRSjPiihrG8kEqmMpvtrTechkLhjMg0INJUy6FNM3A?=
 =?us-ascii?Q?ambBKkFj2UWXr+vnGcprYINDzvJ50YxtxJmntrKLKjY2FNUzFQqfzeCjJ7z6?=
 =?us-ascii?Q?86YoQ7w0BLChqZkNjUyxzBN6F0TbzaVneVrHL/UTypljNCNKLgn6y80PHTNG?=
 =?us-ascii?Q?OiHZliaTgOr9BZUxFFyXBR6L69cE8QgCjCGIVMQAbEbBCnRvDXvJZ9ZJ0KEr?=
 =?us-ascii?Q?VKMWrMmcwyBXvB2QFd+Z01cJwwPU5M8aXUh4Ikm+OoNuUpvM49JR+LB+st0g?=
 =?us-ascii?Q?H7rklH0Jj3O+yb84K08m5YfFj/68rd1Z6YZ0SyH3VehCgmqCdQixSPr25ev7?=
 =?us-ascii?Q?pu6WoIqJXHxHis87tz4HRJa0DLhdgsSpDKSdQ+zvjE0yel/Mu+C3eKUiLU/e?=
 =?us-ascii?Q?USyJjYj1ad2fTyzM/se+xXUnfdfGC3x1PqdXPg3UPl/LoEsWZMXcZo81WGQ9?=
 =?us-ascii?Q?QRh7mU433buhG2z8c9endxSdnV0fCqgINYjCesBAhb3DwTsAxLMqCbxrHVZJ?=
 =?us-ascii?Q?Wtz/FHSvm5if5pScGjwp2WroPK+nYG9J9MsLQzPdSPvW9shi2IDWqCVcJ0kq?=
 =?us-ascii?Q?fiUcZ9FS4GK78QsB7OdCt7ezOiu/8AopeU3aR5IHvJl9aPN7acJFUvYDW5wx?=
 =?us-ascii?Q?u8nSPr883FeAlbTaqlvdwbZFOm9Hm1VTT/UThukz/LfbH2CNx/IWDkG2AgPH?=
 =?us-ascii?Q?N6LY28mALQ+fRU6LAw4FuM+y98aa3Ei2vwTns/8dyzmECRyUerrGsc7cJYV7?=
 =?us-ascii?Q?FXpMe4WDo4Lp1wDm5qcVqj02vNLIXT9gRGmK58dLpaYp2sFlUIVIc451QFSX?=
 =?us-ascii?Q?em6Y7fz0podw0rqzIr85RqYyjaIbtmo0/lIeMoJjkMPQCenzMtZtm2seI3UW?=
 =?us-ascii?Q?L15mV4CLwDdma7x07aAzfPvovXxrkDZXtBDIii/Xx4uZBx/ccTbFrdiNsEtL?=
 =?us-ascii?Q?Fh1kt8HhyQnYGGWiMvIOdXDFEqV0tzoJxDegqVt18m2IJIArXtrN1LUxaNCp?=
 =?us-ascii?Q?K0KROnU6HZRMTlLTnDgdsMaCxh6mh4pCcztWQwvCF4oEYOls24ifTtfystQL?=
 =?us-ascii?Q?0GJWklwXQujgoCfikVxkHQN99LxMsr6vFVv3OxWjywBB7r1egNgt69DbxSMJ?=
 =?us-ascii?Q?+wlWEzIcJnZGhq5NNTwh/Z5oZXIRYG5E3IWj5EO9gm0H7ppo+FWWCOn6NptQ?=
 =?us-ascii?Q?yjId4+aU+DobxnPNObemsPC2Pri1nUKJhqJSD3KecZ9Qhq/TH91Pkls4n2FO?=
 =?us-ascii?Q?v+L2+FeCiYwox+YlFftSd2SRo2/ni6EAQJwGzl2mrd02KnPpVlyQkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nq5pI3R6krdL0IuwZpzS5Sw/SwsWOSAzBJIPym68Kg96RvwwPzLO+V8VVVYv?=
 =?us-ascii?Q?bmh7j0VcxNVCUphKIqPhzlI/jEl4pF2LVb4gb0RUM6fxwBP2PPZi6BrxsoFk?=
 =?us-ascii?Q?oET93TBVcqhFuc14gH41MbItb69y1hJnuFsQlzE0licRFJ32wL0y+hGbzczg?=
 =?us-ascii?Q?QQwV3RG/HtPLp1cPzqTIMCjDuxafqvKCheL42cdpwfvs0N9EALQhKDtCjSPO?=
 =?us-ascii?Q?HLz+s2cbM5FREw6gfVSr4ITdRvm3PMRmCjqbboqGxVZN83593OYFNWgtm2cB?=
 =?us-ascii?Q?2ngeX9Qw3rNZcL4RxpmcNiuVlY73lYdm+gGKI39giaGBOZSr6dcbY31x/qnC?=
 =?us-ascii?Q?GJ2wwOKHsVf+bB9EhjJ725o1N7tpfRmvC2rkA+XoJcQp9mb9yQ2r60yjn+ho?=
 =?us-ascii?Q?vDrM47uVlJCaquXHwYsUl8pKN9Ti3XthBPS1E2ny3WhqGs1yNxbYWz8qaDH7?=
 =?us-ascii?Q?ESjpFCKiwD2GuAXDSLgsW9xptrmtolvOq7/oK4VmxS0lWCeSKTi4slz96Iel?=
 =?us-ascii?Q?lHFhOF0E8Z+q2gHyZvDxeITSOYtL1r3LkaCg75LUeEpKYrP3KRSj7u63h2HA?=
 =?us-ascii?Q?70/4ALvw+EhnAQH9Nz1zk0EDryXyYRuVUmJWa9zo6XyDTFsYDrRDn1okKT8Y?=
 =?us-ascii?Q?Fwq6wOxwSblIK8TcRa/u4JWemxEy5UU4AxKFn0ET3NFwP22cK08z/xsRUILp?=
 =?us-ascii?Q?4CDD0FXuQQGPWe3FV6VLMb/1BSnj753e3OzNJtmTCTHgsjplm8MkWi4WF2u8?=
 =?us-ascii?Q?SPtQpdDljdEGGXCV73kN8IVDS9LLOIzLeXJn03HaqXoN2el60Q0ZVbEgxWhg?=
 =?us-ascii?Q?lzErBqzqEgYR+pDGophZVnD169FEYl1avZ0XlnmjCgnc8eJk+GYZQtsyYrm6?=
 =?us-ascii?Q?CkEbTtVnl/04JRVB1IrQiDV/tmLpFj0H6tcTguhm/KrfasU47IkhTaaGaD5P?=
 =?us-ascii?Q?bcHwbPY+esWKccxvMvc5dQotxlwdn8vBmH6zQOKp6YXdu//YzzzXnNsvqSEY?=
 =?us-ascii?Q?HoxBaNPzzxJnCUOqpNOJKRieSTw4TPX1L+q8u0p44VRSIun7dsZ16BdIUmi7?=
 =?us-ascii?Q?ohhYxTjkM8p4fwhPFhUqoM/2ZxRkMPvAP5LzdK0uKe3fPQAq1sU9OXtKU4qz?=
 =?us-ascii?Q?LEvF3KRoTcNwGlqNTFJ/uYDI6XJ16FKbFmn+zQejAMtQTnabTKHCReTlHo9/?=
 =?us-ascii?Q?CA8enJY1dbvyxL4JZGknnqaLHrClKSRgmSzJfIMeqF27CQjXA0ZZExoRxvnj?=
 =?us-ascii?Q?SVJfJLeVc8rsyksUMPE7GT0ZFT2m6Pg+/586LHhcUo/SjZcWzjeo8ubeLEAS?=
 =?us-ascii?Q?YcK4Na86vbru0L/be1JqAY3Hp/Ao5dWL8GBq4k3AIepw9mDZu95iLlZFqVUg?=
 =?us-ascii?Q?/DhYmy0VAsOqXby2f1CWaAXJMPMexUXCTvNhAxH2sYcPfJCJk3T43nLGVSib?=
 =?us-ascii?Q?z6EdGB0ev7iWKjfbB2CpZkqZHGsQvyYA1ZH/+av9ZAKsQ64OkvaiG4/oEqnh?=
 =?us-ascii?Q?doXbizT/g6EJ6ZjKwLg5L/2RSOH3AzGG/EEB8XgRiUrjyo21Ukv6jnLBDIQ3?=
 =?us-ascii?Q?iDfQlDi3WwWuzTRKhckpa0cpxRlmkpzPVu5r3M0k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47f6517-3e93-4a73-4400-08ddf9e3ca35
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:50.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eI8YIatEnysRFcSVZmsjG1eBwqc/vNv6fa9FP2WRl1ugf3KV1XX6twqDpaP5u2ZYYSYjvu3TN2XEzDhbg/3AIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207

The gpio_regmap structure is leaked on the error path. Fix this by
jumping to the appropriate kfree instead of returning directly.

Fixes: db305161880a ("gpio: regmap: Allow ngpio to be read from the property")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Suggested-by: Michael Walle <mwalle@kernel.org>
---
Changes in v5:
- new patch

 drivers/gpio/gpio-regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index d9d23853e032..ab9e4077fa60 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -281,7 +281,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (!chip->ngpio) {
 		ret = gpiochip_get_ngpios(chip, chip->parent);
 		if (ret)
-			return ERR_PTR(ret);
+			goto err_free_gpio;
 	}
 
 	/* if not set, assume there is only one register */
-- 
2.25.1



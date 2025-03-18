Return-Path: <linux-gpio+bounces-17716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B57A66943
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 06:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B406416A0D5
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 05:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C21E1C2324;
	Tue, 18 Mar 2025 05:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZLZlXyX1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71441A8413;
	Tue, 18 Mar 2025 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742275702; cv=fail; b=Ay/TOGfQBjWzuxSpmRwXzsl3wY8w6BpDF+z3Qba8UDoJVMiVQmvgkthXyhE+O5uUIxnsK+MKi1hFmJNofYQWjRP38tcW7gObLxr/x/DjFOWWwzKBC4mVEjBdxVTn9isrkoIP1xBg2W5hNm8tORKRz8ToP982htPNU1d62XWQQrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742275702; c=relaxed/simple;
	bh=rd8yCbi1wj4qycG+ilwtLW4w1aMZzu9/Q58W0cyyCYU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YJ5I5Eq0uCuR5rM7KbQJQVWy4xN6S2xxbzdeAb8LkYbJXb10rBUqbEF0y2NfXBJ+OvfL9h3XWwtgMG96pRkpI7L57XwOLSmtc5bZ+MFPMZ4VA10/kwJa25+6rInNExTyHqHstBB5PQpzLZqPJCZAo8Bot+0YQRPCqBii6kH9dtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZLZlXyX1; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vd+3JuLw6pGg1mENurNi5DA+4jdZL5pR5qRgVhGacpiXdp/bLrFukNL9EnDUTrmj6Q10wA880hdE8t6dmXZEhM9H6PgP8wQ2Tckg0X/g2C6uYf0HlPY0eCVhElvPkXUghDSxrYewPM/0Xv+wGn3dnSbkLnbha1qB23Rumf6PCLyGQ/I4jQiJ0QO+Jgy28iwLYVFx5TxsOCoItqsVKAnzT+WObNDK9Sht5O65I4QDIcQDGh6q29sbe/TLV2chN0y2B2w74/jiigXuFiwiVXSDKXsbXy3R9Umj4FSBWNLo+i3Yod7C8EKuzvN9V2GY59kYKWV78VFsgvwZ2pUFm+qlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRbCMmHMm7CIBJIfMNPILMlVITtFupmO3OvjSKsMsNI=;
 b=kxYTEX95QtoLOoiNK0FKi4hIko+vg4Rfg19l2tSarXoNgnkShI3Q0UakHbKU7ufJoSwDOId0SbJ8GXkBiyg4EbAaXFIVNm3eT3bp7OGdgIVUhV2PrK5wpC5moblF2I2p79pLszLvJ5tpaHGq38vG7o6PhL6r9JXLR8XYJMfe3P9lJa/2GCTr+RBpumCFdfbCzk09aCYibqAFVUWXrPsr7oMRY5XVUHthaPET22LdN/bx/NBD4hd3dxBAlzfS1Tx3At3jVsDQFK59/9CmojNskwtprd2w63QUwQT9ET3fbLcnc3wDyn3R+F3nSGmT8I6xVG3MKEtfIP4KG8W6bzo0qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRbCMmHMm7CIBJIfMNPILMlVITtFupmO3OvjSKsMsNI=;
 b=ZLZlXyX15Q16H5BARGzTjZn01J3gSNXw/5EX5ecXuYTHN0xjlTSPXpgIRrNOpENugnii2Sl1XNYE1QCFUfDk91Ow7PJN4dP2gVmjui7/woGBrEjB6lyiinb4Gy0BO9HS5RGNleFWvmPYiKgl5YNZsJDef2UUc8TrxXiaPypZlh8qLeie2jo9UCbaQRQ2st+NlFb18tRZUC+KA7CxlHpKHEM3IdVjyZVy48dcGBVhWgzZnN2M3xzbvVJRu71Y27GCVVOxDIdEP+uK89RWtyGjVQUMzscHfoeOi9GNasasyoofIFLDfooruxhgUY9fBcN5CZGQnOPwIxivU/NOoCAmAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9848.eurprd04.prod.outlook.com (2603:10a6:10:4dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 05:28:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 05:28:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: krzk@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
Date: Tue, 18 Mar 2025 13:27:09 +0800
Message-Id: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0086.apcprd03.prod.outlook.com
 (2603:1096:4:7c::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB9848:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a85892-5aa1-4280-b119-08dd65ddaf9c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M0zcYo+412JQUs1f6u+yc5U8uL/Ssl6SvsYpAvBgAkC+6EyPP6EqnsXPqYSI?=
 =?us-ascii?Q?CJwu+tms1kUT5InEQ/IJYiEoNzsGraZcUlye0fdhdziJs9O9xEm/yWDXLoXS?=
 =?us-ascii?Q?HxmJpHd7L0Ht6eLFMZ3j4M0MPCheUZ+ur+l4xKLCCT2rEw6eKbQi2e4CJ/Ej?=
 =?us-ascii?Q?m6iO6uE0YoNTE/vYGfb1DH/TCJqHovU0nInjcjr5PDHJQPlPGIxCuZHxPxfH?=
 =?us-ascii?Q?wElIxLidNmu+Zj1jralaPdqyVxvsfdQGzDQc8NoItzlzmcbWZxlPoGz9N7Wr?=
 =?us-ascii?Q?6FTjszrceJFLM9l7XIUZSBvQHs3DILJIVIQtafEoC6psF7VWTrtecmzNAu2x?=
 =?us-ascii?Q?NpTP8mrgjs84fe011KxoU3HdyTqVsiO9ybpm7uIiiZh4VN0bzqNUaB6kH2KO?=
 =?us-ascii?Q?o3oIcsTp6VqKa82xoYg6K9D1CyxC+Ugdio2LL/WbS6IK/HnuEGpbrGaE2g4m?=
 =?us-ascii?Q?FWWA+f9LGl0o+gSnULxLO7waUd8ayDcHvy1DTiLkGqvel3DL0dRBJff2Nam2?=
 =?us-ascii?Q?wF+UeyrqZK7nBknUyYaOGbhOggswP10o2G/Fy0HRPerQ9ebKaiDYLtl+PVnh?=
 =?us-ascii?Q?Zsy4pZkM50ZcrocySbwbl/e8w0PX2NfeBeu1sbWRul21FjMA4ftDSdLt2hwr?=
 =?us-ascii?Q?TQum6suqwKfXMlhi1GtaAYDIsukYE74xSQYBxjhr5ev1kGBluev31xgElqGK?=
 =?us-ascii?Q?uyYQWhw9GOyFxBQkUahvdgWnoauqSzQYpj95bIjvDFFq+Qw8WlaX+GAnfsCv?=
 =?us-ascii?Q?mnbJSo9uiiIOfmDy8TODyAjqrR+BVEPPYzXzXMSGYgqTFksSeYqunpcpsh/p?=
 =?us-ascii?Q?9OTNXlIUVRTGuSrpqFVwUc52m/lo6ZbiW2hm9Aa3eWV/rUD61Nq31omQoc+d?=
 =?us-ascii?Q?wmGZXfle/hc99AbxdvdREYArbJHErTtocU5rtmuCjgfeVm8LCvgSm/6WmNzi?=
 =?us-ascii?Q?PsWYQPI8beoemWYgoDolg9KCAouaboyn/CpJiBhPejF7iCubZLB4ULBc91rg?=
 =?us-ascii?Q?/2OOxPXBaimqzOyewGRpwGfG5cNPFz90j3znJOqCQxXinbzLnmW9OZyRV1Ei?=
 =?us-ascii?Q?WtAAJ0xd5614T1fdyVEy01sb6y4Tzv5ileI9ijPYlRm6HgQXkFVJzdP7Qap8?=
 =?us-ascii?Q?5v899KQj0WHnz2Ek38xUGJC58emj4xy6T1AG3N/r1k8d9abuL2/4ZT+uMhlr?=
 =?us-ascii?Q?3GiqMR2Vh7oZGdf1+DDENS0Vv7aNe3h/O4fYS9brXKwg1bMBtjX6f8HiBrYR?=
 =?us-ascii?Q?Ln8d2VM84s4NA6S9DBBb1CcE+0H62RXqj1zgQkxz9qbA7i6QEm0DJ6GPFG0U?=
 =?us-ascii?Q?PYI9lm0+LuDOaHL+Y1ii4BRFrJnulLexqY9LaRyA4OEFwJSwxdbvNHFmQmTf?=
 =?us-ascii?Q?M5vFSLL7FNCM7iPIwJRvhghSXlNCU7kYms3nEfKEk6J4SR+bTh1W24FzMRfe?=
 =?us-ascii?Q?oQ/n2v3lH0AkfA+7baXhYg7i7MgW973p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?99t0P0yoVx21GepaPhDgSWUOEL0cKo97E/k7LTKodu0rAsEmrYno3leWWrcC?=
 =?us-ascii?Q?NTd/TqwbsaLJ3bnDJDccTvMSYabgRQacEqDkZX9wJxrsTFKK9a1b2DHXEaja?=
 =?us-ascii?Q?858hlUEyeYzeQx8PKd+O/OTMm3Kta6uqDHoap1g5EUnqrw+9mXKtYCZ1Vgrk?=
 =?us-ascii?Q?eeKay26ktcwjTDUfK+0ouNQi+ojtmCScyHYloQZP0ObWMUSKmFnFJEkFQYnN?=
 =?us-ascii?Q?vfxUz7urVEOidVUyhDlm/hKSTDJXZ0LjLz09eVd4u3+7gwJZF7jvV8SFL5MR?=
 =?us-ascii?Q?vv/P9cYIwR1W000uLtF+s6mG7N9YmjexRFwBzSNRGvs1clom5wEzURiu2+/5?=
 =?us-ascii?Q?MYigVifbUAO9tOyDZziB8iR3egmJGOvDI2Qm09lKCxMcC7rO4Q18vXoxU2Mm?=
 =?us-ascii?Q?7Yjb5Sv9JfVtQLiexCxWewfwkTwqNkn1BhHWFNg7dtxYNFKOXBrMOZUva6zl?=
 =?us-ascii?Q?P+EjuxvSX0dcV0fuc5Er5E51Wy1IuR+FW5uOT70466K/LEEFHlcv+iShr7JB?=
 =?us-ascii?Q?ES6kqv6XzliCo2YK4ZEN2u+VLMElFwHMD0V+jjMlu+t5M8496dTCgnJgeYAU?=
 =?us-ascii?Q?oqDitVvEYvpLfSAhKednFOWr6E1IA6UwyV+0zZIhvhaV/Ay4EoI4Y1GtcuvT?=
 =?us-ascii?Q?J35UeGY/XBRqxp2YgwW2LU53sZn1YSNVcXMYx06ROuw4uaf+lS0tTYPMUgsu?=
 =?us-ascii?Q?JDnO/xuGkVZ3dad4r1cJd/4qxpwH+r1kNMiFpAAPJjw+EGlR+0JLXDc0Tng1?=
 =?us-ascii?Q?dyCBL6XHjYl7apTXcXO0wAAyjl50bw2j58MbLFH/nnCvrsF4E2TKnY4g4gSo?=
 =?us-ascii?Q?ZLuf9d0IDQPmIkEB1JYAV1K+sbp6BOoGbgB9ZFZqokzxKPsh1mrYW/VSL1oN?=
 =?us-ascii?Q?pxqgEF1vu0iwsRHoj9XAy3X/yq8VK88/f0Tv3F3zOI1UN0N3zASxr8d4KIQ3?=
 =?us-ascii?Q?PohKYr86MzwBsUqXSrmjseyuKLuUkWL9wdqweXCxnbtMYZBMeHUf01YBOWA7?=
 =?us-ascii?Q?WDLziiFPBE3mVxmZvx1cKzsHISYYcPY1skZfZ7F2GAB73aGy512vVqwghC+W?=
 =?us-ascii?Q?jrCk407S/4s5PQ3TptCbWgReJojwj6lMRM7FCB4CatsVzgYQ8TkeA9qkx3gS?=
 =?us-ascii?Q?jGK5RSFVNTnDZPOBW1uoxNVqPochPHCWQHuGpZ0uiQKVpbZPxpMxMPJMv0rg?=
 =?us-ascii?Q?lSNGMm8EQd6qWWtFdNZv3ioYEu+C25uQtoZhA5EoKpUETrjc+Q4ASX/zHmrh?=
 =?us-ascii?Q?XFeAa/xMhK2o62uPetsocASS9tMbiMPNet54KxNb2M9e3q7I1MKQGKZKvtwe?=
 =?us-ascii?Q?JBFtjf5rZri3GYpdADYEuB/n6p0fU2OPd/hcdl0kE+kkS007BL8Qne/vRHwj?=
 =?us-ascii?Q?uc65AWkZvqi+LIO19seaEjswgmq+nxjOLDGk0wN4aq2bFpwuAt0Q+ml2B8sE?=
 =?us-ascii?Q?CMPNYXse7EcjtHiEmKT0TjxeiaE5i14JF/kyqnEI3CmSHfagYX6UKuLb0ucg?=
 =?us-ascii?Q?RM2FqzP45BBRaPuWArPv3+/yqoluF7wDCdwKGAZ5e0cTsDe7g+cZj6Ysxjwy?=
 =?us-ascii?Q?lu36nvFtFvE1Urz6U9Wx3fp61Euu88evsp88b8zN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a85892-5aa1-4280-b119-08dd65ddaf9c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 05:28:16.6838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jR5Z5zSDufxsk9LhkH6aaC5ajSoKurguz4xdM8ArMxtXKt5mnCvsXg5zgO7CEwxe2l538xIHwY4IgMdBVInPmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9848

From: Peng Fan <peng.fan@nxp.com>

Update the driver to fetch buck_gpio and buck_ds as gpio descriptors.
Then drop the usage of 'of_gpio.h' which should be deprecated.
Take commit 84618d5e31cf ("regulator: max8997:
Convert to GPIO descriptors") as a reference to make the changes.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 Not have device to test, just do my best pratice to make the changes.

 drivers/regulator/s5m8767.c | 149 ++++++++++--------------------------
 1 file changed, 41 insertions(+), 108 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index d25cd81e3f36..57a6476f217f 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -5,7 +5,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/err.h>
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -35,8 +35,8 @@ struct s5m8767_info {
 	u8 buck2_vol[8];
 	u8 buck3_vol[8];
 	u8 buck4_vol[8];
-	int buck_gpios[3];
-	int buck_ds[3];
+	struct gpio_desc *buck_gpios[3];
+	struct gpio_desc *buck_ds[3];
 	int buck_gpioindex;
 };
 
@@ -272,9 +272,9 @@ static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
 {
 	int temp_index = s5m8767->buck_gpioindex;
 
-	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
 
 	return 0;
 }
@@ -283,9 +283,9 @@ static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
 {
 	int temp_index = s5m8767->buck_gpioindex;
 
-	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
 
 	return 0;
 }
@@ -482,42 +482,6 @@ static int s5m8767_enable_ext_control(struct s5m8767_info *s5m8767,
 
 
 #ifdef CONFIG_OF
-static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
-			struct sec_platform_data *pdata,
-			struct device_node *pmic_np)
-{
-	int i, gpio;
-
-	for (i = 0; i < 3; i++) {
-		gpio = of_get_named_gpio(pmic_np,
-					"s5m8767,pmic-buck-dvs-gpios", i);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
-			return -EINVAL;
-		}
-		pdata->buck_gpios[i] = gpio;
-	}
-	return 0;
-}
-
-static int s5m8767_pmic_dt_parse_ds_gpio(struct sec_pmic_dev *iodev,
-			struct sec_platform_data *pdata,
-			struct device_node *pmic_np)
-{
-	int i, gpio;
-
-	for (i = 0; i < 3; i++) {
-		gpio = of_get_named_gpio(pmic_np,
-					"s5m8767,pmic-buck-ds-gpios", i);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
-			return -EINVAL;
-		}
-		pdata->buck_ds[i] = gpio;
-	}
-	return 0;
-}
-
 static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 					struct sec_platform_data *pdata)
 {
@@ -525,7 +489,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 	struct device_node *pmic_np, *reg_np;
 	struct sec_regulator_data *rdata;
 	struct sec_opmode_data *rmode;
-	unsigned int i, dvs_voltage_nr = 8, ret;
+	unsigned int i, dvs_voltage_nr = 8;
 
 	pmic_np = iodev->dev->of_node;
 	if (!pmic_np) {
@@ -635,10 +599,6 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 
 	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
 						pdata->buck4_gpiodvs) {
-		ret = s5m8767_pmic_dt_parse_dvs_gpio(iodev, pdata, pmic_np);
-		if (ret)
-			return -EINVAL;
-
 		if (of_property_read_u32(pmic_np,
 				"s5m8767,pmic-buck-default-dvs-idx",
 				&pdata->buck_default_idx)) {
@@ -652,10 +612,6 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		}
 	}
 
-	ret = s5m8767_pmic_dt_parse_ds_gpio(iodev, pdata, pmic_np);
-	if (ret)
-		return -EINVAL;
-
 	pdata->buck2_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck2-ramp-enable");
 	pdata->buck3_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck3-ramp-enable");
 	pdata->buck4_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck4-ramp-enable");
@@ -684,6 +640,8 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 	struct regulator_config config = { };
 	struct s5m8767_info *s5m8767;
 	int i, ret, buck_init;
+	const char *gpiods_names[3] = {"S5M8767 DS2", "S5M8767 DS3", "S5M8767 DS4"};
+	const char *gpiodvs_names[3] = {"S5M8767 SET1", "S5M8767 SET2", "S5M8767 SET3"};
 
 	if (!pdata) {
 		dev_err(pdev->dev.parent, "Platform data not supplied\n");
@@ -731,12 +689,6 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 	s5m8767->buck2_gpiodvs = pdata->buck2_gpiodvs;
 	s5m8767->buck3_gpiodvs = pdata->buck3_gpiodvs;
 	s5m8767->buck4_gpiodvs = pdata->buck4_gpiodvs;
-	s5m8767->buck_gpios[0] = pdata->buck_gpios[0];
-	s5m8767->buck_gpios[1] = pdata->buck_gpios[1];
-	s5m8767->buck_gpios[2] = pdata->buck_gpios[2];
-	s5m8767->buck_ds[0] = pdata->buck_ds[0];
-	s5m8767->buck_ds[1] = pdata->buck_ds[1];
-	s5m8767->buck_ds[2] = pdata->buck_ds[2];
 
 	s5m8767->ramp_delay = pdata->buck_ramp_delay;
 	s5m8767->buck2_ramp = pdata->buck2_ramp_enable;
@@ -787,58 +739,39 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 
 	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
 						pdata->buck4_gpiodvs) {
+		for (i = 0; i < 3; i++) {
+			enum gpiod_flags flags;
 
-		if (!gpio_is_valid(pdata->buck_gpios[0]) ||
-			!gpio_is_valid(pdata->buck_gpios[1]) ||
-			!gpio_is_valid(pdata->buck_gpios[2])) {
-			dev_err(&pdev->dev, "GPIO NOT VALID\n");
-			return -EINVAL;
-		}
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
-					"S5M8767 SET1");
-		if (ret)
-			return ret;
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
-					"S5M8767 SET2");
-		if (ret)
-			return ret;
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
-					"S5M8767 SET3");
-		if (ret)
-			return ret;
+			if (s5m8767->buck_gpioindex & BIT(2 - i))
+				flags = GPIOD_OUT_HIGH;
+			else
+				flags = GPIOD_OUT_LOW;
+
+			s5m8767->buck_gpios[i] = devm_gpiod_get_index(iodev->dev,
+								      "s5m8767,pmic-buck-dvs",
+								      i,
+								      flags);
+			if (IS_ERR(s5m8767->buck_gpios[i])) {
+				ret = PTR_ERR(s5m8767->buck_gpios[i]);
+				return dev_err_probe(iodev->dev, ret, "invalid gpio[%d]: %d\n",
+						     i, ret);
+			}
 
-		/* SET1 GPIO */
-		gpio_direction_output(pdata->buck_gpios[0],
-				(s5m8767->buck_gpioindex >> 2) & 0x1);
-		/* SET2 GPIO */
-		gpio_direction_output(pdata->buck_gpios[1],
-				(s5m8767->buck_gpioindex >> 1) & 0x1);
-		/* SET3 GPIO */
-		gpio_direction_output(pdata->buck_gpios[2],
-				(s5m8767->buck_gpioindex >> 0) & 0x1);
+			gpiod_set_consumer_name(s5m8767->buck_gpios[i], gpiodvs_names[i]);
+		}
 	}
 
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[0], "S5M8767 DS2");
-	if (ret)
-		return ret;
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[1], "S5M8767 DS3");
-	if (ret)
-		return ret;
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[2], "S5M8767 DS4");
-	if (ret)
-		return ret;
-
-	/* DS2 GPIO */
-	gpio_direction_output(pdata->buck_ds[0], 0x0);
-	/* DS3 GPIO */
-	gpio_direction_output(pdata->buck_ds[1], 0x0);
-	/* DS4 GPIO */
-	gpio_direction_output(pdata->buck_ds[2], 0x0);
+	for (i = 0; i < 3; i++) {
+		s5m8767->buck_ds[i] = devm_gpiod_get_index(iodev->dev,
+							   "s5m8767,pmic-buck-ds",
+							   i, GPIOD_OUT_LOW);
+		if (IS_ERR(s5m8767->buck_ds[i])) {
+			ret = PTR_ERR(s5m8767->buck_ds[i]);
+			return dev_err_probe(iodev->dev, ret, "can't get GPIO %d (%d)\n",
+					     i, ret);
+		}
+		gpiod_set_consumer_name(s5m8767->buck_ds[i], gpiods_names[i]);
+	}
 
 	regmap_update_bits(s5m8767->iodev->regmap_pmic,
 			   S5M8767_REG_BUCK2CTRL, 1 << 1,
-- 
2.37.1



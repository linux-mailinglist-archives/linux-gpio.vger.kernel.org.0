Return-Path: <linux-gpio+bounces-9134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9395E73E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 05:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F30D81C210C3
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 03:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C9926AFF;
	Mon, 26 Aug 2024 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="avLumW78"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2054.outbound.protection.outlook.com [40.107.117.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD031DFCF;
	Mon, 26 Aug 2024 03:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724642194; cv=fail; b=scLtqOmllUFeee+Bxx/hLnwQlxjBRMXc+XNQ88H9Jv71mXIgsWZyjYnwbGjCnJuPFdU7C0HFGRbgJCZ4NY1vFxfnjCtHlpec9Nm/2EOcMDXgTkl41r66oSJaoMLfyPbddZ+/PrW83MEbk5asbz9Y9KIzW5hLhc9vX/JBd076c/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724642194; c=relaxed/simple;
	bh=vbU6mMSo69weIG84pjocJ7IeTCl/cfPZo5fdV5T9pGg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gRdXfZiXdw8qtu2JgSp1CYcC2sk302g+YMOuHABQT7b+zTM16jQj7Fgtty3XtBXCmFf0QqLhzWjXXC3z00Q2wajV+O0FIHJtMQukhNzDptNpJJbXNN67bvoYzPMi24PFIbmrDJ4v//3GDRy/EcSgbnuvxHrApFnEdX604hFZ6W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=avLumW78; arc=fail smtp.client-ip=40.107.117.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hhr/rYH5pWYrXSRyfXZXOl76Vku2XixmMCYaX6cvseIYJYNE/UYWr7xnH48FmnzokXpY1+b6pXxGEc3+g6A4Qv5acUxOD9SAyFswtiYJMLVZdkcx4A9MFVa0o0/rrg/gLdwaNy5z6IQ3QlEC9deixzSGGEkUVpss/c0Ym3zLwGXvQ45f3To6lbKmobPeOv032AAGU5804q5+cA+GW6IhjrXgtnStNppbIurj+iF8VLoyqUyKSU6V33skQ1G4zA1xfv8tBeSHQtFEoidL3zW09IJ2hGBAuGqUn9PsdL88DwqbSwVjKjHTu+E+Uhm4CYH4tp+SXfZJmT3tlNHtmkjV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgR/LwofiB/Izm6fIUykAIXCPGT9F2TdrjB6uZFyVBE=;
 b=N7MA1MutmsR+iQIIqIvwgS5aYbVeVKhWda9SXk7AyUX0a3iwZOIceuWOWgjMQi/2xYZr8WVQDD/tiw0Hp3gS44YQqhpowzYb8bvb5OViJcoyhmWoY2b6PRVx9lgqWu6dO7eZiC638sdelQ7LuDl5OwkXV1lx2J68aJI3eEOw2NiIosrBawihpYdQyEfBfCRySKWx2woq+lzM4SV3rA9TqEJM95qFePMmDhiXfYHpixqh3ZhRLErAq/sEGlLRtClPQeLlozof937n3HXPjKAkPYUaB/BpcDaAAKIHC9GoWQX1q2e5cMIk8Y4u8XxvCb7lxchx8G50fJBb9CQW0qS1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgR/LwofiB/Izm6fIUykAIXCPGT9F2TdrjB6uZFyVBE=;
 b=avLumW783vekMpnRt+MxxwbcM87vvXtu8n99OqJQo6FwfIwGT9a9d9bfcjJabKCh926PtBBI6Yi7eQIFKsTR6eNGKwin2sENYFEbywyboH0UZh/hH3zwhyGGzdB9n0R6vxM3Qmo/9flMPE88O0ahWKucSZ9R7rgKc50LpTVAQcHhwfsX3KYU0uKhFiPa/fuWyUvaxANCmlTzPH2y8ktzMJ5gkH3cFkwFyMDmIy8sB3GjFHqRkcW/aMbf5FA7qV/81qd3AimzpBJXZee/9eb8efkpKb48e+CA5uurdNw7r4bW/lINdP5ezRGt09gT/yODmo1+OJuW4MfOBcsQszkvsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by OSQPR06MB7279.apcprd06.prod.outlook.com (2603:1096:604:294::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 26 Aug
 2024 03:16:26 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 03:16:26 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v2] pinctrl: renesas: Switch to use kmemdup_array()
Date: Mon, 26 Aug 2024 11:15:50 +0800
Message-Id: <20240826031550.2393-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|OSQPR06MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ece58b-c513-4e87-4ccf-08dcc57d7838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GKiuR9BOzFdKHIRwr4lzKVbrcB202MJPTYInn8hpNHfKtinUlZQneK8Vkxfh?=
 =?us-ascii?Q?fM8ycGrb4CWGI7SDsmD0juu4lVt/9Ymw3RdSHK+Ag8BhJWa3Cxxs4V2eWq4+?=
 =?us-ascii?Q?4VCDoF+yoUxOZwgs1+AyQxIDl4/ZAW6qKidwSaxcoi2ITxtNgDqd9VnyI7dp?=
 =?us-ascii?Q?QPkRTSzxj0lRL8d+MApIy0+/CtLnPEs6Rk7kY+sTbEj3+DgVAJ+yzHE/IZSx?=
 =?us-ascii?Q?qOHWW2VuC0a4afNNxM/1AHnI0HrchHjUWPSBV/m5Pz9ynEJpI+R2A8aUO0q9?=
 =?us-ascii?Q?lmI9hQ0N+Ei4XEld78lovrJ+yJqdvM7oIn8tGPCUcx7NgbUV1MTwzX/8ojW/?=
 =?us-ascii?Q?I6OIIksa5BWzvzeeWekht3WO8gJHdv5R/5Kr/g0FHeHxtmh3ZDDxiCK7bp8Q?=
 =?us-ascii?Q?NHK3tnxXQhmCdf9RT/WxoL3xb/0rkDPCbEBemnuLwrq/di6BtZ8j++j4gNtt?=
 =?us-ascii?Q?5Kab8+4mkLJNBjU956aowsoZGiA0kZBhVR8yY/VQZKSdtIS9KsQLosq0XJeu?=
 =?us-ascii?Q?V/Nu2mEpF9OD6gK4Vj6mGtqbZ8BRJBQiqYEifu2kI8tmA0CRucPcRECxjk47?=
 =?us-ascii?Q?bSDj0SsTAxPWgGj3c84lB0sunZ913OrO2pY7jDjoKbSmNJ/qN4j6oOK/wxJ4?=
 =?us-ascii?Q?byR5hhhgBhUuK5VeSnpcOAv2PrchUd1nfdf3dBMmO/wnz9dydNvuvxpCML5p?=
 =?us-ascii?Q?30OBhCGCcetKYqocyCOr632Eueu7NjzFqsfyNQ0oog1k8dc19P2PcbTvrOpK?=
 =?us-ascii?Q?QKkfl2iuikW/TVWwxsj4p7zFPi1eShsYv4mYCrArb0/YEIvBgVSh2UnQxphX?=
 =?us-ascii?Q?fYI51NsZEuNaYTcsk8Sag/5Ke/him9xbLPYPaS7Edu1J19GJXvinj7himyC7?=
 =?us-ascii?Q?tyLDX8Ij/Jjs4FAYU9efDl2a7gnR0CrID7f4MkNuDU9LCZ4uoo/AJ3uWNZRr?=
 =?us-ascii?Q?Kpdu02+iKRClfMU5GCKX2ywNceXI8TQFV3nLNn2e3scyKnwkr9bKep0zKm5+?=
 =?us-ascii?Q?GiZjR6Z9EbXYO00yfYAPTz5xv03rGV12Lsj2lvBJokAzKzJyQ63OCEHnImTt?=
 =?us-ascii?Q?QkhjWwwL/lCEUuJTmISQLSwmDMQgPFDxH/5bygTtottXznSO97G6ZS0Utbm2?=
 =?us-ascii?Q?5bDBQ/qPAu8sR9YLIcj7U0x2xhK5Ksqk3t5BoKGT3EYr7P/7I/dqX/Wyff1l?=
 =?us-ascii?Q?yJl4cqWYaATBQcJjCniAJFlfZGEbFZk3cwlA/Hldubsb/ZP6ZxK1LNQQQ44b?=
 =?us-ascii?Q?1Ozm/wyU6qnw1jFy8PEQKyVX7ISWISmLumntpdD+W9p04ePOGYPT8bosQ7hk?=
 =?us-ascii?Q?T2grhYcYfWvC24AQlwuH80zmrIKsT17Sbtytb9OBq2f2G4XCNXFO5EanVO2H?=
 =?us-ascii?Q?4oX+GaM3wniIR/jKK9NyNkJa78+HRDcFh2/nqsifsdwp9KGMpA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FyMHHetjQIoGlhIurrlH4Jz2Di4pKieFUqW3SugSP9vI3FN3ZfZZER2/Y0uQ?=
 =?us-ascii?Q?NIODFbeU9q01LsaqC0GoE6K0Q6UEgGHYSnLflTqj0VEMBFsF9ko3pE/bcLSb?=
 =?us-ascii?Q?BpxvmQD2oGD0UlJf7PqS+Ib0/VVOUdHIPqe4C1Elr5bfoTAyqgMo7DFbsXzg?=
 =?us-ascii?Q?pGbuFPH92X5TA90WFBXO0eYEnb0gw+JxU3IfN5AbixJljqLBP6QSX3frSvj7?=
 =?us-ascii?Q?U121usFpUMFB7vaVvShexTMbI3kQ7qJROg4Y8twJ02f90MTfn7gaFynQloY0?=
 =?us-ascii?Q?Y9Q4oO5z+/8HiJXhG8TsGYWLUJQ3Q+M4JDAmw5bV0LP6tjrA+s1jrgtSf7Lb?=
 =?us-ascii?Q?qkGhXE1GKn+/zxw8Gqf7VVln0vm09PU0noF+Ht2WP2UyChu1CrlrIeHiOON4?=
 =?us-ascii?Q?Vk5609PSWsrh+x3ZAd/jwSUyBW8oACoPm5yUdTJD0nt9JQKGBhxWzz13CRih?=
 =?us-ascii?Q?BOk79rFQjS8EjIQhzLetK43W9OBPtj7sYeyIhtrnMNJy+foDoRQ4UB6qX6nj?=
 =?us-ascii?Q?p4/rY89itDX+5rHxUb74y4ZlYBk27hGLZzQezXYesOt8W3TMi2EA5qC+s3kj?=
 =?us-ascii?Q?3fsFr5ODPDu23wCyz9uPgH1UdeGd7qRb9s0zPfS078z8WwRLw4OAB/aLGHQX?=
 =?us-ascii?Q?EAYCtpcuPBuQSJOXbSzDxeZOCVIVJ2+WJxaDB+cKhk447TdN9qAhQv15EqT4?=
 =?us-ascii?Q?uxDdF8hrz+lLrU8F1wW6CQFvZAR3h49KADZkgj6FyMGAo1oZpxmRvHAtdi0e?=
 =?us-ascii?Q?yOF/vgLsXaXGCwEv4l3B8DQfmp2nlBNBixDOQdI2Lpkene/g28XfXmmv557+?=
 =?us-ascii?Q?BqOPqYAfHKjkp+6V7aHQh2Byp+7/189eBrmixC9jNdCdArZY3OR70IYSBwQV?=
 =?us-ascii?Q?1SDvtDmtzRpjZnEkjqKHcxE/Ct50rH6hHUZ8GEXb/BtZJUEuSNegXSes7hD7?=
 =?us-ascii?Q?FKFzkxK7GgIUiLr4jLJmEo9tK8mPWutSzo7/gX8bgDQbZzLDmAJQXXmxlAs1?=
 =?us-ascii?Q?6WUyUqwavrw5PwLWW+EZehZ1pQarHrvc0IHFmqyB4ah3QQT2TJ06GEpN0M+B?=
 =?us-ascii?Q?U2IIF5bRHRY+dvr7Hnbb6q7wT6ixhirE53A/bCajzyzO8gUpSW3NnoCh9VVW?=
 =?us-ascii?Q?tkLNGaqV5Qs+rPRPptI5qIkD5AuCR5F+ra177b9yj2gibpLqAMUcLYNoD4fi?=
 =?us-ascii?Q?ap0v9uUxJaU616WY/DRocJ1nwYfof07qmoD2zI5bWBehn0FGg4xskzzp1xJv?=
 =?us-ascii?Q?yYeFneI/j+cmTXOQnSWFAvdTgRImeE3RIf9uCTUANz0us/7gB5+XWYJU7FJB?=
 =?us-ascii?Q?cgdWBqgBZTmDLAzu+cEy5cevo7rmHwxrLmISjqowzrU1pUkEkQXwLwG5Nj7r?=
 =?us-ascii?Q?Q9nCvumGwqxusCq4T2ElurZeeinPUrM/7hA/tFnO5jiCrX47KLFijGVrcCyp?=
 =?us-ascii?Q?g+vPW3UWoMmy1omgqc9jXOJG8+JZLE0RsiXeUKP9LDbEaVQL8/gjK8wYEfM8?=
 =?us-ascii?Q?ueh0e4mAcoaa1hvNYTlAN0Se5BByLZpq2R9I7wci1/qFCZlsIOzQ3XXIOpN4?=
 =?us-ascii?Q?DpkinXKkMWe+bFm+XxzYZRL4+2/hu7zZ7bP6s86b?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ece58b-c513-4e87-4ccf-08dcc57d7838
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 03:16:25.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Et/TVCg9kJMVLAHXShkM052qR/MrdC0NDR0KS7Isphjj5UI6WHuaKxfHyVlvxcVE+s5btUq4aqIzZp8LyaNAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7279

Let the kmemdup_array() take care about multiplication
and possible overflows.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1 -> v2: 
* Changed subject prefix to "pinctrl: renesas: "
* Fixed spelling mistakes
* Adapted code formatting to linux coding style

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 3 +--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 3 +--
 drivers/pinctrl/renesas/pinctrl.c       | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5e3d735a8570..2a73a8c374b3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -528,8 +528,7 @@ static int rzg2l_map_add_config(struct pinctrl_map *map,
 {
 	unsigned long *cfgs;
 
-	cfgs = kmemdup(configs, num_configs * sizeof(*cfgs),
-		       GFP_KERNEL);
+	cfgs = kmemdup_array(configs, num_configs, sizeof(*cfgs), GFP_KERNEL);
 	if (!cfgs)
 		return -ENOMEM;
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 0cae5472ac67..4062c56619f5 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -196,8 +196,7 @@ static int rzv2m_map_add_config(struct pinctrl_map *map,
 {
 	unsigned long *cfgs;
 
-	cfgs = kmemdup(configs, num_configs * sizeof(*cfgs),
-		       GFP_KERNEL);
+	cfgs = kmemdup_array(configs, num_configs, sizeof(*cfgs), GFP_KERNEL);
 	if (!cfgs)
 		return -ENOMEM;
 
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 03e9bdbc82b9..29d16c9c1bd1 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -83,8 +83,7 @@ static int sh_pfc_map_add_config(struct pinctrl_map *map,
 {
 	unsigned long *cfgs;
 
-	cfgs = kmemdup(configs, num_configs * sizeof(*cfgs),
-		       GFP_KERNEL);
+	cfgs = kmemdup_array(configs, num_configs, sizeof(*cfgs), GFP_KERNEL);
 	if (cfgs == NULL)
 		return -ENOMEM;
 
-- 
2.17.1



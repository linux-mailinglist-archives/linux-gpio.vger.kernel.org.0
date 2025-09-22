Return-Path: <linux-gpio+bounces-26467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 373BAB91ACD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0681892CD0
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C361EF091;
	Mon, 22 Sep 2025 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UGFrmLwK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29FD248891;
	Mon, 22 Sep 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551096; cv=fail; b=nfmLC0CI7fkoFZSP7c5mB2QlRy/e/iiKrUlH2teRHHOja1Wy6RqZ7Orh71zicFviOGR02nPY4rvgFwMZFgLclUAEu7OsUgc+afMIbCbZ+JP/YHz5O8ewNd0Gg1POUOy/2D+ldj7osd0kJil9UnLc1DUtdMZDXNctFZLukeHAm4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551096; c=relaxed/simple;
	bh=5p5lp7Ka9qDnMLn4dHpwdmr7lzrt9ZoqN1U1/59CcYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PBxCN7OQZpznoc1HR1T09CcD9isNV4eI39rTmY8MwafutvcT/a5tC5ryA/rlSsCtLgM637ZlLAH+EqbECJNsfrLYF3RUo7iZ4bWFGU7rbEY66glv7G72HzlWs2al2I0GBGW56VnyXEx0QaDD1++XKVfftYOdY+JoS7CfVgZh8wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UGFrmLwK; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyzL+qIlWjBTUXTHb0JS4/BT3nD7yFA2D9S10bhKOwJeP0RxOkPoy2+tvjxvib8kUEFyVNbvHOvkurzOx+IE1ooDDhRUwpPn6qFKClwl3GIWnZHqTSvfW8NJwpjjC0ywcttMLEgoOKP0Fdoa940IGW1JhuZqB2hbEKWDdYRii4Xn5H9Xdodzo5yjm93SBENFvNfdaneZElZ/OvEtADls31B9F24rH/OEJdFDbMFKk3MjOUKlHQ9IU3kEhDEoImfLoDSQOEZkY+pyFLMbXewhqC+tCfdIf0GXqLBIKjdwOLfOovkFkCTgk+60dAcYZqIyOx9ovHtk51uj7IVLga2NvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CMOZXcZeOHdUanGjtHqT1sysSaGUtHlaiMgxs7GSRs=;
 b=CQkwSkO2773n0H281mG4GbF0w+bfUwUD2PoXnxNpuZwvoFXAGA1M1q7jRJugXayL6Ie82RsZ4xpElREAeOf9bZ3v/Q+/LhB5eSfLn03atuiBi1H0E9JAFYUqw477YyGsv8/vDWvcjiPL7iNPScMkJbReZxhswhWlzJ8Gz9qkKM65M6dgBl1aw5iIeRqGqb23FXXkCC5y/gwJCDlsjE2bqVJjgun9Q5Mzrpkw7UQG/QGPRrsASoMFvfKoIEmTxORlRaWlfDqdH2S1m69bo6LtpAkO6UVeRz39EJkCn6hET7er+Zeleo69dRp8ZNNIf6HNx1/SgRzoylNFEFM8gbh06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CMOZXcZeOHdUanGjtHqT1sysSaGUtHlaiMgxs7GSRs=;
 b=UGFrmLwKz8o1Bzo9Yksv/EtGgqmYaEc+a5Kv3ma8ihYvdUmLuIe/fw3RroOWCCQxr5CH+X/ppXqaK0Rbe2R7TmgJknLj8HE23OO610UN4OWZZucgq7SI12OXNZOCa5N+0tesAdRQwN97MjTsdbA2PcpSSM/vALT8dv5I6O/Td8QL38u2Fn9snRFRZUr1702quk7jZARhriJWmLRJJ0Wx5jOVDr2QQ8H7/1CKRfixj8TjfkD3MYOoRS8B6BdTxgmbxqmLq7BgbHl2jg7n3tEccsrlQHsrCJXK1BkJNTz5DZgIdvfhD7M+4a5H5XXFYhPRjWeurUwuOsM0asdrwE5/8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:47 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:47 +0000
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
Subject: [PATCH v5 04/12] mfd: simple-mfd-i2c: keep compatible strings in alphabetical order
Date: Mon, 22 Sep 2025 17:24:19 +0300
Message-Id: <20250922142427.3310221-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f39f6b0-0c4b-47e1-7f1d-08ddf9e3c88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Jgzqh/CSIhXobSS/w/BSApShHg9enzinPf5k65lo//N3vnBY1gqN1/edAo4O?=
 =?us-ascii?Q?mTSK7GWiwgHn4Q1rlXfo5G7PAH/c61GPgAMxod0j7TBS9uxy+zm5kR3M4KO3?=
 =?us-ascii?Q?JlnFy5hs+SbhR4SHvzLTlltLZ8z0FI81GHSHFYpjt7m6tRq3rtnop7rTP8YX?=
 =?us-ascii?Q?/PBfEG09XNUzC0nC9OjCpKyAuk4T7/1Anvyqk6XqXkv3+D11o8B0i1sz97+e?=
 =?us-ascii?Q?RVJEJVHXB2f7vrm+yXVVgoH+Y3C9D/VEBQeYn6xcKXNVuFqkxV1XFssPTJos?=
 =?us-ascii?Q?w23XI30yOmrOPC171eK1rHJzZ2v2J4Din/VA/1gIrZ3GKk1+mpIn3d1WgPzg?=
 =?us-ascii?Q?Zq5vgmIlBj9c7RsTyHF9BTwK8UQRt1IgIHZkeUu6hefVHnS6yuu2qEnA/KYB?=
 =?us-ascii?Q?MoY5Kp/xvWla04H+wGmCQHxoa7B6qEpR/F/FJE0Kp2vnpLJYPhR5JaXR3c10?=
 =?us-ascii?Q?6oDhfyTZche2wq/io0LaU4q+baKyN5I37DSD1CZ8NT20ecuom+4gGxEkBE/1?=
 =?us-ascii?Q?y9ZT8Et2WKttE3jFhvxjtI1U9PIodcI8YsB6vn2ZTs9VoX/u9UYRrZaKUuz4?=
 =?us-ascii?Q?AeG/LdlU595mmevYFiWf+1VXTW3RXay1as/rb2uGlaiq763o33/HWz/tQk/t?=
 =?us-ascii?Q?8Gh480ZSD8sxvZgqh7Q4MGpgQ269YfFwFdhVuBOEIyxePo4bpITKbwdMrgd6?=
 =?us-ascii?Q?1na39uzi4tyAQ2ACPf6akZvTSfXBjZSHee3sCtED3J/+/enykbNiv8SuzZqr?=
 =?us-ascii?Q?D5w7CrpWS4GFTNj3AD+uDry6Pfts48wXc7AfnJhKcVcauK2PnOQAT27v9aup?=
 =?us-ascii?Q?yZEtQ9O7bMSSa8HD1LtAS1BUsype7aM4/CG7tZMHJykXRhoynr/krIAPg6Ie?=
 =?us-ascii?Q?a/OxbKjWS6q3IL1wh4siR/DVPaeCz01A6xpwM/sM3UrtyTNmdQS3cvPqRAqk?=
 =?us-ascii?Q?LLd0eQ3lGXYpZ0HZO+eiPpNk0I/y0+DyKNtDyys5cR7reSXj/x6NzaGwyA2S?=
 =?us-ascii?Q?YVgqxVzTXUDWQZlHvHHbjPmkf2PU1sbfvRHKDGLe0iBGmn2Iqb87QgldIOmp?=
 =?us-ascii?Q?7KYp9zV6w+vylsQoBsqYgYKEI3pz5OFw2ESTrEqVb3EfzIXFtm94SzFT/Ehm?=
 =?us-ascii?Q?AfJS7bpRL3aMReVfS0vyIAFvvCkxG7D9uzpYHC3SbntA7V+epc+fdAhoS1iF?=
 =?us-ascii?Q?HMueIDZ9h81tbzCSApRmjNrjbWOdytXX3eWZV9KVh7zzPk4cxgTOQ+Tcmmc3?=
 =?us-ascii?Q?JmG27/QMVh5tbbVWAQxW/i5Clz/YLGiJvMxVlXn8UFRT/Do466tV7RKgBASs?=
 =?us-ascii?Q?Tn/kya27R7upFpmQdvG/B6ZunSNxhL3qekzse8QLl94TamIMK7KgZqQ7w/MM?=
 =?us-ascii?Q?neT4+kmULqImVglmqj3/7kll0+WNug34kcEcmgHyANwO9ys4LBUv5Ls/+2lI?=
 =?us-ascii?Q?iTfB326GRMR3UPlVs8Hst5auw70BQsKfhM62dp9RXGk13cqATs4Bng=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?YNw5lp0qz3shCzUkMM0zqXhTmqFtrH69Po9zRsAOCixu+aVB4EiDdj7fdy84?=
 =?us-ascii?Q?kq/6oepW3k/0tNyvB2y4PyWFjIaVYu/oo+0UVeWnrpeih9kDyd4zauZ4flUQ?=
 =?us-ascii?Q?IyN2URz96MpPphcoAxkjI68ThjDIpwHFKK7AyWGG9YjsLGE8qPfJJ5nHZy8Q?=
 =?us-ascii?Q?yy84qxxgGB1UBavAxZNqm1k2ZO+hayDppIvzGzLHIXmS61X5D/1mvCVN543Q?=
 =?us-ascii?Q?7SZNt0jQSKPpyqz9IWSBmCqdfcl8LezEGe5oWmaxe83yrYBwkMp70H+BZbyQ?=
 =?us-ascii?Q?u8aXbX1lla96XZjDzZX2bar7euL6qIZ7UEO50qrxsPMP7wh90QqaOxk9GNn+?=
 =?us-ascii?Q?EEjHuAF++qTzeVDNKfAhemm5+Es1wbCBEo6ekuxKOKRgfnEfqHV3NyPb4g05?=
 =?us-ascii?Q?l5WmNoLQoPSCWeP4NT42wQupMVavOjQJDc4y3jZHo3ADGRFW7B9UBrJHApsi?=
 =?us-ascii?Q?okVWEQx+M0Eomyyw2Q3JDhEL+hlEhalwK0bbM9Sk7rZaWby6uaWMqUwBJrbS?=
 =?us-ascii?Q?oMuuRlpEqwtdeCZGDnLAUrhLXFaPxAyQYzqJYA8w9I8mALL6KiFAGe7mKYcf?=
 =?us-ascii?Q?PWXyBv9DAYQfmeLDbWSY8g/HkK9Bubw0sYRUJt5ilwctNqRH9ABeCEEQhMWZ?=
 =?us-ascii?Q?dl2+cbxj/xYEyt8ORSERvwCxlQai7ewehivAwJHkgqfE/9GRC9c/EZXW6/FV?=
 =?us-ascii?Q?vJadnYzQRi5t1GPHWeDnb6jN6pwSrqZVWvqx6WYYbzLUfVbrMv6TYgYO8IqE?=
 =?us-ascii?Q?l0WZjpLbwdiuknWwAgBhPKpn1UR2Qqa++q+HL5icWAAY1nqLJNUdK+xSbi44?=
 =?us-ascii?Q?Fm1UzBEEmGTmoxYl41T0NCP01YpcI6eReXJGF+uBwNk9R9QkYljTCyjZRAUy?=
 =?us-ascii?Q?9AUraUpwWwBadYM3+zDeTFa2ttAHee3VQRypd3E19L9KYALskMBBYXnGaj0+?=
 =?us-ascii?Q?Wb7NK/4hT0OKt6T8gP+vDRH+ZL+f+wrn0WumEd06RWLM21H9Xwk/qhbQD1g3?=
 =?us-ascii?Q?DZQN5xTmv29HlbWyj9CGfKMUQp16xj861BbXObZPunYZYevO3FK0t3KOAVD1?=
 =?us-ascii?Q?A5RPNcwCht5M6hchnHad517/+vFI8kJ9e1RGGb9QMq2SaeShm67UJg7Z/Bp3?=
 =?us-ascii?Q?obIU+2nP5NNesGER4EMa0nNvZM/GezCM7mABkXoc3ci8V6aQaNF5E66DwsJo?=
 =?us-ascii?Q?OoUnayO9u43fMlgrqMU2YTW/Q4IzIFNX7kRNL+vVwR5iXn/p3MWWWrfQ92AP?=
 =?us-ascii?Q?gliIglFaw4Y04qEGxkBjHw5qBoZujCh4zEx4gJrXgRfwFYPX7yAN7XEq5TeZ?=
 =?us-ascii?Q?ZfXfoJEwWElvqY56vOOqbRgaaHOU8nDihe74O2wjH4h/sIwIg7NIiYMFlVrO?=
 =?us-ascii?Q?o2U94ks9Q4uugrgqC+5LkAUqH9jNdNPXYGqwMbZokj6UkgyY1lrLM0hIBkVd?=
 =?us-ascii?Q?37mbeVoEdo2cruMn0tlc4fnTFD8f8Z9DXDvUVrrKueTz/mc9B9aXU5i5ZmsQ?=
 =?us-ascii?Q?PlAtPEyduVUFNJODT+MxPm2gXml2JXT90Xafe7o/WL96ztyBhfcFa0dGAj/W?=
 =?us-ascii?Q?AxhT2wtTvTSPkJinnGG/j1j4rFmau5bZmsMDIVAU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f39f6b0-0c4b-47e1-7f1d-08ddf9e3c88f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:47.5824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQ7k/DhnpIUrxA10B19mkVqKQTzW8Ln2Wu0AZa+S6KMz4ApgHfOYCp1fVQslFRVxiTR89pvtQGp9DVMRzgRscw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Reorder the of_device_id structures so that they are in alphabetical
order.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v4:
- new patch
Changes in v5:
- none

 drivers/mfd/simple-mfd-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 63ac26388860..0cca7a9044cd 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -110,13 +110,13 @@ static const struct simple_mfd_data spacemit_p1 = {
 };
 
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
+	{ .compatible = "fsl,ls1028aqds-fpga" },
+	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "kontron,sl28cpld" },
-	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
-	{ .compatible = "fsl,lx2160aqds-fpga" },
-	{ .compatible = "fsl,ls1028aqds-fpga" },
+	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
 	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
-- 
2.25.1



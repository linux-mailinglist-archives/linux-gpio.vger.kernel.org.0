Return-Path: <linux-gpio+bounces-26384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5CDB89AB2
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BADCD7B4DA5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFE6313271;
	Fri, 19 Sep 2025 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kgPgMMNb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27C231283B;
	Fri, 19 Sep 2025 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288389; cv=fail; b=GA+TDHb+GOm2hXXinDy4Wn+2kwe7DnOXBgDvJLTtNZas8fYb9KTFvDPlM5ruUwKk1FZhDzMyIC2fF0KHbVf2cxPvUvWlhlrvhaCybJnD5NxLDAZbQqklmqseS/Rg7liGBGzctk5zSxVBb3aqGOZZpptX3cmrrlFVBFY/ZfgiFnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288389; c=relaxed/simple;
	bh=g6uVbOv4pnnrjti39jLeYx2txeg76ngFC3XGK1/iYj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EauiTspoK17WCURefDgzhpJ9c/8MoukrHUqeQcZRhK5i5wSYzu0Ka7Gk87vMuzFwi7mS1t1HuruLncwUF4OCpWi6MQgeXrYokC1oFIyWqatZHfSamh1ZyDqTpvm21pfo078Io7MYg/LJFzKRc4BlD87b1ozuMAZIX8PMKBXyel8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kgPgMMNb; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOET1HmShv1JQXak0XprZQs2MIQTTIlddYQI92gtj//pCAp0I4MIu5d0wu61Rg1n4/7kg0wUvRaJ3L36hRk2XymSBQz7bDdFG5XT6N4KlS9ac9a0dO+Q42WyaY0M5FJIueApbJFvR7jpMbOykrTD6j/rq1AWjTbTvj3kvR2QWxGccWfYsH0viV3TF8EDpdfrm+k5dNMwye+xdijmoYxNTk9b8gyy3pReOAseJ4vJ01FVy53DIEe0gV3MCnBb6j0BSuxK1DjRD75Ga3T22w4DertxkpzSxJtPDtQ4Bz+L37o5STxP/uI5j+R7VKbS4RnD8ujFNv5jKlgwARH8R7sAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSufHCEju0Bhkvh2nLX3kZZC0XQ7kgrZ8Qseeq3ltFk=;
 b=cXbbXyjyUAoSBVGhckOJRQ1r4Y7Oe2rSN/itPnbqzxwO1wx2KvCuj1d50LUpTrw2v0RE9Yqx/V90bhUGOx7DmdMgXRLU9QvKBixwZgJhTMedD/mbfH6MuoK6FK5JLU/qBv/ayCl7sOSfx7yc05KlrOLR/dzmh6Omsa5zF6w/ZIX9KIg/vPtwEJpSMrDWHq7YkefzMYHQWwh0HZwwUuLWbnNatUbb6lUxtcMXjkzTmRnfkiLGDgsdKA9UJh6k2duns3q4hcqaEbUNCmPdPda1CUZ31JbmI2z59fEjHggmQzT02C598PWloyYfMshIpVTLw2UOMIztoSruAM20iiL4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSufHCEju0Bhkvh2nLX3kZZC0XQ7kgrZ8Qseeq3ltFk=;
 b=kgPgMMNbWEyT+k5/mDuqzf5ToxSBw/LM8ocGVS8mqj6W4JMlRdLnbJpFbdDjcbhE+aGU7thx4tciWJueeJh/ZQS6JMo4OGTDDLaq8AVtR1IvBaYJKRF+O4q10KV6LsWWqA8DKrEREWyTFtrGvHn0dtxFh4eBk6ds+PUX88sHY9MLHR4L1Mp5XftAme53xFlEvWMHDXHwvDv//31V+QFB4ZwcrlUMLD+OEuRpLiK1WGmrjH4JQ4RH/q1uOoXAt+GjFFab3egY9kqrnUgsldGIlBAJGkzvD5P7+sadaZ8CPVelUWzGigs0krTvOhNp65OtdRl2N1+1ttHhP4fHeWotMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:16 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:15 +0000
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
Subject: [PATCH v4 06/11] gpio: regmap: add the .fixed_direction_output configuration parameter
Date: Fri, 19 Sep 2025 16:25:10 +0300
Message-Id: <20250919132515.1895640-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0052.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::21) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: c07a785d-65a8-4ae8-d061-08ddf7801bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L0sOm0ASZO06Daqug1Wv0oGVJiZS76MOPIlQiOQIcSY2YR+kpwBFjzZ0RkNC?=
 =?us-ascii?Q?FCRmUpIADfzc712kZ9PBnH8WZXWQ8hiEB5/NJ/ALa8nEU/XeG4jRV/s/grPq?=
 =?us-ascii?Q?ETvmFf+RBXxtDt9UTHnJanrYb/6SfB8LMp4Nyusu5qG96IdT4Nf02PsXTLyv?=
 =?us-ascii?Q?e0VpzkYf32+nmxx0wT6umWQTTxiiN+5JDjvfTC3hWIxoRNIRty6ml/OAS+bC?=
 =?us-ascii?Q?X+5qmnOuwkSUfVumOWz2SwRDZHXp37Q7XgBrtN5spOsl1ei1j/UBDedN6DML?=
 =?us-ascii?Q?KZw2Phivj32djGUI6D+JtWec/uLADoo7ABielQrupRv/TIO4+Cq26X+Jg+ob?=
 =?us-ascii?Q?WLvPXt5OwLctYmKa0g5ourJzFkQBYSC+o8UDfWSMy/4VE8GX15qcF8S6jheO?=
 =?us-ascii?Q?4NcdzYmsR7OL08x0zLkVUTaLWJbzimR7kVCpwV5+dh8uBVtknNpvQSChwwb4?=
 =?us-ascii?Q?AS2WnM7ieL8lvbOecmNhAL+3B/R1UlzU2Jlxcjw3M5RDuOGDp1q/LI/A3+73?=
 =?us-ascii?Q?2bLn46HoyemL4RSqoW8/AAZPVJXcdvEh4rrF0McSzjp8dcha7rgcWfo1y8aF?=
 =?us-ascii?Q?2ySkwXqOi2wqyJpoOA4F/GybnCoy5qSr1uH7EcYfx7TI84DY0I4qP7RVk9pf?=
 =?us-ascii?Q?9wQ7Ohqk1/QVfA7rleBi90J5ezYxuG4JVQgu5oHKULLpDYQQjPJhuP4bHTSL?=
 =?us-ascii?Q?EvyLlSplXgC5fFewrRkZXWJNtblCSRm005RCn6VP6tqgVIwqNUlu1K74W5jz?=
 =?us-ascii?Q?9jGu+dGunWqFRabmAGrmS7dfF3W/5DJg7fv8md/dDDEgXga9znZYtOmQ4HqQ?=
 =?us-ascii?Q?wvyoBkFLReVTsqp1Yl4Wwf/Viq4+UAMegYmfienuKFOOjF+QT1ZeA+mPHEdV?=
 =?us-ascii?Q?Iphj+piUKW/lRiECXbTtU75Heeebw0VqQhyPDJFAT+4+b4yHud92lp0al4Pb?=
 =?us-ascii?Q?3MvB7dG+OJw9N0NkGX1Hzk+2m48IdNLd/vp0GDOWWQuVZMC5wKQZr+MAG3Ax?=
 =?us-ascii?Q?YD1re0W2ZtNOE+3cVTSFnuU2rPlqYo0VcKU/cE3fqCEBzlI3gh1K6ZanLKti?=
 =?us-ascii?Q?nCcrLG8iLeoZsebUcOZ6M5kL0vt0xlScWzl9PQISu5+PsZ44WE9h2tSFwyBl?=
 =?us-ascii?Q?Hm30uVD3Q3l5OJYcUQ5JqKMMaKPsxoY9wFMtYQMctRkCl64fgBhcktk69SLV?=
 =?us-ascii?Q?5KiFnfcKz/LlQ392LGrkM9+jzYqiTpMetrlxUYH44s5bk0h2vTgPUddKoqhs?=
 =?us-ascii?Q?OiIeOa0P2E3HtY4hdiVzr9DaSjjWvfXR7bW6KiJQvQ3+i6D3OHceRVJrj6jg?=
 =?us-ascii?Q?EAlE2oocp71xmxrWYm9k5sV3J1Q1PnzP5OOpL575LdOb8ZZAPWrNbWORiRcy?=
 =?us-ascii?Q?WogNHK9w7frqKfJLuXTaH0nuZkgZ50+rjXCSD1YmZe4oS+Q9B4O48uk5ONkY?=
 =?us-ascii?Q?7tv7mGhe+8eMF+yrHqiXUC/YTyzJalZbjxnJesieZOMvQGQhYda1Ow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GpkSQrT8UN+vPVXFRHt8EuONIx8yvuFFvlC/byWhYXgIM2NAXJrI5fwPz7id?=
 =?us-ascii?Q?mh+MZEMdvkRYe8hAbYv26EJXqz+LZYwBf5h1Rr2GBSbve9c0cdGALIYmtt7o?=
 =?us-ascii?Q?50+j3mz7zIGhHWyZZU1DVzWuldCVMxAAgYsaXvZvPCOnqBVUck88n0Y7qgts?=
 =?us-ascii?Q?NWVCu4c74Duu3XykuqUs6BISUDIIorKz9rIYC4cinR1XN/UFz2S8Xh21uXU6?=
 =?us-ascii?Q?kMPabJqBPILbW/4pXdKvi5R1WNpHz6BDLPwI1Wex1fvmt0+E581Q7CTltKKX?=
 =?us-ascii?Q?98BjK8QvdFhUvcgRnlRFwZfnr7ErEbst3xhAGKcsO1jPQsw0n0mc7/pBu3Vu?=
 =?us-ascii?Q?+8cF3ZuD8ViLKlGdUUsnAk02/Mmm4Aaq6fYzd5jCztKj6lU9AhBCHvcLDZjW?=
 =?us-ascii?Q?tQJOYHfd8CTp6LuQ0IqGkZyDJpLQf1byn1AMmWgzJIOp9UD82pthw1k7SpCu?=
 =?us-ascii?Q?S1nBe3WpWMxEASQdiRUUWli2xQlIz5s9GKefyam2YxZMf7cEigGHtAplAzze?=
 =?us-ascii?Q?vWKOQWVMiZ8yXXGU2kzZaxXsQNp948utaU+Lpn8hPY5BTCyptEVjib1U2Xb0?=
 =?us-ascii?Q?weC+2zlJzUv/w+Y1kSVJTkp7kJOJV7fkbg6GZKA5iMZ1p732NbY5WiekO7N7?=
 =?us-ascii?Q?keqiJVdXXvJrf0eod9QcKRJzy6CIoti9rlj1ybUJlGHMQNriz5MnW/Huvkpt?=
 =?us-ascii?Q?HqzM0wluhP2lIb9RUgdKZAo7w8htkgNmd4XF6KP1J+7P95wepWpDq55F0VGY?=
 =?us-ascii?Q?7FfMM8UdFhnFFW+gpZQ/gAJ6xCnSGCkeErdaRVFcRJET6rgmPi1JqihdO8dE?=
 =?us-ascii?Q?GjIwE6nmBxcuJxPpiA4/X98CituXU/E/NRrw4yCjkMHhRWyp4xhGoWL14TFf?=
 =?us-ascii?Q?ys47ZvSj2hEJBv4ttglY3trCXalUd9w42lx+TOPXy+WeM4mdfpsqkzT9hLFb?=
 =?us-ascii?Q?h33yJG3v3+SFeD07tKfIIoYefwLQELqb8AnDhLzY7z9MbfaseF04wpNHxvNz?=
 =?us-ascii?Q?SUOun8vNqGO9gIBA6rkJ2jAmp1+UNeZjZWnCP0RpGVPAlKYhOJYym74DWW1q?=
 =?us-ascii?Q?8DkN6ZfSQekQnwDm+3wHFCk/fKkxIBHoUigU8zZUozVo9LwcOZLUQkg3vLrs?=
 =?us-ascii?Q?frdIwR6WRtV5rueaxr4flIGXgoH3cU9uKcXm9ouaM9yczHKGxJ4ZkfUEYrvc?=
 =?us-ascii?Q?/PaYJlAalF7b1IytR1oyHImiUETwVLt6rfmAavEKSnxLk5H7Ct4Wh8u56yNL?=
 =?us-ascii?Q?r+dMfK7uhBl6j11Ga5NFlsVVGjsZVJ4kTTCDSnc6oYyiMiWgkvLOZU7TVFfN?=
 =?us-ascii?Q?k/vizilQkjTxtfgicvRlffuVAJV6LPNagsJb5cejHv7EfmFw/2ASabGQ5PiU?=
 =?us-ascii?Q?ec4bfYw4SdZcXclF9dNJq1Gdx+S2o3N9GJ6khADm7RRNKYp2/eTkFsBZSDn4?=
 =?us-ascii?Q?gyn9vj6PZ4g8acy4KlkH0of/vyj/r9ay8AUYp/PA3zrqNUY3L4foWw8klC5z?=
 =?us-ascii?Q?6axmpZLdsylHDfkRIX75HCsn2aO/xYFfB5Se6UbibZ/Zjxq/guixNEEuQS9R?=
 =?us-ascii?Q?DNo9+93CDZeg1C2cx9n/Dj+CEZp7dpndh0yaK12Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07a785d-65a8-4ae8-d061-08ddf7801bf2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:15.4785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyUug1Zh9fX8VKsRwgl59NGBgSbw8hz3hCHsus25xY9B3QpIN5t7yXojIPFWXgq0Xo7N/fwxL6rxfNKSZthIag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

There are GPIO controllers such as the one present in the LX2160ARDB
QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
together in a single register. This cannot be modeled using the
gpio-regmap as-is since there is no way to present the true direction of
a GPIO line.

In order to make this use case possible, add a new configuration
parameter - fixed_direction_output - into the gpio_regmap_config
structure. This will enable user drivers to provide a bitmap that
represents the fixed direction of the GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Add the fixed_direction_output bitmap to the gpio_regmap_config
Changes in v3:
- Make a deep copy of the new bitmap.
- Remove the offset check against the ngpio.
- Added documentation for the new config field.
Changes in v4:
- Replace devres bitmap allocation with bitmap_alloc() and
  bitmap_free().

 drivers/gpio/gpio-regmap.c  | 24 +++++++++++++++++++++++-
 include/linux/gpio/regmap.h |  6 ++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index e8a32dfebdcb..eaffd76adc56 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned long *fixed_direction_output;
 
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
@@ -129,6 +130,13 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
+	if (gpio->fixed_direction_output) {
+		if (test_bit(offset, gpio->fixed_direction_output))
+			return GPIO_LINE_DIRECTION_OUT;
+		else
+			return GPIO_LINE_DIRECTION_IN;
+	}
+
 	if (gpio->reg_dat_base && !gpio->reg_set_base)
 		return GPIO_LINE_DIRECTION_IN;
 	if (gpio->reg_set_base && !gpio->reg_dat_base)
@@ -277,6 +285,17 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			return ERR_PTR(ret);
 	}
 
+	if (config->fixed_direction_output) {
+		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
+							    GFP_KERNEL);
+		if (!gpio->fixed_direction_output) {
+			ret = -ENOMEM;
+			goto err_free_gpio;
+		}
+		bitmap_copy(gpio->fixed_direction_output,
+			    config->fixed_direction_output, chip->ngpio);
+	}
+
 	/* if not set, assume there is only one register */
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
@@ -293,7 +312,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	ret = gpiochip_add_data(chip, gpio);
 	if (ret < 0)
-		goto err_free_gpio;
+		goto err_free_bitmap;
 
 	if (config->irq_domain) {
 		ret = gpiochip_irqchip_add_domain(chip, config->irq_domain);
@@ -305,6 +324,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 err_remove_gpiochip:
 	gpiochip_remove(chip);
+err_free_bitmap:
+	bitmap_free(gpio->fixed_direction_output);
 err_free_gpio:
 	kfree(gpio);
 	return ERR_PTR(ret);
@@ -318,6 +339,7 @@ EXPORT_SYMBOL_GPL(gpio_regmap_register);
 void gpio_regmap_unregister(struct gpio_regmap *gpio)
 {
 	gpiochip_remove(&gpio->gpio_chip);
+	bitmap_free(gpio->fixed_direction_output);
 	kfree(gpio);
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index c722c67668c6..8d3d595bfdd3 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -37,6 +37,10 @@ struct regmap;
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
  *			is used.
+ * @fixed_direction_output:
+ *			(Optional) Bitmap representing the fixed direction of
+ *			the GPIO lines. Useful when there are GPIO lines with a
+ *			fixed direction mixed together in the same register.
  * @drvdata:		(Optional) Pointer to driver specific data which is
  *			not used by gpio-remap but is provided "as is" to the
  *			driver callback(s).
@@ -78,6 +82,8 @@ struct gpio_regmap_config {
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
 
+	unsigned long *fixed_direction_output;
+
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
-- 
2.25.1



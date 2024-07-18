Return-Path: <linux-gpio+bounces-8257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC6B934659
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 04:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61B1D1F226DC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 02:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38F62CCC2;
	Thu, 18 Jul 2024 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YlJxWJ5f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2060.outbound.protection.outlook.com [40.92.43.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551D27462;
	Thu, 18 Jul 2024 02:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.43.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721269459; cv=fail; b=Ij9DK2koVJnH0btmGnXP/Wn01UbxzaBXMyFm0aXVhzvYbodcIWwVHouXjZyfrVncru5U+xmuI+cb6noL4cq9+HPHRXjbm3+av57XRE3p0wjIcG5LPQ5OiDNeUbYRO7TrjAJWYpHwvosT4doWgMMQbF3Un8dHytATrVApxzlx0cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721269459; c=relaxed/simple;
	bh=V7f0DqK0t0X6oOG91tQoYHWApmWI6VaQhFf6pd2fkdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rrKV3emu32u3xYpuEC1dsX4cJSpxSEaOXonl4KV9D7RR5mWUxukOVVTiHYKM1cKy1mc8+zMNvHdx85FPdrgeg9lI7Hw497E4/mzwIICcTKblBWSfeyGV+UnyxzVWQRU1Udfi7Ej8VHUNa297qw2o3GGLG4uXPvw2fw2QbJWswLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YlJxWJ5f; arc=fail smtp.client-ip=40.92.43.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhLXNngPSBdq94aLup9NY0ohyC9jDwoS90wfW+pTt63939mzaCiW30asc89JlqX/lY4s1X8wyqLV49JKK//V+JH4zFG+pxBBXsNAcFRAt8NVpNl4wpwR7FmoWLyogKpAppYXztTU4l+GJk3VEi8FWkEW3ydXudxal97Q6EYQNunhEWl+/LWkcjTADabgEMjMh4yuzmugE62W0fNHu/kKmqWIxswPRFtf4ntxrvqdKrKeEYn4FpU+iUBlIL09xUxnep6KKu0h/kl74eyP4qkJZl/vPlhttjZs+A6qUHAdJg6I5irb7Nt/t3KRhmR7Stk71l4Or3MO01rxhfYlgGgKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABMdMoeO9zFNCTcYRTnypBTZR/8icuipiBZS3j8uw80=;
 b=rkWHWRRSXlIuTFs71v+XqQ4tdq7BnnNJUEe7wnhKdtfb0DMULgo6CJhR128lr43Ja7jiiO7JMA17lUD2xNZf6CJ/bfTLUWoaISWhHzdDBlAJrz+AHLhw7nMII0HM0STwfFWIUVQ2z5hD9zuNLg/zaSsumbEX3mWiu3lTMX7QYKbsUF7n+rgFSB+BXKGuMJQlmjEAe/cM1jQr10snEFMgGyC9vEHzVFeGIfEF3q22TjdnwqQ5R5eSldyILtkH9mVPZFtxTpY4OyTU0S4TCrVJQH9ojAqNapnb/hvx3s3ypRdokAcvRXIPKROaTne6IBypzwuZsQ73ioE+Qo/ck7sjMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABMdMoeO9zFNCTcYRTnypBTZR/8icuipiBZS3j8uw80=;
 b=YlJxWJ5fzx36NxFkvN4OCPlwHscgLenfnXUKPN8Rx9L0lkmBh8RemZQListSdaswSioxgTsmjJg9MzV4husoqYj8gWUcwNNQTKxzW4F52rMIxkwQQuxtqIU4QrNjUYENHCII+gsArBElpoIiixIL2+bQ76uaitCZ2tdtiokslxkLDtflr7Us3Yuu7jcFxnnJ5AxM8ivPjwJETK1O2t6arfAfEJABwuuxFNe423m8bi+5fTiJ5gUT0Gjdw/9ssg3ArI9pxCZ2qV4E5CDe+p1S6HowlU5BegFh31hOFtR14MGStIpiND5nhqE/GjG9IP8nSGuh76Hv+P3A1kHlUEidxw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB6786.namprd20.prod.outlook.com (2603:10b6:8:e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 18 Jul
 2024 02:24:15 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 02:24:15 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: pinconf-generic: Add support for "input-schmitt-microvolt" property
Date: Thu, 18 Jul 2024 10:23:54 +0800
Message-ID:
 <IA1PR20MB4953806785BA04E075DC4F03BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB495346246245074234D337A6BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495346246245074234D337A6BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [VmFy0i9iUZguHI5Nk2cqxyf8zuideQYwyrXPQ48yHsI=]
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240718022355.743921-2-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c301ee-4dc5-45d9-e3eb-08dca6d0b83f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	YFyKNxD0WF1DsXjt3eg8tCW3kBqXGkXwBt3SvqvubbLfZS9aFsFUdoLIYc0ScVgudjAA5ENaZEPlogZ7uwHu+wvXOmSH6ueg+UQTIS5FjKal0wzmX1q/uuhK7YhoDqGkz9wdq+EH+BbmHqjy2xp4DA1Pfcdb++794W94h+9Cx64hDu6UIQmwr8909raBlnKyfgciXwL+sz8VhsoPuHHzwTuMkY3hZTWuB5tQ5enrRS9VlMkFQlsnqszdhBODo4jXTl/MGa/TQaKdcH8OMzpAZfiyL+gf9g82IAetWSjlK7rQPb2g/HlXLvWbPOlq7U4eRs5a+6z1462xPTIufccux/uaVXk1dpE0khsaOP3CA97Asl/AspuW2mw8LISK/6BYWZiU1jIIgDP2amc0rnrFfD7gzTUlnG7soVH8I3gI6Ix2k3kkDK169cL6RGDUuSEHPywP5tw40L4IddDv9E+wwD2YQ0WXi1GU240eI7eKxLWJE9SQQxlz118jBAedlWj4aEMJt/9fvdKD8aJ1XqI+2SondOrufJEgRDDuqzQ5wo6nGNjs52mDf1P7NvVKVqhzJdVq2cOp6c+rAOs6jWmIWwXJZ3KbuxKr8L8D2pEJYFn8Rejajh2mBzRWoRqz294RhUFgGfoqiua6ACrwV5W/rSNbdjEtFM1StsC7GZ3ei2c=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sZZW22CvkNlXnt7lTRQvPaKtVeBlXuRtw/mk6IFmsI63I3y6//WFryP0IDhS?=
 =?us-ascii?Q?YvqdpQ/eUeqKr+OtX+151+bfj+X63a0ASiDtkjKZTuchsApZ8n5+vxyaEFiD?=
 =?us-ascii?Q?dIWqfCqxUCCCjtPWtZ1BEiGNqFumEtTr4JOkduCI9imQTpcH3f8hMy2t8klB?=
 =?us-ascii?Q?CiTbtB7bO5Cy0qi+8ISxeRXO9LG9OnEXVufghGBpgaDbC45/bbPQERYNxPks?=
 =?us-ascii?Q?8Mq7zJ4LVHXoVluIUI9ZNBG22sLl5yDvpnlrIHDXCj+VOp76HzMWA0GOI9M2?=
 =?us-ascii?Q?pIEYHubDJNJtrfTmRO8JKqdbNns7PK/eBrIiobdV+itzGAAXl3WIAXBVDM4j?=
 =?us-ascii?Q?w4NG/cLM4ON9l1lee4HyFndnhQ6qFvEG10D2HxmnzJnVuGbAnD7iNv4fqVES?=
 =?us-ascii?Q?BrCYp056E7S8y2VgIBGeIVU5xeqiCb5gsolIdTxAb+EWWDFRt6rlui1/DijX?=
 =?us-ascii?Q?s+glji7ATTuSlBLhUbmoPC1Qjm7Go+cSiinZwfuR3Kz3DWlShmuVtkI6HOIi?=
 =?us-ascii?Q?xDmWwmWwSiMoIawcZhEEGC3FDxp8RhJ9kCYO7MUn3D114A5IM5cOLG0T5pKY?=
 =?us-ascii?Q?oE6hgtAtuz6uQNSWzSuytj23P2FXcvkU6DokBwD8SmMW9A5ERr/bGTpYNlmW?=
 =?us-ascii?Q?BGdJKcS/khquzOISRW//DsQAAwIrDkZN94mpebdccBiD0bOn1Cc/Q7nLN9cq?=
 =?us-ascii?Q?3nkP6/fjaqn/hAXl2snWk8dS0GC6JBzGQfdyVstVVgLM6vUvlAWFnCR/c5eP?=
 =?us-ascii?Q?HApI5aFzCpfmzZPxX+fNEFxF6GDt7Hsxb1clISl6CxERQ4+2ErP9gVpS3dOs?=
 =?us-ascii?Q?G9ZizWCZXKZOcm2DKjoRXZTDM/n3HRU2ojvuCwN2xPSUYUQhD9mKjzb4PNcx?=
 =?us-ascii?Q?GF8p1tkXMrBhZ45m312a6/pflMmlPfD6Ic89KGqv0HhA70GPgGUkkq8hlNjT?=
 =?us-ascii?Q?euQv/PL6i8FP1nQjdxrx/UzdY0krRkxZ0sgggnhiTZ6Y8cf2VS3IlUdBO684?=
 =?us-ascii?Q?ul+e8cAQUqm61XbpmKLiIEMloJohz5eMNqHYdZm02kp3MAvhrNpoibmhHHUY?=
 =?us-ascii?Q?VD07tqoqPpUWRwQJwf7dfRdPOHOKsky22UvBNhWt5QUbGwnq6LQyvfGNc579?=
 =?us-ascii?Q?/LOrFIowR7Tj1/xmFxmmHytboy4fs5qR8PDnIB9J00x5AcpDO+iDGoki9Fd1?=
 =?us-ascii?Q?HcEyWEY4lPUUPT1j1C3Fx2+pNuObbfwuF915I8S6jNVZYyQhWmwSVsSWgki8?=
 =?us-ascii?Q?zI+SZm9fnXgwghBtmVXy?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c301ee-4dc5-45d9-e3eb-08dca6d0b83f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 02:24:15.8014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB6786

Add "input-schmitt-microvolt" property to generic options used for DT
parsing files. This enables drivers, which use generic pin configurations,
to get the value passed to this property.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 80de389199bd..b9860fd31cbf 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -44,6 +44,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
+	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_UV, "input schmitt threshold", "uV", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_ENABLE, "input schmitt enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_MODE_LOW_POWER, "pin low power", "mode", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
@@ -177,6 +178,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
 	{ "input-schmitt-disable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 0 },
 	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
+	{ "input-schmitt-microvolts", PIN_CONFIG_INPUT_SCHMITT_UV, 0 },
 	{ "low-power-disable", PIN_CONFIG_MODE_LOW_POWER, 0 },
 	{ "low-power-enable", PIN_CONFIG_MODE_LOW_POWER, 1 },
 	{ "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index a65d3d078e58..53cfde98433d 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -81,6 +81,8 @@ struct pinctrl_map;
  * @PIN_CONFIG_INPUT_SCHMITT_ENABLE: control schmitt-trigger mode on the pin.
  *      If the argument != 0, schmitt-trigger mode is enabled. If it's 0,
  *      schmitt-trigger mode is disabled.
+ * @PIN_CONFIG_INPUT_SCHMITT_UV: this will configure an input pin to run in
+ *	schmitt-trigger mode. The argument is in uV.
  * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -132,6 +134,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
+	PIN_CONFIG_INPUT_SCHMITT_UV,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_OUTPUT,
--
2.45.2



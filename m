Return-Path: <linux-gpio+bounces-7693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664B91753E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 02:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74A15B222FD
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 00:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34F56125;
	Wed, 26 Jun 2024 00:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Qyt6v+Ri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2046.outbound.protection.outlook.com [40.92.98.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0AE2579;
	Wed, 26 Jun 2024 00:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.98.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719362160; cv=fail; b=Xb/l2XiLNxB2O07wUxCo4hvENklG/2RcOdUi7jlewHqEwLWiW6vm33CVjFAZlSz8cSr4/A2srsEImDl9KL2GOgZ3oXc0V7kWa3QG9bG7RDq/yj3qIvM4MHeGq1TDPWXk6xGd4vPRjANBMYy1lKielkz+My7Mt7l5sONACdTZkWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719362160; c=relaxed/simple;
	bh=YsoQQXGjap3BeAc1GALSODLlfLYOeeIwvthnBW5crgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XEAHTgzTizk8R+gplY+xffHec0KdQ3qGL5PlFCf6dq+l05VZ9+DxZtngmpDm5+0YdJooNp70w7XjaTSScpqtglsbyaWWU23CPCJEv/MagA9P3NTKUKPWxRNx1vwJ2ApOYMvJQH6oTmh5Cmw3NIh8V2ujrQn/xpb/w/Azw8lDU5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Qyt6v+Ri; arc=fail smtp.client-ip=40.92.98.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHdGA3SIkUoFsHRHoyIYbCHdD3AiRHhGIIFiTHK3J+dzT9ibuKCGsJymUJlLslQCfS42L9SeRwXvzCJyCgTYrLv08LJ6rIQga2kA6jyvB0lLhxtTabZGvQaRamgid25Ra9/qNWV/oC7b8f0Brw/1ZW5piohjUtk0cUzRp/CzlgPF9GAArWwWGqSrDc+NQoCcboj3KUaURYV1Y/oA/0RxZGslDlsBLPHoIH84fnlxrIBTUnVivJyFFZZRHr03U/UNFapEeomZFyHfvxPWm3ZpvYaiAwfSd1Zboj0Bwnk8VQTZcfGpGatfs8wutvD/5Bo0WR7MMtHrvlX5q2TqMR7aMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmELfAXwn67uWPkJ4w8b29mdh8txDgvmlsuwXV2eojs=;
 b=Ct/vbp/XRtR6uf+VIT1v8cY5U52oToCGSG0Hxzyvas9qdWDLc0/H4nkKHoE//Q6JtuRVIoEBFpKZ0P9+W4fFTVUoHKJbRwrjO9rC6I5UKIEVOQgWVCZxD36lC1iTUsiVugHAk8xCDTAyouFLKp8QwI3IJb8BkDywvKk2tQU7mpwPX7sHEnUs06dA3aulpRrddHQ51Dv7kHd1XczSuG5mI+ZIZxiBcop+1lk9YIO4XtqogzHKaPjhILAsCl8GGCXQWrHD/VkTy/VrqZ+8MukIsK1qSXDCqAPEhm6Klv7D7EmeDFNHk5ItSblDdG0UgD0ETesBxrWXFSxa/DpXIgj/nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmELfAXwn67uWPkJ4w8b29mdh8txDgvmlsuwXV2eojs=;
 b=Qyt6v+RiAw510qH0lCwAhd/rtpl31Kt/bhDRwUQDrG/Xuglqe4K/64lU1ohHvPG1kysnO78mfL/T8APl1eeBSUS6UxBmEE3fm8ZKs7njKBszJ0sgO0pbS5uEfwJus/2bkz/wewhpKGtG8ad+DfmvS6XKn/tKJSZQxAFr2Q6IuScwrUlWUFU1plt+g22OEeaXZO9tdqd8kfD2bTQoc7RbQfwnFzZlY4BPFvf1Rt9pG7gspO9klQAfHYDltaaW3+dGsAvM+YvDu7CK9hSAlqORWDyxXRTM9nrojakjsQ/r+AA7/hrS4FpXJ8bSd7lpRgp2MqK+UI9zoABkAgmj5ZErfA==
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8) by
 OS9P286MB4274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2c3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Wed, 26 Jun 2024 00:35:55 +0000
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c]) by TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 00:35:55 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-gpio@vger.kernel.org
Cc: Alban Bedel <albeu@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>,
	Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH v2] gpio: ath79: convert to dynamic GPIO base allocation
Date: Wed, 26 Jun 2024 08:33:18 +0800
Message-ID:
 <TYCP286MB089598EA71E964BD8AB9EFD3BCD62@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [aZdvS82pP6RggKQCL++PHGt8DjGTRX4t]
X-ClientProxiedBy: TYAPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:404::21)
 To TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8)
X-Microsoft-Original-Message-ID:
 <20240626003318.2873-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB0895:EE_|OS9P286MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c24dab-4da9-4b2e-a606-08dc9577f04c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199026|1602099010|4302099011|3412199023|440099026|1710799026;
X-Microsoft-Antispam-Message-Info:
	c8Dvg/EP6teDgtN8EY4qhsan7hvHUriWV2p6YxzheLCYEAx2yiAH2Y1+7QM7Tr5wS4LVC/WqJcFn4Y6zBTCI3Zoo+20Em1iBufH+LtbjD5Hmk/Y5Gi3c1nHTbIkJEE3LhLUJtcfJ4k1xKLn2d5Nm78YEbLS8HS5v+1QoAc/LfY9DeFqAq7wx5LqhQor911bK7PQw1YIrKNhUGoQyb/hI53dGmPhBFNAwhJcGDYARrvc3fvAXUtq/s1drOUrJec/ba4KsGqxaCx63YevxZ3HegK5A4+28NakDS6MKc9sxnkUp1YKtIMOut60oHuupOwE6TFKYzGKwyqZUGA+2JBvauXEejnRxvQthIHMStkhqHfkzooCvvG8F8ro28sKdUq8hPIo96OzctAf+rmDxtE+O4kef9ZKMNbZ9T1pLLp2n8Uo2rzJBVEY2akbVqyrf+okz1zf9MbpkPJPWqdEGASSdPro37B+ZyO2ji9ioClz3v0A1tx2nOKNbMbQqO48b9WFomslaJGg9+QbIsOqNkYbOnVPvovapfR3IDNsSvzJOgVOkZz+MqP1LYorzhevWGI+l22LP8r9CmAnTYHg+ROmCitEQcq6U2/drGx53eM+qTwBfKLek3FPdVFk3JOOs6tDkN6HI0p4HTrMBUueMB95qd1geqWFh2KzH3zUsCpo5ioLAO+QAjlRShn7Jay47DaQWl+DtxOf7PVlG+dmHOc9Jh2pTzEn9LjtHqeWu7CfzWqk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b3vbX/Xw+O8rgK9c23DTAkDhBVrMXiTHZffCOUDqtD7ksOGMcWtSFb5efOYH?=
 =?us-ascii?Q?973T5UT9Gi16nRYmetu2uS/EraImRJ4Xvw3vpJHFABBuzdZRITFN885nKgyO?=
 =?us-ascii?Q?12j86HN5UD2BqvXFeTwlCyp/Wf1q6TcDwIw93KpYePmxq+Ptp876sgBvf2cL?=
 =?us-ascii?Q?4QdG+ZIjUmRjwCouRK1DST1BJTlgtdr98aE7tVKORbsfiTPuCJf0V+1R4G+J?=
 =?us-ascii?Q?c93KLif88R5zYNQz+mSEsQpmtWgVaaGjRRQOP+J40YCPOv6RdX4e6WsUP58H?=
 =?us-ascii?Q?TsXwCGh8R/HyXxlOBJz8YdccBszi40WTj21qLrpnbWZBjZRypmda/OSvuC8I?=
 =?us-ascii?Q?OZ/rhb+taKBYjcTn9JSRd56HBLTTQmRAjmIR9yvxtjL/eDtEGkK/xZOkhUV7?=
 =?us-ascii?Q?xH2N9AZsUD15s4WVukVUyDHCtE/ShQSJ8tCLpsbmVXDI09Ftl6C0BpQL2S49?=
 =?us-ascii?Q?9WCKNV/sAcU/SmjQ31w2ubua6m80aA1m7xqG8uk/EXc2OBZBGVlgA6HRl8oc?=
 =?us-ascii?Q?L+nlEJyY9cE55Nmh39CDCLKBulG+YBmSQ3DbdNxQ2Bv0O/d0Yx9Yb292jmId?=
 =?us-ascii?Q?/oKJ0/FPtRBHXvwQ5D+nWRbI9nfF+cPE5j8ZHxYrfGvUXaHYnLIf+UxuHwiC?=
 =?us-ascii?Q?SKA0o4OMID3VJ5jOO0QzmWXl28EFkl5GjbClj6sIh+wiQBlFJ4/B013AyM0F?=
 =?us-ascii?Q?PxZTpG2/qky1h2aU5hhaiXPQTOk4paTqlioNkzUrFhiRxyofEDIgPPzOybFd?=
 =?us-ascii?Q?as+53SzgDOE1vTrU6zGDxeF0omLaak6C4+edrKz5ssVdC29ANPrIG5Ldpn1h?=
 =?us-ascii?Q?xvTbzXPhUO5n7DUetP9gcwOxkWS7e2wE6Sk74tVPnn3g8CscQTOrNDwXXwX7?=
 =?us-ascii?Q?68o+osNnWj2Rzjr6ATO5NW5CX6GVQEJgMsov8bGUDLs7w3uVDLMLj5V8Zd+k?=
 =?us-ascii?Q?J9AObP1GpsX5a/M+ebzX4cdjv1nZ0Bh7uDOqS3KpIr5/TbdI6XSLTop7KwFR?=
 =?us-ascii?Q?7uQhXRXMmx68EP6gj0x2XqtMyoqN5wrw+HccaN27HXlNGOfi1d5z7vETEGki?=
 =?us-ascii?Q?k0XfWs3Un8z2bN+keyH/x1eThhNUmvPjWO2N+gV4NTFMF17exNEFakAubhRe?=
 =?us-ascii?Q?bmbqhfGT6xuV7nNZBvMfaTOcom/DQ6QvoBd56Rup1j28qWd1zAT7kYWUs9Bu?=
 =?us-ascii?Q?PsK0EZuK7XA0PPIOZIVlTnkUq/cyCFawvgSIoJriFmcHgrJ1Da8HfsJTyArn?=
 =?us-ascii?Q?Mtvy27deBzgU5CAZPodD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c24dab-4da9-4b2e-a606-08dc9577f04c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 00:35:54.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4274

ath79 target has already been converted to device tree based
platform. Using dynamic GPIO numberspace base to suppress the
warning:

gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.

Tested on Atheros AR7241 and AR9344.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
Suggested-by: Jonas Gorski <jonas.gorski@gmail.com>
---
Changes v1->v2:
  Do not set ctrl->gc.base=-1 as it's already the default value.

v1: https://lore.kernel.org/linux-gpio/TYCP286MB08958A751BD29BB5B04485D9BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM/

 drivers/gpio/gpio-ath79.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index f0c0c0f77eb0..6211d99a5770 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -273,8 +273,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		dev_err(dev, "bgpio_init failed\n");
 		return err;
 	}
-	/* Use base 0 to stay compatible with legacy platforms */
-	ctrl->gc.base = 0;
 
 	/* Optional interrupt setup */
 	if (!np || of_property_read_bool(np, "interrupt-controller")) {
-- 
2.45.1



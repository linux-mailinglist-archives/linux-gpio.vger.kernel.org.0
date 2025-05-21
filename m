Return-Path: <linux-gpio+bounces-20389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4FABECFA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6921F3BA5DB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 07:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADF223372E;
	Wed, 21 May 2025 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sCsc+G+n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFAB199EAF;
	Wed, 21 May 2025 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812169; cv=fail; b=Oh6ChseW8RVX89zhb8xoixuNX9cTGmyQizOenDkQwhDdQ/mTuFDLR7hSgQb59bZ8b+dw81c00sexb4nVKSSQ8YUvJFMdIRiSEgcgkUJL2StR2LS/XFYVSAzbFpkw3Xz1Sun71CHZwNYJE8HBHzwDP6O2z+MqbqKWUxhQ/PY5jSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812169; c=relaxed/simple;
	bh=7qwm28uFhz56fiIWp7RHbj1IkadLK9fHj8ih4ZLGS0A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CPpRZi23fJTJ+2SFYlfVY6mQONt5vh9Gyp9wwqBovZuXmHtRtHOMXzRgoHKpbAK0eiTg7hpurfGxXWJYshbbilDNW7I8ERjxibveDv0aAVFfw/y4Mm0SEZl8oBFPjGnL8LocE8/sLkthe0k1vTIfTuMVylCWS6Tun/9s2floSBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sCsc+G+n; arc=fail smtp.client-ip=40.107.21.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFhgHW1/5HSvmGgMzSIZjgc2czqkYYqkMexlxcXH5apZTalMLN4OUHSV7CX+1ArMuGR/zQjOEfBoACGZVYziD6C+yfnY1+3lQL7E0h2VBaqXGr9cn7WCIBuM68NDgPDHklL1aXV6kHBCU0gBQB59QLDw6bTARw6dbcTsVwax3zx72pb/RMSBBm2AfhamJ9of9easQVlXDU97k+IDUKt40EO9sS/c5fGWI9M4RvyVveuf9qofZdOYS3MNfJyMSaWd7QlulFkmzHADaZn/gwvUbkNwCxeCdaUcg/RIBiWTbTzrwSOSVsoX0GyWiNlpn/m2EU3z8LL9n9j7pNSUd/vgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgaEI4wWaj95+Xu/cp1nwoQkpXryhO4oVC5m8CWO28I=;
 b=QDA35kNNcDe9PcUHEPHnJvp2eLXmFrq+aYXha6NcXwmBTwWIEmizOnebBn1maN/JIonheSJe578rhL11bZ7B42VhlZKEzbzLHMGPnND+Yuac9glDUaBNdiNRA7SH6FLIojplkKE2R9OtkzRWYbMuczjcW6AxXKpmRYNs/aVgIzK1tdZSUbOi7fnvbGb/R4Bbu6aJcdwrpepy/x6d+khvoSi1ysW55QZaWr7YXLNEt4hpjRb3GTuffjQLpQ+QpJFSIS3ne/9EynoABNBomHKJkBqXArUVn4kjoFbcIjvcVsiN32sChjxKaNs/N2RX7/YSE9KJf9TR5aDt3qPZtiElqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgaEI4wWaj95+Xu/cp1nwoQkpXryhO4oVC5m8CWO28I=;
 b=sCsc+G+nBTh5sjqL2Y16zqhU/BeWbQLQveCJYx2u4cK0tsOYdQ9AMRyBu7RpJIx//btGmqZnoiNc4JZ+GR58LogQDOmPyCm91qM0IufibyxHQB2bAIbgv2IpBmqZ5LQ+9pnYmcuKG57B3e7CXHSvjcmNchmH8+PYDiRicbS1sNjVKurs0aE/sYrVFoJx1kzQuuF7M/uWr9JgWYZ40mSa7IAHLma59fPHyscaPlwGcNv7S1um0KtH6AjDMWuHjqAOx4u7YWW1rHBZ9qJqJSEmbvr7R+uYEnlt1n64zhTn5NAzvRNJNUU+UagZCmL7FaqBbK0xCgwFEY2zkegAtHzqAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8176.eurprd04.prod.outlook.com (2603:10a6:102:1c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 21 May
 2025 07:22:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 07:22:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Date: Wed, 21 May 2025 15:20:48 +0800
Message-Id: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096::13) To
 PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f25cc71-17f3-4f15-c0d7-08dd983845ed
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yJNEftIVYl0P8ZHsDSZPUXcPKslz4SwKrdcKtlVFSvmlozu7BVT+R4UM/x7z?=
 =?us-ascii?Q?PXUwgRKqHNwowDQwWz6GE6BVIMqYUZorYnstq1R5UGYt5B9S+Q9JSPHKo99g?=
 =?us-ascii?Q?gU0zhTVnbchcvpSPrgf/gz5V/SYppobKHnPykW3KkIDkYX5ySH3HyTG/yDkU?=
 =?us-ascii?Q?TOOoH5gtU17ffJbOT9VbsTpCFmb23unOUWoHt41tbwOcWPmuAvn0LXb/Hmet?=
 =?us-ascii?Q?lwgTAilI1YRluSF5SGrJsVJZ4EAhEVNRs4KKWh4p09UHQSoHnOCLPlpP0juo?=
 =?us-ascii?Q?Z5Av+TocbqnzRZpkG51zdjCowv+C9xOOpsdBhtVQvdQ2i57Gp0UXci4Ml8Ky?=
 =?us-ascii?Q?H+C2Wvhf8Uxb6NAkvuta+Fk8FXYmcT3zziuwI/XcdtPVrrDDs1Debyq7wAH6?=
 =?us-ascii?Q?9czE6V0ez5PjEAvup/L939u7+5AON3vfGmrApMUy6IBE6jtDxe/Nt/4j9/f+?=
 =?us-ascii?Q?ne429blCQhnozbRK3d4nbYL7tChODVw9SJA8GV7Tim61t59ck9ZWa8vLfKzD?=
 =?us-ascii?Q?RDuDVNGaTeS92EsKfehg/CFI/L0YXX2zWEmcPi0SdzTF+RF1bTh5obtIODOj?=
 =?us-ascii?Q?Hy7Y5BsAwPVWWUMGOlg7SMni/VVeEZfC/mdSg0cHYqgOLT+TCZ68ppRW1dhq?=
 =?us-ascii?Q?Tf3cLCRuqWvu8J9i0bZRl2R5d2DVjjD3VbTJJTF/TMLcn4tX5DyaAO56GuTC?=
 =?us-ascii?Q?d01vN0/TlILZ7qt1YmG3fMFhpBmIeAxG8xSchTSibbUYMYl954NPHSFsfRJu?=
 =?us-ascii?Q?+AalufSbVYlXwwmaNrJcTibXPNdIdRkI9JJrWHiLE0Hw2qqX9NnYb2lrLdnw?=
 =?us-ascii?Q?ihAhrHxPd4iXIoDeR4x3oWHB+SqhkwDPa07klcjq2wbaSLsX8LLLhNJWcrox?=
 =?us-ascii?Q?j+liT7N48qCa2qnMh6hXmfyxWEfquSBNalPbSmPgKU+hqviuy4MnEz6G9IfN?=
 =?us-ascii?Q?lkRAU7wztW8030BA1ycPlttuqt+9H7HIPdDa1J2DRhJnUXeAow3Y6BccpnEg?=
 =?us-ascii?Q?/wOUpOVsoVBu5j98zTk54K/JZ06AO67CDuK6SP2InW8kgT5l0hPKfbbwBbp1?=
 =?us-ascii?Q?WVkJ27pfIudNSHTecF97WTcAukwuvMucqITbwn6foMtobSWaZ3EoqW4rFA76?=
 =?us-ascii?Q?Rxvw+vW8HHkJZTYte5xbGAx0mW6Z4Sh0bvwjGvW0LQrH8MDXPzOmLwtSJ3Ce?=
 =?us-ascii?Q?lbQxQo5jI5Mdool7HIwtdtE+Y6O240uuPT2OK+xgQX1oe0NXVjDjYdsn2sZu?=
 =?us-ascii?Q?o5M1NSESWNenEIgRORMnwH1SwCLLaTG6kEET49LxJ/bAx0jrrJ7JpgHA4s3N?=
 =?us-ascii?Q?vDd/uw8bclpnOjImYPucpTEHv6VpjI16RtSvKFbE0KlFXNpfUic68JDbJxCG?=
 =?us-ascii?Q?6mELsSf0WB/pqHckw64qyGCjUTAKiu8yq7Bj3JR1I8lEItDLjLpnktjOWcVT?=
 =?us-ascii?Q?TdhrfZOdh/KukpEu50LfqgQI+xZNEFd/XdHbBuLPXC8a8hIgneF7VhkiNtQ7?=
 =?us-ascii?Q?Ldk4sprg7RuAqOM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jkrAQ7fdh/WfxLqBN7qiAcCsRFDcDgXFoqBGKtn6GNeSLNTk1fOfJho4aw8J?=
 =?us-ascii?Q?GfuhmtbO28+SUItK3CDHyMR3VDwN6Azk/N0t+mjrw5bvIVdYn3cxc3zAwA6d?=
 =?us-ascii?Q?B9mjDcr4JyUy49rfL6ajo3RC8+/Bq6qStCFsu5LNogct7WGFFPldtVHhLjQZ?=
 =?us-ascii?Q?+9Gkf2qY1vc1ya7Rp1UH5J1jjx4Eo5h3M2ddUVOhndbcDtEkgWdb+NsG2Szk?=
 =?us-ascii?Q?2KwVTPrXkCxKaE3Z7HeXxDs+O4SNGOC6NopJMAmAAgvAoQrmccSZ0oH2BVRN?=
 =?us-ascii?Q?bBybDE6hRR6vq6eDdX0VNPA9o0gLU8lk3id6SZh5zbMStFzpTVUNbAUiPB6n?=
 =?us-ascii?Q?HcFuCMUpVUrtzFUhnZqIrFaSotsyiLu69v3P9cEpI+eR5kjXaj9hfCSrGmfJ?=
 =?us-ascii?Q?d6mN8DRpsCoGMDnxpk6G2huBrR1ZN9MvOjRefqfBwblqCNtJZx+CjWRwWpxy?=
 =?us-ascii?Q?p5NHCgEookMJ2GoyCBMUrGk8Msc4srL43MjlPfAaqzKbb6xcBal41VPB/eF2?=
 =?us-ascii?Q?gW1KE4DPakEmiiUmMv5llo57BJiVDSBnC3UuAVUST9h6HxMJwzsqTdrRIya4?=
 =?us-ascii?Q?SqmgKo7zucbRru+YxkMV/3L9mnElilq/juNq3sXFYngkgIsHLx9Tvtxu6Inc?=
 =?us-ascii?Q?FOY6vJMjjzWnBRL++1nW5vC6jVYb7HVfzY7Q9s8IwgrC7snjS62/FP0WJBpc?=
 =?us-ascii?Q?Fdm0m1S9tV+2gt4crHYjwL7CtEyYBUdhtu4YlQfsXtVFRHLCuo8L1vTMDMil?=
 =?us-ascii?Q?026ut6PFInDpq3jpDKPGlrSpWIRietU32JOb2dANxrcT9icP/GCkNNyck9Zi?=
 =?us-ascii?Q?6H5SFelTkGygaM4ejOzzPn2Fe7sulxc0rbp0/v76NekhK33CNDKZDKbShqle?=
 =?us-ascii?Q?olcgbjS/MPnKos4Rlu1tSnzkTqtwtUtmoBVlFvdMgFKIBXrQd5AvjRezv//T?=
 =?us-ascii?Q?8db3jE/6bb+294GjDF2Hle6GfgXGEtt6r9a0nVQjmXYlsjClhNiybhFZOuBH?=
 =?us-ascii?Q?9W+nLZyAcADVZcxJ4MMvWSt9wFepC+UBpdOW7QueBaPZLn5TVn9es2rnJPAq?=
 =?us-ascii?Q?BU3XosL6lHAn5VW0exRkOv1jg4pm15sD2+RtYoIia56JqanjEOeSrDatprLG?=
 =?us-ascii?Q?8pvt2b9IFnGDPTNxY2X1pHQhj+O+j5YwcIBDcmCjXsmJ6hDvPdjb10eocujJ?=
 =?us-ascii?Q?W220/psxwaN0zqaugf8pucAJgPTwV8VREyYvZ9GkTZaFNJTTbedardcxi3Fo?=
 =?us-ascii?Q?ouoiGeR2EeNsNpfx+4uMJ7JtBtIeWoxHcIoyqRuRz5TvR9JwsqRfZaO5XPq3?=
 =?us-ascii?Q?WYYSUgXtRicRw18Q9Vk5CELZC/Lp/3PyLG8AGjsEyZAzSUuFitY2QMk8Rq5U?=
 =?us-ascii?Q?EvI4nUrZCZvDTocN6J9/zAPUTL0CgjlOxR4uz6B4wYlQzLjI0up9gbhJ5eGN?=
 =?us-ascii?Q?3xfI4N9HpR3elBLfqacPh94sBn+diFITHXuigXIIIyyqt12UmKaxx7GoIbQM?=
 =?us-ascii?Q?SPbN7+PPGfWfR+Z8Znb3StdmUJ6Ad9UBc0yR1rnHi2KBk9vqAp4/ku5ougo2?=
 =?us-ascii?Q?edx37X3vF6sBZ5q0q/7zfNxc8VovHoo/RALUcOYv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f25cc71-17f3-4f15-c0d7-08dd983845ed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:22:41.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgooWeHp9EqEbMiq3UJfxPWgGNI1vY0vbkLHjbGui/mmPHh4Lhr0gvJMz31Y8CFOijOL/4W5ThEzqYLXvL970Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8176

From: Peng Fan <peng.fan@nxp.com>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 3f50bb3124d7 ("gpio: davinci: Make irq_chip immutable")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505210606.PudPm5pC-lkp@intel.com/
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

Hi Bartosz,

 I follow same approach as you did.
 My last build using multi defconfig was not enough.
 I tried build all arch/arm/configs/*, no errors with this patch applied.

Thanks,
Peng

 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a559d5bb8249..c3465fd82b08 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -253,6 +253,7 @@ config GPIO_DAVINCI
 	tristate "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
 	depends on ((ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)) || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
-- 
2.37.1



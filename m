Return-Path: <linux-gpio+bounces-6109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F76A8BBF27
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 05:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D370B2137B
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 03:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4812F2C;
	Sun,  5 May 2024 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Pp4DsE/G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E496FC5;
	Sun,  5 May 2024 03:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714880389; cv=fail; b=L/ylCuEAlsViT+m5jB6lQM2GadPdsIoZ0LNb7Zi6rVRlflcXx8dLSBpS8iIWmBI8QvpPcG1VOHKgp/Y3z4NOyo9Ze3ZudDrJ+DXP0Pha832yl0CfuRkadofp+wbICrok8zrr8ZiF3sV7bz9UlFT8D2Ghf02U05BmS6KUl79jrPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714880389; c=relaxed/simple;
	bh=cHIHcCXMeRtfcUN3fUO1YlmnkdzbEc0paFnDh1W7DWE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DWbhg2ntaUSb1teu+HVMWmAoNvFSjLdVER5wlCapNpVrkP4JQ/fm1gaIwv31uTDu1O6H/jae2dfIjQDsebgbF5yKFOgQ12W+uMmK/U2m2lkJu1ttbz95rgWrT4YvtujGfWUzolKf3J2mApkMyvJVlVYdoSdWABPojglmcD7Gxhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pp4DsE/G; arc=fail smtp.client-ip=40.107.6.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNTVg46vipQxTzF02Ds9f8ankb3BRhmMjQ+7gB7JuBEIQc7e5odEXs9UOAYwJ8tPfJXHYxpJUCzIUrOgLCEeS7s/kiJ8N/UpZfB5VRCo8W19Upd2hMT/xjJ1wi92LenmRBSg3OPxz+OcEY+F2uIsNqPp+AALLy/vKVGv8JJ8d48pLr0EuPKObC1XGoJRGMHYhjgBlLjhaD4exPE/Y5W9zv+y+aF9uNxwkRG7uM3h1oIBZQXXeDTIv9qRUb2DwZoEIBhuwYorsj6mFzBSBmwQt30OLleY0q9JL548MogXQkGI6bl3BWq6BEjaGH4EZNyrwSS533Qco1LUHLb/69K+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpRie+nloq8A3UbzYPB7kIX8wMCGL+JIcNg8iz+EHNs=;
 b=cjMbzSmmusc5eVnFLBzvgaKumRdvFQT2+bUzO6PbRhRexziURZCjPX4U1ClRT9F9XIFOMO/70zeQ/aM6igVeJrRlXKq74fjkxDOQki5YEd3suZSDWTD9FkLYSjBrKb3NUyBe0XMtccwgoGfdj5Q5Vrde3+Ds7n5gCF1d1gl6gdhGNFiHAxWsqXwnQOONMQfVymxrOS5OmBRisPiZNZ/osK677r5Oy/iXmgrpI6Y/3oP2P7T4OFJYwtZvqQQnZs4ASHtEJakCDMMp5veTRxSMUpp91O/noSaF7dgH6NUCdeiHPmovS5cJ/0a9bbiyLKxHBUbvEIWYL6KWMDwwme/sig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpRie+nloq8A3UbzYPB7kIX8wMCGL+JIcNg8iz+EHNs=;
 b=Pp4DsE/GI2SYIClHsswH3VGqD3u+TLMj2OXI7Rf8KQ82CkP4IoGKS8gMvws8ZU9pVmjxwqIyvTQv2kVF4TmNqpQFxW0GT/JAgLwNFPbJuiJPAhLhMY5djwJD0b+0ii/fpn3d1X9p8OLlNzm1VPlsiLkKeDIjVKwSaYxt8Mzgly8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sun, 5 May
 2024 03:39:32 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 03:39:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 05 May 2024 11:47:18 +0800
Subject: [PATCH v4 2/3] pinctrl: scmi: add blocklist
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240505-pinctrl-scmi-oem-v3-v4-2-7c99f989e9ba@nxp.com>
References: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
In-Reply-To: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714880848; l=1513;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=iLTosuMXHbADLkYgKUNjBSdsZfH9Zm2D+iMMZu/RGUc=;
 b=wAledQaRf8wMF5I3zCUr4UgQ+glmFxK5ZRJItXRlGF49CujeIs4uYGPhMLsOkm3I7SElOApao
 VBSUZpBkauaAB1iBGxBjRJHJ3Sh1WL00YtKp7sElF608GdShmCL691d
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc7512a-ef57-4eda-6595-08dc6cb4fa20
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|52116005|376005|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFh0cE9iczJCVU9QU3VQSTNDajg0MUpvVzBKWDYzSlhwYUh6S29SeDNvR083?=
 =?utf-8?B?eE5aaldZM01telZpRitZcjd1bThBMzBTbjhsZG04M0RLc0t0bmhETzMyUS9K?=
 =?utf-8?B?UTkxazhGZFNPYjhnbGcrMk9JY0VTZ0EzRFJ2YTR6cVpsOENLanlvb2srOFAw?=
 =?utf-8?B?ZEQxUGNsQXQ1T3NNVStjWVZlTFhFQ05ic1BTckxMenRSTGFNSWwvLytZL2xV?=
 =?utf-8?B?ZmUzMGE5Z243UzdNTWI0VmpmTVhzei91RzRLSXhxMW12UXZFZ3ZLaFZoSjBa?=
 =?utf-8?B?d2lwNktnV0dpbGgybkxQRWM3UFBWQTNIb2ZaejlMRXVKSkI1dUl6TWtmMmhS?=
 =?utf-8?B?NGRwZWszc3VJWTdOWUo2SkhEeSszdk9sQzZpVzhaSjRDMDY5dGJLVlk3QlFv?=
 =?utf-8?B?YTRta3o1Q0d2ZFZYazBrR0xuaVJydHNnNFJMMXM3bWxvZTE3aHA1aEZpcTc0?=
 =?utf-8?B?UWR5RGFzU1NKdXl6MmtEb3RLcnYzNzZoVklkbHk0azRZQUpLOTNYRkYxcUZY?=
 =?utf-8?B?RVpheUVja3NieC9SL2pRU2NBc0lTQTZob01MRndjcUwrNllLa05RbDZWWkZK?=
 =?utf-8?B?dk5ra1NzOXBhaFZmS0RsbC9uMXgyWSt3SHBCYmRPdWRGLzh1bzBtOUgwOFRh?=
 =?utf-8?B?UGtLdEE3bHB4MVl3akFQUUdnVWI5TTk5N0NqYU9zVGh4U3NDTkU3K1NCS2pj?=
 =?utf-8?B?SmNrbmw5VVdKcW1wRG9ha0VURVF1STh4S2FqZGRkQlcrZm5sUjVMSWp1dDZ4?=
 =?utf-8?B?WmU1bE91UXhpVnkrRm14TUlIUUs1bkptMGc0bXIzMUg1dG9PeHMzU2h1ZmRD?=
 =?utf-8?B?b1pQVHlmRmVuYmVSRHlSMUVWUWN4R1orS0FtOElXVUtkZzBCV2R1M0wwdGky?=
 =?utf-8?B?Q0JLaStHODg2Uys1ZzNYVndzUXRTWWMwNkllVXpEQ2pXeHc3TlJtcUQzY1hz?=
 =?utf-8?B?RDJwUEc5U3poTis5Nk1OWktnbmN3NnFrbVZyQkxDU20yRGVZNUpRNS8rQ3dK?=
 =?utf-8?B?aTlGbTRFWGhhRXM4YkdWNitvbTFlMnBQUzROckgwaUF2ZzFweHg5bFU3a0s1?=
 =?utf-8?B?cUFDUnlaV0xZZzB2end1S0lOQzZaTE0xUWx5S2tKclkxWW5mRjdxek9rWFpB?=
 =?utf-8?B?NnVlbStJaW9Ra1lZdWVEell3akx5SVRQQ3pROGo4VlFoUENrMEYzS0Y5SFA1?=
 =?utf-8?B?RGtpaldINmRUY3AvMnpTYmJFdzh6RURTVS9iM1VLWHVDbUt3L3hXV1d2c1pR?=
 =?utf-8?B?MEIya0k0NzFIeTExYS9ja0dPNHBZcE1zbGtjaWZJYTRqOWQ1cHZIdjl3WXdK?=
 =?utf-8?B?cExQNEJHSHhDa3laZFFDWVJsNG4xaXVrRGVZSUV2TlVidGNiS2FNL2M5SUF1?=
 =?utf-8?B?QVNXLzR2dlNvUnprL29McmkxaDhtY3JJczZqOXRDdjU5anNRWWhwMTlOZzRF?=
 =?utf-8?B?aUZoZHBTb0NFbVN4YmhLNkREVlRyV0l5VUFOWTJ6TDdJNVRIMlNxaHZ4L0xv?=
 =?utf-8?B?RnZWWXNXa3dvdGlVaGRBblkzMm1kYUVuV1U0dG5YT09ZNXdrK1dIQkZJaGlO?=
 =?utf-8?B?aVhGZFN2LzFFQUI4empxNWE1YXB0OXlab2graTR2eXV4RHphOXRseW1jMlpx?=
 =?utf-8?B?b01jQVdRNlpydWFxbXo3NFFkMm1xb25udUJxallUYzRlZXVvOGxHd21IY2s0?=
 =?utf-8?B?U29OWWhDMTNNQnF5V2VVVnZKQy82TGtDejZKK0dOTzRYQnZEY0pRdjZxZm1p?=
 =?utf-8?B?NFlOeXpOdDdnaEZEUUdGTTJiNnVKemZZMWRPVGFPKzE0c2F5M1RYVy9XMnFZ?=
 =?utf-8?B?V1FZZ29xemh5TGFLQVNEUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(52116005)(376005)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHpINFN1dkJKUGJtaWZmazN2MmZVNWxmRlpBV1FjdjFzT1lrOUFDeXVwR2Rw?=
 =?utf-8?B?cVRSQnNtTEZvRWpvNFd3QVlMS3hkTEhJU0Z5bXFWamtlTnUvSUQ5TERxSHZW?=
 =?utf-8?B?c2d5K2Z0REpFcCs3cFdnNnZXa2dUNEdwSDdvaHV4NU5RWDdTelZqRXhaczBo?=
 =?utf-8?B?Z0xtRE9YY3hlaWJaS3IwKzhDM1BzREFQOVNkOFE0cnVTbXV2TEZQL0FON2J2?=
 =?utf-8?B?US9RTlNmOEVHZ3NBK3o2c0N6N2NWV1J1U2NvbUxabVZDZnF3TUlzc0RYck1W?=
 =?utf-8?B?eDV1WGhyRThhSXFDeVlvQ3I5dkZmcHgxU01rRXd4dEhxcnFxelRDK2JCckdZ?=
 =?utf-8?B?VVFkS0szVlBvUUNlTVBlam52REJ3ODIxNzNDZzEvWVBPQlpSeEE3OGxvclNI?=
 =?utf-8?B?WXdmam1sOXVqM3FEOFdCWnFlRG5kdmJwUk51cFdjaDNNRnlwUGYyeGpDNXdO?=
 =?utf-8?B?aGVPdjVPdys0eHN2RU14VzRjSk9pTGFCVkJzcGRxWTFPaDF3cTVMcXhlaGp5?=
 =?utf-8?B?cWhDOEVoZm14WnV5b3hGNGt4Q3M5QkU4UEVQUDRnbHM5WVRZUlcxQWlpYURL?=
 =?utf-8?B?M3B5eklVZE90Vkx2S0JrN1J0RDdHTWc0eWZhRUZvVmY2ZlR3bFQxVnczRUtz?=
 =?utf-8?B?cWhBTHhSandoNm9uNzhiR3NCUVJBR1ZZa2pIWGtQWE55Zk4zTVhnbjRYYnN1?=
 =?utf-8?B?M0dFcnJQdWFMNGZabE1uT0tzcXpYSEliUVpSUjY3QkQzR0lhdmRsM0x3NTBm?=
 =?utf-8?B?Nk54NG5qWkVPRFdLcXRmWnZuUk14elFjOWpETjhZaGE4T0liQURDNjFKa0Fh?=
 =?utf-8?B?Z0ZxTHU2di9sQkJ1OUVOcnFiM3pGTnBPQTBKa1J5ZjlISC8yR2lKQmNyejhO?=
 =?utf-8?B?bzl0cEpYYjJ5MjRmZTFtZ3JQT1gwKzBXKy9YUHBwNC9ZZWtDYzdyK3NBcGpJ?=
 =?utf-8?B?aWgvOHBuUGZtdUdQc0FmMjc0UWt4ZDFZOUVJbC8zUWtURHNld05EUFg0VENL?=
 =?utf-8?B?MGpjbUNXMlJRTHZhSHI2Qmd2am94dVlmYWVuYzRPYmJkbXR1WVNsVVMxNjkz?=
 =?utf-8?B?YWQzZUVDdDkySytNRFV4QVVCMndIN3E0aFlmOEo1RHFBRFpmcFFMc0xjUjhG?=
 =?utf-8?B?VDhKd013bDl6SWp1V3Zjamx1NTZyNW96ZkVmQStON1gyd1I2ZjhGYm9qa1pB?=
 =?utf-8?B?S0lGNzVkZ2JGU2NpakVZT3htMnZaRkRKUzc1WE5PcDVNY2lXYXIwczVtV0RI?=
 =?utf-8?B?ampVUUpqU1Axci9XNkMzdkxmN1hmTjF6M1VKM3RObDdwYUdPNkJFcEluTVJi?=
 =?utf-8?B?WEE4U21yeDMyRnJLejNodG5Sc2k1cnc4M3dzUWwzQTFyLzlSdW5PRTJpckhR?=
 =?utf-8?B?WmN4OW1FUVhVSVFabmliL005T2pDS2pYZm5hS290Wk8yOTROVm82SllZcTl1?=
 =?utf-8?B?bG45Qk53Q1VCaHRseWY3VTFNZmJqanhLZEg5ZFk5L1RYRE5SWFVDUmt6SDd1?=
 =?utf-8?B?eDlLdXB5ckJhR3pzM2UwaUxSb2dDdWZOQnhSL3dvUjdLekEvODhGSEh6TXRY?=
 =?utf-8?B?ckFMM01PcXJ3QVh3U3FCMk9ObnJleWZqZnRsem9NT25Gd1Vmamx2TEhTQk1B?=
 =?utf-8?B?MEkvRnp4MnYvM0RNQUgrbllLR3U3dlBMUiswVEFEYVlPZXB4cUhOWUhCNjlH?=
 =?utf-8?B?K0gxR1cwVlRiQktEUjBEdnVhWG1ybnlhaEJDY0lYM1h0c1JmMzhkbThsWHlo?=
 =?utf-8?B?SFFQbnVXYVFJQmNSaXhGNEtWSmZscFhRSUtaVm1wK1plbmYxQ1hyUWk3UGJE?=
 =?utf-8?B?VFFIYjhhNURrQVZFZzROU0QzZVVnd1d3eWs2VFIwOExnd0lvV2plVGtMQk1D?=
 =?utf-8?B?ZVAxNmNqVFdkTWtseGVRUHFxZG92dUlPbDdsWTZkY1pHeDhQMXhNWXR5b1Z6?=
 =?utf-8?B?K01PMTFsN084K1EyQmJpWmRXdXcwKzZnYUc4UGhLdVBxNUExSHlEbDM2cFc5?=
 =?utf-8?B?cFA1WnZNaGNaVmFCYnhZM3oyRnVhakVNeCtQcGR1bWFvZXEwN0ZwTEdYaW1y?=
 =?utf-8?B?UHZodGNmYUR0d25KY3pENjZjbnJxRHgrdU04MjF5bXNjNGFlSmRvVzZpZU4y?=
 =?utf-8?Q?4VvP0X9wF7+fQGkawjvcxCtrV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc7512a-ef57-4eda-6595-08dc6cb4fa20
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 03:39:32.7127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoJtvQt3oYxeVOGJs7KPui+GCxTs79WZt5R3RIbrrYEHXEagJnY2rXEUAXNM/LLSv84rdF0mpChWvvpiujhAnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599

From: Peng Fan <peng.fan@nxp.com>

i.MX95 will have its own pinctrl scmi driver, so need block
pinctrl-scmi driver for i.MX95, otherwise there will be two pinctrl
devices for a single scmi protocol@19.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 036bc1e3fc6c..331ca20ac68b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -504,6 +505,11 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static const struct of_device_id scmi_pinctrl_blocklist[] = {
+	{ .compatible = "fsl,imx95", },
+	{ }
+};
+
 static int scmi_pinctrl_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -511,10 +517,14 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	struct scmi_pinctrl *pmx;
 	const struct scmi_handle *handle;
 	struct scmi_protocol_handle *ph;
+	struct device_node *np __free(device_node) = of_find_node_by_path("/");
 
 	if (!sdev->handle)
 		return -EINVAL;
 
+	if (of_match_node(scmi_pinctrl_blocklist, np))
+		return -ENODEV;
+
 	handle = sdev->handle;
 
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);

-- 
2.37.1



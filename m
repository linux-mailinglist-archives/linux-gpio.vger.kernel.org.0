Return-Path: <linux-gpio+bounces-12433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF6C9B8C9C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4B72829D3
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B654115A864;
	Fri,  1 Nov 2024 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lD0yztAG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F363158875;
	Fri,  1 Nov 2024 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448423; cv=fail; b=qduu1m/xMnEA1SqaJRZq8zOhhNvsRNrswmkPeTv4rKrW2SPViGVwM3VHiVAkWF0uAmFxjuBD6i8MmixUUQy5SR9qOKramio7+4dssYTXkTtDYL4fRPdL2qZnPWD/BYNKzNkLuS+hyO+zG9XWYduS+t5I3sEhhb9kDV9eJyYR260=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448423; c=relaxed/simple;
	bh=Y8v2qSxLRcVjWKOqko4N7snR8jF1lvjDb8qpfKwM2rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GRy4nOrWs3s6rX9kn1+YbIP2fhxb4VjvWz/HLn55ZqSxtBzU+EHdcSCHPqHK9+fJIBlVVrigIWs/KWtOXMqOFqHurYZyqfbD8MpoCo+RwUpZSXSZtO6YIhu9FsrIsxEUobisGN3PoMlma+1Ft3R6PNLhkFQ5c9f0Eo1SgVZ9T4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lD0yztAG; arc=fail smtp.client-ip=40.107.21.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2zoXNn80vAT800piHASUrQw74Gs9RTU8k+wjMq+cRSU7xIiNgZbj2pEVH9B+7oROCwEvZsTShu9BExjh4mns4TXIXlmNMytdeSDGLj61CZ9tAhjGfNe4s5QPK7Tx+XqWiTRZV6pcbavmFZSUjUUwDmskbno8orP7CmlrxkP9StJtxvE6tpYJxORViEqgNyQo6ZvgRDv2HYygC9aVSOIAn+kpoukUUhfIQsK7teF6+glS/rhHGjVYQ/6qPOxCaz7vSrCwl4GaDkWpOP8vCGmN42brEd0BhEKtym5WQsPB9qwBlGMUdOBNh8Y40Mmg3tbNaVuZXheE3Sk/OA5XbUSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2x4oreJCHyyFSO0uw/LvkqDdzdsc3tU2z0JM65GZP8=;
 b=GO6Z/fpiInoDs8oUw8X7RojeaoE5STnfNv/4UWgoZ0CVwk64fSDjUujeYej1CUnW5+JBpZFsMeYFJkwtl6hiYACUI/XlTzjvWhaT/U5KFvh8P6nGG/b3nIjpJPrBHk87zPA1Tt/DNWn6UHoP/Ew04oG05NB13/vMHN3YWgLOxmM9LunDiv8X6mrwzxzCHTrjQGRGslw5kIlPwT2X3pZmUZo1wL6ln7717Ik8vFflII6JIn6NdlLMfaNz9qEjTzmqm6uxD924NjNHSzNM6+yAu0/4dGh8u8FLct0FVIzF0z8T654Ts3iITNNFiQRNyZnbuJ0cA3LWJ5Q4RoRH9s4ncg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2x4oreJCHyyFSO0uw/LvkqDdzdsc3tU2z0JM65GZP8=;
 b=lD0yztAGZR9oiUnoatQ1xeByXu1PRTTl3fZi2xuyICk76ceUuf2cDz/rl176/bv8PIwPQzfTjmX74we+QGsiuoICVXmDv8b1rsG6fKRjDEwmJMZOk9fIGkP+lSihyBEXYkmL7ZJkZUgFU6qIPxDRqdX5r4FGZm7MsJh2zi5wOyAcoiV/y4bn1B2NX0+IFMttxTyUpltGE6XmntLqU5rTPH9csOwTMpn/rcQLao205Y/G6wPwU6ZZaOlYajlAFcHLvrqmXalpsWC4lE4O4UjLr18QT6HiJsY5k7+B6DDdkRN+4PJ7lVhlE0PDCzf2brJ6b0/PNYgJTCPuLQrzCbaBSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 08:06:53 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 08:06:53 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH v5 5/7] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Fri,  1 Nov 2024 10:06:11 +0200
Message-ID: <20241101080614.1070819-6-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 273a5bb3-24db-4b24-323b-08dcfa4c2568
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTkrdEhucU9vaXRXcGZhdlVmbDdhYWZ1VVFQL1laY3cyV0YxTHJJNDNKbTAw?=
 =?utf-8?B?WTRtWndGYTFlUnZyVzhjVklsMDhkS2xwOUdOek5VMFkxdGFmN0pmcE1jbG9h?=
 =?utf-8?B?Rm1HcGhMQ1JqSXNjNVc2RjVxQktmSEdqS3U3cXh6bFJBNTdOd1ZockloalRw?=
 =?utf-8?B?dGlGSStMb2NkRWJWTkFucC9pbnUvNjloUGlUVkFJV2tsNWpIQjNueUJyZXJk?=
 =?utf-8?B?Qk1GWjczTE1GeG9PL2NpSUdQdDF0aVRRMzZ0MGQraE1VSElneXpBNHd0eXpm?=
 =?utf-8?B?aHFaOWE1WlVxR1NCaHg3UWZ0SVI1TFQ4L1BIanBMS1FaeEdJNG9jTk1iUW03?=
 =?utf-8?B?Z3pXK1c5T0I2bUxkMktIZFpmdzN5djI5YSs3NVNRMWF1Q1Qyb1VsMnMzODhR?=
 =?utf-8?B?dTlxR1JjRTcySW1McHBzYVpHNlBTMzd0bTk5QU91ZG9Na3Z1aS9NYXVwSnJa?=
 =?utf-8?B?N2xla3JTNG5EMFVweW90b1IyMEw3bmNyaHZwdjJScjFQRUtHN3NGUTlmRkxD?=
 =?utf-8?B?ZnZ6RzhINHpnbWthdXQ4Y2VCVGN5bjdPVzlIek1obm1BTlFpZzFFVlByNklm?=
 =?utf-8?B?UzM5SDUvUlZ0Rk5KOU5KTGtuT1BJUlVOa2tWR1VxczdnQnpBemZ5Tlk1c2FS?=
 =?utf-8?B?d1hFckk3ckpwZ2xQZUxPZXBidzB5cFYzN3JYRlJCVTZKNTdCV0Z4eWpTaUNE?=
 =?utf-8?B?QVF3Y0Nidy9yTmpjQ3RJZ1A3bkdJQXNaR0Y2OUE1SndUcHp0RWgvSm40SWk4?=
 =?utf-8?B?WWx3TDZPN2VCcnE2dFQzN0N0aWo3WFBXOUxwdWM5R0VWRVJRS0NjR0VsQ2xV?=
 =?utf-8?B?L09DdEM5ZWxoazZqRHVKUVhkV3hxajdmRlhINERSYUMyZHhsQkZqM25aWGZR?=
 =?utf-8?B?VWdJZk5xbXYzV0hnRXd2Zy9wWGFMdW01LzVaOTBLWWZiNGJpR1ZMdE1CZ3Er?=
 =?utf-8?B?dG1EbXdHRVVkcXE5TjNDRUM4V3BDdjR5bGFGZVFPODRNTnZyc0lXTCt1SFJM?=
 =?utf-8?B?L3RCQVlZRERPZHlOQjJDUGk0eE15NGwwNFRnM0Zsb3RMQi9BbUQyZkdmTGVz?=
 =?utf-8?B?eVQrRVFtM2NZbTBiUjd0SVV6YkEwM0NxaGV3T3JwbmVWcXBldW9WTFIxdElL?=
 =?utf-8?B?MWhYVVpKQUZzV2MxQmlhYWN6VlJ5dURHM0dyL1ZIYmxnOGljVHVFQjdLUU5Z?=
 =?utf-8?B?KzVERDNpdDgrUWcrSU54TTIveUkrV0tWQ1JyWENHK2xlN3l4aWdjWmxMRGVX?=
 =?utf-8?B?eGFPbkZKa1M5N1RxdE82L1FLMkdPU2NlbmV1aG5NaTlFYVMyWDhwRGZPcS8z?=
 =?utf-8?B?dXJmNm1QSGRKUU5DOXhzemZ5TW5oeUh2QlV1ck1EOVJrMWxyTTRFZFc4b2Q4?=
 =?utf-8?B?NHpxK2gwRnFIVGpiQnBTYlZVWEp2UksydzF0bzRlb1M2V054K2QxTnFpQ1hj?=
 =?utf-8?B?MnJta3lia2gzMmxubWNMU1luSWNmZnBnN3dGc2w3TWRYcXcyOUdYUFJjeVBJ?=
 =?utf-8?B?SzJlY1lvN0FKb09BcTZoSlFuVlZhYUx3NlJ3c3RvS2dzTWpEQmdvWnREME9l?=
 =?utf-8?B?NjJ5R01EWDhHWGY2RkhaYUJRMTdYN3AwWFRKZjk4M3VYdkl4YW5PRldkdFVl?=
 =?utf-8?B?WU15R29LcU43ckhFUjN6TjM4dWczTVI3TGN4YkVTQUljTUJLeWZvekhDWkxV?=
 =?utf-8?B?RHg1MExuQnlMRXdVS0k5N0FIWmJRTStPTTBmN0FuUjNRa0lzcTdZWmJBYkdX?=
 =?utf-8?B?WlpVT0NZNWRDNXNqSzBlblJnNkhPcXpyTEJ2SE45VFZMamJ0YTNEOWVkY0NC?=
 =?utf-8?B?WTBUcDlDcThadDNiajU3cmhBd0lRVytyZTFUN01nNUlEY2puWE9ucGtETTd6?=
 =?utf-8?Q?N0ov50BpFj4iQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnRvVWpnOHlIbkNmOGhiL1hqdDZPUWVYc29pWkd2UndJek8yVmxUMldqY2Nm?=
 =?utf-8?B?WnR2T1JQVExPMXI0SzROalYwTXc5T1p4WlpwZ1k5TjYrb3hCNllVZjgzNlR0?=
 =?utf-8?B?bHAvNjhnZC9Ka2hINkYxVkxPYjZaTXJaMDdMczlEeTZRQWdtNkVMaEtxUDEx?=
 =?utf-8?B?S3NzVzJid1czRG1QMTg0QnRqOHMvTlFwOHVxS01IVGVQWTNFV3J4VVRGRGh1?=
 =?utf-8?B?K2NRQ0Rrb1Jldi9RMjNUWm9ZRWtvdDE3TXZYRXRtbWhSZUVEajkrNFpudTBT?=
 =?utf-8?B?UFdrY25zQ0o2UzFDM3ZmdzBpSGJwc1BLLzJOQzh3ajA5bGM2Yk15WjNFa0VB?=
 =?utf-8?B?S0VUaHBQSTBTcnZWVFZSV21wV1RGTkRMbEFsRWw2c2lqWk1YRHpoUnBMS2gz?=
 =?utf-8?B?YndaeWUrM0liZzIvUGZoVnRUQ0tFbVFwT09yUTgvV3hsK29wVm1qYTlmQWpQ?=
 =?utf-8?B?RFpWS3FBVnlOYlNCME1pTE1zdGFTbkNZMmQwdFdmRXhEQkZaRFV3K1JuTDlH?=
 =?utf-8?B?THNSOTJpYXVvOEJCTFlYUy9jS3RpYTRIdnVCL00vRnlUYm5oOTlZbmNWL2Zx?=
 =?utf-8?B?bDNPRUdaa2lja2M5cUZrb3IramxOMlEzdlgvYnNxcWtjdGk5am1MVTRJc1lv?=
 =?utf-8?B?aEhOaEpXZU5yYUlSaHlJano5TnRGRm5IcEFoWmJ1NVlOa2g5TitpQXBlSEFp?=
 =?utf-8?B?ZXQ1bVpoQVJOb2lsNWs3S1Y1T29YUE93ZmV4clNCZVBSQUtoMHhrTHJwMmRs?=
 =?utf-8?B?MnBmUDZaUzlhNzJNRlJUZ1UvNVJjYjkrSnBGT0djV0l4enFLa2U4TnFVcnFZ?=
 =?utf-8?B?Y2NGSUNvSnNrK3JKY1BERlBUQU1RQ2JreW5WOGhxZjl6T213Q3RuVitoUmwv?=
 =?utf-8?B?dDJQc0JwTWZFUG8xVllyQ0VlZHhGK1ZndC9Vd1MyTTFGS201NUNXb2NrWUFt?=
 =?utf-8?B?UjlDVWxzb1dMbXQ1RktDYnNwbzBVL01SNmNLcWx0SHdtWEttV1ljeFRxR003?=
 =?utf-8?B?L0Uxc25UNWI4U25KS21uZEQvYUdKQXVtZzB3RjAzc09IdUltd1Jvekk4eEdB?=
 =?utf-8?B?b3VzMjRRbEJHRkpmTU1POGpYWVo2VW5HTk5uQkJ6Q01YbzRHbDBsRi9ENDMv?=
 =?utf-8?B?UkVqYTl4SWczeSswcHZNMUpuM1NVZHYwRGRBQ3FtVTZpN2EzMFpUQmY4Z3NV?=
 =?utf-8?B?R2N5ekVsQTlKYmV6L2V3bEMzbDFTOTRMdVVwVkk3NEZpcUErTUNUSXNqMXZk?=
 =?utf-8?B?Z2hqVEJNZ0RtRFhmelBkSmhBSnlFYllUWm9ZL2xMcmRHSVdHTWsxWFV3eGxm?=
 =?utf-8?B?WDVubGJnZ0dWNjFQb2lJR01VWmRwV2dINTFzOG1TZHY1KzdTRDhWYU00dWg2?=
 =?utf-8?B?M1hiVkxTc2tiRjU3M2t3aEVqWG1yMVZyWFRyL1dLaXhka214N0huR3lmanlv?=
 =?utf-8?B?cVpFUTJwM1c4ZHBRS1dmK2NtQmVrOHpJaERpQUpqdGZ2VFh5R2VkRHM2SGRK?=
 =?utf-8?B?L2FNazdVaGxSUHN1ejFWb2pUd3JQbVpWaXZIdndhWW5kNUpuUGtoandrYjd4?=
 =?utf-8?B?dngzV21rZW41bWo3YjJQMnJwNHNDdXBaVmRpVGQ1aW1MT256NTNrdFpaV2t4?=
 =?utf-8?B?Z1FMdWN1czFTT2d3amY3Z0JvYVlnWTAyNy9kWEZmUzcwVFNlMXlHeDkzY3dU?=
 =?utf-8?B?SE9Tc2hlRTN3Uy85Z0FZQXIzbk5iS2ZUNmY0aEJDay9JN0E3cldXbXF6ZVBq?=
 =?utf-8?B?S1FzZnFMZklpL3ZBM3RtWWJHWERnNEErR2ZOTnFWNEx1d3ZTRjIvbVBncFJ3?=
 =?utf-8?B?TDYrSmUrSzh6Ymt2WUwzdkg0ZTdCVzBFdkFKQTREWER2MGRrR3lIUEUwb1Q3?=
 =?utf-8?B?MUxPSUV1RC9kNW5VeDNxYmdFUU1pdGt0eS9XN3BpS0RUY0NTVlFXQzhYY3lp?=
 =?utf-8?B?eE80ZnpwL3RrbGhrK20xUlU5OXNmZE9VK2srelpSeVNvaXFLTHZSSFhMSGlZ?=
 =?utf-8?B?cy9QSFNEYWZzOFhML2VZWCt6QTdXNEFZdXlwUWdKdVVPNlFzZ1hSWjBEUWN4?=
 =?utf-8?B?QjV6L3EwYWNmYVI4UzlESkdmSTZ4b2h3UjFTelRkMFVlbFQ5SGRha2JUWmRa?=
 =?utf-8?B?SUtPajV4TmtiNkI2U1Zrb1daWEpieG1PRWgrd3NoanRBb2J3cWZDOEViazV6?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273a5bb3-24db-4b24-323b-08dcfa4c2568
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:06:53.3636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRbXOh2CDaBY2JvHmc/BlOkrYdv2DLifEorg5G088liaaXX2iuR1Bblz6TReUGFLaT4s22uZtInHcI6X8r2kFYTTzwUVftg0DdM7ncu1+F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 709e823b9c7c..10bff48852b9 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -950,10 +950,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return ret;
 	}
 
-	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
-					    ipctl);
-	if (IS_ERR(ipctl->pctl))
-		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
+	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+					     ipctl, &ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
 				     "could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
@@ -966,6 +966,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable pinctrl\n");
+
 	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
 
 	return 0;
-- 
2.45.2



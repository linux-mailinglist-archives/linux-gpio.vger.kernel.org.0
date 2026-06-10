Return-Path: <linux-gpio+bounces-38251-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zBshMxRlKWq0WAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38251-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:22:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B21669AA8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:22:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=WzzmB8rV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38251-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38251-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A735D30799C7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD100409619;
	Wed, 10 Jun 2026 13:21:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF523409609;
	Wed, 10 Jun 2026 13:21:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097692; cv=fail; b=kQD8ztSguq8GpaFJfV8/Ec5B4S+vPru7Sb8lshR3IOYzWoPUf+Sz2Lnr/2ZXtRVqbhLHYqGHxov8RwLW1XcHGnlAu+m67Rm/SZl2xqTCVzQDt3TJn/RBA66v2G3khbh75YFHYzahsq1ip99Bb/VmsYLbf+6D6Cq34OjQPktL6wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097692; c=relaxed/simple;
	bh=y7J0T0Kva5KyRM03ennpFvCMxJRY9Zpk4k7sIaB8IY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JMG+XNgV6kYkMkzI5TG9GHX79D8KUE6PnSgskavrJ1WJfHiVxN5JaW9IXNF7VC1iI/EkkGglpCrtcNVJJ/acksDin8KsbrLdy2tQ96XU9hwcHODmC2TRb8pdEYPp7mVgJOw044+GHW7aCdsbYvNzkdgqxYbxDjZhw75p1UltnSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WzzmB8rV; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5Kp6P/a1MiFrq66swj4rk35/RPfrwT6L9dD8TQFuu3qO/V7zI2Weo07aTxRp/6YJ5XXNCyGdkWXxHxINp2czLSoBRuk7l4vCZ9JUJojEU/mvHlDb+7ylUxDozi2RsX9dOmp72NiKM581g+A6bcfRcZ0Go1eRhSrMWvay1+HHWipvQSAPf0wmArgL6A2NirIkmu3Y2KqQBnjJYiiecFI/7Zp5AAzsafUKBKYbduFyaWAUC7yyHKDTwMal2R7ZpitEqXR5o/3O1pnCixI/cw46+l5y5WpkZ7FGtlMmEHVhnOsNSuTr6xpYlGpujiQSViCyDeAWRBikBaTOWaOCg1a4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN0PZlNaXHXY3jBD/nIZdadYkpQCBvSXsUgS1tIqfEo=;
 b=VhZZlxT/Bq9iVs5FyserEXLZpHhpBv0IAixKwSfz4PyKjS+qpAOdPhy9WbhY/xbsq/p7dzOanY8boJGKTbiVX0x8sccyFvg5tvEDXeBtwtEnlR+KuUKN4xy2jb+9sE37Vn2ZTGf7sqFItgsT4/a1XMUMz4b3j1UBDQOb9lX1rcoAxc7ztyfLH15hGzmChIYouHRITZqomoyzx/ZUfuyp2hawU6RSmSLBJFHWft6Tq6CGEWW+OVxGPKCzH9YuQxjTzILJqxmSjCnV3pyRZotnx4HrCh4SMy4id7y8S5qwXhcq8t/5TufLgE+fQGc6EU1371e3PSL1QLclcXaPHWxdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN0PZlNaXHXY3jBD/nIZdadYkpQCBvSXsUgS1tIqfEo=;
 b=WzzmB8rV5MOKy7q5/E0S4c1oIJoziIjqRPYkijPs04SLRXbFOAcn2nN3Vx2BmMZHgMRLA5nYHnpEs7gIlXCXMNyoPrnjLLDPEWV+oTd/ZZPb+XIdYBsmIhuEx/L3mXrRR5eVlCtjXEVLhE5l0xtdrn8jgdsNRNfaIsJVAS6TZ3m/4QxokUwhScXrgAv7jnlTbUgC09yRMbGqtzOCtFX/FvJqMB68PDBjA0xzAuJk6vNEfao1RCD4xd/lxQgB5qeR5I9KjAulPgTrmj52wYvu62aLCGAbjVTeJyHU8sQukt1L21URlIscTilbKEKeYzZhuR/OTw3P7HlryET35YAzKA==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 13:21:20 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:21:20 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v11 2/6] pinctrl: s32cc: remove inline specifiers
Date: Wed, 10 Jun 2026 15:21:12 +0200
Message-Id: <20260610132116.1998140-3-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e0346f-a926-4549-93e5-08dec6f3295d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|921020|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 bfjL3oZ2cl8qWNSZBXh/sWEoDhiWaP5mD/qjQrKTuYEv1UtqDtPBZfXrl5hJ1fJnA5igIAGEMe8StIDxtRgXHujQZVtFY75Snw00bLBWHFyoj8LCeslr12HZqTCpg8rcjy46V2Yau38BbMjhIdcv86hNDKgTegZPjH9C84xrza/z9v8UuMvms8onx8vbemZMpHjfodtZguvfV5KqqpHJgFy27WLRwNvm4qqAmgA80HUn3RfjTaBCmSrINek1aeicu8VPCInid+o5E5T7ReNOxuAhl3mjIn3zp5ab2V9y9C4bNRtGEHkk9RoS81znBH1VbOqMaxiQTZmo9z4wYZsai4OBfnzJTDjmJguX29prbusqDfJ8kIfzUOZ2NumErRxC5cUdWdUJyyXqPy8y7kdoKz1vU/pDuF4xVCGkxFXSfRaiiWEwgR0GDJqZ+yTPXIVWsYClCtEn7ZXI+4658nF3TXkmGj3hTHblk/4y0vWMcLOZvRQmG1oEXtfE7isJYsAXpBMvr42I2afqdUi2xDH/LH19kU7MIR2KyQExPTltZOkhYw0NSswySBP1QasSwr/xTNoDX7K8zEA+3tyh4fWKTevWyhb1zipcAhs4ySGgGywer2ctkpbVyUeDX8qCNRJm3HfdJOoWGhiAAVyZRUt/OExHmvQNqjDIL9skZzl46e5FZMLDnTMBdNbhr5+2HcoafB+d/woGg/Oq5//HiUCzmKI+4fH4stIuDxlGQgiV3uU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?KzY2dUl1dkV0REdXZ1k5eXVOdWZLUkIySjBSS3djWTk5Yll6eWdVd3VlcUFH?=
 =?utf-8?B?VnE1RFFMRWVmSDFoMklkNjdJcFlzMjcybUVEM1Q1bHMyNjRuNEZZYzFybXV5?=
 =?utf-8?B?NjRkMy9PRmxUTHdwVFFMMTV3SE9pT01SR0RIcitEb1VMaDVjdlovNDlYbDZm?=
 =?utf-8?B?N1lKUzNnMnVDaGMreHhWcXhqQ0xCNW4yYSsvK3hMMFFtWGdyNVdzQ045UkpJ?=
 =?utf-8?B?WWZTdkgvYUowUjcvempWa3JoQ3FYc2xZcXl1U3d1aFRGa1NhTWZvK3BKN25h?=
 =?utf-8?B?V1g5Z3dCSXo4cGpvTVI3eXMzSFRlR0tRTThYS056UWdkaDNOM1RTQlZ2Nkkv?=
 =?utf-8?B?VEpodXNnajNQOGNGRVhXYmNEdkJsamNEa3FrWk5mTHJaTFBWSGpqSnFYTVQx?=
 =?utf-8?B?UGEzTkx0MFZYTUFsZ3V3Zzd5MkphTndMamFkSkZqbTU0TjZkaUZTbjhud2ho?=
 =?utf-8?B?M1lTNXVScVNNOGxETFZoaVRCSFBGOC8yQ0FsODJZLzBTeWg0aWxGT2NFYjZw?=
 =?utf-8?B?clhFbDQ5M2t2YkZKd3Jyd0xERHJGOUl6WkFoYWJPTDI1Q0pLOXpxZHZ0R3Vo?=
 =?utf-8?B?b1Q1RDRDOWkyd3ovdGlCcXl4ekp3SXJHKzYrUXJrZUJ1TGhDb1g4ZGJWcDFh?=
 =?utf-8?B?N3pDK1pJWXNudGs2TnZsaTd5NW5wTlp3Q1lQNno2ZURLeVZGUEdQM0lUVFZh?=
 =?utf-8?B?NERJeDlQamp1WWpUR0x3d2tqVXMrUXp1VXhReTV0YjV5bkd5R1dUWUNOSnlQ?=
 =?utf-8?B?bDJPV0VyQzhDcUxFK2xsTmlDNEtmSm5BeTRPeHIvcHVwRG82SGtCdDNGeWtN?=
 =?utf-8?B?STJlWEJ6cWNSdmcvdkJMR1pJY2E1dlVkRHpmcHpMMzdiM2tjMHpuckVmRm9M?=
 =?utf-8?B?MEZ2VkpXdW52dWxWNktORGJGU0IvWE5JLzNtcWNJNzQ5ZjNCNEgvckJ1d3cy?=
 =?utf-8?B?bERhblZVME1YcEx3Qk9wUk9xblJ0NXlpWHF0M2xlY09ZVGZMQjhvYUJRM0dk?=
 =?utf-8?B?ZEVJVDJicnpEMzFUN2UvKzVyMjQwMlN3RVdpdXU4OWxZTExycTkwck5nQjFk?=
 =?utf-8?B?Y2xuMUhCYXVYQjNLc054L3NUMDRwR05zS1ZjeDd4YnNPeklmeVgyQVJsVm5I?=
 =?utf-8?B?dnpMMTRwVytqRnlRV2lSSVVFVVQ5eDJRZjI4N0UxU0c3bGFBRUJmYnB6MlJI?=
 =?utf-8?B?UUI0WFZCcng1ME1aR1lvenhiN0xyeU54TThvcSt0VzRtY3hQQ3huQWdUaXFw?=
 =?utf-8?B?UjJTQnZ2amZNVCtFTVdOc3VFSVVoZUdVdzhGYVQyT2pCMUI1K0wwOTlxVnk2?=
 =?utf-8?B?b1JYVmVabWtvcWxoL0NpSXh1WWRlUlRDRm5COFNFUjF6RmVmWjhYOHJrMEJR?=
 =?utf-8?B?b1NyZE9XTTRNN0ZsSHVVblhSaXhlVUF1bHc2NSs3TWVDTVNkQWQ3em50VmFO?=
 =?utf-8?B?a09sdHV5YkhoUUpZUy9NVDI4a2E1ald4SGRYekdrcERTaGJ2ZVEyNDBCeE9T?=
 =?utf-8?B?QStMUXB4dTYzbm5VTlE0R2lEbWlWVGs1aUNDc2JjaklBdjhRL2FWeEFzOVU5?=
 =?utf-8?B?bjUwVVRwVXpybGx0QXBNOSt2UjJsSnJvNFhRZmViK2RsQk9SQk9TdEVNTU9O?=
 =?utf-8?B?Z0ZINkFPb1VYWElaeHhkUncxTWxRUHNrQlNDOW5lZS95QzRYK0ZSVlptK2JB?=
 =?utf-8?B?b3NQckRpZ3RvOHdkWG5JbCthNUl0WWtTK2kyQkVQbjNXNDlyOUhVMmwxVUh3?=
 =?utf-8?B?Qlpod1hFaEc1SmJQcVdPQ0hIcmpBWmxoaUxZS2toWm1TR3ByRnNtdW9welpr?=
 =?utf-8?B?d2VFazZWbERIZTBoa0pGbm52eEc5MzkvamxPajVpNWVoS3RsMnYyUUxjRitq?=
 =?utf-8?B?MnlPVGhrUTA1Sk5kb28wZGE1Uno5K2pFTktxZGZaYUMxNlFmcVdnTXFDTThR?=
 =?utf-8?B?WUhIV3VqUjFaZkoyK3NGaDFqUW5lZThJdnBKTnJuTEk0dmNuamRKanU1MVYw?=
 =?utf-8?B?bVgwWEg0a2NtK0FFaDZKV2VLaWxwNEQydk5oYi9Mb1dDbVA3V29yVWlKK1pa?=
 =?utf-8?B?VEZKcXIzV2F6TWJSb2YwUjlmNFBrN3VOZG84WGN5clhVckkvMmRucTV6YkE4?=
 =?utf-8?B?akJvZzloUGVlTEcwM2pVUklSZlovWE9GWkxqVWsvdGRYSlg4bjJ4dEdwemV2?=
 =?utf-8?B?QXZsRkNYZnVkMXhIY1M1d0V5d3Eyc2s1b3h4dW5YMmtVT0hoblFmcEZKMDZX?=
 =?utf-8?B?WmJMS2xsdnp3eHNaV3c3My9aTEJhT3pTVExNb0NVaU9pKzVNRlAxbTF2TS9Z?=
 =?utf-8?B?Z3BNNVZKOFY4bnlxOW9qVXJxdGROMVJBbHZWUkFKVEd5d3RRZkNVd0JrNkFI?=
 =?utf-8?Q?bGSikkNbOKckEBtR1nb4/pnjYUPuyo8uqYjbn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e0346f-a926-4549-93e5-08dec6f3295d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:21:20.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSmUF4pa2AcPqJwKEYhHXI6uWVgULri+EXU+dIaP35X/zU3VDwBPKKz4oK4Wia2hldbxY11fEYZ+fzlSX+BAvqh1NosB0imQaqeQ+C8nUCggBNRsyiIXple1HsXdPRyR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38251-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,oss.nxp.com:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75B21669AA8

Remove unnecessary inline specifiers from static functions.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 4f88c24e62a2..2645a92df0ba 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -131,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev,
+			 unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
+static int s32_regmap_read(struct pinctrl_dev *pctldev,
 			   unsigned int pin, unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -153,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -171,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -484,8 +484,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-- 
2.34.1



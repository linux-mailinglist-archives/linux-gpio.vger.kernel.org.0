Return-Path: <linux-gpio+bounces-36074-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHqBJ+ad+GnHxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36074-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:23:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F34BDD28
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65AF430285C0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DD83D903F;
	Mon,  4 May 2026 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sGoo98xI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7B3D88E5;
	Mon,  4 May 2026 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900480; cv=fail; b=oEJcmkE839ay8lG/fOnudpQruUK8uZvZLRB34S3TGb7MrW927cZWAmZBqmi9Z5sQN1QM7ygO7BouQc6edBu6rhJjInLm74SlV1C40UA2q32OimAwgMI1+JCURsJ58jYvv7ZAhYgjf8PPzb3Y2zxxx02krZVdhPMJgwQySvsZpEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900480; c=relaxed/simple;
	bh=e4KxkAUksGGJHvD70TV5qwn9QHGp0cQIUaX1ze+qyaQ=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cg+z3FKgCuXWCI0DbVwu+SqAg57G/VVrkMY5Dd6cqSlJRf4Lt184BNXCDCHTjylVwzN94v8jiyqalE8PIcT9DoziGSYPYODt/LEuAGLYjHjzEpzzAqAtiw5IiqGE2h7uD0uxXGqGNWSFZOt9p0vaavbTiFPs4kpkG5rodDPJPc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sGoo98xI; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSGk2zjDr3e9CEUdR65tmpYmIffo9FnaAZkoWj2sJRKTX5bndR2+E0NWLR7qI+4eb80R9zMu/AuTgYNDH5GS3uXnGgiqaZLBezM87bO2pFq0IzPgxDMonrsCgl1EvGxrNHfNbFA/FVHXwzE2mVbcdyHlJrwfgR7L7awcoHzDLIDzz8GPL2j1EFN9NouYuT1vL9205t6PXHb5dfg8OI8hj/18EBsq+abRDlOT5vV+ZBYUEFmgBNK4LVmaHi0alfjMZ3SsjPuRkXUllBuiRfXfvYd80LzusnFIu9KaLtqTTaVA6qDDf6lA/DpSPs8JvOFvd5gzcUiVT91zcy/cxnyDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OOvef3xR+AqLKiJ0ijPww2zijXxIQ7oqc8uUmna4jM=;
 b=GantZrXkHvTRSgHK1JwSuDPs34+bBu0VDriz7tLd2w2Wr0UC6sptFI1ML8uBCemQSZCr0rNpqHGuyMOtnKgg9rxhS79OcqnweAKRagiISmj4t6FnQoJOifpuW1ML5CBDc1zcVjKd9ti5wjHnpU21Q/87PohuVu+ZJ+CPhFKJLe/sFTyFZqb1Pg4MXTzeWt/E6V8mi3oxRVni5ICJq7PznH787A8xdcmo3qZzlk+H1jP1DQTdzBxQG21dpp8wmLGxdI/06TV/nOGFDCCKY4ayJXsG+7sv/gv0b8HYmb7w7iNtj32uNNZ5Rb2llH5NQ3bNblM237GxDohs9Q5J9WkwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OOvef3xR+AqLKiJ0ijPww2zijXxIQ7oqc8uUmna4jM=;
 b=sGoo98xIJhPSH2PVVsOZiWZbTQAL9llMTUNUvNkUZs+LF2facAJYDzsQpnVEyfCenrHo/W3lRs0VpvAtAwNLeq8jcHv4B9ZB+7VYZEUP/xnIv+qTV0GnaHhdnZknjxAazR6TO/+vxvAC/j4qoDKEGWOVudZXKKQnYvbsoPNcLoC0Mhv4A7VE+U5OMSfdZVqa3u8gqKVP8FLPaLS3R6o3qeLY6t7NraF8SRNkyOdz45+YirHNRwMEA1SvQA/QAsT3EJa0y6N7nHT9hAm0Ynj7omHWAIugni/JoH25Gx2cWmh38GRoCDX4U9Ck+ax3eXhXzy716v71NJ2Dj0I4xvxxtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 4 May
 2026 13:14:35 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:14:35 +0000
Message-ID: <ff46b56c-ef13-4726-8cbe-062a0755986f@oss.nxp.com>
Date: Mon, 4 May 2026 16:14:13 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] gpio: siul2-s32g2: add initial GPIO driver
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0243.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::16) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c17de3-1b8b-4d7c-5808-08dea9df162f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|10070799003|7416014|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 zrBZOM3a0ExSNKBrWo85V8a8m9LhB93Pl/sMCWEvixHDBkluOywTHzhzb10Fu+WlVkxRDsZAHI7siJwL1Ve88pmrkN9yI6Hq++Pr9efPgiEl1CU8OrbznZ4bg2acAkHv1N6CJHhAq1xJa9dybhWXrDvl+WOLc5uGzepetG6pM3vN8NG8l3B88xDoGjpTRBD7daxLPPdaWIJox8psYzRxkby8bFHnJfU27Pk76sR8+zQkZAGpxNrvMgW7dSvaO4hukvV+dmblu3vjr1EASyn5Nt34AzUUb23FI13i2VjrPSoCo7nZ4pWtDB2tznfM7rvDUZyjDOEFnYgX25Apz11B4d0cOhvORQWlWkAP2W8epZnk/jhYAZHhhB7YzNs0lA8tZzKXSTsi1asXM3YgyRKWkTLvUWTQ+oZrleSdTULi2AZhGWIL3eE5DAh5QbK7xCNXsaLw+0MQunwiN4AL0NWWzW31gsKxuuyBA1Ku48wu9PIt12d26uiuGIM2Rbdpu4jFwRAuD9a9WRs7P0vUXjl4XJ9/tmiGj57zSWuaxfpD0PysHv6vMQcNoQnCDZGUzf8nkDN9+xbL47Wm736RlmbfNM28uE39uJlU17C5fJjCjb6jhSRC+7uE1Eab2b5/YvjG/9tDhGglEDyU49ol+xeMYPFSq6E46KTnEEnEk0dtMf0V9YA8lyXep9Tm+fyafWXlslZSO2Z48K4Mk1ROme3olyaVA0ESXJ8CYmytOZL+q6o=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(10070799003)(7416014)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VTZhbnFTeWhBZS9hSHpndUt1S0w2WXlQUUtIdU5nUkNNd3RJN3ZLUUN3RDRi?=
 =?utf-8?B?Y05UTFM3SlA5SnRyR05ra2FpWUJneTdVRG8raEJ2SCtQU2RNNTY5Y2hYZVNx?=
 =?utf-8?B?N0t2aE1wRkMxSG1MQVpjR3NMWVlONG40d0c5R2RVaFliaVBiVjBpd2tFQmNU?=
 =?utf-8?B?Qk1qVE9FUFdmUGRpdnZXNjhhWTcvZm9UZ1VEODl4RER1S2NYTzlRbkhEQUlN?=
 =?utf-8?B?Y2Mxa2Mrc3lOd25QZTc3ekFIWk11L2J0Z1hENms4VHM1Y2dxcDBtSC9BeEto?=
 =?utf-8?B?VnRBanU2czBuV1RWdEdIcS9rRS9ib2pOYjYyaEEraEt3SGxhQzRaajBQeGdO?=
 =?utf-8?B?emVDSEdwb2VCUEhUU3haZ3FadE1WU1RweHFTSFBscFN5WDJINzYyZEZUVit2?=
 =?utf-8?B?eTNPeS9VQmZheWkxc3BXcS9HQm5tRndSZ2FqRm4xdzdCRXgxVFN3UmRWa0U5?=
 =?utf-8?B?bnRxU0JRYUpveVZDK25SbSs3aXE0Z0tIeUNxVnJwc042SW5lNEI4bkVUZTVV?=
 =?utf-8?B?cGk3TEdSTzM2SnV5bm1KUEY2b2hqV3BGNmppWVd2RWlPV0VxRWdPY3RUNkcr?=
 =?utf-8?B?cGhjcEx6UmM2bWtXME5Fbm55YkNWNCtPRjZMMU90a2o1N3MxNFJJaVVEcEFI?=
 =?utf-8?B?d3N4WndRM0ZmejFYZUJPZC8vME5kcjgzTFdqU1RnMGVJMC9seUVDWithVWEw?=
 =?utf-8?B?blVHWW81ZzdubmJsN2xQa0IwSStQS1lTd0p6M3F3eU55WlphMUt1QUJjeFVm?=
 =?utf-8?B?dkRmNjVjZmFGOUdmN2puc3U3bHJQTC9mNTVoOEpqc2w3WkdFYitYWXoxVEp0?=
 =?utf-8?B?Z1k5NjNyQ3Q4N2x5dm43MHNudjg0ZGxlaGpuQS8vZFc4UE1jTDdCaXE4UEoz?=
 =?utf-8?B?MXIyNWc4WC9QUlM2eFJaKzVZM2ptZGwzdGpNY0VESWRURWxBQkJzNXNwSits?=
 =?utf-8?B?VWdNcXNMOUQ2aFkwcHBLQU9EeDhSNVJLSlNMTjJZOGhSTTlzNmZZcHdJMWIy?=
 =?utf-8?B?dUhHNzB3T0dDMTJCSzU1b0FEK2RoWHA0TmNUT25zTjdEN0tkdlZVbE5UZXA2?=
 =?utf-8?B?bjd4QytZbElENDA1WmVISzZIUTBWUXdOdXIxVnhJTW5zempFN29QeHp6TDcy?=
 =?utf-8?B?bG05TlBxS3p5dXAyMTNndXBYaExQOWdWc3dwdXgrRjZhTUZ4dkZ1eHJ1Y2g0?=
 =?utf-8?B?Q0I2U25TTlEwbmZzUk9rUFZYaDNQd3ZJWkJad0M3dGQvN1VmeXJsZXowQitM?=
 =?utf-8?B?OEZNVW95R0hwOTVYRGJrRjhzdjVYN0tKdUNTY2tDeXNuejFLdjNxTlR1bTY1?=
 =?utf-8?B?THJvYnNhSy8wMXlmWlFOY1dnK3FiMWRTV3d3UXRMNjRldUJzdC93UGZndmx1?=
 =?utf-8?B?cTNxNjU3OHROVElZNEFYbnhJNUlhVWxGdXJGejhxdjNoZmhRTEEyMlF1dHlx?=
 =?utf-8?B?bWtvNDBGdVUrKzFuNjZsYkVQdTVEd1REL2lsUER6RWo3ZVBDSHVUM2twanpj?=
 =?utf-8?B?aUVKU2EyaHdBUHBqSVUzOG9KOFhsNWFtM00rNGhWd3gwaldVZUpEMktkdW5W?=
 =?utf-8?B?Zmd0L3ZuN2RwYXBYZHRReWdwN01rdDNZdFFoZmNmRVZZcVp5eDV3VEVtZExi?=
 =?utf-8?B?bk5wbGpnQVVRcTVQV3QybXgyVCs0eEFNNE9yeXBYbkpGcUF5OThCNEE5WmJq?=
 =?utf-8?B?ODRScm1mNzV4NjB2cnBqZEJ1UlBhc1FRMU1NN0lxUVllYTlhc2dIWCt3US9X?=
 =?utf-8?B?YnJJMkpmTVVIWGZxUzFkV3dVcHZ1MGpqQmNnMm1tS0hoL3FlSVI4VEZXeklZ?=
 =?utf-8?B?WlBjR0JTYUVOTmhKUkNVVHhoQU04VTVRSmdMT25adzIzMG9LKzdscURMWFpL?=
 =?utf-8?B?YUZSUnhja01UeUR4V2QxNnNCek93cHpJdGVDSGpTRHBqM0U5UFlubC9NWStt?=
 =?utf-8?B?a2g3Qnprb2VkT2pNNXZLbjZ0L0tGM3RMcFFyMXNTSVg2U1U0eVdWWXpaeHRU?=
 =?utf-8?B?NWcrdjF3TmMzMEUySkpseG13eWNaRElGbmtxOUZWYXp0eEQrNFNMZysvL1d3?=
 =?utf-8?B?Z1Rla0JLUDY4L1h6TGx3Q3JocUlxcVcvczVoSWM2UVV6bUw1SEFFZzUzZ3My?=
 =?utf-8?B?RVc1VUdFZVFBOUU4ckJuUk1wbndCbGQ5d1AyT24zbmVySXR1TDR4VE80NTRC?=
 =?utf-8?B?Q1Z2UzF4UTVwOWxucXNDVHdRZ1VHNXZWSjk3UlpORmdrUDhRWEtySmhSSzF2?=
 =?utf-8?B?Y2pOOENJNEtSbzNiTmFoUzFXZGdoNDN0Ry9HY25nYyt4cVppQjNkYzB1ajhw?=
 =?utf-8?B?c0VXdmVEWVFibWFreVUzZUFJcXBzU0pYSnJLUVA4aE5tZUtMelhVZ3loWDMv?=
 =?utf-8?Q?aj3DzIDhMM0v+puemhsMFFt6o1XMSxLPnW2UepLu3vR7N?=
X-MS-Exchange-AntiSpam-MessageData-1:
 iKO4lPuHtz6cveqwx3071XmtEAMLybRL0pq38PZMgydWnUXINxlGVdLF
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c17de3-1b8b-4d7c-5808-08dea9df162f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:14:34.9586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0Co0X5rIq3O4WD8zweK5rjoBwS6W6kIyFEF67TfH417yExv7Vhx0Ela8IrGgeKw7vZz0Zjy1ck9x82/Xdsdx+VG0RI9tOTAVJXJPrSOxwvl/lzzS9rhaEQH7sRAOho4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
X-Rspamd-Queue-Id: 0F8F34BDD28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36074-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.nxp.com:mid]

On 5/4/2026 3:41 PM, Khristine Andreea Barbulescu wrote:
> This patch series adds support for basic GPIO
> operations(set, get, direction_output/input, set_config).
> 
> There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
> However, this driver exports both as a single GPIO driver.
> This is because the interrupt registers are located only
> in SIUL2_1, even for GPIOs that are part of SIUL2_0.
> 
> There are two gaps in the GPIO ranges:
> - 102-111(inclusive) are invalid
> - 123-143(inclusive) are invalid
> 
> Writing and reading GPIO values is done via the PGPDO/PGPDI
> registers(Parallel GPIO Pad Data Output/Input) which are
> 16 bit registers, each bit corresponding to a GPIO.
> 
> Note that the PGPDO order is similar to a big-endian grouping
> of two registers:
> PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.
> 
> v9 -> v8
> - remove the SIUL2 syscon child nodes from the
> device tree and DT bindings
> - remove syscon child handling from the MFD
> and pinctrl drivers
> - remove the MFD driver and use a single monolithic
> pinctrl/gpio/irqchip driver
> - add a new compatible for the pinctrl+gpio binding
> while keeping the previous compatible for the legacy
> pinctrl-only binding
> - update bindings to include the PGPDO/PGPDI and
> IRQ register regions in the DT node for the
> pinctrl/gpio/irq binding
> - add IRQ-related entries in the bindings to
> document the intended hierarchy; IRQ support
> itself will be added in a future patch series
> - update DT nodes to match the new hierarchy and
> compatible scheme
> - fix dtb warnings
> - reorder commits: bug fixes, API changes, DT bindings,
> driver implementation, DTS changes
> - split commits further to separate minor
> style-only adjustments
> 
> v8 -> v7
> - remove all ': true' lines from properties in dt bindings
> - remove NVMEM MFD cell from SIUL2 in dtsi
> - remove NVMEM driver and configs
> - expose SoC information via syscon cells SIUL2_0
> and SIUL2_1 in MFD driver
> - add SIUL2_0 and SIUL2_1 syscon nodes in dtsi
> - add patternProperties for "^siul2_[0-1]$" for syscon nodes
> - update example to include syscon cells with proper format
> - remove `reg` property from pinctrl node in dt binding
> - update Kconfig help text to reflect new syscon structure
> instead of NVMEM for SoC information
> - squash deprecated SIUL2 pinctrl binding with new MFD binding
> - dropped "nxp,s32g3-siul2" from MFD driver match table
> - fixed commit messages
> - fixed dtb warnings
> 
> v7 -> v6
> - fixed MAINTAINERS wrong file path
> - add unevaluatedProperties, change siul2 node name, remove
>   jtag_pins label in the device tree schema
> - change compatible definition in schema
> - change node name in dtsi
> - mentioned binding deprecation in commit messages
> - split mfd cell conversion commit in two: one for the
>   previous refactoring, one for the mfd cell conversion
> - removed Acked-by: Linus Walleij from commit:
>   "pinctrl: s32: convert the driver into an mfd cell"
>   because of changes to that commit
> - deprecate the nxp,s32g2-siul2-pinctrl binding
> - add NVMEM MFD cell for SIUL2
> - made the GPIO driver not export invalid pins
>   (there are some gaps 102-111, 123-143)
> - removed the need for gpio-reserved-ranges
> - force initialized pinctrl_desc->num_custom_params to 0
> 
> v6 -> v5
> - removed description for reg in the dt-bindings and added
>   maxItems
> - dropped label for example in the dt-bindings
> - simplified the example in the dt-bindings
> - changed dt-bindings filename to nxp,s32g2-siul2.yaml
> - changed title in the dt-bindings
> - dropped minItmes from gpio-ranges/gpio-reserved-ranges
>   and added maxItems to gpio-reserved-ranges
> - added required block for -grp[0-9]$ nodes
> - switch to using "" as quotes
> - kernel test robot: fixed frame sizes, added description
>   for reg_name, fixed typo in gpio_configs_lock, removed
>   uninitialized ret variable usage
> - ordered includes in nxp-siul2.c, switched to dev-err-probe
>   added a mention that other commits will add nvmem functionality
>   to the mfd driver
> - switched spin_lock_irqsave to scoped_guard statement
> - switched dev_err to dev_err_probe in pinctrl-s32cc in places
>   reached during the probing part
> 
> v5 -> v4
> - fixed di_div error
> - fixed dt-bindings error
> - added Co-developed-by tags
> - added new MFD driver nxp-siul2.c
> - made the old pinctrl driver an MFD cell
> - added the GPIO driver in the existing SIUL2 pinctrl one
> - Switch from "devm_pinctrl_register" to
>   "devm_pinctrl_register_and_init"
> 
> v4 -> v3
> - removed useless parentheses
> - added S32G3 fallback compatible
> - fixed comment alignment
> - fixed dt-bindings license
> - fixed modpost: "__udivdi3"
> - moved MAINTAINERS entry to have the new GPIO driver
>   together with other files related to S32G
> 
> v3 -> v2
> - fix dt-bindings schema id
> - add maxItems to gpio-ranges
> - removed gpio label from dt-bindings example
> - added changelog for the MAINTAINERS commit and
>   added separate entry for the SIUL2 GPIO driver
> - added guard(raw_spinlock_irqsave) in
>   'siul2_gpio_set_direction'
> - updated the description for
>   'devm_platform_get_and_ioremap_resource_byname'
> 
> v2 -> v1
> dt-bindings:
> - changed filename to match compatible
> - fixed commit messages
> - removed dt-bindings unnecessary properties descriptions
> - added minItems for the interrupts property
> driver:
> - added depends on ARCH_S32 || COMPILE_TEST to Kconfig
> - added select REGMAP_MMIO to Kconfig
> - remove unnecessary include
> - add of_node_put after `siul2_get_gpio_pinspec`
> - removed inline from function definitions
> - removed match data and moved the previous platdata
>   definition to the top of the file to be visible
> - replace bitmap_set/clear with __clear_bit/set_bit
>   and devm_bitmap_zalloc with devm_kzalloc
> - switched to gpiochip_generic_request/free/config
> - fixed dev_err format for size_t reported by
>   kernel test robot
> - add platform_get_and_ioremap_resource_byname wrapper
> Andrei Stefanescu (2):
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   pinctrl: s32cc: implement GPIO functionality
> 
> Khristine Andreea Barbulescu (5):
>   pinctrl: s32cc: use dev_err_probe() and improve error messages
>   pinctrl: s32cc: add/fix some comments
>   pinctrl: s32cc: remove inline specifiers
>   dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
>   arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
>     node
> 
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 107 ++-
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  26 +-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  26 +-
>  drivers/pinctrl/nxp/pinctrl-s32.h             |  15 +-
>  drivers/pinctrl/nxp/pinctrl-s32cc.c           | 646 ++++++++++++++----
>  drivers/pinctrl/nxp/pinctrl-s32g2.c           |  25 +-
>  6 files changed, 707 insertions(+), 138 deletions(-)
> 

Hello,
 
Please disregard the submission of this patch series.

I have resent it because this version did not
have the "v9" tag appended in the patch subjects.

Regards,
Khristine


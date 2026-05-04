Return-Path: <linux-gpio+bounces-36052-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKBPMSSU+GnRwgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36052-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 487264BD0C3
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 673B03017BF3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 12:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190323D5236;
	Mon,  4 May 2026 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ruy/x3rj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47613D4102;
	Mon,  4 May 2026 12:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898527; cv=fail; b=kZvuwr2TZFIovsHgG1FUHmQLzySLmQ+HPy7gYqXmwtpT2yH3NMq7+Z+IzlvZy+fjBC2wwDV+1Cf5V3ltCtqy2pxg/VrXDE6t/pif+gL5dDoqH1BU8HcuLGn9DzpMRoAL2MP1cDbFFHKKxhh4ESivmza2WuuPTo4e+/VyWUC7s3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898527; c=relaxed/simple;
	bh=viYrJZvAoFaCnQ+NcUzGpYRlBWquC7Ek/P6vyrXZXgo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ut0vIcvQssbivQuNDvPzp0cM3NyzktbwcldCbJvQc0Cm+0lxROjaoXY9EdufeBvD0PTJ1JsMfx0JgUw/VJwfPswQC7ohgcFnmHPzerygtZS7lwh+YiSJ6C4XJGJvprdK/CJTKdIMzoAuPuLu2LTVBDoq4QoAEXPGC0cA60ipAy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ruy/x3rj; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLxWsuG+HMWqxfKDBbkUStBg9sX51Ws3z2fCLXldHCBfbfw1Lt5EKcgzePsT/CWmQV7N3Ecb4gJNpgOSLmLws+jaJptWERBplg8yig9AZRB6tV/jC9zyj/Z6CbPNdyb3KrguiyP0gCPOsQrcqAyH55C+YKnDE7YSLDRGPSTRVJXcuokR0zKsd/YwA63flnS/dQXo7cK+HZXPYcT/UkGSUg/hYTGDRgVmAoL3PUsj2zzD2scM4LhcvC0HzooqDEopj+kwvXhN0sYJfjdBXyUEyyhFvqJflk5VkwnOYpJ125sQrgYMwiHUCTor4zhZz4nCagGpscZ9seeiIn699OnYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XjXvTGKdJaJUyx/54ihHaDocRNGeP0r/cUrUhwWfbQ=;
 b=fAJKMbv06fla6HKAST5ZrsnnSvSLMh97skA+g7F+jdKUYn4793+bOP9IiChW0nlWSmKGtP1bie8jDCTkttrQqliLV9WygIGtxGeEjBepedJlyoIedMCGndodEEItKjwuJs3fhlpwfPybFR08CbjwuNsksiAwIw1G9IWG6s19LNKZOX/wZAYTVyfzMXJoedwwUtIwgL+9nPQSTWsLKmT//gRhedJvS4KRwaYSBA6LkT56ccUdl5G0VTed+f5yIdc735OIUd6pitACWuDZr8KU2idYa2ImWOBZ4vVPpVS5YTMMfrsyP7++N1gsOeeM3Glb8aOipDAc9ZBgOgdwBo7oaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XjXvTGKdJaJUyx/54ihHaDocRNGeP0r/cUrUhwWfbQ=;
 b=ruy/x3rjJqOjuOfaA8URsxzlkInGDgT4tMvJcGBOEHp66nOkj8m2YFwbmoDiZbkbqbXMjJE1dPtJzmnRI718nUzC5JvimIMah7uJeSlsye2aVkjW2Vth7T4+7FgTwh8d3gBEGgzAsPZJE17H63Pf85JV2DzWgZXGTzqIHYEDp8tMyEqF8iMaCXfxptRB3kU5UwkmURfPc2tz31um1E7fOswAnGB2bPlbroPeIVWbRijcnQ0vLH68CSMbH6R8P1bHdklFzeU/FjpU+mog+lSWXCcu5Wly3FFKh9H8H99bIRQ8sWIPtUIwns86VLGJVBG58o6uNlewimiR03o8JZK8+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA1PR04MB10360.eurprd04.prod.outlook.com (2603:10a6:102:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:41:56 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:41:56 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH 0/7] gpio: siul2-s32g2: add initial GPIO driver
Date: Mon,  4 May 2026 14:41:48 +0200
Message-Id: <20260504124155.3615001-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::18) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA1PR04MB10360:EE_
X-MS-Office365-Filtering-Correlation-Id: 536a98ab-48ce-4dcb-fcf0-08dea9da86b0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
 xLKpIiMgPl193+eseahcZCHG2vBXaWYFPT/SyzElCB623MJM6nNGZX0u3RZlBbqGm4I+d484Wrw7h+EnCgEAXwipCh5RZSckx/gfwi7xbXfIQWHEgd4i8+2nFlWceteVA0+xIuNaTxoedZRSqiqvdqeWmJU/97x7s31uvcSaNqvzm3lrvl8V7o6wARpWuLaq7mwqhTozYt3TiE/fsTf2TbTJZ+P9APRhxgB9/ynCoYN7RMkMkwrlUGqRYOrT3L5F6+fEdHTyevP/MT9TZlFLUbygFUjsmeGoQD0PguuF4CmmShYNmBNzbDBUOKDMQEuG64N6VH3EuGN8/E7s1cYHuD38ds7mWzBlbrFX9fBpeok6NL1VaQ1H/sdTfF7h4RXCd2z+Ju3XJH0v5BX1XnaC5NxraG7M70cewyw+xEZJHbdqPqesJSPvJuVjcG4X/FoBRR1fP3rJ7aHBNYUs+n3YoLuK5R3jmXGPxMCJRsYtTl7R3L6OoWlB6frug/V1OkFqOasVigE4ADgKqQeKHWv9YTSzAQB+ckk2lZxqNufP2Kv6lZZvTZuDoNQws69VyeN52jDvGJrxfS2eWMEc0mFytBVccDDIqVbo73/481mcAS+j0hL4aI5u0G1FLcCg4SQ4z24qAgmga9ju3VcOgwjk1gjwvVm0FfuhJU7TPGqgonSsFfxzXYe262zvMCCeBDb5ZNcyN6JVQXuiTc4KrSJtuJ7deZFhHsiWpgiy6YjWbsg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NXBHSGxSWGFtQ3I1YkpiRnlJZTVMV2F0RXZIT0lXREVKRWxPbGRpbTRRUTY4?=
 =?utf-8?B?LzZuY1ZMbjVkbTdGaFpGNy8rZ0Q1WiswVlg4dnBlWEY3cU9HVmxtMWRqOXZs?=
 =?utf-8?B?UktmeHc2c095Ky9rMzFkcGlpV09keGNiZ1BwbWZvblJkbXJXNjdSY3NYa2Ra?=
 =?utf-8?B?VWk4TFA2bzNHbkp0ZkxaRHAwMVp4WXhrK0VWVXlkM2xGRSs3Vk9iVlgxaHZt?=
 =?utf-8?B?WHJXeDZkdjN0UUZkeEFScEkyeW1aSXgvdlF4Uk1pN1EzQVhKajYxTFV4dnlH?=
 =?utf-8?B?OC9NdW9PQUJDUGFaaThoRkRsc3NpUjhMVkFNcCsvV0Z0SzNmaUJ0R0VUUGkx?=
 =?utf-8?B?dUN6TEpCY3NLZXRDamROWTlZMysyNUVTRG9hL0VJUmVBUnJtWjBZODF5Lytq?=
 =?utf-8?B?cnZ6WTQ5U3BHcW8xWkJqY1phMjhJNXVmWW5GZGllTEVnQjQreVNQMXBIM3V5?=
 =?utf-8?B?OWg2YmluY214eVJReldwZmFVQUd1SGhIOFlDamN5R0VVUGNjQmNRNUtNMDA1?=
 =?utf-8?B?WnJ5RXJ0YWhwOCs5WFgzQXUyenFxWmR0Q0FPczVJa2xGVzBRV050cHduendw?=
 =?utf-8?B?WDNDOS9sY2k0a2lYTFgrQStSYnNrQzN1czRRckhWSGRGQkxDZ1g5YzM5RDNh?=
 =?utf-8?B?MW5LUTk2cEFqb1k2aEdxVHQ1VWxReEVxQjNwelkrRjkzOHdMZDZIVWFpOFho?=
 =?utf-8?B?N3pRRkphenVQMThFSzRZeEllUnJZUDZpM0RkWS9laVdiaWI1Y01HWmkvZity?=
 =?utf-8?B?SVdwc2k0Tmo2VWFkb1MzYjBQSkVuV1pKNExYVDJvd2U5SGJxZm9MbUJTL1lS?=
 =?utf-8?B?dHpPTDZSbWxtaTloVENPS1Q5Y3BzM0xJM21PWHVZamNFdXJmT2M3Wk0vYWlr?=
 =?utf-8?B?YlNPMjlVM1B4bUJNSXZDWWNhMnFOWnRaNXNjaG5LWStxR1ZUYmVzdk05Qk9u?=
 =?utf-8?B?SE9uYmpwVjBhQ0JYZGlPVEpYN0hqaHp2STN1YTZZNnVkWVdPQUh1Tkh0ZVNW?=
 =?utf-8?B?UHJuOFIvcHBEK1hPNkJId3FZQnVOU2FZbC9XTTJoZTV5VFZSU0l0ZmJiQ1pj?=
 =?utf-8?B?RnZieUFqQnh3K2hka1d0cHEvSnI4VFNtdy8wQUU5WTM2aEEyenZ0MUdVeko2?=
 =?utf-8?B?RzdscG5NajdGcnZUZTMxSE42YnUxTmlQUnBQYzduWVBMV2RXWG1lK2daall1?=
 =?utf-8?B?d2hFMzlldDVVOFhvRis0OC9FNk82b3FBK2QwWDVZNi9KWUcveDZ5bUtQVSth?=
 =?utf-8?B?aXQ4ZC9tNE85eXZNVDRSVXZ4RHVqRDd6Mk5scTB2alFJQThZKzlrUlRncnVw?=
 =?utf-8?B?OGdUVmU5Ym1sZnZMQk51bm1hM3FqVks0bVpQN3FCZDhvQnViVDUrRERmTU1r?=
 =?utf-8?B?cmp3Rk1sUVFWdXFtayttQldtTDNFdkJJS3Q1Smd0NVFBdWxFam9VR0dSOWxF?=
 =?utf-8?B?YWhxeWwwYUNaUVpkeWJEckY2Lyt4akYvV1VqaTRsbjJvbU9GMVc1QjFVZmF1?=
 =?utf-8?B?dEFCRmhEKzlFUnhpRkNSQjJKemV5VVlhZWpldkszdUJSL0lJUEpYZXc5REdt?=
 =?utf-8?B?MXo3Qk1yTGNuNWFSYWw2ZFdiWXBTbVVJdlBSY214aDZJY3ZVWitEWWFZb0k4?=
 =?utf-8?B?UkxQNzlCdGpuemtHNXY3RkxaNDQ2Y0ZLMGV6NHlSNjA4c1UxanFLcko4UmFG?=
 =?utf-8?B?S3dZU3FhSzFqZjhOTFdjR3M4OWJYNVp2MUhwTXhZSkxzWUhzOS9KRGl1ZlpX?=
 =?utf-8?B?OUw3UHZYMXh5dlVBQmVuMTBpYjZzZFVZbEJBS0QwSzVHSllTRWVYNnBoZDR0?=
 =?utf-8?B?S3ovbi9BR20yVVFqZ1oyb3d4eE9hbFBmYk9vdVBMcFUvMXNaWnFMejY0Qis5?=
 =?utf-8?B?YVoxTHRwZDdTbWoyS3QwNkIydHdnc0g4UXo1WFpSV2FZNnk1emp4b1V1bU1a?=
 =?utf-8?B?Q1ArbGxCRU5peDlLVStZUDlHWlpTR1dWSEhGN3lJZElzZHdlSzMrdzdMbXNl?=
 =?utf-8?B?eU1vZGZmSnhZeG0vODZaVEpFNEd2VTB4U2xsVUZNK0tzWTNxWUNVZ1NWUkJ2?=
 =?utf-8?B?a3dIWnZsVmg0ckR6bG5pa05iQklGRkZtZW1jQU5tVFJaUHNucUZBaEtJbE9s?=
 =?utf-8?B?YWs0MHdTVWtvZ2U0U2J1aEJsVTY1amcrZ3FCMGIzTVoxUGN4L2FZM1NIcGZr?=
 =?utf-8?B?TFdpVjZremttN3R1QnpTRjd0OEVqU1EyUC9kazlqMFM5S2hlMFVxYm5RQ3Rp?=
 =?utf-8?B?R0VRZGVIYWo1YmpVV29ORlBjbVFOV0JKbmxpb2lpdE85Qk1KNzFxd2d5ZTlh?=
 =?utf-8?B?Y290NGtwUXFROWtVWXl6OUlka2t3UGt3RXY1dndHMVhwczk3YWhUeGtjZWFO?=
 =?utf-8?Q?PAUXGCLquOoL/xxH8fClTs1d7FOxnvi5Fw4bY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536a98ab-48ce-4dcb-fcf0-08dea9da86b0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:41:56.2590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRQ2u0cv3P0RMDZbHsY1EPrfcepguW8yrRLkW3odksQ9SMdlPQU7O0TBXz/RTXjrVGT+1i+kshtaRFu57nGhCYuYtvVoZozn8LKG0hPFkWI5vZ2tOEQvRQQrLM+oKrwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10360
X-Rspamd-Queue-Id: 487264BD0C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36052-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

v9 -> v8
- remove the SIUL2 syscon child nodes from the
device tree and DT bindings
- remove syscon child handling from the MFD
and pinctrl drivers
- remove the MFD driver and use a single monolithic
pinctrl/gpio/irqchip driver
- add a new compatible for the pinctrl+gpio binding
while keeping the previous compatible for the legacy
pinctrl-only binding
- update bindings to include the PGPDO/PGPDI and
IRQ register regions in the DT node for the
pinctrl/gpio/irq binding
- add IRQ-related entries in the bindings to
document the intended hierarchy; IRQ support
itself will be added in a future patch series
- update DT nodes to match the new hierarchy and
compatible scheme
- fix dtb warnings
- reorder commits: bug fixes, API changes, DT bindings,
driver implementation, DTS changes
- split commits further to separate minor
style-only adjustments

v8 -> v7
- remove all ': true' lines from properties in dt bindings
- remove NVMEM MFD cell from SIUL2 in dtsi
- remove NVMEM driver and configs
- expose SoC information via syscon cells SIUL2_0
and SIUL2_1 in MFD driver
- add SIUL2_0 and SIUL2_1 syscon nodes in dtsi
- add patternProperties for "^siul2_[0-1]$" for syscon nodes
- update example to include syscon cells with proper format
- remove `reg` property from pinctrl node in dt binding
- update Kconfig help text to reflect new syscon structure
instead of NVMEM for SoC information
- squash deprecated SIUL2 pinctrl binding with new MFD binding
- dropped "nxp,s32g3-siul2" from MFD driver match table
- fixed commit messages
- fixed dtb warnings

v7 -> v6
- fixed MAINTAINERS wrong file path
- add unevaluatedProperties, change siul2 node name, remove
  jtag_pins label in the device tree schema
- change compatible definition in schema
- change node name in dtsi
- mentioned binding deprecation in commit messages
- split mfd cell conversion commit in two: one for the
  previous refactoring, one for the mfd cell conversion
- removed Acked-by: Linus Walleij from commit:
  "pinctrl: s32: convert the driver into an mfd cell"
  because of changes to that commit
- deprecate the nxp,s32g2-siul2-pinctrl binding
- add NVMEM MFD cell for SIUL2
- made the GPIO driver not export invalid pins
  (there are some gaps 102-111, 123-143)
- removed the need for gpio-reserved-ranges
- force initialized pinctrl_desc->num_custom_params to 0

v6 -> v5
- removed description for reg in the dt-bindings and added
  maxItems
- dropped label for example in the dt-bindings
- simplified the example in the dt-bindings
- changed dt-bindings filename to nxp,s32g2-siul2.yaml
- changed title in the dt-bindings
- dropped minItmes from gpio-ranges/gpio-reserved-ranges
  and added maxItems to gpio-reserved-ranges
- added required block for -grp[0-9]$ nodes
- switch to using "" as quotes
- kernel test robot: fixed frame sizes, added description
  for reg_name, fixed typo in gpio_configs_lock, removed
  uninitialized ret variable usage
- ordered includes in nxp-siul2.c, switched to dev-err-probe
  added a mention that other commits will add nvmem functionality
  to the mfd driver
- switched spin_lock_irqsave to scoped_guard statement
- switched dev_err to dev_err_probe in pinctrl-s32cc in places
  reached during the probing part

v5 -> v4
- fixed di_div error
- fixed dt-bindings error
- added Co-developed-by tags
- added new MFD driver nxp-siul2.c
- made the old pinctrl driver an MFD cell
- added the GPIO driver in the existing SIUL2 pinctrl one
- Switch from "devm_pinctrl_register" to
  "devm_pinctrl_register_and_init"

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper
Andrei Stefanescu (2):
  pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
  pinctrl: s32cc: implement GPIO functionality

Khristine Andreea Barbulescu (5):
  pinctrl: s32cc: use dev_err_probe() and improve error messages
  pinctrl: s32cc: add/fix some comments
  pinctrl: s32cc: remove inline specifiers
  dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
  arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
    node

 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 107 ++-
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  26 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  26 +-
 drivers/pinctrl/nxp/pinctrl-s32.h             |  15 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 646 ++++++++++++++----
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  25 +-
 6 files changed, 707 insertions(+), 138 deletions(-)

-- 
2.34.1



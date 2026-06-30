Return-Path: <linux-gpio+bounces-39211-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kF7/B7S9Q2r1gAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39211-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:59:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87E6E48A0
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=IVrRRL6W;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39211-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39211-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C90030A8DA5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8180411682;
	Tue, 30 Jun 2026 12:54:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08D41167F;
	Tue, 30 Jun 2026 12:54:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824058; cv=fail; b=cGMc48wf3OWZCNQmGiodbalZNmBrlXG2Kebl/sy90PbUjc+TInzFKos2mwSJINdxu7jzEgn0Snj7b+UI1ORbzi4kOT8IONVhgsxh4ZQPR2SwH1txwnuaEL95kSL388KjAfiplt10IcXWU3+up2qECg85epfdbcSOVFv4hyqIhu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824058; c=relaxed/simple;
	bh=c0SUE5Un0cGvt42iOfg2ePSwv7b90+hoaMXHByZMyw8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OF2Yft2k9xeL4tZE0KKm6BVwMakfYr3Z33EAgwuI3c8pTIrIMXrim7UrVmdxTAQiMyqjC+aQLRzZ6lWGYGgseKwhJMBYldUVGdhn460e352O5cMQaxQe8EAGFsBGuGln29n0pNfw0oHehFWFokFUjJLCzfLq1SweW/WxuLfAyK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IVrRRL6W; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaGZ8Dujl680zq2HIzQocPKyz3VYF8R+MjXRm/dQ2oyYNtpEWJTKnXCx+ktQdf5qGdCkylHdbV+VTlo4RkklIyyNFcPIAGSB+rav+0Z0OQrXFsX5gqYJIFDg4i61ZB8lBx74q/HCV/02JepT8bT+qsQKTD40cz2ewvuYLkEDv9RXZ41hvTbZfasTyCa7YdeFxT0LwHZuK696d0twVU83bslfpHytxFtctMnzSefIr5sbZX/eUXw5tI96eichzwKlbgCvMWrijmO6JcxHSmg+wqdrzfLIkOq3u4h6Cnery8TDMJ5KVcFsQjGP49ZOIDnEM3NAepb/mGqE2c/9yAuDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gg4gU70A4iXU8uSkBHdXVtMFou0VBGcQcNpgx988pEI=;
 b=PHXK1IGgJaCadjk66ipcX6K1OCZiWVRU3OUEE5EXTqApuCkCqYt9Rg1RTGRLruo5m8vHhv2rRFVoqbYYnIJsSEPCy7sSUqkSnlY0ZY1ZkfsUtlu7yT/ROwy/iJBbdgd0s7Wo7708iRUC+Q+ceDwNNLhcGC6U3MggHBCiNOx0pcemUCQHooSHWc4nHrX8RnZEjhHHLOvw8juSqNanv3YesJrN2RTqRstZGk4U74ODvDTtjpCZymr1DFabfsZdhF5EoNetOjkoeqXfMgU278hMyGCpJJJZ7oV2SBQ4lmZrsu791e+cP3IyV28FGNRE+ujfOpHdp3pyZmESP4AaHBe0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gg4gU70A4iXU8uSkBHdXVtMFou0VBGcQcNpgx988pEI=;
 b=IVrRRL6WLeo4kBCOHW+RST/0LMN5DWGeQ1eKrrFkI4Lql8cG4QepiP9PI+6FxpNX13sbfQ5L5z7jFxElt8oiDLY/VsP+uSu9dgM4QLIbEyl9EaQQi4vgLqU6sstwW9pWdLpwpNwRzoBfJ10Ylv4ozAXr+jqXIaLE1Q+RDVJjjq7ax4xWgUDxJBRNGvxWztoSs/YZcSlEre/rN+sjS0Ac5H/DuqAWoppYrIufgtmbzaNo6XbRnR8cpjJNU+p/ybBl4Iu/zK1ogb6L7DRDhiYD1tsJ84nqaoSqBQZlpHEiXkb7GucK071fd+ZfBxw10lHLzPuPXqzH5c1EAW+dv2gNJA==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI2PR04MB10883.eurprd04.prod.outlook.com (2603:10a6:800:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:54:05 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:54:05 +0000
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
Subject: [PATCH v12 0/6] gpio: siul2-s32g2: add initial GPIO driver
Date: Tue, 30 Jun 2026 14:53:57 +0200
Message-Id: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI2PR04MB10883:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1bfbdf-1ef1-44ca-d760-08ded6a6aac0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|921020|3023799007|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 M50H0WrsCcC6jV1TwbBB56/KIcAmfYBcH2VPHRRwP6PZYvvSr+xc7qGOQIzKx2yMEDxbvLRSP7SVzE36+A/Zx0tqSq/yQG2pcW69nWGlciLAbG0llFkPYnUzt2fr+oQUjADpzgwgZGZEzy6qvOlHadmNPIHHhGZqijLmHbfkQ+tWubQyQrvB/8mJRo0UQrhz0V+SWOCj2SAvzYfEg+6BAMiDW0VHjaJV759wXynaEqHq+z66FAlyTtgPUB3PyIDM1PSLPi+u9PKNhBL09raP5TsMQqBaWVubsASvpyvh9TdeOBAL+Sf8MU5wFRHbT3Zq0jomHb/D4aijL6pxn5+ajacX33uXDPjVZlA0+ZDTZ2JI/33/ip/TxcH5e1nj94TOr6vFi8u7IabUWcevBFXC6GzJM+Yi2mFCc2ObY385ihozRMIE+8I/vVpwiMMRsEePhz52HO5+ETlXgt+X8AU/wYWgx0tvONHICLAv+LHrug/0FAM8MuGKc0aAYdmRcyDZ6t9xiUsl+No6xJud+Cq2ZfLdeWxGpmYSQHvz7c62WfzJApIhmrq7a4Q0SUOduR+C5GNDr8JVG8fVkTW0MLzIR7UfFNqAixWHuFUQ0UILIAtK/XPu+wjuzoJUW52xSSnWWlJucFmEDpVcAohEgeGNbrMpDUOGcBov+cgFH0xg5PdYBoLteaPiTOh2RdJxWAM1Lfz/wSlpdkdJ9tKXmMpVbA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(921020)(3023799007)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YUM4bjRWOW1NdXJ3UWRnYTVIZ1c1VXRhUmRpMVFycUphOHlpaG5SZ2hhSzN0?=
 =?utf-8?B?L0FNdjFyWWlMVTd2UHpKY3RDejNJeS9PZlZEN3NkcGdvR1F3T2JrRWdiZU9Z?=
 =?utf-8?B?aW52NnlJVGtObmJtL25Xb0ROa293dEFEbExhK2NmQ2JlMElNdUpXb09JaTRh?=
 =?utf-8?B?RkJUY2t4cFh6NVZJQWw0WTgza3QxNzM0aHJ2TVcyWHhEaFJtNGlSOEVab3JC?=
 =?utf-8?B?aFdMUkZyK3NFaFUzTUQ2VDRPM3NXdGVqdEZWclJHYTF4OU5wRTVjZjhvditm?=
 =?utf-8?B?T2diREFBekdpUkczcHkxcysxUTQveUpHb0Mrc2pGanlZZTVUc0J2NENZMXZK?=
 =?utf-8?B?TjhiMk1JUjVTbWl1Nk53bTVybWRDbThzSEk3ZFJlN1NMOGF1ZzdRUTlvRGpa?=
 =?utf-8?B?UmJTSTBLTGpJd04rcVBNMVdkSlpJN3pFQXZYRk9vaXV0NlUrU1l0RFJzRy9u?=
 =?utf-8?B?NzVRb0lrbmRRVVJUcjkrRTI1R2dkbjR1U3BDZzhsUDRvREVmbXZHYkZ4eFdp?=
 =?utf-8?B?QnZSUGlpSmd6R2ZENVlGNGF5alVaWDNiWGt3VG9WSU9INml0a3hRN3p4b0FP?=
 =?utf-8?B?Y1lIWHh4d0M2Wll0NXdaYmNLbEdGR0k3WnBlazg4Vnc3L2MrOHcwcWZnR1du?=
 =?utf-8?B?S1hKdjIyMjVtM3lYdnFmRzh0R3R6OXdCVWJ0SWhkZkFQVDg0TEpLaVE3MlU0?=
 =?utf-8?B?Y2VWMHVqSzFJRTFvZWsrTXJBZHVYeVI1MGdzWXhEUGhEeHJCL0FIU3J6Yi80?=
 =?utf-8?B?d1BnNTB2Ri9sNWR4czg3eFZLYXVXWlV1Vi9sRC83aU51Ny81bEVWRmdRQVVQ?=
 =?utf-8?B?TjhEVzgxMzErYjVvMXJrd0FGYTZHemQ0NlV5Z2pSdmp4LytWc2o1eVhXSlpZ?=
 =?utf-8?B?OFJROVMvUDhiOXlmcTVVcm44UGVuMzhTZXhlWjZuMXV0d1hvcmpmMUZibTdt?=
 =?utf-8?B?QTdseDVFbWNBcXdWVGs3djB2bUxyV0FDcndNTVFWaXhlelZBYnYwN2NVYkg0?=
 =?utf-8?B?dm5BUkM2SmJCT1h2VHB3VGF3RFNNNjJrSVZ1Zk1Bakw5NDByckJjbldnSnZr?=
 =?utf-8?B?dmkzZ1NGNjRybENOUktYNW5PdnRkWVlWOHhDMjVJc1U4UWRVK2FyT0VLVVp0?=
 =?utf-8?B?bUVKeW1LY2F1QXkzYk5yOFI1S0hFTjU1SmJkWjdodFVhWG5YbjNIUk04OTYv?=
 =?utf-8?B?eEdwU3Yyb2dqWm5ZVmp2SkxaU3o5YWR6eXF0OGRTeDZ3bDEvYURzWlFYWlZ6?=
 =?utf-8?B?UU15UGM4UXl2c2Z0Nko2RTZYVHFTNllhZTh3ZTF4ZXpHM1d5MkpyemhKVWkr?=
 =?utf-8?B?akYreWpXcTFZdjBuUTR3WDNGVkNyVWd2YTJDM2RQVFd4dnNPNDEvdWt0U3pj?=
 =?utf-8?B?QjhXa0Y5cGdTNTlEbnZlQkhLejZmWkIraEU1cXA2b0Rob1VwVDl3R2pnZVg4?=
 =?utf-8?B?ek1aWjlkZnRya21nYzhveHpVbC9jdlhCN0x3YzBGekRSSUpFU1FDSWtnSFV4?=
 =?utf-8?B?MGI3NEswRCtkZzUzVW41S1lPUXFvRlA3cHpZSHBBcFVaS1B4cWcwR1pjRnhQ?=
 =?utf-8?B?M2xobk5LRG0vbmhGcHRCdmJuc0FyckdiQUNYWXlONnV0eXZGT2ZINjM1eXhn?=
 =?utf-8?B?YU5SUUs1MW9xUzQwZDZSREdBYVZwVnpnVDAxY2ZUMG5zMno1Q3UzOHlnVjNj?=
 =?utf-8?B?WnlSNDJzQmxyTCtrQ0ZWc0ltUXNURUJqVjlheUo2U3k4cUNaY1BuY3IwbENE?=
 =?utf-8?B?ajRIZ2poWTh3aFR2VzA0d3Q1TXIvWkJXODFUeFIrMWdYRmhLMlRZMXY4bktK?=
 =?utf-8?B?Nm8vR2pJdnhtaGtmRkVVajJZS1dTS0Y4UHlYU1FnK2Q2aU1NUFR0VHJxblZa?=
 =?utf-8?B?NzhjKzA0b29IQ0RpWmloWHBTVGR6MUJjMXhsU0U5a1MvRTFSR05uanBadzM4?=
 =?utf-8?B?SFpKcXFZZXlZUkY3SXRGTlJvYm5iWWIrQzY0MlJ4Z3h1MDlnZnY4dE1SaFVB?=
 =?utf-8?B?azVzbHRIZVJVMGovMWhCM2lITGJDbGhmR0h1ZXM0MmFZUDZJZzY2ZFNmd3RD?=
 =?utf-8?B?Y2hMK1hHZm9iN0NsRDF4TTdubk1YNldZaTA3SzlWb0FCRGZHZ1hrYVlBVjlC?=
 =?utf-8?B?VGQ1WXowNTFHTTRQU3VDM1dCaWZUeG9Od1M5dlRaQVJkTW5ZeS9kWDVKcFVU?=
 =?utf-8?B?V2NpN3lYUjVnMXNPWDZTSTFGWW8yVWRWWWY4V0JyZUoydjBuZDJQMGgrZE9K?=
 =?utf-8?B?T2xGanh6SHBXUS80Vi80UG5VUzQ2bTRIYXQzRzlBRGFieU85QUx2bHBQdlV1?=
 =?utf-8?B?YVl1RUEzaVR1VVBISEZ3MEY0TDZrNmFSVFpPZm5QbmxNLzg3NmNDNjh2N1RN?=
 =?utf-8?Q?Lt99K0UxkjaXvyRxhrwRk6Y8FyLzGyN6Nuokv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1bfbdf-1ef1-44ca-d760-08ded6a6aac0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:54:05.2651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXWakQqyiWKTxwFPfUTnxKyI+Zx4hqeGg5iRH3ruWspdQiAlOS3GWrPwdVEYz2ykLoNYKwSZKTJyqw3d5WgU7hWHyaPSHb6iI4ku6m64/cP70ISMc41lf1imicYfanZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10883
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39211-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.nxp.com:mid,oss.nxp.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A87E6E48A0

This patch series adds support for basic GPIO
operations using gpio-regmap.

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

v12 -> v11:
- rebase the series onto v7.2-rc1
- add Reviewed-by tags collected on v11

v11 -> v10:
- add GPIOLIB as explicit Kconfig dependency
- mark regmap config as fast_io to avoid mutex overhead
- propagate regmap errors in debug show callback and
  suspend/resume paths instead of silently discarding them
- introduce a per-range sparse flag to handle SIUL2 instances
  with a non-linear PGPD layout
- dt-bindings: drop redundant minItems from legacy oneOf branch,
  add gpio-controller: false and related properties to prevent
  GPIO/IRQ properties without the required reg entries and
  drop maxItems from the GPIO+IRQ branch

v10 -> v9:
- implement GPIO via gpio-regmap backed by a regmap for
PGPDO/PGPDI register translation
- remove the successful probe message from the driver
- switch back to a single compatible string for both the
legacy and extended binding layout
- update binding: GPIO/IRQ properties required only
when extended reg layout is used
- remove unnecessary return value checks for MMIO
regmap operations
- replace kernel-doc style comments with regular comments
- solve relevant sashiko.dev findings
- rework GPIO request handling to preserve pinctrl ownership
- use __free(kfree) and no_free_ptr() in GPIO request path cleanup

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

Khristine Andreea Barbulescu (4):
  pinctrl: s32cc: add/fix some comments
  pinctrl: s32cc: remove inline specifiers
  dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
  arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
    node

 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |  90 ++-
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  21 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  21 +-
 drivers/pinctrl/nxp/Kconfig                   |   3 +-
 drivers/pinctrl/nxp/pinctrl-s32.h             |  35 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 748 ++++++++++++++++--
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  47 +-
 7 files changed, 871 insertions(+), 94 deletions(-)

-- 
2.34.1



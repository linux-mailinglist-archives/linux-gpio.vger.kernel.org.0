Return-Path: <linux-gpio+bounces-12434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA1F9B8C9F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CBAAB226AB
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1ED1662FA;
	Fri,  1 Nov 2024 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cd53YXTT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64B915C158;
	Fri,  1 Nov 2024 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448427; cv=fail; b=Ng/wG7Df1IoQqZM3B8QmTJs9ZNnpagRqlexg75kfVAGYU7qdOLpVtIe9JwRp9XOnQ2IEBL7XAL6gIxt3ON4nYfWVVG3ef15xoX26dgey2k7V3i5aMROSmkNx9kl9bf6pq5rQi6p+ywBG9YmTLzmIBMozsi17Qmp6iD4qfHxmGyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448427; c=relaxed/simple;
	bh=F6TeoK/n3j1f8Xq4Ou000LXWWquswGMkenxq25zk/6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qoMB5eNAE9zGH+KcbNpfjPv18NxAtpL9o4u3iXl/SFDYFC5Kw+hOmqak/PZNg5I7qSpgVnoDrZTY93MyQIkazbNYpZZ3ta9upsAVs+eR4zW4TVXw6IDq4OtFdA0Oj1eR9KLkb6zAbnXQ/zOwAleP/s/rQolCQBTRSy6YllJlvyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cd53YXTT; arc=fail smtp.client-ip=40.107.21.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdDLE/+cXyQGjkrDzoojDo6vMLX2fBt6CORaOrilt/I4RCOhk1UMxjUqExIkVD0c0qQ+VajkuOvA94xnCHZbxv3LPZXrtB0LEsynNSud24cwfMAYestujBM0kRHOGUebtOZ+aDJrw7/UjSyJAn8bp4KlGPvgUFWSvvpZssvDL3OeGSd1qEHGRiprFlhU6sU4bSY/bf16YCuOy/5FJhA+H7Bt4I3942DvSwRR4HgoUwcKa+UdnG8a/QqfKJb010Vzm6TxlxOEiduxqvPAm+k6nlVyZ/3CA8PeZBeSS/TsgifajhyF+74dVp0qDk3uoKh7RdAlycdHC71deNx9E4RZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCcmG5pRxC50Y8aeU++G0l1pJXEW1b4hdE2uwzGqkYA=;
 b=xc63VFAc7tUws03vQJy8H0fZkuiH/DaWhvTkNkDSWAmzihigiDwvgMJZMWFLHAsil8tnsKHR5X0Okw4ZOMtGSc9JfQDps/R2LCib62E8rK06FaLQ3aRSdSy9A5qt5JssCbftuzulM3bR53BJr2EcwP/03etmJG7jvNjPeP9xxVDc1CuCMjwQ59Q4dLJ1E7UI0QJ+6sRL5vXic0zcz5h5B7xUERnUOA6wmZ1B7RgrhiwPoeY3xADmZLqMp856TLSwq8G2J6i6Bd2K0zmCYfF42FP8vIhwhb9c+qf0mj1ralWwcXFGIgOuR8QJLY4B8WADRSD7XgkSOX4rtXBD0GiCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCcmG5pRxC50Y8aeU++G0l1pJXEW1b4hdE2uwzGqkYA=;
 b=cd53YXTT3tQgrSstbMz0okAuNRUClk1PeqWmMgCnsWN5LzWtQwdYnKu6DNh0B4WoSgHLZv6BoAbevUe56l2AzGv8vBeWL+CzEhxNaRZ92sxdZyNPtrdtMUSx378fYF0PfiPErNRRW5qHX6GSkl0l92NYBH3HeA5l3BtGIWjv8ffq4kSdVgCrSST1VBn+1fPZw6TZj1vHb6yK+k1cAVe8EzZcjooN2OOpQwA59WzNSVqnqssMQdqb+/ryb/5Wu33yev12ZgVan8R9gG0Obt+fT9ivXk1jUFL5ITlC8sd29VuRmNYZEFfWikvnKE5PU1qVOZ13XTKXX/hXvE9Qryl/Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 08:06:56 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 08:06:56 +0000
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
Subject: [PATCH v5 6/7] pinctrl: s32cc: add driver for GPIO functionality
Date: Fri,  1 Nov 2024 10:06:12 +0200
Message-ID: <20241101080614.1070819-7-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 133a80b3-5cc9-4707-c4a5-08dcfa4c2716
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlA1ejJBVlROVWp3ZGVHYk0wUUw3bWY0LzZ6K000U3c0RStyb3pnMHhOOUJL?=
 =?utf-8?B?RkVndHJhekVZNC8zQm9hNy85KzdYdzJoaHlqN2VMSWFueDBqNGMwVEJTQXlZ?=
 =?utf-8?B?MUtyYys5Umo4TG00b2JFUUN4eFhtMXgxak1PcHdreFVKZ0JQNlJTam5FbVE4?=
 =?utf-8?B?Vi84RFFWaFg1QWlkOVc3blR4dVAwcUZzWWR4elMvb25iQ0dNTDhURDdDTkFz?=
 =?utf-8?B?QVhJZDZncGE5SWc1RkhDamw1cjU3QmwrMWQzanFkM2ZDclpHSEpsV29mckZ0?=
 =?utf-8?B?Q1VtR0I5MW1pYU1lYkYzTUFtUTFibjh4aHNKbm1LU3JLNkY5eUVLOUsvRWJD?=
 =?utf-8?B?UDFBT2RDUEdGV0tnSnp5S1FFdHZqZmJuelJsTUxXTS9RdzJLeUJqbk8wSU5Y?=
 =?utf-8?B?aUFxZTZjazZHcCtPWU9LMHhyUlB4ZFlTeUJnZDU0a2xITWVWL3dzcU84QVZw?=
 =?utf-8?B?cS9pdk5VcnZyM0RlakNaVDBpbTFrek51bThuMFNLY2IxQXVMRjQ2WnJxalVM?=
 =?utf-8?B?a1hqVFJHVUxLRGpwcWhvcWFjRHg5M2NES0svOUpUOXZmL0EzVEwwWkFXN28r?=
 =?utf-8?B?Ulc5L05LYTNRUDVIWFozdEhWYTRjQWkzcld4bGdSazhhODBqZ0FkRDlqQnpC?=
 =?utf-8?B?NnE2d0tmTEE2MHF1bFhuODV5aEtlZ2Z5NGVyVllCZHRxK21NZit5eWdGc0Mx?=
 =?utf-8?B?TDRDRDJMek85a0lZNDhiYjdjLzNUSFhlUnFxejlldGF3TGdFNUgwVmlYOXdo?=
 =?utf-8?B?aU9ibHp2ZFV5eDFXb2NQSUxGQ3RONVpuZ3R1TExnMVkyK1J5NFJSRzloay9y?=
 =?utf-8?B?L2pka0thVHh4bXdYeGRGMVlmTWZRU0dsd0krUCs5MThja3kxdFV6S0JOcTY0?=
 =?utf-8?B?ZVF4L0FRU2pkK1kzVU1qajYycDVhOTl4UERTL1N4SlJKZGxCcEJzQW1jTFRS?=
 =?utf-8?B?aW1wQVJaWldjMUhMN0ZscXI0RkIrSmZZOVZFUU1SRDkxMXJIQzhHUysrV1hT?=
 =?utf-8?B?SFFhZVZNanlLelJjUlRVY1phQnh2TWZuZ3hWMG9OZGhXTmpZYlZEeXgxc2Jz?=
 =?utf-8?B?SlBvMjM5Uys0dkQ3Nk9RaGR6Tm5TVjR2Nzk3Z3R6dWxybHIrS1F0QVM2WWdL?=
 =?utf-8?B?OVZCSkwvc1pCakl6bHdZU3hDMitOYnFvdG1lSU1GbFRPT3JQN1NlRjJmKzNa?=
 =?utf-8?B?a2VEeXdBekwydVVTdDhnTjIwNmU5eGZUZks3akd2b3pVUHR4MVVBM3ZjRHBj?=
 =?utf-8?B?ZTA4TjJmWWRvOS81VlFrRHVUcEpUQmNsOEdramNHeGkyNTZEQ1pXSGowcjNW?=
 =?utf-8?B?UGdKZDd1WkllVGZLQytneWJTdWJOdTRLOWQySGZIVjhyNnd3ZTBhVm9TWDY0?=
 =?utf-8?B?Ty8wM3lNdkxid0ZQTnpYdHl1cFJKaHVpNzl3WnhrNlNyeWhzV28vc2ZuS0Uy?=
 =?utf-8?B?MXpuQU1OM3hLR3JFSHZNeVdGclNNMzgxSWtEbFJkRHBmNWthSUNkck5lZVJY?=
 =?utf-8?B?KzMwUi9PWXdoVmJnQmRjcHhCbHBMRjFOWkYvR2dFdlR5bTdWSElpKzQ4TG1E?=
 =?utf-8?B?ZWZxWFl2UzV4OUxJZVZPMFR1am56RTdSalNBYlF5empSSGRSVnVoUWdvbEJk?=
 =?utf-8?B?a3hxdnpOTTZVb2RyUG9kdWxoQmNXTTVNRTJaVk1ydWhLRGN4M3FSaXhrMW93?=
 =?utf-8?B?THdjb0dsNXJFMmczb2NmWE5sRUtmSGRCb3pqUXRqaTEyUVJvbVVzUGtSaVNM?=
 =?utf-8?B?cUJjRDhhOWNhODBkRzIvNER5Uzh4Ykxhc1duVE1HcVdmRzAxSDZRMHd0OWVt?=
 =?utf-8?B?L2pvQ1lGYUplOWxrTjdPRHVSclVmeUE5c2pHYm9MeE8vV3hxMUlpR3RKeVgw?=
 =?utf-8?Q?IVnwXib505U06?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGhpUHdHZ0xaNjBldm11SFZMSjdnMHFkRnE0ejkvZ0pTMXFUVlFZYzAwbTI0?=
 =?utf-8?B?OGxLNHNrWVBZY3dKa0tWbTErL1NGanM5NW9OaGFSTEYvcWZTampBOUZWTmR4?=
 =?utf-8?B?VkJQUjU3eDB5NjlCbG90SVdXTWEwamdJVlpuRk9BcnpPMkI4a0Y3UUJSUnh6?=
 =?utf-8?B?TE94V2hxOHRUY1U5N1Vwb0JhK1NNcnRrTTJ2ZGdYNFFtZW1EVnZrQmtkWlkv?=
 =?utf-8?B?akZPYXpFTG00R0xxY2ZCVGRDN2VyK0tPeWEwYXFhZmJBalpDNXJZb21hOXA1?=
 =?utf-8?B?YWc1M3MwVkRpTEl2M21YamgvOS9VcDRlcmpqK2VtWk9wU1ZSbHFHaVhDZkJz?=
 =?utf-8?B?VWtVVFM1dU1LSVhWQVh3TTFIVVc3RUxLOFNIVkZsR2FLWW93RVRPS0dERTZL?=
 =?utf-8?B?b2lZbU0rMlY2OEI1K213aWpBaWRyazI1ZHI3LytuQllQNnpEZUd1cTVKcTNl?=
 =?utf-8?B?NVJ6RzlNWGlCOFhQSldtM2VyWCtqcGlMcndTL3J5S0pqMFRsV3M2YXBtWTVK?=
 =?utf-8?B?M1l0RzA0OFNDMXI0aHVVd0IrdS80cEZlcWNaeVB4dElwYTdXY2xiZkx6OHNZ?=
 =?utf-8?B?aGFCbGt5NEF5cjJGMXE4cGgrc0lLZ0hvdjdLeEVzNlhTRG9RaW9aZkUvMU5l?=
 =?utf-8?B?Z2gyRTVxbXJXTjRKL2c2dTcrMXBtelgyMWwwU1JtZk9EMVl1c3l0UGV4cVRY?=
 =?utf-8?B?TjVaZHZnRFpjdGpXRytqME1YRFMrNWNLVytoWWp5WHo5Qm12czNueHYzY3M3?=
 =?utf-8?B?QkxkL20xdGppMWcxRGpmdnJTTG1pdlFBdER3Rm1DR0E5YnllcWlZWXFuZFdz?=
 =?utf-8?B?V2FiakY0c1FuMWF4c0M4Y29qVVpBVnZabTZCYWYrU0cxNGppOEtuNlgrOUZY?=
 =?utf-8?B?RU1rSE9Xd1VFM2x5ZHV2Tis5d3hmKzByQTFLcnQ0WjRWcXlEOUpLaUpENWJB?=
 =?utf-8?B?Zy9mQzZ2MnBUeXJUNFlPVTY5MHo4UXlxMkhRaXRBZUdGTnhNQkhWNXo3VmZX?=
 =?utf-8?B?cm5SNGJ6VmQrVTg4aU56WVlTdTMxZS9aYkkyNnNNUFFuQ1llcUt5M2Q2UkIv?=
 =?utf-8?B?UVdqMERZOVZrK3FwSlAyNGJpRTk4eTkvZCt3bm5FUGdIUlZERFJVbzR0RS9m?=
 =?utf-8?B?cE5CZTZCakRac2ttWUV3bmZXMk50QUVXOHd1VWZNcTVwZjJjRFduYU1ONnhV?=
 =?utf-8?B?R2pXQzEwZWc3RkcvbGdFVjVzUG9KanBST3NZYnFvMlZzVDd1WDR2RDl6ME9r?=
 =?utf-8?B?RVBvWGNKRXJjTXRwanVUSUFSSmtwY1hiVXBCQllUL051MnBVTlhNcFk3aFpV?=
 =?utf-8?B?WGRhOWN2Ly9ORDQxdFUrd01hd2NqTHk1SUdrYTNKYm1ibGpLSjFLQ3VhUnE0?=
 =?utf-8?B?SWtENGF0dCtvT0I4UjcyaTB5R2Q4Wk8rWVR4YVpDcWVVVms4Z0VYOE1DQ3U0?=
 =?utf-8?B?VUNZNWhJQS9KMmdxWkU1ZGs5YWk3NUlIS1FNQ2RKWjRKVmdycHNGWkhlZTZQ?=
 =?utf-8?B?THRLNjdtOXlHeHB1bFhsUXhlMDlkQnJEV05hNGRObjVNYVUzb3FRV0xZMk9Y?=
 =?utf-8?B?aVpTdWFSaEJOdXE4eWFWZm9QaU1paElkY2RVS0dCaFBoVGhqQ0RLN3ZScUh1?=
 =?utf-8?B?dVVZMTIvazJHSXZ2d2pDNm4yV0l6MnBkRU1TVTZPbzB6RDNIRnlRR0NvTDZL?=
 =?utf-8?B?ZmRoU1lBSnM4QkpRU3lWenU1aDVxdE9WNnN6YlpLTzJLOXFTc3RTLzJQTHV0?=
 =?utf-8?B?RHRxbGJucVhEV0JqeVlCcExNNTlUbzI0THVTNGNTdzZiVGsvLzAyaElFUE5u?=
 =?utf-8?B?WmNKZmdkOHZLSmY5Vzd6Z3IxMzZYZnJDTHdvekVBeDUyNUJ2ZlBTWEY2Tk00?=
 =?utf-8?B?R0Q0QldYSmZnWVpMZmVhTnYxTlNvQUtNQVh4a1R3S3ZBWEJWUlJGMWtqaVN2?=
 =?utf-8?B?WDNEV2xMVjFxK2VyNHgxdWxLVjVUalkyNDR1TFk4RFhTMDQ2M3lOS2dlUlhs?=
 =?utf-8?B?WEdiSnFyMlpQVFZRTlpBV1FadWhnYU53VjhtdE51Mno0Y1RSVzV5alZpWWh6?=
 =?utf-8?B?Rmlwak1sb0tET0hFSlhrbGpEczdQYTZIa053NnVTeVQ5WFVsMnBvdnhLRUFF?=
 =?utf-8?B?bHpCYnloaTlkRzZTeHhqODZzRHRLdEdZY3l2RzF0SHNmQU5WNUFUWWdnRmNH?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 133a80b3-5cc9-4707-c4a5-08dcfa4c2716
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:06:56.5394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVvgT5ml0FtpQ+Lzu2LhXWOyXrH7GEmxTSa4yHT/XBfCbVBhxxyXayZMqrGSXh23rbDrIPW3xtWQCa0/LegrLrcROG3tuY8cw9npWPDo2Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034

Add basic GPIO functionality (request, free, get, set) for the existing
pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
coupled.

Also, remove pinmux_ops which are no longer needed.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 410 +++++++++++++++++++++++-----
 1 file changed, 348 insertions(+), 62 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 10bff48852b9..1d4437df29a2 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -40,6 +40,14 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define S32_PGPD(N)		(((N) ^ 1) * 2)
+#define S32_PGPD_SIZE		16
+
 enum s32_write_type {
 	S32_PINCONF_UPDATE_ONLY,
 	S32_PINCONF_OVERWRITE,
@@ -84,6 +92,7 @@ struct s32_pinctrl_context {
  * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
+ * @gc: a pointer to the gpio_chip
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
  * @gpio_configs: Saved configurations for GPIO pins
@@ -93,6 +102,7 @@ struct s32_pinctrl_context {
 struct s32_pinctrl {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
+	struct gpio_chip gc;
 	struct s32_pinctrl_mem_region *regions;
 	struct s32_pinctrl_soc_info *info;
 	struct list_head gpio_configs;
@@ -366,66 +376,6 @@ static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
-				       struct pinctrl_gpio_range *range,
-				       unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin;
-	unsigned int config;
-	unsigned long flags;
-	int ret;
-
-	ret = s32_regmap_read(pctldev, offset, &config);
-	if (ret)
-		return ret;
-
-	/* Save current configuration */
-	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
-	if (!gpio_pin)
-		return -ENOMEM;
-
-	gpio_pin->pin_id = offset;
-	gpio_pin->config = config;
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-	list_add(&gpio_pin->list, &ipctl->gpio_configs);
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-
-	/* GPIO pin means SSS = 0 */
-	config &= ~S32_MSCR_SSS_MASK;
-
-	return s32_regmap_write(pctldev, offset, config);
-}
-
-static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
-				      struct pinctrl_gpio_range *range,
-				      unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin, *tmp;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-
-	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
-		if (gpio_pin->pin_id == offset) {
-			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
-						 gpio_pin->config);
-			if (ret != 0)
-				goto unlock;
-
-			list_del(&gpio_pin->list);
-			kfree(gpio_pin);
-			break;
-		}
-	}
-
-unlock:
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-}
-
 static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 				      struct pinctrl_gpio_range *range,
 				      unsigned int offset,
@@ -449,8 +399,6 @@ static const struct pinmux_ops s32_pmx_ops = {
 	.get_function_name = s32_pmx_get_func_name,
 	.get_function_groups = s32_pmx_get_groups,
 	.set_mux = s32_pmx_set,
-	.gpio_request_enable = s32_pmx_gpio_request_enable,
-	.gpio_disable_free = s32_pmx_gpio_disable_free,
 	.gpio_set_direction = s32_pmx_gpio_set_direction,
 };
 
@@ -669,6 +617,315 @@ static const struct pinconf_ops s32_pinconf_ops = {
 	.pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
 };
 
+static struct s32_pinctrl *to_s32_pinctrl(struct gpio_chip *chip)
+{
+	return container_of(chip, struct s32_pinctrl, gc);
+}
+
+static struct regmap *s32_gpio_get_pgpd_regmap(struct gpio_chip *chip,
+					       unsigned int pin,
+					       bool output)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	struct nxp_siul2_mfd *mfd;
+	u32 base, num;
+	int i;
+
+	mfd = dev_get_drvdata(ipctl->dev->parent);
+
+	for (i = 0; i < mfd->num_siul2; i++) {
+		base = mfd->siul2[i].gpio_base;
+		num = mfd->siul2[i].gpio_num;
+
+		if (pin >= base && pin < base + num)
+			return output ? mfd->siul2[i].regmaps[SIUL2_PGPDO] :
+					mfd->siul2[i].regmaps[SIUL2_PGPDI];
+	}
+
+	return NULL;
+}
+
+static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin;
+	unsigned int config;
+	unsigned long flags;
+	int ret;
+
+	ret = s32_regmap_read(pctldev, gpio, &config);
+	if (ret)
+		return ret;
+
+	/* Save current configuration */
+	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
+	if (!gpio_pin)
+		return -ENOMEM;
+
+	gpio_pin->pin_id = gpio;
+	gpio_pin->config = config;
+
+	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
+	list_add(&gpio_pin->list, &ipctl->gpio_configs);
+	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
+
+	/* GPIO pin means SSS = 0 */
+	config &= ~S32_MSCR_SSS_MASK;
+
+	return s32_regmap_write(pctldev, gpio, config);
+}
+
+static void s32_gpio_free(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin, *tmp;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
+
+	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
+		if (gpio_pin->pin_id == gpio) {
+			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
+					       gpio_pin->config);
+			if (ret != 0)
+				goto unlock;
+
+			list_del(&gpio_pin->list);
+			kfree(gpio_pin);
+			break;
+		}
+	}
+
+unlock:
+	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
+}
+
+static int s32_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	unsigned int reg_value;
+	int ret;
+
+	ret = s32_regmap_read(ipctl->pctl, gpio, &reg_value);
+	if (ret)
+		return ret;
+
+	if (!(reg_value & S32_MSCR_IBE))
+		return -EINVAL;
+
+	return reg_value & S32_MSCR_OBE ? GPIO_LINE_DIRECTION_OUT :
+					  GPIO_LINE_DIRECTION_IN;
+}
+
+static unsigned int s32_pin2pad(unsigned int pin)
+{
+	return pin / S32_PGPD_SIZE;
+}
+
+static u16 s32_pin2mask(unsigned int pin)
+{
+	/**
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
+}
+
+static struct regmap *s32_gpio_get_regmap_offset_mask(struct gpio_chip *chip,
+						      unsigned int gpio,
+						      unsigned int *reg_offset,
+						      u16 *mask,
+						      bool output)
+{
+	struct regmap *regmap;
+	unsigned int pad;
+
+	regmap = s32_gpio_get_pgpd_regmap(chip, gpio, output);
+	if (!regmap)
+		return NULL;
+
+	*mask = s32_pin2mask(gpio);
+	pad = s32_pin2pad(gpio);
+
+	*reg_offset = S32_PGPD(pad);
+
+	return regmap;
+}
+
+static void s32_gpio_set_val(struct gpio_chip *chip, unsigned int gpio,
+			     int value)
+{
+	unsigned int reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, true);
+	if (!regmap)
+		return;
+
+	value = value ? mask : 0;
+
+	regmap_update_bits(regmap, reg_offset, mask, value);
+}
+
+static void s32_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			 int value)
+{
+	if (s32_gpio_get_dir(chip, gpio) != GPIO_LINE_DIRECTION_OUT)
+		return;
+
+	s32_gpio_set_val(chip, gpio, value);
+}
+
+static int s32_gpio_get(struct gpio_chip *chip, unsigned int gpio)
+{
+	unsigned int reg_offset, value;
+	struct regmap *regmap;
+	u16 mask;
+	int ret;
+
+	if (s32_gpio_get_dir(chip, gpio) != GPIO_LINE_DIRECTION_IN)
+		return -EINVAL;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, false);
+	if (!regmap)
+		return -EINVAL;
+
+	ret = regmap_read(regmap, reg_offset, &value);
+	if (ret)
+		return ret;
+
+	return !!(value & mask);
+}
+
+static int s32_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			    int val)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	s32_gpio_set_val(chip, gpio, val);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, false);
+}
+
+static int s32_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, true);
+}
+
+static int s32_gpio_gen_names(struct device *dev, unsigned int cnt, char **names,
+			      char *ch_index, unsigned int *num_index)
+{
+	unsigned int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (i != 0 && !(*num_index % 16))
+			(*ch_index)++;
+
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+					  *ch_index, 0xFU & (*num_index)++);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int s32_gpio_remove_reserved_names(struct device *dev,
+					  struct s32_pinctrl *ipctl,
+					  char **names)
+{
+	struct device_node *np = dev->of_node;
+	int num_ranges, i, j, ret;
+	u32 base_gpio, num_gpio;
+
+	/* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
+
+	num_ranges = of_property_count_u32_elems(dev->of_node,
+						 "gpio-reserved-ranges");
+
+	/* The "gpio-reserved-ranges" is optional. */
+	if (num_ranges < 0)
+		return 0;
+	num_ranges /= 2;
+
+	for (i = 0; i < num_ranges; i++) {
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2, &base_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse the start GPIO: %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2 + 1, &num_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse num. GPIOs: %d\n", ret);
+			return ret;
+		}
+
+		if (base_gpio + num_gpio > ipctl->gc.ngpio) {
+			dev_err(dev, "Reserved GPIOs outside of GPIO range\n");
+			return -EINVAL;
+		}
+
+		/* Remove names set for reserved GPIOs. */
+		for (j = base_gpio; j < base_gpio + num_gpio; j++) {
+			devm_kfree(dev, names[j]);
+			names[j] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int s32_gpio_populate_names(struct device *dev,
+				   struct s32_pinctrl *ipctl)
+{
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(ipctl->dev->parent);
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, ipctl->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < mfd->num_siul2; i++) {
+		if (mfd->siul2[i].gpio_base % 16 == 0)
+			num_index = 0;
+
+		ret = s32_gpio_gen_names(dev, mfd->siul2[i].gpio_num,
+					 names + mfd->siul2[i].gpio_base,
+					 &ch_index, &num_index);
+		if (ret) {
+			dev_err(dev, "Could not set names for SIUL2_%d GPIOs\n",
+				i);
+			return ret;
+		}
+
+		ch_index++;
+	}
+
+	ret = s32_gpio_remove_reserved_names(dev, ipctl, names);
+	if (ret)
+		return ret;
+
+	ipctl->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
 				    unsigned int pin)
@@ -899,12 +1156,14 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
 	struct pinctrl_desc *s32_pinctrl_desc;
 	struct s32_pinctrl_soc_info *info;
 	struct s32_pinctrl *ipctl;
+	struct gpio_chip *gc;
 	int ret;
 
 	if (!soc_data || !soc_data->pins || !soc_data->npins) {
@@ -973,5 +1232,32 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 
 	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
 
+	gc = &ipctl->gc;
+	gc->parent = &pdev->dev;
+	gc->label = dev_name(&pdev->dev);
+	gc->base = -1;
+	/* In some cases, there is a gap between the SIUL GPIOs. */
+	gc->ngpio = mfd->siul2[mfd->num_siul2 - 1].gpio_base +
+		    mfd->siul2[mfd->num_siul2 - 1].gpio_num;
+	ret = s32_gpio_populate_names(&pdev->dev, ipctl);
+	if (ret)
+		return ret;
+
+	gc->set = s32_gpio_set;
+	gc->get = s32_gpio_get;
+	gc->set_config = gpiochip_generic_config;
+	gc->request = s32_gpio_request;
+	gc->free = s32_gpio_free;
+	gc->direction_output = s32_gpio_dir_out;
+	gc->direction_input = s32_gpio_dir_in;
+	gc->get_direction = s32_gpio_get_dir;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, ipctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "unable to add gpiochip\n");
+
+	dev_info(&pdev->dev, "initialized s32 GPIO driver\n");
+
 	return 0;
 }
-- 
2.45.2



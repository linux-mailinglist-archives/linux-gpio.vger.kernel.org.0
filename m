Return-Path: <linux-gpio+bounces-37804-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG9vBfCRHmodlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37804-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:18:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F87762A625
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE9C7300530E
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 08:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6B83B4432;
	Tue,  2 Jun 2026 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jU+2ua4m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC5F3BFE3E;
	Tue,  2 Jun 2026 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387527; cv=fail; b=DglZ2Wiqcq4z4tyiQo/7c9jkTZQYvUeRauJ4WhNToJITuyx04pWAtXCP9avt0csfIfW/CnMfoF+nuHp8/cL+uoYpZdSvMEZkL7/fcZ9ro5eEysyGD/kNzqhOED/tYx81VZem88DgZ19vO6lbh0pHeEdRxApS5itTm+sB8SaSxo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387527; c=relaxed/simple;
	bh=QOiAdFWBGTJRnDq5s0goR+QKz8Gqev2vtn6bYoNMnzk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rz1xbI6fgnvHXgSALqw9G+oBNSo0WbaOwbCKoLwxZHpCeEs+RfQoDCrnKPFEb9r++n9KqN1uyvQrMMESnWXlIzWlZW+yBWibM+HbgcnXaQVjGasJgJ5zFaUOByH5eq5HfDIjqaTPsQfFrjj9t5wTQp6q/biXP6eXTrVsjdtuJ+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jU+2ua4m; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GH7S5UdX5o28weQCtb05d8ScRLFDkl+N8jfyCCfLqcU2xbuvGyzFj0tmWqls5rbt1WRoMzLZZlErD3xAWGMebJB46sQHbH5UgnemQavpqew1PgsI0T2qTX0vkKhpN90fiZkDkVD7YfiblVUUOXXM2J5AYv0vJae53XzjcyOoiukSmTBPKkdCYREInQl3cwdnZRqDD6ybA6FBnkKQZ3UH/kMpa3I3LH3xy66f0ZTPqMPBuKmbCzvp8CI1ETMHeIqZcYG1Xx/xArLqL3nLIhwu4x/b6IJpb9naPwkU6XQYjNdodFTs3HVg9xyV+4qTbsW5ECTnyT3/6UI3NqJQb8wffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5310TDftYQ6ldwH416jWwpewjp+kWllnfD9IpKfQnmU=;
 b=VbIDq+kLhqCP0A+Qw8Y0ga1ITfg4EBpVXHrYnNzTbNhSGcyy3OgYcAtFyJBqXn1a1EX1+v0YGf/+v4zoUj0Mcg++f+gJCL47UMypkHyXYr1goQArQi/7FOxle4DXpqW0zrLKKCADP1xfDPAi8A0wB+DUXFpEzr7U+F4GNQXueklfDIpwmjepAhqbSVartJKAWooDAMo5EkQ9NcKol5GPi8BMl9wGDhIPsIsGEfVsCiriMqHgVpyb5ytJDnWDFEL92UPBElSqDP7YakW43HdYC+zOJha+5qqBxnrma6lbq2LpX/iWcJH4dviezSbHq+bNgqGnrJV5dMpOCgLX5iDJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5310TDftYQ6ldwH416jWwpewjp+kWllnfD9IpKfQnmU=;
 b=jU+2ua4mwvQUticxB67tw6dKrfDS0DdzXqu6jDubAZdScVjUj8pIYPugSpfyQkfe/rkDcF6AOHSbyC2yHji+aNq4yRTIVFJN+4GZQIPX+MxhtknR/Mz6MKBwfthhJysS39dL0oE/Eu/sre8YqLmdXndK6Jh1UAwIjWjA/8pZ8QoP2nsCxG+NhOe+tjKdRP3yI9Mpn94y4smy6CS6/4om40oDROTmx+vrXOwdLvGccUfB4v+kHaFVUiX15yH1R10IYtzIBlYz2f7auhQu6rcMdddfChVPokOO/XcwcLT16PCYT2rhGCKXXr8/fvSE1Ap3qsTY3HU7FTCSobS+XMKi1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA1PR04MB10503.eurprd04.prod.outlook.com (2603:10a6:102:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 08:05:19 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:05:19 +0000
Message-ID: <48494e7b-4cba-4372-9090-f40240d820c4@oss.nxp.com>
Date: Tue, 2 Jun 2026 11:05:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
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
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
 <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
 <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::17) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA1PR04MB10503:EE_
X-MS-Office365-Filtering-Correlation-Id: 74025573-6915-4b09-cc14-08dec07db066
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|56012099006|4143699003|3023799007|11063799006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
 p6Re8mWBEZV1GJJzwxiiMxKBaIgPK6uAR5rfQQsD7wLCK0qlYAVI4TuuKK1cPOm2rkrXTDagbpDyVK5/sIxb88zsNYMFaVvzAiJk5mDIqJeOy0SlIT+jE3e4edRtu3ABEuKA3YLVe/LwMXNNZaBqt7XS4fcpnzHwT4YrJ9qZFbnk+te0CZCda/I1h6qr1itqJEeouTkt6diVMeZ3cDHiSrCnMjuLYvRhRHSS8/tPEVBb9ZPup9Bi0+cZ/ZJyXB/Q2s+51JqBzTiKwyKNqKo1wkMpF9K0Tlon0kDF1HEwqBLAKZsiJf0rMsHOGzejuGgPPhql93rSNhe6isc/WnrQ+I8qiLm107zW1lzr87gwOmc5sP2W2oOm2mxRI2W2lcba+c0rvhTAHTcSXccwoIODJ3IWIM8RaUqT2m3CRnwMJDVvYnLHWyqdyQtGhKzUtUSm5vlu3gqW2shFuUiVZKfrVXQ3n1qTACegU3TkxnSO7vhMwK13S4Vl1ES+/5mTcBOv4PxURkVxWaPyrpO+3XFfV7XVDCG3MXKy26JeewC5klhUM1o6KoPTWSuzCVWAKq4CZxiQuBL0+FX2+Cl6S0P58Lt2LeoonSrVYanQlYyAezh72zHwCRpeiJZ+v6mrA1NwXD2reykeDZWnUAsG27ZVHQsVfp611wu1Tvg1iNuHu+WRDpTSspD5M7ZfoR4Nyvd0
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(56012099006)(4143699003)(3023799007)(11063799006)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bHhzdTFOR0xPVTZoeFJ6V09saG1ueEpyd2VjTURiZWVUSGN4cG5DWHRON1V4?=
 =?utf-8?B?bm1xcmRQNU9XNmFKTWVCUW8yZDJmTFdTT2lJMFNYdUpxOXVhcUxRNTdiUHFN?=
 =?utf-8?B?eWRsMVhuTkVIMC9kc0c3VitEUVlzUTlKbzlHeldBNG5pZUEzM1lveTJZck45?=
 =?utf-8?B?NVVuUzluTWVQQXlsdGhSL2ROdS9ZWDVkYVlOSSsxOUxBOGtoNG0zWnpzYits?=
 =?utf-8?B?Z1pSRkxaY25rNFA1WnhXYmxMOWdWUG93aU50WlVQWTZpWDdrdzR1TUhRRGtR?=
 =?utf-8?B?cmNyQVkzQXZiT0ZtaUErNWk4QnZKYzdNWHNnWGkwdkFadFcxZWJ2SXFkRXo1?=
 =?utf-8?B?SjdIUVF1VWhHMEdaMllkUStORG10ai9PRVgrY1paWGtFMlJBTHlhWFJKc2NL?=
 =?utf-8?B?VXBoT2VCU1AySGV3WFB0Um5lVGp2TW42MDVjSmlmSC9rNjI3Z3kxQnNMOEZj?=
 =?utf-8?B?SnkvODcrMitCMGNZYm15bURmWE1WSUdMS2ZWSzNmbjNrY3hZa3pvZnBxUEpM?=
 =?utf-8?B?RkowV05jWmMzY2R5QXpDenRjczRhVW50cEVIcXNoaXRYTFFZeU9LSFVtMzI2?=
 =?utf-8?B?eEY5aG1UaElUdURVZFAydnlQanU5SVBKZXRnc3FFNjF6TWFyakovbGlGM3hN?=
 =?utf-8?B?VmYyRk5DT0EweGUyRGQ0OHV4cFNseC9pTElZemZQV3BQeGVxZTY3OGNwVG05?=
 =?utf-8?B?cmFqRlVnS1FvOStqRmlCZG91S1dhYSttaWhBNklvakZMNmo1b2RGU3dyOGhQ?=
 =?utf-8?B?Q3BzZktCWENVUXdFeS96cnB2blI5MHJLUXEwUVUvZXNlbDhZdk5oSTBLSnkv?=
 =?utf-8?B?eDRzNGFEdllzN250RGozRXdXd2pmcDZCRitISnBqQ05LaVRYRW1TNm9HK2ND?=
 =?utf-8?B?QmVybTZBUmNkUWhWclptVitrdlZ2Z2RSczYyRjU5Zk0wbEs1TGZZWG9ha0JX?=
 =?utf-8?B?Vm5GUmNOSDBGNzZaaGdkR2pjTG1WOC9ubGxzRHg5ZDlzOExyNlowaHJEakFj?=
 =?utf-8?B?YUpFbzQzZ0U3d3VnbGhGNWJURkFRV1FFaHc2cm5nMmtheE1vL0ZQQTZUQXp4?=
 =?utf-8?B?OVZrdXNDbDJ5dEVLUkJZY2hDeTlpMEVwUExlQjJLV08zQkpHbEZPKzV4Nkla?=
 =?utf-8?B?SWNQbWw0eXNCTFFnOFd5VGp6aExLSnZISlcxek40dTdSQ1BsWFpFbmR6THZR?=
 =?utf-8?B?eDExYW5pQmVmY1hLUmlYeE0wSUwwYTUzajhKNWx3YUxCWVljREJld2F6Q3hP?=
 =?utf-8?B?STl6bEVKL3hvWWZyelNvbk9wS1VjaGVycW5WOGdSR1p6dVVWVytsbUhCNVE3?=
 =?utf-8?B?eTBLUjNvL0tkdEduQzNpVmtRZy9JTXF0Q2RqaTBEYXNXMzJlbHVrSXBRVG0r?=
 =?utf-8?B?V1ljeFNwT1Y5YTFGSjJ5cWQ1UFhvbmk1OGZPM3VIQ3BpeUpMU0s3clVUMmxP?=
 =?utf-8?B?OTBUT1V1VGd3UEhDNTZ5ajB5V0UwVEJ1djlDN2JFc29odGF4dzZYN2FoY01L?=
 =?utf-8?B?bmJWNGNBTGlPdkJpNlNIQnVUWVkwYkhFeXlhUlhPNHh4R08razhqejgvRGNz?=
 =?utf-8?B?YUkxbjUzT25BRTd4bmx6cEtWYVJsUWFDUjcvVXBNcDBZeFZIZHpOZnVrOFVX?=
 =?utf-8?B?Kzh4elIvMHZobUx3bTZLTERrRThZUDNSei8wc3F6eERHQnZQcllxaFliL0pw?=
 =?utf-8?B?ZEhLUWlyZEJHNnFrdkJQOFAwRlJmNDF6cmxaQUp0eHBMK2NJRU5EQnI3SVZQ?=
 =?utf-8?B?RDIyc3p2ZlZpMHd4NmhrVlp4K1hLN2hIWHpRSjZ0YzRNdFhqMmlWdWNETmND?=
 =?utf-8?B?VVNEVS9RNFp4aFlXS3JueVpOMVlCaWhhbytmYTVXVEpYTjNDZmZUYzNad1hF?=
 =?utf-8?B?aWQ3enRjaFlLcE1STlZoUGtkd2FjZ0x3a2ZZREpGaW8ySE5kalBWc3Y4REww?=
 =?utf-8?B?a1o2Nno5M0dBbk5JNUFRVUdRU25ha05ydWh5T1YvZ3piSkRVY3VtcjI2Y2cv?=
 =?utf-8?B?VGhuTU1IUzJnUzlHN25RY3pER2ZuZjJvSXFxRXdYeGZTOWpqeERwdnBpM0or?=
 =?utf-8?B?c2NHdmExUUhKV0k5d2plSmdOaFR6Sk5uTEZQMzdWWk5ZMFVydnBleElNa3ZJ?=
 =?utf-8?B?aW92VjB5WDFmUE5MekhVbnNZUi9pdTdkZFFpR0ZQWHBwZ0pVYWw5anRGZVFM?=
 =?utf-8?B?dE84cGdUMzdIUUg4ZmQwT2tTQm9Db1BlQ09rVHRHVFFucUM1YVhvOTJPTm92?=
 =?utf-8?B?WXFTMzFaNDRLYXlQRkkvdDVVcUhKMFA4MkY0T0ltWFRLNVRnaXIzaTFGSFpq?=
 =?utf-8?B?MmoxSEh2bTFCbHVjMmd4eXdyRktBSFkzWmJZZC9aNUVrV3ozT2t0d3FSVnVD?=
 =?utf-8?Q?HwZgWKqDhHQIdeYLyGYERxPr7DCqdWMk805wh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74025573-6915-4b09-cc14-08dec07db066
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:05:19.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNNv74zzhsrmR9mDNOPpIYG0NSBPjreHF6IAeIh8C/xGsEmw+GoS6cSza+B2piD1t79hePCGR2oCM7tDZuq5P2xG9y42Z91nOs0vVDIoa9aeHtwSM2Jyn8TQ32QQymUz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10503
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37804-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 0F87762A625
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/11/2026 11:48 AM, Linus Walleij wrote:
> On Fri, May 8, 2026 at 11:07 AM Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> wrote:
> 
>> I don't think the current driver is a good fit for
>> a full gpio-regmap conversion. Direction and GPIO mux are
>> handled through MSCR/pinctrl state (IBE/OBE/SSS), and the GPIO
>> logic spans multiple register regions across two SIUL2 instances.
> 
> I don't see the problem with that?
> 
>> A conversion would require stronger separation between
>> GPIO and pinctrl, leaving mux restoration entirely
>> to the pinctrl subsystem.
> 
> Why is that so? Sorry I don't get the problem here.
> 
> The pinmux operations have these callbacks:
> 
> static const struct pinmux_ops s32_pmx_ops = {
> (...)
>         .gpio_request_enable = s32_pmx_gpio_request_enable,
>         .gpio_disable_free = s32_pmx_gpio_disable_free,
>         .gpio_set_direction = s32_pmx_gpio_set_direction,
> };
> 
> So to me it looks like the pinctrl subsystem is *already*
> handling all the muxing of GPIO lines in these
> callbacks?
> 
>> Would it be reasonable to keep the current approach for now
>> and revisit gpio-regmap later if needed?
> 
> I'd prefer that you look into it now while you already
> have all the information at hand and fresh in your mind.
> 
> You can forward my comments to your project lead
> / JIRA instance and say it's Linus' fault you have to spend
> more time on this right now.
> 
> Yours,
> Linus Walleij

Hi Linus,

The new version (v10) has been updated to use gpio-regmap, with a virtual
regmap bridge dispatching GPIO accesses to the underlying SIUL2 register
blocks.
 
I am not fully convinced this is the cleanest model, though.
SIUL2 does not expose GPIO as one regular register space: direction is in
MSCR, input values are read from PGPDI, and output values are written through
PGPDO. These are backed by separate regmaps in the driver, while gpio-regmap
expects a single regmap.
 
So the current path becomes:
  gpio-regmap -> virtual regmap -> MSCR/PGPDI/PGPDO regmap
 
The version was updated this way so we can review the approach on top of the
current code. If this is still the preferred direction, it can be polished
further. Otherwise, I think direct gpio_chip callbacks using the existing regmap
helpers might be a simpler fit for this hardware.
 
What do you think would be the preferred direction for the next revision?

Best regards,
Khristine


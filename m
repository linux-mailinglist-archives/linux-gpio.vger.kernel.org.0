Return-Path: <linux-gpio+bounces-10576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE898A78D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 16:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562BE1F210F8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 14:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B862D1917FB;
	Mon, 30 Sep 2024 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dMHXayG2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2081.outbound.protection.outlook.com [40.107.247.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1FA19005B;
	Mon, 30 Sep 2024 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707579; cv=fail; b=M+q0yRaTvrvyEVHM1UdwvcqEs4TE6Q2BQg7UOrJtOXF7NNSMmowYH1VLjWDQxgwTUlE3QJKITdqTtVHng57IJ1UxvooH4m/pHhOB61jWLYaX3tjR5U9rlueaN3sZflvssKYm2LMZaG/YS0lC0TZ3phqDUKFR9CMWIOw6QQBoj1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707579; c=relaxed/simple;
	bh=U7sbIfTq9tlu463BZeqW3dJYQqaxHrsiCvE9K+dzPOg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kKlIBSITB1XyBvTuZ4bmX4+tC2sdoS1o62IiTDxZ592ti2C4jjv5DE7tt490bB0cd8OBttHrKBtcRZcNXoei8fnLjVnUBTkf9+Mpx8YFf4SnHiGIiHl8HfoN2QqKls2lg85EP8WpG4+f0Jtsx5NfiSgf7ZfUgojSLjL5+mH8RWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dMHXayG2; arc=fail smtp.client-ip=40.107.247.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLTmckMQlLfIS4QIeyxgzeQ4nrMVk2Y/vHALG4Xw7Y1Ey2Ae1vsr9N1JP+zM7syhouUTCw2iIpe0Kt8jKcJtnLguhIYsIE5i1qLv6IGhlltNOKfhri7GHKREnyodh8s6Di+blUb3NeqK4xNBGL38EGs3n5PKceSfWXa+6zexsT4/Z1yv4feZ9ZjjVJyo9E0v9LE0C1Li9kaM+Ydj5ZbqAm/gt6ZkVD3+dK+Logp1xa0F5MNGSIMhnHb95iROBRWT8P5eX6BAaB1hBpmCh+IYd3+fCTRYfKP/ulu7K+OxQlBatZ2fMFO96HFlHZZAkf6gi6wdfUN+pCgQJ54Hs6B9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSasoMBksPgaoFoi4RosKNDGj0TsWhtJob6em/Go4tE=;
 b=lz/XdeFlLJt9rFey6IbK79uMHPqayrECbj/wiE0SIaiUD6/VaboIJ3FoqHuSmB5tki0AGDSedOkvJHR4NrtuJwj+t8XXmczfEEgEL0bbgF6PKAwetLlgYuzwzPlWs+FTCPXmhKjpjv5d1xQWO7Wz9S9H0wR4C4uASyYAfjuB2IIAh/Rt1ghEwymV7Rl5oUvOyNz9acB82JF/AWTt+0KRF4q7wd3m0Ul3s1L6lIvIBPAgcQh6G293aPg4DdeWp00FDzibk60fGZjRTSD+Ymm0vglFoVEnnSbQV2Y7PE1q84y1ddfcJuJ0U2P2UWZ1Hlspqu7eMHPDPeOlvYJf5eTRAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSasoMBksPgaoFoi4RosKNDGj0TsWhtJob6em/Go4tE=;
 b=dMHXayG264Ce4rFTlcJWSrcDwPO7qTtwZzuQel6pHYsz9gJGsOzeRSz/vjbQp48aY0FZSS+X7T2vhUASxr1AnOwRUzo8wnPZuCVtXtlPo82h1NbDSKStxVo+9QDvM37Dr2qFHHe8y4IPsek4P6eYmPlcsQYZkT0X8GKJBIez/ioJ0Y0weOjAj6Kk0tc9Yut9rPVraEETTPjNgtf9axTBdhUsMODvTK5FT5y6rUfvsxHdFiafgn86lAVObyzG7UIDusS+L9bOiWOlKQRIhOxCDuVD2YYypu7IgWVs6ryUyqfBfGqi02nr7RWkQTsZ8Pd7vne3Cjwm2XdzKANytY9WAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PAWPR04MB9838.eurprd04.prod.outlook.com (2603:10a6:102:380::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 14:46:13 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 30 Sep 2024
 14:46:13 +0000
Message-ID: <431dd907-026b-4215-96ef-28fdeb2b43a2@oss.nxp.com>
Date: Mon, 30 Sep 2024 17:46:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: add S32G3 compatible for the
 SIUL2 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ghennadi Procopciuc
 <Ghennadi.Procopciuc@oss.nxp.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20240930132344.3001876-1-andrei.stefanescu@oss.nxp.com>
 <20240930132344.3001876-3-andrei.stefanescu@oss.nxp.com>
 <7080c117-199a-425a-9053-891a7f331f6a@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <7080c117-199a-425a-9053-891a7f331f6a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PAWPR04MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d22d757-8b4d-4995-7666-08dce15ea185
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUlJMkhOTTcyNXlybEZJNVNyY1ZDU3gzaGkrY1Q5ZFhweEVDNC9TbGtJdmhj?=
 =?utf-8?B?VlRMSVNRR05MYW9RTVpjM2xzT3F3aDE5N3ExZHd6RjhvQUZxTWZCYi94aTdY?=
 =?utf-8?B?YU1vckZZa2IxdUpvWkV6TXg1YzAwR0NtdXUwbGQ4cVhWeEpzT1JWZVExUng2?=
 =?utf-8?B?VFozZVRxVG1nT2U1aXlkd3Jab2pBUjBBd3lhODdLSzJ2S1V0emJCV3NyazJ6?=
 =?utf-8?B?dU1jNmRBVVhLU1lJMkFoZlZ0VXFHTXNuMDRXdm4xR3lhcEVaWkMvMTVvOHV2?=
 =?utf-8?B?RFB3UFI0ODZOT0VIN2lMMDFkRElDYTBVc1g4aUdLNG9PRUZScFpvVmVjV3d0?=
 =?utf-8?B?K1dOUVkvZ1pPNjU4RlFnK2xRNldTb1ErVmxZekUvQWJMeVFodEswNkF3eml2?=
 =?utf-8?B?Z0VGdm54SnFaSVBQMUd1WlcvZlF2VmpLenN3U0xEMmpScVc0ckRrU1M2YjYv?=
 =?utf-8?B?VGpKd3FmOEZUWFpxTFZzdXBaMjQ5ZWVneityd3B2SFd0bkhidEVxWjh4OEdS?=
 =?utf-8?B?Z1pkVGMvWEk4cGdCbnZ6TXlzeEhpbnRvRFM1SWlFTkVXSGVZOXB4Tm40Z2tI?=
 =?utf-8?B?L0s2cUxMSWMrUy9pSGtaOXFKR0ZnenFVMmN6blByRldseVE0cEVodUlZVWZC?=
 =?utf-8?B?WC9WaHhWbGpWa0diSm1SMURxVlBnSS9ETVVQblBueFVINmVxeDlTMEFmRlY5?=
 =?utf-8?B?M2l4WGV1bTFsajJjOVcwL2ZjRm5HOFZEM3FJNUhXR05XMkNwYnlhMDRyZXJZ?=
 =?utf-8?B?Wnd0aGY2cVVmdStRa0R6dFZVZm9mV2o0Q3RwZncyMmU4WjB4OXUvNmMrOXpD?=
 =?utf-8?B?TGpScERVTnl0UFBoZU92Qk1EOXM0MzcvMUh3eDFqYk5ZZjlBa2lFVmxuZW1m?=
 =?utf-8?B?MHh2RVIxcC9HUjFkaDg2TXV4ZzM0TW5YaDdtK0RDS1pDUG05Nm9xVzNMUm5T?=
 =?utf-8?B?MUlLc0VFbnJ2VDA4N3Z0Y3RVSnVNMWZhdUVlODcyWHhXU0p3R3FKTDFoMzE4?=
 =?utf-8?B?TFcrbEhqdFk4cUR5RzNKaGpxMnN5WDhWMlpkeE9EOG1wV0xpM3Z5SVg4b0x6?=
 =?utf-8?B?U0xZK3lSR0daTGJ0Qk04Q1cvM1VtbzZ5bThwQ29sWk1HdzFRT1YvQlJzemdw?=
 =?utf-8?B?U25sTlY0bFJDSmRGYjgzZU8yWkFxUngyR1ZYemlKSllRQjI5RFNDQ2FrOXha?=
 =?utf-8?B?cEVBekJMbmdtTHRJOEltV09YWmc0bG94eWRsajhZUDQ1cjM2OWpwclBkRlV0?=
 =?utf-8?B?VWxxWG4rTzh3L3lGbitud0JabTlwZmdIVEg1ckd4UjFmK2UvbElHZ3NOUWNP?=
 =?utf-8?B?aWRyTGVxMlF3aElkWFZnVHJHZktUcitRYm9xcHdENGJjclFEaWRvNjhaOFh1?=
 =?utf-8?B?cEluSkRtcVBmQ1NPSzFmTnQvWk5sZlhaNTExZjc0Rk1VV1g0WW9CMG5yUTgy?=
 =?utf-8?B?QjBqM0l1QkVEZk5xbk9US2dDRjk2UmtIL0ZwZ1psVmhnejh2U3RwUTRxWmpU?=
 =?utf-8?B?WWZYZ1NGRTJ3TlRtNHJnWUxBY0NueUR0Z2ZyTE1LdEc5NmV5bEVkL2ZPYWx1?=
 =?utf-8?B?b0UzOEpBNDQ2cE95R1I3T1pHUG5wRlNzQjZvSFB4MkExT2xPb1o2QzZpOWN0?=
 =?utf-8?B?WXVWTXVsaHpJNE5aSlkraGYvYzNzZlI5K0VTWkorQUFkZGVnbS9FaTJBS3Ru?=
 =?utf-8?B?U2Q4RW9Xcjh3enJmVE9ibnR6Y1E2QzRvZ0ZORmwvaDJsbFpBdEorRFFqUTZ1?=
 =?utf-8?B?MmgrTFNHZ3g2djhLWXdPeXRDaHZKUEJ2WHBURFp6eVBZZVZrYSt0Y0dLM1Fn?=
 =?utf-8?B?S3BQZUZKLy9Qc0h0NHZVZjRPdTZFRDRaTFlkbG0wYkZETW9PV2RacDdlT0tF?=
 =?utf-8?Q?gCwzQH6YmABUQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OURWOElLRnh5Ylc4bSswdDhXeHpHcmF4cGhob3R6SzRON1M1eEh3ZXM3Tkdt?=
 =?utf-8?B?RllJYnJoR2M4U1NwR3EvOGlPdWVJQnQyUHA3a3cvTWFYNi8vZG5ibXR6Ym01?=
 =?utf-8?B?bmw4UTBCSFRCRDljMWRUWnNHL3ZPUHBBN2srRHNVcEN1VzFRNnMwSkplK1dz?=
 =?utf-8?B?VXRCVHc3SWdqTENKWlMrVVdwWE1VbTR0V0tLYW5taFRnOE1LOStOajJvUEx6?=
 =?utf-8?B?OGR6VmNoVnhmd0F3S1VOMm5yRGh2U2tIYTVyZmYvNHAySUtNM0w1RFljdEpE?=
 =?utf-8?B?NzlzMWdoYkNFcEhwbEx0RTUya2E2R0hRbmlXZnE3cURlTFZEVUtoL3F3VlBB?=
 =?utf-8?B?MlBzM0Q5NVJ1dFcwL2hqN1UxdW9tNU9xUkoxdjBqNm5ZY1pHQVFZTWZta24y?=
 =?utf-8?B?THgxWkpUcTMvMWpWZEJ6TDVIZlZwaHJqVDB1eWVnV0FMcFpua29sSWMwT0tw?=
 =?utf-8?B?NzVsN3BFQUhtc2t2WXBlenZiUU1GdXlQcGxlOTJrK0ljNGhydG5uNU0yVTZ6?=
 =?utf-8?B?djhOYXVpaVgrUHBXQU95V3pXU0ltRnRzTnNVejlVMkRzc3VhbkZKZkNpbk9G?=
 =?utf-8?B?MzZYeXRSci8wcjNJM1hGcGlFQ3dzbmxqbm5mdG8rMjJxOFBUQUR1MDZ2bHNm?=
 =?utf-8?B?Ymo2b3B3TGdaZmJMN3BBY3loQ2lHQy9mTmRNTWtjMHlEOG9aUS94KzJMa1ZU?=
 =?utf-8?B?eEdMRlhjbEVDd0R4ZEs5ck5LZ2JtNXk2cVlMSlRkWW53NktwVldlc1ZzN1Rr?=
 =?utf-8?B?Ly9FQUoycTRabFdUbjh5ZGZneXFzVkpWdzB6aHEvRWxMbTI0QUtQMm1OUGlw?=
 =?utf-8?B?TVNvZHhRQVBsNFc3bHR5eUZjM29tYzdJVkhVRnpKcnJ1b2o2bUNqLzJWWjFI?=
 =?utf-8?B?S1pZQlZiSHMrZjNwcjMvZW5yNENsMFJNRDF6Ym9wb0dCZGVTaHdHV3NkZWtO?=
 =?utf-8?B?SkR0aktIaDZqSCtRcjdvbHdpdnFmL3U1RDZscmhZUEZCdkdUZ1ZJMzhzVWFT?=
 =?utf-8?B?aTdnUGtTRENCKzk4eWU1NnE1UDc0OGFPVTdDR0c3NGxTUzdnZitRbGJ4Zk9t?=
 =?utf-8?B?amJiODhrVU9tZHdSOUxJSW0ydHEyQWpvenV3djBxRURzK01yWmsxZmQ1ZFo3?=
 =?utf-8?B?MnFhNS80SzlxaCtkb0JCOTM1MXRmbnpCM1dXaVBhSFl4d09BN212SUlZWTJm?=
 =?utf-8?B?K1VRNWFUUWFMZWhZL044aWJwQktsT2NqWmpaQXZvMVpCeWN6ZEVjcmFKQllM?=
 =?utf-8?B?S0hJdi90MEpOa1BKZ0J6Z28yQi9vYldueEp6SW1waHloQjBYaUgzKzUzZGpT?=
 =?utf-8?B?eHdQQkpwSTNYc3V6SG0wZ0RpbHRwVXlsRFdWTWZmMUw0NzA0cGkrNXdhQ0M2?=
 =?utf-8?B?S2N3R1FFV0JicUgyZjYvWEFMcGhkSndiUGEya1dLUmw4RGRGeHQzOCsyNGVY?=
 =?utf-8?B?cjZrNllTQm00WkRiT3RZZWVyNHE5TWFkVTU2Mm44a2I3R1RXemNZZ2RRL2NY?=
 =?utf-8?B?RlNBZWpERERyZy93dW9PRkxTckg2YzE0ZnN6L3YyWFVZeGh6UVFuUWNKOWlt?=
 =?utf-8?B?QVBEZUw4enh4M2FlaXpxQjgySUNUMk9uYWFTZm1vVk9DVExPZW4zR2NoWU85?=
 =?utf-8?B?QWxDZ0t3S3RpK244U2oyMmMxWjVOTG5VUDZqdVI4azF0dmROUjd5UWtDU292?=
 =?utf-8?B?TFNIeWp1b3JwVUdPNllINEFEWHVXQXZNQmd0YW5tUnVSeHo4UUVodzBWbFhS?=
 =?utf-8?B?azllSFZFWFF1ZHhiaVFIcmpoeVRzUmlHdW5JZkdVeDB6enphOTFuV0lBVU13?=
 =?utf-8?B?S2VpMlNneDFtcndSeGZXRmFOU3FVejBTTlNHYWUwcHpGdWx6MEFSMDJOMWlR?=
 =?utf-8?B?WUhrMjc2OCt5V3k2MWNkRVI2OWt6U2F2bHRtMDJXOWZWanBaUG1lYjNHRTIr?=
 =?utf-8?B?c3NCditzYUhqS2xxNWgwR002WkJWTGFjMWNlWmdlaVpqcTBPVUFrcVJhQzFk?=
 =?utf-8?B?Y3p4bDdFZ0FLMVI2SnJxbnNzamxHUkhMR1VuS3dJZVlSL2t3T1duU1M4V1pM?=
 =?utf-8?B?cmNKUkdRa25RZjNRSFVkM1R1Nlg4NXVJUU50T09XM3NjaitVOW1Xc0lLUUg2?=
 =?utf-8?B?b2R1NERrTjcwYlMvQktlaTJHOENJclFMWkJSWFpVUnd3bGsveFREOVN6enV0?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d22d757-8b4d-4995-7666-08dce15ea185
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 14:46:13.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKix4nnDgVds5Me4nPPH3T7pUhxg4kksTp3Fz6oCvDua3+DCsXpXK9KytNS8g4q5xxvodNPy1djGR+NuSHx6Af2CkZSbDqGZka9g97x4d8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9838

Hi Krzysztof,

Thank you for the quick review!

On 30/09/2024 16:40, Krzysztof Kozlowski wrote:
> On 30/09/2024 15:23, Andrei Stefanescu wrote:
>> The SIUL2 hardware module is also integrated into the S32G3 SoC. Add
>> another compatible for it.
>>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> ---
>>  .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> index a24286e4def6..454773e7aa07 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> @@ -25,8 +25,14 @@ description: |
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - nxp,s32g2-siul2-pinctrl
>> +    oneOf:
>> +      - description: for S32G2 SoCs
> 
> Drop
> 
>> +        items:
> 
> That's jus tenum
> 
>> +          - const: nxp,s32g2-siul2-pinctrl
> 
> Drop
> 
>> +      - description: for S32G3 SoCs
>> +        items:

Just to make sure I understood correctly, it should
look something like this, right?

    oneOf:
      - enum:
          - const: nxp,s32g2-siul2-pinctrl
      - items:
          - const: nxp,s32g3-siul2-pinctrl
          - const: nxp,s32g2-siul2-pinctrl


> Best regards,
> Krzysztof
> 

Best regards,
Andrei



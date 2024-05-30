Return-Path: <linux-gpio+bounces-6908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A08D4767
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 104381F233C0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8F31761AA;
	Thu, 30 May 2024 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="JHfbBcGt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2068.outbound.protection.outlook.com [40.107.7.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D60317618F;
	Thu, 30 May 2024 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058654; cv=fail; b=c4bt0rNs0mbsFYU8+/uccDJ3qq8wSjwStGF1PJp/9NlVkyXQ1TNgN45+sPqkcg/ce/1/H15wO6Q3WhlX3zZ3c6XZIlmUo5pvcaZrx+S41vruNiQSUBKudsq9sVOkjPVqUlEwYnTwVkAiqSYdEqDo+oxyizeccMaixTKLA45/cTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058654; c=relaxed/simple;
	bh=lY5cnNjCnzHMNAYe3UNeuptGPxRKDgDGA3KNChZ4JIc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l19YIUPmOZUN+7fF3mH1CDEmGu8phzNN5+cVrthtAaaDxqSY4/xi9UK3i9qvZFfaPymeQyJxfEZ+vf+6zc9rgLEif9enstKZiTJR1c/5c/LYv4WKiZ7WD7ajfH0mFg3BoIk1ANlFEuritYWycO8CT5scduR+MI3/DkO2JKC1Slw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=JHfbBcGt; arc=fail smtp.client-ip=40.107.7.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APwcAvXeDqdbhkRD9xmzZhwhqmoA60G2NTe2im8M7srEp3xFd7o7oNLg8NXDKJD3PBsgSxX782JDu4F/j/B6JzQs5yEEHEe5b9ZEdU0PQwl/XSt0Er88hA0Aps3X3szrsEkIefzCfr+WFQ5yDwUIJ3WiM7WuHXFtH2jWuX79OkLqLQJ5xhe5i1KUYIuIx/yDviI4+KFpWlBq062mbN3Ubz1/w6QJBMo90G1qtwCsk6oumBEl9wluEE22ssMmlxF/4yaPR0AzmDO+4oPlR5sl6a589gVZ1IVfKtsxpkwG+4obYGSo0DrTqlfBoOGjW1AZ1cBIGJ/OKHy1r02Uj9F7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lY5cnNjCnzHMNAYe3UNeuptGPxRKDgDGA3KNChZ4JIc=;
 b=OnVnQfMb2c1NBpw+KVs2J+sqHVc3bi3YvnAfYbC98PfCwm/ubfiu9C5Zmrgy6TnhgjdH/4mPQOp5YrpMEUJMYBLHwEABTQo5A/CwOj8Ci2n7N1vc6nEoqBdYr4G71GpBzSi44UBwNoB3e30jTzq5WlhbdYG19lHqSacJnJ31nOeK3HUrDWsLOYqm5bAmzb//V5O7/O6FiRO6ANbiXw5MDmEbPanJ+DJKg9Jhkre3LO3m+BB6eZbC4Z+lfM2KZIbDRrgwX7LfRdwZVWbPV+MKfVow3kVMevAP87ZmJV2F/30BVtyqXXYXVnxER9me1AqE39CV0Zfb5PrQka6XUv2Wew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY5cnNjCnzHMNAYe3UNeuptGPxRKDgDGA3KNChZ4JIc=;
 b=JHfbBcGtfLAER9e5lgF4ChVT3GSVeP2KBDlMUeg3RJbPIW0v50zKCnVCDHfCMT/eCsoikk3bt2Rz6fZmCyNXj3OeHtdQu9/d8JNLFHtMpFVwQ7h05EE3Lwpb57WRbTmFRX3jKRd9cT7xVwWB+1VnAy/UdOKhBL+03ne52P0Z1ig=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8856.eurprd04.prod.outlook.com (2603:10a6:10:2e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 30 May
 2024 08:44:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 08:44:09 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>, "soc@kernel.org" <soc@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Angelo Gioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chester Lin <chester62515@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Damien Le Moal <dlemoal@kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "Ghennadi Procopciuc (OSS)"
	<ghennadi.procopciuc@oss.nxp.com>, Hal Feng <hal.feng@starfivetech.com>,
	=?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Jacky Bai
	<ping.bai@nxp.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, Joel
 Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Matthias Brugger <mbrugger@suse.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Orson Zhai <orsonzhai@gmail.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Shiraz
 Hashim <shiraz.linux.kernel@gmail.com>, Stephen Warren
	<swarren@wwwdotorg.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thierry
 Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>, Viresh
 Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
CC: LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: RE: [PATCH v2 18/20] pinctrl: freescale: mxs: Fix refcount of child
Thread-Topic: [PATCH v2 18/20] pinctrl: freescale: mxs: Fix refcount of child
Thread-Index: AQHaniVkZWlAc+ixjEijPTWAKiPHFrGrYKWAgAQ9t9A=
Date: Thu, 30 May 2024 08:44:08 +0000
Message-ID:
 <DU0PR04MB941783DEB48C73844CD3FDBF88F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
 <aa58efd3-b502-4bed-8c84-e5d78da23fbe@web.de>
In-Reply-To: <aa58efd3-b502-4bed-8c84-e5d78da23fbe@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DU2PR04MB8856:EE_
x-ms-office365-filtering-correlation-id: 77c0b891-a678-4e4c-511b-08dc8084ac08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009|921011;
x-microsoft-antispam-message-info:
 =?utf-8?B?WHB0YUdlSTNHeFduNDNHWmNWUmVsR3ErcHhBREh1Z3hWUjVmZGxjL002ZzZv?=
 =?utf-8?B?V2lzRFRpMTlWS25xVFBnb3lMbEJpa2pydUZyN2ZxeWxzN0lnNGJNV01iSGx5?=
 =?utf-8?B?alk4V2RYZWp4SmJmNWtYNm9VdjNrbHZPZ3dJUytpM2hQRWNOeVo3N0VlZWlt?=
 =?utf-8?B?RTdIREJyZnNXa1hrU01GUnJsUHlSaWRFQStQckNDMStsS1M4L3BtTnZXR3Ji?=
 =?utf-8?B?bzQzK1I1Nmh4N2JncGV1N1NSaDNNUkl1M0xIbkVPeUZIL2dTQXhLWUdhTEZm?=
 =?utf-8?B?MFh5OGcwaVpZWEs3RUdtTEFpa2lHbU5Obi9qMkVhaHJSblVnb1JrL3VQZkVp?=
 =?utf-8?B?OHB3a2VDNzNpR3lPNmxFWWVuL0J5R2ZMRWR6SzF4TUlnV2VBUlNCOHN1aGxN?=
 =?utf-8?B?c3d5KzZPZlMxaUJ3bnkwUzh0WHdsR2x3OXdRRFRySFFlaVVPQUNWMTVnbFAz?=
 =?utf-8?B?ZzRod0NFZy81Q0RSOHhkWXZ6Y0IxbTVWczY5TW9maWFRdGdORmMzQXpRMCsz?=
 =?utf-8?B?TFZqK2Uxb2FnUlRJUCswVGtjNFJXWUxsbjRjdThWZ1N0OGtZN0tRZFJQbWhP?=
 =?utf-8?B?ZUJHNS9tUWZRVmw2djVCS01mblAxQzIrVnd0OHVRWUVxSXd0dTJJS0tZdEQ1?=
 =?utf-8?B?QTkyQm1HVEJFb1o3VFpjMW9GSk1VVVhGcjkyc1RwMlNhYlkxT0M4VFZ0UWRz?=
 =?utf-8?B?VmptR3VSTS83b3JoNjhnR2l0VzJwWUxUOFZ4ZUIveWRyakthRFRmU3NyeUkv?=
 =?utf-8?B?NjhaaWxkektLU0pFczg5OWJiQkpxOWc0SHZvcWZ3UWtOdjZoUDVRSE5MY1RT?=
 =?utf-8?B?aDJ6bWR1Nkk2aGVmM1lsMStjd1BRT3NIL0NQMWVEUWw1ZjJqNk5jY2ZzWWwv?=
 =?utf-8?B?VjMvSzlFWVNHUkFERXBsWDZnbEdCZjBhckdaQ090YVlaTngxcC93M1lXT1RH?=
 =?utf-8?B?Zm84L1RmR1FDNkg2RDM2YmE0RnhDdkVwNkFrNG9HblZ2ZHY0V2J3NWNXN2Ur?=
 =?utf-8?B?S0M0N2JNbGJKOU9SUnNDekVSRURiVExCM1lpRTNIUnJ3dWVOdmpUQ2ZrY2Ja?=
 =?utf-8?B?YTFuajEwaUozUGRyQzl2bDRkdkFnUlJQamllT1dPU3ljMmwwQjJ4MHEreDEz?=
 =?utf-8?B?TUlSSWF4UFM3OWRCdkVKYXJ6eEg5cVRwRVBQRnV5YmFxZkZmMU5vOGtTNk9W?=
 =?utf-8?B?cTZXRVNiU0ZrNHJxMmF6RVd0Rnh3SDBLb3NMeGNUQnNnaE5tb3NpelQ4REtm?=
 =?utf-8?B?VFNPZ3duTFVmUEVhN2hDS08zMFpKdFk4Q2pubmpzNHA1QlJRWXh6bXh3Ry8v?=
 =?utf-8?B?VVdFbmJ6a1prQlIveHhtand0Z2xYK2VGRCs3d1VRNUJDMlgvcmhoTzNOdW9F?=
 =?utf-8?B?LzM0Mkt5Qkd6TW5vYlRpbEdmOXJOakgrZEJ3c0duTmR5RTYvSkE2VFM1ZTVQ?=
 =?utf-8?B?YjlGQ29KemI5RHBVMzF1SEtybGZiK2RJTmQyQ0RvSVI0bk5QS2hyWFhJdGQx?=
 =?utf-8?B?c2FLeUl5VXVEeDNrMzBvQXM1VWdOdUN2bWdGVVVwSUZUK2ZGem54RjViRTIz?=
 =?utf-8?B?djZsUTdPY1V6K1A1NHYxNVJ2UldvTGhGY0swM1Nwcmx3WkJTQ0xQU3QwdnV2?=
 =?utf-8?B?cTBZbVhWd1VNVWIvaUhIMXpRb25pSiswYlJLSDlTSDFDeUt3S2loNGRrNUdH?=
 =?utf-8?B?WnpBMWQ0eXoydUZSY1I3YjhFaGVBNUNjeHk1cmhyTlo2M3ZVeTRhY0tzZVcr?=
 =?utf-8?B?RGUxL0xmSUEwNTNUS3BYeFJoWE13SmJweVlBSkdpdEtUMHhsbjg3dW9XUnEz?=
 =?utf-8?Q?0+seWBIt6kb2B5WxohRc+yj08p3lOItzflD74=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzlTLzkyWGx3YmF5d0Y1VWlHV0xMZituaEdxbDBLSTAxTnJ0SkVCWFYxcVRy?=
 =?utf-8?B?K2hMTGxyYzNVOE1FRXJZcDkzeTJjSTAxN0RLWmhVYUJML3ZOZFBZU3c4MzNl?=
 =?utf-8?B?MXVkMkFNVzhlMms2RjFQTDBrZnRITHpyK1JIZjgzZkhmVnljRWFMaXF0OHJl?=
 =?utf-8?B?RDJPWGxqY0dPTTFUWXpBUjJSa3hFMlQ4NmNUbDdaMXRvOVpOVTFwVzhwN2hT?=
 =?utf-8?B?cnk5RXlyUlN2N29HMENQaEdZV0dVVjVJOE00eC9xeUJ0Y1lKSVp6Wm5zU2Jn?=
 =?utf-8?B?R3lNYUphQlV1cGRyZ0M5UUxLOFAzZjByV2EyclVQSWJqRm40QThJdkpKWUZO?=
 =?utf-8?B?STNjdjk4NWYrMk5RcDZiUlMvem5mOUdScmpoSEFFTkljc3diWkdhVEh6c3Jr?=
 =?utf-8?B?QVY5VEJuTmhhbTk5NWl6a1U0REJVdFYydTQrbFZ0Q1QxcXp5RlpMUHlhNHRZ?=
 =?utf-8?B?Rm9ENmxZbnpPc2dMU3lvWWREejBIZFpoYml0NGJ3cncxU0tacEwrOGd5clVK?=
 =?utf-8?B?ZThweWtFTGN6Y2FmQ014VTFHbC9Uai8yMHpEYlo5MjU0OFNITXRDekhBN2JT?=
 =?utf-8?B?U2oyVkxUN2RXMXNvNkV4bUxIc2RTTFJobHFPVnlpQ2NZYkM2RkJHdEJZNmkv?=
 =?utf-8?B?RVF5QVcxclFpeFI0U0F0MVk5dDNmQVZRTm1LS08rSngrUHFkNXAwM29MQTZv?=
 =?utf-8?B?akIzZ0IzM3lCc1duYjlweWF3STk3L2gyZTVwc0JrZ1lFek9qOUdFTC90NFNE?=
 =?utf-8?B?bXNzdWZjRXZhRGlLYkgySUxsa3RQRUtpRUE5V3JpY1lpSDdkNXk3bXRjN0hm?=
 =?utf-8?B?dXRtQ3A4ZldtNkZKZUVSbXJHMmdjdGhoS09YZlhhK1NmdTJzYTlVbkcvN2o4?=
 =?utf-8?B?MHNHQXJ3VGZ2S0dQZVhhWERnYzh2RzRSNm9jVDlaZElGYWYzZkFZZWwwaEl0?=
 =?utf-8?B?R0psdEhzV1BKVmVsRmgrUEpmaVRCZUVlM2hvRjdWaTZIT05obXpsWC95NHNM?=
 =?utf-8?B?RElBVjJ0MFUrcnh1NXQyUHFoUEZ0TDBVdngybzIySEQ4Y2FqZnA0RVB5RUxy?=
 =?utf-8?B?U2N1ZEFjazhiYTdLWGtRbzl5aExwVkFOcVd1Q0hIbXRQeFFtVlpmdzJYNWVE?=
 =?utf-8?B?R3U4ejFTZkJxZ0liblY4aXlKL3VRcll5YXZYY3FQWFlnTmNSbHYxZUFBZndh?=
 =?utf-8?B?djJGUFFvcTdDcG9idEN4R1ZMZWRvVnFJYlFhZlNNTzB2c0dkT0txZStUcXgy?=
 =?utf-8?B?NUxma3BOMEx1REJHbVhxR29yMHozQUtRVVdxQmptU1hPWFgxclZ4RGFwWU92?=
 =?utf-8?B?SkpQR3ZQcldiMHFod1V1VFRRZFJwTUphSm1sMVVFMDZONGFDeEVrTHlVOWFz?=
 =?utf-8?B?TVpwTys5VlZMTFQvV2F2TXNhYnloV2MxWWVMRkN5d1BKT1NiRmRmNVNreVFj?=
 =?utf-8?B?bVRXN1BObFo1ZGt3NWxEcHdsQ2xYZ3Zhc3pHU0lYOUhQMGZrTWpPSE1FSVUv?=
 =?utf-8?B?TkFldWJQNlo1V2s5STViVnB5bm5NellNdlQ3aE1HN3c1S0pRc2U1cmlWVlM5?=
 =?utf-8?B?LzhmZHB2eXBKa1IwTTBQLzI3dHp5Q242dnRidlN5OWJUZm92TFBmY1hkaTRK?=
 =?utf-8?B?bkQwUFkvQVhlS0ZPenUrYUxFSmplUE5kNlUwMVJwYmZtb3ZQUUhZOGxyVVpE?=
 =?utf-8?B?QnlOZTdCRUFBUk1Za0VKU1pmaXlwSi9VZFJYbFgzdm1ZR05JOStWb25zcmZ1?=
 =?utf-8?B?bTdxU05VWFpmQ0o2UUlyNis5N21BTDcvZ0cwT1FDNVUwTi85NHN5VW4rTnc3?=
 =?utf-8?B?VjZVOEVubjBUdmpkT2d5Wmxmd3BtcXJqZkh3c3lucmpyVEFOK2RDMWdBakxV?=
 =?utf-8?B?WWo2V0VIYmhSc2R6b1hZL2dsRC9yNWdNREVlLy8vbU1mQnp5YzNabHFRRk9I?=
 =?utf-8?B?NTh5NjVvTHorTVRjNmR0aEdzNHBIT1JlMGZHWUtOTS84RUJpN0tsL1RQMmlR?=
 =?utf-8?B?enNYNVpVRS94U2VjQUFGeVg1bEhUTTRqek43cVc1MU1SL1Vnb2sxcmhjak1E?=
 =?utf-8?B?S1dFT3pwSjdmQ2ZFQUtKQU9UUFJpSU92cys2MWtJVW1XamF6VVN4NHBCTmtz?=
 =?utf-8?Q?dHu4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c0b891-a678-4e4c-511b-08dc8084ac08
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 08:44:08.9823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7hZ9840t60j4IRntB33hVVAfdsRol41wy0W+y8gL/qlLpUeLvzCFEeyQE4KW1bhwVtjnMVo9R5qxiD/dNW2sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8856

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDE4LzIwXSBwaW5jdHJsOiBmcmVlc2NhbGU6IG14czog
Rml4IHJlZmNvdW50IG9mIGNoaWxkDQo+IA0KPiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIHVz
ZSB0aGUgc3VtbWFyeSBwaHJhc2Ug4oCcRml4IHJlZmVyZW5jZSBjb3VudGluZw0KPiBmb3IgY2hp
bGRyZW4gaW4gbXhzX3BpbmN0cmxfcHJvYmVfZHQoKeKAnT8NCg0KVGhhbmtzIGZvciByZXZpZXdp
bmcuIEkgaGF2ZSBubyBwbGFuIHRvIHJld29yayB0aGlzIHNlcmllcyBmb3Igbm9uLWFjY2VwdGVk
DQpwYXRjaGVzLiBJZiB5b3UgaGF2ZSBpbnRlcmVzdCBhbmQgdGltZSwgZmVlbCBmcmVlIHRvIHRh
a2UgaXQuDQoNClRoYW5rcywNClBlbmcuDQo+IA0KPiANCj4g4oCmDQo+ID4gb2ZfZ2V0X25leHRf
Y2hpbGQoKSB3aWxsIGluY3JlYXNlIHJlZmNvdW50IOKApg0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdGhlIHJlZmVyZW5jZSBjb3VudGVyPw0KPiANCj4gDQo+ID4g
UGVyIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sICdjaGlsZCcgd2lsbCBiZSBvdmVycmlkZSBieQ0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG92ZXJy
aWRkZW4/DQo+IA0KPiANCj4gPiBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKG5wLCBjaGlsZCksIHNv
IHVzZSBvZl9nZXRfY2hpbGRfY291bnQgdG8gYXZvaWQNCj4gPiByZWZjb3VudCBsZWFrYWdlLg0K
PiANCj4gQW5vdGhlciB3b3JkaW5nIHN1Z2dlc3Rpb246DQo+ICAgZm9yX2VhY2hfY2hpbGRfb2Zf
bm9kZShucCwgY2hpbGQpLiBUaHVzIHVzZSBhbiBvZl9nZXRfY2hpbGRfY291bnQoKSBjYWxsDQo+
ICAgdG8gYXZvaWQgcmVmZXJlbmNlIGNvdW50aW5nIGxlYWthZ2UuDQo+IA0KPiANCj4gUmVnYXJk
cywNCj4gTWFya3VzDQo=


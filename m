Return-Path: <linux-gpio+bounces-32138-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NANFdLMnWnfSAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32138-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:07:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E57641898C2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 17:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ADA5301F99D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 16:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694ED3A7828;
	Tue, 24 Feb 2026 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZPzgYE9d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591533A640C;
	Tue, 24 Feb 2026 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949135; cv=fail; b=JYcCHKlBJFvnR19kY09Z1o6iev53ERiQypdlsqPBGiL8cX0BdGWA93FK4t8EGZp/arw+7qUouhi/D69go5ElHdypEcTc3sHsnNK2sAGQyupI/vEGwucwc2OsxikU4IOIwuyqH8dgdLdrvkbF+6VbSvUcDkZbWIoriZg99DxbGqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949135; c=relaxed/simple;
	bh=GEXF4uEDP9hy6nareRzX0JJa+cXs8aIJYFg6QKFDB8k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ub2lIyIObd+XT+MUIMvrZqZEDdHklK86gNIQc86b3YyWIJIA9IgmJqqRhIdBcy3JFpEg/SceJtGpHxeiEgmL7X6vBX3E9LVNXXFxn7PiGFtbM+BEC1Wtif1XZihcId9zSlgHOz16quWg1YWjXwuzd8/d6ynKpF6yc+C+bisxCuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZPzgYE9d; arc=fail smtp.client-ip=40.107.162.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPz6hTXQafekoOoQJkpIEQ0qVWMrZ06hRnNoo4kH1TvhD59IuUB/CmlSKfs+xuFOLlnAOsaqNkY7lwYJUD3ZNlk0nFQ3j5yKZDwFz1Hh9NIFm2wuBK/oJvPK8o6H+5o1W5bFdudVtnOW2kRq9+Ujk8nlN4bPNPjCKq5zDiDxWcD3QigFi6IHfy+W5/8PCHeCIyVSb3OT3MS91k0FtAFm8J/LVDWNhhz1PT6l7Ps2l5eIxue6++D1NV5cMv2wxsHlCi+x69DhDgVXcbK+7x9KoXkWpHhHIDh45er/kG3UbgaztdnUKcmve6jWwey+KLMmUywOabfkxfG2GE6V4Wup8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEXF4uEDP9hy6nareRzX0JJa+cXs8aIJYFg6QKFDB8k=;
 b=sdR7D3kFCtlTpIN6A1Fj3hLQv6VziJbN8uZMX0xWsex5/dOHu3Z9+6UvraOfDKZ3huzgztTQgnn/SzfXX5eByRICJtqcD52PxdKlvYKXn3LmYl68cB1hx76iSf4aTlOKR7gQZ1u2+XLRj2D+Gxbo4WsQP7DGRDy6osE04jXP3seV4qJYYacw4BG9UdX37E7SkSHcqBycGL5u8IRwr7NPBSgKT3MZYgJ04KZdgTn6EtKQd/6y2L3e8HNfYiSbolqKJ8hR6jegKvQ97EGlcFSFZBsfJI4mVZdsPNZv1rJlP21GwN1Uii4VPFUaot7oYLXlAl/GrJuxWI6RFrTprJ1npQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEXF4uEDP9hy6nareRzX0JJa+cXs8aIJYFg6QKFDB8k=;
 b=ZPzgYE9d/VE8FIby2spbn3DX7JYDFAoADzJ/5PlAVy/L8yoMqG809sCoPotjqo9mBczMJ+NtqQFxiuhUkt9iR7QV7dZJUAjQvQsCdv7COLO2YITL8grsE01CcQDhrjx4hP+PAT5D7W88ECrTPUbjI3Eewxy8VIv0MWhPcEkpZRIPgqo36iCwjz0zRYbTEWKEZLW/EAGEigSLui28Ean+nEyrZG2lZOVtmrFyGJ5c6VR8++twqIptzcWaROa5evdCdEg3zt2vX9aeHDfDOVgebNMixH/slOn4d2fSOI/ZiUSRCoLaQHdbzwQf3HCos2Ntje0esbFhepenglRTeHQvmg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI0PR04MB10951.eurprd04.prod.outlook.com (2603:10a6:800:25c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 16:05:27 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:05:27 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpadkcYnPc2niBkyvRScWylLqYA==
Date: Tue, 24 Feb 2026 16:05:27 +0000
Message-ID:
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
In-Reply-To: <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI0PR04MB10951:EE_
x-ms-office365-filtering-correlation-id: bfd63a25-2d59-4114-c275-08de73be86b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGQzYnZrUVpxTDFUUEMyU2ttZzZQdlNkVERKdWFsUkVOaWtXZHExL1FzQjBr?=
 =?utf-8?B?b3IzVkQ1Y1piZXpnZk12cmVBTUdic3J2bUY0dEE2YUhaRndvUU5DT2NFeXRy?=
 =?utf-8?B?akcwZGI2WDRWaFlsZG4yUnVSWnduVTZ5dFpYdDdIMmtwNVR3WUlSZ2ZSSC9l?=
 =?utf-8?B?RUYrRXlvUzFvUyt0THVkanVVUjJCYkJTbnJWUkpZWTNGSk1XM05CbGR0ajlZ?=
 =?utf-8?B?NVZ1K2RpNUVxcERFL1pKdllSemh3R29SRlZ3dmZteWFINHJZL2cvbGhiTXNM?=
 =?utf-8?B?a1ZVR1ZuVFlVNTZIZFZ3L0VFSHdUd25hdDNmem4zMkg2T2ZaNTlZdnRoRVBD?=
 =?utf-8?B?anBtWmdkR3ZUbWpLR3NkZlVjc3BZMWdqdnIvaW5uaFcrSTVVL29EUFFLUEp6?=
 =?utf-8?B?TUFyNGE1c2lIVU5LSGxvYlZuQmh3dEJUTWxBcUhKVHdqU0k3Z2d6dVNYZjc1?=
 =?utf-8?B?N08rT2QzblNUdWNabDgyVFIvYUFJSXFRenFxZ2Mybm9vNUdzZHNNdzJPUVIy?=
 =?utf-8?B?V1RYaDR2TlQ2dHMvSWFvVUFnYXozZUN3ZmVuVXRQZWQ1NnpZemJCdlpsbFQ0?=
 =?utf-8?B?azlQS1hENW53SVJkbHkwM2twbU9UcUlGVmxzUncwOWxFTWt5czZSUzlJa2FH?=
 =?utf-8?B?SHVXcFZQRG1OVXcrWEE1eHFSUm9Sc0pwVmdlVEFTeS9XeHA5UjJsQWppalhJ?=
 =?utf-8?B?Ujh3d3RYRDFjekUwVGNjWWViV3VOSzNEUy9SWWxyN0EyVkFxRE5XS3lycE82?=
 =?utf-8?B?eSt5MkNFL1I5YlhFRXZnaWMxdDRqaVlEckE2VmZSeGg2bWtCbGdMaWd4aGNa?=
 =?utf-8?B?eTVvTTVqc0wxNzBpN01TUkVValRneGxBajRHQXdhakIzeWlUU3RXRWJNMVRD?=
 =?utf-8?B?N25veHl6OGFCQVJlUElhRWN6QlFjNnpMZ0ZDYWVOL1R3eVFYaU9VbTU1am9o?=
 =?utf-8?B?THhSRS9hLzR3bkQ5amplamlLejFBNG9IeXl1REV1NUJnckdrUFZHNW41dTQr?=
 =?utf-8?B?a0c1ZzNpYWxsSVllZy9raXdHN2p6RVBPVEtJU01LME9LbWx4RFI3YmRJdjI1?=
 =?utf-8?B?NjlXcFpxdlE1UitHaDdqM3VxK2tLQ2licFJmZ3pnbU1mbHFGRVdCYXZTUCtx?=
 =?utf-8?B?RWlKU2FNNy9nVi9XTkZtbldIbXRabmd2N21ZazEveWczM1M4cTdJcUY4d0RZ?=
 =?utf-8?B?YmhnSXZiRkxoT1BqbHdYRDFIOTcwa1FoeWkvN0l0a0MxU3lxWThFZ2lyT0hu?=
 =?utf-8?B?RE9BWjYvSmpFSTZNRyt4TUxHTUxJOFNkQlk5UkY4QTh1bjhNQU1ZenZMUmNN?=
 =?utf-8?B?bjFkclhYaDhOWjJ3a1FtU0tnU2RIb1V1VXY5WW56Vmloc2hVcW5IZVZJSjZZ?=
 =?utf-8?B?bnBWYzdhVHA1aVlpTExhUjg1c0JSN3VYc2lySUFFb2UyQXlXRE9xNVJTSkUz?=
 =?utf-8?B?V05DTkRZYWV4d0FoelR2ait2d25RazNqWU5FczZ2V1kzNkp3UERjVTF5WnQ0?=
 =?utf-8?B?VnV5aGl6dmtNaXFRUzJBUmZSaTlQSzk5b2Y5TUZwL3RydVp5VE82amFsKzVh?=
 =?utf-8?B?NGVxUGZ1TWtOekNpaGZkVThSb1Fmdm5majhBZlhmUnIzaVNKb0xMYWNlQ3V1?=
 =?utf-8?B?eFlzYzAyRzd6blBSRVg4WEJBejlGcXQ4R294MzFOVmVDYnVadEZNVWwvVFha?=
 =?utf-8?B?Rkt6VFBPS0ZxRGphT0phSWh5bmRoUmR5dWowdzdZczJtM2lldHRRdThVTTF3?=
 =?utf-8?B?RVZNM092TVZtd3c2S1ZKZXd5VDRGWVo2QmJRY3o3ejV3Y3pOWkxvWHZkNGlE?=
 =?utf-8?B?QzVIUFFCK1IyWjhkNXM3R1dqQVZPUnJqVStuOW1LeEhUd2JYcnhrRGdWeGhp?=
 =?utf-8?B?azVrWSs2Z2R2VzBPczdHVmN5NjliQytiVlp2cWlXS00xVlNsN0V2ZE5YUGpt?=
 =?utf-8?B?ZXo2L2VDTjJuWW41ekRMcXpSa1lMS0NJMWg4UWhIMXpFM2w0SDF4WU0yYkpS?=
 =?utf-8?B?QSsxUTJSUEcxclE1d3JQZ3lyVWhudVIzOHUwUisyWlNFTngyS2M3OFhvbzlp?=
 =?utf-8?B?VHFucFA4c0JNL29rYTNsRUtPdFVJdEVKdkVzMERqWFRMaXgzS1FLdFd2eUdO?=
 =?utf-8?Q?13H0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekZ0WEUvZHlucnp4QWQ5U0xpRjh5VmhXVS8xM1hWQUo1OWVrcHM4V2srWXRU?=
 =?utf-8?B?empNSkZONm9lejZmZzlkSm16empTcDRiNWliQWRzc2xvK012QkxKV1NKaVlK?=
 =?utf-8?B?L3cwcHlMM2k0WDVRc00vR1JNU0RjUnNwa0RlMUtvTGJuVUlZd1pFMFZsQU81?=
 =?utf-8?B?ZVg5Q3VCTEs1STNZVElGMjhJUGppYzMrRWh2a1BIYWRVd01kSC9LYTloTG9Z?=
 =?utf-8?B?NXlNUmM2Zm4wVmJOQ3U0OHFIVVUxQXZlSDN2UFVyRVlNWHhiLzRZWjdVcEhL?=
 =?utf-8?B?TXJraHpISnlSOUtHTDNMZWRJN2ZzM2hVVTFJZ3JIVnFuY3lYNTdoNWxVbzZE?=
 =?utf-8?B?SDJ4ZzJXbnBmYUM3OTdzdytYYnBjTmFqUjZEeWNrNzdneEFzOWxBSkZzVmx5?=
 =?utf-8?B?TWZrRCtTcGk3RnNRTjVrc0hPeG9nZFd1ZXp4WTRiSno0N21WMEEvTFNhbTI5?=
 =?utf-8?B?c2JzMHJmbGVkeDFCL0g4d2VJcXVZZ05NTGFQYk1vcWRrMjhnUG02L2Z2V3JT?=
 =?utf-8?B?K0k5OFZVZVg1cUh3em9WdVdKV1BkQlFtclh1MlR4UFl6MDdiTzZ6TG9vdzJI?=
 =?utf-8?B?SHBTcVlVMGk5UG96elQvdTA5U0lQdWZYcG02Z3puUEdoRnd0amZWam50eEJN?=
 =?utf-8?B?TGtNR3F3WGNDdmZrYVZ0cU5BMW9RQzNMSzZjd2JuaU9uZnRLZlJEL0JRbE5G?=
 =?utf-8?B?S25Jc1hKRTh4RFNpQ2QwZGJlK2ZONGV0Mnh0Nk5oZHQ3YjVEWWNWVXhzRkZY?=
 =?utf-8?B?a0h1UGdSeUxDVThMb1FMdTluamlkd2lrODdDRzkydlE3NlN2N0F0b3YrZy9G?=
 =?utf-8?B?MnVUSnliUnQ5c0RwQ3Zvbk5SZlA1YndxeVRCYjhBbWpFclpZbncyaERTSURH?=
 =?utf-8?B?V3JUWVRDMFRhYTIvMTlWckZuWjRsempHN09lQ0liYkI1YmF1UC9lQWJEWVIw?=
 =?utf-8?B?b3JLejlzVEZJSmtOdGNJdkJkalM1RndvTXlVQ3d4Mlc1L3ZNTGVBYlh1WlF3?=
 =?utf-8?B?Nm9ZckFIdmd1amF4T0RNM3d5N0NsOTY0cENyZDZaeXhiOUk1Uk5zRUtvU2Vl?=
 =?utf-8?B?UXo5Z1JxZCtnQVduZDZiSWFDRm11VzRPeVovR2E2Mks5ZTljc1hQWHBCWDFL?=
 =?utf-8?B?ZFdNQTVtTUdKS0VLTTJXVC81ZHZEOVRxQlN0b0FWN1k1Mzh3SlM2eWpDRE9v?=
 =?utf-8?B?elVOTzFpSVdXUEdPOXlIMVg1RGdqUDVBdWZpNFZ4TVViczdUK3Y5ekNTNzlw?=
 =?utf-8?B?N0UyVGpGd0NCdlFXc3QxMFQvN0pVQzZFNEVNS1dhN1dkQXZTazM1WnZ5NW56?=
 =?utf-8?B?NkRGQlQ5c0RvWHlRR0VGdVhIUkFFamo3M21McmM5bFViSGhHQll0TXZycDNs?=
 =?utf-8?B?WGl2c1UzUVdKMzdmbTBFaGszTTl0N2ljZEdIR0t6Lzl1TWZrUVlqeUtKMnJm?=
 =?utf-8?B?a0N6UWx5UDBMbVVIbW9oSUZpME4wOTVqSVNETFNXdDNRMUNtcVhWRERUMGkx?=
 =?utf-8?B?S2hKNlBaL0k3LzdUZ1NzQUVFK1JUMU9XMXM2alVoaDg3UXNvSGx5dUJBcWxu?=
 =?utf-8?B?dmtVMHR6UllqeUhQN2Zzb0FPQ3B4N3BGTEltck1LVDVJZkJCeVo3WTVGSmpF?=
 =?utf-8?B?WlpQeTNHeGZXSEVaT2IrVkphOGNGS3lVdXNRSFJYTGN4SEJJdjdjZXF5cTlL?=
 =?utf-8?B?Yk1UakZCaWh4T0M3aU05a2pjNWY0bk1naUpKak1zVHBBZXVoako1eUVwZzdj?=
 =?utf-8?B?WHJBempsdFE5ci96NGdhcmJMWkN0TVplOFJsVXdGcm1PS2hGeEFIY1hCdWVN?=
 =?utf-8?B?b0xBcGhiUmdneURmc3g5L1M3ME9oWk5kd25WU01OTkVZYU03ZC84ZzhpQ0hz?=
 =?utf-8?B?L0NFbmtPc0xDOWtyTTE4SFFKTWlyR2ZqazNFUGh2WUNZVEg5YS85bUpaYXRC?=
 =?utf-8?B?OVIvb1FsU2RyUVljUTZURGhRdDJha21zbStjRU5kT3g2Vms1eTUxdENkZG5r?=
 =?utf-8?B?WUZNZmRsb1RHb0JsREdzN2tkYUJHN2l3cFhJY1ZXMEd5QVpSdHFlZUltNmNZ?=
 =?utf-8?B?UFRZY0M3Q3I0OW5QdjRjbXR2eGxkT2R1Y3kzd0IycVlDOVRzZ2pHTVl2a1h5?=
 =?utf-8?B?ZWwwcjU1WkxvUklnNDU1eW82RG5GdnhSRFpMeEpvU2F6VlhHOVgvRTZMK3RQ?=
 =?utf-8?B?Y3UzQjlhN2FmOUMzWmIxSW1VN2UzVUdqVEF2aks5a2FFVTY4ZEkra2NmZnhT?=
 =?utf-8?B?bHVPcWcrUGxFUjFHMWFOeEkyMEFwLzI2VS9jOU5yTWJOWTJuUHAvUUtqaDdv?=
 =?utf-8?B?djZIMnhRbk96NUxoVEd5bFY1VFNlaG9ZMmpFSzNub0FmY1lhUzJ4QT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd63a25-2d59-4114-c275-08de73be86b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 16:05:27.3572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lxd9uAgYOpkFwxonq6uN0QIxkPL0Tg4nP4RHUKoK2AIiSI0olLkedWTu3ThMf2uRUHlXVkYLEsGyHUxl3o5FbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10951
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32138-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.909];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E57641898C2
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuYXVkIFBPVUxJUVVF
TiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgRmVicnVh
cnkgMjQsIDIwMjYgMjo0NyBBTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhw
LmNvbT47IExpbnVzIFdhbGxlaWoNCj4gPGxpbnVzd0BrZXJuZWwub3JnPg0KPiBDYzogQW5kcmV3
IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwu
b3JnPjsNCj4gSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5v
cmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBCam9ybg0KPiBBbmRlcnNz
b24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgTWF0aGlldSBQb2lyaWVyDQo+IDxtYXRoaWV1LnBv
aXJpZXJAbGluYXJvLm9yZz47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtZG9j
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gUGVuZ3V0
cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0N
Cj4gPGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsNCj4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbW90ZXByb2NAdmdlci5rZXJuZWwu
b3JnOw0KPiBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtDQo+IGlteEBueHAuY29tPjsgQmFydG9zeiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2
OCAzLzRdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZyBHUElPIGRyaXZlcg0KPiBIZWxs
byBTaGVud2VpDQo+DQo+IE9uIDIvMjMvMjYgMjE6MzMsIFNoZW53ZWkgV2FuZyB3cm90ZToNCj4g
Pg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEFybmF1
ZCBQT1VMSVFVRU4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+DQo+ID4+IFNlbnQ6IE1v
bmRheSwgRmVicnVhcnkgMjMsIDIwMjYgODoyNSBBTQ0KPiA+PiBUbzogTGludXMgV2FsbGVpaiA8
bGludXN3QGtlcm5lbC5vcmc+OyBTaGVud2VpIFdhbmcNCj4gPj4gPHNoZW53ZWkud2FuZ0BueHAu
Y29tPg0KPiA+PiBDYzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsgQmFydG9zeiBHb2xh
c3pld3NraQ0KPiA+PiA8YnJnbEBrZXJuZWwub3JnPjsgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRA
bHduLm5ldD47IFJvYiBIZXJyaW5nDQo+ID4+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vcg0KPiA+PiBEb29sZXkgPGNvbm9y
K2R0QGtlcm5lbC5vcmc+OyBCam9ybiBBbmRlcnNzb24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsN
Cj4gPj4gTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz47IEZyYW5r
IExpDQo+ID4+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPjsgU2h1YWggS2hhbg0KPiA+PiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz47
IGxpbnV4LSBncGlvQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gbGludXgtZG9jQHZnZXIua2VybmVs
Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGVuZ3V0cm9uaXgNCj4gPj4gS2Vy
bmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0NCj4gPj4gPGZl
c3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsNCj4gPj4gZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbW90ZXByb2NAdmdlci5rZXJuZWwub3Jn
Ow0KPiA+PiBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7DQo+ID4+IGRsLWxpbnV4LWlteCA8bGludXgtIGlteEBueHAuY29tPjsgQmFydG9z
eiBHb2xhc3pld3NraQ0KPiA+PiA8YnJnbEBiZ2Rldi5wbD4NCj4gPj4gU3ViamVjdDogW0VYVF0g
UmU6IFtQQVRDSCB2OCAzLzRdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZyBHUElPDQo+
ID4+IGRyaXZlciBIZWxsbyBMaW51cywNCj4gPj4NCj4gPj4gT24gMi8yMi8yNiAxNTo0OCwgTGlu
dXMgV2FsbGVpaiB3cm90ZToNCj4gPj4+IE9uIEZyaSwgRmViIDIwLCAyMDI2IGF0IDc6NTfigK9Q
TSBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiA+PiB3cm90ZToNCj4gPj4+
DQo+ID4+Pj4gR2l2ZW4gdGhhdCwgSeKAmWQgbGlrZSB0byBoZWFyIGZyb20gdGhlIEdQSU8gc3Vi
c3lzdGVtIG1haW50YWluZXJzIOKAlA0KPiA+Pj4+IEBMaW51cyBXYWxsZWlqIGFuZCBAQmFydG9z
eiBHb2xhc3pld3NraSDigJQgb24gd2hldGhlciBhIGRyaXZlciB0aGF0DQo+ID4+Pj4gd29ya3Mg
d2l0aCB0aGUgY3VycmVudCBoYXJkd2FyZS9maXJtd2FyZSBkZXNpZ24gY291bGQgc3RpbGwgYmUN
Cj4gPj4+PiBhY2NlcHRhYmxlIGZvciB1cHN0cmVhbSBpbmNsdXNpb24uIE15IHVuZGVyc3RhbmRp
bmcgaXMgdGhhdA0KPiA+Pj4+IHVwc3RyZWFtDQo+ID4+IGdlbmVyYWxseSBzdXBwb3J0cyBleGlz
dGluZywgcmVhbC13b3JsZCBoYXJkd2FyZSBhcyBsb25nIGFzIHRoZQ0KPiA+PiBkcml2ZXIgbWVl
dHMgc3Vic3lzdGVtIHN0YW5kYXJkcy4NCj4gPj4+DQo+ID4+PiBXaGF0IGEgc3dlbGwgcGFydHkg
dGhpcyBoYXMgYmVjb21lLg0KPiA+Pj4NCj4gPj4+IEluIHRoaXMga2luZCBvZiBzaXR1YXRpb25z
IEkgdXN1YWxseSByZWZlciB0bw0KPiA+Pj4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21hbmFnZW1l
bnQtc3R5bGUucnN0DQo+ID4+Pg0KPiA+Pg0KPiA+PiBUaGFuayB5b3UgZm9yIHBvaW50aW5nIG91
dCB0aGUgZG9jdW1lbnQsIEkgd2FzIG5vdCBhd2FyZSBvZiBpdHMNCj4gPj4gZXhpc3RlbmNlLiBW
ZXJ5IGluZm9ybWF0aXZlIQ0KPiA+PiBUaGF0IGhlbHAgbWUgdG8gdW5kZXJzdGFuZCB5b3UgcHJv
cG9zYWwgYmVsb3cuDQo+ID4+DQo+ID4+DQo+ID4+PiBXaGF0IGlzIHRoZSBtZXNzYWdlIEkgYXMg
YSBtYWludGFpbmVyIGlzIGdldHRpbmcgZnJvbSBOWFAgcmVnYXJkaW5nDQo+ID4+PiAiZ3Bpbzog
cnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyIj8NCj4gPj4+DQo+ID4+PiBBcm5h
dWQsIHdobyBpcyB0aGUgb25seSBwZXJzb24gaW4gdGhpcyBkaXNjdXNzaW9uIHdobyBhY3R1YWxs
eSB3cm90ZQ0KPiA+Pj4gYSBzdGFuZGFyZCBSUE1TRyBkcml2ZXIgKGRyaXZlcnMvdHR5L3JwbXNn
X3R0eS5jKSwgbXVzdCBBQ0sgdGhpcw0KPiA+Pj4gcGF0Y2ggaWYgaXQgd2FudHMgdG8gY2FsbCBp
dHNlbGYgYSAiZ2VuZXJpYyIgUlBNU0cgR1BJTyBkcml2ZXIsIGlmDQo+ID4+PiBoZSBkb2VzIG5v
dCwgdGhlbiBpdCBpc24ndC4NCj4gPj4NCj4gPj4gSW4gRmFjdCB0aGVyZSBhcmUgYWxyZWFkeSAy
ICJnZW5lcmljIiBkcml2ZXJzLCB0aGUgc2Vjb25kIG9uZSBpdCB0aGUNCj4gPj4gZHJpdmVycy9y
cG1zZy9ycG1zZ19jaGFyLmMsIGJvdGggYXJlIHVzZWQgb24gc2V2ZXJhbCBwbGF0Zm9ybXMuDQo+
ID4+DQo+ID4+IEl0IGlzIGluIG15IHBsYW4gdG8gdGVzdCB0aGUgcnBtc2ctZ3BpbyBvbiBTVCBw
bGF0Zm9ybSBpZiB3ZSBnbyB3aXRoDQo+ID4+IHRoZSBnZW5lcmljIGFwcHJvYWNoLg0KPiA+Pg0K
PiA+Pj4NCj4gPj4+IElzIGl0IGdlbmVyaWM/IElmIGl0IGlzIG5vdCwgbGV0J3MgY2FsbCBpdCAi
TlhQIHJwbXNnIEdQSU8gZHJpdmVyIg0KPiA+Pj4gYW5kIHJlbmFtZSBmaWxlcyBldGMgYWNjb3Jk
aW5nbHkuIE1heWJlIGl0IGNhbiBzaGFyZSBjb2RlIHdpdGggdGhlDQo+ID4+PiBhY3R1YWwgZ2Vu
ZXJpYyBSUE1TRyBkcml2ZXIgb25jZSB0aGF0IGFycml2ZXMsIHRoYXQgaXMgbW9yZSBvZiBhIGxp
YnJhcnkNCj4gcXVlc3Rpb24uDQo+ID4+DQo+ID4+IEkgd291bGQgbGlrZSB0byAocmUpZXhwcmVz
cyBteSBjb25jZXJucyByZWdhcmRpbmcgdGhlIGNyZWF0aW9uIG9mIGFuDQo+ID4+IE5YUC1zcGVj
aWZpYyBkcml2ZXIuIFRvIGNsYXJpZnkgbXkgY29uY2VybnMsIFNULCBsaWtlIHByb2JhYmx5IHNv
bWUNCj4gPj4gb3RoZXIgU29DIHZlbmRvcnMsIGhhcyBycG1zZy1ncGlvIGFuZCBycG1zZy1pMmMg
ZHJpdmVycyBpbiBkb3duc3RyZWFtIHdpdGgNCj4gcGxhbnMgdG8gdXBzdHJlYW0gdGhlbS4NCj4g
Pj4NCj4gPg0KPiA+IExpbnVzLCB0aGFuayB5b3UgZm9yIGp1bXBpbmcgaW4gYW5kIHByb3ZpZGlu
ZyB0aGUgZ3VpZGFuY2UuDQo+ID4NCj4gPiBJIHdvdWxkIGxpa2UgdG8gY2xhcmlmeSBvbmUgcG9p
bnQgaGVyZTogd2hhdCB3ZSBhcmUgZGlzY3Vzc2luZyBub3cgaXMNCj4gPiBub3Qgd2hldGhlciB0
aGUgZHJpdmVyIGl0c2VsZiBpcyBnZW5lcmljLCBidXQgcmF0aGVyIHRoYXQgdGhlIGN1cnJlbnQN
Cj4gPiBwcm90b2NvbCBpcyBub3QgYXMgcGVyZmVjdCBhcyBBcm5hdWQgd291bGQgZXhwZWN0LCBz
aW5jZSBpdCBjb250YWlucyBhIGZldyBmaWVsZHMNCj4gdGhhdCBtYXkgbm90IGJlIHJlcXVpcmVk
IG9uIHRoZWlyIHBsYXRmb3Jtcy4NCj4gPg0KPiA+IEFybmF1ZCwgaWYgeW91IGFncmVlIHdpdGgg
dGhlIHBvaW50cyBhYm92ZSwgbXkgcHJvcG9zYWwgaXMgdGhlIGZvbGxvd2luZzoNCj4gPiAgIC0g
UmVtb3ZlIHRoZSBmaWVsZHMgeW91IG1lbnRpb25lZCBpbiB0aGUgcHJvdG9jb2wgYW5kIHVwZGF0
ZSB0aGUNCj4gPiBkcml2ZXIgYWNjb3JkaW5nbHkgc28gdGhhdCB3ZSBjYW4gZXN0YWJsaXNoIGEg
dHJ1ZSBiYXNlbGluZSBmb3IgYSBnZW5lcmljDQo+IGltcGxlbWVudGF0aW9uIHdlIGFsbCBhZ3Jl
ZS4NCj4gPiAgIC0gVGhlbiBwcmVwYXJlIGEgc2VwYXJhdGUgcGF0Y2ggdG8gYWRkIHN1cHBvcnQg
Zm9yIGV4aXN0aW5nIE5YUA0KPiA+IHBsYXRmb3JtcyBieSBpbnRyb2R1Y2luZyB0aGUgbmVjZXNz
YXJ5IGZpeOKAkXVwIGZ1bmN0aW9ucy4NCj4gPg0KPiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB0
aGlzIGFwcHJvYWNoIHdvcmtzIGZvciB5b3UuIE15IGdvYWwgaXMgdG8gZmluZA0KPiA+IGEgc29s
dXRpb24gdGhhdCB3b3JrcyBmb3IgZXZlcnlvbmUg4oCUIGV2ZW4gdGhvdWdoIEkga25vdyB0aGF0
IHBsZWFzaW5nDQo+IGV2ZXJ5b25lIGlzIGFsbW9zdCBpbXBvc3NpYmxlLg0KPiBUaGlzIGxvb2tz
IHJlYXNvbmFibGUgdG8gbWUsIGJ1dCBJIGFtIG5vdCBhIG1haW50YWluZXIsIHNvIEkgd2lsbCBs
ZXQgbWFpbnRhaW5lcnMNCj4gc2hhcmUgdGhlaXIgb3BpbmlvbnMgb24geW91ciBwcm9wb3NpdGlv
bi4NCj4NCg0KSGkgQXJuYXVkLA0KR2xhZCB0byBoZWFyIHlvdSBmaW5kIHRoaXMgYXBwcm9hY2gg
cmVhc29uYWJsZS4NClRvIGJlIG1vcmUgc3BlY2lmaWMsIEnigJltIHByb3Bvc2luZyB0byBkbyB0
aGUgZm9sbG93aW5nIG1vZGlmaWNhdGlvbnMgZm9yIHRoZSBwcm90b2NvbDoNCg0KICAtIHJlbW92
ZSB0aGUg4oCcaWTigJ0gZmllbGQgKE1lc3NhZ2UgSUQgQ29kZSkNCiAgLSByZW1vdmUgdGhlIOKA
nHJlc2VydmVkWzVd4oCdIGZpZWxkDQogIC0gYW5kIGFsc28gcmVvcmRlciB0aGUgZmllbGRzIHNv
IHRoYXQgcG9ydF9pZHggYXBwZWFycyBiZWZvcmUgcGluX2lkeA0KDQpJZiB5b3UgdGhpbmsgYWRk
aXRpb25hbCBmaWVsZHMgc2hvdWxkIGJlIHJlbW92ZWQgb3IgYWRqdXN0ZWQsIHBsZWFzZSBsZXQg
bWUga25vdy4NCg0KVGhhbmtzLA0KU2hlbndlaQ0KDQo+IFBsZWFzZSBub3RlIHRoYXQgeW91IGhh
dmUgYWxzbyB0byBhbnN3ZXIgdG8gQmpvcm4gYW5kIE1hdGhpZXUgYWJvdXQgdGhlIHJhdGlvbmFs
DQo+IHRvIHVzZSBSUE1zZyBpbnN0ZWFkIG9mIHRoZSB2aXJ0aW8gcHJvdG9jb2wuDQo+DQo+IEZv
ciB0aGUgU1QgcGxhdGZvcm0sIHRoZSBtYWluIGFkdmFudGFnZSBvZiBSUE1zZyBpcyB0aGUgYWJp
bGl0eSB0byBtaXggYnVzZXMgb24NCj4gb25lIHZpcnRpbyBpbnRlcmZhY2UsIHdoZXJlYXMgVmly
dGlvIHJlcXVpcmVzIGFsbG9jYXRpbmcgdnJpbmdzIGFuZCBtYWlsYm94DQo+IGNoYW5uZWxzIHBl
ciBWaXJ0aW8gdHlwZS4gV2hlbiBkYXRhIHJhdGUgaXMgbm90IHRoZSBwcmlvcml0eSwgUlBNc2cg
bWF5IGJlDQo+IHByZWZlcmFibGUuDQo+DQo+IEFub3RoZXIgbGltaXRhdGlvbiBlIG9ic2VydmVk
LCB3aGVuIHByb3RvdHlwaW5nIGEgdmlydGlvLWkyYyBiZXR3ZWVuIExpbnV4IGFuZCBhDQo+IHJl
bW90ZSBwcm9jZXNzb3IgaXMgdGhlIGFsbG9jYXRpb24gb2Ygc3BlY2lmaWMgRE1BIG1lbW9yeSBy
ZWdpb24gc2hhcmVkDQo+IGJldHdlZW4gdGhlIHByb2Nlc3NvcnNbMV0uDQo+DQo+IFsxXQ0KPiBo
dHRwczovL2dpdGh1Yi5jby8NCj4gbSUyRmFybm9wbyUyRmxpbnV4JTJGY29tbWl0JTJGYWU0N2Ex
Y2JmOTUxMjVhYjEwOTUyMjgzNjIyNjUzZDYyNmUNCj4gNTZlNmEmZGF0YT0wNSU3QzAyJTdDc2hl
bndlaS53YW5nJTQwbnhwLmNvbSU3Q2RjZmY1MGQwZTY1NTQxMTY0ZA0KPiBiOTA4ZGU3MzgxNGI4
ZiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzkwDQo+IDc1
MTk2MzYwMTY4NTUyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5
ZFdVDQo+IHNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBi
Q0lzSWxkVUlqb3lmUSUzRCUzRCUNCj4gN0MwJTdDJTdDJTdDJnNkYXRhPUhjVHRQYmtYbSUyQlRE
d3JtZ3hXajV6d0JDR0U5SnAzZmo5QVdsQnJpdyUNCj4gMkJSWSUzRCZyZXNlcnZlZD0wDQo+DQo+
IFRoYW5rcyBhbmQgcmVnYXJkcywNCj4gQXJuYXVkDQo+DQo+ID4NCj4gPiBUaGFua3MsDQo+ID4g
U2hlbndlaQ0KPiA+DQo+ID4+IElmIHdlIHByb2NlZWQgaW4gdGhpcyBkaXJlY3Rpb246DQo+ID4+
DQo+ID4+IC1BbnkgdmVuZG9yIHdpc2hpbmcgdG8gdXBzdHJlYW0gYW4gcnBtc2ctZ3BpbyBkcml2
ZXIgbWlnaHQgc3VibWl0DQo+ID4+IHRoZWlyIG93biBwbGF0Zm9ybS1zcGVjaWZpYyB2ZXJzaW9u
Lg0KPiA+Pg0KPiA+PiAtIElmIE5YUCB1cHN0cmVhbXMgb3RoZXIgcnBtc2cgZHJpdmVycywgdGhl
c2Ugd2lsbCBsaWtlbHkgcmVtYWluDQo+ID4+IE5YUC1jZW50cmljIHRvIG1haW50YWluIGNvbXBh
dGliaWxpdHkgd2l0aCB0aGVpciBsZWdhY3kgZmlybXdhcmUgYW5kDQo+ID4+IHRoZSBueHAtcnBt
c2ctZ3BpbyBkcml2ZXIsIGxlYWRpbmcgdG8gcGxhdGZvcm0tc3BlY2lmaWMgdmVyc2lvbnMgaW4g
c2V2ZXJhbA0KPiBmcmFtZXdvcmtzLg0KPiA+Pg0KPiA+PiAtIFRoZSBpbXBsZW1lbnRhdGlvbiB3
aWxsIGltcGFjdCBub3Qgb25seSB0aGUgTGludXggc2lkZSBidXQgYWxzbyB0aGUgcmVtb3RlDQo+
IHNpZGUuDQo+ID4+IEluZGVlZCwgc29tZSBvcGVyYXRpbmcgc3lzdGVtcyBsaWtlIFplcGh5ciBv
ciBOdXR0WCBpbXBsZW1lbnQgdGhlDQo+ID4+IHJwbXNnIGRldmljZSBzaWRlIChaZXBoeXIgYWxy
ZWFkeSBpbXBsZW1lbnRzIHRoZSBycG1zZy10dHkpDQo+ID4+DQo+ID4+IE1haW50YWluaW5nIGEg
Z2VuZXJpYyBhcHByb2FjaCBmb3IgUlBNc2csIHNpbWlsYXIgdG8gd2hhdCBpcyBkb25lIGZvcg0K
PiA+PiBWaXJ0aW8sIHNlZW1zIHRvIG1lIGEgbW9yZSByZWxpYWJsZSBzb2x1dGlvbiwgZXZlbiB0
aG91Z2ggaXQgbWF5DQo+ID4+IGluZHVjZSBzb21lIGRvd25zdHJlYW0gY29zdHMgKFNUIHdvdWxk
IGFsc28gbmVlZCB0byBicmVhaw0KPiA+PiBjb21wYXRpYmlsaXR5IHdpdGggbGVnYWN5IFNUIHJl
bW90ZSBwcm9jIGZpcm13YXJlKS4NCj4gPj4NCj4gPj4NCj4gPj4gSW4gdGhlIGVuZCwgSSBhbSBq
dXN0IHRyeWluZyB0byBpbmZsdWVuY2UgdGhlIGRpcmVjdGlvbiBmb3IgUlBNc2csDQo+ID4+IGJ1
dCBiYXNlZCBvbiB0aGUgZGlzY3Vzc2lvbnMgaW4gdGhpcyB0aHJlYWQsIGl0IHNlZW1zIG90aGVy
cyBzaGFyZQ0KPiA+PiBzaW1pbGFyIGV4cGVjdGF0aW9ucywgd2hpY2ggc2hvdWxkIHByb2JhYmx5
IGJlIHRha2VuIGludG8gYWNjb3VudCBhcyB3ZWxsLg0KPiA+Pg0KPiA+PiBUaGFua3MgYW5kIFJl
Z2FyZHMsDQo+ID4+IEFybmF1ZA0KPiA+Pg0KPiA+Pg0KPiA+PiBJIGp1c3Qgd2FudCB0bw0KPiA+
Pg0KPiA+Pj4NCj4gPj4+IFlvdXJzLA0KPiA+Pj4gTGludXMgV2FsbGVpag0KPiA+DQoNCg==


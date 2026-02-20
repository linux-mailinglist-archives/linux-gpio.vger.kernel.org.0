Return-Path: <linux-gpio+bounces-31974-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDgiIquNmGnOJgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31974-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 17:36:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 466311695A3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 17:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5860B3014C52
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 16:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3877734EEF9;
	Fri, 20 Feb 2026 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kgXtef/c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B47C2DB788;
	Fri, 20 Feb 2026 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771605411; cv=fail; b=KNGbw6RuVR0ynpdQddJLzgj8a2avKGmfrqWEMKegWT2I2hBZLpBBWsBnJjr7nMsVwad0PbA00kiRtcD3lr8QFErhhV+SPCJxKv6DfekHFFc/PG+RwSDF5wXui/9XizkIVWVlIwQURVFFDGO3VVw/PZaMzNC1DaeRrVc1QHJ29QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771605411; c=relaxed/simple;
	bh=MCmm5bEoTRRmetm8zLJeGkXcQF0lZycW2CkvcZ/D084=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pguwWzjy37TBctclOwtHzGsBZiUzLe/Qn7FJcJRWNv8B6Ulx8AQnD2uVMDbJKFOvj87gmFUA8UiyKC5156kIBS2oQ1dpwm6cHfL6pv70S5nq66neB27fz/VXwAqoQZtQqTdiXDXp3cvwvItChN1BOq9MO4X8hqiqkY4Tn29+x8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kgXtef/c; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilhHNz8G/FrDN1EWcyKDjXbYJpRPN2ThujmtmzbgswWbuFw43WEtrK3xWcPcvki1/TNp8cZUbvn8lzR7NUjUst23HdN0GEnoRelso7J3owk4y4d+nUrFQZQ8AxhAAz1fhL1jtKFi5VYpFGDb1ZqlHrD6R3/osKW80bgVAkQbW1q9xfdPdF2dbHBLVuX/z9jbkOUsgvuSjV543N5SnAjaQJYVgF3tqyBTg5DN8tvupAxUJHxf9dRQ7a70+SKXmIJz7sT6PIMvg4/zZFEDSl1I1YgJ8FiFHtiWtAy3CUYXaenUuQ6V2rCOlkOpqs0rFphv+JAiCrPnTNf3jmLzKvBlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCmm5bEoTRRmetm8zLJeGkXcQF0lZycW2CkvcZ/D084=;
 b=ZCNLjK5kMYhXdjdpiFHFVGd8q6Znj3I6CmPLFocoZ8eqmls4hsKoew3ESNAGU/kTG4UkbslKXPEwgCm5SIZIzn3XSTpiZkixeCHBMKlEmVHY8fWeMNIN4riolmCAsGusHxuMO9PrDvp7VYVLZHIeNlVRXhu0LHfT/Om6tVy2+wlJJDWCiVbyPAHyItD2o5JqmiC/H03NvoMYJiNqOBI74d64oFBrzr2T7w6nvdEjDVMx8VJW7DMjwM7gFY4THD1+PFMe5tUkhPQ+nPQQeHjReqoS2P3/TDvyPjqSnrA03uuHiClFv5riT1/8DwxoR/nAORMwPX6ycNXqFY8oMeq4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCmm5bEoTRRmetm8zLJeGkXcQF0lZycW2CkvcZ/D084=;
 b=kgXtef/cilLgJmF5WTNH6Qm2s8lz9MEL6Q2KCGNaVWJSllyMgULpe5PtbeY47oLDt2n1LjG0y1Mij7AqQEiwnt9UL7w4+wrAsZ/lZCuMDTryO98NFNK1NgUAFX50tumYOn5M9kixwEWdhr/pJ9I14+wR4Tfh5tyd+9sbXGSxScfzxI+Wl382fhEuBaYdTSmq9dWLmkHLnqFhItPCXXmOVOJHLXK1J69upLqPWRG3vVTz3UWDMmk6NQdk+N49O2ihPJiH5ZisHMFj33TgbNDO/LqbvEe7N81ykOKtAfVT4j2rQgR4TDwfHCYZj4CNzufaEkcvAN/xOQPSB+xgVy3ZMw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV2PR04MB12213.eurprd04.prod.outlook.com (2603:10a6:150:336::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 16:36:43 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:36:43 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
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
Thread-Index: AQHcoocYg5eTmA3xoUOLROfmz7BH9g==
Date: Fri, 20 Feb 2026 16:36:43 +0000
Message-ID:
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
In-Reply-To: <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GV2PR04MB12213:EE_
x-ms-office365-filtering-correlation-id: 56fa546b-3b37-4572-0ba9-08de709e3b63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UUJnaXJ2Y3RHazBmeEx5Y3d3Vzd1RHZiUmJ4UUlxWTFweUFicjRYOElvczNt?=
 =?utf-8?B?WnFTUFVab2Rrd1dKblpvWkQyNFMxR1hWWURTTGlQZVUwZENoNW9LVCtDU0Ux?=
 =?utf-8?B?SFg1OXFQTnh4UGplQlFibE5oOWg2VGhoZVRHQlpCdzJsaU5xWHB5cnMwM05O?=
 =?utf-8?B?Y3Z5MHZQVlhFNUE4YU9MRWozTFRMWWpadEw1c3JkOUtZVFJwcytUZlZQSlBH?=
 =?utf-8?B?NlV4MlNuWGt2eHpsd0lNbzdqTlN5UUEzaFkzNlNTbG1ibkM3dnJtMlBGcnc4?=
 =?utf-8?B?S3M1TGlTbzJUa2pqTkl5SXlaeVAvVzZrU2hzeFdmRUl5Rlg5V3o1WnY1WFFl?=
 =?utf-8?B?UXhYcDRCM0xLRjJRMENtR2dONFpodWNXUTA0RmVDdWVSZUZ2K2VqOVIxR1Z5?=
 =?utf-8?B?SXZRZkk1emR3TnpWN0lZUGtrRHR5TDNBK1Z1dkU4VmNTVXdwcXZsU05KWHVZ?=
 =?utf-8?B?dEo1d0xvNzhNSW5tbmpTT0JzaGhFVUpDK1crcWlmREdrVGtVS2JRK3NTZlBN?=
 =?utf-8?B?bTNRZHJyOU1BTjBqanJlWGJsVURhUUcwWTFXOU01cmJnZXFhMlBRZnNLZHgr?=
 =?utf-8?B?MGF3SStoSTZzUFdwWU5yeFdyZWRLWmhMYkdZOTJGK1JFM2pLanIvU2xHZlBZ?=
 =?utf-8?B?SHNiS1c5ODhGeERYRlM3ZWlub1NXcGFXbE5TeHFtVmJBRllFaWNwSU1wVzRv?=
 =?utf-8?B?MG5CRC9UQXg5RCs3SDErUTVuVTJLYzVrQ3VaZlRHWW9od0FHOXZkdjEwd2lo?=
 =?utf-8?B?MnFpUEp6MzlUUGpIaEFGUHBhdkwxbVlMcHN3QzZXNk1ReWJqRnhHRjRRb245?=
 =?utf-8?B?eDBncnhYMnQwZEEvR2RNWnZ6UTlaSW1Qb05URTlTTG9sb3ZhVklqL2k0QXc5?=
 =?utf-8?B?eWZvV3d3NnNjNFV5NlIvNzJIMXJnRDhsd1hTRmFtdzBndWp6TFBsTzIzT3hX?=
 =?utf-8?B?dlFhazQ1SC9namZCYUhOMFdCMUZQWFRZWE5QOFBKUkNsRDJ4NU1OaWxTNWU4?=
 =?utf-8?B?bmwwTFFEYVpFczlVYzJrNlVaN2ZaSlViOWliRmFZSUhGT0hLNjNzd3JSTlkz?=
 =?utf-8?B?Q3ZLTGJqRWk2OE1TODNJaGhLRC9oeDlDVndhY3g0Zmltd2xiemhDaTIyZ0xT?=
 =?utf-8?B?WFhvVUJNc0REL3V0Vk9PWm01OFFtN0tmOUFuSXY5YWhndWxkMEgzVUMwajRP?=
 =?utf-8?B?dEd5aElCNW1SLzZBVjZSUXdHK1RmOHdLOGFmSGNvdHIwdkl6ZFRZN280RDRL?=
 =?utf-8?B?SGs1SURwWmk1ckxSdG9OUVN3bVdFd1B0RUYrMi92UjErd3ZuWmZTM1Y0L3V4?=
 =?utf-8?B?a2llM0dKbnpxcVVtSjFzeGpoTGNBREh5enZDZGh2NjF2NE1hQys1NllTbHFK?=
 =?utf-8?B?cmVEY0ZlRlpKTXFNeERGWG1uZG1CZ0JQV2pITkRna09yL2RsZ3ErUk4rQ2tx?=
 =?utf-8?B?dmh6bktCR2FtNkxwWnVTMEJnQjA2ZDV5UlhwblRSdUJqVkw1S1pOQlZSMmhw?=
 =?utf-8?B?T29sNTZZeWo1SkpFTEJmMGtYVFhUU05nb2xqUTc5cVcvU2U0TUd6NE5zamIz?=
 =?utf-8?B?dnI5ZEwyMFgwNVBmb3JING43T1JTczVFanovd2NrU1lHZldJNmpjR1Bmam1S?=
 =?utf-8?B?VWNSNnBqR0szcFhjblYvN2xLNm5TRmdGaGhMWjdnYjRZanY0bFMzdUZCUTZ5?=
 =?utf-8?B?S1U5dTBqTDRnNzRjaVRkQTBaU2RQTFlpY2x0dS9rdlFieHZJTUNVSlppNldy?=
 =?utf-8?B?bHhyRHFHUktQUk9ZSFhOOHRrVXFTWlpKUkRxcEF5WWFmWk9jWktqK0lsZXVC?=
 =?utf-8?B?V2pyZ2ZWc0NRd3U4ZHk1Ny92bjBXRlo4RVVuWDFaTlhpTGZFbDM0ankwNFRI?=
 =?utf-8?B?bzFTMzFJdU1lcG16WmJIOXBGUHFjRWVmUFo0SUdnS2xvVXRUbkRjT1ZncU4y?=
 =?utf-8?B?bW5ua0JkQjJQNmlrSzdPTWpJM1hUUHlidUQ1OG0wcnJUeTNVRGcySXBBa244?=
 =?utf-8?B?OTNQMjUrZWNMUXp1SWdOYTloZ2R0V3dHbldVeiszNTc1b1RrTUdhbzdOSnJB?=
 =?utf-8?B?YStyVFYyMkNRSnFxUDVoUEp5M0ZHWjFVNGRXMzBURVlXNG9LcW1RaGdZL1dS?=
 =?utf-8?B?OWtRTisySm55aGhQQUFaSzl2bm1WUUQyY3VLYlNJUDMvZmR1dTVZcmlxZWlH?=
 =?utf-8?Q?Qg2HCNvWVJOfaaVfkUk2MpA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?by9DNGpYTWlHYzNGRkMwMmdwa2pLa0s2SUFOem9mdjZLc2N2cGdXNVFaV0tQ?=
 =?utf-8?B?TW1aMHBMa01xSUs5QlRPbjdoU1dWSnFjMTlxMHJXNGZQdVpPbmhaQVVTOWJH?=
 =?utf-8?B?NmlhWEdRQkJFb3NhVCtpaFNrL3RIMTd1b2xmRXh6UnRJWG1oQ2JWRDlNVjEr?=
 =?utf-8?B?eERkcS81VzU5emdTQ0h1aWtIb3FPTnN4OGo5ZWY5Z2NtYmpjWjJ1T21YUDFa?=
 =?utf-8?B?cUp2YllRLzJBZmZEZXRpN1hoZmI2bzZKZmwzamVtcjMwcEFrdkdxNHFSaW9i?=
 =?utf-8?B?UnlpRlUydVFLY0s2K25yZDFPbytSWVJ6NnppbG9ZVUlHLzh1S0Z1MVM4RWtJ?=
 =?utf-8?B?YVBpV204Nkp3cXJ1TnJGTGtScGxPZzJYWU56SXpYN2NQMGJ1aGpzSndLbDhK?=
 =?utf-8?B?V0oyZ0Q1NStTV2FvNjdvZEcvT3dxd0ErMFhGdVU0c1lueTNNUnFtTkFRVjhQ?=
 =?utf-8?B?L1A5N3FGdkl1Y29Bcm81NVh1UWNROTJWOXVOZjJpQy84WVl4TFJtWU83RVZF?=
 =?utf-8?B?M1UwN29PbGtyT1JXQ2puUWozTW9VeFFTY1FPWWl0cW9makt2allzMmZnQ3VF?=
 =?utf-8?B?TCtmbEFPMytkSXB2VHFoenZsaXN2RCtNU1dncWhmb3VDdytnTHlYL2Q4NlVM?=
 =?utf-8?B?ZW9ROFlYNEI2YWJGUzBZUzdEeXZPSzBkUzQ2a3gwUDZOK2FmakhMY3piaEFD?=
 =?utf-8?B?ZGtxRU15VmlUaWFxbkdLV0dsektNSlVBRzdjNHhRaUl0Z29vTVIza2NrblVC?=
 =?utf-8?B?UCtud1lRZy9PRUhQcklQRGMrc2o4bkxkZC84dEJ1RlV1WDBKa3Vwam5KVUxr?=
 =?utf-8?B?KytwWUNMMEY0WmtmK2RNY2FRYkFZZTlUMXc2M2dBRXlpSXVvaHJYY0J5MkFl?=
 =?utf-8?B?aDg1anBqeHNKYUlGbEFNY3NvTGRZNnJHbTdtMEQxMk9qUzFzaFhqcWdjd3Zv?=
 =?utf-8?B?QjFLTDJTK3R6U0grZ0pLSTlLVG5hRTlKNUVJaWxnT2hoVDVPYjd6SVludzM5?=
 =?utf-8?B?UmtVNG1OQ2VzSlBZK09TMW1xeW9ZbVpFNWJoWFNld1ljOE5JMUFFRCtvL2o5?=
 =?utf-8?B?WGREWWRvci9KN1NXbWs0VXlObnNnc2hidUh0TGlUekRGSXZtWlkwa29kWStK?=
 =?utf-8?B?WDlKeVBMNVVndUhTY2JIaS8wU2d2dWNrblVVSGdUUUxzTWxPT0pjTG5UK2Jj?=
 =?utf-8?B?bzkzZWdjSVhWajF6VWNoN3BWbE5hTnBrNDlFdTZEdlRqRFhHVUNET2RFMnBH?=
 =?utf-8?B?Z1ZMeDJvQjF1clpobExJMDR4eVc0LzhDbm9MSGNFWCsrWEdVUXNCaDRJQnNR?=
 =?utf-8?B?SkdvQ1ZKOWdOVVpuQWRSYlhEMkRtTkZvNUp4QlJXQ1VJeXJhaWkwblQ5QXZO?=
 =?utf-8?B?cGJ2S2NaWkEvRkhkVllicTVxOFVnOHY5cjAwQlBta0o3aU5uU0ZlU2lnNHBx?=
 =?utf-8?B?OFBCYzNQODhaQ2lnaWpqeEt0bEgvS2FYbG9yc0ZwazVtdVhxNDBhakdGck9w?=
 =?utf-8?B?MFRmS2lubnB0QXd5TnVRekI1QWdKVGRpTDJrd3I5TWoyaEVVYjA0UmRyQ3Er?=
 =?utf-8?B?V3c2V3F2cm53MWNydDc4dGhyQVpHY0txRFZnWTcxdWRVajlQZmk4Sk9pWVcv?=
 =?utf-8?B?YndOY2tjc3JXdWY0T2Zwb2dkcXlod2V0RXdsbFN1ZFlNbnFCSk1KMmtOM1lE?=
 =?utf-8?B?cXdJUzI0S2t3Y3E2dUxtd094a2ZHQ004WU9pclR3RWFTQ3lYWTJJb1Mva1Nw?=
 =?utf-8?B?cHNFdUwxZkMwQnRVcitqQW42UWx4aU9kNklTTXNyVnh0RE9mcE5wWW1wdlly?=
 =?utf-8?B?ZjJvRjQvVkxXaDJiMkVKU2docFpiYU9XUWxIR1U0TGYvVWNmczBiZkFOZGVR?=
 =?utf-8?B?clFjNW1lbnNXc3l4cWlCVnlRY2drYkJWbFZzRkd5NFA2Sm1Hc0ZqR2Z6RUZQ?=
 =?utf-8?B?eVNOM0lkejFVc2RiQUFjS0hCRFBVV0YxZTVxQ1MweTVxNDkrdFpidFBiMHZa?=
 =?utf-8?B?R3hxYUF2NTl0T2lobXJoZFFRa2hWb1FQbUFJYXZnWmdFVjlXK3BkR0VuaGZN?=
 =?utf-8?B?TXdvMlpUWkM4dnptN0VjZTBuMUxyL1lSQmZIVFRwSG8vZS9taXphTEhvTVJk?=
 =?utf-8?B?S1RZbG4rQ3VKY1g2Yk96dldIZENFVmF6WUxzYUtqVWR2ekhCQ1Y1WFdEeEl3?=
 =?utf-8?B?WEFuKzdFaWgvcDU0WitZcmI3aFRlOERQN2NnZ28zOUxjbHVVSFFHYVBRZmlz?=
 =?utf-8?B?eXBlK0IrTDZ5SHVJYytVSVRoWFh5NWo4NG1BSVJCWEhTdUFiaDJ5L3lGVXZ4?=
 =?utf-8?Q?7VucvxWgMFn8aJ+taU?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fa546b-3b37-4572-0ba9-08de709e3b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 16:36:43.6151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oxz0GIc0FMIJlRRYueYjO4+sFBbtOwB84oK5yn5x9RfqT72qIP31je/sKd1g0lQDWtYdf3lAFQDgpV79hxnw6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12213
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31974-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.997];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 466311695A3
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIwLCAyMDI2IDc6NDkgQU0N
Cj4gVG86IEFybmF1ZCBQT1VMSVFVRU4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+DQo+
IENjOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPjsgTGludXMgV2FsbGVpag0K
PiA8bGludXN3QGtlcm5lbC5vcmc+OyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5v
cmc+OyBKb25hdGhhbiBDb3JiZXQNCj4gPGNvcmJldEBsd24ubmV0PjsgUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2VybmVsLm9y
Zz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEJqb3JuIEFuZGVyc3Nvbg0K
PiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmll
ckBsaW5hcm8ub3JnPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1
ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBTaHVhaCBLaGFuDQo+IDxza2hhbkBsaW51eGZv
dW5kYXRpb24ub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQZW5ndXRyb25p
eCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4NCj4gPHBlbmcuZmFuQG54cC5jb20+OyBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IHJlbW90ZXByb2NAdmdlci5rZXJuZWwu
b3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgQmFydG9zeg0KPiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2
OCAzLzRdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZyBHUElPIGRyaXZlcg0KPiA+DQo+
ID4gT24gMi8xOS8yNiAxNDo0MiwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+ID4gPiA+ID4gKyAgICAg
ICB1OCBpZDsgICAgICAgICAgLyogTWVzc2FnZSBJRCBDb2RlICovDQo+ID4gPiA+ID4gKyAgICAg
ICB1OCB2ZW5kb3I7ICAgICAgLyogVmVuZG9yIElEIG51bWJlciAqLw0KPiA+ID4gPg0KPiA+ID4g
PiBEb2VzIHRoaXMgZmllbGRzIGFib3ZlIGFyZSBtYW5kYXRvcnksIHNlZW1zIHRoYXQgaXQgaXMg
anVzdCBzb21lDQo+ID4gPiA+IGNvbnN0YW50IHZhbHVlcyB0aGF0IGFyZSB1c2VsZXNzLg0KPiA+
ID4gPg0KPiA+ID4gPiA+ICsgICAgICAgdTggdmVyc2lvbjsgICAgIC8qIFZlbmRvci1zcGVjaWZp
YyB2ZXJzaW9uIG51bWJlciAqLw0KPiA+ID4gPg0KPiA+ID4gPiBXaHkgaXQgaXMgdmVuZG9yIHNw
ZWNpZmljPyB0aGUgdmVyc2lvbiBzaG91bGQgcmVwcmVzZW50IHRoZQ0KPiA+ID4gPiBycG1zZy10
dHkgcHJvdG9jb2wgdmVyc2lvbi4NCj4gPiA+ID4NCj4gPiA+ID4gPiArICAgICAgIHU4IHR5cGU7
ICAgICAgICAvKiBNZXNzYWdlIHR5cGUgKi8NCj4gPiA+ID4gPiArICAgICAgIHU4IGNtZDsgICAg
ICAgICAvKiBDb21tYW5kIGNvZGUgKi8NCj4gPiA+ID4gPiArICAgICAgIHU4IHJlc2VydmVkWzVd
Ow0KPiA+ID4gPg0KPiA+ID4gPiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoaXMgcmVzZXJ2ZWQg
ZmllbGQ/DQo+ID4gPg0KPiA+ID4gVGhleSBoYXZlIGFuIGltcGxlbWVudGF0aW9uIG9mIHRoZSBv
dGhlciBlbmQgcnVubmluZyBvbiB0aGVyZQ0KPiA+ID4gc3lzdGVtcywgYW5kIGl0IHNvdW5kcyBs
aWtlIGl0IGlzIHdpZGVseSBkZXBsb3llZCwgYW5kIHRoZXkgYXJlDQo+ID4gPiB0cnlpbmcgdG8g
a2VlcCBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4gVGhlIHByb3RvY29sIGFsc28gaW1wbGVtZW50
cw0KPiA+ID4gbW9yZSB0aGFuIEdQSU8uIFRoZXJlIGlzIGFsc28gSTJDLCBtYXliZSB3YXRjaGRv
ZywgaSBkb24ndCByZW1lbWJlciwNCj4gPiA+IGJ1dCBlYXJseSB2ZXJzaW9ucyBvZiB0aGlzIHBh
dGNoc2V0IGhhZCBhIGxpc3QuIFNvbWUgb2YgdGhlc2UgZmllbGRzDQo+ID4gPiBhcmUgdXNlZCBm
b3Igc29tZSBvZiB0aGVzZSBvdGhlciBkZXZpY2VzLg0KPiA+ID4NCj4gPiA+IEkndmUgYmVlbiBh
cmd1aW5nIGl0IHNob3VsZCBiZSBhIGNsZWFuIGRlc2lnbiwgd2l0aCB0aGUgcHJvdG9jb2wNCj4g
PiA+IGZvY3VzaW5nIG9uIEdQSU8uIEFuZCB0aGF0IHRoZSBycG1zZyBjaGFubmVsIG1ha2VzIGl0
IGNsZWFyIHRoaXMgaXMNCj4gPiA+IGEgR1BJTyBkZXZpY2UsIHRoZSBwcm90b2NvbCBpdHNlbGYg
ZG9lcyBub3QgbmVlZCB0byBpbmNsdWRlIGZpZWxkcw0KPiA+ID4gdG8gZGlmZmVyZW50aWF0ZSBi
ZXR3ZWVuIEdQSU8sIEkyQyBldGMuDQo+ID4gPg0KPiA+ID4gV2hlbiB0aGV5IHN0YXJ0IHN1Ym1p
dHRpbmcgSTJDIG92ZXIgcnBtc2csIGkgZXhwZWN0IHRoZSBzYW1lIHNvcnQgb2YNCj4gPiA+IGRp
c2N1c3Npb24gd2lsbCBzdGFydCBhZ2Fpbiwgc28gdGhlIGxpa2VsaWhvb2Qgb2Yga2VlcGluZyBi
YWNrd2FyZHMNCj4gPiA+IGNvbXBhdGlibGUgd2l0aCB0aGVyZSBmaXJtd2FyZSBzZWVtcyBsb3cg
dG8gbWUuDQo+ID4NCj4gPiBBZ3JlZSB3aXRoIHlvdS4NCj4gDQo+IEhpIFNoZW53ZWkNCj4gDQo+
IFdlIG5vdyBoYXZlIHR3byBNYWludGFpbmVycyB3aG8gdGhpbmsgeW91IHNob3VsZCBtYWtlIGEg
Y2xlYW4gZGVzaWduLi4uDQo+IA0KPiBZb3Ugc2hvdWxkIGdvIHRhbGsgd2l0aCB5b3VyIE1hbmFn
ZW1lbnQgYW5kIGRlY2lkZSB3aGF0IHRoZXkgd2FudCB0byBkby4NCj4gRHJvcCB0aGlzIHBhdGNo
IHNlcmllcyBhbmQgb25seSBzdXBwb3J0IHRoZSBvdXQgb2YgdHJlZSBkcml2ZXI/IE9yIHJld29y
ayB0aGlzDQo+IGRyaXZlciBhbmQgdGhlIGZpcm13YXJlIHRvIHRoZSBsaWtpbmcgb2YgdGhlIG1h
aW5saW5lIE1haW50YWluZXJzLg0KPiANCg0KVGhlIGRyaXZlciBpcyBtZWFudCB0byBzdXBwb3J0
IGEgc3BlY2lmaWMgcGllY2Ugb2YgaGFyZHdhcmUsIGFuZCBpdHMgZGVzaWduIGZvbGxvd3MgdGhl
IA0KY29tcGFueeKAmXMgZXhpc3RpbmcgSVAsIHdoaWNoIGlzIGFscmVhZHkgd2lkZWx5IGRlcGxv
eWVkLiBXaGlsZSB3ZSdyZSBvcGVuIHRvIHNoYXJpbmcgDQp0aGUgSVAgZGV0YWlscyB3aXRoIGFu
eW9uZSB3aG8gd2FudHMgdG8gYWRvcHQgdGhlIHRlY2hub2xvZ3ksIGNoYW5naW5nIHRoZSBJUCBp
dHNlbGYgDQppc27igJl0IHRoZSBnb2FsIG9mIHRoaXMgcGF0Y2ggc2VyaWVzLg0KDQpGcm9tIHRo
ZSBkcml2ZXIgcGVyc3BlY3RpdmUsIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBjbGVhbiBhbmQgZ2Vu
ZXJpYywgYW5kIGl0IGNhbiBzdXBwb3J0IA0KbXVsdGlwbGUgaGFyZHdhcmUgdmFyaWFudHPigJRl
dmVuIHRob3NlIGJhc2VkIG9uIG90aGVyIHZlbmRvcnPigJkgSVDigJR3aXRob3V0IHJlcXVpcmlu
ZyANCmFyY2hpdGVjdHVyYWwgY2hhbmdlcy4gSSB0aGluayBpdCB3b3VsZCBiZSBtb3JlIHByb2R1
Y3RpdmUgaWYgdGhlIHJldmlldyBmb2N1c2VkIG9uIHRoZSANCmRyaXZlcuKAmXMgaW1wbGVtZW50
YXRpb24gYW5kIGludGVncmF0aW9uIGludG8gdGhlIHN1YnN5c3RlbSwgcmF0aGVyIHRoYW4gYXNr
aW5nIHRvIHJlZGVzaWduIA0Kb3IgcmVwbGFjZSBhbiBleGlzdGluZywgd2lkZWx54oCRcmVsZWFz
ZWQgSVAgYmxvY2suIFRoZSBpbnRlbnRpb24gaGVyZSBpcyB0byB1cHN0cmVhbSBzdXBwb3J0IA0K
Zm9yIGhhcmR3YXJlL2Zpcm13YXJlIHRoYXQgYWxyZWFkeSBleGlzdHMsIG5vdCB0byByZWRlZmlu
ZSBpdC4NCg0KSWYgdGhlcmUgYXJlIGNvbmNlcm5zIGFib3V0IHNwZWNpZmljIGRlc2lnbiBlbGVt
ZW50cyB3aXRoaW4gdGhlIGRyaXZlciwgSeKAmW0gaGFwcHkgdG8gYWRkcmVzcyANCnRob3NlLCBi
dXQgcmVkZXNpZ25pbmcgdGhlIGhhcmR3YXJlL2Zpcm13YXJlIGludGVyZmFjZSBpcyBub3Qgc29t
ZXRoaW5nIHRoaXMgc2VyaWVzIGNhbiBzb2x2ZS4NCg0KVGhhbmtzLA0KU2hlbndlaQ0KDQoNCj4g
ICAgICAgICBBbmRyZXcNCg==


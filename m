Return-Path: <linux-gpio+bounces-32150-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HFyFksHnmnUTAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32150-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:17:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045118C54B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB7DB303E31D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 20:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4664F338F56;
	Tue, 24 Feb 2026 20:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WXl1vXck"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3A26AC3;
	Tue, 24 Feb 2026 20:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771964225; cv=fail; b=iecWJrGcNAPxprxutMcUXvs1mlZDVpMq6L/WrC5v4egwDswjIrfD1FUoj25JS+Qss4cVhz+pCm3glk+HMrZ5Pb4dKVSChEgi1CauYAjgcM2JvupWqGag76LfSpFI2qdtjbH6fhpCHcfQPCxohzOtwFQrJPY+yKICk8EyECB5bbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771964225; c=relaxed/simple;
	bh=5xG7zFZYzoM++g0tER+Ow4Q88MK7IzJCmICntSb1hnc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W4qcMvcX/kKiLS6A3xtn95TpaS+JfKfpQXOycdDkDAcNmCMkhXk1rxi+ihJsY2msN0JuOexa6Hm2p3CyHyUkv1amCgPU7M9dpwntgPfKDx5VHQXWwNX98G075MWEtq4JuR0KoDs2xPU6sGXIK7ZKncuG4SfsfU+2BdTQ8kDaoMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WXl1vXck; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJMYS5S53dvql3Nj3hmqOCgNsaFxdaLzCsfHvtRgXmxR7uFesm2UDC8Vu7ydTf1bFsVWR6xUV52qT1qNz5f4HTl+wnqxm0sNtxVQatYY1l4OKAbfxjXib6j1hRYRDLJgUQlqDso1gNfmnO1t1AEp3UlEr/66ctdZoJfFLGGV+rS8qhRXaT3LYRE+p1q5bSwKgyiw42CL3Devumz+RTc9Ctkc/T3MYjh0LFl2bmlrqSug34mL55Ua5Zy19//46xfbZ6F+4M1jIZHPeHaAMm9wgbSJGvCMtiHYhvDla3bIHnx+RctLl/boxN2bPSdmJ1WYTzEnZUrkS//q2fYtYRKXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xG7zFZYzoM++g0tER+Ow4Q88MK7IzJCmICntSb1hnc=;
 b=VBlOTsbhbeH06OB5efwPssvitxNlkkJ59lJ832ZCdfUT7MCGmqPCWPBoYmQO0vyn17Zh0wcHP+5n5hsaIn8gB3+isXyf8N4pRFDyC1i+YbSObOTC2jjel3L19/E3UNB5H9n9q94xS272/RLBZt++52edUcjQrHNlbGmTzFdk6ehtuBYYa0VFBN/ST60+WVTw4JfTXTUhO8P8NCBw/B1Y00w3hjHxPjP7Gu+0C9fTU2oVsNkqwMfh7j0keCgNEekGitgrJCjwG5DHgXgEtPiQyukLKOpNuaxd4Cu40RpEU2SWnoLlV6A0HZRkJbOtkG61u9aVL3ccgedD9f5N0tu2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xG7zFZYzoM++g0tER+Ow4Q88MK7IzJCmICntSb1hnc=;
 b=WXl1vXckHXRRw21M9fk2D5YxXUAu4ew6vLdcz7D7okXLDH25vZIE2YqJM1SiJ8lAW2VEhsmNDQBZaSP/HrxIDPu/qeha+DQVo+JNlIr21s4RrQ8u9JkP2cNIX5dXt2zVbhSZ9QUNGij9l+/IJZlGy7k3WQsazhyRqc9TOGH8QTdWmj//Z5HAaoiV2UoHAkVIwij+RmXF92RkEOpRjSShjqyDQryrAA81U8FN7fbHov57bvUsxBg1V8qOouCbpL4CRImw3mUFJi2aicjPrzK7KnElWqAPY/vCDjD64CTeHY8TKE1xZAUL90HOF0jHM1fgsXKFJuQXwefevkYsL0BROQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AMBPR04MB12401.eurprd04.prod.outlook.com (2603:10a6:20b:75e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 20:17:00 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:17:00 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>, Linus Walleij <linusw@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpcqIi3tYykqqBkK8TXWLpu6XAg==
Date: Tue, 24 Feb 2026 20:16:59 +0000
Message-ID:
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
In-Reply-To:
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AMBPR04MB12401:EE_
x-ms-office365-filtering-correlation-id: 90eb126e-eb4e-4feb-4186-08de73e1aaae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bDl6V2VsMjJMZWhZelJkeVVKdEFVN01tNFFBNlBWLzNDdUNQWVRBdDNIRmdU?=
 =?utf-8?B?dDIwZDVPdFlZQmxjS3MrU1R4MlcrZ1U5SmttenRJZGNOa0lPbThBd0Z5QnVl?=
 =?utf-8?B?eUZuT05NVFZIZCtURXMwenlwVnhodmV5eHRNeDViRk0zMFdBbGlYeXdyaHpx?=
 =?utf-8?B?VGhta3k4N295b1ZhckJUL3M0Sm41eW5tOHJtYkxLd3dId2k1bzdxWk1JZFVY?=
 =?utf-8?B?aVpuTHpteEdlK2dQSkhZWVRxWjhxSVZGSXVuVzlNZmlza2VjSTllZEhzVU9a?=
 =?utf-8?B?dFJnZTFibUNrQm91YVJSZG4xYlNKcFppWEVZRWJPSDJ3UElwcm1LTUxVckdm?=
 =?utf-8?B?VGFFcHF5M0NGaW5YM0ZzY1IyWi9MREtOaldiUGtuUVN4THBMcldPY2RIR3NZ?=
 =?utf-8?B?U0xtZ3hHZlVoQSswOGFqU0x1eTR6SUpUb1J2OVBsWERRNzA3UWF6Rlp0dHlo?=
 =?utf-8?B?VytFY0xlUDQzOHA3dWx6UmRqZmFuQ2p0dVVxK3pIZE9Pemc5N1Z0anVBY0dW?=
 =?utf-8?B?OFN2b3VJaDdTZWc1djRRYVl4L3Q5TlV1d1pXV2M2cXdRVitXQnNrSWNGSWxC?=
 =?utf-8?B?YlpkdENVWFNRVUgrbjJYY3RKbXV4SlFmbVVRK2oxVDNhektrQytCeUFkNGpF?=
 =?utf-8?B?TnNPVW9rR0hObEdDaS82TUZDMU9pU1pVNnh0ajVHY1lyUGdDMXlDaWNQa0xr?=
 =?utf-8?B?T3IwTTQ1Z0U1L0psZFl3UkxsL0JMVlNzdmxzOHZaaFFyY29QZFJUZkdDcVVi?=
 =?utf-8?B?aVU3ZUpqUnRJMmNwRnE1K1hBdkZrZmhhRW9PSXhjTHpjNHIxS2F1d29NSXhP?=
 =?utf-8?B?Ujk3TkhqT2RKcGRDSWYvS2s1aTRpbTRyalNmNDROV2xjYU83Uy9hcis2N0NU?=
 =?utf-8?B?MjVjSGhLRlhnZEdOL240VktSdmpwSTZ3MWdETzJDV0ZVZUo4eW9GbzVZVDRu?=
 =?utf-8?B?Zk5LSlVNenBZODJRWU00WWxCQ1N3TXpGZ2ZtNG44dURhcnVvT2kwbUd3WUFl?=
 =?utf-8?B?T2dwVzFpL0lVazgwRWlqWXR3Yzd3YXpIdE0vOGtHbWlPSFBFWEtVK0g4Q2do?=
 =?utf-8?B?aTFRSERydDh5RFBoWWdhTW1yK2syTURsOW9FOFRLdmJmMzdET0plNTZTWXcv?=
 =?utf-8?B?VlozNkYyd0pScHZxdkdFMFBsTXRwcGcrZTk1OVEybGRMZVhBSTdNeEs2em8y?=
 =?utf-8?B?bzcxdWFDZTVQa09PT3BiQUlEakNxSXBJUVdldjNWKzh3aEJsMFh2eWVsOC95?=
 =?utf-8?B?TTlyMDgrNVBaUE5nUUFYdDdGT3hlZC9tWHJzeUpnZGN2a1Bnc1ZydEp2Snlx?=
 =?utf-8?B?TWY2bDQ1ZG1iRzloNUFZKzIvd3dVRGtFQmVYR3ZDeUNKWHJBSFNCd1ljdCtV?=
 =?utf-8?B?S2pxWm50VmJqbzZ6MlpvZ0YzSXQ0WXIvL1NOSS9XR2Q2V2JwYTMwYUtyK3A1?=
 =?utf-8?B?NDRGMzJybUJETzR2YmNtaWtRTkNSSGtNSFVsRGhvRVRCVXQ3bDBKVlF5Z3JX?=
 =?utf-8?B?UStzM2VmNlZvNkVGOG02aGM2bmlmQlN0OXNsUjV5ZEZadC9KV0FzbHdRVGh6?=
 =?utf-8?B?bEZEZG5LbXRSbmR0bVJVVXhGeThHOFJTSmZVYmhBc05lblg5VGdDbFJGa1RY?=
 =?utf-8?B?MEpuUFFzYXpaNCtlOExqblVSZnlIelBQUjVnL2Y5MTRrNFh0UFlmblg2NlF6?=
 =?utf-8?B?ZlRKNzZRSzJ6TmkxTWl1MnZsNU5xclREUmR4bEwwVlhoZHpEU3hOanMySlBF?=
 =?utf-8?B?TXpsc0J1NDhuV29EOGRINTNUSERIV1N6UHMwSXRSdkgrbzkyVEVvTGtWZWYw?=
 =?utf-8?B?QVYyM2poajl5RUttb21pN1EvNjAzWXpjN0QvN2pGdGpZLzJnMTg3V25PTmVC?=
 =?utf-8?B?NTJJalYzZE1FVVJBQU93NzVjdjNXUjEvRzk0WnljZWdEWitDZ1VnYVl5S210?=
 =?utf-8?B?VUxFdGVHQldOT2tpOUFWaUtIQnJFeU83UmFGeXFORUM0QmdxbVQvVUpEZC9P?=
 =?utf-8?B?TUROUDE5S2xxMVM2MDh6M1dqeGtXZjVyeVVUOUMrN0lkNUh1R1ZDM1laMzZP?=
 =?utf-8?B?OWM2OWZLV3V6dXNwV2ZzMXZLRmx6WnFjRWpwUUxyR1pnWVUrZWR3VDdHYkJm?=
 =?utf-8?B?RUw4WWxpcy9ER012ZXp1SjZFSTRlZy95TENUbUc5NVd0TEZlN2ZnMlNieEdr?=
 =?utf-8?Q?a3t+2OnzkSGKfb9oWdUZ7MY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlVGckNIZnQrM1B5b2FKckxuRklRM0xndWhQV01vSUQ3THFvMVRGQjRTNm9K?=
 =?utf-8?B?NFRpdnVnS3Q3VHcvMjVzRFhpZ294UmtFVTdGYjJuRkNFaDhRaGJhVnJoa1U1?=
 =?utf-8?B?dFQ2R0FjUU4yY3UzMWxaM3FKOTk3U0FjVDBiS3lnM3I1T3krTVFGU21LOTFH?=
 =?utf-8?B?RUwwQlZLRWNFWE5HVjRITEo1T1pQcmQyaTdvVjNjajBxSzBqdHFiUnp0cC9m?=
 =?utf-8?B?NGJiZGdZK1NlbGZGUzlrOEZpYS80Y3FWWHdYM0I5RytpamJxRmdWaVNyeC95?=
 =?utf-8?B?aWxwa0dUd1J2Nzc1V3dDZHJjZkVaOHhuVytnVkVjdmxmY3Z5amFQbm1SYlpH?=
 =?utf-8?B?ejlZN21rcXB0aW5xSkVZc2JWZGlPMUo1YTR6eDVXcm93WE43TnBKMHZjVDF3?=
 =?utf-8?B?Y0Z6NGhxbnVYM0dyeVEveENYVHpGUURzSXdzTkpweTZmTWRiQitHUlJxQ0Mz?=
 =?utf-8?B?ZVNZMXJKbGFmYmhqQWlMS0dGbUZLNURxOVFGaW9BMjRFYVdZTnFSSmVVb2ph?=
 =?utf-8?B?UE51L3BvbEp4cEx5eFlqVmdJb3NGOFRISjZiSFhvK2VuelpXU1g2eE5sbHhU?=
 =?utf-8?B?UEM3WEpmOEVZSzY5clFrc3p1SS9VRnQ3c2U2UXE0Y3hCelJMcDg0b0xqYXFW?=
 =?utf-8?B?RnU0MDl0dk54b2lIV2FNYTFCS1RTMnhCNm1EN0VtMzRRRElrYzJ3dEJGM1Zq?=
 =?utf-8?B?RnhTUTdxYUtieW5MYlJwdW1COVJmZzFkU05JV2tNV0tDSlRWN1pia0RGSWVL?=
 =?utf-8?B?QklCTCs2K3pUWEsyV1llYWZjdUdlQXkyeXhicUltMEg3dFBHZWVTRnNwUEpP?=
 =?utf-8?B?UmpKN2hFZEFXZTFGRXUvNWg0UTZwWGFtUjlMS3Y3Q3NRbFZvNHBOUzdyZVFz?=
 =?utf-8?B?UHczSDhCdGs0WCtZd1VLU2xXZU1GM285blNjbkVqUUlQZTRQZmJSc0ZWVmlT?=
 =?utf-8?B?NlVxUWhTTXNTQ3BBQUp4dlZyWkQ5cysycjZMdmFBQmNRdVNQNWY4SVpMNkgv?=
 =?utf-8?B?TWN3VU5NQmc0V2VuYkpITjNvdjZFMkVPRDZra0hQYWdMdkZMYVpWbzU0VmYx?=
 =?utf-8?B?K3hJZ2ZyZEROWTAxSldTWGJaUVNEMFg3YnpsREhKUnlreWhpWTNiYjhnMHBl?=
 =?utf-8?B?MWkrckYyU2pYTHR0VjFxTDUxcHlyNmN3NG1SMVZ0NFpYNXRWbWdyNDd4Smgx?=
 =?utf-8?B?T042WkFwMm9ObFJpUGZaMzRnMkZFNHRRSXFlbFJpYjBuelU4YnBCYVZLMUFr?=
 =?utf-8?B?UmY0RTlnUVB1NURPaFFMQndlVllnZWd0T0svMi95UkdBNmd3ZFhqdFNoaVdN?=
 =?utf-8?B?dmhORmxjODVpVFpOTFdBMWgwSTMrVXg2NWx3YVV0anJIN2VkbVRnZS92Ukdr?=
 =?utf-8?B?UDVCcVVmOTRCbDA0dmVMTHJvVEZiT0VvL0tuT0dyNktmSk1qNmU4NGFlWER5?=
 =?utf-8?B?enE5b01qS0w0OWgvUVUwai9DdUxvMDFPanlMM3JIQ1ZnTjVqSHlJVGU0emt5?=
 =?utf-8?B?dDJ5aG1NYlRpMVhOb05yaU5SMXNrN1lCelI0UEpkdUd4ajN1UmE5aHdBdGUy?=
 =?utf-8?B?bnlqbEQrdW45emJZWTFOSXJJcHRTbEpQZ1pRWmdRTXhaZHNNWU42SVZDUDNw?=
 =?utf-8?B?d0xUSUpNdDl6WDVNdnl4VG16V1lLaDlaVEtWaDFUbUdTQkU1RFpEOE51U1Ja?=
 =?utf-8?B?ekdzaE1wOExVUmJIK2NVcVVCUllJQXFGYTZJTE9Bay9QOWF6SWhRTHFXWVNQ?=
 =?utf-8?B?U0ZKdU9YblJCUWw0ZmhwWkV2a3ZvZTdwV09SSHdmK2RxT1RReG5uMVliK0JE?=
 =?utf-8?B?aTJ2Q1VUQlFoUVhuVEJhd3Y2NG45NU1URVkzN2lkRkE3TDBRZG9ZZTdvOFA0?=
 =?utf-8?B?TmZNN0VwSFRhemJ5V1MrOW12bnRSQ04rekwrYjRCQmYvaVFNczdwekFyWHow?=
 =?utf-8?B?Y0hKc3VRU09wdDU5Uzl1S0JtOXI1dkhCaHBxc3R3YXB0Rmd5TGNiTVF4WHpo?=
 =?utf-8?B?WGZQTTlDcXUrZElSYVZlZWRhejRNWTFwZ1hSYlZmaUhDSER0NGFCUDgyQTVt?=
 =?utf-8?B?ZmpUS2FUcWtOb1F3N2pVUS9hZlFia1lqYXowVEp0aDJOa2JSMmkwMTBqeGVy?=
 =?utf-8?B?Tnp3TXZ3Vm8xU3hleENyVEI5ajFNZkZUcjlTY2xCTThORnlpVXFEZHRVczdp?=
 =?utf-8?B?aFdldVdIY3YvcHltc0FRZ2JKb0NhczJUR1NqcGxzblBURDRoN3BoYUoyL3FD?=
 =?utf-8?B?UnZIb3RadFlOU3h5TFlRTnVlNFZHM1VjTEd4WEJtL2hEZ05yNnY1c0lad2ho?=
 =?utf-8?B?d0hTRG9LVVVNNVkvNEhBVTZZSlpaYWxpc20zdTFGUUltMHBnSHpsdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 90eb126e-eb4e-4feb-4186-08de73e1aaae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 20:17:00.0576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdAUTmxSiyzMx9K9ulX+Aju3zaVjoWBLZ5d0xOvfgETpnD8/AoNoWhuynPM+k6nj0sCXbDhh/05j/SlhphLTbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32150-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,lunn.ch,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.965];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7045118C54B
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBQb2lyaWVy
IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkg
MjQsIDIwMjYgMTI6MTAgUE0NCj4gVG86IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5j
b20+DQo+IENjOiBCam9ybiBBbmRlcnNzb24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgQXJuYXVk
IFBPVUxJUVVFTg0KPiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT47IExpbnVzIFdhbGxl
aWogPGxpbnVzd0BrZXJuZWwub3JnPjsgQW5kcmV3DQo+IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsg
QmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsgSm9uYXRoYW4NCj4gQ29yYmV0
IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0
b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9y
K2R0QGtlcm5lbC5vcmc+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlAbnhwLmNvbT47IFNhc2NoYSBI
YXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFNodWFoIEtoYW4NCj4gPHNraGFuQGxpbnV4
Zm91bmRhdGlvbi5vcmc+OyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGRv
Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFBlbmd1dHJv
bml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQZW5nIEZhbg0KPiA8cGVuZy5mYW5AbnhwLmNvbT47IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcmVtb3RlcHJvY0B2Z2VyLmtlcm5l
bC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBCYXJ0b3N6DQo+
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHY4IDMvNF0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+IE9u
IFR1ZSwgMjQgRmViIDIwMjYgYXQgMDg6NTYsIFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54
cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+
DQo+ID4gPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDIzLCAyMDI2IDg6NDMgQU0NCj4gPiA+IFRv
OiBBcm5hdWQgUE9VTElRVUVOIDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPg0KPiA+ID4g
Q2M6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPjsgU2hlbndlaSBXYW5nDQo+ID4g
PiA8c2hlbndlaS53YW5nQG54cC5jb20+OyBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+OyBC
YXJ0b3N6DQo+ID4gPiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPjsgSm9uYXRoYW4gQ29y
YmV0IDxjb3JiZXRAbHduLm5ldD47IFJvYg0KPiA+ID4gSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsNCj4gPiA+IENvbm9y
IERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IE1hdGhpZXUgUG9pcmllcg0KPiA+ID4gPG1h
dGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBT
YXNjaGENCj4gPiA+IEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbg0K
PiA+ID4gPHNraGFuQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBsaW51eC1ncGlvQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtDQo+ID4gPiBkb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBQZW5ndXRyb25peA0KPiA+ID4gS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5n
dXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0NCj4gPiA+IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQ
ZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47DQo+ID4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtIHJlbW90ZXByb2NAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4gaW14QGxpc3Rz
LmxpbnV4LmRldjsgbGludXgtYXJtLSBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPiA+
IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+
ID4gPiA8YnJnbEBiZ2Rldi5wbD4NCj4gPiA+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjgg
My80XSBncGlvOiBycG1zZzogYWRkIGdlbmVyaWMgcnBtc2cNCj4gPiA+IEdQSU8gZHJpdmVyIE9u
IE1vbiwgRmViIDIzLCAyMDI2IGF0IDAzOjI0OjQzUE0gKzAxMDAsIEFybmF1ZCBQT1VMSVFVRU4N
Cj4gd3JvdGU6DQo+ID4gPiA+IE9uIDIvMjIvMjYgMTU6NDgsIExpbnVzIFdhbGxlaWogd3JvdGU6
DQo+ID4gPiA+ID4gT24gRnJpLCBGZWIgMjAsIDIwMjYgYXQgNzo1N+KAr1BNIFNoZW53ZWkgV2Fu
Zw0KPiA+ID4gPiA+IDxzaGVud2VpLndhbmdAbnhwLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4g
Wy4uXQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSXMgaXQgZ2VuZXJpYz8gSWYgaXQgaXMgbm90LCBs
ZXQncyBjYWxsIGl0ICJOWFAgcnBtc2cgR1BJTyBkcml2ZXIiDQo+ID4gPiA+ID4gYW5kIHJlbmFt
ZSBmaWxlcyBldGMgYWNjb3JkaW5nbHkuIE1heWJlIGl0IGNhbiBzaGFyZSBjb2RlIHdpdGgNCj4g
PiA+ID4gPiB0aGUgYWN0dWFsIGdlbmVyaWMgUlBNU0cgZHJpdmVyIG9uY2UgdGhhdCBhcnJpdmVz
LCB0aGF0IGlzIG1vcmUNCj4gPiA+ID4gPiBvZiBhIGxpYnJhcnkNCj4gPiA+IHF1ZXN0aW9uLg0K
PiA+ID4gPg0KPiA+ID4gPiBJIHdvdWxkIGxpa2UgdG8gKHJlKWV4cHJlc3MgbXkgY29uY2VybnMg
cmVnYXJkaW5nIHRoZSBjcmVhdGlvbiBvZg0KPiA+ID4gPiBhbiBOWFAtc3BlY2lmaWMgZHJpdmVy
LiBUbyBjbGFyaWZ5IG15IGNvbmNlcm5zLCBTVCwgbGlrZSBwcm9iYWJseQ0KPiA+ID4gPiBzb21l
IG90aGVyIFNvQyB2ZW5kb3JzLCBoYXMgcnBtc2ctZ3BpbyBhbmQgcnBtc2ctaTJjIGRyaXZlcnMg
aW4NCj4gPiA+ID4gZG93bnN0cmVhbSB3aXRoIHBsYW5zIHRvIHVwc3RyZWFtIHRoZW0uDQo+ID4g
PiA+DQo+ID4gPiA+IElmIHdlIHByb2NlZWQgaW4gdGhpcyBkaXJlY3Rpb246DQo+ID4gPiA+DQo+
ID4gPiA+IC1BbnkgdmVuZG9yIHdpc2hpbmcgdG8gdXBzdHJlYW0gYW4gcnBtc2ctZ3BpbyBkcml2
ZXIgbWlnaHQgc3VibWl0DQo+ID4gPiA+IHRoZWlyIG93biBwbGF0Zm9ybS1zcGVjaWZpYyB2ZXJz
aW9uLg0KPiA+ID4gPg0KPiA+ID4gPiAtIElmIE5YUCB1cHN0cmVhbXMgb3RoZXIgcnBtc2cgZHJp
dmVycywgdGhlc2Ugd2lsbCBsaWtlbHkgcmVtYWluDQo+ID4gPiA+IE5YUC1jZW50cmljIHRvIG1h
aW50YWluIGNvbXBhdGliaWxpdHkgd2l0aCB0aGVpciBsZWdhY3kgZmlybXdhcmUNCj4gPiA+ID4g
YW5kIHRoZSBueHAtcnBtc2ctZ3BpbyBkcml2ZXIsIGxlYWRpbmcgdG8gcGxhdGZvcm0tc3BlY2lm
aWMNCj4gPiA+ID4gdmVyc2lvbnMgaW4gc2V2ZXJhbA0KPiA+ID4gZnJhbWV3b3Jrcy4NCj4gPiA+
ID4NCj4gPiA+ID4gLSBUaGUgaW1wbGVtZW50YXRpb24gd2lsbCBpbXBhY3Qgbm90IG9ubHkgdGhl
IExpbnV4IHNpZGUgYnV0IGFsc28NCj4gPiA+ID4gdGhlIHJlbW90ZSBzaWRlLiBJbmRlZWQsIHNv
bWUgb3BlcmF0aW5nIHN5c3RlbXMgbGlrZSBaZXBoeXIgb3INCj4gPiA+ID4gTnV0dFggaW1wbGVt
ZW50IHRoZSBycG1zZyBkZXZpY2Ugc2lkZSAoWmVwaHlyIGFscmVhZHkgaW1wbGVtZW50cw0KPiA+
ID4gPiB0aGUNCj4gPiA+ID4gcnBtc2ctdHR5KQ0KPiA+ID4gPg0KPiA+ID4gPiBNYWludGFpbmlu
ZyBhIGdlbmVyaWMgYXBwcm9hY2ggZm9yIFJQTXNnLCBzaW1pbGFyIHRvIHdoYXQgaXMgZG9uZQ0K
PiA+ID4gPiBmb3IgVmlydGlvLCBzZWVtcyB0byBtZSBhIG1vcmUgcmVsaWFibGUgc29sdXRpb24s
IGV2ZW4gdGhvdWdoIGl0DQo+ID4gPiA+IG1heSBpbmR1Y2Ugc29tZSBkb3duc3RyZWFtIGNvc3Rz
IChTVCB3b3VsZCBhbHNvIG5lZWQgdG8gYnJlYWsNCj4gPiA+ID4gY29tcGF0aWJpbGl0eSB3aXRo
IGxlZ2FjeSBTVCByZW1vdGUgcHJvYyBmaXJtd2FyZSkuDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4g
Q291bGQgdGhlIHZpcnRpby1iYXNlZCBtZWNoYW5pc20gYmUgdXNlZCBkaXJlY3RseSAod2l0aG91
dCBycG1zZyk/DQo+ID4gPg0KPiA+DQo+ID4gVGVjaG5pY2FsbHksIHllc+KAlGl0J3MgcG9zc2li
bGUgdG8gdXNlIHRoZSB2aXJ0aW8gbWVjaGFuaXNtIGRpcmVjdGx5IHdpdGhvdXQNCj4gcnBtc2cu
DQo+ID4gSXTigJlzIGEgYml0IGxpa2UgdGFsa2luZyBzdHJhaWdodCB0byB0aGUgSVAgbGF5ZXIg
d2l0aG91dCBpbnZvbHZpbmcgVENQDQo+ID4gb3IgVURQOiBkb2FibGUsIGJ1dCBhdCBhIGxvd2Vy
4oCRbGV2ZWwgYXBwcm9hY2guDQo+ID4NCj4gPiBBcyBmb3IgdGhlIGlkZWEgb2YgZ3Bpb+KAkXZp
cnRpbywgd2hpY2ggY291bGQgYmUgYW4gb3B0aW9uYWwgc29sdXRpb24NCj4gPiB0aGF0IGNlcnRh
aW4gY3VzdG9tZXJzIG1pZ2h0IHByZWZlci4gSSByZWNhbGwgaGVhcmluZyB0aGlzIGlkZWEgZnJv
bQ0KPiA+IE1hdGhpZXUgb3JpZ2luYWxseSwgdGhvdWdoIEnigJltIG5vdCBzdXJlIHdoZXRoZXIg
aGUgcGxhbnMgdG8gaW1wbGVtZW50IGl0Lg0KPiA+DQo+IA0KPiBBcyBEYW5pZWwgcG9pbnRlZCBv
dXQsIGdwaW8tdmlydGlvIGlzIGFscmVhZHkgYXZhaWxhYmxlIGFuZCBhbHJlYWR5IGluY2x1ZGVz
IGENCj4gcHJvdG9jb2wgdGhhdCBpcyBnZW5lcmljIC0gbm8gbmVlZCB0byByZWRlZmluZSBhIG5l
dyBvbmUgYXMgdGhpcyBzZXQgaXMgdHJ5aW5nIHRvLg0KPiANCj4gQXMgbWVudGlvbmVkIGluIGEg
cHJldmlvdXMgZW1haWwsIEkgdW5kZXJzdGFuZCBzb21lIGltcGxlbWVudGF0aW9ucyB3aWxsIGhh
dmUNCj4gcmVzdHJpY3RlZCBtZW1vcnkgYW5kIG5lZWQgdG8gdXNlIFJQTVNHLiAgRm9yIHRob3Nl
IGNhc2VzIGEgZ2VuZXJpYyBycG1zZy1ncGlvDQoNCkkgdGhpbmsgdGhpcyBoaWdobGlnaHRzIHdo
eSBzb21lIGN1c3RvbWVycyBwcmVmZXIgUlBNU0cgb3ZlciB1c2luZyB2aXJ0aW8gZGlyZWN0bHku
IExpbWl0ZWQgDQpzeXN0ZW0gcmVzb3VyY2VzIGFuZCBkZXZlbG9wbWVudCBlZmZpY2llbmN5IGFy
ZSB0aGUgdHdvIG1haW4gcmVhc29ucyB0aGF0IG1ha2UgUlBNU0cgDQphIGJldHRlciBmaXQgZm9y
IGNlcnRhaW4gZW52aXJvbm1lbnRzLg0KDQo+IHByb3RvY29sIHNob3VsZCBiZSBkZXJpdmVkIGZy
b20gZ3Bpby12aXJ0aW8gdGhhdCB3b3VsZCBvbmx5IGRlYWwgd2l0aCBicmVha2luZw0KPiBkb3du
IHRoZSBzdGFuZGFyZCBncGlvLXZpcnRpbyBwcm90b2NvbCBpbnRvIHNvbWV0aGluZyBkaWdlc3Rp
YmxlIGJ5IFJQTVNHLiAgVGhhdA0KPiB3YXMgQmpvcm4ncyBwb2ludCBpbiBhbiBlYXJsaWVyIG1l
c3NhZ2UuICBUaGlzIHdpbGwgYWxsb3cgdG8gdXNlIHRoZSBzYW1lIGludGVyZmFjZQ0KPiBhbmQg
YmUgZmxleGlibGUgaW4gaG93IHdlIHdhbnQgdG8gdGFsayB0byB0aGUgdHJhbnNwb3J0IG1lZGl1
bSwgaS5lIHB1cmUgZ3Bpby0NCj4gdmlydGlvIG9yIHJwbXNnLWdwaW8uDQo+IA0KDQpPbmNlIHRo
ZSByZW1vdGVwcm9jIGNob29zZXMgdG8gZXhwb3NlIGRldmljZXMgdGhyb3VnaCBhbiBSUE1TR+KA
kWJhc2VkIHByb3RvY29sLCANCmRlcml2aW5nIGFub3RoZXIgZHJpdmVyIGZyb20gZ3Bpb+KAkXZp
cnRpbyBkb2VzbuKAmXQgcmVhbGx5IG1ha2Ugc2Vuc2UuIFRoYXQgd291bGQgZXNzZW50aWFsbHkg
DQptZWFuIHJl4oCRaW1wbGVtZW50aW5nIHBhcnRzIG9mIFJQTVNHIHlvdXJzZWxmIGluc3RlYWQg
b2YgdXNpbmcgZXhpc3Rpbmcgb25lLg0KDQo+IEZvcnR1bmF0ZWx5IFJQTVNHIGFscmVhZHkgdXNl
cyBjaGFubmVscyB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdHJhZmZpYywgbm8NCj4gbmVlZCB0
byBtdWx0aXBsZXggZXZlcnl0aGluZyBvbiB0aGUgc2FtZSBjaGFubmVsLiAgVGhhdCB0b28gbmVl
ZHMgdG8gZ28uDQo+IA0KPiA+IEFzIHRoZSBjaGlwIHZlbmRvciwgTlhQ4oCZcyByb2xlIGlzIHRv
IHByb3ZpZGUgYWxsIHBvc3NpYmxlIG9wdGlvbnMgYW5kDQo+ID4gbGV0IGN1c3RvbWVycyBjaG9v
c2UgdGhlIGFwcHJvYWNoIHRoYXQgYmVzdCBmaXRzIHRoZWlyIG5lZWRzOyB3ZSBkb27igJl0IG1h
a2UNCj4gdGhhdCBkZWNpc2lvbiBmb3IgdGhlbS4NCj4gDQo+IEFzIGtlcm5lbCBtYWludGFpbmVy
cywgb3VyIHJvbGUgaXMgdG8gYWR2aXNlIG9uIGRlc2lnbnMgdGhhdCBhcmUgZ2VuZXJpYywgc2lt
cGxlLA0KPiBtYWludGFpbmFibGUgYW5kIHN0YW5kIHRoZSB0ZXN0IG9mIHRpbWUuDQo+IA0KDQpU
aGVzZSBhZGplY3RpdmVzIG9ubHkgbWFrZSBzZW5zZSB3aXRoaW4gdGhlIGNvbnRleHQgb2YgYSBz
cGVjaWZpYyB1c2UgY2FzZS4gRGlmZmVyZW50DQogc3lzdGVtcyBoYXZlIGRpZmZlcmVudCBjb25z
dHJhaW50cywgYW5kIHBlb3BsZSBjaG9vc2UgYSBwYXJ0aWN1bGFyIHNvbHV0aW9uIGZvciB2YWxp
ZCANCnJlYXNvbnMgYmFzZWQgb24gdGhlaXIgcmVxdWlyZW1lbnRzLg0KDQpQbGVhc2UgcmVzcGVj
dCB0aGVpciBlZmZvcnRzLg0KDQpUaGFua3MsDQpTaGVud2VpDQoNCj4gPg0KPiA+IFRoYW5rcywN
Cj4gPiBTaGVud2VpDQo+ID4NCj4gPiA+DQo+ID4gPiBJZiBub3QsIGl0IHdvdWxkIGJlIGdvb2Qg
dG8gZGVyaXZlIGEgZ2VuZXJpYyBycG1zZy1ncGlvIHByb3RvY29sDQo+ID4gPiBmcm9tIHRoZSB2
aXJ0aW8gcHJvdG9jb2wsIGFuZCBsYW5kIGltcGxlbWVudGF0aW9ucyBvZiB0aGlzIGluIGUuZy4N
Cj4gPiA+IExpbnV4IGFuZCBaZXBoeXIgdG8gZXN0YWJsaXNoIHRoYXQgb3B0aW9uLg0KPiA+ID4N
Cj4gPiA+IFJlZ2FyZHMsDQo+ID4gPiBCam9ybg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gSW4g
dGhlIGVuZCwgSSBhbSBqdXN0IHRyeWluZyB0byBpbmZsdWVuY2UgdGhlIGRpcmVjdGlvbiBmb3Ig
UlBNc2csDQo+ID4gPiA+IGJ1dCBiYXNlZCBvbiB0aGUgZGlzY3Vzc2lvbnMgaW4gdGhpcyB0aHJl
YWQsIGl0IHNlZW1zIG90aGVycyBzaGFyZQ0KPiA+ID4gPiBzaW1pbGFyIGV4cGVjdGF0aW9ucywg
d2hpY2ggc2hvdWxkIHByb2JhYmx5IGJlIHRha2VuIGludG8gYWNjb3VudCBhcyB3ZWxsLg0KPiA+
ID4gPg0KPiA+ID4gPiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+ID4gPiA+IEFybmF1ZA0KPiA+ID4g
Pg0KPiA+ID4gPg0KPiA+ID4gPiBJIGp1c3Qgd2FudCB0bw0KPiA+ID4gPg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gWW91cnMsDQo+ID4gPiA+ID4gTGludXMgV2FsbGVpag0KPiA+ID4gPg0K


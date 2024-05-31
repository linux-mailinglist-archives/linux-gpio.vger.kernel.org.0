Return-Path: <linux-gpio+bounces-6996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D648D5D02
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 10:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB0741C2361D
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 08:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C016A153BEF;
	Fri, 31 May 2024 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="eAfSfzIz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CCD153BDE;
	Fri, 31 May 2024 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717145058; cv=fail; b=mMwmmmt+BysAwYvwJEXlw1DweciMdR4wDJGhWY7Zx/uuZKJ0sTuLL9/nOefsN8ln8O2rebMmcY/1HI4wPZdJQdOt0ybkUMpkwiIk0gja3HTt740foSkIVRZuTvir/URS0OJXzhSgMsU3VJJ6xI+Oso4emol5LEtS3/7GwM6i8hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717145058; c=relaxed/simple;
	bh=76GuCnLLsyL0mmPym/BjP60G2THzP7eKMPnarP7dVls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hLTYrx+Pt0bGbdH16lh+nIkUjkqr2vdt3huAyCRMWedvPLtmKCcc+YG8Wu/d38kcdb03Ct3rL4mm/Dijijb1b8JzMru9Wg4v1kOqDcqlTU4lwQzhW4hpwftBVjKdMCQGeBgIsItGEPl2vtL6RfWS5yo6tP9C8kOGQ81BgGPoF78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=eAfSfzIz; arc=fail smtp.client-ip=40.107.21.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngWzF1zBauGV6AA5nZPsBJsH5sy9VCoLUtFn+guNr6abkrqasWMn+KoQQ2r2Me1RWW3URIP0z/NSJfb5oBb15brlGFOJRYYXonRhDL4IUAOc0Q88aH6v4Pdg/zN6Pu+QrU9rYQj87EMadx3uCXsvXmEQHpVp/+YQq7znlHnmi2V68A46KOaRgk0+W0NnnocUcUJ+eVHcsvnY9+MP0nECwnE8+2hYLjg9xSVSWnvE7WZuGt/UV4TxOY3kgWdoxWBSQZtv8qFUMidDs6CxQZB1fdIEdMrfy3FDbIezTFA8adFtlRzLwxIiGy1dY8WasnB4BOUhc4kz4ub39dXm8iUpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76GuCnLLsyL0mmPym/BjP60G2THzP7eKMPnarP7dVls=;
 b=mcWxjhupzdnhwdhDNFF7RefLfSSJ/TBgN1T7MHnG+W7Zk5O0slBEtHlXzU4/A4HxiFKmCoccmgAMpTd/gGD3mGBtr+vR8mexJLkSk3ep13jGGdi6E1GHHyT4xHId2/Ixe/1Be/vRkopoKQFcNDXkEsgtHsMz88Jwnu6j3tztTuqZuUaOIZJaWthYuITyLwZ+HcDV+lwkX+gkdapeLuO7Jr6tRz8cJAin4iCd//UiEIRe7fNcbMz+JLXNgmO/E7MuqSDrE785vI+oLbk4kUHGn7SWUu1dYnL21Qdut1bT8LkoYAXfdJsHE+WINnqFPcmGFwV1NtwRfK5filI1sz1oXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76GuCnLLsyL0mmPym/BjP60G2THzP7eKMPnarP7dVls=;
 b=eAfSfzIz5CKu3MnsMTdTBb/EQ+8qFZKZmVMdE7pKSfnfzyVdP+cKnCnwiZIUnYP2JS4KJHiOPZEdasuaupUFHmGbFcTRdgk5juKoWW8ioilus7uJjDbC7i6RUFtDFfFDeIEnGW/7qeLY2KpWawwLWPVYdW3Cl3xzafh/IaX6IhI=
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by VI1PR04MB6783.eurprd04.prod.outlook.com (2603:10a6:803:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 31 May
 2024 08:44:13 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::9271:bc93:9fc9:d427]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::9271:bc93:9fc9:d427%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 08:44:12 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Thread-Topic: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Thread-Index: AQHaq0aKFPdi27a2UEqiq3vZSiymXrGrEz4AgAAGrICABfmtwA==
Date: Fri, 31 May 2024 08:44:12 +0000
Message-ID:
 <DU0PR04MB9299B6F59BA5D68E1AFC9AD780FC2@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
 <CACRpkdanc3gJ7_z+V5zwKbn+L-Qy1+nwsPLCSF9ZQ_xk3qJOXA@mail.gmail.com>
 <DU0PR04MB94173F9C323C123186F1ECDE88F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To:
 <DU0PR04MB94173F9C323C123186F1ECDE88F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9299:EE_|VI1PR04MB6783:EE_
x-ms-office365-filtering-correlation-id: 8fd83168-2967-4a2d-c768-08dc814dd8c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?S2tMZ0h3Wjl2SEUydzdZUHE1NkFEaVVtS1J2SnV4ZTUyZzVNbVVRMUF3dUk2?=
 =?utf-8?B?NDY1UkMzbUZFNyt4NVFMbG45OGJCSE5JemtZUEY3dFVVMnNndmIxbjdpZTA1?=
 =?utf-8?B?dzAyYlV1QnYxb0JnZ0FXZ2FackloZjlFVmtDR1hnejZia2lFWFdpTFBaMktq?=
 =?utf-8?B?aTQ3M1hrTXNXaTRzSWZ4Q1AxY1JTTXJaWjEwSHg2RmRYRVI5bDY5S0Rlc3Rv?=
 =?utf-8?B?bExBVCtlUWY0VWREMi9JN1hwbEcyL3E2SzcxRGFrVEJiUXB1ZTBaRC9BVXJD?=
 =?utf-8?B?YUFDVnZGcEVyU0E2aEFkaHIxVVFXTjMySHdFQUkyOWdpbWpnWnB5aHJPeDZy?=
 =?utf-8?B?U3FvUG9lNkNyUnVORXNsc3VjWXAwcFpXc29DWXFwV2VKRnZ1TEw3NVZpU091?=
 =?utf-8?B?UncxMjFZZnlETHgzYzFuOU43aXZSYytYMHIwbGVSNWxyQnhqRlZDdjJOZW1F?=
 =?utf-8?B?ZzBDVXo2RXpNZWg4V0Q1bkt1ZUNhZXMzRTdpZGdxeGNWYklOWXlGZWtxMzBh?=
 =?utf-8?B?czVSZ1Bzc0dQbE9FMTVyUU0rWDlHUFZIZ01QZm1tRjNhY3FTamxqMUc0dzZV?=
 =?utf-8?B?bEhlUTV4YXo3Uy83NzdRdURzRysxNDJGeE1Oa21pWm9RN0JRRjBZUFZuZTVD?=
 =?utf-8?B?aGxIeThQc1FlcE5wbVN0V0lvaGlyWGVQc0dNcTFCSWY4OTN0b3I0ZlVYaWZB?=
 =?utf-8?B?bFpsTENwelhjcDJ5T2RWdWZiaG9HTnQyd1N1VVp2RkFCRFVPcmd0L2V3c0ln?=
 =?utf-8?B?ODVtZ2RqSVpTUmpHZUswQkNsQnMvajJBY3JWM2daV054Wm5LeTZiaEM1YXJ5?=
 =?utf-8?B?VWIvUzZaUXF0L01HOTltc2RlTmxxWHkrRnZtWjdRNzkzMmRhYVJlbzVaNC9p?=
 =?utf-8?B?dXVpckFGU2dRWkIzVjI5SVROUEdBdDFUbG15WnpYQ01La2dzTkJDT2k4RU5R?=
 =?utf-8?B?aUVjeTFqOEJqSU8rNnBhS0E2ZG1qbmxsRkx3bjlCVlQ0THJTb2J6bEpNSnJJ?=
 =?utf-8?B?bTZYUzZnKzRuTHZZbGgxOXVxTkVacThwcTVmYVFiZUVqbDJGWmtkb1diV1VP?=
 =?utf-8?B?dWNYUm55YkgzUzc1eEhHQ3VyVW1BSVZMUHNsSU8wRmJJdm1KMjVOU2Jqa3Rq?=
 =?utf-8?B?bWxINE9hQU1qdVpFM1dGUndpVEhnbmRaZDZGNDAzRGRQNXk4YVJtY2w1S0ww?=
 =?utf-8?B?VWF1V2RqMlJvWVMyaTBlak9HYUIvOS8vY0hNRmIrdG41R3ZEb09uYkt4Y0FC?=
 =?utf-8?B?cVFBUmdyaTdWaHlnUHR0SnFya3pWV2lSRmhqcEl3anRZVkhWYUU3WG1Ncklu?=
 =?utf-8?B?M2dKVjlmWHFCeTdUQk1mWkgwSHB2MDVHNG55R0Z1QzN2U05HRjB0WUVDZUhH?=
 =?utf-8?B?dTRPNUtQZGhJOCtjczdlRFVlSlFpYnNKN2JtVWRzTVVOVGEwTkY3WTNpZ2ty?=
 =?utf-8?B?MEFXSHk2V2NiS2hjR3JobjVwV252V3JWbmdKcm5hUkRzZ0ViSEJIYmdvdTRt?=
 =?utf-8?B?b1BFeEhFa2xSeTBua1BwVFpJUnVkTEw1WVhmSEpISDgvLytXWWJCQVRzZFNW?=
 =?utf-8?B?TjErTkt5Qi8wUHEzcHQzZ2ZDQTI2cGhVcDZPQXMvTWFXQWZYekZIMGdHb0Ni?=
 =?utf-8?B?ZWduTmV3MTJqeHZMRkZaSDYwekxncHBhUEhDcHkxUHpYVlBYamU4MnM5VWd0?=
 =?utf-8?B?UGE4ZCswb3ZaZnAzcnNYd2xMMitWR2ZNYXlDN3RoWkE4VnZnWkF4ZUd0Q3M1?=
 =?utf-8?B?NjN5RkF5TGNLbE1ONEVabEpLaWpQaU1tSGxKYmpUWnJMZlJCNThWa0g4eE55?=
 =?utf-8?B?cE5sMHd4blYwaFRPdXRlZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFZmR2lwUVE1OVdQWkZNZ1hJemtYRkZXMlRXR1NPTzdSZFFYdFFoaEd1UCtm?=
 =?utf-8?B?anZ3cXRSSDZkTjFSWmh2aDFqdUFIMHdMRitYMjJSR05lNGFveElNZ3BlMENo?=
 =?utf-8?B?TlN0TzM4eGFaWCtudDg5b0lUOHpqMThpSDljdWp4SGZad2w2eUxwV1A3K2oz?=
 =?utf-8?B?aTIzQ0Q4RmVlcld3aVZ1NWE4RisySWs3OVRURkJvc1B3dklyR0hvSVlKOTF0?=
 =?utf-8?B?VHd1UHFFdE9KTTN0d1dXZEgwcDZOUUJvQVF2MkU4NlFWaWVFQWdhalJ3eEtq?=
 =?utf-8?B?ekg0QUNvQTczUW15WkFYbjFCbFBpNzJmYTZOOG5RN1oxbzY0K09NNlFxMVEx?=
 =?utf-8?B?ejF4SXFCT0VnVGtod2dZOUtzZ0lDbHZxSzlsM01GUXpKbzJxOUxwcGRsT2NZ?=
 =?utf-8?B?dm5BOTcrSXM4REZqN24wLzhFNDlCS2Q5RTkrWEFHNFVOMkhaSXg5ZEVrU2tv?=
 =?utf-8?B?dE8zUUNLNzdqdUdoYk84K2o3TTRyYllDZ0xZZGp2U1hZT3hGaHhXQ2JFbUhP?=
 =?utf-8?B?bW4zWmFqM3lPaFlhNWFLM0ord085THJUNHc5MGo5clhoUDZEaUdlUTlNZmY1?=
 =?utf-8?B?VHpINFlIQys3bU42TnN1ZGxxTGhYL0d5SlM3elBhYm1FZ0pkWFJlZlRkbXZT?=
 =?utf-8?B?VkxvazYzMlY3ZElBQjBFZWZXY0JncGJ4d0wyM0F0VlJySVpEL0twcVc2eUZz?=
 =?utf-8?B?S29aQksvTjV4QlNySm8vaWM1N0pnSmZieFQ0RDRkcVdPd1M2UnBuMXVNeTBR?=
 =?utf-8?B?WThhMFJoVzRTNWZVcm15cFUxckorcVk2bVF6VGUwdTJZRlQ0M1RucUl5Wkk1?=
 =?utf-8?B?SjhBaHhTb1lKVTFiZnB4UXFZd1FyK2lnY2hFSjl0Y3NRYUdwQWhuVGJwclF0?=
 =?utf-8?B?TGhtaUU2UWpFanhxQzY0Z1lHdzZFY2VkMmN4STRKbjVFNVh0WkhlL1FhSGVu?=
 =?utf-8?B?NmVyeStMVmRNRkE3azFnU3lQN2dHc0NQWEpZZ0x4djhBRnJTc2lwQWpxNytV?=
 =?utf-8?B?VDU4RnNaa2xMRWNnd1puc21rbklQNE43N1VZbVFBbWxLellWVzZKb2dBUys5?=
 =?utf-8?B?L3BTV1Q5NjlCZU9QRHROTDhOVExWTmVqRDQvTlJVdkQ3eW80MW8vZkZPcms2?=
 =?utf-8?B?dGZzMmtnVldiT0R4ZFMrVlVFSzdySjJaQS9idlJwRlpxejdhRExVMHgyVzE4?=
 =?utf-8?B?QVhoSlROTjBxN3VYem4xVW54TjAybzlQeU1nNllNa3NJUVNzcjcrWGJ1S05m?=
 =?utf-8?B?RlRxdkZpNVBCUEorZmdkYzVTVU5WSDVWaW9ma0dYSm0yWi9JZXB6N3JZcnh4?=
 =?utf-8?B?VTU1V2dUcUJTUHNSRVdyVWJPbk80d09WeVNlN2VjWlFyQSt6Q1FkU2RBTE1z?=
 =?utf-8?B?ZVIxU1B1VWkwUWRuNFZGWmZRcFczWW5MalEzNEJxUGNLMktibEZtRzZ0VFpy?=
 =?utf-8?B?VDVxY3Z6RkFnM2dIeGJ5NDBFeUZxdTh1akRrZUhBejQwUVVwVEJyOW9YOEtX?=
 =?utf-8?B?b0NSQ2gzbjFhRXRxVjF6Tkw2ODl4REZaRkNNcGsrMXhiZ2U1ZjhSU3A2MHZy?=
 =?utf-8?B?UG4zWXVlNWlwcHJXcEs0bVNIcG9nbEZTY0lqT1dlclo1TnNwRzdHWmVvc3Jv?=
 =?utf-8?B?bnVFRXJVOEhGNW51eXZLbG1uVkE1a0JXNEtNNkZCREQwcjFuZnpaVGI3RnNh?=
 =?utf-8?B?S2ZaRVBwdzlwZHhwQmVCejhJZnhqM3ltWTQ2Q010bG51ZkZPdHV3d0tJbXEz?=
 =?utf-8?B?VkZRSzc5TmpNZDdGc29OZE11a0NIYlVYb2ttd2liTk1uZk81enp6OFhNRUtF?=
 =?utf-8?B?ZzU3a21QcnhRQU1IcC9TaXlOZ1EvSXYrc3RxM0l0b29VU2t4MWtoN0txUTVJ?=
 =?utf-8?B?VXdjaUJPRGlXVU1BczNDMkhFRTlMejNXdmpaYU1Pd1Y2R0Y0YStCWVlaSW51?=
 =?utf-8?B?V1M2UmJUcUpOenFaZFUySWNqUmljMlN5THFEZzVGTVcwR2RHb3Vmd3A5ZmJ3?=
 =?utf-8?B?SHlxcXZZL1JRSTYycnhJRW5XWUZMOUpRVDg0RjVPOWRZcFdMN1RGLzBxaWt0?=
 =?utf-8?B?Z1hZRmVHK0c4RmlUbDIyN3duWGxSUktRRnRYNGl5NDRIOWlmUVQ5TUl3SW91?=
 =?utf-8?Q?Y7781dVBi4/1Fmq4B895yChb2?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd83168-2967-4a2d-c768-08dc814dd8c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 08:44:12.8381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uLD2jxqC/+CGAyvzEiymrc6QujYtfBSgK0DugCwSpEzQYS63ldf5dJK/edWaZRq5LEcpCrJNY/DsJL9ZdaBB0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6783

PiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gU2VudDogMjAyNOW5tDXmnIgy
N+aXpSAyMToxOA0KPiANCj4gSGkgTGludXMsDQo+IA0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
My8zXSBwaW5jdHJsOiBpbXg6IHN1cHBvcnQgU0NNSSBwaW5jdHJsIHByb3RvY29sDQo+ID4gZm9y
DQo+ID4gaS5NWDk1DQo+ID4NCj4gPiBPbiBUdWUsIE1heSAyMSwgMjAyNCBhdCA4OjE34oCvQU0g
UGVuZyBGYW4gKE9TUykgPHBlbmcuZmFuQG9zcy5ueHAuY29tPg0KPiA+IHdyb3RlOg0KPiA+DQo+
ID4gPiArc3RhdGljIGludCBwaW5jdHJsX3NjbWlfaW14X2R0X25vZGVfdG9fbWFwKHN0cnVjdCBw
aW5jdHJsX2RldiAqcGN0bGRldiwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwaW5jdHJsX21hcA0KPiAqKm1h
cCwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQNCj4gKm51bV9tYXBzKQ0KPiA+ICguLi4pDQo+ID4gPiArc3RhdGljIGludCBwaW5j
dHJsX3NjbWlfaW14X3BpbmNvbmZfc2V0KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
cGluLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgKmNvbmZpZ3MsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IG51bV9jb25maWdzKQ0KPiA+DQo+ID4gVGhlIGNvZGUgaW4g
dGhlc2UgZnVuY3Rpb25zIGxvb2sgc3VzcGljaW91c2x5IHNpbWlsYXIgdG8gc2FtZSBjb2RlIGlu
DQo+ID4gcGluY3RybC0gaW14LmMsIEkgYmV0IGl0IGlzIGNvcHkvcGFzZS9tb2RpZnkuDQo+IA0K
PiBJIG9ubHkgdG9vayB0aGUgaW14X3BpbmN0cmxfcGFyc2VfcGluX21taW8gYXMgZXhhbXBsZSB0
byBnZXQgcGFyc2UgdGhlIG5vZGUNCj4gYW5kIGRvIHRoZSBwaW5jdHJsX3NjbWlfaW14X2R0X25v
ZGVfdG9fbWFwIGhlcmUuIE9ubHkgdGhlIHBpZWNlczoNCj4gImJlMzJfdG9fY3B1KCpsaXN0Kysp
OyAiDQo+IA0KPiBGb3Igb3RoZXIgcGFydHMsIHRoZXkgYXJlIGRpZmZlcmVudC4gVGhlcmUgaXMg
bm8gTVVYIGhlcmUsIGNvbmZpZ3MgaGFzIHZlbmRvcg0KPiBTQ01JICJJTVhfU0NNSV9QSU5fWCIs
IGFuZCBtb3JlLg0KPiANCj4gPg0KPiA+IENhbiB5b3UgbG9vayBhIHNlY29uZCB0aW1lIGlmIGl0
IGlzIHBvc3NpYmxlIHRvIHNoYXJlIGNvZGUgYmV0d2VlbiB0aGUNCj4gZHJpdmVycz8NCj4gDQo+
IEkgdGhvdWdodCBhYm91dCB0aGlzLiBKdXN0IHRyeWluZyB3aGF0IGRpZCBmb3IgaS5NWDggU0NV
IHBpbmN0cmwgQVBJIGJ5IGFkZGluZw0KPiBJTVhfVVNFX1NDTUkgZmxhZy4NCj4gDQo+IEJ1dCBi
ZWNhdXNlIHRoYXQgbWVhbnMgbW9yZSBpZiBlbHNlIGNoZWNrIGluIHBpbmN0cmwtaW14LmMgYW5k
IHNjbWkgcmVxdWlyZXMNCj4gZGlmZmVyZW50IGNvbmZpZ3MgbGF5b3V0LCB3aGljaCBtYWtlcyBw
aW5jdHJsLWlteC5jIGxvb2tzIG1lc3N5LiBBbmQgc2NtaQ0KPiBwaW5jdHJsIHJlcXVpcmVzIGEg
dG90YWxseSBkaWZmZXJlbnQgcHJvYmUgZnVuY3Rpb24sIG5vdCBpbXhfcGluY3RybF9wcm9iZS4g
U28gSQ0KPiBkZWNpZGVkIHRvIHdyaXRlIGEgbmV3IGRyaXZlciBmb3IgaS5NWDk1Lg0KPiANCg0K
QWdyZWUuIFdlIG9uY2UgaGFkIGEgbG9jYWwgZGlzY3Vzc2lvbiBiZWZvcmUgb24gd2hldGhlciBj
YW4gcmV1c2UgdGhlIHBpbmN0cmwtaW14LmMuDQpDdXJyZW50IGltcGxlbWVudGF0aW9uIGlzIG1v
cmUgdGlueSBhbmQgY2xlYW4gZm9yIFNDTUkgb25seSB3aGljaCBoYXMgbWFueSBsb2dpYyBkaWZm
ZXJlbmNlDQpmcm9tIHRoZSBsZWdhY3kgcGxhdGZvcm1zIGluIHBpbmN0cmwtaW14LmMuIChlLmcu
IG5vIGdycC9mdW5jdGlvbiwgbm8gc3RhdGljIHBpbg0KZGVmaW5pdGlvbi9yZWdpc3RyYXRpb24s
IHBpbiBjb25maWd1cmF0aW9uIHBhY2tpbmcpLiBSZXVzZSByZXF1aXJlcyBhZGRpbmcgbW9yZSBj
b2RlLg0KU28gd2UgdGhpbmsgcHJvYmFibHkgYmV0dGVyIHRvIGtlZXAgaXQgYSBzZXBhcmF0ZSBk
cml2ZXIgZm9yIFNDTUkgb25seS4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+ID4NCj4gPiBJdCdz
IG5vdCBzdXBlciBtdWNoIGNvZGUsIEknbSBtb3N0bHkgd29ycmllZCBhYm91dCBidWdzIGhhdmlu
ZyB0byBiZQ0KPiA+IGZpeGVkIGluIHR3byBwbGFjZXMuDQo+IA0KPiBJIGNvdWxkIHN3aXRjaCBi
YWNrIHRvIG15IGluaXRpYWwgdHJ5IHRvIHNoYXJlIHBpbmN0cmwtaW14LmMsIGJ1dCBJIGhvcGUg
bm90Lg0KPiANCj4gPg0KPiA+IFdoYXQgaXMgdGhlIG9waW5pb24gb2YgdGhlIG90aGUgaS5NWCBw
aW5jdHJsIG1haW50YWluZXJzPw0KPiANCj4gQWlzaGVuZywgIEZhYmlvLCBTaGF3biwgSmFja3ks
IGFueSBjb21tZW50cz8NCj4gDQo+IFRoYW5rcywNCj4gUGVuZy4NCj4gDQo+ID4NCj4gPiBZb3Vy
cywNCj4gPiBMaW51cyBXYWxsZWlqDQo=


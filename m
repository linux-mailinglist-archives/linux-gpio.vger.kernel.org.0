Return-Path: <linux-gpio+bounces-35426-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MGBJkxw6mlBzQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35426-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 21:17:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C110456A04
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 21:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3423D307BC94
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 19:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2910C392C21;
	Thu, 23 Apr 2026 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PF1I9Lq5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCDC3921CD;
	Thu, 23 Apr 2026 19:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971512; cv=fail; b=SmQVw/+W19LgFkuuCqsMu+8vukmT4O5ZRJ726dom8xst7lwtUkK59+hEIsffmmnhOK8IgcWhPYqitnldGAlN7MmEdD9cWzH/arNSPRMNuJSGQV54Kp03LyFL+HYg3m1YqMRJXmkSbdjM2jK9GNEDFoiGTgx8jRMd6rzXMUxBNdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971512; c=relaxed/simple;
	bh=P74Af6Q/D+FF/S72s4IG/F6zKvyhw8lK6glm2Nh7J4U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D0gK5xUQSwBIIEAMY4fZ9P5R8+uHuUBaiexL5qCC+lNZzY0fBylDA6Egcpq5B3+fIMr4OtpL7V5mFsl+1TQ/f+Elhn2vUNNGDrY7nU1ZwJz1kSangJRRYwIX3Wt+9IKLEdjtpvYvgOX+jyzQ6Mcxip8n5IdPoJSmv9b5g/+Stao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PF1I9Lq5; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwSEUlVrFlHf8H+eyzFBwo+wV++TNTlx4p6CKbbPHaXtSqBy7VUFaWVlyWsUcJz/EJVCB5c+Wuu79GLQx3x2qaqEnnYSLL2uRboVleuS6BEGA5ACC8ZgKXkc8iotSfTDdSe6btf0FZqsf4KL5PkhCe4qbs6b4KAQkz/ywn9QM2ARFcEp+oYhJA78vwFtel+DGoU7dAhoW77WWfsoIu1KlDsLAtU31i8F/tONVz6tXUxUS4b99041K6puLZR6YI5Bwh3FArZ7ke3A/ULs06+mtFIO2wGZqW5zeJMbdOr6bpjsvlxajsLq/7E9Hu+lMvwqhXp0bRt3GLHJru0W35G2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P74Af6Q/D+FF/S72s4IG/F6zKvyhw8lK6glm2Nh7J4U=;
 b=uBh9LlXDZWs38x57rIY4ovHQQyVOGvi+6nu7SfdW8RhDNWvj+vyGELW3wBoGMZI0c9w5N7pNOcVWevuY5gQvQ/Kr3hlfUwZINwnUSS7EKI4SDxzC4nkSlbIcCd9Hj0taP6j6u+6pHph8Fd2aIhkB96JFqY7oGXcVlKks55SDmZkJgrA0xGUDPV1jlvSbmIQJuWrkH4hDAGr8mzvrWCZ0+Xw5Ivh8L8hHwhRMRmxm04b0G4r+C2aag5MgNwVD0I7Zg3Bbid1tYiCA0SjtUrn2OHVFYa4L5TZhbCZ/Yp45dz3m0Wp8tri35ZpH5z1kBx0x1vT2818NwJA909992fZ+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P74Af6Q/D+FF/S72s4IG/F6zKvyhw8lK6glm2Nh7J4U=;
 b=PF1I9Lq5RNvwKt9YiL3wNJDkIMO//UrmSAl9NmgbTDJWds+0hedFbN5/Ovfg+mw0OTOrSCQ7irgkAv2SLjVa73hiSzzx1A9jGbkH0eCSAljBbHL/jrYeGfqUsuChlPVvC5dA+ogO9eth+Q9xHcaXlCXJ2vMh4CyQf6vo/OexOEmXFXjyHGtG4lFwQ24U1ir4VsKFJfmErQSm9KfGPBtr4Tpa3IAhx3ZRiIDSXV+oznpGOOPCYweb5c2o6J1jves2h/HyIu8i//QURosH/pZBq2rgthKs7FavJTYOTBCwJqLDIqyHsI7aWjdHBlKnEMMQyJwvNSBaJzaOFP3Y8NnayQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8312.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 19:11:46 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 19:11:46 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHc01UHU14luaJCXE65v4u0LmXX1w==
Date: Thu, 23 Apr 2026 19:11:46 +0000
Message-ID:
 <PAXPR04MB91851AC64A2D3C066BE62806892A2@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
 <cb6b8ec9-296e-40fe-848d-ae87463ff1db@lunn.ch>
In-Reply-To: <cb6b8ec9-296e-40fe-848d-ae87463ff1db@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB8312:EE_
x-ms-office365-filtering-correlation-id: 3e53eef2-9c1b-4314-08cc-08dea16c2a22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 03CeH2d0t1694ieAnRrL428OSLMxcGuB+OFOOyGyxj109j47yCHRWY6yoa0Sa5ZvX68eN58Pqb9eVWULpEN+M8xd+vPYwR6iXaiOIR+VkOCt2lVYVyjAEcxJTaYS0NKceKhwx6xupNeoRcU3ncpIpSlrL8+tprw0mOROJj6ivwOKxYOkidWTenmSx4Io9AJ/MAGnofd6jG5Hhcg/M5hoZ5451hQM1726IUhTSeG53TjtgZHPSaUktDrYT/M1ks0HCwm1CAQz/AUN5F6QATDFgpbdWlrE0pO98j1Ix3zz8st0dc2XUWcei8c89pHJim1gPVzeFa2S9PKuFDBYAB2xhTIwXVF+cxHB7FtQ9y9S86mUH63p/QHyzLuKq2XTbfUM1pjGue6PyWs/DRe2Do9+Axf5tj/qGTFiOkrxnU6Mi00Ii23z3ezUZqGWV0tUWFcZs6pbx+Er79GaIpDP7e1ErBqwFuxxvFvj9fN67yHT9txbkHcZUUTw3Ha77TJATsfY4FdtnPw78VyRYLjFrThGQS69ni9dl91tP0eap3RJgKGLzkYnaIoSYTWaI39c6pB219bjT0//ziqOMQTU/AILIIShUSlCq3maxykvvkTzK4Z3i1duC1UEbtlYu7pIhshBDcv4MANrypqkRL5UQivfFFqWSvppB8mnTf0YcWJWKWv+o6ltxYWgxD1++gRk71OjuA3DMwzkRn5gIMhEV8wfWph87qq+L3Fl8ub/RYzNrz7gSFVdow4AYqo8FPvilPwU+SFH3SiCNe0SSgXom9UMCWEP45ApVfSAlEqjFRtZHhg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUp5UitQUFoxb1hsTXE4MDZDWDVYT25TNGJyYXZLa0NZUldmM216L0ZXKzFF?=
 =?utf-8?B?UXB2RHkrNGNPQjJhdGxLU2o5RHVQWjIwYkV3K3oxcFN0WWxEaEpNbjFtS1p1?=
 =?utf-8?B?Q2x3Zi9wWXJLNmg5dUc4cWlPK2o1cGdXUVJWc2NidFQxUjlGa0RIdHJ0ZUtC?=
 =?utf-8?B?MFc3a0syOUZmcU96YnQyN2xkbWlYNk9XREdVSjZ5ZDBIaEhZWjBVMmtFUjUx?=
 =?utf-8?B?amlLT2RkSzlsVmsvS1ZaaWNmMm55ZWpUOW1PNXBKaFZaMVJGaUpoUlFpR2tC?=
 =?utf-8?B?UmR3MnQ1dDFRTFJZZXlIRCtJbjNnV2ZQcWVoSlE5ZHlVb1kwclJXeUw1RTQ4?=
 =?utf-8?B?ODZwS2p4MzZhTDNDaWYxWjNGNVRtRkhyb2NhNU5BNytVMTU1cFp4aDFMQjh2?=
 =?utf-8?B?a2V3TmxWZnhsNWk3Wis3UU8wNHEwMjFTeFVFVGtOeVlGNkZ4RnE4K1dydXZo?=
 =?utf-8?B?bkp6bktKckpwNUVCUFNUckpsQ1YrejZFVlpnclhoUDhHS1JwNGlUenJBMjAr?=
 =?utf-8?B?RElQNmovcEI5M3kxWmtpSC9MMThPSjAzQm9HUm1USlVINTdWYXdXZTJiWFF3?=
 =?utf-8?B?bkhQZXJ4T0s3eHNBczdBRzNTeXVuZkd5dFBHdnZVbDRWQXVJWUZmYVZkdFFP?=
 =?utf-8?B?NzFRemZaeHVEMEZWdDAzTi9DOFYwNnEyZzhxRjMvS29leklqbEV2ek5jWWVJ?=
 =?utf-8?B?RzFPRDFXcUxSa0tPT2dJT0pSRFBpRExNcDA1b3NsSitRR1VqeVBvc2NielB2?=
 =?utf-8?B?RGk1T05QQmdRYUl1bTBPcnhFZlVMcGMxdk1WT29RVTZUUDI5QnIxR1JzM0hx?=
 =?utf-8?B?THg2UFVDWTRmU253OUJTS0FyODNrSW1EVE9xOWY5SWxKQkNFckZ3ZkpUVGFz?=
 =?utf-8?B?WWVOMFNLREZhSGZjU1k4NzBSYS9IM1lNRmdLZEZPaXhUVm5jelBDZ1hLQlY4?=
 =?utf-8?B?bzQ5cUV0TVU5UFNWU1pNTkVxOHBBVlh1VkJsRTVUY1JPcGgvWDlJUUFtcUxx?=
 =?utf-8?B?UGYvMnhnd2tsYzQ4Q2dyY2NnZ0dlNXNHVERjcUdKUVo5eFNQSVNZQkd4VXE4?=
 =?utf-8?B?eUtYVWdCYVlteUtkUy9aQmtiQWJWbXBwdXdza1V1cWhkNkRTR2l3eE4wUkpG?=
 =?utf-8?B?eU5RR20yOW5UQms4bUR5QmxkdFdXYlM5bk02N2JBT242VW5sYlRwdkduQVdU?=
 =?utf-8?B?NVRtS1pLOW5QdGREZGFUaUtNMzFtREd0UzFPSDBwc05KYU1jSlV0ZElmYXNh?=
 =?utf-8?B?T3JqMGI5S0UyWm0wcTM1YnJQWUJSOFZHbTI2ZkE4ajQwd3liZS9kTWRvNHRu?=
 =?utf-8?B?ZzVqdGZXVDF4S05NbThpRjdDZktOSGxWV05vU2FUUUZHWmxnZTZCWGJJOS9n?=
 =?utf-8?B?MXJHQUZZUUc4aExVRGVrYjJuTm1oYTFjTnVCSjZXd2tKWjc1MEZZd0JLQ2VI?=
 =?utf-8?B?dERUbHpia3Y3TkVQc3FtUzZPYnA3LzF4Zk9qdVY0WHAzbzZZRk81b2FKMjJC?=
 =?utf-8?B?N0RodWZzMUo3SzNWQTRRN1V3SmtoOHRCdC9ldjd5UU1hb3BLRi83YUEramdu?=
 =?utf-8?B?MDNKQ3ZUdTVmN1dMY2RMUlZFZzNKK0FnS1dMcTVWM2x1K0Uwb2ljZWN1eGti?=
 =?utf-8?B?eWZVYXMyaEN3YkpyRUZCZTEzWXZpOUNKeFo0aWx4MVRSMEJkZmpZd3lSZ0pR?=
 =?utf-8?B?YVhFblhzaHFkaWx2azZNaGRWS3VOazNibS9RbEloZy9HZWZhUUdQa3lLR0Z5?=
 =?utf-8?B?R3RRbld4NCtjTGRuS25QaXRWZmJLazgveFRzSVpuamZVaVpHWWo3TU9ZdnBR?=
 =?utf-8?B?ZGZRZldoMTVaa3NGaTkxUGlHbzNtRmFPOTE3VXRIWU5QS2RNSmVCN0ROcEZE?=
 =?utf-8?B?SzVXM2FHelg3L1N6SnZ0d25KYjVYOXVmK3U1S2taL21NZzBlQUptYjdZbDRJ?=
 =?utf-8?B?THl5UGxCN0g2Q1BubEdBNXYvelp2NkMrVzh2SG94Rk1lOHJMUzBta2VKZWJh?=
 =?utf-8?B?Vkd0Q0lkTGluT3VPR0VNZExBTG0xRnRYM3pZV3VXYlB4VDQ4bnRLQ2hRbmV0?=
 =?utf-8?B?emlDbitobUw0U3FDZ2RoOGJmc3dmZXBMak5sV01Icnp1T2lxaDBYNFRBN1NP?=
 =?utf-8?B?dUdvYXd4ZFBUZ1BaR0hWaXhCeGRxSitSUlJ2NlpJaG1HYTdrdDM4a0c2Vm9q?=
 =?utf-8?B?MDBuQm02anJEMXQ1bTl2RThnbjR6ZG1LeEFtbXBYUk9ac3N5SVIwWkxYbUgr?=
 =?utf-8?B?VXZTWTFyaXpPZHN6ZitLT2I5d0VyRjcwa29VRGhORElWbGxEbnFOUUZSdE5o?=
 =?utf-8?Q?z6WEU/E85sCgVUZ61B?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e53eef2-9c1b-4314-08cc-08dea16c2a22
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 19:11:46.8328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fu2ZPc3DbTXYdOlRy+okmFHQkg3opp94kBqDiB6+G7rC3uyoRu+SC2wfqab/CQWnx/l5DE+pi1hBiyFolQVb4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8312
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35426-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,pengutronix.de:email,lunn.ch:email,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,nxp.com:dkim,nxp.com:email,linuxfoundation.org:email,lwn.net:email]
X-Rspamd-Queue-Id: 3C110456A04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjMsIDIwMjYgODo1NCBBTQ0K
PiBUbzogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4NCj4gQ2M6
IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5jb20+OyBMaW51cyBXYWxsZWlqDQo+IDxs
aW51c3dAa2VybmVsLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47
IEpvbmF0aGFuIENvcmJldA0KPiA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6aytkdEBrZXJuZWwub3JnPjsg
Q29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4gQW5kZXJzc29uDQo+IDxh
bmRlcnNzb25Aa2VybmVsLm9yZz47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hh
IEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbiA8c2toYW5AbGlu
dXhmb3VuZGF0aW9uLm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgt
ZG9jQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gUGVu
Z3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2
YW0NCj4gPGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsN
Cj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbW90ZXByb2NAdmdlci5rZXJu
ZWwub3JnOw0KPiBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtDQo+IGlteEBueHAuY29tPg0KPiBTdWJq
ZWN0OiBbRVhUXSBSZTogW1BBVENIIHYxMyAwLzRdIEVuYWJsZSBSZW1vdGUgR1BJTyBvdmVyIFJQ
TVNHIG9uIGkuTVgNCj4gUGxhdGZvcm0NCj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJu
YWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvciBvcGVuaW5n
DQo+IGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcg
dGhlICdSZXBvcnQgdGhpcyBlbWFpbCcNCj4gYnV0dG9uDQo+IA0KPiANCj4gT24gVGh1LCBBcHIg
MjMsIDIwMjYgYXQgMDY6NTM6MTJBTSAtMDYwMCwgTWF0aGlldSBQb2lyaWVyIHdyb3RlOg0KPiA+
IE9uY2UgYWdhaW4gQW5kcmV3IEx1bm4gd2FzIGxlZnQgb3V0Lg0KPiA+DQo+ID4gT24gV2VkLCAy
MiBBcHIgMjAyNiBhdCAxNToyOSwgU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4N
Cj4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gU3VwcG9ydCB0aGUgcmVtb3RlIGRldmljZXMgb24gdGhl
IHJlbW90ZSBwcm9jZXNzb3IgdmlhIHRoZSBSUE1TRyBidXMNCj4gPiA+IG9uIGkuTVggcGxhdGZv
cm0uDQo+ID4gPg0KPiA+ID4gQ2hhbmdlcyBpbiB2MTM6DQo+ID4gPiAgLSBkcm9wIHRoZSBzdXBw
b3J0IGZvciBsZWdhY3kgTlhQIGZpcm13YXJlLg0KPiA+ID4gIC0gcmVtb3ZlIHRoZSBmaXhlZF91
cCBob29rcyBmcm9tIHRoZSBycG1zZyBncGlvIGRyaXZlci4NCj4gPiA+ICAtIGNvZGUgY2xlYW51
cC4NCj4gDQo+IFRoYXQgbG9va3MgbGlrZSBhIHN0ZXAgZm9yd2FyZC4gTm93IHdlIGRvbid0IGNh
cmUgYWJvdXQgbGVnYWN5IE5YUCBmaXJtd2FyZSwgaXQNCj4gbWFrZXMgaXQgZWFzaWVyIHRvIG1h
a2UgYmlnZ2VyIGNoYW5nZXMsIGxpa2UgdXNlIHRoZSBtZXNzYWdlcyBmb3JtYXQgZnJvbSBncGlv
LQ0KPiB2aXJ0aW8uDQo+IA0KDQpUaGUgaW1wbGVtZW50YXRpb24gYWRvcHRzIHRoZSBncGlv4oCR
dmlydGlvIGRlc2lnbiwgaW5jbHVkaW5nIGl0cyBjb21tYW5kcywgcGFyYW1ldGVycywgYW5kIGVy
cm9yIGNvZGVzLg0KDQpTaGVud2VpDQoNCj4gICAgICAgICAgQW5kcmV3DQo=


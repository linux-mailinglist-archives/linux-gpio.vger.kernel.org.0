Return-Path: <linux-gpio+bounces-21719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA7ADE421
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 09:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094543A5A4E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 07:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D23527055C;
	Wed, 18 Jun 2025 07:01:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2103.outbound.protection.partner.outlook.cn [139.219.17.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C777A26FD88;
	Wed, 18 Jun 2025 07:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230091; cv=fail; b=JqCi3P91UYWlRJhw+UW003Ck9FN7zzhNiu0WOpRDP1533JUEecNSxyZvK9+al+TuBAF9etDvHoi1RPCeQQlkesbA1evWNsPiv3pAuMeJYRje+3Az8kny7ClfH6aVstDuodQdMVvk9YlfWjHMjQYS/YAN/QOetCluq64qXcr0VBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230091; c=relaxed/simple;
	bh=6aWVJUQYtFlSTcCD/Hc/0pDx3cMD4KsBVVNV6vL2Jbg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MMoQHcEtKJvAbAjNhoYPtmsHBg/Myfb76h224GoE92ngT4oK9yrt4VJs5vyN+6W1XoqKaFR2TJ17g08cg1LQcDtiHDlHT0jFd+RwVFiPBsrHOcIQEOwkag5Kwf7t9OuwV9iW0LVDI3W5SgDICuPg3nSlDD4DFUdwAxzZGWyys3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6zd8phe8EBTCBb6vKnRU9BKOhKTq7QLfDZfByoNLn2bR9eJUZM/Da7jU0DxQOsbaC9TlNxQFw/kWr3+5xvnU+eLGdrnInjsxYFB4eby/P77rS9I5Bz65BOSGhIf1DUjJgt8s+oSCblz/qEz5kyEq3JDL51dhcyyXghe3dqcPUg9uoXEug4t6murUnFCjtWoDSVHhImFOJsKhwGw6sqJy2M5bMaKjKp2v3EfJKNoJ79O+sEKIsl+WahKam/2IAogrJk7PM8qKY7wjT3LENSwvy6e+apbYEuXB/mjYV5wstDVtI0FUvYINW6XHFsHoEyUV3GP3SJSGQvQuhxicEXO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aWVJUQYtFlSTcCD/Hc/0pDx3cMD4KsBVVNV6vL2Jbg=;
 b=GyhqffnVT3UBkAM5+eJzb7P45X3BDNqZe+hqnoX+AULFiiw4SuxtfzS0i2cjCFNFcQfBY22EoUcSOKkmDWoJPbO6NmZ6VJdJNYtsgZUP7jgAb/wLA+mngzF5Pd0HDXHREw/5RrLLQI5buhNWj3XJGq7UwXIeUDnbc9eu4DdmWiU23XdX0kSUN/EQjEA02jGvYpBsBlMseviArQonJ+Evstv4bfNPyHowd2j+rtr+uGeDotj0SWk45DBYeNkC6hB3vinj0p+25n9Fnjda6LUByYiYcvQUPTklBPMf/cVCUsyxTFEtm/VUM75i7zikyHe8hPAhxpEE+UlfwU4HzBkAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1292.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 03:28:01 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.8792.044; Wed, 18 Jun 2025
 03:28:01 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Emil Renner Berthing
	<kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, Linus
 Walleij <linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [PATCH 1/2] pinctrl: starfive: jh7100: use new GPIO line value
 setter callbacks
Thread-Topic: [PATCH 1/2] pinctrl: starfive: jh7100: use new GPIO line value
 setter callbacks
Thread-Index: AQHb25T2ZvJ92IWTj02redakeaLH7rQISgcg
Date: Wed, 18 Jun 2025 03:28:01 +0000
Message-ID:
 <ZQ2PR01MB1307AB5E7CC4C3D7291964B1E6722@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References:
 <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-starfive-v1-1-8507b46516f5@linaro.org>
In-Reply-To:
 <20250612-gpiochip-set-rv-pinctrl-starfive-v1-1-8507b46516f5@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1292:EE_
x-ms-office365-filtering-correlation-id: d091d6b9-2f14-43b9-2c43-08ddae182158
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 CNw8IDLbPSwmSBrTh8SQVeV3oNVAtlgEu9sd/5+VVDPAJKj16MARLJ8d4dXkxqHdfX2zCiZfyrrhHBK39rMmI51rOF1Rs/O2dcyERnsLJWslAVnuQn5XlZXmDqptLed+KE7naX1Hx1nZnogVEZGbnZwuOAceDYXKS31zInClF3ie+asSWY7L30KGF2fDpDhdc3NxVMUs6k10Ij167OgTK9OCKL0P/Fp0ypoX0ej31rEDB4p+ig8YQKk81aPEACANIseVg8sQ6SzAlN6jvoRDfoS3lVIgK9xXEIK7KKLzHdmY77E69wJZMvHIAuaXOH4LVbOXl7QYdXbAeK85sv1Nw7glV6hisujMJ/mT0v0qzsk8tOCwCSjrDD4xpERryXTFHtT8MCG6OzftGZFflbPrQkXP7VuOEAJHWqMB4rxw/ZTfnEWFlt/rHNkpJePmyFJQMOaQ4bzZDw6GmO6bjqYYWMBQ8d3C6G8aEbTsiAyAqJDSsUijwC8LPXEcImFwk1VZiQ7fT9Y/L9OCc55QBK6GDQbwQusjQGja2M9duW++CqyLpeYXVNJaVwIeKeLhKIohMDOcXxeQ7dN56i39s5MhW3zEFgCUoPlaZVQJvxZ/xd0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1AreVh5bktvUzZWV29qRWVoeGtQenNwQkF2ZW8wN1RsTGJaUmNMV2VUazE0?=
 =?utf-8?B?UGNlTGdDeEdLQzA0MGUrTkdkMVpZWjNRbjc1NW02WGF3V1JITFZtc1lCOEY1?=
 =?utf-8?B?emlIK1ViM3ZGVmxHWVJFamw4UWlwMUpMaHlnN0tRTHpyTS9TcXV2TUY5V2Vz?=
 =?utf-8?B?YnNLRmcyR0NZS0Rwd2FiRTI5aW9ZaWszN1huTU5sNk9YbDJocUkxcHZ4YVdQ?=
 =?utf-8?B?THFVUWIxbWp0d2k2ZytERTkraFNJcHpTcnN1NzNEZmhoWGN2RjJIVmxZVW45?=
 =?utf-8?B?TFpPYlMrdlMzbTVJZ1A2U2RUbTRpWGkxKzYyajloTTZJUmVyTFZEWk5iU3hP?=
 =?utf-8?B?NEpYMkJRaDQ2TStNdVZSQTgzQWZKTnh1a3Bad3EzaWRrMDdKQUFxbGw5emdW?=
 =?utf-8?B?RWVUZGdhY21lS0N5TlJFNEFYa1ZibXExMVlCTDVmUXBHRXlkRllCbk42OWhx?=
 =?utf-8?B?YmgwcDZKNUU3dEJjOFBYTk10RXBQWHJrZzdVNHhsREl5UERxY000dHJZU3ov?=
 =?utf-8?B?RnEyU2FUNFMwMUhVYWhwUVQyeUxCYTJZNmtFYUcyYUM0VGNCZ1JhL283aU1n?=
 =?utf-8?B?d20yMEw5ZUlWMW1IMCtURHZPVjQrVkhUSGlycGJGd1lQczQxRlRvN0ZOWWoy?=
 =?utf-8?B?ci9Rdm9vN1l1YlJtaEJZVmxCOW5ESkNxcE5JQ3FMY0dkbmt4RVVhZ3JlVmZj?=
 =?utf-8?B?c25rQTIwS0dXbEFpbmtZZ1ZNSE9lOUR0T2l1NjZjdHdRcDE4eXFlSlg0Ti9T?=
 =?utf-8?B?UTZ6b213bTR0c2YrYXAvdERreElMR3lIRFVVTW9TUlJ2ajNnc2tYMWNiLzVT?=
 =?utf-8?B?VkdEVEpVWFk1V1E4VldZNnFobGFjaURGWkFZOFVtb0orTXpIbnRKUEE5N3hq?=
 =?utf-8?B?cURLT2gyUm5USnZQZlFjQ2t4ZGJiSFFvWmw5N0tOQUNZbElvamR5UHZKRGx6?=
 =?utf-8?B?QlVWSXZhUFpaSFJyaDNiVHV3Y3B1Nk90ZFBsQkdua1hlVy9rY3lOZ1l1cUFk?=
 =?utf-8?B?cXZXeGFkZ1lOSEJPYk4vbjRiaDVSRFlrdjFGTkRCcG1VNmZ2Z1ZPOWIzR3FM?=
 =?utf-8?B?WmZQWHdPZ3V4TElZRkdqTVkrbVYyN00yVm16L0ExZkpLMzZlaUM1L3dwcUU0?=
 =?utf-8?B?LzlTL2hocFBkT0svQkdJVHZ1QXhvZWkyd1NSbldPT1dRVjIvUE5VVmdhMVlw?=
 =?utf-8?B?UnV0eHI3cW9RbnI3UFhPN2U4OWV3NjAzWGRKbzFoOFpKTzYxL3FmcXU5MG5z?=
 =?utf-8?B?dlR0OUNpa09CUWhnbENkMlR3bEZpTWN6eVNWM3JVcGhpV2dpZEV5VmRMR3V5?=
 =?utf-8?B?NU5HZzJNd2xCQzExNEwvTURSTktSN2VYSHpYY211SGlOMUNXNHFUcmZod2VN?=
 =?utf-8?B?QTZVN3ZRNEw5bDFFeXhOdXpnbXZIKyt1L1BmRHFIbUVkTi83TEQ4NUwyR2Rt?=
 =?utf-8?B?QVBVNVk3VXJMc1NGeHlCUlZoK3dudDd0QlY1cnhVMTBXblI3T29YSnhiTjdP?=
 =?utf-8?B?ajhmcUtvQkpubWYxQU0xRW50dVRxWHN3K0ZsQmRkRzJYUkFZZExUelN3eUJJ?=
 =?utf-8?B?VHVLdnB5RkJtOERMaVF1YTBraEpRTld6Q3pDRi9jRCtENVZFcmFsM2ExQkw4?=
 =?utf-8?B?Sk9GWmFma2l0YmN6Q0RwenErUTE4NVpCbElJY0pNVHppSFhiQUd1MCtrRHd2?=
 =?utf-8?B?MUcrRmdFSURST3lLdVFqeE0rVnNSS2RpVFY2RXJIVW9PcTlUMzBGV09OV1dX?=
 =?utf-8?B?TEpKTTRnTHBVTTFsdzdySU4ySnFaTXR6NHJYNm80ei9CVTZzckN1U1lJNHVH?=
 =?utf-8?B?dmZqOU1CNWZRZDE1WEdUNGhLSWxtZkNGVVBWM1Q3WGVwYlhKRThwTkd1cWh4?=
 =?utf-8?B?Tk5CZmcvSFkvTkdxWUpWMzFRMmJDcm9pL1NRM1hTR2xEVTdCcWdYeWV4ZDlv?=
 =?utf-8?B?S0p0bU52UHlDZ0xOU3NzUnRsSHN2c0dITldCU3R0N3ptUVd6c1Yva3dQZnpW?=
 =?utf-8?B?TXhMalhKWnBNTFhMeUZQbXdTL0FaZGpEekY2SkUzbFlBUEN2VS9keXhpNW5k?=
 =?utf-8?B?Q0t0U1p6eGhkdzQxRW5XczdVMzAwN3E1YmxPUmorSTY2eExlcWdKUTJsaXhO?=
 =?utf-8?Q?d85TL8RqJbv06lG+x556HCLD9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d091d6b9-2f14-43b9-2c43-08ddae182158
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 03:28:01.7967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTq/6hV3oJmzYxyRlBajYWbsJiXKJ8sw9d1XNuHx1d5Y7MuDWtm+QgZjUjEDEGUyidVUDFcVaTBvgothrM7ioqmqXaMKcYXAdUES/EVKLFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1292

PiBPbiAxMi4wNi4yNSAyMDoyNSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gDQo+IHN0
cnVjdCBncGlvX2NoaXAgbm93IGhhcyBjYWxsYmFja3MgZm9yIHNldHRpbmcgbGluZSB2YWx1ZXMg
dGhhdCByZXR1cm4gYW4gaW50ZWdlciwNCj4gYWxsb3dpbmcgdG8gaW5kaWNhdGUgZmFpbHVyZXMu
IENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2luZyB0aGVtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KDQpS
ZXZpZXdlZC1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+DQoNCj4gLS0t
DQo+ICBkcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvcGluY3RybC1zdGFyZml2ZS1qaDcxMDAuYyB8
IDggKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0
cmwtc3RhcmZpdmUtamg3MTAwLmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvcGluY3Ry
bC1zdGFyZml2ZS1qaDcxMDAuYw0KPiBpbmRleA0KPiAyN2Y5OTE4M2Q5OTRkY2NiOTJhYWM4MWNh
NDIyMjhiZGI5MjI1ZTg3Li43ODk1MjUyM2U1YjYyZDI2NTNmMA0KPiA1N2ZkYjk4NTQzOGJlYmEy
NjliNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3Rh
cmZpdmUtamg3MTAwLmMNCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwt
c3RhcmZpdmUtamg3MTAwLmMNCj4gQEAgLTk2OSw4ICs5NjksOCBAQCBzdGF0aWMgaW50IHN0YXJm
aXZlX2dwaW9fZ2V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLA0KPiB1bnNpZ25lZCBpbnQgZ3BpbykN
Cj4gIAlyZXR1cm4gISEocmVhZGxfcmVsYXhlZChkaW4pICYgQklUKGdwaW8gJSAzMikpOyAgfQ0K
PiANCj4gLXN0YXRpYyB2b2lkIHN0YXJmaXZlX2dwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAgKmdj
LCB1bnNpZ25lZCBpbnQgZ3BpbywNCj4gLQkJCSAgICAgIGludCB2YWx1ZSkNCj4gK3N0YXRpYyBp
bnQgc3RhcmZpdmVfZ3Bpb19zZXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBn
cGlvLA0KPiArCQkJICAgICBpbnQgdmFsdWUpDQo+ICB7DQo+ICAJc3RydWN0IHN0YXJmaXZlX3Bp
bmN0cmwgKnNmcCA9IGNvbnRhaW5lcl9vZihnYywgc3RydWN0IHN0YXJmaXZlX3BpbmN0cmwsDQo+
IGdjKTsNCj4gIAl2b2lkIF9faW9tZW0gKmRvdXQgPSBzZnAtPmJhc2UgKyBHUE9OX0RPVVRfQ0ZH
ICsgOCAqIGdwaW87IEBAIC0NCj4gOTc5LDYgKzk3OSw4IEBAIHN0YXRpYyB2b2lkIHN0YXJmaXZl
X2dwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZA0KPiBpbnQgZ3BpbywNCj4g
IAlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJnNmcC0+bG9jaywgZmxhZ3MpOw0KPiAgCXdyaXRlbF9y
ZWxheGVkKHZhbHVlLCBkb3V0KTsNCj4gIAlyYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2Zw
LT5sb2NrLCBmbGFncyk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMg
aW50IHN0YXJmaXZlX2dwaW9fc2V0X2NvbmZpZyhzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWdu
ZWQgaW50IGdwaW8sDQo+IEBAIC0xMzAwLDcgKzEzMDIsNyBAQCBzdGF0aWMgaW50IHN0YXJmaXZl
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJc2ZwLT5nYy5kaXJl
Y3Rpb25faW5wdXQgPSBzdGFyZml2ZV9ncGlvX2RpcmVjdGlvbl9pbnB1dDsNCj4gIAlzZnAtPmdj
LmRpcmVjdGlvbl9vdXRwdXQgPSBzdGFyZml2ZV9ncGlvX2RpcmVjdGlvbl9vdXRwdXQ7DQo+ICAJ
c2ZwLT5nYy5nZXQgPSBzdGFyZml2ZV9ncGlvX2dldDsNCj4gLQlzZnAtPmdjLnNldCA9IHN0YXJm
aXZlX2dwaW9fc2V0Ow0KPiArCXNmcC0+Z2Muc2V0X3J2ID0gc3RhcmZpdmVfZ3Bpb19zZXQ7DQo+
ICAJc2ZwLT5nYy5zZXRfY29uZmlnID0gc3RhcmZpdmVfZ3Bpb19zZXRfY29uZmlnOw0KPiAgCXNm
cC0+Z2MuYWRkX3Bpbl9yYW5nZXMgPSBzdGFyZml2ZV9ncGlvX2FkZF9waW5fcmFuZ2VzOw0KPiAg
CXNmcC0+Z2MuYmFzZSA9IC0xOw0KPiANCj4gLS0NCj4gMi40OC4xDQoNCg==


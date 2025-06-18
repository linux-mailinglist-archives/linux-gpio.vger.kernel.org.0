Return-Path: <linux-gpio+bounces-21718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E8ADE1BA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 05:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC387189B51B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 03:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141FC1DA61B;
	Wed, 18 Jun 2025 03:40:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2136.outbound.protection.partner.outlook.cn [139.219.146.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDC92F5313;
	Wed, 18 Jun 2025 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218024; cv=fail; b=PXT2D4/PACAaOLH1DyJGF8YuNCIaLXyxooZO/SsS0ozgm1H8EpLTQ0Brbr8ECGWIaY1U8rkAfy0L/4b5MBXboHQ3T2lusO0gI+20yhYvo3g63Ckih06bcxXcQs+RpilrpI8oX+RgneGLZwNtCPTzdlNHerRrnL1OG0wfVaL6EwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218024; c=relaxed/simple;
	bh=rjN9u6vVcO/ok0ZxZiHlExgQ2IwSIUlZr+59Hv7Yhpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DyUKhHlsKfChk+t1rtQAqsxZuEezJgVoO68qS572peN2RhLvfPp52m5KO12aZZWVk3NWPybxLFyn8IU7rRHQBD1bfOhcrD5l3chkERvHS1HXh7dy2yH/f3Na9dTbONxnF44O4S+WBoW87iYgMCr5jkm2bOgm81zlF2RZq3fWz1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I142ze/W/k3CD3H4mlIr1DJIHZZYEYdGtCoUSbx9lWUsjv4Me39O/22jF72EpUAOG6H/42O7/w8xbewGnJWqX7umGuWNYawh/HtqUhQarHYVVs5JUuUfRr55r9r0Ug+N+HVRg3SDBcATS/gkZGMYj0rwscjkpMkARMnpaBitOQsmifS38cKyHLL+tBrRJ4qPyc7bgqbjuQF4+Wuu31W3wquW3MYo4QaBGALegNHmpvMMhkl93abUzUrJNuEqjH8OJYJo/vY1mQ6pQv0bXkj+r1iQ1da9C8NKEBr+Qk4IIN95Z3+v4iqurEyergLyyYxOqjwNpdtZeUVX03f8tcjDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjN9u6vVcO/ok0ZxZiHlExgQ2IwSIUlZr+59Hv7Yhpg=;
 b=GsEtl32QLNxfjVUhUnBT4q3YfsP84EnHfk56UVI7LIUpVcWEwq3REocsNGwTWw5a5Q13gJbJNW4lJ1XrS/RJjWTHtG5orMvpeoK+KYKdaEJVtQatCAgLmF6wzddT5OApom3e+sO9XvYeYSH2VB6WxLM1lvosJwPQQLA7UEOUACCMoyAMXVS/ZBFa+3VmC2a0CJExLtCQuoh/vkLfnpqOCtbmxy2xREIrqNR8rrV2vmdm/57R4eOXtMN1BW/Pk5EaqmAEOP5RIKCYa567Uv6lb2lNPiu35zzFlIzyWpt7W6doHFG+gIGJCq/N1gLtyWUTJdjsPGKxcj0MU4YKo41j9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1305.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 03:24:28 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.8792.044; Wed, 18 Jun 2025
 03:24:28 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Emil Renner Berthing
	<kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, Linus
 Walleij <linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: RE: [PATCH 2/2] pinctrl: starfive: jh7110: use new GPIO line value
 setter callbacks
Thread-Topic: [PATCH 2/2] pinctrl: starfive: jh7110: use new GPIO line value
 setter callbacks
Thread-Index: AQHb25T3mz1zcBa6O0egwOXLRhTs2bQISSBw
Date: Wed, 18 Jun 2025 03:24:28 +0000
Message-ID:
 <ZQ2PR01MB13077459D994A40701B14725E6722@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References:
 <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-starfive-v1-2-8507b46516f5@linaro.org>
In-Reply-To:
 <20250612-gpiochip-set-rv-pinctrl-starfive-v1-2-8507b46516f5@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1305:EE_
x-ms-office365-filtering-correlation-id: 6b8941aa-80f1-4a50-d720-08ddae17a259
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 26sXRzlxmrAZUIpjGbmv6zoU/szHgS/Kczf21ReqtjMs9ELP6L1djxQSFb8cZ0dfUEeh2zkJgJZyWHmZW/hwlsWngtXU8gQbATphk/XBN7ilgb3kAVjY8GIAiuFCeRi3v6L0FQA0AAn2LJyKFlGb8PVPLxTgNLotvrUEe0/8d/9P3WRlm0Irv0lW4QrhcHniV12MQeh53EtPlkjxpyBkd25X81erDNbu5SIahBoyPYWhLCpaYM6YvBlFafTO+BjNoRYhu1IQO5+YfLFdZXJIqsIv/m6D1BN7kd/TpbjdA698szKgrpShutfX/PwbARMJVhTn5PcWhbDNA+dXSRUk7DAamJle8M5jCUNmV/lvmHwOMWOtnjS5FI/7V5a/UOwX9D1j3ivRuZq8OfUOSXb5bdbxt29gJLb3xLIbGnDrPn8rl1vL9eU6lzDotHvXOpT8po+SNc7A8GNYhU3n3mYEH8vS5VSwK6MuVmIMnOsB8WFA0m3el88dx+3SPjrQp7306kSACRSPxv81xeZp5k3dWtgEP+7QBG3YQJwEkZIAXua5us9AGrahUlDXCkZL034ntdJ9lyc7/HdxzuU/wP/r/g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dldSVzZjaFFXRHBaNURrbHdLc1V6Q1FlcTNaaUVXU0FMZ0NNL3RKSmIxSXAx?=
 =?utf-8?B?Q2hqemg3cy9STW0xL0JzNjJnVkR2d3ZTZkxkUyt3aTlFR1ZnYnZlYTFSOS9S?=
 =?utf-8?B?WEQ4LzVTQ3dxb1Y1OW8yeTltQitnMUJBTW43eHBSNG1jazA1MTFqRW96VVpS?=
 =?utf-8?B?QkViRGQ1Wk9nZkxzVVlFczhHcVdyWTBQSjhRZ00yUnlkREcyOXdLMlMxSWtL?=
 =?utf-8?B?VTRiYS9uTHQ2U1FPNXdXcjEvWGt6YUFRb0pzaUhqK2I5QTRCUXcrRm5nYzlQ?=
 =?utf-8?B?SlFXdTgzeGkvT2l0Ri9SbmJwcDRaRy9lZGtSWDc1V29QYWxNVHdoNml1Q1Uy?=
 =?utf-8?B?ZGlxVzRkMjdYUXF0T05PTmhPWnlzT3R1SzdJaHZiSEdKSUcwd3JHcjFONjRx?=
 =?utf-8?B?OFRnTGtDYURWdkdzdVdwWkdCOFpLVWVwdmsxVkJYamFWNHRySlFXUjNDSDFV?=
 =?utf-8?B?cFl2Q292bDdBUUQ1ZzJSZjdHZlJRMm02YlVDRlJ6TmprNDJDQmUwSkhaK3pV?=
 =?utf-8?B?bHlwNmFMbzR1ZTNkYXQ1K09EeDFMbXZkdW1xODJ6MG5LbURLYTZYMGJjOU8w?=
 =?utf-8?B?bDlwTk4xWFJra3dScWViSnhqUHI5Y2grdTQzR2xvVlp1TnFXQzU0OVhhd2d1?=
 =?utf-8?B?RTBsbkZSZG9QdkxpcVRZbEVLNjBKRFhieVFyOWRHK1N1azFSLzNPd0JHVGUy?=
 =?utf-8?B?dGJCbFhtRTdvYXVnYWNzam1qall2N0tGemNNU1llVmxGVjI1UkNVeVpvRFhh?=
 =?utf-8?B?SG4xc1J6YTFnMHlMTXNEN1lzcmFjdS9OWStVZVQ0V0pxRTltRVozbEthNjVW?=
 =?utf-8?B?MEJkNUE0UDN1WElMUzVkTWQ1dktOdFhNd3Q2VzB0WEFYcnBwMm1GMWh1ZGNt?=
 =?utf-8?B?eTV1Vk5BbGpsZ0hkWmFqVndaUWpTWFZCRXV1NDhhbk5SeGtTMTRqLzJqZHlh?=
 =?utf-8?B?T2kvYVNIa3d5ZFRNWkhUZE5LcWwyZVBUSGJaWWdISHh2YkJibVZiZ0wxNDF6?=
 =?utf-8?B?M1JqK0Zua0dsSXZCTUVwUVNXWHlIM3lhUmtYS0Rrd3pOcGh1aDVYbFBlcC9E?=
 =?utf-8?B?c3VUcE0yZm9lTk45REo4VWYrZXV1YkhUaDQreGU3c203UU1GUUJiZmFLbGUw?=
 =?utf-8?B?Q1hGMTRuWVQwTUdRU1loamFibmg4MjFOTXNPWnlyWmczNTRXZml6b04yZDR1?=
 =?utf-8?B?RkRrMWg1bVNpRXJvdEZtd1VoczkwU0Y0ckxMd0VkZnpqc1h3YmF1Zm0ybWEx?=
 =?utf-8?B?bVUyUU5Kaklic2VjV2laUktIUFJHb0s3QWZITVBJME01T01jamRnMFI5MHFw?=
 =?utf-8?B?WlZZZkpEbWZZTUpQQTFQdkZibVp5UEVXekN4U3RYbjVNZFUyWDdUemFqOWRN?=
 =?utf-8?B?K1BISDB1akptOHFDWXowY0tiQ044ZlFoakJjZmhMOStNeEcybjNQbXRjNVlX?=
 =?utf-8?B?N0JCajg1dkFxZ1BCaEdJOWNpTTZHQlg0UE95NHNIVkFTVGc3SWw5TExKYXdv?=
 =?utf-8?B?bVdvNkdIUVk5U1ZTTXluYUIzRU9hUUltYUVhL1FtQ3F4RHI0dklneDhUYkVm?=
 =?utf-8?B?RnZuMTBhUkV2dFI4aFQva09ZSXk1NERhNG5RVGJ2bmJIUWhWc2dUa1FnWGo4?=
 =?utf-8?B?M2VNRVJOdjY3Nm9zd1h0VFRsTVp5YmIrbmUzc2VhWXdBZHpaakE0TmcyNUpx?=
 =?utf-8?B?Vkt4MlV3dVFWYm44Nm1GNmJ5S0ZvaTJKcFFoTmVvUVVNMTFXZ1dUb2J2WUhv?=
 =?utf-8?B?QkhwRExJVWsxUFdpOHJacTVXYUxEQ3MvVEJvVFhEU2JxY0RJUjk0akcwVC9r?=
 =?utf-8?B?bFJjMUVFaVpSU2VOY1dTWVA2MDdoYmFFWGFieXFpaStVMDdqNDBBM2ZpcVoz?=
 =?utf-8?B?RFMrRk9KOFN1RkpQVU51WGcrUG1yMHdRL2ovMmJqNkdpR0s2Yk9pK0kvbmtT?=
 =?utf-8?B?NGFEU1c1Mjl3N2RtbXNMZWRWM1J1K0NXenM1blhPZWIyRVlDckFaOXhudHdQ?=
 =?utf-8?B?MDFrMXBKd2RRdjZUczU0NnMyZExYWCtjOTA1U04yVHpNUnhlQVJBcHgyWFNC?=
 =?utf-8?B?ZGxFVmVDa0t5SkN6TGNCbWtpelNWT0MzL1g4Mjk2N2ZsNlgzeWJCSW9mTVk2?=
 =?utf-8?Q?gWfIoIVWGqTSxKrMq9Y/tALZ6?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8941aa-80f1-4a50-d720-08ddae17a259
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 03:24:28.7563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UHpouvuCrZaiENOj4dmiDQBZQiKie4pr6FKGdQSQ1nqguwhxwJwgrvYH1nsG5h6hxb0XUrv4v6j7kyZifGmQLuasJqYJbcviaJ9f7b1xMUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1305

PiBPbiAxMS4wNi4yNSAxNDoxNCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gDQo+IHN0
cnVjdCBncGlvX2NoaXAgbm93IGhhcyBjYWxsYmFja3MgZm9yIHNldHRpbmcgbGluZSB2YWx1ZXMg
dGhhdCByZXR1cm4gYW4gaW50ZWdlciwNCj4gYWxsb3dpbmcgdG8gaW5kaWNhdGUgZmFpbHVyZXMu
IENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2luZyB0aGVtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KDQpS
ZXZpZXdlZC1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+DQoNCj4gLS0t
DQo+ICBkcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvcGluY3RybC1zdGFyZml2ZS1qaDcxMTAuYyB8
IDcgKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvcGluY3Ry
bC1zdGFyZml2ZS1qaDcxMTAuYw0KPiBiL2RyaXZlcnMvcGluY3RybC9zdGFyZml2ZS9waW5jdHJs
LXN0YXJmaXZlLWpoNzExMC5jDQo+IGluZGV4DQo+IDFkMGQ2YzIyNGMxMDRlN2U5NzBkNWUzMWU1
MmIyZmUzYjE5ZTJjYWQuLjA4MmJiMWM2Y2VhOWIyOTI1N2IxDQo+IDk3ZjA2NWMxYTlkZWViYzk5
N2ZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvcGluY3RybC1zdGFy
Zml2ZS1qaDcxMTAuYw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvcGluY3RybC1z
dGFyZml2ZS1qaDcxMTAuYw0KPiBAQCAtNjA4LDggKzYwOCw3IEBAIHN0YXRpYyBpbnQgamg3MTEw
X2dwaW9fZ2V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLA0KPiB1bnNpZ25lZCBpbnQgZ3BpbykNCj4g
IAlyZXR1cm4gISEocmVhZGxfcmVsYXhlZChyZWcpICYgQklUKGdwaW8gJSAzMikpOyAgfQ0KPiAN
Cj4gLXN0YXRpYyB2b2lkIGpoNzExMF9ncGlvX3NldChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywNCj4g
LQkJCSAgICB1bnNpZ25lZCBpbnQgZ3BpbywgaW50IHZhbHVlKQ0KPiArc3RhdGljIGludCBqaDcx
MTBfZ3Bpb19zZXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBncGlvLCBpbnQN
Cj4gK3ZhbHVlKQ0KPiAgew0KPiAgCXN0cnVjdCBqaDcxMTBfcGluY3RybCAqc2ZwID0gY29udGFp
bmVyX29mKGdjLA0KPiAgCQkJc3RydWN0IGpoNzExMF9waW5jdHJsLCBnYyk7DQo+IEBAIC02MjUs
NiArNjI0LDggQEAgc3RhdGljIHZvaWQgamg3MTEwX2dwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAg
KmdjLA0KPiAgCWRvdXQgfD0gcmVhZGxfcmVsYXhlZChyZWdfZG91dCkgJiB+bWFzazsNCj4gIAl3
cml0ZWxfcmVsYXhlZChkb3V0LCByZWdfZG91dCk7DQo+ICAJcmF3X3NwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJnNmcC0+bG9jaywgZmxhZ3MpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICB9DQo+IA0K
PiAgc3RhdGljIGludCBqaDcxMTBfZ3Bpb19zZXRfY29uZmlnKHN0cnVjdCBncGlvX2NoaXAgKmdj
LCBAQCAtOTM0LDcgKzkzNSw3DQo+IEBAIGludCBqaDcxMTBfcGluY3RybF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXNmcC0+Z2MuZGlyZWN0aW9uX2lucHV0ID0gamg3
MTEwX2dwaW9fZGlyZWN0aW9uX2lucHV0Ow0KPiAgCXNmcC0+Z2MuZGlyZWN0aW9uX291dHB1dCA9
IGpoNzExMF9ncGlvX2RpcmVjdGlvbl9vdXRwdXQ7DQo+ICAJc2ZwLT5nYy5nZXQgPSBqaDcxMTBf
Z3Bpb19nZXQ7DQo+IC0Jc2ZwLT5nYy5zZXQgPSBqaDcxMTBfZ3Bpb19zZXQ7DQo+ICsJc2ZwLT5n
Yy5zZXRfcnYgPSBqaDcxMTBfZ3Bpb19zZXQ7DQo+ICAJc2ZwLT5nYy5zZXRfY29uZmlnID0gamg3
MTEwX2dwaW9fc2V0X2NvbmZpZzsNCj4gIAlzZnAtPmdjLmFkZF9waW5fcmFuZ2VzID0gamg3MTEw
X2dwaW9fYWRkX3Bpbl9yYW5nZXM7DQo+ICAJc2ZwLT5nYy5iYXNlID0gaW5mby0+Z2NfYmFzZTsN
Cj4gDQo+IC0tDQo+IDIuNDguMQ0KDQo=


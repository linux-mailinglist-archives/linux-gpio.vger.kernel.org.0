Return-Path: <linux-gpio+bounces-36513-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAZ8MoOUAWoefAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36513-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:34:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26250A284
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08859309FB21
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 08:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9021F3BAD80;
	Mon, 11 May 2026 08:12:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn [139.219.146.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACB43B7B6E;
	Mon, 11 May 2026 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487126; cv=fail; b=Y4c7wsOEogVN3LW1opoHmbS7A3Y5MHAJkO3w26FUyLH/w8wqtnZ6NPRIyfBHGjuiAU156TksIP+ibbYja2aHzEFJlurmeTRVe6fhMG8U7Ul08HKGiuPx9nwFy5ApiuZPJnvHFTMfMhNrA1lw1apQL790dH4gxkuANm8K4Zt2cIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487126; c=relaxed/simple;
	bh=qdYGsz36bsgm3wC2fJZFqvtlMW32waWcV57/wEdkwG8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bdxr/on6pEhaT9yPPCV1NOUnVvp1kBFSxPICh4uSh6Dkbp6bk8y7IXZ3rXhN2IEcp7bBnm1rLtSSizzFoQ7NFu4ACfu+mCr1vBOqLeeyuPSH6UaTDDUFWYkJhGXbt5Dm63e1f9v6jJ5IHeeEIomkP3xUMDsh6I3199gPTAdV90w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAjaDZ9obOrV77F9lgOKrmt4AUafarliTWq9TYYAVmjlvaWNjXrAv0LtXwvepX8WNlHZp/ktriFKqjR/SuTjuPmzYhwhRysiemy9ZRPbWh3TO5HUV84wRGOZjfN8bR/hYkvuKcy9SCRPap8b/8O5/vo0ONqm5YZN3Gq/IEVOIeHiMbxHDK3OFOf5uTQIqxXNp7HoH6hjpxpNvzeIF3Eh3q9Orcc1CoGqxU8wSrVtCx1Y5nQ6FmPX45u+TlpyRNb3eQQltYemFRDLxDCc+UeqwASYpW8d0mcovhT3FJ0q2RikuqYlhG6VSvO2ZbacAEefcMoJZRraTIrdS+9jqzUIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdYGsz36bsgm3wC2fJZFqvtlMW32waWcV57/wEdkwG8=;
 b=j99Xkx/v0YshRWGMQ6I/awr5XY/v0LcBGuyN0wut3oZebhguJqdKqc1oFljALFiOSlWMUOO5oLvaXbiURyknYGmd2MxYHzWq7HYcKvjklTceSFuBWJ0XmTqAZlM9YojsDQLHV5Lj8XAXmX56tYHfBK4C8xInI1+Nr6Tk3W3nyMFg5Nn5LN8iooNLAlQImIzsM8jZg2LAeNn5/8KKsasuCanRxUOZcGKUnV0SG2jSwLg7zSjimllVcU4W9PcTLz8PUw1/BWhrCG2AeEpkHaFIMUgNJpfJ5ESc9F+Jo5yRsMBi31OvxV/7ujKdQktVXWlOhMixA1pp7eMgy4NHkDzWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1155.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 08:11:43 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Mon, 11 May 2026 08:11:43 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 02/20] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v1 02/20] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHc09toUDrQndxBAkGH32IlCyxtgLX0TCQAgBRHvYA=
Date: Mon, 11 May 2026 08:11:42 +0000
Message-ID:
 <ZQ4PR01MB12025653AFBFB213A4744914F2382@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-3-changhuang.liang@starfivetech.com>
 <CAD++jL=Pxz-=cTPCuoL-j0fqJymrHN9BE5w-SCxq4_9S1KDtXw@mail.gmail.com>
In-Reply-To:
 <CAD++jL=Pxz-=cTPCuoL-j0fqJymrHN9BE5w-SCxq4_9S1KDtXw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1155:EE_
x-ms-office365-filtering-correlation-id: 9c4f3fa9-e059-456e-09a6-08deaf34efcf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 wOr+FW2QTQ2L/Un5wJ/V4sU9EoVze1TgLuxus/RXcljsG2707b4ypdg0oZjs2o7fkqn18CvO23DJNomJfXTJHHpelJPLnRRlzEnXZV+e16zZqUMpvufgLGbRsQPWIzOJP/evH7uVEkdwsqGWnSvWik41I9p/vYThWcyEqdr1Qk9jFvzCkMmeEjpcxn0+a6Wc2F1cfSIqeOWZS79S+7RPdQvT5KPqaCpYbqbWgbtkVBe19I7yUEFAvMFZ/vriD5YJ/CKppMVvAOg+RIvIELzm6Eoe72WDBCkxaQGf4hhYV1d2T7bXCi4ySVeQfSBOokaV8nIwGohnRF+HKXvJ45qm0RGQNWpNPOSEyfUbuCwD5BOaY4/WiSXj4gPEKU0i7+1TmQKt1Ikr23ffRkvgelEPZYNHYrZVw+eIAIw5jnxdztoWN6OrRchI8GUp0yO7epM4F+c+r66uw8UUm0Az6nJwb11zvTBOaklBflBjF9arQb9jNG2PEVQJjjWxdYKjQr+dXDBjQ8jGeQbxaodPNNoxC/m+SANhHuh7z+1zL9aDylUxtoyrKkZor4S/F4bW4Xqm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUE1MjlTUVc2SjFkWlVDWUF3TkprU0NFcWs5cnVmT3ZESFlIcjJreitvbWhL?=
 =?utf-8?B?Q0pGTFlqaUxpaDVnUzZDOGxZV0RLckJ2VWorQnNNSXFtZDZFa0NuZzd6MXVK?=
 =?utf-8?B?elNLMEdSR1EySHJYU3l2bUtGYkdNVVhGSkYxWExjRnNKbDdsUGlod3NsV1A0?=
 =?utf-8?B?UjhFdXVkeldzYXkwZFUvUzkyd1JEa3M5alk1YVdSVDRVenZkYmdBZXcwcTJ4?=
 =?utf-8?B?UjFwNWZWWHBVeXNnY1FlR1hBVWJiMnlOZG9xRkRsZkFQOWRDVUMzekM1RzBN?=
 =?utf-8?B?YThIVzBKcG1jMkozWEpYb0pkUzB4UG9uejdUZDFHSmFoUWhDakM1MkNpYUlS?=
 =?utf-8?B?d0llbXNwL2ovZFJTZWkySU41dXpvY3QzQjZQa0txUnhaWHZKdVVzK0ZaUVpY?=
 =?utf-8?B?Y2xwTlIyT1VDSlU0M3B0Nkx2SThEWFpJR3pOZ25QVENkVWpTU3dPV0JNeHE3?=
 =?utf-8?B?M2lBN2tMT0VwRFcyYnN6S3J5SnliQXF2REJUK0lCZkw2ZVkybUJ1eDF1MDN2?=
 =?utf-8?B?OG15cWZDUEZ6YWloZHI3dnNQaWhiMllQcnFhM2xvbGNQTkpzNW05ZFZ2N3FL?=
 =?utf-8?B?YUZCcEMzY1FTN05BTUZWYXFTTkVXUml2cEdNUkN0ZHhuMmlxTnFUdTE0VlUy?=
 =?utf-8?B?dmgzRUtjaWdKU1lGUVdnOUtNSXV2dEt2dFdFUERCbnlPM1IzbkVIcnZVZUNw?=
 =?utf-8?B?RVJYVUZjMW5NNEFZNzVZQnlVR0pPWE9Qb0dqaHJGWDBQSUgwMXJSS0JNeGtj?=
 =?utf-8?B?cW5vZUJqS0E2UTJrVXpyTWpEMjVrNHNtQ05ibi8xRng2TmxEdG4zdVQrZyts?=
 =?utf-8?B?ZERZODVRWEZtZ2xuYjV6VHhKNTM2MnZxekFjT1F0ZWEvbGthZU83bFI5U3Ar?=
 =?utf-8?B?ekNEME8vQ2VKdmhJeUdPZ0E4SjJkUWZMS1ZzdVBxdW1sRnRQclAvRjc2MWx6?=
 =?utf-8?B?b1kvcHgyOHd2N2ovUGtuSm5oWGlDdll0a0JqeFZPVmI3c2JZZktqWm1ZanJj?=
 =?utf-8?B?NlFJSjJjbEQvbVQwL1Jib251eVBnWnZ4UDZnVmxrQWFqRXZBTjBJTFZhSkV3?=
 =?utf-8?B?Q2dDdndNYW9rS2gwdGRRYktLdWUvdDQvS1dxbzR2NFcvaEorRWxvQkdzaEtZ?=
 =?utf-8?B?cTd6OUNSZmptSkZ3TlZDWmtDbzh3SVVYWHgrcmxYZ0xmeWZoMDBmNXVaTWVa?=
 =?utf-8?B?NFdxUURUYU00MlJoelBxak9wNHRoTW5EMFJwZFhVcEFaRXZTNDNDblFZMnBu?=
 =?utf-8?B?SHBpSUhRRjUxVEprR1hoenE3ODRCMFpMQlRVQmNpek4rNkd2N0lCVjJhNGwv?=
 =?utf-8?B?aVRMTGlUVXkyWUNTeGJJTU1XdkNNWi8yTUtYdmlFeEM3S240VFJMcHpaamw5?=
 =?utf-8?B?dE5qL21HR0ZYRndRS21TcXdYZWt5ZGxJTnhzM2JWaFlaVElGUWVWLzRXR2Jt?=
 =?utf-8?B?SFNTeUFPSEsxS3kyTE1VRnVBaXI2c3ZQTkF4RncxZmNvT3FpT2JaeWZTTlN2?=
 =?utf-8?B?WVBuaHIxdzd4UFFkSUJJck5EemJVSk9JTk9RekwzVll2U21qc3VwK1ZqalEx?=
 =?utf-8?B?dDcyZmhUeS8vZjU5WEJVbTZabm5qVDdFK3BDLzlISlc0UCtZMXEyZGJpTzVs?=
 =?utf-8?B?Sloyd0lQZ2ViazlZUEFjS1R1SWJGQ052bkhWbzNIYjFRRTBEQStFazB1MWkv?=
 =?utf-8?B?VmcvNkhnaUFRM0VCRFk1QkNESWFhRldPVXNkK00yRmMybVg3MnVKUkMrZzFn?=
 =?utf-8?B?eXVNUjdQWWNldk4vMlZnb29WdlFuaWJpUlA3cHdUOWhMWnlIek1PYWR6NGNM?=
 =?utf-8?B?S2VrR3hncUxFVVNhUG1JSW1YRklvTUpocG0yU2hVMWxDallNSzROMHE5dThD?=
 =?utf-8?B?NDJqRkNhOGRBVFZ1ZnZUdjlEUVlaVk1nbzdXS3JTUEpaN0lHTlVmZk1WdUJJ?=
 =?utf-8?B?dEJsUzcwbkV2STFkVGxSbFFCamltWVpOMjQrTDVCYmFyc0d5eHlsODdLa2pQ?=
 =?utf-8?B?SVU5cTRsWHF4Z21UTWhaZTAxdEE2Z21YeFZUK2FjVGNoUE9kQVg4bmg1SXNJ?=
 =?utf-8?B?S0RET1pkZW9ET2hiOHlMMVNaUWE2OU1CRkxDZlhPRXpMSjdJd1pmMDBmVHZp?=
 =?utf-8?B?K0xEMGFxTm5QS0w0YjRUeGx6TXBTcDlXa0ViQ1c5ZEJ5ZTlJRi91NjFJMVpp?=
 =?utf-8?B?VWtOWnQvUlI2aEtmc2VLT095Z1Fzc2hPcld0Y3E0d3FIcEFRZW41ci9ldEJ3?=
 =?utf-8?B?R2xaVVhQRm1nYllUVURiOEEyWjRZYkRpYXFqVGF2UWVFV2FXaHh2SkVhaFV4?=
 =?utf-8?B?NENwWXAreWxXOHRqN08wcDhXN0E1L21VM2hOdnlRa0dpeEhhcmQrbGEvK2Fx?=
 =?utf-8?Q?cA9heYZqX9fPY8Oc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4f3fa9-e059-456e-09a6-08deaf34efcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 08:11:42.9422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ao7SrA4/u0EUnCDdZ9/PiuMmmi1u64PmT7aLVohcmOx4HIV2RnzcOQSfXFJ1iopg91C+v4niWNUXD/NR2vpvA7dPGwwjFGxbzX0EJI6rEkSGe/Qnw9ocVQn4liE8tioV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1155
X-Rspamd-Queue-Id: 8C26250A284
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36513-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:email]
X-Rspamd-Action: no action

SGksIExpbnVzDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBIaSBDaGFuZ2h1YW5nLA0K
PiANCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gRnJpLCBBcHIgMjQsIDIwMjYg
YXQgMToxM+KAr1BNIENoYW5naHVhbmcgTGlhbmcNCj4gPGNoYW5naHVhbmcubGlhbmdAc3RhcmZp
dmV0ZWNoLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFkZCBwaW5jdHJsIGRyaXZlciBmb3IgU3RhckZp
dmUgSkhCMTAwIFNvQyBTeXN0ZW0tMChzeXMwKSBwaW5jdHJsDQo+ID4gY29udHJvbGxlci4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5mZW5nIE91eWFuZyA8bGlhbmZlbmcub3V5YW5nQHN0
YXJmaXZldGVjaC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hh
bmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiANCj4gKC4uLikNCj4gDQo+ID4gK2Nv
bmZpZyBQSU5DVFJMX1NUQVJGSVZFX0pIQjEwMA0KPiA+ICsgICAgICAgYm9vbA0KPiA+ICsgICAg
ICAgc2VsZWN0IEdFTkVSSUNfUElOQ09ORg0KPiA+ICsgICAgICAgc2VsZWN0IEdFTkVSSUNfUElO
Q1RSTF9HUk9VUFMNCj4gPiArICAgICAgIHNlbGVjdCBHRU5FUklDX1BJTk1VWF9GVU5DVElPTlMN
Cj4gDQo+IE5lYXQgdGhhdCB5b3UgdXNlIHRoZSBnZW5lcmljIHN0dWZmIQ0KPiANCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4NCj4gDQo+IERvIHlvdSByZWFsbHkgbmVl
ZCB0aGUgY29uc3VtZXIgaGVhZGVyPw0KDQpIZXJlIHlvdSBuZWVkIHRvIHJlZmVyZW5jZSB0aGVz
ZSB0d28gZnVuY3Rpb25zOg0KDQpwaW5jdHJsX2dwaW9fcmVxdWVzdCgpOw0KcGluY3RybF9ncGlv
X2ZyZWUoKTsNCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K


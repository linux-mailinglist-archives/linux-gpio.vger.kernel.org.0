Return-Path: <linux-gpio+bounces-13710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F59EB434
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 16:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8F971887110
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 15:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196F619F43B;
	Tue, 10 Dec 2024 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="zVRa7POO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0055.outbound.protection.office365.us [23.103.208.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4AB2594
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842906; cv=fail; b=Dmcz6y2vnCxAR8cbBOus4t2DLpkYHgVREM75HupVmK4LvuKXorMSBvI7Y7HV/GQXwowRDbG7TJZkpGiHTK7qcpRF2CNbbRX7TZhrC3AwK1u0W0d7UIjD4vPPtjxAFjsRCcF1/dscZQaVh+mi9CMuTHLQMrMmcvAe4Ns+4y6oxqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842906; c=relaxed/simple;
	bh=+8CfAdl8LD63UnaUZpE+msCR6ErKumxPyi+EF7bTagQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=F486WfQfEow4eISGe3En5J1hWaM0T0AfXGmXXBMFjAnQVFY3BPFc2ZKfXaH5p6OOkEQu1OvQukchB4XN1Rd7EOWLIUnNOOshGsBGr2OLoub422BKTV7kt8ypzIGyrK/NfQfaGiD+Xlve6ZQhTQZjuLEA2sFaUA5zOxBoQ0Gkp7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=zVRa7POO; arc=fail smtp.client-ip=23.103.208.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=danbzPovMA7jOVRqBOJ4SqCM2gCmvntINsdrwpliFNsnzzphx1AsQntIIYmI7Fe87oTD5lmSIi13lfjNjUO/8DAPpxKBXIXyuHtw0I0LRVdO4rONtUP48dDfzmRI+Nyy0vYaQct0ZQG2neHSZqGPwx7Kf7YSE4gcE18pllC69k2Ba+SMoDK6CTuAYKePJaKInn4Ge4SzI7cYa+UNvG+LFNfzua+UlJGInCmkUnxLr6zVYHwu49LfTxlxQw5/l5xvS36Lrc7sxP6HYkoaz2wqXIguB0amzqQahyCRreUNpYXGFHWDGHctOgGiTJub7sgoABRZnP9eYIC4dNo9GNTYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8CfAdl8LD63UnaUZpE+msCR6ErKumxPyi+EF7bTagQ=;
 b=YzjjuwjIsyyImkZ7PcPbk6Ty+wXDQH2G3cLI/84+dWIiZ1tOuj4z1r/tA2nfxYuLA+OY4Q5GhzLUN8oQvkDzjq4Ras29Og0F49n4VqclsLmP3K9WAHkM3V4lJkZSHcTOIYgZ+0npQZwnlM0Xpn6Q7NfCMJzcKN3GH8rc8yaHxFYL3RTs+s5orrZjImYAO1KE17Tz6KsAAzp3Q3kHeNkU4EQbJU30eeBhu7WFw6wbGjNE/FmXVGF/IH7/55FXajKqHCShCCR6tLvH58GujZA7XTI/0xHglNs6QDCUyKoBYVIKySiKgz8CuBcn7ymaE2TtL+Juqn34mAyUGr910CDm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8CfAdl8LD63UnaUZpE+msCR6ErKumxPyi+EF7bTagQ=;
 b=zVRa7POOQHIuUhFhYUwcdVEmdvYFjRfrs/YHHQQ4+WJKr/czQXsbVObC8jwgQyEBzKQXV7Hptl/fvcXA9nSmzePfsg8LrPxDCjH72tqPpS3G5/copNiZoSIHCwU/MTMmhKf2eFFF2ubja9YhzkQBNW1c0OJM3OOTvC9/xRwh0H6PteXFrHTR2qpwCjKW5BAgVUvx9ncuvfGRwiVB9TeVwr/ET9BZWwY0MnMRh8SXnjInMNsXBgNKDHywuB2s4GGsxlKYrUIoDeu0zVMIMXKmOYvBtQAs0U3lnG7fvGAJNOgR2kCcQuV0+v6S2qT7vNdFlrmvXVzHWPPkAYH9rfvHdw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1035.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.26; Tue, 10 Dec
 2024 14:26:57 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8182.026; Tue, 10 Dec 2024
 14:26:57 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Kent Gibson <warthog618@gmail.com>, Linus Walleij
	<linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod] bindings: python: provide fileno() for Chip and
 LineRequest
Thread-Topic: [PATCH libgpiod] bindings: python: provide fileno() for Chip and
 LineRequest
Thread-Index: AdtLDxlnny9QK8EGR1+zjEq275fA6g==
Date: Tue, 10 Dec 2024 14:26:56 +0000
Message-ID:
 <PH1P110MB160324C826F703A91F39BE7C9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1035:EE_
x-ms-office365-filtering-correlation-id: 15c154ab-87b5-4b9c-4a17-08dd1926b3ae
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0xYN0lXTFp3cmh5UTg2WnZXVWxWTEw1N01sRGVoM29ubEE1V0puUGt4S3d5?=
 =?utf-8?B?eUJxQzhGa2hiQUxRWkYzeTRJZTBJb084a3ZuczJkbk1GVHZ4RzFJRDBnLzdn?=
 =?utf-8?B?MjFBbzNFdE95Qis1VUZkejNzdWR5alVuYStRdHdZTk5qa0txQS9vVkRlWEVh?=
 =?utf-8?B?SGNYUEFxM2NqQ3dvYiszVEo1V3hsckVHRzRCVEN2aVVTWjd0NTZqS0hEVCs3?=
 =?utf-8?B?RTQ1eGxlc2dhQnJYdUt1b1FlMG5hTlZNbUNIOEFNczV0dTVOdzRncjFvYUlN?=
 =?utf-8?B?VWJ4K2Fjc1N5Y3Q3MXg1MEVLaWMvSVZ6VFJhdm5Xb05VS3NsTGZqaEZQbytr?=
 =?utf-8?B?T1FVdmEwY2xhaUQ3YXV2N0JoSVMyTUNOYWRiR1ZSaEIrdG1vYjlLVlY1Mmx1?=
 =?utf-8?B?N212WHNEWXlwaVZKY1ozUTh1RzRuWkNQWEcrY2NML0t6elFYdnZkNzlEazVB?=
 =?utf-8?B?RHFnWHU2ZE5lUkFuNzc0WkQwS2ZBc0tGRHFIK1JSWGdzeVRDcGh2NkQxRXFn?=
 =?utf-8?B?cEl3aTBWVU03U0tNQkFmV3NUcGtDVksxMjU5dVlXdmF2cGw4VmRPeUZKSXpo?=
 =?utf-8?B?T1laZmpMNVYvbkJ0VnoyOVNpSVBMckZqRzZHcEtpb2lxellLTVNoQTlzWThT?=
 =?utf-8?B?MDFmOFFRZ2ZUNXBKTit0RWJMOUM1WS9rOTFTbGcwajdFWm1HMmhEUEtGcm16?=
 =?utf-8?B?MEJZbUdFWjBpUkQvSXhuTkdJR3FTUkNvZmc0UloxbTV1UGpLb0JQRVFMNGZR?=
 =?utf-8?B?M3UxdGxwZXc4Yjc3YkYvZ1g1ZHdzZGhISUw1VW5KbEgxNDJBM01KWW9ZT0Q2?=
 =?utf-8?B?K3lsditOODBVRktrWGpnYXI4SmZSZUhOYmlQc0tBY1R2OGU5c1ltbVlIOGpp?=
 =?utf-8?B?UTBNNEVieUROaHpTcElPOU5pMGpheVp3WklaK1BBUWR1bndndWJ6SEo1czU0?=
 =?utf-8?B?d0k2QzVzcDJtd1E3SHRNekVQVzdWTFRFYkpxSTZnM1ZZYUgvNzRhdVpheW5G?=
 =?utf-8?B?WjcyYTdEbGVVM21qL2U2bVVxaFVZdUZPU0EwUElXc3ZZbU5HR0YxR3VUZWpi?=
 =?utf-8?B?ZFY5TFpqKzREZi9IOC9SMGhSL1kvUHkyeWhSZzJQbVFtNzJvQ2haT3NLNEx3?=
 =?utf-8?B?aDNmcWNyNGpSVzBZeFdkTTZrcTNZWEo3Z1VCc2lyTThrQzhWVHZuczkxV2VR?=
 =?utf-8?B?SzlVTDdMU1lLdm10YktJRE16V3lpYUFZQ2JGMEdSeVR4d3NRWWU4dHVaSThX?=
 =?utf-8?B?Ty84S2lKZXJZMzdhMHRabkFsZitKZkdia3lCOC9mekkyUS9UTjN6SXp5SGgx?=
 =?utf-8?B?eFVrUU43Y3lXL0ZIMWFwdDY5WnZTUHJ2Q1JJQnkvb3ZOVjRNY29mcUhxaTN6?=
 =?utf-8?B?M1ZJM1FpaWc4L21hcWd2UStyUUJGeThPTHhLVmFqN20yaXl1TG1kR2VmN3Q4?=
 =?utf-8?B?UFNHMUw2SWNxcE5jeVp3REhjaGZCWGczaVdvMVdVNXg5ZEZiNm9PdUlCQXlv?=
 =?utf-8?B?OGNpNU56KzVJcXYydC9xMXR3aTJxN0t4M09HcUdYT0dtQU50elFWYi9LRW5X?=
 =?utf-8?B?Rmg1dnBaUjR4c2MyR0RrbVZhTC80aGlsYVYwcUJCVGh5YlJWbDRPbmdPUFcx?=
 =?utf-8?B?Smx3SVh3SmZKSlpoMGxwTUZ1M1BVUzhmRXpTVVVidlpjUU95ZzE2NkMvb09X?=
 =?utf-8?B?enVKNkVQTll6MGlQem9TU3hueExwd2V6clJwbVVFQXNEdGtzdHZicG9FTkdE?=
 =?utf-8?B?MDIvRkwwUklTQXh5U0ZGYUp0b29ZZS9mRE1uUng5dUxsVDRDa3R2VmxCajc1?=
 =?utf-8?Q?5PbZDFZWhpyqAEAWWKXadTw9f2007ZAKEiB3w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjNuOHJiQ0N3WFArZGNOWmNpNGJDbmMrZUF3R2NiekhDbzVjWVNtV1AwRmYz?=
 =?utf-8?B?ZUZDY05iNUZvcndVcGp2WmZwcUxpTDBvWmRuc3dxRm5TOFJzWGI4YTRncUVU?=
 =?utf-8?B?ZTNtdEk1Skt6TDdiT3Q4Y0tpQWd2YmxYRm5DTHRrVjZxMnlnUlNkTFR0WWVW?=
 =?utf-8?B?VGdEa1Z0VEZyZE5NNVhuK1ptU283U1NoeTNCRmRYckRoZytOQ2hBeXhjT3Ay?=
 =?utf-8?B?LzMycExNTUtWZzVNYTFuampGN1RzSTZkNjlBTE9lKy9VbytLa1pNR0p3dytJ?=
 =?utf-8?B?cFhsVnduZHl2NzNiWmdLL0hCVmlTN0F2TVdhaE85NFFMOGJSdTZiY2RaMXBS?=
 =?utf-8?B?dlBWWTFQSzJHdHpwTzhDVUF5WE5pZzQralA3d1dWU21GQjNQbDNNMWlEUDFV?=
 =?utf-8?B?SEYzRnM4MjBpMzAyWERYdEd4elJwUWxTTzZpV1M2NGRhcE83RG8wbCtKcXpy?=
 =?utf-8?B?b0dEVkdFOVRhUlBteVRCN1BCN2tWOFFtWHl6aVFaSTNyWXY4TEF5alhzeVND?=
 =?utf-8?B?ZG9OT0p4N1FqUWQ2QWRFUlZaVndMUGNTbDNWcnVwZkFXWnF2bHRONUVrRTlw?=
 =?utf-8?B?WHhxTmlKZzRXTnZKdHZDZktnRmo4anNPZjZUV2plejhDS1E0MjBkTnV4QzI0?=
 =?utf-8?B?Nk04bFAvZVJXSGg3OHlTRUV1WTBZSVB2SlVMWGs0b1M4Z05OZ3plSjFjKzdx?=
 =?utf-8?B?d1RKUjZHbGJma1VHR1BjVnA5NEtjaGxXcHQ2OGtXNGZKZ2loVmwyTjhBeFR2?=
 =?utf-8?B?cFlZNFB6NkJkb2ZNRDBPNHI4NSsvc1RpeGVkSUs2Q3U2eGt1UXUwdStncXNQ?=
 =?utf-8?B?M1FhZmZVem5aMlNzdWE3NklKV3ByNng3ajh0QW9SSGphdTg2UFIzTWxyWmU5?=
 =?utf-8?B?MXVGNG1TVVRudEtBdkZ5cnJTN0hFQmtSdWJqSEVVUWFwZlJXRjhOZWQwZmhO?=
 =?utf-8?B?VmNwVWhTOVNZWWlUenJTUVdsbElJdWloeFFCUzdqTjFnUmh0aEE4WjF5WkUz?=
 =?utf-8?B?Qm4veUZBbFFMWTBMZ25RZGpKeXM0cWxsMDZENkh2WHdtbzVoNUZUMllVWkFN?=
 =?utf-8?B?NnBsMW9rRVZUVDNrM1dyc0xNaDBYcUVZeWFzOFJvVllHMTcwYVZjZGxiemhj?=
 =?utf-8?B?ZTBqM0Ria3BQYVRCbEdlWmw5SWpDM0JqOWpqWlIrL0k4L2ZRSzhqVnNiVmVt?=
 =?utf-8?B?REh3Yy9oZUNjaGNSM3RWSnpIMnpNcnk5enNyeCtacisxVXFiaHVuUWtLR1Zw?=
 =?utf-8?B?Mm1kQmp0RnVISWZCSEhHSyt3T3hUNGNtVldPNzhocTZKNTk1T09LTUU5UDhC?=
 =?utf-8?B?Y0gvV3A2QjMwb09iNEViSTB0ZmtTVHZ4MmsrSDBQV2lBRnlVQW1lQWdMNytj?=
 =?utf-8?B?Qzc2TzNReHA5RVBmeWZsTitQSWwrOUF4SmF2VHhoM2ErYjN6RE1RaGwxMTNB?=
 =?utf-8?B?ZTVUYkFUdWlaMDJSQXVuOEZtSnp6QTFnalBkbGtQb2lTNjNWMjZnZVYxUk43?=
 =?utf-8?B?Z0hubUVkUHNaaU5WN1ZsM280RkVNbDNPODdTTkl1YmUxZDZkejdnQldoY2JK?=
 =?utf-8?B?UXphQWhpaGExSm1lRHQ0VkE1eldGZHNLZ1BDQUlXRnZNRXlIaFdXdFcwbjRP?=
 =?utf-8?B?S2tmUFo1R2NCenM5VktTVjZEY3NDOVhENzBtK0JoTkNxSDh0VXUvR1JPWmho?=
 =?utf-8?B?R3VMUVFJSG1XQTdKS2dnT1EyZ0pvQzM2VTZQV2ovdlpVRDducEdnUUkxYk9I?=
 =?utf-8?B?bS8xOHBBMi9SbG5rZ0JjMHNXVnp6VVE0WTJsN2duRzgybXJHanhySzYyQ2kx?=
 =?utf-8?B?OSszdVRLUFVSaUZGWVV1WGQzTHVhYWxDdzNsUDdReER2dVhBdWpqYmZiZ1RV?=
 =?utf-8?B?bUdFYW52dFhDL3dSdVNVdElYK1JWOU4wQ3BWNW9pZHQwbEEyVGovbzVULzVU?=
 =?utf-8?B?S1FnOUtvanNQZHhZeVF5UEt4NmRLdzNLeFVaUVJ1OUthcjBabnUvd3VCZTZF?=
 =?utf-8?Q?GOS4QdRrw8/ikZeF+dJmiImql8ioTo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c154ab-87b5-4b9c-4a17-08dd1926b3ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 14:26:56.9924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1035

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gQWghIFRoaXMgaXMgd2h5IEkgZGlk
bid0IHNlZSBpdCwgSSBtaXNzZWQgdGhlIC0tc3RyaWN0IHN3aXRjaC4gVGhhbmtzLg0KPiANCj4g
T24gYW4gdW5yZWxhdGVkIG5vdGU6IG15cHkgLS1zdHJpY3QgaXMgZ2l2aW5nIG1lIHRoaXM6DQo+
IA0KPiBiaW5kaW5ncy9weXRob24vZ3Bpb2QvbGluZS5weToxOTogZXJyb3I6IE5vbi1vdmVybGFw
cGluZyBlcXVhbGl0eSBjaGVjayAobGVmdA0KPiBvcGVyYW5kIHR5cGU6ICJWYWx1ZSIsIHJpZ2h0
IG9wZXJhbmQgdHlwZTogImludCIpIFtjb21wYXJpc29uLW92ZXJsYXBdDQo+IA0KPiBmb3I6DQo+
IA0KPiAxOCAgICAgZGVmIF9fYm9vbF9fKHNlbGYpIC0+IGJvb2w6DQo+IDE5ICAgICAgICAgcmV0
dXJuIHNlbGYgPT0gc2VsZi5BQ1RJVkUNCj4gDQo+IEhvdyBkbyBJIGZpeCBpdD8NCg0KVGhpcyBp
cyBvZGQsIGJlY2F1c2UgSSBzcGVjaWZpY2FsbHkgaWdub3JlIHRoaXM6DQpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGlicy9saWJncGlvZC9saWJncGlvZC5naXQvdHJlZS9iaW5kaW5n
cy9weXRob24vcHlwcm9qZWN0LnRvbWwjbjU3DQoNCkhvdyBkbyB5b3UgaGF2ZSB0aGlzIHNldCB1
cD8NCg0KSSBydW4gbXlweSBjaGVja3MgZnJvbSBhIHZpcnR1YWwgZW52aXJvbm1lbnQgd2l0aGlu
IGJpbmRpbmdzL3B5dGhvbi8gYW5kIHRoaXMgaXMgbm90IGZhaWxpbmcgZm9yIG1lIHJpZ2h0IG5v
dzoNCg0KYGBgDQoodmVudikgdmZhemlvQHZmYXppbzQgfi9kZXZlbG9wbWVudC9saWJncGlvZC9i
aW5kaW5ncy9weXRob24gJCBteXB5IC0tc3RyaWN0DQp0ZXN0cy90ZXN0c19pbmZvX2V2ZW50LnB5
OjEzNTogZXJyb3I6IEZ1bmN0aW9uIGlzIG1pc3NpbmcgYSByZXR1cm4gdHlwZSBhbm5vdGF0aW9u
ICBbbm8tdW50eXBlZC1kZWZdDQp0ZXN0cy90ZXN0c19pbmZvX2V2ZW50LnB5OjEzNTogbm90ZTog
VXNlICItPiBOb25lIiBpZiBmdW5jdGlvbiBkb2VzIG5vdCByZXR1cm4gYSB2YWx1ZQ0KdGVzdHMv
dGVzdHNfZWRnZV9ldmVudC5weToyMjU6IGVycm9yOiBGdW5jdGlvbiBpcyBtaXNzaW5nIGEgcmV0
dXJuIHR5cGUgYW5ub3RhdGlvbiAgW25vLXVudHlwZWQtZGVmXQ0KdGVzdHMvdGVzdHNfZWRnZV9l
dmVudC5weToyMjU6IG5vdGU6IFVzZSAiLT4gTm9uZSIgaWYgZnVuY3Rpb24gZG9lcyBub3QgcmV0
dXJuIGEgdmFsdWUNCkZvdW5kIDIgZXJyb3JzIGluIDIgZmlsZXMgKGNoZWNrZWQgMzAgc291cmNl
IGZpbGVzKQ0KYGBgDQoNCkkgY2FuIGxvb2sgaW50byBvdGhlciB3YXlzIHRvIHRyeSB0byBzdXBw
cmVzcyB0aGlzIGlmIG5lY2Vzc2FyeSwgbGlrZSBieSBhZGRpbmcgYW4gZXhwbGljaXQgaWdub3Jl
IGluIHRoZSBmaWxlIGl0c2VsZi4NCg==


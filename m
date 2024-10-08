Return-Path: <linux-gpio+bounces-11038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D131994BA8
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 14:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0467B27A54
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 12:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B2C1DF272;
	Tue,  8 Oct 2024 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="XqDGeAUX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0053.outbound.protection.office365.us [23.103.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC57F1DDC24
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391476; cv=fail; b=P4TI/cqdbUUzz8iw6Szjd7pz/K9hiq+ge93P+rWNxL9vUmo74NHCgScJv5Z2kVoQqITbUDKtPRSKuceRfZxU5hfBGDxgLd8kjawXmZjTvyCamwClpkllhdD3NWXPSb2iybrbpu6UONs4HqCzNrzEvvJrES2Aibh7hn5TlR0g2hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391476; c=relaxed/simple;
	bh=tjzkb0fIVN4qJY9VvA508UuipJY8NgmISIdfF+HncAo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mezePevez0wAv8Z6lU8FjmL68ekLFoHkFk+ikBGOX2Q0CZ9Z5iG7NMx7ZE1lh4PGEj8rlRBwxoD/4V2hg25bH4EbyQ2o9qHbD083KIhqGC1Lo0YAQgAgK+y1DctypahLPhpzeRDFc/OqDMoFnPazyICR+HLrTCEBeUTQ7jjB20g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=XqDGeAUX; arc=fail smtp.client-ip=23.103.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=0Y9J4y+mObMdSWuA3efkiPnngU2um5PXi+2JRB1XMhBNKliXt9EMwT0SJTUBcQH/C4YO/ENiNbu07RZK3zEiHKAXCYI5BOWenLbEJN45a2JbAn326QHR4g76Dp0fk8+tS7mYsohvSDXO6l8hIIFlOWlyDaaio/2blAr9F0aTtZy5LMthe8j90UNudm7OLssQMDtYsm+EbsUgkW2yFxH1Cz0CvAX3KYWiSyIGBlQrN56lIXHZ6RqBBSW1LsZd1jm328+W5z3MSANaaykiJrntG6xxuDUHry0H2Ha79dku9AjngktSjiw52Hu8kAtj1rhQXEgyeFaWrESlaQwgEFPe3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjzkb0fIVN4qJY9VvA508UuipJY8NgmISIdfF+HncAo=;
 b=iHQxamfOz822Pg+06YWA78R4qP0RW/s2opSWhHejDv3u2osiTqlBGut5xEJbh26bZ1dXaJEd8S3pSAUcy4SSGog6poIC+VfQ6yERMWiFvE5WkBFQDm2y+tfLkqaFmpq/jo02YG2Q4COkqQpDHcvuwF8jcq40NJ5/GrFAt5xmoP4/DsjLFKEIdjFcnJ7lDqXiDP235ja9Sm1zJ/+3cRpYT3y/j5i4bvCUVBHSQhehDwfB+z8/n1QQv9Cev93GSLwe26FroqoSZKoPcji4WPvjDGVyjLAEBqXvQshyuGFSb7NIfgaqYgs76cU7f9rwE9hY+CvF7B4fXICVSYI6C7ZYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjzkb0fIVN4qJY9VvA508UuipJY8NgmISIdfF+HncAo=;
 b=XqDGeAUXKRLcm0Gr7P7deUlh9VxD1SGRhcULMRUsOH22AGmie4Yo8i4I3HwWSJCfAA6XeTE1LzKiIEdULobfw8GwquQvvBUUo1tOVRevj8sQEwnQi4tLleYt2S+Tmm0QICESavcE2W3L+PYUMu2wSvJg9n0wkYf6GrHIlQmg8RwSzAJNdPyMK8BbPMyJOOKnFU1ao27zZBn5/EUyZdbBXC5o5oiGI5c35hN7L5qqrt8owNoQbXGimrKBzLpjM8+9vGORjfYCilshiel2XQO3WyjrOhsqxkkxlulUVYBsod9Zuvne5tMaSj+UT4ouWGiY72Lehpxx683TIqOxotRPDw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1412.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:189::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.31; Tue, 8 Oct
 2024 12:43:39 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.7982.033; Tue, 8 Oct 2024
 12:43:39 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"vfazio@gmail.com" <vfazio@gmail.com>
Subject: RE: [External] - Re: [libgpiod][PATCH 02/22] bindings: python: make
 internal a private submodule
Thread-Index: AQHbEQ6/L/fwTE38lE+lj1jTDOLx5rJ8xw4AgAAWGkA=
Date: Tue, 8 Oct 2024 12:43:39 +0000
Message-ID:
 <PH1P110MB1603A323E4E285AE386146009F7EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1412:EE_
x-ms-office365-filtering-correlation-id: 8a820167-fd94-4b74-8774-08dce796d5aa
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WXBjck1aNi9BMHkvS0hqa1R5UnZXRTVQazlTUy81cGZRRDJRbnk0Lzc3RHR1?=
 =?utf-8?B?enV3bi82dEIyU3h3UWVvTFNvVXF1bU9lMlA2d0dKcmZoanJyZzBXZ2t6amRi?=
 =?utf-8?B?bnFncERBVVB6c3dGeE8zYno4Ym51QXIwQUNmQ2tOVG9COURuOW9abGVObFBT?=
 =?utf-8?B?WUdJclMvWGg4V3IwSi9LOEJLdTFnWmY4UWt3STJqV0tvOTVaaEhGeWZEUWxL?=
 =?utf-8?B?d3A3V0dOZ0VhSVdIN2ZLclBjNG93dnAyd25ZNEltL2pEaFVNaXlSYk9BQlNF?=
 =?utf-8?B?aGltVmp3eTRmd0lXSENaM1JpYXhKeXlpMExwc1preHM2MU5oZW1PNWpmdmpr?=
 =?utf-8?B?aWJlb3Nlb1BqRldYWkJudThRZEQ1SUtxaTMrYjhTUEtzbTIvejdkQUJOc2JN?=
 =?utf-8?B?Vm9PSzRYWGJIaU9vck00YXNFazlOa3VlYW5QWUhHMmVBUGFUdUszZWVYMExn?=
 =?utf-8?B?c0NraVE4RTZ3cHhTVGxjTm5TaXNWZFEvYTlpQXU4c2dlbFRQRFBwMXJWWGYy?=
 =?utf-8?B?R1ZYbnlpdkdlUVpGckVSVm1iSSs5ejZ2N2pOaTJXSy9JdkFDZXZpS0FZM3FC?=
 =?utf-8?B?L2hRa1lnR0JsanBwWU9SYjhoVjZXRWk3ZGxwMVFTMHA1T2szRlZKWkRHY2pR?=
 =?utf-8?B?b1pmZ3hlbHlnOVk2ZHdIMVFYUlBiZGpYazQxbFh1L1Z4Q2xLR2UyTmRhTzl4?=
 =?utf-8?B?M0FMY0pEeWtlVHo2S3ZKcXl1OEFhTlRTNFQ5MXplSkE0WmdZOHFoeGoxeDNG?=
 =?utf-8?B?eC9pVW93aXZWdGlCY29LYUdUS01lYXl3SGtnVjJib3lVTUJoQlNvMHhNaDVO?=
 =?utf-8?B?Y3lCTXdzSU05bXhGbjdvL0J1ZExVTlZPUG5WY1pXZUVGcTdXOTZhU2ZEZ2pX?=
 =?utf-8?B?MXMrdmVaY3E5ZFRTb0JxZGYyR1B3TzV0TEE5V2JhZ0FHVXVsUVJvN2pyVW1W?=
 =?utf-8?B?Tm5kS1dtbGx0QWd4eGpMbzFycmNMczBtZEt3WjJTT3hyMk9rYVdoa1JnSHg4?=
 =?utf-8?B?dGM2ZmYybDVDR1c2VUN3cnFyM0tLRFpsOFRyWkxaSW4yb0JnNmt6dnNoNWc4?=
 =?utf-8?B?cEEyM2c0SzJSd29pREpsMjhKU0NBbEhGbnVXdnp1WnJWeDhMVmw5engyaXMw?=
 =?utf-8?B?MGd3MVRUN1hMWUdXTUJPYjNTU0hQNkpSQzhwSFJtT1RXcFdZekhOdXVWM3ZQ?=
 =?utf-8?B?blovUWJOUnVvc0ZVVEYzYUxFR2JJSXFtNm8xdFpxbWprdFBhWnY0ckEvcDJ4?=
 =?utf-8?B?Y1NrY3NsS09rZE5oVnp6eDZnYkdKR3gvd0JEZVZEaEZ3NW9acTJsQktseERm?=
 =?utf-8?B?UjVuOTZNelNkRVRVdmhpWVRQdUNsbUV3UnQ0cTNxNHI0NHF6Mnk5N0tBNkpq?=
 =?utf-8?B?MHd0VGdvVkE3NzZNS3pqR3l1R2kvWkVTM1dlQWtKd1lUamVJdnQ1dENieGFy?=
 =?utf-8?B?aTMrRW1OWDUycEdwK2diQlpIOVVKbzhEalNIZndJREd1L1lITUk0QnZFZzZv?=
 =?utf-8?B?ZEtscmcxMERhRVRENnlnVjlwcy96SWxFMnpwNklXWmFTSk1SVVZ6UGRrYS9K?=
 =?utf-8?B?SHI1YXhhdzRGdVZFYjJrcTFuZjJpbUc1ZnFZSitVeEpZNWlzemovbEIyQTJL?=
 =?utf-8?B?QWhEeWwxL2U2emF1Ym80aHA1T0hWSThQWDJPR3hzbWlPNHlad1hFZUhIampX?=
 =?utf-8?B?cllkNGlnaUh6d2FqOTNsZTFFVCsyQUpNVFhEZnl2MlBmOTM0c1l0QkI4cmlm?=
 =?utf-8?B?d2M4S2FJTTk5VDdlWFVndGVzbTIrYWY3RzBGcDA3MGJPVkw1amxiYlJpdEVv?=
 =?utf-8?B?eEFkUVpvM3dWbUZpV1FVZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmVxQUFKTVJORjJtaEt6bEo4cFQwZ1RodXRuVi8xc0VtaStIYUpKMjVqOVM3?=
 =?utf-8?B?cHNPQmhFQkZ5OTRSUFl6bm5mTmM0dVd4cU91RVJqa0ZjUUNoNng2WTR5UWhU?=
 =?utf-8?B?akx1SzdMcFhSRi9vNnlWU2J0aDJyUEhTNlFLNDFQQzIyWlluU0F0aVRVQThp?=
 =?utf-8?B?UmFydHNUeFYzNVBjdjdVQ2RjUk5LdmxrT1lNbCtTN0JqL0cxelp5YUlHSEp0?=
 =?utf-8?B?dHAvQTdNTFdldW5GTmhNWDZKV3VtdGlXNU1lWCtMVjAvejhjanlwQitaMUEz?=
 =?utf-8?B?K3RUWjUzTHlNZTFCTURjTUVqSHFzR0VTMldQRWRaUEtyd3JrZlZtY3B1QmZ4?=
 =?utf-8?B?WXV5YTdaVmh4UHFQTTdUQjB0S2tEc2JTUngzNEtWK2hISzI3TUN4ZTFlMlpV?=
 =?utf-8?B?UjV5cmlOOGpieFVQSHcyYStZUGNsY0lSNHZwZUhBa0pNTHJNT2tud3FMaGV5?=
 =?utf-8?B?dkNIQ1N3Tk1vSlJWb3BsdVFvb29SK3RRR0d0UVhwaFFBOWJNaTkvcUhCWlYx?=
 =?utf-8?B?SmtvV1c5M3pVTWVic0h0aklOY3NRQTNwUGd6ZFliUXRya3QweGZvbHVDTlVs?=
 =?utf-8?B?NFVvSGNLdUxlb0ZteERNNUs0TExCU0FFd0VXUUlhazlzQzhDekppUCsweUZV?=
 =?utf-8?B?Zm9GZVpYRGgxVVRnQVFROStrSmhVTy8rR3NJMnZjVVY4cENDRlpTcWpjUzZO?=
 =?utf-8?B?aXg3VE9sbjc2RHd3WUFhZUUweFBJV00vcE1hQUptdVJiaHYwSUdXVkMrR1Q1?=
 =?utf-8?B?ZUlUQ1FreXBLZkVZV0EzRDJQQnl4OHVEb2t6U045eEpTYkNPd3FFOUxuMk9I?=
 =?utf-8?B?VmtwTlg1Vk5CWVBQYWtrOWVHZnlTeS9lVlhwcHVpUU1FcktKckV2d1JaaHQ2?=
 =?utf-8?B?VnVJOXdZOUp2ZE80M1V5MmdGd1Q3ckpGNTZ5T2ErTCtVYUVjYjZJZjJxZG5U?=
 =?utf-8?B?UzhtdnhwZ1lEVHFBaGRrNDd5UEIyL3paY0ZaQVhpT2lwY25nQ3dVdHVudUZL?=
 =?utf-8?B?Um1pMTVkWWExRXNEWkhMQVNJM0tsV09hRmh3elBmS0R0L3I1aG9ha3NkZmpZ?=
 =?utf-8?B?WVVKZ0cxVnZhMGVLYmFPOW9FMlYyYlJUc2pxUHRlR25rWTJtNE9hUUFERWRu?=
 =?utf-8?B?clo0SFFOYXBja2tldTBLT05Ia1lTUm81QmlSSUxGYlEvQ0lYSmk3aFN6SVp1?=
 =?utf-8?B?ZU9aU3hxcHpJV3BJQWlYUFhUTkMvbFI3UFF1Z2EyQVB5MjBpaWhpbzJWbHVL?=
 =?utf-8?B?RXo1bmI2Mm9mM01CUVpkRUFBSVJyRDhxWTJuc3N5WUovOERXRkpwb0Zibisy?=
 =?utf-8?B?QVJEYm9BM2xUekpHUUNWT2JSVkFoOWc4dnNETGRGVXdmRWkxQjRzV2pPNDhR?=
 =?utf-8?B?a254RjRZbENBdkRXdS8yd2MvOXBiSXliak82Q0hJcmt5MmVlWmRnQVFMdXJT?=
 =?utf-8?B?UzdPZjNRbVRjOU81VlJ3Ums3UmZPcWJrTCtLWVA2Rmd1b29LUHFWZkJVRWhu?=
 =?utf-8?B?QUU1ZWRiM1lURFJQZmRERnQrcmZud0U3YUQveHJJTnRxa0hmL2ZRZ2VabVN1?=
 =?utf-8?B?RHZNUmdXOGpZQnYvc0ZXbWRVREFSc2J4TnljWXNaOVBEdW12SGdkMk1vY09w?=
 =?utf-8?B?QWdjN1daNTcvcml3Rk9NUUsrL3JiOU1RTXJaMUk1QzY2dUpPaFV5S0FoWXM0?=
 =?utf-8?B?Z002L2lsa1JCczRlMldDQk5GNjgvNkVGaTF5UnFkNUpmZzFLQmVDSTk5bW84?=
 =?utf-8?B?SXBjemowNUx5bmxpaWxYRm9lSiszSkhLdVpsV0hHS09udDRwZE9BUGMyU1Ix?=
 =?utf-8?B?L0N4SUNuQ1F4ZnVYVk0rWlNvL3RoV2p6R1NadFdIRDd4dlpBWUE2UmJPckJI?=
 =?utf-8?B?dk9rblIzZXdnb2lsTDNMWTdQUUE1QzZkcXNCc05QT1RvbGxVQlVMNTZOMDdM?=
 =?utf-8?B?YVF2K29xa2lqTERHcVYxWmwrM21ZanZYbERRZzl3QmhXc1lWUm0zQlMvNGdU?=
 =?utf-8?Q?sg8MSpv6rGPbaLJ08kctYXRc22VaOs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a820167-fd94-4b74-8774-08dce796d5aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 12:43:39.5421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1412

QmFydCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDgsIDIw
MjQgNjoyNCBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPg0KPiBD
YzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IHZmYXppb0BnbWFpbC5jb20NCj4gU3ViamVj
dDogW0V4dGVybmFsXSAtIFJlOiBbbGliZ3Bpb2RdW1BBVENIIDAyLzIyXSBiaW5kaW5nczogcHl0
aG9uOiBtYWtlDQo+IGludGVybmFsIGEgcHJpdmF0ZSBzdWJtb2R1bGUNCj4gDQo+IE9uIEZyaSwg
U2VwIDI3LCAyMDI0IGF0IDk6MDXigK9QTSBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5j
b20+IHdyb3RlOg0KPiA+DQo+ID4gVGhlIGludGVybmFsIHN1Ym1vZHVsZSBzaG91bGRuJ3QgYmUg
ZXhwb3NlZCBhcyBwYXJ0IG9mIHRoZSBwdWJsaWMNCj4gPiBpbnRlcmZhY2UsIHNvIG1hcmsgaXQg
cHJpdmF0ZSBmb2xsb3dpbmcgUEVQIDggY29udmVudGlvbiBbMF0uDQo+ID4NCj4gPiBBbHNvLCBh
ZGQgYSB0eXBlIGFubm90YXRpb24gdG8gYHNlY2AgZm9yIGl0cyBwb3NzaWJsZSB0eXBlcy4NCj4g
Pg0KPiA+IFswXTogaHR0cHM6Ly9wZXBzLnB5dGhvbi5vcmcvcGVwLTAwMDgvI3B1YmxpYy1hbmQt
aW50ZXJuYWwtaW50ZXJmYWNlcw0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgRmF6aW8gPHZm
YXppb0B4ZXMtaW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgYmluZGluZ3MvcHl0aG9uL2dwaW9kL3tp
bnRlcm5hbC5weSA9PiBfaW50ZXJuYWwucHl9IHwgMSArDQo+ID4gIGJpbmRpbmdzL3B5dGhvbi9n
cGlvZC9jaGlwLnB5ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gPiAgYmluZGluZ3Mv
cHl0aG9uL2dwaW9kL2xpbmVfcmVxdWVzdC5weSAgICAgICAgICAgICAgIHwgMiArLQ0KPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9iaW5kaW5ncy9weXRob24vZ3Bpb2QvaW50ZXJuYWwucHkNCj4gPiBiL2Jp
bmRpbmdzL3B5dGhvbi9ncGlvZC9faW50ZXJuYWwucHkNCj4gPiBzaW1pbGFyaXR5IGluZGV4IDk0
JQ0KPiA+IHJlbmFtZSBmcm9tIGJpbmRpbmdzL3B5dGhvbi9ncGlvZC9pbnRlcm5hbC5weSByZW5h
bWUgdG8NCj4gPiBiaW5kaW5ncy9weXRob24vZ3Bpb2QvX2ludGVybmFsLnB5DQo+ID4gaW5kZXgN
Cj4gPg0KPiBkMWU5NWU0YWRlMzE0NmY1OTY2NDNkNTIyMDdiMzY3ZTMzMmU2ZjdlLi5jOWI1ZDI4
NTAzODlkNTMxNGExMg0KPiBiZjZkMTUxNw0KPiA+IDc0YTk2NDY5YTA4NSAxMDA2NDQNCj4gPiAt
LS0gYS9iaW5kaW5ncy9weXRob24vZ3Bpb2QvaW50ZXJuYWwucHkNCj4gPiArKysgYi9iaW5kaW5n
cy9weXRob24vZ3Bpb2QvX2ludGVybmFsLnB5DQo+ID4gQEAgLTksNiArOSw3IEBAIF9fYWxsX18g
PSBbInBvbGxfZmQiXQ0KPiA+DQo+ID4NCj4gPiAgZGVmIHBvbGxfZmQoZmQ6IGludCwgdGltZW91
dDogT3B0aW9uYWxbVW5pb25bdGltZWRlbHRhLCBmbG9hdF1dID0gTm9uZSkgLT4NCj4gYm9vbDoN
Cj4gPiArICAgIHNlYzogVW5pb25bZmxvYXQsIE5vbmVdDQo+IA0KPiBUaGlzIGhhcyBub3RoaW5n
IHRvIGRvIHdpdGggbWFya2luZyBpbnRlcm5hbCBhcyBwcml2YXRlLiBDYW4gdGhpcyBiZSBhIHNl
cGFyYXRlDQo+IGNvbW1pdD8NCg0KQWJzb2x1dGVseS4gSSB3YXMgYmVpbmcgbGF6eSBzaW5jZSBJ
IGRpZG4ndCB0b3VjaCB0aGlzIGZpbGUgc3Vic2VxdWVudGx5IHNvDQp0aHJldyBpdCBpbnRvIHRo
aXMgY29tbWl0Lg0KDQo+IA0KPiBPdGhlcndpc2UsIGxvb2tzIGdvb2QuDQo+IA0KPiBCYXJ0DQo+
IA0KPiA+ICAgICAgaWYgaXNpbnN0YW5jZSh0aW1lb3V0LCB0aW1lZGVsdGEpOg0KPiA+ICAgICAg
ICAgIHNlYyA9IHRpbWVvdXQudG90YWxfc2Vjb25kcygpDQo+ID4gICAgICBlbHNlOg0KPiA+IGRp
ZmYgLS1naXQgYS9iaW5kaW5ncy9weXRob24vZ3Bpb2QvY2hpcC5weQ0KPiA+IGIvYmluZGluZ3Mv
cHl0aG9uL2dwaW9kL2NoaXAucHkgaW5kZXgNCj4gPg0KPiAyNTdhMzFlYmE4ZDE5NjM0ZmQxNGUz
YjFkMzNhMTM0NWEwMzYzOTQ2Li4xYTFiYmE0ZDZkZDllODQwYTYwMw0KPiA5NGYxYjc0OQ0KPiA+
IDAzZjZhZDE1YTBmNCAxMDA2NDQNCj4gPiAtLS0gYS9iaW5kaW5ncy9weXRob24vZ3Bpb2QvY2hp
cC5weQ0KPiA+ICsrKyBiL2JpbmRpbmdzL3B5dGhvbi9ncGlvZC9jaGlwLnB5DQo+ID4gQEAgLTcs
MTAgKzcsMTAgQEAgZnJvbSBlcnJubyBpbXBvcnQgRU5PRU5UICBmcm9tIHR5cGluZyBpbXBvcnQN
Cj4gPiBPcHRpb25hbCwgVW5pb24NCj4gPg0KPiA+ICBmcm9tIC4gaW1wb3J0IF9leHQNCj4gPiAr
ZnJvbSAuX2ludGVybmFsIGltcG9ydCBwb2xsX2ZkDQo+ID4gIGZyb20gLmNoaXBfaW5mbyBpbXBv
cnQgQ2hpcEluZm8NCj4gPiAgZnJvbSAuZXhjZXB0aW9uIGltcG9ydCBDaGlwQ2xvc2VkRXJyb3Ig
IGZyb20gLmluZm9fZXZlbnQgaW1wb3J0DQo+ID4gSW5mb0V2ZW50IC1mcm9tIC5pbnRlcm5hbCBp
bXBvcnQgcG9sbF9mZCAgZnJvbSAubGluZSBpbXBvcnQgVmFsdWUNCj4gPiBmcm9tIC5saW5lX2lu
Zm8gaW1wb3J0IExpbmVJbmZvICBmcm9tIC5saW5lX3JlcXVlc3QgaW1wb3J0IExpbmVSZXF1ZXN0
DQo+ID4gZGlmZiAtLWdpdCBhL2JpbmRpbmdzL3B5dGhvbi9ncGlvZC9saW5lX3JlcXVlc3QucHkN
Cj4gPiBiL2JpbmRpbmdzL3B5dGhvbi9ncGlvZC9saW5lX3JlcXVlc3QucHkNCj4gPiBpbmRleA0K
PiA+DQo+IGU0ODgzMDQ1MGRjYjViN2ZhNmM3OTgzYTBmZTA3NGNkOWJkMzJhYjcuLjE1NDE3NDg3
MmU0ODhmYTQ3OGIyN2YNCj4gNWU4M2Q2DQo+ID4gNWU2MDQwYWNhMzY3IDEwMDY0NA0KPiA+IC0t
LSBhL2JpbmRpbmdzL3B5dGhvbi9ncGlvZC9saW5lX3JlcXVlc3QucHkNCj4gPiArKysgYi9iaW5k
aW5ncy9weXRob24vZ3Bpb2QvbGluZV9yZXF1ZXN0LnB5DQo+ID4gQEAgLTYsOSArNiw5IEBAIGZy
b20gZGF0ZXRpbWUgaW1wb3J0IHRpbWVkZWx0YSAgZnJvbSB0eXBpbmcgaW1wb3J0DQo+ID4gT3B0
aW9uYWwsIFVuaW9uDQo+ID4NCj4gPiAgZnJvbSAuIGltcG9ydCBfZXh0DQo+ID4gK2Zyb20gLl9p
bnRlcm5hbCBpbXBvcnQgcG9sbF9mZA0KPiA+ICBmcm9tIC5lZGdlX2V2ZW50IGltcG9ydCBFZGdl
RXZlbnQNCj4gPiAgZnJvbSAuZXhjZXB0aW9uIGltcG9ydCBSZXF1ZXN0UmVsZWFzZWRFcnJvciAt
ZnJvbSAuaW50ZXJuYWwgaW1wb3J0DQo+ID4gcG9sbF9mZCAgZnJvbSAubGluZSBpbXBvcnQgVmFs
dWUgIGZyb20gLmxpbmVfc2V0dGluZ3MgaW1wb3J0DQo+ID4gTGluZVNldHRpbmdzLCBfbGluZV9z
ZXR0aW5nc190b19leHQNCj4gPg0KPiA+DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uIERvIG5vdCBjbGljaw0KPiBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
cmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlDQo+IGNvbnRlbnQgaXMgc2FmZS4NCg0K


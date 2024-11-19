Return-Path: <linux-gpio+bounces-13116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD59D2A29
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 16:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 274181F21437
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301321CDFC3;
	Tue, 19 Nov 2024 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Y0cFOMjj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0047.outbound.protection.office365.us [23.103.209.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513F3145348
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732031491; cv=fail; b=rSFiK+WSegLPM9FCbGTZOSVGvr5qcIfCfMam7JhWxskkDl/5J2aqH538zcRufmVS6UBEjxg52F0nxVtRGXoD2GMH5zcEWEMvtCmduVpy2oAAJUTUV7azr5qqzMWY5oBuY5CeBPW6IQovxaklkBFPtZq+VjPLkiKLMTNSGAy0ruM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732031491; c=relaxed/simple;
	bh=FATO16jdOkGbZHoTmltdSiUNd56gk8gRDRukS2zf4mQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NLxffWJj5+Mxe4C1e/aksTB/hK1utrInxQo4g8xhBXwQGU+VJgh2ouAfqeNweq+J8FbnRSg9+IeYYYHlUMcQ52hw41VcVV5vCzweTlYEjAtwKXvbRu5zCxx/HsmK5bCOM+KLw0X5LVHH5uau9n2CBlivG5lLAraKRC9Vcpt/ylc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Y0cFOMjj; arc=fail smtp.client-ip=23.103.209.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=joJ5Kmgchd8ipBymn+wP9fWXCWtdjEJISVEIyJpj2obeROcfcXAVwqHIArH9N60rrxJomYkpV7X9MRmD4rPXbcN5Q051n1BAZtwRps7gbW8fiPloC5jkSGNysIS8+rjTU/hBUg2+3NfJDp6mvbzWNieHQUh2YH8o++pq/7oKa16Sa7xnofCHisq0ZkNzEPCzSXcee/U5oezYr8VUZsKieKpMmTAF7aygzRR6OilntNIn4oDhVK6ljp6MauchVbbkAXEKUScWrEv5f3h0N2Qy3V7xlJrAb4Vcqx38FUHsGnEuybKRd+F8Aj9+QKWFnkXhIEvESzG1a7P/Q7UOhBGnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FATO16jdOkGbZHoTmltdSiUNd56gk8gRDRukS2zf4mQ=;
 b=1DWzvJLtTYE6miehv7BBWzx6h4cQG7HMQw9M4J0rpHx356tYWqgaDc6xqfhM5I4eyMJI7gJPd2OpwhoT0T+aVyLQx6PgXGlr85+EeAN75Z7RY6Cr2PMJDhKDcZzGL7CxnlYCRgkbvUICrIX7pTX+coKMv7cXv0LKtVrwJJoJX3WCeU/vFkp4jj4DwbgJcYinFtKN6QdGL8u50g51IeyH+Mn+QWS2wvDdUFI0kJQGCNhwkj4cX8uARuxGgIJE2BpazjM68oTJuTHJn1Lnizby1j5yb4iI8ZGHF6DY/esH61I+P41gE8YSQLCV7r9PGLug+PrMwqqYQtQB4uB+0KRwvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FATO16jdOkGbZHoTmltdSiUNd56gk8gRDRukS2zf4mQ=;
 b=Y0cFOMjjYkNcB81M1DuselrEhK+ybdD0PjcymrAOVmfNrB0HRFEuTROs9uUufiIYV3qIsMaQbQPAXpyX3q69oPlzZy64n/K37TILC3CNCgRBwFSn612CtE0Ea3hRdBGx9Rkm1SaFJD0kYceBZUCWdadJfPOv2n4C2vIV3dERuDVyOZKjS9wyMyvXB8Kh5+lBZfjA4YeeOhYaENgbRMHegsOM8as74zMJ6uVbeDlueM7GE5NuzdRYLiHsEk/jtv/IPiqGPjXDVkgwHhBewn4mjfaoB8fhg1AkroH062Fg3t9b8XT9PRx3pW9rqwZwuaGWsbjUOhGpkYz0YqiH7lCwjA==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1492.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 15:36:56 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 15:36:56 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson
	<warthog618@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: RE: [libgpiod][PATCH] bindings: python: tests: replace LooseVersion
 with packaging.version.Version
Thread-Topic: [libgpiod][PATCH] bindings: python: tests: replace LooseVersion
 with packaging.version.Version
Thread-Index: Ads6l9Y00wvieBrlTDux/PoQnF/TbQ==
Date: Tue, 19 Nov 2024 15:36:55 +0000
Message-ID:
 <PH1P110MB16035A9557F02035005EAF789F20A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1492:EE_
x-ms-office365-filtering-correlation-id: 2a9e15e3-579d-4a42-5fb9-08dd08afffc9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWhqUkJUdUpBUEE5K0lRM01tYUN1R1M0M0xHUkpZTEFHZW1aTWZnV2tibkYx?=
 =?utf-8?B?ejJEdVFnMlgwKzRrN2ZVLzRpMmJabHZjekJqMUJSM0ZHM3hYSkFucUFXOU5O?=
 =?utf-8?B?R3lrN044Y2JGblFtazBndkhtN2RJd0dEdXhkd2V6MHB1c1ZaRWV2Y2JmcTlZ?=
 =?utf-8?B?Z01lY2M2L0RDVEhTdTBUVWJVQktxcm9JdnZvMzQzc29CeXFENnlyKzVWQWIz?=
 =?utf-8?B?dVRUaytCaU5HZkxKWWpOc0JoSW04K2gvMVhaZEt4VzJROXRvZlZpTkcvcmxw?=
 =?utf-8?B?ZHZjMU1pdzU0a2xsU1BNWjNTdzl3Y2MzN2k1QkUyRVh3U2lmSVVwWTd1d3Zo?=
 =?utf-8?B?aHNwSm5oanZOR3BKSFlCaDhUdW8vekxDYVExTURpdG5oMktKNFhGOVQ5Ym1z?=
 =?utf-8?B?ck12YkRDY1paVm5uOWVRbUM3eGVsckVzVmltNXB5VVp6R0lFQVJFMEt3R2FP?=
 =?utf-8?B?UWpMUjFmSENDdlZnS3p6R0l3R3I0QXJKQUVyUXY1d0FyZEJrd3gwQzdnSFRO?=
 =?utf-8?B?ajRuSUx2dnBCQVNJb0FZNVBBTmZTZTZaeEhYb05wcktHOTkwZUtWZmMvMDhm?=
 =?utf-8?B?YU9Ha3JFVGtsYTdjWXh4RWxHdXYwT011OThsUkVseWtKbGs2TGF1Um9RYVU2?=
 =?utf-8?B?WVA5K0dCSlU1bUdjZ3RJMnpLQnRXZFNmUEYvQ1ZhQVF6Z2tUWm54U2RjQjJ6?=
 =?utf-8?B?V3AvdjRvczExL2VlWnJvOUZ1TDUvT1lrcFRET1diQmhjOGlqRUNwbEtFd0xl?=
 =?utf-8?B?SE9DU3IxS0UvTzk0cDVQODhybFp1TDE1OGFWWjc4WlZ2Vk9oL0V5TUFTRThE?=
 =?utf-8?B?UDkvSTlGb2o5cjM0Ujd5WTJtbmFNK3FzZndLb0JsZ3k1VysvUjN0QUdnVnBm?=
 =?utf-8?B?cG1TNjlrSy9ZeTE4ZW1JQnBVNEpzbmV0SldKeXJmYUROem8zM3VQMEZSdHVQ?=
 =?utf-8?B?OXdab3BSendrNnQ2aDE0WEFwVU9LZ1d4Z0xuQUdwTHExUjMwSHVrMHZCVjJt?=
 =?utf-8?B?Tkl0ajc0bnRMZ0JyQnBRMWgrY2lsOUFEMUJCaXBrei9oSE04OVlxTEd3cXJT?=
 =?utf-8?B?YUt1VmJIdUZyL0hSRGpiV0tDbHVwREJ3aklHalhEVmg4MU5CRGtMV3Fvbisv?=
 =?utf-8?B?ZHIrRE1aUmVMaWFpdFhQSW9LWGw1MC9XSUdmWjQ1MEoyS0tPQndSRzdmWnk5?=
 =?utf-8?B?SGw5cnpLcGtybURmVXJ5Qi8zZk1PREVCN2dydEpmUitjdy95b0lqTlRTVDVX?=
 =?utf-8?B?VVdFU21va0daME1wY3ZmczNTT2Y5aEtMQnlLZFNFajVTYjRIcWRuZCt3NVcx?=
 =?utf-8?B?NnpLellHR0p6TytLaG9DK0phMVQxWnNxeExncno0ODJrMVY4M2xVQlVjZ2dF?=
 =?utf-8?B?UnczYTdwaUdQNlo5UUZaZjZQdFBOaHVQNGtjVnkvSnRqSTBIYWdTNVNyNHZE?=
 =?utf-8?B?LzdPclhCdVZHbDlYYXJWbXNGMlRQY1lrNEpXV3pmNjVYc1hrRlhKeFJuMXFT?=
 =?utf-8?B?VDU3cXBXcG5GUHl2TWFpUzAzYXhKejUxcVBwL1d3TjRWUU50azhhVThHSUQv?=
 =?utf-8?B?UjgxMWo3VWVlUFc3enY4UFB3WDFucEpEV2Fmend6TTRLVjNtQS90YU9oeHEr?=
 =?utf-8?B?eVo1Ym9VaUNxcmpUYnBLRlFnbE5JVk5ielpWKzVDYkc4U0JtbXlQMG8zcE9G?=
 =?utf-8?B?aVBDRldFc0ZLYXIwQWNiMk9hOTRIdHYvV0tERkRIUnE1cmFkd0ZUR1o5WHBk?=
 =?utf-8?B?TGF4QWx2MC9QK1JaT2NiNUp4SGhmTUU1TGgzQXNIbHFYQnJ3UmVhZXNJQlBO?=
 =?utf-8?Q?K9L2MaLfLlY37RX92vJlHlA7enf9ZTiU7KAbY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkhwbG40SE03VjlsdmVXL2wvQ0E3emFicEZBakJWMDJ2U21oRTM2MlpjRFNm?=
 =?utf-8?B?ekxvOHo0OHVoY0pvUDM3TGcxM2VVMGlKcXVpTWpaRkFaUEhaVVdxT3J2UWR4?=
 =?utf-8?B?cDdadXJJQ2JIWkl1RFI2blJ6R0x0dCtMVHY3cEIwenpRQzhVVS9sdDZhOC9t?=
 =?utf-8?B?Sk8yQ0Vpc0MwSWMrZTJEWTl0ZnN6dmdibDNBWjF6MXYxUzR4dHJMK05HK21h?=
 =?utf-8?B?UUYvamVrS2MzYVhsclhYalZ0eXZBN2x1d3ZNZU53UUY1cmpkUVhtMXNZR1ZM?=
 =?utf-8?B?cU45bDQ2WXB3SzAzbVp1RWgyOEJ3TmlJYlk3TlFFa1UvWGR1TVA4YXowTWNp?=
 =?utf-8?B?SU9KWnRRYzg1ZkZZVlZyNEZtdTNrZFZWSzE5RksvWUQ0ODl1anhzTUtsajVa?=
 =?utf-8?B?SVM4bWF6TjNJckZKVitPdWVXMWR4UWd2dndOMjNrV0pycGNZVjBLYTdaSW43?=
 =?utf-8?B?anNwQ1YyRGVodGZsR3FlOC95Sm5sVkJSazRnbWUzVkY5cFB2dXVYREZYMnpB?=
 =?utf-8?B?dGJJR2lvdmlKL2JheDZmczIvSllwZ2R6YytESzJ1cjlLK2dEcHNNQkhkWTBw?=
 =?utf-8?B?a0hWMWFiRGFKTXY3djZmR1l0VXhuTjlsMnlIOFNyNCs5WlYxMzMyRVdzcDZD?=
 =?utf-8?B?Z2l1QnJXU3ZSOVJWLytpUVh4VHdsaE5rUmVZNlVNSVRadG5FQ1ByV3k2d0pC?=
 =?utf-8?B?cHNPM3FXcER0TlhsT2hzS2hwWHBXTnUvYjZZaERDWlBuVVpnOHN3SGhKOGNy?=
 =?utf-8?B?QU1WRUtEalc3SXRmc3dZRDdsemFYQ2twSlIxeWhraFJMWjhpZnlUVyt3VjRt?=
 =?utf-8?B?RGlpbE5FNmw4RGJ4d1lVMG8yejlzYm9VNy9aNkZKSWhRVHhTMVhjdkE0bFR0?=
 =?utf-8?B?M256TG41UmNOcjFNNkJ1SWZrT2hrNm0vQzRBNjR6ZThONVRvVzFEMXlldkhR?=
 =?utf-8?B?NGlWSVdBeGdUMU5tMUN3bmUya2N6TC8zcE1ocWVsMitUdnVVOHdpd2lqSXND?=
 =?utf-8?B?MVdGcXJQQ3JKWXVKY0pXTTBpUzJkazZ4VFpSWHp4WmUzYlZSOVJFbzFrOGVT?=
 =?utf-8?B?VVU3Mjl3UW9KOFZBa0VZNTdEN2RMODhPVmtBWE9ZczlvZ0tZL1B5UDdFRGlE?=
 =?utf-8?B?ejhkTnluOUIzTjhrYlhtV1NkTWRSem1TTWVkS1BJNVZ1ODlPWURDV3YxRm5B?=
 =?utf-8?B?ZzU2T3ZzcjVCZzRHUmN1dVhJa2gzSUtMODYxOWdyekh5NVJXbW84Q2pHZ25G?=
 =?utf-8?B?WDM1c0xzWFpueXhrK0lsaHBMMmhTYTZ0eVk5SXRxemEzaTFSWnJRS2lXWVUx?=
 =?utf-8?B?RE9DbWRPRCtrS3RBT1BSeG9NZ2Z6cjh4T0NpSXJLRGo3MElZdXRDa0RUMmE3?=
 =?utf-8?B?VDVZVTNXVHZFOEV5N3QvL1d3UWQ4UTMzMHE3YXY5VnVZZTNURFhyVkZBSU5p?=
 =?utf-8?B?dGNYREdrWmlGYkZHMXhOa3RxZTI5S0J3Rk5QK1hlUXJna0FMQXZFTTlNVG9k?=
 =?utf-8?B?a2FoVklsbnJmeFY3YysvbkRFRFl6WW5SU1paTWZQUnY1d1JwdE9DVkVlTDVE?=
 =?utf-8?B?L0VDazFiMGszQ2E2dm5LQ2NMTDZmemJSQlgvRlhCcU9OV0RuNTNCZDlUS2p6?=
 =?utf-8?B?ZGVDVmM5a1pLTVNDTFArSG15cm1uVzlLNmoxRDAybnJSY0owb3lFa2xPaHdz?=
 =?utf-8?B?KzhVb2huVFQ3OUpyTGJkaGFvNkFWQ0lZUVNKNXorTmhVZXo5amNtWFN1VDhr?=
 =?utf-8?B?ZDYrUldYaFJheEpCZFRGZlI2TWdLVWYvTkRrdGMxTFBPWk1LMS82aWlmb2VW?=
 =?utf-8?B?cEFsZkpsUDdaQTgyMXo1WjZobStnOVlubXR2WEdUR3UxWXlMOUpKTUxLK3FG?=
 =?utf-8?B?enFtdG5YUWp4bldHdXY0RG5PMVVVSXVrNU1QTk9Yb0hrUHp2ZmVxNXNpQVIz?=
 =?utf-8?B?M0NycG4zYmtMQlBKaExBOFVRL1JhWkxVdXJsbERVNGdFbmcwbTBPRW9tM2NU?=
 =?utf-8?Q?xRogW9MEGhKp1faNypsnrWM4yCo7tA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9e15e3-579d-4a42-5fb9-08dd08afffc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 15:36:55.9935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1492

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTksIDIwMjQg
OToyMCBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPg0KPiBDYzog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgS2VudCBHaWJzb24NCj4g
PHdhcnRob2c2MThAZ21haWwuY29tPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEJhcnRv
c3ogR29sYXN6ZXdza2kNCj4gPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCj4gU3Vi
amVjdDogW0V4dGVybmFsXSAtIFJlOiBbbGliZ3Bpb2RdW1BBVENIXSBiaW5kaW5nczogcHl0aG9u
OiB0ZXN0czogcmVwbGFjZQ0KPiBMb29zZVZlcnNpb24gd2l0aCBwYWNrYWdpbmcudmVyc2lvbi5W
ZXJzaW9uDQo+IA0KPiANCj4gV2UgZG8gaGF2ZSBpdCBhcyBhIHJlcXVpcmVtZW50IGluIHB5cHJv
amVjdC50b21sIHRob3VnaCwgc2hvdWxkbid0IHRoYXQgYmUNCj4gZW5vdWdoPw0KPiANCg0KVGhl
cmUgYXJlIHRpZXJzIG9mIGRlcGVuZGVuY2llcy4NCg0KVGhlIG9uZXMgY2FsbGVkIG91dCBpbiBw
eXByb2plY3QudG9tbCBjdXJyZW50bHkgb25seSBkb2N1bWVudCB0aGUgZGVwZW5kZW5jaWVzIG5l
Y2Vzc2FyeSB0byBidWlsZCB0aGUgcGFja2FnZS4NCg0KVGhlcmUgYXJlIGFsc28gcnVudGltZSBk
ZXBlbmRlbmNpZXMgZm9yIHRoZSBncGlvZCBiaW5kaW5ncyBpbiBnZW5lcmFsICh3aGljaCBJIGRv
IG5vdCBiZWxpZXZlIHRoZXJlIGFyZSBhbnkgZGVwZW5kZW5jaWVzIG9uIHRoaXJkIHBhcnR5IGxp
YnJhcmllcykgYW5kIHRoZW4gdGhlcmUgYXJlIHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGZvciBydW5u
aW5nIHRoZSB0ZXN0cyBmb3IgdGhlIGdwaW9kIGJpbmRpbmdzLiBCYXNlZCBvbiB0aGVzZSB0d28g
cGF0Y2hlcywgdGhlIHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGZvciB0aGUgdGVzdHMgd291bGQgaW5j
bHVkZSBwYWNrYWdpbmcgYW5kIHNldHVwdG9vbHM+NjAuMi4wLiANCg0KVGhlIHRlc3RzIGJ1aWxk
ZXIgZG9lcyBub3QgcHJlcGFyZSBhbiBlbnZpcm9ubWVudCB3aXRoIHRoZXNlIGRlcGVuZGVuY2ll
cywgaXQganVzdCBhc3N1bWVzIHRoZXkgYXJlIGF2YWlsYWJsZSBpbiB0aGUgYmFzZSBkaXN0cmli
dXRpb24uDQoNCkEgd2F5IHRvIHdvcmsgYXJvdW5kIHRoaXMgd291bGQgYmUgdG8gcHJlcCBhbiBl
bnZpcm9ubWVudCB3aXRoIHRoZSBkZXBlbmRlbmNpZXMgYW5kIGhhdmUgaXQgYWN0aXZhdGVkIGF0
IHRoZSB0aW1lIG9mIGNvbmZpZ3VyZSBvciBoYXZlIHRoZSBidWlsZF90ZXN0cy5weSB3cmFwcGVy
IHBvdGVudGlhbGx5IGNvbnN0cnVjdCBpdC4NCg0KSSdtIGp1c3QgdHJ5aW5nIHRvIHRha2UgaW50
byBjb25zaWRlcmF0aW9uIHRoYXQgdGhlcmUgbWF5IGJlIHBvdGVudGlhbCBjb250cmlidXRvcnMg
dGhhdCBhcmUgZG9pbmcgZGV2ZWxvcG1lbnQgb24gbWFqb3IgZGlzdHJpYnV0aW9ucyAobm90IFlv
Y3RvKSBhbmQgcnVuIGludG8gdGhlc2UgaXNzdWVzIHdoaWNoIG1heSBub3QgYmUgc3RyYWlnaHRm
b3J3YXJkLg0KDQpNYXliZSBmb3Igbm93IHdlIGNhbiBjYWxsIHRoaXMgb3V0IGluIHRoZSByZWFk
bWUgb3Igc29tZXRoaW5nPw0K


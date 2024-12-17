Return-Path: <linux-gpio+bounces-13934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381929F451E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2884C1887CE0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 07:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673E318DF62;
	Tue, 17 Dec 2024 07:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kBYnhhSe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C631E529;
	Tue, 17 Dec 2024 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734420565; cv=fail; b=AmyfZlS3oD8tJd/g5ao3UMUN6qcMaLUnCxAcIJBJTAkOZ/YvQo50xsjV0UKVHv4dcXLO6XhN1HQuYnNu1e72rRKaa7BeU390mTWCSJ4XeZ0VSrNxLz1MyyfhBlFOog2qn1gWSihs2bRH/tget0j0TVK71i5P9SMUQ+yjnkNvcZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734420565; c=relaxed/simple;
	bh=vAW75v/QIdJ+L4xXFdhcF5FrzVypSCi4FvY1iTS5eKQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ENtjyBwcXa2U8vgV49MpowYsTI9Wh6pTSqLjwiFuZKPpHiYEDBINDc76yHzJdIP12jdIVN6fKres9yc5BkNNsAa0/8u0P0+Jpop6MKpcbzOWRD5LZpnsOs4lKn0mhbvrblkEj9/oFCZm/qBTotTYNI0m31sYR6LdCxfilKxGzeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kBYnhhSe; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/tH8twmpnso4fMtd0wRidp4rdWvrOIXLiQUwFCaLGobW8SWg6mKeLKGEjWUpIqHlma9hQ+7iNMb9KE1yU96NmtrD2Xn9Rcozz7Zz1hzG0KiRJwtsjJKKb6+CJUuwaRjBZR/qzDXnaWlepXpT25r/zCNJG9DTmTLMbI3+b6mfvYmd3E54qQmnmkSCwgP2joaRyY3lzLuQRV2/lkiJ+r7xHBA3BP14F3yILJDkpdnJL3hzCkwaYLEyuhwMkT+LPL/+YZa0whETIpbZBGQGcBy+yI1JOVJnLYTUUDOVNfMeLDxoguulU404XHtuX7icECYc8v0JFbKQJjD4nhczlyT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAW75v/QIdJ+L4xXFdhcF5FrzVypSCi4FvY1iTS5eKQ=;
 b=UjZdbe7DIXibVi1Yc/l023P7cs+SqWiMFmjQepZH+IEO5+w0PsoUbORzU5FMK11AqmtivjJhUbbEO+h8rc4UZF2SyFvgQxNZBSyYHoFUcfOlvZT+O6AuGMYjkCac1tTayLFZhDthiDTpza0gt2RU0J2rJLLOXw5A8+ZbW7XEI/gcUTa6ZRH7MAbWtrAbuWKQqGi36SWzEK6bALMofF65Tm9aJ7cBKWjc93zUiWWaDyLtbcmWQJlUF7SLVRvG4hAS4B4t/piE+3II4ZNkCScLIwbJ8+xGww411zwBp2Neb7jRkP4eEQhHsjVic7h6ZmUzodGH5w8ti9fu2GcaRSj31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAW75v/QIdJ+L4xXFdhcF5FrzVypSCi4FvY1iTS5eKQ=;
 b=kBYnhhSen0Owd9Ndd8hUE6VBqnTMD3yLYmGHE5PPMRZqMKm+FeBAwRJSf4u75kbLBzJoOOyOcEnAJdF5QyPC+NGf4+Ef0FCbFcQzJjjI4CXoqj3AuL/Gj08lMpsWF8kMxsqbe0V/DRZTDsMCuxxiWrMaSQZ3mgtKlDmAareEli0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6032.jpnprd01.prod.outlook.com (2603:1096:400:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 07:29:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 07:29:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical
 port support for RZ/V2H
Thread-Topic: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Thread-Index: AQHbT/Q3WD6tdQXPjkGBdqOWiVuV17Lp+scAgAAL3NA=
Date: Tue, 17 Dec 2024 07:29:16 +0000
Message-ID:
 <TY3PR01MB11346902114D33FA66F4C3BF686042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
 <fq3q2tk3xfwd4p72b5wzo3gbfizrknxdt6zyc5ahm2cpnrtsbk@nlukbj3yy57c>
In-Reply-To: <fq3q2tk3xfwd4p72b5wzo3gbfizrknxdt6zyc5ahm2cpnrtsbk@nlukbj3yy57c>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6032:EE_
x-ms-office365-filtering-correlation-id: c0fe163f-5bc7-41e4-c191-08dd1e6c8345
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWhPeWpMcmZnS1FweTYyNmNFSENlNW1HMWYxdXdrZW8xb0kyNjRiamx6WFBm?=
 =?utf-8?B?U0E3NkxIVDNOQTFaMVZUK0Rxa3E1NjIwWFNTZVM1ZCtkRktYM0doNnd5TUxY?=
 =?utf-8?B?VC9VWllKQVNDeFQ4UWxPKzZPVzM2T2xKZHpnUDhFd0FIZ3B1ZE5WdnNRZWY4?=
 =?utf-8?B?RGNHUnA5ekNrcWcvdlRYbWJQeEdFc3hwSTlNcFhHZ21PTW9GZkNuekd3RGt3?=
 =?utf-8?B?RFBYSVZFSGl6cDJ3YTQ2VXM3ZEp4bm9YNVVhSm5EKzhVenJiQXNuRzVUbXJN?=
 =?utf-8?B?MTJUWVVVc3gyYS9LYytmcXN2eWU1cmJlSkRyVWlrbU9sWnBOdVdBV2ptbEhJ?=
 =?utf-8?B?TnpGQUtheVZmUW5FQVp5b014aVZFclp1WGUwTHNyenlaWjhSZEZ6SEdEcmZV?=
 =?utf-8?B?cGFpTU52U2htREFhQkkwd2VZanNjaTlOckZWM2h4QkxxZzhiaHhsN3ByNFd5?=
 =?utf-8?B?S2lyVzYwQlhqcnV0cUEwcGFzZHVvSTFpQXNjd01JV3pHclFCdWRaZ2tPWUE5?=
 =?utf-8?B?Wlp3Yk1PZ2FkaVM0VEJtWG5odVpVdGtPUGxuajBZcit5SE5COWx5MlR0L3Y2?=
 =?utf-8?B?N005WDBBSmtLbG5DMUNPRXcxYVJobEVtTmZ0TFNpcWlpdjZUdTJ6YklHeW5l?=
 =?utf-8?B?ZDdiVktqdkhoc251T0FuKzBPcU5QRHBENFVXU2Zqd2lITnl4MmU4czh1QWRv?=
 =?utf-8?B?czQzTk9tZkJhaHJxQ0d2VENNSUR1RGhrejZnUGpuSVlkTDAyU2h3RlZ2Qk1L?=
 =?utf-8?B?dW1ydHExV3IvTjRWMUlCR0owdWhNMmJkL3loeHJCQzlHRWRidEdBRlQ4K2Uz?=
 =?utf-8?B?aEF3Z3EyaHNFRXRGaUVYbWVxM1BtdjZUSjg3aUV4UmZoaGVQYkZmZitJVG1M?=
 =?utf-8?B?NThKeFJlcmJvOVNkZDBqZzdCUWl4aDB3V2pFdlV1clpXV2p5VGFTN1p6Tkhk?=
 =?utf-8?B?b01qcWh2SkZ0SldGWVBVbjRqZkFTV3NPSXd2YjdGZEJhRDFKMmxNdGljTXox?=
 =?utf-8?B?WFhKenlUcE0yeUF1WXZDaHhKWUxRSCtzbTMwOEkrQjhYOVZaUThqeWZMVUgv?=
 =?utf-8?B?L3FwSDFER1NlL1U3QndtSmRrcWIvMmRtb1VESllNbnF4MG1GWmtqQSt3TDR5?=
 =?utf-8?B?cU5kcjdwN29laWRSYW4xWWFjWmltdURyTnpxdHpYQUNTMHlVcXE0K2owTGo5?=
 =?utf-8?B?OFFIYTkxcmlxUk9uY2QwN2thNHIxbEpOa3BRUUw0Y1AyTlQzWi9jd1dEd01N?=
 =?utf-8?B?aUJOYUFQZEh6RXZrdXhiL2JXVUxMTFFBaGpnUSt6TW9sRDE5dWRQYmtOcUdt?=
 =?utf-8?B?QzJLeTFxMmpYWXFwTWNHUUw1Wm1SRFVVT0UzOE82cEdnVmpuaUhRUmM0cmZT?=
 =?utf-8?B?NHdzVVF1YW1FUXZIZUUydFR6Rk5HOWFxMGlEZjMyZlNYRExqd0c5MVJpdUNj?=
 =?utf-8?B?bFZXTDB4ZTgyUElZc2FzNWtjYUZiU0lhWkFBYVh6T2lldldIMDR0K0NKaWsz?=
 =?utf-8?B?em1KcS95WHliUkIzajY3UkR5cmJqY3hwd2dDcjg2dXlzRGpRNnFEd1RUSjFj?=
 =?utf-8?B?S280QnE2UmNFaDg2a1BGZzF6UVQ2WE9XR3ZHYXdKRGxDQS9xRDdWTE1oWkl1?=
 =?utf-8?B?R0p4bUUxSUFsSXFVbm9aeHZxdllBSVpyc3hwallrdSs3VzJqTEI5bTQ2c2R5?=
 =?utf-8?B?T21nMHpaNzM4T3FjanVCZDgzM3ZiRXhNNFBFcldVVm1kTFNKK2VrZmNoVktC?=
 =?utf-8?B?WHZyZTB4aHhFZGJTTkQ3RUJjcGdVb08yK3pyTEp5QUZ1L0FlYWtiaklTT1Nq?=
 =?utf-8?B?ZEdWRFNFTXVaZjJFVFNxZWlRZ2pEK2lxV0JYOWFGakFuWjQ5bUxvNm14cmNO?=
 =?utf-8?B?WTlSQkJFeUVpU1daZmlaVDVtZFIrOVlhTDJ0VGhOblcrQW1KWGJnWVMzd3Vl?=
 =?utf-8?Q?jbQxaGLFhJBN3Di/AR1pTK8hRlZQTbcf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGFOMjNCbEZEQVIwSm5ZUTRhYkNzTFVOQXpLdjhTR3N1aUJlRTNYQ2M3c2VG?=
 =?utf-8?B?Z1BJeGxSSmwyd21tQ28xMHJMYXptclhmcjRPblhQQ3NqVU9vU0FyZ2lPUUFH?=
 =?utf-8?B?WXQvcmN1RTl6YjhkbGRRcjBTQjVqamtwaGd6RkNzU0hwdGNGYmxCTFRTbEFu?=
 =?utf-8?B?VHlyNmNmbUM2a2s0V2lDVDB4TmpCOTVibStydmJ0K0JjYzgvVHFXamcwM1d1?=
 =?utf-8?B?bEo4MmVmVDRxTDlGSmhJcjhkdVoyRkRlNHdOSXlvaElaNE1GRlVVZXJ3WEZq?=
 =?utf-8?B?TjNtWms5TTVWRCtHY0g2aFJhYWpPTjNWL1V1OEh2UEY5MHUxMlpaMzB4cnRt?=
 =?utf-8?B?WWlkNTVabVRDOWdBNUZ2TnpHc3pjcDJIWTNVWGwvaGI3MHd2bFBVODNFTUUv?=
 =?utf-8?B?TTJwZnJLckkyR21jL2phZzFyWHlEOUlnVDhqeXdHRTZQck01dGhEMEl2YWdR?=
 =?utf-8?B?QURpZ0FRejlTU2x2QXc0bEdVNzBKdEY3RTdyQUNTNmRvbmkrUXlJYTF5RDJs?=
 =?utf-8?B?NXhMaFdmUjZsQk02VkxWSVdVS29wUkpiWDY1d0ZpZ2pVUkovUm43MUpHbVRP?=
 =?utf-8?B?WjR3cm1CR0RodFV0a1hRb3dTWTl6MHIyaHdGVUhKUXdYKy9uZkdHbmRNWnBU?=
 =?utf-8?B?anBFL0plSVFuMmh0OEd6WGVCL2lSVllvTnRXVnYyQkw2K3pkMGZ2d2w3TXA2?=
 =?utf-8?B?Um9YNVVFZlBVenhwMHJyUnZCZ3NzRHZ0WUJyQ3hMOVA1dTR2QlRSTlpsaVRV?=
 =?utf-8?B?MUFLMnIzZjFldnRocXNibGlGOTZ4QzMyajBYMmpOenFiRDJUTU5wek1nQ0lX?=
 =?utf-8?B?TCtIdGhaWS82VURIemR5cmxpTWVIdWdibkJkK3pPTGFPWjVqakZ1cUtFSWg1?=
 =?utf-8?B?TXhhOGtQSXFoNkc3Q0ZOVXFxb3VESHA3aWVuWHNsaTFDbjJyMGppdXNhSUlY?=
 =?utf-8?B?ckdROXJORTlJaStmVmNMWE01OVRveXNJSDB4clA0YURmTzBUNGVxMC9UV29j?=
 =?utf-8?B?ZTVsbzhoN2FacnhwYVJzYk9uTHpBbUwvWGVvUExRVTVlQVVDdkYvRkZmdGl3?=
 =?utf-8?B?ajFGeVJWcUdmRWpPZGlPa3FiN2RaZXM0Y0NyVlgwZ1JpSlFwSjhIVlA0T1Jx?=
 =?utf-8?B?aEMyaExwZU9jVlppVzZRSzZkWjRJTlRXa09meWFMQkZjRUFvRXczT1B1VjBr?=
 =?utf-8?B?ZGF6ekRhcDZVbUM4M2JvN0FXQkNVY1U5R0Y4MlZNeHN4MXhzOGh0Uk40Z2Va?=
 =?utf-8?B?aEJuVXRndFlxT0RpbUZQMVdrdElxRkJjQXZOQ24rYVh0ZlhPdDI1eGNaa0F5?=
 =?utf-8?B?R0VtMHQxL2JkRHdUc0kxWncwS3hWU3Rkbm0xVXZNeUxZNXd6WXRUbkZqTG5Y?=
 =?utf-8?B?NTR1c1BQam40dzFWZVRTRWZqTnNTQzFNdGlGcmVNZ2xqMWxJOWZZTjFuQW04?=
 =?utf-8?B?VXdSMk9oczMyRUl5RjJGYmhHZXFxRWhyTk50b0VTNVd4SkNjTmN0anhIQnRT?=
 =?utf-8?B?UGNjNUlnOEdqVTVMVUgzbnBLbE9xa1NLVVR4N1NPQTI2U3dNUVNFdS90QVdo?=
 =?utf-8?B?ZWhERUtNM0Nob2JQVDJjb0pMUVBBcXB6M3dzWlBnUUYwczd2cjA4aFExQmFP?=
 =?utf-8?B?c043WTJ3NFRzZXUxYzdvY1Q0YmUyODRFSm5DRXBnbHBHZFpFZ1VIRHN1eGEz?=
 =?utf-8?B?MlNQVzQ1ZWZwNTlIakt1cDRBRjlaOE9nZ0xNN3VVS3htU0wrLytGdmFHTWRw?=
 =?utf-8?B?aTVlMzBnNFFXUmdnVXQ2V1FKVXBkQU5UVkJMaWVMeE5sNnJJbk1KNWkwN1FE?=
 =?utf-8?B?UnRCM0NQMVJENWpjcVZUNTlidWhSNDhMMit3K3VUdVp5Z1F2eHlqR3hWcHor?=
 =?utf-8?B?eWxHWWZCbk45UitBTi9ab2RvUnMrV3NteExDcXNBNDRnWFp5Z2EyVkY2aVVh?=
 =?utf-8?B?TlBWYitRVkpiM0ppcXdEeWdWdVFJQTJPSEcvaHdOV3Rub0tUalRYdThqZDJs?=
 =?utf-8?B?a1Fvdys3SVNjaHIvZzhGYWlwb040dlNXaW5pK0ROME9kL2lPRENXQlBWbm9i?=
 =?utf-8?B?NUFwMzUzV2gyblZ0bUVxeS9XTkk4THkvUXFnczdEdkovVXk4Z2pWMEIybTRx?=
 =?utf-8?B?ZXlFdU5Nd3pVcTd6K1RFS0J0endPelhZdHhUT1dvNTdnbmRza0JKNGZIcE4z?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fe163f-5bc7-41e4-c191-08dd1e6c8345
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 07:29:16.4101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRuoknio58LOq6O19xNfVoQmbLmE7huBH1S1kfD3sDYoP7PQZ0vXu38+LzrB31oXUl/eXAbBmXkrSg7KrP7eL2hvsTyTOT1W/Qtd6dAQL/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6032

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAxNyBEZWNlbWJlciAyMDI0IDA2OjMyDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjQgMS83XSBkdC1iaW5kaW5nczogcGluY3RybDogcmVuZXNhczogQWRk
IGFscGhhLW51bWVyaWNhbCBwb3J0IHN1cHBvcnQgZm9yIFJaL1YySA0KPiANCj4gT24gTW9uLCBE
ZWMgMTYsIDIwMjQgYXQgMDc6NTM6MTFQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gUlov
VjJIIGhhcyBwb3J0cyBQMC1QOSBhbmQgUEEtUEIuIEFkZCBzdXBwb3J0IGZvciBkZWZpbmluZw0K
PiA+IGFscGhhLW51bWVyaWNhbCBwb3J0cyBpbiBEVCB1c2luZyBSWlYySF8qIG1hY3Jvcy4NCj4g
DQo+IFNvIHRoaXMgaXMgb25seSBmb3IgRFQ/IE5vdCByZWFsbHkgYSBiaW5kaW5nLiBCaW5kaW5n
IGJpbmRzIGRyaXZlciBpbXBsZW1lbnRhdGlvbiB3aXRoIERUUyBhbmQgeW91IGRvDQo+IG5vdCBo
YXZlIGhlcmUgZHJpdmVyLg0KDQpQbGVhc2Ugc2VlIHBhdGNoIFsxXSwgc2VlIGhvdyB0aGlzIGRl
ZmluaXRpb24gYmluZHMgZHJpdmVyIGltcGxlbWVudGF0aW9uIHdpdGggRFRTDQoNClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDEyMTYxOTUzMjUuMTY0MjEyLTQtYmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20vDQoNCj4gDQo+IENhbGxpbmcgaXQgYSBiaW5kaW5nIG1ha2VzIGl0
IGltbXV0YWJsZSBhbmQgZ2l2ZXMgdXMsIERUIG1haW50YWluZXJzLCBtb3JlIHdvcmssIHNvIHJl
YWxseSBubyBiZW5lZml0cw0KPiBhdCBhbGwuDQoNCj4gDQo+IEkgZ3Vlc3Mgb3RoZXIgRFQgbWFp
bnRhaW5lcnMgd2lsbCBhY2sgaXQsIEkgcHJlZmVyIHRvIHJlZHVjZSBudW1iZXIgb2YgaGVhZGVy
cy4NCg0KRFQgZGVzY3JpYmVzIGhhcmR3YXJlLiBUaGUgcG9ydCBuYW1lcyBhcmUgYWxwaGEgbnVt
ZXJpYyBvbiBoYXJkd2FyZSBtYW51YWwuDQoNCkZvciBleGFtcGxlLCBjb25zaWRlciB0aGUgY2Fz
ZSBvZiAgaGFyZHdhcmUgcGluIFBTMSBtZW50aW9uZWQgaW4gaGFyZHdhcmUgbWFudWFsLg0KDQpX
aXRoIGN1cnJlbnQgY2hhbmdlcywNCnBpbm11eCA9IDxSWkczRV9QT1JUX1BJTk1VWChTLCAxLCAw
KT47DQoNCldpdGggZXhpc3RpbmcgY29kZQ0KcGlubXV4ID0gPFJaRzNFX1BPUlRfUElOTVVYKDI4
LCAxLCAwKT47DQoNCldoYXQgZG8geW91IHByZWZlciBoZXJlPyAyOCBpcyBqdXN0IGEgbnVtYmVy
IGRlcml2ZWQgZnJvbSBoYXJkd2FyZSBpbmRpY2VzDQpPciBhY3R1YWwgcG9ydCBuYW1lIFBTMSBh
cyBtZW50aW9uZWQgaW4gaGFyZHdhcmUgbWFudWFsPw0KDQpDaGVlcnMsDQpCaWp1IA0KDQoNCg0K
DQoNCg0KDQo=


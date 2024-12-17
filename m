Return-Path: <linux-gpio+bounces-13955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8519F4812
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17571881322
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A919D1E0E18;
	Tue, 17 Dec 2024 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Nh/lukg9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BCB1DF990;
	Tue, 17 Dec 2024 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429180; cv=fail; b=Hj0xhmVSvs0GPmo+fAJfq1FqdAVeFvtmQ/dqHOo1IskZSyJ+PpRhR4ymuKykWysOueLArj8tNpIEQe5E28wxJr1NpCi+yp4p0ySKCZvkL7n69pRU0KSL2EC1qjzY96EHeAQSsLdIr9TYuAsh4PdfAY2gPEp+d0Y5Uzpf8tuJung=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429180; c=relaxed/simple;
	bh=Uf9td0p59WPUPhM5kM2j/n0w+AV86eSnz4l+TKNccTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L77T6zhs0ODiagEuD7+1Wi5hQEzSQDtgTRRI8HnVJ8Z5ze+hLY1tt7H/IcYyRSWgqiIFHeWgSPjo7W9/ddUB78ntqqds7gns5IWKws7XjZE0eZHFp0ZNnmEf55KHvpGCy4pdbMw6jNkAAw/mUkNf8LPlDs7Kl0RW+Ks8sHCoaSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Nh/lukg9; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqmzuUIcKPqKqjXupCpWKzn8l0VqEtN2X7YYo91GDXtShzfwRHKC9FUQrAh96cOk9e9ByLClnxU39qyP+RzsxAJKRUD2cip84oBvcO55tkRNgSI1KNM4JyPNTaysQItdt9m7FyDyGQMcQFRUPVXYD/8TFiIQaE6/1k74FdoYpRHJkXLT4dAud+0F6+r+6ZW2iQs3Pc0ph9HEtcQRI7NApxzV4IiEYIx/Twa1yb6rnKCdl2hn7HrCyJgOiijHSTC64Bkuwicd42jQC9TDbAWMlzpAIqc2SHnOm/YEB9Pb4W4J7lpMXk8ehpa30+vHh1DrjnMfyNjPjB0qg8DJSMfoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uf9td0p59WPUPhM5kM2j/n0w+AV86eSnz4l+TKNccTI=;
 b=G0G/888M2RcPqd3AFFMVC43bkRKUyk3rsDG9lMJDYyv6YIkY2v/4by0iIXtba48MZHG6nSCYyKWaD99VfL2ivl801FOQMtZh8J1NlCJ0xixjBmIqemOBvdTjcqTDwc/nx1xiutHDdYeOSoIlYyBPFvIcF8mEquOyfXbee8DyqYvWeWXeOfgY/rES30UPBaLT/hFnr1kyo4RsQut9PIYFu+oaYot2SSxLGivISGgENYBcCZ1ZKoJRSppRDIkDLp+PVjdxSdt+RSU8Yu2EoZprBomlBkC0a5owc3DjihC+8Bm3Augx+cHwMufnoxvujnhp3yohmw8ISrctkB/DlmuZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uf9td0p59WPUPhM5kM2j/n0w+AV86eSnz4l+TKNccTI=;
 b=Nh/lukg9lUetzbikKVjj+bFZ73Tvg1KTwor5Bj/iYwL0kRl9ymooEo6ZPLhk+wTEcTLlv+tXTuphGxTw72Nk2vUuEzElrQ3hVoLJBuh6DZmaIjvGWfNObCl61SFBzWaGC/qP2GFTCvLKGKu5KEmCfDCl6XHbC/fWjVvIN6MOXek=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB12043.jpnprd01.prod.outlook.com (2603:1096:400:3e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 09:52:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:52:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical
 port support for RZ/V2H
Thread-Topic: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Thread-Index:
 AQHbT/Q3WD6tdQXPjkGBdqOWiVuV17Lp+scAgAAL3NCAAAomAIAACu5wgAAIWICAAACiUIAADAUAgAABb1A=
Date: Tue, 17 Dec 2024 09:52:53 +0000
Message-ID:
 <TY3PR01MB11346B5F5DE42D324CF52D04B86042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
 <fq3q2tk3xfwd4p72b5wzo3gbfizrknxdt6zyc5ahm2cpnrtsbk@nlukbj3yy57c>
 <TY3PR01MB11346902114D33FA66F4C3BF686042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c57d3568-68f4-4e5a-874f-4d9f0cc1f2f3@kernel.org>
 <TY3PR01MB113469F4CE8DB86978C03E3D986042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <78b28da5-db3f-493e-8159-8bdd565728bb@kernel.org>
 <TY3PR01MB1134679D57AA7DDC185BCD3E286042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <3a66447f-005c-4c64-a8de-6a7a535abe90@kernel.org>
In-Reply-To: <3a66447f-005c-4c64-a8de-6a7a535abe90@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB12043:EE_
x-ms-office365-filtering-correlation-id: 1e6fded0-c75c-417a-391a-08dd1e8093b8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QWFob2J5czNFY2lCT2xCdzQ4MGJxbFdHRUg3cytoQ01wd3JlQnFwSXhreCtB?=
 =?utf-8?B?azNMTm91YnZnQ2l6NGoxV0JZWnhTaFBZTHVyRmh4ZHdQb3Nha0daZjBkK1NO?=
 =?utf-8?B?dHlFYkk3SUJrM0ova2JkQXNrVDZqRlp6THoxYlNuMHlHZ2o3c1d4RjJYcXBO?=
 =?utf-8?B?ZkdIZ2tzU1hKWXM2RXFoOWJUSU9aS2dVbDVOeGkrbENBVEhyaUlsM0wzUUdl?=
 =?utf-8?B?U040T3lMbXUyR0R6TVpRQS8vNlhWQTF5c2p1a1RXUnZnVU5yWjdCaWhVc0t1?=
 =?utf-8?B?bmR5MUQ0VVhqRGhKcnVSTy9MR0ZNc2EzT0hlcy9LdCtFZDhZZzFpVk9jNXE1?=
 =?utf-8?B?Ui9wN0RDSHd5dTI3QjlKWlZOY0J0MCtjYzI4OC9zYndNYTJ1aGVZZTRwcjF6?=
 =?utf-8?B?U3UycFhVZjJtNVVCY0V2d3VoWllYazN2SUlPaEQvWksySHFFYUd3a2JZSmNK?=
 =?utf-8?B?NmN4K3puOWFnWGU1YzY3aDdqWW1kSHNhZHJ5U3czbnoxVVkxOTl6U2xKQ2do?=
 =?utf-8?B?c1ZKV3NVM0NDaitIbEhMUlJ0UDIwb004cXRzYjJUaEUzM3A5Y0x6NzgxRTFj?=
 =?utf-8?B?bE1lQnlnQUpiWXhIMWs3dnJ1cXBlSmQvaVNYTXpiK0ZNWmNLQWw2Tjg0SkNX?=
 =?utf-8?B?Z0dPNUEra1V1WXJRbEtuaTl1R29UUW1BbW9RcndMckcyUWxKQS9xV2NEWHRV?=
 =?utf-8?B?TURoNkhhcDIvK1QvNG9remM5c2hJSkdoTTVlUzBpT3NZbG1GUzRmS0locDQv?=
 =?utf-8?B?NS9ZUXBFNnR2SEk2QTcwRVZ1UU0xMzA5NjNvOGlLQ1F2VDVQZkJGWi93Tjhl?=
 =?utf-8?B?MWszclRLdUZNa0RJSlQ5TUYra0N0Y09ST3o1R21pbVlIZmpFcVJqZXpYQkZP?=
 =?utf-8?B?ZlhzQnBvTnc1QnU4eUY2V0JuMkcwVUJic25rc1ZvZjVBakJRS21PUjd6VlBv?=
 =?utf-8?B?bXpHZDJXWW9ySWNrY0p4VjFUcjFhWXMybko2VDBxKzNWQ2k0clZDemIrVnRx?=
 =?utf-8?B?eWVXMEp0YjRhKzk1SmJTenFGUEhJdEVXVDdJUjB5S3NYWVdhQjc3T0VLalIw?=
 =?utf-8?B?K3JIVXhMc1N6VzhlRnBPQkNUclBpWjNjMjJSYm5DaGRJVHdGcHhvSURNaWU1?=
 =?utf-8?B?MzNWQ2tWVjNFUC9ReWVVcGNWbHd6M1RCUUk1L2RsMHRWSG83T0IrQmdjSEZS?=
 =?utf-8?B?K0c4Zk41REJ2dTBmMUNlTDlnN1VwTmZmVHA2YzJ5M1EwZll5S2I2ckJUYVg5?=
 =?utf-8?B?NkJLYjA0RzBOY2czN0pLL2NyS3F0bGhKOVl4eDdUakpVeURndnoyNk1EZHR2?=
 =?utf-8?B?RTRpd2FnRGE1am56Ymwzd0QyaWpwQmFGTUx0YTd3Qzh2a2gwZU5oVXdPTFRm?=
 =?utf-8?B?cTlaOGVHSW44THkreW42bEdqekxYVTVySXlyZEdPZ2lkdG1KUCt6UGVRcDVK?=
 =?utf-8?B?aUFxeThvVG1VMTkvelJhRFNQV3VqT0w1aGwyMTF2YkI1TGxNNVdUNWp4dk1M?=
 =?utf-8?B?aC9ITkdCQ3k1MDgwTi9kODRncnpkaWJGZmZyQUJ0blJBZ252WFRZeVlRWllB?=
 =?utf-8?B?TjE5QmV2bzdtNGR3SDIxRWtQMll2SU5WZHp0NXRkaEFwc3BVaWFCYlFBV3Bx?=
 =?utf-8?B?Rm41OVZEWUVnR2FXVDAveUhWVE5zbm50ZXJPdEJDR01DUzNGUFpsdWtnamV0?=
 =?utf-8?B?RklmaGNoU1hCb0RKUGdGcTVrV3o3T0wrdWNHcU0zaFd1amEyY1RYQjBqV2Iv?=
 =?utf-8?B?L2U3ZmpQc1hJZlVwRlhlQVRDNW0zTTRFK2F3eVpxb0I5elk0V3piemZHWlJZ?=
 =?utf-8?B?blRxUnJHd05VdzkwYmpzS1Q1ZDFxUWFLZHU1d09DRTc1MmFPbVBxTDMrdzhT?=
 =?utf-8?B?YlozRlpyMTZLRVBYQ3Y0OFhxQnFsQUJFNHdiSzNST3FOb2NKcTJPRDJ1eXU3?=
 =?utf-8?Q?ZgqSZF7qadoDWA2dpH+xpAFRLIRS57Ec?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0JHTlRRb2NpbXQxUVJpYVVuSWdTSm9yZ2NHckhxUkhCTGFUbWgxdFhvWlBB?=
 =?utf-8?B?eUM3Z04rd1E4U09na25WUUZkNnV1ZTc4VUlPNEhLTzBVQjVTNHRUYmdicVIz?=
 =?utf-8?B?OXdFcHczMk5vVXNMOWdyeEVrQktiWFI0dWxCazBmVVVCLy9RdytWMjcwbzFq?=
 =?utf-8?B?MzZxWkxHdVJHMmZvVXc1aXlWQWxaYVR5U05lOSt5bjE2a1I2S1VJdXdQY2dC?=
 =?utf-8?B?UDNSeGN3YXZjMG5iRDRGQk9zR21DUGJsUUNJVDR5YlUvUEY2eUsza1hXVndu?=
 =?utf-8?B?Z2NpUXF6ekVMVGxYNndTV0RkY3crZnE4QytpMDBwM2J3cHR1SWVwMDNTL1I4?=
 =?utf-8?B?Q0ZVNnZpZGZtOHFldHEydnU4YVpDRnI0WGo1NDc1MGkyeTFEQmZhc3A3SU93?=
 =?utf-8?B?S1IvN2RJcHhnMHN1dlM2MjhYa2I4eGU1Y1pwaHVtVmM4SHBBN3laUENmV3JI?=
 =?utf-8?B?cFdkVnhtOEY5SmIvdTgyRUJpSnhCVVZlakV5aENmNHdjOERaSjRUdlZmQ3lZ?=
 =?utf-8?B?cVlod1B2bGRscVNCUEovRUFHK21aY3ZBa3FlWm43dVptYnpLbzkrZ2VwUGVQ?=
 =?utf-8?B?d2ZjekpzQXpNSEJaZ0xtaUFXdjd4L2c3QXlUaXE4NC9zaGNyYjQrUk1UOC9D?=
 =?utf-8?B?MDVsQVc1alpURzhPNUJzQm8wbEZPWnpOem9XZ3ZRdlJCbTFDcEtsQWVEbi9X?=
 =?utf-8?B?VHZHall6a0s5aHpPTEdvR0dNYVBVTVoyNEhTbjBLbWdZY2hRSFQzMENhUjNJ?=
 =?utf-8?B?Z21OVy9sUmRqeFkxQW02dU5PQXY3T0FrYXJNTVpybStYVGdvQmFWTnZlTWZt?=
 =?utf-8?B?cVRVSUZOcDlhVmo2ak9YbzNiL2dZeEJWMUwzaTN2WXFZUmxRZHE3TW1hdUln?=
 =?utf-8?B?anpkM2VrRFlMM0tSQzNLem4rMWlxOFk3M1lJZkxFV0ZwZlhIdG05OWxjNm5t?=
 =?utf-8?B?Y0VTaEtlQ0E0a21LV0ZSM3hxVFhXNkxjVEN5c3pUdGs5T0MyR0dVb1RPNFVR?=
 =?utf-8?B?YlBBZUttMVk0emlkWlFaOUlFVFlNS0E5UVZkTzV0S1Z0VE5Tb2FLU2RDV3JN?=
 =?utf-8?B?SVNyQ2JEU2x0YWRmQlRQOEFnLzVkbWFMYkdxaUlRWVpCNktBWXZsL0d1Z3RM?=
 =?utf-8?B?MUVwbDE0dXZQNmdyMi90SDhURkpGU0Njd1ZVUFVXMy9GV0dFN0l5OXdPQTlz?=
 =?utf-8?B?WklyQmVsbFhHVmRJMlhJMUNiS1RlR3FpeWVIUFd1a2l3aTZpMysrdGpPQ0Zw?=
 =?utf-8?B?YkwwNWV0U0xadnR0TE95SVNCRThNTDEyTlJmdnBuNUtQUXQrcE5mK29vV2lB?=
 =?utf-8?B?QlU1Q3V3MllJN09nU3Rxczg0V1o5eHIyaDJ4b1ZxSURnNmtKWDBBWFN0bGcw?=
 =?utf-8?B?RzJ5dlNyOW5TOUZwQkFUM0lkVVNmTG12c2F5SFpacjkydFUwWTRpZ25Qd2hR?=
 =?utf-8?B?Ni9FVzZwc1A4a25GdCs2d1VQQ2M4SXZodGVGVlJOSUkxcFlQak1zeDhHeVNq?=
 =?utf-8?B?UkJQVC9zMjNSaFVkT3h1VjJnSGhFRGl1V0tXMEJzM0RCMVpwdFF3dHk0Mnl2?=
 =?utf-8?B?UG9Ra2pjS2VBOHhKdVRMd2RwMGNsMmNZdy9sV2tRWEZLZnczYUFhY0xpSDdI?=
 =?utf-8?B?czN2T2F3SUwvUC9OOVphSXRYUjd1MHQ2STBqTDN4R3huMUZ5MVBLMCt2VHM4?=
 =?utf-8?B?UTZqVE5KRGkxOEpTZ1dIaFIxRHlpVURUTUNTbjZnSWV6Z2lFSzZoWGtBMFcz?=
 =?utf-8?B?YUxhY2h1R2c3R0FDQ21yMUh3NXNZeVduWDJPZmV6YlRPcG1NL1U2bTcydTg2?=
 =?utf-8?B?S2gxVndPK1RXbUExTXYwU3JycEp2T1R6Y3cwR0JCQ0JPMG9oMExLMlRTNjRt?=
 =?utf-8?B?OU5iZDM4TkQxa1JnRmN5L295SUZZUFd5WHllZGJCSDZRN2pFUXNIUDRuNS8v?=
 =?utf-8?B?OHJUbFVEMXo0TFpHT2FlSnh6Zm5yQ2hvOUFsVWlvbFFZRDZselRvL3Fxc21O?=
 =?utf-8?B?cE5OUHVySWpmRE1aQUZhMGxkdDMxYzNRaHVxWTRhK2wyZFNYMFIzMDVRUTNr?=
 =?utf-8?B?ZW5uRGdJR0xWb2piY1MrVmgyV3FFRGJHVU1XREJyQ2R0V21YbGxxRDNLdEJJ?=
 =?utf-8?B?OU8yY0hXOUlWTERISW1TL2YrZWpaRXBlZUFlcjJwWFdLbjI1YVNITlpEb2di?=
 =?utf-8?B?c2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6fded0-c75c-417a-391a-08dd1e8093b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 09:52:53.9004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAOwj0B5GELrZ5jSai30Nt9p0FyBomVll2v44q2UxnjP3UNAyUWCuhxwI3g0z7k8M2C7fLpnhgUdDynWjX0PpEFQ9AOjLN7s/7Q+7eHlg+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12043

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDE3
IERlY2VtYmVyIDIwMjQgMDk6NDUNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzddIGR0LWJp
bmRpbmdzOiBwaW5jdHJsOiByZW5lc2FzOiBBZGQgYWxwaGEtbnVtZXJpY2FsIHBvcnQgc3VwcG9y
dCBmb3IgUlovVjJIDQo+IA0KPiBPbiAxNy8xMi8yMDI0IDEwOjE5LCBCaWp1IERhcyB3cm90ZToN
Cj4gPj4+Pj4+IENhbGxpbmcgaXQgYSBiaW5kaW5nIG1ha2VzIGl0IGltbXV0YWJsZSBhbmQgZ2l2
ZXMgdXMsIERUDQo+ID4+Pj4+PiBtYWludGFpbmVycywgbW9yZSB3b3JrLCBzbyByZWFsbHkgbm8g
YmVuZWZpdHMgYXQgYWxsLg0KPiA+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEkgZ3Vlc3Mgb3Ro
ZXIgRFQgbWFpbnRhaW5lcnMgd2lsbCBhY2sgaXQsIEkgcHJlZmVyIHRvIHJlZHVjZSBudW1iZXIg
b2YgaGVhZGVycy4NCj4gPj4+Pj4NCj4gPj4+Pj4gRFQgZGVzY3JpYmVzIGhhcmR3YXJlLiBUaGUg
cG9ydCBuYW1lcyBhcmUgYWxwaGEgbnVtZXJpYyBvbiBoYXJkd2FyZSBtYW51YWwuDQo+ID4+Pj4N
Cj4gPj4+PiBXZSB0YWxrIGFib3V0IGJpbmRpbmcsIG5vdCBEVC4NCj4gPj4+DQo+ID4+PiBCdSB0
aGUgZGVmaW5pdGlvbnMgYXJlIHBhcnQgb2YgYmluZGluZ3MganVzdCBsaWtlIENvbW1pdCAiOTk3
ZGFhOGRlNjRjY2JiIi4NCj4gPj4NCj4gPj4gWW91IG1hZGUgdGhlbSBwYXJ0IG9mIGJpbmRpbmdz
LCBidXQgdGhpcyBpcyBpbnZhbGlkIGFzIGFyZ3VtZW50LiBIb3cNCj4gPj4gaXMgdGhpcyBhbnlo
b3cgcmVsYXRlZD8gSG93IGlzICJEVCBkZXNjcmliZXMgaGFyZHdhcmUiIHBhcnQgb2YgYmluZGlu
Zz8NCj4gPj4NCj4gPj4gWW91IHNhaWQgIkRUIGRlc2NyaWJlcyBoYXJkd2FyZSIsIGJ1dCB3ZSBk
byBub3QgdGFsayBoZXJlIGFib3V0IERULCBkbyB3ZT8gV2UgdGFsayBhYm91dCBiaW5kaW5nLg0K
PiA+DQo+ID4gT0suDQo+ID4NCj4gPj4gSSBhbSBub3QgZ29pbmcgdG8ga2VlcCByZWFkaW5nIGFs
bCB0aGUgZXh0ZXJuYWwgcmVmZXJlbmNlcyB5b3Uga2VlcA0KPiA+PiBicmluZ2luZyBvciBkaXNj
dXNzaW5nIHdoeSBzb21lb25lIGVsc2UgZGlkIHNvbWV0aGluZy4gVGhpcyBwYXRjaA0KPiA+PiBt
dXN0IGJlIGxvZ2ljYWwgYW5kIGNvcnJlY3Qgb24gaXRzIG93biwgbm90IGJlY2F1c2Ugc29tZW9u
ZSBlbHNlIG1hZGUgc29tZXRoaW5nIHNvbWV3aGVyZS4NCj4gPg0KPiA+IE9LLiBBY2NvcmRpbmcg
dG8gbWUgdGhpcyBwYXRjaCBpcyBjb3JyZWN0LiBJdCBpcyBmb3IgRFQgdXNlciBhbmQgaXQNCj4g
PiBkZXNjcmliZWQgY2xlYXJseSBpbiBjb21taXQgbWVzc2FnZQ0KPiANCj4gU28geW91IHJlcGVh
dCBmaXJzdCBwb2ludCB3aGljaCBJIG9iamVjdGVkIGluIHRoZSBmaXJzdCBwbGFjZS4gSWYgdGhp
cyBpcyBmb3IgRFQsIHRoZW4gdGhpcyBpcyBub3QgYQ0KPiBiaW5kaW5nIGFuZCBkb2VzIG5vdCBk
ZXNlcnZlIGhlYWRlci4NCg0KQmluZGluZyByZWZlcnMgbWFjcm9zIGFuZCBtYWNyb3MgZGVmaW5l
ZCBpbiB0aGUgaGVhZGVyLiBEaWQgSSBtaXNzIGFueXRoaW5nIGhlcmU/DQpPcg0KDQpEbyB5b3Ug
d2FudCBtZSB0byB1cGRhdGUgYmluZGluZ3Mgd2l0aCBSWlYySF9HUElPKiBhbmQgUlpHM0VfR1BJ
TyogbWFjcm9zPz8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=


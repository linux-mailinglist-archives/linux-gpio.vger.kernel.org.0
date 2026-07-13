Return-Path: <linux-gpio+bounces-39996-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kg4XIDoBVWoFiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39996-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:16:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FF474CE64
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:16:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="h/f+Qec+";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39996-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39996-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA930300D342
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AD539A079;
	Mon, 13 Jul 2026 15:15:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EBE145B3F;
	Mon, 13 Jul 2026 15:15:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955715; cv=fail; b=atm5R68XL6xww8x34IPgFXLqkx3PtreOluGO89jJpBePs1lrBKqDBNcxEiQ3pFOdRF+TEBdfHEbIWTQJFRP9zb7SwIVSbtN0geEVx/m1eD5X40QRiW8uq1LSx2mMvk3VYR0xP8iCuBcH9cDCiDd5F1CsLioz5yKT0HvXENnLcZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955715; c=relaxed/simple;
	bh=5SepZzZkUpoDbfH6vq5dIAwsDFNeglsp8MIATHHDgpI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IVRBnXIof84tOaBlGkjy4nx0v5lV/qk/M0kjoDPuvU5lfPWfo/q0Z7do4//ajk/QLL3j/idsGMeBljHhj9gsaZGAZZTLvu70IaBV2uaVUIrJtmzYWKop+7UNdW6qyLe8scss6pXYAGmyLW6/raR9VFubKJ5d6rIvOxb7+Fy5FwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=h/f+Qec+; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1aSyqEJOANfSKiK5zIaGPTDrfkjQzmgCJShDYSdyiCyuCSfsfOXiBU4CDJaiCwIfXaQUnyOV6+exXAWW3//md6CwGpKOunn8csAEsHl+pZ1H6FCm3Ekp15pQz4kdWWtPRPRwCMvNNq/RlSFVstrukMdLtQLdsmF45NrqEKnusFx3L6rv9dun3RhRqUzfj9r+iNo94YDzDohNsLQs1OQvP5htY53EFqUUIwrv1dmpdPvDlkUyjsbc+13vWab+fImwaPhGJgXk/2wf4kgEk/SSThiaIsXSYh0QFfV9G5Ow2JPeSMChpEtPEcsMylX4Ps/uMJN/Tgji7MNrv742xr1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SepZzZkUpoDbfH6vq5dIAwsDFNeglsp8MIATHHDgpI=;
 b=zRIF/elsSVFA4jShOuUc20QF8cK0m/PLdGkdmzKhSzmSnrXIWCESHL48+UE+oPpNFVi6zSGP0xSrhNN9kq0uEiymhJ3+Dv/v7HMZhr5eJLiMsQNWGHOEbGG/9vlkHViBlsgnHLxaX1/+BmtLYqp3shilFI8uWXGkmojumQ3Grji1eVyUS3gayWIKQkQcYyhDbSxxk9JUvvAggDhQDz9twVmyUHsyvB53uc43fjUemq1Utnw83tGdYmlRRb+trAsSwcd0ZoTu3EGE1+psn4rHbf5MvbgtuLHuQo3a77PeRdO2r/VCVc1myUxnJcwluQmp59d9yaB9Xl+6xyjlDTt4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SepZzZkUpoDbfH6vq5dIAwsDFNeglsp8MIATHHDgpI=;
 b=h/f+Qec+ecTtzcr6IIPeBpUE+xEdy3S8IcomwsPwLuEY0ebk8vIxPUOtLwPGC5N6eipypuVudIaPlgaps0T7IG0i5ZLljlOuYmjMEWcOLLRlheh0ryY89wh5cvpcM/srhb35Opvr19QC8dmGGBdi+mJ5T6w8qm0WSAVC24W8210=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14760.jpnprd01.prod.outlook.com (2603:1096:604:396::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 15:15:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 15:15:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea+renesas@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linusw@kernel.org" <linusw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Thread-Topic: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Thread-Index: AQHdEGCEtP5P1ZXBFUyNMEvPaGr4CbZp+qIQgAF5EwCAAAjeQIAAEl4AgAAC00A=
Date: Mon, 13 Jul 2026 15:15:07 +0000
Message-ID:
 <TY3PR01MB1134672AC39737CA91F8FDBA886FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev>
 <TY3PR01MB113468890DC8B12E1E43A54A986FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7cd113ad-3673-4f2b-97f3-aa1df4259a53@tuxon.dev>
In-Reply-To: <7cd113ad-3673-4f2b-97f3-aa1df4259a53@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14760:EE_
x-ms-office365-filtering-correlation-id: bcb23cd6-0e12-402c-e182-08dee0f1862f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Bcmwfils9a6N6OalkhqkKzcuzXAXkGQYxQm1IlAM+4cEZsiARSRcJ7+F1oxBYqF/YuS6xUUG9/SA1ny4ltXb3K0HcvKAyEzPvUE3AGwwXetWtD6ujKEyQOKLVE/za5QLBcCfC3PY0qNIAszR2TyzQ5ZPM06cHg6NUZSlKrYYMXjcqN9v7SOlpQN4ikP/FZ2zpFKoE+Hv+Lv/OD18VdEDIeHfWTBVC91Us1saq+Q4QoZ//wOg6uO3Gj5Q6XA8gNz0WJkF4BlaTnIRYwLKucgb4fwaxjBuGJ2N9wXb+zX9lw9pNmELZGQ0NLVey3bEY28+zq0ZXoE37OA9y+5fZ2UlWjYYGwXM3JPPshqZi17xsuPbtQsSpNQ2ItzMgzSFYBfuv5rmBiOmV3KGARMmqKTABx6Sk5ymgHLAM/slictrcTILj7IgcSF63iA2XR0rg98i7XUmncNReyLiUsWmvKnQkKX6zmtm1UiYOKIEBhOsOWlAmRIkGLOT0BoDPRbFMhtxJg30/x0CEj4d/mIoE64+fodbWdXEyBS4KxTlaCq6uEpJ/BSccS5DYPPbGgJHWD11FhgcG8gNt3MjqidIRt4sJY7w2LLvqrydgFvwbOCi5KZw2w6fux0uZYByYTDY+Y3+Nutd0gOjmdKJb9+J1xiO2aLUJz6ugjP/JkPmkl66GLBtkq2fSixYLLUe8zbAkW2hnvqxY76SM8erzNOC9s8L3qPnBWiiQthhPGQBVkvYl0A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWZJbVVwaUs5aDRHMURwL1AzV3BNRXN2bHp3MDVrNDYrdnNReUFHeXJ2RWFp?=
 =?utf-8?B?VE9SQlZqYnJzUE5nRUxTdkdpNFVJTy9WYmE0eVRkS2dweFU0Yk1sYkVWRHp0?=
 =?utf-8?B?TUM4QnI5dmQvSUQvcTVNd0pFbFBFUmcvYjZDcmVvVmxGMEowSk16SjlyOEZy?=
 =?utf-8?B?T1VTVk9Na1ljSmdkQ3VHamFPdndJdXlGOUp5N253alNCa2E5MTRmaXpGbW5O?=
 =?utf-8?B?L1VTQ1hLRlZGYWRoYUl2d3lndkUrMzh0NjNVWUtreTVCeXNKS1JGTEhxVks0?=
 =?utf-8?B?V3ZaekdZMHROS0l3dWIwcTBLODhaV2F6WUlHa0RxZGdGUk9IdTVPOWY1aE1D?=
 =?utf-8?B?aGNwb1lmWkN3SXJnekpMRkljTmw1K1NPRXFoN3pWTDhzR3JWblhxVHR0c0sy?=
 =?utf-8?B?MlJJZUUxd2FONXFaQ0NXNFRHYzlncU55YTYwRzhTdnptSHdES2JwWlBVbEhT?=
 =?utf-8?B?ZnFwR1ppWFpwOEd2VHVIMWdaYjJUT1lEeWRLYUN0Y1BVbEttcFozZm52bkFG?=
 =?utf-8?B?U040bFZzcmdyWkh0WFBDcGFiOTg2cHhGa3Z1L29hcVZ6cHNXNG5mWm1wRHJa?=
 =?utf-8?B?YVZlTnoyTFJIY1lUdHdYWFd3QlVURFJhcmxaMWtxS05vU0tPTWZwRDdEbzA2?=
 =?utf-8?B?Q1BBZ2IvV2lxS0FqUC9GYkhnT1JMbElKWmtsRFFkYzVwRWkyUjdNMmFpYllm?=
 =?utf-8?B?L3lDOGlwc1RCT25TclhFaHBranBhcGtKNnJjdzVjbTU0Y0FvVkJqYVRVVUNU?=
 =?utf-8?B?b00xVlM0NEF4V0Z1TFFNWDJ3eTdqRm8zOWxGT0hudXBEZWgvd3ZGemM1OWJI?=
 =?utf-8?B?NU9taDNNbWFJUndmSFFKVUxNemdIVkFaYUd1U3o3dDRaeHFEVXFZdWMxdkUw?=
 =?utf-8?B?OE91cW9zZDlVSGFtZkJYeXpOK0VwUVErV0RXQ3hKVnl6Uk1KcE11cnVTaits?=
 =?utf-8?B?WVEyRXFmRCtVNUhUL3ZvU1JzT1NHRXl2cWlZdlp6RmxSVXhmRUNLSkFsSVhH?=
 =?utf-8?B?T0NrQW95TFNLU0pSQW9jczRwSXBIcDc2NVR2NVJCYlNvNktTRGFwa1ZsVTFz?=
 =?utf-8?B?d2F3UGh1TDV1MDNrWFVKdC95V3N1MjdJTnU3MS8xaytaa1g3ZFhtdm50N3d5?=
 =?utf-8?B?L3k4WUxuaFVtUzJreXlJTnNnVTcrWXNyTTU2UzBUdEp2UVp4OFh4UHhueVpM?=
 =?utf-8?B?UkJUWktCWjNaVlEzSTFWNUpOM24xTzcrVTQvQmU0VnFvaFN0YkVHSWpkdTZv?=
 =?utf-8?B?bjlBNnI4eVlmYjhaVU9SYTJzOXBpYVdpK0xJSDFtTktScndtSzZTaU5Ua0Iz?=
 =?utf-8?B?VFRLaHRYdHdhRlJKYnpkNzcra2tOQ0x4VjNWZ2JYOWtOdi9mWTJaK2k0dUdE?=
 =?utf-8?B?dlQ2QUkxK3lDVFRzUU1tUUJuRUJDQzN5QVhzTG5JVEh5Q0M1WDdzMTU1SlVR?=
 =?utf-8?B?ZU1CL3oramtxdk5UOWVUODIxRnlWU3RzbXJCdnNTb3pkWDhKZ01hZTVPd3Fx?=
 =?utf-8?B?TUNlY2dvSXh0YUU5Y3ZkSXdvNjUydVV4UnJkaXZJUXZLTzFETmgvcmYrNmZr?=
 =?utf-8?B?d00weTY4TzMzNlBUZUpVekhKR28yWEVaL1V0N1pVS1RhZkJ3YmU2QkZ3OXNw?=
 =?utf-8?B?aXBRc0graTRrUGt6cVlFNENIYjIrRXpUM2RTc0pWMWNTbGdOZE9RNzdxdmZD?=
 =?utf-8?B?bmpnNlA5ZEhrelJBQzRtellSdWU5MVBFU0tDOVlvbldDelBER2xlU1A2ckxC?=
 =?utf-8?B?S1Q1NnlpNGhmRk5BUUNlVHRQR3Z1UXJnYmxnZG9nSzlwZ0piWnJZSkZZeFVl?=
 =?utf-8?B?M3JJejlyVVZLVDBWblY4QzhnbzdPQ1JlbnlXMEhTbFltMHh0ajBwWVJsa0RD?=
 =?utf-8?B?UmljUDVHc0Q0dnlhb1FFMENtb2tZMUtpTjBWelJFSDRzOFpnQTgrSFh1czN1?=
 =?utf-8?B?b3YrQ1ZwSi9ud2ozQmRoQUJ5SGV3Y1VzVWE5TVJrRFR0d1BpeCtTZGdLcExY?=
 =?utf-8?B?WW5WazdwMFJmOTJpVkJzYkw3cGRoNzlQRnNmSzZISEp2Mis4TURxL1R1c3R4?=
 =?utf-8?B?Sit1WjkwTUVzSG9pa09IYlBmVlpCeGIwbjNJcFFaZkRFN0QweXRhMGZnblI4?=
 =?utf-8?B?MmxpNkwxMGt1WU1iempoTTRwUE11Y0xPUWVlSVFwN2RQeXQ3M3FySUxHSHFl?=
 =?utf-8?B?L2dybGlmLytZYktielhaWk0vNTlRRW5Pc1ZjbVhzbkprTjI5eitYZU9jbm1T?=
 =?utf-8?B?aUVyUzFzd25RMU1IWGRjelpDK3hWdGE0RzRhbjFoWVRBaGNYV2JlS21oamx6?=
 =?utf-8?B?SE02WFlQTnZ5aFVaN3V1NUJHcUpGcktjejVjU1NDejV3c1EzM3EwQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb23cd6-0e12-402c-e182-08dee0f1862f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 15:15:07.6178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sKGX56X9oEavcXlvX1kbcCig79UQdtqJ5kHtNYb8lI1VT9AjROTgmucJSbGja/JRBxjn3r/2LJP8SyBm17hAym7ZAMdxhz6YFk8lFbCP4t4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14760
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39996-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:claudiu.beznea+renesas@tuxon.dev,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[tuxon.dev,glider.be,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:email,tuxon.dev:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7FF474CE64

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxMyBKdWx5IDIw
MjYgMTU6NTcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA0LzVdIHBpbmN0cmw6IHJlbmVzYXM6
IHJ6ZzJsOiBBZGQgUlovRzNTIHN1cHBvcnQgZm9yIHNlbGVjdGluZyB0aGUgSTNDIHBvd2VyDQo+
IHNvdXJjZQ0KPiANCj4gDQo+IA0KPiBPbiA3LzEzLzI2IDE2OjU2LCBCaWp1IERhcyB3cm90ZToN
Cj4gPiBIaSBDbGF1ZGl1LA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IGNsYXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+
IFNlbnQ6IDEzIEp1bHkgMjAyNiAxNDoxOQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDQv
NV0gcGluY3RybDogcmVuZXNhczogcnpnMmw6IEFkZCBSWi9HM1MNCj4gPj4gc3VwcG9ydCBmb3Ig
c2VsZWN0aW5nIHRoZSBJM0MgcG93ZXIgc291cmNlDQo+ID4+DQo+ID4+IEhpLCBCaWp1LA0KPiA+
Pg0KPiA+PiBPbiA3LzEyLzI2IDE3OjU1LCBCaWp1IERhcyB3cm90ZToNCj4gPj4+IEhpIENsYXVk
aXUsDQo+ID4+Pg0KPiA+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4+Pg0KPiA+Pj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhK3JlbmVzYXNAdHV4b24uZGV2Pg0KPiA+Pj4+IFNlbnQ6IDEwIEp1bHkgMjAy
NiAxMjozNw0KPiA+Pj4+IFN1YmplY3Q6IFtQQVRDSCB2NCA0LzVdIHBpbmN0cmw6IHJlbmVzYXM6
IHJ6ZzJsOiBBZGQgUlovRzNTIHN1cHBvcnQNCj4gPj4+PiBmb3Igc2VsZWN0aW5nIHRoZSBJM0Mg
cG93ZXIgc291cmNlDQo+ID4+Pj4NCj4gPj4+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4NCj4gPj4+PiBUaGUgUmVuZXNhcyBS
Wi9HM1MgSTNDIHBpbnMgY2FuIGJlIHBvd2VyZWQgYXQgZWl0aGVyIDEuOFYgb3IgMS4yVi4NCj4g
Pj4+PiBUaGUgcGluIGNvbnRyb2xsZXIgcHJvdmlkZXMgYSByZWdpc3RlciB0byBzZWxlY3QgYmV0
d2VlbiB0aGVzZSB0d28gb3B0aW9ucy4NCj4gPj4+PiBVcGRhdGUgdGhlIFJlbmVzYXMgUlovRzJM
IHBpbiBjb250cm9sbGVyIGRyaXZlciB0byBhbGxvdyBzZWxlY3RpbmcgdGhlIEkzQyBwb3dlciBz
b3VyY2Ugb24gUlovRzNTDQo+IFNvQy4NCj4gPj4+Pg0KPiA+Pj4+IFJldmlld2VkLWJ5OiBXb2xm
cmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPg0KPiA+Pj4+IFRlc3Rl
ZC1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4NCj4g
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAu
cmVuZXNhcy5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4NCj4gPj4+PiBDaGFuZ2VzIGluIHY0Og0K
PiA+Pj4+IC0gbm9uZQ0KPiA+Pj4+DQo+ID4+Pj4gQ2hhbmdlcyBpbiB2MzoNCj4gPj4+PiAtIGNv
bGxlY3RlZCB0YWdzDQo+ID4+Pj4NCj4gPj4+PiBDaGFuZ2VzIGluIHYyOg0KPiA+Pj4+IC0gbm9u
ZQ0KPiA+Pj4+DQo+ID4+Pj4gICAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcy
bC5jIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCA2OCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+Pj4+
IGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4+Pj4gaW5kZXgg
YjUyYTg1MDY2ZjYzLi45YTA3MDZmZWEyMjAgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy9w
aW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9waW5j
dHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4+Pj4gQEAgLTY5LDYgKzY5LDcgQEANCj4g
Pj4+PiAgICAjZGVmaW5lIFBJTl9DRkdfUFZERDE4MzNfT1RIX0FXT19QT0MJQklUKDE5KSAvKiBr
bm93biBvbiBSWi9HM0wgb25seSAqLw0KPiA+Pj4+ICAgICNkZWZpbmUgUElOX0NGR19QVkREMTgz
M19PVEhfSVNPX1BPQwlCSVQoMjApIC8qIGtub3duIG9uIFJaL0czTCBvbmx5ICovDQo+ID4+Pj4g
ICAgI2RlZmluZSBQSU5fQ0ZHX1dEVE9WRl9OX1BPQwkJQklUKDIxKSAvKiBrbm93biBvbiBSWi9H
M0wgb25seSAqLw0KPiA+Pj4+ICsjZGVmaW5lIFBJTl9DRkdfSU9fVk1DX0kzQwkJQklUKDIyKQ0K
PiA+Pj4+DQo+ID4+Pj4gICAgI2RlZmluZSBSWkcyTF9TSU5HTEVfUElOCQlCSVRfVUxMKDYzKQkv
KiBEZWRpY2F0ZWQgcGluICovDQo+ID4+Pj4gICAgI2RlZmluZSBSWkcyTF9WQVJJQUJMRV9DRkcJ
CUJJVF9VTEwoNjIpCS8qIFZhcmlhYmxlIGNmZyBmb3IgcG9ydCBwaW5zICovDQo+ID4+Pj4gQEAg
LTE4Niw2ICsxODcsOSBAQA0KPiA+Pj4+ICAgICNkZWZpbmUgUFZERF8zMzAwCQkwCS8qIEkvTyBk
b21haW4gdm9sdGFnZSA+PSAzLjNWICovDQo+ID4+Pj4gICAgI2RlZmluZSBQVkREX01BU0sJCTB4
Mw0KPiA+Pj4+DQo+ID4+Pj4gKyNkZWZpbmUgUFZERF9JM0NfMTIwMAkJMQkvKiBJM0MgSS9PIGRv
bWFpbiB2b2x0YWdlIDEuMlYgKi8NCj4gPj4+PiArI2RlZmluZSBQVkREX0kzQ18xODAwCQkwCS8q
IEkzQyBJL08gZG9tYWluIHZvbHRhZ2UgMS44ViAqLw0KPiA+Pj4+ICsNCj4gPj4+PiAgICAjZGVm
aW5lIFBXUFJfQjBXSQkJQklUKDcpCS8qIEJpdCBXcml0ZSBEaXNhYmxlICovDQo+ID4+Pj4gICAg
I2RlZmluZSBQV1BSX1BGQ1dFCQlCSVQoNikJLyogUEZDIFJlZ2lzdGVyIFdyaXRlIEVuYWJsZSAq
Lw0KPiA+Pj4+ICAgICNkZWZpbmUgUFdQUl9SRUdXRV9BCQlCSVQoNikJLyogUEZDIGFuZCBQTUMg
UmVnaXN0ZXIgV3JpdGUgRW5hYmxlIG9uIFJaL1YySChQKSAqLw0KPiA+Pj4+IEBAIC0yNTcsNiAr
MjYxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5fY29uZmlnX2l0ZW0gcmVuZXNhc19yenYy
aF9jb25mX2l0ZW1zW10gPSB7DQo+ID4+Pj4gICAgICogQG9lbjogT0VOIHJlZ2lzdGVyIG9mZnNl
dA0KPiA+Pj4+ICAgICAqIEBxc3BpOiBRU1BJIHJlZ2lzdGVyIG9mZnNldA0KPiA+Pj4+ICAgICAq
IEBvdGhlcl9wb2M6IE9USEVSX1BPQyByZWdpc3RlciBvZmZzZXQNCj4gPj4+PiArICogQGkzY19z
ZXQ6IEkzQ19TRVQgcmVnaXN0ZXIgb2Zmc2V0DQo+ID4+Pj4gICAgICovDQo+ID4+Pj4gICAgc3Ry
dWN0IHJ6ZzJsX3JlZ2lzdGVyX29mZnNldHMgew0KPiA+Pj4+ICAgIAl1MTYgcHdwcjsNCj4gPj4+
PiBAQCAtMjY1LDYgKzI3MCw3IEBAIHN0cnVjdCByemcybF9yZWdpc3Rlcl9vZmZzZXRzIHsNCj4g
Pj4+PiAgICAJdTE2IG9lbjsNCj4gPj4+PiAgICAJdTE2IHFzcGk7DQo+ID4+Pj4gICAgCXUxNiBv
dGhlcl9wb2M7DQo+ID4+Pj4gKwl1MTYgaTNjX3NldDsNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+ICAg
IH07DQo+ID4+Pj4NCj4gPj4+PiAgICAvKioNCj4gPj4+PiBAQCAtMjcyLDYgKzI3OCw3IEBAIHN0
cnVjdCByemcybF9yZWdpc3Rlcl9vZmZzZXRzIHsNCj4gPj4+PiAgICAgKiBAb3RoZXJfcG9jX3B2
ZGQxODMzX290aF9hd29fcG9jOiBQVkREMTgzM19PVEhfQVdPX1BPQyBtYXNrDQo+ID4+Pj4gICAg
ICogQG90aGVyX3BvY19wdmRkMTgzM19vdGhfaXNvX3BvYzogUFZERDE4MzNfT1RIX0lTT19QT0Mg
bWFzaw0KPiA+Pj4+ICAgICAqIEBvdGhlcl9wb2Nfd2R0b3ZmX25fcG9jOiBXRFRPVkZfTl9QT0Mg
bWFzaw0KPiA+Pj4+ICsgKiBAaTNjX3NldF9wb2M6IEkzQ19TRVRfUE9DIG1hc2sNCj4gPj4+PiAg
ICAgKi8NCj4gPj4+PiAgICBzdHJ1Y3QgcnpnMmxfcmVnaXN0ZXJfbWFza3Mgew0KPiA+Pj4+ICAg
IAl1bmlvbiB7DQo+ID4+Pj4gQEAgLTI4MSw2ICsyODgsMTEgQEAgc3RydWN0IHJ6ZzJsX3JlZ2lz
dGVyX21hc2tzIHsNCj4gPj4+PiAgICAJCQl1OCBvdGhlcl9wb2NfcHZkZDE4MzNfb3RoX2lzb19w
b2M7DQo+ID4+Pj4gICAgCQkJdTggb3RoZXJfcG9jX3dkdG92Zl9uX3BvYzsNCj4gPj4+PiAgICAJ
CX07DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJCS8qIFJaL0czUyBtYXNrcyAqLw0KPiA+Pj4+ICsJCXN0
cnVjdCB7DQo+ID4+Pj4gKwkJCXU4IGkzY19zZXRfcG9jOw0KPiA+Pj4NCj4gPj4+IEhvdyB0aGlz
IFBPQyBpcyBkaWZmZXJlbnQgZnJvbSBFdGhlcm5ldCwgU0RISSBhbmQgWFNQSSBQT0M/DQo+ID4+
DQo+ID4+IERpZmZlcmVudCBiaXQgbWFzayBhbmQgb2Zmc2V0IGZvciBJM0MgU0VUX1BPQyBjb21w
YXJlZCB3aXRoIEVUSCwgU0RISSwgWFNQSS4NCj4gPg0KPiA+IFJaL0czTCBoYXMgaTNjX3NldF9w
b2MsIHdoaWNoIGhhcyBzYW1lIGJpdG1hc2sgYXMgb3RoZXJfcG9jX3dkdG92Zl9uX3BvYy4NCj4g
PiBNYXliZSBjcmVhdGUgcmVnaXN0ZXIgc3BlY2lmaWMgbWFza3M/Pw0KPiA+DQo+ID4gc3RydWN0
IG90aGVyX3BvYyBhbmQgc3RydWN0IGkzY19zZXQgaW5zdGVhZCBvZiB1bmlvbi4gU28gdGhhdCBi
b3RoDQo+ID4gUlovRzNMIGFuZCBSWi9HM1MgY2FuIHNoYXJlIHRoZSBzYW1lIHN0cnVjdCBmb3Ig
aTNjLg0KPiANCj4gV2hlbiBSWi9HM0wgSTNDIFBPQyBzdXBwb3J0IHdpbGwgYmUgYWRkZWQgdGhl
IGkzY19zZXRfcG9jIG1lbWJlciBvZiBzdHJ1Y3QgcnpnMmxfcmVnaXN0ZXJfbWFza3MgY291bGQg
YmUNCj4gbW92ZWQgYXMgY29tbW9uIG1lbWJlcjoNCj4gDQo+IEN1cnJlbnQgY29kZSBiYXNlIGFs
bG93cyBmb3IgdGhpcyBleHRlbnNpb24uIFlvdSBjYW4gaGF2ZToNCg0KPiANCj4gc3RydWN0IHJ6
ZzJsX3JlZ2lzdGVyX21hc2tzIHsNCj4gKyAgICAgICAvKiBDb21tb24gbWFza3MuICovDQo+ICsg
ICAgICAgdTggaTNjX3NldF9wb2M7DQo+ICAgICAgICAgIHVuaW9uIHsNCg0KT0ssIFRoaXMgdW5p
b24gd2lsbCBnbyB3aGVuIHdlIGFkZCBSWi9HM0wuDQoNCj4gICAgICAgICAgICAgICAgICAvKiBS
Wi9HM0wgbWFza3MgKi8NCj4gICAgICAgICAgICAgICAgICBzdHJ1Y3Qgew0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgdTggb3RoZXJfcG9jX3B2ZGQxODMzX290aF9hd29fcG9jOw0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgdTggb3RoZXJfcG9jX3B2ZGQxODMzX290aF9pc29fcG9jOw0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgdTggb3RoZXJfcG9jX3dkdG92Zl9uX3BvYzsNCj4g
ICAgICAgICAgICAgICAgICB9Ow0KPiAtICAgICAgICAgICAgICAgLyogUlovRzNTIG1hc2tzICov
DQo+IC0gICAgICAgICAgICAgICBzdHJ1Y3Qgew0KDQpMb29rcywgdGhpcyBzdHJ1Y3Qgbm90IG5l
ZWRlZCBub3cuIHN0cnVjdCB3aXRoIHNpbmdsZSBtZW1iZXINCmhhcyBubyB2YWx1ZSBhdCBhbGwu
DQoNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgdTggaTNjX3NldF9wb2M7DQo+IC0gICAgICAg
ICAgICAgICB9Ow0KPiAgICAgICAgICB9Ow0KPiB9Ow0KPiANCj4gLy8gLi4uDQo+IA0KPiBjb25z
dCBzdHJ1Y3QgcnpnMmxfaHdjZmcgcnpnM2xfaHdjZmcgPSB7DQo+ICAgICAgICAgIC8vIC4uLg0K
PiANCj4gICAgICAgICAgLm1hc2tzID0gew0KPiAgICAgICAgICAgICAgICAgIC5vdGhlcl9wb2Nf
cHZkZDE4MzNfb3RoX2F3b19wb2MgPSBCSVQoMCksDQo+ICAgICAgICAgICAgICAgICAgLm90aGVy
X3BvY19wdmRkMTgzM19vdGhfaXNvX3BvYyA9IEJJVCgxKSwNCj4gICAgICAgICAgICAgICAgICAu
b3RoZXJfcG9jX3dkdG92Zl9uX3BvYyA9IEJJVCgyKSwNCj4gKyAgICAgICAgICAgICAgIC5pM2Nf
c2V0X3BvYyA9IEJJVCh4KSwNCgkJCS5pM2Nfc2V0X3BvYyA9IEJJVCgyKSwNCg0KQ2hlZXJzLA0K
QmlqdQ0KDQo+ICAgICAgICAgIH0sDQo+IA0KPiAgICAgICAgICAvLyAuLi4NCj4gfTsNCj4gDQo+
IFRoZSByZXN0IG9mIGNvbmZpZ3VyYXRpb24gYW5kIGluaXRpYWxpemF0aW9uIGNvZGUgcmVtYWlu
cyB0aGUgc2FtZS4NCj4gDQo+IFRoYW5rIHlvdSwNCj4gQ2xhdWRpdQ0K


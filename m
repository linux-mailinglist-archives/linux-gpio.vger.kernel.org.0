Return-Path: <linux-gpio+bounces-35727-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOqfEfb38GkpbgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35727-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:09:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C148A73A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EA0F3122E36
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8C644D031;
	Tue, 28 Apr 2026 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LtXa3P/y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F0F44D033;
	Tue, 28 Apr 2026 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777399508; cv=fail; b=solTcbTGtN0YUGZfYNW7d6lDK908HBRiMNMpBl0DmwoqdT+KcYFfIuOFPA1aihD8Am415rtdcdcFkBuxTsdihZKIaFaAAjG5QHxV1MpVj79Qyd12c+0UjDHkU3FAFwUSM5rYSPssYItwM+Xeg7ltWGsrSG1kyk3FvRuIkuxrVhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777399508; c=relaxed/simple;
	bh=z+xuYb44hTThozd7t0AE2QBK/E4F5AkNwF0YmGcJgyk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HOnBTP1iC4RJ9obaVDvIRWC1HvWwXsw1c4ob1uair+5y7FOX7Fp58v8HijVit7iaWtIbzhF2WsDIwvvgM3yTXofTZA2crfFByq0X9xrNOtOKoctIbL1T67Aj3YZAM+8fsK+GR8VE78mzzO6KtXJ7OSNPXVlOcb1+VDrHG53aZCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LtXa3P/y; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fypzzH9oIR/4az6+ot1E39/wy3bGU2lRwHiYsMo1rHFuzIofUE5hj0yucJSoP2OSgI6w8FFk2NkFITu3rSB9DWy3aJT9uBSdXCWdf1OcTJsyeQ+CTrsqrwJ5FptkrPY+R8JOSN9Bko0fulvPLmQikOJ2ftSquP3pmu0q4cKWXD9hfthA+ktTgXMzXeas5yfI3Ok+gjQ/wRiJtxeHijo74XJWPvUU3gnctDCMrxriX1yGhlbC+5jHs6OgeIpEiN7q0FZHlsoOHFO3+9Ty7z/aNDLy+zw3M9A8O7QZ6U0nWe7aeV9Fq+06J2kPojSxmlUsoRJVLfN5+jkZ2+lkukIIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+xuYb44hTThozd7t0AE2QBK/E4F5AkNwF0YmGcJgyk=;
 b=KKt2YP2guCGmMqOhv+DWvF27woVVly07t26AvOJRi/ijZoEABj5mI4SRMAT7Vscby7eQLQjnntEnnne7kmtYnUTCHCYOC7stQCJRG0a1sDUM/Q4HJWFXIvB9VqROXBHEONOyzrU8jsdlc86dgtfxvweroWnsjVLmA7Ow37Spbjzozz4AaHrdMeaVOp7G+PJ4aW+ddFI3fRg0ThnQXtPsGh/F/TTvqhk/8sXrXI7iI5NuHF1c4dnkB/RnjSXrlZXiPrDxorC7k7AtFCotMQ5wlc/GJvSHBmA0Q2PM3Dglcgy8Hj9+PGBZICLzpUMEvEIqt3CFIGybsUh9RJH28TUcwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+xuYb44hTThozd7t0AE2QBK/E4F5AkNwF0YmGcJgyk=;
 b=LtXa3P/yE8kkjnAfRbaX2PMY5DB14r4Qc/iGcFvG1SsXU4G4jr6DoiqJbJ0wtMyOOzcdppaOpnpDz495h+zXyHVzJYLIXIentmU3S1+bi7NIBny9MCOkcPEVAH1gtMBLWBvL/aGMZa2H4DnZpCIdXTCYVffbvS42p8sdWMSVF9U=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS3PR01MB10405.jpnprd01.prod.outlook.com (2603:1096:604:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.29; Tue, 28 Apr
 2026 18:04:59 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 18:04:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 4/8] pinctrl: renesas: rzg2l: Add support for selecting
 power source for {WDT,AWO,ISO}
Thread-Topic: [PATCH v3 4/8] pinctrl: renesas: rzg2l: Add support for
 selecting power source for {WDT,AWO,ISO}
Thread-Index: AQHctfcmFh8ctUhlmEy+dufBE2EsubX0t0EAgABNZaA=
Date: Tue, 28 Apr 2026 18:04:58 +0000
Message-ID:
 <TYCPR01MB11332219076339FBC4B3136CD86372@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
 <20260317101627.174491-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdWs-4N1hYjHQH-g3KdmSw2t3JhhaW42A7a2nnzBqv4qSQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWs-4N1hYjHQH-g3KdmSw2t3JhhaW42A7a2nnzBqv4qSQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS3PR01MB10405:EE_
x-ms-office365-filtering-correlation-id: 72c47e45-f55b-44f9-2a45-08dea550a93d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 GlI0BVrbmVMag9k3hN4Ll/j/6Ikhg7HgrWeU1wkqgTK2PJCpp7zrIQa/o8EB1/7YLAXPsS4ZSXKikdJlPHaBOiKr5KRM48J3QmtKUNpKqknEDsqqjYioOeUmuRTTEEpkYZ3EsScIG+26lTlSxtg7gsp7V+MyrfVHqLt5SCFQxC5lIkU9PxxpIpSruNYt7bVYv60SkqSXuyOKrgn4V4HXxxZ3+65X53ZJBykDBA0K4QfCAyCaBlt/Mpf8FlmUN/B6X/f/W0SDkrZaxfi7szypIMTaBHpaFNzz8I0aGrt8OQHKNBIdKnI1oLeZj7tc1rxnbCb///QGmYY2F29Np8e5biADszw3yk9pP6W7Qfn1Vk+TSkjgm08mYtWVtHsT2sc2tTCsL+6P7TfGiLaUtVV2Sm/dm4HopHdl0qT+on9EwiKAjswjP3jvRjv//smGzddJwKVxAUVvQMfm9PLAk1w4vbFPC+HxFAQK7bJZAvjwoBpUvZn9oUF0ledjMfttEdQqzZHnUWTMkZGp3G9Tpl3dBeu5ScvbYkYh2C1Mr2U4W5WxCN6W6vhSycwI5AY8jYMRwJfcDVYTTzvP6Fkn+yOvfNK6JKY5tz9kc3lLDlWK5+d0qmsVgpTYvAdrUiuawkguU47sqsZfX8JuzgWwiMyqwR5IFWXVnB7ubmw7efzZSOkXeDRvgZ2VnkAzgRRaHyIDTCqS87vJ313guCBqPzRyR0IGkSb0PQdBClFUk8fL5QUoG4CKuqYvVc2ZV3lMwoXdcCaDRdF7Nxb1oJWkPXnHUXY6HTi0kI0fmqrUPZFK5Jc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDk3a2g4aFVYcFdORGg3UWJRYWhGQ1Q4cW1UbFJGakxwSzNaMTVaYVJzRFdT?=
 =?utf-8?B?dlJsbUlqakplSzhtNzB0U0R0U0t2Tm5keEp0VCtxeExMaVV4dDB2elNsaFFn?=
 =?utf-8?B?VXk2OEFrMjErVFBRRXB0M3NRcS90L0NTbVRGM1lna2p2WEZpSWlvTDFwNisy?=
 =?utf-8?B?WVBPUDFxSkhpZnd1UFh1aGc1aTlDZXpwVHJsWnppTlpzc3RGS3Z4MmR6VmFa?=
 =?utf-8?B?RTdEVy9LclR0WlZOTjlGKzZRMW9YdmZxenNYRzEyNHZtK0RpbFgyRXRCOEcv?=
 =?utf-8?B?bVBHRTYvM2Q4clNGRmFoUCtHWjJHRnN3ZEFxVWh4dGJnSDN3TTJsOEYwZmFh?=
 =?utf-8?B?bTJkMlBBTTJVMDFEMG40VGN4OHdRZmxFK1hpL2t2S0lnQXRvVkZ6eWJUMitR?=
 =?utf-8?B?SWxHQ3IwaVlvSkh6dGczcFZMY0RhOW5YbE1IaVFyc2xYMEx3NTNrQk9BN1JZ?=
 =?utf-8?B?a1BYa0hyRXpvODRTTmtSdGRjQjdEaVY4cnlDL240ejdmaWNPUmdyRlZSSU5Z?=
 =?utf-8?B?RkJCU1Bsa0JkMVY1YUl2K0FHVjRDYWI2OXMrTFpvWURXZGNRVjZwVjBaU3p6?=
 =?utf-8?B?V05oUmhzMHRnOFlhMjYvMEFkVVdTWERNK0NKVTFvU1ZaWHEvaDExeU51QzY3?=
 =?utf-8?B?eXMxRjcvcUJPQ051akJZYzVkaGdKMkRyVFhZUlhRNmxVbjc4SjR4WUVYN2RB?=
 =?utf-8?B?cmphNmhuaGdIcHZlY21FTVh4M1FsdVJVYjBFZ3BMQjFlVytYSHluVWk5SHB3?=
 =?utf-8?B?MVBTbUNiKy9CSFc4c29yRHQ1Z2UwaEoyS09rOWRrUjVnWWNVbWhDYmxzcTNu?=
 =?utf-8?B?cGE1dWRaNEpxd1AwUzBJSFA3YnJpT0t4R212NWF2WEpmbTRoVE85azZaQVFX?=
 =?utf-8?B?M28xSml0YXdldStCTktQV3BMMmMyMGtiay9uQkJJbENBajYrV04xKzUydDdP?=
 =?utf-8?B?RWdXZGw3czg1RHNNZG5QTnorZ1dCbTlXOTZLLy9kZDJlTWxNa0Y5ZHlsck1y?=
 =?utf-8?B?bksxWFoyQ2RERnVZWU1YU0lmclU1MStGNThwOHA5bHhtUWNFKzRET1VyS2xt?=
 =?utf-8?B?OCtWR2ZUNFRwOVhFNWhTbDdSUnBONGUxYXQwSyt1Y2hISDluQkVLOW4rU28r?=
 =?utf-8?B?QU1Ob2ZCNFozQ1Zmcmc5MFpFeHVqOHpWZ0dlSEo4NnZES3ZzT2hPWWQzbjkr?=
 =?utf-8?B?eGY3N3orRnpWM055akFaRjR4TTg4L21yVnJMbjdpRmdQMWlTbHNqK1NMbzJ1?=
 =?utf-8?B?Z1ovNXVlQUNFQkFUZlpOTFlqRFRkYjQyQWFQalBFb1hLdS80dU1Gck0xWVk0?=
 =?utf-8?B?OVA4cEdVUTUvRUluYlQvdjA2VHRxQll5b2UvNGNkYU1HbWF4T3V3akNWdzJN?=
 =?utf-8?B?L25GdGV6UEFNSTVuTnMrSlpkNHVqMzRlRTUyenhSdTVhV2xURlVoTTZSc1Q1?=
 =?utf-8?B?eEUzOThaM3Y1Zmp5aC9OWS9FVm5WYXpoc3BXZElqbkludXUwZmFLZzRmYVZq?=
 =?utf-8?B?VnZUaGxOa0g4YkVuQjRiMEp0YkdQVnUwOUhvVHBFOTRWQWY3Z24vNkJSZ0ZZ?=
 =?utf-8?B?UmZWbEI4Mk9CM2lTbGtZd1hXeDNsNG1YY3VnR1UxQTh6YnhZbDd1SW05UWhT?=
 =?utf-8?B?Y2NjcnFKTTNEZDIxeUNDamhka1cwdmpUZHRROWRSN3dsQmNaeENWMGo4SmFS?=
 =?utf-8?B?dFE0eENpUndGU0tEQWZVSWxydlM2Z0VmdmxjaWtVVC9sZFZRcE5BZmVWOGpO?=
 =?utf-8?B?Vi9JS1ZOOWlwb1RrbXJkN202ZFVOTFpPbjl6dWIraUp3bWJaMFF5V0YvdXk4?=
 =?utf-8?B?QWxoWVIram9FanoyWVpRQ1FGeHRIN3U2VU16WkdNdGtrM0NueUxpUEl3WE16?=
 =?utf-8?B?aEIzbWxrbUlpNEZZcUJRY0ZKRGhZTDlGdnNzT09OZy9GRmNnK3BkQ3ZwNjYx?=
 =?utf-8?B?bUxxSWpSK0NlYlRuNS9YRi9LeUZEbU42OGZ4dFdCanl0dXFBSFlkelNXci9p?=
 =?utf-8?B?SENOaXdUeXgzTlF4Q1FRV1RwSkdmN25TVzZteitCbjRITmtBUDZ0RHZCYndn?=
 =?utf-8?B?OERlOTJTMjZhVkdmbjV6ZUFpUjR1bFF1eCt5am05dVdGWnVNalhwTnJibGg4?=
 =?utf-8?B?Y2w5WUtqVGFjeE0yZ1BhU0pBalltbTBXc2c2aDNoTG1OQWtGaTR6Rk5pVWN0?=
 =?utf-8?B?ZHdMVTJzMHpDamQ2QVhOR1E1SGpNUGJ2SUhxcEJIdTJlNkkyallYQ29kWkxP?=
 =?utf-8?B?S1pCMGpYdmRrYUlpRzc4cmJXQmcwOU1GbzdNYkJ4aFZPM1dCcXdsRDJHTVZ4?=
 =?utf-8?B?RXo2Wk9HSVQya2xINnU3T0ZJWVR0MElhTGhvVENOQy81d2UzOEpOUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c47e45-f55b-44f9-2a45-08dea550a93d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 18:04:58.8374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KckThgAXft4f6zqGp0HL6poJvIyjAeQcMNi0QVS5mDowBE3cYKmHsz25T+OOsryusJ1TsCvV9k0UTWqIOEBDNk02K3SQC81SPNdSeY/GcCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10405
X-Rspamd-Queue-Id: 6F2C148A73A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35727-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,bp.renesas.com:dkim,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMTQ6MTkNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyA0LzhdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3Igc2VsZWN0
aW5nIHBvd2VyIHNvdXJjZSBmb3INCj4ge1dEVCxBV08sSVNPfQ0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIFR1ZSwgMTcgTWFyIDIwMjYgYXQgMTE6MTYsIEJpanUgPGJpanUuZGFzLmF1QGdtYWls
LmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+DQo+ID4gVGhlIFJaL0czTCBTb0MgaGFzIHN1cHBvcnQgZm9yIHNldHRpbmcgcG93
ZXIgc291cmNlIHRoYXQgYXJlIG5vdA0KPiA+IGNvbnRyb2xsZWQgYnkgdGhlIGZvbGxvd2luZyB2
b2x0YWdlIGNvbnRyb2wgcmVnaXN0ZXJzOg0KPiA+ICAgLSBTRF9DSHswLDEsMn1fUE9DLCBYU1BJ
X1BPQywgRVRIezAsMX1fUE9DLCBJM0NfU0VULlBPQw0KPiA+DQo+ID4gQWRkIHN1cHBvcnQgZm9y
IHNlbGVjdGluZyB2b2x0YWdlcyB1c2luZyBPVEhFUl9QT0MgcmVnaXN0ZXIgZm9yDQo+ID4gc2V0
dGluZyBJL08gZG9tYWluIHZvbHRhZ2UgZm9yIFdEVCwgSVNPIGFuZCBBV08uDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9y
ZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2Fz
L3BpbmN0cmwtcnpnMmwuYw0KPiA+IEBAIC02MywxMCArNjMsMTggQEANCj4gPiAgI2RlZmluZSBQ
SU5fQ0ZHX1NNVCAgICAgICAgICAgICAgICAgICAgQklUKDE2KSAvKiBTY2htaXR0LXRyaWdnZXIg
aW5wdXQgY29udHJvbCAqLw0KPiA+ICAjZGVmaW5lIFBJTl9DRkdfRUxDICAgICAgICAgICAgICAg
ICAgICBCSVQoMTcpDQo+ID4gICNkZWZpbmUgUElOX0NGR19JT0xIX1JaVjJIICAgICAgICAgICAg
IEJJVCgxOCkNCj4gPiArI2RlZmluZSBQSU5fQ0ZHX1BWREQxODMzX09USF9BV09fUE9DICAgQklU
KDE5KSAvKiBrbm93biBvbiBSWi9HM0wgb25seSAqLw0KPiA+ICsjZGVmaW5lIFBJTl9DRkdfUFZE
RDE4MzNfT1RIX0lTT19QT0MgICBCSVQoMjApIC8qIGtub3duIG9uIFJaL0czTCBvbmx5ICovDQo+
ID4gKyNkZWZpbmUgUElOX0NGR19XRFRPVkZfTl9QT0MgICAgICAgICAgIEJJVCgyMSkgLyoga25v
d24gb24gUlovRzNMIG9ubHkgKi8NCj4gPg0KPiA+ICAjZGVmaW5lIFJaRzJMX1NJTkdMRV9QSU4g
ICAgICAgICAgICAgICBCSVRfVUxMKDYzKSAgICAgLyogRGVkaWNhdGVkIHBpbiAqLw0KPiA+ICAj
ZGVmaW5lIFJaRzJMX1ZBUklBQkxFX0NGRyAgICAgICAgICAgICBCSVRfVUxMKDYyKSAgICAgLyog
VmFyaWFibGUgY2ZnIGZvciBwb3J0IHBpbnMgKi8NCj4gPg0KPiA+ICsjZGVmaW5lIFBJTl9DRkdf
T1RIRVJfUE9DX01BU0sgXA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAoUElOX0NGR19QVkREMTgzM19PVEhfQVdPX1BPQyB8IFwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBJTl9DRkdfUFZERDE4MzNfT1RIX0lTT19QT0Mg
fCBcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQSU5fQ0ZH
X1dEVE9WRl9OX1BPQykNCj4gPiArDQo+ID4gICNkZWZpbmUgUlpHMkxfTVBYRURfQ09NTU9OX1BJ
Tl9GVU5DUyhncm91cCkgXA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAoUElOX0NGR19JT0xIXyMjZ3JvdXAgfCBcDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBQSU5fQ0ZHX1BVUEQgfCBcIEBAIC0xNDYsNg0KPiA+ICsxNTQs
NyBAQA0KPiA+ICAjZGVmaW5lIFNEX0NIKG9mZiwgY2gpICAgICAgICAgKChvZmYpICsgKGNoKSAq
IDQpDQo+ID4gICNkZWZpbmUgRVRIX1BPQyhvZmYsIGNoKSAgICAgICAoKG9mZikgKyAoY2gpICog
NCkNCj4gPiAgI2RlZmluZSBRU1BJICAgICAgICAgICAgICAgICAgICgweDMwMDgpDQo+ID4gKyNk
ZWZpbmUgT1RIRVJfUE9DICAgICAgICAgICAgICAoMHgzMDI4KSAvKiBrbm93biBvbiBSWi9HM0wg
b25seSAqLw0KPiA+DQo+ID4gICNkZWZpbmUgUFZERF8yNTAwICAgICAgICAgICAgICAyICAgICAg
IC8qIEkvTyBkb21haW4gdm9sdGFnZSAyLjVWICovDQo+ID4gICNkZWZpbmUgUFZERF8xODAwICAg
ICAgICAgICAgICAxICAgICAgIC8qIEkvTyBkb21haW4gdm9sdGFnZSA8PSAxLjhWICovDQo+ID4g
QEAgLTkwNiw2ICs5MTUsMTIgQEAgc3RhdGljIGludCByemcybF9jYXBzX3RvX3B3cl9yZWcoY29u
c3Qgc3RydWN0IHJ6ZzJsX3JlZ2lzdGVyX29mZnNldHMgKnJlZ3MsIHUzMg0KPiA+ICAgICAgICAg
ICAgICAgICByZXR1cm4gRVRIX1BPQyhyZWdzLT5ldGhfcG9jLCAxKTsNCj4gPiAgICAgICAgIGlm
IChjYXBzICYgUElOX0NGR19JT19WTUNfUVNQSSkNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJu
IFFTUEk7DQo+ID4gKyAgICAgICBpZiAoY2FwcyAmIFBJTl9DRkdfUFZERDE4MzNfT1RIX0FXT19Q
T0MpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBPVEhFUl9QT0M7DQo+ID4gKyAgICAgICBp
ZiAoY2FwcyAmIFBJTl9DRkdfUFZERDE4MzNfT1RIX0lTT19QT0MpDQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBPVEhFUl9QT0M7DQo+ID4gKyAgICAgICBpZiAoY2FwcyAmIFBJTl9DRkdfV0RU
T1ZGX05fUE9DKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gT1RIRVJfUE9DOw0KPiANCj4g
ImlmIChjYXBzICYgUElOX0NGR19PVEhFUl9QT0NfTUFTSykiIHdvdWxkIGNvdmVyIGFsbCBjYXNl
cyBhdCBvbmNlLg0KDQpPSywgV2lsbCBhZGQgdGhlIGNvZGUgbGlrZSBiZWxvdywgcmV0dXJuaW5n
IG1hc2sgYXMgbWVudGlvbmVkIGluIGJlbG93IGNvbW1lbnQuDQoNCglpZiAoY2FwcyAmIFBJTl9D
RkdfT1RIRVJfUE9DX01BU0spIHsNCgkJaWYgKGNhcHMgJiBQSU5fQ0ZHX1BWREQxODMzX09USF9B
V09fUE9DKQ0KCQkJKm1hc2sgPSBCSVQoMCk7DQoJCWVsc2UgaWYgKGNhcHMgJiBQSU5fQ0ZHX1BW
REQxODMzX09USF9JU09fUE9DKQ0KCQkJKm1hc2sgPSBCSVQoMSk7DQoJCWVsc2UNCgkJCSptYXNr
ID0gQklUKDIpOw0KDQoJCXJldHVybiBPVEhFUl9QT0M7DQoJfQ0KDQo+IA0KPiA+DQo+ID4gICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgfQ0KPiA+IEBAIC05MjUsNiArOTQwLDEzIEBAIHN0
YXRpYyBpbnQgcnpnMmxfZ2V0X3Bvd2VyX3NvdXJjZShzdHJ1Y3QgcnpnMmxfcGluY3RybCAqcGN0
cmwsIHUzMiBwaW4sIHUzMiBjYXBzDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBwd3JfcmVn
Ow0KPiA+DQo+ID4gICAgICAgICB2YWwgPSByZWFkYihwY3RybC0+YmFzZSArIHB3cl9yZWcpOw0K
PiA+ICsgICAgICAgaWYgKHB3cl9yZWcgPT0gT1RIRVJfUE9DKSB7DQo+ID4gKyAgICAgICAgICAg
ICAgIHUzMiBwb2MgPSBGSUVMRF9HRVQoUElOX0NGR19PVEhFUl9QT0NfTUFTSywgY2Fwcyk7DQo+
ID4gKyAgICAgICAgICAgICAgIHU4IG9mZnMgPSBmZnMocG9jKSAtIDE7DQo+IA0KPiBZZXN0ZXJk
YXkgSSB0aG91Z2h0ICJXaHkgbm90IHN0b3JlIHRoZSBiaXQgbnVtYmVyIGl0c2VsZj8iLCBidXQg
YWZ0ZXIgYSBuaWdodCBvZiBzbGVlcCwgSSBoYWQgbXkgYWhhLQ0KPiBtb21lbnQuLi4NCg0KSG9w
ZSwgaXQgZGlkIG5vdCBkaXN0dXJiIHlvdXIgc2xlZXAuDQoNCj4gV2hpbGUgY2xldmVyLCBpdCBp
cyByYXRoZXIgZnJhZ2lsZSB0byByZWx5IG9uIHRoZSB0aHJlZSBQSU5fQ0ZHXyogdmFsdWVzIHRv
IG1hdGNoIHRoZSBvcmRlciBvZiB0aGUgYml0cw0KPiBpbiB0aGUgT1RIRVJfUE9DIHJlZ2lzdGVy
cy4NCj4gU28gcGxlYXNlIGNoZWNrIHdoaWNoIFBJTl9DRkdfKiBmbGFnIGlzIHNldCBpbnN0ZWFk
Lg0KPiANCj4gUGVyaGFwcyByemcybF9jYXBzX3RvX3B3cl9yZWcoKSBzaG91bGQgcmV0dXJuIGJv
dGggYSByZWdpc3RlciBvZmZzZXQgYW5kIGEgYml0bWFzaywgdG8gYmUgdXNlZCB3aXRoDQo+IGZp
ZWxkX3ByZXAoKSBhbmQgZmllbGRfZ2V0KCk/DQoNCk9LLiBJdCB3aWxsIGJlIGp1c3QNCg0KCWlm
IChwd3JfcmVnID09IE9USEVSX1BPQykNCgkJdmFsID0gZmllbGRfZ2V0KG1hc2ssIHZhbCk7DQoN
Cg0KDQo+IA0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgdmFsID0gKHZhbCA+PiBvZmZzKSAm
IDB4MTsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICBzd2l0Y2ggKHZhbCkgew0K
PiA+ICAgICAgICAgY2FzZSBQVkREXzE4MDA6DQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAx
ODAwOw0KPiA+IEBAIC05NDMsNiArOTY1LDcgQEAgc3RhdGljIGludCByemcybF9zZXRfcG93ZXJf
c291cmNlKHN0cnVjdCByemcybF9waW5jdHJsICpwY3RybCwgdTMyIHBpbiwgdTMyIGNhcHMNCj4g
PiAgICAgICAgIGNvbnN0IHN0cnVjdCByemcybF9od2NmZyAqaHdjZmcgPSBwY3RybC0+ZGF0YS0+
aHdjZmc7DQo+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgcnpnMmxfcmVnaXN0ZXJfb2Zmc2V0cyAq
cmVncyA9ICZod2NmZy0+cmVnczsNCj4gPiAgICAgICAgIGludCBwd3JfcmVnOw0KPiA+ICsgICAg
ICAgdTggcG9jX3ZhbDsNCj4gPiAgICAgICAgIHU4IHZhbDsNCj4gDQo+IHU4IHBvY192YWwsIHZh
bDsNCg0KT2ssDQoNCj4gDQo+ID4NCj4gPiAgICAgICAgIGlmIChjYXBzICYgUElOX0NGR19TT0ZU
X1BTKSB7DQo+IA0KPiA+IEBAIC05NzAsNiArOTkzLDE3IEBAIHN0YXRpYyBpbnQgcnpnMmxfc2V0
X3Bvd2VyX3NvdXJjZShzdHJ1Y3QgcnpnMmxfcGluY3RybCAqcGN0cmwsIHUzMiBwaW4sIHUzMiBj
YXBzDQo+ID4gICAgICAgICBpZiAocHdyX3JlZyA8IDApDQo+ID4gICAgICAgICAgICAgICAgIHJl
dHVybiBwd3JfcmVnOw0KPiA+DQoNClNpbmNlIGl0IGlzIHJlYWQgbW9kaWZ5IHdyaXRlLCBJIHBs
YW4gdG8gdXNlIGd1YXJkIGhlcmUNCmJ5IG1vdmluZyBwb3dlcl9zb3VyY2UuIEhvcGUgaXQgaXMg
ZmluZSBmb3IgeW91Lg0KDQoNCglwY3RybC0+c2V0dGluZ3NbcGluXS5wb3dlcl9zb3VyY2UgPSBw
czsNCg0KCWd1YXJkKHJhd19zcGlubG9jaykoJnBjdHJsLT5sb2NrKTsNCg0KPiA+ICsgICAgICAg
aWYgKHB3cl9yZWcgPT0gT1RIRVJfUE9DKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHUzMiBwb2Mg
PSBGSUVMRF9HRVQoUElOX0NGR19PVEhFUl9QT0NfTUFTSywgY2Fwcyk7DQo+ID4gKyAgICAgICAg
ICAgICAgIHU4IG9mZnMgPSBmZnMocG9jKSAtIDE7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
ICB2YWwgPSByZWFkYihwY3RybC0+YmFzZSArIHB3cl9yZWcpOw0KPiANCj4gaWYgKHBvY192YWwp
DQo+ICAgICB2YWwgKz0gQklUKG9mZnMpOw0KDQpBc3N1bWUgJysnICBpcyBhIHR5cG8sIGl0IHNo
b3VsZCBiZSAnfCcNCg0KPiBlbHNlDQo+ICAgICB2YWwgJj0gfkJJVChvZmZzKTsNCg0KDQpUaGFu
a3MsIG5vdyB0aGUgY29kZSBpcyBtdWNoIHNpbXBsZXIuDQoNCkNoZWVycywNCkJpanUNCg==


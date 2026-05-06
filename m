Return-Path: <linux-gpio+bounces-36314-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJeTEBFx+2m7bAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36314-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:49:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0356A4DE46C
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5911830166E8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 16:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540B1494A00;
	Wed,  6 May 2026 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gRDJgxxf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E0481224;
	Wed,  6 May 2026 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086107; cv=fail; b=EqNw7tIOH9NOIUMFJALRhyatt1/6b/PhWhCC4gmqeYNohXKOC11Nf2Fw095RNeWdm9fHpBdmCfsu9oX0+Uq44wOM7j5ZQJTDs7R43x+eILnMj/bvKAk5QF+GHJUn9mxH9SYIA7LKXjbUE99dnEj7Ohjj3zR/MpArRADsCpatWW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086107; c=relaxed/simple;
	bh=7YlZZezAOzCSmkTRgN45wme4FrRSIfNCFnrlhrWiC84=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b2HEMh2NzPq6/4Nk+Lau2Pf6m/RIr6Q8SvKErmgP2SzgcE9E2xS7UkttcsRLZ+qcRXJNqgssbuqoGdQrdrqQSoB+C/9iqyPVxL2sd+qG5ukIwf7IWFZ/eWj510I1tz9QFM9NWSK/YG0y140LpsNicH86t+D1OW5UMY9IQ+79KZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gRDJgxxf; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0EBF8fSonNJnOrSrbTk43YC479ybUKQeh6f77eY90XoFihyPONRJFXME1o0p3X7RPUXXojKB/s/CTyQPv9iDMlKflnZCaILK1e/FK1zlp3Q3IfmePosJ3/8qYGhy/xbllGObPj2brWM/GBxBMxU3V+FZMV/eONIy2fl2vtfL2fzu6VWvhjeNYtNtXxXB24SispMnVKmUKuFSFNeDx3YZmNXxjovXHgs/24HxERxDmVFzhh/CsjX8py1x8SXdl61nxdXqpc5n2kgY/H/xp6NgBXbD1CPOmt3TQ3PEyjkaF7NUMf5ObgTvIY9QUaiMtJNzHVe5tiIoCuqD8Ogfyy9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YlZZezAOzCSmkTRgN45wme4FrRSIfNCFnrlhrWiC84=;
 b=W0hY+JTa31bhwEVB1uMudXPu0oLb9TVdTdSjFO/bZzX9TW++rFHemi1wwoPRbSIfJSYGWJiTdNFAF7AFV72L1LhFLbuvJYVucarmvEZ3NrPmek+s49l5jM+uX/57/JLTYyEqOLjZK61rYMnr/kJPLqm6gkysmFlp6f/gSdX4rxXiz8ivW0dDVlE9cCBIGfWJMCyoL2WNNB8AuVCEjYTyt/lhKpII13OVs/cdQ0zBxugA/lMh3F2Z9JGuVlp2ZKryOa0XmScBoncsieYP+nkBrNldDcny8ALVSyqu0kxROSVecR0om9JSYGHET14K3z9qY+79TwPeJu3NxnzJDfgfBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YlZZezAOzCSmkTRgN45wme4FrRSIfNCFnrlhrWiC84=;
 b=gRDJgxxfVkKb0rj3z35VajZfnAf57Q5s0JCTbLa6pcop+i/IBEp1Kn/tyWIBOYo+hRqrGqN+EluxsHHRQFbpeYO/KP8hiw42s9yu0BBdMzoy68Y2zLryRyVFracTM6ZacuLtqjYVLjcXDobJqgj7ge0ZtdM7XtxcBUXjJ1owLFQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10156.jpnprd01.prod.outlook.com (2603:1096:400:1db::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 16:48:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:48:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 3/7] pinctrl: renesas: rzg2l: Add support for selecting
 power source for {WDT,AWO,ISO}
Thread-Topic: [PATCH v4 3/7] pinctrl: renesas: rzg2l: Add support for
 selecting power source for {WDT,AWO,ISO}
Thread-Index: AQHc2ISOvKo5VPBry0uYLlj8srH6ILYBK/sAgAAS42A=
Date: Wed, 6 May 2026 16:48:20 +0000
Message-ID:
 <TY3PR01MB11346F523431D096E2AA361B7863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
 <20260430093422.74812-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUaTUWUNYBOFe_6Ri1_riRutUZ9VEfz37RJV5UXS=Vg0Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUaTUWUNYBOFe_6Ri1_riRutUZ9VEfz37RJV5UXS=Vg0Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10156:EE_
x-ms-office365-filtering-correlation-id: 9dee2b3d-6515-45a4-277e-08deab8f47a7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 QkDQa4S0cngv4ytfOFJIJdGCwdYNuVvEr0muHCBFqnaUAtFhHVP4q7Et96qvW2bQ9tRlWGlSX9o7nhm1Vk9/7vZVxqm9tZDJPu+d2DZBvKYHC5iVGxSQGVHdToUKt1zDnYX0+uGUodvZpAdAeez1Dz2zKp9+rGzYerWuB9f8KcOfHSBwBYEkCYQN2l4r3l2OGZ6+eESQSgwmE1cr7WHxgzpGUhdYnBjlK/O4xPYITQL1DivooArgoZ1a2VyNxBS07dxKCuT4pd8RDwPYX2mWXEcRzQLe4/HzIRVo9BO7XbqXuAPyfMgDf4NyygcKVliz/d2/uC/txoEMZ+pbfH4eYgCYEZUgxGpFhnfZojs67/E9+kq1LnaHunWifHtTvbdI0wLTDTKej7271gAdvrYwoGstJNUHhI8FkAfu6LNytSFOAOniQI6MTcWVODVXPPOVaUYXuUlJXlq6gLr07KEJmweA9brJ8ypj1YG9mTsxSUaDGPhs+d4/b/vFHlFk0aECUGN7SfZZg8Nz+ZG76k/i87089guAEH1ciIjTHLqO2oMOe4fej8CEkTGJelkI4C+FohN1XtTDSNLlOmwCmIaTXWS7a/9TVVHMA+Oiry4PlKgcsj1jEAJsOBjAw98pKiWiVkLK9/BhTN/MWKKCI8UagyoSTltUgeVz3YHBS3ekHL7K/PbOBwTH0bPQxEmmzk3bXLkuJ17Ay6Aga442S2Pc5NSgtEh34NFiBYs9BQLzOiTQPdLdvAqOtokDu/miwmli
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjNkbUhrcGtCSWl2cWNoVmtWRHRYMGFONDlVVmlmNlFFK2NWOWo4aW9JMGNR?=
 =?utf-8?B?M2N0dDF3VFdBS3dPSXFVYUZPalN1Z0V5MWdCWVBWV1N1dmpxL1FQemozUXkv?=
 =?utf-8?B?SDc1aDUvbTBVenc3OE9nZDRESDhqWnIxYmtCaWx6MDJKMUdoYk01RVdCQWhV?=
 =?utf-8?B?Vmc3dy9lV0NESjhpWDBLL0pqSGFaVUQySDdiQW8xZmNUTHFjcnhyZjhUQXU1?=
 =?utf-8?B?czJVeGxCSjBZOXU0Q2hXTnBiYVZBb0svZWtPbmdtbnk3eGphajY3ZzlsT0Ex?=
 =?utf-8?B?bnhmV3NSS1NyeEhIeVR1bUhRaklUTkNxWU9LNThhcW9wUlptYmsvaFg2MElZ?=
 =?utf-8?B?UUc5QUNHaG9VeE1SUlJTUlNxSC9LSmtWVTJhUkJGQW14dTl3ZTQyMFNWNzJW?=
 =?utf-8?B?WHY5TWtIQW9hdGFUemZHSElvVk15amhZeHlxZ04zRGVoVmRkZlJ4aXQxbG8z?=
 =?utf-8?B?VDdRNXVONERFQVhFbXd3dGRkOHRjNGdnVnMwTm5Td2NiNXplOWl6MjhTYzY0?=
 =?utf-8?B?UGFXN1g1Z1YyOUphUFI1c2hKYkY1blJYMm5iZmxmY1R4ZFMrUXF2bEoxT21X?=
 =?utf-8?B?MnFKd3AxUVVNeW1zZFZyTDJ6bWEyMlgzZjF3MEVwREJPMUllSkRFWEZTbXR1?=
 =?utf-8?B?MW1ZU2JDK1NtMDVKaGRjV2I4UjlVd285bjkvMW01VVRveTFwR09UcTNZYWdY?=
 =?utf-8?B?c05TTHNrekNaV0lUUFJGa3Z5QmNVOUZCdmN1RkNodWR3MnprVVRGTmFnTGs5?=
 =?utf-8?B?MUszd2dvdWRJOU1QcmpybkVLWDExLytENFFpYzVsQWc5MjV5SjVrVnN3NHFs?=
 =?utf-8?B?VjJMLzFNOG9lREhTZ2JuRkpDVnR3YjN6bnluN1FMd05kdTZVZjVyMG1XcG8r?=
 =?utf-8?B?SGlNQlRXMUdlN0pEekErTXJnT041QW5PNHV6eXhZenJxcVh0ZXpYU1BjZWdt?=
 =?utf-8?B?Znk4RXJCNE0wWHdFYm5MRzVzalpMb25xbHhOa2twaU5pOGtlRmxUMWpUcFhR?=
 =?utf-8?B?R3hucjFmWm9sUHg2Yk1mZ0tkeVQ3Ujcrb0tpVDBseWFyQXptaTBNMUJKNHBK?=
 =?utf-8?B?Ykl4aGhtb1g0eldIZ3pSQlFhajl4RldmOEF2ZjB3anUyOE1NTVlVYmZxSDVY?=
 =?utf-8?B?UXBmbml1OStXSWdOWDkwem9qRHh0L3pzVTNxU2xLUGxOdUErV0VIOEhtVlFq?=
 =?utf-8?B?RGlOZXNtL3dMcUVPZmFnUW1Ycm9YYXBlQ2d4T3ZpS29qRUNKK1o3NHpDVEli?=
 =?utf-8?B?S0I1dTlkcUpmSVpYZVp5NEsyR2ZxWGhCVDRHUGxHd3hzRFU4WkczU00vNWRm?=
 =?utf-8?B?VmFTR2NjSktrcU1yQU15WXdEVjdnUlNKalpUcmluampFSllYTmJNempuQ0Z6?=
 =?utf-8?B?Z3Y3ekJHRGFjcFNiVUNWNDhjZWtNOWx3OU5TTEZqWmY0M1RuL2t4SERBZnQw?=
 =?utf-8?B?YVhTNDBOZld1UCtTcjVNRW5qblYwZXJ0b3JlWHRkQk0rYkZlMVNvTkNyamJM?=
 =?utf-8?B?MDJ2bzZHY2ptUXpyKy82amkyZ09QQS9YRzRsQmRTZjhkd0RGQkRQNFgvRS9P?=
 =?utf-8?B?SnNWVzE3bzVCT1lYL1p2cFdhSlUvQ2poVTFnM2xuemxEK1JWMVVSaVB6V0xK?=
 =?utf-8?B?YVQrUldBTWQyTTRFMzFxeGZqa0lTQVFCNHJ0QjVzdDRYeFlMQ0JpRUwxTlgr?=
 =?utf-8?B?bXVEOHhvaXZzOThsSFk1THZ4bE5Wc0NRSjJTWkFYNjc5U1VyTkh2RmtSZGpx?=
 =?utf-8?B?M1RXRFg2cmlCNkQ5SXJub2wrV1p0Q1E3VElSd001M1UxQ0x0QThoL2tlb05F?=
 =?utf-8?B?VmFYMlFsbWx4eW5pdFp6UDlrRkQ5WHlzdXV1djVuZ0ZYVVlkSUVqTWxYNVhv?=
 =?utf-8?B?YXFEWnFQMXEwSlBzRnZzcDJTcklHTk00Q2ZxNGFROWVrb2xxL0tPcitOd3M0?=
 =?utf-8?B?ZDJCcThNS3VjMzhlZUxoSlBEdHVsVjdrUG1kaVJDeUVORHJPK0pUWVhSdXVE?=
 =?utf-8?B?SzJiTXdxYkZSSFV0bi81L0ZyK1NGay9ydWFrVThJU0RzZHNSOStQdCtQbEla?=
 =?utf-8?B?QnE4YVNGZjNxYXB3SEIrYmhMb3RkbUJlSFdnVjFGZkIvRERpSG02MmNGc0hQ?=
 =?utf-8?B?cFZWTklKWEkxaGFNbHlkTHdKcmxMWnBONDc4TFI1bkxENUlqOWlYamdrVzVE?=
 =?utf-8?B?Wmd5L1I5SUUyL2s2ZEU5amdEcEdMQjlWa2ltSGFsT2VkR1dCQWhCMzJQU0ta?=
 =?utf-8?B?b3o1L0ZxaHBSUjNXTmxCbTdZUm9aN1ZCMVArZzNYZHlxbHpZV2xrclZJNGIz?=
 =?utf-8?B?cUw3SnNEdkx6R0VjZSttZ3IxZWN5YWZlSVV6L00xOFRHM0tYaWk0QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dee2b3d-6515-45a4-277e-08deab8f47a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 16:48:20.3525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atEIf2655a7YFiNZsCiRare30gn1H2uW1J38R3jTDuQFbvmIbf4bPu2IsDD1NqmjZYXurmCuPunS/fWkjTkGJMZniTY9yuQGvdkXahTqDi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10156
X-Rspamd-Queue-Id: 0356A4DE46C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36314-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IE1heSAyMDI2IDE2OjM5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djQgMy83XSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogQWRkIHN1cHBvcnQgZm9yIHNlbGVjdGlu
ZyBwb3dlciBzb3VyY2UgZm9yDQo+IHtXRFQsQVdPLElTT30NCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBUaHUsIDMwIEFwciAyMDI2IGF0IDExOjM0LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5j
b20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPg0KPiA+IFRoZSBSWi9HM0wgU29DIGhhcyBzdXBwb3J0IGZvciBzZXR0aW5nIHBvd2Vy
IHNvdXJjZSB0aGF0IGFyZSBub3QNCj4gPiBjb250cm9sbGVkIGJ5IHRoZSBmb2xsb3dpbmcgdm9s
dGFnZSBjb250cm9sIHJlZ2lzdGVyczoNCj4gPiAgIC0gU0RfQ0h7MCwxLDJ9X1BPQywgWFNQSV9Q
T0MsIEVUSHswLDF9X1BPQywgSTNDX1NFVC5QT0MNCj4gPg0KPiA+IEFkZCBzdXBwb3J0IGZvciBz
ZWxlY3Rpbmcgdm9sdGFnZXMgdXNpbmcgT1RIRVJfUE9DIHJlZ2lzdGVyIGZvcg0KPiA+IHNldHRp
bmcgSS9PIGRvbWFpbiB2b2x0YWdlIGZvciBXRFQsIElTTyBhbmQgQVdPIGJ5IGV4dGVuZGluZw0K
PiA+IHJ6ZzJsX2NhcHNfdG9fcHdyX3JlZygpIHdpdGggYSBtYXNrIG91dHB1dCBwYXJhbWV0ZXIg
c28gdGhhdCBjYWxsZXJzDQo+ID4gY2FsbGVycyBjYW4gaWRlbnRpZnkgd2hpY2ggYml0KHMpIHdp
dGhpbiBPVEhFUl9QT0MgY29ycmVzcG9uZCB0byB0aGUNCj4gPiByZXF1ZXN0ZWQgZG9tYWluLiBV
cGRhdGUgcnpnMmxfZ2V0X3Bvd2VyX3NvdXJjZSgpIHRvIGV4dHJhY3QgdGhlDQo+ID4gcmVsZXZh
bnQgYml0IGZpZWxkIHZpYSBmaWVsZF9nZXQoKSB3aGVuIHJlYWRpbmcgT1RIRVJfUE9DLCBhbmQg
dXBkYXRlDQo+ID4gcnpnMmxfc2V0X3Bvd2VyX3NvdXJjZSgpIHRvIHBlcmZvcm0gYSByZWFkLW1v
ZGlmeS13cml0ZSB1bmRlciB0aGUNCj4gPiBzcGlubG9jayB3aGVuIHdyaXRpbmcgdG8gT1RIRVJf
UE9DLCBzaW5jZSBtdWx0aXBsZSBkb21haW5zIHNoYXJlIHRoZQ0KPiA+IHNhbWUgcmVnaXN0ZXIu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGRlc2Ny
aXB0aW9uLg0KPiA+ICAqIFVwZGF0ZWQgcnpnMmxfY2Fwc190b19wd3JfcmVnKCkgdG8gcmV0dXJu
IG1hc2sgaW4gYWRkaXRpb24gdG8gcmVnaXN0ZXINCj4gPiAgICBvZmZzZXQuDQo+ID4gICogRHJv
cHBlZCBmZnMoKSwgdXNpbmcgZmllbGRfZ2V0KCkgaW5zdGVhZCB0byBnZXQgUG9DIG9mZnNldCBp
bg0KPiA+ICAgIHJ6ZzJsX2dldF9wb3dlcl9zb3VyY2UoKS4NCj4gPiAgKiBTaW1wbGlmaWVkIHJ6
ZzJsX3NldF9wb3dlcl9zb3VyY2UoKSBieSB1c2luZyBtYXNrIGZyb20NCj4gPiAgICByemcybF9j
YXBzX3RvX3B3cl9yZWcoKS4NCj4gPiAgKiBBZGRlZCBzY29wZWRfZ3VhcmQoKSBmb3IgUk1XIG9w
ZXJhdGlvbiBpbiByemcybF9zZXRfcG93ZXJfc291cmNlKCkuDQo+IA0KPiBUaGFua3MgZm9yIHRo
ZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwt
cnpnMmwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwu
Yw0KPiANCj4gPiBAQCAtOTAwLDcgKzkwOSw4IEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX3Jtd19waW5f
Y29uZmlnKHN0cnVjdCByemcybF9waW5jdHJsICpwY3RybCwgdTMyIG9mZnNldCwNCj4gPiAgICAg
ICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZwY3RybC0+bG9jaywgZmxhZ3MpOyAgfQ0K
PiA+DQo+ID4gLXN0YXRpYyBpbnQgcnpnMmxfY2Fwc190b19wd3JfcmVnKGNvbnN0IHN0cnVjdCBy
emcybF9yZWdpc3Rlcl9vZmZzZXRzDQo+ID4gKnJlZ3MsIHUzMiBjYXBzKQ0KPiA+ICtzdGF0aWMg
aW50IHJ6ZzJsX2NhcHNfdG9fcHdyX3JlZyhjb25zdCBzdHJ1Y3QgcnpnMmxfcmVnaXN0ZXJfb2Zm
c2V0cyAqcmVncywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgY2Fw
cywgdTggKm1hc2spDQo+ID4gIHsNCj4gPiAgICAgICAgIGlmIChjYXBzICYgUElOX0NGR19JT19W
TUNfU0QwKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gU0RfQ0gocmVncy0+c2RfY2gsIDAp
OyBAQCAtOTEyLDYgKzkyMiwxNiBAQA0KPiA+IHN0YXRpYyBpbnQgcnpnMmxfY2Fwc190b19wd3Jf
cmVnKGNvbnN0IHN0cnVjdCByemcybF9yZWdpc3Rlcl9vZmZzZXRzICpyZWdzLCB1MzINCj4gPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIEVUSF9QT0MocmVncy0+ZXRoX3BvYywgMSk7DQo+ID4gICAg
ICAgICBpZiAoY2FwcyAmIFBJTl9DRkdfSU9fVk1DX1FTUEkpDQo+ID4gICAgICAgICAgICAgICAg
IHJldHVybiBRU1BJOw0KPiA+ICsgICAgICAgaWYgKGNhcHMgJiBQSU5fQ0ZHX09USEVSX1BPQ19N
QVNLKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChjYXBzICYgUElOX0NGR19QVkREMTgzM19P
VEhfQVdPX1BPQykNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAqbWFzayA9IEJJVCgwKTsN
Cj4gPiArICAgICAgICAgICAgICAgZWxzZSBpZiAoY2FwcyAmIFBJTl9DRkdfUFZERDE4MzNfT1RI
X0lTT19QT0MpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgKm1hc2sgPSBCSVQoMSk7DQo+
ID4gKyAgICAgICAgICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAqbWFz
ayA9IEJJVCgyKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBPVEhFUl9QT0M7
DQo+ID4gKyAgICAgICB9DQo+IA0KPiBZb3UgY291bGQgYWx3YXlzIHJldHVybiBhIHByb3BlciB2
YWx1ZSBpbiAqbWFzay4uLg0KDQpPSy4NCg0KPiANCj4gPg0KPiA+ICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+ID4gIH0NCj4gPiBAQCAtOTIwLDE3ICs5NDAsMjAgQEAgc3RhdGljIGludCByemcy
bF9nZXRfcG93ZXJfc291cmNlKHN0cnVjdA0KPiA+IHJ6ZzJsX3BpbmN0cmwgKnBjdHJsLCB1MzIg
cGluLCB1MzIgY2FwcyAgew0KPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IHJ6ZzJsX2h3Y2ZnICpo
d2NmZyA9IHBjdHJsLT5kYXRhLT5od2NmZzsNCj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCByemcy
bF9yZWdpc3Rlcl9vZmZzZXRzICpyZWdzID0gJmh3Y2ZnLT5yZWdzOw0KPiA+ICsgICAgICAgdTgg
dmFsLCBtYXNrOw0KPiA+ICAgICAgICAgaW50IHB3cl9yZWc7DQo+ID4gLSAgICAgICB1OCB2YWw7
DQo+ID4NCj4gPiAgICAgICAgIGlmIChjYXBzICYgUElOX0NGR19TT0ZUX1BTKQ0KPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gcGN0cmwtPnNldHRpbmdzW3Bpbl0ucG93ZXJfc291cmNlOw0KPiA+
DQo+ID4gLSAgICAgICBwd3JfcmVnID0gcnpnMmxfY2Fwc190b19wd3JfcmVnKHJlZ3MsIGNhcHMp
Ow0KPiA+ICsgICAgICAgcHdyX3JlZyA9IHJ6ZzJsX2NhcHNfdG9fcHdyX3JlZyhyZWdzLCBjYXBz
LCAmbWFzayk7DQo+ID4gICAgICAgICBpZiAocHdyX3JlZyA8IDApDQo+ID4gICAgICAgICAgICAg
ICAgIHJldHVybiBwd3JfcmVnOw0KPiA+DQo+ID4gICAgICAgICB2YWwgPSByZWFkYihwY3RybC0+
YmFzZSArIHB3cl9yZWcpOw0KPiA+ICsgICAgICAgaWYgKHB3cl9yZWcgPT0gT1RIRVJfUE9DKQ0K
PiANCj4gLi4uIHNvIHlvdSBjb3VsZCBkcm9wIHRoaXMgY2hlY2suLi4NCg0KT0suDQoNCj4gDQo+
ID4gKyAgICAgICAgICAgICAgIHZhbCA9IGZpZWxkX2dldChtYXNrLCB2YWwpOw0KPiA+ICsNCj4g
PiAgICAgICAgIHN3aXRjaCAodmFsKSB7DQo+ID4gICAgICAgICBjYXNlIFBWRERfMTgwMDoNCj4g
PiAgICAgICAgICAgICAgICAgcmV0dXJuIDE4MDA7DQo+IA0KPiA+IEBAIC05NTgsMjUgKzk4MSwz
NyBAQCBzdGF0aWMgaW50IHJ6ZzJsX3NldF9wb3dlcl9zb3VyY2Uoc3RydWN0DQo+ID4gcnpnMmxf
cGluY3RybCAqcGN0cmwsIHUzMiBwaW4sIHUzMiBjYXBzDQo+ID4NCj4gPiAgICAgICAgIHN3aXRj
aCAocHMpIHsNCj4gPiAgICAgICAgIGNhc2UgMTgwMDoNCj4gPiAtICAgICAgICAgICAgICAgdmFs
ID0gUFZERF8xODAwOw0KPiA+ICsgICAgICAgICAgICAgICBwb2NfdmFsID0gUFZERF8xODAwOw0K
PiA+ICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAgIGNhc2UgMjUwMDoNCj4gPiAg
ICAgICAgICAgICAgICAgaWYgKCEoY2FwcyAmIChQSU5fQ0ZHX0lPX1ZNQ19FVEgwIHwgUElOX0NG
R19JT19WTUNfRVRIMSkpKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiA+IC0gICAgICAgICAgICAgICB2YWwgPSBQVkREXzI1MDA7DQo+ID4gKyAgICAgICAg
ICAgICAgIHBvY192YWwgPSBQVkREXzI1MDA7DQo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOw0K
PiA+ICAgICAgICAgY2FzZSAzMzAwOg0KPiA+IC0gICAgICAgICAgICAgICB2YWwgPSBQVkREXzMz
MDA7DQo+ID4gKyAgICAgICAgICAgICAgIHBvY192YWwgPSBQVkREXzMzMDA7DQo+ID4gICAgICAg
ICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgICAgZGVmYXVsdDoNCj4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiAtICAgICAgIHB3cl9y
ZWcgPSByemcybF9jYXBzX3RvX3B3cl9yZWcocmVncywgY2Fwcyk7DQo+ID4gKyAgICAgICBwd3Jf
cmVnID0gcnpnMmxfY2Fwc190b19wd3JfcmVnKHJlZ3MsIGNhcHMsICZtYXNrKTsNCj4gPiAgICAg
ICAgIGlmIChwd3JfcmVnIDwgMCkNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHB3cl9yZWc7
DQo+ID4NCj4gPiAtICAgICAgIHdyaXRlYih2YWwsIHBjdHJsLT5iYXNlICsgcHdyX3JlZyk7DQo+
ID4gKyAgICAgICBpZiAocHdyX3JlZyA9PSBPVEhFUl9QT0MpIHsNCj4gPiArICAgICAgICAgICAg
ICAgc2NvcGVkX2d1YXJkKHJhd19zcGlubG9jaywgJnBjdHJsLT5sb2NrKSB7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgdmFsID0gcmVhZGIocGN0cmwtPmJhc2UgKyBwd3JfcmVnKTsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocG9jX3ZhbCkNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHZhbCB8PSBtYXNrOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbCAmPSB+bWFz
azsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB3cml0ZWIodmFsLCBwY3RybC0+YmFzZSAr
IHB3cl9yZWcpOw0KPiA+ICsgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICB9IGVsc2Ugew0K
PiA+ICsgICAgICAgICAgICAgICB3cml0ZWIocG9jX3ZhbCwgcGN0cmwtPmJhc2UgKyBwd3JfcmVn
KTsNCj4gPiArICAgICAgIH0NCj4gDQo+IC4uLiBidXQgdGhhdCB3b3VsZCBtZWFuIHlvdSB3b3Vs
ZCBhbHdheXMgZG8gYW4gUk1XLWN5Y2xlLCB3aGlsZSBvdGhlciBTb0NzIGhhdmUganVzdCBvbmUg
ZmllbGQsIGFuZA0KPiBkb24ndCBuZWVkIFJNVy4NCg0KDQpPSy4NCg0KPiANCj4gPiArDQo+ID4g
ICAgICAgICBwY3RybC0+c2V0dGluZ3NbcGluXS5wb3dlcl9zb3VyY2UgPSBwczsNCj4gPg0KPiA+
ICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiBXZSBjYW4gYWx3YXlzIHJldmlzaXQgdGhpcyBsYXRl
ciwgaWYgdGhlIG5lZWQgYXJpc2VzIGZvciBtb3JlIHZhcmlhbnRzLCBzbw0KDQpBZ3JlZWQuIFdp
bGwgcmV2aXNpdCB0aGlzIGxhdGVyLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gUmV2aWV3ZWQtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBx
dWV1ZSBpbiByZW5lc2FzLXBpbmN0cmwgZm9yIHY3LjIuDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiANCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEkn
bSB0YWxraW5nIHRvDQo+IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMNCg==


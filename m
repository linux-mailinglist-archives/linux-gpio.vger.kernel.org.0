Return-Path: <linux-gpio+bounces-13565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B4D9E5F63
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 21:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67C521884AFE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 20:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886B31AA7A5;
	Thu,  5 Dec 2024 20:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d3R5mCBf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1BC193;
	Thu,  5 Dec 2024 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733430364; cv=fail; b=NtXRuBGDsnGursUAzfhxIJClyqFea6fTeR6VpGGnjFc7QkIdnOXngkolXbR0frYrWdq15JX+Kcm/GqcrhZHOyYTcrlqUxatxcsWaVYhqQp9CpByZBK+3n1ECo/2L8wXxsxPvURPBtVteY4Aj/1+DHjx3CE6rvpCcAFQfLKNaxDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733430364; c=relaxed/simple;
	bh=/dHfI7Ov6qKM7NqbC38+iC+P1bwnlZw6Revi32yN3YM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E43DTtWLAjY0m9VHKlBXxHGrSIocVc65SjytDk/1lkGqe9A4F440q7R8WtjhShDL790b9RoTixilTyDjUaTdVNl8j4qWgiuqZNtfhUefZMuQXamyPs9w7v1mqm8kfMfD+lkVHjGuKWdAZBoDcho1io30yB2xy1fUJuPiqw0lk40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=d3R5mCBf; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATlKUOg23BpS1ab/tpwxIF7lIv1epA9rHRIHA7Yd6cOkcSjlgC9nMP2a9cmrZBbRMrNAUO5JqUO9MYUnIoYW2BFP63Ne537epBmIi9c8zoPwSHEORQvbKHfW/EqGB1ymB8uG1BeQo3xsi56RwfTspw2ModmzwKoN6pu2lvJwO2HyekGB8zk7wmEkPAeF7941866zV+s3xXyad/OFRQ1rhD1NWVbuDQ1rd2gP+k339//C0X6KOV499igJaoDrrY220X6dvjj4PDuVI+sRyCZiAjiMifsnLlvHgcEWn8zEMHpMP+VN5lHomJEcf4ZzX/xJTV9WrtGz/BEU2jhF03joWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dHfI7Ov6qKM7NqbC38+iC+P1bwnlZw6Revi32yN3YM=;
 b=XtqdLgmNU0/xUh8eLk1y1K0cReRG7NQzILfGVGWBnTISi8ZQalbIh3CaUF4jnxiBnvZkitKRl4f21Db9XQaKMQ9L+tDKT/c1iKd1/QGMPICtS86Yza1pWHromihIzUCaJ1RUkijq4Cc8Ic/Gj1NCdFHitOcggtFfcAewF2ld0QnCB7xoN9rxzQjdUBdqCtiOommzNpw+04Wp9leuxOijg2dTy38WCPZQpbkweseLHFeBFrNp/My4ht5qh/XtT1guK7owRie1pRQ8BRa/rBQwS84RlHSx46yYb7GjnHE+TeICfX+8LTmVMbtMa9g7GWfDywly+f7zoqgyx2EQ5NW8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dHfI7Ov6qKM7NqbC38+iC+P1bwnlZw6Revi32yN3YM=;
 b=d3R5mCBf/ZJiHJcgwBQ02K62GH+oNIH6+g0KFLR50+AVW7BFR+PCsFxOl9uIaYM8GnqqL350lPEv4wnHvJkMR+PYwX1ogweodfPgFdOvLpapAivEk3S+yi9+aPmbNAhDDDvxQcKUYeSZXDfZjbmK25/aPmMAcP4FIlcgwMFFfYQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB5703.jpnprd01.prod.outlook.com (2603:1096:604:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 20:25:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.014; Thu, 5 Dec 2024
 20:25:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Subject: RE: [PATCH 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Thread-Topic: [PATCH 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Thread-Index: AQHbR0DeEXIOw7QuoUGf0AfmYjrGxbLYCx6AgAACGVA=
Date: Thu, 5 Dec 2024 20:25:56 +0000
Message-ID:
 <TY3PR01MB11346A1E5E91758EC210EAFB186302@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241205180924.154715-1-biju.das.jz@bp.renesas.com>
 <20241205180924.154715-2-biju.das.jz@bp.renesas.com>
 <173342731796.360031.5918405535281995613.robh@kernel.org>
In-Reply-To: <173342731796.360031.5918405535281995613.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB5703:EE_
x-ms-office365-filtering-correlation-id: 7128c461-b0a8-4201-b4e0-08dd156b060a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFA3cFA4bWZPajRsVmYzVnFrOEVZem5xVkp4cDVaYXZVYnZqR0F1Vzg4ZnI3?=
 =?utf-8?B?Qlo1Ymx6MGtPMVVrWFU5K29BYlNraTNJcFI4M2JibzVTWFNJa1R2MmxmaFN6?=
 =?utf-8?B?bS9jUkxMWURIVk5PbkNrVm94UDFNZ0VFajhrMW1VcWU2bWpoV0YwSGRWUzFP?=
 =?utf-8?B?K2JoUHh2NGJVdFduU1duZzhYckxzYTJkdDQrTUEreWdMdVpTNEpIRHRDK1FZ?=
 =?utf-8?B?TEZUamgxbklDUGxranp3c2J3b0hidDZVWDZFeWpMWXpqZzNWU3pIV0xDek1y?=
 =?utf-8?B?TGJINWRqZ1o5ZHFmM3p0c0xlN3VWT2hrSjN3V0FkTnFHS0t5dFc4ZnVjbnFN?=
 =?utf-8?B?cUJ2Tm1qa3ZNVzY2OHJtcHhySWpTaWFybFdkL2tDcTNPeWpyY0RiMmw1VTFP?=
 =?utf-8?B?NUY3YUNKUFNmcHkyZ1YyTlVVWFEvd1VFVGQzdWI4Mk4zRzJVdWwzQVd4MmdJ?=
 =?utf-8?B?R2dHOHlrdlN6Unk3WlhlQi8wTXMvcEpoZFh1ZXlQZ3RnRHR2d2NQeUxvbytI?=
 =?utf-8?B?d3o2TGYyajFlUEk5NTlnZXE2ckFIcjZvUk8wclRpUlFNUVEzMTZZa095NXFz?=
 =?utf-8?B?ZzJmbjl0ZXQ0M3pvU0g3MUFvRlVKZU8zUndoQUkxbEFhOU4rZkc3MFBrM1Iz?=
 =?utf-8?B?UEtUOStnMGhpajVJMzA3M2swYSsxSzFWdUNkNkZVMmU2R0xKL0lLVlk3aTMr?=
 =?utf-8?B?V2ZYaU9MaWphWlFxT0FlVlFJTjlpekd0V2pGaVloVG9sMEZxUEdsTll6UHZW?=
 =?utf-8?B?Z2xmMFhTU3ViL0g2QzZPZThleEd0bHJvS3R6aGk3SDBkQVliekdEYlBkWTZQ?=
 =?utf-8?B?WGUvUUk5bVVnTmRRVDJXREVjSTJITGcwTTRWRElFamZoV3Z0MWUvUDRzTlll?=
 =?utf-8?B?Zll3cCsvY0t1Q0czc2ZqMVJraWduZEdjNi9wMnJjNFluNGFLNjQraEhWSjI5?=
 =?utf-8?B?Q1ovRVdqV1NXVXhYdEQ3R0hTL1JDVVF2c0hmcnNPRzd1WHpWTzh0dG9kRVdt?=
 =?utf-8?B?REgyY0Juczd0TktyaWZicFFUdXdqbEdCVnZ2eXNnbVZMbGlIR3cvSS9VVU9o?=
 =?utf-8?B?Vmh0TlJSbmFnY1pqUmZQRlp6Yi95RS96c1lxR3hId3YyRkhZekEyMDRnenhC?=
 =?utf-8?B?M0lGeWJOQzJjYURValY4dnJkWGE0WGNVcjN3RTg2T3EzTFdiSkZKaURkeWNB?=
 =?utf-8?B?V3NlSUgzby9NOVZEQzNDVndBM1ROSDdBRnkwNTRNbHh3clVXZWIrUFZZTmNk?=
 =?utf-8?B?RmJHN25PTlZLT1BVWnhIZU5uTzVOSnF0NGtUdm5CenNkUGsvRWIxZ1B6bGs2?=
 =?utf-8?B?Sm14THNLUjhuS3JYelVpaXVxaUtXbkMvQitGUy8zdVIwZjQxUkEvZ2ozR2tl?=
 =?utf-8?B?N0dQODNMbzlHcXRVNHBFZGpKSHk3YXpnc2k2NUVhblhFSFJndFR2Z1Jwcnpx?=
 =?utf-8?B?a3FscWhURVV0SW5mT2ljaGV6WmpnK2RGM0tSRlhxZWdoRjBYVUVOOVRDdEpP?=
 =?utf-8?B?eHQ2NCthTFBOZXJESUlZR2dLclpmWUdCeERUZWFtTXEvMWh2dzFUMVVRbCs1?=
 =?utf-8?B?eGl0RHRsaUJOcFZ6N1BJQmNsZlFLVWZ4azUyUWhGR0pvZTQ1TVdZMkxmUk93?=
 =?utf-8?B?WjBQdDM3d1BNQ05RZTF1UWozcllibHhHNHhiSDhCU3VnNlNHNWFqWk1xTDA3?=
 =?utf-8?B?RkhmV0dzcU41cnJvNThxS2ZuekErbGQzSk9YTmkwbVBBSy96WUEwUXoycWxh?=
 =?utf-8?B?M0llUGNwb1pGMVVBaDJhQUpuNVJJQlU4VkxhU1JBOEk2NUoxWFJFb3hjNHlM?=
 =?utf-8?B?N0dlOUgwc3IvTHhvTG4xU1B1ZzFyUk8vVTRuU2xwU0p0U2k0SUdzSW1mME94?=
 =?utf-8?B?YnZnVTRQSFA1eVJpYnFzci9CUGYyM3lWTkM5QXEzRmVUL3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aStLc2UrUHQ3QzRkRy91emZObVVFWmZDQ1dscVluOEY3NG1zRzZtNk95UTRI?=
 =?utf-8?B?djh2S1p6NHBjSzlSQzlUaVJlYUJZNTBxWVpFUjJGdkpBdTlVRXc5M0NxdFhN?=
 =?utf-8?B?U3Z0c3NXcGJwK0lJdkVKQjdCTjNLRENNVTFGNFd2TXdOSnFOWnMrYTVOTmdx?=
 =?utf-8?B?Wmlwam1qVEJHNU1FMGRpTkJOdFM1L0tRdjdEYXFuU3RYVjNwUHBSMWh3d2tZ?=
 =?utf-8?B?SW1QMlR3dVJzdmxyclJ4aGcyTDhSTHhacm1rYzZjTW9kNldTSTFzRkZhMnpF?=
 =?utf-8?B?Y1J5QzlrcjZGRTdNc2prQjg5SUR2RG93VDVmZ1pTUFRMQnVhUHVpUTlUc0JG?=
 =?utf-8?B?NzBGQks4aklXaXBiaGhVN0pmYTZTOTgrNWMxZDRhVTJWa2ZySGdITVNGbm54?=
 =?utf-8?B?ZDE3eEdQeUxZSkhpUFRNbGduWUhrcWR2MnRMUGx1WkcxOTV5c2F2RlJuaEtm?=
 =?utf-8?B?K1RpZ1NUR2c0eWQ1bW0rMUZjcm8ybkhlREFGRTlyUzdnRC9WQXd0bGNrM1dP?=
 =?utf-8?B?d3BqKzJqQmhFT0FpdGZFeldlVjV0L3dxUTBzVkhXQWgzR3pTUkRHQThDRG9h?=
 =?utf-8?B?d2VIYnZONEZZU21HTlV0a1NQSTdXblpXTWpzL1Y1SndzdjBObTZyWkl0QW9t?=
 =?utf-8?B?QXR5VC82bGNDaU0rQWhVb0tiUmhrNVFRdERLTE45djFENXNiaUZWR051QU13?=
 =?utf-8?B?QmxaMjZ3dGd3VHRKd09UZVNvWGQrNVhKbG1lOGRneXpHN1hEMlY2cDVxZytJ?=
 =?utf-8?B?RjZrVTBRVUh6WlNUVmNmU3AwOWxpdXJ2MncreURvc0p5VCtNZTliZFM2cjFa?=
 =?utf-8?B?TFVwaDJkRW92OTFQU2hGOWk1MWJFWUo0YkU3RGRvWlRJK1dGZ2dQdW9YbVVy?=
 =?utf-8?B?eWtEUXlNZHRMTS9SQkpBM3NCb2t4dnl5V0c3R1dSOGlJbW1RTjhDNDJtaER1?=
 =?utf-8?B?RVF5bW41SWxaUTk3NEkzKzkzWTh0MFdvYkdESms4c2tUbmNIbE5nUi94VEo4?=
 =?utf-8?B?aVd6NitsbG1jL2d4dUhtRXYrYlQ3OS9zWjM3K0FhUEVVSksvVS9TemN5TFBz?=
 =?utf-8?B?WnZXOEhXVnlwV0dET0QzVEdWZU5uZWtqcElMWStFOWU4cENTRThzMU1ENlMv?=
 =?utf-8?B?K01RYVBtSGFWSkVGZzQrclRoQ0EyWUREazFCaktzRlRGOXl2S2Q5VDE0V05W?=
 =?utf-8?B?L0VUd28xeDBIMlF3M1V3STlheXpFcXJ4ZEJaL0Zja2REOHhlWFhoOHBOQ2NN?=
 =?utf-8?B?cTM2WFowMkMyVmxiNW52a0tLQVIzeFRTNDVEOG9kTmxhUldnQ2ZUcXVjd1g1?=
 =?utf-8?B?MXF5dTVSci8xQnFWQ0ZOTkx0TkdZQ2hTcG5IS2FFVS8yU1REZVlKTjFWdmFS?=
 =?utf-8?B?TTRNTzdwNGlXNnJVaGIzckEySFJJcUVNTWNJcDN2Y2FCOWxKcUtBYW5nUUNw?=
 =?utf-8?B?VGRzcU5HVGQzR0ZmM0Z6T0Q1a00ydTBoc3grV0RKeFoyMTl6M2hGWEV6WXNT?=
 =?utf-8?B?L3o3cGkwSUIrcjRwc1hZczFQb2YrTEQvNDRhQWFJSzkza0FDSE5wK2pBQStv?=
 =?utf-8?B?RElSb0s1NzE0ZlF1SWtnOEJxcFdoNVhpejNmeXl1TnUvcjZEMFp1UXRpOWZU?=
 =?utf-8?B?NmVhV1RBcCtXSUhUMFVqU1Q1NzcrUlorbEFDU1liS0tWakxOVDdxR1Bpd3Zk?=
 =?utf-8?B?KzdOWHl0T1VLRDNOV08xOTVGaUt0MXh5MUxyNXY3TGM5VW83L1BJN0RQbU5r?=
 =?utf-8?B?VXE0Sml1eE1mQVQ3V2h4WHczRTJTbEZEeTNjVWhVUXlmUTRsUlBJZ09lWk1O?=
 =?utf-8?B?WEdkWFJqb0IyNkRwVWVYcWIrMUZGQ1AvOU5NSHlrZGliNGgzRTFIaTgzeVhV?=
 =?utf-8?B?dDdqbHFQVTFlUWE5VWczUndCSjE0RmFiYjJ2QWprVGg1bVdBQmp1MjBlbFQ1?=
 =?utf-8?B?Qk9pMTZsdXM0RWQ2Sm9MSWR3dW9EcERKczJHa0JMQ3Rzd1l4OXBBcnhBcmpa?=
 =?utf-8?B?bEZyTXZuTVAxT1AyUHVXOFVmU3JlOXZPU1l5WVdsOUJSOTdFRWh3REd0MUEr?=
 =?utf-8?B?QmRaR2lOTWowb00rNkU0MGp1VXpwQ1Y4RGx2Z0JZWHRsZzJNekxDalI2eDYz?=
 =?utf-8?B?V0d0dGh6N203djIvYUJGaTdaQ3laWHJsbUVVSTFQV3F6SlM4cmI4STVMNk9S?=
 =?utf-8?B?eUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7128c461-b0a8-4201-b4e0-08dd156b060a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 20:25:56.2940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Cu3Vmkr+JUCtTZqc63mx+6Qqmz0T4Sd7TGZjOtULBv2a2Wf9vTeR+9gmt4qBg9XKNPN3yEZTmoca/ijUn64SM30xdBuKrDY/lZ9c2Pr5K8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5703

SGkgQWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA1IERlY2VtYmVyIDIwMjQgMTk6
MzUNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiByZW5l
c2FzOiBEb2N1bWVudCBSWi9HM0UgU29DDQo+IA0KPiANCj4gT24gVGh1LCAwNSBEZWMgMjAyNCAx
ODowOToxNyArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gQWRkIGRvY3VtZW50YXRpb24gZm9y
IHRoZSBwaW4gY29udHJvbGxlciBmb3VuZCBvbiB0aGUgUmVuZXNhcyBSWi9HM0UNCj4gPiAoUjlB
MDlHMDQ3KSBTb0MuIFRoZSBSWi9HM0UgUEZDIGlzIHNpbWlsYXIgdG8gdGhlIFJaL1YySCBTb0Mg
YnV0IGhhcw0KPiA+IG1vcmUgcGlucyhQMDAtUFMzKS4gVGhlIHBvcnQgbnVtYmVyIGlzIGFscGhh
LW51bWVyaWMgY29tcGFyZWQgdG8gdGhlDQo+ID4gbnVtYmVyIG9uIHRoZSBvdGhlciBTb0NzLiBT
byBhZGQgbWFjcm9zIGZvciBhbHBoYS1udW1lcmljIHRvIG51bWJlciBjb252ZXJzaW9uLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGluY3RybC9yZW5lc2FzLHJ6ZzJsLXBpbmN0cmwueWFtbCAg
ICAgICAgfCAgNCArKy0NCj4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJsLXBp
bmN0cmwuaCAgIHwgMjUgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiANCj4gTXkgYm90IGZvdW5k
IGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6DQo+
IA0KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyemcybC1waW5jdHJsLnlhbWw6MTQ3OjEzOiBb
ZXJyb3JdIGR1cGxpY2F0aW9uIG9mDQo+IGtleSAiY29uc3QiIGluIG1hcHBpbmcgKGtleS1kdXBs
aWNhdGVzKQ0KPiANCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4gL2J1aWxkcy9y
b2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGluY3RybC9yZW5lc2FzLHJ6ZzJsLQ0KPiBwaW5jdHJsLnlhbWw6IGlnbm9yaW5nLCBl
cnJvciBwYXJzaW5nIGZpbGUNCj4gLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9yZW5lc2FzLHJ6ZzJsLXBpbmN0cmwueWFtbDoxNDc6MTM6IGZvdW5kIGR1cGxpY2F0
ZSBrZXkNCj4gImNvbnN0IiB3aXRoIHZhbHVlICJyZW5lc2FzLHI5YTA5ZzA1Ny1waW5jdHJsIiAo
b3JpZ2luYWwgdmFsdWU6ICJyZW5lc2FzLHI5YTA5ZzA0Ny1waW5jdHJsIikNCj4gbWFrZVsyXTog
KioqIERlbGV0aW5nIGZpbGUgJ0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5j
dHJsL3JlbmVzYXMscnpnMmwtDQo+IHBpbmN0cmwuZXhhbXBsZS5kdHMnDQo+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlbmVzYXMscnpnMmwtcGluY3RybC55YW1s
OjE0NzoxMzogZm91bmQgZHVwbGljYXRlIGtleQ0KPiAiY29uc3QiIHdpdGggdmFsdWUgInJlbmVz
YXMscjlhMDlnMDU3LXBpbmN0cmwiIChvcmlnaW5hbCB2YWx1ZTogInJlbmVzYXMscjlhMDlnMDQ3
LXBpbmN0cmwiKQ0KPiBtYWtlWzJdOiAqKiogW0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9NYWtlZmlsZToyNjoNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcmVuZXNhcyxyemcybC1waW5jdHJsLmV4YW1wbGUuZHRzXSBFcnJvciAxDQo+IG1ha2Vb
Ml06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQo+IG1ha2VbMV06ICoqKiBb
L2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9NYWtlZmlsZToxNTA2OiBkdF9i
aW5kaW5nX2NoZWNrXSBFcnJvciAyDQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MjUxOiBfX3N1Yi1t
YWtlXSBFcnJvciAyDQo+IA0KPiBkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2Rv
Y3MpOg0KPiANCj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZp
Y2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjQxMjA1MTgwOTI0LjE1NDcxNS0yLQ0KPiBiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbQ0KDQpJYW0gYWJsZSB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZSBh
bmQgaXMgZml4ZWQgYnkNCiAgICAgICAgICAgY29udGFpbnM6DQotICAgICAgICAgICAgY29uc3Q6
IHJlbmVzYXMscjlhMDlnMDQ3LXBpbmN0cmwNCi0gICAgICAgICAgICBjb25zdDogcmVuZXNhcyxy
OWEwOWcwNTctcGluY3RybA0KKyAgICAgICAgICAgIGVudW06DQorICAgICAgICAgICAgICAtIHJl
bmVzYXMscjlhMDlnMDQ3LXBpbmN0cmwNCisgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOWcw
NTctcGluY3RybA0KDQpJIHdpbGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMs
DQpCaWp1DQoNCg0KDQo=


Return-Path: <linux-gpio+bounces-13869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BEE9F1375
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB8F1188D57F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844071E3DEF;
	Fri, 13 Dec 2024 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VL77fGBr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30263364D6;
	Fri, 13 Dec 2024 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734110274; cv=fail; b=QjMHofzApSUr+6rDlwYzdo9/ow0NvKsxpkeAaWByU2L7Kehq7DyCeLO3uIU0c6TWGCypkghGzIIAIh482dGdqDurPVLbRVeNs0jEPisEd9vH2Z/OpxFjO6qffUrbKZKioogYoAklLZa7P2afg2E4emWSgTiLAU/NJqHK1zK8toE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734110274; c=relaxed/simple;
	bh=swadJ8h74i4HZiAn7uBb9fnJ+jCPdoNiQNAK4xH/opA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ovekuo9ZoteSaIQ7K2gfQ+r2SaXbTGULuoDrD/qvy6mVWsjkaNC5YO14Hg+NMOgsEdZXnCW3tgjrBaVtCCJxLA+4prxhzsC6+cSvG+7q6Jt1XsfFriofqOfjifTvVNhfht5k7l/cTu4Buv1ihsyctdV77qiLbBWRCyShO1XwEVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VL77fGBr; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoNHoFMt+ETxssK8E7LgJFFWaqKzHTGhB16sWfV6PV+nikGOD54229hyfcswGiKky5VRqR+3x0sGJePLX6Tfr49X9xfMeqfaP+XWVFA/T4h5laj0SSrKK15drSQhBfyRSukqxCSNmGnhOrmqTMJMat2ggWNsT7lFY+WdJq9Ll1tvEk2RdfalwR6IJK5s5V9c2ZgiZ5MjR/hk/CS7TBZDFEeEh37V718tRadiyONZeX1/5lxkDaC6O2E0jryN5t79Hr1H4BxQGjoJQQej4MwWPn21EEbay1zNSh2XRowXqlDx6bIFCSOQM4M8UEzWeZlCXCEI7eaaaF7CH6oiPHiGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swadJ8h74i4HZiAn7uBb9fnJ+jCPdoNiQNAK4xH/opA=;
 b=D1y3po1wONagKOWtSK/WnYhl4vXge2ocauy/m6vKLZZ2uWe5gthRaGSC/WxNmDIkKQxFhK1JXC50Qi0q31UNYOxr8DFtNCu/4+DZhlGtapPq4fKiCtD8W0egfcgx69vMXGcCpieczaerKrkA+xFBNo7iqnZTopumpMNg2e+qefAOOQ6pMkw4mth0Jri3TWFe5ycIcVjlFwt7sX6J6woUzjc4KrqlubHrzBdf84/M5ib1zHefH6UQTDgxXNx27aFI2qBgBowLjTQMPNOHOKuelcpefkWh5SNG11rSe3tvbSKszm4TtkckAoWbbqD7kl9DTLwWJpEdMIi8m+1mRh/Pcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swadJ8h74i4HZiAn7uBb9fnJ+jCPdoNiQNAK4xH/opA=;
 b=VL77fGBrzCRm8U6TU973ILllK/72Xn0weiMwmLR0lZ3laFO6uwfXenTno6WDsA9j0POvIVISLCGzwI6Z2yQwy//C2DCEuEpD2enhAaJ1lvxHSF8hqt6Ql/RY5BZINPbRTUKffaS9x4qpHYCH8ftw3UDp/axk59WGCQpn9LKdEuM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8415.jpnprd01.prod.outlook.com (2603:1096:604:194::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 17:17:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 17:17:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 2/4] pinctrl: renesas: rzg2l: Add support for RZ/G3E
 SoC
Thread-Topic: [PATCH v2 2/4] pinctrl: renesas: rzg2l: Add support for RZ/G3E
 SoC
Thread-Index: AQHbR8j12RRzeiyhE02Xbve3jgT1krLkWR6AgAActSA=
Date: Fri, 13 Dec 2024 17:17:38 +0000
Message-ID:
 <TY3PR01MB1134659A40A396E7104D2F5B186382@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
 <20241206102327.8737-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdX7EOVXSCuM3Y2re9pJzRJhbnF8d+_srdeAwhBu7DArdA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX7EOVXSCuM3Y2re9pJzRJhbnF8d+_srdeAwhBu7DArdA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8415:EE_
x-ms-office365-filtering-correlation-id: b40ecd5a-d1a5-4de0-d25d-08dd1b9a0b4f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NHBuaE5ZK1QvbkRqVUFWTUVDdWJLQ1RVZEVzWEFhL3ptNWhJaXhjNG1IemZP?=
 =?utf-8?B?RU5CTFF1c055K2pUdmpXNmFGZ2J4M0FVckZMaVRrd20veStOWUplalZiaGRu?=
 =?utf-8?B?MGxYb3hRVWs0RXdCTUI3VGdRYTRqRTQyNVRrT2pMOG90bnRLSVdIY3BCOWZI?=
 =?utf-8?B?LzY0SW0vbWJXT2gwaGlINERueDVyMWdvMXdCZDZxSGl4VnZmUnZFWEJRQlFT?=
 =?utf-8?B?M1RaYi9XZzlhdkFROXRheXgwS3BjbWJpd2ZmdXNwbWIzWld5QkVTbGxseG5H?=
 =?utf-8?B?L0R5MDdsYVpZU1JRNVAyYW5tY1ZQRmNhSDk5OU11Q2hNcjVhUjR3aDFWTitz?=
 =?utf-8?B?UW1CQnZTR0JDWUt4U1VWcUlBTWUyMG1LU3B2WVU0U1FySzBEcEl6UC9ic25j?=
 =?utf-8?B?MTZyblJnWDhZNUpCaTVEeTZET3dJdk51dXY3aVJCUm1lRXlCNVA5L3pmb09C?=
 =?utf-8?B?U3NjQ0pHZnhaaWpNZFFDTUJzeitjYlhhOXNaSm5jM3k1eEwvbW5mamJGd0w1?=
 =?utf-8?B?S24ya3FiRTVBYVBKYjNLVGgzOHhGK0xDcERScmtWRncwZDIyRE80ZndJU3Y1?=
 =?utf-8?B?VEVNb0tKa1E0Wm1rZDJyZ3hGWmpXQ004TW1zTWhmRnJjUlk2TWFtcHQyams1?=
 =?utf-8?B?Nlo2NmVKY1RqS0t6Q2RFeWIwbmljbVM0TlNNWkUxKzB5dzV4K2t5dXVKSWps?=
 =?utf-8?B?ZjM2NFBLWk03Sno5SXpqTUhmZWpJVWlQUlZFbGNnWFZ3RkQ1dEVsVVJyY0Zs?=
 =?utf-8?B?SzU5eVE5Yk1NVzdiQWY3ZUtZcG1kcWl5QnhLczNFZzdDckU2T3NtYVRtQnVl?=
 =?utf-8?B?VXZYZ3Z3YXE0T1lzNlBDUmFWdDdLa05WS1phSSsxb2RvcFMvNS8rNHFDZWhp?=
 =?utf-8?B?eVAzeVdYSFhzNSt2TThWbmZaK2xKdFdFSFk5d1FLQjMvYjlEVFQ4dWZ2SkFv?=
 =?utf-8?B?NUtJYUtCQTJjVUhJYjZYY1RFbm1KbXpxNXExT29PdldpQ2JMUVl5aE5KVlpT?=
 =?utf-8?B?Y09QTk1CeXZnUGRtdXhrbGxTUDlHN3E2eWVIUzB5RHZROThuVUpyakJuU0tx?=
 =?utf-8?B?dk9McnZQZFg0OFNPang2V2pFN0d5cGxqczJkbC9CSDhxZnNXVnJyVWptYm9E?=
 =?utf-8?B?RXk1MGxKaSs3MDNKZTdXTi81WEs2bHc1WWZuckdQWnpUNmRER2VOWlA3Z1RH?=
 =?utf-8?B?MERrRmRwMHE5azg5UVB0NXJHMllOL2J5ZVNIdlB3eER6eDFRS3JxSEZxRkRt?=
 =?utf-8?B?azAwakJ2NnZqeTZRZUpSVTJlRlNaU1hSZGJWSGxFZkNueDhZaG5YZFB1WS9S?=
 =?utf-8?B?MDZGOVA4ZzE0RXN1LzRUa05uZ3VQMnllVjQrKzNNMVlER3lZY1RKNnV1TGhx?=
 =?utf-8?B?ZXp6VHJFVUxRT1BvNmZOVitpVTVGNTZYK2JNZTdFbWFKcXNzZUlzMEdIdGl5?=
 =?utf-8?B?VHlTOTlkN1dGcFE2RnE0cHZTOWlNVFhvOGJQNHc5OWRVbVFSMWwxa0wyY0xi?=
 =?utf-8?B?QUhsMXdKR2REb0g4WkJwaldlZ3d4RXRJZVFNOUJKYk45QlhhcGpDNnRUUXRp?=
 =?utf-8?B?VGRQd09mOVpHSSs5OUozQm56T0ZQSkwyUkM1b01RZndGZExDa2xiTkVUeFpX?=
 =?utf-8?B?UHIzeHcyMlVGWXpXZ2J2UHczaGgxSmVhbEtyV2pTS2N1ZTNqUDMxV1o1MlFX?=
 =?utf-8?B?aWY0QllDT2FGSlBFZ1hJQTVoZVFnMERGaTA2NmZlc2ZMYitTbFRxajBjbWUy?=
 =?utf-8?B?QVNQZmZhYml2d3pHZjNaQ2UwMldNS1owMEt2SE5pUU1nMlJRaUxnWkhNcStH?=
 =?utf-8?B?dHAvcjVNS2FCUUM3cHN3NnVibFZsYkRDSWtpNG5mVXFDdmJHRWUrOUZYK1Bh?=
 =?utf-8?B?RHJrVTBlS0lQWTV4ZjBJOEJ5NHZSbmlRWFAxU1Qyd3VXSXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlBpYWxkc25hMUJGZGdZZlFxbW9vajlSYW5xVklwS2dTNlJWTjBicnBZeThn?=
 =?utf-8?B?eWxtR29xQk0xNW4yeEVXT3NXZlkwc1NYNmhVcUFlZ1ZzcmhmZGZ3Q2Q3UUlE?=
 =?utf-8?B?ZWw3YU1UdjJzTlNpZUV2N0JsakF2SDlWQmRVQXpyNHJ3dGJ0RlExYk1SUFNW?=
 =?utf-8?B?KzRaVWpvd1hDODZLTFFOS0J2WGlvNXFpN2NVZXRwSnBWbXBuaUQ0dDRFM3FX?=
 =?utf-8?B?WmR2NHEzVGp1UWVnb3RNVlEvWVJnaXBkOXlTdi92dExJc2ZQMjB0UVRXdmxC?=
 =?utf-8?B?czZBWXk2R2xZaU1jQ2d0ZjUxM294Z0t6L05yQVVZWDkvQ21TWWRwQmVDM3ow?=
 =?utf-8?B?Y3NoeEF2b2VsTm5IK1RoYXN6Uld5ZDhaS0Yzb1A4MkZyL1c0K0IyNjd4MXQ4?=
 =?utf-8?B?dStJQ2dSaEFaY2lHbHVwNnB6V3I0T1pWK29QQ25KODBKelFnM2lDVnJQM3Zv?=
 =?utf-8?B?WXpsd2o5NWM4dCtURUZSZHVqTklBdnNqSjZWR3B3K1RPMFZzRjlDTHlUSmNw?=
 =?utf-8?B?VERkN3ZoMWcwYjhwVWNyTHRoenFyYi93QnRvK09sc2Y3SGdoNU01eXFNanRn?=
 =?utf-8?B?U1MrTzdBbEVxZVhCeS9TZkhuTDNRZnphSUxOUExCb0NieGQvZXdhSmRRNlVx?=
 =?utf-8?B?M1prdTNtYytib2l4Zk91QXdaTXBxNjAvME5aMEVhdzNvMWltbGJzbEtDZmZT?=
 =?utf-8?B?ckREZ3lXMHU5V3FGekhsV3NSczU5aHdyV0JPQTl6ZTdKU3ZRSURUQzI3RzNL?=
 =?utf-8?B?QXEzYnhZME9mNloyQ0VLVlQvVWw0Y3lncUE1Qkc3V1Z2ODREOWpleGZiVThx?=
 =?utf-8?B?aFRTMzNySjFHUGk0VHhRcmF0TkRPK2dFcTdoc1hJZHVtZ1J1UkMyMVdWb2hz?=
 =?utf-8?B?NFdvS1lSTCswSHdNa3BQSTQ5REtlYTZ0WndYTHpoUkhSbXdDenp0NFNrMWwz?=
 =?utf-8?B?NEpDdGduVk9ENzVCUmxJR29oQks4OTAyOUg2eXNQanRxczNVQ3F0anRVcm1w?=
 =?utf-8?B?Rk15MW80eExQU0NKb1JkWHZmMDRpUWFLRkxzbHM1dmFlYnhpL0pwZ1lXWlZm?=
 =?utf-8?B?RTJQT1FKTFJrRitHdVQ1MHRoYnpMYzdmMVJKSHF1ajhobEFJWmQrZ09uMkI3?=
 =?utf-8?B?K2FxR2tIZ0I2ZDIzc0RsSW9FSVpPTG5vaS9SU3NRR0xIbExJQ3RldHBBZG11?=
 =?utf-8?B?bFRCZ2x5SXdkWWR2QytRdFZDRDJvRktHa0hMK0V2ODVwSnBkek8wZnNsN1JR?=
 =?utf-8?B?eFowMit4R3hEMnpIL2h1R05raVZmVTRXbE1FMFhyZXRRQkN4bm1uOTI4L0tO?=
 =?utf-8?B?KzZaYnJvN3JVby9QMi96dVRpRS9vQkJYUzA0WSsrQm9hMEJEemVwSFdjcFNl?=
 =?utf-8?B?UEVqbU9Bd0VkZ0pqcFFtQW1zY0tmdjc4VXJ0YTJTQzVTVGZBSTFhM3ZLM29M?=
 =?utf-8?B?Y1BFTEhRb00vLy92a2p4N2JRc3Vpa25uRnd4bTBWMGg4WCtUbWtWUlE5VkI2?=
 =?utf-8?B?M0lXVGRweVNNTG9FVzJ0Rm1Id2dlU05sak5tSUZmQmRuaHNQZjl5U3FSMVVK?=
 =?utf-8?B?YlZuUXJsUkxuTS9FRm40WEhEWHh4c0FoREVPNHdncDVVN1lHVHorTnQ4dStp?=
 =?utf-8?B?Vlp3aFZodXVQM3NwYXJVT2ltL0ErNGRuVHZPMHZGVVQvSjhXYkQvZXA3S0JP?=
 =?utf-8?B?YW5NeFQ4ZXlGdXQzRlJESTloRlNhVmkvNjFNQUFzSTNZbEVyUTd3UHZkK1kz?=
 =?utf-8?B?L1lDOUNzbDF3WmNLeGxnMWd1MEpqV1Y1UGp5b3IyeHF6MFRZSXZmOUVFQjZN?=
 =?utf-8?B?ZDNrVzhDa0ZvUldRQjVnSllPN3QrdGRMM0oxZWdKUTlZakpmL1ZMeExUa002?=
 =?utf-8?B?M3dJL0ZvKy9Ia1VFblVvbU9qTUd5ZDM2SUd0MXRGeUNVb1I3aGpsVkRpQnFK?=
 =?utf-8?B?M1FFK3pzR2pucUJJYjNZMUt3NCtZZFF5S1hydnhTSU1JUzZPdzduMkpwWGwy?=
 =?utf-8?B?cFBlT0p0Qk5TbEp5Z2RPdWVwZFlTVG83QUx1dXR6MUtVVXk1M1QxMFpLa2I1?=
 =?utf-8?B?ditKWk9wZU5qVm0rcnRLRFlEWW1DUFovVGZ0Wm92SktkVkJValdwOHliUjBU?=
 =?utf-8?B?MjAwZEJ4dDAvcnVWZEJ6SkxJQ3RQaEtNMFhrM1ArY3hUdGg4djNMcnJCSWNz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b40ecd5a-d1a5-4de0-d25d-08dd1b9a0b4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 17:17:38.4611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBx/bt9ygzgcZa7UljqFkmtRha1q9jvCzI5VkrPl8avpl9/QLW1fvb1JUsCM46th6oDlT4y60hC8RsgypzsOMEk/PznxMOxRURrj7t2qT5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8415

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEzIERlY2VtYmVyIDIwMjQgMTU6MzMNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAyLzRdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3IgUlov
RzNFIFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgRGVjIDYsIDIwMjQgYXQgMTE6
MjPigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
IEFkZCBwaW5jdHJsIGRyaXZlciBzdXBwb3J0IGZvciBSWi9HM0UgU29DLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVu
ZXNhcy9waW5jdHJsLXJ6ZzJsLmMNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9w
aW5jdHJsLXJ6ZzJsLmMNCj4gPiBAQCAtMjI1Miw2ICsyMzQzLDQzIEBAIHN0YXRpYyBzdHJ1Y3Qg
cnpnMmxfZGVkaWNhdGVkX2NvbmZpZ3Mgcnp2MmhfZGVkaWNhdGVkX3BpbnNbXSA9IHsNCj4gPiAg
ICAgICAgIHsgIkVUMV9SWEQzIiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNLKDB4MTQsIDcsIChQSU5f
Q0ZHX1BVUEQpKQ0KPiA+IH0sICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcnpnMmxfZGVk
aWNhdGVkX2NvbmZpZ3MgcnpnM2VfZGVkaWNhdGVkX3BpbnNbXSA9IHsNCj4gPiArICAgICAgIHsg
IldEVFVERl9DQSIsIFJaRzJMX1NJTkdMRV9QSU5fUEFDSygweDUsIDAsDQo+ID4gKyAgICAgICAg
KFBJTl9DRkdfSU9MSF9SWlYySCB8IFBJTl9DRkdfU1IgfCBQSU5fQ0ZHX1BVUEQgfCBQSU5fQ0ZH
X05PRCkpIH0sDQo+ID4gKyAgICAgICB7ICJXRFRVREZfQ00iLCBSWkcyTF9TSU5HTEVfUElOX1BB
Q0soMHg1LCAxLA0KPiANCj4gRXhjZXB0IGZvciBUYWJsZSA0LjItMTMsIHRoZXNlIGFyZSBjYWxs
ZWQgV0RUVURGQ0EgYW5kIFdEVFVERkNNIGV2ZXJ5d2hlcmUuDQoNClRoYW5rcyBmb3IgcG9pbnRp
bmcgb3V0LiBJIGhhdmUgaW5mb3JtZWQgbWFudWFsIHRlYW0gYWJvdXQgdGhpcyBpc3N1ZS4NCg0K
PiANCj4gPiArICAgICAgICAoUElOX0NGR19JT0xIX1JaVjJIIHwgUElOX0NGR19TUiB8IFBJTl9D
RkdfUFVQRCB8IFBJTl9DRkdfTk9EKSkgfSwNCj4gPiArICAgICAgIHsgIlNDSUZfUlhEIiwgUlpH
MkxfU0lOR0xFX1BJTl9QQUNLKDB4NiwgMCwNCj4gPiArICAgICAgICAoUElOX0NGR19JT0xIX1Ja
VjJIIHwgUElOX0NGR19TUiB8IFBJTl9DRkdfUFVQRCkpIH0sDQo+ID4gKyAgICAgICB7ICJTQ0lG
X1RYRCIsIFJaRzJMX1NJTkdMRV9QSU5fUEFDSygweDYsIDEsDQo+ID4gKyAgICAgICAgKFBJTl9D
RkdfSU9MSF9SWlYySCB8IFBJTl9DRkdfU1IgfCBQSU5fQ0ZHX1BVUEQpKSB9LA0KPiA+ICsgICAg
ICAgeyAiUVNEMF9DTEsiLCBSWkcyTF9TSU5HTEVfUElOX1BBQ0soMHg5LCAwLA0KPiA+ICsgICAg
ICAgIChQSU5fQ0ZHX0lPTEhfUlpWMkggfCBQSU5fQ0ZHX1NSKSkgfSwNCj4gPiArICAgICAgIHsg
IlFTRDBfQ01EIiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNLKDB4OSwgMSwNCj4gPiArICAgICAgICAo
UElOX0NGR19JT0xIX1JaVjJIIHwgUElOX0NGR19TUiB8IFBJTl9DRkdfSUVOIHwgUElOX0NGR19Q
VVBEKSkgfSwNCj4gPiArICAgICAgIHsgIlFTRDBfUlNUTiIsIFJaRzJMX1NJTkdMRV9QSU5fUEFD
SygweDksIDIsDQo+ID4gKyAgICAgICAgKFBJTl9DRkdfSU9MSF9SWlYySCB8IFBJTl9DRkdfU1Ip
KSB9LA0KPiA+ICsgICAgICAgeyAiUVNEMF9QV0VOIiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNLKDB4
OSwgMywNCj4gPiArICAgICAgICAoUElOX0NGR19JT0xIX1JaVjJIIHwgUElOX0NGR19TUikpIH0s
DQo+ID4gKyAgICAgICB7ICJRU0QwX0lPVlMiLCBSWkcyTF9TSU5HTEVfUElOX1BBQ0soMHg5LCA0
LA0KPiA+ICsgICAgICAgIChQSU5fQ0ZHX0lPTEhfUlpWMkggfCBQSU5fQ0ZHX1NSKSkgfSwNCj4g
PiArICAgICAgIHsgIlFTRDBfREFUMCIsIFJaRzJMX1NJTkdMRV9QSU5fUEFDSygweGEsIDAsDQo+
ID4gKyAgICAgICAgKFBJTl9DRkdfSU9MSF9SWlYySCB8IFBJTl9DRkdfU1IgfCBQSU5fQ0ZHX0lF
TiB8IFBJTl9DRkdfUFVQRCkpIH0sDQo+ID4gKyAgICAgICB7ICJRU0QwX0RBVDEiLCBSWkcyTF9T
SU5HTEVfUElOX1BBQ0soMHhhLCAxLA0KPiA+ICsgICAgICAgIChQSU5fQ0ZHX0lPTEhfUlpWMkgg
fCBQSU5fQ0ZHX1NSIHwgUElOX0NGR19JRU4gfCBQSU5fQ0ZHX1BVUEQpKSB9LA0KPiA+ICsgICAg
ICAgeyAiUVNEMF9EQVQyIiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNLKDB4YSwgMiwNCj4gPiArICAg
ICAgICAoUElOX0NGR19JT0xIX1JaVjJIIHwgUElOX0NGR19TUiB8IFBJTl9DRkdfSUVOIHwgUElO
X0NGR19QVVBEKSkgfSwNCj4gPiArICAgICAgIHsgIlFTRDBfREFUMyIsIFJaRzJMX1NJTkdMRV9Q
SU5fUEFDSygweGEsIDMsDQo+ID4gKyAgICAgICAgKFBJTl9DRkdfSU9MSF9SWlYySCB8IFBJTl9D
RkdfU1IgfCBQSU5fQ0ZHX0lFTiB8IFBJTl9DRkdfUFVQRCkpIH0sDQo+ID4gKyAgICAgICB7ICJR
U0QwX0RBVDQiLCBSWkcyTF9TSU5HTEVfUElOX1BBQ0soMHhhLCA0LA0KPiA+ICsgICAgICAgIChQ
SU5fQ0ZHX0lPTEhfUlpWMkggfCBQSU5fQ0ZHX1NSIHwgUElOX0NGR19JRU4gfCBQSU5fQ0ZHX1BV
UEQpKSB9LA0KPiA+ICsgICAgICAgeyAiUVNEMF9EQVQ1IiwgUlpHMkxfU0lOR0xFX1BJTl9QQUNL
KDB4YSwgNSwNCj4gPiArICAgICAgICAoUElOX0NGR19JT0xIX1JaVjJIIHwgUElOX0NGR19TUiB8
IFBJTl9DRkdfSUVOIHwgUElOX0NGR19QVVBEKSkgfSwNCj4gPiArICAgICAgIHsgIlFTRDBfREFU
NiIsIFJaRzJMX1NJTkdMRV9QSU5fUEFDSygweGEsIDYsDQo+ID4gKyAgICAgICAgKFBJTl9DRkdf
SU9MSF9SWlYySCB8IFBJTl9DRkdfU1IgfCBQSU5fQ0ZHX0lFTiB8IFBJTl9DRkdfUFVQRCkpIH0s
DQo+ID4gKyAgICAgICB7ICJRU0QwX0RBVDciLCBSWkcyTF9TSU5HTEVfUElOX1BBQ0soMHhhLCA3
LA0KPiA+ICsgICAgICAgIChQSU5fQ0ZHX0lPTEhfUlpWMkggfCBQSU5fQ0ZHX1NSIHwgUElOX0NG
R19JRU4gfA0KPiA+ICsgUElOX0NGR19QVVBEKSkgfSwNCj4gDQo+IFNEMF8qPw0KDQpPb3BzLiBJ
IHdpbGwgbWFrZSBpdCBTRDAqIHRvIG1hdGNoIHdpdGggaC93IG1hbnVhbC4NCg0KQ2hlZXJzLA0K
DQoNCj4gDQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0aWMgaW50IHJ6ZzJsX2dwaW9fZ2V0X2dw
aW9pbnQodW5zaWduZWQgaW50IHZpcnEsIHN0cnVjdA0KPiA+IHJ6ZzJsX3BpbmN0cmwgKnBjdHJs
KSAgew0KPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2MgKnBpbl9kZXNj
ID0NCj4gPiAmcGN0cmwtPmRlc2MucGluc1t2aXJxXTsNCj4gDQo+IFRoZSByZXN0IExHVE0uDQo+
IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K


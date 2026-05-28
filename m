Return-Path: <linux-gpio+bounces-37628-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MbrEw4EGGqdZggAu9opvQ
	(envelope-from <linux-gpio+bounces-37628-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:59:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EE35EF1C1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE15F30A86D9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F5438E10F;
	Thu, 28 May 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eOAV+YGQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EF38D3FF;
	Thu, 28 May 2026 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958448; cv=fail; b=cDDlhnktug8JWvLDBK+E0vVL6ESMy5p7oEqvgqdbHgRm1MFrQ+ZZxfN52vf0ey+cZnLmcaLgwa2N6pPNnYDR6IDRi+nYBmA+4dAZ03kIUEEVLBFltIxWMi3e2o6LnuNxouUVhTk6ikxuYAeparBNQrjt2hiqidBrE2clRoLg4BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958448; c=relaxed/simple;
	bh=W3uXJujFE7hdRssWdksnJmvMm1rH0xSCPHJiGKqyY9k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oJFVprTS+F3pABCOri3ta8ltWaIW8RK67yPMFo83x6gbwJWOlnQ009Qzt8Rj9BKVNFsDDayA5F0FLHVWtc66lE9eb10dQLs5YG/vb0TSuWgr6xv7Vda5v+0RS0htxNcPmDMDrhsPfD26noAv+kP1VJp0H++kOSvzouw+SvdymIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eOAV+YGQ; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmh4u6LVVz9UR1t8eVotsgezMArxkbKrSFSZLF+aOnSxWmd4UrsnuJSyeAsk2KdqzsSAVozsKVU6rBD+/Ct79Nq9mhscw0jz4hRxFqKfcPvubKDKpSCNoUJJHQ6yE4jPa4dCGnrNWhom7JzyTF3s2N871gbIfWv7rgMNUCGzOMqpURimnhT8k0InsffzTXjexkWp/gUOPSN12EsJ/A3/47tLzCvWdm7C86e9Zr4lYUd4A3nUBsIYKdcLVPhyKm21oFNPkQ71VOiHrmDu/RcD8QjdPvvJoLJ64ub5gGzqna0XHo9tMUy/GMYtPZfyketcw8GNnMhseaiaF57pC2GIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3uXJujFE7hdRssWdksnJmvMm1rH0xSCPHJiGKqyY9k=;
 b=vQCXGYA15fUiRRAUMFizifEShyoIsycfNo/DFXL9uXn1JcBPwAqQMieDz4MJG9egV9Es8I8bqfiIYRG9cll9EmsgE8tWsctRXVvFnUF6H5HuFqw2nYDkF+892JQPrr41VGx+sbTo+sA7J+2j/o9w/QnU0ZqJvnm6XQnS3lJhwVRZUo9grGXfjrm+//DSAxR+5TesjGma4LrV9MWjCebDK8XN0ZhgUI+7gF+kClBLG8YhGBy29rhNrZSjAq+2XN2E588axft2XzvsROunC/8VhG21LjpwsL/oAfgEKjrE7Lm3qQF0AD1NKFvyK331LG0OTQ0HqgLnM0q3A2SFX3r8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3uXJujFE7hdRssWdksnJmvMm1rH0xSCPHJiGKqyY9k=;
 b=eOAV+YGQ5MSBd0wU0x6Qs4lfplzBEPvzF7vQk0l6UsBankiaoF7sqzrAWBzSbhkLZY9tELwfCMfiZvU0BoYeAnMbICBwL6f94rX2hLcLb8g6Qs9eY6NIY+4RQTiSRw3igwAgDFkVJbwctFtv6ymrH2ulJIO9SkWc7AGeL45f/MI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13800.jpnprd01.prod.outlook.com (2603:1096:405:1fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 08:54:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 08:54:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linusw@kernel.org" <linusw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
Thread-Topic: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
Thread-Index: AQHc7njDSOFJlV923USesFQzr0mwDbYjFqgwgAAJRICAAABywA==
Date: Thu, 28 May 2026 08:54:00 +0000
Message-ID:
 <TY3PR01MB11346FFB9B66C033546B11C3E86092@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-3-claudiu.beznea@kernel.org>
 <TY3PR01MB113461A5FC6EEB722B947671586092@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <8df8e9dd-3d84-44af-899f-b46496506a19@kernel.org>
In-Reply-To: <8df8e9dd-3d84-44af-899f-b46496506a19@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13800:EE_
x-ms-office365-filtering-correlation-id: 8aa6b4a5-7b21-4a8b-de5a-08debc96a928
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|18002099003|22082099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 sMVf84TP3YXZ8RGh0kdNR1AtrD6uqRPWnPhVAOmbpWrpDd3Q7Q4lMWpkV/Jhqkn2USDY0+KKHc6s37Vr3X9XbUL4axPPtB/1JVWT9rheOvgXPfIIX8/HOBaLJJpG8XE5eRvwJBc/UFIu/5l+h/ErkjsIdVvdyhZqPwn/tUNjnhp/DhLkvM19+NkS1mBJDgYMYhpQYBIQMI2D/LvxCUA+Zc99A5A8sLGQTOtJ/AJZW+PUCQLUlyqmGv6k+cDT7uAmaT5GcayeRn6Sf4dCgtd6pRs3ve4xnV2uVq6VVdGuRlwnOR/Bfw2xmYDQx4N2+1TQYaRw2iyFMsgyIY26NVUawuWOTwTXy18+34hhL8drexMaVSIbR3W0lv1lyt+kGuEkT5eyrWtSnrcPYHirbxRKjzsccoMng9tN7gjFg+kBL/d5EIcE6QMMIvyBVroT/szrApxxukCFYPVJu8WyfGni4SbN1cZWr08cowPQWAr8sjN4Asu4P0HR1GU49ZMNSNsqXm7vlmhEDT5ZM06wo8wgvjhjJfedcWg9jb2zcts/X2NDdULLsCjp0kb0e7mf0C/yZMeaZfBS/22Wsl8lpSAXOF1JjJ2uw/+N16pdbd56ZZJ5xsyU6ubFdr+DxVCXu1UmPO2ftXuwzxwH+jOi46qWPtY4WM8Yd56f2/vexfQlL0LCvMxktibZSZxqpznbJTr93SudebA3MH/2PJPDtslPeUpwPp10AKFTAWmv9AjSi1uwFIAqaqjvU6rMy+6UdpuD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHFiRXVJNnB5SlFDMkp6bTIwd3hLalVlVmFzMjBaSXkwUW91N1pOWC9UandB?=
 =?utf-8?B?MmxST3Y2T3UvZDNrdko3Y1NSN3paaUtJeVJwV3J2NTI5VEpRc2M2V0J6QjRG?=
 =?utf-8?B?ZTZOYkg1azNzeC8wZHJTL1dHVnZ2Ly9zdTdud2M3U2FSckhvbWJTcEpCa2Nr?=
 =?utf-8?B?dGNKQmNHKzRHTHdpRlZoaUlvTE12Ung0OFYzM2hDWm1aMHFROVZIRzBVb2E3?=
 =?utf-8?B?cjdMMUxCdlZOUEZUVUJRYlpZUlcrNEd4d0pKeHlpNUJobnRtbXR2MEd2RUVH?=
 =?utf-8?B?dDJLWTNzWVRXeTc5OEhyMnRKYTB5MDh4cEZkeGovMzlyVDNPL29zc3loMHhF?=
 =?utf-8?B?NGU4ZE4wWnVGY3NET0l5VUJtVFIybnpSeXhXWXA4ZFY4Y1RxbDZ4d3M2YlNO?=
 =?utf-8?B?V1p2eUl6aGlFTk4vMzVnZ3d5dXE0OVk5MVhrL0xsei9iVkdPeGNoMGtGVjNQ?=
 =?utf-8?B?SGZpQ1Vwck1GdXE4aWkwQXB6R0VmN3B2U0drSXBLaGRsRkNaTm5qcnFhdWZw?=
 =?utf-8?B?NmNoVjdjQm9ySytyUy8rSGQvVS90d1hOcGJxV3FsYVZ3MSsxaHNiSUZEWWhX?=
 =?utf-8?B?T1ZHYUprM1dzL1RrZjF0NThkc1RJSGNHM09qY3dvYW5Eb3RDL1VQMjZidytk?=
 =?utf-8?B?aEdPMmtBak5RR2l1eURFZU5Db0dWUmFRd3I5Wi9qaGxLNHMzTTZud0lZU3Q4?=
 =?utf-8?B?M2hFQ3NvaE9obGtMWGpUdncyVTZpVXg3WXk0R2w5TWt2b1ZxanR0QXRHZFVT?=
 =?utf-8?B?WnhXTXpIS0xwSTR4dktEL1M0QmdhYTFzQy9kNXNEUDVBcHpxWFZQNkVQTk1H?=
 =?utf-8?B?VTJkVjR4VU9SZEQxRTNiaGFVRWNvaFRORUUyd1E5Um9lK20vK0c2L1MwQ1ZQ?=
 =?utf-8?B?ZWRBeHRLdjViVXpWMUpTZGhaZlBIZk95ZjJubGlhZi95ZUd6cVdqN0trVjJs?=
 =?utf-8?B?R2R0T0U5VzFjY3VsODd0UnRIR045bXNpb2ZZM1MwUlcxT0hKNHdMUytKd0Rj?=
 =?utf-8?B?ai9BYWVDYkFFMHZHbkh5TnlwVTBZeVNDTS9IRm1wMHg2bjdtRXBXc2dXOHNm?=
 =?utf-8?B?M0kzUmcwc1ZnSUgwT3k1MHFjOVIzVWF2V0QrWXNRcm5XenNQVlVIamo0eTVG?=
 =?utf-8?B?NEpFUG1vRzNUNUloMDdJcXdmVTNWZWZ4eVl0SWJteG1QTVp6dVFGRGpGd0tm?=
 =?utf-8?B?R0p4M0pEbmxQb1ZUTUhPM1FUSW85dnhpR2VtWUpDanI1cTlXY3V4bEVwUFB6?=
 =?utf-8?B?anE2U3owckZqQXFNU2w1Zit0bjFHZW5hWGFJU3lDbU56N1Z2cVE0VDhXdHZw?=
 =?utf-8?B?Y0JlcEhwUW81VkZEU2xRSjhvcUdscSsrUDc4OFZ2YWR3a2VMbUNGQlAyOGQ1?=
 =?utf-8?B?cmpvZWx6TFRmdkppeFc1QnpaOXZ2VkhaZUxPUFJOOFgrMWRmTTU5djFZMHVB?=
 =?utf-8?B?b0NNeXRrbE9mRVpIbnNFZ2EwbklrcGdYZDFkNW4vUXVTZGV6alE1MlhNbjRw?=
 =?utf-8?B?ZkZTdkQ0aWJISURZZzZtSWdwdDNZckk3M0EzNk5PZnNGWFg3Q29Wa3pINGw2?=
 =?utf-8?B?QVpUWExnZ0s5UDZpTlZYQmFoWUdGdDNSMkFramdDUmRRaDkwSW8zaTBuN245?=
 =?utf-8?B?cGVKOFhyT1NUbDN4aG4wYjhCa0xjU0NOQ2d3QnoxYjRORnU1UlhXREVzTnpl?=
 =?utf-8?B?THJGMExLK0JrT29CSDVpK1IyTTIra2h5SW5zaGJIdW80S0tBOHlNM2h4S1dz?=
 =?utf-8?B?Q25sN3VGL3o2S2RaUmZnK1FhRXovdUNTcElzQlQ4cTNuREZDNHR2UmFWLzZ6?=
 =?utf-8?B?WDZaMUdqNVBRU0hkZlROemdXZkZ5OTFEeStJSE1aclJpQVNnSjBHcHNPRHV0?=
 =?utf-8?B?ZGVGaWJiMVl6WHRieHFQNTAybE5xTFdrTElGVGVRNGlvemNiT3VwQ3lVUzBr?=
 =?utf-8?B?RnNtL0d5Q1h4ckxlSTAwcGlwMzRMMEQxYlVWaDV1WStPUnM2dnN1eVEzZ2N6?=
 =?utf-8?B?VWQrNTlIY1c2UW1Lc3RNVlRSaDFjTUtUVEhwTDh0dTV5TUlZa0xjcGRqSWZE?=
 =?utf-8?B?ZWZJSlU2L2YyUEtJVERQWlNKa2N6dVNqYjE2czluWTI3MnF2aHMxV0htRkM2?=
 =?utf-8?B?ZzE1NzhWc256dWM5WVVYZktoU0lUS3pJa0k4TFhRbGwxdUlkQ1V0bFNPbGJH?=
 =?utf-8?B?U2M1QjBjZVBmUmpLZWgvRnNNUXB0eDZzd3pkcVVEd25xTDU1MlBuc05qS2pr?=
 =?utf-8?B?SjBoMktTYzBqdWRYcjFIRVJYY0VFWHd6N0RWV2ZvUFM5Nnp1NE5EaHFURlQw?=
 =?utf-8?B?ckxJSW02czYxa1A3UjlNNWxSZXl6WXUzVFVUY1BkUlV1bWJaNlc1QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa6b4a5-7b21-4a8b-de5a-08debc96a928
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 08:54:00.2057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2LXCZ26K0YeLAtYkcwgoSN0bwQo+wIY7JQpTtKrz+LIYNsRFwuJ4jw3guWYCECFwxOL8ayTInnyp1XEbcd/IEI0AkWV41b0SAnwhxS6jzb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13800
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37628-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: E5EE35EF1C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI4IE1heSAyMDI2IDA5OjQ2DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi83XSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogRHJv
cCBkZWZpbmVzIHByZXNlbnQgaW4gc3RydWN0IHJ6ZzJsX2h3Y2ZnDQo+IA0KPiBIaSwgQmlqdSwN
Cj4gDQo+IE9uIDUvMjgvMjYgMTE6MTYsIEJpanUgRGFzIHdyb3RlOg0KPiA+PiBAQCAtMzgxNiw5
ICszODE0LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9od2NmZyByemcybF9od2NmZyA9
IHsNCj4gPj4gICAJLnJlZ3MgPSB7DQo+ID4+ICAgCQkucHdwciA9IDB4MzAxNCwNCj4gPj4gICAJ
CS5zZF9jaCA9IDB4MzAwMCwNCj4gPj4gKwkJLnFzcGkgPSAweDMwMDgsDQo+ID4+ICAgCQkuZXRo
X3BvYyA9IDB4MzAwYywNCj4gPj4gICAJCS5vZW4gPSAweDMwMTgsDQo+ID4+IC0JCS5xc3BpID0g
UVNQSSwNCj4gPiBBbnkgcmVhc29uIGZvciBtb3ZpbmcgdGhlIGFzc2lnbm1lbnQ/DQo+IA0KPiBJ
IHRyaWVkIHRvIGtlZXAgaXQgc29ydGVkIGJ5IHRoZSByZWdpc3RlciBvZmZzZXRzIGJ1dCBpdCBz
ZWVtcyB0aGUgcHdwciBpcyBub3QgaW4gdGhlIHJpZ2h0IHBsYWNlDQo+IGVpdGhlciBmb3IgdGhp
cy4NCg0KT2suDQoNCkNoZWVycywNCkJpanUNCg0KPiA+DQo+ID4gc3RydWN0IHJ6ZzJsX3JlZ2lz
dGVyX29mZnNldHMgew0KPiA+IAl1MTYgcHdwcjsNCj4gPiAJdTE2IHNkX2NoOw0KPiA+IAl1MTYg
ZXRoX3BvYzsNCj4gPiAJdTE2IG9lbjsNCj4gPiAJdTE2IHFzcGk7DQo+ID4gCXUxNiBvdGhlcl9w
b2M7DQo+ID4gfTsNCj4gPg0KPiA+IENoZWVycywNCj4gPiBCaWp1DQo+IA0KPiAtLQ0KPiBUaGFu
ayB5b3UsDQo+IENsYXVkaXUNCg0K


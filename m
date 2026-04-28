Return-Path: <linux-gpio+bounces-35730-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIjLJqv/8GnubgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35730-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:42:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E97F248AC7B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 574DA30A704C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354CF800;
	Tue, 28 Apr 2026 18:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PdWNEBHF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B4347B410;
	Tue, 28 Apr 2026 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401588; cv=fail; b=dbel5650l2eUfF02mdS0jO36qTR0fqaodAq8DLoFqpdlomEW+6Hrn1KITwipj2mq1ENdGdYtXAM7U0rHoV+soI2nwWkOJQOwBB1br9GVV9Lu2oqXAg6+P30Zjms4qTVCw6Xdadp/ZpWCVFecwFTE3GyNK4jQqMqPEMd2YrPuc/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401588; c=relaxed/simple;
	bh=OfMsXM+3vNJ0MOJvXo9JEqX3HVZtctZSuKvHcgSRlJU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ao6cb14/92KExeEqLHj+bFoayAt6epp4CdgGKTZaRCKRpd7s2WpYqW5lNSzAxlOG6rl8KSqjJqsio9gBhkYCThMleaSqtKZqEoGisB+qOGm6AycXGZGrTRuO5uoDdUM79S2Gy32JPQ8ir2Ee9w42ai3p2dFCZr2YLpsaBh27o/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PdWNEBHF; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbbiMUw+Jemz+1PPG8Nxi1I2/tYHT1Aw11gxjJzQw8ShIMsCpWurwyZbKV+q48rkghp9e5zBVwVtEZIJOay8I4UmaMbxgyMfrNx5h0bl3X8zJrx/X3p+v0TMlnw+fFn8w8KQ0fWuQE305ixPkj1q4A5Hx6mMccMG6xkeTxNDimuS4ihksnTvvlu01dIgfkNUAVpDKbYg0AKwQNTsfHgOaODaOr3XZafrvNHfZZ1/BuFW97XCYsVF9iAcl7lEa5385bfJuBRF6Tgm9u0NUPWpy9Xi/dIExb+YwJLT6rHuFZC8W7SL+Ix38M4VfD7ywoqCkmcfGfi3KObGdNlSO3QVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfMsXM+3vNJ0MOJvXo9JEqX3HVZtctZSuKvHcgSRlJU=;
 b=FbgGT9ANeUvWdhez7K3zzyGjYe+2+d0fCZ6XBLQwXQyFJQ7PS2FLUG/Sp+T30vFgbn5jI5QicIWyu8bIIEFAjz3sx73MlNk0bjHP48OkICYPPyVpNS9CU+8htaeppmzHso/UTOFGKO+06m+0mBquqP+hzvziLLsNgIueZmOFRQE0ESDuA1K7QKLbxfOJ7T+XRZK4kEo4WD4B+2ROddU2fZHu/rzl9nyE8kKgaZ3LCE3iwPlx6/ZlKIEwgKgM1Q0iB+3O62e/iu//Sd1g3PSbfuyc9W1TkF8zbBUprmsVjKVoHUM9t07/bIipT5z/zZzL/WU5HPl/M0Awq7eX04AFZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfMsXM+3vNJ0MOJvXo9JEqX3HVZtctZSuKvHcgSRlJU=;
 b=PdWNEBHFAO3AeQP0dvFfu4crl2dnrNJZxwsv+SZo8Br46M58876SQG4AhQ6bTrv7TuXkSkj89HzYF9YzRroRsRRUkgjg1IgqiupfKfbsQDCs1iORpKb1Ml0PrJT39TG37fZfyWhZ1wqm09bn46tfMKoeimtbgLXrploMSB+n51A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11542.jpnprd01.prod.outlook.com (2603:1096:400:400::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 18:39:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 18:39:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 7/8] pinctrl: renesas: rzg2l: Simplify
 rzg2l_pinctrl_set_mux()
Thread-Topic: [PATCH v3 7/8] pinctrl: renesas: rzg2l: Simplify
 rzg2l_pinctrl_set_mux()
Thread-Index: AQHctfcncaPax5jT40Oo/FJUPjuUvLX0t38AgABZBmA=
Date: Tue, 28 Apr 2026 18:39:44 +0000
Message-ID:
 <TY3PR01MB11346F106566EC427FF3E376A86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
 <20260317101627.174491-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdVDCSUdihaO-ciEbemRqG92f+vydC8FnVX40b+LHuuP8w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVDCSUdihaO-ciEbemRqG92f+vydC8FnVX40b+LHuuP8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11542:EE_
x-ms-office365-filtering-correlation-id: a9e00fda-baf6-4c69-f95c-08dea555842c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 8z5rNL9ypL87A9Jz6bYhnHTHXx3bCTZ5jVhT3LxLMMEQjYeCk7mwG6AXiuMaRkANO/auHtQg/UxYQdL4nF+A2DoSDW0W8GBshaEH0HRxASTQ9uAwUncGxFUQSHH5NfqciBPWjmruS5ItrPPB0BcmpWrNGSYJA//tNpsunMpfR/CAFxLrzxi9GA1zzLzcdm42fYs+2tbEvqk/YTmZqbtxqfsLkdw7Q5MLuOYLfVNOs0VEFxwZbmd1/kK/bBW5+BMcrgt6rfHUWYcHabAU8vC2jjCqAo7uUitVLoOhutFacKt87+UdAebtqYp9WorIJdYuMCT0dACb7a19uje8AImWeXseH6igiyqkn4gI16G1iS+wvoDi1XpR0ouuBogYKTbt7st/FYwPpP//FT7E73YgtPTpwzdAogH0ErkAgWCa+h0fJqnwje9BTVdrq5bXJwNNZSIwz3Jy+3SfQx5Zsk48YcWEf/2/6CFBScNGt708BpMpdV3J/jQpOBzCFyWBptAnRykZdRlnFNqifxn3H0XTBQJ01GpQfJGnmuPA6wm6NFLwebm6PMBRLX8vbvzAvi+Lkfh3iK1XXf9o9HyX6Vc9ocwjPmr9iCxvdFxcW/YRVG9X5pF40yhNHpSGkwJYTVwEtDaEYisB+e1cpmBFirNrfMUHFjo0Fc24wircZh/UP95GQ+q10uShIrHiD5eATxFhn/51BzWkO/eM3KcTZzawCQqXuISrdKZSqnk4gMT7P0Cq7PWhTEwEmYHefBzk/axuNWIHNHtxac2QOeZZsk4pjRkyD8gEAQTNA6pSUMpOYs0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkdIOHVGMTIyMlRqNTRBL3Q0cE5IMFFGamtaY01hRDRHcytpQ2huUzMxaFdO?=
 =?utf-8?B?ZXIyOGFGWHdJTWRRN1M5K05iRHpvR2ZCZ1NKd2dpM2dxYUZMamp4R3VubVFP?=
 =?utf-8?B?VWh2YlpQdlNDL3BNVUlmRWlMY1B0TERITGFrRXlwL2VFdzlzRHIvR0Z5aWVU?=
 =?utf-8?B?YUsvbU9Tdk5IeEFLVFVyb0FHTmRhN1Uwd1NMalBYc0JrRHFxQnJkWUFrMUxv?=
 =?utf-8?B?RDRZclZsSVFlSTBjZlFhM2lKNEduWkx1Z2wzaitXRnFkTjA0RUxPdTY1SFRU?=
 =?utf-8?B?VEFJSmhOY0NoQzhJUi9wOE1KVGlCUlBoK2NWZ0xXV3JHMXJUZUxWYnp6dnNN?=
 =?utf-8?B?emdkSTAwTFlEVk9vV0RCYTVKQ3JKcGpVUzFwRkdyZXB2U3JMdzhta0RQbDdL?=
 =?utf-8?B?ZHZwVzZ3bDMySGtPZFo1THV1SVdXUnRDZjhnQTl1MWVPKzFZRXF5U0pYa2dZ?=
 =?utf-8?B?V2Z3bG1IYnE0ZmdJU1psNHQvdmV5S2EvSWFwRTFzRzBFOVlaMW05N2lZcC91?=
 =?utf-8?B?eWE2SmVMNTliOUVUSmZlR1RYQm5jV1dTelJLVzhFOWlnZDZ6U1c3RE5QaFBa?=
 =?utf-8?B?YXA5aTVIaTU0dnRDdW1wMytvNmgwRGRUNDY1OUNHNmZtVzJsdndEQ0FvRkRY?=
 =?utf-8?B?YWJYd05sNkVvNllqQkgveDhLUjQzeVY0M1N6RTRESjVpRnhQYyt5N0hpV29N?=
 =?utf-8?B?emN0dG5qWUZ3Wm9BeDBRbFBCQUxPWDdTYzUxREdnM29hZHFXMmVBZHNpeVhF?=
 =?utf-8?B?RTNtekhxNGtNWEJDWENHYVN0Sy9CRTNJNEVhM1cwLzY3b0VjUjlzSlExbklL?=
 =?utf-8?B?a293ZW9kQnROc1V3N0xkTW1wbk0xbXkzbUdUdUZWcXdFTURpTVFoT0M1eU12?=
 =?utf-8?B?VmZQZGgycXpxRHJlREovRnN3bkZCaUpPL1dLZ2JqNFFmSEFnalNwVGc0S294?=
 =?utf-8?B?Z2g5Y1hZVnc5NGVFL21ZVmhGQVFWMXptUUZmSVVBYm5Wa0xqSEJSU09MUkwy?=
 =?utf-8?B?R0REOVpLdDBrYjAvdkl0bldEcktoa3pGM1FOcHkvbDJzbURLbTdhZDVnekhr?=
 =?utf-8?B?VFNnTzVIYzE3WGkrM05vUWdWZTBCS2htUEpJSjRCeTk2a2k3UkNXYnk5ODJy?=
 =?utf-8?B?Y1I4dVNWeC9BN0QrbG4yV2RLNVRwWnpLb045SitTNEQybkdXVDUvM0ZhV0JX?=
 =?utf-8?B?S1E0S3ZWa1JjSUQ2bGxTRzJYUjNNanRoejhKeGFGSVJHUTZFallZU253MlZp?=
 =?utf-8?B?V3JVYWdyL3MrMHNzdkgwNHFDLy9hOVdORE9vWnE5T0xCeGc3VnZmRzh6S1pU?=
 =?utf-8?B?dytZZjF0WEg3Z0k2NUwxbUxsRmc2M2FlR2lnTVlXL0tvSVNOVlpsV1J5VWhT?=
 =?utf-8?B?N0tNcVVVbElkUDVZR0RtKzY0d1BNUjI1QkdLYXRLczd6dkF5elpPK3FoZ1N4?=
 =?utf-8?B?SzlZaU1FR3lmUTFkVzNmRzZOMVlzaHpDQnBhUzkxWE4xWmFudnlrckh0dXd5?=
 =?utf-8?B?bzhmYStrS0daV0pQNnVQNG9Wd2ZyeDJxWFZLaVJySmdEZXFCWkZNR25uV01Q?=
 =?utf-8?B?Wm1QYTBMNVI5MXlBMzYwTDU0bldiT2lUcCtWUDdRRERtbHNJQ0Q1anZMK09Z?=
 =?utf-8?B?cW5rOGFSQnpsU2Nuc0Rmc3ZRQ3daajQvVmVyQlhSQlhMVVFGVVFqd3lGV3l2?=
 =?utf-8?B?bU1laVNrcldqWmpIWFFNWmhJUjhkN295dUhKMmtSZndvY1hGZTVYWnllMWd0?=
 =?utf-8?B?MGpjNjkxUWNMRlY4ekFNZEY3dXl3bmRNeUlPNHlJR2lEbVlhUGgzYy9SWGJ6?=
 =?utf-8?B?QnFsdWRna3UvbmNMaWNmOWRMdFRSdlB0ZjhtS21zUHc5YXR6K0ZxRnovZ3R2?=
 =?utf-8?B?bFlJNXk3VFdUV3ovOXVzNmc4eXptUjh6Um0vTVNUNUM4bGQyMEw4SnE5ZG93?=
 =?utf-8?B?WWNOUUh3ckFpV0dTc0ZBdHBIVzNmdEpFSXA2MjQrekVEbmRrSnlFQ2p1b0tm?=
 =?utf-8?B?WU13VSttUUZOS2R5SU0vWG5Pa1JIc3Irbk9wWEZVUnhnNTZNaVBOS2hUblN3?=
 =?utf-8?B?U0VqKzdRQkxNOTVpYXRhU2xqMWpGL3ZKTmRubmxPN2Z4NmxFZWJpcnhLZ1Vk?=
 =?utf-8?B?Q01OaTNkVVpWaWU3RXcwODZURkVDMEkxT0UzenpVbEZKYmVGWTZrWDN3eU5i?=
 =?utf-8?B?UXgwUlJiQjVDNjNPWFNuR09WQk5VNDYzbGRCTEdtQ0s1MGZ3dmpMZFlJQkNX?=
 =?utf-8?B?Q3RORktIVCt3bnhLN2hHc2hBdzYxRDI5TkQyY2FGeE4rYnJsYkhSejIvaTNQ?=
 =?utf-8?B?RHl2dW9FN01aaHRRQjNTOU1DUFJkNVBmejI1dmtkay9zOXhuV2NsQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e00fda-baf6-4c69-f95c-08dea555842c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 18:39:44.1085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SaPFhqc2Ntin/4beWVOKCT+R/rqjLgRqesFm1/G6lPqe4LjI5MwiGEPAVw8v5RMl4s8NVt4pc0T+z/D9BcGUixO+q/CuTC9s3E/sydQ3JM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11542
X-Rspamd-Queue-Id: E97F248AC7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35730-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,glider.be:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMTQ6MjANCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyA3LzhdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBTaW1wbGlmeSByemcybF9waW5jdHJs
X3NldF9tdXgoKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMTcgTWFyIDIwMjYgYXQg
MTE6MTYsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhlIHBvcnQgYW5k
IGZ1bmN0aW9uIHNlbGVjdG9ycyBhcmUgZXZhbHVhdGVkIG11bHRpcGxlIHRpbWVzIGluDQo+ID4g
cnpnMmxfcGluY3RybF9zZXRfbXV4KCkuIFNpbXBsaWZ5IHRoZSBmdW5jdGlvbiBieSBkcm9wcGlu
ZyBkdXBpY2F0ZQ0KPiA+IGV2YWx1YXRpb24gc3RvcmluZyB0aGVtIGluIGxvY2FsIHZhcmlhYmxl
cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJp
dmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4gKysrIGIvZHJpdmVycy9w
aW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4gQEAgLTY4MSwxNiArNjgxLDE4IEBA
IHN0YXRpYyBpbnQgcnpnMmxfcGluY3RybF9zZXRfbXV4KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0
bGRldiwNCj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBncm91cC0+Z3JwLm5waW5zOyBpKysp
IHsNCj4gPiAgICAgICAgICAgICAgICAgdTY0ICpwaW5fZGF0YSA9IHBjdHJsLT5kZXNjLnBpbnNb
cGluc1tpXV0uZHJ2X2RhdGE7DQo+ID4gICAgICAgICAgICAgICAgIHUzMiBvZmYgPSBSWkcyTF9Q
SU5fQ0ZHX1RPX1BPUlRfT0ZGU0VUKCpwaW5fZGF0YSk7DQo+ID4gKyAgICAgICAgICAgICAgIHUz
MiBwb3J0ID0gUlpHMkxfUElOX0lEX1RPX1BPUlQocGluc1tpXSk7DQo+ID4gICAgICAgICAgICAg
ICAgIHUzMiBwaW4gPSBSWkcyTF9QSU5fSURfVE9fUElOKHBpbnNbaV0pOw0KPiA+ICsgICAgICAg
ICAgICAgICB1OCBmdW5jOw0KPiANCj4gdW5zaWduZWQgaW50DQoNCk9LLCB3aWxsIGZpeCB0aGlz
IGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+DQo+ID4gLSAgICAg
ICAgICAgICAgIHJldCA9IHJ6ZzJsX3ZhbGlkYXRlX3BpbihwY3RybCwgKnBpbl9kYXRhLCBSWkcy
TF9QSU5fSURfVE9fUE9SVChwaW5zW2ldKSwgcGluKTsNCj4gPiArICAgICAgICAgICAgICAgcmV0
ID0gcnpnMmxfdmFsaWRhdGVfcGluKHBjdHJsLCAqcGluX2RhdGEsIHBvcnQsIHBpbik7DQo+ID4g
ICAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgICBkZXZfZGJnKHBjdHJsLT5kZXYsICJw
b3J0OiV1IHBpbjogJXUgb2ZmOiV4IFBTRUw6JXVcbiIsDQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgUlpHMkxfUElOX0lEX1RPX1BPUlQocGluc1tpXSksIHBpbiwgb2ZmLCBwc2VsX3ZhbFtp
XSAtIGh3Y2ZnLT5mdW5jX2Jhc2UpOw0KPiA+ICsgICAgICAgICAgICAgICBmdW5jID0gcHNlbF92
YWxbaV0gLSBod2NmZy0+ZnVuY19iYXNlOw0KPiA+ICsgICAgICAgICAgICAgICBkZXZfZGJnKHBj
dHJsLT5kZXYsICJwb3J0OiV1IHBpbjogJXUgb2ZmOiV4DQo+ID4gKyBQU0VMOiV1XG4iLCBwb3J0
LCBwaW4sIG9mZiwgZnVuYyk7DQo+ID4NCj4gPiAtICAgICAgICAgICAgICAgcnpnMmxfcGluY3Ry
bF9zZXRfcGZjX21vZGUocGN0cmwsIHBpbiwgb2ZmLCBwc2VsX3ZhbFtpXSAtIGh3Y2ZnLT5mdW5j
X2Jhc2UpOw0KPiA+ICsgICAgICAgICAgICAgICByemcybF9waW5jdHJsX3NldF9wZmNfbW9kZShw
Y3RybCwgcGluLCBvZmYsIGZ1bmMpOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICBy
ZXR1cm4gMDsNCj4gDQo+IFdpdGggdGhlIGFib3ZlIGZpeGVkOg0KPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGpl
LGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IA0K
PiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0
IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcw0K


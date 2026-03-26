Return-Path: <linux-gpio+bounces-34214-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePaSA49NxWkU8wQAu9opvQ
	(envelope-from <linux-gpio+bounces-34214-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 16:15:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F83375DB
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 16:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF7D430F12CD
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 15:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3D13FFAC1;
	Thu, 26 Mar 2026 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XfZIVBhx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB135CBC3;
	Thu, 26 Mar 2026 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537610; cv=fail; b=Oo2HAc5wjB8zFvZRyeUaYiwALbhLE9/D1wAgyQIwpuL5SqgrZToIWU49IhYFERvKJSL+Ky5o6U3+pEu34bvIivXLSBTY1KmyUdeHKuNxqrhhnFxvtdvfcIbvFkWCA3J4PzmkWqwrm1YQhpGpIZ5cEqZ8tHDDEl+76q5D2rHAiP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537610; c=relaxed/simple;
	bh=FCZteffyqLGgXWgvwa7xpGE/q/tCXD5e93v12JXhxyY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mD7MEtDKu6NIIg+/E/fd6YwP40EBWw0T7Z37YKTit2VvV6g2Cy4OyTz3DljXHSxMzZVsLwEwq363e9Zmt6qmk7AyW1TOVmzDaK7qNNTguBi9nSpPSrUy+ekQ0TYVaABIXYWr40rQrSxoCKgmiRx8S4JYapmHhgW2pZuP0PwwWC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XfZIVBhx; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1sJCvscRQfGwsqcLcph/37zZnowCCWLoDQWe97koXWi5tyH4ivGhWNzaNykAG8k+MwbgMv+Gux+thxGJqXM1AKb7qoW7NFHRez6/3R7KAhhcaFqiSKV2L8ntHi7Q/Dw6tn8LWtnpTNhKjGR68wzDu5M7TNAaZPzFhZ2DdHmRKQPPHhze15bLkQ9jsCL4Awg0Ch0XhtE4aSOyreh4lW2GHilqk1EnCm29hA8bT83RwxU56ilIu4lSVdi8c1qd8gBnScFY7J0j60cs9UAb7rpRUaB7+2mwORUbkFYvYl1kbzUauZNfBqg+CrtdeXf0NAZoMvRoCwhuz4X2pFjv/hqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCZteffyqLGgXWgvwa7xpGE/q/tCXD5e93v12JXhxyY=;
 b=VHTyy4rIEOMWfI8MLAHJCyoI9EIdVIETEaLoEvtQop0tyWPEk1dqGPzhI/ZlMVmH97euHEQH2Ivhz1Pyq/oguF06RMJ4C6RAmB55mzyV1JJ8LuGkk7fvBc+QiyK3n4xt7N2dWdDRs0U5qcjRaLKksg59ulXpE+ZGRIn2URxRd93BbqRaUFCV3dCtwB6PQMamhahFdaBtTDS1IxeCtQ22GroYhKji5fKL31XS8ulN1ckL2iosWkAyHKyrItqCSeTmpXCsdRMZkRb91Y+3CefsM06Ol0d5WczsrQ7tXNyR6pb3HRJpsvKv7+XdViO9USrc+5fPOHGEOuiD7upHBbTguQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCZteffyqLGgXWgvwa7xpGE/q/tCXD5e93v12JXhxyY=;
 b=XfZIVBhxu3PRxQjxgONmLpFdG6sZIHHHOoQB3M1x8a+StVeH+Z8/7LNcv/HFOIuvoU1mljho5DhOgqXtjBBKc6L9HHcJGoXHXIt+bjpKESjeG242iRTx3iR7mBZAY0sydqFLehTAmEqGVzf09A+osigVQDHJZdxgk3ouIuZvRgQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11229.jpnprd01.prod.outlook.com (2603:1096:400:36c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 15:06:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9745.023; Thu, 26 Mar 2026
 15:06:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] pinctrl: renesas: rzg2l: Fix save/restore of
 {IOLH,IEN,PUPD,SMT} registers
Thread-Topic: [PATCH v2] pinctrl: renesas: rzg2l: Fix save/restore of
 {IOLH,IEN,PUPD,SMT} registers
Thread-Index: AQHcvIVATi6zgACS9k6a3PkefV2v/bXArt+AgAA6XRA=
Date: Thu, 26 Mar 2026 15:06:37 +0000
Message-ID:
 <TY3PR01MB11346A5A7DA755F372ECE3D968656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260325182849.84660-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW5jiR5CqV0xhxio4vtV_bPczO5u1Da86CWJO+=6WU4+Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW5jiR5CqV0xhxio4vtV_bPczO5u1Da86CWJO+=6WU4+Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11229:EE_
x-ms-office365-filtering-correlation-id: aabbc9ba-6c11-463c-872f-08de8b494742
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 QP97MTtVJvCCN+LHwVY5uCaUa4Tu4v61SMBvThOjGHQLoZ2vK2vkJdnehhaHvy9ir5WT0/rHZTul4Y/TB2KrKFNHlHxxryx3ULbOeZmLcdIJn9ECKnatDMBGeQ06K38vBwVCS8jXXo1aPqfc6yxMTT+rWDEyq17M0hjtTc/O/8ss5NlqMQG6mB8QsWN1BjO0C5kYWVdrWS96vKIVxas3HBsok2W5Qs3GBkEMPZAVtdCESdOabBJO0ot50hMfcX143abOjXWW+taR0ZFtNrJq8U9nHdytLYvST1e1K5FdFsYRy4S0unAOFSq3OeLvvnn3vAk44ehngPdkpM0J2iiaFKEaKXy8Z5/TpQONANDWz8g+rSKLi8x5Pm3qCDunjC3YVTU2+BgSZoMNS1QTJMNhyg9e325HWW26bTiuB5aqUxRXhYuMmOg0OUYCmFDALLpzzVc242KtQl01riy/Ywotpyb9SQAj/LMaTvlnWW/3IYhP3WyfoIHu+EGxpKSOGBHpKOnYjmN/tC44ephCGICv9i8zToSGAfbp6vKImE+Yl5W3SzlUDmhjjTpvXx+cSEhkeNUkyjiZNWob5zvzpmMLKJ9ASHH2hEuXGOrJOX/tCH9W2N2I64GTaHksRH2mlOdQj/jR3cL0kSxYpebkGaIQReWGNaS+1n3amQseTHm/Tf9NQu5F1YCsJpRlUV9x2cssJE7kqQhu3GKrchbEIHNhRr4tzynTgUOuvF9RsNBttiI8lJiFKrAzX3xfFtrMYbPgTBFY9YU6k6PJ3GERVEqP5TN4GDI2OoBHZWh+vuLx7P8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MC9hMHJUSHZVSk9CY2RabmhrTjhnUDRwSS8weDRHMlhyWXZ0eU5sc3UwdUxK?=
 =?utf-8?B?MUc0eU1zMm9KTGdBdzc3UlhKbS8xakVKMnJ3Mm9VU3RCL0VEZHJMdWd6QnhE?=
 =?utf-8?B?djg3ZWVOQVR3ZDdENFZPNm1Va1pPVEl4V3RzV2V1ZEdmTUVIMk9velZZSGNj?=
 =?utf-8?B?OVdVcW9mZDhNeHp2eTF5cGc0bFhtZXJzOHpwT2pyazh2SW5GVnpSTjZNVVNM?=
 =?utf-8?B?QVByZUg2aVRIS0IzVlhHcjNzQkQxbzBzZDBpWUQxdkg1ZnQ2YjAxNTNsSFZW?=
 =?utf-8?B?bnppOVRZSzFLSS9kdFdWQnA1N1B3eGJVZHV3NGphd05TRjVUUkIzNDlMR28v?=
 =?utf-8?B?cDY5aFprQWtQNUV5U09oanFyVXdESmZrSkNIb0VpQ1ovR1l2d1NvM09oSnRK?=
 =?utf-8?B?VHZMQmVvdzN5dHlRZ2VXU0lxbFlSZnVuU0tyVG92Z051U0RSQ0xMb3NGMzJk?=
 =?utf-8?B?emZsOWhlRkJrbVc5azR4YVNPckhyODNKdmswZy9hSjVkWkExUXExTjlhYStZ?=
 =?utf-8?B?YWtSb1Y2TjBNRWdQeEdFK1lhNDM1VVk0YWg0VktkYlc2U0R5R0xsOFhqeWpj?=
 =?utf-8?B?dHRvdW9KTWlWWVBKVTdSNVdXVXI0dCs3MU5ueFduc1JFSFFkYjJMUDVzZDNK?=
 =?utf-8?B?SkZBZFAxdTl4YTZmd1RwQUxVd0tWM2wrejB0UCtJdFB4RDhJMFJXeFp2dUQ0?=
 =?utf-8?B?UDVuREhhbmtnYnNHZVNTMXZRWlAveWlDMHF4T3gyYkhza1RnVnJlKzRHb2F6?=
 =?utf-8?B?VGJtOXhOMlFoY3Fiajl3ZVErMzFIZkJLemZlYUcyOUhPUUdONlRjYS9ON2Fj?=
 =?utf-8?B?ZEYwUWprUWhGakpZOGQvc0JSblEwWW0zY0ZMODZXd2dwcmdWaDZTMzJSZHdN?=
 =?utf-8?B?RGNCL3RqZkkyU2oyVU1MTWh1V0tqSDBzVnY0K3lvYTl1RVB5K1V0Q0t4c3dn?=
 =?utf-8?B?bUZqZkxmeWh2eXBwcElmbkFJWWlYRUROVGVtSGVZQjdnOHpLeDhQeXc4Z3ky?=
 =?utf-8?B?WUtYNkM4MjlIUHJISG1mZllqREhvblBFbnJ3RUZOOUNPbzNBL1RRbGp3U0pE?=
 =?utf-8?B?bUZhcnpUUlBhUDkzZFhJa1ViTTF2Sm5QL3cvM0hrbjN6dUpHaktqVXZ5eU5j?=
 =?utf-8?B?ODkxd1d6bFZoQ3hDdnAxMkpiV1BZK2dKTEdMM05SREtNVjNQZDV6SElBUFg1?=
 =?utf-8?B?Nlk4OG8rTnVlSzNhL0VXdXpJbUc5dzA5YU5TMHNJSUFhM2F0cytWb0h4RDk1?=
 =?utf-8?B?MDRMQ09MTWJJVEc0dFpwWWFnUmNNMXpEOTlrTnJvVTdJT1JCTmxjRVJJNDJp?=
 =?utf-8?B?WVZoZm54WkIyUkU1M1FMVzE1NHR3ZXFYTUF5Z1FXNGdqZlpVaE1YUnQ2Skpx?=
 =?utf-8?B?R0lFQ2dvbkRsclgvYTdpajYzYklQckE0NTVMS0FORFNyc0tqK1VkOGw2Q2gz?=
 =?utf-8?B?WEpkdzdPLzA4RTEveXN2NWticTJyVFAvalRSbytwbnJMczNOT3hkd3hpZEVW?=
 =?utf-8?B?L3hWRTlSQ2FtVmEyRklrQjBJREg2QktESzRyazVuWkgrZ24yL2Ivbmwrd0xh?=
 =?utf-8?B?QjBMaFovdVZCZ3oxK2NmT3pwR0xQZkxPT0xmMnUweVc3UTVtc1huMmIvdWxR?=
 =?utf-8?B?NmxnSFdFbXhqZEpkK0J4Z2hrdjlzb0RaQlBtY0pkZnVTUTdJZXZKRlc4N3Vz?=
 =?utf-8?B?QkxwMlgxRHlnbjZ5Mm1ybGk5NGRIU0dyUjFUTHpzZlhtdW40THVTVVlLZlNo?=
 =?utf-8?B?T2U2UUE2UkpVcW1OK1MvUWlabldsRzZRUEU4cGdTdldFL1VvR1A0Q0J1dlRZ?=
 =?utf-8?B?WUtJOVp1MU0xeG8zYnI4ajdjVUJENE1FU3ZpbEY4YktwbVhZZUQ4LzErZzRN?=
 =?utf-8?B?WmdFK25peHhqS281Vm5OV0M1eitrYXFsWXFzYUxxOFV4eGhmbit5YnFjNjB2?=
 =?utf-8?B?b0ZqTUlVWHBhcjdteGZqSE5CaVJwTld3WnlhL0JmZFlTeXJJdkVGajkyM0xJ?=
 =?utf-8?B?Ujg0LzVVb2d1Z05KZUtVV082d2tWK3RESkcvQS9jUEt2ZHNuaGxFZFFyZkVs?=
 =?utf-8?B?V1VtS2FmNlVHWjVab1lySlBwdE9CMUdBNDVIYWI0RVRoUElCMlZCRWM2YS9p?=
 =?utf-8?B?V1BoRlR2Z3VQSkJ0aUhBMTRmSjZ0SXVndzFmY0pUMEY2UURHOTlLY3pWd0Jn?=
 =?utf-8?B?UURqekQrL2hrSDh6Zjloc2hkQitwVHVCVHE0dDFIcHhuRi9maUk4SHYwVlp4?=
 =?utf-8?B?NkRqSmlBQ0FSbDBFcElLVDZpSjhQY3hmcVYxQ1Nyb3FxLzNmMHhPK3U0MXh4?=
 =?utf-8?B?NHg3RU54ZGsrZ0EvMENMUlAreVpVQkZnclNsRFhVYUtrL1hvRDJKUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aabbc9ba-6c11-463c-872f-08de8b494742
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 15:06:37.7467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0N3RT0VR1kRSyU0qrMPWvXA4z8F9Cp2xj6EOCpLNwBtpacjiiiGtXkZpY81GhDyT35q16YMnVTgtFYwgj+wwm1dzmACWERE4/vm8JBuy0jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11229
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34214-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 5F2F83375DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMjYgTWFyY2ggMjAyNiAxMTozMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyXSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogRml4IHNhdmUvcmVzdG9yZSBvZiB7SU9MSCxJ
RU4sUFVQRCxTTVR9IHJlZ2lzdGVycw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgMjUg
TWFyIDIwMjYgYXQgMTk6MjgsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+
ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4g
VGhlIHJ6ZzJsX3BpbmN0cmxfcG1fc2V0dXBfcmVncygpIGhhbmRsZXMgc2F2ZS9yZXN0b3JlIG9m
DQo+ID4ge0lPTEgsSUVOLFBVUEQsU01UfSByZWdpc3RlcnMgZHVyaW5nIHMycmFtLCBidXQgb25s
eSBmb3IgcG9ydHMgd2hlcmUNCj4gPiBhbGwgcGlucyBzaGFyZSB0aGUgc2FtZSBwaW5jZmcuIEV4
dGVuZCB0aGUgY29kZSB0byBhbHNvIHN1cHBvcnQgcG9ydHMNCj4gPiB3aXRoIHZhcmlhYmxlIHBp
bmNmZyBwZXIgcGluLCBzbyB0aGF0IHtJT0xILElFTixQVVBELFNNVH0gcmVnaXN0ZXJzDQo+ID4g
YXJlIGNvcnJlY3RseSBzYXZlZCBhbmQgcmVzdG9yZWQgZm9yIGFsbCBwaW5zLg0KPiA+DQo+ID4g
Rml4ZXM6IDI1NDIwM2Y5YTk0YyAoInBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VzcGVu
ZC9yZXN1bWUNCj4gPiBzdXBwb3J0IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+
IA0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBVcGRhdGVkIGNvbW1pdCBkZXNjcmlwdGlv
bg0KPiA+ICAqIEltcHJvdmVkIHRoZSBsb2dpYy4NCj4gDQo+IFlvdSBhbHNvIGZpeGVkIHRoZSBk
b3VibGUgYXBwbGljYXRpb24gb2YgdGhlIHBpbl9vZmYgaW5kZXgsIHJpZ2h0Pw0KDQpZZXMsIGl0
IGlzIG15IG1pc3Rha2UsIEkgaGF2ZW4ndCBsb29rZWQgdGhlIHByb3Bvc2VkIGNvZGUgZHVyaW5n
DQpvdXIgaW50ZXJuYWwgcmV2aWV3IGFzIHRoZSB0ZXN0aW5nIHNob3dlZCB0aGUgcmVzdWx0cyBh
cmUgT0sgd2l0aCBldGhlcm5ldCBPRU4gDQpQaW5zIGR1cmluZyBzdXNwZW5kL3Jlc3VtZSBjeWNs
ZSBvZiBzMnJhbS4NCg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5j
dHJsLXJ6ZzJsLmMNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6
ZzJsLmMNCj4gPiBAQCAtMzAwMSw5ICszMDAxLDEyIEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX3BpbmN0
cmxfcG1fc2V0dXBfcmVncyhzdHJ1Y3QNCj4gPiByemcybF9waW5jdHJsICpwY3RybCwgYm9vbCBz
dXNwZW4gIHsNCj4gPiAgICAgICAgIHUzMiBucG9ydHMgPSBwY3RybC0+ZGF0YS0+bl9wb3J0X3Bp
bnMgLyBSWkcyTF9QSU5TX1BFUl9QT1JUOw0KPiA+ICAgICAgICAgc3RydWN0IHJ6ZzJsX3BpbmN0
cmxfcmVnX2NhY2hlICpjYWNoZSA9IHBjdHJsLT5jYWNoZTsNCj4gPiArICAgICAgIHUzMiBwaW5f
b2ZmID0gMDsNCj4gPg0KPiA+IC0gICAgICAgZm9yICh1MzIgcG9ydCA9IDA7IHBvcnQgPCBucG9y
dHM7IHBvcnQrKykgew0KPiA+ICsgICAgICAgZm9yICh1MzIgcG9ydCA9IDA7IHBvcnQgPCBucG9y
dHM7IHBvcnQrKywgcGluX29mZiArPSBSWkcyTF9QSU5TX1BFUl9QT1JUKSB7DQo+ID4gKyAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBwaW5jdHJsX3Bpbl9kZXNjICpwaW5fZGVzYyA9DQo+ID4g
KyAmcGN0cmwtPmRlc2MucGluc1twaW5fb2ZmXTsNCj4gDQo+IEhlcmUgeW91IGluZGV4IHBjdHJs
LT5kZXNjLnBpbnNbXS4uLg0KDQpPSy4NCj4gDQo+ID4gICAgICAgICAgICAgICAgIGJvb2wgaGFz
X2lvbGgsIGhhc19pZW4sIGhhc19wdXBkLCBoYXNfc210Ow0KPiA+ICsgICAgICAgICAgICAgICB1
NjQgKnBpbl9kYXRhID0gcGluX2Rlc2MtPmRydl9kYXRhOw0KPiANCj4gSGVyZSB5b3UgZ2V0IHBp
bl9kYXRhLCBzbyBiZWxvdyB5b3Ugd2lsbCBhY3R1YWxseSBpbmRleA0KPiBwY3RybC0+ZGVzYy5w
aW5zW3Bpbl9vZmZdLmRydl9kYXRhW10uICBUaGF0IGlzIG5vdCBvbmx5IGNvbmZ1c2luZywNCj4g
YnV0IGFsc28gb25seSB3b3JrcyBiZWNhdXNlIHBjdHJsLT5kZXNjLnBpbnNbaV0uZHJ2X2RhdGEg
aXMgaW5pdGlhbGl6ZWQgaW4gcnpnMmxfcGluY3RybF9yZWdpc3RlcigpDQo+IGxpa2U6DQo+IA0K
PiAgICAgcGluc1tpXS5kcnZfZGF0YSA9ICZwaW5fZGF0YVtpXTsNCj4gDQo+IEFsbCB0aGVzZSBu
ZXcgdmFyaWFibGVzIChpbmNsLiBwaW5fb2ZmKSBhcmUgb25seSB1c2VkIGluc2lkZSB0aGUgbmV3
IGlmICgpIGJlbG93LCBzbyBwbGVhc2UgY29uZmluZQ0KPiBldmVyeXRoaW5nIHRvIHRoYXQgYmxv
Y2suDQoNCk9LLg0KPiANCj4gPiAgICAgICAgICAgICAgICAgdTMyIG9mZiwgY2FwczsNCj4gPiAg
ICAgICAgICAgICAgICAgdTggcGluY250Ow0KPiA+ICAgICAgICAgICAgICAgICB1NjQgY2ZnOw0K
PiA+IEBAIC0zMDEyLDYgKzMwMTUsMTEgQEAgc3RhdGljIHZvaWQgcnpnMmxfcGluY3RybF9wbV9z
ZXR1cF9yZWdzKHN0cnVjdCByemcybF9waW5jdHJsICpwY3RybCwgYm9vbA0KPiBzdXNwZW4NCj4g
PiAgICAgICAgICAgICAgICAgb2ZmID0gUlpHMkxfUElOX0NGR19UT19QT1JUX09GRlNFVChjZmcp
Ow0KPiA+ICAgICAgICAgICAgICAgICBwaW5jbnQgPSBod2VpZ2h0OChGSUVMRF9HRVQoUElOX0NG
R19QSU5fTUFQX01BU0ssDQo+ID4gY2ZnKSk7DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgaWYg
KGNmZyAmIFJaRzJMX1ZBUklBQkxFX0NGRykgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGZvciAodW5zaWduZWQgaW50IGkgPSAxOyBpIDwNCj4gPiArIFJaRzJMX1BJTlNfUEVSX1BPUlQ7
IGkrKykNCj4gDQo+IFNob3VsZG4ndCB0aGUgbG9vcCBzdGFydCBhdCB6ZXJvPyBUaGUgUElOX0NG
R19NQVNLIHBhcnQgb2YgYSB2YXJpYWJsZSBjb25maWcgaXMgYWx3YXlzIHplcm8uDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2ZnIHw9ICpwaW5fZGF0YSsrOw0KPiAN
Cj4gUGxlYXNlIHVzZSBwY3RybC0+ZGVzYy5waW5zW3Bpbl9vZmYgKyBpXS5kcnZfZGF0YSBoZXJl
Lg0KPiBBbmQgcGluX29mZiBjYW4gYmUgcmVwbGFjZWQgYnkgcG9ydCAqIFJaRzJMX1BJTlNfUEVS
X1BPUlQuDQoNCg0KT0ssIHdpbGwgcmVwbGFjZSBpdCBhcyBpbiB0aGUgbmV4dCB2ZXJzaW9uIGFz
IGJlbG93DQoNCisJCWlmIChjZmcgJiBSWkcyTF9WQVJJQUJMRV9DRkcpIHsNCisJCQl1bnNpZ25l
ZCBpbnQgcGluID0gcG9ydCAqIFJaRzJMX1BJTlNfUEVSX1BPUlQ7DQorDQorCQkJZm9yICh1bnNp
Z25lZCBpbnQgaSA9IDA7IGkgPCBSWkcyTF9QSU5TX1BFUl9QT1JUOyBpKyspDQorCQkJCWNmZyB8
PSAqKHU2NCAqKXBjdHJsLT5kZXNjLnBpbnNbIHBpbiArIGkgXS5kcnZfZGF0YTsNCisJCX0NCisN
Cg0KQ2hlZXJzLA0KQmlqdQ0K


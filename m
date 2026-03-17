Return-Path: <linux-gpio+bounces-33589-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RYw/MUEAuWkxnAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33589-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:18:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7682A4AD9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F28F7303CED5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 07:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E1238C433;
	Tue, 17 Mar 2026 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QhmY5CUX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54096946C;
	Tue, 17 Mar 2026 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731901; cv=fail; b=i675nYOqSHo8BzEeFbHrfi052LAIZmnpVVS37wwPKwvJcw/Ru4X7b5C+fhO+Wj7BR8NdMoDfM8ZNfC19qGASGMn3l63+gFg9iSj93cTqbBpvvTBTRz2T/5V6vtdFHHYn2Y0/R1pl6XuS5lwwqTNV23MTrQ8MOQYqRaecHyuQ1e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731901; c=relaxed/simple;
	bh=XDU+QL0pNWpyIR/Os0+jR1Ssqb9ygI5+IlLhfVzNlZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ORmyudgp7f3tr17fXMSCqQdlZZBry6HzFp1tHZQJCM+rwLRs/d9czwqE5rlJy6tZJHgIuNvEIOR9CBC7pvGCIfIqRE8REXyKbhDtGNmHBnqj0+WH/xa6krMJ8h8WeJnnnA7R0zo1RgfkARlIZIC6xd5kOyKzs/PqfPgDkii0OGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QhmY5CUX; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGFq3Y45kl4fECxLfRYplN7mGFjGFV9V3Uej55FNecJwwJvHhvBPApfVvwi/JGBpEV4b+3aiH1QQMwytZC9BTNftj/Otq/hgXhUE8yzW/WLhmLhy46ooDBZhgapL0Rv576lIqfveQozJ9aHn+eStBgcobnSp7hKtg6gprSu3vmi8f+14HavS65xR1gxnKQnun/4zl9nI1dfBs6BhfnHmkcJZigRMYXL+anOIecJBAIjrQK6MdB7WDQR5Bj/5bF2Km8Zezc1Bm+PM3MryYg5QrdkhzxgpRtZrtsVIay4wd7psAQQFcr4GX8zdXELfFeoqfKfnI0iIwmZwGC6W8L+rnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDU+QL0pNWpyIR/Os0+jR1Ssqb9ygI5+IlLhfVzNlZs=;
 b=OUKC741QTGz0TzNYD9Lq+jKCcr1aU6ob0CKbOPV6rtm4RJy2CcSN6djfzywZTtxssIVm3EJPczGt6y+LPPMRxdQJZsR0iwsQ2VUj8s0xxtMy4dGqllkGmVK4GzxF4KuuweJRehXkpTc9XCdG95R3YYm1oBI4bqL3YbPwKDhIbMwBIfDG3Ul0WFMl+0zCKtAwyXsYmc/aHyMBrCu7BnJ8XHC57Q5CKMAW8i41fIrCBnOuu9AVRdqi8B2SfU81oUPCVbL4cyduHmyvswZ25x5hVaRImSN1xHmRMc+k/Caf/Hj63cpLH5JZ6JY98cVPwRvtGXgqOEsGnmCliSXHYAiDIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDU+QL0pNWpyIR/Os0+jR1Ssqb9ygI5+IlLhfVzNlZs=;
 b=QhmY5CUXazfnlXIudgBXTNptNRKpmOTCKZ/4FaNCy9gSKDk3T3UZJUjM+gVKoomRx/zRAK8QHnm0+HvFdkG+81RckC+JT6j3qQO7P2jH04SENZvaaBNcVNJ4MAZ4Q9ToLcyoiH4CaRBLryZ1vyzlivJPfMT6vf22M3dgGYjh8V8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6719.jpnprd01.prod.outlook.com (2603:1096:400:ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Tue, 17 Mar
 2026 07:18:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 07:18:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, magnus.damm <magnus.damm@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 00/10] Add Renesas RZ/G3L PINCONTROL support
Thread-Topic: [PATCH v2 00/10] Add Renesas RZ/G3L PINCONTROL support
Thread-Index: AQHclRt4vu4slLMNvE2ay3ZfuRD9aLWykV4A
Date: Tue, 17 Mar 2026 07:18:14 +0000
Message-ID:
 <TY3PR01MB113466FB94FF5B534B151D4828641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6719:EE_
x-ms-office365-filtering-correlation-id: 50059256-6f57-4af5-634b-08de83f55af6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 D/Jw6k3Z7cn4iKY32LGweF7kpOiUhpt3viATtIiNatFHBfMMjyVapoNm7qMMUGzbR3aOV8cCGP3OsVkTqFhtwI6lIgEBNT6RFSajit2rFJ4kCU//J9dVNqyEQ3gW8b2xPDDpjFCR7JGjtyUtZdLBZ7Fh3WUCynSK+5bv0ri1rOnbLkpjeg/HSD5cJJepUKsd42cV3qQ4HU7vJw2GRRpmXkICz/3iKKPi2MNBIdTmQRK89iBPeJv+3mvxvdW0eh6eiXXhcxmuZDubc14I0MzE4N/ZehdMW9X7GSYeCgWZuoFfGO0mannqdnBQmXNcST31s54YWXQzszcjdfhoy6WcveAlZ3nFLdKE11FoD8fgXHx4JFVRYPGBs1l6j7CXjRM1dQRodtt31bXgvQ5gAcIt4ra5LcjBRkz4GJNr8sJGiNSJyjlNCm39BDVHZiYRuqtWSqWICvvin3VGjagELyPdFad4tPok19hB85Y6aNCqaXp0Ehq05vBDk0UNlyIpM6Q8MdFmV9q+gZhowUMNfp0H/OugJZkxNIzV9U8J6l+AMsS3cUByhLnuIO+WHnDrF4iUvgGkwCKeDzWjJxAVh/vA38RoFA8T7jS/kB+uOwkWPlS9KJvOqxuzbdSz+GzJkMY/6DkN5OKUbX7/mhTjqqO/8KwpFAxzpbIG4ytEVgcKVLaEmTXu3jYcq1ftm8U1aNlDO33tjlfORSdxqq1P2viOaRnRWC0uoPQP1Xqsz7oDiV0mdHjWDD6CiQysesiCtP/5QuRb87h+b1QTQX1sakIVb7kdBPLBzSytFthbyLCIftk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTdaeU8wOW44WHlPU1ZJQkdQNk9BK2N6czV1Zzg5UU94bzAyQ0ZacjVTWklS?=
 =?utf-8?B?MTByaVk2K2tMYWthTkZJbkg2eGhvS1cyZmUxdXZucFp1cDJXcXFIbEdXUUMz?=
 =?utf-8?B?ZXVvQWJjYVUvQTJGWG1VOTltR3hRUDUyNkU0UmM2YVlHV0Y4SjFsUjkyaVk4?=
 =?utf-8?B?SEJvY2FGT1U2RzZyT2JuRmRld3B1SnRZMWhPenNwcFVhVUpwVkZ0QjlKeG5t?=
 =?utf-8?B?Z29EMXRVMEtGbElrNk5ybVJBU1JZb2E5T3lYVVNEUjA5d25Lek93TU16by91?=
 =?utf-8?B?cm56Y3ZyMlo2TWpLWGFidUNReEtMbjgvUmJ5QmpVTWFVTUdBWlQ1dlZ6NnVy?=
 =?utf-8?B?aTJXNm11cWZrZHdRR3hQd2dRMVJMZkQzVUZ5M2ZyU0RORkN2T0FwbkZObzJs?=
 =?utf-8?B?TnpsYnhnK1FWaGdjZE53M21QQjZuR2pLWnl6M2FGWmk1QlVwa3NyQkFESUQy?=
 =?utf-8?B?cnZ2RVZSTjZNYjhPdU1ndDJYd09HdWduMFBvMnJWNUtBdHY5RUh3VWthTUNP?=
 =?utf-8?B?K2h4cVhGZ0hmRUdzWjIvNWdkR2xWVUFGVGExay9NeWdMbUo1aTZnTW1MUGJ1?=
 =?utf-8?B?VGQwQ1RQSnh0NFRLbWtIV0FEbFZiV3F0S0JLeHZ3dUpzNGhsMmFhM29pc0hX?=
 =?utf-8?B?a21td3U5UUxieGZvVklwTDVvbkVqTFdGREJmWUZ2SExmZWRRNmVFM1ZvdE9m?=
 =?utf-8?B?ak9iKzBNWURBd3FEQlJpV1NOOENiRitZRHZJNkZpYm5CLzJOQlh3N1RVMXpW?=
 =?utf-8?B?b1BxYmlCRTZtRFlOL1dpUnM4b2ZLVGFGNDdoTDNHcTZlT2NwVG4vWXdIQ1VO?=
 =?utf-8?B?czh6VndUeS9uSUFrNXd1RXprc29YRVd4bWRmdUtFYjYwZXR3S29oak11T0pp?=
 =?utf-8?B?MzlRbHlrbnJ4SWVNUXVyUFRxc0FCbzFURENpZnZHcmV1L3YvYXQ2amVmYjhJ?=
 =?utf-8?B?eDVmNWhUUDk1ZFN4c21JS1d3ajZOSjBsOFdZdkMrK1QrVmVQZFIvRGhiQmhW?=
 =?utf-8?B?MWJzVm14VmJ2WHdTcVo5MFltdnFIRmIrYXQvY2ZpNGtVS3JEOU5YRnh4VU1Z?=
 =?utf-8?B?MkdneHQxaThNLzdGQlM2cXhDODFFZkFOa3plQ2ZiTDdQUEt1Y2NUUmtna0RO?=
 =?utf-8?B?Yi9xUXJPd0I1U3lUWXhkRmFwc0tOZDlHR25URFZ3QTJIR1Yrb0l5WmZsaHpz?=
 =?utf-8?B?WmxmKzErOWlSTXNMdGtRc0pFUExCT1FKdHZlMy93bFFpNm1QZURiVWdaMW5m?=
 =?utf-8?B?OFAxUmMxcEFLdWIvRVI2T2FVNVdJWVpBUTVUMGZGMkNDMk5tOVMrb3Q1aTVq?=
 =?utf-8?B?MmxVUE1hNnhIUVp1b0FseW5NZTM1M0xtZWxJYzR2Zi96MloyQnp6QUVraFhK?=
 =?utf-8?B?bmJWdWlsS1duL09BV3VjMkMvSXFaZWpxbFN0Zlk3MUVGNnBSQldQdlVWcFFo?=
 =?utf-8?B?dXY1M0p6eHZaeUVnblg2cnBDWE5zbE5JNDRxd3o1WG9EbG5UTTZQdjVKVXVX?=
 =?utf-8?B?QjBoRFFIS2RQck9SRXhjdVFaSlFyT2lEVTBHRzBwUk5lUm1qeU9mejJJK2d3?=
 =?utf-8?B?MU1qYU5UeHczbDRtOVV2MW1oTG5TcXk3cytNVm44V0Nndjl3TlNpRktTR3di?=
 =?utf-8?B?cFlEU3ptQlNpQ1dvc1B2RTllMWZDRThnSk43VkZzbmtlSGZwQTZ2Vll0NlIx?=
 =?utf-8?B?a2s2d1Nmc29acjgxSVprQlNKZWdKL2I2R0ZkT1IrdHBzdmxmMTdIdE5OejRY?=
 =?utf-8?B?bzFYQ2FQb2Jnb011ZmJLWWMzeVNQQ2pYTnQ2N29qUEpmQmQxVjgvczdjRDE1?=
 =?utf-8?B?NVpJVzdSbEx3Y0kvODE4b2dOcDNud3ZiVThad25WWUNLa1B2MWpndkpZbWNi?=
 =?utf-8?B?c3VrTHU4K1Y2ZkR4eXl2b1dXSVFaZEFzK1F4S0MwVDkvcnlZbS80MWZMRUpx?=
 =?utf-8?B?V0wxc0FaKyswakZOb1oyMUJrdnJwRFpzQkZIbDhyVlZnY3RpZ1l2Rm5UWnJU?=
 =?utf-8?B?Ukt0ZXp4U0tseVBIQUpyNXdBWUVoTkhYV0tveTNEK2lNN3hZYm9FQUxrdGN1?=
 =?utf-8?B?cEZqR0tGZnFoT2RkRWRJeVkwb29YbEROMU41Z2FEWFIrMG13YUR6NzNGb0dX?=
 =?utf-8?B?T0NFdmZsMkdMdi94K2Q1clNPTzFvWVV0QUQ0L05uakZ4WWxYdFV0b3dTUllq?=
 =?utf-8?B?dWJIdWVieWpEaDJldU5JTlZSVGNneHhlS1BGcHhoRmF5cERudS9xMkJ4eUtC?=
 =?utf-8?B?REV4V0RML2NXSjF3QU0zendPR2hjZlF5U0ttMC9JQ2UvK08wOW1jTEE3Mkl5?=
 =?utf-8?B?WGl6TUdOMTR1TFVDZWlsbkpBNkdnaFVjWWNmK1FjUDNFSjZPeVNldz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 50059256-6f57-4af5-634b-08de83f55af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 07:18:14.9183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MSQLmz5snsNXksVxLktHBEKOjXxr3gVlSLN9JDuVILfg1JoLhD2SpYSorOEzYBJxiwsS647SAD5e2VbV9m/B3ukzf9T3VkyrGHAZ37vkEqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6719
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33589-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org,baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: DA7682A4AD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJpanUgPGJp
anUuZGFzLmF1QGdtYWlsLmNvbT4NCj4gU2VudDogMDMgRmVicnVhcnkgMjAyNiAxMzoxMA0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjIgMDAvMTBdIEFkZCBSZW5lc2FzIFJaL0czTCBQSU5DT05UUk9MIHN1
cHBvcnQNCj4gDQo+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gDQo+IEhpIEFsbCwNCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gYWRkIGJhc2lj
IHBpbmNvbnRyb2wgc3VwcG9ydCBmb3IgUlovRzNMIFNvQy4gVGhlIFJaL0czTCBwaW5jdHJsIGhh
cw0KPiBPVEhFUl9QT0MgcmVnaXN0ZXIgY29tcGFyZWQgdG8gb3RoZXIgU29DcyBmb3Igc2V0dGlu
ZyBJTyBkb21haW4gdm9sYWdlIGZvciBBV08sIElTTyBhbmQgV0RULg0KPiANCj4gRG9jdW1lbnQg
dGhlIHJlc2V0LW5hbWVzIGFzIGFsbCBTT0NzIGhhcyBtdWx0aXBsZSByZXNldHMuDQo+IA0KPiBE
b2N1bWVudCB0aGUgYmluZGluZ3MgZm9yIFJaL0czTCBTT0MgYW5kIGFkZCBwaW5jdHJsIGRlZmlu
aXRpb25zIGluIGRyaXZlci4NCj4gDQo+IEFkZCBwaW5jb250cm9sIGRldmljZSBub2RlIGFuZCBh
ZGQgcGluY29udHJvbCBzdXBwb3J0IGZvciBTQ0lGMCBhbmQgR0JFVEggbm9kZXMuDQo+IA0KPiBO
b3RlOg0KPiBTb21lIElQcyBuZWVkcyB0byBzZXQgdGhlIHJlZ2lzdGVyIElQQ09OVF9TRUxfQ0xP
TkVDSCBpbiBTWVNDIHRvIGNvbnRyb2wgdGhlIGNsb25lIGNoYW5uZWwgb2YgdGhlIElQLg0KPiBQ
bGFuIHRvIGFkZCBjbG9uZSBjaGFubmVsIGNvbnRyb2wgc3VwcG9ydCBsYXRlci4gVGhlIElQJ3Mg
aW52b2xpbmcgY2xvbmUgY2hhbm5lbCBuZWVkcyB0byBkbyB0aGUgc2V0dXANCj4gYXMgcGVyIHRo
ZSBiZWxvdyBmbG93DQo+IA0KPiAoMSkgU2V0IFNZU19JUENPTlRfU0VMX0NMT05FQ0ggcmVnaXN0
ZXIgYXMgbmVjZXNzYXJ5DQo+ICgyKSBTZXQgdGhlIFBXUFIgcmVnaXN0ZXIgdG8gYWxsb3cgd3Jp
dGluZyB0byB0aGUgUEZDX20gcmVnaXN0ZXIuDQo+ICAgICBBZnRlciBzZXR0aW5nIHRoZSBQV1BS
LkIwV0kgYml0IHRvIOKAnDDigJ0gKGluaXRpYWwgdmFsdWUgPSAxKSwNCj4gICAgIHNldCB0aGUg
UFdQUi5QRkNXRSBiaXQgdG8g4oCcMeKAnSAoaW5pdGlhbCB2YWx1ZSA9IDApLg0KPiAgICAgU2Vs
ZWN0IHRoZSByZXF1aXJlZCBmdW5jdGlvbiBmcm9tIEZ1bmN0aW9ucyAwLTE1Lg0KPiAgICAgKEhl
cmVhZnRlciwgRnVuY3Rpb24xIHNldHRpbmcgZXhhbXBsZSkNCj4gKDMpIFNldCBQRkNfbSA9IDAw
MDFiIGFuZCBzd2l0Y2ggdG8gRnVuY3Rpb24xLg0KPiAoNCkgU2V0IHRoZSBQTUNfbSByZWdpc3Rl
ciB0byDigJwx4oCdIChpbml0aWFsIHZhbHVlID0gMCkuDQo+ICg1KSBTZXQgdGhlIFBGQ19tIHJl
Z2lzdGVyIHRvIHdyaXRlLXByb3RlY3RlZC4gQWZ0ZXIgc2V0dGluZw0KPiAgICAgdGhlIFBXUFIu
UEZDV0UgYml0IHRvIOKAnDDigJ0sIHNldCB0aGUgUFdQUi5CMFdJIGJpdCB0byDigJwx4oCdLg0K
PiANCj4gVGhlIGNsb2NrIHBhdGNoZXMgZGVwZW5kIHVwb24gWzFdDQo+IFRoZSBkdHNpL2R0cyBw
YXRjaGVzIGRlcGVuZCB1cG9uIFsyXQ0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjYwMjAzMTEwMjIwLjI2NTc0OC0xLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KPiBb
Ml0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMjAzMTIzNTAzLjMxNDc1NS0xLWJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KDQoNCkkgaGF2ZSBhZGRlZCBtb3JlIHBlcmlwaGVy
YWwgc3VwcG9ydCBhbmQgZHVyaW5nIHRlc3RpbmcgZm91bmQgc29tZSBidWdzIGluIHRoaXMgc2Vy
aWVzLg0KSSB3aWxsIHNlbmQgbmV3IHNlcmllcy4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSB0
aGluayBvdGhlcndpc2UNCg0KSSBoYXZlIGFkZGVkIGNsb25lIHN1cHBvcnQgaW4gbmV3IHNlcmll
cyBhbmQgdGVzdGVkIGFsbCBjbG9uZSBjaGFubmVscw0KUG9wdWxhdGVkIG9uIFJaL0czTCBTTUFS
QyBFVksgKFJTUEksIFJTQ0kgYW5kIEkyQykuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gdjEt
PnYyOg0KPiAgKiBTcGxpdCBEVFNJIHBhdGNoZXMgZnJvbSBiaW5kaW5ncw0KPiAgKiBGaXggdHlw
byBtYXhJdGVtcy0+bWluSXRlbXMgaW4gYmluZGluZ3MNCj4gICogQ29sbGVjdGVkIHRoZSB0YWcN
Cj4gDQo+IEJpanUgRGFzICgxMCk6DQo+ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IHJlbmVzYXM6
IERvY3VtZW50IHJlc2V0LW5hbWVzDQo+ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IHJlbmVzYXM6
IERvY3VtZW50IFJaL0czTCBTb0MNCj4gICBjbGs6IHJlbmVzYXM6IHI5YTA4ZzA0NjogQWRkIEdQ
SU8gY2xvY2tzL3Jlc2V0cw0KPiAgIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9y
dCBmb3Igc2VsZWN0aW5nIHBvd2VyIHNvdXJjZSBmb3INCj4gICAgIHtXRFQsQVdPLElTT30NCj4g
ICBwaW5jdHJsOiByZW5lc2FzOiByemcybDogQWRkIE9FTiBzdXBwb3J0IGZvciBSWi9HM0wNCj4g
ICBwaW5jdHJsOiByZW5lc2FzOiByemcybDogQWRkIHN1cHBvcnQgZm9yIFJaL0czTCBTb0MNCj4g
ICBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgcmVzZXQtbmFtZXMgZm9yIFJaL0cyTCBhbmQgUlov
VjJIIGZhbWlseSBTb0NzDQo+ICAgYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDhnMDQ2OiBBZGQg
cGluY29udHJvbCBub2RlDQo+ICAgYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDhnMDQ2bDQ4LXNt
YXJjOiBBZGQgU0NJRjAgcGluY29udHJvbA0KPiAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzNs
LXNtYXJjLXNvbTogRW5hYmxlIGV0aDEgKEdCRVRIMSkgaW50ZXJmYWNlDQo+IA0KPiAgLi4uL3Bp
bmN0cmwvcmVuZXNhcyxyemcybC1waW5jdHJsLnlhbWwgICAgICAgIHwgIDE2ICsNCj4gIGFyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMuZHRzaSAgICB8ICAgMSArDQo+ICBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kgICAgfCAgIDEgKw0KPiAgYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA1NC5kdHNpICAgIHwgICAxICsNCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDUuZHRzaSAgICB8ICAgMSArDQo+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ2LmR0c2kgICAgfCAgMTAgKw0KPiAg
Li4uL2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ2bDQ4LXNtYXJjLmR0cyAgIHwgIDEzICsNCj4g
IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNDcuZHRzaSAgICB8ICAgMSArDQo+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU2LmR0c2kgICAgfCAgIDEgKw0K
PiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpICAgIHwgICAxICsN
Cj4gIC4uLi9ib290L2R0cy9yZW5lc2FzL3J6ZzNsLXNtYXJjLXNvbS5kdHNpICAgICB8ICA5MiAr
KysrKysNCj4gIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDhnMDQ2LWNwZy5jICAgICAgICAgICB8
ICAgNiArDQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMgICAgICAg
fCAyODUgKysrKysrKysrKysrKysrKystDQo+ICAuLi4vcGluY3RybC9yZW5lc2FzLHI5YTA4ZzA0
Ni1waW5jdHJsLmggICAgICAgfCAgMzkgKysrDQo+ICAxNCBmaWxlcyBjaGFuZ2VkLCA0NjUgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0
LQ0KPiBiaW5kaW5ncy9waW5jdHJsL3JlbmVzYXMscjlhMDhnMDQ2LXBpbmN0cmwuaA0KPiANCj4g
LS0NCj4gMi40My4wDQo+IA0KDQo=


Return-Path: <linux-gpio+bounces-36267-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I1OKZME+2mbVQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36267-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 11:06:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A484E4D8530
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 11:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5B393042CA4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 08:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC6B3EDAB7;
	Wed,  6 May 2026 08:58:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2116.outbound.protection.partner.outlook.cn [139.219.17.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BB13EDAB8;
	Wed,  6 May 2026 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057934; cv=fail; b=DtOwQW37MqhL0GF9qS9N3/qxXh5g7rS/ssHrHciM+LoZFfL5jlJMCTCfNhJz+BxWxuLTgSr+UCzzjFd9UKH3iZu73O90gsM1rH6XyKI5EV9IgIT2lJ0/BDQMpHrRi2u2kU5VKWBpN6jxt0BUwTrCiedOaC6ZutOwmaviKXo+kAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057934; c=relaxed/simple;
	bh=Zk4zOiWNbYQpvI40jer0If9lUD/pDnnhojW/u1puWLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=temLJeNmnxzWHcbUC/ITlgeeYeEngnDFB2m2TzXtPqwDlxSPWBdNo7w/rvyRrTA7iYmNUyf5Lf/KfyASJaHO6bED0fcNi23iBYE6cIgtFsfnjdYkQTcjARm2Mnra5mazgw2ti+XeqaXpIMSPTgYmkVibeKBdJigDYZlbCoz3kCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SC0Wzkk0vrpuWScp9rCO/JK1BPNv+D9ewqBaSxjPg0W186qsXXlu6G/pUwWN8iQ8sTVtOAC6ahw4x/u13z1inkNKlz6qaqb9ZwqH+tHewgRt9GExykDfqxkLtbvG7DU987KcAeRFJY1U3YjCktSJoSSvHPdAsOwwEATbP1r2En5O66z9x3fsYMNEywRUGdAgoJF6C9Uij792b+IIOJ+XVNuvnzNre7IPH2OAV1r984EmnN2ln2OH1/fDImpTBlUDvIDWhdqEJ+/Dooi7f81Hv8l9A1hVaQJKj2y0LtnsMNstTnejBkgTLQolSLFZNx9wZo2Oj2obpqzdlih33WeEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zk4zOiWNbYQpvI40jer0If9lUD/pDnnhojW/u1puWLQ=;
 b=bxz7RmD354ZUANIZr85XscV70m93ZQkdk8fQGxBSAeHoBR3oro+CGoUcPJfIyehgp+62VPPJR6+4qSugw5AVWg0ziFnDuhInzIVMJyGqavg34ygcOIHCAyMBx0YRN09aIInnkZOH3v5KZM/R4UOFPSPW2t01J3InNaewCGBqLEp5CdNUVEL1rFS3n1BMY3dGjlBG1rqjo0/oDvslvEwy115gymHqPgTfcVt+d3NSWRNECpQyMCMtPtDtvQTwFOrx5uRDjHgnumacmJdFI4rvnUCLCHF/KqJtupxY7aM4WT9JENrmSYMRYXm8ti0vNzgXF7YGXueglW8sKn4bq6xilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1282.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 06:27:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 06:27:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Thread-Topic: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Thread-Index: AQHc09tvLatUK5oq3keSy4c9Ncpt5LX0VuCAgAxERvA=
Date: Wed, 6 May 2026 06:27:38 +0000
Message-ID:
 <ZQ4PR01MB1202F6E14D422C816A2975D8F23F2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <CAD++jLk_AQjjCLkeuiyBtiQUsmzHEfqpigttJ7E9n1UE8h29Hg@mail.gmail.com>
In-Reply-To:
 <CAD++jLk_AQjjCLkeuiyBtiQUsmzHEfqpigttJ7E9n1UE8h29Hg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1282:EE_
x-ms-office365-filtering-correlation-id: 523ae080-c64a-481f-d929-08deab389208
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 xBLOX4eJQlKH7sXpTuAu0CYDyoQNTVdpVpKGpp6+DLR8bU84TvZFrykf6jib7eEqLjDZ7fP0XCR5TwmNG5DmvtE+8EEsX5iN9eniMQBqbkkOGsB3oBuUkcJAQfaEe2BA27+bJvZyt7bSIqD7Uu3aE8nC0CXXUdETkKwadnFEaMF+VHgjfRbWJFr9f6XELxhL9bM4PrSsqiwNEKPqQlCJnYp060ja+metcqYZ2yFyyTBIWQx1n9w+XY4m8wwKGdTvU9D7VDOVH8q0v/F4oO/M5MXr8N8QNAcNmR0jtV/x9NT3/4vYPrNDSjxHKj8xeUSx445q6i/A6KXIEdekUe15UN8Vcj+t6Mdg5MW/0ed7guWksgRK/ZhyBytvdtVCAAad6ldaw5uqm2M0BznblaK4iUp8rvVC3e2bPh2WRqRTpZEwKYYkQJs5TMxRYbzj1hhgyatc3Tzc3yHAoGhArnvGSe59oNmgMckEFm/Qx7VejvEnXJtV50RwO4QKDoudvvdC1gVSbLFG9a5SS6kzZghzrzCo3lIrYqjCyj7KQGdODF0qw5LX/vNghbbBJ0zjNZ83
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzJaTGJFVklmTTRFWjRmdVplMTZzeUZUNmcvK3ROOWx4R25ZY0hKQ0xlS3d6?=
 =?utf-8?B?NnNrVlhZc0Vpa2VUS051TUljL0pPZm9OMmdKMURkN1ZybUZ6L1pDa3g5OTMz?=
 =?utf-8?B?MkRHTUM0bFE3WmtwRkNQdURwdml1ZGcxaGdOZzRMOFNkN3BWUFZoWUZuaXJ0?=
 =?utf-8?B?ZVJyZ1JqUFdzR0JGb1gzU000V3F0OWc5SnlxNEova0J2Z2JXM2pER24xamhs?=
 =?utf-8?B?Sk4xcE9QZFhMVmQ5dDRFeGJzN0xHN2IzNjhZOEd5WGtEVWFVK2ppaUd2WmVM?=
 =?utf-8?B?TDRFRzVoeUZ2amRGakFXb2NtS28xZFR6aTU1VCtOeGJjMU5ubU9CeWtQNlB2?=
 =?utf-8?B?REtnUmlCdW82T0JVaW5IUGo4aEZ1UjRuNmdCVUJEWVRyMFVuampWMVpXSmc4?=
 =?utf-8?B?MWxDdHhzWUxlUTlBdG5scjZvSC9tM0pVWDdKMFQ1NmEzcjlrcDJ1OHg5dWR4?=
 =?utf-8?B?UldCRVJ2NFU1VjYwa0pBRGNJY1djQ0N6RkxJWEVwZGErVjM5bWR6YmhUMUVD?=
 =?utf-8?B?NGtCcDJHenJRc2xpa0w2N2lpNVgrcnY3WmZQUkZDcGR3d3I3QkUvamg2blEv?=
 =?utf-8?B?bU5pc0llcGtIYkVTb04vaFJFaW5nS0xtWW91bHZmTjBxeExuK3M5YWhrOGIz?=
 =?utf-8?B?RThEYWt0SWxvNjhubEc3cThtRWs5ODBrU2ZaYVkyZDVFdjllYVZRRmQrQ2Vn?=
 =?utf-8?B?VWFROGVWb3Rkb3QxaGZzbXhaRnN2STJ6RjVLQWM3eTYvQ3JkTGZzSHkraWRi?=
 =?utf-8?B?blZoNWJBOVpSSGdJbzJQT3VjS2VxWkZhNWJQMnNmZnRRdXZlQkpYVXFKczJk?=
 =?utf-8?B?aHlxNlZ4T1luR2RhbXJaUlV0aGw5QjIycjhUcWR1aFYwU29aZVpvcWtqeE83?=
 =?utf-8?B?VzlDYjd4VFJURWV4cUhlcFZnK1QzbzgycDVwNlRUOU9VZXA3RjFOcDYvWEVS?=
 =?utf-8?B?Vk80ZDdhVzBlN3VPRXhxK2NtNDRRTUVsbXhKY2VOYmsvamsrTnV4ZEtMTkVu?=
 =?utf-8?B?YS80N1JiOFdLQVRsQm90b0VlVVdPUTJEVlJZc3dFbzVxN3RwVmwwUHRZVGp2?=
 =?utf-8?B?cWIwWTEwYnJucUNXK0EzTmx4dGhPWDFSNnJ0ZjV5ZE9OcytCVTh0L3JxZFda?=
 =?utf-8?B?MlZlc0t2Nkc0cGdkZjRKSm12bTJ5dzBkd0tYZmhXUTdoNW1SVG1JTTdSRFZR?=
 =?utf-8?B?VnZPSEdZOEZxTEpPR3AxQ0o2RWcxc2VTV0ZmWkVJYVJaZ3lCR1IwdVhKUENu?=
 =?utf-8?B?bFJ1a0RFQ215Zk5qejZTNjFFUHp6VWNkdHVIV0VUaUd6NWJ6UEhYQ1hzaVBT?=
 =?utf-8?B?bGJJbTYwQy8xR3YzM0VhNzRzVjFvSEU5M05jNXdSNTRRNUNHUFFKQit6RkNK?=
 =?utf-8?B?KzUvZWJ5Qk45SlE2WjFRR3BKSWFCbW16TUd3UXpaU09tQnpCQ2Q0WktqdDRQ?=
 =?utf-8?B?TzhLbDRmenBNdGs1Z2s2OHhUcDZHOHNVbEF1aDdvK2FEeUxDSU5tdnlQdDVS?=
 =?utf-8?B?SzNLUFVKR3dDalBNZVFNWDVESWNIb3ZiUFUvNzZDV3BDcnkreHVlK2F4OGE1?=
 =?utf-8?B?eE1NZ1VneTZQcmNkYzNCWEJ3emN3Rk5GaWR6Nis0RGZYbkVSYUwwVHhqNnVI?=
 =?utf-8?B?bmd1L1JMbEFxSFArWUhock1iMXhvQXNhcXFkc1NaelhoQnBBcFBWSE5GdC9M?=
 =?utf-8?B?SmlwVnZ0YWVBQytqSEJIYnBvb1diV2JkN05OMkhRSHl0bld2ZW9DbmdWSjl3?=
 =?utf-8?B?MldFb0ZWS2FEVW41Z09WMjZkTmZJZlJ0RzZRQVNMMmFMNTdEaUFhM1UyaWt6?=
 =?utf-8?B?VVJpY1pHOUdMTzJHempCNkxrN0NtWFV3NDlmK1YzT01rMHdmV2xsUThXWkYv?=
 =?utf-8?B?MnBGZ0Nnalc1MURDT1NZazhDdlRobEdSbkY2dFJDbVFzaW04WWM0SXd1bHRn?=
 =?utf-8?B?QmtXN0dYOU55SG5rZGJWcWsxTjdLUDRWN3NYN3JwQU4xT3ZwbThmWWVWZk9n?=
 =?utf-8?B?ZEl6b1FMM2E0dkpXaXQvVkJRSWJHMllKbGtCMDBZMHgwMEpscHRUV25XbVdB?=
 =?utf-8?B?c1Nja2xtMzc0YTJTSFFZWEpZR3VNa1I5MGNsQXk2d1dLK1pFbUx6NHVvSXd3?=
 =?utf-8?B?aGZXWGkyUzFKS2NIVjc1eW9pcnRkOEFNMnc4U0hjT3l3REMvZERIOXdQbmZm?=
 =?utf-8?B?NmJtaDMyWlQ3K3pvZUEvM0dIcmRTRy94Y0l3LytVd1BuOHNRS1pHTHRsd2hT?=
 =?utf-8?B?Qm12UzA3MmhxbEpvNGM4WStWTFFiSElXeHdkOElaMmZyRW9yQlRSTFBrbE9w?=
 =?utf-8?B?NDArbzJPUXppK2hsTFoxZkV1RnRyVUtoL3BLVGdKSkVvRE5Dc3hSUG5PSDZZ?=
 =?utf-8?Q?v74umVy2bXkTa2Ak=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 523ae080-c64a-481f-d929-08deab389208
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 06:27:38.9366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FT7U2J//cYDqnfUIFM9Vzle5GDdI8fMQJNLsocuTcBYfDzz7+1oFzHfzSPPsdAUBq1RlGfsSYllTMBclfvEL/w8UULmIylFTvgLZqFmu1Kca1CAGqi3D59Sw6rjL27dK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1282
X-Rspamd-Queue-Id: A484E4D8530
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36267-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid,starfivetech.com:email]

SGksIGxpbnVzDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBIaSBDaGFuZ2h1YW5nLA0K
PiANCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gRnJpLCBBcHIgMjQsIDIwMjYg
YXQgMToxNOKAr1BNIENoYW5naHVhbmcgTGlhbmcNCj4gPGNoYW5naHVhbmcubGlhbmdAc3RhcmZp
dmV0ZWNoLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFkZCBwaW5jdHJsIGJpbmRpbmdzIGZvciBTdGFy
Rml2ZSBKSEIxMDAgU29DIFBlcmlwaGVyYWwtMShwZXIxKQ0KPiA+IHBpbmN0cmwgY29udHJvbGxl
ci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcu
bGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gKC4uLikNCj4gDQo+ID4gKyAgVGhpcyBkb21haW4g
Y29udGFpbnMgNCBJTyBncm91cHMgd2hpY2ggc3VwcG9ydCB2b2x0YWdlIGxldmVscyAxLjhWDQo+
ID4gKyBhbmQgMy4zViAgZ3Bpb2Utc3BpIC0gY29tcHJpc2VzIFBBRF9HUElPX0MwIHRocm91Z2gg
UEFEX0dQSU9fQzQuDQo+ID4gKyAgZ3Bpb2UtcXNwaTAgLSBjb21wcmlzZXMgUEFEX0dQSU9fQzUg
dGhyb3VnaCBQQURfR1BJT19DMTEuDQo+ID4gKyAgZ3Bpb2UtcXNwaTEgLSBjb21wcmlzZXMgUEFE
X0dQSU9fQzEyIHRocm91Z2ggUEFEX0dQSU9fQzE5Lg0KPiA+ICsgIGdwaW9lLXFzcGkyIC0gY29t
cHJpc2VzIFBBRF9HUElPX0MyMCB0aHJvdWdoIFBBRF9HUElPX0MyNy4NCj4gPiArDQo+ID4gKyAg
RWFjaCBvZiB0aGUgYWJvdmUgSU8gZ3JvdXBzIG11c3QgYmUgY29uZmlndXJlZCB3aXRoIGEgdm9s
dGFnZQ0KPiA+ICsgc2V0dGluZyB0aGF0IG1hdGNoZXMgdGhlIGV4dGVybmFsICB2b2x0YWdlIGxl
dmVsIHByb3ZpZGVkIHRvIHRoZSBJTyBncm91cC4NCj4gDQo+IFNvIHlvdXIgaGFyZHdhcmUgaGFz
IGdyb3VwcyBhbmQgc3VwcG9ydCBzb21lIHByb3BlcnRpZXMgb24gdGhlIGdyb3VwIGxldmVsLg0K
PiANCj4gU28gZXhwb3NlIHRoZXNlIGdyb3VwcyBhbmQgbWFrZSB0aGVzZSBwcm9wZXJ0aWVzIGNv
bmZpZ3VyYWJsZSBwZXIgZ3JvdXANCj4gaW5zdGVhZCBvZiBpbnZlbnRpbmcgcGVyLWdyb3VwIHBy
b3BlcnRpZXMuDQo+IA0KPiA+ICsgIGdwaW9lLXNwaS12cmVmOg0KPiA+ICsgIGdwaW9lLXFzcGkw
LXZyZWY6DQo+ID4gKyAgZ3Bpb2UtcXNwaTEtdnJlZjoNCj4gPiArICBncGlvZS1xc3BpMi12cmVm
Og0KPiANCj4gQ3JlYXRlIHByb3BlciBncm91cHMgaW4gdGhlIHBpbiBjb250cm9sbGVyIHRoZW4g
dXNlIHRoZSBzdGFuZGFyZCBwaW5jZmcNCj4gcHJvcGVydHkgcG93ZXItc291cmNlID0gPC4uLj47
IGZvciB0aGlzLg0KPiANCj4gRXhhbXBsZSBmb3IgYSBzaW1wbGUgZGVmYXVsdCBob2c6DQo+IA0K
PiBwaW5jdHJsIHsNCj4gICAgIC8qIEhvZyB0aGUgUVNQSSBwaW5zICovDQo+ICAgICBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KPiAgICAgcGluY3RybC0wID0gPCZxc3BpX2RlZmF1bHQ+Ow0K
PiANCj4gICAgIHFzcGlfZGVmYXVsdDogcGluY3RybC1xc3BpIHsNCj4gICAgICAgICBjb25maWcg
ew0KPiAgICAgICAgICAgICBncm91cHMgPSAiZ3Bpb2UtcXNwaS1waW5zIjsNCj4gICAgICAgICAg
ICAgcG93ZXItc291cmNlID0gPDI+Ow0KPiAgICAgICAgIH07DQo+ICAgICB9Ow0KPiB9Ow0KPiAN
Cj4gVGhlIGdyb3VwcyBjYW4gYmUgb3J0aG9nb25hbCB0byBvdGhlciBwaW4gaGFuZGxpbmcsIHRo
YXQncyBmaW5lLg0KPiBJbXBsZW1lbnQgLnBpbl9jb25maWdfZ3JvdXBfc2V0IGluIHN0cnVjdCBw
aW5jb25mX29wcy4NCg0KV2Ugd2lsbCB0cnkgdGhpcy4gVGhhbmtzLg0KDQpCZXN0IFJlZ2FyZHMs
DQpDaGFuZ2h1YW5nDQo=


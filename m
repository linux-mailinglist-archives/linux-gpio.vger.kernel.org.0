Return-Path: <linux-gpio+bounces-36363-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI6XA/Zh/GkZPgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36363-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:57:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7824E6563
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E0653004D92
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 09:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB6C3C5535;
	Thu,  7 May 2026 09:55:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B73C394474;
	Thu,  7 May 2026 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147759; cv=fail; b=nasTpaYT85y47eys9xAqhm0L0mfY72P5xvtMsL01Z78Li2r9H1O/8WWn5G+X9+pfg5RYK1ZL0JLTh9ONIjlZuS1H9Z3lxst3g/4z0fuZJQeSRbWgRGTpu1Cw1WaBRbOzN8zMu0bTloNs3pwjsdN4r31d51+NcXz1vCrLTOSVe5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147759; c=relaxed/simple;
	bh=P/9NgJ8JJOD2uF+YrGfsq+fw0D3/VMAI7b2y5DrTqT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NWGQCyo5+XAjl8x6TTaB+LH7nhIaCU8SCukgxno0WeTGH4smVYrqQanFME8waKPaxEuAucuCTUroe7Q7uL36IhgHh6BJ6Ssy0scJEIR4b+j6jAwJt/w6DRtMnkwVEJSUhwAulSAOOURppjS0RmOeXk/nZ38KH9W4Amj2mxGDieQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkvC0r2iNbCcomH0TrE3dDUrm3sFmCyKJNBVvE/Mlm3DyMnyV6I1uXmjkYfBrd/m5SRkfYNSq5xpg1Ii7o/kTyqh2ZytG043anNIkR3385SfqrPxwGUlmYWqxgrm6ARG3Jg3awTwSDmMjcnzGucLxufkLjDFoCwhCfZMmGK+iZ3PbntfdRwzaKqCHQ6hnvwFtcOcOinJzwiIx0Z92B604nVRnqMRZ26UhLEQnLgFscKs+YXkmJ1K1C0fs0CTzam4uT6aNgp+OtcstjHcBXeBxDwNJBJ9bWbZ9VAHuub2WbOw1CZ0NEeMwYiTyHVZZd0Kag+wiayLFvJhe8P8OdoUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/9NgJ8JJOD2uF+YrGfsq+fw0D3/VMAI7b2y5DrTqT8=;
 b=EZry9PNVxsqRLOmbdWq0GHlxM8Qg4xT02iLBnosmXtJKYm8aeIsVTo2NnIyrQ92jCdAqI4MzA4AQlzb0Sx4Sg73zVeO3njkxJ+ogj/L/jOUW1mLPg10NJW2d4lmJ/OJfHSKYLiUgtLu8yMLrUydXheXkkVxprPtCQQVWO17JCdDiw4d0Et00steALPPpv64sGFPGMVxSn7EKsDIh/VdbyelV39oSXStcoEow4r3PTbzAqb5Bvn/WSlM9YwOnqAmfQkUEm6WmynQx0VqG2bD66F38/9QY4wDVefkYd+JBPwHbdYNAAWwviQ5LbrjyV5OCDtaZjAQFj+cxIAr5Q0u1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Thu, 7 May
 2026 09:40:19 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%7])
 with mapi id 15.20.9891.016; Thu, 7 May 2026 09:40:19 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>, Conor Dooley <conor@kernel.org>
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
Thread-Index: AQHc09tvLatUK5oq3keSy4c9Ncpt5LXubvkAgAVF1NCAASNvgIAIw5iAgATHe5A=
Date: Thu, 7 May 2026 09:40:18 +0000
Message-ID:
 <NT0PR01MB1216A40D68A84F944F4CEABCF23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud>
 <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260428-hardhat-both-1c9aa594a45a@spud>
 <CAD++jL=96gzBL-VzNi3WtZQvhVgqATV1GwsnyZkTzNC1OiMa5g@mail.gmail.com>
In-Reply-To:
 <CAD++jL=96gzBL-VzNi3WtZQvhVgqATV1GwsnyZkTzNC1OiMa5g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1216:EE_|NT0PR01MB1005:EE_
x-ms-office365-filtering-correlation-id: e6bfc3c1-5808-4e18-f5a8-08deac1ca6c3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Y+CXZ8A2IPCv04G6CC4aZkKZh+yad5uZzf4sagBlMxR2/xrEBzJmn93c1Qis/kNQN9R9gZJm18gSBEoOsN+zzwAGzLa9q+6wDZaMTeC1gsKLPyGvLrNtTWUQ1omquO63MhYCSyqYIU3dtVApBZHzNl27lQHNkXMxIgS+OT9gb7oNIbJIpScLV+53ZRgsYsv+00rx1Buu3/PpZd8H8Agv6f5DH2GsBnD9cdypC294ewfBBiMeWzppxUk0zMLE89WkjIpoRBVnnOR3ZlXwXJx9REKqzIF3dNvvof4DtUBDtBwu90TVONmWM7Jkpzt6enJIVNu7V0REA4VHVOqpq2ri52kqYqKNu75CD0Ic7Imd5zcyDJqvmC+K4ioFSfkpwwt91Es+qwBVK4srR0zhobuh4nqsAYvASMis8VZSOJiD803Eui7ZmILx4iqSvAeBW3V58D2+BeQP0DsOm8GAMUhn0ZOhlATCXCyB92pt8xn4mlk8AEvKoCi0XH9aR+0+QcG22aPLHgtRt2tiav4v7wxjYrh+kIgJlS+ex0BQ1U6CECALHU1AiUNc1Z9cdwkCttNQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDluT3doanV2QTJnTmY4M3VNdk44VEFKSmpSV3RTM3hkM1IvenV0OEJnQTdj?=
 =?utf-8?B?bFBUOThaekVpTWx1amdZK2VKQW53TnptWHc0dlo4Q0ZKWmJoUXpzTGE0dGVr?=
 =?utf-8?B?SUNOeEpVME1iZEhSeGZEeTlaNWVYUkJGSHNjR1NBSkJyWHo4SFd3NnZ1TGxo?=
 =?utf-8?B?SFBDbG42eUo1Si82NXdTV2JDbHJYTW5DZnhBbFF5aU05ODkxaEYvVmZSZDVa?=
 =?utf-8?B?WmswNllubXFkNEI4ZHhIZDhPekdJTzd5YXpuSFBBWGpERlZjRjMzc0NMeTF1?=
 =?utf-8?B?aEJoT0E1RVZ3dWtReUJxYXJKNWlLTk15NE9GS1Q0bTFKTHFvK2g3VVRlZXRj?=
 =?utf-8?B?eForeEZ5MDhCVC90aUQrYUprcGpJcDJmTnB4emNzblVlN0Q0NHJKVUVNZDhC?=
 =?utf-8?B?TEQ1dUZRRXoraTFNN3BKTXdxTFdSc0FiWGxQcWN6dnZCdnVHVE9YV2Z3OGE0?=
 =?utf-8?B?SDZmbG9YUjMvZXV1Nm1tdEhCcmVrdUpqei9jMjBaeVYxQmR5NzFiNnJHWDZX?=
 =?utf-8?B?TzE2U2ovRUJrcTd0cHJvTWdhY1lHYmhZZk5pbCsrTk0xcTFtcFZGcy9BVE1m?=
 =?utf-8?B?d29qZEY4VHZxeWl6NWk1bE9pM0w3bHB0YUkzamQwQzZtd283QXhEcUlrS1NM?=
 =?utf-8?B?Qjg3Ymo0cERveFp0L0h0V3F3L2dSaGoyRjNkZGtXY2puKzBoSmpZVm1rUnJJ?=
 =?utf-8?B?OU1qdXBmQlRJRzBETHJ6Rmk5WmFNRGlia0h3VXRNRmwrVmRMWENjWDR0eGJC?=
 =?utf-8?B?R1l6YVNSMUs3eXVhalNjMFV5bzlDUTk0Nk9OUExSTkFudUxURVRxZzA3VU9P?=
 =?utf-8?B?d3ZjaDgzWkNiTGtTQ21GMHhzN3JXOVpMVWtKejdQRURicWV0d1NWMzh2UHNk?=
 =?utf-8?B?VUNYQy9LUWxJY2dWN3lwNlJLdFBub01EQXdDVU9aNStjREQ1K3V0SHUvbHNS?=
 =?utf-8?B?dllQRzQwbGh5cGtrRS9ocVpHTFR5a0pvOXFIMUtpOHhPOGdsaGdOeU1uQmNR?=
 =?utf-8?B?K0Nwb3JDUkoxVGVlUWpqb3lPc3gzS0kwMkZLMStGU2piYmJUQ2NocUgyVC93?=
 =?utf-8?B?dVg1eXFHK0ZjRUhHQkpDcWNLK1d1WXRvdXlzVzRwNXQrd3pGTnBvSWRoYkt3?=
 =?utf-8?B?T2lLRmhjWFRKWlZhbFJxVmUyR1JSNzd1SmRPUnViVzJhR2pSajIrenU2SGZw?=
 =?utf-8?B?YzhJbGpOck82TTdnMDhkemNYcC9RZldTZGdrODF0ZGdXR0VHZHRMeEkyV2Nj?=
 =?utf-8?B?T284SHgrR1pxdXRLVUlVM0hKWTR0clhkRW0yd3hwQ3F5OUpmTVdiVnBENDBX?=
 =?utf-8?B?ZGZ0V3grOWtLRDNveVFKRmFKY3Urandya1YxQlk1RlhiaVcyMlZVMEFhdHlR?=
 =?utf-8?B?TFBudGYvcm45ZktKVyt3eHNxb2g5SmdXVytsTDFhd1lTeUFOT1NYSURXaUpU?=
 =?utf-8?B?blZ2WHNFdGpxTVFsQVhRZUhKZkEyRkNPNkFxVG1DSUJ5dHREQ3c4aisvU21o?=
 =?utf-8?B?cWptLzNTdUdQNXRuS255SkZLbjU4a2xyc25LSDVSbjljcDJxL3VENUY2c1R2?=
 =?utf-8?B?TDRBTDlZenRNSkhsUFFIRk5yYlI1d0JyOGk2OVYvYXlsWlJFYzdwZFE1bzNL?=
 =?utf-8?B?OXByRWtycHBBL0R4ejBIZnU5anV2b2dORHU3TlNWbDV3d3AwSUNSaHVHdHZB?=
 =?utf-8?B?VVNyd09nbjdrVGVBazBGN0ZXU1BUdlQwcUN1M3ZKRFJtWmZBazhXTDBwL05n?=
 =?utf-8?B?b2NzUUJ0MENmNTQxRkFkV1hiVzRJaE50RkQrK1VXUTRUQitwN0pFTmc3Q1p5?=
 =?utf-8?B?VDRFKzlXVEluVEp5T2IvbkZZMnlmWWdZOURtZTJ2T0ZIUXhKRmZ5aDVJdjJ4?=
 =?utf-8?B?aHRCTlVpL1drZWh1UmZlR1dlUktjRVJaNXVjYVN4SW5oTmM2NCtlaHNUUTFR?=
 =?utf-8?B?SEVDc3hQTStjcDBkUUxVQVhvVnZhT3VCaXlvdXYwcDd1ZGlkTVducjZKOEY1?=
 =?utf-8?B?RU0vd2tEbDZXT0FkS2ZmT0QyVGp6S05uT3lZSkFOWDA4WUpScmZyTktWTi9Q?=
 =?utf-8?B?dERwcE85MlNFNEd4NDF1Mm5hUk5zQ0RnRWZtd3Y1eHBSZWwyWVpYM2xCams3?=
 =?utf-8?B?M0hxOExLVHBTcEhCRTFFVEg4S2YvVEdpZUl4ZzJvNGE0eDJqdzZOOHpTMVFE?=
 =?utf-8?B?M09tWGlHQWMrYmxDYnBWM0ovZkVNS3EvU21yaUQ1bkJYV2Jka0hCL01GY3dF?=
 =?utf-8?B?bFRUdDUvWHZ2WDZKNFkzWjJtMCtlQmJRTENNejdxeXV1TVZTQk5oR1hnOHNh?=
 =?utf-8?B?b0hVQ3Y5M3NObHVOSnNVamx3ODhhZDBER1NyWnFOSjBqSk5FN3d6VG85d0VZ?=
 =?utf-8?Q?VTRYtgzMt7p9eyvg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bfc3c1-5808-4e18-f5a8-08deac1ca6c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 09:40:19.0088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: En5YlQ0Tff6wkZO9JSRPn3HNxVbTTDMDvjB54CnKFuISxIcCIY+5a2/cKFJMiaQ5NzsvnsR5+LWYDeiRY7kLkemlrlZE2xFK9jAoDu7y05RWsuzqdqeOm3AN7agyuC3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1005
X-Rspamd-Queue-Id: CC7824E6563
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
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36363-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

SGksIGxpbnVzDQoNCj4gT24gVHVlLCBBcHIgMjgsIDIwMjYgYXQgODo1MeKAr1BNIENvbm9yIERv
b2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6DQo+ID4gT24gVHVlLCBBcHIgMjgsIDIwMjYg
YXQgMDE6Mjg6MDVBTSArMDAwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gDQo+ID4gPiBX
ZSB0aGluayB0aGF0IGltcGxlbWVudGluZyB0aGlzIGluIHRoZSBwaW5tdXggd2lsbCBiZSByZWxh
dGl2ZWx5DQo+ID4gPiBzaW1wbGUuIEl0IGF2b2lkcyB0aGUgbmVlZCB0byBjcmVhdGUgYSBsYXJn
ZSBudW1iZXIgb2YgbWFwcGluZw0KPiA+ID4gcmVsYXRpb25zaGlwcyBpbiB0aGUgZHJpdmVyLCB3
aGljaCBzaW1wbGlmaWVzIG91ciBkcml2ZXINCj4gPiA+IGltcGxlbWVudGF0aW9uLiBJJ20gbm90
IHN1cmUgaWYgeW91J2xsIGZpbmQgdGhpcyBleHBsYW5hdGlvbiBhY2NlcHRhYmxlLg0KPiA+DQo+
ID4gSSBkb24ndCByZWFsbHkgc2VlIGhvdyBwaW5zICsgZnVuY3Rpb25zIHdvdWxkIHJlcXVpcmUg
bG90cyBvZiAibWFwcGluZw0KPiA+IHJlbGF0aW9uc2hpcHMiLiBJbnN0ZWFkIG9mIGhhdmluZw0K
PiA+ICsvKiBwaW5jdHJsX3N5czIgcGFkIGZ1bmN0aW9uIHNlbGVjdGlvbiAqLw0KPiA+ICsjZGVm
aW5lIEZVTkNfU1lTMl9VQVJUX0NUUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+
ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX1JUUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX0RDRCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX0RTUiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX0RUUiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUX1JJICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMF9U
WCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9V
QVJUMF9SWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNf
U1lTMl9VQVJUMV9UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5l
IEZVTkNfU1lTMl9VQVJUMV9SWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsj
ZGVmaW5lIEZVTkNfU1lTMl9VQVJUMl9UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0K
PiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMl9SWCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUM19UWCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUM19SWCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUNF9UWCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUNF9SWCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJU
NV9UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lT
Ml9VQVJUNV9SWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZV
TkNfU1lTMl9VQVJUNl9UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVm
aW5lIEZVTkNfU1lTMl9VQVJUNl9SWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+
ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUN19UWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUN19SWCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUOF9UWCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUOF9SWCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUOV9UWCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUOV9S
WCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9V
QVJUMTBfVFggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNf
U1lTMl9VQVJUMTBfUlggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5l
IEZVTkNfU1lTMl9VQVJUMTFfVFggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsj
ZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTFfUlggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0K
PiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTJfVFggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTJfUlggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTNfVFggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTNfUlggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJUMTRfVFgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEZVTkNfU1lTMl9VQVJU
MTRfUlggICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+IHlvdSBqdXN0IGRlZmluZSBh
IGZ1bmN0aW9uIGNhbGxlZCAidWFydCIgYW5kIGhhdmUgYSBzaW1wbGUgbWFwIG9mIHRoYXQNCj4g
PiBzdHJpbmcgdG8gdGhlIG51bWJlciAxLiBZb3UgZW5kIHVwIHdpdGggYSBzaW5nbGUgYXJyYXkg
d2l0aCB0aGUNCj4gPiByZWxhdGlvbnNoaXBzLCBub3QgbG90cy4NCj4gPg0KPiA+IEZyYW5rbHks
IHBpbm11eCBqdXN0IGRvZXMgbm90IHNlZW0gYXBwcm9wcmlhdGUgdG8gbWUgd2hlbiBpdCBsb29r
cw0KPiA+IGxpa2UgOTAlKyBvZiB0aGUgcGluIG1hcHBpbmdzIGZvciBhIHBlcmlwaGVyYWwgc2hh
cmUgdGhlIHNhbWUgZnVuY3Rpb24NCj4gdmFsdWUuDQo+ID4gVGhlcmUgYXBwZWFycyBvbmx5IHRv
IGJlIGEgcmFyZSBudW1iZXIgb2YgY2FzZXMgd2hlcmUgdGhhdCBkb2Vzbid0DQo+ID4gYXBwbHks
IGJ1dCB0aGF0IGNvdWxkIGJlIGhhbmRsZWQgYnkgaGF2aW5nIHRoZW0gcmVwcmVzZW50ZWQgYnkg
YQ0KPiA+IGRpZmZlcmVudCBncm91cC9waW5zIG5vZGUgd2l0aCBhIGRpZmZlcmVudCBmdW5jdGlv
bi4NCj4gDQo+IEkgc2hhcmUgQ29ub3JzIHZpZXcgb24gdGhlIG11eGluZyBoZXJlLiBVc2luZyBm
dW5jdGlvbnMgKyBncm91cHMgYXMgc3RyaW5ncw0KPiBsb29rcyBlYXNpZXIgZm9yIHRoaXMgaGFy
ZHdhcmUsIGFuZCB0aGUgZHJpdmVyIG5lZWRzIG1hbnkgY2hhbmdlcyBhbnl3YXkgc28NCj4gSSB3
b3VsZCBzYXkganVzdCBnZXQgdG8gaXQuDQo+IA0KPiBBIGNvbW1vbiBwcm9ibGVtIGFtb25nIHVw
c3RyZWFtIGNvbnRyaWJ1dG9ycyBpcyBwdXNoYmFjayB0aGF0IHNlZW1zIHRvDQo+IG1hc2sgdGhl
IGZhY3QgdGhhdCB5b3VyIG9yZ2FuaXphdGlvbiBoYXMgYWxyZWFkeSBkZWNpZGVkIHRvIHVzZSB0
aGlzIHNjaGVtZQ0KPiBiZWZvcmUgZGlzY3Vzc2luZyB0aGluZ3Mgd2l0aCB0aGUgY29tbXVuaXR5
IChiYXNlZCBvbiBwcmV2aW91cyB3b3JrIGFuZA0KPiBhc3N1bXB0aW9ucyB1c3VhbGx5KSwgYW5k
IEknbSBub3QgaGFwcHkgYWJvdXQgc3VjaCBzaXR1YXRpb25zLCBzbyBwbGVhc2UgdGFrZQ0KPiB0
aGlzIHRpbWUgZm9yIGFuIGludGVybmFsIGRpc2N1c3Npb24gYWJvdXQgY29tbXVuaXR5IHdvcmsg
aWYgdGhpcyBpcyB0aGUgY2FzZS4NCg0KVGhhbmtzIGZvciB0aGUgY3JpdGljaXNtLiBJJ20gbm93
IHJld29ya2luZyB0aGUgYmluZGluZyB0byB1c2UgdGhlIHNpbXBsZXIgDQpzdHJpbmctYmFzZWQg
ZnVuY3Rpb25zK2dyb3VwcyBhcyBDb25vciBzdWdnZXN0ZWQsIGluc3RlYWQgb2Ygb3ZlcmNvbXBs
aWNhdGluZyANCnBpbm11eC4gV2lsbCBzZW5kIGEgbmV3IHZlcnNpb24gc29vbi4NCg0KQmVzdCBS
ZWdhcmRzLA0KQ2hhbmdodWFuZw0KDQo=


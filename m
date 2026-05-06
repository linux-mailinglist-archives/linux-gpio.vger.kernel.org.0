Return-Path: <linux-gpio+bounces-36279-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLGCCdQW+2lGWgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36279-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:24:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64E4D94A7
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 821D83004C00
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 10:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB23D3FCB10;
	Wed,  6 May 2026 10:24:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2092.outbound.protection.partner.outlook.cn [139.219.17.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D53DC4D2;
	Wed,  6 May 2026 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063054; cv=fail; b=DVLDK00Oa8jbBhmtHZyV8nXcvB+dOdcraOP8CQbafzz4k/50ptlf5hPOFJ811htewaXiESi4A4TpyA48mBA/wxyUGzrSMN+g/wBiD7KMLImqpTY7o/qsHWz7KjsF7FTGBRbOYLp58dmR75N5Zhms48IcAHy/QsDS2H2/NpkQlUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063054; c=relaxed/simple;
	bh=GdpWhH98MVJ3kbxkyDxVUKbXwsecWwnxXuiCFFPOG/I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ANaAacjm1RcbGj5yZMWNZxYJodQ0NPhsrrlLDcmy/cjSndfTOkRxhUuxaFURtyYuJQNrTr59gFxZt0yFRVBwlUZBooA+8M8xeRkh2ioyzraRhGtQot/zQJzyOlZJ9PBUn6f0W0NCb5zKSIUZCszfCJGCFxLL+1207DF0nPf4EsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggynuLs0wpgfS23gWj5r3dwhpViU8z485gumqDeD4kQJbT5X7m4fzTEx5iAO/CFAcvDdXL8qGY0Eh+04pAta/DuWtI8clBXxNIV0bLHxr9BxN3NUF3R/QWExwvyWtkxOa4r7+adIaiNBHyvdbsab0EcfrS1X7g9HDlXuibWBj5Ncs/t6IDIg8kRbYX7LmYqz4/9TYOSBQIGJZFnDo1D1LXCGWZwX7ZhTivIVW5W8MA3v151h9FXZEh4jWqOMYzmY08gmFDuiQMj2vxLVeGYJAgicjKODoTDxYWcQpu1sTPDV066/IQUrTO/JV69kVXValSbk3CBHblgDj0xoMK8BGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdpWhH98MVJ3kbxkyDxVUKbXwsecWwnxXuiCFFPOG/I=;
 b=jGZHnLoNQz30NB0DGorBYFHRj9838P/4z6flAyGAS4k8QWhpbWsvE1YxI6H3ZeF5iVd9/35xPIVWD+sUAKwHdMy2ycOZNtm8AVsokUMCwJik2OscVktAoZAUmfheDlN0k/EfeMXytA4KO35yDW9hK6C9Gl+ii/qoTxK6CRMxCKUyIbzm48Zd5JDQPSnfkeiJp6tOE29qyJOs8ifgPdKhyQS39AGGydtExXyixf95QzOeOfEkecHtWxOVA3tpE0qKsX6un1ranP20huCZG9X32WLGLPXzGlfaYs9BD+ucAPFyzVF24qFwgSnhprdv7KXMwhwFUukU+iu5iSuRer5j/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1331.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 10:09:02 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 10:09:02 +0000
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
Subject: Re: [PATCH v1 02/20] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v1 02/20] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHc09toUDrQndxBAkGH32IlCyxtgLX0TCQAgAyM3TA=
Date: Wed, 6 May 2026 10:09:02 +0000
Message-ID:
 <ZQ4PR01MB1202A795C23E566331F5939FF23F2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-3-changhuang.liang@starfivetech.com>
 <CAD++jL=Pxz-=cTPCuoL-j0fqJymrHN9BE5w-SCxq4_9S1KDtXw@mail.gmail.com>
In-Reply-To:
 <CAD++jL=Pxz-=cTPCuoL-j0fqJymrHN9BE5w-SCxq4_9S1KDtXw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1331:EE_
x-ms-office365-filtering-correlation-id: 38019db4-3842-4aef-09c7-08deab577fa1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 v61z3FpqejOLqK4WCoI1qausjRyr3FP+7kUyHSOMCcmEdiAC4Sqnu9osf6KOyOSXpWar9ZbyOrAH9QtKTWaBfLCM9LeTd8HOd7R+l9G/db7kZMjfD9F7i04NY2m0mXC+1gSgPompC4nfFgo+vEUOZQMlm8fOHqsRmhErI+oI4c5Xl10mbQr/Pd25zta6ws/80rl0y0Cj4x+KPvmuhQ1LLokKDt3G8bh3rAmh818Uo8msDGNDXXfZE1y/kug2nwRzaiO6FOI3KC9LA1Kw5vzEsLzw7YB3xT0K99O521WKAf3RC69h+c131ATqk+f1rJj84ZCRB3PREl1jQbwkKleMc2tVQk2k7IYkMx1h7bBK/rHqwcyD0Gyj62gQYMrlQ5ZA1CgYMjdPl6a2K2hdD3ybyKCwUrzEwsDf7AVsLAkazLSPnWKFVfGECQKf9HUS0pcKStQB8tn9hJKmKh1FTDGMPE5ICQjaX0HkXRDUZBilw0g3fLFC1arSOGugJcWR7kZjJn+A1oezrOuyDPJ02KB/Tju9BkzTiRekfK9/VlkwgDdgPL2FBeKWD/jWIqcDfyF3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VFo0M3JVVG5oeHN3K2hvdjd3OWkvbE9NWFg4SEtOUW54TDBkNWE0L20rOGhs?=
 =?utf-8?B?dmRRd3Y3SU5rcXRVV2R2dWFxMVEramx4M1BUVmMzNWZsVHBrMU1ZcWx2TFdW?=
 =?utf-8?B?dGxjVzJLN0VicWxHYVdMSE9WWE9HRXcwcTNINlFqc3F6UkdabEVXcUxCVkpL?=
 =?utf-8?B?cEVBbnBqSUdaZjZjRkN1RFR2MDVGVjVsVlZUbFM2UnIxUFNhcnJhRjdtRDUx?=
 =?utf-8?B?SFBUbHFhOTFqeC9ZMlNHdXZNUWV6NFFRNzFSVnBQeG1rekZ3WUozM01lSW5i?=
 =?utf-8?B?VllPbXZpczFxT2Q4dE5ybldNNUh0OWFrakxSbGVkdXZsT3QwWTBxSitIdVdM?=
 =?utf-8?B?NHBwWWRNNFllVkNUeFpnQU4wdnRITm8zRVY1U3g2MUFPQnlhYzJTK2hvd0Ry?=
 =?utf-8?B?YW9qb1cvOHdRWGM3QnMzMXpSRVNTbHBSLzhsY1d0ckRlbGQ4KzRSOXlWSkVz?=
 =?utf-8?B?YmxQVnIwQlhxcmg5L2w1S1MwazZRQ2dTdnd3TXNGQWhyeU1LSDZpcVlDVXF2?=
 =?utf-8?B?amNkcSsraWYvRmtBZEMzWmFmOWZ3TkxNdnpPMEU0VHg2SXkxTFRXZEQwVnpo?=
 =?utf-8?B?U0M5c21vTTNYY3pZWDlSNmgyTjdLZDRxSXZYSnFOZWhhY3dxUkxqQVh6Q3p1?=
 =?utf-8?B?VFZ3blgzazJvelplYlZrbUM2SWJRQmpWdnoycVZxaXhNL0U3L3gzQVpPcGRt?=
 =?utf-8?B?VGhkNWdaOUptdEpITlB1ME92S0MxN0hmWlN5bVpyMW1FVVVid013eFR3Qitp?=
 =?utf-8?B?STM1b1c5bk5zcE1oaUhwS1E3clczZmVjSTZPcGoyckVnajdIMnZvWHd5aTZh?=
 =?utf-8?B?cVFRUEM3Vit0M1lXVFBrVzQ1c3lLNlBJRjc4WVJFK2hNVzd3MmZ0TkU4dXF1?=
 =?utf-8?B?NHJSV01KRy9aMlZRekZWS3RWNU9zVkFjUkc1MWdocjYvOTVGZ0ZWejQvVjN4?=
 =?utf-8?B?NytHOGVmSGZJL3ZLYXZBOHJpdkp6dml6RGdsU3h0T1oya3VDKzFFc0V4Yk9W?=
 =?utf-8?B?eC9NWGduL0g1SytrRGgzcmhWL3ZPSWFLU2VZdWRuYjIxdFlrRzJLWE1reU1X?=
 =?utf-8?B?M1U5akJMNjB2RHUwemROM3lkTWtSeEl4eXdUbE01SUI1RmdlMDRub21ML2x0?=
 =?utf-8?B?ZTJpR1o3NUZKdzI1MzhiSERVejc2eUI4Y3lmRVF0Q0FmUklMaEQ2dW1sbVRI?=
 =?utf-8?B?Z3FQcWdPdXl6ZG9NTEd6SHI4TmNyZXp6WEF0RTFTYjNlemRoenpobTczZnV0?=
 =?utf-8?B?RVpHcDBRU2dlVHpiaVdwNUwzWkNvOVlNREhMSDI5VFVRUEowNG4wWXJzZ0wr?=
 =?utf-8?B?dWYvN2c4R3dLWG5WMW52VHZmVzlGU244YkQyby9Fd2xrM3QvYlk3TElKRjJI?=
 =?utf-8?B?TXpOL04xRjcvSnZnRGlTOExxNTJYNU1MbnMzLzlBM2tFWngxd1BXTGtlODhi?=
 =?utf-8?B?UDVqY1RNRXFSVWtFeHF4ckhGMHZWT2hkczcyNlFDRWlaQnlhRmpxVWw0Mm12?=
 =?utf-8?B?ek5ETHRaQk9FSmxWaUpZRUg4WE9WNUdpZE42RWNVYmNJWms4WTkwNDBYU2Zq?=
 =?utf-8?B?NEdqUHFUWVdtSFJJOTE4bk43NUdGNVJ4N2tVaUQ0SGc0d2pZU3MzSHBQbVVj?=
 =?utf-8?B?ZW44TVg5a2IrQTBxUVhHRzNKUWxTZUFEa3lETjkwK0V4Z3hrMnRHUkFWei9w?=
 =?utf-8?B?T0ViUmdyTVJVQlNnUXdieWFNSXRnb1ZKeEphNHdiT1Fia2s2UXBDVUh0c1A1?=
 =?utf-8?B?Kys1YXlad0toK0pRZDd2VWgvN3ZVVnRJRGtqUFFDK1h4dXQ3YThoYi9xdlNu?=
 =?utf-8?B?SlVreEpudHlmbXBjUnlJa052dko2QTQzb3Q1MVg4NlNpai9hb21BVmYzdGJs?=
 =?utf-8?B?c0s1ODNqVCtzNWJDclVCZEgxcHZqQ2FVNGUzalBMeFBkRHNvVFlDVWRCdmFj?=
 =?utf-8?B?NWl4bjdTQ3RwdWt4S1RBOTdpZ0xhU3dyVVJSWXpFTk8ya0FPMzVYb2dEWG0z?=
 =?utf-8?B?ckMwVk45eGlPN3RDWWFjMkNqbTdtV1pLMDVoL2F1OTlqcjVjY0UzOGlFU2t4?=
 =?utf-8?B?L1VpenFWZlBmMm1YNTVERVdBWmJ4Q1VOYVcyQWN0dnJZeDk5Mm1sS3JSN3NQ?=
 =?utf-8?B?SGI0T21MSnRRMm1zL3ZtVVJEcVF2SHh3blRmR2hPOWdBbVJTSGc5Ukx3czIx?=
 =?utf-8?B?RFNEam10anZSanFqa1A3UGlxTjBWZEoyY2hXZk1hOEhiT08xeHBxTVl2WjIv?=
 =?utf-8?B?SG1jRk95UUR5cXR5OWtYMFZlOFRKZk41MmJSa3lBc0dtNEdXWVNqckdQdDBX?=
 =?utf-8?B?TDNsdHh3dFFLWGpKY2FjZGlWVG9LcTk1WkV3aUgzMmNMUktzVktEU1RSb0FJ?=
 =?utf-8?Q?dpVtyj4M9mDj+ZRU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 38019db4-3842-4aef-09c7-08deab577fa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 10:09:02.4550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOUPMZbkX+LuNhPAbxfuOFAKgOZvUGJeQpTft82KKfzBxaJTUWB2f0HGLoSonGUBt2CNNXAuVP/2h/mNMExD7Gv8DXntlyzIW4ovvFUk9So8XupDao0SkstY45Z1bpQM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1331
X-Rspamd-Queue-Id: AD64E4D94A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36279-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:email,ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid]

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBIaSBDaGFuZ2h1YW5nLA0K
PiANCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gRnJpLCBBcHIgMjQsIDIwMjYg
YXQgMToxM+KAr1BNIENoYW5naHVhbmcgTGlhbmcNCj4gPGNoYW5naHVhbmcubGlhbmdAc3RhcmZp
dmV0ZWNoLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFkZCBwaW5jdHJsIGRyaXZlciBmb3IgU3RhckZp
dmUgSkhCMTAwIFNvQyBTeXN0ZW0tMChzeXMwKSBwaW5jdHJsDQo+ID4gY29udHJvbGxlci4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5mZW5nIE91eWFuZyA8bGlhbmZlbmcub3V5YW5nQHN0
YXJmaXZldGVjaC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hh
bmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiANCj4gKC4uLikNCj4gDQo+ID4gK2Nv
bmZpZyBQSU5DVFJMX1NUQVJGSVZFX0pIQjEwMA0KPiA+ICsgICAgICAgYm9vbA0KPiA+ICsgICAg
ICAgc2VsZWN0IEdFTkVSSUNfUElOQ09ORg0KPiA+ICsgICAgICAgc2VsZWN0IEdFTkVSSUNfUElO
Q1RSTF9HUk9VUFMNCj4gPiArICAgICAgIHNlbGVjdCBHRU5FUklDX1BJTk1VWF9GVU5DVElPTlMN
Cj4gDQo+IE5lYXQgdGhhdCB5b3UgdXNlIHRoZSBnZW5lcmljIHN0dWZmIQ0KPiANCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4NCj4gDQo+IERvIHlvdSByZWFsbHkgbmVl
ZCB0aGUgY29uc3VtZXIgaGVhZGVyPw0KDQpXaWxsIGRyb3AgaXQNCg0KPiA+ICsvKiBDdXN0b20g
cGluY29uZiBwYXJhbWV0ZXJzICovDQo+ID4gKyNkZWZpbmUgU1RBUkZJVkVfUElOX0NPTkZJR19H
TUFDX1ZTRUwNCj4gKFBJTl9DT05GSUdfRU5EICsgMSkNCj4gPiArI2RlZmluZSBTVEFSRklWRV9Q
SU5fQ09ORklHX0RFQk9VTkNFX1dJRFRIDQo+IChQSU5fQ09ORklHX0VORCArIDIpDQo+IA0KPiBI
bSBJIHdvbmRlciBhYm91dCB0aGlzLi4uDQo+IA0KPiA+ICsjZGVmaW5lIFNUQVJGSVZFX1BJTl9E
UklWRV9JMkNfRkFTVF9NT0RFDQo+IChQSU5fQ09ORklHX0VORCArIDMpDQo+ID4gKyNkZWZpbmUg
U1RBUkZJVkVfUElOX0RSSVZFX0kyQ19GQVNUX01PREVfUExVUw0KPiAoUElOX0NPTkZJR19FTkQg
KyA0KQ0KPiA+ICsjZGVmaW5lIFNUQVJGSVZFX1BJTl9PUEVOX0RSQUlOX1BVTExVUF9TRUxFQ1QN
Cj4gKFBJTl9DT05GSUdfRU5EICsgNSkNCj4gDQo+IEJ1dCB0aGUgZXhpc3RpbmcgcHVsbHVwIGFs
cmVhZHkgdGFrZXMgYW4gYXJndW1lbnQuIFRoaXMgbG9va3Mgd3JvbmcuDQo+IA0KPiA+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IHBpbmNvbmZfZ2VuZXJpY19wYXJhbXMgamhiMTAwX2N1c3RvbV9iaW5k
aW5nc1tdID0gew0KPiA+ICsgICAgICAgeyAic3RhcmZpdmUsZ21hYy12c2VsIiwgU1RBUkZJVkVf
UElOX0NPTkZJR19HTUFDX1ZTRUwsIDAgfSwNCj4gDQo+IENhbid0IHlvdSB1c2UgdGhlIGV4aXN0
aW5nICJwb3dlci1zb3VyY2UiIGluc3RlYWQ/IEl0J3MgZmluZSBpZiBpdCdzIG9ubHkNCj4gYXBw
bGljYWJsZSB0byBhIGZldyBwaW5zLiBUaGlzIGlzIG92ZXJseSBzcGVjaWZpYy4NCj4gDQo+ID4g
KyAgICAgICB7ICJzdGFyZml2ZSxkZWJvdW5jZS13aWR0aCIsDQo+ID4gKyBTVEFSRklWRV9QSU5f
Q09ORklHX0RFQk9VTkNFX1dJRFRILCAwIH0sDQo+IA0KPiBEb24ndCBrbm93IGFib3V0IHRoaXMu
Li4gc291bmRzIGxpa2UgdGhlIGFyZ3VtZW50IHRvIHRoZSBleGlzdGluZw0KPiBpbnB1dC1kZWJv
dW5jZSB3aGljaCBpcyBleHByZXNzZWQgaW4gbWljcm9zZWNvbmRzLiBKdXN0IHJlY2FsY3VsYXRl
IHRoYXQNCj4gdmFsdWUgdG8geW91ciAid2lkdGgiPw0KPiANCj4gPiArICAgICAgIHsgInN0YXJm
aXZlLGRyaXZlLWkyYy1mYXN0LW1vZGUiLA0KPiBTVEFSRklWRV9QSU5fRFJJVkVfSTJDX0ZBU1Rf
TU9ERSwgMCB9LA0KPiA+ICsgICAgICAgeyAic3RhcmZpdmUsZHJpdmUtaTJjLWZhc3QtbW9kZS1w
bHVzIiwNCj4gPiArIFNUQVJGSVZFX1BJTl9EUklWRV9JMkNfRkFTVF9NT0RFX1BMVVMsIDAgfSwN
Cj4gDQo+IEl0J3Mgbm90IHNwZWNpYWwgdGhhdCB0aGluZ3MgYXJlIGZvciBpMmMuIFVzZSB0aGUg
Z2VuZXJpYyBzbGV3LXJhdGUgZm9yIHRoZXNlIHR3bywNCj4gaXQgZGVzY3JpYmVzIGhvdyBmYXN0
IHNvbWV0aGluZyBpcy4NCj4gDQo+ID4gKyAgICAgICB7ICJzdGFyZml2ZSxpMmMtb3Blbi1kcmFp
bi1wdWxsLXVwLW9obSIsDQo+ID4gKyBTVEFSRklWRV9QSU5fT1BFTl9EUkFJTl9QVUxMVVBfU0VM
RUNULCAwIH0sDQo+IA0KPiBVc2UgdGhlIGV4aXN0aW5nIGRyaXZlLW9wZW4tZHJhaW47IHdpdGgg
dGhlIGV4aXRzaW5nIGJpYXMtcHVsbC11cCA9IDxvaG1zPjsNCj4gdHdvIHByb3BlcnRpZXMuIE5v
IG5lZWQgdG8gYmUgZmFuY3kgYW5kIGNyZWF0ZSBhIG5ldyBwcm9wZXJ0eSBmb3IgdGhpcy4NCj4g
DQo+ID4gKyAgICAgICB7ICJzdGFyZml2ZSx2Z2EtcnRlIiwgU1RBUkZJVkVfUElOX1ZHQV9SVEVf
U0VMRUNULCAwIH0sDQo+IA0KPiBObyBpZGVhIHdoYXQgdGhpcyBpcy4uLg0KDQpUaGlzIGlzIHRo
ZSByZXRlbnRpb24gc2lnbmFsIGJ1cyB1c2VkIGZvciBjb25maWd1cmluZyB0aGUgVkdBIGRvbWFp
bi4gSG93ZXZlciwgYWZ0ZXIgb3VyIHJldmlldywgd2UgZm91bmQgdGhhdCBWR0EgZG9lcyBub3Qg
dXNlIHRoaXMgcHJvcGVydHksIHNvIHdlIGhhdmUgZGVjaWRlZCB0byByZW1vdmUgdGhpcyBjb25m
aWd1cmF0aW9uIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gK3N0YXRpYyBpbnQgamhi
MTAwX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwaW5jdHJsX21hcCAqKm1h
cHMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpu
dW1fbWFwcykNCj4gDQo+IExvbmcgY29tcGxpY2F0ZWQgZnVuY3Rpb24uIFRyeSB0byB1c2UgdGhl
IGdlbmVyaWMgaGVscGVyIGluc3RlYWQgYW5kIGV4dGVuZCBpdA0KPiBpZiBuZWVkIGJlLg0KPiAN
Cj4gPiArc3RhdGljIHZvaWQgamhiMTAwX2R0X2ZyZWVfbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAq
cGN0bGRldiwgc3RydWN0DQo+IHBpbmN0cmxfbWFwICptYXAsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBudW1fbWFwcykNCj4gDQo+IFVzZSB0aGUgZ2Vu
ZXJpYyBoZWxwZXIgaW5zdGVhZC4NCj4gDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGluY3Ry
bF9vcHMgamhiMTAwX3BpbmN0cmxfb3BzID0gew0KPiA+ICsgICAgICAgLmdldF9ncm91cHNfY291
bnQgPSBwaW5jdHJsX2dlbmVyaWNfZ2V0X2dyb3VwX2NvdW50LA0KPiA+ICsgICAgICAgLmdldF9n
cm91cF9uYW1lICAgPSBwaW5jdHJsX2dlbmVyaWNfZ2V0X2dyb3VwX25hbWUsDQo+ID4gKyAgICAg
ICAuZ2V0X2dyb3VwX3BpbnMgICA9IHBpbmN0cmxfZ2VuZXJpY19nZXRfZ3JvdXBfcGlucywNCj4g
PiArICAgICAgIC5kdF9ub2RlX3RvX21hcCAgID0gamhiMTAwX2R0X25vZGVfdG9fbWFwLA0KPiA+
ICsgICAgICAgLmR0X2ZyZWVfbWFwICAgICAgPSBqaGIxMDBfZHRfZnJlZV9tYXAsDQo+IA0KPiBN
YXliZSB0aGUgbmVlZCBmb3IgdGhpcyBnb2VzIGF3YXkgaWYgeW91IGp1c3QgdXNlIHRoZSBnZW5l
cmljIHByb3BlcnRpZXMNCj4gaW5zdGVhZD8NCj4gDQo+ID4gK3N0YXRpYyB2b2lkIGpoYjEwMF9z
ZXRfZ3Bpb3ZhbChzdHJ1Y3QgamhiMTAwX3BpbmN0cmwgKnNmcCwgdW5zaWduZWQgaW50IHBpbiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHZhbCkgew0K
PiA+ICsgICAgICAgY29uc3Qgc3RydWN0IGpoYjEwMF9waW5jdHJsX2RvbWFpbl9pbmZvICppbmZv
ID0gc2ZwLT5pbmZvOw0KPiA+ICsgICAgICAgdW5zaWduZWQgaW50IG9mZnNldCA9IDQgKiAocGlu
IC8gMzIpOw0KPiA+ICsgICAgICAgdW5zaWduZWQgaW50IHNoaWZ0ID0gMSAqIChwaW4gJSAzMik7
DQo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgZnNfb2Zmc2V0ID0gNCAqIChwaW4gLyAxNik7DQo+
ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgZnNfc2hpZnQgPSAyICogKHBpbiAlIDE2KTsNCj4gDQo+
IEFsbCBvZiB0aGVzZSBhcmUgc2lnbnMgdGhhdCB0aGUgR1BJT3MgYXJlICJiYW5rZWQiIGludG8g
MzIgR1BJT3MgcGVyIGJhbmssIGFuZA0KPiBJIHRoaW5rIHRoZSBjaGlwcyBnZXQgc2ltcGxlciBh
bmQgZWFzaWVyIHRvIHVzZSBpZiB0aGV5IGdldCBzcGxpdCBpbnRvIHRocmVlY2VsbCBEVA0KPiBw
aGFuZGxlcy4NCj4gDQo+ID4gK3N0YXRpYyBpbnQgamhiMTAwX2dwaW9fZ2V0X2RpcmVjdGlvbihz
dHJ1Y3QgZ3Bpb19jaGlwICpnYywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGdwaW8pIHsNCj4gPiArICAgICAgIHN0cnVjdCBqaGIxMDBfcGlu
Y3RybCAqc2ZwID0gY29udGFpbmVyX29mKGdjLCBzdHJ1Y3QgamhiMTAwX3BpbmN0cmwsDQo+IGdj
KTsNCj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBqaGIxMDBfcGluY3RybF9kb21haW5faW5mbyAq
aW5mbyA9IHNmcC0+aW5mbzsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBvZmZzZXQgPSA0ICog
KGdwaW8gLyAzMik7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgc2hpZnQgPSAxICogKGdwaW8g
JSAzMik7DQo+IA0KPiBIZXJlIHRvby4NCj4gDQo+ID4gK3N0YXRpYyB2b2lkIGpoYjEwMF9ncGlv
X2lycV9oYW5kbGVyKHN0cnVjdCBpcnFfZGVzYyAqZGVzYykgew0KPiA+ICsgICAgICAgc3RydWN0
IGpoYjEwMF9waW5jdHJsICpzZnAgPSBqaGIxMDBfZnJvbV9pcnFfZGVzYyhkZXNjKTsNCj4gPiAr
ICAgICAgIHN0cnVjdCBpcnFfY2hpcCAqY2hpcCA9IGlycV9kZXNjX2dldF9jaGlwKGRlc2MpOw0K
PiA+ICsgICAgICAgc3RydWN0IGdwaW9faXJxX2NoaXAgKmdpcnEgPSAmc2ZwLT5nYy5pcnE7DQo+
ID4gKyAgICAgICBzdHJ1Y3Qgc3RhcmZpdmVfcGluY3RybF9yZWdzICpwaW5jdHJsX3JlZ3MgPSBz
ZnAtPmluZm8tPnJlZ3M7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIGlzOw0KPiA+ICsgICAg
ICAgdW5zaWduZWQgaW50IHBpbjsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCB0b3RhbCwgc2l6
ZSwgcmVtYWluID0gc2ZwLT5ucGluczsNCj4gPiArDQo+ID4gKyAgICAgICBjaGFpbmVkX2lycV9l
bnRlcihjaGlwLCBkZXNjKTsNCj4gPiArDQo+ID4gKyAgICAgICBmb3IgKHRvdGFsID0gMCwgc2l6
ZSA9IDA7IHRvdGFsIDwgc2ZwLT5ucGluczsgdG90YWwgKz0gMzIsIHJlbWFpbiAtPQ0KPiBzaXpl
KSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlzID0gcmVhZGxfcmVsYXhlZChzZnAtPmJhc2UgKw0K
PiBwaW5jdHJsX3JlZ3MtPmlycV9zdGF0dXMucmVnICsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh0b3RhbCA+PiAzKSk7DQo+ID4gKyAgICAgICAgICAgICAgIHNpemUg
PSB1bWluKHJlbWFpbiwgMzIpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgZm9yX2VhY2hf
c2V0X2JpdChwaW4sICZpcywgc2l6ZSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlm
IChzZnAtPmdwaW9fZnVuY19zZWxfYXJyW3Bpbl0gPj0gMCkNCj4gPiArDQo+IGdlbmVyaWNfaGFu
ZGxlX2RvbWFpbl9pcnEoZ2lycS0+ZG9tYWluLCBwaW4pOw0KPiA+ICsgICAgICAgICAgICAgICB9
DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgY2hhaW5lZF9pcnFfZXhpdChjaGlw
LCBkZXNjKTsNCj4gPiArfQ0KPiANCj4gQW5kIHNpbmNlIHRoZSBJUlFzIGFyZSBncm91cHMgcGVy
IDMyIHBpbnMgSSB0aGluayB0aGlzIHdpbGwgYmVjb21lIG11Y2ggZWFzaWVyDQo+IGlmIHlvdSBi
cmVhayB0aGUgR1BJT3MgaW50byBiYW5rcy4NCj4gDQo+ICguLi4pDQo+ID4gKysrIGIvZHJpdmVy
cy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamhiMTAwLmgNCj4gDQo+ID4gK3N0
cnVjdCBzdGFyZml2ZV9waW5jdHJsX3JlZ3Mgew0KPiA+ICsgICAgICAgc3RydWN0IHBpbnZyZWZf
cmVnIHZyZWY7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZ3Bpb19pcnFfcmVnIGNvbmZpZzsNCj4gPiAr
ICAgICAgIHN0cnVjdCBncGlvX2lycV9yZWcgb3V0cHV0Ow0KPiA+ICsgICAgICAgc3RydWN0IGdw
aW9faXJxX3JlZyBvdXRwdXRfZW47DQo+ID4gKyAgICAgICBzdHJ1Y3QgZ3Bpb19pcnFfcmVnIGZ1
bmNfc2VsOw0KPiA+ICsgICAgICAgc3RydWN0IGdwaW9faXJxX3JlZyBncGlvX3N0YXR1czsNCj4g
PiArICAgICAgIHN0cnVjdCBncGlvX2lycV9yZWcgaXJxX2VuOw0KPiA+ICsgICAgICAgc3RydWN0
IGdwaW9faXJxX3JlZyBpcnFfc3RhdHVzOw0KPiA+ICsgICAgICAgc3RydWN0IGdwaW9faXJxX3Jl
ZyBpcnFfY2xyOw0KPiA+ICsgICAgICAgc3RydWN0IGdwaW9faXJxX3JlZyBpcnFfdHJpZ2dlcjsN
Cj4gPiArICAgICAgIHN0cnVjdCBncGlvX2lycV9yZWcgaXJxX2xldmVsOw0KPiA+ICsgICAgICAg
c3RydWN0IGdwaW9faXJxX3JlZyBpcnFfYm90aF9lZGdlOw0KPiA+ICsgICAgICAgc3RydWN0IGdw
aW9faXJxX3JlZyBpcnFfZWRnZTsNCj4gPiArfTsNCj4gDQo+IElmIHlvdSB3YW50IHRvIGtlZXAg
YSBjYWNoZSBvZiBhbGwgcmVnaXN0ZXJzIGFyb3VuZCwgdXNlIHJlZ21hcC1tbWlvLg0KDQpJZiBJ
J20gbm90IG1pc3Rha2VuLCB0aGlzIGlzIG5vdCBhYm91dCBrZWVwaW5nIGEgY2FjaGUgb2YgYWxs
IHJlZ2lzdGVycyBhcm91bmQuIGl0J3MgDQpqdXN0IGEgcmVjb3JkIG9mIHJlZ2lzdGVyIG9mZnNl
dHMgZm9yIHRoZSBzYW1lIGZ1bmN0aW9ucyBhY3Jvc3MgZGlmZmVyZW50IHBpbmN0cmwgDQpkb21h
aW5zLg0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQo=


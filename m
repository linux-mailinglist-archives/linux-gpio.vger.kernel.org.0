Return-Path: <linux-gpio+bounces-36315-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDLeKsNx+2m7bAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36315-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:52:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0044DE57E
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F41C3009522
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 16:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F1044D031;
	Wed,  6 May 2026 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gc7dvAG0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D23F7865;
	Wed,  6 May 2026 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086192; cv=fail; b=LZ5DJDD+b3l7Gn6hQSwiRIn45b82J+/stOHkvkNY5saDiUzPCwdDzgJhwHMNx24LZHy9mU8h65rUC3nH51XKyWhsZdUv70i34nWX8Mm57xKiB+YGNF7N2UtsO17/tzci3wlLqYLhRorxHJh8J1hcmsCtEHGJ8OGtJn04nXpueIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086192; c=relaxed/simple;
	bh=x74RkLoB1XDAyY0C5VTWVsYzsv63sxv6c//ALc9QSRE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xr7np8Loe3vs0Kdd3TPjRSChF02HjirwDWWrmQ/Ye0t1Ghy2YjAuiBUNapyThDC8Svjy7/DTllfb4z8Go8bZXeSPTgO9fdGPQCdHTV3zlZBC6e0uohiOz7pLJ5Cpi2NjRs1rW71UDKdS8vD7ypF/uSrnwyGAWJHL6Aa54rsFy48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gc7dvAG0; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oY7Ej99ZQtOBJuJIG5OZSLKvGDd6Ee4fDTMW2u6DEyOOzIzINwehPlxMGreh1B6juaXkwopd5gSc1O6Q5qunN/WKXIWqS0ofMbCfNDPdrLltTnsO0+91r1lX8b2r+7ssmJ6RbORaJn0H3jQQ8Oa+af0FgSrVAQxePwrJp+7A429PdGgbLHzD6hL2fobcsjIC5oZlp+s1leFBuxamWBxhgJG4aseaqG0SrV6pBBVhHyex4zLcfzDIhyuexhLu2nrSST4R+jeAEnfQ6UfgeEEScBCvYtoAx6jwpIR9xz0y++vUX+heGYOmmAgaP7XRUev5H16UkJE2AgJVVZJtUN5x6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x74RkLoB1XDAyY0C5VTWVsYzsv63sxv6c//ALc9QSRE=;
 b=pXx+idruOoN1VSFft9cNQs5Ix40B1vJsb84omO7T/4JsZI85x86ba0N5hs8pjyDT0E82Q+w9lmEEmNKBGoxQbFMnyy/V6a5Vc2MGeR8ZEXXUKhHieGZj9LqRUf56reL5kgNa20AzikXdd0kFlSQ+oauRUsKh/Uzq6vrHDgrCZpMv7nOwszzwiR6Jzz8vu48A28aKteNjxG/K0nvcUn2lsnFVo0O9+70WXjEwAJcKxidtyf7+OwHtJWp3KRWlS9VVXLv+rQng/qJYnA8lfC0urh7R9zSqxrQE5/XlzbPO3LP4/hN2aDtu9lCmIzKIxBS+992OakKbVouykxt8GX6Wqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x74RkLoB1XDAyY0C5VTWVsYzsv63sxv6c//ALc9QSRE=;
 b=gc7dvAG0HiDS8gBInJeVMG7aJ9h4353tF9rc4a+LV5p0Xhh5XqXfWKlpRGXY+XKqEQa8r1rbIugncUQ5LVDp+Rur6tdDiaozRh6Dhau5dfX6Ln0h3mNf39LycrGqyJeAyPQG8SGfZ14+SPIgdEqs6wLu9DIORVHLlNgcg0WAFhQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10156.jpnprd01.prod.outlook.com (2603:1096:400:1db::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 16:49:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:49:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 7/7] pinctrl: renesas: rzg2l: Add support for clone
 channel control
Thread-Topic: [PATCH v4 7/7] pinctrl: renesas: rzg2l: Add support for clone
 channel control
Thread-Index: AQHc2ISSMWloOT5pHkG6VomoyHk3Y7YBLDkAgAATIwA=
Date: Wed, 6 May 2026 16:49:48 +0000
Message-ID:
 <TY3PR01MB11346123EBA36728034B2C988863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
 <20260430093422.74812-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdVwdKsmV3A8opxi7f1rnqSpVFsRg+Mfb7wQLC84NkL7PQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVwdKsmV3A8opxi7f1rnqSpVFsRg+Mfb7wQLC84NkL7PQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10156:EE_
x-ms-office365-filtering-correlation-id: f9eb11e4-70be-4bcb-47aa-08deab8f7be7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 rsicaFIS2XTezE6ASfT+ujcLFZqqyZ4OIFAbngmYZNNGnqGfKOp8V4W8wX1RxRHaXF0sMxcMbda101gYzJxRmvFzc21FltePllFznNJiXDi8qxOHLoKZImg2mwxP3m6PpR77qCttPhJNf3Q6ECpWpeGEZxiv0+Kb7wy1V32AlM2ckeuEy7Rd3LjvAoQvGVCSefn6Vf/mPKLWaxSJfU9bHGscCoCv+TIS5AsWK8nwanjDIR5GVdxOaG80Wp/Ttr+/iXUGMlauRGI5OnkBbk9TXZlRmUSwhbhX85Wv43zh1ZzIdwqomtUy8HWKkz0vsdHrS938FigJZqhYsWN/IWBzZx1o/YnV1hxdG8VHpCjRnp3WTRtN2u4lh2pfQM7DmuoLsJVo+bmDDISkBUyuFNkHjbL4PUbo21p091QlP2X7tTvukJ5lDBOx/CUucpzgrNiLlOqCpoW2jIdyMe2nh32T/1V5Rm9XCkslsowUFeqOd3rtK23atHnZlhQZDQi7oumpqmzgallGCwvBiNTPYtRshGtAehmbhhWwRrhen2bc7iy404NUSpr3ZhtNi5GPqGnKFV2QhHmeOQn8R/M3LARUELe/R6/JLQMjLIvSkTch7j+1TbhnkK+Z2y7CfXjT5TconWyQKnBB+nr2od9UniUoUYOak99sx7UV4wCQC8iPb/qHnzwy0GyjoM8C4iR47BA5FgplohRBOWeo8a+QmG7U+98cp7dfZWTi/QgEpJNXoC8cpOu21FZBqVQ7UkG3YsfG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eC9hdmJZODd6cTkvcXp1S1h3RXZ3aWo0Z2NSMUl4VUx4dUd3SFpmM0NuRWFK?=
 =?utf-8?B?djdVbWFuQ1pKZ1dDNGkvSlNkRFkzb1VqTmY5QkFZRzFkc1l3RndHb2hFdVJX?=
 =?utf-8?B?aG8yY3V0amIvL1AvMVpjQS9Jb0Ftd1BQdlpFVUJoZE91NlBZNUxMVzlucW5H?=
 =?utf-8?B?a2lUcll6ck1iOHBLYUlxWjNFVTlZaVAvZ3JPd0MxSWV5T2NNTmJmQlpEZFQ3?=
 =?utf-8?B?SnlXNWViTWgyT2Z3c1I1UjFVaDN6YzdTYXg4cVFPdHNicXdabkE5akhlNUhx?=
 =?utf-8?B?a3V5UnR6RXM3d1NFZWg4Sm4zY3FFWndVMVM1aWtNMUtzRnJuZ3BucWs3b3Bi?=
 =?utf-8?B?cmk3WldvbzJDNTFPWE5weUxKaG51OEhCVmY1WmVzbzZXYTZzNnl1SkRGNHI4?=
 =?utf-8?B?bndKSHRZMytUQWxHT0huUHJpVDlwWldibGtWYTNLbE91Ni9DcWJDNnBEeTBm?=
 =?utf-8?B?MGRIVmgvOHZoa09zUTFsbGVDSW92WjRSeG53d2cvVWYwTHdDcGtoak1wOCtZ?=
 =?utf-8?B?Qnd6bWhyQlhQSFJveWhuUGNsWUd0ei9pclhXTXJCcUEzTWk3VUFRY05rUi9S?=
 =?utf-8?B?Z2RjZ2syVHNWb2Jjc1Z3QjZ4SXFQaW9hTUIybHhSMm5IYWhjWEQ3cnZOUkt3?=
 =?utf-8?B?WmZURlhDZEN5WXJRTnEvYkhqOHhwS0tNUHUrN3RsUERpeGQ3YVFJWjZuRkVX?=
 =?utf-8?B?bjNMazBjR043c2FlZlE2STJrb2tyYllBSXM2Unh3aEh3MGdTTjBwWURiekcx?=
 =?utf-8?B?OGN0WG9hN3F4Y0JIYWk3dTlDQ2xHdURuTVJpaWN6WVl1VWdycEFycjBGTTRt?=
 =?utf-8?B?L3FDajEzQ21hM2RyMTArcUhKMWJtY01sQzhqdmdGWU1TUnhlTVN3bEFIbnlH?=
 =?utf-8?B?UkZlQ0cwcU9CMjNVK0s3VGVlWVM0WVhDWGUyWFdONERlQWV5RGViSVpzTmF2?=
 =?utf-8?B?QVUzN1lvdWtIV1NnUmRVakF2S0RvK1FzVUpWK2E1N01GMkdhL3piWDA4M3JE?=
 =?utf-8?B?REU3NFdXOVFEQU92REpHZGdXUCtnaVZRREVwREZWK0dGd0Y4cHl4TVI3SU5H?=
 =?utf-8?B?cnNXNkRJVmR5OTJpbDJCNU12d3BYcU1LMGM0eXh6YkJGVW8vMjVYV0x1QkNB?=
 =?utf-8?B?T1U0M3FrTzYzemJua3lDRkxKcWRiSFJFZCtDSzFvR0ppaUdVem1XWmJMT2Nv?=
 =?utf-8?B?N2dKY2RCY2FSTlphS0RkZllHSkI3bjdiWW1BUkVXaitsUlcwc2dySmJUaUVK?=
 =?utf-8?B?Z2NtbWozWGY3UG0xemZyTUx3VTlqc1ltd01JQkVEOWpSbnlDSU5iS3dPQWUx?=
 =?utf-8?B?YmRybFNneUxQOGt6U1A3Y0VUcC9velI2N3IzZUI0cTJMaldJV1FtTVdaNitC?=
 =?utf-8?B?MHlsYVBXSDNsQk1PSzNLejFoQmJ2SnVURWlKMHp5bmU3TjFUMUUrZXVyWXdo?=
 =?utf-8?B?Y1BFZS9EcjNzY2hJZG1MbnNsMUdSSWdYUkhjWXQvOHVlWmhYU1JWOTZVV0Va?=
 =?utf-8?B?dnNlNTB0NlVWM0xBeEluc2tCN1hTRTRLMnBpNFE5TWVqUnora3NJcUFEb1RE?=
 =?utf-8?B?RGppUVQ5S3hoSDdWSVl2SnRvbGdzbVNwWGdIVXNVcWRLRG00b080Wm9EeVQ1?=
 =?utf-8?B?NVc1bDlTN053OFI1dENsQWQ4MnZmNXIvWEhDekVlRGgzUUlxVG51RkFOSWUr?=
 =?utf-8?B?RjgwOGNGdmtsYUhkbnBSNkpOSVFmUWE1NWI0U3pic1l0UEgwMy9xOUxGcGNZ?=
 =?utf-8?B?Q3E0TXJ4S0RnQnFxeGo1R1VrTENPbERzRE9lYldPaTI1VHRvL1R5WkExVk1F?=
 =?utf-8?B?MjFldGRIU0g3TEhOTE9aazJJTHpxMC9CVnRtc01aWklTcHFBN1pQU3R2RXRp?=
 =?utf-8?B?M09CN0FFV1VqYXR2TzAvcDdnRXBSQzM1R05tQmVUT3Fmd3NNTG1WemlaUWNP?=
 =?utf-8?B?dFlIZVZMSUtIRCtGTHVEaWNnUy9IUVBrejc2b3UzMjVZazdBbGdqTy9OSDZI?=
 =?utf-8?B?SzRteUljNDl3Z0kvZTcwMCsvWG9lWVp1NVNKVnJUdmRmaGFNd0hoQkRlWlNB?=
 =?utf-8?B?SnZ5dEtEb2doaXROdllabmJYWVFBTS8yWGRrWm1JZ2Y2UzhaMVdGUGFFUnkx?=
 =?utf-8?B?QmV3U3drcUs5R0dlYndhRlBmV3BsUzZoYjRORmhiTmVGdStoTS84T1ZkeVJT?=
 =?utf-8?B?dFZteVV0SHhEclF2QjNrdHVXVVdVdGQ4MWNLMHZlZ0R2K2pHbXNJM0tSa0Fy?=
 =?utf-8?B?Z0syUGdLcVZ4ZEFLOTl5b1MzRk1peUhnY1ZGa3hOTXJRcDJ0M0U2V2pxWFlu?=
 =?utf-8?B?VThjTU8xWlc4WU5sa21hZktYNmg3QXVmWHNTTUkzUUpQNUpvOFVaQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eb11e4-70be-4bcb-47aa-08deab8f7be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 16:49:48.0126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1IGP/rnvtXIyxPxilumvET+LwvEc4b1dat+hC9b+z1DjSGo2TX9iVrZM9mZv5ogPP8cab5S4xXYnV7oDmmXL6I9NRfSipRSKQlt80C1aW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10156
X-Rspamd-Queue-Id: 0F0044DE57E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-36315-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,bp.renesas.com:dkim,linux-m68k.org:email]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IE1heSAyMDI2IDE2OjQwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djQgNy83XSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogQWRkIHN1cHBvcnQgZm9yIGNsb25lIGNo
YW5uZWwgY29udHJvbA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgMzAgQXByIDIwMjYg
YXQgMTE6MzQsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhlIFJaL0cz
TCBTb0MgaGFzIHNvbWUgSVAgc3VjaCBhcyBJMkMgY2h7MiwzfSxTQ0lGIGNoezMsNCw1fSwgUlNQ
SQ0KPiA+IGNoezEsMn0gYW5kIFJTQ0kgY2h7MSwyLDN9IG5lZWQgdG8gY29udHJvbCB0aGUgY2xv
bmUgY2hhbm5lbCBmb3INCj4gPiBwcm9wZXIgb3BlcmF0aW9uLiBBcyBwZXIgdGhlIFJaL0czTCBo
YXJkd2FyZSBtYW51YWwsIHRoZSBjbG9uZSBjaGFubmVsDQo+ID4gc2V0dGluZyBpcyB0byBiZSBk
b25lIGJlZm9yZSB0aGUgbXV4IHNldHRpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0K
PiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0
cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVu
ZXNhcy9waW5jdHJsLXJ6ZzJsLmMNCj4gDQo+ID4gQEAgLTYyMyw2ICs2NDQsNDUgQEAgc3RhdGlj
IGludCByemcybF92YWxpZGF0ZV9waW4oc3RydWN0IHJ6ZzJsX3BpbmN0cmwgKnBjdHJsLA0KPiA+
ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IHJ6ZzJsX3Bp
bmN0cmxfc2V0X2Nsb25lX21vZGUoc3RydWN0IHJ6ZzJsX3BpbmN0cmwgKnBjdHJsLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1OCBwb3J0LCB1OCBwaW4sIHU4
IGZ1bmMpIHsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+ICsNCj4gPiArICAgICAg
IGlmICghcGN0cmwtPmRhdGEtPmNsb25lX2NoYW5uZWxfZGF0YSkNCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsgICAgICAgc3dpdGNoIChmdW5jKSB7DQo+ID4gKyAg
ICAgICBjYXNlIDI6DQo+ID4gKyAgICAgICBjYXNlIDQgLi4uIDc6DQo+ID4gKyAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiA+ICsgICAgICAgZGVmYXVsdDoNCj4gPiArICAgICAgICAgICAgICAgcmV0
dXJuIDA7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8
IHBjdHJsLT5kYXRhLT5uX2Nsb25lX2NoYW5uZWxfZGF0YTsgaSsrKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBwaW5fZGF0YSA9DQo+ID4gKyBwY3RybC0+ZGF0YS0+Y2xvbmVf
Y2hhbm5lbF9kYXRhW2ldOw0KPiANCj4gdTMyLCB0byBtYXRjaCBjbG9uZV9jaGFubmVsX2RhdGFb
aV0uICBJIHdpbGwgZml4IHRoYXQgd2hpbGUgYXBwbHlpbmcsIHNvDQoNClRoYW5rIHlvdSBmb3Ig
dGFraW5nIGNhcmUgb2YgaXQuDQoNCkNoZWVycywNCkJpanUNCg0KPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gaS5lLiB3aWxsIHF1ZXVl
IGluIHJlbmVzYXMtcGluY3RybCBmb3IgdjcuMi4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2lu
ZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQo=


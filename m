Return-Path: <linux-gpio+bounces-751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076C27FE912
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 07:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 895A128230C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 06:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8151DA47;
	Thu, 30 Nov 2023 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aaeon365.onmicrosoft.com header.i=@aaeon365.onmicrosoft.com header.b="lidFE7y9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2099.outbound.protection.outlook.com [40.107.255.99])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30C310CE;
	Wed, 29 Nov 2023 22:19:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m16WiT2uvwioQVyz3/KmkTDiJy5C7Sdn2ZnV/iV76XGHq/f5MOw7gpGlxC9x4DqBS5Sp/HIVwZF6wbhPYdemcGzAbpw4W3bhJjUVSCUzt6VJ3pPkOD14pZGx+2gBxPAmFBgGJParrcBfzJt1Jk/a/tEqVPmtBASEC/O7Z3zD0SNirYdLB3TEgWen+UVcfH9Oxv3zMC0gqivWcLmXROs2XVPPrk5jKvDfFp9IvsSZsQ6mBIxFTlbuaoAxKixd5msVb3EbDecwljS3Pqs0EN4DqqVJcGzjYGq1Yq+gW48Ua8hz5e8mfgGQkY6xIs/92AAXXsy6oStAphD4iruKJZoeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s7AaV3xdxCdp4jazERxqcF2RQMfLWixhUf19P7B+Co=;
 b=G1WJ0AUG3kkrCkyuxNTUBYvXgpVOv9Se8Yyuv9CrJ5yGkitEizdi6ejs/fEwpHYx7vjfn/jdnNhIP69mVTLLQmEVsUsJl0iCyrqGC4IHB1bQWZ9knNf/bJrtoGuBRE60njOI+GN5gAH1sBjO+sltwT7tycev7oTiWlsVUZBiGqjPSOBB1M32FgQIxeAuHZqUwNZ3TOxTOTZe5n8Cj/v5MbDbJh5h7jfCFMYlkZ2eHQJjbK66aIx9euHYXTTVO2m1iRVcKJRYcnMr+XlFqBkblzzVQiFDyrXR2FWO1XEknIdf2Tjn/ygvtbnvs9ozRe0mdjR0g8NcB9l+6WTmEtAdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aaeon.com.tw; dmarc=pass action=none header.from=aaeon.com.tw;
 dkim=pass header.d=aaeon.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aaeon365.onmicrosoft.com; s=selector2-aaeon365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s7AaV3xdxCdp4jazERxqcF2RQMfLWixhUf19P7B+Co=;
 b=lidFE7y9trPBAohroHJUR4rHlMf5CCSW+oBLIZgiRLwn/bF/F0CDN51FLSmBHs4v9wTywBTIqZSaAK3yMEZJ2jmmjinc+POjrFZYvx+ANI8CmOqn4gkibAvCvV5JhOB8z1qnH1xmC4ZADKD4mQOaHuntQ924Mzx0p3BZbayKumo=
Received: from SI2PR02MB5682.apcprd02.prod.outlook.com (2603:1096:4:1ad::10)
 by TYZPR02MB6504.apcprd02.prod.outlook.com (2603:1096:400:363::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Thu, 30 Nov
 2023 06:19:04 +0000
Received: from SI2PR02MB5682.apcprd02.prod.outlook.com
 ([fe80::e6ed:864f:d0ae:dce6]) by SI2PR02MB5682.apcprd02.prod.outlook.com
 ([fe80::e6ed:864f:d0ae:dce6%4]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 06:19:04 +0000
From: =?big5?B?R2FyeVdhbmcgqEykp7Zo?= <GaryWang@aaeon.com.tw>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, larry.lai
	<larry.lai@yunjingtech.com>
CC: "lee@kernel.org" <lee@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"musa.lin@yunjingtech.com" <musa.lin@yunjingtech.com>,
	"jack.chang@yunjingtech.com" <jack.chang@yunjingtech.com>,
	"noah.hung@yunjingtech.com" <noah.hung@yunjingtech.com>
Subject: RE: [PATCH V7 2/3] pinctrl: Add support pin control for UP board
 CPLD/FPGA
Thread-Topic: [PATCH V7 2/3] pinctrl: Add support pin control for UP board
 CPLD/FPGA
Thread-Index: AQHaC5zQTtnnqyfTi0OETajcNkPqpLB588aAgBiXH9A=
Date: Thu, 30 Nov 2023 06:19:04 +0000
Message-ID:
 <SI2PR02MB568243153C4D4D7B636D2754EE82A@SI2PR02MB5682.apcprd02.prod.outlook.com>
References: <20231031015119.29756-1-larry.lai@yunjingtech.com>
 <20231031015119.29756-3-larry.lai@yunjingtech.com>
 <ZVOBz8-tahhrVmO-@smile.fi.intel.com>
In-Reply-To: <ZVOBz8-tahhrVmO-@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aaeon.com.tw;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR02MB5682:EE_|TYZPR02MB6504:EE_
x-ms-office365-filtering-correlation-id: 5afc8bb5-0f21-4152-57d0-08dbf16c4094
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 m4P+JW56qye1uQU0p2M/Y/FoxOs/u7V8pMzF8zghnQ+VsHyYkGFrkUxm/NlBdICRzDaYorxaWirfMhxEbcpYcomAexUEtIS6p/9XInb4rpHaOt14imL7eRqxrkUAdD3dmB6sxk6YSUklKvUeFlmU49IiMA3WX9JS8GUqq84ppaXKnfpYSCnAeUd5w8AfAgLFhysmXAV2vb/64OruCYhEwI+Z1RegL/aGUu3y2aZJZfdhXIe3vc68gHCQisfdgzMpJ4xSXa5SyBG3vYOqAyK+mV4NTF+yAZpQu7uJGLe9+JOnRRH2Gv2R59fIfWNAO5nt5/FE+T8sdmYDh1w/bSUb+5oJb5icyC9DpCZCIizqaI+chn98P+mvxRIvNxN6CYNkpVp6hhWGgI0RXkVVrCT8grSRBqwfGPuTG+pdZrfKRrJMwZJD7I/Cs+ej0U1pept/5HrDby2NE8xX7Z1ta6RJ+IQhV0rwFQvszfWyLuwIV/002z/E0iB8FU0uAh30/e3S026LMfi/tJVr1dy1tV92v6VgzXOHlC/8iKrSyqI4eOqD28njgcPiTBF2WKQEbrw3rmPW9gL5+R9nxj73Arl7/WyNF+QJA4XomPn7Lrw7UrpNU8WvCpQltMQQvKw580Q718atIc3dJJZPGcFvW6x8WA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR02MB5682.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39850400004)(376002)(136003)(64100799003)(186009)(451199024)(1800799012)(122000001)(6506007)(478600001)(7696005)(9686003)(26005)(53546011)(71200400001)(83380400001)(7416002)(66946007)(2906002)(110136005)(41300700001)(8676002)(5660300002)(66476007)(54906003)(52536014)(66556008)(4326008)(66446008)(64756008)(316002)(76116006)(8936002)(38070700009)(86362001)(85182001)(33656002)(38100700002)(55016003)(202311291699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?SjFCVzJmSFZ2cy9WdjVWY3kyQnRTaG1JMmZjK1MvTmFyU216NFN0L1ZkZEtwTVdo?=
 =?big5?B?dXJtNzBodFhCaGFwNEQwZmJucTlLUVg0WUFYM3JES3Z1aG4wVDNsVGwvM2tNWjhs?=
 =?big5?B?RmhOZEFJQzJKdHhoSGFtS2ViRzJsRVgrMmY1L1B3WlpVNzRsTXlNT3RHa1NBUVhv?=
 =?big5?B?VFlhVCtKa2hSS2xMY3lqeUVzSjJzL0tPS2l3S0k4Y0llUlNpT29ydzJRN0ovQ2lV?=
 =?big5?B?T211c3B2aE5Kdmkzd0lNdHRYWEN6SXg0Lys1c3lwOE1ndk1raWh1T2JoSHViYUlh?=
 =?big5?B?NVZ6L1U0TWM3c3FjQWUwRXBhZ2FFWWtEckNDL283bDJIK2MwYVVjN1ZNaUE5RkNC?=
 =?big5?B?Qmx2RVBoVjhvUEZQSG5uNUlOSkVnK2xNRkcvK2RPTHY1NDlIYithMlR3SEdUdU5t?=
 =?big5?B?SW5sTHFKNEJ2MDIxYzNJYU5KdWovZHZ3YkpNaGZIU1hLQ1ZSYllYa0EyU0VTUzJO?=
 =?big5?B?Wm5WMStYOFZ3eDhMbGVnV0ErQWkrT1U0WG5GejFnTUd0WXBZeitDVzdoVVRiVzJW?=
 =?big5?B?VHlXeWRhMStScTdETk91eTczbEwyd1NLdm9WZlp6eHEybkMvd05FK25FVEtnVys4?=
 =?big5?B?bUJOUnZYTlY3NDNVWTdHNGlFcFIxcjltU3BUeWFDMktQdmZTLzFSdmw2QWlFc2xO?=
 =?big5?B?NTlUOGpEbDVZZU41dFl0blV3MjlnVUlQaVVtakpvbitoV3RnbkJ5N1c2SnNoSTB2?=
 =?big5?B?UW5qVzFGejJzRkUzT2kyRURUbnR0RWdhTEI0YzBGc0U1RS9tYnBDZ3NaZWVmMWdt?=
 =?big5?B?Q3FSMDFFejh0WjlRbExxSUdFcnRMSEZjdHJMb1JlanZnNisvZ1YxZDQ5T1c5Q25a?=
 =?big5?B?Q2szZjUzemZmY1ZWeDZoM3Nrb1RlY0lCbDNLcmhyMjlpU2dtQi9PNk0xUU1IUkox?=
 =?big5?B?emtWN1R5dE0zbm11VFVLNTBYREphYk1QZDJPK1FMZFV2Q1ZPclYzMHFLMTBVRVhn?=
 =?big5?B?cVczay8xaTEzeTRTUnJsOVk1aFo4YTd2eFlEdk9KaUFCZ1cwdnhkL0VuaHE2a2JV?=
 =?big5?B?ejQxeFdjS0twZXh4THU2VlA3dU1hL3dTWnBOQ2ZaWFovWVJlT2o0SktqU0k1bTZi?=
 =?big5?B?NTIvOEVwaVBVK25jYzFzZUVGTTNXQzVlN2srbXpBanVldjU4MHAwTWx6RDVGL05i?=
 =?big5?B?RDJZcy93ekdDamRlUVNJMXJJSDlCZXVrbllpUEMxNHhrdklSTEcrWHZIWUJzb1ly?=
 =?big5?B?eGdYVVB1ZmxPL1BoRlFhWlhOQWgycXdCS01oMTZXWU1CcXRQZTVnTzV5NTNObnBp?=
 =?big5?B?bC8reUV2MVRrU0c5c1BSdmxiSlpIc2JxUkY4a2JlQmFOUmZzRUpTc0E0bkxpMVpn?=
 =?big5?B?RmxZYnBzdXdvRytvbjU0ZXpGZ3p2bnNyK0crNW8rMmNJaGY2eHRnZWpFOGI4RXcr?=
 =?big5?B?VU9jbStSV050NmZ2TzdjSGY0di9QYS80SDFLbEg4MWtSaFBiMDhRZ1dDUDdLOEZJ?=
 =?big5?B?czJzTHJRci9hK0pIT3ErOEFMeDBuaFMwVHIvUFlwMW5HKy9XNndZQzBLUzJNeUNP?=
 =?big5?B?dDhjQi9wNEt2STQ3Nks0ZEtVRzBRSFdKczJSYTZZcm5nSjJ1VkMybVRjQ0tTWVZx?=
 =?big5?B?VENBbHN6ZTlyQkFHSTNQRDhTLzVmZTRocmxCVkJzTjJoQVY3Ly9CaGE2ZjdMU2Qz?=
 =?big5?B?WG55OXNYZDRieWszTVpSdlo0SXhoL0RmQUVRL3k0dEtzV1J1eTdBdlBZSmRpUDM2?=
 =?big5?B?alU4WHJwaDJwV0pYZytUL21nSjdKZ3VtUk03QnB6VFR0aFhjYkFSelQvR3BZSDNx?=
 =?big5?B?M2pIeG8yWFBqZ28yUktxMGhYTlhnNExQbjdwQmpWUjlhbDVJWlRFeFJ5NkFlVDh5?=
 =?big5?B?VUpqUWc5L0JmNFpNM3FjRXZWOVBMbjJGZWpROFRwM2U5SUtoeENndjU2TURNSm5Z?=
 =?big5?B?Y3NITkRNNnlOU3BSOG9JcGJjU0ttK1grREVuZ2JxTFV6Q3IyT09pdVV2bXZzaEEx?=
 =?big5?B?bEdGaDhOQWd3UGlLcCt5em45UGMxWHZEMjlyYWhuYU51TU00NXhOS3N6eXpCaWFm?=
 =?big5?Q?LOSXGiozVPLeXO1v?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: AAEON.COM.TW
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5682.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afc8bb5-0f21-4152-57d0-08dbf16c4094
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 06:19:04.4621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 56a2d4be-9fe3-430e-b539-7e13a4744857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EnuEqmFLej9HQnDm9I+Rk4GKyiRTA1kL7zf+J8r7QQDvW2d2WO9Xfq+wSoyrvS62o9jvqozCjF2glZmDNBGLiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6504

QWxsLA0KICAgICAgICBSZXBseSBhZ2FpbiB0byBwbGFpbiB0ZXh0IGZvcm1hdCAmIGxpbmUtd2Fy
cCBhbmQgdHJpbSBhZ3JlZSBwYXJ0IGFzIEpvbmVzJ3Mgc3VnZ2VzdGlvbiwNCiAgICAgICAgcGxl
YXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGFyZSBzdGlsbCBoYXZpbmcgZm9ybWF0IGlzc3VlLg0K
ICAgICAgICBwbGVhc2Uga2luZGx5IHRvIGNoZWNrIG91ciBjb21tZW50cyB3aXRoICI+PiIgYmVn
aW5uaW5nLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbmR5IFNoZXZj
aGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NClNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDE0LCAyMDIzIDEwOjE5IFBNDQpUbzogbGFycnkubGFpIDxsYXJyeS5sYWlAeXVu
amluZ3RlY2guY29tPg0KQ2M6IGxlZUBrZXJuZWwub3JnOyBsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc7IHBhdmVsQHVjdy5jejsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtZ3Bp
b0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnOyBHYXJ5V2FuZyCo
TKSntmggPEdhcnlXYW5nQGFhZW9uLmNvbS50dz47IG11c2EubGluQHl1bmppbmd0ZWNoLmNvbTsg
amFjay5jaGFuZ0B5dW5qaW5ndGVjaC5jb207IG5vYWguaHVuZ0B5dW5qaW5ndGVjaC5jb20NClN1
YmplY3Q6IFJlOiBbUEFUQ0ggVjcgMi8zXSBwaW5jdHJsOiBBZGQgc3VwcG9ydCBwaW4gY29udHJv
bCBmb3IgVVAgYm9hcmQgQ1BMRC9GUEdBDQoNCk9uIFR1ZSwgT2N0IDMxLCAyMDIzIGF0IDA5OjUx
OjE4QU0gKzA4MDAsIGxhcnJ5LmxhaSB3cm90ZToNCj4gVGhlIFVQIFNxdWFyZWQgYm9hcmQNCj4g
PGh0dHA6Ly93d3cudXBib2FyZC5jb20vPiBpbXBsZW1lbnRzIGNlcnRhaW4gZmVhdHVyZXMgKHBp
biBjb250cm9sKSB0aHJvdWdoIGFuIG9uLWJvYXJkIEZQR0EuDQo+DQo+IFJlcG9ydGVkLWJ5OiBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogR2FyeSBX
YW5nIDxnYXJ5d2FuZ0BhYWVvbi5jb20udHc+DQo+IFNpZ25lZC1vZmYtYnk6IGxhcnJ5LmxhaSA8
bGFycnkubGFpQHl1bmppbmd0ZWNoLmNvbT4NCg0KDQoNCj4gKyNpbmNsdWRlICJpbnRlbC9waW5j
dHJsLWludGVsLmgiDQoNCkkgZG8gbm90IHRoaW5rIGl0J3MgY29ycmVjdCB1c2Ugb2YgdGhlIGhl
YWRlci4NCj4+IHNlZSBiZWxvdw0KLi4uDQoNCj4gKy8qIE9mZnNldCBmcm9tIHJlZ3MgKi8NCj4g
KyNkZWZpbmUgUkVWSUQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAweDAwMA0KPiArI2RlZmluZSBSRVZJRF9TSElGVCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAxNg0KPiArI2RlZmluZSBSRVZJRF9NQVNLICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBHRU5NQVNLKDMxLCAxNikNCj4gKyNkZWZpbmUgUEFEQkFSICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwYw0KPiArDQo+ICsvKiBP
ZmZzZXQgZnJvbSBwYWRfcmVncyAqLw0KPiArI2RlZmluZSBQQURDRkcwICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwDQo+ICsjZGVmaW5lIFBBRENGRzBf
UlhFVkNGR19TSElGVCAgICAgICAgICAgICAgICAyNQ0KPiArI2RlZmluZSBQQURDRkcwX1JYRVZD
RkdfTUFTSyAgICAgICAgIEdFTk1BU0soMjYsIDI1KQ0KPiArI2RlZmluZSBQQURDRkcwX1JYRVZD
RkdfTEVWRUwgICAgICAgICAgICAgICAgMA0KPiArI2RlZmluZSBQQURDRkcwX1JYRVZDRkdfRURH
RSAgICAgICAgIDENCj4gKyNkZWZpbmUgUEFEQ0ZHMF9SWEVWQ0ZHX0RJU0FCTEVEICAgICAyDQo+
ICsjZGVmaW5lIFBBRENGRzBfUlhFVkNGR19FREdFX0JPVEggICAgMw0KPiArI2RlZmluZSBQQURD
RkcwX1BSRUdGUlhTRUwgICAgICAgICAgICAgICAgICAgQklUKDI0KQ0KPiArI2RlZmluZSBQQURD
RkcwX1JYSU5WICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMjMpDQo+ICsjZGVm
aW5lIFBBRENGRzBfR1BJUk9VVElPWEFQSUMgICAgICAgICAgICAgICBCSVQoMjApDQo+ICsjZGVm
aW5lIFBBRENGRzBfR1BJUk9VVFNDSSAgICAgICAgICAgICAgICAgICBCSVQoMTkpDQo+ICsjZGVm
aW5lIFBBRENGRzBfR1BJUk9VVFNNSSAgICAgICAgICAgICAgICAgICBCSVQoMTgpDQo+ICsjZGVm
aW5lIFBBRENGRzBfR1BJUk9VVE5NSSAgICAgICAgICAgICAgICAgICBCSVQoMTcpDQo+ICsjZGVm
aW5lIFBBRENGRzBfUE1PREVfU0hJRlQgICAgICAgICAgICAgICAgICAxMA0KPiArI2RlZmluZSBQ
QURDRkcwX1BNT0RFX01BU0sgICAgICAgICAgICAgICAgICAgR0VOTUFTSygxMywgMTApDQo+ICsj
ZGVmaW5lIFBBRENGRzBfUE1PREVfR1BJTyAgICAgICAgICAgICAgICAgICAwDQo+ICsjZGVmaW5l
IFBBRENGRzBfR1BJT1JYRElTICAgICAgICAgICAgICAgICAgICBCSVQoOSkNCj4gKyNkZWZpbmUg
UEFEQ0ZHMF9HUElPVFhESVMgICAgICAgICAgICAgICAgICAgIEJJVCg4KQ0KPiArI2RlZmluZSBQ
QURDRkcwX0dQSU9SWFNUQVRFICAgICAgICAgICAgICAgICAgQklUKDEpDQo+ICsjZGVmaW5lIFBB
RENGRzBfR1BJT1RYU1RBVEUgICAgICAgICAgICAgICAgICBCSVQoMCkNCj4gKw0KPiArI2RlZmlu
ZSBQQURDRkcxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4
MDA0DQo+ICsjZGVmaW5lIFBBRENGRzFfVEVSTV9VUCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEJJVCgxMykNCj4gKyNkZWZpbmUgUEFEQ0ZHMV9URVJNX1NISUZUICAgICAgICAgICAgICAg
ICAgIDEwDQo+ICsjZGVmaW5lIFBBRENGRzFfVEVSTV9NQVNLICAgICAgICAgICAgICAgICAgICBH
RU5NQVNLKDEyLCAxMCkNCj4gKyNkZWZpbmUgUEFEQ0ZHMV9URVJNXzIwSyAgICAgICAgICAgICAg
ICAgICAgIEJJVCgyKQ0KPiArI2RlZmluZSBQQURDRkcxX1RFUk1fNUsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCSVQoMSkNCj4gKyNkZWZpbmUgUEFEQ0ZHMV9URVJNXzFLICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQklUKDApDQo+ICsjZGVmaW5lIFBBRENGRzFfVEVSTV84MzMg
ICAgICAgICAgICAgICAgICAgICAoQklUKDEpIHwgQklUKDApKQ0KPiArDQo+ICsjZGVmaW5lIFBB
RENGRzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDgN
Cj4gKyNkZWZpbmUgUEFEQ0ZHMl9ERUJFTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
QklUKDApDQo+ICsjZGVmaW5lIFBBRENGRzJfREVCT1VOQ0VfU0hJRlQgICAgICAgICAgICAgICAx
DQo+ICsjZGVmaW5lIFBBRENGRzJfREVCT1VOQ0VfTUFTSyAgICAgICAgICAgICAgICBHRU5NQVNL
KDQsIDEpDQo+ICsNCj4gKyNkZWZpbmUgREVCT1VOQ0VfUEVSSU9EX05TRUMgICAgICAgICAzMTI1
MA0KPiArDQo+ICsvKiBBZGRpdGlvbmFsIGZlYXR1cmVzIHN1cHBvcnRlZCBieSB0aGUgaGFyZHdh
cmUgKi8NCj4gKyNkZWZpbmUgUElOQ1RSTF9GRUFUVVJFX0RFQk9VTkNFICAgICBCSVQoMCkNCj4g
KyNkZWZpbmUgUElOQ1RSTF9GRUFUVVJFXzFLX1BEICAgICAgICAgICAgICAgIEJJVCgxKQ0KDQpI
dWg/ISBObyB3YXkgaXQgc2hvdWxkIGJlIGhlcmUgaW4gX2FueV8gZm9ybSENCj4+IGFjdHVhbGx5
IHdlIG5lZWQgc2V0IHBhZCBtb2RlIGF0IHJ1bnRpbWUgZm9yIEhBUCBwaW5zIEdQSU8sIGNvdWxk
IGNvbnNpZGVyaW5nIGxldCBwaW5jdHJsLXVwYm9hcmQgdXNpbmcgaXQ/Pw0KICBpdCdzIG5vdCBh
IGdvb2Qgd2F5IGJ1dCBnZXQgcmVnaXN0ZXIgb2Zmc2V0IGZyb20gaW50ZWxfcGluY3RybCBzdHJ1
Y3R1cmUgY2FuIHJlZHVjZSAyOH40OCBwaW4gb2Zmc2V0IGRhdGEgZm9yIGVhY2ggYm9hcmQuDQou
Li4NCg0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpBbmR5IFNoZXZjaGVua28NCg0KDQo=


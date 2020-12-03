Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAFE2CD1BA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 09:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388332AbgLCItS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 03:49:18 -0500
Received: from mail-eopbgr00085.outbound.protection.outlook.com ([40.107.0.85]:16835
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388321AbgLCItR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Dec 2020 03:49:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoRfTm3iIJdvd7J//gw8Lh5WR4wKXNrHn+7XWqW6gxudefeRc1nUN452h7UEdueu3oNgXUq6LO/oDdAf2pIH0qV723UuRjMssKvzpFpPiL0IBqbxayjeAWv9GNJM4RQMRBhVtZKmrIEjgBPXOWcNj9t0/1Uo2v3bdNSBH2MnOIEJ3YmolwbqO+UAv20vCPeNhca1AVHP0Z16+RIYNaKjTBzia+3KOlhIwZE+vvDmcY4tSwH6lECDge2FAsGfBpbTERa7da3cQ9iTvcqhd9JU+EDWgccOvqRplN0SAnCsEd3R+VDv1WN2BED79aGgGDtJ0XiNI59Fc/IJHDyxxuIPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBqUUN5N0cOarj6DZdLueTZHqxXLRdBEUDS5tAnAzUY=;
 b=ZwsbR9Fho6OsyvqbjEj2uv55W+gsnhjGT7rdxPsHgSqkL/bpMFGih/XciQc7kSV+lN6a31vuBUBIuTm8V9WM6M0lPpk2oDlbgP4Q6StgKIn9XBob8QMRxGAD0riMyOLx+Zy/hZAMdzMi6hKD7Wi802YzNx0/YgG87KvpBM7Fw9QQoOiVJUQ/e+r1d4TAC8hXuBt/eHDqz9/dTe6a6sJpiIyDBQqcYDwK4/FjuVs69BEKpDI6eHEOsVg7lbjFhJsIuKSRIiFWgWcW8dzBfDw5XgQGg4aJrImJda71riNjwlOG196N9h0LX+5Zg8yV6nL4U7VvmbvWys8VYf/Zt1ubqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBqUUN5N0cOarj6DZdLueTZHqxXLRdBEUDS5tAnAzUY=;
 b=eVwswWJgVjm5IcAK/m5C/HWMnC6kiHkAogNJ1QsLfA1tqjq4QwtliNd8Uy3hwHWo4uo6x4p/+7VwFObyUpoVInEj/g5Yxm3ZRExcLJ6qfmhJsDRmajglTtbb2cwGt/AC9UvEyOgxnJDrOFa3GxXSlt4l9Axp0ap+nMBInkcS01Q=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DBBPR04MB7915.eurprd04.prod.outlook.com (2603:10a6:10:1ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 08:48:28 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22%11]) with mapi id 15.20.3632.017; Thu, 3 Dec 2020
 08:48:28 +0000
From:   "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     Leo Li <leoyang.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] gpio: mpc8xxx: resolve coverity warnings
Thread-Topic: [PATCH] gpio: mpc8xxx: resolve coverity warnings
Thread-Index: AQHWyUtRJ4BA1tNfTEyqCOWxdR0/wqnlBAyAgAADNQCAAAfIIA==
Date:   Thu, 3 Dec 2020 08:48:27 +0000
Message-ID: <DB6PR0401MB2438E60B3BE8D6E917B80D0C8FF20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20201203073910.20113-1-biwen.li@oss.nxp.com>
 <CAMpxmJV97uexBKK3zHuOWfBQ77uorgxadUcrieBP2fLPs0dPeA@mail.gmail.com>
 <DB6PR0401MB243884BFCB97E719642385FA8FF20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <CAMpxmJWzHOZrm90TXy-00do0xSaxPfReiWRuCMj-GwAXN5NbPA@mail.gmail.com>
In-Reply-To: <CAMpxmJWzHOZrm90TXy-00do0xSaxPfReiWRuCMj-GwAXN5NbPA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: babbbbe0-940e-4118-ac39-08d89768343f
x-ms-traffictypediagnostic: DBBPR04MB7915:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB79153FE0254569298F2BAD72CEF20@DBBPR04MB7915.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YRFOPkAFlNAg9vafmfC0IFhnnZmPXTWumrlll6NR5qJ2HA65KhCdHCA/mi63K4w71u0CX82iE/ttd5aARXVv5GgDzAdBN1nDuNz9ncjvKM5+SeLZEw9rdq9Gq4iEvmPkmF0pjo3aiEEZgIVLExJYaOY19WvHQA5GLwUDebsVz3ktTqA2kvEPYR494+IiDfIz9k4T1TulUnxCC2+ZfUWsIMNRMZJ80d3krVLF6QRoSwypJGGIJg1/+nlTTR7D6vdu1fh49VB/Umw9+wRHo8CrjLxAroL6FxsDPpAT0IPWQe3JZ8IYPTApIBX3dRu2b3XBXS65nKwLclZAptJ3O7dtIallxo1jOpDGe9xUYGvmzHQLl17ji1zTCuJygW49nMA5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(54906003)(316002)(33656002)(8936002)(71200400001)(110136005)(8676002)(2906002)(66946007)(55016002)(83380400001)(76116006)(7696005)(9686003)(66446008)(66556008)(64756008)(66476007)(4326008)(86362001)(53546011)(6506007)(52536014)(478600001)(26005)(186003)(5660300002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z2I5ZGJnSjNxL05LN1lDUERPREovS1hVYjEzQ2pRdlVnN3VmdEJadU5mRk16?=
 =?utf-8?B?U3Rlck81OFVoZS9mbGowak9xcmROM2xJWURXbms5YnFjKzBITUlzeWc2MDY0?=
 =?utf-8?B?cHFxeWdPa2N4OUhJSGo3WGE3djZBYnNwQ0EvUTd3NGFmbVVXNFJqdFhrMEor?=
 =?utf-8?B?cEZsYWRodGpsbjREV2RrUVJGSFBYbS9XZmNwQUdFazI3NW1LcUIvNWVlWEUx?=
 =?utf-8?B?TVdIMnRSMFRoVEx0ai93NS9zK2E2aFZMRko0UTZxNlNCdVZBTnlFSitsQnVI?=
 =?utf-8?B?SStXcDVQNVZvM1Q3ZUFUZnJySHlqcEM2L25HNEhHTVgxeDg0ejMxY1hkY0tW?=
 =?utf-8?B?elQzN21uMWIxMDZTSERzUDNFK0JGbVdBSzUydzBVbG4xTXREYzV1WnM2NklN?=
 =?utf-8?B?RGlZeFkzTzI1K3RObktSWisreDVIV0g0UkxhZmRlNXN6SzE4QTVZR2pIZXBl?=
 =?utf-8?B?MkNQVXlUR0U3Rk9RdXFOZVJDYzdRRnIvUXlvaEFCNjlzNEJjMUhZNWRZc3JC?=
 =?utf-8?B?L211Nmw1WjMyNVBCUUthYkE0TWtYNmRVWG1iWG5rYnZlL2JqUm9hQ0YvYlhR?=
 =?utf-8?B?bmhDTTUrUjN6Si9nWjljdnFkR1RsNjFwV1VWWHhCRjZQaXR2T3ROWDJvQkN3?=
 =?utf-8?B?QWQ1bHZ4S1RLRTZTeG8vRHFrMkdycHkzRE0rTDVUT21uem8zTkRnMkRZRS83?=
 =?utf-8?B?M29LNDcxS3BJaXNCWG9aWGpJS0ErS3pjK1h2bjFmeFZHaHZXbnhxcTFLTjJC?=
 =?utf-8?B?eDVkWU84cTJpelJERURSTlFZTkJTdHFxMzl0L0UzT2J4dkhBcjZob3Zablpl?=
 =?utf-8?B?bDF4eUJsSnZtRldpTnd1OUtHSzFFV25NTlVERnp3NXpYTGFtYW04NFE1ZXkz?=
 =?utf-8?B?b0FnYU4zTkVrUDhMU1loUUJlZWZJOEE3VC8zWnpNN0lxZWovcUtuV1R4dGQ3?=
 =?utf-8?B?dFlQZXVlYk9adld4a3d1cnFmZHhPbHI4cEI1MUJkVTY0cTA5RXZaMDVwWUdW?=
 =?utf-8?B?N1ZqQjBJZm1ueklkZWQ4ajZmSFJxUlRYd0JPMjFYV3BJSVZldXVWa3IvVkRw?=
 =?utf-8?B?S0JSUEhwVkVrY3VHWVVNWU1ITmU4NHhub3FlQ20zNFROT0Y0bitPTUFxeE1k?=
 =?utf-8?B?R1ZSWi9wdDZrYS9Ud1lPVThEMnlQaFo1L01yeXMxcTVaVzQ1bTRDQ1BCUUdH?=
 =?utf-8?B?ZTRYZnRFaGZ4aGdTUkZ2VU5DRWEzZkhXM0hvUjFWMmZHUUlGeFhqRm1TUkVh?=
 =?utf-8?B?ejhSRDduUVpQYitKUTJocFNZbkczOS8yR3dNRHVHMjBuWHBIb2UzVVV0MmtX?=
 =?utf-8?Q?pr8AhSDea1lLQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babbbbe0-940e-4118-ac39-08d89768343f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 08:48:28.0106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Qi7ANarx1D3WDWoIHv+NFO2LmkN6wGlhPd+ZwL+XPyybOkcHIlNVoRYuO4ONg4CHHhxG984s4A/sJlS/oubPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7915
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiANCj4gT24gVGh1LCBEZWMgMywgMjAyMCBhdCA5OjA3IEFNIEJpd2VuIExpIChPU1MpIDxiaXdl
bi5saUBvc3MubnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiA+IE9uIFRodSwgRGVjIDMsIDIwMjAg
YXQgODozMSBBTSBCaXdlbiBMaSA8Yml3ZW4ubGlAb3NzLm54cC5jb20+IHdyb3RlOg0KPiA+ID4g
Pg0KPiA+ID4gPiBGcm9tOiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCj4gPiA+ID4NCj4g
PiA+ID4gUmVzb2x2ZSBjb3Zlcml0eSB3YXJuaW5ncyBhcyBmb2xsb3dzLA0KPiA+ID4gPiAgICAg
Y29uZF9hdF9tb3N0OiBDaGVja2luZyBncGlvID49IDI4VSBpbXBsaWVzIHRoYXQgZ3BpbyBtYXkg
YmUgdXANCj4gPiA+ID4gICAgIHRvIDI3IG9uIHRoZSBmYWxzZSBicmFuY2guDQo+ID4gPiA+ICAg
ICBvdmVycnVuLWNhbGw6IE92ZXJydW5uaW5nIGNhbGxlZXMgYXJyYXkgb2Ygc2l6ZSAzIGJ5IHBh
c3NpbmcNCj4gPiA+ID4gICAgIGFyZ3VtZW50IGdwaW8gKHdoaWNoIGV2YWx1YXRlcyB0byAyNykN
Cj4gPiA+ID4gICAgIGluIGNhbGwgdG8gKm1wYzh4eHhfZ2MtPmRpcmVjdGlvbl9vdXRwdXQNCj4g
PiA+ID4NCj4gPiA+ID4gICAgIGNvbmRfYXRfbGVhc3Q6IENoZWNraW5nIGdwaW8gPD0gM1UgaW1w
bGllcyB0aGF0IGdwaW8gaXMgYXQgbGVhc3QgNCBvbg0KPiA+ID4gPiAgICAgdGhlIGZhbHNlIGJy
YW5jaC4NCj4gPiA+ID4gICAgIG92ZXJydW4tY2FsbDogT3ZlcnJ1bm5pbmcgY2FsbGVlJ3MgYXJy
YXkgb2Ygc2l6ZSAzIGJ5IHBhc3NpbmcgYXJndW1lbnQNCj4gPiA+ID4gICAgIGdwaW8gKHdoaWNo
IGV2YWx1YXRlcyB0byA0KSBpbiBjYWxsIHRvDQo+ID4gPiA+ICptcGM4eHh4X2djLT5kaXJlY3Rp
b25fb3V0cHV0DQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpd2VuIExpIDxiaXdl
bi5saUBueHAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3Bpby9ncGlvLW1w
Yzh4eHguYyB8IDUgKysrLS0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwaW8vZ3Bpby1tcGM4eHh4LmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4
LmMgaW5kZXggYTZjMmJiZGNhYTEwLi4xMmM5YTkxZDg3YjcNCj4gPiA+ID4gMTAwNjQ0DQo+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLW1wYzh4eHguYw0KPiA+ID4gPiArKysgYi9kcml2
ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4LmMNCj4gPiA+ID4gQEAgLTMsNiArMyw3IEBADQo+ID4gPiA+
ICAgKg0KPiA+ID4gPiAgICogQ29weXJpZ2h0IChDKSAyMDA4IFBldGVyIEtvcnNnYWFyZCA8amFj
bWV0QHN1bnNpdGUuZGs+DQo+ID4gPiA+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMTYgRnJlZXNjYWxl
IFNlbWljb25kdWN0b3IgSW5jLg0KPiA+ID4gPiArICogQ29weXJpZ2h0IDIwMjAgTlhQDQo+ID4g
Pg0KPiA+ID4gQSBjb3B5cmlnaHQgbm90aWNlIG9uIGEgdHdvLWxpbmUgY2hhbmdlIGlzIGEgYml0
IHRvbyBtdWNoLCBkb24ndCB5b3UgdGhpbms/DQo+ID4gT2theSwgZ290IGl0LiBXaWxsIHJlbW92
ZSBpdCBpbiB2Mi4NCj4gPiA+DQo+ID4gPiA+ICAgKg0KPiA+ID4gPiAgICogVGhpcyBmaWxlIGlz
IGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UNCj4gPiA+ID4gICAqIHZlcnNpb24gMi4gIFRoaXMgcHJvZ3JhbSBpcyBsaWNlbnNlZCAiYXMg
aXMiIHdpdGhvdXQgYW55DQo+ID4gPiA+IHdhcnJhbnR5IG9mIGFueSBAQCAtODAsNyArODEsNyBA
QCBzdGF0aWMgaW50DQo+ID4gPiA+IG1wYzUxMjFfZ3Bpb19kaXJfb3V0KHN0cnVjdCBncGlvX2No
aXAgKmdjLCAgew0KPiA+ID4gPiAgICAgICAgIHN0cnVjdCBtcGM4eHh4X2dwaW9fY2hpcCAqbXBj
OHh4eF9nYyA9DQo+IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gPiA+ID4gICAgICAgICAvKiBH
UElPIDI4Li4zMSBhcmUgaW5wdXQgb25seSBvbiBNUEM1MTIxICovDQo+ID4gPiA+IC0gICAgICAg
aWYgKGdwaW8gPj0gMjgpDQo+ID4gPiA+ICsgICAgICAgaWYgKGdwaW8gPj0gMjhVKQ0KPiA+ID4g
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPg0KPiA+ID4gSSBkb24ndCBy
ZWFsbHkgdW5kZXJzdGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UgYnV0IGxvb2tpbmcgYXQgdGhlIGNv
ZGUNCj4gPiA+IGlzIGV2ZW4gbW9yZSBjb25mdXNpbmcuIFdoYXQgYXJlIHlvdSBmaXhpbmcgaGVy
ZSBhY3R1YWxseT8NCj4gPiBUcnkgdG8gZml4IGNvZGUgd2FybmluZyB0aGF0IGdlbmVyYXRlZCBi
eSBjb3Zlcml0eSBzY2FuIHRvb2woc3RhdGljDQo+ID4gY29kZSBhbmFseXNpcyB0b29sKQ0KPiAN
Cj4gUGxlYXNlIGV4cGxhaW4gd2hhdCBiZW5lZml0IHRoZXJlIGlzIHRvIHVzaW5nIDI4VSBvdmVy
IDI4LiBObyB0b29sIGlzIHBlcmZlY3QsDQo+IHRoYXQncyB3aHkgeW91IHNob3VsZCB0cnkgdG8g
dW5kZXJzdGFuZCB3aGF0IGl0IGlzIGl0J3MgdHJ5aW5nIHRvIGZpeC4gSSBkb24ndCBzZWUgYW55
DQo+IHJlYXNvbiB0aGlzIGNvZGUgY291bGQgZmFpbC4NClRoaXMgY29kZSBjb3VsZG4ndCBmYWls
Lg0KVGhlIHZhcmlhYmxlIGdwaW8gaXMgdW5zaWduZWQgaW50IHR5cGUsIHByZWZlciB0byBhcHBl
bmQgIlUiIGZvciB1bnNpZ25lZCB0eXBlZCB2YWx1ZXMsIHRoaXMgbWFrZXMgaXMgY2xlYXJlciBh
bHNvIHdoZW4gY29tcGFyaW5nIHZhbHVlcyBhbmQgdmFyaWFibGVzLg0KPiANCj4gQmFydG9zeg0K
PiANCj4gPiA+DQo+ID4gPiBCYXJ0b3N6DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiAgICAgICAg
IHJldHVybiBtcGM4eHh4X2djLT5kaXJlY3Rpb25fb3V0cHV0KGdjLCBncGlvLCB2YWwpOyBAQA0K
PiA+ID4gPiAtOTEsNw0KPiA+ID4gPiArOTIsNyBAQCBzdGF0aWMgaW50IG1wYzUxMjVfZ3Bpb19k
aXJfb3V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCAgew0KPiA+ID4gPiAgICAgICAgIHN0cnVjdCBt
cGM4eHh4X2dwaW9fY2hpcCAqbXBjOHh4eF9nYyA9DQo+IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsN
Cj4gPiA+ID4gICAgICAgICAvKiBHUElPIDAuLjMgYXJlIGlucHV0IG9ubHkgb24gTVBDNTEyNSAq
Lw0KPiA+ID4gPiAtICAgICAgIGlmIChncGlvIDw9IDMpDQo+ID4gPiA+ICsgICAgICAgaWYgKGdw
aW8gPD0gM1UpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+
ID4NCj4gPiA+ID4gICAgICAgICByZXR1cm4gbXBjOHh4eF9nYy0+ZGlyZWN0aW9uX291dHB1dChn
YywgZ3BpbywgdmFsKTsNCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4xNy4xDQo+ID4gPiA+DQo=

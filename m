Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BA4344AD4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 17:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhCVQOc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 12:14:32 -0400
Received: from mail-mw2nam10on2102.outbound.protection.outlook.com ([40.107.94.102]:16736
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230134AbhCVQOG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 12:14:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5dDnXUq6cdthuvESqhbEXQL1IJRV4wxhioiSIsjTnLsktkwGh3i4Y0fBbBjlk3vKDy4boga0fHgf2gHybfXUOkK0kPa0XImhA/hTDOiDIHL1C15qF0ggHeMDg8xqH/RgaHywZcWmFaePi8qzASb1kw+6s+9FRiFQaJ0wOIXU0TeIYbbtbyd7NnXJ1ds5S0PeAY0XrrAHJD3HnrEUThIw0GV9yJkkNZOThgCvhmKIAdV+gGpq+g4p0DFFYzoxSQ+N7sNAtatGmcCUSAT4vDLBjMZWujSWhnJyEr0O7BLDd/6fnOr/nKt8Kv7/ppuDzc6RKJargF5FOUY+kvYbZM9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyzKlAnxyglvMl8hniZq40idKGsW++8K7T3X9KX78/w=;
 b=c2GqGWOD6tRs2hnbiWm2fzN1yezRXnNMEgOPs34m6N/6hjOZy9BQ3e14ukvalLyfVfI5rPUYVNlBo02nj9GawCQfu1zeg2aIt44QfDDOob5CjJkti8lmkVsuLofuagr2lkjGKMNdKPa65Z/5mfzegdoZmZ6DRH2W055J0b4kTGvelMibErAHVBf7IhMn4AxYJk6MF5IRvw5BDVWer5eeXOuhXg/EwprkbhgW94K2PRYeTZwzWMWULB2U0STQwtjouc7G6cXu3O+dQbkCShlBBP0lxoHQSg3UeYdFLHN65W70wFWaq2yUW4n6QCmBFioQx/5GRf61uUdx6HIoZgQp9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=visionengravers.com; dmarc=pass action=none
 header.from=visionengravers.com; dkim=pass header.d=visionengravers.com;
 arc=none
Received: from BYAPR01MB5621.prod.exchangelabs.com (2603:10b6:a03:118::32) by
 BYAPR01MB5701.prod.exchangelabs.com (2603:10b6:a03:127::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Mon, 22 Mar 2021 16:14:02 +0000
Received: from BYAPR01MB5621.prod.exchangelabs.com
 ([fe80::6c8c:7d48:231c:e27a]) by BYAPR01MB5621.prod.exchangelabs.com
 ([fe80::6c8c:7d48:231c:e27a%7]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 16:14:01 +0000
From:   Hartley Sweeten <HartleyS@visionengravers.com>
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: RE: RFC Need advice on reworking gpio-ep93xx.c to DT support
Thread-Topic: RFC Need advice on reworking gpio-ep93xx.c to DT support
Thread-Index: AQHXHxWhtt+cb7e+nk+MxCDZ5vAYj6qQHiHAgAAMaYCAAABLQA==
Date:   Mon, 22 Mar 2021 16:14:01 +0000
Message-ID: <BYAPR01MB5621066B411F68EF840B8417D0659@BYAPR01MB5621.prod.exchangelabs.com>
References: <1042421616413081@mail.yandex.ru>
         <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
 <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
In-Reply-To: <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=visionengravers.com;
x-originating-ip: [63.230.248.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac735af5-6382-459b-01e0-08d8ed4d81cc
x-ms-traffictypediagnostic: BYAPR01MB5701:
x-microsoft-antispam-prvs: <BYAPR01MB57012041C4AACDF96AAA2820D0659@BYAPR01MB5701.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +h1u6slCQkId231Arm535/Bq0gOXRCtYYm87vrSCe/ffh4CdKq6QJecMZP8kc84lePfOdNP4H/pzpOsk7qAu3rqJVqe12cXmMPcbJ+zxt0wMHkHqyeaOMn6hzlJlSG1TV1lF+DhNl/LYCQAKUdaCixtkh7SuYOc71heU67xzR/iifLRcnfCHsx8XsWedkOj10oo4Ra/iUwblxiWfDz6m6aPpUPGKWPqDZoK263u8rNYZ7XEF/eKddmkjcml4lpK8Og1kbOI5x7UIty8O9+gZw55n2jamAKpdHnPKJd71eUNhIbja8DHzgq6wp3uIMkvc3g9y96/VbOm6F4xxwIFmnF2Zn9plmU+hQb4r8g41WlKuz5C3gXJeUlHnjO45V8stcMCAMFOO2/uSJ3ykc7O9p1nKHVHkE03BdwxddaTpC57MQEOZzwqXbIJUC5LGzKNx2xvT/Dd+T7UtbG6MTjnsRoh+GO7yt9sX7DW/uOy79lMYhw3v54GoSSrFvAOUbWOY3NNGUA7Abo4pUKIszBoID/g1XwDIwi+aAcQ1X1lAJVXL3WWutmw6eu5A4UsoaMZQymqdpTHrOyNMjGV9Fl88BILMnMfPviv8s7KHb5U4W8c1lSk+N1QwSyt/JRcP0V10bnTRYElwrbuDe6/+vW68xHLPtr/oawZH08+eA7eXoELaenMPYoTAwMs1yj32llUJaxEs69x1Co4wOMXi3b7cXNBWy22XJtx3r0bOaTw5QZLs3izn72u6ZjGFdr+WrCkA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR01MB5621.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(39830400003)(376002)(2906002)(186003)(33656002)(64756008)(66446008)(52536014)(26005)(53546011)(5660300002)(76116006)(66556008)(6506007)(86362001)(9686003)(110136005)(316002)(966005)(55016002)(8936002)(7696005)(38100700001)(478600001)(66946007)(8676002)(71200400001)(66476007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UmQzakwvSTJFQzdlRms3NWtqWllFbHcwQkovaGh3dzEveTVranlOb3ZqRTFw?=
 =?utf-8?B?dFVYbWxtTkJFQyt1NzRQY2dLcUE2eXRGQlcvUXlHU2lWSjhXRUtkaERSOGFE?=
 =?utf-8?B?OUdoVXp4dHMwMW8vNjFaUmNJT3ErRDF4RG5YZHUwZ1lhS0EvTTllcVR6TFRr?=
 =?utf-8?B?RmxlcUVLRXpuL1RaQlFqVnFOZ0tZSmVFVWoyMktiRmQ1Y1A2ME41bVRMcFg5?=
 =?utf-8?B?elg0b1FqQUhTb0pmZS9lMDkvczVqUm92TTBUWTh1N1pDTVhEa2hVNTMvbnVu?=
 =?utf-8?B?b2RHQzUrbldNRXJMSzdKV3pUQ2dCeVMwWDBSU1hhekJnQ1p3MzV2M0RLaFlM?=
 =?utf-8?B?WE1ocUdiQ0RSRHRqOXNIbXN5WGVUM0krZXRkQ0Yxa2JZVUUwUi9TNzdFeXlr?=
 =?utf-8?B?UERsM0IxQUJCVnlzbDN4bmRKM0g5RS9mVzdPanMyeTZtQXJFVG05MHNHYjMx?=
 =?utf-8?B?dC9BODllRThmTE5Yb2FSN01vUmdTQVA5ZTJVZThvdzV2bXVBeDlFVHBsVk9V?=
 =?utf-8?B?SVkvMjVnOE5BUHBpdnFwa0tUOFBxSjZOclVxamdRRldhWDM5K3lId1ppT0d4?=
 =?utf-8?B?MnVIN1ExazQ3MmtpQnV4TjdWMEQ5dEREM2RFUWppUHJia2lhaEY4RWU0NG5o?=
 =?utf-8?B?QmNRdGRuZi8wYmF6RnowaXFSRHgrNDZFR3F2MU8xZW5mbWFENzMrVHFzQUY3?=
 =?utf-8?B?Nkd4NXVXdjhWZW51WXFLTFdpMmRjWHk4dHVSZXhiNDZUTXZhNnRhYzBvMCtY?=
 =?utf-8?B?TWRhUzk2KzBRR0lyK00xMG5ucThUMVNvckZ3QTZsQ2pRUmVjVWM3MUFldkZk?=
 =?utf-8?B?ck5UZUdwZGluTTJGQm9zcTdkbmU2dmUwV1VWNFJ6UlNSbU5KRU9DaFVHRXZH?=
 =?utf-8?B?bnE1eDJKUDVFZUI5bS96eUNuWHJJRmNXanFHVEtCeWt1cVVUOTdjNi9DRUJM?=
 =?utf-8?B?VGkyVllJdGRSdnV6clY1eHVyWnoxYnNHUmcwS2FQZWhvRHhzZmswbGtJbzh2?=
 =?utf-8?B?RFUwUHhqVDVyYTJMNUdvdi96UDFqaTE4emIzODlzRUdPNjExZjNYdk53bGZT?=
 =?utf-8?B?T1UvQ1o4dEZQQW9Zc1RiUUltUmlBYUtrclQrWE56b3ZLS1lHV21GZlVBSmdC?=
 =?utf-8?B?bWZrRWpYMTVqZ3YzNzkwRGhkRVZ0ZVlnR212L1pLS0VpQStwWUdsOC9aUGF3?=
 =?utf-8?B?WTBtY0NhVUloZGsrWUxBMTRPZkZkYlgrQStmcnFCb1VCWlg3SUxSUFZLKzBU?=
 =?utf-8?B?ZnRXckdlZmhDbjNxRzJNTVJZWHhLdUhLSWY5T3ZHbm9ZZlFuZVRCRFA5c3Q3?=
 =?utf-8?B?NmhCa2UxMlNlYmxWQUpuZU9CamZoUHFxcmNJbmhnL3UzaDNhY0FhNm1zU2gy?=
 =?utf-8?B?YWZOczBwMFphZ1dublM5KzhNY05tNjU5R0N2TSt3TXJyT2c5K2doTDlKam1O?=
 =?utf-8?B?TWhNVnVXYXpUOERQZUQ1NHVyWkJMbkxvdFdMcmFzRFZzUEJFVlN0ZnR5a3pX?=
 =?utf-8?B?MEdyaU56RWF1L3hJeXkybFQ5QmNxcU1WWjFTdVVpU0NVNWkyUHZqZ29tZVdX?=
 =?utf-8?B?cjh2a3hCUDJodkxwbmc3d1hLUlQvcEtCOTBZTG9ZOFNNZ1JYbUFZeTU2ek1U?=
 =?utf-8?B?eDJMR1V0aWFJUExNMlFMUEJWaVExeGZvRUxRTk5xYU05cGkwdklUQ2dOZW1B?=
 =?utf-8?B?c1JqTmdBaXN5dmlXcGVoM2tCaUNpS3AyeTdhT3RrelorZWlmY1Rya05XOSsw?=
 =?utf-8?Q?OQgWn/YLco4Bj626v+Bo2kmN8Qy1n3l2PDA7pdM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: visionengravers.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB5621.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac735af5-6382-459b-01e0-08d8ed4d81cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 16:14:01.7741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d698601f-af92-4269-8099-fd6f11636477
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lv8/O7xgwr3UP1LaF+MIfkckMlY8oNoKC5Q8gFzFuhaah5OZzRO/7aY48+BhGkKmoW2C3M7hDUe9nkLef955cUNR9Y65Q4hgO9U0s4SZsdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5701
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uZGF5LCBNYXJjaCAyMiwgMjAyMSA5OjAwIEFNLCBBbGV4YW5kZXIgU3ZlcmRsaW4gd3Jv
dGU6DQo+IE9uIE1vbiwgMjAyMS0wMy0yMiBhdCAxNTo0MyArMDAwMCwgSGFydGxleSBTd2VldGVu
IHdyb3RlOg0KPj4+IFNob3dpbmcgb25seSBwb3J0cyBBLCBGIGFuZCBubyBpbnRlcnJ1cHQgY2Fw
YWJsZSBDOg0KPj4gDQo+PiBBcmUgeW91IGp1c3QgZ29pbmcgdG8gZHJvcCB0aGUgb3RoZXIgR1BJ
TyBwb3J0cz8NCj4+IA0KPj4gVGhlIEVQOTN4eCBoYXMgZWlnaHQgOC1iaXQgcG9ydHMgdG90YWwg
KFBvcnRzIEEtSCkuIE9ubHkgMyBwb3J0IHN1cHBvcnQNCj4+IGludGVycnVwdHM6IEEgQiBhbmQg
Ri4gUG9ydHMgQSBhbmQgQiBzaGFyZSBhIHNpbmdsZSBpbnRlcnJ1cHQgYW5kIHBvcnQgRg0KPj4g
aGFzIGFuIGludGVycnVwdCBmb3IgZWFjaCBwaW4uDQo+PiANCj4+IERlcGVuZGluZyBvbiB0aGUg
Y2hpcCB0eXBlwqAgKDAxLCAwMiwgMDcsIDEyLCBvciAxNSkgbm90IGFsbCB0aGUgR1BJT3MgYXJl
DQo+PiBwaW5uZWQgb3V0IGR1ZSB0byB0aGUgY2hpcCBwaW4gY291bnQuIEJ1dCB0aGUgcmVnaXN0
ZXJzIGV4aXN0IHNvIHRoZSBjdXJyZW50DQo+PiBHUElPIHN1cHBvcnQgYWx3YXlzIHJlZ2lzdGVy
cyBhbGwgdGhlIHBvcnRzLg0KPj4gDQo+PiBOb3RlIHRoYXQgdGhlIEdQSU8gYmFua3MgYXJlIHJl
Z2lzdGVyZWQgYSBiaXQgZ29vZnksIFBvcnRzIEMgYW5kIEYgYXJlIA0KPj4gbm90IGluIG9yZGVy
LiBUaGV5IGhhdmUgYmVlbiB0aGF0IHdheSBzaW5jZSB0aGUgb3JpZ2luYWwgQ2lycnVzICJjcmF0
ZXIiDQo+PiBjb2RlIGJhc2UuIElmIEkgcmVtZW1iZXIgY29ycmVjdGx5IHRoaXMgd2FzIHNvbWV3
aGVyZSBiYWNrIGluIHRoZSAyLjYueA0KPj4ga2VybmVsLiBQbGVhc2UgbWFrZSBzdXJlIHRoZSBH
UElPIG51bWJlcnMgc3RheSB0aGUgc2FtZSBzbyB0aGF0IGFueQ0KPj4gdXNlcnNwYWNlIGNvZGUg
ZG9lcyBub3QgYnJlYWsuDQoNCj4gSSdtIHNjZXB0aWNhbCBhYm91dCB0aGlzIERUIGNvbnZlcnRp
b24uDQoNCkknbSBpbiB0aGUgc2FtZSBib2F0LiBPbmUgb2YgdGhlIHJlYXNvbnMgSSBoYXZlIG5v
dCB0cmllZCB0byBjb252ZXJ0IGl0Li4uDQoNCj4gTm90IG9ubHkgd2lsbCBpdCBtYWtlIHRoZSBr
ZXJuZWwgYmlnZ2VyIChiYWNrIHRoZW4gaXMgd2FzIGEgY29uY2VybiksIGJ1dA0KPiB0aGV5IGFs
c28gZG8gbm90IGd1YXJhbnRlZSBhbnkgb3JkZXIgb2YgR1BJT3Mgd2l0aCBEVDoNCj4NCj4gaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb21tZW50LzI0MDA5ODg3Lw0KDQpJIGJpZ2dlciBr
ZXJuZWwgY2FuIGJlIGFuIGlzc3VlIGZvciBzb21lIGVwOTN4eCBib2FyZHMuIERlcGVuZGluZyBv
biB0aGUgU0RSQU0NCmNoaXAgc2l6ZSBhbmQgaG93IHRoZXkgYXJlIGNvbm5lY3RlZCwgc29tZSBi
b2FyZHMgY2FuIGhhdmUgYXMgc21hbGwgYXMgYSAyTWlCDQpzZWdtZW50IHNpemUuIFRoYXQgbGlt
aXRzIHRoZSBzaXplIG9mIGtlcm5lbCB0aGF0IGNhbiBiZSBsb2FkZWQuIEkgaGFkIGEgbG90IG9m
IGlzc3Vlcw0Kd2l0aCBhIFRTLTcyMDAgYm9hcmQgYm9vdGluZyB1bnRpbCBJIGZpZ3VyZWQgdGhh
dCBvdXQuDQoNCkhhcnRsZXkNCg==

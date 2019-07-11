Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05AC56596D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 16:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbfGKOzL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 10:55:11 -0400
Received: from mail-eopbgr680077.outbound.protection.outlook.com ([40.107.68.77]:40342
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727612AbfGKOzL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 10:55:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjSDl++wrSVftEjy2iALzC+bfHX3sfMFm3TSMYuvRoDoa1McieEbJtBS6WOsRfs9p3le8OHdJThJBQG+SKyezT3DVdedBQSWK6Ot4x9/ufsR98R9FP6rtuGgkK2I8GNnm7hAP5HBeF8vtxDJXh8QbQCmy70uVY1XXub8rXpVaiJKIkaIbjglDGINU4/RtHAnfkktmeKU/1yicTEljJnLHC5UBHDMM+n0050mW8mdlOckr9Mz4p7gIjsx5PtOa8HXidDCW32M5QKNLH2fiahYhG+6wVsOXs42pPFTvfEqm8ohjX086aCQdjVEmhMjIiFKxx9ZFYgoJaPUcADqzPjxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBbwCCdwXlrXredqegNVB5dNCJv++Y6783CZjo5D6cI=;
 b=m9U0htOzRk3pN3Z9n283ya8xO//O02PIe4+gxg9UWliiSzg36qkP3q33CU48b5xktD2fYZMm88JhEBxbU7gO78c+t7/ZWeX3lbFebT0QDhpKBVEg/ZskCznjnAqwuBTDWYVV5xanp7HarPo1Lj5qYbvjIywrj6oc332zj9wzbbk/VPePVSnjHb/XR5Ol8JaEp4vf7EleV6CpnV+CoIqm3dOPMm0OqZ1U7IOzFkaOCcgug7WYulXtKl5Q+cZLwvNvm85urh61Tl2to2YX00B9hdOZi5HMV7p2ArbU1knhAjF6l4DNPNQWx8i+eXbZTyR1B6/ot4TTa5yGy+5Q6YnKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=welshtechnologies.com;dmarc=pass action=none
 header.from=welshtechnologies.com;dkim=pass
 header.d=welshtechnologies.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=longbow.onmicrosoft.com; s=selector1-longbow-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBbwCCdwXlrXredqegNVB5dNCJv++Y6783CZjo5D6cI=;
 b=JYpDChWXctTCNhtDayxf+Sp3ON8NZ3EjnrfIjIayjE0Fciak9xkhrAVMJOC0d9wumFlHEZtcEtEWgza5QYHfKC+mMh7Suf+y8l2vumMk9TaRPllxBaeMB28TG4ZRPvfm+mIwW2YJzfAbiMoSz+MJrD+XWftG6rcYHTqX1kHZZeo=
Received: from BN7PR13MB2532.namprd13.prod.outlook.com (52.135.254.27) by
 BN7PR13MB2275.namprd13.prod.outlook.com (52.135.247.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 14:55:07 +0000
Received: from BN7PR13MB2532.namprd13.prod.outlook.com
 ([fe80::b553:2421:7a87:89be]) by BN7PR13MB2532.namprd13.prod.outlook.com
 ([fe80::b553:2421:7a87:89be%7]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 14:55:07 +0000
From:   Kevin Welsh <kwelsh@welshtechnologies.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [libgpiod]
Thread-Topic: [libgpiod]
Thread-Index: AQHVGbroRy0t0vRlEEaYFCl837L5BKaJ2yBQgDuAGwCAAGIWoA==
Date:   Thu, 11 Jul 2019 14:55:06 +0000
Message-ID: <BN7PR13MB25322505A1D1909E914B408BDEF30@BN7PR13MB2532.namprd13.prod.outlook.com>
References: <BN7PR13MB2532728B9B6D7E73875DFCF1DE140@BN7PR13MB2532.namprd13.prod.outlook.com>
 <BN7PR13MB25322B3D67DFC0E8787E79C6DE140@BN7PR13MB2532.namprd13.prod.outlook.com>
 <CAMRc=MdzA7pkT8=uEymLizoRSQnB4bNpbW4DG-HfADhgVthUiw@mail.gmail.com>
In-Reply-To: <CAMRc=MdzA7pkT8=uEymLizoRSQnB4bNpbW4DG-HfADhgVthUiw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kwelsh@welshtechnologies.com; 
x-originating-ip: [23.116.112.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 229c8ea1-e6bd-4423-a18b-08d7060fc38b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);SRVR:BN7PR13MB2275;
x-ms-traffictypediagnostic: BN7PR13MB2275:
x-microsoft-antispam-prvs: <BN7PR13MB2275BD85E0278D50E1422916DEF30@BN7PR13MB2275.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:415;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(396003)(39830400003)(366004)(136003)(13464003)(51914003)(189003)(199004)(66946007)(66616009)(66446008)(71190400001)(66476007)(66556008)(74316002)(26005)(71200400001)(64756008)(76176011)(76116006)(6246003)(99286004)(6436002)(7736002)(53936002)(52536014)(186003)(5660300002)(6916009)(305945005)(9686003)(486006)(5024004)(55016002)(68736007)(8936002)(316002)(256004)(11346002)(25786009)(8676002)(476003)(81156014)(81166006)(508600001)(6116002)(446003)(3846002)(66066001)(7696005)(6506007)(86362001)(4326008)(99936001)(102836004)(229853002)(53546011)(2906002)(14454004)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR13MB2275;H:BN7PR13MB2532.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: welshtechnologies.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 26tki32ptAKUwZCsl6ukaBszAwqNZuKigyrYpp8dxraFcmNS2211P1a/QGFGOs4Q1SyXjDlqq9MNzI5LQDImL8onCgJMaXCgmsEm3DLjDSBGJTDXFjJaGUWog6GMYMuPKG9JjXNp5kNAA26+CmIHyzhTTXP4ItbFU+97Z/dnn9VpPVDqFUl0Ssw9JzXDOj15J++kvoztJzuU9Usm5wE4xRHpaNvc51Jouc8KDnGdWSX4MqZ8+XR/oZr5i6WdbcHNE77pJik0bQsrMM09aqwAohBBjsNKe/tpFqeZ0sGHGy+5F4RqumScei+T65E+DxDJJMAZZYxH2tw+PyH5HsRmqEtR7Tuds8f/SuIb4suJ471Fa0B6lTvUChiVTVc8eXJ7kgSmc8c3HIERU2f4elHb2buV/HG8cPbyoM1gsOh87Xw=
Content-Type: multipart/mixed;
        boundary="_002_BN7PR13MB25322505A1D1909E914B408BDEF30BN7PR13MB2532namp_"
MIME-Version: 1.0
X-OriginatorOrg: welshtechnologies.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229c8ea1-e6bd-4423-a18b-08d7060fc38b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 14:55:06.9289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5b653874-2b30-4a3c-9ec7-6517aa502373
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwelsh@welshtechnologies.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR13MB2275
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--_002_BN7PR13MB25322505A1D1909E914B408BDEF30BN7PR13MB2532namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gQmFydG9zeiwNCg0KVGhhbmtzIGZvciB0aGUgcmVwbHkuDQoNCkkgZGlkIHdvcmsgb3V0
IGEgc2ltcGxlIHBhdGNoIHRvIGdldCB3aGF0IEkgbmVlZGVkLiBJdCdzIGF0dGFjaGVkIGluIGNh
c2UgaXQncyBvZiBhbnkgdXNlLg0KDQoNCktldmluDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiANClNlbnQ6IFRo
dXJzZGF5LCBKdWx5IDExLCAyMDE5IDU6MDIgQU0NClRvOiBLZXZpbiBXZWxzaCA8a3dlbHNoQHdl
bHNodGVjaG5vbG9naWVzLmNvbT4NCkNjOiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZw0KU3Vi
amVjdDogUmU6IFtsaWJncGlvZF0NCg0KcG9uLiwgMyBjemUgMjAxOSBvIDE0OjI0IEtldmluIFdl
bHNoIDxrd2Vsc2hAd2Vsc2h0ZWNobm9sb2dpZXMuY29tPiBuYXBpc2HFgihhKToNCj4NCj4gSSBh
bSB0cnlpbmcgdG8gbWFrZSBncGlvbW9uIGludG8gYSBkYWVtb24gdXNpbmcgYnVzeWJveC4gKHN0
YXJ0LXN0b3AtZGFlbW9uIC1iKSBJbnN0ZWFkIG9mIHdyaXRpbmcgYSBtZXNzYWdlIHRvIHN0ZG91
dCwgSSBuZWVkIGl0IHRvIGV4ZWN1dGUgYSBzY3JpcHQuIE15IHVzZSBjYXNlIGlzIHRoYXQgSSBu
ZWVkIGEgYnV0dG9uIHByZXNzIChncGlvKSB0byB1bmRvIHNldHRpbmcgYSBzdGF0aWMgSVAuDQo+
DQo+IElmIEkgc2V0IC0gLWZvcm1hdD0idG91Y2ggYnV0dHRvbi13YXMtcHJlc3NlZHxzaCINCj4N
Cj4gSXMgdGhpcyBhIHZhbGlkIGNvbW1hbmQgdG8gbWFrZSBpbnRvIGEgZGFlbW9uPyBJZiBub3Qs
IGNhbiBJIHN1Ym1pdCBhIHBhdGNoIHRvIGluY2x1ZGUgYSBwYXJhbWV0ZXIgZm9yIGV4ZWN1dGlu
ZyBhIHNjcmlwdD8NCg0KSGkgS2V2aW4sDQoNCkkgZGlkbid0IHNlZSB0aGlzIG1lc3NhZ2UgYmVj
YXVzZSB5b3UgZGlkbid0IENjIG1lIHBlcnNvbmFsbHkuDQoNClllcyB5b3VyIGV4YW1wbGUgd291
bGQgd29yayBpLmUuIGdwaW9tb24gd291bGQgcHJpbnQgdGhpcyBzdHJpbmcgb24gYSBHUElPIGV2
ZW50LiBFeGVjdXRpbmcgc2NyaXB0cyBpcyBvbiBteSBUT0RPIGxpc3QsIGJ1dCB5b3VyIGNvbnRy
aWJ1dGlvbiB3aWxsIGJlIG1vcmUgdGhhbiB3ZWxjb21lLiA6KQ0KDQpCZXN0IHJlZ2FyZHMsDQpC
YXJ0b3N6IEdvbGFzemV3c2tpDQo=

--_002_BN7PR13MB25322505A1D1909E914B408BDEF30BN7PR13MB2532namp_
Content-Type: application/octet-stream; name="0001-add-script.patch"
Content-Description: 0001-add-script.patch
Content-Disposition: attachment; filename="0001-add-script.patch"; size=1726;
	creation-date="Tue, 04 Jun 2019 00:00:26 GMT";
	modification-date="Tue, 04 Jun 2019 00:00:26 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NyYy90b29scy9ncGlvbW9uLmMgYi9zcmMvdG9vbHMvZ3Bpb21vbi5jDQpp
bmRleCBjMTNhYjM4Li4wNDA5YjcwIDEwMDY0NA0KLS0tIGEvc3JjL3Rvb2xzL2dwaW9tb24uYw0K
KysrIGIvc3JjL3Rvb2xzL2dwaW9tb24uYw0KQEAgLTI3LDEwICsyNywxMSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9wdGlvbiBsb25nb3B0c1tdID0gew0KIAl7ICJyaXNpbmctZWRnZSIsCW5vX2Fy
Z3VtZW50LAkJTlVMTCwJJ3InIH0sDQogCXsgImZhbGxpbmctZWRnZSIsCW5vX2FyZ3VtZW50LAkJ
TlVMTCwJJ2YnIH0sDQogCXsgImZvcm1hdCIsCQlyZXF1aXJlZF9hcmd1bWVudCwJTlVMTCwJJ0Yn
IH0sDQorCXsgInNjcmlwdCIsCQlyZXF1aXJlZF9hcmd1bWVudCwJTlVMTCwJJ1MnIH0sDQogCXsg
R0VUT1BUX05VTExfTE9OR09QVCB9LA0KIH07DQogDQotc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0
IHNob3J0b3B0cyA9ICIraHZsbjpzcmZGOiI7DQorc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHNo
b3J0b3B0cyA9ICIraHZsbjpzcmZGOlM6IjsNCiANCiBzdGF0aWMgdm9pZCBwcmludF9oZWxwKHZv
aWQpDQogew0KQEAgLTQ3LDYgKzQ4LDcgQEAgc3RhdGljIHZvaWQgcHJpbnRfaGVscCh2b2lkKQ0K
IAlwcmludGYoIiAgLXIsIC0tcmlzaW5nLWVkZ2U6XHRvbmx5IHByb2Nlc3MgcmlzaW5nIGVkZ2Ug
ZXZlbnRzXG4iKTsNCiAJcHJpbnRmKCIgIC1mLCAtLWZhbGxpbmctZWRnZTpcdG9ubHkgcHJvY2Vz
cyBmYWxsaW5nIGVkZ2UgZXZlbnRzXG4iKTsNCiAJcHJpbnRmKCIgIC1GLCAtLWZvcm1hdD1GTVRc
dHNwZWNpZnkgY3VzdG9tIG91dHB1dCBmb3JtYXRcbiIpOw0KKwlwcmludGYoIiAgLVMsIC0tc2Ny
aXB0PVNDVFx0c3BlY2lmeSBzY3JpcHQgdG8gcnVuIHVwb24gY29tcGxldGlvblxuIik7DQogCXBy
aW50ZigiXG4iKTsNCiAJcHJpbnRmKCJGb3JtYXQgc3BlY2lmaWVyczpcbiIpOw0KIAlwcmludGYo
IiAgJSVvOiAgR1BJTyBsaW5lIG9mZnNldFxuIik7DQpAQCAtNjIsNiArNjQsNyBAQCBzdHJ1Y3Qg
bW9uX2N0eCB7DQogDQogCWJvb2wgc2lsZW50Ow0KIAljaGFyICpmbXQ7DQorCWNoYXIgKnNjdDsN
CiANCiAJaW50IHNpZ2ZkOw0KIH07DQpAQCAtMjEyLDggKzIxNSwxMCBAQCBzdGF0aWMgaW50IGV2
ZW50X2NhbGxiYWNrKGludCBldmVudF90eXBlLCB1bnNpZ25lZCBpbnQgbGluZV9vZmZzZXQsDQog
CQlyZXR1cm4gR1BJT0RfQ1RYTEVTU19FVkVOVF9DQl9SRVRfT0s7DQogCX0NCiANCi0JaWYgKGN0
eC0+ZXZlbnRzX3dhbnRlZCAmJiBjdHgtPmV2ZW50c19kb25lID49IGN0eC0+ZXZlbnRzX3dhbnRl
ZCkNCisJaWYgKGN0eC0+ZXZlbnRzX3dhbnRlZCAmJiBjdHgtPmV2ZW50c19kb25lID49IGN0eC0+
ZXZlbnRzX3dhbnRlZCkgew0KKwkJc3lzdGVtKGN0eC0+c2N0KTsNCiAJCXJldHVybiBHUElPRF9D
VFhMRVNTX0VWRU5UX0NCX1JFVF9TVE9QOw0KKwl9DQogDQogCXJldHVybiBHUElPRF9DVFhMRVNT
X0VWRU5UX0NCX1JFVF9PSzsNCiB9DQpAQCAtMjgxLDYgKzI4Niw5IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICoqYXJndikNCiAJCWNhc2UgJ0YnOg0KIAkJCWN0eC5mbXQgPSBvcHRhcmc7DQog
CQkJYnJlYWs7DQorCQljYXNlICdTJzoNCisJCQljdHguc2N0ID0gb3B0YXJnOw0KKwkJCWJyZWFr
Ow0KIAkJY2FzZSAnPyc6DQogCQkJZGllKCJ0cnkgJXMgLS1oZWxwIiwgZ2V0X3Byb2duYW1lKCkp
Ow0KIAkJZGVmYXVsdDoNCg==

--_002_BN7PR13MB25322505A1D1909E914B408BDEF30BN7PR13MB2532namp_--

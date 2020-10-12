Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1381D28BBAA
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 17:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389672AbgJLPSJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 11:18:09 -0400
Received: from mail-eopbgr1300044.outbound.protection.outlook.com ([40.107.130.44]:2465
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389142AbgJLPSJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Oct 2020 11:18:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qm/as34XUyHNuWftVdv1Nxp4qeEl5PDQzxcslWCgHXQejMfbRaX9ZtBnEmwah5pnN2ocsWBWfWV3pGrFV388I16K828Zvt0OPVvw2LdM0MBCfbhK2bom1kBidb5uIHKs/ooJGOGKMJ1JhSnCUnKq5yvIR9PsCBsHjPVdP1jqpktTiPxsB/eKOrROGgbFRpU2iPb0dV33E5jALPCza0DOP7WxOmlE0huCMb75Q39CIE5IzTaf4JHcE/Za0hK+azLfT9mrYgoDBPBkHr+zBK9dU642o/y6DgAR8YVghSBxAqGGc1oPTMUfiSlWAnvRCmaBRHsJO96Xv9RqD6GZ+YP53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgOu+Ww5BsxK0QFliZM04iI01dELHVL7Cl+NUUR2LMw=;
 b=YdWU/Rdw6QJLNJ5nGNg2p2untBBbddTnr+E/rDJd5NzS6PwjVPjS6V9P7kt2j6xrlXXhoAHoFuu6UUsyx5rqc7Fs39L1AaeNOzikhptLkhAhYEVL6uEzi0btEVymHRVREll8jze2DqC6bYkcLqrVI1Sf2RJjSEO0g7vC1CS9XqeQET3fY+Qu3tbXqjRysDunuthAKtVOHfhlfMCKey6MqaFX3gG01849xk0hbPfV90PkTSAzE1SM+VtUiKZrT10rU7ZHmtpOLpS79crStMIMzsQmaZDGi0hHPPC87OFUrwD+E6ejAdz8s3BjpgOWGMjqoz2e2VXr55Ei3+R0QnIaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgOu+Ww5BsxK0QFliZM04iI01dELHVL7Cl+NUUR2LMw=;
 b=BiTOcGp1BDmvkumQEF2Wvuns94Rq7h6zEgN1lExmA2djuTLiEgIU3Q4NXy28H8SKnBmVoht4zWw9jVXeJNak59slhE0veg4sFdx3geULQIeqeDMQ+iyOYsiy8b/ELiQTCdDTBE5qi0Hply5Hc3ZIjaGK3hTdr1EDJGMzER6Twxk=
Received: from HK0PR01MB2450.apcprd01.prod.exchangelabs.com (20.177.71.76) by
 HK0PR01MB1937.apcprd01.prod.exchangelabs.com (52.133.157.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.22; Mon, 12 Oct 2020 15:18:04 +0000
Received: from HK0PR01MB2450.apcprd01.prod.exchangelabs.com
 ([fe80::356c:79f8:86b0:6e42]) by HK0PR01MB2450.apcprd01.prod.exchangelabs.com
 ([fe80::356c:79f8:86b0:6e42%7]) with mapi id 15.20.3455.030; Mon, 12 Oct 2020
 15:18:04 +0000
From:   =?utf-8?B?U1ogTGluICjmnpfkuIrmmbop?= <SZ.Lin@moxa.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [ANNOUNCE] libgpiod v1.6 released
Thread-Topic: [ANNOUNCE] libgpiod v1.6 released
Thread-Index: AQHWmvt2Fg0z1G6AdECnG3rlgeqHs6mSl8Ww
Date:   Mon, 12 Oct 2020 15:18:04 +0000
Message-ID: <HK0PR01MB24504356D7FA20A34AECAABAE2070@HK0PR01MB2450.apcprd01.prod.exchangelabs.com>
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
 <CAHp75Vfy8un3APcYqWyO9b8aFMAyKVSkAbn=6kxpbSthgq4jxA@mail.gmail.com>
 <CAMRc=MfP9EBqUCvcKUmwF4Zd+yFO-yfC6718ZXeM1PbtEqYWNQ@mail.gmail.com>
 <CAHp75VdCfLrTcM5BeEgxyoRR5ptYDqQQQthrUmNoc7Fy9SwTXA@mail.gmail.com>
 <CAMRc=MdavJ6w3S=5F+00oD7AxtUtC6KgvQm7GvJqX04CVrPjcw@mail.gmail.com>
In-Reply-To: <CAMRc=MdavJ6w3S=5F+00oD7AxtUtC6KgvQm7GvJqX04CVrPjcw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bgdev.pl; dkim=none (message not signed)
 header.d=none;bgdev.pl; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [125.227.121.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ef48b91-46b8-491c-4336-08d86ec20427
x-ms-traffictypediagnostic: HK0PR01MB1937:
x-microsoft-antispam-prvs: <HK0PR01MB19371F47D9606AB36BD39438E2070@HK0PR01MB1937.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /SDCG4YuAa1DvSBRusa52Z+2Vmi3VcQhUQV1gghqeRZTrd5rUJihKf4d2nlpE+G5kCztQRBoPF0QJJG/WDma6ZlPn0HPrDHoijmdqfETqnNwb6/DDYk3YBeMWLP63dbjcWJUtiVGjfDigDjIvSvS7Hp3X3qb5jsptyCBKAoso0N8A2wOHNTTA0sJ2eB22HZmfBKakzGurDCmDaIZbBFgj7sKHnRYv1IAvJGbNkmJtWf3glrWT93ai2W4UIUnSpy/Ra7N2mg2J3FLnCMQ+PJVYF4pBFf1E/DBbje1aVHK6+MRUNK3jghzrD2nP2ypekSuEKsMvt5FF3Qags4yp5oK5ALeWVB+a4Xekb/W/tZ4yNc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR01MB2450.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(76116006)(4326008)(71200400001)(83380400001)(85182001)(7696005)(5660300002)(316002)(86362001)(26005)(186003)(55016002)(8676002)(33656002)(8936002)(9686003)(54906003)(6506007)(66946007)(66476007)(66446008)(66556008)(64756008)(52536014)(478600001)(110136005)(2906002)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: lp+77elEBIvZApLiH0v7vZtPbt3+jYje4MnZizu89ofPVTh8ULN45Q84eNXEhMzqOC/RcGtcLsF1jryw23utmYrlDznFb6hVaaRWSj+FwTS/wWko4aL1R4/L5yNMK2JckPchREAZzDzl3P2tFNgw2V7TOat8eeR6fcnQVFJmauGWCKz1/uJsjVAROk3LQ30mTXv1Amh6fiw/4Et0FEl3POyJmpBfvb7Afn+Xo32vizcyCDMLVwrZ3nyy/Sc71tq69j7QRktbHVUohg2ELOnL3Cbi7ea0TD+e8FV0a1W9mOYpzJxYd0qPeLhk8zYpvVWAEOdAXgIBrC297Bh6Ccfj98EjuQbKphrv9lWB755w6sgzL1z9nUMh6m+zxoCg2QkfncW9gPBm43EvhhRSaosgukk85AC/DfsKanqur44KsPLWvkBMCOAIJUppAt6BV+WC5Sv+jR8KLswRlPQKRudor2J4UmNPHugSCc6mpMeBqhC1KNGs7Srb/hlMVfI8dy49sVFXHRMKLhZVT8bZzwtLDvh1quATRRdDbg4e7Sr/7BKyYFWpxL4WRpTRw/BsgimYVHmvSauDjGT8nbm9D66ziUASEWVar2RTFcWkGIhzuuEApnVMlqIOeTczoacgqmK9O/RkOmtUH5rSD2xuh6D7Bg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR01MB2450.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef48b91-46b8-491c-4336-08d86ec20427
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 15:18:04.4248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJ2z8FLl8EufRorR5xhAbSh5KOnpuBHPwr/oWP1VrXG5TR/Suo2KJ9G4z+xNLdX9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR01MB1937
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksDQoNCjxzbmlwPg0KDQo+IEkgcGVyc29uYWxseSBkb24ndCBjYXJlIG11Y2ggYWJvdXQgaG93
IGRlc2t0b3AgZGlzdHJvcyBoYW5kbGUgdGhpcyAtIEknbSBtb3N0bHkNCj4gaW50ZXJlc3RlZCBp
biBiZXNwb2tlIGVtYmVkZGVkIGRpc3Ryb3MgYnVpbHQgd2l0aCB5b2N0byBvciBidWlsZHJvb3Qu
IEknbSBDYydpbmcNCj4gU1ogTGluIHdobyBtYWludGFpbnMgdGhlIGxpYmdwaW9kIGRlYmlhbiBw
YWNrYWdlLg0KDQpOb3dhZGF5cywgbWFueSBlbWJlZGRlZCBkaXN0cm9zIGFyZSBkZXJpdmVkIGZy
b20gRGViaWFuLCBzdWNoIGFzIFJhc3BiZXJyeSBQaSBPUw0KKHByZXZpb3VzbHkgY2FsbGVkIFJh
c3BiaWFuKS4gTW9yZW92ZXIsIHRoZSBtZXRhLWRlYmlhbiBbMV0gcHJvdmlkZXMgdGhlIHJlY2lw
ZXMgZm9yIHRoZQ0KUG9reSBidWlsZCBzeXN0ZW0gdG8gYnVpbGQgaW1hZ2VzIHVzaW5nIERlYmlh
biBzb3VyY2UgcGFja2FnZXMgd2l0aGluIHRoZSBZb2N0byBwcm9qZWN0IFsyXS4NCg0KWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS9tZXRhLWRlYmlhbi9tZXRhLWRlYmlhbg0KWzJdIGh0dHBzOi8vd3d3
LnlvY3RvcHJvamVjdC5vcmcvbGVhcm4taXRlbXMvZGVieS1yZXByb2R1Y2libGUtYW5kLW1haW50
YWluYWJsZS1lbWJlZGRlZC1saW51eC1lbnZpcm9ubWVudC13aXRoLXBva3kvDQoNCj4gDQo+IFNa
IExpbjogbGliZ3Bpb2Qgd2lsbCBnZXQgYSBuZXcgbWFqb3IgcmVsZWFzZSBpbiB0aGUgZm9sbG93
aW5nIG1vbnRocw0KPiAtIHRoZSBBUEkgd2lsbCBiZWNvbWUgdjIueCBhbmQgQUJJIHYzLnggLSBk
byB5b3UgdGhpbmsgaXQncyBpbXBvcnRhbnQgdG8gbWFrZSBpdA0KPiBwb3NzaWJsZSBmb3IgdHdv
IG1ham9yIHZlcnNpb25zIG9mIGxpYmdwaW9kIHRvIGxpdmUgdG9nZXRoZXIgaW4gYSBzaW5nbGUg
c3lzdGVtPyBJDQoNCkl0J3MgcG9zc2libGUsIGJ1dCBJIHRoaW5rIGl0J3MgKm5vIHN0cm9uZ2x5
IG5lZWRlZCogYW5kIHRoZXJlIGFyZSBubyBvdGhlciBEZWJpYW4gDQpwYWNrYWdlcyBkZXBlbmQg
b24gbGliZ3Bpb2QsIGFzIHNob3duIGJlbG93Lg0KDQo9PT0NCmFwdCByZGVwZW5kcyBsaWJncGlv
ZDINCmxpYmdwaW9kMg0KUmV2ZXJzZSBEZXBlbmRzOg0KwqAgRGVwZW5kczogbGliZ3Bpb2QtZGV2
ICg9IDEuNS4yLTEpDQrCoCBEZXBlbmRzOiBweXRob24zLWxpYmdwaW9kICg9IDEuNS4yLTEpDQrC
oCBEZXBlbmRzOiBncGlvZCAoPj0gMS41LjEpDQo9PT0NCg0KQWxsIG9mIHRoZSBhYm92ZSBiaW5h
cnkgcGFja2FnZXMgYXJlIGJ1aWx0IGZyb20gdGhlIHNhbWUgKGxpYmdwaW9kKSBzb3VyY2UgcGFj
a2FnZS4NCg0KPiB3b3VsZCBsaWtlIHRvIGF2b2lkIGhhdmluZyB0byByZW5hbWUgZXZlcnl0aGlu
ZyBhbmQgdXNlIGxpYmdwaW9kMi4wDQo+IGV2ZXJ5d2hlcmUgLSB0aGlzIGluZm9ybWF0aW9uIGlz
IGFscmVhZHkgc3RvcmVkIGluIHRoZSBBUEkgdmVyc2lvbi4gRG9lcyBkZWJpYW4NCj4gc3VwcG9y
dCBzb21ldGhpbmcgbGlrZSB5b2N0bydzIHZpcnR1YWwgcHJvdmlkZXJzIG1heWJlPyBIb3cgZG8g
eW91IHNlZSB0aGlzIGZvcg0KPiBhIGRlc2t0b3AgZGlzdHJvLg0KDQpJJ20gbm90IGZhbWlsaWFy
IHdpdGggWW9jdG8ncyBtZWNoYW5pc20sIGJ1dCBpbiB0aGlzIGNhc2UsIHRoZSBBQkkgY2hhbmdl
cyBzZWVtIHRoYXQNCmFyZSBub3QgYmFja3dhcmQtY29tcGF0aWJsZTsgd2Ugbm9ybWFsbHkgcmVx
dWlyZSBjaGFuZ2luZyB0aGUgU09OQU1FIG9mIHRoZSBsaWJyYXJ5DQphbmQgdGhlIHNoYXJlZCBs
aWJyYXJ5IHBhY2thZ2UgbmFtZS4NCg0KU1oNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBCYXJ0
b3N6IEdvbGFzemV3c2tpDQo=

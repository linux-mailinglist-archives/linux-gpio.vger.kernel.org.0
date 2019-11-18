Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66496FFFCE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 08:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfKRHuw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 02:50:52 -0500
Received: from mail-eopbgr800081.outbound.protection.outlook.com ([40.107.80.81]:8475
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726325AbfKRHuw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 02:50:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpAibOMlo7EEscnED5tRpAs8Sx9E8lKOeapqOkdIE/v6wg4X1GBP2tiWOGqxfvytJoEt3fJng3r5eg88nrhn/O92f8u03JPGXQ/lE5UhvbKVeMOLAuMmbAjCQuMul5TNrwaPuqKP1FqaBGUpANbwwi5TZoY2lDYMVseI4J2zzmf6xziN3mAc11uvJi7tG9BLtiGSqHEChhiyZeXwI8Pv/4yjT1CzDxIAK1vQO9xARSbhxzIXukoCXlOY0sDF57tArRVEWnuSRjMr3TELdu+lkoq3xMhLOiih3CYlbbhkU3feJRCrlka4Jv44x2YRzMRa3eoGfp8xL+4AepSByhro6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EOPxIJkiz0vUXdV0duYpOM6sD9HCm0NTTrHR7UMpK0=;
 b=h5wYGfeYzTbMZZDboMEzJQZZXTFs0n8cendDfRLv5sGt82ikJG4uoFFZ9kq1AWczPc9K72PY59Y2yUye6x3Yz0TQNtvrGZGUqiXvhAD8KS6D+NOsNflDO9DGYmL2FeGo9GkAKgZ9mX6+Vu9iH/gB+VAG2I/u/yk/z++eC3w6Z0qB6nPWNfWt5+nyOO273ABmfTb9+ZXsSJZzBHUqo6w2DUIMNqLw7eciFKymiSz+fzV9TnOUCsFitC8vjjmZGDJsHaUPIrMjZAH1ItS02TMf7/FwVAAfXZJibPfHLCPUGF1Oazl1W9yOUFFHcLwfasumK49HMDr/YbuiLFeRp8vqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EOPxIJkiz0vUXdV0duYpOM6sD9HCm0NTTrHR7UMpK0=;
 b=AbHKXxVyJJXKNx3uOcy6rmwEQV/R8hVkJXIu0bv1zsHvTwra0fqPxsR5D8Qx3YmA/1FFGhVqTWNHEH3IInfic4LVKXxfilVHhvUr0Y4kAmMqlBU2y+iwzNPYlto81uCCbiYauO/VmoSaPuCxPniZGdFZJRSW5PfOUgymgfez7Ec=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3591.namprd13.prod.outlook.com (52.132.244.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.9; Mon, 18 Nov 2019 07:50:49 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.012; Mon, 18 Nov 2019
 07:50:49 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     Marc Zyngier <maz@kernel.org>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: RE: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Topic: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Index: AQHVmVJqQXFGHo/64k2Vkr22HauCBaeHfxOAgAkN8OA=
Date:   Mon, 18 Nov 2019 07:50:48 +0000
Message-ID: <CH2PR13MB3368302564103DC1EC8907D68C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com>
 <d82620dd33bdd6bb4d34e49600a506d1@www.loen.fr>
In-Reply-To: <d82620dd33bdd6bb4d34e49600a506d1@www.loen.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac3fbad0-f9c1-4624-5976-08d76bfc0712
x-ms-traffictypediagnostic: CH2PR13MB3591:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3591CBB752FE039A438937BF8C4D0@CH2PR13MB3591.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(346002)(39840400004)(396003)(136003)(366004)(376002)(13464003)(199004)(189003)(26005)(6506007)(186003)(55016002)(9686003)(6436002)(102836004)(33656002)(81156014)(486006)(44832011)(14454004)(6246003)(81166006)(8936002)(25786009)(11346002)(229853002)(76176011)(7696005)(8676002)(476003)(6916009)(76116006)(446003)(107886003)(66946007)(4326008)(66476007)(66556008)(64756008)(66446008)(6116002)(3846002)(66066001)(4001150100001)(53546011)(2906002)(54906003)(316002)(305945005)(71190400001)(52536014)(74316002)(478600001)(71200400001)(256004)(5660300002)(7736002)(99286004)(86362001)(7416002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3591;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WJkYap20R0uHot8uumffsd3UfTWqP+M5rhSNCEU/xAXV1JVN+HpE5MHqH8W05oRVWMBJhNERympMHKTpoO7vlzyXV6ftDL9EozT325REJo/OXMrhCJihwfMQeZzgUTwxL6ClZbYNeYllTayL0Sy0FK9BRYV25z05PBCzSKqFkyUMidKLcteOaSKH1O+KGjAwK1P7S89NQmeyqdcf0wWIMrcZMnjgdHsrs72OeKN00kqyLFP2tbh/Pzr9v4Bf98KMpUGIhNv3KnYh0rOoNfkyUuvkRhdQOzhhm6xpDduHv0UVOaeCNuP2lVaKazi1j2LIfeHUvoIc1T9Rf58oKis8rrlXkkUi2xkklcagE4pyByGnhKGVKXO3a7VWl3hSQ4QW2N1gq8s/7OqkALR53aPoW3qlPHTkRoWgAFBpmrxmjBxzWfzeyomjQqGAqS8kGIuD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3fbad0-f9c1-4624-5976-08d76bfc0712
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 07:50:48.9419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrOtzAVrdtJKSOWMHHV7yVecFNthirnvKBXLuQOnei6F+MPHg/hPB6D+NLlLIqmFUtvtjpCLBdzq1BVxJF/6Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3591
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmMgWnluZ2llciA8bWF6
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDEyIE5vdmVtYmVyIDIwMTkgMTg6MjgNCj4gVG86IFlhc2gg
U2hhaCA8eWFzaC5zaGFoQHNpZml2ZS5jb20+DQo+IENjOiBsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc7IGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb207DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFy
ay5ydXRsYW5kQGFybS5jb207IHBhbG1lckBkYWJiZWx0LmNvbTsgUGF1bA0KPiBXYWxtc2xleSAo
IFNpZml2ZSkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT47IGFvdUBlZWNzLmJlcmtlbGV5LmVk
dTsNCj4gdGdseEBsaW51dHJvbml4LmRlOyBqYXNvbkBsYWtlZGFlbW9uLm5ldDsgYm1lbmcuY25A
Z21haWwuY29tOw0KPiBhdGlzaC5wYXRyYUB3ZGMuY29tOyBTYWdhciBLYWRhbSA8c2FnYXIua2Fk
YW1Ac2lmaXZlLmNvbT47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBTYWNoaW4gR2hhZGkNCj4gPHNhY2hpbi5naGFk
aUBzaWZpdmUuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNF0gZ3Bpbzogc2lmaXZlOiBB
ZGQgR1BJTyBkcml2ZXIgZm9yIFNpRml2ZSBTb0NzDQo+IA0KPiBPbiAyMDE5LTExLTEyIDEzOjIx
LCBZYXNoIFNoYWggd3JvdGU6DQo+ID4gQWRkcyB0aGUgR1BJTyBkcml2ZXIgZm9yIFNpRml2ZSBS
SVNDLVYgU29Dcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlc2xleSBXLiBUZXJwc3RyYSA8
d2VzbGV5QHNpZml2ZS5jb20+DQo+ID4gW0F0aXNoOiBWYXJpb3VzIGZpeGVzIGFuZCBjb2RlIGNs
ZWFudXBdDQo+ID4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFzaCBTaGFoIDx5YXNoLnNoYWhAc2lmaXZlLmNvbT4N
Cj4gDQo+IFsuLi5dDQo+IA0KPiA+ICtzdGF0aWMgaW50IHNpZml2ZV9ncGlvX2NoaWxkX3RvX3Bh
cmVudF9od2lycShzdHJ1Y3QgZ3Bpb19jaGlwICpnYywNCj4gPiArCQkJCQkgICAgIHVuc2lnbmVk
IGludCBjaGlsZCwNCj4gPiArCQkJCQkgICAgIHVuc2lnbmVkIGludCBjaGlsZF90eXBlLA0KPiA+
ICsJCQkJCSAgICAgdW5zaWduZWQgaW50ICpwYXJlbnQsDQo+ID4gKwkJCQkJICAgICB1bnNpZ25l
ZCBpbnQgKnBhcmVudF90eXBlKQ0KPiA+ICt7DQo+ID4gKwkvKiBBbGwgdGhlc2UgaW50ZXJydXB0
cyBhcmUgbGV2ZWwgaGlnaCBpbiB0aGUgQ1BVICovDQo+ID4gKwkqcGFyZW50X3R5cGUgPSBJUlFf
VFlQRV9MRVZFTF9ISUdIOw0KPiANCj4gSXQgaXMgYml6YXJlIHRoYXQgeW91IGVuZm9yY2UgTEVW
RUxfSElHSCBoZXJlLCB3aGlsZSBzZXR0aW5nIGl0IHRvIE5PTkUgaW4gdGhlDQo+IFBMSUMgZHJp
dmVyLiBUaGVzZSB0aGluZ3Mgc2hvdWxkIGJlIGNvbnNpc3RlbnQuDQoNCldpbGwgY2hhbmdlIHRo
aXMgdG8gSVJRX1RZUEVfTk9ORS4NCg0KPiANCj4gPiArCSpwYXJlbnQgPSBjaGlsZCArIDc7DQo+
IA0KPiBJcmssIG1hZ2ljIG51bWJlcnMuLi4NCg0KVGhpcyBpcyB0aGUgb2Zmc2V0IGZvciBHUElP
IElSUXMuIFdpbGwgYWRkIGEgbWFjcm8gZm9yIHRoaXMuDQpUaGFua3MgZm9yIHlvdXIgY29tbWVu
dHMhDQoNCi0gWWFzaA0KDQo=

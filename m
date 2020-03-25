Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01F819319B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 21:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgCYUG3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 16:06:29 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:56501 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbgCYUG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 16:06:28 -0400
IronPort-SDR: pB7GdzD9BTZS/MLAaK9kRUFukGOkSPGmNkkzYIWhGkdI3/V2rlyaWcWVgQb1fWLnc5WhrZ0fpk
 E8Kb+7aRIhn+Gl0QL8meH8zoqLqt1WiBqCsKslWSj5fWkGGiVa35oMK6XOEQeIm6eg0gmgmln2
 MQ4eV7vsN5ZYnRm/CjMQ8cR6v9iDKb2paURcfNYbJv9xqNk4ZFXFZy63akmJKZEcpfLXU7b/XT
 VpH7nUi8hBs0qBzd05SIYONGvMdOo4zwzp5rzTkSk+zi9Ld93p//iI4V05kdL7w4Y+rtC0jC0l
 CSo=
X-IronPort-AV: E=Sophos;i="5.72,305,1580799600"; 
   d="scan'208";a="6992149"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Mar 2020 13:06:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Mar 2020 13:06:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 25 Mar 2020 13:06:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBKc9Mq1oVsMc+lDWmxVjyhumiqb7JuKd2J7FQMhAyfA7x0xWG1MP/ZeUP585IqvPzs000L6ZDq6h75O7gCytjF/gBExI07AJWiM1Ktd64ajgRGdZpzScYPhRqsSOjxpaZgFsE8nyOrDKSMIAabkIIdiI0WOC7O5lTZob9LDxZ9ryXcrRDM1bumYikMlwMPp/Rs5f1PCcPLreixtbEszNX4l9UbvKGetGN3HSz2h22qeAFz1jxEzs5eOlwysJkRNoaiKQH1S7MDwih8RxH7RKj7AKeV73CulKmkaXojwpG81nCSiDAsolSvdzXharO1EXqO6GxVAq9yZJhOBh9SLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDceMaHR56nNNr/0pvbUovyarobD2o7U55+PL2zGZU8=;
 b=FcCZQ4nrrwyVBvR3ghcn7lAgJUpZO2nJpionK2dga5hWYVgsH7tevF/OCuVmvrb+mHq542Za/hzb3m5osTT5X7CuCoBqSQWh6HmgLCs/FKhn+ppyGqqScDrtSdYPDOqEqavT7cPjo4YqLLxkWbhCgd1V1ksdwwXZx+YhHc1Jw7y7JVQ0gMCxZWFFuUVy12XOnoFJSmSkwvnYQ1mIb9V3IGWA5/yQTzHfJj4hyXV2NKAbJvxJqt9CppsScZTlHtDz7oFA16RiaxTbYGfizuGkpTRMGVGHAaTGzr/jTtEsQbZgxCA1Jsvc+SJThmpyl2lmtoM+HFM/H7pYGn+dDt71LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDceMaHR56nNNr/0pvbUovyarobD2o7U55+PL2zGZU8=;
 b=C+iKB7f7Sdc6j8EBDrvya+LZd7/Zut/1GLGUkRuGKSKmpiIiREUm3/aawOlETybKgErsKMNydSdO62/Bk+Q2qZeYesw3VCJoPH6JKxTpZ29YbEleLQhKv1XthczqYm9Coqo+y54YTUiUgZuKmCYEQtuaSEZP90kdIPV1HiJ9uGs=
Received: from BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21)
 by BY5PR11MB3974.namprd11.prod.outlook.com (2603:10b6:a03:183::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 25 Mar
 2020 20:06:07 +0000
Received: from BY5PR11MB3895.namprd11.prod.outlook.com
 ([fe80::c09b:2e03:b941:13c5]) by BY5PR11MB3895.namprd11.prod.outlook.com
 ([fe80::c09b:2e03:b941:13c5%5]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 20:06:07 +0000
From:   <Ludovic.Desroches@microchip.com>
To:     <alan@softiron.com>, <linux@armlinux.org.uk>,
        <linus.walleij@linaro.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <linux-gpio@vger.kernel.org>, <Codrin.Ciubotariu@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: pinctrl states vs pinmux vs gpio (i2c bus recovery)
Thread-Topic: pinctrl states vs pinmux vs gpio (i2c bus recovery)
Thread-Index: AQHVrFth3luRvvMnSEKAQXD6fsgUbKew9CSAgAZJTgCAeITugIAqKqIAgAB79QA=
Date:   Wed, 25 Mar 2020 20:06:07 +0000
Message-ID: <edb09f97-7748-f7d0-cad6-e79db7950b0d@microchip.com>
References: <20191206173343.GX25745@shell.armlinux.org.uk>
 <CACRpkdZv2rzA8AbFZKq0XVBaXNJR8c5tsb+1KTZ7fNuWjm5cbQ@mail.gmail.com>
 <20191213002010.GO25745@shell.armlinux.org.uk>
 <1ca5d81d-5aa9-8f8d-8731-4d34de9c6bfa@softiron.com>
 <4f9bb480-ba8d-b70e-961b-d6032232d250@softiron.com>
In-Reply-To: <4f9bb480-ba8d-b70e-961b-d6032232d250@softiron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Ludovic.Desroches@microchip.com; 
x-originating-ip: [92.150.97.227]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ab7aef9-fffa-4e76-8b82-08d7d0f7f4b4
x-ms-traffictypediagnostic: BY5PR11MB3974:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3974DB46BFC54D3A12E51949EFCE0@BY5PR11MB3974.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(366004)(136003)(396003)(6512007)(31686004)(86362001)(31696002)(110136005)(4326008)(71200400001)(53546011)(6506007)(2906002)(186003)(26005)(2616005)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(36756003)(6486002)(316002)(966005)(5660300002)(54906003)(8676002)(81166006)(8936002)(81156014)(478600001)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB3974;H:BY5PR11MB3895.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VwQq97p4Bkkt6g5qgeaWCMXGA0ocIsUj91iV+9kzacPnSfHjAYFQYZTp1axMUU+tgkqhbB1U00ilpfZHEs9TiFTdZNV/nzlOcXMzvd//mEyKJW81XJwKE+NBVSQSraBiPGhZ0lOGBEPUhHTXeuP7helF996pCrSwAUUsaSUqXkgW9wNQtqu4na5KKc0Q907WaYoO4IcLHYrgIES7G57yTQScJWUPSHfsBbHL6Y4ZjTr3cSpbsVo4+t+IlVB8xcQ5cpYbSF/kgXrdloq7pchMZut1R5idNpQTswfyh0MJUHuXfv81qGF+L6qajJyPrS0HuToHmJsFJE2YXANmHf7W4l2NJYFeljVJYUnF46BHoDxqDh+nLzqWqPkpFAO21tlJO1yiHknLbk4eLze9IsCWxHPPaXdVetSyAv2FdowFF3pUdA1BZn6DfzEFfC6NGHQ+dzFfW7SkVwpsN3ogdO4MdhVNbTIWAeiKgS3xv/UIVAqJd/cgamm3uBVSxyDCKrrz8thdzKfVaE7IcmtT6jgfOA==
x-ms-exchange-antispam-messagedata: 13AEe77zFIxCGjk+ZUt8FRmMOIYajeYV33qQuu8mMgrCyHkFRYY+/OgNZLvTUn4CUtsOaoFzdpHZLBqLCU0Gfms7HdbKO0NUh+yBTL+2qq6MgUsgRSkTXRKNBJqxY/TARhE6ZGeWVkKQ90qtT1VEMQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7453B015B60444985444E3FEA919B0F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab7aef9-fffa-4e76-8b82-08d7d0f7f4b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 20:06:07.5138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqCvjLD0Np6i1lVQAv7HCrwDFIzrVzNMpim882ILgWpP90OUfKnNLOHWfL17xup8EqxKnh0rNLnot9eFHvhFGHEtqE6bavAI9UX/D8ETy5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3974
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gMy8yNS8yMDIwIDE6NDIgUE0sIEFsYW4gT3R0IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IA0K
PiB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAyLzI3LzIwIDExOjQ3IEFNLCBBbGFuIE90
dCB3cm90ZToNCj4+IE9uIDEyLzEyLzE5IDc6MjAgUE0sIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51
eCBhZG1pbiB3cm90ZToNCj4+PiBPbiBNb24sIERlYyAwOSwgMjAxOSBhdCAwMToyMDoxNUFNICsw
MTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0KPj4+PiBIaSBSdXNzZWxsLA0KPj4+Pg0KPj4+PiB2
ZXJ5IG5pY2UgZGVzY3JpcHRpb24gb2YgdGhpcyBkdWFsLW1vZGUgcHJvYmxlbS4NCj4+Pj4NCj4+
Pj4gSSB3aXNoIEkgaGFkIGEgc2ltcGxlIGFuZCBlbGVnYW50IHdheSB3ZSBjb3VsZCBtYWtlIGl0
DQo+Pj4+IHVuYW1iaWd1b3VzIGFuZCBzaW1wbGUgdG8gdXNlIC4uLiBidXQgaXQgYmVhdHMgbWUg
cmlnaHQNCj4+Pj4gbm93Lg0KPj4+Pg0KPj4+PiBPbiBGcmksIERlYyA2LCAyMDE5IGF0IDY6MzMg
UE0gUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluDQo+Pj4+IDxsaW51eEBhcm1saW51eC5v
cmcudWs+IHdyb3RlOg0KPj4+Pg0KPj4+Pj4gT25lIG1heSBleHBlY3Q6DQo+Pj4+Pg0KPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoCBwaW5jdHJsX3NlbGVjdF9zdGF0ZShpMmNfaW14LT5waW5jdHJsLA0K
Pj4+Pj4gaTJjX2lteC0+cGluY3RybF9waW5zX2RlZmF1bHQpOw0KPj4+Pj4NCj4+Pj4+IHRvIGNo
YW5nZSB0aGVtIGJhY2sgdG8gdGhlIGRlZmF1bHQgc3RhdGUsIGJ1dCB0aGF0IHdvdWxkIGJlIGlu
Y29ycmVjdC4NCj4+Pj4+IFRoZSBmaXJzdCB0aGluZyB0aGF0IHBpbmN0cmxfc2VsZWN0X3N0YXRl
KCkgZG9lcyBpcyBjaGVjayB3aGV0aGVyDQo+Pj4+Pg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBw
LT5zdGF0ZSA9PSBzdGF0ZQ0KPj4+Pj4NCj4+Pj4+IHdoaWNoIGl0IHdpbGwgZG8sIGFzIHRoZSBw
aW5jdHJsIGxheWVyIGhhc24ndCBiZWVuIGluZm9ybWVkIG9mIHRoZQ0KPj4+Pj4gY2hhbmdlIHRo
YXQgaGFzIGhhcHBlbmVkIGJlaGluZCBpdHMgYmFjayBhdCB0aGUgcGlubXV4IGxldmVsLg0KPj4+
PiBTb21lIHBpbiBjb250cm9sbGVycyBoYXZlIHRoZSAuc3RyaWN0IHByb3BlcnR5IHNldA0KPj4+
PiBpbiB0aGVpciBzdHJ1Y3QgcGlubXV4X29wczoNCj4+Pj4NCj4+Pj4gKiBAc3RyaWN0OiBkbyBu
b3QgYWxsb3cgc2ltdWx0YW5lb3VzIHVzZSBvZiB0aGUgc2FtZSBwaW4gZm9yIEdQSU8gYW5kDQo+
Pj4+IGFub3RoZXINCj4+Pj4gKsKgwqDCoMKgwqAgZnVuY3Rpb24uIENoZWNrIGJvdGggZ3Bpb19v
d25lciBhbmQgbXV4X293bmVyIHN0cmljdGx5IGJlZm9yZQ0KPj4+PiBhcHByb3ZpbmcNCj4+Pj4g
KsKgwqDCoMKgwqAgdGhlIHBpbiByZXF1ZXN0Lg0KPj4+Pg0KPj4+PiBUaGUgbm9uLXN0cmljdCBw
aW4gY29udHJvbGxlcnMgYXJlIHRob3NlIHRoYXQgYWN0dWFsbHkgYWxsb3cgR1BJTw0KPj4+PiBh
bmQgZGV2aWNlIGZ1bmN0aW9ucyB0byBiZSB1c2VkIG9uIHRoZSBzYW1lIHBoeXNpY2FsIGxpbmUg
YXQgdGhlDQo+Pj4+IHNhbWUgdGltZS4gSW4gdGhpcyBjYXNlIHRoZXJlIGlzIG5vdCBzcGVjaWFs
IEdQSU8gbW9kZSBmb3IgdGhlDQo+Pj4+IGxpbmUgaW4gc29tZSBtdXhpbmcgcmVnaXN0ZXJzLCB0
aGV5IGFyZSBqdXN0IHBoeXNpY2FsbHkgY29ubmVjdGVkDQo+Pj4+IHNvbWVob3cuDQo+Pj4+DQo+
Pj4+IE9uZSB1c2VjYXNlIGlzIHNvcnQgb2YgbGlrZSBob3cgdGNwZHVtcCB3b3JrIGZvcg0KPj4+
PiBldGhlcm5ldCBpbnRlcmZhY2VzOiBhIEdQSU8gcmVnaXN0ZXIgY2FuICJzbm9vcCIgb24gYSBw
aW4gd2hpbGUNCj4+Pj4gaW4gdXNlZCBieSBhbm90aGVyIGRldmljZS4NCj4+Pj4NCj4+Pj4gQnV0
IGl0IHdvdWxkIG5vdGFibHkgYWxzbyBhbGxvdyB5b3UgdG8gZHJpdmUgdGhlIGxpbmUgYW5kIGlu
dGVyZmVyZQ0KPj4+PiB3aXRoIHRoZSBkZXZpY2UuIFdoaWNoIGlzIGV4YWN0bHkgd2hhdCB0aGlz
IEkyQyByZWNvdmVyeSBtZWNoYW5pc20NCj4+Pj4gZG9lcywganVzdCB0aGF0IGl0cyBwaW4gY29u
dHJvbGxlciBpcyBhY3R1YWxseSBzdHJpY3QsIHdpbGwgbm90IGFsbG93DQo+Pj4+IHRoZSBzYW1l
IGxpbmUgdG8gYmUgdXNlZCBmb3IgR1BJTyBhbmQgc29tZSBvdGhlciBmdW5jdGlvbiBhdCB0aGUN
Cj4+Pj4gc2FtZSB0aW1lLCBzbyBJIHN1cHBvc2UgaS5NWCBzaG91bGQgcHJvYmFibHkgZXhwbG9y
ZSB0aGUNCj4+Pj4gc3RyaWN0IG1vZGUuDQo+Pj4+DQo+Pj4+IEVuYWJsaW5nIHRoYXQgd2lsbCBz
YWRseSBtYWtlIHRoZSBwcm9ibGVtIE1PUkUgY29tcGxleA0KPj4+PiBmb3IgdGhpcyBJMkMgcmVj
b3ZlcnksIHJlcXVpcmluZyBhIGN5Y2xlIG9mDQo+Pj4+IGdwaW9kX3B1dCgpL2dwaW9kX2dldCgp
IHRvIGdldCBpdCByZWxlYXNlZCBmcm9tIEdQSU8gbW9kZSwgaS5lLg0KPj4+PiB3ZSB3b3VsZCBu
ZWVkIHRvIGp1c3QgZ2V0IHRoZSBHUElPIHdoZW4gdGhpcyBpcyBzdHJpY3RseSBuZWVkZWQuDQo+
Pj4+IFVzaW5nIGRldm1fZ3Bpb2RfZ2V0KCkgYW5kIGtlZXBpbmcgYSByZWZlcmVuY2UgZGVzY3Jp
cHRvcg0KPj4+PiBhcm91bmQgd291bGQgbm90IHdvcmsgYWxsIG9mIGEgc3VkZGVuLg0KPj4+Pg0K
Pj4+PiBJIGFtIHRoaW5raW5nIHdoZXRoZXIgd2UgY2FuIGhhbmRsZSB0aGUgbm9uLXN0cmljdCBj
b250cm9sbGVycw0KPj4+PiBpbiBhIG1vcmUgZWxlZ2FudCB3YXksIG9yIGFkZCBzb21lIEFQSSB0
byBleHBsaWNpdGx5IGhhbmQgb3Zlcg0KPj4+PiBiZXR3ZWVuIGRldmljZSBmdW5jdGlvbiBhbmQg
R1BJTyBmdW5jdGlvbi4gQnV0IEkgY2FuJ3QgcmVhbGx5DQo+Pj4+IHNlZSBzb21lIG9idmlvdXMg
c29sdXRpb24uDQo+Pj4gV2hhdCBJJ20gY3VycmVudGx5IHRyeWluZyBpcyAoZXJyb3IgaGFuZGxp
bmcgcmVtb3ZlZCBmb3IgYnJldml0eSk6DQo+Pj4NCj4+PiDCoMKgwqAgc3RydWN0IGkyY19idXNf
cmVjb3ZlcnlfaW5mbyAqYnJpID0gJmkyYy0+cmVjb3Zlcnk7DQo+Pj4NCj4+PiDCoMKgwqDCoMKg
wqDCoMKgIGkyYy0+cGluY3RybCA9IGRldm1fcGluY3RybF9nZXQoZGV2KTsNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgIGkyYy0+cGluY3RybF9kZWZhdWx0ID0gcGluY3RybF9sb29rdXBfc3RhdGUoaTJj
LT5waW5jdHJsLA0KPj4+DQo+Pj4gUElOQ1RSTF9TVEFURV9ERUZBVUxUKTsNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgIGkyYy0+cGluY3RybF9yZWNvdmVyeSA9IHBpbmN0cmxfbG9va3VwX3N0YXRlKGky
Yy0+cGluY3RybCwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAicmVjb3ZlcnkiKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGJyaS0+
c2RhX2dwaW9kID0gZGV2bV9ncGlvZF9nZXQoZGV2LCAic2RhIiwNCj4+PiBHUElPRF9PVVRfSElH
SF9PUEVOX0RSQUlOKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGJyaS0+c2NsX2dwaW9kID0gZGV2
bV9ncGlvZF9nZXQoZGV2LCAic2NsIiwNCj4+PiBHUElPRF9PVVRfSElHSF9PUEVOX0RSQUlOKTsN
Cj4+Pg0KPj4+IMKgwqDCoCBwaW5jdHJsX3NlbGVjdF9zdGF0ZShpMmMtPnBpbmN0cmwsIGkyYy0+
cGluY3RybF9yZWNvdmVyeSk7DQo+Pj4gwqDCoMKgIHJldHVybiBwaW5jdHJsX3NlbGVjdF9zdGF0
ZShpMmMtPnBpbmN0cmwsIGkyYy0+cGluY3RybF9kZWZhdWx0KTsNCj4+Pg0KPj4+IHdoaWNoIHNl
ZW1zIGdvb2QgZW5vdWdoIHRvIGdldCB0aGUgcGlucyBiYWNrIGludG8gaTJjIG1vZGUgYWZ0ZXIg
dGhlDQo+Pj4gZ3Bpb3MgYXJlIG9idGFpbmVkLsKgIFRoZW4gd2Ugc3dpdGNoIHRoZSBwaW5jdHJs
IHN0YXRlIGJldHdlZW4NCj4+PiBwaW5jdHJsX3JlY292ZXJ5IGFuZCBwaW5jdHJsX2RlZmF1bHQg
YXMgd2UgaGF2ZSBuZWVkIHRvLg0KPj4+DQo+Pj4gVGhlIHByb2JsZW0gaXMsIHRoZSBnZW5lcmlj
IGkyYyBidXMgcmVjb3ZlcnkgY29kZSB3YW50cyB0aGUgZ3Bpb2QNCj4+PiBkZXNjcmlwdG9ycyB0
byBiZSBzZXR1cCBhbmQgaW5wbGFjZSBieSB0aGUgdGltZSBpMmNfaW5pdF9yZWNvdmVyeSgpDQo+
Pj4gaXMgY2FsbGVkICh3aGljaCBpcyBjYWxsZWQgd2hlbiB0aGUgYWRhcHRlciBpcyByZWdpc3Rl
cmVkKSBzbw0KPj4+IGhvbGRpbmcgb2ZmIHVudGlsIHdlIG5lZWQgdG8gZG8gcmVjb3ZlcnkgZG9l
c24ndCB3b3JrLg0KPj4+DQo+Pj4gVGhpcyBzZWVtcyB0byB3b3JrIGZvciB0aGlzIFNvQyBJJ20g
Y3VycmVudGx5IHdvcmtpbmcgd2l0aCwgYnV0IEkNCj4+PiB0aGluayB0aGVyZSdzIG1vcmUgb24g
dGhlIGhvcml6b24gLSBJJ20gaGF2aW5nIHRoZSBzYW1lIHByb2JsZW1zDQo+Pj4gb24gYW5vdGhl
ciBTb0Mgd2hpY2ggYWxzbyBuZWVkcyBidXMgcmVjb3ZlcnkgaW1wbGVtZW50ZWQsIGFuZCBhcw0K
Pj4+IHRoZSBwcm9ibGVtIGRldmljZSBpcyBiZWhpbmQgYW4gSTJDIGJ1cyBtdXgsIHdoZW4gaXQg
bG9ja3MgdGhlIEkyQw0KPj4+IGJ1cywgaXQga2lsbHMgYWxsIEkyQyBidXNlcyByb290ZWQgYXQg
dGhhdCBwYXJ0aWN1bGFyIFNvQyBJMkMNCj4+PiBjb250cm9sbGVyLsKgIEhvd2V2ZXIsIHRoZXJl
J3MgYSBwcm9ibGVtIC0gdGhlIHBpbmN0cmxzIGZvciB0aGF0IFNvQw0KPj4+IGFyZSBzZXQgYnkg
Uk9NIGZpcm13YXJlIGF0IGJvb3QgdGltZSBieSByZWFkaW5nIGEgdGFibGUgZnJvbSB0aGUNCj4+
PiBib290IG1lZGlhLsKgICpVbnByaW50YWJsZXMgYWJvdXQgZmlybXdhcmUgYmVpbmcgdG9vIHdh
eSBsaW1pdGluZyouIDpwDQo+Pj4NCj4gID4NCj4+IEhpIGFsbCwgd2hhdCdzIHRoZSBjdXJyZW50
IHN0YXRlIG9mIHRoaXM/IEkgY2FuIGNvbmZpcm0gdGhhdCB0aGlzIGlzDQo+PiBicm9rZW4gd2l0
aCB0aGUgYXQ5MSBpMmMgY29udHJvbGxlcidzIHJlY292ZXJ5IG1vZGVbMV0sIHdoaWNoIGlzDQo+
PiBpbXBsZW1lbnRlZCBleGFjdGx5IHRoZSBzYW1lIGFzIG90aGVyIGkyYyBtYXN0ZXIgcmVjb3Zl
cnkgbW9kZXMsIHNvIEkNCj4+IHN1c3BlY3QgdGhlbSB0byBiZSBicm9rZW4gYXMgd2VsbC4NCj4+
DQo+PiBJJ20gdXNpbmcgNS41LjYgd2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQgKHdoaWNoIGFkZHMg
dGhlIHJlY292ZXJ5KToNCj4+IMKgwqDCoMKgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
Y292ZXIvMTEzMzM4ODMvDQo+Pg0KPj4gSXQgd29ya2VkIGZpbmUgd2l0aCA1LjIsIGJ1dCBoYXMg
bm93IGJyb2tlbiwgdGhlIHdheSBSdXNzZWxsIGRlc2NyaWJlcywNCj4+IGluIDUuNS42IGFuZCBh
bHNvIG9uIHRoZSBsYXRlc3QgNS42LXJjMy4gUnVzc2VsbCdzIHN1Z2dlc3RlZCB3b3JrYXJvdW5k
DQo+PiBvZiBzZXR0aW5nIHRoZSBwaW5jdHJsIHRvIHJlY292ZXJ5IChncGlvKSBhbmQgdGhlbiBi
YWNrIHRvIGRlZmF1bHQgZG9lcw0KPj4gbWFrZSBpdCB3b3JrLg0KPj4NCj4+IEFsYW4uDQo+Pg0K
Pj4gWzFdIGN1cnJlbnRseSB0aGUgcGF0Y2ggZm9yIGkyYyByZWNvdmVyeSBmb3IgYXQ5MSBpcyBh
Y2NlcHRlZCB0byBXb2xmcmFtDQo+PiBTYW5nJ3MgZm9yLW5leHQgdHJlZS4NCj4+DQo+IA0KPiBJ
cyB0aGVyZSBhbnkgd29yZCBvbiB0aGlzPw0KPiANCg0KSW50ZXJuYWxseSB3ZSBoYXZlIG1hbmFn
ZWQgaXQgaW4gdGhlIHNhbWUgd2F5IGFzIHRoZSBvbmUgc3VnZ2VzdGVkIGJ5IA0KUnVzc2VsbC4N
Cg0KV2Ugd29uZGVyZWQgaWYgd2Ugc2hvdWxkIG1haW5saW5lIGl0IG9yIG5vdCBhcyBpdCdzIHJl
YWxseSB0cmlja3kgdG8gDQpwcm9jZWVkIGxpa2UgdGhpcy4NCg0KSW4gdGhlIGZ1dHVyZSwgd2Ug
bWF5IGRlY2xhcmUgb3VyIHBpbmN0cmwgYXMgc3RyaWN0IHdoaWNoIHNob3VsZCBjYXVzZSANCmFu
b3RoZXIgYnJlYWthZ2UuLi4gSXQncyBub3QgZG9uZSB5ZXQgYmVjYXVzZSB3aGVuIEkgdHJpZWQg
dG8gZG8gaXQsIA0KbWF5YmUgaXQgaGFzIGNoYW5nZWQgbm93LCBJIHdhcyBub3QgYWJsZSB0byBh
cHBseSB0aGUgcGluIGNvbmZpZ3VyYXRpb24gDQp0byB0aGUgcGluIG11eGVkIGFzIGEgZ3Bpby4N
Cg0KUmVnYXJkcw0KDQpMdWRvdmljDQoNCj4gQWxhbi4NCg0K

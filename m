Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCC7ECB55
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 23:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKAW0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 18:26:11 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:20932 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAW0L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 18:26:11 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: vTk8Xw/Jz0giKfyq11MxmgdHKVtgrzmmS9WtKt4n0u6JD8ieR5/2zzuIdZRl4fXCXnLhRjPQjQ
 nnrZgVrI6kGncKvGD6kfUteDHokMgD3Q4yGU5i/Zc/SyXN28UU7n/Taq7sRB6SBG0eTNqOBgle
 ECkK6OQKptzQwhZ1A45kj2Cx54qKsf18CAhsCi6Wgb7474U/HcHBdBCQg/ue+pkHpSyCz9wqqR
 oiKVAV9VnqSZ4aC7lza7kx3xvagjNG8eeHHM6mHNayXVQUK1uEd7tyfpPGCfi8gwfrNdQFs2Eu
 Z/E=
X-IronPort-AV: E=Sophos;i="5.68,257,1569308400"; 
   d="scan'208";a="55383965"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2019 15:26:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 1 Nov 2019 15:26:09 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 1 Nov 2019 15:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETuSKV3eExHhosRqvtQbfELNCbacmO/TfExpjstCtV/+q/S2gVk+sIISj9SVnrwz9huwtHbEZ0bND5r681BOT/S9pTsboCXFdYfgMwNLG0Z2oq5xGTWnq6Yc6E7XeaqQ5Df8BJ49brweYE+pofty/cMTme/+R6eORtB4sAhLtFfURH0r9nzWeF6LavGqP41YQYsDqfqQtWizsoAg/fRmlPv99KBgZHj50XdHiKBYyrEnJJz94vGujPyEHBDQg+pymbFJu0X32K+vVAe2v6IGQChcmH+SM5itMWrm259nI5qP933rBMxGVIkRZ2h+6gIdthHrklTRDEuNMRRKgJ+Q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWSwu6l/A38ttzOxR6zL+0Q2TPRNkyixy5A9GPh/0NQ=;
 b=crXAdE93DAPJJGlJ/lkAhLUF/VUJK26JlKxxOG3mIQwhpHs4en2Bf1VS4KBAZKwjYkZkmq5e7cUORVSkIZhaZ6tcQ5OlHpWwitNNSC3vcLOubivZEcy6RVZSM3q22arM31MjhY04/J6/d6/rDYgkIuvZo8Oeo+BkhXeGvKZfFbHRgZVmq2b00cFA5jD1GPjZ+D1gIiuy+T96R5WABBXGhrA3MzwK3CsHx14ZHY4/ocEa85qKTgo5IqEcfVEL44atYKF9mJUq1W8F65PUvPcyBKCVgAMqgbVve9wOwlYA8P0egXIOrHn4yDAeUGnj06ok0q7HOJfE9QGJsSOLAanDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWSwu6l/A38ttzOxR6zL+0Q2TPRNkyixy5A9GPh/0NQ=;
 b=oHuEBqESFm3cOpN9YcKBULsEung1q2hkeP/qY6D8riht6XDGpEA/eYB39sFdcKnJHEeqp1O24093VDD1vZDH9rcjFu0rxeyP9OayhZ0M3Lu3X9U6h+vWfJ/tG39cMcXRArH5XIbpJIy2OUJAqsgbpc9x3jZh051vQDkKwovMMUA=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.85) by
 DM6PR11MB4186.namprd11.prod.outlook.com (20.176.127.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 22:26:07 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22%6]) with mapi id 15.20.2408.018; Fri, 1 Nov 2019
 22:26:07 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <Ludovic.Desroches@microchip.com>,
        <Codrin.Ciubotariu@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linus.walleij@linaro.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
Subject: Re: [PATCH v2] pinctrl: at91: Enable slewrate by default on SAM9X60
Thread-Topic: [PATCH v2] pinctrl: at91: Enable slewrate by default on SAM9X60
Thread-Index: AQHVkQNaIVwwnhsvuE+7AE46+3c0oQ==
Date:   Fri, 1 Nov 2019 22:26:07 +0000
Message-ID: <4255d320-e6c2-8865-7167-ddf9e1951250@microchip.com>
References: <20191101092031.24896-1-codrin.ciubotariu@microchip.com>
 <20191101142602.voj2jeexvvgwgr23@M43218.corp.atmel.com>
In-Reply-To: <20191101142602.voj2jeexvvgwgr23@M43218.corp.atmel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::22) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:59::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191102002600222
x-originating-ip: [65.39.94.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4449cc85-e3ea-427d-804c-08d75f1a7d29
x-ms-traffictypediagnostic: DM6PR11MB4186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4186711CCBA4FE109284905F87620@DM6PR11MB4186.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(6246003)(2616005)(64756008)(66556008)(66476007)(66446008)(446003)(11346002)(476003)(486006)(4326008)(14454004)(6486002)(31696002)(110136005)(86362001)(186003)(316002)(229853002)(66946007)(53546011)(36756003)(3846002)(6506007)(102836004)(6116002)(26005)(54906003)(76176011)(386003)(52116002)(5660300002)(31686004)(256004)(6636002)(66066001)(14444005)(81156014)(71190400001)(71200400001)(25786009)(99286004)(478600001)(7736002)(305945005)(6436002)(6512007)(8936002)(81166006)(2906002)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB4186;H:DM6PR11MB3225.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SEQVpM5+QBYNIOscFMiJX0o/DO/wBLGl0LnegaZ6jRWseYaKfUCLOW2sfuK3GG051JQUKnRF59KapeLjDVxW7VaspC7r0Qbs8Ff7ZBbUlqnzAaOASDxOCul5YQwZ3tlPT9qur3aDxqokFURA3yRp48uMeUQVryu6o3IEq/D6KCDFLXniTNo+S6PwDVhEF0z4ZBDkwHu+TfWdX1A2wEQoAGvEn8NoaG33RGzmwYPUnEVeKVLqqWK2SCPxrCsLwLjwYzZxa53gGYHe4AB1ULBcKnLvNxyF+MCiZGYyh23ZOD1Zw5Gze1BSwIYHFNnVCC2eo+t56G3c39u5MLoBmYhYrxhyD2SACQWfEnhrx25dHDyFKU9R2Q2lQnrVMdNuiH+iw1BYTueIsYHZ+uVyIrsZRkYOVc1TTKvOGE5UWO44GnUYP+/Cg4qNugxZbqmUj+sX
Content-Type: text/plain; charset="utf-8"
Content-ID: <582B8FF54CA6194CADDB631A932BB54C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4449cc85-e3ea-427d-804c-08d75f1a7d29
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 22:26:07.5141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ojpnM6EC2Ys632QfqldCFI7SkkRn8VwSK4sW6NxWhaHdsIK4R6aXvVSz40T9sftrE/xd/TxHtl3BbiDda7AVUcffnzoeRhRsCZUTl8u+88A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4186
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCk9uIDAxLjExLjIwMTkgMTY6MjYsIEx1ZG92aWMgRGVzcm9jaGVzIC0gTTQzMjE4IHdyb3Rl
Og0KPiBPbiBGcmksIE5vdiAwMSwgMjAxOSBhdCAxMToyMDozMUFNICswMjAwLCBDb2RyaW4gQ2l1
Ym90YXJpdSB3cm90ZToNCj4+IE9uIFNBTTlYNjAsIHNsZXdyYXRlIHNob3VsZCBiZSBlbmFibGVk
IG9uIHBpbnMgd2l0aCBhIHN3aXRjaGluZyBmcmVxdWVuY3kNCj4+IGJlbG93IDUwTWh6LiBTaW5j
ZSBtb3N0IG9mIG91ciBwaW5zIGRvIG5vdCBleGNlZWQgdGhpcyB2YWx1ZSwgd2UgZW5hYmxlDQo+
PiBzbGV3cmF0ZSBieSBkZWZhdWx0LiBQaW5zIHdpdGggYSBzd2l0Y2hpbmcgdmFsdWUgdGhhdCBl
eGNlZWRzIDUwTWh6IHdpbGwNCj4+IGhhdmUgdG8gZXhwbGljaXRseSBkaXNhYmxlIHNsZXdyYXRl
Lg0KPj4NCj4+IFRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUgQUJJLiBIb3dldmVyLCB0aGUgc2xld3Jh
dGUgbWFjcm9zIGFyZSBvbmx5IHVzZWQNCj4+IGJ5IFNBTTlYNjAgYW5kLCBhdCB0aGlzIG1vbWVu
dCwgdGhlcmUgYXJlIG5vIGRldmljZS10cmVlIGZpbGVzIGF2YWlsYWJsZQ0KPj4gZm9yIHRoaXMg
cGxhdGZvcm0uDQo+Pg0KPj4gU3VnZ2VzdGVkLWJ5OiBMdWRvdmljIERlc3JvY2hlcyA8bHVkb3Zp
Yy5kZXNyb2NoZXNAbWljcm9jaGlwLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IENvZHJpbiBDaXVi
b3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KPiBBY2tlZC1ieTogTHVk
b3ZpYyBEZXNyb2NoZXMgPGx1ZG92aWMuZGVzcm9jaGVzQG1pY3JvY2hpcC5jb20+DQoNClJldmll
d2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCg0K
PiANCj4gVGhhbmtzDQo+IA0KPj4gLS0tDQo+Pg0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+ICAtIHVw
ZGF0ZWQgY29tbWl0IG1lc3NhZ2UgdG8gcmVmbGVjdCB0aGUgQUJJIGNoYW5nZQ0KPj4NCj4+ICBk
cml2ZXJzL3BpbmN0cmwvcGluY3RybC1hdDkxLmMgICAgIHwgNCArKy0tDQo+PiAgaW5jbHVkZS9k
dC1iaW5kaW5ncy9waW5jdHJsL2F0OTEuaCB8IDQgKystLQ0KPj4gIDIgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BpbmN0cmwvcGluY3RybC1hdDkxLmMgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1hdDkx
LmMNCj4+IGluZGV4IDExNzA3NWI1Nzk4Zi4uYzEzNTE0OWU4NGU5IDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYXQ5MS5jDQo+PiArKysgYi9kcml2ZXJzL3BpbmN0cmwv
cGluY3RybC1hdDkxLmMNCj4+IEBAIC04NSw4ICs4NSw4IEBAIGVudW0gZHJpdmVfc3RyZW5ndGhf
Yml0IHsNCj4+ICAJCQkJCSBEUklWRV9TVFJFTkdUSF9TSElGVCkNCj4+ICANCj4+ICBlbnVtIHNs
ZXdyYXRlX2JpdCB7DQo+PiAtCVNMRVdSQVRFX0JJVF9ESVMsDQo+PiAgCVNMRVdSQVRFX0JJVF9F
TkEsDQo+PiArCVNMRVdSQVRFX0JJVF9ESVMsDQo+PiAgfTsNCj4+ICANCj4+ICAjZGVmaW5lIFNM
RVdSQVRFX0JJVF9NU0sobmFtZSkJCShTTEVXUkFURV9CSVRfIyNuYW1lIDw8IFNMRVdSQVRFX1NI
SUZUKQ0KPj4gQEAgLTY2OSw3ICs2NjksNyBAQCBzdGF0aWMgdm9pZCBhdDkxX211eF9zYW05eDYw
X3NldF9zbGV3cmF0ZSh2b2lkIF9faW9tZW0gKnBpbywgdW5zaWduZWQgcGluLA0KPj4gIHsNCj4+
ICAJdW5zaWduZWQgaW50IHRtcDsNCj4+ICANCj4+IC0JaWYgKHNldHRpbmcgPCBTTEVXUkFURV9C
SVRfRElTIHx8IHNldHRpbmcgPiBTTEVXUkFURV9CSVRfRU5BKQ0KPj4gKwlpZiAoc2V0dGluZyA8
IFNMRVdSQVRFX0JJVF9FTkEgfHwgc2V0dGluZyA+IFNMRVdSQVRFX0JJVF9ESVMpDQo+PiAgCQly
ZXR1cm47DQo+PiAgDQo+PiAgCXRtcCA9IHJlYWRsX3JlbGF4ZWQocGlvICsgU0FNOVg2MF9QSU9f
U0xFV1IpOw0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9hdDkx
LmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvYXQ5MS5oDQo+PiBpbmRleCAzODMxZjkx
ZmIzYmEuLmU4ZTExNzMwNmIxYiAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3Mv
cGluY3RybC9hdDkxLmgNCj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9hdDkx
LmgNCj4+IEBAIC0yNyw4ICsyNyw4IEBADQo+PiAgI2RlZmluZSBBVDkxX1BJTkNUUkxfRFJJVkVf
U1RSRU5HVEhfTUVECQkJKDB4MiA8PCA1KQ0KPj4gICNkZWZpbmUgQVQ5MV9QSU5DVFJMX0RSSVZF
X1NUUkVOR1RIX0hJCQkJKDB4MyA8PCA1KQ0KPj4gIA0KPj4gLSNkZWZpbmUgQVQ5MV9QSU5DVFJM
X1NMRVdSQVRFX0RJUwkoMHgwIDw8IDkpDQo+PiAtI2RlZmluZSBBVDkxX1BJTkNUUkxfU0xFV1JB
VEVfRU5BCSgweDEgPDwgOSkNCj4+ICsjZGVmaW5lIEFUOTFfUElOQ1RSTF9TTEVXUkFURV9FTkEJ
KDB4MCA8PCA5KQ0KPj4gKyNkZWZpbmUgQVQ5MV9QSU5DVFJMX1NMRVdSQVRFX0RJUwkoMHgxIDw8
IDkpDQo+PiAgDQo+PiAgI2RlZmluZSBBVDkxX1BJT0EJMA0KPj4gICNkZWZpbmUgQVQ5MV9QSU9C
CTENCj4+IC0tIA0KPj4gMi4yMC4xDQo+Pg0KPiANCg==

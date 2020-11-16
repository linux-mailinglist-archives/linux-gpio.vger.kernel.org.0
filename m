Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A16A2B4B8B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 17:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731938AbgKPQos (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 11:44:48 -0500
Received: from mail-eopbgr670086.outbound.protection.outlook.com ([40.107.67.86]:12560
        "EHLO CAN01-TO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729645AbgKPQor (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 11:44:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx1eXerlA4KfN2nNGJeCVfUfmeepmTNVWyoA1eW1mg8GuyZpjW2t0M7325vryBdulKOGJ8hRDkaS5vn+eoc3TSdqGMSbk5BvwPf79UK7LOJcwCUtQOIM7/ScVUKp9Ee7A+2Z+m5I6AaKgYA1PsQ1cWwnl8R1d3PbLJaqj2GBvP900bJ8+J/se7KAGGwKtXyv516AQME0tivKZ/KfM43TMc6wWtIR55f5drXPXT7Mf2Gww/YQwk96WBW6RczGlHt2/TGl6lgc+JhhdH7734Uie7BFmFw+lwFPLRiSRPNY3VmBXSnVSMahnFFwnxh899/+WY7pttnSNnZZVk3yCLVoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XsBTZl51Kww8qVua1XbUQQEQ9RB77iMklvXCqKGG8g=;
 b=oQZtw5v9ioYJlzaPksBA2AoHL7v00r9+gDaBr/KvTaCoVYvf5nsotm6PQOnva40V+7aOCb+svIq4/y6I1jS3xn2r/CPMISV0yw99b7Ugfm97i/7mnVGMNJiDMwbnszb1P1WO7AwDh/DFqM33zoHzdIbWqJDedh8qyLfpkp/u5BRhng9n+4uc5Xsooq3+Q0C4W6nRpnm4NKArYtV62RZSfLGMUjChNock89952HFFtZJTDtP7+kGjTnueaDgHPSAeNgy86m4OFayzK1TTPHP2aXE8Fj2kzBSF09WI6b7KA3f/R8nZ6QMfJHuhQijDkY3iSlQLCT7UE6j27nsAxQH4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XsBTZl51Kww8qVua1XbUQQEQ9RB77iMklvXCqKGG8g=;
 b=lqnPPVBBHP/XxkZc74zoopf7KZNCg36dDn5CFifb80HdVGHQvXN5nDU/cMEWuuoJRtux3Fpw0BgBxl6uUbaKajY1j7wRuQvN5cE0HUJOu7Mg/F4pwxW0kZZWDGwLwTES3czXQLA8mFLu7zXVVpYue3WwFVeLj4mtpoG03P++84A=
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTBPR01MB3984.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 16:44:43 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::dd1e:eba1:8e76:470b]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::dd1e:eba1:8e76:470b%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 16:44:43 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "sgoud@xilinx.com" <sgoud@xilinx.com>,
        "shubhrajyoti.datta@xilinx.com" <shubhrajyoti.datta@xilinx.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "srinivas.neeli@xilinx.com" <srinivas.neeli@xilinx.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "git@xilinx.com" <git@xilinx.com>
Subject: Re: [LINUX PATCH V3 5/9] gpio: gpio-xilinx: Add interrupt support
Thread-Topic: [LINUX PATCH V3 5/9] gpio: gpio-xilinx: Add interrupt support
Thread-Index: AQHWuRcSNrAXwns7Ck68t7CQbk2jpKnK/WIA
Date:   Mon, 16 Nov 2020 16:44:42 +0000
Message-ID: <e75527d07fd7caabadf24d85cae36deaf0c606c4.camel@calian.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
         <1605201148-4508-6-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-6-git-send-email-srinivas.neeli@xilinx.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-12.el8) 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=calian.com;
x-originating-ip: [204.83.154.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ea6ac6b-bfad-4348-7f82-08d88a4eeb2a
x-ms-traffictypediagnostic: YTBPR01MB3984:
x-microsoft-antispam-prvs: <YTBPR01MB398430A5E77BDD5B71398E6BECE30@YTBPR01MB3984.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tVjgvs78jJ5hGPydIXy+kXJ3jnKAsEuwAb5rJ4c7pwJ4TNRqSPhptk7IlIQNkVTfZLJtfAav2r042ExhdPNPpaQnYNJ7U/zVgl/P0ZKbLooIL3MdwwKW3/InUKf268OY06QRHdBo535YgMtcdZpJLmw/EuLhoJAHBQNdQYRLJjx8aiI/8vEjeemtGZppNkPzflj5mIQgnEGEXtvglcvat7UyFuknxAt0HZQw5h4lmjKDdVzPaMSDR1QwarWtsdjkk/K/jXt1PdRajNUJTHL+6pqSpzfwRxPcNcfSWnhBdX9blqKWGYatvzsn9PhzIacHTodFj+1Y9mi007vGoRKSQwVZZFlTMF6taTDFxXZ2cdy65KvqfN8H36kh+sHVhdrQj8n3VzsI4IFcZkKz+ENgChs7YV0sDzPiNu7X5To67aY3D9z3FbGD0z5TQSyUO53Py0SnJl3vS9bl+9vjqgJjyzSViaWBlns/lWNYINeGros=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(346002)(396003)(136003)(83380400001)(6512007)(66476007)(64756008)(66556008)(66446008)(36756003)(71200400001)(66946007)(316002)(8676002)(4326008)(6486002)(8936002)(15974865002)(76116006)(4001150100001)(30864003)(26005)(2906002)(6506007)(5660300002)(110136005)(54906003)(44832011)(478600001)(86362001)(186003)(7416002)(2616005)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +psZZRlx3AzSJdCvejzzpehhneaRs4wvxFTo3yI1oA/IzrVpyeTk2NjhURkHb8RURcIlPBgYeNB/4tXXz4gAk0C54RJmmSbl2gMTJEebSDn8JvnMDD5ZfwSPNqV5VYxtCT+sSyIvn87nRUSCXiTgPVWzEh+V79jOGqKEZKhQzBitr+/JSlUqf2wn30hBAlht+lqyb+0OrZD/0k5J5swRFXtmZxnDFbWHhwVB3WHr4oHqK8aEYSdlwrIfG4kEdPnoEgLwVa5ozObrvqBArCw+9rinM7INrGb28Rq72w/oK188Q0bP3D7cDibNEb+7jsrY1V1uf3nCDwI5iKuuH0eh/r6zRGVKAOqLMsr3kSsZXGqt349zBONPXgAy7ZFBRFH4S8NxxcfLa3reG3q3GtyLTTkMBtLSA8ckl5BglxQ9m9EXCN9aRoYUdT5WMKz/peZ2pGcFCHt7K3Pn+v1RsG88aID3QZnl9McD+/QVQ6KZtw/9htd1saVwzztRLOHM48AXi8Rc8DDtZ5jEQP92/eFJjNxFiIgyxkczV3feHh8nkwPjFlXN3TsSwd2q75NQ8lrXRb4nF6A39E/gLJcqwVMqxxWZkQnC+5cNUEvxVKFP2uf47BVGhSilsE9HqjVtxMQbTLHEv3DSB9/OUhgep9gw/A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CA31D80D8C587429860D14EDBEEDFCE@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea6ac6b-bfad-4348-7f82-08d88a4eeb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 16:44:42.9638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBkSJ2mhs5xwKG0mB2/T1ZtlkxpDY1djUX+GbfqOogT8vRfO84XfwzDmAXiKUXMQIdVK785ql73LV0pTAXazB0D4VyKeQzxNDpGpdkmeIcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTBPR01MB3984
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIwLTExLTEyIGF0IDIyOjQyICswNTMwLCBTcmluaXZhcyBOZWVsaSB3cm90ZToN
Cj4gQWRkcyBpbnRlcnJ1cHQgc3VwcG9ydCB0byB0aGUgWGlsaW54IEdQSU8gZHJpdmVyIHNvIHRo
YXQgcmlzaW5nIGFuZA0KPiBmYWxsaW5nIGVkZ2UgbGluZSBldmVudHMgY2FuIGJlIHN1cHBvcnRl
ZC4gU2luY2UgaW50ZXJydXB0IHN1cHBvcnQgaXMNCj4gYW4gb3B0aW9uYWwgZmVhdHVyZSBpbiB0
aGUgWGlsaW54IElQLCB0aGUgZHJpdmVyIGNvbnRpbnVlcyB0byBzdXBwb3J0DQo+IGRldmljZXMg
d2hpY2ggaGF2ZSBubyBpbnRlcnJ1cHQgcHJvdmlkZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBS
b2JlcnQgSGFuY29jayA8aGFuY29ja0BzZWRzeXN0ZW1zLmNhPg0KPiBTaWduZWQtb2ZmLWJ5OiBT
aHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90aS5kYXR0YUB4aWxpbnguY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTcmluaXZhcyBOZWVsaSA8c3Jpbml2YXMubmVlbGlAeGlsaW54LmNvbT4NCj4g
LS0tDQo+IENobmFnZXMgaW4gVjM6DQo+IC1DcmVhdGVkIHNlcGFyYXRlIHBhdGNoIGZvciBDbG9j
ayBjaGFuZ2VzIGFuZCBydW50aW1lIHJlc3VtZQ0KPiAgYW5kIHN1c3BlbmQuDQo+IC1VcGRhdGVk
IG1pbm9yIHJldmlldyBjb21tZW50cy4NCj4gDQo+IENoYW5nZXMgaW4gVjI6DQo+IC1BZGRlZCBj
aGVjayBmb3IgcmV0dXJuIHZhbHVlIG9mIHBsYXRmb3JtX2dldF9pcnEoKSBBUEkuDQo+IC1VcGRh
dGVkIGNvZGUgdG8gc3VwcG9ydCByaXNpbmcgZWRnZSBhbmQgZmFsbGluZyBlZGdlLg0KPiAtQWRk
ZWQgeGdwaW9feGxhdGUoKSBBUEkgdG8gc3VwcG9ydCBzd2l0Y2guDQo+IC1BZGRlZCBNQUlOVEFJ
TkVSUyBmcmFnbWVudA0KPiAtLS0NCj4gIGRyaXZlcnMvZ3Bpby9LY29uZmlnICAgICAgIHwgICAy
ICsNCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXhpbGlueC5jIHwgMjQyDQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNDAg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwaW8vS2NvbmZpZyBiL2RyaXZlcnMvZ3Bpby9LY29uZmlnDQo+IGluZGV4IDVkNGRlNWNkNjc1
OS4uY2Y0OTU5ODkxZWFiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiAr
KysgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiBAQCAtNjc3LDYgKzY3Nyw4IEBAIGNvbmZpZyBH
UElPX1hHRU5FX1NCDQo+ICANCj4gIGNvbmZpZyBHUElPX1hJTElOWA0KPiAgCXRyaXN0YXRlICJY
aWxpbnggR1BJTyBzdXBwb3J0Ig0KPiArCXNlbGVjdCBHUElPTElCX0lSUUNISVANCj4gKwlkZXBl
bmRzIG9uIE9GX0dQSU8NCg0KVGhpcyBPRl9HUElPIGRlcGVuZGVuY3kgd2FzIHByZXZpb3VzbHkg
cmVtb3ZlZCAtIGlzIHRoaXMgcmVxdWlyZWQ/IEl0DQphcHBlYXJzIHRoZSBjb2RlIGlzIG5vdyBz
ZXR0aW5nIG9mX2dwaW9fbl9jZWxscyBidXQgSSBhbSBub3Qgc3VyZSBpZg0KdGhpcyBpcyBuZWNl
c3Nhcnkgb3IgaGVscGZ1bCBzaW5jZSB0aGUgb3RoZXIgb2ZfZ3BpbyBmdW5jdGlvbnMgYXJlIG5v
dA0KdXNlZC4NCg0KPiAgCWhlbHANCj4gIAkgIFNheSB5ZXMgaGVyZSB0byBzdXBwb3J0IHRoZSBY
aWxpbnggRlBHQSBHUElPIGRldmljZQ0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
Z3Bpby14aWxpbnguYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXhpbGlueC5jDQo+IGluZGV4IDY5YmRm
MTkxMDIxNS4uODU1NTUwYTA2ZGVkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby14
aWxpbnguYw0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby14aWxpbnguYw0KPiBAQCAtMTAsOSAr
MTAsMTIgQEANCj4gICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L2dwaW8vZHJpdmVyLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiArI2luY2x1ZGUg
PGxpbnV4L2ludGVycnVwdC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ICsjaW5jbHVk
ZSA8bGludXgvaXJxLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAjaW5jbHVk
ZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5o
Pg0KPiAgDQo+IEBAIC0yMiw2ICsyNSwxMSBAQA0KPiAgDQo+ICAjZGVmaW5lIFhHUElPX0NIQU5O
RUxfT0ZGU0VUCTB4OA0KPiAgDQo+ICsjZGVmaW5lIFhHUElPX0dJRVJfT0ZGU0VUCTB4MTFjIC8q
IEdsb2JhbCBJbnRlcnJ1cHQgRW5hYmxlICovDQo+ICsjZGVmaW5lIFhHUElPX0dJRVJfSUUJCUJJ
VCgzMSkNCj4gKyNkZWZpbmUgWEdQSU9fSVBJU1JfT0ZGU0VUCTB4MTIwIC8qIElQIEludGVycnVw
dCBTdGF0dXMgKi8NCj4gKyNkZWZpbmUgWEdQSU9fSVBJRVJfT0ZGU0VUCTB4MTI4IC8qIElQIElu
dGVycnVwdCBFbmFibGUgKi8NCj4gKw0KPiAgLyogUmVhZC9Xcml0ZSBhY2Nlc3MgdG8gdGhlIEdQ
SU8gcmVnaXN0ZXJzICovDQo+ICAjaWYgZGVmaW5lZChDT05GSUdfQVJDSF9aWU5RKSB8fCBkZWZp
bmVkKENPTkZJR19YODYpDQo+ICAjIGRlZmluZSB4Z3Bpb19yZWFkcmVnKG9mZnNldCkJCXJlYWRs
KG9mZnNldCkNCj4gQEAgLTM2LDkgKzQ0LDE0IEBADQo+ICAgKiBAZ2M6IEdQSU8gY2hpcA0KPiAg
ICogQHJlZ3M6IHJlZ2lzdGVyIGJsb2NrDQo+ICAgKiBAZ3Bpb193aWR0aDogR1BJTyB3aWR0aCBm
b3IgZXZlcnkgY2hhbm5lbA0KPiAtICogQGdwaW9fc3RhdGU6IEdQSU8gc3RhdGUgc2hhZG93IHJl
Z2lzdGVyDQo+ICsgKiBAZ3Bpb19zdGF0ZTogR1BJTyB3cml0ZSBzdGF0ZSBzaGFkb3cgcmVnaXN0
ZXINCj4gKyAqIEBncGlvX2xhc3RfaXJxX3JlYWQ6IEdQSU8gcmVhZCBzdGF0ZSByZWdpc3RlciBm
cm9tIGxhc3QgaW50ZXJydXB0DQo+ICAgKiBAZ3Bpb19kaXI6IEdQSU8gZGlyZWN0aW9uIHNoYWRv
dyByZWdpc3Rlcg0KPiAgICogQGdwaW9fbG9jazogTG9jayB1c2VkIGZvciBzeW5jaHJvbml6YXRp
b24NCj4gKyAqIEBpcnE6IElSUSB1c2VkIGJ5IEdQSU8gZGV2aWNlDQo+ICsgKiBAaXJxX2VuYWJs
ZTogR1BJTyBJUlEgZW5hYmxlL2Rpc2FibGUgYml0ZmllbGQNCj4gKyAqIEBpcnFfcmlzaW5nX2Vk
Z2U6IEdQSU8gSVJRIHJpc2luZyBlZGdlIGVuYWJsZS9kaXNhYmxlIGJpdGZpZWxkDQo+ICsgKiBA
aXJxX2ZhbGxpbmdfZWRnZTogR1BJTyBJUlEgZmFsbGluZyBlZGdlIGVuYWJsZS9kaXNhYmxlIGJp
dGZpZWxkDQo+ICAgKiBAY2xrOiBjbG9jayByZXNvdXJjZSBmb3IgdGhpcyBkcml2ZXINCj4gICAq
Lw0KPiAgc3RydWN0IHhncGlvX2luc3RhbmNlIHsNCj4gQEAgLTQ2LDggKzU5LDEzIEBAIHN0cnVj
dCB4Z3Bpb19pbnN0YW5jZSB7DQo+ICAJdm9pZCBfX2lvbWVtICpyZWdzOw0KPiAgCXVuc2lnbmVk
IGludCBncGlvX3dpZHRoWzJdOw0KPiAgCXUzMiBncGlvX3N0YXRlWzJdOw0KPiArCXUzMiBncGlv
X2xhc3RfaXJxX3JlYWRbMl07DQo+ICAJdTMyIGdwaW9fZGlyWzJdOw0KPiAgCXNwaW5sb2NrX3Qg
Z3Bpb19sb2NrOwkvKiBGb3Igc2VyaWFsaXppbmcgb3BlcmF0aW9ucyAqLw0KPiArCWludCBpcnE7
DQo+ICsJdTMyIGlycV9lbmFibGVbMl07DQo+ICsJdTMyIGlycV9yaXNpbmdfZWRnZVsyXTsNCj4g
Kwl1MzIgaXJxX2ZhbGxpbmdfZWRnZVsyXTsNCj4gIAlzdHJ1Y3QgY2xrICpjbGs7DQo+ICB9Ow0K
PiAgDQo+IEBAIC0yNTgsNiArMjc2LDE4MyBAQCBzdGF0aWMgdm9pZCB4Z3Bpb19zYXZlX3JlZ3Mo
c3RydWN0DQo+IHhncGlvX2luc3RhbmNlICpjaGlwKQ0KPiAgfQ0KPiAgDQo+ICAvKioNCj4gKyAq
IHhncGlvX2lycV9hY2sgLSBBY2tub3dsZWRnZSBhIGNoaWxkIEdQSU8gaW50ZXJydXB0Lg0KPiAr
ICogQGlycV9kYXRhOiBwZXIgSVJRIGFuZCBjaGlwIGRhdGEgcGFzc2VkIGRvd24gdG8gY2hpcCBm
dW5jdGlvbnMNCj4gKyAqIFRoaXMgY3VycmVudGx5IGRvZXMgbm90aGluZywgYnV0IGlycV9hY2sg
aXMgdW5jb25kaXRpb25hbGx5DQo+IGNhbGxlZCBieQ0KPiArICogaGFuZGxlX2VkZ2VfaXJxIGFu
ZCB0aGVyZWZvcmUgbXVzdCBiZSBkZWZpbmVkLg0KPiArICovDQo+ICtzdGF0aWMgdm9pZCB4Z3Bp
b19pcnFfYWNrKHN0cnVjdCBpcnFfZGF0YSAqaXJxX2RhdGEpDQo+ICt7DQo+ICt9DQo+ICsNCj4g
Ky8qKg0KPiArICogeGdwaW9faXJxX21hc2sgLSBXcml0ZSB0aGUgc3BlY2lmaWVkIHNpZ25hbCBv
ZiB0aGUgR1BJTyBkZXZpY2UuDQo+ICsgKiBAaXJxX2RhdGE6IHBlciBJUlEgYW5kIGNoaXAgZGF0
YSBwYXNzZWQgZG93biB0byBjaGlwIGZ1bmN0aW9ucw0KPiArICovDQo+ICtzdGF0aWMgdm9pZCB4
Z3Bpb19pcnFfbWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmlycV9kYXRhKQ0KPiArew0KPiArCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7DQo+ICsJc3RydWN0IHhncGlvX2luc3RhbmNlICpjaGlwID0NCj4gaXJx
X2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoaXJxX2RhdGEpOw0KPiArCWludCBpcnFfb2Zmc2V0ID0g
aXJxZF90b19od2lycShpcnFfZGF0YSk7DQo+ICsJaW50IGluZGV4ID0geGdwaW9faW5kZXgoY2hp
cCwgaXJxX29mZnNldCk7DQo+ICsJaW50IG9mZnNldCA9IHhncGlvX29mZnNldChjaGlwLCBpcnFf
b2Zmc2V0KTsNCj4gKw0KPiArCXNwaW5fbG9ja19pcnFzYXZlKCZjaGlwLT5ncGlvX2xvY2ssIGZs
YWdzKTsNCj4gKw0KPiArCWNoaXAtPmlycV9lbmFibGVbaW5kZXhdICY9IH5CSVQob2Zmc2V0KTsN
Cj4gKw0KPiArCWlmICghY2hpcC0+aXJxX2VuYWJsZVtpbmRleF0pIHsNCj4gKwkJLyogRGlzYWJs
ZSBwZXIgY2hhbm5lbCBpbnRlcnJ1cHQgKi8NCj4gKwkJdTMyIHRlbXAgPSB4Z3Bpb19yZWFkcmVn
KGNoaXAtPnJlZ3MgKw0KPiBYR1BJT19JUElFUl9PRkZTRVQpOw0KPiArDQo+ICsJCXRlbXAgJj0g
fkJJVChpbmRleCk7DQo+ICsJCXhncGlvX3dyaXRlcmVnKGNoaXAtPnJlZ3MgKyBYR1BJT19JUElF
Ul9PRkZTRVQsIHRlbXApOw0KPiArCX0NCj4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjaGlw
LT5ncGlvX2xvY2ssIGZsYWdzKTsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiB4Z3Bpb19pcnFf
dW5tYXNrIC0gV3JpdGUgdGhlIHNwZWNpZmllZCBzaWduYWwgb2YgdGhlIEdQSU8gZGV2aWNlLg0K
PiArICogQGlycV9kYXRhOiBwZXIgSVJRIGFuZCBjaGlwIGRhdGEgcGFzc2VkIGRvd24gdG8gY2hp
cCBmdW5jdGlvbnMNCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgeGdwaW9faXJxX3VubWFzayhzdHJ1
Y3QgaXJxX2RhdGEgKmlycV9kYXRhKQ0KPiArew0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+
ICsJc3RydWN0IHhncGlvX2luc3RhbmNlICpjaGlwID0NCj4gaXJxX2RhdGFfZ2V0X2lycV9jaGlw
X2RhdGEoaXJxX2RhdGEpOw0KPiArCWludCBpcnFfb2Zmc2V0ID0gaXJxZF90b19od2lycShpcnFf
ZGF0YSk7DQo+ICsJaW50IGluZGV4ID0geGdwaW9faW5kZXgoY2hpcCwgaXJxX29mZnNldCk7DQo+
ICsJaW50IG9mZnNldCA9IHhncGlvX29mZnNldChjaGlwLCBpcnFfb2Zmc2V0KTsNCj4gKwl1MzIg
b2xkX2VuYWJsZSA9IGNoaXAtPmlycV9lbmFibGVbaW5kZXhdOw0KPiArDQo+ICsJc3Bpbl9sb2Nr
X2lycXNhdmUoJmNoaXAtPmdwaW9fbG9jaywgZmxhZ3MpOw0KPiArDQo+ICsJY2hpcC0+aXJxX2Vu
YWJsZVtpbmRleF0gfD0gQklUKG9mZnNldCk7DQo+ICsNCj4gKwlpZiAoIW9sZF9lbmFibGUpIHsN
Cj4gKwkJLyogQ2xlYXIgYW55IGV4aXN0aW5nIHBlci1jaGFubmVsIGludGVycnVwdHMgKi8NCj4g
KwkJdTMyIHZhbCA9IHhncGlvX3JlYWRyZWcoY2hpcC0+cmVncyArDQo+IFhHUElPX0lQSVNSX09G
RlNFVCkgJg0KPiArCQkJQklUKGluZGV4KTsNCj4gKw0KPiArCQlpZiAodmFsKQ0KPiArCQkJeGdw
aW9fd3JpdGVyZWcoY2hpcC0+cmVncyArIFhHUElPX0lQSVNSX09GRlNFVCwNCj4gdmFsKTsNCj4g
Kw0KPiArCQkvKiBVcGRhdGUgR1BJTyBJUlEgcmVhZCBkYXRhIGJlZm9yZSBlbmFibGluZw0KPiBp
bnRlcnJ1cHQqLw0KPiArCQl2YWwgPSB4Z3Bpb19yZWFkcmVnKGNoaXAtPnJlZ3MgKyBYR1BJT19E
QVRBX09GRlNFVCArDQo+ICsJCQkJICAgIGluZGV4ICogWEdQSU9fQ0hBTk5FTF9PRkZTRVQpOw0K
PiArCQljaGlwLT5ncGlvX2xhc3RfaXJxX3JlYWRbaW5kZXhdID0gdmFsOw0KPiArDQo+ICsJCS8q
IEVuYWJsZSBwZXIgY2hhbm5lbCBpbnRlcnJ1cHQgKi8NCj4gKwkJdmFsID0geGdwaW9fcmVhZHJl
ZyhjaGlwLT5yZWdzICsgWEdQSU9fSVBJRVJfT0ZGU0VUKTsNCj4gKwkJdmFsIHw9IEJJVChpbmRl
eCk7DQo+ICsJCXhncGlvX3dyaXRlcmVnKGNoaXAtPnJlZ3MgKyBYR1BJT19JUElFUl9PRkZTRVQs
IHZhbCk7DQo+ICsJfQ0KPiArDQo+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY2hpcC0+Z3Bp
b19sb2NrLCBmbGFncyk7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogeGdwaW9fc2V0X2lycV90
eXBlIC0gV3JpdGUgdGhlIHNwZWNpZmllZCBzaWduYWwgb2YgdGhlIEdQSU8NCj4gZGV2aWNlLg0K
PiArICogQGlycV9kYXRhOiBQZXIgSVJRIGFuZCBjaGlwIGRhdGEgcGFzc2VkIGRvd24gdG8gY2hp
cCBmdW5jdGlvbnMNCj4gKyAqIEB0eXBlOiBJbnRlcnJ1cHQgdHlwZSB0aGF0IGlzIHRvIGJlIHNl
dCBmb3IgdGhlIGdwaW8gcGluDQo+ICsgKg0KPiArICogUmV0dXJuOg0KPiArICogMCBpZiBpbnRl
cnJ1cHQgdHlwZSBpcyBzdXBwb3J0ZWQgb3RoZXJ3aXNlIC1FSU5WQUwNCj4gKyAqLw0KPiArc3Rh
dGljIGludCB4Z3Bpb19zZXRfaXJxX3R5cGUoc3RydWN0IGlycV9kYXRhICppcnFfZGF0YSwgdW5z
aWduZWQNCj4gaW50IHR5cGUpDQo+ICt7DQo+ICsJc3RydWN0IHhncGlvX2luc3RhbmNlICpjaGlw
ID0NCj4gaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoaXJxX2RhdGEpOw0KPiArCWludCBpcnFf
b2Zmc2V0ID0gaXJxZF90b19od2lycShpcnFfZGF0YSk7DQo+ICsJaW50IGluZGV4ID0geGdwaW9f
aW5kZXgoY2hpcCwgaXJxX29mZnNldCk7DQo+ICsJaW50IG9mZnNldCA9IHhncGlvX29mZnNldChj
aGlwLCBpcnFfb2Zmc2V0KTsNCj4gKw0KPiArCS8qDQo+ICsJICogVGhlIFhpbGlueCBHUElPIGhh
cmR3YXJlIHByb3ZpZGVzIGEgc2luZ2xlIGludGVycnVwdCBzdGF0dXMNCj4gKwkgKiBpbmRpY2F0
aW9uIGZvciBhbnkgc3RhdGUgY2hhbmdlIGluIGEgZ2l2ZW4gR1BJTyBjaGFubmVsDQo+IChiYW5r
KS4NCj4gKwkgKiBUaGVyZWZvcmUsIG9ubHkgcmlzaW5nIGVkZ2Ugb3IgZmFsbGluZyBlZGdlIHRy
aWdnZXJzIGFyZQ0KPiArCSAqIHN1cHBvcnRlZC4NCj4gKwkgKi8NCj4gKwlzd2l0Y2ggKHR5cGUg
JiBJUlFfVFlQRV9TRU5TRV9NQVNLKSB7DQo+ICsJY2FzZSBJUlFfVFlQRV9FREdFX0JPVEg6DQo+
ICsJCWNoaXAtPmlycV9yaXNpbmdfZWRnZVtpbmRleF0gfD0gQklUKG9mZnNldCk7DQo+ICsJCWNo
aXAtPmlycV9mYWxsaW5nX2VkZ2VbaW5kZXhdIHw9IEJJVChvZmZzZXQpOw0KPiArCQlicmVhazsN
Cj4gKwljYXNlIElSUV9UWVBFX0VER0VfUklTSU5HOg0KPiArCQljaGlwLT5pcnFfcmlzaW5nX2Vk
Z2VbaW5kZXhdIHw9IEJJVChvZmZzZXQpOw0KPiArCQljaGlwLT5pcnFfZmFsbGluZ19lZGdlW2lu
ZGV4XSAmPSB+QklUKG9mZnNldCk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgSVJRX1RZUEVfRURH
RV9GQUxMSU5HOg0KPiArCQljaGlwLT5pcnFfcmlzaW5nX2VkZ2VbaW5kZXhdICY9IH5CSVQob2Zm
c2V0KTsNCj4gKwkJY2hpcC0+aXJxX2ZhbGxpbmdfZWRnZVtpbmRleF0gfD0gQklUKG9mZnNldCk7
DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0N
Cj4gKw0KPiArCWlycV9zZXRfaGFuZGxlcl9sb2NrZWQoaXJxX2RhdGEsIGhhbmRsZV9lZGdlX2ly
cSk7DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgaXJxX2NoaXAg
eGdwaW9faXJxY2hpcCA9IHsNCj4gKwkubmFtZQkJPSAiZ3Bpby14aWxpbngiLA0KPiArCS5pcnFf
YWNrCT0geGdwaW9faXJxX2FjaywNCj4gKwkuaXJxX21hc2sJPSB4Z3Bpb19pcnFfbWFzaywNCj4g
KwkuaXJxX3VubWFzawk9IHhncGlvX2lycV91bm1hc2ssDQo+ICsJLmlycV9zZXRfdHlwZQk9IHhn
cGlvX3NldF9pcnFfdHlwZSwNCj4gK307DQo+ICsNCj4gKy8qKg0KPiArICogeGdwaW9faXJxaGFu
ZGxlciAtIEdwaW8gaW50ZXJydXB0IHNlcnZpY2Ugcm91dGluZQ0KPiArICogQGRlc2M6IFBvaW50
ZXIgdG8gaW50ZXJydXB0IGRlc2NyaXB0aW9uDQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkIHhncGlv
X2lycWhhbmRsZXIoc3RydWN0IGlycV9kZXNjICpkZXNjKQ0KPiArew0KPiArCXN0cnVjdCB4Z3Bp
b19pbnN0YW5jZSAqY2hpcCA9IGlycV9kZXNjX2dldF9oYW5kbGVyX2RhdGEoZGVzYyk7DQo+ICsJ
c3RydWN0IGlycV9jaGlwICppcnFjaGlwID0gaXJxX2Rlc2NfZ2V0X2NoaXAoZGVzYyk7DQo+ICsJ
dTMyIG51bV9jaGFubmVscyA9IGNoaXAtPmdwaW9fd2lkdGhbMV0gPyAyIDogMTsNCj4gKwl1MzIg
b2Zmc2V0ID0gMCwgaW5kZXg7DQo+ICsJdTMyIHN0YXR1cyA9IHhncGlvX3JlYWRyZWcoY2hpcC0+
cmVncyArIFhHUElPX0lQSVNSX09GRlNFVCk7DQo+ICsNCj4gKwl4Z3Bpb193cml0ZXJlZyhjaGlw
LT5yZWdzICsgWEdQSU9fSVBJU1JfT0ZGU0VULCBzdGF0dXMpOw0KPiArDQo+ICsJY2hhaW5lZF9p
cnFfZW50ZXIoaXJxY2hpcCwgZGVzYyk7DQo+ICsJZm9yIChpbmRleCA9IDA7IGluZGV4IDwgbnVt
X2NoYW5uZWxzOyBpbmRleCsrKSB7DQo+ICsJCWlmICgoc3RhdHVzICYgQklUKGluZGV4KSkpIHsN
Cj4gKwkJCXVuc2lnbmVkIGxvbmcgcmlzaW5nX2V2ZW50cywgZmFsbGluZ19ldmVudHMsDQo+IGFs
bF9ldmVudHM7DQo+ICsJCQl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArCQkJdTMyIGRhdGEsIGJp
dDsNCj4gKwkJCXVuc2lnbmVkIGludCBpcnE7DQo+ICsNCj4gKwkJCXNwaW5fbG9ja19pcnFzYXZl
KCZjaGlwLT5ncGlvX2xvY2ssIGZsYWdzKTsNCj4gKwkJCWRhdGEgPSB4Z3Bpb19yZWFkcmVnKGNo
aXAtPnJlZ3MgKw0KPiBYR1BJT19EQVRBX09GRlNFVCArDQo+ICsJCQkJCSAgICAgaW5kZXggKg0K
PiBYR1BJT19DSEFOTkVMX09GRlNFVCk7DQo+ICsJCQlyaXNpbmdfZXZlbnRzID0gZGF0YSAmDQo+
ICsJCQkJCX5jaGlwLQ0KPiA+Z3Bpb19sYXN0X2lycV9yZWFkW2luZGV4XSAmDQo+ICsJCQkJCWNo
aXAtPmlycV9lbmFibGVbaW5kZXhdICYNCj4gKwkJCQkJY2hpcC0+aXJxX3Jpc2luZ19lZGdlW2lu
ZGV4XTsNCj4gKwkJCWZhbGxpbmdfZXZlbnRzID0gfmRhdGEgJg0KPiArCQkJCQkgY2hpcC0NCj4g
PmdwaW9fbGFzdF9pcnFfcmVhZFtpbmRleF0gJg0KPiArCQkJCQkgY2hpcC0+aXJxX2VuYWJsZVtp
bmRleF0gJg0KPiArCQkJCQkgY2hpcC0+aXJxX2ZhbGxpbmdfZWRnZVtpbmRleF07DQo+ICsJCQlk
ZXZfZGJnKGNoaXAtPmdjLnBhcmVudCwNCj4gKwkJCQkiSVJRIGNoYW4gJXUgcmlzaW5nIDB4JWx4
IGZhbGxpbmcNCj4gMHglbHhcbiIsDQo+ICsJCQkJaW5kZXgsIHJpc2luZ19ldmVudHMsIGZhbGxp
bmdfZXZlbnRzKTsNCj4gKwkJCWFsbF9ldmVudHMgPSByaXNpbmdfZXZlbnRzIHwgZmFsbGluZ19l
dmVudHM7DQo+ICsJCQljaGlwLT5ncGlvX2xhc3RfaXJxX3JlYWRbaW5kZXhdID0gZGF0YTsNCj4g
KwkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNoaXAtPmdwaW9fbG9jaywNCj4gZmxhZ3MpOw0K
PiArDQo+ICsJCQlmb3JfZWFjaF9zZXRfYml0KGJpdCwgJmFsbF9ldmVudHMsIDMyKSB7DQo+ICsJ
CQkJaXJxID0gaXJxX2ZpbmRfbWFwcGluZyhjaGlwLQ0KPiA+Z2MuaXJxLmRvbWFpbiwNCj4gKwkJ
CQkJCSAgICAgICBvZmZzZXQgKyBiaXQpOw0KPiArCQkJCWdlbmVyaWNfaGFuZGxlX2lycShpcnEp
Ow0KPiArCQkJfQ0KPiArCQl9DQo+ICsJCW9mZnNldCArPSBjaGlwLT5ncGlvX3dpZHRoW2luZGV4
XTsNCj4gKwl9DQo+ICsNCj4gKwljaGFpbmVkX2lycV9leGl0KGlycWNoaXAsIGRlc2MpOw0KPiAr
fQ0KPiArDQo+ICsvKioNCj4gICAqIHhncGlvX29mX3Byb2JlIC0gUHJvYmUgbWV0aG9kIGZvciB0
aGUgR1BJTyBkZXZpY2UuDQo+ICAgKiBAcGRldjogcG9pbnRlciB0byB0aGUgcGxhdGZvcm0gZGV2
aWNlDQo+ICAgKg0KPiBAQCAtMjcwLDcgKzQ2NSwxMCBAQCBzdGF0aWMgaW50IHhncGlvX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJc3RydWN0IHhncGlvX2luc3Rh
bmNlICpjaGlwOw0KPiAgCWludCBzdGF0dXMgPSAwOw0KPiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gLQl1MzIgaXNfZHVhbDsNCj4gKwl1MzIgaXNfZHVh
bCA9IDA7DQo+ICsJdTMyIGNlbGxzID0gMjsNCj4gKwlzdHJ1Y3QgZ3Bpb19pcnFfY2hpcCAqZ2ly
cTsNCj4gKwl1MzIgdGVtcDsNCj4gIA0KPiAgCWNoaXAgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRl
diwgc2l6ZW9mKCpjaGlwKSwgR0ZQX0tFUk5FTCk7DQo+ICAJaWYgKCFjaGlwKQ0KPiBAQCAtMjg1
LDYgKzQ4MywxMCBAQCBzdGF0aWMgaW50IHhncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UNCj4gKnBkZXYpDQo+ICAJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAieGxueCx0cmkt
ZGVmYXVsdCIsICZjaGlwLQ0KPiA+Z3Bpb19kaXJbMF0pKQ0KPiAgCQljaGlwLT5ncGlvX2Rpclsw
XSA9IDB4RkZGRkZGRkY7DQo+ICANCj4gKwkvKiBVcGRhdGUgY2VsbHMgd2l0aCBncGlvLWNlbGxz
IHZhbHVlICovDQo+ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiI2dwaW8tY2VsbHMi
LCAmY2VsbHMpKQ0KPiArCQlkZXZfZGJnKCZwZGV2LT5kZXYsICJNaXNzaW5nIGdwaW8tY2VsbHMg
cHJvcGVydHlcbiIpOw0KPiArDQo+ICAJLyoNCj4gIAkgKiBDaGVjayBkZXZpY2Ugbm9kZSBhbmQg
cGFyZW50IGRldmljZSBub2RlIGZvciBkZXZpY2Ugd2lkdGgNCj4gIAkgKiBhbmQgYXNzdW1lIGRl
ZmF1bHQgd2lkdGggb2YgMzINCj4gQEAgLTMyMSw2ICs1MjMsNyBAQCBzdGF0aWMgaW50IHhncGlv
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJY2hpcC0+Z2MucGFy
ZW50ID0gJnBkZXYtPmRldjsNCj4gIAljaGlwLT5nYy5kaXJlY3Rpb25faW5wdXQgPSB4Z3Bpb19k
aXJfaW47DQo+ICAJY2hpcC0+Z2MuZGlyZWN0aW9uX291dHB1dCA9IHhncGlvX2Rpcl9vdXQ7DQo+
ICsJY2hpcC0+Z2Mub2ZfZ3Bpb19uX2NlbGxzID0gY2VsbHM7DQo+ICAJY2hpcC0+Z2MuZ2V0ID0g
eGdwaW9fZ2V0Ow0KPiAgCWNoaXAtPmdjLnNldCA9IHhncGlvX3NldDsNCj4gIAljaGlwLT5nYy5z
ZXRfbXVsdGlwbGUgPSB4Z3Bpb19zZXRfbXVsdGlwbGU7DQo+IEBAIC0zNDgsMTQgKzU1MSw0NSBA
QCBzdGF0aWMgaW50IHhncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYp
DQo+ICANCj4gIAl4Z3Bpb19zYXZlX3JlZ3MoY2hpcCk7DQo+ICANCj4gKwljaGlwLT5pcnEgPSBw
bGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKHBkZXYsIDApOw0KPiArCWlmIChjaGlwLT5pcnEgPD0g
MCkNCj4gKwkJZ290byBza2lwX2lycTsNCj4gKw0KPiArCS8qIERpc2FibGUgcGVyLWNoYW5uZWwg
aW50ZXJydXB0cyAqLw0KPiArCXhncGlvX3dyaXRlcmVnKGNoaXAtPnJlZ3MgKyBYR1BJT19JUElF
Ul9PRkZTRVQsIDApOw0KPiArCS8qIENsZWFyIGFueSBleGlzdGluZyBwZXItY2hhbm5lbCBpbnRl
cnJ1cHRzICovDQo+ICsJdGVtcCA9IHhncGlvX3JlYWRyZWcoY2hpcC0+cmVncyArIFhHUElPX0lQ
SVNSX09GRlNFVCk7DQo+ICsJeGdwaW9fd3JpdGVyZWcoY2hpcC0+cmVncyArIFhHUElPX0lQSVNS
X09GRlNFVCwgdGVtcCk7DQo+ICsJLyogRW5hYmxlIGdsb2JhbCBpbnRlcnJ1cHRzICovDQo+ICsJ
eGdwaW9fd3JpdGVyZWcoY2hpcC0+cmVncyArIFhHUElPX0dJRVJfT0ZGU0VULCBYR1BJT19HSUVS
X0lFKTsNCj4gKw0KPiArCWdpcnEgPSAmY2hpcC0+Z2MuaXJxOw0KPiArCWdpcnEtPmNoaXAgPSAm
eGdwaW9faXJxY2hpcDsNCj4gKwlnaXJxLT5wYXJlbnRfaGFuZGxlciA9IHhncGlvX2lycWhhbmRs
ZXI7DQo+ICsJZ2lycS0+bnVtX3BhcmVudHMgPSAxOw0KPiArCWdpcnEtPnBhcmVudHMgPSBkZXZt
X2tjYWxsb2MoJnBkZXYtPmRldiwgMSwNCj4gKwkJCQkgICAgIHNpemVvZigqZ2lycS0+cGFyZW50
cyksDQo+ICsJCQkJICAgICBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWdpcnEtPnBhcmVudHMpIHsN
Cj4gKwkJc3RhdHVzID0gLUVOT01FTTsNCj4gKwkJZ290byBlcnJfdW5wcmVwYXJlX2NsazsNCj4g
Kwl9DQo+ICsJZ2lycS0+cGFyZW50c1swXSA9IGNoaXAtPmlycTsNCj4gKwlnaXJxLT5kZWZhdWx0
X3R5cGUgPSBJUlFfVFlQRV9OT05FOw0KPiArCWdpcnEtPmhhbmRsZXIgPSBoYW5kbGVfYmFkX2ly
cTsNCj4gKw0KPiArc2tpcF9pcnE6DQo+ICAJc3RhdHVzID0gZGV2bV9ncGlvY2hpcF9hZGRfZGF0
YSgmcGRldi0+ZGV2LCAmY2hpcC0+Z2MsIGNoaXApOw0KPiAgCWlmIChzdGF0dXMpIHsNCj4gIAkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGFkZCBHUElPIGNoaXBcbiIpOw0KPiAtCQlj
bGtfZGlzYWJsZV91bnByZXBhcmUoY2hpcC0+Y2xrKTsNCj4gLQkJcmV0dXJuIHN0YXR1czsNCj4g
KwkJZ290byBlcnJfdW5wcmVwYXJlX2NsazsNCj4gIAl9DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4g
Kw0KPiArZXJyX3VucHJlcGFyZV9jbGs6DQo+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNoaXAt
PmNsayk7DQo+ICsJcmV0dXJuIHN0YXR1czsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgeGdwaW9fb2ZfbWF0Y2hbXSA9IHsNCi0tIA0KUm9iZXJ0IEhhbmNv
Y2sNClNlbmlvciBIYXJkd2FyZSBEZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2ll
cw0Kd3d3LmNhbGlhbi5jb20NCg==

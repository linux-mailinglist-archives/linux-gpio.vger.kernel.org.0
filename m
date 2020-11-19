Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B8D2B8B03
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 06:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgKSF3t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 00:29:49 -0500
Received: from mail-bn8nam11on2076.outbound.protection.outlook.com ([40.107.236.76]:31587
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725648AbgKSF3t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 00:29:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyHG1EVzQ4Dk0AhrY6XkYcnulm3DnzmlvyuJEqsqR4kd7pKLD8SNjuEdtgJipwKqqVFBGUWGW9X0BbwQqGPlkJBp14QhfcWTHqOt2HGvrJelUxLWPE3dcI3yOUSDhuHWC2UcqV0QeInLgjgaCTbxpl8WhMYTnOQAIWLqiI2E2a8lHuFAisYh70EFrieYjfNv6uFl+n9+WQHrCCr1ipu1nXrRn+kMOMlY/GZ0WpwwUw3Yl09OFlSOIcv6Xu44fb6ERvn9sK1UYB55ZGqw3aHUNiNlrxj3G+g+E+SnwKzWrBKiuMN7Hx++r2nqTsLMKcRjjrp522gMu+/8GWyyfUwQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEWt11btazbrdAtIxvWQ3eYYJmNnVo7m21Aw6o/ndy8=;
 b=BV/54kEOsVHvp5kljzySSccnwqV/T3TodhM8tCn1gB/Jx8vv3gDt4IZLVrveRMIZMaane0hXArp6WiTNrWp0MkzSkmCtzFXopt+0gPwZBfHERoHb/29IlfiBFDQx26esXEh9JlwTIGWKGcg1Vm2lSAY5YqwpzRr8xEq0YWpJ/lrrI3jbWb1k5b2wwrRvjtKITRP20QK92NVMy5whto8FlZp0EH/vS2Ba4dt70zYVea7NHr6p1mNbmxNxLo9lvF981h2oNZp9O7dfZXiCkoOrVM45vWLZ640zDe5Gd8Qq+CjPIJZMKMWcs+NUcCSSObbyxuCUYC6I84u60hSh0IY4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEWt11btazbrdAtIxvWQ3eYYJmNnVo7m21Aw6o/ndy8=;
 b=hcG/SPHm7Gfy10AUpPIDg7mpxueYYv/t4c0TWlPvpxsoyLY99iDXQxFBbYUbl5V0xKeD5/LgwBoPabm4jDE7rMBcZw8g82//GRsaCEttsMGUkhhYi9wEe3wIvEtktAfdwGL6ehPS1m0pFtKZLog75MapbqZx7mK4JJd7H8RvGY0=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB6412.namprd02.prod.outlook.com (2603:10b6:5:1fc::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Thu, 19 Nov 2020 05:29:42 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::84ca:4b6c:d1e1:20e2]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::84ca:4b6c:d1e1:20e2%5]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 05:29:41 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [LINUX PATCH V3 0/9] gpio-xilinx: Update on xilinx gpio driver
Thread-Topic: [LINUX PATCH V3 0/9] gpio-xilinx: Update on xilinx gpio driver
Thread-Index: AQHWuRcKJmNXsJEsWEOM1FeWqwf4t6nNFRIAgAHiduA=
Date:   Thu, 19 Nov 2020 05:29:41 +0000
Message-ID: <DM6PR02MB538605F1E5BE653B25A62B9EAFE00@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
 <CACRpkdZMAKvCH6WmqV2cQtjrfMo1svBrqwSu=+QuMGwmunE90g@mail.gmail.com>
In-Reply-To: <CACRpkdZMAKvCH6WmqV2cQtjrfMo1svBrqwSu=+QuMGwmunE90g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1b4fea7c-1924-4e60-447c-08d88c4c1de8
x-ms-traffictypediagnostic: DM6PR02MB6412:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB64129A5598BE62072C11DBEEAFE00@DM6PR02MB6412.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hxqQpzuG14WkjSBm3f4gDey0EgBtHaDbbaRQgypwdFM7eUWtAfAfn6CpMnLzr7BqhINrJ5QI9OBVYZ7QZyBPRrD5nDJ1oluPo3X0q+2+WvIkUIEs3pzfZEDLz4p3bS4Y6PXCkV4it8fJ1z9tw3REuHoLQDJRB+Ud4EkFR5BYHev8Mi06R1NgYSsTHj4ai2Iy8dhxOb8NNv2XCuvZFrdfYd2SAMSCNR3J6SU2IgCdINdHsYL6XD8BOAcZia2n1e5geNABXlKr59gFILcRPnJ8/1o30SVpG5vu5qEHlx2qEM2mcuzif0Ljutc7kAd7z8ScKlcu1KV3+e0Ea7pcscB3KQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(15650500001)(478600001)(6916009)(26005)(83380400001)(7696005)(9686003)(4326008)(86362001)(186003)(54906003)(6506007)(53546011)(8676002)(107886003)(8936002)(71200400001)(66446008)(52536014)(316002)(66946007)(2906002)(76116006)(33656002)(55016002)(5660300002)(66476007)(66556008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 5PrHQn9BYYsws/Z6dzGqD+RtSWcIPF3ewweK31wojurwJztNVYtzqtWgs63QasS7cfduHZ1j9Lj2PiswS2Gb8KgK1QJ1aOc3+sDggXxSuhZ2eMyD90Uxa+XkipXKDJP0sX9BAMild30f9QTAgxShA9WREpsB7FG+ft7dq0KROhuSO5Ksi7REfc5ey/bxV2Yyv8L6orm4uh4bdTqFP29X/gj0ldfb50gNf9AuTSLj43SL6R+RDzes7iYhf1+R7cca84yaDdHhOYyr/ZGJmfhYL8zKkEcR8N6SdBa3CJd7jL0LTi3zZtdsFy/PYLyZlNbdYl65vQzh2SWjbfqywqX1rrW8XuSYc8YgEEKD6Wx2oryWYXVmrOD6ShhWtlcJo3K9FFAbzBty9MaveY7oJFDoHtijfpuUWmwdv5fW8NMgXhM4iAM6ikMRbFMFDpi56k3skJcxz2tywEesI69uzXcav7sdzv+8WhKZbqmgUjc/Yhl+mSldaLW3qsgGP23OUQLc/XfhZZhRUFRze7J344TBkGQlx+n6GF5Kvih1gMKNdujtKcPhhii4diQAIWhu4GiPuRj6KUKpCAOeNtOmnuA5jzzlZeZ313wRzS6QGkzFdj61HZpdL7kZECBKqJRPM3eb5l5RFAJSliSOnf9fcTAcRQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4fea7c-1924-4e60-447c-08d88c4c1de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 05:29:41.6931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruh8IooyvGXyb2Vi6s59lH+1b2IxrEei5iUu6p1lVDVsFXas6TKATcL4nQsbGZfyZ/D5mA/AAwsOYlxORvYvbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6412
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE5v
dmVtYmVyIDE4LCAyMDIwIDY6MTIgQU0NCj4gVG86IFNyaW5pdmFzIE5lZWxpIDxzbmVlbGlAeGls
aW54LmNvbT4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJy
ZS5jb20+OyBNaWNoYWwgU2ltZWsNCj4gPG1pY2hhbHNAeGlsaW54LmNvbT47IFNodWJocmFqeW90
aSBEYXR0YSA8c2h1YmhyYWpAeGlsaW54LmNvbT47IFNyaW5pdmFzDQo+IEdvdWQgPHNnb3VkQHhp
bGlueC5jb20+OyBSb2JlcnQgSGFuY29jayA8aGFuY29ja0BzZWRzeXN0ZW1zLmNhPjsNCj4gb3Bl
biBsaXN0OkdQSU8gU1VCU1lTVEVNIDxsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZz47IExpbnV4
IEFSTSA8bGludXgtDQo+IGFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGdpdA0KPiA8Z2l0QHhpbGlueC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbTElOVVggUEFUQ0ggVjMgMC85XSBncGlvLXhpbGlueDogVXBkYXRlIG9uIHhpbGlueCBn
cGlvIGRyaXZlcg0KPiANCj4gT24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgNjoxMyBQTSBTcmluaXZh
cyBOZWVsaSA8c3Jpbml2YXMubmVlbGlAeGlsaW54LmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IFNy
aW5pdmFzIE5lZWxpICg5KToNCj4gDQo+ID4gICBncGlvOiBncGlvLXhpbGlueDogQXJyYW5nZSBo
ZWFkZXJzIGluIHNvcnRpbmcgb3JkZXINCj4gPiAgIGR0LWJpbmRpbmdzOiBncGlvOiBncGlvLXhp
bGlueDogQWRkIGNsayBzdXBwb3J0IHRvIHhpbGlueCBzb2Z0IGdwaW8gSVANCj4gPiAgIGdwaW86
IGdwaW8teGlsaW54OiBBZGQgY2xvY2sgc3VwcG9ydA0KPiA+ICAgZ3BpbzogZ3Bpby14aWxpbng6
IFJlZHVjZSBzcGlubG9jayBhcnJheSB0byBzaW5nbGUNCj4gPiAgIGdwaW86IGdwaW8teGlsaW54
OiBBZGQgaW50ZXJydXB0IHN1cHBvcnQNCj4gPiAgIGdwaW86IGdwaW8teGlsaW54OiBBZGQgcmVt
b3ZlIGZ1bmN0aW9uDQo+ID4gICBncGlvOiBncGlvLXhpbGlueDogQWRkIHN1cHBvcnQgZm9yIHN1
c3BlbmQgYW5kIHJlc3VtZQ0KPiA+ICAgZ3BpbzogZ3Bpby14aWxpbng6IENoZWNrIHJldHVybiB2
YWx1ZSBvZiBvZl9wcm9wZXJ0eV9yZWFkX3UzMg0KPiA+ICAgTUFJTlRBSU5FUlM6IGFkZCBmcmFn
bWVudCBmb3IgeGlsaW54IEdQSU8gZHJpdmVycw0KPiANCj4gU28gSSBhcHBsaWVkIHBhdGNoZXMg
MSwgMiwgMywgNiwgOCwgOSBub3cgc28geW91IGNhbiBmb2N1cyBvbiBkZXZlbG9waW5nIGFuZA0K
PiByZXNlbmRpbmcgdGhlIHJlbWFpbmluZyBwYXRjaGVzLg0KDQpXaWxsIGFkZHJlc3MgcmVtYWlu
aW5nIHBhdGNoZXMgaW4gVjQgc2VyaWVzLg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoN
Cg==

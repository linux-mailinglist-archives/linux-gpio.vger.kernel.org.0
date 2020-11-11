Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079752AE963
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 08:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgKKHLl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 02:11:41 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:26385 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKKHLk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 02:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605078699; x=1636614699;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zXqiU2LERPUKi7BaPtvuEJeLPOM/izTBEwDJZa4OOeE=;
  b=EcxltswnLshv/Y95vmcSFk3U/m0bkp9Y3jdz/zfYKCNe1w8J/ufnohha
   vgKMYXfn/pbfi8KbRWgrWQjjp0T6hEDZfOvymIU2U4j0kXNTGLLH9V3U5
   8CxO+1lG0LpVxmDA2IrnmQ4P2ZlPNS84IuD2grG9nFwWCgJeLcvwV/YKU
   iv2+Je2+AOqYcEvs1EXmtadlvGq6hEeWYWt+Vpj/Ycw0gN/DgMm3ycLlS
   AG7G083MlbQ/NghWBVorMYCvMSt6HSPLDAoqH8ArElgiaDNvjGq1PYpOh
   RO4NRpwmjvO7xG6Yt9ZgIO7U8WJYCXZPk62wD7JoMg9F08WNeUjepQ2rq
   g==;
IronPort-SDR: WopqJOJyLRir9h0s11imWJog0xFbOiG1Yokgwc9Isz2ZXdtzCJbjEF/SVQEN59581t1+tbHllx
 y2VEK5hpXbxg6x0GuBKHCil+m/lfBQFMsRHsCiV5Sg/9Y3d6/rSiTD14HosYe6LQyfddDjVrK6
 tZlcEjF2/9hgadJG0c9GSw/57K1bhEyyUUUybr0LmfFoAtHbBrerOlae0q/YmqE2hBu8QD6Mor
 hia7u4Z3JBTqMfk1pakxZ+Qxkh1zpmRMGzEhngm2cjA84ebXHLHAjzK9ZmWP6Y0OktRN+BqWYW
 NPc=
X-IronPort-AV: E=Sophos;i="5.77,468,1596470400"; 
   d="scan'208";a="152261371"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
  by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 15:11:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isefHOr3BTkfauwDyvd2RDpG4dZyGuNDsMPcRtiPU9jYatydYpQ9JTldZ41lRPSqcJ5e51gxhKEWmK9MPqeND1BVdEUxhTn1vPpDS8Mlcffsh7nVY1+izltKypAwLc+OP/KMn+VgPyxoPGwDTAAlgYMawFF3o4kYUb3saPNQO7Z8Y2rPPdpWeJeA2wBT5f+aKZ7QgShadCZRMD8gZlT/9kji/rjFdY+j+mz38J8En8f1bPpVW3d/Op3EuysxLxbNQVcIXT2cSeZOZF+XcU6+rwzl33uqlIc7EfwmdCLW0PGuB4asFplc3b5+BpoUfBkDo+PwY96tBtttKx4mEWQJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXqiU2LERPUKi7BaPtvuEJeLPOM/izTBEwDJZa4OOeE=;
 b=BbZ+/RmTqlrmuHPun9OflOYt+vs9GnkZpGc3soWa2U1OmoI+1lt9BSSa+GVyY8ajYCRls+peyLSH6ACpxEnRr9F9m/oexmTv1typZy6Yx6nTZWjbFH0yRhoGf82TPQrrTF4Id1/9ZtsJ/1LL3hJ6OD7fvf/SCBgAdDPtDazUdzOHH6AMmYu4P2LFRW0rE0NkjFKIxPY7kIfieJqaOFedMdUyYpJjeQ2c+Lf1JCIBe/nCzUFQ+8o2ASYtHtZysjRMfysb6RGyFiM0Hi9ad0ni9hLc1P5GQFzO9vIfTT/tE5rUx1Dy1NPcjWa8K+NwfDqNLZxCdxeCQBsLfUgT3/0Seg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXqiU2LERPUKi7BaPtvuEJeLPOM/izTBEwDJZa4OOeE=;
 b=F3NNevUZs5Q3cBmjKGCpfdxqhA19Hol2TcYbH/6wAEYR56mLyjaPP52+p2WXbHotcCkvYkO+FBfrNDIUEgIwDfgh0CLXbH4ozVXvdWa1QMS3hH818ieaar7GuBI4sP2hnE8+xyy051sPUZt7H/hbJQSdp3GxH78/ragiI8j09qc=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6672.namprd04.prod.outlook.com (2603:10b6:208:1e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 07:11:37 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 07:11:37 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
Thread-Topic: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
Thread-Index: AQHWtB8gKEjfkBkVokSF5N6+r8ArFKm691UAgAZ8wICAAAKtAIABFMgA
Date:   Wed, 11 Nov 2020 07:11:37 +0000
Message-ID: <e7d673e29a2a4ddebd4b948eb60bf7b9ba97c6a2.camel@wdc.com>
References: <20201104115348.51930-1-damien.lemoal@wdc.com>
         <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
         <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com>
         <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
         <CAMRc=MfjWfvKP8ZjU9RA+kgpR9x3pqkGExzMjSerLztLwDV86Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfjWfvKP8ZjU9RA+kgpR9x3pqkGExzMjSerLztLwDV86Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: bgdev.pl; dkim=none (message not signed)
 header.d=none;bgdev.pl; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 13efae54-a5cf-4685-8d3a-08d8861107a4
x-ms-traffictypediagnostic: MN2PR04MB6672:
x-microsoft-antispam-prvs: <MN2PR04MB66722F5A1F795144044AF54BE7E80@MN2PR04MB6672.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fi+m8gsbywk6QAFMoOTgp1PKXKFjSKU0QBgniAi8y625LthK98i3bTJ4rzrPgkv+HO+EFF9XnNoZwX6YLhDX9A8z2nV3I3lkb5MMcfd1pruoCtDjJjzy5CAOU6TxnyS6yVzLLKJ1XNpVTRdeCovL9rZ9qcv0iLdfLb7tjaX4Ip/lRR6BZ/x2Fn/IJKVmpAwXtxwuY9rfxNjXeUVt1/srh5fIRIyAS1vxhMUxvqP5JjEwagijkBcqvOGZLiuCm0tEQ0oteVRbue6jT7dA+7RKVn82qO9P0E5IRZjUepxvm6gHrPngcMB/yIykn4svyUiN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(66476007)(5660300002)(64756008)(71200400001)(4001150100001)(8676002)(66446008)(66556008)(8936002)(53546011)(6506007)(86362001)(76116006)(66946007)(91956017)(186003)(6512007)(4326008)(6486002)(478600001)(2616005)(54906003)(110136005)(36756003)(2906002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: KYJXOz1Ey3HMkmXUOzC5OEEocMNaa7roUrAk4By/hieM8X9mf1xRL+12a8jypNyirEqMHZcW3U8FEHesZDlE9EkM3RKrQkBxlOc6FDO6d6Zz1NpCa8WO84iJxRZIrYm/xj0ohO3EJtR0Q1OFcsJQzJVjKeJsbQuuT+0/vgTtK/wDGcrLDdkwBQwDwmcMh6AJFV2ezpzF+ZqEiswGkXLILt+gVyhKVUGQz0ZYrZaT0Jy0ld+217pHZeN4EFeLSu5RBJGqzcE2arHqFakyoFkHkjIUAmimwuiLgmQiXs93Zikceji2zNKVNUbdBp5qLcf25oQLbk62BxhjX2VT6K+uoIic0T8WyqS3rGnDvEvVat0oQD9fImzvkTFHhMHKm+f5KKeXvZyBUyLJV2Wdu1lZoq/xEbyNgjKZyGflZ5d+LKJ4AwMz9Ap95wk2Umm26fcPgkD7WaF6REQ5e++JlxpoPN478YsGvZHIEWtZD1Q8PxhUNmEEkNhvD0F5xnSBCbw0g36UX4WjNnYpOSGZycxUmncafKe7lME7zW4rvn419cvakcP5sRt8m0q1jzUT/y3UNn6NFJnjpbT6hzwJc1NHxMXMGUZGIEEm3KIoENpYqz5ktHvifTe3iwlm0keWqF3Dd9/nW2+ND41khBZJCJJ2wK8Qi8YuJhMnVcBIFljFy3PHclwcuYeuQ9tiFTqxvyFPLxBURNSrQtO/MuKr8z3lgQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A599CD1646DD4B4AA4FBC6FE77FA27C0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13efae54-a5cf-4685-8d3a-08d8861107a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 07:11:37.3048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JcETB0YEBaQGlJZfuAq3wKnAU+LA91UATq9q2OyF+Z1t6DRyp3fQmWdI9heFmGKR9Nq3YlWb6rMqvGhtemowDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6672
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTExLTEwIGF0IDE1OjQwICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBPbiBUdWUsIE5vdiAxMCwgMjAyMCBhdCAzOjMxIFBNIExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gDQo+ID4gT24gRnJpLCBOb3YgNiwg
MjAyMCBhdCAxMjoyNyBQTSBEYW1pZW4gTGUgTW9hbCA8RGFtaWVuLkxlTW9hbEB3ZGMuY29tPiB3
cm90ZToNCj4gPiANCj4gPiA+IEl0IG1heSBub3QgYmUgdGhlIGJlc3QgaW50ZXJmYWNlIGZvciBy
ZWd1bGFyIGVuZCB1c2VycyB0bw0KPiA+ID4gbWFuaXB1bGF0ZSBncGlvcywgYnV0IGl0IGlzIGRl
ZmluaXRlbHkgc3VwZXIgdXNlZnVsIGZvciBkZXZlbG9wZXJzIHRvIGRvIHF1aWNrDQo+ID4gPiB0
ZXN0cyBvZiB0aGVpciBzZXR1cC9kcml2ZXJzICh3aGljaCBpcyB3aGF0IEkgZGlkIGZvciBteSB3
b3JrIHdpdGggdGhlIEtlbmRyeXRlDQo+ID4gPiBLMjEwIFJJU0MtViBTb0Mgc3VwcG9ydCkuDQo+
ID4gDQo+ID4gSXQgaXMgYSBiaXQgZGlzY291cmFnaW5nIHRoYXQgUklTQy1WLCB3aGljaCB3YXMg
aW52ZW50ZWQgYWZ0ZXIgd2UgYWxyZWFkeQ0KPiA+IG9ic29sZXRlZCB0aGUgc3lzZnMgQUJJLCBp
cyBkZXBsb3lpbmcgdGhpcyBmb3IgZGV2ZWxvcG1lbnQgYW5kIHRlc3QuDQo+ID4gDQo+ID4gV2Ug
bmVlZCB0byB0aGluayBhYm91dCBhIHNpbWlsYXIgZmFjaWxpdHkgZm9yIHVzZXJzIHdoaWNoIGlz
IGxlc3MNCj4gPiBkYW1hZ2luZyBidXQgZnVsZmlscyB0aGUgc2FtZSBuZWVkcy4gSSB0aGluayBJ
IHNhdyBzb21ldGhpbmcgYSB3aGlsZQ0KPiA+IGJhY2sgdGhhdCBsb29rZWQgcHJvbWlzaW5nIGFu
ZCBhZGRlZCBzb21lIGZ1bmt5IGZpbGVzIGluIGRlYnVnZnMNCj4gPiBpbiBhIGhpZXJhcmNoaWNh
bCBtYW5uZXIgcGVyLWdwaW9jaGlwIGluc3RlYWQuIFRoYXQgaXMgaG93IGRlYnVnZnMNCj4gPiBz
aG91bGQgYmUgdXNlZC4NCj4gPiANCj4gDQo+IEJhc2ljYWxseSBzb21ldGhpbmcgbGlrZSB3aGF0
IGdwaW8tbW9ja3VwIGRvZXMgZm9yIGV2ZW50cz8gV2FzIGl0DQo+IHNvbWV0aGluZyBvdXQtb2Yt
dHJlZSBvciB3YXMgaXQgb24gdGhlIG1haWxpbmcgbGlzdD8NCj4gDQo+IEFsc286IHF1aWNrIHRl
c3RzIGhhdmUgdGhlIHRlbmRlbmN5IHRvIGJlY29tZSBsb25nLXRlcm0gc29sdXRpb25zLiA6KQ0K
PiANCj4gSXMgZ3Bpb2dldC9ncGlvc2V0IGR1byBkaWZmaWN1bHQvY3VtYmVyc29tZSB0byB1c2U/
IEl0J3MgYSBzZXJpb3VzDQo+IHF1ZXN0aW9uIC0gSSB3cm90ZSBpdCBpbiBhIHdheSB0aGF0IHdh
cyBhcyB1c2VyLWZyaWVuZGx5IGFzIHBvc3NpYmxlDQo+IGJ1dCBtYXliZSBJJ20gbWlzc2luZyBz
b21ldGhpbmcgYWJvdXQgc3lzZnMgdGhhdCBtYWtlcyB1c2VycyBwcmVmZXIgaXQNCj4gb3ZlciBh
IGNvbW1hbmQtbGluZSB0b29sLiBUbyBtZSBzeXNmcyB3YXMgYWx3YXlzIGEgUElUQSB3aXRoIHRo
ZQ0KPiBnbG9iYWwgbnVtYmVycyBldGMuIGJ1dCBpdCBzdGlsbCBzZWVtcyB0byBzdGljayB3aXRo
IG90aGVycy4NCg0KSW4gbXkgcGFydGljdWxhciBjYXNlLCBJIGFtIHVzaW5nIGEgc2ltcGxlIGJ1
c3lib3ggdXNlcnNwYWNlIHRoYXQgaGFzIG5vdGhpbmcNCmVsc2UgYnV0IGEgc2hlbGwsIHNvIEkg
ZGlkIG5vdCBoYXZlIHRoZSBncGlvZ2V0L2dwaW9zZXQgdG9vbHMuIEFuZCB0byBiZSBmcmFuaywN
CkkgZGlkIG5vdCBldmVuIGtub3cgd2hhdCB0b29sIHRvIHVzZSB0byBjb250cm9sIEdQSU9zLiBJ
dCBpcyB0aGUgZmlyc3QgdGltZSBJDQphbSB0b3VjaGluZyBHUElPcyB3aXRoIExpbnV4IGFuZCBk
aWQgbm90IHNwZW50IHRpbWUgdG8gc3R1ZHkgd2hhdCBzaG91bGQgYmUNCnVzZWQgb25jZSBJIHNh
dyB0aGF0IHN5c2ZzIGFsbG93ZWQgY29udHJvbGxpbmcgdGhlIHBpbnMgZm9yIHRlc3RzLg0KDQpS
ZW1vdmluZyBzeXNmcyBlbnRpcmVseSB3b3VsZCBsaWtlbHkgZm9yY2UgcGVvcGxlIHRvIGxvb2sg
Zm9yIHRoZXNlIHRvb2xzIHRvIGRvDQp0ZXN0cywgYW5kIEkgcmVhbGx5IGFtIGFuIGV4YW1wbGUg
aGVyZSA6KQ0KDQpJIGFtIHVzaW5nIGJ1aWxkcm9vdCB0byBnZW5lcmF0ZSB0aGUgdG9vbGNoYWlu
IGFuZCBidXN5Ym94IHVzZXJzcGFjZSBmb3IgdGhlDQpib2FyZC4gIEkgbm93IHNlZSB0aGF0IGxp
YmdwaW9kIGFuZCBncGlvIHRvb2xzIHBhY2thZ2VzIGFyZSBpbiB0aGVyZSBidXQgZm9yDQp3aGF0
ZXZlciByZWFzb25zLCBJIGNhbm5vdCBzZWxlY3QgdGhlbSBmb3IgbXkgUklTQy1WIGJ1aWxkLiBX
aWxsIG5lZWQgdG8NCmV4cGxvcmUgd2h5Lg0KDQoNCi0tIA0KRGFtaWVuIExlIE1vYWwNCldlc3Rl
cm4gRGlnaXRhbA0K

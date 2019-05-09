Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8621884F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 12:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfEIK1c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 06:27:32 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:62858 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfEIK1c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 May 2019 06:27:32 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd4009e0000>; Thu, 09 May 2019 18:27:43 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 May 2019 03:27:24 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Thu, 09 May 2019 03:27:24 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 May
 2019 10:27:25 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.55) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 9 May 2019 10:27:24 +0000
Received: from SN6PR12MB2734.namprd12.prod.outlook.com (52.135.107.25) by
 SN6PR12MB2830.namprd12.prod.outlook.com (20.177.250.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Thu, 9 May 2019 10:27:22 +0000
Received: from SN6PR12MB2734.namprd12.prod.outlook.com
 ([fe80::e104:f933:eac3:17e1]) by SN6PR12MB2734.namprd12.prod.outlook.com
 ([fe80::e104:f933:eac3:17e1%3]) with mapi id 15.20.1856.016; Thu, 9 May 2019
 10:27:21 +0000
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        "Laxman Dewangan" <ldewangan@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: RE: [Patch-V2 1/4] dt-binding: Tegra194 pinctrl support
Thread-Topic: [Patch-V2 1/4] dt-binding: Tegra194 pinctrl support
Thread-Index: AQHVBj6KET6veNuQRUGyzRHlwar6sKZiilEAgAAMP6A=
Date:   Thu, 9 May 2019 10:27:21 +0000
Message-ID: <SN6PR12MB2734B6AAEEADCF432DD4001EC3330@SN6PR12MB2734.namprd12.prod.outlook.com>
References: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
 <41dbf606-0a15-a0bc-07fd-2c7101d7f6a1@nvidia.com>
In-Reply-To: <41dbf606-0a15-a0bc-07fd-2c7101d7f6a1@nvidia.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=kyarlagadda@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-05-09T10:27:17.8907820Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kyarlagadda@nvidia.com; 
x-originating-ip: [115.114.118.135]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a23d28e-43f2-46b7-8800-08d6d468ebf8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN6PR12MB2830;
x-ms-traffictypediagnostic: SN6PR12MB2830:
x-microsoft-antispam-prvs: <SN6PR12MB2830AA65E1606FB27D76CFB2C3330@SN6PR12MB2830.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(396003)(366004)(39860400002)(136003)(189003)(199004)(13464003)(8676002)(81156014)(8936002)(81166006)(53936002)(25786009)(2501003)(76176011)(6116002)(53546011)(55236004)(102836004)(9686003)(3846002)(229853002)(55016002)(6436002)(14454004)(478600001)(107886003)(6246003)(316002)(86362001)(4326008)(33656002)(54906003)(110136005)(2201001)(11346002)(476003)(446003)(73956011)(5660300002)(6506007)(66946007)(71190400001)(71200400001)(76116006)(66446008)(64756008)(66556008)(66476007)(68736007)(256004)(14444005)(52536014)(99286004)(486006)(7736002)(66066001)(305945005)(74316002)(2906002)(186003)(26005)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR12MB2830;H:SN6PR12MB2734.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CalroI1aH+uXyI+Uz2PFQmPvQD94fhrqxwKmOXgJL4g04cAbSy33VsUUP2x/bacUHQ+rpl8bvGIASUz8b+f0rl5aC40qbJMQcKGU/sh6OwXX4E0q+CpZuLmZPH84Bd2Fnq8ApsydP0JvC+rQ40vSLl/AntV/WR2YK0UmsquV5MUzQYl753PsA7vgp++kgRXHW8VxloAUzKcZA91ZgPdWYYC/QOz2E6m68lsuhWT9QUhAao+J/4TEiHT8RkqOSQLkaUgzqGmxrCihar1Q4yJ1097G18ZjDUQqYj8/ICucv5pkk069WXa1PtcNU/WwwnLyGAqr37QbaB1BnUpLTOobhXXN8dHdz/xNTvmCSjLvz6YhPeyZyYeHumgxyhKK9OViAP76IAfFsxh54ZDrpWkh3wc/RidEtx6L57UwgAxDZJI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a23d28e-43f2-46b7-8800-08d6d468ebf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 10:27:21.8033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2830
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557397663; bh=/k3plfuAWvtaORwooBUC1u46VgmnYzLxhpSwluxyXCs=;
        h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=Y/3bdnkc1iWMciiaT9JzZLyqsjG3uGyzw6f9pSSiQ3j3xefV/QhABuZxcnz9AlDyB
         Sq+r8+cFiNx6OHxpm8E+/QeYvmjlE/Xe+B6Rg0c6YRpcSm5CZUCn9X/JYSEjsadvz/
         Zl4RU2AVLgs5CgL5yLyPC5/WzP4l8/el6GPCDzWkmg+DD7BQpvtZ52y24tU7mdUJcr
         c1UT6MKuedRscg0cQT9iwvBLjRBa1sUiEpJN1ycDiuZU566d4ON785z/+45yko7CFR
         XIsJz3JxTvcrrbTLwa2BwGoJlN6cad+sDmDjh9zg4X+JTfnKCa4mXZQm03smujCqs9
         bfGv6GOdNjN6Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvbmF0aGFuIEh1bnRlciA8
am9uYXRoYW5oQG52aWRpYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgOSwgMjAxOSAzOjEy
IFBNDQo+IFRvOiBLcmlzaG5hIFlhcmxhZ2FkZGEgPGt5YXJsYWdhZGRhQG52aWRpYS5jb20+OyBs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc7DQo+IHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbTsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3Jn
OyBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnDQo+IENjOiBQZXRlciBEZSBTY2hyaWp2ZXIgPHBkZXNjaHJpanZlckBudmlkaWEuY29tPjsg
Sm9zZXBoIExvDQo+IDxqb3NlcGhsQG52aWRpYS5jb20+OyBTdXJlc2ggTWFuZ2lwdWRpIDxzbWFu
Z2lwdWRpQG52aWRpYS5jb20+Ow0KPiBMYXhtYW4gRGV3YW5nYW4gPGxkZXdhbmdhbkBudmlkaWEu
Y29tPjsgVmlkeWEgU2FnYXINCj4gPHZpZHlhc0BudmlkaWEuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BhdGNoLVYyIDEvNF0gZHQtYmluZGluZzogVGVncmExOTQgcGluY3RybCBzdXBwb3J0DQo+IA0K
PiANCj4gT24gMDkvMDUvMjAxOSAwOTowOCwgS3Jpc2huYSBZYXJsYWdhZGRhIHdyb3RlOg0KPiA+
IEFkZCBiaW5kaW5nIGRvYyBmb3IgVGVncmEgMTk0IHBpbmN0cmwgZHJpdmVyDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBLcmlzaG5hIFlhcmxhZ2FkZGEgPGt5YXJsYWdhZGRhQG52aWRpYS5jb20+
DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiBWMjoNCj4gPiBjcmVhdGVkIG5ldyBiaW5kaW5nIGRv
YyB0byBoYW5kbGUgVGVncmExOTQgcGluY3RybCBkcml2ZXINCj4gPg0KPiA+ICAuLi4vYmluZGlu
Z3MvcGluY3RybC9udmlkaWEsdGVncmExOTQtcGlubXV4LnR4dCAgICB8IDExNg0KPiArKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExNiBpbnNlcnRpb25zKCspDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL252aWRpYSx0ZWdyYTE5NC1waW5tdXgudHh0DQo+ID4NCj4gPiBkaWZmIC0t
Z2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9udmlk
aWEsdGVncmExOTQtcGlubXV4LnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BpbmN0cmwvbnZpZGlhLHRlZ3JhMTk0LXBpbm11eC50eHQNCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjgwZTM2YzcNCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbnZp
ZGlhLHRlZ3JhMTk0LXBpbm11eA0KPiA+ICsrKyAudHh0DQo+ID4gQEAgLTAsMCArMSwxMTYgQEAN
Cj4gPiArTlZJRElBIFRlZ3JhMTk0IHBpbm11eCBjb250cm9sbGVyDQo+ID4gKw0KPiA+ICtSZXF1
aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICstIGNvbXBhdGlibGU6ICJudmlkaWEsdGVncmExOTQtcGlu
bXV4Ig0KPiA+ICstIHJlZzogU2hvdWxkIGNvbnRhaW4gYSBsaXN0IG9mIGJhc2UgYWRkcmVzcyBh
bmQgc2l6ZSBwYWlycyBmb3I6DQo+ID4gKyAgLSBmaXJzdCBlbnRyeTogVGhlIEFQQl9NSVNDX0dQ
XypfUEFEQ1RSTCByZWdpc3RlcnMgKHBhZCBjb250cm9sKQ0KPiA+ICsgIC0gc2Vjb25kIGVudHJ5
OiBUaGUgUElOTVVYX0FVWF8qIHJlZ2lzdGVycyAocGlubXV4KQ0KPiA+ICsNCj4gPiArUGxlYXNl
IHJlZmVyIHRvIHBpbmN0cmwtYmluZGluZ3MudHh0IGluIHRoaXMgZGlyZWN0b3J5IGZvciBkZXRh
aWxzIG9mDQo+ID4gK3RoZSBjb21tb24gcGluY3RybCBiaW5kaW5ncyB1c2VkIGJ5IGNsaWVudCBk
ZXZpY2VzLCBpbmNsdWRpbmcgdGhlDQo+ID4gK21lYW5pbmcgb2YgdGhlIHBocmFzZSAicGluIGNv
bmZpZ3VyYXRpb24gbm9kZSIuDQo+ID4gKw0KPiA+ICtUZWdyYSdzIHBpbiBjb25maWd1cmF0aW9u
IG5vZGVzIGFjdCBhcyBhIGNvbnRhaW5lciBmb3IgYW4gYXJiaXRyYXJ5DQo+ID4gK251bWJlciBv
ZiBzdWJub2Rlcy4gRWFjaCBvZiB0aGVzZSBzdWJub2RlcyByZXByZXNlbnRzIHNvbWUgZGVzaXJl
ZA0KPiA+ICtjb25maWd1cmF0aW9uIGZvciBhIHBpbiwgYSBncm91cCwgb3IgYSBsaXN0IG9mIHBp
bnMgb3IgZ3JvdXBzLiBUaGlzDQo+ID4gK2NvbmZpZ3VyYXRpb24gY2FuIGluY2x1ZGUgdGhlIG11
eCBmdW5jdGlvbiB0byBzZWxlY3Qgb24gdGhvc2UNCj4gPiArcGluKHMpL2dyb3VwKHMpLCBhbmQg
dmFyaW91cyBwaW4gY29uZmlndXJhdGlvbiBwYXJhbWV0ZXJzLCBzdWNoIGFzIHB1bGwtdXAsDQo+
IHRyaXN0YXRlLCBkcml2ZSBzdHJlbmd0aCwgZXRjLg0KPiA+ICsNCj4gPiArU2VlIHRoZSBUUk0g
dG8gZGV0ZXJtaW5lIHdoaWNoIHByb3BlcnRpZXMgYW5kIHZhbHVlcyBhcHBseSB0byBlYWNoDQo+
IHBpbi9ncm91cC4NCj4gPiArTWFjcm8gdmFsdWVzIGZvciBwcm9wZXJ0eSB2YWx1ZXMgYXJlIGRl
ZmluZWQgaW4NCj4gPiAraW5jbHVkZS9kdC1iaW5kaW5nL3BpbmN0cmwvcGluY3RybC10ZWdyYS5o
Lg0KPiA+ICsNCj4gPiArUmVxdWlyZWQgc3Vibm9kZS1wcm9wZXJ0aWVzOg0KPiA+ICstIG52aWRp
YSxwaW5zIDogQW4gYXJyYXkgb2Ygc3RyaW5ncy4gRWFjaCBzdHJpbmcgY29udGFpbnMgdGhlIG5h
bWUgb2YgYSBwaW4gb3INCj4gPiArICAgIGdyb3VwLiBWYWxpZCB2YWx1ZXMgZm9yIHRoZXNlIG5h
bWVzIGFyZSBsaXN0ZWQgYmVsb3cuDQo+ID4gKw0KPiA+ICtPcHRpb25hbCBzdWJub2RlLXByb3Bl
cnRpZXM6DQo+ID4gKy0gbnZpZGlhLGZ1bmN0aW9uOiBBIHN0cmluZyBjb250YWluaW5nIHRoZSBu
YW1lIG9mIHRoZSBmdW5jdGlvbiB0byBtdXggdG8NCj4gdGhlDQo+ID4gKyAgICBwaW4gb3IgZ3Jv
dXAuDQo+ID4gKy0gbnZpZGlhLHB1bGw6IEludGVnZXIsIHJlcHJlc2VudGluZyB0aGUgcHVsbC1k
b3duL3VwIHRvIGFwcGx5IHRvIHRoZSBwaW4uDQo+ID4gKyAgICAwOiBub25lLCAxOiBkb3duLCAy
OiB1cC4NCj4gPiArLSBudmlkaWEsdHJpc3RhdGU6IEludGVnZXIuDQo+ID4gKyAgICAwOiBkcml2
ZSwgMTogdHJpc3RhdGUuDQo+ID4gKy0gbnZpZGlhLGVuYWJsZS1pbnB1dDogSW50ZWdlci4gRW5h
YmxlIHRoZSBwaW4ncyBpbnB1dCBwYXRoLg0KPiA+ICsgICAgZW5hYmxlIDpURUdSQV9QSU5fRU5B
QkxFIGFuZA0KPiA+ICsgICAgZGlzYWJsZSBvciBvdXRwdXQgb25seTogVEVHUkFfUElOX0RJU0FC
TEUuDQo+ID4gKy0gbnZpZGlhLG9wZW4tZHJhaW46IEludGVnZXIuDQo+ID4gKyAgICBlbmFibGU6
IFRFR1JBX1BJTl9FTkFCTEUuDQo+ID4gKyAgICBkaXNhYmxlOiBURUdSQV9QSU5fRElTQUJMRS4N
Cj4gPiArLSBudmlkaWEsbG9jazogSW50ZWdlci4gTG9jayB0aGUgcGluIGNvbmZpZ3VyYXRpb24g
YWdhaW5zdCBmdXJ0aGVyIGNoYW5nZXMNCj4gPiArICAgIHVudGlsIHJlc2V0Lg0KPiA+ICsgICAg
ZW5hYmxlOiBURUdSQV9QSU5fRU5BQkxFLg0KPiA+ICsgICAgZGlzYWJsZTogVEVHUkFfUElOX0RJ
U0FCTEUuDQo+ID4gKy0gbnZpZGlhLGlvLWh2OiBJbnRlZ2VyLiBTZWxlY3QgaGlnaC12b2x0YWdl
IHJlY2VpdmVycy4NCj4gPiArICAgIG5vcm1hbDogVEVHUkFfUElOX0RJU0FCTEUNCj4gPiArICAg
IGhpZ2g6IFRFR1JBX1BJTl9FTkFCTEUNCj4gPiArLSBudmlkaWEsaGlnaC1zcGVlZC1tb2RlOiBJ
bnRlZ2VyLiBFbmFibGUgaGlnaCBzcGVlZCBtb2RlIHRoZSBwaW5zLg0KPiA+ICsgICAgbm9ybWFs
OiBURUdSQV9QSU5fRElTQUJMRQ0KPiA+ICsgICAgaGlnaDogVEVHUkFfUElOX0VOQUJMRQ0KPiA+
ICstIG52aWRpYSxzY2htaXR0OiBJbnRlZ2VyLiBFbmFibGVzIFNjaG1pdHQgVHJpZ2dlciBvbiB0
aGUgaW5wdXQuDQo+ID4gKyAgICBub3JtYWw6IFRFR1JBX1BJTl9ESVNBQkxFDQo+ID4gKyAgICBo
aWdoOiBURUdSQV9QSU5fRU5BQkxFDQo+ID4gKy0gbnZpZGlhLGRyaXZlLXR5cGU6IEludGVnZXIu
IFZhbGlkIHJhbmdlIDAuLi4zLg0KPiA+ICstIG52aWRpYSxwdWxsLWRvd24tc3RyZW5ndGg6IElu
dGVnZXIuIENvbnRyb2xzIGRyaXZlIHN0cmVuZ3RoLiAwIGlzIHdlYWtlc3QuDQo+ID4gKyAgICBU
aGUgcmFuZ2Ugb2YgdmFsaWQgdmFsdWVzIGRlcGVuZHMgb24gdGhlIHBpbmdyb3VwLiBTZWUgIkNB
TF9EUlZETiINCj4gaW4gdGhlDQo+ID4gKyAgICBUZWdyYSBUUk0uDQo+ID4gKy0gbnZpZGlhLHB1
bGwtdXAtc3RyZW5ndGg6IEludGVnZXIuIENvbnRyb2xzIGRyaXZlIHN0cmVuZ3RoLiAwIGlzIHdl
YWtlc3QuDQo+ID4gKyAgICBUaGUgcmFuZ2Ugb2YgdmFsaWQgdmFsdWVzIGRlcGVuZHMgb24gdGhl
IHBpbmdyb3VwLiBTZWUgIkNBTF9EUlZVUCINCj4gaW4gdGhlDQo+ID4gKyAgICBUZWdyYSBUUk0u
DQo+ID4gKy0gbnZpZGlhLHNsZXctcmF0ZS1yaXNpbmc6IEludGVnZXIuIENvbnRyb2xzIHJpc2lu
ZyBzaWduYWwgc2xldyByYXRlLiAwIGlzDQo+ID4gKyAgICBmYXN0ZXN0LiBUaGUgcmFuZ2Ugb2Yg
dmFsaWQgdmFsdWVzIGRlcGVuZHMgb24gdGhlIHBpbmdyb3VwLiBTZWUNCj4gPiArICAgICJEUlZE
Tl9TTFdSIiBpbiB0aGUgVGVncmEgVFJNLg0KPiA+ICstIG52aWRpYSxzbGV3LXJhdGUtZmFsbGlu
ZzogSW50ZWdlci4gQ29udHJvbHMgZmFsbGluZyBzaWduYWwgc2xldyByYXRlLiAwIGlzDQo+ID4g
KyAgICBmYXN0ZXN0LiBUaGUgcmFuZ2Ugb2YgdmFsaWQgdmFsdWVzIGRlcGVuZHMgb24gdGhlIHBp
bmdyb3VwLiBTZWUNCj4gPiArICAgICJEUlZVUF9TTFdGIiBpbiB0aGUgVGVncmEgVFJNLg0KPiAN
Cj4gQXJlIGFsbCB0aGVzZSBwcm9wZXJ0aWVzIGFwcGxpY2FibGUgdG8gdGhlIHBleF9sNV9jbGty
ZXEgYW5kIHBleF9sNV9yc3QgcGlucz8NCj4gUGFydGljdWxhcmx5IHRoZSBzbGV3LXJhdGUgcHJv
cGVydGllcz8NCj4gDQo+IENoZWVycw0KPiBKb24NClNsZXctcmF0ZSwgaGlnaC1zcGVlZC1tb2Rl
IGFyZSBzdXBwb3J0ZWQgYnkgZHJpdmVyIGJ1dCBub3QgdGhlc2UgcGlucy4NCldpbGwgcmVtb3Zl
IHByb3BlcnRpZXMgbm90IHN1cHBvcnRlZCBieSBwZXggcGlucyBpbiBuZXh0IHZlcnNpb24uDQo+
IA0KPiAtLQ0KPiBudnB1YmxpYw0K

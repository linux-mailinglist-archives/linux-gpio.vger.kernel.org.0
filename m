Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1D82CFB9D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 15:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgLEOx1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 09:53:27 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2299 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgLEOvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 09:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607179904; x=1638715904;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=IYPrbp93Ya9N90fBRUGWyJZDDqgx1ua59ZPWtztiRV0=;
  b=LFh/IjBrhj0Ba0p9qdsrqHJEWJTWgsO+dr17xkhBQUuRDrRY5B4VCyHO
   6y/lAo6WbxurO2lyhNSBjw76k14Hzljo+QEZYPJ2yD9SJWzlIgSSUupA2
   Nf6plf9si4KJesmTJ35or6Sy/9drtfCsgWyK3FOQJ4GdHlKITYb77DwMb
   qGysyXD2F0jxCeRa4/aCrt0hGvbiS90cvph74FOWIhhN6imGdV+pSYjFB
   sS6VPoGtSi7UktWiXxJfw34YKh8QmPXIuWkU5i/zI7nLXthDg0CXQvZQU
   19jJzESNpjvLW/n7pDTbVC8/BZIF64yNZ81TPEDzEM1MtpjK3HaTOwEWF
   A==;
IronPort-SDR: O6aXluQniOdJ/5xoKw5b0fcvGVrDce1Si/8GiHXtm2KhfKeKrFSjHsKO22+rCjIXWAvxV3wQ+F
 W9nCSWntz7XcOUSI07CvVyz1tC+mXJDp0YKtw6j7/cfJoXyt8yyvTHVHODsj4kr2gFbNJZ2rzX
 Wv1DTCh5KQl4LqWZqklLV6CxxKUAUYhajEfJWEPquuZh/qswFcP1ymfTk0yrRTnkjVF8Cqwxax
 ff8Of7awTO1ww1/V9bi/GlYgNaJwXOCYzs258r/DlK9U91yyIm4TU2yHzciWQw1RWXmZvphzkp
 R3M=
X-IronPort-AV: E=Sophos;i="5.78,395,1599494400"; 
   d="scan'208";a="155710338"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
  by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2020 22:13:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyMwomFN8TfrChcvlU8he2tYhwnWVpEPthUEiRhOSKNBdz8o79YtcVWLNUKgtRBK52rnMKfpE+NYB0Yf2Xqf6qe1p+/8LYEkRm/rIiaOYpyAgIsutkRJ6+QdmUmL5Mp2q0XzNNDbcKSDQb0VZpbAiTAd7AcCC1jKpYsB475MpJdcaRwNEqMvieeM0s1cDZzZybdPEe/YCzssWCq5+RaPKbLlA8Xf71ETTWVgYRhyTjsJ5JV0G8TFWGQGGy9iYvgK0LIYmMCKY153xLsKc0m2uaTAdeoxT0eNEcF5ZccxnCYDPUTvqWfIviidqAeHoT4ESEhHUqc2GTlAkpYUNaXuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYPrbp93Ya9N90fBRUGWyJZDDqgx1ua59ZPWtztiRV0=;
 b=MMXDGufj4MtLxSA2ME9YUh6zFw/moB6Nqc5d337XE4MchygZU+cz+aIQDEvP40MPPmPby1orpCEMIbOou872soDGLNZ7fJIN/4uZ21Y7tXvNrnwm3gMRdEYD1pqLXLSgv+Oi/P2m8yOBmS7TF8nQe7XwQUh4r3J+DdQIKzsR5lPd7o8q5uIetkrBvoY2CkoEcxEE5+XiercXoulYvadKPiWsBFX4p9MW94KLXiiOlQNZ4H5gpkqwh6Yo6E70r6TJHZnelb2I/uw5rAJkjAXGGf7c/AARdMwcyswPAdEVVkbh4mcGnBBnQib7zxybs+gsfJUDdCxnmWNf4nCBPhCWcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYPrbp93Ya9N90fBRUGWyJZDDqgx1ua59ZPWtztiRV0=;
 b=HVCmh/cSrw2vTs93x4XhsvqGzTKZQEbQfkS3m0Tbffo8Qm8gFqux75qperKy0yrwHN7H9+zNmn5CsX9Z1RirnEqZA1fzi7O1doTl8/PU3ogUWY++xFIQE1wPsDJgV38o+QdF1BmyQCuun+SzZ8dOkHeClqZFUKQU8JMlnpZdmVU=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6539.namprd04.prod.outlook.com (2603:10b6:610:6e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Sat, 5 Dec
 2020 14:13:11 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.038; Sat, 5 Dec 2020
 14:13:05 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "seanga2@gmail.com" <seanga2@gmail.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Topic: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Index: AQHWyFrJ31Bqsdz07kaNo2YIn/vMLanoDJcAgAAXRYCAAGSxAIAACDsA
Date:   Sat, 5 Dec 2020 14:13:05 +0000
Message-ID: <7ec3c4888d24abd3029920fdd01a5f5837ca299c.camel@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
         <20201202032500.206346-12-damien.lemoal@wdc.com>
         <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
         <d9aec92299e5f427aaf5c5e892194e27006f8bbc.camel@wdc.com>
         <3ef543a8-5709-d653-e347-78faa08f81d2@gmail.com>
In-Reply-To: <3ef543a8-5709-d653-e347-78faa08f81d2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5a844e90-2040-4dac-1913-08d89927e268
x-ms-traffictypediagnostic: CH2PR04MB6539:
x-microsoft-antispam-prvs: <CH2PR04MB65397CA3F07EF2975908ED22E7F00@CH2PR04MB6539.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4LON6lYYLXKN3YmewBncjDuk2NRHlFDTrXB7Npf0yqfaiiGvqJgnQrdOSDJePJaKb7D241ze2qf3L6Z84tWRr4wkykkmF74lc37QKHccqemWz83d0c8gacVMp8ThhpmrDM1VSQddZxVzz8YoCEUNS2oINjXKgMzENsrJocmCQ05yFYQVHAEIE17BB+df0cvA9tp/M9PBfkzwpV8aep/1jlUgqFlFqdoGPS6mcvtFBAErudk5JHuvuUlMv5LdcWlQcKENeObKyn8+JIfGiATdHSCUY5cutyS2aIol9BMdXUk4dSflZvqEiKR8BYNCD2XkCkzS9lIt5GznkV4IaHQoW+I4UFw3KlsnIDErb5KnOjDqhNhHH3TaDDh5SM6ylcvVhmmlSrAP6Q7baN3tGlTkY3deasrgm3c3atRFSv+qKaDdCmtCMOZdkPdATynCJpv7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(8936002)(91956017)(110136005)(316002)(186003)(8676002)(6506007)(83380400001)(6512007)(53546011)(2616005)(71200400001)(7416002)(2906002)(921005)(966005)(6486002)(66556008)(86362001)(36756003)(66946007)(66476007)(66446008)(5660300002)(76116006)(64756008)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UUd4ZHM1ZkxmVXRwaGRaNFY0V2Y2Z2x4RS9KU2Q3TFBOdDVlWmVWRmMveWNO?=
 =?utf-8?B?MnpIQ2ZBeU50bkdRK3YrMFNvRlF1Ui9mVitFcGlsZnQ5aGxaMXZEbUtXd1pa?=
 =?utf-8?B?Y0tBbWVjem10R0NLaWNZclJzWGhzazR0am9aWFVEZFVkMTNkTkVtZEY0MXha?=
 =?utf-8?B?Rm93RCtDYVAwQjgybUNLc3ZWWS9oakN3WWhvNzdzN3ZhRGNpUzhIbGVrYmRK?=
 =?utf-8?B?L0NwS3VkSlFoRk1LVFNqYXozdWc1aUhFSnppVTZUa2lxZStPajRXS3BWQmlH?=
 =?utf-8?B?WGczeHdlYUllb3NSOFREOUdIOU9RbXBPc3d0SXA0Y3RlUUVLQzNPa3JKZG5L?=
 =?utf-8?B?Zk5VMmJtcDFVd0VQa0Y2QndKeGFsZUZ3bU11R3dUM0hUK2o5VXVtYUNwejhJ?=
 =?utf-8?B?VkVCakc4UWgvNVdQak1yUTI0YUJrL2srZlhFRm1veDgvTzcyUHlZbXBxTFdj?=
 =?utf-8?B?UWlLNDFJcS9aNTZJN2hyL0VydzRUVkxsOEFEdXNZZGFDKzEyLzVPSHFJRFk3?=
 =?utf-8?B?Q0tHNGw3dGJiQU1MNGpLaDA0YXR1dEp0N2NsSGkwaGxNLzhWRUZJL1NNZmxj?=
 =?utf-8?B?SXl3bTlsYzRSek11anB3K1BydEJMR3dqZHpaWnlhY0Exbkp0SEE1SS9MRnpo?=
 =?utf-8?B?QUVxTWdEWjluYXJtdWlSQk1MVllRcGFsaFVBMXJPZ0NTRHZOTUVNbVgxN1dh?=
 =?utf-8?B?UXEzUGR4aVZKeW1UWDNiSXJ0b3hSV0hyOE1ac3QyR29Na3JYN0kwaDkrYkNC?=
 =?utf-8?B?ZW91Y21hTVJoRCtaNWVFWlVqL2pHOUlDUEx0TTRPUWVYVEN3V3czZCt0c29q?=
 =?utf-8?B?bW5teHA3c0w4Nm14bXZsK3FYZEJnTWpmZUFnWkZJZnYzNU1RNnZlbW00bDhn?=
 =?utf-8?B?ZUJ1MnRCV1ZuUGdXSHYzYy9kcUd2ZkJ1REJJRHZnVWpKdHdmVW9NZm1RM2ps?=
 =?utf-8?B?VCtnbDhoajBTd09HWk9ubXE2QmFPSXhBemFOd3g5U0NPMlY1RTFlVnhSeEY1?=
 =?utf-8?B?eXJOaDZTbjVZS01ObVhjQitkeVFCM1hpVDZpeTNsUVhkaCthUTRqbjVTWDRD?=
 =?utf-8?B?Z3UzZlhjdXpQSUNEUEJyQnpuQnduTzNHSFc4OE04eDRhd21GTkJlV2lLMlRk?=
 =?utf-8?B?SElYMXp0NjNPNnp0U2FoaytPZzRZRzN0cCtCOGY2STJsVUlnZ1UwQjlkMHBW?=
 =?utf-8?B?RjZnYUQ4OTlaNkdvUmEvTW9MdHYzSzlyWWg4RFJkeGxkQTJvR0FnVmx2OTFs?=
 =?utf-8?B?Z2dCb2tRbGFWTzJzVm0zTzdLOFNDRk5sS0NDZFplTndlWVlsRU04WjNOcVZq?=
 =?utf-8?B?VFZqeVR6eGUwRE0vejZlM0hmYlRaTXAzeHhub2xaTzZ6U0JmNUtDeWZVNEVK?=
 =?utf-8?B?d0d6YWV0V2VkUG95RWJTcDJ1aklYQUhSV2dzQjRVOS9VRlF2Vi9hc25RV1la?=
 =?utf-8?Q?g6xJL/zQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC7DA47E0B907742A255920C775E345A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a844e90-2040-4dac-1913-08d89927e268
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2020 14:13:05.2529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eAYo8rZbNcxj3yx+qyj90Enl3Rjbf1UnHgzIj/KnElHPSe8LA0mSY9p/4ewygS6FuWKuZP/qnn4ZYCuRKQzL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6539
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gU2F0LCAyMDIwLTEyLTA1IGF0IDA4OjQzIC0wNTAwLCBTZWFuIEFuZGVyc29uIHdyb3RlOg0K
PiBPbiAxMi81LzIwIDI6NDMgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOg0KPiA+IEhpIFN0ZXBo
ZW4sDQo+ID4gDQo+ID4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LiBJIHdpbGwgYWRkcmVzcyBh
bGwgeW91ciBjb21tZW50cy4NCj4gPiBJIGp1c3QgaGF2ZSBhIGZldyBxdWVzdGlvbnMgYmVsb3cu
DQo+ID4gDQo+ID4gT24gRnJpLCAyMDIwLTEyLTA0IGF0IDIyOjE5IC0wODAwLCBTdGVwaGVuIEJv
eWQgd3JvdGU6DQo+ID4gPiBRdW90aW5nIERhbWllbiBMZSBNb2FsICgyMDIwLTEyLTAxIDE5OjI0
OjUwKQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiA+
ID4gPiBpbmRleCAyZGFhNmVlNjczZjcuLjNkYTlhN2EwMmY2MSAxMDA2NDQNCj4gPiA+ID4gLS0t
IGEvTUFJTlRBSU5FUlMNCj4gPiA+ID4gKysrIGIvTUFJTlRBSU5FUlMNCj4gPiA+ID4gQEAgLTM4
MjIsNiArMzgyMiwyMiBAQCBXOiAgICAgICBodHRwczovL2dpdGh1Yi5jb20vQ2FzY29kYS9jYTgy
MTAtbGludXguZ2l0DQo+ID4gPiA+IMKgwqBGOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9pZWVlODAyMTU0L2NhODIxMC50eHQNCj4gPiA+ID4gwqDCoEY6ICAgICBk
cml2ZXJzL25ldC9pZWVlODAyMTU0L2NhODIxMC5jDQo+ID4gPiA+IMKgwqANCj4gPiA+ID4gDQo+
ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4g
K0NBTkFBTi9LRU5EUllURSBLMjEwIFNPQyBDTE9DSyBEUklWRVINCj4gPiA+ID4gK006ICAgICBE
YW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPg0KPiA+ID4gPiArTDogICAgIGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiA+ID4gK0w6ICAgICBsaW51eC1jbGtA
dmdlci5rZXJuZWwub3JnIChjbG9jayBkcml2ZXIpDQo+ID4gPiANCj4gPiA+IElzIHRoaXMgbmVl
ZGVkPyBJIHRoaW5rIHdlIGNvdmVyIGFsbCBvZiBkcml2ZXJzL2Nsay8gYW5kIGJpbmRpbmdzL2Ns
b2NrDQo+ID4gPiBhbHJlYWR5Lg0KPiA+IA0KPiA+IEkgd2FzIG5vdCBzdXJlIGFib3V0IHRoYXQg
c28gSSBhZGRlZCB0aGUgZW50cnkuIFdpbGwgcmVtb3ZlIGl0Lg0KPiA+IA0KPiA+ID4gDQo+ID4g
PiA+ICtTOiAgICAgTWFpbnRhaW5lZA0KPiA+ID4gPiArRjogICAgIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9jYW5hYW4sazIxMC1jbGsueWFtbA0KPiA+ID4gPiArRjog
ICAgIGRyaXZlcnMvY2xrL2Nsay1rMjEwLmMNCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvS2NvbmZpZy5zb2NzIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MNCj4gPiA+ID4gaW5kZXgg
ODhhYzBkMWE1ZGE0Li5mMmY5NjMzMDg3ZDEgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZy5zb2NzDQo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzDQo+
ID4gPiA+IEBAIC0yOSw2ICsyOSw4IEBAIGNvbmZpZyBTT0NfQ0FOQUFODQo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoHNlbGVjdCBTRVJJQUxfU0lGSVZFIGlmIFRUWQ0KPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqBzZWxlY3QgU0VSSUFMX1NJRklWRV9DT05TT0xFIGlmIFRUWQ0KPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgU0lGSVZFX1BMSUMNCj4gPiA+ID4gKyAgICAgICBzZWxl
Y3QgU09DX0syMTBfU1lTQ1RMDQo+ID4gPiA+ICsgICAgICAgc2VsZWN0IENMS19LMjEwDQo+ID4g
PiANCj4gPiA+IEFueSByZWFzb24gdG8gZG8gdGhpcyB2cy4ganVzdCBtYWtlIGl0IHRoZSBkZWZh
dWx0Pw0KPiA+IA0KPiA+IEkgZG8gbm90IHVuZGVyc3RhbmQgaGVyZS4uLiBKdXN0IHNlbGVjdGlu
ZyB0aGUgZHJpdmVycyBuZWVkZWQgZm9yIHRoZSBTb0MgaGVyZS4NCj4gPiBJcyB0aGVyZSBhbnkg
b3RoZXIgd2F5IG9mIGRvaW5nIHRoaXMgPw0KPiA+IA0KPiA+IFsuLi5dDQo+ID4gPiA+ICsNCj4g
PiA+ID4gKyAgICAgICB3aGlsZSAodHJ1ZSkgew0KPiA+ID4gPiArICAgICAgICAgICAgICAgcmVn
ID0gcmVhZGwocGxsLT5sb2NrKTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmICgocmVnICYg
bWFzaykgPT0gbWFzaykNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJlZyB8PSBCSVQocGxsLT5sb2NrX3No
aWZ0ICsgSzIxMF9QTExfQ0xFQVJfU0xJUCk7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICB3cml0
ZWwocmVnLCBwbGwtPmxvY2spOw0KPiA+ID4gDQo+ID4gPiBJcyB0aGlzIHJlYWRsX3BvbGxfdGlt
ZW91dD8NCj4gPiANCj4gPiBPaC4gWWVzLCBpdCBpcy4gSSBkaWQgbm90IGtub3cgYWJvdXQgdGhp
cyBmdW5jdGlvbi4gV2lsbCBjaGFuZ2UgdGhlIGNvZGUgdG8gdXNlDQo+ID4gaXQuDQo+IA0KPiBG
V0lXIHRoZSB0aW1lb3V0IGNvdWxkIGJlIGluY29ycmVjdCBzaW5jZSB3ZSBtaWdodCBiZSBjb25m
aWd1cmluZyBhDQo+IHBhcmVudCBvZiBBQ0xLLiBBbmQgcmVhbGlzdGljYWxseSB0aGUgb25seSB3
YXkgdGhpcyBmYWlscyBpcyBpZiBhIHVzZXINCj4gaGFzIGVkaXRlZCB0aGlzIGZpbGUgYW5kIHB1
dCBpbiBpbnZhbGlkIFBMTCBwYXJhbWV0ZXJzLiBJIGRvbid0IHRoaW5rDQo+IHlvdSBnYWluIG11
Y2ggYnkgYWRkaW5nIGEgdGltZW91dC4NCg0KcmVhZGxfcG9sbF90aW1lb3V0KCkgYWxsb3dzIGEg
dGltZW91dCBvZiAwIGZvciAibm8gdGltZW91dCIuIEl0IGlzIG5vdCBlYXN5IHRvDQp1c2UgdGhp
cyBtYWNybyBkdWUgdG8gdGhlIHN0b3AgY29uZGl0aW9uIGludGVyZmFjZSwgd2hpY2ggaXMgbm90
IHRocm91Z2ggYQ0KY2FsbGJhY2suIFRoaXMgbWFrZXMgdGhlIGNvZGUgdmVyeSB1Z2x5IHRvIGdl
dCB0aGUgd3JpdGVsKCkgY2FsbCBhZGRlZCBpbiB0aGUNCnN0b3AgY29uZGl0aW9uIGZvciBlYWNo
IGl0ZXJhdGlvbiBvZiB0aGUgcG9sbCBsb29wLiBTbyBJIGxlZnQgdGhlIGNvZGUgYXMgaXMuDQoN
Cj4gDQo+ID4gPiANCj4gPiA+ID4gKyAgICAgICB9DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4g
PiA+ID4gK3N0YXRpYyBib29sIGsyMTBfcGxsX2h3X2lzX2VuYWJsZWQoc3RydWN0IGsyMTBfcGxs
ICpwbGwpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsgICAgICAgdTMyIHJlZyA9IHJlYWRsKHBsbC0+
cmVnKTsNCj4gPiA+ID4gKyAgICAgICB1MzIgbWFzayA9IEsyMTBfUExMX1BXUkQgfCBLMjEwX1BM
TF9FTjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIGlmIChyZWcgJiBLMjEwX1BMTF9SRVNF
VCkNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPiA+ID4gKw0KPiA+
ID4gPiArICAgICAgIHJldHVybiAocmVnICYgbWFzaykgPT0gbWFzazsNCj4gPiA+ID4gK30NCj4g
PiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIHZvaWQgazIxMF9wbGxfZW5hYmxlX2h3KHN0cnVjdCBr
MjEwX3BsbCAqcGxsKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArICAgICAgIHN0cnVjdCBrMjEwX3Bs
bF9jZmcgKnBsbF9jZmcgPSAmazIxMF9wbGxzX2NmZ1twbGwtPmlkXTsNCj4gPiA+ID4gKyAgICAg
ICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ID4gPiArICAgICAgIHUzMiByZWc7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgma2NsLT5jbGtfbG9jaywgZmxh
Z3MpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgaWYgKGsyMTBfcGxsX2h3X2lzX2VuYWJs
ZWQocGxsKSkNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGdvdG8gdW5sb2NrOw0KPiA+ID4gPiAr
DQo+ID4gPiA+ICsgICAgICAgaWYgKHBsbC0+aWQgPT0gSzIxMF9QTEwwKSB7DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAvKiBSZS1wYXJlbnQgYWNsayB0byBJTjAgdG8ga2VlcCB0aGUgQ1BVcyBy
dW5uaW5nICovDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBrMjEwX2FjbGtfc2V0X3NlbGVjdG9y
KDApOw0KPiA+ID4gPiArICAgICAgIH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIC8qIFNl
dCBmYWN0b3JzICovDQo+ID4gPiA+ICsgICAgICAgcmVnID0gcmVhZGwocGxsLT5yZWcpOw0KPiA+
ID4gPiArICAgICAgIHJlZyAmPSB+R0VOTUFTSygxOSwgMCk7DQo+ID4gPiA+ICsgICAgICAgcmVn
IHw9IEZJRUxEX1BSRVAoSzIxMF9QTExfQ0xLUiwgcGxsX2NmZy0+cik7DQo+ID4gPiA+ICsgICAg
ICAgcmVnIHw9IEZJRUxEX1BSRVAoSzIxMF9QTExfQ0xLRiwgcGxsX2NmZy0+Zik7DQo+ID4gPiA+
ICsgICAgICAgcmVnIHw9IEZJRUxEX1BSRVAoSzIxMF9QTExfQ0xLT0QsIHBsbF9jZmctPm9kKTsN
Cj4gPiA+ID4gKyAgICAgICByZWcgfD0gRklFTERfUFJFUChLMjEwX1BMTF9CV0FESiwgcGxsX2Nm
Zy0+YndhZGopOw0KPiA+ID4gPiArICAgICAgIHJlZyB8PSBLMjEwX1BMTF9QV1JEOw0KPiA+ID4g
PiArICAgICAgIHdyaXRlbChyZWcsIHBsbC0+cmVnKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAg
ICAgIC8qIEVuc3VyZSByZXNldCBpcyBsb3cgYmVmb3JlIGFzc2VydGluZyBpdCAqLw0KPiA+ID4g
PiArICAgICAgIHJlZyAmPSB+SzIxMF9QTExfUkVTRVQ7DQo+ID4gPiA+ICsgICAgICAgd3JpdGVs
KHJlZywgcGxsLT5yZWcpOw0KPiA+ID4gPiArICAgICAgIHJlZyB8PSBLMjEwX1BMTF9SRVNFVDsN
Cj4gPiA+ID4gKyAgICAgICB3cml0ZWwocmVnLCBwbGwtPnJlZyk7DQo+ID4gPiA+ICsgICAgICAg
bm9wKCk7DQo+ID4gPiA+ICsgICAgICAgbm9wKCk7DQo+ID4gPiANCj4gPiA+IEFyZSB0aGVzZSBu
b3BzIG5lZWRlZCBmb3Igc29tZSByZWFzb24/IEFueSBjb21tZW50IHRvIGFkZCBoZXJlPyBJdCdz
DQo+ID4gPiBiYXNpY2FsbHkgbm9uLXBvcnRhYmxlIGNvZGUgYW5kIGhvcGVmdWxseSBub3RoaW5n
IGlzIGluc2VydGVkIGludG8gdGhhdA0KPiA+ID4gd3JpdGVsIGZ1bmN0aW9uIHRoYXQgc2hvdWxk
bid0IGJlIHRoZXJlLg0KPiA+IA0KPiA+IE5vIGNsdWUuLi4gVGhleSBhcmUgIm1hZ2ljIiBub3Bz
IHRoYXQgYXJlIHByZXNlbnQgaW4gdGhlIEsyMTAgU0RLIGZyb20NCj4gPiBLZW5kcnl0ZS4gSSBj
b3BpZWQgdGhhdCwgYnV0IGRvIG5vdCBhY3R1YWxseSBrbm93IGlmIHRoZXkgYXJlIHJlYWxseSBu
ZWVkZWQuIEkNCj4gPiBhbSB3b3JraW5nIHdpdGhvdXQgYW55IHNwZWNzIGZvciB0aGUgaGFyZHdh
cmU6IHRoZSBLZW5kcnl0ZSBTREsgaXMgbXkgbWFpbg0KPiA+IHNvdXJjZSBvZiBpbmZvcm1hdGlv
biBoZXJlLiBJIHdpbGwgdHJ5IHRvIHJlbW92ZSB0aGVtIG9yIGp1c3QgcmVwbGFjZSB0aGlzIHdp
dGgNCj4gPiBhIGRlbGF5KCkgY2FsbCBhIG5kIHNlZSB3aGF0IGhhcHBlbnMuDQo+IA0KPiBCYXNp
Y2FsbHkgYW55IGRlbGF5IHNob3VsZCB3b3JrIGFzIGxvbmcgYXMgaXQgdGFrZXMgbW9yZSB0aGFu
IDINCj4gaW5zdHJ1Y3Rpb25zIDspIE9mIGNvdXJzZSwgYW55dGhpbmcgbG9uZ2VyIHRoYW4gdGhh
dCBqdXN0IGRlbGF5cyBzdGFydHVwDQo+IGZvciBubyByZWFzb24uDQoNClJlbW92aW5nIHRoZSBu
b3AoKSBkb2VzIHdvcmsuIE5vdCBzdXJlIGlmIHRoYXQgaXMgc29saWQgdGhvdWdoLg0KQW55IG90
aGVyIHh4ZGVsYXkoKSBjYWxsIGZhaWxzLCBpbmNsdWRpbmcgX19kZWxheSgpIChDUFUgY3ljbGVz
KS4gSSBndWVzcw0KYmVjYXVzZSBhdCB0aGlzIGVhcmx5IHN0YWdlLCB0aGVyZSBpcyBubyBpbmZv
cm1hdGlvbiB5ZXQgb24gdGhlIENQVQ0KZnJlcXVlbmN5L3RpbWVycyBhbmQgazIxMF9jbGtfZWFy
bHlfaW5pdCgpIGhhbmdzLiBTbyBJIHRoaW5rIEkgd2lsbCBrZWVwIHRoZQ0Kbm9wKCkuIFRoaXMg
ZHJpdmVyIGJlaW5nIG9ubHkgZm9yIHRoaXMgU29DLCBJIGRvIG5vdCB0aGluayBpdCBpcyBhIGJp
ZyBpc3N1ZSBpbg0KdGVybXMgb2YgcG9ydGFiaWxpdHksIGZvciBub3cgYXQgbGVhc3QuDQoNCg0K
LS0gDQpEYW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFsDQo=

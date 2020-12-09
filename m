Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7492D3A73
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbgLIF1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:27:48 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:50724 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgLIF1s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607491668; x=1639027668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=P6AhmMdvX3SaB8wW5xHLnlJikkU8D2CUop9+evyPJWU=;
  b=pm6z99cWW1QB7hs2cdBPTQCftihxaTCfsp8/OREqnY4W/LJzcvyNTHHp
   qUjX8r7fH/nLvyQRTbcfy7QeDEblhL+hsRRIcLEqSOd5Jtm8Mc5CJhGn3
   CnjTSgaAfnXNkyQlyr2pq2MAKkx52cQIiSMTTu0+Ro00uXGbHtYqirRdH
   3wLTAMu8EfK+hnLYrYLkbM/0IuvMEbV1i3HW7HrbiYy/wdqZJsfn/1vQX
   H7HFtjgUC9X7EIszKsvygdjjre03AhkCCRI9Y6YQ+zlzoFfRJjwXCaTfq
   jOwl+bKXsEIm94Ws4oavAAzE/9nXv7N36yHavhAB50s3+avvnAU2Yf03i
   Q==;
IronPort-SDR: EZe0Nt3VmWC/3gbnkrMUS5K8CDlBVqnh7IcOPG8xpsyKXNzN+hZrIu+mbk8wgPaUvhf3Kvb1jo
 GiYPlDdBHStQYOeYV8fLfvVP+0LYSQRdPg1etZaHJaEvq9H4BFcZ6Nvs5Lhb+JKCZ2rCpS648I
 7oE2h6qktHu10r8oR7Q5d3sca3Nl8FKqUvqAJFw31eaCo/89CV1qV8gYS0M+izT/NyoSHUN3mV
 4tdEaY00+arc6ImjFFccR/ad4dECpO5EstTBb4lzphXKM5tmbiIu66pwnnBJ4WsLZUIePjY0TL
 wek=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="264903418"
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:26:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bserNzRQbkjPOpHUWtFiaCKgPhScvioRvf2ANLTJg/hBPA7hfP6MCDoHd6DclDjjkoVjzcONc4glPn8yUDylmzHO73i9LrqhBxbRp8JgFKe5u3DMpKp51TAz589yHo2ksDAam+HESjr+tHrcmMVll/YjpdBf2BP/1flBZXo5j8he9sldU0/oZIWFtkLqxyrT8aRqqMgLLU5u7hPVYVPgt8aLg4pN0pTIZ0lWX46bSC4PB6pguGrrV5fJSs5jzpdFtgjKMZdQC6xgTYBoIhhp/yV8Q39bvDbMBmaRGLGyQjiQZICN/Sz6wdfvlTYs/KxQ1LSQDyTRKf+Q5Uu/WtWo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6AhmMdvX3SaB8wW5xHLnlJikkU8D2CUop9+evyPJWU=;
 b=BpihVTXSpevs3ya//e+0yTGh7Qg0WuY3LfJQ7HypVTobPrNWI5uTrAOgkzTem7Auh6cN/RvbgIcI/cFxcTs+1JQ8imKEBORI2ErUqIxz0qyxAe1Xzw91oos1v4dmu6yfaGPKUnoPVglbRdjoQpbEvk53uAJU0nqcjzZdzWpEg0wDAwgE8geCtliT2Dl3pUnYPxnJ4ofmv85i1aRwYQNGr/sCXVfLVk48cpCfAaCoXch0RrVi11AerOcykXhVrLFgkGs+4Au1glt/8T7rJluJv/hfrUPK/ocT80Z+I1Jh8tmqaiTbKMyIsb4nm3BqLmmKK4tJSaOY7+WcwMSfjhnDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6AhmMdvX3SaB8wW5xHLnlJikkU8D2CUop9+evyPJWU=;
 b=QczG1i3W230v/HG/4qQO0OatR3/kQUhQXygnzzQgYRbuMJz7XucS3Jpm2IgtJ4GOXqS2/3pPl2kK3pyXov3/P4kioYeXShZac6uhssh56qXxUM06lHI2EVgsSglTi66WtqxeoWuhpZy6MkQu06NMrzUq4WGtdjGfT01PI3gclLA=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6570.namprd04.prod.outlook.com (2603:10b6:610:64::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Wed, 9 Dec
 2020 05:26:40 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 05:26:40 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v5 12/21] riscv: Add Canaan Kendryte K210 reset controller
Thread-Topic: [PATCH v5 12/21] riscv: Add Canaan Kendryte K210 reset
 controller
Thread-Index: AQHWzTSPIz1S/nfdakuQ9rbvqwZfmqntFJgAgAEovIA=
Date:   Wed, 9 Dec 2020 05:26:40 +0000
Message-ID: <57d4ae6e06551a56e41a4d50078ef51cbad67083.camel@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
         <20201208073355.40828-13-damien.lemoal@wdc.com>
         <4d0a0c80e57b156b7d86dfca250285048ab30825.camel@pengutronix.de>
In-Reply-To: <4d0a0c80e57b156b7d86dfca250285048ab30825.camel@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: 398932e8-bc18-489f-6f3c-08d89c03020f
x-ms-traffictypediagnostic: CH2PR04MB6570:
x-microsoft-antispam-prvs: <CH2PR04MB6570BEBDDA3416DA8A243064E7CC0@CH2PR04MB6570.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6fnvXe3tt4MmPESgOxsa0+mS3cIy92lmykMNBg5BPebe0tVlBTKxKseKl1BTpZTRGy6MlMalnMBxZoHL833wxcjIjHDxuj+ndaRPXvxQxV60hLMPDpiapdnEoTDjo69haNaI5w57wKHS+edc2miuUwcwL0up8pu7pZff0cBBcPkIdT5C7lt4br74Ij6sw+dSZH4XKZ9tc6+wfFfRKWBUQDgomycRcMHZ8Wc+eX1k4cL7gWwIa8rh1TUafNfwhpx7X7shcVpt1yRWzP84wBLvxw9N6e++UjHWfXmhyiqGUsQEJhEjgH+DGWLdF+max1z2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(6512007)(6486002)(186003)(2906002)(86362001)(7416002)(8676002)(91956017)(71200400001)(66556008)(66446008)(8936002)(4326008)(2616005)(110136005)(508600001)(66476007)(36756003)(6506007)(5660300002)(66946007)(76116006)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aHBuY1J0Ry9nbWx1eVlwK2hrQ1ZaYkROY0lueUUzQ2poaWpqbEpyQ01wSEZC?=
 =?utf-8?B?aXNCVzVkU3RrdzlnKzhMV0pCdnZHV1FYT2ZHazJIM1B4Q1htSUc1ZmdydTJV?=
 =?utf-8?B?ZEFYVnFCNUZLWEdEVlQ5RG9yVXVsdEJDbGNMcnpPSEhlRE9uY0VRWFlmbEpk?=
 =?utf-8?B?K01BOFo2UFQzZXFJUDhJTUNjWmtZbVN5ZDduMHU2SHM0MVRCYnE1MCt5ekNZ?=
 =?utf-8?B?bm9haTdFaDdNOEFXZERRVmRQQzdkT3RxVTZvZW5VWXhuRU9xVnFMU1M4QS9w?=
 =?utf-8?B?bkliZ0tqUmF3TXdGcUJ5dmtGeTVnZG9aUTJxdlVSWkc1eFh6OGJpaXpYMHpY?=
 =?utf-8?B?RzNOYmJ0aGJ1dDBIWElIdWliRGpXa25rU2E4TnkyLzdCNkhBaW9mN2JUZDA1?=
 =?utf-8?B?LzhHYU9SU2J6OTkxcWlaM2hWVSttdlZlTGJZRFpPbm9najFRSmx5TXVTSk85?=
 =?utf-8?B?YXFpaG83ZnBRSVNkc0prbExEblZqblRsOVZyVEVWVHRyc3IwdGVXQkx4SEdn?=
 =?utf-8?B?U2YyMEx4V1ZvRmdYTTk2M0IrU1NMc0xaQmlVUzJkWHZlSXhEUUZzRTdsZmRQ?=
 =?utf-8?B?OEtUNUgrSVFQNUJFdGtPNHptL2ZjN1M1cjVOdTd3NHp4RlQyUHlRWGF2ZDlv?=
 =?utf-8?B?cFkzcHBUYytEYVovMVRER1JJZ2NPQm5wU3ROMDkxeklKUnQrU1pURTE1Yk5u?=
 =?utf-8?B?bFM4ZGZ5SEJkcTZ2dVBKckxWVFdndWxMREEvWHVieXNmQU5pUHNtZFQycllP?=
 =?utf-8?B?Qzl6dnJoa0ttTHNxNFNjVzNLSVhSQjA2R21xNjdJTG9NWHRVRVJQZ2FjOG9Z?=
 =?utf-8?B?cUt5ZWxwNUVQRjNDUmF3bjA2ZnpaMVpXVEExOTRNMFhReWE1bWY5QTFpS2lC?=
 =?utf-8?B?M2tMbGVuSDI2cWlhRkFYczFJV1A0QnVoaHM4dFhyWDZlMlNpaTFoTmRWSGtE?=
 =?utf-8?B?RXlvYXBVUEY0eFM2eFB6eGNPc1k2dU10d1JYUjFsVWZWMWFBOU1lVzA2Z3pz?=
 =?utf-8?B?M0xaWmsvNERkYnRJcVBQTnIzdjByTXd4MVZUTnNCNXd1d3UyYVdmZ2xpUVNl?=
 =?utf-8?B?SnhsR0wxRHVUR28xYW0wcFlIYlBwa05HNDdQTHpDdHpMaysyalpjYkt4K3FT?=
 =?utf-8?B?Wm9tWFdLRzdqZ0R1RXlGQTNMVEt4TzRINFZPdkxNRVk1U3BiMEs1bHZsc2V6?=
 =?utf-8?B?QnZpNVIzeTYra2lFMVZ3MGR0cFB2SjNmZC94Umt3SG5Kc1ZoRndTaVVXcjBn?=
 =?utf-8?B?WENwTFBSdGhUd3I2YXVscHVVTkpZWE1QRjZQL0RYek5KTkdDZGZVeExwZ01C?=
 =?utf-8?B?MjNVa1RpZnlxdnBnSm9ycEhHTXVUVWtrZCt4bzVyZmVDNDV1UG5KbHdWVGJB?=
 =?utf-8?B?STFkeUxCR1FCL3RUeVZMNU95L3JXSUFIT3Y1VGpTS3ZCemNMQTFNakZLWEgr?=
 =?utf-8?Q?Yy9Yrbja?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <78BAA7F2FFE18D4D85E00F3C90043326@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398932e8-bc18-489f-6f3c-08d89c03020f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 05:26:40.5121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m07qDmQZmRGzK/r4s0+tCn+nRbsBrzhCyl/iycCQ6lPgdyeQdQy/h28ukS3hz3wIzOFxCUXvDnqweDavMCqu8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6570
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KT24gVHVlLCAyMDIwLTEyLTA4IGF0IDEyOjQ0ICswMTAwLCBQaGlsaXBw
IFphYmVsIHdyb3RlOg0KWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9LY29u
ZmlnIGIvZHJpdmVycy9yZXNldC9LY29uZmlnDQo+ID4gaW5kZXggMDdkMTYyYjE3OWZjLi5kZWQ0
NDg4OTQ4NGYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9yZXNldC9LY29uZmlnDQo+ID4gKysr
IGIvZHJpdmVycy9yZXNldC9LY29uZmlnDQo+ID4gQEAgLTgyLDYgKzgyLDE2IEBAIGNvbmZpZyBS
RVNFVF9JTlRFTF9HVw0KPiA+IMKgCSAgU2F5IFkgdG8gY29udHJvbCB0aGUgcmVzZXQgc2lnbmFs
cyBwcm92aWRlZCBieSByZXNldCBjb250cm9sbGVyLg0KPiA+IMKgCSAgT3RoZXJ3aXNlLCBzYXkg
Ti4NCj4gPiDCoA0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+ICtjb25maWcgUkVTRVRfSzIxMA0KPiA+
ICsJYm9vbCAiUmVzZXQgY29udHJvbGxlciBkcml2ZXIgZm9yIENhbmFhbiBLZW5kcnl0ZSBLMjEw
IFNvQyINCj4gPiArCWRlcGVuZHMgb24gUklTQ1YgJiYgU09DX0NBTkFBTiAmJiBPRg0KPiANCj4g
UGxlYXNlIGVuYWJsZSBjb21waWxlLXRlc3Rpbmcgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcywgZm9y
IGV4YW1wbGU6DQo+IA0KPiAJZGVwZW5kcyBvbiAoKFJJU0NWICYmIFNPQ19DQU5BQU4pIHx8IENP
TVBJTEVfVEVTVCkgJiYgT0YNCj4gDQo+IEFyZSB0aGVyZSBub24tUklTQ1YgU09DX0NBTkFBTiBk
ZXZpY2VzIGZvciB3aGljaCB0aGlzIGRyaXZlciBzaG91bGRuJ3QNCj4gYmUgY29tcGlsZWQ/DQo+
IElmIG5vdCwgeW91IGNvdWxkIHlvdSBkcm9wIHRoZSBSSVNDViBkZXBlbmRlbmN5IHdpdGhvdXQg
bG9zcyBvZg0KPiBpbmZvcm1hdGlvbi4NCg0KSSBhZGRlZCBDT01QSUxFX1RFU1QuIEkgYWxzbyBy
ZW1vdmVkIHRoZSBSSVNDViBkZXBlbmRlbmN5IHNpbmNlIFNPQ19DQU5BQU4NCmFscmVhZHkgZGVw
ZW5kIG9uIGl0IChkdWUgdG8gdGhlIFNPQ19FQVJMWV9JTklUX0RFQ0xBUkUoKSB1c2UgaW4gdGhl
IHN5c2N0bA0KZHJpdmVyKS4gU3RyaWNrdGx5IHNwZWFraW5nLCBJIHRoaW5rIHdlIGNvdWxkIGFs
c28gcmVtb3ZlIHRoZSBTT0NfQ0FOQUFODQpkZXBlbmRlbmN5IGZvciB0aGUgcmVzZXQgZHJpdmVy
LCBidXQgSSBkbyBub3QgcmVhbGx5IHNlZSB0aGUgcG9pbnQgc2luY2UgaXQgaXMNCmNhbm5vdCBi
ZSB1c2VkIGZvciBhbnkgb3RoZXIgU29DLg0KDQpJIGFkZHJlc3NlZCBhbGwgb2YgeW91ciBvdGhl
ciBjb21tZW50cy4NCg0KVGhhbmtzICENCg0KDQotLSANCkRhbWllbiBMZSBNb2FsDQpXZXN0ZXJu
IERpZ2l0YWwNCg==

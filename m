Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210892EF189
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 12:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAHLmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 06:42:11 -0500
Received: from mail-bn8nam11on2048.outbound.protection.outlook.com ([40.107.236.48]:8929
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725791AbhAHLmL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 06:42:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvc+iz19ZAFQ6OE1BCsMotuWDfYLgtOiurrXusbOM2RAPqsb5Un/9SuigyF31xXbJE94ERuVMORUBYUqJ6m9qfHgK4JEP9IN5UaEut+TzxMPseez/cyvJwcrs+RDke6GzwCBBtogFFaKX8MIoJQjfSM7Y/yygTrI4kHrk5TISfzwMDlMqZB3Pl0QITfY/ud7m+Y0nzTWxqA36VVPhHf0ftTIDXpbIiuzrhSmJRQ6X/cJ+yMDJevBS8czSbBviIm3zice5WXzLXiVbHQn+lWouZJTwulrWFeyk5oP/41j5caLdOGez+85LBf2jjhWsggqXHCZgc3e22Q0qeHT0iQfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muLcSyP+18BD25AL7apsd+fRZ9yrnKn4DryLjglLXwI=;
 b=cmeqZJkuR25dChX2b6OaRTfS9I70PuJjBuRRdcrPuGheQJHQIh/eHjR/9N3Kbc5jt00nPcsajghD92GnApIzW82LNDd91y66nXNPDdYDuivAjtZ2+PXpgTwcu7DpG6pfeD4/3uG8EjRGA6FJTNZUTZR2B98BXUXFqa8m7JUzcf5LXxpKUX0MiyaDeJDfXFcqvy9KajXInYlZI/z2VBXOzQ3qtBVmn+SjSMj8om2zKR68fnQSWlRHtl7MCWY0uZjAA+l4C9JjXAeCw9VWH0ihGs79IZdDOJnN2d0wa2VktLMO4bwkE+S7/Gw4f092h96xtyXnoM1t4FYz127deoe/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muLcSyP+18BD25AL7apsd+fRZ9yrnKn4DryLjglLXwI=;
 b=VmCCnUaJMFzO+I/TOim1kvoQz4TLLPlnFj4zaQSpLQCIXvdPFqrKBUyfOVexiAPjacW2mkjn3LFb2trXPGaSSRSiNiPERohbCR1/tlVTgE7DeUDwoCdf7zMVbPGS8x+pNkvchUJZEzfq9XSc0R7rCq7XD4ITdYgVYWlIs+qMn74=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB5180.namprd02.prod.outlook.com (2603:10b6:5:4e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.23; Fri, 8 Jan 2021 11:41:15 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::c43b:55a6:66e1:b771]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::c43b:55a6:66e1:b771%6]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 11:41:15 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Robert Hancock <hancock@sedsystems.ca>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH V4 4/5] gpio: gpio-xilinx: Add support for suspend and
 resume
Thread-Topic: [PATCH V4 4/5] gpio: gpio-xilinx: Add support for suspend and
 resume
Thread-Index: AQHW5CdOeyF82PxTQ0Kuh1KKVm8QZqob672AgAGsVIA=
Date:   Fri, 8 Jan 2021 11:41:15 +0000
Message-ID: <DM6PR02MB538673699067F89F6F167121AFAE0@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
 <1609936000-28378-5-git-send-email-srinivas.neeli@xilinx.com>
 <CACRpkdYLp0uuB-QO5HvLH222TkCjk54JmftveHgpiW1JExF7DQ@mail.gmail.com>
In-Reply-To: <CACRpkdYLp0uuB-QO5HvLH222TkCjk54JmftveHgpiW1JExF7DQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f8b2bdc3-fc32-497f-53c9-08d8b3ca4e8f
x-ms-traffictypediagnostic: DM6PR02MB5180:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB51807617C9597D645FB0B21AAFAE0@DM6PR02MB5180.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1HgVBb5gsa37h9RJlQQb9JEuQChAkRsJ9xTkJmHZK8diebR2BryOLWCCx1ZtqC7nq9ZptQTtnrN69Qyhba+/BkgSQpmoGKECwFVTUwVMV4E+DPKE8ahQoRbK4UrzjJe7qQQ+Rf8pKQBeWKic3XoieEnND8VjiQRuJLaIRnFxKjq14+AOgtNND/u/U171lozaVemaXQYsOYsQY+SqmAwBYLGIkFcpBWiCNxhirkrnvYIvYbS50zgB8q6bjPecqfOeXjQxcQep9LRDdcMfbzB3H8+8kBAtZKhS6YxCZ8y5aEUUYC7Mnrou1PBkXr6DDKIf0Wc+BOnpIwNzKilZl+sFyyrQM1Ij6qXoKvnfRZ4J+M7TESJHQeEQ70UdiVU2lpOVpnwtFtW7bc+UZeGjG46JFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(6506007)(54906003)(15650500001)(9686003)(55016002)(5660300002)(71200400001)(66476007)(52536014)(316002)(7696005)(26005)(66556008)(478600001)(2906002)(86362001)(8676002)(66446008)(66946007)(6916009)(186003)(4326008)(53546011)(107886003)(64756008)(83380400001)(76116006)(8936002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UHgxOTJ6NHRCcUFrd2ZRUldJOVN1ZFdERllWRVQ4Mm1QaU56TzZRRUtZdnpE?=
 =?utf-8?B?MzJMQTFPajVQcHdqWlo1bGRwL0UzcWIzSURvNEhmcDM5amlac01ORXB4VjhF?=
 =?utf-8?B?TEwxMWFoanVmemVtNVBUOWhVWWxFdFZqMGlTSEtNSFJCUEl1VWJoZVcwYmVT?=
 =?utf-8?B?MVYycXhqU0lacWlJOTRUMEJEVTdRN3JDNXZuVURZcm5wWDV5bDJUeXVBMEdC?=
 =?utf-8?B?ODFUMGFycnl3UHdtajdTSTVOYTZMMzM2cDYwb0oxYWo2azNTN3dNVTlTRFRw?=
 =?utf-8?B?cVEzZ3RUanBxRUI2cVR1bkdOV1BnWjJvdjJzOEx4dzE5V2xIODk1bkM5bEha?=
 =?utf-8?B?c2MwQzNrZ3pFekZodGpCQklZMU1Ebng4STNxdm5IblJZSTlxQjhqalNsRHVU?=
 =?utf-8?B?MzVDajYrTjFGdkVGMkVQNjFPVWxmMW0yTXlGalJuSkxVU25OeExWR2RwcW80?=
 =?utf-8?B?N1Vtc0gvZnFPalZEaFlPMzJGbVJPMVAyOWJRaVNKM3dJc2cwOHNFNjBINnZn?=
 =?utf-8?B?S1oxeWpwRWRwNldyUnlKVTZ2YWVId2VNRXVZVXN0UWFQSnZudXpNbnlpaGZX?=
 =?utf-8?B?NVBweU1ZUFRjNUVTbEV2a2NSRHFaWktLSVJMR2t4L0tkc2todHgrd0Q2bTRW?=
 =?utf-8?B?YWFnU2dXUkdmZTB4VllhRFo1Q2VteXRpSmJxcG42REN1KzAwOFErV1RaQTk5?=
 =?utf-8?B?cGJQYUw3bjNRTU1tZkJMRW9veC9TcGhNS1RGZ2szWTlDTXh4K05CWEs0UCti?=
 =?utf-8?B?RXdRYktGT3NqLzNPcTJoVGFXQlh1RUhjMUU0aGpwN0lQNnZQdkRUdVBNUWd0?=
 =?utf-8?B?MCtDeW1xeFpPTmJMTUlIbTVlWllmMlh5K0lVODF2MU5GZVZIU05MOW9acFNs?=
 =?utf-8?B?TFVzTFpuc3VlTXdVaGpONE13YVhCQ0dZOTd0RVQ5bXVHbWlxV0tNcU42eWhU?=
 =?utf-8?B?dVB3Y1NMcHlrRm5JNG1oWHdqN25vNW5lcnRYMjl2YVpCUlp5ZVAwOWpacEhp?=
 =?utf-8?B?ZUNSSUpwVjNmeXdXSDRkMS9Wb3l5Y0lNQmF4cS91bkQ3MFp1c1UwVHJ4dy9C?=
 =?utf-8?B?aDU1UXU2Z0RVZEZtcG9RZVlCMU4yREdNMGN2S3pZZGxpSWtYSiswazgrckgz?=
 =?utf-8?B?OEpFSERRRFB4UVJUSTlLKzdybHlOa0VvWElLb2hrY0dNTHdpTEZiYzdoWnF0?=
 =?utf-8?B?QXlVWlMvYU5VaVJQZDBTY0VZZEorTmtEQUVGMXR3c2dEQXp4NWkweHVaeWxV?=
 =?utf-8?B?ZFd3a2RCVmhjZkU5cFVueTRzQk5oQjZSRDRjc2xib1BQTlRYRFNQUVdTajAw?=
 =?utf-8?Q?iKU9F3hhNjTZw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b2bdc3-fc32-497f-53c9-08d8b3ca4e8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 11:41:15.4557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/IgKwKfAIivGjdPD6crBdXQibOweVt6uNWVf9UYqLd8h7zQBpK56rJYuO3BeMbX754DHxGJeYVI3ZTxcz9/8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSmFu
dWFyeSA3LCAyMDIxIDM6MTcgUE0NCj4gVG86IFNyaW5pdmFzIE5lZWxpIDxzbmVlbGlAeGlsaW54
LmNvbT4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5j
b20+OyBNaWNoYWwgU2ltZWsNCj4gPG1pY2hhbHNAeGlsaW54LmNvbT47IFNodWJocmFqeW90aSBE
YXR0YSA8c2h1YmhyYWpAeGlsaW54LmNvbT47IFNyaW5pdmFzDQo+IEdvdWQgPHNnb3VkQHhpbGlu
eC5jb20+OyBSb2JlcnQgSGFuY29jayA8aGFuY29ja0BzZWRzeXN0ZW1zLmNhPjsNCj4gV2lsbGlh
bSBCcmVhdGhpdHQgR3JheSA8dmlsaGVsbS5ncmF5QGdtYWlsLmNvbT47IFN5ZWQgTmF5eWFyIFdh
cmlzDQo+IDxzeWVkbndhcmlzQGdtYWlsLmNvbT47IG9wZW4gbGlzdDpHUElPIFNVQlNZU1RFTSA8
bGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnPjsgTGludXggQVJNIDxsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBnaXQgPGdpdEB4aWxpbnguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDQvNV0gZ3Bp
bzogZ3Bpby14aWxpbng6IEFkZCBzdXBwb3J0IGZvciBzdXNwZW5kIGFuZA0KPiByZXN1bWUNCj4g
DQo+IE9uIFdlZCwgSmFuIDYsIDIwMjEgYXQgMToyNyBQTSBTcmluaXZhcyBOZWVsaSA8c3Jpbml2
YXMubmVlbGlAeGlsaW54LmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IEFkZCBzdXBwb3J0IGZvciBz
dXNwZW5kIGFuZCByZXN1bWUsIHBtIHJ1bnRpbWUgc3VzcGVuZCBhbmQgcmVzdW1lLg0KPiA+IEFk
ZGVkIGZyZWUgYW5kIHJlcXVlc3QgY2FsbHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTcmlu
aXZhcyBOZWVsaSA8c3Jpbml2YXMubmVlbGlAeGlsaW54LmNvbT4NCj4gKC4uLikNCj4gDQo+ID4g
K3N0YXRpYyBpbnQgeGdwaW9fcmVxdWVzdChzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25l
ZCBpbnQgb2Zmc2V0KQ0KPiA+ICt7DQo+ID4gKyAgICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiAr
ICAgICAgIHJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoY2hpcC0+cGFyZW50KTsNCj4gPiArICAg
ICAgIC8qDQo+ID4gKyAgICAgICAgKiBJZiB0aGUgZGV2aWNlIGlzIGFscmVhZHkgYWN0aXZlIHBt
X3J1bnRpbWVfZ2V0KCkgd2lsbCByZXR1cm4gMSBvbg0KPiA+ICsgICAgICAgICogc3VjY2Vzcywg
YnV0IGdwaW9fcmVxdWVzdCBzdGlsbCBuZWVkcyB0byByZXR1cm4gMC4NCj4gPiArICAgICAgICAq
Lw0KPiA+ICsgICAgICAgcmV0dXJuIHJldCA8IDAgPyByZXQgOiAwOw0KPiA+ICt9DQo+IA0KPiBU
aGF0J3MgY2xldmVyLiBJIHRoaW5rIG1vcmUgR1BJTyBkcml2ZXJzIHNob3VsZCBiZSBkb2luZyBp
dCBsaWtlIHRoaXMsIHRvZGF5IEkNCj4gdGhpbmsgbW9zdCBqdXN0IGlnbm9yZSB0aGUgcmV0dXJu
IGNvZGUuDQo+IA0KPiA+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHhncGlvX3N1c3BlbmQo
c3RydWN0IGRldmljZSAqZGV2KSBzdGF0aWMNCj4gPiAraW50IF9fbWF5YmVfdW51c2VkIHhncGlv
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IA0KPiBUaG9zZSBsb29rIGdvb2QuDQo+IA0K
PiANCj4gPiAgLyoqDQo+ID4gICAqIHhncGlvX3JlbW92ZSAtIFJlbW92ZSBtZXRob2QgZm9yIHRo
ZSBHUElPIGRldmljZS4NCj4gPiAgICogQHBkZXY6IHBvaW50ZXIgdG8gdGhlIHBsYXRmb3JtIGRl
dmljZSBAQCAtMjg5LDcgKzMyMywxMCBAQCBzdGF0aWMNCj4gPiBpbnQgeGdwaW9fcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpICB7DQo+ID4gICAgICAgICBzdHJ1Y3QgeGdwaW9f
aW5zdGFuY2UgKmdwaW8gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPg0KPiA+IC0g
ICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGdwaW8tPmNsayk7DQo+ID4gKyAgICAgICBpZiAo
IXBtX3J1bnRpbWVfc3VzcGVuZGVkKCZwZGV2LT5kZXYpKQ0KPiA+ICsgICAgICAgICAgICAgICBj
bGtfZGlzYWJsZV91bnByZXBhcmUoZ3Bpby0+Y2xrKTsNCj4gPiArDQo+ID4gKyAgICAgICBwbV9y
dW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7DQo+IA0KPiBUaGlzIGxvb2tzIGNvbXBsZXggYW5k
IHJhY3kuIFdoYXQgaWYgdGhlIGRldmljZSBpcyByZXN1bWVkIGFmdGVyIHlvdQ0KPiBleGVjdXRl
ZCB0aGUgZmlyc3QgcGFydCBvZiB0aGUgc3RhdGVtZW50Lg0KDQpDb3VsZCB5b3UgcGxlYXNlIGV4
cGxhaW4gbW9yZSBvbiB0aGlzLg0KV2hhdCBpcyB0aGUgbmVlZCB0byBjYWxsIHBtX3J1bnRpbWVf
Z2V0X3N5bmMoKTsgaW4gcmVtb3ZlIEFQSSA/DQoNCj4gDQo+IFRoZSBub3JtYWwgc2VxdWVuY2Ug
aXM6DQo+IA0KPiBwbV9ydW50aW1lX2dldF9zeW5jKGRldik7DQo+IHBtX3J1bnRpbWVfcHV0X25v
aWRsZShkZXYpOw0KPiBwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsNCj4gDQo+IFRoaXMgd2lsbCBt
YWtlIHN1cmUgdGhlIGNsb2NrIGlzIGVuYWJsZWQgYW5kIHBtIHJ1bnRpbWUgaXMgZGlzYWJsZWQu
DQo+IEFmdGVyIHRoaXMgeW91IGNhbiB1bmNvbmRpdGlvbmFsbHkgY2FsbCBjbGtfZGlzYWJsZV91
bnByZXBhcmUoZ3Bpby0+Y2xrKTsNCj4gDQo+IEl0IGlzIHdoYXQgeW91IGFyZSBkb2luZyBvbiB0
aGUgZXJyb3JwYXRoIG9mIHByb2JlKCkuDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K

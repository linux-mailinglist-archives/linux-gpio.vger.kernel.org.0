Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311B92DBB3F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 07:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgLPGao (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 01:30:44 -0500
Received: from mail-eopbgr1400132.outbound.protection.outlook.com ([40.107.140.132]:53504
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725852AbgLPGan (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 01:30:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS7K9Nik+ZimyTCJEHa2tJBn/5TOM3/oZGLy+pIQOwPbS2JWOsoQgQrRdOjo4X8toDZ7MHoQq/zfHraEP0UNBqvxnNQMkh5oTcEx/zVy5rFlbcBgDnOPrU8/H7eUFKCN8iI4ZDC35bn98Agu/b3KLj6BOn6iAQxAH38iYC3TidDLH2v+bbGch2m5/F6LJPpS5/2ZLET3GJPhUMN4Hlm1mfYPZGXnHBYqHrpqkbWqPTSEspbXnoMay2/nvTBbaKn7kyMBXfRiGMJLEf6EsRcylVxNMKDYtUZbYycp2iKZrOzgTs75jZd4rrenFlAulPW4UsR969W+523SpX8E0kavlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id9kOEGAdM9l03Eo2Q1tdGooRVR4XgluRdHH/vRL7Wg=;
 b=EyhCW1u3Lal/n7EnzKeVH++9A/DMccgb9GD37PtJhoBwmH6XyCPmYIh5ZwaVFmwxRHL67CjzbJYX2ObiW9udikU1zeCNWjdguSJ0Uv3k6F0S+2s8XXPzVFXqRpWMZV6Hlq6fP3hVj1jR9DjQov3jM77fSVOoFvaYldt1NaO0Cirb66YSYe4yueCcQ2eGqOQqoSHg2axBzcnZtm+Qfb4pCYMQgEdw6VDs4u2T11AO9W7v+CFTBiBqLmZ/MvBVasXfClocNm07STLnv2up0WPWd1H5BqA0zbDUge8+u61bZeU2iKCJVUUjSe9lUN9O3zUxOMuCm4fhNlM+zw/Nk47z3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id9kOEGAdM9l03Eo2Q1tdGooRVR4XgluRdHH/vRL7Wg=;
 b=MoLqNY5mnjky9RO03fvpg5JuzLLU4X3jKLuCt/hjOgnaUwHHMWqHLoE3zslxUimGfvKuSTJj5TAYE2Zrp6/ntD+L82R2aafEKpD+WVvaLdFnZXanPj+v4ml2FvL6chcd6RUS6UAiSjw07WEvItMxX0N7Aujw64fK5kTWZMgDSyA=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY1PR01MB1530.jpnprd01.prod.outlook.com (2603:1096:403:3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 06:29:54 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 06:29:54 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Topic: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Index: AQHWz7CtcBQdrCMyek+ipxZCKFImbqnxywEAgAaNBgCAAALugIAAp3YwgAA/nwCAAAbqUA==
Date:   Wed, 16 Dec 2020 06:29:54 +0000
Message-ID: <TY2PR01MB36922F60FD7C2C0E4683C6A3D8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <cbb8c9b1884ea5e535bcafda1218b941bd665c21.camel@fi.rohmeurope.com>
         <CAMuHMdVgo1fuY9jPpxUJiCOmN4Ahs7YXddzUfKH+4106i1xiuA@mail.gmail.com>
         <CAMuHMdWuoRMsNMPKgni3HENRT7RnCTyEjs5Zy2r4gw9f2B0Cng@mail.gmail.com>
         <TY2PR01MB3692684E65CD04B38BD0B69BD8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <0c6d88d25ae3d8cbed169c0efe5918844d8f47d9.camel@fi.rohmeurope.com>
In-Reply-To: <0c6d88d25ae3d8cbed169c0efe5918844d8f47d9.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:68c8:85be:c13a:922b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5aecb7f2-5f38-49aa-1c3b-08d8a18c0064
x-ms-traffictypediagnostic: TY1PR01MB1530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1530B833A0C71643AF4E74CED8C50@TY1PR01MB1530.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K4Aok7rplnnUcIhnLZXW7ZJ03ES5hLW7hUwf0v/w+b98BpjLbWO0KcFfXj9GnHI/NqBTT7RVINw57l3jwuuz1u9HYQvNq3FS4s8MS86ImcT++rnV+YaXpOrD4w4QeYltGC8SuXHveJFRzLewITCRrl8KbxEKXS+tbV9l7G7HkwIWDMeyRPxkvZFhwrX/55FvAhMUtuZsfPAAc5N2TTJJ/o5DOEzarsYz4Uhp0zt3zcR1N+Pvzp3qpPwnv3eG2CSVInAGhVkJ/fJ30Ja8WkwWJG5WDfQjp39VjIK6FcFj/NN9gR1lREKAyG4DrdPOLDPdNXd8w3d3pR56qMja/3qx8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(5660300002)(71200400001)(316002)(66446008)(110136005)(6506007)(66476007)(66556008)(54906003)(64756008)(33656002)(66946007)(8676002)(52536014)(4001150100001)(478600001)(186003)(9686003)(8936002)(53546011)(86362001)(76116006)(55016002)(2906002)(7696005)(7416002)(4326008)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RFhWNnlxVXdMc3Y1QTFrT3ZieVNHcFlIbUVETWRJbUlzOGxHQ3o4emRndis5?=
 =?utf-8?B?bXByNGZwTEM4bzRjZER5SmdNWUIxTmw4WTI0V1Z3cW9ESjl2TTFjdkJ6OW9H?=
 =?utf-8?B?SmtLNVFEVVBUUVhyaldtNG5MWUttY1YrS0c3dFpaYTdybUIxcXVkV2YvbFJP?=
 =?utf-8?B?dWV0d3FjY1RyQjhreGlHbTA5RmJOaExaV05BR3VpQy9jN3pibnBZblRDUkhN?=
 =?utf-8?B?TE1MdE4wd2ZFdzZBYUxlNGZZZnR6U0JvWTVXMkVmTCtEbC8yeWxQVVpZdnhU?=
 =?utf-8?B?S3dMSENvZkJVUWZxa0ZLVVlKNUp0cUIwR0t1eUkrMEl0MTZUa2hCQ2F4VkpT?=
 =?utf-8?B?bUd6aG52RXFCTTk1OEtkMGI5UjluRzJDb0JJRTNMblZpV1VBK0lJZlVncXZY?=
 =?utf-8?B?QnpGT1ZPNklpcWtPYVhZV1hnWjJYU0RNMjlHYVdWWHRvVlZHcjVVM0ZOWU11?=
 =?utf-8?B?MHNEdFFlRmkwUE11R2QwRFRTaTh1SEVlMElwVVBDekJqb0twZUVPQWIrakNB?=
 =?utf-8?B?ODlVMk9BWUlWb0plcVE3cEFDejdvVmI0cUd4UEhmanFUWm11QTFKem1Jem9I?=
 =?utf-8?B?S082L1F2VnZJZ1ZzT2JjRnZveFplWEhLNzBkcE9MY1lCdklWOTZ6ZjU3TnAy?=
 =?utf-8?B?czJMMmM5VFM5WWhldWJJS21TeDJUeHhrdVZHcmxxNWVoTzFRaE5LemorcS93?=
 =?utf-8?B?ckhyRG1HR0pjOXpTM3RhVnJvZVFxNG1qUDVnYkU4R1dud1EzWmJlcS9zZ2o3?=
 =?utf-8?B?WG04UGVwTEJXMnBvSCtpMndmV0JpN2JzYk1EalJyVFJ4QnQ3WGk1ZlJZZG9B?=
 =?utf-8?B?UGtxOGNZYW13dUFacFk4QS9SbC9peGthdmRMN29xblh6Y0U4NWU0ZUQ2T0RV?=
 =?utf-8?B?UWxYcXpVeXh4d2NJUVFNem5SbEZnUWVjUVpESEx3Q0xiZGZTOUJqMlJNajZE?=
 =?utf-8?B?NmQ0QzJPcWFVa1E2azBhMkxnYmVkS3R3QWFYSTZla1BORGZUOXMzbDY3M0ZF?=
 =?utf-8?B?WDZVeGJPSUdmdUVFaWU3QlVsSHh0eG9kZCtGZm9JaExtTEN4SC9qdkZlTnFh?=
 =?utf-8?B?Y090alpVRDlTcEJYZHdOVVhXdlVnS2kwZ2VsQTFVa1lNbTdURXh5UUV1VTBs?=
 =?utf-8?B?RDhVMVNWWGlhTkNKMEIxMDh2QlBEVHhSYnNrSUllZHk0S3lhdFlIY05panU4?=
 =?utf-8?B?WmhoaUExZUREdVhkN1J6ck5lOGFTem9TdXNWb09YZk9MeHdXZkEwUzg2cnNH?=
 =?utf-8?B?Q05oR1ZsY1hoUEs1VkNPd1NZNjhhSEZFUGdlYzgvQ3o0YW10OEFFWWxwRVNQ?=
 =?utf-8?B?ME9lS2MzUUIvVG9tdXp1UW1BNXlqeDF3ZUtMUVpZeHZHZEI0VTB1Ty81bkt6?=
 =?utf-8?Q?WDGzEJtj0LFdLYWO4roHI4QXQSYgQcD8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aecb7f2-5f38-49aa-1c3b-08d8a18c0064
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 06:29:54.6129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +WzSn20kEQ1c49d4Pc8pvGTc+s9ZLq/YZC2TY6ERwow+yARFcjK7Xf77RLEUOQ1W8DMKQZlTLkik+lVJxvwz1JNPdhfNFjTIbBLBNNQ6VkNb3vUPH0wr7hmjd0K+YcGY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1530
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWF0dGktc2FuLA0KDQo+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNlbnQ6IFdlZG5lc2Rh
eSwgRGVjZW1iZXIgMTYsIDIwMjAgMzowMCBQTQ0KPiBPbiBXZWQsIDIwMjAtMTItMTYgYXQgMDI6
MTMgKzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+IEhpIEdlZXJ0LXNhbiwgTWF0
dGktc2FuLA0KPiA+DQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFdlZG5l
c2RheSwgRGVjZW1iZXIgMTYsIDIwMjAgMToxMw0KPiA+ID4gQU0NCj4gPiA+IE9uIFR1ZSwgRGVj
IDE1LCAyMDIwIGF0IDU6MDIgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDwNCj4gPiA+IGdlZXJ0QGxp
bnV4LW02OGsub3JnPiB3cm90ZToNCj4gPiA+ID4gT24gRnJpLCBEZWMgMTEsIDIwMjAgYXQgMzow
MyBQTSBWYWl0dGluZW4sIE1hdHRpDQo+ID4gPiA+IDxNYXR0aS5WYWl0dGluZW5AZmkucm9obWV1
cm9wZS5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IE9uIEZyaSwgMjAyMC0xMi0xMSBhdCAyMDoyNyAr
MDkwMCwgWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+ID4gPHNuaXA+DQo+ID4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gPiA+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYw0KPiA+ID4gPiA+
ID4gQEAgLTE3LDcgKzE3LDcgQEANCj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvbWZkL2Jk
OTU3MW13di5oPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICBzdHJ1Y3QgYmQ5NTcxbXd2X3Jl
ZyB7DQo+ID4gPiA+ID4gPiAtICAgICBzdHJ1Y3QgYmQ5NTcxbXd2ICpiZDsNCj4gPiA+ID4gPiA+
ICsgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFzIGEg
J25pdCc6DQo+ID4gPiA+ID4gSSBtaWdodCBjb25zaWRlciBhZGRpbmcgdGhlIGRldiBwb2ludGVy
IGhlcmUgdG8gYXZvaWQgZXh0cmENCj4gPiA+ID4gPiBhcmd1bWVudA0KPiA+ID4gPiA+IHdpdGgg
YWxsIHRoZSBia3VwX21vZGUgZnVuY3Rpb25zIGJlbG93LiAoanVzdCBwYXNzIHRoaXMgc3RydWN0
DQo+ID4gPiA+ID4gYW5kDQo+ID4gPiA+ID4gbW9kZSkuIEJ1dCB0aGF0J3Mgb25seSBteSBwcmVm
ZXJlbmNlIC0gZmVlbCBmcmVlIHRvIGlnbm9yZSB0aGlzDQo+ID4gPiA+ID4gY29tbWVudA0KPiA+
ID4gPiA+IGlmIHBhdGNoIGlzIE9rIHRvIE1hcmssIE1hcmVrICYgT3RoZXJzIDopDQo+ID4gPiA+
DQo+ID4gPiA+IFN0cnVjdCByZWdtYXAgYWxyZWFkeSBjb250YWlucyBhIHN0cnVjdCBkZXZpY2Ug
cG9pbnRlciwgYnV0DQo+ID4gPiA+IHRoYXQncyBpbnRlcm5hbA0KPiA+ID4gPiB0byByZWdtYXAu
DQo+ID4gPiA+DQo+ID4gPiA+IFBlcmhhcHMgYWRkaW5nIGEgcmVnbWFwX2RldmljZSgpIGhlbHBl
ciB0byByZXRyaWV2ZSB0aGUgZGV2aWNlDQo+ID4gPiA+IHBvaW50ZXINCj4gPiA+ID4gbWlnaHQg
YmUgd29ydGh3aGlsZT8NCj4gPiA+DQo+ID4gPiAtRUVYSVNUUyA7LSkNCj4gPiA+DQo+ID4gPiBz
dHJ1Y3QgZGV2aWNlICpyZWdtYXBfZ2V0X2RldmljZShzdHJ1Y3QgcmVnbWFwICptYXApDQo+ID4N
Cj4gPiBUaGFuayB5b3UgZm9yIGZpbmRpbmcgdGhpcy4gSSdsbCBmaXggdGhpcyBwYXRjaC4NCj4g
DQo+IEp1c3QgYSBzbWFsbCByZW1pbmRlciB0aGF0IHRoaXMgZGV2aWNlIGlzIHByb2JhYmx5IHRo
ZSBNRkQgZGV2aWNlLCBub3QNCj4gdGhlIGRldmljZSBjcmVhdGVkIGZvciByZWd1bGF0b3IgZHJp
dmVyLiAoUmVnbWFwIGlzIGNyZWF0ZWQgZm9yIE1GRCkuDQo+IEZvciBwcmludHMgdGhpcyBvbmx5
IG1lYW5zIHdlJ3JlIGlzc3VpbmcgcHJpbnRzIGFzIGlmIE1GRCBkZXZpY2UNCj4gZ2VuZXJhdGVk
IHRoZW0sIHJpZ2h0PyBJJ20gbm90IHN1cmUgaXQgaXMgdGhlIGJlc3QgYXBwcm9hY2ggLSBidXQg
SSdsbA0KPiBsZWF2ZSB0aGlzIHRvIE1hcmsgJiBvdGhlcnMgdG8ganVkZ2UgOikNCg0KVGhhbmsg
eW91IGZvciB0aGUgY29tbWVudC4gWW91J3JlIGNvcnJlY3QuIHJlZ21hcF9nZXRfZGV2aWNlKCkg
aXMNCnRoZSBNRkQgZGV2aWNlLiBBbHNvLCBvcmlnaW5hbCBjb2RlIGhhZCB1c2VkIHRoZSBNRkQg
ZGV2aWNlIGFzDQoiZGV2X2VycihiZC0+ZGV2LCAuLi4pIi4gU28sIHByaW50ayBiZWhhdmlvciBp
cyB0aGUgc2FtZSBhcyBiZWZvcmUgOikNCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1v
ZGENCg0K

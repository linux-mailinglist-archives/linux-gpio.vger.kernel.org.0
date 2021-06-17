Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87273AAC7C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 08:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhFQGj2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 02:39:28 -0400
Received: from mail-mw2nam10on2050.outbound.protection.outlook.com ([40.107.94.50]:30420
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229551AbhFQGj2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Jun 2021 02:39:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObjfOrHH84zFOruphDjlMWVfOkhXsa9pMqwuEt0gWV+dNZtjdIigcjPXuAZOoeOTFC6zigN8MdWDIGxpSnjgTh3bl+9dzOgvQpOCY64qgocOEMCRs1UEorey/bUhHWU+5sCa/q4ZJk18iHasOOnQaBuvenohK6iwS0N5Oh19bo7uRt8DxoWLbWa9ZkP+SApPi9gZSU9Fw7dmUyFwCKRXCZ+bgWc0RjzEPKNfjJrTsQNXtX2Wn+ksqDsQVPY3kOQht3Hu6XTS4BfkoAyZ9kWavKClOzBaufq9/zZiVdol+Qjawa4Sp9VosAArQ6dnrh5uUejFWmKzEOEJ9lBiJFtfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhCxy/Oy0EA8PlGggQZ+buDPY3CS6r27/K3tyT/COnQ=;
 b=iyX3BPAKNkdV9l6ebmiMs46FV0/Agq5MvGVISQlrpuYuPqlFfWPXBmGY7zWjPe6InPv2KOrzPXlX5uxwYvD8MpHIEzum8yh41RWCuYf/H1IxzhYMmepWG3NvZtkxiRmtfaHmhqPmq6wUwkbGqHPYX0URcPIMgN83zSjPMgL/cxgLkh+3T0F6Hiz+Dh2QJJ8Iz2Yn8jPFiT1VDfI+DptWH17Gf5JSSTaIvnivJQN34lWrq/vgW4Bm0jg5gmg7nkuxHCQXDLQJOcH1IOFLlrzfjcguzC97nQwpDcew9mWit/Qhu9r4OCmXSP5rqRICLe1rqogGAb19sc0wisa8tym4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhCxy/Oy0EA8PlGggQZ+buDPY3CS6r27/K3tyT/COnQ=;
 b=LWgyRbJoHmhf6vCd2HAquZjlqxOvrQc77QQXXy1SNSKT5nnEJHy3dBwCD/QBpIGPded1aXjdBfn9NlYODGjm/l1t+ycedEcLnQgJPdJAQVa1gcZFE9JRtDVrc/Jl0IZyBtkunzCY0koDCPxHYxxl4SxmIkctdEyIe8S0q/RvViw=
Received: from MW2PR02MB3881.namprd02.prod.outlook.com (2603:10b6:907:11::31)
 by MWHPR0201MB3499.namprd02.prod.outlook.com (2603:10b6:301:77::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 17 Jun
 2021 06:37:19 +0000
Received: from MW2PR02MB3881.namprd02.prod.outlook.com
 ([fe80::19b4:f7eb:1422:317c]) by MW2PR02MB3881.namprd02.prod.outlook.com
 ([fe80::19b4:f7eb:1422:317c%6]) with mapi id 15.20.4219.026; Thu, 17 Jun 2021
 06:37:18 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Topic: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Index: AQHXN1HnJ1dD/z2380CasZDNOXc+DarCQxoAgAQix4CAAHWwAIAAH53ggBdJowCAOdKhMA==
Date:   Thu, 17 Jun 2021 06:37:18 +0000
Message-ID: <MW2PR02MB388198021497399F280A374EBD0E9@MW2PR02MB3881.namprd02.prod.outlook.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
 <DM5PR02MB387726AB4144F0DB28105007BD409@DM5PR02MB3877.namprd02.prod.outlook.com>
 <DM5PR02MB38771A8BEEB3E01006B14E46BD539@DM5PR02MB3877.namprd02.prod.outlook.com>
In-Reply-To: <DM5PR02MB38771A8BEEB3E01006B14E46BD539@DM5PR02MB3877.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8aafad9-3264-4e8d-f3a4-08d9315a5ac4
x-ms-traffictypediagnostic: MWHPR0201MB3499:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR0201MB349946E5D9E6731BB468BDA6BD0E9@MWHPR0201MB3499.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YCZQ5FGbs/R/PkvAY0zzvnRyRaldKaD/X+4+FfPgzLjyjwFvbc8md5m8H9fOVYWbjPMRXPZaW4uk/lzLse3/3LJD+GlJkQnQwXpB3gTcL2dqWnOac2ZMPkLzVfZ+miJJVghuI3a/M5Xg0IXbpIBjGmqsTQm+ENJ/mpxDDvaLCjC2AYB9WDPB1E89VdkoliERo/jlL2MJ25PPfww5N9m46ZYTPhLinNSUNEGxpdFel/T1Hem3c5vpW/ivqiydtMyNlXcLtcXDzeSsIvnwmUfU043JL/cmSLuUsoChIhXAMM8am/RMrDTDytrzdLO4YkoB3BkTSKopCLmSWX297rx16xzWfh51fP7QP4sNrg+iPuznnZsmTYvLKadncExECQVsWEsGFDcfBOyK6sqMJCturuSboLrkusSNGVrQNUNPlDHcCM+xqBHSLky3PRZR4eEP5SvlKl9WYDnZskWxDXBqSKT1FfYGRm7HrlYK52Q33IYJjnx6lK8lGiViB3T/jOPgAy8CGctWe/+TY7aKk2mmLjC13TI+Z5PkXZLibJeurWBIO9hNU420ChLk8cixvaACF09upCeVmJzIU+mJH2bMdJy6Hu7luJYVFr9WUCrAVMg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR02MB3881.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(5660300002)(4326008)(7416002)(122000001)(86362001)(6916009)(83380400001)(26005)(71200400001)(53546011)(2906002)(52536014)(186003)(6506007)(54906003)(38100700002)(7696005)(8936002)(478600001)(8676002)(66446008)(66556008)(66476007)(66946007)(33656002)(316002)(9686003)(76116006)(64756008)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emtLZWxJd2E3a0lIUUF2OFAwVU44TVVhZ3diR1Q5eUNhMGk3cWJSWlhRdS8v?=
 =?utf-8?B?QUxTeTlTSjgwbGJsSm4zRXVZSlZkOHpnbVRiU2FMNVFpQ0l4dFgyZ1hCTVFI?=
 =?utf-8?B?OW9lQ2M2OXNmMUlRcGNYL0Nzbmdac01jS2ZBUVBDOElFd05MOU1aSzNaTnhV?=
 =?utf-8?B?Vm5HMWF2SWdtSmlBWjk5a1o5dE1teWk5VHVNNzdtS0NIVzM5emVLWkJFWTRK?=
 =?utf-8?B?bzc4QXFaVjlxYTVkTEFTbThCbURUakQzM0g4UkRtRWVqclFMSEphUlJsNUY5?=
 =?utf-8?B?NkIwSGNuY3lFeGt6TE5xZG5ScHpheEQ0clFJd00rMy9GS0R6SUowTytwR1RR?=
 =?utf-8?B?QnlhckJ1VTZETElmY1VraUNTaU5TeTliTUMwK01ZbWlSWE5LNCt5NjFmVmxm?=
 =?utf-8?B?aEJCYmtDOE5FVW9iYTlqU21YcUtkTWVYTm5vZmpieHFSNlZIZ3Z6KzNRVm1G?=
 =?utf-8?B?WTA1ZjZrSHZoYWFUd0prbGZkQUJVTC9vNXpOdlJBbFdGZDMxZ1UrVmVnRHJ2?=
 =?utf-8?B?K1lWd3dMTzFZcjNyQUkwOHBWV1NBS0xzRjF6STdtZ0RXd1pLWTlsVm90RDhX?=
 =?utf-8?B?dWl6ekMwUFQ4TlZHL2RuL2FMSVFnczFUa1RSL2FiTURac3c0c0M2eGJFSnJQ?=
 =?utf-8?B?TTRQek9kUjF3ckF6ZTV2SUVqbEdZaGVva1cwcU5wck1CdWlJSFRGaUY5V1Z3?=
 =?utf-8?B?anBhMFYrU211R3VDMW52Y2Ntb3U1Sk96cnZmM29hQUo3V0lEVkJGQWJGcGcx?=
 =?utf-8?B?TzBCb21TRitzakNERWl5ekdKRXpjQzh3ZHZlS3poZmdIRUk4akEyZzRMRmZJ?=
 =?utf-8?B?aStaakRTWUFURi84UWtnd2JabjZBS25mR3dZNFFyeHl2OS9wTXhhbE1lQjBF?=
 =?utf-8?B?MitUU2c3ZXJyWGVvYW14U1ZaTC82d3NIUEFSWGFiaVFXY2J2cWQxaEF4WXJC?=
 =?utf-8?B?MDQrUmw4VUt2bUwwVERwejZHTUg1MUNqYzQ0RDZ3K2tZYWNYNUhwWU9zdldI?=
 =?utf-8?B?OFN1aWQwNGY4WCtHWk85c3hkQjdQdUtjRXJuWVJNVWFzMVhTQmdLaGVyNTZH?=
 =?utf-8?B?SC84aU9TelNmNStsNllJVVk2UGxmTVJaT2cxSGcrbEQxa1drZEs2V2pkVmRn?=
 =?utf-8?B?TkJwTmlkVDZFMi9uVzArUXZuSGtabDl1Q1FVTUlZVUlPTTM4cmZpZGhtNXlT?=
 =?utf-8?B?SUtIZXdYRUNFQVZWaTJXelFvWGZob2cxQTFZdkl5d3dvekRteWFkdm9HTjF4?=
 =?utf-8?B?ajVNamJYK1BmT05YSm5jZEErbUdSTCtad3RRcHBMMmFGd1lrSUFaZ21QYWov?=
 =?utf-8?B?R2hHcWdyUEErTS8zaGsvdnJtaEQwYmZvekF2eGgyNk0ydUhBQUhRZit3aGlw?=
 =?utf-8?B?cFoydDVpN2VWRHpheEY1ZFBvUUNEMEtub2tnY2RkL1Y0U0RzbkE2bDlCejMz?=
 =?utf-8?B?N2F0YXovSVV1YTVteTkwRWk5Zm5hOXp1WGx3N1NDU3VjcTRjckZ5R29YZGF3?=
 =?utf-8?B?MjJJUUNhblRRVjBEaEU4TUVTUTlRNllOR1dQc1VYQzUrNTJnUU80YmJxcmlR?=
 =?utf-8?B?M1BFVmVncmREL2RmcVFXY0FtVUZIbWw5bmJQa1pIL0lFdkgrMjVBNzMwZS8y?=
 =?utf-8?B?OGN2N2NuUGVvVm1WdEVKNWozNE1oYlU4VGRRTDB3VUNtbytTQ0xsYWJMdU9T?=
 =?utf-8?B?NUpiOGNNVGoxNGF5UTJlYXNKUXhrdjZYSnlWTFI2SG9nVmx2MDRsN0NrQ21Q?=
 =?utf-8?Q?vWaSBKgJWnEaUyt8u2tmzFfjhQVQRB6ltO9+ZxU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3881.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8aafad9-3264-4e8d-f3a4-08d9315a5ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 06:37:18.7351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWAMgJOZLrHSyz5Hgub9tyqWnW9CbzhTYO3O6GPr7MOsJ5L84ZCjXvfu59zBvlZkQe2cyJqyTbZc90R18M5d5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3499
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

UGluZyENCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTYWkgS3Jpc2hu
YSBQb3R0aHVyaSA8bGFrc2htaXNAeGlsaW54LmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWF5IDEx
LCAyMDIxIDY6MDggUE0NCj4gVG86IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdt
YWlsLmNvbT4NCj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47
IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNaWNoYWwgU2ltZWsgPG1pY2hh
bHNAeGlsaW54LmNvbT47IEdyZWcgS3JvYWgtDQo+IEhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPjsgbGludXgtYXJtIE1haWxpbmcgTGlzdCA8bGludXgtYXJtLQ0KPiBrZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LQ0K
PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgZGV2aWNldHJlZSA8ZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc+OyBvcGVuDQo+IGxpc3Q6R1BJTyBTVUJTWVNURU0gPGxpbnV4LWdwaW9Admdlci5r
ZXJuZWwub3JnPjsgZ2l0IDxnaXRAeGlsaW54LmNvbT47DQo+IHNhaWtyaXNobmExMjQ2OEBnbWFp
bC5jb20NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2NiAzLzNdIHBpbmN0cmw6IEFkZCBYaWxpbngg
WnlucU1QIHBpbmN0cmwgZHJpdmVyIHN1cHBvcnQNCj4gDQo+IEhpIEFuZHkgU2hldmNoZW5rbywN
Cj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBTYWkgS3Jpc2hu
YSBQb3R0aHVyaQ0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjgsIDIwMjEgMTE6MDQgQU0N
Cj4gPiBUbzogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiA+
IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBSb2IgSGVycmlu
Zw0KPiA+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54
LmNvbT47IEdyZWcgS3JvYWgtDQo+ID4gSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+OyBsaW51eC1hcm0gTWFpbGluZyBMaXN0DQo+ID4gPGxpbnV4LWFybS0ga2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0DQo+ID4gPGxpbnV4LSBr
ZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgZGV2aWNldHJlZQ0KPiA+IDxkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZz47IG9wZW4gbGlzdDpHUElPIFNVQlNZU1RFTQ0KPiA+IDxsaW51eC1ncGlvQHZn
ZXIua2VybmVsLm9yZz47IGdpdCA8Z2l0QHhpbGlueC5jb20+Ow0KPiA+IHNhaWtyaXNobmExMjQ2
OEBnbWFpbC5jb20NCj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHY2IDMvM10gcGluY3RybDogQWRk
IFhpbGlueCBaeW5xTVAgcGluY3RybCBkcml2ZXINCj4gPiBzdXBwb3J0DQo+ID4NCj4gPiBIaSBB
bmR5IFNoZXZjaGVua28sDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+DQo+
ID4gPiBTZW50OiBNb25kYXksIEFwcmlsIDI2LCAyMDIxIDc6MzUgUE0NCj4gPiA+IFRvOiBTYWkg
S3Jpc2huYSBQb3R0aHVyaSA8bGFrc2htaXNAeGlsaW54LmNvbT4NCj4gPiA+IENjOiBMaW51cyBX
YWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBSb2IgSGVycmluZw0KPiA+ID4gPHJv
YmgrZHRAa2VybmVsLm9yZz47IE1pY2hhbCBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPjsgR3Jl
ZyBLcm9haC0NCj4gPiA+IEhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgbGlu
dXgtYXJtIE1haWxpbmcgTGlzdA0KPiA+ID4gPGxpbnV4LWFybS0ga2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0DQo+ID4gPiA8bGludXgtIGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc+OyBkZXZpY2V0cmVlDQo+ID4gPiA8ZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc+OyBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNURU0NCj4gPiA+IDxsaW51eC1ncGlvQHZn
ZXIua2VybmVsLm9yZz47IGdpdCA8Z2l0QHhpbGlueC5jb20+Ow0KPiA+ID4gc2Fpa3Jpc2huYTEy
NDY4QGdtYWlsLmNvbQ0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAzLzNdIHBpbmN0cmw6
IEFkZCBYaWxpbnggWnlucU1QIHBpbmN0cmwNCj4gPiA+IGRyaXZlcg0KPiA+IHN1cHBvcnQNCj4g
Li4uDQo+ID4gPg0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHp5bnFtcF9wbV9w
aW5jdHJsX2dldF9jb25maWcocGluLCBwYXJhbSwgJmFyZyk7DQo+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgaWYgKGFyZyAhPSBQTV9QSU5DVFJMX0JJQVNfUFVMTF9VUCkNCj4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gRXJyb3IgY29kZSBiZWluZyBzaGFkb3dlZC4gSW5zdGVhZCBjaGVjayBpdCBoZXJlIHBy
b3Blcmx5Lg0KPiA+ID4NCj4gPiA+ID4gQXJlIHlvdSBtZW50aW9uaW5nIHRoZSBjYXNlIHdoZXJl
IHJldCBpcyBhbHNvIGEgbm9uLXplcm8/DQo+ID4gPiA+IElmIHllcywgdGhlbiBJIHdpbGwgdXBk
YXRlIHRoaXMgY2hlY2sgdG8gaWYgKCFyZXQgJiYgYXJnICE9DQo+ID4gPiA+IFBNX1BJTkNUUkxf
QklBU19QVUxMX1VQKQ0KPiA+ID4gPiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4NCj4g
PiA+IE5vLCB0aGlzIGlzIHdyb25nIGluIHRoZSBzYW1lIHdheS4NCj4gPiA+DQo+ID4gPiA+IHJl
dCBub24temVybyBjYXNlLCB3ZSBhcmUgaGFuZGxpbmcgYXQgdGhlIGVuZCBvZiBzd2l0Y2ggY2Fz
ZS4NCj4gPiA+DQo+ID4gPiBJIG1lYW50IHRoYXQgeW91IG5lZWQgdG8gcGFzcyB0aGUgcmVhbCBy
ZXR1cm4gY29kZSB0byB0aGUgKHVwcGVyKSBjYWxsZXIuDQo+ID4gSGVyZSB3ZSBhcmUgY2hlY2tp
bmcgZm9yIHZhbGlkIGFyZ3VtZW50IGFuZCBub3QgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUNCj4g
QVBJLg0KPiA+IElmIHRoZSByZWFkIHZhbHVlKGFyZ3VtZW50KSBpcyBub3QgdmFsaWQgYW5kIHJl
dHVybiB2YWx1ZSBvZiB0aGUgQVBJDQo+ID4gaXMgemVybyAoU1VDQ0VTUykgdGhlbiBmcmFtZXdv
cmsgZXhwZWN0cyBkcml2ZXIgdG8gYmUgcmV0dXJuZWQgd2l0aA0KPiA+ICctRUlOVkFMJyBhbmQg
aXQgaXMgYSBsZWdhbCBlcnJvciBjb2RlIGluIHRoaXMgY2FzZS4NCj4gRG8geW91IGFncmVlIG9u
IHRoaXM/DQo+IEkgYW0gcmVhZHkgd2l0aCB0aGUgb3RoZXIgY2hhbmdlcywgd2lsbCBzZW5kIG91
dCB0aGUgcGF0Y2ggdG8gYWRkcmVzcyB5b3VyDQo+IGNvbW1lbnRzLg0KPiANCj4gUmVnYXJkcw0K
PiBTYWkgS3Jpc2huYQ0KDQo=

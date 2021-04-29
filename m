Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D2336EC70
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 16:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240483AbhD2OdU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 10:33:20 -0400
Received: from mail-co1nam11on2078.outbound.protection.outlook.com ([40.107.220.78]:4961
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237338AbhD2OdU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Apr 2021 10:33:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irLKmC94JjUaQrbu1OHkST1cUoc6T0QHEF5cLJQWL8JeJKfoN08ZqE2CfNmkJ/2O4nJ2qzymukWJb1ufvsE1fy4Urffvvsd2AJrIpOw0UGEhig5CGGs5EKzwC2ZHwfe0KU9FBPC6pvfi0Y+KYd7DV9YQkhaUHOqaAQfjnF8SPvz/RZR//TijVukMKZREDFvRXvnC+aR0Sw8cCt2fPjxuVRO1fXOBETMoscHvfmv9cA2KYPnn4Em/9B0YihZ6S3maG8mOsI1/U+dcB3g9BgjVZ8RHuedDBrYipHT3agGPFVZ9RjCfa1VNEW3Wr9eOn+yYNGopAHR+mz1pvAJkrQKDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXBnj6Vk9mhpGOBga49QZtV1fdDRgEfHMDmHuoTwSkU=;
 b=KzQVWBlIktF7m0BMRDmvbOMzdzmrVJz8kERrBRDHhTPN8af/aqHLO9eEDERfI5T88FoXtri1EaAe4eRk/v7QRcknbTOz2ohFipru8pbzA+zbSCvgobXDRpI+aXSgwZHKD+Puzc3uMYaBTvRcNOaIM1yq32LZQn5YhEt1k5l7eY2kGjvUliuhoRp1oBx474sG3FwVwco4aicLFn+yd2U5dxzQdPMRtj83pk6Lj3lXNo5TNhks+e07bGAR6wfEC7w5AVz/LXChFP5YffER9KitWXfFlclUzgS5qFcQif0X3Vk2CeHTF65sl22zho4+MsL4mGQSjYAl6XTGBZmmR2Y5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXBnj6Vk9mhpGOBga49QZtV1fdDRgEfHMDmHuoTwSkU=;
 b=V8QGZvJIGo6nJxRE/c7hZZhgXY46GeUFRuZJC5KYjMBzG23Gx8UsNVq8WaUFVqbLzN4AvwatS+5rUm216p+KoCc2ZRM+dd3YXqB6FmCXwI+99DCxkUIHXQateW8m9NVTilHyTeKLqhg1EguX0FKSG68q0taFNPjSIOePfFbmDKA=
Received: from DM5PR02MB3877.namprd02.prod.outlook.com (2603:10b6:4:b9::34) by
 DM6PR02MB6441.namprd02.prod.outlook.com (2603:10b6:5:153::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25; Thu, 29 Apr 2021 14:32:29 +0000
Received: from DM5PR02MB3877.namprd02.prod.outlook.com
 ([fe80::943b:e0c1:3e2b:4327]) by DM5PR02MB3877.namprd02.prod.outlook.com
 ([fe80::943b:e0c1:3e2b:4327%3]) with mapi id 15.20.4042.024; Thu, 29 Apr 2021
 14:32:29 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v6 0/3] Add ZynqMP pinctrl driver
Thread-Topic: [PATCH v6 0/3] Add ZynqMP pinctrl driver
Thread-Index: AQHXN1HFgmDK8H7m5kWZ1B+6Bz2mLqrAQPkAgAICaoCACVQBgIAAAOhw
Date:   Thu, 29 Apr 2021 14:32:29 +0000
Message-ID: <DM5PR02MB387737FE520F81217EBF4133BD5F9@DM5PR02MB3877.namprd02.prod.outlook.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CACRpkdaDP+JnCP+go9hZAObnNgmJyJRDFypX2CZGp-UJBh5wNA@mail.gmail.com>
 <CAHp75VfpvPdAAW2JpvdiDtzS3LUF_=Ej7c2LEML_+pOwi6CtWg@mail.gmail.com>
 <CACRpkdaxTxCz=LJuGL_wCNTZESK0opixBzLass0w0n8A6P7mfA@mail.gmail.com>
In-Reply-To: <CACRpkdaxTxCz=LJuGL_wCNTZESK0opixBzLass0w0n8A6P7mfA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 237dc9ec-34ff-4929-9503-08d90b1b9e3b
x-ms-traffictypediagnostic: DM6PR02MB6441:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB6441CED99A51F332745CC08ABD5F9@DM6PR02MB6441.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ERa6MOwpo5fgzP3EPdHQT0iojD2VKpO3fOb5yJeYtXkcKx0AZCESqAOt8LTygDRPn/BE4Z9hzJuMdSKWsvxPoPQKbioBGHj3bUlFLzDAC18boLKV0u18nHesrZPBcejVvvHFZJXBgqBqO2imLlY26R8FavU9jTr6+/X6R08bLli2lwrmcjdegrWGGzDVk7H28osVgZgrVw9aiv+4ZTB+mX4w0J5hKTqBmDZsZhlMakXR5KxXBPIxWBGvSQK18q3QfWFpyH6elHDO6bvfDjEDv/pa+GdCo6EwvjnpV0OiQxI6cMhENXDImHDPqiJsg8I6z5ioxERnRxs4QAmSHnTUQ14oSDC7qSjTLT0HoZI1yWKPXXgT8mbu0HA5eTo+M8PMJhyqCtIgXV3RvsWXMmEW/gpc1HAKTKkKErAemjGbuOvwf63MYJxUftl/DrTyLKMhYgzZ0B4TYHfG4eTGUGiUGOGNRhTPy3gmLGiQjoI76WVZXV7WyAVO4EKcmNXUmDEWL0XUq74TGL+Eu6F0cw7GJw+EiSHsrc9FV2D7iLih7oVAQvwV6JugfVZgS9mv0Jk3AnZBce3uk8gCKdwTBg1nuhhQlEZTQmLsdhqrmTO8Hlc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB3877.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(71200400001)(64756008)(66556008)(33656002)(66446008)(66946007)(26005)(86362001)(52536014)(66476007)(76116006)(55016002)(316002)(9686003)(83380400001)(186003)(5660300002)(6506007)(2906002)(478600001)(7696005)(8936002)(4326008)(8676002)(122000001)(6916009)(7416002)(54906003)(38100700002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?clFXS1pTK0ZaMFFyQ2hpQzZ4enBmcndLUHBVT0tRSmt1NVU4MDZBeXRkTUU4?=
 =?utf-8?B?VGRtdHovWFJGOU9MKzUrME5WYmJSYnZBWjFxa2EzdjRNMExBSTk0bkhRZ000?=
 =?utf-8?B?RWN2b0FjcU1Xdk5NMzhoMXJqaWF4a3FNU1ZORDU0MlpZRnhqemZVcHBSYXF3?=
 =?utf-8?B?Z1VFU25GYVd3aUZHeXlVRUYvbjJvWWMvWlZHK253SVluSTNLbHd6V3Uwdmo4?=
 =?utf-8?B?QzRsUkdGMGNUSmpsWENnZjZRbUhFMk1rSDh4ekdYMS8rSmcwY2pPQnpBcFl1?=
 =?utf-8?B?dUtLUEZyRzFjUjlXTnZKeTBqL1Nua0tkVERNN28rVVRsRGh0QkNJL0xsb2V6?=
 =?utf-8?B?MUNka2x5cnFuSkVESkZlbngwNTZndEIvYzRLUG9LSDJYUklNSUlsdldvTmVy?=
 =?utf-8?B?bWJZUEcvSzI4ZllVSlRHYTNORjFnYXVpc2ZodEZPdzNodjBHd1hESThUUkoz?=
 =?utf-8?B?Q3BwUHB0WUFGMUczbU90bGlDdkRCODdOVE9PSjJDYU55b0hxWGgxZkxxaVR1?=
 =?utf-8?B?YUxINm0rZFZYNGI5RXgvQVpscU9UamZZMFpGbTc4NHJCcUFuZHJzTTBJK0cz?=
 =?utf-8?B?aGNrTEhxeHNPUkJTb08rUW4wWWNKRDc0cDVFUTdIK056SG1iU2hDcWYrNHhK?=
 =?utf-8?B?RVY3WVcwOGdoMWNMejdqOW15S1VxdGlaTVJDRFhQRTlEZENENHBpYlNKblRW?=
 =?utf-8?B?blVocVJ2b08zOWJhRlhGRGE5WXRERUZXbVVyR281RzlFNTRuU0J2b2h6NEdu?=
 =?utf-8?B?WVVHUGlYRW43RmN5UkFsVGhLUXpTODVHNVYvYWRxVWthRXFBQ1pxY2NvUE82?=
 =?utf-8?B?TFZtR3Rvd3loc0J6QTZUNDZCZDRyNVR5RDIrSVFzczJjR1hhUjVma2E0czNa?=
 =?utf-8?B?ME1OWGk1bm44N3MwVnpTNkRKcnNCNEVHZzBUMi93d09MZGlkK1YxYmV4RzBY?=
 =?utf-8?B?cEluWE5XbnoxcGg2RlZiTFl2dm14bVZwMFVVS0xPMjB1Mk9leTVkMnBkcjBy?=
 =?utf-8?B?Rkd6eFl4aDJjZzhpalg2dWUvUEFlcEpSN1Z3UXJXcmRQU0FTY3NlTjNGWHlQ?=
 =?utf-8?B?VURJVGYxZ0JxTlhCL2p0enltNWpBdStVQTNnUGRVS3RGOEpUdGFCcHZ2QUx0?=
 =?utf-8?B?azNZcEFQcTNDRFF6SDExZ0hNT0k1cW9wRXNUaTFmc2VZRjJDNzVNTlVsT2Uv?=
 =?utf-8?B?cDRIbVNzZGlNRFRXWXpNMTlhQVltMWU3OWtId2tyMnVZaGJMZnFWZjl2WEpU?=
 =?utf-8?B?UTB1dEpQUThVd05hUm9IV2krMU80bk5kZFNyYm1BRFNxUSt0bzlMZ291ZW5Q?=
 =?utf-8?B?SnZ6VXhFSFdPS1d6RnRuK0hXTnRJaDFyYVFnQ1RKUzdxQ01Jd2RLOG5mRkhy?=
 =?utf-8?B?MkNZR3pIMmo4TjR3MXpkWlFncUJ3T2VTU3lGMko3S0d1UkNSZ1o4S1VCOG10?=
 =?utf-8?B?YWU0SFlDWmRwQjBvMytuWnpTM3QxczE3RERGU1pBcy85Z2s0cERCVERjNm9u?=
 =?utf-8?B?NjAyS1Y5UkJOU0tha3drLzcvbVZQcnJzYnRhTlhkdDY1VmE2NGFqZTNxTVQy?=
 =?utf-8?B?RE00bUFGc3FaK2FyZklQOXFIeXJ3Ri9uL0htVm8zelZWdDdYSEdTSHgySEZ0?=
 =?utf-8?B?L0srVkhsSEFiMlJWaFRuNHhkM2dxVDNZLy82dmdTZTM4RWZDdWxhd2FDNGNq?=
 =?utf-8?B?bGEvMGd4cWNFS01UZHJBeUxHc1VWdTMvM1ptdzFoV1VFbWRpSDRBWXRaVmdv?=
 =?utf-8?Q?m+Cg5ohd6ErDvhGST+QFMxaPPoEAZC/BoVZpNSW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3877.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237dc9ec-34ff-4929-9503-08d90b1b9e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 14:32:29.5783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCjDvIWG4t1drTtsCSFnJwFAL2emRVqTl8+6ZYe9tjQGvQN2g3Ay2S4T6oh6Ba0l3q+C8sHm31cpldD6Jr0KiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6441
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgQXBy
aWwgMjksIDIwMjEgNzo1MiBQTQ0KPiBUbzogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVu
a29AZ21haWwuY29tPg0KPiBDYzogU2FpIEtyaXNobmEgUG90dGh1cmkgPGxha3NobWlzQHhpbGlu
eC5jb20+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWljaGFsIFNpbWVr
IDxtaWNoYWxzQHhpbGlueC5jb20+OyBHcmVnIEtyb2FoLQ0KPiBIYXJ0bWFuIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz47IExpbnV4IEFSTSA8bGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZz47IGxpbnV4LWtlcm5lbCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zz47DQo+IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVORUQgREVWSUNFIFRSRUUg
QklORElOR1MNCj4gPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgb3BlbiBsaXN0OkdQSU8g
U1VCU1lTVEVNIDxsaW51eC0NCj4gZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc+OyBnaXQgPGdpdEB4aWxp
bnguY29tPjsgc2Fpa3Jpc2huYTEyNDY4QGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY2IDAvM10gQWRkIFp5bnFNUCBwaW5jdHJsIGRyaXZlcg0KPiANCj4gT24gRnJpLCBBcHIgMjMs
IDIwMjEgYXQgNTo1NSBQTSBBbmR5IFNoZXZjaGVua28NCj4gPGFuZHkuc2hldmNoZW5rb0BnbWFp
bC5jb20+IHdyb3RlOg0KPiA+IE9uIFRodSwgQXByIDIyLCAyMDIxIGF0IDEyOjE0IFBNIExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gd3JvdGU6DQo+ID4gPiBPbiBU
aHUsIEFwciAyMiwgMjAyMSBhdCAxMDozMCBBTSBTYWkgS3Jpc2huYSBQb3R0aHVyaQ0KPiA+ID4g
PGxha3NobWkuc2FpLmtyaXNobmEucG90dGh1cmlAeGlsaW54LmNvbT4gd3JvdGU6DQo+ID4gPg0K
PiA+ID4gPiBjaGFuZ2VzIGluIHY2Og0KPiA+ID4gPiAtIFJlYmFzZWQgdGhlIHBhdGNoZSBzZXJp
ZXMgb24gJ2RldmVsJyBicmFuY2ggaW4gcGluY3RybCB0cmVlIGFuZA0KPiA+ID4gPiBubyBmdW5j
dGlvbmFsIGNoYW5nZXMuDQo+ID4gPg0KPiA+ID4gUmVtYWluaW5nIHBhdGNoZXMgYXBwbGllZCEg
VGhhbmtzIGZvciB3b3JraW5nIHNvIGhhcmQgb24gdGhpcyENCj4gPg0KPiA+IEhtbS4uLiBJIGhh
dmUgaGFkIGEgYnVuY2ggb2YgY29tbWVudHMuIE9rYXksIHRoZXkgbWF5IGJlIGFkZHJlc3NlZCBi
eQ0KPiA+IGZvbGxvdyB1cChzKS4NCj4gDQo+IFNhaTogY2FuIHlvdSBwbGVhc2UgYWRkcmVzcyBB
bmR5J3MgY29tbWVudHMgd2l0aCByZXBsaWVzIGFuZC9vciBmb2xsb3ctdXANCj4gcGF0Y2hlcz8N
ClN1cmUsIGRpc2N1c3Npbmcgd2l0aCBBbmR5IG9uIGNvdXBsZSBvZiBjb21tZW50cy4NCkkgd2ls
bCBzZW5kIHRoZSBmb2xsb3ctdXAgcGF0Y2ggdG8gYWRkcmVzcyBoaXMgY29tbWVudHMuDQoNClJl
Z2FyZHMNClNhaSBLcmlzaG5hDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K

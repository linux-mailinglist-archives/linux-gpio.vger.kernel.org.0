Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A93F22C88D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 16:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgGXO4P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 10:56:15 -0400
Received: from mail-bn8nam11on2070.outbound.protection.outlook.com ([40.107.236.70]:3750
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726758AbgGXO4P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Jul 2020 10:56:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHibcw/mQxOGl8NGluJPwHzJsd7knOV5LxyfMCOq4rpfdfCk3xmIKTZ7qGnVGGxyPO4dgMNf5i4TgJd9WQoCKr9bTo1FxeaTNJVj97itYUbij/RzauedGkwPRmlJznldnFMIX66QjZcqEhKBfNL3QPEmQyczxosct7QpGyaVhIQqP5AvxuFBLA5LApd89Ga0n3DhsxvA81WsNe8zOUTWDi6AmjtNAorWs4hcnY/WLvFIaakF6K7hDErYUnSx+ANKpaCIVldmIPM0Ouy5sEf6ZXXXB1chHiUOcbL4h8I+JLeS+KOHPBCb7hvCHl327lwTAW0fmCNt8eladVrMQsovqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CppHsYQ20b1hwpAj+9I6LGXRDZdle94AzRA3gJT3eTc=;
 b=EllxWnizzqhLG5kgl04l1aiabj140SsSg/ojyF0qyDHGi9ZZILqTaaTVHv70o011SGq8dMFcrvgGCw8jnphO2GM0n5mjR0R8oknrHwiiRoCk11xSBuC+p0NZGAF5IoyUqS/cWjp1W8O3UdbEbAQn8ue3/RbgsVv4Ti+dbkax84TrPQ0kfOqvQBzcEWMzp9h44UtpP70RfwAjKrNBZB4j4YX9lEJKlAni0AAm6Oj4vpNMp9w5xFf4DM8Cevq0ZMjNW9Vb19zzt1M8ymrh+ybn4kH2loVP98rsMBODhRMSnnYkoaLhf5zbrxZcwcPmuQ7Ui/DScQ+nC16RNSUdg3F5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CppHsYQ20b1hwpAj+9I6LGXRDZdle94AzRA3gJT3eTc=;
 b=F1TJUEhbFf7w/9LN/OSe1KPq/De04Vm7TkT51zv/O5LvHvkjq05ONC7m/J50bniEYnXDqJ9Adr0UGBpYMQk3avfXsER0csgafqFsFNCRoksrKW64LJxPwq+BkrIXDfmp8VCRsztrc2OWx/u9mRRCDmY0LwmA1df1oTjRr4xrjiQ=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB6124.namprd02.prod.outlook.com (2603:10b6:5:1fb::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23; Fri, 24 Jul 2020 14:56:11 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::88fe:438e:4d0d:a77e]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::88fe:438e:4d0d:a77e%7]) with mapi id 15.20.3216.026; Fri, 24 Jul 2020
 14:56:11 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH V2 2/3] gpio: xilinx: Add interrupt support
Thread-Topic: [PATCH V2 2/3] gpio: xilinx: Add interrupt support
Thread-Index: AQHWYPp4ZP8ASW+qekKZVgUqxpAE06kWHyGAgABWwQCAAFzJYA==
Date:   Fri, 24 Jul 2020 14:56:11 +0000
Message-ID: <DM6PR02MB5386E88C8E3CA66987B452BFAF770@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <1595513168-11965-3-git-send-email-srinivas.neeli@xilinx.com>
 <202007241241.Eamn0vcf%lkp@intel.com>
 <CACRpkda0YiUQTUDOEo7gnuegtPFauUyeLWs7wDkapzrUC-nwAw@mail.gmail.com>
In-Reply-To: <CACRpkda0YiUQTUDOEo7gnuegtPFauUyeLWs7wDkapzrUC-nwAw@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 25340de1-4d4a-4898-e78e-08d82fe1b475
x-ms-traffictypediagnostic: DM6PR02MB6124:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB6124486EE08700F375616052AF770@DM6PR02MB6124.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zk25khNMeaJB+8gSe9ggY+rei5Fm5syiCuO1UX/tJbS3PtDraBHTlX48KvckQulYryxNJTmRPhQPzVAIjhI4RgxwnCuQiD3sW8cBor2//dHw4JXh8g0dyRps12vUbEkxY5/h0cUT5gtqnaAvPbeCeK4EP50GrdkRq324/1J8adROeHoajr+OJZWuuTNa6+KxDtATk0qbdRIVrrWZ8fh67OqHctjzNHof3/TTHgCeALNcCiIBmmJbqSD+RxlZmnmXSHapcjJykn2o2b62pyP0cp+pKMhpj7zKQahMoFTSy0LnMScbNYf2KXUvunMDdfykOyeovQB3z4ekGSKWbnblkw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(366004)(39860400002)(346002)(136003)(396003)(52536014)(8936002)(66556008)(33656002)(8676002)(64756008)(66446008)(110136005)(5660300002)(66946007)(66476007)(76116006)(2906002)(107886003)(54906003)(7696005)(6506007)(9686003)(478600001)(4326008)(316002)(53546011)(26005)(71200400001)(86362001)(186003)(55016002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 5yx5V/9291wcd2qJJUXYh/smMhWIZc6B7J1DPHLqK9C0KhnlSsA49I5ROLd5t5wRJqF6hxv8Q1CW7cb3Rz5Ty0NlR+vPUPRDjONYYzON71dJgI2tMU6U/B5hDrNEZupdyMmcXJHKan5kMttLA11HCHx81ZWcFsl9VOkP+Z/NrkogACK25USXYmdnY5/28CaxuUJZrr8TN0zjjmPuCF0/JgJOkbktXaTEqUwgihza9NzHnD8iwSJOMigEKIlOO0MuCYEsug/n1ACRE/LXwt7YzGQ5IzolfDRcMfA5slNcxJ07Z/X4qL7RQeQ2v/bQXE/9Z4jDVZjTYBrFqRDS48+6LJP+H7emJKN0FGpBitQT9euktyWP/6+1R4fFrFMMiKYxzZgNogkzoaY5kbs6PNwGwHVVWaJcOHs0YCSxxNX01npm5b4cYez6KE9g4DsnXV3iz8Ktl72TpELUWzlApjhRv4tTvG2eCgrDL0f+ZbjJ6r00kwt7affIRQQy7l+bCM+n
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25340de1-4d4a-4898-e78e-08d82fe1b475
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 14:56:11.1140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHGl79j6PThY3TUXnYj2PgfLIwZaCP9b4PbFLpJT9tkqwYCo6nEPRD2Lev69XHns9lRCz5RmRWv1f+nB/3iMTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6124
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4NCj4gU2VudDogRnJpZGF5LCBKdWx5IDI0LCAyMDIwIDI6NTIgUE0NCj4gVG86IGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiBDYzogU3Jpbml2YXMgTmVlbGkgPHNuZWVsaUB4
aWxpbnguY29tPjsgQmFydG9zeiBHb2xhc3pld3NraQ0KPiA8YmdvbGFzemV3c2tpQGJheWxpYnJl
LmNvbT47IE1pY2hhbCBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPjsNCj4gU2h1YmhyYWp5b3Rp
IERhdHRhIDxzaHViaHJhakB4aWxpbnguY29tPjsgU3Jpbml2YXMgR291ZA0KPiA8c2dvdWRAeGls
aW54LmNvbT47IGtidWlsZC1hbGxAbGlzdHMuMDEub3JnOyBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNU
RU0NCj4gPGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgTGludXggQVJNIDxsaW51eC1hcm0t
DQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgZ2l0DQo+IDxnaXRAeGlsaW54LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAy
LzNdIGdwaW86IHhpbGlueDogQWRkIGludGVycnVwdCBzdXBwb3J0DQo+IA0KPiBPbiBGcmksIEp1
bCAyNCwgMjAyMCBhdCA2OjEyIEFNIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPiB3
cm90ZToNCj4gDQo+ID4gICAgZHJpdmVycy9ncGlvL2dwaW8teGlsaW54LmM6IEluIGZ1bmN0aW9u
ICd4Z3Bpb19wcm9iZSc6DQo+ID4gICAgZHJpdmVycy9ncGlvL2dwaW8teGlsaW54LmM6NjM4OjEw
OiBlcnJvcjogJ3N0cnVjdCBncGlvX2NoaXAnIGhhcyBubyBtZW1iZXINCj4gbmFtZWQgJ29mX2dw
aW9fbl9jZWxscycNCj4gPiAgICAgIDYzOCB8ICBjaGlwLT5nYy5vZl9ncGlvX25fY2VsbHMgPSBj
ZWxsczsNCj4gPiAgICAgICAgICB8ICAgICAgICAgIF4NCj4gPiA+PiBkcml2ZXJzL2dwaW8vZ3Bp
by14aWxpbnguYzo2Mzk6MTA6IGVycm9yOiAnc3RydWN0IGdwaW9fY2hpcCcgaGFzIG5vDQo+IG1l
bWJlciBuYW1lZCAnb2ZfeGxhdGUnDQo+ID4gICAgICA2MzkgfCAgY2hpcC0+Z2Mub2ZfeGxhdGUg
PSB4Z3Bpb194bGF0ZTsNCj4gPiAgICAgICAgICB8ICAgICAgICAgIF4NCj4gDQo+IFRoaXMgaXMg
cHJvYmFibHkgYmVjYXVzZSB5b3VyIGRyaXZlciBuZWVkczoNCj4gDQo+IGRlcGVuZHMgb24gT0Zf
R1BJTw0KPiANCj4gaW4gS0NvbmZpZw0KPiANCkkgd2lsbCBhZGRyZXNzIGluIHYzLg0KDQo+IFlv
dXJzLA0KPiBMaW51cyBXYWxsZWlqDQo=

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA0235667
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 07:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfFEFuj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 01:50:39 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:21517 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbfFEFuj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 01:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1559713839; x=1591249839;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V23UQoLuR8JfcnTKw+reL88TN+mD9zb++TQbqJi3rt8=;
  b=L5rDmFGRwqT9AxB9FIzSc4JW24PhpVGK0IR3GRetQancCFd9KlzU1Bnf
   95N7AxtsO51dM45TfTuZ9UUXGgJ4FUDWTjHBFu81TDCYOyTKF82wrqLgx
   tyzWYZhkI8GuKEYot7SkWGnTpcz25UMgMApqZBfxiGbA9TfR/J6qH090x
   jCWEZy7kzXrGQqk4DJBPwLLYCew/7gIlYfKwG+34t4V6+ZNMexrsCrOsz
   UfeYXNLsgvoRHnOL5f5hMBpegYo+vmbZxXkaEGnG0q8ShN9bE92F34sT5
   fD1SfrIUkqD51nye+g+57jzfEMYlvfxNcVcuITQZXiPQUcpdv1C8uRTAC
   w==;
X-IronPort-AV: E=Sophos;i="5.60,550,1549900800"; 
   d="scan'208";a="111507124"
Received: from mail-sn1nam01lp2058.outbound.protection.outlook.com (HELO NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.58])
  by ob1.hgst.iphmx.com with ESMTP; 05 Jun 2019 13:50:38 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V23UQoLuR8JfcnTKw+reL88TN+mD9zb++TQbqJi3rt8=;
 b=bRU0wRy2MGCJx1+aiQtjvmCRrino99uux6SOpl2ZJp/UFzssOR0chzp2Sn1zlhiVimnnz45mcF5f3fuOcZfn4uVggpylVpf8/78yekEAj+Fs5ygeGrKk9bG+srDulGwPzNE7yPIwLkcFLw5lWVmMMbBOQGrOygsbKxZNrUYjuF0=
Received: from SN6PR04MB4925.namprd04.prod.outlook.com (52.135.114.82) by
 SN6PR04MB4335.namprd04.prod.outlook.com (52.135.72.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 05:50:36 +0000
Received: from SN6PR04MB4925.namprd04.prod.outlook.com
 ([fe80::6d99:14d9:3fa:f530]) by SN6PR04MB4925.namprd04.prod.outlook.com
 ([fe80::6d99:14d9:3fa:f530%6]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 05:50:36 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     John Stultz <john.stultz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [PATCH 0/3] (Qualcomm) UFS device reset support
Thread-Topic: [PATCH 0/3] (Qualcomm) UFS device reset support
Thread-Index: AQHVGqYAlQFsNx0blUeatbYnjFKLiqaMDImAgACCvoA=
Date:   Wed, 5 Jun 2019 05:50:36 +0000
Message-ID: <SN6PR04MB4925530F216E86F6404FE14CFC160@SN6PR04MB4925.namprd04.prod.outlook.com>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <CANcMJZBmgWMZu7Y53Lnx_x3L2UpCmEbFRHVW0SFCXfW=Yw9uYg@mail.gmail.com>
In-Reply-To: <CANcMJZBmgWMZu7Y53Lnx_x3L2UpCmEbFRHVW0SFCXfW=Yw9uYg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2717869a-9cec-4eb0-6dd4-08d6e979bb7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:SN6PR04MB4335;
x-ms-traffictypediagnostic: SN6PR04MB4335:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <SN6PR04MB4335CC9F1C4F1146AACC75F6FC160@SN6PR04MB4335.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(396003)(346002)(136003)(366004)(189003)(199004)(2906002)(256004)(9686003)(55016002)(99286004)(71200400001)(3846002)(81166006)(6116002)(71190400001)(5660300002)(6246003)(53936002)(4744005)(33656002)(11346002)(446003)(486006)(4326008)(25786009)(52536014)(476003)(54906003)(110136005)(53546011)(6506007)(102836004)(7696005)(186003)(14454004)(316002)(76116006)(66556008)(76176011)(72206003)(14444005)(86362001)(478600001)(26005)(81156014)(7736002)(7416002)(229853002)(8676002)(8936002)(68736007)(64756008)(66476007)(73956011)(66946007)(74316002)(305945005)(66446008)(6436002)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4335;H:SN6PR04MB4925.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e+yJZSvXZp7ShiVLuSaJeJNOAQOkSlqfUcc2sbw/IDQKRtzEafDdMrq/uqvQhhZyRfqaesrXuIe/xcpmvY28LutBjY0SGFlrjLFZjrSV2YIvNSIUosXW2IxNfn9EK8Bg38DXYHU1ctttswuQ9+3u0j12lK6+zU67ktkULGlMZxZdX+wl5ZLKlHPet5rwAYxh/sRSfvS/fHH5OW2koX4ooiBCLwPPiytpPIj3yprCA3ULODNbK3uMw5y2kIEZoK9sNQd/EpifO+YmZg3ffWr1ecwl3BMa0wphMt3jYIIWokPXdwiRIxU2eonbsLGriMT0gSHLG0bwIAce/cyWO2nu14LPhPtJmiEZHejETgSG0764vGQhXXqlYCu1eaBizoDh/fxch87JWPdDcTxQASsCedrHNiM/YtbYA6WwRYJIZyk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2717869a-9cec-4eb0-6dd4-08d6e979bb7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 05:50:36.4249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Avri.Altman@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4335
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksDQoNCj4gDQo+IE9uIFR1ZSwgSnVuIDQsIDIwMTkgYXQgMTI6MjIgQU0gQmpvcm4gQW5kZXJz
c29uDQo+IDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBUaGlz
IHNlcmllcyBleHBvc2VzIHRoZSB1ZnNfcmVzZXQgbGluZSBhcyBhIGdwaW8sIGFkZHMgc3VwcG9y
dCBmb3IgdWZzaGNkIHRvDQo+ID4gYWNxdWlyZSBhbmQgdG9nZ2xlIHRoaXMgYW5kIHRoZW4gYWRk
cyB0aGlzIHRvIFNETTg0NSBNVFAuDQo+ID4NCj4gPiBCam9ybiBBbmRlcnNzb24gKDMpOg0KPiA+
ICAgcGluY3RybDogcWNvbTogc2RtODQ1OiBFeHBvc2UgdWZzX3Jlc2V0IGFzIGdwaW8NCj4gPiAg
IHNjc2k6IHVmczogQWxsb3cgcmVzZXR0aW5nIHRoZSBVRlMgZGV2aWNlDQo+ID4gICBhcm02NDog
ZHRzOiBxY29tOiBzZG04NDUtbXRwOiBTcGVjaWZ5IFVGUyBkZXZpY2UtcmVzZXQgR1BJTw0KPiAN
Cj4gQWRkaW5nIHNpbWlsYXIgY2hhbmdlIGFzIGluIHNkbTg0NS1tdHAgdG8gdGhlIG5vdCB5ZXQg
dXBzdHJlYW0NCj4gYmx1ZWxpbmUgZHRzLCBJIHZhbGlkYXRlZCB0aGlzIGFsbG93cyBteSBtaWNy
b24gVUZTIHBpeGVsMyB0byBib290Lg0KPiANCj4gVGVzdGVkLWJ5OiBKb2huIFN0dWx0eiA8am9o
bi5zdHVsdHpAbGluYXJvLm9yZz4NCk1heWJlIHVmc19oYmFfdmFyaWFudF9vcHMgd291bGQgYmUg
dGhlIHByb3BlciBwbGFjZSB0byBhZGQgdGhpcz8NCg0KVGhhbmtzLA0KQXZyaQ0KDQoNCg0KPiAN
Cj4gdGhhbmtzDQo+IC1qb2huDQo=

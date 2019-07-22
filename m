Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F716FE17
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 12:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbfGVKts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 06:49:48 -0400
Received: from m4a0040g.houston.softwaregrp.com ([15.124.2.86]:47017 "EHLO
        m4a0040g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727310AbfGVKts (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 06:49:48 -0400
X-Greylist: delayed 1095 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Jul 2019 06:49:45 EDT
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY m4a0040g.houston.softwaregrp.com WITH ESMTP;
 Mon, 22 Jul 2019 10:45:50 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 10:30:45 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 10:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R11EItcA05oBg09T/n8qLqiy6VPNG3+HlfCqucv6oB9T6q8eQ6449WJsmAflu0+NetUxPA27M0war6TNzrZiR7Pk6dQl9UXQ/uO1LFl2daSlJ2KC7lwDRLBGjQbCDuqRWQvyZZh2Q9G3N0XG2o4xIN9mvaTQ50lAzahmbcuJ0LVzae44l4/1yWWQ768N3UG3l3p7/tGE1fE3KCDnQLrwKBeAL2Nxb45NZpAItOozWYsz7kWV+Ti6rlLbKMB+5TSByERHb6TFXzqwx4DWwi31brr6IIGHL20KxgmWqNneCprGBuPqzReWNgK53gupzVKKtfnn3SlGH+shwxvxgm/ePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez+EvbA4+RYRM46k2RHdmWHn1D0NYwH4RL2byT7xxD0=;
 b=bK+fgaVOupJHtGgxFsVERYd5e4TIXTnUviaNx66nE7r8Dme6/MmHU/vsoJx7aBbIHSjyxSi9LraIZYVrEGV03aYYpur/2uWFVsVqrz7ojIJlftb0P5G25E7BPHIaZkQTCrF+3xrb1I1ihqoa/nX72rgxFlI34dvZbxQuO72JhnR94Vv0YNjWsVr+5n+K8YWTSv4ZP00aBzd1XmjfSjharIV0TgAWzv9a0JUrtkbuHPCBX2YPp14RuP/VA7aatvnlBWe8RpdF/sbYDX7kKLaWa+FWYYbufOa7QVTxzUOiMcr5Auv51nFI9JiQBH9mCcKIn2JToIPyT15MbuEn8Xu9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from CY4PR1801MB1909.namprd18.prod.outlook.com (10.171.255.24) by
 CY4PR1801MB1814.namprd18.prod.outlook.com (10.165.88.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 22 Jul 2019 10:30:44 +0000
Received: from CY4PR1801MB1909.namprd18.prod.outlook.com
 ([fe80::1d84:4a66:a3f4:97f8]) by CY4PR1801MB1909.namprd18.prod.outlook.com
 ([fe80::1d84:4a66:a3f4:97f8%3]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 10:30:44 +0000
From:   Matthias Brugger <mbrugger@suse.com>
To:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Nicolas Saenz Julienne" <nsaenzjulienne@suse.de>
CC:     "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 08/18] clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
Thread-Topic: [PATCH 08/18] clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
Thread-Index: AQHVQFImGDIGqXRsiUOxt6xLjNyxhqbWcFsA
Date:   Mon, 22 Jul 2019 10:30:43 +0000
Message-ID: <d18150b3-3c0e-04d3-c40e-c418dcdbcafd@suse.com>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
 <1563774880-8061-9-git-send-email-wahrenst@gmx.net>
In-Reply-To: <1563774880-8061-9-git-send-email-wahrenst@gmx.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::29) To CY4PR1801MB1909.namprd18.prod.outlook.com
 (2603:10b6:910:7a::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mbrugger@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.223.144.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7e39fca-6257-427c-4bd9-08d70e8fa6d8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1801MB1814;
x-ms-traffictypediagnostic: CY4PR1801MB1814:
x-microsoft-antispam-prvs: <CY4PR1801MB181419EA6356CAEB47342DC3BAC40@CY4PR1801MB1814.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(199004)(189003)(7416002)(76176011)(31686004)(86362001)(446003)(2906002)(52116002)(31696002)(478600001)(486006)(186003)(11346002)(2616005)(476003)(7736002)(3846002)(6116002)(66066001)(305945005)(71190400001)(6506007)(229853002)(71200400001)(53546011)(26005)(53936002)(54906003)(386003)(25786009)(14444005)(256004)(36756003)(110136005)(8676002)(99286004)(102836004)(66946007)(316002)(6436002)(66556008)(66476007)(6486002)(81156014)(81166006)(4326008)(8936002)(6512007)(68736007)(66446008)(64756008)(14454004)(6246003)(5660300002)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1801MB1814;H:CY4PR1801MB1909.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 20c6eXuNBruP70bpUnsbuS1FH5plXQ3O53+0eWtd+ChhPGRWLqs1FmiVvKjj+EvKdqOKQDWycbX5IKocQmLOsfh5aH7f5CdJz++gcH6rSlFQrCUTSI0c+hl0bktOC+WP/MxhLwR/G0gkyD7mou5Sl2SvBmb9HTVlvIPo+TAiE4Xs5pWCtsOq+suMTswL+2HXu8qRFamxOB/UtlssS6GOE3UlNCEvFTzmEl9Sjg9p0rqZ/ibHKiN3fVbDVHqkMjLo9MZnpdn3ff5Ubz0DDUPGXULNq35dGyBpK7yPD8+uPIsf56hf8dHPEObo4wyljeSz8qqCBF5GIGKzRYl7mTrw+gKy5MtV7c9hpHrHtnWXzN/F1tEHCNPmux8ws+YyW9JlCIO56l+BX2r45zixe1mcYOc7vZg0v+VcBHKIAe9QyUw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11962E45BAF04149AAFFB38C069C7677@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e39fca-6257-427c-4bd9-08d70e8fa6d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 10:30:43.9359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mbrugger@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1801MB1814
X-OriginatorOrg: suse.com
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCk9uIDIyLzA3LzIwMTkgMDc6NTQsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6DQo+IFRoZSBuZXcg
QkNNMjcxMSBzdXBwb3J0cyBhbiBhZGRpdGlvbmFsIGNsb2NrIGZvciB0aGUgZW1tYzIgYmxvY2su
DQo+IFNvIGFkZCBhIG5ldyBjb21wYXRpYmxlIGFuZCByZWdpc3RlciB0aGlzIGNsb2NrIG9ubHkg
Zm9yIEJDTTI3MTEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gV2FocmVuIDx3YWhyZW5z
dEBnbXgubmV0Pg0KDQpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3Vz
ZS5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2Nsay9iY20vY2xrLWJjbTI4MzUuYyB8IDE2ICsr
KysrKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvYmNtL2Nsay1iY20yODM1
LmMgYi9kcml2ZXJzL2Nsay9iY20vY2xrLWJjbTI4MzUuYw0KPiBpbmRleCAzMjMxYjc2Li5mYmRj
NGUxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay9iY20vY2xrLWJjbTI4MzUuYw0KPiArKysg
Yi9kcml2ZXJzL2Nsay9iY20vY2xrLWJjbTI4MzUuYw0KPiBAQCAtMTE0LDYgKzExNCw4IEBADQo+
ICAjZGVmaW5lIENNX0FWRU9ESVYJCTB4MWJjDQo+ICAjZGVmaW5lIENNX0VNTUNDVEwJCTB4MWMw
DQo+ICAjZGVmaW5lIENNX0VNTUNESVYJCTB4MWM0DQo+ICsjZGVmaW5lIENNX0VNTUMyQ1RMCQkw
eDFkMA0KPiArI2RlZmluZSBDTV9FTU1DMkRJVgkJMHgxZDQNCj4gDQo+ICAvKiBHZW5lcmFsIGJp
dHMgZm9yIHRoZSBDTV8qQ1RMIHJlZ3MgKi8NCj4gICMgZGVmaW5lIENNX0VOQUJMRQkJCUJJVCg0
KQ0KPiBAQCAtMjkwLDcgKzI5Miw4IEBADQo+ICAjZGVmaW5lIEJDTTI4MzVfTUFYX0ZCX1JBVEUJ
MTc1MDAwMDAwMHUNCj4gDQo+ICAjZGVmaW5lIFNPQ19CQ00yODM1CQlCSVQoMCkNCj4gLSNkZWZp
bmUgU09DX0FMTAkJCShTT0NfQkNNMjgzNSkNCj4gKyNkZWZpbmUgU09DX0JDTTI3MTEJCUJJVCgx
KQ0KPiArI2RlZmluZSBTT0NfQUxMCQkJKFNPQ19CQ00yODM1IHwgU09DX0JDTTI3MTEpDQo+IA0K
PiAgLyoNCj4gICAqIE5hbWVzIG9mIGNsb2NrcyB1c2VkIHdpdGhpbiB0aGUgZHJpdmVyIHRoYXQg
bmVlZCB0byBiZSByZXBsYWNlZA0KPiBAQCAtMTk5OSw2ICsyMDAyLDE2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYmNtMjgzNV9jbGtfZGVzYyBjbGtfZGVzY19hcnJheVtdID0gew0KPiAgCQkuZnJh
Y19iaXRzID0gOCwNCj4gIAkJLnRjbnRfbXV4ID0gMzkpLA0KPiANCj4gKwkvKiBFTU1DMiBjbG9j
ayAob25seSBhdmFpbGFibGUgZm9yIEJDTTI3MTEpICovDQo+ICsJW0JDTTI3MTFfQ0xPQ0tfRU1N
QzJdCT0gUkVHSVNURVJfUEVSX0NMSygNCj4gKwkJU09DX0JDTTI3MTEsDQo+ICsJCS5uYW1lID0g
ImVtbWMyIiwNCj4gKwkJLmN0bF9yZWcgPSBDTV9FTU1DMkNUTCwNCj4gKwkJLmRpdl9yZWcgPSBD
TV9FTU1DMkRJViwNCj4gKwkJLmludF9iaXRzID0gNCwNCj4gKwkJLmZyYWNfYml0cyA9IDgsDQo+
ICsJCS50Y250X211eCA9IDQyKSwNCj4gKw0KPiAgCS8qIEdlbmVyYWwgcHVycG9zZSAoR1BJTykg
Y2xvY2tzICovDQo+ICAJW0JDTTI4MzVfQ0xPQ0tfR1AwXQk9IFJFR0lTVEVSX1BFUl9DTEsoDQo+
ICAJCVNPQ19BTEwsDQo+IEBAIC0yMjMwLDYgKzIyNDMsNyBAQCBzdGF0aWMgaW50IGJjbTI4MzVf
Y2xrX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYmNtMjgzNV9jbGtfb2ZfbWF0Y2hbXSA9IHsNCj4gIAl7
IC5jb21wYXRpYmxlID0gImJyY20sYmNtMjgzNS1jcHJtYW4iLCAuZGF0YSA9ICh2b2lkICopU09D
X0JDTTI4MzUgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gImJyY20sYmNtMjcxMS1jcHJtYW4iLCAu
ZGF0YSA9ICh2b2lkICopU09DX0JDTTI3MTEgfSwNCj4gIAl7fQ0KPiAgfTsNCj4gIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIGJjbTI4MzVfY2xrX29mX21hdGNoKTsNCj4gLS0NCj4gMi43LjQNCj4g
DQo+IA0K

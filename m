Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37C86FDD8
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 12:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbfGVKc4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 06:32:56 -0400
Received: from m9a0002g.houston.softwaregrp.com ([15.124.64.67]:45129 "EHLO
        m9a0002g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726120AbfGVKcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 06:32:55 -0400
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY m9a0002g.houston.softwaregrp.com WITH ESMTP;
 Mon, 22 Jul 2019 10:32:42 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 10:31:56 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 10:31:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvfGPX/0exAx4oT9CSrLHXSg5XKPnMURRH7o2lXBOqAOe0/VLDZP16W+2JivXNOKYwDjY+Za3ENLpZzdPcRDRcXMtqHPyRFLcSW07yj6Sfz4JAlFZVvgIJ/kXXpWdHoV/lBGgBO/qY30hOzmHNzxh/G6dqc064Bohf9wz7ibqpHP+RDzf4yQ1Y5uhas27EPpDvvPUAK6rHgX0i5cxnnBnzmlJqYQjlcpAsrLTIbu3bGh2usdeaB6mPSkj3vEW4JaxUYIGGfYT2jPbtWwys5/niahdZYewP4aqrFHyt1XwjaB56exWRtFZCNbCKhoW9/w5x9J48ByrAdhcNsFBRx1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQwfBvzLc/OiDgYEzNXLxGg41GAEFqF8eRwMcDHC9W0=;
 b=mSc7d09LNdouuJX187ZfmwnDtbAeBsJHgmhASvbo7OjFJGraqDFWril6kdqBgmKqnvBJ/uinLrhIthTQ27PLPfqVkfIXE5R/JEs6E/CIu1/+yTHc+d5D3Jae9uWpcB69cjdRsKuXGUeCoEG1ER2shlWcaW3sIvKlUjlcsw3iYTUBsJYvmAyIvl+MAQ7pzbppiF74egKIwwRpYrOT+YFq6zHHjHPyCJQ08dwuorn0vNo7kFHsC7NWX5TVM5F+6I3DVpCZzJWb9+C2q7Nn4NxA/f8GGqhEGcIPrMqmLaQcqgQohA5GVebOQwggXPz3wuXV8ZAjSzGUkBwoR26KSOWU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from CY4PR1801MB1909.namprd18.prod.outlook.com (10.171.255.24) by
 CY4PR1801MB1814.namprd18.prod.outlook.com (10.165.88.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 22 Jul 2019 10:31:55 +0000
Received: from CY4PR1801MB1909.namprd18.prod.outlook.com
 ([fe80::1d84:4a66:a3f4:97f8]) by CY4PR1801MB1909.namprd18.prod.outlook.com
 ([fe80::1d84:4a66:a3f4:97f8%3]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 10:31:55 +0000
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
Subject: Re: [PATCH 09/18] dt-bindings: sdhci-iproc: Add brcm,bcm2711-emmc2
Thread-Topic: [PATCH 09/18] dt-bindings: sdhci-iproc: Add brcm,bcm2711-emmc2
Thread-Index: AQHVQFIyxpmlkhauX06v5OScSoKtrKbWcK+A
Date:   Mon, 22 Jul 2019 10:31:55 +0000
Message-ID: <4749e256-69a2-bf42-e1ec-4dbbdee6c967@suse.com>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
 <1563774880-8061-10-git-send-email-wahrenst@gmx.net>
In-Reply-To: <1563774880-8061-10-git-send-email-wahrenst@gmx.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::17) To CY4PR1801MB1909.namprd18.prod.outlook.com
 (2603:10b6:910:7a::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mbrugger@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.223.144.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a81eea29-7972-4d7b-d4e4-08d70e8fd155
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1801MB1814;
x-ms-traffictypediagnostic: CY4PR1801MB1814:
x-microsoft-antispam-prvs: <CY4PR1801MB18148FB344F6EC6AEE8439DDBAC40@CY4PR1801MB1814.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(199004)(189003)(7416002)(76176011)(31686004)(86362001)(446003)(2906002)(52116002)(31696002)(478600001)(486006)(186003)(11346002)(2616005)(476003)(7736002)(3846002)(6116002)(66066001)(305945005)(71190400001)(6506007)(229853002)(71200400001)(53546011)(26005)(53936002)(54906003)(386003)(25786009)(14444005)(256004)(36756003)(110136005)(8676002)(99286004)(102836004)(66946007)(316002)(6436002)(66556008)(66476007)(6486002)(81156014)(81166006)(4326008)(8936002)(6512007)(68736007)(66446008)(64756008)(14454004)(6246003)(5660300002)(142933001)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1801MB1814;H:CY4PR1801MB1909.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FcE9qQ5lfcbGaPm603/WZeMJoYyicq80GII/3L+BfkdJ6PfgSSk/RBO4ir96Xb75dHxH3R1VH/84n+HjA06ej59Kl4nCQe8Rf4drSZG3fdxHXG1LkvxaX7YCW3FKfNxBIuxdSt30fXSmH5N97nxHfk9JNT09Sj328ZB5rpD341nuTcY/sBirMtZvOiKSiN5lIzOmCXNAhamMkaakHb+yQhOsDtQpBZQCr2pasui+9UktLjjtVs1X0ATRjccEKEqFSQmIXHkFou0LSXgmXvzIc1ijLGTBAstnWCiAT4RVXz0FHhwXZdURBkyZ2MR9olIlZA0eYh/t+WZAcgql9xkPj1/35rFtNJlUoNE1XWm7Fry5Qlhe5n10REqYYluFPQ2ToBnv7mJcS/YmBHjuBl3kE2b3yM06xbQD1w2QGPICanA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8D2F9593A16FE408812D088287C3219@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a81eea29-7972-4d7b-d4e4-08d70e8fd155
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 10:31:55.2279
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

DQoNCk9uIDIyLzA3LzIwMTkgMDc6NTQsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6DQo+IEFkZCBhIG5l
dyBjb21wYXRpYmxlIGZvciB0aGUgYWRkaXRpb25hbCBlbW1jMiBjb250cm9sbGVyDQo+IG9uIEJD
TTI3MTEgYW5kIGNsZWFyaWZ5IHVzYWdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIFdh
aHJlbiA8d2FocmVuc3RAZ214Lm5ldD4NCg0KUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIg
PG1icnVnZ2VyQHN1c2UuY29tPg0KDQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21tYy9icmNtLHNkaGNpLWlwcm9jLnR4dCB8IDQgKysrLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYnJjbSxzZGhjaS1pcHJvYy50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2JyY20sc2RoY2ktaXBy
b2MudHh0DQo+IGluZGV4IGZhOTBkMjUuLjA5ZDg3Y2MgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYnJjbSxzZGhjaS1pcHJvYy50eHQNCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9icmNtLHNkaGNpLWlwcm9j
LnR4dA0KPiBAQCAtNiwxMCArNiwxMiBAQCBieSBtbWMudHh0IGFuZCB0aGUgcHJvcGVydGllcyB0
aGF0IHJlcHJlc2VudCB0aGUgSVBST0MgU0RIQ0kgY29udHJvbGxlci4NCj4gIFJlcXVpcmVkIHBy
b3BlcnRpZXM6DQo+ICAtIGNvbXBhdGlibGUgOiBTaG91bGQgYmUgb25lIG9mIHRoZSBmb2xsb3dp
bmcNCj4gIAkgICAgICAgImJyY20sYmNtMjgzNS1zZGhjaSINCj4gKwkgICAgICAgImJyY20sYmNt
MjcxMS1lbW1jMiINCj4gIAkgICAgICAgImJyY20sc2RoY2ktaXByb2MtY3lnbnVzIg0KPiAgCSAg
ICAgICAiYnJjbSxzZGhjaS1pcHJvYyINCj4gDQo+IC1Vc2UgYnJjbTI4MzUtc2RoY2kgZm9yIFJh
c3BlcnJ5IFBJLg0KPiArVXNlIGJyY20yODM1LXNkaGNpIGZvciB0aGUgZU1NQyBjb250cm9sbGVy
IG9uIHRoZSBCQ00yODM1IChSYXNwYmVycnkgUGkpIGFuZA0KPiArYmNtMjcxMS1lbW1jMiBmb3Ig
dGhlIGFkZGl0aW9uYWwgZU1NQzIgY29udHJvbGxlciBvbiBCQ00yNzExLg0KPiANCj4gIFVzZSBz
ZGhjaS1pcHJvYy1jeWdudXMgZm9yIEJyb2FkY29tIFNESENJIENvbnRyb2xsZXJzDQo+ICByZXN0
cmljdGVkIHRvIDMyYml0IGhvc3QgYWNjZXNzZXMgdG8gU0RIQ0kgcmVnaXN0ZXJzLg0KPiAtLQ0K
PiAyLjcuNA0KPiANCj4gDQo=

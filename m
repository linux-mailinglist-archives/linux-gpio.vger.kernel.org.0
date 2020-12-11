Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9315C2D6F5F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 05:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395404AbgLKEg3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 23:36:29 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18593 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728711AbgLKEgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 23:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607661359; x=1639197359;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vuKSTPQRRL/+1jHmZbL8pSQ2rIoJxWJwnMX3vYYfLNs=;
  b=ebuXHuzxvXPP8yKbJCgsVbtD5OqIbH2PX5xVaKz5umoOc5uwByR2VDLb
   bcv14D9UIZ8K/NFW38pxpGahL+LHK/fKjr9AEyXtdtN7WGGjLGhWM2/l/
   juvNThtLZ8SDP7nmH0P1WyhbAzIgqXGOV1N9Feb5aetDSxvVJIlQYXynX
   aVC55yLRLWl5fsOuLrF4qmllASTVnYizFbgRn17O6GgZ9OO5wsx711O2v
   ikGGDD9HXFxTzlcMepxNgIrVvlt5RrPC5ZrZiwsXIEMoSW1BuQaRR25g4
   Mlqur4iAQqW3akwFDd8bFFMTResI5ZknlS2uaNyeZ7kXgu+aEMKMWBxwM
   g==;
IronPort-SDR: Qm0jDXUGB7y1Vu8NsCy+cCyaLtgsHT0IqXrlVmCo3rlkEPeP/khGY0I/XirYfPTwOYM7t302Yt
 D2ehzOMU3Bua9rhBq6qOYmKwugmh2ewAfOH5W2492AscS5oS7a3jf++kdfiO1xrCZzmZsroZiv
 Pp8pVPcFpAaRvXyNtI0EoOtc89N9/ZLkzphztthhv6jiSS3qiMYgCPPQbrt1ngQ5/u7zsRUeSJ
 VW9gfMIkQLR3bXsgMdzEWodVwMqqYmiNlZqdq1L9dV/ZWm5WYqmrzjNk5Mb3kIAag+HapfB9ee
 U0E=
X-IronPort-AV: E=Sophos;i="5.78,410,1599494400"; 
   d="scan'208";a="154908192"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
  by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2020 12:34:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmlUbeLGwnvv2WpL0oNiTfyavRiE7jeODIDZUY6MZVVqOuOfzxAnyfPVhs2KPTCfCh0K4U3agecXlCHaHZe42LdRPgFqTU719vn2CnnbkDKXD+ZY5ihEhlHwI2u1eh+7pV8aQv8wy0fhQ6sV/AUkoebtAwYyUlsuzbku2Vofzydry/Vf9BmrfFnLQ5tqvZ+9zC/O0r0eUoNHSLuogRhYmCLGNebNrgDZcoQ3Hf+YpPMeFDiKWWRJCa5qADDnH388D0sV4k2fzNpniEJn0CPrkCmNuWdBNSo154JQ/gX6aO3/EPoNVhzhyKdnuWwB84zcZb2iXM72c2FAkL9YdEpX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuKSTPQRRL/+1jHmZbL8pSQ2rIoJxWJwnMX3vYYfLNs=;
 b=i24iefSL0rsXFCXEGwx8H32afxCE03mr+Zex5hSiIeFGE8+zsJ4tF+lBXQ9KEbkecdmjVCGXfU5KNkcgCIgVfJQNe9HJOf3UAw0MvVJES2gwVKVIVJDJvgDvECMzxy7fZ478Olmfbgaxoh3SkVZC91rtMCq17sdIz9IxIByeQo7V+Yo+uZFQO3JXtYrAizgllgDwTLHgncCBTZkft+wp0evMRiBQuDFHFUNIfIqdHw3leUhR2OMSHrR11qMRvs+Al1D/RiSBQioVVZuNNfFxVy/q4sbsuSiJvwy9c+yUAiwxUAHg5nvVd5Cob74GvfqqO0kysmNwYvUcfHC0yW2UwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuKSTPQRRL/+1jHmZbL8pSQ2rIoJxWJwnMX3vYYfLNs=;
 b=T6VBnDKfzyXqZ95Mh3LvS2QRWyXjH41sZfnNZ9BW50fow28TaR3ijITX+GtYxaVt7yXLuRYsl95Yv36cLmMyUCluWp06jfU5Ugwzs9Ucg++bjYAOUKKk7nYwNnTXckvHmhKO9W9Hmo+SIZO6cAZZ3fO8KqqLJOBtzra0YOPhEZQ=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7110.namprd04.prod.outlook.com (2603:10b6:610:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 04:34:51 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 04:34:51 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "palmer@dabbelt.com" <palmer@dabbelt.com>
CC:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 02/22] riscv: Fix sifive serial driver
Thread-Topic: [PATCH v8 02/22] riscv: Fix sifive serial driver
Thread-Index: AQHWzv0+WUHKICqlv0mHeaBjjeB886nxJ2MAgAAojoA=
Date:   Fri, 11 Dec 2020 04:34:51 +0000
Message-ID: <3c3238a00beaab166a67e3baf0ad4714d3c90ef1.camel@wdc.com>
References: <mhng-b369aaef-f262-4ca3-bcda-5bd4ee893332@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-b369aaef-f262-4ca3-bcda-5bd4ee893332@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ad32981-35ba-4a54-aefe-08d89d8e19a3
x-ms-traffictypediagnostic: CH2PR04MB7110:
x-microsoft-antispam-prvs: <CH2PR04MB7110126C2B9FA86510E0B0F9E7CA0@CH2PR04MB7110.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Qfvuaic0wyNQynXBS4gXzoARHcB8ebAji03aOxtYV6gxzgcitlFSGii9uQjXdH+p3U3AHTLzWUljkPzLqO7R71W/gXWuI6JpCd0VtxqMHSiZE5URPvsWkQW85w6ZusZKocMcpVhCxEAiGYztB2CUmNTT/7i6lM17gYTt6M9661u9yIFvKY8AoPJlL4SXC/j4zPVZkviy9HStsY2g3eWHc4EtILZRNKqF6e5DRRhAR6PY2N3OzzWiNelNW5mnEzuSIxrt6Ua9mB7zPENumouAPCa7hyqIeP6aYPXB6UBEm+L4g55jI01+fsMV6sxPRxIFw2IB+TJPjMIkvq1oPAHRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(6486002)(5660300002)(54906003)(6506007)(76116006)(66446008)(64756008)(66556008)(66476007)(186003)(508600001)(66946007)(71200400001)(7416002)(8936002)(6512007)(91956017)(2906002)(86362001)(36756003)(6916009)(83380400001)(4326008)(4001150100001)(8676002)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MUVlTjl3cTBIYUx2RXJyWndxdUpkMHllZXlaSzlVYy9hSGVCQVFNdGphbS94?=
 =?utf-8?B?bm9hZnBnMy92UnFSa3JtSS9Ed0dQMzk2VlMxNHpGWVA4YkxTd3dQZThlTWFY?=
 =?utf-8?B?MVl6cmx5M1dodEVuZmFoOHRncWp1eVhjTUhsREJ3cnFJYUNuZnhQaTdaankz?=
 =?utf-8?B?NzFXRW9tQStaR1k3M2FoYURUcEZ4R3QvekcydVRRL0tpMVRCWjNXQThTSDZh?=
 =?utf-8?B?cndlK25rMXJYMTBXZE1CUFNDN3ZLRGFZUW9OVU5YVnN1YWtuazlVZndkdXhq?=
 =?utf-8?B?VmFXb2twV2c5RWxYNjNJZXg3dHJ3cVBVQjAvQW5ncndpUzdwUnFxaC85Zk5l?=
 =?utf-8?B?eXordnJJdmZ6Mk9YZjM5R3VFbHlpdUZmcFVKc0JveTlzTEt5S0JnWFR2SC9P?=
 =?utf-8?B?Tm1pb3h1NWFJWVRkdUZpNWpWZWxEdURNenlSVDhPZHNiK0hFeFpBVC8rVFZH?=
 =?utf-8?B?Zmw5KzBwbDl5NmtQSlptT0VGb0lUeGhUUnFOalBQUW9SUCtQMW80am5aN2Jj?=
 =?utf-8?B?VjhWa3I3andHZGdYdWd5djF3NDRuSzFoMjFUYk9uV3cxODBpQkN1emx6SzFi?=
 =?utf-8?B?NlZRQXJZSXZReW5nMW9xV05UQjB2dWlWZHhLcVNKdmN6ZUkxOHJRQlFtMkl5?=
 =?utf-8?B?dXdseTFzR3ppRTJ1OHZuaDJaeWVKV243K0J3RG1DOWJpTU44MytmV3ZIc0Ns?=
 =?utf-8?B?aTJ4REtUSjB3RmdyYjBvSjhKSXIyaGpNYlBOZEJJa0haNGRXeS9vcnBrd0Fz?=
 =?utf-8?B?ZllyMVVqMFlBYTYwUyt1Q2g1ZUJMRkgxVHhuZVJrME1FanArYUkyZSsvd3dS?=
 =?utf-8?B?bGJMd3MyTFFVanh6SmV4NVo2MHBTbklrc0E1TVc3TGhZMy84UGZ0TGo5R215?=
 =?utf-8?B?VXlXN1dLbUhiNDFiQ21landLQkQ3YnlpNnRMYjRVZUhERlNRNWlEc0VkRDd1?=
 =?utf-8?B?YTlOd3FTcWNxbUd1S0ZwN3ZNREtneXBrRE1lUURXRUQyVmlwYnhhdGd4V3NJ?=
 =?utf-8?B?bG5ZZE1DZnJSaXQvRlh4WG1lR2ZHZnIxNGR3dENyb0hnTWtkcjZqcVhQMzhs?=
 =?utf-8?B?RnVQN3FvU0ZyeEtaOUhFOURCb3dpRkZCZEFHTTloaWVObmdpZXJ1eUpFNmNv?=
 =?utf-8?B?dDkwYXRRemd6YlQzUUp1Ky9vRVN2ZXJveDY0ZzhZRFFtOWR0WEFDbCs2ZTMy?=
 =?utf-8?B?aEQxYitmMFh0Y01LTTl1S3JGejM1NlNRMkxZNVlFYWtLdWRiNEk0dTI4S012?=
 =?utf-8?B?U1YrUGJ4ejdQREtBUUJGUko0eHVzM2JUdUhuV29ZWHRwbENwZmF3SnZPNlJM?=
 =?utf-8?B?aG9PYVFRMTNiWGtyMkYrMy8yN3pwMmVPS1Q1Rm5DUXFmNXlUTy9vMzRGUVVm?=
 =?utf-8?B?VUd3bW1JbFhGTDBsVHVzWTkzeHJzbHJUUDdNU1lYVUM1VGtzdkJacWNnYlNv?=
 =?utf-8?Q?EH2Xbw7o?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B0F95E23DF45045B4C02D0DBEB6CADE@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad32981-35ba-4a54-aefe-08d89d8e19a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 04:34:51.2814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FoUMWV3+O3vtlcr9hqw53GuMV/H3EYJiB7yIU+dXdEhqHq7F58JfyA3WoIzcLgFwBQrmYIysarywDGGPSee0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7110
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDE4OjA5IC0wODAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToN
Cj4gT24gVGh1LCAxMCBEZWMgMjAyMCAwNjowMjo1MyBQU1QgKC0wODAwKSwgRGFtaWVuIExlIE1v
YWwgd3JvdGU6DQo+ID4gU2V0dXAgdGhlIHBvcnQgdWFydGNsayBpbiBzaWZpdmVfc2VyaWFsX3By
b2JlKCkgc28gdGhhdCB0aGUgYmFzZSBiYXVkDQo+ID4gcmF0ZSBpcyBjb3JyZWN0bHkgcHJpbnRl
ZCBkdXJpbmcgZGV2aWNlIHByb2JlIGluc3RlYWQgb2YgYWx3YXlzIHNob3dpbmcNCj4gPiAiMCIu
ICBJLmUuIHRoZSBwcm9iZSBtZXNzYWdlIGlzIGNoYW5nZWQgZnJvbQ0KPiA+IA0KPiA+IDM4MDAw
MDAwLnNlcmlhbDogdHR5U0lGMCBhdCBNTUlPIDB4MzgwMDAwMDAgKGlycSA9IDEsDQo+ID4gYmFz
ZV9iYXVkID0gMCkgaXMgYSBTaUZpdmUgVUFSVCB2MA0KPiA+IA0KPiA+IHRvIHRoZSBjb3JyZWN0
Og0KPiA+IA0KPiA+IDM4MDAwMDAwLnNlcmlhbDogdHR5U0lGMCBhdCBNTUlPIDB4MzgwMDAwMDAg
KGlycSA9IDEsDQo+ID4gYmFzZV9iYXVkID0gMTE1MjAwKSBpcyBhIFNpRml2ZSBVQVJUIHYwDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2Rj
LmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyB8IDEgKw0K
PiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZp
dmUuYw0KPiA+IGluZGV4IDEzZWFkY2I4YWVjNC4uMjE0YmYzMDg2YzY4IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3Nl
cmlhbC9zaWZpdmUuYw0KPiA+IEBAIC05OTksNiArOTk5LDcgQEAgc3RhdGljIGludCBzaWZpdmVf
c2VyaWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gwqAJLyogU2V0
IHVwIGNsb2NrIGRpdmlkZXIgKi8NCj4gPiDCoAlzc3AtPmNsa2luX3JhdGUgPSBjbGtfZ2V0X3Jh
dGUoc3NwLT5jbGspOw0KPiA+IMKgCXNzcC0+YmF1ZF9yYXRlID0gU0lGSVZFX0RFRkFVTFRfQkFV
RF9SQVRFOw0KPiA+ICsJc3NwLT5wb3J0LnVhcnRjbGsgPSBzc3AtPmJhdWRfcmF0ZSAqIDE2Ow0K
PiA+IMKgCV9fc3NwX3VwZGF0ZV9kaXYoc3NwKTsNCj4gPiANCj4gPiDCoAlwbGF0Zm9ybV9zZXRf
ZHJ2ZGF0YShwZGV2LCBzc3ApOw0KPiANCj4gUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+DQo+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyZGFiYmVsdEBnb29nbGUuY29tPg0KPiANCj4gQXMgYW4gYXNpZGU6IGlzIHRoaXMgYW4gaW50
cmluc2ljIHByb3BlcnR5IG9mIGJlaW5nIGEgc2VyaWFsIHBvcnQsIG9yIHNwZWNpZmljDQo+IHRv
IHRoZSBTaUZpdmUgZHJpdmVyPyAgV2Ugc2VlbSB0byBtdWx0aXBseS9kaXZpZGUgYnkgMTYgcXVp
dGUgYSBiaXQgdG8gY29udmVydA0KPiBiZXR3ZWVuIGJhdWQgcmF0ZXMgYW5kIGNsb2Nrcywgc28g
aWYgaXQncyBzcGVjaWZpYyB0byBTaUZpdmUgdGhlbiBpdCBzZWVtcw0KPiByZWFzb25hYmxlIHRv
IG5hbWUgdGhhdCBjb25zdGFudCBpbiB0aGlzIGRyaXZlci4gIElmIGl0J3MgYSBzZXJpYWwgdGhp
bmcgdGhlbiBJDQo+IGd1ZXNzIHdlIHNob3VsZCBqdXN0IGRvIHdoYXRldmVyIGV2ZXJ5b25lIGVs
c2UgaXMgZG9pbmcuDQoNClRoYXQgcG9ydC51YXJ0Y2xrIGZpZWxkIGlzIG5vdCBzcGVjaWZpYyB0
byB0aGUgc2lmaXZlIGRyaXZlci4gQW5kIHNldHRpbmcgaXRzDQp2YWx1ZSBjb3JyZWN0bHkgbGVh
ZCB0byB0aGUgY29ycmVjdCBtZXNzYWdlIGJlaW5nIHByaW50ZWQuIFRoYXQgbWVzc2FnZSBpcyBh
bHNvDQpnZW5lcmljIGFuZCBub3Qgc3BlY2lhbCB0byB0aGUgU2lGaXZlIHNlcmlhbCBkcml2ZXIu
DQoNCj4gRG9uJ3QgdGhpbmsgdGhhdCBibG9ja3MgdGhpcyBwYXRjaCwgdGhvdWdoLCBhcyBpdCdz
IGFsbCBvdmVyIHRoZSBwbGFjZS4NCg0KSSBkaWQgbm90IGRpZyB0b28gZmFyIGluIHRoYXQgZHJp
dmVyLCBJIG9ubHkgd2FudGVkIHRvIGZpeCB0aGUgbWVzc2FnZSBzbyB0aGF0DQptZWFuaW5nZnVs
IGluZm9ybWF0aW9uIGlzIHByaW50ZWQuIEJ1dCB5ZXMsIEkgYWxzbyB0aG91Z2h0IHRoYXQgYSBs
aXR0bGUNCmNsZWFudXAgd291bGQgYmUgZ29vZC4gVGhlIERUIGJpbmRpbmcgZG9jIGlzIGFsc28g
aW5jb21wbGV0ZSBhcyBpdCBpcyBtaXNzaW5nDQp0aGUgInNpZml2ZSxmdTU0MC1jMDAwLXVhcnQw
IiBjb21wYXRpYmxlIHN0cmluZy4NCg0KDQotLSANCkRhbWllbiBMZSBNb2FsDQpXZXN0ZXJuIERp
Z2l0YWwNCg==

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA2513B709
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 02:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgAOBhP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 20:37:15 -0500
Received: from mail-eopbgr50082.outbound.protection.outlook.com ([40.107.5.82]:28434
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728874AbgAOBhP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jan 2020 20:37:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHOZg60NGhOJOPwhvYy0VX9j3UQPDwokkexXZZaXvJWzddOswaPKcnIGmSOlPP+h0lxShzpjwHo2yFhzlslqoQp7ok+GWbbeWkvJ0maS0HwdHKSlVvadrnR2rEAJOWR7NNfLVaJBRXlq/8INTgViHGcWbBhCJLTulC2Za5uy0dToLOrfzSSCB6QlFqvrJN1VOtJDZJQ2w5mHD3NwLmn3X6Y1lzRcCv8ipjxwnqgRdbRH61/9PqSPfxr+7eveG7ort1N6AzC/4XBqi89f2fSK+0qispperkrtU+IFnlYq8A15Vja3B36iYj9prfncz6o5QtVpTyqjJ1qqJ7vpyVz5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0RDVdt2GzDWXA2g9R4fbEbkiljqwrAwk47vn2ojkaQ=;
 b=javhOPV9sJb9fSBhkMOhzIbHafvzhZHK06soHM4e5zIeYEZYn89GYMaSXhlxFaRs8YkDnMgOfCrd8RLkbOhnxQxD2aKRgsCNbvy9WpEHO4P2i1IoBfopwg+C7I2SIip1B/jAwybN1h0xk7/hwfZwEdJnfeKMCHqyON3wUmWG8zHtk/UcvJWTRMikRU+IIuC+lBH+ZNkm1aqZ3qNLrYXZ5DgEV6i8Op7hgrtCIBgjk7JRdDSJpK1yhSK5rDstjxnWdJ4W0BEpXyD5yoQqTy6qjYT+jitXol59fSyCFfGzY3seV3gwksPi5il6//wGLVDGTVDDeShyfsmnqfPwjyKiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0RDVdt2GzDWXA2g9R4fbEbkiljqwrAwk47vn2ojkaQ=;
 b=ngHv0k88ufTK7abo9pilKUJPqU9WNSPUiJ9ss9a06AFjVpyBhY0u8AlWZT4kWncmMI3KsX8bZlhCSxUwSxkhXkJi/wj6KNN4Zq1OQ8Mg82RIIQPsNdZ+Ke0Cq/VGWGdkWkZm01OV+HauAsTe5+znHLY4MYD+t7ssPOV7jRYAlL8=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3884.eurprd04.prod.outlook.com (52.134.71.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Wed, 15 Jan 2020 01:37:11 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 01:37:11 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 1/3] dt-bindings: pinctrl: Convert i.MX8MQ to
 json-schema
Thread-Topic: [PATCH V2 1/3] dt-bindings: pinctrl: Convert i.MX8MQ to
 json-schema
Thread-Index: AQHVx2u+Jm02FmzcjEemG6LxK5AAHqfq4oOAgAAWwEA=
Date:   Wed, 15 Jan 2020 01:37:11 +0000
Message-ID: <DB3PR0402MB391625FBD72C16E3C84ADCA7F5370@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1578629120-25793-1-git-send-email-Anson.Huang@nxp.com>
 <20200115001357.GA16961@bogus>
In-Reply-To: <20200115001357.GA16961@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e155d372-c940-4aad-8738-08d7995b7140
x-ms-traffictypediagnostic: DB3PR0402MB3884:|DB3PR0402MB3884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3884E210FB5C9AFA570C4B7FF5370@DB3PR0402MB3884.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(76116006)(9686003)(86362001)(55016002)(4326008)(66946007)(66476007)(66556008)(64756008)(66446008)(2906002)(6916009)(478600001)(44832011)(71200400001)(8676002)(81156014)(8936002)(81166006)(316002)(7416002)(54906003)(7696005)(186003)(6506007)(5660300002)(33656002)(26005)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3884;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZwXp1uVi+4BcMAsSjutAFdf4DWF1xv334EpgbDoNw3Z6gPgw59L6ecdAm+L1ESDlYEarEngfaWlDOeOA4RLdDLxrCrr9iIxnoaBD+rQ5DoYngIMFecCrEiggs1rSwa7GMlUjtxKwkhzNs9Z4zjmgcGsDJZMpFsiw/b4dydvwk1KohYbgTSIPoBe9ARCnscdKtjqHGTCS8HNhdL6fzpdzmCGdVZ8dsFs7r2F384QJqzY1ic3rrS5nPWHSDHbg6jPXGUsicWLfaF549nM60l8WZs4IB4ktySli62t00u/ARFCcEZQPhuyN/Hxw7e+BV3wdhqcE5E0WKpZziFno3L2IwNj+hfQaWBNobor7iIhmIf+2bH1KISrEGgkoCi9WKGmuulQTa8wTof+uqAnBWn/h3S3dRPrdcXhT8XzqH9L2fXCyXzzJ2lXSV9+UNqMVdh15
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e155d372-c940-4aad-8738-08d7995b7140
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 01:37:11.6433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEfWKwBfF9UIZJrmCYrGNji1yO+Oa8T4DvzBNqMZbtqwbdWuuJ0WGrClXJOEqaW7IK/pwgFozND9ZdVgGYAxmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3884
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIFJvYg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS8zXSBkdC1iaW5kaW5nczogcGlu
Y3RybDogQ29udmVydCBpLk1YOE1RIHRvIGpzb24tDQo+IHNjaGVtYQ0KPiANCj4gT24gRnJpLCBK
YW4gMTAsIDIwMjAgYXQgMTI6MDU6MThQTSArMDgwMCwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4g
Q29udmVydCB0aGUgaS5NWDhNUSBwaW5jdHJsIGJpbmRpbmcgdG8gRFQgc2NoZW1hIGZvcm1hdCB1
c2luZw0KPiA+IGpzb24tc2NoZW1hDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFu
ZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIHNpbmNlIFYxOg0K
PiA+IAktIHVzZSAiZ3JwJCIgaW5zdGVhZCBvZiAiLWdycCQiOw0KPiA+IAktIHVzZSBzcGFjZSBp
bnN0ZWFkIG9mIHRhYiBmb3IgInJlZiQiOw0KPiA+IAktIGFkZCBtaXNzZWQgInJlZyIgcHJvcGVy
dHk7DQo+ID4gCS0gcmVtb3ZlIHRoZSAibWF4SXRlbSIgZm9yICJmc2wscGlucyIgdG8gYXZvaWQg
YnVpbGQgd2FybmluZywgYXMgdGhlDQo+IGl0ZW0gbnVtYmVyIGlzIGNoYW5nYWJsZS4NCj4gPiAt
LS0NCj4gPiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvZnNsLGlteDhtcS1waW5jdHJsLnR4dCAgICAg
ICAgfCAzNiAtLS0tLS0tLS0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1x
LXBpbmN0cmwueWFtbCAgICAgICB8IDY5DQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkgIGRlbGV0
ZSBtb2RlDQo+ID4gMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvZnNsLGlteDhtcS1waW5jdHJsLnR4dA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1x
LXBpbmN0cmwueWFtbA0KPiANCj4gQWN0dWFsbHksIGl0IGxvb2tzIGxpa2UgeW91IGNhbiBjb21i
aW5lIGFsbCAzIGludG8gYSBzaW5nbGUgc2NoZW1hLiBUaGUgb25seSBkaWZmDQo+IGlzIHRoZSBj
b21wYXRpYmxlIHN0cmluZy4NCg0KVGhlIGhlYWRlciBmaWxlcyBuYW1lLCByZWZlcmVuY2UgbWFu
dWFsIG5hbWUgYW5kIHRoZSBleGFtcGxlcyBhcmUgYWxzbyBkaWZmZXJlbnQsDQpzbywgcGVyc29u
YWxseSwgSSBwcmVmZXIgdG8gaGF2ZSB0aGVtIHNlcGFyYXRlbHkgaWYgbm8gc3Ryb25nIG9iamVj
dGlvbi4NCg0KVGhhbmtzLA0KQW5zb24NCg==

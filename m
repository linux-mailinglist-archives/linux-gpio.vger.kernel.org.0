Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 851AE13898B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2020 04:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733142AbgAMC77 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Jan 2020 21:59:59 -0500
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:6094
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732849AbgAMC77 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 12 Jan 2020 21:59:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQ/fXNeddAEIzeBNh8nCASiiaSZvKmLrvlQ7yXA7+/bYwjmAG13eC3ggIfLXvYXG7dKzPkS9MUiXPsJlMmsjw/MlW3AvQ0nU2XLBDv7/u9f+PjKlf91eHxbqrjxSbsn2L+jCtXbG5tmEfL3ev16v9o9A83NJBoyhc7YiLoZF1Bt1oW6owaQ1846lIHWTVg9eLq+ANwhHfFsrrEtsa2bpH/Bp9jEGyI/v4dKzRe6xTgPUMLgmrhhrWdTwnD4v1MBqUoIEzVcufncXVNm8NbiI/JQPRgdkoGuc6rAtsqxpYUx0cUdj/gFv/sSJkqVd/bnzinb5gwVplM5desJSx8QSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1F/lRAlMXXuLd1x9KQyx7Se/qJyLkT6kNmdjQYChkE=;
 b=jEkR+Dg9koLonOB6XU0FFqqBvKv1FrDJZ1IkiwuOhv5FNXyrSWPIF6QoiMWwqk1WqtcakVW7HKhZ+Aj9FjOyogOYjMQOoeRy0Rh4J3GtqxvAknAzHBzBPMZg5IhjRulu5egVVJ2UokbM7FKVC1Se3GAPo4l4+xMlk9ajxCM1FnCA6rRKJr/rae4v7SPA01TZjUCspGmb+azwJhMDbjc/5PYPxTI0fDu64L1BRt2wejfpniXrbOr7/W8O6fbRap5kZ1cLztdLxJ5EjAFHRCD0GOgjYz9+npwVi6pmvs/+APJtT1g20jCJfM/v5djscBCdI7iXVH5GeL5UHOAiG85cTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1F/lRAlMXXuLd1x9KQyx7Se/qJyLkT6kNmdjQYChkE=;
 b=YD96E6mbInBkU4q2xNQweLqdvjjYSsGY9+UJCkSoUozBDtqC190EoxVcaF3JVvU1J1qrTgjP1eZvVu1qdDt/VIYjJ98FyLlE4hmjip1kzUZ+ilgPWXhrR+u9BnuZjvheHQlUn3SijLFEmuoK1vJfzlIk700yoHkb7apGMNjnk5o=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3833.eurprd04.prod.outlook.com (52.134.67.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.12; Mon, 13 Jan 2020 02:59:51 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 02:59:51 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "maxime@cerno.tech" <maxime@cerno.tech>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V7 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MP
Thread-Topic: [PATCH V7 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MP
Thread-Index: AQHVx2ymLMSOG+yTuUKcujoHYHbAfKfmlP0AgAFWx+A=
Date:   Mon, 13 Jan 2020 02:59:50 +0000
Message-ID: <DB3PR0402MB3916191387B9B7673AE7CA88F5350@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1578629498-26747-1-git-send-email-Anson.Huang@nxp.com>
 <20200112063125.GC27570@T480>
In-Reply-To: <20200112063125.GC27570@T480>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 539c94f1-662b-48c7-83d6-08d797d4a870
x-ms-traffictypediagnostic: DB3PR0402MB3833:|DB3PR0402MB3833:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB38334AA20137D3E9C2BDB1C7F5350@DB3PR0402MB3833.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(199004)(189003)(55016002)(2906002)(8936002)(81156014)(33656002)(6506007)(8676002)(44832011)(54906003)(7696005)(81166006)(5660300002)(9686003)(6916009)(7416002)(86362001)(4326008)(4744005)(186003)(76116006)(316002)(66946007)(52536014)(66476007)(66556008)(64756008)(66446008)(478600001)(71200400001)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3833;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2hpmPUvBpe8QAldcTbPkZmzYYVOxRE9b3WM5X3WCaTDasXRHbXFjBGQ6i6MGpialIBZFoqIbdrsOdp0uTyxVZMNKi7dOxoCmoA3a+qKwqmI9ozCXmANl6Xj8ze5JdSlBDd4WFtrr5yNqrMIvcv7vMJ0T0OYWYEoaQuZpJvi7J3HqeFFkEyYpXXwutdeaKQ3AbU784ylDl+c/54/jR+f3YhvuQiapZSlfR/PRNoxSt6JaQh0XdqyUBqY9bdSWAsiqyzIApE6CLTRMbWpBMZ1icGjUnfmDR+QSUHTvgTLwwYgA0X4c0QQqMXUA5HUWW7Dv1DBR/LacaG43EThdHgE2ympEsnkc7K09i7P0eezFu4zcxqg3ZDyUL/R434AftD8/aQ33d/nTOSmabnruW8haYjvYZLUXHSJwH7ZNeo63T2sBYtnn1OA3VWBVMjVLkdRU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539c94f1-662b-48c7-83d6-08d797d4a870
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 02:59:50.9472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SZi02F/zRLxvfuO/9i4TEegEt60eGIye0zbE0+iOOp4xKLceVQSBxAT8dQxDu7Q006aZp8fi7fSMchNLlW0+iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3833
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjcgMS8zXSBkdC1iaW5kaW5nczogaW14OiBBZGQgcGlu
Y3RybCBiaW5kaW5nIGRvYyBmb3INCj4gaS5NWDhNUA0KPiANCj4gT24gRnJpLCBKYW4gMTAsIDIw
MjAgYXQgMTI6MTE6MzZQTSArMDgwMCwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4gQWRkIGJpbmRp
bmcgZG9jIGZvciBpLk1YOE1QIHBpbmN0cmwgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEFi
ZWwgVmVzYSA8YWJlbC52ZXNhQG54cC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBzaW5jZSBWNjoNCj4gPiAJ
LSB1c2UgImdycCQiIGluc3RlYWQgb2YgIi1ncnAkIjsNCj4gPiAJLSB1c2Ugc3BhY2UgaW5zdGVh
ZCBvZiB0YWIgZm9yICJyZWYkIjsNCj4gPiAJLSBhZGQgbWlzc2VkICJyZWciIHByb3BlcnR5Ow0K
PiA+IAktIHJlbW92ZSB0aGUgIm1heEl0ZW0iIGZvciAiZnNsLHBpbnMiIHRvIGF2b2lkIGJ1aWxk
IHdhcm5pbmcsIGFzIHRoZQ0KPiBpdGVtIG51bWJlciBpcyBjaGFuZ2FibGUuDQo+ID4gLS0tDQo+
ID4gIC4uLi9iaW5kaW5ncy9waW5jdHJsL2ZzbCxpbXg4bXAtcGluY3RybC55YW1sICAgICAgIHwg
IDY5ICsrDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waW5mdW5j
LmggICAgIHwgOTMxDQo+ICsrKysrKysrKysrKysrKysrKysrKw0KPiANCj4gSSBrbm93IHRoZSBi
aW5kaW5nIGRvYyByZWZlcnMgdG8gdGhpcyBpbXg4bXAtcGluZnVuYy5oLiAgQnV0IHRoZSBvbmx5
DQo+IHVzZXIgb2YgdGhlIGhlYWRlciBpcyBpbXg4bXAgZHRzLCBzbyB0aGUgaGVhZGVyIHNob3Vs
ZCBiZSBwYXJ0IG9mIGR0cw0KPiBzZXJpZXMsIHdoaWxlIHRoaXMgYmluZGluZyBkb2MgcGF0Y2gg
d2lsbCBiZSBzZW50IHZpYSBwaW5jdHJsIHN1YnN5c3RlbQ0KPiB0cmVlLg0KDQpPSywgSSB3aWxs
IG1vdmUgdGhlIGhlYWRlciBmaWxlIHRvIERUIHBhdGNoIHNlcmllcyBhbmQgc2VuZCBhIFY4IHBh
dGNoIHNldA0KDQpUaGFua3MsDQpBbnNvbi4NCg0K

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB30206D69
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 09:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389542AbgFXHTB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 03:19:01 -0400
Received: from mail-eopbgr140044.outbound.protection.outlook.com ([40.107.14.44]:52870
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728360AbgFXHTA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jun 2020 03:19:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASS+O/Rlm4/wSdaRPpsoJJdppblpEUX6262ojzBeAXMJt9Nxa1EQhLzW9OJYMStP46HM9Ts8DVvepIE9qypNSXWFcFFrJlw/jrO69ixyISfVSuRG/AICyr43LEoMnDej7ylMBHRf20HSMYJOUH+PJ7VVqfRwhzYfM7TJHNvBgNWnGKtLtDUYIC5qh0CugqRvYARWk046oWbn0zJAIdc4fW75a7ICojRSwhVX1gKGLqCZWhnhTzY6zQmr2fc1KLwYBXggGw8UmF5SJtKqdkeB8CJ3uRb77lW8e/4XdMAljdukrjI8SeGmcwpsYKjfvEn5/lNCopXLmY3sofBH2gEKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZDUADAujMoqX3Ci9fYq9/GmH1VL48jD5EraN+9/c7E=;
 b=Ux/yBPESH6eszPeytyHvH+E3tNJGIy7U+WRKWygjke2jWcXGJkoRI9NZ3MgeDX6x/cnyCBdWdAIEpVv0TuwMOSIsCWO4A5L2a3eoQH2lQXw9HXDmqsOXYL5RBOEZBwhOMYTYJI4N+WiyFQfYHEJQB9jC0tiNzruUFV2zeOFGU22x5pmOglkLkXdS3dqn0gI2kVQqSgfjZR6Ii13Sxc/PeqqRUhSFl/uZz0YpOhM4y9NXT4kaVvx0wokKZBKoR/sMNYQrhys7QjT1+EpG45XlfQq3otoBNsinBAhTlFNp2KwKpylpePazWsWvYXnkehIvao61sH7nGOCCGUcTmayn2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZDUADAujMoqX3Ci9fYq9/GmH1VL48jD5EraN+9/c7E=;
 b=s6Or7Qi44ikRPhjpfXVUMg1LpiPwrKc+sNhDi7fxQQqdZqMGHrD4LRAPSi3B1AKJ2VBc68IY3bI93FglZDtD6lCz3XiwvxDInRd52+ia7aT5in4q9i+yofXgnw/r6emZF0v8q4Ct7UlT9+8AfGhkd5cFhhpY7As276zoNOAEB78=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5895.eurprd04.prod.outlook.com (2603:10a6:20b:b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 07:18:55 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 07:18:55 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V6 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Thread-Topic: [PATCH V6 0/9] Support i.MX8 SoCs pinctrl drivers built as
 module
Thread-Index: AQHWSfGrx/93NtNROkCfwgIHGSlkuajnW0bA
Date:   Wed, 24 Jun 2020 07:18:55 +0000
Message-ID: <AM6PR04MB496614D9762E95226FFBEA8380950@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4424018d-2557-4f54-96da-08d8180edb18
x-ms-traffictypediagnostic: AM6PR04MB5895:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5895C65FDEF6BA427E2976E080950@AM6PR04MB5895.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pyDC+0Gq7zMYl67A1eX/J6nRmbetjsKnBXyfQZ7W18m4Wo+VNtUSuUjQS1pSBX8kNpJedj4IvMSNNCTYltgQSD09BK3Tq/PplkK6hvda1xTGw3WbKnfmLHan8uTb9K4RLutjdkCW6HhM2J9Ba6vLE4TUNjsXqm6KOoIeXuYvWaf6zxHJ4RgxRENECI4d+eN2BfpDNMjYlLEkI/5tq2HMeAEQ0sIqzWE0fu2wUYOaxakNLkh1755nLE6EEbZ2Vkl0MNTE5A18zaKe9+18xQi6W17gc8U1t9mv9yUfIl/CqEEQiP5TnUNhWDc+MfRJqUfwUkqsHt15Ozwl725iDFvHh/P3sT9U8uXzbni6ry95GVhD3ieA9lZfW9bI7yVb15wJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(6029001)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(64756008)(316002)(44832011)(4326008)(66476007)(71200400001)(83380400001)(7696005)(33656002)(478600001)(110136005)(66446008)(5660300002)(52536014)(55016002)(9686003)(8936002)(6506007)(26005)(186003)(66556008)(2906002)(8676002)(76116006)(86362001)(66946007)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Ck1UHggyQNDTGaT0ZiEkXa1uWuuLni3cE4/hAU13lJs6tOJ3WGbqyTyuX5LfncvoLbru/qPgxOdMbZ8H5EUmJfS7qRuJIJcwnmhjlIOl+5dS9UWj+JaLpLVAVZIjqyDAwVUvNmcPc5E2rOBxUC8Qk3GG9axRVlx/3DbeHijXfevn7QNbM2cAuVhtugkVGHk+6jhmyzwaJmfBFSu9CJHFFogUGAScAu8sdZh9AwWhaYxQWfbOTWXm4ANwo0Z/hcguByWOChshXZkdr6M4vA6oVVZzX0RX/OkM/g7QSlcPTocKex/68sTgpj9tAxJAETQKkRL7/1tIcvkjM81km/Sjf7PXpdXoRYMRzpNymuroZcE+3iqPP+ukpQfwbG2JNg0l0RaQkk6LOtyBWk/cdg4e0sUZiT1CIRZPUPVyEv5GwU2XFvnkcdBdtg7Xacbuw+TewJ2Qw0q4fQSyL3XtpPbj7YpUNMv6yUP3mNhdTY+cNJc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4424018d-2557-4f54-96da-08d8180edb18
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 07:18:55.6176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LDoRbFZ1dXteBX8FBAGBtT2BC+ZY5HK1SgwezXNYC12NQGIX/+CDXFtWNLEWL6kZcSV/pCRrgHWCed/CYTpfKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5895
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBKdW5lIDI0LCAyMDIwIDI6MjQgUE0NCj4gDQo+IFRoZXJlIGFyZSBtb3JlIGFuZCBtcm9l
IHJlcXVpcmVtZW50cyB0aGF0IFNvQyBzcGVjaWZpYyBtb2R1bGVzIHNob3VsZCBiZQ0KPiBidWls
dCBhcyBtb2R1bGUgaW4gb3JkZXIgdG8gc3VwcG9ydCBnZW5lcmljIGtlcm5lbCBpbWFnZSwgc3Vj
aCBhcyBBbmRyb2lkIEdLSQ0KPiBjb25jZXB0Lg0KPiANCj4gVGhpcyBwYXRjaCBzZXJpZXMgc3Vw
cG9ydHMgaS5NWDggU29DcyBwaW5jdHJsIGRyaXZlcnMgdG8gYmUgYnVpbHQgYXMgbW9kdWxlLA0K
PiBpbmNsdWRpbmcgaS5NWDhNUS9NTS9NTi9NUC9RWFAvUU0vRFhMIFNvQ3MsIGkuTVggY29tbW9u
IHBpbmN0cmwNCj4gZHJpdmVyIGFuZCBpLk1YIFNDVSBjb21tb24gcGluY3RybCBkcml2ZXIgYXMg
c3RpbGwgYnVpbHQtaW4uDQo+IA0KPiBDb21wYXJlZCB0byBWNSwgdGhlIGNoYW5nZXMgYXJlIGFz
IGJlbG93Og0KPiAgICAgICAgIC0gS2VlcCBpLk1YIGNvbW1vbiBwaW5jdHJsIGxpYmFyeSBidWls
dCBpbiwgT05MWSBpLk1YIFNvQyBwaW5jdHJsDQo+IGRyaXZlcg0KPiAgICAgICAgICAgc3VwcG9y
dCBidWlsdCBhcyBtb2R1bGUuDQo+IA0KPiBBbnNvbiBIdWFuZyAoOSk6DQo+ICAgcGluY3RybDog
aW14OiBTdXBwb3J0IGkuTVg4IFNvQ3MgcGluY3RybCBkcml2ZXIgYnVpbHQgYXMgbW9kdWxlDQo+
ICAgcGluY3RybDogaW14OiBzY3U6IFN1cHBvcnQgaS5NWDggU0NVIFNvQ3MgcGluY3RybCBkcml2
ZXIgYnVpbHQgYXMNCj4gICAgIG1vZHVsZQ0KPiAgIHBpbmN0cmw6IGlteDhtbTogU3VwcG9ydCBi
dWlsZGluZyBhcyBtb2R1bGUNCj4gICBwaW5jdHJsOiBpbXg4bW46IFN1cHBvcnQgYnVpbGRpbmcg
YXMgbW9kdWxlDQo+ICAgcGluY3RybDogaW14OG1xOiBTdXBwb3J0IGJ1aWxkaW5nIGFzIG1vZHVs
ZQ0KPiAgIHBpbmN0cmw6IGlteDhtcDogU3VwcG9ydCBidWlsZGluZyBhcyBtb2R1bGUNCj4gICBw
aW5jdHJsOiBpbXg4cXhwOiBTdXBwb3J0IGJ1aWxkaW5nIGFzIG1vZHVsZQ0KPiAgIHBpbmN0cmw6
IGlteDhxbTogU3VwcG9ydCBidWlsZGluZyBhcyBtb2R1bGUNCj4gICBwaW5jdHJsOiBpbXg4ZHhs
OiBTdXBwb3J0IGJ1aWxkaW5nIGFzIG1vZHVsZQ0KDQpGb3IgdGhpcyBwYXRjaCBzZXJpZXM6DQpS
ZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJk
cw0KQWlzaGVuZw0K

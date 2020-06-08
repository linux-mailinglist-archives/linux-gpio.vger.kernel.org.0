Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E9E1F1686
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 12:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgFHKQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 06:16:20 -0400
Received: from mail-am6eur05on2080.outbound.protection.outlook.com ([40.107.22.80]:6038
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726660AbgFHKQU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 06:16:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbnQfv7wHgk5knaCY/jvsvqejRaAE0uuKA1v0PjDlAQAr2BKYds+5vznG1tpXgUG/YRx2TBRivH5iiFi7u93an9L5jSIOEPV90joEW7rSenMBnW9fe3y8fNooXncEe0EOQTea8+Z07zXZfiocTX9Lnt5qYG2fIxkftuKTZ0zRtP7mVcoDUZXZK03Euub1nZ7Ds0hyvv0MMhPo3+M+a1DhYwWhhudcsquLdnsi8+JibatI90Bhh1xZ2s4P26tcQZlcv+ZdKe6FKOgiYowsm8gMIPP+VnQWHWGGMRZjRov345PV5v+fwMS/M8SQFAt/LK4BcwoQsPoxpcBPRRN4eHv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/EnFgoxAwPjD6xkT97w/wtiAgGA/v/2bjr2PPBNbyQ=;
 b=jmwPRHxwfRNAXKzuSNphYDHtFZOaG3taveZQymzlzeXNry8Vx7kKLB6aydbduZwXA+ex3VMX5iSWCPgVComr7uB/aI2m/EbibT0ik0AUb/qodPyyA0DCp7vr6hLPJCMyq+qIgZhOvsoTIsIM4S4Hrym1RE4Rm3cvCWomMtNQyjxBXP7OrTQdF3OLnpTRIyTX7qW9N8Dxjx8vQ03qYzSBV6xPOvhkg7pbfttAEFVx+MQhUoFjnyoGxCpwQNNQZtIq3gu5cPHRTSmE8qSVTq0KRuO5t45GE3bjrbdO1+WqDDXBuAAVZJFnV2Qdp3HdrKD2jxxTv6szfhFG2f8RLQsgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/EnFgoxAwPjD6xkT97w/wtiAgGA/v/2bjr2PPBNbyQ=;
 b=sr0malMa4LiNh+Afn3tm7wnGT7yqxAtutGEjrEh4yCmv+OWgxKeudfqKYWRKNwATPNCyVE/UrO1qUcalOMcnLDCUJMclFXxawYDhTCcWn5SdkCxTFYPc6EwcizLroVArVA4AAVx18D7nNzfxtPG68w3B0o4HW9G+077gYH6/P0s=
Received: from VI1PR04MB5294.eurprd04.prod.outlook.com (2603:10a6:803:5a::22)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 10:16:15 +0000
Received: from VI1PR04MB5294.eurprd04.prod.outlook.com
 ([fe80::7545:cf5d:b8b0:4ab0]) by VI1PR04MB5294.eurprd04.prod.outlook.com
 ([fe80::7545:cf5d:b8b0:4ab0%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 10:16:15 +0000
From:   BOUGH CHEN <haibo.chen@nxp.com>
To:     BOUGH CHEN <haibo.chen@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to
 avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Topic: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Index: AQHWPX0cOLXEvPpX6UONorwURhW+lajOgHqw
Date:   Mon, 8 Jun 2020 10:16:15 +0000
Message-ID: <VI1PR04MB52940737BB6EEF167B9ABCA390850@VI1PR04MB5294.eurprd04.prod.outlook.com>
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f9eb8b94-3d59-4734-4dba-08d80b94fa71
x-ms-traffictypediagnostic: VI1PR04MB6942:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB69420C14E0DDB88639FCD65F90850@VI1PR04MB6942.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hq+LWeklvgOPBDlbKVJqgUlWCXABvyfLkcQX5vu+nrGRMlzCF/pbiDGHdqA9mhVF4mLbNJMj0J3p0WdwzKBgOtvJ8O21Izof87fCFOxXsxFcCNwzEVFBhzLJJWhEoZTreSIzuHrW88yGshbpAbfGPCPEHoxEbCmtBWBWWS9ca0ZnNW8QmovEzQ4kj/5jhcOMYRBX0/silSBlmVSETZHDtakT34jgMqRKdycoB2nVyFrU3E0o73RUpsyLfJ71hUWu8HYgWVKocytqB13EdEnKKnz0f6frPkbpO5j2Bo6T2/5yxOM1KQ84Tdun6cRXzPbay3rcT6WwfL4YAskxFAFhuo+v56ecbmPM9bEd5tKz1iTLUoLGepxNH9Y3bGHQdelB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5294.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(2906002)(33656002)(4326008)(55016002)(76116006)(66946007)(64756008)(66556008)(66476007)(9686003)(83380400001)(186003)(66446008)(478600001)(52536014)(86362001)(316002)(26005)(7696005)(71200400001)(6506007)(5660300002)(110136005)(53546011)(8936002)(8676002)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: zkcVhqZoUQLcBf9UeJC5S+uqel21u52XyxcR7uJNJV0oVD3mlKs1pe+AZCYBcMtTSgMH5zIQI5DqqApX9krxnpW+Bf6K81FB42Ju7/c1k0vKtKY6Hp81LkKM1yHPfEfryrYR2+zgchrBysZuoG/28V5EY7g5UmeAQE9tPjxeLyh3LjpJQGfyLMyF0lzzwiVo0evIQQu0yYMPt9U8QCZ3zPHhcbftes/jMvobaL7ViBFUFkaswszzFit9oVcTfQjWLkyGEZc2qgONWrA4AZERTSXo5SwQ7FuoHizRafJlxpU/lF0f3LSRPuJfnumRWPDstHyuH9H++pNkBban2ebLp4ePYB4Odo8uOGLHqTUgFNIlwyeZVlJ412yIz5EIIcmWPq1lcZ5LOCxzQuxHk1C4VrgdXGPSUJnoe7ONPdnWRknbyJqDGIidbWLWypYMqW7J5r2dl6NFyyGqygDYU44zfJqALw8oF9MucYgBYwTTXE4=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eb8b94-3d59-4734-4dba-08d80b94fa71
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 10:16:15.6760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6Lmk2lW7F5E2gkkKSLJHbYIUO+6JxFSdU050Iss2qhNQXVrLJOqz2ScbOyazaxxzPErBYBXu5cvsx6OAM0nGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

KyBjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IGhhaWJvLmNoZW5AbnhwLmNvbSBbbWFpbHRvOmhhaWJvLmNoZW5Abnhw
LmNvbV0NCj4gU2VudDogMjAyMMTqNtTCOMjVIDE4OjAwDQo+IFRvOiBBaXNoZW5nIERvbmcgPGFp
c2hlbmcuZG9uZ0BueHAuY29tPjsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiBzaGF3bmd1b0BrZXJu
ZWwub3JnOyBzdGVmYW5AYWduZXIuY2g7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj4gbGludXMu
d2FsbGVpakBsaW5hcm8ub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBkbC1saW51eC1pbXgN
Cj4gPGxpbnV4LWlteEBueHAuY29tPg0KPiBDYzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7
IEJPVUdIIENIRU4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBSZXZl
cnQgInBpbmN0cmw6IGZyZWVzY2FsZTogaW14OiBVc2UgJ2Rldm1fb2ZfaW9tYXAoKScgdG8NCj4g
YXZvaWQgYSByZXNvdXJjZSBsZWFrIGluIGNhc2Ugb2YgZXJyb3IgaW4gJ2lteF9waW5jdHJsX3By
b2JlKCknIg0KPiANCj4gRnJvbTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiAN
Cj4gVGhpcyBwYXRjaCBibG9jayBzeXN0ZW0gYm9vdGluZywgZmluZCBvbiBpbXg3ZC1zZGIgYm9h
cmQuDQo+IEZyb20gdGhlIGR0cyB3ZSBjYW4gc2VlLCBpb211eCBhbmQgaW9tdXhfbHBzciBzaGFy
ZSB0aGUgbWVtb3J5IHJlZ2lvbg0KPiBbMHgzMDMzMDAwMC0weDMwMzNmZmZmXSwgc28gd2lsbCB0
cmlnZ2VyIHRoZSBmb2xsb3dpbmcgaXNzdWU6DQo+IA0KPiBbICAgIDAuMTc5NTYxXSBpbXg3ZC1w
aW5jdHJsIDMwMmMwMDAwLmlvbXV4Yy1scHNyOiBpbml0aWFsaXplZCBJTVggcGluY3RybA0KPiBk
cml2ZXINCj4gWyAgICAwLjE5MTc0Ml0gaW14N2QtcGluY3RybCAzMDMzMDAwMC5waW5jdHJsOiBj
YW4ndCByZXF1ZXN0IHJlZ2lvbiBmb3INCj4gcmVzb3VyY2UgW21lbSAweDMwMzMwMDAwLTB4MzAz
M2ZmZmZdDQo+IFsgICAgMC4xOTE4NDJdIGlteDdkLXBpbmN0cmw6IHByb2JlIG9mIDMwMzMwMDAw
LnBpbmN0cmwgZmFpbGVkIHdpdGggZXJyb3IgLTE2DQo+IA0KPiBUaGlzIHJldmVydHMgY29tbWl0
IGJhNDAzMjQyNjE1YzJjOTllMjdhZjc5ODRiMTY1MDc3MWEyY2MyYzkuDQo+IC0tLQ0KPiAgZHJp
dmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jIHwgNyArKystLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0KPiBiL2RyaXZl
cnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0KPiBpbmRleCBjYjdlMGYwOGQyY2Yu
LjFmODE1NjljN2FlMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9w
aW5jdHJsLWlteC5jDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1p
bXguYw0KPiBAQCAtODI0LDEzICs4MjQsMTIgQEAgaW50IGlteF9waW5jdHJsX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ICAJCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJCQl9
DQo+IA0KPiAtCQkJaXBjdGwtPmlucHV0X3NlbF9iYXNlID0gZGV2bV9vZl9pb21hcCgmcGRldi0+
ZGV2LCBucCwNCj4gLQkJCQkJCQkgICAgICAwLCBOVUxMKTsNCj4gKwkJCWlwY3RsLT5pbnB1dF9z
ZWxfYmFzZSA9IG9mX2lvbWFwKG5wLCAwKTsNCj4gIAkJCW9mX25vZGVfcHV0KG5wKTsNCj4gLQkJ
CWlmIChJU19FUlIoaXBjdGwtPmlucHV0X3NlbF9iYXNlKSkgew0KPiArCQkJaWYgKCFpcGN0bC0+
aW5wdXRfc2VsX2Jhc2UpIHsNCj4gIAkJCQlkZXZfZXJyKCZwZGV2LT5kZXYsDQo+ICAJCQkJCSJp
b211eGMgaW5wdXQgc2VsZWN0IGJhc2UgYWRkcmVzcyBub3QgZm91bmRcbiIpOw0KPiAtCQkJCXJl
dHVybiBQVFJfRVJSKGlwY3RsLT5pbnB1dF9zZWxfYmFzZSk7DQo+ICsJCQkJcmV0dXJuIC1FTk9N
RU07DQo+ICAJCQl9DQo+ICAJCX0NCj4gIAl9DQo+IC0tDQo+IDIuMTcuMQ0KDQo=

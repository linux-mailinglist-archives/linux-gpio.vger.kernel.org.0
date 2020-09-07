Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CE725F55A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 10:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgIGIef (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 04:34:35 -0400
Received: from mail-eopbgr70041.outbound.protection.outlook.com ([40.107.7.41]:10926
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726978AbgIGIea (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 04:34:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCz6jX0blVIyvKTxg4dQa2IbF081oLV7RXMGs4ajpv0iIWp2vpRAEJZDu9J10dlXOobnPtPv9joT5dJewEV1t1nM4y7wImhj+Wfaah0AXJpVQ3uH2DlE9U/gdQ6Y5O29ZkyoX9HvXq9u7I01XygDErD5wf63Pjb4GyUGFcT3mFbsfKyinbQcv3WrxR9S+/luesGqmlsZnWfnOujFBeS0ceUVRfYlgL6PwsvM80TY5z/dXQZC1Y3KV+vyM2sRxBxeOUaw0BxO1YM3t/vVcFYxnfm6WF5EBJy/Gh2iSakwJQIwoYJL93aNmFW+N/RSeUF3bSwgGDOBnyoGvm4WgwMOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHl7244oXU1YYNXxVpliVI7N8+T/c9D2hr5iYbNuRvs=;
 b=X/RmprWHd38i718rFWAC73oZ9yVdfwv9jnxHaAN+hkyWo/R7KNkFwp5c3SlzBXxK3nfSMC10kthmmURKUitGtC1tR8CnpkLWA2YnzwcSCHR6j7q0lDVT5aMo87icZbX/vj2YqX+XGQV6qn7xQf16sf/VOpptYe7QjlzV3k93gc2cIWiFyvwnpspUMIrpUtYS5pYby4Hq6IrY63EqKiYtCCyhWrUXOkPO8u6Ext/c184MvG5a6YNVXjXaTHURj2ur1rHexECjZphjWPqnwidj3kQ5QKImke/lZPRJ/43I+ajekIchH6055As7tQvyqBnDzCg42/pein75zJnBQQ3Ntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHl7244oXU1YYNXxVpliVI7N8+T/c9D2hr5iYbNuRvs=;
 b=aAaxYWfpjVFY7anl0tNsYCfMxt4CfuQ8/5KS8ZZWfK1qhKtmHNsNFpQ8GpzQyC8fTflURhWwEdN8RYAF3+2zUkkn3A1XMwPoJb7HszS08iAgk8PPbH0jh2ekNmQrTmQBLwZBjm7GtqH+0GELGpT5y8J8Vu3QG8TAS5by96F/AMM=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 7 Sep
 2020 08:34:24 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 08:34:24 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
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
Subject: RE: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Topic: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Index: AQHWW4NHWrU0ATUAm0ydC8gIz0Rl9aldKmMAgAAAaEA=
Date:   Mon, 7 Sep 2020 08:34:24 +0000
Message-ID: <DB3PR0402MB391644C769322AA0A285B2BAF5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <AM6PR04MB49669174B941A7A133469CFE80280@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB49669174B941A7A133469CFE80280@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.17.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f2cac316-8b16-4c76-6036-08d85308d397
x-ms-traffictypediagnostic: DB7PR04MB4090:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB409062E8F7ADB00FDC93CB25F5280@DB7PR04MB4090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZwSWVQWXd+gE9wxrLIdECHqacQr8h+Qn1ixxxelUzmYMOa7qvy/2t7ejsveTZ2bQ7vfa6rKuqRcPneGedme4WgV5TUPloRM+VwMZLCG7cXUvEfPrpZCesvIGhttiT32HLjCf901AYcIBOOAIOe4BQNwwccaX5YnfQL81DL4XEqqWWegbyB6cXDiLLhiSaprmd/2HQvgRBf6bmCl+KH5+3D3C74Xwni0pbfQb1crLfluZs0SUZK9m2sFArsGaayk2rjv1EC/rIFJgzi+N2P/z+kTbLEF5cRTAo/P7++WexsHemK+vvIJ5n8o02M16DuAsL6kCd5wtMlOSve2dYhK7Eld63CKFTi/pQM9JqZC/yjf7S/Z7suDsZx9wUzDbrsY3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(478600001)(76116006)(66556008)(66446008)(52536014)(66946007)(66476007)(64756008)(5660300002)(110136005)(8676002)(4326008)(55016002)(316002)(44832011)(6506007)(53546011)(26005)(8936002)(86362001)(7696005)(71200400001)(33656002)(2906002)(83380400001)(9686003)(186003)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 8TIQLXDazv/QZtS9oCSucfM5v8PB/QCT+r72T45V28W0rxc2Lm4I8s2ZnvE3z9SfjL+Oo6MivFJaNDbIBHDhuE5BaDFnboqT7cEU5oW1dFw0S2dqKSbHhAMFBtt4Y7ti7fAj7lst5SO7+74lwPnmjXPS2Hy9kM+RP7uNI7HvedFr3hcuq4E5rlzNwansT5okSVckl+IjVAN6KtYn+PRWS2wpKvAwkL7r7g05eMJ/5gJPdBuysJvsPIOxgqMxXpHd/nZjztEOLbP45+w/eIIa2/RXDenZELSJl74gLsotJCCpX3nnVuJ5//WM7bAILZtsB0/4yBU0R0fv5UYs2g/0bmVXcB/Dvh3akgqvNaBMJO2Wv5pqSDI4Sq/MqLt2u3ryiItE2iMXGF4OIL7DX63m3fa7plfIpmhneOtU64cqRmpqWfGbnxFBqCdWM5AK1UdSnN8JyHKyrkF24L/XMY/C6Hh50NubQ/RsmrK+C/Q7IdjRnFINpYoQjVnobOGd6/qLNghhdZLUL1JbM8Dt+KXBwhHPL1RWPlVbL3OyHGNQz1WwKDASe2QUyn+R/YeBA7qC9p7vVtpx4o4ccLore4/q4tK+Xd42WnaaCIobmVYfWWqwiK9+RQVrS5qNXlp2OlyWEapQ8ImF15qpdHH9LVS1lA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cac316-8b16-4c76-6036-08d85308d397
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 08:34:24.6133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXs50halD5KoU8bq1ECQp0jNqeLTx10SpZtXlYqjzTPLAE8kIXf1jTiI1oR98cc2Uyrp57lnMqquq6vHx3ZwEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzJdIHBpbmN0cmw6IGlteDogU3VwcG9ydCBidWls
ZGluZyBTQ1UgcGluY3RybCBkcml2ZXIgYXMNCj4gbW9kdWxlDQo+IA0KPiA+IEZyb206IEFuc29u
IEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDE2
LCAyMDIwIDExOjA3IFBNDQo+ID4gU3ViamVjdDogW1BBVENIIDEvMl0gcGluY3RybDogaW14OiBT
dXBwb3J0IGJ1aWxkaW5nIFNDVSBwaW5jdHJsIGRyaXZlcg0KPiA+IGFzIG1vZHVsZQ0KPiA+DQo+
ID4gVG8gc3VwcG9ydCBidWlsZGluZyBpLk1YIFNDVSBwaW5jdHJsIGRyaXZlciBhcyBtb2R1bGUs
IGJlbG93IHRoaW5ncw0KPiA+IG5lZWQgdG8gYmUNCj4gPiBjaGFuZ2VkOg0KPiA+DQo+ID4gICAg
IC0gRXhwb3J0IFNDVSByZWxhdGVkIGZ1bmN0aW9ucw0KPiANCj4gVGhpcyBsaW5lIHNlZW1zIG5v
dCBjb21wbHkgd2l0aCB0aGUgcGF0Y2ggYW55bW9yZQ0KPiANCg0KT0suDQoNCj4gPiBhbmQgdXNl
ICJJU19FTkFCTEVEIiBpbnN0ZWFkIG9mDQo+ID4gICAgICAgImlmZGVmIiB0byBzdXBwb3J0IFND
VSBwaW5jdHJsIGRyaXZlciB1c2VyIGFuZCBpdHNlbGYgdG8gYmUNCj4gPiAgICAgICBidWlsdCBh
cyBtb2R1bGU7DQo+ID4gICAgIC0gVXNlIGZ1bmN0aW9uIGNhbGxiYWNrcyBmb3IgU0NVIHJlbGF0
ZWQgZnVuY3Rpb25zIGluIHBpbmN0cmwtaW14LmMNCj4gPiAgICAgICBpbiBvcmRlciB0byBzdXBw
b3J0IHRoZSBzY2VuYXJpbyBvZiBQSU5DVFJMX0lNWCBpcyBidWlsdCBpbg0KPiA+ICAgICAgIHdo
aWxlIFBJTkNUUkxfSU1YX1NDVSBpcyBidWlsdCBhcyBtb2R1bGU7DQo+ID4gICAgIC0gQWxsIGRy
aXZlcnMgdXNpbmcgU0NVIHBpbmN0cmwgZHJpdmVyIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGUNCj4g
PiAgICAgICBTQ1UgcmVsYXRlZCBmdW5jdGlvbiBjYWxsYmFjazsNCj4gPiAgICAgLSBDaGFuZ2Ug
UElOQ1RSX0lNWF9TQ1UgdG8gdHJpc3RhdGU7DQo+ID4gICAgIC0gQWRkIG1vZHVsZSBhdXRob3Is
IGRlc2NyaXB0aW9uIGFuZCBsaWNlbnNlLg0KPiA+DQo+ID4gV2l0aCBhYm92ZSBjaGFuZ2VzLCBp
Lk1YIFNDVSBwaW5jdHJsIGRyaXZlciBjYW4gYmUgYnVpbHQgYXMgbW9kdWxlLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvS2NvbmZpZyAgICAgICAgICAgfCAgMiAr
LQ0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMgICAgIHwgIDgg
KystLQ0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmggICAgIHwg
NTcgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL2Zy
ZWVzY2FsZS9waW5jdHJsLWlteDhkeGwuYyB8ICAzICsrDQo+ID4gZHJpdmVycy9waW5jdHJsL2Zy
ZWVzY2FsZS9waW5jdHJsLWlteDhxbS5jICB8ICAzICsrDQo+ID4gZHJpdmVycy9waW5jdHJsL2Zy
ZWVzY2FsZS9waW5jdHJsLWlteDhxeHAuYyB8ICAzICsrDQo+ID4gIGRyaXZlcnMvcGluY3RybC9m
cmVlc2NhbGUvcGluY3RybC1zY3UuYyAgICAgfCAgNSArKysNCj4gPiAgNyBmaWxlcyBjaGFuZ2Vk
LCA0MiBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL0tjb25maWcNCj4gPiBiL2RyaXZlcnMvcGluY3Ry
bC9mcmVlc2NhbGUvS2NvbmZpZw0KPiA+IGluZGV4IDA4ZmNmNWMuLjU3MDM1NWMgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+ID4gKysrIGIvZHJp
dmVycy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+ID4gQEAgLTcsNyArNyw3IEBAIGNvbmZp
ZyBQSU5DVFJMX0lNWA0KPiA+ICAJc2VsZWN0IFJFR01BUA0KPiA+DQo+ID4gIGNvbmZpZyBQSU5D
VFJMX0lNWF9TQ1UNCj4gPiAtCWJvb2wNCj4gPiArCXRyaXN0YXRlICJJTVggU0NVIHBpbmN0cmwg
ZHJpdmVyIg0KPiANCj4gSU1YIFNDVSBwaW5jdHJsIGNvcmUgZHJpdmVyDQo+IA0KDQpXaWxsIGNo
YW5nZSBpdCBpbiBWMi4NCg0KPiA+ICAJZGVwZW5kcyBvbiBJTVhfU0NVDQo+ID4gIAlzZWxlY3Qg
UElOQ1RSTF9JTVgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNj
YWxlL3BpbmN0cmwtaW14LmMNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3Ry
bC1pbXguYw0KPiA+IGluZGV4IDUwN2U0YWYuLmI4MGM0NTAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jDQo+ID4gKysrIGIvZHJpdmVycy9w
aW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jDQo+ID4gQEAgLTM3Myw3ICszNzMsNyBAQCBz
dGF0aWMgaW50IGlteF9waW5jb25mX2dldChzdHJ1Y3QgcGluY3RybF9kZXYNCj4gKnBjdGxkZXYs
DQo+ID4gIAljb25zdCBzdHJ1Y3QgaW14X3BpbmN0cmxfc29jX2luZm8gKmluZm8gPSBpcGN0bC0+
aW5mbzsNCj4gPg0KPiA+ICAJaWYgKGluZm8tPmZsYWdzICYgSU1YX1VTRV9TQ1UpDQo+ID4gLQkJ
cmV0dXJuIGlteF9waW5jb25mX2dldF9zY3UocGN0bGRldiwgcGluX2lkLCBjb25maWcpOw0KPiA+
ICsJCXJldHVybiBpbmZvLT5pbXhfcGluY29uZl9nZXQocGN0bGRldiwgcGluX2lkLCBjb25maWcp
Ow0KPiA+ICAJZWxzZQ0KPiA+ICAJCXJldHVybiBpbXhfcGluY29uZl9nZXRfbW1pbyhwY3RsZGV2
LCBwaW5faWQsIGNvbmZpZyk7ICB9IEBADQo+IC00MjMsNw0KPiA+ICs0MjMsNyBAQCBzdGF0aWMg
aW50IGlteF9waW5jb25mX3NldChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsDQo+ID4gIAlj
b25zdCBzdHJ1Y3QgaW14X3BpbmN0cmxfc29jX2luZm8gKmluZm8gPSBpcGN0bC0+aW5mbzsNCj4g
Pg0KPiA+ICAJaWYgKGluZm8tPmZsYWdzICYgSU1YX1VTRV9TQ1UpDQo+ID4gLQkJcmV0dXJuIGlt
eF9waW5jb25mX3NldF9zY3UocGN0bGRldiwgcGluX2lkLA0KPiA+ICsJCXJldHVybiBpbmZvLT5p
bXhfcGluY29uZl9zZXQocGN0bGRldiwgcGluX2lkLA0KPiA+ICAJCQkJCSAgIGNvbmZpZ3MsIG51
bV9jb25maWdzKTsNCj4gPiAgCWVsc2UNCj4gPiAgCQlyZXR1cm4gaW14X3BpbmNvbmZfc2V0X21t
aW8ocGN0bGRldiwgcGluX2lkLCBAQCAtNDQwLDcgKzQ0MCw3DQo+IEBADQo+ID4gc3RhdGljIHZv
aWQgaW14X3BpbmNvbmZfZGJnX3Nob3coc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiA+
ICAJaW50IHJldDsNCj4gPg0KPiA+ICAJaWYgKGluZm8tPmZsYWdzICYgSU1YX1VTRV9TQ1UpIHsN
Cj4gPiAtCQlyZXQgPSBpbXhfcGluY29uZl9nZXRfc2N1KHBjdGxkZXYsIHBpbl9pZCwgJmNvbmZp
Zyk7DQo+ID4gKwkJcmV0ID0gaW5mby0+aW14X3BpbmNvbmZfZ2V0KHBjdGxkZXYsIHBpbl9pZCwg
JmNvbmZpZyk7DQo+ID4gIAkJaWYgKHJldCkgew0KPiA+ICAJCQlkZXZfZXJyKGlwY3RsLT5kZXYs
ICJmYWlsZWQgdG8gZ2V0ICVzIHBpbmNvbmZcbiIsDQo+ID4gIAkJCQlwaW5fZ2V0X25hbWUocGN0
bGRldiwgcGluX2lkKSk7DQo+ID4gQEAgLTYyOSw3ICs2MjksNyBAQCBzdGF0aWMgaW50IGlteF9w
aW5jdHJsX3BhcnNlX2dyb3VwcyhzdHJ1Y3QNCj4gPiBkZXZpY2Vfbm9kZSAqbnAsDQo+ID4gIAlm
b3IgKGkgPSAwOyBpIDwgZ3JwLT5udW1fcGluczsgaSsrKSB7DQo+ID4gIAkJcGluID0gJigoc3Ry
dWN0IGlteF9waW4gKikoZ3JwLT5kYXRhKSlbaV07DQo+ID4gIAkJaWYgKGluZm8tPmZsYWdzICYg
SU1YX1VTRV9TQ1UpDQo+ID4gLQkJCWlteF9waW5jdHJsX3BhcnNlX3Bpbl9zY3UoaXBjdGwsICZn
cnAtPnBpbnNbaV0sDQo+ID4gKwkJCWluZm8tPmlteF9waW5jdHJsX3BhcnNlX3BpbihpcGN0bCwg
JmdycC0+cGluc1tpXSwNCj4gPiAgCQkJCQkJICBwaW4sICZsaXN0KTsNCj4gPiAgCQllbHNlDQo+
ID4gIAkJCWlteF9waW5jdHJsX3BhcnNlX3Bpbl9tbWlvKGlwY3RsLCAmZ3JwLT5waW5zW2ldLCBk
aWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmgN
Cj4gPiBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguaA0KPiA+IGluZGV4
IDMzM2QzMmIuLmJkYjg2YzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2ZyZWVz
Y2FsZS9waW5jdHJsLWlteC5oDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9w
aW5jdHJsLWlteC5oDQo+ID4gQEAgLTc1LDYgKzc1LDIxIEBAIHN0cnVjdCBpbXhfY2ZnX3BhcmFt
c19kZWNvZGUgew0KPiA+ICAJYm9vbCBpbnZlcnQ7DQo+ID4gIH07DQo+ID4NCj4gPiArLyoqDQo+
ID4gKyAqIEBkZXY6IGEgcG9pbnRlciBiYWNrIHRvIGNvbnRhaW5pbmcgZGV2aWNlDQo+ID4gKyAq
IEBiYXNlOiB0aGUgb2Zmc2V0IHRvIHRoZSBjb250cm9sbGVyIGluIHZpcnR1YWwgbWVtb3J5ICAq
LyBzdHJ1Y3QNCj4gPiAraW14X3BpbmN0cmwgew0KPiA+ICsJc3RydWN0IGRldmljZSAqZGV2Ow0K
PiA+ICsJc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsOw0KPiA+ICsJdm9pZCBfX2lvbWVtICpiYXNl
Ow0KPiA+ICsJdm9pZCBfX2lvbWVtICppbnB1dF9zZWxfYmFzZTsNCj4gPiArCWNvbnN0IHN0cnVj
dCBpbXhfcGluY3RybF9zb2NfaW5mbyAqaW5mbzsNCj4gPiArCXN0cnVjdCBpbXhfcGluX3JlZyAq
cGluX3JlZ3M7DQo+ID4gKwl1bnNpZ25lZCBpbnQgZ3JvdXBfaW5kZXg7DQo+ID4gKwlzdHJ1Y3Qg
bXV0ZXggbXV0ZXg7DQo+ID4gK307DQo+IA0KPiBBbnkgcmVhc29uIHRvIG1vdmUgdGhpcyBwYXJ0
IG9mIGNvZGU/DQoNCg0KSXQgaXMgYmVjYXVzZSBiZWxvdyBmdW5jdGlvbiBjYWxsYmFjayBhZGRl
ZCBpbiBpbXhfcGluY3RybF9zb2NfaW5mbyBzdHJ1Y3R1cmUgbmVlZCB0byB1c2UgaW14X3BpbmN0
cmwsIG90aGVyd2lzZSwNCmJ1aWxkIHdpbGwgZmFpbC4NCg0KKyAgICAgICB2b2lkICgqaW14X3Bp
bmN0cmxfcGFyc2VfcGluKShzdHJ1Y3QgaW14X3BpbmN0cmwgKmlwY3RsLA0KDQoNCkFuc29uDQo=

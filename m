Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608642226D5
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 17:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgGPPWD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 11:22:03 -0400
Received: from mail-db8eur05on2065.outbound.protection.outlook.com ([40.107.20.65]:20449
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728150AbgGPPWC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 11:22:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNVtg0L1FQdaP3G9kf9Peeg5p/5/Sst6QQ+G1C8+FpZIx9yq1miHOjl+Bcc/0SX8yIj7+1MVA+t+WnV8EwVtlF1ZI1OnxLDQMPCrqc9Zstd3fQJV0fsvMtIm/6N1ek9/+TrHtOFvgwSyTuhJQDj6ZiDWbsTEjL1iJvyB6ylmqU6aZ6s/PvAzqzdLQUU49DlEOBG3H8c9+TBKnbP+PZB6BaNJxy/WczwYUCv4oXCYrYDfzInJcSYkYhEGu3c/rINGOZxs5SdDzyLeYRj9dIFsgpYUaPnMB8kXtV5fzg/Y7RiFu2/hF+viapY8Qc9SUGMo0+OjO68NWuDeNG9V6naycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gys8RntV6GQAINAXAMmQ4Y7rnlOo78//SkEzXt7ipHM=;
 b=mAHNcstBkSHnOXlODSLJITk21ADJYkH36E5QNotjYRH0eP0pCxkfsd88XlRdgYi3R4ZsHnMMLCrXd7a0sp2Ngg1yTE+SxWC3DNVvdT4ZUTaHCcQXX9k5C5fRamyRyIdcZblY+wXxZdEUeFbASJwscS0TSzcVZOrBRe2bzT5V0kCmMmTff42gcnQ7/Lhe6GAFR2RBwehwUOWzVt2yjcDNc6aEo49csojtNFoPBCS59sW/5QoitSvol4vOzxdvJOvWbLeX/3fH9wPVq9D5b1cEEJEsC8679LM57K/IWVZQ6lyuGPgBfXmbS7lb7G7Zn79qY1INSHarXcqzlbDYmxrt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gys8RntV6GQAINAXAMmQ4Y7rnlOo78//SkEzXt7ipHM=;
 b=MuN+e1HP+rcuD7onsaqUxlsNVjYAV0UCMG9uhqkqcGOXLOS4tnE/X3ihMsuDulS14LTk73+Z9cDcYRhoyAqOT5+ANsUjVv+muD/N7EpyPC+eSSHk1oB2aLkdmCnIT9snQ/6TSQ2bc6ymGwAMDaCyPTzvZmCl3cQBcS1qTwUJ+G4=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 15:21:59 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 15:21:59 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Daniel Baluta <daniel.baluta@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
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
Thread-Index: AQHWW4NHWrU0ATUAm0ydC8gIz0Rl9akKUIoAgAABVNA=
Date:   Thu, 16 Jul 2020 15:21:58 +0000
Message-ID: <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
In-Reply-To: <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e5a4d184-e7fb-44ca-b012-08d8299bfb9e
x-ms-traffictypediagnostic: DB6PR0402MB2933:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB293387366543EE1B2E7780CAF57F0@DB6PR0402MB2933.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OnUq4dD+VqtyGJR2SNyhRVlxnN7NFuI8noGSdBIZFZYGOOrmzuWWB11ci5Fl2uQeSbygQXSUNBIj4aF4zE4wSvFieF/hKsLdaodFtX8NGkW4eLv6ZJEP5SmPlxLWF8v0BtbY0OTTangRljV3JPUOMUrU6vxYMWPRVh9xwqVCoslGr6dtSf04y5BN5yDDonrTSsSNdUJYeNDpsQJvUeI3wRJvRyKYFDcKPFaJupXYKvr6My7Bh7coZ8GO5wcM6p3LcXDmreYkBFeI2mjNUtbdq6J1ld//9UNx4ABXajQRcPO4xCgeQgYBAn2cSgF4oSLbsvbIbgKH9Z+Ls7Mv7gfi5NH/X8mbAB7t06CCmMr+W+DxFEqO9HbYJvu+CG1X7xYc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(2906002)(83380400001)(76116006)(5660300002)(66946007)(66556008)(66446008)(64756008)(33656002)(66476007)(26005)(4326008)(478600001)(316002)(186003)(8936002)(53546011)(6506007)(86362001)(8676002)(55016002)(52536014)(110136005)(7696005)(71200400001)(44832011)(9686003)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: d2wNVzkt2BmoKo1fdz6E4xFhyGYxD6jWI94OnRFGKRBEIKh+IKRjjvn8vN02+VkspXRVcddLq5LHszkb0MEGHwrej6lIAOa/NCFid+uOFaOA1RuuiQ3cUkz9wtMU+LA1LQJxbuLglo1Hrw8niLvnl9FXnIzNVhdLkMigWjcJAolzami6DCmbvlGHsaNa75hbLht9crX08dfUz7Sx6dyGd7hDMn+CXeLpruHjGRz+jFYDcALjVrT7IBgYdMeqpzbt3QjNZ0aFrJUAQOGqF9B8bkFkGD+5rpO/7TfMuLaSChXb7fq5e21tTKaudouwSZIuQNnCi/XyVt4uiSIO43XKZ+sLiXtSS4HJQW1/bBOxpqJXnWZDZd2tyHnU0lwnwACccw/OtLS/OPP72UEQKlCaYGTiqtohOfnD3q/koQZLMsgib5xEuJ+4dH6U90aArkhLC4Gie6iC+Tt48JP7JX+aM1QuZ/yayFCj+mnCRiEnRexHwk6o5CUVjz91GmP3jTNR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a4d184-e7fb-44ca-b012-08d8299bfb9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 15:21:58.9546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3nKWUv40tv0makeDpPeHvdC0KOzl+JIwD1mYJ0zOYubkkF5tuF/Q0CmDhaJHRX92nKzlpGzpqX6iijgM5Xym/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIERhbmllbA0KDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIHBpbmN0cmw6IGlteDog
U3VwcG9ydCBidWlsZGluZyBTQ1UgcGluY3RybCBkcml2ZXIgYXMNCj4gbW9kdWxlDQo+IA0KPiBI
aSBBbnNvbiwNCj4gDQo+IEZldyBjb21tZW50cyBpbmxpbmU6DQo+IA0KPiBPbiA3LzE2LzIwIDY6
MDYgUE0sIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IFRvIHN1cHBvcnQgYnVpbGRpbmcgaS5NWCBT
Q1UgcGluY3RybCBkcml2ZXIgYXMgbW9kdWxlLCBiZWxvdyB0aGluZ3MgbmVlZCB0bw0KPiBiZSBj
aGFuZ2VkOg0KPiA+DQo+ID4gICAgICAtIEV4cG9ydCBTQ1UgcmVsYXRlZCBmdW5jdGlvbnMgYW5k
IHVzZSAiSVNfRU5BQkxFRCIgaW5zdGVhZCBvZg0KPiA+ICAgICAgICAiaWZkZWYiIHRvIHN1cHBv
cnQgU0NVIHBpbmN0cmwgZHJpdmVyIHVzZXIgYW5kIGl0c2VsZiB0byBiZQ0KPiA+ICAgICAgICBi
dWlsdCBhcyBtb2R1bGU7DQo+ID4gICAgICAtIFVzZSBmdW5jdGlvbiBjYWxsYmFja3MgZm9yIFND
VSByZWxhdGVkIGZ1bmN0aW9ucyBpbiBwaW5jdHJsLWlteC5jDQo+ID4gICAgICAgIGluIG9yZGVy
IHRvIHN1cHBvcnQgdGhlIHNjZW5hcmlvIG9mIFBJTkNUUkxfSU1YIGlzIGJ1aWx0IGluDQo+ID4g
ICAgICAgIHdoaWxlIFBJTkNUUkxfSU1YX1NDVSBpcyBidWlsdCBhcyBtb2R1bGU7DQo+ID4gICAg
ICAtIEFsbCBkcml2ZXJzIHVzaW5nIFNDVSBwaW5jdHJsIGRyaXZlciBuZWVkIHRvIGluaXRpYWxp
emUgdGhlDQo+ID4gICAgICAgIFNDVSByZWxhdGVkIGZ1bmN0aW9uIGNhbGxiYWNrOw0KPiA+ICAg
ICAgLSBDaGFuZ2UgUElOQ1RSX0lNWF9TQ1UgdG8gdHJpc3RhdGU7DQo+ID4gICAgICAtIEFkZCBt
b2R1bGUgYXV0aG9yLCBkZXNjcmlwdGlvbiBhbmQgbGljZW5zZS4NCj4gPg0KPiA+IFdpdGggYWJv
dmUgY2hhbmdlcywgaS5NWCBTQ1UgcGluY3RybCBkcml2ZXIgY2FuIGJlIGJ1aWx0IGFzIG1vZHVs
ZS4NCj4gDQo+IA0KPiBUaGVyZSBhcmUgYSBsb3Qgb2YgY2hhbmdlcyBoZXJlLiBJIHRoaW5rIGl0
IHdvdWxkIGJlIGJldHRlciB0byB0cnkgdG8gc3BsaXQgdGhlbQ0KPiANCj4gcGVyIGZ1bmN0aW9u
YWxpdHkuIE9uZSBmdW5jdGlvbmFsIGNoYW5nZSBwZXIgcGF0Y2guDQoNCkFjdHVhbGx5LCBJIGV2
ZXIgdHJpZWQgdG8gc3BsaXQgdGhlbSwgYnV0IHRoZSBmdW5jdGlvbiB3aWxsIGJlIGJyb2tlbi4g
QWxsIHRoZSBjaGFuZ2VzDQphcmUganVzdCB0byBzdXBwb3J0IHRoZSBtb2R1bGUgYnVpbGQuIElm
IHNwbGl0IHRoZW0sIHRoZSBiaXNlY3Qgd2lsbCBoYXZlIHBpbmN0cmwNCmJ1aWxkIG9yIGZ1bmN0
aW9uIGJyb2tlbi4NCg0KVGhhbmtzLA0KQW5zb24NCg==

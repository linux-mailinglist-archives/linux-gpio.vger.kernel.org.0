Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE611F63E2
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 10:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgFKIoT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 04:44:19 -0400
Received: from mail-db8eur05on2073.outbound.protection.outlook.com ([40.107.20.73]:2881
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726748AbgFKIoS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 04:44:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZTpKhK2cqjUOCW7cM97XuaggFPotOXmB+4pu2P5DBy+RWpKBemdSKYtZr2da35IZw2RaRBqrFqwrGxqig4M+dwFHkP6LubyhVKe2ZbgLxpykJWscwTwzlQlg4BJ96e7XJ7cbTTC1F+oIWcgLHkSXJue/fu0NdPG3mhLXzUJHnutUZe4plxw6xogJNoBOgmtCcTw8aRoiJ80e25r20DZAw35H1MVHv18fi2/bQKl99EhRxekQzkgQB45RMeqIxezG52CAprls56e/3zpRo6dYywqZBjgZTyoG/1rCEAicEddIYhwuglSr+igl+R/7AYhEcfow2PyrOkNfwu/nbF68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpuXGIoQIUfWNUTvuSh8cn9nwQTlb/eY0iu8ggjLlEk=;
 b=Xa3dpiStHT5q/7AJj6/nr70Ee8JH9gQKxTthmAq6bWTOZJ5t/hIXBWH8edN6tmvzoUtA822Xkm2LE4VtkAg/wPldZ08FBjQdQrmn+W/MzO8KxMx9+ipV0gHJ+X6GzbZS5W2AQydE/lmuyO/xDnh8K171UIIjrAHsOa7yluLmIBwHBCj38pIq4b19XrNd91hZs6B0GYPdd2q2NRX8rHGNp4LSRAtLrGTCxObrA2CDsbwe1H//UWq1/EmbNy72jKuSTcxS6ff5m1soQYgOKzrX0DKq/oIvUdskK5BujQmglSuMiOmDsvF91d1pPA6N5vwHR1qt+nzi+9o9ro25aGlyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpuXGIoQIUfWNUTvuSh8cn9nwQTlb/eY0iu8ggjLlEk=;
 b=cm8PkrG1cKdLgCDP48gU02Is26F+MYbU1Eh6lvVr4uNua0uiamuUGzbCFxqcBL13+lrOzNQWHmTgDPMnhrdKtMiPeU/lFe+edbedlLuxUHTnzD9v2xiKVQ436pC6gARbXNJ5r/HaDhFyVIEz1U2lrfF8yImTryEIvEiawx8+u+E=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB3PR0402MB3643.eurprd04.prod.outlook.com (2603:10a6:8:5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 08:44:14 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3088.018; Thu, 11 Jun 2020
 08:44:14 +0000
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
Subject: RE: [PATCH V4 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Thread-Topic: [PATCH V4 0/9] Support i.MX8 SoCs pinctrl drivers built as
 module
Thread-Index: AQHWPv5bWyCCa1jyBkSPB8P41zHbxKjTGD+AgAABMwA=
Date:   Thu, 11 Jun 2020 08:44:14 +0000
Message-ID: <DB3PR0402MB3916AF541FC5692D00625EECF5800@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1591775865-26872-1-git-send-email-Anson.Huang@nxp.com>
 <2dfc7a60-1e96-190b-7385-89a843312d80@nxp.com>
In-Reply-To: <2dfc7a60-1e96-190b-7385-89a843312d80@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.13.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2e510dce-1831-477c-7c7d-08d80de39ec3
x-ms-traffictypediagnostic: DB3PR0402MB3643:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB36436353AF13CD8F03077F4FF5800@DB3PR0402MB3643.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYEQW9MJ+pSkKYO24LV7HorQ4dpIQB0X/SXhew2bduwnfrNz6fl08vE1jXw78LjkUZLdoGiSo746AvhokGVwelRAQuvYf9iVsgHytaq6J/KO5v9QR2Ekfv3eaBAtBSlFxTOI0cPeGZJXbube4r/Tkvxhg5WzI4KzBkS1z+Jx+IhyNjx6aCeM17zysraRoU+w8L7SjaSK1F7ySoKTJGrqdIA4VUfZPEpgQ4rHRuaW1jYwlZhSbsQ0FRhzGcok0FCOO8fOrx6C3J8MmEVY6WPHOAjzyBTACAabAmH3bOP2DrQUxe3i1C13hzZzEj1GYZXgkJMhVpSyh1SAc7cBCOCEx5Bp6/1L+9/ttipUdaGl6lYIeUGSHBwymMixnJy0B38h
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(6029001)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(52536014)(8936002)(2906002)(8676002)(316002)(66556008)(55016002)(4326008)(9686003)(5660300002)(83380400001)(33656002)(66946007)(26005)(76116006)(110136005)(6506007)(86362001)(478600001)(66476007)(44832011)(7696005)(66446008)(71200400001)(186003)(4744005)(64756008)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 0FAuCj5W5O4n4xP1P+XSAFWDxntDmMy+DICrJposQZCNA2TLrDuIeYyWeRhVU4HPyECPAv8e/ZX/3gQkDZM0ZDnefho9gcXsjOvvnkyZV9lPG3SDJs8HVEkwqfMISFOo96fiYJsXRu4DurRYH49/QnbFUbukOXoa8EL8zRH7Am7hYQFX4hNOurmvgNdEylPlgImPAddxYNdUlbFHKvCk9Aj84M1kqVRGezLm0bYeqTtbEuBcJgSJ8Tylbjx2oXgJKwVzDnYtEurpzWuok4Bnm3Xi3cec5tkkqBDi4vS/t88NGW3an8xDoQAEPHNq8Z8/AFU+76Wvz5cIArhhqFAxZMZh/zwGhJTUcJwGe+pROxrRVi6tAHFDa2DamR2pFC48Yc+Uj+EbN/9LeSlxA1IMyQhoPGAo4GmKodJC4L4sXmagtRMksYQ3TPN0HWKs28HMs+xmtZQqS1i3I/qDBRBaCEQMAGxvbL4PjbWonMEscFiZMyxBjlF6fjZgot4pnBqg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e510dce-1831-477c-7c7d-08d80de39ec3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 08:44:14.4154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Ff4ynEWvXf0xHYtWNfYSQgAimgEynXk+cZibegW5+T1yyjf+wyuEDk1cSVKS+x4KSZQPqHFMv2XYfTU0YOznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3643
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIERhbmllbA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjQgMC85XSBTdXBwb3J0IGkuTVg4
IFNvQ3MgcGluY3RybCBkcml2ZXJzIGJ1aWx0IGFzIG1vZHVsZQ0KPiANCj4gSGkgQW5zb24sDQo+
IA0KPiBQYXRjaCBzZXJpZXMgbW9zdGx5IGxvb2tzIGdvb2QgdG8gbWUuIEkgaGF2ZSBhIGNvbW1l
bnQgYWJvdXQgYWRkaW5nDQo+IA0KPiB0aGUgTU9EVUxFX0xJQ0VOU0UuIFRoaXMgaXMgYSBwcmV0
dHkgaW1wb3J0YW50IGNoYW5nZS4NCj4gDQo+IA0KPiBDYW4geW91IHBsZWFzZSBhZGQgdGhpcyBj
aGFuZ2UgaW4gYSBzZXBhcmF0ZSBwYXRjaCB3aXRoIGEgcHJvcGVyIGV4cGxhbmF0aW9uDQo+IA0K
PiBvZiB3aHkgaXQgaXMgbmVlZGVkLg0KPiANCj4gDQo+IE1vc3QgbGlrZWx5IGl0IGlzIGJlY2F1
c2UgaXQgd2FzIGZvcmdvdHRlbiBpbiB0aGUgcHJldmlvdXMgcGF0Y2hlcy4NCg0KWWVzLCBpdCBp
cyBvYnZpb3VzbHkgbWlzc2VkIGluIHRoZSBwcmV2aW91cyBwYXRjaGVzLCBhcyBwcmV2aW91c2x5
IHRoZXNlIHBpbmN0cmwgZHJpdmVycw0KZG8gTk9UIHN1cHBvcnQgbW9kdWxlIGJ1aWxkIGF0IGFs
bC4NCg0KQW5kIE1PRFVMRV9MSUNFTlNFIGlzIGEgTVVTVCB3aGVuIGRyaXZlcnMgc3VwcG9ydGlu
ZyBtb2R1bGUgYnVpbGQsIGJ1aWxkIHdpbGwgcmVwb3J0IGZhaWx1cmUNCmlmIG1vZHVsZSBsaWNl
bnNlIG1pc3NlZCwgc28gSSB0aGluayBpdCBpcyBhbHNvIHBhcnQgb2YgdGhlIG1vZHVsZSBidWls
ZCBzdXBwb3J0IHBhdGNoLA0KZG8geW91IG1lYW4gaXQgaXMgYmV0dGVyIHRvIGFkZCBhIHNlcGFy
YXRlIHBhdGNoIHRvIGFkZCB0aGUgTU9EVUxFX0xJQ0VOU0UgdG8gYWxsIHBpbmN0cmwgZHJpdmVy
cyBtaXNzaW5nIGl0Pw0KTWF5YmUgd2UgY2FuIGdldCBtb3JlIG9waW5pb24gZnJvbSBtYWludGFp
bmVyLCBJIGFtIE5PVCB2ZXJ5IHN1cmUgd2hldGhlciBpdCBpcyBiZXR0ZXIgdG8gc2VwYXJhdGUN
CnRoZSBtb2R1bGUgbGljZW5zZSBhcyBhIHNpbmdsZSBwYXRjaC4uLi4NCg0KdGhhbmtzLA0KQW5z
b24NCg==

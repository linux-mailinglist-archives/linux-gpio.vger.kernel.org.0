Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8908512474C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 13:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfLRMxk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 07:53:40 -0500
Received: from mail-eopbgr150077.outbound.protection.outlook.com ([40.107.15.77]:10724
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726545AbfLRMxk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 07:53:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yjg6WyTJoTnuPchLTtCvPGuMibDf6QWrNwkh41yC0+b6Sxdl9594nt2cEsDs1GtWiuD6UzjIOqSFGeZ6OXqT8u19TCmOWy/ZiizsOfvfDVtzQPl132DBkm80uKT15vK5tWncDHvxug3sCZQMaZUfzQ0nVNqh+zpn/wQSb//YcKJWMELNnLq4/Q29jwhLafwjxzS180+67BquHC947bEMAol3CjDF+K0JmdjK5UJZ6rZYVDVXb1r9vlSNpUSFqKcftzhuael6ofkg30Ryi5FwTC4U87cK5CnxnigQ7ZACSqfxUGjlPadazlEO5uuuYBIjb2Y6kam38FvD/ud7jpsrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sYiC5a53T12wfqXA/aZn15QyMiCp+e1OKZWyrsR/ok=;
 b=hrrsxG2OJHhpsWynb6VvWjCgC0eYEakSNAA/noUf3U5o7P89XMcJ6RqI8O3Ecrj1a8DUoY7l4hWnNJbiUa0Xp29pI9OURML6qZteCD8B0AIgKAGfdrSsu4IoAC+q1hFkFQASUpOaqy8Y6avBn6sAgjJlUT9E82iyztg72ZqDbM6MG9GkJZESNgEt+L2i6r0Y5f/rKuF99CJuT0N4pJ8lXvAu61Chq/imYCJgd+Pn78NOUQ7iLo30O/WirKg1zpZnEBDhwmYlSRiIKRMXf2JxtlQMUpPwcUxJ0IPtSecWP0mebOmS3ajjI2MvBvpZUO/+w7EtoS4o8lDc/VbDx+hfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sYiC5a53T12wfqXA/aZn15QyMiCp+e1OKZWyrsR/ok=;
 b=Kknc+xgpFS4L7gUXeMeitU56jCfTVX0Q7SbTgUoAIZyL8O/yjqPK2I7wmEMrRFXKlOsmeiHJWIU8fLkMpa2ZjQ7VkcKSm5oFjInMUVC5QlbljovyMCyoRdpNKV5OMr0TbrikJN6R9KS7Rl6AVgMvQdy2IVmHvQCGC2H99ovDNLU=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB7091.eurprd04.prod.outlook.com (10.186.129.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Wed, 18 Dec 2019 12:53:37 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29%7]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 12:53:36 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
Thread-Topic: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
Thread-Index: AQHVtaDOy35Q6KpKLESPO8UEr8sdH6e/17qAgAAA/vA=
Date:   Wed, 18 Dec 2019 12:53:36 +0000
Message-ID: <AM0PR04MB4481B3EAB2DDC42A137E8AAB88530@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
 <CAOMZO5DeA24EUjr-E=V=tGNaZ7UkOEi+F5-kEBqEB288DSNSoA@mail.gmail.com>
In-Reply-To: <CAOMZO5DeA24EUjr-E=V=tGNaZ7UkOEi+F5-kEBqEB288DSNSoA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 76324939-dc25-4b05-19c2-08d783b94c24
x-ms-traffictypediagnostic: AM0PR04MB7091:
x-microsoft-antispam-prvs: <AM0PR04MB70913FF7763FFC57C128806288530@AM0PR04MB7091.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:335;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(71200400001)(76116006)(33656002)(81156014)(7416002)(54906003)(55016002)(7696005)(2906002)(66946007)(8676002)(4326008)(66556008)(6506007)(64756008)(66476007)(478600001)(186003)(53546011)(66446008)(81166006)(9686003)(86362001)(52536014)(44832011)(8936002)(4744005)(966005)(316002)(6916009)(5660300002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB7091;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SIrZViJ2jxbZM5BBOGLXOoirDxWp8lYLeFOY9Cuvile6R/S/AreLoehXmcTA3U2icbGPxaz++SoRSBLOWdzBUnuqmju8YbUEPFS/WloNl7sG6DywH208Q45UonM7sVCBw8jGVS2bjlhpPwNwIGgbuz4tLqBosRW8LR68/uASbM4ACYx9kizdm6afeKap+gpa484a3yr+3XDNOKvJIiuim2doWPLzF/pZl4Ic6pqfV0Kq8uEuuLGaPK4odPlC2jHKEoEKdXaxVQL8x3gDUucC5izEHRAj2MOQ0j16zUWjU19FFdqfwnv+4LPhZCkDoHbb46NVmz4f2VKjov7jpkXgrUFTP/bJlDqRsjAEPTEfa3uqmlgt0MeB29U8PO8A+kfFQcvxH1yantOMzIVsV3mlROWbbnsvn8Bt7SKK7FidJJJ7S8t69KppzQQIJC6gkAd1PYvkgFHCcibVv7okG+YZrCujtT7PinFRniDW3InLfGY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76324939-dc25-4b05-19c2-08d783b94c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 12:53:36.5287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lnqqyORTYksBrcpyXL8zTP48+wOs04Q1krplR5U1YWnKkNVrHIfBnXh9exgQ8I2uDAZmImkqlzSZkexan0l36A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gcGluY3RybDogbXZlYnU6IGFybWFkYS0zN3h4OiB1
c2UgdXNlIHBsYXRmb3JtIGFwaQ0KPiANCj4gT24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgOTo0NCBB
TSBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4gd3JvdGU6DQo+IA0KPiA+IC0gICAgICAgbnJf
aXJxX3BhcmVudCA9IG9mX2lycV9jb3VudChucCk7DQo+ID4gKyAgICAgICBucl9pcnFfcGFyZW50
ID0gcGxhdGZvcm1faXJxX2NvdW50KHBkZXYpOw0KPiA+ICsgICAgICAgaWYgKG5yX2lycV9wYXJl
bnQgPCAwKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChucl9pcnFfcGFyZW50ICE9IC1FUFJP
QkVfREVGRVIpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJDb3Vs
ZG4ndCBkZXRlcm1pbmUgaXJxDQo+IGNvdW50OiAlcGVcbiIsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBFUlJfUFRSKG5yX2lycV9wYXJlbnQpKTsNCj4gDQo+IFdoeSBkbyB5
b3UgcmV0dXJuIEVSUl9QVFIobnJfaXJxX3BhcmVudCkgaW5zdGVhZCBvZiBzaW1wbHkgbnJfaXJx
X3BhcmVudD8NCg0KUGxlYXNlIHNlZToNCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEyLzQv
NjQNCg0KYW5kIHRoZSBwYXRjaCBpbiB0cmVlOg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC8NCmNvbW1pdC8/aWQ9Y2Zk
Y2ExNGM0NGE3OWI5YzljNDkxMjM1YTM5YjlmYzFlNTIwODIwYg0KDQpUaGFua3MsDQpQZW5nLg0K

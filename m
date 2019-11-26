Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5488510995D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2019 07:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfKZGvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Nov 2019 01:51:16 -0500
Received: from mail-eopbgr1320072.outbound.protection.outlook.com ([40.107.132.72]:56950
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725765AbfKZGvQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Nov 2019 01:51:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmezPBoOVc9Hl7c4LLFMsMOyhNbTeFxk6sADIjH+TW5l4aDXw5fkn91tyEboeWAliW6A9j2cJ4wV2d15AAc+HGE+MMjHqGtnQcWu8AVYZ1HlAq+pPLr01/YixHmfQevKlRnBZpBZsX2hsHAnj4c17JrqAB/dwL3lXplqT2fRNcGs45knJZAWPSZ1QrTsDjQ0doSeNVZhCDzvNGY8G0DZKUheRO5omk4C54un5aDNabI51IrthYTPYN2ncJ0HGo0Rgt91Nc3SsDKMedPhR5e3QYfHVTMs/55TrRnIJwPG+suv4Tzj8MfyvCwzqBoLpjK03AgSx3M/CxVt1JftofoKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAvGeHrYVs0u28y5fklfGe+uVEqwHjftzaCDWqKkimc=;
 b=KaX9Q9BynNTH2aZ1Rv6NxK7BZyl/fDguHYng7us+I6qNA+ZgoI7oVSzCDeG6D5iLOD1TgsEy3ZeM8diM2FFkN9ntipCihuCvbOB6C4oQ7ODgHJR4ljJ/0cwCxWeEWJi67mL85fqxFJQrFb/eszi2ib3afJfvpCAgZXt5Ij7ZcgE17+VtwMQQ+XmV3MkHk1NpQkFHJMl4+RHgGDIPhzz3dhi1I/tvrR956EPPlo5jxOr79vVN5d4qYpnFxvYw+0mP4IURuQCVz9zmm7Z7+U/wkHm2zll5MscqdWX49kXwawlX611Qv5xLvPtpWZm8LHTmbuOs0mr3F/uocy6VrQy2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Moxa.onmicrosoft.com;
 s=selector2-Moxa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAvGeHrYVs0u28y5fklfGe+uVEqwHjftzaCDWqKkimc=;
 b=ou+bxXOagHEzTwrHZ+EFgMCKkBAVIJ+PcdfeH29O8IsS9w9pbYVbpPffB9jxR6p8r7JOkCU6yuap+O7ET3Sr6F1prTTmjR/16NacjJmCUNvu8RPiOtJhv2rEBZeAqWllRszKNu9oEMaeYOA9nxh8z2KDNrQAASLpMUu0NrGsEsk=
Received: from HK0PR01MB3521.apcprd01.prod.exchangelabs.com (52.132.237.22) by
 HK0PR01MB2561.apcprd01.prod.exchangelabs.com (20.177.148.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Tue, 26 Nov 2019 06:51:11 +0000
Received: from HK0PR01MB3521.apcprd01.prod.exchangelabs.com
 ([fe80::1c05:3356:2d9:76f0]) by HK0PR01MB3521.apcprd01.prod.exchangelabs.com
 ([fe80::1c05:3356:2d9:76f0%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 06:51:11 +0000
From:   =?utf-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "zero19850401@gmail.com" <zero19850401@gmail.com>
Subject: [PATCH] gpio: mpc8xxx: Add platform device to gpiochip->parent
Thread-Topic: [PATCH] gpio: mpc8xxx: Add platform device to gpiochip->parent
Thread-Index: AdWkH7vaz5Ef4E8gS664B0rXeaPjDQ==
Date:   Tue, 26 Nov 2019 06:51:11 +0000
Message-ID: <HK0PR01MB3521489269F76467DFD7843FFA450@HK0PR01MB3521.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JohnsonCH.Chen@moxa.com; 
x-originating-ip: [122.146.92.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b58f6f1-da1a-4438-2370-08d7723d05fc
x-ms-traffictypediagnostic: HK0PR01MB2561:
x-microsoft-antispam-prvs: <HK0PR01MB256167F39BBBF0279EAE483EFA450@HK0PR01MB2561.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(39850400004)(136003)(376002)(346002)(189003)(199004)(316002)(110136005)(33656002)(76116006)(66066001)(25786009)(2906002)(81166006)(8676002)(81156014)(66476007)(64756008)(2501003)(8936002)(99286004)(66556008)(66446008)(14454004)(9686003)(256004)(7696005)(4326008)(2201001)(3846002)(66946007)(6116002)(966005)(478600001)(85182001)(413944005)(86362001)(5660300002)(6306002)(4744005)(6436002)(305945005)(55016002)(52536014)(102836004)(7736002)(186003)(74316002)(71200400001)(71190400001)(26005)(6506007)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:HK0PR01MB2561;H:HK0PR01MB3521.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: moxa.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bk0pawp7m4IIwSmgFIdsY/a8uYkMX0QooaJIGWTyFGpoHrfBqBGYunqGKyf0FKm1CmA6TiQLOEVhzcyKknV3l0D4LIgoFr747f2GP+2FYgOV9l68qDjJYdYVk2E8QZETd9r4rTrKc+jr0UuwDSKV6WJuB7SSQWt4qskAk4kNNMjikwJMsQDb+adTX9WDeXoudLt72FiBO8hRBtxqua7KtnFplvdwRuVOHFlNfmKvZrJgAGf7qDPJWQOtzttk4vdusG5RyJjE1/rVSv9oIjoXKRzDSh5j8qSj/BW5Khv9dsGZLXbYpBB6XQKq1SofATHFNhifcjTukqdli9WV9Z1/dq2xjg4uM8CHuB9GwreofsDjTYzjkDNdwc2+CzKOuKZakugtKEBJrKt4cbPdMSQL6XA72GSL0XB8hUPCRWdeMVsBnUHzmucQqjky6zTwXASwl3Kb5QeXZ25+Guv+xwTfHDFJJWvf1GwsJwqoFsoL/Hk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b58f6f1-da1a-4438-2370-08d7723d05fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 06:51:11.3627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pf2JL0U64KEKfCCRUEU37OzkY6tWfxrSGr0wVP5ar2oG5EAdlCEx6xCM9UsjKu1kc6skyWHqfcYOrqaezWkGBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR01MB2561
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RGVhciBMaW51cyBXYWxsZWlqLA0KDQpJbiBvbGQga2VybmVscywgc29tZSBBUElzIHN0aWxsIHRy
eSB0byB1c2UgcGFyZW50LT5vZl9ub2RlIGZyb20gc3RydWN0IGdwaW9fY2hpcCwNCmFuZCBpdCBj
b3VsZCBiZSByZXN1bHRlZCBpbiBrZXJuZWwgcGFuaWMgYmVjYXVzZSBwYXJlbnQgaXMgTlVMTC4g
QWRkaW5nIHBsYXRmb3JtDQpkZXZpY2UgdG8gZ3Bpb2NoaXAtPnBhcmVudCBjYW4gZml4IHRoaXMg
cHJvYmxlbS4NCg0KU2lnbmVkLW9mZi1ieTogSm9obnNvbiBDaGVuIDxqb2huc29uY2guY2hlbkBt
b3hhLmNvbT4NCkxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEyMzQ2
MDkNCg0KLS0tDQogZHJpdmVycy9ncGlvL2dwaW8tbXBjOHh4eC5jIHwgMSArDQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1t
cGM4eHh4LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4LmMNCmluZGV4IDE2YTQ3ZGUyOWM5
NC4uMTYxZTNmZjQxMDZhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tbXBjOHh4eC5j
DQorKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4LmMNCkBAIC0zNDYsNiArMzQ2LDcgQEAg
c3RhdGljIGludCBtcGM4eHh4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQog
CQlyZXR1cm4gLUVOT01FTTsNCiANCiAJZ2MgPSAmbXBjOHh4eF9nYy0+Z2M7DQorCWdjLT5wYXJl
bnQgPSAmcGRldi0+ZGV2Ow0KIA0KIAlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAibGl0
dGxlLWVuZGlhbiIpKSB7DQogCQlyZXQgPSBiZ3Bpb19pbml0KGdjLCAmcGRldi0+ZGV2LCA0LA0K
LS0gDQoyLjExLjANCg0KQmVzdCByZWdhcmRzLA0KSm9obnNvbg0KDQpNb3hhIEluYy4NCkZsLiA0
LCBOby4gMTM1LCBMYW5lIDIzNSwgQmFvcWlhbyBSZC4NClhpbmRpYW4gRGlzdC4sIE5ldyBUYWlw
ZWkgQ2l0eSwgVGFpd2FuLCBSLk8uQy4NClRlbCA6ICs4ODYtMi04OTE5LTEyMzAgZXh0LjEwNzUN
CkpvaG5zb25DSC5DaGVuQG1veGEuY29tIA0K

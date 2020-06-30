Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9221A20F6F4
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 16:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgF3OR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 10:17:26 -0400
Received: from mail-eopbgr70043.outbound.protection.outlook.com ([40.107.7.43]:10007
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725887AbgF3OR0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jun 2020 10:17:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd4rs3Vy4dHpdoA4IEK7zoRQH1MfjYXy6D91a9w+wq5xCmdaFqCuPBYQxgHPvJ/KYxnaMSsUKYPPFOVWVrKXxGXR1x0foiRsENCNp6Txo5Aa6IOJXCM1qos89HejhHHlxqpOnEhL+RXAAEZBVoEfUiqtCMdS1N6Lx97SnZdz8400G5RtbZXTEcDHxCtEjsvSiY527taJkrbj2aW+w0EFCu5eo8pVunpCUpQDKdZ7kA2VN75K9XYaZxUueb3oWEhhlWIE2A6AJfx+J49OYQMShWWnwmJhsntHoBEME4bftnFwyU4M/3HNtljpBlMaySQeS0BooGbZ08RhaJbyKEN2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDiz0oplFHJjdAfSaHRvDnIp2gTUbulXsWSUYEV1U7Y=;
 b=kZabyMwT3SDNQLGA709Sqmu/xBpK6KM4cJiA+QLVeAqQJiY9ccmJ5npbTdDlK2OjNYRnxy8Lk6koY5pYi5uPCLmemPsTevj/cIm+URrgdrSeGqsHGLR9HMzstBMlj8nstiHD1ol4tvWSUz/IIsxnJ6usqYQN+pzIPI80hqIvGlJcZoTOhZ2hvVu0LUwOllwT2FWZ1oP7pSl1kNDkm/jPU2trkPpqv6lD3MuQtVwyl/eSn4WYTUQu4BFeF/sfxNxuhNWHDN9NYlvdLHZEcKKUhQybCNK8eESY1O7AD3ag+nh51Bym+hOwlbuPk6tPc4lxsNEIX0FDIFQ9pZz3TPVKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDiz0oplFHJjdAfSaHRvDnIp2gTUbulXsWSUYEV1U7Y=;
 b=KHBz+TUwzfa6ObVnqzSx81cXNHXJ6jErWZDIXpiubTnLDCEG0ZtRGUe+K0eY4yHPF530m269aawbpPggdfUffgHxjgwwMpl6gZg/zggtFraTapI4Apo1YGguX2BeoA9hcCtdrOD82ctd2SkigXT/jXViNdBr6GY/yO53nKrZDC4=
Received: from VI1PR05MB4110.eurprd05.prod.outlook.com (2603:10a6:803:3f::23)
 by VI1PR05MB6896.eurprd05.prod.outlook.com (2603:10a6:800:178::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 14:17:21 +0000
Received: from VI1PR05MB4110.eurprd05.prod.outlook.com
 ([fe80::c19b:54d7:a861:2a88]) by VI1PR05MB4110.eurprd05.prod.outlook.com
 ([fe80::c19b:54d7:a861:2a88%4]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 14:17:21 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     Lee Jones <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 09/10] gpio: gpio-mlxbf2: Tell the compiler that ACPI
 functions may not be use
Thread-Topic: [PATCH 09/10] gpio: gpio-mlxbf2: Tell the compiler that ACPI
 functions may not be use
Thread-Index: AQHWTuMcDTcl+auvqk++8TiYH38LVqjxNFpA
Date:   Tue, 30 Jun 2020 14:17:20 +0000
Message-ID: <VI1PR05MB4110250294454B9764958D4DDA6F0@VI1PR05MB4110.eurprd05.prod.outlook.com>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
 <20200630133345.2232932-10-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-10-lee.jones@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [65.96.160.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dbcb1704-43a6-4f7d-2a89-08d81d004d8f
x-ms-traffictypediagnostic: VI1PR05MB6896:
x-microsoft-antispam-prvs: <VI1PR05MB689615646C0B31F39AE6548BDA6F0@VI1PR05MB6896.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W59yxhzdCLaqyKudhoafFdAyhRiu5T7goEszhyOQtCbwrS8TW2ok4lEI1e5dZJjz+CKpaM07nGORc/TD6yhJrl37cr3vCMFaeQ0QNqntsp2MqO/Seeb1K9LzV7XB6FXH2vzPmLE2rkUHK/ZWOc3NdNpZQhPMhFESzts8LvBP5EDLHPhp7cMsxEJWMcPDv+SF0QAxoHYCOzrg+hQPyls2tcsi6RYhr0fejUHpbz4t2k//hsX3G5xJtVq0VnNVb0gMewUBLjLMAV6KmU8XO6/s2QYW1R/O5YgIcA85yWg2wwlCo0ujgTC2eIRBaDF0v+xbD6HBSrzjODsXVdPTGdeOog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4110.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(7696005)(64756008)(66446008)(66556008)(66476007)(66946007)(110136005)(71200400001)(8676002)(4326008)(478600001)(53546011)(6506007)(54906003)(8936002)(33656002)(76116006)(2906002)(86362001)(9686003)(83380400001)(52536014)(26005)(5660300002)(186003)(316002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 4r5q48aWKcvsvhE+AmBYyQY+IC4SyIAFclcvCitoVu+Ur0aaxmrSqM+TmdNZQLhpeu1yhLLxvqgpaAnFC/IzOslArmGSGfnG0xPXEluhcjYF0XQDjFoKZotjUUBYnjrkmOftUrcISgcHoi7/9K3et2an8B4mFxXhAx6GE11Ojnjixa2Fbt9qKb98fFydIHhjqoQ9khHc5X5aJaSpo9z2OKtx+97LpMrIDZyo/6uYu9pDaa730jqVlhIONr5VRyRIJbuQAuYjS1I1BmfgsIrlY6iQY7m4kCnrnNU4CPheAy3Wvx5cDtss//EuclUOQCAaueFp5jU4/GbTg80D5SzS0YTNPn+AveiFJVjpwaLbfInJfI9mT0yCEpsROOdaHs/6He49QP3ozCHUly6IdeGnJGYaFkOQgEF9QdSpSsQ18BO9jYNPcm7yaSVVqxD4qbPAbZi9pxsTbKjI0WSPYjQ2FHZp9Ta8RMqWnMPhGS1Dm1I=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB4110.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcb1704-43a6-4f7d-2a89-08d81d004d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 14:17:20.9809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9QqbIJJ9BO+3mi+kRgQv3WMEaOch6F0K17YUNOQWWCSA3LpDmR93r6TpXrY5X+FJ/HlWSahSVof1BXedGPtVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6896
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

UmV2aWV3ZWQtYnk6IEFzbWFhIE1uZWJoaSA8YXNtYWFAbWVsbGFub3guY29tPg0KDQpUaGFuayB5
b3UuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiANClNlbnQ6IFR1ZXNkYXksIEp1bmUgMzAsIDIwMjAgOTozNCBBTQ0K
VG86IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZzsgYmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbQ0K
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+OyBBc21hYSBNbmViaGkgPEFzbWFhQG1lbGxhbm94LmNvbT4NClN1
YmplY3Q6IFtQQVRDSCAwOS8xMF0gZ3BpbzogZ3Bpby1tbHhiZjI6IFRlbGwgdGhlIGNvbXBpbGVy
IHRoYXQgQUNQSSBmdW5jdGlvbnMgbWF5IG5vdCBiZSB1c2UNCg0KLi4uIGFzIGlzIHRoZSBjYXNl
IHdoZW4gIUNPTkZJR19BQ1BJLg0KDQpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVp
bGQgd2FybmluZzoNCg0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1seGJmMi5jOjMxMjozNjogd2Fybmlu
Zzog4oCYbWx4YmYyX2dwaW9fYWNwaV9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtY29uc3QtdmFyaWFibGU9XQ0KIDMxMiB8IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9k
ZXZpY2VfaWQgbWx4YmYyX2dwaW9fYWNwaV9tYXRjaFtdID0geyAgfCBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+DQoNCkNjOiBBc21hYSBNbmViaGkgPEFzbWFhQG1lbGxhbm94LmNvbT4NClNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+DQotLS0NCiBkcml2ZXJzL2dw
aW8vZ3Bpby1tbHhiZjIuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLW1seGJmMi5j
IGIvZHJpdmVycy9ncGlvL2dwaW8tbWx4YmYyLmMgaW5kZXggOTRkNWVmY2UxNzIxYy4uODYxYThk
MGE4NGJlMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLW1seGJmMi5jDQorKysgYi9k
cml2ZXJzL2dwaW8vZ3Bpby1tbHhiZjIuYw0KQEAgLTMwOSw3ICszMDksNyBAQCBzdGF0aWMgaW50
IG1seGJmMl9ncGlvX3Jlc3VtZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAgfSAgI2Vu
ZGlmDQogDQotc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBtbHhiZjJfZ3Bpb19h
Y3BpX21hdGNoW10gPSB7DQorc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBfX21h
eWJlX3VudXNlZCANCittbHhiZjJfZ3Bpb19hY3BpX21hdGNoW10gPSB7DQogCXsgIk1MTlhCRjIy
IiwgMCB9LA0KIAl7fSwNCiB9Ow0KLS0NCjIuMjUuMQ0KDQo=

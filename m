Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BE82E2A96
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Dec 2020 10:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbgLYJYa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Dec 2020 04:24:30 -0500
Received: from mail-eopbgr1320097.outbound.protection.outlook.com ([40.107.132.97]:51394
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725863AbgLYJY3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Dec 2020 04:24:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE/4yUvKp10HZAKr1Y3mqlyQgzo8gr665wrypNQgPmNgAddM6Ct9eTo9KJTd/j4C49F89Vwk9eT/QRXBJizL/UFJfEjo26cx0NI0IykyNcf/AxKwxDggVw5uVcNP0EDTD+oWmixDHdhcI5EjgbO6ClIGV/wfzK4PJnV/dV7jY3F5jmjtd7ILS6ywfEYZNscwSt1P7Acqk3PnA7ulVSLRAbrL3qlGL0TOyWC5/2fNYRliAVp1hbjOlkpxmdNGDFCUbm3i0xOHSc52HEe91sxdlQNR986e86sRFXFXv/Ax3y82lHfjsR9ijjkmvjAKBMfjsWNNNuczxW5e8bZrdMG9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv/I+J7oMdQxPULyaTXt4XhCbaz1UCm1OekB3YkrGUc=;
 b=n96radBojgDMuat+vQLGEL0IKl22Vv5GrPIv+jQcA0kJVpBlbSEGuhnCkGAK5hYfuRw0KPeLdwBDEGZIEJJI91UscRig9/rk9WP64aFb7PaTJs4ztJV2kzwNRPFkqDGHja5FxPeSHJvHYpeutZDt8hm+XG9nebfHTymiiuxe0SPijz1oZsEZysUuogfqWfyDQBsEKOhqX5szbb6Y6ECcLksY4bGb/8HVnCWzo9LxuP21iHG4oS7ez1Tcp0R5CCYSKN7rPz0L3vcoODiDaaWk59in6ZROXAu9uIB0MZuOynwxQORZSp5zGhBZNWpWmbPafYSJKEDDu82yuQN8l8zLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv/I+J7oMdQxPULyaTXt4XhCbaz1UCm1OekB3YkrGUc=;
 b=kZTZuw9ACEtHnZrj686TW6hZukrSsDdl9TF2L9mEYDbJx3GOFSrFLNEVIxl7DckZBJePi1PTfL4AsUtqXHiuTZukigtYGaJ+aqYHIByfY6qbqJDz5ymbZUudaXOpOJoD6xcO0RmnW89PRz8EvfUcU9XGJ/I01mQsNxx9i/jfhUY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3290.jpnprd01.prod.outlook.com (2603:1096:404:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Fri, 25 Dec
 2020 09:22:53 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3700.028; Fri, 25 Dec 2020
 09:22:53 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC:     Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "matti.vaittinen@fi.rohmeurope.com" 
        <matti.vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: RE: [PATCH v7 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Topic: [PATCH v7 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Index: AQHW2cMCGsUAGF9TLUK+QKZCWGLEgaoF8AIAgAGbPGA=
Date:   Fri, 25 Dec 2020 09:22:53 +0000
Message-ID: <TY2PR01MB3692EDFFB2EF8E1BB68551EED8DC0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608793457-11997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608793457-11997-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <53d2129e-966d-d28e-625a-962b0e3d5d43@gmail.com>
In-Reply-To: <53d2129e-966d-d28e-625a-962b0e3d5d43@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:3476:4a20:f47a:7214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8b0c4dc2-d2c1-4e78-43c9-08d8a8b6a82f
x-ms-traffictypediagnostic: TY2PR01MB3290:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3290827638F1AF635F71BD46D8DC0@TY2PR01MB3290.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jbQHZLquwqHUTVu2JI+LiuUiY3RCdkW/9QnFFXn4C4lk1sqxMAV7YX5aG7VBn/GbJn8/2SRyS3U3z+AuGcRjG+ePHwldrgLHSkbz0wvvReitNkTRi3oBuY79+9y/6Wt7zscljgdNfGg0Q7vRk+BkT2iDb8+8XuxCfEpNAjPNOJFaEZ6VvAv+UAUeqqW66A84rUix8xXsm+z+ha5DWH/HFybnQnAl4Hs4snhZps+2de5MO2p+6ZtdXJG35FPsPyhl+FQwXhUt/CyzBIygu4EWkx+yq8iw+nmnxaJ7rkvjeM4p03L+jJczj1wXxt1e8IdMh6hWWBH1HWI55P6i2+P0mWqKw0fMDtRvWAL7t8RVmDvpZd46AKWwu5xGMcz+ORc/5csnfB0uTs2UxtpKUI0gVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(66476007)(6916009)(478600001)(9686003)(55016002)(66556008)(54906003)(8676002)(33656002)(2906002)(64756008)(7696005)(76116006)(66946007)(8936002)(66446008)(71200400001)(7416002)(186003)(6506007)(86362001)(53546011)(5660300002)(558084003)(316002)(52536014)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?T3k3MTBoY0IxTThmOWo1UDJ4dlUrVldlS01Oc1dMdkZSR2lOWng3QlRGM05O?=
 =?utf-8?B?RE55bjJCb25jazU4emcvQnZQNU9XeTVjZ2JudHh3aURIS1lRaWFBNFh1OWd2?=
 =?utf-8?B?NXhjV0JPQjNxUFpERzlNbjVIM1J1Z00wMmoyVWRlNlNicTBwVWZFelBlNG5n?=
 =?utf-8?B?cnRyOWMrblVOdUo3OFREZW40dWZUVkVnblhTVDVNcjFtL3owQjdoZmE5V3lJ?=
 =?utf-8?B?bUJFL0pvUzNMNmM5elBzYkYvRXZZbExicTlVUmxBZ0oybXlaQVlXSFdZVUhQ?=
 =?utf-8?B?em1MQ0tWNzhHbWJUMXduNUM4SXlEVmtNWG5RR2lrSVNjTWZ0NWthbWp2ekVX?=
 =?utf-8?B?RUxxSjlPUzBlVWJFNWpmeE00SmtPVXlMZlBGZUNnM09UakR6N25oUzVEeklz?=
 =?utf-8?B?OXMzaTZwQ0VmbjFkTXNlM1FXUUhxZDkxZjRodlJid3M1MUtZQzBmaXg5a1ZI?=
 =?utf-8?B?d0hsOGl6Q2Y1OTU3blRxSXdHdjVzcDA4RStjZDNZT3VQRWRIaUt3ZnBoSlBZ?=
 =?utf-8?B?bDR0OGJ2QVNQUVNuam4weGtqWXZQTFdibHdhR1RHUllFWm9FYXdNL0RLSGh2?=
 =?utf-8?B?OGZtWFM0NFkyUzA5RElqSTQ4WU54OUJqZ05wblpPdnJ4TjBlNXByMU5UeHI2?=
 =?utf-8?B?LzgvRFd6dXNxR0FtTko2Nk8xeHp3NmJ3ZmJqSTZhMnc3bVBvYnJtdGVQbDhO?=
 =?utf-8?B?Q3h1R0JEVGh2Sit2eTRGNkJEZlBUWU1Qb1BmeVFmTERhSkcwaVhON1ZTNDBF?=
 =?utf-8?B?d2w3MTFDbjI2TTRVU2NYd1ZnYkFBbElZRVpEOE5pTjFySVJocVpGVW00aXBW?=
 =?utf-8?B?UkNhS0VXNjN6WTBnRFlqK3g4V0pBWjBXRHptQTZFWDBSaStWdVgvUkF4Sk82?=
 =?utf-8?B?TzBIdFBWZjQwZHQ3N3FDVEZXam0rMkJieGd5TWxSQ3d6UlEvRk9pQnFEcUZI?=
 =?utf-8?B?TUZmc292czZQeDJuQXVmYlIrdW1EUldtVGQ4ZHlZM29PV3Q0Sy85OHBpY0pw?=
 =?utf-8?B?Yy9naUZHTnpnQ0hPbnBkZE84bUo4VVBmV0xWRDlsam13cE5idUtja3YrM2pR?=
 =?utf-8?B?SVMrYlgrSmRTbUZxc3d4ejl6N3Y4S3pkamE5WlQzbEVqNnZ6MU5weGtvTnRl?=
 =?utf-8?B?UERIU05PQzRmRHcrNlJ3OFloUW1IeXk5SDMwV3ZNT1kxaDBncVgzLzVXSm5s?=
 =?utf-8?B?KzRWN2psVnN0bVd3dmVsdEZKR08wTjIxZU0rN2lLcGIxZkUyTWd2NVN0VHBK?=
 =?utf-8?B?WUpSUXN0azd3VUI5UnJ6SEZrVG1VbTVsWmtURlBDQ3pEU2Y1TVNxdW1OVGR6?=
 =?utf-8?B?Q0Y0RmNrZnRjbE9hbTFVcnBHcHdSNDlJVFliRmJSc0lWc083M1RQSGtBdVZ2?=
 =?utf-8?Q?Ky35UDzft3L79AveT1RQ9Xav5G1NlyZs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0c4dc2-d2c1-4e78-43c9-08d8a8b6a82f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2020 09:22:53.1269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3o8S/vYsDA64rFGMtTO6VWqLygQAzIIUmhLpo1vSEUsny5xnO87cfMjJhB2xHxOvSfno6eahWDg1g4hKQdR9izgLBXaSz0bh5QJ2MYy0HParKRUyHaTXWrVXAp9tLkgJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3290
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gU2VyZ2VpLA0KDQo+IEZyb206IFNlcmdlaSBTaHR5bHlvdiwgU2VudDogVGh1cnNkYXks
IERlY2VtYmVyIDI0LCAyMDIwIDU6NTAgUE0NCj4gT24gMjQuMTIuMjAyMCAxMDowNCwgWW9zaGlo
aXJvIFNoaW1vZGEgd3JvdGU6DQo+IA0KPiA+IFVzZSBkZXZfcmVnbWFwX2FkZF9pcnFfY2hpcCgp
IHRvIHNpbXBsaWZ5IHRoZSBjb2RlLg0KPiANCj4gICAgIGRldm1fPw0KDQpUaGFuayB5b3UgZm9y
IHRoZSBwb2ludGVkIGl0IG91dC4NCkknbGwgZml4IGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3No
aWhpcm8gU2hpbW9kYQ0KDQo=

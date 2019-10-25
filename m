Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EC6E41B9
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 04:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390672AbfJYCqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 22:46:51 -0400
Received: from mail-eopbgr1400090.outbound.protection.outlook.com ([40.107.140.90]:26184
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728416AbfJYCqv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Oct 2019 22:46:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2AjO2wk20GDtYuVT5PUx0+cEigWAOEtWmOCNdbxAyovM30YOK3FIC1Cy3v58QD5Q7yq50zYM2PExGtEfzUmtcFs2To7N7oEMyOOc18ILF/AKwZZBa5YvoHW1GhaCtxn4SIGSUgibg1rN0i+AiV5jRD9RRuO4VOLktUrVhoBK31Ly5qrCCo8Bhf7DJO6ChQUsWm4/bjh31cpgw48nhRNAN26T/jGeLF8enerQVyJnwVo7Eq0BIRyzJ8sRtmiAJIZsxQwihvDgBAa0OZaOMQoJ7KYM08hEjdDoapPlO7wYl1xv++zjBEryIHt2OPa5YuIqdqOlWxTRNQ1BquFOJIYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM+TeGhn54AevyXg78X2RVsqrzXAl/8zhZ2DlWesjNU=;
 b=cYM7EDEsbksvnatQuiUe6u6rZ9d5WtNi5k7XSP00jvmKjBJ4ge+DecqtJRBdjKVUvGO4l2eethA79N6TEQUdRJDmDFhd8ERYGOorhqDqYI9LV3G3gNQgwH6Y4rKVXKew1S5XqGWvbxXYRNl5GEb051XoYfQ2fFpl2GYjGixj7nJlGGW13QryjZ+2U+p9KhY92Fq5wNDsLzENHIsojS1MPOlSQFpNHbPh/ll44YsGYZvk02HVM5AkLTub+Bya1gc5VROiMmVWMKRX6VtjwPHQ8QTEcslf5RZX9SHP9SNwpeobivAPXRpz41wZnMZIZrwKxL7lbeODEPEQ9mnr0H7x/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM+TeGhn54AevyXg78X2RVsqrzXAl/8zhZ2DlWesjNU=;
 b=TfEnlwZuBrg2zbwf5nVQqoygoldoNBUIPlHbogDRDviI6YTIYc8JjGQelngdrCK2kz0wA2LRU4+YKZYFAJTy75VymMwL5j2ldjVhZZVgds0EIGt1v8uAvpGpvCjxFkKFFSJtVzG6yQmmN/nZovRF0IbE8Hihl4AtF06ciGKOXXs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4381.jpnprd01.prod.outlook.com (20.179.186.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.21; Fri, 25 Oct 2019 02:46:48 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 02:46:48 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 2/3] pinctrl: sh-pfc: Rename PINCTRL_PFC_R8A7796 to
 PINCTRL_PFC_R8A77960
Thread-Topic: [PATCH v2 2/3] pinctrl: sh-pfc: Rename PINCTRL_PFC_R8A7796 to
 PINCTRL_PFC_R8A77960
Thread-Index: AQHViZ2YZUF02RySxUWPiJVWTbrFj6dqqYpA
Date:   Fri, 25 Oct 2019 02:46:47 +0000
Message-ID: <TYAPR01MB4544CEB6E9238C4506E1B2D4D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191023122955.12420-1-geert+renesas@glider.be>
 <20191023122955.12420-3-geert+renesas@glider.be>
In-Reply-To: <20191023122955.12420-3-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1961c9e5-8a6d-4ba9-bd80-08d758f594ab
x-ms-traffictypediagnostic: TYAPR01MB4381:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB4381E3D977AAA3BF0C5DCAEFD8650@TYAPR01MB4381.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(189003)(199004)(64756008)(76116006)(66946007)(256004)(66476007)(5660300002)(486006)(25786009)(74316002)(11346002)(71200400001)(71190400001)(316002)(4326008)(66556008)(66446008)(66066001)(110136005)(54906003)(476003)(14454004)(6246003)(446003)(478600001)(99286004)(86362001)(33656002)(7736002)(76176011)(8936002)(2906002)(9686003)(7696005)(6116002)(3846002)(55016002)(6436002)(102836004)(4744005)(186003)(26005)(6506007)(229853002)(81166006)(52536014)(305945005)(8676002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4381;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ej/GJGbk0WMoKFiEL8bitOatjdZ3hkwqJxnsRFOQ5sb5/zQpZPQkOUZiZjHhJc6Bf+jZV40bJx4h2MUbbU7H0twfzq7wIcFNl5O5fd5gZoplDR8Pp8cBOKBimdYKkbOcGHgL3oAGvTGmNcUdu+9Z5ikHjiHBSVVhv4EtmD/sgjlu3+bed+vK8V3Xr7qjVi6756KhMd72Uk5/NQsMLgkKuIwI38mrXu19Y61QBpMI7iSGY43IOHEPU3Bj00Zt9I79bq1iyde0TbuAMuQ4yU7qFzrOgH+qaoVcEZ7N3+PTV2vykx7y9XT8832af1Xi3ZxBxMnPh2gDDliG3C1j7mckU6dh2C0ji1LhAWjaAyYO7E+5ltoCKjzjYbWOsktUUWph73muIkjk4ZK3VlOVHKbNkjs1Z/89RssoIx/Q/kfn3fKCpfgd1gH5tO6dpfykuV0A
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1961c9e5-8a6d-4ba9-bd80-08d758f594ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 02:46:47.8930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5/i7cUlJiwddGsKW/NiVdm+d66rbbi+1PScuBBDRUxFz8Vu4rHY6b973yhU3kNeQftgbUWplcke6/c4bTnwjWKDvlMRXEYUSCQeyrG9+SFWedUpOljmg8eO48Yohp9Pw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4381
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 23, 2019 9:30 PM
>=20
> Rename CONFIG_PINCTRL_PFC_R8A7796 for R-Car M3-W (R8A77960) to
> CONFIG_PINCTRL_PFC_R8A77960, to avoid confusion with R-Car M3-W+
> (R8A77961), which will use CONFIG_PINCTRL_PFC_R8A77961.
>=20
> Extend the dependency of CONFIG_PINCTRL_PFC_R8A77960 from
> CONFIG_ARCH_R8A7796 to CONFIG_ARCH_R8A77960, to relax dependencies for a
> future rename of the SoC configuration symbol.
>=20
> Rename r8a7796_pinmux_info to r8a77960_pinmux_info, as it contains an
> r8a77960-based name.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


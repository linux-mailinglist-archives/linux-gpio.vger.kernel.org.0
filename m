Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7481F478B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 21:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732036AbgFITvt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 15:51:49 -0400
Received: from mail-eopbgr60072.outbound.protection.outlook.com ([40.107.6.72]:62303
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730897AbgFITvr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 15:51:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4736FyEEgswp/2TDTDMh0ieDLbynmRFhT0iH7FxvFjiYzXBPaQGhXedHUFFc3vC55vXobYkhtCP+mJCbZhAlZ+ldYYi69bPqWseWKaYOF58WQaoDZ00d1I2z+yWaXWv80ECv67PWU20ylr7N60V2eAw2kIbxI98HzZCm/w5aW5y74j78fVjubq4DMV6NfSVnE1KTPK2fcRNsUzFEH9ERy++t4/BtUFYaLsAI3ZyOhSjbWibiSankt/EhbX3ZFbUlBWVA+ECegxMdv/HsnSkjx/acqEer/jspfMDPYcKLl4KlIVzncXyj49Jk2OwF+YtNyeOqm3qzlgvSXJ38XaOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN6TzoYfE/umvJXHNcb2c90kdwzIA11jSd0LDxHzmHM=;
 b=IGL85+kkJk//j9RU/DTCvHt8fKl3bDPZvCuGFr7x/lznfE47IUhxSoi6VBHq0YA4R/1rGvLE4KOYa4ciN+4cu+6DwxDte7fMdrF90SKANcRu5sK9n/ptk763QyzoRwCmaNjlGwSeosLKmzWqgPx2kfEPspTBVX9sOnG2FRPcD3fiLgRzO9lnDAdjAh2R5Rwg4Ew+YT/QvUYVkOX9x+Wn324ILwId+ZxXkLjPxVNcazw4JP45lT1YN9VPzTVSRk9ltQH3iSyevXshiJQiciAccz770WKuH2GO3Lej2snRrPbj21TiMYzSuWRyukBeqS0YrcmbmQlnU0a22A66Xn9+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN6TzoYfE/umvJXHNcb2c90kdwzIA11jSd0LDxHzmHM=;
 b=rJppI3bAlUAWf0IHk5o3c9rHPHhv1BPiA4radMwoNgNk13QtWdjmg1/WcX3l+Dy32da1Eg1PSIFxhTd5+asXVVkAJO4tbG6Ge73mL+va4ISE0xes8A1LT873xalh1hKlxaHbezXINKIRxUszY/4R1lgsJSMK5KPRg4q/SPQ4pvM=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VE1PR04MB6559.eurprd04.prod.outlook.com (2603:10a6:803:126::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 19:51:44 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::48b1:c82c:905:da9f]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::48b1:c82c:905:da9f%3]) with mapi id 15.20.3088.018; Tue, 9 Jun 2020
 19:51:43 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Hui Song <hui.song_1@nxp.com>,
        "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Hui Song <hui.song_1@nxp.com>
Subject: RE: [PATCH] gpio: mpc8xxx: change the gpio interrupt flags.
Thread-Topic: [PATCH] gpio: mpc8xxx: change the gpio interrupt flags.
Thread-Index: AQHWPkPJIX2y5uVvV0i+EVd9iXRd3qjQsZ0w
Date:   Tue, 9 Jun 2020 19:51:43 +0000
Message-ID: <VE1PR04MB66874A7F9C037E5F9C3A99FB8F820@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200609093741.44050-1-hui.song_1@nxp.com>
In-Reply-To: <20200609093741.44050-1-hui.song_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0dbb603f-908a-44a7-d35d-08d80cae8947
x-ms-traffictypediagnostic: VE1PR04MB6559:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB65594CB1A982F7E817ED6BDF8F820@VE1PR04MB6559.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLrpEOG+KydswZAY2SXQfRs9l+ozWyIUxIVdlGEJWOFAOwhJvF8oEeTr2iiTG8a4rpTz3DlmyUG9/pN3iywrg/YvTTDC3WrStIrJf1lgLC7kWz0xsdl1Ite0Zw56wEAnveLXxcLTIz3zEr8tPsJPOdCkGK1Ygl7ltbcP4FkX+UsnosUy5NvRNIYoEHuUqmmGrOYZHCRUlWnKyV/fA6Ec7cFrIAtpbp2fuZAn6DCeU19YgkXxHurYVJch+Ieps3v6oFvDGbiH26Hbd+4ndA/v6L0pR1tdNmfT8WvLdcTeq8OlYzzpeqneSHsCjQ87WKLABAY5iWxXVsQm7P8KlaZlneXthseQ5EtDzjWw0WIEMDOLxRAHN8Cp9zI1B9shElXI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6687.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39850400004)(346002)(376002)(136003)(396003)(186003)(55016002)(316002)(66476007)(26005)(66446008)(66556008)(66946007)(64756008)(9686003)(478600001)(7696005)(54906003)(52536014)(4326008)(76116006)(83380400001)(5660300002)(6506007)(86362001)(8676002)(110136005)(8936002)(53546011)(2906002)(71200400001)(33656002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: aRfp5H8uesVbGMRiu+dFKqyycku9ACPnPXSZq9JiTSFFG42tky3EVvV0/58xGsmnYcG/vDJqjPRJ9FiJJC2E75d+if2iAY+iGCLQPQYanV67RN89Jwskgvkwe3jPE/hyOel2Ix7mSdhYE29O313eFgXU0ENP13P2SYKX4+U9Mem5KruAjqvyUvoX2/y7Z4zwmAKXVtmblXFAGqEX+duk0QMspsv1562aT78WyKMSsxOgok4b9OjpXNU666S+AABkw8i2G8FsNZD6A6vGJgdDzM25Wn6NcpiEc97xm1Gxh40wR5/j8fcc0vP6uZIEv++DumgLDnlz3VxUVTuaDY3vBE5YOWM/1jyzudhdZQockTEs5htwL5eTzQIRDQPZ/vNL2044G2NSZzP4FDuUpCbbQu66DkmbnvUi6YNt/pcNwbIdIadvSS4HPvOPgUFK8P1hWt3kPcHSv52cZjI8nStsGK+LyedTHjOgmDHycnMMXW7LaZh370xlBR+PZt8JUDqV
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbb603f-908a-44a7-d35d-08d80cae8947
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 19:51:43.8194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WAG+PeNtOtE/UaZHafbs1v8z355eEtJVVw35IAukvz8vngqxENMw7o5QoPoks574k4mPYdgvd60u76RYU1qi6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6559
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Hui Song <hui.song_1@nxp.com>
> Sent: Tuesday, June 9, 2020 4:38 AM
> To: linux-devel@linux.nxdi.nxp.com; Shawn Guo <shawnguo@kernel.org>;
> Leo Li <leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; Linus Walleij <linus.walleij@linaro.org>;
> Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; lin=
ux-
> kernel@vger.kernel.org; linux-gpio@vger.kernel.org; Hui Song
> <hui.song_1@nxp.com>
> Subject: [PATCH] gpio: mpc8xxx: change the gpio interrupt flags.
>=20
> From: Song Hui <hui.song_1@nxp.com>
>=20
> delete the interrupt IRQF_NO_THREAD flags.

I think this is the correct direction but would be better to describe a lit=
tle bit on what motived this change.  Any issue encountered or latency opti=
mization?

>=20
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c in=
dex
> 604dfec..1e86652 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -417,7 +417,7 @@ static int mpc8xxx_probe(struct platform_device
> *pdev)
>=20
>  	ret =3D devm_request_irq(&pdev->dev, mpc8xxx_gc->irqn,
>  			       mpc8xxx_gpio_irq_cascade,
> -			       IRQF_NO_THREAD | IRQF_SHARED, "gpio-
> cascade",
> +			       IRQF_SHARED, "gpio-cascade",
>  			       mpc8xxx_gc);
>  	if (ret) {
>  		dev_err(&pdev->dev, "%s: failed to devm_request_irq(%d),
> ret =3D %d\n",
> --
> 2.9.5


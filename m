Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EEB13D5ED
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 09:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgAPI2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 03:28:30 -0500
Received: from mail-eopbgr60048.outbound.protection.outlook.com ([40.107.6.48]:37205
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726812AbgAPI2a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jan 2020 03:28:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iX2sSFO9PJCN0RiiLy/UD9A5u2NnTzXmVZ0u1EeKpTMhDx+ouIjbdmboTNzuft1q2mRpX9ZZRhC5tNlMtIF/UJhTivY5dsEVyL/fqHzjFdLEXVJvnz9nuSgEUYrrcEwNmlO/V/c08dAnejmuN1G+FxKvYd6R6CBmcDJuIHsb73N7Eedx/b/BAqGI6KCtu1qmne2sZC88W2Y2s+7kqJV+p8uMGyx89Oc7/i0jjAcq/odAVAC1isiarTX42Ld3DDXCvGewFT0XzFmb45UFDyxpPsD0iA9TR6c3VOutMGKyVXIKqf6Lz7hYu3P5bdizRVffrfHYpbyFXRrLQpcNSp5QRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EANhXmSVmRlHjC42A3Enh7V7U6f0NI9Sb0cusnW0ng0=;
 b=RXuK7V5mRRhMmqGZbQKEKFzxeCHm2+fuMSyKBLMI97re4PokR4reyD4MMePswGrNxnB0HXWxTHlZQMivXNm/7IME0u3pJIDxZ0nZHSFse4llrT8KoN0fzCW3kvMYy1bwPSCcQVeB4aBeCyfY2i/L29d1+Q4JTUsByehet7RvPFm2aPm3TdN9dF56MqTlhxGHlrR2HmZEzhGd7RMU8EE7tF3ICI3vRqGq/gtFd2jLsuQef8U954qsfQZMA6Q4XMccdu6Q73YimBkryopiP5zmDs+KpqWc6cIIG4HbzKkGg0vLKd0UgL3odwCwcfUMSn/PnF5U79PNd4NppDXqLGismQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EANhXmSVmRlHjC42A3Enh7V7U6f0NI9Sb0cusnW0ng0=;
 b=ZxJfN5oemAw7lkRPgQ4D2VtufVIN1VEwv7zrPluPtEde9Y3KxRTjh53VojzkLeum3ujiuL/ubJxGd2g0XNsXHbaqXQ2sdLHyvKlG+HNsT7aAb+5++4W7qPMYdGw1r1WPhAyqn2HrwllmnRtTkhG8ZyevZKOqvtspgWYK9i7Ydo8=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5698.eurprd04.prod.outlook.com (20.178.118.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.12; Thu, 16 Jan 2020 08:28:23 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2623.018; Thu, 16 Jan 2020
 08:28:23 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Peng Fan <peng.fan@nxp.com>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
Thread-Topic: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
Thread-Index: AQHVtaDOy35Q6KpKLESPO8UEr8sdH6ftIitQ
Date:   Thu, 16 Jan 2020 08:28:23 +0000
Message-ID: <AM0PR04MB448174E1DE647E9F2F65106988360@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e5c18318-3b3a-4827-e00e-08d79a5e0d56
x-ms-traffictypediagnostic: AM0PR04MB5698:|AM0PR04MB5698:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5698915F081B12570F3A4D6D88360@AM0PR04MB5698.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(189003)(199004)(9686003)(316002)(66446008)(64756008)(66556008)(71200400001)(5660300002)(86362001)(7696005)(66476007)(478600001)(8676002)(6506007)(66946007)(52536014)(55016002)(8936002)(7416002)(76116006)(54906003)(2906002)(110136005)(26005)(81156014)(81166006)(33656002)(186003)(44832011)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5698;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ftJWQfmdURHj2gXcAuHxjL853T9R7cKCB8JlQrrf993bAqf5NveqkBgOjBYIaD3UoAS+8PdC3LU35FyO0QinHApXIt+Z6Xb7gNL3AH93enmkWUIK7R9qJeihrgRHgBVRx/nF6vt2y4+47XMjM3mr2HdVsgLcbyD0c9tUASX9BVqU/UrOufismWtuP40Ur+kCqSXYxh0tWONlPnFm1p1sc/MxVs1FbzQISJfsXN/Y3PTh728gYAgZEf1TkxmGVORukRnwLz29cmTByqs12+RBYnLYMywTsvPxE9KIBAsMF/scRAnNrtOTmEqQmbz4zxuzk7pRQ7gBU90VZSQnL7xKeAk+TuuI76BEAhMU1FwNcvafua2N/yqsduT2sV2LGi17iKaVXXHLt+DvQg7vPv4UT05ixkjqrU0d54T1OcW0jQPv+VsNnA88dX/6Re1bXrBR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c18318-3b3a-4827-e00e-08d79a5e0d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 08:28:23.6845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0opulALU5yj+y//e58fZzxMkYFgWTmLuWvLNzDatUMOLyvXyg9aLK22GHkzdYzLtSrIpEuLxxpOxnyuTpPy4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5698
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> Subject: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api

Would you pick this patch up?

Per Uwe, this v1 patch use %pe is better that v2 use %d.

Thanks,
Peng.

>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> platform_irq_count() and platform_get_irq() is the more generic way
> (independent of device trees) to determine the count of available interru=
pts.
> So use this instead.
>=20
> As platform_irq_count() might return an error code (which of_irq_count
> doesn't) some additional handling is necessary.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index aa9dcde0f069..cc66a6429a06 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -15,7 +15,6 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> -#include <linux/of_irq.h>
>  #include <linux/pinctrl/pinconf-generic.h>  #include
> <linux/pinctrl/pinconf.h>  #include <linux/pinctrl/pinctrl.h> @@ -739,7
> +738,14 @@ static int armada_37xx_irqchip_register(struct platform_device
> *pdev,
>  		return ret;
>  	}
>=20
> -	nr_irq_parent =3D of_irq_count(np);
> +	nr_irq_parent =3D platform_irq_count(pdev);
> +	if (nr_irq_parent < 0) {
> +		if (nr_irq_parent !=3D -EPROBE_DEFER)
> +			dev_err(dev, "Couldn't determine irq count: %pe\n",
> +				ERR_PTR(nr_irq_parent));
> +		return nr_irq_parent;
> +	}
> +
>  	spin_lock_init(&info->irq_lock);
>=20
>  	if (!nr_irq_parent) {
> @@ -776,7 +782,7 @@ static int armada_37xx_irqchip_register(struct
> platform_device *pdev,
>  	if (!girq->parents)
>  		return -ENOMEM;
>  	for (i =3D 0; i < nr_irq_parent; i++) {
> -		int irq =3D irq_of_parse_and_map(np, i);
> +		int irq =3D platform_get_irq(pdev, i);
>=20
>  		if (irq < 0)
>  			continue;
> --
> 2.16.4


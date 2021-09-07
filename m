Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7C3402427
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237988AbhIGHYY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:24:24 -0400
Received: from mail-dm6nam11on2082.outbound.protection.outlook.com ([40.107.223.82]:57824
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237594AbhIGHYU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 03:24:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EP3OFePeRUJftaxZ6wwRGsE10qAVQuTHIIdDNqTgCTQXg7/h0Gs5ctdv95RQy7ia5cNVClEl99aa/927Q2arnUv5sTsx/LxJQ7qHCq8Q//a6zpvrEoQb+oBtfFulb6+W39BTOoZEmN4fPpUnAlSUXkOu3dVZP2gg3xA/8b0qjnByLORiWhADLx5lIDEDWtl8sJsxp80IpBPoW4t0CaNMjSv2bzo1vjxjQFblTkdemAE/d0BBbeQBZP+rkp+Uyc9jUqBD7rOEY+9ILktLoKXgjOQTBaQDn7McvrqrSZBW2YZ41tIqtRAsZd74yhFnQbg/rPUCDlKiX0gMXZrtpyISPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gf0NbVxz6OP2JBCXW0c9SANTUf9tEo8EJ65r0fpb4ig=;
 b=Uj2cHMjPCSPKuzCZKbhqRfk1mnaK+YhmM6G3IEuQTuz0jCXoKX3P9VrE348nvcph/Hi32xzaFdmie+cBBqcT8CrMtVIRPTeNPdx6hlUurXBwWUxrQxx0wGflgkOfsdyvwX5ui9Cb9PKMcV9US4Tl1HRIhZbqnlqTr7Fvro6vpyPpBCersgV/xv65umbkWJodtcd6BK25NMK77ElfDJPAfP3WbZJeighU5VnawIlByDCFvrxP/My5jDcGGfrzT6wTjeGvLoyNIafgYCwI4k291ADiyYZZly6L3SJJ3mZy6yFhNXw4YUkWihinjNKp4Tkzy0IYzptLy3RsOWMuTsTBrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf0NbVxz6OP2JBCXW0c9SANTUf9tEo8EJ65r0fpb4ig=;
 b=kzyqAir/14H2BrR+eDOhEX86LtPf6yZg64GofZoQQDdGPErnM3Ob/53tJb2BFLGGjmt00sDeMrp1NuK81KrxcWx+D/AoOeaTRDJZuaaS/TtM4nIS7rZ1kagIerDGfPaWgYiO9mPVIkUhEFncvatQormDVWHri8p3TDx0hpdixiqPF9mKwagNPtwvt7Xz42cFKgr4xjYCJngF1RFn+kf3UjOF70XqVREelSIRMH1kEyh+/xkUuE0GZkMzjoUil+sFV68WoIKn2DAt49qLbRPhwLwOQy67YhO7pBX/yDAOcrN31X+EyX6pGfXcPI/WQQwUHSCw2YrmIcCDpQMLtr56cw==
Received: from DM5PR12MB2406.namprd12.prod.outlook.com (2603:10b6:4:b7::23) by
 DM6PR12MB2873.namprd12.prod.outlook.com (2603:10b6:5:18a::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Tue, 7 Sep 2021 07:23:13 +0000
Received: from DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::e520:b0fa:9280:17fb]) by DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::e520:b0fa:9280:17fb%3]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 07:23:12 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Subject: RE: [PATCH v2 1/2] gpio: tegra: add multiple interrupt support
Thread-Topic: [PATCH v2 1/2] gpio: tegra: add multiple interrupt support
Thread-Index: AQHXoKyg2DOuE9cr+U214ESZQGx0EauWdFEAgAG8vqA=
Date:   Tue, 7 Sep 2021 07:23:12 +0000
Message-ID: <DM5PR12MB24065D4B90E8C743A1A3F547B7D39@DM5PR12MB2406.namprd12.prod.outlook.com>
References: <20210903101512.32430-1-pshete@nvidia.com>
 <20210903101512.32430-2-pshete@nvidia.com> <YTWeSJ7jGamxx9Uu@orome.fritz.box>
In-Reply-To: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38487c74-fdfa-4e81-f65b-08d971d05a13
x-ms-traffictypediagnostic: DM6PR12MB2873:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB28737CE8909571EC5047381EB7D39@DM6PR12MB2873.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NWzZEO1wcxsQvOUdhzvBn2R1f2PWiapZ77oYe8K//XNg8whvWlJye9eW+XrNACYQUnVEk6A/xvD0y7ryLGcPc9W+n5EwIwXvculoORwQ7TOXQ3NF1XJseoAzczpMfka6kfZGCKNZ80+e86Nrpf97SnCG/UCgcdTPdSaolhY5ZdutC8ymcBQU9PV7smOM6bpRdFQFnsS//aUP+5fJjpiaBGHTVecvu8SKcecU3MmSTnz76HHMeIBKAvaS7hErlww9WOV/EqXLuLzzU2T+y0GVxZyVMwzgSD6nxuoEUAqodxm1+Vy8Cbi5/XSuxewtdyZq7HbJ0Zc+SiMXuHq5T4klIgybsKr3nBS9NB86YduBkEFNhuq1d75kEZ6e8mZyDGiGt8tf4ngT5CUA1Qfgd+0Fvv/RDvI9r9lSIhLsRooH5Vl1h5jRJkxlkl+OP29o4HOv/om6opmW4KUyHvJ/iyd66v05ZvdydNPgSUxVVyxNBFagMUsb+p/r62Szzs/y6eTdGwuaA6HSmiCn6si2ZNy9Z+FqkQd4n5vOQ5V42+4yi98SYOLpKB3LYxhHZglT0pXhcyPalzcOjQSoBXkipKPkJGUnS9D1/h/tmvVn+Tu2cBTkjN/u3gLE3h2apz2EO+oTvrT1tCwXXAK1C4Q0WH0sxSVOQWWMu16Ng2awKQA0WqD0MzV1qX7OGvF8ktDPJmHBt38J97Py5Hetp2tgG73gMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2406.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(38070700005)(8936002)(26005)(71200400001)(64756008)(66556008)(66476007)(316002)(7696005)(38100700002)(186003)(5660300002)(52536014)(9686003)(86362001)(83380400001)(8676002)(55016002)(478600001)(6916009)(66946007)(66446008)(4326008)(54906003)(107886003)(33656002)(122000001)(2906002)(76116006)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p/NTcFgZQGj9FP7wGx5/rEy0HYrzMzf6WZaYbuKqAk9UGGEH2rKGXBqISrVN?=
 =?us-ascii?Q?mxj9Fa47fjwsC5RyHUiLb7m+bowdjVWmN4VwQpz0A1v6w2L7otYm16l5WtXu?=
 =?us-ascii?Q?EtwAg9YGfOI1Rq/nQquTf4IB+XPCLhjbq6LdPXxLYXAXXJHXvB4bYe06jpTl?=
 =?us-ascii?Q?8r3g3mRBW/DB1Fusqlzoo+X1V6+RTcMDBxm9HZU3bhIGhmSCxCJe+R34Eo3L?=
 =?us-ascii?Q?+o7YqRHXKZR30mIvA8pnoUkr2NxaSKTt4WQuGUkx53a5laruUuHZkOKqCbLw?=
 =?us-ascii?Q?ap+wLiAAng1PenyLjcXng4IeaiX1lyJb814uQFKdfJph3xI6ypZd0AVOehCG?=
 =?us-ascii?Q?CHC0Kl8SYvAh++xrMv/I+jjmGHvQ+tNKs/oXYYqOoq0bdK13mbR9pyKge6pm?=
 =?us-ascii?Q?y1rgvuSXhOokpseMyiWF6ExAs4johzDl42QF2VBRBH8RP5D9l/BtLzX3foih?=
 =?us-ascii?Q?UT309jaf6amPiwyUGnfktGxtadvs6v/AdA+PvQhWrVR1AKi33WsrXJZw0/it?=
 =?us-ascii?Q?tO8SzIXmPpVCMJlPtCOfWeiF2Zu3SsrDLA7zSC1pv0MkqV/1bkTCF8b/cys5?=
 =?us-ascii?Q?3GkZXmko1czZ6VQGqfzrfQh96ixRpJ3HDoYHvlnvFQqwZRwYBe8gHFiMeuyU?=
 =?us-ascii?Q?tnDIWl0bhrajUfYagQwpkpb2B2D6Q98kXNDDc5mAUrx4KNcsk2k8pq0av7oK?=
 =?us-ascii?Q?v9w6ot15nBGGLJTU+RUaoHZtzxLo9823vElfopZhjS/hy4fhcD6LunCA8UeD?=
 =?us-ascii?Q?F5Bw4p8JuwqOxjaVQeDMeaTIAPREIFJMu/L8Dl5HXZwCCiqc0VWqafx1xAiu?=
 =?us-ascii?Q?lrVGL4mP9s41zWu9UZTFXT0yAfsl/QkYeymPAwo+I0z2V7KDoC4YnC/ht/jg?=
 =?us-ascii?Q?+ZbfqsXMQUdw/uJMzp4aWEYzuw4fsDKgNoo4XYjtD2aisx75iTBgI0w16UuQ?=
 =?us-ascii?Q?S+jrZ28Gre3JGKbR6OgPAgvjCFQALL/kyCcyYx/2blPCBvZ5WPc6WU5ugpVZ?=
 =?us-ascii?Q?vrXrd7OywS6vlTUUwG2uuFpq0Cg16ccRUJNgHfr4Q5yPBKfpbf2Zw50xa1y9?=
 =?us-ascii?Q?5DEU8taGHT1H/cug+8UoAXokqT1BDCUVC79LfKDaclSoMnXTleHjXgnYj8b8?=
 =?us-ascii?Q?Gc+F+EYCj56DiJxIIlsWCjU3z0YGFDka3ac8UceEXejxLNizo5/obVefLfDY?=
 =?us-ascii?Q?CefguerI4PdvN5atQGnt8r0S+yogVUkiA25cY07XU9SbRCtSIe/VPZf4pswJ?=
 =?us-ascii?Q?//EXECBlOCNdh/zMFoJ05GQaaSSnDqxTaskRcxywitl39HU8vThJu6Ef1Eup?=
 =?us-ascii?Q?s2o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2406.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38487c74-fdfa-4e81-f65b-08d971d05a13
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 07:23:12.7260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QNhr3e7AncXFL89TLG10sG+D7Y6LjZn6eocW8TYC4uUCl96LLyHikFRz+dqzVq7OJZb2RrcxD9RXCK9yZ0BPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2873
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Answers to review comments inlined.

-----Original Message-----
From: Thierry Reding <thierry.reding@gmail.com>=20
Sent: Monday, September 6, 2021 10:21 AM
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linus.walleij@linaro.org; bgolaszewski@baylibre.com; Jonathan Hunter <j=
onathanh@nvidia.com>; linux-gpio@vger.kernel.org; linux-tegra@vger.kernel.o=
rg; linux-kernel@vger.kernel.org; Suresh Mangipudi <smangipudi@nvidia.com>
Subject: Re: [PATCH v2 1/2] gpio: tegra: add multiple interrupt support

On Fri, Sep 03, 2021 at 03:45:11PM +0530, Prathamesh Shete wrote:
> From: pshete <pshete@nvidia.com>
>=20
> T19x GPIO controller's support multiple interrupts. The GPIO=20
> controller is capable to route 8 interrupts per controller in case of=20
> NON-AON GPIO's and 4 interrupts per controller in AON GPIO.
> This is new feature starting T194
> The interrupt route map determines which interrupt line is to be used.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tegra186.c=20
> b/drivers/gpio/gpio-tegra186.c index d38980b9923a..36bd8de6d401 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2016-2017 NVIDIA Corporation
> + * Copyright (c) 2016-2021 NVIDIA Corporation
>   *
>   * Author: Thierry Reding <treding@nvidia.com>
>   */
> @@ -68,6 +68,7 @@ struct tegra_gpio_soc {
>  	unsigned int num_ports;
>  	const char *name;
>  	unsigned int instance;
> +	bool multi_ints;

Do we really have to add this? Can we not simply derive it from the number =
of interrupts actually read from device tree? Doing so would also make it e=
asier to keep the code backwards-compatible. Remember that this code must n=
ot fail if fed with an old device tree where not 8 interrupts have been spe=
cified per controller.
[PS]: True, we can derive from DT but adding variable in soc data which is =
static is more easier and effective to maintain as well. Yes I have verifie=
d the change on older DT blobs as well and it is working as expected.

> =20
>  	const struct tegra186_pin_range *pin_ranges;
>  	unsigned int num_pin_ranges;
> @@ -451,6 +452,7 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>  	unsigned int parent =3D irq_desc_get_irq(desc);
>  	unsigned int i, offset =3D 0;
> +	int j, flag;

j can be unsigned in, so you can put it after i in the line above. Also, ma=
ybe name the flag variable to something more specific to make it clear what=
 it's used for.
[PS]: Addressed this in version v3.

> =20
>  	chained_irq_enter(chip, desc);
> =20
> @@ -462,9 +464,20 @@ static void tegra186_gpio_irq(struct irq_desc=20
> *desc)
> =20
>  		base =3D gpio->base + port->bank * 0x1000 + port->port * 0x200;
> =20
> -		/* skip ports that are not associated with this bank */
> -		if (parent !=3D gpio->irq[port->bank])
> -			goto skip;
> +		if (!gpio->soc->multi_ints) {
> +			/* skip ports that are not associated with this bank */
> +			if (parent !=3D gpio->irq[port->bank])
> +				goto skip;
> +
> +		} else {
> +			flag =3D 0;
> +			for (j =3D 0; j < 8; j++) {
> +				if (parent !=3D gpio->irq[(port->bank * 8) + j])
> +					flag++;
> +			}
> +			if (!(flag & 0xF))
> +				goto skip;
> +		}
> =20
>  		value =3D readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
> =20
> @@ -772,6 +785,7 @@ static const struct tegra_gpio_soc tegra186_main_soc =
=3D {
>  	.ports =3D tegra186_main_ports,
>  	.name =3D "tegra186-gpio",
>  	.instance =3D 0,
> +	.multi_ints =3D false,
>  };
> =20
>  #define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
> @@ -798,6 +812,7 @@ static const struct tegra_gpio_soc tegra186_aon_soc =
=3D {
>  	.ports =3D tegra186_aon_ports,
>  	.name =3D "tegra186-gpio-aon",
>  	.instance =3D 1,
> +	.multi_ints =3D false,
>  };
> =20
>  #define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> @@ -852,6 +867,7 @@ static const struct tegra_gpio_soc tegra194_main_soc =
=3D {
>  	.num_pin_ranges =3D ARRAY_SIZE(tegra194_main_pin_ranges),
>  	.pin_ranges =3D tegra194_main_pin_ranges,
>  	.pinmux =3D "nvidia,tegra194-pinmux",
> +	.multi_ints =3D true,
>  };
> =20
>  #define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
> @@ -875,6 +891,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc =
=3D {
>  	.ports =3D tegra194_aon_ports,
>  	.name =3D "tegra194-gpio-aon",
>  	.instance =3D 1,
> +	.multi_ints =3D true,
>  };
> =20
>  static const struct of_device_id tegra186_gpio_of_match[] =3D {

Going over this patch reminded me that I had written a similar patch a whil=
e ago, which does things a bit differently. I've attached both patches belo=
w. Please take a look. It's slightly bigger that your version above, but it=
 addresses the backwards-compatibility issue. It also has a couple of comme=
nts that describe why the interrupt routing is done the way it is.

For completeness I should say that I'm not sure if I've ever tested the sec=
ond patch because I had it marked "WIP", which I usually do if there is wor=
k I know remains to be done and since there's no TODO comments or anything =
in the code, I assume that I never tested it completely.
Looking at the history of the branch where I have that patch, I don't see c=
hanges to the device tree files, so I probably never got around to adding t=
he multiple interrupts per bank and hence couldn't test it properly. I can =
do that based on your second patch, but it'd be great if you could go over =
the attached patches and let me know what you think.
[PS]: I think this change is much shorter and simpler as it does not add mu=
ch code and hence reduce complexity. The change you are suggesting is lengt=
hier and also I have not looked into your patch in more detailed level.
=20
Thierry

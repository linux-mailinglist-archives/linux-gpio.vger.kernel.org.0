Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3858F444043
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 12:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhKCLE0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 07:04:26 -0400
Received: from mail-bn8nam08on2048.outbound.protection.outlook.com ([40.107.100.48]:53729
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229506AbhKCLEZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Nov 2021 07:04:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYdVNMyvUiAE0ud16/UHPEXU3tlncZJtunQ7AEwlij0OxYMIrHi/BBrPwrwX5TEuOa6EFsuF2aFClqHedeeWQQ8GFMg1ACqQJHBH9UCqRW6TCLZgZ8oEn6lSRMZwuh8y23Fk2VJO0YHtHH6AWDCyFRbh3w+XgDeL3Zt01085a2co5EkhfF/WcHe+PnMyUo5Y3MLdw72veKwQYWNwM+dTNXDdxVZC2hSvmgLsi1uC5K85PC0ICiWiV1EgaSAvima3W9SXh9vYbm+obO+s3o4wM2J5e3Ot+2WFWnom+AeXR50CeZsqdgNAnKksslxG+qURJqF8xpq1dYRFKA/mkkI5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJYOq1fGGG7EijPhbIETj0CH/0j6TxZGZzFI9vodAtI=;
 b=jrI/aoc7Q+BnalDyofMhz7HlAaaiJUslG5dnZlJqP4aGQPYc7zHQStMr4bWAqjnvCK2S+46c/6T3Wb1rZ4OnCBPdO6sKHFIIO5CcYF87EGyGhnyeKHPcDgcODVi8+3ucuuSe7/FveJiQhUBCAAi+KBInzRcHVGXhhhlCPdRHSI5aK5ISIM0CZOT1P0ElLN6A+SHcEKJthj6Ires7VR18LmXH2TgO+C27D9H5dNWZBoe1s3fQtJqHzZVucMf3xLRO0CiLBNfbeHu9tN2n2UOQPEadl/H4Ggli5gAFn99eJ5NRb+VQz4sdia8zqtTccxI3/+OkRcoYeZ/SNjUxiRc2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJYOq1fGGG7EijPhbIETj0CH/0j6TxZGZzFI9vodAtI=;
 b=uXW4Qzt8NxqS3Hr5AJhTO3k02aNLBflWw1c0xpTkhJnyDlzq4zd5VzGhvrL4SvMKVRtaRjmiIftO7lwfokbLYn6cluY1Ou5mA7pzfKXZnHRD6iw4DTuQLkKQjuQ3cNC0oz3OxyKLDSdNXX9oRAArTQ9aRVuvC6fXdcovk1Gdm36iZM0kZwOSx/GgTX44ZqQBjxZTOKXyFprk0MUg3fEZUfaYiwVRDtBbAaTmmhpX2J8exkbfaodARf/lG0Y/vnJqXini47Cte2gNER9JHUJpp/hJSR9jtS+9BqM6ISScEosvHKwe9NdMfx8MNQZDDk4IbqIzIoVePJp0W6Xwtz33pw==
Received: from DM5PR12MB2406.namprd12.prod.outlook.com (2603:10b6:4:b7::23) by
 DM5PR1201MB2538.namprd12.prod.outlook.com (2603:10b6:3:de::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.18; Wed, 3 Nov 2021 11:01:47 +0000
Received: from DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::5926:d2bb:5b4b:1b99]) by DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::5926:d2bb:5b4b:1b99%6]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 11:01:47 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Subject: RE: [PATCH 2/2] gpio: tegra186: Add support for Tegra234 gpio
Thread-Topic: [PATCH 2/2] gpio: tegra186: Add support for Tegra234 gpio
Thread-Index: AQHXxnecSkoS2QpObEy0hpbT1IQXN6voiISAgAfDtoCAAWszwA==
Date:   Wed, 3 Nov 2021 11:01:46 +0000
Message-ID: <DM5PR12MB240697948C6DFF64E45AFF00B78C9@DM5PR12MB2406.namprd12.prod.outlook.com>
References: <20211021123021.9602-1-pshete@nvidia.com>
 <20211021123021.9602-2-pshete@nvidia.com> <YXq3/1AXX7KiwpTy@orome.fritz.box>
 <YYE7aXo0mfCfCqGF@orome.fritz.box>
In-Reply-To: <YYE7aXo0mfCfCqGF@orome.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00d98a4b-569d-4d48-cc3b-08d99eb9544d
x-ms-traffictypediagnostic: DM5PR1201MB2538:
x-microsoft-antispam-prvs: <DM5PR1201MB2538F0CAF320590F3F5AADD6B78C9@DM5PR1201MB2538.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aCCPQjmGt5lEsasq6X9V6BjshJmukwBAtEhHddrgv4XnXdjDX9MBppDNHBpHZU7xwj6zToL0JvTta2oSCFy8tvZYCoxcdDELY2rMHloZJZF7yDXEie54e6kt0UjN0dK8+jrFkrH2wVKDvQJThKp77mj3zuNcChuEzCEd8XEc5NDQpbI+x9iHWhbv2Ux9zT3MzNRFoOoVV9o0leNIq9f+i1LkWNvBcQaACfMqsZaGtyTFaZ9cFwJHmTaNXMpPBDNw6LavgitpIAQWIgg/JsPgFVzpJu775AxuWcO7k0kRfmkDwHd76LbSrQ+xhivUj9XGCvxZoLorRGthGXxp/IryaObwcskiTcYFcDoVUywKYjOr2nfs0gpQo7k5WwuSSJwNvubefA4OAOMvEDae27biNmDAgoKTPR9aZ2oY0/onh+/813Om7RkDpTZiUKeUVZUxQKEjD7qNzkzDR5Y4lyow9FNs2ej6D29aTgF0wPksvXP78NGmqWjLnHgnXEja7iZwu0eYVrDYfWhIpeq/f23ojopx6Fyw2z07D7rUSArtH0HunYTcGBbesuCQuqbYgkFf9qSNGoQLiwo90VvCkNFvx1vMeHe8ykXeqK0/zZAUdvYMZUnASYMH8TKRR0FJPvI1FhofVNirn3YIbq/WaZ3Ec0jRJr8idHQQTs2OggIyOsV/Mu1pr448/385ga1oEQEWAXFWs83XHIVXxGNoXuhMsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2406.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(9686003)(2906002)(7696005)(5660300002)(38070700005)(6506007)(86362001)(6916009)(8936002)(107886003)(26005)(55016002)(38100700002)(53546011)(508600001)(66476007)(66556008)(8676002)(316002)(186003)(71200400001)(66446008)(66946007)(64756008)(54906003)(83380400001)(33656002)(52536014)(4326008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EoF8WEu7HjxiJ3dpjIAeQtwO/ekVrCaqgZNRA6VozPZSpce+uun6oYMTaI5P?=
 =?us-ascii?Q?8JLFHzrZJ1n3+mf85ORlLVRKBQEECOtsDSv0klH4GdE4Jm8s1BgW4EAcuMYO?=
 =?us-ascii?Q?S5OTCnyL2EzYlgWz8nvjQbwBIhIvuPp73S5ugimkSefbSxkpMzSgjNYsNUjV?=
 =?us-ascii?Q?63PwLv1fT7+3z0v2RcrDJ07/kbbBAEsHqtD9GAObN+ejwsqYU9TKxPWZF+uy?=
 =?us-ascii?Q?DE9fGtkzvpPoUi+b9eGLwtnYZkzP0IcN9o+r7lvP8OX1ioa6xeeOByASa6jO?=
 =?us-ascii?Q?uAicVzxD8lTED/lnv+O0FcmPASwe6OeFhyGI97PU6iCcznW6Ne0+UKq9lzjZ?=
 =?us-ascii?Q?FMdAjuhQVTC8MpBQ2nmTlYUAdx9w9wHa9M64itN5/LtX0H1hRiRiL20WcsqP?=
 =?us-ascii?Q?FotWfjA0hfYIr7kcVKjbe8eZPwV0RNO3167ldK/zQaeFL7KYyRvqn8pbH+ka?=
 =?us-ascii?Q?thoRrgqIzeNzubfeW2+ePCBmmIJ83ePvfPCFLkA0oEJWvBT3QzH5gb/vu/Gx?=
 =?us-ascii?Q?5MeMnPjtVqY22QnSvOaUfPoXLMMuAc5OnvhyvE680c2NN/boINEKKCR90Mbn?=
 =?us-ascii?Q?N3RM1lUyZR3gOV5yLsnkMLhqkqZg4VEniKXiosD0/KRhTW6gXG5w67LDotV6?=
 =?us-ascii?Q?1hL4S3XVOfA7FuV/7csRo8UlYK6JGxPSnxmL0kdil8OcIOseYbOQZcWu2dIg?=
 =?us-ascii?Q?ciiQNmSyf04/4Qoiwt6lLfbNwqYmg0NmzGA3uvyxwOnSLj5dfyLT++PSR+7Z?=
 =?us-ascii?Q?O07IOEuwvvYIlpYmUUsjmThzS8Umi6gvnAA5IggpImDl9s5CZcTXmammAqPV?=
 =?us-ascii?Q?ZQ3C76Xy57e36BSTMUeRarsNS3zsgKnfongV+yY+sCG10v+rLFegO9xefeQ+?=
 =?us-ascii?Q?ri14qx1pdOaiVKM8wbUfQR+x7uONZhItRleka7Ja9B0C8QyKGGahRlM1M1pe?=
 =?us-ascii?Q?iyFmrNjAaSJVeRarpeBzA1yBVpLF54Z4ZjGPkEFK/CJkOUb6qXRVTivOZhnH?=
 =?us-ascii?Q?tL8GtCdHUCT8hdZhY4BvpvHHhHpbjZbwY23tZOKcCnkE44VIl2rcgW2eg8Lt?=
 =?us-ascii?Q?SgvxqBV0n1xm/5rqsWOclj83Nj2bFRdvicdn3rdZWhEWQ9gk+KLYu5dUIC/+?=
 =?us-ascii?Q?dVE4xXlZYL80py2r5IhKVTyTaGaxGC8mWhbMFoW6oALtuVa9xWBsCpWk1ECX?=
 =?us-ascii?Q?Jm2Ddcd2vOH2iCLOe7V/SN0Rq6mlHLug1zd5gZnrl0jWy+lLhy/AqNKit3DK?=
 =?us-ascii?Q?C9cLZ2wYezPIAVc37XziN7ruC0lPNj8gzM/iXRgESdRNqqLNgpfYixq8L9z/?=
 =?us-ascii?Q?1eO12qCrtujl6+F//OnT0wlMkMFYnZP31HAoAbtlLpR6+rPTrjcfGnzpLXj/?=
 =?us-ascii?Q?LK6J1lXRrpXQbRSe1n6Rl2dsU/EkbNNxggbxYQ9laaVkxwFIbdpHtqO+b/Mo?=
 =?us-ascii?Q?5XGuHLTTLi4bgMwOctiOJmmNcHhGHKKU6QXGfsjGv2eb5sEFAECuGZ22BETD?=
 =?us-ascii?Q?lWOeny4BJnWMs2NWy/MlR9uKKcuKRWF7B5eOGRLIsrwpMDyoSS/ixIUBbZ1R?=
 =?us-ascii?Q?8NE6wKoNZih19amYHp0JCXISZ2UQ1G3myoZNXINry9kBntlOY6+7rRE+aEot?=
 =?us-ascii?Q?4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2406.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d98a4b-569d-4d48-cc3b-08d99eb9544d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 11:01:46.8389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JXFcmVV66uiit/9WGBZQkIjCCAcb2HvGlbiJQ7ThgxZH0km+WWX/PaTSfBwt8jJmB9sZTrpwSepmWKT9ThlGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2538
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Thierry,

>>That said, I noticed that you didn't include an update to the device tree=
 bindings documentation. I do have that, in addition to a conversion to the=
 new json-schema format. Do you mind if I resend your two patches here alon=
g with the DT >>documentatino update that I have? I've also got the DTS cha=
nges for Tegra234 to expose these, which I would also like to include for c=
ompleteness.

It would be helpful if you share the update to the device tree bindings doc=
umentation patch with me I will push all the changes together.
OR=20
Can you please resend these patches along with device tree binding document=
 patch that you have.
Anything is fine for me.

Thanks
Prathamesh.

-----Original Message-----
From: Thierry Reding <thierry.reding@gmail.com>=20
Sent: Tuesday, November 2, 2021 6:52 PM
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linus.walleij@linaro.org; bgolaszewski@baylibre.com; Jonathan Hunter <j=
onathanh@nvidia.com>; linux-gpio@vger.kernel.org; linux-tegra@vger.kernel.o=
rg; linux-kernel@vger.kernel.org; Suresh Mangipudi <smangipudi@nvidia.com>
Subject: Re: [PATCH 2/2] gpio: tegra186: Add support for Tegra234 gpio

On Thu, Oct 28, 2021 at 04:47:27PM +0200, Thierry Reding wrote:
> On Thu, Oct 21, 2021 at 06:00:21PM +0530, Prathamesh Shete wrote:
> > Add support for the Tegra234 GPIO bank configuration.
> >=20
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > ---
> >  drivers/gpio/gpio-tegra186.c | 74=20
> > ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >=20
> > diff --git a/drivers/gpio/gpio-tegra186.c=20
> > b/drivers/gpio/gpio-tegra186.c index d38980b9923a..edcc91b35e1e=20
> > 100644
> > --- a/drivers/gpio/gpio-tegra186.c
> > +++ b/drivers/gpio/gpio-tegra186.c
> > @@ -14,6 +14,7 @@
> > =20
> >  #include <dt-bindings/gpio/tegra186-gpio.h>
> >  #include <dt-bindings/gpio/tegra194-gpio.h>
> > +#include <dt-bindings/gpio/tegra234-gpio.h>
> > =20
> >  /* security registers */
> >  #define TEGRA186_GPIO_CTL_SCR 0x0c
> > @@ -877,6 +878,73 @@ static const struct tegra_gpio_soc tegra194_aon_so=
c =3D {
> >  	.instance =3D 1,
> >  };
> > =20
> > +#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> > +	[TEGRA234_MAIN_GPIO_PORT_##_name] =3D {			\
> > +		.name =3D #_name,					\
> > +		.bank =3D _bank,					\
> > +		.port =3D _port,					\
> > +		.pins =3D _pins,					\
> > +	}
> > +
> > +static const struct tegra_gpio_port tegra234_main_ports[] =3D {
> > +	TEGRA234_MAIN_GPIO_PORT(A, 0, 0, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(B, 0, 3, 1),
> > +	TEGRA234_MAIN_GPIO_PORT(C, 5, 1, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(D, 5, 2, 4),
> > +	TEGRA234_MAIN_GPIO_PORT(E, 5, 3, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(F, 5, 4, 6),
> > +	TEGRA234_MAIN_GPIO_PORT(G, 4, 0, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(H, 4, 1, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(I, 4, 2, 7),
> > +	TEGRA234_MAIN_GPIO_PORT(J, 5, 0, 6),
> > +	TEGRA234_MAIN_GPIO_PORT(K, 3, 0, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(L, 3, 1, 4),
> > +	TEGRA234_MAIN_GPIO_PORT(M, 2, 0, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(N, 2, 1, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(P, 2, 2, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(Q, 2, 3, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(R, 2, 4, 6),
>=20
> I stumbled across an old patch I had created a couple of months ago=20
> that is very similar to this one. However, at the time I had added a=20
> couple more ports here, namely S, T, U and V. Is there a reason why=20
> you're not including those here?

Nevermind, looks like my patch had been based on out-of-date documentation,=
 so the table here is correct.

That said, I noticed that you didn't include an update to the device tree b=
indings documentation. I do have that, in addition to a conversion to the n=
ew json-schema format. Do you mind if I resend your two patches here along =
with the DT documentatino update that I have? I've also got the DTS changes=
 for Tegra234 to expose these, which I would also like to include for compl=
eteness.

Thierry

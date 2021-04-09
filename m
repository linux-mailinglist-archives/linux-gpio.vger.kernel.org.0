Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F2F359E65
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 14:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhDIMLY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 08:11:24 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:30955 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhDIMLX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 08:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617970270; x=1649506270;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pj589dPDrfBMl7h8ml1hAiVOTepA292L6WK9IZ1E5UI=;
  b=rVeOYjdlokkizrEAxVpA9WC/l07QsJHFDpb3ImwVBrFqWtOxGGkQV1b/
   LNpiSRf4DnyN92r4W7O5fbO+XTtK53je2rQextLlXmbBHeHYkYKp/kYNI
   gq0SkWmBqeTC2rtQPTzJqgjCWNPog3SImkQgRFleXzP7o1ibyIRFQogTw
   SwKpbp/tU454JBFj3tcKt6gHFZhlxbcrENVYuJX6uNoSFzAJz8MZWPV3r
   +yl53Zreb6LejCm9a3pG4maLSI1/hgXOZPYy6reDRzYWuD1/f3ez02XgU
   Y9U0iB+Jluh/CnrR9YBdXGCHivSSBgtqafMDT2cKkGIPXjDj4w/2yRMMg
   w==;
IronPort-SDR: JA53T9zrfEtXKw0Zk6CRz2ZsANOI12L2tTxiO2eJOboeQkX7ZuBHJ514nrFacUpCx02LnvrxHk
 87luaRcDR7qiiKyljx9CCUMElxIWEKDSOLLPmMyew5bDRNjhJljv99XuZwl7jEnvXImMni1HwO
 Tx3JpgenGqvLj7W7hONYclOuF9VBVz7jXB+3ZxaJ/G9Ddo3cZgu45pdzUqWDazvvULQnzY12Qd
 oQb1FIqd+xK4kfQs97MZJH0SNvIHZmwmFzDtH0dNRTL1Rke9UovSK5vPulV1Y3YxzUl4yFuQ16
 /9E=
X-IronPort-AV: E=Sophos;i="5.82,209,1613458800"; 
   d="scan'208";a="110253554"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Apr 2021 05:11:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 9 Apr 2021 05:11:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 9 Apr 2021 05:11:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlxXuxpUTR4LLpVXf/fNgvwThcOIOGTgpR7n7YOFyf8kAoRc0/Lu0RzmiH25ywoFOqhfCcSNcaKq9hVOqEQajV3Td/Hm5RLPvLpi9YXPSzD80IdGigNtxAGBL9wf50WNnFvgpkkGmCD4Uz2AtdMm8rY9IQpPbeoLiD5qyn1sVzLo+cY2ie+oDXl5/VI9nDXZSIAvlfIvspmVnD41RjHyGe4Cw16Y7zHloJBj9g4mhYf56DBZMC1BmiwtyswqZphyWw1PTXeuvb5EAq5eSRCXcXX3B0bKA2EOUqPL15Rif1Tzq60IrFaN2j5R/HHL3gX+rQNcA378kPjxx0NlBbuuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAyMt6EIokCy5ggDPBpb3Dz/homynVKhm+GvF1DnDcI=;
 b=FgxNVVNeNk1HXc2DUe+RZlyeYfgqVtKUoV3ztjxc+v8gi/+kfQNpF/JDZmcFOav1GX6K4bUQDSHD1HTjhi0YHUWT008b1rVk8zk2YaDacAjMrxZ2frzhhMP8kJgBxFOL6IfWjCjB0v3YkTPT4QU4SGp1H78tJmIDGvaN7F5Ts8dpuU930h9AMk4A4T4DcpH0GXJWURDZxN9xg6yf5VILbJlmuvJv3j5HRta48MTiQsQZsPZ89JE2S9UzibrD10cGyf27w8mSlFt7tuEsKUbBzRzJE9Tf1OKmA5Zt2xxZEcPB8+iQ8Nvq+AJ0kRVKCPtMFCSfUEWX029/K3PPb5Nbjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAyMt6EIokCy5ggDPBpb3Dz/homynVKhm+GvF1DnDcI=;
 b=UbmTXRdfw0aIZ4PJXLQ84UaLVx2ay4e2v1REwjMjuVADQ16TKXncTEjq5yqm7p/+JAHVAj8gq1tJ2Kope2RJ88p1EC8sfNLqyp8UStXXuc35ZbWQkTbxXLENbMyecnlb75TCFxnIHcSjtPqG6VE660UV8/zb+jZtd86uW14sOio=
Received: from DM6PR11MB2777.namprd11.prod.outlook.com (2603:10b6:5:bf::31) by
 DM6PR11MB3083.namprd11.prod.outlook.com (2603:10b6:5:65::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16; Fri, 9 Apr 2021 12:11:09 +0000
Received: from DM6PR11MB2777.namprd11.prod.outlook.com
 ([fe80::380f:b21a:cba2:7c18]) by DM6PR11MB2777.namprd11.prod.outlook.com
 ([fe80::380f:b21a:cba2:7c18%5]) with mapi id 15.20.4020.021; Fri, 9 Apr 2021
 12:11:08 +0000
From:   <Ludovic.Desroches@microchip.com>
To:     <Tudor.Ambarus@microchip.com>
CC:     <linus.walleij@linaro.org>, <Claudiu.Beznea@microchip.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: Fix slew rate disablement
Thread-Topic: [PATCH] pinctrl: at91-pio4: Fix slew rate disablement
Thread-Index: AQHXLRnq9RpxBsB7oU+h+ykUgcKl36qsGKOA
Date:   Fri, 9 Apr 2021 12:11:08 +0000
Message-ID: <20210409121107.mcjo6cbsequjd3v4@sekiro>
References: <20210409082522.625168-1-tudor.ambarus@microchip.com>
In-Reply-To: <20210409082522.625168-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [109.210.128.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68be5f5e-b187-4b8e-0c47-08d8fb508f16
x-ms-traffictypediagnostic: DM6PR11MB3083:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB308364F8199ECF076BA031B0EF739@DM6PR11MB3083.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RLd0Up32wQfIrjlGaTPX+1UDk7UMdAan/66pi1mQBRZ+qic3ALI1HfwS006xbayybnPq2N0wKMz/jgJn+JdV7YoElFOGoXxLV3XR5Pq2l7ihpSgdIEuWTuaEVhwv7hnBsmML7JguDK/Mk1pGKvyxnz3W0Cn4y7CPzuYYfcyT4HlG1GI/SAAmzRc+m3RfOKQd1CXqeH4kw88AlA82LVyhZ2f+Cqcp64QbP2jJv07AUdSiLTUYbicO/IJtTXppAoH6RKboZ+ep5R3FU+7qa7xbeE2ig694OJEJFxDwzJx3Y9mOQGVEjPICi9WZUJkJbbkr2XoDa7kkaGWSlYba+b0pRI8/yIkpyLO566vx2N/EGIKCoCKk+RMzXOn6YMHuQewCHNpqdigT7kf/iF6SCZlC5zpSCCuWf2BbCLH3OCHzL9nY0knLfUtJSABY66TG4faxskdPs02cQAKDN1dD3FRMm4f+yhyfuSBkPSyr1J+2em81zDHfsFTcyIH6T80rRZUBZVYP/ssxsZY8wSlQXiGTM/yDSXfvF/3b8FaHoPJh5BSxv5DBbY2CkOAL2f4ITimknbrC5AWoKPO5Ha2gTp/aO8AUosRoPKNAGwHobN5lHRgQYGxoE7FFNI0xFnLdS3beR9/q75QDWMCE1Ypj8NDXvhLPMl5BqjzbEubYaL8ZhZ8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2777.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(39860400002)(396003)(366004)(136003)(346002)(376002)(91956017)(66556008)(1076003)(33716001)(66476007)(76116006)(26005)(6506007)(66946007)(64756008)(4326008)(2906002)(6636002)(54906003)(66446008)(5660300002)(38100700001)(186003)(9686003)(86362001)(71200400001)(478600001)(6862004)(6486002)(8676002)(6512007)(316002)(8936002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?IsEqUIzI0kyQlmcll8SrZoHckAOboGrKg6TOgmIVX7E8so1MrJtkg4pxaFc1?=
 =?us-ascii?Q?SkKOTdg2G+d1YxHm8klIIz7Tj2Ppx5jkSXaqAslR/rtuzFZ00xE7VPvI2j5B?=
 =?us-ascii?Q?iy1h40YqcrXPolYsjfTaOvu1C5lc84UUXqAJ2hL614hygvXTg8ctk4XyAew8?=
 =?us-ascii?Q?TYv8oS62hh0OPgzdJL6wt8CmWN4bCqdvftOf3aVC/vQfFhgxgo2+osKKzdxO?=
 =?us-ascii?Q?6rqaItEEfgnhoyNnZh74kG6kMlzb1o0iAFWm23Wc4G8bZz0IVkQftZ8hZR3l?=
 =?us-ascii?Q?XSsx1NwzQnmz4spAJqUzY4dOkkT2RWWNDLWUnER2MsjRXfwKk/ofIhcanxcs?=
 =?us-ascii?Q?Wmdm1Gll/OMAUHAwLEaTK4++PdegGhVlHAnhknOnddavWuUBpM46jb7X5MVB?=
 =?us-ascii?Q?d0j24W0FE5jTQnDgfT/HC6ofIR8EnF1JtVKc+inI7EuR7k+ZiaiGWQyTM8M+?=
 =?us-ascii?Q?mQc2OWZewdZ9KoLetVoVIZPc1HT0U3RR5Io5ZrdWEAqEdqkBkD85ZCrVwRkd?=
 =?us-ascii?Q?G56TRv2/9/nMOG2ROJBCRcVldoBkmtMjgwoardsJAatvZ+0OyotMqBK58fW0?=
 =?us-ascii?Q?hSpFA/+7gc7MiF39SrKT7X/LkqiCT6BBopQwPMPUl7kMtT15QJUF0w2Q1NP2?=
 =?us-ascii?Q?QK9ZC8V9Z0Ln8GbBoYjhJ8CcbJKxNWx6NzyUyL/f1LXlpB13jJJrmOc20k5G?=
 =?us-ascii?Q?qF0m7AZNbdvzIHJdRlM5WIr75wviEsMRQIYuaeJr+8YBFNjvU4azCOFjUFZM?=
 =?us-ascii?Q?6EyxWiQO1SNLXHJsZtvdVVvXOfl6s7amoWK5IaZJbfxVjpGWIi2La3DxTkG4?=
 =?us-ascii?Q?3Swo72scdLtv3g9yHc8929lRenSJdKxQbA6APYmrysDvFr+tskHHxzaS5F7t?=
 =?us-ascii?Q?eFo4oesCnFMlVXPjTs3+XqFooU7BoJ6cwRBSsWulor+T3WeitHyQajxfQnCP?=
 =?us-ascii?Q?5RmnxBKjy616nswldKo+PiJH1o1VG890yA9XdrBlsJDP66LtYhCHwKjD7EH0?=
 =?us-ascii?Q?U0dY9HMfB10iyFOhR9i4SWtLivCLLJq8X5VYWAd2PdI+20TzOj4qOxOO68hF?=
 =?us-ascii?Q?Q2iq/8e3gugEX7yzIUoFwdrI0piLTnihj0r7vaERH4qA78flf9a9NakrCW84?=
 =?us-ascii?Q?bVwRggOC6EE2nrs/MgWwgLj93hUtOQb/owIPd5P5GraatZ1QTvZNHDzNO9ey?=
 =?us-ascii?Q?l8iJPglsK/EofWwaxS7lNfo+zzmQg3FJjxnT4zw8v9gZufSnWMbt6hIxaszi?=
 =?us-ascii?Q?8kFFBm0Cvk9/ZhT//Ae5iQArEK75VSouVtRiJDR1aJAoInAOVAzvUUcp/o5p?=
 =?us-ascii?Q?xDhUu044oisHqoB68CupKnjlDequvLnAnQmgWwoMDww6xA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85BA562FCFCBD44C95621F4F6C025A7C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68be5f5e-b187-4b8e-0c47-08d8fb508f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 12:11:08.8068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KG0pB6vVtEdkk6VgGPnqBX6KcAAcyI8l4cbK3YGOgg29yXvtr11dLmPbsEIC6J6NVPP4j0dZjqwXH4QSzsQ7laTW6UswSba3M1t8Wo0yNdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3083
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 09, 2021 at 11:25:22AM +0300, Tudor Ambarus wrote:
> The slew rate was enabled by default for each configuration of the
> pin. In case the pin had more than one configuration, even if
> we set the slew rate as disabled in the device tree, the next pin
> configuration would set again the slew rate enabled by default,
> overwriting the slew rate disablement.
> Instead of enabling the slew rate by default for each pin configuration,
> enable the slew rate by default just once per pin, regardless of the
> number of configurations. This way the slew rate disablement will also
> work for cases where pins have multiple configurations.
>=20
> Fixes: 440b144978ba ("pinctrl: at91-pio4: add support for slew-rate")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks.

> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctr=
l-at91-pio4.c
> index a5d328808e4c..4c01d8471ffa 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -801,6 +801,10 @@ static int atmel_conf_pin_config_group_set(struct pi=
nctrl_dev *pctldev,
> =20
>  	conf =3D atmel_pin_config_read(pctldev, pin_id);
> =20
> +	/* Keep slew rate enabled by default. */
> +	if (atmel_pioctrl->slew_rate_support)
> +		conf |=3D ATMEL_PIO_SR_MASK;
> +
>  	for (i =3D 0; i < num_configs; i++) {
>  		unsigned int param =3D pinconf_to_config_param(configs[i]);
>  		unsigned int arg =3D pinconf_to_config_argument(configs[i]);
> @@ -808,10 +812,6 @@ static int atmel_conf_pin_config_group_set(struct pi=
nctrl_dev *pctldev,
>  		dev_dbg(pctldev->dev, "%s: pin=3D%u, config=3D0x%lx\n",
>  			__func__, pin_id, configs[i]);
> =20
> -		/* Keep slew rate enabled by default. */
> -		if (atmel_pioctrl->slew_rate_support)
> -			conf |=3D ATMEL_PIO_SR_MASK;
> -
>  		switch (param) {
>  		case PIN_CONFIG_BIAS_DISABLE:
>  			conf &=3D (~ATMEL_PIO_PUEN_MASK);
> --=20
> 2.25.1
> =

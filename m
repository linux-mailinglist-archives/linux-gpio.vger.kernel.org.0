Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E39774188
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Aug 2023 19:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjHHRXP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Aug 2023 13:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjHHRWp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 13:22:45 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D737D7A3
        for <linux-gpio@vger.kernel.org>; Tue,  8 Aug 2023 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691510969; x=1723046969;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vzTWIGzjz5fDUaYESpw8lK3nrNj0H5ftMY5+ndDQqls=;
  b=13C2vBeuvXSB+AaAQ7Nw8gh3DiME4rYy14qsIfzl+aoYd9Un4BAPEeg0
   yIZkKu02i6PYMCAQop6+gx1AbWugwUcOagKwNiJ96fc/6D2FBdNXDOf9r
   UqBG1i3H6y6VHptfMkpAuTyDT+onfyWXQtbOkV10qR45RiiNz4fXE5bxc
   MDEnRGTfZWM7F6onPH3SQvHfwiW/LixHVcuVmpK4ZkoG3kOqLUny1jXLN
   ytw+QW1WcNXNF1xAOLPZWlOC0lBf+A2U04LqqoPmvQwFW9w4elUM/n/FY
   7uHWwSVpkEqpQ0djK1llr4pnDOzueUFv5T3CpEUBSR+ND00fjNdGz7C3w
   A==;
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="228615786"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Aug 2023 04:27:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 8 Aug 2023 04:27:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 8 Aug 2023 04:27:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IO16hr0gIkdz8nAbmj/i1eDxEqZoYwvLhr2u8tnfKCHuvN/N7cqiartnczFhL7kKZG8QO8I+huC0TbIN9bxlJv1uVrCeYz0cMbHmMzs3buFifZE1BeTLv2kf2UIPVuR9mHaAGaPoYWuzF3YdjAaDt8nYa8faY/K1qhb4xvn5XCRiQpRJqoY2Qxa2UsxLD+THem4VavGA1YukKV8nMsXrcSDFdjJEjfy4J80xB58ziycnz09Pzx/sHwWr0+Gpc07ZtGH4AWFbO9e9zZGyG0YCz7rsL6pR6JksgNAJJNqRcJO4sWe48mm2dKlLSQOq5jssN/0xGFdKACdD34fyG9vOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1H4+MuRz91CKD3FvKB7VwB4PlyrAJRrqrt6GTVfc1U=;
 b=ftBp2Nz2sJQ4sesQJgoWYaHbilNlalcivxsZS7gEuM8x7L6chLLViXv7YayxcTRMXpvbSz+fFlyzpNdOKF+wFH2xgBKENjSBoMdaInLlhJd8Y+N4RVqg3tf8lBw7aIFBudDoIbiDqnS3mOt6O/VLXZoXMk7Y8f91cmQ6IhBj4UAi995oATD04B0aeI5EQQUueFJ7EVhTMVbrE4epC9Pk1phHk7H1y9sSNiLqz8m+wPASwt527mV20ZVwVYqqAe8XyM4BaTgX9ya+xS8Ym6me3pKRHdnNIVDkND3DRn/WsGUmT1qu6yECSxgdto2lH6Bu37R1zqplS/eP5jAVZ2WwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1H4+MuRz91CKD3FvKB7VwB4PlyrAJRrqrt6GTVfc1U=;
 b=t5zAGMTIL0cM2KdFL9rCzgAP6HBqx0uWembJxrFlUjQOVHA/Z58o5tMnuKHxB8PtzW3PutUyK8OG6VYVrh5GzP6eS2yB1nUii1++6Kq8cgxDrVVPn5nraF/ZtJ7zernNixRLVtCT0FIVBWqYEo1mvecZBQfuM0G/eU0u0rj6frg=
Received: from BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 by DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 11:27:21 +0000
Received: from BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::2990:6549:28ad:29e9]) by BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::2990:6549:28ad:29e9%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 11:27:21 +0000
From:   <Kumaravel.Thiagarajan@microchip.com>
To:     <yangyingliang@huawei.com>, <linux-gpio@vger.kernel.org>
CC:     <VaibhaavRam.TL@microchip.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>,
        <Tharunkumar.Pasumarthi@microchip.com>
Subject: RE: [PATCH -next] misc: microchip: pci1xxxx: fix return value in
 pci1xxxx_otp_eeprom_probe()
Thread-Topic: [PATCH -next] misc: microchip: pci1xxxx: fix return value in
 pci1xxxx_otp_eeprom_probe()
Thread-Index: AQHZydA+ShB0DkYRrEuJYIkRHd5DIa/gJumQ
Date:   Tue, 8 Aug 2023 11:27:21 +0000
Message-ID: <BN8PR11MB3668E54E417030C8761F610EE90DA@BN8PR11MB3668.namprd11.prod.outlook.com>
References: <20230808081024.2339862-1-yangyingliang@huawei.com>
In-Reply-To: <20230808081024.2339862-1-yangyingliang@huawei.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_|DM8PR11MB5686:EE_
x-ms-office365-filtering-correlation-id: 33e58e0f-28b7-49fd-32a5-08db98026e80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7gxhPNnSikvLiJaoenQ8I8NHAHhoMW2Q7Rp/eQDB+/cgAq/B/kMmjmcCHqZfJM1ifP2a+Z5XhCJ2UaKqVwYW2VeSoM7JjeWQAGui1YJF+fsWJxMOdlNn1oJ8LTvBLzNCb5Vc1hNs6/FT3o6htAWskKFETIkemb30hl378JQoCGt7XI+hEkcFxla6hhHjy4NWTQ18k7RqPl/IRU8hlgByPq76+qQeCz6+j7S3NcIPWRobP7lao5cA+XbXUlkitRQktXLORqpadW5SJgKLLtMyzp+IluqSfBtqBZ3BzDj5hwb0NpQLEfl42LKkqkSeofY7Sk4XhcVqDsTRHEDWATbASH304oL0qje8BotOvgLTqEZxm3p9oxxWDRU/OeKewH9LknZr/hbha7yNBNkaJTaEsvIOfWOTYZN6TATNyOkYs3YStxTOtcY7KIDMGtUVOtN2IWDM/IGKixZ+EmVavCVlgMZ86kAf7llMxIkrsod8ishCZm79VsJHG7GqICpAZr6sAdw2+giVi6klxhv0vk8p6J66R0yaEAtYHHVHtZxgpTxEdUuZQDQ29I2zjK7sYAwfK5V+Mt6Vs7Q8LSnCDVFwYdvkCEA0c+Wpb4pExZ0/V0gbhLeLRX/sePhLNIzD0sVe1hw5MENdzw6Nu73aMRPq1wOoyiZJv2dzexeC9UbNet/GoUQcxABVO6lAQL9v2x26
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3668.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(1800799003)(186006)(451199021)(478600001)(122000001)(38100700002)(86362001)(54906003)(110136005)(4326008)(66476007)(66446008)(76116006)(66946007)(316002)(64756008)(66556008)(9686003)(107886003)(53546011)(6506007)(26005)(71200400001)(7696005)(41300700001)(2906002)(83380400001)(55016003)(52536014)(5660300002)(8676002)(8936002)(38070700005)(33656002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k9ToTDYZZdFhO3MlT7Ij+s6ghjigvtjHgCk5Tq6iSDMjp2E4ZcYfhO/dEB/b?=
 =?us-ascii?Q?KCYwzqsf3J4W3kI9h92aXpGQDW7513KrtjRxta+N1rP7cVq9OX/QjCML7lSR?=
 =?us-ascii?Q?kEiZUp3fWKKUyVm/iBQ9VcM71+/Tcd/V5Y2+eP7W5Uu4QMSNVojxmMZtA3hV?=
 =?us-ascii?Q?Pj+lq82/NX4lYgeaHQHMOxncAKOrY100/sVK9FWCTXSOSEK5fBZmGFkOiZ8b?=
 =?us-ascii?Q?t77OF7fBElftJ/ZezbKTO+3Gd3qV6hntXlhNh2pSDxL3OzNhOwSx+R3aH+T6?=
 =?us-ascii?Q?+qMkObDdr/AHukv9h+lm4bKgcij1VpVBqND6nC/suzm/GlS238PzJgu2Od2K?=
 =?us-ascii?Q?EvTnn6b2b/H6TBlWOthcOR9j0MTQD/VG6GJW3HvUerudgW1H32sNsWbrNTFw?=
 =?us-ascii?Q?M9Q8Ive3tSJGCT6ZYNK+97GW8HvW94BRyBoscno9PntT7Ts99D8jG8x3TQvO?=
 =?us-ascii?Q?B7R5aw7wG7O/wtkZ8tThGY4sXDXrFEHmUJmTLhyHHQpOy9l9/Okc152UZ7Wx?=
 =?us-ascii?Q?POIiRItXJOXj5VNtXwprkn+lakITaIOsUyH5vnObPbu4OMXr5ruz/3i6ffrQ?=
 =?us-ascii?Q?ik9/m8wwlazR9Iy9PKx6wvmhckPnc21sFLhLNONOz1Ntk5bRgu048tkY9qxQ?=
 =?us-ascii?Q?YejpEEi89mOC3D79E4gbbf8MoFbLywB96ax1xuGiCBu1fLvvpqSHZ8ETCfFa?=
 =?us-ascii?Q?LUIQRxwM4YZSfRMsvyb8nNDWSDJoCPf8dsv+W4mEXvDbZrvPfC2NQzUICmI7?=
 =?us-ascii?Q?rHv6FM9QDNylGseTjyBG0fDSz2/y2W6uTl6m3GUghrvRYAkqIBzvORXlHlnY?=
 =?us-ascii?Q?H0t0LhyecS4L+PmTzKm47c4hXA/yjmOovxoTQGr51hVTCylkq7eBrhEF2fXb?=
 =?us-ascii?Q?UW0Mpnw7NsZYMaZx6GNCljdm28G/XttXc9xLhmwrZ5KLv1hbUrYe7SXID7NU?=
 =?us-ascii?Q?hImhFCSdhux43UYWMLb2q3vHAvHg+2u6HX0olH0Yd9wcGrRG3WxGN53C9QlJ?=
 =?us-ascii?Q?z11aJkCl55veZw+j6UFNrFGbmDe2hhZPb8Sbt+IOCTBiTDdCl6Ms6L3rt+8d?=
 =?us-ascii?Q?y7YhQYei0WtKujl374HWYfIcgRGxRiir2Afsujdai1Im7tgeUTv21moQNh9D?=
 =?us-ascii?Q?5MB5oAFr1mG5eQZ1asAf5WqT6gxIB1UQTifIc61dFHtsXjWHFe6QL63RwmpJ?=
 =?us-ascii?Q?3lMlmd44HZXrWLtsRVMN+bcuy+rgaxCY4vZlpeinV7McbVnjDblU0I89oaJS?=
 =?us-ascii?Q?S91qIP8N1le7Mcx/Hglh85USozpgQTPyi9xosl+EWW/GqdaUL19gS56+dZ2C?=
 =?us-ascii?Q?OsJHVlXgez/Ygy8eVWMpxaTCZKXSmNEEtY6aHOLGSGcewNGNDIcUDjp4Fm23?=
 =?us-ascii?Q?w6oXGLQPD8I2WqqH15N3cx7IUlPkBuycuqP9t5ufs84nn1h/73yidKoVBSUu?=
 =?us-ascii?Q?xiR/jMkzUtTY1W6WsN1ODyj3eDiitT8H/yQfz8G7OuK/qt4F8U3j+CVrkO/1?=
 =?us-ascii?Q?3b8lhFpc7RqcImBn6jwSGZP9yL7aZE65NoNNXHS/McjwpebOGlYu3Y5dTeN1?=
 =?us-ascii?Q?m0dKrzYJaMZ/ZLS+oJjWsXfUOM/ASTuvdctcggQp0em6dhZgLs5pQ3qfkJnf?=
 =?us-ascii?Q?kAR2TV3QVYOZGwqfniaKAxM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3668.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e58e0f-28b7-49fd-32a5-08db98026e80
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 11:27:21.3689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJRMyWmv9Yxj8eMoPQ+5/vXCTK5wkX2oIFMTXC6iQ3x5XkJdS927gXNIBww941o/FQad6+QJHoY+Rc74pQfupQU9TURi7iiCI2Ow7qYl+j9BcdLpV/LQrCBIFHldPCWR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5686
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Yang Yingliang <yangyingliang@huawei.com>
> Sent: Tuesday, August 8, 2023 1:40 PM
> To: linux-gpio@vger.kernel.org
>=20
> devm_nvmem_register() never returns NULL pointer, it will return
> ERR_PTR() when it fails, so replace the check with IS_ERR() and use PTR_E=
RR()
> as return code.
Is it even better to use PTR_ERR_OR_ZERO like below?
priv->nvmem_eeprom =3D devm_nvmem_register(&aux_dev->dev,
                                                         &priv->nvmem_confi=
g_eeprom);
return PTR_ERR_OR_ZERO(priv->nvmem_eeprom);

> Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and
> write into PCI1XXXX EEPROM via NVMEM sysfs")
> Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and
> write into PCI1XXXX OTP via NVMEM sysfs")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> index 3d3d1578119a..16695cb5e69c 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> @@ -379,8 +379,8 @@ static int pci1xxxx_otp_eeprom_probe(struct
> auxiliary_device *aux_dev,
>=20
>                 priv->nvmem_eeprom =3D devm_nvmem_register(&aux_dev->dev,
>                                                          &priv->nvmem_con=
fig_eeprom);
> -               if (!priv->nvmem_eeprom)
> -                       return -ENOMEM;
> +               if (IS_ERR(priv->nvmem_eeprom))
> +                       return PTR_ERR(priv->nvmem_eeprom);
>         }
>=20
>         release_sys_lock(priv);
> @@ -398,8 +398,8 @@ static int pci1xxxx_otp_eeprom_probe(struct
> auxiliary_device *aux_dev,
>=20
>         priv->nvmem_otp =3D devm_nvmem_register(&aux_dev->dev,
>                                               &priv->nvmem_config_otp);
> -       if (!priv->nvmem_otp)
> -               return -ENOMEM;
> +       if (IS_ERR(priv->nvmem_otp))
> +               return PTR_ERR(priv->nvmem_otp);
>=20
>         return ret;
>  }
> --
> 2.25.1

Thank You.

Regards,
Kumar


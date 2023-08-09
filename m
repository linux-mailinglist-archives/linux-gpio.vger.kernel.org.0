Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCA4775617
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Aug 2023 11:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjHIJFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Aug 2023 05:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjHIJFC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 05:05:02 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D57B1FCD
        for <linux-gpio@vger.kernel.org>; Wed,  9 Aug 2023 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691571900; x=1723107900;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hQFKzMc7A8MO17jbnGFUhHehJYTawJyqVDG+hJjQUSs=;
  b=BY8rga0r+qlKS4FNEQf2H6p5kkeky87tZM4uOrpzSkE3OvkpNgqMiOm9
   6pifqjcTWO9+ecfvDxGeWnT500s3ykle2VwEQJ6VodQlI+JNJEN+aD7hr
   FE0vzkMyAbbcbkVBIIokUNAv9Lq84/kuPsOY650KJkxqjVZM5FLcRxO3d
   U8E+QTlCDVc3oL4oa06HRnYktBp6C4WhDQe5Jaw+Mun6N3aTEZhpz0Mpu
   QQwcIBtzcoa68VNc8DICJ3UE6CtH3gsRsOUAzRCmohhRpDRrO++qW4HmE
   waEWAExPwsXPq69p3H5974Rqu3wDmFjm2dGI+Oz6XU+EQmuOz/mI2dxZL
   g==;
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="165596214"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2023 02:05:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 9 Aug 2023 02:05:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 9 Aug 2023 02:05:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDEOkoWP3vFQ7ayomLqWZKLx0aqtjtiY4YDnIom4FYdXS/rPLMSlk6LrTtq8IUK1HY3KwLwMY+nEKPMgjMNQBg+wN3bZ7g4kn/mXPUJciqcNLrKVYAdIdq3vVY4C6uW49GwTgwWj6y8h5PZEbRNCc4aOLUNAYdqj7YIXXavHijgWj2x/PU15fTpDW6px09wAiIiJNOFw/bfRhspUnHlJfysdxbYy09Wr0lgNZE+ZK1zn68PrpfZwogqSULgeGqhkToXpSAL3pyQIUMv95y9kyySFDCkFzy71P9YW+MK8XhqEr7t1UPaY1EABryT9e8nG++a7zmhnnUThjtxIMns/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyjwcMf/ZBvzNxWCG3w8mKAucX0XPXf13sTfphvh69s=;
 b=aKUR/LUm48Ypw7DCOOJHWcfmtnsn5U/VB/1D5uTMqxRqzDXE9htZexjcbpbnNzdHvzUWffEYyQnsAypkS8B20TK3abQPnEKTaF0yWgctqvYjh2JpN/BBeBeXsheT8ziWwzaeqmT0NDp4nmSLQaBozjNMwJdML2kgR+FWQiB8ELXGABTTXoL6PPdtCSYqIa380uRIZ9hjZd+/z0ci3hAAb6krBfsllF+ExwQaU1jrnGsjCffquDiudqVh2PT3pDJ/9SvRtAoIaTd7HNwBOBf+hAFQCPXWVUsWG58GUBiM5lFJ7cbNcpd60mn09LPs+FUWqHhrbSpISvMkECj99Hz7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyjwcMf/ZBvzNxWCG3w8mKAucX0XPXf13sTfphvh69s=;
 b=VD93GBWmkYQqQKzTjSsfzBkn0s95Lc0QEM8OrBZvw0r56xPrivP0ajHncvLAIkrsaePX9ilqmOjZqNaSfs+aTB+MJX0zjgxyc/802R0MEe/yxuNPrBYkvdC3q7aDAULmWnzcY7RWvjrUaUU0JfRUhXj7v7J8aNHcNVWgr3+ompY=
Received: from BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 09:04:57 +0000
Received: from BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::2990:6549:28ad:29e9]) by BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::2990:6549:28ad:29e9%7]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 09:04:57 +0000
From:   <Kumaravel.Thiagarajan@microchip.com>
To:     <yangyingliang@huawei.com>, <linux-gpio@vger.kernel.org>
CC:     <VaibhaavRam.TL@microchip.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>,
        <Tharunkumar.Pasumarthi@microchip.com>
Subject: RE: [PATCH -next v2] misc: microchip: pci1xxxx: fix return value in
 pci1xxxx_otp_eeprom_probe()
Thread-Topic: [PATCH -next v2] misc: microchip: pci1xxxx: fix return value in
 pci1xxxx_otp_eeprom_probe()
Thread-Index: AQHZyfPDSfvDDczChEqyTKZ0YogO9K/hrHuw
Date:   Wed, 9 Aug 2023 09:04:57 +0000
Message-ID: <BN8PR11MB36680A537B31D855212DC229E912A@BN8PR11MB3668.namprd11.prod.outlook.com>
References: <20230808122453.556632-1-yangyingliang@huawei.com>
In-Reply-To: <20230808122453.556632-1-yangyingliang@huawei.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_|PH7PR11MB6329:EE_
x-ms-office365-filtering-correlation-id: 0a4f30b2-4b8e-4125-d960-08db98b7b429
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ts17/elBrfDZnnrQmbmfk1H49+BmEH3Agev+jSCqDu1jlLAkCimFW1k7Fh+uAvCEE1BDwugM/NbndMNQJJyKsYvubFUJKsR+y9OKy9dTZGTg7DULNamrMtf5fzuQo4QArH2yZff3GICpS3Dr7QQXB21sI1vbXbuWonLTY9nXpjcR5rDh5sOaHly10MkSLED5zEMnPsT8FJLA7WYhiJkSoutAoinGGAi+TiYuYu4ZX8Qal0p62u9+4Eg/1A+pVjSOvbDSWCrV6tf2ZC8NyWRNK6yhVvupHh8JaS01mNeIMZKhflQglYBDd/HzZpRY0WVMguDs+54JN/qWDq5Nmrb9NF/cZw5wbUajkkjIiwGUPY6GAW9zb1yI2p00TLNiR2GgnxnHqtWQm7g9RlmKO7OQE63Pg7JGLGQ9p54uezmY8eryWupetVWKSAe3DfbTmTcFLab8EN6Oz19598AT+WWIAI06s3pWUE2681P0YBb+JvW/BryF4DoN/XuBEySwuZJVNbZOaHMlmhhxPJq8XuySQsMEXQfXrFoSBfCPu/jcaohQi+WbY3mfjMvYWLXVi3m+OeAK/Din71jok6BcfKcaK+CgMwxU+bYeBwgAzQTeiwhFqn1JbbgLuuvsWZNDNZ4YoCTatK1KfGJUVNS07BC2iY5J158a9eG/c3SvjNkXfE1K/aB7Hm1M2h/9zOEihF71
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3668.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(366004)(39860400002)(396003)(1800799006)(451199021)(186006)(7696005)(55016003)(71200400001)(9686003)(86362001)(33656002)(122000001)(478600001)(41300700001)(26005)(107886003)(6506007)(53546011)(8936002)(38070700005)(64756008)(5660300002)(66446008)(52536014)(8676002)(38100700002)(2906002)(110136005)(4326008)(66556008)(76116006)(66476007)(54906003)(66946007)(316002)(83380400001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JO4mcAhQXDO7tLNXmtrWFe5cBZDVD3rY0sG9sM7gvWqyPviFtvrEmF6PeOZM?=
 =?us-ascii?Q?vtBrV4/SL0MnnUnoZda2pnU8LnaaqlSxW8zk+PzGiM8fTAKlRUQZZlffmwkq?=
 =?us-ascii?Q?kU4l1U63lOPN4/PdWM+vj3rtuEon1SANFki0WP/xdWXpZvTWIypWpvX77c3U?=
 =?us-ascii?Q?zTxt/MxgEkaP7ThQPn/y244mtcU7XGIHojT+GWGyIrBiq/vE29EpsbdeGZwG?=
 =?us-ascii?Q?DnY8G9VM5O/U9zEuT4kS6imv904gywEnMEx5u12wO7NTK86O6UW3I5F+JU+3?=
 =?us-ascii?Q?xAH2Nf8bzGZ2AUzqOpzIoqBpkEfhIELiGPTvNnfleddUaz6uqG1L9g/CFOu2?=
 =?us-ascii?Q?6FJS1i8ZwYksAJgJYwPygxKxvqoQtuEaA2LUs2+i1e3rV8TdYBBVaLzmZyyh?=
 =?us-ascii?Q?3J/A+4I0VC5poYwu1a+QFljF1+2M7w1ZhGrnaylC5k9Bo3MjG5jdAajsPWn0?=
 =?us-ascii?Q?CDSbvPlbZUtFST3WMBySTuH0cwYLTMFOBvuCoh0z8uq5Yub3LOiLDv2GvCO6?=
 =?us-ascii?Q?a2mJx+yC1jfRGYR4Pre8d4G1x7r6mhlS07uKmK+JxO1hYV5JDbT1EdtSrUQx?=
 =?us-ascii?Q?2tQeIx7J+6+jASzZEcI8XsM0JTc3sgtCNQAU0kk/TiIYAXOPgMXaXUFCrXRg?=
 =?us-ascii?Q?/WPCbEK7e1WlP3YOASVu7T5JVUbzvFUNmgp7CPV6suoJjbGNyJdC7rkex77Y?=
 =?us-ascii?Q?cxjhtxEmGMIbsTL8ELJLmBGYBFEZlM2XBOPDnGQzc/aSYGTJ5la2nshYO7OQ?=
 =?us-ascii?Q?x5wH32SecS8zk7PI4bQuba5Wu/R+KgsPMcqUIKYXvG8gPIdWj36HbEMOrfOa?=
 =?us-ascii?Q?3LASHYfcUwMx9cYMGttiGW47SF0RoCoSM13STaDcnwi2hhdk/Tal9YSl9lin?=
 =?us-ascii?Q?FO56Iy++kB8vNvOYN7N8yRo0mt8zIPJHUMQPPXgJulY+3resK40rdkNqO2LH?=
 =?us-ascii?Q?sedLh8NB8qNGQ/P3XXCqes5yJKhJ9cSy5zRseQJPx3n61pI3kVbNiOTpBxiW?=
 =?us-ascii?Q?FdQxj1Hn+CmiQ+RY7iN9GVBqqtqAdprwIrBtns8nQCBJWptTAf6vFVEQsHVB?=
 =?us-ascii?Q?AGj80SbEr/MkuWDj8zGUYr+tgTSHpksGhimnGcFbB5D623fDxuQs5klnocgY?=
 =?us-ascii?Q?D1Pw6jmCxPP4uiJFMXN7fHEhGMAWGWsIdo7KFWMLomQlckpJP9hg2Jp1zgV2?=
 =?us-ascii?Q?L6M8tSqH0xW5PDlIVb0CYmdngg0Q8i+0O1L3Y2u5tRFOL+8aPXoiEC3L+6NR?=
 =?us-ascii?Q?aZ/tFw3Z13vJang7E/D0MqvjNQLmb+D7itLuKTNKpo3kILOp5zhuJoK7sOqE?=
 =?us-ascii?Q?NRAGrjnyTvoMuUo5nPKAqHAAilKUi/Ka78vXQon7mzDAg9rlZZoKadEg036P?=
 =?us-ascii?Q?tEzdPUje91S+USi3H0pceXd2Lel6I7QQx1XT4TBbc2BZxVymVbEyggSVfyyJ?=
 =?us-ascii?Q?fvcfnfEn7VZXpVkL1bDJf1wvxL3osdu27PIOdiArm5aYovSRrT2booQvcQ/z?=
 =?us-ascii?Q?HW+73dX4IDp0h/j1oUzJc5gkqUNDdMyj6BW6kJLUJxei8ZgAYBrFCoXXkJnv?=
 =?us-ascii?Q?WYtZFUgDKQTdeDdLmjrZLmHdZG9ZJwNBzOjgughnpXhelhFI/2pAgh47d3Jv?=
 =?us-ascii?Q?Ikmm/DOcVsIpepob523Yf6g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3668.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4f30b2-4b8e-4125-d960-08db98b7b429
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 09:04:57.1791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nGi7OjBQl/Y9Dgl/AMXrKlzevWUIf7VRHKrBkV+a4GWUWMqXxmG54SXoLzS7JSXcQ8LwH7d+ng3pHmaYMP8+Rk0ZTenIGn4vNxOr+TxSNXQoFZDv4+H9k2SZ1tWvUbdd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
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
> Sent: Tuesday, August 8, 2023 5:55 PM
> To: linux-gpio@vger.kernel.org
>=20
> devm_nvmem_register() never returns NULL pointer, it will return
> ERR_PTR() when it fails, so replace the check with IS_ERR() and use PTR_E=
RR()
> as return code.
>=20
> Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and
> write into PCI1XXXX EEPROM via NVMEM sysfs")
> Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and
> write into PCI1XXXX OTP via NVMEM sysfs")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>

> ---
> v1 -> v2:
>   Use PTR_ERR_OR_ZERO().
> ---
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> index 3d3d1578119a..1b5b61cdacde 100644
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
> @@ -398,10 +398,8 @@ static int pci1xxxx_otp_eeprom_probe(struct
> auxiliary_device *aux_dev,
>=20
>         priv->nvmem_otp =3D devm_nvmem_register(&aux_dev->dev,
>                                               &priv->nvmem_config_otp);
> -       if (!priv->nvmem_otp)
> -               return -ENOMEM;
>=20
> -       return ret;
> +       return PTR_ERR_OR_ZERO(priv->nvmem_otp);
>  }
>=20
>  static void pci1xxxx_otp_eeprom_remove(struct auxiliary_device *aux_dev)
> --
> 2.25.1


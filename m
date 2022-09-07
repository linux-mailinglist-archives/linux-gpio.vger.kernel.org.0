Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E75AF5B037D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 13:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiIGL4q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 07:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbiIGL4h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 07:56:37 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B748E8036C;
        Wed,  7 Sep 2022 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662551795; x=1694087795;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UtnZBbVutre/NWupPsYJ45QY7FvpEcDwUIvkn/RvjXg=;
  b=QSnmgSQOp2Cx5zu12bzz5xsZhAtVkpnKaBJjH9KEVFRbzpHSnEvXGoBF
   aANA82XNDk2sLgB4W0Jq6I84eOTHzXgGv6UogXWWVJpBaJf20ZQEaRS3q
   DSrHN0g5ROpkuZBkITy3eM88VhUHZU4/VN3vZznza0yb6VBgAy4luS3Um
   cNHFX4422PV164DQMTBFQdI3jKaMAT43BIiInFebQJHa6q5ukZ1+KUZUQ
   rAyNlHe9l6evx5kMUlnuPAvmo53+WlbL2pwsw43dfXGgZTCQ8c+SXiBir
   VrMlI5XAUeMM/6OgOGAWnuq6olcnoynpcHnWb5eZ8YM5aKk/QX9NJmbDT
   w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="179510295"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 04:56:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 04:56:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 7 Sep 2022 04:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bspc98aSJ1XwyS1+C2g9vA9L3ReYQSY0fH0flwA79nq/B3zVPNiajMcJqQ6PCMvrs3HdYUK91QlA+tuJXDeomlqmxDbsB5EcmM865DyNF5M9+IzxhLewguHOPD6rYiB9j51hHmCwjUo9zh1SaqY9AFnTvvvEJPAA8hTehRtIfrQVT1PHi2LGH45+QNZ7e7FjjRe8RzyuRZJ578LiMwO791qyyoTbjIVE82xeK0qu7N3+A5oynGjysT57taK7vpcoS1soxVumyQSVePVRcDrTZ7Iz9YxxXN6y52HOF5fq7DDc8Byi6wtF+cvlcEPkKYQh4oMHwegd9+5tvTcDD1ALsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiRiIAyCr/UXvaq71q/zG8BzkbEiP/3aa0FvJUlj7G8=;
 b=Xmnd1i49YUkVdAmtb2ktIMY7AGdzINcvozbj7oL5hcUILAvijmtKbtm8Z77068FPqcM3C/39PJbpiWuzaclCMzxueEze9NrrX7/GhLwGXVEB/mtwIN8+BjORDQwR+onwoAqbCnU/r1mdYOU4KJB6YzlwBDai+IRyGwAJ5MpOegpkulvSDjyeMWs7T9ArIVRaJJ5nAPTfHoqGfSQveFRZdwZg/R9AzTsgJEQrMHc+FoY/K9hL6meFkIN8VLnLfqzpNSvc4nnAP/7+0h7kNE+ALpMypIreoRvQ2jnzcnplWcTRshDR2SjaZyOMU81dRwwlqMZaYYDv9ZLYbNFnRDJ8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiRiIAyCr/UXvaq71q/zG8BzkbEiP/3aa0FvJUlj7G8=;
 b=h35ESLSv8igDQsch5DQEUAjzACZseZq9kqp2sgzd/H9YU/4Pvjx1fQM3VYUXCtiKbR6iFjncRACw9sHzZnOvmC8eVDYD+y3jMBRHxyrNsiKTEt2FwfB0U2L89nFW8LI36LFFCnAY15qdNLY1otv0zwMsJLJkdM9WHLTq28Z3Uo8=
Received: from BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 by BN6PR11MB4051.namprd11.prod.outlook.com (2603:10b6:405:79::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Wed, 7 Sep
 2022 11:56:31 +0000
Received: from BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780]) by BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780%4]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 11:56:31 +0000
From:   <Kumaravel.Thiagarajan@microchip.com>
To:     <weiyongjun@huaweicloud.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC:     <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH -next 1/5] misc: microchip: pci1xxxx: fix error handling
 in gp_aux_bus_probe()
Thread-Topic: [PATCH -next 1/5] misc: microchip: pci1xxxx: fix error handling
 in gp_aux_bus_probe()
Thread-Index: AQHYwpJHEkFHO5qxYU+wVNkqCE0Ql63T0SWA
Date:   Wed, 7 Sep 2022 11:56:31 +0000
Message-ID: <BN8PR11MB3668DC710EB452EE85E37F95E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
References: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
In-Reply-To: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_|BN6PR11MB4051:EE_
x-ms-office365-filtering-correlation-id: deec5af7-671a-44af-aeb1-08da90c80131
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3sNc4ngM0NPTCZ5zc7F1Xhc7KWAnb96f1Mdhz0sJH0etWljseGnf3VsKW9++lbVlyoK1plWXS+zjBlU8cGTtXMwMA03fbVBKRaIqnJvwTSHbR9xMlWMQQz2OPfSZw2b3yrct4BhxqEFypiyO7ZwDj+MzM+HiU1blL/3RgYh2nQBmZQR43vfsb9lsk6xGaB9zoAsQgF94/7QS1tJAg7ZftqFOeYog4STj+t4I3OyPGccNJQKqEISMwbwdG79VzP5s0oNkEMsNGXR96qfX659R4QoylR/UFhbZQD9VOKx+YROanBpxg0TVYQklYLot2xBme5TRsTI3a8Sh44porqxr5GuytvwMemVHBPoh0EyVeleazzhJ3kZV/DfdDQ2irCV5y1V9vpDv6XLYSe1cf57WNDnE8naE5UBMnwkWKioLvWrj/5ExLch9F6cYYQ95b5hvirSKnVoAS05xJvO/ZHKxIRM7O+2ixl+OLQpuXm5s/aqMAStDBVBfyW13bgcLnxeIqf4kSdikdPIGKSqx4MecO2lSr/f1yRIkQhRk6SHie6nH/Jz4RpUqWj0hu0Lp2825GmuGiIkPLr+5wvXySIG/dOknZ6pxmYhcuLtqparFngvCYeUWm30fQrntzVf0r/5HlBaTkIiFuPy1K+q+VPOtdBqDhgizS1D/xyL6jmxj8yQFZITuc15IndNPWA0P8q/NuDi91E68zXDaZNOCwORJtxeAJ6XdFGavHN3R4xbzLWtjCpd2uSspf+XKDPmWNGV4pNmgYaCifztwwoAuuHnp1V/vggJHOZcthZIZQ4gpjoZHmmS8+9YSgocxf/Lwr3l+ld88IgDxRODXhk+ddWbgew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3668.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(366004)(376002)(396003)(71200400001)(41300700001)(6506007)(53546011)(26005)(4326008)(9686003)(8936002)(52536014)(83380400001)(186003)(55016003)(64756008)(8676002)(7696005)(5660300002)(54906003)(2906002)(66446008)(478600001)(66476007)(66946007)(66556008)(316002)(110136005)(86362001)(76116006)(38100700002)(38070700005)(33656002)(122000001)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pCCZ/L+o0HFOgoIaQj7UUHDTCUJxxM63mzNNRBcCaCTfg9wvF8U9DXcneNbm?=
 =?us-ascii?Q?CRop6TxuLNl95KOTs89OIlrCHbsssJiGBMupkwY/jvQrOeJ0Ru1NkFlTPoFa?=
 =?us-ascii?Q?xt3mQSaSESkR0kVK/adqMZ6vW/rKGBWMLX1ygg4ghthQgesycy8D65yYbNuI?=
 =?us-ascii?Q?4bdaN/83/YfskJ5l4O+lNo7kRdNiXSKgP6PYHest+5aqpdfeiXU4leZe9Feb?=
 =?us-ascii?Q?XeKxQEBpPOLCxZRHT49yxmIE0Lu8pYTRmNcNLCiCN9GJgc1ieaG1iLua0yar?=
 =?us-ascii?Q?3EMsDHuKROFtin9A0bCWrmjshNDFqgWsvuzmJmRcwnE9YatcP1Ct1grptAVC?=
 =?us-ascii?Q?cLCI564IZVd+0riluPkhkr/sMkBsa1JRD7ZkgLn6SMtD4iHfvqLGunjKPTlN?=
 =?us-ascii?Q?oxDXEcAJlkNu+pOch8abIIex62bzalD9XHpMwGFeS2VZX/8VQo1O/peh53s7?=
 =?us-ascii?Q?9pvnCu05MzVOUbjpozRQrl8cGcIs5b0dATvwDkYnTZURd3kKQbSAUFWy9jdj?=
 =?us-ascii?Q?b6ctoj3ucghq1k/5xEbrQrxywbOn8h8t6qZAK7eo4jkgdtzntpx+h/t9D0uU?=
 =?us-ascii?Q?bsgTUSMa7uPpsXovLo+12LUR13RrG8j6iaSVadwRy5Kpnkce0zAgM/IfoWgS?=
 =?us-ascii?Q?rRl8dvHgVRVQR0ZDHCMEPPOCg2onjqEKwV5+b83XL+OVEM9QQRsg/2HnxrXX?=
 =?us-ascii?Q?XZjwGZ41fp6752jXIf2IVByK9oBJmFkWuEoXlkOav58KcNXeqJlCowtvHacN?=
 =?us-ascii?Q?xESd46J7anWk2rqT5NeaVo4DxLUHIoYEU+CGxm3aQ9e3dF3NQ5oy7kRiIBGo?=
 =?us-ascii?Q?UriqW+NgIbWbJQRwLBRreh5bVoLkbrILRpj7dQCsrp+KSM9D6Jv6kXkmzEJn?=
 =?us-ascii?Q?u+2PM6Gq9z20agBTNW0E7zkdj+/frDPEhz2Gi9eEE16LpMn0ol7l4oqi4KQo?=
 =?us-ascii?Q?v7bgE6dUzhUzTDUm1lN+wadyb9joENtGzATp9HKHgJPjsls53Zbu/ytxtgnF?=
 =?us-ascii?Q?/ocnFQReQ5K6z0cAh7RCMId9toamoGwiMn23/TB7z/AC1U7Uq3tUutNqCtx6?=
 =?us-ascii?Q?sLorxgZlLjrWdzPZeazJvPHjehWVRRnaFZwSUqStvVVUsyUWN3BGxhfLSfvq?=
 =?us-ascii?Q?L8hsc+OtlQhXibliYH1bSkzF0smau7c8q0Eou8DD7I1vlTc+pyL6LjZljfL8?=
 =?us-ascii?Q?fQhL6937RYYLLkXvHpTP//vSlPPJA426OtYZ4bEJ8Rds3amrI/gWSgp22/hx?=
 =?us-ascii?Q?UU1PB4Mh+tJWBFz5vERJVp6h69Bx2IA0VfXrafz4sAA2lU/+wcBrUjc+57p/?=
 =?us-ascii?Q?Phi7Ppckv3397Dp6i8BL95RRU0mkyYPVIV1UoS6YYYAkGixjF1rvdSNa2TDt?=
 =?us-ascii?Q?zlv0BOeIJz7qZzA6ZsxrkDZ4Qq27TVeblINppugDJD9BJgOGounZjjT8OqbL?=
 =?us-ascii?Q?NcefS2y/DCjTrRhbcEF41N3tZiLOOj8H1mDJBW4y44uFtosQKVVbtEHd0X8R?=
 =?us-ascii?Q?2pkuay1IbvMM9rdhJqTyLE9OQcUOTj4ZUb5oLOsr5K9PNnIlHMa+YjDONY+Z?=
 =?us-ascii?Q?MSA0WPtJtqDz92fIhXeFaLAZcXz7wFcii78XqvOXi8LJnASHJ0j9ycix60ji?=
 =?us-ascii?Q?xXYQEWEYaW21syN/QO5/fFk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3668.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deec5af7-671a-44af-aeb1-08da90c80131
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 11:56:31.3769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cqkYaKOS0ib1qxSEcd2wHXOqvOSeWKO3J18AOja6pV5/w48O5N/0NVIT2gjTwAGXlk4dQa1Dpo8e5n+g6Wp+5d/mOXAAgF4P7YpiFHy0uu8lbQq7M76ha/YhmsO0ibbf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4051
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Wei Yongjun <weiyongjun@huaweicloud.com>
> Sent: Wednesday, September 7, 2022 2:05 PM
> To: Kumaravel Thiagarajan - I21417
> <Kumaravel.Thiagarajan@microchip.com>; Arnd Bergmann
> <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-gpio@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH -next 1/5] misc: microchip: pci1xxxx: fix error handling =
in
> gp_aux_bus_probe()
>=20
>=20
> From: Wei Yongjun <weiyongjun1@huawei.com>
>=20
> In some error handling path, resoures alloced may not released.
> This patch fix them.
Thanks for your patch. But I have a minor correction below. Please review.
>=20
Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver =
for the PIO function in the multi-function endpoint of pci1xxxx device.")?
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> index bfc03028b34d..11f79f239006 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> @@ -87,12 +87,13 @@ static int gp_aux_bus_probe(struct pci_dev *pdev,
> const struct pci_device_id *id
>         retval =3D pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
>=20
>         if (retval < 0)
> -               return retval;
> +               goto err_ida_alloc_1;
By the time the execution reaches here, second ida_alloc (ida_alloc_1) is s=
uccessful.
It must go to err_aux_dev_init_1 too.

Thank You.

Regards,
Kumaravel

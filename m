Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2805B050A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 15:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiIGNUX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 09:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIGNUW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 09:20:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156AD46224;
        Wed,  7 Sep 2022 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662556808; x=1694092808;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HFJ4SA4xgPcg5epznrCJb/ALcb0VafSPoewdh8mVlOc=;
  b=H2STcrZk5iDs+Tp4GO0m08UDiRXQ9q8CQPGuc3PkliLZ5bBU148/dtMW
   Xi4ce3OdSoCkAtm0qctuZfQdIalyzjGP9LQB6UlWAT+6UaHnSL9CSHVKo
   Q1diUvH9hcR+Me6giUcAH2jdGxHud7+kQu8MiCPGt3iO64IhMpammG/9b
   Rls6X3sJNYw8Rps5ONqdwxNHOv5Q9Zty78ldAUpIvcVlhjvVnqXuv6ohs
   ZCmkcdtdfT/JjOIIA4HQSoKVQeev9lO2AR8ZMvTJxj9FSckVHsZwLTuQf
   9vCqthJ1xzBKeRXIyHU33t8J4aj+kDTj3fLqYGHtaO+WQpZ4vmNsj8jYR
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="179406150"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 06:20:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 06:20:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 06:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bhkm+U4rHMUWOmCiEQ4+tII+0Dy+2x1lgRApF4xJAkpDnaAOmbA/fYxY+246voXxBWYO+GDyxvhuFi7VUIhIkAH3vkXLRNxoVIrhhpnqX7GTvw5o5TllP5nqjgCAGKNLSpUSJ9lKPNjBl3QA+1nQ9V9p/oZpi5tL3MpsMgElTu32GM2OvQzxm+5EAOMN27YGAOYTFT/xEFabzLOwgZwFo/TObuAEl1IS66+l3B7rwmwhLNobEj6qnIzoGphsR04AbirtkxywHwZ5O8S3gfPUP4eCXYFN0RL3aVujhx4U4UWq2PfynL0/tGvkVGax3XtMu0Y2C+NzoqQ4la+JQyTbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASp/ICzZpRKi2QTaJP84jzUopIo9TlrGtmXsPjTAl0A=;
 b=oYhxYQk92Tjrs//ep93WhYLJx6gig+/SvTBVYaDoJLper3vBdtjTqVLtZVF4J2k8u/nxfLrSZYbiMYksMtSx7CxW17Dk2RiJVVU5TJ8ey9bpFpYiRkUoDgJguO424lQOkoRAGPGk40owF9q56sFUg0Ax8OQyKvfT/nT0juDWvujvrkVxSY0wVCmvQpuNHFM68Oslww+zh52of30ZhdM1GEFyf7VWTX3M1MkjI0C/aTK426Q3W947cyF31/ZNTqN9Gi38te92iMz0hOYt53nGuJOx1dwAlYHap7ORc7b8/cS4t6V3JCcAQfc5/JxHafwDue1Dh9fzPcTfBqG8lODJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASp/ICzZpRKi2QTaJP84jzUopIo9TlrGtmXsPjTAl0A=;
 b=sO9IKx8fgk2i0iYQdqTmcyadtDI1xuiTWeLM37OXDrrdKg3waR7iNkKba7q1WIf2bBOyaBX1HPgrx4HRKBDTZHUCiGJ1HTe1++m/SHVwlrgUUo9IbpkLOT1r02T2ndVN2enD5wdAq9EY57dyDDku94HNdirHcp+PD07miBANeZA=
Received: from BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 by DM6PR11MB2810.namprd11.prod.outlook.com (2603:10b6:5:ce::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Wed, 7 Sep
 2022 13:19:51 +0000
Received: from BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780]) by BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780%4]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 13:19:51 +0000
From:   <Kumaravel.Thiagarajan@microchip.com>
To:     <weiyongjun@huaweicloud.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC:     <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH -next 3/5] misc: microchip: pci1xxxx: Make symbol
 'pci1xxxx_gpio_auxiliary_id_table' static
Thread-Topic: [PATCH -next 3/5] misc: microchip: pci1xxxx: Make symbol
 'pci1xxxx_gpio_auxiliary_id_table' static
Thread-Index: AQHYwpJEXdjy0ZSZbk6/E+00JzR2gq3T8YnQ
Date:   Wed, 7 Sep 2022 13:19:51 +0000
Message-ID: <BN8PR11MB36680297F2FBD3F3908B115FE9419@BN8PR11MB3668.namprd11.prod.outlook.com>
References: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
 <20220907083435.1745393-3-weiyongjun@huaweicloud.com>
In-Reply-To: <20220907083435.1745393-3-weiyongjun@huaweicloud.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_|DM6PR11MB2810:EE_
x-ms-office365-filtering-correlation-id: 9e6205e5-0acd-417e-becd-08da90d3a56b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RMy6HjgA9yG+U/N3XQSosAuRPB0FdkTgoGyR9RA5wmobwk1uFtraiwrjAMUsVFmsBAgdlH0cHbndV5dovuf4TEdG4QHhcAA4kiXlv+HaZd3udg8mLxJqJHlyijCm4a1E28VUHzI5KkSq9UrePVeXCayLTT+pWHaCtq1jvksgRSw+c1KSnwvlT+/B1n8vBxNd+1rBIopMlP7iA0qAiGRAuJpI4Ju7AJ78w7e7Vd4SXFoOYXuTXtOkN0XnYkUa9Ce9tiuTkH/tCYvQOd74WUaL0A2DCrPeJE4FrQT3asnaIFaUEcpLY/OzJXApWq/Q5P8mBwE2CzVzlaoI+pQ/YtAMkTsoWI0dV732IKi2aym737HtTr+6cwYDUK8s3AkPp5NcVOUfzXLuX+KHe/NoNfU8qTa9OfHcTi0pjFrBIc9zBA13zqRoVeCwJZu7ILBDVd29aZPA06lw9k5snR2UBIYhTUx+ewj8wgBZjwbQ701dQ8qalofwCmutay2oRLYMFWXErKqmzLFuejVEToXIWcIyV7uAAszovxJ6cG9kxVdLlVMQrCwxviNyq3Am7Kw6LtYiq1oUJWtj50TimvV7Hbg1XHvysen4Oi8RIqRkhMDM+UDEokitu02CStnKiRk8fZtf3dKHcTeU10XVx64zH33qnCznHi5sDWO9rFaQX6Spgq70qODfzeL1vf4bKaBO8Mk7LXzI8w4JlF28H/pgiX0usmsaZZ0xl2IfGKEqw8Jatu0oaX6tiknI3qAE7mn0T9Jdbe2qzFbnzYLoDZLKHVfx/VAkazVK6c+hxZrUBYEHCMMxx7dbdWhXqvn3L/ABzkYJIyOJSTF5yOFQM0ZhLnau6sz97udhjmYNjLR/bXUdpXA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3668.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(136003)(366004)(396003)(110136005)(76116006)(66476007)(66446008)(2906002)(33656002)(64756008)(66556008)(4326008)(66946007)(52536014)(8676002)(83380400001)(122000001)(8936002)(4744005)(5660300002)(38100700002)(38070700005)(316002)(54906003)(41300700001)(478600001)(55016003)(71200400001)(53546011)(6506007)(7696005)(26005)(9686003)(86362001)(186003)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5/kT8k71KMnH/Eyzj47egAxAu5rqQA48hcoLRy3X0bB45TmQdeNK9UOH8Rzp?=
 =?us-ascii?Q?yH3NFn4YYz62jEchJdFs1YUn7roi/W261HOxYRUtERqe5djCscZN5gfnc9Vp?=
 =?us-ascii?Q?mlf9wK9jEv5wKI7YeGk92wy4tStv/GHa8xjT7t6YT+aWqeupHmgC7VcrU/es?=
 =?us-ascii?Q?fcMM+BZGcnRx7DejP69h5/IKz/pAmb7jrqbr4i6s81if6QSAMwwaIHZIpUa/?=
 =?us-ascii?Q?vmACotj6EEt7o7FkTzpB1vp6UrPrhrqoKsloiFaoCyVfXEBMaid5Q0em+uCf?=
 =?us-ascii?Q?ZmRpC35ZDV0bkV8i41A4lZGYLDOHCxo5yL/UAKYMcVdDLHzf4SWHVSJ+Kwre?=
 =?us-ascii?Q?3nUo/GAoCQpqwk0vtMc8Nwm2de8DH1aF0Db/eFArzTFKlHWlZCPEnSO+aH2t?=
 =?us-ascii?Q?MoqRFTbTAYQlt/p/9Qc72PvN5WnyeEJfD5c90tGcyIGz8vJBMGEcZ3CjAVDR?=
 =?us-ascii?Q?jPPsCS8lLxuRNAW4VydPXLqEevWvCu9NAUry2tNvWbcgqgMo2xumNVxQ9wua?=
 =?us-ascii?Q?P6pp0FAAVdjylMRYdwLFh+GvYBxh7SB+xErnBr2xrJDpW/5YOfrj1GLBsTC6?=
 =?us-ascii?Q?LcFrywXPxrRV2DlFt7FdIycIciWir3iQ3KBbRT/IRgRR/mxKzheRs8nHKVH2?=
 =?us-ascii?Q?BFBzgsDcEtRLflVbzpq7zcETmOQzZHd5W9U3/0tiJl8Aoo0oLfh+9zE43Vaz?=
 =?us-ascii?Q?qUKf7WTzC+2cqiHxvRnRLSZd6IqD0xc+yFe0WcAME7xe+Weptt8Fa7D3N4IX?=
 =?us-ascii?Q?MMxoRQz9AcreKrIumLidtL2a+T1pwTuViDbsHekFGGESv6ZW3pXpwNGBVTyR?=
 =?us-ascii?Q?s4IXHV2Zp/sK7ObBSiIJ3rF1I+v72yisKZLLYkmpr44ixhgiRG7diOlrK1Of?=
 =?us-ascii?Q?QekxixSKJtuD0UU6NLHQCJzHE2c1/TEt/PW9+SGJW9uhVZjxCwdmcZPjGx5L?=
 =?us-ascii?Q?vDk6h+EgEdiu/DCTHI3gMRZrYJgXevBH1dh/pLddG+soLui2chcV+mCbfbql?=
 =?us-ascii?Q?JaVJmotxTnrykgDjkt0v/U24qlUwOZxkNHSm10r2wSpntpxy/OJtpOgnOsDE?=
 =?us-ascii?Q?R2MPyz1nsJDwR7px+ApceS9K5M4Eh4YehrFQhTUyQHavX3ZKeiaom6OUnrvw?=
 =?us-ascii?Q?9DKl4mAXRVKQAcvbPGOsfw4E+m+p2eEPP5CNRQWa7aVPMxm89TjWMYOAjdCH?=
 =?us-ascii?Q?OjtlW58d+n0WmCMDIl3/RZK9NT6xCBvAum+0q+85hjOkvHor8vSR5cZ6u+Jh?=
 =?us-ascii?Q?AJSYDajsvhZvaSXtwIbQRygZUjagHlroDlzGBA7L+Lc1J4/WA5uo+TEsRzCM?=
 =?us-ascii?Q?HFUEaGWACp5ES13Fqp0V6bMT352s6bnI5UpBLDzGT5YRJj6U5mcWU3n/NRXC?=
 =?us-ascii?Q?oXn81MGQdArCb5nCum2qm/BIUk1otq8N5TBI2WrI00qUH2+vVeKKZK+0ordw?=
 =?us-ascii?Q?xxZ9oJp7SrKdkWsh3LJ8xbKcssy3r56n+YH787uzNIbQFNg912e/CiotPKxC?=
 =?us-ascii?Q?S2XCNWz7C5UrILIbcUywboEVgDZBr28SnOPM4Cy8TyvF+rIkqnWKFFydV65b?=
 =?us-ascii?Q?w1Buz6dTbnCV5pbDMUeMchjWDcf+97xmd6SPihfEgJnGYykm0z8B0pBzRwgz?=
 =?us-ascii?Q?J0swmyV9M0lb7xqfkiHvFMY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3668.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6205e5-0acd-417e-becd-08da90d3a56b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 13:19:51.3835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b02C3/hQHB7NI00FrPVSB673OiaDMANUY8vVcnRILfPbtmeNZbzv4db7NsQYLH2RbU20hLQTecK+Tpk2mr+2rlIca7BfoYZnnQGXfRHhjsFgkdwdyTxLuTmV5oySyjRS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2810
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
> Subject: [PATCH -next 3/5] misc: microchip: pci1xxxx: Make symbol
> 'pci1xxxx_gpio_auxiliary_id_table' static
>=20
>=20
> From: Wei Yongjun <weiyongjun1@huawei.com>
>=20
> The sparse tool complains as follows:
>=20
> drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c:409:34: warning:
>  symbol 'pci1xxxx_gpio_auxiliary_id_table' was not declared. Should it be
> static?
>=20
> This symbol is not used outside of mchp_pci1xxxx_gpio.c, so marks it stat=
ic.
Yes. This was first reported to me by "kernel test robot <lkp@intel.com>".
Thanks for your patch.
>=20
Add this tag -> Fixes: 7d3e4d807df2 ("misc: microchip: pci1xxxx: load gpio =
driver for the gpio controller auxiliary device enumerated by the auxiliary=
 bus driver.")?
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Thank You.

Regards,
Kumaravel

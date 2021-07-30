Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5560F3DB78F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 13:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238486AbhG3LGM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 07:06:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:24502 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238403AbhG3LGJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 07:06:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="213109311"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="213109311"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 04:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="457139493"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 30 Jul 2021 04:06:02 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 04:06:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 30 Jul 2021 04:06:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 30 Jul 2021 04:06:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaNVWrewidl/g0KjBHqmuWdaW2dY8h5TMBbZ8p6aAg4lT3va0ZQzq1zfzjknB6x0OH8iJApNACvm2KGakKxsu1bElRbo/OzS3imOD8ocFLmVVMiFkERWSV2hW6qHF23SR0CX/EP0NXRVRudGPQlTFXGOzy5Em8KtLfePbdHM9cxrHP5iYQ1BLGF/qROE1JojifJXP1IB3zJgOmdvOyjcMMWkuuAntiOL7tay/KLW+9VKF0pn/jWDMSo4LCYbXESq8Xl7z0rdoqZ8ge+gUDrDfCms4+R2JictIUnbfJfUvxKOXG7kDVFStMYY5HKR3A/gZ9Q3btzfKNqkp2lsu42HMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88LEd01kQp34CWv4NINek3+cpm8I+y00S9YvaJhGO8A=;
 b=Hn+hh6SxuDFIZV4x08boPBAPMEzzJ0dyE5YdH8ZC5yB5eND1VW1zdhnGzfDUE2cAPHee8TYh/CsBFBZEqNLcl46Iq/8tMk7z6TmRMjr/EyuGLFuOdcEx5hNgzfvwERUIFnUdcnvwAUrCCL6uAtmnLJJGFPqYFjFKKbSNAOvU6SEryf9ztip/mnOCxlYhvigIzl1iElzUPOAKYmTzkjn5efzuh2bGEZ0GtEIZR9o+jpnz3Qy4vz/pvuxuc/DMpV3YlMMsP7MBYKIvhLqV4EIhuqmungFZPp5wRJVKsfqwq5rMhAhN4yoCH5Ym4fLfV7rVWa5s3/nR+okWnkBSyOtzZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88LEd01kQp34CWv4NINek3+cpm8I+y00S9YvaJhGO8A=;
 b=XBAf1G7PDY+MuD7KdQV70MQbj0QvPhrNL7adhe/aI5iuFIAtMqFWc7BCk8ZprGux54r2wMyVunIOri+qSjwwGr+jSbT8Pbx+Cububf6x3QgdvNxrF6rmqmjehTVXpLo8SNMywxrcC0s5jLub0EHN1PvBVVXqOBXuGPKO8NBTKz4=
Received: from BL3PR11MB5699.namprd11.prod.outlook.com (2603:10b6:208:33e::8)
 by BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 11:06:00 +0000
Received: from BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::9950:3753:eee3:bf4e]) by BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::9950:3753:eee3:bf4e%4]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 11:06:00 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: pinctrl: Add bindings for Intel
 Keembay pinctrl driver
Thread-Topic: [PATCH v3 1/2] dt-bindings: pinctrl: Add bindings for Intel
 Keembay pinctrl driver
Thread-Index: AQHXel+Bl5y6zneS+UGWYbYPo1O6r6tbUgCAgAAXeIA=
Date:   Fri, 30 Jul 2021 11:06:00 +0000
Message-ID: <BL3PR11MB569935231C507843CBE0370EC4EC9@BL3PR11MB5699.namprd11.prod.outlook.com>
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com>
 <20210716162724.26047-2-lakshmi.sowjanya.d@intel.com>
 <CACRpkdZJaoQEJsAqrrAxWcpgx6J0OGoc_CkP0kUdNe-RPkRvqA@mail.gmail.com>
In-Reply-To: <CACRpkdZJaoQEJsAqrrAxWcpgx6J0OGoc_CkP0kUdNe-RPkRvqA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66b8b43e-d139-47ec-cbdd-08d9534a03a7
x-ms-traffictypediagnostic: BL1PR11MB5478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR11MB5478E431D00FFE84A35C1721C4EC9@BL1PR11MB5478.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: em+C0Kv+jUCIxGJZW9ZfJw7hIpR6pyAEMtFweUeqETrnmdH93Vy8pcndDGyY8PsCY/zl9dXWElPxRuetswNe93QXd+yjR9d2i3OeCzOVAFQIpM8PzxD6YB2E03NBvASwGAFA6OaBFLWwzRI5hWbLjrQEZSoTTqckhtZPgAjF6gu/tqGfaPsY9/LYLyWmOSKFii2qRGESOq5kckT0NDIXqkzWjlAkoCm0ZK1pRzwTjP9Hb1nKzq0gdqOXugv/2Hn2T261/RYMKCLGF2pGu+lImAbmhr0TC5ftSge4nnuBKveXCHh3mZg3dHDz2QjFYdl0y6alhg7PF2P7z/AQW9dP/7feuAz90rMOyR2SPQO+y5eo8LrraAL1hqFjdoL96lMPRY5UFYurHuT1LAF2kzAxqCnTLUtzbDFnCkX+geTaub1+SBZCNnd0wpNS0+ZnnCbXMPmm2Fwa6lSfg3cyMAsB9Bj2Xr75VmaD8z7644F6RjOfq2VZQsIU5rXAACn1TUMNMhFdxbiWEMZQCPQI88UO9uw5NP/40of3QL7X8b0aFrSNn1U57rUKaTpffOgVYfvM4pdqHKD3XSAQvY/oZGEspvouJ/lSlfoq+MMnHK+cLUOQVlEEiwRQYyxxGPuVAh7ou/YD04n+ZtuzXHbeOiuR0gE8w9SJ5ZvMf2PmdDr/0IOCR6xgxrhSvoMe+jSIIF3XB29b+gzBRcFfdA2gR8uhJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB5699.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(316002)(66446008)(9686003)(66476007)(66556008)(55016002)(66946007)(64756008)(83380400001)(52536014)(54906003)(33656002)(6506007)(38070700005)(53546011)(7696005)(8936002)(2906002)(186003)(76116006)(478600001)(122000001)(86362001)(6916009)(38100700002)(5660300002)(8676002)(71200400001)(4326008)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jJuq91cxueIAPSb9qVPuRrimQwoFNKVvXYR8h4sEUZMxZK/Y3Wy7hZvRdvvA?=
 =?us-ascii?Q?gt3P/vwZqQfZu6Vqz6QvDtaJ25oftTzX8hM2EO+bWbd8IdlIKFx3TVRUOTnM?=
 =?us-ascii?Q?oXVNc0J5o1iyNCuhxrJfazAYW3aCJSTH1cCTYw8U0b6+z1b6tYQymiaTOevq?=
 =?us-ascii?Q?s1r2y6960C2BVRcD6w/BnSgDjA1EGryznnexSckwghtib0NHS1XoeQ2si0lo?=
 =?us-ascii?Q?XRGQQfP/pVIR3cqRIiJRGEGSpcW8K4Y74HwZWtUaRdQuaq5AqQUzWFCdAv0Q?=
 =?us-ascii?Q?rubOHiKePe2VeY9hTz5W9LAS7BtWdFKDoErZj7aqKwPitI8/YjjMyQ3zNK8R?=
 =?us-ascii?Q?S9+3Kxnvl77LmiAj6krA5RkE8ZVPlhp/3/SaABqGTHui6pvLUPgY1c+beSc2?=
 =?us-ascii?Q?bgXCZzhj1q9EuN3VBJUUX6v7q1Gp0T0BcpL2Qud0DRArO/pOWyH6MHL1sb04?=
 =?us-ascii?Q?TBftQ0/aoeCBtdCOYzMp5rsaLLBXbVFRtK0jVIXAeTqzlbZItLie+xMknaUB?=
 =?us-ascii?Q?zx+FW1io7c0iQroVUkGz+8rG94+gMP/g6mm+RKyZLU/NtfcgMNA83c74FCDm?=
 =?us-ascii?Q?isAncQPcvnpuKh48Jf+l3zS+rc1xTkXUuJ35V2RzwaimvIiXP6JRghrN4YTO?=
 =?us-ascii?Q?Qn5w7DAlKZxAaDu3BobjEYHqfqtjxM/fUQaI3HHHmp6KNkMu5tf+LalfMAX1?=
 =?us-ascii?Q?+hL8/t9nDV1d0pwg27+H1p0mJG2b8/zbakFPjti4o24GTfoBw5gZY/n/QRkH?=
 =?us-ascii?Q?OPRNZxw1LLDA3Fi6Nw2sq+jLtr4DsV9q1xLc/Z4DHG9yXqIq3+6/7te/6Sou?=
 =?us-ascii?Q?j9tOtrKfY71ewcsUlcS0X1zf5M3abu8ntwe7ocVm72RA9g3PJ5yZiNCAhiux?=
 =?us-ascii?Q?R2NxWb0TW5tubNDotxYuUc9MtuKX8RROMrwhfXOqxFNosPYwNgihDrfYbdP8?=
 =?us-ascii?Q?aEmfvM9LF+zcctJLocgGsjdvxrAzH7h3v8NWLHOu6L31DeQqVG0SI9etpEPj?=
 =?us-ascii?Q?qRM0BWqdx7hoKo30Yn+Xgoz41GHZyDo86rEoWD/9qXOxyHKHda/do5A+ByoN?=
 =?us-ascii?Q?toINILS8TfkYGjdn1DzSpd+H9zolKUyVWtQS0dlcZBVAJWWUIcbl4rSRK3vl?=
 =?us-ascii?Q?JD2/Bpk7gj0OjKa6kOiozXZlHpwfZW136He+DKNe6u2/4vsRsw/AQv6cO69r?=
 =?us-ascii?Q?EnJO5zMaebRg1Y2rahNhD4kRerfyDwssU/kSP34zurT4u/jdMZnZFFyRC0mA?=
 =?us-ascii?Q?NnRBZ1NEdNoEg0p/zUHqwNGyCN92u/D3de5B/iNITXwyRjuUy0CIjG9sHHDD?=
 =?us-ascii?Q?qvDb9sWzfSB4FLsmITTpmgR+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5699.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b8b43e-d139-47ec-cbdd-08d9534a03a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 11:06:00.3231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5wrk58r2MBnKv0eGS0/cjpRi3OHLN/uWRPm+jTMA9MQizAn2NvDVh3Oj9lpX6U3u/ux3Lfxx++Uns/eLjb/98gB8cJ7vDxwbOcUe3qr3Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5478
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thank you Linus Walleij !!

I'll include the same and post the next version with 'Reviewed-by: Linus Wa=
lleij <linus.walleij@linaro.org>' tag.

Thanks and Regards,
Lakshmi Sowjanya

> -----Original Message-----
> From: Linus Walleij <linus.walleij@linaro.org>
> Sent: Friday, July 30, 2021 2:45 PM
> To: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>
> Cc: open list:GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>; linux-kernel
> <linux-kernel@vger.kernel.org>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; Raja Subramanian, Lakshmi Bai
> <lakshmi.bai.raja.subramanian@intel.com>; Saha, Tamal
> <tamal.saha@intel.com>
> Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add bindings for Intel
> Keembay pinctrl driver
>=20
> On Fri, Jul 16, 2021 at 6:27 PM <lakshmi.sowjanya.d@intel.com> wrote:
>=20
> > From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> >
> > Add Device Tree bindings documentation for Intel Keem Bay SoC's pin
> > controller.
> > Add entry for INTEL Keem Bay pinctrl driver in MAINTAINERS file
> >
> > Acked-by: Mark Gross <mgross@linux.intel.com>
> > Co-developed-by: Vineetha G. Jaya Kumaran
> > <vineetha.g.jaya.kumaran@intel.com>
> > Signed-off-by: Vineetha G. Jaya Kumaran
> > <vineetha.g.jaya.kumaran@intel.com>
> > Co-developed-by: Vijayakannan Ayyathurai
> > <vijayakannan.ayyathurai@intel.com>
> > Signed-off-by: Vijayakannan Ayyathurai
> > <vijayakannan.ayyathurai@intel.com>
> > Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> (...)
> > +  interrupts:
> > +    description:
> > +      Specifies the interrupt lines to be used by the controller.
> > +    maxItems: 8
>=20
> Write here that each interrupt is shared by up to 4 GPIO lines.
>=20
> With that:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Yours,
> Linus Walleij

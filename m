Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AED6D3DB791
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 13:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238403AbhG3LGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 07:06:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:38797 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238602AbhG3LGT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 07:06:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="274149064"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="274149064"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 04:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="518909791"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2021 04:06:12 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 04:06:10 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 04:06:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 30 Jul 2021 04:06:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 30 Jul 2021 04:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gm6wM18SUzFzYzAuCKA3J0Tisw0vfw1YO2MyPo5MLmtlqt4TZDNUJZfnv5k6Y6q3CpbB/6ALFk2Qsj851YlV4WyvkZPxTrZkD1UN0M6edUT8v5U1v8K3rkt7ikeXY/hTO4V68p5UqYfjywq4AJKHgB+/gkyi40gJwEKo5PHXjMznnbJb77nXmUsatctSNrG4MW12TGPVduuVXr/OqpUqJr4XKhc4EOqSja3a+82uhf0llAf+2M3A5NrDOWD8rVMfiSfWv+h+RCjoPWAubpO6wrm/aE+3sq3/NU5lfse89JfMMbTbFNBq3ll1y5Garw6c4lUEt3NL/aixHVNzSKkYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhIKzlBa98n+djZwjD0xXOue7d9N3Oz8oZeXqs/IBAA=;
 b=WdVbgN38uH9aHPGCzo3W68N73sDVSp62vEnGdjqj8eaiLjIQ9jBCy5XK1t137b2kvhIhbKpGowLPH68sfMBjtkGJWltaj+/WK3Y67qpaPMvtXeIl9BKy9ixhzjnkx8n1XVWYdylajhM2C9zulfAiWYECR7v3Hy5UsjjCcSRM9HFnfD0nPvZj/RLBrjQ2gu54U8V3ixbiaRzkjyv78dbqcPjNK8UkOCkibIbioc5HYvofxHdHR5MXcqO6llM01X5S9NRqqQcv95t6jMyaVZntEnMmt0F5C584Z8CTryBgDR5klg5MMBu+WukOdEx6PUFoCE/HHRj7COkeeBDx+crp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhIKzlBa98n+djZwjD0xXOue7d9N3Oz8oZeXqs/IBAA=;
 b=vHWyovMnttO6GCUZUzRZ542zu+LcFFXs/6fUataq8SSsHsUKPkYCe2iChxZI/eJrVHZ7OsseFgkqKbUoRsaYkvbXl2Y2H5bvd3qYXqANp362VaNryGwu33CXCTPBwIVpyxAqlwJiyoqcB5o17AmGco2ovGEfMpzcxh12KKxIdTU=
Received: from BL3PR11MB5699.namprd11.prod.outlook.com (2603:10b6:208:33e::8)
 by BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 11:06:08 +0000
Received: from BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::9950:3753:eee3:bf4e]) by BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::9950:3753:eee3:bf4e%4]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 11:06:08 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Subject: RE: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl driver
Thread-Topic: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl driver
Thread-Index: AQHXel+DVxz/ctFwFUa71+gw1r4SS6tbUZkAgAAFNoCAABIdcA==
Date:   Fri, 30 Jul 2021 11:06:08 +0000
Message-ID: <BL3PR11MB56995CA61A5C6AF043A37B11C4EC9@BL3PR11MB5699.namprd11.prod.outlook.com>
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com>
 <20210716162724.26047-3-lakshmi.sowjanya.d@intel.com>
 <CACRpkdbv77hjJ91h3fuLSYbpT+Yxd4X8_S7F+NsUw+QsKXN3Ww@mail.gmail.com>
 <CAHp75VdZ2_Hd66FoB5W_p0WCy8Hvx7ypz5K9iVAv22mnjE+jCQ@mail.gmail.com>
In-Reply-To: <CAHp75VdZ2_Hd66FoB5W_p0WCy8Hvx7ypz5K9iVAv22mnjE+jCQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f717e7da-60d6-4fa9-6a8a-08d9534a08a2
x-ms-traffictypediagnostic: BL1PR11MB5478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR11MB5478EC0DC199A2674CB37D31C4EC9@BL1PR11MB5478.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qQGmvz0lFjyRzWM/xLe3Hrwx1Y/6m31cbGd8ieYZpVsPcSKvPwpiFJcv2NAYFXMhXzt2/7bSBmpKUf2tIDG6GKvtpe2cbJHzSFd7uCNUfou9MpzDp+ObZGAcbQw+Z2SXlupqmUc9StQd1/CziLd8ndGjChJuZPlHjjpT7BN2QV6LzvprOJ03MtVoULnVJt/0Lxp3EwpAOKDHZir/LLYgiGf/xnSuXTp4kKadt0ZuSC30d33drPFWzREb4FqY5BrmDn1esLqYNQ/RV9b0DgB89JjBeW+iT5rrbfuAlNAtbE9KuvKHTB81yJTojRpzs2KjP6+IGk1p7UdSMSUYPOI3ss8FSYvthRajNEIO72p6bWdTiMZ8NVl9oVWzMVKOfphbmyY/caN73P2n9g9Rpj40KwNHxGBbX5pZ0gGkf5aWFHmf9nZux2fvVuzhdti5GUFHVLKrlJDMOqBvuOPfqF6vlbxw4nQFjch5RGiKe/jpPuZtM7UTKe6Sq4sxgpDGrj+0S5ZYDgs68tQqRJb33dClgvBbezJh6fR+ZpFt/OBpOw+LnO21Zpi1sstZiBUkZ86K9bnxBzGScaEFwLT+z211MiXVvJx25eUIW8sInYOCmYw6V1hZAIscYiL8RcdzG1ISnrtNiO54JB8C/63Yl7Oesj8FcdVAJiKDNmOApDasYLCU8k09txbqkScg8pJ5expp+xFi8rHO8j7cBYbJHjk3ZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB5699.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(316002)(66446008)(9686003)(66476007)(66556008)(55016002)(66946007)(64756008)(83380400001)(52536014)(54906003)(33656002)(6506007)(38070700005)(53546011)(7696005)(8936002)(2906002)(186003)(76116006)(110136005)(478600001)(122000001)(86362001)(38100700002)(5660300002)(8676002)(71200400001)(4326008)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cifgRLSeRLf+EiTrX0p3uh6MOYJuXtuebKEjIYLEbwR5fkuh2VIPbcpkvxOM?=
 =?us-ascii?Q?0NwDxKtNthZjIQpth3pODci7txv/FYrdpSZGhXtukTXQaxMHh5rqTiOuM1Rn?=
 =?us-ascii?Q?XUDQEqoWkyB7K7cHnourcTw74WuadoEdLvw3w2RnT9inLxT9Gljo/ouXJbbY?=
 =?us-ascii?Q?GjzK1xw5qrxiIAtcdC/4BWVycBH91NvXHRD1rWVtCQ/PHirk+64t2K99tQdq?=
 =?us-ascii?Q?VBjyEIwOp+CaJ+HDdKsycn4YvSUsRRinOOaeB3Nel5QG9iY9OsJJqoTsI8VM?=
 =?us-ascii?Q?TqXZ84J/d6S+4w/YAFZshOZEPmJikDlkOYYIhPr0ZDz5c9NE8hLxHtG+zzNJ?=
 =?us-ascii?Q?gTkCem2EY+6IAu48YpKy0pExJSuDozHj+ujnMHGye68JpZuiIFprs45xpQR3?=
 =?us-ascii?Q?O+xK42TZarjIiK1INzCOSnEQBWh40oLjTJchRqtqv3OC/WPU4n0p1JPed0Pi?=
 =?us-ascii?Q?5YieN6xSYvTaNuwRBvGFcBfNTX1dzxuvRrTO430qmJpvCscvKKhmcRDRQmuq?=
 =?us-ascii?Q?Gv90DXHS/r/414qLvI/9vyR7iiJVtCWuyrl7W2ZmLF3CLzp6ZsI8tF4szK15?=
 =?us-ascii?Q?3bZpMllTsTcY0i80Mjc1pza3jUF++hp/s/kPvWLKBCaYTP/zdrR7UndIXDTd?=
 =?us-ascii?Q?r9chDqajI9i11Qg+GemYEMsaRsH5Ub1jPOxb98EU2XDTxn6UuIkCUtrT+5CF?=
 =?us-ascii?Q?O+Z7V4XuRnGbKHqEWwo1xlf2nzulIpyiblK4mib21+JR7SLw9n+ZmKgBc67L?=
 =?us-ascii?Q?nWvzb9o6KIgWejc2NOGl6yfGHQX0yEWUI9JCSWHKy0Ia4vevwKPWb9QD6x83?=
 =?us-ascii?Q?p9j14NmSTB3ndvtET9GN4rqrwHt5ujDImRoE12JdzqSY13BAshSiyPory9nE?=
 =?us-ascii?Q?wruaS6RlEgh/s58HDbLp6zP86ADXsBrGljKGtCVfM5i76OFFxPBjPXT0KY8U?=
 =?us-ascii?Q?HIOn+H8ZW+CmE0yOMczZfnZN3KcUEXexxxapfj70ZoYqP6V8SAWVbAEgg5A3?=
 =?us-ascii?Q?EzntZgk7GmpHdXeq/qILeywxyh4enMOTE5sUQ0Fz74eULreXxTPuclXCE/Zd?=
 =?us-ascii?Q?/t/ucowGKlH+LPUR3JDnfDYP+rjk7ojSqnD0+zkVk/yZm+FFOKcfN7CRbmLO?=
 =?us-ascii?Q?OL0PdjNyq4L+IKkUtlKg+THH+Odrr3YzbzBNZtY9a+FzbNpI4DNb5CemGnoi?=
 =?us-ascii?Q?Df/AfRku0eh/INVqiYDb6aapzwKU0hu6DT5Zy7JHvAmqdquEi0r1/dFDat5b?=
 =?us-ascii?Q?2xEPDpVoNVfzqZbTnefklAWB5W5dllyvb9W0UhHNTgN0du2KwH0d/wHnsCQX?=
 =?us-ascii?Q?mqY8SuLYOhvnCEPD7bwb9kGA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5699.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f717e7da-60d6-4fa9-6a8a-08d9534a08a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 11:06:08.6107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5e2lNQxlCKrGc24bs8qCdDgnCpuRm+vNEOdQuIOPVr6YtrMva3eMSNUWLIrvDWA/dr6u5dF6QFHOqnDw6OgW8GS+3WJQS3NHRzVX++yQEvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5478
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thank you Linus Walleij and Andy Shevchenko,

I will fix the warning and post the next version with 'Reviewed-by: Linus W=
alleij <linus.walleij@linaro.org>' tag.

Thanks and Regards,
Lakshmi Sowjanya

> -----Original Message-----
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Friday, July 30, 2021 3:02 PM
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>; open list:GPIO
> SUBSYSTEM <linux-gpio@vger.kernel.org>; linux-kernel <linux-
> kernel@vger.kernel.org>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; Raja Subramanian, Lakshmi Bai
> <lakshmi.bai.raja.subramanian@intel.com>; Saha, Tamal
> <tamal.saha@intel.com>
> Subject: Re: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl driver
>=20
> On Fri, Jul 30, 2021 at 12:14 PM Linus Walleij <linus.walleij@linaro.org>=
 wrote:
> > On Fri, Jul 16, 2021 at 6:27 PM <lakshmi.sowjanya.d@intel.com> wrote:
> >
> > > +       /*
> > > +        * Each Interrupt line can be shared by up to 4 GPIO pins. En=
able bit
> > > +        * and input values were checked to identify the source of th=
e
> > > +        * Interrupt. The checked enable bit positions are 7, 15, 23 =
and 31.
> > > +        */
> > > +       for_each_set_clump8(bit, clump, &reg,
> BITS_PER_TYPE(typeof(reg))) {
> > > +               pin =3D clump & ~KEEMBAY_GPIO_IRQ_ENABLE;
> > > +               val =3D keembay_read_pin(kpc->base0 +
> KEEMBAY_GPIO_DATA_IN, pin);
> > > +               kmb_irq =3D irq_linear_revmap(gc->irq.domain, pin);
> > > +
> > > +               /* Checks if the interrupt is enabled */
> > > +               if (val && (clump & KEEMBAY_GPIO_IRQ_ENABLE))
> > > +                       generic_handle_irq(kmb_irq);
> > > +       }
> >
> > Aha there it is. "Half-hierarchical" with one IRQ handling 4 lines.
> >
> > OK we can't do any better than this so this and the bindings look
> > fine.
> >
> > I need to know how Andy think about merging,
>=20
> Linus, unfortunately I can fulfil a detailed review (busy with a critical=
 task not
> related to this platform anyway), but this version is more or less okay t=
o
> merge. We may adjust it with follow up fixes if needed.
>=20
> >  and then there is
> > an uninitialized ret in the mail from Dan Carpenter look into that
> > too.
> >
> > In any case with minor nits fixed:
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
>=20
> --
> With Best Regards,
> Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486CC41BCEA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 04:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242877AbhI2CpC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 22:45:02 -0400
Received: from mga01.intel.com ([192.55.52.88]:63938 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243796AbhI2CpB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Sep 2021 22:45:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="247367210"
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; 
   d="scan'208";a="247367210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 19:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; 
   d="scan'208";a="519539756"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2021 19:43:21 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 19:43:20 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 19:43:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 19:43:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 28 Sep 2021 19:43:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXo8ef2p67DRzRPPjcp14tdUtKfkJoyLDXyki4JpEBhTF2VXXxjiW8pYZ1CmUcEM6+Fii48n4ZEnRSWHquOJp10PGLY3SSo7r54pVpTlt4VpNextR98ba9HvvWF1mprR2sdEhn5EwZTkAP/fdagVDhNeQTl9fisw5pKz56/swZOjQl9nOqBEqCdRyPig62eFkFVRyDdzWM72bgJUpV6M5To+x4aQxBjAHMzSoPf0NhDQaYEv0qr9yR3z5bia8Idg+7YDPs51zgyJ6DG9NDeYm6HL7KfL1IdiZC+8g5i2YxSZkYLLPVYSN1x6gxYdAXEzAPKqnTGHFmfl84KVZV09hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=C1ikFXjRRod6C9sXCRjWVndQ0Uh6aDBjXJdMHu0zWLY=;
 b=ItOJYwAeT2z43jlAibj6jIaFMKZO/y4TxfnUh3xtgb1NczJSZrvKFQ1Wjr9S2uxnianlNm0YfBFsSLx3keY9yQJy3B+ibSo+E9ZQVT9zMkZQl8QLJ0cM/sP2L5tQzU95uMzAxYXApAhl5g7131Zeacs1UWTHwybIHCLxGjC21ZdP76iCaO/4GywODqt2oCflp3h1RdmjXYlnbbVP3CWtouH0G2Av+/mhFQLTP5kOh0V2H+CgdgppugPWG6xs8Zt9KYQDbGanWsJmGXlBmVdJejM4Jt74n5C9gHbc1txMeyygn3VpjhTaCWqJ9n7juVI7piqhjoqbKeh3mq84Sal+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1ikFXjRRod6C9sXCRjWVndQ0Uh6aDBjXJdMHu0zWLY=;
 b=mNaWHRV/SmBZvxiVY3e24bxch70x8ptMdVv3kh/9BQzA79wATBAZkvLWDXd/jcVHMwhK/wqlxXTXOHtR80eDO/zidIEZRI3BEIsX/ipb4mEEctVjHjrEdFPBGJrQV3WewXzgC0Nndqva238sLfuQsWbJ7JcGp0yRubFKnVErRho=
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 02:43:18 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::44d8:67f3:8883:dec7]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::44d8:67f3:8883:dec7%3]) with mapi id 15.20.4544.021; Wed, 29 Sep 2021
 02:43:18 +0000
From:   "Ooi, Joyce" <joyce.ooi@intel.com>
To:     "Tham, Mun Yew" <mun.yew.tham@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH]MAINTAINERS: Update Mun Yew Tham as Altera Pio Driver
 maintainer
Thread-Topic: [PATCH]MAINTAINERS: Update Mun Yew Tham as Altera Pio Driver
 maintainer
Thread-Index: AQHXtMvxLzAYSPZRREuBSf1Tb72iYKu6TaqQ
Date:   Wed, 29 Sep 2021 02:43:18 +0000
Message-ID: <CO1PR11MB4820DB3A97162C2C09F6F506F2A99@CO1PR11MB4820.namprd11.prod.outlook.com>
References: <20210929004910.7629-1-mun.yew.tham@intel.com>
In-Reply-To: <20210929004910.7629-1-mun.yew.tham@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5098c4bb-8671-4453-e79f-08d982f2e511
x-ms-traffictypediagnostic: CO1PR11MB4900:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB49007123284CB17DEA0633B2F2A99@CO1PR11MB4900.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:221;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oFs0to2atrANHMA4r3DiFFZZtCKxgBXgCTtRxPOXqt4gA0023inUPfLB8Z3lAThNvKWadCzF56aZbpIUvdEp0IGbynQHzmyEOojix6yXwCQ0GwPIBHXowBA2em2JBJMt55/BzZlv2+TRY/O/Y+nPJB/lMY1aDJAZl2NpqxjJIV5vgaTnoAj4Mv6Vdk7/jrPtJNze1S7n0X4Q9QNeX0cJuv4+pBhsiGgACxoaisJsF7p4qTBn3BSL4CwXZwpxVn76j2s9bzUbnzntSqoCGwZgj/VCPs92j83bONYkoocVEVJYwdXHptDUEAxUN6gSeY10BLDmznyqgpV+n1ySTdhFZw0PBy6heBuuFUM41PItwev1t/7EJ2Hzk+su5cO6v3F4/L9M0NN5lTfec629n7QhvjDR/FutLf2ealNckL6WAHTaK/lkblLE79PDUb10rjiW2OuLNQQ8CbUqnS7OZ60+V04S5l8GNa06O7U/4OGJgLC8A3piP72ZC9Dh8eal22UxFaaAVul8iEXFSPqoPNzQNOzogXGBjUTaFcgq6Hk1J0jWFcOty9nQ+viaGeJZ7Dsn9IKvYVbDhXe78pSKj6fyDbsybnr+fDS5Me1VJld5NpTZVQybRy2KRS7qRM1JU7YSVCfaCQL7tT5AwZ3CYxvv5B27pFmAoaDpzoL5N0L4j3dfYI0ySF8Snay3PlnsUNMFiYiSn3BWVMn10msIXGrWwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(15650500001)(508600001)(52536014)(86362001)(4326008)(316002)(110136005)(5660300002)(4744005)(122000001)(38070700005)(38100700002)(54906003)(2906002)(186003)(9686003)(55016002)(8936002)(76116006)(53546011)(66476007)(66446008)(83380400001)(66946007)(66556008)(6506007)(64756008)(8676002)(33656002)(71200400001)(7696005)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hpo0F+e1NMBkYO2b2LOHuQIn0iKy0m0rDMPOHskxLsoi07+6kodeaUR4OoEK?=
 =?us-ascii?Q?CBqstpiVff6gAY37X7PCk/FUpmB9Vb2Qc9Q6Ai+3q7fCt/OZ0otAAgA/RvZT?=
 =?us-ascii?Q?BiNfYRBlViSbdhGUPVEKM3bNTjv+bHc3jSgaPXkSmJ9v9OeMySl/kSPeDCR/?=
 =?us-ascii?Q?z+rbi1ifxSPAGfJOGhCYfpcJOGvMCVofsOIsmbdUep0orluo//0kyWZSUhhX?=
 =?us-ascii?Q?6ARTCrniBXiiKESHWbCz7cJrjGu9TK31QgG12/jL9SnvDi6fnqk0yB7TrtZ5?=
 =?us-ascii?Q?rF2waope7rpCopmpgzzUQ9md+JYNjT75irST73T4CI+PhnFjqq4byrc31wbA?=
 =?us-ascii?Q?xzFyh7jEsq+IRq/c7ty3ilDxKBXAu7ThWgjNImLe+o/K2N6+BmG+sJxcYrL7?=
 =?us-ascii?Q?sgIXFwfBD+6SjksqYpyKHqnR7xLIisyv9EkEmSZLmQnfuMIr/9JJLeni34VN?=
 =?us-ascii?Q?GBecSBySMz0aacS/cTdUFN+ZeTr5uUSrgQyYvM3XyvQyLy6/bBJZjeL/uiZy?=
 =?us-ascii?Q?/4mBLIb9EHOEC8BbeABdtY37rXJJRYWdFhrxhRH6LYQ23n9jsmzZbDnPhxOG?=
 =?us-ascii?Q?zEur9GRtTWxkct8CjIYUHMcY7bNBB86t8YrntWm+vqvEXi6F12KVVkeyd2DP?=
 =?us-ascii?Q?S1kDX0Q2CJw0dGDzStC6inm1SBjywoIjuC4lUd5X5lESuCMik3zpB4ZSCo2K?=
 =?us-ascii?Q?7ttL4U885QbCDNg3m7FPQxqLxxoxJKCiPe6EJPLltqS/VgwXobDQzY/WG5ZK?=
 =?us-ascii?Q?QA42BlzUrZ6B/qLbArNHs/ZIhW1x+twqbnD5xyp67Tu3cBDP1PbTqZPzm4uX?=
 =?us-ascii?Q?VdHL95Xg96qeyCBw7Vhp5Z8bn9G//UM35zs/Bfow+p+ztD6OhoBr2PfDP2pf?=
 =?us-ascii?Q?DdQpiPrt+oqWVtJ7Z4/imvEhHMtSAmjmC3jXoihVuchHdeEtjvBbuY9vs7I1?=
 =?us-ascii?Q?qnGlnvL/2jlVvUa48BTGw/AGwi77wLktc0xaqwFIxjT55smacg7smq24Ug9F?=
 =?us-ascii?Q?KAmlr9MZypHCrwWKspx0iqGpk32knJ0fWs9LER158l1zsk4M4A+oG9z/C48F?=
 =?us-ascii?Q?TWLiSSZEpYeve1+S0yyHI4fwb1nEIJE47+C/38v2FO3JZcUb3o4WhRPfTKn9?=
 =?us-ascii?Q?UiYq+761h/Q3umbJusJAFBj/n16sbxMrR286g+awqFyYILe93vzn9NVxvKe7?=
 =?us-ascii?Q?UJwFlO5QFIG7yOy3BI2C0mAto9ercPJmc9EN4+PysObQU4OolwrpZxAxRPi4?=
 =?us-ascii?Q?uXiQClRxGBhKwBMtR0g+4OJgTyh8CRQM3ZncMDi4aG5KH8Y1tWWF4bLDWZDs?=
 =?us-ascii?Q?6dVoK21YoFOtdE5A6JvbyqDT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5098c4bb-8671-4453-e79f-08d982f2e511
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 02:43:18.5641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f3TQAHoHmWQJtYrG6ZEMK43LkxNvuJzenu1sSWogvHP0JXkhUYEj7O7OMBisDhJca6ML1y3n/eUXmuEAw3GouQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Tham, Mun Yew <mun.yew.tham@intel.com>
> Sent: Wednesday, September 29, 2021 8:49 AM
> To: Ooi, Joyce <joyce.ooi@intel.com>; Linus Walleij
> <linus.walleij@linaro.org>; Bartosz Golaszewski
> <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org; Tham, Mun
> Yew <mun.yew.tham@intel.com>
> Subject: [PATCH]MAINTAINERS: Update Mun Yew Tham as Altera Pio Driver
> maintainer
>=20
> Update Altera Pio Driver maintainer's email from <joyce.ooi@intel.com> to
> <mun.yew.tham@intel.com>
>=20
> Signed-off-by: Mun Yew Tham <mun.yew.tham@intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71d27c38212b..6a31ab36c3fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -810,7 +810,7 @@ F:
> 	Documentation/devicetree/bindings/dma/altr,msgdma.yaml
>  F:	drivers/dma/altera-msgdma.c
>=20
>  ALTERA PIO DRIVER
> -M:	Joyce Ooi <joyce.ooi@intel.com>
> +M:	Mun Yew Tham <mun.yew.tham@intel.com>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  F:	drivers/gpio/gpio-altera.c

Acked-by: Joyce Ooi <joyce.ooi@intel.com>

> --
> 2.26.2


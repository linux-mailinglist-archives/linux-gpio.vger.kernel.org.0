Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C2163BFC4
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiK2MJx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiK2MJw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:09:52 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCAD2AA
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669723790; x=1701259790;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qe/+7pC84/AxkzKZA/KbKMAvKXNlPDn+1zqQqGbPbv4=;
  b=adXkL7Xu4hevxJZJOrHNjozT8x8LnMlCggmDXoP5Iqek1Xp0fNYjxL0q
   aoRpiDGad5uqlpRR4CtA7kRPEx/bobqxpXjddEfa0e8q99J+sdOpSu1pf
   SXQtaKt62WzAz3g1dwi1QFqUuOO5MH/X5C3wvm2Qj+jOFAMdsjTbq9P4V
   FjwJOhX8+7/xcovPzcFM9j4SsvyL9Jzgvfe3ZlPg0G1xV5rzzzsizi2H3
   qmshU65/AcCAATvNeylFlCVMhASI8CRr+brQ5Sb4EgF7NppBmDrzaXklo
   4Zmyc6/u78wQWwcgwWRMT7JDMYZa8syYR6/RCxAS/ZOKbGA0edHVt2Six
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="377237871"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="377237871"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 04:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="621434572"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="621434572"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2022 04:09:50 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 04:09:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 04:09:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 04:09:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 04:09:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb1Q+YXc04wNmwwmXseurixa2sOvoFzWGHKimn2J4JsY05M6q2nQQiIJf05MmoSclHIATyQ9oL1xLWpoELkHdoI/wQXNEnmMjYcdZ22JLv8fKkMRz/QSWFNopBjMPFagJOR/V+aU5afUZB2l+j2g2R+9HE0nFaufFWj7B+YdA6/LYwjQLoiKoiWO7hLKrPg23ciaRLsZYahG0hEVkl31ojMzw37qae+caknrzxi5vFZBXK0oaWIiOpNv0t84T3UAtmwjOKTXuvdvZdY//NDskhAbqvNIY9sPIqN3cQ1gjTD0MnG2O0Q1AfyXRMMQeNMshAnL3GwWY5Xy0STLFUbzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+HJFhi+A+MwwJ/ilCSS32fzKWpVO4+QHqO6jP4UthQ=;
 b=RSxnhJjFAx/pkOupvEu0XsB7xoncbr3f7rsM+PeS7FUS3qrFnefEskfKIqI45T0pkwCyG9WG8A2F4lqcdaaEHl92q2Dl/etL/8Ecym6ASpjJ7MgbwRR0G+ULYFwjxfIq8ZtaqJBFdJeMDY1+lJf8YC6CUcEstnuDgIEvTAvzjdk+Tp6Gy96KsknFOtAvKrq5VpafltVg4iAKTKZxrmXN1wqInCRtoJOhdLEdr3WIKQFybaEInkr9QfiID5zQry80dEz2XoNxLHv3zzJJt9JqOV6Je7PI1N6d1nUT9Fz4mfBlNR+7aETCQXK46/EadFRstb7WjQjEv9UwR+g8Z2Z+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1499.namprd11.prod.outlook.com (2603:10b6:4:8::17) by
 BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Tue, 29 Nov 2022 12:09:47 +0000
Received: from DM5PR11MB1499.namprd11.prod.outlook.com
 ([fe80::6dff:5638:e676:a1bf]) by DM5PR11MB1499.namprd11.prod.outlook.com
 ([fe80::6dff:5638:e676:a1bf%11]) with mapi id 15.20.5857.023; Tue, 29 Nov
 2022 12:09:47 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "S, Kiran Kumar1" <kiran.kumar1.s@intel.com>,
        "rafal@milecki.pl" <rafal@milecki.pl>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "N, Pandith" <pandith.n@intel.com>
Subject: RE: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in
 thunderbay_build_functions()
Thread-Topic: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in
 thunderbay_build_functions()
Thread-Index: AQHZA+pbdeFRx+YdWkSg0cA2dSBJza5Vzbtg
Date:   Tue, 29 Nov 2022 12:09:46 +0000
Message-ID: <DM5PR11MB1499491D6679FA47FFA3FE5FC4129@DM5PR11MB1499.namprd11.prod.outlook.com>
References: <20221129120126.1567338-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221129120126.1567338-1-cuigaosheng1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1499:EE_|BL3PR11MB6435:EE_
x-ms-office365-filtering-correlation-id: c528e635-03dd-4279-d461-08dad2029b90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 113mnWUQBy6C0wTpq1mnJadGeMfThxxI5TJtFQX9TmWbvp1N3WBbWk3sbUzD0b4iHOmHxqPrrJuthUgljrBCs0MytMqFgksvkLuZCwil5j/CZOBP5ypeVH63oFy0dYfI+WQDCWXmxVC+jAAYCB91qjc72HgpVW6pN69BMmgFaGfobno31BoJAZsLxygVcZ3UGk/Jjq6uGbARhNuVUunAERAA1L5Y01cJHWun8dlb8hMzZMnyqlPPgkkc+N4+zB67ThBy9oFgCQq27xKhVcnhJ8wOOM7Wl5iI1HeCZibyP4iHPdFEl+SI6d4lsmSKUdLTxzvcLJpoMPKnCk4H84w5RK9OOH+bJKkonN7Bd/ZjZxiXRTiLo1WF75Bs/joBx5qGR/FLxzLCRv60VS8ZloAqPKbV6DC1o8GpyncYLbn6rZHbjUkuCWlo/R4Z8WxU29T1yBuobhDmYqYmNAphhwKk7nSFI1yhAE5GGUEiQ5lreg6Xt4B0AOzN+zdU9LV9xZZcrrY+fxmaRuSI7f5zWUZnCvWL2yU/QpcRw1sd/dErz8/+2L4eJGUgPKPS80IE6WUQtjOE3g7HExkqbYMvZ+whGVSqM067YSkCRt6JIjOuCaeGy+GDUt4imcLpBYNeXSbCpf8MvvnjUJdGdWG6B13WtSNsCCZsR3GkzL1XX4CVE4QmEvghLVaqBOxxV1pgxFtl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1499.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(66946007)(5660300002)(38070700005)(122000001)(71200400001)(110136005)(82960400001)(38100700002)(76116006)(316002)(9686003)(26005)(33656002)(186003)(55016003)(52536014)(8936002)(7696005)(86362001)(66446008)(66476007)(66556008)(64756008)(4326008)(41300700001)(6506007)(8676002)(54906003)(478600001)(53546011)(107886003)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w+LdLYxNjHEraYpGQy1siZvrfpVny69gF42ujrFRZP06SDwulYoC52EGtmDj?=
 =?us-ascii?Q?mCivaSvX3FPr1KcD4XtNCx7Ci4Bbq7R1JFErWwgGz23GjXJX+3VwwwVtCVa+?=
 =?us-ascii?Q?eWV6r0prxCZsXPCW9Wx+ELftHv8hU4kfLQTcGpJfTeYtZOKYVZIZs7CkqFBl?=
 =?us-ascii?Q?ZnTO0mxz2TlOWd1lwFW4yV3Oqd5JiEUrdhQqDkmtGZc/bVAUnMBNJVhs+ltP?=
 =?us-ascii?Q?yweOFdNH2TzS6RMv6+22H0g5/NG7pesbsbBSempbttG7+WMIQ9WiYO6Jc3GK?=
 =?us-ascii?Q?CWRT+2136vK3WsuuchOJdIlXpLqH9fDCo4DkZNScz4hU4I0VmXcuB7u6KTA1?=
 =?us-ascii?Q?akT0PC79Kqybzz4oL2DU3xumhpEzFCp2ORtCAW2TT8yqNji7TqHbJcX/2jVP?=
 =?us-ascii?Q?fN1AQrMI06nne1VvAYBXQzkkz6jCTD8rv7d5d9kW+jBX5VADG9siZdFR12jG?=
 =?us-ascii?Q?5CPRG0gUwUTR0aRSk4yqmjrBoccS+nqHNajhvv1jB1oPPPD+o8XhavRg7JV0?=
 =?us-ascii?Q?eJkmzrqF8nimPt8akIPjajKQQRsi4EHV/MSfY2Xd42hgjLukRIIxzxuYAtJU?=
 =?us-ascii?Q?aA3OdmV9etnbKF+tf0eFMu8jYiUZNj93BVsFl+l0yNq2l7oSk/h0nBpMc7Gg?=
 =?us-ascii?Q?2dQ1uTgxeJEh2HY5fhzIKSKNBqLvFeWLRoAUAkjG+n8F419FekZB1FurvgJT?=
 =?us-ascii?Q?vLw3PTrNayjRPc+c4G/BV0UVrBUCTCrumgpexp1Z+HnOv5dHrRWP7s675s0L?=
 =?us-ascii?Q?2DNDn6xw/Cg3taXpUwJkgm8ANd6S0tE/Uf+fxeM+3bm/GBU0eL0OZIQcdP6w?=
 =?us-ascii?Q?y17B+mo0seZ93KPSyYZDury5dCtM0Ktq0pmF+iJ3L6qF9ieJnzelWx65Yviw?=
 =?us-ascii?Q?pxtWHjhT23N1iX57JUl/i9gyAKE6qMmaDZW/9z2cv7CRqXNzD9VohLq1Q3dr?=
 =?us-ascii?Q?sPK1282B2sMVTPc4lJuILP0G1/KZIlFmKfBVK3ITNC1Yuf2LFInpaDkweGsi?=
 =?us-ascii?Q?CZxBVBUHZTgCLgQjDfzDK08CawTUDnUVm/WnCl3pjV5iEW+4YMjb0RECYFFs?=
 =?us-ascii?Q?Y2UCtwmVNhSlk71P3g79ORlTPyUVD2JqOUkoVyaGaIXxI5DfwXlfPRnYCydZ?=
 =?us-ascii?Q?Ov+t+TP9l8+K9fBTWp9HrR/HDrBo4pkoynvDSW/n2nI3PkHa7s7SUH/eD2Si?=
 =?us-ascii?Q?+9NHWjEvxjuq+KmriGIH5lqfLYEO89q6/SJR96sPyAQR3wZx0PBJdbUJ0Jo9?=
 =?us-ascii?Q?Ut05yCKEiTHospiqvc2hzt9ANWoyt8Tk8EgoQrEKXvXOlAppuVnBw4BXqD5/?=
 =?us-ascii?Q?3CquEMm7UOu5oQ+id0CA+fOD1bvfzH3RInEfjhBp+qycS2CynbFOD3ugb6kX?=
 =?us-ascii?Q?suboiucbkb/eTgsvzANzEp6yHz+ejMVI0wtn0IsCCO7rOXtY5l7zFY+Ekcxk?=
 =?us-ascii?Q?EnvmfvdLugEu4m9laONgKjvhMlA8Q2wCwIrSLz273DeGaH3o160MUdf/mcJV?=
 =?us-ascii?Q?0AHDmIHPvWdziaPr1wsEO7rq+DRjjqOWYapcjNlRLbIuH/M8LgMiJL6SYQpm?=
 =?us-ascii?Q?ndzxuM+iKA6kV84iFJsHsQzlNlbjd9heInvLZwKRAj8pAE9n4ORWQZ8pBnsS?=
 =?us-ascii?Q?FQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1499.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c528e635-03dd-4279-d461-08dad2029b90
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 12:09:46.7917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bcrr86RIkKHQRELVhHJcFAcPtqHJvtUjmmICHrOq81tTJ9b+Pk5KBi8jTz4H6GU5blyU+7Qr07hrZOVgiAba7aki22V/6lHmEUXjhotL+uA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6435
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Gaosheng Cui <cuigaosheng1@huawei.com>
> Sent: Tuesday, November 29, 2022 5:31 PM
> To: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>;
> linus.walleij@linaro.org; S, Kiran Kumar1 <kiran.kumar1.s@intel.com>;
> rafal@milecki.pl; cuigaosheng1@huawei.com
> Cc: linux-gpio@vger.kernel.org
> Subject: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in
> thunderbay_build_functions()
>=20
> The thunderbay_add_functions() will free memory of thunderbay_funcs
> when everything is ok, but thunderbay_funcs will not be freed when
> thunderbay_add_functions() fails, then there will be a memory leak, so we
> need to add kfree() when thunderbay_add_functions() fails to fix it.
>=20
> In addition, doing some cleaner works, moving kfree(funcs) from
> thunderbay_add_functions() to thunderbay_build_functions().
>=20
> Fixes: 12422af8194d ("pinctrl: Add Intel Thunder Bay pinctrl driver")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
> v3:
> - Doing some cleaner works, moving kfree(funcs) from
> thunderbay_add_functions()
>   to thunderbay_build_functions(), and update the commit message, thanks!
> v2:
> - Free the memory in thunderbay_build_functions, and update the commit
>   message and the fixes tag, thanks!
>  drivers/pinctrl/pinctrl-thunderbay.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinct=
rl-
> thunderbay.c
> index 9328b17485cf..590bbbf619af 100644
> --- a/drivers/pinctrl/pinctrl-thunderbay.c
> +++ b/drivers/pinctrl/pinctrl-thunderbay.c
> @@ -808,7 +808,7 @@ static int thunderbay_add_functions(struct
> thunderbay_pinctrl *tpc, struct funct
>  					    funcs[i].num_group_names,
>  					    funcs[i].data);
>  	}
> -	kfree(funcs);
> +
>  	return 0;
>  }
>=20
> @@ -817,6 +817,7 @@ static int thunderbay_build_functions(struct
> thunderbay_pinctrl *tpc)
>  	struct function_desc *thunderbay_funcs;
>  	void *ptr;
>  	int pin;
> +	int ret;
>=20
>  	/*
>  	 * Allocate maximum possible number of functions. Assume every
> pin @@ -860,7 +861,10 @@ static int thunderbay_build_functions(struct
> thunderbay_pinctrl *tpc)
>  		return -ENOMEM;
>=20
>  	thunderbay_funcs =3D ptr;
> -	return thunderbay_add_functions(tpc, thunderbay_funcs);
> +	ret =3D thunderbay_add_functions(tpc, thunderbay_funcs);
> +
> +	kfree(thunderbay_funcs);
> +	return ret;
>  }
>=20
>  static int thunderbay_pinconf_set_tristate(struct thunderbay_pinctrl *tp=
c,
> --
> 2.25.1
=20
Thanks for the changes suggested, but pinctrl-thunderbay.c file will soon b=
e removed from opensource kernel

Regards
Lakshmi Sowjanya D



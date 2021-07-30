Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1683DB78B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 13:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbhG3LFp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 07:05:45 -0400
Received: from mga17.intel.com ([192.55.52.151]:28601 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238403AbhG3LFp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 07:05:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="193356599"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="193356599"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 04:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="499602072"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 30 Jul 2021 04:05:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 04:05:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 04:05:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 30 Jul 2021 04:05:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 30 Jul 2021 04:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2ir5NBxlANjqF6VfETmNRgVDk14ClYrJTwoPffZCYVVACHw8PYFMv+fyXMdTa5z9e06lm2kQNV66cBSftvMJNEg9bu3mmkDDCE/R6ABTBDk2LPthWPY67VXMiOpnhjJahCB4ty4xc+dD4ciEkza9Jk2RJZBNYdK7MhUJDo6SdAEPOVCz0zIfYnT/UC1gA53ORjeat720zUz9dN4TiCFwQYXIjVbHbQjHe87c5NRKOxfndGXZtqgfcLDYNZX0cu5/DBBd3tJhuv5U20r7Hk3MstapDrkir+QsWVRg/qtTIPY7eNdBT92CgLSNURcwrzsKzbLkasjUAVBM45jVVxIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wwmHtiaIXr75FdJ8NhqBPJQZhmE8fLd3mfG9lT/qjk=;
 b=U5EUndPdQ0jptWqRe6WXegsNUdrX7Yc7Xb54JXwEuqfVKeVlfclADoYPKlt61U06+CGAcGdSDDVVD/lFGQ8XBB/G1kWWA/1kbraUW52gRwGU/vSHyhcOvyFpoPacBdso6N0vKnbA5yGfH2PUX95ah8UIyArx9pWwI7ho7FR+JsIxVaLjVyXCCdisO3ucu4NA2uC+beLaCo8QuuLWpuFRPttOn9/cVwGB6/ZcLaaePpG3OxkFSC7zicSyKEwSKL/vfEJRhgldSKTKW581LPQ34AI419xwadjq6WFEDb5+bYEycELpOyhg9TG5vr/UghZ9aRLlbXsvDwPgVizIUE5hvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wwmHtiaIXr75FdJ8NhqBPJQZhmE8fLd3mfG9lT/qjk=;
 b=MR3kL02//AKSs9HVonfzi2rd8dA7KJEthJffLT5HtpeW30M4iw8q2xXjpZDHFSAKyVwR3VohzYOfbPbcgRrb0q7rQ2bmOZsnnO5OYbab7JWn+uEeEzixHTU1gth/U5YIUBKoBMvIPwxGwxtjOg9yTZz/yvVVoDWT3Z144+1DvCM=
Received: from BL3PR11MB5699.namprd11.prod.outlook.com (2603:10b6:208:33e::8)
 by BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 11:05:32 +0000
Received: from BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::9950:3753:eee3:bf4e]) by BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::9950:3753:eee3:bf4e%4]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 11:05:31 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "kbuild@lists.01.org" <kbuild@lists.01.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     lkp <lkp@intel.com>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Subject: RE: [kbuild] Re: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl
 driver
Thread-Topic: [kbuild] Re: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl
 driver
Thread-Index: AQHXel+DVxz/ctFwFUa71+gw1r4SS6tY1WYAgAKWonA=
Date:   Fri, 30 Jul 2021 11:05:31 +0000
Message-ID: <BL3PR11MB5699CEDF7B5BFB61E7C46B37C4EC9@BL3PR11MB5699.namprd11.prod.outlook.com>
References: <20210716162724.26047-3-lakshmi.sowjanya.d@intel.com>
 <202107290246.hNQDlfoB-lkp@intel.com>
In-Reply-To: <202107290246.hNQDlfoB-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cf82e31-11bc-4da3-1a10-08d95349f2bf
x-ms-traffictypediagnostic: BL1PR11MB5478:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR11MB5478E9891CF9B5EE8A6D39CAC4EC9@BL1PR11MB5478.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LBpgNqjsopIWd6Hi93UGMjSqaqKzX3xUrVhbngXscATecuPsW5ADsdMQlBl2EATBqItgWYKg7zTDhecEd2tiTpfWowl0PfNILK24URuRCs0vM1rd7vFxRCZK8OUQBqqhqaW0yhOkBQsh58D+8SC06lvtVtoVgVXzumKABvogAwR1Qu2W5DgDhF0yw9HwSggTMYBIIMPR9wIO9WVJ3VskOYqZLFZeaMiwnrGEVCje3TmhI0ERfQLddg/gzJuaD3T48xWgwsAnS3LuRxyukMvzyc9pdtWwLnqJ3SF9XdlZS82KzK5R6qF66yDKitwcDWo7tFKE7yAzf9o0plNpaC72SD5yNvcrKoFE6K/HrKNV0+W9KaIX3J8qsvP6jD9WjSekChC8fwNBRs+sy6dbKqsp+M8Gpj8IOZHieGe69DAuhzL/Z/71KAdafH7CKJt93Tl2MMMZuPTzObn8HbNdrYYRPVDdGk0CiOzJVAHLAqV1mcIHWjGnTaG44Ev3k5DeRj1oNCESomphxJgwSjN/xViJN5SP+qPX4jpfx27GVGl6loVve2IR8BRrU/vrfQQzS4Ix0A/74TdmSpppgUnqmOjhaT9NkwyI6wbkvy8N95echviwIoyUs10hD4+gJa62aMvEAfZ+gNd29b3+5Q3tojcNpEBhZTANuXkx0Sw145TSec1w85MEc+94UQVt08CdBIh/HsVO6SW6WjayRsNYWFl7nODq5/pUarkC4QJTHL7VZivxeXnld71GN1/oVqr6sQrfT39Sise/m9Hm98mS0w0LKQjNat+d4w9ihR5qiDoWAKL3UTDTxrYG+IfTLJ8Y7BlzXN2iz9VW1hS7NUhrb6Rz3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB5699.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(316002)(66446008)(9686003)(66476007)(66556008)(55016002)(66946007)(64756008)(83380400001)(52536014)(54906003)(33656002)(6506007)(38070700005)(53546011)(7696005)(8936002)(2906002)(186003)(76116006)(110136005)(966005)(478600001)(122000001)(86362001)(38100700002)(5660300002)(8676002)(71200400001)(4326008)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j1iE7Q4/cYmWwZB5DLj9LIAjOqyZfXeqyR5YVJvLv+0jasoFxyuPygRNJrYh?=
 =?us-ascii?Q?08g9SFaBvetDCSjeUX9RY9CS4Z7aZ1iUlQQEJ+PxGvvHn7DYKTtXpnemcQ7d?=
 =?us-ascii?Q?WkDdkjvllxsgPk2lq1XJdAoHkzs72izqMxNfDHtoRanF1PzwUP/C2DEnG3Sd?=
 =?us-ascii?Q?WyidUtYH7Z6611KsdClhU3eJNeL/k7DtZkvUqoC4cvKxxDXSBLM1nc7K62kw?=
 =?us-ascii?Q?c9YxTHCJkKx/BHquV6u7IVL4XNWukuj7aeUFUTcPBgjTYigIm2AcazRlhi8L?=
 =?us-ascii?Q?QuqkOP1LthEhkVrJ/mqmSOLeW7cv+SkIVmQNiMEj7hQVjXW8l6xFHMG/pBn5?=
 =?us-ascii?Q?J4qusM2w/Rochx5zD7gNTvHig++zhi2sh47Dk779ab6Ym1x61/DRgUMmrUAi?=
 =?us-ascii?Q?XaSp1R03H+iiXfjOwXfA1QSNfGsK83mrt3hcCC81S20vDig9W2r8bbdiP+w3?=
 =?us-ascii?Q?bNzdYLgm5GUcdID2Sgxe2LKkUFvXNAaz8UpTHZxH/AyOBF6e71urUd0Cu30b?=
 =?us-ascii?Q?Ubyo2uWuzXD5J4a6PeoKTebudLVWRwFKTfROsqobivTXDG/GSyAbEfocIs3F?=
 =?us-ascii?Q?APKLeAYAQ4tcrKqolxA3NByUKcE2mGDWtQHvwOMfDgOV6hFOcqtFk9uyVJTa?=
 =?us-ascii?Q?vAxyZi9LQbeK0g/Vp+J44EWg53O/r39xkwjLCEF2v9BnIdO9opmqoGY8g4S2?=
 =?us-ascii?Q?Qe0mkxVOAQ56AemDeBtzboaY6IUWTtV0yLj92F8B9+vrd/ysOGb0u4ASinxV?=
 =?us-ascii?Q?z+/tfHPL7mXj+BvT48plvPLgbkritx46H3r2JjlIRAv13phpE46B4M8U/Olo?=
 =?us-ascii?Q?w98RgseGbxjzro9lZGL+u3C1C4NFXFJE14N3Ehd4XglKYNx9x34+CLALHEHs?=
 =?us-ascii?Q?7oouxkpXNgFlP8XjuPKAbnv3u1sfT2v4jGGAA6gp4Diw4nrnD0YR+Vp+FCJS?=
 =?us-ascii?Q?4kCsRp7T6i9SFdwwagS68N+omY/R503I602X5Fd+SJnXmdFhq5L9scr+Ee2s?=
 =?us-ascii?Q?57LkaJrfveHby79eR6EwQrVobspFBBdaPc6JBXseKuxXHXbPz9A1nvpDiRrx?=
 =?us-ascii?Q?6hJdNEI3mGKXwEFIzd+HVcRa16xdz29x260DrtaPDe8WkjZNx7wTGi9Phhk3?=
 =?us-ascii?Q?6qIRs/Ub4Bvr/rs/fjiFs9Eib7Oi3vWS80E1lXlViYtsbXp6zuXJmJKkDTzC?=
 =?us-ascii?Q?hZnGTxITv0tCCXp8/SKKblutyVpGiPnE0YshIHYxeVhMBxYSHcaeq9B9XmVC?=
 =?us-ascii?Q?fF0yXcRRJ2tQarFrTNS37ar0eqipUMxBe07KDpN2c3ir7g6gqrDA4u5ahkEk?=
 =?us-ascii?Q?NfzTF5hS0WOmq0ThN0ZH6/QK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5699.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf82e31-11bc-4da3-1a10-08d95349f2bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 11:05:31.9575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4M0F8idlUKwsAWukc+llezGUNY2TThccvDXdtCyCYp49X2Yx4E3TNuKJ3qSu7yczkJXZdEiyfWe9rPtMS4E0Y4uCsP6uW3GctqTiD085srs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5478
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thank you!!

I shall fix it in next version.

Regards
Lakshmi Sowjanya

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Thursday, July 29, 2021 12:47 AM
> To: kbuild@lists.01.org; D, Lakshmi Sowjanya
> <lakshmi.sowjanya.d@intel.com>; linus.walleij@linaro.org
> Cc: lkp <lkp@intel.com>; kbuild-all@lists.01.org; linux-gpio@vger.kernel.=
org;
> linux-kernel@vger.kernel.org; andriy.shevchenko@linux.intel.com; Raja
> Subramanian, Lakshmi Bai <lakshmi.bai.raja.subramanian@intel.com>; Saha,
> Tamal <tamal.saha@intel.com>; D, Lakshmi Sowjanya
> <lakshmi.sowjanya.d@intel.com>
> Subject: [kbuild] Re: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl =
driver
>=20
> Hi,
>=20
> url:    https://github.com/0day-ci/linux/commits/lakshmi-sowjanya-d-intel=
-
> com/Add-pinctrl-support-for-Intel-Keem-Bay-SoC/20210718-112204
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-
> pinctrl.git  devel
> config: arm64-randconfig-m031-20210728 (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 10.3.0
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> smatch warnings:
> drivers/pinctrl/pinctrl-keembay.c:1147 keembay_pinconf_set() error:
> uninitialized symbol 'ret'.
>=20
> vim +/ret +1147 drivers/pinctrl/pinctrl-keembay.c
>=20
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1097  static int
> keembay_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1098
> 	       unsigned long *cfg, unsigned int num_configs)
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1099  {
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1100  	struct
> keembay_pinctrl *kpc =3D pinctrl_dev_get_drvdata(pctldev);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1101  	enum
> pin_config_param param;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1102  	unsigned int
> arg, i;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1103  	int ret;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1104
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1105  	if (pin >=3D kpc-
> >npins)
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1106
> 	return -EINVAL;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1107
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1108  	for (i =3D 0; i <
> num_configs; i++) {
>                                                                     ^^^^^=
^^^^^^^^^^^ Probably
> num_configs can't be zero, but that's what the check is complaining about=
.
>=20
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1109
> 	param =3D pinconf_to_config_param(cfg[i]);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1110  		arg =3D
> pinconf_to_config_argument(cfg[i]);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1111
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1112
> 	switch (param) {
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1113  		case
> PIN_CONFIG_BIAS_DISABLE:
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1114
> 	ret =3D keembay_pinconf_set_pull(kpc, pin,
> KEEMBAY_GPIO_DISABLE);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1115
> 	break;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1116
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1117  		case
> PIN_CONFIG_BIAS_PULL_UP:
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1118
> 	ret =3D keembay_pinconf_set_pull(kpc, pin,
> KEEMBAY_GPIO_PULL_UP);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1119
> 	break;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1120
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1121  		case
> PIN_CONFIG_BIAS_PULL_DOWN:
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1122
> 	ret =3D keembay_pinconf_set_pull(kpc, pin,
> KEEMBAY_GPIO_PULL_DOWN);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1123
> 	break;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1124
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1125  		case
> PIN_CONFIG_BIAS_BUS_HOLD:
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1126
> 	ret =3D keembay_pinconf_set_pull(kpc, pin,
> KEEMBAY_GPIO_BUS_HOLD);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1127
> 	break;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1128
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1129  		case
> PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1130
> 	ret =3D keembay_pinconf_set_schmitt(kpc, pin, arg);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1131
> 	break;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1132
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1133  		case
> PIN_CONFIG_SLEW_RATE:
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1134
> 	ret =3D keembay_pinconf_set_slew_rate(kpc, pin, arg);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1135
> 	break;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1136
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1137  		case
> PIN_CONFIG_DRIVE_STRENGTH:
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1138
> 	ret =3D keembay_pinconf_set_drive(kpc, pin, arg);
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1139
> 	break;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1140
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1141
> 	default:
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1142
> 	return -EINVAL;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1143  		}
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1144  		if
> (ret)
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1145
> 	return ret;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1146  	}
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16 @1147  	return ret;
> 57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1148  }
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>=20
> _______________________________________________
> kbuild mailing list -- kbuild@lists.01.org To unsubscribe send an email t=
o
> kbuild-leave@lists.01.org


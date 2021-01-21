Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E112FE515
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 09:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbhAUIea (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 03:34:30 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:64616 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbhAUIdx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 03:33:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611218032; x=1642754032;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=Xnwi5bCnNoQlclRZuKjaI6DvBlaodbUwsv4e1gail8E=;
  b=TUEXWAEXLxHii6Z4ch+DkEJXVlaj0h6TkzTeMGIs5FA5+yrYm0CgWLIA
   eT6k+SZCwpFIdmDvXy8B5ZHqEN7eAhwLj/EJtMyWlgdS7n7BsdCOXLV/H
   eG2Dx5KHMvL/mTCq1JMK+MsvogM/x9/r5vgJsMObB8cM0Q7sDTWnkm6rw
   GzeWAUQe9OAbLMrQzI5m4hNKTz3toUJXgMQO+nHQnx/tFjcttLphjQp6A
   inMNCqQl0y82nbZ2HPhmU6XV2WXhPT9S8kseEPEGp8LRkNzTGlDSubAk6
   38TroSahsAowqByHbnveWFpsbX4vmBhJSTcObpeJgkptCSHiJLYUH4Fgh
   g==;
IronPort-SDR: 0bwJUBxnXXp/y09GOMIycOGdsAm2rTUSOr1YM8eIjNWcjdcATnkB7bOnHcbhi3fyH06v76XKOV
 Gby7L3w7R4QGqBHyR4rmVTdbU2tQI0ieYUgMuHceiRzpz78jbvBjGLvyEnySYX642mTiHn0WxB
 ReeXW/wTyl9xh5sMASbgSGb+vc0e/UfEMZJmYWJyra+KoPMWJqM7gfLujwu0kDsTTy/DaK+M22
 rXIyfQ3B5VvEsFONu8Lq762fp3FRaxsBmcdsutFpeulqFiZ4ALs3cF62NVka5YbzIxhqFqZes9
 rJw=
X-IronPort-AV: E=Sophos;i="5.79,363,1602518400"; 
   d="scan'208";a="268302521"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2021 16:32:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlWor/KxAgcgzl2nU7A9l9BsWJ/B5v6iK6p1Dry9BLGfOQRNPipUhl+2yrhNiDguLSHuzjNelnM5o9l2maei86rS8PHR6khUncc4MCS1Ht9PoxzWROdkk/w8w71MG37lxRzyTUSkdNdr7xBzGF4gRC0ViuXUH9bKIgeNU7IRRnqXislkgNfGCfFtQfQOtz3j6StaIZ9q3gy4z8cKfAeKBsR+AtlwykElsEUyIwnLFRPPrfQQyGxdj2YlUVdpk/5e/7KhnU+IaagtRUjAizZPqstVQott1QMW1go/JZ9dlwsdGcegRoZCiHQac6gyieoMVvYY1Aq0I1/zeDjD/o2hKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65f+QvN9lK9/6kfmEPnEOY/TYzLYi8KLy6M+LESaC7M=;
 b=KV5aKVbk6wNlncDJdLg1aIHKp0QNuUDu7BNCMQ6w9kI8bBKSQDEZfz2vHoiZZY2tDWo/TPFidSaivy5xbhGAwedmuG59jqf7I8AbG9lpk7Jh8Ux3x1lmbkjG2vdSelgWh8CLthF70WtvwVca788oRTSXey+73RKBZpqSPAIAXemD6YfGvozVADP3lIk0OweTRzWY8ei6MXL8c8sC9OSbMBAOjX2dqTmt0J8BSJSjpVZmzyp5x4zAEvP19g7UPCeL8KNxItgME4f16UlqiaMKVuXcinUGMdfpFJIzvs7ecavbdxZ59MPGhAg4y0dy8mmu9ZIEb73ooTmXcl2mx2taNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65f+QvN9lK9/6kfmEPnEOY/TYzLYi8KLy6M+LESaC7M=;
 b=tzWbAK1FMx2PmIQKsz1URtmz5V+5ba93yIEFJQPES8E8+cWvAKNVMxeNfmYzz6bj1pHdsoQYMpQ7Z/tG2qyBIEdFPECGtuI7thyGUpI4SWttofLu7/CUL+dmfNLhjQRDcgMDe1ueg2B2Mr/b9WjkJTLED5NM02fP/fubh3urWK4=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4916.namprd04.prod.outlook.com (2603:10b6:208:58::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Thu, 21 Jan
 2021 08:32:38 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 08:32:38 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Topic: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Index: AQHW6H603OQs4bGY/kKjaT3KXrLhfA==
Date:   Thu, 21 Jan 2021 08:32:38 +0000
Message-ID: <BL0PR04MB6514439CE158BAB4253D8903E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-8e7e9405-6528-4fec-8d2e-41eb7ec1362c@palmerdabbelt-glaptop>
 <BL0PR04MB6514410C82DBB40E645112E1E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
 <CACRpkdYCiiuBUnJGMea66Q=MEmp9hpYMm3bwYZg2YnSUbAPGFQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:b0d5:1d20:2559:58ed]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2689a7fd-37e7-4595-3b72-08d8bde71c4a
x-ms-traffictypediagnostic: BL0PR04MB4916:
x-microsoft-antispam-prvs: <BL0PR04MB491648EA0E8338B4198056BBE7A10@BL0PR04MB4916.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UOjNBXjrWylatyBQkBR5gCKDTcZRICcmYERjvaQ3LT9UwbiNFJyY/2WiFHRc4qCi5u29ApaMKu2PHkBQ/iGwn5kohWMmiXZiAsGI3H5KODDUfjV7jRrV7ViOsnoQMtDhqYa6QA/+fDb2dYCv+hSa7ZNZykg5cBL+zuJzZRTIAlrdDNHUFNawMp59uIoIqLttOxwLfBp7Oruc37q3bNY3i0QGSuW9qSrEioE+wYmpiMIXS4XbjbalRf1xghVlbUasqUo27MS4nZV3DBNCBOimqRerYzmUFIu7hyXqXW5j3MEp4e8h6azBnwXL5UGmx233B3FKWMAfzw0kT1YHogL1yNgk5RW3PANmjGNnu4XRXgkj3EhBdJswJT1rU15H3mY5YBnQeIFfQm+XaNS1Bpdq8SGj1A8JHzQk7ZCLjEyBWOTBIKAVAxKGk2rYMKK+rrjub0rgXe3bp9IDxkNNYjKbMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(4326008)(8676002)(83380400001)(186003)(478600001)(53546011)(316002)(5660300002)(33656002)(6506007)(8936002)(91956017)(66446008)(64756008)(6916009)(66476007)(55016002)(66946007)(7696005)(2906002)(71200400001)(66556008)(52536014)(966005)(86362001)(76116006)(9686003)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Bvc4Zk6p0eB7d4udOM70wpTAbIxoG8fUaYOiRnZJ7QhzwM1LEBsM1TZdgFqN?=
 =?us-ascii?Q?X+eoj1P6XhARwN0CtE07xpmkf+bHkQqlKRf5R0FzUBA3iEmsK3YHNxGgBmlb?=
 =?us-ascii?Q?5Mo3zIWclo83jwjw0lqUiugeDGl/OQmCf4tw5rCFrc6UMB9NjhOMmaZkOyYx?=
 =?us-ascii?Q?BajBeAlIIIzCxUnZcAtS5gwv+FBqWod8zcwQztZ6raM0O7hIcQzaJh3z9GjT?=
 =?us-ascii?Q?E/9G3dE/KZSRS2jxTTvtBcP5lssslsmBY4PywBkrDt51Tbv3Ux5FHFyPiBX3?=
 =?us-ascii?Q?ynu+hcwQIewPEhEEvilD8uGM7J5WoUX4aPeDqRXM1DbE6EllGnLmo8xZPAHz?=
 =?us-ascii?Q?l5Udt2nIHcpTOFV/2suc0o/4M+MNApPXDkMDe/973JCpSkQ6K14xcaiMiqU+?=
 =?us-ascii?Q?/I46Nz4f4HXpfBzXIf5g2jakSy+r+tGqqO6DbAYSMGXHuP3XmIRHPMGZvYZF?=
 =?us-ascii?Q?yDMQkD/ZoqyWpWkwd/8nU3r0jqsbMIsbV/3xTznZFc0Bh1C7tqLnHYBSPU9I?=
 =?us-ascii?Q?St4eSWJQLQCJZT75f+HtLNaPBYiT7gu6R0dSJPnGdDMXF24PoweGdwk4Y/ZI?=
 =?us-ascii?Q?o8GGmQVElSOlCmy/LXuBFWsSFA2zrWgHfBqGjb7tbiNM/pYvDGQg7xsDTO64?=
 =?us-ascii?Q?4oIYRCe7l0DIIwBXdDITLQ/HHvkZ6yvoj/kJAFfRbvs3fK9i3H22HJK9tcmx?=
 =?us-ascii?Q?HsB1EBgiz3sBuD6zwxeugGtXfhLUMW/lQjsniRB31upjnR/w7ATLL6rZ8DuM?=
 =?us-ascii?Q?HJ4nAfbe6nBJaTzuhMNrTtOEUtb7xcSdGoP1DSbuWM+jNczQOZy2ZqddA1Bn?=
 =?us-ascii?Q?fHDG40BFBVhpUwI3bTZ0NMMxxpWWZp/vy9PUyHQ8M5KbrQrpCBhdIEtC5Eqv?=
 =?us-ascii?Q?2PmrWBectu5eB1A9WZePPoVlilqYvLraSF16qA9KFOr6bnltgxwaYYcvNvNj?=
 =?us-ascii?Q?RmsUnzQsx9XiX4/h5I3JwftmkjigscIKX5pydmeZZGzC2ZAKCpnx7UKhdZUw?=
 =?us-ascii?Q?eG/WDOP/gQSyzfd4KtjsjawLWV0yqdWCALvNEZF8bR08wqtEOgfbIMRuUCz6?=
 =?us-ascii?Q?gHPMHXzdCa4IIsXxBxsLL+3XOkbihbeQdxU7jxXmnvdm15E7gwFiRtHmKK8F?=
 =?us-ascii?Q?tc0+daRF/eGRIbEry+FAK/gF8QNRc/itQg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2689a7fd-37e7-4595-3b72-08d8bde71c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 08:32:38.2000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HrrzU0ycHzK3IxQIiFpYVc2Sf1IwSUXZhB9v1Je1a8Gru/R/XeUDTC7DJ3pDH6vmmCSnmTvEM/ZQ+uaZ2z0oAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4916
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021/01/21 17:25, Linus Walleij wrote:=0A=
> On Thu, Jan 21, 2021 at 1:15 AM Damien Le Moal <Damien.LeMoal@wdc.com> wr=
ote:=0A=
>> On 2021/01/21 3:21, Palmer Dabbelt wrote:=0A=
>>> On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrot=
e:=0A=
>>>> Hi Damien,=0A=
>>>>=0A=
>>>> this looks all right to me.=0A=
>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>=0A=
>>>>=0A=
>>>> Shall I apply just this one patch to the pinctrl tree?=0A=
>>>=0A=
>>> That's fine with me.  The DT bindings are in riscv/for-next, maybe it's=
 best to=0A=
>>> take those as well and I'll drop them?  I don't generally like to drop =
stuff=0A=
>>> from for-next, but that's probably better than having everything all mi=
xed up.=0A=
>>>=0A=
>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/=
?h=3Dfor-next&id=3Ded3137edb31b86702511e7ad12b4abe8686b6805=0A=
>>>=0A=
>>>> I think the line that touches arch/*/Kconfig should be dropped=0A=
>>>> then, that better go to the SoC tree.=0A=
>>>=0A=
>>> I'm OK with you taking them along with my Ack, but if you don't want to=
 that's=0A=
>>> fine.  Just LMK=0A=
>>>=0A=
>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>=0A=
>>=0A=
>> Linus,=0A=
>>=0A=
>> Please let me know which way you want to proceed. If you want to take th=
e patch,=0A=
>> I will resend without the Kconfig change and move that change to another=
 patch.=0A=
> =0A=
> It's fine to proceed as is, since Palmer already applied the bindings to=
=0A=
> his tree, just apply the pinctrl driver there as well. I don't see any=0A=
> risk of collisions in the tree.=0A=
=0A=
Sounds good. Thanks !=0A=
=0A=
> =0A=
> Yours,=0A=
> Linus Walleij=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=

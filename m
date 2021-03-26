Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF22D34A2B0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 08:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCZHrl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 03:47:41 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1223 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhCZHrd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 03:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1616744853; x=1648280853;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=h4p2jxvYCsfJoT+kVXMvTOCkZgGwTia/AoibRNrIwkQ=;
  b=EmSrXPKJ1/8xOVkJqEJTDI7lu0oYc2a95MsET3BKLTKM3+hDtOFBHHsI
   BGv1r7s86JKdPtwAW+k0uoyBKE2edJeJ8QWKj+FXyKJB/zsl6wxQGnj5S
   lcJRLeS7J0T+8pV8/BDXK75g8YunH2++R+e7OiRvIiioylx2ltMi0srY/
   qaVGyrUp7+0rJ46NWt0ECoqxFG76qT4apd7ymS5G/Xvl0AUml66uGxe+3
   /9eOfEiMDqGORgXPq531azAMUqZjZcbI5zL2D49Ga448UHboJaxNYxAoR
   0jsQMTlPVJZ0sTbswFMx/6p5BW/NXS25DeWAccGPxb1dwUjDy4XQMWxG+
   Q==;
IronPort-SDR: Wjjs8hVngIiXK+dMsd675HgoOjSh5KlDPgFbMyXDtz/e9SsUb9vZFlYhLzei9G+CA6eWb/5Svp
 aWmFTCGCZkNo/eiN92q3pEqoTshstqhsIgxCM0Xz4l2OJOvcdTazd/rJVGfU7cHAn4CJ+NbOg5
 Et4oP+rACEwjq2+Krhzrw0VHRoEiwylWMIVF8BOivMeOMCN8vGjk8O3m8g60r15N2MD8Pxv9eR
 FSQ89TBa8ZV+sq04e+400gcqd6tP4nvYp6rtRzvTdEp9FVR4LoTE+A5D/6tkOq4OthsT5K5qtw
 8ig=
X-IronPort-AV: E=Sophos;i="5.81,279,1610380800"; 
   d="scan'208";a="163064259"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
  by ob1.hgst.iphmx.com with ESMTP; 26 Mar 2021 15:47:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4K/S3GUTGV+SQW31mRexyPt8ytJVKFe5hE0b7ckI/Uw8yiMJP1ERh/V2ATsHajnjHdTXX0/uCajnzVEzZTcyv5XcfHUlcBkXMWLeYk+kEhfY+n2FBOEonA9nzprX9OKgd1h2XxjCbdbwrDw9rfehxDzUvQD9CXssMuRIiMBsKsIACEOJAJkMz/gqN8Nt2R34y8gvLVhRpTL5rWYAGjqWAAiUnwewSSzmWyHPJ6cMFEs9FpSpCOcTA3biOeDadTLeScf3BMdkgd1gdoCopkR7nNScqAt23hW8c0Ir6tREG9IVgKqOIMQXgc0qZUnaMvGoXBMyF8cQWk6ed9i/a8pGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYmBaW02JHkmfAAKIvFJ/K2pJF79zbdFymWoDa9Batc=;
 b=kKy9Wsc9tZ5Vhs1M7SwPF4ZnwTpz2s2Ks4cDYua8SoWAB60eLfAMDqCellhUpXf+UDl//gCxaO+Us8CFQ8YjjppczxBBs7ekeB8CFlJw7qKo+8E2tG/wijcTzPCTFgXg/brMTT8cYwKztWOWYvJThezzp+/k9NgwA7D27AzrEMnDcIHi9XM15lNRcVdRjO3J5RGA5DpVXDCdBkMQPAoxd/Vhfi/IVHRnXetCJd4e/caOYomw6lXj4yYLoeRUeQcY29EsfVyDngx6cmLw3WFcq8xMjkpGHEM5T54KeaQ7RVsFBQ0aCqV/jzUFDGGqZtkjYKGIOZp/FLFFHfdBePpgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYmBaW02JHkmfAAKIvFJ/K2pJF79zbdFymWoDa9Batc=;
 b=c8n718Ssqb2TVj/Dj4GC/kOBCULcgJl7S8BporMq8sk3oLV8QzUYKJfe/Cy+/4MoeoFWAk54TDok+0+9VONciRkRs7GbT/lWsS52ht9gnxycvpEHGI8fEPs3UzA3VBuYLKLH+uGl4+t2dFweLb0F4S8CBU0y85UrYDIKXupzr+o=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6538.namprd04.prod.outlook.com (2603:10b6:610:35::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 26 Mar
 2021 07:47:29 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::1c4d:48a6:b00a:1ce5]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::1c4d:48a6:b00a:1ce5%3]) with mapi id 15.20.3977.024; Fri, 26 Mar 2021
 07:47:28 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] pinctrl: Remove duplicated include from
 pinctrl-k210.c
Thread-Topic: [PATCH -next] pinctrl: Remove duplicated include from
 pinctrl-k210.c
Thread-Index: AQHXIgoRlHFMK+uZcU2ly2i2YremGQ==
Date:   Fri, 26 Mar 2021 07:47:28 +0000
Message-ID: <CH2PR04MB65220AFC59558EC54B9FFE4FE7619@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20210326064804.3262477-1-zhengyongjun3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8539:9440:76cc:73ac]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: efd2f01d-87fa-4dbd-c550-08d8f02b67dc
x-ms-traffictypediagnostic: CH2PR04MB6538:
x-microsoft-antispam-prvs: <CH2PR04MB6538FD8CE7475B537DBA49B8E7619@CH2PR04MB6538.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4o4WJZWmIsr/MQ30Q3KyHZ7UhNKy4eTCV7PCYA2B9518UM5PmncRjdimYzp1ynNK3UhPprm09Njt0BbwjEBZkvvNIYCYy6Fl0LShrMgV2LFUKRJ44v3NDnsbStnz6Jiy1Oibvdq0D1PcI1PUBNaqLzDdX9d3SJlOxmh6pkHGEEIXzevIFHrRtkU/FkOlWfbxc7Unejg6/OdtsywyV7qG+C/MGIymoeoy757VK6zm58meH1BjO2Qk3api3RzVuD4pynIc6NeDRGDQhKlbYsm85X5aLADKxEF0UabcBhitD7CI9RnEiNiKWv/w6w7PiabRrkPYoMEk/jeXKBrn0+CQ63kEfgWlWmlt43QlGXYxU7W+mH24hUSx7+jXr6WZ6quCl9NnUDK5J/YUNTFF/5Sz6P/E8kEsX+BeVklcBglMnxCOCO9zr/pPXVwYvcXp42izrABgXLUo6Vnl/2OdfWQvVc5Sbwqi2/56cBKizfQ+ljpqfQexfR5FpaXnHu74qK6rLIwRjq9FdjHpgt8uSFeKqTlzM0Jc5zGvVk+8Xg6oPF5bgYhJ2tIZhaZi6DDq2R/Ztleb7YHgFAP7uQB3sFoMfAMLtIIdvmymcMfpSh64EAs0hhOaAiT2sETvywGp3YDVT3JeNFDzbPxMtyCDSgm8CIHyDNOkTH0qA1x1abSwEzo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(6506007)(53546011)(9686003)(186003)(83380400001)(7696005)(54906003)(5660300002)(55016002)(4326008)(52536014)(38100700001)(66446008)(71200400001)(2906002)(4744005)(33656002)(66556008)(8676002)(316002)(8936002)(86362001)(478600001)(66476007)(76116006)(110136005)(91956017)(64756008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?EwyLMDElTq/MysmuF7sYbjeZb4Zd+wzMGA2JzTF7Lx2Cs1LsBHJykjVuOV1T?=
 =?us-ascii?Q?4SfR4qt63M5zQuHYNcFBM020mZSf1CareYoxwmC/fVYKmvVPcAo/bKrfiItl?=
 =?us-ascii?Q?Mfx2J0nRnFbaS0XRVGAfvZBPvd/36SE/x87OXkuQo2lkfNEoAzRz9+4PMXuS?=
 =?us-ascii?Q?rPQD+LUhpGpObBaY6Gkj3X1oBnAhzOS1W6UBUXzSV67aI0xb1NwiisAm4dCF?=
 =?us-ascii?Q?vDyeT10BuyrkuBCfpUqnS8HF6CWbHlRqhYG1IZG5PYpM6w85nn358+L2WIzz?=
 =?us-ascii?Q?ZzFAiOH2FwIZ+b1dvxVEkdYwvkBEfKiAoLSN1cCRUpK9qpvVxXyiLGoLZI7F?=
 =?us-ascii?Q?dfVVDoi7MmVCf8yxdg19CCzzqG9psCf2qWxFWya4kMyJDqYXUbBZt8xUbRmF?=
 =?us-ascii?Q?Qce/eAR0WY1Nv4nCQzkhVypX3wDusFejAEjxaDrgZnHxTS/BatTDy2+wfz6X?=
 =?us-ascii?Q?EgZg2N+HiQ38Aq+y3yZwzuFCEtgt+P9fsmfvaAgD0CYPJvmO1Ov9O3076RWB?=
 =?us-ascii?Q?qb11rYV2KSkFLj1KJ49jxhabaWEuGWUvfSBz9+8LIfAjBbCdRtNIDeYMXVVY?=
 =?us-ascii?Q?ad6lNRoDB4vTK5cpfVk4kkQIX3SqNvnd8EEGrYJ8HQvf0hFARx+5f3TDH/Cu?=
 =?us-ascii?Q?nqAAzmbMT1+DYUX9XChhSLv3Wm4dWjdRVqSHczeUAiO4dppkZb/oJFR0lbFU?=
 =?us-ascii?Q?r6NkKuC44rhWaki1ur/3TVbv630ICw9lpVnB7AB2pfGcYHCyzVdII50hjUHk?=
 =?us-ascii?Q?vtNr8RADeo8i+ozjTgIveW+CodrDsA2ZxHgb2rvU3VOj+AEFA58HOLStlIxa?=
 =?us-ascii?Q?o9DjzIW2WI2DXP3SDGs2lywZHCX8a+dIZuGc0XYsj+cYSsI2knw1Xz5BEhmp?=
 =?us-ascii?Q?ARdlbYvmLMLUVFfrLidqOFLdC4jxbctRdd0MGm1V4aJ5Aoh33VzIJB/fAMPQ?=
 =?us-ascii?Q?j41P68c8nOVgNuzGNmmEJv+UAp+AQyxZ0Q/wnACXKLsmyh4PiCkS2MaNZjf2?=
 =?us-ascii?Q?BE/ohZ3Vk5qu5mJExkISH9fzEc8prBBg5sGlgp3qZHNSJEkvh1WoVRcX8J75?=
 =?us-ascii?Q?QM5ZKSfLDejtO9V/Z8TMgvE0y35Hcr3n2FqslnRDJorEjg+9l9eJE9vtXhQT?=
 =?us-ascii?Q?+veXiEKUMX7y6HwczVd+I8FmkM3cJX0q1NU2VkPYD/wMnNrubz5074OJicvv?=
 =?us-ascii?Q?oFCMEQLKsrycyK6gh3dCFJhkOt69yEuBicE+tVb+p7BdgfBu4NHB21mwUhFf?=
 =?us-ascii?Q?BPoH6sTuDrSm+4u7cshgswAHKSh/3o1+p5+4XtZzOIrYQbtPXeDoJpuS5TyU?=
 =?us-ascii?Q?UnXNAqws25UZkd9N1iNUyJHgPTC+Mx4kZx2pkJsVnvNuvI4gvSUYxI/PFKGD?=
 =?us-ascii?Q?HdEkv0nrYgIqTntjFOACNi35IMEBfU4qcgDOX8TxqgtpQxyEvw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd2f01d-87fa-4dbd-c550-08d8f02b67dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 07:47:28.8462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uu+IIWeJj41eNgZe83v0By7N1eO4BCevEzyGXfSjB5iTLVniBjkb9Is678GThKqeJKysA7kEPy0diowJMZnIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6538
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021/03/26 15:34, Zheng Yongjun wrote:=0A=
> Remove duplicated include.=0A=
> =0A=
> Reported-by: Hulk Robot <hulkci@huawei.com>=0A=
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>=0A=
> ---=0A=
>  drivers/pinctrl/pinctrl-k210.c | 1 -=0A=
>  1 file changed, 1 deletion(-)=0A=
> =0A=
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k21=
0.c=0A=
> index 8a733cf77ba0..f831526d06ff 100644=0A=
> --- a/drivers/pinctrl/pinctrl-k210.c=0A=
> +++ b/drivers/pinctrl/pinctrl-k210.c=0A=
> @@ -15,7 +15,6 @@=0A=
>  #include <linux/pinctrl/pinmux.h>=0A=
>  #include <linux/pinctrl/pinconf.h>=0A=
>  #include <linux/pinctrl/pinconf-generic.h>=0A=
> -#include <linux/io.h>=0A=
>  =0A=
>  #include <dt-bindings/pinctrl/k210-fpioa.h>=0A=
=0A=
Linus already queued a similar patch...=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=

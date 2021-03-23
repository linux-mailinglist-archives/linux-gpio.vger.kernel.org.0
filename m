Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3DC34551F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 02:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhCWBu3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 21:50:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:34907 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhCWBuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 21:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1616464211; x=1648000211;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=HcV/aD+VFzmilUAfal6zKlnXmKOdBHt4u4BK2w/aSTo=;
  b=K+oFjr5JKo1S3p9sNvNS+b7ySNd1nkifI0ZQ4xk94nTFQ0RaN595X+6u
   JLI3htRHGclurq/AM+nkD/ZeHayQLcTHJnlMDpGpLL0R3Uk/3S9VIB0HT
   C17HczcWDGpIlfD8QMkbx5QGB4wbCE1J0WBHiXXwms4bcDDIf43LwiCpp
   RvSxx8RDaQs/hD70XNM8MPEUNJyhS0qs9rO4LvKtsvZFMGrfPXckhq2nn
   N1ZHDz0EiDx1DoBoC0Py5GJ/32xmASJ5Od88BpCv78jRSO0OjcAaaq1GA
   CQebIJBdZJhcmEeSN52lWsmbaJGtjw/YJ/Zpr+5mdlc5wWKt2ZTUCJhdV
   A==;
IronPort-SDR: X0uwr+WVN4Adl1JL0KnrhN+zdpHZ/CpSWwVSLKb6uJfYxJazcfyckAfvBeJBhVaIFk76gCGNS/
 vRxSNSV/DEq3bJ/J+/os2vRBoJzOLrzofQ+DRYndD/+cGw23Br4A7SB8MdsxrcdbWHLeetOuah
 Ur0V1EzLlshxYsy+m1Tf6E7ZX/AhXVNmcHiyfCSaTiVEARrDa4bsCvtMavItqKmrXzIJ0PTFUh
 2OmedbLRFTGfJdT+TrO0q3JCVy2KC5RtvgW9AvxURhgyVe+2HWwPKZq2P4fH0zT0LvRbgdj8c8
 7/8=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; 
   d="scan'208";a="162748361"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
  by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:50:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj0nxLLj2Io0uzk7OWKNR+221wNLgsI4oDScCXFYCj5vANJ2FrqRBxICFEnrtsQL2ocG8xzJaGqQ3uMrWFKxSURShV8oQmfX0kGGOj9xcQBfVCWGaYq2y/MJNdRsmBOtf3Ekiw+jxqhvoTsYDPN6VzcgU9YpJgibuCV0kaWqo8uAYYAjWkD/Sh8FhJOd+jBLFedF+AI2auq7sgeFkJtntTvoQKCZ65bGZBkSu03Fc6aABDnRcVsI+3vZG1UKCqywxcqqdrpv3f69tFKx13DgWd+INgZs+UCUdxxMqdplQl+GmRXeyAr55eOxiWzsC86UuUWJq56Psa0hud/ZaY8B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoKyNpvpyqDHDBW4mg5oT6KniNYK3Sbsc+Ldcey3gk8=;
 b=EJCdguR1SJaSfXK8wCdwyrbjEAHp9AhjTF1bzlcq5AY4a0hcAhWvqRvX2XGrQiG9a/Rr59anbYyl+mT0vYEMzRr2YtIuMcsYZSwn1OrpBfrmd94WHkaKVpT0B9MeVmN/455nS6hItYHtd3HiNKGB1D82MNgsIuyN/JODApzYCkk7Rya1DHE3OLIJlnitqmUAhTGi2oSiUjaRAMQp7XVhG50EaVdTiwIfb4C/22XKDqZBgg9xfbJ9ajk2h2lIjzscmm0uqvj5dMG3ncX5iJSYczzXWc1x0sO8V8ltFDKPlCLzisu1Tm4PwvymM/5IJi1U7x4ScVvsbpjmUgyZdYGvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoKyNpvpyqDHDBW4mg5oT6KniNYK3Sbsc+Ldcey3gk8=;
 b=QyPEP3rZlIdPnNhxAqU1t2nw0RZTwgZfKtwHa4ReHX40Y6BVvZcW+MsLY+l3JbfgPCI5xaqQMwVBqqqcYArYFV6lyhPdkWqSuphW0/Zb2Y9rmdxJu/PoW/oWbGD4ihghHJ7bgACsNOjwmiqdOJJR00KMP8Z83KzUZYXOp07rxbc=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4739.namprd04.prod.outlook.com (2603:10b6:208:48::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 01:50:06 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887%3]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 01:50:06 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Wan Jiabing <wanjiabing@vivo.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "kael_w@yeah.net" <kael_w@yeah.net>
Subject: Re: [PATCH] drivers: pinctrl: Remove duplicate include of io.h
Thread-Topic: [PATCH] drivers: pinctrl: Remove duplicate include of io.h
Thread-Index: AQHXH4UpNyri6rPE4UuTaZ9qCWr98w==
Date:   Tue, 23 Mar 2021 01:50:06 +0000
Message-ID: <BL0PR04MB6514CC42B4BD551A7C2C77E0E7649@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210323013727.135571-1-wanjiabing@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f01f:effc:52e2:7eda]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9db72f98-8046-4bff-1d9a-08d8ed9dfbd2
x-ms-traffictypediagnostic: BL0PR04MB4739:
x-microsoft-antispam-prvs: <BL0PR04MB4739711EC7A7AC41B1125AA6E7649@BL0PR04MB4739.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ANiNFGxsxkVVd7orRPo9byPGmeCquP+LK3boa1qiPZ9nQHcUFR0rokzC5s/KOP4YjxgCHUwQTUuAvzsXvJ6Y0ebJrWZz604SqbRy4/e5sDlc0BWKRyu753eYTIXqHOZ0d3gXX2HnQFt0qhesGgrGBEJ45OQsP1b7/m1JPQK5VJHZrcfGobHVL5fIxuVt+pF48vzAivAOn5x2UMW6jZyKr07xI+tlA2cnO2ssxCSVd2vGzm99EEwJXwpTqJ1plrsKDFsSZVpminpmxGhkE+flRiTy7tFRDD5/f3uHR/SKMkCqhs4hGiyAExCJjSWo9w6tBbtmKGurNjVPv7A4i1RjN2gHkIL+80QD4c4yWPMXfxfkoDxiKBrbf0yL9Auv2n7qQfxfMFGXaer9cIgKxsZNeTMjps6HliFl7Up7AyTKoJIn0INXKTQPuRTC+dCPLPew7OsYT8GgiVYvuP8weBZZqIx9cMiVq8AAWLVjetltnLMfvThT+YLq10o19luhWMi3SxL5aboK3U8HDQQXmQO6bercEPCTn6RGlKUkIWtE1Vl0XBrEosqv13SPLJTVeEiy/ouPSxtwTKrEj98QsXWyu+cd2QwhzFTFl6v1SnUxX47CJFIz6Pz2reIBvFaJA7jgXJD8BCXpTlmp4EwxDfagai345qaKc+iSvF8xxMB3NBQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(478600001)(4744005)(8676002)(8936002)(86362001)(33656002)(53546011)(7696005)(2906002)(316002)(110136005)(186003)(66556008)(91956017)(66446008)(64756008)(66476007)(76116006)(6506007)(5660300002)(66946007)(4326008)(52536014)(38100700001)(71200400001)(9686003)(55016002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LzH3Uy/rYY3XatoNBpj+FUOsq3XfvPu6ev+az5T6LBFlsZ/h/AtX2SowZW7K?=
 =?us-ascii?Q?YDqWy1UzNukOACnhCgCSHytiCeigk9cSRhbHpZs9tF+6PsV/x+4QIPsq8krr?=
 =?us-ascii?Q?iQoeW57Zxe0LOygJvxBBQ8vHmt9UI+hs5qRMDATX2hry5IdgJIFLK94qTME2?=
 =?us-ascii?Q?5CoD4eKN6O03T4qx+DJnB5oYwnpc91iQrQDHlf3Qaej2V61vQdkIokBLjjVK?=
 =?us-ascii?Q?ruVXxuRyK+ZoLOyr64tH+gpIoqwf1zF/qy6zrV0AxRvtkc73ibXKdeEKJg05?=
 =?us-ascii?Q?cTWt6LyxYii+s5YNAuyLo/yr/A8g/4gj1lHjA3Iy8Lqo/96nk4GNs3iL7qvi?=
 =?us-ascii?Q?iQtDc81fEDYMeoM4Wa8bqSWjJ39+KoAEUpDT/Wx9fxWlSAsKEP7XVTM9vcxt?=
 =?us-ascii?Q?PzAk+yGHEC9u5Q4VU1WYw5xYsboJFTi9ypO/rVcF76bU7P8cA04lFt1iXx6l?=
 =?us-ascii?Q?8/9JbetjG8HjIdXze91N8+vAG5LXpEMbZJz1+gL6js4yu8YF1GiFkr0n3cUD?=
 =?us-ascii?Q?GjnXOG7Pn7bP1T1vvu8SVploJJtD98DRB/eQeRjjGJvjLcVNHh6neby3TGws?=
 =?us-ascii?Q?OwNhwfWzOQrxqnSNMR1wW4iAtDXgubAXQpuVVMl+CwsvH7dpZtLZHYTRwTZx?=
 =?us-ascii?Q?Mj6k7kM7/OgxKv2zktFeansuHTVfqsnGtjpDdgsKHAlHiPyKIhZL7HZM79Yo?=
 =?us-ascii?Q?N72g11XQc4q/B9etLo8Orvur+gLHpaiUqxj6awAAFLfbnTywqt+xpxzGC0N/?=
 =?us-ascii?Q?83kUo9Cy8pqUtg7tG6H2NIymc4kEzv5YwBuijshEhWAensdIynu8k/PWvHls?=
 =?us-ascii?Q?Px+hEzG+eXj+8OFCS0QLHScnJp1uMlJw9fqqzBUUIowgDoNuZhA5VeP1RR4h?=
 =?us-ascii?Q?IVPEk2H2+cNrALNHHEcCC9TkC6M+WfXNHmnNs5+G10DjRkTy2GHPDugNvWVY?=
 =?us-ascii?Q?7IYwrUpLzZmBpVd0VcqACn/b+mJ68nydp3I9sHpDjGY6EjEtUgYkEq7cUo+d?=
 =?us-ascii?Q?1KoUk8Y/TCDYiFTOLu5LwWZoYXT1vhtl4eoOQ4+RMYszUAELAZUR8ytrxcCe?=
 =?us-ascii?Q?Da38/1OSpNZfCP2FObLywDoH+9XkV9lYM/rAcRsesg9pTeoL22PXiQldYoFj?=
 =?us-ascii?Q?mTIh0oav6Ui9sm3IhXUQOSWwrqdpwIWlICX3+4RvMieca5kh9/6PI19YpTl+?=
 =?us-ascii?Q?/al6kBeXmurdLtwUJRFa6w9VNnSYA3A9fnu+YFiVcusKVy480O4mm6ObrW1L?=
 =?us-ascii?Q?448tFl5GupVyJJgXQOPn8r89cJpVIqn0ywDhGozFgPwP0mOmMfJ5FTXbBMJl?=
 =?us-ascii?Q?g7CsKZqtiuC9Xh1pAmJCjiXoMyxnEs5DJq9qb5T6TemGVUC50ZCa/aPsHjfE?=
 =?us-ascii?Q?UbLmR9mvMU7flOwJ2i6+L+2+Weh4Ap3Ip7uBymGb7CsfB84nqQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db72f98-8046-4bff-1d9a-08d8ed9dfbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 01:50:06.0686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEv5w0JYspk7M/IOxlkd1lFW/MkRXjXQSo9Xe2tYNGHIITjvYsXFWomb2IWl7zSbPwzKYtTSyF7RgY28PQzO8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4739
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021/03/23 10:38, Wan Jiabing wrote:=0A=
> linux/io.h has been included at line 6, so remove the =0A=
> duplicate include at line 18.=0A=
> =0A=
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>=0A=
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
>  =0A=
> =0A=
=0A=
Good catch !=0A=
=0A=
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=

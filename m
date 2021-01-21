Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD0F2FDE5F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 02:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389446AbhAUBBY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 20:01:24 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4661 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731598AbhAUAR3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2021 19:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611188248; x=1642724248;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=PtLYrUpUDtnhds0JLM+y786Ec7PXyVEywKpe8rPMFdQ=;
  b=hSmWovf6Gkw7tguZzC9XHJg5tiQC/wWLRtAM6F0uraOr0ckF3d/vifEV
   rJqNwdeiPwl7GXKIIX/0kv2UXUT9zObJv8SSDls17U/9fNyKh/v9SUCQY
   qHlNlclFf79S/GRofZbvA5oYxLE6AsnAsd+eXpmx2H0itwFh5qCH5KX+v
   yjsfr/n9wOvJSynoURbBz1ykjm9i3glb1eYN1WsrUGIAF6yjCdO0dLdid
   Pcey/feMo+r2gWvWXxQatQPA6zFr2zAc/AhxyvMeF+pe/MS/m7aqWU9Vv
   w1Cmbzc1//ltI1mE+G9WWJ4guwaibd3SJhALWR1tTQkl1vaFOIhWffcr5
   A==;
IronPort-SDR: whae6OFFHH0WHoGiVWjQeWCPsED1zeYbS5aHUUnVO45G1g/WoVpbY+f59vn8YYWjI0z/DiJZ/l
 hUCgfKrL3N3mbpH4FAT4UNHmfQSejWttvD3ntb7J/FoUtLX9D/vmGbUkRhIZq/l8J0hQ6rYKvx
 v5Wk8rJtU+S2fiNO74//FFzRM58jgcCO3zt5/R3poL1B+AaQLkz+TlQqf42OgRgf6YDFdK8E4b
 GGUkAD9RYrjmCuy20qlKDvwD0X76ncO9eFQd92k1Cm20m9fMYHw9JiHfNvou169MmSd3GMPhRE
 T9E=
X-IronPort-AV: E=Sophos;i="5.79,362,1602518400"; 
   d="scan'208";a="162383705"
Received: from mail-sn1nam02lp2056.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.56])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2021 08:15:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCAz7qJrPilr8QqInWuDC1LSUcK9gX6WnoTz1aaBky7KQXfdZow61nELax1zq5HipsMqo8uERSl0C0b+OiK90W0jgSS6bV9kb7SzfPbnF7UpWz7A7yFCDDHFFVifrQPspBbVybgcTTQy5PayW6BzV1LwLmkxwNvF2wh6AtIhMG9Bs8xOrrDTwu8WroUcenDDj0a0CEAD/dSfZfsyRXkaaBVPCHK0G+JPCB6SNGHPTaUwiaDfoZ+NrPUNik6EWDVl9PHnzG5PgqCzppjWBxpuhN7wqpBpsHX66xRJs4dFfJzZKX6v2nUWf2cGYF7zdIxB+aN1/QRxU3R+IIgybIJOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8V/xaMKZEzfYlI1xMG4skSBzyI+or3o76gTDP9v4dU=;
 b=lOnq5EcMAxK/P56lMIOfzRuzJfevKX0iU3RQs4UTpp1t0f0JNDZyQiYJp/PHjBCBhOjeEtUIyONoHD5Heis1km9XrdVj20MyXHUyPMqDpc8AhrRkbi79yI5scjkgXgM+tGjuHCUzvl50E38gpVKwvmmfZM+8AU4lp+8MOf90H1qVu7j+rzM1fxMjoq6dqPGs0pLk7wJvA7sLxam08EBC8yLCYUAmdhOrVHmYnnEz/qYxYl2pZcQR3mkMteJ2rlawrUWYXhj383c6mHXIJcXAnFyTLQYNqDpBsRNI7/TllqQ3jzXtEHe9hOmoI1QqtTTjrtDi5ACuNSW9srKsx7Rstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8V/xaMKZEzfYlI1xMG4skSBzyI+or3o76gTDP9v4dU=;
 b=uos4KOjV+82lice56VgyDwauKuy/9bF0ta1Hz3rhp1Mk9dE34+uwwW7wJVEXDHA2adavy1PxbNHvEAdneJTTp5ki3WyUQcoPspTe1SCI+7u7+LqGWhUa/JgiGWy0hV7Ctnsw01RYaLzMY5e614G39LqAn28nKXw2g8oF0CC4568=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 00:15:54 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 00:15:54 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Topic: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Index: AQHW6H603OQs4bGY/kKjaT3KXrLhfA==
Date:   Thu, 21 Jan 2021 00:15:54 +0000
Message-ID: <BL0PR04MB6514410C82DBB40E645112E1E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-8e7e9405-6528-4fec-8d2e-41eb7ec1362c@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:b0d5:1d20:2559:58ed]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8bd1a2a9-9e46-4d44-cb03-08d8bda1b7f2
x-ms-traffictypediagnostic: BL0PR04MB6514:
x-microsoft-antispam-prvs: <BL0PR04MB6514F189A7520559798802D7E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fqTdle3U/EpIxIgc79VE5YmoORcq+v7XCWAPc3Q7flFwCV21ktbfgB7p2otrLeIv8Klzx4LU18jvTCb7Ahsyw7OHui/UK0vkc8iu/nLo+W6dtmOmpUh0PrTQf5eUFea2buR5oR/23OKP+WP6NOlts04x1AGtKXj8t1fj9qexsYpHtT/eYAm/Q/ZIKtlI6L3JcsiF5RP/NOSgu9ua/vt0lBW7wb4WlXhazFIYkdW2ut41jJNbrZu9RE6pEH7vnv1bdBKC5QPyJCfOU8PfrFd4EW3XLkd6iy14o2usJqgIkTjQN+lQo6ltdVH7EYg+u7RL/VbNcNe5mVsLWKEn9zuMELN2D28F3lnUjDVS8Yn4WncwfphPOt750PpQzgqsvsxlyEFneVV8oaJSHVIhlE3XBJNMeio8XStcnUUelpLkhxSoupY3GUb/xGlUJfLt0a5waMFE3dQJcVP1K1V3OJU6Li8Px95IeUVb14U09zOvZH9yx56iemc6OACRwZzlRT6O83AqrWDVz2FX/6yH30hS1KRn2fQYMzRGgkcccJdeK6RbIC2eFtSe2wB2XmjyByfpgVXu+lfiJZo8vYvZ8kKEl0Lj/0C2BhAhxT6E+z4xrA0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(66446008)(186003)(55016002)(4326008)(9686003)(66556008)(33656002)(66946007)(966005)(91956017)(64756008)(66476007)(478600001)(8676002)(110136005)(7696005)(6506007)(316002)(54906003)(53546011)(8936002)(76116006)(71200400001)(2906002)(5660300002)(52536014)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Jwcm8Ih8u/PTmFbAgC495ARrKlGPSD3sCfShoKLStKT2Y3dYkRTNI+c4lRM4?=
 =?us-ascii?Q?ZwRFm0bo08gciqdbnJn8bzGq24JxlZoBq4M3AeLhxgQO5sfwb/rfzxGPVbXh?=
 =?us-ascii?Q?bRTH6hbWGbGSqpiu194K1Dw+R/N6n7GEtePN2z0HiImEtrV8fM06fYAlfSQb?=
 =?us-ascii?Q?wZlhuEksSJyathwpiJ3RimaGUSszTVjPS1H+zQrnewZYq7sa9jRxSiVmKf8k?=
 =?us-ascii?Q?ZAX+4V+lDZxH5SyoUBPrIsrJvNqMo5AYoaf8S8Kcy5kNvwyodiuwNMz4CvwM?=
 =?us-ascii?Q?tQjwXWBM71hq1FNUDlb/cEveol1wPvNk+5VUXuHp4hAC1v3S1mU6looM9CFB?=
 =?us-ascii?Q?r0IANlrZCLpImSY8asN8xXhyK9A//c1fQFlmB0GxxEqf+3poKxSyklT3Nsuh?=
 =?us-ascii?Q?WMnpLzsw/UXnYzJWhzL7SwK2TUbgV8Lomi3X34vyt7gcBYIarJEvf+e9TxUz?=
 =?us-ascii?Q?i5FKB8AbUmFQBqU7Nxtu1TGkj5IxfumHP5nuxQFbQ+L1B1O7dyjKFf2ISwA+?=
 =?us-ascii?Q?WV/wkdmeu0pAXynSOTZ+ERX8zPihP9YuEz3frMJTWqZrDw4JfkbEkGDkXDUG?=
 =?us-ascii?Q?lQdVmoL8Q7Vu5m5z5G+06nXbFMhl/Wjb1Liya/KEN5/gi9AHSUmMeCwEPQKV?=
 =?us-ascii?Q?adEVzmUtJrTqRfQC9iOAQwhp1+afeUf5IPH8CUZS1CqPY/gUYrHNFeGJNa9Z?=
 =?us-ascii?Q?MA6g5dKLmperSFzdtK4lzRVVevFXUMn85g2aONjI6oKHlX27HLZ+AwINmfMi?=
 =?us-ascii?Q?Qbj61CL458KJ77fcxUVual1xqES0XTszKnPsHtQ6kvKaPCh5S+c2Xuy/AcOC?=
 =?us-ascii?Q?qTm5eBPjMAH0OVI2e5mngoq//wJTTV8AqiZmsR8HmJSwCcoGoAd2qYJc/SGg?=
 =?us-ascii?Q?C1Qfk2ErOx1fNo7c7/8Y8QQpJ64ZptJ6sFzh6IOOxtPqqVB12rYByqA/8Fd7?=
 =?us-ascii?Q?Y3lhZfOAv6UKUbNxgzCBczJ7YrnskFPZ1n9be+W2iywGpSSZzQsX6k0YHzyf?=
 =?us-ascii?Q?qsYAcqVGMrOKnEDYX6ebTHgLkRMmQWX32n3qc5qPmuAmmR9sqE0KwqXVFugF?=
 =?us-ascii?Q?5644BB9R37dbQQCKYhauD3uIm6otcVJvVaAQLK3lIMEox+wdW4h4ZmFerRHY?=
 =?us-ascii?Q?TelWc4cjnlRt/Br8zmfQPtCoswSlRkQJFQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd1a2a9-9e46-4d44-cb03-08d8bda1b7f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 00:15:54.5296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BiyTlbrtUwY8GSCrr9yZyk39ILx8D9/Chwaxuyf57xKq7jwQlU++VgWIUhydNaI2OxvvPKatMARTb+/O1L4sSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6514
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021/01/21 3:21, Palmer Dabbelt wrote:=0A=
> On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:=
=0A=
>> Hi Damien,=0A=
>>=0A=
>> this looks all right to me.=0A=
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>=0A=
>>=0A=
>> Shall I apply just this one patch to the pinctrl tree?=0A=
> =0A=
> That's fine with me.  The DT bindings are in riscv/for-next, maybe it's b=
est to=0A=
> take those as well and I'll drop them?  I don't generally like to drop st=
uff=0A=
> from for-next, but that's probably better than having everything all mixe=
d up.=0A=
> =0A=
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=
=3Dfor-next&id=3Ded3137edb31b86702511e7ad12b4abe8686b6805=0A=
> =0A=
>> I think the line that touches arch/*/Kconfig should be dropped=0A=
>> then, that better go to the SoC tree.=0A=
> =0A=
> I'm OK with you taking them along with my Ack, but if you don't want to t=
hat's=0A=
> fine.  Just LMK=0A=
> =0A=
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>=0A=
=0A=
Linus,=0A=
=0A=
Please let me know which way you want to proceed. If you want to take the p=
atch,=0A=
I will resend without the Kconfig change and move that change to another pa=
tch.=0A=
=0A=
Thanks !=0A=
=0A=
> =0A=
>> Yours,=0A=
>> Linus Walleij=0A=
> =0A=
> Thanks!=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=

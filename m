Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A5233480A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 20:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhCJTdy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 14:33:54 -0500
Received: from mail-mw2nam10on2054.outbound.protection.outlook.com ([40.107.94.54]:46438
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233585AbhCJTdk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 14:33:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DApxXoB2/2fZXeAl+XKK6Eeif7cpxZvn2yZMuUiW8FelMFnFhKAqWC+Rj+VCKgjC23LmsXxP+LzmwwC2yg+IQVbrSFdjWH9EQesmyY05LQEqEpWY1DM5OuQRtQ9Fc2v+04Ck74dCrkLuO/DpshP4/dmCnbYvnn1s6i6i914oSOyyCX2pvx1EoCPai3hTvWHaGiJUbMqqGAXcL4Re4uiwM0UPHqYLw/3Ck5PldxXmBLQ27l+yreM9YJ4QropI57Gt4Dz9UgqHZMNpU2nqGUC1wwLyHCu+1qqv8TTiB3Ep2wgR3q+ma0M8J3R011YkApsW+CEapYWlT2mDtDh+JyurOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crr9xxm5ibVIogm5M8FYLnbk/EXqP5vhQx/44/Sya4I=;
 b=UrGazX70FTOWYKKHIRHEPJ16/rfAlbrh++XZ/h/qkjsp6UyUSQH8ScxYjfsZDAFiG5ad7of7TMtJc9XyD65i0ZrLGtku6fKrTexmyRh6DmLpHZOWN1t4gsaY7ILtujsGIwIAXb7XXRpjR1QQ9sEcyfyhGoYKlZpJXy48/xCsdyUyMElxYtWRI0vxGvsokSRBJcC+j8W6/q+bYWn3pk04bjWyWTtIDV2nvqFYTTPOx+ttsfxypyz+KvQP3537guZQVoSc+pJr/Qr662siM1RUaRZKwbkZHCoyhTVPGv0GhckcS3M9dmMhFzALNmB1y4mytWoK3eeuiHZv8qYR2B6qrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crr9xxm5ibVIogm5M8FYLnbk/EXqP5vhQx/44/Sya4I=;
 b=NmTSPVvCbWrymJvdTikWCgXFHwXuQDcXPU3jnn3ZV2ygXST4gOxuDOwB+Brys1ik6h+9NjIz1aX4LxzgTBtsAEMGknezRyBLrZu4QdGE7ScRKghVMQn2OoPXvVVs01j1hJ2ehfqBsFcF/IMg7GT+zMoA5Ztezc8Z0WDxJkYiDxMh35hiVVoWjxrHzCWPegS3DrSHUseOekNR3ao9GELwRMcAz9+ejilsG24NsaZujkS9jTWrFboukpey+SoVNK7bvTVqqFlMMZUTnnFyO9z28yERME3IZzniFqTy5VmbDz5K/d5Os70uiC+k9cT6b/g/Fafn1tEdejrQymMC+G4OZg==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by CH2PR12MB4278.namprd12.prod.outlook.com (2603:10b6:610:ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.28; Wed, 10 Mar
 2021 19:33:35 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::38e7:ecfc:3efe:1f0c]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::38e7:ecfc:3efe:1f0c%5]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 19:33:34 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/1] gpio: Support interrupts in gpio-mlxbf2.c
Thread-Topic: [PATCH v2 1/1] gpio: Support interrupts in gpio-mlxbf2.c
Thread-Index: AQHXFeGt7rMqUWNppUSIWKn9ahnxg6p9nEIw
Date:   Wed, 10 Mar 2021 19:33:34 +0000
Message-ID: <CH2PR12MB389510C7614B621BDAF6CE3DD7919@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <4d45ea382c7a74f7e351b7e1e1f670ce41bd65ab.1615403091.git.asmaa@nvidia.com>
In-Reply-To: <4d45ea382c7a74f7e351b7e1e1f670ce41bd65ab.1615403091.git.asmaa@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [65.96.160.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4085729-2ea3-4f3e-67b2-08d8e3fb6559
x-ms-traffictypediagnostic: CH2PR12MB4278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4278519AD97A285CB387EB37D7919@CH2PR12MB4278.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iylWEywAo9FUzQc8ShqqUED/XmIHjcCBvKGELy+i0uTAblrkQ9oLDHqPzur3jKjMssd8GP3oBsLZRgsIU8znEFvUOLILQg4DKn37YAmH/ZlxrQovpqFH9e3hs07sGXGBg0XtpmxKCMNYUi/VYhdh+HlJrLgszduI4i1CwYx6CqIDi1FVLIL59RR8wECSABuuvcC/GIVf3NO0GwrJ1M+/R4xV0vdko7xirc+QYhMkIkSc4nu9bMv9Nj8bIuq21kk+xLJ02Jj5zTDhY7DJMrjg7ZApLXMzIjzzbdKkpEyr/tYFqczKCkuNWULSZsXWmDFwxqOAawUNa2kvfBVFbgM8Dkp61kuvYH6CJHQfVzXLH5oU3nc3mZ2wjOHGjj4iPtrXB1zWoIcCM6HHpTpol68tVkVkCoMU7bK04O/0QFLdETDbuDv64vTIC6M/Ft2YtDjy36fXUu+qsj9VJvE29I7PUGnY7DcNYRLAw8dNK3twGZtvMtcirVO/cPiET944XaVCtof4Qg4coIJu1bodnOeViA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(66476007)(4326008)(316002)(9686003)(8676002)(66556008)(54906003)(26005)(8936002)(52536014)(478600001)(5660300002)(110136005)(33656002)(76116006)(4744005)(66946007)(71200400001)(66446008)(64756008)(6506007)(55016002)(186003)(7696005)(2906002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?650BaVDByewj/rpF3gDJhImdyyDDb/NRIQGChAKF2hcUhi4HuxLdv1SFcw9e?=
 =?us-ascii?Q?wEQOZN0qaTx73E9MBK//wYlFzV9mqIwuXILHpBPS39qn976c/z9Hd7Yuz3B7?=
 =?us-ascii?Q?t0wlK1pzaBn2uj+ncUzV+XMXy54o/bJOivn0HBSM9GgZEnOch4UYv0gLl75u?=
 =?us-ascii?Q?TFXtuRlnqWmGy3oARahaGAaWwXh+KqAIhuNV7ceDrSlsfcpjD2Rylj0hEmN8?=
 =?us-ascii?Q?xLawTyXjtXEeIjozneqqDiZJuIRsPnpYpiqLansFYEooK8iP0BPBpdnxN5ii?=
 =?us-ascii?Q?L/sT/1VTeuRPvg6f1G5Qs7tJAJ2v2yeToEt8/5u7f7HeGh6Og/8nVExjqUeZ?=
 =?us-ascii?Q?IMpbwlMm9Ah5+6YCuO9afYzxmifFjf/F0M6zfZfc/A+2RznT/cp2bkU+zynp?=
 =?us-ascii?Q?3BbtaX2oSOPnrvV75gQS0T5XhV6QF40Ojs9QoSKDGD7R8fj+t+2n/BLd3jCt?=
 =?us-ascii?Q?aVnnW8QEq/SLMACnBZiSpvmZxPUCeUltuCwIZhfT11h0RGdzp1/We6yfz8ti?=
 =?us-ascii?Q?scd+Tz6j4IgfS56nNcypdHV0FGKJ9YLfXDuDOz7xS0ZJLtu6NutpWPEgEdwO?=
 =?us-ascii?Q?1ovTT+eKg6+v/cGanB2OuTv7R1i+iJm4Gr5js1ELNQq7ttfXWi2htRhPdWSe?=
 =?us-ascii?Q?TUar1c0Z+2H/WFgMdcFh2zbiIXrg4S686teE5+CKrt+J8bArXwBJaL5hoXy0?=
 =?us-ascii?Q?NUJWAjl3nFI3S8vtEIpwJRccH5/A+ATEGjLEIyysFmlPrFaTkO4VUBs9ChqN?=
 =?us-ascii?Q?X6qXIkrldcHhhqW8CyTNeBmWT6/wVaL2R/GA+u31IP4hAQuO8HMy9RNdy6ud?=
 =?us-ascii?Q?1AyNqIqsDKSHy3V/lrh65TaIoEZZqVhTxi/b32n0NGJylj0XnGgm7Unnad23?=
 =?us-ascii?Q?LZHDBmrxXvIdYkuQDdwyAC4LyO3//w4LSo066Yv036VDVqnMLHOCAgoUdKCr?=
 =?us-ascii?Q?ljsZqmcTI0vbMUH2orPS9kccAc7TSAmOeCIJgyRPkMl90wyBiy3sDb48k3Wz?=
 =?us-ascii?Q?WUkll/xTpLu1Hgb1ifsqpW/aFPY04V9b7sqBURxjb0H4FiKLcHW6OPS8BADL?=
 =?us-ascii?Q?apO5xWxJekTQhGQLmmx39eLtKwBCjvsTZrrHPEt4PAI0YgLHndA3NHKmbWIS?=
 =?us-ascii?Q?ZgnZ4KdWfx6tpg6JMAB9cqVtW+mnigqUMMOF04RN4nJLykRLTheCohEoyOM3?=
 =?us-ascii?Q?4oG8yV1t3AjxK+tOb/2j+LWqbPshBz782Cr4eNgFT3csWQfrilq+2DnBWZWm?=
 =?us-ascii?Q?lJkZYx1ziPAjJ4ABAcL4s0fRZJO57J7YzcphVotk48PS7rAopImoALaXjjDa?=
 =?us-ascii?Q?QMbQd47Eqs+svrkPh81or48y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4085729-2ea3-4f3e-67b2-08d8e3fb6559
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 19:33:34.9030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xA5AhajUIYY1uOp/CkSVg4sYhWC2VuflhjElweWPg/y84FCKzeqtv+wapd3ln1OvUqWkY2dkEpETyVH2Vsnp7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4278
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi everyone,

I apologize for sending my second patch without addressing your comments. I=
 didn't receive any email about them because the email used was "asmaa@mell=
anox.com" which is no longer valid. It is now "asmaa@nvidia.com". I don't k=
now how that happened since I submitted my patches with the valid email add=
ress.
Please discard my second patch for now. I will address your comments and su=
bmit patch v3.

Thanks.
Asmaa



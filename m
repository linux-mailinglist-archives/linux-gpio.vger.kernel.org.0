Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E22E956BCBB
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238756AbiGHPEZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238634AbiGHPEX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:04:23 -0400
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947022CE10;
        Fri,  8 Jul 2022 08:04:22 -0700 (PDT)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268Cb3wu018265;
        Fri, 8 Jul 2022 11:04:12 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3h4ubr4mhd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 11:04:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAhh7/u5WHA9ysWMvBRXL/v3M8uYCUZJpKIZXwbwxvz4XcgCScJG/beB9h8Aig5wBw4D68zB4T3pga+7J44HFUc4mYJuBZdjNRsAv62Nk0V0nMuOV/iPMxNPGN5WUgcGUJ/lNXsFdgVmVq/zYF/ppreND7Dq6rppajdcaWQCTwxAL8WYd49lqII9uZXrpOa+RYc1+qr6UWOhZ2L0PBl/4WhjfQNypbbSvxB6QlYht1GJ4BycSNgkjI7TGOgaWnUJlb/UN/6kg5FEkRmP4kVZjmGCgEr3AhXkKnAyA/PepjZcAb8GNeMCCH9hbtM90+YauoukcX2r8YyOWc+t5Ppcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce8YfKjBLRUiTs74X7HP9xt57syhmgnyEQDer2i2mz8=;
 b=TZ+o+WNpwtow9j0pzLgcrNHHNHLClms/92HegLBCRBPhbRYKEG+i1m8cv5WPIcEA/nBbwkQjfS27MajDJhC4JZRxN1B8bPcChWZK1W60YDhNiJ9EOYYrsmdhHHtIXEcjl9LW/O7i+0kzVvVYWAWeTU8pFft2qfquAJS+cto3vFLT3sxO0vKvxoZu7GcIO9YR79yt8hY9KZOZ35cKCBrc94u+gXriIPortvmGTg7XU2+n6ca829MunCbbnpuT42eCy8vACjhMFAmhXQVAqzrR4iIii3DRSdca1d0GKjEQVLwCfKigY59K5dG/MdMDMadQ5nU/TdeEU96yDSZrrphIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce8YfKjBLRUiTs74X7HP9xt57syhmgnyEQDer2i2mz8=;
 b=AfieaRFsJm2lQipNPlFmWmfWZUNoNHRwXZ4Hu4uj8mDm0xEGmfPOU4g+GWxWSntw2lbf4QT7QHBB/YMybGde9PkEk3XSGA7Ki/Zcyygj1Q9wR5HVKNgWQaKQyP08pG6c8+fzwZdu+s5ShPybMn0+jf0+7yicQ3OCA7s2Hsb6T0c=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by MN2PR03MB5037.namprd03.prod.outlook.com (2603:10b6:208:1aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 15:04:10 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0%8]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 15:04:09 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [PATCH 04/10] input: keyboard: adp5588-keys: add support for fw
 properties
Thread-Topic: [PATCH 04/10] input: keyboard: adp5588-keys: add support for fw
 properties
Thread-Index: AQHYktr4ZYv/lU3lSk2KL+wp4ccBRK10kY4Q
Date:   Fri, 8 Jul 2022 15:04:09 +0000
Message-ID: <PH0PR03MB67864AAC5B51C36E6FB202BF99829@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
 <20220708093448.42617-5-nuno.sa@analog.com>
 <CAHp75Vcv8i-XXarjA=sE_gkG57ngADLrsG2=xA71zOfxtfEUCg@mail.gmail.com>
In-Reply-To: <CAHp75Vcv8i-XXarjA=sE_gkG57ngADLrsG2=xA71zOfxtfEUCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE16WTFZbVU1TlRFdFptVmpaaTB4TVdWakxUaGlaall0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhETTJOV0psT1RVekxXWmxZMll0TVRGbFl5MDRZ?=
 =?utf-8?B?bVkyTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTWpjek1D?=
 =?utf-8?B?SWdkRDBpTVRNek1ERTNOall5TkRjMU5qSTNOVGN5SWlCb1BTSnBOa2ROZDJW?=
 =?utf-8?B?cVMyUm5MM05hVlhjelZqSlZjRFJzUWtKS1dFMDlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVRXdZa3hpTkRJMVRGbEJVbWxYWVhKNFlVRklVbmRIU2xweGRr?=
 =?utf-8?B?WnZRV1JJUVVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
 =?utf-8?B?QlFVRkVZVUZSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZC?=
 =?utf-8?B?VVVGQ1FVRkJRVXB5YWtwSlVVRkJRVUZCUVVGQlFVRkJRVUZCUVVvMFFVRkJR?=
 =?utf-8?B?bWhCUjFGQllWRkNaa0ZJVFVGYVVVSnFRVWhWUVdOblFteEJSamhCWTBGQ2VV?=
 =?utf-8?B?RkhPRUZoWjBKc1FVZE5RV1JCUW5wQlJqaEJXbWRDYUVGSGQwRmpkMEpzUVVZ?=
 =?utf-8?B?NFFWcG5RblpCU0UxQllWRkNNRUZIYTBGa1owSnNRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVGQlFVRkJRV2RCUVVG?=
 =?utf-8?B?QlFVRnVaMEZCUVVkRlFWcEJRbkJCUmpoQlkzZENiRUZIVFVGa1VVSjVRVWRW?=
 =?utf-8?B?UVZoM1FuZEJTRWxCWW5kQ2NVRkhWVUZaZDBJd1FVaE5RVmgzUWpCQlIydEJX?=
 =?utf-8?B?bEZDZVVGRVJVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCVVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVOQlFVRkJRVUZEWlVGQlFVRlpVVUpyUVVkclFWaDNRbnBCUjFWQldY?=
 =?utf-8?B?ZENNVUZJU1VGYVVVSm1RVWhCUVdOblFuWkJSMjlCV2xGQ2FrRklVVUZqZDBK?=
 =?utf-8?B?bVFVaFJRV0ZSUW14QlNFbEJUV2RCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlFUMDlJaTgrUEM5dFpYUmhQZz09?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3259c574-9946-4bd7-0e81-08da60f31c87
x-ms-traffictypediagnostic: MN2PR03MB5037:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sdRN0huNSNkveua6N/yW0/wMwIZp0OqlxnejqcgK+FI7mu/BPmXY+fkZaWdrqyWK1cnlblksBiI8e84vW6AogdNRbVjXMRrZh59SzmnLbCXgPjWipf5bXegIn0eq7KCNL2kZPW9rsCxoCOcMwbTKKSpQ2qevvlpAO+pMg+v2ai54yhBOicUqlMaXYKpN7nGhwo+ZWKeUwrlQB8G48o8r1EUcbjy6JgJL4IuKyLOpUmCXT9jH3Jnz0ilCOwfmS3dXgW0mF/9b6Y8Pt2ZF6QHk2LRF2YIUxnq5d+py7xU0HDMHsEXB54hU9vWkcbYUPVlSvIfSI/FYr4EE4OMe3O+3RsAwGrUMH1VzPrsgqjkECOvgrfWO2jDQiG3QBqL2h0x7Br1sYj87cdd6tfNEobfAy2IlQvMg+Mabk9WCAHTgfia6W2ie5HMkEndhET/gKuvBV8KF74m2IqpyCCSVtKlBv6ZKgMzrPddKtz67egxipN5u7pDmrZ2hXoShb4Ey3PztN3W5k1A8zBvo2IazgSk0GU0mj51wuIGMb4WPcrwmHmmmYpSyqSrqvWL4n2NpSinOIDRvFZPmioT3SWtGkhNBCjEoAKDOgRigGx3vc8dbcJf8P9uT3dc3nEu3WSerkmm68/vJZkPsTJD9GmMttPGhKcd2PkbSJ1zrkk5j7SbzXtrThdsje9WNxJT0Ohf4TyeptpXTZYTcyWpVEoWlcHC9qAygFGSzxXO/rvYeM3wSx5njaqp3ecO12DiZzyiG2GHZsbDHiRWGIy52Eg6ZYxrQT8wWIUPtsbtn7IBsnnA1exB59e6urQetOZhqGnKRNlSL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(66946007)(66556008)(66446008)(64756008)(8676002)(4326008)(66476007)(76116006)(83380400001)(38070700005)(478600001)(7696005)(26005)(9686003)(53546011)(316002)(6506007)(41300700001)(86362001)(6916009)(54906003)(71200400001)(186003)(2906002)(33656002)(38100700002)(52536014)(122000001)(55016003)(8936002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDJZQmJUeHQvN1kvRytzYUZzcitPQXJZTW1oRmsxU1NibXBrMDZNSlNHWmt6?=
 =?utf-8?B?UXUxMFFnOCtpenovK2pmc1hWc2ZvWFA3cVYyTzYwRHQydkEyODViSWplSEhw?=
 =?utf-8?B?WkFnRkg0R1UvdUJrTEdWNy95dGpkd1VPWGMzUllUWDlJeURILzdRTkcwU1R3?=
 =?utf-8?B?S2dqR2RGdG0yRmlzV1dzZXBUWXVNa1V0SkRqd3JJVDdNUFNNY2dxN29RT3o5?=
 =?utf-8?B?bU8vcHNUbkdnY2tPV2FqVnlKNlZVZ2RqUTVkYWk4MTN1SWpIVzE2enl1NUpC?=
 =?utf-8?B?aklVSkNQUjFkRUZZaGlzMmdCV0J3dXNZSFJBTmg1anhXWE4zNHFNSDFUSG9R?=
 =?utf-8?B?NnFiRlJZVDNtUVR5VkVXNWxKRk9XS242RlF2SEduMDc0VStudW5ZSDd2b2RO?=
 =?utf-8?B?NEd6aWR0VWloQUpsbVk0RnR1a1JYK05TUXFmV1BqMDZpK1dUdHMxd08rcXJP?=
 =?utf-8?B?dk9JSjdTTlBhdG11MDBVKzNyQjNQcXZFSGtRSTdIY3M2SGxnaHBQUmtMUFM3?=
 =?utf-8?B?ZmZrd09TYTIySk5EcTQ4LzdkcmpuVitpUm0rMHhGZHpxT05QcEhzdUozRGJW?=
 =?utf-8?B?dnA0dFlSTC9TUHEzK3Vua25aZk00bW4wekEvdEl4YVBkd2hXOS9qbDFuQ1FI?=
 =?utf-8?B?WGMyaW1NOTZ4YkprREc5WE5XRmMwdkQvK2RXWFl2dDdTR0NJQWpWSTVUUElE?=
 =?utf-8?B?enREUXBkejNFU0pYNGl3Mzc3cktibS9QMVFRQkl2UDVDUm1JSG9RTVd1b3Qy?=
 =?utf-8?B?eW0wUGJydUdjbnNMVTV4a1lSb01ncko1Z2JDZ25Scy9zbWxLMlI0bE1UZzFG?=
 =?utf-8?B?WFJYd3V1S2RaemxTNFpCSTl5K1R6YVJ3RnZ6UnM0b240Y21xMlFVaUFEVEpr?=
 =?utf-8?B?NEh3dUU0UzlaMTBZdDRJdnpaNUdnWGRQeXRWZXlnSjVRbmZTV21EaTdvVHdm?=
 =?utf-8?B?YWFCZDgwY2ZyZGt0K2NTWEFFelZ4ME1QN25RS1Q5SjZiTkZaTEhwWkUzYzVp?=
 =?utf-8?B?aXhrY1FKNlFWdy91dDlFbEh3bDNRUlJOT2FQeldVU0YzYjlVekFmaTB5Tkg3?=
 =?utf-8?B?SjFLclNzbVR5aWZXUEJDcEtrSDJ0TlEwK3NjT3A4cFhHZjFmVTluOWZsWWRE?=
 =?utf-8?B?ZHZJVUZBRk5CYmk5NXNvR250UlVuWjF2RnlacVZsRXNTcHh0NTQwQTVEaXhi?=
 =?utf-8?B?ZU5YTTEyTVlLV2t5WFhSblRnR0Z6TEYzRFAxdmx1WWZmaXNacDZxNnlyREIr?=
 =?utf-8?B?dU5aV3ZDdkE5N3VGelE5OHVsQkQ5UmRSM1dmR2hsRzhiTWpjQ1VGNE95cURQ?=
 =?utf-8?B?TlA5Qyt1d2FJNklrck94dXZiZ2FaQktTeFRkeXZ2MHl1aW1FQzVJWDdHSits?=
 =?utf-8?B?RkNoSGFxMytuRTdjOU5LZ1NHQmlIcmM1elFwZjUrVGw4NHNwQThNYkR5MlJz?=
 =?utf-8?B?THNXTTgzakNFS1B5REpseTBlc1FxT0FYS3BxazN3Q0k1dXdLUktGTjhiWWdn?=
 =?utf-8?B?ZkUxQjFsclRJbkd1amIzQUMraVQxOGxpVCs2QVRRZitSR1ZYMTdxbHBvUjhH?=
 =?utf-8?B?TjU5OGJkVkxtQUFYUDd1aGFRTC9vSGw0SU5QbWVYWGRUNUNYNE1PcmgxaGFK?=
 =?utf-8?B?WFQ2aWVHdWE3czJubHhHaTN0ZmVmV3pjZ1hyZWlWK1Z1OXNPUHpwZmg2LzlY?=
 =?utf-8?B?UVVVYjg4VCt0Z2svWG9wc2FIOVBVbTludVhkMXU4SnZyamhXSlgrcDNJUWpZ?=
 =?utf-8?B?aS8yNG1EWnJGSjZNalRvdUJPdUJ2b0xXSEkrVHorWkNsNEdnS1NMRGF2MEtE?=
 =?utf-8?B?OE9yTVN6NnRhNG1FblBaeW85Sm40eW93KzdHczEyK1N3ZmdCTzdKK2dSMlc4?=
 =?utf-8?B?NXlsN3VtMVhxekROeldkTFUyUGpxL3Q3VUx0Q0dVeHlZUUFYKzk5bEEvZEZp?=
 =?utf-8?B?OWZsYk9yVnNlcDE1cmE0SEhuK2hhblpRWnF5aDBIUGx3enhWdm1xL2d6aTUv?=
 =?utf-8?B?Q2d0c0JPbG82YmhVOVYwZGZLa3dnMVJkbEdON3hjdVhHTmU3bnJpWTV3Nmha?=
 =?utf-8?B?ZjlYYitodVBGZGNGV1pkNEwrMCt1dklwNFQwZnkxZytZdkNNdExZOFBNdStG?=
 =?utf-8?Q?AGb3p2aglk2jBGOFf32XokdUt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3259c574-9946-4bd7-0e81-08da60f31c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 15:04:09.8122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azXC7wXzvoEL5dN7R6f6u6SPCVOocKJT1JuHaDdqs7w0+IyRWMaphKxBZCBI1y0vibrBtrkpqG2O5JYit9e0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5037
X-Proofpoint-GUID: d8-wiam1f0CC6qS_7ySjEMEJ6WHj7h8-
X-Proofpoint-ORIG-GUID: d8-wiam1f0CC6qS_7ySjEMEJ6WHj7h8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_12,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080059
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgOCwgMjAy
MiA0OjU2IFBNDQo+IFRvOiBTYSwgTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogZGV2
aWNldHJlZSA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6R1BJTw0KPiBT
VUJTWVNURU0gPGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgbGludXgtaW5wdXQgPGxpbnV4
LQ0KPiBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc+OyBEbWl0cnkgVG9yb2tob3YNCj4gPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxicmdsQGJnZGV2LnBs
PjsgSGVubmVyaWNoLCBNaWNoYWVsDQo+IDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsg
Um9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IExpbnVzIFdhbGxlaWoNCj4g
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNC8xMF0g
aW5wdXQ6IGtleWJvYXJkOiBhZHA1NTg4LWtleXM6IGFkZA0KPiBzdXBwb3J0IGZvciBmdyBwcm9w
ZXJ0aWVzDQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiBGcmksIEp1bCA4LCAyMDIyIGF0IDEx
OjM3IEFNIE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVXNl
IGZpcm13YXJlIHByb3BlcnRpZXMgKGVnOiBPRikgdG8gZ2V0IHRoZSBkZXZpY2Ugc3BlY2lmaWMN
Cj4gPiBjb25maWd1cmF0aW9uLiBUaGlzIGNoYW5nZSBqdXN0IHJlcGxhY2VzIHRoZSBwbGF0Zm9y
bSBkYXRhIHNpbmNlIHRoZXJlDQo+ID4gd2FzIG5vIHBsYXRmb3JtIHVzaW5nIGl0IGFuZCBzbywg
aXQgbWFrZXMgbm8gc2Vuc2UgaGF2aW5nIGJvdGguDQo+ID4NCj4gPiBTcGVjaWFsIG5vdGUgdG8g
dGhlIFBVTEwtVVAgZGlzYWJsZSBzZXR0aW5nIHRoYXQgaXMgbm93IHN1cHBvcnRlZCBhcw0KPiA+
IHBhcnQgb2YgdGhlIGdwaW8gc3Vic3lzdGVtICh1c2luZyAnc2V0X2NvbmZpZygpJyBjYWxsYmFj
aykuDQo+IA0KPiAuLi4NCj4gDQo+ID4gKyNkZWZpbmUgQURQNTU4OF9ERVZJQ0VfSURfTUFTSyAw
eEYNCj4gPiArDQo+ID4gKyAvKiBDb25maWd1cmF0aW9uIFJlZ2lzdGVyMSAqLw0KPiA+ICsjZGVm
aW5lIEFEUDU1ODhfQVVUT19JTkMgICAgICAgKDEgPDwgNykNCj4gPiArI2RlZmluZSBBRFA1NTg4
X0dQSUVNX0NGRyAgICAgICgxIDw8IDYpDQo+ID4gKyNkZWZpbmUgQURQNTU4OF9PVlJfRkxPV19N
ICAgICAoMSA8PCA1KQ0KPiA+ICsjZGVmaW5lIEFEUDU1ODhfSU5UX0NGRyAgICAgICAgICAgICAg
ICAoMSA8PCA0KQ0KPiA+ICsjZGVmaW5lIEFEUDU1ODhfT1ZSX0ZMT1dfSUVOICAgKDEgPDwgMykN
Cj4gPiArI2RlZmluZSBBRFA1NTg4X0tfTENLX0lNICAgICAgICgxIDw8IDIpDQo+ID4gKyNkZWZp
bmUgQURQNTU4OF9HUElfSUVOICAgICAgICAgICAgICAgICgxIDw8IDEpDQo+ID4gKyNkZWZpbmUg
QURQNTU4OF9LRV9JRU4gICAgICAgICAoMSA8PCAwKQ0KPiANCj4gT2theSwgeW91IGFkZCBzb21l
dGhpbmcgaW4gdGhlIHdyb25nIGZvcm0gYW5kIHRoZW4gZml4IGl0IGluIHRoZSBvdGhlcg0KPiBw
YXRjaCBpbiB0aGUgdmVyeSBzYW1lIHNlcmllcz8gUGxlYXNlIG5vIHBpbmctcG9uZyB0eXBlIG9m
IGNoYW5nZXMuDQo+IFNxdWFzaCAvIHJlYmFzZSB5b3VyIHNlcmllcyBhY2NvcmRpbmdseS4NCg0K
V2VsbCwgSSB0aG91Z2h0IHRvIGp1c3QgY29weSBpdCBhcyBpdCB3YXMgb24gdGhlIHBsYXRmb3Jt
IGZpbGUgYW5kIHRoZW4ganVzdCBmaXgNCml0IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGNvZGluZyBz
dHlsZXMgY2hhbmdlcy4gQnV0IEknbSBmaW5lIGluIGZpeGluZyBpdCBhbHJlYWR5DQppbiB0aGlz
IHBhdGNoLiBJbiBmYWN0LCB0aGVyZSdzIGEgbG90IG9mIGRlZmluZXMgdGhhdCBhcmUgbm90IHVz
ZWQgKGl0J3MganVzdA0KZGVmaW5pbmcgdGhlIGNvbXBsZXRlIHJlZ2lzdGVyIG1hcCkgc28gSSBj
YW4gYXMgd2VsbCBnZXQgcmlkIG9mIGFsbCB0aGUgc3R1ZmYgDQp0aGF0IGlzIG5vdCB1c2VkIGFu
eXdoZXJlIGluIHRoZSBkcml2ZXIuDQoNCj4gLi4uDQo+IA0KPiA+IC0gICAgICAgcmV0ID0gYWRw
NTU4OF93cml0ZShjbGllbnQsIEtQX0dQSU8yLCBLUF9TRUwocGRhdGEtPmNvbHMpICYNCj4gMHhG
Rik7DQo+ID4gKyAgICAgICByZXQgPSBhZHA1NTg4X3dyaXRlKGNsaWVudCwgS1BfR1BJTzIsIEtQ
X1NFTChrcGFkLT5jb2xzKSAmDQo+IDB4RkYpOw0KPiANCj4gRG8geW91IG5lZWQgdGhlc2UgIiAm
IDB4RkYiIHBhcnRzPw0KDQpOb3Qgc3VyZSBidXQgcHJvYmFibHkgbm90LiBJIGp1c3Qga2VwdCBh
cyBpdCB3YXMuLi4NCg0KPiAuLi4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgIC8qDQo+ID4gKyAg
ICAgICAgICAgICAgICAqIGZ3IHByb3BlcnRpZXMga2V5cyBzdGFydCBmcm9tIDAgYnV0IG9uIHRo
ZSBkZXZpY2UgdGhleQ0KPiANCj4gRmlybXdhcmUNCj4gDQoNCmFjay4uLg0KDQotIE51bm8gU8Oh
DQo=

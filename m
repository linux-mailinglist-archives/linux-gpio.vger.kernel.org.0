Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 275485A7D47
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiHaM2W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiHaM2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:28:21 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333EED124A;
        Wed, 31 Aug 2022 05:28:20 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VC8UdT027042;
        Wed, 31 Aug 2022 08:28:14 -0400
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3j7g67ju1g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Aug 2022 08:28:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuXLqAz6VYJ7jQy3EUoLMsv8Ky3YhQNIiDqL3HkpfVNQfzO6S7qJd5h6kDsShMJb6c0pShccxefqiL5qhPb5W4SCZ9zeJwsqr34GS/lbQi7DnSFez3PvGI6Q84pMOBcSR2q+ksxOiRTA/O0lYGvyUSPknCy2Sbc1rZCsbqN4hKc3hHQ+CSkLo6/+vQL0IVpx3TXiqDhyKXAzrcdSHS1UGL7T03tLyY+74P5pbqUTUgnWurDsTrn3h19kmxhvfhSRVuvR72r9RUoymE+II6zGOfRRRJhuvrHyyDpoQz8baVm6mgJYq1BKoa/Upm+E+RUqR+HheJ3/DkCx4E+Lfk/CwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol9vc0fnbc91UNsPIhzyY8CxHgRV4q+r6VjHO2wjXI0=;
 b=LvhJfbju7u+I+uSk0i/xFyzHgviVj7qZe5kpUN7C1CXUZBfT1Bz6nV/yTaYBV+nl9HLccIHiXHSxgk4N7xzeh6iIvgIp8+jqHyflGxBtLR49fOiiECb2ZqGgm7QlVX9jXXvUaay12+HVu9dY05xRm5y6RBWR9uI4JBC3bq/QDRPUFz9Ejk2Mc2OXhZxuLt7y5MfZjQT1QRW25bvy5ErSQ0knWPVpYH19SzsXzeH+CNRLOmzgoB0qK5FuUm6KasulhKmkIQYECD/NT5negt2k+40Ijv9bthkgBNaQIwzr8x3PI0+HwmcGKpdWwQfzSW+CT0dz8SDZ4bdfqQWIQG49lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol9vc0fnbc91UNsPIhzyY8CxHgRV4q+r6VjHO2wjXI0=;
 b=oguulfLGW+pcNpB7ZNnWvP0zRfHhqvh8ZZFVeJHgnOO0IW2j4xvMFbfrzlo4kLSg7yT+cj7LOzE0oyA9NWBHGxcmLFoYgzLEi1xDB2LxYznWNLjRlJACjg5u6qUpGFRzpkwcHn4v2jN5pjDOTjUhmO0T1H8owS77rnITD5pqtPk=
Received: from SJ0PR03MB6778.namprd03.prod.outlook.com (2603:10b6:a03:40d::22)
 by CO1PR03MB5761.namprd03.prod.outlook.com (2603:10b6:303:91::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 31 Aug
 2022 12:28:12 +0000
Received: from SJ0PR03MB6778.namprd03.prod.outlook.com
 ([fe80::8c2c:7362:2747:3647]) by SJ0PR03MB6778.namprd03.prod.outlook.com
 ([fe80::8c2c:7362:2747:3647%3]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 12:28:12 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Thread-Topic: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Thread-Index: AQHYvTSZKmIz6dqcpUCDGXTJdkZ0aq3I7xdw
Date:   Wed, 31 Aug 2022 12:28:12 +0000
Message-ID: <SJ0PR03MB67784611071F013DC8F904D199789@SJ0PR03MB6778.namprd03.prod.outlook.com>
References: <20220721080423.156151-1-nuno.sa@analog.com>
 <20220721080423.156151-2-nuno.sa@analog.com>
 <CACRpkdas=ENpdkQbc-1LOG_zRroo4dAFgMfmVzd4=ZK_6jRuRA@mail.gmail.com>
In-Reply-To: <CACRpkdas=ENpdkQbc-1LOG_zRroo4dAFgMfmVzd4=ZK_6jRuRA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE5XWTJNekV3TTJZdE1qa3lPQzB4TVdWa0xUaGlabU10Wm1NM056YzBNakZt?=
 =?utf-8?B?WTJGbFhHRnRaUzEwWlhOMFhEVm1Oak14TURReExUSTVNamd0TVRGbFpDMDRZ?=
 =?utf-8?B?bVpqTFdaak56YzNOREl4Wm1OaFpXSnZaSGt1ZEhoMElpQnplajBpTWpRMU5p?=
 =?utf-8?B?SWdkRDBpTVRNek1EWTBNakkwT1RBME1qazVNalF3SWlCb1BTSlRTbkpPVUVs?=
 =?utf-8?B?a1Z6UlVOSFY2TUdrMlpEUnFkR3BJTkVkR1NFazlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVUnZkM0p6YUU1aU0xbEJVM2hKVTFkeVJrTnVkRUpNUldoS1lY?=
 =?utf-8?B?TlZTMlV3UlVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: a7efee5a-d9d6-4224-fd3f-08da8b4c4550
x-ms-traffictypediagnostic: CO1PR03MB5761:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2kYpLE44wzTbrSw2n/4Vu13pyc6YKcGi1v7yz1+z1kWP19WZkvdrFQxW87LoMXUJ5rDhfXvYIFfxXDx2L1S01qJxLqUTnPIz8v7qJdrUhPojHIqcciYSDYgLEY5IYZIanBLjRlmD+faCPJWMn19cHQHZZEHZyOIbK11UHpRGdUNksjmya6rVLdR4xFv7+y30EK1z4ge4QX+s4pX7sG+iGPchFqtb8m9oZwU+O0xc+++cUzxd5C9paXEH1uWOrFxoSkGvYT/SCzubPdWXfvCyCeDwqDlb+nsRC2MwQDffnP6bZ9MKWhSC23kHa3V67UGy5E2Zqf/KQJBfRbwowyM2cKDcgXtQXEzTUHUCP/s155j8GnjxH4k40Evwo6k8bur6o+ku2lhaL/RyTlYMIG0fdI3l4Njxu8eseFqiDIcJQHPzIPxV+w7S71CtH9XG9OlzuAjz18cDyQFQy7Uu9VMfB3ZgMjectSXwrfNZ/Bb4uiyBzA/AWVUSzhbts0E5l+HQ2FaDOqgSt3NKjsctE46rjaClnPzterSjhSwSFiCkcCHHCBm5NuV2QP0kCsyoM2OfbsSGJ4uHb1X0UadODlDKtnhORd/Pwd/cSGPz1SNgYBN415Ro+7gDVgVatn5lVN7al8pGHeJtoVmzoMRbWEDPEbfnZJwOL2O9fQMJ7HwYZqvKwSGPPdzkbsCTBsoHCn8By+vT7ea0ZF+S56wmx6OylE80u6syUPjzTX2Z7lakyltGCZDD9yKz5WYfK0IbfFSxeUrjDce5zf+Zo3qtys6fZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6778.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(54906003)(316002)(6916009)(86362001)(4326008)(66476007)(66556008)(76116006)(8676002)(66946007)(71200400001)(66446008)(64756008)(41300700001)(8936002)(478600001)(5660300002)(52536014)(38070700005)(122000001)(6506007)(53546011)(2906002)(7696005)(38100700002)(9686003)(83380400001)(55016003)(186003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXNpdmdjZDh1b2QwMS9UNUk5U1RxZ0owN0wwcEpBWVpKOTIzVktUT3lnRjha?=
 =?utf-8?B?ZU83Q0RnMzkxU1hBL3doWGc2KzlyM1JyTE55Q2lNV2J5aEFXTUtYM0RMRDVp?=
 =?utf-8?B?dWNaeGlBbUYyR29vaUpiaWYrSFhtdXRwcTFEbzd2RDJzd0pzVW4zejdOQmZQ?=
 =?utf-8?B?WFRBVE4xZHh3TGxsSlR3VEFJRjdXYUtwc21CYklxczNYbURyZ1Q5NWs0R1pM?=
 =?utf-8?B?L0hraCt3ZUM0RlBGUXJ4UlFMVjJLb2cwdENsN1RSU09ibVBIQm1nbExob1J3?=
 =?utf-8?B?S2NBb01QcWxDTG5mN21JdGJhbmhpRzJoMUtDbk5qcEpWMnVMcHM5VHBkQWh6?=
 =?utf-8?B?YnE4UjV0dHZHalMwZzlaYVNjNlZtN2JxRTVFRFYwSHFWR2NHZFJvTm9HRW41?=
 =?utf-8?B?cXc4YlFuczgvTlVjaFNqZXlMUDl0QnBZbGI3QitkOEhjNGU4T3FzdVVsOGYy?=
 =?utf-8?B?NHNKdDZacjdUNE0zVzVDeVZZeTE5Zk84Z0l6OTliNkl3Z05OZEpCWlpYUFg2?=
 =?utf-8?B?OEJIY0o2RnlFc1lUempGZzYzMVM0R2J0enZFalBGQnBYSGFpNnMvSG1NdTJT?=
 =?utf-8?B?VDgzeXl5MVJlMVBIQ1JyOHpvSElscnE5WTgxenFEbk45dWZaZU1UTVVFa1Zz?=
 =?utf-8?B?SHhmRHp4K01FR3A5OUxmTTkxQllGRExraE5SM0NsRk9TWlI4VDJONGhEYkJV?=
 =?utf-8?B?T1lQRXpJdEhhdGtSZ01MSHF6T3dBS3FTM2cxbUlPM3lpbnNqc3NFcXVLVGFw?=
 =?utf-8?B?Wm5xdUdHZ2FicnJUNDZUc3hMVk02L2FoM2Qxc25LRmVxcTZTbEw4R1dLT2s4?=
 =?utf-8?B?REdVaDFNUDdnbGZjeVV2ZElTQlE5OE1uV3FleThsSm0rSWRhWmpXVGdGb3d0?=
 =?utf-8?B?Rk9lY3ptMS9yU2ozQVpMRlFjcTZreWllam1VOW01VFFFc3cxR21iL1R4Y0kr?=
 =?utf-8?B?bjY5eWczOVgyQ0E0bnkyeEFOaGlzMU5Ja1g4eUVMZDJFRGJSaVh6MEJhZHZF?=
 =?utf-8?B?WGNMdkp6Y3J3MUlETHprSkc3RGdHUWhIdTNIT1BycDJmVVhvRjBmRDN5UUNK?=
 =?utf-8?B?MmxaQkhNbGpyV0JxRmo4Z3lOb1JXTzhqSDZMamgySzY2WGt2cVNnSEl6NFhn?=
 =?utf-8?B?RStISHNBRi9mcnZaS0tCSklMcnZQSVhYSVhubzd6elNVVkVrZ1FCNXNWRkh1?=
 =?utf-8?B?ODcwc0RFQ3JhZVFmdDd5UHlZSkVEWENISlFxNmpxRlUzT0RGQ2c0ZUdZMWFO?=
 =?utf-8?B?K1AzTmdRU0JGbE9OUkZaNjZSWW51dlNNSE43NHdWMnI0VjNlK2V6V2tETFl0?=
 =?utf-8?B?anJrQnRaTTgvZ29nbkxHQVpUcytpQmRaU0xmeDRub1VSQVdJVHVWbCtieFRr?=
 =?utf-8?B?SUo3WklMVUZCblh4S2N3ejF1TG11NnZ5RWd0T0syRno0ZXdwU3hXbnZQamFm?=
 =?utf-8?B?TE5GeFBsT2VrT245Q2NqajQ2TXpXRDREZUxnWStyMjlUa05ZU1pHbGhaM043?=
 =?utf-8?B?czV2T1h3V0RKMElCNElGY0Rad0x5UXpPRTVDdEJ1Tm1qVUV2K1FucGVrYjMr?=
 =?utf-8?B?d1VVT1Q3SEx0NU9FcWlCUDExcGR4TGI0YnFWWDdoWXc4N0lLUkhqTEhkOUNl?=
 =?utf-8?B?WHQvV295WkpTam5YaUt6NFR2ZWtGMVhodW9OT1dHbVZpNDV6bE5qaDJzMlR2?=
 =?utf-8?B?dEZSMTNMRndnMzRJbTg2bVRBZGN1dHIyNXlWakxJTjg3bTJ5R2tzVGgrUWNC?=
 =?utf-8?B?VFd6YmtlY1J5TzNobDZ5cGpjdy80eVk3dFVrbXQvY2pQNG5uNmVHaENnbmhV?=
 =?utf-8?B?Nkd5N09tUU8vRlUzY2sveEw3TlRuU3FTbjhJa2FNR3JxbnlmeXhoVG84bHBw?=
 =?utf-8?B?VEZZMTE3aGFiWjU0TzFNZ1ViSklsQjR6SXlNS1ZNK21scTAzNnVaYW1VUTNW?=
 =?utf-8?B?S1JrSWtLRGtyWklxQ3lzTDM0RkdrbC9wVDRUNDQzK21rVUlzclFCRWlNbGF4?=
 =?utf-8?B?bnhUVytQdXozcGplVE8wN1NxVktXbFQ2SU0xTDZ3eEF4THZjWHJzVzBCUEpl?=
 =?utf-8?B?dXN1d2tEbFp3ZENxeHFyYjJZK2JjNUJqOGhwb0YwMmNWQmMvUVJVMTZ0Tnhk?=
 =?utf-8?B?dU1wcGZzOEJGRzgyL1FMNDRLRXA5QS9wcmFuQ2ZhYXIrQlZPMzlmVndNNHBq?=
 =?utf-8?Q?oss3tiROb+dKt8lbiJYa5chEzOL95vprBmAgQwLOS/fl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6778.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7efee5a-d9d6-4224-fd3f-08da8b4c4550
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 12:28:12.2432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqMbwqi7J/soj6bRvCs4BAEGS/sURjcwWMqHWo+x2oQHc3mDYVKQkykX7WleQW6iqHbLuvQ1CQq6116dNBNeGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5761
X-Proofpoint-ORIG-GUID: GX1PZpMLSiVOO21BpKsLxarTEKqme2hr
X-Proofpoint-GUID: GX1PZpMLSiVOO21BpKsLxarTEKqme2hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_07,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxlogscore=887 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310062
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgQXVndXN0IDMxLCAyMDIyIDI6MjQgUE0NCj4gVG86IFNhLCBOdW5vIDxOdW5v
LlNhQGFuYWxvZy5jb20+DQo+IENjOiBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWdwaW9Admdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgS3J6
eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsg
SGVubmVyaWNoLCBNaWNoYWVsDQo+IDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsgQmFy
dG9zeiBHb2xhc3pld3NraQ0KPiA8YnJnbEBiZ2Rldi5wbD47IEFuZHkgU2hldmNoZW5rbyA8YW5k
eS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT47DQo+IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+OyBEbWl0cnkgVG9yb2tob3YNCj4gPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDEvMTBdIGlucHV0OiBrZXlib2FyZDogYWRwNTU4OC1rZXlz
OiBzdXBwb3J0DQo+IGdwaSBrZXkgZXZlbnRzIGFzICdncGlvIGtleXMnDQo+IA0KPiBbRXh0ZXJu
YWxdDQo+IA0KPiBPbiBUaHUsIEp1bCAyMSwgMjAyMiBhdCAxMDowMyBBTSBOdW5vIFPDoSA8bnVu
by5zYUBhbmFsb2cuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gVGhpcyBjaGFuZ2UgcmVwbGFjZXMg
dGhlIHN1cHBvcnQgZm9yIEdQSXMgYXMga2V5IGV2ZW50IGdlbmVyYXRvcnMuDQo+ID4gSW5zdGVh
ZCBvZiByZXBvcnRpbmcgdGhlIGV2ZW50cyBkaXJlY3RseSwgd2UgYWRkIGEgZ3BpbyBiYXNlZCBp
cnFjaGlwDQo+ID4gc28gdGhhdCB0aGVzZSBldmVudHMgY2FuIGJlIGNvbnN1bWVkIGJ5IGtleXMg
ZGVmaW5lZCBpbiB0aGUgZ3Bpby0NCj4ga2V5cw0KPiA+IGRyaXZlciAoYXMgaXQncyBnb2FsIGlz
IGluZGVlZCBmb3Iga2V5cyBvbiBHUElPcyBjYXBhYmxlIG9mIGdlbmVyYXRpbmcNCj4gPiBpbnRl
cnJ1cHRzKS4gV2l0aCB0aGlzLCB0aGUgZ3Bpby1hZHA1NTg4IGRyaXZlciBjYW4gYWxzbyBiZSBk
cm9wcGVkLg0KPiA+DQo+ID4gVGhlIGJhc2ljIGlkZWEgaXMgdGhhdCBhbGwgdGhlIHBpbnMgdGhh
dCBhcmUgbm90IGJlaW5nIHVzZWQgYXMgcGFydCBvZg0KPiA+IHRoZSBrZXltYXAgbWF0cml4IGNh
biBiZSBwb3NzaWJseSByZXF1ZXN0ZWQgYXMgR1BJT3MgYnkgZ3Bpby1rZXlzDQo+ID4gKGl0J3Mg
YWxzbyBmaW5lIHRvIHVzZSB0aGVzZSBwaW5zIGFzIHBsYWluIGludGVycnVwdHMgdGhvdWdoIHRo
YXQncyBub3QNCj4gPiByZWFsbHkgdGhlIHBvaW50KS4NCj4gPg0KPiA+IFNpbmNlIHRoZSBncGlv
Y2hpcCBub3cgYWxzbyBoYXMgaXJxY2hpcCBjYXBhYmlsaXRpZXMsIHdlIHNob3VsZCBvbmx5DQo+
ID4gcmVtb3ZlIGl0IGFmdGVyIHdlIGZyZWUgdGhlIGRldmljZSBpbnRlcnJ1cHQgKG90aGVyd2lz
ZSB3ZSBjb3VsZCwgaW4NCj4gPiB0aGVvcnksIGJlIGhhbmRsaW5nIEdQSXMgaW50ZXJydXB0cyB3
aGlsZSB0aGUgZ3Bpb2NoaXAgaXMgY29uY3VycmVudGx5DQo+ID4gcmVtb3ZlZCkuIFRodXMgdGhl
IGNhbGwgJ2FkcDU1ODhfZ3Bpb19hZGQoKScgaXMgbW92ZWQgYW5kIHNpbmNlIHRoZQ0KPiA+IHNl
dHVwIHBoYXNlIGFsc28gbmVlZHMgdG8gY29tZSBiZWZvcmUgbWFraW5nIHRoZSBncGlvcyB2aXNp
YmxlLCB3ZQ0KPiBhbHNvDQo+ID4gbmVlZCB0byBtb3ZlICdhZHA1NTg4X3NldHVwKCknLg0KPiA+
DQo+ID4gV2hpbGUgYXQgaXQsIGFsd2F5cyBzZWxlY3QgR1BJT0xJQiBzbyB0aGF0IHdlIGRvbid0
IG5lZWQgdG8gdXNlICNpZmRlZg0KPiA+IGd1YXJkcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+DQo+IA0KPiBJcyB0aGVyZSBhbnkgaW5wdXQt
cmVsYXRlZCBjb250ZW50IGluIHRoZSBkcml2ZXIgYWZ0ZXIgdGhpcyBvcg0KPiBzaG91bGQgdGhl
IHdob2xlIGRyaXZlciBqdXN0IGJlIG1vdmVkIG92ZXIgdG8gZHJpdmVycy9ncGlvDQo+IGFuZCBy
ZXBsYWNlIHRoZSBvbGQgR1BJTyBkcml2ZXIgdGhhdCB5b3UgZGVsZXRlIGluIHBhdGNoDQo+IDI/
DQo+IA0KDQpIaSwNCg0KWWVzIHRoZXJlIGlzLi4uIFRoZSBtYWluIHVzYWdlIGZvciB0aGUgZGV2
aWNlIGlzIHRvIHVzZSBpdCBhcyBhDQptYXRyaXgga2V5cGFkLiBIb3dldmVyLCBhbGwgdGhlIGtl
eXMgdGhhdCBhcmUgbm90IHVzZWQgd2lsbCBiZSB0aGVuDQpleHBvc2VkIHRocm91Z2ggYSBncGlv
Y2hpcCB0byBiZSBjb25zdW1lZCBmb3IgZXhhbXBsZSBieSBncGlvLWtleXMNCg0KLSBOdW5vIFPD
oQ0K

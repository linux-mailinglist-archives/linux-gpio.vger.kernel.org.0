Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09FC45A4BC2
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Aug 2022 14:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiH2M1P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Aug 2022 08:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiH2M0t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2022 08:26:49 -0400
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0443174DC7;
        Mon, 29 Aug 2022 05:10:37 -0700 (PDT)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T9jjo1032005;
        Mon, 29 Aug 2022 07:21:57 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3j7d1ba46t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Aug 2022 07:21:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmfdrnFBQIB7JlyQR7WWOGnZ63qpWWuW+zrdBfPr/NOjNBwGc9AYMhVHo4ZlMNSxzw+zB4iakYPyyMUeBgOWbVb+S9aiibFrbaSzb0nWuLBKOb/Gmbj1GT6TQuPPi/o3DzX6UiOL0WS4q1Xl8GZaAo2rXLKmGpbl1u1zMjFFszSB6ndrcdWo6tg9X3PGpJf/eUH2ckrysSyFH2YEVTt710vCqqNQfLDf8EvZOnAbcQ1oKoL1w/5Zn3hNzVu+MwrtPJTccBlJM/J/fwKNIxSNhuDrxD/COp8NLi5LuravjkkkovR4NUjoAk761aO9c9GBiPp/cpmPomfv5hiF8oSd0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxTRbdnQINsI5tSRIi66BdcS+QEljivR2NA4kXEjF6c=;
 b=HHvCkr0jGuwm0VB4HKYLNeTlXVuHp4DW6ziLsNx18qRBpxfxmeJuHKaQ7gnKrEk3Zq3g+Z9C+E4MlU67pMJ0BD1+jHvDuzjmxaoJANicyjr3mGNRn3ZIxKg6c31pVFGAap/89xBklxzRaIt5KgqyhlNIgeL1y1TIO8P771BQy3HjLEp8yDnUGKxT4khfov8Kv/fvUnzZhXPaI1tmp4/Rm9YEtTyHaxIWVZ8EMNbm48JbZ4OhGUQ6Nt+a/a+a/gGvjEeQWbiNPHf5ofopdUBmMcYKQfGO+drSVLFAOPHapcM2MP9xgsA9h/Mw/ohtXUiIl5h17HXDImTfYtLpFerqnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxTRbdnQINsI5tSRIi66BdcS+QEljivR2NA4kXEjF6c=;
 b=KoI10uBQEPmLL/mdiOkpOriW988b/Zxe7oLYKCbvlNh2XrNzDxAk36Z+Y021B7c1hLW+e3SoELmWupSnqKNDOTH34Fs1xe9wchNcC09cE2Bb87y9TVehdBVUJ1VmtARPY79tuadgsLdmv+v1ghmeBSw6OOPnsd43AsU3vjg+YOM=
Received: from SJ0PR03MB6778.namprd03.prod.outlook.com (2603:10b6:a03:40d::22)
 by MW4PR03MB6569.namprd03.prod.outlook.com (2603:10b6:303:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 29 Aug
 2022 11:21:55 +0000
Received: from SJ0PR03MB6778.namprd03.prod.outlook.com
 ([fe80::edf1:c82a:ab73:1ffe]) by SJ0PR03MB6778.namprd03.prod.outlook.com
 ([fe80::edf1:c82a:ab73:1ffe%8]) with mapi id 15.20.5504.025; Mon, 29 Aug 2022
 11:21:55 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        kernel test robot <lkp@intel.com>
CC:     linux-input <linux-input@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Thread-Topic: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Thread-Index: AQHYnlCrKmIz6dqcpUCDGXTJdkZ0aq2PjogAgDZnnmA=
Date:   Mon, 29 Aug 2022 11:21:55 +0000
Message-ID: <SJ0PR03MB677816E5B0D9A86F7D80512C99769@SJ0PR03MB6778.namprd03.prod.outlook.com>
References: <20220721080423.156151-2-nuno.sa@analog.com>
 <202207231228.n8l077iB-lkp@intel.com>
 <CAHp75VdY6qikNgvh4K5Ga4D5MHf7sEfm0kbNzN-xNanwj4yQgg@mail.gmail.com>
In-Reply-To: <CAHp75VdY6qikNgvh4K5Ga4D5MHf7sEfm0kbNzN-xNanwj4yQgg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dFl6Z3haVGs0WVRjdE1qYzRZeTB4TVdWa0xUaGlaamt0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhHTTRNV1U1T0dFNUxUSTNPR010TVRGbFpDMDRZ?=
 =?utf-8?B?bVk1TFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTVRjNE1D?=
 =?utf-8?B?SWdkRDBpTVRNek1EWXlORFUzTVRNMU1ERTVNRFEySWlCb1BTSjZRbVpJTlRG?=
 =?utf-8?B?T1NWcHJlbXBhVjBKTGRXbEVOVlZ2YUdFeFRFazlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVRnRUa2h0UzIxaWRsbEJVa1JYVVZnd1ltOVZLelJGVGxwQ1ps?=
 =?utf-8?B?SjFhRlEzWjBSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: c777bc25-65c0-4c1f-fa27-08da89b0ae01
x-ms-traffictypediagnostic: MW4PR03MB6569:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z4FM8gI/qexqOUn8si0H2e3fg0LX3oXUy9CAFaxDK7NYt7mVe06cpeD06glJMPTamis4/vjX4oDzkR7YBbAyfIUclq2huOgwh6xcX8i0uZaMZW0T08+PRcxw9s8t2F23yCc92Esyf2+PedtVYcVYvenlchY/snoMHSTS2ujAOF+CzCTMa6nz7jo6cmqm7BBjJGhQefRZQ6iw+ERH88bPx/JmDA5GyEB/V8v2TvTmymC65nMD/mpcPKeok6ls36rBeZZeLyGKRSn836HGyk8pD3JmzEgUZkBYwNQir2KTmiOYbzEMglr2W2dBYwW8stnDf8vx2EvVhQz6jKKj9cBQwembt/nT4n4RsS8Pe72YqpQHDOTAVdvkiBF5fVSJVkYRdG4dJSJY6SBi6X2522P1NYcom9xR+hQiWE0VUCFPwoC9PvPqJfuFcVKm3A9RVaCxoSgcH3d140ybFh6D6rDU/qAy5QN37hucG4w4XGxKgxtew66FHgbRGbDV3HA9SaAhVfg966S449dJMcRQ6t07c0/K6vhyPaEjdHEDACVUK2nitQdcaTHr0H4ZZUnj0GDVIzjje2Rzg7aUctGazyvelbXZizdWKs2sDOlg4WrJmilVQyKZCAWBPqSdASA+i3gfG0rWb3hq9j7zM6drkiB38AEj5rDW7wm8IyhYjV72WP7sVnBxj977xc4jLU8rakGNYgMONsjCVZ34DY36yb7xEaY9NkTl3DXCZLpfA+DCC8XjotmmfLWye20zGNz4HRE+pyEIXjj7oevcNqnBQiJiKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6778.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(41300700001)(66556008)(64756008)(66946007)(76116006)(38100700002)(4326008)(66476007)(5660300002)(55016003)(8676002)(7416002)(122000001)(8936002)(7696005)(66446008)(86362001)(52536014)(53546011)(38070700005)(110136005)(54906003)(478600001)(71200400001)(6506007)(33656002)(9686003)(316002)(26005)(186003)(83380400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1FORjllRmxQV2JnMlVBa21lVXp5ZEppUVZsbUo4d3BnclAwdXVMVzlkZUFx?=
 =?utf-8?B?MDIraHZock5UK2NGTUN6QVQzcWtkelArcjQ0SWZUWFJlZlBLVlQrM2IxUDYz?=
 =?utf-8?B?NnE0ZEtETDlxV2dzUldiNkpJNUxHRi96Y25UUGZnM0NYTTZKS2l0Y1poc0JY?=
 =?utf-8?B?TlpKaTBINVNWdlJHSkh0SkMyd01EYXcxKzFHNlhKTHY2a1hkaHdWanJ5cmVK?=
 =?utf-8?B?d0VMVnV3Mnd2OC9kSnRWdkEyNEVISHBiWHpwWGtwYjZBbVBMUzJyN3Y1TWRH?=
 =?utf-8?B?UENNd1lYTjVtNWx4ZnRDb2tXUXN2QThzQVE4cTNhdmNYU1FOWGdpcndiZEtw?=
 =?utf-8?B?eXI5Vk56VG5EbTh5R0xzWVlxZUdSNC9UY0t3ZWtFWmVxRmpVU1FuYWN3TDdF?=
 =?utf-8?B?c3RmZUwzczhwRGIvOWxqZ1RYVmh5YmxXUGQxY3JRMmtmZml4bm0wRXpDeFQ1?=
 =?utf-8?B?d2ljekRaMUFSc0lvcytKQ243V1RNWG1JcXZETHFKL29BL2xBaDJEQTdYRDdi?=
 =?utf-8?B?QXB5UWU3K1FCemc1cVNsdmhVZFRzZkxXZk9udHFsSUlmQjU1ZzZySXFNY0li?=
 =?utf-8?B?dFhzWlNVb0VFNmFybXFFajRGWG81U3piaXQ1ZTJOaUthanYzb0RLSVI4YmIz?=
 =?utf-8?B?a2NXRDhqQkNTcDFmUHRVaW55RDJWRnFGa2tLbG8zOTdieEU4azlXMUM3MlJ4?=
 =?utf-8?B?ZXZuZnRiY2JrNTZzRjA5aXZhaXZQNzQ4VnlOb0piN01SRFd6Q3d2OWRyc0cw?=
 =?utf-8?B?K2FKcHMzNTZVeWlTVGMxN2p2MUxGUFI5cm5kUHNWL3pjV1FScUwwOU5tR0l1?=
 =?utf-8?B?Z0UzR3BUTVFSZVp0aVEzUmxwVTVNTGRjTlZOSHNuckdERmRNWkwrdDZCVDJL?=
 =?utf-8?B?UDNUVXBNald3UVg3S2cvU0pDSVNWWFVqajZLdE56MVhocGhHZDNycHE0UEh2?=
 =?utf-8?B?Ty9JM2RqU1ErOTZoVHB1Ym9YTTVpSVppWWZrZkF6TUhrQm0zUzlQb3BJSms1?=
 =?utf-8?B?dXdDRDY0dEM0cFpwbUh3dmk0WmM0bmpCS1p5VlY1cUJGeTFQaS9mbGczQ09y?=
 =?utf-8?B?UXRMbGRmbk5xWU1oOFZaWUlDTnJNQUtKRzA3KzNEUURxb2N5QnNOdnVVRWpz?=
 =?utf-8?B?SEdMZUpGenpjeXRFNnNlTENqazFTY3ltcHp2Q1FMUWtxdzlqT3NFT3JScXlJ?=
 =?utf-8?B?Z3VZcVUybm5VWkZPb3FxSVVZL3ZWdnhDMHhVcGFRRUt4T1hCV3NyUmxnTWpV?=
 =?utf-8?B?N2Zsb2NXcG9oaU52QWJEVVQ4T2VwSEl3QXdkUjJxOEpjNGlnVHQzMm15WDJR?=
 =?utf-8?B?V2pOR0o2Y0xkbDNoV1VEZkJRN2pQMnArQUpWbnRXZ29BMHBUNmR3NFQrZW0z?=
 =?utf-8?B?QitTcVpYQ1lXdXRQZVVMZVhqVXU3MmZMTFhMRHVXRytQVVZXY0R0cFdVY2l2?=
 =?utf-8?B?eW4remhsOGlHTVNJbFRPV2RoOWFkTzJ0K0RxL0ZDQUpxbDhubVZudTVYMk5W?=
 =?utf-8?B?VGR1YTYwNDRmV3IxcXYvbWI1cWlDVkxuT1NSUGdMTjNjM3J5ZThpazZtYWNw?=
 =?utf-8?B?QSs0QndOcjlWTHFvekFEMTJVSTN0SzhpT0FudjQ2Smh3ZHp1KzZsYmhmenE1?=
 =?utf-8?B?eDkwQTlsbExpYUxmc3V0aXN2bzRzcVBoREJKR1R4QlIxYjNWY3ZCaG9QU29S?=
 =?utf-8?B?WmNsbVdxZTJ5WFkxNjN1UHlOM3p6a2hmK1ArR2gwNmFvOEFGSEI0VDRPVGRs?=
 =?utf-8?B?ODB6TVBNOXZOWjlzNExoWXFtb3FHM2IxMXhUYysySmduVlJHUXQrNm5MZFBT?=
 =?utf-8?B?UWNjUG1vb1BHcUFmakhQZHlNK2lMaXF1Z2ZIQkRrY3AySyt1WFNLeGIvZzFK?=
 =?utf-8?B?OWo5NVRVZ1JNeVFjN3lYd3EvZEdkM2dBa3ozeFdEVDZqbDZHOWVHdUFUa0Zo?=
 =?utf-8?B?MHl5WjB3cmtxTHlBV2I4UXd3R2w2b0o4WUppNUR1aGhQT2pWZVMwQ2NpTTcx?=
 =?utf-8?B?OCthUXVWMmxlbTZMaHV3eENRaVNXV3R2aU0xT2prYzlIZ29PVzVIZW93dWxl?=
 =?utf-8?B?U0R5dXk0ZU8zNS9qeFpZSnBKTjZJZ2N6Qklyek9zOHI5V1diYW8yempMY1VO?=
 =?utf-8?Q?smFTfS132PNirnnImdI7xXGh/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6778.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c777bc25-65c0-4c1f-fa27-08da89b0ae01
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 11:21:55.2336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZBxkb2fOOUii4FpnKoZHvCNzNfg6PSFaB2a0PV5G5f8V8EEgqPIEngc3FmYp13x65pVFfD4qdhuf2+Rzi4AZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6569
X-Proofpoint-GUID: SBrBXqubHXOW7EKQViqeAKH9o1BezheM
X-Proofpoint-ORIG-GUID: SBrBXqubHXOW7EKQViqeAKH9o1BezheM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290054
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMjUsIDIw
MjIgMTA6MzIgUE0NCj4gVG86IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiBD
YzogU2EsIE51bm8gPE51bm8uU2FAYW5hbG9nLmNvbT47IGxpbnV4LWlucHV0IDxsaW51eC0NCj4g
aW5wdXRAdmdlci5rZXJuZWwub3JnPjsgb3BlbiBsaXN0OkdQSU8gU1VCU1lTVEVNIDxsaW51eC0N
Cj4gZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc+OyBkZXZpY2V0cmVlIDxkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZz47DQo+IGxsdm1AbGlzdHMubGludXguZGV2OyBrYnVpbGQtYWxsQGxpc3RzLjAxLm9y
ZzsgTGludXMgV2FsbGVpag0KPiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPjsNCj4gSGVubmVyaWNoLCBNaWNoYWVsIDxNaWNo
YWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsgQmFydG9zeg0KPiBHb2xhc3pld3NraSA8YnJnbEBi
Z2Rldi5wbD47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiBEbWl0cnkgVG9y
b2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgMDEvMTBdIGlucHV0OiBrZXlib2FyZDogYWRwNTU4OC1rZXlzOiBzdXBwb3J0DQo+IGdwaSBr
ZXkgZXZlbnRzIGFzICdncGlvIGtleXMnDQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiBTYXQs
IEp1bCAyMywgMjAyMiBhdCA2OjU3IEFNIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pg0KPiB3cm90ZToNCj4gDQo+IA0KPiAuLi4NCj4gDQo+ID4gQWxsIHdhcm5pbmdzIChuZXcgb25l
cyBwcmVmaXhlZCBieSA+Pik6DQo+ID4NCj4gPiA+PiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL2Fk
cDU1ODgta2V5cy5jOjMzNjo5OiB3YXJuaW5nOiBpbXBsaWNpdA0KPiBjb252ZXJzaW9uIGZyb20g
J3Vuc2lnbmVkIGxvbmcnIHRvICdpbnQnIGNoYW5nZXMgdmFsdWUgZnJvbQ0KPiAxODQ0Njc0NDA3
MzcwOTU1MTYxNSB0byAtMSBbLVdjb25zdGFudC1jb252ZXJzaW9uXQ0KPiA+ICAgICAgICAgICAg
cmV0dXJuIElOVkFMSURfSFdJUlE7DQo+ID4gICAgICAgICAgICB+fn5+fn4gXn5+fn5+fn5+fn5+
fg0KPiA+ICAgIGluY2x1ZGUvbGludXgvaXJxLmg6MTI0NToyNDogbm90ZTogZXhwYW5kZWQgZnJv
bSBtYWNybw0KPiAnSU5WQUxJRF9IV0lSUScNCj4gPiAgICAjZGVmaW5lIElOVkFMSURfSFdJUlEg
ICAofjBVTCkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fg0KPiANCj4gSXQg
cmVxdWlyZXMgaXJxLmgsIGJ1dCBob2xkIG9uLiBNYXJjIHNhaWQgdGhhdCBoZSB3YW50cyB0byBy
YXRoZXIga2lsbA0KPiB0aGF0IGRlZmluaXRpb24gdGhhbiBoYXZpbmcgaXQgc3ByZWFkIG92ZXIg
dGhlIGtlcm5lbC4gU28sIHBsZWFzZSB1c2UNCj4geW91ciBvd24gY3VzdG9tIG1hY3JvIHdpdGgg
YW4gYXBwcm9wcmlhdGUgdHlwZS4NCj4gDQoNCkkgc2VlLCBJJ2xsIHByb2JhYmx5IGp1c3QgcmVw
bGljYXRlIHRoZSBtYWNybyB3aXRoIGFuICJBRFA1NTg4IiBwcmVmaXguLi4NCg0KVGh4LA0KLSBO
dW5vIFPDoQ0K

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA1856BC29
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237623AbiGHOzb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238590AbiGHOza (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:55:30 -0400
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69612DA84;
        Fri,  8 Jul 2022 07:55:28 -0700 (PDT)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268Dgv1b010313;
        Fri, 8 Jul 2022 10:55:17 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3h4ubnvkpd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 10:55:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuHGxJpYo2eGy3jZLd0HT52JSbRG8/SNts1a/nuqve6VDKm4BzCCNcHewDCC25eT5X3gUY+BPTFG2qSYOPMdgyvtfQiKPDvC1uM5Xuuimd5KdggQ1kKR5lNe1SbF8hSBKjGDD0AHC1nDcPmYB0NAI9BSj1c8dnRjx3kqbO6S0FvcUMZfZ4OIeAMOo5zilikINvQdcbo7GV2bAJkmaVqHYbPRj5UDJjbziGy6lpED6vb/AUfeAeAmcyiFg67JaRKtOrcskRCiY+TdokSaMKKX6xBcNFUhX91d3MmVPxv5z5GhhF2GIKmN+ESdmkJeMND848Sg/yiX3hbBXaGF4OGDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow6xwY0KNWFAILKS8vnAZp6NjQc3c+/J9h9cUJEhmVA=;
 b=TLb+S/OomHvxbpppVq0Ta7W7wpEvyMfV1I1GFMtH+bRwWPy6uSdoKYwBuq2gduMe0ZR4OocZ+erk4IJrDhIF/PDj3dKcJx3csHqAVaYPbdX08sjU2NPHqYf8YPZcsPyk0s2wr1ZAF3Lm8mxmqnJhH0/408fMOtDCjnpT8oHFacanQmLbEsYTBd1C3Sgvdvw80dPfMDs2xil9vN+PJyjMJbI2QGk/YSFwBIS42vtjnVOUhvlCB1xFCjPSY4vU0TTLssNE06CRR1N2aSJkJLKmI8y0kj1arjpdYeiok1DEQ4cdp7KzWKiSlJ+gpBx0mNV3smL7uaeYtQxfqYr8O7B7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow6xwY0KNWFAILKS8vnAZp6NjQc3c+/J9h9cUJEhmVA=;
 b=lrCyc+cOzmmyzomlv7yFrWKWRdOnMbgHBRgFVJ1tnFO7jBU8KDRV7sTQNtQHr/3Pp7f0fEB9N8ftT1/MGVZuiPHcU2EzGc0VkVlNO8EP6C7cLk/lgyP0D5f+5DlXhERbMWzjUBFl1rUKJ4A/SFEjhQVpwDPmX4saRyg2u9YnPyQ=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by DM6PR03MB5001.namprd03.prod.outlook.com (2603:10b6:5:1e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 14:55:14 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0%8]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 14:55:13 +0000
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
Subject: RE: [PATCH 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Thread-Topic: [PATCH 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Thread-Index: AQHYktWsuvxEkAUvDUCJ5v5gv46a/610inOw
Date:   Fri, 8 Jul 2022 14:55:13 +0000
Message-ID: <PH0PR03MB678607A61ECA67E28480565499829@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
 <20220708093448.42617-2-nuno.sa@analog.com>
 <CAHp75VcJErVteT0P7=HhHB+c0UWFP8R5rc6u==Zf4p5JS4c=6A@mail.gmail.com>
In-Reply-To: <CAHp75VcJErVteT0P7=HhHB+c0UWFP8R5rc6u==Zf4p5JS4c=6A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dFpqWTVNRGhqWmpNdFptVmpaQzB4TVdWakxUaGlaall0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhHWTJPVEE0WTJZMExXWmxZMlF0TVRGbFl5MDRZ?=
 =?utf-8?B?bVkyTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpT0RJeE9T?=
 =?utf-8?B?SWdkRDBpTVRNek1ERTNOalUzTVRFeU1qZ3lPREV6SWlCb1BTSklkREJwZVZW?=
 =?utf-8?B?V1NXaGhhaTh3Tm1Ndk5IZFZNVWxzT0ZwbWNITTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVTTVVbWRwTlRKd1RGbEJWVVptWjFaR2EycHBha1ZSVml0Q1ZW?=
 =?utf-8?B?ZFRUMHROVVVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: 41ba41d3-f7d9-4203-6ec7-08da60f1dd0a
x-ms-traffictypediagnostic: DM6PR03MB5001:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LNSbBOSRRyFHOWv4aEs7Nry9en0esPBJW8+d3x11MXoE9jdzB7/Zdnfjrm7Q8IV8ra79ng11qR3VicZCdiJLN7SGflDdrAcq9GUsamCTqWpdnyhBbJECHCpRzmX1auvkiucuObWULafl0l2mFZquun8Km5GFIF569fs7B03aHIhOijVCn7a5KgfjCvhsUvYcY257/6jFb+vDPPSDzfHjXB2Vh8JbX9XXZcampC4MDATLurMZhJHZNY9E2t7z/KuqeoFTWoVBL+WICennfTsAGiM8LLOKtQ9yvBqn9vNh/mc53N2HbfIgOWjX9X4PmdPAak08ZeuU9Ggzw4lr8I4kZJx+KpSHxXKK9MDbQqNm9vWO1o5N1z4oFKkfC75TedKO97xIzh2B7PooBapX/ZSgpmvjCnT36Qev6v545WRKoKp979hCIY1MXmnLDJvP6FqQexEZ0pp4EOQlj08GhERfgXYpFBF8hoiwvIh1O5sLhNT3pBTElAnteMBPtU65HmvuSCP9Vax2CvSuyt13PObZlZHhWhDSFg7Eh0vLi8hQxB+lzZBZLc0Bntv7G7x0T/P8+fOiFgnArLXofV1+Fji6kmc8OT7pZDEHwxe76CSfUZtTfH8sIY5Z11T7hL67CeNysJhX/ncd0jAlabNIOvmQxU0ceLhD6xPjqEmELi/0i0ojqZQyeZ3XPkWQdfY9iRkHreF2emAqYDTFPlChcmF3ivy2RD0z6rHPaTm88rfZPYDKa4B4QCcq8IJEFMTdBwk10Df5A8ZHjRMVXxb7FCA4LY09n6qjqjK5jX4YxdBfgVS8Z94WReumZPBBZ5J2Z7Ic+af+BzvTao9t9HylsNYSCnbbbyOhQjAmZCvidtQAP9w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(4326008)(8676002)(71200400001)(66556008)(83380400001)(966005)(66446008)(76116006)(66946007)(66476007)(5660300002)(33656002)(186003)(41300700001)(2906002)(9686003)(64756008)(8936002)(26005)(478600001)(52536014)(122000001)(53546011)(38100700002)(6506007)(7696005)(86362001)(38070700005)(54906003)(55016003)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWZ2S2tkelBlL0RvaFZzSVQ1dU1tMG5vU3JJS2dMWWxKVDZvQ1JteW93Wi9D?=
 =?utf-8?B?N2hsY3Nhd2JoSlM5cE9LT3AxcC9CeDAyM3BybzNUUm1qNFRJQWJDMFZzekNQ?=
 =?utf-8?B?dEo4WkZ1b3Evb1JVRTVOTUpEU0daREdQUk5VSDFtOVBsSDVHbHo1Qnlpd0VN?=
 =?utf-8?B?RWxiT0sxcTJVaklnb2cyUHVHMWRzNi84ZlNNb3Q3WXF2UXJMK1pLZE9Pb2tZ?=
 =?utf-8?B?RkhDQ2JFbldQekpoNW1pRUxvK3Y2eTVOQlJadmZhY2RPM0VGelo5N0hDQlpY?=
 =?utf-8?B?cDNSZVRtTXNOMkNLR2F3Vm16VkZjcHQ5d3Q1Z3ZneDN0Sm9NVlcvZTUrZVZE?=
 =?utf-8?B?T3BQbVVVZzlyRVhnNitLaVk4ZmxsNElMTDJ1bm1mSjRIZVZsV3loUWg1UDcv?=
 =?utf-8?B?bmhkV3FLMFVCbDdqUTJrZHlEWVRUeUg3VkdEM1RRb2lrNGZBM05NZVZWSWdD?=
 =?utf-8?B?NlltWmZEMlJLM09jTFAxUFhURitGeTl4M2RySlJEQUN6NndkazZRYXFLN2FY?=
 =?utf-8?B?KzBFYmxrZG42WHRUQmVYTVZURlczQyt4TmVDNWxYby91VDQvek5iaVZxdDk2?=
 =?utf-8?B?MUxnMWh5Y3IyWHNHK3ZsbHpmbWFob2QwQnNkbVROL2ZsbDZ0M0pCZ2dBdDVF?=
 =?utf-8?B?ZWdRbWpSNGtyYW9BTHl3VGx3dmk1OVpSQjZRcDZjQUM4Nmo0OTlUaEo5b0ZO?=
 =?utf-8?B?V1R2anJSOGJXVHlYVmdxbmhoMWJ5QVl4U0V5djdqUlBKYnpqZWF2bWRsdWZh?=
 =?utf-8?B?U0o5K2tGVFpkUFBDbXJ2WE9lSVM2SThjdkdsUG5UMzdWRWVnM0w5WitLSHVH?=
 =?utf-8?B?c2VjUStRN0wzc2RTck5ZNXpCVXlxT0xtakR3YUh3Wk9UalJTRlZzQmJRVFJ1?=
 =?utf-8?B?dGUvMnJQSGRaeEFlWXZWMmk0SWppVjdlMWhxVFp5bDJINi94czFNWGlPQWdB?=
 =?utf-8?B?cEEwS2VpVHdwSi9RZFJmNTYwNjd3SkZXNHpmVkNqdWZrb1lqeGEvUHJiakFP?=
 =?utf-8?B?Y1FBYkx5NGRtR1BzUjEzYmh6RjAza29vZmJNeW9maUxTYXRCcThGODQrMXg4?=
 =?utf-8?B?MDFlL0s2bmtjRytrY0ovbjI0QzdUVXJkVEt5dTM2eVF0MDVTNkdxcnI1OWd3?=
 =?utf-8?B?VlplbndYbkhQaVN6WkFFOUwyOVg3dEU1dEpmSkR3cGRyNVN4RjhEZmJPWGdI?=
 =?utf-8?B?M3FRRW55eU4wMFBQRTRRc3g4TXVOaGtCSXlsTHNZTDdsa2kxeituelhXUmE1?=
 =?utf-8?B?Y1RmWCtpdngxellPaFJRMkdXSWRSYWhLcUU3YkhaYVlZTjVwUGsrOEdlbzZF?=
 =?utf-8?B?cG51RkxpWmk5QldSZXdXMUFneEx4SWVKMXRuUVBUMTkwZzA4NDEybWc2QWti?=
 =?utf-8?B?K3AzZzJXZmtJT21TbEZGN3J4ZHlGd2JhVERQaWhzMlVDT0pNcmVhdTdmSE9X?=
 =?utf-8?B?NjgvVFU2ZWJGR3RGWU1XaW1wSUgvZngzQVhNQTczeC90NXlhUm5xckErM3d2?=
 =?utf-8?B?UFZ5b25nQjZPSUh6dkNxNmR3ZjU2SC9GSzlRUkZ6dW5ZWUZvdmVPb3JRV3Jv?=
 =?utf-8?B?UWxnaThwR2paTHVtYlZmMWpMV3NOY0xQRFhlWVJZUzFmUnJZRFVDa0U3dFp2?=
 =?utf-8?B?NjFGNUdaYjkvWklTSGtEUWFLQUR5UkxGbkR6VzFpQzQyWDdUYnAzRWZKY2Ns?=
 =?utf-8?B?MkY1Q2Z0djc5QUdyMGpJdkVKTUc3NHpzelJ5eGVnLy9PQ3FJVXltdlVERUZL?=
 =?utf-8?B?RWlXTE04ZHFZS3oxNEV6aXJCWU9KTmdndldLVFowUDZoRlVSTWFZZG9zZkF2?=
 =?utf-8?B?LzF3R3RqVitEV0lGYUhjRXRhS3dBb2NrMzJPblI1clluNHBQaytneEZxcXdB?=
 =?utf-8?B?aGtDVnRVUHMwbVM2WUVZdUFCMHpXZytZTm4rR2lyd3E3Mk05NC85TUtDWExS?=
 =?utf-8?B?akxVUCtnRGtRemt0NXFZaUZINm5pN0ZmeXdEZ21RbE5IOUt0UktMTDRFZHNT?=
 =?utf-8?B?Sk13bm1lRWJnSCtodkgxVUhnLzdCTHZaMjlNL2YzYXdkY1U4VXozMUpBT1cr?=
 =?utf-8?B?RzFDS1UvMU1Pb2xwdXE3M0h4cmk5NWRETlUvYkR6TmNMK1lKYWFZL25RVEFt?=
 =?utf-8?Q?npzT27oyGrNCZPvWN8PJ1VSMG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ba41d3-f7d9-4203-6ec7-08da60f1dd0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 14:55:13.7554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPds+n2/oNxR/A29vbex00H++nqorXwvpqhLum2PFNN3r0G9COLmWlS3pvSszHugNMhS6WBMJCCZJmECYPWEng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5001
X-Proofpoint-GUID: kov5xTOw92gnLuvEU3durfvjpnligc4S
X-Proofpoint-ORIG-GUID: kov5xTOw92gnLuvEU3durfvjpnligc4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_12,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080058
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
MiA0OjE4IFBNDQo+IFRvOiBTYSwgTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogZGV2
aWNldHJlZSA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6R1BJTw0KPiBT
VUJTWVNURU0gPGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgbGludXgtaW5wdXQgPGxpbnV4
LQ0KPiBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc+OyBEbWl0cnkgVG9yb2tob3YNCj4gPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxicmdsQGJnZGV2LnBs
PjsgSGVubmVyaWNoLCBNaWNoYWVsDQo+IDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsg
Um9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IExpbnVzIFdhbGxlaWoNCj4g
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMS8xMF0g
aW5wdXQ6IGtleWJvYXJkOiBhZHA1NTg4LWtleXM6IHN1cHBvcnQgZ3BpDQo+IGtleSBldmVudHMg
YXMgJ2dwaW8ga2V5cycNCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIEZyaSwgSnVsIDgsIDIw
MjIgYXQgMTE6MzYgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBUaGlzIGNoYW5nZSByZXBsYWNlcyB0aGUgc3VwcG9ydCBmb3IgR1BJcyBhcyBrZXkgZXZl
bnQgZ2VuZXJhdG9ycy4NCj4gPiBJbnN0ZWFkIG9mIHJlcG9ydGluZyB0aGUgZXZlbnRzIGRpcmVj
dGx5LCB3ZSBhZGQgYSBncGlvIGJhc2VkIGlycWNoaXANCj4gPiBzbyB0aGF0IHRoZXNlIGV2ZW50
cyBjYW4gYmUgY29uc3VtZWQgYnkga2V5cyBkZWZpbmVkIGluIHRoZSBncGlvLQ0KPiBrZXlzDQo+
ID4gZHJpdmVyIChhcyBpdCdzIGdvYWwgaXMgaW5kZWVkIGZvciBrZXlzIG9uIEdQSU9zIGNhcGFi
bGUgb2YgZ2VuZXJhdGluZw0KPiA+IGludGVycnVwdHMpLiBXaXRoIHRoaXMsIHRoZSBncGlvLWFk
cDU1ODggZHJpdmVyIGNhbiBhbHNvIGJlIGRyb3BwZWQuDQo+ID4NCj4gPiBUaGUgYmFzaWMgaWRl
YSBpcyB0aGF0IGFsbCB0aGUgcGlucyB0aGF0IGFyZSBub3QgYmVpbmcgdXNlZCBhcyBwYXJ0IG9m
DQo+ID4gdGhlIGtleW1hcCBtYXRyaXggY2FuIGJlIHBvc3NpYmx5IHJlcXVlc3RlZCBhcyBHUElP
cyBieSBncGlvLWtleXMNCj4gPiAoaXQncyBhbHNvIGZpbmUgdG8gdXNlIHRoZXNlIHBpbnMgYXMg
cGxhaW4gaW50ZXJydXB0cyB0aG91Z2ggdGhhdCdzIG5vdA0KPiA+IHJlYWxseSB0aGUgcG9pbnQp
Lg0KPiA+DQo+ID4gU2luY2UgdGhlIGdwaW9jaGlwIG5vdyBhbHNvIGhhcyBpcnFjaGlwIGNhcGFi
aWxpdGllcywgd2Ugc2hvdWxkIG9ubHkNCj4gPiByZW1vdmUgaXQgYWZ0ZXIgd2UgZnJlZSB0aGUg
ZGV2aWNlIGludGVycnVwdCAob3RoZXJ3aXNlIHdlIGNvdWxkLCBpbg0KPiA+IHRoZW9yeSwgYmUg
aGFuZGxpbmcgR1BJcyBpbnRlcnJ1cHRzIHdoaWxlIHRoZSBncGlvY2hpcCBpcyBjb25jdXJyZW50
bHkNCj4gPiByZW1vdmVkKS4gVGh1cyB0aGUgY2FsbCAnYWRwNTU4OF9ncGlvX2FkZCgpJyBpcyBt
b3ZlZCBhbmQgc2luY2UgdGhlDQo+ID4gc2V0dXAgcGhhc2UgYWxzbyBuZWVkcyB0byBjb21lIGJl
Zm9yZSBtYWtpbmcgdGhlIGdwaW9zIHZpc2libGUsIHdlDQo+IGFsc28NCj4gPiBuZWVkIHRvIG1v
dmUgJ2FkcDU1ODhfc2V0dXAoKScuDQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwgYWx3YXlzIHNlbGVj
dCBHUElPTElCIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byB1c2UgI2lmZGVmDQo+ID4gZ3VhcmRz
Lg0KPiANCj4gLi4uDQo+IA0KPiA+ICAgICAgICAgdTggZGF0X291dFszXTsNCj4gPiAgICAgICAg
IHU4IGRpclszXTsNCj4gDQo+ID4gKyAgICAgICB1OCBpbnRfZW5bM107DQo+ID4gKyAgICAgICB1
OCBpcnFfbWFza1szXTsNCj4gDQo+IFdvbmRlcmluZyB3aHkgdGhlc2UgY2FuJ3QgYmUgY29udmVy
dGVkIHRvIG5hdHVyYWwgYml0bWFwcy4gKFNlZQ0KPiBncGlvLXBjYTk1M3ggYXMgYW4gZXhhbXBs
ZSkuDQo+DQoNCkkga2luZCBvZiByZXBsaWVkIHRvIHRoaXMgaW4gYSBwcmV2aW91cyBlbWFpbCAo
dG8geW91KS4gSXQgbmF0dXJhbGx5IGNhbiwNCmJ1dCBJIHdvdWxkIHJhdGhlciBwcmVmZXIgdG8g
ZG8gdGhhdCBpbiBhbm90aGVyIHNlcmllcy4uLiBJIGNvdWxkIGhhdmUNCmRvbmUgaXQgaGVyZSBi
dXQgaXQgd291bGQgbm90IGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVzdCBvZiB0aGUNCmRyaXZl
ci4NCg0KPiAuLi4NCj4gDQo+ID4gK3N0YXRpYyB2b2lkIGFkcDU1ODhfaXJxX21hc2soc3RydWN0
IGlycV9kYXRhICpkKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZ3Bpb19jaGlwICpnYyA9
IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGQpOw0KPiA+ICsgICAgICAgc3RydWN0IGFkcDU1
ODhfa3BhZCAqa3BhZCA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gPiArICAgICAgIHVuc2ln
bmVkIGxvbmcgcmVhbF9pcnEgPSBrcGFkLT5ncGlvbWFwW2QtPmh3aXJxXTsNCj4gPiArDQo+ID4g
KyAgICAgICBrcGFkLT5pcnFfbWFza1tBRFA1NTg4X0JBTksocmVhbF9pcnEpXSAmPQ0KPiB+QURQ
NTU4OF9CSVQocmVhbF9pcnEpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBhZHA1
NTg4X2lycV91bm1hc2soc3RydWN0IGlycV9kYXRhICpkKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBz
dHJ1Y3QgZ3Bpb19jaGlwICpnYyA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGQpOw0KPiA+
ICsgICAgICAgc3RydWN0IGFkcDU1ODhfa3BhZCAqa3BhZCA9IGdwaW9jaGlwX2dldF9kYXRhKGdj
KTsNCj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgcmVhbF9pcnEgPSBrcGFkLT5ncGlvbWFwW2Qt
Pmh3aXJxXTsNCj4gPiArDQo+ID4gKyAgICAgICBrcGFkLT5pcnFfbWFza1tBRFA1NTg4X0JBTkso
cmVhbF9pcnEpXSB8PQ0KPiBBRFA1NTg4X0JJVChyZWFsX2lycSk7DQo+ID4gK30NCj4gDQo+IFBs
ZWFzZSBmb2xsb3cgdGhlIHN1aXRhYmxlIGV4YW1wbGUgZnJvbSBoZXJlOg0KPiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlcw0K
PiB0L2RyaXZlci1hcGkvZ3Bpby9kcml2ZXIuaHRtbCppbmZyYXN0cnVjdHVyZS1oZWxwZXJzLWZv
ci1ncGlvLQ0KPiBpcnFjaGlwc19fO0l3ISFBM05pOENTMHkyWSE0ZU1MRDVYVDJSRXBPUFdsNkI5
SXhZeEVnYk1meGlXODcNCj4gWEp1LTRLbWplVnl3U0xyb2JJWnFFWnBjVkowZEJOYlpER1BCcEhY
dngzeFAtSHpHUzRqSXd2dSQNCj4gDQo+IC4uLg0KPiANCj4gPiArICAgICAgIGtwYWQtPmdjLnBh
cmVudCA9ICZrcGFkLT5jbGllbnQtPmRldjsNCj4gDQo+ID4gKyAgICAgICBrcGFkLT5nYy5vZl9u
b2RlID0ga3BhZC0+Y2xpZW50LT5kZXYub2Zfbm9kZTsNCj4gDQo+IFdlIGFyZSBnb2luZyB0byBy
ZW1vdmUgb2Zfbm9kZSBmcm9tIEdQSU8uIE1vcmVvdmVyIHRoZSBwYXJlbnQNCj4gZGV2aWNlDQo+
IGFuZCBpdHMgbm9kZSBpcyBhIGR1cGxpY2F0aW9uLCBqdXN0IGRyb3AgdGhlIGxhdHRlciBhbmQg
R1BJTyBsaWJyYXJ5DQo+IHdpbGwgdGFrZSBjYXJlIG9mIGl0Lg0KPiANCg0KV2VsbCB0aGUgb2Zf
bm9kZSB3YXMgc2V0IHNvIHRoYXQgSSBoYWQgYSBwcm9wZXIgbmFtZSBpbiB0aGUgSVJRIGRvbWFp
bg0KSUlSQy4gV2lsbCB0aGlzIGJlIGhhbmRsZWQgaW4gdGhlIEdQSU8gbGliIGluIHRoZSBmdXR1
cmU/DQoNClRoZSBwYXJlbnQgYXNzaWdubWVudCB3YXMgYWxzbyB0byBtYWtlIHRoaW5ncyBuZWF0
ZXIgaW4NCi9zeXMva2VybmVsL2RlYnVnL2dwaW8uDQoNCj4gLi4uDQo+IA0KPiA+ICsgICAgICAg
aXJxX2NoaXAtPm5hbWUgPSAiYWRwNTU4OCI7DQo+ID4gKyAgICAgICBpcnFfY2hpcC0+aXJxX21h
c2sgPSBhZHA1NTg4X2lycV9tYXNrOw0KPiA+ICsgICAgICAgaXJxX2NoaXAtPmlycV91bm1hc2sg
PSBhZHA1NTg4X2lycV91bm1hc2s7DQo+ID4gKyAgICAgICBpcnFfY2hpcC0+aXJxX2J1c19sb2Nr
ID0gYWRwNTU4OF9pcnFfYnVzX2xvY2s7DQo+ID4gKyAgICAgICBpcnFfY2hpcC0+aXJxX2J1c19z
eW5jX3VubG9jayA9DQo+IGFkcDU1ODhfaXJxX2J1c19zeW5jX3VubG9jazsNCj4gPiArICAgICAg
IGlycV9jaGlwLT5pcnFfc2V0X3R5cGUgPSBhZHA1NTg4X2lycV9zZXRfdHlwZTsNCj4gPiArICAg
ICAgIGlycV9jaGlwLT5mbGFncyA9IElSUUNISVBfU0tJUF9TRVRfV0FLRTsNCj4gPiArICAgICAg
IGdpcnEgPSAma3BhZC0+Z2MuaXJxOw0KPiA+ICsgICAgICAgZ2lycS0+Y2hpcCA9IGlycV9jaGlw
Ow0KPiANCj4gPiArICAgICAgIGdpcnEtPmhhbmRsZXIgPSBoYW5kbGVfc2ltcGxlX2lycTsNCj4g
DQo+IEJ5IGRlZmF1bHQgaXQgc2hvdWxkIGJlIGhhbmRsZV9iYWRfaXJxKCkgYW5kIGxvY2tlZCBp
biB0aGUgLQ0KPiA+aXJxX3NldF90eXBlKCkuDQo+IA0KPiA+ICsgICAgICAgZ2lycS0+dGhyZWFk
ZWQgPSB0cnVlOw0KPiANCj4gU2VlIGRvY3VtZW50YXRpb24gYWJvdmUuDQoNCkkgc2VlLi4uIEkg
d2lsbCBsb29rIGF0IERvY3MuIEluIHByYWN0aWNlIEkgZG9uJ3QgdGhpbmsgdGhpcyBtYXR0ZXJz
IG11Y2gNCnNpbmNlIHRoaXMgaGFuZGxlciBzaG91bGQgbmV2ZXIgcmVhbGx5IGJlIGNhbGxlZCAo
SSB0aGluaykgYXMgd2UganVzdA0KY2FsbCBoYW5kbGVfbmVzdGVkX2lycSgpLg0KDQo+IC4uLg0K
PiANCj4gPiArc3RhdGljIGludCBhZHA1NTg4X2dwaW9tYXBfZ2V0X2h3aXJxKGNvbnN0IHU4ICpt
YXAsIHVuc2lnbmVkIGludA0KPiBncGlvLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgbmdwaW9zKQ0KPiA+ICB7DQo+ID4gLSAgICAgICByZXR1
cm4gMDsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBod2lycTsNCj4gPiArDQo+ID4gKyAgICAg
ICBmb3IgKGh3aXJxID0gMDsgaHdpcnEgPCBuZ3Bpb3M7IGh3aXJxKyspDQo+ID4gKyAgICAgICAg
ICAgICAgIGlmIChtYXBbaHdpcnFdID09IGdwaW8pDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIGh3aXJxOw0KPiANCj4gPiArICAgICAgIC8qIHNob3VsZCBuZXZlciBoYXBwZW4g
Ki8NCj4gDQo+IFRoZW4gd2h5IGl0J3MgaGVyZT8NCg0KYmVjYXVzZSBJIGRvIG5vdCB0cnVzdCB0
aGUgSFcgdG8gYWx3YXlzIGNvb3BlcmF0ZSA6KS4gSW4gdGhlb3J5LA0Kd2UgY2FuIGdldCBzb21l
IGludmFsaWQgJ2dwaW8nIGZyb20gaXQuDQoNCj4gPiArICAgICAgIFdBUk5fT05fT05DRShod2ly
cSA9PSBuZ3Bpb3MpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAtRU5PRU5UOw0KPiA+ICt9
DQo+IA0KPiBJIGRvbid0IGtub3cgdGhpcyBjb2RlLCBjYW4geW91IHN1bW1hcml6ZSB3aHkgdGhp
cyBhZGRpdGlvbmFsIG1hcHBpbmcNCj4gaXMgbmVlZGVkPw0KPiANCg0KWW91IGhhdmUgMTggcG9z
c2libGUgcGlucyB0byB1c2UgYXMgR1BJT3MgKGFuZCBoZW5jZSBiZSBJUlEgc291cmNlcykuIE5v
dywNCmlmIHlvdSBqdXN0IHdhbnQgdG8gdXNlIHBpbnMgMTYgYW5kIDE3IHRoYXQgd2lsbCBtYXAg
aW50IGh3aXJxIDAgYW5kIDEuIEJ1dA0Kd2hhdCB3ZSBnZXQgZnJvbSB0aGUgZGV2aWNlIGluICdr
ZXlfdmFsIC0gR1BJX1BJTl9CQVNFJyBpcywgZm9yIGV4YW1wbGUsDQoxNiBhbmQgc28gd2UgbmVl
ZCB0byBnZXQgdGhlIGh3aXJxIHdoaWNoIHdpbGwgYmUgMC4gSXQncyBwcmV0dHkgbXVjaCB0aGUN
CnJldmVyc2Ugb2Ygd2hhdCBpdCdzIGJlaW5nIGRvbmUgaW4gdGhlIEdQSU9zIGNhbGxiYWNrcy4N
Cg0KPiAuLi4NCj4gDQo+ID4gK3N0YXRpYyB2b2lkIGFkcDU1ODhfZ3Bpb19pcnFfaGFuZGxlKHN0
cnVjdCBhZHA1NTg4X2twYWQgKmtwYWQsDQo+IGludCBrZXlfdmFsLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBrZXlfcHJlc3MpDQo+ID4gK3sNCj4gPiArICAg
ICAgIHVuc2lnbmVkIGludCBpcnEsIGdwaW8gPSBrZXlfdmFsIC0gR1BJX1BJTl9CQVNFLCBpcnFf
dHlwZSwNCj4gaHdpcnE7DQo+ID4gKyAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0g
a3BhZC0+Y2xpZW50Ow0KPiA+ICsgICAgICAgc3RydWN0IGlycV9kYXRhICpkZXNjOw0KPiA+ICsN
Cj4gPiArICAgICAgIGh3aXJxID0gYWRwNTU4OF9ncGlvbWFwX2dldF9od2lycShrcGFkLT5ncGlv
bWFwLCBncGlvLA0KPiBrcGFkLT5nYy5uZ3Bpbyk7DQo+ID4gKyAgICAgICBpZiAoaHdpcnEgPCAw
KSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoJmNsaWVudC0+ZGV2LCAiQ291bGQgbm90
IGdldCBod2lycSBmb3Iga2V5KCV1KVxuIiwNCj4ga2V5X3ZhbCk7DQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybjsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBpcnEgPSBpcnFf
ZmluZF9tYXBwaW5nKGtwYWQtPmdjLmlycS5kb21haW4sIGh3aXJxKTsNCj4gPiArICAgICAgIGlm
IChpcnEgPD0gMCkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICsNCj4gPiArICAg
ICAgIGRlc2MgPSBpcnFfZ2V0X2lycV9kYXRhKGlycSk7DQo+ID4gKyAgICAgICBpZiAoIWRlc2Mp
IHsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycigmY2xpZW50LT5kZXYsICJDb3VsZCBub3Qg
Z2V0IGlycSgldSkgZGF0YVxuIiwgaXJxKTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOw0K
PiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGlycV90eXBlID0gaXJxZF9nZXRfdHJp
Z2dlcl90eXBlKGRlc2MpOw0KPiA+ICsNCj4gPiArICAgICAgIC8qDQo+ID4gKyAgICAgICAgKiBE
ZWZhdWx0IGlzIGFjdGl2ZSBsb3cgd2hpY2ggbWVhbnMga2V5X3ByZXNzIGlzIGFzc2VydGVkIG9u
DQo+ID4gKyAgICAgICAgKiB0aGUgZmFsbGluZyBlZGdlLg0KPiA+ICsgICAgICAgICovDQo+ID4g
KyAgICAgICBpZiAoKGlycV90eXBlICYgSVJRX1RZUEVfRURHRV9SSVNJTkcgJiYgIWtleV9wcmVz
cykgfHwNCj4gPiArICAgICAgICAgICAoaXJxX3R5cGUgJiBJUlFfVFlQRV9FREdFX0ZBTExJTkcg
JiYga2V5X3ByZXNzKSkNCj4gDQo+IFRoaXMgaXMgZHVwIGZyb20gLT5pcnFfc2V0X3R5cGUoKS4g
T3IgaG93IHRoaXMgY2FuIGJlIG5vdCBsaWtlIHRoaXM/DQoNCldlIGdldCBoZXJlIGlmIHdlIGdl
dCBhIGtleSBwcmVzcyAoZmFsbGluZyBlZGdlKSBvciBhIGtleSByZWxlYXNlIChyaXNpbmcNCmVk
Z2UpLiBUaGUgZXZlbnRzIGFyZSBnaXZlbiBieSB0aGUgZGV2aWNlIGFuZCBpdCBtaWdodCBiZSB0
aGF0IGluIHNvbWUNCmNhc2VzIHdlIGp1c3Qgd2FudCB0byBoYW5kbGUvcHJvcGFnYXRlIGtleSBw
cmVzc2VzDQoobm90IHN1cmUgaWYgaXQgbWFrZXMgc2Vuc2UpLiBTbyB3ZSBuZWVkIHRvIG1hdGNo
IGl0IHdpdGggdGhlDQphcHByb3ByaWF0ZSBpcnFfdHlwZSByZXF1ZXN0ZWQuIE5vdGUgdGhhdCB0
aGlzIGtpbmQgb2YgY29udHJvbGxpbmcgdGhlIElSUQ0KZnJvbSBTVyBhcyB0aGVyZSdzIG5vIHdh
eSBmcm9tIGRvaW5nIGl0IGluIHRoZSBkZXZpY2UuIFRoYXQgaXMgd2h5IHdlIGRvbid0DQpkbyBt
b3JlIHRoYW4ganVzdCBtYWtpbmcgc3VyZSB0aGUgSVJRIHR5cGVzIGFyZSB2YWxpZCBpbiBpcnFf
c2V0X3R5cGUuDQoNCj4gPiArICAgICAgICAgICAgICAgaGFuZGxlX25lc3RlZF9pcnEoaXJxKTsN
Cj4gDQo+IFRoZXJlIGlzIG5ldyBoZWxwZXJzIEkgYmVsaWV2ZSBmb3IgZ2V0dGluZyBkb21haW4g
YW5kIGhhbmRsZSBhbiBJUlEuDQo+IEdyZXAgZm9yIHRoZSByZWNlbnQgKG9uZS10d28gbGFzdCBj
eWNsZXMpIGNoYW5nZXMgaW4gdGhlIEdQSU8gZHJpdmVycy4NCj4gDQoNCkhtbSwgSSB0aGluayBJ
IHNhdyBpdCBidXQgc29tZWhvdyBJIHRob3VnaCBJIGNvdWxkIG5vdCB1c2UgaXQgKGJlY2F1c2UN
Cm9mIHRoZSBwcmV2aW91cyBjYWxscyB0byBnZXQgdGhlIGlycV90eXBlKS4gSG1tbS4uLg0KDQot
IE51bm8gU8OhDQo=

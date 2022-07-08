Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8899F56BC6B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238771AbiGHPFj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238635AbiGHPFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:05:38 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48254606B4;
        Fri,  8 Jul 2022 08:05:37 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268ESFgm003271;
        Fri, 8 Jul 2022 11:05:33 -0400
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h5tu8av1a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 11:05:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFi/unU1dkmV9wMlqm+mo8BqRQOwc3kZ+RrI9rWTVh7HLgUD58dJ7Sp0bXlPDCNAH9BoeI+FGb1ZNaQa/yiub0fZBR+GfFVVmianwzmISwmhC8l6uVVfSqRRkgrvPOCGcz41x6Y5ljoLgFNYTMAdaGhANE2Q3kub1Yr5FgktI3xaT8yWi2NPLiwnK/Sp3uLPew7bGSbZYAI4WfhRBFs6HFYOZJuBYdcx5zfWQ82XWjWRebelxB5oZQXevri4W3kP69/nzNt2u+yLm885vH46KHBNqUZLHJkkd9pQICv5lxIknlRrapdGxZ6ZVrzVIInm8AkgcH+oaEzq1iJJd3HZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4oYkN6WfkpNmEHX5/il616vEYVIRxe0P124ZGlKvww=;
 b=bewAmq85LSpfxO0VVHmELLsUCGQNQDYeQ+mFJztIAwjnl0hqgPIOjosD2Z1yEXiQ+ahCKAi7jGcaHaXoqTuE0BIYcHmYX9a0+0feEoSBnKW3CtIHnEG7h0KvKBSgqojNXKAAXU1iPOGX96NYfIsSjU9zlN2ADBt38aRRM/jU8LKXv8Pu38zdKfPQ26c8SGH7SqliW+ck/Nf7C5q48iv83TZwPLaNYPS5dZkeL1QoShxkWcP9GSO0tN9jl5K9l2QqfklT29jETqB+PnnMNFrK1S6pEhSkko9SIa/1I2x7r5IYkLqCxENMe2Mn+IOsCWRXinuMmZvyB4H6P/xyQfLgPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4oYkN6WfkpNmEHX5/il616vEYVIRxe0P124ZGlKvww=;
 b=aqWuEnUPN0JOWmAJoji4xLp8OZE3oRv3LrLxOu3c6eMFokKxkfmC4tLV0IZoWPyBjWwDeDXpEg8h75w7LkoMv8dsCa8EGqEPYk85LokpVKfKzA6w2mUCv44nkitd8mSR+rYL9Q4yosckbobo4IhzkXqDRpTOIdU/zBbYBSYjFQI=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by BY5PR03MB4935.namprd03.prod.outlook.com (2603:10b6:a03:1e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 15:05:31 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0%8]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 15:05:30 +0000
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
Subject: RE: [PATCH 07/10] input: keyboard: adp5588-keys: fix coding style
 warnings
Thread-Topic: [PATCH 07/10] input: keyboard: adp5588-keys: fix coding style
 warnings
Thread-Index: AQHYktoVMatfMsnf+0ahnvQ9t1O5Kq10kkrw
Date:   Fri, 8 Jul 2022 15:05:30 +0000
Message-ID: <PH0PR03MB67865B851C724E5958F21CDA99829@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
 <20220708093448.42617-8-nuno.sa@analog.com>
 <CAHp75VeKg9G7o6evb47P8jgwG2Pgh5prw7WJYwXZq4pMGZCxUQ@mail.gmail.com>
In-Reply-To: <CAHp75VeKg9G7o6evb47P8jgwG2Pgh5prw7WJYwXZq4pMGZCxUQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE5qWmlZakl6WkRVdFptVmpaaTB4TVdWakxUaGlaall0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhEWTJZbUl5TTJRM0xXWmxZMll0TVRGbFl5MDRZ?=
 =?utf-8?B?bVkyTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTVRjd01T?=
 =?utf-8?B?SWdkRDBpTVRNek1ERTNOall6TWpnMk9UUTVNelk1SWlCb1BTSXlXR2syZFZk?=
 =?utf-8?B?cWJWTnBiazU0WTNsMlQyWXdWekYyVW5scFNGVTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVUTFUbEpKY0ROS1RGbEJWVkY1Wm5oWk5scFRURlZTUkVvdlJt?=
 =?utf-8?B?cHdiRWwwVVVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: 4d685c67-5d03-484f-9754-08da60f34cd5
x-ms-traffictypediagnostic: BY5PR03MB4935:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bZEGjj3ZzpsQJ95YE2X2crC7XjB8925MPtlRaAM/cFHesgnr2ug/7uevBhKMJouBuBBu7o5hcYxCaJ0VByXDA7dUF2Y46xtQpQfy8p05+IZWK3nd6uahWct3JzO8z4/2hhgBpJ5MfkojMrANLdczBmYv4/dnjAF0gcVw3Q5OPqTezgzbJOZheZS4LqTa6DGSfLIo+5j0QiARV7p+X6rhz2IqeEqm3g3eyTicqVbM3cHgPP/UXYaJnhO5s3i/ZqXXQJhhg6iOw++80NiW7ClEvWI3TEIdl6kFw5Te7GncQsRyHxaUm0EiiYmFUaMVv4cQ+vp+lLSOqHD49z2g2x6TO5/W4uMnW5i7BRuhPvEkuq+wKfuH0yk8h5YBfkhbkvEk4VnNQLsyjlkG0s6MXclirddIra8wOCk98K1RvtSKMgVlEUyDxh0EzZcDrpvRcdtqYu0E+apVBSw3AiBuwaCIv1oJUZOi1evJf7sfLKFmPpRDE91Kx0BfyEgBULTXhDnq6qgLw2XZZpTiDtwwQzozgSHCW3OaVVzbeil4xTkDLD0c0Kyqj7yPgcXORcm05o/C84COgQyqKqCy/HQg6JzeogMs8n4ipu0SwRpIx5Z6bSIj64ZlaDvtvnVKJt8mQKnrXg7X1OBYmoleuT4LiN7J4waRLxpaP/ZT+0YHbhNQF8kw5RIPHav8JXHL41Lbad691A2L7kPs/TaEtsjYAnERI6dkrLghz2wNdcEDq9R79sDsnz0oLtgxW70xq9pI1NOKF/lPDpVy/DbuSrVttA3Gsgd+sYiZpk9UDRLxAjmV/msvIrmbLjIN9/mheMuFaOG+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(26005)(38100700002)(38070700005)(55016003)(9686003)(122000001)(6506007)(7696005)(53546011)(54906003)(316002)(6916009)(186003)(5660300002)(2906002)(83380400001)(41300700001)(64756008)(66476007)(66946007)(71200400001)(52536014)(33656002)(76116006)(66446008)(66556008)(4326008)(8676002)(8936002)(86362001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGE4VTkwajNBa1Izck5QYk9KaDFZKzEyOFRGMEFHK3pBSjJvQzUxUFdyWmhY?=
 =?utf-8?B?cGo3NSs2dFl6OUF3Tk4xT3lSVWRtbW5yd1RncmgyaGxERXpQbkZwbXdpMnRX?=
 =?utf-8?B?bGlzSEEyZ2JoVG00KzJaNGpPWWRhcmpEVDZzU1VINGJjK3FGNm1ncU04dEFi?=
 =?utf-8?B?TW9QK2VsV3o5NXIvTXYrUjBQaE5WYUVFeHNuM3haL3FnOGwwT1Q4dDBLN3Zh?=
 =?utf-8?B?ZVF0V21JUkg0cnRyeUNlcGZmKzNOdy9hY045RkJacHNrNEkwMDhFNEViT3Bx?=
 =?utf-8?B?aGVEVEkwUnh2U3VSWVE3WTJISWRrdjd3YjRlMmZPWW9KZEYreC9lekRXam1T?=
 =?utf-8?B?Vnl3ZVMzeDRSZURnWFJ6R3Y4Nm5lb1ZSTWxsRTkxbVUwL2JCTndGY1NUbU9s?=
 =?utf-8?B?SythSE1mZ0hjcllvaTVacFZhNndtQkRLd0FaZ3lQT2gvUVhjN3c0NWRLTEd4?=
 =?utf-8?B?cmRnOCtpRkZ4Z1VQTjJsQVFXVHVjZTJBeCs1b001TkxYaHFRQUV3K3RzR3J3?=
 =?utf-8?B?dXBjVGxVNDRxZkhLZXYxaU9xWHVWYjVLaUx5cTRlRis3WVpFd0JSSGszRlJI?=
 =?utf-8?B?SFNZSkhsUXZxQWMreHJWNHBBTWFFOG9IS3dVSXlaT3lIRGVMQzhESTRtS29Q?=
 =?utf-8?B?TXJubnN3dlBZeVJnQ2U0R09pZUZST1FFcjhnaXlmTGFROTY4d2hBQzBKOGJv?=
 =?utf-8?B?djdUVUs3QWtHWnFMTWJad0RNWmNzT1B1Mm5vZEI2VDhPQUR6aEFqRzRvZHdE?=
 =?utf-8?B?cWYzYzNNZDNpSFdkd3BIRkVVdllxTzEzUVJ2YWo0b0svNEdYMVFUb2NlQSt4?=
 =?utf-8?B?dk9RTm9aY1V1Nmg4ME5TTjgxQU1YSlZEVk13ZE4rOU5yWm9nWnd0a0VoaVdr?=
 =?utf-8?B?L0l5Qm9ZMnRNODBnbXkvV1lxdU1RZFFaK1lZWlZ4bnJ0SjQ3YjdXY0pjcklu?=
 =?utf-8?B?bWxSZVVQNk1sVkdPYm0zQ1h5c0NPbUNPcWVveWIzTFA0d0NJWFNFbTdjblYz?=
 =?utf-8?B?QnovRXFKQU15REYwMGdVc1B5OXVKZlpXVkxUWmZoakVsY0RVNHYwR1FWanVi?=
 =?utf-8?B?bG9aWjlKbHhFWm1OVExBUFZEKzEvb3ZxYzRjbjgrbWt5L2hjWitvTDZML2Rh?=
 =?utf-8?B?a3lTcmQ4bW9RSTBmN1JhYnZmWW13ZGl0dGNWeVJQUVB4K2JGZzZiMzdwbkl4?=
 =?utf-8?B?VG81V21nWHN4T29YNlU0MWc4RVNHOTBwT1luVlBDZEVsZHF1Vkg2WE1IYmlz?=
 =?utf-8?B?U09EakpuSXJPSGVOUXlPQUhDMnh3UmJ6VE1YMkNBWVZobGtYTTVRWWFhK1Zl?=
 =?utf-8?B?dCtkZ0VBSUcwMmpHNWYwajM3WExiRW41TStBbkJNRkNnUkVWTmJmK1F1cGdY?=
 =?utf-8?B?b3JaL1l5bEdMT1NRYzYvRGwzZzFaZ2dGMzNUU0E3eDRHZENvWXZXTjVONFF3?=
 =?utf-8?B?M2RYQURIVzFsUmhCK05hTjFqaFA2OTNUb1BxVWdyaTRjSEJpaGJIUzJKeDBL?=
 =?utf-8?B?aVF1aWVLd2MxUDR1blFGcTk0VG1sMVBtQllrdkhIOU90TXVLQ05weUxZa3My?=
 =?utf-8?B?YlVOTlYxVHNka3NBRkd0b1EvazZFQkRQYUdwdjlwV1RwVWpwNDA4R1RVU2RO?=
 =?utf-8?B?VmVqa1dPRTcyZXduSlpaL05pRzN0azY5dGNObFluZHFxVWh5NzcwS0t6RFBC?=
 =?utf-8?B?Um1XUDdqamRQdlFuRkRHK2pWcGtZK0VONGovUFlLeWNDckNpRllKalZCSXlz?=
 =?utf-8?B?K3B3M1ZXTkt0WXNrWVFtQkxUdDZwOWVQdEJ1YkplNE1Qdi80OTJTWkVlYU9y?=
 =?utf-8?B?bnZWdGR6QkZjRVNlTlZJTUJ6OWwzVThrY3k2d1FVejczNlRzK2o5NVYzcXhu?=
 =?utf-8?B?N0g2RE02YVcxV21NNW90Y2plRG9RNlVDWDF2Z2g3Z0RhYkFlZUxPTUoxUXNY?=
 =?utf-8?B?dnN2blBGaHNzUWloYitGa0cvYnJVd0xuYXZldFAxQTVlcE0vL21sZEwyV1VG?=
 =?utf-8?B?azRBKzJtclBCWU14WXNUZEtrdEZyRG9HOTVZREUxNG8xbmRzems5MmdVUnha?=
 =?utf-8?B?cEtWdXRxaVBWQVlQd3p6SGVibkp4UHlaWk9Yd3lzcGNwQy9NVXNVVFpFamhq?=
 =?utf-8?Q?sprRQMsedS7HBcDQxyzxJ80Gi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d685c67-5d03-484f-9754-08da60f34cd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 15:05:30.6857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQJ5AImmtw/Yt8MQ7AcipRzwcDiaUrlGmz/owzX1brckZdEWd+qzucDq4VmzmNrcM+ghci7KUxsEe/LDCEIC7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4935
X-Proofpoint-GUID: vX3dHe9upbaYUHPIYUc1aFyfrH0-JUmT
X-Proofpoint-ORIG-GUID: vX3dHe9upbaYUHPIYUc1aFyfrH0-JUmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_12,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080059
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgOCwgMjAy
MiA0OjUwIFBNDQo+IFRvOiBTYSwgTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogZGV2
aWNldHJlZSA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6R1BJTw0KPiBT
VUJTWVNURU0gPGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgbGludXgtaW5wdXQgPGxpbnV4
LQ0KPiBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc+OyBEbWl0cnkgVG9yb2tob3YNCj4gPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxicmdsQGJnZGV2LnBs
PjsgSGVubmVyaWNoLCBNaWNoYWVsDQo+IDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsg
Um9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IExpbnVzIFdhbGxlaWoNCj4g
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNy8xMF0g
aW5wdXQ6IGtleWJvYXJkOiBhZHA1NTg4LWtleXM6IGZpeCBjb2RpbmcNCj4gc3R5bGUgd2Fybmlu
Z3MNCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIEZyaSwgSnVsIDgsIDIwMjIgYXQgMTE6MzYg
QU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBKdXN0IHNv
bWUgY29kZSBjbGVhbnVwIHJlZ2FyZGluZyBjb2Rpbmcgc3R5bGUuIE5vIGZ1bmN0aW9uYWwNCj4g
Y2hhbmdlcw0KPiA+IGludGVuZGVkLg0KPiANCj4gLi4uDQo+IA0KPiA+IC0jZGVmaW5lIEFEUDU1
ODhfS0VfSUVOICAgICAgICAgKDEgPDwgMCkNCj4gDQo+ID4gKyNkZWZpbmUgQURQNTU4OF9LRV9J
RU4gICAgICAgICBCSVQoMCkNCj4gDQo+IFRoaXMgaXMgYWN0dWFsbHkgYSBjaGFuZ2UuIEFuZCBp
ZiB0aGVyZSB3YXNuJ3QgYml0cy5oIGluY2x1ZGVkLCB5b3UNCj4gd291bGQgZG8gaXQgYXMgd2Vs
bC4NCj4gDQoNCllvdSBtZWFuIGJlY2F1c2Ugb2YgaXQgYmVpbmcgdW5zaWduZWQgbm93PyBXZWxs
LCBJIGd1ZXNzIGl0J3MgdHJ1ZQ0KYnV0IGluIHByYWN0aWNlIEkgZG9uJ3QgdGhpbmsgaXQgd2ls
bCBoYXZlIGFueSBzaWRlIGVmZmVjdC4uDQoNCj4gLi4uDQo+IA0KPiA+ICAjZGVmaW5lIEFEUDU1
ODhfS0VDICAgICAgICAgICAgMHhGDQo+IA0KPiBQcm9iYWJseSB0aGVuIEdFTk1BU0soKSA/DQoN
Ck1ha2VzIHNlbnNlIHllcy4uLg0KDQo+IC4uLg0KPiANCj4gPiAgI2RlZmluZSBLRVlfRVZfTUFT
SyAgICAgICAgICAgICgweDdGKQ0KPiANCj4gR0VOTUFTSygpDQo+IA0KPiAuLi4NCj4gDQo+ID4g
LSNkZWZpbmUgS1BfU0VMKHgpICAgICAgICAgICAgICAoMHhGRkZGID4+ICgxNiAtIHgpKSAgICAv
KiAyXngtMSAqLw0KPiA+ICsjZGVmaW5lIEtQX1NFTCh4KSAgICAgICAgICAgICAgKDB4RkZGRiA+
PiAoMTYgLSAoeCkpKSAgLyogMl54LTEgKi8NCj4gDQo+IERpdHRvLg0KPiANCg0KLSBOdW5vIFPD
oQ0K

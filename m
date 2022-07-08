Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A619956BC75
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237974AbiGHOgE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238209AbiGHOgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:36:00 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD082A435;
        Fri,  8 Jul 2022 07:35:58 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268DCm6r004245;
        Fri, 8 Jul 2022 10:35:52 -0400
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h6jau1h7t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 10:35:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F55egiooCslixo3rHmqUjS9EfaTvLMwUXWe1XuGs297LGYmV4J6bYiAvQQF1RqAlO30eW8Ve8HHHFRII7NS8nYTucmhhOYKWHAmvskmNZRK9vrqYibbUWopn97QpRCT/5aY7xlZzSzWAOY4keKuKyycPjXE6s+pzZJLhvfiXLgzSiCNOj1PN/ReLL2MaspIDSNbVbhqgv1GBrTwDzaKSFmZSLqH+8BmRWbR2GK87sBbUmpNRd72t1IqRQK8CzCl4CV2laBl1I8gcHxNzKNYgUQ9cInV9aJG8X/MxieSKQt05DTQJCAbsHIOih2S/tTZ5JyEiJqPkWOtJ4HhTD2usmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jp5O4pBXFY6brlQoZ9b3WPMMHivA/ML+fesO03BlMA0=;
 b=dnbm0pw4x7oZPTGmK4sqlVAAN9zJVhqlKCq6oCC+gBYMdLwR8Ow6hRmUNJkbesM+fRxp5e8/UcvbPI+M3T7x/v2P+iEegFhrQGeClSWd9SELOsUFIkALkoz7hUyWlslgceyyz2iPQ3Y/jbOZV4QBa0VsrKRebsQt5qD88bokxQszWk8zOgGvs9DroCIq/ORWqs0fS9yG2r/1j22nbMvdafGVbrHoBW7S0qE5nPZhES6KKR6AESwdEKVggO5LysI1iMRU49MGIg8ax+lG43mf9iC0fn2ypFnhHOl4GknZTjeKzksKOPcxAs/Djt9UpNPL+5ZZpjr2Pi9jn0Oy/4G4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jp5O4pBXFY6brlQoZ9b3WPMMHivA/ML+fesO03BlMA0=;
 b=U3b/2Z8B3WdQI3hxtfTkKx0/wQOtnncK4lqZ4Vd8pzoX9fbwbozT9icwutnKpLOOwyow5cUqjQDRhoGaQkGoO3YL7RDO60imOTyNvdaONjSdg2qXW/YZiSJTFk1RX7i2bpKezy8HbwfIuemv2qQYPlEBFrESn96xA8u/wAiPIy8=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by DM6PR03MB5226.namprd03.prod.outlook.com (2603:10b6:5:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 14:35:51 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0%8]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 14:35:51 +0000
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
Subject: RE: [PATCH 03/10] input: keyboard: adp5588-keys: bail out on returned
 error
Thread-Topic: [PATCH 03/10] input: keyboard: adp5588-keys: bail out on
 returned error
Thread-Index: AQHYktar9C51H4g2aUy8A6ypqcNwpK10idGg
Date:   Fri, 8 Jul 2022 14:35:50 +0000
Message-ID: <PH0PR03MB67867C03C5FE5604E948417099829@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
 <20220708093448.42617-4-nuno.sa@analog.com>
 <CAHp75Vconnzkh6JA03X9G7QKNaBEu2fad7GwHckmyZY3rV8QVw@mail.gmail.com>
In-Reply-To: <CAHp75Vconnzkh6JA03X9G7QKNaBEu2fad7GwHckmyZY3rV8QVw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE5ERmhaVEZsT1RBdFptVmpZaTB4TVdWakxUaGlaall0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhEUXhZV1V4WlRreUxXWmxZMkl0TVRGbFl5MDRZ?=
 =?utf-8?B?bVkyTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTVRnM01T?=
 =?utf-8?B?SWdkRDBpTVRNek1ERTNOalExTkRnMU5Ua3dNalUySWlCb1BTSXpkVFIyY0c1?=
 =?utf-8?B?cmQyNVFla1p4VG1RdlpWTkRWWGd3WjNoRk5GRTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVUjNRbWRqUlRKS1RGbEJXVUowWVc1a1VUa3JPWGxuUnpGeFpE?=
 =?utf-8?B?RkVNemN6U1VSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: 1a239526-283d-4be0-a803-08da60ef27f1
x-ms-traffictypediagnostic: DM6PR03MB5226:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r0XpIrL454/0LVt2BOhc4RMxzr1WrWfmEEjc9xy3+Ic6y/kBamNp4yfkt29OZmTT5EoMAmCErO3ulLYaYpWCv2i5GSMQFz3iV4dD+qAyUXqkjR6NllvZVlL6RrO2ZDUXOTBJHY2GrZZJ3U+WzS4vdoXupm4NagqVpPascL9n9PJD7CYThwcLB/aP+NZzoS6KhDZYq3vEauEs1/SuRET2SxS1hiszhlAlnovESyiUIvHBpLbbWSzO3eFVcbUgzHxcCtsY4PWnkmZpAQlVUqbvvtWB2MlpRn/IpNsM/HTuX+wbsma44e7oz4cZ7+9tTYzWIMb6Vi1CBU6ee3htUOr0BIEDbF5PC/FQ472WfOqInqTmPRyaWIyZP14JrV87PTIB6UvrotUbjc2eqot3oJ1t78DEABophIINoENYNLQO5KGTrT7F7iwDZxiwB/yvxzterU41Q1USv9L/cu6uZ4AxZQQKTkd57wtN55OuVm3TwgKDJlsMFps2D22wMHmIG0XtoKH3QLquOoy+A1ai6+TOBhCUvwzW7fvpD9zFiyXySB6OGG6F9dmigFgoieynUYBGIGCILZ9Jv3Myzqt1PYlwLw2M41qh97q4JYR7kDHkrBJ/iXb6FlaqevtS6XgKMjSe9hapHvIvuuHzC08WK/GHapEgQrpf0jt7mifGgjyOL9rbHLImCbZ8jgdT/946BnQRNv7Mq3rqeeYwo+KJKphk9rWBz4wJqF5KnbDiCpu+6RddPa6qHs5X0E8gD5QZ60/wQBqxFDv7jvOizCeMRIWpOShgEjkdjKgjaEUoC0Y0rayy8c9U325V5hVCwTeYhcSt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(52536014)(9686003)(26005)(71200400001)(66556008)(122000001)(8676002)(55016003)(186003)(86362001)(6916009)(83380400001)(38070700005)(8936002)(64756008)(53546011)(76116006)(66946007)(478600001)(66476007)(66446008)(2906002)(54906003)(38100700002)(6506007)(316002)(5660300002)(4326008)(33656002)(7696005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk1RWSsvcXdtS3ZJcEovWXpjZ3IyZFBETkxtRHF2OVN0WmE4NHUvUWdrNGYw?=
 =?utf-8?B?RnNMejJQQitQSzN4Z1pIbWpHMjk3a2RjclJMMDR0VFRzOGlOZFk2OXFsWlBo?=
 =?utf-8?B?bW5GNzJTQ2k3eUdwd2VISzJIZ2c0b2xZelBSK2tnL1VpWm9JYXJISCtOTnZJ?=
 =?utf-8?B?SG50a0RDWDFaeU40dldVNExRRlhzWlA3UzljbVFENWJJd0kxSVBHd1lWYzZq?=
 =?utf-8?B?N3FnT1A1emNocmxLVkd0T2dhYUQ2MzBDdGt2U2R3VHhjekdrNGtmZ1Y0L0Z4?=
 =?utf-8?B?Q01hbFZ0c2xPb1Jab05GWVAvbUpSZm90aytjZGxiVWk1ZEN2NzJMaVgrZkF5?=
 =?utf-8?B?NlJLaW50TlFTNGVkSXJtdEs2SjhZWTcxMWdsUysyenJPTXhWenlwVmprSjRl?=
 =?utf-8?B?amlqVGVGcUxXaVRHVkJqUHhpeTBabmJMOHFHaXh2QVdWSjFCRng2SmJ1ZFNW?=
 =?utf-8?B?c29VTDcrb2RGbTk0clg3Q2tVZTFieHEzUXR2OG8rRnhiRG9NYmc2RE5ZcCto?=
 =?utf-8?B?MEdaWE1ZTUVmVjkvbGxBSHg5Yk4rR1pTZ2piTUFsM1pPa0Y0cHFDQUlmTnl1?=
 =?utf-8?B?NDliVVd2OWJBcVI3cjZYTng4MS9ROTBRbTM4RVVEdTdiTTVJOWgwNWNWVjJx?=
 =?utf-8?B?Z0F6YU9mc0tjK0VJRkREUlRrb2RhUm5NMlJoa1RKMjl0UnRSOGMzSWc5NTQ0?=
 =?utf-8?B?TGIwNXZOSExjTklrY0VEQ2lrenMwWU5vc2ZEVWRRQm45aWtLNnFGWGJEZ3ZE?=
 =?utf-8?B?LzF0Wi9wVGxjbGltUlF6d3YvdmoyaDdPYWUwWG54Y2FiZERqYjdrcHhnZDgw?=
 =?utf-8?B?QzV6R1ZXVFh4VDBZR0Z3NFo3MmNlRW12L1hqQ1BOd0czZExZWGR3cTVFalJZ?=
 =?utf-8?B?VnV4N2lJblpRM1RnUnE3VURNSnNTWUFwWHd5KyszSVZ3VnBlSS8rNTJOZmRp?=
 =?utf-8?B?ZnRLdS9LcVZJbjJBcCs1cmk3MGUxczBsNVBtV0t1QmZ3SjNkS0ptMnRzWW5r?=
 =?utf-8?B?QUVpUHVGMXFTWTN0SmQvbDltNXBQQ255OFNHL3JhVGZ5V0dRUlFVY2Q1WUxs?=
 =?utf-8?B?YUNIYXh5Smh3a1VvYUVnbXY3UFFMSmxzZmVoa1lPQVJWQ2Z3RDk0WWtaV3Ri?=
 =?utf-8?B?RnJFaXhIaVE4MjJNSnhzU1pCdHNCbFVIWnJad2JUMTVMd2NRdExXOFdWMEhy?=
 =?utf-8?B?RVVDbk9iNmRrNzV2cXQ3emg3TVRxdFpPMFNKSGdkaUh2QnZLSE41VUlmckRJ?=
 =?utf-8?B?dkJWdmFVU0srczdjTzdhMDlPdk04QWxkR0pvWnhtSWN0enU1dmt0OGxrWW9q?=
 =?utf-8?B?TE15NWliMkV5cTRZcTBta2Z4Ym92bUc1em9XTVIxYy9EV2c2ZnJRejJBMStn?=
 =?utf-8?B?Y2tKVExRRHJUMXp4ZUczTTVucmVPNWtiVDBQSWVLQUt3Q1BpMWUrMnRhZGJh?=
 =?utf-8?B?cEFyaGJra21xS2JKS2trQjV0UVA4UlpHTGU2NVlxNkdzRWlVRk5RaldZQlo0?=
 =?utf-8?B?azU2SzU0ZHg4Y2JUTjFFaWE2V2FFVTdRYnFkU1R5MkQrK2VhTnNBN2k0MVJy?=
 =?utf-8?B?L1B6c0tFMVRTUlBEQ1FmL3dmNXNNU3VuS0U1Q0NGc2lXM1d6cjBhbEJ6akkr?=
 =?utf-8?B?R25Ic1Z4NGYvS0NkU3lsdDlEVzdPUVVmSUFhOS8xRnpRelpXM0FCYmFHQWl4?=
 =?utf-8?B?Q3p3RGhpUndUVWtiNDV4Smg4dmZaRjhlcFFuUmYrcTk1cXFpK3h6WFpuN2ln?=
 =?utf-8?B?MUN0a2UvVnZNQkhvbmw5TWl0QlZjUWYxY0ZWeThweHd5R3B0MkhGMms5RmlI?=
 =?utf-8?B?a2N3MjVZcmhkY1lENGZjLzdwSCtJV2sybmxKTVNMQmVZbDN3UzR5VW1LaUR4?=
 =?utf-8?B?Q1dsUGI4MkU1UGJ2cUErVlkrdCtvS2ViMFVvT1l0eW82clcxd3hGSWxYMkds?=
 =?utf-8?B?MS9VdDBrWkJPWmtzd05lWEJRRWQ5UVA4UTRsRUdzTklCZDExbmVGMFJXMCtD?=
 =?utf-8?B?OVErV1VuckRmSkxTeFhSWTdsWVkwTU1KNmU4VU9xVFNJQzZhSlJKSy9QSHBy?=
 =?utf-8?B?SVNYdGIrdnRJVmNydDdHOFVMQjF4TnhhNUtBQlNNVUVkN0Z0WFdQYVpLMlFW?=
 =?utf-8?Q?yXyPV73/u2jQtek0hX/Arxhcq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a239526-283d-4be0-a803-08da60ef27f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 14:35:50.9632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGCvhualuZ4zewbcrxlzQNmkR2iyo6xTg5sRr/IRC4Kbpdprw3OVrNSifxK42PzMx+g/kRVABQDbYXoqegWVvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5226
X-Proofpoint-ORIG-GUID: GtHkNE9SajlofjAUVMLNQC8fvdpRsIB1
X-Proofpoint-GUID: GtHkNE9SajlofjAUVMLNQC8fvdpRsIB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_12,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080056
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
MiA0OjI1IFBNDQo+IFRvOiBTYSwgTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogZGV2
aWNldHJlZSA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6R1BJTw0KPiBT
VUJTWVNURU0gPGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgbGludXgtaW5wdXQgPGxpbnV4
LQ0KPiBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc+OyBEbWl0cnkgVG9yb2tob3YNCj4gPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxicmdsQGJnZGV2LnBs
PjsgSGVubmVyaWNoLCBNaWNoYWVsDQo+IDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsg
Um9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IExpbnVzIFdhbGxlaWoNCj4g
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMy8xMF0g
aW5wdXQ6IGtleWJvYXJkOiBhZHA1NTg4LWtleXM6IGJhaWwgb3V0IG9uDQo+IHJldHVybmVkIGVy
cm9yDQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiBGcmksIEp1bCA4LCAyMDIyIGF0IDExOjM2
IEFNIE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRG9uJ3Qg
Y29udGludWUgaW4gY29kZSBwYXRocyBhZnRlciBzb21lIGVycm9yIGlzIGZvdW5kLiBJdCBtYWtl
cyBubw0KPiA+IHNlbnNlIHRvIGRvIGFueSBvdGhlciBkZXZpY2UgY29uZmlndXJhdGlvbiBpZiBh
IHByZXZpb3VzIG9uZSBmYWlsZWQuDQo+IA0KPiAuLi4NCj4gDQo+ID4gICAgICAgICAgICAgICAg
IGZvciAoaSA9IDA7IGkgPD0gQURQNTU4OF9CQU5LKEFEUDU1ODhfTUFYR1BJTyk7IGkrKykgew0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBwdWxsX21hc2sgPSBncGlvX2RhdGEtPnB1
bGx1cF9kaXNfbWFzazsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCB8PSBh
ZHA1NTg4X3dyaXRlKGNsaWVudCwgR1BJT19QVUxMMSArIGksDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0ID0gYWRwNTU4OF93cml0ZShjbGllbnQsIEdQSU9fUFVMTDEgKyBpLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHB1bGxfbWFzayA+PiAoOCAqIGkpKSAm
IDB4RkYpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgICAgICAgICAgICAg
ICB9DQo+IA0KPiBMb29rcyBsaWtlIGEgZ29vZCBjYW5kaWRhdGUgZm9yIGJpdG1hcF9nZXRfdmFs
dWU4KHB1bGxfbWFzaykuDQo+IA0KDQpJJ20gbm90IHRvdWNoaW5nIHRoZSBvcmlnaW5hbCB3YXkg
dGhlIGRyaXZlciB3YXMgaGFuZGxpbmcgdGhpcw0Ka2luZCBvZiBzdHVmZi4gSSBkbyBoYXZlIGlu
IG15IG1pbmQgdG8ganVzdCBjb252ZXJ0IHRoaXMgZHJpdmVyIHRvIHVzZQ0KcmVnbWFwIGFuZCB3
aXRoIGl0IChieSB1c2luZyB0aGUgKmJpdHMgZnVuY3Rpb25zKSB3ZSBjYW4gZ2V0IHJpZCBvZg0K
bW9zdCBvZiB0aGUgInBsYWluIiBiaXRtYXBzIGluIHRoZSBkcml2ZXIuDQoNCi0gTnVubyBTw6EN
Cg==

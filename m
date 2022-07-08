Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B8356BD99
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 18:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238492AbiGHPYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbiGHPYw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:24:52 -0400
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EAF61D4E;
        Fri,  8 Jul 2022 08:24:51 -0700 (PDT)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268EVP4R010330;
        Fri, 8 Jul 2022 11:24:46 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3h4ubnvswj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 11:24:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5lqIG90zljMMFcqNybkRWG+IMevOP21mhxOJGV73wvv8Kho2/4JPk18bJBnSjH9fmjN36EaoJQAY/qAod7C320kxGY5qXVh+CHls9iuBj3t04MLmCYhgvydHe1D72XmvV9OkIjWmELp5XpxgIxfYnKyJA/lBTgODLe8Zu1XxIT4Kk2kAHnLBsfQ+ha6CmC8QPnAzcwaH+ic/z22F2kqkO2Pyhfe1VCRaZRgrSGB9OcnlDT1DRDjZRukzkVrTWnQPu7n6xtkSqXe+h2jjBqI/wrMS3w4DGyok8UHbgys7qpJW/tA8VcQab4Z2NM3I6ubr/o0ViwFb+AS3Z/x4Lqucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbiEtR6T39iKgoGW1VxNPoJfTXAhy0PvRCaG56+dPh4=;
 b=SFvL/hBroafwfmJ5zvFHtnIKzewOwyADUNk9XUXaAuluuqq7SIOSbljuCyU0JlZ3JbGQhDATUJPtc4NStONW+fbHu8XO+utQDIIb/EWjc5U/CYwa92zjBmd/POuDDqVhkJlhSbvkJetU8UrSBmIas9o5HYkVKxrs0tCSZ2axNDBOUbVGDZytW+LiPLW7qcOR8pGkX3MU3vTeW9UQK8UahaE//p5pLgUCtW4279z4e175wP1VXaM0hq4Qovx4zXrEcXwbJwxR1PeqkhYVjl+b2tVom+wsUZXuhGPaS9HukjnMFu+jhogkSgPJvJcoIi6OlZ0cLTQ6ZdjfRlTUyTUvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbiEtR6T39iKgoGW1VxNPoJfTXAhy0PvRCaG56+dPh4=;
 b=F97Qz37VzOc9uuBepVoQfYL/H26l1g0W24UCUtWJq0TxuXB9wuND2dTXmV6qvRLjQA8vet4upZM30wwEoIVPDOJsp4GIdN4n/5/MFWpwpJq2Qlz4nUpxpdm0FWQkxgY7hoct1LmLjgv0uUi+/9njyOvoFv5mfQHD1/FLHo5KERM=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by SA2PR03MB5884.namprd03.prod.outlook.com (2603:10b6:806:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 15:24:44 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0%8]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 15:24:43 +0000
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
Thread-Index: AQHYktWsuvxEkAUvDUCJ5v5gv46a/610inOwgAAICYCAAAR68A==
Date:   Fri, 8 Jul 2022 15:24:43 +0000
Message-ID: <PH0PR03MB678606B868F668FFBE9DF8FE99829@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
 <20220708093448.42617-2-nuno.sa@analog.com>
 <CAHp75VcJErVteT0P7=HhHB+c0UWFP8R5rc6u==Zf4p5JS4c=6A@mail.gmail.com>
 <PH0PR03MB678607A61ECA67E28480565499829@PH0PR03MB6786.namprd03.prod.outlook.com>
 <CAHp75VfWABdHczuvBPh02cNarZZwNw-M8LhMmMQuFX6pDNMn+w@mail.gmail.com>
In-Reply-To: <CAHp75VfWABdHczuvBPh02cNarZZwNw-M8LhMmMQuFX6pDNMn+w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE1UVTRNREV4TkRjdFptVmtNaTB4TVdWakxUaGlaall0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhERTFPREF4TVRRNUxXWmxaREl0TVRGbFl5MDRZ?=
 =?utf-8?B?bVkyTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTlRFek1p?=
 =?utf-8?B?SWdkRDBpTVRNek1ERTNOamMwT0RBNU1EYzFOekF5SWlCb1BTSnhaMDFVVmxs?=
 =?utf-8?B?QlYwNURaVkF4VFZGSlJGRnRTalo1ZG1kU1RqQTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVUXlOVGxtV0ROd1RGbEJZVlJDVkVwNWNuVlJaWGR3VFVaTmJr?=
 =?utf-8?B?dDFOVUkzUVVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: e067b848-ba6a-4724-51bd-08da60f5fbbe
x-ms-traffictypediagnostic: SA2PR03MB5884:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bHNlsM1xme9rsZ+QRqxuLaQ61o2kJkZ71ED1lciZlL0aFfug0hpXmLsbPT7QkNQPz3x0hI+ciYYjePLtlaNa2beuOe99yXx4mfmJdptKLPxZnZ7GSOc3xFAhs8fbCCvzod8Pf1gELId8UDglXME3OgvopuWx80Acc5Wxis7lHw/heeXIHvBhse448r8olDyKjL6JUB2CbMV7kZ+PWVLysid67Bbpg2EUZVWho4twk3rbpeu5uiWd8jMZf7/Qo4FeVj7Ev6uHE3kCjly/Aa08bXMlyRaNdS/x4pSCwIhBZecm0GmSFFVyrwFiOoGcq51H2OdMTcybwxn80rvGCuKbyKQXfo1emloDQA0PYsi2r2I7jQaZtmomIXKrncZv/qZVFbug2InoZteExJU8IkN4gKVtiCZWfP+/kF2OQkgZUD5VJIF8tRUG/TZjOTw3HZr6wQrfeovK9tE9f8EaMSoMPHKZwKI5pj09Y0JnkFVnufYtjc/WIXweZD3RqGzvnbGm9kojXONWTu3dihVh3k+U+CIXd7rYjrEgb/4KlUnF9dL3TLOoZM+jAYmK0ZN8PBiyRYKGEXiPdVFcJSUsvZYkCyynVJPYFg/Fii7Os/b4gdfbjLGhx9RRuaMG87/Gj9fv30w+okPxhs1E1onAUYCgV/epZJiyzoQSZtQgUHgyJL7uWsnIv9pfXKOsm/G4QuQ77H45i3Squ3xAHPusdtV+2dIdblyKVUieZLozfBM1Ryc82ELQ3qdBTEE/eApMvKRmhbEKmPSa2I59g/uBbgBXeqJQEH2dgXIi7T7GLftf3gAUfKc3VzZmHvnwksZZ8W18
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(55016003)(38070700005)(86362001)(33656002)(122000001)(478600001)(38100700002)(64756008)(26005)(54906003)(71200400001)(41300700001)(66556008)(53546011)(6506007)(8936002)(7696005)(66446008)(186003)(9686003)(76116006)(83380400001)(52536014)(2906002)(5660300002)(66476007)(316002)(4326008)(8676002)(66946007)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUVlS012d2lnZ0JIaWtSc0JjUC9sd0pwLzlqNENpQzNnVDU0SndMSUcvVjBl?=
 =?utf-8?B?dnJ1aURXZVJwNXhkK1pUTE9uYTYzdnNYOHlVVDJoR0EvQzd0VklRYkR0aWE3?=
 =?utf-8?B?SlkyNS9obzRNbGp4bGkreldjbUFWN1JaelBEZ0haanVBb3dMYlBUMUFWaSs3?=
 =?utf-8?B?WmJHdDNhUC9BT3JMWXk2UXhuL1VkdHFMR2gvTUxzL2Q0UTFnejFCc2RQbmN3?=
 =?utf-8?B?bE44Um1JRENGOFAyZFg3ZzYzcVlMYUI0NzVTRHVKRmhaTlYyTzJCdUJMT0dO?=
 =?utf-8?B?VFg2RTYya3REU0NBdDdvVmlTczZyTmJzWTl3VXJtRFk0cGlPUlc0aXpVRWhN?=
 =?utf-8?B?cTBZR1dpdEl3emExQm8zZ0t2K1pTK1QxREZDOGFwdGw2cStVNVpoSzM2OWVo?=
 =?utf-8?B?cXZ2S0o5aU5lVXFKZlo2bkFVcnQwVGd2c2Q4Tk5idzN2THdFcERVa2prSWdn?=
 =?utf-8?B?ZWhZb1lnZHVubHNDWGxNU1VONlZNRUFIa2UzUGxiSDhUcVIxRjhjc0gwTkZo?=
 =?utf-8?B?TXIxaEhDaFY0R2hiRjdLUFRhY2pqb1lKVE5OUzVzb0Y0Vm9QWGJQbnRPUW5J?=
 =?utf-8?B?Sk4rWjhiK1NsNkhRc2YxU3krZDNKM2c5cnVnY29tU2JEV1IrSVVUUTlUalhX?=
 =?utf-8?B?UFpVaEd1MDVLZ3Q5UzQ2VU5JaUZFZ3lQa1N2OHRwemNqemJCNzRqTStpNlJF?=
 =?utf-8?B?VGFBekptOVBnSm1nRitmaHdOZ09mWFhpOU8zRWNxQndiaGRYQlAyeXpyelcy?=
 =?utf-8?B?c2kvWU4vZy9Ddyt6cDExbXRRZFg5NFZnbjFKVGZEUmxSZ2daVXB5RFJPdEYx?=
 =?utf-8?B?QkhkVCs2S1FodC83eHdHQXZybkhnQ0V6d25vdHlTV0g2RXcxMXlMYnZuaDAw?=
 =?utf-8?B?VzdVczYzMFBrRHphOEVYWVZPTXcvN0RtbzVXSzlPdG5uVG1HaU96dnFiMVNH?=
 =?utf-8?B?UGtiWWtvWEpDWmFrN2RVUmZJY3M5aW9GWjZrUGNvd3NxMFdMUFJoYkpXbFo4?=
 =?utf-8?B?UGt4dkpvbVFTL0VsUml4bW1JTzBxcFBwRzhXK3RkeHFPYm1mdmFBaEV2OFR4?=
 =?utf-8?B?K1FYVGtzZktVdUhxbUJuSHdXVnh2bnVaa2lONGNlMWxGMmY2MTlnakxxdG9j?=
 =?utf-8?B?TXN6dU1lSlF6TnZjOWZSd0xpYUVtNDg0cmtTYlNSODlrN2hHaERsSG94TWtv?=
 =?utf-8?B?K040SHFsSURSdStESFN3N2hSMStuMHpqVnN2elhJRjlwV3REcXhrei9uc1NO?=
 =?utf-8?B?QmJJZGY2NTIveXJkTy9JaVJCT2hHdTFTTEliYjQ0Rld0TDdrRmFUT1FTV2VY?=
 =?utf-8?B?R0JVc0ZEWjYvN2V5UXp6MUgxRnlteFV0VmpDRklFV2xjbjdJVk1nWk9wLzF1?=
 =?utf-8?B?aEwrdnlDYXRNVG5wbXlsKzc2ZWU4TFNBdGc3Ky9BOFRma2Q4YUZaU2M5L2R1?=
 =?utf-8?B?Y1JKVm9rZS9MUmNoNHBlQ2FVd3BvK3NQaVc2QjU5V1p5UnFJR20zSHVWcDZK?=
 =?utf-8?B?dEJrM1lPYXpPNmUwZVVRMi85Z2U2WWpwb2d4WnFQMnduVmNERDViaWFNdFBN?=
 =?utf-8?B?NXM4WEsyTFRhRC9TbUU3YmRQQnVyelFjdUdIWGlBLzBoK2t3eWFnZEs1RzFq?=
 =?utf-8?B?eWlBODhBdVNpQit5WWRobzhiSlVQOFFnTDUyRmZocmdGczNXdE5LeHRER1hp?=
 =?utf-8?B?UzBBTVFOVTdKem9QU2p3SG05YkVaMXFkbUQvUGs3L2p3aWV0UWFxMGRuVzE1?=
 =?utf-8?B?dWdVdlNNSjA5bWJ4NGtVN04yb2xUN1Z5SnArSk5UNGp0Y1NzNXdRMDFpc2lp?=
 =?utf-8?B?SWNFUVcxV2M4MjBxajVUZmVIb0tDMHM0ZDNZcFhsQk9FQjdETThUQlp1dC9R?=
 =?utf-8?B?U2dPNHhweW1LYk5RbDVPMzhianY0ZXhwd1NDbTNwb05DOVZ4ZUpqY1N6YkxN?=
 =?utf-8?B?dno4MGNRVFM2K0VVM3VnejNXVkl3OXdZd2dZRDZ2VWtYNjVEYWhOa09RakU5?=
 =?utf-8?B?VUgyVjhiWEJXc1ZmTGZxMXNaRFdlZWJod09NQ1FSUVJLRW5GZEFIY0Z4M243?=
 =?utf-8?B?UHZjUmVGWnpOb0tSZU55bVR1V2tSR0tHQ1V0UDlkazlKL1hObWFkc294MmFQ?=
 =?utf-8?Q?jW065me9P4b8bcs7RwMMuaORP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e067b848-ba6a-4724-51bd-08da60f5fbbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 15:24:43.2529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQesSDLzvEZcW7XSrLfJODNjsEbvxJdJTd6HBHON9OlF9lxA7ZUlBeSQqe0NS9rgTSzmo2QkO45bK0q0shIqTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5884
X-Proofpoint-GUID: 12dBETuOCFQPvK2uVGBTbFdvWkkZhjC8
X-Proofpoint-ORIG-GUID: 12dBETuOCFQPvK2uVGBTbFdvWkkZhjC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_12,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080060
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
MiA1OjA1IFBNDQo+IFRvOiBTYSwgTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogZGV2
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
MjIgYXQgNDo1NSBQTSBTYSwgTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPiB3cm90ZToNCj4gPiA+
IEZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4gPiA+
IFNlbnQ6IEZyaWRheSwgSnVseSA4LCAyMDIyIDQ6MTggUE0NCj4gPiA+IE9uIEZyaSwgSnVsIDgs
IDIwMjIgYXQgMTE6MzYgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4NCj4gd3JvdGU6
DQo+IA0KPiAuLi4NCj4gDQo+ID4gPiA+ICsgICAgICAga3BhZC0+Z2MucGFyZW50ID0gJmtwYWQt
PmNsaWVudC0+ZGV2Ow0KPiA+ID4NCj4gPiA+ID4gKyAgICAgICBrcGFkLT5nYy5vZl9ub2RlID0g
a3BhZC0+Y2xpZW50LT5kZXYub2Zfbm9kZTsNCj4gPiA+DQo+ID4gPiBXZSBhcmUgZ29pbmcgdG8g
cmVtb3ZlIG9mX25vZGUgZnJvbSBHUElPLiBNb3Jlb3ZlciB0aGUgcGFyZW50DQo+ID4gPiBkZXZp
Y2UNCj4gPiA+IGFuZCBpdHMgbm9kZSBpcyBhIGR1cGxpY2F0aW9uLCBqdXN0IGRyb3AgdGhlIGxh
dHRlciBhbmQgR1BJTyBsaWJyYXJ5DQo+ID4gPiB3aWxsIHRha2UgY2FyZSBvZiBpdC4NCj4gPiA+
DQo+ID4NCj4gPiBXZWxsIHRoZSBvZl9ub2RlIHdhcyBzZXQgc28gdGhhdCBJIGhhZCBhIHByb3Bl
ciBuYW1lIGluIHRoZSBJUlENCj4gZG9tYWluDQo+ID4gSUlSQy4gV2lsbCB0aGlzIGJlIGhhbmRs
ZWQgaW4gdGhlIEdQSU8gbGliIGluIHRoZSBmdXR1cmU/DQo+IA0KPiBJbiB5b3VyIGNhc2UgaXQn
cyBhIGR1cC4gU28gaW4gX3lvdXJfIGNhc2UgaXQgd2lsbCBiZSBoYW5kbGVkIGluIHRoZQ0KPiBm
dXR1cmUuIEZvciB0aGUgcmVzdCB3ZSBhbHJlYWR5IGhhdmUgYW4gZndub2RlIG1lbWJlci4NCg0K
b2ssIEkgd2lsbCBkcm9wIHRoZSBhc3NpZ25tZW50Li4uDQoNCj4gPiBUaGUgcGFyZW50IGFzc2ln
bm1lbnQgd2FzIGFsc28gdG8gbWFrZSB0aGluZ3MgbmVhdGVyIGluDQo+ID4gL3N5cy9rZXJuZWwv
ZGVidWcvZ3Bpby4NCj4gDQo+IFN1cmUuDQo+IA0KPiAuLi4NCj4gDQo+ID4gPiA+ICsgICAgICAg
Z2lycS0+aGFuZGxlciA9IGhhbmRsZV9zaW1wbGVfaXJxOw0KPiA+ID4NCj4gPiA+IEJ5IGRlZmF1
bHQgaXQgc2hvdWxkIGJlIGhhbmRsZV9iYWRfaXJxKCkgYW5kIGxvY2tlZCBpbiB0aGUgLQ0KPiA+
ID4gPmlycV9zZXRfdHlwZSgpLg0KPiA+ID4NCj4gPiA+ID4gKyAgICAgICBnaXJxLT50aHJlYWRl
ZCA9IHRydWU7DQo+ID4gPg0KPiA+ID4gU2VlIGRvY3VtZW50YXRpb24gYWJvdmUuDQo+ID4NCj4g
PiBJIHNlZS4uLiBJIHdpbGwgbG9vayBhdCBEb2NzLiBJbiBwcmFjdGljZSBJIGRvbid0IHRoaW5r
IHRoaXMgbWF0dGVycyBtdWNoDQo+ID4gc2luY2UgdGhpcyBoYW5kbGVyIHNob3VsZCBuZXZlciBy
ZWFsbHkgYmUgY2FsbGVkIChJIHRoaW5rKSBhcyB3ZSBqdXN0DQo+ID4gY2FsbCBoYW5kbGVfbmVz
dGVkX2lycSgpLg0KPiANCj4gVGhlcmUgYXJlIHR3byBkaWZmZXJlbnQgY29tbWVudHMsIG9uZSBh
Ym91dCBoYW5kbGVyLCBhbm90aGVyIGFib3V0DQo+IGhvdw0KPiB0byBwcm9wZXJseSB3cml0ZSBJ
UlEgY2hpcCBkYXRhIHN0cnVjdHVyZSBhbmQgbWFzaygpL3VubWFzaygpDQo+IGNhbGxiYWNrcy4N
Cj4gDQo+IC4uLg0KPiANCj4gPiA+ID4gKyAgICAgICAvKiBzaG91bGQgbmV2ZXIgaGFwcGVuICov
DQo+ID4gPg0KPiA+ID4gVGhlbiB3aHkgaXQncyBoZXJlPw0KPiA+DQo+ID4gYmVjYXVzZSBJIGRv
IG5vdCB0cnVzdCB0aGUgSFcgdG8gYWx3YXlzIGNvb3BlcmF0ZSA6KS4gSW4gdGhlb3J5LA0KPiA+
IHdlIGNhbiBnZXQgc29tZSBpbnZhbGlkICdncGlvJyBmcm9tIGl0Lg0KPiA+DQo+ID4gPiA+ICsg
ICAgICAgV0FSTl9PTl9PTkNFKGh3aXJxID09IG5ncGlvcyk7DQo+IA0KPiBPbiBzb21lIHNldHVw
cyB0aGlzIGNhbiBsZWFkIHRvIHBhbmljLiBXaHk/IElzIHRoaXMgc28gY3JpdGljYWwgZXJyb3I/
DQoNCkFoaCwgeW91J3JlIHJpZ2h0LiBGb3Jnb3QgdGhhdCBpbiBzb21lIGNhc2VzIFdBUk4gY2Fu
IGFjdHVhbGx5IHBhbmljLg0KDQo+IGhhcmR3YXJlIGNhbid0IGFueW1vcmUgZnVuY3Rpb24/DQoN
CklmIHdlIGdldCBpbiBoZXJlLCB0aGUgZGV2aWNlIGlzIHByb2JhYmx5IGluIGEgdmVyeSBiYWQg
c3RhdGUgYnV0IHRoYXQNCmRvZXMgbm90IG1lYW4gdGhhdCB0aGUgc3lzdGVtIGlzLi4uDQoNCkkg
d2lsbCBqdXN0IG1vdmUgdG8gZGV2X3dhcm4oKS4gVGhhbmtzIGZvciB0aGUgcmVtYWluZGVyIQ0K
DQo+IC4uLg0KPiANCj4gPiA+IEkgZG9uJ3Qga25vdyB0aGlzIGNvZGUsIGNhbiB5b3Ugc3VtbWFy
aXplIHdoeSB0aGlzIGFkZGl0aW9uYWwNCj4gbWFwcGluZw0KPiA+ID4gaXMgbmVlZGVkPw0KPiA+
DQo+ID4gWW91IGhhdmUgMTggcG9zc2libGUgcGlucyB0byB1c2UgYXMgR1BJT3MgKGFuZCBoZW5j
ZSBiZSBJUlENCj4gc291cmNlcykuIE5vdywNCj4gPiBpZiB5b3UganVzdCB3YW50IHRvIHVzZSBw
aW5zIDE2IGFuZCAxNyB0aGF0IHdpbGwgbWFwIGludCBod2lycSAwIGFuZCAxLg0KPiBCdXQNCj4g
PiB3aGF0IHdlIGdldCBmcm9tIHRoZSBkZXZpY2UgaW4gJ2tleV92YWwgLSBHUElfUElOX0JBU0Un
IGlzLCBmb3INCj4gZXhhbXBsZSwNCj4gPiAxNiBhbmQgc28gd2UgbmVlZCB0byBnZXQgdGhlIGh3
aXJxIHdoaWNoIHdpbGwgYmUgMC4gSXQncyBwcmV0dHkgbXVjaA0KPiB0aGUNCj4gPiByZXZlcnNl
IG9mIHdoYXQgaXQncyBiZWluZyBkb25lIGluIHRoZSBHUElPcyBjYWxsYmFja3MuDQo+IA0KPiBB
bnkgcmVhc29uIHdoeSBpcnFfdmFsaWRfbWFzayBjYW4ndCBiZSB1c2VkIGZvciB0aGF0Pw0KDQpJ
IHdpbGwgaGF2ZSB0byBsb29rIGF0IGlycV92YWxpZF9tYXNrLg0KDQo+IC4uLg0KPiANCj4gPiA+
ID4gKyAgICAgICAvKg0KPiA+ID4gPiArICAgICAgICAqIERlZmF1bHQgaXMgYWN0aXZlIGxvdyB3
aGljaCBtZWFucyBrZXlfcHJlc3MgaXMgYXNzZXJ0ZWQNCj4gb24NCj4gPiA+ID4gKyAgICAgICAg
KiB0aGUgZmFsbGluZyBlZGdlLg0KPiA+ID4gPiArICAgICAgICAqLw0KPiA+ID4gPiArICAgICAg
IGlmICgoaXJxX3R5cGUgJiBJUlFfVFlQRV9FREdFX1JJU0lORyAmJiAha2V5X3ByZXNzKSB8fA0K
PiA+ID4gPiArICAgICAgICAgICAoaXJxX3R5cGUgJiBJUlFfVFlQRV9FREdFX0ZBTExJTkcgJiYg
a2V5X3ByZXNzKSkNCj4gPiA+DQo+ID4gPiBUaGlzIGlzIGR1cCBmcm9tIC0+aXJxX3NldF90eXBl
KCkuIE9yIGhvdyB0aGlzIGNhbiBiZSBub3QgbGlrZSB0aGlzPw0KPiA+DQo+ID4gV2UgZ2V0IGhl
cmUgaWYgd2UgZ2V0IGEga2V5IHByZXNzIChmYWxsaW5nIGVkZ2UpIG9yIGEga2V5IHJlbGVhc2UN
Cj4gKHJpc2luZw0KPiA+IGVkZ2UpLiBUaGUgZXZlbnRzIGFyZSBnaXZlbiBieSB0aGUgZGV2aWNl
IGFuZCBpdCBtaWdodCBiZSB0aGF0IGluDQo+IHNvbWUNCj4gPiBjYXNlcyB3ZSBqdXN0IHdhbnQg
dG8gaGFuZGxlL3Byb3BhZ2F0ZSBrZXkgcHJlc3Nlcw0KPiA+IChub3Qgc3VyZSBpZiBpdCBtYWtl
cyBzZW5zZSkuIFNvIHdlIG5lZWQgdG8gbWF0Y2ggaXQgd2l0aCB0aGUNCj4gPiBhcHByb3ByaWF0
ZSBpcnFfdHlwZSByZXF1ZXN0ZWQuIE5vdGUgdGhhdCB0aGlzIGtpbmQgb2YgY29udHJvbGxpbmcg
dGhlDQo+IElSUQ0KPiA+IGZyb20gU1cgYXMgdGhlcmUncyBubyB3YXkgZnJvbSBkb2luZyBpdCBp
biB0aGUgZGV2aWNlLiBUaGF0IGlzIHdoeSB3ZQ0KPiBkb24ndA0KPiA+IGRvIG1vcmUgdGhhbiBq
dXN0IG1ha2luZyBzdXJlIHRoZSBJUlEgdHlwZXMgYXJlIHZhbGlkIGluDQo+IGlycV9zZXRfdHlw
ZS4NCj4gDQo+IEkgc2VlLCB0aGFua3MgZm9yIGVsYWJvcmF0aW9uLg0KPiANCj4gLi4uDQo+IA0K
PiA+ID4gPiArICAgICAgICAgICAgICAgaGFuZGxlX25lc3RlZF9pcnEoaXJxKTsNCj4gPiA+DQo+
ID4gPiBUaGVyZSBpcyBuZXcgaGVscGVycyBJIGJlbGlldmUgZm9yIGdldHRpbmcgZG9tYWluIGFu
ZCBoYW5kbGUgYW4NCj4gSVJRLg0KPiA+ID4gR3JlcCBmb3IgdGhlIHJlY2VudCAob25lLXR3byBs
YXN0IGN5Y2xlcykgY2hhbmdlcyBpbiB0aGUgR1BJTw0KPiBkcml2ZXJzLg0KPiA+ID4NCj4gPg0K
PiA+IEhtbSwgSSB0aGluayBJIHNhdyBpdCBidXQgc29tZWhvdyBJIHRob3VnaCBJIGNvdWxkIG5v
dCB1c2UgaXQNCj4gKGJlY2F1c2UNCj4gPiBvZiB0aGUgcHJldmlvdXMgY2FsbHMgdG8gZ2V0IHRo
ZSBpcnFfdHlwZSkuIEhtbW0uLi4NCj4gDQo+IE1heWJlIHlvdSBjYW4gZG91YmxlIGNoZWNrPw0K
DQpTdXJlLCBJIHRoaW5rIHRoZSBoZWxwZXIgY2FuIGJlIHVzZWQuLi4NCg0KLSBOdW5vIFPDoQ0K
DQo=

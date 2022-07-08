Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483AB56BC81
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbiGHPBB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238106AbiGHPBA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:01:00 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0DE252B7;
        Fri,  8 Jul 2022 08:00:59 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268DCmDb004245;
        Fri, 8 Jul 2022 11:00:54 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h6jau1pe8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 11:00:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImGO0l6z8N4zMDaWDKaMozYvwW+LLV5CKUzee+U1GobQvU653dzV+e0bFDbaK/9vVrdIg4TORsfsKHmWGacV7ukMnNuS5TeM0TNxKpQtsSyF76DB5yR254ohBAEN41+njuhdriq/3NJkGawA4eSe8y6qYq4Dw8lMDJ1w5R3PImc8qUNsGNRhZ1GE/GVoh/LbEEiZn9tu1LonKOP/RuCoN9hPp93OroMH7dSvA6rHwPIIwM5vpi1vruFL/sVv5fEeTwKJC1v6XX0Yt9WB16dOlIdQr9qDR5p0zE2m01enNgRjuH3JlLhayHtwQS7PYhQqeDirzs92p5aHMMlwIm+zoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vE3H5BVvB7B+CwTuL3nvzeQj/IJA8CvewmhSc1uS/kc=;
 b=bTWaGVTRRn33XCCVrGdu8AKsrpGe7TdRfJwyj/UEhdOpxKqueQkpF+P4MVX1s3GcQFXh9qv9ssP5uNoVeOZZO4GQKBU8V6sjEOojF6bbdNEgwqAEiq3ib9wLI+hF4giVNK0SBnPd/fuuNLzJPvudFPU9HDAoWoKo3vDiLQ4iz0wwkR1NAFl/xj4SL1n9jTAW5EqOv22G/kIyhBzwTfjW7enzwjDM7QJjPxvL99KvHGIl5MPIXkl/vbOkk7NV45vrwDM3DEJD8ucXOiTlrXdbie9xETssc+Dkla+iYOiWRNkwIU9jAwwWCAg2oFrqRcj/18Bwz4XeVl+wUV40IaxC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vE3H5BVvB7B+CwTuL3nvzeQj/IJA8CvewmhSc1uS/kc=;
 b=CrC3r2Y6DXHp8LZRl3lVdiuo+UDTlyFHKQR/nE8nC08aNAkBQJenLN/pN1XkVXCOF4SR0ZcKwd6uss8ePHjbIBBFtoM2RV+nCNVwKdzX7I80nqt5kJAP06rajHXfXFLITaB4KTHlZlGbO0K8jjHffICgzlRv2qMJcKmXh7RG2E8=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by CH0PR03MB5969.namprd03.prod.outlook.com (2603:10b6:610:e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 15:00:51 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a4ee:b745:7e51:a3e0%8]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 15:00:51 +0000
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
Subject: RE: [PATCH 09/10] input: keyboard: adp5588-keys: add regulator
 support
Thread-Topic: [PATCH 09/10] input: keyboard: adp5588-keys: add regulator
 support
Thread-Index: AQHYktm0a+1Kw3OGDEKhmPz3rMyyMa10kQDQ
Date:   Fri, 8 Jul 2022 15:00:51 +0000
Message-ID: <PH0PR03MB67865C2D269024EAB16D337299829@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
 <20220708093448.42617-10-nuno.sa@analog.com>
 <CAHp75Vcs6cjqKS+Kv=Vx9xPCH6kDZSZObeUDKc+VwwEMaVSTNA@mail.gmail.com>
In-Reply-To: <CAHp75Vcs6cjqKS+Kv=Vx9xPCH6kDZSZObeUDKc+VwwEMaVSTNA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dFl6QmhOemczTmpjdFptVmpaUzB4TVdWakxUaGlaall0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhHTXdZVGM0TnpZNUxXWmxZMlV0TVRGbFl5MDRZ?=
 =?utf-8?B?bVkyTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTVRJeU5T?=
 =?utf-8?B?SWdkRDBpTVRNek1ERTNOall3TlRBd05qSTNNRFl4SWlCb1BTSnJhVXRTY0dk?=
 =?utf-8?B?elN5dHhWMUJzVnk5emNHWlZRM1ZOZEVsRGVWRTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVSXhWSFkyUXpJMVRGbEJaVkV6VUZaVmRFVjZkM2cxUkdNNVZs?=
 =?utf-8?B?TXdWRkJFUlVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: 2a6a4297-08f6-4292-50e7-08da60f2a67c
x-ms-traffictypediagnostic: CH0PR03MB5969:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jzkTMNZdtHcgQmyg72+OY6/RV9PUBBy18IqaDq4DmtV4Oe1wltRHXTFPH7UA+Xj1VZdIzDrhWVlw4WaOktegk8znq/LvQ6gzuINkq8+Nb8B6rzC0Dro3e+uujcZZPYUbBFgPcHMT7B//1wMShSa7ZEGZuSzVufxdQ/onQ/BfeJu7BkS9gdvoZs1XLw2DZz3HgMuafN4abBXniy0szmB2sJ0n2nA3qVsC82Wgadt/1sve1C1vDqDkMjJJ6jNjTi7KqFuVX4hTSy1+FJU395ukrh3X1SR4wvB7T+jFTQiYrg2P09uk/g1mO/kGHkZZy/WWh4Opmi09Tzl1nhJzMvvWrM9a0yV+Ydhf+huBpgVGtWSWU3USw+rdgsBMAVPqnG4jjAwcnf8oYbRuRLKTU3cQj+6gYfidRc5YVJk9reSAsyCdfh1nkAn8ubC3t2PA3ap7pXK+WIoNu4bpAgzpTfYKT2BxDTVuQMD3181qCICAZbMIr15Dp5kbuqyOgGToUdy8Js1ZZmJaQ+69IKn4cvO1U6FMC6cV7nIrJcEvXQOpr8/J9cc4nL8z5Nmw5REKMolHRAkjiBN45hSm8t1VqxuFcr6N137ZJWpKRmQYoOzPaaYL7Rtj6j68U27lkcZhtsgUxIm7Z/GVVFQc/5tBGnNbzabWft/stnMteuP6PYhLPE2P7j5uu3YC2cNO9L+vyt49G9vVoGOv+W4rjwqlKF5yIZ1m2WXC8Vq6j9kuRm1SrRzi3SOOpuT5cviqN7OY1iXWysDJ6Bk3mkGfX5Fk3Yg29J1MQsmmxnJ7O+CxtbhnEshcYKB4exFW56HwSsX1lWno
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(9686003)(86362001)(478600001)(8936002)(5660300002)(52536014)(53546011)(6506007)(7696005)(26005)(4744005)(33656002)(2906002)(41300700001)(122000001)(38100700002)(38070700005)(83380400001)(186003)(6916009)(316002)(54906003)(55016003)(71200400001)(66946007)(76116006)(66446008)(64756008)(66476007)(66556008)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlpQc0ZHaUxGOEIxUjFVbHc2Z1JmamFteHdZMUtOSVJuN1c5SVFGaklSZHBP?=
 =?utf-8?B?OUM1MWN5ak5VWjh2NE1lZzlVelZZQjJWTGVienpYWXZYNEp1ekVJNkU5UVRI?=
 =?utf-8?B?KzV2aGhyekV1bnNtaktvZnNlVUNnYVFKNyt5Sm9rTjVWSDY1L2lHMnJnNFA0?=
 =?utf-8?B?Sk1UV0FkY3E1aXZDamhud1FDMGRoUnN4TGVha2l1UWN3dUhwYnI5eHlzWTQz?=
 =?utf-8?B?ODNWVEYyT3lrOHcyZTNaSDBCRnBPd1hqTlBlcHY4bG9kdUlidkRRVzJHakc0?=
 =?utf-8?B?OWpEc3hEalVDSUg1VGwxZk9vSEU4M0hqTUxtYTVFb29CWFpyZHlGS0E4cFY2?=
 =?utf-8?B?bXJ3SnAvdnRNeHNac2ZlV2xuMExzbW52T1ZGREplK0w0bWMrVW1GUWh5RFFK?=
 =?utf-8?B?TklKQUtPcUFDdnlwbFl2UGR3cjdEZDZhOHIyQktYWDI5bklLREs1a1BoWHNE?=
 =?utf-8?B?ZW1MWTF2SWZDcmgycDZxQ2phOFl1Nlh1YTl1bGZBUFNGOXI5QWtrOWg5V015?=
 =?utf-8?B?UVNWd3czK0dVVG00WmhpaUlnTUhZblZ5ZTA2VkR5QVI2K3FoTVU3S2ZyRzht?=
 =?utf-8?B?YjJjQVpEL0pPSUJlME5PeE5zR2EvOEJiWDBqemNFYnJnd1hrVmcyWm1tUll2?=
 =?utf-8?B?SzRQTmpvNTJ5TW9BSHFiVjZ3MTZ6NW1MZW5hOGUyOTJlWWlmdTlKdUk4V1h3?=
 =?utf-8?B?UURZR0gyUmJ4OFBic1hUVEIwYUU5RU12UTlDdDhwdndGVjhHQTkvK0RHN0Vj?=
 =?utf-8?B?N0VyYXpXb3VTeTRPbE9CT0lURm5vSzJTTjBOcGlZY1V0Q2Z3WVp3TmRUZ1dN?=
 =?utf-8?B?TE1LeUVGYWlZVjlxUmVsZEp1N25FR0x2MUx1NDNCT0FxdmIvZFhiMm5jYlpG?=
 =?utf-8?B?UW9WTm90UmRCRlRkU3IrOUtWbHpYd1FMcDlGZWpCUEdVY0NkTU1OQ1FRM0pv?=
 =?utf-8?B?UW9Najhtb2poUWlHcEpid1lIbWl1NndmVVRacCtRaW5BRUNybEdDRWJCWkw0?=
 =?utf-8?B?NjJBMnE4ZGMrcGk4aFhYUmFKZGM4aGFCL1ZhalFPS0xVajNFZ0xnMFNxamoy?=
 =?utf-8?B?c2JSZGlaSUVOOVd6RmlZVXhjdTdwRC92eFpXM3lLK2NMZUxUdk1CMWJvYUdS?=
 =?utf-8?B?KzNGTUNwSC9wVHJnbFZ5LzFmbUNzL3dIK05BSmRTR1luTXQra1dFZ2FrcE1p?=
 =?utf-8?B?RmpDODlYRWVtaW9BMHpBMWRGMWU1VlFOME9Oc0cwUDVpbHptT1hJTnJPNUpR?=
 =?utf-8?B?QTEvcmJSZEltdlFEUkdFUXAzQU9wVC84WlIxUm9mTWhBRjZNRHByMk1Ldkdq?=
 =?utf-8?B?aFQydGpjdExmSFpnUytudFFQNVRNNGZwR3lyaE5VaGhlaHNUeFRrNmdTQXRL?=
 =?utf-8?B?ZlhaWU5oNmw4UEQ1WUZzTXhDWFFGYzMzcUllUTBVVXZlNzFsQkM5ZGlCRmhD?=
 =?utf-8?B?ek1CMjE3ejBnQ2M1ZVo2K1lqMFk3UGdlN0RnVE5vZlVYWmg3anNUKytiajhU?=
 =?utf-8?B?ZjlnQzB6Tm03dnZnRjNMZ0ZLNElNZTN4ckdDYkNzV3g1OGw1M3owSy9XVjBm?=
 =?utf-8?B?WG9QT3djdTBSOHJ2ZnNWU2x3WUR4YTFMeGVvZlBIRFl0UE1PKzFNbVNEbVNT?=
 =?utf-8?B?alVjSHZrR01weUR4MGcwVjRiWXhIMGd6eHpRQnE4SnRqUW51NFBCWFZwTHRT?=
 =?utf-8?B?emRJTlNCUTd6TTA3dW13dmtKckFxSlpSNTA3bTJhOXpFSml0U215M0Q5WWVv?=
 =?utf-8?B?emNlZXdFdlErZGl1RnRFZXRjbWg3T3BSUVNKODh2SG1MdUpxdUVKYkk2b1FR?=
 =?utf-8?B?MDgySWJnUnJCa3pPOW84a2dhZVNNMFd5WWpKcFJuR2VXeUQvT0FpN1MxWGFj?=
 =?utf-8?B?aEMwbjEzdHhRa2xnVUU2V2gyOUxzYVZXaGRoMnFUMS9LUGRJTnQ5NXJxSU5T?=
 =?utf-8?B?MzIyMlBRQS8rckVjY0dNUTFRdW1xMUlKdEptUnVVTmo3S2ZrbFpHeU9RRExq?=
 =?utf-8?B?RVdmL0RhaHBWeUxqRlliOGJIVFpXeXRqcy9nTjl3aVEvdW5QeElzRkpNRU1x?=
 =?utf-8?B?NVNlRTlObjJGd0VweHJFSUtGeTc3RjVuclI3QWJxby9MSjBFakkyejhYZ3dN?=
 =?utf-8?Q?wm6lDtsHwo1/6k56vLXWdEV2B?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6a4297-08f6-4292-50e7-08da60f2a67c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 15:00:51.7395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7mV4sGXuzqMYqFqlZtOKIIBjpahgHwNSylkBWXe5tj7p9qc/7waNLq+IXYftLA4pvoOwK9PtsZLSTXGy+JX1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5969
X-Proofpoint-ORIG-GUID: IMt225CLp0F751A5CliWvS84bqekCP3m
X-Proofpoint-GUID: IMt225CLp0F751A5CliWvS84bqekCP3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_12,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080058
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
MiA0OjQ3IFBNDQo+IFRvOiBTYSwgTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogZGV2
aWNldHJlZSA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6R1BJTw0KPiBT
VUJTWVNURU0gPGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgbGludXgtaW5wdXQgPGxpbnV4
LQ0KPiBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc+OyBEbWl0cnkgVG9yb2tob3YNCj4gPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxicmdsQGJnZGV2LnBs
PjsgSGVubmVyaWNoLCBNaWNoYWVsDQo+IDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsg
Um9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IExpbnVzIFdhbGxlaWoNCj4g
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOS8xMF0g
aW5wdXQ6IGtleWJvYXJkOiBhZHA1NTg4LWtleXM6IGFkZA0KPiByZWd1bGF0b3Igc3VwcG9ydA0K
PiANCj4gW0V4dGVybmFsXQ0KPiANCj4gT24gRnJpLCBKdWwgOCwgMjAyMiBhdCAxMTozNyBBTSBO
dW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPiB3cm90ZToNCj4gPg0KPiA+IFN1cHBvcnQgZmVl
ZGluZyBWQ0MgdGhyb3VnaCBhIHJlZ3VsYXRvci4NCj4gDQo+IC4uLg0KPiANCj4gPiArICAgICAg
IHJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgmY2xpZW50LT5kZXYsDQo+IGFkcDU1ODhf
ZGlzYWJsZV9yZWd1bGF0b3IsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdmNjKTsNCj4gDQo+IE9uZSBsaW5lPw0KPiANCg0KSGFwcHkgdG8gZG8gaXQgYnV0IEkg
Z3Vlc3MgaXQgZGVwZW5kcyBvbiB0aGUgbWFpbnRhaW5lci4uLiBJZiBubyBvbmUNCmNvbXBsYWlu
cywgSSB3aWxsIGNoYW5nZSBpdCBvbiB2Mg0KDQotIE51bm8gU8OhDQogDQo=

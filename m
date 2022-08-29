Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2916E5A4CD5
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Aug 2022 15:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiH2NCe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Aug 2022 09:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiH2NCP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2022 09:02:15 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7103C17C;
        Mon, 29 Aug 2022 05:55:08 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TA8gQJ015084;
        Mon, 29 Aug 2022 07:20:48 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3j7d483h02-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Aug 2022 07:20:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3Uh+6vnofZkbcpztv30SoXXtkbcU6TmlkY90kgk+dXoyEv5yQK+2FHbZlYs0qVlapJCItyAwMUjWMWQ/J6LqnYjuHhcozDJhbdzr9GanMeGlyoo9vyJb22OSg5HhVrFbCFbXu6iMdSa1RBSniecPUyY9XJJ+HdyNA5Brxz5ho+qFvy2yaUrxqDgr4/xSQsmXoI1ydbBBwUhLtKF0MrmjFLhxmOiRfP2xM8OkaD2nby3pQJkR88h2v3vypExxVqhnxTQa4QZKdCqLU71eKO/oy8fe5nZX6LzehsddALM66e60uEsTCzug/bggVXeUyE81zSGz5fy9W1Hasm/kXQucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp2RToQ7kGfi8QGWXwVzEXdnFV5tPveoshCYK3PGs4E=;
 b=n5lx6x7WJkI2ZAdNJIlWnWJoxvLLj6rl8/ul6qESfmDPajV2nGTaPHtFWaYarmI3TA5YUqh0EB3n3FGGkiEU/X2/V15wRCXB7waQ+3rGVYtX1OdsslvJGiqt4B7OG2QGoIOFVvDtDUEwqjUI6SnLjcUg9VNJoVnR5px22MlFY0opFYM6MGzTk3d7mlJnKVUSkRauzxQThlIs7tlsMm5zbd4b03n6DDUzmFfDOQI4lVAowDONuR1qCCNlyOBgZLnIevwI9pX/cvpxogdjDZw6Fk7FTSLDxmTDzn43wIYcy90OBEb27fCUUzXYIBCPHNx0l/iTnBj/46jZUM4lVU+T8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp2RToQ7kGfi8QGWXwVzEXdnFV5tPveoshCYK3PGs4E=;
 b=KptEPqD1CJcd4l6wGGv+vCH6duj0IsV4LbAxtuP9nvfYENYeog7Uuih1tU3Ad5/6rGtMZ+9x1HMWgm7iNYwMhAP08zIsyutrQ55iMVpCMLnPGVRd4qMllaTq+gaHOS0MNCGWji9XTSqSc9+PC/gH92XYvTvG/nLFikMVIoXtv+A=
Received: from SJ0PR03MB6778.namprd03.prod.outlook.com (2603:10b6:a03:40d::22)
 by MN2PR03MB5326.namprd03.prod.outlook.com (2603:10b6:208:1f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 11:20:45 +0000
Received: from SJ0PR03MB6778.namprd03.prod.outlook.com
 ([fe80::edf1:c82a:ab73:1ffe]) by SJ0PR03MB6778.namprd03.prod.outlook.com
 ([fe80::edf1:c82a:ab73:1ffe%8]) with mapi id 15.20.5504.025; Mon, 29 Aug 2022
 11:20:45 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     linux-input <linux-input@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Thread-Topic: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Thread-Index: AQHYoGXoKmIz6dqcpUCDGXTJdkZ0aq3F8YWQ
Date:   Mon, 29 Aug 2022 11:20:45 +0000
Message-ID: <SJ0PR03MB677866509821CD35FE25CA4B99769@SJ0PR03MB6778.namprd03.prod.outlook.com>
References: <20220721080423.156151-1-nuno.sa@analog.com>
 <20220721080423.156151-2-nuno.sa@analog.com>
 <CAHp75Vfeq+7Ngj_wiXUXTGhyL=isqHy3DuPeJyE0C5YjYjZN=Q@mail.gmail.com>
In-Reply-To: <CAHp75Vfeq+7Ngj_wiXUXTGhyL=isqHy3DuPeJyE0C5YjYjZN=Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE9XVXhORFJqTW1ZdE1qYzRZeTB4TVdWa0xUaGlaamt0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhEbGxNVFEwWXpNeExUSTNPR010TVRGbFpDMDRZ?=
 =?utf-8?B?bVk1TFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTWpRM05p?=
 =?utf-8?B?SWdkRDBpTVRNek1EWXlORFUyTkRJNU9EVTJPRGd3SWlCb1BTSXJMMWhLTmt0?=
 =?utf-8?B?c1JEVk5kRVpGVVROcmFrRXdNRTFvWmtwM04wVTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVSjNVMGhHWjIxaWRsbEJVa3REVUVKbU5HZG5aMEZGYjBrNFJp?=
 =?utf-8?B?OXBRME5CUVVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: c6e11072-aaf8-40b7-f248-08da89b08477
x-ms-traffictypediagnostic: MN2PR03MB5326:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pSEuuQEsBTb3YPWIK4MfRyl+NH4jGP1ETl9Z9DNd4M33zFK520D/xqdHNT0w+Oj+B5XmQSH2JFMk7ZEaxez3PNZMkxulF307slYV/mzjFVIQAh1cCeX/KAYAaNIqNsvKriiahBnp9Ylv+447ikWRdjwLbssh6ZBGI9HwPkz4GKbEl9w2rX9XNLcoIzTeuFDw4TVRnEqSheccMZOogJ+IzY+1sGv4/O5umHEDMxhrV7UjwDoiibXSan6YVmFq0y3l0GcBDkYe22lwhqD3CNHUOmkXxr8sGkf4fBAl4BSG8D/XN13EmmeaP+qztgsm03kJD4qh0mW3VNnhZuisdR6Ecj0Gpa9V7y/50/ehAvsDe/UfPMqiOhsZOA0S/C+OMUaJdm+wlutUEFG5vBAU+qQ58up7cr0uWmT70LznAt9bxuxhgMLel/s7DlZ/pZDMLh/xVHxwycTVUzsLhPdW5KkjJj6/b9V4WvH1sGNLK+p9qhBOUjvsMlZ0q+FcJCdHYo9vY9zfjDzptC6yRYAkTYZvnzA6ABLXDdbcJ6zZk2CSmCVQG88PxU6a0+/NYaqP4GXwIC42bUSU2tBU2jfTjaeBMyD4c2eSEWAxPKdxDbzp1yToCYC4EDWyz2R1KUJx2KtElwK9uSY50SOCkTR7onFqMIxjZBKKN7vKi6goj/Zi9yO79LTb5T52gElUPOTM4wvRJnfHOY0uwXdDLYOmCb/z4KPKkI3D2e5q10/l2aR2E/85r43fackYYUHwSELfFg4N
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6778.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(9686003)(76116006)(86362001)(53546011)(26005)(71200400001)(478600001)(7696005)(6506007)(41300700001)(186003)(122000001)(38100700002)(55016003)(38070700005)(83380400001)(66476007)(66446008)(64756008)(66946007)(5660300002)(66556008)(8676002)(8936002)(52536014)(4326008)(316002)(54906003)(6916009)(2906002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVp0TDdXbXRvZFNuMWd3UVpKMUR5OHhyNDlyWlIvdHJQQ0ZETmZsNFpRUzM1?=
 =?utf-8?B?SnNDZnAzcGkrc3JINGJHUEpGZkloWHM2ZlNubWZ6MmZZUk5MdXRGakhDMlpr?=
 =?utf-8?B?WHdMdjcwSGxTZU5oTTNGTE50WjFsbU04UXBMUithMTVlM1EzbTM3cUppZ1FP?=
 =?utf-8?B?Z1dMaTZhS1dWVXJmZ3ZJVlVoYmZtVHFOS0xvM2wrY3p2cHB4alo2Ylo0cDlS?=
 =?utf-8?B?ZEJvWEt0Z3lIeDIyeDg1ZWxtN05FOWtnc0VrZnRjSUNNcWZQZm8zNm1YMURq?=
 =?utf-8?B?eEZYbWZUZUptVW1MLzFNZUhnMm1pS2tPUzF4c0NHZHZlcWlLd1pXcjFXQ1lG?=
 =?utf-8?B?NVY5MkJUd2hqUzY1SmlLUWVxc09RSkhTdGNuZ3FqY3d3cEdCbjVNQlAwSExq?=
 =?utf-8?B?YUZjd2dSeXlRVmc4VUhVM3B5SzBLNDlzM1E1ZkdwVVk2WDBDTmhuaHpzL2tU?=
 =?utf-8?B?NTZsWndNSHptL29IR3M2UmQ4bm9DRGQxdWp5S0s0b2tBcWxhMWQ2THZzUnMz?=
 =?utf-8?B?cFI0MTUwc2wvLy9zeGh5RS8wNm01VWF3czhmbEttTFB6cmptbWN3VCtmSVdZ?=
 =?utf-8?B?TFg2YUY5eXhFVWdnQnBaUkxjb2NISHFSWDV1cDRibEhJTFFTci84N1ppTVdQ?=
 =?utf-8?B?cmlQR1QyWTg3N1pINUg5QmllTXRUdytDK2dLMEJycHdTVUZ3Z00vVTJDN0pR?=
 =?utf-8?B?dU1xVjMvcWs3SzBtNjJ5dGhybmlQVTI3SzdWRVlYZmVVcTRDNE4rZUdEWGJl?=
 =?utf-8?B?NFkzQlJxWTVFMU05OUxqakJCblhsSHB0aWlib1RpM0dWMmRFcHIwbGI3ei93?=
 =?utf-8?B?VXpGMEhEWElsMi81UkR6ZkRUSTdKZ0s3UVRyS1NHRVF0ZW1USmZsajdBOU40?=
 =?utf-8?B?UlR0S2tmNjl3WTJhV1NtNmR6SlREV2ZDUnVZckMxaTFQSW9RWEQ4T1BUTEdU?=
 =?utf-8?B?Uk9YYmtuU1V0WXZyRTlSUVcrTG0ycGEvM0Q5cElwaHlkWDY5U3BmMXI4NXY2?=
 =?utf-8?B?a0QrWHVJMmgvRzJLYlhWcHVBdnh5SzQwdUJKa1B5OCswMnFHNW5XKzh6R0hv?=
 =?utf-8?B?TUVWakNzZGE2dTNUMXo4a2RXUjY2YlRMM0paME9NNU93WnBFZ1R3Y3c4NHNH?=
 =?utf-8?B?TDI2NWRveU9KR3dBY0NGS0xtT0x6SHMzKzdEWGN3UzRTWTc0OEwzRFBvbmFk?=
 =?utf-8?B?aElWMUU2WEFLWnBqWFdwcnZnc3FhQlJtWUtsS0xROFVGdTlUV1ZUOTVYZXVE?=
 =?utf-8?B?b0xwcnlUS0tWYjhzY0FPeWI3MWZ2RnJCaFNTTVEzK05kWXBhRUxKd0lydnE4?=
 =?utf-8?B?eHhkQXk4Z1pTanlKRlA0OGNaeTk2R3JJMXo4SjhOa3k0NWtUMjBxQ1dkUEVT?=
 =?utf-8?B?VmFGOGUzV2Y1bzNJTFQ5Y0hMMk1uMkQ1bUlnWFlwUktGWDFOd2FaNFpzcXNQ?=
 =?utf-8?B?c1pETVgrcUR5VnhlSm1sNy8vdEg1NU5YR1h1MzhqNENERXliSnpDYmNhRWRZ?=
 =?utf-8?B?NXlFMzRycm5LbGc5dmFtSncxQzNmb2JGdU5LOFlJaVViUkVWQjhIQWtXakpx?=
 =?utf-8?B?emRmZlJ2c3VHbFlzdHJ0TmRjV213L0tvZ2NPR1Biem0wYWd2dWVFNFdPUUdo?=
 =?utf-8?B?TEZKa1lWUFBDRXhkTVVCRnV1TlFBYWVmOHdPVk16MGF0aUVXOFdValN6ajlO?=
 =?utf-8?B?Z3IwZHV1bHIyKzVKcFJhd3dSNFoyZTVjSGdyU0ljZUIwZFJEMnd6NDc0dldT?=
 =?utf-8?B?OFdITThhRmRWYzA0VWNVdURKcFVZQVZuUkJ3QU1GVW1GU2syYlhMSTBwVEdo?=
 =?utf-8?B?OHFhMVpWa1JkcUJJd1ZWSG9UVCtUNDhMQUt1NEtKYWlkcjVabC93dXVtR3Z6?=
 =?utf-8?B?bXJiNGhKOTdSRkRLL3QxcC90SGMza3pHVHhrbENDYjJ4SkI5U0hKVWZPdDYr?=
 =?utf-8?B?UUFLc2hDMjQrNnkxU1BndFd2OEs0aUNPeVRZRnV5WWZGcFlscm1RVXFjMnd0?=
 =?utf-8?B?STI5NmNCVGx1eVdQd1VTdDExQTVld0Q4RGRPaVFrQ3h3NDlhQnc2UVZwRlFa?=
 =?utf-8?B?bzZ6UDNyVEJMY2ZkdjhpdmJTT0Ewak5vT1N2bVhmTnRlTjJlQ20xMGJQLzNO?=
 =?utf-8?Q?mqSA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6778.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e11072-aaf8-40b7-f248-08da89b08477
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 11:20:45.5580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPa/z28k6w/jwppfiBseFrHhcONrFqdRNMmTr4MbLxupBp7oQ1avsha3P1aAtXXbSJs9ts9AxixZoXVAxfcAWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5326
X-Proofpoint-GUID: x9YLo0pINm9afZj8TvuL5wSRVZFSLb-X
X-Proofpoint-ORIG-GUID: x9YLo0pINm9afZj8TvuL5wSRVZFSLb-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_06,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290054
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+DQo+IFNl
bnQ6IE1vbmRheSwgSnVseSAyNSwgMjAyMiAxMDozNCBQTQ0KPiBUbzogU2EsIE51bm8gPE51bm8u
U2FAYW5hbG9nLmNvbT4NCj4gQ2M6IGxpbnV4LWlucHV0IDxsaW51eC1pbnB1dEB2Z2VyLmtlcm5l
bC5vcmc+OyBvcGVuIGxpc3Q6R1BJTw0KPiBTVUJTWVNURU0gPGxpbnV4LWdwaW9Admdlci5rZXJu
ZWwub3JnPjsgZGV2aWNldHJlZQ0KPiA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51
cyBXYWxsZWlqDQo+IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBLcnp5c3p0b2YgS296bG93
c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBIZW5uZXJpY2gsIE1p
Y2hhZWwNCj4gPE1pY2hhZWwuSGVubmVyaWNoQGFuYWxvZy5jb20+OyBCYXJ0b3N6IEdvbGFzemV3
c2tpDQo+IDxicmdsQGJnZGV2LnBsPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47
IERtaXRyeQ0KPiBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MyAwMS8xMF0gaW5wdXQ6IGtleWJvYXJkOiBhZHA1NTg4LWtleXM6IHN1
cHBvcnQNCj4gZ3BpIGtleSBldmVudHMgYXMgJ2dwaW8ga2V5cycNCj4gDQo+IFtFeHRlcm5hbF0N
Cj4gDQo+IE9uIFRodSwgSnVsIDIxLCAyMDIyIGF0IDEwOjAzIEFNIE51bm8gU8OhIDxudW5vLnNh
QGFuYWxvZy5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gVGhpcyBjaGFuZ2UgcmVwbGFjZXMgdGhl
IHN1cHBvcnQgZm9yIEdQSXMgYXMga2V5IGV2ZW50IGdlbmVyYXRvcnMuDQo+ID4gSW5zdGVhZCBv
ZiByZXBvcnRpbmcgdGhlIGV2ZW50cyBkaXJlY3RseSwgd2UgYWRkIGEgZ3BpbyBiYXNlZCBpcnFj
aGlwDQo+ID4gc28gdGhhdCB0aGVzZSBldmVudHMgY2FuIGJlIGNvbnN1bWVkIGJ5IGtleXMgZGVm
aW5lZCBpbiB0aGUgZ3Bpby0NCj4ga2V5cw0KPiA+IGRyaXZlciAoYXMgaXQncyBnb2FsIGlzIGlu
ZGVlZCBmb3Iga2V5cyBvbiBHUElPcyBjYXBhYmxlIG9mIGdlbmVyYXRpbmcNCj4gPiBpbnRlcnJ1
cHRzKS4gV2l0aCB0aGlzLCB0aGUgZ3Bpby1hZHA1NTg4IGRyaXZlciBjYW4gYWxzbyBiZSBkcm9w
cGVkLg0KPiA+DQo+ID4gVGhlIGJhc2ljIGlkZWEgaXMgdGhhdCBhbGwgdGhlIHBpbnMgdGhhdCBh
cmUgbm90IGJlaW5nIHVzZWQgYXMgcGFydCBvZg0KPiA+IHRoZSBrZXltYXAgbWF0cml4IGNhbiBi
ZSBwb3NzaWJseSByZXF1ZXN0ZWQgYXMgR1BJT3MgYnkgZ3Bpby1rZXlzDQo+ID4gKGl0J3MgYWxz
byBmaW5lIHRvIHVzZSB0aGVzZSBwaW5zIGFzIHBsYWluIGludGVycnVwdHMgdGhvdWdoIHRoYXQn
cyBub3QNCj4gPiByZWFsbHkgdGhlIHBvaW50KS4NCj4gPg0KPiA+IFNpbmNlIHRoZSBncGlvY2hp
cCBub3cgYWxzbyBoYXMgaXJxY2hpcCBjYXBhYmlsaXRpZXMsIHdlIHNob3VsZCBvbmx5DQo+ID4g
cmVtb3ZlIGl0IGFmdGVyIHdlIGZyZWUgdGhlIGRldmljZSBpbnRlcnJ1cHQgKG90aGVyd2lzZSB3
ZSBjb3VsZCwgaW4NCj4gPiB0aGVvcnksIGJlIGhhbmRsaW5nIEdQSXMgaW50ZXJydXB0cyB3aGls
ZSB0aGUgZ3Bpb2NoaXAgaXMgY29uY3VycmVudGx5DQo+ID4gcmVtb3ZlZCkuIFRodXMgdGhlIGNh
bGwgJ2FkcDU1ODhfZ3Bpb19hZGQoKScgaXMgbW92ZWQgYW5kIHNpbmNlIHRoZQ0KPiA+IHNldHVw
IHBoYXNlIGFsc28gbmVlZHMgdG8gY29tZSBiZWZvcmUgbWFraW5nIHRoZSBncGlvcyB2aXNpYmxl
LCB3ZQ0KPiBhbHNvDQo+ID4gbmVlZCB0byBtb3ZlICdhZHA1NTg4X3NldHVwKCknLg0KPiA+DQo+
ID4gV2hpbGUgYXQgaXQsIGFsd2F5cyBzZWxlY3QgR1BJT0xJQiBzbyB0aGF0IHdlIGRvbid0IG5l
ZWQgdG8gdXNlICNpZmRlZg0KPiA+IGd1YXJkcy4NCj4gDQo+IC4uLg0KPiANCj4gPiArc3RhdGlj
IHZvaWQgYWRwNTU4OF9pcnFfbWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmQpDQo+ID4gK3sNCj4gPiAr
ICAgICAgIHN0cnVjdCBncGlvX2NoaXAgKmdjID0gaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEo
ZCk7DQo+ID4gKyAgICAgICBzdHJ1Y3QgYWRwNTU4OF9rcGFkICprcGFkID0gZ3Bpb2NoaXBfZ2V0
X2RhdGEoZ2MpOw0KPiANCj4gQ2FuIGl0IGJlDQo+IA0KPiAgIGlycV9od19udW1iZXJfdCBod2ly
cSA9IGlycWRfdG9faHdpcnEoZCk7DQo+IA0KPiA/DQo+IA0KDQpZZWFoLCBJIHRob3VnaHQgYWJv
dXQgZG9pbmcgdGhhdCB3YXkgYnV0IGluIHRoZSBlbmQganVzdA0KImlubGluZWQiIHRoZSBjYWxs
LiBBbnl3YXlzLCBubyBzdHJvbmcgZmVlbGluZyBzbyBJIGNhbiBoYXZlIGl0DQphcyB5b3UgcHJl
ZmVyLi4uDQoNCi0gTnVubyBTw6ENCg==

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB2431DF4A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 19:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbhBQS6O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 13:58:14 -0500
Received: from mail-vi1eur05on2118.outbound.protection.outlook.com ([40.107.21.118]:64705
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233041AbhBQS6M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Feb 2021 13:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sR2VEUlhsefgu8BlL/otJmoqtGYgqdhZidZy0/l/YZM=;
 b=D8iydN+8Az8LgjMI+I2o4arkjpEYGahAczR+KaemwTvjfRSCkkDdsUJKCVBN0lKkNeFqh88Uu7xGLEVqxqNGw2QDWlz8VCgBxhsvlvkJW+XfMR2B6okplat+ptFYpDdYDMDZ5se3wQcEwr1Nojj35StKiNWbwZhvwmYqftdZfa8=
Received: from DB9PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:1d9::22)
 by AM6PR10MB2872.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Wed, 17 Feb
 2021 18:57:22 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::b3) by DB9PR02CA0017.outlook.office365.com
 (2603:10a6:10:1d9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Wed, 17 Feb 2021 18:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 104.40.229.156)
 smtp.mailfrom=aerq.com; gmail.com; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com;gmail.com; dmarc=none action=none
 header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 104.40.229.156 as permitted sender)
 receiver=protection.outlook.com; client-ip=104.40.229.156;
 helo=eu1.smtp.exclaimer.net;
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 18:57:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.51)
         by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
         ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
         tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Wed, 17 Feb 2021 18:57:22 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 8835606
X-ExclaimerImprintLatency: 145680
X-ExclaimerImprintAction: 6e5e6130520e418380350b255dbe6a56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vg824fv2HndqxdgoOxIyh9yj/qwIHcTxEL8nrVgsJrY9+89maNfQb0DnfyxqVePmNU07sd5ue8JYRR7VaaQ/mt658IYPgrrKNh+KCCJFowRUyRynwB8socEvZA7WCiP+gzz6jroZvk+Ena3mH6YMdszTp/8V3bL71xP8GMYDgyrLlX16b/JdXK0edt515BFmitIQUE8YGswFKZ10QORPOLpLxNpjeYQlwTQKSbnCyERbm+ld/PaDHVLv0YoClj9N8a5eiOtXgN6cdaS2b+/ENfhluk9cHy/PJYD9WGUQpPsIcp4f8odW6IXt+Stub2vUJyBFP/l2+NolZcXEoDsLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sR2VEUlhsefgu8BlL/otJmoqtGYgqdhZidZy0/l/YZM=;
 b=Tfp/0pzF+1Ha4Tp4kJe2x5RIZ4Bcp3K0a7kvFA74oS6AIwr4WzsAu8Vz3MVpNiwhA3LSaDi1RsFADFQHhFEjnz+I+zKbPlNqILmYn33qzIr/636/J80yLd5Flbz7HgngOr/W5SdUaBM9X9oLKkpSkOYMRSpECBPQjGrfTwVLIC5zt2WQxBU96UfJ/MfGAUmqfkOudxsaBd1jbjSl2Mq7H2WDVmF3g1Kkr+b5huIVhWHm+EcIKeHjgYA8n4PMzeoP/m0SDjVqW29SqMOiuJdyRAoR9KdshvgtEKim1H8DjNIKPN36qVDs7mqDd8Xayo4O8Uh+OdEQzOPkFeSACEaNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sR2VEUlhsefgu8BlL/otJmoqtGYgqdhZidZy0/l/YZM=;
 b=D8iydN+8Az8LgjMI+I2o4arkjpEYGahAczR+KaemwTvjfRSCkkDdsUJKCVBN0lKkNeFqh88Uu7xGLEVqxqNGw2QDWlz8VCgBxhsvlvkJW+XfMR2B6okplat+ptFYpDdYDMDZ5se3wQcEwr1Nojj35StKiNWbwZhvwmYqftdZfa8=
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:161::27)
 by AM0PR10MB1937.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36; Wed, 17 Feb
 2021 18:57:20 +0000
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48]) by AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48%5]) with mapi id 15.20.3763.019; Wed, 17 Feb 2021
 18:57:20 +0000
From:   "Bedel, Alban" <alban.bedel@aerq.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pca953x: add support for open drain pins on
 PCAL6524
Thread-Topic: [PATCH v2] gpio: pca953x: add support for open drain pins on
 PCAL6524
Thread-Index: AQHXAJ6Y8nHh4lzybEC6MhBJ7Xlm+6pZMfQAgAHQ7QCAABRygIABRDKAgAATDICAAE2ggA==
Date:   Wed, 17 Feb 2021 18:57:20 +0000
Message-ID: <6018d92d2fc91841e76324adaf9f285e39b6fc00.camel@aerq.com>
References: <20210211175140.85391-1-alban.bedel@aerq.com>
         <CAHp75VfUY5-VtCWjaU6Q=hJY9hyUz8B36C0528RXUxkbnL9yEA@mail.gmail.com>
         <4d67d5627921b0f7ca6579b81f97691c53ef0c34.camel@aerq.com>
         <CAHp75Vczzhs=8k9G1FQYvqOV+Xg3GHp2=TykJX+E5ypT8puFqw@mail.gmail.com>
         <a1f4f5cc14a5037a8b122c811d2f24a8d3068c41.camel@aerq.com>
         <CAHp75VekEoU3y0iZ9RyfB4887n1hbLMcKfrgzYWfa6_cbKp_iQ@mail.gmail.com>
In-Reply-To: <CAHp75VekEoU3y0iZ9RyfB4887n1hbLMcKfrgzYWfa6_cbKp_iQ@mail.gmail.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=aerq.com;
x-originating-ip: [87.123.195.200]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1e9806cd-ced6-4521-5d86-08d8d375dbd3
x-ms-traffictypediagnostic: AM0PR10MB1937:|AM6PR10MB2872:
X-Microsoft-Antispam-PRVS: <AM6PR10MB2872669209800DA5B1BFD61796869@AM6PR10MB2872.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PpSYgfnOKCGImFhIMWYAHWoVBd6/dgA5na/d/bd2q3/z7h7Xs+sbP3bo+/SMDoScWN9quZzqi/Wty0VY2wFu/AzF8zJEULWmHBhEjJuB5/yUmtpv7RKfXhOhwAjm7zoSafCA8aDem3v0+M+Jta1mS4+IuPrEMSSN2zJH9fQnQNjKxPnQd+wjE0CMJ0UBatSZovHWy0Kg5AahUd4hmmkXUZ2GlVVSkLmcL9nUJEdrUkDTMyyGf0rWNhQMZQQpoqBHXqBNMqrRhPlh9T2j7yKzDZJMkk6xphH1L/JuaXtnPQMJ8eDCw4qWhQ4mtrhV4L1JQqTFvJaLzyS+RbIHMcd5SpOXBsX9PsVT90DBTyAbrqBkYRammU2diaS8wwm2xLv14YCzktzDryOopYO0sW1zjnFxgCTnutIhErggLQglsZ9gEYZ/7UwE/BxI2QIFAv1pqbY9B1/1M3vR/KJ57e9dKY5D7Y90pv/Ohypxs++Ei4B0xWO6CyF5CyeG++ELRb81HejVB/nt17MXQNub44yj9kEoXT1qIM8LfsyC/GbwesljjZ5RtaNo0ncGT5h6NrLQ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(39850400004)(396003)(376002)(2906002)(66476007)(64756008)(66446008)(66616009)(66946007)(71200400001)(6486002)(5660300002)(76116006)(66556008)(478600001)(316002)(2616005)(99936003)(83380400001)(26005)(6506007)(53546011)(86362001)(6512007)(110136005)(36756003)(8676002)(8936002)(54906003)(186003)(4326008)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OW5JbDhRRDNJRWNZRnVQZ3haMnA1Ynpka2VHWnB6dXgwOEUxQVhBT2UzWTIw?=
 =?utf-8?B?K1VjWFZFMWtoeHBpRVl0dGxNUkZiSVQ1NFFwMm9sSzQ4WHNrT3ZReXY1Q2lu?=
 =?utf-8?B?UTVEYkplQXR4ZFBkeVRwWTZ2R0luZHFYcnQvRXM4L0hPRDF0MTdFYzVQWUNq?=
 =?utf-8?B?QWEreXpSTXFlaURwRjg1Z0s0a1RWdGh3QW5hbjhDYjdjdWdVQ3BQbktLYmhU?=
 =?utf-8?B?anliT2Z3VTBzdTdVRGRTYXYrTStZSHBGelhMeDJuUWt6cEJqWjNCRnpFMTU4?=
 =?utf-8?B?cldzdzhlYWlLY1k5bVFpMUw1eGtUNnUwMFFrWTBIVmZLTjNiR0tYVm9JUncr?=
 =?utf-8?B?NmpwNFV2a1lSZDJaYm14Umt3SHZqSFdrRkNoQTZNdWxDUGpjVGtLb2NqVEFl?=
 =?utf-8?B?U1Vldk83cXRoeW5IU2Z6UW5xSFVqRlRZbVZEcDlObGtRS3I5bU9uUnc0cngy?=
 =?utf-8?B?L1diK2ZSNGs5bUhjK1V0NFRYOVlOL3pkSkgzSGpxM2xwSWJCMEF1NTZ4R0xH?=
 =?utf-8?B?MWFrbmJ1RVg0SnFtVGVDY1kwN3E2YVY5YnQrSzRkRkw4QUhlZ2FEUzgrSE5M?=
 =?utf-8?B?Q0Q4Y0p1N0ttcENGSi96S2NVckFpcHd5MWgySldHMWtQbm5ZR29mRStMTk9J?=
 =?utf-8?B?OS9vaTg1RVVtR3dyck5tcER6bDJpRzNUQVBFVEI1ZUREaWFTTTIwUlA4eUpB?=
 =?utf-8?B?aEFsRktuUlFUdGFFZFRZaEpxdUlzTkxnWUdXcnFSZlQyU2tZekVLRk9vTjVD?=
 =?utf-8?B?WHBVY1ZiNjE5T20xVjc4b2QzNzJVSERKNlk5dlhQM0s4MlNYZkpUOGgvTGZL?=
 =?utf-8?B?ZFdWampsMXhmMVZUS3A0aU5BdVVKR1dVbmZkekgvMWpKQWhvaDRXbmRqNTFr?=
 =?utf-8?B?ZENUSDhCRFhyOWRUV2pldENaS2dwV0lxM0pBdXVLTlQvZ3psVXZCQmw4SHFq?=
 =?utf-8?B?eU1XSkF3anErZjNjSDVLc1F4Ky9TT0VVVWpYc0luZW42bk5HaGdDeGNvWlRX?=
 =?utf-8?B?NlJ4RGljb01LZ3h4OXZyQ25OUStBdzBRUFlIZ0M5VWdNVXNIOWV1aHRhRVVj?=
 =?utf-8?B?UWxpTUlWVmlqVW5QUHlJbFhXYy9vbFNBUTlkckZya2gxRDNxaE9JYmlHeVpN?=
 =?utf-8?B?eUdIZlFOUFp0SStubXJCVE5DQ01rcm55NkswVHdxQXVFdCtqcEN0cUZILzhR?=
 =?utf-8?B?UlVHaHpjY1VUYlZicVp4eEdRcjJ5WFBpOWVGVWVreFd1YTBzL2ZGL1piV2lz?=
 =?utf-8?B?UTZjRWVsa1hUcXF0UWZXcHRIeXJpdEgxd09wQUhxWEJZYnoycXB0UUNjRDA1?=
 =?utf-8?B?dFFDOTRxZ3o5WTFPcEZCYjBDTmdlZ2xpT1h4ZHpyZG5la291elNiN1pxcWpI?=
 =?utf-8?B?Q0pYUEp4alhnMzRiREpvcWpvK2VuWW95MU5NTjl5c2tVU0VQei95OFVhckJY?=
 =?utf-8?B?azNuUE1jRVhKaUVjS1RtcnBSN3Qxd09NK3oxS1ovR1BORWVrdTdZUDBTaDlz?=
 =?utf-8?B?cTBSS2trbmdUemMzRnpsUTRVZy8yVXF1UUppM0o2TXdDTm9JN1hjQzdzMGly?=
 =?utf-8?B?a3lvNVNNaG1VRy92aDhqbkpPYjZDS3ZXdTA4eGN1Z2JXdGt5QnV1OG5zOC9z?=
 =?utf-8?B?WUROUi81dEwwWm10WDNiQzY0N3BBZzFtVS92QXFIdHJrSGVVQStQTGJxbm9X?=
 =?utf-8?B?Tm9qWFBJNkxFemdvMndqQU9RWFhCQlk3VTRvb3BwZStCQWlmeVpCUE5mZkZ5?=
 =?utf-8?B?TEFBWVRCM2ZuMURDVm13aTVQaVBXd2d5M0toVUQ4OGFWUWZTN0NWOC9CUE1I?=
 =?utf-8?B?UFQrcXJFRkUrMHQvamtVdz09?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-3uvvr3TYzTqcX0k+NP6D"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB1937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7d6c7ff9-297c-40cc-9be0-08d8d375dab5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ea5Mcm17XTIPQKRKEN+WjFYQBgLCmmzPdN8KnZOttyfKJva/EH/7jqIXcZZ6+dkRR3UoYzxfEYj1m+VNwCjSZni4eQwkee/LCqSRC8xTTA0dLFCwPIr3zYwPpdoJrAXIYSU9768oiIhtLSnmAu6vAVzKWhOKU7RuG9MvcRjvIH+MSLuoVr0+RtFqe8p3yNRNx9+qnjMgffrRAoABONkBEbcZlLM7jzyDMziUphIQPUTMXlmvJBeP++fJfi7+fK8u/f5BKblH2U0Wuvmcbnf700SGNj7ZYANZLR1hOq5tXbW0L4EUS69cWJZxP1prtAixTN84iORGMM1vttXg9avxrsyURTdPY6w00KdUfE8ABpVOIpGdJmu2ukZbd7WsmKr6R5p+oSSsL2G/2eJyseb6M55C8QWR2/enYi0t5obMSHBY96GFvuF9JFaRrLYttS8u2L58c75m5sPU7AgDS98T5Wan6Utxve0SlBHc46qlDtulmlgEwFSqlBel9E6Mj72yJusmFr4WkzLjLEWvQ6nwMuH7vEgkhrC1rQ1rb7tsQlYOkUsZNx4crmoMknwq1jJneOl+iQA9Nm+EDlDGo65eRvmjBI0UktweTtDNRQ4cjHCQAZ+U3oC0l1CJJuErmTuknofURT2d9yusPa6vfp+GeC3v+28anZSNGcXCxvAQAnLOGPCVfYPeS01jDK5YcSnN
X-Forefront-Antispam-Report: CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(39850400004)(396003)(376002)(346002)(136003)(46966006)(36840700001)(6512007)(186003)(478600001)(82740400003)(2616005)(336012)(54906003)(2906002)(33964004)(7596003)(21480400003)(5660300002)(4326008)(82310400003)(7636003)(99936003)(26005)(6486002)(36860700001)(110136005)(83380400001)(70586007)(70206006)(6506007)(86362001)(356005)(47076005)(53546011)(316002)(8676002)(36756003)(8936002)(21314003);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 18:57:22.1393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9806cd-ced6-4521-5d86-08d8d375dbd3
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2872
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-3uvvr3TYzTqcX0k+NP6D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-02-17 at 16:19 +0200, Andy Shevchenko wrote:
> On Wed, Feb 17, 2021 at 3:11 PM Bedel, Alban <alban.bedel@aerq.com>
> wrote:
> > On Tue, 2021-02-16 at 19:50 +0200, Andy Shevchenko wrote:
> > > On Tue, Feb 16, 2021 at 6:37 PM Bedel, Alban <
> > > alban.bedel@aerq.com>
> > > wrote:
> > > > On Mon, 2021-02-15 at 14:53 +0200, Andy Shevchenko wrote:
> > > > > On Thu, Feb 11, 2021 at 7:52 PM Alban Bedel <
> > > > > alban.bedel@aerq.com
> > > > > wrote:
>=20
> ...
>=20
> > > > > > +#define PCAL65xx_REGS          BIT(10)
> > > > >=20
> > > > > Can we have it as a _TYPE, please?
> > > >=20
> > > > Let's please take a closer look at these macros and what they
> > > > mean.
> > > > Currently we have 3 possible set of functions that are
> > > > indicated by
> > > > setting bits in driver_data using the PCA_xxx macros:
> > > >=20
> > > > - Basic register only: 0
> > > > - With interrupt support: PCA_INT
> > > > - With latching interrupt regs: PCA_INT | PCA_PCAL =3D
> > > > PCA_LATCH_INT
> > > >=20
> > > > This patch then add a forth case:
> > > >=20
> > > > - With pin config regs: PCA_INT | PCA_PCAL |
> > > > $MACRO_WE_ARE_DICUSSING
> > > >=20
> > > > Then there is the PCA953X_TYPE and PCA957X_TYPE macros which
> > > > indicate
> > > > the need for a different regmap config and register layout.
> > >=20
> > > Exactly, and you have a different register layout (coincidentally
> > > overlaps with the original PCA953x).
> >=20
> > We have 2 layout for the base registers, the "mixed up registers"
> > of
> > the PCA957x and the "standard" of the PCA953x. Then we have the
> > PCALxxxx chips which extend the base PCA953x registers with further
> > registers for better interrupt handling. These are not treated as a
> > new
> > type in the current code, but as an extra feature on top of the
> > PCA953x.
>=20
> Yes, because they are about interrupts AFAICS.

This distinction seems arbitrary, each more advanced version of the
chip just has more features along with a new register block.

> >  The PCAL65xx we are talking about add a further register
> > block, so following the existing concept its not a new layout.
>=20
> Yes, with one important detail, i.e. it extends the "mixed up"
> registers, it's not a separate "feature" in this sense. The separate
> "feature" can be, for example, PWM registers. I admit that this most
> of the angle of preference how to draw a line between the features.
>=20
> I prefer to see it as a type because of two things (in the current
> code):
>  - OF_9*() macros take only two arguments, second of which is
> Interrupt related
>  - PCA_INT group of bits is about Interrupt only

No, the register set indicated by PCA_PCAL also allow setting pull
up/down which is supported by this driver. Furthermore the extra
registers of the PCAL65XX also allow configuring edge triggered mode
for interrupts. I really don't see why there should be 2 class of
features, that only make the code more complex.

> Your proposal will disrupt the code (more invasive).

I tried to implement what you like to see:

 1 file changed, 105 insertions(+), 20 deletions(-)

vs my proposal:

 1 file changed, 65 insertions(+), 3 deletions(-)

Alban


--=-3uvvr3TYzTqcX0k+NP6D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAmAtZw8ACgkQdJSaS524
Lbzl1g//eJKsTWlkcn2/HsHN+AlbPmHi2+R/hq4HwZIudhLSxkXO+DZ4cItm5Fia
q9epHR3b5kHyIRUy3QJjJrOeifYzX/aRz4CzP7GATVJ1jdRxPlV1sgmsyvnGHtaX
NBe7ESPprARkK5wajOnnhJ34nBHWwikaIcztXNN3wvav9q0q0Qco5mJZOJ7V8HDg
qGJWoaF6h3zotQM5BPDAN1FP0YwdtGv3spMYuohfkwSu/Is4SgL/xTQAHsxT8TUS
x0npx2jpO1InjCXu/t1drxKFj7UJ62OdeMd9lI0Ld8RR1dGIaN0sbWKj+uZJqu27
RIWci2oGYFKoppzh9u31McDq7S9JNbwXyHKAcwbGGLTLRYN/nBBLTRsazr0i1KGh
a0CQT9SzyEO2Qd4zxqe2bPB6uCWFhSmMYatFKI5X5yD7rXgnVoM7/2PyaeU1q3kF
xevMJTuVPbrL1ociG4Lm3ssK0yulb05xs1ctRaDFmWlclOOxHvT5L+x++kxEyeoZ
dBR8K6Mi/e6QFzwGdVPQDx9SA21v1jjVVYN1VgB+msponzwmT2PnQtjf1cay4FTO
rrTlLLDkCEbh4/knutSmW1y6cKVx4K0wXpmqGf39hqdfJv0tJ0v7aHq/gf5pc4Kh
e+hBWVoK8Iyisk0uPikh/d7gn+kRwucO2tySrWLRt/J2fwUfIfk=
=BIYP
-----END PGP SIGNATURE-----

--=-3uvvr3TYzTqcX0k+NP6D--

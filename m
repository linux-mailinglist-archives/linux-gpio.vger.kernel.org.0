Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F26A31D9FE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 14:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhBQNM1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 08:12:27 -0500
Received: from mail-vi1eur05on2093.outbound.protection.outlook.com ([40.107.21.93]:33984
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230473AbhBQNMO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Feb 2021 08:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8FPr6jBJR8+XavdFg0Hns/z8mVCkmFZBPlXAA7m3F0=;
 b=piHW3IRs9qPBmaGN5O+0Fmh3gW1ut+T6WG6ND2YazODLn9v24r8jR8PwCH2I0HlF5XctLSdJVGoXhdKOntyBRuQq/9qnpvauAUbrTDOx4TZYVbCoxB56YxmEwYAGbis0F8/xooeP2lmqBckmAPR9b+uAO69mR8NDpa1U4VgEIus=
Received: from MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::27)
 by AM8PR10MB4036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Wed, 17 Feb
 2021 13:11:24 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::c) by MRXP264CA0039.outlook.office365.com
 (2603:10a6:500:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend
 Transport; Wed, 17 Feb 2021 13:11:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; gmail.com; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com;gmail.com; dmarc=none action=none
 header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 13:11:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.105)
         by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
         ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
         tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Wed, 17 Feb 2021 13:11:23 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 11478495
X-ExclaimerImprintLatency: 1252415
X-ExclaimerImprintAction: f9e17520a1c74148a9f2141037ee5a16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niLjY7nvuLxdqfGx9nVzoL18xLNLoJkiHfqK72vyAVChucch2ogK/xBHqX07PNyPoWKSwpon3Hpt15UszvshoWbCzvnGeWYCzLi8DyvhTrPUZZNUmgMAV9tp8DzEA1BXcbojNERj6q951oCv6J8n9uucbYEO+hUl9xCzVDeN4tYa3f4W4zVS4yja10q5hOeI9UsN4cBzvW9tJZ3c0/wC4rGxJRKYZSnpROTOTlseiIDIssiBZ4IvH/19fG9BGvE1XFti+bm4b0qFVu2cZZc5hLRms1OtcXnXJ3zheEgcKxQ2y2ZGx9/MQiCtCXowkMOYCwfhw3HcfC520kXI+iIv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8FPr6jBJR8+XavdFg0Hns/z8mVCkmFZBPlXAA7m3F0=;
 b=Gk98+DhfOx/+K4HYujTjWqEaF55ShtcOHEz/7d8N5xCqCOPRPmKo8vOUDEGi/HBwinvV1ecnuRw+vcLz3z9+g2ShK9wVpmoAEzHh0M4j2TnqIKHuRQ+uM3XUDr+nzKd/Wv+Xl8QDXr6wSRXDMXiTgI+kh2Ipq/QD0SN4Lyor/w01nUxawsFqnFJcs7hNHVc2pM6nq9vikZsCwtZ85DVKh7aObcnyffEuPyEoLngMPBjLt2njI4H38G0CeeUC1Aa3s9/2eRlIoH2IEl6M9PPcoh2P10WAOilQt4TvFPvrbC2Nxeg1t/nZWJjTYMKf94tTLy6YoC5WluW9+5AZZY9qOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8FPr6jBJR8+XavdFg0Hns/z8mVCkmFZBPlXAA7m3F0=;
 b=piHW3IRs9qPBmaGN5O+0Fmh3gW1ut+T6WG6ND2YazODLn9v24r8jR8PwCH2I0HlF5XctLSdJVGoXhdKOntyBRuQq/9qnpvauAUbrTDOx4TZYVbCoxB56YxmEwYAGbis0F8/xooeP2lmqBckmAPR9b+uAO69mR8NDpa1U4VgEIus=
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:161::27)
 by AM0PR10MB3297.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 17 Feb
 2021 13:11:21 +0000
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48]) by AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48%5]) with mapi id 15.20.3763.019; Wed, 17 Feb 2021
 13:11:21 +0000
From:   "Bedel, Alban" <alban.bedel@aerq.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pca953x: add support for open drain pins on
 PCAL6524
Thread-Topic: [PATCH v2] gpio: pca953x: add support for open drain pins on
 PCAL6524
Thread-Index: AQHXAJ6Y8nHh4lzybEC6MhBJ7Xlm+6pZMfQAgAHQ7QCAABRygIABRDKA
Date:   Wed, 17 Feb 2021 13:11:21 +0000
Message-ID: <a1f4f5cc14a5037a8b122c811d2f24a8d3068c41.camel@aerq.com>
References: <20210211175140.85391-1-alban.bedel@aerq.com>
         <CAHp75VfUY5-VtCWjaU6Q=hJY9hyUz8B36C0528RXUxkbnL9yEA@mail.gmail.com>
         <4d67d5627921b0f7ca6579b81f97691c53ef0c34.camel@aerq.com>
         <CAHp75Vczzhs=8k9G1FQYvqOV+Xg3GHp2=TykJX+E5ypT8puFqw@mail.gmail.com>
In-Reply-To: <CAHp75Vczzhs=8k9G1FQYvqOV+Xg3GHp2=TykJX+E5ypT8puFqw@mail.gmail.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=aerq.com;
x-originating-ip: [87.123.195.200]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4a97d38a-bf27-47de-28da-08d8d3458684
x-ms-traffictypediagnostic: AM0PR10MB3297:|AM8PR10MB4036:
X-Microsoft-Antispam-PRVS: <AM8PR10MB40360A8981809A6F8CBA1D2696869@AM8PR10MB4036.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: coU4q3411PSVInm9R5knVyFlk3z4DmZqJ1gYxyn0Od925xflmctuf1bpaF5HKhBg6WncaAYGfEJ/LvMBvJioLpFfxNWnFqRshiN2uxoaHCdIlJcsYpGgoYak2RS+RotJZQAO5NAvTZX4bcb6vSAbU9PQlpeIU25s2O9Je4FEr1U6Gdp0DtYpJA4L7UN5ye3Uwg3poAEwjQWd7oK6fCZ2bibJ5R/aOmTpXVlPlQOOFxC2DxY/5XDqN7/zsDx4WH/YiBHyqAILiAE9oBENcgsPvOLpFvN3/fZW0elQUfi5vsJyRVhNsn+IG0D7Ah45lywXRD4vQq5iUcL7RCqjWapwoOAeQxyasi+FdpXHRnGx2AHXK9wv4qbT8Hcj95nTgBSkriDupnRj3+yo2vkd9uIhK9ie947yQuVesXXpQoh9tBxwSJWGJQfFmkRpohIotjiClSzmb3vUIzfWnZr1H0RAXnjcE11fE5JvJcKjiCZAejY6x5V7j/kaPHOUcjibkQku7DvzcJdcZwa9YdtMDuLHDys1n8q1Q5CzYW5rncyTQ3QnEBMDB0w3u+kk1haNdF7k
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39840400004)(6486002)(186003)(86362001)(478600001)(8676002)(71200400001)(36756003)(83380400001)(76116006)(66476007)(66946007)(66446008)(64756008)(54906003)(26005)(8936002)(6916009)(6506007)(2906002)(66616009)(6512007)(66556008)(4326008)(99936003)(5660300002)(316002)(53546011)(2616005)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VnQwVU9xSXdaRkJHUnowTWY5Z0V3UUhKbnpzQXl2Q201YkZQbjVCckhrajBC?=
 =?utf-8?B?KzE1dUtaNjlGWFBSOElKZ2h1bE80ZDNtSmxyZHVHbzZycnNmdEM0eTNMbTVm?=
 =?utf-8?B?cWl1MWFyQk9qOUV1WmczZkYrTFdqRUFnajViY25KaFVocXIwZ0pqUzNiYi9O?=
 =?utf-8?B?eXN1cTZwaUhaSHpVMlpVb3R3alBMaTlOSkhBMnBhRVdISHR4SWt1Q2dPNUNL?=
 =?utf-8?B?SVNad3ZSSmhZUkZEWk13TWZiTWJLQk1LYTlJVXh5ZlZoTDJsRkMvcDBObmlK?=
 =?utf-8?B?UGlCUmlNWUZnNWs1Vjh4MEQ1U0MxOVhmZ1RvNXJXangxNkhBT3cvMGljNnVw?=
 =?utf-8?B?ZDJZS3M0OFNOYWR0RHRJQVlYeGZGTEw1QWQ3bnhOUmpHZzhWQVA5NU5wU1U2?=
 =?utf-8?B?aWFHQ3F3eXdDdWdlMWFqOGZ2ZGJva2theFV6RGdYMVhGNW9vc3pNTVJWWHFq?=
 =?utf-8?B?eXpyUEdqT0pqQ3JHVHovaHhiMXBjYXpxanBKazJPOS9KMGJVOTY2U0llek9O?=
 =?utf-8?B?Q2s3N1hLTGViNlRVZTdwT29KT2piSXdQSDl3WlVSWmFJY2p0M2l0Y2dGRElN?=
 =?utf-8?B?RjF5cWlzVkpzVDNRT0VHa2ZlZXpZdkpWclEyQjJ2dWx6KytSd1hvUDdhUjVF?=
 =?utf-8?B?MVIrVG5DNEF6RXJpOWcvUDNHNEtBM2lteVFNSjB0NlQycDYwNVVrbU43bCsw?=
 =?utf-8?B?d0UxWTRXNlB6ZzUzYWU0M05ML0lNaDk1YzdpTnA5Qkhqc0dWU1VMRGZwZU1U?=
 =?utf-8?B?MU81NDlJYXluaHAxZ1BlZmV2dnp4OEc0T2VBZUlwSFpnVXB1NGtFUUxuaVFW?=
 =?utf-8?B?YXU4M2VteFh2a0I0MlVZSGl6RFBHOW1kQmx3b2ttNTdLcWVDWitST1ZLWFZW?=
 =?utf-8?B?MUlRcFVpaHVpeVJCQzhoQmZkeWZ2QjNQOWUzYWU5aGdaaFpWbncrSnBXMHZQ?=
 =?utf-8?B?OXlBQ2lOSDVLMGhEb05oMVhRelBabUs2NVdVU3FxUCtTZ3ozZlArUXJIQU84?=
 =?utf-8?B?WHRnSS9yeEp4QzMrN213RHdsZ0JYN0VQd1dsQ0p3VEdVdFVZQnBRMnZJQkJz?=
 =?utf-8?B?ZnMySnZXQmUxdHgzYTRaZzk1Nk9wd0VENkJpcmtQaHY1ejdvMXdOLzZuc3VN?=
 =?utf-8?B?dWE3a1VzdHI0R0JVREZ4eWZTbFljcWVLWmZTVUM3U1A1TnZUSmRsQkxUSlFn?=
 =?utf-8?B?QzBNWDNlUi9OWlNJOTNIUDlTcGdiVitxWXFhKzc5aWQwZ1lRUzIxVGZ0anhH?=
 =?utf-8?B?UUJXbGRoa0JqSkhYQm4zcDEveGhJc3BQeTVvTWFEdDJXRGhyT3NSc05xMG1L?=
 =?utf-8?B?ZExMVXlzOENSclFvd25ENUtQUTV0UnFUSmJPYUN6Y3paa29SWGtkL25oTnhR?=
 =?utf-8?B?NDJWSHVRb2hscVk2dTZvYVZ0cTRnc2tUOUMyMW9Jd25ZL3QzbVl1bHVNM1JY?=
 =?utf-8?B?K08rVTVzOStPK084dUxSY0FieVFUWU9jM0RtUTF0eHhNTFJEYlBLdDZBaHdG?=
 =?utf-8?B?cmVQRnlhc1N3VHR5ZkxJTHVDa0NqVVNET0lBQTNXY3BWRkZBZ05MaUJMTUVZ?=
 =?utf-8?B?cGU1VHJWWVNTN2RSMi9JZ2dOOEkwY1lVZUNPUU52Szd5YnkydUNneEJKVXNH?=
 =?utf-8?B?MEFnVGZ3TkdRblkvcWhuaVQ5NFFlNCtUSEdQcjJxRUxvRTFOaURGN2NYN0hS?=
 =?utf-8?B?MWFiZitCZlJXcm84RDk4YzlMdVFQYVhrTEhFZmIzb1lNYTBxdkUzU3NoV0p3?=
 =?utf-8?B?czdIeG1seDU5b2dKM2d5VVRjaHBKcXNmbVJZeFozZGlkZFBMNmxXTXI5cW5G?=
 =?utf-8?B?SHpybzJHL0JmR3FoYXc1UT09?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-9LEMUmYCBl1+fMxMZzHK"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3297
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 576673ae-6115-4069-7c1b-08d8d3458511
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etvw58h4Z0KPL9CzqcIZgqesmygj6QZ/B2//J2DmAE49cMLXKIdOGUxoznJ2YFFlM22jrl8hcddL6GoEg/zPCUcj2A1G40o9QSmQvdFhFLc1937XJZLp1kp0M6nQpznt3smXLefnOjkfq9Z84hZ57dKmG6tHUPNFYs4wDGB3deAApP1EoPcGLl1QWni2CUimSNw/G9hQcYTQ8lV5dRa8Kn8feCApDX9AbC3FzhWZwMtqnGCXNudkTwb+kIYBg0awp72qkhoR0BfbjqksTrwdibOuZmzgyG/UsP6m7jGgJs/gu5dCCLrxESNKmjt+kqTKLEjOeybh7iC6fos+pbxT3U+VgbR7YwEFiKdl18hu1YRT8zKXLI5nfz42chRJDAFXM+53pzjqSxW3ldWPZ55ozNBkRl3XB85ygj04wSUeg6sZGzeZxDPNpR29l3D2udNRdTY4gkgsN/6Uj1Nj1tEYwDNXEPOz3rxUyJHySRznISR0ptfeZJNZJWzlhFTQhRb8gZjcsyvE9jlbMKGebsRmDdOAjdOJ8Nq3Et2UVh61S9ZCGEDQypt1176w06SegH5EVlR+FW1AXSRCDeCYFUF81IgMWu4/2HCtHsZhM8j4FkNV49lQYX9q70p60iMQ/bsC7/WP4Aik+ujIdAvgkbmmqqUcCDsNtrjZNGPe1lYktq8kL7vQLNCL7w5Dg07lwIbv
X-Forefront-Antispam-Report: CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(136003)(396003)(376002)(346002)(39840400004)(36840700001)(46966006)(36860700001)(6916009)(356005)(36756003)(53546011)(33964004)(6506007)(8936002)(6486002)(86362001)(4326008)(54906003)(99936003)(47076005)(6512007)(186003)(26005)(8676002)(7636003)(70586007)(336012)(70206006)(2616005)(2906002)(316002)(21480400003)(5660300002)(82310400003)(7596003)(83380400001)(478600001)(21314003);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 13:11:23.0969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a97d38a-bf27-47de-28da-08d8d3458684
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4036
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-9LEMUmYCBl1+fMxMZzHK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-02-16 at 19:50 +0200, Andy Shevchenko wrote:
> On Tue, Feb 16, 2021 at 6:37 PM Bedel, Alban <alban.bedel@aerq.com>
> wrote:
> > On Mon, 2021-02-15 at 14:53 +0200, Andy Shevchenko wrote:
> > > Hint: don't forget to include reviewers from previous version
> >=20
> > I added you to the CC list for the new patch, did I miss someone
> > else?
>=20
> Then we are fine, thanks!
>=20
> > > On Thu, Feb 11, 2021 at 7:52 PM Alban Bedel <alban.bedel@aerq.com
> > > >
> > > wrote:
> > > > From a quick glance at various datasheets the PCAL6524 and the
> > > > PCAL6534 seems to be the only chips in this family that support
> > > > setting the drive mode of single pins. Other chips either don't
> > > > support it at all, or can only set the drive mode of whole
> > > > banks,
> > > > which doesn't map to the GPIO API.
> > > >=20
> > > > Add a new flag, PCAL65xx_REGS, to mark chips that have the
> > > > extra
> > > > registers needed for this feature. Then mark the needed
> > > > register
> > > > banks
> > > > as readable and writable, here we don't set OUT_CONF as
> > > > writable,
> > > > although it is, as we only need to read it. Finally add a
> > > > function
> > > > that configures the OUT_INDCONF register when the GPIO API sets
> > > > the
> > > > drive mode of the pins.
>=20
> Before continuing on this, have you considered to split this
> particular chip to a real pin controller and use the existing driver
> only for GPIO part of the functionality?

No, this driver already use the ->set_config() mechanism so adding
another property is trivial. On the other hand having a pinctrl driver
would be a massive undertaking as the pinctrl API is quiet complex
iirc. Furthermore, unless I'm missing something, that would not allow a
consumer to request an open drain GPIO which is what I'm after.

> > > > +#define PCAL65xx_REGS          BIT(10)
> > >=20
> > > Can we have it as a _TYPE, please?
> >=20
> > Let's please take a closer look at these macros and what they mean.
> > Currently we have 3 possible set of functions that are indicated by
> > setting bits in driver_data using the PCA_xxx macros:
> >=20
> > - Basic register only: 0
> > - With interrupt support: PCA_INT
> > - With latching interrupt regs: PCA_INT | PCA_PCAL =3D PCA_LATCH_INT
> >=20
> > This patch then add a forth case:
> >=20
> > - With pin config regs: PCA_INT | PCA_PCAL |
> > $MACRO_WE_ARE_DICUSSING
> >=20
> > Then there is the PCA953X_TYPE and PCA957X_TYPE macros which
> > indicate
> > the need for a different regmap config and register layout.
>=20
> Exactly, and you have a different register layout (coincidentally
> overlaps with the original PCA953x).

We have 2 layout for the base registers, the "mixed up registers" of
the PCA957x and the "standard" of the PCA953x. Then we have the
PCALxxxx chips which extend the base PCA953x registers with further
registers for better interrupt handling. These are not treated as a new
type in the current code, but as an extra feature on top of the
PCA953x. The PCAL65xx we are talking about add a further register
block, so following the existing concept its not a new layout.

> > These are
> > accessed using the PCA_CHIP_TYPE() and are used as an integer
> > value,
> > not as bit-field like the above ones. If we had a struct instead of
> > a
> > packed integer that would be a different field.
>=20
> How come? It's a bitmask.

The definitions use BIT() but all evaluations of PCA_CHIP_TYPE() use
the equality operator.

> > I'll change it to PCAL65xx_TYPE if you insist, but that seems very
> > wrong to me to use the same naming convention for macros meant for
> > different fields.
>=20
> To me it's the opposite. The 6524 defines a new type (which has some
> registers others don't have). We even have already definitions of
> those special registers. I think TYPE is a better approach here.

Let's look at pca953x_writeable_register() which I think clearly show
how chips variants are currently handled. This is just one example but
the rest of the code follows the same concept.

static bool pca953x_writeable_register(struct device *dev, unsigned int reg=
)
{
	struct pca953x_chip *chip =3D dev_get_drvdata(dev);
	u32 bank;

	if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCA953X_TYPE) {
		bank =3D PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
			PCA953x_BANK_CONFIG;
	} else {
		bank =3D PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
			PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
	}

	if (chip->driver_data & PCA_PCAL)
		bank |=3D PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
			PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;

+	if (chip->driver_data & PCAL65xx_REGS)
+		bank |=3D PCAL65xx_BANK_INDOUT_CONF;
+
	return pca953x_check_register(chip, reg, bank);
}

The chip we are talking about further extend the PCAL registers, so it
is currently covered by PCA953X_TYPE as base type and has the PCA_PCAL
bit set. I really fails to see how this new type would nicely fit in
the existing code.

> > > > +#define PCAL65xx_BANK_INDOUT_CONF BIT(8 + 12)
> > >=20
> > > IND is a bit ambiguous based on the description below.
> > > After you elaborate, I probably can propose better naming.
> >=20
> > It's derived from the register name in the datasheet which is
> > "Individual pin output port X configuration register".
>=20
> Since we have already register definitions, if should follow existing
> pattern, i.e. OUT_INDCONF.

Ok

Alban


--=-9LEMUmYCBl1+fMxMZzHK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAmAtFfcACgkQdJSaS524
LbwZZxAA0xZJw44Gs9oS5ku4EqyW956g+JqDk1JU/Rcy5kiq9Kiz1nsFr7F/vj1f
kFE+SjpiV7iL8iD4UjJKZHuYgjF/LhtrMdJtvEHy5cJcTKqCTKPwtD32PbDD87uP
sdLqiGu1vdFnwcvHxWc/qcgCfV/TZgbv5oLM4x1iZUSqfRDyqqWk7dOtH6WglQwn
JyLNKB1VtS8MRmpd0n7F1ZG9+01KZqiJA5ltHls3gVIL0+2lle2lTfCz+PtHSLZR
N1xFudWRuuZ45BVNOXSZ4QcUfeZxOzEiekomKXv9T4ivYjiRpEVbou7A5cu0EEqp
13pP9agBx53BESqSDJXcmUV41yYVimR0XzWJjLdxOd+wlJv5fLXCuPg3I/HCaTBT
vtolC9hKS8uzg1ZbV/trTY5rGDbd/USgZ+9ohaccSy2j0jxyMtPilZDJ1M8uNz5n
Aqi5IfyK7VjSOj+unMg4eHQCTCf/hVU4JrkmvLbv4aDLjAaEky6EfpneGvnJ5tP4
LZqmPNLTFfL8WDlsFUodx+DrJNbQr8xGu6V136LRuAcdobJPDG77IqlQ7us5BxVQ
8epx2Mc3GU8NnoXKVZjECepbjNXyoYQh3k3drxIPyXAujhKSja5zCFlooUBhzhlR
15xSGXPksU/V22LTNkWcD6lhi1kjW6whlzzsnpANgw5q/+UyrvQ=
=uG9V
-----END PGP SIGNATURE-----

--=-9LEMUmYCBl1+fMxMZzHK--

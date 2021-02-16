Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD43731CE3E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 17:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhBPQlV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 11:41:21 -0500
Received: from mail-eopbgr130119.outbound.protection.outlook.com ([40.107.13.119]:17614
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230077AbhBPQlS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Feb 2021 11:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xeZX1fu4qVwsLZuVoeIobcR/iMdUaD+vJgPOOWBsEc=;
 b=J5FhjjaDVdGvIX3Y8somNGcsr/uCIewmYBTnL44Gk44xtKfUiOoSIZMTrtjo2q5akZ82o9bdOx/FeSZXkcCwkkShJpOHYGgSs+NvXYm0s81Fp0vz5LeFUKfZL/xyzCh419NnvLml87ZrrsmKzAIVg2tluoHBOut3WP5vOumMHvw=
Received: from AM5PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:203:91::13) by AM0PR10MB2498.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:d9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 16:37:52 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::9b) by AM5PR0502CA0003.outlook.office365.com
 (2603:10a6:203:91::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend
 Transport; Tue, 16 Feb 2021 16:37:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; gmail.com; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com;gmail.com; dmarc=none action=none
 header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 16:37:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (104.47.2.57) by
         eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
         ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
         tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 16 Feb 2021 16:37:51 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 10871760
X-ExclaimerImprintLatency: 511306
X-ExclaimerImprintAction: 98879360219c4e8aaadb5e609b62b1ef
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLEXiPw/pr5NK79/3YRK8JVfege87z75bG1WoqrzHLl4ViYX2Kx3pID999tbwc1/262JflM2MtUowqcmAAxyB3yFTRfDbGf1q2WcRExbpwe9m9v/+P2SNSJUQ50t+vIxXkVDdOulqqn9AbFIpPQ9EkYyCg/v98eYyyl+ZNdBQ+G85LkFNq1QwHfQUR70oJ4jKbZieuKUeDLRTBYNvE6QFnTFjdre07s2rmBIjDrnMjMeLrhilFtKKANJCUHc9drqE9/4G2iM1JuTAtpaJ0V1/d6K9nM5pSPdUgEp1ShIDD6Apy4seoCfZHN/FPWpHAZ49WqkPEPyvIq+GpveP93vQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xeZX1fu4qVwsLZuVoeIobcR/iMdUaD+vJgPOOWBsEc=;
 b=IomVam+U/vN5+PNtCPrjUtS7AAa6lsdnF9V5n2a6X3aSlJUh5vKWUuG0nBM1+iZcR5pHKjQsmAx8Cx1MvB0ckf+mPAwnhtY8+kIqTGJ0OBvBNGflHBoJFjBzrDwif+jCWFaduF/qHFneBVgZKD+uo+l1RjUWAaSxtylQTou9mTHFIsg2T3/+2uMpVhWETaIr2ua/XBWrGvOvWj9PF4tcoWU9sy8Tn8U8YwvWZ0suqGXuQZF+KNljnKO2PasMHstBpS/4O9SZGBS4Pg38NEkJCtSaPe5RKFtoTbhbYAWXVQIyvAVxjy5LTl6tpPfkuqIS1H6xgsR2YVsvGw2mNrswQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xeZX1fu4qVwsLZuVoeIobcR/iMdUaD+vJgPOOWBsEc=;
 b=J5FhjjaDVdGvIX3Y8somNGcsr/uCIewmYBTnL44Gk44xtKfUiOoSIZMTrtjo2q5akZ82o9bdOx/FeSZXkcCwkkShJpOHYGgSs+NvXYm0s81Fp0vz5LeFUKfZL/xyzCh419NnvLml87ZrrsmKzAIVg2tluoHBOut3WP5vOumMHvw=
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:161::27)
 by AM4PR1001MB1442.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Tue, 16 Feb
 2021 16:37:50 +0000
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48]) by AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:6512:610:6d48%5]) with mapi id 15.20.3763.019; Tue, 16 Feb 2021
 16:37:49 +0000
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
Thread-Index: AQHXAJ6Y8nHh4lzybEC6MhBJ7Xlm+6pZMfQAgAHQ7QA=
Date:   Tue, 16 Feb 2021 16:37:49 +0000
Message-ID: <4d67d5627921b0f7ca6579b81f97691c53ef0c34.camel@aerq.com>
References: <20210211175140.85391-1-alban.bedel@aerq.com>
         <CAHp75VfUY5-VtCWjaU6Q=hJY9hyUz8B36C0528RXUxkbnL9yEA@mail.gmail.com>
In-Reply-To: <CAHp75VfUY5-VtCWjaU6Q=hJY9hyUz8B36C0528RXUxkbnL9yEA@mail.gmail.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=aerq.com;
x-originating-ip: [88.130.51.248]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e42e39f6-f718-4779-cfe5-08d8d299341f
x-ms-traffictypediagnostic: AM4PR1001MB1442:|AM0PR10MB2498:
X-Microsoft-Antispam-PRVS: <AM0PR10MB24980FC62D5D43F3F72C99C396879@AM0PR10MB2498.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7NYG/ebicaq7AAFTCmkGVZlfQgGdUbgiJ7mjpkgqlqiqlCmXVeX/W0nBSooaoaozlfPAIoPw51k5wu/cTiOF5uYAW7hFjI5Z94q0jbDFR5CLg4LjVkO4CMk6xbpp1SVasjKCTexBBAga4uGLsk/z4PYGC1WgpmR/9oCFBpd5V45mndmFKuiIh/UknSB2rgrhdUOyey7vr6O37+xhx8Ga4Q/j3k8TI4a8Uu4HSlYtJs0bsIf9PfLgnUxnxC9kQw4xzapBnmXDcTdf7rlafrX2wZV/LIID7+o2F39QnzFgvWyEzabZ628YFajLlN8YVboU1HoSOD2P7hDSgPGFeVgvYfBB4kUUJLhSW5wGClyP/KOR6B3UFz6j7PHfGXJ96AlScqWBpxLWyrLXGE7n47i1axEcLRvPysLNSYzGFNjb+w/E3lEVUn2vs5eqQApbu1JhBFto0T1UDwpwZPnjzEstzfd0+AgSyXeEQU9KOLwqFu1pbZ5dlJfxu002Cr/kvK+hRBoFk0R9di9BeKCh8uXz9bwc6IH5Vrwwh9+RlDXy3vHptYXCWIWqCGfWYhy9ZFJP
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39830400003)(366004)(376002)(136003)(346002)(6512007)(71200400001)(6486002)(316002)(54906003)(36756003)(5660300002)(99936003)(86362001)(4326008)(66946007)(66476007)(66446008)(66556008)(6916009)(8936002)(83380400001)(6506007)(2906002)(2616005)(66616009)(478600001)(8676002)(64756008)(26005)(53546011)(186003)(76116006)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QXhkVWE1WnlYQ0Nxd1RZNEtpWnFYd2tlNHU5Z09WVlBRUDR4bVUyL1Q3MEJY?=
 =?utf-8?B?QWZPTC80enZjeERHWUkzcjdnSFRDM1NjWmw0c3ZwVUY2OFhHZzZ5dUZYSGlR?=
 =?utf-8?B?Tjg4MXBJT01hRDNHMDF5WW9EQVYyc28zZ3EvMENhbVpTNWpJNGV4MVFFUXJ1?=
 =?utf-8?B?ODJvM1lkcHVuNG4vN1ZYK1ZsNElvT3lTOGE5L2xUNkZTSFI2aXc1L3lmNmlR?=
 =?utf-8?B?SXRZK29QdmFhSUJFRWNCQjgraFRtaFBvYTZwblNJQytieE1rMm9KcGZzRDVG?=
 =?utf-8?B?RFhFRmlkOWdkeFVOaDZIS0ZJdGZaSjRCcjYzYnNOOHhsb0d4V05SRVBtUS80?=
 =?utf-8?B?bkpCckFqaEN6L3V6eFU2QzEzeC93NERyYkZuVDl3SVNmdzVJOEJpK2FzYjZ5?=
 =?utf-8?B?WldoMXV6QlZDclNvN2dGUEsycm5RSGdtbjJzaTZ2N2QxUlA5dG1SWUhreUZJ?=
 =?utf-8?B?NVlOMWNWTXcwVGpld0hRT0IwbVE4WmNSZDkyTWhXaWRrVnc3d2k4NFFBNmpX?=
 =?utf-8?B?S0VEKzUxazhHL25QM2thczl6V0x1MnM3QTN3OC9CdXFldzNqb2NrWWRncnY3?=
 =?utf-8?B?blFXRmkwRHZEa1hyYTRWNjgwN3JxalY4czJHN3Nmb1puQmhCcDU2c3MwNTlk?=
 =?utf-8?B?V0JXU2JqaTdrdXBCTjRyVWxUTkxCU1JrUzNIWWo4VUoxbGdFU2FoRGFsUk93?=
 =?utf-8?B?clVmODE3SmZGRmJRTkNpT2Mwa1VKU09hYjVuNWNaay92SU0zN2J0NStVSUxo?=
 =?utf-8?B?bEs2MitvZVNTYytxSTd0dFNSM05BVEtFVDRyRjRpVmF2bGt6ekQ0U3MvZnV2?=
 =?utf-8?B?aTNoeml3QVNvWHJ1bHRMdy9HNUdyMk5xN3JxZ2djdmMxdTZibkZpU1lSTkVn?=
 =?utf-8?B?b3BURlBETmVJeVNDS0plTkJYNGphdnl1VUZxVjJTbXpRSlB2SW5QdkhEa1J0?=
 =?utf-8?B?VnFybSs5Ry8vQ3FlRzN2YStidEt4dDJPeU13OFFBWU54ckQzY2QyVEpHcnNP?=
 =?utf-8?B?QjVFZ2Q0M3hQZjlXMHVxd1ozNkJ3cWFlSzRLdi9VUUVuSThzWVRzaGh5dGNx?=
 =?utf-8?B?UTZha0kwLzlSQzAxdzdLMElsb0t2RXpPVG5xRTJnZmd6ZzJtRDNHMHVoUEMr?=
 =?utf-8?B?K1NtN1ZDd0pRaVdMWjNUUFF6YVdDMERBdlhLcldCem1WakJkUWpVOHl1L0tY?=
 =?utf-8?B?cEtTYVFHU1VPcWh2NURaUWhoVlBTaE8yVWFWZ0N5a0E1dnVHUUFjOXIvL1ZG?=
 =?utf-8?B?eXR3ZThuRGdSZkhINUpFNW1WbG9SR0krUE9jYmJveVIxVUViV0ZIVVNDT3BP?=
 =?utf-8?B?aUR1cnc0NEo2dEJDTDFrNmw5bUNDZXlhc2pVMEhkNVRrSWhDQlhLMlJDYWRk?=
 =?utf-8?B?d2ZSQWxKVk9XTWJONUdOWGdWL0tDTHZyMGpUQVYvNkhvTDlNTDJwR3BpQ1Bu?=
 =?utf-8?B?TXpVZURlK1lNYU5sNlE4UG9ITTI2TjdGRjllenQvMzAxcVhveGpzNFVkMG9N?=
 =?utf-8?B?eDBUYjBDdmR4N09KN2tCZVRsdy9pTk5JT1RqRUd6YzZaL0RYNDliSzdXQmla?=
 =?utf-8?B?UDFCVDRmZ2tSVmEzM09FZFR2SlIrb0wxZUcwdlJwdmp4bDRzZiszQ0lHTHNv?=
 =?utf-8?B?bldGeG1VbDgxcGdyV0tyQ1lUNm4zWGdTbUtUYy9pWHZ0aHljL2pscXAvLyth?=
 =?utf-8?B?M3JJbnVaUWQ1WWhGNTJ3UHZWMUZZV25NNWk5elJic1NZMGpHbjFoMWxuQkxT?=
 =?utf-8?Q?KbJoPTVzrT7Ln3RqgUrd7NUbaK4u3UKaQXxUQ2J?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-2DI06MSF/Yv+OwYZrnkD"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1442
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0f1965cc-036d-4e40-cda9-08d8d29932f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocSHiHXPoleseyZa4if70uFLnNAsdopDK14AcSoqK1ioCQzN7UYIveb/22q4Y/obuiEkhoYntitryhWcKsoAQtgTGkz07+reUuBPz2rh0FSK/XOwE3ccT58N/yCQUxFeEqjcTvLkcA+B1f0Imdf8J214mXKESgAJPhoW1ZNUAyhd9/6qxi7bmfppLwLaiE9N4zVKxXkpu28nOt98Qj8BAAyjQrDBKhq4JEFCm7EP0zHAf9DZKO4mydKTDZLIDcGXt1tQWzwGBCsUDqMfWp9VxFgZWHxCv7s4njEJVuMDYbrO6Qa+4HkxXsU1NAUXdM0VxFdy05h6K66vst3R7T1I3LYjCgseowDWOgfEA+pDnwNhq3xN054IVoMWcEQmxKpaqGkg0PnAMOEbR07xAo2XgHOSug0wd7BwlYLnknedVKJzV94pdiWALT8yxSC1qNUzjC/1swxO7mgOnvFd6Qti0e66OJWyMa2ujjf++2PQgosREop9+hgBpNOIgaK5Bi51BRbZ+1l9Pnpiw8Jp0gPOE8ZKkX+vGbHU0DaxuPinh3XCa+SQIOOS8B8xPd95Y9vKTluIVQBJctpmzE0LcvqAa6cO7B/m3hz9SQ+EW4DTtfvuHMeeHScSB/MoWGJrOHUdn/N4BhEOSBQ/pUj8LN9cwXxj2+a6udSMV2yiMk5IKIn0pzSLN52fzR/wPoYnEeVH
X-Forefront-Antispam-Report: CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(136003)(376002)(346002)(39830400003)(396003)(36840700001)(46966006)(6916009)(336012)(6486002)(6506007)(53546011)(7596003)(356005)(82310400003)(7636003)(478600001)(8676002)(2616005)(2906002)(99936003)(26005)(47076005)(6512007)(70586007)(33964004)(70206006)(186003)(54906003)(5660300002)(8936002)(36756003)(36860700001)(316002)(86362001)(83380400001)(21480400003)(4326008)(21314003);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 16:37:51.4826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e42e39f6-f718-4779-cfe5-08d8d299341f
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2498
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-2DI06MSF/Yv+OwYZrnkD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-02-15 at 14:53 +0200, Andy Shevchenko wrote:
> Hint: don't forget to include reviewers from previous version

I added you to the CC list for the new patch, did I miss someone else?

> On Thu, Feb 11, 2021 at 7:52 PM Alban Bedel <alban.bedel@aerq.com>
> wrote:
> > From a quick glance at various datasheets the PCAL6524 and the
> > PCAL6534 seems to be the only chips in this family that support
> > setting the drive mode of single pins. Other chips either don't
> > support it at all, or can only set the drive mode of whole banks,
> > which doesn't map to the GPIO API.
> >=20
> > Add a new flag, PCAL65xx_REGS, to mark chips that have the extra
> > registers needed for this feature. Then mark the needed register
> > banks
> > as readable and writable, here we don't set OUT_CONF as writable,
> > although it is, as we only need to read it. Finally add a function
> > that configures the OUT_INDCONF register when the GPIO API sets the
> > drive mode of the pins.
>=20
> ...
>=20
> > +#define PCAL65xx_REGS          BIT(10)
>=20
> Can we have it as a _TYPE, please?

Let's please take a closer look at these macros and what they mean.
Currently we have 3 possible set of functions that are indicated by
setting bits in driver_data using the PCA_xxx macros:

- Basic register only: 0
- With interrupt support: PCA_INT
- With latching interrupt regs: PCA_INT | PCA_PCAL =3D PCA_LATCH_INT

This patch then add a forth case:

- With pin config regs: PCA_INT | PCA_PCAL | $MACRO_WE_ARE_DICUSSING

Then there is the PCA953X_TYPE and PCA957X_TYPE macros which indicate
the need for a different regmap config and register layout. These are
accessed using the PCA_CHIP_TYPE() and are used as an integer value,
not as bit-field like the above ones. If we had a struct instead of a
packed integer that would be a different field.

I'll change it to PCAL65xx_TYPE if you insist, but that seems very
wrong to me to use the same naming convention for macros meant for
different fields.

>=20
> > +#define PCAL65xx_BANK_INDOUT_CONF BIT(8 + 12)
>=20
> IND is a bit ambiguous based on the description below.
> After you elaborate, I probably can propose better naming.

It's derived from the register name in the datasheet which is
"Individual pin output port X configuration register".

> > + *   - PCAL65xx with individual pin configuration
> > + *     Individual pin output config    0x40 + 12 * bank_size   RW
>=20
> Not sure I understand what "individual" means here (no, I haven't
> looked into the datasheet).

"individual" mean that each pin can be configured individually as
opposed to other chips that only allow to configure a whole bank of
pins.

> > +       if (config =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN)
> > +               val =3D mask;
> > +       else if (config =3D=3D PIN_CONFIG_DRIVE_PUSH_PULL)
> > +               val =3D 0;
> > +       else
> > +               return -EINVAL;
>=20
> Switch-case will look more naturally here (despite being longer in
> terms of LOCs).

Ok.


> > +exit:
>=20
> exit_unlock:

Will do.

> > +       mutex_unlock(&chip->i2c_lock);
> > +       return ret;
>=20
> ...
>=20
> > +#define OF_L65XX(__nrgpio) OF_953X(__nrgpio, PCA_LATCH_INT |
> > PCAL65xx_REGS)
>=20
> When you change to the type, it will go accordingly. Don't add
> LATCH_INT to the macro.

As explained above all chips with these registers also have the
registers indicated by PCA_LATCH_INT.

Alban

--=-2DI06MSF/Yv+OwYZrnkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAmAr9NwACgkQdJSaS524
LbwycA//WmJ0Hd9DhBbQSEdUpsDLtBz+TRplsXa5H7hz1xtjlGrkRk9R9cxNCy93
lpsJ4m1dflTPkGGGSTxv2AxlPaP5T7NNQWQHKi6Kihg06zT3THc7bW1MoMJ5j626
7wJNet9s2HkM+wvJ8MK7SbacDUGiViJdKdgmaSLDPaDMhG64dEFA/xwRasyq3T/L
EbZt/E/IIu+vvsKo3B4ZlLPxfPoYnoHKbOOb1GS6mkVbimh2MNl/3TmM1il9kgnE
ziAyyWuh22Z7PiinK1IyXbnbMgWsV2n1N7lAI5I6sGV4D7awhU6iP4N2HGsvk01U
sV3EvZqwc+GBt06LPkCLax+FXhbxrLplku2FNMOGe/VyFKelxDA5GL2km0Gv0uqo
txBnlerk8I7COMjl9r5wv6hpRl0nQU9WF78SrEkoq4kpnTiG25ZyVeE3h+kGtGiI
WZom59ybvOdJrK1RRHDg16LQjaHMQijL6qfLJJwy9zNhHKbEkKl5GaauBcx+UH3Z
iyC90+NEpkuNJoVusiuLXnT7PW9O2vCFIbP7lciMYgoD2X/MK+k8kham0DJD7a7u
JQ4S/57kke19/vPqx+qR9gQ4I8olSG3Z7VIElrAQZxsR6iMRKfQx8oloB+Aapmiw
rrxySioksR/W6dJxVawiBvkEzNti7QrNi4Fr4ayJFHDD9QgV6yc=
=RocB
-----END PGP SIGNATURE-----

--=-2DI06MSF/Yv+OwYZrnkD--

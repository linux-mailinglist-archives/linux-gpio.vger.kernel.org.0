Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE9030C859
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 18:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237739AbhBBRsh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 12:48:37 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com ([40.107.22.120]:36193
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237881AbhBBRqP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Feb 2021 12:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgMIvYqvmd6G/T5AzRzSc1KbcIalG0YFHMu2IjRFKQI=;
 b=iu0/Z5iniy1XQFmH3q3cB4ARSLTrDIXzMJsv5gfKWqZsmBrh/lluQSulFm3jCgJ5LDtVSS+yIFpvIJwmv46MHVJhiz2eCiEFiUvVeAibP0zU4BtNmTZDP9p2xkYSkvtDfR9u3RvtyHhsfazjFsMRTTHPmtF6u3mAEdTn3gs2DiM=
Received: from AM5PR0601CA0073.eurprd06.prod.outlook.com (2603:10a6:206::38)
 by AM6PR10MB2888.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 17:45:24 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::91) by AM5PR0601CA0073.outlook.office365.com
 (2603:10a6:206::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Tue, 2 Feb 2021 17:45:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; linaro.org; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com;linaro.org; dmarc=none action=none
 header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 2 Feb 2021 17:45:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.55) by
         eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
         ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
         tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 2 Feb 2021 17:45:24 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 14179109
X-ExclaimerImprintLatency: 367494
X-ExclaimerImprintAction: d5029e60e2e5469388c4b5188ac25a0a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IedzqcKfE+V/rar/fGvIbP3+SF8HPA+At/vVftnBB/uNtQFuFqf/97cWu6D7UsEdcWh4oQmIu1l5J8FHypN2jfE3qKyll0rEiQ+ZA7hWI6C9HUx4uhzztw8DABHMqKJnoewe3KCsp5p/wIAmgl6mDdx25KB93Q6FzdV0e31ucWeDgognBImsuQslys1sJTYuoexICpkKS4jNSH7iUuHRpjXEExuV7nbwP5Uu7Aq4hJE9KoiQ1NYXm8ntwuduPru3mdS2ePkxhM2ogkHXQniDqoi5oUafFaU58h7riqiX6RR2K4BeOeEE/VDlZdXdRxAU68SATKcoE5YVQYeAIrHUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgMIvYqvmd6G/T5AzRzSc1KbcIalG0YFHMu2IjRFKQI=;
 b=A3YAtBFfo18XxQRhzYtZe0j1tNY9yMkUqM74vqe/HSxz0UL0E5h0PO9ara0LEq5eZhai8Gm9mWnyd1UXEYvuIlAn32fpPMOXNfMJjDoVR4NhknnwlH+9bCgTAvGUmpTAUkYHKmIotOfFcG3UfrbpFD+qKy7A0gtC3aEXdMYMAl/5ukDBVbTtZVOaar3HB9bhGw/M8DwjFy80DBrsUfrD+nsDW0WldHXDvziD7F0jRkHRNKcB+7XC54YQWdAsqNyUfcD4P4E/yt9Ffl2/7c3JNrv+9g9uOXGWhfl1kMqy0ITTLorlJmXYRPS89iTjiSP16sHlgscgvhz81o62YM/dZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgMIvYqvmd6G/T5AzRzSc1KbcIalG0YFHMu2IjRFKQI=;
 b=iu0/Z5iniy1XQFmH3q3cB4ARSLTrDIXzMJsv5gfKWqZsmBrh/lluQSulFm3jCgJ5LDtVSS+yIFpvIJwmv46MHVJhiz2eCiEFiUvVeAibP0zU4BtNmTZDP9p2xkYSkvtDfR9u3RvtyHhsfazjFsMRTTHPmtF6u3mAEdTn3gs2DiM=
Received: from DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e4::19)
 by DB9PR10MB4618.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:224::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 17:45:21 +0000
Received: from DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::901:86ea:2351:fb52]) by DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::901:86ea:2351:fb52%6]) with mapi id 15.20.3805.025; Tue, 2 Feb 2021
 17:45:21 +0000
From:   "Bedel, Alban" <alban.bedel@aerq.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: pca953x: add support for open drain pins on
 PCAL6524
Thread-Topic: [PATCH] gpio: pca953x: add support for open drain pins on
 PCAL6524
Thread-Index: AQHW9YtTve2FLqoyiEecHFkdtDbNF6pE65yAgAA65AA=
Date:   Tue, 2 Feb 2021 17:45:21 +0000
Message-ID: <93036ef781d20df4c6017178cc545702bd0f42bc.camel@aerq.com>
References: <20210128153601.153126-1-alban.bedel@aerq.com>
         <CACRpkdaP8-mnXuBZRKad53tvGrS0BdfTRKNezr0mhRVf8qkYig@mail.gmail.com>
In-Reply-To: <CACRpkdaP8-mnXuBZRKad53tvGrS0BdfTRKNezr0mhRVf8qkYig@mail.gmail.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=aerq.com;
x-originating-ip: [88.130.51.118]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2973c721-aab7-490f-726b-08d8c7a251b8
x-ms-traffictypediagnostic: DB9PR10MB4618:|AM6PR10MB2888:
X-Microsoft-Antispam-PRVS: <AM6PR10MB2888F2CEED255CD6E6075C0096B59@AM6PR10MB2888.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jZUj+SdgamUAu9/g5zwvmrhP9Ht+a7TjkNr0+fOklHnR32rxbomdwridij+j5aNEswB9sS27xriLMs4QY66l3kn0Uh/w7hbdo7DlRxYIWTq4saxdiWChmKT7+VMSN73NmEBKDpk4S0CDJFlOUx7iWJyUuMyoxIj3GR8oxX3U/11lQKo25iYbypcwOkcgrMUZGFcWvtJulul0mvglsygSUh+NnOe0FMqVRuxLkL1kuwWbV9bVWe7YrzKWHfOE/wzoY/R+cb+HcC9TGwLurhCW32gd3bnU1fOnlKikgz9h3XP7Yo/IA1+w70l7E9WDU9KcOnWIdSwmeiOFksHldZMG3hBJ8HH6gf1A8FAJdovt8aBZVA0tHC/1Xhmw8ahvB7JAv14XjSC+6FIwM9yk84sEWDna64jztEdteOj91Z8s8H4t9rQvAKEHtV9Gp8TVt422iqtlTxtvJGgm8OJ5Pk5TluPG3XEHH0ehrpWJtJ1Cqs8mdTHHnKcQxCsS0ons65Pifl2uKDUQnhPD78a2MUcjtw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(396003)(39840400004)(6486002)(2906002)(66556008)(66946007)(99936003)(54906003)(316002)(5660300002)(91956017)(64756008)(6512007)(66476007)(76116006)(66616009)(66446008)(71200400001)(53546011)(26005)(8676002)(6916009)(36756003)(186003)(2616005)(4326008)(8936002)(83380400001)(478600001)(86362001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?T1dtTTJhUTBSYVJKNmlISFlRWjhkWUNidDdaS09VeWVrR0xOOCtYRG1IWTZZ?=
 =?utf-8?B?em5OMkJGQXBJZ0FiMGdTeWVxdVJiams2VmVBWG9mYWxBQ3JMSVBOZXF4b3Rs?=
 =?utf-8?B?d09nN3EzaHNJeThkWTcwRzdCdVl2bTUwNThONWlUdXorR2VsaDZxR1BGOHd0?=
 =?utf-8?B?dFV0cFBBRWxmTXVVSnY0emxCNy9LTXhpUzhSQUhTcGRzcER2dzdlamxXSDBl?=
 =?utf-8?B?dVFuYktzbmFDZi9kTWtGQ2tBbUNrM3ArcTF3ZjhvREY2VXFrSU5kZDEycFUx?=
 =?utf-8?B?Nnd5Z1NtQ0dETjMyRTAxdldaWTV4dUU2Tnp0WXVWVHdCY3RLMElPN3hLM3ox?=
 =?utf-8?B?aHArSTZRTXNTeVc5YlZrdVRHZHVsa05lenlQQXFuSlc3VUIxQ2oxYUp1UFBD?=
 =?utf-8?B?N3g2WURFd04rYjBKbGczb3E0dXVzQ2JVZXl4YWlDSFJua2VuTlp5NGlValhm?=
 =?utf-8?B?QzV0NUlxUWlxa29ZY2hxVWNIUCswUnBCejVWT0Rqc2FLdFI4WTNQTWczd3hr?=
 =?utf-8?B?eTUyNnp0OHgreEViTStKRGpvRE92a2YyVFNyb1ZEOHNDWUV2SnEwWHFDY3VZ?=
 =?utf-8?B?bzkrOWRnbmhvcGxKdm8wazl1aGMrM2d1Z0N4Z05PUkIza3ZCUG9FMGhwY2xS?=
 =?utf-8?B?ZjRRN29pOG8xN2hwajVDZFpTU245VjhjZGR6MDZVenI0M1dldzMrZE50R1FE?=
 =?utf-8?B?RGZCWW9rc0ViYmoxcUVlVmNtd3hpZFZ1aGpJd3VCdWc4cVBQRVRYMXpOTEVE?=
 =?utf-8?B?bDFpeFY5NG1kd1N3U3ZWazhqY3RkWTFaWnZJVXJnZGYvRnBCZzJlUWZmRXI5?=
 =?utf-8?B?SlRUbjZ4cS9LVGljSS9ROWZlOGtvWVpqQjlBaE83dmhOZ3BPNHp2c1FDS1ND?=
 =?utf-8?B?YTUyWUdoY094MjE4L3duN0x2ejI4bkV3YTZkb0x3T3h6a0xRRnN6Z0JDcTFa?=
 =?utf-8?B?cWNOMTVjdnhtdTR0eTgyd1ZiK2xFdS9zdWo0TURzZk1GRXAwOGVKY3hJbkpt?=
 =?utf-8?B?QmNvNy9GZDI3cmQ5KzhidWJHT0p3cGJ6WDlZdGpkL0k3MGVGZDBlSThjcmcv?=
 =?utf-8?B?ZnY4NEpvYlFoUXJXNlF4VW9iaThSODBaSHhocWJGNlVHRVdJM2dpSFF6RFp5?=
 =?utf-8?B?NVFRTUQxaCt4YzhGSDIvOXhSdTJUbTVsNmNJNis3WmdGWW1OOHdPR1hzdjNG?=
 =?utf-8?B?dUg5Ukc0ZUdsREpNMTBqTVVoa25nWnlDVHI5U2FRY3AwMUlGMWI0NE9mam5D?=
 =?utf-8?B?R3FmYzRWSzBPWUkrb2s0T3NXUVB0Y0lxcDFTcEVJem8xdHNtcmJxS1FPZ0dZ?=
 =?utf-8?B?UFhJZ2N4eXVZeWw2KzkyY0RZT1ZDL2NKdE1FcEdWWlNsSUtUWFZLZittcDNR?=
 =?utf-8?B?TWpTRjErTUhxa0NkUUxSV0s4cjVoWURZR1FZeFdlS1Vwdzl6YzQrUE5Sd25U?=
 =?utf-8?B?Sy9kWkpiVU9OSDV5bys5bVBrWHRtMlJBWWhtYUZnPT0=?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-coDEF+tXpxk/GQDRikYc"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4618
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1efb668f-c9af-474b-1301-08d8c7a25032
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohg7lZ9o234L5ao8uOmuu8tfmMxTmoLeGIauRzxSu6TIa9ZAjN8kiIjvWQEbYw/FaUg2uzUCwgPH7lm//XnFUYZxIB4fkI/rKV213Ow5YdjabIM3FmdHnZUp8gPlXypipFAmrrY/r+BA9rV2f16j9Z7DVIflrdLiqbp11/LCRyF7RiPTmR7TLSyDhZy1UyYSjPiwKiAIMFPBJ3ZSa6/UcXqFXl/8NXR+I+mLpecIjZqVDeGmpcWTcApC+zU7WZe8Ir59XrumXt5K2ogN9b31hxm+NsJR78CElgK6r1Te/nCpVcn0N1Z9T8UTicJaevGzJv/zP6xawA4W1PDx3bwDrzBZqcraTx9yZfxWqf+mab6zMXcnlSYGoV9q5s58uS/4aXEjY95QeohCqu6xwRKyMfcLix5zyCK94uNL0sT2aCPgJ+NjEKeY3DeS0l8YiOnpEsx3DMm+R7pxAvvGmIy+LiCJ7ln4NCXNrppKfIkh0cUS0x/6k6ThaHTUoGxF/ouEDhBNC1jBQjV1h+X6PcYwAOOT1JaXSgqBFHrwSLB7Z+dxTFijtl9DwMqqBN9hHgqWC2ZDdrEw6Fporwrc399UREFSxQfl/wAJ9Z5/tJNNWk6h9I2Kylqpi72iyy8+l6SvsPv7kyAiRTlJD5QQNtQKvzrKVeUuQUOp5TukFWMX9FQ=
X-Forefront-Antispam-Report: CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(346002)(396003)(39830400003)(136003)(376002)(36840700001)(46966006)(86362001)(99936003)(7636003)(36756003)(53546011)(6506007)(47076005)(8936002)(36860700001)(7596003)(70206006)(83380400001)(356005)(5660300002)(70586007)(316002)(6486002)(8676002)(2906002)(82310400003)(336012)(2616005)(186003)(54906003)(26005)(478600001)(21480400003)(6916009)(4326008)(6512007)(33964004);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 17:45:23.7239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2973c721-aab7-490f-726b-08d8c7a251b8
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2888
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-coDEF+tXpxk/GQDRikYc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-02-02 at 14:57 +0100, Linus Walleij wrote:
> On Thu, Jan 28, 2021 at 4:36 PM Alban Bedel <alban.bedel@aerq.com>
> wrote:
>=20
> > From a quick glance at various datasheet the PCAL6524 seems to be
> > the
> > only chip in this familly that support setting the drive mode of
> > single pins. Other chips either don't support it at all, or can
> > only
> > set the drive mode of whole banks, which doesn't map to the GPIO
> > API.
> >=20
> > Add a new flag, PCAL6524, to mark chips that have the extra
> > registers
> > needed for this feature. Then mark the needed register banks as
> > readable and writable, here we don't set OUT_CONF as writable,
> > although it is, as we only need to read it. Finally add a function
> > that configure the OUT_INDCONF register when the GPIO API set the
> > drive mode of the pins.
> >=20
> > Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
>=20
> Thats's nice!
>=20
> > + *     Output port configuration       0x40 + 7 * bank_size    R
> > + *
> > + *   - PCAL6524 with individual pin configuration
> > + *     Individual pin output config    0x40 + 12 * bank_size   RW
>=20
> So this will become 0x70? It's a bit hard for me this weird
> register layout...

Correct.

> > +static int pcal6524_gpio_set_drive_mode(struct pca953x_chip *chip,
> > +                                       unsigned int offset,
> > +                                       unsigned long config)
> > +{
> > +       u8 out_conf_reg =3D pca953x_recalc_addr(
> > +               chip, PCAL953X_OUT_CONF, 0);
> > +       u8 out_indconf_reg =3D pca953x_recalc_addr(
> > +               chip, PCAL6524_OUT_INDCONF, offset);
> > +       u8 mask =3D BIT(offset % BANK_SZ), val;
>=20
> Split to two variable declarations please, this is hard to read.

Will do.

> > +       unsigned int out_conf;
> > +       int ret;
>=20
> So we set mask to the bit index for the line we want to affect.
>=20
> > +       if (config =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN)
> > +               val =3D mask;
> > +       else if (config =3D=3D PIN_CONFIG_DRIVE_PUSH_PULL)
> > +               val =3D 0;
> > +       else
> > +               return -EINVAL;
>=20
> And this makes sense, we set it to 1 to enable open drain.
>=20
> > +       /* Invert the value if ODENn is set */
> > +       ret =3D regmap_read(chip->regmap, out_conf_reg, &out_conf);
> > +       if (ret)
> > +               goto exit;
> > +       if (out_conf & BIT(offset / BANK_SZ))
>=20
> I suppose this could be written if (out_conf & mask)?

No, the mask in ODENn is per bank (group of 8 pins) and not per pin.

> > +               val ^=3D mask;
>=20
> Invert? Why?
>=20
> The datasheet says:
>=20
>   "If the ODENx bit is set at logic 0 (push-pull), any bit set to
> logic 1
>   in the IOCRx register will reverse the output state of that pin
> only
>   to open-drain. When ODENx bit is set at logic 1 (open-drain), a
>   logic 1 in IOCRx will set that pin to push-pull."
>=20
> So your logic is accounting for the fact that someone go and set
> one of the bits in ODENx to 1, but aren't they all by default set
> to zero (or should be programmed by the driver to zero)
> so that you can control open drain individually here by simply
> setting the corresponding bit to 1 for open drain and 0 for
> push-pull?

Yes the ODENx bits are 0 by default, but the bootloader might have
changed them for example. Currently the driver doesn't do any reset so
I think it make sense to correctly handle this case as it doesn't bring
that much extra complexity.

Alban

--=-coDEF+tXpxk/GQDRikYc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAmAZi5sACgkQdJSaS524
Lbxr2RAAlYZ1HMRTELtx/9nk+VE4415gD7HfaqfkrWGtO/A8bhniCb3GzzslokTj
JDCRRfOW0O5m9k3CGRrrCf5z73pJBUQ+glVRs0CHx3ct0oA9WvF5QwCg1hYkKwYj
YjF6DvCsPzFjRrCia3sKNT+VQlLEDUWMxODBDHOmaZ4HEIRTdOKMl9yxOU4nhd/F
ikaIhO/kwXNCYBcJQDYFm29Fxm+fXC7W+5BpLfNIExXz1ap9vpcF9L7+Bconyk92
x9auSQtTxh/ouLM+8TYXksns6O7SvSEBSxH6IJDkIThTXZesTzs3zvM5d3ZHGJVP
3ivl8WhatEoOvdZp3GuNSxktrCYs0bh+zrXsj+1E+i+FmpgT0EEsiEd6b1hpZT1g
1ZiASJcLNgjrqu3xrs+Fcrk3tFYJ7Ac7t2w7GkKO49EbwYLym5gNLI4OFULkV1uz
lDJTxO6QBCdjLhXVukIiFYwMl1sVIv7LPVv08/Lqvhx010f+bl5dN/uSJfxEz574
2lQAHDP1iBkfHMmO1K/5jiNqx6O5Dmojhq4gI6JMJZpmck4NhWxZn3z89uL/4OkC
mLa1AYc9UjnIm7tBNEE4225fXsXGrKCL+o7jstUVpX+UG3wpEj4fInRmgwtIxfxp
XSSPn4uqYBLT4Rx28HJIaVRN0YPGEkY0fNWtF+SXSo9ZPXuGzGA=
=Z4r3
-----END PGP SIGNATURE-----

--=-coDEF+tXpxk/GQDRikYc--

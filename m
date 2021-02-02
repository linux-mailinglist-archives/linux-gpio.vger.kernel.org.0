Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFB030C856
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 18:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbhBBRsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 12:48:36 -0500
Received: from mail-eopbgr50139.outbound.protection.outlook.com ([40.107.5.139]:56615
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237611AbhBBRqQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Feb 2021 12:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDKP3/yygQBlEXlmEfUHzhkDK1N2GSu/HkRqRuhlIBY=;
 b=YPuyZvGrR7Dlim+4Y+SqGrTpEOlcRYikM6wm+PMnVvyUNMfIBfU/LbJDPSBuYy/iweaCxyK3fpNxVYww29OB5K2r5tt8A1nMrk+HAkSMi2KMGFxYsgHb3XgdbzDBH1PtbaPV9i8jT5SsfwdE3nSU81fPoobpUprMt+8Q+AoB9R4=
Received: from AM6PR04CA0042.eurprd04.prod.outlook.com (2603:10a6:20b:f0::19)
 by AM6PR10MB2312.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 17:45:26 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::c8) by AM6PR04CA0042.outlook.office365.com
 (2603:10a6:20b:f0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Tue, 2 Feb 2021 17:45:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; baylibre.com; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com;baylibre.com; dmarc=none action=none
 header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 2 Feb 2021 17:45:25 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.55) by
         eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
         ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
         tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 2 Feb 2021 17:45:26 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 12466516
X-ExclaimerImprintLatency: 582403
X-ExclaimerImprintAction: 4a5286306f8140c395d34706e7d403ff
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k339Cq1Lx4Ro9gL6hBH8KWbVCpfGYFbScSOQuQ4RlVOePEWXizZnnDOOyTKpvNNfCbgKfszCdX2sjE6v/aNCtQEgTRmmPi/FBc8CxA7PH1WNX8nOHKV4Gli4GBNC6cD8d8nA7wUvSB3GbVgUhGTZ0fQbjmPMxlR3BK8FH1KAFk+oQ4oJjViMkpHdER0q7lQTSv/4C8Y6ki6z80Sv0/+FyaToZYfyGs1kFDO7JwM2xLwqNcrxCEL53Xfkdn+jdP/RPUi9hpMcAzewUAuuSQE8ioPsBXeKL22aONFMGvLR+W24KvAW599XrvB82ylhR3UunUUu1/v6oAbll1Fuy2EnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDKP3/yygQBlEXlmEfUHzhkDK1N2GSu/HkRqRuhlIBY=;
 b=GD0Mu07/dOHCh6ZOFvfTsor6XLAf80adLhW3o171VHO94Xw/obG3uVFouwtQ30tWmVbHBShuexZKC2UvAYA7oSWxQbk/p8FVQlSEgGzu6Z+fENdflyqSfT7Sc/3YL0FKT5XKr+v9hHrN+9hzdyn1g/MtD2xtSLYwfCx/pIIqYA8dnTAhcEkmYxwbNv9XrMvpaFZHgTlgyVx8I7l8ZoFJ8rMAFJbyq0vuB/ddnR7QRUGWQJiHfDL1PdWr1Un2W2o6tHl4TKmElsD10kcFYrvU1zMmRgz5b6TlMSasKTEJdHpz5/9w9MwzlUp7/R51U7IuCVsyWCzoKjX1/llctuMBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDKP3/yygQBlEXlmEfUHzhkDK1N2GSu/HkRqRuhlIBY=;
 b=YPuyZvGrR7Dlim+4Y+SqGrTpEOlcRYikM6wm+PMnVvyUNMfIBfU/LbJDPSBuYy/iweaCxyK3fpNxVYww29OB5K2r5tt8A1nMrk+HAkSMi2KMGFxYsgHb3XgdbzDBH1PtbaPV9i8jT5SsfwdE3nSU81fPoobpUprMt+8Q+AoB9R4=
Received: from DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e4::19)
 by DB9PR10MB4618.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:224::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 17:45:23 +0000
Received: from DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::901:86ea:2351:fb52]) by DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::901:86ea:2351:fb52%6]) with mapi id 15.20.3805.025; Tue, 2 Feb 2021
 17:45:23 +0000
From:   "Bedel, Alban" <alban.bedel@aerq.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: add support for open drain pins on
 PCAL6524
Thread-Topic: [PATCH] gpio: pca953x: add support for open drain pins on
 PCAL6524
Thread-Index: AQHW9YtTve2FLqoyiEecHFkdtDbNF6pExeaAgABlRAA=
Date:   Tue, 2 Feb 2021 17:45:23 +0000
Message-ID: <2d0ef621261d40a4ce8e39d0103c0db49f087a49.camel@aerq.com>
References: <20210128153601.153126-1-alban.bedel@aerq.com>
         <CAMpxmJXACfOkRB6m-_n_EmUf=6zLjQAie-UcQw+MNr-rTRC2SA@mail.gmail.com>
In-Reply-To: <CAMpxmJXACfOkRB6m-_n_EmUf=6zLjQAie-UcQw+MNr-rTRC2SA@mail.gmail.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=aerq.com;
x-originating-ip: [88.130.51.118]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ea6a1f86-1df2-499b-9f4d-08d8c7a252e3
x-ms-traffictypediagnostic: DB9PR10MB4618:|AM6PR10MB2312:
X-Microsoft-Antispam-PRVS: <AM6PR10MB2312E9CFF66D899C4A5B6C9596B59@AM6PR10MB2312.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oGve4SnkvyzymhOggww/tr0AagMqKcjXfw0vrmpy9cGYfnPubp4YsRbFld7i8PBmG2B5+O4bUeRtsvQ40MJofIpQNio3cHaZ+/g9cfLJkyBJbgSXS8ymR2V0MpqMHLFcE7G/zmqjMfRk13fjcszw2bQ393AbU+Zu0exTlXCPTfKIbcEgTPa6M43tI47CuNBRuIMYBYMtkpySZ3G1j6mhZmXG5HrxhdR3qaQUA1ip1Mjoqm6rcMmMtKiQB68quTPemtCcLexYWYdHniVPIdwekhTXfzAkREtPA1kBwsl0Xy7kkcRZPz/0+zzXHmWf61cxvqugPAgdEhG+I5IikM//a68+cyrJHoQthYYXDaApGLSOEeB9cGlCRaMzoL8TbdQGf8ylBoifzRRrz3TC17YdUCOcykoaDwDHGfJu4tdRF6QyRq2zKWuvJSSiQkbH1K3nSDo0AaCLA4IU6iopG/oXmvm30WavV4vt4b70+va9J9lVhK0Vb5RoFHLhV5wNrU9j9JYd3VKtKVHK4iCtr7TsEw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(396003)(39840400004)(6486002)(2906002)(66556008)(66946007)(99936003)(54906003)(316002)(5660300002)(91956017)(64756008)(6512007)(66476007)(76116006)(66616009)(66446008)(71200400001)(53546011)(26005)(8676002)(6916009)(36756003)(186003)(2616005)(4326008)(8936002)(83380400001)(478600001)(86362001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ODU3OUFZRXk2Rkk5RnViN1hJcUFHa2dwZWlxUHQwOVM1ZWowQWpWK3Fzc3Bl?=
 =?utf-8?B?T0paQ1pnc0lEdnFabDkzYWF2RlVWYXd5alVMcFhjaGQ5V3NVVlhsdjJzSmta?=
 =?utf-8?B?RnpwQVllMWkrWVVobXB6SzdjaS9USVUyMlZXemp2R0hPYUJJaGpHaVRIN2xU?=
 =?utf-8?B?NFFEZTNUcTJSZUtGaWlFRHhyaXg2M1d6SG8vUCtUS1BzTHBnNDlWVjV2dWhO?=
 =?utf-8?B?Z0FpbFhBUTRRRVZwY2pVMDJzQXRtYzJ0aFJLL0VETXhWSGsxc3BBMnJaOXhO?=
 =?utf-8?B?SDZXNWV5Um1BTXBvV0NicXFmOEZjcHJwbzU2ek9HWk5IWnp4U0JIY3lOSEp6?=
 =?utf-8?B?NStPN2ZGV0crYisyeFlPQStiM3hhNFdVWUR2Qkcxd1JGbWswUFZvVDh1YmRO?=
 =?utf-8?B?azZOU0l5Nm5sYUJ4cUZVcXFsc1EyN2hxZ21FYk0xQVJ4VHgxZExaN3lhb1Bu?=
 =?utf-8?B?b0g5STlCQU4xaE1vNitncXV2NEdGRXZSTitKZW0rQzVmRkhIQTFUc1NQWEQ4?=
 =?utf-8?B?dGhKeTZLTnFTbGZ0TFF4cy9hOXhpT0Y0V2hpa3FXd2NaV3EwTU50ZDVxMzNX?=
 =?utf-8?B?TXhvRkRyN2FZeU5BVjBqOEJGSzZPa05wN3JDQ2QwRzNscGdhbzg4Y2dFZm5y?=
 =?utf-8?B?NzdTRk9WdGZLcVRaNHc4UEhNZ1RZRnBNZ2E5VUhCZGFPNlFpNmZLVThIRjAx?=
 =?utf-8?B?T2Z1RFFmVGsrNkpPaDNKRnFkTlVISVY1Qk5vR0kvMXZ4c0hVcmFub2k2VUI5?=
 =?utf-8?B?TXV6ZENrSUhyUU1aSjlLZXVVY00yVDAwWVBYLzlsSUplN2lUdy9nL0xBdzl2?=
 =?utf-8?B?d29sZ21GS1lDTW9CcVBScHI2ZXFDVHJmcjFyWDhmM2NiTGV6QXBQYTNWUEY3?=
 =?utf-8?B?akFXUE1XQ2s4djRWeWNTZ3gwY25ZcGk5V3RwMUVmdmthUHdhY3BENmJjMC8z?=
 =?utf-8?B?NXF4SU5pMEdkTXV6V1dBTlpXU0VoZmxOQUdBaW1xd1NhcU9BYmp4TDI1bzVT?=
 =?utf-8?B?dlhRSjZaeXJnUUlVM21jL25JQVVaZkcweUhYWC9mRGZiSml2bVBpWHo4dWpR?=
 =?utf-8?B?b3NUZzRwZkJHa3ZhWTh6Z2tsWHU2SU9XcEp3aG1DRDJyWWFmY1JuVGNCY29h?=
 =?utf-8?B?YVpqanM1Tlo2YmpONldnVVpWUWsweEttakdPUkVrQXV5c2VoeWVWNmZ6MVg3?=
 =?utf-8?B?cWtaNWZqZFFZVzczalJ4bGhHRzFsdENPeFNGZHhVUGM3ZGFZcHZXMVBSZ1ds?=
 =?utf-8?B?MG5BZnNST00zbUxYOWVBQ2xwTm4xd0ZGbEN2TGZOaXB0SCt3SldBL05aYmFr?=
 =?utf-8?B?MGhXVld1WEEvTk1Gay9icXpadTFqdlkxOGc0ZFRWVlFreGs1Q3FIcHp4YWtt?=
 =?utf-8?B?a2ZLS0VIeHFHdGR1OFpVR0g5ZTRXNDExZ2phM1FXWXNKeE5seE5JQzRIbW84?=
 =?utf-8?B?T1lUTWovT1BsQVlBR1o4OGs1L1hGOGpJYjRLQVhBPT0=?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-P9BNSaSpMKOFAPnoHxih"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4618
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a44cf4b9-3d97-4b8b-a9c6-08d8c7a2513a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uguz9cW0Rq1RJKP9RuvjmP4UWoz67Jf/7sCZTGTbdE3XJzJeEjmj3e0LtPskEDrPnsPefgU1OHi8/9E7uNwtTYa7b+DlaiifBp7iXiV+e11XnVDlDIrbEglZLNGMYc22IxtekupRxQbh9ucsuttq6l5CSYUb2rtiBRA6udcPlW/HH7nD9jKhgAY1zBaXxWDoL3+R0Xc0l0dhiPerIvWQO5hxG1RJwJnibskYVKD8VOv54eXa4hN0Sf/PS9icvovvEmJstvmCoznaa/yLYv8bxErGuK3P6Ugzi+c8+J5kEdX5TdoOdC8YGP5J2JYXQPIBw3aXVJKriUyGrEzFRQAH9C8IanZvRJxQ7UZIRTxDkqVMmgcnT7Ajgfc8KtwatQJ62idyHXwcG/WwRY/5C03eyssUWHXLka5EhfiBRKieWXmFAyzukzVwNSbYQBEuE7aF50RcCfYgR9dNbUsXXfsFBjkbNJ1cY5Tkw3TJYkEySt3DNPTNjPa602m7FsOlKjceqYNifmRPI1VnD//ujS7etqNghXy/YSkEWzALBjbZy/Og4OcOlMOWXXJurK6tGq/2eZDptg9PaFhQfU8OcqJs4Dj8x0d4oNIOHyJOQ2SwVqRTyZIyiaX/xC/bb067UJpYxruPGlI+iaIj1NQUiXoOgA==
X-Forefront-Antispam-Report: CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(39830400003)(136003)(396003)(376002)(346002)(46966006)(36840700001)(82310400003)(86362001)(478600001)(47076005)(7596003)(4326008)(99936003)(7636003)(26005)(6512007)(356005)(6916009)(70586007)(5660300002)(70206006)(8936002)(2906002)(21480400003)(336012)(2616005)(6506007)(186003)(53546011)(54906003)(36756003)(316002)(36860700001)(83380400001)(6486002)(8676002)(33964004);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 17:45:25.7115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6a1f86-1df2-499b-9f4d-08d8c7a252e3
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2312
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-P9BNSaSpMKOFAPnoHxih
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-02-02 at 12:42 +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 28, 2021 at 4:36 PM Alban Bedel <alban.bedel@aerq.com>
> wrote:
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
> > ---
> >  drivers/gpio/gpio-pca953x.c | 64
> > +++++++++++++++++++++++++++++++++++--
> >  1 file changed, 61 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-
> > pca953x.c
> > index 825b362eb4b7..db0b3dab1490 100644
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -64,6 +64,8 @@
> >  #define PCA_INT                        BIT(8)
> >  #define PCA_PCAL               BIT(9)
> >  #define PCA_LATCH_INT          (PCA_PCAL | PCA_INT)
> > +#define PCAL6524               BIT(10)
>=20
> Maybe call it PCAL6524_TYPE for consistency with the ones below?

This is a flag that, like the above ones, indicate the existence of
registers, the types found under indicate a different register layout.
Misusing the naming convention would probably be confusing.

A generic name that don't reference the part type (PCA_???) would
perhaps be better but as I couldn't find any other part with these
registers I left it at that for now.

> > +
>=20
> No need for this newline.

I'll fix all the style issues you pointed out.

Alban


--=-P9BNSaSpMKOFAPnoHxih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAmAZj4gACgkQdJSaS524
Lbwi/BAAhuk6spr70YISe3d8GzDKmWBp4bn6nM3HtmwJb0Dyck5cFl+lDspTTwnA
K4tEBAWRJP3a/3DXaNFHBVfY/3sYd0raDGcXXRPGPKlxYy+dkTiF+5O7NXJDDQL9
7ZXlQm+O3wcy6BfyWjsCpVvvd4TZyR2yo2drEhZHIEe4TN16B4Xl3MPAyuK9so4w
CuciPZqEbIdIaXrFnyg5Mpc4Iesre2UMxmpIZ9qTgKjIb5phiWqwv4Xi2ISQSWM+
FG2Czv7XZ/hQkunRtY7IYys7khu6Bm4RMU/7+PeBG1DKLXRGAIs+SNtxYrvGDx1k
vbfgQf9FpGci66b5HAobb0k2UUKiyrC2qDTXF1fBlx1/iec94ksjGmyl3ohD3kA/
GdAeJdaIayCqSQKvJqf0f92YZ6J4zSdzpwSKvrvfnRlvkMMVqd8+Q2hC+Rp6jzYT
XMHcu0n1f9QAOmNPexAoLItcnjloFpCStdyXaxXqm31oMoWdQOtMyVPMDgpmXZgE
RQ/xvMapdtqqYDHGPiQiz6hny2kIOdbMcRoKJO3a/AFLsZ2h+bsYeY4hz/1cLYGL
262/8Yav6jGEvPybCC4/faOynquKxv5g3m+/zrItYS+ksEsHdaPRWxTU3zbOpsI9
K6X7gBGf1ND1qB1vBWpCVZY54FKcINVoIdj/RpbBACOC76jFdRo=
=az6Q
-----END PGP SIGNATURE-----

--=-P9BNSaSpMKOFAPnoHxih--

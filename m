Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655FB122808
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 10:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfLQJzn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 04:55:43 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.112]:52695 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726700AbfLQJzn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Dec 2019 04:55:43 -0500
Received: from [85.158.142.204] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 13/A4-12462-B16A8FD5; Tue, 17 Dec 2019 09:55:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCJsWRWlGSWpSXmKPExsWSoc9iqiu97Ee
  swepnQhbzj5xjtVg1dSeLxf2vRxktpvxZzmSxef4fRovLu+awWXzYdZXZonXvEXYHDo9NqzrZ
  PO5c28Pm0f/XwOPzJrkAlijWzLyk/IoE1oy1Z96zFXSwVRzYPYW9gfEdSxcjJwejwFJmiYlzM
  7oYuYDsYywSP5q62SCczYwSv3t/gjksAieYJZqfzAVzhASmMUm8uvWQGcJ5wiix9/BcsGFsAh
  YSk088YAOxRQRCJV4fbQQrYhbYyCyxZvJ0RpCEsICbxMe7L1kgitwlrrw8zQph+0n8aT8I1sw
  ioCox8etqMJtXIFFix8MmVohtT5kkzs3/AdbAKWAiMWFnGyvEG7ISXxpXM4PYzALiEreezGcC
  sSUEBCSW7DnPDGGLSrx8/A+qPlXiZNMNRoi4jsTZ60+gbCWJeXOPQNmyEpfmdwPZHEC2r0TLK
  T6Y8i0/zrNC2BYSS7pbWSBKVCT+HaqECBdIbPl9hg3CVpM4O7Ed6gIZidszOsBekRBYwSIx4e
  YexgmM+rOQXA1h60gs2P2JDcLWlli28DXzLHBQCEqcnPmEZQEjyypGi6SizPSMktzEzBxdQwM
  DXUNDY11zXSMLvcQq3SS91FLd5NS8kqJEoKReYnmxXnFlbnJOil5easkmRmACSylkl9nBOO/r
  W71DjJIcTEqivDzuP2KF+JLyUyozEosz4otKc1KLDzHKcHAoSfA2LwTKCRalpqdWpGXmAJMpT
  FqCg0dJhJdlCVCat7ggMbc4Mx0idYpRl2PCy7mLmIVY8vLzUqXEectBigRAijJK8+BGwBL7JU
  ZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvOYgU3gy80rgNr0COoIJ6Agjv28gR5QkIqSkGpi
  kXl9XETzBp+wapOPZ7BS0lyuRu9zvVdApu0fxotHxDP+qBCL5PpzZWPSsjNdWzzV4ufYq1vTV
  Ajlb+VdsveQlMyczTr1R7+CWHb8+GDlJr8wOXC/Y11J43lvrzd+Tuw9de7yzfzOvhXf9MsP7c
  wrS+NlO977/G9kjbXEuaGudVHnnuvyLGvYeZ6c5qfzOKuaSeCPu0+4Xr36Y7bvmPoucw098gz
  s+5ordzDhqrZw/V7h405P069p/DKN2vPE4VvE57rX37e2rmfoF55k+M3n9x1n6Ud3t+w7vzv2
  7v/y16BHNn2qpd3WYCqevs40snD1h7pXnUzPOy5pFnEg+cTYwTtik/0qSj/NU25DLqUosxRmJ
  hlrMRcWJAC5o6wxnBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-13.tower-249.messagelabs.com!1576576538!724236!1
X-Originating-IP: [104.47.4.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10360 invoked from network); 17 Dec 2019 09:55:39 -0000
Received: from mail-am5eur02lp2053.outbound.protection.outlook.com (HELO EUR02-AM5-obe.outbound.protection.outlook.com) (104.47.4.53)
  by server-13.tower-249.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Dec 2019 09:55:39 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEgj8BG9NstJvp7c9llEsuX9WEcoAv/yHBF607fXgEe7zLp4TqlUkdAu4HKwATU9WRWpVomTN1o3fExMxMVNLKwYXA0uTEY/TStVpwMjnNU1n8pEZLoThOziFLyJIHA0Fd1vYmtK4mm2RIXYN4LAcoA5haJBrwAxuY0COPK4IkVB0lF0Y5FJUMJNQhQxZdCbznoDpFi5meU1//QvP36av0o6S0jY7oSzLD8d30/dwofYAA+S/aib2BrGljQOG/F64V5QcEv9EcXtZG3hozdeGWpvl7YwywcIZC4pxOn0Pusk9TXRaMBBQh06zLSiAnmdwRrmM1uNkIrrRPKdIoWLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixHk+NYZYSq3rSpdRFseeILAoCRNtZltpKJEM0fEGAQ=;
 b=b63pBBGe+c9z44VzSg9h2uvyKK9RfG3LUfOxAaSTVIjdnSRKX8THf5ekfC9BL/39y9QkCHEJtd03QkytV1uPH3AttEGYby4bq70j3jSTwKWYdhJJTHdkUkXa9n2lw/pLR+ZzUuTam+RokLxd2lk5vkn+G+jz66nh3NCdS6dCzee0MJ566wR5YehFTmyZsyl6L+OQIqentWn7DM1cPHEsXise5oSkdJS9/XmQXFduk55wyAbh1F4Gh90TsgrSWVmRruHhU9Y6TtFXlmyspD4Hr3/M33NgF6bAMK42qVGbLChnsohVziee2uuGVMENXljX9hWiPmXgSzsnpz9K20pjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixHk+NYZYSq3rSpdRFseeILAoCRNtZltpKJEM0fEGAQ=;
 b=a4aLz8mhGVNQtsz6sdIa9wQOM7mYQih7eCKDldP8nfIhyGtVO/htS2Sv6Q/8H7e3yyR0lsOqxIDDpIH1inCxXremrUjyLBbo5K4BGMfaF83nMlCSvwL5qGDMKMSBA9o3iAXlVoIXvDbgae4eGbhm859PSJnDbGzTKEoKhgFJ12I=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1122.EURPRD10.PROD.OUTLOOK.COM (10.169.148.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.13; Tue, 17 Dec 2019 09:55:38 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868%10]) with mapi id 15.20.2538.019; Tue, 17 Dec
 2019 09:55:38 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [RESEND PATCH v3 3/3] pinctrl: da9062: add driver support
Thread-Topic: [RESEND PATCH v3 3/3] pinctrl: da9062: add driver support
Thread-Index: AQHVsQXfQ9DGkUJA90ed8RfDS4RwT6e2sLrQgAW3YgCAAC5RgIABUS2AgAA2KNA=
Date:   Tue, 17 Dec 2019 09:55:38 +0000
Message-ID: <AM5PR1001MB09945AA014D512511E4DF4A880500@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-4-m.felsch@pengutronix.de>
 <AM5PR1001MB0994E2D72A95E4AC4796F80A80550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191216074734.ctjxx6rqtj6mt2dw@pengutronix.de>
 <CACRpkdbZ67jp64oMS0Q=aDuo18i_fT22grST0qSVjk_9EV=4hw@mail.gmail.com>
 <20191217064009.GB31182@pengutronix.de>
In-Reply-To: <20191217064009.GB31182@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e08b4cf-e48b-4b92-145e-08d782d744fb
x-ms-traffictypediagnostic: AM5PR1001MB1122:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB11225BD0F4BDA0F28510FDB3A7500@AM5PR1001MB1122.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(76116006)(52536014)(8676002)(26005)(66476007)(66946007)(66446008)(9686003)(478600001)(5660300002)(2906002)(64756008)(66556008)(71200400001)(55016002)(81166006)(81156014)(53546011)(86362001)(8936002)(55236004)(4744005)(33656002)(186003)(316002)(54906003)(110136005)(6506007)(4326008)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1122;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AbwX28du+0vtu+zp4Lt3OP8/3UFDOsZLVU16obgthkCi5qGx9F+u+JGSKUMeAN1J2GRFVKd+CoqnQ6mdKZVFLxGlzw4elyYUjkritDXafUZ7mqqiY51hE8XACO/ar0M+rp3seQbjmOTIvfUGA/N2nF/3bdrky7ogf4dr6jiMCQbxAl0ywKgAi+Jtm+UNmBqh9pUUFWZCg5lmFvb2TiDdQi5zOr8hS3lZhOREr5MBTgooxMKYAZw5KQuPYLe51TA1vdJWpT72wIW7jws3TI/LmYu+C+YSQoBM+JmnMXhsDfEs/lkL0d/L7Cz9sGkP0ZXtNAM2Jdc+rx0Shso6QYl2Iu3BLmY2h4bGb1CfKk8llDkutIb5HgAizvm3Hd7xU81kSnWdzSkOr55ApXVN0I9ykRazuYd7oX9hoIYGJs7kxcAbH6UdnAdHhTlU3CiPQH4Y
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e08b4cf-e48b-4b92-145e-08d782d744fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 09:55:38.1949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89eLLnY0NopC/g+7NMvLWJXR89YCoTxG+hBkkgIopiF1AzdsMy25x0c39h054hP1Y9jPY0+NO/FdViWgV6P5L3BcZmYFBil9Y5mrwenaLkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1122
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17 December 2019 06:40, Marco Felsch wrote:

> On 19-12-16 11:33, Linus Walleij wrote:
> > On Mon, Dec 16, 2019 at 8:47 AM Marco Felsch <m.felsch@pengutronix.de>
> wrote:
> >
> > > Nice catch, Linus is it okay to add this as follow up patch? The curr=
ent
> > > patch isn't wrong without the 'PIN_CONFIG_BIAS_DISABLE' case.
> >
> > No strong opinion on that as long as the result is running code.
>=20
> Of course the code is running and was tested. Just didn't covered this
> use case.
>=20
> Adam is this okay with you?

If you want to send a follow up straight after then that's ok although to m=
e
that seems like more effort. :)

Anyway:

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>=20
> Regards,
>   Marco
>=20
> > Yours,
> > Linus Walleij
> >

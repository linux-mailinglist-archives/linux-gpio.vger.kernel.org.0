Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A65C46B4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 06:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfJBEtL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 00:49:11 -0400
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:5440
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725851AbfJBEtL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Oct 2019 00:49:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEdB2iXv9eQRkgnmDKrr8DM2CUQiWWWk8fFbFQu1Ws4G9eVzHzHQaPegEAxviKbKugVZcNMLjWipBxJHT02eErNEMBz+sshTWPGwzMei8ZDfsHuBPZyt1z5HhcJ8PszIktSS5j52jLXmD59HuGAwPUa0bXYNHpJsufRnWUKM/hBsayU6wN9qJdNA7OBKzR/rEg45ZrCRtcK3rXAKd3GfnzvVtm3av26nDAWtFV8moDuwUwFECXmOUdKTQ9s3KPa5MqUboGLHW60eqaE0L2f3dkOeaHNMRTD9VegUE7UivvYJ59zHSpRKY3cfcyY++ZpghZ/MAyHsMx7imKWco812HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9hDdM4738NmP3dLSdP19Xy33BH6WLU4ENP8SMfgomg=;
 b=j206n2ELU+nGeugjs9MPJlCRC/aDrN+BV08tYZ2eZGlKM+TO0lGBxwQCpbBRM0g8o5UzRLj5Onqef0YvHptSbVVxNMnQSrNH3JXWbDY9FMUz9cE43vqhSU8ShmNgqrCYXu6YRvqbr+CLS8qX5yB/mjAnvL9ogSYFdM3x15SrGoqts//WmnCWsG4KDxWLr8pRMIQmYIxX3OxiINKoguYm5qhfo91+pLTHiw4HVtH27Yd4WDjv+6S77AjKavlyfsAo3sPTsP4DIpgF3ndj0r8aqInmOEGp08SngRZKBrZiAkpR3uBGo5hcEXJu3c4sf9EApVfrUBcbK6iHL5dU9/2t1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9hDdM4738NmP3dLSdP19Xy33BH6WLU4ENP8SMfgomg=;
 b=Drt3nx/7A2caadUoHVTYR9ENEmKIDQV8aN/h6KlPkRjlXfgI5PzBxQz2GwHqhw6RDiXU9Wpt34UU7FC9nLOy/zyM7u3v/6QYXBNZB3O3FVYF32zqw/4jUH1wx9p6TeqfqVS5n6omj+DsW/f0KrVnjl2uVi6LVy7O0ouSHBqQvns=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4880.jpnprd01.prod.outlook.com (20.179.186.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 04:49:08 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 04:49:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: sh-pfc: Do not use platform_get_irq() to count
 interrupts
Thread-Topic: [PATCH] pinctrl: sh-pfc: Do not use platform_get_irq() to count
 interrupts
Thread-Index: AQHVeILgaUPul0Haq06mblXJMjnnpKdGw9gw
Date:   Wed, 2 Oct 2019 04:49:07 +0000
Message-ID: <TYAPR01MB4544F103234D1ECBB2893AC9D89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191001180547.734-1-geert+renesas@glider.be>
In-Reply-To: <20191001180547.734-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ae37060-f5f1-4a2a-9d97-08d746f3dc2a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4880:
x-microsoft-antispam-prvs: <TYAPR01MB4880CC48C44D90449A83BDD8D89C0@TYAPR01MB4880.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(199004)(189003)(14454004)(229853002)(81156014)(476003)(86362001)(76176011)(8936002)(7696005)(8676002)(2906002)(186003)(66066001)(486006)(6506007)(14444005)(33656002)(102836004)(6246003)(26005)(256004)(11346002)(99286004)(446003)(6436002)(305945005)(54906003)(52536014)(9686003)(4744005)(5660300002)(74316002)(55016002)(7736002)(6116002)(71190400001)(81166006)(71200400001)(66946007)(66556008)(25786009)(64756008)(66476007)(66446008)(478600001)(4326008)(110136005)(3846002)(316002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4880;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wByeZGS+4yrsyRNIkrAqQ6VqldtgljcKasL8qYIoVwvaNWx/EsfVFQjA5Jj1JTBw4xUjPZ6EvQh97aFL/IsGhcoeDPFmx65E21/2ak1fs7dMV+J/pVJJpMQS6QXMd0HmBf4iWpFbsLdoSLCU7UascNKzqoxSbgErHxKzNY389CRSbt0yOFUbjvdgtT5gZLMFSjgCRw16znp/3+W9hsgpq2cQ9w0hnpB1b9zIyBjWu8E4I4isW7uJLrx1LNAzZjLhZ23qoKMmB1HgqzODMOWPwCNs+CA62VRoI+vU6gzkyE7sKizvNLPB1DkI4BDi/2eXAwyWamV3SB13+3YUdamJKsShNDB4NGnwY0rUnnDba8tx8ZyWRKCQsw226Vd5m0qhd4uzjh71mfay4K68Ij50E2hdgJWodnWiljLEAftzi3M=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae37060-f5f1-4a2a-9d97-08d746f3dc2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 04:49:08.0022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPqdZ6sOhQoYVgaVIDdY6YmqxrExIJ39t1aI0ulVJUea3hktLX4B4EvvtKl5HdZDel49nrXqsfpIyEfDucLFavKnVbVKUPYEGjRZwF9+rebRrTbQl/mmD8xFx9Y5EgMM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4880
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 2, 2019 3:06 AM
>=20
> As platform_get_irq() now prints an error when the interrupt does not
> exist, counting interrupts by looping until failure causes the printing
> of scary messages like:
>=20
>     sh-pfc e6060000.pin-controller: IRQ index 0 not found
>=20
> Fix this by using the platform_irq_count() helper instead.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a fix for v5.4-rc1.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this patch on R-Car H3. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


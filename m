Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFFE20F6F8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 16:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgF3OTE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 10:19:04 -0400
Received: from mail-eopbgr70074.outbound.protection.outlook.com ([40.107.7.74]:44352
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725887AbgF3OTD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jun 2020 10:19:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuvkUoAaNsfVXDb9VvQG/pKcKUJJtK7Ye9mG15Fcl8NvXnp6bli8GPwwOX2ngC8TDaAnlaSRK7p+EZKN92xlBdw3sqfPwgcbCny6pH6NAkVvlEmdJ9NRp7XdhLdVo50AEuvyKKPvLtEQk3dZm3uX7QyEiD3Et4lTEonUoMPtUjRotO4pWOmRLOjpmvPjqNfLbewmNJlwYH2CEtkBPX4sH7w08Fdn/2WFPeQB3Uzklw5S3KKfUS9cKEp/+pvM6ZXhDu/e3Y009V7J/pzQn3rJz5a5+4WXzjxCWbH/cm4jOZIDrklfx+ox5JgzGSNLAPqF4HftWfovJFZVkzYh/ysujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=776MXqOXwwDPwPSvO0UMFOjwGTWrR0vBvYy2r5z5isM=;
 b=Q5Deky8uJIvEgN19GclCL+P6Mnc+L6YNcK+NVGFMwaHJTPypkge3qsKwgP/1geLwamH9aAZJ39SYuHYGI2VemLUKkudivJswshwoIohkS4m1wTd31SaoCrAPc5RDcukk4sCEmwvDEE9iZrO6Z/TSLlFykvd5igM3PRrTJYyb/2DF2sl9WrVoCuqTlZmp3jhJwwhT/LJCumAz8YVgjKgN/2nYY15fOZeTpSU+M8oRvH0AT56QE/SA0sW9ginyGMRiMT+Jo8m/a5JN5jwQsG5aEaOpDcHuZKQad0O6nBEsydu0Jn+WgVvdawcvZssFF20i/zlnCBycL+5qE7KoocpwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=776MXqOXwwDPwPSvO0UMFOjwGTWrR0vBvYy2r5z5isM=;
 b=ko7cUxbG3KZ0fHesp8ergq00mP86mOhbX0viMUG/snjfuXsdNKlma7hvb+hqoM9x1NQv8R7GXGWsfe+J6JP3R/yjRWCP+gwsN8TrsTJq82pptzbmAat7+eX/GIAMtY7A13MUNpCPjSf140T78nwbCqeanFKy5bMeMeHKqIyWtk8=
Received: from VI1PR05MB4110.eurprd05.prod.outlook.com (2603:10a6:803:3f::23)
 by VI1PR0502MB3054.eurprd05.prod.outlook.com (2603:10a6:800:b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 14:18:59 +0000
Received: from VI1PR05MB4110.eurprd05.prod.outlook.com
 ([fe80::c19b:54d7:a861:2a88]) by VI1PR05MB4110.eurprd05.prod.outlook.com
 ([fe80::c19b:54d7:a861:2a88%4]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 14:18:59 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     Lee Jones <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 10/10] gpio: gpio-mlxbf2.c: Provide __releases()
 annotation to stop confusing Sparse
Thread-Topic: [PATCH 10/10] gpio: gpio-mlxbf2.c: Provide __releases()
 annotation to stop confusing Sparse
Thread-Index: AQHWTuMdWP1Ga5jw8EGUM60UUYoLU6jxNPkQ
Date:   Tue, 30 Jun 2020 14:18:59 +0000
Message-ID: <VI1PR05MB41101B1316E8332D86EE7988DA6F0@VI1PR05MB4110.eurprd05.prod.outlook.com>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
 <20200630133345.2232932-11-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-11-lee.jones@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [65.96.160.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cfefb787-15bb-40df-45dd-08d81d00882a
x-ms-traffictypediagnostic: VI1PR0502MB3054:
x-microsoft-antispam-prvs: <VI1PR0502MB3054547AD54B34798B0FA652DA6F0@VI1PR0502MB3054.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n0KN87QZHX9+Q/mP4UKwRdFLWaVq+geppCvoUQAx5Dd9YTFskz1wyJVruZ2TmYaNlVnvmoI9zBiiE44C9yzxwnV1o6jOOhFMD7x0X6IEggKRfgejMPM95KasJYgdjFRwbMDTHIxYArnPIyZtYjNLnPtu7VLu5/MERPg61pscPEnpm6VJ3bYrwmmbdilGjXXyhz1p9NDWROyyAxVzy187IXhOooAKMkO5r2nKK3uA93ud0d9y5/O6WDbMNApWOVNUm/m9D8yE3woAaTv0ZVu4sN5rwLQXFpvez7FVnpnv/OP8y+ISBokRAkr4/qcMXg8FscR9TlYIvTq9KF/DcvwPmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4110.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(26005)(9686003)(54906003)(86362001)(110136005)(316002)(83380400001)(8936002)(7696005)(4326008)(478600001)(33656002)(8676002)(55016002)(71200400001)(76116006)(66946007)(66446008)(66476007)(66556008)(64756008)(5660300002)(186003)(2906002)(52536014)(53546011)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Y7Oua9ZEHixXLgvzKo8ZvZtq/+zpf/s8LlGbz9zoIoqarwWG9Z4jONd8iZIj8tFYClw7oHmgZGPpgidXED6F8ImnwFBKRN+jzOLioNosF4cK26FcHLGYSgvfKMV84a7RTv2y5tPGqn73ANrf7CD7qlFV/9pjpNhAm0mpP6QJ0UuwXrbyYkOQ5JP7vsJWrpiChELkq8qHBq3e4Vp5CC1nlybWau/AJ1idwrnOH88Ep9uB8xEJ2j+3jZnVc+iz0K/7gkLoYCU1NPpYTz0tojOr3KChHd/uVb0erLk24mE+73KGOAogVlPaHyLuTEAA1Ha1DZiJEI7ufoYbJ9qeOdhSdAgfS66n88JjrtpskPyf+Sfsbu6jUQhvI1/HnYJ26djzXsmwbq4cqSGawFE0SqjhNwGInv/fHEmLfJRuXlhvBr6/fmstByfodMvEKWR1LpPWa/8Pyqb3bDnArb0JCEArsASuzpnyi7HWBwndnG6Pgxs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB4110.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfefb787-15bb-40df-45dd-08d81d00882a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 14:18:59.3303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uA1rZk9xohyMn+6I526prt93r87E9xMDde9c1uiSDhLAQ1BG85vQFFo7mqi+f/3FRx/Q9pnqM+i1MVT4vEI2nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3054
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reviewed-by: Asmaa Mnebhi <asmaa@mellanox.com>

Thank you.

-----Original Message-----
From: Lee Jones <lee.jones@linaro.org>=20
Sent: Tuesday, June 30, 2020 9:34 AM
To: linus.walleij@linaro.org; bgolaszewski@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; lin=
ux-gpio@vger.kernel.org; Lee Jones <lee.jones@linaro.org>; Asmaa Mnebhi <As=
maa@mellanox.com>
Subject: [PATCH 10/10] gpio: gpio-mlxbf2.c: Provide __releases() annotation=
 to stop confusing Sparse

Sparse cannot peer into other functions to see when and if locks are acquir=
ed and released, thus it simply warns that a 'context imbalance'
is detected instead.  Let's be kind to Sparse and let it know that this beh=
aviour is intentional.

 drivers/gpio/gpio-mlxbf2.c:125:12: warning: context imbalance in 'mlxbf2_g=
pio_lock_acquire' - different lock contexts for basic block
 drivers/gpio/gpio-mlxbf2.c:151:13: warning: context imbalance in 'mlxbf2_g=
pio_lock_release' - unexpected unlock

Cc: Asmaa Mnebhi <Asmaa@mellanox.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-mlxbf2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c index =
861a8d0a84be0..befa5e1099439 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -149,6 +149,8 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_=
context *gs)
  * Release the YU arm_gpio_lock after changing the direction mode.
  */
 static void mlxbf2_gpio_lock_release(struct mlxbf2_gpio_context *gs)
+	__releases(&gs->gc.bgpio_lock)
+	__releases(yu_arm_gpio_lock_param.lock)
 {
 	writel(YU_ARM_GPIO_LOCK_RELEASE, yu_arm_gpio_lock_param.io);
 	spin_unlock(&gs->gc.bgpio_lock);
--
2.25.1


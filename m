Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A871E1DCEB1
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2020 15:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgEUN44 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 May 2020 09:56:56 -0400
Received: from mail-eopbgr40041.outbound.protection.outlook.com ([40.107.4.41]:16128
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728060AbgEUN44 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 May 2020 09:56:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEuYahobhEv0Pt1xdtHZ/gIOFCDfrNxObyqEU1G00IEuBjR9ykBjFjSlSTS+tFS7xx5wmHqo1/jUPWgXLgvdh/Kdi00Qc/SvZk9riQ+A8ZN4uDkk5LTgFNhqU9t1o2dqb9FSReEs0M42WL7i4LJdkVs5lLWHpLmMZe9yUbxAIWdZtf1vJ0Qxx20EhHJw2jJcdD0YhN2/+c5ucbXvb4SLLonDILWfgHNK6XvCydIP1xB5oIr9cwDfc5LnKjYdnlP7YZC/csQU6aouIHw9/4SoEoKVmltk8FdJpNnLVbtvMtQppHP+F3Q6CrMbO1Vi0HhElzNXZR/CbtBehg285bREpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqZDVX2eLel2ObaPEDH8pXQ+4zE+Ba0K3wUTi0uR6vI=;
 b=hs0Vuse35D4o7XZC7GCj/GRkNQLaCjiUKM6psgFLW/pezZkfBxueoWoCAi2fEffqqMCBX6eFXYXFecccUNjmuVzLycXwaloDM5LikxVYdMVLq8L1FDTQjo9pi2FJlMinoJNBSt99WIoJCHnfTdrXW2iHvGcLcbvlr8h4h4pS+PDdBdhO7uf5H/8rmircHMqtABXxDvuwUifknYudjV9ZiBkfX1Z0dmZtDoFl6fUj0963Ci/SIElxiPx8pl5Cl0D+7GoT823sOyGk7FgCK+ochFXPeGyI2hQy3V30jl1ZJ0j9eCyAHZQAVivisn+MVkvR6s9bzqA3I0XK3KyMODklmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqZDVX2eLel2ObaPEDH8pXQ+4zE+Ba0K3wUTi0uR6vI=;
 b=Bxzd3TPnMsvjPxeokJp+ecxZMzRnk1vEpMp+ayyGJA5Nnb0UsgVNn/Ot36lgAdspGnnRQAtXaR/0xrpkpim+SmrAHbJoDI0exdNNlkPRu9m4RnoXEZB1gtxLC+jpPhcerS6VGzcHxnU1CUnHGwC3KIwuLc/5ZXEhC8jcLLmxduc=
Received: from DB7PR05MB4106.eurprd05.prod.outlook.com (2603:10a6:5:25::20) by
 DB7PR05MB4843.eurprd05.prod.outlook.com (2603:10a6:10:1f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23; Thu, 21 May 2020 13:56:52 +0000
Received: from DB7PR05MB4106.eurprd05.prod.outlook.com
 ([fe80::a8b9:847a:1d29:458e]) by DB7PR05MB4106.eurprd05.prod.outlook.com
 ([fe80::a8b9:847a:1d29:458e%3]) with mapi id 15.20.3000.033; Thu, 21 May 2020
 13:56:52 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     Axel Lin <axel.lin@ingics.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [RFT][PATCH] gpio: mlxbf2: Fix sleeping while holding spinlock
Thread-Topic: [RFT][PATCH] gpio: mlxbf2: Fix sleeping while holding spinlock
Thread-Index: AQHWLxMtxZEp1afQPEuvlfRBfRDewaiykKcw
Date:   Thu, 21 May 2020 13:56:52 +0000
Message-ID: <DB7PR05MB41061D27595CAB43DC96C4B5DAB70@DB7PR05MB4106.eurprd05.prod.outlook.com>
References: <20200521015713.2206065-1-axel.lin@ingics.com>
In-Reply-To: <20200521015713.2206065-1-axel.lin@ingics.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ingics.com; dkim=none (message not signed)
 header.d=none;ingics.com; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [65.96.160.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fa5c7068-6783-434e-8d04-08d7fd8ed0e9
x-ms-traffictypediagnostic: DB7PR05MB4843:
x-microsoft-antispam-prvs: <DB7PR05MB48432428E891AD1FB8F88B65DAB70@DB7PR05MB4843.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T/NHreltGH9s4GxX2bpl2EqnHZ5HzvVBJrMXV++WbLjdAlo7ll2TCuhEXA2ivJusfzGtAXINrcoz1EcXQFBNQ04jUOsTyNanAd/0Ecdqh6i9D1jJ2eLdwlhQt8xBF3YPfWDPsbHvC1qEn9NcSv0Lkta2BauQOkM4bvn1WDLtPgG3X+PxfIA4Pyy05At6VCann8aMhjcDqxFLmwb1nv0eXK/UNmjNfxLoGGQ4A3gc7T/+CwJvf24NgzfnOgegalBH1UwE2MbVsB6kq48d2dl6gL/r2anDT2jo7K8T+ch4Mi4NYCu3ea6QAc9viyddqVTt/2eKNv37t4xcPWwYResElw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR05MB4106.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(76116006)(52536014)(71200400001)(66946007)(8936002)(66446008)(4326008)(316002)(2906002)(110136005)(54906003)(5660300002)(55016002)(478600001)(9686003)(66556008)(186003)(86362001)(33656002)(53546011)(66476007)(64756008)(26005)(7696005)(8676002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3DkC0bFHV7L0flPqq8HaQGX1g31LLSyx7v52p+x6wPeoi4Lb1abweoDSPXDFQXysVzSDE0/8BEctzI7ji5Ssa6PJuWwwMVOyaGVWipmllYG8+fhsMUmidlMhHU+qiCAOnK6wOjUXmkjX8jWjXSCLDMWmOhvDzjry55ard4fIj/kmxddQ3ssBC5lDtwEdwG305yrYHrmH1oPGDdnQRuS8uZYhjMP9LzrRu4F3yPfFR2pAwOuGDBL6+H19BOiWRsqs+Ke2EIhegLYAFXj6Cfd2oODng+evRIksRMIHYaSn6mDZx6bwRvOXfri0tFGMOs3KVeTVCri1EEFtJL7+3rU66AhaZ8gL+E5SeuiqmAXnCMbl0668wmL3eOHR/c+kyjJQlabVpT3mfRVidqttiQ7+gNR8Ej9IdHi8OVagIC2BDSTJgS3Zgq3cpoX5YbTOM/7V1phbwfMHfsuDUZdh8SFfi3QjLTDjD6iPuDj/uoTKie0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5c7068-6783-434e-8d04-08d7fd8ed0e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 13:56:52.7175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xra6LpXkOxOKBjnqanhZDnLgb6r5dSVODuJM+t6nsTxF7y1cXUH0DN/6lSPvAm9BLV2SXcoHj3PYQ+Jyvbxacg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB4843
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Axel,

Tested it with no problem. Thank you!
Acked-by: asmaa@mellanox.com

-----Original Message-----
From: Axel Lin <axel.lin@ingics.com>=20
Sent: Wednesday, May 20, 2020 9:57 PM
To: linux-gpio@vger.kernel.org
Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; Bartosz Golaszewski <bgolaszewski@ba=
ylibre.com>; Linus Walleij <linus.walleij@linaro.org>; Axel Lin <axel.lin@i=
ngics.com>
Subject: [RFT][PATCH] gpio: mlxbf2: Fix sleeping while holding spinlock

mutex_lock() can sleep, don't call mutex_lock() while holding spin_lock.

Fixes: bc0ae0e737f5 ("gpio: add driver for Mellanox BlueField 2 GPIO contro=
ller")
Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Asmaa,
I don't have this h/w to test, please help to review and test this patch.

Thanks,
Axel

 drivers/gpio/gpio-mlxbf2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c index =
fca6a50d9308..94d5efce1721 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -126,8 +126,8 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_=
context *gs)  {
 	u32 arm_gpio_lock_val;
=20
-	spin_lock(&gs->gc.bgpio_lock);
 	mutex_lock(yu_arm_gpio_lock_param.lock);
+	spin_lock(&gs->gc.bgpio_lock);
=20
 	arm_gpio_lock_val =3D readl(yu_arm_gpio_lock_param.io);
=20
@@ -135,8 +135,8 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_=
context *gs)
 	 * When lock active bit[31] is set, ModeX is write enabled
 	 */
 	if (YU_LOCK_ACTIVE_BIT(arm_gpio_lock_val)) {
-		mutex_unlock(yu_arm_gpio_lock_param.lock);
 		spin_unlock(&gs->gc.bgpio_lock);
+		mutex_unlock(yu_arm_gpio_lock_param.lock);
 		return -EINVAL;
 	}
=20
@@ -151,8 +151,8 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_=
context *gs)  static void mlxbf2_gpio_lock_release(struct mlxbf2_gpio_conte=
xt *gs)  {
 	writel(YU_ARM_GPIO_LOCK_RELEASE, yu_arm_gpio_lock_param.io);
-	mutex_unlock(yu_arm_gpio_lock_param.lock);
 	spin_unlock(&gs->gc.bgpio_lock);
+	mutex_unlock(yu_arm_gpio_lock_param.lock);
 }
=20
 /*
--
2.25.1


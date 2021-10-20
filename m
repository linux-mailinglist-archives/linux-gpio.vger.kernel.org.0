Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A94434823
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Oct 2021 11:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhJTJrS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Oct 2021 05:47:18 -0400
Received: from us-smtp-delivery-115.mimecast.com ([170.10.133.115]:49130 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229555AbhJTJrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Oct 2021 05:47:17 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Oct 2021 05:47:17 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1634723103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MR9KnrWsF0oZDX3JfczAleTWEX1KdIIoGMWnVHCIFDE=;
        b=pdcEdwwFVrWJHbS42EtSDCkF4jn0wwVpqx87qFqwgx/IqUgc8jNLdN484sMemYOJSAELz8
        n21HgZgJckfN+dfz2R+pGZcNFiYEahxq+Let+c/EOB5gLvzv7Spv9FLNjccPWUHI9hLXbg
        dLdNGFxFAp7ilKd34PZXQS5d9BtWPd4=
Received: from mail.maxlinear.com (174-47-1-83.static.ctl.one [174.47.1.83])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-kuhp8M2dMJid1GWExeEh-g-1; Wed, 20 Oct 2021 05:38:20 -0400
X-MC-Unique: kuhp8M2dMJid1GWExeEh-g-1
Received: from sgsxdev005.isng.phoenix.local (10.226.81.173) by
 mail.maxlinear.com (10.23.38.120) with Microsoft SMTP Server id 15.1.2242.4;
 Wed, 20 Oct 2021 02:38:18 -0700
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rahul Tanwar <rtanwar@maxlinear.com>
Subject: [PATCH] pinctrl: equilibrium: Fix function addition in multiple groups
Date:   Wed, 20 Oct 2021 17:38:15 +0800
Message-ID: <20211020093815.20870-1-rtanwar@maxlinear.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ignore the same function with multiple groups.
Fix a typo in error print.

Fixes: 1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a ne=
w SoC")
Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctr=
l-equilibrium.c
index fb713f9c53d0..3f0143087cc7 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -675,6 +675,11 @@ static int eqbr_build_functions(struct eqbr_pinctrl_dr=
v_data *drvdata)
 =09=09return ret;
=20
 =09for (i =3D 0; i < nr_funcs; i++) {
+
+=09=09/* Ignore the same function with multiple groups */
+=09=09if (funcs[i].name =3D=3D NULL)
+=09=09=09continue;
+
 =09=09ret =3D pinmux_generic_add_function(drvdata->pctl_dev,
 =09=09=09=09=09=09  funcs[i].name,
 =09=09=09=09=09=09  funcs[i].groups,
@@ -815,7 +820,7 @@ static int pinctrl_reg(struct eqbr_pinctrl_drv_data *dr=
vdata)
=20
 =09ret =3D eqbr_build_functions(drvdata);
 =09if (ret) {
-=09=09dev_err(dev, "Failed to build groups\n");
+=09=09dev_err(dev, "Failed to build functions\n");
 =09=09return ret;
 =09}
=20
--=20
2.17.1


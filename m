Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D805926061C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 23:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgIGVRU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 17:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbgIGVRS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 17:17:18 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D24CC061573
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 14:17:18 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D519A80719;
        Tue,  8 Sep 2020 09:17:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599513436;
        bh=D9GZ4cV4nh0pJDFklxkAYr3QI/M14+UKa9R2qHUWRhk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=F67ggSxmlxZWNL2BxMi6WlASU7C5BYDQTfsTtlakgawasXpXRaazM58XxmUyj177j
         2o6Koa4fJ/NTBcSI2/0OHxnjbgIewKGGLIIEj/Q6cHsZO8z52uiwFnCmWxcGBJGJl7
         fm1usiTDl04Mlp9CINxq0dov9kvC55fLnACW6TIi+AJ+IPdJ/6Jnenm+hh8Y74vfxo
         WHiza/AzhmRUh7RfWXyLIeeEZkQTHkd8+HAx9iuHeAZNwyRcoZQtRH/njPOtCB3BzX
         agh4Gt1gdMC6feXk6GPb/Hzc4QNbxYbDlayoYvwczSIXyJSzVjgAZGGKFyWrZnDtY7
         GAhkf4zxh0l2g==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f56a35c0002>; Tue, 08 Sep 2020 09:17:16 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 8F7EE13EF9B;
        Tue,  8 Sep 2020 09:17:15 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 40A94280062; Tue,  8 Sep 2020 09:17:16 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/3] ARM: dts: Remove non-existent i2c1 from 98dx3236
Date:   Tue,  8 Sep 2020 09:17:11 +1200
Message-Id: <20200907211712.9697-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907211712.9697-1-chris.packham@alliedtelesis.co.nz>
References: <20200907211712.9697-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The switches with integrated CPUs have only got a single i2c controller.
They incorrectly gained one when they were split from the Armada-XP.

Fixes: 43e28ba87708 ("ARM: dts: Use armada-370-xp as a base for armada-xp=
-98dx3236")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v2:
- Fix grammo in commit message
- Add reviewed-by from Andrew

 arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dt=
s/armada-xp-98dx3236.dtsi
index 654648b05c7c..aeccedd12574 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -266,11 +266,6 @@ &i2c0 {
 	reg =3D <0x11000 0x100>;
 };
=20
-&i2c1 {
-	compatible =3D "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
-	reg =3D <0x11100 0x100>;
-};
-
 &mpic {
 	reg =3D <0x20a00 0x2d0>, <0x21070 0x58>;
 };
--=20
2.28.0


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0B925F1B5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 04:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgIGCl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 22:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgIGCl4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 22:41:56 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B852C061573
        for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2020 19:41:56 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4CCC0891B1;
        Mon,  7 Sep 2020 14:41:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599446512;
        bh=uuxzc0BwwMjDmwpBE5VjOWOBbCDoQWkHnGgl+K/56L0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=y2Q4/BO0SIeGnG31GyiM6ilqx/5bAybVsjxelBCfyYgC2hrKNCGuai5me92ztSdF3
         PfQo7YSQpm8PJYSQo1gOJgzE+NDN64OhXPsv39WC8Q5JsXYq4gwSV8r6Fcs6yrrB1F
         ES/9gXzqFkApTiXobGKtK8DvxgEzEYB+3wQyqC1LBGvTR2WM/MUcxU38mR6B/uL7WC
         nV1ylX/c0khvxHFbbL+zOUug71UYWxJnmKIVW1KaIUtSF5AiuuW0CdFg1KOHt9V4vM
         YP/HUZt0XdHajRxIT9wfl0snqV10emz9h3rznawSj/E7WrTUnCJ0WZYbk05CDSU8yn
         9zhmTqRxxvbog==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f559df00000>; Mon, 07 Sep 2020 14:41:52 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id C786413EEB7;
        Mon,  7 Sep 2020 14:41:51 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 15F94280060; Mon,  7 Sep 2020 14:41:52 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/3] ARM: dts: Remove non-existent i2c1 from 98dx3236
Date:   Mon,  7 Sep 2020 14:41:48 +1200
Message-Id: <20200907024149.20001-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
References: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The switches with integrated CPUs have only got a single i2c controller.
The incorrectly gained one when they were split from the Armada-XP.

Fixes: 43e28ba87708 ("ARM: dts: Use armada-370-xp as a base for armada-xp=
-98dx3236")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
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


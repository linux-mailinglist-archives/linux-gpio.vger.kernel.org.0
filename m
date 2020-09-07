Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EF725F1BA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 04:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgIGCmD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 22:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIGCl6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 22:41:58 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A8DC0613ED
        for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2020 19:41:56 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 55D97891B2;
        Mon,  7 Sep 2020 14:41:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599446512;
        bh=i7QhCQy5Vo70pgJu5PEh9wAOSGu//sPREvdLP/pz8+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ETqVzF+Dp9RVTISD5UedDnNjrTor0DXspYLGoiqD6q1/aUyjj1IWmpy5kAAqJrQi5
         rw3nuoN87iXPUbMmWUOA0m66PuR//1tr7HXH2uF+YFFjSuRQPermEW84mX5JZp6VYq
         +Ydp5NF7gEMzbpURVbZ9jg+7gF47Jc6aE5ec3kArpoT92lUfifNnFuP//hOmpAPxuX
         EQANtCe5lJTVcwMUqXa975Tsbr2o1GzhN0ZQ8GyaGv3DAE1E+pQdoET1gZr1KEUZTc
         09LKKgxlyl07V0aZv69cKxT7WvevMgE+rCXG39AttVhUydLR96dM5MAW74kzgHJDxO
         qaxSA7UMWFAww==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f559df00001>; Mon, 07 Sep 2020 14:41:52 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id E99AA13EEB7;
        Mon,  7 Sep 2020 14:41:51 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 37E34280060; Mon,  7 Sep 2020 14:41:52 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 3/3] ARM: dts: Add i2c0 pinctrl information for 98dx3236
Date:   Mon,  7 Sep 2020 14:41:49 +1200
Message-Id: <20200907024149.20001-4-chris.packham@alliedtelesis.co.nz>
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

Add pinctrl information for the 98dx3236 (and variants). There is only
one choice for i2c0 MPP14 and MPP15.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dt=
s/armada-xp-98dx3236.dtsi
index aeccedd12574..38a052a0312d 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -264,6 +264,8 @@ refclk: oscillator {
 &i2c0 {
 	compatible =3D "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
 	reg =3D <0x11000 0x100>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2c0_pins>;
 };
=20
 &mpic {
@@ -319,6 +321,11 @@ spi0_pins: spi0-pins {
 			       "mpp2", "mpp3";
 		marvell,function =3D "spi0";
 	};
+
+	i2c0_pins: i2c-pins-0 {
+		marvell,pins =3D "mpp14", "mpp15";
+		marvell,function =3D "i2c0";
+	};
 };
=20
 &spi0 {
--=20
2.28.0


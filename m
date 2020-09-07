Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9498260621
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 23:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgIGVRV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 17:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgIGVRT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 17:17:19 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91AFC061786
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 14:17:18 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0873D891B0;
        Tue,  8 Sep 2020 09:17:17 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599513437;
        bh=K/cfY90fKBjxV6JsodSTIPCA3dWQGBnKiRKvxzHj0eI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FhETd42PSnlbDxe/xgD6FTWJZHvYjFjUiARUMA2sQzD8nBy15F3q5fhnhYvmJSoV7
         jyd24rKmkg32XwmreeXZAPOkvwIJ07v1OUNgp//ch5FAQO797lpx8xpfDr+dCe1xiS
         EY9Q23l3SU2ft+zraPX5FMVAQJt3yej0An0ze1JGzEa1QHNjSSPzOka6kgc6aI2M9M
         Fk0dR98chlPvDCPQP7utTgBFC189YD9PERaU8G8Qj4yt9oH5j3eP6CA/Aw3Ej1Qysy
         v4SIs8rRd2rO0fo9oFQrf5xMeXdLqZFcJbM4K5sdaPNYOPVXEuiwmKCNFGGvkC56rN
         WfqpxYNE9pwHw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f56a35c0003>; Tue, 08 Sep 2020 09:17:17 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id AE30913EFA5;
        Tue,  8 Sep 2020 09:17:15 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 60C8A280060; Tue,  8 Sep 2020 09:17:16 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 3/3] ARM: dts: Add i2c0 pinctrl information for 98dx3236
Date:   Tue,  8 Sep 2020 09:17:12 +1200
Message-Id: <20200907211712.9697-4-chris.packham@alliedtelesis.co.nz>
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

Add pinctrl information for the 98dx3236 (and variants). There is only
one choice for i2c0 MPP14 and MPP15.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v2:
- Add reviewed-by from Andrew

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


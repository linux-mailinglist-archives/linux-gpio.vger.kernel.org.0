Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F360047F26
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 12:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbfFQKE5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 06:04:57 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:50912 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbfFQKEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 06:04:47 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6B20F886BF;
        Mon, 17 Jun 2019 22:04:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1560765884;
        bh=IAPqVHabBMb5/DtR9xVgn2/+tGPF2BDb7ymrW7GJ1PQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Zf0eI6XhHXF01SdWGzbiWeu0Vt50mp42wIpdnxIs7FNytv92yKaDbPPlm58vEIo9R
         978L79QKmAvi/B5aHbsRz7/1d07KpFQLl94rLL+9gQqwDzL8+WCrENOTcXiiWjGtFJ
         9nd4sIt+LCBucySrQPv2/QVwdYAeRk+WB+NjjRJ/4+xc0TcUGsWdWUmt256sLWSFoG
         42MW5ePxfn2YKgN0YdTrAOiXGCnGvBE5g+uVmA0snOuUfwCwyqUg5jqE3PciGNJk3j
         Cs5clFns0DEUX9+QUUidvT76m2Fkd0hnHPzpD096qoKvHt+x3CfMueW0kOi9OXruCN
         yu11Hn3qwbtYg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d0765bc0001>; Mon, 17 Jun 2019 22:04:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 6014313EED3;
        Mon, 17 Jun 2019 22:04:45 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 372341E04F0; Mon, 17 Jun 2019 22:04:44 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/4] dt-bindings: pinctrl: mvebu: Document bindings for 98DX1135
Date:   Mon, 17 Jun 2019 22:04:29 +1200
Message-Id: <20190617100432.13037-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
References: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 98DX1135 is similar to the 98DX4122 except the MPP options differ.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../pinctrl/marvell,kirkwood-pinctrl.txt      | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-p=
inctrl.txt
index 6c0ea155b708..2932f171ee85 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.=
txt
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.=
txt
@@ -6,8 +6,8 @@ part and usage.
 Required properties:
 - compatible: "marvell,88f6180-pinctrl",
               "marvell,88f6190-pinctrl", "marvell,88f6192-pinctrl",
-              "marvell,88f6281-pinctrl", "marvell,88f6282-pinctrl"
-              "marvell,98dx4122-pinctrl"
+              "marvell,88f6281-pinctrl", "marvell,88f6282-pinctrl",
+              "marvell,98dx4122-pinctrl", "marvell,98dx1135-pinctrl"
 - reg: register specifier of MPP registers
=20
 This driver supports all kirkwood variants, i.e. 88f6180, 88f619x, and 8=
8f628x.
@@ -317,3 +317,43 @@ mpp44         44       gpio
 mpp45         45       gpio
 mpp49         49       gpio
=20
+* Marvell Poncat2 98dx1135
+
+name          pins     functions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+mpp0          0        gpio, nand(io2), spi(cs)
+mpp1          1        gpo, nand(io3), spi(mosi)
+mpp2          2        gpo, nand(io4), spi(sck)
+mpp3          3        gpo, nand(io5), spi(miso)
+mpp4          4        gpio, nand(io6), uart0(rxd)
+mpp5          5        gpo, nand(io7), uart0(txd)
+mpp6          6        sysrst(out)
+mpp7          7        gpo, spi(cs)
+mpp8          8        gpio, twsi0(sda), uart1(rts)
+mpp9          9        gpio, twsi(sck), uart1(cts)
+mpp10         10       gpo, uart0(txd)
+mpp11         11       gpio, uart0(rxd)
+mpp13         13       gpio, uart1(txd)
+mpp14         14       gpio, uart1(rxd)
+mpp15         15       gpio, uart0(rts)
+mpp16         16       gpio, uart0(cts)
+mpp17         17       gpio, nand(cle)
+mpp18         18       gpo, nand(io0)
+mpp19         19       gpo, nand(io1)
+mpp20         20       gpio
+mpp21         21       gpio
+mpp22         22       gpio
+mpp23         23       gpio
+mpp24         24       gpio
+mpp25         25       gpio
+mpp26         26       gpio
+mpp27         27       gpio
+mpp28         28       gpio, nand(ren)
+mpp29         29       gpio, nand(wen)
+mpp30         30       gpio
+mpp31         31       gpio
+mpp32         32       gpio
+mpp33         33       gpio
+mpp34         34       gpio, nand(ale)
+mpp35         35       gpio, nand(cen)
--=20
2.21.0


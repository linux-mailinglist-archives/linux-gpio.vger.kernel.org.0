Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCD3494A4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 23:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbfFQVz0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 17:55:26 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51487 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfFQVzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 17:55:06 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2856B891AC;
        Tue, 18 Jun 2019 09:55:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1560808502;
        bh=qowtavXJViXnn3/KlNuAQC4YwCzj8dq8UfZnKycmpqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=onoS9TVDiyUQDCgYYXqciyfaz9kMUMiNgO4mEADKLJ9u4RAb6bLwCk15T6bX/HRy6
         PDNto7c2cek1L/bwxwDOq5vb7o7/BbG59HhXsYboBUaxPuxAMR03q6+KiTq7cguJmZ
         dPK3RHy58qqhkH8q4ivobrV3piVVu6IyY8He3R47cFIroLosG36M0JathfIDcmM2Ns
         wzI+4/4m+TT6+oRrzT76hg9li3UqNikCxb32RdlUxGpoEKHm/6iDY4VEGlMlcfog43
         HS0ZxqAvywb1tertHG0X7xHd8g8XW6G/WoSEvxAbOV10m9PPTmnoK1o4BLTypqE27a
         rLBeFaPofcneg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d080c340007>; Tue, 18 Jun 2019 09:55:00 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 4B39E13EEAD;
        Tue, 18 Jun 2019 09:55:01 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 252521E04F0; Tue, 18 Jun 2019 09:55:00 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: mvebu: Document bindings for 98DX1135
Date:   Tue, 18 Jun 2019 09:54:55 +1200
Message-Id: <20190617215458.32688-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 98DX1135 is similar to the 98DX4122 except the MPP options differ.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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


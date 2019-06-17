Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29947F1C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 12:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfFQKEr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 06:04:47 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:50943 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbfFQKEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 06:04:47 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DFEF2891AB;
        Mon, 17 Jun 2019 22:04:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1560765884;
        bh=wqBkEYXWtPPxu4J3I2mSTeb2gWRTtAdwWYpWsZ0Pz5w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=kTFmqq8TYh5IsmqlGGqsjJuGggnRyLewB5suQn6SKcuuvkb9BgrP1R1bW9XVU3c9k
         dx9OkXrMFR+Fcx+TmhFIPZSPifHMNkfG9hA9L4utzAxbt3hgcFxNfYqfNpjazhXYA+
         sjp7FWA8dFtEkEjoswYzDjfWxEZcizWKZuIu/h60iTgjr8l/D5OTTqxSW1wB88UW1B
         +wUx29ZtQQ1Y55KtKe5Z5uUqRvCyazqwxo1ICvYPrqsx54v1LPiuJfGeAbnQE2gW0H
         e96D2nk1j+y/rsKo66nYN2jU6JIbosHbCr1VUUa1NvfLKd+lwalsw2PAKQ4VZIo/KW
         qZzz5hWVpYtHA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d0765bc0004>; Mon, 17 Jun 2019 22:04:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id BAF9913EED3;
        Mon, 17 Jun 2019 22:04:45 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 921251E04F0; Mon, 17 Jun 2019 22:04:44 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 4/4] clk: kirkwood: Add support for MV98DX1135
Date:   Mon, 17 Jun 2019 22:04:32 +1200
Message-Id: <20190617100432.13037-5-chris.packham@alliedtelesis.co.nz>
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

The 98DX1135 is a switch chip with an integrated CPU. This is similar to
the 98DX4122 except that the core clock speed is fixed to 166Mhz.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/clk/mvebu/kirkwood.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
index 35af3aa18f1c..47680237d0be 100644
--- a/drivers/clk/mvebu/kirkwood.c
+++ b/drivers/clk/mvebu/kirkwood.c
@@ -185,6 +185,11 @@ static void __init mv88f6180_get_clk_ratio(
 	}
 }
=20
+static u32 __init mv98dx1135_get_tclk_freq(void __iomem *sar)
+{
+	return 166666667;
+}
+
 static const struct coreclk_soc_desc kirkwood_coreclks =3D {
 	.get_tclk_freq =3D kirkwood_get_tclk_freq,
 	.get_cpu_freq =3D kirkwood_get_cpu_freq,
@@ -201,6 +206,14 @@ static const struct coreclk_soc_desc mv88f6180_corec=
lks =3D {
 	.num_ratios =3D ARRAY_SIZE(kirkwood_coreclk_ratios),
 };
=20
+static const struct coreclk_soc_desc mv98dx1135_coreclks =3D {
+	.get_tclk_freq =3D mv98dx1135_get_tclk_freq,
+	.get_cpu_freq =3D kirkwood_get_cpu_freq,
+	.get_clk_ratio =3D kirkwood_get_clk_ratio,
+	.ratios =3D kirkwood_coreclk_ratios,
+	.num_ratios =3D ARRAY_SIZE(kirkwood_coreclk_ratios),
+};
+
 /*
  * Clock Gating Control
  */
@@ -325,6 +338,8 @@ static void __init kirkwood_clk_init(struct device_no=
de *np)
=20
 	if (of_device_is_compatible(np, "marvell,mv88f6180-core-clock"))
 		mvebu_coreclk_setup(np, &mv88f6180_coreclks);
+	else if (of_device_is_compatible(np, "marvell,mv98dx1135-core-clock"))
+		mvebu_coreclk_setup(np, &mv98dx1135_coreclks);
 	else
 		mvebu_coreclk_setup(np, &kirkwood_coreclks);
=20
@@ -339,3 +354,5 @@ CLK_OF_DECLARE(kirkwood_clk, "marvell,kirkwood-core-c=
lock",
 	       kirkwood_clk_init);
 CLK_OF_DECLARE(mv88f6180_clk, "marvell,mv88f6180-core-clock",
 	       kirkwood_clk_init);
+CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
+	       kirkwood_clk_init);
--=20
2.21.0


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B821E47F2B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 12:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfFQKEq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 06:04:46 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:50922 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfFQKEq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 06:04:46 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A630E891A9;
        Mon, 17 Jun 2019 22:04:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1560765884;
        bh=4b/x7I8aVyzsurIMFQ0LkU0sx+0wbtevSohKT1oCTNk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Q4w3DyMpFyN4fgkK6aAGhdxc8LIEI9NzWSVZI0qj/zExIpxvRDhUeeSwwgdnwU3LZ
         b91LOHT/IVlF6UWsXgLCVEvDFU6YJYeyHP4sTmnwcdhPimcpYX936ylvaR5LRrKt9X
         eJn4g6i5nSR+skXJduqHefC0SKZW1MjGqBalm1kxHEQ0o6PLlqFNlK6In41/oeJBCt
         hY2Q08zRPoAHzOFXF2HLsllJb2/0arZYIeD2XZRuzJGZFJ1/pFFicMhbg4JyRyVfl1
         ZoihyL0muyI1CrWzuB63FZ415wp/UlJ8RH9gqPFgL+znzBhw9eEX47hwcElk30CNMB
         bfZhVyRT0PGJw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d0765bc0002>; Mon, 17 Jun 2019 22:04:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 7C70313EED3;
        Mon, 17 Jun 2019 22:04:45 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 536631E04F0; Mon, 17 Jun 2019 22:04:44 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/4] dt-bindings: clock: mvebu: Add compatible string for 98dx1135 core clock
Date:   Mon, 17 Jun 2019 22:04:30 +1200
Message-Id: <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
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

Add compatible string for the core clock on the 98dx1135 switch with
integrated CPU.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/clock/mvebu-core-clock.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt=
 b/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
index 796c260c183d..76f0952cfc64 100644
--- a/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
+++ b/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
@@ -59,6 +59,7 @@ Required properties:
 	"marvell,dove-core-clock" - for Dove SoC core clocks
 	"marvell,kirkwood-core-clock" - for Kirkwood SoC (except mv88f6180)
 	"marvell,mv88f6180-core-clock" - for Kirkwood MV88f6180 SoC
+	"marvell,mv98dx1135-core-clock" - for 98dx1135 SoC core clocks
 	"marvell,mv88f5181-core-clock" - for Orion MV88F5181 SoC
 	"marvell,mv88f5182-core-clock" - for Orion MV88F5182 SoC
 	"marvell,mv88f5281-core-clock" - for Orion MV88F5281 SoC
--=20
2.21.0


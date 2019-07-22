Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA4770670
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 19:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbfGVRIl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 13:08:41 -0400
Received: from mout.gmx.net ([212.227.17.21]:41237 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729199AbfGVRIl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 13:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563815285;
        bh=zsRxR3IHUAe+a4FnhRTcZN5Fxop1p9dlP5W0ADx11B8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=HkA2EOPGkQW7Kxs2i52RN4Xrt3jo8I8b3MAZCO9Br/unOvNEymwZiXVOUzPRTXP/w
         7dYb06Ne1AQPdVEKBNlzEcUeHEf52e4/cBjyEPRC3ICeTUVRMD5jUKVj8zUl4vug7b
         uFvwsvFvMAeuMvtPJ4Wphvbj05cMKHJEImTBar/w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.131]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LbdiB-1iIIpi2r7r-00lFaU; Mon, 22 Jul 2019 19:08:05 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 17/18] arm64: dts: broadcom: Add reference to RPi 4 B
Date:   Mon, 22 Jul 2019 19:07:36 +0200
Message-Id: <1563815257-2648-5-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
References: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:7MG2Ce6sSm6kLNUB5FUMw5yNU+n92zlKvjeqC9ekbtO5t9JKqQa
 ZnQrUfY9IDM0QbTqL1ZhUy9jHxesahAs51UcqjJt7XaYepppz2y+P15z91/iBYOP2zZ7kFl
 4qxLgy289cnHXi5nIbkheWfMZ1mP4Bu2tAASIrXuIUU74NX01UJqoG37WfaTP5n2qC293Gv
 ztA81Op6gAkImpFGYqLFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nBKYU/5lt2k=:vZhkVKq/GToArQD57WlEMM
 7OvrhxwLyRdEw4FYj/Vf0sNUDFt0gC9QKl0z85IHiSFK1pk7/CIr2JnhLgm2Z02NpfAdL1Tad
 j41c2/4AnDm/mlAblGH21t6IDq1LCW1hBcks4oZF4FmjNRqgCJ5rzQ39w1gP9BLuxHFujLiPx
 mwig25txf18JLcBArW7kijrYsGBJYtE0NDEazVF+RDX6GFy78UstBBNauFmJzpaFVYevFTR6E
 BjD5yC890IX7OrhPtDWxNpmLDhGpA7GDSVSLAHo1CG6V9000AXpipE6hnM6rVCbZ323+t+uxA
 QJdspflmLxAWIWia4wasFHKJICCKrYgMyHd+LSjoVE8RbV7yKMPuCMiQ20TlwVG1eBqQlkjwN
 Wh3IBAYROHXT3dJ86A5mQVwcMgBHUl3W5Ecm57+iZBJz9OYeVf4IzFs4bj71xvMjv00NO0ojN
 ot7V4x3/1peFoeByxmqB9oyYRf3ufoxlCKQQkMUnO73H9GkWw72W60Dnd0YYKZbxoB4auG7G1
 DexzoAoEFKs/d/C4JcZikicVbPLhpm+5xZNviemD/1XKO6m3htFu3zMXaeF+ATZJiOQ9CYYXY
 UlG7NT2kw9o04mAo3Bfnzfi/wMzxn0p2WiJn8n5QMoPTgOjJnGTyXsqPnXmHbqpuoo22M+Q/K
 ddsgX1ExjAM0b0TF0vuBi6MMtn8BIOq5AGVFtBE+1QG0WnyPAHZ8BIh6erJCdqbW/7QVTlyml
 PlMTvNcWZOCJZJKQeZAM8YrlCd6M9SIsw9RUa64miSopZqfLZK8iYRQPuaZ+2PCu8lVhawyd1
 uz1gnXWhCIHTiPs+CyKKbHlm5cGK5PqN/axI9gOWR+G/CcgejrtEeDG1sEqzgvVqFi3sygdjN
 6jWI3PKoUqDO1d1yA8RzMXub/QmXZWsUlLggtcThCgF81dhPq6vUYdukxovFhivf+azss4131
 ymDmh80uQJLEj5aVMf7JwUX532HiYIOvSJrP3/yf5ChafZA8JAFlu6dPGL1oZlXxwOF2PvW8x
 EbH11NFXqPGF4fJF4Vpye2LlApbMgsC61dxCFpzeP2AMuBpDggHgQvvTw72uD+/g62hj1eJAo
 /C8zFD0nnLs/8M=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a reference to the dts of the Raspberry Pi 4 B,
so we don't need to maintain the content in arm64.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm64/boot/dts/broadcom/Makefile            | 3 ++-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/b=
roadcom/Makefile
index d1d31cc..cb7de8d 100644
=2D-- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_BCM2835) +=3D bcm2837-rpi-3-a-plus.dtb \
+dtb-$(CONFIG_ARCH_BCM2835) +=3D bcm2711-rpi-4-b.dtb \
+			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb
diff --git a/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm64=
/boot/dts/broadcom/bcm2711-rpi-4-b.dts
new file mode 100644
index 0000000..d24c536
=2D-- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "arm/bcm2711-rpi-4-b.dts"
=2D-
2.7.4


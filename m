Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC76B2EF099
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 11:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbhAHKVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 05:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727416AbhAHKVx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 05:21:53 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0769C0612FF
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 02:20:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id EALU2400K4C55Sk06ALU7V; Fri, 08 Jan 2021 11:20:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxosd-001zdj-TC; Fri, 08 Jan 2021 11:20:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxosd-008Ufg-CK; Fri, 08 Jan 2021 11:20:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/3] gpio: rcar: Add R-Car V3U support
Date:   Fri,  8 Jan 2021 11:20:23 +0100
Message-Id: <20210108102026.2024478-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus, Bartosz, Rob,

This patch series adds support for GPIOs on the R-Car V3U (r8a779a0)
SoC, to both DT bindings and the gpio-rcar driver.

Changes compared to v2:
  - Add Reviewed-by, Tested-by,
  - Fix SoC part number in oneline summary,
  - Reformat comment block to match coding style,
  - Rebase on top of commit 3a57026a83ba363e ("gpio: rcar: Remove
    redundant compatible values"),

Changes compared to v1:
  - Optimize GPIO pin state read on R-Car Gen3,
  - Enable input unconditionally in probe and resume, instead of during
    GPIO line configuration and depending on GPIO line direction,
  - Assumed authorship, as this patch is very different from v1, written
    by Phong Hoang,
  - Add Reviewed-by.

Thanks!

Geert Uytterhoeven (3):
  dt-bindings: gpio: rcar: Add r8a779a0 support
  gpio: rcar: Optimize GPIO pin state read on R-Car Gen3
  gpio: rcar: Add R-Car V3U (R8A779A0) support

 .../bindings/gpio/renesas,rcar-gpio.yaml      |  3 +
 drivers/gpio/gpio-rcar.c                      | 60 +++++++++++++++++--
 2 files changed, 58 insertions(+), 5 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

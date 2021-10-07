Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65D1425599
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242124AbhJGOk4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 10:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242112AbhJGOkw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 10:40:52 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D0FC061765
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 07:38:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cc6:af5d:7a02:2753])
        by michel.telenet-ops.be with bizsmtp
        id 32et2600L1WYgkx062eucL; Thu, 07 Oct 2021 16:38:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-002n71-ML; Thu, 07 Oct 2021 16:38:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-006mJ0-5Z; Thu, 07 Oct 2021 16:38:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] pinctrl: renesas: Fixes and checker improvements
Date:   Thu,  7 Oct 2021 16:38:45 +0200
Message-Id: <cover.1633615652.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This is a small set of fixes and improvements for the Renesas pin
control drivers.  Most of them are related to the built-in checker,
which is only enabled in DEBUG builds.

I have a few more checks pending, but they need more polishing to make
them suitable for upstream.  Note that there are no pending issues in
the actual driver that can be detected by these checker improvements, as
all fixes for such issues are already upstream.

To be queued in renesas-pinctrl for v5.16.

Thanks for your comments!

Geert Uytterhoeven (5):
  pinctrl: renesas: Fix save/restore on SoCs with pull-down only pins
  pinctrl: renesas: checker: Fix off-by-one bug in drive register check
  pinctrl: renesas: checker: Move overlapping field check
  pinctrl: renesas: checker: Fix bias checks on SoCs with pull-down only
    pins
  pinctrl: renesas: checker: Prefix common checker output

 drivers/pinctrl/renesas/core.c | 73 +++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 28 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

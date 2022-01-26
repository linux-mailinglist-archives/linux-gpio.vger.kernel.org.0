Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5454A49C9AF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jan 2022 13:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241303AbiAZM3g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jan 2022 07:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241312AbiAZM3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jan 2022 07:29:35 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5677EC06174E
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jan 2022 04:29:35 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c4c8:1afa:4649:d034])
        by andre.telenet-ops.be with bizsmtp
        id nQVZ260072MCa5R01QVZ62; Wed, 26 Jan 2022 13:29:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nChQb-00BUGl-0B; Wed, 26 Jan 2022 13:29:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nChQa-004bWc-KX; Wed, 26 Jan 2022 13:29:32 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pinctrl: renesas: r8a7779: Restore pin group and function sort order
Date:   Wed, 26 Jan 2022 13:29:28 +0100
Message-Id: <cover.1643199959.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

This patch series reorders some pin group and pin function declarations
in various Renesas pin control drivers, to restore sort order.

I intend to queue these in renesas-pinctrl-for-v5.18.

Thanks for your comments!

Geert Uytterhoeven (3):
  pinctrl: renesas: r8a7779: Restore pin function sort order
  pinctrl: renesas: r8a7790: Restore pin function sort order
  pinctrl: renesas: r8a77995: Restore pin group sort order

 drivers/pinctrl/renesas/pfc-r8a7779.c  |  8 +--
 drivers/pinctrl/renesas/pfc-r8a7790.c  |  2 +-
 drivers/pinctrl/renesas/pfc-r8a77995.c | 86 +++++++++++++-------------
 3 files changed, 48 insertions(+), 48 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

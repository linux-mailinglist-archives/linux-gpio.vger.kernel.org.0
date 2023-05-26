Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9A7712411
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 11:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbjEZJxf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 05:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236671AbjEZJxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 05:53:34 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B524A9
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 02:53:33 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ae30:9d2b:3228:d21])
        by albert.telenet-ops.be with bizsmtp
        id 1MtX2A0074eYoVn06MtXow; Fri, 26 May 2023 11:53:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U8I-0038kP-KS;
        Fri, 26 May 2023 11:53:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U8Z-00EFdN-4o;
        Fri, 26 May 2023 11:53:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.5
Date:   Fri, 26 May 2023 11:53:29 +0200
Message-Id: <cover.1685094670.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.5-tag1

for you to fetch changes up to 5d32cead772c3d074947cb7277dea7532133037b:

  pinctrl: renesas: Fix spaces followed by tabs (2023-05-09 11:51:33 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.5

  - Fix whitespace.

Thanks for pulling!

----------------------------------------------------------------
Marek Vasut (1):
      pinctrl: renesas: Fix spaces followed by tabs

 drivers/pinctrl/renesas/pfc-r8a77970.c | 2 +-
 drivers/pinctrl/renesas/pfc-r8a77980.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

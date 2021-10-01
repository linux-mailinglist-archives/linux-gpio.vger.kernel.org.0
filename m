Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A0141EA11
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 11:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353091AbhJAJu1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 05:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352947AbhJAJu1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 05:50:27 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E147C061775
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 02:48:42 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
        by xavier.telenet-ops.be with bizsmtp
        id 0Zog2600K1ZoSwU01ZogdD; Fri, 01 Oct 2021 11:48:41 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF9k-000zNc-C6; Fri, 01 Oct 2021 11:48:40 +0200
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF9j-00BEFA-NS; Fri, 01 Oct 2021 11:48:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.16
Date:   Fri,  1 Oct 2021 11:48:38 +0200
Message-Id: <cover.1633081630.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.16-tag1

for you to fetch changes up to fcfb63148c241adad54ed99fc318167176d7254b:

  pinctrl: renesas: rzg2l: Fix missing port register 21h (2021-09-24 15:14:49 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.16

  - Fix duplicate port register on RZ/G2L,
  - A minor improvement.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (1):
      pinctrl: renesas: rzg2l: Fix missing port register 21h

Jason Wang (1):
      pinctrl: renesas: No need to initialise global statics

 drivers/pinctrl/renesas/core.c          | 12 ++++++------
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

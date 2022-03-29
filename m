Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB7B4EAABA
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 11:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbiC2Jui (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 05:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234837AbiC2Jui (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 05:50:38 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974E8985A0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 02:48:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by baptiste.telenet-ops.be with bizsmtp
        id C9ot2700g49QC44019otTr; Tue, 29 Mar 2022 11:48:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8T7-007Eo3-Hs; Tue, 29 Mar 2022 11:48:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8T7-00CCDO-0S; Tue, 29 Mar 2022 11:48:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: renesas: r8a7799[05]: Add RPC pins, groups, and functions
Date:   Tue, 29 Mar 2022 11:48:49 +0200
Message-Id: <cover.1648547080.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

This patch series adds support for the various pins, groups, and
functions used by the SPI Multi I/O Bus Controller (RPC-IF) on the R-Car
E3 and D3, and RZ/G2E SoCs.
It has been tested using HyperFlash on the Ebisu-4D and Draak
development boards.

I intend to queue this in renesas-pinctrl for v5.19.

Thanks for your comments!

Geert Uytterhoeven (2):
  pinctrl: renesas: r8a77990: Add RPC pins, groups, and functions
  pinctrl: renesas: r8a77995: Add QSPI and RPC pins, groups, and
    functions

 drivers/pinctrl/renesas/pfc-r8a77990.c | 81 +++++++++++++++------
 drivers/pinctrl/renesas/pfc-r8a77995.c | 98 ++++++++++++++++++++++++++
 2 files changed, 159 insertions(+), 20 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE13019D05
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 14:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfEJMK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 08:10:27 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:56602 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbfEJMK1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 08:10:27 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id AcAQ2000G3XaVaC01cAQde; Fri, 10 May 2019 14:10:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hP4M4-0003Qn-3d; Fri, 10 May 2019 14:10:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hP4M4-0001fy-1V; Fri, 10 May 2019 14:10:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7778: Use common PORT_GP_CFG_27() macro
Date:   Fri, 10 May 2019 14:10:21 +0200
Message-Id: <20190510121023.6397-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

This is a small cleanup for the R-Car M1A pin control driver, replacing
custom by common code.

To be queued in sh-pfc-for-v5.3.

Geert Uytterhoeven (2):
  pinctrl: sh-pfc: Add PORT_GP_27 helper macro
  pinctrl: sh-pfc: r8a7778: Use common PORT_GP_CFG_27() macro

 drivers/pinctrl/sh-pfc/pfc-r8a7778.c | 18 +-----------------
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  8 ++++++--
 2 files changed, 7 insertions(+), 19 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9764C3F2F8E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 17:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241088AbhHTPi1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 11:38:27 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:54306 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240952AbhHTPi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 11:38:27 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d04 with ME
        id jrdm2500h3riaq203rdmyj; Fri, 20 Aug 2021 17:37:48 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 20 Aug 2021 17:37:48 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        alexandru.marginean@nxp.com, Laurentiu.Tudor@nxp.com,
        hui.song_1@nxp.com, andy.shevchenko@gmail.com, ran.wang_1@nxp.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] gpio: mpc8xxx: Fix 3 errors related to the error handling path of the 'mpc8xxx_probe()'
Date:   Fri, 20 Aug 2021 17:37:44 +0200
Message-Id: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This has been split in 3 patches because:
  - the root issue of patch 1 and 3 is not the same commit as the one for patch 2.
  - the strategy to fix the issues is not the same
     - patch 1: add a new call in the rror handling path
     - patch 3: switch to a resource managed function

They could be merged together if easier to review. The subject would then be
something like "gpio: mpc8xxx: Fix the error handling path of 'mpc8xxx_probe()'"

If prefered, 'devm_add_action_or_reset()' could be used to switch the probe to
a fully managed resource function and remove the 'remove' function.
That's mostly a matter of taste.

If such an option is preferred, I'm a bit puzzled by the
'irq_set_chained_handler_and_data()' call in the remove function because I
don't see why it is there.
Also see the comment at the end of patch 1 also related to this function call.


Christophe JAILLET (3):
  gpio: mpc8xxx: Fix a resources leak in the error handling path of
    'mpc8xxx_probe()'
  gpio: mpc8xxx: Fix a potential double iounmap call in
    'mpc8xxx_probe()'
  gpio: mpc8xxx: Use 'devm_gpiochip_add_data()' to simplify the code and
    avoid a leak

 drivers/gpio/gpio-mpc8xxx.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.30.2


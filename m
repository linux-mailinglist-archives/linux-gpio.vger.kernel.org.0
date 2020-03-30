Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA5301984E7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 21:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgC3Tud (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 15:50:33 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53949 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729097AbgC3Tuc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 15:50:32 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jJ0QP-0000dK-Ah; Mon, 30 Mar 2020 21:50:21 +0200
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jJ0QN-0007qH-Fm; Mon, 30 Mar 2020 21:50:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>
Cc:     kernel@pengutronix.de, linux-gpio@vger.kernel.org,
        Marcel Gudert <m.gudert@eckelmann.de>
Subject: [PATCH v2 0/2] gpio: pca953x: fix handling of automatic address incrementing
Date:   Mon, 30 Mar 2020 21:50:16 +0200
Message-Id: <20200330195018.27494-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

this is v2, the only code change compared to v1 is that I added a
closing parenthesis to create actually compiling code :-|

Other than that I added some tags (Tested-by and Reviewed-by, some of
them I got off-list). I wasn't sure if I should apply Andy's tags also
to patch 1 (and so didn't).

Best regards
Uwe

Uwe Kleine-König (2):
  gpio: pca953x: fix handling of automatic address incrementing
  gpio: pca953x: drop unused parameters of pca953x_recalc_addr()

 drivers/gpio/gpio-pca953x.c | 75 +++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 36 deletions(-)

-- 
2.26.0.rc2


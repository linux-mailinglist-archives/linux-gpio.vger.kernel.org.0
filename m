Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09D5195C8C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 18:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgC0RXH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 13:23:07 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42025 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbgC0RXH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 13:23:07 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHsh4-0003b7-VX; Fri, 27 Mar 2020 18:22:54 +0100
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHsh3-000821-H1; Fri, 27 Mar 2020 18:22:53 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>
Cc:     kernel@pengutronix.de, linux-gpio@vger.kernel.org
Subject: [PATCH v1 0/2] gpio: pca953x: fix handling of automatic address incrementing
Date:   Fri, 27 Mar 2020 18:22:42 +0100
Message-Id: <20200327172244.30816-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
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

This patch addresses a bug noticed by one of our customers. I split the
fix in two; a fix and a cleanup to make the fix easier to backport and
review. (The first patch applies to 5.4 at least, the second doesn't
cleanly.)

I marked the series as RFC as I only have a PCA9505 to test and I have
no confirmation yet that the problem is indeed gone (though I'm
optimistic here. The traces look fine, but I don't have the machine on
my desk and so cannot tell if the LED now behaves fine).

Thanks to Mark Brown to give the needed hints to properly implement this
patch set.

Best regards
Uwe

Uwe Kleine-König (2):
  [RFC] gpio: pca953x: fix handling of automatic address incrementing
  [RFC] gpio: pca953x: drop unused parameters of pca953x_recalc_addr()

 drivers/gpio/gpio-pca953x.c | 75 +++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 36 deletions(-)

-- 
2.26.0.rc2


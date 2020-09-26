Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3417279D03
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 02:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgI0AFV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Sep 2020 20:05:21 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:38268 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728721AbgI0AFV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 26 Sep 2020 20:05:21 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BzQjt4TDrz18;
        Sun, 27 Sep 2020 01:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1601164755; bh=6Q1GGhYyWmzwhfw8jITrYscApGCmc2Cd1j/by1Pc/8k=;
        h=Date:From:Subject:To:Cc:From;
        b=XPdjD72GMPqoq8n1/QRSDyxlUGqVfkdbrDwnLfNQE0HWyD3HRb3+VKiCtXHJtLgvz
         5b3h+orqnxIUz/gzcRYeT+HJIubXiq7CbY1eBOsQDzr4ROqcCTGuq2IctvfVyYmgFj
         Wvjx4MzOJxG+rmOLqACYg5FqbqXWyRl3GC2lStoFu6eEtWYdBtFBqfj6P8CrgZFIJ4
         A4Fhl/eQZ83xbKqD7vxooWdBDYrc7jvUb6jOzzZPd5rkYMNr+FUpAcu6p3FzLs8JPa
         81NVICvKoM4JRDH2/bqd0dR5yfteCjHi32BbWBbIsRTY1rR0bB/SqXU2G1OIQ51pAb
         IyISkHhuFeGpQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 27 Sep 2020 01:59:13 +0200
Message-Id: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 0/5] tps65910: cleanup regmap use
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tps65910 was converted a long time ago to regmap. This series cleans up
after the conversion by removing tps65910_reg_*() indirections and
other unused fields in MFD structure.

Michał Mirosław (5):
  gpio: tps65910: use regmap accessors
  regulator: tps65910: use regmap accessors
  mfd: tps65911-comparator: use regmap accessors
  mfd: tps65910: clean up after switching to regmap
  mfd: tps65910: remove unused pointers

 drivers/gpio/gpio-tps65910.c           |  12 +--
 drivers/mfd/tps65910.c                 |  16 ++--
 drivers/mfd/tps65911-comparator.c      |   4 +-
 drivers/regulator/tps65910-regulator.c | 125 +++++++++++++------------
 include/linux/mfd/tps65910.h           |  40 --------
 5 files changed, 79 insertions(+), 118 deletions(-)

-- 
2.20.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E156EEE6C0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 18:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbfKDR5x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 12:57:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:36284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727469AbfKDR5x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Nov 2019 12:57:53 -0500
Received: from localhost.localdomain (unknown [194.230.155.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 063EA20B7C;
        Mon,  4 Nov 2019 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572890272;
        bh=IjSEu9sfsdTQLLr2k3rmKdHTN5zkOVDlK7n/cmmSx0E=;
        h=From:To:Cc:Subject:Date:From;
        b=IsOkeKkQg0RNjneVRSm0lUjDXjGoAbtLABF61Spn/HW4acXLFURvr3+WxuY+6OTws
         cET84CYoXKPs3Lsdl9SwDsTganuIbSSWKTmEx5eQ4EgMFtEpDnBdHAS+k8NDIAW92V
         g2aWXBzNdQu+biZ/1k1Lg1IwhTjIoxjaA4DxxNYk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [GIT PULL] pinctrl: samsung: Pull for v5.5
Date:   Mon,  4 Nov 2019 18:57:44 +0100
Message-Id: <20191104175744.12041-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.5

for you to fetch changes up to a322b3377f4bac32aa25fb1acb9e7afbbbbd0137:

  pinctrl: samsung: Fix device node refcount leaks in init code (2019-10-01 20:22:04 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v5.5

Fix several device node refcnt leaks (missing of_node_put()) in several
drivers.

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      pinctrl: samsung: Fix device node refcount leaks in Exynos wakeup controller init
      pinctrl: samsung: Fix device node refcount leaks in S3C24xx wakeup controller init
      pinctrl: samsung: Fix device node refcount leaks in S3C64xx wakeup controller init
      pinctrl: samsung: Fix device node refcount leaks in init code

Nishka Dasgupta (1):
      pinctrl: samsung: Add of_node_put() before return in error path

 drivers/pinctrl/samsung/pinctrl-exynos.c  | 14 +++++++++++---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  6 +++++-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c |  6 +++++-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 10 ++++++++--
 4 files changed, 29 insertions(+), 7 deletions(-)

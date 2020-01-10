Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA89137517
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 18:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgAJRof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 12:44:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:40600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727742AbgAJRof (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Jan 2020 12:44:35 -0500
Received: from localhost.localdomain (unknown [83.218.167.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BB9D206ED;
        Fri, 10 Jan 2020 17:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578678274;
        bh=+XlasTsclIpK9sBFtzJ91eHhptB1H+p3XDQ+dPHG9P8=;
        h=From:To:Cc:Subject:Date:From;
        b=EBZniYie9cnWt7iquazlzLwNtr7fYI2ZXQhZre4JF3cJIxR0p5CQSnZp87RKCSkkQ
         6KkrGYjnVaHse6kCXceAqCSkLYSZtlGFjw3yOjKBOLFTQu/HViAZ/Q/ZaTREHT+Oxt
         5EGhTnygzSspBOzU04B8dHhF3ukhyZ1Z0wgEwlbc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [GIT PULL] pinctrl: samsung: Pull for v5.6
Date:   Fri, 10 Jan 2020 18:44:26 +0100
Message-Id: <20200110174426.5463-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.6

for you to fetch changes up to 225a2ec19aac426ef29f0e4accfc890c87d38bdc:

  pinctrl: samsung: Fix missing OF and GPIOLIB dependency on S3C24xx and S3C64xx (2019-12-15 12:47:52 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v5.6

Enable compile test for build coverage (and fix exposed missing
dependency).  Clarify Kconfig option help text.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      pinctrl: samsung: Enable compile test for build coverage
      pinctrl: samsung: Clarify the option titles/names
      pinctrl: samsung: Fix missing OF and GPIOLIB dependency on S3C24xx and S3C64xx

 drivers/pinctrl/samsung/Kconfig | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

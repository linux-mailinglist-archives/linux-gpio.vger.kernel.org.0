Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE49612FACD
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2020 17:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgACQtD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 11:49:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37669 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbgACQtD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 11:49:03 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so30410440wru.4
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2020 08:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vt3txq7dKmpDMDyEtdyhAuj6T8Ovu2E7I51JDePxVJs=;
        b=LzRtQt/Ptw4uzaV6jRAd3SoHvDa2U0hzjkyGscqR0LmrCmMeD55/G5j3txPje/Vzqp
         yOXVfuw9lAJboVaMx6hVzbFtwlak5rnUoAZ2F+YDUy/k3+fFLnZEPS8oPPlPGsZATEB1
         6IYumENGag4XeqsWXuLqz1Y0pQnrnVIpE59tE6dviSdvA1LVjdOoIRfUIdBmOBiQB5e2
         Cg0mmLTyEiTcWfr9SRh1YEVGYHkHj6URmznZ+KvpmuZxFPkldxqRo8YMVXUxV2tfKxrI
         ZtlPiX5CSfiC2Q6uhZWa6+r1USQeAqzpkONtR6nuioZX0olDP76gRO57uXHvebEOJ32J
         5Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vt3txq7dKmpDMDyEtdyhAuj6T8Ovu2E7I51JDePxVJs=;
        b=Df38jo6voaU35W3/rYfiiCoGztBzuMOapEKQdK1mfa4reaS9Mm7lwCoD20IJKJXCz+
         ehM9lAGgBJ15jATzbD0xpZ5/ANqQ2GzFab0+92wOFmbfzU4oiFN63tbvgbqB3Yd+yxZj
         AT1VJBMmkFQd6f7ZdZ7bFJ+QYoZkUAIWy0Q4vbszmKvJyHE6kf2CXKYktfwvrwrhKjit
         JAeZwRVAKr9CpVuPgD9vOHBdC1yqzDpmvL+nq4Ps0yk1nSA9K9yys+z+9ctlkJBzAvho
         VQAhbsQ1xicdrYJZ+wu/7T7vEO+gPkRhcmpan7+H20+eL4179hqmm/cQkmmWpI2JEU2p
         Eq4Q==
X-Gm-Message-State: APjAAAXcvjyfDbkuv8lqR3S+R/LVo2ejNEFT+RLNxXG3QENVJzgfDzeI
        ix6/p2EqWoKZuQJuaHngK16O9z75eFg=
X-Google-Smtp-Source: APXvYqy0t76BDDxUFnz+Ro1eGQ+n/C8KWVw0+1CMNOHW+lfjhYeKfCbQtfWHvG++GPPquGtCO4stHA==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr64530673wrs.365.1578070141505;
        Fri, 03 Jan 2020 08:49:01 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id o16sm13407973wmc.18.2020.01.03.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 08:49:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.5-rc5
Date:   Fri,  3 Jan 2020 17:48:57 +0100
Message-Id: <20200103164857.18811-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

please consider pulling the following fix for v5.5. I missed some
indentation issues during review in gpio-mockup.

The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.5-rc5

for you to fetch changes up to ee8598ae527ea0408e440c073e0945fc37488fe6:

  gpio: mockup: fix coding style (2020-01-03 17:38:23 +0100)

----------------------------------------------------------------
gpio fixes for v5.5-rc5

- fix coding style issues introduced in gpio-mockup during merge window

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: mockup: fix coding style

 drivers/gpio/gpio-mockup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

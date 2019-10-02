Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBA5C8F2A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 19:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfJBRC6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 13:02:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40862 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJBRC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 13:02:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id l3so20514256wru.7
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 10:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j6mEZW97cwRM3vW7U2lOpw/fWWoNmGcPeVDFJW5o5aI=;
        b=a2Gbtd+4W12wuYhZwNclrG1CiaE+Ig5ZKGP7L2XIgw2aMZEt5v/lArhsfbIH0rlNyg
         8VNYvFqtCW5eDYw37XpGCiasH2cgZpTSFxRG6OjqQBzQHGpS+IP3piTuKe+HBdIGG7pR
         Gy18ypVO/6vOJxxoJF1y3/sxycQ6cKb0rN0qUjq4rBIDNWSN4kWBiY5T7fmu0vw1IUIQ
         Mdw1BETnD9crNfwgo+dt0G5BcEGpwohvE793VDVImLQTNlXj5Nu2941+maXLXQQilTZh
         wbeHu96UYwNJ0ux/6BtvU4YU+6uIbZHy1wmfj7Xb72Wk9VKSR1T3Uthmq5wkHSGKdV2b
         m6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j6mEZW97cwRM3vW7U2lOpw/fWWoNmGcPeVDFJW5o5aI=;
        b=CK5yxKdMSGcWy+/7Qk1QrdUs//qFwW3PqUgp4qAeAUNL7aLc38RhlSPkXGlI0OCFsO
         wEiAVDrS7UKDF6nIWzTw1TaRxvEEd9OzXTmxA4LkpwQbJmijXRe5FEWWQlMwQrMtJNhl
         du2sjDWjGbYqZwgAMg/mD6EkA7jDovy+dcfyKNLVrpNz6OC58uDG/e+vYtEbE9i3dBoP
         5rosa741rB6rK0n2ErwAUfzcTjSNM7zSb7mJC+qChNqJRXkl24mo1wuvaiVSvU644C9Y
         9NNKIvTRfsV/R+cK4P/SeEYp7tovtQezH5FQVaLKSVqEEeq+ujPJXqOIQKxiRkNoeZjx
         ZNfw==
X-Gm-Message-State: APjAAAVLyfDJOKInaJyVANY+J5bKKqT6bLdj0bs9G28qjiE93/mSHreo
        ZKeY1gb6J9RKY/w1q3HaHK5lTg==
X-Google-Smtp-Source: APXvYqyfHPaXuTDHKR0G+6d4PXNieCa79JUKUPWeNcTxzobXu39t6AQ29qJUgKxoLoO72YNBEn6chw==
X-Received: by 2002:adf:e988:: with SMTP id h8mr3531294wrm.354.1570035776511;
        Wed, 02 Oct 2019 10:02:56 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id b62sm11188575wmc.13.2019.10.02.10.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 10:02:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alban Bedel <albeu@free.fr>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/6] gpio: replace nocache ioremap functions with devm_platform_ioremap_resource()
Date:   Wed,  2 Oct 2019 19:02:43 +0200
Message-Id: <20191002170249.17366-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

According to Arnd Bergmann:

"The only architecture that actually has a difference between
ioremap() and ioremap_nocache() seems to be ia64. I would
generally assume that any driver using ioremap_nocache()
that is not ia64 specific should just use ioremap()."

This series converts all users of nocache ioremap variants that aren't
ia64-specific to using devm_platform_ioremap_resource().

Most of these don't call request_mem_region() currently, which
devm_platform_ioremap_resource() does implicitly, so testing would
be appreciated.

Included are two minor fixes for xgene and htc-egpio.

Bartosz Golaszewski (6):
  gpio: xgene: remove redundant error message
  gpio: xgene: use devm_platform_ioremap_resource()
  gpio: em: use devm_platform_ioremap_resource()
  gpio: ath79: use devm_platform_ioremap_resource()
  gpio: htc-egpio: use devm_platform_ioremap_resource()
  gpio: htc-egpio: remove redundant error message

 drivers/gpio/gpio-ath79.c     | 10 +++-------
 drivers/gpio/gpio-em.c        | 20 ++++++++-----------
 drivers/gpio/gpio-htc-egpio.c | 37 ++++++++++++-----------------------
 drivers/gpio/gpio-xgene.c     | 27 ++++++-------------------
 4 files changed, 30 insertions(+), 64 deletions(-)

-- 
2.23.0


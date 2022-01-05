Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918A5485405
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jan 2022 15:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236964AbiAEOE4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jan 2022 09:04:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235979AbiAEOEz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jan 2022 09:04:55 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9D6C061784
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jan 2022 06:04:54 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l4so25576118wmq.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jan 2022 06:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TlXdq9XIB2tOct/lxT5yMZfON3WyyUeXO6bx9SBaYcQ=;
        b=QVGH2CavroGa9ub7BD08K1VsZ+3acX9pelHho80D7vs1W3IcSGHOVQEX0hVzycRNC9
         fMw75CB9Gntfe8DMwaHsjvs8EiGyXDzbLXSFOhr6alovpYquhuHScxDzSneABIirafLf
         LnHMd9coQ1PbpZzCMBoTMPZxIxh3LbJVuIJWzgIrVpiM2Bio9DiWGdCpaYOSy7majDk/
         gg/dyW0LGNoJ5mHX4O6nCDGKbpuLaSQixLiNEoyb6H1rCsArVg9N4F9zghQjdXvEwBOS
         ziBrEbJHk9JlYutYLbQIwLgkYfJEDAFdwCtY1UsgRQInOYp1vPBCKL4v6TxvpcBLf5Oe
         xwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TlXdq9XIB2tOct/lxT5yMZfON3WyyUeXO6bx9SBaYcQ=;
        b=4mQuOSe968CwEWmieiFSINUtgZO5xuqXZiewUhL3nyXElhATcwbJPwg7ALht+/6IvG
         Ypc9LTPFe0g7nTZ5ZCEaufZoTkTMx7VHtnYCj39WSYUboZjgNdj1lG7iVjt0Q5LneHyp
         ezbMOfPc3Oq1NQf6nHk/xycXNH6YUrEIyAUhoMVOeQ9ILs3pTuk2Wg/r7w+TzyJ6S0Fw
         KY7585BTEBIdqTvev7ZTRmSALdlLyiZso6LhoqLogdI8ZyXFzUFC79bpMHPKhwOyPIRo
         dgCVLio5f8JWm9mZ2Yk0rnA41dWIKu/HFA4x14RDqKKo0hWK1stHWHz2KAA4chiqLEdN
         L2Bg==
X-Gm-Message-State: AOAM53240//AAHgaovVfag48rfzPM3LwjML6myleSMLRZGNgKa21oKTL
        DxyxJqyMbCj1Y2RJSXYczFwtsQ==
X-Google-Smtp-Source: ABdhPJz4JzU0XGsLurwqkd+FwWZ5XhCMf965oWMUQsq4Os6meaJmVtbCBFR76f1NEaLqqiKeVVE4/g==
X-Received: by 2002:a7b:cb83:: with SMTP id m3mr3015819wmi.150.1641391493454;
        Wed, 05 Jan 2022 06:04:53 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id n9sm3083813wmq.37.2022.01.05.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 06:04:53 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.16
Date:   Wed,  5 Jan 2022 15:04:51 +0100
Message-Id: <20220105140451.200178-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Here are two last fixes for this release cycle from the GPIO subsystem.

Best regards,
Bartosz Golaszewski

The following changes since commit c9e6606c7fe92b50a02ce51dda82586ebdf99b48:

  Linux 5.16-rc8 (2022-01-02 14:23:25 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.16

for you to fetch changes up to 32e246b02f53b2fdaa81ea9f2ca6ff068c017fcb:

  MAINTAINERS: update gpio-brcmstb maintainers (2022-01-03 10:53:02 +0100)

----------------------------------------------------------------
gpio fixes for v5.16

- fix irq offset calculation in gpio-aspeed-sgpio
- update the MAINTAINERS entry for gpio-brcmstb

----------------------------------------------------------------
Gregory Fong (1):
      MAINTAINERS: update gpio-brcmstb maintainers

Steven Lee (1):
      gpio: gpio-aspeed-sgpio: Fix wrong hwirq base in irq handler

 MAINTAINERS                      | 3 ++-
 drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

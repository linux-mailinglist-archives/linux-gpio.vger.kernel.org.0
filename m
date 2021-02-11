Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4357F318D3B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 15:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbhBKOVn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 09:21:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbhBKOTe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 09:19:34 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD2EC061574
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 06:18:52 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id g6so4302524wrs.11
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 06:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4qlsG/vgFwt6W3xkjjlbgx54qKfPJTS+Ij9Sun9FcVs=;
        b=Xhez2VOzf2UdNPbuCWLRQEl2hhslKG12pJqxv8aIq9KoRKZmoHkeSdKERv69m06izW
         2gOJ9+Vkzu8+Dzp68kmqcH37PaDSnYewwjZt47GufIzK7zsvHKbsfg3xIxUnQs76N7Bb
         0na0UlLJhqcfAK1ptfKdCDgPNh5n+QUZxULQmwtNK71bFEBuyJByBKioSDNPbFjsJsEC
         g5VVj/Lme7FpnUDAziLrEMkwZalVzjBRyW3iqDgUJlU0+a6Sr/zo+SIwiCFI+Q7aKtCA
         x9YIqQ/wd9f65W6XARNiHq4F0YGNBbRInVepxvH4daNBXuEyXHGP0rG6FIhj7geNd4a2
         NgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4qlsG/vgFwt6W3xkjjlbgx54qKfPJTS+Ij9Sun9FcVs=;
        b=nEQEJMs/OM/Gb0QBg88V9Xj0MrHqzN/yzyerO9bYr0nMezPGIPKlpeHJqDOZSlVts0
         Jsbsi/cBQnvkdOomOf1dbWsPUhFacWlIktYQJZitTS/Pm6oWgX0Bmtc3v1iOrxiGe1lg
         PVjYo2i2Y2Md+cSvf+EwAx3d9TjZUd6j/jLD2LqCC9yRnw0sIkDtlUktRllNgmFvDahE
         0TxG/HGUr+rdTJExq+5Sj6U9pOTlCNNhC4jguuC4YZ17QOjC0TyAcav16bjVsYcoFU0c
         OxgRC8qoEAm4ybMuIVNJPa1kBRjmx4FKyuI3mMW3LjI2bkmn6TKWtNPQjwV9KQS0w10A
         jeUQ==
X-Gm-Message-State: AOAM532ea6dQ+Xq1K8Orr1gJP+UF7TY+Q1ydJmp6Qyaayxq5G95onUqb
        909p4G7sMhuVjXvKBIW5stWs1A==
X-Google-Smtp-Source: ABdhPJw/KrCPg+OG007V3Udv45jp1L6+S3wsre2Kua+nluc+0WEdDxFz6eDB3N8qSAESXM6AQAeNvg==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr6206045wrt.338.1613053131489;
        Thu, 11 Feb 2021 06:18:51 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f8sm4893997wrp.65.2021.02.11.06.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 06:18:51 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.11
Date:   Thu, 11 Feb 2021 15:18:43 +0100
Message-Id: <20210211141843.32699-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

This is hopefully the last batch of fixes for this release cycle. We
have a minor fix for a Kconfig regression as well as fixes for older
bugs in gpio-ep93xx.

Please pull,
Bartosz

The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3:

  Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.11

for you to fetch changes up to 28dc10eb77a2db7681b08e3b109764bbe469e347:

  gpio: ep93xx: Fix single irqchip with multi gpiochips (2021-02-10 14:47:27 +0100)

----------------------------------------------------------------
gpio fixes for v5.11

- don't build gpio-mxs unconditionally with COMPILE_TEST enabled
- fix two problems with interrupt handling in gpio-ep93xx

----------------------------------------------------------------
Geert Uytterhoeven (1):
      gpio: mxs: GPIO_MXS should not default to y unconditionally

Nikita Shubin (2):
      gpio: ep93xx: fix BUG_ON port F usage
      gpio: ep93xx: Fix single irqchip with multi gpiochips

 drivers/gpio/Kconfig       |   3 +-
 drivers/gpio/gpio-ep93xx.c | 216 +++++++++++++++++++++++++--------------------
 2 files changed, 120 insertions(+), 99 deletions(-)

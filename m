Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AED20A2A4
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 18:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403951AbgFYQIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 12:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403863AbgFYQIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 12:08:54 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1B7C08C5C1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2020 09:08:53 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j4so3959014wrp.10
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2020 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L7ANHh4y2Asw260/XU2/A56QyZqZ/SC+C3EKl2Cl0hw=;
        b=eNe8v4VZZRGZoLOSZJrT3u2nyrSIFHYvxF9PboU0vxtPxGNDSgPG4VQkrsLLJtd2Bw
         D8tfjfwc+zDEGFASBNt3IPt/61E9lUdw6GiN+fMg9KaI56mMtTdX0ottJL+pLOm/CsLQ
         imIgwFJlql98ZhdK7rSowyEZ60mZvD/6TCO4zRFGGxwTMTtXSI7sEpINiNprO1LNDrKS
         +ctBjtSR/84uO237g6UScOsz5xU/fTk3ibLUTC/NphAKidEpQXXzWCqFZV0u/AHmOpU0
         bs8RZvoeckINrn1aHzvGiJ+HL8FXeQkBHcNxzLcjM2Ej65js9Fe2XOVo3+DzF8NRQ2yL
         crNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L7ANHh4y2Asw260/XU2/A56QyZqZ/SC+C3EKl2Cl0hw=;
        b=K8e9PH90Vxlyow1z7be0DzpFmhstAHkFob1nRBRNydNT/9cER3Tu9bB9mLAbdlM8C8
         yXUZWRP3xi0r4SSkB8HLWwHm3A7Ek5dNMwmTZAQLB6yoPRbe0sfzclUiV7vO2T0AJu75
         bInW5MEXJoyVPeq9TX+CkKXPC7PB3gHfUoLqxFbzbewdvtt3bhN8vtKvJ47KAe5rsSJo
         CTbXL1fddJKXIuQG+4tCtBm/6M9Z/JAqA73pZDYFqgbFs1ZP9eaFA8eoBLNAleh83mdH
         xyCMZCcRXQPEMJ69K5y6vD3j2p9OTQIYlyg69G04u8E87H4W4DhBzLOTSBQPdhiuqQQB
         tOgg==
X-Gm-Message-State: AOAM533hJ4UzD64m2+SaOvlvGJOB9VD8N5/wnCgLFC2qALigxU0lVwr7
        4dWucCCDFz3/uDVHSQc12i4BzCoJagQ=
X-Google-Smtp-Source: ABdhPJzgkEiDOoglW4IUV525PnDIxm9jLEF84Jk5ygfUk1QLs8qDYrsqm7Tsn6SROT6wl19SSJHW/Q==
X-Received: by 2002:a5d:6a8a:: with SMTP id s10mr33998376wru.228.1593101332385;
        Thu, 25 Jun 2020 09:08:52 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z1sm18510234wrh.14.2020.06.25.09.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 09:08:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.8-rc3
Date:   Thu, 25 Jun 2020 18:08:46 +0200
Message-Id: <20200625160846.5717-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following fixes for gpio-pca953x collected since the
merge window.

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v5.8-rc3

for you to fetch changes up to 5d8913504ccfeea6120df5ae1c6f4479ff09b931:

  gpio: pca953x: Fix GPIO resource leak on Intel Galileo Gen 2 (2020-06-22 18:51:53 +0200)

----------------------------------------------------------------
gpio fixes for v5.8-rc3

- several fixes for gpio-pca953x

----------------------------------------------------------------
Andy Shevchenko (5):
      gpio: pca953x: Synchronize interrupt handler properly
      gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2
      gpio: pca953x: Fix direction setting when configure an IRQ
      gpio: pca953x: disable regmap locking for automatic address incrementing
      gpio: pca953x: Fix GPIO resource leak on Intel Galileo Gen 2

 drivers/gpio/gpio-pca953x.c | 99 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 5 deletions(-)

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC9F218C5A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 17:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730439AbgGHP6w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 11:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730400AbgGHP6w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 11:58:52 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EABC061A0B;
        Wed,  8 Jul 2020 08:58:52 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u25so27221555lfm.1;
        Wed, 08 Jul 2020 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PymXI2wOjT66kV3zrymlinxzdkZ3vrED2iarVtDwUIQ=;
        b=LvyPhD7wXOjLVYQ21ZILbtO+06VGNx1wV0hhbpEAbd/+7CzkHCyVWmbM8EZiDi4GDX
         m5+2erOZBYIl6qqATKhFFx7JggiIRpTT+EESxW4tKlShXrdCfNZumySzBM/70PMkbI8U
         /zRRDWKrcAXhy6uP//LD6tImXnP12Omq8tG/axAMaCVDygVEoz/ovsPkrg3ilp7utXFp
         2cnHXJ1VT6zao+d+7uzoK0UtQpTZrOZopUfoIztEIqo6NcLNpsN2dLqHCYgbHJJfP3VC
         YzucbirP/zN3KxWHDzHiRicfTCcL2hLiMIygCEAbQVyHVVFgMZXNS7nUtayXP1MeGLTK
         +FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PymXI2wOjT66kV3zrymlinxzdkZ3vrED2iarVtDwUIQ=;
        b=t0tdNqjMtBOl7xqfpJZWvRWdb6t+S03enXF+UX7iyAszSvWV+KpekNfMP7SrSG2KGk
         GpZjVRp5drqi1j9eDdZ9IVnpWX67Nqx/Ycl/SBEjkDWnEh8LSLG1RupI8fUaJF1W45Iw
         fzN3drG107XG3UXFfZmBvbYtl3igZ8hjNxc4+rvfyfkCY4r+37BxuXIVgjjZV8POIxWK
         K+iDUdaiz53i5pZZMH3mjUVR9u3BqbJGB4YGUIX+3N29LzExVA4oO2HTh+DkFR1eEz+U
         jhGQ5CPk55k8uO1bc4wUNitsDivxnIhHKSKIqC9YYfENDXO5EWjTHxZHe0e9HWRJSyNs
         RUoA==
X-Gm-Message-State: AOAM532UVpORxoV/F6uMyefULMMyia6JHwpjxpOJ81GNrZyXANFNA4Bb
        PKd9DoTI7scNYEuqlMPzgOg=
X-Google-Smtp-Source: ABdhPJz2/K0R069srj1tsZChlPH/WE5l9kIfys5eVUZ6ql2aHWsLc5E+Q7/33Y6Kjx5emH8GXzXJjQ==
X-Received: by 2002:a19:4285:: with SMTP id p127mr35222698lfa.74.1594223930532;
        Wed, 08 Jul 2020 08:58:50 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id 16sm37977ljw.127.2020.07.08.08.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 08:58:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Improvements for MAX77620 GPIO driver
Date:   Wed,  8 Jul 2020 18:58:32 +0300
Message-Id: <20200708155834.19762-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

This series addresses a problem that I discovered on Nexus 7 device where
GPIO interrupts may be left enabled after bootloader and the driver isn't
prepared to this, it also makes a small improvement to the code.

Changelog:

v2: - Addressed review comment that were made by Andy Shevchenko to v1:

        - Generic init_hw() callback is used now for resetting interrupts.

        - These v1 patches are dropped:

           gpio: max77620: Replace interrupt-enable array with bitmap
           gpio: max77620: Don't handle disabled interrupts
           gpio: max77620: Move variable declaration

Dmitry Osipenko (2):
  gpio: max77620: Initialize interrupts state
  gpio: max77620: Replace 8 with MAX77620_GPIO_NR

 drivers/gpio/gpio-max77620.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

-- 
2.26.0


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6335621A57D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 19:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgGIRMi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 13:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgGIRMi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 13:12:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E518CC08C5CE;
        Thu,  9 Jul 2020 10:12:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q4so3286117lji.2;
        Thu, 09 Jul 2020 10:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9zGILK2KVJ/L1Sl0wAXTZsxfr/HBlMquYn5Az6ZTy3A=;
        b=R0DGbFgxU7NCq1PudetXaJ2cWmxXO/quOiRoRCNxqbeGRpVv+j1EkNBfKj3Etr9XG5
         AodRE01QcFiiBNPoFxJWMZcGIO9C/AL9LOwk0GWhJR5kOKmoFSQcXMVowLHfMLyA8WxC
         A+jFWlvua5hsiOUSEkrYS/CuPQ2wUeORHHYY9y4SaOYIfJwZfXwDlHW9KHR1Vtz1z5cC
         iMS8981hYAN+qau4jdzWSrI81X3F9QpL3PmT9minyZXCEy06KGawPZ0L8e56W7NG5nj7
         NmPzOguO8MTH+2NjK2IKcJQOPqiuQjucdnMR2sFRWMltuBC1+0hTXtkC0x3xGTxnPIkU
         ecJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9zGILK2KVJ/L1Sl0wAXTZsxfr/HBlMquYn5Az6ZTy3A=;
        b=JXw8aKg3uCY+1BbBDoeOHWPSGTZzyMDHsYPdCdllvd603ADR3D6dZEMBa+g7p7escv
         YZXs1ZYjVdg8bpx8SCn9gJIo4JwHWb0tUBcIco0XkATCq+HTI9RzRRi33v9CLiEXaFdS
         YsYMHEmuWADHU1bzTVRspvdEI0XR2ZwIQsLkueg/FZfmZd/UQgmNaPowN58X7d8ElNU7
         wCC/6VdUXaXVG/Knn8qAzBsHQZwJO6KnB23Xnkikih0y8RNmVCW+yZ3ug74bqGo3vh8L
         7wOJ63XB2/pOYVrIx+dBjUYHRwlvR9gKFtleRc77Mkf28zdmGcZHo28mO1FddXynm7Y6
         lknQ==
X-Gm-Message-State: AOAM530q6ZPiSLd1A0Byg+EQ8Rmq0IHpKwc3O/EPXk8c8FeSuq93eiz+
        ax2HkLHPjBkaMc2DkvSrsdY=
X-Google-Smtp-Source: ABdhPJygBkGa2d6MjYhmc8K6TnZbpAHTZV8oEeCuLNEJelpL2CsQnSI1RN63f3P0LJYKQSG2gsoFAQ==
X-Received: by 2002:a2e:99c7:: with SMTP id l7mr17465156ljj.221.1594314756307;
        Thu, 09 Jul 2020 10:12:36 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id y22sm998314ljn.2.2020.07.09.10.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:12:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Improvements for MAX77620 GPIO driver
Date:   Thu,  9 Jul 2020 20:11:57 +0300
Message-Id: <20200709171203.12950-1-digetx@gmail.com>
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
prepared to this. It also makes a small improvements to the code, fixes the
non-released interrupt bug and converts driver to use irqchip template.

Changelog:

v4: - Added stable-tag to the patch "Fix missing release of interrupt".

    - Added acks and r-bs from Laxman Dewangan and Andy Shevchenko.

v3: - Addressed review comment that were made by Andy Shevchenko to v2:

        - Improved the commit message of the "Initialize hardware state of
          interrupts" patch.

        - Added these new patches:

           gpio: max77620: Don't set of_node
           gpio: max77620: Don't shadow error code of platform_get_irq()
           gpio: max77620: Use irqchip template

    - Added "Fix missing release of interrupt" patch.

v2: - Addressed review comment that were made by Andy Shevchenko to v1:

        - Generic init_hw() callback is used now for resetting interrupts.

        - These v1 patches are dropped:

           gpio: max77620: Replace interrupt-enable array with bitmap
           gpio: max77620: Don't handle disabled interrupts
           gpio: max77620: Move variable declaration

Dmitry Osipenko (6):
  gpio: max77620: Replace 8 with MAX77620_GPIO_NR
  gpio: max77620: Fix missing release of interrupt
  gpio: max77620: Don't set of_node
  gpio: max77620: Don't shadow error code of platform_get_irq()
  gpio: max77620: Use irqchip template
  gpio: max77620: Initialize hardware state of interrupts

 drivers/gpio/gpio-max77620.c | 65 ++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 21 deletions(-)

-- 
2.26.0


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DC3219166
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 22:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGHU05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 16:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGHU05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 16:26:57 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03846C061A0B;
        Wed,  8 Jul 2020 13:26:57 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b25so52151029ljp.6;
        Wed, 08 Jul 2020 13:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0w0hRPTED8ZJ28VWYfFispbGvxFYo9ZlStpShX4740=;
        b=bEBRjtzqrFkDSfrNrtKl4ZmznJGVbvcqiRGANQW/t6hFtByFI80ITB8pZ+nW2W+mHg
         Ruaz90jRK7HQuNyzHJNYXyhO6qq5JmdjIAdwiunkuSCVsan9LAT5/LmmcF61w+cKUXcP
         ks0+4snR8xFJuwRlnhhYdS/W5rINHu90KXR4c5GgKcA2gkHaboP3sxmmPxr69gHCKXQZ
         9pz2d0flTBJy+dXB7Shu8puA3iVTUaIBrxEf5G72+pMc+zcczUmDl6oYrjBOnZxzmm1z
         0LuM5IpJBpXqw/iub49FHxICjPPQwFGje7xyjPpQGBPbPb1eDpKMLuoPLUUlrH66SA21
         4eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0w0hRPTED8ZJ28VWYfFispbGvxFYo9ZlStpShX4740=;
        b=hDYOYIypJqR/SYdi5k1OUsNdEGVsj12i6RbnFEZYHcJMT8Owgc8go4NSyL8U5ZHTAl
         x7erezcHh8qOaavXn0g0eDTnRnfZ6QFRithjni31OcZ3WukQwINZXNZ042aRwjk04lMs
         NNIWFs/aJA63q+tClBKPsOTVDHsfJ2AeKg3KYMplTM9aWnQkJFwaQr6hHkcTnyP4sukE
         cfwnYFnQ/sEPfQsAg4toSCPHesDGoIyOjYJKSiIKZvEp5PxGnXZD1BafVUqiTbI6hiSI
         mH6nOFs20xqeBq+oDGxmLVakiu9Pq4Rkgo9KZwiKQnWb0UKxGhv7lPspOGGuXBIYeS5c
         6Cbg==
X-Gm-Message-State: AOAM533gSoECrPQun2PONEGkOLQtr09JlDc24F2ve0LTqZPGOD6F5mAb
        Ufx+7F9keQy7KXRSoKn64bg=
X-Google-Smtp-Source: ABdhPJwsh1d/oAeKRwn7jMN68bTbcHeGJkrYESS6hrpyraz73/oT2dMQ5kmFfzlRcdEghQ5W+/yVoQ==
X-Received: by 2002:a2e:a58a:: with SMTP id m10mr10752007ljp.16.1594240015517;
        Wed, 08 Jul 2020 13:26:55 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id e29sm252568lfc.51.2020.07.08.13.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 13:26:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] Improvements for MAX77620 GPIO driver
Date:   Wed,  8 Jul 2020 23:23:49 +0300
Message-Id: <20200708202355.28507-1-digetx@gmail.com>
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


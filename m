Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF18218243
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgGHI1t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgGHI1t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:27:49 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D56C08C5DC;
        Wed,  8 Jul 2020 01:27:48 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f5so37284069ljj.10;
        Wed, 08 Jul 2020 01:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Miaa8SoPzdiSzDoIlcAzPHbKCfF0bU4YdLj1kWGR1M=;
        b=YFg0MyMnPINaoVSvIpWRiBilrX594BmO/FCm9av5ANoQe4KLrWHJ14z6Qm/ZWmvub9
         o2ffSS59gvRiJHNilGvFEXBEGlUpk6N/9CkFwxPU6XQw9Uloa0tfFvwbPJEw9cgs3mKI
         QDRFOmO3rxTadCw5EBV1x2J9eK5zy+aRkj30a8T9mqFT81pc0TCwtBhT79d7WmebnM2s
         1xp/euasOSn5lkOaZ4t20xHQvRp9+dPf3EiPzPLaUVjBHB1hQCcb5t42f6zBMX22H3YW
         DXkjKMTboqXSVJ+I0XnkrAV0Ynxl80N2uoSoJNUU98Ss1H2JUV9K+NTlxyHp9ey487Hn
         8gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Miaa8SoPzdiSzDoIlcAzPHbKCfF0bU4YdLj1kWGR1M=;
        b=oiWBF9BBFI8QwEjzHPmNSlVrPzC8fmzs73OkmXVYdiaRVLEUq5VSjffsT7wcmWaex0
         uroSQcknivooAkOjhq4sR5bmn6khXyjB3DzQ7GGi6yo9c9TwekdRlnDJK7MUI1wudEKp
         13+oD4YoZ74KYRz4/SuNh8xqfHAQFvCZq4PrVvdFDN0EEyJfnZY4jlnb+kRNzCtiuNhp
         AdXTRHUIOG6LsJsQJO1NgNtTsjKoJRZdyO0uo3pIiiY00VKO2ne6DBhVX+zWm1E8g3W2
         7TGPbuq+nP14R5NjvXIh/t4Qb+LLEV1/XMRtt5eItqM2HakUhSGzqO6bV+rUfjbSE6L5
         /8Yg==
X-Gm-Message-State: AOAM533jvrGufPNwr3xSBQ8NYqe5sMKH8QaG/Wo6GR7dbTc1gqk4pmI/
        0udy72wlv9OVuhcHcRk/9wY=
X-Google-Smtp-Source: ABdhPJyBil27+pSnKjuHOLLHdLn0yACNNRc/K0bc43EGma0+Bnx0Ikvb9anELJU9nxt2MIQhpcP7lg==
X-Received: by 2002:a05:651c:50d:: with SMTP id o13mr34705414ljp.181.1594196867111;
        Wed, 08 Jul 2020 01:27:47 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id d2sm737555ljg.6.2020.07.08.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 01:27:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Improvements for MAX77620 GPIO driver
Date:   Wed,  8 Jul 2020 11:26:29 +0300
Message-Id: <20200708082634.30191-1-digetx@gmail.com>
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
prepared to this. Secondly, I made few very minor cleanup improvements to
the code.

Dmitry Osipenko (5):
  gpio: max77620: Initialize interrupts state
  gpio: max77620: Replace 8 with MAX77620_GPIO_NR
  gpio: max77620: Replace interrupt-enable array with bitmap
  gpio: max77620: Don't handle disabled interrupts
  gpio: max77620: Move variable declaration

 drivers/gpio/gpio-max77620.c | 44 ++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 10 deletions(-)

-- 
2.26.0


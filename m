Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76E623A83B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 16:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgHCOVB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 10:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgHCOVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 10:21:01 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B05CC06174A;
        Mon,  3 Aug 2020 07:21:01 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l4so38728153ejd.13;
        Mon, 03 Aug 2020 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4JGanD/pW6UD3jQR56CF7ASLdVGtCCuUbSXWF5HYQw=;
        b=Ygz3a3qnAKkYch2/zr6cBwVXYilIRFfVorb1udYyl7PL/X4xF/xeiui2wdLIVv8s5q
         1DkNQWmFH1BKAyOdoZzVC2389PVP4BS9W2fwDH+E5NXzYkS+Y5zoe6UT6UGqQAZHmt2Z
         zvipM6bawgFRe9vn4KCtj3YbGcR2MIqyX4JJWyQE0s8YmXZA5kJa8VBdFPR3SSUXXhuq
         vEeMSJYB92m7NsKh2M5vmc8hYCB7qATy3DeezL6G123YIIjYSETixU1StrKofGmuHnKg
         CjgexocKUy206wyl7i+vh11OLSEw5YNZubAEP+lC7o/9+RsC2V6ox0vkBTOj7rWLxsd+
         cxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4JGanD/pW6UD3jQR56CF7ASLdVGtCCuUbSXWF5HYQw=;
        b=TACnOql0zcBQYja12hiHIHKJtwz4dR222XcA5Ur+EbsIzqMiBrKCS8Hlf4VzoLJ9pN
         tQJXqJAVlJHDHV8C4+jZz9lvnopPPm3qufSMeo6hDoav2gGF8GGJCGvTlatRnLl0CdVR
         Subw33r8JjQIQbFN8ku+4lUMFNwsNS9ISQ7WypgI4PeyBOLh3FaXl+kyLzPt5c8a1Um0
         9uR4mvrSqlGDJZ8rdPjmW+fXGXZ7FjD809XQ+z/JIF6c0t9FKzbGaFxFT00wKuUO5CB2
         mGFiPZsJi4wOWjf3spdI50nOAeEEsj3IgPLQsCARzN5mlUPHHz5OeSQ8EcafZ5wH4bxu
         ZFkg==
X-Gm-Message-State: AOAM533ggdAFY+IjTEaliB+/HKeZEG5NkTvMBqq2d5CDbPCJ56+HiAPk
        nACHyoDV1ERF8K+Gf+DDAK8=
X-Google-Smtp-Source: ABdhPJzI0nkGIfncrdAXqQp6WyKC3qlSJLVSoeH6iy2jkHamZLNShm17dVZ1nl2jvuGpmWwxeuEsQw==
X-Received: by 2002:a17:906:1392:: with SMTP id f18mr16394990ejc.521.1596464459760;
        Mon, 03 Aug 2020 07:20:59 -0700 (PDT)
Received: from localhost.localdomain ([86.121.43.21])
        by smtp.gmail.com with ESMTPSA id p3sm15608432edx.75.2020.08.03.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:20:58 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: [PATCH v2 0/3] Add Actions Semi S500 pinctrl support
Date:   Mon,  3 Aug 2020 17:20:53 +0300
Message-Id: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset adds pinctrl support for Actions Semi S500 SoC.

Pinmux functions are only accessible for pin groups while pinconf
parameters are available for both pin groups and individual pins.

The pinctrl driver has been verified using RoseapplePi, the SBC for
which an initial support has been provided via:
https://lore.kernel.org/lkml/cover.1592123160.git.cristian.ciocaltea@gmail.com/

The DTS related changes, including the required clock support, will be
available in the upcoming patch series.

Thanks,
Cristi

Changes in v2:
 - Updated the pinctrl bindings according to Rob's feedback
 - Set the pinctrl entry in MAINTAINERS according to Mani's suggestion
 - Rebased patches on v5.8

Cristian Ciocaltea (3):
  dt-bindings: pinctrl: Add bindings for Actions S500 SoC
  pinctrl: actions: Add Actions S500 pinctrl driver
  MAINTAINERS: Set pinctrl binding entry for all Actions Semi Owl SoCs

 .../pinctrl/actions,s500-pinctrl.yaml         |  240 +++
 MAINTAINERS                                   |    2 +-
 drivers/pinctrl/actions/Kconfig               |    6 +
 drivers/pinctrl/actions/Makefile              |    1 +
 drivers/pinctrl/actions/pinctrl-s500.c        | 1727 +++++++++++++++++
 5 files changed, 1975 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
 create mode 100644 drivers/pinctrl/actions/pinctrl-s500.c

-- 
2.28.0


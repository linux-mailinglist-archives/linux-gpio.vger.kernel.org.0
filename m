Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11FDF6A1B7C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Feb 2023 12:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjBXLir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 06:38:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjBXLiq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 06:38:46 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026DF3802A
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 03:38:44 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id l25so13197497wrb.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 03:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vpzAS3s+Cknt6SusAxCgxYC801c1KRUgoMVD/9jWeaQ=;
        b=LmvkL2ICUxHCi5JnX6qNtHeCxijsatAjX0YJDWsunnS/ftTbbj5rUec4lgOaXqOG2k
         OpDu5xoXv2edDxi314/dISSVuwVZMfeGKGpURxqFRt3cjr8ppZhSGKglF1ur2WIC1s5/
         stmZRhkTs6gP0ldUe2814bB4iuPrAR1KQRCsKUW+eWXBPMYEmGM2hoJsVVXdij0PgJxD
         8rqa28nLJA5JdrD9i1FHgcr88B3R1vpKiPrszKKKZsKsgQyUVIR5iU5gHY16oGLw/9A2
         5cAG1oYsurtJHLshKAh3wliUMzdVFsAyOPMxdPVQpNaS7TQ8yXQCwHp9WBQBg1xDgtzk
         q0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpzAS3s+Cknt6SusAxCgxYC801c1KRUgoMVD/9jWeaQ=;
        b=uonCM8DDJfg5zLfOer43dnAPj+6R3NiJKGZ7OGKOJmfwwsrFI4UyiaPZe5K3OhfIgA
         s+LQcppZd6UEIOHNY0GJWPh4kQ7/D4GDxfgmVgKBerMWt8Z3gLTAgSSGA4W0U1rqjpfY
         +AdMhzPpE/7k++J1+Pu16KWUEjrk+jIlGc/rSQ59J42I1s4D/tDc8dN8TSrJdJO7noPL
         mEAdotXycLNWSc0k15h5Y15yaxTrcLavmsD5Vb8SB1c/6WCaGe7LHMLaJFygXEWsxegR
         MtCMN6WSOIT3c2bSEmfmwbUrP0cysS6sgEUwU4lEJJxFUFLIuBDBSDMG4qq7szNzhA+n
         S69A==
X-Gm-Message-State: AO0yUKU2VqRgsVwMkKAEBBUzi9A7sOjo72l/oni0YVBrC9zfCG+PN9Lr
        fWOTD9KvNwy4Xls99JBc/n1yZA==
X-Google-Smtp-Source: AK7set+ria7amvD5JkJfXPya3WzHNUc0HXURdmyuPFMgJvFkQ3DJiRy+b8Fi+vNUtyDXKbDyj9Qibg==
X-Received: by 2002:a05:6000:c1:b0:2c5:5308:859c with SMTP id q1-20020a05600000c100b002c55308859cmr11994396wrx.18.1677238722449;
        Fri, 24 Feb 2023 03:38:42 -0800 (PST)
Received: from jerome-BL.. (2a02-8440-5241-7427-e801-6f64-356d-2fd7.rev.sfr.net. [2a02:8440:5241:7427:e801:6f64:356d:2fd7])
        by smtp.gmail.com with ESMTPSA id l11-20020adff48b000000b002c592535839sm12769679wro.17.2023.02.24.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 03:38:41 -0800 (PST)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, tony@atomide.com,
        lee@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, Jerome Neanne <jneanne@baylibre.com>
Subject: [PATCH 0/2] Add support for TI TPS65219 PMIC GPIO interface.
Date:   Fri, 24 Feb 2023 12:38:35 +0100
Message-Id: <20230224113837.874264-1-jneanne@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO interface consist in 3 pins:
Two GPIOS are output only: GPO1, GPO2.

GPIO0 is used for multi device support:
- The input-functionality is only used in multi-PMIC configuration
- In single-PMIC, it can be used as an output

The configuration is static and flashed in NVM in factory.
Description tps65219.pdf chapter 7.3.13

Linux must not change MULTI_DEVICE_ENABLE bit at run time.

This was done for test purpose only to check input/output
correct behavior on EVM board (no access to different NVM config).

Tested on k3-am62x-lp-sk board. This board MULTI_DEVICE_ENABLE=0

Despite the register bits are out of order,
driver is remapping in natural order:
GPIO0 is gpiochip line 0
GPO1/2 are gpiochip line 1/2

 Initial version by Jon Cormier on TI Mainline.
 Ported upstream by Jerome Neanne


Link: https://www.ti.com/lit/ds/symlink/tps65219.pdf

Jerome Neanne (2):
  gpio: tps65219: add GPIO support for TPS65219 PMIC
  mfd: tps65219: Add gpio cell instance

 MAINTAINERS                  |   1 +
 drivers/gpio/Kconfig         |  13 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-tps65219.c | 167 +++++++++++++++++++++++++++++++++++
 drivers/mfd/tps65219.c       |   7 +-
 5 files changed, 188 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpio/gpio-tps65219.c

-- 
2.34.1


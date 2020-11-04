Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2682A6791
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbgKDPZS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730245AbgKDPZQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:25:16 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D22C0613D4;
        Wed,  4 Nov 2020 07:25:15 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c18so2742365wme.2;
        Wed, 04 Nov 2020 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQuHwpO9W6EfVdvEexDpXK2yxO3fyCBXGcRXbSH1WmI=;
        b=c38nYRy676SWec7f0EgQa52uS8Ebi+3J8uKzCJQDk9gB5bpQhQ4e5F2bGhFHdPfjf0
         xBEYxSsef4gaiiPl2cYqP0AfmUpoyzU8eJfRIepZqsFPxO+O4D1eEK9FyHXYOHz128cl
         9YYlLHiLwX5G31vpL9fcDVxPPGBkR0Rn8EUSm7bzwBH8u2vhf/2XEO3Qh77nybmF85Wy
         Zz+7L9LeU9oXaJ2MVTR0ajbe8+O3g2dB5x8EM3NwHq539FkQtZ5rfgqdLwB2EE0up2rb
         1kDiiJn2uHvSbP58nUQhwI51TykfBq9Suj0Wcz9VoEewhIhii6OkIdecwLSX+NPhGkIp
         zzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQuHwpO9W6EfVdvEexDpXK2yxO3fyCBXGcRXbSH1WmI=;
        b=iOu9guYMNhSCXvNd2UJZfqxHWjGVBzImQqrFgbW4BZfsQ8VqqCCy8Lq2Hngofw8I6d
         onbaDZMKnwiyiuSJMDJjQMmi9m2IX5hnA6MvQRPyMLHqeBYa8R1M0XEfl8yVhvwY8jJr
         eozgfbhAIFdVp8/s0X8EYgIvejo1nSPHYj4Bftq9BfotqvpEg7E6QbrchMZ45y4GQ7Uw
         XihA5R4Nrsjrzkt4IvejU7YfcRQU5o3OaAWKWq02Qg7VSL3zxqMGQAf4gEWcKuZi2AF9
         lzLtv58ZKmiVD5Zq+edbEIiTpvvxElm90vdDax9rtuzk+NeBqDJ4bP+pLpP2pJAf+Dnl
         TgMA==
X-Gm-Message-State: AOAM531dKlv5GEM2DngNY51bJRMXVe/Z0SsICyUDxGVBCjoxfo/fPo25
        WRshAHu8uFXUqk4L9log/Dk=
X-Google-Smtp-Source: ABdhPJxvk8OnLYlJgX/MwAUVTAxCCGztXI7d3X1he06S/VWdeVwaH2YrOHL14r573YdVy4NfEQSKBw==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr5142035wmj.146.1604503513917;
        Wed, 04 Nov 2020 07:25:13 -0800 (PST)
Received: from srv-dev.mgt.openheadend.tv (aob-ovh-4.easytools.tv. [51.210.1.153])
        by smtp.gmail.com with ESMTPSA id t2sm3050077wrw.95.2020.11.04.07.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:25:13 -0800 (PST)
From:   Arnaud de Turckheim <quarium@gmail.com>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, vilhelm.gray@gmail.com,
        Arnaud de Turckheim <quarium@gmail.com>
Subject: [PATCH 0/3] gpio: pcie-idio-24: Fix IRQ handling
Date:   Wed,  4 Nov 2020 16:24:52 +0100
Message-Id: <20201104152455.40627-1-quarium@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch set fixes the irq_mask/irq_unmask functions and enables the
PLX PEX8311 local interrupts.

With the current version of the driver, gpiomon (from libgpiod) or a
poll(2) on the sysfs value are not working. According to
/proc/interrupts, there is no interruption triggered.
The main issue is that the local interrupts are not forwarded by the
PEX8311 to the PCI.

There is also two bugs:
    - The IRQ mask is not correctly updated when unmasking an
      interruption.
    - The COS Enable Register value is not correctly updated when
      masking/unmasking an interruption.

It seems this problems exist since the initial commit.

Arnaud de Turckheim (3):
  gpio: pcie-idio-24: Fix irq mask when masking
  gpio: pcie-idio-24: Fix IRQ Enable Register value
  gpio: pcie-idio-24: Enable PEX8311 interrupts

 drivers/gpio/gpio-pcie-idio-24.c | 62 ++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 6 deletions(-)

-- 
2.25.1


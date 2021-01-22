Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DB3300C62
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 20:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbhAVTVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 14:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728912AbhAVTAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 14:00:18 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60962C06174A;
        Fri, 22 Jan 2021 10:59:32 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id v24so8977842lfr.7;
        Fri, 22 Jan 2021 10:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MOK+SNdz82j3HZTUsGdXmZ6Kz3pWK/Eyg8VN80MSbBY=;
        b=AsthSBTZnNnzK54+RE9tiBb90JGdcWiO80jvBxiDSpwkb9wn7rcFglUXsj8QSTKJyA
         PM96JuCmuT7PAupLCfLZcAJtbJNm1L54E51RCOV8vEiKxZBzsKEg6+6WK2Ovbuv3KuPc
         lbLC5PxqRPzbBBsNCQrkEzReZDNtuWufgv59X5tBbtZYdRgs9eqOSMrlWEieu1NJnF9X
         JelbnGiSAcEIH30pzJjYZgwPeTp7QWA9w5E3etjfA0V+nLLGytPLRwnUmoajmQcOvxaq
         MCfc1GVzO8ZfxLE/TDQlhUKHYpy9hcDwoGgExam1NOHQXBwobBP3icHFps3OLm5H8YKN
         j01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MOK+SNdz82j3HZTUsGdXmZ6Kz3pWK/Eyg8VN80MSbBY=;
        b=GuHPG/U93k736cSLbmL6kctv+D1TNExOe9P/hNOVFXBV9f8+ohdZbV+9bjDsxv0ZoG
         vlgNlfZaO+KOD+jsc4DkPUg+Xk4K6NrhasU5CZoYR4oKW5GQuLVJojKNgY2CVwn7bqw/
         Un+tkRPa6A6NjQJ+0hcZ0A40/mWCyCqPRt80qGowtgR6Di7xLxDXt+kRaM3O1E2gA4Bg
         v5PpNoi0qkSxlC0iS2+uFr3Tmm6+g+K8/1axaMMM4pmPpdV8qEkcYME5Xy9O3mkBXCZt
         G7ZlcsPIZZfP9Yplgaz0dSbhA57o4wyWjytMXR50HFQiphBKDOv2tsA3LZS924Vdt/H8
         Wazg==
X-Gm-Message-State: AOAM530GJivWv522ne11w8uNoL9CxJT09yHxeHCoxR/zPTLwFZgXx6Iq
        LO6UYgUrztPuxz1d8Yu4Rlk=
X-Google-Smtp-Source: ABdhPJzySQalgUufEhoW2JyMtunwgufe2IdqitUXqJtr4L9JjdUtxRERr3OmFr3V57Mz0Fz9z2Ohbg==
X-Received: by 2002:ac2:5485:: with SMTP id t5mr2786020lfk.191.1611341970989;
        Fri, 22 Jan 2021 10:59:30 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 19sm994783lft.90.2021.01.22.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 10:59:30 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Support building gpio-tegra driver as loadable module
Date:   Fri, 22 Jan 2021 21:55:40 +0300
Message-Id: <20210122185543.16554-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This small series adds modularization support to the gpio-tegra driver,
i.e. driver now could be built as a loadable kernel module.

Dmitry Osipenko (3):
  gpio: tegra: Use debugfs_create_devm_seqfile()
  gpio: tegra: Clean up whitespaces in tegra_gpio_driver
  gpio: tegra: Support building driver as a loadable module

 drivers/gpio/Kconfig      |  2 +-
 drivers/gpio/gpio-tegra.c | 31 ++++++++++++++++---------------
 2 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.29.2


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB8B1814AF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 10:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgCKJWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 05:22:55 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38744 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbgCKJWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 05:22:55 -0400
Received: by mail-lf1-f68.google.com with SMTP id x22so1059351lff.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2020 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FFOIcJ8aA8MC+A81Xp31rj9IpZBEBuoyDecAuyY6Qf4=;
        b=xdd2sbdbLzlr/nvNeuw/etWKTZ9dXOgTeJCcBl/rDbC6k2BtGDtF4fya+FHqGrQSYj
         60GBpnSYiQxlY90g77NId/kKZ+IEUoVyUrd8JX74q2/23WaR+9bO6SsmhHVNYfqheaX2
         SJGWcZgFE4ec+R6wpl9vN10iOZzi9rJNS0z52CKHUEeew4gV1Evm00Un0ja38T4rS98s
         rmDlKEc49WyVAPiHevyCB+6Vw21w/zEEPBUhSVY+kB0198Yxox939yphpGS/Z+CkKuEa
         iyERpwXNh576qjRmgnGFKTr1iT+8obdmfCtq1RWcPpqqvFzvBBHf+WdgJx7WqUW3+OvK
         pqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FFOIcJ8aA8MC+A81Xp31rj9IpZBEBuoyDecAuyY6Qf4=;
        b=SSuxzLB8WN4njCbMUeuxUbwhvNSsthECz7HQPaqxjyRiZanSRlrbVFxx7LDw8+jOYE
         4wrSbrzayy+oXm288ZXmrD1vzU0NRy+P0Q/e5lEI1S/ua0/yfR9aGIV7SsusTVQ6aA0N
         nxqJGfRn9SKHQwuAd5daxTn56xk+stjZuTJrMlkpObF551mf73u1ZnLa5/Glsvm2kVL0
         3Nr6sjEjPHvVDGYbfwXiacxfuk2de8+OR4PHcebRXiyGuoIUpuqsXy6wNxr6kRQZuP8q
         R15dAZJZVSdEbtvGspOtFmcF+qxhn3eR03/pplFk+bc16n5BmTwmWKBEAb+wMfH4vhtv
         KrLw==
X-Gm-Message-State: ANhLgQ1QS8Pv+DIBYkR7CfhpsUQZPTjWgz+OJeBLYbsXvUaBXTE0MJU8
        PitLmWJy2LQTODL42qt3/pxtvwvJqy+NJHaU1TCz8A==
X-Google-Smtp-Source: ADFU+vtB2lW6BTUCdwkuQqNNimAuA5Ox6/OlefcUhjx2f4403d6W229KlOQE588qAuFLnoqg7laaGbEjv0ck85D61VY=
X-Received: by 2002:a19:c18e:: with SMTP id r136mr1524001lff.4.1583918573645;
 Wed, 11 Mar 2020 02:22:53 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Mar 2020 10:22:42 +0100
Message-ID: <CACRpkdYZbx_3AgtTYSwtBcr0G4PisWt8As=T7nqq60rTPXjYCA@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some pin control fixes for the v5.6 series.
It comes down to memory leaks in the core and
driver fixes. Some should have been sent earlier
but they kept piling up and the world is just so full
of distractions these days.

Please pull it in.

Yours,
Linus Walleij

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.6-2

for you to fetch changes up to 1cada2f307665e208a486d7ac2294ed9a6f74a6f:

  pinctrl: qcom: Assign irq_eoi conditionally (2020-03-09 16:31:34 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.6 kernel series:

- Fix some inverted pins in the Meson GLX driver.

- Align the i.MX SC message structs causing warnings from
  KASan.

- Balance the kref in pinctrl hogs so they are actually free:d
  when removing a pin control module. We haven't seen it before
  as people don't use modules for pin control that much, I
  think.

- Add a missing call to pinctrl_unregister_mappings() another
  memory leak when using modules.

- Fix the fwspec parsing in the Qualcomm driver.

- Fix a syntax error in the Falcon driver.

- Assign .irq_eoi conditionally in the Qualcomm driver, fixing
  a bug affecting elder Qualcomm platforms.

----------------------------------------------------------------
Charles Keepax (2):
      pinctrl: core: Remove extra kref_get which blocks hogs being freed
      pinctrl: madera: Add missing call to pinctrl_unregister_mappings

Leonard Crestez (1):
      pinctrl: imx: scu: Align imx sc msg structs to 4

Linus Walleij (2):
      pinctrl: qcom: ssbi-gpio: Fix fwspec parsing bug
      pinctrl: qcom: Assign irq_eoi conditionally

Mathias Kresin (1):
      pinctrl: falcon: fix syntax error

Nicolas Belin (1):
      pinctrl: meson-gxl: fix GPIOX sdio pins

 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 13 +++++++++++++
 drivers/pinctrl/core.c                       |  1 -
 drivers/pinctrl/freescale/pinctrl-scu.c      |  4 ++--
 drivers/pinctrl/meson/pinctrl-meson-gxl.c    |  4 ++--
 drivers/pinctrl/pinctrl-falcon.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c           |  3 +--
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c     |  2 +-
 7 files changed, 20 insertions(+), 9 deletions(-)

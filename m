Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9663EB347
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 11:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238823AbhHMJWX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 05:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234716AbhHMJWX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 05:22:23 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A446DC0617AD
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 02:21:56 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z2so18864482lft.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 02:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=MIjzmWOcO2qIDbveR8D+xuH4rtgwCBu1WunRV4Qrdcc=;
        b=xnADoA8/sVgouYWhh2X/p/FFDTnxnWQHLA5tbe/x7qDpeVVM6ZI5Kd6QNQ6i+w12Su
         ZkYMR5D1x0jqkGsi4NLTNnYE3rzd2G8KwE9KSEDh09VUi0OzZjtYYA4FCZATBiSz4h3G
         psrgPsQm9hMh0qm/hbgZGckCS1rMuDLpbfIEh+k0rH0htE8PWFKqdx+XD08qIU2UWMIG
         /zoW3J6Clj05OR/0y6F15xDWTYWHwzrPAlhkXTFu+s9+2acyxPp9KLzVZuQt3MC2XOFZ
         TQud3lSb/8mPJnjpE8TuLmAnBNOP/Dc9HBkx5zksnYki9JItNZCJRb3NDduiHkWhTCxk
         1N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=MIjzmWOcO2qIDbveR8D+xuH4rtgwCBu1WunRV4Qrdcc=;
        b=AAwFnPi2wRnR1/FOIyeFeysl50hIpllhVx2+pmn/pLSWf8r+Q1BL4jOM76XBAcqrIe
         5EfXDCYMKEymOFDt5us6uj3wYkxbJ33L4z69WFMjfLVCkNfOOjic9JZ8mnxGsEkiI6zM
         NtnGOyxhHP4NIGZpW5liuXtdMXzt/6kQHQlkSnQOpQ35FYNM+mOfVJY08RTS9EVZ/m3P
         OIaLg77DwG7CUA3ibbFt0+qAR4HEVhyoNt7FiTsCLPHR/Q5WMYRLVQq21zHSg894Wsf8
         6v31rC3kAqFhb9H0WsTOCILFK2rVnPXNzmXvHb/E65a1owWnSeQvM3qLwpyurmFHtRym
         crQQ==
X-Gm-Message-State: AOAM530SUblRtg5y6wASY/ZhTTj1sY3FWyJNvmTsS6tLOvXhYkaFjEMZ
        S+t7VtcViMdXnOaJGtfpkKw2ApoEs4JJQ5z0XZVD8FlfKbXysA==
X-Google-Smtp-Source: ABdhPJyj5QBzVVFVD1kPu1OwFdUgT/EQiQcXMJnBvNlQX+L55coE2v3ZmacTQ/IM8xQCR24bGiKh3eeYgzU35ywglu0=
X-Received: by 2002:a05:6512:1084:: with SMTP id j4mr1056599lfg.586.1628846514730;
 Fri, 13 Aug 2021 02:21:54 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Aug 2021 11:21:43 +0200
Message-ID: <CACRpkdZzV_cCt6QPTHRtUNgWAJt6grE=CFYJH-qjnsP_Z0nnbw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.14
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is an assortment of pin control fixes of varying importance,
the most important ones affecting Intel and AMD laptops turned
up the recent few days so it's time to push this to your tree.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.14-2

for you to fetch changes up to c4b68e513953c3370ce02c3208c1c628c0b86fd3:

  pinctrl: amd: Fix an issue with shutdown when system set to s0ix
(2021-08-12 11:16:40 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.14 kernel series:

- Fix the Kconfig dependency for Qualcomm SM8350 pin
  controller.

- Fix pin biasing fallback behaviour on the Mediatek pin
  controller.

- Fix the GPIO numbering scheme for Intel Tiger Lake-H
  to correspond to the products that are now actually out
  on the market.

- Fix a pin control function itemization in the Sunxi driver
  out-of-bounds access bug.

- Fix disable clocking for the RISC-V K210 pin controller on
  the errorpath.

- Fix a system shutdown bug affecting AMD Ryzen-based laptops,
  the system would not suspend but just bounce back up.

----------------------------------------------------------------
Andre Przywara (1):
      pinctrl: sunxi: Don't underestimate number of functions

Andy Shevchenko (1):
      pinctrl: tigerlake: Fix GPIO mapping for newer version of software

Arnd Bergmann (1):
      pinctrl: qcom: fix GPIOLIB dependencies

Damien Le Moal (1):
      pinctrl: k210: Fix k210_fpioa_probe()

Hsin-Yi Wang (1):
      pinctrl: mediatek: Fix fallback behavior for bias_set_combo

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.14-2' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes

Mario Limonciello (1):
      pinctrl: amd: Fix an issue with shutdown when system set to s0ix

 drivers/pinctrl/intel/pinctrl-tigerlake.c        | 26 +++++-----
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  8 ++-
 drivers/pinctrl/pinctrl-amd.c                    |  3 +-
 drivers/pinctrl/pinctrl-k210.c                   | 26 +++++++---
 drivers/pinctrl/qcom/Kconfig                     | 63 ++++++++++++------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.c            |  8 +--
 6 files changed, 73 insertions(+), 61 deletions(-)

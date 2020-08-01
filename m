Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAE2F2352B6
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Aug 2020 16:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgHAO0E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Aug 2020 10:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgHAO0D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Aug 2020 10:26:03 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D35AC06174A
        for <linux-gpio@vger.kernel.org>; Sat,  1 Aug 2020 07:26:03 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id i10so480245ljn.2
        for <linux-gpio@vger.kernel.org>; Sat, 01 Aug 2020 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yJ7LO/KWn3KV/WgsxRJ7hw2ck7TTCFfaXw9IbubmYAA=;
        b=BRZSSnrbn2XHe9dJtOysuyNb4Stjvzcuq6gbBjGmtK4+qRv3HSF5UBbnG7v+vV8noL
         44RTeX1k4eHVjWFH+Gmj/R9q061Fxb/oq+/VjM8OohBe6E7SH0NFpSOtLsyqnne6JEFk
         VxVOuKIHDoTfX9R4eil9ZOtES1mH2e0aQQ59qVQ3QwtoULlLc981eTAM07eDR+TIRPDV
         u0qcPM186A+Uusg3lLP6KGR5QBb4Y+UNi99tw9SWGbu/6gmRZvyTqfXZ/y4g+CZyeAq7
         w2keoWodm066iLP0VbEMHlAnFosIyXroqL2lBmbUflT75pH23SVk+WYs0r4G+EFsKCCk
         GzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yJ7LO/KWn3KV/WgsxRJ7hw2ck7TTCFfaXw9IbubmYAA=;
        b=MoRTT3oVonl2FHqUDaFoDnF9riCFp/SFy07GkGqXlV8N9N/g8n+i7SM5JnPRHuOtV8
         MI3danxLtHnZZJIjG8AczBsREaHYOWdbDK+vvX8nMaadyRZj74SrQ5Uf9dVZ8jVtXVu9
         2tTDw9RT54BuaVQta+4uWdh9X2vQzuyIrvgwL0bQotydhy4LGjYHZ2plEt5xn992uhvb
         8nOTxEPHbqvR02vKmSa3aYtWt0snTKTpfKWggXKYb9v8E9pZG+7p734FopmVEjhfQgYv
         Kcn9gVEHNiOCi6OQgBDdGsE0Td6rOt5M8msBErhonk1sRJYjEU303EaRsfpGIgHBfmZO
         ZvZQ==
X-Gm-Message-State: AOAM532cNxfHKs4DhOwC+QExZyXlp1Gnc99SG8fIrOuKp4ceRmCgXIkJ
        zdtihBZKnYoz2XjZbKiHgZEwUoymGxoJj1/GvpVN4/KQX5wriA==
X-Google-Smtp-Source: ABdhPJwxy6+eJv8meeF/Nw2r0qDlmYST+HPE7SBbRIryhCo2xEQI9/laUYvdLxXaPnOhvgS4DYS1bf/PptZZXQDVWbY=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr3688902ljc.338.1596291961747;
 Sat, 01 Aug 2020 07:26:01 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Aug 2020 16:25:50 +0200
Message-ID: <CACRpkdaiGkpOv3fr4+PKdTiQr0jbjhMUkYo+OnHuC9yqJVvQzA@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.8
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

a last minute pin control fix to the Qualcomm driver.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.8-4

for you to fetch changes up to c3c0c2e18d943ec4a84162ac679970b592555a4a:

  pinctrl: qcom: Handle broken/missing PDC dual edge IRQs on sc7180
(2020-07-16 15:41:41 +0200)

----------------------------------------------------------------
A single patch to the Qualcomm driver fixing missing dual
edge PCH interrupts.

----------------------------------------------------------------
Douglas Anderson (1):
      pinctrl: qcom: Handle broken/missing PDC dual edge IRQs on sc7180

 drivers/pinctrl/qcom/Kconfig          |  2 +
 drivers/pinctrl/qcom/pinctrl-msm.c    | 74 ++++++++++++++++++++++++++++++++++-
 drivers/pinctrl/qcom/pinctrl-msm.h    |  4 ++
 drivers/pinctrl/qcom/pinctrl-sc7180.c |  1 +
 4 files changed, 79 insertions(+), 2 deletions(-)

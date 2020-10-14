Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350D428DC19
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbgJNIyq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730266AbgJNIyh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:54:37 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6A8C045879;
        Tue, 13 Oct 2020 23:28:05 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h4so1040565pjk.0;
        Tue, 13 Oct 2020 23:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xobD5fu2x27uFyHjSB9lqJa5omeksdS0WQuaqlpXbvA=;
        b=hmHrOXRvWxXgySFk436y4vl7vJ5Zqpu2b/XkFm5T6S1jKsWTtFkibM/TOubzU5xoI5
         4PtAUXZMAi43Fvl3F1rFF9VelYElpnXxwKU+fcFuDcxidNb72Mu4VmRV6LmTF1Lr30F0
         ZDEZWxoZMttpHRa8KMFc0ytDPF19ikn++2tV7Rq3srfOG8AOr2EVu0LYWN9giLwqTwZf
         jdq9WAH7ERNgmdzfuM4oh76SeMIgqifp2h4CtMXKZ9k79jQMtKTWb5OOODC0r013Maq8
         tNGuR9Q/jiwmEYDT6ytUK7V6jpfTJIJmNdsEnAvN6q41mVItRuiaDgVHaAXTxzmmfuQf
         390g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xobD5fu2x27uFyHjSB9lqJa5omeksdS0WQuaqlpXbvA=;
        b=RvrcbtjIOtX1XxlJC3uYOAwXV2c47Q/Mj6Rv6Djvu4WdRLd/KhhgKSvQTiI/NEcIX7
         DFL0TQm6rx4fG4L3D9qh2fhKQevPMJ9hPDubMfUR0ywJBzUXvA8HR/ip1P+qi5STLow4
         uozsL0jGRUFIAasSywg7JGcjFxEWrcUrK3dI0vc4VOBsUO0yTPtKhMZItC5G9WkIhlpj
         Eu9xDd3mich+9MKj0pefx/yiUjGrzJ0XowwmLF7bJCROXWAHV+hEBLQLbfA4tGPR70UI
         jYeXiZgy5/V//RtUX/KJbM8F+OXkJxxPRBrxmB7w6r6WVOkOepDREjnWGCG/Fyv8BiVN
         YfAQ==
X-Gm-Message-State: AOAM532dsLL5JlHayy9VhWn6G/C2SOYqfmsBztLWGhxd7LXrIv1UNjJ1
        JilEmy9TPeOF/xfOsFoczPdRdlFgNnxObg==
X-Google-Smtp-Source: ABdhPJyJJmSI+VnnkDxSdhl1Ul6CDvySeFfFExb8phWHiHDXOg3OSDYfro77lwlyCp88IrA/pqPf6Q==
X-Received: by 2002:a17:90a:e997:: with SMTP id v23mr1929324pjy.195.1602656884953;
        Tue, 13 Oct 2020 23:28:04 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id q24sm1803266pgb.12.2020.10.13.23.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 23:28:04 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/3] gpiolib: cdev: allow edge event timestamps to be configured as REALTIME
Date:   Wed, 14 Oct 2020 14:27:37 +0800
Message-Id: <20201014062740.78977-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch set adds the option to select CLOCK_REALTIME as the source
clock for line events.

The first patch is the core of the change, while the remaining two update
the GPIO tools to make use of the new option.

Kent Gibson (3):
  gpiolib: cdev: allow edge event timestamps to be configured as
    REALTIME
  tools: gpio: add support for reporting realtime event clock to lsgpio
  tools: gpio: add option to report wall-clock time to gpio-event-mon

 drivers/gpio/gpiolib-cdev.c | 21 ++++++++++++++++++---
 drivers/gpio/gpiolib.h      |  1 +
 include/uapi/linux/gpio.h   | 12 +++++++++---
 tools/gpio/gpio-event-mon.c |  6 +++++-
 tools/gpio/lsgpio.c         |  4 ++++
 5 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.28.0


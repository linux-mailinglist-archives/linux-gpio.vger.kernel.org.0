Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313E11930C4
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 20:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgCYTA2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 15:00:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37811 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgCYTA2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 15:00:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so3738179ljd.4
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zlA6YBylA5M0mOiSW9L4RZATO8uQW1547KHnBaE+ghE=;
        b=knqpvRSgG9yGm0bcVOsMEg3LvVRUbyXthnu83i4ti20kLguZ/KlzQkdTfjqia6bIDH
         RqmJAe/OyUbdof6Ow8OxSSoOQzMiY4DGsWxQB65pNrqfxeUNzYsSVgQoJawSSjs9De+V
         PuDskXXM6Iz+hplJaWkpRXl6GJI0o8Y4HzpHQrUOoTKuHA9Q55T8ulUKTSrSRL2hTuZq
         +PmnqOgkf4QH36m6JaQ+rl2dQ64wkVJMANXDA7BBpm9RD9l5c17ORPRuLKOIIywYd9RX
         e7EWrwiv8CmRvN3qKfFI39QafKyjFAB/p+bE0T6BzgjT2o5YeRq8aTZt+GoTbzdHHVxx
         rWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=zlA6YBylA5M0mOiSW9L4RZATO8uQW1547KHnBaE+ghE=;
        b=jUHFKBOSAccGOnCN/86rdwHpYRWl2mQgsb9+VQtWluUfF1qKVEB1imMVBIgrR/HTa7
         Q5qIWyVO6Hwy36CzTiAVOyVN6xMsFzbJB8fLjrzfvD50Av4xAtRO4kmDdfG/bLRJ6Lt/
         LuezYUCWR5Lp4bHiM9neFndE4WFpGN4b7aUg7/7GXyQlalFYP65oZX7pXx0ofoTQhxxi
         bDn++jzsI5KuUp6DjkCo/qIWZn/7E4rXWmpJ/LNxqek4Mu1fpEJE3zQU0tzaJvFNFcBh
         oAOI9Oylw5B2r/WcYbrpFIpJLFN82hBh2xXo0QA+VUwEXqEv6Fy0/CBQr4E4ZumyprwN
         TbzQ==
X-Gm-Message-State: AGi0PublILAy8SWy/n6OspsT7ds/pi80BShUIyHeNrJeUkJ/7SM4ggwO
        dkpoZ7awouil3+6drIL2R/x0UuSmbulAWrPv/mvruQ==
X-Google-Smtp-Source: ADFU+vu0U/GoBhKGNLp7JbO4SycFKqeluj/hk+w11ceallgxqj/4DRnGJYVsYhboVT3+cb41AjXCTc6AVCyjPssN6vg=
X-Received: by 2002:a05:651c:1026:: with SMTP id w6mr2801452ljm.168.1585162825609;
 Wed, 25 Mar 2020 12:00:25 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Mar 2020 20:00:14 +0100
Message-ID: <CACRpkdY8d=zG-z0Ju7k3Suj+seiexAdyQezcMxWV5rKHJhE3+Q@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some additional GPIO fixes for the v5.6 series.

Sorry that it is coming in late, we had some issues with retagging
one of the patches due to problems in -next but overall it is just
bad timing and me being a bit snowed under.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit f8788d86ab28f61f7b46eb6be375f8a726783636:

  Linux 5.6-rc3 (2020-02-23 16:17:42 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.6-3

for you to fetch changes up to 0c625ccfe6f754d0896b8881f5c85bcb81699f1f:

  gpiolib: acpi: Add quirk to ignore EC wakeups on HP x2 10 CHT +
AXP288 model (2020-03-24 10:06:54 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.6 series:

- One core quirk by myself to fix the .irq_disable()
  semantics when the gpiolib core takes over this callback.

- The rest is an elaborate series of 4 patches fixing Intel
  laptop ACPI wakeup quirks.

----------------------------------------------------------------
Hans de Goede (4):
      gpiolib: acpi: Correct comment for HP x2 10 honor_wakeup quirk
      gpiolib: acpi: Rework honor_wakeup option into an ignore_wake option
      gpiolib: acpi: Add quirk to ignore EC wakeups on HP x2 10 BYT +
AXP288 model
      gpiolib: acpi: Add quirk to ignore EC wakeups on HP x2 10 CHT +
AXP288 model

Linus Walleij (1):
      gpiolib: Fix irq_disable() semantics

 drivers/gpio/gpiolib-acpi.c | 140 ++++++++++++++++++++++++++++++++++++--------
 drivers/gpio/gpiolib.c      |   9 ++-
 2 files changed, 122 insertions(+), 27 deletions(-)

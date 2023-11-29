Return-Path: <linux-gpio+bounces-662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E707FD655
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 13:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF60C1C20FCE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 12:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8171DA20;
	Wed, 29 Nov 2023 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1qIwRk7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3E8F4
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 04:09:15 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5c8c26cf056so69010557b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701259755; x=1701864555; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZSr6rQHau8MO7tZUGmumMJZcmC8BlwDTZpr5Z2aRZIc=;
        b=N1qIwRk7DcQkI2LeJc/AIAkNCSvXncBESWESRvTdWPOqxXlre170ruoDAZzOZh755D
         Wznh06qBPIBUMcp+HvFa8Ei+le3c522MpHt/vaR/kKuTIOE39Q28d9wFXrGKiL2+mWl5
         aSMEN6yKCS9SngtnjpqaZvd2rJcwD8VZVprYT7aM9ejyjy4Cpe8XMAqTSiDsraE3gAQY
         4PfqdLFvTa/2Dj750LkH79FMo2xCrYigdAM4pw10wYBpY9Ew+Yegiaw2wuSIDi1h8dYa
         wZ9EI88N+NHW9Ytg9l/OM2Yrloyw85Cxk+oFpMTqGU5G4M9Kc4Df+zVZOf0PM2xqcESr
         BOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701259755; x=1701864555;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSr6rQHau8MO7tZUGmumMJZcmC8BlwDTZpr5Z2aRZIc=;
        b=BC6V2gN+sO0ZzKTtN4LBPHYbB1ckWR4atNviioC/WgxhiUVJAyyzjR+lBPcvbIS84Z
         kUSJaaFoTcl0bY5ERTzGDL0iLW0qk093Bqzc1CHN13EK/DKDKzxtUooutRONpKGQ5SLt
         INuFeIxkHpzBUIvGFHZYcyxvvfPEYYxAPp5MGKw6IjVEs13s5QYoWIGIiGAABTQVCSUx
         /5uRRPoCuztqP6VohLKnCMxjslr1pTUj9O5kv9eN5l31Ij1J093fAbZ9B70aOHvgy2T2
         9DV0nkejkujjL0H0fo9iPHtqtc7gnOmSBBeE1f0g+YgOsp3PqQ1W3mDUWROqUrd2AoED
         PWvg==
X-Gm-Message-State: AOJu0YxuhnuxoR/uw+xhRlR1l9DHaIhqWXtZPHl1VUdufdnB2X2X+a6r
	q2LD4Wb0VUQl6dnLyELJVZshGMApxrhb2nlsRBxzbbiwf3US4blnENI=
X-Google-Smtp-Source: AGHT+IH6JmLCX/Ua5iQPL4qC+Z6sBA9I2zbRBkLCLpvFOiskMyUh6g7GBo6ZiHupJDMVhzO5hR/0/O810sivJT9SRIs=
X-Received: by 2002:a05:690c:4613:b0:5d0:1d51:2e10 with SMTP id
 gw19-20020a05690c461300b005d01d512e10mr9159385ywb.23.1701259755133; Wed, 29
 Nov 2023 04:09:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 13:09:03 +0100
Message-ID: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
Subject: [GIT PULL] Pin control fixes for v6.7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Maria Yu <quic_aiquny@quicinc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Chester Lin <clin@suse.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

this is a first belated round of pin control fixes for the v6.7 series..

The most interesting patch is the list iterator fix in the core by Maria
Yu, it took a while for me to realize what was going on there.

Some details on the fixes are in the tag.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.7-2

for you to fetch changes up to 90785ea8158b6923c5d6a024f2b1c076110577b5:

  dt-bindings: pinctrl: s32g2: change a maintainer email address
(2023-11-24 11:21:55 +0100)

----------------------------------------------------------------
Some pin control fixes for the v6.7 cycle:

- Fix a really interesting potential core bug in the list iterator
  requireing the use of READ_ONCE() discovered when testing kernel
  compiles with clang.

- Check devm_kcalloc() return value and an array bounds in the STM32
  driver.

- Fix an exotic string truncation issue in the s32cc driver, found
  by the kernel test robot (impressive!)

- Fix an undocumented struct member in the cy8c95x0 driver.

- Fix a symbol overlap with MIPS in the Lochnagar driver, MIPS
  defines a global symbol "RST" which is a bit too generic and
  collide with stuff. OK this one should be renamed too, we will
  fix that as well.

- Fix erroneous branch taking in the Realtek driver.

- Fix the mail address in MAINTAINERS for the s32g2 driver.

----------------------------------------------------------------
Antonio Borneo (1):
      pinctrl: stm32: fix array read out of bound

Charles Keepax (1):
      pinctrl: lochnagar: Don't build on MIPS

Chen Ni (1):
      pinctrl: stm32: Add check for devm_kcalloc

Chester Lin (2):
      pinctrl: s32cc: Avoid possible string truncation
      dt-bindings: pinctrl: s32g2: change a maintainer email address

Linus Walleij (1):
      pinctrl: cy8c95x0: Fix doc warning

Maria Yu (1):
      pinctrl: avoid reload of p state in list iteration

Tzuyi Chang (1):
      pinctrl: realtek: Fix logical error when finding descriptor

 .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml           |  2 +-
 drivers/pinctrl/cirrus/Kconfig                              |  3 ++-
 drivers/pinctrl/core.c                                      |  6 +++---
 drivers/pinctrl/nxp/pinctrl-s32cc.c                         |  4 ++--
 drivers/pinctrl/pinctrl-cy8c95x0.c                          |  1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c                       |  4 ++--
 drivers/pinctrl/stm32/pinctrl-stm32.c                       | 13 ++++++++++---
 7 files changed, 21 insertions(+), 12 deletions(-)


Return-Path: <linux-gpio+bounces-1797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D781C130
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 23:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 525381F21840
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 22:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5F578E84;
	Thu, 21 Dec 2023 22:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFqRmhGA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F0878E64
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5e89ba9810aso12626047b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 14:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703199056; x=1703803856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6NSdayl0t2KVF215soihYjUo/9+OE7MdLIOTA1vidAU=;
        b=hFqRmhGA70RfauA9k159PZLNATls5/CTYxPhm+6PxVbWrSwtH7p1UtXoYCkQkC7hXM
         A/fDQdYsEL1I6iIQ2ddw/ERZWh3ATWfJ8qcX6+xDUiWuRYglE06QIQLynLzgSFQeladg
         lQQBDMytOBd+w9WcDibksfLSQVATF9uzJa7PusfI1wfFSO2vLjMzUGQfy/lT5iZEOKmy
         Z1qP58TyV0HcEV+lo6+vxIX2f7tkpltVq2VE7C/+4yGYqqe6uK3MZf7cp8aTuA8V0jRP
         DgpFh9S31zHT5a4DSDoI6BVqkDd50FMS8INqs+BarVms0U5aco42QsT3T0L/fQt5eizQ
         mpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703199056; x=1703803856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NSdayl0t2KVF215soihYjUo/9+OE7MdLIOTA1vidAU=;
        b=moto0wbTiYWxZfdqxbn1G+41qoktuDd4Ddayp6aKh/ccoVX2cwEGhZFnb8hBj9ch1U
         WcerJI6Pzc9RN7272/xES7BMynos8tSyHGJCtlxYnz1YYLr8/gkUglZSHpd2Eiee1jOJ
         HzDncT7Qi3gP1aW3eCYNBE8hse8zW+tPemzk93BnuEC24jXme8MguhWT6EZsrI0MqnHr
         MQJdx6LUBzFyWiB8o0bHrJTWMEieXoc/hlVaYHbw5JO+BqJ/AsyYFufEVfsVaPCR8TU6
         FFhZj1CcxJCOzCTVS+bk8V7QjHTGW+KvTCGNPvLqmJdP934sI9A3FyJ1pkFEaR6CblLm
         yzDg==
X-Gm-Message-State: AOJu0YxzmWHw9vf2aMCD7fYahe1uxO0tKESADFcSNMo3vKet8QPEXXPk
	y+utRUQnq9kAdHHNU/XoU+BViQgy2QMvT732rtz3vPLU5fJCHgiFnbj7XflfwBs=
X-Google-Smtp-Source: AGHT+IFBUZXIyGBMhCvEfUqDYzVUs1SN9CNeH7VZYaba5ZgQkjg3KjvQ1uTpx5YbyJI9Ub1oRGyeZ35Rh8NQ+31T49U=
X-Received: by 2002:a0d:d713:0:b0:5e8:9a64:9b5d with SMTP id
 z19-20020a0dd713000000b005e89a649b5dmr565454ywd.34.1703199055931; Thu, 21 Dec
 2023 14:50:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Dec 2023 23:50:44 +0100
Message-ID: <CACRpkdY=R+tyyFxQVuXJARqVDRXCi_A=JvYACWJ6L5JQa_8pHg@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here are some driver fixes for v6.7, all are in drivers, the most
interesting one is probably the AMD laptop suspend bug which really
needs fixing. The Freedestop org has the bug description:
https://gitlab.freedesktop.org/drm/amd/-/issues/2812

More details in the tag and changelogs.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 33cc938e65a98f1d29d0a18403dbbee050dcad9a=
:

  Linux 6.7-rc4 (2023-12-03 18:52:56 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.7-4

for you to fetch changes up to 14694179e561b5f2f7e56a0f590e2cb49a9cc7ab:

  pinctrl: at91-pio4: use dedicated lock class for IRQ (2023-12-21
09:05:02 +0100)

----------------------------------------------------------------
Pin control fixes for v6.7:

- Ignore disabled device tree nodes in the Starfive 7100 and
  7100 drivers.

- Mask non-wake source pins with interrupt enabled at suspend
  in the AMD driver, this blocks unnecessary wakeups from misc
  interrupts. This can be power consuming because in many cases
  the system doesn't really suspend, it just wakes right back
  up.

- Fix a typo breaking compilation of the cy8c95x0 driver, and
  fix up bugs in the get/set config callbacks.

- Use a dedicated lock class for the PIO4 drivers IRQ.
  This fixes a crash on suspend.

----------------------------------------------------------------
Alexis Lothor=C3=A9 (1):
      pinctrl: at91-pio4: use dedicated lock class for IRQ

Mario Limonciello (1):
      pinctrl: amd: Mask non-wake source pins with interrupt enabled at sus=
pend

Nam Cao (2):
      pinctrl: starfive: jh7110: ignore disabled device tree nodes
      pinctrl: starfive: jh7100: ignore disabled device tree nodes

Patrick Rudolph (3):
      pinctrl: cy8c95x0: Fix typo
      pinctrl: cy8c95x0: Fix regression
      pinctrl: cy8c95x0: Fix get_pincfg

 drivers/pinctrl/pinctrl-amd.c                      |  9 +++++++++
 drivers/pinctrl/pinctrl-amd.h                      |  5 +++++
 drivers/pinctrl/pinctrl-at91-pio4.c                |  8 ++++++++
 drivers/pinctrl/pinctrl-cy8c95x0.c                 | 14 +++++++++++++-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |  4 ++--
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |  4 ++--
 6 files changed, 39 insertions(+), 5 deletions(-)


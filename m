Return-Path: <linux-gpio+bounces-692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5C37FDAFB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9760F282B98
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E130374EE;
	Wed, 29 Nov 2023 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pwPjQlBR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D94D65
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:18:18 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5cbcfdeaff3so70775687b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701271097; x=1701875897; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ww7Q/9ceLBE3UsdAE5GfPj/48ajdec2+lwr+X82WcYU=;
        b=pwPjQlBRRKKvKA+D2rWvEslRW96hXjxoYYIe+tA2Y5yu2ZNrf04zabkP+ugHLv85j+
         INydDO+F9jTj4k3xXIanEZtI7R0BJheN87MyWksOJBU6EXa2mxTdlT9XMd76B3BIlc79
         Icgw7dOSDmThJs4t5BnlrDO2EKD2kFqqz4XP5jUj28CLsmYXa/vZn9Al37Xp7GNoOh1F
         ZC/CWZLAIM8xbcdQVO/+FOyCcPWofgvtM4ZZHU6jMIEBUioGwlnG2aJw7mLVmeisOfor
         AJ8sFy4Y7MbyYDSbCcOEyDGxbUIok5WqHNNKIuMq7bf1fiGZXsSo3l/xw/o1S2WBpZ2O
         +x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701271097; x=1701875897;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ww7Q/9ceLBE3UsdAE5GfPj/48ajdec2+lwr+X82WcYU=;
        b=vSW9RN7e3wAzYxM2+SqmGh4+UHaT4975F1rlbyfQ8exZQFiSnr5+r1bqnO57IDpfT3
         frL0dV4kS9FqxDsiO9cZAgwb8bDtqmhxjqvO/bXAbaRjuKyAyg797GrGV82Q4hc/ARB1
         UG7mLroAhQ5Ex8MJSGgo6FKCmX9N2fA252HFs4gox9EagC9tPSzHuGBuk3XYmXqkKE9e
         9YgXNsndxjKOCqYoJMVsN7PkikRrlMS8eXvao/4mOo0Xi/nz72gw8zFxJHKsIpfcnrXn
         +wz6JLtkBY+bj1zjqFcaR0mv9mR8OUbNkxCrnFrznJEKvYvQPO9s8IRF7c5Y2KRmMQS9
         ZQwQ==
X-Gm-Message-State: AOJu0YyJzEiXiUIoCc4zkZuRgJB7g77hAfn0oMKZ86MzGrXIjl84KQhd
	vAZn7kmfRBWDOUBnttw47/2Nupsq975cTGe27vFVZdlLFBGToqCdZBU=
X-Google-Smtp-Source: AGHT+IEPT8Ws9NesmQWHMj5hZjPO3G5T4wYj+FYaoP8AFc5k6U1UkImn6UdXy1tcfwJdMRyJhtpysDaGAYEdS/bdlEY=
X-Received: by 2002:a0d:df92:0:b0:5c9:d16b:a11b with SMTP id
 i140-20020a0ddf92000000b005c9d16ba11bmr15635597ywe.36.1701271097463; Wed, 29
 Nov 2023 07:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 16:18:06 +0100
Message-ID: <CACRpkdb8dwq7OYUFuyjJCv7VN9mH1zEmibcOwgFip0wDv5H1gA@mail.gmail.com>
Subject: [GIT PULL] Pin control fixes for v6.7 minus one patch
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Maria Yu <quic_aiquny@quicinc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Here is an updated tag on a branch where the only change
is to drop the locking READ_ONCE() patch until we know
more about what is going on here.

Remains: driver fixes.

Some details on the fixes are in the tag.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.7-3

for you to fetch changes up to 650d240056059296168b24ba47e76bafa37c0646:

  dt-bindings: pinctrl: s32g2: change a maintainer email address
(2023-11-29 16:11:52 +0100)

----------------------------------------------------------------
Some pin control fixes for the v6.7 cycle:

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

Tzuyi Chang (1):
      pinctrl: realtek: Fix logical error when finding descriptor

 .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml           |  2 +-
 drivers/pinctrl/cirrus/Kconfig                              |  3 ++-
 drivers/pinctrl/nxp/pinctrl-s32cc.c                         |  4 ++--
 drivers/pinctrl/pinctrl-cy8c95x0.c                          |  1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c                       |  4 ++--
 drivers/pinctrl/stm32/pinctrl-stm32.c                       | 13 ++++++++++---
 6 files changed, 18 insertions(+), 9 deletions(-)


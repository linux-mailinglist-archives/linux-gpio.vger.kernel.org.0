Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95AE6D329C
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Apr 2023 18:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjDAQ2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Apr 2023 12:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDAQ2d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Apr 2023 12:28:33 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389DA11EBD
        for <linux-gpio@vger.kernel.org>; Sat,  1 Apr 2023 09:28:32 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-544f7c176easo472768457b3.9
        for <linux-gpio@vger.kernel.org>; Sat, 01 Apr 2023 09:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680366511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SwTNo3Ki2aER2ZIEedraVm2CwLGI/LI38zPc5dQIans=;
        b=LX/HcdgqO2RVPx90CkmZvm/8vG74P0Fzg9Pf1f6imquWRijLCYoJFkBywXrtVQLumK
         vAGV9LyHB+jrWwOf7Fr+tfzOjJeGfJvxVLK6awf8He80dd24q8J7nTJiBhI4zDmVLSU1
         EUGB9XTuzlSdntsxE1YYdmABDekg0CIGd0OfNxB4wghzTj4Hwyb9o+20XzxYTrTOLuXZ
         DNoPc2Le82S13zSH8GIgyhFpuUBJlnm/spZZtkCcf7f+X/Z3/xs1gYiJ8rWsw0NMDdQV
         SLxpIuaQvVDj2iJBYFLQLcZ3vndHxc94wX8FHoWB04ftgwEB2ifuv5qKDSPZhtm9UUKN
         VIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680366511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwTNo3Ki2aER2ZIEedraVm2CwLGI/LI38zPc5dQIans=;
        b=nel8NbGxIVHs6fbV38axSLGAX93eiT6YCE0ylEkTApUv6ed+KvomamYOsRUBaZm33C
         ZxcZP9tE3QDU5F4D8Sj9KLLI70c9LohD6z7uv+RW5E81638CN2zqA0mrYdQKbFeF+yXR
         PiABiVo0w0VWcL765srIQ8JzGXXyxzPZTyG4F3ajaUQltxVrRQrG0dSlMwiI8EqJFVPW
         o5tw6DjgxewVNvNH9hjXx0QAjUwnomGLMjPfYbpmcECyw8oSXyJMNUYeI9OcR/9DHLgh
         hJarfRJH1HFswJ5QnIgqvguKqW73VWKDmH4XJZ11UIjvfIHPmi4udXfMQquXvV2yCl/H
         MeKw==
X-Gm-Message-State: AAQBX9fWmrpSle2ZW9n33ZuIrYkDc3kysEp9XZznV3+FPAP6NnZQZm/y
        aj+vuU8zFnmN6bybvsfOXbp/cLYAWQoKTEFdFciDmg==
X-Google-Smtp-Source: AKy350aSqQLfOEJsp5nxESdUZUTqkKWIrBRSCxN8+xZZ2K9i6N4/UlMjYOmcA9Z+2QBUekzOy+0hA+KgjaxbxX8OCEM=
X-Received: by 2002:a81:de0d:0:b0:541:a0ab:bd28 with SMTP id
 k13-20020a81de0d000000b00541a0abbd28mr7057595ywj.4.1680366511416; Sat, 01 Apr
 2023 09:28:31 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Apr 2023 18:28:20 +0200
Message-ID: <CACRpkdZqoUZuLr9ra9JbSEQqqOWZvdh33Lk+R2P7qw8upx3nnA@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some pin control fixes for the v6.3 series.
The most notable and urgent one is probably the AMD
fix which affects AMD laptops, found by the Chromium
people.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6=
:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.3-2

for you to fetch changes up to e4056e38ec87b4c21eb34bb8e38b1b0ca1221744:

  dt-bindings: pinctrl: qcom,sm8550-lpass-lpi: allow input-enabled and
bias-bus-hold (2023-03-29 10:41:57 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.3 kernel cycle:

- Fix up the Kconfig options for MediaTek MT7981.

- Fix the irq domain name in the AT91-PIO4 driver.

- Fix some alternative muxing modes in the Ocelot
  driver.

- Allocate the GPIO numbers dynamically in the STM32
  driver.

- Disable and mask interrupts on resume in the AMD
  driver.

- Fix a typo in the Qualcomm SM8550 pin control
  device tree bindings.

----------------------------------------------------------------
Ar=C4=B1n=C3=A7 =C3=9CNAL (2):
      pinctrl: mediatek: add missing options to PINCTRL_MT7981
      pinctrl: mediatek: fix naming inconsistency

Dario Binacchi (1):
      pinctrl: stm32: use dynamic allocation of GPIO base

Horatiu Vultur (1):
      pinctrl: ocelot: Fix alt mode for ocelot

Johan Hovold (1):
      pinctrl: at91-pio4: fix domain name assignment

Kornel Dul=C4=99ba (1):
      pinctrl: amd: Disable and mask interrupts on resume

Krzysztof Kozlowski (1):
      dt-bindings: pinctrl: qcom,sm8550-lpass-lpi: allow input-enabled
and bias-bus-hold

 .../pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml     |  2 +
 drivers/pinctrl/mediatek/Kconfig                   | 44 +++++++++++-------=
----
 drivers/pinctrl/pinctrl-amd.c                      | 36 ++++++++++--------
 drivers/pinctrl/pinctrl-at91-pio4.c                |  1 -
 drivers/pinctrl/pinctrl-ocelot.c                   |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  2 +-
 6 files changed, 47 insertions(+), 40 deletions(-)

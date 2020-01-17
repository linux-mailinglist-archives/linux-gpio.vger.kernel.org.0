Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC0001404AF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 08:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgAQH5j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 02:57:39 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40659 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgAQH5j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 02:57:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so25480841ljk.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2020 23:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=9pVB+0P7nfsJ3yw8f27fOejAwfBrljBWFRRLcIw8Iyo=;
        b=Rc+l/Rv9m/ZgvuQmdU48ZHmimFov2VXRkFP5lEQwoadwha6Oef+WXSfBES2zbBCx/h
         NNkM6Tj44JJ+76mP4cz4ZLHFvN5TRmqFaY96jC+NlxXTggJwdVtNYm+o3yC23Llv57uw
         YcAix08P8IWYp/xu7PfwWu/fKyRgJrS4A4RQndR+TbN4TEbmiF7guUh2WDLidqfDAzvg
         TFhLa2bpV9p5Av+imffz4msprTQvRhpyFIOw4YNqSuSsbJiCKFRz3ixfblLnTwTpxqL2
         yPyEchnDgmpERX/DoXwwai2Yrn6AmB6hRn+0NoWbii8oG8BIfeO2t5CYCaRxiPgpAta1
         ijrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=9pVB+0P7nfsJ3yw8f27fOejAwfBrljBWFRRLcIw8Iyo=;
        b=DdUJvGqIW//SPRTtrLmythoYJ3VRtd2bXo8bFLbxEarYk/YdVMDq2/ABv2i9MQQLz9
         ZtAeFvYsp0m8U8DNpfOPxr5M2B8IQExOvcfJAY8hSSuiLD/QivgaJODpnh1XHL2prj9/
         HsV0WYKYzpVZ5vG6MN2NUBlQbe0A+6sqT8Z9vfIaMCYbEfTvUSDZkG97hX1gNuq8tyoY
         OOkYjaXRX6GAnNgGbyNPwd+eEwaNuXbgbRQwi0abgFPk6hFR54cbw+SsWVOYxEeMDrAA
         qOdZFA8z5+AsrxlThQoI7r82ZoOGTxW8dInANU2HWNP+jyAyzDLAfvdqWsvc1ta911h+
         /kLA==
X-Gm-Message-State: APjAAAXf0mWzH/6VA0H+vZh+Si95sUh5PMqzx9YX689GiG02eGUnlTj3
        cFY032zBAxIKNid6jurNienZHi1K94L+OFqLEUwdKg==
X-Google-Smtp-Source: APXvYqx3hxlXD94SSEkmtAQv90zVU0pdzIvcV/Q+Q2Smp4R1vzTVUUxtUbrlf9A0GfNNbLuErH9hB2dBBeyYJ4MDDHc=
X-Received: by 2002:a2e:918c:: with SMTP id f12mr4948308ljg.66.1579247857887;
 Thu, 16 Jan 2020 23:57:37 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jan 2020 08:57:27 +0100
Message-ID: <CACRpkdatPeRrqDzb7ynELvRD_TUfjAc3XCYPKmE5BrQdFXakiQ@mail.gmail.com>
Subject: [GIT PULL] gpio fixes for v5.5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kevin Hao <haokexin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

a GPIO fix for the ThunderX is all that appeared in the last week(s).
The revert affects a single driver on a rare piece
of silicon.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.5-4

for you to fetch changes up to a564ac35d60564dd5b509e32afdc04e7aafee40e:

  Revert "gpio: thunderx: Switch to GPIOLIB_IRQCHIP" (2020-01-15 11:17:21 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.5 series:

This reverts the GPIOLIB_IRQCHIP in the ThunderX driver.
ThunderX is a piece of Arm-based server chip. I converted the driver to
hierarchical gpiochip without access to real silicon and failed miserably
since I didn't take MSI's into account.

Kevin Hao helpfully stepped in and fixed it properly, let's revert it for
v5.5 and put the proper conversion into v5.6.

----------------------------------------------------------------
Kevin Hao (1):
      Revert "gpio: thunderx: Switch to GPIOLIB_IRQCHIP"

 drivers/gpio/Kconfig         |   1 -
 drivers/gpio/gpio-thunderx.c | 163 ++++++++++++++++++++++++++++---------------
 2 files changed, 107 insertions(+), 57 deletions(-)

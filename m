Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A569F17D3CB
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2020 14:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgCHNHq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Mar 2020 09:07:46 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:38632 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgCHNHq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Mar 2020 09:07:46 -0400
Received: by mail-lj1-f175.google.com with SMTP id w1so7108739ljh.5
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2020 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=PEjsBmq0oGYsC56UdyYVhp5hPk082kOp1hwXhzk5+QA=;
        b=EVi39ie7yCBDdR6wSXweQKCjO1koGgSqxEmAhh5N5nhn3KhB0ZDCc8Q3jc43QrQRvT
         liRJl8tzGgYz/ElHkkLxLAP/kYX0sa2ApUMXDzevGKEf2Gh73yLKvMvSp//ML46svFBY
         06HaFYJf/F7nAFvVME1BUf0+NaU+vEMqLL+BhAqDxnqpXQCPCcTYwzFePExs5sbu4FKf
         MesJ8gnMEVkjtK1svVef/rlpGeMkCu0fESYLXdwOkDI2Xig9yZKsxA5dnqPiVMn7QfBZ
         nRwAioo6qs4eDGNI387CK/BKQNIYU/pVqL+Jp9GGAUVk439IXy1GxsQcP+hOsIdvZohv
         TLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=PEjsBmq0oGYsC56UdyYVhp5hPk082kOp1hwXhzk5+QA=;
        b=L6wG+eMzYGhBEeudMJVXqSBCE6ZKSDboz+D0s7pvaoEDwxyfYz+9o2qkVkCKY+Rcqc
         nNnnZGwgaBGNc28yQAY1s5GTUlEBZXAqmiTM7VP1Ky9WCueZNlOrtiiSuD+lsXWI1BfK
         c6o0YX0esYWs+UNIT80em+8jzlLyK0V0r51vaU5myMN3gfKrCZsHZqvzbbEHZw1T7Nsm
         +dHQIQt0jJGr4W5J5izU9L8TnYy0UsNClbJ/RO+WA4+LwRKf0MCqWtOC8ch/lBqFVPCp
         0IrrVq7McrI3vX977WkVyHasghLWnt+pNhTgM/ubGlA+wzLZ4X0HUUFLTj6Ry89mbDk+
         oRUg==
X-Gm-Message-State: ANhLgQ18kQ+kElVe1VZa5DZT3ay5rAb63FdiszU6Bd0pTwQfP70tG8bo
        viuCldrEzfHt0XoCWGzSQaUhBUqGj/hiHnJUpLw=
X-Google-Smtp-Source: ADFU+vsu4ysosNA+Yd/FrmgD/b2AhwQsgb7wuGNQRgVMHI7RPEoLbk+YsDutCp+zDlyxBDqNagB3gyJnWESfwd1XqiM=
X-Received: by 2002:a2e:9097:: with SMTP id l23mr7552620ljg.155.1583672864653;
 Sun, 08 Mar 2020 06:07:44 -0700 (PDT)
MIME-Version: 1.0
From:   Drew Fustini <drew@pdp7.com>
Date:   Sun, 8 Mar 2020 14:08:04 +0100
Message-ID: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
Subject: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Drew Fustini <drew@beagleboard.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Grygorii, Santosh and Kevin,

You are listed as gpio-omap maintainers so I wanted to reach out and
get your feedback on this.

The gpiolib userspace API added support for bias flags
(pull-up/pull-down) in Linux 5.5:
[GIT PULL] GPIO changes for v5.5 [1]

The merged code is from the patch series:
[PATCH v6 0/7] gpio: expose line bias flags to userspace [2]

The gpiochip character device now supports theses flags [3]:
GPIOHANDLE_REQUEST_BIAS_PULL_UP
GPIOHANDLE_REQUEST_BIAS_PULL_DOWN
GPIOHANDLE_REQUEST_BIAS_DISABLE

The pinctrl-bcm2835 driver used on Raspberry Pi already supports the
pull-up/down bias flags [4].  pinctrl-bcm2835 is also a gpio driver
[5].  libgpiod v1.5 supports these bias flags [6], so the command line
gpioset utility can set the bias flags for a line on the Raspberry Pi
[7].

I would like the BeagleBone, which has the TI AM3358 SoC, to be able
to use the bias flags as well.   The AM3358 uses the gpio-omap GPIO
driver.  However, gpio-omap does not support these flags [8].

Do you have any feedback on whether this is possible to implement?

If so, do you have any guidance about the correct way for me to add
support for those bias flags in gpio-omap.c?

Thank you,
Drew

[1] https://www.spinics.net/lists/linux-gpio/msg43719.html
[2] https://lore.kernel.org/linux-gpio/CACRpkdbJxcfj6pK=1qjXxffFn0RUH9VD0HRFXX0RoZJDi=hfRw@mail.gmail.com/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpiolib.c#n1061
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/bcm/pinctrl-bcm2835.c#n958
[5] https://www.kernel.org/doc/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
[6] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=v1.5.x&id=26d8d8f0b7bc0e300aaab05c75d5af1b0686af08
[7] https://microhobby.com.br/blog/2020/02/02/new-linux-kernel-5-5-new-interfaces-in-gpiolib/
[8] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpio-omap.c

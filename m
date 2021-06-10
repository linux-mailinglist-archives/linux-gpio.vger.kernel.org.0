Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2673A2CD8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 15:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFJN0D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 09:26:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230238AbhFJN0D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Jun 2021 09:26:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A44F613F1;
        Thu, 10 Jun 2021 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623331447;
        bh=Rrlo6UBorgA4yYdkeJZFkNtjOdFycP2V4Yrm2576Twk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=epP9NYZQXt89/rtsnTAtov7cnnKyjo1y/JumMdVnSnEqTTdt1fcafCGB8T6u13TNU
         wGneCDFZD0hniYZEfbYBiYd1jQ3C8OAXUkNDYBh10PwH9bgNbd+wFGEeDhdsMBGx+x
         7xzlmquhmtqxypCAV3zG+4WgK6D0Utmoov2C0sKhBilcR9nXWG0LFfd1u7He676Um+
         lfeFnmeTOua8ogeu2dCVjp0YokC7Turj8V3AaoDxW7caMBAvmljcyaA897xLrpLJXk
         aTO86TnHPdFRa/XP7/bTziJ+QUIUa1OHmp2tfkmmdGz2d4OPSMMBPq3Ia/Oqt1rPbF
         2Oh5AStVNnlwQ==
Received: by mail-wm1-f41.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso4764557wmc.1;
        Thu, 10 Jun 2021 06:24:07 -0700 (PDT)
X-Gm-Message-State: AOAM530Q0hntIJFaFBt+ZY6Q9SVdyV/tXmfs5B3DYEaOf3rZw5QLHN+T
        bSTjR/0Dp5Lpa/TPy2KFhlrW3ywwOGikkxhW5nI=
X-Google-Smtp-Source: ABdhPJyDrsbkOZyD6kLCD4DdVUtbci1V9QMmHUOI3yS2P/4OWrBF6VIxXEMbyhpfTZNovJKfZnVfkfNGszR1JOpr7O4=
X-Received: by 2002:a1c:7d15:: with SMTP id y21mr14854395wmc.120.1623331445689;
 Thu, 10 Jun 2021 06:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
In-Reply-To: <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 10 Jun 2021 15:22:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
Message-ID: <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 2:18 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> From: "Enrico Weigelt, metux IT consult" <info@metux.net>
>
> This patch adds a new driver for Virtio based GPIO devices.
>
> This allows a guest VM running Linux to access GPIO device provided by
> the host. It supports all basic operations for now, except interrupts
> for the GPIO lines.
>
> Signed-off-by: "Enrico Weigelt, metux IT consult" <info@metux.net>
> Co-developed-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Can you give an example of how this would be hooked up to other drivers
using those gpios. Can you give an example of how using the "gpio-keys" or
"gpio-leds" drivers in combination with virtio-gpio looks like in the DT?

Would qemu simply add the required DT properties to the device node that
corresponds to the virtio device in this case?

From what I can tell, both the mmio and pci variants of virtio can have their
dev->of_node populated, but I don't see the logic in register_virtio_device()
that looks up the of_node of the virtio_device that the of_gpio code then
tries to refer to.

        Arnd

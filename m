Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC05834A7D0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 14:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCZNHg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 09:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCZNH3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 09:07:29 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30CDC0613B1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 06:07:28 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x21so6242717eds.4
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UzC5FBVz05PHuae7oBlniWjIpKp36WiskgIQCfeie3A=;
        b=V2Ytu6qBPPGkLMv7S6mlhwfXx73xncAijDlfo/GWHDkV2vSaO7UEb+pL2lXTMSyc5T
         IS8zUw/vml70QF5x1CKd0LeZY3y+6cRbfEMJ1xDLKyJ6P1Wp0E1aRqCoJxutN99HxIIj
         ApPez/DvySFJy9SEe6wXhAga56XRZj9RLazbYoPnqEHIvlzyG6zLm9eLX0EjsTPTQtS0
         1Gtv7+5x4BTV5lm9KgOtXvV1GfUeRwO+ZJlYOtIzyaUgKQrdCDD0mJHLE0cQd693TKmR
         I/76K60wh46tNX2SDm8Oitpz6W/2T+/oA/Mzq4sulFiheOe1a+VhaE5W+dWYFP/97uVa
         jsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UzC5FBVz05PHuae7oBlniWjIpKp36WiskgIQCfeie3A=;
        b=KrJgco/HtMQpU7mZrxeyVOl3PNj6nQP5q+PAHrCGbv87NWJGNEg9cffQpxIbquv+VW
         vvTku1dNAfhSaEJSrjW2H3syqtiJiqW0esXPsWefBFjJosOp6YtEoU9QBu2Xwv/8lv+n
         XkFRFfr5Jblp2HgSBgYONvXeUSgP21jpK8eYSAD/S7tIWLasD/c1QaqfcLbov+y2Ospk
         tTeicaWwncFvj2B/rMOKhxChniyBFCTUGNaEpm56dWmB+5RlhlGXbJK6pzcjfLGzC1C2
         6URVqKOI2NA0VTTW0U4+v2DBKvziit1cUKXCMC2GAXUji94aRwqQoLYH159jcNxM/kiD
         VzTA==
X-Gm-Message-State: AOAM530aDCTZySmcg7OcEVYtYfbJRa7/Cwy2ACH6bvi0JBD4euSMofmE
        bg3HfguNA0VISSxEtv5srZ1XceklGIJXtwC6y0t48Q==
X-Google-Smtp-Source: ABdhPJwkjDuvTV8Eny6IaII+A63BvbGqHoVciv6m70WrZQH4YTnZlVRI3Qv1mAGKV+kcQQCfrCPZQPEI7Hh3uEB5emg=
X-Received: by 2002:a05:6402:17d6:: with SMTP id s22mr14815062edy.232.1616764047557;
 Fri, 26 Mar 2021 06:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210324064541.949630-1-jay.xu@rock-chips.com> <202103241450286417142@rock-chips.com>
In-Reply-To: <202103241450286417142@rock-chips.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 26 Mar 2021 14:07:16 +0100
Message-ID: <CAMpxmJWmUu962YrcCQmxukV3hM9K8hGVuOzimZ5friX58oSDWw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/7] gpio-rockchip driver
To:     "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
Cc:     Tao Huang <huangtao@rock-chips.com>,
        =?UTF-8?B?5p2o5Yev?= <kever.yang@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 7:50 AM jay.xu@rock-chips.com
<jay.xu@rock-chips.com> wrote:
>
> I'm forget to send-to include Bartosz, I'll remember in next version
>
> --------------
> jay.xu@rock-chips.com
> >Separate gpio driver from pinctrl driver, and support v2 controller.
> >
> >Jianqun Xu (7):
> >  pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
> >  pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
> >  gpio: separate gpio driver from pinctrl-rockchip driver
> >  gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
> >  gpio/rockchip: support next version gpio controller
> >  gpio/rockchip: always enable clock for gpio controller
> >  gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
> >
> > drivers/gpio/Kconfig               |   8 +
> > drivers/gpio/Makefile              |   1 +
> > drivers/gpio/gpio-rockchip.c       | 758 ++++++++++++++++++++++++
> > drivers/pinctrl/pinctrl-rockchip.c | 909 +----------------------------
> > drivers/pinctrl/pinctrl-rockchip.h | 286 +++++++++
> > 5 files changed, 1072 insertions(+), 890 deletions(-)
> > create mode 100644 drivers/gpio/gpio-rockchip.c
> > create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
> >
> >--
> >2.25.1
> >
> >
> >

I don't even have this in my inbox so I can't review it.

Bartosz

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A84F1ABFDD
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633788AbgDPLmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506472AbgDPLml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:42:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3CEC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:42:39 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m8so7493662lji.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PMemjoCt4EMKF+iaj5mfbjvOgSWo2uOQlvsUZEFak2w=;
        b=d+ge5ueOEBxL85/Rug3S7EEuX77yMsrtiKnGUaRtQ7w1l8OIu5l5bvFy7ZuS4+iIDc
         vEuvxgrjdYRMjzfB1i5140XxLorLvTk+XhU8Lw4ySKdwNEyiBqJ1e11vOAimeEDdeFsq
         d5G10/xEhTp5FHT0pJH7mGsdf7DK30sWc0QPDKj4xkmzQvUvk97GJouZCpzE97tjVwAk
         5vuoYW/mt34Hi9rtm+iEnu0/oKgBGroShdTRV5HUW+iduqhk9LagtACmFRFCGZT7azR9
         htL5Wotiu2zhlKEoa4o/iQd5efO8JDhDuyekp+xZ2jonjMgCc03NFrnveMG4VUo2epW5
         6Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PMemjoCt4EMKF+iaj5mfbjvOgSWo2uOQlvsUZEFak2w=;
        b=V6KfemfzNe9tgqPAywaZKNyX+yNCob7IfH2hsH4pwfU33l1oifg8x82x4d59sDcGCL
         nP10I92XPPKOOyj2UzFjUkHbsEGs0yBbx78uGa7I5lkOp9ahSwZMeYJZPvNCuAIsA1rv
         WA2pQaUrljen0PH3Ll+O0JKWyS2yVmERIEZsVmD/voWANyAyq1O3oRfQMn4tNdo3h2PJ
         RFTUf2Weu1aOjOxQdVsJUOavwNafeh9dWdsoVge0hy0xKAE6/uJ29u+Q0RuPCDuZaT14
         h4zIuK2j9oQIUzZ7h0DRgqOz7Kdl07uWfHDByb8+ywtdVhTNas2eE9udstYtWWp/zyK1
         SA3A==
X-Gm-Message-State: AGi0PuaN23733LjCPt7mlCMSBOE2gZXGpgTXneAF4AZEZR3LQctcVhgc
        A/8X0nKp1seTXjFS7hJd1yKe8Z5yrlUDZs9+ltZYwA==
X-Google-Smtp-Source: APiQypIiZuLzQrvYkiNeyORy157fLPptCAM8hPVcZFSfyIeA/0Aw/t8tq6u9+QYki+nEJa9ACas6eAvqHD2XaCatgUw=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr1319254ljp.277.1587037358214;
 Thu, 16 Apr 2020 04:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com> <20200414170934.GA34613@smile.fi.intel.com>
In-Reply-To: <20200414170934.GA34613@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:42:27 +0200
Message-ID: <CACRpkdZRnSUhmVPKjJ6dWnSfhnvrAKUrBY6tWLkxPgT28CzbHw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/16] ASoC: pcm512x: expose 6 GPIOs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Walle <michael@walle.cc>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
        Mark Brown <broonie@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 7:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Apr 09, 2020 at 02:58:26PM -0500, Pierre-Louis Bossart wrote:
> > The GPIOs are used e.g. on HifiBerry DAC+ HATs to control the LED
> > (GPIO3) and the choice of the 44.1 (GPIO6) or 48 (GPIO3) kHz
> > oscillator (when present).
> >
> > Enable basic gpio_chip to get/set values and get/set
> > directions. Tested with GPIO_LIB from sys/class/gpio, the LED turns
> > on/off as desired.
>
>
> One question, can this use existing GPIO infrastructure, like bgpio_init()?
> Ah, I see, that one operates over MMIO, while we would need something based on
> regmap API.
>
> Bartosz, do we have plans to have bgpio_regmap_init() or alike?

Michael Walle is working on that:
https://lore.kernel.org/linux-gpio/20200402203656.27047-11-michael@walle.cc/

I think we should try to merge it sooner rather than later.
I can provide an ib-* branch for ASoC whenever we agreed
on a basic generic driver.

Yours,
Linus Walleij

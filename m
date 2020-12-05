Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644B22CFFAA
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 00:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgLEXPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 18:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgLEXPP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 18:15:15 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB25C0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 15:14:34 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id y16so10900269ljk.1
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 15:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cmcZ/utrAXCM1TZpCDY082UafsBIcsjBo4Rb8/5R/mw=;
        b=qXnXqFq8hu6uhyeQcTfuhEY4qHpnq9sjfN3rLhpdPnz7PIEm2alrxvT80lVqlnyp/2
         wVwZODy8AZ20PCsU74NEXAMO1O4VB5iPFcsggMPxLBOdxXIpJ/8mnVzYkK/HXIw8384c
         87sA1YKNTBrvj1eegJ2+/sPzLubSAPmQ0A9ygc/8ucTm6Ttf7OntnH9x+oSv/HyK0KcF
         GWx6EAxChjbFWRouwwp5MNPpf+jc/7MrofHx5O1YYeSlhbQPjbE8DlqGcVvRAGa4fV1U
         f3QtfdRPoOB3e7eBiLlzGuXvBKMkuWy+60sYclLR3imeI2nrde63xfr6Tg6TCxPw0ciT
         jDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmcZ/utrAXCM1TZpCDY082UafsBIcsjBo4Rb8/5R/mw=;
        b=UzVOdekxnuqUAgB1kNSmkyLR3oSeCNyxjW6VeOn2q0PQxgZP81RnAtaw/8DIigFZY4
         tIufv1NzqlIBbVygInh51uJYVUISFu6nZwuTjyuT8e5gYZRi+g26t4o/RVH1BwIRjvp0
         tbPq19YOrVE1CCmd439usleNwNoHScdLMO40Vc/1krJOeUkzNY2vM2ZMGH/JtlcwEOhV
         ndaTsOmcYNOn81Ill2idE8Vm6dzA+7RGZIGolDT2hG4G4pod61Ii4KlQGBq7diRBVx5p
         fDwjBth1OTDkaWr68DaIQHIY0RnUFAQwoqzemiHiCpXRBaeixP1TnFkdes9RIyWr5sjX
         bJnQ==
X-Gm-Message-State: AOAM533oOQJX+e39+K439gtTtjBv7DITOvlPO8w/kUYXboP2To42l6cg
        OGSKs1ZYW9P/YVKF9MNYPegejeDrY8ny/sPCE/HR963qDLbunQ==
X-Google-Smtp-Source: ABdhPJy6OF/tnI2nG4sKWM6dZe8M6BJGjDsCoW2oXWg15mcPjPAutxysQeH7r2Svog0zutVO9i62bORn7XiSZOXEsko=
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr6105913lja.283.1607210073218;
 Sat, 05 Dec 2020 15:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20201204083533.65830-1-linus.walleij@linaro.org> <CAMuHMdWyz-j7F+jGJt0SqLAiSA9xiaycK5kvznB9xmh7HxO4qg@mail.gmail.com>
In-Reply-To: <CAMuHMdWyz-j7F+jGJt0SqLAiSA9xiaycK5kvznB9xmh7HxO4qg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Dec 2020 00:14:22 +0100
Message-ID: <CACRpkdbH2gvZz=Mj7HA1Q034WkA=_X9PpJRy1KgU_1yEuqV5wA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add TODO item for debugfs interface
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 4, 2020 at 10:47 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > +/sys/kernel/debug/gpiochip/gpiochip0
> > +/sys/kernel/debug/gpiochip/gpiochip0/0
>
> .../gpio0?
>
> Might be a better name, if you ever want to create a symlink
> to this virtual file (e.g. from the line-name)?

Yeah fixed this while applying.

> > +/sys/kernel/debug/gpiochip/gpiochip0/1
> > +/sys/kernel/debug/gpiochip/gpiochip0/2
> > +/sys/kernel/debug/gpiochip/gpiochip0/3
>
> Plus a symlink to the device backing this gpiochip.

Yeah why not. Interested in the job? ;)

Yours,
Linus Walleij

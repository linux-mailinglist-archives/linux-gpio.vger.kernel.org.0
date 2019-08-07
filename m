Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8F984DCA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 15:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388123AbfHGNn1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 09:43:27 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39939 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388240AbfHGNnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 09:43:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id m8so51932834lji.7
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r8oT/pdrsca84n0NDIaHHZv8cpN60+ThrBuUGxPzdw8=;
        b=rvu8/uPmJgSAO6Z/nF0fcPombDyKnMpyB88/VeXgpVTZHVnWk1GTGobZcO5/NL+Kig
         yV9h0klxh9dyCuJsIoZb3hVLYwIkNvizUQBO3RTrP2tQh/e4uYJsH418/ZjM73/7qVkE
         GDNenF6pH21fAdY7GFPxnKZuecf/vJqYW3QJid/nyNPXu86l45IT8LvGNgBCvo+nigtJ
         7G/moO8MDj8BS9SFpiOSZSdD7oY9RRSgJxMzvHgbRT8pJelbrUA4mQLIJ/Ycj8Zx6CLm
         +A39bl37VsoIXnDtkZ3xaThzk/kRWTP4VvEpKjBfUfAdAPN3XmdONWxVl2aFFuD66S4d
         HTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r8oT/pdrsca84n0NDIaHHZv8cpN60+ThrBuUGxPzdw8=;
        b=EuTQfwyG+qh/psFCKpFoMmHjxbZybWTRmMfdc4QWPyXZVgwnYGA1/F1qZXrS/s27lS
         C/HLt6tIgo2hV0op8zUKC0MNXNKx0x3qo/jS+8r5RcAWZOCjQ1lHgtM0qNmNlI8ZgcYs
         Zi/+Ff4gpxIpXV6VcR44Qahe07dnXZjMUDpkEuRNA4eLnagWqhOxgw0Nn3XFRlXa3I9n
         K4CIF0vN62bhlqiolnUWlRwOpFZY1VnhbY8r5dweSe8IJ/ZZ1srRa0JWicTSLb2kteZC
         S7C2/epBrVRxfKY8NBqm15YdvYJwkvsH2TZQLuMYvqmABXMt4zhSDWTJ27vYhOmGecWS
         I7hA==
X-Gm-Message-State: APjAAAWJvZf5IpTRivOUX/bmRGOJz8EywQwWkCrDCWfcvRrFJ2sKHPlQ
        AjaYQUeRFfEsxwQKbz3OH0BQbtdjX9Q9C6BACXfzFw==
X-Google-Smtp-Source: APXvYqxdpDTdThy1Af2etX0PV/rvU+DMRMs34vh20dWSvUFCneI7AXu0RnDYU2y7Rvof6wyFG0y8HZM6tmzdS1ueRpo=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr4874644ljc.28.1565185401372;
 Wed, 07 Aug 2019 06:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190708110138.24657-1-masneyb@onstation.org> <CACRpkdYQhyh1BW789OcxGTomMkC3e8hMr8sodbWz-z1=5s9fDw@mail.gmail.com>
In-Reply-To: <CACRpkdYQhyh1BW789OcxGTomMkC3e8hMr8sodbWz-z1=5s9fDw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Aug 2019 15:43:10 +0200
Message-ID: <CACRpkdZWSS8Mg5EUOpYDfY78s9cy0wTEZHovb3NmZgZsYoiSHg@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: hierarchical IRQ improvements
To:     Brian Masney <masneyb@onstation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 7, 2019 at 3:41 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jul 8, 2019 at 1:01 PM Brian Masney <masneyb@onstation.org> wrote:
>
> > This builds on top of Linus Walleij's existing patches that adds
> > hierarchical IRQ support to the GPIO core [1] so that Qualcomm's
> > spmi-gpio and ssbi-gpio can be converted to use these new helpers.
> >
> > Linus: Feel free to squash these into your existing patches if you'd
> > like to use any of this code. Just give me some kind of mention in the
> > commit description.
> >
> > [1] https://lore.kernel.org/linux-gpio/20190624132531.6184-1-linus.walleij@linaro.org/
> >
> > Brian Masney (4):
> >   gpio: introduce gpiochip_populate_parent_fwspec_{two,four}cell
> >     functions
> >   gpio: allow customizing hierarchical IRQ chips
> >   gpio: use handler in gpio_irq_chip instead of handle_bad_irq
> >   qcom: spmi-gpio: convert to hierarchical IRQ helpers in gpio core
>
> I solved things like this:
>
> - I kept patches 1 & 4 as-is

Ooops had to squash patch 1 as well...

Yours,
Linus Walleij

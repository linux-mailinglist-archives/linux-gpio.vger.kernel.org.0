Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD4111E4CE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 14:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfLMNla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 08:41:30 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35146 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbfLMNla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 08:41:30 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so2007998lfr.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 05:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=um38lbZzpKxt7uGrxa36YCv92PPQyVOLwWn9L2epGKw=;
        b=BOankhjAV8/8bQZ9lCqvpucVKAdP2rIYl36RyhmQyNYYYYJnIj87tF9eW0lT5Ci0G0
         qwPap4RfRCoE3brK5KkxYbqKUAqv+gubXf2Jk32p82hdTpnf0zdcpa0sRXAw7gP2+l98
         /freSdGau54VZknmHwSTPigDK7cpfpm4O/GcXm16sofmRJyoqoETPG33WrNsG4IedeKW
         9YfiTjNasQ9lQFeX0Nsv9Df9MdEyWKncWn0EE8o3zT/7+3EwOlWLKMYmSfFSy0YFCJp5
         oVdTRq7Dg3oTxWM17e8pjCCQ9aT4CW9pBEWsZLGhcvjcUHc/HNGnFsW6SC0vDTS86gsy
         SE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=um38lbZzpKxt7uGrxa36YCv92PPQyVOLwWn9L2epGKw=;
        b=tiF1POc/pfijL1al7MEQP6Dc4xTEXMhoaqBFJUW7xVjVhSZPY00o5odxYf0SjWMwby
         9VYh/TSX23CRAtvOenuvu++Cpr8eBJA8LjJORdnwjdTzNN3DKFPTGqXiKjQ+A1Xk7BHz
         xZoGUgSUIPISsePMVES06iN6LSTIb/s972uYQZJIw0OPvU1B5bgC8avJDnA6wFYkuNvo
         KWjYtTV3OfBBPOjbx+uAKDezQgoxxMrVvMDDvZmkl/rl27ncklNbStso/g3dJ7hX49qo
         scA2Y5oEgIwnI80WAvCdeeW0n1lOzmcNtGcXufdlIR9aVS2z3zMEmM+jUachi/kJsj3a
         1H7w==
X-Gm-Message-State: APjAAAUlg9aqMvUDqVrkjbRhjGjiOtM3iPhiMZFYOIHJBeEjAP24lXC9
        jbTbTBwM6KNDHKcnd2z3V3JMdiTvBToI3JB9/y3lKw==
X-Google-Smtp-Source: APXvYqwbbvWd65YUyu4esLaZfC/PenW81yd1uucK0muugdgcY2qC6d8Ydw2aygE/kIMzkuUjESzuArRz16qjhAbaea4=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr8848404lfg.117.1576244488265;
 Fri, 13 Dec 2019 05:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 14:41:16 +0100
Message-ID: <CACRpkdaMgeqpBN0WydqirDX9eC_ypVcd=7PW+e96rsuMx7wJNg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] pinctrl: baytrail: Clean up (part 3)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 12, 2019 at 11:26 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is a part 3 of clean up pin control driver for Intel Baytrail.
> After this applied the driver will use all available data structures
> from pinctrl-intel.h header.
>
> Note, that patch which exposes common pin control data structrure for drivers
> will be used by Lynxpoint as well.
>
> This has been tested on the tablet with SD card detection and buttons pressed.
>
> Based on our pinctrl/intel for-next branch.

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please collect up what you have and send this with a pull
request so I have the full picture in my tree soon-ish.

The reason is that I want a clean baseline to deal with this:

$ git grep gpiochip_set_chained_irqchip drivers/pinctrl/
drivers/pinctrl/intel/pinctrl-baytrail.c:
gpiochip_set_chained_irqchip(gc, &byt_irqchip,
drivers/pinctrl/intel/pinctrl-cherryview.c:
gpiochip_set_chained_irqchip(chip, &pctrl->irqchip, irq,
drivers/pinctrl/intel/pinctrl-intel.c:
gpiochip_set_chained_irqchip(&pctrl->chip, &pctrl->irqchip, irq,
NULL);

If you volunteer to get rid of these three gpiochip_set_chained_irqchip()
calls, even better :D

They are the three last users before I can delete
gpiochip_set_chained_irqchip() from the kernel.

Yours,
Linus Walleij

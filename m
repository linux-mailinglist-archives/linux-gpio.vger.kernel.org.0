Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37D9E42032
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbfFLI7O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:59:14 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37716 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731317AbfFLI7O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:59:14 -0400
Received: by mail-lf1-f68.google.com with SMTP id d11so3623844lfb.4
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V2L+zl6dowkd/yIBbT7eRrGp601e57v2tAHbEjBGJTw=;
        b=X4fqxkFUUtZqYl036ehGL/EeenuwWFqKCNrIgtl0sfKO1CziKoyuiKNHtxSW7mmdT/
         GmMSjXhOyHCeA2bLmKJ4EYbomOxRED8IWzZlcIOAzfR30W2mt8A2uoEoKFoVGcG5Ihxj
         GFrYwP1ohGAB58nb+WHlzAwM0jSdY3H/80yFHE/XZ+IgCbPGlbi1HDfBC9PbEtgPAn99
         nQxs3HRHSInY1DkPn/OAJ9SKqQ5nqiDk5sZkBuJuWFkpBFuB38xQt5fJ1Fm9eqKu8OgJ
         PT0emqTy4xxMN4Rr552UHUcBV9d0PjU9STLc/KZiaiv5JPdhC6w+GrFWUxEn/fdfq0+/
         OtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V2L+zl6dowkd/yIBbT7eRrGp601e57v2tAHbEjBGJTw=;
        b=nMUNumiVakgVTssBSIdII8s4TVybaaemxxrJ2h9f8KK0gSaOKm39ll+NQPBAQX0lAU
         JKfNniD31Yv9T0VvHJ1ksJBHKkRBaKvlzrRwndc9bD+rd6BS+2y8nKsyo43jeMydESvB
         Mdn2a7p+OvPoOUB6iLbpDdd6iES7QSzA31J3a7yeFAXQUL+T7/whfbHqSTinFSM75lo6
         NGTz0IwNoOQMHFId9b31Szl+Go5Fv+l8xp/9y6kLIdS4lIfmbfQJIwjWVnlpDhgKf6oD
         0hxIDygCsEWk+H9krTYSNn8bA9VxsmFdJdcMnUAah5bavIMGvqS0pyNtaSLVvW/S2My4
         sGeg==
X-Gm-Message-State: APjAAAWzBmXP5oZ4VIax/KQmZdsaQRYWaYlWqzV+qXbIhHf0zurm6OEe
        dMgr4c3NjBZvLLZTUbT30MVqHRtjLMhnfitU1Dap0g==
X-Google-Smtp-Source: APXvYqxjS/7aTV8YOZIs8AdNxK6uGmYNc9VJ3EJJBU3O7jWDspDz9e4LDwcqW1lbvKFFYrHG6CHJ4s9KIP+m6y6ZICQ=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr39036425lfn.165.1560329952465;
 Wed, 12 Jun 2019 01:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-20-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-20-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:59:00 +0200
Message-ID: <CACRpkdYdcj9kEntzZ0q=xkEKjdzH6tmWPYBAH+8iSpPGvMaT5w@mail.gmail.com>
Subject: Re: [PATCH-next 19/20] gpio: gpio-omap: irq_startup() must not return
 error codes
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:13 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> The irq_startup() method returns an unsigned int, but in __irq_startup()
> it is assigned to an int.  However, nothing checks for errors, so any
> error that is returned is ignored.
>
> Remove the check for GPIO-input mode and the error return.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij

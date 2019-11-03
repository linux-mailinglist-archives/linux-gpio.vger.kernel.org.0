Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0D6EED64D
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Nov 2019 23:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfKCWn4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 17:43:56 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44484 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbfKCWn4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 17:43:56 -0500
Received: by mail-lj1-f196.google.com with SMTP id g3so9420791ljl.11
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 14:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QwvUwFFe2Yd6jXA2HFKh+X8Ezv99xWk3ozDJwYGwuVo=;
        b=dUs+Frg6iyYhPE89kfFwL3PkS2bf3P888eQVaSpTXpA6wtWHdtqODn2oOrQ25IYIoB
         9nUNpRaXe4dYk1Di3mcwi03F4k/fVH9ytYRT8FKTrfVDlHKCbtyqa75OA3T5pTin9d+e
         DdcJcODMVBZU9XqUmurNWv84PBQThSIHsg3+H+jNN5rKnkSN8WWIG+7gCNN2butYMLd0
         4PHuL6nm21ncrem6MxqGKptj0E36wIEnyRXKKWhgzTUB4mv9Un4CiTZOqYIH1lwQZQ6a
         7IJyPGxtW5WAp4IcQuduBBmlqE5xXerzXTQ/HvbuxH+KjafqMwxkwUILnvPKc5aTz425
         jRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QwvUwFFe2Yd6jXA2HFKh+X8Ezv99xWk3ozDJwYGwuVo=;
        b=aa5p6bEepuFQL8sGC5rlcmXaCpkuSmWCsCxVwmRZxRNfQy7fa39dZY06mMcf2+GN8R
         Olzgk7rYE4UMaCyB3Uxxl77BzPggAc8VLGn2dRP0tYHuRQ5821GSREpSAImDnR10vP4U
         J+n9dY61nY02pSqHYetyUO6W8dEc+Yve7gVQRjP1sJqHudDoZzOHISO1DlLtWLO8byLH
         k44uWZ8Qi2r7e28Qf1uZ0q0f1SLoy4TDdFjVndvZ2+tR2BOOgq95tKemB+puPkqYkuC9
         UaTerdZnf5JwMOhQ2l+ViG95v8LHo3IdWEcmURVvCTTMdOGo/hBhrgYWymd7OkVzNJt/
         HHLw==
X-Gm-Message-State: APjAAAXf4JZA3QrQYo93mB6Jbmw7GEXAtPZ9XNzBaTVRGunSq/E6zeb7
        6nR/Ewp321zz5pD30kCilGjAlxw/KcLJp7D3sHlkEg==
X-Google-Smtp-Source: APXvYqw9plo/5zhXuu/SFm9KkZIl7P8hhnAZ5sCXOOlGntiZuDFA5TE9D+MIAIDpDkk4cFyf4CQpwu3x/6JoHU5DZIE=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr16420438ljd.183.1572821032537;
 Sun, 03 Nov 2019 14:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20191030144940.21133-1-linus.walleij@linaro.org>
 <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com> <9d21b3fe-852b-a430-4e71-af0742edcd9b@redhat.com>
In-Reply-To: <9d21b3fe-852b-a430-4e71-af0742edcd9b@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 3 Nov 2019 23:43:40 +0100
Message-ID: <CACRpkdY_6oD4vH6zf1LGzvyS42sPe_AwAxMqOcnz4HV-qNwpeQ@mail.gmail.com>
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 5:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> So I suggest that we revert the following commits (in revert order):
>
> 4c87540940cbc7ddbe9674087919c605fd5c2ef1 "gpio: merrifield: Move hardware initialization to callback"
> 6658f87f219427ee776c498e07c878eb5cad1be2 "gpio: merrifield: Restore use of irq_base"
> 8f86a5b4ad679e4836733b47414226074eee4e4d "gpio: merrifield: Pass irqchip when adding gpiochip"

I reverted these on my fixes branch and hope we can figure our stuff out in the
v5.5 or v5.6 kernels.

Yours,
Linus Walleij

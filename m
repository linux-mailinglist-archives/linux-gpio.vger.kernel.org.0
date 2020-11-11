Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A802AF538
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgKKPlz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbgKKPly (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 10:41:54 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBAFC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 07:41:52 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id b23so937242pju.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 07:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wj13sIwRA1pufHl932qLY7J4VdwChA/eB1gNL5+Yblo=;
        b=dYgFch4JT47f5zah0T9f5AcL23HWpB3frAsZ2rAZ9jaYbKtqCNALwDb9P1SI5+7fQa
         hfHM7PwZgc0vov0tUANH5YTnKeXhdeAbWGJku8UcdrwsdzF3skFTfvZAC3zNdAlydJZr
         bgYWxPaMHsLilKLw1cEi7UrBqkILmcwNba+cQCbzNBP1Sdt8XpHMya67uU5QKPnVg9ez
         c/W4KZsuLFPpRr1tpzoTetpDdMiwbA4ry1KPI9cSzRADJ0bjqhQ+WA6UGMH3uftGnXTk
         s03eue5XXDiEWL1eI8OSVF9HvfrvjUEu6Ddnvq0zIYJZluw88Ieh0M9RNJheZ7yMFk4R
         ZJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wj13sIwRA1pufHl932qLY7J4VdwChA/eB1gNL5+Yblo=;
        b=iBp3Y0JBOicZkQcAKnrc2HSnlPlj2Lh5baKwi4MOuzz3i5YZnZEdNM8x0RDEzCpZzx
         3Nzu9a1Hh8MM6RAfVsOGo9g0KCW9ajLb+YxTQDMnOoPaQxtpNhA3q8h8lMu3yL8pQ0Wt
         rcAROYc9PsCF9GiAT+KJdC0C52FvuvPiRtD2zCog87jKJs47vw6/fQgYFpGS9xt6xDQt
         kSmdhjKxiMoLA75rOxeJOuVdt4qUQ+Rrtq5WBqRjjYQqY9jewpEDoeU5vPRQMUDM+dM0
         w9mTXYOOWSnKtb9WI0G4W2vhosz7a/0Wlgp4hR2FJnIvX5Rv+Eb1wETPEHnAqdTg/kG3
         ilUg==
X-Gm-Message-State: AOAM530dmEfYKa3kGdsZjCJeS8b8H+1Y2lCAKrw6NyJnSM+PlyMeASB1
        NCHLaSxWnRFkQHlycXFXwF5PJPx7oNRYz9b/gjY=
X-Google-Smtp-Source: ABdhPJwZOSOoZwjwN9oygpcLCNiDKCQNKb9P7U/kuTMyEX5hav1mwHu694KVoEVeZBmJU9xpSTd/T6LLR+/uWFq/yv8=
X-Received: by 2002:a17:90a:4816:: with SMTP id a22mr4564741pjh.228.1605109311880;
 Wed, 11 Nov 2020 07:41:51 -0800 (PST)
MIME-Version: 1.0
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com> <20201109205332.19592-8-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201109205332.19592-8-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Nov 2020 17:42:40 +0200
Message-ID: <CAHp75VfdRwXg6Ys=+XJe+GGOe+gqN2uvKsBPBzvwVCwKtSSGmA@mail.gmail.com>
Subject: Re: [PATCH v5 07/17] gpiolib: Extract gpio_set_config_with_argument_optional()
 helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 10:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> This function is useful for internal use in GPIO library.
> There will be new user coming, prepare a helper for the new comer
> and the existing ones.

Just to show how temporary variable is re-used here

>         enum pin_config_param mode = PIN_CONFIG_PERSIST_STATE;

> +       return gpio_set_config_with_argument_optional(desc, mode, !transitory);

Leaving constant in the parameter line will make it either long or ugly split.

-- 
With Best Regards,
Andy Shevchenko
